<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="it">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="./css/style_singole.css">
    <title>Home</title>
</head>
<body class="py-0" style="background-color: rgba(225, 196, 167, 0.2)">
<!--
NAVBAR
-->
<nav class="navbar navbar-expand-md navbar-dark fixed-top" style="font-size: large">
    <div class="container">
        <a class="navbar-brand font-weight-bold" href="index.jsp">
            <img src="./imgs/logo.png" width="40" height="40" alt="">
            Hotel Marbella
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="collapsibleNavbar">
            <ul class="navbar-nav navbar-right">
                <li class="nav-item ">
                    <a class="nav-link font-weight-bold" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link font-weight-bold" href="camere.jsp">Visita camere</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link font-weight-bold" href="attivita.jsp">Esplora ristoranti ed attività</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link font-weight-bold btn-danger" href="prenotazione.jsp" >Prenota Ora</a>
                </li>
            </ul>
        </div>
    </div>
</nav>


<!-- Fine navbar-->

<!-- CAROUSEL -->
<div id="carouselExampleControls" class="carousel slide carousel-fade mb-0" data-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active " style="background-image: url(./imgs/imgs-index/carousel-slide-1.jpg);">
            <div class="carousel-caption p-4">
                <div class="gradient-slide p-1">
                    <h1 class="font-weight-bold">Camera Standard</h1>
                    <p></p>
                </div>
            </div>
        </div>
        <div class="carousel-item" style="background-image: url(./imgs/imgs-index/carousel-slide-2.jpg);">
            <div class="carousel-caption p-4 side-container">
                <div class="gradient-slide p-1 side-body">
                    <h1 class="font-weight-bold">-</h1>
                    <p></p>
                </div>
            </div>
        </div>
        <div class="carousel-item" style="background-image: url(./imgs/imgs-index/carousel-slide-3.jpg);">
            <div class="carousel-caption p-4 side-container">
                <div class="gradient-slide p-1 side-body">
                    <h1 class="font-weight-bold">-</h1>
                    <p></p>
                </div>
            </div>
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
    <!-- FINE CAROUSEL -->

<!--
    <div class="container-fluid cont-homepage pt-3">
        <div class="container">
            <div class="row">
                <div class="col-md-7">
                    <p class="testo">
                        lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec at leo elit. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Quisque nec justo nibh. Duis quam diam, semper non rutrum vel, consectetur eu sapien. Sed ac bibendum velit. Fusce vitae hendrerit sapien. Mauris luctus dictum nunc a malesuada.
                    </p>
                </div>
                <div class="col-md-3 offset-md-2">
                    <button type="button" class="btn btn-success" class="mr-0" class="ml-auto"  style="width:15em ; height: 4em"   onclick="location.href='./index.jsp'">Prenota Ora</button>
                </div>
            </div>
        </div>




        <div class="container-fluid pt-3">

            <div class="container mt-4">
                <div class="row justify-content-center">
                    <div class="col-8">
                        <div class="card bg-dark text-white">
                            <img src="./imgs/imgs-index/attivita-card-2.jpg" class="card-img" alt="...">
                            <div class="card-img-overlay">
                                <h5 class="card-title">Card title</h5>
                                <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                                <p class="card-text">Last updated 3 mins ago</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container mt-4">
                <div class="row justify-content-center">
                    <div class="col-8">
                        <div class="card bg-dark text-white">
                            <img src="./imgs/imgs-index/attivita-card-2.jpg" class="card-img" alt="...">
                            <div class="card-img-overlay">
                                <h5 class="card-title">Card title</h5>
                                <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                                <p class="card-text">Last updated 3 mins ago</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container mt-4">
                <div class="row justify-content-center">
                    <div class="col-8">
                        <div class="card bg-dark text-white">
                            <img src="./imgs/imgs-index/attivita-card-2.jpg" class="card-img" alt="...">
                            <div class="card-img-overlay">
                                <h5 class="card-title">Card title</h5>
                                <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                                <p class="card-text">Last updated 3 mins ago</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
-->

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html>