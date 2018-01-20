<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Beans.User"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Form</title>
    </head>
    <body>
        
        <jsp:useBean id="user" scope="request" class="Beans.User"></jsp:useBean>
 
        <form action="RegisterController" method="post">
            <center>
                <table border="1" width="15%" cellpadding="5">
                    <thead>
                        <tr>
                            <th colspan="2">Register Form</th>
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
                            <td><center><input type="reset" value="Reset" /></center></td>
                            <td><center><input type="submit" value="Register"></center></td>
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
    <center>
         
    </center>
    </body>
</html>
