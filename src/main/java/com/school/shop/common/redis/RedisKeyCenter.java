package com.school.shop.common.redis;


import com.school.shop.common.enumerate.TradeEnum;

public class RedisKeyCenter {

    public static String SELL = "PORTAL_SELL";
    public static String ASK_BUY = "PORTAL_ASL_BUY";
    public static String SOLD_OUT = "SOLD_OUT";
    public static String MODIFY = "PORTAL_MODIFY";
    public static String MANUAL = "PORTAL_MANUAL";
    public static String MORE_SELL = "PORTAL_MORE_SELL";
    public static String MORE_ASKBUY = "PORTAL_MORE_ASKBUY";

    public static String getItemName(int item) {
        TradeEnum tradeEnum = TradeEnum.getById(item);
        return "PORTAL_" + tradeEnum.getCode();
    }
}
