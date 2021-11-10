using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BLL;

namespace AppDistribuidoraPacifico
{
    public partial class Carrito : System.Web.UI.Page
    {
        public List<CarritoCompra> productosCarrito;
        DataTable productos;
        private double precio, subT;
        private string codigoBarra;
        double descuento, montoD;
        int cont, cantidad;
        protected void Page_Load(object sender, EventArgs e)
        {

            this.mostrarCarrito();


        }

        public void mostrarCarrito()
        {
            productos = new DataTable("Productos");
            //creacion de las tablas
            productos.Columns.Add(new DataColumn("codigoBarra", typeof(string)));
            productos.Columns.Add(new DataColumn("descripcion", typeof(string)));
            productos.Columns.Add(new DataColumn("cantidad", typeof(string)));
            productos.Columns.Add(new DataColumn("precio", typeof(string)));
            productos.Columns.Add(new DataColumn("id", typeof(string)));
            productosCarrito = (List<CarritoCompra>)Session["ProductosCarrito"];
            if (productosCarrito != null)
            {
                for (int i = 0; i < productosCarrito.Count; i++)
                {
                    DataRow row = productos.NewRow();
                    row["id"] = i;
                    row["codigoBarra"] = productosCarrito[i].codigoBarra;
                    row["descripcion"] = productosCarrito[i].descripcion;
                    row["cantidad"] = productosCarrito[i].cantidad;
                    row["precio"] = productosCarrito[i].precio;

                    precio = productosCarrito[i].precio;
                    cantidad = productosCarrito[i].cantidad;

                    subT += precio * cantidad;
                    lblSubTotal.Text = subT + "";
                    productos.Rows.Add(row);
                    dtsProducto.DataSource = productos;
                    dtsProducto.DataBind();
                    codigoBarra = productosCarrito[i].codigoBarra;
                    cont++;
                }
            }


        }

        public void eliminar(string id)
        {
            productosCarrito.Remove(productosCarrito[int.Parse(id)]);
            if (productosCarrito.Count == 0)
            {
                Session["ProductosCarrito"] = null;
                Response.Redirect("Carrito.aspx");
            }
        }

        protected void dtsProducto_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id;
            id = dtsProducto.DataKeys[e.RowIndex].Value.ToString();

            if (Session["ProductosCarrito"] != null)
            {
                DataTable dt = new DataTable();
                dt.Clear();
                dt = productos as DataTable;

                DataRow row = dt.AsEnumerable().FirstOrDefault(x => x["id"].Equals(id));

                if (row != null)
                {
                    dt.Rows.Remove(row);
                    eliminar(id);
                    productos = dt;

                    dtsProducto.DataSource = dt;
                    dtsProducto.DataBind();

                }
            }



        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            var items = (List<CarritoCompra>)Session["ProductosCarrito"];
            int cantidad;
            double precio, subtotal = 0, total = 0;
            string descripcion;
            for (int i = 1; i < this.dtsProducto.Rows.Count; i++)
            {
                descripcion = dtsProducto.Rows[i - 1].Cells[1].Text;
                cantidad = Int16.Parse(((TextBox)dtsProducto.Rows[i - 1].Cells[2].FindControl("txtCantidad")).Text);
                precio = Double.Parse(dtsProducto.Rows[i - 1].Cells[3].Text);
                subtotal = cantidad * precio;

                items[i - 1].cantidad = cantidad;
                (((TextBox)dtsProducto.Rows[i - 1].Cells[2].FindControl("txtCantidad")).Text) = cantidad.ToString();

                total = subtotal + total;
            }
            this.mostrarCarrito();
        }

        public void calcularSubTotal()
        {

        }
        protected void btnConfirmarCompra_Click(object sender, EventArgs e)
        {

            if (Session["ProductosCarrito"] != null)
            {
                Response.Redirect("VerFactura.aspx");
            }
            {
                this.mensaje("No se puede realizar la compra, el carrito de compra se encuentra vacio");
            }

        }

        private void mensaje(string texto)
        {
            Response.Write("<script type='text/javascript'> alert('" + texto + "');</script>");
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Session.Remove("ProductosCarrito");
            Response.Redirect("Default.aspx");
        }

    }
}