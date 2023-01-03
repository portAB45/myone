<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户注册</title>
    <link rel="icon" href="./tup/logo.webp" sizes="16*16">
    <style>
        body {
            background: #252935;
        }
        .tpt-login {
            width: 360px;
            height: 490px;
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
            font-size: 14px;
            color: #3581b9;
        }
        .sp {
            position: relative;
            display: inline-block;
            width: 7px;
            height: 7px;
            border-radius: 100%;
            border: 1px solid #ff5722;
            padding: 4px;
            top: 4px;
            margin-right: 6px;
        }
        .tpt-login i {
            position: absolute;
            display: inline-block;
            width: 7px;
            height: 7px;
            border-radius: 100%;
            background: #ff5722;
        }
        span:not(.sp){
            color: #ff0000;
        }
    </style>
</head>
<body>
<div class="tpt-login">
    <h2>用户注册</h2>
    <form action="RegisterServlet">
        <div class="tooltip">
            <span>${formBean.errors.username}${DBMes}</span>
            <input type="text" name="username" placeholder="请输入账号" value="${formBean.username }">
            <span>${formBean.errors.password1}</span>
            <input type="password" name="password1" placeholder="请输入密码">
            <span>${formBean.errors.password2}</span>
            <input type="password" name="password2" placeholder="请再次输入密码">
        </div>
        <p>
            <span class="sp"><i></i></span>我已阅读并同意
            <a href="#" target="_blank">用户注册协议</a>
        </p>
        <button>立即注册</button>
    </form>
</div>
</body>
</html>
