using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using DAL;
using System.Web.Security;
using System.Drawing;
using System.Text;
using System.Security.Cryptography;

namespace AppDistribuidoraPacifico
{
    public partial class Login : System.Web.UI.Page
    {
        private DistribuidoraPacificoEntities entities;
        private string key = "jwey89e09ewhfo24";
        protected void Page_Load(object sender, EventArgs e)
        {
            this.entities = new DistribuidoraPacificoEntities();
            if (IsPostBack)
            {
                this.txtEmail.BorderColor = Color.Empty;
                this.txtContrasenna.BorderColor = Color.Empty;
            }
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        private string validarPerfil(string pEmail, string pw)
        {
            try
            {
                string autorizado = "";

                TblUsuarios tblUsuarios = this.entities.TblUsuarios.FirstOrDefault(
                    u => (u.email.Equals(pEmail) & u.contrasenna.Equals(pw)));
                TblUsuarios tblUsuarioRol = this.entities.TblUsuarios.FirstOrDefault((
                    u => (u.email.Equals(pEmail) & u.idRol.Equals("2"))));
                if (tblUsuarios != null)
                {
                    autorizado = tblUsuarios.nombreCompleto;
                    if (tblUsuarioRol != null)
                    {
                        Session["Rol"] = "Cliente";
                    }
                    else
                    {
                        Session["Rol"] = "Admin";
                    }
                }
                return autorizado;

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            try
            {
                this.txtEmail.BorderColor = Color.Empty;
                this.txtContrasenna.BorderColor = Color.Empty;
                if (this.txtEmail.Text.Trim().Equals("") && this.txtContrasenna.Text.Trim().Equals(""))
                {
                    this.txtEmail.BorderColor = Color.Red;
                    this.txtContrasenna.BorderColor = Color.Red;
                }
                else if (this.txtEmail.Text.Trim().Equals(""))
                {
                    this.txtEmail.BorderColor = Color.Red;
                }
                else if (this.txtContrasenna.Text.Trim().Equals(""))
                {
                    this.txtContrasenna.BorderColor = Color.Red;
                }
                else
                {
                    string nombrePerfil = this.validarPerfil(this.txtEmail.Text.Trim(), this.encriptar(this.txtContrasenna.Text.Trim(), key));
                    if (!nombrePerfil.Equals(""))
                    {
                        FormsAuthentication.SetAuthCookie(nombrePerfil, false);
                        Session["usuarioActual"] = this.txtEmail.Text.Trim();
                        Response.Redirect("Default.aspx");
                    }
                    else
                    {
                        Response.Write("<script language='Javascript'> alert ('Usuario o password incorrecto.')</script>");
                    }
                }


            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public string encriptar(string cadena, string key)
        {
            byte[] keyArray;
            byte[] encriptar = Encoding.UTF8.GetBytes(cadena);

            keyArray = Encoding.UTF8.GetBytes(key);

            var tdes = new TripleDESCryptoServiceProvider();
            tdes.Key = keyArray;
            tdes.Mode = CipherMode.ECB;
            tdes.Padding = PaddingMode.PKCS7;

            ICryptoTransform cryptoTransform = tdes.CreateEncryptor();
            byte[] resultado = cryptoTransform.TransformFinalBlock(encriptar, 0, encriptar.Length);
            tdes.Clear();

            return Convert.ToBase64String(resultado, 0, resultado.Length);
        }
    }
}