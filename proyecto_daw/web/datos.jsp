<%-- 
    Document   : datos
    Created on : 12-mar-2017, 16:30:16
    Author     : ice
--%>

<%-- 
    Document   : pedido
    Created on : 10-mar-2017, 18:24:32
    Author     : ice
--%>

<%@page import="clases.datosUsuario"%>
<%@page import="datos.cruddatosUsuarios"%>
<%@page import="clases.usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    
    HttpSession s =request.getSession();
        if(s.getAttribute("usuario")==null){
            String msg="Debe iniciar sesion";
            response.sendRedirect("index.jsp?error="+msg);
        }else{
            usuario u = (usuario)s.getAttribute("usuario");
            int role=u.getId_rol();
            if(role==2){
                cruddatosUsuarios d = new cruddatosUsuarios(); 
                datosUsuario datos = d.getdatosUsuario(u.getUsuario_id());
               
                
           
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Arma tu pedido</title>
         <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <link href="bootstrap/css/main.css" rel="stylesheet" type="text/css">

    </head>
    <body>
         <nav class="navbar navbar-default">
  <div class="container">
      <ul class="nav navbar-nav">
       <li><a href="index.jsp">PIZZERRIA</a></li>
       <li><a href="datos.jsp">MIS DATOS</a></li>
      </ul>
           <ul class="nav navbar-nav navbar-right">
               <li><a href="#" onclick="document.getElementById('form-id').submit();"> Cerrar Sesión </a></li>
               <li><a><form action="UserController" method="POST" id="form-id">
                           <input type="hidden" name="peticion" value="logout">
            </form></a></li>
      </ul>
  </div>
       </nav>
<div class="container">
  <% if(request.getParameter("msg")!=null){ %>
  <div class="alert alert-success" >
      <strong><%=request.getParameter("msg")%></strong>
</div> <% }  %>
<% if(request.getParameter("error")!=null){ %>
  <div class="alert alert-danger">
      <strong><%=request.getParameter("error")%></strong>
</div> <% }  %>

<h4>MIS DATOS:</h4>
  <form action="UserController" method="POST" onsubmit="return validate_ci()">
            
                 <div class="form-group">
                  <label for="nombres">Nombres:</label>
                  <input type="text" class="form-control" id="nombres" name="nombres" value="<%=datos.getNombres()%>" required>
                </div>
                 <div class="form-group">
                  <label for="apellidos">Apellidos:</label>
                  <input type="text" class="form-control" id="apellidos" name="apellidos" value="<%=datos.getApellidos()%>" required>
                </div>
                 <div class="form-group">
                  <label for="user">Cedula:</label>
                  <input type="text" class="form-control" id="cedula" name="cedula" value="<%=datos.getCedula()%>" onkeypress="return numeros(event)">
                  <p id="cedula_msg" style="color: red;"></p>
                </div>
                
           
                <div class="form-group">
                <label for="address">Dirección:</label>
                <textarea class="form-control" rows="5" id="address" name="address" required><%=datos.getDireccion()%></textarea>
                </div>
                <div class="form-group">
                  <label for="telefono1">Telefono:</label>
                  <input type="text" class="form-control" id="telefono1" name="telefono1" value="<%=datos.getTelefono1()%>" onkeypress="return numeros_tel1(event)" required>
                  <p id="telefono1_msg" style="color: red;"></p>
                </div>
                <div class="form-group">
                  <label for="telefono2">Celular:</label>
                  <input type="text" class="form-control" id="telefono2" name="telefono2" value="<%=datos.getTelefono2()%>" onkeypress="return numeros_tel2(event)" required>
                <p id="telefono2_msg" style="color: red;"></p>
                </div>
               
                <button type="submit" name="peticion" value="update" class="btn btn-success">Actualizar mis Datos</button>
              </form>
       
<script src="bootstrap/js/jquery.min.js"></script>
  <script src="bootstrap/js/bootstrap.min.js"></script>
  <script src="bootstrap/js/custom.js"></script>
    </body>
</html>
<% }else{
            response.sendRedirect("Admin/index.jsp");
            }
}
         %>