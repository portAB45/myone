package com.lz;

import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

public class GoodsDB {
    private static Map<String ,Goods> goods=new LinkedHashMap<String,Goods>();
    static {
        goods.put("3206001",new Goods("3206001","竹林七贤盘","./tup/竹林七贤盘.jpg"));
        goods.put("3206002",new Goods("3206002","青花斗彩瓷板","./tup/青花斗彩瓷板.jpg"));
        goods.put("3206003",new Goods("3206003","仿清嘉庆青花斗彩花鸟纹瓶","./tup/仿清嘉庆青花斗彩花鸟纹瓶.jpg"));
        goods.put("3206004",new Goods("3206004","橄榄瓶青花边脚粉彩山水","./tup/橄榄瓶青花边脚粉彩山水.jpg"));
        goods.put("3206005",new Goods("3206005","长颈青花瓶","./tup/长颈青花瓶.jpg"));
        goods.put("3206006",new Goods("3206006","青花缠枝莲纹高足杯","./tup/青花缠枝莲纹高足杯.jpg"));
        goods.put("3206007",new Goods("3206007","玉软花柔","./tup/玉软花柔.jpg"));
        goods.put("3206008",new Goods("3206008","双喜临门猪盘","./tup/双喜临门猪盘.jpg"));
        goods.put("3206009",new Goods("3206009","八头高档龙凤茶具","./tup/八头高档龙凤茶具.jpg"));
        goods.put("3206010",new Goods("3206010","伯牙抚琴瓷板画","./tup/伯牙抚琴瓷板画.png"));
        goods.put("3206011",new Goods("3206011","山村小景瓷板画","./tup/山村小景瓷板画.jpg"));
        goods.put("3206012",new Goods("3206012","阿里巴巴瓷板画","./tup/阿里巴巴瓷板画.png"));
        goods.put("3206013",new Goods("3206013","瓷灯1号","./tup/瓷灯1号.png"));
        goods.put("3206014",new Goods("3206014","瓷灯2号","./tup/瓷灯2号.png"));
        goods.put("3206015",new Goods("3206015","瓷灯3号","./tup/瓷灯3号.webp"));
        goods.put("3206016",new Goods("3206016","瓷灯柱1号","./tup/瓷灯柱1号.png"));
        goods.put("3206017",new Goods("3206017","瓷灯柱2号","./tup/瓷灯柱2号.jpg"));
        goods.put("3206018",new Goods("3206018","瓷灯柱3号","./tup/瓷灯柱3号.png"));
        goods.put("3206019",new Goods("3206019","瓷酒瓶1号","./tup/瓷酒瓶1号.png"));
        goods.put("3206020",new Goods("3206020","瓷酒瓶2号","./tup/瓷酒瓶2号.jpg"));
        goods.put("3206021",new Goods("3206021","瓷酒瓶3号","./tup/瓷酒瓶3号.jpg"));
        goods.put("3206022",new Goods("3206022","花瓶1号","./tup/3.webp"));
        goods.put("3206023",new Goods("3206023","花瓶2号","./tup/2.webp"));
        goods.put("3206024",new Goods("3206024","花瓶3号","./tup/花瓶3号.webp"));
        goods.put("3206025",new Goods("3206025","日用瓷","./tup/日用瓷.webp"));
        goods.put("3206026",new Goods("3206026","日用瓷盘","./tup/日用瓷盘.jpg"));

    }
    public static Collection<Goods> getAll()
    {
        return goods.values();
    }
    public static Goods getGoods(String id)
    {
        return goods.get(id);
    }
}
