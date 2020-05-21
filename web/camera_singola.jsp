<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="it">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style_singole.css">
    <title>Home</title>
</head>
<body class="pt-2" style="background-color: rgba(225, 196, 167, 0.2)">
<!--
NAVBAR
-->
<nav class="navbar navbar-expand-md navbar-dark fixed-top" style="font-size: large">
    <div class="container">
        <img src="" alt="">
        <a class="navbar-brand" href="#"> <div class="font-weight-bold">Hotel Marbella</div></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="collapsibleNavbar">
            <ul class="navbar-nav navbar-right">
                <li class="nav-item ">
                    <a class="nav-link active font-weight-bold" href="index.jsp">Home</a>
                </li>
                <li class="nav-item px-2">
                    <a class="nav-link font-weight-bold" href="camere.jsp">Visita camere</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link font-weight-bold" href="#">Esplora ristoranti ed attività</a>
                </li>
            </ul>
        </div>
    </div>
</nav>


<!-- Fine navbar-->
<!-- CAROUSEL -->
<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active" style="background-image:url(./imgs/imgs-index/carousel-slide-1.jpg)">
            <div class="carousel-caption">
                <h1 class="head">CIAO</h1>
                <p class="normal"> Ciao letto</p>
            </div>
        </div>
    </div>
    <!-- FINE CAROUSEL -->


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


        <!-- PARTE PAGINA INFERIORE -->

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
        <!-- FINE PARTE PAGINA INFERIORE -->
        <div class="jumbotron mxy-0" >
            <p>Contattaci</p>
            Lorem ipsum dolor sit, amet consectetur adipisicing elit. Eius nam impedit praesentium, molestiae hic libero, unde autem deserunt repudiandae minus nisi ut, dolorem natus saepe aliquid. Recusandae assumenda officia nulla.

            <p>Informazioni</p>
            Lorem ipsum dolor, sit amet consectetur adipisicing elit. Error harum nulla est qui nam dolor aliquam necessitatibus vitae quasi accusamus veritatis impedit sequi maiores dolore assumenda, perspiciatis, quas voluptate. Fuga?
        </div>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>