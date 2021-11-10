using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BLL;
using DAL;

using iTextSharp.text;
using iTextSharp.text.pdf;
using System.IO;

namespace AppDistribuidoraPacifico
{
    public partial class RegistroProductos : System.Web.UI.Page
    {
        private Producto producto;
        private ProductoProvedor productoProvedor;
        private DistribuidoraPacificoEntities entities;
        private Reporte reporte;
        private string codBarra;
        public string funtion = "R";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    String rol = Session["Rol"].ToString();
                    if (!rol.Equals("Admin"))
                    {
                        Response.Redirect("Default.aspx");
                        Response.Write("<script language='Javascript'> alert ('Usuario no tiene permiso para acceder.')</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                this.mensaje("Ups, Hubo un error!");
            }
            if (Request.QueryString["accion"] != null)
            {
                //toma la funcion que va a realizar el formulario
                this.funtion = Request.QueryString["accion"];
            }
            if (Request.QueryString["codBarras"] != null)
            {
                //se guarda la serie de la moto este valor se toma de la url
                this.codBarra = Request.QueryString["codBarras"];
            }
            this.entities = new DistribuidoraPacificoEntities();
            if (!IsPostBack)
            {
                this.cargarProvedores();
                this.consultar(this.codBarra);
            }
            switch (this.funtion)
            {
                case "R":
                    this.btnRegistrarProducto.Text = "Registrar";
                    break;
                case "M":
                    this.btnRegistrarProducto.Text = "Guardar Cambios";
                    this.estadoEntradaDatos(true);
                    break;
                case "E":
                    this.btnRegistrarProducto.Text = "Eliminar Elemento";
                    this.estadoEntradaDatos(false);
                    break;
            }
        }

        protected void btnRegistrarProducto_Click(object sender, EventArgs e)
        {

            try
            {
                //llenar datos producto
                this.producto = new Producto();

                this.producto.codigoBarra = this.txtCodigoBarra.Text.Trim();
                this.producto.descripcion = this.txtDescripcion.Text.Trim();
                this.producto.clasificacion = this.txtClasificacion.SelectedValue;
                this.producto.cedulaLegal = this.ddlProvedor.SelectedValue;
                this.producto.precioCompra = Double.Parse(this.txtPrecioCompra.Text.Trim());
                this.producto.cantidad = int.Parse(this.txtCantidad.Text.Trim());
                this.producto.estado = Convert.ToBoolean(this.rdEstado.SelectedItem.Value.ToString());
                this.producto.exento = Convert.ToBoolean(this.rdExento.SelectedItem.Value.ToString());
                this.producto.porcentajeIV = Double.Parse(this.txtPorcentajeValorA.Text.Trim()) / 100;
                this.producto.porcentajeIVA = Double.Parse(this.txtPorcentajeIVA.Text.Trim()) / 100;
                this.producto.unidadMedida = this.txtUnidadMedida.SelectedValue.ToString();
                this.producto.precioImpuestoIncluido = ((this.producto.porcentajeIV + this.producto.porcentajeIVA) * this.producto.precioCompra
                    ) + this.producto.precioCompra;
                //llenar datos provedorProducto
                this.productoProvedor = new ProductoProvedor();

                this.productoProvedor.codigoBarra = this.producto.codigoBarra;
                this.productoProvedor.cedulaLegal = this.producto.cedulaLegal;

                if (this.fileUpload.HasFile)
                {
                    this.subirFoto(this.producto.codigoBarra, this.fileUpload.PostedFile);
                    this.producto.foto = this.producto.codigoBarra + "_" + this.fileUpload.FileName;
                }
                switch (this.funtion)
                {
                    case "R":
                        this.registrarProducto(producto, productoProvedor);
                        
                        break;
                    case "M":
                        this.modificar(producto, productoProvedor);
                        if (this.fileUpload.HasFile)
                        {
                            this.subirFoto(this.producto.codigoBarra, this.fileUpload.PostedFile);
                        }
                        break;

                    case "E":
                        this.eliminar(producto.codigoBarra);
                        break;
                }
                this.limpiarPantalla();
            }
            catch (Exception)
            {
                this.mensaje("Error de existencia!");
            }

        }

