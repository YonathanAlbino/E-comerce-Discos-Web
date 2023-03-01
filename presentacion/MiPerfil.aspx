<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="MiPerfil.aspx.cs" Inherits="presentacion.MiPerfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Estilos-Mi-nuevo-perfil.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-8">
            <div class="col-10 datosCuenta">
                <div class="mb-5 ">
                    <h1 class="titulo">Mis datos</h1>
                </div>
                <div class="mb-3 titulo ">
                    <h2 class="titulo">Datos de la cuenta</h2>
                </div>
                <div class="txtDatosCuenta">
                    <input type="email " class="form-control textBox" id="exampleFormControlInput1" placeholder="name@example.com">
                </div>
                <div class="txtDatosCuenta mb-3">
                    <input type="email " class="form-control textBox" id="7" placeholder="name@example.com">
                </div>
            </div>

            <div class="row">
                <div class="col-10 datosCuenta">
                    <div class="mb-3 titulo">
                        <h2 class="titulo">Datos Personales</h2>
                    </div>
                    <div class="txtDatosCuenta">
                        <input type="email " class="form-control textBox" id="1" placeholder="name@example.com">
                    </div>
                    <div class="txtDatosCuenta">
                        <input type="email " class="form-control textBox" id="2" placeholder="name@example.com">
                    </div>
                    <div class="txtDatosCuenta">
                        <input type="email " class="form-control textBox" id="3" placeholder="name@example.com">
                    </div>
                    <div class="txtDatosCuenta">
                        <input type="email " class="form-control textBox" id="4" placeholder="name@example.com">
                    </div>
                    <div class="txtDatosCuenta">
                        <input type="email " class="form-control textBox" id="5" placeholder="name@example.com">
                    </div>
                    <div class="txtDatosCuenta">
                        <input type="email " class="form-control textBox" id="6" placeholder="name@example.com">
                    </div>
                    <asp:Button Text="Enviar" CssClass="btn btn-primary margen-boton" runat="server" />
                </div>
            </div>
        </div>
        <div class="col-4">
            <asp:ScriptManager runat="server" />
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div class="col-12 datosCuenta text-center">
                        <div class="mb-3">
                            <h2 class="imagenPerfil">Imagen de perfil</h2>
                            <input type="file" class="form-control textBox" name="ImagenPerfil" value="" />
                        </div>
                        <div class="mb-3 figure">
                            <asp:Image ImageUrl="https://p16-va-default.akamaized.net/img/musically-maliva-obj/1665282759496710~c5_720x720.jpeg" CssClass="img-fluid rounded" runat="server" />
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
