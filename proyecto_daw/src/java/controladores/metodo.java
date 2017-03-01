/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author Alexis
 */
public class metodo {
    String usuario;
    String correo;
    String clave;

    public metodo (String usuario, String correo, String clave)
    {
        this.usuario=usuario;
        this.correo = correo;
        this.clave=clave;
    }
    
    public String getUsuario() {
        return usuario;
    }

    public String getCorreo() {
        return correo;
    }

    public String getClave() {
        return clave;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }
    public boolean nuevo(int codigo, String nombre, String correo, String clave){
        try {
            conexion db=new conexion();
            Connection cn=db.Conectar();
            PreparedStatement ps=cn.prepareStatement("insert into proyecto_daw values(?,?,?,?)");
            
            ps.setInt(1, codigo);
            ps.setString(2, nombre);
            ps.setString(3, correo);
            ps.setString(4, clave);
            
            if(ps.execute()){
                throw new NullPointerException("Lo sentimos no se pudo insertar");
            }
        } catch (Exception e) {
        }
        return true;
    }
    
     public boolean modificar(int codigo, String nombre, String correo, String clave){
        try {
            conexion db=new conexion();
            Connection cn=db.Conectar();
            PreparedStatement ps=cn.prepareStatement("update proyecto_daw set usuario=?, correo=?, clave=?"+" where codigo=?");
            
            ps.setInt(1, codigo);
            ps.setString(2, nombre);
            ps.setString(3, correo);
            ps.setString(4, clave);
            
            if(ps.execute()){
                throw new NullPointerException("Lo sentimos no se pudo Modificar");
            }
        } catch (Exception e) {
        }
        return true;
}
     
     public boolean eliminar(String nombre){
        try {
            conexion db=new conexion();
            Connection cn=db.Conectar();
            PreparedStatement ps=cn.prepareStatement("delete From proyecto_daw where codigo=?");
            
            ps.setString(1, nombre);
            
            if(ps.execute()){
                throw new NullPointerException("Lo sentimos no se pudo Eliminar");
            }
            
        } catch (Exception e) {
        }
        return true;
    }
}
