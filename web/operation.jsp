<%--
  Created by IntelliJ IDEA.
  User: alex
  Date: 20/05/20
  Time: 22:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String register = request.getParameter("register");%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<% if(register.equals("true")){
    %> <h1>Prenotato correttamente!</h1>
<%} else {%> <h1>Prenotazione fallita</h1>
<% } %>


</body>
</html>
