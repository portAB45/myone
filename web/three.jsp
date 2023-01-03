<%@ page import="java.util.List" %>
<%@ page import="com.lz.Goods" %>
<%@ page import="java.util.LinkedHashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>购物车</title>
    <link rel="icon" href="./tup/logo.webp" sizes="16*16">
    <style>
        #all{
            width: 1200px;
            margin: 0 auto;
        }
    </style>
</head>
<div id="all">
    <body>
    <style>
        h3{
            margin: 15px 0 15px -20px;
            padding: 0 25px;
            border-left: 5px solid #51aded;
            background-color: #f7f7f7;
            font-size: 18px;
            line-height: 40px;
        }
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
        th{
            text-align: center;
        }
        th,td:not(.chu),caption{
            border-bottom: 1px solid #ddd;
        }
        button{
            font-size: 20px;
            width: 40px;
            height: 30px;
        }
        input{
            font-size: 20px;
            width: 40px;
            height: 30px;
            transform: translateY(-8px);
        }
    </style>
    <ul>
        <li><a href="index.jsp">首页</a></li>
        <li><a href="one.jsp">瓷器产品</a></li>
        <li><a href="ShowAllServlet">后台管理</a></li>
        <li><a class="active" href="three.jsp">购物车</a></li>
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
    <%
        if(userName==null){
            out.println("请登录后查看！");
            return;
        }
        boolean flag=true;
        List<Goods> cart=null;
        //num<id,number>id记录商品编号，number记录该件商品购买的数量
        LinkedHashMap<String,Integer> num =null;
        session = request.getSession(false);
        if(session==null) {
            flag = false;
        } else {
            cart = (List) session.getAttribute("cart");
            num=(LinkedHashMap<String,Integer>)session.getAttribute("number");
            if (cart == null) {
                flag = false;
            }
        }
        if(!flag) {
            out.println("购物车为空！");
        }else{
    %>
    <table align="center" cellpadding="50">
        <caption style="font-size: 30px">已购商品</caption><th>商品编号</th><th>商品图</th><th>商品名</th><th>商品数量</th>
        <%
            try {
                for (Goods good : cart) {
        %>
        <tr>
            <td><%out.print(good.getGoodsId());%>
            <td class="pop"><img width="100px" height="100px" src=<%out.print(good.getGoodsPic());%>>
            <td><%out.print(good.getGoodsName());%>
            <td><table><tr>
            <td class="chu"><form action="AddGoodServlet">
                <input type="text" name="type" value="down" hidden/>
                <input type="text" name="id" value="<%out.print(good.getGoodsId());%>" hidden/>
                <button>-</button>
            </form>
            <td class="chu"><input type="text" value="<%out.print(num.get(good.getGoodsId()));%>" readonly>
            <td class="chu"><form action="AddGoodServlet">
                <input type="text" name="type" value="up" hidden/>
                <input type="text" name="id" value="<%out.print(good.getGoodsId());%>" hidden/>
                <button>+</button>
            </form>
        </tr></table>
        </tr>
        <%  }
                }catch (Exception e){}
            }%>
    </table>
    </body>
</div>
</html>