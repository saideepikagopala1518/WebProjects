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
            if(user.equals("null")){
                user = "Guest";
            }
        %>
<h1>Welcome <%=user%> !</h1>
<h2>Data from the table</h2>
<%
try {
String connectionURL = "jdbc:mysql://localhost:3306/cars";
Connection connection = null;
Statement statement = null;
ResultSet rs = null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
connection = DriverManager.getConnection(connectionURL, "root", "");
statement = connection.createStatement();
String QueryString = "SELECT * from orders";
rs = statement.executeQuery(QueryString);
%>
<table border="1">
    <tr>
        <th>Order Number</th>
        <th>User</th>
        <th>Name</th>
        <th>Order Amount</th>
        <th>Cars Ordered</th>
        <th>Payment</th>
        <th>Address</th>
    </tr>
<%
while (rs.next()) {
%>
<tr>
<td><%=rs.getInt(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
<td><%=rs.getFloat(4)%></td>
<td><%=rs.getString(5)%></td>
<td><%=rs.getString(6)%></td>
<td><%=rs.getString(7)%></td>
</tr>
<% } %>
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
</table><table>
<tr>
<td><FORM ACTION="index.jsp" method="get" >
<button type="submit">Homepage</button></td>
</tr>
</table>
</font>
</body>
</html>