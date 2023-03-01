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
using System.Web.WebSockets;

namespace presentacion
{
    public partial class Formulario : System.Web.UI.Page
    {
        public String urlImagen { get; set; }
        public bool ConfirmaEliminacion { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            ConfirmaEliminacion = false;
            try
            {
                if (!(IsPostBack))
                {
                    EstiloNegocio negocio = new EstiloNegocio();
                    TipoEdicionNegocio negocio2 = new TipoEdicionNegocio();

                    ddlGenero.DataSource = negocio.listarSP();
                    ddlGenero.DataTextField = "Descripcion";
                    ddlGenero.DataValueField = "Id";
                    ddlGenero.DataBind();

                    ddlTipoEdicion.DataSource = negocio2.listaSP();
                    ddlTipoEdicion.DataTextField = "Descripcion";
                    ddlTipoEdicion.DataValueField = "Id";
                    ddlTipoEdicion.DataBind();


                    btnEliminar.Enabled = false;
                    btnInactivar.Enabled = false;

                    if (Request.QueryString["id"] != null)
                    {
                        int id = int.Parse(Request.QueryString["id"]);
                        Disco nuevo = ((List<Disco>)Session["ListaDiscos"]).Find(x => x.Id == id);

                        if (nuevo.Eliminado == 0)
                            btnInactivar.Text = "Activar";



                        txtTitulo.Text = nuevo.Titulo;
                        txtImagenTapa.Text = nuevo.UrlImagenTapa;
                        txtFecha.Text = nuevo.FechaLanzamiento.ToString();
                        txtCantidadCanciones.Text = nuevo.CantidadDeCanciones.ToString();
                        //ddlGenero.SelectedIndex = ddlGenero.Items.IndexOf(ddlGenero.Items.FindByValue(nuevo.Genero.Id.ToString()));
                        ddlGenero.SelectedValue = nuevo.Genero.Id.ToString();
                        ddlTipoEdicion.SelectedIndex = -1;
                        //ddlTipoEdicion.Items.FindByValue(nuevo.Edicion.Id.ToString()).Selected = true;
                        ddlTipoEdicion.SelectedValue = nuevo.Edicion.Id.ToString();
                        imagenUrl.ImageUrl = nuevo.UrlImagenTapa;

                        btnAceptar.Text = "Modificar";
                        btnEliminar.Enabled = true;
                        btnInactivar.Enabled = true;

                    }
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

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            Disco disco = new Disco();
            DiscosNegocio negocio = new DiscosNegocio();
            try
            {
                disco.Titulo = txtTitulo.Text;
                disco.CantidadDeCanciones = int.Parse(txtCantidadCanciones.Text);
                disco.UrlImagenTapa = txtImagenTapa.Text;
                disco.FechaLanzamiento = DateTime.Parse(txtFecha.Text);
                disco.Genero = new Estilo();
                disco.Genero.Id = int.Parse(ddlGenero.SelectedValue);
                disco.Edicion = new TipoDeEdicion();
                disco.Edicion.Id = int.Parse(ddlTipoEdicion.SelectedValue);

                if (Request.QueryString["id"] != null)
                {
                    disco.Id = int.Parse(Request.QueryString["id"]);
                    negocio.modificarSP(disco);
                }

                else
                    negocio.agregarSP(disco);

                Response.Redirect("Listado.aspx");

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

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            Session.Remove("ListaDiscos");
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            ConfirmaEliminacion = true;
        }

        protected void txtImagenTapa_TextChanged(object sender, EventArgs e)
        {
            imagenUrl.ImageUrl = txtImagenTapa.Text;
        }

        protected void eliminarConfirmado_Click(object sender, EventArgs e)
        {
            try
            {
                if (chkEliminar.Checked)
                {
                    DiscosNegocio negocio = new DiscosNegocio();
                    negocio.eliminarFisicosp(int.Parse(Request.QueryString["id"]));
                    Response.Redirect("Listado.aspx");
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

        protected void btnInactivar_Click(object sender, EventArgs e)
        {
            DiscosNegocio negocio = new DiscosNegocio();
            try
            {
                int id = int.Parse(Request.QueryString["id"]);
                Disco nuevo = ((List<Disco>)Session["ListaDiscos"]).Find(x => x.Id == id);
                negocio.cambiarEstado(nuevo);

                Response.Redirect("Listado.aspx");
            }
            catch (Exception ex)
            {

                throw ex;
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