package com.school.shop.shae.controller;

import com.school.shop.util.FileUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by Administrator on 2015/5/3.
 */
@Controller
@RequestMapping("file")
public class FileController {

    @RequestMapping(value = "/img/upload", method= RequestMethod.POST)
    @ResponseBody
    public String uploadCommunityPics(HttpServletRequest request) {
        List<String> paths = FileUtil.saveImages(request, "files", "aa");
        String id = request.getParameter("id").toString();
        return "true";
//        pictureService.addCommunityPics(communityId, paths, picNames);
//        toResponse();
    }

}
