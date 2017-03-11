<%-- 
    Document   : index
    Created on : 10-mar-2017, 4:57:55
    Author     : ice
--%>

<%@page import="clases.usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%
    HttpSession s =request.getSession();
        if(s.getAttribute("usuario")!=null){
            
            usuario u = (usuario)s.getAttribute("usuario");
            int role=u.getId_rol();
            if(role!=2)
            response.sendRedirect("Admin/index.jsp");
        }else
        
%>
<continue>
<!DOCTYPE html>
<html lang="en">
<head>
 
  <title>Pizzaeria</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <link href="bootstrap/css/main.css" rel="stylesheet" type="text/css">
 <script src="bootstrap/js/jquery.min.js"></script>
  <script src="bootstrap/js/bootstrap.min.js"></script>

</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">

<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#myPage">PIZZERIA</a>
    </div>
    <% if(s.getAttribute("usuario")==null){ %>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="#about">NOSOTROS</a></li>
        <li><a href="#pricing">PRECIOS</a></li>
        <li><a href="#contact">CONTACTO</a></li>
        <li><a href="pedido.jsp">ARMA TU PEDIDO</a></li>
      </ul>
          <ul class="nav navbar-nav navbar-right">
             <li><a href="" data-toggle="modal" data-target="#register" ><span class="glyphicon glyphicon-user"></span> Registrarse</a></li>
        <li><a href='' data-toggle="modal" data-target="#login"><span class="glyphicon glyphicon-log-in"></span> Iniciar sesion</a></li>
         </ul>
    </div>
        

  <!-- Modal -->
  <div class="modal fade" id="login" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Iniciar Sesion</h4>
        </div>
        <div class="modal-body">
   
            <form id="form-login" action="UserController" method="POST">
                <div class="form-group">
                  <label for="user">Usuario o Correo:</label>
                  <input type="text" class="form-control" id="user" name="user" placeholder="Usuario o Correo" required>
                </div>
                <div class="form-group">
                  <label for="password">Contraseña:</label>
                  <input type="password" class="form-control" id="password" name="password" placeholder="Contraseña" required>
                </div>
                <div id="msg">
                    
                </div>

                <button type="submit" id="peticion" name="peticion" value="login" class="btn btn-success">Inicio</button>
              </form>
</div>

        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
  
   <!-- Modal -->
  <div class="modal fade" id="register" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Registrarse</h4>
        </div>
        <div class="modal-body">
   
            <form action="UserController" method="POST">
            
                 <div class="form-group">
                  <label for="nombres">Nombres:</label>
                  <input type="text" class="form-control" id="nombres" name="nombres" placeholder="Nombres" required>
                </div>
                 <div class="form-group">
                  <label for="apellidos">Apellidos:</label>
                  <input type="text" class="form-control" id="apellidos" name="apellidos" placeholder="Apellidos" required>
                </div>
                 <div class="form-group">
                  <label for="user">Cedula:</label>
                  <input type="text" class="form-control" id="cedula" name="cedula" placeholder="Cedula" required>
                </div>
                
              <div class="form-group">
                  <label for="user">Correo:</label>
                  <input type="email" class="form-control" id="email" name="email" placeholder="Email" required>
                </div>
                 <div class="form-group">
                  <label for="user">Usuario:</label>
                  <input type="text" class="form-control" id="user" name="user" placeholder="Usuario" required>
                </div>
                <div class="form-group">
                  <label for="password">Contraseña:</label>
                  <input type="password" class="form-control" id="password" name="password" placeholder="Contraseña" required>
                </div>
               
                <button type="submit" name="peticion" value="register" class="btn btn-success">Registrarse</button>
              </form>
       

                    </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
       
    <% }else{ %>
     <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="#about">NOSOTROS</a></li>
        <li><a href="#pricing">PRECIOS</a></li>
        <li><a href="#contact">CONTACTO</a></li>
       <li><a href="pedido.jsp">ARMA TU PEDIDO</a></li>
      </ul>
           <ul class="nav navbar-nav navbar-right">
               <li><a href="#" onclick="document.getElementById('form-id').submit();"> Cerrar Sesión </a></li>
               <li><a><form action="UserController" method="POST" id="form-id">
                           <input type="hidden" name="peticion" value="logout">
            </form></a></li>
      </ul>
    </div>
     <% } %>
  </div>
</nav>
  <% if(request.getParameter("msg")!=null){ %>
  <div class="alert alert-success" style="margin-top:40px;margin-bottom: 0;">
      <strong><%=request.getParameter("msg")%></strong>
</div> <% }  %>
<% if(request.getParameter("error")!=null){ %>
  <div class="alert alert-danger" style="margin-top:40px;margin-bottom: 0;">
      <strong><%=request.getParameter("error")%></strong>
</div> <% }  %>

<img class="img-responsive" src="http://www.dominos.com.ec/images/slider/pizza_mitad_precio.jpg">

<div class="jumbotron text-center">
  <h1>Pizzeria</h1> 
   

 
</div>

<!-- Container (About Section) -->
<div id="about" class="container-fluid">
  <div class="row">
    <div class="col-sm-8">
      <h2>Nosotros</h2><br>
      <h4>La Historia</h4><br>
      <p>Un año más tarde James cambió su parte del negocio a su hermano Tom por su auto Volkswagen escarabajo y desde entonces nada volvió a ser lo mismo. Al poco tiempo se cambió de nombre a Domino´s Pizza, creando un nuevo logo, en colores rojo y azul, con 3 puntos blancos, los cuales representaban a cada tienda existente hasta ese entonces. Originalmente un nuevo punto blanco sería agregado por cada nueva tienda, pero esta idea fue imposible de cumplir, pues rápidamente se dio cuenta que la realidad fue mayor que el sueño.

