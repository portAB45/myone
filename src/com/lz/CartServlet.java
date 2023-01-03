package com.lz;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");

        //类似购物车，为session设置属性cart，可通过该属性查看已经加入购物车的商品
        String id = req.getParameter("GoodsId");
        if(id==null){
            resp.sendRedirect("one.jsp");
            return;
        }
        Goods goods = GoodsDB.getGoods(id);
        HttpSession session = req.getSession();

        //实现商品数量统计，num<id,number>记录id号为id的商品的数量number
        LinkedHashMap<String,Integer> num = (LinkedHashMap<String,Integer>)session.getAttribute("number");
        if(num==null){
            num = new LinkedHashMap<String,Integer>();
            session.setAttribute("number",num);
        }
        //merge方法，当商品编号从超链接传过来，value为1表示如果商品存在则数量值加1，不存在则添加并设置数量值为1
        int returnValue=num.merge(id,1,(oldValue,newValue)->oldValue+newValue);

        //购物车，记录已购商品
        List<Goods> cart=(List)session.getAttribute("cart");
        if(cart==null){
            cart=new ArrayList<Goods>();
            session.setAttribute("cart",cart);
        }

        //如果商品数量为1，即商品以前从未买过则将商品加入购物车
        if(num.get(id)==1){
            cart.add(goods);
        }
        resp.sendRedirect("one.jsp");
    }
}
