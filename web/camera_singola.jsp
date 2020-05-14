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
<body>
<!--
NAVBAR
-->
<nav class="navbar navbar-expand-md bg-dark navbar-dark fixed-top">
    <div class="container">
        <img src="" alt="">
        <a class="navbar-brand" href="#">Hotel Marbel</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="collapsibleNavbar">
            <ul class="navbar-nav navbar-right">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="camere.jsp">Visita Camere</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Esplora ristoranti ed attività</a>
                </li>
            </ul>
        </div>
    </div>
</nav>


<!-- Fine navbar-->
<style>
    p.normal{
        font-family: Arial, serif;
        font-weight: bolder;
    }
</style>
<!-- CAROUSEL -->
<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="https://source.unsplash.com/random" class="d-block w-100" alt="camera_uno" width="500" height="400">
            <div class="carousel-caption"> <p class="normal"> Ciao letto</p> </div>
        </div>
        <div class="carousel-item">
            <img src="imgs/gc-img1.jpg" class="d-block w-100" alt="camera_uno" width="500" height="400">
            <div class="carousel-caption"> <p class="normal">Ciao bagno</p></div>
        </div>
        <div class="carousel-item">
            <img src="imgs/gc-img1.jpg" class="d-block w-100" alt="camera_uno" width="500" height="400">
            <div class="carousel-caption"> <p class="normal">Ciao camera</p></div>
        </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
<!-- FINE CAROUSEL -->
<br>
<br>
<br>

<style>
    p.testo{

    }
</style>

<div>
    <div class="container">
        <div class="row">
            <div class="col-md-7">
               <p class="testo"> orem ipsum dolor sit amet, consectetur adipiscing elit. Donec at leo elit. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Quisque nec justo nibh. Duis quam diam, semper non rutrum vel, consectetur eu sapien. Sed ac bibendum velit. Fusce vitae hendrerit sapien. Mauris luctus dictum nunc a malesuada.</p>
            </div>
            <div class="col-md-1"></div>
            <div class="col-md-3">
                <button type="button" class="btn btn-success" class="mr-0" class="ml-auto"  style="width:15em ; height: 4em"   onclick="location.href='./index.jsp'">Prenota Ora</button>
            </div>
        </div>
</div>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>