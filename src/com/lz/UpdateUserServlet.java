package com.lz;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet {
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

        UsersDao usersDao = new UsersDao();
        UpdateBean updateBean = new UpdateBean();
        String type = req.getParameter("type");
        //从修改表单界面传来时
        if(type!=null&&type.equals("m")){
            try {
                int id=Integer.parseInt(req.getParameter("id"));
                String username = req.getParameter("username");
                String password = req.getParameter("password");
                updateBean.setUsername(username);
                updateBean.setPassword(password);
                //修改时，输入的数据不合法
                if(!updateBean.validate()){
                    //将不合法信息带给jsp
                    req.setAttribute("updateBean", updateBean);
                    req.getRequestDispatcher("/update.jsp").forward(req,resp);
                }else{
                //输入数据合法
                Users user = new Users(id,username,password);
                //更新数据库中数据
                usersDao.update(user);
                //将更新后的数据传入显示所有用户servlet中
                req.getRequestDispatcher("/ShowAllServlet").forward(req,resp);}
            }catch (Exception e){}
        }else{
            //修改前查询将值传递给update.jsp
            try{
                int id=Integer.parseInt(req.getParameter("id"));
                Users users = usersDao.find(id);
                //将用户信息保存到域对象中
                req.setAttribute("finduser",users);
                //请求转发到update.jsp
                req.getRequestDispatcher("/update.jsp").forward(req,resp);
            }catch (Exception e){}
        }
    }
}
