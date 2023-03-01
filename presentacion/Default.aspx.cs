using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;
using Dominio;
using Helper;
using System.Threading;

namespace presentacion
{
    public partial class Default : System.Web.UI.Page
    {
        public List<Disco> ListaDisco { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!(IsPostBack))
                {
                       DiscosNegocio negocio = new DiscosNegocio();
                    //ListaDisco = negocio.listarConSp();
                    Repeater1.DataSource = negocio.listarConSp();
                    DataBind();
                }
                
            }
            catch (Exception ex)
            {

                if (!(ex.GetType() == typeof(ThreadAbortException)))
                {
                    Session.Add("error", Seguridad.mensajeError(ex));
                    Response.Redirect("error.aspx");
                }
            }
        }

        protected void btnComprar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Detalle.aspx");
        }

        protected void btnDescripcion_Click(object sender, EventArgs e)
        {
            Response.Redirect("Detalle.aspx");
        }

        protected void btnFavorito_Click(object sender, EventArgs e)
        {
            string id = ((Button)sender).CommandArgument;
        }
        private void Page_Error(object sender, EventArgs e)
        {
            Exception exc = Server.GetLastError();

            Session.Add("error", Seguridad.mensajeError(exc));
            Server.Transfer("error.aspx");

        }
    }
}