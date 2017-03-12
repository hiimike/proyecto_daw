/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import clases.usuario;
import datos.crudUsuario;
import datos.cruddatosUsuarios;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
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
@WebServlet(name = "AdminController", urlPatterns = {"/AdminController"})
public class AdminController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
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
       if(null!=request.getParameter("consult")){
        try{
            HttpSession sesion = request.getSession();
            List<usuario> lista;
            crudUsuario read= new crudUsuario();
            lista = read.getUsuarios();
           
                    
               sesion.setAttribute("lista_usuarios", lista);
               response.sendRedirect("Admin/index.jsp");
       
        }catch(IOException e)
            {
              response.setContentType("text/html;charset=UTF-8");
               try (PrintWriter out = response.getWriter()) {
                    out.println(e);
                   }
               } catch (SQLException ex) {
            Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
        }
       }else if(null!=request.getParameter("id")){
           
           crudUsuario c = new crudUsuario();
           usuario pro;
             try {
                 pro = c.getUsuarioById(Integer.parseInt(request.getParameter("id")));
                 HttpSession sesion = request.getSession();
                    sesion.setAttribute("cod", pro.getUsuario_id());
                    sesion.setAttribute("name", pro.getUser());
                    sesion.setAttribute("email",pro.getEmail());
                    sesion.setAttribute("password",pro.getPass());
                    sesion.setAttribute("rol", pro.getId_rol());
                    response.sendRedirect("Admin/modificar.jsp");
             } catch (SQLException ex) {
                 Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
             }
           
           
       
       
       }else if(null!=request.getParameter("delete")){
           crudUsuario c = new crudUsuario();
            boolean resp=false;
           try {
               resp=c.deleteUsuario(Integer.parseInt(request.getParameter("delete")));
           } catch (SQLException ex) {
               Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
           }
            
           
            if(resp){
                String msg="Cliente eliminado";
                HttpSession sesion = request.getSession();
                List<usuario> lista;
                crudUsuario read= new crudUsuario();
               try {
                   lista = read.getUsuarios();
                   sesion.setAttribute("lista_usuarios", lista);
                   response.sendRedirect("Admin/index.jsp?msg="+msg);
               } catch (SQLException ex) {
                   Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
               }
           
                    
               
            }
       
       
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
        if(request.getParameter("modificar")!=null&&request.getParameter("pass")!=null&&request.getParameter("user")!=null&&request.getParameter("email")!=null){
           
            if (!"".equals(request.getParameter("user"))&&!"".equals(request.getParameter("pass"))&&!"".equals(request.getParameter("email"))) {
                usuario u=new usuario();
                u.setUsuario_id(Integer.parseInt(request.getParameter("cod")));
                u.setUser(request.getParameter("user"));
                u.setEmail(request.getParameter("email"));
                u.setPass(request.getParameter("pass"));
                
                crudUsuario mod= new crudUsuario();
             boolean resp=false;
                try {
                    resp = mod.updateUsuario(u);
                } catch (SQLException ex) {
                    Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
                }
                if(resp){
                     HttpSession sesion = request.getSession();
                List<usuario> lista;
                crudUsuario read= new crudUsuario();
                     try {
                   lista = read.getUsuarios();
                   sesion.setAttribute("lista_usuarios", lista);
                   String msg= "Cliente modificado";
                    response.sendRedirect("Admin/index.jsp?msg="+msg);
                   
               } catch (SQLException ex) {
                   Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
               }
                    
                }
            }
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

}
