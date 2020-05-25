<%--
  Created by IntelliJ IDEA.
  User: alex
  Date: 21/05/20
  Time: 19:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="./css/style_attivita.css">


</head>
<body style="background-color: rgba(225, 196, 167, 0.2)">

<!-- NAVBAR -->
<nav class="navbar navbar-expand-md navbar-dark fixed-top" style="font-size: large">
    <div class="container">
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
<!-- Fine NAVBAR-->
<div class="container-fluid" style="background-image: url(imgs/imgs-attivita/spa-backgorund-1.jpg);">
    <div class="row pt-5">
        <div class="col-md-4 pt-3 d-flex align-items-center my-2">
            <div class="container">
                <p class="text-center lead"><h2>Spa</h2>
                <p class="lead card-body">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cupiditate, quas, architecto, harum iure possimus veniam placeat eligendi aut asperiores molestias totam officia commodi in consequuntur minus suscipit adipisci omnis! Doloribus.</p>
            </div>
        </div>
        <div class="col-md-8 my-5">
            <div class="container my-1">
                <div id="carouselControls" class="carousel slide carousel-fade" data-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active" style="background-image: url(imgs/imgs-attivita/spa-carousel-1.jpg);">
                        </div>
                        <div class="carousel-item" style="background-image: url(imgs/imgs-attivita/spa-carousel-2.jpg)">
                        </div>
                        <div class="carousel-item" style="background-image: url(imgs/imgs-attivita/spa-carousel-3.jpg)">
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselControls" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselControls" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid" style="background-image: url(imgs/imgs-attivita/ristoranti-background-3.jpg);">
    <div class="row">
        <div class="col-md-8 my-5">
            <div class="container my-1">
                <div id="carouselControls2" class="carousel slide carousel-fade" data-ride="carousel">
                    <div class="carousel-inner my-5">
                        <div class="carousel-item active" style="background-image: url(imgs/imgs-attivita/ristoranti-carousel-1.jpg)">
                        </div>
                        <div class="carousel-item" style="background-image: url(imgs/imgs-attivita/ristoranti-carousel-2.jpg)">
                        </div>
                        <div class="carousel-item" style="background-image: url(imgs/imgs-attivita/ristoranti-carousel-3.jpg)">
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselControls2" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselControls2" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
        </div>
        <div class="col-md-4 py-2 d-flex align-items-center py-2 my-2">
            <div class="container">
                <p class="text-center lead"><h2>Ristoranti</h2>
                <p class="lead card-body">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cupiditate, quas, architecto, harum iure possimus veniam placeat eligendi aut asperiores molestias totam officia commodi in consequuntur minus suscipit adipisci omnis! Doloribus.</p>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid" style="background-image: url(imgs/imgs-attivita/attivita-background-2.jpg); ">
    <div class="row">
        <div class="col-md-4 py-2 d-flex align-items-center py-2 my-2">
            <div class="container">
                <p class="text-center lead">  <h2>Bar, Palestra e Sala bambini</h2>
                <p class="lead card-body">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cupiditate, quas, architecto, harum iure possimus veniam placeat eligendi aut asperiores molestias totam officia commodi in consequuntur minus suscipit adipisci omnis! Doloribus.</p>
            </div>
        </div>
        <div class="col-md-8 my-5">
            <div class="container my-1">
                <div id="carouselControls3" class="carousel slide carousel-fade" data-ride="carousel">
                    <div class="carousel-inner my-5">
                        <div class="carousel-item active" style="background-image: url(imgs/imgs-attivita/bar-carousel-1.jpg)">
                        </div>
                        <div class="carousel-item" style="background-image: url(imgs/imgs-attivita/bar-carousel-2.jpg)">
                        </div>
                        <div class="carousel-item" style="background-image: url(imgs/imgs-attivita/bar-carousel-3.jpg)">
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselControls3" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselControls3" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>





<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

</body>
</html>
