
package model;

/**
 *
 * @author Habiba Saim
 * 
 * Connects to KMAT DB
 */
import java.sql.*;

public class ConnectionManager {
    
    static Connection con;
    static String url;
            
    public static Connection getConnection(){    

        try{
            String username = "root";
            String password = "root";            
            String url = "jdbc:mysql://localhost:3306/kmat";    

            Class.forName("com.mysql.jdbc.Driver");
            try{                     	
               con = DriverManager.getConnection(url, username, password);  
            }

            catch (SQLException ex){            
               ex.printStackTrace();
            }
        }

        catch(ClassNotFoundException e){
       
          System.out.println(e);
        }
        return con;
    }  
    
    /*
     * Close open database connection
     */
    public static void putConnection(Connection conn) 
    {
        if (conn != null) 
        {
            try {           
                conn.close(); 
            }
          catch (SQLException e) {
            System.out.println("Unable to close DB connection");
            e.printStackTrace();
          }
        }
    }
}
