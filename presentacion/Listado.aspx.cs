using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Helper;
using negocio;
using Dominio;

namespace presentacion
{
    public partial class Listado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DiscosNegocio negocio = new DiscosNegocio();
            try
            {
                if (!(Seguridad.esAdmin(Session["usuario"])))
                {
                    Session.Add("error", "Necesitas ser administrador para acceder");
                    Response.Redirect("error.aspx");
                }

                if (!(IsPostBack))
                {
                    Session.Add("ListaDiscos", negocio.listarConSp());

                    chkActivo.Items.Add("Todos");
                    chkActivo.Items.Add("Activo");
                    chkActivo.Items.Add("Inactivo");
                }
                dgvDiscos.DataSource = Session["ListaDiscos"];
                DataBind();


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

        protected void dgvDiscos_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = int.Parse(dgvDiscos.SelectedRow.Cells[0].Text);
            Response.Redirect("Formulario.aspx?id=" + id);
        }

        protected void dgvDiscos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvDiscos.PageIndex = e.NewPageIndex;
            DataBind();
        }

        protected void txtFiltroRapido_TextChanged(object sender, EventArgs e)
        {
            string filtro = txtFiltroRapido.Text;
            List<Disco> lista;
            lista = ((List<Disco>)Session["ListaDiscos"]).FindAll(x => x.Titulo.ToUpper().Contains(filtro.ToUpper()) || x.Genero.Descripcion.ToUpper().Contains(filtro.ToUpper()));
            dgvDiscos.DataSource = lista;
            DataBind();
        }

        protected void chkFiltroAvanzado_CheckedChanged(object sender, EventArgs e)
        {
            txtFiltroRapido.Enabled = !chkFiltroAvanzado.Checked;
        }


        protected void chkCampo_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                chkCriterio.Items.Clear();
                if (chkCampo.SelectedItem.ToString() == "Cantidad de canciones")
                {
                    chkCriterio.Items.Add("Mayor a");
                    chkCriterio.Items.Add("Menor a");
                    chkCriterio.Items.Add("Igual a");
                }
                else
                {
                    chkCriterio.Items.Add("Inicia con");
                    chkCriterio.Items.Add("Termina con");
                    chkCriterio.Items.Add("Contiene");
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

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                DiscosNegocio negocio = new DiscosNegocio();
                dgvDiscos.DataSource = negocio.filtrar(chkCampo.SelectedItem.ToString(), chkCriterio.SelectedItem.ToString(),
                    txtFiltro.Text, chkActivo.SelectedItem.ToString());
                DataBind();
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