package com.school.shop.util;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

/**
 * Created by Administrator on 2016/5/8.
 */
public class FileUtil {

    private final static Logger logger = LoggerFactory.getLogger(FileUtil.class);

    private static final String[] allowUploadFileSuffix = new String[]{"gif","jpg","jpeg","png","bmp"};

    public static final String IMAGE_UPLOAD_PREFFIX = "img/";
    public static final int MAX_SIZE = 10 * 1024 * 1024;

    public static List<String> saveImages(HttpServletRequest request, String uploadName, String filePath) {
        if(StringUtils.isEmpty(filePath) || null == request) {
            return null;
        }
        if(!(request instanceof MultipartHttpServletRequest)) {
            return null;
        }
        if(((MultipartHttpServletRequest)request).getFile(uploadName) == null
                || ((MultipartHttpServletRequest)request).getFile(uploadName).getSize() <= 0) {
            return null;
        }

        MultipartHttpServletRequest multiReq = (MultipartHttpServletRequest)request;
        List<String> pathList = new ArrayList<String>();

        try {
            for(MultipartFile file : multiReq.getFiles(uploadName)) {
                if(file != null && file.getSize() > 0) {
                    String path = saveAsFile(file,
                            IMAGE_UPLOAD_PREFFIX.concat(filePath),
                            UUID.randomUUID().toString(),
                            MAX_SIZE
                    );
                    if (!StringUtils.isEmpty(path)) {
                        pathList.add(path);
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return pathList;
    }

    public static String saveAsFile(MultipartFile file, String path, String name, long maxSize) throws IOException,RuntimeException {
        if( null == file || StringUtils.isEmpty(path) || StringUtils.isEmpty(name)) {
            logger.debug("上传文件参数有错");
            return null;
        }

        String savedName = "";
            if (null != file && 0<file.getSize()) {
                byte[] data = file.getBytes();
                //检查文件大小
                if(file.getSize() > maxSize) {
                    logger.debug("上传文件大小超过限制。");
                    return null;
                }

                //检查扩展名
                String tmpfileName = file.getOriginalFilename();
                String fileExt = tmpfileName.substring(tmpfileName.lastIndexOf(".") + 1).toLowerCase();
                if( null != fileExt) {
                    if(!Arrays.<String>asList(allowUploadFileSuffix).contains(fileExt)) {
                        logger.debug("上传文件扩展名是不允许的扩展名。\n只允许" + allowUploadFileSuffix + "格式。");
                        return null;
                    }
                    savedName = saveFile(data, path, name + "." + fileExt);
                }
            }else {
                logger.debug(" ==== Uploader saveAsFile 上传文件 " + file.getOriginalFilename() + " 为空");
                return null;
            }
        return savedName;
    }

    private static String saveFile(byte[] data,String path,String fileName) throws IOException
    {
        String savePath = "D:".concat(File.separator).concat(path);
        File foder = new File(savePath);
        if (!foder.exists()) {
            if( !foder.mkdirs() ) {
                logger.debug("上传文件时，创建文件夹" + foder.getAbsolutePath() + "失败");
                throw new RuntimeException("上传文件时，创建文件夹失败");
            }
        }
        File file = new File(savePath,fileName);
        FileCopyUtils.copy(data, file);
        return path + "/" + fileName;
    }
}
