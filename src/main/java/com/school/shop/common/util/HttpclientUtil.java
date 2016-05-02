package com.school.shop.common.util;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.MultiThreadedHttpConnectionManager;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Map;

/**
 * @author zhangj
 */
public class HttpclientUtil {
    private final static Logger logger = LoggerFactory.getLogger(HttpclientUtil.class);

    private static String doGetRequest(String reqURL) {

        long begin = System.currentTimeMillis();

        String responseContent = null; // 响应内容
        HttpClient httpClient = new HttpClient();


		GetMethod getMethod = new GetMethod(reqURL);

		try {
			// 执行getMethod
			int statusCode = httpClient.executeMethod(getMethod);
			if (statusCode != HttpStatus.SC_OK) {
				System.err.println("Method failed: "
						+ getMethod.getStatusLine());
			}
			// 处理内容
			responseContent = getMethod.getResponseBodyAsString();

//			logger.info("GET请求地址：{}", getMethod.getURI().toString());
//			logger.info("请求返回的结果：{}", responseContent);
		} catch (Exception e) {
			// 发生致命的异常，可能是协议不对或者返回的内容有问题
			logger.error("httpClient GET请求出错",e);
			e.printStackTrace();
		}  finally {
			// 释放连接
			getMethod.releaseConnection();
        }
        long end = System.currentTimeMillis();
        logger.info("GET request costs {} ms", (end - begin));

        return responseContent;
	}

	private static String doPostRequest(String reqURL, Map<String, Object> params) {

		String responseContent = null; // 响应内容
        HttpClient httpClient = new HttpClient();


        PostMethod postMethod = new PostMethod(reqURL);
		try {
            for (Map.Entry<String, Object> entry : params.entrySet()) {
                postMethod.addParameter(entry.getKey(), entry.getValue().toString());
            }

            // 执行getMethod
			int statusCode = httpClient.executeMethod(postMethod);
			if (statusCode != HttpStatus.SC_OK) {
				System.err.println("Method failed: "
						+ postMethod.getStatusLine());
			}
			// 处理内容
			responseContent = postMethod.getResponseBodyAsString();

//			System.out.println("请求地址: " + getMethod.getURI());
//			System.out.println("响应状态: " + getMethod.getStatusLine());
//			System.out.println("响应内容: " + responseContent);
//			logger.info("post请求地址："+postMethod.getURI());
//            logger.info("post请求内容：");
//            for (NameValuePair p : postMethod.getParameters()) {
//                logger.info(p.toString());
//            }
//			logger.info("请求返回的结果"+responseContent);
		} catch (Exception e) {
			// 发生致命的异常，可能是协议不对或者返回的内容有问题
			logger.error("httpClient post请求出错",e);
			e.printStackTrace();
		}  finally {
			// 释放连接
			postMethod.releaseConnection();
		}
		return responseContent;
	}


	/**
	 * @param url
	 * @return
	 */
	public static String sendRequest(String url){
		return HttpclientUtil.doGetRequest(url);
	}
    /**
     * @param url
     * @return
     */
    public static String sendGetRequest(String uri, Map<String, Object> params){
        return HttpclientUtil.doGetRequest(uri + "?" + getParamStr(params));
    }

    /**
     * @param url
     * @return
     */
    public static String sendPostRequest(String url, Map<String, Object> params){
        return HttpclientUtil.doPostRequest(url, params);
    }
	/**
	 * @param params
	 * @return
	 */
	public static String getParamStr(Map<String, Object>params){
		StringBuffer strParam = new StringBuffer();

        for (Map.Entry<String, Object> entry : params.entrySet()) {
            strParam.append(entry.getKey()).append("=").append(entry.getValue().toString()).append("&");
        }

		return strParam.toString();
	}


	/**
	 * @return 创建多线程client
	 */
	private HttpClient createHttpClient() {
		MultiThreadedHttpConnectionManager connectionManager = new MultiThreadedHttpConnectionManager();
		HttpClient client = new HttpClient(connectionManager);
		return client;
	}

	public static void main(String[] args) {
		String url = "http://localhost:8080/vos/mproxy/testPost";
//		System.out.println(HttpclientUtil.doGetRequest(url));
		HttpclientUtil.sendRequest(url);
	}
}
