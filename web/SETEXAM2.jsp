<%@page import="java.sql.PreparedStatement"%>
<%@page import="connection.ConnectProvider"%>
<%@page import="java.sql.Connection"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    if(session.getAttribute("username")==null)
    {
    response.sendRedirect("Login.jsp");
    }
    String sub_id = request.getParameter("sub_id");
    String status = request.getParameter("status");
    Connection con = ConnectProvider.getCon();
    PreparedStatement st = con.prepareStatement("update subjects set status = ? where sub_id = ?");
    st.setString(1, status);
    st.setString(2, sub_id);
    st.executeUpdate();
    response.sendRedirect("setExam.jsp");
%>
