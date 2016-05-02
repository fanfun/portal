package com.school.shop.common.redis;

/**
 * User: robin
 * Date: 13-5-7
 * Time: 上午10:30
 */
public class RedisServer {
    private String host;
    private Integer port;

    public RedisServer(String host, Integer port) {
        this.host = host;
        this.port = port;
    }

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public Integer getPort() {
        return port;
    }

    public void setPort(Integer port) {
        this.port = port;
    }
}
