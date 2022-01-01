
<%@page import="java.util.ArrayList"%>
<%@page import="javafiles.Questions"%>
<%@page import="connection.questionDAO"%>
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
        
        <h2>Test</h2>
        
        <%
            String sub_id = request.getParameter("subject");
            questionDAO dao = new questionDAO();
            ArrayList<Questions> questions = dao.getQuestion(sub_id);
            int Q = 1;

        %>
        
        <form action="result" method="post">
        
            <input name="sub_id" type="radio" value="<%=sub_id %>" checked > <%=sub_id %> 
        <%    
            for(Questions q:questions){
        %>
        
                <table>
                    <tr>
                        <td> <%=Q %> <%=q.getQuestion() %> </td>
                    </tr>
                    <tr>
                        <td> <input id="<%=Q %>" name="<%=Q %>" type="radio" value="<%=q.getOption01() %>" > <%=q.getOption01() %>  </td>
                    </tr>
                    <tr>
                        <td> <input id="<%=Q %>" name="<%=Q %>" type="radio" value="<%=q.getOption02() %>" > <%=q.getOption02() %>  </td>
                    </tr>
                    <tr>
                        <td> <input id="<%=Q %>" name="<%=Q %>" type="radio" value="<%=q.getOption03() %>" > <%=q.getOption03() %>  </td>
                    </tr>
                    <tr>
                        <td> <input id="<%=Q %>" name="<%=Q %>" type="radio" value="<%=q.getOption04() %>" > <%=q.getOption04() %>  </td>
                    </tr>
                </table>
        
                    
            <% Q++; } %>
        
            <input type="submit" value="Submit">
            
        </form>
    </body>
</html>
