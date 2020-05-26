<%--
  Created by IntelliJ IDEA.
  User: Ciro
  Date: 16/04/2020
  Time: 18:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="it">
<head>
  <title>Hotel Marbel</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
  <link rel="stylesheet" href="./css/style_index.css">
</head>
<body class="pt-2" style="background-color: rgba(225, 196, 167, 0.2)">
<!--<div class="jumbotron text-center" style="margin-bottom:0">
 <h1>My First Bootstrap 4 Page</h1>
 <p>Resize this responsive page to see the effect!</p>
</div> -->

<!-- NAVBAR-->
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
          <a class="nav-link font-weight-bold" href="attivita.jsp">Esplora ristoranti ed attività</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
<!--NAVBAR-->


<!--CAROUSEL-->
<div id="carouselExampleControls" class="carousel slide carousel-fade" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active " style="background-image: url(./imgs/imgs-index/carousel-slide-1.jpg);">
      <div class="carousel-caption p-4">
        <div class="btn-card pb-3">
          <button type="button" class="btn btn-lg btn-danger" onclick="location.href='prenotazione.jsp'">Prenota Ora</button>
        </div>
        <div class="gradient-slide p-1">
          <h1 class="font-weight-bold">Camere</h1>
          <p style>Lorem ipsum dolor sit amet consectetur adipisicing elit. Possimus ipsum molestiae dicta veritatis, adipisci molestias nesciunt qui quisquam placeat eum suscipit laudantium nemo culpa. Laboriosam blanditiis similique eius quo quod!</p>
        </div>
      </div>
    </div>
    <div class="carousel-item" style="background-image: url(./imgs/imgs-index/carousel-slide-2.jpg);">
      <div class="carousel-caption p-4">
        <div class="gradient-slide p-1">
          <h1 class="font-weight-bold">Attività</h1>
          <p >Lorem ipsum dolor sit amet consectetur adipisicing elit. Possimus ipsum molestiae dicta veritatis, adipisci molestias nesciunt qui quisquam placeat eum suscipit laudantium nemo culpa. Laboriosam blanditiis similique eius quo quod!</p>
        </div>
      </div>
    </div>
    <div class="carousel-item" style="background-image: url(./imgs/imgs-index/carousel-slide-3.jpg);">
      <div class="carousel-caption p-4">
        <div class="gradient-slide p-1">
          <h1 class="font-weight-bold">Ristoranti</h1>
          <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Possimus ipsum molestiae dicta veritatis, adipisci molestias nesciunt qui quisquam placeat eum suscipit laudantium nemo culpa. Laboriosam blanditiis similique eius quo quod!</p>
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
<!--CAROUSEL-->

<!-- CARDS-->
<div class="container mt-5 mb-5"> <!-- mt = margin top /mb = margin bottom -->
  <div class="row">
    <div class="col">
      <div class="card w-100">
        <div class="row no-gutters">
          <div class="col-lg-4">
            <img src="./imgs/imgs-index/camera-card-1.jpg" class="card-img" alt="...">
          </div>
          <div class="col-lg-8">
            <div class="card-header"><h5>Camere</h5></div>
            <div class="card-body">
              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
              <a href="camere.jsp" class="btn btn-warning">Visita le camere</a>
              <a href="#" class="btn btn-danger">Prenota ora</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="row my-5">
    <div class="col">
      <div class="card w-100">
        <div class="row no-gutters">
          <div class="col-lg-4">
            <img src="./imgs/imgs-index/attivita-card-2.jpg" class="card-img" alt="...">
          </div>
          <div class="col-lg-8">
            <div class="card-header"><h5>Attività</h5></div>
            <div class="card-body">
              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
              <a href="#" class="btn btn-warning">Visita le nostre attività</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="row">
    <div class="col">
      <div class="card w-100">
        <div class="row no-gutters">
          <div class="col-lg-4">
            <img src="./imgs/imgs-index/ristoranti-card-3.jpg" class="card-img" alt="...">
          </div>
          <div class="col-lg-8">
            <div class="card-header"><h5>Ristoranti</h5></div>
            <div class="card-body">
              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
              <a href="#" class="btn btn-warning">Scopri i nostri ristoranti</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- CARDS-->



<div class="jumbotron py-1" style="margin-bottom:0">
  <p>Contattaci</p>
  Lorem ipsum dolor sit, amet consectetur adipisicing elit. Eius nam impedit praesentium, molestiae hic libero, unde autem deserunt repudiandae minus nisi ut, dolorem natus saepe aliquid. Recusandae assumenda officia nulla.

  <p>Informazioni</p>
  Lorem ipsum dolor, sit amet consectetur adipisicing elit. Error harum nulla est qui nam dolor aliquam necessitatibus vitae quasi accusamus veritatis impedit sequi maiores dolore assumenda, perspiciatis, quas voluptate. Fuga?
</div>


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html>