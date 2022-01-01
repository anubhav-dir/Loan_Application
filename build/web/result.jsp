
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="connection.ConnectProvider"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result</title>
    </head>
    <body>
        
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            if(session.getAttribute("username")==null)
            {
                response.sendRedirect("Login.jsp");
            }
        %>
      
        <h3>Result</h3>
        <jsp:include page="header.jsp" />
        
        <%    
            Connection con = ConnectProvider.getCon();
            PreparedStatement st = con.prepareStatement("select * from results where user_id = ?");
            st.setString(1, request.getParameter("id"));
            ResultSet rs = st.executeQuery();
        %>
                
        <table border="1" width="80%" >    
            <tr>
                <th>S.N.</th>
                <%if(request.getParameter("id")==null){%>
                <th>User I'd</th> <% } %>
                <th>Subject</th>
                <th>Marks</th>
                <th>Correct Ans</th>
                <th>Wrong Ans</th>
                <th>Status</th>
                <%if(request.getParameter("id")==null){%>
                <th>Profile</th> <% } %>
                
            </tr>
                <%
                    while(rs.next()){ %>
                    <tr>        
                        <th> <%=rs.getString(1)%></th>
                        <%if(request.getParameter("id")==null){%>
                        <th> <%=rs.getString(2)%></th> <% } %>
                        <th> <%=rs.getString(3)%></th>
                        <th> <%=(rs.getInt(4)/(rs.getInt(4)+rs.getInt(5)))*100%> % </th>
                        <th> <%=rs.getString(4)%></th>
                        <th> <%=rs.getString(5)%></th>
                        <th> <%=rs.getString(6)%></th>

                        <%if(request.getParameter("id")==null){%>
                        <th> <a href="users.jsp?id=<%=rs.getString(2)%>"> Profile </a></th> <% } %>
                        
                    </tr>
                <%  } %>
            
        </table>
        
        <%if(request.getParameter("id")!=null){%>
        <a href="users.jsp"> Back </a> <% } %>
        
    </body>
</html>
