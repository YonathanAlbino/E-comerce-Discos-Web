using Dominio;
using Helper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace presentacion
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(Page is Default || Page is Contacto || Page is error))
            {
                if (!(Seguridad.sesionActiva(Session["usuario"])))
                    Response.Redirect("Loguin.aspx");
            }

            if (Seguridad.sesionActiva(Session["usuario"]))
            {
                lblUser.Text = ((Usuario)Session["usuario"]).Email;

                if (((Usuario)Session["usuario"]).ImagenPerfil != null)
                    imagenAvatar.ImageUrl = Seguridad.refrescarImagen(((Usuario)Session["usuario"]).ImagenPerfil);
                else
                    imagenAvatar.ImageUrl = "http://www.losolivosbogota.com/sites/salas/pqrs/imagenes/sin_imagen.png";
            }
        }

        protected void btnDesconecarse_Click(object sender, EventArgs e)
        {
            if (Session["usuario"] != null)
            {
                Session.Clear();
                Response.Redirect("Default.aspx");
            }
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Loguin.aspx");
        }

        protected void btnRegistrate_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registro.aspx");
        }
        private void Page_Error(object sender, EventArgs e)
        {
            Exception exc = Server.GetLastError();

            Session.Add("error", Seguridad.mensajeError(exc));
            Server.Transfer("error.aspx");

        }
    }
}