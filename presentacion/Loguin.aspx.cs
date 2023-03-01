using Dominio;
using Helper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;
using Helper;

namespace presentacion
{
    public partial class Loguin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Seguridad.sesionActiva(Session["usuario"]))
            {
                Response.Redirect("default.aspx");
            }
        }

        protected void btnIniciarSesion_Click(object sender, EventArgs e)
        {
            Usuario usuario = new Usuario();
            UsuarioNegocio negocio = new UsuarioNegocio();
            try
            {
                if(validaciones.textoVacio(txtEmail) || validaciones.textoVacio(txtContraseña))
                {
                    Session.Add("error", "Campos vacios");
                    Response.Redirect("error.aspx");
                }

                usuario.Email = txtEmail.Text;
                usuario.Pass = txtContraseña.Text;

                if (negocio.Loguin(usuario))
                {
                    Session.Add("usuario", usuario);
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    Session.Add("error", "Credenciales incorrectas");
                    Response.Redirect("error.aspx");
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

        private void Page_Error(object sender, EventArgs e)
        {
            Exception exc = Server.GetLastError();

            Session.Add("error", Seguridad.mensajeError(exc));
            Server.Transfer("error.aspx");

        }
    }
}