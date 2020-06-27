<%@ page import="it.unisa.model.Cart" %>
<%@ page import="it.unisa.model.user.UserBean" %><%--
  Created by IntelliJ IDEA.
  User: alex
  Date: 22/06/20
  Time: 19:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% UserBean userBean = (UserBean) session.getAttribute("user");%>
<% Cart cart = (Cart) request.getSession().getAttribute("cart");
if(cart == null) response.sendRedirect(response.encodeRedirectURL("./prenotazione.jsp"));
else {%>
<html>
<head>
    <title>Riepilogo di prenotazione</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_prenotazione.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">

</head>
<body>
<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark fixed-top py-0">
    <div class="container">
        <a class="navbar-brand font-weight-bold" href="${pageContext.request.contextPath}/index.jsp">
            <img src="${pageContext.request.contextPath}/imgs/logo.png" class="logo" width="90" height="40" alt="" >
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
                <li class="nav-item">
                    <a class="nav-link active font-weight-bold" href="${pageContext.request.contextPath}/login/login.jsp">Login</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!-- -->
<div class="container border border-secondary rounded my-2 py-3">
    <h2>Vuole confermare la seguente prenotazione?</h2>
            <a class="btn btn-success mx-2" type="submit" href="${pageContext.request.contextPath}/doReservationControl?action=booked" >Conferma prenotazione</a>
            <a class="btn btn-danger" type="submit" href="${pageContext.request.contextPath}/doReservationControl?action=delete">Cancella prenotazione</a>
            <a class="btn btn-warning mx-2" type="submit" href="${pageContext.request.contextPath}/doReservationControl?action=modify">Modifica prenotazione</a>
    <h2>Riepilogo informazioni:</h2>
    <div class="container-fluid border border-secondary rounded mt-3 py-3">
        <h3>Dati personali</h3>
        <div class="form-group">
            <label for="inputCodiceFiscale">Codice Fiscale</label>
            <input type="text" disabled class="form-control" id="inputCodiceFiscale" value="<%=cart.getClienteBean().getCodicefiscale()%>"/>
        </div>
        <div class="form-group">
            <label for="inputNome">Nome</label>
            <input type="text" class="form-control" disabled value="<%= cart.getClienteBean().getNome()%>" id="inputNome"/>
        </div>
        <div class="form-group">
            <label for="inputCognome">Cognome</label>
            <input type="text" class="form-control" disabled value="<%= cart.getClienteBean().getCognome()%>" id="inputCognome" />
        </div>
        <div class="form-group">
            <label for="inputData">Data di nascita</label>
            <input type="text" class="form-control" id="inputData" disabled value="<%= cart.getClienteBean().getDatanascita()%>"/>
        </div>
    </div>


    <div class="container-fluid border border-secondary rounded my-3 py-3">
        <h3>Informazioni prenotazione</h3>
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <label class="input-group-text" for="inputCamera">Tipo di camera</label>
                <input type="text" class="form-control" id="inputCamera" disabled value="<%= cart.getPrenotazioneBean().getTipo()%>"/>
            </div>
        </div>
        <div class="form-group">
            <h3>Periodo di permanenza:</h3>
            <label for="inputPeriod1">Da:</label>
            <input type="text" class="form-control"  id="inputPeriod1" disabled value="<%= cart.getPrenotazioneBean().getCheck_in()%>"/>
            <label for="inputPeriod2">A:</label>
            <input type="text" class="form-control" id="inputPeriod2" disabled value="<%= cart.getPrenotazioneBean().getCheck_out()%>"/>
        </div>
    </div>

    <div class="form-group">
        <label for="inputRegister">Desideri registrarti?</label>
        <input type="text" class="form-control" id="inputRegister" disabled value="<% if(cart.isAddUser()) out.println("Si"); else out.println("No");%>"/>
    </div>
    <%if(cart.isAddUser()){%>
    <div id="registerForm">
        <div class="container-fluid border border-secondary rounded mb-2 py-3">
            <h3>Informazioni di registrazione</h3>
            <div class="form-group">
                <label for="inputEmail">Email</label>
                <input type="text" class="form-control" id="inputEmail" disabled value="<%= cart.getUserBean().getEmail()%>"/>
            </div>
            <div class="form-group">
                <label for="inputPassword">Password</label>
                <input type="password" class="form-control" id="inputPassword"  disabled value="<%= cart.getUserBean().getPassword()%>"/>
            </div>
        </div>
    </div>
    <%}%>

</div>

<script src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

</body>
</html>
<%}%>