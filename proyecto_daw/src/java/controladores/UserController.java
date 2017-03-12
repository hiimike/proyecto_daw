/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import clases.datosUsuario;
import clases.usuario;
import datos.crudUsuario;
import datos.cruddatosUsuarios;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ice
 */
@WebServlet(name = "UserController", urlPatterns = {"/UserController"})
public class UserController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
    
                        
          String method = request.getMethod();
          if ("POST".equals(method)){
              String peticion = request.getParameter("peticion");
                if("login".equals(peticion))
                    login(request,response);
                else if ("logout".equals(peticion))
                    logout(request,response);
                else if ("register".equals(peticion))
                    register(request,response);
                else if ("update".equals(peticion))
                    update(request,response);
          }else if ("GET".equals(method)){
          

    }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public void login(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
       String usuario = request.getParameter("user");
       String pass = request.getParameter("password");
       if(!"".equals(usuario) || !"".equals(pass)){
            crudUsuario u;
            u = new crudUsuario();
            try{
                
            usuario datos = u.getUsuario(usuario, pass);
            if(datos !=null){
            if(datos.getId_rol()==1){
                HttpSession se = request.getSession();
                se.setAttribute("usuario", datos);
                response.sendRedirect("Admin/index.jsp");
            }
            if(datos.getId_rol()==2){
                HttpSession se = request.getSession();
                se.setAttribute("usuario", datos);
                response.sendRedirect("index.jsp");
                }
            }else{
                    response.setContentType("text/html;charset=UTF-8");
                    try (PrintWriter out = response.getWriter()) {
                        out.println("Credenciales equivocadas");
                    }
                
                }
           
            }catch(SQLException e)
            {
                           } 

             
      }else{
           response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("Credenciales vacias");
        }
       }
    }

    private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
    
       HttpSession session;  
       session = request.getSession();
       session.invalidate();  
       response.sendRedirect("index.jsp");
    
    }
    
  private void register(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
    String nombres = request.getParameter("nombres");
    String apellidos = request.getParameter("apellidos");
    String email = request.getParameter("email");
    String pass = request.getParameter("password");
    String cedula = request.getParameter("cedula");
    String usuario = request.getParameter("user");
    
    if("".equals(nombres) || "".equals(apellidos) || "".equals(email) || "".equals(pass) || "".equals(cedula) || "".equals(usuario)){
     response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("Todos los campos son obligatorios");
        }
    }else{
        crudUsuario c = new crudUsuario();
        usuario user = new usuario();
        user.setEmail(email);
        user.setId_rol(2);
        user.setPass(pass);
        user.setUser(usuario);
        boolean resp = c.createUsuario(user);
        if (resp){
            int id_usuario = c.getIdUsuario(user);
            if(id_usuario!=0){
            cruddatosUsuarios d = new cruddatosUsuarios();
            datosUsuario datos = new datosUsuario(cedula,nombres,apellidos,"","","",id_usuario);
            d.createdatosUsuario(datos);
            String msg = "Usuario creado";
            response.sendRedirect("index.jsp?msg="+msg);
        }
         }else{
            String msg = "Error al crear usuario";
            response.sendRedirect("index.jsp?error="+msg);
 
      }
            
        }
    }
    
  
  
   private void update(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
    String nombres = request.getParameter("nombres");
    String apellidos = request.getParameter("apellidos");
    String address = request.getParameter("address");
    String telefono1 = request.getParameter("telefono1");
    String telefono2 = request.getParameter("telefono2");
    String cedula = request.getParameter("cedula");
    
    if("".equals(nombres) || "".equals(apellidos) || "".equals(cedula) || "".equals(address) || "".equals(telefono1) || "".equals(telefono2) ){
     String msg = "Todos los campos son obligatorios";
            response.sendRedirect("datos.jsp?error="+msg);
        
    }else{           
            cruddatosUsuarios d = new cruddatosUsuarios();
            datosUsuario datos = new datosUsuario(cedula,nombres,apellidos,address,telefono1,telefono2);
            boolean resp = d.updatedatosUsuario(datos);
            if(resp){
            
            String msg = "Datos Actualizados";
            response.sendRedirect("datos.jsp?msg="+msg);
        
         }else{
            String msg = "Error al Actualizar datos";
            response.sendRedirect("datos.jsp?error="+msg);
 
      }
            
        }
    }
    
    
    }


