<%@ page import="it.unisa.model.user.UserBean" %><%--
  Created by IntelliJ IDEA.
  User: alex
  Date: 21/05/20
  Time: 19:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% UserBean userBean = (UserBean) session.getAttribute("user");%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_attivita.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
</head>
<body style="">
<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark fixed-top py-0">
    <div class="container">
        <a class="navbar-brand " href="${pageContext.request.contextPath}/index.jsp">
            <img src="${pageContext.request.contextPath}/imgs/logo.png" width="80" height="40" alt="" >
            Hotel Marbella
        </a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="collapsibleNavbar">
            <ul class="navbar-nav navbar-right">
                <li class="nav-item ">
                    <a class="nav-link  " href="${pageContext.request.contextPath}/index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/camere/camere.jsp">Visita camere</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="${pageContext.request.contextPath}/camere/attivita.jsp">Esplora ristoranti ed attività</a>
                </li>
                <%if(userBean == null){%>
                <li class="nav-item">
                    <a class="nav-link " href="${pageContext.request.contextPath}/login/login.jsp">Login</a>
                </li>
                <%}else if(!userBean.isAdmin()) {%>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Area utente
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown1">
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/login/user/userPage.jsp">Pannello utente</a>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/login?action=logout">Logout</a>
                    </div>
                </li>
                <%} else if(userBean.isAdmin()){%>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle " href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Area admin
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/login/admin/adminPage.jsp">Pannello admin</a>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/login?action=logout">Logout</a>
                    </div>
                </li>
                <%}%>
            </ul>
        </div>
    </div>

</nav>
<!-- Fine NAVBAR-->
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-3 col-description d-flex align-items-center py-3">
            <div class="col-text">
                <p class="lead card-title"><h1 class="sectionTitle">Spa</h1>
                <p class="lead card-body">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cupiditate, quas, architecto, harum iure possimus veniam placeat eligendi aut asperiores molestias totam officia commodi in consequuntur minus suscipit adipisci omnis! Doloribus.</p>
            </div>
        </div>
        <div class="col-lg-9 col-image d-flex align-items-center p-3" style="background-image: url('../imgs/imgs-attivita/spa-backgorund-1.jpg');">
            <div class="container mxy-5">
                <div id="carouselControls" class="carousel slide carousel-fade" data-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active" style="background-image: url('../imgs/imgs-attivita/spa-carousel-1.jpg');">
                        </div>
                        <div class="carousel-item" style="background-image: url('../imgs/imgs-attivita/spa-carousel-2.jpg')">
                        </div>
                        <div class="carousel-item" style="background-image: url('../imgs/imgs-attivita/spa-carousel-3.jpg')">
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
<div class="container-fluid my-2">
    <div class="row">
        <div class="col-lg-9  col-image d-flex align-items-center p-3" style="background-image: url('../imgs/imgs-attivita/ristoranti-background-3.jpg');">
            <div class="container">
                <div id="carouselControls2" class="carousel slide carousel-fade" data-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active" style="background-image: url('../imgs/imgs-attivita/ristoranti-carousel-1.jpg')">
                        </div>
                        <div class="carousel-item" style="background-image: url('../imgs/imgs-attivita/ristoranti-carousel-2.jpg')">
                        </div>
                        <div class="carousel-item" style="background-image: url('../imgs/imgs-attivita/ristoranti-carousel-3.jpg')">
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
        <a name="ristoranti"></a>
        <div class="col-lg-3 col-description pt-5 pt-2 d-flex align-items-center ">
            <div class="col-text">
                <p class="text-center lead"><h1 class="sectionTitle">Ristoranti</h1>
                <p class="lead card-body">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cupiditate, quas, architecto, harum iure possimus veniam placeat eligendi aut asperiores molestias totam officia commodi in consequuntur minus suscipit adipisci omnis! Doloribus.</p>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid" >
    <div class="row">
        <div class="col-lg-3 col-description pb-5 pt-2 d-flex align-items-center">
            <div class="col-text">
                <p class="text-center lead">  <h1 class="sectionTitle">Bar, Palestra e Ludoteca</h1>
                <p class="lead card-body">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cupiditate, quas, architecto, harum iure possimus veniam placeat eligendi aut asperiores molestias totam officia commodi in consequuntur minus suscipit adipisci omnis! Doloribus.</p>
            </div>
        </div>
        <div class="col-lg-9 d-flex col-image align-items-center p-3 " style="background-image: url('../imgs/imgs-attivita/attivita-background-2.jpg');">
            <div class="container">
                <div id="carouselControls3" class="carousel slide carousel-fade" data-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active" style="background-image: url('../imgs/imgs-attivita/bar-carousel-1.jpg')">
                        </div>
                        <div class="carousel-item" style="background-image: url('../imgs/imgs-attivita/bar-carousel-2.jpg')">
                        </div>
                        <div class="carousel-item" style="background-image: url('../imgs/imgs-attivita/bar-carousel-3.jpg')">
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
