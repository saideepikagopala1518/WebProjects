package controllers;

import Beans.*;
import database.Db_Connection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Eduardo
 */
@WebServlet(name = "CartController", urlPatterns = {"/CartController"})
public class AddingCartController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
     protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException  
        {
            HttpSession sessionUser = request.getSession();
            String user = String.valueOf(sessionUser.getAttribute("user"));
            if(user.equals("null")){
                user = "Guest";
            }
            String car = request.getParameter("c");
            float price = 0;
            if(car.contains("usedHonda") || car.contains("usedFord")|| car.contains("usedToyota") || car.contains("usedChevy") ){
                 price = 12000;
            }
            else if(car.contains("newHonda") || car.contains("newFord")|| car.contains("newToyota") || car.contains("newChevy")){
                price = 35000;
            }
            else if(car.contains("usedTesla")){
                price = 20000;
            }
            else if(car.contains("newTesla")){
                price = 45000;
            }
            else if(car.contains("usedBMW")){
                price = 25000;
            }
            else if(car.contains("newBMW")){
                price = 55000;
            }
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            try 
            {
                activeCart cart = new activeCart();
                cart.setCar(car);
                cart.setPrice(price);
                cart.setQuantity(1);
                cart.setUser(user);
                cart.addToCart();
                RequestDispatcher rd1 = request.getRequestDispatcher("cart.jsp");
                rd1.forward(request,response); 
            } finally {out.close();}
        }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
