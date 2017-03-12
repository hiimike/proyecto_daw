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
                String msg= "";
                if("".equals(datos.getCedula()) || "".equals(datos.getNombres()) || "".equals(datos.getApellidos()) || 
                        "".equals(datos.getTelefono1()) || "".equals(datos.getTelefono2()) ||"".equals(datos.getDireccion())){
                    msg= "Complete su informacion en el menu MIS DATOS";
                }
                
           
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
    <h2>Pizza form</h2>
     <% if(msg!=""){ %>
  <div class="alert alert-info">
      <strong><%=msg%></strong>
</div> <% }  %>
<h4>DATOS:</h4>
  <form class="form-horizontal">
    <div class="form-group">
      <label class="control-label col-sm-2" for="">Cedula:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="cedula" value="<%=datos.getCedula()%>" disabled>
      </div>
    </div>
       <div class="form-group">
      <label class="control-label col-sm-2" for="">Nombres:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="nombres" value="<%=datos.getNombres()%>" disabled>
      </div>
    </div>
      <div class="form-group">
      <label class="control-label col-sm-2" for="">Apellidos:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="nombres" value="<%=datos.getApellidos()%>" disabled>
      </div>
    </div>
      <div class="form-group">
      <label class="control-label col-sm-2" for="">Telefono:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="telefono1" value="<%=datos.getTelefono1()%>" disabled>
      </div>
    </div>
       <div class="form-group">
      <label class="control-label col-sm-2" for="">Celular:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="telefono2" value="<%=datos.getTelefono2()%>" disabled>
      </div>
    </div>
     <div class="form-group">
      <label class="control-label col-sm-2" for="">Direccion:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="telefono2" value="<%=datos.getDireccion()%>" disabled>
      </div>
    </div>

	
	<h4>TAMAÑO:</h4>
        <div class="radio">
          <label><input type="radio" name="optradio">Pequeña</label>
        </div>
        <div class="radio">
          <label><input type="radio" name="optradio">Mediana</label>
        </div>
        <div class="radio">
          <label><input type="radio" name="optradio">Grande</label>
        </div>	
        

	<h4>INGREDIENTES:</h4>

        <label class="checkbox-inline"><input type="checkbox" value="">extra queso</label>
        <label class="checkbox-inline"><input type="checkbox" value="">Peperoni</label>
        <label class="checkbox-inline"><input type="checkbox" value="">Sausage</label><br>
            <label class="checkbox-inline"><input type="checkbox" value="">Mushrooms</label>
        <label class="checkbox-inline"><input type="checkbox" value="">Black Olives</label>
        <label class="checkbox-inline"><input type="checkbox" value="">Tomate</label><br>
            <label class="checkbox-inline"><input type="checkbox" value="">Cebollas</label>
        <label class="checkbox-inline"><input type="checkbox" value="">Anchovies</label>
        <label class="checkbox-inline"><input type="checkbox" value="">Pimiento</label><br>
        
	
	

<input type="submit" name="" value="Enviar">


</form>

	</div>

<script src="bootstrap/js/jquery.min.js"></script>
  <script src="bootstrap/js/bootstrap.min.js"></script>


    </body>
</html>
<% }else{
            response.sendRedirect("Admin/index.jsp");
            }
}
         %>