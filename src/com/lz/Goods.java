package com.lz;

public class Goods {
    private String goodsId;//商品编号
    private String goodsName;//商品名
    private String goodsPic;//商品图片

    public Goods() {
    }

    public Goods(String  goodsId, String goodsName, String goodsPic) {
        this.goodsId = goodsId;
        this.goodsName = goodsName;
        this.goodsPic = goodsPic;
    }

    public String getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String getGoodsPic() {
        return goodsPic;
    }

    public void setGoodsPic(String goodsPic) {
        this.goodsPic = goodsPic;
    }
}
