/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans;

import database.Db_Connection;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Eduardo
 */
public class Order {
    private String user, cars, address, payment, name;
    private float amount;
    
    public Order(){
        user = "";
        cars = "";
        address = "";
        payment = "";
        name = "";
        amount = 0;
    }
    
    public void setUser(String s){
        this.user=s;
    }
    
    public void setCars(String s){
        this.cars=s;
    }
    
    public void setAddress(String s){
        this.address=s;
    }
    
    public void setName(String s){
        this.name=s;
    }
    
    public void setPayment(String i){
        this.payment=i;
    }
    
    public void setAmount(float f){
        this.amount=f;
    }
    
    public void placeOrder(){
        try
        {    
            Db_Connection dbconn=new Db_Connection();
            Connection myconnection= dbconn.Connection();
            String sqlString="INSERT INTO orders(user, name, orderAmount, carsOrdered, Payment, Address) VALUES ('"+user+"' ,'"+name+"',"+amount+",'"+cars+"','"+payment+"', '"+address+"')";
            activeCart cart = new activeCart();
            cart.deleteFromCart(user);
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
