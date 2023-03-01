<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Loguin.aspx.cs" Inherits="presentacion.Loguin" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=League+Spartan:wght@300;600&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/2e6a15d040.js" crossorigin="anonymous"></script>
    <link href="Estilos-loguin.css" rel="stylesheet" />
</head>
<body class="bg-dark">
    <form id="form1" runat="server">
        <section>
            <div class="row g-0">
                <div class="col-lg-7 d-none d-lg-block">

                    <div id="carouselExampleIndicators" class="carousel slide">
                        <div class="carousel-indicators">
                            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                        </div>
                        <div class="carousel-inner">
                            <div class="carousel-item img-1 active min-vh-100">
                            </div>
                            <div class="carousel-item img-2 min-vh-100">
                            </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>

                </div>
                <div class="col-lg-5 d-flex flex-column align-items-end min-vh-100">
                    <div class="px-lg-5 pt-lg-4 pb-lg-3 p-4 w-100 mb-auto">
                        <img src="imagenes/rca3.jpg" class="img-fluid" style="width: 150px; border-radius: 50%;" />
                    </div>
                    <div class="px-lg-5 py-lg-4 p-4 w-100 aling-self-center">
                        <h1 class="fw-bold mb-4">Bienvenido de vuelta</h1>
                        <div class="mb-5">
                            <div class="mb-4">
                                <label for="txtEmail" class="form-label fw-bold">Email</label>
                                <asp:TextBox TextMode="Email" ID="txtEmail" CssClass="form-control   border-0"  placeholder="Ingresa tu email" aria-describedby="emailHelp" runat="server" />
                                
                            </div>
                            <div class="mb-4">
                                <label for="txtContraseña" class="form-label  fw-bold">Contraseña</label>
                                <asp:TextBox TextMode="Password" ID="txtContraseña" CssClass="form-control  border-0 mb-2"  placeholder="Ingresa tu contraseña" runat="server" />
                                <a href="#" id="emailHelp" class="form-text text-decoration-none">¿Has olvidado tu contraseña?.</a>
                            </div>
                            <asp:Button Text="Iniciar sesión" ID="btnIniciarSesion" OnClick="btnIniciarSesion_Click" CssClass="btn btn-primary w-100" runat="server" />
                        </div>
                    </div>
                    <div class="text-center px-lg-5 p3-lg-3 pb-lh-4 p-4 w-100 mt-auto">
                        <p class="d-inline-block mb-0">¿No tienes una cuenta?</p>
                        <a class="text-light text-decoration-none fw-bold" href="Registro.aspx">Crea una ahora</a>
                    </div>
                </div>

            </div>
        </section>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    </form>
</body>
</html>
