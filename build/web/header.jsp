
<style type="text/css">
    ul{
        margin: 0;
        padding: 0;
        list-style: none;
        height: 36px;
        line-height: 36px;
        background-color: #000;
        font-family: Arial,Helvetica,sans-serif;
        font-size: 13;
    }
    li{
        float: right;
        border-right: 1px solid #156ee2;
    }
    a{
        display: block;
        padding: 0 28px;
        color: #fff;
        text-decoration: none;
    }
    a:hover {
        background-color: #156ee2;
    }
    
    .active a{
        background-color: #156ee2;
    }
    
    
</style>

<ul>
    <li><a href="logout"> Logout </a></li>
    <li><a href="profile.jsp"> Profile </a></li>
    <li><a href="result.jsp?id=<%=session.getAttribute("username")%> "> Result </a></li>
    <li><a href="quiz.jsp"> Test </a></li>
    <li class="active"> <a href="home.jsp"> Home </a></li>
    
</ul>


