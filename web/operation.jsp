<%--
  Created by IntelliJ IDEA.
  User: alex
  Date: 20/05/20
  Time: 22:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%  String error = request.getParameter("error");
    String validate = null;
if(error==null){
    validate = request.getParameter("validate");
}%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<% if(validate == null) { %>
    <h1><%=error%></h1>
<% }else if(validate.equals("true")){
    %> <h1>Prenotato correttamente!</h1>
<%} else {%> <h1>Prenotazione fallita,data scelta non disponibile!</h1>
<% } %>


</body>
</html>
