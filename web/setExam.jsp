
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="connection.ConnectProvider"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Set Exam</title>
    </head>
    <body>

        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            if(session.getAttribute("username")==null)
            {
                response.sendRedirect("Login.jsp");
            }
        %>
        
        <h1>Set Exam</h1>
        <jsp:include page="adminNavigation.jsp" />

        <%            
            Connection con = ConnectProvider.getCon();
            PreparedStatement st = con.prepareStatement("select * from subjects");
            ResultSet rs = st.executeQuery();
        %>
        
        <table border="1" width="80%" >   
            
            <tr>
                <th>Subject I'd</th>
                <th>Subject Name</th>
                <th>Status</th>
                <th>Update</th>
            </tr>
            <%  while(rs.next()){ %>
            <tr>

                <th><%=rs.getString(1)%></th>
                <th><%=rs.getString(2)%></th>
                <th><%=rs.getString(3)%></th>
                <th> <a href="updateExam.jsp?sub_id=<%=rs.getString(1)%>" > Change </a> </th>
                
            </tr>
            <%  } %>
            <tr>
                <td>Add New Subject</td>
            </tr>
            <tr> 

                <th><input type="text" name="sub_id" size="5" placeholder="Subject I'd" ></th>
                <th><input type="text" name="sub_name" placeholder="Subject" ></th>
                <th></th>
                <th><input type="radio" name="status" value="1"> Allow 
                    <input type="radio" name="status" value="0"> DisAllow
                </th>
            </tr>
            
        </table>
        
    </body>
</html>
