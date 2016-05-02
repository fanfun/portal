package com.school.shop.shae.controller;

import com.school.shop.common.enumerate.ProductEnum;
import com.school.shop.common.redis.RedisKeyCenter;
import com.school.shop.common.util.JsonUtil;
import com.school.shop.shae.model.Product;
import com.school.shop.shae.service.ShaeService;
import com.school.shop.util.Base64Util;
import freemarker.ext.beans.BeansWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Collections;
import java.util.List;

/**
 * Created by Administrator on 2015/5/3.
 */
@Controller
@RequestMapping("shae")
public class QueryController {
    @Autowired
    private ShaeService shaeService;

    @RequestMapping(value = "manual")
    public String usedIndex() {
        return "shae/manual";
    }

    @RequestMapping(value = "query")
    public ModelAndView query(String type) {
        ModelAndView mv;
        try {
            String param = new String(Base64Util.decode(type));
            int typeInt = Integer.parseInt(param);
            ProductEnum productEnum = ProductEnum.getById(typeInt);
            if(productEnum.equals(ProductEnum.SELL)) {
                shaeService.recordOperator(RedisKeyCenter.SELL);
                mv = new ModelAndView("shae/product");
                mv.addObject("item", 0);
                mv.addObject("enums", BeansWrapper.getDefaultInstance().getEnumModels());
            }else if(productEnum.equals(ProductEnum.ASK_BUY)) {
                shaeService.recordOperator(RedisKeyCenter.ASK_BUY);
                mv = new ModelAndView("shae/askbuy");
            }else {
                mv = new ModelAndView("shae/manual.ftl");
            }
            List<Product> products = shaeService.getProducts(typeInt);
            mv.addObject("products", products);
            int count = products.size();
            if(count > 0) {
                Product last = products.get(count -1);
                mv.addObject("last", last.getId());
            }else {
                mv.addObject("last", 0);
            }

        }catch (Exception e) {
            e.printStackTrace();
            mv = new ModelAndView("shae/manual.ftl");
        }
        return mv;
    }

    @ResponseBody
    @RequestMapping(value = "askbuy")
    public String askbuy(String last) {
        try {
            int typeInt = ProductEnum.ASK_BUY.getId();
            int lastInt = Integer.parseInt(last);
            List<Product> products = shaeService.getMore(typeInt, lastInt);
            shaeService.recordOperator(RedisKeyCenter.MORE_ASKBUY);
            String response = JsonUtil.toJson(products);
            return response;
        }catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }

    @ResponseBody
    @RequestMapping(value = "product")
    public String product(String item, String last) {
        try {
            int typeInt = ProductEnum.SELL.getId();
            int itemInt = Integer.parseInt(item);
            int lastInt = Integer.parseInt(last);
            List<Product> products;
            if(itemInt == 0) {
                products = shaeService.getMore(typeInt, lastInt);
            }else {
                products = shaeService.getMore(typeInt, itemInt, lastInt);
            }
            shaeService.recordOperator(RedisKeyCenter.MORE_SELL);
            String response = JsonUtil.toJson(products);
            return response;
        }catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }

    @ResponseBody
    @RequestMapping(value = "item")
    public String productItem(String item) {
        try {
            int typeInt = ProductEnum.SELL.getId();
            int itemInt = Integer.parseInt(item);
            List<Product> products;
            if(itemInt == 0) {
                products = shaeService.getProducts(typeInt);
            }else {
                products = shaeService.getProducts(typeInt, itemInt);
            }
            shaeService.recordOperator(RedisKeyCenter.getItemName(itemInt));
            String response = JsonUtil.toJson(products);
            return response;
        }catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }

    @RequestMapping(value = "mine")
    public ModelAndView mine(String mine) {
        ModelAndView mv = new ModelAndView("shae/mine");
        try {
            String param = new String(Base64Util.decode(mine));
            List<Product> products = shaeService.getByOwner(param);
            mv.addObject("products", products);
        }catch (Exception e) {
            e.printStackTrace();
            mv.addObject("products", Collections.EMPTY_LIST);
        }
        return mv;
    }

    @RequestMapping(value = "today")
    public ModelAndView today() {
        ModelAndView mv = new ModelAndView("shae/today");
        try {
            List<Product> products = shaeService.getByToday();
            mv.addObject("products", products);
        }catch (Exception e) {
            e.printStackTrace();
            mv.addObject("products", Collections.EMPTY_LIST);
        }
        return mv;
    }

    @ResponseBody
    @RequestMapping(value = "search")
    public String search(String search, String type) {
        try {
            int typeInt = Integer.parseInt(type);
            List<Product> products = shaeService.search(typeInt, search);
            String response = JsonUtil.toJson(products);
            return response;
        }catch (Exception e) {
            return "";
        }
    }

}
