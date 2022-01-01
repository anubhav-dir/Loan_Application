
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        
        <h1>Login</h1>
        
        <form action="LogIn" method="psot">
            <table>    
                <tr>
                    <td> Username : </td> <td> <input type="text" name="uname" placeholder="Username"> </td>
                </tr>
                <tr>
                    <td> Password : </td> <td> <input type="password" name="upass" placeholder="Password"> </td>
                </tr>
                <tr>
                    <td> <input type="submit" value="Login"> </td>
                    <td> <input type="reset" value="Reset"> </td>
                </tr>
                <tr>
                    <td></td>
                    <td> <a href="Register.jsp"> Register </a> </td>
        
                </tr>
            </table>  
        </form>
    
    </body>
</html>
