
<%@page import="javafiles.UserData"%>
<%@page import="connection.profileDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
    </head>
    <body>
        
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            if(session.getAttribute("username")==null)
            {
                response.sendRedirect("Login.jsp");
            }

        %>
        
        <h2>Profile</h2>
        <jsp:include page="header.jsp" />
       
        
        <%
            profileDAO dao = new profileDAO();
            
            UserData user = dao.info(session.getAttribute("username").toString());
    
            
        %>
    <table>    
        <tr>
            <td> Name </td> <td> <%=user.getF_Name() %> <%=user.getM_Name() %> <%=user.getL_Name() %> </td> 
        </tr>
        <tr>
            <td> User I'd </td> <td> <%=session.getAttribute("username").toString() %> </td> 
        </tr>
        <tr>
            <td> Email I'd &emsp; </td> <td> <%=user.getEmail_id() %> </td>
        </tr>
        <tr>
            <td> Cource </td> <td> <%=user.getCource() %> </td>
        </tr>
        <tr>
            <td> City </td> <td> <%=user.getCity() %> </td>
        </tr>
        <tr>
            <td> pin_code </td> <td> <%=user.getPin_code() %> </td>
        </tr>
    </table>    
    </body>
</html>
