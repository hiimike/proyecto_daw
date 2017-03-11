<%-- 
    Document   : pedido
    Created on : 10-mar-2017, 18:24:32
    Author     : ice
--%>

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
            if(role!=2)
            response.sendRedirect("Admin/index.jsp");
            else
        
%>
<continue>
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
 <script src="bootstrap/js/jquery.min.js"></script>
  <script src="bootstrap/js/bootstrap.min.js"></script>
    </head>
    <body>
         <nav class="navbar navbar-default">
  <div class="container">
           <ul class="nav navbar-nav navbar-right">
               <li><a href="#" onclick="document.getElementById('form-id').submit();"> Cerrar Sesión </a></li>
               <li><a><form action="UserController" method="POST" id="form-id">
                           <input type="hidden" name="peticion" value="logout">
            </form></a></li>
      </ul>
  </div>
       </nav>
<h1>Pizza Form</h1>
<form  class="form" method="post" >

<div class="personal">
	First Name : <input type="text" name="name"><br>
	Last Name : <input type="text" name="name2"><br>
	Phone : <input type="text" name="phone"><br>
</div>
	
	<div class="personal">
	Size: <br>
	<input type="radio" name="tamanio" value="1">Small <br>
	<input type="radio" name="tamanio" value="2">Medium<br>
	<input type="radio" name="tamanio" value="3">Large <br>		

	Toppings(check all that apply): <br>

	<input type="checkbox" name="">Extra Cheese &nbsp;
	<input type="checkbox" name=""> Peperoni &nbsp;
	<input type="checkbox" name=""> Sausage <br>
	<input type="checkbox" name=""> Mushrooms &nbsp;
	<input type="checkbox" name="">Black Olives &nbsp;
	<input type="checkbox" name=""> Green Peppers &nbsp;<br>
	<input type="checkbox" name=""> Tomatos &nbsp;
	<input type="checkbox" name=""> Onlions &nbsp;
	<input type="checkbox" name=""> Anchovies &nbsp;



	</div>

<input type="submit" name="" value="Enter my information">


</form>

    </body>
</html>
</continue>
<% } %>