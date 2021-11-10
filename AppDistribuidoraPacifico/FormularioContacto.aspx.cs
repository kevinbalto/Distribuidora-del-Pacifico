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
    public partial class FormularioContacto : System.Web.UI.Page
    {
        private Contacto contacto;
        private DistribuidoraPacificoEntities entidades;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.entidades = new DistribuidoraPacificoEntities();
        }

        protected void btnEnviarMensaje_Click(object sender, EventArgs e)
        {
            try
            {
                this.contacto = new Contacto();

                this.contacto.cedula = this.txtCedula.Text.Trim();
                this.contacto.nombreCompleto = this.txtNombreCompleto.Text.Trim();
                this.contacto.email = this.txtEmail.Text.Trim();
                this.contacto.asunto = this.txtAsunto.Text.Trim();

                this.registroContacto(contacto);

                Response.Redirect("Default.aspx");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void registroContacto(Contacto contacto)
        {
            try
            {
                TblContactos tblContactos = new TblContactos();

                tblContactos.cedula = contacto.cedula;
                tblContactos.nombreCompleto = contacto.nombreCompleto;
                tblContactos.Email = contacto.email;
                tblContactos.Asunto = contacto.asunto;

                this.entidades.TblContactos.Add(tblContactos);
                this.entidades.SaveChanges();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}