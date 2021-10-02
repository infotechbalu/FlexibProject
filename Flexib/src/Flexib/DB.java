package Flexib;
import java.io.*;
import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;
 
public class DB
{
    //Statement statement = connection.createStatement();
    Statement statement = null;
    private Connection connection=null;
    private ResultSet rs = null;
    String connectionURL = "jdbc:derby:Database;create=true";
 
    public DB()
    {
     try {
       //Load the database driver
      Class.forName("org.apache.derby.jdbc.EmbeddedDriver").newInstance();
       //Get a Connection to the database
      connection = DriverManager.getConnection(connectionURL);
     }
     catch(Exception e){
       System.out.println("Exception is ;" + e);
     }
 
    }
   public ResultSet retrieveData(){
      String sql = "SELECT * FROM USERS";
      try{
            statement = connection.createStatement();
            rs = statement.executeQuery(sql);
      }
      catch(Exception e){
       System.out.println("Exception is ;" + e);
      }
    //trying to return the result set object
    return rs;
    }
    public void closeDBConnection(){
        // close DB connection after retrieval is completed.
      try{
        rs.close();
        statement.close();
        connection.close();
      }
      catch(Exception e){
       System.out.println("Exception is ;" + e);
      }
    }
}
