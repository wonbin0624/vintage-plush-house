/*
 Navicat Premium Dump SQL

 Source Server         : local-db
 Source Server Type    : MySQL
 Source Server Version : 50556 (5.5.56)
 Source Host           : localhost:3306
 Source Schema         : shoppingdb

 Target Server Type    : MySQL
 Target Server Version : 50556 (5.5.56)
 File Encoding         : 65001

 Date: 24/10/2026 11:28:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PASSWORD` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phoneNum` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STATUS` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES (1, 'admin@gmail.com.cn', 'steve', '$2a$10$PtTcXbKOQK/Ub/NVkNBfOOv0RH0aSCNZKlHYHvObRjLUcV2olMZuq', '18899009900', 1);
INSERT INTO `account` VALUES (2, 'zhangsan@itcast.cn', 'zhangsan', '123', '12345678901', 1);
INSERT INTO `account` VALUES (13, '0624@qq.com', '小沙', '$2a$10$8yVwRGY6.JnJgD2X2X2X2.X2X2X2X2X2X2X2X2X2X2X2X2X2X2X2X2', '19825696223', 1);
INSERT INTO `account` VALUES (14, '555@qq.com', 'junjun', '$2a$10$8yVwRGY6.JnJgD2X2X2X2.X2X2X2X2X2X2X2X2X2X2X2X2X2X2X2X2', '30555', 0);
INSERT INTO `account` VALUES (15, 'test@qq.com', 'testuser', '$2a$10$XZdiorJTOPbn4FsHHg.SD.FTlcmCzT8w7CLidTy9qWeY.z6YZ8YKu', '13888888888', 1);

-- ----------------------------
-- Table structure for account_role
-- ----------------------------
DROP TABLE IF EXISTS `account_role`;
CREATE TABLE `account_role`  (
  `accountId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`accountId`, `roleId`) USING BTREE,
  INDEX `roleId`(`roleId`) USING BTREE,
  CONSTRAINT `account_role_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `account_role_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of account_role
-- ----------------------------
INSERT INTO `account_role` VALUES (1, 11);
INSERT INTO `account_role` VALUES (2, 11);
INSERT INTO `account_role` VALUES (1, 12);

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cover` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image1` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image2` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` float NULL DEFAULT NULL,
  `intro` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stock` int(11) NULL DEFAULT NULL,
  `type_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_type_id_idx`(`type_id`) USING BTREE,
  CONSTRAINT `fk_type_id` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 178 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (9, '咸蛋黄大耳鼠', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 29.9, '特色大耳朵+明黄色毛绒身体，飞天小鼠来临！', 10, 4);
INSERT INTO `goods` VALUES (10, '委屈小仓鼠', '/picture/10-1.jpg', '/picture/10-2.jpg', '/picture/10-3.jpg', 24.9, '白黄异耳的委屈脸仓鼠一枚~', 10, 4);
INSERT INTO `goods` VALUES (11, 'huhu小兔', '/picture/11-1.jpg', '/picture/11-2.jpg', '/picture/11-3.jpg', 42.9, '纯白的大头体小兔！配上粉色口水巾更是萌上加萌！', 10, 3);
INSERT INTO `goods` VALUES (12, '流泪小猫', '/picture/12-1.jpg', '/picture/12-2.jpg', '/picture/12-3.jpg', 36, '看似单调的黑白色小猫，实则是伤心时陪你流泪的安静小天使呀', 10, 1);
INSERT INTO `goods` VALUES (13, '棉花糖喵', '/picture/13-1.jpg', '/picture/13-2.jpg', '/picture/13-3.jpg', 36.9, '拥有超级大眼的蓝色围巾小猫！围巾可拆卸，更方便换新衣哟~', 9, 1);
INSERT INTO `goods` VALUES (14, '平淡兔', '/picture/14-1.jpg', '/picture/14-2.jpg', '/picture/14-1.jpg', 39.9, '拥有红色小眼镜，让人情不自禁大喊“小兔老师！”的淡定小兔~', 10, 3);
INSERT INTO `goods` VALUES (15, '耶耶塔塔', '/picture/8-1.jpg', '/picture/8-2.jpg', '/picture/8-3.jpg', 23.9, '如果平淡兔是淡定的小兔老师，那么耶耶塔塔就是会睁大眼睛认真听课的兔兔学生！', 9, 3);
INSERT INTO `goods` VALUES (16, '咸蛋黄大耳鼠', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 29.9, '特色大耳朵+明黄色毛绒身体，飞天小鼠来临！', 10, 4);
INSERT INTO `goods` VALUES (18, 'huhu小兔', '/picture/11-1.jpg', '/picture/11-2.jpg', '/picture/11-3.jpg', 42.9, '纯白的大头体小兔！配上粉色口水巾更是萌上加萌！', 10, 3);
INSERT INTO `goods` VALUES (19, '流泪小猫', '/picture/12-1.jpg', '/picture/12-2.jpg', '/picture/12-3.jpg', 36, '看似单调的黑白色小猫，实则是伤心时陪你流泪的安静小天使呀', 10, 1);
INSERT INTO `goods` VALUES (20, '棉花糖喵', '/picture/13-1.jpg', '/picture/13-2.jpg', '/picture/13-3.jpg', 36.9, '拥有超级大眼的蓝色围巾小猫！围巾可拆卸，更方便换新衣哟~', 10, 1);
INSERT INTO `goods` VALUES (21, '平淡兔', '/picture/14-1.jpg', '/picture/14-2.jpg', '/picture/14-1.jpg', 39.9, '拥有红色小眼镜，让人情不自禁大喊“小兔老师！”的淡定小兔~', 10, 3);
INSERT INTO `goods` VALUES (23, '咸蛋黄大耳鼠', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 29.9, '特色大耳朵+明黄色毛绒身体，飞天小鼠来临！', 10, 4);
INSERT INTO `goods` VALUES (24, '委屈小仓鼠', '/picture/10-1.jpg', '/picture/10-2.jpg', '/picture/10-3.jpg', 24.9, '白黄异耳的委屈脸仓鼠一枚~', 10, 4);
INSERT INTO `goods` VALUES (25, 'huhu小兔', '/picture/11-1.jpg', '/picture/11-2.jpg', '/picture/11-3.jpg', 42.9, '纯白的大头体小兔！配上粉色口水巾更是萌上加萌！', 10, 3);
INSERT INTO `goods` VALUES (26, '流泪小猫', '/picture/12-1.jpg', '/picture/12-2.jpg', '/picture/12-3.jpg', 36, '看似单调的黑白色小猫，实则是伤心时陪你流泪的安静小天使呀', 10, 1);
INSERT INTO `goods` VALUES (27, '棉花糖喵', '/picture/13-1.jpg', '/picture/13-2.jpg', '/picture/13-3.jpg', 36.9, '拥有超级大眼的蓝色围巾小猫！围巾可拆卸，更方便换新衣哟~', 10, 1);
INSERT INTO `goods` VALUES (28, '平淡兔', '/picture/14-1.jpg', '/picture/14-2.jpg', '/picture/14-1.jpg', 39.9, '拥有红色小眼镜，让人情不自禁大喊“小兔老师！”的淡定小兔~', 10, 3);
INSERT INTO `goods` VALUES (29, '耶耶塔塔', '/picture/8-1.jpg', '/picture/8-2.jpg', '/picture/8-3.jpg', 23.9, '如果平淡兔是淡定的小兔老师，那么耶耶塔塔就是会睁大眼睛认真听课的兔兔学生！', 10, 3);
INSERT INTO `goods` VALUES (30, '咸蛋黄大耳鼠', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 29.9, '特色大耳朵+明黄色毛绒身体，飞天小鼠来临！', 10, 4);
INSERT INTO `goods` VALUES (31, '委屈小仓鼠', '/picture/10-1.jpg', '/picture/10-2.jpg', '/picture/10-3.jpg', 24.9, '白黄异耳的委屈脸仓鼠一枚~', 10, 4);
INSERT INTO `goods` VALUES (32, 'huhu小兔', '/picture/11-1.jpg', '/picture/11-2.jpg', '/picture/11-3.jpg', 42.9, '纯白的大头体小兔！配上粉色口水巾更是萌上加萌！', 10, 3);
INSERT INTO `goods` VALUES (33, '流泪小猫', '/picture/12-1.jpg', '/picture/12-2.jpg', '/picture/12-3.jpg', 36, '看似单调的黑白色小猫，实则是伤心时陪你流泪的安静小天使呀', 10, 1);
INSERT INTO `goods` VALUES (34, '棉花糖喵', '/picture/13-1.jpg', '/picture/13-2.jpg', '/picture/13-3.jpg', 36.9, '拥有超级大眼的蓝色围巾小猫！围巾可拆卸，更方便换新衣哟~', 10, 1);
INSERT INTO `goods` VALUES (35, '平淡兔', '/picture/14-1.jpg', '/picture/14-2.jpg', '/picture/14-1.jpg', 39.9, '拥有红色小眼镜，让人情不自禁大喊“小兔老师！”的淡定小兔~', 10, 3);
INSERT INTO `goods` VALUES (36, '耶耶塔塔', '/picture/8-1.jpg', '/picture/8-2.jpg', '/picture/8-3.jpg', 23.9, '如果平淡兔是淡定的小兔老师，那么耶耶塔塔就是会睁大眼睛认真听课的兔兔学生！', 10, 3);
INSERT INTO `goods` VALUES (37, '咸蛋黄大耳鼠', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 29.9, '特色大耳朵+明黄色毛绒身体，飞天小鼠来临！', 10, 4);
INSERT INTO `goods` VALUES (38, '委屈小仓鼠', '/picture/10-1.jpg', '/picture/10-2.jpg', '/picture/10-3.jpg', 24.9, '白黄异耳的委屈脸仓鼠一枚~', 10, 4);
INSERT INTO `goods` VALUES (39, 'huhu小兔', '/picture/11-1.jpg', '/picture/11-2.jpg', '/picture/11-3.jpg', 42.9, '纯白的大头体小兔！配上粉色口水巾更是萌上加萌！', 10, 3);
INSERT INTO `goods` VALUES (40, '流泪小猫', '/picture/12-1.jpg', '/picture/12-2.jpg', '/picture/12-3.jpg', 36, '看似单调的黑白色小猫，实则是伤心时陪你流泪的安静小天使呀', 10, 1);
INSERT INTO `goods` VALUES (41, '棉花糖喵', '/picture/13-1.jpg', '/picture/13-2.jpg', '/picture/13-3.jpg', 36.9, '拥有超级大眼的蓝色围巾小猫！围巾可拆卸，更方便换新衣哟~', 10, 1);
INSERT INTO `goods` VALUES (42, '平淡兔', '/picture/14-1.jpg', '/picture/14-2.jpg', '/picture/14-1.jpg', 39.9, '拥有红色小眼镜，让人情不自禁大喊“小兔老师！”的淡定小兔~', 10, 3);
INSERT INTO `goods` VALUES (43, '耶耶塔塔', '/picture/8-1.jpg', '/picture/8-2.jpg', '/picture/8-3.jpg', 23.9, '如果平淡兔是淡定的小兔老师，那么耶耶塔塔就是会睁大眼睛认真听课的兔兔学生！', 10, 3);
INSERT INTO `goods` VALUES (44, '咸蛋黄大耳鼠', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 29.9, '特色大耳朵+明黄色毛绒身体，飞天小鼠来临！', 10, 4);
INSERT INTO `goods` VALUES (45, 'huhu小兔', '/picture/11-1.jpg', '/picture/11-2.jpg', '/picture/11-3.jpg', 42.9, '纯白的大头体小兔！配上粉色口水巾更是萌上加萌！', 10, 3);
INSERT INTO `goods` VALUES (46, '流泪小猫', '/picture/12-1.jpg', '/picture/12-2.jpg', '/picture/12-3.jpg', 36, '看似单调的黑白色小猫，实则是伤心时陪你流泪的安静小天使呀', 10, 1);
INSERT INTO `goods` VALUES (47, '棉花糖喵', '/picture/13-1.jpg', '/picture/13-2.jpg', '/picture/13-3.jpg', 36.9, '拥有超级大眼的蓝色围巾小猫！围巾可拆卸，更方便换新衣哟~', 10, 1);
INSERT INTO `goods` VALUES (48, '平淡兔', '/picture/14-1.jpg', '/picture/14-2.jpg', '/picture/14-1.jpg', 39.9, '拥有红色小眼镜，让人情不自禁大喊“小兔老师！”的淡定小兔~', 10, 3);
INSERT INTO `goods` VALUES (49, '委屈小仓鼠', '/picture/10-1.jpg', '/picture/10-2.jpg', '/picture/10-3.jpg', 24.9, '白黄异耳的委屈脸仓鼠一枚~', 10, 4);
INSERT INTO `goods` VALUES (50, '耶耶塔塔', '/picture/8-1.jpg', '/picture/8-2.jpg', '/picture/8-3.jpg', 23.9, '如果平淡兔是淡定的小兔老师，那么耶耶塔塔就是会睁大眼睛认真听课的兔兔学生！', 10, 3);
INSERT INTO `goods` VALUES (51, '咸蛋黄大耳鼠', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 29.9, '特色大耳朵+明黄色毛绒身体，飞天小鼠来临！', 10, 4);
INSERT INTO `goods` VALUES (52, 'huhu小兔', '/picture/11-1.jpg', '/picture/11-2.jpg', '/picture/11-3.jpg', 42.9, '纯白的大头体小兔！配上粉色口水巾更是萌上加萌！', 10, 3);
INSERT INTO `goods` VALUES (53, '流泪小猫', '/picture/12-1.jpg', '/picture/12-2.jpg', '/picture/12-3.jpg', 36, '看似单调的黑白色小猫，实则是伤心时陪你流泪的安静小天使呀', 10, 1);
INSERT INTO `goods` VALUES (54, '棉花糖喵', '/picture/13-1.jpg', '/picture/13-2.jpg', '/picture/13-3.jpg', 36.9, '拥有超级大眼的蓝色围巾小猫！围巾可拆卸，更方便换新衣哟~', 10, 1);
INSERT INTO `goods` VALUES (55, '平淡兔', '/picture/14-1.jpg', '/picture/14-2.jpg', '/picture/14-1.jpg', 39.9, '拥有红色小眼镜，让人情不自禁大喊“小兔老师！”的淡定小兔~', 10, 3);
INSERT INTO `goods` VALUES (56, '平淡兔', '/picture/14-1.jpg', '/picture/14-2.jpg', '/picture/14-1.jpg', 39.9, '拥有红色小眼镜，让人情不自禁大喊“小兔老师！”的淡定小兔~', 10, 3);
INSERT INTO `goods` VALUES (57, '耶耶塔塔', '/picture/8-1.jpg', '/picture/8-2.jpg', '/picture/8-3.jpg', 23.9, '如果平淡兔是淡定的小兔老师，那么耶耶塔塔就是会睁大眼睛认真听课的兔兔学生！', 10, 3);
INSERT INTO `goods` VALUES (58, '咸蛋黄大耳鼠', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 29.9, '特色大耳朵+明黄色毛绒身体，飞天小鼠来临！', 10, 4);
INSERT INTO `goods` VALUES (59, '委屈小仓鼠', '/picture/10-1.jpg', '/picture/10-2.jpg', '/picture/10-3.jpg', 24.9, '白黄异耳的委屈脸仓鼠一枚~', 10, 4);
INSERT INTO `goods` VALUES (60, 'huhu小兔', '/picture/11-1.jpg', '/picture/11-2.jpg', '/picture/11-3.jpg', 42.9, '纯白的大头体小兔！配上粉色口水巾更是萌上加萌！', 10, 3);
INSERT INTO `goods` VALUES (61, '流泪小猫', '/picture/12-1.jpg', '/picture/12-2.jpg', '/picture/12-3.jpg', 36, '看似单调的黑白色小猫，实则是伤心时陪你流泪的安静小天使呀', 10, 2);
INSERT INTO `goods` VALUES (62, '蜂蜜蛋糕', '/picture/13-1.jpg', '/picture/13-1.jpg', '/picture/13-1.jpg', 36, '蛋黄与蜂蜜,淡奶油共同演绎的曼妙之旅.口感Q糯浓郁,回味绵软柔长.皱巴巴的造型,甜蜜蜜的感受.', 10, 2);
INSERT INTO `goods` VALUES (63, '平淡兔', '/picture/14-1.jpg', '/picture/14-2.jpg', '/picture/14-1.jpg', 39.9, '拥有红色小眼镜，让人情不自禁大喊“小兔老师！”的淡定小兔~', 10, 2);
INSERT INTO `goods` VALUES (64, 'huhu小兔', '/picture/11-1.jpg', '/picture/11-2.jpg', '/picture/11-3.jpg', 42.9, '纯白的大头体小兔！配上粉色口水巾更是萌上加萌！', 10, 2);
INSERT INTO `goods` VALUES (65, '流泪小猫', '/picture/12-1.jpg', '/picture/12-2.jpg', '/picture/12-3.jpg', 36, '看似单调的黑白色小猫，实则是伤心时陪你流泪的安静小天使呀', 10, 2);
INSERT INTO `goods` VALUES (66, '棉花糖喵', '/picture/13-1.jpg', '/picture/13-2.jpg', '/picture/13-3.jpg', 36.9, '拥有超级大眼的蓝色围巾小猫！围巾可拆卸，更方便换新衣哟~', 10, 2);
INSERT INTO `goods` VALUES (67, '平淡兔', '/picture/14-1.jpg', '/picture/14-2.jpg', '/picture/14-1.jpg', 39.9, '拥有红色小眼镜，让人情不自禁大喊“小兔老师！”的淡定小兔~', 10, 2);
INSERT INTO `goods` VALUES (68, '耶耶塔塔', '/picture/8-1.jpg', '/picture/8-2.jpg', '/picture/8-3.jpg', 23.9, '如果平淡兔是淡定的小兔老师，那么耶耶塔塔就是会睁大眼睛认真听课的兔兔学生！', 10, 3);
INSERT INTO `goods` VALUES (69, '咸蛋黄大耳鼠', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 29.9, '特色大耳朵+明黄色毛绒身体，飞天小鼠来临！', 10, 1);
INSERT INTO `goods` VALUES (70, '委屈小仓鼠', '/picture/10-1.jpg', '/picture/10-2.jpg', '/picture/10-3.jpg', 24.9, '白黄异耳的委屈脸仓鼠一枚~', 10, 2);
INSERT INTO `goods` VALUES (71, 'huhu小兔', '/picture/11-1.jpg', '/picture/11-2.jpg', '/picture/11-3.jpg', 42.9, '纯白的大头体小兔！配上粉色口水巾更是萌上加萌！', 10, 2);
INSERT INTO `goods` VALUES (72, '流泪小猫', '/picture/12-1.jpg', '/picture/12-2.jpg', '/picture/12-3.jpg', 36, '看似单调的黑白色小猫，实则是伤心时陪你流泪的安静小天使呀', 10, 2);
INSERT INTO `goods` VALUES (73, '棉花糖喵', '/picture/13-1.jpg', '/picture/13-2.jpg', '/picture/13-3.jpg', 36.9, '拥有超级大眼的蓝色围巾小猫！围巾可拆卸，更方便换新衣哟~', 10, 2);
INSERT INTO `goods` VALUES (74, '平淡兔', '/picture/14-1.jpg', '/picture/14-2.jpg', '/picture/14-1.jpg', 39.9, '拥有红色小眼镜，让人情不自禁大喊“小兔老师！”的淡定小兔~', 10, 2);
INSERT INTO `goods` VALUES (75, '耶耶塔塔', '/picture/8-1.jpg', '/picture/8-2.jpg', '/picture/8-3.jpg', 23.9, '如果平淡兔是淡定的小兔老师，那么耶耶塔塔就是会睁大眼睛认真听课的兔兔学生！', 10, 3);
INSERT INTO `goods` VALUES (76, '咸蛋黄大耳鼠', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 29.9, '特色大耳朵+明黄色毛绒身体，飞天小鼠来临！', 10, 1);
INSERT INTO `goods` VALUES (77, '委屈小仓鼠', '/picture/10-1.jpg', '/picture/10-2.jpg', '/picture/10-3.jpg', 24.9, '白黄异耳的委屈脸仓鼠一枚~', 10, 2);
INSERT INTO `goods` VALUES (78, 'huhu小兔', '/picture/11-1.jpg', '/picture/11-2.jpg', '/picture/11-3.jpg', 42.9, '纯白的大头体小兔！配上粉色口水巾更是萌上加萌！', 10, 2);
INSERT INTO `goods` VALUES (79, '流泪小猫', '/picture/12-1.jpg', '/picture/12-2.jpg', '/picture/12-3.jpg', 36, '看似单调的黑白色小猫，实则是伤心时陪你流泪的安静小天使呀', 10, 2);
INSERT INTO `goods` VALUES (80, '棉花糖喵', '/picture/13-1.jpg', '/picture/13-2.jpg', '/picture/13-3.jpg', 36.9, '拥有超级大眼的蓝色围巾小猫！围巾可拆卸，更方便换新衣哟~', 10, 2);
INSERT INTO `goods` VALUES (81, '平淡兔', '/picture/14-1.jpg', '/picture/14-2.jpg', '/picture/14-1.jpg', 39.9, '拥有红色小眼镜，让人情不自禁大喊“小兔老师！”的淡定小兔~', 10, 2);
INSERT INTO `goods` VALUES (82, '耶耶塔塔', '/picture/8-1.jpg', '/picture/8-2.jpg', '/picture/8-3.jpg', 23.9, '如果平淡兔是淡定的小兔老师，那么耶耶塔塔就是会睁大眼睛认真听课的兔兔学生！', 10, 3);
INSERT INTO `goods` VALUES (83, '咸蛋黄大耳鼠', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 29.9, '特色大耳朵+明黄色毛绒身体，飞天小鼠来临！', 10, 1);
INSERT INTO `goods` VALUES (84, '委屈小仓鼠', '/picture/10-1.jpg', '/picture/10-2.jpg', '/picture/10-3.jpg', 24.9, '白黄异耳的委屈脸仓鼠一枚~', 10, 2);
INSERT INTO `goods` VALUES (85, 'huhu小兔', '/picture/11-1.jpg', '/picture/11-2.jpg', '/picture/11-3.jpg', 42.9, '纯白的大头体小兔！配上粉色口水巾更是萌上加萌！', 10, 2);
INSERT INTO `goods` VALUES (86, '流泪小猫', '/picture/12-1.jpg', '/picture/12-2.jpg', '/picture/12-3.jpg', 36, '看似单调的黑白色小猫，实则是伤心时陪你流泪的安静小天使呀', 10, 2);
INSERT INTO `goods` VALUES (87, '棉花糖喵', '/picture/13-1.jpg', '/picture/13-2.jpg', '/picture/13-3.jpg', 36.9, '拥有超级大眼的蓝色围巾小猫！围巾可拆卸，更方便换新衣哟~', 10, 2);
INSERT INTO `goods` VALUES (88, '平淡兔', '/picture/14-1.jpg', '/picture/14-2.jpg', '/picture/14-1.jpg', 39.9, '拥有红色小眼镜，让人情不自禁大喊“小兔老师！”的淡定小兔~', 10, 2);
INSERT INTO `goods` VALUES (89, '耶耶塔塔', '/picture/8-1.jpg', '/picture/8-2.jpg', '/picture/8-3.jpg', 23.9, '如果平淡兔是淡定的小兔老师，那么耶耶塔塔就是会睁大眼睛认真听课的兔兔学生！', 10, 3);
INSERT INTO `goods` VALUES (90, '咸蛋黄大耳鼠', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 29.9, '特色大耳朵+明黄色毛绒身体，飞天小鼠来临！', 10, 1);
INSERT INTO `goods` VALUES (91, '委屈小仓鼠', '/picture/10-1.jpg', '/picture/10-2.jpg', '/picture/10-3.jpg', 24.9, '白黄异耳的委屈脸仓鼠一枚~', 10, 2);
INSERT INTO `goods` VALUES (92, 'huhu小兔', '/picture/11-1.jpg', '/picture/11-2.jpg', '/picture/11-3.jpg', 42.9, '纯白的大头体小兔！配上粉色口水巾更是萌上加萌！', 10, 2);
INSERT INTO `goods` VALUES (93, '流泪小猫', '/picture/12-1.jpg', '/picture/12-2.jpg', '/picture/12-3.jpg', 36, '看似单调的黑白色小猫，实则是伤心时陪你流泪的安静小天使呀', 10, 2);
INSERT INTO `goods` VALUES (94, '棉花糖喵', '/picture/13-1.jpg', '/picture/13-2.jpg', '/picture/13-3.jpg', 36.9, '拥有超级大眼的蓝色围巾小猫！围巾可拆卸，更方便换新衣哟~', 10, 2);
INSERT INTO `goods` VALUES (95, '平淡兔', '/picture/14-1.jpg', '/picture/14-2.jpg', '/picture/14-1.jpg', 39.9, '拥有红色小眼镜，让人情不自禁大喊“小兔老师！”的淡定小兔~', 10, 2);
INSERT INTO `goods` VALUES (97, '咸蛋黄大耳鼠', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 29.9, '特色大耳朵+明黄色毛绒身体，飞天小鼠来临！', 10, 1);
INSERT INTO `goods` VALUES (98, '委屈小仓鼠', '/picture/10-1.jpg', '/picture/10-2.jpg', '/picture/10-3.jpg', 24.9, '白黄异耳的委屈脸仓鼠一枚~', 10, 2);
INSERT INTO `goods` VALUES (99, 'huhu小兔', '/picture/11-1.jpg', '/picture/11-2.jpg', '/picture/11-3.jpg', 42.9, '纯白的大头体小兔！配上粉色口水巾更是萌上加萌！', 10, 2);
INSERT INTO `goods` VALUES (100, '流泪小猫', '/picture/12-1.jpg', '/picture/12-2.jpg', '/picture/12-3.jpg', 36, '看似单调的黑白色小猫，实则是伤心时陪你流泪的安静小天使呀', 10, 2);
INSERT INTO `goods` VALUES (101, '棉花糖喵', '/picture/13-1.jpg', '/picture/13-2.jpg', '/picture/13-3.jpg', 36.9, '拥有超级大眼的蓝色围巾小猫！围巾可拆卸，更方便换新衣哟~', 10, 2);
INSERT INTO `goods` VALUES (102, '平淡兔', '/picture/14-1.jpg', '/picture/14-2.jpg', '/picture/14-1.jpg', 39.9, '拥有红色小眼镜，让人情不自禁大喊“小兔老师！”的淡定小兔~', 10, 2);
INSERT INTO `goods` VALUES (103, 'huhu小兔', '/picture/11-1.jpg', '/picture/11-2.jpg', '/picture/11-3.jpg', 42.9, '纯白的大头体小兔！配上粉色口水巾更是萌上加萌！', 10, 2);
INSERT INTO `goods` VALUES (104, '流泪小猫', '/picture/12-1.jpg', '/picture/12-2.jpg', '/picture/12-3.jpg', 36, '看似单调的黑白色小猫，实则是伤心时陪你流泪的安静小天使呀', 10, 2);
INSERT INTO `goods` VALUES (105, '棉花糖喵', '/picture/13-1.jpg', '/picture/13-2.jpg', '/picture/13-3.jpg', 36.9, '拥有超级大眼的蓝色围巾小猫！围巾可拆卸，更方便换新衣哟~', 10, 2);
INSERT INTO `goods` VALUES (106, '平淡兔', '/picture/14-1.jpg', '/picture/14-2.jpg', '/picture/14-1.jpg', 39.9, '拥有红色小眼镜，让人情不自禁大喊“小兔老师！”的淡定小兔~', 10, 2);
INSERT INTO `goods` VALUES (108, '咸蛋黄大耳鼠', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 29.9, '特色大耳朵+明黄色毛绒身体，飞天小鼠来临！', 10, 1);
INSERT INTO `goods` VALUES (109, '委屈小仓鼠', '/picture/10-1.jpg', '/picture/10-2.jpg', '/picture/10-3.jpg', 24.9, '白黄异耳的委屈脸仓鼠一枚~', 10, 2);
INSERT INTO `goods` VALUES (110, 'huhu小兔', '/picture/11-1.jpg', '/picture/11-2.jpg', '/picture/11-3.jpg', 42.9, '纯白的大头体小兔！配上粉色口水巾更是萌上加萌！', 10, 2);
INSERT INTO `goods` VALUES (111, '流泪小猫', '/picture/12-1.jpg', '/picture/12-2.jpg', '/picture/12-3.jpg', 36, '看似单调的黑白色小猫，实则是伤心时陪你流泪的安静小天使呀', 10, 2);
INSERT INTO `goods` VALUES (112, '棉花糖喵', '/picture/13-1.jpg', '/picture/13-2.jpg', '/picture/13-3.jpg', 36.9, '拥有超级大眼的蓝色围巾小猫！围巾可拆卸，更方便换新衣哟~', 10, 2);
INSERT INTO `goods` VALUES (113, '平淡兔', '/picture/14-1.jpg', '/picture/14-2.jpg', '/picture/14-1.jpg', 39.9, '拥有红色小眼镜，让人情不自禁大喊“小兔老师！”的淡定小兔~', 10, 2);
INSERT INTO `goods` VALUES (114, '耶耶塔塔', '/picture/8-1.jpg', '/picture/8-2.jpg', '/picture/8-3.jpg', 23.9, '如果平淡兔是淡定的小兔老师，那么耶耶塔塔就是会睁大眼睛认真听课的兔兔学生！', 10, 3);
INSERT INTO `goods` VALUES (115, '咸蛋黄大耳鼠', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 29.9, '特色大耳朵+明黄色毛绒身体，飞天小鼠来临！', 10, 1);
INSERT INTO `goods` VALUES (116, '委屈小仓鼠', '/picture/10-1.jpg', '/picture/10-2.jpg', '/picture/10-3.jpg', 24.9, '白黄异耳的委屈脸仓鼠一枚~', 10, 2);
INSERT INTO `goods` VALUES (117, 'huhu小兔', '/picture/11-1.jpg', '/picture/11-2.jpg', '/picture/11-3.jpg', 42.9, '纯白的大头体小兔！配上粉色口水巾更是萌上加萌！', 10, 2);
INSERT INTO `goods` VALUES (118, '流泪小猫', '/picture/12-1.jpg', '/picture/12-2.jpg', '/picture/12-3.jpg', 36, '看似单调的黑白色小猫，实则是伤心时陪你流泪的安静小天使呀', 10, 2);
INSERT INTO `goods` VALUES (119, '棉花糖喵', '/picture/13-1.jpg', '/picture/13-2.jpg', '/picture/13-3.jpg', 36.9, '拥有超级大眼的蓝色围巾小猫！围巾可拆卸，更方便换新衣哟~', 10, 2);
INSERT INTO `goods` VALUES (120, '平淡兔', '/picture/14-1.jpg', '/picture/14-2.jpg', '/picture/14-1.jpg', 39.9, '拥有红色小眼镜，让人情不自禁大喊“小兔老师！”的淡定小兔~', 10, 2);
INSERT INTO `goods` VALUES (121, '耶耶塔塔', '/picture/8-1.jpg', '/picture/8-2.jpg', '/picture/8-3.jpg', 23.9, '如果平淡兔是淡定的小兔老师，那么耶耶塔塔就是会睁大眼睛认真听课的兔兔学生！', 10, 3);
INSERT INTO `goods` VALUES (122, '咸蛋黄大耳鼠', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 29.9, '特色大耳朵+明黄色毛绒身体，飞天小鼠来临！', 10, 1);
INSERT INTO `goods` VALUES (123, '委屈小仓鼠', '/picture/10-1.jpg', '/picture/10-2.jpg', '/picture/10-3.jpg', 24.9, '白黄异耳的委屈脸仓鼠一枚~', 10, 2);
INSERT INTO `goods` VALUES (124, 'huhu小兔', '/picture/11-1.jpg', '/picture/11-2.jpg', '/picture/11-3.jpg', 42.9, '纯白的大头体小兔！配上粉色口水巾更是萌上加萌！', 10, 2);
INSERT INTO `goods` VALUES (125, '流泪小猫', '/picture/12-1.jpg', '/picture/12-2.jpg', '/picture/12-3.jpg', 36, '看似单调的黑白色小猫，实则是伤心时陪你流泪的安静小天使呀', 10, 2);
INSERT INTO `goods` VALUES (126, '棉花糖喵', '/picture/13-1.jpg', '/picture/13-2.jpg', '/picture/13-3.jpg', 36.9, '拥有超级大眼的蓝色围巾小猫！围巾可拆卸，更方便换新衣哟~', 10, 2);
INSERT INTO `goods` VALUES (127, '平淡兔', '/picture/14-1.jpg', '/picture/14-2.jpg', '/picture/14-1.jpg', 39.9, '拥有红色小眼镜，让人情不自禁大喊“小兔老师！”的淡定小兔~', 10, 2);
INSERT INTO `goods` VALUES (128, '耶耶塔塔', '/picture/8-1.jpg', '/picture/8-2.jpg', '/picture/8-3.jpg', 23.9, '如果平淡兔是淡定的小兔老师，那么耶耶塔塔就是会睁大眼睛认真听课的兔兔学生！', 10, 3);
INSERT INTO `goods` VALUES (129, '咸蛋黄大耳鼠', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 29.9, '特色大耳朵+明黄色毛绒身体，飞天小鼠来临！', 10, 1);
INSERT INTO `goods` VALUES (130, '委屈小仓鼠', '/picture/10-1.jpg', '/picture/10-2.jpg', '/picture/10-3.jpg', 24.9, '白黄异耳的委屈脸仓鼠一枚~', 10, 2);
INSERT INTO `goods` VALUES (131, 'huhu小兔', '/picture/11-1.jpg', '/picture/11-2.jpg', '/picture/11-3.jpg', 42.9, '纯白的大头体小兔！配上粉色口水巾更是萌上加萌！', 10, 2);
INSERT INTO `goods` VALUES (132, '流泪小猫', '/picture/12-1.jpg', '/picture/12-2.jpg', '/picture/12-3.jpg', 36, '看似单调的黑白色小猫，实则是伤心时陪你流泪的安静小天使呀', 10, 2);
INSERT INTO `goods` VALUES (133, '棉花糖喵', '/picture/13-1.jpg', '/picture/13-2.jpg', '/picture/13-3.jpg', 36.9, '拥有超级大眼的蓝色围巾小猫！围巾可拆卸，更方便换新衣哟~', 10, 2);
INSERT INTO `goods` VALUES (134, '平淡兔', '/picture/14-1.jpg', '/picture/14-2.jpg', '/picture/14-1.jpg', 39.9, '拥有红色小眼镜，让人情不自禁大喊“小兔老师！”的淡定小兔~', 10, 2);
INSERT INTO `goods` VALUES (135, '耶耶塔塔', '/picture/8-1.jpg', '/picture/8-2.jpg', '/picture/8-3.jpg', 23.9, '如果平淡兔是淡定的小兔老师，那么耶耶塔塔就是会睁大眼睛认真听课的兔兔学生！', 10, 3);
INSERT INTO `goods` VALUES (136, '咸蛋黄大耳鼠', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 29.9, '特色大耳朵+明黄色毛绒身体，飞天小鼠来临！', 10, 1);
INSERT INTO `goods` VALUES (137, '委屈小仓鼠', '/picture/10-1.jpg', '/picture/10-2.jpg', '/picture/10-3.jpg', 24.9, '白黄异耳的委屈脸仓鼠一枚~', 10, 2);
INSERT INTO `goods` VALUES (138, 'huhu小兔', '/picture/11-1.jpg', '/picture/11-2.jpg', '/picture/11-3.jpg', 42.9, '纯白的大头体小兔！配上粉色口水巾更是萌上加萌！', 10, 2);
INSERT INTO `goods` VALUES (139, '流泪小猫', '/picture/12-1.jpg', '/picture/12-2.jpg', '/picture/12-3.jpg', 36, '看似单调的黑白色小猫，实则是伤心时陪你流泪的安静小天使呀', 10, 2);
INSERT INTO `goods` VALUES (140, '棉花糖喵', '/picture/13-1.jpg', '/picture/13-2.jpg', '/picture/13-3.jpg', 36.9, '拥有超级大眼的蓝色围巾小猫！围巾可拆卸，更方便换新衣哟~', 10, 2);
INSERT INTO `goods` VALUES (141, '平淡兔', '/picture/14-1.jpg', '/picture/14-2.jpg', '/picture/14-1.jpg', 39.9, '拥有红色小眼镜，让人情不自禁大喊“小兔老师！”的淡定小兔~', 10, 2);
INSERT INTO `goods` VALUES (142, 'huhu小兔', '/picture/11-1.jpg', '/picture/11-2.jpg', '/picture/11-3.jpg', 42.9, '纯白的大头体小兔！配上粉色口水巾更是萌上加萌！', 10, 2);
INSERT INTO `goods` VALUES (143, '流泪小猫', '/picture/12-1.jpg', '/picture/12-2.jpg', '/picture/12-3.jpg', 36, '看似单调的黑白色小猫，实则是伤心时陪你流泪的安静小天使呀', 10, 2);
INSERT INTO `goods` VALUES (144, '棉花糖喵', '/picture/13-1.jpg', '/picture/13-2.jpg', '/picture/13-3.jpg', 36.9, '拥有超级大眼的蓝色围巾小猫！围巾可拆卸，更方便换新衣哟~', 10, 2);
INSERT INTO `goods` VALUES (145, '耶耶塔塔', '/picture/8-1.jpg', '/picture/8-2.jpg', '/picture/8-3.jpg', 23.9, '如果平淡兔是淡定的小兔老师，那么耶耶塔塔就是会睁大眼睛认真听课的兔兔学生！', 10, 2);
INSERT INTO `goods` VALUES (146, '耶耶塔塔', '/picture/8-1.jpg', '/picture/8-2.jpg', '/picture/8-3.jpg', 23.9, '如果平淡兔是淡定的小兔老师，那么耶耶塔塔就是会睁大眼睛认真听课的兔兔学生！', 10, 3);
INSERT INTO `goods` VALUES (147, '咸蛋黄大耳鼠', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 29.9, '特色大耳朵+明黄色毛绒身体，飞天小鼠来临！', 10, 1);
INSERT INTO `goods` VALUES (148, '委屈小仓鼠', '/picture/10-1.jpg', '/picture/10-2.jpg', '/picture/10-3.jpg', 24.9, '白黄异耳的委屈脸仓鼠一枚~', 10, 2);
INSERT INTO `goods` VALUES (149, 'huhu小兔', '/picture/11-1.jpg', '/picture/11-2.jpg', '/picture/11-3.jpg', 42.9, '纯白的大头体小兔！配上粉色口水巾更是萌上加萌！', 10, 2);
INSERT INTO `goods` VALUES (150, '流泪小猫', '/picture/12-1.jpg', '/picture/12-2.jpg', '/picture/12-3.jpg', 36, '看似单调的黑白色小猫，实则是伤心时陪你流泪的安静小天使呀', 10, 2);
INSERT INTO `goods` VALUES (151, '棉花糖喵', '/picture/13-1.jpg', '/picture/13-2.jpg', '/picture/13-3.jpg', 36.9, '拥有超级大眼的蓝色围巾小猫！围巾可拆卸，更方便换新衣哟~', 10, 2);
INSERT INTO `goods` VALUES (152, '平淡兔', '/picture/14-1.jpg', '/picture/14-2.jpg', '/picture/14-1.jpg', 39.9, '拥有红色小眼镜，让人情不自禁大喊“小兔老师！”的淡定小兔~', 10, 2);
INSERT INTO `goods` VALUES (153, '小熊乐园', '/picture/8-1.jpg', '/picture/8-2.jpg', '/picture/8-3.jpg', 299, '走进小熊乐园,与可爱的小熊一起准备过冬的食物吧,摘颗草莓藏放在巧克力做的房子里,好朋友一起分享劳动的果实.\r\n主口味:草莓奶油味 主要原料:乳脂奶油,纯巧克力,朗姆酒,幼砂糖,鲜草莓 甜度:二星（满五星） 最佳食用温度：5-7摄氏度', 10, 3);
INSERT INTO `goods` VALUES (154, '咸蛋黄大耳鼠', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 29.9, '特色大耳朵+明黄色毛绒身体，飞天小鼠来临！', 10, 1);
INSERT INTO `goods` VALUES (155, '委屈小仓鼠', '/picture/10-1.jpg', '/picture/10-2.jpg', '/picture/10-3.jpg', 24.9, '白黄异耳的委屈脸仓鼠一枚~', 10, 2);
INSERT INTO `goods` VALUES (156, 'huhu小兔', '/picture/11-1.jpg', '/picture/11-2.jpg', '/picture/11-3.jpg', 42.9, '纯白的大头体小兔！配上粉色口水巾更是萌上加萌！', 10, 2);
INSERT INTO `goods` VALUES (157, '流泪小猫', '/picture/12-1.jpg', '/picture/12-2.jpg', '/picture/12-3.jpg', 36, '看似单调的黑白色小猫，实则是伤心时陪你流泪的安静小天使呀', 10, 2);
INSERT INTO `goods` VALUES (158, '棉花糖喵', '/picture/13-1.jpg', '/picture/13-2.jpg', '/picture/13-3.jpg', 36.9, '拥有超级大眼的蓝色围巾小猫！围巾可拆卸，更方便换新衣哟~', 10, 2);
INSERT INTO `goods` VALUES (159, '平淡兔', '/picture/14-1.jpg', '/picture/14-2.jpg', '/picture/14-1.jpg', 39.9, '拥有红色小眼镜，让人情不自禁大喊“小兔老师！”的淡定小兔~', 10, 2);
INSERT INTO `goods` VALUES (160, '耶耶塔塔', '/picture/8-1.jpg', '/picture/8-2.jpg', '/picture/8-3.jpg', 23.9, '如果平淡兔是淡定的小兔老师，那么耶耶塔塔就是会睁大眼睛认真听课的兔兔学生！', 10, 3);
INSERT INTO `goods` VALUES (161, '咸蛋黄大耳鼠', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 29.9, '特色大耳朵+明黄色毛绒身体，飞天小鼠来临！', 10, 1);
INSERT INTO `goods` VALUES (162, '委屈小仓鼠', '/picture/10-1.jpg', '/picture/10-2.jpg', '/picture/10-3.jpg', 24.9, '白黄异耳的委屈脸仓鼠一枚~', 10, 2);
INSERT INTO `goods` VALUES (163, 'huhu小兔', '/picture/11-1.jpg', '/picture/11-2.jpg', '/picture/11-3.jpg', 42.9, '纯白的大头体小兔！配上粉色口水巾更是萌上加萌！', 10, 2);
INSERT INTO `goods` VALUES (164, '流泪小猫', '/picture/12-1.jpg', '/picture/12-2.jpg', '/picture/12-3.jpg', 36, '看似单调的黑白色小猫，实则是伤心时陪你流泪的安静小天使呀', 10, 2);
INSERT INTO `goods` VALUES (165, '棉花糖喵', '/picture/13-1.jpg', '/picture/13-2.jpg', '/picture/13-3.jpg', 36.9, '拥有超级大眼的蓝色围巾小猫！围巾可拆卸，更方便换新衣哟~', 10, 2);
INSERT INTO `goods` VALUES (166, '平淡兔', '/picture/14-1.jpg', '/picture/14-2.jpg', '/picture/14-1.jpg', 39.9, '拥有红色小眼镜，让人情不自禁大喊“小兔老师！”的淡定小兔~', 10, 2);
INSERT INTO `goods` VALUES (167, '耶耶塔塔', '/picture/8-1.jpg', '/picture/8-2.jpg', '/picture/8-3.jpg', 23.9, '如果平淡兔是淡定的小兔老师，那么耶耶塔塔就是会睁大眼睛认真听课的兔兔学生！', 10, 3);
INSERT INTO `goods` VALUES (168, '咸蛋黄大耳鼠', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 29.9, '特色大耳朵+明黄色毛绒身体，飞天小鼠来临！', 10, 1);
INSERT INTO `goods` VALUES (169, '委屈小仓鼠', '/picture/10-1.jpg', '/picture/10-2.jpg', '/picture/10-3.jpg', 24.9, '白黄异耳的委屈脸仓鼠一枚~', 10, 2);
INSERT INTO `goods` VALUES (170, 'huhu小兔', '/picture/11-1.jpg', '/picture/11-2.jpg', '/picture/11-3.jpg', 42.9, '纯白的大头体小兔！配上粉色口水巾更是萌上加萌！', 10, 2);
INSERT INTO `goods` VALUES (171, '流泪小猫', '/picture/12-1.jpg', '/picture/12-2.jpg', '/picture/12-3.jpg', 36, '看似单调的黑白色小猫，实则是伤心时陪你流泪的安静小天使呀', 10, 2);
INSERT INTO `goods` VALUES (172, '棉花糖喵', '/picture/13-1.jpg', '/picture/13-2.jpg', '/picture/13-3.jpg', 36.9, '拥有超级大眼的蓝色围巾小猫！围巾可拆卸，更方便换新衣哟~', 10, 2);
INSERT INTO `goods` VALUES (173, '平淡兔', '/picture/14-1.jpg', '/picture/14-2.jpg', '/picture/14-1.jpg', 39.9, '拥有红色小眼镜，让人情不自禁大喊“小兔老师！”的淡定小兔~', 10, 2);
INSERT INTO `goods` VALUES (174, '耶耶塔塔', '/picture/8-1.jpg', '/picture/8-2.jpg', '/picture/8-3.jpg', 23.9, '如果平淡兔是淡定的小兔老师，那么耶耶塔塔就是会睁大眼睛认真听课的兔兔学生！', 10, 3);
INSERT INTO `goods` VALUES (175, '咸蛋黄大耳鼠', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 29.9, '特色大耳朵+明黄色毛绒身体，飞天小鼠来临！', 10, 1);
INSERT INTO `goods` VALUES (176, '委屈小仓鼠', '/picture/10-1.jpg', '/picture/10-2.jpg', '/picture/10-3.jpg', 24.9, '白黄异耳的委屈脸仓鼠一枚~', 10, 2);
INSERT INTO `goods` VALUES (177, 'huhu小兔', '/picture/11-1.jpg', '/picture/11-2.jpg', '/picture/11-3.jpg', 42.9, '纯白的大头体小兔！配上粉色口水巾更是萌上加萌！', 10, 2);

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int(11) NOT NULL COMMENT '主键',
  `menuName` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限名',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '资源路径',
  `pid` int(11) NULL DEFAULT NULL COMMENT '父菜单id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (101, '系统管理', '', 0);
INSERT INTO `menu` VALUES (102, '账户管理', '/account/findAll/1/10', 101);
INSERT INTO `menu` VALUES (103, '角色管理', '/role/findAll/1/10', 101);
INSERT INTO `menu` VALUES (104, '权限管理', '/menu/findAll/1/10', 101);
INSERT INTO `menu` VALUES (105, '商场数据', NULL, 0);
INSERT INTO `menu` VALUES (106, '商品管理', '/goods/findAll/1/10', 105);
INSERT INTO `menu` VALUES (107, '订单管理', '/order/findAll/1/10', 105);
INSERT INTO `menu` VALUES (108, '客户管理', '/user/findAll/1/10', 105);

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '商品id',
  `amount` int(11) NULL DEFAULT NULL COMMENT '商品数量',
  `price` float NULL DEFAULT NULL COMMENT '商品单价',
  `order_id` int(11) NULL DEFAULT NULL COMMENT '订单id （外键）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES (1, 1, 1, 100, 1);
INSERT INTO `orderitem` VALUES (2, 2, 1, 100, 1);
INSERT INTO `orderitem` VALUES (3, 3, 1, 100, 1);
INSERT INTO `orderitem` VALUES (4, 2, 1, 200, 2);
INSERT INTO `orderitem` VALUES (5, 1, 2, 100, 3);
INSERT INTO `orderitem` VALUES (6, 3, 1, 300, 3);
INSERT INTO `orderitem` VALUES (7, 13, 1, 36.9, 3);
INSERT INTO `orderitem` VALUES (8, 15, 1, 23.9, 3);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `order_date` datetime NOT NULL,
  `amount` decimal(10, 2) NOT NULL,
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 14, '2025-12-18 10:41:03', 100.00, '已完成');
INSERT INTO `orders` VALUES (2, 13, '2025-12-16 16:21:53', 400.00, '已完成');
INSERT INTO `orders` VALUES (3, 20, '2026-10-23 16:23:13', 60.80, '待支付');

-- ----------------------------
-- Table structure for recommend
-- ----------------------------
DROP TABLE IF EXISTS `recommend`;
CREATE TABLE `recommend`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NULL DEFAULT NULL,
  `goods_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_goods_id_idx`(`goods_id`) USING BTREE,
  CONSTRAINT `fk_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of recommend
-- ----------------------------
INSERT INTO `recommend` VALUES (9, 2, 9);
INSERT INTO `recommend` VALUES (10, 3, 10);
INSERT INTO `recommend` VALUES (11, 3, 12);
INSERT INTO `recommend` VALUES (12, 3, 13);
INSERT INTO `recommend` VALUES (13, 3, 14);
INSERT INTO `recommend` VALUES (14, 3, 15);
INSERT INTO `recommend` VALUES (15, 3, 16);
INSERT INTO `recommend` VALUES (17, 3, 18);
INSERT INTO `recommend` VALUES (18, 3, 19);
INSERT INTO `recommend` VALUES (29, 1, 42);
INSERT INTO `recommend` VALUES (33, 2, 10);
INSERT INTO `recommend` VALUES (34, 2, 11);
INSERT INTO `recommend` VALUES (35, 2, 12);
INSERT INTO `recommend` VALUES (36, 2, 13);
INSERT INTO `recommend` VALUES (37, 2, 14);
INSERT INTO `recommend` VALUES (38, 2, 15);
INSERT INTO `recommend` VALUES (39, 2, 16);
INSERT INTO `recommend` VALUES (40, 2, 18);
INSERT INTO `recommend` VALUES (41, 2, 26);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '无意义，注解uuid。',
  `roleName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色名',
  `roleDesc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (11, 'ROLE_ADMIN', '管理员');
INSERT INTO `role` VALUES (12, 'ROLE_BUS', '商家');

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu`  (
  `menuId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`menuId`, `roleId`) USING BTREE,
  INDEX `roleId`(`roleId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES (101, 11);
INSERT INTO `role_menu` VALUES (102, 11);
INSERT INTO `role_menu` VALUES (103, 11);
INSERT INTO `role_menu` VALUES (104, 11);
INSERT INTO `role_menu` VALUES (105, 11);
INSERT INTO `role_menu` VALUES (106, 11);
INSERT INTO `role_menu` VALUES (107, 11);
INSERT INTO `role_menu` VALUES (108, 11);
INSERT INTO `role_menu` VALUES (105, 12);
INSERT INTO `role_menu` VALUES (106, 12);
INSERT INTO `role_menu` VALUES (107, 12);
INSERT INTO `role_menu` VALUES (108, 12);

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES (1, '小猫派ᨐ');
INSERT INTO `type` VALUES (2, '小狗派ฅฅ');
INSERT INTO `type` VALUES (3, '小兔派ᕬᕬ');
INSERT INTO `type` VALUES (4, '小鼠派ᐢᐢ');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户名',
  `password` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户密码',
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户邮箱',
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '用户姓名',
  `phone` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '用户电话',
  `address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '用户地址',
  `isadmin` bit(1) NULL DEFAULT NULL COMMENT '是否为管理员',
  `isvalidate` bit(1) NULL DEFAULT NULL COMMENT '用户是否有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (13, '小沙', 'f379eaf3c831b04de153469d1bec345e', '0624@qq.com', '小沙', '19825696223', '江苏', b'0', b'0');
INSERT INTO `user` VALUES (14, '小淳', 'f379eaf3c831b04de153469d1bec345e', '555@qq.com', '小淳', '30555', '江苏', b'1', b'1');
INSERT INTO `user` VALUES (17, 'AAA毛绒玩具批发商沙总', 'f379eaf3c831b04de153469d1bec345e', '88888888@qq.com', '小沙', '88888888', '汤臣一品', b'0', b'1');
INSERT INTO `user` VALUES (18, 'jun', 'f379eaf3c831b04de153469d1bec345e', '88888888@qq.com', '淳', '88888888', '江苏', b'0', b'0');
INSERT INTO `user` VALUES (19, 'AAA畅记冒菜馆大畅总', 'f379eaf3c831b04de153469d1bec345e', '88888888@qq.com', '小畅', '88888888', '暂住芭比之梦想豪宅', b'0', b'1');
INSERT INTO `user` VALUES (20, 'wonbin', 'd25922edb7ab92c0ca31328cbdcbd42f', '0302@qq.com', 'wonbin', '19825696223', '江苏', b'0', b'0');

SET FOREIGN_KEY_CHECKS = 1;
