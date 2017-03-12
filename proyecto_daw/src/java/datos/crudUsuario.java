/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datos;


import clases.usuario;
import controladores.conexion;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ice
 */
public class crudUsuario {
    List<usuario> listaUsuarios;
    private usuario user;
    private usuario u;
    private conexion conect;
    private Connection cn;
    private String query;
    private boolean resp;
    

    
    
    
 public  boolean createUsuario(usuario datos) throws SQLException{
   
   try{
        resp=false;
        conect = new conexion();
        cn = conect.Conectar();
        query= "insert into proyecto_daw.usuarios (usuario,correo,clave,id_rol) values ('"+datos.getUser()+"',"
                + "'"+datos.getEmail()+"',"
                + "'"+datos.getPass()+"',"
                + ""+datos.getId_rol()+");";
        Statement st= cn.createStatement();
        st.executeUpdate(query);
        resp = true;
        }catch(SQLException e){
         System.out.println("error al crear usuario");

        }finally{
            cn.close();
        }
   
   
   return resp;
   } 
  public usuario getUsuario(String user, String pass) throws SQLException{
    
   try{
        
        conect = new conexion();
         cn =  conect.Conectar();
        query= "Select * from proyecto_daw.usuarios where (usuario = '"+user+"' or correo = '"+user+"') and clave='"+pass+"';";
        Statement st= cn.createStatement();
        ResultSet rs = st.executeQuery(query);
          while(rs.next()){
                u=new usuario();
                u.setUsuario_id(rs.getInt(1));
                u.setUser(rs.getString(2));
                u.setEmail(rs.getString(3));
                u.setPass(rs.getString(4));
                u.setId_rol(rs.getInt(5));
          }
       
        }catch(SQLException e){
         System.out.println("error al recuperar datos de usuario");

        }finally{
            cn.close();
        }
   
   
   return u;
   } 
  
  
  public usuario getUsuarioById(int id) throws SQLException{
    
   try{
        
        conect = new conexion();
         cn =  conect.Conectar();
        query= "Select * from proyecto_daw.usuarios where usuario_id="+id+";";
        Statement st= cn.createStatement();
        ResultSet rs = st.executeQuery(query);
          while(rs.next()){
                u=new usuario();
                u.setUsuario_id(rs.getInt(1));
                u.setUser(rs.getString(2));
                u.setEmail(rs.getString(3));
                u.setPass(rs.getString(4));
                u.setId_rol(rs.getInt(5));
          }
       
        }catch(SQLException e){
         System.out.println("error al recuperar datos de usuario");

        }finally{
            cn.close();
        }
   
   
   return u;
   } 
  
   public int getIdUsuario(usuario u) throws SQLException{
    int id = 0;
   try{
        
        conect = new conexion();
        cn =  conect.Conectar();
        query= "Select usuario_id from proyecto_daw.usuarios where (usuario = '"+u.getUser()+"' or correo = '"+u.getUser()+"') and clave='"+u.getPass()+"';";
        Statement st= cn.createStatement();
        ResultSet rs = st.executeQuery(query);
          while(rs.next()){
                id = rs.getInt(1);
          }
       
        }catch(SQLException e){
         System.out.println("error al recuperar datos de usuario");

        }finally{
            cn.close();
        }
   
   
   return id;
   } 
    
public  List<usuario> getUsuarios() throws SQLException{
   
   try{
       conect = new conexion();
        cn = conect.Conectar();
        listaUsuarios= new ArrayList();
        query= "Select * from usuarios where id_rol=2";
        Statement st= cn.createStatement();
        ResultSet rs = st.executeQuery(query);
           while(rs.next()){
             user = new usuario(rs.getInt(1),rs.getString(2),
                        rs.getString(3),rs.getString(4),rs.getInt(5));
                listaUsuarios.add(user);
           }
        }catch(SQLException e){
         System.out.println("error al recuperar  usuarios");

        }finally{
            cn.close();
        }
   
   
   return listaUsuarios;
   } 

 public  boolean updateUsuario(usuario datos) throws SQLException{
   
   try{
       conect = new conexion();
        resp=false;
        cn = conect.Conectar();
        query= "Update proyecto_daw.usuarios set "
                + " usuario='"+datos.getUser()+"',correo='"+datos.getEmail()+"'"
                + ",clave='"+datos.getPass()+"'where usuario_id = "+datos.getUsuario_id()+"; ";
        Statement st= cn.createStatement();
        st.executeUpdate(query);
        resp = true;
        }catch(SQLException e){
         System.out.println("error al modificar datos");

        }finally{
            cn.close();
        }
   
   
   return resp;
   }

public boolean deleteUsuario(int user_id) throws SQLException{
   
    cruddatosUsuarios obj = new cruddatosUsuarios();
    if(obj.deletedatosUsuario(user_id)){
            try{
                conect = new conexion();

                 resp=false;
                 cn = conect.Conectar();
                 query= "delete from proyecto_daw.usuarios where usuario_id= "+user_id+";";
                 Statement st= cn.createStatement();
                 st.executeUpdate(query);
                 resp = true;
                 }catch(SQLException e){
                  System.out.println("error al eliminar  datos de usuario");

                 }finally{
                     cn.close();
                 }


            return resp;
   } else 
   return false;
}
}
