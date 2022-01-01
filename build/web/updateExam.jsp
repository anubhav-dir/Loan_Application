
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="connection.ConnectProvider"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Exam</title>
    </head>
    <body>
        
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            if(session.getAttribute("username")==null)
            {
                response.sendRedirect("Login.jsp");
            }
        %>
        
        <h1>Update Exam</h1>
        <jsp:include page="adminNavigation.jsp" />
    
        <%            
            String sub_id = request.getParameter("sub_id");
            Connection con = ConnectProvider.getCon();
            PreparedStatement st = con.prepareStatement("select * from subjects where sub_id =?");
            st.setString(1, sub_id);
            ResultSet rs = st.executeQuery();
            rs.next();
        %>

        <form action="SETEXAM2.jsp" method="post">
        <table border="1"  >   
            <tr> 
                <th>Subject I'd </th> <th><input type="text" name="sub_id" value="<%=rs.getString(1)%>" readonly></th>
            </tr>
            <tr>
                <th>Subject Name</th><th><%=rs.getString(2)%></th>
            </tr>
            <tr>
                <th>Status</th>
                <th><input type="radio" name="status" value="1"> Allow 
                    <input type="radio" name="status" value="0"> DisAllow
                </th>
            </tr>
            
        </table>
            <input type="submit" value="Change">
        </form>
    
    </body>
</html>
