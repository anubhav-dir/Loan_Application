
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="connection.ConnectProvider"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Question Bank</title>
    </head>
    <body>
        
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            if(session.getAttribute("username")==null)
            {
                response.sendRedirect("Login.jsp");
            }

        %>
        
        <h3>Question Bank</h3>
        <jsp:include page="adminNavigation.jsp" />
        
              <%            
                    Connection con = ConnectProvider.getCon();
                    int sub_id = Integer.parseInt(request.getParameter("subid"));   
                    PreparedStatement st = con.prepareStatement("select * from questions where sub_id = ?");
                    st.setInt(1, sub_id);
                    ResultSet rs = st.executeQuery();
        
                %>
                
                Subject : <%=sub_id %>
                
        <table border="1" width="80%" >    
            <tr>
                <th>Question</th>
                <th>Option 1</th>
                <th>Option 2</th>
                <th>Option 3</th>
                <th>Option 4</th>
                <th>Correct Answer</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
                <%  while(rs.next()){ %>
                    <tr align="left">        
                        <th> <%=rs.getString(4)%></th>
                        <th> <%=rs.getString(5)%></th>
                        <th> <%=rs.getString(6)%></th>
                        <th> <%=rs.getString(7)%></th>
                        <th> <%=rs.getString(8)%></th>
                        <th> <%=rs.getString(9)%></th>
                        <th> <a href="updateQuestion.jsp?id=<%=rs.getString(1) %>"> Edit </a></th>
                        <th> <a href="deleteQuestion?id=<%=rs.getString(1) %>"> Delete </a></th>
                    </tr>
                <%  } %>
            
        </table>
        
    </body>
</html>
