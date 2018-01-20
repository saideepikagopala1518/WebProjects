<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            String user = String.valueOf(session.getAttribute("user"));
            String cars ="";
            float totalPrice = 0;
            if(user.equals("null")){
                user = "Guest";
            }
            try {
                    String connectionURL = "jdbc:mysql://localhost:3306/cars";
                    Connection connection = null;
                    Statement statement = null;
                    ResultSet rs = null;
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    connection = DriverManager.getConnection(connectionURL, "root", "");
                    statement = connection.createStatement();
                    String QueryString = "";
                    QueryString = "SELECT * from activecarttable WHERE user = '"+user+"'";
                    rs = statement.executeQuery(QueryString);
                    while (rs.next()) {
                        cars = cars +" "+rs.getString(1);
                        totalPrice +=(rs.getInt(2) *rs.getFloat(4));
                    }
                    statement.close();
                    connection.close();
                } catch (Exception ex) {
                    out.println("Unable to connect to database.");
                }
%>
        <h1>Checkout Page</h1>
        <form action="CheckoutController" method="post">
        <table border="1" style="width:330px">
            <tr>
                <td>Name: </td>
                <td><input type="text" name="name" style="width:100%"/></td>
            </tr>
            <tr>
                <td>Street Address: </td>
                <td><input type="text" name="address" style="width:100%"/></td>
            </tr>
            <tr>
                <td>City: </td>
                <td><input type="text" name="city" style="width:100%"/></td>
            </tr>
            <tr>
                <td>State: </td>
                <td><select name="state">
                    <option value="AL">AL</option>
                    <option value="AK">AK</option>
                    <option value="AR">AR</option>	
                    <option value="AZ">AZ</option>
                    <option value="CA">CA</option>
                    <option value="CO">CO</option>
                    <option value="CT">CT</option>
                    <option value="DC">DC</option>
                    <option value="DE">DE</option>
                    <option value="FL">FL</option>
                    <option value="GA">GA</option>
                    <option value="HI">HI</option>
                    <option value="IA">IA</option>	
                    <option value="ID">ID</option>
                    <option value="IL">IL</option>
                    <option value="IN">IN</option>
                    <option value="KS">KS</option>
                    <option value="KY">KY</option>
                    <option value="LA">LA</option>
                    <option value="MA">MA</option>
                    <option value="MD">MD</option>
                    <option value="ME">ME</option>
                    <option value="MI">MI</option>
                    <option value="MN">MN</option>
                    <option value="MO">MO</option>	
                    <option value="MS">MS</option>
                    <option value="MT">MT</option>
                    <option value="NC">NC</option>	
                    <option value="NE">NE</option>
                    <option value="NH">NH</option>
                    <option value="NJ">NJ</option>
                    <option value="NM">NM</option>			
                    <option value="NV">NV</option>
                    <option value="NY">NY</option>
                    <option value="ND">ND</option>
                    <option value="OH">OH</option>
                    <option value="OK">OK</option>
                    <option value="OR">OR</option>
                    <option value="PA">PA</option>
                    <option value="RI">RI</option>
                    <option value="SC">SC</option>
                    <option value="SD">SD</option>
                    <option value="TN">TN</option>
                    <option value="TX">TX</option>
                    <option value="UT">UT</option>
                    <option value="VT">VT</option>
                    <option value="VA">VA</option>
                    <option value="WA">WA</option>
                    <option value="WI">WI</option>	
                    <option value="WV">WV</option>
                    <option value="WY">WY</option>
                </select></td>
            </tr>
            <tr>
                <td>Zipcode: </td>
                <td><input type="text" name="zipcode"/></td>
            </tr>
            <tr>
                <td>Card Number: </td>
                <td><input type="text" name="payment" style="width:100%"/></td>
            </tr>
            <tr>
                <td>Security Code: </td>
                <td><input type="password" style="width:30px"/></td>
            </tr>
            <tr>
                <td>Cars: </td>
                <td><input type="text" name="cars" value="<%=cars%>" style="width:100%"/></p></td>
            </tr>
            <tr>
                <td>Total: </td>
                <td><input type="text" name="amount" value="<%=totalPrice%>" style="width:100%" /></td>
            </tr>
            <tr>
                <td><a href="index.jsp" ><button type="button">Go Back</button></a></td>
                <td><input type="submit" value="Submit" /></td>
            </tr>
        </table>
        </form>
    </body>
</html>
