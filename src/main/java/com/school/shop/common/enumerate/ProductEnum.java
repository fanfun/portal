package com.school.shop.common.enumerate;


import com.school.shop.shae.model.Product;

/**
 * Created by ruanzf on 2015/4/22.
 */
public enum ProductEnum {

    ASK_BUY(10, "求"),
    SELL(1, "卖"),
    NONE(0, "NONE"),
    ;

    private int id;
    private String name;

    ProductEnum(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public String getIdString() {
        return id + "";
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public static int size() {
        return 6;
    }

    public static ProductEnum getById(int id) {
        if(id == ASK_BUY.getId()) {
            return ASK_BUY;
        }else if(id == SELL.getId()) {
            return SELL;
        }else {
            return NONE;
        }
    }

    public static String getNameById(int id) {
        ProductEnum productEnum = getById(id);
        return productEnum.getName();
    }
}
