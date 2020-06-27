<%@ page import="it.unisa.model.user.UserBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% UserBean userBean = (UserBean) session.getAttribute("user");%>
<html lang="it">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport"  content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_singole.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
    <title>Home</title>
</head>
<body class="py-0">
<!--
NAVBAR
-->
<nav class="navbar navbar-expand-lg navbar-dark fixed-top py-0">
    <div class="container">
        <a class="navbar-brand font-weight-bold" href="${pageContext.request.contextPath}/index.jsp">
            <img src="${pageContext.request.contextPath}/imgs/logo.png" width="80" height="40" alt="" >
            Hotel Marbella
        </a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="collapsibleNavbar">
            <ul class="navbar-nav navbar-right">
                <li class="nav-item">
                    <a class="nav-link font-weight-bold" href="${pageContext.request.contextPath}/index.jsp">Home</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link font-weight-bold" href="${pageContext.request.contextPath}/camere/camere.jsp">Visita camere</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link font-weight-bold" href="${pageContext.request.contextPath}/camere/attivita.jsp">Esplora ristoranti ed attività</a>
                </li>
                <%if(userBean == null){%>
                <li class="nav-item">
                    <a class="nav-link font-weight-bold" href="${pageContext.request.contextPath}/login/login.jsp">Login</a>
                </li>
                <%}else if(!userBean.isAdmin()) {%>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle font-weight-bold" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Area utente
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown1">
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/login/user/userPage.jsp">Pannello utente</a>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/login?action=logout">Logout</a>
                    </div>
                </li>
                <%} else if(userBean.isAdmin()){%>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle font-weight-bold" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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


<!-- Fine navbar-->

<!-- CAROUSEL -->
<div id="carouselExampleControls" class="carousel slide carousel-fade mb-0" data-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active " style="background-image: url('../imgs/img-suite/suite2.jpg');">
            <div class="carousel-caption p-4">
                <div class="gradient-slide p-1">
                    <h1 class="font-weight-bold">Camera Suite</h1>
                    <p>Vivi con noi un esperienza indimenticabile e piena di relax nella nostra suite</p>
                </div>
            </div>
        </div>
        <div class="carousel-item" style="background-image: url('../imgs/img-suite/suiteuno.jpg');">
            <div class="carousel-caption p-4">
                <div class="gradient-slide p-1 side-body">
                    <h1 class="font-weight-bold">CIAO</h1>
                    <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Eius nam impedit praesentium, molestiae hic libero, unde autem deserunt repudiandae minus </p>
                </div>
            </div>
        </div>
        <div class="carousel-item" style="background-image: url('../imgs/img-suite/suite3.jpg');">
            <div class="carousel-caption p-4">
                <div class="gradient-slide p-1 side-body">
                    <h1 class="font-weight-bold">CIAO</h1>
                    <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Eius nam impedit praesentium, molestiae hic libero, unde autem deserunt repudiandae minus </p>
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





<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html>