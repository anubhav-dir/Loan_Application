
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard</title>
    </head>
    <body>
        
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            if(session.getAttribute("username") ==null)
            { 
                response.sendRedirect("Login.jsp");
            }
        %>

        
        <h1>Dashboard</h1>
        <jsp:include page="adminNavigation.jsp" />

    </body>
</html>
