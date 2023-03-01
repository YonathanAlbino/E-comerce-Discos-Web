<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Formulario.aspx.cs" Inherits="presentacion.Formulario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="stilos-formulario.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server" />
    <div class="row">
        <div class="col-8">
            <div class="mb-3">
                <label for="txtTitulo" class="form-label">Título</label>
                <asp:TextBox ID="txtTitulo" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="ddlTipoEdicion" class="form-label">Tipo de edición</label>
                <asp:DropDownList ID="ddlTipoEdicion" CssClass="form-select" runat="server"></asp:DropDownList>
            </div>
            <div class="mb-3">
                <label for="txtCantidadCanciones" class="form-label">Cantidad de canciones</label>
                <asp:TextBox CssClass="form-control" ID="txtCantidadCanciones" runat="server" />
            </div>
            <div class="mb-3">
                <label for="ddlGenero" class="form-label">Género</label>
                <asp:DropDownList ID="ddlGenero" CssClass="form-select" runat="server"></asp:DropDownList>
            </div>
            <div class="mb-3">
                <label for="txtFecha" class="form-label">Año de lanzamiento</label>
                <asp:TextBox TextMode="Date" ID="txtFecha" CssClass="form-control" runat="server" />
            </div>
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div class="mb-3">
                        <label for="txtImagenTapa" class="form-label">Url imagen tapa</label>
                        <asp:TextBox AutoPostBack="true" OnTextChanged="txtImagenTapa_TextChanged" CssClass="form-control" ID="txtImagenTapa" runat="server" />
                    </div>
                    <div class="mb-3">
                        <asp:Image ImageUrl="https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png" ID="imagenUrl" class="img-fluid" Width="50%" Style="border-radius: 5px;" runat="server" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <div class="mb-3">
                <asp:Button Text="Agregar" ID="btnAceptar" CssClass="btn btn-primary" OnClick="btnAceptar_Click" runat="server" />
                <asp:Button Text="Inactivar" ID="btnInactivar" CssClass="btn btn-warning" OnClick="btnInactivar_Click" runat="server" />
            </div>
            <div class="mb-3">
                <asp:Button Text="Eliminar" ID="btnEliminar" CssClass="btn btn-danger" OnClick="btnEliminar_Click" runat="server" />
            </div>
            <%if (ConfirmaEliminacion)
                {%>
            <div class="mb-3">
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <asp:CheckBox Text="Eliminar" ID="chkEliminar" runat="server" />
                        <asp:Button Text="Eliminar" ID="eliminarConfirmado" OnClick="eliminarConfirmado_Click" CssClass="btn btn-danger" runat="server" />
                        </div
                    </ContentTemplate>
                </asp:UpdatePanel>
                <%}%>
            </div>
        </div>
        <div class="col-4"></div>
    </div>


</asp:Content>
