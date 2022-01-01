
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
    </head>
    <body>
        
        <h1> Register </h1>
        
        <form action="Register" method="post">
            
            <table>    
                <tr>
                    <td> First Name : </td> <td> <input type="text" name="FName" placeholder="First Name">  </td>
                </tr>
                <tr>
                    <td> Middle Name : </td> <td> <input type="text" name="MName" placeholder="Middle Name"> </td>
                </tr>
                <tr>
                    <td> Last Name : </td> <td> <input type="text" name="LName" placeholder="Last Name"> </td>
                </tr>
                <tr>
                    <td> Email I'd : </td> <td> <input type="text" name="Email" placeholder="Email I'd">  </td>
                </tr>
                <tr>
                    <td> Course : </td> <td> <input type="text" name="cource" placeholder="Course"> </td>
                </tr>
                <tr>
                    <td> City : </td> <td> <input type="text" name="city" placeholder="City">  </td>
                </tr>
                <tr>
                    <td> Pin Code : </td> <td> <input type="text" name="pinCode" placeholder="Pin Code">  </td>
                </tr>
                <tr>
                    <td> Password : </td> <td> <input type="password" name="U1Password" placeholder="Password"> </td>        
                </tr>
                <tr>
                    <td> Re-Enter Password : </td> <td> <input type="password" name="U2Password" placeholder="Re-Enter Password">  </td> 
                </tr>
                <tr>
                    <td><input type="submit" value="Register"> </td>
                    <td> <input type="reset" value="Reset"> </td>
                </tr>
                <tr>
                    <td></td>
                    <td><a href="Login.jsp"> Login </a> </td>
                </tr>
            </table> 
        </form>
    
    </body>
</html>
