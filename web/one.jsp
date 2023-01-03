<%@ page import="java.util.Collection" %>
<%@ page import="com.lz.Goods" %>
<%@ page import="com.lz.GoodsDB" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>瓷器产品</title>
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
        td{
            text-align: center;
        }
        /*设置表格右侧导航栏高度*/
        .gao{
            height: 520px;
        }
        button {
            color: #ff734c;
            border: 1px solid rgba(255,115,76,0.2);
            background: #fff0ec;
            cursor: pointer;
            border-radius: 8px;
            font-size: 20px;

        }
    </style>
    <ul>
        <li><a href="index.jsp">首页</a></li>
        <li><a class="active" href="one.jsp">瓷器产品</a></li>
        <li><a href="ShowAllServlet">后台管理</a></li>
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
    <%
        int i=1;
        Collection<Goods> goods= GoodsDB.getAll();
    %>
    <table width="1200" border="0" align="center" cellpadding="0" cellspacing="1">
        <tr>
            <td width="214" height="400" valign="top" bgcolor="#fdf5e6">
                <table width="100%" border="0" align="center" cellspacing="0" cellpadding="0" class="gao">
                    <br /><tr><td><a href="#">陈设瓷</a><br /><br />
                    <tr><td><a href="#">瓷板画</a><br /><br />
                    <tr><td><a href="#">仿古瓷</a><br /><br />
                    <tr><td><a href="#">日用瓷</a><br /><br />
                    <tr><td><a href="#">高科技瓷</a><br /><br />
                    <tr><td><a href="#">瓷酒瓶</a>
                </table>
            </td>
            <td valign="top">
                <%--从模拟数据库类中获取所有商品信息，并以每行3个输出显示到购物页面--%>
                <table width="800" border="0" align="center" cellpadding="0" cellspacing="2">
                    <%
                        int k=(goods.size()-1)/3+1;
                        int m;
                        for(m=0;m<k;m++){
                            i=0;
                    %>
                    <tr>
                        <%
                            for (Goods good : goods) {
                                i=i+1;
                                if(i>3*(m+1)||i<3*m+1){
                                    continue;
                                }
                        %>
                        <td width="33%" height="110">
                            <table>
                                <tr><td><img src=<%out.println(good.getGoodsPic());%> alt=<%out.println(good.getGoodsName());%> width="150" height="100" border="0">
                                <tr><td><%out.println(good.getGoodsName());%>
                                <tr><td>编号：<%out.println(good.getGoodsId());%>
                                        <%
                                    if(userName==null){%>
                                <tr><td><a href="#"><button onclick="alert('请先登录！')">加入购物车</button></a>
                                        <%}else{%>
                                <tr><td><a href="CartServlet?GoodsId=<%out.println(good.getGoodsId());%>">
                                <button onclick="alert('商品编号为<%=good.getGoodsId()%>的商品已成功加入购物车!')">加入购物车</button></a>
                                        <%}%>
                            </table>
                        </td>
                        <%}%>
                    </tr>
                    <%}%>
                    </td>
                </table>
            </td>
        </tr>
    </table>
    </body>
</div>
</html>