package com.zk.youmuyou.utils;

import java.util.*;

public class CosineSimilarityUtil {

    // 计算余弦相似度
    public static double cosineSimilarity(List<String> tag1, List<String> tag2) {
        // 将两个标签列表转换为向量
        Map<String, Integer> vector1 = getVector(tag1);
        Map<String, Integer> vector2 = getVector(tag2);

        // 计算两个向量的点积
        int dotProduct = 0;
        for (String key : vector1.keySet()) {
            if (vector2.containsKey(key)) {
                dotProduct += vector1.get(key) * vector2.get(key);
            }
        }

        // 计算两个向量的模长
        double magnitude1 = getMagnitude(vector1);
        double magnitude2 = getMagnitude(vector2);

        // 计算余弦相似度
        double cosineSimilarity = dotProduct / (magnitude1 * magnitude2);

        return cosineSimilarity;
    }

    // 将标签列表转换为向量
    public static Map<String, Integer> getVector(List<String> tags) {
        Map<String, Integer> vector = new HashMap<>();
        for (String tag : tags) {
            vector.put(tag, vector.getOrDefault(tag, 0) + 1);
        }
        return vector;
    }

    // 计算向量的模长
    public static double getMagnitude(Map<String, Integer> vector) {
        double magnitude = 0;
        for (int value : vector.values()) {
            magnitude += Math.pow(value, 2);
        }
        return Math.sqrt(magnitude);
    }
}

