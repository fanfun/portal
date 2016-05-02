package com.school.shop.common.enumerate;


/**
 * Created by ruanzf on 2015/4/22.
 */
public enum StatusEnum {

    DEL(1, "已删除"),
    SOLDOUT(2, "已下架"),
    OK(3, "待售")
    ;

    private int id;
    private String name;

    StatusEnum(int id, String name) {
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

    public static String getById(int id) {
        for(StatusEnum productEnum : StatusEnum.values()) {
            if(productEnum.getId() == id) {
                return productEnum.getName();
            }
        }
        return OK.getName();
    }
}
