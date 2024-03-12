package model;

import java.sql.Connection;
import java.sql.DriverManager;

public class Database {
    public static Connection getConnection(){
        String URL = "jdbc:mysql://localhost:3306/SmartShare?useSSL=true";
        String username = "root";
        String password = "root";
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL,username,password);
            return con;
        }catch(Exception e){
            System.out.println("Database.getConnection() Error --" + e.getMessage());
            return null;
        }
    }
    
    public static void close(Connection con){
        try{
            con.close();
        }
        catch(Exception e){
            
        }
    }
}
