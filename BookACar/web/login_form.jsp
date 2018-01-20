<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Beans.User"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Form</title>
        <% session.invalidate();%>
    </head>
    <body>
        
        <jsp:useBean id="user" scope="request" class="Beans.User"></jsp:useBean>

        <form action="LoginController" method="post">
            <center>
                <table border="2" width="15%" cellpadding="5">
                    <thead>
                        <tr>
                            <th colspan="2">Login Form</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>    
                            <td>Username : </td>
                            <td><input type="text" name="user" value="<jsp:getProperty name="user" property="user"/>"></td>
                        </tr>
                        <tr>
                            <td>Password : </td>
                            <td><input type="password" name="pwd" value="<jsp:getProperty name="user" property="pwd"/>"></td>
                        </tr>
                        <tr>  
                            <td><center><a href="register_form.jsp">Register</a></center></td>
                            <td><center><input type="submit" value="Login"></center></td>
                        </tr>
                    </tbody>             
                </table>
                <table>
                    <tr>
                        <td><a href="index.jsp"><button type="button">Homepage</button></a></td>
                    </tr>
                </table>        
            </center>
        </form>
    </body>
</html>