        public void registrarProducto(Producto producto, ProductoProvedor productoProvedor)
        {
            try
            {
                //llenar bd TblProducto
                TblProducto tblProducto = new TblProducto();

                tblProducto.codBarras = producto.codigoBarra;
                tblProducto.clasificacion = producto.clasificacion;
                tblProducto.descripcion = producto.descripcion;
                tblProducto.precioCompra = (decimal)producto.precioCompra;
                tblProducto.porcentajeIV = (decimal)producto.porcentajeIV;
                tblProducto.porcentajeIVA = (decimal)producto.porcentajeIVA;
                tblProducto.cantidad = producto.cantidad;
                tblProducto.precioImpuestoIncluido = (decimal)producto.precioImpuestoIncluido;
                tblProducto.exento = producto.exento;
                tblProducto.unidadMedida = producto.unidadMedida;
                tblProducto.estado = producto.estado;
                tblProducto.foto = producto.foto;

                this.entities.TblProducto.Add(tblProducto);

                //llenar TblProductoProvedor
                TblProductosProveedor tblProductosProveedor = new TblProductosProveedor();

                tblProductosProveedor.codBarras = productoProvedor.codigoBarra;
                tblProductosProveedor.cedLegal = productoProvedor.cedulaLegal;

                this.entities.TblProductosProveedor.Add(tblProductosProveedor);
                this.entities.SaveChanges();
                this.mensaje("Datos guardados correctamente");
            }
            catch (Exception)
            {
                this.mensaje("El producto ya existe");
            }

        }

