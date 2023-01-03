package com.lz;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DelUserServlet")
public class DelUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");

        UsersDao usersDao = new UsersDao();
        int id = Integer.parseInt(req.getParameter("id"));
        usersDao.delete(id);
        resp.getWriter().print("删除成功，3秒后自动跳转");
        // 删除成功后，3秒跳转到管理页面
        resp.setHeader("refresh","3;url=ShowAllServlet");
         //将更新后的数据传入显示所有用户servlet中
//        req.getRequestDispatcher("/ShowAllServlet").forward(req,resp);
    }
}