En 1967 se apertura la primera franquicia fuera del estado de Michigan y poco a poco, después de algunos tropiezos en el camino, empieza a crecer firmemente a pasos agigantados. Para 1989 la empresa había abierto 5000 tiendas en EEUU, lo que le llevó a ser reconocido como la organización de alimentos de más rápido crecimiento en la historia.

</p>

    </div>
    <div class="col-sm-4">
      
    </div>
  </div>


<div class="container-fluid bg-grey">
  <div class="row">
    <div class="col-sm-4">
      
    </div>
    <div class="col-sm-8">
     <br>
      <p>Reconocida en el mundo como pionera y líder indiscutible mundial en el negocio de reparto de pizzas. Domino´s Ecuador abre sus puertas en 1995 a través de su franquicia maestra ALISERVIS S.A.

          Creadores del 30 minutos o gratis, del tradicional martes 2x1 y 2da. pizza a mitad de precio. Domino´s Ecuador ha pasado de ser una marca que ofertaba pizzas de calidad a domicilio, a una marca que oferta una variedad extensa de productos que permiten compartir momentos de felicidad con los seres queridos. Tenemos más de 15 diferentes ingredientes los cuales pueden ser combinados a gusto y preferencia de los consumidores. Adicionalmente tenemos 11 diferentes especialidades, desarrollados por chefs de Domino´s Internacional, variedades de masa como la deliciosa Pan Pizza o la Domino’s Artisan. También disponemos de una variedad de adicionales que incluyen: pancitos, calzones, sánduches, ensaladas, alitas, postres y gaseosas. Afianzando cada día más nuestro slogan "Domino´s, ¡más que pizza, es felicidad!.</p><br>
      
    </div>
  </div>
</div>

</div>

<!-- Container (Pricing Section) -->
<div id="pricing" class="container-fluid">
  <div class="text-center">
    <h2>Menu</h2>
 
  </div>
  <div class="row slideanim">
    <div class="col-sm-4 col-xs-12">
      <div class="panel panel-default text-center">
    
      
        <div class="panel-body">
    <img class="img-responsive" src="http://www.dominos.com.ec/images/nuevo_menu/estandar.png">
        </div>
    
      </div>      
    </div>     
    <div class="col-sm-4 col-xs-12">
      <div class="panel panel-default text-center">

        <div class="panel-body">
            <img class="img-responsive" src="http://www.dominos.com.ec/images/nuevo_menu/premium.png">
        </div>
   
      </div>      
    </div>       
    <div class="col-sm-4 col-xs-12">
      <div class="panel panel-default text-center">

        <div class="panel-body">
            <img class="img-responsive" src="http://www.dominos.com.ec/images/nuevo_menu/superpremium.png">
        </div>
 
      </div>      
    </div>    
  </div>
</div>

<!-- Container (Contact Section) -->
<div id="contact" class="container-fluid bg-grey">
  <h2 class="text-center">CONTACTANOS</h2>
  <div class="row slideanim">
    <div class="col-sm-5">
      <p>Contact us and we'll get back to you within 24 hours.</p>
      <p><span class="glyphicon glyphicon-map-marker"></span> Chicago, US</p>
      <p><span class="glyphicon glyphicon-phone"></span> +00 1515151515</p>
      <p><span class="glyphicon glyphicon-envelope"></span> myemail@something.com</p>
    </div>
    <div class="col-sm-7 slideanim">
      <div class="row">
        <div class="col-sm-6 form-group">
          <input class="form-control" id="name" name="name" placeholder="Name" type="text" required>
        </div>
        <div class="col-sm-6 form-group">
          <input class="form-control" id="email" name="email" placeholder="Email" type="email" required>
        </div>
      </div>
      <textarea class="form-control" id="comments" name="comments" placeholder="Comment" rows="5"></textarea><br>
      <div class="row">
        <div class="col-sm-12 form-group">
          <button class="btn btn-default pull-right" type="submit">Send</button>
        </div>
      </div>
    </div>
  </div>
</div>






<footer class="container-fluid text-center">
  <a href="#myPage" title="To Top">
    <span class="glyphicon glyphicon-chevron-up"></span>
  </a>

</footer>



<script>
$(document).ready(function(){
  // Add smooth scrolling to all links in navbar + footer link
  $(".navbar a, footer a[href='#myPage']").on('click', function(event) {
    // Make sure this.hash has a value before overriding default behavior
    if (this.hash !== "") {
      // Prevent default anchor click behavior
      event.preventDefault();

      // Store hash
      var hash = this.hash;

      // Using jQuery's animate() method to add smooth page scroll
      // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
      $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 900, function(){
   
        // Add hash (#) to URL when done scrolling (default click behavior)
        window.location.hash = hash;
      });
    } // End if
  });
  
  $(window).scroll(function() {
    $(".slideanim").each(function(){
      var pos = $(this).offset().top;

      var winTop = $(window).scrollTop();
        if (pos < winTop + 600) {
          $(this).addClass("slide");
        }
    });
  });
});
</script>

</body>
</html>
