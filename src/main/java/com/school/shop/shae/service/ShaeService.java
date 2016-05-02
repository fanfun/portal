package com.school.shop.shae.service;

import com.school.shop.common.enumerate.ProductEnum;
import com.school.shop.common.enumerate.StatusEnum;
import com.school.shop.common.redis.PublicRedisOperator;
import com.school.shop.common.redis.RedisOperator;
import com.school.shop.common.util.Constants;
import com.school.shop.common.util.DateUtil;
import com.school.shop.shae.model.Product;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.tools.Tool;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

/**
 * Created by Administrator on 2015/3/8.
 */

@Service("shaeService")
public class ShaeService {

    private final static Logger logger = LoggerFactory.getLogger(ShaeService.class);

    @Resource(name = "dataReadDB")
    private NamedParameterJdbcTemplate dataRead;

    @Resource(name = "dataWriteDB")
    private NamedParameterJdbcTemplate dataWrite;

    @Autowired
    private PublicRedisOperator publicRedisOperator;

    public List<Product> getProducts(int type) {
        String sql = "select id, name, nick, " +
                " describe, photo, school," +
                " item, createtime, status, type" +
                " from product" +
                " where " +
                " type = :type" +
                " and status = :status" +
                " order by id desc" +
                " limit 15";

        Map<String, Object> maps = new HashMap<String, Object>();
        maps.put("type", type);
        maps.put("status", Constants.OK);
        List<Product> list = dataRead.query(sql, maps, new ProductHandle());
        return list;
    }

    public List<Product> getProducts(int type, int item) {
        String sql = "select p.id, p.name, p.nick, " +
                " p.describe, p.photo, p.school," +
                " c.item, p.createtime, p.status, p.type" +
                " from product as p, category as c" +
                " where " +
                " p.id = c.product_id" +
                " and p.type = :type" +
                " and c.item = :item" +
                " and p.status = :status" +
                " order by p.id desc" +
                " limit 15";

        Map<String, Object> maps = new HashMap<String, Object>();
        maps.put("type", type);
        maps.put("item", item);
        maps.put("status", Constants.OK);
        List<Product> list = dataRead.query(sql, maps, new ProductHandle());
        return list;
    }

    public List<Product> getMore(int type, int last) {
        String sql = "select id, name, nick," +
                " describe, photo, school," +
                " item, createtime, status, type" +
                " from product" +
                " where " +
                " type = :type" +
                " and status = :status" +
                " and id < :last" +
                " order by id desc" +
                " limit 15";

        Map<String, Object> maps = new HashMap<String, Object>();
        maps.put("type", type);
        maps.put("last", last);
        maps.put("status", Constants.OK);

        List<Product> list = dataRead.query(sql, maps, new ProductHandle());
        return list;
    }

    public List<Product> getMore(int type, int item, int last) {
        String sql = "select p.id, p.name, p.nick," +
                " p.describe, p.photo, p.school," +
                " c.item, p.createtime, p.status, p.type" +
                " from product as p, category as c" +
                " where " +
                " p.id = c.product_id" +
                " and p.type = :type" +
                " and p.status = :status" +
                " and c.item = :item" +
                " and p.id < :last" +
                " order by p.id desc" +
                " limit 15";

        Map<String, Object> maps = new HashMap<String, Object>();
        maps.put("type", type);
        maps.put("last", last);
        maps.put("item", item);
        maps.put("status", Constants.OK);

        List<Product> list = dataRead.query(sql, maps, new ProductHandle());
        return list;
    }

    public List<Product> getByOwner(String owner) {
        String sql = "select id, name, nick," +
                " describe, photo, school," +
                " item, createtime, status, type" +
                " from product" +
                " where " +
                " owner = :owner" +
                " order by id desc" +
                " limit 20";

        Map<String, Object> maps = new HashMap<String, Object>();
        maps.put("owner", owner);
        List<Product> list = dataRead.query(sql, maps, new ProductHandle());
        return list;
    }

    public List<Product> getByToday() {
        long begin = DateUtil.todayBeginTime();
        long end = DateUtil.todayEndTime();
        String sql = "select id, name, nick," +
                " describe, photo, school," +
                " item, createtime, status, type" +
                " from product" +
                " where " +
                " createtime > :beginTime" +
                " and createtime < :endTime" +
                " order by type asc, id desc";

        Map<String, Object> maps = new HashMap<String, Object>();
        maps.put("beginTime", begin);
        maps.put("endTime", end);
        List<Product> list = dataRead.query(sql, maps, new ProductHandle());
        return list;
    }

    private class ProductHandle implements RowMapper<Product> {

        @Override
        public Product mapRow(ResultSet rs, int i) throws SQLException {
            Product product = new Product();
            product.setId(rs.getInt("id"));
            product.setName(rs.getString("name"));
            product.setNick(rs.getString("nick"));
            product.setSchool(rs.getInt("school"));
            product.setDescribe(rs.getString("describe"));
            product.setItem(rs.getInt("item"));
            product.setCreatetime(DateUtil.formatDate(new Date(rs.getLong("createtime")), "yyyy-MM-dd HH:mm"));

            product.setStatus(StatusEnum.getById(rs.getInt("status")));
            product.setType(ProductEnum.getNameById(rs.getInt("type")));
            String photo = rs.getString("photo");
            String[] photoArray = photo.split(Constants.pic);
            List<String> photos = new ArrayList<String>();
            for(String pic : photoArray) {
                if(pic.equals("")) {
                    continue;
                }
                photos.add(pic);
                if(photos.size() >=3) {
                    break;
                }
            }
            product.setPhotos(photos);
            return product;
        }
    }

    public boolean updateContent(int id, String content) {
        String sql = "update product set describe = :describe where id = :id";

        Map<String, Object> maps = new HashMap<String, Object>();
        maps.put("id", id);
        maps.put("describe", content);
        int result = dataWrite.update(sql, maps);
        if(result > 0) {
            return true;
        }else {
            return false;
        }
    }

    public boolean soldOut(int id) {
        String sql = "update product set status = :status where id = :id";

        Map<String, Object> maps = new HashMap<String, Object>();
        maps.put("id", id);
        maps.put("status", StatusEnum.SOLDOUT.getId());

        int result = dataWrite.update(sql, maps);
        if(result > 0) {
            return true;
        }else {
            return false;
        }
    }

    public void recordOperator(String key) {
        String date = DateUtil.dayPattern(System.currentTimeMillis());
        if(!publicRedisOperator.hexist(key, date)) {
            publicRedisOperator.hset(key, date, "0");
        }
        publicRedisOperator.hincrby(key, date, 1L);
    }

    public List<Product> search(int type, String search) {
        search = search.trim().replace(" ", "+").replace("　", "+");
        System.out.println("search:" + search);
        String sql = "SELECT id, name, nick," +
                " describe, photo, school," +
                " item, createtime, status, type" +
                " FROM product" +
                " WHERE type = :type" +
                " and status = 3" +
                " and text_index @@ to_tsquery('pgzhcfg', :search) limit 15;";

        Map<String, Object> maps = new HashMap<String, Object>();
        maps.put("type", type);
        maps.put("search", search);
        List<Product> list = dataRead.query(sql, maps, new ProductHandle());
        return list;
    }
}
