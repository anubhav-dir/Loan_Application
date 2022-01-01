
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="connection.ConnectProvider"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Subject</title>
    </head>
    <body>
        
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            if(session.getAttribute("username")==null)
            {
                response.sendRedirect("Login.jsp");
            }

        %>
        
        <h1>Subject</h1>
        <jsp:include page="adminNavigation.jsp" />

        <%            
            Connection con = ConnectProvider.getCon();  
            PreparedStatement st = con.prepareStatement("select * from subjects");
            ResultSet rs = st.executeQuery();
        %>
        
        <form action="showQuestion.jsp" method="post">
            <table>    
                <tr>
                    <td> Subject : </td>
                    <td><select id="subid" name="subid" >
                            <%  while(rs.next()){ %>
                            <option value="<%=rs.getString(1) %>">(<%=rs.getString(1) %>)<%=rs.getString(2) %> </option>
                            <%  } %>
                    </select></td>
                    <td><input type="submit" value="Find"> </td>
                </tr>
            </table>
        </form>
        
        
    </body>
</html>
