<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Auto Sales</title>
    </head>
    <body>
        <% String user = String.valueOf(session.getAttribute("user"));
            if(user.equals("null")){
                user = "Guest";
            }
        %>
        
        <h1>Welcome <%= user%>!</h1>
        <table border="1">
            <%if(user.equals("Guest")){
            out.print("<tr><th colspan=\"2\">Choose style of cars</th> </tr>");
            out.print("<tr><td><a href=\"new_cars.jsp\">New Cars</a></td>");
            out.print("<td><a href=\"used_cars.jsp\">Used Cars</a></td></tr>");
            out.print("<tr><th colspan=\"2\">Other Options</th> </tr>");
            out.print("<tr><td colspan=\"2\"><a href=\"login_form.jsp\">Login</a></td></tr>");
            out.print("<tr><td colspan=\"2\"><a href=\"cart.jsp\">Cart</a></td></tr>");
            out.print("<tr><td colspan=\"2\"><a href=\"checkout.jsp\">Checkout</a></td></tr>"); }
            else if(user.equals("admin")){
            out.print("<tr><th colspan=\"2\">Choose style of cars</th> </tr>");
            out.print("<tr><td><a href=\"new_cars.jsp\">New Cars</a></td>");
            out.print("<td><a href=\"used_cars.jsp\">Used Cars</a></td></tr>");
            out.print("<tr><th colspan=\"2\">Other Options</th> </tr>");
            out.print("<tr><td colspan=\"2\"><a href=\"users.jsp\">Users</a></td></tr>");
            out.print("<tr><td colspan=\"2\"><a href=\"cart.jsp\">Cart</a></td></tr>");
            out.print("<tr><td colspan=\"2\"><a href=\"inventory.jsp\">Inventory</a></td></tr>");
            out.print("<tr><td colspan=\"2\"><a href=\"orders.jsp\">Orders</a></td></tr>");
            out.print("<tr><td colspan=\"2\"><a href=\"login_form.jsp\">Logout</a></td></tr>");}
            else{
            out.print("<tr><th colspan=\"2\">Choose style of cars</th> </tr>");
            out.print("<tr><td><a href=\"new_cars.jsp\">New Cars</a></td>");
            out.print("<td><a href=\"used_cars.jsp\">Used Cars</a></td></tr>");
            out.print("<tr><th colspan=\"2\">Other Options</th> </tr>");
            out.print("<tr><td colspan=\"2\"><a href=\"cart.jsp\">Cart</a></td></tr>");
            out.print("<tr><td colspan=\"2\"><a href=\"checkout.jsp\">Checkout</a></td></tr>"); 
            out.print("<tr><td colspan=\"2\"><a href=\"login_form.jsp\">Logout</a></td></tr>");}
            %>
        </table>
    </body>
</html>
