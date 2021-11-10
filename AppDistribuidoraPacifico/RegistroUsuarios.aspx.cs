using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BLL;
using DAL;

namespace AppDistribuidoraPacifico
{
    public partial class RegistroUsuarios : System.Web.UI.Page
    {
        private Usuario usuario;
        private DistribuidoraPacificoEntities entidades;
        private string key = "jwey89e09ewhfo24";
        protected void Page_Load(object sender, EventArgs e)
        {
            this.entidades = new DistribuidoraPacificoEntities();
        }

        protected void btnRegistrarUsuario_Click(object sender, EventArgs e)
        {
            try
            {
                this.usuario = new Usuario();
                string contrasenna = "";
                string validarContrasenna = "";

                this.usuario.cedula = this.txtCedula.Text.Trim();
                this.usuario.tipoIdentificacion = this.txtTipoIdentificacion.SelectedValue;
                this.usuario.nombreCompleto = this.txtNombreCompleto.Text.Trim();
                this.usuario.direccion = this.txtDireccion.Text.Trim();
                this.usuario.email = this.txtEmail.Text.Trim();
                contrasenna = this.txtContrasenna.Text.Trim();
                validarContrasenna = this.txtValidarContrasenna.Text.Trim();
                this.usuario.telefono = this.txtTelefono.Text.Trim();
                this.usuario.tipoUsuario = "2";

                if (contrasenna == validarContrasenna)
                {
                    this.usuario.contrasenna = this.encriptar(contrasenna, key);
                    this.registrarUsuario(usuario);
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    Response.Write("<script language='Javascript'> alert ('Las contraseñas no coinciden.')</script>");
                    this.txtContrasenna.BorderColor = Color.Red;
                    this.txtValidarContrasenna.BorderColor = Color.Red;
                }
            }
            catch (Exception ex)
            {
                this.mensaje("Ups, Hubo un error!");
            }
        }

        public void registrarUsuario(Usuario usuario)
        {
            try
            {
                TblUsuarios tblUsuarios = new TblUsuarios();

                tblUsuarios.cedula = usuario.cedula;
                tblUsuarios.tipoIdentificacion = usuario.tipoIdentificacion;
                tblUsuarios.nombreCompleto = usuario.nombreCompleto;
                tblUsuarios.direccion = usuario.direccion;
                tblUsuarios.email = usuario.email;
                tblUsuarios.telefono = usuario.telefono;
                tblUsuarios.contrasenna = usuario.contrasenna;
                tblUsuarios.idRol = usuario.tipoUsuario;

                this.entidades.TblUsuarios.Add(tblUsuarios);
                this.entidades.SaveChanges();
            }
            catch (Exception ex)
            {
                this.mensaje("Ups, Hubo un error!");
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

        private void mensaje(string texto)
        {
            Response.Write("<script type='text/javascript'> alert('" + texto + "');</script>");
        }
        
    }
}