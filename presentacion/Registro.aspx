<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="presentacion.Registro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registro</title>
    <link href="Estilos-registro.css" rel="stylesheet" />
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="contenedor">
            <section class="form-registro">
                <h4>Registro</h4>
                <asp:TextBox runat="server" placeholder="Ingrese su nombre" ID="txtNombre" CssClass="text-box" />
                <asp:TextBox runat="server" placeholder="Ingrese su Apellido" ID="txtApellido" CssClass="text-box" />
                <asp:TextBox runat="server" TextMode="Email" placeholder="Ingrese su Email" ID="txtEmail" CssClass="text-box" />
                <asp:TextBox runat="server" TextMode="Password" placeholder="Ingrese su Contraseña" ID="txtContraseña" CssClass="text-box" />
                <p>Estoy de acuerdo con los <a href="#">terminos y condiciones</a></p>
                <asp:Button Text="Registrar" ID="btnRegistrar" OnClick="btnRegistrar_Click" CssClass="boton" runat="server" />
                <p><a href="Loguin.aspx">Ya tengo una cuenta</a></p>
            </section>
        </div>
    </form>
</body>
</html>
