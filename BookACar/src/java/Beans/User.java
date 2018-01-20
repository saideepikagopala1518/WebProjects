package Beans;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.*;
import database.Db_Connection;
import java.util.logging.Level;
import java.util.logging.Logger;

public class User 
{
    private String user,pwd;
    
    public User()
    {
        user="";
        pwd="";
    }        
 
    //----------------------------------//

    public String getUser() 
    {
        return user;
    }

    public String getPwd() 
    {
        return pwd;
    }


    public void setUser(String user) 
    {
        this.user=user;
    }

    public void setPwd(String pwd) 
    {
        this.pwd=pwd;
    }
    
    //----------------------------------//
      
    public boolean RegisterUser()
    {
        boolean usern = false;
        try
        {    
            Db_Connection dbconn=new Db_Connection();
            Connection myconnection= dbconn.Connection();
            PreparedStatement ps1 =myconnection.prepareStatement("select username from registereduserstable where username=?");
            ps1.setString(1, user);
            ResultSet rs1 = ps1.executeQuery();
            usern = rs1.next();
            if(!usern){
               String sqlString="INSERT INTO registereduserstable (username,password) VALUES ('"+user+"','"+pwd+"')";
            
                Statement myStatement = myconnection.createStatement();
            
                 try
                {    
                    myStatement.executeUpdate(sqlString);
                    myStatement.close();
                    myconnection.close();
                } catch (SQLException ex) {Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);}
            }
        }
            catch (SQLException ex) {Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);}
        return usern;
    }
    
    //----------------------------------//
    
    public static boolean LoginUser(String user,String pwd) 
    {
            boolean check =false;
            try 
            {      
                Db_Connection dbconn=new Db_Connection();
                Connection myconnection= dbconn.Connection();
                
                PreparedStatement ps1 =myconnection.prepareStatement("select * from registereduserstable where username=? and password=?");

                ps1.setString(1, user);
                ps1.setString(2, pwd);
                ResultSet rs1 =ps1.executeQuery();
                check = rs1.next();

                myconnection.close();        
            }catch(Exception e){e.printStackTrace();}
            
            return check;    
    }
    
    //----------------------------------//
    
    public void GetUser()
    {
            try 
            {      
                Db_Connection dbconn=new Db_Connection();
                Connection myconnection= dbconn.Connection();
                
                String sqlString = "SELECT * FROM registereduserstable WHERE username = '"+user+"'";
                Statement myStatement = myconnection.createStatement();
                ResultSet rs=myStatement.executeQuery(sqlString);

                while(rs.next())
                {
                    user= rs.getString("username");
                    pwd = rs.getString("password");
                }
                
                myStatement.close();
                myconnection.close();
                
            } catch (SQLException ex) {Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);} 
            
    }
    
    //----------------------------------//

}