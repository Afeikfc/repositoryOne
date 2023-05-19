package com.zk.youmuyou.service;

import com.zk.youmuyou.model.domain.User;
import org.junit.Assert;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.List;

/**
 * 用户服务测试
 *
 * @author zk
 */
@SpringBootTest
public class UserServiceTest {

    @Resource
    private UserService userService;

    @Test
    public void testAddUser() {
        User user = new User();
        user.setUsername("dogzk");
        user.setUserAccount("123");
        user.setAvatarUrl("https://636f-codenav-8grj8px727565176-1256524210.tcb.qcloud.la/img/logo.png");
        user.setGender(0);
        user.setUserPassword("xxx");
        user.setPhone("123");
        user.setEmail("456");
        user.setUserRole(2);
//        boolean result = userService.save(user);
        boolean result = userService.isAdmin(user);
        System.out.println(user.getId());
        Assertions.assertTrue(result);
    }
    @Test
    public void testUpdateUser() {
        User user = new User();
        user.setId(1L);
        user.setUsername("dogzk");
        user.setUserAccount("123");
        user.setAvatarUrl("https://636f-codenav-8grj8px727565176-1256524210.tcb.qcloud.la/img/logo.png");
        user.setGender(0);
        user.setUserPassword("xxx");
        user.setPhone("123");
        user.setEmail("456");
        boolean result = userService.updateById(user);
        Assertions.assertTrue(result);
    }

    @Test
    public void testDeleteUser() {
        boolean result = userService.removeById(1L);
        Assertions.assertTrue(result);
    }

    @Test
    public void testGetUser() {
        User user = userService.getById(1L);
        Assertions.assertNotNull(user);
    }

    @Test
    void userRegister() {
        String userAccount = "zk";
        String userPassword = "12345678";
        String checkPassword = "12345678";
        String avatarUrl="";
        long result = userService.userRegister(userAccount, userPassword, checkPassword,avatarUrl);
        Assertions.assertEquals(-1, result);
        userAccount = "yu";
        result = userService.userRegister(userAccount, userPassword, checkPassword,avatarUrl);
        Assertions.assertEquals(-1, result);
        userAccount = "zk";
        userPassword = "123456";
        result = userService.userRegister(userAccount, userPassword, checkPassword,avatarUrl);
        Assertions.assertEquals(-1, result);
        userAccount = "yu pi";
        userPassword = "12345678";
        result = userService.userRegister(userAccount, userPassword, checkPassword,avatarUrl);
        Assertions.assertEquals(-1, result);
        checkPassword = "123456789";
        result = userService.userRegister(userAccount, userPassword, checkPassword,avatarUrl);
        Assertions.assertEquals(-1, result);
        userAccount = "dogzk";
        checkPassword = "12345678";
        result = userService.userRegister(userAccount, userPassword, checkPassword,avatarUrl);
        Assertions.assertEquals(-1, result);
        userAccount = "zk";
        result = userService.userRegister(userAccount, userPassword, checkPassword,avatarUrl);
        Assertions.assertEquals(-1, result);
    }

    @Test
    public void testSearchUsersByTags() {
        List<String> tagNameList = Arrays.asList("java", "python");
        List<User> userList = userService.searchUsersByTags(tagNameList);
        Assert.assertNotNull(userList);
    }

    @Test
    void cosmatchUsers() {
        User user=new User();
        user.setTags("[\"大三\",\"C\",\"C++\",\"Java\",\"python\"]");
        user.setId(3424);
        long num=20;
        List<User> users = userService.CosmatchUsers(num, user);
        System.out.println("users = " + users);
    }

    public static void main(String[] args) {
        System.out.println("赵尔克");
    }
}