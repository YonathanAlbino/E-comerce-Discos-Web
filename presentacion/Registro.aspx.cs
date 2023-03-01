using Helper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using negocio;
using Servicios;

namespace presentacion
{
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            UsuarioNegocio negocio = new UsuarioNegocio();
            Email email = new Email();
            
            try
            {
                List<TextBox> list = new List<TextBox>();
                list.Add(txtNombre);
                list.Add(txtApellido);
                list.Add(txtEmail);
                list.Add(txtContraseña);

                char[] letrasAquitar = { 't', 'x'};

             
                foreach (var item in list)
                {
                    if (validaciones.textoVacio(item))
                    {
                        string nombreControl = item.ID.TrimStart(letrasAquitar);
                        Session.Add("error", "campo " + nombreControl + " vacio");
                        Response.Redirect("error.aspx");
                    }

                }

                Usuario usuario = new Usuario();
                usuario.Nombre = txtNombre.Text;
                usuario.Apellido = txtApellido.Text;
                usuario.Email = txtEmail.Text;
                usuario.Pass = txtContraseña.Text;

                usuario.Id = negocio.crearUsuario(usuario);
                Session.Add("usuario", usuario);

                email.armarCorreo(usuario.Email, "Registro Discos.App", "Gracias por usar nuestro servico " + usuario.Nombre,"","");
                email.enviarEmail();

                Response.Redirect("Mi-Perfil.aspx");

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