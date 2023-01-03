<%@ page import="com.lz.Users" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        body {
            background: #252935;
        }
        .tpt-login {
            width: 360px;
            height: 360px;
            padding: 50px 30px;
            background: #FFF;
            border-radius: 8px;
            margin: auto;
            position: absolute;
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
        }
        .tpt-login h2 {
            font-size: 28px;
            font-weight: 500;
            padding-bottom: 50px;
            text-align: center;
            color: #333;
        }
        .tpt-login input {
            width: 340px;
            padding: 0 10px;
            margin-bottom: 20px;
            height: 55px;
            line-height: 55px;
            border: 0;
            background: #f5f5f5;
            font-size: 16px;
            color: #666;
        }
        .tpt-login button {
            display: inline-block;
            height: 50px;
            line-height: 50px;
            width: 360px;
            background: #1e9fff;
            color: #fff;
            font-size: 16px;
            margin-top: 20px;
            border: none;
            border-radius: 2px;
            cursor: pointer;
        }
        .tpt-login a {
            text-decoration: none;
            color: #007bff;
            font-size: 18px;
            color: #3581b9;
        }
        span{
            color: red;
        }
    </style>
</head>
<body>
<%
    String userName = (String)session.getAttribute("username");
    if(userName==null){
        out.println("请登录后查看！");
        return;
    }
%>
<div class="tpt-login">
    <h2>修改用户</h2>
    <form action="UpdateUserServlet">
        <input type="text" name="type" value="m" hidden="hidden">
        <input type="text" name="id" value="${finduser.id}" hidden="hidden">
        <span>${updateBean.errors.username}</span>
        <input type="text" name="username" value="${finduser.username}">
        <span>${updateBean.errors.password}</span>
        <input type="text" name="password" value="${finduser.password}">
        <button>修改</button>
    </form>
</div>
</body>
</html>
