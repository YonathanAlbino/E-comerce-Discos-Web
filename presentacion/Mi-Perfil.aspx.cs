using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Helper;
using negocio;


namespace presentacion
{
    public partial class Mi_Perfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!(IsPostBack))
                {
                    Usuario usuario = Session["usuario"] != null ? (Usuario)Session["usuario"] : null;

                    if (usuario != null)
                    {
                        txtNombre.Text = usuario.Nombre;
                        txtApellido.Text = usuario.Apellido;
                        txtEmail.Text = usuario.Email;
                        txtContraseña.Text = usuario.Pass;
                        txtFechaNacimiento.Text = usuario.FechaNacimiento.ToString("yyyy-MM-dd");
                        if (usuario.ImagenPerfil != null)
                            txtImagenPerfil.ImageUrl = Seguridad.refrescarImagen(usuario.ImagenPerfil);
                        else
                            txtImagenPerfil.ImageUrl = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSrqRPTdxZtNr4JFGLGEfbd7Iq-IVUn8LFxFG3cO0kUcPrLJx8Tg3mOOcq8uJ4egbZziE&usqp=CAU";
                    }
                    else
                        Response.Redirect("Loguin.aspx");

                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void txtImagen_TextChanged(object sender, EventArgs e)
        {
            //txtImagenPerfil.ImageUrl = txtImagen.Text;
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            try
            {
                Page.Validate();
                if (!(Page.IsValid))
                    return;

                UsuarioNegocio negocio = new UsuarioNegocio();
                Usuario usuario = (Usuario)Session["usuario"];

                usuario.Nombre = txtNombre.Text;
                usuario.Apellido = txtApellido.Text;
                usuario.Email = txtEmail.Text;
                usuario.Pass = txtContraseña.Text;
                usuario.FechaNacimiento = DateTime.Parse(txtFechaNacimiento.Text);
                usuario.ImagenPerfil = "Perfil-" + usuario.Id + ".jpg";

                negocio.actualizar(usuario);

                if (!(string.IsNullOrEmpty(SeleccionarImg.Value)))
                {
                    string ruta = Server.MapPath("./imagenesGuardadas/ImagenesPerfil/");
                    SeleccionarImg.PostedFile.SaveAs(ruta + "Perfil-" + usuario.Id + ".jpg");
                    
                    //leer imagen
                    ((Image)Master.FindControl("imagenAvatar")).ImageUrl = Seguridad.refrescarImagen(usuario.ImagenPerfil);
                    txtImagenPerfil.ImageUrl = Seguridad.refrescarImagen(usuario.ImagenPerfil);
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