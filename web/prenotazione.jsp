<!--
  Created by IntelliJ IDEA.
  User: alex
  Date: 19/05/20
  Time: 23:46
  To change this template use File | Settings | File Templates.
!-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="./css/style_prenotazione.css">
    <title>Prenota ora</title>
</head>
<body style="padding-top: 5rem">
<!-- NAVBAR -->

<nav class="navbar navbar-expand-md navbar-dark fixed-top" style="font-size: large">
    <div class="container">
        <a class="navbar-brand font-weight-bold" href="#">
            <img src="./imgs/logo.png" width="40" height="40" alt="" style="margin: 0;">
            Hotel Marbella
        </a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="collapsibleNavbar">
            <ul class="navbar-nav navbar-right">
                <li class="nav-item">
                    <a class="nav-link font-weight-bold" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link font-weight-bold" href="camere.jsp">Visita camere</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link font-weight-bold" href="attivita.jsp">Esplora ristoranti ed attività</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!-- -->

<!-- FORM DI REGISTRAZIONE -->
<div class="container py-2">
    <h1>Prenotati ora</h1>
    <form name="register" method="post" action="./doReservationControl" onsubmit="return control()"> <!--onsubmit="return control()" -->
        <h3>Dati personali</h3>
        <div class="form-group">
            <label for="inputCodiceFiscale">Codice Fiscale</label>
            <input type="text" class="form-control" id="inputCodiceFiscale" name="codicefiscale" placeholder="Inserisci qui il tuo codice fiscale" onchange="controlCF()"/>
        </div>
        <div class="form-group">
            <label for="inputNome">Nome</label>
            <input type="text" class="form-control" name="nome" id="inputNome" onchange="controlNames('nome')"/>
        </div>
        <div class="form-group">
            <label for="inputCognome">Cognome</label>
            <input type="text" class="form-control" name="cognome" id="inputCognome" onchange="controlNames('cognome')"/>
        </div>
        <div class="form-group">
            <label for="inputData">Data di nascita</label>
            <input type="text" class="form-control" id="inputData" name="nascita" placeholder="yyyy-mm-dd" onchange="controlBirth()"/>
        </div>
        <h3>Informazioni prenotazione</h3>
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <label class="input-group-text" for="inputCamera">Tipo di camera</label>
            </div>
            <select class="custom-select" id="inputCamera" name="tipocamera">
                <option value="suite">Suite</option>
                <option value="superior">Superior</option>
                <option value="standard" selected>Standard</option>
            </select>
        </div>
        <div class="form-group">
            <label for="inputIn">Data di Check in</label>
            <input type="text" class="form-control" name="check_in"  id='inputIn'   placeholder="yyyy-mm-dd hh-mm-ss" onchange="controlDate('inputIn')"/>
        </div>
        <div class="form-group">
            <label for="inputOut">Data di Check out</label>
            <input type='text' class="form-control"  name="check_out" id='inputOut'  placeholder="yyyy-mm-dd hh-mm-ss" onchange="controlDate('inputOut')"/>
        </div>
        <button class="btn btn-primary" onclick="check()">Controlla data di prenotazione</button>
        <div id="Response" ></div>
        <h3>Informazioni di registrazione</h3>
        <div class="form-check">
            <input type="checkbox" class="form-check-input" id="registerCheck" name="register" value="toregister" onchange="showRegister()" checked/>
            <label class="form-check-label" for="registerCheck">Desidero registrarmi al sito</label>
        </div>
        <div id="registerForm" class="show">
            <div class="form-group">
                <label for="inputEmail">Email</label>
                <input type="text" class="form-control" id="inputEmail" name="email" onchange="controlEmail()"/>
            </div>
            <div class="form-group">
                <label for="inputPassword">Password</label>
                <input type="password" class="form-control" id="inputPassword" name="password" placeholder="Password" onchange="controlPassword()"/>
            </div>
        </div>
            <button type=Submit class="btn btn-primary">Submit</button>
    </form>
</div>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="prenotazione.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html>
