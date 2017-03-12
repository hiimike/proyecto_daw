<%-- 
    Document   : index
    Created on : 10-mar-2017, 4:52:47
    Author     : ice
--%>
<%@page import="java.util.List"%>
<%@page import="clases.usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>

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
            else{
        %>
<continue>
    
    
    
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clientes</title>
      <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
 <script src="../bootstrap/js/jquery.min.js"></script>
  <script src="../bootstrap/js/bootstrap.min.js"></script>
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
        <h1>Clientes</h1>
        <button class="btn btn-success" type="button" onclick="window.location.href='../AdminController?consult=true';" >Listado de Clientes</button>
   
        <% if(request.getParameter("msg")!=null){ %>
            <div class="alert alert-success" style="margin-top:40px;margin-bottom: 0;">
                <strong><%=request.getParameter("msg")%></strong>
                </div> <% }  %>
    </center>
    
    <%
        if(s.getAttribute("lista_usuarios")==null){
            
            
           %>
           
       <div class="container">
         <table class="table">
                 <thead>
                 <tr>
                 <th>
                     Codigo del Cliente
                 </th>
                 <th>
                     Usuario
                 </th>
               
                 <th>
                     Email
                 </th>
                  <th>
                     Operaciones
                 </th>
                 </tr>
                 </thead>
                 <tbody>
                 </tbody>
         </table>
           
           
           
           <%
            
            
            
        }else{
        
%>
<continue>

        
        <div class="container">
         <table class="table">
                 <thead>
                     <tr>
                 <th>
                     Codigo del cliente
                 </th>
                 <th>
                    Usuario
                 </th>
              
                 <th>
                     Email
                 </th>
                  <th>
                     Operaciones
                 </th>
                 </tr>
                 </thead>
                 <tbody>
        <%
          
            List<usuario> lista =(List)s.getAttribute("lista_usuarios");
             for(usuario list:lista){%>
             <tr>
                 <td>
                     <%
                         out.println(list.getUsuario_id());
                        %>
                 </td>
                 <td>
                     <%
                         out.println(list.getUser());
                        %>
                 </td>
               
                 <td>
                     <%
                         out.println(list.getEmail());
                        %>
                 </td>
           
                 <td>
                     <div class="btn-group">
                    <button type="button" name="mod" class="btn btn-primary" onclick="window.location.href='../AdminController?id=<%  out.print(list.getUsuario_id()); %>';"><span class="glyphicon glyphicon-pencil"></span></button>
                    <button type="button" name="delete" class="btn btn-danger"  onclick="window.location.href='../AdminController?delete=<%  out.print(list.getUsuario_id()); %>';"><span class="glyphicon glyphicon-remove"></span></button>
                   
</div>
                 </td>
             </tr>
                 <%}}}
}
%>
             
             
        
            </tbody>    
             </table>
        

        
</div>
        
        
     
        
        
        
        
        

      
       

    </body>
</html>
