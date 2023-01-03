package com.lz;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class GetConnection {
    Connection conn=null;
    public Connection getConnection()throws ClassNotFoundException{
        try {
            //注册驱动
            Class.forName("com.mysql.cj.jdbc.Driver");
            //获取连接,&useUnicode=true&characterEncoding=utf-8
            String url="jdbc:mysql://localhost:3306/jdbc?useSSL=false&&serverTimezone=UTC&useUnicode=true&characterEncoding=utf-8";
            String user="root";
            String password="0987";
            conn=(Connection) DriverManager.getConnection(url,user,password);
        }catch (SQLException e){
            e.printStackTrace();
        }
        return conn;
    }
}
