<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Listado.aspx.cs" Inherits="presentacion.Listado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server" />

    <div class="row">
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div class="col-12 text-center">
                    <div class="mb-3 ">
                        <label for="txtFiltroRapido" class="form-label tetxt-center">Filtro rápido</label>
                        <asp:TextBox runat="server" ID="txtFiltroRapido" AutoPostBack="true" OnTextChanged="txtFiltroRapido_TextChanged" CssClass="form-control" />
                    </div>
                </div>

                <div class="col-6" style="display: flex; flex-direction: column; justify-content: flex-end;">
                    <div class="mb-3">
                        <asp:CheckBox Text="Filtro avanzado" AutoPostBack="true" OnCheckedChanged="chkFiltroAvanzado_CheckedChanged" ID="chkFiltroAvanzado" runat="server" />
                    </div>
                </div>
                </div>

    <%if (chkFiltroAvanzado.Checked)
        {  %>
                <div class="row">
                    <div class="col-3">
                        <div class="mb-3">
                            <asp:Label for="chkCampo" CssClass="form-label" Text="Campo" runat="server" />
                            <asp:DropDownList runat="server" AutoPostBack="true" ID="chkCampo" CssClass="form-select" OnSelectedIndexChanged="chkCampo_SelectedIndexChanged">
                                <asp:ListItem Text="Título" />
                                <asp:ListItem Text="Cantidad de canciones" />
                                <asp:ListItem Text="Género" />
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="mb-3">
                            <asp:Label for="chkCriterio" CssClass="form-label" Text="Criterio" runat="server" />
                            <asp:DropDownList ID="chkCriterio" CssClass="form-select" runat="server"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="mb-3">
                            <asp:Label for="txtFiltro" CssClass="form-label" Text="Dato clave" runat="server" />
                            <asp:TextBox runat="server" ID="txtFiltro" CssClass="form-control" />
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="mb-3">
                            <asp:Label for="chkActivo" CssClass="form-label" Text="Activo" runat="server" />
                            <asp:DropDownList CssClass="form-control" ID="chkActivo" runat="server"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-12 text-center">
                        <div class="mb-3">
                            <asp:Button Text="Buscar" ID="btnBuscar" OnClick="btnBuscar_Click" CssClass="btn btn-primary" runat="server" />
                        </div>
                    </div>
                </div>
                <%} %>
            </ContentTemplate>
        </asp:UpdatePanel>

        <div class="row">
            <asp:UpdatePanel runat="server">
                <ContentTemplate>


                    <div class="col">
                        <asp:GridView CssClass="table table-bordered  table-hover" ID="dgvDiscos" OnSelectedIndexChanged="dgvDiscos_SelectedIndexChanged" runat="server" AutoGenerateColumns="false"
                            OnPageIndexChanging="dgvDiscos_PageIndexChanging" AllowPaging="true" PageSize="20">
                            <Columns>

                                <asp:BoundField HeaderText="Id" DataField="Id" HeaderStyle-CssClass="" ItemStyle-CssClass="" />
                                <asp:BoundField HeaderText="Título" DataField="Titulo" />
                                <asp:BoundField HeaderText="Cantidad de canciones" DataField="CantidadDeCanciones" />
                                <asp:BoundField HeaderText="Género" DataField="Genero.Descripcion" />
                                <asp:BoundField HeaderText="Tipo de edición" DataField="Edicion.Descripcion" />
                                <asp:BoundField HeaderText="Activo" DataField="Eliminado" />
                                <asp:CommandField ShowSelectButton="true" SelectText="Seleccionar" HeaderText="Acción" />

                            </Columns>
                        </asp:GridView>
                    </div>


                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
</asp:Content>
