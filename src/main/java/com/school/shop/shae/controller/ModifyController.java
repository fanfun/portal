package com.school.shop.shae.controller;

import com.school.shop.common.redis.RedisKeyCenter;
import com.school.shop.common.util.JsonUtil;
import com.school.shop.shae.model.Product;
import com.school.shop.shae.model.Student;
import com.school.shop.shae.service.ShaeService;
import com.school.shop.shae.service.StudentService;
import com.school.shop.util.Base64Util;
import freemarker.ext.beans.BeansWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Collections;
import java.util.List;

/**
 * Created by Administrator on 2015/5/3.
 */
@Controller
@RequestMapping("shae")
public class ModifyController {
    @Autowired
    private ShaeService shaeService;

    @Autowired
    private StudentService studentService;

    @ResponseBody
    @RequestMapping(value = "modify", method = RequestMethod.POST)
    public String more(String id, String content) {
        try {
            int idInt = Integer.parseInt(id);
            boolean result = shaeService.updateContent(idInt, content);
            shaeService.recordOperator(RedisKeyCenter.MODIFY);
            return result == true?"ok":"";
        }catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }

    @ResponseBody
    @RequestMapping(value = "soldOut", method = RequestMethod.POST)
    public String soldOut(String id) {
        try {
            int idInt = Integer.parseInt(id);
            boolean result = shaeService.soldOut(idInt);
            shaeService.recordOperator(RedisKeyCenter.SOLD_OUT);
            return result == true?"ok":"";
        }catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }

    @RequestMapping(value = "setting")
    public String setting() {
        return "shae/setting";
    }

    @RequestMapping(value = "info")
    public ModelAndView info(String name) {
        ModelAndView model = new ModelAndView("shae/info");
        Student student = studentService.getByName(name);
        if(student == null) {
            student = new Student();
            student.setName(name);
            student.setNick("");
            student.setNickName("");
            student.setPhone("");
        }
        model.addObject("student", student);
        return model;
    }

    @ResponseBody
    @RequestMapping(value = "setinfo")
    public String setInfo(Student student) {
        try {
            studentService.update(student);
        }catch (Exception e) {
            e.printStackTrace();
            return "false";
        }
        return "true";
    }

    @RequestMapping(value = "sell")
    public ModelAndView sell() {
        ModelAndView model = new ModelAndView("shae/sell");
        model.addObject("enums", BeansWrapper.getDefaultInstance().getEnumModels());
        return model;
    }
}
