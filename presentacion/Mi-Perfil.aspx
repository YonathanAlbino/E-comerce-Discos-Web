<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Mi-Perfil.aspx.cs" Inherits="presentacion.Mi_Perfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Estilos-Mi-Perfil.css" rel="stylesheet" />
    <script>

        function validar() {
            const contraseña = document.getElementById("txtContraseña");
            if (contraseña.value == "") {
                contraseña.classList.add("is-invalid");
                alert("pepe");
                return false;
            }

            else {
                contraseña.classList.remove("is-invalid");
                return true;
            }
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server" />

    <div class="row g-3">
        <div class="col-7 text-center d-flex  flex-column align-items-center">
            <div class="col-10">
                <label for="txtNombre" class="form-label">Nombre</label>
                <asp:TextBox runat="server" ID="txtNombre" CssClass="text-box" placeholder="Nombre" />
            </div>
            <div class="col-10">
                <label for="txtApellido" class="form-label">Apellido</label>
                <asp:TextBox runat="server" ID="txtApellido" CssClass="text-box" placeholder="Apellido" />
                <%-- <asp:RangeValidator ErrorMessage="Fuera de rango" ControlToValidate="txtApellido" runat="server" Type="Integer" MinimumValue="1" MaximumValue="20" />--%>
                <asp:RegularExpressionValidator ErrorMessage="Formato incorrecto" ControlToValidate="txtApellido" ValidationExpression="^[0-9]+$" runat="server" />
            </div>
            <div class="col-md-10">
                <label for="txtEmail" class="form-label">Email</label>
                <asp:TextBox runat="server" ID="txtEmail" placeholder="Email" CssClass="text-box" />
                <%-- <asp:RequiredFieldValidator ErrorMessage="El email es requerido" ControlToValidate="txtEmail" runat="server" />--%>
                <asp:RegularExpressionValidator ErrorMessage="formato  email incorrecto" ControlToValidate="txtEmail" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" runat="server" />
            </div>
            <div class="col-md-10">
                <label for="txtContraseña" class="form-label">Contraseña</label>
                <asp:TextBox runat="server" ID="txtContraseña" ClientIDMode="Static" CssClass="text-box" placeholder="contraseña" />

            </div>
            <div class="col-md-10">
                <label for="txtFechaNacimiento" class="form-label">Fehca de nacimiento</label>
                <asp:TextBox runat="server" TextMode="Date" CssClass="text-box" ID="txtFechaNacimiento" />
            </div>
            <div class="col-8 text-center">
                <asp:Button Text="Enviar" ID="btnEnviar" OnClientClick="return validar()" OnClick="btnEnviar_Click" CssClass="btn btn-primary" runat="server" />
            </div>
        </div>

        <div class="col-5 text-center d-flex  flex-column align-items-center">
            <asp:UpdatePanel runat="server">
                <ContentTemplate>

                    <div class="col-md-12">
                        <label for="txtImagen" class="form-label ">Imagen de perfil</label>
                        <input type="file" runat="server" id="SeleccionarImg" class="form-control mb-3" />
                        <%-- <asp:TextBox OnTextChanged="txtImagen_TextChanged" AutoPostBack="true" runat="server" ID="txtImagen" CssClass="text-box" placeholder="Imagen de perfil" />--%>
                    </div>
                    <div class="col-md-12  figure">
                        <asp:Image ImageUrl="https://www.cityhallstore.com/wp-content/themes/claue/assets/images/placeholder.png" ID="txtImagenPerfil" CssClass="figure-img img-fluid rounded" runat="server" />
                    </div>
                    </div>

                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
</asp:Content>
