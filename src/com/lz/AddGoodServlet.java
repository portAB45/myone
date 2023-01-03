package com.lz;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;

@WebServlet("/AddGoodServlet")
public class AddGoodServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");

        //获取传来的type操作类型up为加一，down为减一
        String type = req.getParameter("type");
        //通过传来的id获取具体商品信息，方便后续List cart移除
        String id = req.getParameter("id");
        Goods goods = GoodsDB.getGoods(id);

        HttpSession session = req.getSession();
        //获取商品数量属性
        LinkedHashMap<String,Integer> number = (LinkedHashMap<String,Integer>) session.getAttribute("number");
        //如果是加一，通过merge方法直接加一
        if(type.equals("up")) {
            number.merge(id,1,(oldValue,newValue)->oldValue+newValue);
        } else{//如果是减一，减一后判断是否为0，为0则获取属性购物车cart将其中对应的商品移除
            Integer r = number.merge(id, 1, (oldValue, newValue) -> oldValue - newValue);
            if(r==0){
                List<Goods> cart=(List)session.getAttribute("cart");
                cart.remove(goods);
            }
        }
        //重定向到购物车页面
        resp.sendRedirect("three.jsp");
    }
}
