<%@page import="connection.resultDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javafiles.Questions"%>
<%@page import="connection.questionDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="connection.ConnectProvider"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exam Report</title>
    </head>
    <body>

        <h1>Exam Report</h1>
        <jsp:include page="header.jsp" />
        <h2>${name} Exam Report</h2><br>
        
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    if(session.getAttribute("username")==null)
    {
    response.sendRedirect("Login.jsp");
    }
    String sub_id = request.getParameter("sub_id");
    questionDAO dao = new questionDAO();
    ArrayList<Questions> questions = dao.getQuestion(sub_id);
    Connection con = ConnectProvider.getCon();
    resultDAO result = new resultDAO();
            
    int Q = 0;
    int  correct_ans = 0;
    int wrong_ans = 0;
    String status;
    String user = request.getParameter("username");
    for(Questions q:questions)
    {
        Q++;
        if(request.getParameter(String.valueOf(Q)).equals(q.getCorrect_ans()))
        {
            correct_ans++;
        }
        else
        {
            wrong_ans++;
        }
    }
    if(correct_ans > wrong_ans)
    {
        status = "P";
    }
    else
    {
        status = "F";
    }
    result.result(session.getAttribute("username").toString(), sub_id, correct_ans, wrong_ans, status);
    %>

    <table>
        <tr>
            <th>Total Questions</th><th><%=Q%></th>
        </tr>
        <tr>
            <th>Correct Questions</th><th><%=correct_ans%></th>
        </tr>
        <tr>
            <th>Wrong Questions</th><th><%=wrong_ans%></th>
        </tr>
        <tr>
            <th>Status</th><th><%=status%></th>
        </tr>
    </table>

    </body>
</html>
