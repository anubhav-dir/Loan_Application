
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="connection.ConnectProvider"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Question</title>
    </head>
    <body>
        
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            if(session.getAttribute("username")==null)
            {
                response.sendRedirect("Login.jsp");
            }

        %>
        
        <h2>Add Question</h2>
        <jsp:include page="adminNavigation.jsp" />
        <%            
            Connection con = ConnectProvider.getCon();  
            PreparedStatement st = con.prepareStatement("select * from subjects");
            ResultSet rs = st.executeQuery();
        %>
        
        <form action="addQuestion" method="post">
            
            <table>    
                <tr>
                    <td> Subject : </td>
                    
                    <td><select id="sub_id" name="sub_id" >
                            <%  while(rs.next()){ %>
                            <option value="<%=rs.getString(1) %>">(<%=rs.getString(1) %>)<%=rs.getString(2) %> </option>
                            <%  } %>
                    </select></td>
                </tr>
                <tr>
                    <td> Question : </td> <td> <input type="text" name="question" size="100"> </td>
                </tr>
                <tr>
                    <td> option01 : </td> <td> <input type="text" name="option01" size="50"> </td>
                </tr>
                <tr>
                    <td> option02 : </td> <td> <input type="text" name="option02" size="50">  </td>
                </tr>
                <tr>
                    <td> option03 : </td> <td> <input type="text" name="option03" size="50"> </td>
                </tr>
                <tr>
                    <td> option04 : </td> <td> <input type="text" name="option04" size="50">  </td>
                </tr>
                <tr>
                    <td> Correct Ans : </td> <td> <input type="text" name="correct_ans" size="50">  </td>
                </tr>
                <tr>
                    <td><input type="submit" value="Add"> </td>
                    <td><input type="reset" value="Reset"> </td>
                </tr>
            </table> 
        </form>
    
        
    </body>
</html>
