<%@ page import="java.util.List" %>
<%@ page import="com.lz.Users" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>后台管理</title>
    <link rel="icon" href="./tup/logo.webp" sizes="16*16">
    <style>
        #all{
            width: 1200px;
            margin: 0 auto;
        }
        h3{
            margin: 15px 0 15px -20px;
            padding: 0 25px;
            border-left: 5px solid #51aded;
            background-color: #f7f7f7;
            font-size: 18px;
            line-height: 40px;
        }
    </style>
</head>
<div id="all">
<body>
<style>
    a{
        text-decoration: none;
    }
    ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
        overflow: hidden;/* 内容超出宽度时隐藏超出部分的内容 */
        background: #333;
        top:0;
        width:100%;
    }
    li {
        float: left;
    }
    li a {
        display: block;
        color: white;
        text-align: center;
        padding: 22px 30px;
        text-decoration: none;
    }
    .active {
        background-color:cadetblue;
    }
    li a:hover:not(.active) {
        background: cadetblue;
    }

    a{
        color: white;
    }
    .button {
        background-color: #f44336;
        border: none;
        color: white;
        padding: 7px 16px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 7px;
        margin: 2px 1px;
        cursor: pointer;
        border-radius: 8px;
    }
    .button:hover {
        background-color: #51aded;
        color: white;
    }
    th{
        text-align: center;
    }
    th,td,caption{
        border-bottom: 1px solid #ddd;
    }

</style>
<ul>
    <li><a href="index.jsp">首页</a></li>
    <li><a href="one.jsp">瓷器产品</a></li>
    <li><a class="active" href="ShowAllServlet">后台管理</a></li>
    <li><a href="three.jsp">购物车</a></li>
    <li><a href="more.jsp">更多</a></li>
    <%--获取用户登录信息，展示相应的导航栏内容--%>
    <%
        String userName = (String)session.getAttribute("username");
    %>
    <%--已经登录，显示登录用户名--%>
    <%	if(userName != null){ %>
    <li style="float:right"><a><% out.print("当前用户"+userName); %></a></li>
    <li style="float:right"><a href="LogoutServlet">退出</a></li>
    <%--还未登录，显示登录、注册按钮--%>
    <% }else{ %>
    <li style="float:right"><a href="user_register.jsp">注册</a></li>
    <li style="float:right"><a href="user_login.jsp">登录</a></li>
    <%	} %>
</ul>
<%--后台管理，展示用户可从中选择删除用户、修改用户信息功能--%>
<%
    if(userName==null){
        out.println("请登录后查看！");
        return;
    }
    %>
<%
    boolean flag=true;
    session=request.getSession(false);
    List<Users> users =null;
    if(session==null){
        flag=false;
    }else{
        users=(List)request.getAttribute("users");
        if(users==null) {
            flag=false;
        }
    }
    if(!flag) {
        out.println("用户名单为空！");
    }else{
%>
<table align="center" cellpadding="25">
    <caption style="font-size: 30px">用户名单</caption><th>用户编号</th><th>用户账户</th><th>用户密码</th><th>操作</th>
    <%
        try {
            for (Users user : users) {
    %>
    <tr><td><%out.println(user.getId());%><td><%out.println(user.getUsername());%><td><%out.println(user.getPassword());%>
        <%
             if(user.getUsername().equals(userName)){
                 %>
        <td>当前用户
        <%}else{%>
        <td><a href="UpdateUserServlet?id=<%out.println(user.getId());%>"><button class="button">修改</button></a><%--设置传参type，用于判断是否点击修改后进入--%>
        <a href="DelUserServlet?id=<%out.println(user.getId());%>"><button class="button">删除</button></a>
    <%}}%>
    <tr align="center"><td colspan="5"><a href="user_register.jsp"><button class="button">添加</button></a>
        <%}catch (Exception e){}
    }%>
</table>
</body>
</div>
</html>
