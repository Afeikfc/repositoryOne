package com.zk.youmuyou.service;

import com.zk.youmuyou.utils.AlgorithmUtils;
import org.junit.jupiter.api.Test;

import java.util.Arrays;
import java.util.List;

/**
 * 算法工具类测试
 */
public class AlgorithmUtilsTest {


    @Test
    void test() {
        String str1 = "赵须是狗";
        String str2 = "赵须不是狗";
        String str3 = "赵须是鱼不是狗";
//        String str4 = "赵须是猫";
        // 1
        int score1 = AlgorithmUtils.minDistance(str1, str2);
        // 3
        int score2 = AlgorithmUtils.minDistance(str1, str3);
        System.out.println(score1);
        System.out.println(score2);
    }

    @Test
    void testCompareTags() {
        List<String> tags1 = Arrays.asList("男", "高一", "Java", "C");
        List<String> tags2 = Arrays.asList("大三", "C", "C++", "Java", "python");
        List<String> tags3 = Arrays.asList("女", "大一", "Java", "python");
        List<String> tags4 = Arrays.asList("男", "高一", "Java", "C");
        List<String> tags5 = Arrays.asList( "高一", "Java", "C");
        // 1
        int score1 = AlgorithmUtils.minDistance(tags1, tags2);
        // 3
        int score2 = AlgorithmUtils.minDistance(tags1, tags3);
        int score3 = AlgorithmUtils.minDistance(tags1, tags4);
        int score4 = AlgorithmUtils.minDistance(tags1, tags5);
        System.out.println(score1);
        System.out.println(score2);
        System.out.println(score3);
        System.out.println(score4);
    }

}
