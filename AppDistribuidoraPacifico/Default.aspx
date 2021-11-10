<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AppDistribuidoraPacifico.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="fondoDefault"> 
        <div class="container p-5">
            <div class="row">
                <div class="col-md-6">
                    <nav class="navbar navbar-expand-md navbar-dark">
                        <ul class="navbar-nav flex-column tamannoLetraDefault">
                            <li class="nav-item">
                                <a class="nav-link active" href="LineaBlanca.aspx">Línea Blanca</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="LineaTecnologica.aspx">Línea Tecnológica</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="LineaHogar.aspx">Línea Hogar</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="LineaAbarrotes.aspx">Abarrones</a>
                            </li>
                        </ul>
                    </nav>
                </div>
                <div class="col-md-6">
                    <div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="www/css/img/Default/LineaBlanca.jpg" class="d-block w-100" alt="...">
                            </div>
                            <div class="carousel-item">
                                <img src="www/css/img/Default/LineaHogar.jpg" class="d-block w-100" alt="...">
                            </div>
                            <div class="carousel-item">
                                <img src="www/css/img/Default/LineaTecnolgica.jpg" class="d-block w-100" alt="...">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--fin del fondo de color--%>
    <div class="container text-center">
        <h1 class="letraTitulos mt-3">Novedades</h1>
    </div>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-4">
                <div class="card">
                    <img src="www/css/img/LineaBlanca/Batidora.jpg" class="card-img-top img-fluid" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Batidora</h5>
                        <p class="card-text"></p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <img src="www/css/img/LineaHogar/Mueble.jpg" class="card-img-top " alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Mueble</h5>
                        <p class="card-text"></p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <img src="www/css/img/LineaTecnologica/Iphone X.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">iPhone X</h5>
                        <p class="card-text"></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--fin de los card--%>

    <div class="container p-5 text-center">
        <div class="row align-items-center">
            <div class="col-md-6">
                <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="www/css/img/Default/Default.jpg" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="www/css/img/Default/Default4.jpg" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="www/css/img/Default/default2.jpg" class="d-block w-100" alt="...">
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
            <div class="col-md-6 text-center">
                <h3>Compra Seguro aquí</h3>
            </div>
        </div>
    </div>


</asp:Content>
