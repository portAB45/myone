<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>景德镇陶瓷艺术文化网</title>
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
        .bg{
            padding-top: 0;
            margin-right: 0;
            overflow: hidden;
            width:1200px;
            height:400px;
        }

        /*底部版权所有样式*/
        .gcs-footer{
            margin-top: 20px;
            background:#222c3a;
            width: 1200px;
            height: 165px;
            text-align: center;
            color: white;
            position: absolute;
        }
        .gcs-footer .footer-top{
            margin-top: 50px;
        }
        .gcs-footer a{
            color: #f0f1f1;
            text-decoration: none;
            padding: 0 10px;
            vertical-align:middle;
        }
        .gcs-footer a:hover{
            color: red;
            text-decoration: underline;
        }
        .gcs-footer p{
            height: 15px;
            color: #888888;
            margin-top: 30px;
        }
    </style>
    <ul>
        <li><a class="active" href="index.jsp">首页</a></li>
        <li><a href="one.jsp">瓷器产品</a></li>
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
    <div class="bg">
        <%--object-fit值fill打破视频宽高比填充容器--%>
        <video src="./tup/bg.mp4" autoplay loop muted style="width: 100%;height: 100%;object-fit: fill" ></video>
    </div>
    <h3>陶瓷文化介绍</h3>
    <p>&nbsp;&nbsp;&nbsp;&nbsp;瓷器是中国劳动人民的重要发明之一，是其智慧和力量的结晶。景德镇陶瓷始于汉世，五代时的景德镇以南方最早烧造白瓷之地和其白瓷的较高成就而奠定了自己的地位，
        从而打破了青瓷在南方的垄断局面和形成“南青北白”的格局，对于宋代青白瓷的制作，对于元、明、清瓷业的发展有着极为重要的作用。
        景德镇陶瓷大量系艺术陶瓷、生活用瓷和陈设用瓷，以白瓷为著称，素有“白如玉，明如镜，薄如纸，声如磬”之称，品种齐全，曾达三千多种品名。
        瓷质优良，造型轻巧，装饰多样。在装饰方面有青花、釉里红、古彩、粉彩、斗彩、新彩、釉下五彩、青花玲珑等，其中尤以青花、粉彩产品为大宗，颜色釉为名产。
        釉色品种很多，有青、蓝、红、黄、黑等类。</p>
    <%--弹性盒子flex--%>
    <div style="display: flex;align-items: center">
        <div style="font-size: 24px;text-indent: 13px;padding-right: 8px;color: cadetblue">景德镇产品</div>
        <a href="./tup/1.webp"><img src="./tup/1.webp" width="150px" height="150px"></a>
        <a href="./tup/2.webp"><img src="./tup/2.webp" width="150px" height="150px"></a>
        <a href="./tup/3.webp"><img src="./tup/3.webp" width="150px" height="150px"></a>
        <a href="./tup/4.webp"><img src="./tup/4.webp" width="150px" height="150px"></a>
        <a href="./tup/5.webp"><img src="./tup/5.webp" width="150px" height="150px"></a>
        <a href="./tup/6.webp"><img src="./tup/6.webp" width="150px" height="150px"></a>
    </div>
    <h3>陶瓷分类</h3>
    <p>&nbsp;&nbsp;&nbsp;&nbsp;景德镇瓷器造型优美，品种繁多，装饰丰富，风格独特。瓷质“白如玉、明如镜、薄如纸，声如磐”，景德镇陶瓷艺术是中国文化宝库中的重要财富。
        青花、玲珑、粉彩、颜色釉，合称景德镇四大传统名瓷，薄胎瓷人称神奇珍品，雕塑瓷为我国传统工艺美术品。</p>
    <table width="1200" border="0" align="center" cellpadding="0" cellspacing="1">
        <tr>
            <td width="200" height="200">
                <%--cellpadding边距 就是表格的边框的宽度 ；cellspacing间距 是表格里的单元格之间的距离--%>
                <table width="180" height="180" border="0" cellpadding="0" cellspacing="1">
                    <tr>
                        <td width="40"><%--将文本宽度缩小，使文字竖向展示--%>
                            <a href="#">
                                <div style="font-size: 20px;padding-right: 8px;color: cadetblue">陈设瓷</div>
                            </a>
                        </td>
                        <td>
                            <div align="center">
                                <a href="#">
                                    <img src="./tup/4.webp" alt="陈设瓷" width="150" height="150" border="0" target="_blank">
                                </a>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
            <td width="200" height="200">
                <table width="180" height="180" border="0" cellpadding="0" cellspacing="1">
                    <tr>
                        <td width="40">
                            <a href="#">
                                <div style="font-size: 20px;padding-right: 8px;color: cadetblue">瓷板画</div>
                            </a>
                        </td>
                        <td>
                            <div align="center">
                                <a href="#">
                                    <img src="./tup/玉软花柔.jpg" alt="玉软花柔瓷板画" width="150" height="150" border="0" target="_blank">
                                </a>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
            <td width="200" height="200">
                <table width="180" height="180" border="0" cellpadding="0" cellspacing="1">
                    <tr>
                        <td width="40">
                            <a href="#">
                                <div style="font-size: 20px;padding-right: 8px;color: cadetblue">仿古瓷</div>
                            </a>
                        </td>
                        <td>
                            <div align="center">
                                <a href="#">
                                    <img src="./tup/仿清乾隆青花缠枝莲托八宝纹双耳瓶.jpg" alt="仿清乾隆青花缠枝莲托八宝纹双耳瓶" width="150" height="150" border="0" target="_blank">
                                </a>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td width="200" height="200">
                <table width="180" height="180" border="0" cellpadding="0" cellspacing="1">
                    <tr>
                        <td width="40">
                            <a href="#">
                                <div style="font-size: 20px;padding-right: 8px;color: cadetblue">日用瓷</div>
                            </a>
                        </td>
                        <td>
                            <div align="center">
                                <a href="#">
                                    <img src="./tup/6.webp" alt="日用瓷" width="150" height="150" border="0" target="_blank">
                                </a>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
            <td width="200" height="200">
                <table width="180" height="180" border="0" cellpadding="0" cellspacing="1">
                    <tr>
                        <td width="40">
                            <a href="#">
                                <div style="font-size: 20px;padding-right: 8px;color: cadetblue">高科技瓷</div>
                            </a>
                        </td>
                        <td>
                            <div align="center">
                                <a href="#">
                                    <img src="./tup/5.webp" alt="高科技瓷" width="150" height="150" border="0" target="_blank">
                                </a>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
            <td width="200" height="200">
                <table width="180" height="180" border="0" cellpadding="0" cellspacing="1">
                    <tr>
                        <td width="40">
                            <a href="#">
                                <div style="font-size: 20px;padding-right: 8px;color: cadetblue">瓷酒瓶</div>
                            </a>
                        </td>
                        <td>
                            <div align="center">
                                <a href="#">
                                    <img src="./tup/1.webp" alt="瓷酒瓶" width="150" height="150" border="0" target="_blank">
                                </a>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <h3>陶瓷工艺</h3>
    <p>1、练泥：采取瓷石，用铁锤敲碎到鸡蛋大小的块状，再用水碓舂打成粉状，经过淘洗，去除杂质，沉淀后制成砖状的泥块。<br />
        2、拉坯：把泥团摔在辘轳车的转盘中心，顺着手法的屈伸收放，拉制出坯体的基本模样。<br />
        3、印坯：印模外形是按坯体内形弧线旋削而成，把晾到半干的坯，覆盖在模种上，均匀按拍坯体外壁，再脱模即可。<br />
        4、利坯：把坯覆放在辘轳车的利桶上，边转动车盘，边用刀旋削，当坯体的厚度适当即可。<br />
        5、晒坯：把加工成型的坯，摆放在木架上进行晾晒。<br />
        6、刻花：使用竹子、骨或铁制的刀具，在干坯体上刻画花纹。<br />
        7、施釉：普通圆器一般采用醮釉或荡釉，琢器或大型圆器是用吹釉。<br />
        8、烧窑：先把陶瓷制品装进匣钵里，烧窑时间约一昼夜，温度在1300度左右，还要测看火候，由此决定停火时间。
    </p>
    <h3>制作者</h3>
    <p>
        软件工程<br />
        2002班<br />
        20203206220<br />
        宋志燕
    </p>
    <div class="gcs-footer">
        <div class="footer-top">
            <a href="https://www.hupu.com/">虎扑网</a> |
            <a href="https://news.sina.com.cn/">新浪网</a> |
            <a href="https://www.zhihu.com/">知乎</a> |
            <a href="https://www.thepaper.cn/">澎湃新闻</a> |
            <a href="https://movie.douban.com/">豆瓣电影</a> |
            <a href="https://www.bilibili.com/">哔哩哔哩</a> |
        </div>
        <p>
            ©Copyright 2022 景德镇陶瓷艺术文化网版权所有 | 赣ICP备13222592号
        </p>
    </div>
    </body>
</div>
</html>
