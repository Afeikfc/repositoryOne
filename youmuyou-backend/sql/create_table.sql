create
database if not exists youmuyou;

use
youmuyou;
/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : localhost:3307
 Source Schema         : youmuyou

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 07/03/2023 15:10:11
*/

SET NAMES utf8mb4;



-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
                         `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
                         `username` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户昵称',
                         `userAccount` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '账号',
                         `avatarUrl` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户头像',
                         `gender` tinyint NULL DEFAULT NULL COMMENT '性别0-女 ，1- 男',
                         `userPassword` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
                         `profile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '个人简介',
                         `phone` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电话',
                         `email` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
                         `userRole` int NOT NULL DEFAULT 0 COMMENT '用户角色 0 - 普通用户 1 - 管理员',
                         `userStatus` int NOT NULL DEFAULT 0 COMMENT '状态 0 - 正常',
                         `tags` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标签 json 列表',
                         `createTime` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                         `updateTime` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                         `isDelete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
                         PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '赵珂', 'lantern', 'http://zk45.oss-cn-shenzhen.aliyuncs.com/ymy/202304/01/b69e0ad81a66478d86ac8e5d4614efa7hy.png', 1, 'f3f3e9a63b0e9d3b0f90d3fd28b21b46', '浅浅测试一下', '18791997747', '505982627@qq.com', 1, 0, '[\"男\",\"高一\",\"Java\",\"C\",\"C#\",\"python\"]', '2023-01-24 13:02:27', '2023-04-01 13:13:28', 0);
INSERT INTO `user` VALUES (2, '赵启', 'zhaoqi', 'http://zk45.oss-cn-shenzhen.aliyuncs.com/zk/202301281419177.png', 0, 'f3f3e9a63b0e9d3b0f90d3fd28b21b46', NULL, '760-536-6154', 'zq@qq.com', 0, 0, '[\"女\",\"大一\",\"C\",\"C++\",\"go\",\"C#\",\"python\"]', '2023-01-25 21:04:32', '2023-03-07 15:08:29', 0);
INSERT INTO `user` VALUES (3, '贾子萱', 'jzx', 'http://zk45.oss-cn-shenzhen.aliyuncs.com/zk/202301281419177.png', 1, 'f3f3e9a63b0e9d3b0f90d3fd28b21b46', NULL, '10-899-7785', 'anqiwe215@gmail.com', 0, 0, '[\"男\",\"高一\",\"Java\",\"C\",\"C#\"]', '2022-04-01 22:09:43', '2023-03-07 15:08:40', 0);
INSERT INTO `user` VALUES (4, '江致远', 'DLcj0W2dzC', 'http://zk45.oss-cn-shenzhen.aliyuncs.com/zk/202301281419177.png', 0, 'f3f3e9a63b0e9d3b0f90d3fd28b21b46', NULL, '187-5199-9568', 'zjiang@qq.com', 0, 0, '[\"女\",\"大一\",\"go\",\"Java\",\"python\"]', '2021-02-02 00:20:35', '2023-04-01 13:12:59', 0);
INSERT INTO `user` VALUES (5, '赵嘉伦', 'sLc4mApMFQ', 'http://zk45.oss-cn-shenzhen.aliyuncs.com/zk/202301281419177.png', 0, 'f3f3e9a63b0e9d3b0f90d3fd28b21b46', NULL, '760-536-6154', 'zj920@outlook.com', 0, 0, '[\"女\",\"大一\",\"go\",\"Java\",\"python\"]', '2021-03-01 22:44:27', '2023-04-01 13:12:59', 0);
INSERT INTO `user` VALUES (6, '高子异', 'kzRFpi61MK', 'http://zk45.oss-cn-shenzhen.aliyuncs.com/zk/202301281419177.png', 1, 'f3f3e9a63b0e9d3b0f90d3fd28b21b46', NULL, '769-818-5795', 'ziyig@gmail.com', 0, 0, '[\"男\",\"大二\",\"C\",\"C++\",\"go\",\"C#\",\"python\"]', '2021-11-25 18:52:23', '2023-03-07 15:09:10', 0);
INSERT INTO `user` VALUES (7, '谭云熙', 'CfCA59PFWT', 'http://zk45.oss-cn-shenzhen.aliyuncs.com/zk/202301281419177.png', 0, 'f3f3e9a63b0e9d3b0f90d3fd28b21b46', NULL, '157-2314-6508', 'yunxitan@icloud.com', 0, 0, '[\"女\",\"大二\",\"C\",\"C++\",\"go\",\"C#\",\"python\"]', '2022-04-25 00:56:54', '2023-03-07 15:09:28', 0);
INSERT INTO `user` VALUES (8, '秦震南', 'Eg3RKmqKFw', 'http://zk45.oss-cn-shenzhen.aliyuncs.com/zk/202301281419177.png', 1, 'f3f3e9a63b0e9d3b0f90d3fd28b21b46', NULL, '134-5765-4751', 'qin9@gmail.com', 0, 0, '[\"大三\",\"C\",\"C++\",\"Java\",\"python\"]', '2022-01-08 22:35:08', '2023-03-07 15:09:41', 0);
-- ----------------------------
-- Table structure for team
-- ----------------------------
DROP TABLE IF EXISTS `team`;
CREATE TABLE `team`  (
                         `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
                         `name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '队伍名称',
                         `avatarUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '队伍图像',
                         `description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
                         `maxNum` int NOT NULL DEFAULT 1 COMMENT '最大人数',
                         `expireTime` datetime NULL DEFAULT NULL COMMENT '过期时间',
                         `userId` bigint NULL DEFAULT NULL COMMENT '用户id（队长 id）',
                         `status` int NOT NULL DEFAULT 0 COMMENT '0 - 公开，1 - 私有，2 - 加密',
                         `password` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
                         `createTime` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                         `updateTime` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                         `isDelete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
                         PRIMARY KEY (`id`) USING BTREE,
                         INDEX `fk_1`(`userId` ASC) USING BTREE,
                         CONSTRAINT `fk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '队伍' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of team
-- ----------------------------
INSERT INTO `team` VALUES (1, 'cs1', '', '测试', 5, '2025-01-01 00:00:00', 1, 0, '', '2023-01-24 13:06:48', '2023-03-06 18:12:12', 1);
INSERT INTO `team` VALUES (2, 'test', 'http://zk45.oss-cn-shenzhen.aliyuncs.com/zk/202302041324189.jpeg', 'tresfew', 5, '2023-10-31 00:00:00', 2, 0, '', '2023-01-28 14:58:31', '2023-03-06 17:38:30', 0);
INSERT INTO `team` VALUES (3, 'aaa', 'http://zk45.oss-cn-shenzhen.aliyuncs.com/zk/202302041324189.jpeg', 'affa', 3, '2024-01-01 00:00:00', 6, 1, '123', '2023-03-05 13:15:12', '2023-04-02 15:36:27', 0);
INSERT INTO `team` VALUES (4, '公开1', '', '12313231', 6, '2025-01-01 00:00:00', 2, 0, '', '2023-01-29 12:42:44', '2023-03-07 12:33:07', 0);
INSERT INTO `team` VALUES (5, '公开2', 'http://zk45.oss-cn-shenzhen.aliyuncs.com/zk/202302041324189.jpeg', '公开2', 4, '2024-01-01 00:00:00', 3, 0, '', '2023-01-29 12:43:14', '2023-03-07 12:33:07', 0);
INSERT INTO `team` VALUES (6, '加密1q2', 'http://zk45.oss-cn-shenzhen.aliyuncs.com/zk/202302041324189.jpeg', '加密，i1', 5, '2026-01-01 00:00:00', 1, 2, '123456', '2023-01-29 12:44:45', '2023-03-07 13:05:14', 1);
INSERT INTO `team` VALUES (7, '私有11', '', '1123', 5, '2024-01-01 00:00:00', 1, 1, '12345678', '2023-02-01 13:29:12', '2023-03-07 13:25:23', 0);
INSERT INTO `team` VALUES (8, '私有1', 'http://zk45.oss-cn-shenzhen.aliyuncs.com/zk/202302041324189.jpeg', '122312', 3, '2024-01-01 00:00:00', 1, 2, '123', '2023-02-04 12:21:06', '2023-03-07 13:32:02', 0);
INSERT INTO `team` VALUES (9, '123', 'http://zk45.oss-cn-shenzhen.aliyuncs.com/zk/202302041324189.jpeg', '私有测试', 3, '2024-01-01 00:00:00', 1, 0, '', '2023-02-06 15:00:07', '2023-03-07 12:33:07', 0);
INSERT INTO `team` VALUES (10, 'scsada', 'http://zk45.oss-cn-shenzhen.aliyuncs.com/zk/202302041324189.jpeg', 'qweq', 3, '2024-01-01 00:00:00', 6, 0, '', '2023-03-05 12:18:20', '2023-03-06 17:38:41', 0);


-- ----------------------------
-- Table structure for user_team
-- ----------------------------
DROP TABLE IF EXISTS `user_team`;
CREATE TABLE `user_team`  (
                              `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
                              `userId` bigint NULL DEFAULT NULL COMMENT '用户id',
                              `teamId` bigint NULL DEFAULT NULL COMMENT '队伍id',
                              `joinTime` datetime NULL DEFAULT NULL COMMENT '加入时间',
                              `createTime` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                              `updateTime` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                              `isDelete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
                              PRIMARY KEY (`id`) USING BTREE,
                              INDEX `fk_11`(`userId` ASC) USING BTREE,
                              INDEX `fk_12`(`teamId` ASC) USING BTREE,
                              CONSTRAINT `fk_11` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
                              CONSTRAINT `fk_12` FOREIGN KEY (`teamId`) REFERENCES `team` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户队伍关系' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_team
-- ----------------------------
INSERT INTO `user_team` VALUES (1, 1, 1, '2023-01-24 13:06:48', '2023-01-24 13:06:48', '2023-02-26 15:21:38', 1);
INSERT INTO `user_team` VALUES (2, 2, 2, '2023-01-28 14:58:32', '2023-01-28 14:58:31', '2023-02-01 13:11:13', 0);
INSERT INTO `user_team` VALUES (3, 1, 3, '2023-01-28 14:59:16', '2023-01-28 14:59:15', '2023-02-06 16:02:21', 1);
INSERT INTO `user_team` VALUES (4, 6, 2, '2023-01-28 15:22:56', '2023-01-28 15:22:56', '2023-03-04 16:59:33', 1);
INSERT INTO `user_team` VALUES (5, 6, 3, '2023-01-28 15:23:15', '2023-01-28 15:23:15', '2023-01-28 15:23:15', 0);
INSERT INTO `user_team` VALUES (6, 2, 4, '2023-01-29 12:42:45', '2023-01-29 12:42:44', '2023-02-01 13:11:13', 0);
INSERT INTO `user_team` VALUES (7, 4, 5, '2023-01-29 12:43:14', '2023-01-29 12:43:14', '2023-04-02 15:35:59', 0);
INSERT INTO `user_team` VALUES (8, 2, 6, '2023-01-29 12:44:46', '2023-01-29 12:44:45', '2023-03-07 11:51:50', 1);
INSERT INTO `user_team` VALUES (9, 2, 2, '2023-01-29 14:25:52', '2023-01-29 14:25:52', '2023-01-29 14:25:52', 0);
INSERT INTO `user_team` VALUES (10, 1, 7, '2023-02-01 13:29:13', '2023-02-01 13:29:12', '2023-02-01 13:29:12', 0);
INSERT INTO `user_team` VALUES (11, 1, 8, '2023-02-04 12:21:06', '2023-02-04 12:21:06', '2023-02-04 12:21:06', 0);
INSERT INTO `user_team` VALUES (12, 1, 9, '2023-02-06 15:00:08', '2023-02-06 15:00:07', '2023-02-06 15:00:07', 0);
INSERT INTO `user_team` VALUES (13, 8, 1, '2023-02-06 15:50:11', '2023-02-06 15:50:10', '2023-02-26 15:21:38', 1);
INSERT INTO `user_team` VALUES (14, 8, 2, '2023-02-06 15:59:05', '2023-02-06 15:59:05', '2023-02-06 15:59:05', 0);
INSERT INTO `user_team` VALUES (15, 1, 2, '2023-02-06 16:04:02', '2023-02-06 16:04:02', '2023-02-06 20:33:00', 1);
INSERT INTO `user_team` VALUES (16, 1, 3, '2023-02-06 16:11:37', '2023-02-06 16:11:36', '2023-02-06 20:38:19', 1);
INSERT INTO `user_team` VALUES (17, 1, 2, '2023-02-06 20:33:04', '2023-02-06 20:33:04', '2023-02-06 20:33:07', 1);
INSERT INTO `user_team` VALUES (18, 1, 2, '2023-02-06 20:33:28', '2023-02-06 20:33:28', '2023-02-06 20:33:49', 1);
INSERT INTO `user_team` VALUES (19, 1, 2, '2023-02-06 20:33:54', '2023-02-06 20:33:53', '2023-02-06 20:34:26', 1);
INSERT INTO `user_team` VALUES (20, 1, 2, '2023-02-06 20:34:30', '2023-02-06 20:34:29', '2023-02-06 20:38:44', 1);
INSERT INTO `user_team` VALUES (21, 1, 3, '2023-02-06 20:38:24', '2023-02-06 20:38:24', '2023-03-07 13:13:37', 1);
INSERT INTO `user_team` VALUES (22, 1, 2, '2023-02-06 20:38:49', '2023-02-06 20:38:48', '2023-02-15 15:12:51', 1);
INSERT INTO `user_team` VALUES (23, 1, 2, '2023-02-26 15:21:25', '2023-02-26 15:21:24', '2023-02-26 15:21:28', 1);
INSERT INTO `user_team` VALUES (24, 6, 2, '2023-03-04 17:01:36', '2023-03-04 17:01:35', '2023-03-04 17:02:11', 1);
INSERT INTO `user_team` VALUES (25, 6, 2, '2023-03-04 17:02:14', '2023-03-04 17:02:14', '2023-03-04 17:02:32', 1);
INSERT INTO `user_team` VALUES (26, 6, 2, '2023-03-04 17:02:36', '2023-03-04 17:02:35', '2023-03-04 17:02:41', 1);
INSERT INTO `user_team` VALUES (27, 6, 2, '2023-03-04 17:03:32', '2023-03-04 17:03:32', '2023-03-04 17:03:37', 1);
INSERT INTO `user_team` VALUES (28, 6, 2, '2023-03-04 17:04:19', '2023-03-04 17:04:19', '2023-03-04 17:04:20', 1);
INSERT INTO `user_team` VALUES (29, 6, 2, '2023-03-04 17:04:47', '2023-03-04 17:04:47', '2023-03-04 17:04:48', 1);
INSERT INTO `user_team` VALUES (30, 6, 2, '2023-03-04 17:05:22', '2023-03-04 17:05:21', '2023-03-04 17:05:22', 1);
INSERT INTO `user_team` VALUES (31, 6, 2, '2023-03-04 17:05:24', '2023-03-04 17:05:24', '2023-03-04 17:05:24', 0);
INSERT INTO `user_team` VALUES (32, 6, 10, '2023-03-05 12:18:20', '2023-03-05 12:18:20', '2023-03-05 12:18:20', 0);
INSERT INTO `user_team` VALUES (33, 6, 3, '2023-03-05 13:15:12', '2023-03-05 13:15:12', '2023-04-02 15:36:46', 0);
INSERT INTO `user_team` VALUES (34, 1, 4, '2023-03-06 16:33:17', '2023-03-06 16:33:17', '2023-04-02 15:36:50', 1);
INSERT INTO `user_team` VALUES (35, 1, 10, '2023-03-06 20:26:58', '2023-03-06 20:26:57', '2023-03-06 20:26:57', 0);
INSERT INTO `user_team` VALUES (36, 1, 4, '2023-03-06 20:38:53', '2023-03-06 20:38:53', '2023-04-02 15:36:51', 0);
INSERT INTO `user_team` VALUES (37, 1, 2, '2023-03-07 13:31:36', '2023-03-07 13:31:36', '2023-03-07 13:31:36', 0);

SET FOREIGN_KEY_CHECKS = 1;
