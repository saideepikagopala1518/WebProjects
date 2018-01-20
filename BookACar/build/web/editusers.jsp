<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<html>
<head>
<title>display data from the table using jsp</title>
</head>
<body>
<h1>Welcome <%=session.getAttribute("user") %> !</h1>
<h2>Data from the table</h2>
<%
try {
String user = request.getParameter("u");
String connectionURL = "jdbc:mysql://localhost:3306/cars";
Connection connection = null;
Statement statement = null;
ResultSet rs = null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
connection = DriverManager.getConnection(connectionURL, "root", "");
statement = connection.createStatement();
String QueryString = "SELECT * from registereduserstable WHERE username = '"+user+"'";
rs = statement.executeQuery(QueryString);
%>
<table border="1">
    <tr>
        <th>Username</th>
        <th>Password</th>
    </tr>
<%
while (rs.next()) {
%>
<tr>
<td><input type="text" name="username" value="<%=rs.getString(1)%>" /></td>
<td><input type="password" name="username" value="<%=rs.getString(2)%>" /></td>
<td><a href="AddingCartController?c=<%=rs.getString(1)%>"><input type = "submit" value = "Add To Cart" /></a></td>
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
<td><a href="index.jsp"><button type="submit"><-- back</button></a></td>
</tr>
</table>
</font>
</body>
</html>