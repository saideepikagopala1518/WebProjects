/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import Beans.Order;
import database.Db_Connection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Eduardo
 */
public class CheckoutController extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            String user = String.valueOf(session.getAttribute("user"));
            if(user.equals("null")){
                user = "Guest";
            }
            Order order = new Order();
            order.setAddress(request.getParameter("address")+", "+request.getParameter("city")+", "+request.getParameter("state")+", "+request.getParameter("zipcode"));
            order.setCars(request.getParameter("cars"));
            order.setAmount(Float.parseFloat(request.getParameter("amount")));
            order.setName(request.getParameter("name"));
            order.setPayment(request.getParameter("payment"));
            order.setUser(user);
            order.placeOrder();
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Confirmation</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Order Confirmation</h1>");
            out.println("<center>");
            out.println("<table border='1'><tr><th colspan='2'>Order Information</th></tr>");
            out.println("<tr><td>Name</td><td>"+request.getParameter("name")+"</td></tr>");
            out.println("<tr><td>Cars</td><td>"+request.getParameter("cars")+"</td></tr>");
            out.println("<tr><td>Amount</td><td>"+request.getParameter("amount")+"</td></tr>");
            out.println("<tr><td colspan='2'><a href='index.jsp'><input type='submit' value='Homepage'></button></a></td></tr>");
            out.println("</table></center></body>");
            out.println("</html>");
        }
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