        public void cargarProvedores()
        {
            this.ddlProvedor.DataSource = conexion("select nombreComercial, cedLegal from TblProveedores");
            this.ddlProvedor.DataTextField = "nombreComercial";
            this.ddlProvedor.DataValueField = "cedLegal";
            this.ddlProvedor.DataBind();
            this.ddlProvedor.Items.Insert(0, new System.Web.UI.WebControls.ListItem("[Seleccionar]", "0"));
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

        private void subirFoto(string pCodBarras, HttpPostedFile archivo)
        {
            try
            {
                string ruta = Server.MapPath(".") + @"\Productos\" + pCodBarras + "_" + archivo.FileName;
                this.fileUpload.SaveAs(ruta);
            }
            catch (Exception)
            {
                this.mensaje("Ups, Hubo un error!");
            }
        }

        private void consultar(string pCodBarras)
        {
            try
            {
                TblProducto tblProducto = this.entities.TblProducto.FirstOrDefault(u => u.codBarras == pCodBarras);
                TblProductosProveedor tblProductosProveedor = this.entities.TblProductosProveedor.FirstOrDefault(u => u.codBarras == pCodBarras);
                if (tblProducto != null)
                {
                    this.txtCodigoBarra.Text = tblProducto.codBarras;
                    this.txtClasificacion.SelectedValue = tblProducto.clasificacion.ToString();
                    this.ddlProvedor.SelectedValue = tblProductosProveedor.cedLegal.ToString();
                    this.txtDescripcion.Text = tblProducto.descripcion.ToString();
                    this.txtPrecioCompra.Text = tblProducto.precioCompra.ToString();
                    this.txtCantidad.Text = tblProducto.cantidad.ToString();
                    this.txtPorcentajeIVA.Text = (tblProducto.porcentajeIVA * 100).ToString("0");
                    this.txtPorcentajeValorA.Text = (tblProducto.porcentajeIV * 100).ToString("0"); ;
                    this.rdExento.SelectedValue = tblProducto.exento.ToString();
                    this.txtUnidadMedida.SelectedValue = tblProducto.unidadMedida.ToString();
                    this.rdEstado.SelectedValue = tblProducto.estado.ToString();
                }

            }
            catch (Exception ex)
            {
                this.mensaje("Ups, Hubo un error!");
            }
        }

        private void mensaje(string texto)
        {
            Response.Write("<script type='text/javascript'> alert('" + texto + "');</script>");
        }

        private void limpiarPantalla()
        {
            this.txtCodigoBarra.Text = "";
            this.txtClasificacion.Text = "";
            this.ddlProvedor.SelectedValue = "0";
            this.txtDescripcion.Text = "";
            this.txtPrecioCompra.Text = "";
            this.txtCantidad.Text = "";
            this.txtPorcentajeIVA.Text = "";
            this.txtPorcentajeValorA.Text = "";
            this.rdExento.ClearSelection();
            this.txtUnidadMedida.SelectedValue = "";
            this.rdEstado.ClearSelection();
        }
        private void estadoEntradaDatos(bool estado)
        {
            this.txtCodigoBarra.Enabled = false;
            this.txtClasificacion.Enabled = true;
            this.ddlProvedor.Enabled = true;
            this.txtDescripcion.Enabled = true;
            this.txtPrecioCompra.Enabled = true;
            this.txtCantidad.Enabled = true;
            this.txtPorcentajeIVA.Enabled = true;
            this.txtPorcentajeValorA.Enabled = true;
            this.rdExento.Enabled = true;
            this.txtUnidadMedida.Enabled = true;
            this.rdEstado.Enabled = true;
            this.fileUpload.Enabled = estado;
        }
        private void modificar(Producto producto, ProductoProvedor productoProvedor)
        {
            try
            {
                TblProducto tblProducto = this.entities.TblProducto.FirstOrDefault(c => (c.codBarras.Equals(producto.codigoBarra)));
                TblProductosProveedor tblProductosProveedor = this.entities.TblProductosProveedor.FirstOrDefault(c => (c.codBarras.Equals(productoProvedor.codigoBarra)));
                if (tblProducto != null & tblProductosProveedor != null)
                {
                    tblProducto.codBarras = producto.codigoBarra;
                    tblProducto.clasificacion = producto.clasificacion;
                    tblProducto.descripcion = producto.descripcion;
                    tblProducto.precioCompra = (decimal)producto.precioCompra;
                    tblProducto.porcentajeIV = (decimal)producto.porcentajeIV;
                    tblProducto.porcentajeIVA = (decimal)producto.porcentajeIVA;
                    tblProducto.cantidad = producto.cantidad;
                    tblProducto.precioImpuestoIncluido = (decimal)producto.precioImpuestoIncluido;
                    tblProducto.exento = producto.exento;
                    tblProducto.unidadMedida = producto.unidadMedida;
                    tblProducto.estado = producto.estado;
                    tblProducto.foto = producto.foto;

                    tblProductosProveedor.codBarras = productoProvedor.codigoBarra;
                    tblProductosProveedor.cedLegal = productoProvedor.cedulaLegal;

                    this.entities.SaveChanges();
                    this.mensaje("Datos actualizados correctamente");
                }
            }
            catch (Exception ex)
            {
                this.mensaje("Ups, Hubo un error!");
            }
        }

        private void eliminar(string codBarras)
        {
            try
            {
                TblProducto tblProducto = this.entities.TblProducto.FirstOrDefault(c => (c.codBarras.Equals(producto.codigoBarra)));
                TblProductosProveedor tblProductosProveedor = this.entities.TblProductosProveedor.FirstOrDefault(c => (c.codBarras.Equals(productoProvedor.codigoBarra)));

                this.entities.TblProductosProveedor.Remove(tblProductosProveedor);
                this.entities.TblProducto.Remove(tblProducto);

                this.entities.SaveChanges();
                this.mensaje("Datos eliminados correctamente");
            }
            catch (Exception ex)
            {
                this.mensaje("Ups, Hubo un error!");
            }
        }

    }
}
