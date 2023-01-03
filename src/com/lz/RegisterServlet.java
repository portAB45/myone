package com.lz;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
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

        String username=req.getParameter("username");
        String password1=req.getParameter("password1");
        String password2=req.getParameter("password2");
        // 将获取的参数封装到注册表单相关的RegisterBean类中，以供查询验证数据是否输入合法
        RegisterBean formBean = new RegisterBean();
        formBean.setUserame(username);
        formBean.setPassword1(password1);
        formBean.setPassword2(password2);
        // 验证参数填写是否符合要求，如果不符合，转发到user_register.jsp重新填写
        if(!formBean.validate()){
            req.setAttribute("formBean", formBean);
            req.getRequestDispatcher("/user_register.jsp").forward(req, resp);
            return;
        }

        //参数填写符合要求
        Connection conn=null;
        Statement st=null;
        PreparedStatement pst=null;
        ResultSet rs=null;
        PreparedStatement prst=null;

        String selectUsername="select username from users;";
        String sql="insert into users(username,password) values (?,?)";
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
            if(usernameList.contains(username)){
                req.setAttribute("DBMes","你注册的用户已存在");
                req.setAttribute("formBean",formBean);
                req.getRequestDispatcher("/user_register.jsp").forward(req,resp);
            }else{
                //用户不存在，注册，将用户信息添加到数据库
                prst=conn.prepareStatement(sql);
                prst.setString(1,username);
                prst.setString(2,password1);
                prst.executeUpdate();

                String username1 = (String)req.getSession().getAttribute("username");
                if(username1==null){
                    resp.getWriter().print("恭喜你注册成功，3秒后自动跳转");
                    // 注册成功后，3秒跳转到首页
                    resp.setHeader("refresh","3;url=index.jsp");
                }else{
                    resp.getWriter().print("添加成功，3秒后自动跳转");
                    // 注册成功后，3秒跳转到管理页面
                    resp.setHeader("refresh","3;url=ShowAllServlet");
                }

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
