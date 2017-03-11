/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

/**
 *
 * @author ice
 */
public class usuario {

  
    protected int usuario_id;
    protected String user;
    protected String pass;
    protected String email;
    protected int id_rol;
    
      public usuario() {
    }

    public usuario(int usuario_id, String user, String email, String pass, int id_rol) {
        this.usuario_id = usuario_id;
        this.user = user;
        this.pass = pass;
        this.email = email;
        this.id_rol = id_rol;
    }

    public int getUsuario_id() {
        return usuario_id;
    }

    public void setUsuario_id(int usuario_id) {
        this.usuario_id = usuario_id;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getId_rol() {
        return id_rol;
    }

    public void setId_rol(int id_rol) {
        this.id_rol = id_rol;
    }
    
    
}
