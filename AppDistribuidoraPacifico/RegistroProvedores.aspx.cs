using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BLL;
using DAL;
namespace AppDistribuidoraPacifico
{
    public partial class RegistroProvedores : System.Web.UI.Page
    {
        private Provedor provedor;
        private DistribuidoraPacificoEntities entidades;
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
            this.entidades = new DistribuidoraPacificoEntities();
        }

        protected void btnRegistrarProvedor_Click(object sender, EventArgs e)
        {
            try
            {
                this.provedor = new Provedor();

                this.provedor.cedulaLegal = this.txtCedulaLegal.Text.Trim();
                this.provedor.nombreComercial = this.txtNombreComercial.Text.Trim();
                this.provedor.telefono = this.txtTelefono.Text.Trim();
                this.provedor.direccion = this.txtDireccion.Text.Trim();
                this.provedor.contacto = this.txtContacto.Text.Trim();
                this.provedor.email = this.txtEmail.Text.Trim();

                this.registrarProvedor(provedor);

                this.mensaje("Datos guardados de forma correcta.");

            }
            catch (Exception ex)
            {
                this.mensaje("Ups, Hubo un error!");
            }
        }

        public void registrarProvedor(Provedor provedor)
        {
            try
            {
                TblProveedores tblProveedores = new TblProveedores();

                tblProveedores.cedLegal = provedor.cedulaLegal;
                tblProveedores.nombreComercial = provedor.nombreComercial;
                tblProveedores.telefono = provedor.telefono;
                tblProveedores.direccionExacta = provedor.direccion;
                tblProveedores.contacto = provedor.contacto;
                tblProveedores.email = provedor.email;

                this.entidades.TblProveedores.Add(tblProveedores);
                this.entidades.SaveChanges();

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
    }
}