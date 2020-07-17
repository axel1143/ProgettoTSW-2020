<%@ page import="it.unisa.model.Cart" %>
<%@ page import="it.unisa.model.user.UserBean" %>
<%@ page import="it.unisa.model.cliente.ClienteBean" %>
<!--
  Created by IntelliJ IDEA.
  User: alex
  Date: 19/05/20
  Time: 23:46
  To change this template use File | Settings | File Templates.
!-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ClienteBean clienteBean = (ClienteBean) session.getAttribute("customer");
    UserBean userBean = (UserBean) session.getAttribute("user");
    Cart cart = (Cart) request.getSession().getAttribute("cart"); // Prende il carrello dalla sessione attuale
    String action = request.getParameter("action"); // Serve a capire se la pagina JSP é stata chiamata con un action
    String type = request.getParameter("tipocamera"); //Serve a capire se la prenotazione é stata chiamata su una determinata cameras specifica
    String error = request.getParameter("error"); //Controlla se in qualche modo l'utente ha bypassato il controllo front-end sulla data di prenotazione
    if(cart != null && action == null ) response.sendRedirect(response.encodeRedirectURL(pageContext.getRequest().getServletContext().getContextPath()+"/prenotazione/riepilogo.jsp"));
    if(type == null) type = "";

    if(userBean != null && userBean.isAdmin()) response.sendRedirect(response.encodeRedirectURL((pageContext.getRequest().getServletContext().getContextPath()+"/login/admin/adminPage.jsp")));
%>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- RANGEPICKER  JS -->
    <script src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <% if(error!= null && error.equals("already-booked")){%>
    <script>alert("La prenotazione effettuata non é disponibile, riprova con una data diversa!")</script>
    <% } %>
    <!-- Bootstrap, DateRangePicker CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_prenotazione.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">

    <title>Prenota ora</title>
</head>
<body>
<!-- NAVBAR -->

<nav class="navbar navbar-expand-lg navbar-dark fixed-top py-0">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">
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
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/camere/camere.jsp">Visita camere</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/camere/attivita.jsp">Esplora ristoranti ed attività</a>
                </li>
                <%if(userBean == null){%>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/login/login.jsp">Login</a>
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
<!-- -->

<!-- FORM DI REGISTRAZIONE -->
<div class="container py-2">
    <h1>Prenotati ora</h1>
    <form name="register" method="post" action="${pageContext.request.contextPath}/doReservationControl" onsubmit="return control()"> <!--onsubmit="return control()" -->
        <div class="container-fluid border border-secondary rounded mt-3 py-3">
            <%if(clienteBean == null){%>
            <h3>Dati personali</h3>
            <div class="form-group">
                <label for="inputCodiceFiscale">Codice Fiscale</label>
                <input type="text" class="form-control" id="inputCodiceFiscale" name="codicefiscale"  placeholder="Inserisci qui il tuo codice fiscale" onchange="controlCF()" <% if(action != null && action.equals("modify")){%> value="<%=cart.getPrenotazioneBean().getCodice_fiscale()%> <%}%> " />
                <div id="cfError"></div>
            </div>
            <div class="form-group">
                <label for="inputNome">Nome</label>
                <input type="text" class="form-control" name="nome" id="inputNome" onchange="controlNames('nome')"  <% if (action != null && action.equals("modify")){%> value="<%=cart.getClienteBean().getNome()%>" <%}%>/>
                <div id="nomeError"></div>
            </div>
            <div class="form-group">
                <label for="inputCognome">Cognome</label>
                <input type="text" class="form-control" name="cognome" id="inputCognome" onchange="controlNames('cognome')"  <% if (action != null && action.equals("modify")){%> value="<%=cart.getClienteBean().getCognome()%>" <%}%>/>
                <div id="cognomeError"></div>
            </div>
            <div class="form-group">
                <label for="inputData">Data di nascita</label>
                <input type="text" class="form-control" id="inputData" placeholder="Data di Nascita" name="nascita" onchange="controlAge()" <% if (action != null && action.equals("modify")){%> value="<%=cart.getClienteBean().getDatanascita()%>" <%}%>  />
                <script>
                    $(function() {
                        $('input[name="nascita"]').daterangepicker({
                            singleDatePicker: true,
                            showDropdowns: true,
                            minYear: 1901,
                            maxYear: parseInt(moment().format('YYYY'),10)
                        });
                    });
                </script>
                <div id="dataError"></div>
            </div>
        <%}%>

        <div class="container-fluid border border-secondary rounded my-3 py-3">
            <h3>Informazioni prenotazione</h3>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <label class="input-group-text" for="inputCamera">Tipo di camera</label>
                </div>
                <select class="custom-select" id="inputCamera" name="tipocamera" onchange="$('#Response').html('')" <% if (action != null && action.equals("modify")){%> value="<%=cart.getCameraBean().getTipo_camera()%>" <%}%>>
                    <option value="suite" <%if (type.equals("suite") && action == null)%> selected <%;%>>Suite</option>
                    <option value="superior"<%if (type.equals("superior")  && action == null)%> selected <%;%>>Superior</option>
                    <option value="standard"<%if (type.equals("standard")  && action == null)%> selected <%;%>>Standard</option>
                </select>
            </div>
            <div class="form-group"><label for="inputCheck">Seleziona le tua permanenza</label>
                <input class="form-control" type="text" name="dates" id="inputCheck"  value="" onchange="$('#inputCheck').html('')"/>
                <script>$('input[name="dates"]').daterangepicker();</script>
            </div>
            <a class="btn btn-warning" onclick="check()" style="color: white">Controlla data di prenotazione</a>

            <div id="Response" class="genericError">
                <%if (action != null && action.equals("modify")){%>
                Inserire nuovamente il periodo di prenotazione!
                <%}%>
            </div>

        </div>

        <% if(userBean == null){%>
        <div class="form-check">
            <input type="checkbox" class="form-check-input" id="registerCheck" name="register" value="toregister" onchange="showRegister()" checked/>
            <label class="form-check-label" for="registerCheck">Desidero registrarmi al sito</label>
        </div>
        <div id="registerForm" class="show">
            <div class="container-fluid border border-secondary rounded mb-2 py-3">
                <h3>Informazioni di registrazione</h3>
                <div class="form-group">
                    <label for="inputEmail">Email</label>
                    <input type="text" class="form-control" id="inputEmail" name="email" onchange="controlEmail()" <% if (action != null && action.equals("modify") && cart.isAddUser()){%> value="<%=cart.getUserBean().getEmail()%>" <%}%> />
                    <div id="emailError"></div>
                </div>
                <div class="form-group">
                    <label for="inputPassword">Password</label>
                    <input type="password" class="form-control" id="inputPassword" name="password" placeholder="Password" onchange="controlPassword()" <% if (action != null && action.equals("modify") && cart.isAddUser()){%> value="<%=cart.getUserBean().getPassword()%>" <%}%>/>
                    <div id="passwordError"></div>
                </div>
                <%if(error != null && error.equals("user-already-exist")){%>
                <div class="genericError">L'indirizzo scelto é giá stato utilizzato!</div>
                <%}%>
            </div>
        </div>
        <%}%>
        <input hidden value="create" name="action">
            <button type='Submit' class="btn btn-success">Procedi con la prenotazione</button>
    </form>
</div>
<!-- BOOTRSTAP JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>



<!-- PREN JS -->
<script src="${pageContext.request.contextPath}/prenotazione/prenotazione.js"></script>
</body>
</html>
