<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="presentacion.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="estilos.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager runat="server" />
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="row row-cols-1 row-cols-md-3 g-4">
                <%--  <%
            foreach (Dominio.Disco disco in ListaDisco)
            {
        %>
        <div class="col">
            <div class="card">
                <img src="<%: disco.UrlImagenTapa %>" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title"><%: disco.Titulo %></h5>
                    <p class="card-text"><%: disco.Genero %></p>
                    <asp:Button Text="Comprar" CssClass="btn btn-secondary separar button" ID="btnComprar" OnClick="btnComprar_Click" runat="server" />
                    <asp:Button Text="Descripción" CssClass="btn btn-secondary button" ID="btnDescripcion" OnClick="btnDescripcion_Click" runat="server" />
                </div>
            </div> 
        </div>
        <% } %>--%>
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                       

                        <div class="col">
                            <div class="card text-bg-dark">
                                <img src="<%#Eval("UrlImagenTapa") %>" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title"><%#Eval("Titulo") %></h5>
                                    <p class="card-text"><%#Eval("Genero") %></p>
                                    <asp:Button Text="Comprar" CssClass="btn btn-primary separar button" ID="btnComprar" OnClick="btnComprar_Click" runat="server" />
                                    <asp:Button Text="Descripción" CssClass="btn btn-primary separar button" ID="btnDescripcion" OnClick="btnDescripcion_Click" runat="server" />
                                    <asp:Button Text="Favorito" ID="btnFavorito" CssClass="btn btn-primary button" runat="server" CommandArgument='<%#Eval("Id") %>' CommandName="DiscoId" OnClick="btnFavorito_Click" />
                                </div>
                            </div>
                        </div>

                    </ItemTemplate>
                </asp:Repeater>

            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>



