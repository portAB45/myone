package com.lz;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/ShowAllServlet")
public class ShowAllServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");

        //实例化包含从数据库中查询所有用户信息、根据id查找指定用户信息、删除用户、修改用户信息的java类
        UsersDao usersDao = new UsersDao();
        try {
            //调用方法获取数据库中所有用户信息，并添加到属性中
            ArrayList<Users> list=usersDao.findAll();
            req.setAttribute("users",list);
        }catch (Exception e){}
        finally {
            //请求转发到jsp页面进行显示
            req.getRequestDispatcher("/two.jsp").forward(req,resp);
        }
    }
}
