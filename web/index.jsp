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
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="./css/style_index.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<!--<div class="jumbotron text-center" style="margin-bottom:0">
 <h1>My First Bootstrap 4 Page</h1>
 <p>Resize this responsive page to see the effect!</p>
</div> -->

<!-- NAVBAR-->
<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
  <div class="container">
    <img src="" alt="ciao">
    <a class="navbar-brand" href="#">Hotel Marbel</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-end" id="collapsibleNavbar">
      <ul class="navbar-nav navbar-right">
        <li class="nav-item">
          <a class="nav-link" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Visita Camere</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Esplora ristoranti ed attività</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
<!--NAVBAR-->


<!--CAROUSEL-->
<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active" style="background-image: url(./imgs/imgs-index/carousel-slide-1.jpg);">
      <div class="carousel-caption">
        <div class="btn-card">
          <button type="button" class="btn btn-success" onclick="location.href='./index.jsp'">Prenota Ora</button>
        </div>
        <h1>Camere</h1>
        <div class="gradient-slide">
          <p style="color: black;">Lorem ipsum dolor sit amet consectetur adipisicing elit. Possimus ipsum molestiae dicta veritatis, adipisci molestias nesciunt qui quisquam placeat eum suscipit laudantium nemo culpa. Laboriosam blanditiis similique eius quo quod!</p>
        </div>
      </div>
    </div>
    <div class="carousel-item" style="background-image: url(./imgs/imgs-index/carousel-slide-2.jpg);">
      <div class="carousel-caption">
        <h1>Attività</h1>
        <div class="gradient-slide">
          <p style="color: black;" >Lorem ipsum dolor sit amet consectetur adipisicing elit. Possimus ipsum molestiae dicta veritatis, adipisci molestias nesciunt qui quisquam placeat eum suscipit laudantium nemo culpa. Laboriosam blanditiis similique eius quo quod!</p>
        </div>
      </div>
    </div>
    <div class="carousel-item" style="background-image: url(./imgs/imgs-index/carousel-slide-3.jpg);">
      <div class="carousel-caption">
        <h1>Ristoranti</h1>
        <div class="gradient-slide">
          <p style="color: black;">Lorem ipsum dolor sit amet consectetur adipisicing elit. Possimus ipsum molestiae dicta veritatis, adipisci molestias nesciunt qui quisquam placeat eum suscipit laudantium nemo culpa. Laboriosam blanditiis similique eius quo quod!</p>
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
<div class="container card-cnt">
  <div class="card">
    <div class="row">
      <div class="col-md-4">
        <img class="card-img-top" src="..." alt="Card image cap">
      </div>
      <div class="col-md-8">
        <div class="card-body">
          <h5 class="card-title">Camere</h5>
          <p class="card-text">Lorem ipsum dolor sit amet consectetur adipisicing elit. Placeat doloremque vel molestiae! Fugit amet quis dolorum? Sit blanditiis illo nemo numquam tempora cum? Error illo quos soluta unde sint sunt.</p>
          <a href="#" class="btn btn-primary">Visita le camere</a>
          <a href="#" class="btn btn-success">Prenota Ora</a>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="container card-cnt">
  <div class="card">
    <div class="row">
      <div class="col-md-4">
        <img class="card-img-top" src="..." alt="Card image cap">
      </div>
      <div class="col-md-8">
        <div class="card-body">
          <h5 class="card-title">Arrività</h5>
          <p class="card-text">Lorem ipsum dolor sit amet consectetur, adipisicing elit. Rerum, omnis. Accusantium numquam quibusdam ipsam tempora itaque accusamus praesentium similique omnis excepturi sunt. Maiores temporibus eius molestiae perspiciatis deleniti facere sint!</p>
          <a href="#" class="btn btn-primary">Esplora le attività</a>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="container card-cnt">
  <div class="card">
    <div class="row">
      <div class="col-md-4">
        <img class="card-img-top" src="..." alt="Card image cap">
      </div>
      <div class="col-md-8">
        <div class="card-body">
          <h5 class="card-title">Ristoranti</h5>
          <p class="card-text">Lorem ipsum dolor sit amet consectetur adipisicing elit. Minus, adipisci aliquam? Magni id voluptate cum doloremque, quasi, incidunt deleniti facere voluptatibus nulla ducimus consequuntur recusandae tempora nisi provident? Temporibus, velit?</p>
          <a href="#" class="btn btn-primary">Visita i ristoranti</a>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- CARDS-->



<div class="jumbotron" style="margin-bottom:0">
  <p>Contattaci</p>
  Lorem ipsum dolor sit, amet consectetur adipisicing elit. Eius nam impedit praesentium, molestiae hic libero, unde autem deserunt repudiandae minus nisi ut, dolorem natus saepe aliquid. Recusandae assumenda officia nulla.

  <p>Informazioni</p>
  Lorem ipsum dolor, sit amet consectetur adipisicing elit. Error harum nulla est qui nam dolor aliquam necessitatibus vitae quasi accusamus veritatis impedit sequi maiores dolore assumenda, perspiciatis, quas voluptate. Fuga?
</div>

</body>
</html>