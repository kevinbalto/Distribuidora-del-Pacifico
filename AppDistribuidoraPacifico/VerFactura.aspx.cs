using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using DAL;

namespace AppDistribuidoraPacifico
{
    public partial class VerFactura : System.Web.UI.Page
    {
        public List<CarritoCompra> productosCarrito;
        DataTable productos;
        private double precio, subT;
        private string codigoBarra;
        int cont, cantidad;
        String usuarioActual;
        string nombreCompleto;

        private Factura factura;
        private FacturaDetalle facturaDetalle;
        private DistribuidoraPacificoEntities entities;

        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime fecha = DateTime.Now;
            lFecha.Text = fecha + "";
            this.entities = new DistribuidoraPacificoEntities();
            this.usuarioActual = (string)Session["usuarioActual"];
            this.Consultar(usuarioActual);
            if (!IsPostBack)
            {
                llenarCarrito();
            }

            try
            {
                if (!HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    Response.Redirect("Login.aspx");
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void llenarCarrito()
        {
            productos = new DataTable("Productos");
            //creacion de las tablas
            productos.Columns.Add(new DataColumn("codigoBarra", typeof(string)));
            productos.Columns.Add(new DataColumn("descripcion", typeof(string)));
            productos.Columns.Add(new DataColumn("cantidad", typeof(string)));
            productos.Columns.Add(new DataColumn("precio", typeof(string)));
            productosCarrito = (List<CarritoCompra>)Session["ProductosCarrito"];
            if (productosCarrito != null)
            {
                for (int i = 0; i < productosCarrito.Count; i++)
                {
                    DataRow row = productos.NewRow();
                    row["codigoBarra"] = productosCarrito[i].codigoBarra;
                    row["descripcion"] = productosCarrito[i].descripcion;
                    row["cantidad"] = productosCarrito[i].cantidad;
                    row["precio"] = productosCarrito[i].precio;

                    precio = productosCarrito[i].precio;
                    cantidad = productosCarrito[i].cantidad;

                    productos.Rows.Add(row);

                    double descuento = 0.0;
                    double montoD = 0.0;


                    subT += precio * cantidad;
                    lblSubTotal.Text = subT + "";

                    lblDescuento.Text = descuento + "";
                    lblTotal.Text = subT - montoD + "";



                    dtsProducto.DataSource = productos;
                    dtsProducto.DataBind();
                    codigoBarra = productosCarrito[i].codigoBarra;
                    cont++;

                }
            }
        }

        protected void btnFinalizar_Click(object sender, EventArgs e)
        {

            this.factura = new Factura();
            this.factura.cedulaCliente = this.txtCedula.Text.Trim();
            this.factura.totalPagar = Double.Parse(this.lblTotal.Text.Trim());
            this.factura.descuento = Double.Parse(this.lblDescuento.Text.Trim());
            this.factura.formaPago = this.txtFormaPago.SelectedValue;
            this.factura.informacionPago = Double.Parse(this.txtInformacionPago.Text.Trim());

            this.registrarFactura(this.factura);

            int cont = 1;
            foreach (GridViewRow gr in dtsProducto.Rows)
            {

                this.facturaDetalle = new FacturaDetalle();
                this.facturaDetalle.codigoDetalle = cont;
                this.facturaDetalle.codigoFactura = this.factura.codigoFactura.ToString();
                this.facturaDetalle.codigoProducto = gr.Cells[0].Text;
                this.facturaDetalle.cantidad = Int32.Parse(gr.Cells[2].Text);
                this.facturaDetalle.precio = Int32.Parse(gr.Cells[3].Text);
                this.facturaDetalle.subTotal = Decimal.Parse(this.lblSubTotal.Text);
                this.registrarDetalle(facturaDetalle);
                cont++;
            }

            this.entities.SaveChanges();
            this.crearPDF(this.factura, this.facturaDetalle, this.factura.cedulaCliente);
            Session.Remove("ProductosCarrito");
            Response.Redirect("Default.aspx");
        }

        public void registrarFactura(Factura factura)
        {
            TblFactura tblFactura = new TblFactura();
            tblFactura.cedulaCliente = factura.cedulaCliente;
            tblFactura.TotalPagar = Decimal.Parse(factura.totalPagar + "");
            tblFactura.formaPago = factura.formaPago;
            tblFactura.informacionPago = Decimal.Parse(factura.informacionPago + "");
            tblFactura.descuento = Decimal.Parse(factura.descuento + "");

            this.entities.TblFactura.Add(tblFactura);
        }


        public void registrarDetalle(FacturaDetalle detalle)
        {
            TblDetalleFactura tblDetalleFactura = new TblDetalleFactura();
            tblDetalleFactura.codigoDetalle = detalle.codigoDetalle;
            tblDetalleFactura.codigoFactura = Int32.Parse(detalle.codigoFactura);
            tblDetalleFactura.codigoProducto = detalle.codigoProducto;
            tblDetalleFactura.cantidad = detalle.cantidad;
            tblDetalleFactura.precio = Decimal.Parse(detalle.precio + "");
            tblDetalleFactura.subTotal = detalle.subTotal;
            this.entities.TblDetalleFactura.Add(tblDetalleFactura);
        }


        public void Consultar(string email)
        {
            try
            {
                TblUsuarios tblUsuarios = this.entities.TblUsuarios.FirstOrDefault(u => u.email == email);
                if (tblUsuarios != null)
                {
                    nombreCompleto = tblUsuarios.nombreCompleto.ToString();
                    this.txtCedula.Text = tblUsuarios.cedula.ToString();
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        public DataSet conexion(string strSQL)
        {
            string strConexion = "data source=KEILYN\\SQLEXPRESS;initial catalog=DistribuidoraPacifico;persist security info=True;user id=userProyecto;password=ucr2020;MultipleActiveResultSets=True;App=EntityFramework";
            SqlConnection conexion = new SqlConnection(strConexion);
            conexion.Open();
            SqlCommand command = new SqlCommand(strSQL, conexion);
            SqlDataAdapter dataAdap = new SqlDataAdapter(command);
            DataSet dataSet = new DataSet();
            dataAdap.Fill(dataSet);
            conexion.Close();
            return dataSet;
        }

        private void crearPDF(Factura fac, FacturaDetalle temp, string pBarra)
        {
            try
            {
                Reporte reporte = new Reporte();
                // Indicamos donde vamos a guardar el 
                string email = Session["usuarioActual"].ToString();
                string path = Server.MapPath(".") + @"\Reportes\" + pBarra + ".pdf";
                string imagepath = Server.MapPath(".") + @"/www/css/img/LogoDistribuciones2.png";
                Decimal precioDolar = Int32.Parse(lblTotal.Text.Trim()) / (Decimal)Session["tipoCambio"];
                reporte.CrearPDF(fac, temp, path, imagepath, email, nombreCompleto, precioDolar);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Session.Remove("ProductosCarrito");
            Response.Redirect("Default.aspx");
        }

        //public void descuento()
        //{
        //    //descuentos
        //    if (i >= 3 & i <= 7)
        //    {
        //        descuento = 0.15;
        //        montoD = (subT * descuento);
        //        break;
        //    }
        //    else
        //    {
        //        if (i >= 7 & i <= 10)
        //        {
        //            descuento = 0.20;
        //            montoD = (subT * descuento);
        //            break;
        //        }
        //        else if (i > 13)
        //        {
        //            descuento = 0.25;
        //            montoD = (subT * descuento);
        //            break;
        //        }

        //    }
        //}

    }
}