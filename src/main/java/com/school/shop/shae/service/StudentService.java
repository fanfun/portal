package com.school.shop.shae.service;

import com.school.shop.common.redis.PublicRedisOperator;
import com.school.shop.shae.model.Student;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2015/6/16.
 */
@Service("studentService")
public class StudentService {

    private final static Logger logger = LoggerFactory.getLogger(ShaeService.class);

    @Resource(name = "dataReadDB")
    private NamedParameterJdbcTemplate dataRead;

    @Resource(name = "dataWriteDB")
    private NamedParameterJdbcTemplate dataWrite;

    @Autowired
    private PublicRedisOperator publicRedisOperator;

    public void update(Student student) {
        String sql = "UPDATE student SET nick=:nick, phone=:phone, nick_name=:nickName WHERE name = :name";
        Map<String, String> maps = new HashMap<String, String>();
        maps.put("name", student.getName());
        maps.put("nick", student.getNick());
        maps.put("nickName", student.getNickName());
        maps.put("phone", student.getPhone());
        dataWrite.update(sql, maps);
    }

    public Student getByName(String name) {
        String sql = "select name, nick, phone, nick_name from student where name = :name";
        Map<String, String> maps = new HashMap<String, String>();
        maps.put("name", name);
        List<Student> student = dataRead.query(sql, maps, new StudentHandle());
        if(!student.isEmpty()) {
            return student.get(0);
        }
        return null;
    }

    private class StudentHandle implements RowMapper<Student> {
        @Override
        public Student mapRow(ResultSet resultSet, int i) throws SQLException {
            Student result = new Student();
            result.setName(resultSet.getString("name"));
            result.setPhone(resultSet.getString("phone"));
            result.setNick(resultSet.getString("nick"));
            String nickName = resultSet.getString("nick_name");
            result.setNickName(nickName != null ? nickName:"");
            return result;
        }
    }
}
