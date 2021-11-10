using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AppDistribuidoraPacifico.cr.fi.bccr.gee;
using BLL;

namespace AppDistribuidoraPacifico
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {

        private wsindicadoreseconomicos wsindicadoreseconomicos = null;
        private DataSet datos;

    

        protected void Page_Load(object sender, EventArgs e)
        {
            this.obtenerTipoCambio();
        }

        private void obtenerTipoCambio()
        {
            try
            {
                this.wsindicadoreseconomicos = new wsindicadoreseconomicos();
                this.datos = this.wsindicadoreseconomicos.ObtenerIndicadoresEconomicos("318",
                    DateTime.Now.ToString("dd/MM/yyyy"), DateTime.Now.ToString("dd/MM/yyyy"),
                    "Kevin Baltodano", "N", "kbaltodanoch10@gmail.com", "0OLK120C3A");
                Session["tipoCambio"] = Decimal.Parse(this.datos.Tables[0].Rows[0][2].ToString());
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


    }
}