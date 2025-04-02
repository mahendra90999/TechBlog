package com.tech.blog.helper;
import java.sql.*;

public class ConnectionProvider {
    public static Connection con;
    
    public static Connection getConnection(){
        try {
            
            if(con==null){
                //            driver class load
                
               Class.forName("com.mysql.cj.jdbc.Driver");
               
//               create connection

                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/TechBlog","root","root1234");
            
            }
            
            
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
        return con;
    }
}
