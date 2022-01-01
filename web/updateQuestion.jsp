
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="connection.ConnectProvider"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Question</title>
    </head>
    <body>
        
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            if(session.getAttribute("username")==null)
            {
                response.sendRedirect("Login.jsp");
            }

        %>
        <h1>Update Question</h1>
        <jsp:include page="adminNavigation.jsp" />
        
        <%
            Connection con = ConnectProvider.getCon();
            String q_no = request.getParameter("id");
            String sql = "select * from questions where q_no = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, q_no);
            ResultSet rs = st.executeQuery();
            rs.next();
        %>
        
        <form action="updateQuestion" method="post">
            <table>
                <tr>
                    <td> Question No : </td> <td> <input type="text" name="q_no" size="4" value="<%=q_no%>" readonly >  </td>
                </tr>
                <tr>
                    <td> Subject : </td> <td> <input type="text" name="sub_id" size="4" value="<%=rs.getString(3)%>">  </td>
                </tr>
                <tr>
                    <td> Question : </td> <td> <input type="text" name="question" size="100" value="<%=rs.getString(4)%>"> </td>
                </tr>
                <tr>
                    <td> option01 : </td> <td> <input type="text" name="option01" size="50" value="<%=rs.getString(5)%>"> </td>
                </tr>
                <tr>
                    <td> option02 : </td> <td> <input type="text" name="option02" size="50" value="<%=rs.getString(6)%>">  </td>
                </tr>
                <tr>
                    <td> option03 : </td> <td> <input type="text" name="option03" size="50" value="<%=rs.getString(7)%>"> </td>
                </tr>
                <tr>
                    <td> option04 : </td> <td> <input type="text" name="option04" size="50" value="<%=rs.getString(8)%>">  </td>
                </tr>
                <tr>
                    <td> Correct Ans : </td> <td> <input type="text" name="correct_ans" size="50" value="<%=rs.getString(9)%>">  </td>
                </tr>
                <tr>
                    <td><input type="submit" value="Update"> </td>
                </tr>
            </table> 
        </form>
                
    </body>
</html>
