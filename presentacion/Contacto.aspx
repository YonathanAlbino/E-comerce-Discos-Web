<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Contacto.aspx.cs" Inherits="presentacion.Contacto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="estilos-contacto.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row g-3">
        <div class="col-3 contenedor-imagen">
            <div class="contenedor-imagen-hijo">
                <img src="imagenes/undraw_mail_re_duel.svg" class="img-fluid" alt="Alternate Text" />
            </div>
        </div>
        <div class="col-6">
            <div class="centrado">
                <div class="col-12">
                    <label for="txtNombre" class="form-label">Nombre</label>
                    <asp:TextBox CssClass="form-control mb-3" ID="txtNombre" runat="server" />
                </div>
                <div class="col-12">
                    <label for="txtApellido" class="form-label">Apellido</label>
                    <asp:TextBox CssClass="form-control mb-3" ID="txtApellido" runat="server" />
                </div>
                <div class="col-12">
                    <label for="txtEmail" class="form-label">Dirección de email (ulala señol flanchez)</label>
                    <asp:TextBox TextMode="Email" CssClass="form-control" ID="txtEmail" runat="server" />
                </div>
                <div class="col-12">
                    <label for="txtAsunto" class="form-label">Asunto</label>
                    <asp:TextBox CssClass="form-control mb-3" ID="txtAsunto" runat="server" />
                </div>
                <div class="col-12">
                    <label for="" class="form-label">Mensaje</label>
                    <asp:TextBox ID="txtCuerpo" TextMode="MultiLine" CssClass="form-control mb-3 txtDescripcion" runat="server" />
                </div>
                <div class="mb-3">
                    <asp:Button Text="Enviar" CssClass="btn btn-primary mb-3" ID="btnEnviar" OnClick="btnEnviar_Click" runat="server" />
                </div>

                <div class="wave" style="height: 150px; overflow: hidden;">
                    <svg viewBox="0 0 500 150" preserveAspectRatio="none" style="height: 100%; width: 100%;">
                        <path d="M0.00,49.98 C149.99,150.00 349.20,-49.98 500.00,49.98 L500.00,150.00 L0.00,150.00 Z" style="stroke: none; fill: #08f;"></path></svg></div>
                <%--<svg preserveAspectRatio="none" class="wave" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320"><path id="elPath" fill="#0099ff" fill-opacity="1" d="M0,128L26.7,128C53.3,128,107,128,160,144C213.3,160,267,192,320,186.7C373.3,181,427,139,480,138.7C533.3,139,587,181,640,181.3C693.3,181,747,139,800,128C853.3,117,907,139,960,128C1013.3,117,1067,75,1120,85.3C1173.3,96,1227,160,1280,154.7C1333.3,149,1387,75,1413,37.3L1440,0L1440,320L1413.3,320C1386.7,320,1333,320,1280,320C1226.7,320,1173,320,1120,320C1066.7,320,1013,320,960,320C906.7,320,853,320,800,320C746.7,320,693,320,640,320C586.7,320,533,320,480,320C426.7,320,373,320,320,320C266.7,320,213,320,160,320C106.7,320,53,320,27,320L0,320Z"></path></svg>--%>
            </div>
        </div>
        <div class="col-3 contenedor-imagen">
            <div class="contenedor-imagen-hijo">
                <img src="imagenes/undraw_email_campaign_re_m6k5 (1).svg" class="img-fluid" alt="Alternate Text" />
            </div>
        </div>
    </div>




</asp:Content>
