<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AppDistribuidoraPacifico.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Distribuidora del Pacífico</title>
    <link href="www/css/bootstrap.min.css" rel="stylesheet" />
    <link href="www/css/Styles.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="container text-center">
                <ul class="nav justify-content-center">
                    <a href="Default.aspx" class="d-lg-none d-md-block ">
                        <img src="www/css/img/LogoDistribuciones2.png" width="200" height="140" /></a>
                </ul>
            </div>
        </div>

        <div class="container p-5">
            <div class="row align-items-center">
                <div class="col-md-6 text-center">
                    <img src="www/css/img/Login.png" class="img-fluid" />
                    <h3>¿No tienes cuenta?</h3>
                    <a href="RegistroUsuarios.aspx" class=" d-lg-block d-none mb-5">Registrate aquí</a>
                </div>
                <div class="col-md-6 ">
                    <ul class="nav justify-content-end list-unstyled">
                        <a href="Default.aspx" class=" d-lg-block d-none mb-5">
                            <img src="www/css/img/LogoDistribuciones2.png" width="200" height="140" /></a>
                    </ul>
                    <h2 class="text-center letraTitulos">Iniciar Sesión</h2>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-11">
                                <asp:Label Text="Correo Electrónico" runat="server" />
                                <asp:TextBox ID="txtEmail"
                                    CssClass="form-control" runat="server" MaxLength="80" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-11">
                                <asp:Label Text="Contraseña" runat="server" />
                                <asp:TextBox ID="txtContrasenna"
                                    CssClass="form-control" runat="server" MaxLength="80" TextMode="Password" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group text-center">
                        <div class="row">
                            <div class="col-md-12">
                                <asp:Button ID="btnIngresar" Text="Ingresar" CssClass="btn btn-dis" runat="server" OnClick="btnIngresar_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
<script src="www/js/jquery-3.4.1.min.js"></script>
<script src="www/js/bootstrap.min.js"></script>
</html>
