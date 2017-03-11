<%-- 
    Document   : modificar
    Created on : 10-mar-2017, 17:31:48
    Author     : ice
--%>

<%@page import="clases.usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    
    HttpSession s =request.getSession();
        if(s.getAttribute("usuario")==null){
            String msg="Debe iniciar sesion";
            response.sendRedirect("../index.jsp?error="+msg);
        }else{
            usuario u = (usuario)s.getAttribute("usuario");
            int role=u.getId_rol();
            if(role!=1)
            response.sendRedirect("../index.jsp");
            if(s.getAttribute("cod")==null){
            String msg = "Debe seleccionar un producto paramodificar";
            response.sendRedirect("index.jsp?msg="+msg);
            }else{
        
%>
<continue>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
             
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
   <nav class="navbar navbar-default">
  <div class="container">
           <ul class="nav navbar-nav navbar-right">
               <li><a href="#" onclick="document.getElementById('form-id').submit();"> Cerrar Sesión </a></li>
               <li><a><form action="../UserController" method="POST" id="form-id">
                           <input type="hidden" name="peticion" value="logout">
            </form></a></li>
      </ul>
  </div>
       </nav>
    <center>
        
        <h1>Modificar Cliente</h1>
       
 
    </center>
        <div class="container">
 <form action="../AdminController" method="POST">
     <input type="hidden" name="cod" value="<% out.print(s.getAttribute("cod")); %>">
  <div class="input-group">
    <span class="input-group-addon">User</span>
    <input id="user" type="text" class="form-control" name="user" value="<% out.print(s.getAttribute("name")); %>">
  </div>

    <div class="input-group">
    <span class="input-group-addon">Email</span>
    <input id="email" type="email" class="form-control" name="email" value="<% out.print(s.getAttribute("email")); %>">
  </div>
 <div class="input-group">
    <span class="input-group-addon">Password</span>
    <input id="pass" type="text" class="form-control" name="pass" value="<% out.print(s.getAttribute("password")); %>">
  </div>
          <input type="submit" class="btn btn-success" name="modificar" value="Modificar">
</form>
        </div>
    </body>
</html>
<% }} %>