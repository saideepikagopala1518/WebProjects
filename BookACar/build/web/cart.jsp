<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<html>
<head>
<title>display data from the table using jsp</title>
</head>
<body>
    <% String user = String.valueOf(session.getAttribute("user"));
        float totalPrice = 0;
        int totalCars = 0;
            if(user.equals("null")){
                user = "Guest";
            }
        %>
<h1>Welcome <%=user%> !</h1>
<%
try {
String connectionURL = "jdbc:mysql://localhost:3306/cars";
Connection connection = null;
Statement statement = null;
ResultSet rs = null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
connection = DriverManager.getConnection(connectionURL, "root", "");
statement = connection.createStatement();
String QueryString = "";
if(user.equals("admin"))
{
    QueryString = "SELECT * from activecarttable";
}
else{
    QueryString = "SELECT * from activecarttable WHERE user = '"+user+"'";
}
rs = statement.executeQuery(QueryString);
%>
<table border="1">
    <tr>
        <th>Car</th>
        <th>Quantity</th>
        <th>User</th>
        <th>Price</th>
        <th>Total Price</th>
    </tr>
<%
while (rs.next()) {
%>
<tr>
<td><%=rs.getString(1)%></td>
<td><%=rs.getInt(2)%></td>
<td><%=rs.getString(3)%></td>
<td><%=rs.getFloat(4)%></td>
<td><a href="CartDeletionController?id=<%=rs.getInt(5)%>"><input type = "submit" value = "Delete From Cart" /></a></td>
</tr>
<% totalPrice +=(rs.getInt(2) *rs.getFloat(4));
    totalCars +=rs.getInt(2);
        } 
%>
<%
// close all the connections.
rs.close();
statement.close();
connection.close();
} catch (Exception ex) {
%>
</font>
<font size="+3" color="red"></b>
<%
out.println("Unable to connect to database.");
}
%>
<tr>
    <th>Amount of Cars</th>
    <th><%=totalCars%></th>
    <th>Total Cost</th>
    <th><%=totalPrice%></th>
    <th><a href="checkout.jsp"><input type="submit" value="Checkout" /></a></th>
</tr>
</table><table>
<tr>
<td><FORM ACTION="index.jsp" method="get" >
<button type="submit"><-- back</button></td>
</tr>
</table>
</font>
</body>
</html>