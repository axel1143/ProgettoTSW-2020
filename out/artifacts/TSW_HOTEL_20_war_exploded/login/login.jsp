<%@ page import="it.unisa.model.user.UserBean" %><%--
  Created by IntelliJ IDEA.
  User: alex
  Date: 26/06/20
  Time: 00:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String error = (String) request.getAttribute("error");%>
<% UserBean userBean = (UserBean) session.getAttribute("user");%>
<html>
<head>
    <title>Login</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_login.css">

</head>
<body class="pt-5 d-flex align-items-center">

<!-- NAVBAR -->
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
                <li class="nav-item">
                    <a class="nav-link font-weight-bold" href="${pageContext.request.contextPath}/camere/camere.jsp">Visita camere</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link font-weight-bold" href="${pageContext.request.contextPath}/camere/attivita.jsp">Esplora ristoranti ed attività</a>
                </li>
                <%if(userBean == null){%>
                <li class="nav-item">
                    <a class="nav-link active font-weight-bold" href="${pageContext.request.contextPath}/login/login.jsp">Login</a>
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

<!-- NAVBAR -->

<!-- LOGIN FORM -->
<div class="container-fluid">
    <div class="row">
        <div class="col-md-2 offset-md-5 border border-secondary border-bottom-0 gradient-login rounded-top ">
            <h2 style="text-align: center">Effettua il login</h2>
        </div>
    </div>
    <div class="row">
        <div class="col-md-2 offset-md-5 border border-secondary border-top-0 gradient-login rounded-bottom">
            <form onsubmit="return checkLogin()" method="post" action="${pageContext.request.contextPath}/login?action=login">
                <div class="form-group">
                    <label for="inputEmail">Indirizzo email</label>
                    <input type="email" class="form-control" id="inputEmail" name="email" placeholder="Inserisci indirizzo email" onchange="controlEmail()">
                    <div id="emailError"></div>
                </div>
                <div class="form-group">
                    <label for="inputPassword">Password</label>
                    <input type="password" class="form-control" id="inputPassword" name="password" placeholder="Inserisci password" onchange="controlPassword()">
                    <div id="passwordError"></div>
                </div>
                <%if(error !=null && error.equals("password")){%>
                <div class="genericError">La password non é corretta</div>
                <%}else if(error != null && error.equals("notfound")){%>
                <div class="genericError">L'utente non esiste!</div>
                <%}%>
                <button type="submit" class="btn btn-primary">Effettua il login</button>
            </form>
        </div>
    </div>
</div>


<script src="${pageContext.request.contextPath}/login/login.js"></script>
<script src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html>
