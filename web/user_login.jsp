<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户登录</title>
    <link rel="icon" href="./tup/logo.webp" sizes="16*16">
    <style>
        body {
            background: #252935;
        }
        .tpt-login {
            width: 360px;
            height: 400px;
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
            font-size: 25px;
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
        .tpt-login p {
            font-size: 14px;
            color: #777;
        }
        .tpt-login a {
            text-decoration: none;
            color: #007bff;
            font-size: 18px;
            color: #3581b9;
        }
        .sp {
            font-size: 18px;
        }
        span:not(.sp){
            color: #ff0000;
        }
    </style>
</head>
<body>
<div class="tpt-login">
    <h2>用户登录</h2>
    <form action="LoginServlet">
        <span>${er.username}</span>
        <input type="text" name="username" placeholder="请输入账号" value="${name}">
        <span>${er.password}</span>
        <input type="password" name="password" placeholder="请输入密码">
        <p>
            <span class="sp">还没有注册账户？</span>
            <a href="user_register.jsp">立即注册</a>
        </p>
        <button>立即登录</button>
    </form>
</div>
</body>
</html>
