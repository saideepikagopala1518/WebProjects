package Beans;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.*;
import database.Db_Connection;
import java.util.logging.Level;
import java.util.logging.Logger;

public class activeCart {
    private String car, user;
    private int quant, cartid;
    private float price;
    
    public activeCart(){
        car="";
        user="";
        quant=0;
        price=0;
    }
    
    public String getCar()
    {
        return car;
    }
    public String getUser()
    {
        return user;
    }
    
    public int getQuantity()
    {
        return quant;
    }
    
    public float getPrice()
    {
        return price;
    }
    
    public int getCartID()
    {
        return cartid;
    }
    
    public void setCar(String c){
        this.car=c;
    }
    
    public void setUser(String u){
        this.user=u;
    }
    
    public void setQuantity(int i){
        this.quant=i;
    }
    
    public void setPrice(float f){
        this.price=f;
    }
    
    public void addToCart(){
        try
        {    
            Db_Connection dbconn=new Db_Connection();
            Connection myconnection= dbconn.Connection();
            String sqlString="INSERT INTO activecarttable(addedCar, addedCarQTY, user, carPrice) VALUES ('"+car+"',"+quant+" ,'"+user+"',"+price+" )";
            
            
            Statement myStatement = myconnection.createStatement();
            
            try
            {    
                myStatement.executeUpdate(sqlString);
                myStatement.close();
                myconnection.close();
            } catch (SQLException ex) {Logger.getLogger(activeCart.class.getName()).log(Level.SEVERE, null, ex);}
        } catch (SQLException ex) {Logger.getLogger(activeCart.class.getName()).log(Level.SEVERE, null, ex);} 
    }
    
    public void deleteFromCart(int c){
        try
        {    
            Db_Connection dbconn=new Db_Connection();
            Connection myconnection= dbconn.Connection();
            String sqlString="DELETE FROM activecarttable WHERE cartID ="+c+"";
            
            
            Statement myStatement = myconnection.createStatement();
            
            try
            {    
                myStatement.executeUpdate(sqlString);
                myStatement.close();
                myconnection.close();
            } catch (SQLException ex) {Logger.getLogger(activeCart.class.getName()).log(Level.SEVERE, null, ex);}
        } catch (SQLException ex) {Logger.getLogger(activeCart.class.getName()).log(Level.SEVERE, null, ex);} 
    }
    
    public void deleteFromCart(String u){
        try
        {    
            Db_Connection dbconn=new Db_Connection();
            Connection myconnection= dbconn.Connection();
            String sqlString="DELETE FROM activecarttable WHERE user = '"+u+"'";
            
            
            Statement myStatement = myconnection.createStatement();
            
            try
            {    
                myStatement.executeUpdate(sqlString);
                myStatement.close();
                myconnection.close();
            } catch (SQLException ex) {Logger.getLogger(activeCart.class.getName()).log(Level.SEVERE, null, ex);}
        } catch (SQLException ex) {Logger.getLogger(activeCart.class.getName()).log(Level.SEVERE, null, ex);} 
    }
}
