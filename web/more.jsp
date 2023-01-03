<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>更多</title>
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
        color: #51aded;
    }
</style>
<ul>
    <li><a href="index.jsp">首页</a></li>
    <li><a href="one.jsp">瓷器产品</a></li>
    <li><a href="ShowAllServlet">后台管理</a></li>
    <li><a href="three.jsp">购物车</a></li>
    <li><a class="active" href="more.jsp">更多</a></li>
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
<img src="./tup/640.png" width="242" height="362">
<h3>纪录片:<a href="https://www.bilibili.com/bangumi/play/ss39872?spm_id_from=333.337.0.0"> 《我是你的瓷儿》</a></h3>
<p>
    <b style="color: darkorange">非遗纪录片《我是你的瓷儿》</b>全集已于<b style="color: darkorange">B站</b>上线播出，站内评分达9.8分。
</p>
<h3>执导人员</h3>
<p>
    中国传媒大学02级艺术设计专业（数字影视制作方向）校友<b style="color: darkorange">关子健</b>担任总导演、联合出品人<br />
    中国传媒大学02级科学艺术系校友<b style="color: darkorange">王波</b>担任联合出品人<br />
    中国传媒大学02级电视新闻专业校友<b style="color: darkorange">王浩</b>担任摄影指导<br />
</p>
<h3>主题曲<audio src="./tup/瓷语.mp3" controls>瓷语</audio></h3>
<p>
    纪录片主题曲<b style="color: darkorange">《瓷语》</b>，由<b style="color: darkorange">歌手李玉刚与洛天依</b>的合作，婉转戏腔与空灵电音，跨越虚拟与现实的梦幻联动，碰撞出奇妙的化学反应。
</p>
<h3>介绍</h3>
<p>“我，来自北宋景德元年，为了见到你，我已经走了一千年。”
    纪录片《我是你的瓷儿》从普通人的角度出发，以中国瓷器为主线贯穿在片中。镜头走进景德镇，通过讲述手工瓷器之美，拉进人们与瓷儿的距离、与历史的距离。
    采用短篇幅、小体量的拍摄技巧，特别聚焦颜色与瓷器之间的“爱恨情仇”。<br /></p>
<p><img src="./tup/640.gif"></p>
   <p style="color: darkgray;margin: 0;padding: 0px">《我是你的瓷儿》纪录片画面</p>
    <p>
    从简单的单色釉，到青花、斗彩、五彩再拓展到现代创新装饰艺术，沿着手工瓷器的发展时光轴，依次讲述瓷儿们背后的身世与故事。
    解构式的人格化叙事，生动传递相关瓷器知识，必要时化学方程式也能加入解说。
    在纪录片的制瓷片段里，人们完成了一场穿越古今的对话。
    <b style="color: darkorange">这些制瓷人对瓷器的热爱、敬畏与传承，使中国瓷器文明得以源远流长、生生不息。</b>
</p>
</body>
</div>
</html>
