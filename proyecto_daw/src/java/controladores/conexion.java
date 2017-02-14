/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;
import java.sql.*;
/**
 *
 * @author ice
 */
public class conexion {
       
    private final String driver="com.mysql.jdbc.Driver";
    private final String url = "jdbc:mysql://br-cdbr-azure-south-b.cloudapp.net:3306/proyecto_daw";
    private final String user="b4de1072652360";
    private final String pass="8cccd54c";
    Connection cn;
    
    public conexion(){
  
    }
    
    public Connection Conectar(){
        cn =null;
    
        try{
            
            Class.forName(driver);
            cn= DriverManager.getConnection(url,user,pass);
            
            return cn;
            
        }catch(ClassNotFoundException | SQLException e){
            
        }
        return cn;
    }
}
