using Helper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Servicios;

namespace presentacion
{
    public partial class Contacto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            try
            {
                Email email = new Email();

                email.armarCorreo(txtEmail.Text, txtAsunto.Text, txtCuerpo.Text, txtNombre.Text, txtApellido.Text);
                email.enviarEmail();
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
        private void Page_Error(object sender, EventArgs e)
        {
            Exception exc = Server.GetLastError();

            Session.Add("error", Seguridad.mensajeError(exc));
            Server.Transfer("error.aspx");

        }
    }
}