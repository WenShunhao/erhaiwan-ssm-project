/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:3306
 Source Schema         : securitydemo2

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 04/12/2019 14:19:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `parent` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '可以不要,主要用在前端隐藏菜单项',
  `pid` int(11) NOT NULL,
  `uri` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of menu
-- ----------------------------
BEGIN;
INSERT INTO `menu` VALUES ('1', '借阅书籍', 'true', 0, '/admin/borrowbook/add');
INSERT INTO `menu` VALUES ('2', '图书信息', 'true', 0, '#');
INSERT INTO `menu` VALUES ('201', '书籍信息', 'false', 2, '/admin/book/list');
INSERT INTO `menu` VALUES ('202', '添加书籍', 'false', 2, '/admin/book/add');
INSERT INTO `menu` VALUES ('3', '借阅信息查询', 'true', 0, '#');
INSERT INTO `menu` VALUES ('301', '归还记录', 'false', 3, '/admin/return/list');
INSERT INTO `menu` VALUES ('302', '逾期未归', 'false', 3, '/admin/not/list');
INSERT INTO `menu` VALUES ('4', '基础资料管理', 'true', 0, '#');
INSERT INTO `menu` VALUES ('401', '用户管理', 'false', 4, '/admin/user/list,/admin/user/inser');
INSERT INTO `menu` VALUES ('402', '角色管理', 'false', 4, '/admin/role/list,/admin/privilege/list,/admin/role-privilege/inser');
COMMIT;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of role
-- ----------------------------
BEGIN;
INSERT INTO `role` VALUES (1, '超级管理员', '拥有至高无上的权利');
INSERT INTO `role` VALUES (2, '高级管理员', '拥有大部分权限');
INSERT INTO `role` VALUES (3, '普通管理员', '拥有系统的部分权限');
COMMIT;

-- ----------------------------
-- Table structure for role_privilege
-- ----------------------------
DROP TABLE IF EXISTS `role_privilege`;
CREATE TABLE `role_privilege` (
  `role_id` int(11) NOT NULL,
  `privilege_id` varchar(20) NOT NULL,
  PRIMARY KEY (`role_id`,`privilege_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of role_privilege
-- ----------------------------
BEGIN;
INSERT INTO `role_privilege` VALUES (1, '1');
INSERT INTO `role_privilege` VALUES (1, '2');
INSERT INTO `role_privilege` VALUES (1, '201');
INSERT INTO `role_privilege` VALUES (1, '202');
INSERT INTO `role_privilege` VALUES (1, '3');
INSERT INTO `role_privilege` VALUES (1, '301');
INSERT INTO `role_privilege` VALUES (1, '302');
INSERT INTO `role_privilege` VALUES (1, '4');
INSERT INTO `role_privilege` VALUES (1, '401');
INSERT INTO `role_privilege` VALUES (1, '402');
INSERT INTO `role_privilege` VALUES (2, '1');
INSERT INTO `role_privilege` VALUES (2, '2');
INSERT INTO `role_privilege` VALUES (2, '201');
INSERT INTO `role_privilege` VALUES (2, '202');
INSERT INTO `role_privilege` VALUES (2, '3');
INSERT INTO `role_privilege` VALUES (2, '302');
INSERT INTO `role_privilege` VALUES (3, '1');
INSERT INTO `role_privilege` VALUES (3, '2');
INSERT INTO `role_privilege` VALUES (3, '201');
INSERT INTO `role_privilege` VALUES (3, '202');
INSERT INTO `role_privilege` VALUES (3, '3');
INSERT INTO `role_privilege` VALUES (3, '301');
INSERT INTO `role_privilege` VALUES (3, '302');
INSERT INTO `role_privilege` VALUES (3, '4');
INSERT INTO `role_privilege` VALUES (3, '401');
INSERT INTO `role_privilege` VALUES (3, '402');
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (1, 'admin', '123456');
INSERT INTO `user` VALUES (2, 'lzx', '123456');
INSERT INTO `user` VALUES (3, '123', '123456');
INSERT INTO `user` VALUES (4, '吴晓', '123456');
INSERT INTO `user` VALUES (5, '12', '123456');
INSERT INTO `user` VALUES (6, '123', '123456');
INSERT INTO `user` VALUES (7, 'wu', '123456');
COMMIT;

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_role
-- ----------------------------
BEGIN;
INSERT INTO `user_role` VALUES (1, 1);
INSERT INTO `user_role` VALUES (2, 2);
INSERT INTO `user_role` VALUES (3, 3);
INSERT INTO `user_role` VALUES (4, 3);
INSERT INTO `user_role` VALUES (5, 2);
INSERT INTO `user_role` VALUES (7, 3);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
