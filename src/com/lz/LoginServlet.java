package com.lz;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        Connection conn=null;
        Statement st=null;
        ResultSet rs=null;
        PreparedStatement ptst=null;

        String loginName=req.getParameter("username");
        String loginPassword=req.getParameter("password");
        Map<String, String> er = new HashMap<String, String>();
        if(loginName.equals("")||loginPassword.equals("")){
            if(loginName.equals("")){
                er.put("username","请输入用户名.");
            }
            if(loginPassword.equals("")){
                er.put("password","请输入密码.");
            }
            req.setAttribute("er",er);
            req.getRequestDispatcher("/user_login.jsp").forward(req,resp);
            return;
        }

        String selectUsername="select username from users;";
        String selectPassword="select password from users where username=?;";
        try{
            conn=new GetConnection().getConnection();
            //获取Statement
            st=conn.createStatement();
            //执行SQL语句并获得结果集
            rs=st.executeQuery(selectUsername);
            List<String> usernameList=new ArrayList<String>();
            //循环游标向下走，获取当前表中所有用户名并保存到usernameList中
            while (rs.next()){
                usernameList.add(rs.getString(1));
            }
            //使用完毕，关闭数据库
            if(rs!=null){
                rs.close();
            }
            if(st!=null){
                st.close();
            }
            //用户存在
            if(usernameList.contains(loginName)){
                List<String> passwordList=new ArrayList<String>();
                //使用预执行Statement，查询用户名为loginName的密码
                ptst=(PreparedStatement) conn.prepareStatement(selectPassword);
                ptst.setString(1,loginName);
                //获取查询结果集
                rs=ptst.executeQuery();
                //移动游标，将查询到的密码保存到passwordList
                while (rs.next()){
                    passwordList.add(rs.getString(1));
                }
                //密码匹配，登录成功，重定向到首页
                if(passwordList.get(0).equals(loginPassword)){
                    HttpSession session = req.getSession();
                    session.setAttribute("username",loginName);

                    Cookie cookie = new Cookie("JSESSIONID", session.getId());
                    cookie.setMaxAge(6000);//6000秒，100分钟
                    resp.addCookie(cookie);

                    resp.sendRedirect("index.jsp");
                    //out.println("欢迎您！");
                }else{
                    //密码输入错误,将用户名及错误信息带回给登录页面
                    er.put("password","密码错误.");
                    req.setAttribute("er",er);
                    req.setAttribute("name",loginName);
                    req.getRequestDispatcher("/user_login.jsp").forward(req,resp);
                    //out.println("密码错误，请重新输入。");
                }
                //使用完，关闭数据库
                if(rs!=null){
                    rs.close();
                }
                if(ptst!=null){
                    ptst.close();
                }
            }else{
                //用户不存在
                er.put("username","用户不存在.");
                req.setAttribute("er",er);
                req.getRequestDispatcher("/user_login.jsp").forward(req,resp);
                //out.println("用户不存在");
            }
        }catch (ClassNotFoundException e){
            e.printStackTrace();
        }catch (SQLException e){
            e.printStackTrace();
        }
        finally {
            //最后，关闭数据库
            if(conn!=null){
                try{
                    conn.close();
                }catch (SQLException e){
                    e.printStackTrace();
                }
            }
        }
        out.flush();
        out.close();
    }
}
