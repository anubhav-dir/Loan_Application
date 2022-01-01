
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="connection.ConnectProvider"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Test</title>
    </head>
    <body>
        
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            if(session.getAttribute("username")==null)
            {
                response.sendRedirect("Login.jsp");
            }
        %>
        
        <h1> Test </h1>
        <jsp:include page="header.jsp" />
        <%            
            Connection con = ConnectProvider.getCon();  
            PreparedStatement st = con.prepareStatement("select * from subjects where status = 1");
            ResultSet rs = st.executeQuery();
        %>

        <br>
        <form action="test.jsp" method="post">
        <table>    
            <tr>
                    <td> Subject : </td>
                    <td><select id="subject" name="subject" >
                            <%  while(rs.next()){ %>
                            <option value="<%=rs.getString(1) %>">(<%=rs.getString(1) %>)<%=rs.getString(2) %> </option>
                            <%  } %>
                    </select></td>
                <td><input type="submit" value="Start"> </td>
            </tr>
        </table>
        </form>
    </body>
</html>
