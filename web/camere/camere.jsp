<%@ page import="it.unisa.model.user.UserBean" %><%--
  Created by IntelliJ IDEA.
  User: Ciro
  Date: 14/05/2020
  Time: 11:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% UserBean userBean = (UserBean) session.getAttribute("user");%>
<html lang="it">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_camere.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
    <title>Camere</title>
</head>
<body class="pt-2">
<!--
NAVBAR
-->
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
                <li class="nav-item">
                    <a class="nav-link " href="${pageContext.request.contextPath}/index.jsp">Home</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link " href="${pageContext.request.contextPath}/camere/camere.jsp">Visita camere</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " href="${pageContext.request.contextPath}/camere/attivita.jsp">Esplora ristoranti ed attività</a>
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
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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

<!-- Inizio corpo pagina-->
<div class="container mt-5">
<div class="row py-5">
    <div class="col">
      <div class="card w-90">
        <div class="row no-gutters">
            <div class="col-lg-4" style="background-image: url('../imgs/imgs-camere/suite.jpg')">
            </div>
            <div class="col-lg-8">
                <h5 class="card-header">Camera Suite</h5>
                <div class="card-body">
                    <p class="card-text">Il meglio del hotel Marbella messo a disposizione alla nostra clientela. Clicca per avere maggiori informazioni e per visitare le nostre maglifiche suite.</p>
                    <button type="button" class="btn btn-darkgreen" onclick="location.href='./camera_suite.jsp'">Visita la camera</button>
                    <div class="btn bordered border-secondary"> Prezzo medio 200€/notte a persona</div>
                </div>
            </div>
        </div>
      </div>
    </div>
</div>

    <div class="row">
        <div class="col">
            <div class="card w-90">
                <div class="row no-gutters">
                    <div class="col-lg-4" style="background-image: url('../imgs/imgs-camere/superior.jpg')">
                    </div>
                    <div class="col-lg-8">
                        <h5 class="card-header">Camera Superior</h5>
                        <div class="card-body">
                            <p class="card-text">Visita le nostre camere superior per passare una notte di relax in una camera più spaziosa del previsto. Clicca per avere maggiori informazioni e per visitare le nostre camere superior. </p>
                            <button type="button" class="btn btn-darkgreen" onclick="location.href='camera_superior.jsp'">Visita la camera</button>
                            <div class="btn bordered border-secondary"> Prezzo medio 100€/notte a persona</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <div class="row py-5">
        <div class="col">
        <div class="card w-90">
            <div class="row no-gutters">
                <div class="col-lg-4" style="background-image: url('../imgs/img-standard/nuovo2.jpg')">
                </div>
                <div class="col-lg-8">
                    <h5 class="card-header">Camera Standard</h5>
                    <div class="card-body">
                        <p class="card-text">Le camere standard sono il l'elemento classico che può offrire il nostro hotel. Goditi la nostra camera standard molto diversa dalla camera standard che tutti si aspettano. Clicca per maggiori informazioni e per visitare le nostre camere standard.</p>
                        <button type="button" class="btn btn-darkgreen" onclick="location.href='camera_standard.jsp'">Visita la camera</button>
                        <div class="btn bordered border-secondary"> Prezzo medio 60€/notte a persona</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

<div class="jumbotron py-1 footer" style="margin-bottom:0">
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
