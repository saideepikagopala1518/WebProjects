<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<html>
<head>
<title>display data from the table using jsp</title>
</head>
<body>
<h1>Welcome <%=request.getParameter("id")%> !</h1>
<%
try {
String car =request.getParameter("id");
String connectionURL = "jdbc:mysql://localhost:3306/cars";
Connection connection = null;
Statement statement = null;
ResultSet rs = null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
connection = DriverManager.getConnection(connectionURL, "root", "");
statement = connection.createStatement();
String QueryString = "SELECT * from newcarstable WHERE newCarsMake = '"+car+"'";
rs = statement.executeQuery(QueryString);
%>
<table border="1">
    <tr>
        <th>Car</th>
        <th>Year</th>
        <th>Quantity</th>
        <th>Price</th>
    </tr>
<%
while (rs.next()) {
%>
<tr>
<td><%=rs.getString(1)%></td>
<td><%=rs.getInt(2)%></td>
<td><%=rs.getInt(3)%></td>
<td><%=rs.getFloat(5)%></td>
<td><a href="addtocart.jsp?id=<%=rs.getString(1)%>"><input type = "submit" value = "Add To Cart" /></a></td>
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
<button type="submit"><-- back</button></td>
</tr>
</table>
</font>
</body>
</html>