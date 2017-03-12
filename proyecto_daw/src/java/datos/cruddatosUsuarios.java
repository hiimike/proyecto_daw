/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datos;

import clases.datosUsuario;
import controladores.conexion;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author ice
 */
public class cruddatosUsuarios {
    private datosUsuario user;
    private conexion conect;
    private Connection cn;
    private String query;
    private boolean resp;
    
    
    
    
    public  boolean createdatosUsuario(datosUsuario datos) throws SQLException{
   
   try{
        resp=false;
         conect = new conexion();
        cn = conect.Conectar();
        query= "Insert into proyecto_daw.dusuarios values ('"+datos.getCedula()+"',"
                + "'"+datos.getNombres()+"','"+datos.getApellidos()+"'"
                + ",'"+datos.getDireccion()+"','"+datos.getTelefono1()+"'"
                + ",'"+datos.getTelefono2()+"',"+datos.getId_usuario()+");";
        Statement st= cn.createStatement();
        st.executeUpdate(query);
        resp = true;
        }catch(SQLException e){
         System.out.println("error al insertar datos");

        }finally{
            cn.close();
        }
   
   
   return resp;
   } 
    
  public datosUsuario getdatosUsuario(int cod_cliente) throws SQLException{
   
   try{
        conect = new conexion();
        cn =  conect.Conectar();
        query= "Select * from proyecto_daw.dusuarios where id_usuario ="+cod_cliente+";";
        Statement st= cn.createStatement();
        ResultSet rs = st.executeQuery(query);
           while(rs.next()){
                user = new datosUsuario(rs.getString(1),rs.getString(2),
                        rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getInt(7));
           }
        }catch(SQLException e){
         System.out.println("error al recuperar datos de usuario");

        }finally{
            cn.close();
        }
   
   
   return user;
   } 
  
   public  boolean updatedatosUsuario(datosUsuario datos) throws SQLException{
   
   try{
        conect = new conexion();
        resp=false;
        cn = conect.Conectar();
        query= "Update proyecto_daw.dusuarios set "
                + " nombres='"+datos.getNombres()+"',apellidos='"+datos.getApellidos()+"'"
                + ",direccion='"+datos.getDireccion()+"',telefono1='"+datos.getTelefono1()+"'"
                + ",telefono2='"+datos.getTelefono2()+"' where cedula = '"+datos.getCedula()+"'; ";
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
   
   
 public  boolean deletedatosUsuario(int id) throws SQLException{
   
   try{
        conect = new conexion();
        resp=false;
        cn = conect.Conectar();
        query= "delete from proyecto_daw.dusuarios where id_usuario = "+id+";";
        Statement st= cn.createStatement();
        st.executeUpdate(query);
        resp = true;
        }catch(SQLException e){
         System.out.println("error al eliminar  datos de usuario");

        }finally{
            cn.close();
        }
   
   
   return resp;
   } 
   
}
