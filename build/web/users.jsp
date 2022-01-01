
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="connection.ConnectProvider"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users</title>
    </head>
    <body>
        
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            if(session.getAttribute("username")==null)
            {
                response.sendRedirect("Login.jsp");
            }

        %>
    
        <h1>Users</h1>
        <jsp:include page="adminNavigation.jsp" />
        
        <%            
            Connection con = ConnectProvider.getCon();
            PreparedStatement st = con.prepareStatement("select user_id,email_id,first_name,middle_name,last_name,cource,city,pin_code from users");
            if(request.getParameter("id")!=null)
            {
                st = con.prepareStatement("select user_id,email_id,first_name,middle_name,last_name,cource,city,pin_code from users where user_id = ?");
                st.setString(1, request.getParameter("id"));
            }
            ResultSet rs = st.executeQuery();
            %>
                
        <table border="1" width="80%" >    
            <tr>
                
                <th>User I'd</th>
                <th>First Name</th>
                <th>Middle Name</th>
                <th>Last Name</th>
                <th>Email I'd</th>
                <th>Course</th>
                <th>City</th>
                <th>Pin Code</th>
                <%if(request.getParameter("id")==null){%>
                <th>Performance</th> <% } %>
            </tr>
                <% while(rs.next()){ %>
                    <tr align="left">        
                        <th> <%=rs.getString(1)%></th>
                        <th> <%=rs.getString(3)%></th>
                        <th> <%=rs.getString(4)%></th>
                        <th> <%=rs.getString(5)%></th>
                        <th> <%=rs.getString(2)%></th>
                        <th> <%=rs.getString(6)%></th>
                        <th> <%=rs.getString(7)%></th>
                        <th> <%=rs.getString(8)%></th>
                        <%if(request.getParameter("id")==null){%>
                        <th> <a href="results.jsp?id=<%=rs.getString(1)%> "> Performance </a></th> <% } %>
                        
                    </tr>
                <%  } %>
            
        </table>
        <%if(request.getParameter("id")!=null){%>
        <a href="results.jsp"> Back </a> <% } %>
        
    </body>
</html>
