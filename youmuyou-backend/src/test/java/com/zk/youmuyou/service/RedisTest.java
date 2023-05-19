package com.zk.youmuyou.service;

import com.zk.youmuyou.model.domain.User;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;

import javax.annotation.Resource;

@SpringBootTest
public class RedisTest {

    @Resource
    private RedisTemplate redisTemplate;

    @Test
    void test() {
        ValueOperations valueOperations = redisTemplate.opsForValue();
        // 增
        valueOperations.set("zkString", "dog");
        valueOperations.set("zkInt", 1);
        valueOperations.set("zkDouble", 2.0);
        User user = new User();
        user.setId(1L);
        user.setUsername("zk");
        valueOperations.set("zkUser", user);
        // 查
        Object zk = valueOperations.get("zkString");
        Assertions.assertTrue("dog".equals((String) zk));
        zk = valueOperations.get("zkInt");
        Assertions.assertTrue(1 == (Integer) zk);
        zk = valueOperations.get("zkDouble");
        Assertions.assertTrue(2.0 == (Double) zk);
        System.out.println(valueOperations.get("zkUser"));
        valueOperations.set("zkString", "dog");
//        redisTemplate.delete("zkString");
    }
}
