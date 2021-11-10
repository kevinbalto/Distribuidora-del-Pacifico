using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BLL;

namespace AppDistribuidoraPacifico
{
    public partial class LineaBlanca : System.Web.UI.Page
    {

        private List<CarritoCompra> productosCarrito;
        private CarritoCompra carrito;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lBlanca_ItemCommand(object source, DataListCommandEventArgs e)
        {

            try
            {
                if (e.CommandName.Equals("anadir"))
                {
                    int indiceItem = Convert.ToInt32(e.CommandArgument);

                    DataListItem item = this.lBlanca.Items[indiceItem];

                    Label codigoBarra = (Label)item.FindControl("codBarra");
                    Label descripcion = (Label)item.FindControl("descripcion");
                    Label precio = (Label)item.FindControl("precio");

                    this.carrito = new CarritoCompra();

                    carrito.codigoBarra = codigoBarra.Text;
                    carrito.descripcion = descripcion.Text;
                    carrito.precio = double.Parse(precio.Text);
                    carrito.cantidad = 1;

                    if (Session["ProductosCarrito"] != null)
                    {
                        productosCarrito = (List<CarritoCompra>)Session["ProductosCarrito"];
                        for (int i = 0; i < productosCarrito.Count; i++)
                        {
                            if (productosCarrito[i].codigoBarra.Equals(carrito.codigoBarra))
                            {
                                Response.Redirect("Carrito.aspx");
                                break;
                            }
                            else
                            {
                                productosCarrito.Add(carrito);
                                break;
                            }
                        }
                    }
                    else
                    {
                        productosCarrito = new List<CarritoCompra>();
                        productosCarrito.Add(carrito);
                    }

                    Session["ProductosCarrito"] = productosCarrito;

                }
                if (e.CommandName.Equals("modificar"))
                {
                    int indiceItem = Convert.ToInt32(e.CommandArgument);
                    DataListItem item = this.lBlanca.Items[indiceItem];
                    Label codBarras = (Label)item.FindControl("codBarra");
                    Response.Redirect("RegistroProductos.aspx?accion=M&codBarras=" + codBarras.Text.Trim());
                }
                if (e.CommandName.Equals("eliminar"))
                {
                    int indiceItem = Convert.ToInt32(e.CommandArgument);
                    DataListItem item = this.lBlanca.Items[indiceItem];
                    Label codBarras = (Label)item.FindControl("codBarra");
                    Response.Redirect("RegistroProductos.aspx?accion=E&codBarras=" + codBarras.Text.Trim());
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}