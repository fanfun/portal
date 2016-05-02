package com.school.shop.common.redis;

import org.springframework.stereotype.Component;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import javax.annotation.Resource;

/**
 * @author zhangj
 * @date 2013-11-8
 */
@Component
public class PublicRedisOperator extends RedisOperator {
	
	@Resource(name = "publicJedisPool")
	private JedisPool publicJedisPool;
	
	@Override
	public Jedis getJedis() {
		return publicJedisPool.getResource();
	}
	
	@Override
	public void closeJedis(Jedis jedis) {
		publicJedisPool.returnResource(jedis);
	}
	
	@Override
	public void closeJedisPool() {
		publicJedisPool.destroy();
	}
}
