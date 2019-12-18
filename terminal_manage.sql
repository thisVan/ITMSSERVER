/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : localhost:3306
 Source Schema         : terminal_manage

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 18/12/2019 17:36:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for action_log
-- ----------------------------
DROP TABLE IF EXISTS `action_log`;
CREATE TABLE `action_log`  (
  `action_log_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `role_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `operation_time` datetime(0) DEFAULT NULL,
  `operation` varchar(50) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `modify_object_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `modify_object_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `modify_object_id` bigint(20) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`action_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 226 CHARACTER SET = utf8 COLLATE = utf8_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of action_log
-- ----------------------------
INSERT INTO `action_log` VALUES (52, 'admin', '系统管理员', '2019-11-04 14:58:20', 'MATERIAL_UPLOAD', 'METERIAL', 'test.jpg', 925, 0);
INSERT INTO `action_log` VALUES (53, 'admin', '系统管理员', '2019-11-04 14:58:52', 'MATERIAL_MODIFY', 'METERIAL', 'test_modify', 925, 0);
INSERT INTO `action_log` VALUES (54, 'admin', '系统管理员', '2019-11-04 14:59:22', 'MATERIAL_REVIEW', 'METERIAL', 'test.jpg', 925, 0);
INSERT INTO `action_log` VALUES (55, 'admin', '系统管理员', '2019-11-04 15:03:32', 'MATERIAL_DELETE', 'METERIAL', 'test.jpg', 925, 0);
INSERT INTO `action_log` VALUES (56, 'admin', '系统管理员', '2019-11-04 15:03:32', 'MATERIAL_DELETE', 'METERIAL', '深圳东门 (9).mp4', 867, 0);
INSERT INTO `action_log` VALUES (57, 'admin', '系统管理员', '2019-11-04 15:04:54', 'PERIOD_ADD', 'PERIOD', '南都轮播', 56, 0);
INSERT INTO `action_log` VALUES (58, 'admin', '系统管理员', '2019-11-04 15:05:11', 'PERIOD_MODIFY', 'PERIOD', '南都不轮播', 56, 0);
INSERT INTO `action_log` VALUES (59, 'admin', '系统管理员', '2019-11-04 15:05:34', 'PERIOD_DELETE', 'PERIOD', '南都不轮播', 56, 0);
INSERT INTO `action_log` VALUES (60, 'admin', '系统管理员', '2019-11-04 15:05:34', 'PERIOD_DELETE', 'PERIOD', '江门中泰来-周期轮播', 49, 0);
INSERT INTO `action_log` VALUES (61, 'admin', '系统管理员', '2019-11-04 15:06:30', 'ITEM_ADD', 'ITEM', 'wukongzhuan_test', 322, 0);
INSERT INTO `action_log` VALUES (62, 'admin', '系统管理员', '2019-11-04 15:06:42', 'ITEM_ADD', 'ITEM', '深圳东门 (25)', 323, 0);
INSERT INTO `action_log` VALUES (63, 'admin', '系统管理员', '2019-11-04 15:07:32', 'ITEM_MODIFY', 'ITEM', 'wukongzhuan_test', 322, 0);
INSERT INTO `action_log` VALUES (64, 'admin', '系统管理员', '2019-11-04 15:08:02', 'ITEM_DELETE', 'ITEM', '深圳东门 (25)', 323, 0);
INSERT INTO `action_log` VALUES (65, 'admin', '系统管理员', '2019-11-04 15:08:02', 'ITEM_DELETE', 'ITEM', 'wukongzhuan_test', 322, 0);
INSERT INTO `action_log` VALUES (66, 'admin', '系统管理员', '2019-11-04 15:16:53', 'MATERIAL_UPLOAD', 'METERIAL', 'test.jpg', 926, 0);
INSERT INTO `action_log` VALUES (67, 'admin', '系统管理员', '2019-11-04 15:17:23', 'MATERIAL_MODIFY', 'METERIAL', '不test了', 926, 0);
INSERT INTO `action_log` VALUES (68, 'admin', '系统管理员', '2019-11-04 15:17:37', 'MATERIAL_REVIEW', 'METERIAL', 'test.jpg', 926, 0);
INSERT INTO `action_log` VALUES (69, 'admin', '系统管理员', '2019-11-04 15:21:57', 'MATERIAL_MODIFY', 'METERIAL', '疯狂test', 926, 0);
INSERT INTO `action_log` VALUES (70, 'admin', '系统管理员', '2019-11-04 15:22:47', 'MATERIAL_DELETE', 'METERIAL', '疯狂test', 926, 0);
INSERT INTO `action_log` VALUES (71, 'admin', '系统管理员', '2019-11-04 15:23:27', 'MATERIAL_UPLOAD', 'METERIAL', 'test.jpg', 927, 0);
INSERT INTO `action_log` VALUES (72, 'admin', '系统管理员', '2019-11-04 15:23:56', 'MATERIAL_MODIFY', 'METERIAL', '南都test', 927, 0);
INSERT INTO `action_log` VALUES (73, 'admin', '系统管理员', '2019-11-04 15:24:09', 'MATERIAL_REVIEW', 'METERIAL', '南都test', 927, 0);
INSERT INTO `action_log` VALUES (74, 'admin', '系统管理员', '2019-11-04 15:24:27', 'MATERIAL_DELETE', 'METERIAL', '南都test', 927, 0);
INSERT INTO `action_log` VALUES (75, 'admin', '系统管理员', '2019-11-04 16:32:55', 'ITEM_ADD', 'ITEM', 'wukongzhuan_test', 324, 0);
INSERT INTO `action_log` VALUES (76, 'admin', '系统管理员', '2019-11-04 16:33:53', 'ITEM_ADD', 'ITEM', '9e2012ff53198e87db9056b7e01110f2', 325, 0);
INSERT INTO `action_log` VALUES (77, 'admin', '系统管理员', '2019-11-04 16:34:10', 'ITEM_ADD', 'ITEM', '3f334078d8798e9ed1c7486c2387e118', 326, 0);
INSERT INTO `action_log` VALUES (78, 'admin', '系统管理员', '2019-11-04 16:58:15', 'ITEM_ADD', 'ITEM', '深圳东门 (25)', 327, 0);
INSERT INTO `action_log` VALUES (79, 'admin', '系统管理员', '2019-11-04 20:41:03', 'MATERIAL_UPLOAD', 'MATERIAL', 'test.jpg', 928, 0);
INSERT INTO `action_log` VALUES (80, 'admin', '系统管理员', '2019-11-04 20:41:25', 'MATERIAL_REVIEW', 'MATERIAL', 'test', 928, 0);
INSERT INTO `action_log` VALUES (81, 'admin', '系统管理员', '2019-11-04 21:20:14', 'PLAY_TABLE_GENERATION', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-21)', 713, 0);
INSERT INTO `action_log` VALUES (82, 'admin', '系统管理员', '2019-11-04 21:24:38', 'PLAY_TABLE_GENERATION', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-09)', 716, 0);
INSERT INTO `action_log` VALUES (83, 'admin', '系统管理员', '2019-11-04 21:26:41', 'PLAY_TABLE_GENERATION', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-11)', 719, 0);
INSERT INTO `action_log` VALUES (84, 'admin', '系统管理员', '2019-11-04 21:29:07', 'PLAY_TABLE_GENERATION', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-22)', 722, 0);
INSERT INTO `action_log` VALUES (85, 'admin', '系统管理员', '2019-11-04 21:32:56', 'PLAY_TABLE_GENERATION', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-04)', 723, 0);
INSERT INTO `action_log` VALUES (86, 'admin', '系统管理员', '2019-11-04 21:33:14', 'PLAY_TABLE_GENERATION', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-28)', 726, 0);
INSERT INTO `action_log` VALUES (87, 'admin', '系统管理员', '2019-11-04 21:36:56', 'PLAY_TABLE_GENERATION', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-12-04)', 729, 0);
INSERT INTO `action_log` VALUES (88, 'admin', '系统管理员', '2019-11-04 21:58:32', 'PLAY_TABLE_GENERATION', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-12-24)', 730, 0);
INSERT INTO `action_log` VALUES (89, 'admin', '系统管理员', '2019-11-04 21:58:32', 'PLAY_TABLE_GENERATION', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-12-25)', 731, 0);
INSERT INTO `action_log` VALUES (90, 'admin', '系统管理员', '2019-11-04 22:01:44', 'PLAY_TABLE_GENERATION', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-13)', 732, 0);
INSERT INTO `action_log` VALUES (91, 'admin', '系统管理员', '2019-11-04 22:01:44', 'PLAY_TABLE_GENERATION', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-14)', 733, 0);
INSERT INTO `action_log` VALUES (92, 'admin', '系统管理员', '2019-11-04 22:01:44', 'PLAY_TABLE_GENERATION', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-15)', 734, 0);
INSERT INTO `action_log` VALUES (93, 'admin', '系统管理员', '2019-11-04 22:01:44', 'PLAY_TABLE_GENERATION', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-16)', 735, 0);
INSERT INTO `action_log` VALUES (94, 'admin', '系统管理员', '2019-11-04 22:01:44', 'PLAY_TABLE_GENERATION', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-17)', 736, 0);
INSERT INTO `action_log` VALUES (95, 'admin', '系统管理员', '2019-11-04 22:01:44', 'PLAY_TABLE_GENERATION', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-18)', 737, 0);
INSERT INTO `action_log` VALUES (96, 'admin', '系统管理员', '2019-11-04 22:03:15', 'PLAY_TABLE_GENERATION', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-27)', 738, 0);
INSERT INTO `action_log` VALUES (97, 'admin', '系统管理员', '2019-11-04 22:03:15', 'PLAY_TABLE_GENERATION', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-28)', 739, 0);
INSERT INTO `action_log` VALUES (98, 'admin', '系统管理员', '2019-11-04 22:03:15', 'PLAY_TABLE_GENERATION', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-29)', 740, 0);
INSERT INTO `action_log` VALUES (99, 'admin', '系统管理员', '2019-11-04 22:03:15', 'PLAY_TABLE_GENERATION', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-30)', 741, 0);
INSERT INTO `action_log` VALUES (100, 'admin', '系统管理员', '2019-11-04 22:06:57', 'PLAY_TABLE_GENERATION', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-04)', 742, 0);
INSERT INTO `action_log` VALUES (101, 'admin', '系统管理员', '2019-11-04 22:07:20', 'PLAY_TABLE_GENERATION', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-21)', 743, 0);
INSERT INTO `action_log` VALUES (102, 'admin', '系统管理员', '2019-11-04 22:07:20', 'PLAY_TABLE_GENERATION', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-22)', 744, 0);
INSERT INTO `action_log` VALUES (103, 'admin', '系统管理员', '2019-11-04 22:07:20', 'PLAY_TABLE_GENERATION', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-23)', 745, 0);
INSERT INTO `action_log` VALUES (104, 'admin', '系统管理员', '2019-11-04 22:07:20', 'PLAY_TABLE_GENERATION', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-24)', 746, 0);
INSERT INTO `action_log` VALUES (105, 'admin', '系统管理员', '2019-11-04 22:07:20', 'PLAY_TABLE_GENERATION', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-25)', 747, 0);
INSERT INTO `action_log` VALUES (106, 'admin', '系统管理员', '2019-11-04 22:30:07', 'PLAY_TABLE_COPY_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-30)', 741, 0);
INSERT INTO `action_log` VALUES (107, 'admin', '系统管理员', '2019-11-04 22:30:42', 'PLAY_TABLE_COPY_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-30)', 741, 0);
INSERT INTO `action_log` VALUES (108, 'admin', '系统管理员', '2019-11-04 22:45:13', 'PLAY_TABLE_DELETE_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-30)', 741, 0);
INSERT INTO `action_log` VALUES (109, 'admin', '系统管理员', '2019-11-04 22:45:37', 'PLAY_TABLE_DELETE_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-30)', 741, 0);
INSERT INTO `action_log` VALUES (110, 'admin', '系统管理员', '2019-11-04 23:00:36', 'ITEM_ADD', 'ITEM', '深圳东门 (25)', 328, 0);
INSERT INTO `action_log` VALUES (111, 'admin', '系统管理员', '2019-11-04 23:01:29', 'ITEM_ADD', 'ITEM', '深圳东门 (25)', 329, 0);
INSERT INTO `action_log` VALUES (112, 'admin', '系统管理员', '2019-11-04 23:01:29', 'PLAY_TABLE_COPY_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-30)', 741, 0);
INSERT INTO `action_log` VALUES (113, 'admin', '系统管理员', '2019-11-04 23:01:41', 'ITEM_ADD', 'ITEM', '深圳东门 (25)', 330, 0);
INSERT INTO `action_log` VALUES (114, 'admin', '系统管理员', '2019-11-04 23:01:41', 'PLAY_TABLE_COPY_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-30)', 741, 0);
INSERT INTO `action_log` VALUES (115, 'admin', '系统管理员', '2019-11-04 23:02:13', 'ITEM_ADD', 'ITEM', '深圳东门 (25)', 331, 0);
INSERT INTO `action_log` VALUES (116, 'admin', '系统管理员', '2019-11-04 23:02:13', 'PLAY_TABLE_COPY_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-30)', 741, 0);
INSERT INTO `action_log` VALUES (117, 'admin', '系统管理员', '2019-11-04 23:02:19', 'PLAY_TABLE_DELETE_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-30)', 741, 0);
INSERT INTO `action_log` VALUES (118, 'admin', '系统管理员', '2019-11-04 23:02:21', 'PLAY_TABLE_DELETE_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-30)', 741, 0);
INSERT INTO `action_log` VALUES (119, 'admin', '系统管理员', '2019-11-04 23:02:23', 'PLAY_TABLE_DELETE_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-30)', 741, 0);
INSERT INTO `action_log` VALUES (120, 'admin', '系统管理员', '2019-11-04 23:02:25', 'PLAY_TABLE_DELETE_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-30)', 741, 0);
INSERT INTO `action_log` VALUES (121, 'admin', '系统管理员', '2019-11-04 23:02:26', 'PLAY_TABLE_DELETE_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-30)', 741, 0);
INSERT INTO `action_log` VALUES (122, 'admin', '系统管理员', '2019-11-06 20:58:35', 'MATERIAL_UPLOAD', 'MATERIAL', '深圳东门 (14).mp4', 929, 0);
INSERT INTO `action_log` VALUES (123, 'admin', '系统管理员', '2019-11-06 20:59:08', 'MATERIAL_REVIEW', 'MATERIAL', '深圳东门 (14)', 929, 0);
INSERT INTO `action_log` VALUES (124, 'admin', '系统管理员', '2019-11-08 14:14:52', 'PLAY_TABLE_GENERATION', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-08)', 749, 0);
INSERT INTO `action_log` VALUES (125, 'admin', '系统管理员', '2019-11-08 14:15:17', 'PLAY_TABLE_DELETE_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-08)', 749, 0);
INSERT INTO `action_log` VALUES (126, 'admin', '系统管理员', '2019-11-08 14:15:23', 'PLAY_TABLE_DELETE_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-08)', 749, 0);
INSERT INTO `action_log` VALUES (127, 'admin', '系统管理员', '2019-11-08 14:16:41', 'PLAY_TABLE_DELETE_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-08)', 749, 0);
INSERT INTO `action_log` VALUES (128, 'admin', '系统管理员', '2019-11-08 14:25:10', 'ITEM_ADD', 'ITEM', '2e5e0121afcb87357f9fa0036af7eb63', 332, 0);
INSERT INTO `action_log` VALUES (129, 'admin', '系统管理员', '2019-11-08 14:25:26', 'ITEM_ADD', 'ITEM', '5a624086ab35dc4af26c299e0262fd9b', 333, 0);
INSERT INTO `action_log` VALUES (130, 'admin', '系统管理员', '2019-11-08 14:25:39', 'PLAY_TABLE_GENERATION', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-08)', 750, 0);
INSERT INTO `action_log` VALUES (131, 'admin', '系统管理员', '2019-11-08 14:25:39', 'PLAY_TABLE_GENERATION', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-09)', 751, 0);
INSERT INTO `action_log` VALUES (132, 'admin', '系统管理员', '2019-11-08 14:25:39', 'PLAY_TABLE_GENERATION', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-10)', 752, 0);
INSERT INTO `action_log` VALUES (133, 'admin', '系统管理员', '2019-11-08 14:25:53', 'PLAY_TABLE_DELETE_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-10)', 752, 0);
INSERT INTO `action_log` VALUES (134, 'admin', '系统管理员', '2019-11-08 14:25:55', 'PLAY_TABLE_COPY_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-10)', 752, 0);
INSERT INTO `action_log` VALUES (135, 'admin', '系统管理员', '2019-11-08 14:25:57', 'PLAY_TABLE_COPY_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-10)', 752, 0);
INSERT INTO `action_log` VALUES (136, 'admin', '系统管理员', '2019-11-08 14:25:58', 'PLAY_TABLE_COPY_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-10)', 752, 0);
INSERT INTO `action_log` VALUES (137, 'admin', '系统管理员', '2019-11-08 14:25:59', 'PLAY_TABLE_COPY_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-10)', 752, 0);
INSERT INTO `action_log` VALUES (138, 'admin', '系统管理员', '2019-11-08 14:26:01', 'PLAY_TABLE_COPY_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-10)', 752, 0);
INSERT INTO `action_log` VALUES (139, 'admin', '系统管理员', '2019-11-08 14:26:03', 'PLAY_TABLE_COPY_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-10)', 752, 0);
INSERT INTO `action_log` VALUES (140, 'admin', '系统管理员', '2019-11-08 14:26:05', 'PLAY_TABLE_COPY_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-10)', 752, 0);
INSERT INTO `action_log` VALUES (141, 'admin', '系统管理员', '2019-11-08 14:26:07', 'PLAY_TABLE_COPY_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-10)', 752, 0);
INSERT INTO `action_log` VALUES (142, 'admin', '系统管理员', '2019-11-08 14:26:14', 'PLAY_TABLE_DELETE_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-10)', 752, 0);
INSERT INTO `action_log` VALUES (143, 'admin', '系统管理员', '2019-11-08 14:26:23', 'PLAY_TABLE_DELETE_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-10)', 752, 0);
INSERT INTO `action_log` VALUES (144, 'admin', '系统管理员', '2019-11-08 14:26:59', 'PLAY_TABLE_DELETE_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-10)', 752, 0);
INSERT INTO `action_log` VALUES (145, 'admin', '系统管理员', '2019-11-08 14:27:02', 'PLAY_TABLE_DELETE_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-10)', 752, 0);
INSERT INTO `action_log` VALUES (146, 'admin', '系统管理员', '2019-11-08 14:27:06', 'PLAY_TABLE_DELETE_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-10)', 752, 0);
INSERT INTO `action_log` VALUES (147, 'admin', '系统管理员', '2019-11-08 14:27:08', 'PLAY_TABLE_DELETE_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-10)', 752, 0);
INSERT INTO `action_log` VALUES (148, 'admin', '系统管理员', '2019-11-08 14:35:40', 'PLAY_TABLE_COPY_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-10)', 752, 0);
INSERT INTO `action_log` VALUES (149, 'admin', '系统管理员', '2019-11-08 14:35:43', 'PLAY_TABLE_COPY_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-10)', 752, 0);
INSERT INTO `action_log` VALUES (150, 'admin', '系统管理员', '2019-11-08 14:35:45', 'PLAY_TABLE_COPY_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-10)', 752, 0);
INSERT INTO `action_log` VALUES (151, 'admin', '系统管理员', '2019-11-08 14:35:46', 'PLAY_TABLE_COPY_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-10)', 752, 0);
INSERT INTO `action_log` VALUES (152, 'admin', '系统管理员', '2019-11-08 14:35:48', 'PLAY_TABLE_COPY_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-10)', 752, 0);
INSERT INTO `action_log` VALUES (153, 'admin', '系统管理员', '2019-11-08 14:35:49', 'PLAY_TABLE_COPY_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-10)', 752, 0);
INSERT INTO `action_log` VALUES (154, 'admin', '系统管理员', '2019-11-08 14:35:50', 'PLAY_TABLE_COPY_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-10)', 752, 0);
INSERT INTO `action_log` VALUES (155, 'admin', '系统管理员', '2019-11-08 14:35:52', 'PLAY_TABLE_COPY_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-10)', 752, 0);
INSERT INTO `action_log` VALUES (156, 'admin', '系统管理员', '2019-11-08 14:35:54', 'PLAY_TABLE_COPY_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-10)', 752, 0);
INSERT INTO `action_log` VALUES (157, 'admin', '系统管理员', '2019-11-08 14:35:55', 'PLAY_TABLE_COPY_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-10)', 752, 0);
INSERT INTO `action_log` VALUES (158, 'admin', '系统管理员', '2019-11-08 14:35:57', 'PLAY_TABLE_COPY_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-10)', 752, 0);
INSERT INTO `action_log` VALUES (159, 'admin', '系统管理员', '2019-11-08 14:35:59', 'PLAY_TABLE_COPY_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-10)', 752, 0);
INSERT INTO `action_log` VALUES (160, 'admin', '系统管理员', '2019-11-08 14:36:01', 'PLAY_TABLE_COPY_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-10)', 752, 0);
INSERT INTO `action_log` VALUES (161, 'admin', '系统管理员', '2019-11-08 14:36:03', 'PLAY_TABLE_COPY_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-10)', 752, 0);
INSERT INTO `action_log` VALUES (162, 'admin', '系统管理员', '2019-11-08 14:36:04', 'PLAY_TABLE_COPY_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-10)', 752, 0);
INSERT INTO `action_log` VALUES (163, 'admin', '系统管理员', '2019-11-08 14:36:07', 'PLAY_TABLE_COPY_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-10)', 752, 0);
INSERT INTO `action_log` VALUES (164, 'admin', '系统管理员', '2019-11-08 14:36:09', 'PLAY_TABLE_COPY_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-10)', 752, 0);
INSERT INTO `action_log` VALUES (165, 'admin', '系统管理员', '2019-11-08 14:36:12', 'PLAY_TABLE_COPY_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-10)', 752, 0);
INSERT INTO `action_log` VALUES (166, 'admin', '系统管理员', '2019-11-08 14:36:19', 'PLAY_TABLE_DELETE_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-10)', 752, 0);
INSERT INTO `action_log` VALUES (167, 'admin', '系统管理员', '2019-11-08 14:36:31', 'PLAY_TABLE_DELETE_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-10)', 752, 0);
INSERT INTO `action_log` VALUES (168, 'admin', '系统管理员', '2019-11-08 14:36:43', 'PLAY_TABLE_DELETE_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-10)', 752, 0);
INSERT INTO `action_log` VALUES (169, 'admin', '系统管理员', '2019-11-08 14:37:14', 'PLAY_TABLE_DELETE_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-10)', 752, 0);
INSERT INTO `action_log` VALUES (170, 'admin', '系统管理员', '2019-11-08 14:37:18', 'PLAY_TABLE_DELETE_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-10)', 752, 0);
INSERT INTO `action_log` VALUES (171, 'admin', '系统管理员', '2019-11-08 14:37:27', 'PLAY_TABLE_DELETE_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-10)', 752, 0);
INSERT INTO `action_log` VALUES (172, 'admin', '系统管理员', '2019-11-08 14:37:31', 'PLAY_TABLE_DELETE_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-10)', 752, 0);
INSERT INTO `action_log` VALUES (173, 'admin', '系统管理员', '2019-11-08 14:50:23', 'PLAY_TABLE_DELETE_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-10)', 752, 0);
INSERT INTO `action_log` VALUES (174, 'admin', '系统管理员', '2019-11-08 14:50:33', 'PLAY_TABLE_DELETE_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-10)', 752, 0);
INSERT INTO `action_log` VALUES (175, 'admin', '系统管理员', '2019-11-08 14:50:38', 'PLAY_TABLE_DELETE_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-10)', 752, 0);
INSERT INTO `action_log` VALUES (176, 'admin', '系统管理员', '2019-11-08 14:50:40', 'PLAY_TABLE_DELETE_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-10)', 752, 0);
INSERT INTO `action_log` VALUES (177, 'admin', '系统管理员', '2019-11-08 14:50:44', 'PLAY_TABLE_DELETE_ITEM', 'PLAY_TABLE', '深圳-东门-周期轮播(2019-11-10)', 752, 0);
INSERT INTO `action_log` VALUES (178, 'admin', '系统管理员', '2019-11-18 16:03:04', 'MATERIAL_UPLOAD', 'MATERIAL', '深圳东门 (19).mp4', 930, 0);
INSERT INTO `action_log` VALUES (179, 'admin', '系统管理员', '2019-11-18 17:37:01', 'MATERIAL_DELETE', 'MATERIAL', '深圳东门 (19)', 930, 0);
INSERT INTO `action_log` VALUES (180, 'admin', '系统管理员', '2019-11-18 19:19:35', 'MATERIAL_UPLOAD', 'MATERIAL', '深圳东门 (12).mp4', 931, 0);
INSERT INTO `action_log` VALUES (181, 'admin', '系统管理员', '2019-11-18 19:19:35', 'MATERIAL_UPLOAD', 'MATERIAL', '深圳东门 (13).mp4', 932, 0);
INSERT INTO `action_log` VALUES (182, 'admin', '系统管理员', '2019-11-18 19:19:35', 'MATERIAL_UPLOAD', 'MATERIAL', '深圳东门 (14).mp4', 932, 0);
INSERT INTO `action_log` VALUES (183, 'admin', '系统管理员', '2019-11-18 19:19:52', 'MATERIAL_MODIFY', 'MATERIAL', 'testmodify', 932, 0);
INSERT INTO `action_log` VALUES (184, 'admin', '系统管理员', '2019-11-18 19:20:01', 'MATERIAL_DELETE', 'MATERIAL', '深圳东门 (12)', 931, 0);
INSERT INTO `action_log` VALUES (185, 'admin', '系统管理员', '2019-11-18 19:20:01', 'MATERIAL_DELETE', 'MATERIAL', '深圳东门 (14)', 929, 0);
INSERT INTO `action_log` VALUES (186, 'admin', '系统管理员', '2019-11-19 17:30:40', 'MATERIAL_DELETE', 'MATERIAL', 'testmodify', 932, 0);
INSERT INTO `action_log` VALUES (187, 'admin', '系统管理员', '2019-11-19 17:31:06', 'MATERIAL_DELETE', 'MATERIAL', 'test', 928, 0);
INSERT INTO `action_log` VALUES (188, 'admin', '系统管理员', '2019-11-19 17:31:06', 'MATERIAL_DELETE', 'MATERIAL', 'wukongzhuan_test', 866, 0);
INSERT INTO `action_log` VALUES (189, 'admin', '系统管理员', '2019-11-22 11:28:10', 'MATERIAL_UPLOAD', 'MATERIAL', '深圳东门 (1).mp4', NULL, 0);
INSERT INTO `action_log` VALUES (190, 'admin', '系统管理员', '2019-11-22 11:28:10', 'MATERIAL_UPLOAD', 'MATERIAL', '深圳东门 (2).mp4', NULL, 0);
INSERT INTO `action_log` VALUES (191, 'admin', '系统管理员', '2019-11-22 11:28:10', 'MATERIAL_UPLOAD', 'MATERIAL', '深圳东门 (3).mp4', NULL, 0);
INSERT INTO `action_log` VALUES (192, 'admin', '系统管理员', '2019-11-22 11:28:10', 'MATERIAL_UPLOAD', 'MATERIAL', '深圳东门 (4).mp4', NULL, 0);
INSERT INTO `action_log` VALUES (193, 'admin', '系统管理员', '2019-11-22 11:28:11', 'MATERIAL_UPLOAD', 'MATERIAL', '深圳东门 (5).mp4', NULL, 0);
INSERT INTO `action_log` VALUES (194, 'admin', '系统管理员', '2019-11-22 11:28:11', 'MATERIAL_UPLOAD', 'MATERIAL', '深圳东门 (6).mp4', NULL, 0);
INSERT INTO `action_log` VALUES (195, 'admin', '系统管理员', '2019-11-22 11:28:11', 'MATERIAL_UPLOAD', 'MATERIAL', '深圳东门 (7).mp4', NULL, 0);
INSERT INTO `action_log` VALUES (196, 'admin', '系统管理员', '2019-11-22 11:28:11', 'MATERIAL_UPLOAD', 'MATERIAL', '深圳东门 (8).mp4', NULL, 0);
INSERT INTO `action_log` VALUES (197, 'admin', '系统管理员', '2019-11-22 11:29:06', 'MATERIAL_REVIEW', 'MATERIAL', '深圳东门 (8)', 940, 0);
INSERT INTO `action_log` VALUES (198, 'admin', '系统管理员', '2019-11-22 11:29:13', 'MATERIAL_REVIEW', 'MATERIAL', '深圳东门 (2)', 934, 0);
INSERT INTO `action_log` VALUES (199, 'admin', '系统管理员', '2019-11-22 11:29:18', 'MATERIAL_REVIEW', 'MATERIAL', '深圳东门 (3)', 935, 0);
INSERT INTO `action_log` VALUES (200, 'admin', '系统管理员', '2019-11-22 11:29:21', 'MATERIAL_REVIEW', 'MATERIAL', '深圳东门 (5)', 937, 0);
INSERT INTO `action_log` VALUES (201, 'admin', '系统管理员', '2019-11-22 11:29:25', 'MATERIAL_REVIEW', 'MATERIAL', '深圳东门 (4)', 936, 0);
INSERT INTO `action_log` VALUES (202, 'admin', '系统管理员', '2019-11-22 11:29:28', 'MATERIAL_REVIEW', 'MATERIAL', '深圳东门 (6)', 938, 0);
INSERT INTO `action_log` VALUES (203, 'admin', '系统管理员', '2019-11-22 11:29:31', 'MATERIAL_REVIEW', 'MATERIAL', '深圳东门 (7)', 939, 0);
INSERT INTO `action_log` VALUES (204, 'admin', '系统管理员', '2019-11-22 11:29:34', 'MATERIAL_REVIEW', 'MATERIAL', '深圳东门 (1)', 933, 0);
INSERT INTO `action_log` VALUES (205, 'admin', '系统管理员', '2019-11-25 13:39:22', 'PERIOD_ADD', 'PERIOD', 'test时段', 57, 0);
INSERT INTO `action_log` VALUES (206, 'admin', '系统管理员', '2019-11-25 13:40:23', 'PERIOD_MODIFY', 'PERIOD', 'test', 57, 0);
INSERT INTO `action_log` VALUES (207, 'admin', '系统管理员', '2019-11-25 13:41:24', 'PERIOD_DELETE', 'PERIOD', 'test', 57, 0);
INSERT INTO `action_log` VALUES (208, 'admin', '系统管理员', '2019-11-25 14:39:13', 'ITEM_DELETE', 'ITEM', '深圳东门 (4)', 373, 0);
INSERT INTO `action_log` VALUES (209, 'admin', '系统管理员', '2019-11-25 14:39:13', 'ITEM_DELETE', 'ITEM', '深圳东门 (3)', 372, 0);
INSERT INTO `action_log` VALUES (210, 'admin', '系统管理员', '2019-11-25 14:39:48', 'ITEM_MODIFY', 'ITEM', '深圳东门 (8)', 46, 0);
INSERT INTO `action_log` VALUES (211, 'admin', '系统管理员', '2019-11-25 14:42:54', 'ITEM_ADD', 'ITEM', '深圳东门 (3)', 384, 0);
INSERT INTO `action_log` VALUES (212, 'admin', '系统管理员', '2019-11-25 14:46:09', 'ITEM_ADD', 'ITEM', '深圳东门 (8)', 385, 0);
INSERT INTO `action_log` VALUES (213, 'admin', '系统管理员', '2019-11-26 19:14:46', 'ITEM_ADD', 'ITEM', '深圳东门 (1)', 386, 0);
INSERT INTO `action_log` VALUES (214, 'admin', '系统管理员', '2019-11-26 19:14:58', 'ITEM_ADD', 'ITEM', '深圳东门 (2)', 387, 0);
INSERT INTO `action_log` VALUES (215, 'admin', '系统管理员', '2019-11-26 19:15:06', 'ITEM_ADD', 'ITEM', '深圳东门 (3)', 388, 0);
INSERT INTO `action_log` VALUES (216, 'admin', '系统管理员', '2019-11-26 19:16:05', 'ITEM_ADD', 'ITEM', '深圳东门 (4)', 389, 0);
INSERT INTO `action_log` VALUES (217, 'admin', '系统管理员', '2019-11-26 19:19:32', 'ITEM_ADD', 'ITEM', '深圳东门 (7)', 390, 0);
INSERT INTO `action_log` VALUES (218, 'admin', '系统管理员', '2019-11-26 19:21:13', 'ITEM_ADD', 'ITEM', '深圳东门 (8)', 391, 0);
INSERT INTO `action_log` VALUES (219, 'admin', '系统管理员', '2019-11-26 19:21:28', 'ITEM_ADD', 'ITEM', '深圳东门 (6)', 392, 0);
INSERT INTO `action_log` VALUES (220, 'admin', '系统管理员', '2019-11-29 11:16:10', 'ITEM_ADD', 'ITEM', '深圳东门 (8)', 393, 0);
INSERT INTO `action_log` VALUES (221, 'admin', '系统管理员', '2019-11-29 13:36:53', 'ITEM_ADD', 'ITEM', '深圳东门 (3)', 394, 0);
INSERT INTO `action_log` VALUES (222, 'admin', '系统管理员', '2019-12-06 17:46:04', 'ITEM_ADD', 'ITEM', '深圳东门 (8)', 395, 0);
INSERT INTO `action_log` VALUES (223, 'admin', '系统管理员', '2019-12-06 17:46:10', 'ITEM_ADD', 'ITEM', '深圳东门 (3)', 396, 0);
INSERT INTO `action_log` VALUES (224, 'admin', '系统管理员', '2019-12-06 17:46:26', 'ITEM_ADD', 'ITEM', '深圳东门 (4)', 397, 0);
INSERT INTO `action_log` VALUES (225, 'admin', '系统管理员', '2019-12-06 17:48:41', 'ITEM_ADD', 'ITEM', '深圳东门 (5)', 398, 0);

-- ----------------------------
-- Table structure for error_log
-- ----------------------------
DROP TABLE IF EXISTS `error_log`;
CREATE TABLE `error_log`  (
  `error_log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `terminal_id` bigint(20) DEFAULT NULL,
  `terminal_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `material_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `file_id` bigint(20) DEFAULT NULL,
  `pname` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `pid` bigint(20) DEFAULT NULL,
  `error_reason` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `record_date` datetime(0) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`error_log_id`) USING BTREE,
  INDEX `FK_Reference_17`(`terminal_id`) USING BTREE,
  CONSTRAINT `FK_Reference_17` FOREIGN KEY (`terminal_id`) REFERENCES `terminal` (`terminal_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for file_download
-- ----------------------------
DROP TABLE IF EXISTS `file_download`;
CREATE TABLE `file_download`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `terminal_id` bigint(20) DEFAULT NULL,
  `file_id` bigint(20) DEFAULT NULL,
  `download_time` datetime(0) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Reference_10`(`file_id`) USING BTREE,
  INDEX `FK_Reference_9`(`terminal_id`) USING BTREE,
  CONSTRAINT `FK_Reference_10` FOREIGN KEY (`file_id`) REFERENCES `files` (`file_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`terminal_id`) REFERENCES `terminal` (`terminal_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for files
-- ----------------------------
DROP TABLE IF EXISTS `files`;
CREATE TABLE `files`  (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `file_path` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `file_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '\'vedio\',\'picture\',\'other\'',
  `upload_time` datetime(0) DEFAULT NULL,
  `duration` bigint(20) DEFAULT NULL,
  `frequency` int(11) DEFAULT NULL,
  `terminal_id` bigint(20) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `material_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `start_time` date DEFAULT NULL,
  `end_time` date DEFAULT NULL,
  `period_id` bigint(20) DEFAULT NULL,
  `md5` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `first_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `second_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `firstcheck_time` date DEFAULT NULL,
  `secondcheck_time` date DEFAULT NULL,
  `status_id` int(20) DEFAULT NULL,
  `upload_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `delete_time` date DEFAULT NULL,
  `delete_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`file_id`) USING BTREE,
  INDEX `terminal_id`(`terminal_id`) USING BTREE,
  INDEX `status_id`(`status_id`) USING BTREE,
  INDEX `period_id`(`period_id`) USING BTREE,
  CONSTRAINT `files_ibfk_1` FOREIGN KEY (`terminal_id`) REFERENCES `terminal` (`terminal_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `files_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `files_ibfk_3` FOREIGN KEY (`period_id`) REFERENCES `period` (`period_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for heartbeat_log
-- ----------------------------
DROP TABLE IF EXISTS `heartbeat_log`;
CREATE TABLE `heartbeat_log`  (
  `heartbeat_log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `terminal_id` bigint(20) DEFAULT NULL,
  `terminal_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `record_time` datetime(0) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`heartbeat_log_id`) USING BTREE,
  INDEX `FK_Reference_16`(`terminal_id`) USING BTREE,
  CONSTRAINT `FK_Reference_16` FOREIGN KEY (`terminal_id`) REFERENCES `terminal` (`terminal_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of heartbeat_log
-- ----------------------------
INSERT INTO `heartbeat_log` VALUES (1, 28, '深圳-东门', '2019-10-19 14:20:09', 0);
INSERT INTO `heartbeat_log` VALUES (2, 28, '深圳-东门', '2019-10-19 14:21:09', 0);
INSERT INTO `heartbeat_log` VALUES (3, 28, '深圳-东门', '2019-10-19 14:22:10', 0);
INSERT INTO `heartbeat_log` VALUES (4, 28, '深圳-东门', '2019-10-19 14:23:13', 0);
INSERT INTO `heartbeat_log` VALUES (5, 28, '深圳-东门', '2019-10-19 14:24:31', 0);
INSERT INTO `heartbeat_log` VALUES (6, 28, '深圳-东门', '2019-10-19 14:25:31', 0);
INSERT INTO `heartbeat_log` VALUES (7, 28, '深圳-东门', '2019-10-19 14:27:03', 0);
INSERT INTO `heartbeat_log` VALUES (8, 28, '深圳-东门', '2019-10-19 14:28:03', 0);
INSERT INTO `heartbeat_log` VALUES (9, 28, '深圳-东门', '2019-10-19 14:30:05', 0);
INSERT INTO `heartbeat_log` VALUES (10, 28, '深圳-东门', '2019-10-19 14:31:05', 0);
INSERT INTO `heartbeat_log` VALUES (11, 28, '深圳-东门', '2019-10-19 14:32:05', 0);
INSERT INTO `heartbeat_log` VALUES (12, 28, '深圳-东门', '2019-10-19 14:33:09', 0);
INSERT INTO `heartbeat_log` VALUES (13, 28, '深圳-东门', '2019-10-19 14:34:09', 0);
INSERT INTO `heartbeat_log` VALUES (14, 28, '深圳-东门', '2019-10-19 14:35:09', 0);
INSERT INTO `heartbeat_log` VALUES (15, 28, '深圳-东门', '2019-10-19 14:36:09', 0);
INSERT INTO `heartbeat_log` VALUES (16, 28, '深圳-东门', '2019-10-19 14:37:11', 0);
INSERT INTO `heartbeat_log` VALUES (17, 28, '深圳-东门', '2019-10-19 14:38:11', 0);
INSERT INTO `heartbeat_log` VALUES (18, 28, '深圳-东门', '2019-10-19 14:39:12', 0);
INSERT INTO `heartbeat_log` VALUES (19, 28, '深圳-东门', '2019-10-19 14:40:12', 0);
INSERT INTO `heartbeat_log` VALUES (20, 28, '深圳-东门', '2019-10-19 14:42:00', 0);
INSERT INTO `heartbeat_log` VALUES (21, 28, '深圳-东门', '2019-10-19 14:43:00', 0);
INSERT INTO `heartbeat_log` VALUES (22, 28, '深圳-东门', '2019-10-19 14:44:00', 0);
INSERT INTO `heartbeat_log` VALUES (23, 28, '深圳-东门', '2019-10-19 14:45:01', 0);
INSERT INTO `heartbeat_log` VALUES (24, 28, '深圳-东门', '2019-10-19 14:46:01', 0);
INSERT INTO `heartbeat_log` VALUES (25, 28, '深圳-东门', '2019-10-19 14:47:01', 0);
INSERT INTO `heartbeat_log` VALUES (26, 28, '深圳-东门', '2019-11-26 19:00:48', 0);
INSERT INTO `heartbeat_log` VALUES (27, 28, '深圳-东门', '2019-11-26 19:01:48', 0);
INSERT INTO `heartbeat_log` VALUES (28, 28, '深圳-东门', '2019-11-26 19:02:48', 0);
INSERT INTO `heartbeat_log` VALUES (29, 28, '深圳-东门', '2019-11-26 19:03:48', 0);
INSERT INTO `heartbeat_log` VALUES (30, 28, '深圳-东门', '2019-11-26 19:04:48', 0);
INSERT INTO `heartbeat_log` VALUES (31, 28, '深圳-东门', '2019-11-26 19:05:48', 0);
INSERT INTO `heartbeat_log` VALUES (32, 28, '深圳-东门', '2019-11-26 19:06:48', 0);
INSERT INTO `heartbeat_log` VALUES (33, 28, '深圳-东门', '2019-11-26 19:07:48', 0);
INSERT INTO `heartbeat_log` VALUES (34, 28, '深圳-东门', '2019-11-26 19:08:49', 0);
INSERT INTO `heartbeat_log` VALUES (35, 28, '深圳-东门', '2019-11-26 19:09:49', 0);
INSERT INTO `heartbeat_log` VALUES (36, 28, '深圳-东门', '2019-11-26 19:10:49', 0);

-- ----------------------------
-- Table structure for interlude
-- ----------------------------
DROP TABLE IF EXISTS `interlude`;
CREATE TABLE `interlude`  (
  `tid` bigint(50) NOT NULL AUTO_INCREMENT,
  `mid` bigint(50) DEFAULT NULL,
  `material_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `insert_date` date DEFAULT NULL,
  `start_time` time(0) DEFAULT NULL,
  `end_time` time(0) DEFAULT NULL,
  `min` int(20) DEFAULT NULL,
  `status` int(20) DEFAULT NULL,
  `terminal_id` bigint(50) DEFAULT NULL,
  `create_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `deleted` int(20) DEFAULT NULL,
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for items
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items`  (
  `item_id` bigint(50) NOT NULL AUTO_INCREMENT,
  `mid` bigint(50) DEFAULT NULL,
  `item_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `material_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `period_id` bigint(50) DEFAULT NULL,
  `terminal_id` bigint(50) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `duration` bigint(50) DEFAULT NULL,
  `frequency` bigint(50) DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `create_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted` int(20) DEFAULT NULL,
  PRIMARY KEY (`item_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 399 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of items
-- ----------------------------
INSERT INTO `items` VALUES (311, 858, '9e2012ff53198e87db9056b7e01110f2', '9e2012ff53198e87db9056b7e01110f2', 46, 28, '2019-10-23', '2019-10-24', 15, 120, '2019-10-23 21:06:52', 'admin', 0);
INSERT INTO `items` VALUES (312, 860, '40c5147a0c0f712dac9a4cb70975e2ca', '40c5147a0c0f712dac9a4cb70975e2ca', 46, 28, '2019-10-23', '2019-10-24', 15, 60, '2019-10-23 21:07:16', 'admin', 1);
INSERT INTO `items` VALUES (313, 850, '2aa76a99123f8b16b3d81004829f8ab9', '2aa76a99123f8b16b3d81004829f8ab9', 46, 28, '2019-10-23', '2019-10-24', 15, 60, '2019-10-23 21:07:34', 'admin', 1);
INSERT INTO `items` VALUES (314, 854, '5d9d03f4f30a65b60cd323fb49828147', '5d9d03f4f30a65b60cd323fb49828147', 46, 28, '2019-10-23', '2019-10-31', 15, 60, '2019-10-23 23:01:13', 'admin', 1);
INSERT INTO `items` VALUES (315, 861, 'luoxiaohei', 'luoxiaohei', 46, 28, '2019-10-24', '2019-10-29', 1, 60, '2019-10-24 19:41:57', 'admin', 1);
INSERT INTO `items` VALUES (316, 867, '深圳东门 (9)', '深圳东门 (9)', 46, 28, '2019-11-05', '2019-12-22', 15, 120, '2019-11-03 22:02:55', 'admin', 1);
INSERT INTO `items` VALUES (317, 862, '深圳东门 (25)', '深圳东门 (25)', 46, 28, '2019-06-09', '2019-08-11', 15, 60, '2019-11-03 22:07:40', 'admin', 1);
INSERT INTO `items` VALUES (318, 862, '深圳东门 (25)', '深圳东门 (25)', 46, 28, '2019-11-03', '2019-12-03', 15, 60, '2019-11-03 22:14:11', 'admin', 1);
INSERT INTO `items` VALUES (319, 867, '深圳东门 (9)', '深圳东门 (9)', 46, 28, '2019-11-03', '2019-12-03', 15, 60, '2019-11-03 22:17:58', 'admin', 1);
INSERT INTO `items` VALUES (320, 866, 'wukongzhuan_test', 'wukongzhuan_test', 46, 28, '2019-11-04', '2019-11-04', 15, 60, '2019-11-04 14:37:17', 'admin', 1);
INSERT INTO `items` VALUES (321, 866, 'wukongzhuan_test', 'wukongzhuan_test', 46, 28, '2019-11-04', '2019-11-13', 15, 60, '2019-11-04 14:37:51', 'admin', 1);
INSERT INTO `items` VALUES (322, 866, 'wukongzhuan_test', 'wukongzhuan_test', 46, 28, '2019-11-06', '2019-12-16', 15, 120, '2019-11-04 15:06:30', 'admin', 1);
INSERT INTO `items` VALUES (323, 862, '深圳东门 (25)', '深圳东门 (25)', 46, 28, '2019-11-04', '2019-11-04', 15, 60, '2019-11-04 15:06:42', 'admin', 1);
INSERT INTO `items` VALUES (324, 866, 'wukongzhuan_test (对应素材已删除)', 'wukongzhuan_test', 46, 28, '2019-11-04', '2019-12-25', 15, 60, '2019-11-04 16:32:55', 'admin', 0);
INSERT INTO `items` VALUES (325, 858, '9e2012ff53198e87db9056b7e01110f2', '9e2012ff53198e87db9056b7e01110f2', 46, 28, '2019-11-04', '2019-11-13', 15, 60, '2019-11-04 16:33:54', 'admin', 0);
INSERT INTO `items` VALUES (326, 852, '3f334078d8798e9ed1c7486c2387e118', '3f334078d8798e9ed1c7486c2387e118', 46, 28, '2019-11-04', '2019-11-04', 15, 60, '2019-11-04 16:34:11', 'admin', 0);
INSERT INTO `items` VALUES (327, 862, '深圳东门 (25)', '深圳东门 (25)', 46, 28, '2019-11-04', '2019-11-04', 15, 60, '2019-11-04 16:58:16', 'admin', 0);
INSERT INTO `items` VALUES (328, 862, '深圳东门 (25)', '深圳东门 (25)', 46, 28, '2020-01-04', '2020-01-14', 15, 60, '2019-11-04 23:00:36', 'admin', 0);
INSERT INTO `items` VALUES (329, 862, '深圳东门 (25)', '深圳东门 (25)', 46, 28, '2019-11-12', '2019-11-14', 15, 60, '2019-11-04 23:01:29', 'admin', 0);
INSERT INTO `items` VALUES (330, 862, '深圳东门 (25)', '深圳东门 (25)', 46, 28, '2019-11-05', '2019-11-19', 15, 60, '2019-11-04 23:01:42', 'admin', 0);
INSERT INTO `items` VALUES (331, 862, '深圳东门 (25)', '深圳东门 (25)', 46, 28, '2019-11-30', '2019-11-30', 15, 60, '2019-11-04 23:02:14', 'admin', 0);
INSERT INTO `items` VALUES (332, 851, '2e5e0121afcb87357f9fa0036af7eb63', '2e5e0121afcb87357f9fa0036af7eb63', 46, 28, '2019-11-08', '2019-11-17', 30, 60, '2019-11-08 14:25:10', 'admin', 0);
INSERT INTO `items` VALUES (333, 853, '5a624086ab35dc4af26c299e0262fd9b', '5a624086ab35dc4af26c299e0262fd9b', 46, 28, '2019-11-08', '2019-11-17', 15, 60, '2019-11-08 14:25:27', 'admin', 0);
INSERT INTO `items` VALUES (334, 859, '46bae1dc06897d1523625e864b0530d3', '46bae1dc06897d1523625e864b0530d3', 46, 28, '2019-11-22', '2019-11-22', 15, 60, '2019-11-22 11:23:18', 'admin', 1);
INSERT INTO `items` VALUES (335, 933, '深圳东门 (1)', '深圳东门 (1)', 46, 28, '2019-11-22', '2019-11-22', 30, 60, '2019-11-22 11:30:13', 'admin', 1);
INSERT INTO `items` VALUES (336, 934, '深圳东门 (2)', '深圳东门 (2)', 46, 28, '2019-11-22', '2019-11-22', 14, 60, '2019-11-22 11:30:30', 'admin', 1);
INSERT INTO `items` VALUES (337, 935, '深圳东门 (3)', '深圳东门 (3)', 46, 28, '2019-11-22', '2019-11-22', 15, 120, '2019-11-22 11:30:44', 'admin', 1);
INSERT INTO `items` VALUES (338, 936, '深圳东门 (4)', '深圳东门 (4)', 46, 28, '2019-11-22', '2019-11-22', 15, 480, '2019-11-22 11:31:05', 'admin', 1);
INSERT INTO `items` VALUES (339, 937, '深圳东门 (5)', '深圳东门 (5)', 46, 28, '2019-11-22', '2019-11-22', 15, 60, '2019-11-22 11:42:20', 'admin', 1);
INSERT INTO `items` VALUES (340, 940, '深圳东门 (8)', '深圳东门 (8)', 46, 28, '2019-11-22', '2019-11-22', 15, 60, '2019-11-22 13:15:07', 'admin', 1);
INSERT INTO `items` VALUES (341, 939, '深圳东门 (7)', '深圳东门 (7)', 46, 28, '2019-11-22', '2019-11-22', 15, 60, '2019-11-22 13:21:43', 'admin', 1);
INSERT INTO `items` VALUES (342, 862, '深圳东门 (25)', '深圳东门 (25)', 46, 28, '2019-11-22', '2019-11-22', 15, 60, '2019-11-22 13:52:26', 'admin', 1);
INSERT INTO `items` VALUES (343, 937, '深圳东门 (5)', '深圳东门 (5)', 46, 28, '2019-11-22', '2019-11-22', 15, 60, '2019-11-22 15:08:51', 'admin', 1);
INSERT INTO `items` VALUES (344, 937, '深圳东门 (5)', '深圳东门 (5)', 46, 28, '2019-11-22', '2019-11-22', 15, 60, '2019-11-22 15:11:20', 'admin', 1);
INSERT INTO `items` VALUES (345, 938, '深圳东门 (6)', '深圳东门 (6)', 46, 28, '2019-11-22', '2019-11-22', 30, 60, '2019-11-22 15:13:53', 'admin', 1);
INSERT INTO `items` VALUES (346, 938, '深圳东门 (6)', '深圳东门 (6)', 46, 28, '2019-11-22', '2019-11-22', 30, 60, '2019-11-22 15:15:30', 'admin', 1);
INSERT INTO `items` VALUES (347, 937, '深圳东门 (5)', '深圳东门 (5)', 46, 28, '2019-11-22', '2019-11-22', 15, 60, '2019-11-22 15:16:03', 'admin', 1);
INSERT INTO `items` VALUES (348, 937, '深圳东门 (5)', '深圳东门 (5)', 46, 28, '2019-11-22', '2019-11-22', 15, 60, '2019-11-22 15:17:47', 'admin', 1);
INSERT INTO `items` VALUES (349, 938, '深圳东门 (6)', '深圳东门 (6)', 46, 28, '2019-11-22', '2019-11-22', 30, 60, '2019-11-22 15:27:26', 'admin', 1);
INSERT INTO `items` VALUES (350, 938, '深圳东门 (6)', '深圳东门 (6)', 46, 28, '2019-11-22', '2019-11-22', 30, 60, '2019-11-22 15:28:23', 'admin', 1);
INSERT INTO `items` VALUES (351, 938, '深圳东门 (6)', '深圳东门 (6)', 46, 28, '2019-11-22', '2019-11-22', 30, 60, '2019-11-22 15:30:18', 'admin', 1);
INSERT INTO `items` VALUES (352, 938, '深圳东门 (6)', '深圳东门 (6)', 46, 28, '2019-11-22', '2019-11-22', 30, 60, '2019-11-22 15:30:50', 'admin', 1);
INSERT INTO `items` VALUES (353, 935, '深圳东门 (3)', '深圳东门 (3)', 46, 28, '2019-11-22', '2019-11-22', 15, 60, '2019-11-22 15:35:25', 'admin', 1);
INSERT INTO `items` VALUES (354, 937, '深圳东门 (5)', '深圳东门 (5)', 46, 28, '2019-11-22', '2019-11-22', 15, 120, '2019-11-22 15:35:50', 'admin', 1);
INSERT INTO `items` VALUES (355, 933, '深圳东门 (1)', '深圳东门 (1)', 46, 28, '2019-11-22', '2019-11-22', 30, 120, '2019-11-22 15:49:24', 'admin', 1);
INSERT INTO `items` VALUES (356, 940, '深圳东门 (8)', '深圳东门 (8)', 46, 28, '2019-11-22', '2019-11-22', 15, 120, '2019-11-22 15:58:51', 'admin', 1);
INSERT INTO `items` VALUES (357, 936, '深圳东门 (4)', '深圳东门 (4)', 46, 28, '2019-11-22', '2019-11-22', 15, 120, '2019-11-22 16:14:18', 'admin', 1);
INSERT INTO `items` VALUES (358, 936, '深圳东门 (4)', '深圳东门 (4)', 46, 28, '2019-11-22', '2019-11-22', 15, 60, '2019-11-22 16:16:42', 'admin', 1);
INSERT INTO `items` VALUES (359, 936, '深圳东门 (4)', '深圳东门 (4)', 46, 28, '2019-11-22', '2019-11-22', 15, 60, '2019-11-22 16:17:47', 'admin', 0);
INSERT INTO `items` VALUES (360, 940, '深圳东门 (8)', '深圳东门 (8)', 46, 28, '2019-11-22', '2019-11-22', 15, 120, '2019-11-22 16:17:59', 'admin', 1);
INSERT INTO `items` VALUES (361, 940, '深圳东门 (8)', '深圳东门 (8)', 46, 28, '2019-11-22', '2019-11-22', 15, 60, '2019-11-22 16:19:12', 'admin', 1);
INSERT INTO `items` VALUES (362, 940, '深圳东门 (8)', '深圳东门 (8)', 46, 28, '2019-11-22', '2019-11-22', 15, 60, '2019-11-22 16:21:15', 'admin', 1);
INSERT INTO `items` VALUES (363, 935, '深圳东门 (3)', '深圳东门 (3)', 46, 28, '2019-11-22', '2019-11-22', 15, 60, '2019-11-22 16:21:35', 'admin', 1);
INSERT INTO `items` VALUES (364, 935, '深圳东门 (3)', '深圳东门 (3)', 46, 28, '2019-11-22', '2019-11-22', 15, 60, '2019-11-22 16:22:20', 'admin', 1);
INSERT INTO `items` VALUES (365, 940, '深圳东门 (8)', '深圳东门 (8)', 46, 28, '2019-11-22', '2019-11-22', 15, 60, '2019-11-22 16:24:31', 'admin', 1);
INSERT INTO `items` VALUES (366, 940, '深圳东门 (8)', '深圳东门 (8)', 46, 28, '2019-11-22', '2019-11-22', 15, 120, '2019-11-22 16:25:04', 'admin', 1);
INSERT INTO `items` VALUES (367, 935, '深圳东门 (3)', '深圳东门 (3)', 46, 28, '2019-11-22', '2019-11-22', 15, 60, '2019-11-22 16:25:30', 'admin', 0);
INSERT INTO `items` VALUES (368, 940, '深圳东门 (8)', '深圳东门 (8)', 46, 28, '2019-11-22', '2019-11-22', 15, 120, '2019-11-22 16:26:28', 'admin', 1);
INSERT INTO `items` VALUES (369, 940, '深圳东门 (8)', '深圳东门 (8)', 46, 28, '2019-11-22', '2019-11-22', 15, 60, '2019-11-22 16:27:05', 'admin', 1);
INSERT INTO `items` VALUES (370, 940, '深圳东门 (8)', '深圳东门 (8)', 46, 28, '2019-11-22', '2019-11-22', 15, 60, '2019-11-22 16:27:39', 'admin', 1);
INSERT INTO `items` VALUES (371, 940, '深圳东门 (8)', '深圳东门 (8)', 46, 28, '2019-11-22', '2019-11-22', 15, 120, '2019-11-22 16:38:18', 'admin', 0);
INSERT INTO `items` VALUES (372, 935, '深圳东门 (3)', '深圳东门 (3)', 46, 28, '2019-11-24', '2019-11-24', 15, 60, '2019-11-24 12:13:32', 'admin', 1);
INSERT INTO `items` VALUES (373, 936, '深圳东门 (4)', '深圳东门 (4)', 46, 28, '2019-11-24', '2019-11-24', 15, 60, '2019-11-24 12:21:43', 'admin', 1);
INSERT INTO `items` VALUES (374, 933, '深圳东门 (1)', '深圳东门 (1)', 46, 28, '2019-11-24', '2019-11-24', 30, 60, '2019-11-24 12:23:00', 'admin', 1);
INSERT INTO `items` VALUES (375, 934, '深圳东门 (2)', '深圳东门 (2)', 46, 28, '2019-11-24', '2019-11-24', 14, 60, '2019-11-24 12:23:13', 'admin', 1);
INSERT INTO `items` VALUES (376, 933, '深圳东门 (1)', '深圳东门 (1)', 46, 28, '2019-11-22', '2019-11-22', 30, 60, '2019-11-24 12:23:40', 'admin', 1);
INSERT INTO `items` VALUES (377, 937, '深圳东门 (5)', '深圳东门 (5)', 46, 28, '2019-11-22', '2019-11-22', 15, 60, '2019-11-24 12:31:35', 'admin', 1);
INSERT INTO `items` VALUES (378, 938, '深圳东门 (6)', '深圳东门 (6)', 46, 28, '2019-11-22', '2019-11-22', 30, 60, '2019-11-24 12:31:52', 'admin', 1);
INSERT INTO `items` VALUES (379, 939, '深圳东门 (7)', '深圳东门 (7)', 46, 28, '2019-11-24', '2019-11-24', 15, 60, '2019-11-24 12:37:02', 'admin', 1);
INSERT INTO `items` VALUES (380, 939, '深圳东门 (7)', '深圳东门 (7)', 46, 28, '2019-11-22', '2019-11-22', 15, 60, '2019-11-24 12:37:13', 'admin', 1);
INSERT INTO `items` VALUES (381, 862, '深圳东门 (25)', '深圳东门 (25)', 46, 28, '2019-11-22', '2019-11-22', 15, 60, '2019-11-24 12:57:59', 'admin', 1);
INSERT INTO `items` VALUES (382, 940, '深圳东门 (8)', '深圳东门 (8)', 46, 28, '2019-11-25', '2019-11-25', 15, 60, '2019-11-25 14:09:52', 'admin', 1);
INSERT INTO `items` VALUES (383, 933, '深圳东门 (1)', '深圳东门 (1)', 46, 28, '2019-11-25', '2019-11-25', 30, 60, '2019-11-25 14:11:31', 'admin', 1);
INSERT INTO `items` VALUES (384, 935, '深圳东门 (3)', '深圳东门 (3)', 46, 28, '2019-11-25', '2019-11-25', 15, 60, '2019-11-25 14:42:54', 'admin', 0);
INSERT INTO `items` VALUES (385, 940, '深圳东门 (8)', '深圳东门 (8)', 46, 28, '2019-11-25', '2019-11-25', 15, 60, '2019-11-25 14:46:10', 'admin', 0);
INSERT INTO `items` VALUES (386, 933, '深圳东门 (1)', '深圳东门 (1)', 46, 28, '2019-11-26', '2019-11-26', 30, 60, '2019-11-26 19:14:46', 'admin', 0);
INSERT INTO `items` VALUES (387, 934, '深圳东门 (2)', '深圳东门 (2)', 46, 28, '2019-11-26', '2019-11-26', 14, 60, '2019-11-26 19:14:58', 'admin', 0);
INSERT INTO `items` VALUES (388, 935, '深圳东门 (3)', '深圳东门 (3)', 46, 28, '2019-11-26', '2019-11-26', 15, 60, '2019-11-26 19:15:07', 'admin', 0);
INSERT INTO `items` VALUES (389, 936, '深圳东门 (4)', '深圳东门 (4)', 46, 28, '2019-11-26', '2019-11-26', 15, 60, '2019-11-26 19:16:05', 'admin', 0);
INSERT INTO `items` VALUES (390, 939, '深圳东门 (7)', '深圳东门 (7)', 46, 28, '2019-11-26', '2019-11-26', 15, 60, '2019-11-26 19:19:32', 'admin', 0);
INSERT INTO `items` VALUES (391, 940, '深圳东门 (8)', '深圳东门 (8)', 46, 28, '2019-11-26', '2019-11-26', 15, 120, '2019-11-26 19:21:13', 'admin', 0);
INSERT INTO `items` VALUES (392, 938, '深圳东门 (6)', '深圳东门 (6)', 46, 28, '2019-11-26', '2019-11-26', 30, 480, '2019-11-26 19:21:28', 'admin', 0);
INSERT INTO `items` VALUES (393, 940, '深圳东门 (8)', '深圳东门 (8)', 46, 28, '2019-11-29', '2019-11-29', 15, 60, '2019-11-29 11:16:10', 'admin', 0);
INSERT INTO `items` VALUES (394, 935, '深圳东门 (3)', '深圳东门 (3)', 46, 28, '2019-11-29', '2019-11-29', 15, 60, '2019-11-29 13:36:53', 'admin', 0);
INSERT INTO `items` VALUES (395, 940, '深圳东门 (8)', '深圳东门 (8)', 46, 28, '2019-12-06', '2019-12-06', 15, 60, '2019-12-06 17:46:04', 'admin', 0);
INSERT INTO `items` VALUES (396, 935, '深圳东门 (3)', '深圳东门 (3)', 46, 28, '2019-12-06', '2019-12-06', 15, 60, '2019-12-06 17:46:11', 'admin', 0);
INSERT INTO `items` VALUES (397, 936, '深圳东门 (4)', '深圳东门 (4)', 46, 28, '2019-12-06', '2019-12-06', 15, 60, '2019-12-06 17:46:27', 'admin', 0);
INSERT INTO `items` VALUES (398, 937, '深圳东门 (5)', '深圳东门 (5)', 46, 28, '2019-12-06', '2019-12-06', 15, 60, '2019-12-06 17:48:42', 'admin', 0);

-- ----------------------------
-- Table structure for marquee
-- ----------------------------
DROP TABLE IF EXISTS `marquee`;
CREATE TABLE `marquee`  (
  `mid` bigint(50) NOT NULL AUTO_INCREMENT,
  `marq_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `file_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `file_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `resolution` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `terminal_id` bigint(50) DEFAULT NULL,
  `md5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `period_id` bigint(50) DEFAULT NULL,
  `status_id` bigint(50) DEFAULT NULL,
  `play_date` date DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `deleted` int(10) DEFAULT NULL,
  `firstcheck_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `secondcheck_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `material_id` bigint(50) DEFAULT NULL,
  `position_x` bigint(50) DEFAULT NULL,
  `position_y` bigint(50) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `opacity` int(10) DEFAULT 255,
  PRIMARY KEY (`mid`) USING BTREE,
  INDEX `marquee_fk01`(`terminal_id`) USING BTREE,
  CONSTRAINT `marquee_fk01` FOREIGN KEY (`terminal_id`) REFERENCES `terminal` (`terminal_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of marquee
-- ----------------------------
INSERT INTO `marquee` VALUES (18, 'luoxiaohei', 'luoxiaohei.jpg', '/Users/hymanzhou/dataCenter/itmsServer/1571842382899.jpg', 'picture', '0kb', '1X1', 28, 'ae7da3e92bb798cdb9d0904fdf0788ff', 'admin', 46, 1, NULL, '2019-10-25 18:42:11', 0, NULL, NULL, 861, 0, 0, '2019-10-25', '2019-10-27', 255);

-- ----------------------------
-- Table structure for material
-- ----------------------------
DROP TABLE IF EXISTS `material`;
CREATE TABLE `material`  (
  `mid` bigint(50) NOT NULL AUTO_INCREMENT,
  `material_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `file_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `file_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `resolution` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `terminal_id` bigint(50) DEFAULT NULL,
  `duration` bigint(50) DEFAULT NULL,
  `md5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `check_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `check_time` datetime(0) DEFAULT NULL,
  `status_id` int(20) DEFAULT NULL,
  `upload_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `upload_time` datetime(0) DEFAULT NULL,
  `info` int(20) DEFAULT NULL,
  `used_num` bigint(50) DEFAULT NULL,
  `tis` int(20) DEFAULT NULL,
  `deleted` int(20) DEFAULT NULL,
  PRIMARY KEY (`mid`) USING BTREE,
  INDEX `terminal_id`(`terminal_id`) USING BTREE,
  CONSTRAINT `material_ibfk_1` FOREIGN KEY (`terminal_id`) REFERENCES `terminal` (`terminal_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 941 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of material
-- ----------------------------
INSERT INTO `material` VALUES (848, '0a100afea41e4e4db783c66bd86ee5d3', '0a100afea41e4e4db783c66bd86ee5d3.mp4', '/Users/hymanzhou/dataCenter/itmsServer/1571835674094.mp4', 'vedio', '2.17MB', '1920X576', 28, 14, '1100e57eed4253325a93051071522ebf', 'admin', '2019-10-23 21:05:38', 3, 'admin', '2019-10-23 21:01:14', 0, 0, 1, 0);
INSERT INTO `material` VALUES (849, '0dd19d8a5cacfd4d41363ced65aa6f39', '0dd19d8a5cacfd4d41363ced65aa6f39.mp4', '/Users/hymanzhou/dataCenter/itmsServer/1571835675377.mp4', 'vedio', '4.12MB', '1920X576', 28, 20, '2355d38b37e77af99e2b4d71cce90829', 'admin', '2019-10-23 21:05:34', 3, 'admin', '2019-10-23 21:01:15', 0, 0, 1, 0);
INSERT INTO `material` VALUES (850, '2aa76a99123f8b16b3d81004829f8ab9', '2aa76a99123f8b16b3d81004829f8ab9.mp4', '/Users/hymanzhou/dataCenter/itmsServer/1571835675510.mp4', 'vedio', '3.21MB', '1920X576', 28, 15, 'f820ca5096aeb3aa41a0c8b50fbdeffb', 'admin', '2019-10-23 21:05:30', 3, 'admin', '2019-10-23 21:01:16', 1, 1, 1, 0);
INSERT INTO `material` VALUES (851, '2e5e0121afcb87357f9fa0036af7eb63', '2e5e0121afcb87357f9fa0036af7eb63.mp4', '/Users/hymanzhou/dataCenter/itmsServer/1571835675665.mp4', 'vedio', '6.77MB', '1920X576', 28, 30, 'd9654a3d283569c4470e65694479b986', 'admin', '2019-10-23 21:05:28', 3, 'admin', '2019-10-23 21:01:16', 1, 1, 1, 0);
INSERT INTO `material` VALUES (852, '3f334078d8798e9ed1c7486c2387e118', '3f334078d8798e9ed1c7486c2387e118.mp4', '/Users/hymanzhou/dataCenter/itmsServer/1571835675792.mp4', 'vedio', '1.65MB', '1920X576', 28, 15, '165cc14a8d8354ed3a81feb84f6a6f2a', 'admin', '2019-10-23 21:05:24', 3, 'admin', '2019-10-23 21:01:16', 1, 1, 1, 0);
INSERT INTO `material` VALUES (853, '5a624086ab35dc4af26c299e0262fd9b', '5a624086ab35dc4af26c299e0262fd9b.mp4', '/Users/hymanzhou/dataCenter/itmsServer/1571835675986.mp4', 'vedio', '2.87MB', '1920X576', 28, 15, '83732ef284e1b2e5197202720c706daf', 'admin', '2019-10-23 21:05:20', 3, 'admin', '2019-10-23 21:01:16', 1, 1, 1, 0);
INSERT INTO `material` VALUES (854, '5d9d03f4f30a65b60cd323fb49828147', '5d9d03f4f30a65b60cd323fb49828147.mp4', '/Users/hymanzhou/dataCenter/itmsServer/1571835676094.mp4', 'vedio', '0.95MB', '1920X576', 28, 15, 'dcebcc0fcdd81c7555f940b42b53be5b', 'admin', '2019-10-23 21:05:16', 3, 'admin', '2019-10-23 21:01:16', 1, 1, 1, 0);
INSERT INTO `material` VALUES (855, '09bb6b7f143c7d485c561ba006c8afd9', '09bb6b7f143c7d485c561ba006c8afd9.mp4', '/Users/hymanzhou/dataCenter/itmsServer/1571835676207.mp4', 'vedio', '2.98MB', '1920X576', 28, 15, '36d8cb23469e0fbee4cc6099006278ee', 'admin', '2019-10-23 21:05:09', 3, 'admin', '2019-10-23 21:01:16', 0, 0, 1, 0);
INSERT INTO `material` VALUES (856, '17d314b35efdc15f7f78fab7901814b5', '17d314b35efdc15f7f78fab7901814b5.mp4', '/Users/hymanzhou/dataCenter/itmsServer/1571835676295.mp4', 'vedio', '1.34MB', '1920X576', 28, 15, '2db2b54d6ea73f802a5b89b5378cccee', 'admin', '2019-10-23 21:05:13', 3, 'admin', '2019-10-23 21:01:16', 0, 0, 1, 0);
INSERT INTO `material` VALUES (857, '19cd6819b28b17f93d50ee7459ddffef', '19cd6819b28b17f93d50ee7459ddffef.mp4', '/Users/hymanzhou/dataCenter/itmsServer/1571835676419.mp4', 'vedio', '1.45MB', '1920X576', 28, 15, '6578e1b11d5624e7b4a511715905464f', 'admin', '2019-10-23 21:05:04', 3, 'admin', '2019-10-23 21:01:16', 0, 0, 1, 0);
INSERT INTO `material` VALUES (858, '9e2012ff53198e87db9056b7e01110f2', '9e2012ff53198e87db9056b7e01110f2.mp4', '/Users/hymanzhou/dataCenter/itmsServer/1571835676536.mp4', 'vedio', '1.54MB', '1920X576', 28, 15, '4dacdf71445e08a61e44d47972925f3f', 'admin', '2019-10-23 21:02:19', 3, 'admin', '2019-10-23 21:01:17', 1, 2, 1, 0);
INSERT INTO `material` VALUES (859, '46bae1dc06897d1523625e864b0530d3', '46bae1dc06897d1523625e864b0530d3.mp4', '/Users/hymanzhou/dataCenter/itmsServer/1571835676653.mp4', 'vedio', '2.43MB', '1920X576', 28, 15, 'ca0832be0ea5cfa7306405bb97d78c0b', 'admin', '2019-10-23 21:05:41', 3, 'admin', '2019-10-23 21:01:17', 1, 1, 1, 0);
INSERT INTO `material` VALUES (860, '40c5147a0c0f712dac9a4cb70975e2ca', '40c5147a0c0f712dac9a4cb70975e2ca.mp4', '/Users/hymanzhou/dataCenter/itmsServer/1571835676773.mp4', 'vedio', '2.06MB', '1920X576', 28, 15, 'ff2e670d74f869095a96fa58333288aa', 'admin', '2019-10-23 21:05:45', 3, 'admin', '2019-10-23 21:01:17', 1, 1, 1, 0);
INSERT INTO `material` VALUES (861, 'luoxiaohei', 'luoxiaohei.jpg', '/Users/hymanzhou/dataCenter/itmsServer/1571842382899.jpg', 'picture', '0kb', '1X1', 28, 1, 'ae7da3e92bb798cdb9d0904fdf0788ff', 'admin', '2019-10-23 22:53:22', 3, 'admin', '2019-10-23 22:53:03', 1, 4, 1, 1);
INSERT INTO `material` VALUES (862, '深圳东门 (25)', '深圳东门 (25).mp4', '/Users/hymanzhou/dataCenter/itmsServer/1571917004325.mp4', 'vedio', '1.85MB', '960X528', 28, 15, 'b149e9387f98fe1daf09758d275f428e', 'admin', '2019-10-24 19:39:54', 3, 'admin', '2019-10-24 19:36:44', 1, 10, 1, 0);
INSERT INTO `material` VALUES (865, 'luoxiaohei', 'luoxiaohei.png', '/Users/hymanzhou/dataCenter/itmsServer/1572001305117.png', 'picture', '0.04MB', '1340X754', 28, 1, '49e9904a8dd832f842c6326b24f4c675', 'admin', '2019-10-25 19:04:50', 3, 'admin', '2019-10-25 19:01:45', 0, 0, 1, 1);
INSERT INTO `material` VALUES (866, 'wukongzhuan_test', 'wukongzhuan.wmv', '/Users/hymanzhou/dataCenter/itmsServer/1572001455609.wmv', 'vedio', '60.56MB', '1720X696', 28, 15, 'a01cb0e2fe5051598f66d0fffb5c31f6', 'admin', '2019-10-25 19:05:20', 3, 'admin', '2019-10-25 19:04:16', 1, 4, 1, 1);
INSERT INTO `material` VALUES (867, 'ffere', '深圳东门 (9).mp4', '/Users/hymanzhou/dataCenter/itmsServer/1572245677333.mp4', 'vedio', '0.92MB', '960X528', 28, 15, '987b9fc99ac44b55a751742c563591a5', 'admin', '2019-10-28 14:55:26', 3, 'admin', '2019-10-28 14:54:37', 1, 2, 1, 1);
INSERT INTO `material` VALUES (921, 'test', 'test.jpg', 'D:/dataCenter/itmsServer/1572700288730.jpg', 'picture', '0.01MB', '640X684', 9, 1, '86282420b5824de8aa0baed157b22f3', 'admin', '2019-11-02 21:13:30', 3, 'admin', '2019-11-02 21:11:29', 0, 0, 1, 1);
INSERT INTO `material` VALUES (922, 'test', 'test.jpg', 'D:/dataCenter/itmsServer/1572701355732.jpg', 'picture', '0.01MB', '640X684', 9, 1, '86282420b5824de8aa0baed157b22f3', 'admin', '2019-11-02 21:32:19', 3, 'admin', '2019-11-02 21:29:16', 0, 0, 1, 1);
INSERT INTO `material` VALUES (923, 'test', 'test.jpg', 'D:/dataCenter/itmsServer/1572703130208.jpg', 'picture', '0.01MB', '640X684', 33, 1, '86282420b5824de8aa0baed157b22f3', 'admin', '2019-11-02 21:59:15', 3, 'admin', '2019-11-02 21:58:50', 0, 0, 1, 1);
INSERT INTO `material` VALUES (924, 'test', 'test.jpg', 'D:/dataCenter/itmsServer/1572703243409.jpg', 'picture', '0.01MB', '640X684', 9, 1, '86282420b5824de8aa0baed157b22f3', 'admin', '2019-11-02 22:00:55', 3, 'admin', '2019-11-02 22:00:43', 0, 0, 1, 1);
INSERT INTO `material` VALUES (925, 'test_modify', 'test.jpg', 'D:/dataCenter/itmsServer/1572850700761.jpg', 'picture', '0.01MB', '640X684', 9, 1, '86282420b5824de8aa0baed157b22f3', 'admin', '2019-11-04 14:59:23', 3, 'admin', '2019-11-04 14:58:21', 0, 0, 1, 1);
INSERT INTO `material` VALUES (926, '疯狂test', 'test.jpg', 'D:/dataCenter/itmsServer/1572851812911.jpg', 'picture', '0.01MB', '640X684', 9, 1, '86282420b5824de8aa0baed157b22f3', 'admin', '2019-11-04 15:17:38', 4, 'admin', '2019-11-04 15:16:53', 0, 0, 1, 1);
INSERT INTO `material` VALUES (927, '南都test', 'test.jpg', 'D:/dataCenter/itmsServer/1572852207592.jpg', 'picture', '0.01MB', '640X684', 9, 1, '86282420b5824de8aa0baed157b22f3', 'admin', '2019-11-04 15:24:09', 3, 'admin', '2019-11-04 15:23:28', 0, 0, 1, 1);
INSERT INTO `material` VALUES (928, 'test', 'test.jpg', 'D:/dataCenter/itmsServer/1572871263365.jpg', 'picture', '0.01MB', '640X684', 9, 1, '86282420b5824de8aa0baed157b22f3', 'admin', '2019-11-04 20:41:26', 3, 'admin', '2019-11-04 20:41:03', 0, 0, 1, 1);
INSERT INTO `material` VALUES (929, '深圳东门 (14)', '深圳东门 (14).mp4', 'D:/dataCenter/itmsServer/1573045110261.mp4', 'vedio', '1.28MB', '960X528', 28, 15, '9d49d90ca54437ed897fde60f129b34f', 'admin', '2019-11-06 20:59:08', 3, 'admin', '2019-11-06 20:58:30', 0, 0, 1, 1);
INSERT INTO `material` VALUES (930, '深圳东门 (19)', '深圳东门 (19).mp4', 'D:/dataCenter/itmsServer/1574064183506.mp4', 'vedio', '0.92MB', '960X528', NULL, 15, '55999140eb386d433c606f23122cb63d', NULL, NULL, 1, 'admin', '2019-11-18 16:03:04', 0, 0, 0, 1);
INSERT INTO `material` VALUES (931, '深圳东门 (12)', '深圳东门 (12).mp4', 'D:/dataCenter/itmsServer/1574075974364.mp4', 'vedio', '0.69MB', '960X528', NULL, 15, '1730a50ddd316d6202c417bd0c67daf0', NULL, NULL, 1, 'admin', '2019-11-18 19:19:34', 0, 0, 0, 1);
INSERT INTO `material` VALUES (932, 'testmodify', '深圳东门 (13).mp4', 'D:/dataCenter/itmsServer/1574075975051.mp4', 'vedio', '0.59MB', '960X528', NULL, 15, 'ca8bef118d7aa91aa76ae145af416159', NULL, NULL, 1, 'admin', '2019-11-18 19:19:35', 0, 0, 0, 1);
INSERT INTO `material` VALUES (933, '深圳东门 (1)', '深圳东门 (1).mp4', 'D:/dataCenter/itmsServer/1574393289840.mp4', 'vedio', '3.45MB', '960X528', 28, 30, 'fcbda38a9478265def55c79df3c4c7d6', 'admin', '2019-11-22 11:29:34', 3, 'admin', '2019-11-22 11:28:10', 1, 6, 1, 0);
INSERT INTO `material` VALUES (934, '深圳东门 (2)', '深圳东门 (2).mp4', 'D:/dataCenter/itmsServer/1574393290387.mp4', 'vedio', '1.12MB', '960X528', 28, 14, 'd045f547738c89599a353f84c19124fd', 'admin', '2019-11-22 11:29:14', 3, 'admin', '2019-11-22 11:28:10', 1, 3, 1, 0);
INSERT INTO `material` VALUES (935, '深圳东门 (3)', '深圳东门 (3).mp4', 'D:/dataCenter/itmsServer/1574393290553.mp4', 'vedio', '0.57MB', '960X528', 28, 15, '804ef65c88efde19c82cd9103a166205', 'admin', '2019-11-22 11:29:19', 3, 'admin', '2019-11-22 11:28:11', 1, 10, 1, 0);
INSERT INTO `material` VALUES (936, '深圳东门 (4)', '深圳东门 (4).mp4', 'D:/dataCenter/itmsServer/1574393290721.mp4', 'vedio', '0.92MB', '960X528', 28, 15, 'e8af1ff0082a4d61c784497da8381230', 'admin', '2019-11-22 11:29:25', 3, 'admin', '2019-11-22 11:28:11', 1, 7, 1, 0);
INSERT INTO `material` VALUES (937, '深圳东门 (5)', '深圳东门 (5).mp4', 'D:/dataCenter/itmsServer/1574393290919.mp4', 'vedio', '1.84MB', '960X528', 28, 15, '264bf5ba76721200c1615ebcf2122a7f', 'admin', '2019-11-22 11:29:22', 3, 'admin', '2019-11-22 11:28:11', 1, 8, 1, 0);
INSERT INTO `material` VALUES (938, '深圳东门 (6)', '深圳东门 (6).mp4', 'D:/dataCenter/itmsServer/1574393291141.mp4', 'vedio', '2.98MB', '960X528', 28, 30, 'ae051dd5545e95936b1857c687caf944', 'admin', '2019-11-22 11:29:28', 3, 'admin', '2019-11-22 11:28:11', 1, 8, 1, 0);
INSERT INTO `material` VALUES (939, '深圳东门 (7)', '深圳东门 (7).mp4', 'D:/dataCenter/itmsServer/1574393291328.mp4', 'vedio', '0.78MB', '960X528', 28, 15, '9e81a8ae629087ed331f46d8f6cfadb6', 'admin', '2019-11-22 11:29:31', 3, 'admin', '2019-11-22 11:28:11', 1, 4, 1, 0);
INSERT INTO `material` VALUES (940, '深圳东门 (8)', '深圳东门 (8).mp4', 'D:/dataCenter/itmsServer/1574393291515.mp4', 'vedio', '1.53MB', '960X528', 28, 15, '334cbbe2b20e5f871cbab77cb9890bc', 'admin', '2019-11-22 11:29:06', 3, 'admin', '2019-11-22 11:28:12', 1, 15, 1, 0);

-- ----------------------------
-- Table structure for period
-- ----------------------------
DROP TABLE IF EXISTS `period`;
CREATE TABLE `period`  (
  `period_id` bigint(50) NOT NULL AUTO_INCREMENT,
  `period_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `start_interval` time(0) DEFAULT NULL,
  `end_interval` time(0) DEFAULT NULL,
  `mark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` int(20) DEFAULT NULL,
  `terminal_id` bigint(20) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `terminal_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`period_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of period
-- ----------------------------
INSERT INTO `period` VALUES (38, '南都-周期轮播', '08:00:00', '22:00:00', '', 0, 9, 0, '南都');
INSERT INTO `period` VALUES (39, '车天车地-周期轮播', '08:00:00', '22:00:00', '', 0, 32, 0, '车天车地');
INSERT INTO `period` VALUES (40, '外经贸-周期轮播', '08:00:00', '22:00:00', '', 0, 48, 0, '外经贸大厦');
INSERT INTO `period` VALUES (42, '南都特殊轮播-早高峰', '08:00:00', '09:00:00', '', 0, 9, 1, '南都');
INSERT INTO `period` VALUES (43, '办公室测试时段', '08:00:00', '22:00:00', '', 0, 49, 0, '办公室大屏');
INSERT INTO `period` VALUES (46, '东门-周期轮播', '08:00:00', '22:00:00', '', 0, 28, 0, '深圳-东门');
INSERT INTO `period` VALUES (48, '新绿岛-周期轮播', '08:00:00', '22:00:00', '深圳新绿岛周期轮播时段', 0, 33, 0, '深圳-新绿岛');
INSERT INTO `period` VALUES (49, '江门中泰来-周期轮播', '08:30:00', '22:00:00', '', 0, 43, 1, '江门-中泰来大酒店');
INSERT INTO `period` VALUES (50, '金凯', '08:00:00', '22:00:00', '', 0, 34, 1, '深圳-金凯广场');
INSERT INTO `period` VALUES (51, 'test', '01:01:01', '01:01:02', '', 0, 9, 1, '南都');
INSERT INTO `period` VALUES (52, 'test_t', '01:01:01', '01:02:02', '', 0, 9, 1, '南都');
INSERT INTO `period` VALUES (53, 'test_test', '01:02:02', '03:04:04', '', 0, 29, 1, '佛山-ICC');
INSERT INTO `period` VALUES (54, 'testdelete', '00:00:00', '02:02:02', '', 0, 9, 1, '南都');
INSERT INTO `period` VALUES (55, 'ewwdhw', '01:01:01', '01:02:03', '', 0, 9, 1, '南都');
INSERT INTO `period` VALUES (56, '南都不轮播', '01:01:02', '01:04:04', 'tes', 0, 9, 1, '南都');
INSERT INTO `period` VALUES (57, 'test', '03:03:03', '22:04:04', '', 0, 37, 1, '惠州-花边岭广场');

-- ----------------------------
-- Table structure for play_log
-- ----------------------------
DROP TABLE IF EXISTS `play_log`;
CREATE TABLE `play_log`  (
  `play_log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `terminal_id` bigint(20) DEFAULT NULL,
  `terminal_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `play_start_time` datetime(0) DEFAULT NULL,
  `play_end_time` datetime(0) DEFAULT NULL,
  `material_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `file_id` bigint(20) DEFAULT NULL,
  `pname` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `pid` bigint(20) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`play_log_id`) USING BTREE,
  INDEX `FK_Reference_6`(`terminal_id`) USING BTREE,
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`terminal_id`) REFERENCES `terminal` (`terminal_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of play_log
-- ----------------------------
INSERT INTO `play_log` VALUES (1, 28, '深圳-东门', '2019-11-26 18:58:19', '2019-11-26 18:58:34', '46bae1dc06897d1523625e864b0530d3.mp4', 859, '深圳-东门-周期轮播(2019-11-06)', 46, 0);
INSERT INTO `play_log` VALUES (2, 28, '深圳-东门', '2019-11-26 18:58:34', '2019-11-26 18:58:50', '深圳东门 (42).mp4', 870, '深圳-东门-周期轮播(2019-11-06)', 46, 0);
INSERT INTO `play_log` VALUES (3, 28, '深圳-东门', '2019-11-26 18:58:50', '2019-11-26 18:59:05', '深圳东门 (44).mp4', 872, '深圳-东门-周期轮播(2019-11-06)', 46, 0);
INSERT INTO `play_log` VALUES (4, 28, '深圳-东门', '2019-11-26 18:59:05', '2019-11-26 18:59:20', '深圳东门 (43).mp4', 871, '深圳-东门-周期轮播(2019-11-06)', 46, 0);
INSERT INTO `play_log` VALUES (5, 28, '深圳-东门', '2019-11-26 19:00:01', '2019-11-26 19:00:17', '深圳东门 (42).mp4', 870, '深圳-东门-周期轮播(2019-11-06)', 46, 0);
INSERT INTO `play_log` VALUES (6, 28, '深圳-东门', '2019-11-26 19:00:17', '2019-11-26 19:00:32', '46bae1dc06897d1523625e864b0530d3.mp4', 859, '深圳-东门-周期轮播(2019-11-06)', 46, 0);
INSERT INTO `play_log` VALUES (7, 28, '深圳-东门', '2019-11-26 19:00:32', '2019-11-26 19:00:47', '深圳东门 (42).mp4', 870, '深圳-东门-周期轮播(2019-11-06)', 46, 0);
INSERT INTO `play_log` VALUES (8, 28, '深圳-东门', '2019-11-26 19:00:47', '2019-11-26 19:01:02', '深圳东门 (44).mp4', 872, '深圳-东门-周期轮播(2019-11-06)', 46, 0);
INSERT INTO `play_log` VALUES (9, 28, '深圳-东门', '2019-11-26 19:01:02', '2019-11-26 19:01:18', '深圳东门 (43).mp4', 871, '深圳-东门-周期轮播(2019-11-06)', 46, 0);
INSERT INTO `play_log` VALUES (10, 28, '深圳-东门', '2019-11-26 19:01:18', '2019-11-26 19:01:33', '深圳东门 (42).mp4', 870, '深圳-东门-周期轮播(2019-11-06)', 46, 0);
INSERT INTO `play_log` VALUES (11, 28, '深圳-东门', '2019-11-26 19:01:33', '2019-11-26 19:01:48', '46bae1dc06897d1523625e864b0530d3.mp4', 859, '深圳-东门-周期轮播(2019-11-06)', 46, 0);
INSERT INTO `play_log` VALUES (12, 28, '深圳-东门', '2019-11-26 19:01:48', '2019-11-26 19:02:03', '深圳东门 (42).mp4', 870, '深圳-东门-周期轮播(2019-11-06)', 46, 0);
INSERT INTO `play_log` VALUES (13, 28, '深圳-东门', '2019-11-26 19:02:03', '2019-11-26 19:02:18', '深圳东门 (44).mp4', 872, '深圳-东门-周期轮播(2019-11-06)', 46, 0);
INSERT INTO `play_log` VALUES (14, 28, '深圳-东门', '2019-11-26 19:02:18', '2019-11-26 19:02:33', '深圳东门 (43).mp4', 871, '深圳-东门-周期轮播(2019-11-06)', 46, 0);
INSERT INTO `play_log` VALUES (15, 28, '深圳-东门', '2019-11-26 19:02:33', '2019-11-26 19:02:49', '深圳东门 (42).mp4', 870, '深圳-东门-周期轮播(2019-11-06)', 46, 0);
INSERT INTO `play_log` VALUES (16, 28, '深圳-东门', '2019-11-26 19:02:49', '2019-11-26 19:03:04', '46bae1dc06897d1523625e864b0530d3.mp4', 859, '深圳-东门-周期轮播(2019-11-06)', 46, 0);
INSERT INTO `play_log` VALUES (17, 28, '深圳-东门', '2019-11-26 19:03:04', '2019-11-26 19:03:19', '深圳东门 (42).mp4', 870, '深圳-东门-周期轮播(2019-11-06)', 46, 0);
INSERT INTO `play_log` VALUES (18, 28, '深圳-东门', '2019-11-26 19:03:19', '2019-11-26 19:03:34', '深圳东门 (44).mp4', 872, '深圳-东门-周期轮播(2019-11-06)', 46, 0);
INSERT INTO `play_log` VALUES (19, 28, '深圳-东门', '2019-11-26 19:03:34', '2019-11-26 19:03:49', '深圳东门 (43).mp4', 871, '深圳-东门-周期轮播(2019-11-06)', 46, 0);
INSERT INTO `play_log` VALUES (20, 28, '深圳-东门', '2019-11-26 19:03:49', '2019-11-26 19:04:05', '深圳东门 (42).mp4', 870, '深圳-东门-周期轮播(2019-11-06)', 46, 0);
INSERT INTO `play_log` VALUES (21, 28, '深圳-东门', '2019-11-26 19:04:05', '2019-11-26 19:04:20', '46bae1dc06897d1523625e864b0530d3.mp4', 859, '深圳-东门-周期轮播(2019-11-06)', 46, 0);
INSERT INTO `play_log` VALUES (22, 28, '深圳-东门', '2019-11-26 19:04:20', '2019-11-26 19:04:35', '深圳东门 (42).mp4', 870, '深圳-东门-周期轮播(2019-11-06)', 46, 0);
INSERT INTO `play_log` VALUES (23, 28, '深圳-东门', '2019-11-26 19:04:35', '2019-11-26 19:04:50', '深圳东门 (44).mp4', 872, '深圳-东门-周期轮播(2019-11-06)', 46, 0);
INSERT INTO `play_log` VALUES (24, 28, '深圳-东门', '2019-11-26 19:04:50', '2019-11-26 19:05:05', '深圳东门 (43).mp4', 871, '深圳-东门-周期轮播(2019-11-06)', 46, 0);
INSERT INTO `play_log` VALUES (25, 28, '深圳-东门', '2019-11-26 19:05:05', '2019-11-26 19:05:20', '深圳东门 (42).mp4', 870, '深圳-东门-周期轮播(2019-11-06)', 46, 0);
INSERT INTO `play_log` VALUES (26, 28, '深圳-东门', '2019-11-26 19:05:20', '2019-11-26 19:05:36', '46bae1dc06897d1523625e864b0530d3.mp4', 859, '深圳-东门-周期轮播(2019-11-06)', 46, 0);
INSERT INTO `play_log` VALUES (27, 28, '深圳-东门', '2019-11-26 19:05:36', '2019-11-26 19:05:51', '深圳东门 (42).mp4', 870, '深圳-东门-周期轮播(2019-11-06)', 46, 0);
INSERT INTO `play_log` VALUES (28, 28, '深圳-东门', '2019-11-26 19:05:51', '2019-11-26 19:06:06', '深圳东门 (44).mp4', 872, '深圳-东门-周期轮播(2019-11-06)', 46, 0);
INSERT INTO `play_log` VALUES (29, 28, '深圳-东门', '2019-11-26 19:06:06', '2019-11-26 19:06:21', '深圳东门 (43).mp4', 871, '深圳-东门-周期轮播(2019-11-06)', 46, 0);
INSERT INTO `play_log` VALUES (30, 28, '深圳-东门', '2019-11-26 19:06:21', '2019-11-26 19:06:36', '深圳东门 (42).mp4', 870, '深圳-东门-周期轮播(2019-11-06)', 46, 0);
INSERT INTO `play_log` VALUES (31, 28, '深圳-东门', '2019-11-26 19:06:36', '2019-11-26 19:06:51', '46bae1dc06897d1523625e864b0530d3.mp4', 859, '深圳-东门-周期轮播(2019-11-06)', 46, 0);
INSERT INTO `play_log` VALUES (32, 28, '深圳-东门', '2019-11-26 19:06:51', '2019-11-26 19:07:07', '深圳东门 (42).mp4', 870, '深圳-东门-周期轮播(2019-11-06)', 46, 0);
INSERT INTO `play_log` VALUES (33, 28, '深圳-东门', '2019-11-26 19:07:07', '2019-11-26 19:07:22', '深圳东门 (44).mp4', 872, '深圳-东门-周期轮播(2019-11-06)', 46, 0);
INSERT INTO `play_log` VALUES (34, 28, '深圳-东门', '2019-11-26 19:07:22', '2019-11-26 19:07:37', '深圳东门 (43).mp4', 871, '深圳-东门-周期轮播(2019-11-06)', 46, 0);
INSERT INTO `play_log` VALUES (35, 28, '深圳-东门', '2019-11-26 19:07:37', '2019-11-26 19:07:52', '深圳东门 (42).mp4', 870, '深圳-东门-周期轮播(2019-11-06)', 46, 0);
INSERT INTO `play_log` VALUES (36, 28, '深圳-东门', '2019-11-26 19:07:52', '2019-11-26 19:08:07', '46bae1dc06897d1523625e864b0530d3.mp4', 859, '深圳-东门-周期轮播(2019-11-06)', 46, 0);
INSERT INTO `play_log` VALUES (37, 28, '深圳-东门', '2019-11-26 19:08:07', '2019-11-26 19:08:23', '深圳东门 (42).mp4', 870, '深圳-东门-周期轮播(2019-11-06)', 46, 0);
INSERT INTO `play_log` VALUES (38, 28, '深圳-东门', '2019-11-26 19:08:23', '2019-11-26 19:08:38', '深圳东门 (44).mp4', 872, '深圳-东门-周期轮播(2019-11-06)', 46, 0);
INSERT INTO `play_log` VALUES (39, 28, '深圳-东门', '2019-11-26 19:08:38', '2019-11-26 19:08:53', '深圳东门 (43).mp4', 871, '深圳-东门-周期轮播(2019-11-06)', 46, 0);
INSERT INTO `play_log` VALUES (40, 28, '深圳-东门', '2019-11-26 19:08:53', '2019-11-26 19:09:08', '深圳东门 (42).mp4', 870, '深圳-东门-周期轮播(2019-11-06)', 46, 0);
INSERT INTO `play_log` VALUES (41, 28, '深圳-东门', '2019-11-26 19:09:08', '2019-11-26 19:09:23', '46bae1dc06897d1523625e864b0530d3.mp4', 859, '深圳-东门-周期轮播(2019-11-06)', 46, 0);
INSERT INTO `play_log` VALUES (42, 28, '深圳-东门', '2019-11-26 19:09:23', '2019-11-26 19:09:38', '深圳东门 (42).mp4', 870, '深圳-东门-周期轮播(2019-11-06)', 46, 0);
INSERT INTO `play_log` VALUES (43, 28, '深圳-东门', '2019-11-26 19:09:38', '2019-11-26 19:09:53', '深圳东门 (44).mp4', 872, '深圳-东门-周期轮播(2019-11-06)', 46, 0);

-- ----------------------------
-- Table structure for play_table
-- ----------------------------
DROP TABLE IF EXISTS `play_table`;
CREATE TABLE `play_table`  (
  `pid` bigint(50) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(50) DEFAULT NULL,
  `period_id` bigint(50) DEFAULT NULL,
  `terminal_id` bigint(50) DEFAULT NULL,
  `status_id` bigint(20) DEFAULT NULL,
  `mark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `play_date` date DEFAULT NULL,
  `screen_rate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `play_totaltime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ptable_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `all_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `start_time` time(0) DEFAULT NULL,
  `end_time` time(0) DEFAULT NULL,
  `min` bigint(50) DEFAULT NULL,
  `insert_flag` tinyint(1) DEFAULT NULL,
  `state` tinyint(1) DEFAULT NULL,
  `modify_time` datetime(0) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `base_frequency` int(11) DEFAULT NULL,
  PRIMARY KEY (`pid`) USING BTREE,
  INDEX `FK_Reference_11`(`user_id`) USING BTREE,
  INDEX `terminal_id`(`terminal_id`) USING BTREE,
  CONSTRAINT `play_table_ibfk_1` FOREIGN KEY (`terminal_id`) REFERENCES `terminal` (`terminal_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 766 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of play_table
-- ----------------------------
INSERT INTO `play_table` VALUES (698, 1, 46, 28, 2, NULL, '2019-10-23', '9.87%', '75分0秒', '深圳-东门-周期轮播(2019-10-23)', '840分0秒', '2019-10-23 21:07:43', 0, NULL, NULL, 0, 0, 0, '2019-10-23 22:19:01', 60);
INSERT INTO `play_table` VALUES (699, 1, 46, 28, 3, NULL, '2019-10-24', '7.26%', '61分0秒', '深圳-东门-周期轮播(2019-10-24)', '840分0秒', '2019-10-24 19:42:20', 0, NULL, NULL, 0, 0, 0, NULL, 60);
INSERT INTO `play_table` VALUES (700, 1, 46, 28, 2, NULL, '2019-10-25', '1.90%', '16分0秒', '深圳-东门-周期轮播(2019-10-25)', '840分0秒', '2019-10-24 19:42:20', 0, NULL, NULL, 0, 0, 0, NULL, 60);
INSERT INTO `play_table` VALUES (701, 1, 46, 28, 2, NULL, '2019-10-26', '1.90%', '16分0秒', '深圳-东门-周期轮播(2019-10-26)', '840分0秒', '2019-10-24 19:42:20', 0, NULL, NULL, 0, 0, 0, NULL, 60);
INSERT INTO `play_table` VALUES (702, 1, 46, 28, 3, NULL, '2019-10-27', '1.90%', '16分0秒', '深圳-东门-周期轮播(2019-10-27)', '840分0秒', '2019-10-27 00:01:14', 0, NULL, NULL, 0, 0, 0, NULL, 60);
INSERT INTO `play_table` VALUES (703, 1, 46, 28, 1, NULL, '2019-11-04', '7.89%', '60分0秒', '深圳-东门-周期轮播(2019-11-04)', '840分0秒', '2019-11-04 16:34:37', 1, NULL, NULL, 0, 0, 0, '2019-11-04 16:52:41', 60);
INSERT INTO `play_table` VALUES (704, 1, 46, 28, 3, '', '2019-11-04', '7.89%', '60分0秒', '深圳-东门-周期轮播(2019-11-04)', '840分0秒', '2019-11-04 16:52:42', 0, NULL, NULL, 0, 0, 0, '2019-11-04 16:58:15', 60);
INSERT INTO `play_table` VALUES (705, 1, 46, 28, 1, NULL, '2019-11-04', '7.14%', '60分0秒', '深圳-东门-周期轮播(2019-11-04)', '840分0秒', '2019-11-04 19:27:15', 1, NULL, NULL, 0, 0, 0, '2019-11-04 20:42:07', 60);
INSERT INTO `play_table` VALUES (706, 1, 46, 28, 1, NULL, '2019-11-04', '7.14%', '60分0秒', '深圳-东门-周期轮播(2019-11-04)', '840分0秒', '2019-11-04 20:42:08', 1, NULL, NULL, 0, 0, 0, '2019-11-04 21:22:04', 60);
INSERT INTO `play_table` VALUES (707, 1, 46, 28, 1, NULL, '2019-11-06', '3.57%', '30分0秒', '深圳-东门-周期轮播(2019-11-06)', '840分0秒', '2019-11-04 20:42:23', 1, NULL, NULL, 0, 0, 0, '2019-11-04 21:22:04', 60);
INSERT INTO `play_table` VALUES (708, 1, 46, 28, 1, NULL, '2019-11-07', '3.57%', '30分0秒', '深圳-东门-周期轮播(2019-11-07)', '840分0秒', '2019-11-04 20:42:23', 1, NULL, NULL, 0, 0, 0, '2019-11-04 21:22:04', 60);
INSERT INTO `play_table` VALUES (709, 1, 46, 28, 1, NULL, '2019-11-09', '3.57%', '30分0秒', '深圳-东门-周期轮播(2019-11-09)', '840分0秒', '2019-11-04 21:17:27', 1, NULL, NULL, 0, 0, 0, '2019-11-04 21:22:04', 60);
INSERT INTO `play_table` VALUES (710, 1, 46, 28, 1, NULL, '2019-11-18', '1.79%', '15分0秒', '深圳-东门-周期轮播(2019-11-18)', '840分0秒', '2019-11-04 21:20:14', 1, NULL, NULL, 0, 0, 0, '2019-11-04 21:22:04', 60);
INSERT INTO `play_table` VALUES (711, 1, 46, 28, 1, NULL, '2019-11-19', '1.79%', '15分0秒', '深圳-东门-周期轮播(2019-11-19)', '840分0秒', '2019-11-04 21:20:14', 1, NULL, NULL, 0, 0, 0, '2019-11-04 21:22:04', 60);
INSERT INTO `play_table` VALUES (712, 1, 46, 28, 1, NULL, '2019-11-20', '1.79%', '15分0秒', '深圳-东门-周期轮播(2019-11-20)', '840分0秒', '2019-11-04 21:20:14', 1, NULL, NULL, 0, 0, 0, '2019-11-04 21:22:04', 60);
INSERT INTO `play_table` VALUES (713, 1, 46, 28, 1, NULL, '2019-11-21', '1.79%', '15分0秒', '深圳-东门-周期轮播(2019-11-21)', '840分0秒', '2019-11-04 21:20:15', 1, NULL, NULL, 0, 0, 0, '2019-11-04 21:22:04', 60);
INSERT INTO `play_table` VALUES (714, 1, 46, 28, 1, NULL, '2019-11-07', '3.57%', '30分0秒', '深圳-东门-周期轮播(2019-11-07)', '840分0秒', '2019-11-04 21:24:38', 1, NULL, NULL, 0, 0, 0, '2019-11-04 22:02:49', 60);
INSERT INTO `play_table` VALUES (715, 1, 46, 28, 1, NULL, '2019-11-08', '3.57%', '30分0秒', '深圳-东门-周期轮播(2019-11-08)', '840分0秒', '2019-11-04 21:24:38', 1, NULL, NULL, 0, 0, 0, '2019-11-04 22:02:49', 60);
INSERT INTO `play_table` VALUES (716, 1, 46, 28, 1, NULL, '2019-11-09', '3.57%', '30分0秒', '深圳-东门-周期轮播(2019-11-09)', '840分0秒', '2019-11-04 21:24:38', 1, NULL, NULL, 0, 0, 0, '2019-11-04 21:26:40', 60);
INSERT INTO `play_table` VALUES (717, 1, 46, 28, 1, NULL, '2019-11-09', '3.57%', '30分0秒', '深圳-东门-周期轮播(2019-11-09)', '840分0秒', '2019-11-04 21:26:41', 1, NULL, NULL, 0, 0, 0, '2019-11-04 22:02:45', 60);
INSERT INTO `play_table` VALUES (718, 1, 46, 28, 1, NULL, '2019-11-10', '3.57%', '30分0秒', '深圳-东门-周期轮播(2019-11-10)', '840分0秒', '2019-11-04 21:26:41', 1, NULL, NULL, 0, 0, 0, '2019-11-04 22:02:45', 60);
INSERT INTO `play_table` VALUES (719, 1, 46, 28, 1, NULL, '2019-11-11', '3.57%', '30分0秒', '深圳-东门-周期轮播(2019-11-11)', '840分0秒', '2019-11-04 21:26:41', 1, NULL, NULL, 0, 0, 0, '2019-11-04 22:02:45', 60);
INSERT INTO `play_table` VALUES (720, 1, 46, 28, 1, NULL, '2019-11-20', '1.79%', '15分0秒', '深圳-东门-周期轮播(2019-11-20)', '840分0秒', '2019-11-04 21:29:07', 1, NULL, NULL, 0, 0, 0, '2019-11-04 22:02:45', 60);
INSERT INTO `play_table` VALUES (721, 1, 46, 28, 1, NULL, '2019-11-21', '1.79%', '15分0秒', '深圳-东门-周期轮播(2019-11-21)', '840分0秒', '2019-11-04 21:29:07', 1, NULL, NULL, 0, 0, 0, '2019-11-04 22:02:38', 60);
INSERT INTO `play_table` VALUES (722, 1, 46, 28, 1, NULL, '2019-11-22', '1.79%', '15分0秒', '深圳-东门-周期轮播(2019-11-22)', '840分0秒', '2019-11-04 21:29:07', 1, NULL, NULL, 0, 0, 0, '2019-11-04 22:02:38', 60);
INSERT INTO `play_table` VALUES (723, 1, 46, 28, 1, NULL, '2019-11-04', '7.14%', '60分0秒', '深圳-东门-周期轮播(2019-11-04)', '840分0秒', '2019-11-04 21:32:56', 1, NULL, NULL, 0, 0, 0, '2019-11-04 22:06:57', 60);
INSERT INTO `play_table` VALUES (724, 1, 46, 28, 1, NULL, '2019-11-26', '1.79%', '15分0秒', '深圳-东门-周期轮播(2019-11-26)', '840分0秒', '2019-11-04 21:33:15', 1, NULL, NULL, 0, 0, 0, '2019-11-04 22:02:38', 60);
INSERT INTO `play_table` VALUES (725, 1, 46, 28, 1, NULL, '2019-11-27', '1.79%', '15分0秒', '深圳-东门-周期轮播(2019-11-27)', '840分0秒', '2019-11-04 21:33:15', 1, NULL, NULL, 0, 0, 0, '2019-11-04 22:02:38', 60);
INSERT INTO `play_table` VALUES (726, 1, 46, 28, 1, NULL, '2019-11-28', '1.79%', '15分0秒', '深圳-东门-周期轮播(2019-11-28)', '840分0秒', '2019-11-04 21:33:15', 1, NULL, NULL, 0, 0, 0, '2019-11-04 22:02:38', 60);
INSERT INTO `play_table` VALUES (727, 1, 46, 28, 1, NULL, '2019-12-02', '1.79%', '15分0秒', '深圳-东门-周期轮播(2019-12-02)', '840分0秒', '2019-11-04 21:36:57', 1, NULL, NULL, 0, 0, 0, '2019-11-04 22:02:38', 60);
INSERT INTO `play_table` VALUES (728, 1, 46, 28, 1, NULL, '2019-12-03', '1.79%', '15分0秒', '深圳-东门-周期轮播(2019-12-03)', '840分0秒', '2019-11-04 21:36:57', 1, NULL, NULL, 0, 0, 0, '2019-11-04 22:02:38', 60);
INSERT INTO `play_table` VALUES (729, 1, 46, 28, 1, NULL, '2019-12-04', '1.79%', '15分0秒', '深圳-东门-周期轮播(2019-12-04)', '840分0秒', '2019-11-04 21:36:57', 1, NULL, NULL, 0, 0, 0, '2019-11-04 22:02:38', 60);
INSERT INTO `play_table` VALUES (730, 1, 46, 28, 1, NULL, '2019-12-24', '1.79%', '15分0秒', '深圳-东门-周期轮播(2019-12-24)', '840分0秒', '2019-11-04 21:58:32', 1, NULL, NULL, 0, 0, 0, '2019-11-04 22:02:38', 60);
INSERT INTO `play_table` VALUES (731, 1, 46, 28, 1, NULL, '2019-12-25', '1.79%', '15分0秒', '深圳-东门-周期轮播(2019-12-25)', '840分0秒', '2019-11-04 21:58:32', 1, NULL, NULL, 0, 0, 0, '2019-11-04 22:02:38', 60);
INSERT INTO `play_table` VALUES (732, 1, 46, 28, 1, NULL, '2019-11-13', '3.57%', '30分0秒', '深圳-东门-周期轮播(2019-11-13)', '840分0秒', '2019-11-04 22:01:44', 1, NULL, NULL, 0, 0, 0, '2019-11-04 22:02:45', 60);
INSERT INTO `play_table` VALUES (733, 1, 46, 28, 1, NULL, '2019-11-14', '1.79%', '15分0秒', '深圳-东门-周期轮播(2019-11-14)', '840分0秒', '2019-11-04 22:01:44', 1, NULL, NULL, 0, 0, 0, '2019-11-04 22:02:45', 60);
INSERT INTO `play_table` VALUES (734, 1, 46, 28, 1, NULL, '2019-11-15', '1.79%', '15分0秒', '深圳-东门-周期轮播(2019-11-15)', '840分0秒', '2019-11-04 22:01:44', 1, NULL, NULL, 0, 0, 0, '2019-11-04 22:02:45', 60);
INSERT INTO `play_table` VALUES (735, 1, 46, 28, 1, NULL, '2019-11-16', '1.79%', '15分0秒', '深圳-东门-周期轮播(2019-11-16)', '840分0秒', '2019-11-04 22:01:44', 1, NULL, NULL, 0, 0, 0, '2019-11-04 22:02:45', 60);
INSERT INTO `play_table` VALUES (736, 1, 46, 28, 1, NULL, '2019-11-17', '1.79%', '15分0秒', '深圳-东门-周期轮播(2019-11-17)', '840分0秒', '2019-11-04 22:01:44', 1, NULL, NULL, 0, 0, 0, '2019-11-04 22:02:45', 60);
INSERT INTO `play_table` VALUES (737, 1, 46, 28, 1, NULL, '2019-11-18', '1.79%', '15分0秒', '深圳-东门-周期轮播(2019-11-18)', '840分0秒', '2019-11-04 22:01:44', 1, NULL, NULL, 0, 0, 0, '2019-11-04 22:02:45', 60);
INSERT INTO `play_table` VALUES (738, 1, 46, 28, 1, NULL, '2019-11-27', '1.79%', '15分0秒', '深圳-东门-周期轮播(2019-11-27)', '840分0秒', '2019-11-04 22:03:16', 1, NULL, NULL, 0, 0, 0, '2019-11-22 11:27:11', 60);
INSERT INTO `play_table` VALUES (739, 1, 46, 28, 1, NULL, '2019-11-28', '1.79%', '15分0秒', '深圳-东门-周期轮播(2019-11-28)', '840分0秒', '2019-11-04 22:03:16', 1, NULL, NULL, 0, 0, 0, '2019-11-22 11:27:11', 60);
INSERT INTO `play_table` VALUES (740, 1, 46, 28, 1, NULL, '2019-11-29', '1.79%', '15分0秒', '深圳-东门-周期轮播(2019-11-29)', '840分0秒', '2019-11-04 22:03:16', 1, NULL, NULL, 0, 0, 0, '2019-11-22 11:27:11', 60);
INSERT INTO `play_table` VALUES (741, 1, 46, 28, 1, NULL, '2019-11-30', '1.97%', '15分0秒', '深圳-东门-周期轮播(2019-11-30)', '840分0秒', '2019-11-04 22:03:16', 1, NULL, NULL, 0, 0, 0, '2019-11-22 11:27:05', 60);
INSERT INTO `play_table` VALUES (742, 1, 46, 28, 1, NULL, '2019-11-04', '7.14%', '60分0秒', '深圳-东门-周期轮播(2019-11-04)', '840分0秒', '2019-11-04 22:06:57', 1, NULL, NULL, 0, 0, 0, '2019-11-22 13:49:50', 60);
INSERT INTO `play_table` VALUES (743, 1, 46, 28, 1, NULL, '2019-11-21', '1.79%', '15分0秒', '深圳-东门-周期轮播(2019-11-21)', '840分0秒', '2019-11-04 22:07:20', 1, NULL, NULL, 0, 0, 0, '2019-11-22 11:27:28', 60);
INSERT INTO `play_table` VALUES (744, 1, 46, 28, 1, NULL, '2019-11-22', '1.79%', '15分0秒', '深圳-东门-周期轮播(2019-11-22)', '840分0秒', '2019-11-04 22:07:20', 1, NULL, NULL, 0, 0, 0, '2019-11-22 11:23:33', 60);
INSERT INTO `play_table` VALUES (745, 1, 46, 28, 1, NULL, '2019-11-23', '1.79%', '15分0秒', '深圳-东门-周期轮播(2019-11-23)', '840分0秒', '2019-11-04 22:07:20', 1, NULL, NULL, 0, 0, 0, '2019-11-22 11:27:20', 60);
INSERT INTO `play_table` VALUES (746, 1, 46, 28, 1, NULL, '2019-11-24', '1.79%', '15分0秒', '深圳-东门-周期轮播(2019-11-24)', '840分0秒', '2019-11-04 22:07:21', 1, NULL, NULL, 0, 0, 0, '2019-11-22 11:27:20', 60);
INSERT INTO `play_table` VALUES (747, 1, 46, 28, 1, NULL, '2019-11-25', '1.79%', '15分0秒', '深圳-东门-周期轮播(2019-11-25)', '840分0秒', '2019-11-04 22:07:21', 1, NULL, NULL, 0, 0, 0, '2019-11-22 11:27:20', 60);
INSERT INTO `play_table` VALUES (748, 1, NULL, 28, 1, NULL, '2019-11-06', NULL, NULL, '插播-深圳东门 (14)', NULL, '2019-11-06 21:00:13', 1, '21:20:00', '22:27:00', 10, 1, 2, '2019-11-22 13:50:01', NULL);
INSERT INTO `play_table` VALUES (749, 1, 46, 28, 1, NULL, '2019-11-08', '1.97%', '15分0秒', '深圳-东门-周期轮播(2019-11-08)', '840分0秒', '2019-11-08 14:14:53', 1, NULL, NULL, 0, 0, 0, '2019-11-08 14:25:38', 60);
INSERT INTO `play_table` VALUES (750, 1, 46, 28, 1, NULL, '2019-11-08', '10.71%', '90分0秒', '深圳-东门-周期轮播(2019-11-08)', '840分0秒', '2019-11-08 14:25:38', 1, NULL, NULL, 0, 0, 0, '2019-11-22 11:27:28', 60);
INSERT INTO `play_table` VALUES (751, 1, 46, 28, 1, NULL, '2019-11-09', '10.71%', '90分0秒', '深圳-东门-周期轮播(2019-11-09)', '840分0秒', '2019-11-08 14:25:38', 1, NULL, NULL, 0, 0, 0, '2019-11-22 11:27:28', 60);
INSERT INTO `play_table` VALUES (752, 1, 46, 28, 1, NULL, '2019-11-10', '21.71%', '165分0秒', '深圳-东门-周期轮播(2019-11-10)', '840分0秒', '2019-11-08 14:25:39', 1, NULL, NULL, 0, 0, 0, '2019-11-22 11:27:28', 60);
INSERT INTO `play_table` VALUES (753, 1, 46, 28, 1, NULL, '2019-11-22', '1.79%', '15分0秒', '深圳-东门-周期轮播(2019-11-22)', '840分0秒', '2019-11-22 11:23:33', 1, NULL, NULL, 0, 0, 0, '2019-11-22 11:27:28', 60);
INSERT INTO `play_table` VALUES (754, 1, 46, 28, 1, NULL, '2019-11-22', '3.95%', '30分0秒', '深圳-东门-周期轮播(2019-11-22)', '840分0秒', '2019-11-22 11:31:37', 1, NULL, NULL, 0, 0, 0, '2019-11-22 13:38:54', 60);
INSERT INTO `play_table` VALUES (755, 1, 46, 28, 1, NULL, '2019-11-22', '0%', '0分0秒', '深圳-东门-周期轮播(2019-11-22)', '840分0秒', '2019-11-22 13:39:07', 1, NULL, NULL, 0, 0, 0, '2019-11-22 13:49:21', 60);
INSERT INTO `play_table` VALUES (756, 1, 46, 28, 1, NULL, '2019-11-22', '1.97%', '15分0秒', '深圳-东门-周期轮播(2019-11-22)', '840分0秒', '2019-11-22 13:51:06', 1, NULL, NULL, 0, 0, 0, '2019-11-22 15:37:18', 60);
INSERT INTO `play_table` VALUES (757, 1, 46, 28, 1, NULL, '2019-11-22', '5.79%', '44分0秒', '深圳-东门-周期轮播(2019-11-22)', '840分0秒', '2019-11-22 15:37:18', 1, NULL, NULL, 0, 0, 0, '2019-11-22 15:42:42', 60);
INSERT INTO `play_table` VALUES (758, 1, 46, 28, 1, NULL, '2019-11-22', '3.95%', '30分0秒', '深圳-东门-周期轮播(2019-11-22)', '840分0秒', '2019-11-22 15:49:38', 1, NULL, NULL, 0, 0, 0, '2019-11-22 15:58:58', 60);
INSERT INTO `play_table` VALUES (759, 1, 46, 28, 1, NULL, '2019-11-22', '5.92%', '45分0秒', '深圳-东门-周期轮播(2019-11-22)', '840分0秒', '2019-11-22 15:58:59', 1, NULL, NULL, 0, 0, 0, '2019-11-22 16:15:41', 60);
INSERT INTO `play_table` VALUES (760, 1, 46, 28, 1, NULL, '2019-11-22', '1.97%', '15分0秒', '深圳-东门-周期轮播(2019-11-22)', '840分0秒', '2019-11-22 16:15:51', 1, NULL, NULL, 0, 0, 0, '2019-11-22 16:26:37', 60);
INSERT INTO `play_table` VALUES (761, 1, 46, 28, 1, NULL, '2019-11-22', '9.87%', '75分0秒', '深圳-东门-周期轮播(2019-11-22)', '840分0秒', '2019-11-22 16:26:46', 0, NULL, NULL, 0, 0, 0, '2019-11-24 13:24:03', 60);
INSERT INTO `play_table` VALUES (762, 1, 46, 28, 1, NULL, '2019-11-25', '0%', '0分0秒', '深圳-东门-周期轮播(2019-11-25)', '840分0秒', '2019-11-25 14:45:56', 1, NULL, NULL, 0, 0, 0, '2019-11-25 14:46:47', 60);
INSERT INTO `play_table` VALUES (763, 1, 46, 28, 1, NULL, '2019-11-26', '9.87%', '75分0秒', '深圳-东门-周期轮播(2019-11-26)', '840分0秒', '2019-11-26 19:15:20', 1, NULL, NULL, 0, 0, 0, '2019-11-26 19:19:39', 60);
INSERT INTO `play_table` VALUES (764, 1, 46, 28, 1, NULL, '2019-11-26', '57.11%', '434分0秒', '深圳-东门-周期轮播(2019-11-26)', '840分0秒', '2019-11-26 19:21:36', 0, NULL, NULL, 0, 0, 0, '2019-11-26 19:22:54', 60);
INSERT INTO `play_table` VALUES (765, 1, 46, 28, 1, NULL, '2019-12-06', '13.82%', '105分0秒', '深圳-东门-周期轮播(2019-12-06)', '840分0秒', '2019-12-06 17:46:37', 0, NULL, NULL, 0, 0, 0, '2019-12-06 17:48:41', 60);

-- ----------------------------
-- Table structure for ps_table
-- ----------------------------
DROP TABLE IF EXISTS `ps_table`;
CREATE TABLE `ps_table`  (
  `tid` bigint(20) NOT NULL AUTO_INCREMENT,
  `material_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `insert_date` date DEFAULT NULL,
  `start_time` time(0) DEFAULT NULL,
  `end_time` time(0) DEFAULT NULL,
  `min` int(20) DEFAULT NULL,
  `status` int(10) DEFAULT NULL,
  `mid` bigint(20) DEFAULT NULL,
  `terminal_id` bigint(20) DEFAULT NULL,
  `create_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` timestamp(0) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ptable_file
-- ----------------------------
DROP TABLE IF EXISTS `ptable_file`;
CREATE TABLE `ptable_file`  (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `mid` bigint(20) DEFAULT NULL,
  `pid` bigint(20) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Reference_12`(`mid`) USING BTREE,
  INDEX `FK_Reference_13`(`pid`) USING BTREE,
  CONSTRAINT `ptable_file_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `material` (`mid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ptable_file_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `play_table` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 18151 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ptable_file
-- ----------------------------
INSERT INTO `ptable_file` VALUES (16739, 860, 698, 1, 0);
INSERT INTO `ptable_file` VALUES (16740, 860, 698, 2, 0);
INSERT INTO `ptable_file` VALUES (16741, 860, 698, 3, 0);
INSERT INTO `ptable_file` VALUES (16742, 850, 698, 4, 0);
INSERT INTO `ptable_file` VALUES (16743, 860, 698, 5, 0);
INSERT INTO `ptable_file` VALUES (16744, 858, 699, 1, 0);
INSERT INTO `ptable_file` VALUES (16745, 860, 699, 2, 0);
INSERT INTO `ptable_file` VALUES (16746, 850, 699, 3, 0);
INSERT INTO `ptable_file` VALUES (16747, 854, 699, 4, 0);
INSERT INTO `ptable_file` VALUES (16748, 861, 699, 5, 0);
INSERT INTO `ptable_file` VALUES (16749, 854, 700, 1, 0);
INSERT INTO `ptable_file` VALUES (16750, 861, 700, 2, 0);
INSERT INTO `ptable_file` VALUES (16751, 854, 701, 1, 0);
INSERT INTO `ptable_file` VALUES (16752, 861, 701, 2, 0);
INSERT INTO `ptable_file` VALUES (16753, 854, 702, 1, 0);
INSERT INTO `ptable_file` VALUES (16754, 861, 702, 2, 0);
INSERT INTO `ptable_file` VALUES (16755, 866, 703, 1, 1);
INSERT INTO `ptable_file` VALUES (16756, 866, 703, 2, 1);
INSERT INTO `ptable_file` VALUES (16757, 866, 703, 3, 1);
INSERT INTO `ptable_file` VALUES (16758, 858, 703, 4, 1);
INSERT INTO `ptable_file` VALUES (16759, 858, 703, 4, 1);
INSERT INTO `ptable_file` VALUES (16764, 852, 704, 1, 0);
INSERT INTO `ptable_file` VALUES (16765, 866, 704, 2, 0);
INSERT INTO `ptable_file` VALUES (16766, 858, 704, 3, 0);
INSERT INTO `ptable_file` VALUES (16767, 862, 704, 4, 0);
INSERT INTO `ptable_file` VALUES (16768, 866, 705, 1, 1);
INSERT INTO `ptable_file` VALUES (16769, 858, 705, 2, 1);
INSERT INTO `ptable_file` VALUES (16770, 852, 705, 3, 1);
INSERT INTO `ptable_file` VALUES (16771, 862, 705, 4, 1);
INSERT INTO `ptable_file` VALUES (16772, 866, 706, 1, 0);
INSERT INTO `ptable_file` VALUES (16773, 858, 706, 2, 0);
INSERT INTO `ptable_file` VALUES (16774, 852, 706, 3, 0);
INSERT INTO `ptable_file` VALUES (16775, 862, 706, 4, 0);
INSERT INTO `ptable_file` VALUES (16776, 866, 707, 1, 0);
INSERT INTO `ptable_file` VALUES (16777, 858, 707, 2, 0);
INSERT INTO `ptable_file` VALUES (16778, 866, 708, 1, 0);
INSERT INTO `ptable_file` VALUES (16779, 858, 708, 2, 0);
INSERT INTO `ptable_file` VALUES (16780, 866, 709, 1, 0);
INSERT INTO `ptable_file` VALUES (16781, 858, 709, 2, 0);
INSERT INTO `ptable_file` VALUES (16782, 866, 710, 1, 0);
INSERT INTO `ptable_file` VALUES (16783, 866, 711, 1, 0);
INSERT INTO `ptable_file` VALUES (16784, 866, 712, 1, 0);
INSERT INTO `ptable_file` VALUES (16785, 866, 713, 1, 0);
INSERT INTO `ptable_file` VALUES (16786, 866, 714, 1, 0);
INSERT INTO `ptable_file` VALUES (16787, 858, 714, 2, 0);
INSERT INTO `ptable_file` VALUES (16788, 866, 715, 1, 0);
INSERT INTO `ptable_file` VALUES (16789, 858, 715, 2, 0);
INSERT INTO `ptable_file` VALUES (16790, 866, 716, 1, 1);
INSERT INTO `ptable_file` VALUES (16791, 858, 716, 2, 1);
INSERT INTO `ptable_file` VALUES (16792, 866, 717, 1, 0);
INSERT INTO `ptable_file` VALUES (16793, 858, 717, 2, 0);
INSERT INTO `ptable_file` VALUES (16794, 866, 718, 1, 0);
INSERT INTO `ptable_file` VALUES (16795, 858, 718, 2, 0);
INSERT INTO `ptable_file` VALUES (16796, 866, 719, 1, 0);
INSERT INTO `ptable_file` VALUES (16797, 858, 719, 2, 0);
INSERT INTO `ptable_file` VALUES (16798, 866, 720, 1, 0);
INSERT INTO `ptable_file` VALUES (16799, 866, 721, 1, 0);
INSERT INTO `ptable_file` VALUES (16800, 866, 722, 1, 0);
INSERT INTO `ptable_file` VALUES (16801, 866, 723, 1, 1);
INSERT INTO `ptable_file` VALUES (16802, 858, 723, 2, 1);
INSERT INTO `ptable_file` VALUES (16803, 852, 723, 3, 1);
INSERT INTO `ptable_file` VALUES (16804, 862, 723, 4, 1);
INSERT INTO `ptable_file` VALUES (16805, 866, 724, 1, 0);
INSERT INTO `ptable_file` VALUES (16806, 866, 725, 1, 0);
INSERT INTO `ptable_file` VALUES (16807, 866, 726, 1, 0);
INSERT INTO `ptable_file` VALUES (16808, 866, 727, 1, 0);
INSERT INTO `ptable_file` VALUES (16809, 866, 728, 1, 0);
INSERT INTO `ptable_file` VALUES (16810, 866, 729, 1, 0);
INSERT INTO `ptable_file` VALUES (16811, 866, 730, 1, 0);
INSERT INTO `ptable_file` VALUES (16812, 866, 731, 1, 0);
INSERT INTO `ptable_file` VALUES (16813, 866, 732, 1, 0);
INSERT INTO `ptable_file` VALUES (16814, 858, 732, 2, 0);
INSERT INTO `ptable_file` VALUES (16815, 866, 733, 1, 0);
INSERT INTO `ptable_file` VALUES (16816, 866, 734, 1, 0);
INSERT INTO `ptable_file` VALUES (16817, 866, 735, 1, 0);
INSERT INTO `ptable_file` VALUES (16818, 866, 736, 1, 0);
INSERT INTO `ptable_file` VALUES (16819, 866, 737, 1, 0);
INSERT INTO `ptable_file` VALUES (16820, 866, 738, 1, 0);
INSERT INTO `ptable_file` VALUES (16821, 866, 739, 1, 0);
INSERT INTO `ptable_file` VALUES (16822, 866, 740, 1, 0);
INSERT INTO `ptable_file` VALUES (16824, 866, 742, 1, 0);
INSERT INTO `ptable_file` VALUES (16825, 858, 742, 2, 0);
INSERT INTO `ptable_file` VALUES (16826, 852, 742, 3, 0);
INSERT INTO `ptable_file` VALUES (16827, 862, 742, 4, 0);
INSERT INTO `ptable_file` VALUES (16828, 866, 743, 1, 0);
INSERT INTO `ptable_file` VALUES (16829, 866, 744, 1, 1);
INSERT INTO `ptable_file` VALUES (16830, 866, 745, 1, 0);
INSERT INTO `ptable_file` VALUES (16831, 866, 746, 1, 0);
INSERT INTO `ptable_file` VALUES (16832, 866, 747, 1, 0);
INSERT INTO `ptable_file` VALUES (16833, 929, 748, 1, 0);
INSERT INTO `ptable_file` VALUES (16840, 866, 750, 1, 0);
INSERT INTO `ptable_file` VALUES (16841, 858, 750, 2, 0);
INSERT INTO `ptable_file` VALUES (16842, 862, 750, 3, 0);
INSERT INTO `ptable_file` VALUES (16843, 851, 750, 4, 0);
INSERT INTO `ptable_file` VALUES (16844, 853, 750, 5, 0);
INSERT INTO `ptable_file` VALUES (16845, 866, 751, 1, 0);
INSERT INTO `ptable_file` VALUES (16846, 858, 751, 2, 0);
INSERT INTO `ptable_file` VALUES (16847, 862, 751, 3, 0);
INSERT INTO `ptable_file` VALUES (16848, 851, 751, 4, 0);
INSERT INTO `ptable_file` VALUES (16849, 853, 751, 5, 0);
INSERT INTO `ptable_file` VALUES (17146, 859, 753, 1, 0);
INSERT INTO `ptable_file` VALUES (17147, 862, 752, 1, 0);
INSERT INTO `ptable_file` VALUES (17148, 862, 752, 2, 0);
INSERT INTO `ptable_file` VALUES (17149, 862, 752, 3, 0);
INSERT INTO `ptable_file` VALUES (17150, 862, 752, 4, 0);
INSERT INTO `ptable_file` VALUES (17151, 862, 752, 5, 0);
INSERT INTO `ptable_file` VALUES (17152, 862, 752, 6, 0);
INSERT INTO `ptable_file` VALUES (17153, 862, 752, 7, 0);
INSERT INTO `ptable_file` VALUES (17154, 862, 752, 8, 0);
INSERT INTO `ptable_file` VALUES (17155, 862, 752, 9, 0);
INSERT INTO `ptable_file` VALUES (17156, 862, 752, 10, 0);
INSERT INTO `ptable_file` VALUES (17157, 862, 752, 11, 0);
INSERT INTO `ptable_file` VALUES (17654, 935, 756, 1, 1);
INSERT INTO `ptable_file` VALUES (17659, 934, 757, 1, 0);
INSERT INTO `ptable_file` VALUES (17660, 939, 757, 2, 0);
INSERT INTO `ptable_file` VALUES (17661, 862, 757, 3, 0);
INSERT INTO `ptable_file` VALUES (17671, 939, 758, 1, 1);
INSERT INTO `ptable_file` VALUES (17672, 862, 758, 2, 1);
INSERT INTO `ptable_file` VALUES (17677, 940, 759, 1, 0);
INSERT INTO `ptable_file` VALUES (17678, 939, 759, 2, 0);
INSERT INTO `ptable_file` VALUES (17679, 862, 759, 3, 0);
INSERT INTO `ptable_file` VALUES (17738, 935, 760, 1, 0);
INSERT INTO `ptable_file` VALUES (17970, 935, 761, 1, 0);
INSERT INTO `ptable_file` VALUES (17971, 939, 761, 2, 0);
INSERT INTO `ptable_file` VALUES (17972, 939, 761, 3, 0);
INSERT INTO `ptable_file` VALUES (17973, 940, 761, 4, 0);
INSERT INTO `ptable_file` VALUES (17974, 939, 761, 5, 0);
INSERT INTO `ptable_file` VALUES (18122, 935, 763, 1, 0);
INSERT INTO `ptable_file` VALUES (18123, 936, 763, 2, 0);
INSERT INTO `ptable_file` VALUES (18124, 933, 763, 3, 0);
INSERT INTO `ptable_file` VALUES (18125, 939, 763, 4, 0);
INSERT INTO `ptable_file` VALUES (18126, 938, 764, 1, 0);
INSERT INTO `ptable_file` VALUES (18127, 933, 764, 2, 0);
INSERT INTO `ptable_file` VALUES (18128, 934, 764, 3, 0);
INSERT INTO `ptable_file` VALUES (18129, 938, 764, 4, 0);
INSERT INTO `ptable_file` VALUES (18130, 940, 764, 5, 0);
INSERT INTO `ptable_file` VALUES (18131, 938, 764, 6, 0);
INSERT INTO `ptable_file` VALUES (18132, 939, 764, 7, 0);
INSERT INTO `ptable_file` VALUES (18133, 938, 764, 8, 0);
INSERT INTO `ptable_file` VALUES (18134, 938, 764, 9, 0);
INSERT INTO `ptable_file` VALUES (18135, 935, 764, 10, 0);
INSERT INTO `ptable_file` VALUES (18136, 938, 764, 11, 0);
INSERT INTO `ptable_file` VALUES (18137, 938, 764, 12, 0);
INSERT INTO `ptable_file` VALUES (18138, 933, 764, 13, 0);
INSERT INTO `ptable_file` VALUES (18139, 936, 764, 14, 0);
INSERT INTO `ptable_file` VALUES (18140, 938, 764, 15, 0);
INSERT INTO `ptable_file` VALUES (18141, 940, 764, 16, 0);
INSERT INTO `ptable_file` VALUES (18142, 939, 764, 17, 0);
INSERT INTO `ptable_file` VALUES (18143, 938, 764, 18, 0);
INSERT INTO `ptable_file` VALUES (18144, 940, 765, 1, 0);
INSERT INTO `ptable_file` VALUES (18145, 935, 765, 2, 0);
INSERT INTO `ptable_file` VALUES (18146, 936, 765, 3, 0);
INSERT INTO `ptable_file` VALUES (18147, 936, 765, 4, 0);
INSERT INTO `ptable_file` VALUES (18148, 936, 765, 5, 0);
INSERT INTO `ptable_file` VALUES (18149, 936, 765, 6, 0);
INSERT INTO `ptable_file` VALUES (18150, 937, 765, 7, 0);

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource`  (
  `resource_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `resource_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `resource_url` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `parent_name` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `resource_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`resource_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES (1, '登录', '/login', NULL, 'public', 0);
INSERT INTO `resource` VALUES (2, '系统管理权限', '/system', NULL, 'private', 0);
INSERT INTO `resource` VALUES (8, '浏览前台', '/front', NULL, 'public', 0);
INSERT INTO `resource` VALUES (11, '浏览地区', '/area', NULL, 'public', 0);
INSERT INTO `resource` VALUES (12, '用户管理', '/user', '', 'private', 0);
INSERT INTO `resource` VALUES (13, '文件管理', '/file', NULL, 'public', 0);
INSERT INTO `resource` VALUES (14, '公共权限', '/common', NULL, 'public', 0);
INSERT INTO `resource` VALUES (15, '播表审核权限', '/ptable', NULL, 'public', 0);
INSERT INTO `resource` VALUES (16, '素材审核权限', '/material', NULL, 'public', 0);
INSERT INTO `resource` VALUES (17, '时段管理', '/period', '', 'public', 0);
INSERT INTO `resource` VALUES (19, '用户管理', '/system/user/userList.do', '系统管理', NULL, 0);
INSERT INTO `resource` VALUES (20, '角色管理', '/system/role/roleList.do', '系统管理', NULL, 0);
INSERT INTO `resource` VALUES (21, '资源管理', '/system/resource/resourceList.do', '系统管理', NULL, 0);
INSERT INTO `resource` VALUES (22, '权限管理', '/system/role/authList.do', '系统管理', NULL, 0);
INSERT INTO `resource` VALUES (23, '系统日志', '/logController/sysLogList.do', '日志管理', NULL, 0);
INSERT INTO `resource` VALUES (24, '传输日志', '/logController/transferLogList.do', '日志管理', NULL, 0);
INSERT INTO `resource` VALUES (25, '心跳日志', '/logController/heartbeatLogList.do', '日志管理', NULL, 0);
INSERT INTO `resource` VALUES (26, '播放日志', '/logController/playLogList.do', '日志管理', NULL, 0);
INSERT INTO `resource` VALUES (27, '错误日志', '/logController/errorLogList.do', '日志管理', NULL, 0);
INSERT INTO `resource` VALUES (28, '播表管理', '/ptable/ptableList.do', '播放管理', NULL, 0);
INSERT INTO `resource` VALUES (29, '时段管理', '/period/periodList.do', '播放管理', NULL, 0);
INSERT INTO `resource` VALUES (30, '排播管理', '/material/broadcastList.do', '播放管理', NULL, 0);
INSERT INTO `resource` VALUES (31, '播放端管理', '/terminal/center.do', '终端管理', NULL, 0);
INSERT INTO `resource` VALUES (32, '终端连接管理', '/playerController/playCenter.do', '终端管理', NULL, 0);
INSERT INTO `resource` VALUES (33, '素材中心', '/material/materialList.do', '素材管理', NULL, 0);
INSERT INTO `resource` VALUES (34, '素材审核', '/material/checkList.do', '审核管理', NULL, 0);
INSERT INTO `resource` VALUES (35, '敏感素材', '/ptable/checkExcepList.do', '审核管理', NULL, 0);
INSERT INTO `resource` VALUES (36, '播表一级审核', '/ptable/ptableCheckFirstList.do', '审核管理', NULL, 0);
INSERT INTO `resource` VALUES (37, '排播有误', '/ptable/broadCheckList.do', '审核管理', NULL, 0);
INSERT INTO `resource` VALUES (38, '插播管理', '/ptable/goAddPtable.do', '播放管理', NULL, 0);
INSERT INTO `resource` VALUES (39, '素材上传', '/material/goUpload.do', '素材管理', NULL, 0);
INSERT INTO `resource` VALUES (40, '我的上传列表', '/material/myMaterialList.do', '素材管理', NULL, 0);
INSERT INTO `resource` VALUES (41, '进度条权限', '/progress', NULL, 'public', 0);
INSERT INTO `resource` VALUES (42, '播表二级审核', '/ptable/ptableCheckSecondList.do', '审核管理', NULL, 0);
INSERT INTO `resource` VALUES (43, '反审核素材', '/material/insteadMaterial.do', '反审核管理', NULL, 0);
INSERT INTO `resource` VALUES (44, '反审核播表', '/ptable/insteadPtable.do', '反审核管理', NULL, 0);
INSERT INTO `resource` VALUES (46, '统计报表', '/statistic/showReport.do', '统计管理', NULL, 0);
INSERT INTO `resource` VALUES (47, '浏览全部终端', '/terminal', '', 'private', 0);
INSERT INTO `resource` VALUES (48, '在线浏览视频', '/downloadController/showVedio.do', '', 'public', 0);
INSERT INTO `resource` VALUES (49, '操作日志', '/logController', NULL, 'private', 0);
INSERT INTO `resource` VALUES (50, '加载终端列表', '/terminal/getAllTerminal.do', NULL, 'public', 0);
INSERT INTO `resource` VALUES (51, '查询统计报表', '/statistic', NULL, 'private', 0);
INSERT INTO `resource` VALUES (52, '素材审计', '/audit/materialAudit.do', '审计管理', NULL, 0);
INSERT INTO `resource` VALUES (53, '节目审计', '/audit/itemAudit.do', '审计管理', NULL, 0);
INSERT INTO `resource` VALUES (54, '时段审计', '/audit/periodAudit.do', '审计管理', NULL, 0);
INSERT INTO `resource` VALUES (55, '播表审计', '/audit/ptableAudit.do', '审计管理', NULL, 0);
INSERT INTO `resource` VALUES (56, '系统审计', '/audit/systemAudit.do', '审计管理', NULL, 0);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `role_describe` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_date` datetime(0) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '系统管理员', '拥有最高权限', '2017-08-15 21:38:43', 0);
INSERT INTO `role` VALUES (3, '素材上传员', '上传素材', '2017-08-15 21:56:37', 0);
INSERT INTO `role` VALUES (4, '素材审核管理员', '审核素材视频', '2017-11-16 09:52:57', 0);
INSERT INTO `role` VALUES (6, '播表初审管理员', '初审播表', '2017-11-23 00:20:20', 0);
INSERT INTO `role` VALUES (7, '播表终审管理员', '终审播表', '2017-11-23 00:21:08', 0);
INSERT INTO `role` VALUES (10, '排播管理员', '填写素材播放信息及生成播表', '2017-12-26 00:49:40', 0);

-- ----------------------------
-- Table structure for role_resource
-- ----------------------------
DROP TABLE IF EXISTS `role_resource`;
CREATE TABLE `role_resource`  (
  `role_resource_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `resource_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`role_resource_id`) USING BTREE,
  INDEX `FK_Reference_4`(`resource_id`) USING BTREE,
  INDEX `FK_Reference_7`(`role_id`) USING BTREE,
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`resource_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 266 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_resource
-- ----------------------------
INSERT INTO `role_resource` VALUES (142, 33, 3, 0);
INSERT INTO `role_resource` VALUES (143, 39, 3, 0);
INSERT INTO `role_resource` VALUES (144, 40, 3, 0);
INSERT INTO `role_resource` VALUES (148, 28, 10, 0);
INSERT INTO `role_resource` VALUES (149, 29, 10, 0);
INSERT INTO `role_resource` VALUES (150, 30, 10, 0);
INSERT INTO `role_resource` VALUES (151, 33, 10, 0);
INSERT INTO `role_resource` VALUES (152, 37, 10, 0);
INSERT INTO `role_resource` VALUES (153, 38, 10, 0);
INSERT INTO `role_resource` VALUES (154, 46, 10, 0);
INSERT INTO `role_resource` VALUES (155, 33, 4, 0);
INSERT INTO `role_resource` VALUES (156, 34, 4, 0);
INSERT INTO `role_resource` VALUES (157, 43, 4, 0);
INSERT INTO `role_resource` VALUES (163, 36, 6, 0);
INSERT INTO `role_resource` VALUES (164, 42, 7, 0);
INSERT INTO `role_resource` VALUES (165, 44, 7, 0);
INSERT INTO `role_resource` VALUES (166, 50, 10, 0);
INSERT INTO `role_resource` VALUES (167, 51, 10, 0);
INSERT INTO `role_resource` VALUES (235, 19, 1, 0);
INSERT INTO `role_resource` VALUES (236, 20, 1, 0);
INSERT INTO `role_resource` VALUES (237, 21, 1, 0);
INSERT INTO `role_resource` VALUES (238, 22, 1, 0);
INSERT INTO `role_resource` VALUES (239, 23, 1, 0);
INSERT INTO `role_resource` VALUES (240, 24, 1, 0);
INSERT INTO `role_resource` VALUES (241, 25, 1, 0);
INSERT INTO `role_resource` VALUES (242, 26, 1, 0);
INSERT INTO `role_resource` VALUES (243, 27, 1, 0);
INSERT INTO `role_resource` VALUES (244, 28, 1, 0);
INSERT INTO `role_resource` VALUES (245, 29, 1, 0);
INSERT INTO `role_resource` VALUES (246, 30, 1, 0);
INSERT INTO `role_resource` VALUES (247, 31, 1, 0);
INSERT INTO `role_resource` VALUES (248, 32, 1, 0);
INSERT INTO `role_resource` VALUES (249, 33, 1, 0);
INSERT INTO `role_resource` VALUES (250, 34, 1, 0);
INSERT INTO `role_resource` VALUES (251, 35, 1, 0);
INSERT INTO `role_resource` VALUES (252, 36, 1, 0);
INSERT INTO `role_resource` VALUES (253, 37, 1, 0);
INSERT INTO `role_resource` VALUES (254, 38, 1, 0);
INSERT INTO `role_resource` VALUES (255, 39, 1, 0);
INSERT INTO `role_resource` VALUES (256, 40, 1, 0);
INSERT INTO `role_resource` VALUES (257, 42, 1, 0);
INSERT INTO `role_resource` VALUES (258, 43, 1, 0);
INSERT INTO `role_resource` VALUES (259, 44, 1, 0);
INSERT INTO `role_resource` VALUES (260, 46, 1, 0);
INSERT INTO `role_resource` VALUES (261, 52, 1, 0);
INSERT INTO `role_resource` VALUES (262, 53, 1, 0);
INSERT INTO `role_resource` VALUES (263, 54, 1, 0);
INSERT INTO `role_resource` VALUES (264, 55, 1, 0);
INSERT INTO `role_resource` VALUES (265, 56, 1, 0);

-- ----------------------------
-- Table structure for status
-- ----------------------------
DROP TABLE IF EXISTS `status`;
CREATE TABLE `status`  (
  `status_id` int(20) NOT NULL,
  `status_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`status_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of status
-- ----------------------------
INSERT INTO `status` VALUES (1, '未审核');
INSERT INTO `status` VALUES (2, '初级审核');
INSERT INTO `status` VALUES (3, '终级审核');
INSERT INTO `status` VALUES (4, '未通过审核');
INSERT INTO `status` VALUES (5, '异常播表素材排播信息');
INSERT INTO `status` VALUES (6, '异常播表素材敏感信息');
INSERT INTO `status` VALUES (7, '播表异常信息');

-- ----------------------------
-- Table structure for sys_area
-- ----------------------------
DROP TABLE IF EXISTS `sys_area`;
CREATE TABLE `sys_area`  (
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '行政区划编码',
  `parent_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '父级行政区划编码',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
  `province` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '省',
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '市',
  `district` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '县',
  `full_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '行政区划全称',
  `deleted` tinyint(1) DEFAULT 0 COMMENT '逻辑删除标志',
  PRIMARY KEY (`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '全国行政区划-省市县三级(2017版)' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_area
-- ----------------------------
INSERT INTO `sys_area` VALUES ('110000', '86', '北京市', '北京市', '', '', '北京市', 0);
INSERT INTO `sys_area` VALUES ('110100', '110000', '市辖区', '北京市', '市辖区', '', '北京市市辖区', 0);
INSERT INTO `sys_area` VALUES ('110101', '110100', '东城区', '北京市', '市辖区', '东城区', '北京市市辖区东城区', 0);
INSERT INTO `sys_area` VALUES ('110102', '110100', '西城区', '北京市', '市辖区', '西城区', '北京市市辖区西城区', 0);
INSERT INTO `sys_area` VALUES ('110105', '110100', '朝阳区', '北京市', '市辖区', '朝阳区', '北京市市辖区朝阳区', 0);
INSERT INTO `sys_area` VALUES ('110106', '110100', '丰台区', '北京市', '市辖区', '丰台区', '北京市市辖区丰台区', 0);
INSERT INTO `sys_area` VALUES ('110107', '110100', '石景山区', '北京市', '市辖区', '石景山区', '北京市市辖区石景山区', 0);
INSERT INTO `sys_area` VALUES ('110108', '110100', '海淀区', '北京市', '市辖区', '海淀区', '北京市市辖区海淀区', 0);
INSERT INTO `sys_area` VALUES ('110109', '110100', '门头沟区', '北京市', '市辖区', '门头沟区', '北京市市辖区门头沟区', 0);
INSERT INTO `sys_area` VALUES ('110111', '110100', '房山区', '北京市', '市辖区', '房山区', '北京市市辖区房山区', 0);
INSERT INTO `sys_area` VALUES ('110112', '110100', '通州区', '北京市', '市辖区', '通州区', '北京市市辖区通州区', 0);
INSERT INTO `sys_area` VALUES ('110113', '110100', '顺义区', '北京市', '市辖区', '顺义区', '北京市市辖区顺义区', 0);
INSERT INTO `sys_area` VALUES ('110114', '110100', '昌平区', '北京市', '市辖区', '昌平区', '北京市市辖区昌平区', 0);
INSERT INTO `sys_area` VALUES ('110115', '110100', '大兴区', '北京市', '市辖区', '大兴区', '北京市市辖区大兴区', 0);
INSERT INTO `sys_area` VALUES ('110116', '110100', '怀柔区', '北京市', '市辖区', '怀柔区', '北京市市辖区怀柔区', 0);
INSERT INTO `sys_area` VALUES ('110117', '110100', '平谷区', '北京市', '市辖区', '平谷区', '北京市市辖区平谷区', 0);
INSERT INTO `sys_area` VALUES ('110118', '110100', '密云区', '北京市', '市辖区', '密云区', '北京市市辖区密云区', 0);
INSERT INTO `sys_area` VALUES ('110119', '110100', '延庆区', '北京市', '市辖区', '延庆区', '北京市市辖区延庆区', 0);
INSERT INTO `sys_area` VALUES ('120000', '86', '天津市', '天津市', '', '', '天津市', 0);
INSERT INTO `sys_area` VALUES ('120100', '120000', '市辖区', '天津市', '市辖区', '', '天津市市辖区', 0);
INSERT INTO `sys_area` VALUES ('120101', '120100', '和平区', '天津市', '市辖区', '和平区', '天津市市辖区和平区', 0);
INSERT INTO `sys_area` VALUES ('120102', '120100', '河东区', '天津市', '市辖区', '河东区', '天津市市辖区河东区', 0);
INSERT INTO `sys_area` VALUES ('120103', '120100', '河西区', '天津市', '市辖区', '河西区', '天津市市辖区河西区', 0);
INSERT INTO `sys_area` VALUES ('120104', '120100', '南开区', '天津市', '市辖区', '南开区', '天津市市辖区南开区', 0);
INSERT INTO `sys_area` VALUES ('120105', '120100', '河北区', '天津市', '市辖区', '河北区', '天津市市辖区河北区', 0);
INSERT INTO `sys_area` VALUES ('120106', '120100', '红桥区', '天津市', '市辖区', '红桥区', '天津市市辖区红桥区', 0);
INSERT INTO `sys_area` VALUES ('120110', '120100', '东丽区', '天津市', '市辖区', '东丽区', '天津市市辖区东丽区', 0);
INSERT INTO `sys_area` VALUES ('120111', '120100', '西青区', '天津市', '市辖区', '西青区', '天津市市辖区西青区', 0);
INSERT INTO `sys_area` VALUES ('120112', '120100', '津南区', '天津市', '市辖区', '津南区', '天津市市辖区津南区', 0);
INSERT INTO `sys_area` VALUES ('120113', '120100', '北辰区', '天津市', '市辖区', '北辰区', '天津市市辖区北辰区', 0);
INSERT INTO `sys_area` VALUES ('120114', '120100', '武清区', '天津市', '市辖区', '武清区', '天津市市辖区武清区', 0);
INSERT INTO `sys_area` VALUES ('120115', '120100', '宝坻区', '天津市', '市辖区', '宝坻区', '天津市市辖区宝坻区', 0);
INSERT INTO `sys_area` VALUES ('120116', '120100', '滨海新区', '天津市', '市辖区', '滨海新区', '天津市市辖区滨海新区', 0);
INSERT INTO `sys_area` VALUES ('120117', '120100', '宁河区', '天津市', '市辖区', '宁河区', '天津市市辖区宁河区', 0);
INSERT INTO `sys_area` VALUES ('120118', '120100', '静海区', '天津市', '市辖区', '静海区', '天津市市辖区静海区', 0);
INSERT INTO `sys_area` VALUES ('120119', '120100', '蓟州区', '天津市', '市辖区', '蓟州区', '天津市市辖区蓟州区', 0);
INSERT INTO `sys_area` VALUES ('130000', '86', '河北省', '河北省', '', '', '河北省', 0);
INSERT INTO `sys_area` VALUES ('130100', '130000', '石家庄市', '河北省', '石家庄市', '', '河北省石家庄市', 0);
INSERT INTO `sys_area` VALUES ('130101', '130100', '市辖区', '河北省', '石家庄市', '市辖区', '河北省石家庄市市辖区', 0);
INSERT INTO `sys_area` VALUES ('130102', '130100', '长安区', '河北省', '石家庄市', '长安区', '河北省石家庄市长安区', 0);
INSERT INTO `sys_area` VALUES ('130104', '130100', '桥西区', '河北省', '石家庄市', '桥西区', '河北省石家庄市桥西区', 0);
INSERT INTO `sys_area` VALUES ('130105', '130100', '新华区', '河北省', '石家庄市', '新华区', '河北省石家庄市新华区', 0);
INSERT INTO `sys_area` VALUES ('130107', '130100', '井陉矿区', '河北省', '石家庄市', '井陉矿区', '河北省石家庄市井陉矿区', 0);
INSERT INTO `sys_area` VALUES ('130108', '130100', '裕华区', '河北省', '石家庄市', '裕华区', '河北省石家庄市裕华区', 0);
INSERT INTO `sys_area` VALUES ('130109', '130100', '藁城区', '河北省', '石家庄市', '藁城区', '河北省石家庄市藁城区', 0);
INSERT INTO `sys_area` VALUES ('130110', '130100', '鹿泉区', '河北省', '石家庄市', '鹿泉区', '河北省石家庄市鹿泉区', 0);
INSERT INTO `sys_area` VALUES ('130111', '130100', '栾城区', '河北省', '石家庄市', '栾城区', '河北省石家庄市栾城区', 0);
INSERT INTO `sys_area` VALUES ('130121', '130100', '井陉县', '河北省', '石家庄市', '井陉县', '河北省石家庄市井陉县', 0);
INSERT INTO `sys_area` VALUES ('130123', '130100', '正定县', '河北省', '石家庄市', '正定县', '河北省石家庄市正定县', 0);
INSERT INTO `sys_area` VALUES ('130125', '130100', '行唐县', '河北省', '石家庄市', '行唐县', '河北省石家庄市行唐县', 0);
INSERT INTO `sys_area` VALUES ('130126', '130100', '灵寿县', '河北省', '石家庄市', '灵寿县', '河北省石家庄市灵寿县', 0);
INSERT INTO `sys_area` VALUES ('130127', '130100', '高邑县', '河北省', '石家庄市', '高邑县', '河北省石家庄市高邑县', 0);
INSERT INTO `sys_area` VALUES ('130128', '130100', '深泽县', '河北省', '石家庄市', '深泽县', '河北省石家庄市深泽县', 0);
INSERT INTO `sys_area` VALUES ('130129', '130100', '赞皇县', '河北省', '石家庄市', '赞皇县', '河北省石家庄市赞皇县', 0);
INSERT INTO `sys_area` VALUES ('130130', '130100', '无极县', '河北省', '石家庄市', '无极县', '河北省石家庄市无极县', 0);
INSERT INTO `sys_area` VALUES ('130131', '130100', '平山县', '河北省', '石家庄市', '平山县', '河北省石家庄市平山县', 0);
INSERT INTO `sys_area` VALUES ('130132', '130100', '元氏县', '河北省', '石家庄市', '元氏县', '河北省石家庄市元氏县', 0);
INSERT INTO `sys_area` VALUES ('130133', '130100', '赵县', '河北省', '石家庄市', '赵县', '河北省石家庄市赵县', 0);
INSERT INTO `sys_area` VALUES ('130183', '130100', '晋州市', '河北省', '石家庄市', '晋州市', '河北省石家庄市晋州市', 0);
INSERT INTO `sys_area` VALUES ('130184', '130100', '新乐市', '河北省', '石家庄市', '新乐市', '河北省石家庄市新乐市', 0);
INSERT INTO `sys_area` VALUES ('130200', '130000', '唐山市', '河北省', '唐山市', '', '河北省唐山市', 0);
INSERT INTO `sys_area` VALUES ('130201', '130200', '市辖区', '河北省', '唐山市', '市辖区', '河北省唐山市市辖区', 0);
INSERT INTO `sys_area` VALUES ('130202', '130200', '路南区', '河北省', '唐山市', '路南区', '河北省唐山市路南区', 0);
INSERT INTO `sys_area` VALUES ('130203', '130200', '路北区', '河北省', '唐山市', '路北区', '河北省唐山市路北区', 0);
INSERT INTO `sys_area` VALUES ('130204', '130200', '古冶区', '河北省', '唐山市', '古冶区', '河北省唐山市古冶区', 0);
INSERT INTO `sys_area` VALUES ('130205', '130200', '开平区', '河北省', '唐山市', '开平区', '河北省唐山市开平区', 0);
INSERT INTO `sys_area` VALUES ('130207', '130200', '丰南区', '河北省', '唐山市', '丰南区', '河北省唐山市丰南区', 0);
INSERT INTO `sys_area` VALUES ('130208', '130200', '丰润区', '河北省', '唐山市', '丰润区', '河北省唐山市丰润区', 0);
INSERT INTO `sys_area` VALUES ('130209', '130200', '曹妃甸区', '河北省', '唐山市', '曹妃甸区', '河北省唐山市曹妃甸区', 0);
INSERT INTO `sys_area` VALUES ('130223', '130200', '滦县', '河北省', '唐山市', '滦县', '河北省唐山市滦县', 0);
INSERT INTO `sys_area` VALUES ('130224', '130200', '滦南县', '河北省', '唐山市', '滦南县', '河北省唐山市滦南县', 0);
INSERT INTO `sys_area` VALUES ('130225', '130200', '乐亭县', '河北省', '唐山市', '乐亭县', '河北省唐山市乐亭县', 0);
INSERT INTO `sys_area` VALUES ('130227', '130200', '迁西县', '河北省', '唐山市', '迁西县', '河北省唐山市迁西县', 0);
INSERT INTO `sys_area` VALUES ('130229', '130200', '玉田县', '河北省', '唐山市', '玉田县', '河北省唐山市玉田县', 0);
INSERT INTO `sys_area` VALUES ('130281', '130200', '遵化市', '河北省', '唐山市', '遵化市', '河北省唐山市遵化市', 0);
INSERT INTO `sys_area` VALUES ('130283', '130200', '迁安市', '河北省', '唐山市', '迁安市', '河北省唐山市迁安市', 0);
INSERT INTO `sys_area` VALUES ('130300', '130000', '秦皇岛市', '河北省', '秦皇岛市', '', '河北省秦皇岛市', 0);
INSERT INTO `sys_area` VALUES ('130301', '130300', '市辖区', '河北省', '秦皇岛市', '市辖区', '河北省秦皇岛市市辖区', 0);
INSERT INTO `sys_area` VALUES ('130302', '130300', '海港区', '河北省', '秦皇岛市', '海港区', '河北省秦皇岛市海港区', 0);
INSERT INTO `sys_area` VALUES ('130303', '130300', '山海关区', '河北省', '秦皇岛市', '山海关区', '河北省秦皇岛市山海关区', 0);
INSERT INTO `sys_area` VALUES ('130304', '130300', '北戴河区', '河北省', '秦皇岛市', '北戴河区', '河北省秦皇岛市北戴河区', 0);
INSERT INTO `sys_area` VALUES ('130306', '130300', '抚宁区', '河北省', '秦皇岛市', '抚宁区', '河北省秦皇岛市抚宁区', 0);
INSERT INTO `sys_area` VALUES ('130321', '130300', '青龙满族自治县', '河北省', '秦皇岛市', '青龙满族自治县', '河北省秦皇岛市青龙满族自治县', 0);
INSERT INTO `sys_area` VALUES ('130322', '130300', '昌黎县', '河北省', '秦皇岛市', '昌黎县', '河北省秦皇岛市昌黎县', 0);
INSERT INTO `sys_area` VALUES ('130324', '130300', '卢龙县', '河北省', '秦皇岛市', '卢龙县', '河北省秦皇岛市卢龙县', 0);
INSERT INTO `sys_area` VALUES ('130400', '130000', '邯郸市', '河北省', '邯郸市', '', '河北省邯郸市', 0);
INSERT INTO `sys_area` VALUES ('130401', '130400', '市辖区', '河北省', '邯郸市', '市辖区', '河北省邯郸市市辖区', 0);
INSERT INTO `sys_area` VALUES ('130402', '130400', '邯山区', '河北省', '邯郸市', '邯山区', '河北省邯郸市邯山区', 0);
INSERT INTO `sys_area` VALUES ('130403', '130400', '丛台区', '河北省', '邯郸市', '丛台区', '河北省邯郸市丛台区', 0);
INSERT INTO `sys_area` VALUES ('130404', '130400', '复兴区', '河北省', '邯郸市', '复兴区', '河北省邯郸市复兴区', 0);
INSERT INTO `sys_area` VALUES ('130406', '130400', '峰峰矿区', '河北省', '邯郸市', '峰峰矿区', '河北省邯郸市峰峰矿区', 0);
INSERT INTO `sys_area` VALUES ('130421', '130400', '邯郸县', '河北省', '邯郸市', '邯郸县', '河北省邯郸市邯郸县', 0);
INSERT INTO `sys_area` VALUES ('130423', '130400', '临漳县', '河北省', '邯郸市', '临漳县', '河北省邯郸市临漳县', 0);
INSERT INTO `sys_area` VALUES ('130424', '130400', '成安县', '河北省', '邯郸市', '成安县', '河北省邯郸市成安县', 0);
INSERT INTO `sys_area` VALUES ('130425', '130400', '大名县', '河北省', '邯郸市', '大名县', '河北省邯郸市大名县', 0);
INSERT INTO `sys_area` VALUES ('130426', '130400', '涉县', '河北省', '邯郸市', '涉县', '河北省邯郸市涉县', 0);
INSERT INTO `sys_area` VALUES ('130427', '130400', '磁县', '河北省', '邯郸市', '磁县', '河北省邯郸市磁县', 0);
INSERT INTO `sys_area` VALUES ('130428', '130400', '肥乡县', '河北省', '邯郸市', '肥乡县', '河北省邯郸市肥乡县', 0);
INSERT INTO `sys_area` VALUES ('130429', '130400', '永年县', '河北省', '邯郸市', '永年县', '河北省邯郸市永年县', 0);
INSERT INTO `sys_area` VALUES ('130430', '130400', '邱县', '河北省', '邯郸市', '邱县', '河北省邯郸市邱县', 0);
INSERT INTO `sys_area` VALUES ('130431', '130400', '鸡泽县', '河北省', '邯郸市', '鸡泽县', '河北省邯郸市鸡泽县', 0);
INSERT INTO `sys_area` VALUES ('130432', '130400', '广平县', '河北省', '邯郸市', '广平县', '河北省邯郸市广平县', 0);
INSERT INTO `sys_area` VALUES ('130433', '130400', '馆陶县', '河北省', '邯郸市', '馆陶县', '河北省邯郸市馆陶县', 0);
INSERT INTO `sys_area` VALUES ('130434', '130400', '魏县', '河北省', '邯郸市', '魏县', '河北省邯郸市魏县', 0);
INSERT INTO `sys_area` VALUES ('130435', '130400', '曲周县', '河北省', '邯郸市', '曲周县', '河北省邯郸市曲周县', 0);
INSERT INTO `sys_area` VALUES ('130481', '130400', '武安市', '河北省', '邯郸市', '武安市', '河北省邯郸市武安市', 0);
INSERT INTO `sys_area` VALUES ('130500', '130000', '邢台市', '河北省', '邢台市', '', '河北省邢台市', 0);
INSERT INTO `sys_area` VALUES ('130501', '130500', '市辖区', '河北省', '邢台市', '市辖区', '河北省邢台市市辖区', 0);
INSERT INTO `sys_area` VALUES ('130502', '130500', '桥东区', '河北省', '邢台市', '桥东区', '河北省邢台市桥东区', 0);
INSERT INTO `sys_area` VALUES ('130503', '130500', '桥西区', '河北省', '邢台市', '桥西区', '河北省邢台市桥西区', 0);
INSERT INTO `sys_area` VALUES ('130521', '130500', '邢台县', '河北省', '邢台市', '邢台县', '河北省邢台市邢台县', 0);
INSERT INTO `sys_area` VALUES ('130522', '130500', '临城县', '河北省', '邢台市', '临城县', '河北省邢台市临城县', 0);
INSERT INTO `sys_area` VALUES ('130523', '130500', '内丘县', '河北省', '邢台市', '内丘县', '河北省邢台市内丘县', 0);
INSERT INTO `sys_area` VALUES ('130524', '130500', '柏乡县', '河北省', '邢台市', '柏乡县', '河北省邢台市柏乡县', 0);
INSERT INTO `sys_area` VALUES ('130525', '130500', '隆尧县', '河北省', '邢台市', '隆尧县', '河北省邢台市隆尧县', 0);
INSERT INTO `sys_area` VALUES ('130526', '130500', '任县', '河北省', '邢台市', '任县', '河北省邢台市任县', 0);
INSERT INTO `sys_area` VALUES ('130527', '130500', '南和县', '河北省', '邢台市', '南和县', '河北省邢台市南和县', 0);
INSERT INTO `sys_area` VALUES ('130528', '130500', '宁晋县', '河北省', '邢台市', '宁晋县', '河北省邢台市宁晋县', 0);
INSERT INTO `sys_area` VALUES ('130529', '130500', '巨鹿县', '河北省', '邢台市', '巨鹿县', '河北省邢台市巨鹿县', 0);
INSERT INTO `sys_area` VALUES ('130530', '130500', '新河县', '河北省', '邢台市', '新河县', '河北省邢台市新河县', 0);
INSERT INTO `sys_area` VALUES ('130531', '130500', '广宗县', '河北省', '邢台市', '广宗县', '河北省邢台市广宗县', 0);
INSERT INTO `sys_area` VALUES ('130532', '130500', '平乡县', '河北省', '邢台市', '平乡县', '河北省邢台市平乡县', 0);
INSERT INTO `sys_area` VALUES ('130533', '130500', '威县', '河北省', '邢台市', '威县', '河北省邢台市威县', 0);
INSERT INTO `sys_area` VALUES ('130534', '130500', '清河县', '河北省', '邢台市', '清河县', '河北省邢台市清河县', 0);
INSERT INTO `sys_area` VALUES ('130535', '130500', '临西县', '河北省', '邢台市', '临西县', '河北省邢台市临西县', 0);
INSERT INTO `sys_area` VALUES ('130581', '130500', '南宫市', '河北省', '邢台市', '南宫市', '河北省邢台市南宫市', 0);
INSERT INTO `sys_area` VALUES ('130582', '130500', '沙河市', '河北省', '邢台市', '沙河市', '河北省邢台市沙河市', 0);
INSERT INTO `sys_area` VALUES ('130600', '130000', '保定市', '河北省', '保定市', '', '河北省保定市', 0);
INSERT INTO `sys_area` VALUES ('130601', '130600', '市辖区', '河北省', '保定市', '市辖区', '河北省保定市市辖区', 0);
INSERT INTO `sys_area` VALUES ('130602', '130600', '竞秀区', '河北省', '保定市', '竞秀区', '河北省保定市竞秀区', 0);
INSERT INTO `sys_area` VALUES ('130606', '130600', '莲池区', '河北省', '保定市', '莲池区', '河北省保定市莲池区', 0);
INSERT INTO `sys_area` VALUES ('130607', '130600', '满城区', '河北省', '保定市', '满城区', '河北省保定市满城区', 0);
INSERT INTO `sys_area` VALUES ('130608', '130600', '清苑区', '河北省', '保定市', '清苑区', '河北省保定市清苑区', 0);
INSERT INTO `sys_area` VALUES ('130609', '130600', '徐水区', '河北省', '保定市', '徐水区', '河北省保定市徐水区', 0);
INSERT INTO `sys_area` VALUES ('130623', '130600', '涞水县', '河北省', '保定市', '涞水县', '河北省保定市涞水县', 0);
INSERT INTO `sys_area` VALUES ('130624', '130600', '阜平县', '河北省', '保定市', '阜平县', '河北省保定市阜平县', 0);
INSERT INTO `sys_area` VALUES ('130626', '130600', '定兴县', '河北省', '保定市', '定兴县', '河北省保定市定兴县', 0);
INSERT INTO `sys_area` VALUES ('130627', '130600', '唐县', '河北省', '保定市', '唐县', '河北省保定市唐县', 0);
INSERT INTO `sys_area` VALUES ('130628', '130600', '高阳县', '河北省', '保定市', '高阳县', '河北省保定市高阳县', 0);
INSERT INTO `sys_area` VALUES ('130629', '130600', '容城县', '河北省', '保定市', '容城县', '河北省保定市容城县', 0);
INSERT INTO `sys_area` VALUES ('130630', '130600', '涞源县', '河北省', '保定市', '涞源县', '河北省保定市涞源县', 0);
INSERT INTO `sys_area` VALUES ('130631', '130600', '望都县', '河北省', '保定市', '望都县', '河北省保定市望都县', 0);
INSERT INTO `sys_area` VALUES ('130632', '130600', '安新县', '河北省', '保定市', '安新县', '河北省保定市安新县', 0);
INSERT INTO `sys_area` VALUES ('130633', '130600', '易县', '河北省', '保定市', '易县', '河北省保定市易县', 0);
INSERT INTO `sys_area` VALUES ('130634', '130600', '曲阳县', '河北省', '保定市', '曲阳县', '河北省保定市曲阳县', 0);
INSERT INTO `sys_area` VALUES ('130635', '130600', '蠡县', '河北省', '保定市', '蠡县', '河北省保定市蠡县', 0);
INSERT INTO `sys_area` VALUES ('130636', '130600', '顺平县', '河北省', '保定市', '顺平县', '河北省保定市顺平县', 0);
INSERT INTO `sys_area` VALUES ('130637', '130600', '博野县', '河北省', '保定市', '博野县', '河北省保定市博野县', 0);
INSERT INTO `sys_area` VALUES ('130638', '130600', '雄县', '河北省', '保定市', '雄县', '河北省保定市雄县', 0);
INSERT INTO `sys_area` VALUES ('130681', '130600', '涿州市', '河北省', '保定市', '涿州市', '河北省保定市涿州市', 0);
INSERT INTO `sys_area` VALUES ('130683', '130600', '安国市', '河北省', '保定市', '安国市', '河北省保定市安国市', 0);
INSERT INTO `sys_area` VALUES ('130684', '130600', '高碑店市', '河北省', '保定市', '高碑店市', '河北省保定市高碑店市', 0);
INSERT INTO `sys_area` VALUES ('130700', '130000', '张家口市', '河北省', '张家口市', '', '河北省张家口市', 0);
INSERT INTO `sys_area` VALUES ('130701', '130700', '市辖区', '河北省', '张家口市', '市辖区', '河北省张家口市市辖区', 0);
INSERT INTO `sys_area` VALUES ('130702', '130700', '桥东区', '河北省', '张家口市', '桥东区', '河北省张家口市桥东区', 0);
INSERT INTO `sys_area` VALUES ('130703', '130700', '桥西区', '河北省', '张家口市', '桥西区', '河北省张家口市桥西区', 0);
INSERT INTO `sys_area` VALUES ('130705', '130700', '宣化区', '河北省', '张家口市', '宣化区', '河北省张家口市宣化区', 0);
INSERT INTO `sys_area` VALUES ('130706', '130700', '下花园区', '河北省', '张家口市', '下花园区', '河北省张家口市下花园区', 0);
INSERT INTO `sys_area` VALUES ('130708', '130700', '万全区', '河北省', '张家口市', '万全区', '河北省张家口市万全区', 0);
INSERT INTO `sys_area` VALUES ('130709', '130700', '崇礼区', '河北省', '张家口市', '崇礼区', '河北省张家口市崇礼区', 0);
INSERT INTO `sys_area` VALUES ('130722', '130700', '张北县', '河北省', '张家口市', '张北县', '河北省张家口市张北县', 0);
INSERT INTO `sys_area` VALUES ('130723', '130700', '康保县', '河北省', '张家口市', '康保县', '河北省张家口市康保县', 0);
INSERT INTO `sys_area` VALUES ('130724', '130700', '沽源县', '河北省', '张家口市', '沽源县', '河北省张家口市沽源县', 0);
INSERT INTO `sys_area` VALUES ('130725', '130700', '尚义县', '河北省', '张家口市', '尚义县', '河北省张家口市尚义县', 0);
INSERT INTO `sys_area` VALUES ('130726', '130700', '蔚县', '河北省', '张家口市', '蔚县', '河北省张家口市蔚县', 0);
INSERT INTO `sys_area` VALUES ('130727', '130700', '阳原县', '河北省', '张家口市', '阳原县', '河北省张家口市阳原县', 0);
INSERT INTO `sys_area` VALUES ('130728', '130700', '怀安县', '河北省', '张家口市', '怀安县', '河北省张家口市怀安县', 0);
INSERT INTO `sys_area` VALUES ('130730', '130700', '怀来县', '河北省', '张家口市', '怀来县', '河北省张家口市怀来县', 0);
INSERT INTO `sys_area` VALUES ('130731', '130700', '涿鹿县', '河北省', '张家口市', '涿鹿县', '河北省张家口市涿鹿县', 0);
INSERT INTO `sys_area` VALUES ('130732', '130700', '赤城县', '河北省', '张家口市', '赤城县', '河北省张家口市赤城县', 0);
INSERT INTO `sys_area` VALUES ('130800', '130000', '承德市', '河北省', '承德市', '', '河北省承德市', 0);
INSERT INTO `sys_area` VALUES ('130801', '130800', '市辖区', '河北省', '承德市', '市辖区', '河北省承德市市辖区', 0);
INSERT INTO `sys_area` VALUES ('130802', '130800', '双桥区', '河北省', '承德市', '双桥区', '河北省承德市双桥区', 0);
INSERT INTO `sys_area` VALUES ('130803', '130800', '双滦区', '河北省', '承德市', '双滦区', '河北省承德市双滦区', 0);
INSERT INTO `sys_area` VALUES ('130804', '130800', '鹰手营子矿区', '河北省', '承德市', '鹰手营子矿区', '河北省承德市鹰手营子矿区', 0);
INSERT INTO `sys_area` VALUES ('130821', '130800', '承德县', '河北省', '承德市', '承德县', '河北省承德市承德县', 0);
INSERT INTO `sys_area` VALUES ('130822', '130800', '兴隆县', '河北省', '承德市', '兴隆县', '河北省承德市兴隆县', 0);
INSERT INTO `sys_area` VALUES ('130823', '130800', '平泉县', '河北省', '承德市', '平泉县', '河北省承德市平泉县', 0);
INSERT INTO `sys_area` VALUES ('130824', '130800', '滦平县', '河北省', '承德市', '滦平县', '河北省承德市滦平县', 0);
INSERT INTO `sys_area` VALUES ('130825', '130800', '隆化县', '河北省', '承德市', '隆化县', '河北省承德市隆化县', 0);
INSERT INTO `sys_area` VALUES ('130826', '130800', '丰宁满族自治县', '河北省', '承德市', '丰宁满族自治县', '河北省承德市丰宁满族自治县', 0);
INSERT INTO `sys_area` VALUES ('130827', '130800', '宽城满族自治县', '河北省', '承德市', '宽城满族自治县', '河北省承德市宽城满族自治县', 0);
INSERT INTO `sys_area` VALUES ('130828', '130800', '围场满族蒙古族自治县', '河北省', '承德市', '围场满族蒙古族自治县', '河北省承德市围场满族蒙古族自治县', 0);
INSERT INTO `sys_area` VALUES ('130900', '130000', '沧州市', '河北省', '沧州市', '', '河北省沧州市', 0);
INSERT INTO `sys_area` VALUES ('130901', '130900', '市辖区', '河北省', '沧州市', '市辖区', '河北省沧州市市辖区', 0);
INSERT INTO `sys_area` VALUES ('130902', '130900', '新华区', '河北省', '沧州市', '新华区', '河北省沧州市新华区', 0);
INSERT INTO `sys_area` VALUES ('130903', '130900', '运河区', '河北省', '沧州市', '运河区', '河北省沧州市运河区', 0);
INSERT INTO `sys_area` VALUES ('130921', '130900', '沧县', '河北省', '沧州市', '沧县', '河北省沧州市沧县', 0);
INSERT INTO `sys_area` VALUES ('130922', '130900', '青县', '河北省', '沧州市', '青县', '河北省沧州市青县', 0);
INSERT INTO `sys_area` VALUES ('130923', '130900', '东光县', '河北省', '沧州市', '东光县', '河北省沧州市东光县', 0);
INSERT INTO `sys_area` VALUES ('130924', '130900', '海兴县', '河北省', '沧州市', '海兴县', '河北省沧州市海兴县', 0);
INSERT INTO `sys_area` VALUES ('130925', '130900', '盐山县', '河北省', '沧州市', '盐山县', '河北省沧州市盐山县', 0);
INSERT INTO `sys_area` VALUES ('130926', '130900', '肃宁县', '河北省', '沧州市', '肃宁县', '河北省沧州市肃宁县', 0);
INSERT INTO `sys_area` VALUES ('130927', '130900', '南皮县', '河北省', '沧州市', '南皮县', '河北省沧州市南皮县', 0);
INSERT INTO `sys_area` VALUES ('130928', '130900', '吴桥县', '河北省', '沧州市', '吴桥县', '河北省沧州市吴桥县', 0);
INSERT INTO `sys_area` VALUES ('130929', '130900', '献县', '河北省', '沧州市', '献县', '河北省沧州市献县', 0);
INSERT INTO `sys_area` VALUES ('130930', '130900', '孟村回族自治县', '河北省', '沧州市', '孟村回族自治县', '河北省沧州市孟村回族自治县', 0);
INSERT INTO `sys_area` VALUES ('130981', '130900', '泊头市', '河北省', '沧州市', '泊头市', '河北省沧州市泊头市', 0);
INSERT INTO `sys_area` VALUES ('130982', '130900', '任丘市', '河北省', '沧州市', '任丘市', '河北省沧州市任丘市', 0);
INSERT INTO `sys_area` VALUES ('130983', '130900', '黄骅市', '河北省', '沧州市', '黄骅市', '河北省沧州市黄骅市', 0);
INSERT INTO `sys_area` VALUES ('130984', '130900', '河间市', '河北省', '沧州市', '河间市', '河北省沧州市河间市', 0);
INSERT INTO `sys_area` VALUES ('131000', '130000', '廊坊市', '河北省', '廊坊市', '', '河北省廊坊市', 0);
INSERT INTO `sys_area` VALUES ('131001', '131000', '市辖区', '河北省', '廊坊市', '市辖区', '河北省廊坊市市辖区', 0);
INSERT INTO `sys_area` VALUES ('131002', '131000', '安次区', '河北省', '廊坊市', '安次区', '河北省廊坊市安次区', 0);
INSERT INTO `sys_area` VALUES ('131003', '131000', '广阳区', '河北省', '廊坊市', '广阳区', '河北省廊坊市广阳区', 0);
INSERT INTO `sys_area` VALUES ('131022', '131000', '固安县', '河北省', '廊坊市', '固安县', '河北省廊坊市固安县', 0);
INSERT INTO `sys_area` VALUES ('131023', '131000', '永清县', '河北省', '廊坊市', '永清县', '河北省廊坊市永清县', 0);
INSERT INTO `sys_area` VALUES ('131024', '131000', '香河县', '河北省', '廊坊市', '香河县', '河北省廊坊市香河县', 0);
INSERT INTO `sys_area` VALUES ('131025', '131000', '大城县', '河北省', '廊坊市', '大城县', '河北省廊坊市大城县', 0);
INSERT INTO `sys_area` VALUES ('131026', '131000', '文安县', '河北省', '廊坊市', '文安县', '河北省廊坊市文安县', 0);
INSERT INTO `sys_area` VALUES ('131028', '131000', '大厂回族自治县', '河北省', '廊坊市', '大厂回族自治县', '河北省廊坊市大厂回族自治县', 0);
INSERT INTO `sys_area` VALUES ('131081', '131000', '霸州市', '河北省', '廊坊市', '霸州市', '河北省廊坊市霸州市', 0);
INSERT INTO `sys_area` VALUES ('131082', '131000', '三河市', '河北省', '廊坊市', '三河市', '河北省廊坊市三河市', 0);
INSERT INTO `sys_area` VALUES ('131100', '130000', '衡水市', '河北省', '衡水市', '', '河北省衡水市', 0);
INSERT INTO `sys_area` VALUES ('131101', '131100', '市辖区', '河北省', '衡水市', '市辖区', '河北省衡水市市辖区', 0);
INSERT INTO `sys_area` VALUES ('131102', '131100', '桃城区', '河北省', '衡水市', '桃城区', '河北省衡水市桃城区', 0);
INSERT INTO `sys_area` VALUES ('131103', '131100', '冀州区', '河北省', '衡水市', '冀州区', '河北省衡水市冀州区', 0);
INSERT INTO `sys_area` VALUES ('131121', '131100', '枣强县', '河北省', '衡水市', '枣强县', '河北省衡水市枣强县', 0);
INSERT INTO `sys_area` VALUES ('131122', '131100', '武邑县', '河北省', '衡水市', '武邑县', '河北省衡水市武邑县', 0);
INSERT INTO `sys_area` VALUES ('131123', '131100', '武强县', '河北省', '衡水市', '武强县', '河北省衡水市武强县', 0);
INSERT INTO `sys_area` VALUES ('131124', '131100', '饶阳县', '河北省', '衡水市', '饶阳县', '河北省衡水市饶阳县', 0);
INSERT INTO `sys_area` VALUES ('131125', '131100', '安平县', '河北省', '衡水市', '安平县', '河北省衡水市安平县', 0);
INSERT INTO `sys_area` VALUES ('131126', '131100', '故城县', '河北省', '衡水市', '故城县', '河北省衡水市故城县', 0);
INSERT INTO `sys_area` VALUES ('131127', '131100', '景县', '河北省', '衡水市', '景县', '河北省衡水市景县', 0);
INSERT INTO `sys_area` VALUES ('131128', '131100', '阜城县', '河北省', '衡水市', '阜城县', '河北省衡水市阜城县', 0);
INSERT INTO `sys_area` VALUES ('131182', '131100', '深州市', '河北省', '衡水市', '深州市', '河北省衡水市深州市', 0);
INSERT INTO `sys_area` VALUES ('139000', '130000', '省直辖县级行政区划', '河北省', '省直辖县级行政区划', '', '河北省省直辖县级行政区划', 0);
INSERT INTO `sys_area` VALUES ('139001', '139000', '定州市', '河北省', '省直辖县级行政区划', '定州市', '河北省省直辖县级行政区划定州市', 0);
INSERT INTO `sys_area` VALUES ('139002', '139000', '辛集市', '河北省', '省直辖县级行政区划', '辛集市', '河北省省直辖县级行政区划辛集市', 0);
INSERT INTO `sys_area` VALUES ('140000', '86', '山西省', '山西省', '', '', '山西省', 0);
INSERT INTO `sys_area` VALUES ('140100', '140000', '太原市', '山西省', '太原市', '', '山西省太原市', 0);
INSERT INTO `sys_area` VALUES ('140101', '140100', '市辖区', '山西省', '太原市', '市辖区', '山西省太原市市辖区', 0);
INSERT INTO `sys_area` VALUES ('140105', '140100', '小店区', '山西省', '太原市', '小店区', '山西省太原市小店区', 0);
INSERT INTO `sys_area` VALUES ('140106', '140100', '迎泽区', '山西省', '太原市', '迎泽区', '山西省太原市迎泽区', 0);
INSERT INTO `sys_area` VALUES ('140107', '140100', '杏花岭区', '山西省', '太原市', '杏花岭区', '山西省太原市杏花岭区', 0);
INSERT INTO `sys_area` VALUES ('140108', '140100', '尖草坪区', '山西省', '太原市', '尖草坪区', '山西省太原市尖草坪区', 0);
INSERT INTO `sys_area` VALUES ('140109', '140100', '万柏林区', '山西省', '太原市', '万柏林区', '山西省太原市万柏林区', 0);
INSERT INTO `sys_area` VALUES ('140110', '140100', '晋源区', '山西省', '太原市', '晋源区', '山西省太原市晋源区', 0);
INSERT INTO `sys_area` VALUES ('140121', '140100', '清徐县', '山西省', '太原市', '清徐县', '山西省太原市清徐县', 0);
INSERT INTO `sys_area` VALUES ('140122', '140100', '阳曲县', '山西省', '太原市', '阳曲县', '山西省太原市阳曲县', 0);
INSERT INTO `sys_area` VALUES ('140123', '140100', '娄烦县', '山西省', '太原市', '娄烦县', '山西省太原市娄烦县', 0);
INSERT INTO `sys_area` VALUES ('140181', '140100', '古交市', '山西省', '太原市', '古交市', '山西省太原市古交市', 0);
INSERT INTO `sys_area` VALUES ('140200', '140000', '大同市', '山西省', '大同市', '', '山西省大同市', 0);
INSERT INTO `sys_area` VALUES ('140201', '140200', '市辖区', '山西省', '大同市', '市辖区', '山西省大同市市辖区', 0);
INSERT INTO `sys_area` VALUES ('140202', '140200', '城区', '山西省', '大同市', '城区', '山西省大同市城区', 0);
INSERT INTO `sys_area` VALUES ('140203', '140200', '矿区', '山西省', '大同市', '矿区', '山西省大同市矿区', 0);
INSERT INTO `sys_area` VALUES ('140211', '140200', '南郊区', '山西省', '大同市', '南郊区', '山西省大同市南郊区', 0);
INSERT INTO `sys_area` VALUES ('140212', '140200', '新荣区', '山西省', '大同市', '新荣区', '山西省大同市新荣区', 0);
INSERT INTO `sys_area` VALUES ('140221', '140200', '阳高县', '山西省', '大同市', '阳高县', '山西省大同市阳高县', 0);
INSERT INTO `sys_area` VALUES ('140222', '140200', '天镇县', '山西省', '大同市', '天镇县', '山西省大同市天镇县', 0);
INSERT INTO `sys_area` VALUES ('140223', '140200', '广灵县', '山西省', '大同市', '广灵县', '山西省大同市广灵县', 0);
INSERT INTO `sys_area` VALUES ('140224', '140200', '灵丘县', '山西省', '大同市', '灵丘县', '山西省大同市灵丘县', 0);
INSERT INTO `sys_area` VALUES ('140225', '140200', '浑源县', '山西省', '大同市', '浑源县', '山西省大同市浑源县', 0);
INSERT INTO `sys_area` VALUES ('140226', '140200', '左云县', '山西省', '大同市', '左云县', '山西省大同市左云县', 0);
INSERT INTO `sys_area` VALUES ('140227', '140200', '大同县', '山西省', '大同市', '大同县', '山西省大同市大同县', 0);
INSERT INTO `sys_area` VALUES ('140300', '140000', '阳泉市', '山西省', '阳泉市', '', '山西省阳泉市', 0);
INSERT INTO `sys_area` VALUES ('140301', '140300', '市辖区', '山西省', '阳泉市', '市辖区', '山西省阳泉市市辖区', 0);
INSERT INTO `sys_area` VALUES ('140302', '140300', '城区', '山西省', '阳泉市', '城区', '山西省阳泉市城区', 0);
INSERT INTO `sys_area` VALUES ('140303', '140300', '矿区', '山西省', '阳泉市', '矿区', '山西省阳泉市矿区', 0);
INSERT INTO `sys_area` VALUES ('140311', '140300', '郊区', '山西省', '阳泉市', '郊区', '山西省阳泉市郊区', 0);
INSERT INTO `sys_area` VALUES ('140321', '140300', '平定县', '山西省', '阳泉市', '平定县', '山西省阳泉市平定县', 0);
INSERT INTO `sys_area` VALUES ('140322', '140300', '盂县', '山西省', '阳泉市', '盂县', '山西省阳泉市盂县', 0);
INSERT INTO `sys_area` VALUES ('140400', '140000', '长治市', '山西省', '长治市', '', '山西省长治市', 0);
INSERT INTO `sys_area` VALUES ('140401', '140400', '市辖区', '山西省', '长治市', '市辖区', '山西省长治市市辖区', 0);
INSERT INTO `sys_area` VALUES ('140402', '140400', '城区', '山西省', '长治市', '城区', '山西省长治市城区', 0);
INSERT INTO `sys_area` VALUES ('140411', '140400', '郊区', '山西省', '长治市', '郊区', '山西省长治市郊区', 0);
INSERT INTO `sys_area` VALUES ('140421', '140400', '长治县', '山西省', '长治市', '长治县', '山西省长治市长治县', 0);
INSERT INTO `sys_area` VALUES ('140423', '140400', '襄垣县', '山西省', '长治市', '襄垣县', '山西省长治市襄垣县', 0);
INSERT INTO `sys_area` VALUES ('140424', '140400', '屯留县', '山西省', '长治市', '屯留县', '山西省长治市屯留县', 0);
INSERT INTO `sys_area` VALUES ('140425', '140400', '平顺县', '山西省', '长治市', '平顺县', '山西省长治市平顺县', 0);
INSERT INTO `sys_area` VALUES ('140426', '140400', '黎城县', '山西省', '长治市', '黎城县', '山西省长治市黎城县', 0);
INSERT INTO `sys_area` VALUES ('140427', '140400', '壶关县', '山西省', '长治市', '壶关县', '山西省长治市壶关县', 0);
INSERT INTO `sys_area` VALUES ('140428', '140400', '长子县', '山西省', '长治市', '长子县', '山西省长治市长子县', 0);
INSERT INTO `sys_area` VALUES ('140429', '140400', '武乡县', '山西省', '长治市', '武乡县', '山西省长治市武乡县', 0);
INSERT INTO `sys_area` VALUES ('140430', '140400', '沁县', '山西省', '长治市', '沁县', '山西省长治市沁县', 0);
INSERT INTO `sys_area` VALUES ('140431', '140400', '沁源县', '山西省', '长治市', '沁源县', '山西省长治市沁源县', 0);
INSERT INTO `sys_area` VALUES ('140481', '140400', '潞城市', '山西省', '长治市', '潞城市', '山西省长治市潞城市', 0);
INSERT INTO `sys_area` VALUES ('140500', '140000', '晋城市', '山西省', '晋城市', '', '山西省晋城市', 0);
INSERT INTO `sys_area` VALUES ('140501', '140500', '市辖区', '山西省', '晋城市', '市辖区', '山西省晋城市市辖区', 0);
INSERT INTO `sys_area` VALUES ('140502', '140500', '城区', '山西省', '晋城市', '城区', '山西省晋城市城区', 0);
INSERT INTO `sys_area` VALUES ('140521', '140500', '沁水县', '山西省', '晋城市', '沁水县', '山西省晋城市沁水县', 0);
INSERT INTO `sys_area` VALUES ('140522', '140500', '阳城县', '山西省', '晋城市', '阳城县', '山西省晋城市阳城县', 0);
INSERT INTO `sys_area` VALUES ('140524', '140500', '陵川县', '山西省', '晋城市', '陵川县', '山西省晋城市陵川县', 0);
INSERT INTO `sys_area` VALUES ('140525', '140500', '泽州县', '山西省', '晋城市', '泽州县', '山西省晋城市泽州县', 0);
INSERT INTO `sys_area` VALUES ('140581', '140500', '高平市', '山西省', '晋城市', '高平市', '山西省晋城市高平市', 0);
INSERT INTO `sys_area` VALUES ('140600', '140000', '朔州市', '山西省', '朔州市', '', '山西省朔州市', 0);
INSERT INTO `sys_area` VALUES ('140601', '140600', '市辖区', '山西省', '朔州市', '市辖区', '山西省朔州市市辖区', 0);
INSERT INTO `sys_area` VALUES ('140602', '140600', '朔城区', '山西省', '朔州市', '朔城区', '山西省朔州市朔城区', 0);
INSERT INTO `sys_area` VALUES ('140603', '140600', '平鲁区', '山西省', '朔州市', '平鲁区', '山西省朔州市平鲁区', 0);
INSERT INTO `sys_area` VALUES ('140621', '140600', '山阴县', '山西省', '朔州市', '山阴县', '山西省朔州市山阴县', 0);
INSERT INTO `sys_area` VALUES ('140622', '140600', '应县', '山西省', '朔州市', '应县', '山西省朔州市应县', 0);
INSERT INTO `sys_area` VALUES ('140623', '140600', '右玉县', '山西省', '朔州市', '右玉县', '山西省朔州市右玉县', 0);
INSERT INTO `sys_area` VALUES ('140624', '140600', '怀仁县', '山西省', '朔州市', '怀仁县', '山西省朔州市怀仁县', 0);
INSERT INTO `sys_area` VALUES ('140700', '140000', '晋中市', '山西省', '晋中市', '', '山西省晋中市', 0);
INSERT INTO `sys_area` VALUES ('140701', '140700', '市辖区', '山西省', '晋中市', '市辖区', '山西省晋中市市辖区', 0);
INSERT INTO `sys_area` VALUES ('140702', '140700', '榆次区', '山西省', '晋中市', '榆次区', '山西省晋中市榆次区', 0);
INSERT INTO `sys_area` VALUES ('140721', '140700', '榆社县', '山西省', '晋中市', '榆社县', '山西省晋中市榆社县', 0);
INSERT INTO `sys_area` VALUES ('140722', '140700', '左权县', '山西省', '晋中市', '左权县', '山西省晋中市左权县', 0);
INSERT INTO `sys_area` VALUES ('140723', '140700', '和顺县', '山西省', '晋中市', '和顺县', '山西省晋中市和顺县', 0);
INSERT INTO `sys_area` VALUES ('140724', '140700', '昔阳县', '山西省', '晋中市', '昔阳县', '山西省晋中市昔阳县', 0);
INSERT INTO `sys_area` VALUES ('140725', '140700', '寿阳县', '山西省', '晋中市', '寿阳县', '山西省晋中市寿阳县', 0);
INSERT INTO `sys_area` VALUES ('140726', '140700', '太谷县', '山西省', '晋中市', '太谷县', '山西省晋中市太谷县', 0);
INSERT INTO `sys_area` VALUES ('140727', '140700', '祁县', '山西省', '晋中市', '祁县', '山西省晋中市祁县', 0);
INSERT INTO `sys_area` VALUES ('140728', '140700', '平遥县', '山西省', '晋中市', '平遥县', '山西省晋中市平遥县', 0);
INSERT INTO `sys_area` VALUES ('140729', '140700', '灵石县', '山西省', '晋中市', '灵石县', '山西省晋中市灵石县', 0);
INSERT INTO `sys_area` VALUES ('140781', '140700', '介休市', '山西省', '晋中市', '介休市', '山西省晋中市介休市', 0);
INSERT INTO `sys_area` VALUES ('140800', '140000', '运城市', '山西省', '运城市', '', '山西省运城市', 0);
INSERT INTO `sys_area` VALUES ('140801', '140800', '市辖区', '山西省', '运城市', '市辖区', '山西省运城市市辖区', 0);
INSERT INTO `sys_area` VALUES ('140802', '140800', '盐湖区', '山西省', '运城市', '盐湖区', '山西省运城市盐湖区', 0);
INSERT INTO `sys_area` VALUES ('140821', '140800', '临猗县', '山西省', '运城市', '临猗县', '山西省运城市临猗县', 0);
INSERT INTO `sys_area` VALUES ('140822', '140800', '万荣县', '山西省', '运城市', '万荣县', '山西省运城市万荣县', 0);
INSERT INTO `sys_area` VALUES ('140823', '140800', '闻喜县', '山西省', '运城市', '闻喜县', '山西省运城市闻喜县', 0);
INSERT INTO `sys_area` VALUES ('140824', '140800', '稷山县', '山西省', '运城市', '稷山县', '山西省运城市稷山县', 0);
INSERT INTO `sys_area` VALUES ('140825', '140800', '新绛县', '山西省', '运城市', '新绛县', '山西省运城市新绛县', 0);
INSERT INTO `sys_area` VALUES ('140826', '140800', '绛县', '山西省', '运城市', '绛县', '山西省运城市绛县', 0);
INSERT INTO `sys_area` VALUES ('140827', '140800', '垣曲县', '山西省', '运城市', '垣曲县', '山西省运城市垣曲县', 0);
INSERT INTO `sys_area` VALUES ('140828', '140800', '夏县', '山西省', '运城市', '夏县', '山西省运城市夏县', 0);
INSERT INTO `sys_area` VALUES ('140829', '140800', '平陆县', '山西省', '运城市', '平陆县', '山西省运城市平陆县', 0);
INSERT INTO `sys_area` VALUES ('140830', '140800', '芮城县', '山西省', '运城市', '芮城县', '山西省运城市芮城县', 0);
INSERT INTO `sys_area` VALUES ('140881', '140800', '永济市', '山西省', '运城市', '永济市', '山西省运城市永济市', 0);
INSERT INTO `sys_area` VALUES ('140882', '140800', '河津市', '山西省', '运城市', '河津市', '山西省运城市河津市', 0);
INSERT INTO `sys_area` VALUES ('140900', '140000', '忻州市', '山西省', '忻州市', '', '山西省忻州市', 0);
INSERT INTO `sys_area` VALUES ('140901', '140900', '市辖区', '山西省', '忻州市', '市辖区', '山西省忻州市市辖区', 0);
INSERT INTO `sys_area` VALUES ('140902', '140900', '忻府区', '山西省', '忻州市', '忻府区', '山西省忻州市忻府区', 0);
INSERT INTO `sys_area` VALUES ('140921', '140900', '定襄县', '山西省', '忻州市', '定襄县', '山西省忻州市定襄县', 0);
INSERT INTO `sys_area` VALUES ('140922', '140900', '五台县', '山西省', '忻州市', '五台县', '山西省忻州市五台县', 0);
INSERT INTO `sys_area` VALUES ('140923', '140900', '代县', '山西省', '忻州市', '代县', '山西省忻州市代县', 0);
INSERT INTO `sys_area` VALUES ('140924', '140900', '繁峙县', '山西省', '忻州市', '繁峙县', '山西省忻州市繁峙县', 0);
INSERT INTO `sys_area` VALUES ('140925', '140900', '宁武县', '山西省', '忻州市', '宁武县', '山西省忻州市宁武县', 0);
INSERT INTO `sys_area` VALUES ('140926', '140900', '静乐县', '山西省', '忻州市', '静乐县', '山西省忻州市静乐县', 0);
INSERT INTO `sys_area` VALUES ('140927', '140900', '神池县', '山西省', '忻州市', '神池县', '山西省忻州市神池县', 0);
INSERT INTO `sys_area` VALUES ('140928', '140900', '五寨县', '山西省', '忻州市', '五寨县', '山西省忻州市五寨县', 0);
INSERT INTO `sys_area` VALUES ('140929', '140900', '岢岚县', '山西省', '忻州市', '岢岚县', '山西省忻州市岢岚县', 0);
INSERT INTO `sys_area` VALUES ('140930', '140900', '河曲县', '山西省', '忻州市', '河曲县', '山西省忻州市河曲县', 0);
INSERT INTO `sys_area` VALUES ('140931', '140900', '保德县', '山西省', '忻州市', '保德县', '山西省忻州市保德县', 0);
INSERT INTO `sys_area` VALUES ('140932', '140900', '偏关县', '山西省', '忻州市', '偏关县', '山西省忻州市偏关县', 0);
INSERT INTO `sys_area` VALUES ('140981', '140900', '原平市', '山西省', '忻州市', '原平市', '山西省忻州市原平市', 0);
INSERT INTO `sys_area` VALUES ('141000', '140000', '临汾市', '山西省', '临汾市', '', '山西省临汾市', 0);
INSERT INTO `sys_area` VALUES ('141001', '141000', '市辖区', '山西省', '临汾市', '市辖区', '山西省临汾市市辖区', 0);
INSERT INTO `sys_area` VALUES ('141002', '141000', '尧都区', '山西省', '临汾市', '尧都区', '山西省临汾市尧都区', 0);
INSERT INTO `sys_area` VALUES ('141021', '141000', '曲沃县', '山西省', '临汾市', '曲沃县', '山西省临汾市曲沃县', 0);
INSERT INTO `sys_area` VALUES ('141022', '141000', '翼城县', '山西省', '临汾市', '翼城县', '山西省临汾市翼城县', 0);
INSERT INTO `sys_area` VALUES ('141023', '141000', '襄汾县', '山西省', '临汾市', '襄汾县', '山西省临汾市襄汾县', 0);
INSERT INTO `sys_area` VALUES ('141024', '141000', '洪洞县', '山西省', '临汾市', '洪洞县', '山西省临汾市洪洞县', 0);
INSERT INTO `sys_area` VALUES ('141025', '141000', '古县', '山西省', '临汾市', '古县', '山西省临汾市古县', 0);
INSERT INTO `sys_area` VALUES ('141026', '141000', '安泽县', '山西省', '临汾市', '安泽县', '山西省临汾市安泽县', 0);
INSERT INTO `sys_area` VALUES ('141027', '141000', '浮山县', '山西省', '临汾市', '浮山县', '山西省临汾市浮山县', 0);
INSERT INTO `sys_area` VALUES ('141028', '141000', '吉县', '山西省', '临汾市', '吉县', '山西省临汾市吉县', 0);
INSERT INTO `sys_area` VALUES ('141029', '141000', '乡宁县', '山西省', '临汾市', '乡宁县', '山西省临汾市乡宁县', 0);
INSERT INTO `sys_area` VALUES ('141030', '141000', '大宁县', '山西省', '临汾市', '大宁县', '山西省临汾市大宁县', 0);
INSERT INTO `sys_area` VALUES ('141031', '141000', '隰县', '山西省', '临汾市', '隰县', '山西省临汾市隰县', 0);
INSERT INTO `sys_area` VALUES ('141032', '141000', '永和县', '山西省', '临汾市', '永和县', '山西省临汾市永和县', 0);
INSERT INTO `sys_area` VALUES ('141033', '141000', '蒲县', '山西省', '临汾市', '蒲县', '山西省临汾市蒲县', 0);
INSERT INTO `sys_area` VALUES ('141034', '141000', '汾西县', '山西省', '临汾市', '汾西县', '山西省临汾市汾西县', 0);
INSERT INTO `sys_area` VALUES ('141081', '141000', '侯马市', '山西省', '临汾市', '侯马市', '山西省临汾市侯马市', 0);
INSERT INTO `sys_area` VALUES ('141082', '141000', '霍州市', '山西省', '临汾市', '霍州市', '山西省临汾市霍州市', 0);
INSERT INTO `sys_area` VALUES ('141100', '140000', '吕梁市', '山西省', '吕梁市', '', '山西省吕梁市', 0);
INSERT INTO `sys_area` VALUES ('141101', '141100', '市辖区', '山西省', '吕梁市', '市辖区', '山西省吕梁市市辖区', 0);
INSERT INTO `sys_area` VALUES ('141102', '141100', '离石区', '山西省', '吕梁市', '离石区', '山西省吕梁市离石区', 0);
INSERT INTO `sys_area` VALUES ('141121', '141100', '文水县', '山西省', '吕梁市', '文水县', '山西省吕梁市文水县', 0);
INSERT INTO `sys_area` VALUES ('141122', '141100', '交城县', '山西省', '吕梁市', '交城县', '山西省吕梁市交城县', 0);
INSERT INTO `sys_area` VALUES ('141123', '141100', '兴县', '山西省', '吕梁市', '兴县', '山西省吕梁市兴县', 0);
INSERT INTO `sys_area` VALUES ('141124', '141100', '临县', '山西省', '吕梁市', '临县', '山西省吕梁市临县', 0);
INSERT INTO `sys_area` VALUES ('141125', '141100', '柳林县', '山西省', '吕梁市', '柳林县', '山西省吕梁市柳林县', 0);
INSERT INTO `sys_area` VALUES ('141126', '141100', '石楼县', '山西省', '吕梁市', '石楼县', '山西省吕梁市石楼县', 0);
INSERT INTO `sys_area` VALUES ('141127', '141100', '岚县', '山西省', '吕梁市', '岚县', '山西省吕梁市岚县', 0);
INSERT INTO `sys_area` VALUES ('141128', '141100', '方山县', '山西省', '吕梁市', '方山县', '山西省吕梁市方山县', 0);
INSERT INTO `sys_area` VALUES ('141129', '141100', '中阳县', '山西省', '吕梁市', '中阳县', '山西省吕梁市中阳县', 0);
INSERT INTO `sys_area` VALUES ('141130', '141100', '交口县', '山西省', '吕梁市', '交口县', '山西省吕梁市交口县', 0);
INSERT INTO `sys_area` VALUES ('141181', '141100', '孝义市', '山西省', '吕梁市', '孝义市', '山西省吕梁市孝义市', 0);
INSERT INTO `sys_area` VALUES ('141182', '141100', '汾阳市', '山西省', '吕梁市', '汾阳市', '山西省吕梁市汾阳市', 0);
INSERT INTO `sys_area` VALUES ('150000', '86', '内蒙古自治区', '内蒙古自治区', '', '', '内蒙古自治区', 0);
INSERT INTO `sys_area` VALUES ('150100', '150000', '呼和浩特市', '内蒙古自治区', '呼和浩特市', '', '内蒙古自治区呼和浩特市', 0);
INSERT INTO `sys_area` VALUES ('150101', '150100', '市辖区', '内蒙古自治区', '呼和浩特市', '市辖区', '内蒙古自治区呼和浩特市市辖区', 0);
INSERT INTO `sys_area` VALUES ('150102', '150100', '新城区', '内蒙古自治区', '呼和浩特市', '新城区', '内蒙古自治区呼和浩特市新城区', 0);
INSERT INTO `sys_area` VALUES ('150103', '150100', '回民区', '内蒙古自治区', '呼和浩特市', '回民区', '内蒙古自治区呼和浩特市回民区', 0);
INSERT INTO `sys_area` VALUES ('150104', '150100', '玉泉区', '内蒙古自治区', '呼和浩特市', '玉泉区', '内蒙古自治区呼和浩特市玉泉区', 0);
INSERT INTO `sys_area` VALUES ('150105', '150100', '赛罕区', '内蒙古自治区', '呼和浩特市', '赛罕区', '内蒙古自治区呼和浩特市赛罕区', 0);
INSERT INTO `sys_area` VALUES ('150121', '150100', '土默特左旗', '内蒙古自治区', '呼和浩特市', '土默特左旗', '内蒙古自治区呼和浩特市土默特左旗', 0);
INSERT INTO `sys_area` VALUES ('150122', '150100', '托克托县', '内蒙古自治区', '呼和浩特市', '托克托县', '内蒙古自治区呼和浩特市托克托县', 0);
INSERT INTO `sys_area` VALUES ('150123', '150100', '和林格尔县', '内蒙古自治区', '呼和浩特市', '和林格尔县', '内蒙古自治区呼和浩特市和林格尔县', 0);
INSERT INTO `sys_area` VALUES ('150124', '150100', '清水河县', '内蒙古自治区', '呼和浩特市', '清水河县', '内蒙古自治区呼和浩特市清水河县', 0);
INSERT INTO `sys_area` VALUES ('150125', '150100', '武川县', '内蒙古自治区', '呼和浩特市', '武川县', '内蒙古自治区呼和浩特市武川县', 0);
INSERT INTO `sys_area` VALUES ('150200', '150000', '包头市', '内蒙古自治区', '包头市', '', '内蒙古自治区包头市', 0);
INSERT INTO `sys_area` VALUES ('150201', '150200', '市辖区', '内蒙古自治区', '包头市', '市辖区', '内蒙古自治区包头市市辖区', 0);
INSERT INTO `sys_area` VALUES ('150202', '150200', '东河区', '内蒙古自治区', '包头市', '东河区', '内蒙古自治区包头市东河区', 0);
INSERT INTO `sys_area` VALUES ('150203', '150200', '昆都仑区', '内蒙古自治区', '包头市', '昆都仑区', '内蒙古自治区包头市昆都仑区', 0);
INSERT INTO `sys_area` VALUES ('150204', '150200', '青山区', '内蒙古自治区', '包头市', '青山区', '内蒙古自治区包头市青山区', 0);
INSERT INTO `sys_area` VALUES ('150205', '150200', '石拐区', '内蒙古自治区', '包头市', '石拐区', '内蒙古自治区包头市石拐区', 0);
INSERT INTO `sys_area` VALUES ('150206', '150200', '白云鄂博矿区', '内蒙古自治区', '包头市', '白云鄂博矿区', '内蒙古自治区包头市白云鄂博矿区', 0);
INSERT INTO `sys_area` VALUES ('150207', '150200', '九原区', '内蒙古自治区', '包头市', '九原区', '内蒙古自治区包头市九原区', 0);
INSERT INTO `sys_area` VALUES ('150221', '150200', '土默特右旗', '内蒙古自治区', '包头市', '土默特右旗', '内蒙古自治区包头市土默特右旗', 0);
INSERT INTO `sys_area` VALUES ('150222', '150200', '固阳县', '内蒙古自治区', '包头市', '固阳县', '内蒙古自治区包头市固阳县', 0);
INSERT INTO `sys_area` VALUES ('150223', '150200', '达尔罕茂明安联合旗', '内蒙古自治区', '包头市', '达尔罕茂明安联合旗', '内蒙古自治区包头市达尔罕茂明安联合旗', 0);
INSERT INTO `sys_area` VALUES ('150300', '150000', '乌海市', '内蒙古自治区', '乌海市', '', '内蒙古自治区乌海市', 0);
INSERT INTO `sys_area` VALUES ('150301', '150300', '市辖区', '内蒙古自治区', '乌海市', '市辖区', '内蒙古自治区乌海市市辖区', 0);
INSERT INTO `sys_area` VALUES ('150302', '150300', '海勃湾区', '内蒙古自治区', '乌海市', '海勃湾区', '内蒙古自治区乌海市海勃湾区', 0);
INSERT INTO `sys_area` VALUES ('150303', '150300', '海南区', '内蒙古自治区', '乌海市', '海南区', '内蒙古自治区乌海市海南区', 0);
INSERT INTO `sys_area` VALUES ('150304', '150300', '乌达区', '内蒙古自治区', '乌海市', '乌达区', '内蒙古自治区乌海市乌达区', 0);
INSERT INTO `sys_area` VALUES ('150400', '150000', '赤峰市', '内蒙古自治区', '赤峰市', '', '内蒙古自治区赤峰市', 0);
INSERT INTO `sys_area` VALUES ('150401', '150400', '市辖区', '内蒙古自治区', '赤峰市', '市辖区', '内蒙古自治区赤峰市市辖区', 0);
INSERT INTO `sys_area` VALUES ('150402', '150400', '红山区', '内蒙古自治区', '赤峰市', '红山区', '内蒙古自治区赤峰市红山区', 0);
INSERT INTO `sys_area` VALUES ('150403', '150400', '元宝山区', '内蒙古自治区', '赤峰市', '元宝山区', '内蒙古自治区赤峰市元宝山区', 0);
INSERT INTO `sys_area` VALUES ('150404', '150400', '松山区', '内蒙古自治区', '赤峰市', '松山区', '内蒙古自治区赤峰市松山区', 0);
INSERT INTO `sys_area` VALUES ('150421', '150400', '阿鲁科尔沁旗', '内蒙古自治区', '赤峰市', '阿鲁科尔沁旗', '内蒙古自治区赤峰市阿鲁科尔沁旗', 0);
INSERT INTO `sys_area` VALUES ('150422', '150400', '巴林左旗', '内蒙古自治区', '赤峰市', '巴林左旗', '内蒙古自治区赤峰市巴林左旗', 0);
INSERT INTO `sys_area` VALUES ('150423', '150400', '巴林右旗', '内蒙古自治区', '赤峰市', '巴林右旗', '内蒙古自治区赤峰市巴林右旗', 0);
INSERT INTO `sys_area` VALUES ('150424', '150400', '林西县', '内蒙古自治区', '赤峰市', '林西县', '内蒙古自治区赤峰市林西县', 0);
INSERT INTO `sys_area` VALUES ('150425', '150400', '克什克腾旗', '内蒙古自治区', '赤峰市', '克什克腾旗', '内蒙古自治区赤峰市克什克腾旗', 0);
INSERT INTO `sys_area` VALUES ('150426', '150400', '翁牛特旗', '内蒙古自治区', '赤峰市', '翁牛特旗', '内蒙古自治区赤峰市翁牛特旗', 0);
INSERT INTO `sys_area` VALUES ('150428', '150400', '喀喇沁旗', '内蒙古自治区', '赤峰市', '喀喇沁旗', '内蒙古自治区赤峰市喀喇沁旗', 0);
INSERT INTO `sys_area` VALUES ('150429', '150400', '宁城县', '内蒙古自治区', '赤峰市', '宁城县', '内蒙古自治区赤峰市宁城县', 0);
INSERT INTO `sys_area` VALUES ('150430', '150400', '敖汉旗', '内蒙古自治区', '赤峰市', '敖汉旗', '内蒙古自治区赤峰市敖汉旗', 0);
INSERT INTO `sys_area` VALUES ('150500', '150000', '通辽市', '内蒙古自治区', '通辽市', '', '内蒙古自治区通辽市', 0);
INSERT INTO `sys_area` VALUES ('150501', '150500', '市辖区', '内蒙古自治区', '通辽市', '市辖区', '内蒙古自治区通辽市市辖区', 0);
INSERT INTO `sys_area` VALUES ('150502', '150500', '科尔沁区', '内蒙古自治区', '通辽市', '科尔沁区', '内蒙古自治区通辽市科尔沁区', 0);
INSERT INTO `sys_area` VALUES ('150521', '150500', '科尔沁左翼中旗', '内蒙古自治区', '通辽市', '科尔沁左翼中旗', '内蒙古自治区通辽市科尔沁左翼中旗', 0);
INSERT INTO `sys_area` VALUES ('150522', '150500', '科尔沁左翼后旗', '内蒙古自治区', '通辽市', '科尔沁左翼后旗', '内蒙古自治区通辽市科尔沁左翼后旗', 0);
INSERT INTO `sys_area` VALUES ('150523', '150500', '开鲁县', '内蒙古自治区', '通辽市', '开鲁县', '内蒙古自治区通辽市开鲁县', 0);
INSERT INTO `sys_area` VALUES ('150524', '150500', '库伦旗', '内蒙古自治区', '通辽市', '库伦旗', '内蒙古自治区通辽市库伦旗', 0);
INSERT INTO `sys_area` VALUES ('150525', '150500', '奈曼旗', '内蒙古自治区', '通辽市', '奈曼旗', '内蒙古自治区通辽市奈曼旗', 0);
INSERT INTO `sys_area` VALUES ('150526', '150500', '扎鲁特旗', '内蒙古自治区', '通辽市', '扎鲁特旗', '内蒙古自治区通辽市扎鲁特旗', 0);
INSERT INTO `sys_area` VALUES ('150581', '150500', '霍林郭勒市', '内蒙古自治区', '通辽市', '霍林郭勒市', '内蒙古自治区通辽市霍林郭勒市', 0);
INSERT INTO `sys_area` VALUES ('150600', '150000', '鄂尔多斯市', '内蒙古自治区', '鄂尔多斯市', '', '内蒙古自治区鄂尔多斯市', 0);
INSERT INTO `sys_area` VALUES ('150601', '150600', '市辖区', '内蒙古自治区', '鄂尔多斯市', '市辖区', '内蒙古自治区鄂尔多斯市市辖区', 0);
INSERT INTO `sys_area` VALUES ('150602', '150600', '东胜区', '内蒙古自治区', '鄂尔多斯市', '东胜区', '内蒙古自治区鄂尔多斯市东胜区', 0);
INSERT INTO `sys_area` VALUES ('150603', '150600', '康巴什区', '内蒙古自治区', '鄂尔多斯市', '康巴什区', '内蒙古自治区鄂尔多斯市康巴什区', 0);
INSERT INTO `sys_area` VALUES ('150621', '150600', '达拉特旗', '内蒙古自治区', '鄂尔多斯市', '达拉特旗', '内蒙古自治区鄂尔多斯市达拉特旗', 0);
INSERT INTO `sys_area` VALUES ('150622', '150600', '准格尔旗', '内蒙古自治区', '鄂尔多斯市', '准格尔旗', '内蒙古自治区鄂尔多斯市准格尔旗', 0);
INSERT INTO `sys_area` VALUES ('150623', '150600', '鄂托克前旗', '内蒙古自治区', '鄂尔多斯市', '鄂托克前旗', '内蒙古自治区鄂尔多斯市鄂托克前旗', 0);
INSERT INTO `sys_area` VALUES ('150624', '150600', '鄂托克旗', '内蒙古自治区', '鄂尔多斯市', '鄂托克旗', '内蒙古自治区鄂尔多斯市鄂托克旗', 0);
INSERT INTO `sys_area` VALUES ('150625', '150600', '杭锦旗', '内蒙古自治区', '鄂尔多斯市', '杭锦旗', '内蒙古自治区鄂尔多斯市杭锦旗', 0);
INSERT INTO `sys_area` VALUES ('150626', '150600', '乌审旗', '内蒙古自治区', '鄂尔多斯市', '乌审旗', '内蒙古自治区鄂尔多斯市乌审旗', 0);
INSERT INTO `sys_area` VALUES ('150627', '150600', '伊金霍洛旗', '内蒙古自治区', '鄂尔多斯市', '伊金霍洛旗', '内蒙古自治区鄂尔多斯市伊金霍洛旗', 0);
INSERT INTO `sys_area` VALUES ('150700', '150000', '呼伦贝尔市', '内蒙古自治区', '呼伦贝尔市', '', '内蒙古自治区呼伦贝尔市', 0);
INSERT INTO `sys_area` VALUES ('150701', '150700', '市辖区', '内蒙古自治区', '呼伦贝尔市', '市辖区', '内蒙古自治区呼伦贝尔市市辖区', 0);
INSERT INTO `sys_area` VALUES ('150702', '150700', '海拉尔区', '内蒙古自治区', '呼伦贝尔市', '海拉尔区', '内蒙古自治区呼伦贝尔市海拉尔区', 0);
INSERT INTO `sys_area` VALUES ('150703', '150700', '扎赉诺尔区', '内蒙古自治区', '呼伦贝尔市', '扎赉诺尔区', '内蒙古自治区呼伦贝尔市扎赉诺尔区', 0);
INSERT INTO `sys_area` VALUES ('150721', '150700', '阿荣旗', '内蒙古自治区', '呼伦贝尔市', '阿荣旗', '内蒙古自治区呼伦贝尔市阿荣旗', 0);
INSERT INTO `sys_area` VALUES ('150722', '150700', '莫力达瓦达斡尔族自治旗', '内蒙古自治区', '呼伦贝尔市', '莫力达瓦达斡尔族自治旗', '内蒙古自治区呼伦贝尔市莫力达瓦达斡尔族自治旗', 0);
INSERT INTO `sys_area` VALUES ('150723', '150700', '鄂伦春自治旗', '内蒙古自治区', '呼伦贝尔市', '鄂伦春自治旗', '内蒙古自治区呼伦贝尔市鄂伦春自治旗', 0);
INSERT INTO `sys_area` VALUES ('150724', '150700', '鄂温克族自治旗', '内蒙古自治区', '呼伦贝尔市', '鄂温克族自治旗', '内蒙古自治区呼伦贝尔市鄂温克族自治旗', 0);
INSERT INTO `sys_area` VALUES ('150725', '150700', '陈巴尔虎旗', '内蒙古自治区', '呼伦贝尔市', '陈巴尔虎旗', '内蒙古自治区呼伦贝尔市陈巴尔虎旗', 0);
INSERT INTO `sys_area` VALUES ('150726', '150700', '新巴尔虎左旗', '内蒙古自治区', '呼伦贝尔市', '新巴尔虎左旗', '内蒙古自治区呼伦贝尔市新巴尔虎左旗', 0);
INSERT INTO `sys_area` VALUES ('150727', '150700', '新巴尔虎右旗', '内蒙古自治区', '呼伦贝尔市', '新巴尔虎右旗', '内蒙古自治区呼伦贝尔市新巴尔虎右旗', 0);
INSERT INTO `sys_area` VALUES ('150781', '150700', '满洲里市', '内蒙古自治区', '呼伦贝尔市', '满洲里市', '内蒙古自治区呼伦贝尔市满洲里市', 0);
INSERT INTO `sys_area` VALUES ('150782', '150700', '牙克石市', '内蒙古自治区', '呼伦贝尔市', '牙克石市', '内蒙古自治区呼伦贝尔市牙克石市', 0);
INSERT INTO `sys_area` VALUES ('150783', '150700', '扎兰屯市', '内蒙古自治区', '呼伦贝尔市', '扎兰屯市', '内蒙古自治区呼伦贝尔市扎兰屯市', 0);
INSERT INTO `sys_area` VALUES ('150784', '150700', '额尔古纳市', '内蒙古自治区', '呼伦贝尔市', '额尔古纳市', '内蒙古自治区呼伦贝尔市额尔古纳市', 0);
INSERT INTO `sys_area` VALUES ('150785', '150700', '根河市', '内蒙古自治区', '呼伦贝尔市', '根河市', '内蒙古自治区呼伦贝尔市根河市', 0);
INSERT INTO `sys_area` VALUES ('150800', '150000', '巴彦淖尔市', '内蒙古自治区', '巴彦淖尔市', '', '内蒙古自治区巴彦淖尔市', 0);
INSERT INTO `sys_area` VALUES ('150801', '150800', '市辖区', '内蒙古自治区', '巴彦淖尔市', '市辖区', '内蒙古自治区巴彦淖尔市市辖区', 0);
INSERT INTO `sys_area` VALUES ('150802', '150800', '临河区', '内蒙古自治区', '巴彦淖尔市', '临河区', '内蒙古自治区巴彦淖尔市临河区', 0);
INSERT INTO `sys_area` VALUES ('150821', '150800', '五原县', '内蒙古自治区', '巴彦淖尔市', '五原县', '内蒙古自治区巴彦淖尔市五原县', 0);
INSERT INTO `sys_area` VALUES ('150822', '150800', '磴口县', '内蒙古自治区', '巴彦淖尔市', '磴口县', '内蒙古自治区巴彦淖尔市磴口县', 0);
INSERT INTO `sys_area` VALUES ('150823', '150800', '乌拉特前旗', '内蒙古自治区', '巴彦淖尔市', '乌拉特前旗', '内蒙古自治区巴彦淖尔市乌拉特前旗', 0);
INSERT INTO `sys_area` VALUES ('150824', '150800', '乌拉特中旗', '内蒙古自治区', '巴彦淖尔市', '乌拉特中旗', '内蒙古自治区巴彦淖尔市乌拉特中旗', 0);
INSERT INTO `sys_area` VALUES ('150825', '150800', '乌拉特后旗', '内蒙古自治区', '巴彦淖尔市', '乌拉特后旗', '内蒙古自治区巴彦淖尔市乌拉特后旗', 0);
INSERT INTO `sys_area` VALUES ('150826', '150800', '杭锦后旗', '内蒙古自治区', '巴彦淖尔市', '杭锦后旗', '内蒙古自治区巴彦淖尔市杭锦后旗', 0);
INSERT INTO `sys_area` VALUES ('150900', '150000', '乌兰察布市', '内蒙古自治区', '乌兰察布市', '', '内蒙古自治区乌兰察布市', 0);
INSERT INTO `sys_area` VALUES ('150901', '150900', '市辖区', '内蒙古自治区', '乌兰察布市', '市辖区', '内蒙古自治区乌兰察布市市辖区', 0);
INSERT INTO `sys_area` VALUES ('150902', '150900', '集宁区', '内蒙古自治区', '乌兰察布市', '集宁区', '内蒙古自治区乌兰察布市集宁区', 0);
INSERT INTO `sys_area` VALUES ('150921', '150900', '卓资县', '内蒙古自治区', '乌兰察布市', '卓资县', '内蒙古自治区乌兰察布市卓资县', 0);
INSERT INTO `sys_area` VALUES ('150922', '150900', '化德县', '内蒙古自治区', '乌兰察布市', '化德县', '内蒙古自治区乌兰察布市化德县', 0);
INSERT INTO `sys_area` VALUES ('150923', '150900', '商都县', '内蒙古自治区', '乌兰察布市', '商都县', '内蒙古自治区乌兰察布市商都县', 0);
INSERT INTO `sys_area` VALUES ('150924', '150900', '兴和县', '内蒙古自治区', '乌兰察布市', '兴和县', '内蒙古自治区乌兰察布市兴和县', 0);
INSERT INTO `sys_area` VALUES ('150925', '150900', '凉城县', '内蒙古自治区', '乌兰察布市', '凉城县', '内蒙古自治区乌兰察布市凉城县', 0);
INSERT INTO `sys_area` VALUES ('150926', '150900', '察哈尔右翼前旗', '内蒙古自治区', '乌兰察布市', '察哈尔右翼前旗', '内蒙古自治区乌兰察布市察哈尔右翼前旗', 0);
INSERT INTO `sys_area` VALUES ('150927', '150900', '察哈尔右翼中旗', '内蒙古自治区', '乌兰察布市', '察哈尔右翼中旗', '内蒙古自治区乌兰察布市察哈尔右翼中旗', 0);
INSERT INTO `sys_area` VALUES ('150928', '150900', '察哈尔右翼后旗', '内蒙古自治区', '乌兰察布市', '察哈尔右翼后旗', '内蒙古自治区乌兰察布市察哈尔右翼后旗', 0);
INSERT INTO `sys_area` VALUES ('150929', '150900', '四子王旗', '内蒙古自治区', '乌兰察布市', '四子王旗', '内蒙古自治区乌兰察布市四子王旗', 0);
INSERT INTO `sys_area` VALUES ('150981', '150900', '丰镇市', '内蒙古自治区', '乌兰察布市', '丰镇市', '内蒙古自治区乌兰察布市丰镇市', 0);
INSERT INTO `sys_area` VALUES ('152200', '150000', '兴安盟', '内蒙古自治区', '兴安盟', '', '内蒙古自治区兴安盟', 0);
INSERT INTO `sys_area` VALUES ('152201', '152200', '乌兰浩特市', '内蒙古自治区', '兴安盟', '乌兰浩特市', '内蒙古自治区兴安盟乌兰浩特市', 0);
INSERT INTO `sys_area` VALUES ('152202', '152200', '阿尔山市', '内蒙古自治区', '兴安盟', '阿尔山市', '内蒙古自治区兴安盟阿尔山市', 0);
INSERT INTO `sys_area` VALUES ('152221', '152200', '科尔沁右翼前旗', '内蒙古自治区', '兴安盟', '科尔沁右翼前旗', '内蒙古自治区兴安盟科尔沁右翼前旗', 0);
INSERT INTO `sys_area` VALUES ('152222', '152200', '科尔沁右翼中旗', '内蒙古自治区', '兴安盟', '科尔沁右翼中旗', '内蒙古自治区兴安盟科尔沁右翼中旗', 0);
INSERT INTO `sys_area` VALUES ('152223', '152200', '扎赉特旗', '内蒙古自治区', '兴安盟', '扎赉特旗', '内蒙古自治区兴安盟扎赉特旗', 0);
INSERT INTO `sys_area` VALUES ('152224', '152200', '突泉县', '内蒙古自治区', '兴安盟', '突泉县', '内蒙古自治区兴安盟突泉县', 0);
INSERT INTO `sys_area` VALUES ('152500', '150000', '锡林郭勒盟', '内蒙古自治区', '锡林郭勒盟', '', '内蒙古自治区锡林郭勒盟', 0);
INSERT INTO `sys_area` VALUES ('152501', '152500', '二连浩特市', '内蒙古自治区', '锡林郭勒盟', '二连浩特市', '内蒙古自治区锡林郭勒盟二连浩特市', 0);
INSERT INTO `sys_area` VALUES ('152502', '152500', '锡林浩特市', '内蒙古自治区', '锡林郭勒盟', '锡林浩特市', '内蒙古自治区锡林郭勒盟锡林浩特市', 0);
INSERT INTO `sys_area` VALUES ('152522', '152500', '阿巴嘎旗', '内蒙古自治区', '锡林郭勒盟', '阿巴嘎旗', '内蒙古自治区锡林郭勒盟阿巴嘎旗', 0);
INSERT INTO `sys_area` VALUES ('152523', '152500', '苏尼特左旗', '内蒙古自治区', '锡林郭勒盟', '苏尼特左旗', '内蒙古自治区锡林郭勒盟苏尼特左旗', 0);
INSERT INTO `sys_area` VALUES ('152524', '152500', '苏尼特右旗', '内蒙古自治区', '锡林郭勒盟', '苏尼特右旗', '内蒙古自治区锡林郭勒盟苏尼特右旗', 0);
INSERT INTO `sys_area` VALUES ('152525', '152500', '东乌珠穆沁旗', '内蒙古自治区', '锡林郭勒盟', '东乌珠穆沁旗', '内蒙古自治区锡林郭勒盟东乌珠穆沁旗', 0);
INSERT INTO `sys_area` VALUES ('152526', '152500', '西乌珠穆沁旗', '内蒙古自治区', '锡林郭勒盟', '西乌珠穆沁旗', '内蒙古自治区锡林郭勒盟西乌珠穆沁旗', 0);
INSERT INTO `sys_area` VALUES ('152527', '152500', '太仆寺旗', '内蒙古自治区', '锡林郭勒盟', '太仆寺旗', '内蒙古自治区锡林郭勒盟太仆寺旗', 0);
INSERT INTO `sys_area` VALUES ('152528', '152500', '镶黄旗', '内蒙古自治区', '锡林郭勒盟', '镶黄旗', '内蒙古自治区锡林郭勒盟镶黄旗', 0);
INSERT INTO `sys_area` VALUES ('152529', '152500', '正镶白旗', '内蒙古自治区', '锡林郭勒盟', '正镶白旗', '内蒙古自治区锡林郭勒盟正镶白旗', 0);
INSERT INTO `sys_area` VALUES ('152530', '152500', '正蓝旗', '内蒙古自治区', '锡林郭勒盟', '正蓝旗', '内蒙古自治区锡林郭勒盟正蓝旗', 0);
INSERT INTO `sys_area` VALUES ('152531', '152500', '多伦县', '内蒙古自治区', '锡林郭勒盟', '多伦县', '内蒙古自治区锡林郭勒盟多伦县', 0);
INSERT INTO `sys_area` VALUES ('152900', '150000', '阿拉善盟', '内蒙古自治区', '阿拉善盟', '', '内蒙古自治区阿拉善盟', 0);
INSERT INTO `sys_area` VALUES ('152921', '152900', '阿拉善左旗', '内蒙古自治区', '阿拉善盟', '阿拉善左旗', '内蒙古自治区阿拉善盟阿拉善左旗', 0);
INSERT INTO `sys_area` VALUES ('152922', '152900', '阿拉善右旗', '内蒙古自治区', '阿拉善盟', '阿拉善右旗', '内蒙古自治区阿拉善盟阿拉善右旗', 0);
INSERT INTO `sys_area` VALUES ('152923', '152900', '额济纳旗', '内蒙古自治区', '阿拉善盟', '额济纳旗', '内蒙古自治区阿拉善盟额济纳旗', 0);
INSERT INTO `sys_area` VALUES ('210000', '86', '辽宁省', '辽宁省', '', '', '辽宁省', 0);
INSERT INTO `sys_area` VALUES ('210100', '210000', '沈阳市', '辽宁省', '沈阳市', '', '辽宁省沈阳市', 0);
INSERT INTO `sys_area` VALUES ('210101', '210100', '市辖区', '辽宁省', '沈阳市', '市辖区', '辽宁省沈阳市市辖区', 0);
INSERT INTO `sys_area` VALUES ('210102', '210100', '和平区', '辽宁省', '沈阳市', '和平区', '辽宁省沈阳市和平区', 0);
INSERT INTO `sys_area` VALUES ('210103', '210100', '沈河区', '辽宁省', '沈阳市', '沈河区', '辽宁省沈阳市沈河区', 0);
INSERT INTO `sys_area` VALUES ('210104', '210100', '大东区', '辽宁省', '沈阳市', '大东区', '辽宁省沈阳市大东区', 0);
INSERT INTO `sys_area` VALUES ('210105', '210100', '皇姑区', '辽宁省', '沈阳市', '皇姑区', '辽宁省沈阳市皇姑区', 0);
INSERT INTO `sys_area` VALUES ('210106', '210100', '铁西区', '辽宁省', '沈阳市', '铁西区', '辽宁省沈阳市铁西区', 0);
INSERT INTO `sys_area` VALUES ('210111', '210100', '苏家屯区', '辽宁省', '沈阳市', '苏家屯区', '辽宁省沈阳市苏家屯区', 0);
INSERT INTO `sys_area` VALUES ('210112', '210100', '浑南区', '辽宁省', '沈阳市', '浑南区', '辽宁省沈阳市浑南区', 0);
INSERT INTO `sys_area` VALUES ('210113', '210100', '沈北新区', '辽宁省', '沈阳市', '沈北新区', '辽宁省沈阳市沈北新区', 0);
INSERT INTO `sys_area` VALUES ('210114', '210100', '于洪区', '辽宁省', '沈阳市', '于洪区', '辽宁省沈阳市于洪区', 0);
INSERT INTO `sys_area` VALUES ('210115', '210100', '辽中区', '辽宁省', '沈阳市', '辽中区', '辽宁省沈阳市辽中区', 0);
INSERT INTO `sys_area` VALUES ('210123', '210100', '康平县', '辽宁省', '沈阳市', '康平县', '辽宁省沈阳市康平县', 0);
INSERT INTO `sys_area` VALUES ('210124', '210100', '法库县', '辽宁省', '沈阳市', '法库县', '辽宁省沈阳市法库县', 0);
INSERT INTO `sys_area` VALUES ('210181', '210100', '新民市', '辽宁省', '沈阳市', '新民市', '辽宁省沈阳市新民市', 0);
INSERT INTO `sys_area` VALUES ('210200', '210000', '大连市', '辽宁省', '大连市', '', '辽宁省大连市', 0);
INSERT INTO `sys_area` VALUES ('210201', '210200', '市辖区', '辽宁省', '大连市', '市辖区', '辽宁省大连市市辖区', 0);
INSERT INTO `sys_area` VALUES ('210202', '210200', '中山区', '辽宁省', '大连市', '中山区', '辽宁省大连市中山区', 0);
INSERT INTO `sys_area` VALUES ('210203', '210200', '西岗区', '辽宁省', '大连市', '西岗区', '辽宁省大连市西岗区', 0);
INSERT INTO `sys_area` VALUES ('210204', '210200', '沙河口区', '辽宁省', '大连市', '沙河口区', '辽宁省大连市沙河口区', 0);
INSERT INTO `sys_area` VALUES ('210211', '210200', '甘井子区', '辽宁省', '大连市', '甘井子区', '辽宁省大连市甘井子区', 0);
INSERT INTO `sys_area` VALUES ('210212', '210200', '旅顺口区', '辽宁省', '大连市', '旅顺口区', '辽宁省大连市旅顺口区', 0);
INSERT INTO `sys_area` VALUES ('210213', '210200', '金州区', '辽宁省', '大连市', '金州区', '辽宁省大连市金州区', 0);
INSERT INTO `sys_area` VALUES ('210214', '210200', '普兰店区', '辽宁省', '大连市', '普兰店区', '辽宁省大连市普兰店区', 0);
INSERT INTO `sys_area` VALUES ('210224', '210200', '长海县', '辽宁省', '大连市', '长海县', '辽宁省大连市长海县', 0);
INSERT INTO `sys_area` VALUES ('210281', '210200', '瓦房店市', '辽宁省', '大连市', '瓦房店市', '辽宁省大连市瓦房店市', 0);
INSERT INTO `sys_area` VALUES ('210283', '210200', '庄河市', '辽宁省', '大连市', '庄河市', '辽宁省大连市庄河市', 0);
INSERT INTO `sys_area` VALUES ('210300', '210000', '鞍山市', '辽宁省', '鞍山市', '', '辽宁省鞍山市', 0);
INSERT INTO `sys_area` VALUES ('210301', '210300', '市辖区', '辽宁省', '鞍山市', '市辖区', '辽宁省鞍山市市辖区', 0);
INSERT INTO `sys_area` VALUES ('210302', '210300', '铁东区', '辽宁省', '鞍山市', '铁东区', '辽宁省鞍山市铁东区', 0);
INSERT INTO `sys_area` VALUES ('210303', '210300', '铁西区', '辽宁省', '鞍山市', '铁西区', '辽宁省鞍山市铁西区', 0);
INSERT INTO `sys_area` VALUES ('210304', '210300', '立山区', '辽宁省', '鞍山市', '立山区', '辽宁省鞍山市立山区', 0);
INSERT INTO `sys_area` VALUES ('210311', '210300', '千山区', '辽宁省', '鞍山市', '千山区', '辽宁省鞍山市千山区', 0);
INSERT INTO `sys_area` VALUES ('210321', '210300', '台安县', '辽宁省', '鞍山市', '台安县', '辽宁省鞍山市台安县', 0);
INSERT INTO `sys_area` VALUES ('210323', '210300', '岫岩满族自治县', '辽宁省', '鞍山市', '岫岩满族自治县', '辽宁省鞍山市岫岩满族自治县', 0);
INSERT INTO `sys_area` VALUES ('210381', '210300', '海城市', '辽宁省', '鞍山市', '海城市', '辽宁省鞍山市海城市', 0);
INSERT INTO `sys_area` VALUES ('210400', '210000', '抚顺市', '辽宁省', '抚顺市', '', '辽宁省抚顺市', 0);
INSERT INTO `sys_area` VALUES ('210401', '210400', '市辖区', '辽宁省', '抚顺市', '市辖区', '辽宁省抚顺市市辖区', 0);
INSERT INTO `sys_area` VALUES ('210402', '210400', '新抚区', '辽宁省', '抚顺市', '新抚区', '辽宁省抚顺市新抚区', 0);
INSERT INTO `sys_area` VALUES ('210403', '210400', '东洲区', '辽宁省', '抚顺市', '东洲区', '辽宁省抚顺市东洲区', 0);
INSERT INTO `sys_area` VALUES ('210404', '210400', '望花区', '辽宁省', '抚顺市', '望花区', '辽宁省抚顺市望花区', 0);
INSERT INTO `sys_area` VALUES ('210411', '210400', '顺城区', '辽宁省', '抚顺市', '顺城区', '辽宁省抚顺市顺城区', 0);
INSERT INTO `sys_area` VALUES ('210421', '210400', '抚顺县', '辽宁省', '抚顺市', '抚顺县', '辽宁省抚顺市抚顺县', 0);
INSERT INTO `sys_area` VALUES ('210422', '210400', '新宾满族自治县', '辽宁省', '抚顺市', '新宾满族自治县', '辽宁省抚顺市新宾满族自治县', 0);
INSERT INTO `sys_area` VALUES ('210423', '210400', '清原满族自治县', '辽宁省', '抚顺市', '清原满族自治县', '辽宁省抚顺市清原满族自治县', 0);
INSERT INTO `sys_area` VALUES ('210500', '210000', '本溪市', '辽宁省', '本溪市', '', '辽宁省本溪市', 0);
INSERT INTO `sys_area` VALUES ('210501', '210500', '市辖区', '辽宁省', '本溪市', '市辖区', '辽宁省本溪市市辖区', 0);
INSERT INTO `sys_area` VALUES ('210502', '210500', '平山区', '辽宁省', '本溪市', '平山区', '辽宁省本溪市平山区', 0);
INSERT INTO `sys_area` VALUES ('210503', '210500', '溪湖区', '辽宁省', '本溪市', '溪湖区', '辽宁省本溪市溪湖区', 0);
INSERT INTO `sys_area` VALUES ('210504', '210500', '明山区', '辽宁省', '本溪市', '明山区', '辽宁省本溪市明山区', 0);
INSERT INTO `sys_area` VALUES ('210505', '210500', '南芬区', '辽宁省', '本溪市', '南芬区', '辽宁省本溪市南芬区', 0);
INSERT INTO `sys_area` VALUES ('210521', '210500', '本溪满族自治县', '辽宁省', '本溪市', '本溪满族自治县', '辽宁省本溪市本溪满族自治县', 0);
INSERT INTO `sys_area` VALUES ('210522', '210500', '桓仁满族自治县', '辽宁省', '本溪市', '桓仁满族自治县', '辽宁省本溪市桓仁满族自治县', 0);
INSERT INTO `sys_area` VALUES ('210600', '210000', '丹东市', '辽宁省', '丹东市', '', '辽宁省丹东市', 0);
INSERT INTO `sys_area` VALUES ('210601', '210600', '市辖区', '辽宁省', '丹东市', '市辖区', '辽宁省丹东市市辖区', 0);
INSERT INTO `sys_area` VALUES ('210602', '210600', '元宝区', '辽宁省', '丹东市', '元宝区', '辽宁省丹东市元宝区', 0);
INSERT INTO `sys_area` VALUES ('210603', '210600', '振兴区', '辽宁省', '丹东市', '振兴区', '辽宁省丹东市振兴区', 0);
INSERT INTO `sys_area` VALUES ('210604', '210600', '振安区', '辽宁省', '丹东市', '振安区', '辽宁省丹东市振安区', 0);
INSERT INTO `sys_area` VALUES ('210624', '210600', '宽甸满族自治县', '辽宁省', '丹东市', '宽甸满族自治县', '辽宁省丹东市宽甸满族自治县', 0);
INSERT INTO `sys_area` VALUES ('210681', '210600', '东港市', '辽宁省', '丹东市', '东港市', '辽宁省丹东市东港市', 0);
INSERT INTO `sys_area` VALUES ('210682', '210600', '凤城市', '辽宁省', '丹东市', '凤城市', '辽宁省丹东市凤城市', 0);
INSERT INTO `sys_area` VALUES ('210700', '210000', '锦州市', '辽宁省', '锦州市', '', '辽宁省锦州市', 0);
INSERT INTO `sys_area` VALUES ('210701', '210700', '市辖区', '辽宁省', '锦州市', '市辖区', '辽宁省锦州市市辖区', 0);
INSERT INTO `sys_area` VALUES ('210702', '210700', '古塔区', '辽宁省', '锦州市', '古塔区', '辽宁省锦州市古塔区', 0);
INSERT INTO `sys_area` VALUES ('210703', '210700', '凌河区', '辽宁省', '锦州市', '凌河区', '辽宁省锦州市凌河区', 0);
INSERT INTO `sys_area` VALUES ('210711', '210700', '太和区', '辽宁省', '锦州市', '太和区', '辽宁省锦州市太和区', 0);
INSERT INTO `sys_area` VALUES ('210726', '210700', '黑山县', '辽宁省', '锦州市', '黑山县', '辽宁省锦州市黑山县', 0);
INSERT INTO `sys_area` VALUES ('210727', '210700', '义县', '辽宁省', '锦州市', '义县', '辽宁省锦州市义县', 0);
INSERT INTO `sys_area` VALUES ('210781', '210700', '凌海市', '辽宁省', '锦州市', '凌海市', '辽宁省锦州市凌海市', 0);
INSERT INTO `sys_area` VALUES ('210782', '210700', '北镇市', '辽宁省', '锦州市', '北镇市', '辽宁省锦州市北镇市', 0);
INSERT INTO `sys_area` VALUES ('210800', '210000', '营口市', '辽宁省', '营口市', '', '辽宁省营口市', 0);
INSERT INTO `sys_area` VALUES ('210801', '210800', '市辖区', '辽宁省', '营口市', '市辖区', '辽宁省营口市市辖区', 0);
INSERT INTO `sys_area` VALUES ('210802', '210800', '站前区', '辽宁省', '营口市', '站前区', '辽宁省营口市站前区', 0);
INSERT INTO `sys_area` VALUES ('210803', '210800', '西市区', '辽宁省', '营口市', '西市区', '辽宁省营口市西市区', 0);
INSERT INTO `sys_area` VALUES ('210804', '210800', '鲅鱼圈区', '辽宁省', '营口市', '鲅鱼圈区', '辽宁省营口市鲅鱼圈区', 0);
INSERT INTO `sys_area` VALUES ('210811', '210800', '老边区', '辽宁省', '营口市', '老边区', '辽宁省营口市老边区', 0);
INSERT INTO `sys_area` VALUES ('210881', '210800', '盖州市', '辽宁省', '营口市', '盖州市', '辽宁省营口市盖州市', 0);
INSERT INTO `sys_area` VALUES ('210882', '210800', '大石桥市', '辽宁省', '营口市', '大石桥市', '辽宁省营口市大石桥市', 0);
INSERT INTO `sys_area` VALUES ('210900', '210000', '阜新市', '辽宁省', '阜新市', '', '辽宁省阜新市', 0);
INSERT INTO `sys_area` VALUES ('210901', '210900', '市辖区', '辽宁省', '阜新市', '市辖区', '辽宁省阜新市市辖区', 0);
INSERT INTO `sys_area` VALUES ('210902', '210900', '海州区', '辽宁省', '阜新市', '海州区', '辽宁省阜新市海州区', 0);
INSERT INTO `sys_area` VALUES ('210903', '210900', '新邱区', '辽宁省', '阜新市', '新邱区', '辽宁省阜新市新邱区', 0);
INSERT INTO `sys_area` VALUES ('210904', '210900', '太平区', '辽宁省', '阜新市', '太平区', '辽宁省阜新市太平区', 0);
INSERT INTO `sys_area` VALUES ('210905', '210900', '清河门区', '辽宁省', '阜新市', '清河门区', '辽宁省阜新市清河门区', 0);
INSERT INTO `sys_area` VALUES ('210911', '210900', '细河区', '辽宁省', '阜新市', '细河区', '辽宁省阜新市细河区', 0);
INSERT INTO `sys_area` VALUES ('210921', '210900', '阜新蒙古族自治县', '辽宁省', '阜新市', '阜新蒙古族自治县', '辽宁省阜新市阜新蒙古族自治县', 0);
INSERT INTO `sys_area` VALUES ('210922', '210900', '彰武县', '辽宁省', '阜新市', '彰武县', '辽宁省阜新市彰武县', 0);
INSERT INTO `sys_area` VALUES ('211000', '210000', '辽阳市', '辽宁省', '辽阳市', '', '辽宁省辽阳市', 0);
INSERT INTO `sys_area` VALUES ('211001', '211000', '市辖区', '辽宁省', '辽阳市', '市辖区', '辽宁省辽阳市市辖区', 0);
INSERT INTO `sys_area` VALUES ('211002', '211000', '白塔区', '辽宁省', '辽阳市', '白塔区', '辽宁省辽阳市白塔区', 0);
INSERT INTO `sys_area` VALUES ('211003', '211000', '文圣区', '辽宁省', '辽阳市', '文圣区', '辽宁省辽阳市文圣区', 0);
INSERT INTO `sys_area` VALUES ('211004', '211000', '宏伟区', '辽宁省', '辽阳市', '宏伟区', '辽宁省辽阳市宏伟区', 0);
INSERT INTO `sys_area` VALUES ('211005', '211000', '弓长岭区', '辽宁省', '辽阳市', '弓长岭区', '辽宁省辽阳市弓长岭区', 0);
INSERT INTO `sys_area` VALUES ('211011', '211000', '太子河区', '辽宁省', '辽阳市', '太子河区', '辽宁省辽阳市太子河区', 0);
INSERT INTO `sys_area` VALUES ('211021', '211000', '辽阳县', '辽宁省', '辽阳市', '辽阳县', '辽宁省辽阳市辽阳县', 0);
INSERT INTO `sys_area` VALUES ('211081', '211000', '灯塔市', '辽宁省', '辽阳市', '灯塔市', '辽宁省辽阳市灯塔市', 0);
INSERT INTO `sys_area` VALUES ('211100', '210000', '盘锦市', '辽宁省', '盘锦市', '', '辽宁省盘锦市', 0);
INSERT INTO `sys_area` VALUES ('211101', '211100', '市辖区', '辽宁省', '盘锦市', '市辖区', '辽宁省盘锦市市辖区', 0);
INSERT INTO `sys_area` VALUES ('211102', '211100', '双台子区', '辽宁省', '盘锦市', '双台子区', '辽宁省盘锦市双台子区', 0);
INSERT INTO `sys_area` VALUES ('211103', '211100', '兴隆台区', '辽宁省', '盘锦市', '兴隆台区', '辽宁省盘锦市兴隆台区', 0);
INSERT INTO `sys_area` VALUES ('211104', '211100', '大洼区', '辽宁省', '盘锦市', '大洼区', '辽宁省盘锦市大洼区', 0);
INSERT INTO `sys_area` VALUES ('211122', '211100', '盘山县', '辽宁省', '盘锦市', '盘山县', '辽宁省盘锦市盘山县', 0);
INSERT INTO `sys_area` VALUES ('211200', '210000', '铁岭市', '辽宁省', '铁岭市', '', '辽宁省铁岭市', 0);
INSERT INTO `sys_area` VALUES ('211201', '211200', '市辖区', '辽宁省', '铁岭市', '市辖区', '辽宁省铁岭市市辖区', 0);
INSERT INTO `sys_area` VALUES ('211202', '211200', '银州区', '辽宁省', '铁岭市', '银州区', '辽宁省铁岭市银州区', 0);
INSERT INTO `sys_area` VALUES ('211204', '211200', '清河区', '辽宁省', '铁岭市', '清河区', '辽宁省铁岭市清河区', 0);
INSERT INTO `sys_area` VALUES ('211221', '211200', '铁岭县', '辽宁省', '铁岭市', '铁岭县', '辽宁省铁岭市铁岭县', 0);
INSERT INTO `sys_area` VALUES ('211223', '211200', '西丰县', '辽宁省', '铁岭市', '西丰县', '辽宁省铁岭市西丰县', 0);
INSERT INTO `sys_area` VALUES ('211224', '211200', '昌图县', '辽宁省', '铁岭市', '昌图县', '辽宁省铁岭市昌图县', 0);
INSERT INTO `sys_area` VALUES ('211281', '211200', '调兵山市', '辽宁省', '铁岭市', '调兵山市', '辽宁省铁岭市调兵山市', 0);
INSERT INTO `sys_area` VALUES ('211282', '211200', '开原市', '辽宁省', '铁岭市', '开原市', '辽宁省铁岭市开原市', 0);
INSERT INTO `sys_area` VALUES ('211300', '210000', '朝阳市', '辽宁省', '朝阳市', '', '辽宁省朝阳市', 0);
INSERT INTO `sys_area` VALUES ('211301', '211300', '市辖区', '辽宁省', '朝阳市', '市辖区', '辽宁省朝阳市市辖区', 0);
INSERT INTO `sys_area` VALUES ('211302', '211300', '双塔区', '辽宁省', '朝阳市', '双塔区', '辽宁省朝阳市双塔区', 0);
INSERT INTO `sys_area` VALUES ('211303', '211300', '龙城区', '辽宁省', '朝阳市', '龙城区', '辽宁省朝阳市龙城区', 0);
INSERT INTO `sys_area` VALUES ('211321', '211300', '朝阳县', '辽宁省', '朝阳市', '朝阳县', '辽宁省朝阳市朝阳县', 0);
INSERT INTO `sys_area` VALUES ('211322', '211300', '建平县', '辽宁省', '朝阳市', '建平县', '辽宁省朝阳市建平县', 0);
INSERT INTO `sys_area` VALUES ('211324', '211300', '喀喇沁左翼蒙古族自治县', '辽宁省', '朝阳市', '喀喇沁左翼蒙古族自治县', '辽宁省朝阳市喀喇沁左翼蒙古族自治县', 0);
INSERT INTO `sys_area` VALUES ('211381', '211300', '北票市', '辽宁省', '朝阳市', '北票市', '辽宁省朝阳市北票市', 0);
INSERT INTO `sys_area` VALUES ('211382', '211300', '凌源市', '辽宁省', '朝阳市', '凌源市', '辽宁省朝阳市凌源市', 0);
INSERT INTO `sys_area` VALUES ('211400', '210000', '葫芦岛市', '辽宁省', '葫芦岛市', '', '辽宁省葫芦岛市', 0);
INSERT INTO `sys_area` VALUES ('211401', '211400', '市辖区', '辽宁省', '葫芦岛市', '市辖区', '辽宁省葫芦岛市市辖区', 0);
INSERT INTO `sys_area` VALUES ('211402', '211400', '连山区', '辽宁省', '葫芦岛市', '连山区', '辽宁省葫芦岛市连山区', 0);
INSERT INTO `sys_area` VALUES ('211403', '211400', '龙港区', '辽宁省', '葫芦岛市', '龙港区', '辽宁省葫芦岛市龙港区', 0);
INSERT INTO `sys_area` VALUES ('211404', '211400', '南票区', '辽宁省', '葫芦岛市', '南票区', '辽宁省葫芦岛市南票区', 0);
INSERT INTO `sys_area` VALUES ('211421', '211400', '绥中县', '辽宁省', '葫芦岛市', '绥中县', '辽宁省葫芦岛市绥中县', 0);
INSERT INTO `sys_area` VALUES ('211422', '211400', '建昌县', '辽宁省', '葫芦岛市', '建昌县', '辽宁省葫芦岛市建昌县', 0);
INSERT INTO `sys_area` VALUES ('211481', '211400', '兴城市', '辽宁省', '葫芦岛市', '兴城市', '辽宁省葫芦岛市兴城市', 0);
INSERT INTO `sys_area` VALUES ('220000', '86', '吉林省', '吉林省', '', '', '吉林省', 0);
INSERT INTO `sys_area` VALUES ('220100', '220000', '长春市', '吉林省', '长春市', '', '吉林省长春市', 0);
INSERT INTO `sys_area` VALUES ('220101', '220100', '市辖区', '吉林省', '长春市', '市辖区', '吉林省长春市市辖区', 0);
INSERT INTO `sys_area` VALUES ('220102', '220100', '南关区', '吉林省', '长春市', '南关区', '吉林省长春市南关区', 0);
INSERT INTO `sys_area` VALUES ('220103', '220100', '宽城区', '吉林省', '长春市', '宽城区', '吉林省长春市宽城区', 0);
INSERT INTO `sys_area` VALUES ('220104', '220100', '朝阳区', '吉林省', '长春市', '朝阳区', '吉林省长春市朝阳区', 0);
INSERT INTO `sys_area` VALUES ('220105', '220100', '二道区', '吉林省', '长春市', '二道区', '吉林省长春市二道区', 0);
INSERT INTO `sys_area` VALUES ('220106', '220100', '绿园区', '吉林省', '长春市', '绿园区', '吉林省长春市绿园区', 0);
INSERT INTO `sys_area` VALUES ('220112', '220100', '双阳区', '吉林省', '长春市', '双阳区', '吉林省长春市双阳区', 0);
INSERT INTO `sys_area` VALUES ('220113', '220100', '九台区', '吉林省', '长春市', '九台区', '吉林省长春市九台区', 0);
INSERT INTO `sys_area` VALUES ('220122', '220100', '农安县', '吉林省', '长春市', '农安县', '吉林省长春市农安县', 0);
INSERT INTO `sys_area` VALUES ('220182', '220100', '榆树市', '吉林省', '长春市', '榆树市', '吉林省长春市榆树市', 0);
INSERT INTO `sys_area` VALUES ('220183', '220100', '德惠市', '吉林省', '长春市', '德惠市', '吉林省长春市德惠市', 0);
INSERT INTO `sys_area` VALUES ('220200', '220000', '吉林市', '吉林省', '吉林市', '', '吉林省吉林市', 0);
INSERT INTO `sys_area` VALUES ('220201', '220200', '市辖区', '吉林省', '吉林市', '市辖区', '吉林省吉林市市辖区', 0);
INSERT INTO `sys_area` VALUES ('220202', '220200', '昌邑区', '吉林省', '吉林市', '昌邑区', '吉林省吉林市昌邑区', 0);
INSERT INTO `sys_area` VALUES ('220203', '220200', '龙潭区', '吉林省', '吉林市', '龙潭区', '吉林省吉林市龙潭区', 0);
INSERT INTO `sys_area` VALUES ('220204', '220200', '船营区', '吉林省', '吉林市', '船营区', '吉林省吉林市船营区', 0);
INSERT INTO `sys_area` VALUES ('220211', '220200', '丰满区', '吉林省', '吉林市', '丰满区', '吉林省吉林市丰满区', 0);
INSERT INTO `sys_area` VALUES ('220221', '220200', '永吉县', '吉林省', '吉林市', '永吉县', '吉林省吉林市永吉县', 0);
INSERT INTO `sys_area` VALUES ('220281', '220200', '蛟河市', '吉林省', '吉林市', '蛟河市', '吉林省吉林市蛟河市', 0);
INSERT INTO `sys_area` VALUES ('220282', '220200', '桦甸市', '吉林省', '吉林市', '桦甸市', '吉林省吉林市桦甸市', 0);
INSERT INTO `sys_area` VALUES ('220283', '220200', '舒兰市', '吉林省', '吉林市', '舒兰市', '吉林省吉林市舒兰市', 0);
INSERT INTO `sys_area` VALUES ('220284', '220200', '磐石市', '吉林省', '吉林市', '磐石市', '吉林省吉林市磐石市', 0);
INSERT INTO `sys_area` VALUES ('220300', '220000', '四平市', '吉林省', '四平市', '', '吉林省四平市', 0);
INSERT INTO `sys_area` VALUES ('220301', '220300', '市辖区', '吉林省', '四平市', '市辖区', '吉林省四平市市辖区', 0);
INSERT INTO `sys_area` VALUES ('220302', '220300', '铁西区', '吉林省', '四平市', '铁西区', '吉林省四平市铁西区', 0);
INSERT INTO `sys_area` VALUES ('220303', '220300', '铁东区', '吉林省', '四平市', '铁东区', '吉林省四平市铁东区', 0);
INSERT INTO `sys_area` VALUES ('220322', '220300', '梨树县', '吉林省', '四平市', '梨树县', '吉林省四平市梨树县', 0);
INSERT INTO `sys_area` VALUES ('220323', '220300', '伊通满族自治县', '吉林省', '四平市', '伊通满族自治县', '吉林省四平市伊通满族自治县', 0);
INSERT INTO `sys_area` VALUES ('220381', '220300', '公主岭市', '吉林省', '四平市', '公主岭市', '吉林省四平市公主岭市', 0);
INSERT INTO `sys_area` VALUES ('220382', '220300', '双辽市', '吉林省', '四平市', '双辽市', '吉林省四平市双辽市', 0);
INSERT INTO `sys_area` VALUES ('220400', '220000', '辽源市', '吉林省', '辽源市', '', '吉林省辽源市', 0);
INSERT INTO `sys_area` VALUES ('220401', '220400', '市辖区', '吉林省', '辽源市', '市辖区', '吉林省辽源市市辖区', 0);
INSERT INTO `sys_area` VALUES ('220402', '220400', '龙山区', '吉林省', '辽源市', '龙山区', '吉林省辽源市龙山区', 0);
INSERT INTO `sys_area` VALUES ('220403', '220400', '西安区', '吉林省', '辽源市', '西安区', '吉林省辽源市西安区', 0);
INSERT INTO `sys_area` VALUES ('220421', '220400', '东丰县', '吉林省', '辽源市', '东丰县', '吉林省辽源市东丰县', 0);
INSERT INTO `sys_area` VALUES ('220422', '220400', '东辽县', '吉林省', '辽源市', '东辽县', '吉林省辽源市东辽县', 0);
INSERT INTO `sys_area` VALUES ('220500', '220000', '通化市', '吉林省', '通化市', '', '吉林省通化市', 0);
INSERT INTO `sys_area` VALUES ('220501', '220500', '市辖区', '吉林省', '通化市', '市辖区', '吉林省通化市市辖区', 0);
INSERT INTO `sys_area` VALUES ('220502', '220500', '东昌区', '吉林省', '通化市', '东昌区', '吉林省通化市东昌区', 0);
INSERT INTO `sys_area` VALUES ('220503', '220500', '二道江区', '吉林省', '通化市', '二道江区', '吉林省通化市二道江区', 0);
INSERT INTO `sys_area` VALUES ('220521', '220500', '通化县', '吉林省', '通化市', '通化县', '吉林省通化市通化县', 0);
INSERT INTO `sys_area` VALUES ('220523', '220500', '辉南县', '吉林省', '通化市', '辉南县', '吉林省通化市辉南县', 0);
INSERT INTO `sys_area` VALUES ('220524', '220500', '柳河县', '吉林省', '通化市', '柳河县', '吉林省通化市柳河县', 0);
INSERT INTO `sys_area` VALUES ('220581', '220500', '梅河口市', '吉林省', '通化市', '梅河口市', '吉林省通化市梅河口市', 0);
INSERT INTO `sys_area` VALUES ('220582', '220500', '集安市', '吉林省', '通化市', '集安市', '吉林省通化市集安市', 0);
INSERT INTO `sys_area` VALUES ('220600', '220000', '白山市', '吉林省', '白山市', '', '吉林省白山市', 0);
INSERT INTO `sys_area` VALUES ('220601', '220600', '市辖区', '吉林省', '白山市', '市辖区', '吉林省白山市市辖区', 0);
INSERT INTO `sys_area` VALUES ('220602', '220600', '浑江区', '吉林省', '白山市', '浑江区', '吉林省白山市浑江区', 0);
INSERT INTO `sys_area` VALUES ('220605', '220600', '江源区', '吉林省', '白山市', '江源区', '吉林省白山市江源区', 0);
INSERT INTO `sys_area` VALUES ('220621', '220600', '抚松县', '吉林省', '白山市', '抚松县', '吉林省白山市抚松县', 0);
INSERT INTO `sys_area` VALUES ('220622', '220600', '靖宇县', '吉林省', '白山市', '靖宇县', '吉林省白山市靖宇县', 0);
INSERT INTO `sys_area` VALUES ('220623', '220600', '长白朝鲜族自治县', '吉林省', '白山市', '长白朝鲜族自治县', '吉林省白山市长白朝鲜族自治县', 0);
INSERT INTO `sys_area` VALUES ('220681', '220600', '临江市', '吉林省', '白山市', '临江市', '吉林省白山市临江市', 0);
INSERT INTO `sys_area` VALUES ('220700', '220000', '松原市', '吉林省', '松原市', '', '吉林省松原市', 0);
INSERT INTO `sys_area` VALUES ('220701', '220700', '市辖区', '吉林省', '松原市', '市辖区', '吉林省松原市市辖区', 0);
INSERT INTO `sys_area` VALUES ('220702', '220700', '宁江区', '吉林省', '松原市', '宁江区', '吉林省松原市宁江区', 0);
INSERT INTO `sys_area` VALUES ('220721', '220700', '前郭尔罗斯蒙古族自治县', '吉林省', '松原市', '前郭尔罗斯蒙古族自治县', '吉林省松原市前郭尔罗斯蒙古族自治县', 0);
INSERT INTO `sys_area` VALUES ('220722', '220700', '长岭县', '吉林省', '松原市', '长岭县', '吉林省松原市长岭县', 0);
INSERT INTO `sys_area` VALUES ('220723', '220700', '乾安县', '吉林省', '松原市', '乾安县', '吉林省松原市乾安县', 0);
INSERT INTO `sys_area` VALUES ('220781', '220700', '扶余市', '吉林省', '松原市', '扶余市', '吉林省松原市扶余市', 0);
INSERT INTO `sys_area` VALUES ('220800', '220000', '白城市', '吉林省', '白城市', '', '吉林省白城市', 0);
INSERT INTO `sys_area` VALUES ('220801', '220800', '市辖区', '吉林省', '白城市', '市辖区', '吉林省白城市市辖区', 0);
INSERT INTO `sys_area` VALUES ('220802', '220800', '洮北区', '吉林省', '白城市', '洮北区', '吉林省白城市洮北区', 0);
INSERT INTO `sys_area` VALUES ('220821', '220800', '镇赉县', '吉林省', '白城市', '镇赉县', '吉林省白城市镇赉县', 0);
INSERT INTO `sys_area` VALUES ('220822', '220800', '通榆县', '吉林省', '白城市', '通榆县', '吉林省白城市通榆县', 0);
INSERT INTO `sys_area` VALUES ('220881', '220800', '洮南市', '吉林省', '白城市', '洮南市', '吉林省白城市洮南市', 0);
INSERT INTO `sys_area` VALUES ('220882', '220800', '大安市', '吉林省', '白城市', '大安市', '吉林省白城市大安市', 0);
INSERT INTO `sys_area` VALUES ('222400', '220000', '延边朝鲜族自治州', '吉林省', '延边朝鲜族自治州', '', '吉林省延边朝鲜族自治州', 0);
INSERT INTO `sys_area` VALUES ('222401', '222400', '延吉市', '吉林省', '延边朝鲜族自治州', '延吉市', '吉林省延边朝鲜族自治州延吉市', 0);
INSERT INTO `sys_area` VALUES ('222402', '222400', '图们市', '吉林省', '延边朝鲜族自治州', '图们市', '吉林省延边朝鲜族自治州图们市', 0);
INSERT INTO `sys_area` VALUES ('222403', '222400', '敦化市', '吉林省', '延边朝鲜族自治州', '敦化市', '吉林省延边朝鲜族自治州敦化市', 0);
INSERT INTO `sys_area` VALUES ('222404', '222400', '珲春市', '吉林省', '延边朝鲜族自治州', '珲春市', '吉林省延边朝鲜族自治州珲春市', 0);
INSERT INTO `sys_area` VALUES ('222405', '222400', '龙井市', '吉林省', '延边朝鲜族自治州', '龙井市', '吉林省延边朝鲜族自治州龙井市', 0);
INSERT INTO `sys_area` VALUES ('222406', '222400', '和龙市', '吉林省', '延边朝鲜族自治州', '和龙市', '吉林省延边朝鲜族自治州和龙市', 0);
INSERT INTO `sys_area` VALUES ('222424', '222400', '汪清县', '吉林省', '延边朝鲜族自治州', '汪清县', '吉林省延边朝鲜族自治州汪清县', 0);
INSERT INTO `sys_area` VALUES ('222426', '222400', '安图县', '吉林省', '延边朝鲜族自治州', '安图县', '吉林省延边朝鲜族自治州安图县', 0);
INSERT INTO `sys_area` VALUES ('230000', '86', '黑龙江省', '黑龙江省', '', '', '黑龙江省', 0);
INSERT INTO `sys_area` VALUES ('230100', '230000', '哈尔滨市', '黑龙江省', '哈尔滨市', '', '黑龙江省哈尔滨市', 0);
INSERT INTO `sys_area` VALUES ('230101', '230100', '市辖区', '黑龙江省', '哈尔滨市', '市辖区', '黑龙江省哈尔滨市市辖区', 0);
INSERT INTO `sys_area` VALUES ('230102', '230100', '道里区', '黑龙江省', '哈尔滨市', '道里区', '黑龙江省哈尔滨市道里区', 0);
INSERT INTO `sys_area` VALUES ('230103', '230100', '南岗区', '黑龙江省', '哈尔滨市', '南岗区', '黑龙江省哈尔滨市南岗区', 0);
INSERT INTO `sys_area` VALUES ('230104', '230100', '道外区', '黑龙江省', '哈尔滨市', '道外区', '黑龙江省哈尔滨市道外区', 0);
INSERT INTO `sys_area` VALUES ('230108', '230100', '平房区', '黑龙江省', '哈尔滨市', '平房区', '黑龙江省哈尔滨市平房区', 0);
INSERT INTO `sys_area` VALUES ('230109', '230100', '松北区', '黑龙江省', '哈尔滨市', '松北区', '黑龙江省哈尔滨市松北区', 0);
INSERT INTO `sys_area` VALUES ('230110', '230100', '香坊区', '黑龙江省', '哈尔滨市', '香坊区', '黑龙江省哈尔滨市香坊区', 0);
INSERT INTO `sys_area` VALUES ('230111', '230100', '呼兰区', '黑龙江省', '哈尔滨市', '呼兰区', '黑龙江省哈尔滨市呼兰区', 0);
INSERT INTO `sys_area` VALUES ('230112', '230100', '阿城区', '黑龙江省', '哈尔滨市', '阿城区', '黑龙江省哈尔滨市阿城区', 0);
INSERT INTO `sys_area` VALUES ('230113', '230100', '双城区', '黑龙江省', '哈尔滨市', '双城区', '黑龙江省哈尔滨市双城区', 0);
INSERT INTO `sys_area` VALUES ('230123', '230100', '依兰县', '黑龙江省', '哈尔滨市', '依兰县', '黑龙江省哈尔滨市依兰县', 0);
INSERT INTO `sys_area` VALUES ('230124', '230100', '方正县', '黑龙江省', '哈尔滨市', '方正县', '黑龙江省哈尔滨市方正县', 0);
INSERT INTO `sys_area` VALUES ('230125', '230100', '宾县', '黑龙江省', '哈尔滨市', '宾县', '黑龙江省哈尔滨市宾县', 0);
INSERT INTO `sys_area` VALUES ('230126', '230100', '巴彦县', '黑龙江省', '哈尔滨市', '巴彦县', '黑龙江省哈尔滨市巴彦县', 0);
INSERT INTO `sys_area` VALUES ('230127', '230100', '木兰县', '黑龙江省', '哈尔滨市', '木兰县', '黑龙江省哈尔滨市木兰县', 0);
INSERT INTO `sys_area` VALUES ('230128', '230100', '通河县', '黑龙江省', '哈尔滨市', '通河县', '黑龙江省哈尔滨市通河县', 0);
INSERT INTO `sys_area` VALUES ('230129', '230100', '延寿县', '黑龙江省', '哈尔滨市', '延寿县', '黑龙江省哈尔滨市延寿县', 0);
INSERT INTO `sys_area` VALUES ('230183', '230100', '尚志市', '黑龙江省', '哈尔滨市', '尚志市', '黑龙江省哈尔滨市尚志市', 0);
INSERT INTO `sys_area` VALUES ('230184', '230100', '五常市', '黑龙江省', '哈尔滨市', '五常市', '黑龙江省哈尔滨市五常市', 0);
INSERT INTO `sys_area` VALUES ('230200', '230000', '齐齐哈尔市', '黑龙江省', '齐齐哈尔市', '', '黑龙江省齐齐哈尔市', 0);
INSERT INTO `sys_area` VALUES ('230201', '230200', '市辖区', '黑龙江省', '齐齐哈尔市', '市辖区', '黑龙江省齐齐哈尔市市辖区', 0);
INSERT INTO `sys_area` VALUES ('230202', '230200', '龙沙区', '黑龙江省', '齐齐哈尔市', '龙沙区', '黑龙江省齐齐哈尔市龙沙区', 0);
INSERT INTO `sys_area` VALUES ('230203', '230200', '建华区', '黑龙江省', '齐齐哈尔市', '建华区', '黑龙江省齐齐哈尔市建华区', 0);
INSERT INTO `sys_area` VALUES ('230204', '230200', '铁锋区', '黑龙江省', '齐齐哈尔市', '铁锋区', '黑龙江省齐齐哈尔市铁锋区', 0);
INSERT INTO `sys_area` VALUES ('230205', '230200', '昂昂溪区', '黑龙江省', '齐齐哈尔市', '昂昂溪区', '黑龙江省齐齐哈尔市昂昂溪区', 0);
INSERT INTO `sys_area` VALUES ('230206', '230200', '富拉尔基区', '黑龙江省', '齐齐哈尔市', '富拉尔基区', '黑龙江省齐齐哈尔市富拉尔基区', 0);
INSERT INTO `sys_area` VALUES ('230207', '230200', '碾子山区', '黑龙江省', '齐齐哈尔市', '碾子山区', '黑龙江省齐齐哈尔市碾子山区', 0);
INSERT INTO `sys_area` VALUES ('230208', '230200', '梅里斯达斡尔族区', '黑龙江省', '齐齐哈尔市', '梅里斯达斡尔族区', '黑龙江省齐齐哈尔市梅里斯达斡尔族区', 0);
INSERT INTO `sys_area` VALUES ('230221', '230200', '龙江县', '黑龙江省', '齐齐哈尔市', '龙江县', '黑龙江省齐齐哈尔市龙江县', 0);
INSERT INTO `sys_area` VALUES ('230223', '230200', '依安县', '黑龙江省', '齐齐哈尔市', '依安县', '黑龙江省齐齐哈尔市依安县', 0);
INSERT INTO `sys_area` VALUES ('230224', '230200', '泰来县', '黑龙江省', '齐齐哈尔市', '泰来县', '黑龙江省齐齐哈尔市泰来县', 0);
INSERT INTO `sys_area` VALUES ('230225', '230200', '甘南县', '黑龙江省', '齐齐哈尔市', '甘南县', '黑龙江省齐齐哈尔市甘南县', 0);
INSERT INTO `sys_area` VALUES ('230227', '230200', '富裕县', '黑龙江省', '齐齐哈尔市', '富裕县', '黑龙江省齐齐哈尔市富裕县', 0);
INSERT INTO `sys_area` VALUES ('230229', '230200', '克山县', '黑龙江省', '齐齐哈尔市', '克山县', '黑龙江省齐齐哈尔市克山县', 0);
INSERT INTO `sys_area` VALUES ('230230', '230200', '克东县', '黑龙江省', '齐齐哈尔市', '克东县', '黑龙江省齐齐哈尔市克东县', 0);
INSERT INTO `sys_area` VALUES ('230231', '230200', '拜泉县', '黑龙江省', '齐齐哈尔市', '拜泉县', '黑龙江省齐齐哈尔市拜泉县', 0);
INSERT INTO `sys_area` VALUES ('230281', '230200', '讷河市', '黑龙江省', '齐齐哈尔市', '讷河市', '黑龙江省齐齐哈尔市讷河市', 0);
INSERT INTO `sys_area` VALUES ('230300', '230000', '鸡西市', '黑龙江省', '鸡西市', '', '黑龙江省鸡西市', 0);
INSERT INTO `sys_area` VALUES ('230301', '230300', '市辖区', '黑龙江省', '鸡西市', '市辖区', '黑龙江省鸡西市市辖区', 0);
INSERT INTO `sys_area` VALUES ('230302', '230300', '鸡冠区', '黑龙江省', '鸡西市', '鸡冠区', '黑龙江省鸡西市鸡冠区', 0);
INSERT INTO `sys_area` VALUES ('230303', '230300', '恒山区', '黑龙江省', '鸡西市', '恒山区', '黑龙江省鸡西市恒山区', 0);
INSERT INTO `sys_area` VALUES ('230304', '230300', '滴道区', '黑龙江省', '鸡西市', '滴道区', '黑龙江省鸡西市滴道区', 0);
INSERT INTO `sys_area` VALUES ('230305', '230300', '梨树区', '黑龙江省', '鸡西市', '梨树区', '黑龙江省鸡西市梨树区', 0);
INSERT INTO `sys_area` VALUES ('230306', '230300', '城子河区', '黑龙江省', '鸡西市', '城子河区', '黑龙江省鸡西市城子河区', 0);
INSERT INTO `sys_area` VALUES ('230307', '230300', '麻山区', '黑龙江省', '鸡西市', '麻山区', '黑龙江省鸡西市麻山区', 0);
INSERT INTO `sys_area` VALUES ('230321', '230300', '鸡东县', '黑龙江省', '鸡西市', '鸡东县', '黑龙江省鸡西市鸡东县', 0);
INSERT INTO `sys_area` VALUES ('230381', '230300', '虎林市', '黑龙江省', '鸡西市', '虎林市', '黑龙江省鸡西市虎林市', 0);
INSERT INTO `sys_area` VALUES ('230382', '230300', '密山市', '黑龙江省', '鸡西市', '密山市', '黑龙江省鸡西市密山市', 0);
INSERT INTO `sys_area` VALUES ('230400', '230000', '鹤岗市', '黑龙江省', '鹤岗市', '', '黑龙江省鹤岗市', 0);
INSERT INTO `sys_area` VALUES ('230401', '230400', '市辖区', '黑龙江省', '鹤岗市', '市辖区', '黑龙江省鹤岗市市辖区', 0);
INSERT INTO `sys_area` VALUES ('230402', '230400', '向阳区', '黑龙江省', '鹤岗市', '向阳区', '黑龙江省鹤岗市向阳区', 0);
INSERT INTO `sys_area` VALUES ('230403', '230400', '工农区', '黑龙江省', '鹤岗市', '工农区', '黑龙江省鹤岗市工农区', 0);
INSERT INTO `sys_area` VALUES ('230404', '230400', '南山区', '黑龙江省', '鹤岗市', '南山区', '黑龙江省鹤岗市南山区', 0);
INSERT INTO `sys_area` VALUES ('230405', '230400', '兴安区', '黑龙江省', '鹤岗市', '兴安区', '黑龙江省鹤岗市兴安区', 0);
INSERT INTO `sys_area` VALUES ('230406', '230400', '东山区', '黑龙江省', '鹤岗市', '东山区', '黑龙江省鹤岗市东山区', 0);
INSERT INTO `sys_area` VALUES ('230407', '230400', '兴山区', '黑龙江省', '鹤岗市', '兴山区', '黑龙江省鹤岗市兴山区', 0);
INSERT INTO `sys_area` VALUES ('230421', '230400', '萝北县', '黑龙江省', '鹤岗市', '萝北县', '黑龙江省鹤岗市萝北县', 0);
INSERT INTO `sys_area` VALUES ('230422', '230400', '绥滨县', '黑龙江省', '鹤岗市', '绥滨县', '黑龙江省鹤岗市绥滨县', 0);
INSERT INTO `sys_area` VALUES ('230500', '230000', '双鸭山市', '黑龙江省', '双鸭山市', '', '黑龙江省双鸭山市', 0);
INSERT INTO `sys_area` VALUES ('230501', '230500', '市辖区', '黑龙江省', '双鸭山市', '市辖区', '黑龙江省双鸭山市市辖区', 0);
INSERT INTO `sys_area` VALUES ('230502', '230500', '尖山区', '黑龙江省', '双鸭山市', '尖山区', '黑龙江省双鸭山市尖山区', 0);
INSERT INTO `sys_area` VALUES ('230503', '230500', '岭东区', '黑龙江省', '双鸭山市', '岭东区', '黑龙江省双鸭山市岭东区', 0);
INSERT INTO `sys_area` VALUES ('230505', '230500', '四方台区', '黑龙江省', '双鸭山市', '四方台区', '黑龙江省双鸭山市四方台区', 0);
INSERT INTO `sys_area` VALUES ('230506', '230500', '宝山区', '黑龙江省', '双鸭山市', '宝山区', '黑龙江省双鸭山市宝山区', 0);
INSERT INTO `sys_area` VALUES ('230521', '230500', '集贤县', '黑龙江省', '双鸭山市', '集贤县', '黑龙江省双鸭山市集贤县', 0);
INSERT INTO `sys_area` VALUES ('230522', '230500', '友谊县', '黑龙江省', '双鸭山市', '友谊县', '黑龙江省双鸭山市友谊县', 0);
INSERT INTO `sys_area` VALUES ('230523', '230500', '宝清县', '黑龙江省', '双鸭山市', '宝清县', '黑龙江省双鸭山市宝清县', 0);
INSERT INTO `sys_area` VALUES ('230524', '230500', '饶河县', '黑龙江省', '双鸭山市', '饶河县', '黑龙江省双鸭山市饶河县', 0);
INSERT INTO `sys_area` VALUES ('230600', '230000', '大庆市', '黑龙江省', '大庆市', '', '黑龙江省大庆市', 0);
INSERT INTO `sys_area` VALUES ('230601', '230600', '市辖区', '黑龙江省', '大庆市', '市辖区', '黑龙江省大庆市市辖区', 0);
INSERT INTO `sys_area` VALUES ('230602', '230600', '萨尔图区', '黑龙江省', '大庆市', '萨尔图区', '黑龙江省大庆市萨尔图区', 0);
INSERT INTO `sys_area` VALUES ('230603', '230600', '龙凤区', '黑龙江省', '大庆市', '龙凤区', '黑龙江省大庆市龙凤区', 0);
INSERT INTO `sys_area` VALUES ('230604', '230600', '让胡路区', '黑龙江省', '大庆市', '让胡路区', '黑龙江省大庆市让胡路区', 0);
INSERT INTO `sys_area` VALUES ('230605', '230600', '红岗区', '黑龙江省', '大庆市', '红岗区', '黑龙江省大庆市红岗区', 0);
INSERT INTO `sys_area` VALUES ('230606', '230600', '大同区', '黑龙江省', '大庆市', '大同区', '黑龙江省大庆市大同区', 0);
INSERT INTO `sys_area` VALUES ('230621', '230600', '肇州县', '黑龙江省', '大庆市', '肇州县', '黑龙江省大庆市肇州县', 0);
INSERT INTO `sys_area` VALUES ('230622', '230600', '肇源县', '黑龙江省', '大庆市', '肇源县', '黑龙江省大庆市肇源县', 0);
INSERT INTO `sys_area` VALUES ('230623', '230600', '林甸县', '黑龙江省', '大庆市', '林甸县', '黑龙江省大庆市林甸县', 0);
INSERT INTO `sys_area` VALUES ('230624', '230600', '杜尔伯特蒙古族自治县', '黑龙江省', '大庆市', '杜尔伯特蒙古族自治县', '黑龙江省大庆市杜尔伯特蒙古族自治县', 0);
INSERT INTO `sys_area` VALUES ('230700', '230000', '伊春市', '黑龙江省', '伊春市', '', '黑龙江省伊春市', 0);
INSERT INTO `sys_area` VALUES ('230701', '230700', '市辖区', '黑龙江省', '伊春市', '市辖区', '黑龙江省伊春市市辖区', 0);
INSERT INTO `sys_area` VALUES ('230702', '230700', '伊春区', '黑龙江省', '伊春市', '伊春区', '黑龙江省伊春市伊春区', 0);
INSERT INTO `sys_area` VALUES ('230703', '230700', '南岔区', '黑龙江省', '伊春市', '南岔区', '黑龙江省伊春市南岔区', 0);
INSERT INTO `sys_area` VALUES ('230704', '230700', '友好区', '黑龙江省', '伊春市', '友好区', '黑龙江省伊春市友好区', 0);
INSERT INTO `sys_area` VALUES ('230705', '230700', '西林区', '黑龙江省', '伊春市', '西林区', '黑龙江省伊春市西林区', 0);
INSERT INTO `sys_area` VALUES ('230706', '230700', '翠峦区', '黑龙江省', '伊春市', '翠峦区', '黑龙江省伊春市翠峦区', 0);
INSERT INTO `sys_area` VALUES ('230707', '230700', '新青区', '黑龙江省', '伊春市', '新青区', '黑龙江省伊春市新青区', 0);
INSERT INTO `sys_area` VALUES ('230708', '230700', '美溪区', '黑龙江省', '伊春市', '美溪区', '黑龙江省伊春市美溪区', 0);
INSERT INTO `sys_area` VALUES ('230709', '230700', '金山屯区', '黑龙江省', '伊春市', '金山屯区', '黑龙江省伊春市金山屯区', 0);
INSERT INTO `sys_area` VALUES ('230710', '230700', '五营区', '黑龙江省', '伊春市', '五营区', '黑龙江省伊春市五营区', 0);
INSERT INTO `sys_area` VALUES ('230711', '230700', '乌马河区', '黑龙江省', '伊春市', '乌马河区', '黑龙江省伊春市乌马河区', 0);
INSERT INTO `sys_area` VALUES ('230712', '230700', '汤旺河区', '黑龙江省', '伊春市', '汤旺河区', '黑龙江省伊春市汤旺河区', 0);
INSERT INTO `sys_area` VALUES ('230713', '230700', '带岭区', '黑龙江省', '伊春市', '带岭区', '黑龙江省伊春市带岭区', 0);
INSERT INTO `sys_area` VALUES ('230714', '230700', '乌伊岭区', '黑龙江省', '伊春市', '乌伊岭区', '黑龙江省伊春市乌伊岭区', 0);
INSERT INTO `sys_area` VALUES ('230715', '230700', '红星区', '黑龙江省', '伊春市', '红星区', '黑龙江省伊春市红星区', 0);
INSERT INTO `sys_area` VALUES ('230716', '230700', '上甘岭区', '黑龙江省', '伊春市', '上甘岭区', '黑龙江省伊春市上甘岭区', 0);
INSERT INTO `sys_area` VALUES ('230722', '230700', '嘉荫县', '黑龙江省', '伊春市', '嘉荫县', '黑龙江省伊春市嘉荫县', 0);
INSERT INTO `sys_area` VALUES ('230781', '230700', '铁力市', '黑龙江省', '伊春市', '铁力市', '黑龙江省伊春市铁力市', 0);
INSERT INTO `sys_area` VALUES ('230800', '230000', '佳木斯市', '黑龙江省', '佳木斯市', '', '黑龙江省佳木斯市', 0);
INSERT INTO `sys_area` VALUES ('230801', '230800', '市辖区', '黑龙江省', '佳木斯市', '市辖区', '黑龙江省佳木斯市市辖区', 0);
INSERT INTO `sys_area` VALUES ('230803', '230800', '向阳区', '黑龙江省', '佳木斯市', '向阳区', '黑龙江省佳木斯市向阳区', 0);
INSERT INTO `sys_area` VALUES ('230804', '230800', '前进区', '黑龙江省', '佳木斯市', '前进区', '黑龙江省佳木斯市前进区', 0);
INSERT INTO `sys_area` VALUES ('230805', '230800', '东风区', '黑龙江省', '佳木斯市', '东风区', '黑龙江省佳木斯市东风区', 0);
INSERT INTO `sys_area` VALUES ('230811', '230800', '郊区', '黑龙江省', '佳木斯市', '郊区', '黑龙江省佳木斯市郊区', 0);
INSERT INTO `sys_area` VALUES ('230822', '230800', '桦南县', '黑龙江省', '佳木斯市', '桦南县', '黑龙江省佳木斯市桦南县', 0);
INSERT INTO `sys_area` VALUES ('230826', '230800', '桦川县', '黑龙江省', '佳木斯市', '桦川县', '黑龙江省佳木斯市桦川县', 0);
INSERT INTO `sys_area` VALUES ('230828', '230800', '汤原县', '黑龙江省', '佳木斯市', '汤原县', '黑龙江省佳木斯市汤原县', 0);
INSERT INTO `sys_area` VALUES ('230881', '230800', '同江市', '黑龙江省', '佳木斯市', '同江市', '黑龙江省佳木斯市同江市', 0);
INSERT INTO `sys_area` VALUES ('230882', '230800', '富锦市', '黑龙江省', '佳木斯市', '富锦市', '黑龙江省佳木斯市富锦市', 0);
INSERT INTO `sys_area` VALUES ('230883', '230800', '抚远市', '黑龙江省', '佳木斯市', '抚远市', '黑龙江省佳木斯市抚远市', 0);
INSERT INTO `sys_area` VALUES ('230900', '230000', '七台河市', '黑龙江省', '七台河市', '', '黑龙江省七台河市', 0);
INSERT INTO `sys_area` VALUES ('230901', '230900', '市辖区', '黑龙江省', '七台河市', '市辖区', '黑龙江省七台河市市辖区', 0);
INSERT INTO `sys_area` VALUES ('230902', '230900', '新兴区', '黑龙江省', '七台河市', '新兴区', '黑龙江省七台河市新兴区', 0);
INSERT INTO `sys_area` VALUES ('230903', '230900', '桃山区', '黑龙江省', '七台河市', '桃山区', '黑龙江省七台河市桃山区', 0);
INSERT INTO `sys_area` VALUES ('230904', '230900', '茄子河区', '黑龙江省', '七台河市', '茄子河区', '黑龙江省七台河市茄子河区', 0);
INSERT INTO `sys_area` VALUES ('230921', '230900', '勃利县', '黑龙江省', '七台河市', '勃利县', '黑龙江省七台河市勃利县', 0);
INSERT INTO `sys_area` VALUES ('231000', '230000', '牡丹江市', '黑龙江省', '牡丹江市', '', '黑龙江省牡丹江市', 0);
INSERT INTO `sys_area` VALUES ('231001', '231000', '市辖区', '黑龙江省', '牡丹江市', '市辖区', '黑龙江省牡丹江市市辖区', 0);
INSERT INTO `sys_area` VALUES ('231002', '231000', '东安区', '黑龙江省', '牡丹江市', '东安区', '黑龙江省牡丹江市东安区', 0);
INSERT INTO `sys_area` VALUES ('231003', '231000', '阳明区', '黑龙江省', '牡丹江市', '阳明区', '黑龙江省牡丹江市阳明区', 0);
INSERT INTO `sys_area` VALUES ('231004', '231000', '爱民区', '黑龙江省', '牡丹江市', '爱民区', '黑龙江省牡丹江市爱民区', 0);
INSERT INTO `sys_area` VALUES ('231005', '231000', '西安区', '黑龙江省', '牡丹江市', '西安区', '黑龙江省牡丹江市西安区', 0);
INSERT INTO `sys_area` VALUES ('231025', '231000', '林口县', '黑龙江省', '牡丹江市', '林口县', '黑龙江省牡丹江市林口县', 0);
INSERT INTO `sys_area` VALUES ('231081', '231000', '绥芬河市', '黑龙江省', '牡丹江市', '绥芬河市', '黑龙江省牡丹江市绥芬河市', 0);
INSERT INTO `sys_area` VALUES ('231083', '231000', '海林市', '黑龙江省', '牡丹江市', '海林市', '黑龙江省牡丹江市海林市', 0);
INSERT INTO `sys_area` VALUES ('231084', '231000', '宁安市', '黑龙江省', '牡丹江市', '宁安市', '黑龙江省牡丹江市宁安市', 0);
INSERT INTO `sys_area` VALUES ('231085', '231000', '穆棱市', '黑龙江省', '牡丹江市', '穆棱市', '黑龙江省牡丹江市穆棱市', 0);
INSERT INTO `sys_area` VALUES ('231086', '231000', '东宁市', '黑龙江省', '牡丹江市', '东宁市', '黑龙江省牡丹江市东宁市', 0);
INSERT INTO `sys_area` VALUES ('231100', '230000', '黑河市', '黑龙江省', '黑河市', '', '黑龙江省黑河市', 0);
INSERT INTO `sys_area` VALUES ('231101', '231100', '市辖区', '黑龙江省', '黑河市', '市辖区', '黑龙江省黑河市市辖区', 0);
INSERT INTO `sys_area` VALUES ('231102', '231100', '爱辉区', '黑龙江省', '黑河市', '爱辉区', '黑龙江省黑河市爱辉区', 0);
INSERT INTO `sys_area` VALUES ('231121', '231100', '嫩江县', '黑龙江省', '黑河市', '嫩江县', '黑龙江省黑河市嫩江县', 0);
INSERT INTO `sys_area` VALUES ('231123', '231100', '逊克县', '黑龙江省', '黑河市', '逊克县', '黑龙江省黑河市逊克县', 0);
INSERT INTO `sys_area` VALUES ('231124', '231100', '孙吴县', '黑龙江省', '黑河市', '孙吴县', '黑龙江省黑河市孙吴县', 0);
INSERT INTO `sys_area` VALUES ('231181', '231100', '北安市', '黑龙江省', '黑河市', '北安市', '黑龙江省黑河市北安市', 0);
INSERT INTO `sys_area` VALUES ('231182', '231100', '五大连池市', '黑龙江省', '黑河市', '五大连池市', '黑龙江省黑河市五大连池市', 0);
INSERT INTO `sys_area` VALUES ('231200', '230000', '绥化市', '黑龙江省', '绥化市', '', '黑龙江省绥化市', 0);
INSERT INTO `sys_area` VALUES ('231201', '231200', '市辖区', '黑龙江省', '绥化市', '市辖区', '黑龙江省绥化市市辖区', 0);
INSERT INTO `sys_area` VALUES ('231202', '231200', '北林区', '黑龙江省', '绥化市', '北林区', '黑龙江省绥化市北林区', 0);
INSERT INTO `sys_area` VALUES ('231221', '231200', '望奎县', '黑龙江省', '绥化市', '望奎县', '黑龙江省绥化市望奎县', 0);
INSERT INTO `sys_area` VALUES ('231222', '231200', '兰西县', '黑龙江省', '绥化市', '兰西县', '黑龙江省绥化市兰西县', 0);
INSERT INTO `sys_area` VALUES ('231223', '231200', '青冈县', '黑龙江省', '绥化市', '青冈县', '黑龙江省绥化市青冈县', 0);
INSERT INTO `sys_area` VALUES ('231224', '231200', '庆安县', '黑龙江省', '绥化市', '庆安县', '黑龙江省绥化市庆安县', 0);
INSERT INTO `sys_area` VALUES ('231225', '231200', '明水县', '黑龙江省', '绥化市', '明水县', '黑龙江省绥化市明水县', 0);
INSERT INTO `sys_area` VALUES ('231226', '231200', '绥棱县', '黑龙江省', '绥化市', '绥棱县', '黑龙江省绥化市绥棱县', 0);
INSERT INTO `sys_area` VALUES ('231281', '231200', '安达市', '黑龙江省', '绥化市', '安达市', '黑龙江省绥化市安达市', 0);
INSERT INTO `sys_area` VALUES ('231282', '231200', '肇东市', '黑龙江省', '绥化市', '肇东市', '黑龙江省绥化市肇东市', 0);
INSERT INTO `sys_area` VALUES ('231283', '231200', '海伦市', '黑龙江省', '绥化市', '海伦市', '黑龙江省绥化市海伦市', 0);
INSERT INTO `sys_area` VALUES ('232700', '230000', '大兴安岭地区', '黑龙江省', '大兴安岭地区', '', '黑龙江省大兴安岭地区', 0);
INSERT INTO `sys_area` VALUES ('232721', '232700', '呼玛县', '黑龙江省', '大兴安岭地区', '呼玛县', '黑龙江省大兴安岭地区呼玛县', 0);
INSERT INTO `sys_area` VALUES ('232722', '232700', '塔河县', '黑龙江省', '大兴安岭地区', '塔河县', '黑龙江省大兴安岭地区塔河县', 0);
INSERT INTO `sys_area` VALUES ('232723', '232700', '漠河县', '黑龙江省', '大兴安岭地区', '漠河县', '黑龙江省大兴安岭地区漠河县', 0);
INSERT INTO `sys_area` VALUES ('310000', '86', '上海市', '上海市', '', '', '上海市', 0);
INSERT INTO `sys_area` VALUES ('310100', '310000', '市辖区', '上海市', '市辖区', '', '上海市市辖区', 0);
INSERT INTO `sys_area` VALUES ('310101', '310100', '黄浦区', '上海市', '市辖区', '黄浦区', '上海市市辖区黄浦区', 0);
INSERT INTO `sys_area` VALUES ('310104', '310100', '徐汇区', '上海市', '市辖区', '徐汇区', '上海市市辖区徐汇区', 0);
INSERT INTO `sys_area` VALUES ('310105', '310100', '长宁区', '上海市', '市辖区', '长宁区', '上海市市辖区长宁区', 0);
INSERT INTO `sys_area` VALUES ('310106', '310100', '静安区', '上海市', '市辖区', '静安区', '上海市市辖区静安区', 0);
INSERT INTO `sys_area` VALUES ('310107', '310100', '普陀区', '上海市', '市辖区', '普陀区', '上海市市辖区普陀区', 0);
INSERT INTO `sys_area` VALUES ('310109', '310100', '虹口区', '上海市', '市辖区', '虹口区', '上海市市辖区虹口区', 0);
INSERT INTO `sys_area` VALUES ('310110', '310100', '杨浦区', '上海市', '市辖区', '杨浦区', '上海市市辖区杨浦区', 0);
INSERT INTO `sys_area` VALUES ('310112', '310100', '闵行区', '上海市', '市辖区', '闵行区', '上海市市辖区闵行区', 0);
INSERT INTO `sys_area` VALUES ('310113', '310100', '宝山区', '上海市', '市辖区', '宝山区', '上海市市辖区宝山区', 0);
INSERT INTO `sys_area` VALUES ('310114', '310100', '嘉定区', '上海市', '市辖区', '嘉定区', '上海市市辖区嘉定区', 0);
INSERT INTO `sys_area` VALUES ('310115', '310100', '浦东新区', '上海市', '市辖区', '浦东新区', '上海市市辖区浦东新区', 0);
INSERT INTO `sys_area` VALUES ('310116', '310100', '金山区', '上海市', '市辖区', '金山区', '上海市市辖区金山区', 0);
INSERT INTO `sys_area` VALUES ('310117', '310100', '松江区', '上海市', '市辖区', '松江区', '上海市市辖区松江区', 0);
INSERT INTO `sys_area` VALUES ('310118', '310100', '青浦区', '上海市', '市辖区', '青浦区', '上海市市辖区青浦区', 0);
INSERT INTO `sys_area` VALUES ('310120', '310100', '奉贤区', '上海市', '市辖区', '奉贤区', '上海市市辖区奉贤区', 0);
INSERT INTO `sys_area` VALUES ('310151', '310100', '崇明区', '上海市', '市辖区', '崇明区', '上海市市辖区崇明区', 0);
INSERT INTO `sys_area` VALUES ('320000', '86', '江苏省', '江苏省', '', '', '江苏省', 0);
INSERT INTO `sys_area` VALUES ('320100', '320000', '南京市', '江苏省', '南京市', '', '江苏省南京市', 0);
INSERT INTO `sys_area` VALUES ('320101', '320100', '市辖区', '江苏省', '南京市', '市辖区', '江苏省南京市市辖区', 0);
INSERT INTO `sys_area` VALUES ('320102', '320100', '玄武区', '江苏省', '南京市', '玄武区', '江苏省南京市玄武区', 0);
INSERT INTO `sys_area` VALUES ('320104', '320100', '秦淮区', '江苏省', '南京市', '秦淮区', '江苏省南京市秦淮区', 0);
INSERT INTO `sys_area` VALUES ('320105', '320100', '建邺区', '江苏省', '南京市', '建邺区', '江苏省南京市建邺区', 0);
INSERT INTO `sys_area` VALUES ('320106', '320100', '鼓楼区', '江苏省', '南京市', '鼓楼区', '江苏省南京市鼓楼区', 0);
INSERT INTO `sys_area` VALUES ('320111', '320100', '浦口区', '江苏省', '南京市', '浦口区', '江苏省南京市浦口区', 0);
INSERT INTO `sys_area` VALUES ('320113', '320100', '栖霞区', '江苏省', '南京市', '栖霞区', '江苏省南京市栖霞区', 0);
INSERT INTO `sys_area` VALUES ('320114', '320100', '雨花台区', '江苏省', '南京市', '雨花台区', '江苏省南京市雨花台区', 0);
INSERT INTO `sys_area` VALUES ('320115', '320100', '江宁区', '江苏省', '南京市', '江宁区', '江苏省南京市江宁区', 0);
INSERT INTO `sys_area` VALUES ('320116', '320100', '六合区', '江苏省', '南京市', '六合区', '江苏省南京市六合区', 0);
INSERT INTO `sys_area` VALUES ('320117', '320100', '溧水区', '江苏省', '南京市', '溧水区', '江苏省南京市溧水区', 0);
INSERT INTO `sys_area` VALUES ('320118', '320100', '高淳区', '江苏省', '南京市', '高淳区', '江苏省南京市高淳区', 0);
INSERT INTO `sys_area` VALUES ('320200', '320000', '无锡市', '江苏省', '无锡市', '', '江苏省无锡市', 0);
INSERT INTO `sys_area` VALUES ('320201', '320200', '市辖区', '江苏省', '无锡市', '市辖区', '江苏省无锡市市辖区', 0);
INSERT INTO `sys_area` VALUES ('320205', '320200', '锡山区', '江苏省', '无锡市', '锡山区', '江苏省无锡市锡山区', 0);
INSERT INTO `sys_area` VALUES ('320206', '320200', '惠山区', '江苏省', '无锡市', '惠山区', '江苏省无锡市惠山区', 0);
INSERT INTO `sys_area` VALUES ('320211', '320200', '滨湖区', '江苏省', '无锡市', '滨湖区', '江苏省无锡市滨湖区', 0);
INSERT INTO `sys_area` VALUES ('320213', '320200', '梁溪区', '江苏省', '无锡市', '梁溪区', '江苏省无锡市梁溪区', 0);
INSERT INTO `sys_area` VALUES ('320214', '320200', '新吴区', '江苏省', '无锡市', '新吴区', '江苏省无锡市新吴区', 0);
INSERT INTO `sys_area` VALUES ('320281', '320200', '江阴市', '江苏省', '无锡市', '江阴市', '江苏省无锡市江阴市', 0);
INSERT INTO `sys_area` VALUES ('320282', '320200', '宜兴市', '江苏省', '无锡市', '宜兴市', '江苏省无锡市宜兴市', 0);
INSERT INTO `sys_area` VALUES ('320300', '320000', '徐州市', '江苏省', '徐州市', '', '江苏省徐州市', 0);
INSERT INTO `sys_area` VALUES ('320301', '320300', '市辖区', '江苏省', '徐州市', '市辖区', '江苏省徐州市市辖区', 0);
INSERT INTO `sys_area` VALUES ('320302', '320300', '鼓楼区', '江苏省', '徐州市', '鼓楼区', '江苏省徐州市鼓楼区', 0);
INSERT INTO `sys_area` VALUES ('320303', '320300', '云龙区', '江苏省', '徐州市', '云龙区', '江苏省徐州市云龙区', 0);
INSERT INTO `sys_area` VALUES ('320305', '320300', '贾汪区', '江苏省', '徐州市', '贾汪区', '江苏省徐州市贾汪区', 0);
INSERT INTO `sys_area` VALUES ('320311', '320300', '泉山区', '江苏省', '徐州市', '泉山区', '江苏省徐州市泉山区', 0);
INSERT INTO `sys_area` VALUES ('320312', '320300', '铜山区', '江苏省', '徐州市', '铜山区', '江苏省徐州市铜山区', 0);
INSERT INTO `sys_area` VALUES ('320321', '320300', '丰县', '江苏省', '徐州市', '丰县', '江苏省徐州市丰县', 0);
INSERT INTO `sys_area` VALUES ('320322', '320300', '沛县', '江苏省', '徐州市', '沛县', '江苏省徐州市沛县', 0);
INSERT INTO `sys_area` VALUES ('320324', '320300', '睢宁县', '江苏省', '徐州市', '睢宁县', '江苏省徐州市睢宁县', 0);
INSERT INTO `sys_area` VALUES ('320381', '320300', '新沂市', '江苏省', '徐州市', '新沂市', '江苏省徐州市新沂市', 0);
INSERT INTO `sys_area` VALUES ('320382', '320300', '邳州市', '江苏省', '徐州市', '邳州市', '江苏省徐州市邳州市', 0);
INSERT INTO `sys_area` VALUES ('320400', '320000', '常州市', '江苏省', '常州市', '', '江苏省常州市', 0);
INSERT INTO `sys_area` VALUES ('320401', '320400', '市辖区', '江苏省', '常州市', '市辖区', '江苏省常州市市辖区', 0);
INSERT INTO `sys_area` VALUES ('320402', '320400', '天宁区', '江苏省', '常州市', '天宁区', '江苏省常州市天宁区', 0);
INSERT INTO `sys_area` VALUES ('320404', '320400', '钟楼区', '江苏省', '常州市', '钟楼区', '江苏省常州市钟楼区', 0);
INSERT INTO `sys_area` VALUES ('320411', '320400', '新北区', '江苏省', '常州市', '新北区', '江苏省常州市新北区', 0);
INSERT INTO `sys_area` VALUES ('320412', '320400', '武进区', '江苏省', '常州市', '武进区', '江苏省常州市武进区', 0);
INSERT INTO `sys_area` VALUES ('320413', '320400', '金坛区', '江苏省', '常州市', '金坛区', '江苏省常州市金坛区', 0);
INSERT INTO `sys_area` VALUES ('320481', '320400', '溧阳市', '江苏省', '常州市', '溧阳市', '江苏省常州市溧阳市', 0);
INSERT INTO `sys_area` VALUES ('320500', '320000', '苏州市', '江苏省', '苏州市', '', '江苏省苏州市', 0);
INSERT INTO `sys_area` VALUES ('320501', '320500', '市辖区', '江苏省', '苏州市', '市辖区', '江苏省苏州市市辖区', 0);
INSERT INTO `sys_area` VALUES ('320505', '320500', '虎丘区', '江苏省', '苏州市', '虎丘区', '江苏省苏州市虎丘区', 0);
INSERT INTO `sys_area` VALUES ('320506', '320500', '吴中区', '江苏省', '苏州市', '吴中区', '江苏省苏州市吴中区', 0);
INSERT INTO `sys_area` VALUES ('320507', '320500', '相城区', '江苏省', '苏州市', '相城区', '江苏省苏州市相城区', 0);
INSERT INTO `sys_area` VALUES ('320508', '320500', '姑苏区', '江苏省', '苏州市', '姑苏区', '江苏省苏州市姑苏区', 0);
INSERT INTO `sys_area` VALUES ('320509', '320500', '吴江区', '江苏省', '苏州市', '吴江区', '江苏省苏州市吴江区', 0);
INSERT INTO `sys_area` VALUES ('320581', '320500', '常熟市', '江苏省', '苏州市', '常熟市', '江苏省苏州市常熟市', 0);
INSERT INTO `sys_area` VALUES ('320582', '320500', '张家港市', '江苏省', '苏州市', '张家港市', '江苏省苏州市张家港市', 0);
INSERT INTO `sys_area` VALUES ('320583', '320500', '昆山市', '江苏省', '苏州市', '昆山市', '江苏省苏州市昆山市', 0);
INSERT INTO `sys_area` VALUES ('320585', '320500', '太仓市', '江苏省', '苏州市', '太仓市', '江苏省苏州市太仓市', 0);
INSERT INTO `sys_area` VALUES ('320600', '320000', '南通市', '江苏省', '南通市', '', '江苏省南通市', 0);
INSERT INTO `sys_area` VALUES ('320601', '320600', '市辖区', '江苏省', '南通市', '市辖区', '江苏省南通市市辖区', 0);
INSERT INTO `sys_area` VALUES ('320602', '320600', '崇川区', '江苏省', '南通市', '崇川区', '江苏省南通市崇川区', 0);
INSERT INTO `sys_area` VALUES ('320611', '320600', '港闸区', '江苏省', '南通市', '港闸区', '江苏省南通市港闸区', 0);
INSERT INTO `sys_area` VALUES ('320612', '320600', '通州区', '江苏省', '南通市', '通州区', '江苏省南通市通州区', 0);
INSERT INTO `sys_area` VALUES ('320621', '320600', '海安县', '江苏省', '南通市', '海安县', '江苏省南通市海安县', 0);
INSERT INTO `sys_area` VALUES ('320623', '320600', '如东县', '江苏省', '南通市', '如东县', '江苏省南通市如东县', 0);
INSERT INTO `sys_area` VALUES ('320681', '320600', '启东市', '江苏省', '南通市', '启东市', '江苏省南通市启东市', 0);
INSERT INTO `sys_area` VALUES ('320682', '320600', '如皋市', '江苏省', '南通市', '如皋市', '江苏省南通市如皋市', 0);
INSERT INTO `sys_area` VALUES ('320684', '320600', '海门市', '江苏省', '南通市', '海门市', '江苏省南通市海门市', 0);
INSERT INTO `sys_area` VALUES ('320700', '320000', '连云港市', '江苏省', '连云港市', '', '江苏省连云港市', 0);
INSERT INTO `sys_area` VALUES ('320701', '320700', '市辖区', '江苏省', '连云港市', '市辖区', '江苏省连云港市市辖区', 0);
INSERT INTO `sys_area` VALUES ('320703', '320700', '连云区', '江苏省', '连云港市', '连云区', '江苏省连云港市连云区', 0);
INSERT INTO `sys_area` VALUES ('320706', '320700', '海州区', '江苏省', '连云港市', '海州区', '江苏省连云港市海州区', 0);
INSERT INTO `sys_area` VALUES ('320707', '320700', '赣榆区', '江苏省', '连云港市', '赣榆区', '江苏省连云港市赣榆区', 0);
INSERT INTO `sys_area` VALUES ('320722', '320700', '东海县', '江苏省', '连云港市', '东海县', '江苏省连云港市东海县', 0);
INSERT INTO `sys_area` VALUES ('320723', '320700', '灌云县', '江苏省', '连云港市', '灌云县', '江苏省连云港市灌云县', 0);
INSERT INTO `sys_area` VALUES ('320724', '320700', '灌南县', '江苏省', '连云港市', '灌南县', '江苏省连云港市灌南县', 0);
INSERT INTO `sys_area` VALUES ('320800', '320000', '淮安市', '江苏省', '淮安市', '', '江苏省淮安市', 0);
INSERT INTO `sys_area` VALUES ('320801', '320800', '市辖区', '江苏省', '淮安市', '市辖区', '江苏省淮安市市辖区', 0);
INSERT INTO `sys_area` VALUES ('320803', '320800', '淮安区', '江苏省', '淮安市', '淮安区', '江苏省淮安市淮安区', 0);
INSERT INTO `sys_area` VALUES ('320804', '320800', '淮阴区', '江苏省', '淮安市', '淮阴区', '江苏省淮安市淮阴区', 0);
INSERT INTO `sys_area` VALUES ('320812', '320800', '清江浦区', '江苏省', '淮安市', '清江浦区', '江苏省淮安市清江浦区', 0);
INSERT INTO `sys_area` VALUES ('320813', '320800', '洪泽区', '江苏省', '淮安市', '洪泽区', '江苏省淮安市洪泽区', 0);
INSERT INTO `sys_area` VALUES ('320826', '320800', '涟水县', '江苏省', '淮安市', '涟水县', '江苏省淮安市涟水县', 0);
INSERT INTO `sys_area` VALUES ('320830', '320800', '盱眙县', '江苏省', '淮安市', '盱眙县', '江苏省淮安市盱眙县', 0);
INSERT INTO `sys_area` VALUES ('320831', '320800', '金湖县', '江苏省', '淮安市', '金湖县', '江苏省淮安市金湖县', 0);
INSERT INTO `sys_area` VALUES ('320900', '320000', '盐城市', '江苏省', '盐城市', '', '江苏省盐城市', 0);
INSERT INTO `sys_area` VALUES ('320901', '320900', '市辖区', '江苏省', '盐城市', '市辖区', '江苏省盐城市市辖区', 0);
INSERT INTO `sys_area` VALUES ('320902', '320900', '亭湖区', '江苏省', '盐城市', '亭湖区', '江苏省盐城市亭湖区', 0);
INSERT INTO `sys_area` VALUES ('320903', '320900', '盐都区', '江苏省', '盐城市', '盐都区', '江苏省盐城市盐都区', 0);
INSERT INTO `sys_area` VALUES ('320904', '320900', '大丰区', '江苏省', '盐城市', '大丰区', '江苏省盐城市大丰区', 0);
INSERT INTO `sys_area` VALUES ('320921', '320900', '响水县', '江苏省', '盐城市', '响水县', '江苏省盐城市响水县', 0);
INSERT INTO `sys_area` VALUES ('320922', '320900', '滨海县', '江苏省', '盐城市', '滨海县', '江苏省盐城市滨海县', 0);
INSERT INTO `sys_area` VALUES ('320923', '320900', '阜宁县', '江苏省', '盐城市', '阜宁县', '江苏省盐城市阜宁县', 0);
INSERT INTO `sys_area` VALUES ('320924', '320900', '射阳县', '江苏省', '盐城市', '射阳县', '江苏省盐城市射阳县', 0);
INSERT INTO `sys_area` VALUES ('320925', '320900', '建湖县', '江苏省', '盐城市', '建湖县', '江苏省盐城市建湖县', 0);
INSERT INTO `sys_area` VALUES ('320981', '320900', '东台市', '江苏省', '盐城市', '东台市', '江苏省盐城市东台市', 0);
INSERT INTO `sys_area` VALUES ('321000', '320000', '扬州市', '江苏省', '扬州市', '', '江苏省扬州市', 0);
INSERT INTO `sys_area` VALUES ('321001', '321000', '市辖区', '江苏省', '扬州市', '市辖区', '江苏省扬州市市辖区', 0);
INSERT INTO `sys_area` VALUES ('321002', '321000', '广陵区', '江苏省', '扬州市', '广陵区', '江苏省扬州市广陵区', 0);
INSERT INTO `sys_area` VALUES ('321003', '321000', '邗江区', '江苏省', '扬州市', '邗江区', '江苏省扬州市邗江区', 0);
INSERT INTO `sys_area` VALUES ('321012', '321000', '江都区', '江苏省', '扬州市', '江都区', '江苏省扬州市江都区', 0);
INSERT INTO `sys_area` VALUES ('321023', '321000', '宝应县', '江苏省', '扬州市', '宝应县', '江苏省扬州市宝应县', 0);
INSERT INTO `sys_area` VALUES ('321081', '321000', '仪征市', '江苏省', '扬州市', '仪征市', '江苏省扬州市仪征市', 0);
INSERT INTO `sys_area` VALUES ('321084', '321000', '高邮市', '江苏省', '扬州市', '高邮市', '江苏省扬州市高邮市', 0);
INSERT INTO `sys_area` VALUES ('321100', '320000', '镇江市', '江苏省', '镇江市', '', '江苏省镇江市', 0);
INSERT INTO `sys_area` VALUES ('321101', '321100', '市辖区', '江苏省', '镇江市', '市辖区', '江苏省镇江市市辖区', 0);
INSERT INTO `sys_area` VALUES ('321102', '321100', '京口区', '江苏省', '镇江市', '京口区', '江苏省镇江市京口区', 0);
INSERT INTO `sys_area` VALUES ('321111', '321100', '润州区', '江苏省', '镇江市', '润州区', '江苏省镇江市润州区', 0);
INSERT INTO `sys_area` VALUES ('321112', '321100', '丹徒区', '江苏省', '镇江市', '丹徒区', '江苏省镇江市丹徒区', 0);
INSERT INTO `sys_area` VALUES ('321181', '321100', '丹阳市', '江苏省', '镇江市', '丹阳市', '江苏省镇江市丹阳市', 0);
INSERT INTO `sys_area` VALUES ('321182', '321100', '扬中市', '江苏省', '镇江市', '扬中市', '江苏省镇江市扬中市', 0);
INSERT INTO `sys_area` VALUES ('321183', '321100', '句容市', '江苏省', '镇江市', '句容市', '江苏省镇江市句容市', 0);
INSERT INTO `sys_area` VALUES ('321200', '320000', '泰州市', '江苏省', '泰州市', '', '江苏省泰州市', 0);
INSERT INTO `sys_area` VALUES ('321201', '321200', '市辖区', '江苏省', '泰州市', '市辖区', '江苏省泰州市市辖区', 0);
INSERT INTO `sys_area` VALUES ('321202', '321200', '海陵区', '江苏省', '泰州市', '海陵区', '江苏省泰州市海陵区', 0);
INSERT INTO `sys_area` VALUES ('321203', '321200', '高港区', '江苏省', '泰州市', '高港区', '江苏省泰州市高港区', 0);
INSERT INTO `sys_area` VALUES ('321204', '321200', '姜堰区', '江苏省', '泰州市', '姜堰区', '江苏省泰州市姜堰区', 0);
INSERT INTO `sys_area` VALUES ('321281', '321200', '兴化市', '江苏省', '泰州市', '兴化市', '江苏省泰州市兴化市', 0);
INSERT INTO `sys_area` VALUES ('321282', '321200', '靖江市', '江苏省', '泰州市', '靖江市', '江苏省泰州市靖江市', 0);
INSERT INTO `sys_area` VALUES ('321283', '321200', '泰兴市', '江苏省', '泰州市', '泰兴市', '江苏省泰州市泰兴市', 0);
INSERT INTO `sys_area` VALUES ('321300', '320000', '宿迁市', '江苏省', '宿迁市', '', '江苏省宿迁市', 0);
INSERT INTO `sys_area` VALUES ('321301', '321300', '市辖区', '江苏省', '宿迁市', '市辖区', '江苏省宿迁市市辖区', 0);
INSERT INTO `sys_area` VALUES ('321302', '321300', '宿城区', '江苏省', '宿迁市', '宿城区', '江苏省宿迁市宿城区', 0);
INSERT INTO `sys_area` VALUES ('321311', '321300', '宿豫区', '江苏省', '宿迁市', '宿豫区', '江苏省宿迁市宿豫区', 0);
INSERT INTO `sys_area` VALUES ('321322', '321300', '沭阳县', '江苏省', '宿迁市', '沭阳县', '江苏省宿迁市沭阳县', 0);
INSERT INTO `sys_area` VALUES ('321323', '321300', '泗阳县', '江苏省', '宿迁市', '泗阳县', '江苏省宿迁市泗阳县', 0);
INSERT INTO `sys_area` VALUES ('321324', '321300', '泗洪县', '江苏省', '宿迁市', '泗洪县', '江苏省宿迁市泗洪县', 0);
INSERT INTO `sys_area` VALUES ('330000', '86', '浙江省', '浙江省', '', '', '浙江省', 0);
INSERT INTO `sys_area` VALUES ('330100', '330000', '杭州市', '浙江省', '杭州市', '', '浙江省杭州市', 0);
INSERT INTO `sys_area` VALUES ('330101', '330100', '市辖区', '浙江省', '杭州市', '市辖区', '浙江省杭州市市辖区', 0);
INSERT INTO `sys_area` VALUES ('330102', '330100', '上城区', '浙江省', '杭州市', '上城区', '浙江省杭州市上城区', 0);
INSERT INTO `sys_area` VALUES ('330103', '330100', '下城区', '浙江省', '杭州市', '下城区', '浙江省杭州市下城区', 0);
INSERT INTO `sys_area` VALUES ('330104', '330100', '江干区', '浙江省', '杭州市', '江干区', '浙江省杭州市江干区', 0);
INSERT INTO `sys_area` VALUES ('330105', '330100', '拱墅区', '浙江省', '杭州市', '拱墅区', '浙江省杭州市拱墅区', 0);
INSERT INTO `sys_area` VALUES ('330106', '330100', '西湖区', '浙江省', '杭州市', '西湖区', '浙江省杭州市西湖区', 0);
INSERT INTO `sys_area` VALUES ('330108', '330100', '滨江区', '浙江省', '杭州市', '滨江区', '浙江省杭州市滨江区', 0);
INSERT INTO `sys_area` VALUES ('330109', '330100', '萧山区', '浙江省', '杭州市', '萧山区', '浙江省杭州市萧山区', 0);
INSERT INTO `sys_area` VALUES ('330110', '330100', '余杭区', '浙江省', '杭州市', '余杭区', '浙江省杭州市余杭区', 0);
INSERT INTO `sys_area` VALUES ('330111', '330100', '富阳区', '浙江省', '杭州市', '富阳区', '浙江省杭州市富阳区', 0);
INSERT INTO `sys_area` VALUES ('330122', '330100', '桐庐县', '浙江省', '杭州市', '桐庐县', '浙江省杭州市桐庐县', 0);
INSERT INTO `sys_area` VALUES ('330127', '330100', '淳安县', '浙江省', '杭州市', '淳安县', '浙江省杭州市淳安县', 0);
INSERT INTO `sys_area` VALUES ('330182', '330100', '建德市', '浙江省', '杭州市', '建德市', '浙江省杭州市建德市', 0);
INSERT INTO `sys_area` VALUES ('330185', '330100', '临安市', '浙江省', '杭州市', '临安市', '浙江省杭州市临安市', 0);
INSERT INTO `sys_area` VALUES ('330200', '330000', '宁波市', '浙江省', '宁波市', '', '浙江省宁波市', 0);
INSERT INTO `sys_area` VALUES ('330201', '330200', '市辖区', '浙江省', '宁波市', '市辖区', '浙江省宁波市市辖区', 0);
INSERT INTO `sys_area` VALUES ('330203', '330200', '海曙区', '浙江省', '宁波市', '海曙区', '浙江省宁波市海曙区', 0);
INSERT INTO `sys_area` VALUES ('330204', '330200', '江东区', '浙江省', '宁波市', '江东区', '浙江省宁波市江东区', 0);
INSERT INTO `sys_area` VALUES ('330205', '330200', '江北区', '浙江省', '宁波市', '江北区', '浙江省宁波市江北区', 0);
INSERT INTO `sys_area` VALUES ('330206', '330200', '北仑区', '浙江省', '宁波市', '北仑区', '浙江省宁波市北仑区', 0);
INSERT INTO `sys_area` VALUES ('330211', '330200', '镇海区', '浙江省', '宁波市', '镇海区', '浙江省宁波市镇海区', 0);
INSERT INTO `sys_area` VALUES ('330212', '330200', '鄞州区', '浙江省', '宁波市', '鄞州区', '浙江省宁波市鄞州区', 0);
INSERT INTO `sys_area` VALUES ('330225', '330200', '象山县', '浙江省', '宁波市', '象山县', '浙江省宁波市象山县', 0);
INSERT INTO `sys_area` VALUES ('330226', '330200', '宁海县', '浙江省', '宁波市', '宁海县', '浙江省宁波市宁海县', 0);
INSERT INTO `sys_area` VALUES ('330281', '330200', '余姚市', '浙江省', '宁波市', '余姚市', '浙江省宁波市余姚市', 0);
INSERT INTO `sys_area` VALUES ('330282', '330200', '慈溪市', '浙江省', '宁波市', '慈溪市', '浙江省宁波市慈溪市', 0);
INSERT INTO `sys_area` VALUES ('330283', '330200', '奉化市', '浙江省', '宁波市', '奉化市', '浙江省宁波市奉化市', 0);
INSERT INTO `sys_area` VALUES ('330300', '330000', '温州市', '浙江省', '温州市', '', '浙江省温州市', 0);
INSERT INTO `sys_area` VALUES ('330301', '330300', '市辖区', '浙江省', '温州市', '市辖区', '浙江省温州市市辖区', 0);
INSERT INTO `sys_area` VALUES ('330302', '330300', '鹿城区', '浙江省', '温州市', '鹿城区', '浙江省温州市鹿城区', 0);
INSERT INTO `sys_area` VALUES ('330303', '330300', '龙湾区', '浙江省', '温州市', '龙湾区', '浙江省温州市龙湾区', 0);
INSERT INTO `sys_area` VALUES ('330304', '330300', '瓯海区', '浙江省', '温州市', '瓯海区', '浙江省温州市瓯海区', 0);
INSERT INTO `sys_area` VALUES ('330305', '330300', '洞头区', '浙江省', '温州市', '洞头区', '浙江省温州市洞头区', 0);
INSERT INTO `sys_area` VALUES ('330324', '330300', '永嘉县', '浙江省', '温州市', '永嘉县', '浙江省温州市永嘉县', 0);
INSERT INTO `sys_area` VALUES ('330326', '330300', '平阳县', '浙江省', '温州市', '平阳县', '浙江省温州市平阳县', 0);
INSERT INTO `sys_area` VALUES ('330327', '330300', '苍南县', '浙江省', '温州市', '苍南县', '浙江省温州市苍南县', 0);
INSERT INTO `sys_area` VALUES ('330328', '330300', '文成县', '浙江省', '温州市', '文成县', '浙江省温州市文成县', 0);
INSERT INTO `sys_area` VALUES ('330329', '330300', '泰顺县', '浙江省', '温州市', '泰顺县', '浙江省温州市泰顺县', 0);
INSERT INTO `sys_area` VALUES ('330381', '330300', '瑞安市', '浙江省', '温州市', '瑞安市', '浙江省温州市瑞安市', 0);
INSERT INTO `sys_area` VALUES ('330382', '330300', '乐清市', '浙江省', '温州市', '乐清市', '浙江省温州市乐清市', 0);
INSERT INTO `sys_area` VALUES ('330400', '330000', '嘉兴市', '浙江省', '嘉兴市', '', '浙江省嘉兴市', 0);
INSERT INTO `sys_area` VALUES ('330401', '330400', '市辖区', '浙江省', '嘉兴市', '市辖区', '浙江省嘉兴市市辖区', 0);
INSERT INTO `sys_area` VALUES ('330402', '330400', '南湖区', '浙江省', '嘉兴市', '南湖区', '浙江省嘉兴市南湖区', 0);
INSERT INTO `sys_area` VALUES ('330411', '330400', '秀洲区', '浙江省', '嘉兴市', '秀洲区', '浙江省嘉兴市秀洲区', 0);
INSERT INTO `sys_area` VALUES ('330421', '330400', '嘉善县', '浙江省', '嘉兴市', '嘉善县', '浙江省嘉兴市嘉善县', 0);
INSERT INTO `sys_area` VALUES ('330424', '330400', '海盐县', '浙江省', '嘉兴市', '海盐县', '浙江省嘉兴市海盐县', 0);
INSERT INTO `sys_area` VALUES ('330481', '330400', '海宁市', '浙江省', '嘉兴市', '海宁市', '浙江省嘉兴市海宁市', 0);
INSERT INTO `sys_area` VALUES ('330482', '330400', '平湖市', '浙江省', '嘉兴市', '平湖市', '浙江省嘉兴市平湖市', 0);
INSERT INTO `sys_area` VALUES ('330483', '330400', '桐乡市', '浙江省', '嘉兴市', '桐乡市', '浙江省嘉兴市桐乡市', 0);
INSERT INTO `sys_area` VALUES ('330500', '330000', '湖州市', '浙江省', '湖州市', '', '浙江省湖州市', 0);
INSERT INTO `sys_area` VALUES ('330501', '330500', '市辖区', '浙江省', '湖州市', '市辖区', '浙江省湖州市市辖区', 0);
INSERT INTO `sys_area` VALUES ('330502', '330500', '吴兴区', '浙江省', '湖州市', '吴兴区', '浙江省湖州市吴兴区', 0);
INSERT INTO `sys_area` VALUES ('330503', '330500', '南浔区', '浙江省', '湖州市', '南浔区', '浙江省湖州市南浔区', 0);
INSERT INTO `sys_area` VALUES ('330521', '330500', '德清县', '浙江省', '湖州市', '德清县', '浙江省湖州市德清县', 0);
INSERT INTO `sys_area` VALUES ('330522', '330500', '长兴县', '浙江省', '湖州市', '长兴县', '浙江省湖州市长兴县', 0);
INSERT INTO `sys_area` VALUES ('330523', '330500', '安吉县', '浙江省', '湖州市', '安吉县', '浙江省湖州市安吉县', 0);
INSERT INTO `sys_area` VALUES ('330600', '330000', '绍兴市', '浙江省', '绍兴市', '', '浙江省绍兴市', 0);
INSERT INTO `sys_area` VALUES ('330601', '330600', '市辖区', '浙江省', '绍兴市', '市辖区', '浙江省绍兴市市辖区', 0);
INSERT INTO `sys_area` VALUES ('330602', '330600', '越城区', '浙江省', '绍兴市', '越城区', '浙江省绍兴市越城区', 0);
INSERT INTO `sys_area` VALUES ('330603', '330600', '柯桥区', '浙江省', '绍兴市', '柯桥区', '浙江省绍兴市柯桥区', 0);
INSERT INTO `sys_area` VALUES ('330604', '330600', '上虞区', '浙江省', '绍兴市', '上虞区', '浙江省绍兴市上虞区', 0);
INSERT INTO `sys_area` VALUES ('330624', '330600', '新昌县', '浙江省', '绍兴市', '新昌县', '浙江省绍兴市新昌县', 0);
INSERT INTO `sys_area` VALUES ('330681', '330600', '诸暨市', '浙江省', '绍兴市', '诸暨市', '浙江省绍兴市诸暨市', 0);
INSERT INTO `sys_area` VALUES ('330683', '330600', '嵊州市', '浙江省', '绍兴市', '嵊州市', '浙江省绍兴市嵊州市', 0);
INSERT INTO `sys_area` VALUES ('330700', '330000', '金华市', '浙江省', '金华市', '', '浙江省金华市', 0);
INSERT INTO `sys_area` VALUES ('330701', '330700', '市辖区', '浙江省', '金华市', '市辖区', '浙江省金华市市辖区', 0);
INSERT INTO `sys_area` VALUES ('330702', '330700', '婺城区', '浙江省', '金华市', '婺城区', '浙江省金华市婺城区', 0);
INSERT INTO `sys_area` VALUES ('330703', '330700', '金东区', '浙江省', '金华市', '金东区', '浙江省金华市金东区', 0);
INSERT INTO `sys_area` VALUES ('330723', '330700', '武义县', '浙江省', '金华市', '武义县', '浙江省金华市武义县', 0);
INSERT INTO `sys_area` VALUES ('330726', '330700', '浦江县', '浙江省', '金华市', '浦江县', '浙江省金华市浦江县', 0);
INSERT INTO `sys_area` VALUES ('330727', '330700', '磐安县', '浙江省', '金华市', '磐安县', '浙江省金华市磐安县', 0);
INSERT INTO `sys_area` VALUES ('330781', '330700', '兰溪市', '浙江省', '金华市', '兰溪市', '浙江省金华市兰溪市', 0);
INSERT INTO `sys_area` VALUES ('330782', '330700', '义乌市', '浙江省', '金华市', '义乌市', '浙江省金华市义乌市', 0);
INSERT INTO `sys_area` VALUES ('330783', '330700', '东阳市', '浙江省', '金华市', '东阳市', '浙江省金华市东阳市', 0);
INSERT INTO `sys_area` VALUES ('330784', '330700', '永康市', '浙江省', '金华市', '永康市', '浙江省金华市永康市', 0);
INSERT INTO `sys_area` VALUES ('330800', '330000', '衢州市', '浙江省', '衢州市', '', '浙江省衢州市', 0);
INSERT INTO `sys_area` VALUES ('330801', '330800', '市辖区', '浙江省', '衢州市', '市辖区', '浙江省衢州市市辖区', 0);
INSERT INTO `sys_area` VALUES ('330802', '330800', '柯城区', '浙江省', '衢州市', '柯城区', '浙江省衢州市柯城区', 0);
INSERT INTO `sys_area` VALUES ('330803', '330800', '衢江区', '浙江省', '衢州市', '衢江区', '浙江省衢州市衢江区', 0);
INSERT INTO `sys_area` VALUES ('330822', '330800', '常山县', '浙江省', '衢州市', '常山县', '浙江省衢州市常山县', 0);
INSERT INTO `sys_area` VALUES ('330824', '330800', '开化县', '浙江省', '衢州市', '开化县', '浙江省衢州市开化县', 0);
INSERT INTO `sys_area` VALUES ('330825', '330800', '龙游县', '浙江省', '衢州市', '龙游县', '浙江省衢州市龙游县', 0);
INSERT INTO `sys_area` VALUES ('330881', '330800', '江山市', '浙江省', '衢州市', '江山市', '浙江省衢州市江山市', 0);
INSERT INTO `sys_area` VALUES ('330900', '330000', '舟山市', '浙江省', '舟山市', '', '浙江省舟山市', 0);
INSERT INTO `sys_area` VALUES ('330901', '330900', '市辖区', '浙江省', '舟山市', '市辖区', '浙江省舟山市市辖区', 0);
INSERT INTO `sys_area` VALUES ('330902', '330900', '定海区', '浙江省', '舟山市', '定海区', '浙江省舟山市定海区', 0);
INSERT INTO `sys_area` VALUES ('330903', '330900', '普陀区', '浙江省', '舟山市', '普陀区', '浙江省舟山市普陀区', 0);
INSERT INTO `sys_area` VALUES ('330921', '330900', '岱山县', '浙江省', '舟山市', '岱山县', '浙江省舟山市岱山县', 0);
INSERT INTO `sys_area` VALUES ('330922', '330900', '嵊泗县', '浙江省', '舟山市', '嵊泗县', '浙江省舟山市嵊泗县', 0);
INSERT INTO `sys_area` VALUES ('331000', '330000', '台州市', '浙江省', '台州市', '', '浙江省台州市', 0);
INSERT INTO `sys_area` VALUES ('331001', '331000', '市辖区', '浙江省', '台州市', '市辖区', '浙江省台州市市辖区', 0);
INSERT INTO `sys_area` VALUES ('331002', '331000', '椒江区', '浙江省', '台州市', '椒江区', '浙江省台州市椒江区', 0);
INSERT INTO `sys_area` VALUES ('331003', '331000', '黄岩区', '浙江省', '台州市', '黄岩区', '浙江省台州市黄岩区', 0);
INSERT INTO `sys_area` VALUES ('331004', '331000', '路桥区', '浙江省', '台州市', '路桥区', '浙江省台州市路桥区', 0);
INSERT INTO `sys_area` VALUES ('331021', '331000', '玉环县', '浙江省', '台州市', '玉环县', '浙江省台州市玉环县', 0);
INSERT INTO `sys_area` VALUES ('331022', '331000', '三门县', '浙江省', '台州市', '三门县', '浙江省台州市三门县', 0);
INSERT INTO `sys_area` VALUES ('331023', '331000', '天台县', '浙江省', '台州市', '天台县', '浙江省台州市天台县', 0);
INSERT INTO `sys_area` VALUES ('331024', '331000', '仙居县', '浙江省', '台州市', '仙居县', '浙江省台州市仙居县', 0);
INSERT INTO `sys_area` VALUES ('331081', '331000', '温岭市', '浙江省', '台州市', '温岭市', '浙江省台州市温岭市', 0);
INSERT INTO `sys_area` VALUES ('331082', '331000', '临海市', '浙江省', '台州市', '临海市', '浙江省台州市临海市', 0);
INSERT INTO `sys_area` VALUES ('331100', '330000', '丽水市', '浙江省', '丽水市', '', '浙江省丽水市', 0);
INSERT INTO `sys_area` VALUES ('331101', '331100', '市辖区', '浙江省', '丽水市', '市辖区', '浙江省丽水市市辖区', 0);
INSERT INTO `sys_area` VALUES ('331102', '331100', '莲都区', '浙江省', '丽水市', '莲都区', '浙江省丽水市莲都区', 0);
INSERT INTO `sys_area` VALUES ('331121', '331100', '青田县', '浙江省', '丽水市', '青田县', '浙江省丽水市青田县', 0);
INSERT INTO `sys_area` VALUES ('331122', '331100', '缙云县', '浙江省', '丽水市', '缙云县', '浙江省丽水市缙云县', 0);
INSERT INTO `sys_area` VALUES ('331123', '331100', '遂昌县', '浙江省', '丽水市', '遂昌县', '浙江省丽水市遂昌县', 0);
INSERT INTO `sys_area` VALUES ('331124', '331100', '松阳县', '浙江省', '丽水市', '松阳县', '浙江省丽水市松阳县', 0);
INSERT INTO `sys_area` VALUES ('331125', '331100', '云和县', '浙江省', '丽水市', '云和县', '浙江省丽水市云和县', 0);
INSERT INTO `sys_area` VALUES ('331126', '331100', '庆元县', '浙江省', '丽水市', '庆元县', '浙江省丽水市庆元县', 0);
INSERT INTO `sys_area` VALUES ('331127', '331100', '景宁畲族自治县', '浙江省', '丽水市', '景宁畲族自治县', '浙江省丽水市景宁畲族自治县', 0);
INSERT INTO `sys_area` VALUES ('331181', '331100', '龙泉市', '浙江省', '丽水市', '龙泉市', '浙江省丽水市龙泉市', 0);
INSERT INTO `sys_area` VALUES ('340000', '86', '安徽省', '安徽省', '', '', '安徽省', 0);
INSERT INTO `sys_area` VALUES ('340100', '340000', '合肥市', '安徽省', '合肥市', '', '安徽省合肥市', 0);
INSERT INTO `sys_area` VALUES ('340101', '340100', '市辖区', '安徽省', '合肥市', '市辖区', '安徽省合肥市市辖区', 0);
INSERT INTO `sys_area` VALUES ('340102', '340100', '瑶海区', '安徽省', '合肥市', '瑶海区', '安徽省合肥市瑶海区', 0);
INSERT INTO `sys_area` VALUES ('340103', '340100', '庐阳区', '安徽省', '合肥市', '庐阳区', '安徽省合肥市庐阳区', 0);
INSERT INTO `sys_area` VALUES ('340104', '340100', '蜀山区', '安徽省', '合肥市', '蜀山区', '安徽省合肥市蜀山区', 0);
INSERT INTO `sys_area` VALUES ('340111', '340100', '包河区', '安徽省', '合肥市', '包河区', '安徽省合肥市包河区', 0);
INSERT INTO `sys_area` VALUES ('340121', '340100', '长丰县', '安徽省', '合肥市', '长丰县', '安徽省合肥市长丰县', 0);
INSERT INTO `sys_area` VALUES ('340122', '340100', '肥东县', '安徽省', '合肥市', '肥东县', '安徽省合肥市肥东县', 0);
INSERT INTO `sys_area` VALUES ('340123', '340100', '肥西县', '安徽省', '合肥市', '肥西县', '安徽省合肥市肥西县', 0);
INSERT INTO `sys_area` VALUES ('340124', '340100', '庐江县', '安徽省', '合肥市', '庐江县', '安徽省合肥市庐江县', 0);
INSERT INTO `sys_area` VALUES ('340181', '340100', '巢湖市', '安徽省', '合肥市', '巢湖市', '安徽省合肥市巢湖市', 0);
INSERT INTO `sys_area` VALUES ('340200', '340000', '芜湖市', '安徽省', '芜湖市', '', '安徽省芜湖市', 0);
INSERT INTO `sys_area` VALUES ('340201', '340200', '市辖区', '安徽省', '芜湖市', '市辖区', '安徽省芜湖市市辖区', 0);
INSERT INTO `sys_area` VALUES ('340202', '340200', '镜湖区', '安徽省', '芜湖市', '镜湖区', '安徽省芜湖市镜湖区', 0);
INSERT INTO `sys_area` VALUES ('340203', '340200', '弋江区', '安徽省', '芜湖市', '弋江区', '安徽省芜湖市弋江区', 0);
INSERT INTO `sys_area` VALUES ('340207', '340200', '鸠江区', '安徽省', '芜湖市', '鸠江区', '安徽省芜湖市鸠江区', 0);
INSERT INTO `sys_area` VALUES ('340208', '340200', '三山区', '安徽省', '芜湖市', '三山区', '安徽省芜湖市三山区', 0);
INSERT INTO `sys_area` VALUES ('340221', '340200', '芜湖县', '安徽省', '芜湖市', '芜湖县', '安徽省芜湖市芜湖县', 0);
INSERT INTO `sys_area` VALUES ('340222', '340200', '繁昌县', '安徽省', '芜湖市', '繁昌县', '安徽省芜湖市繁昌县', 0);
INSERT INTO `sys_area` VALUES ('340223', '340200', '南陵县', '安徽省', '芜湖市', '南陵县', '安徽省芜湖市南陵县', 0);
INSERT INTO `sys_area` VALUES ('340225', '340200', '无为县', '安徽省', '芜湖市', '无为县', '安徽省芜湖市无为县', 0);
INSERT INTO `sys_area` VALUES ('340300', '340000', '蚌埠市', '安徽省', '蚌埠市', '', '安徽省蚌埠市', 0);
INSERT INTO `sys_area` VALUES ('340301', '340300', '市辖区', '安徽省', '蚌埠市', '市辖区', '安徽省蚌埠市市辖区', 0);
INSERT INTO `sys_area` VALUES ('340302', '340300', '龙子湖区', '安徽省', '蚌埠市', '龙子湖区', '安徽省蚌埠市龙子湖区', 0);
INSERT INTO `sys_area` VALUES ('340303', '340300', '蚌山区', '安徽省', '蚌埠市', '蚌山区', '安徽省蚌埠市蚌山区', 0);
INSERT INTO `sys_area` VALUES ('340304', '340300', '禹会区', '安徽省', '蚌埠市', '禹会区', '安徽省蚌埠市禹会区', 0);
INSERT INTO `sys_area` VALUES ('340311', '340300', '淮上区', '安徽省', '蚌埠市', '淮上区', '安徽省蚌埠市淮上区', 0);
INSERT INTO `sys_area` VALUES ('340321', '340300', '怀远县', '安徽省', '蚌埠市', '怀远县', '安徽省蚌埠市怀远县', 0);
INSERT INTO `sys_area` VALUES ('340322', '340300', '五河县', '安徽省', '蚌埠市', '五河县', '安徽省蚌埠市五河县', 0);
INSERT INTO `sys_area` VALUES ('340323', '340300', '固镇县', '安徽省', '蚌埠市', '固镇县', '安徽省蚌埠市固镇县', 0);
INSERT INTO `sys_area` VALUES ('340400', '340000', '淮南市', '安徽省', '淮南市', '', '安徽省淮南市', 0);
INSERT INTO `sys_area` VALUES ('340401', '340400', '市辖区', '安徽省', '淮南市', '市辖区', '安徽省淮南市市辖区', 0);
INSERT INTO `sys_area` VALUES ('340402', '340400', '大通区', '安徽省', '淮南市', '大通区', '安徽省淮南市大通区', 0);
INSERT INTO `sys_area` VALUES ('340403', '340400', '田家庵区', '安徽省', '淮南市', '田家庵区', '安徽省淮南市田家庵区', 0);
INSERT INTO `sys_area` VALUES ('340404', '340400', '谢家集区', '安徽省', '淮南市', '谢家集区', '安徽省淮南市谢家集区', 0);
INSERT INTO `sys_area` VALUES ('340405', '340400', '八公山区', '安徽省', '淮南市', '八公山区', '安徽省淮南市八公山区', 0);
INSERT INTO `sys_area` VALUES ('340406', '340400', '潘集区', '安徽省', '淮南市', '潘集区', '安徽省淮南市潘集区', 0);
INSERT INTO `sys_area` VALUES ('340421', '340400', '凤台县', '安徽省', '淮南市', '凤台县', '安徽省淮南市凤台县', 0);
INSERT INTO `sys_area` VALUES ('340422', '340400', '寿县', '安徽省', '淮南市', '寿县', '安徽省淮南市寿县', 0);
INSERT INTO `sys_area` VALUES ('340500', '340000', '马鞍山市', '安徽省', '马鞍山市', '', '安徽省马鞍山市', 0);
INSERT INTO `sys_area` VALUES ('340501', '340500', '市辖区', '安徽省', '马鞍山市', '市辖区', '安徽省马鞍山市市辖区', 0);
INSERT INTO `sys_area` VALUES ('340503', '340500', '花山区', '安徽省', '马鞍山市', '花山区', '安徽省马鞍山市花山区', 0);
INSERT INTO `sys_area` VALUES ('340504', '340500', '雨山区', '安徽省', '马鞍山市', '雨山区', '安徽省马鞍山市雨山区', 0);
INSERT INTO `sys_area` VALUES ('340506', '340500', '博望区', '安徽省', '马鞍山市', '博望区', '安徽省马鞍山市博望区', 0);
INSERT INTO `sys_area` VALUES ('340521', '340500', '当涂县', '安徽省', '马鞍山市', '当涂县', '安徽省马鞍山市当涂县', 0);
INSERT INTO `sys_area` VALUES ('340522', '340500', '含山县', '安徽省', '马鞍山市', '含山县', '安徽省马鞍山市含山县', 0);
INSERT INTO `sys_area` VALUES ('340523', '340500', '和县', '安徽省', '马鞍山市', '和县', '安徽省马鞍山市和县', 0);
INSERT INTO `sys_area` VALUES ('340600', '340000', '淮北市', '安徽省', '淮北市', '', '安徽省淮北市', 0);
INSERT INTO `sys_area` VALUES ('340601', '340600', '市辖区', '安徽省', '淮北市', '市辖区', '安徽省淮北市市辖区', 0);
INSERT INTO `sys_area` VALUES ('340602', '340600', '杜集区', '安徽省', '淮北市', '杜集区', '安徽省淮北市杜集区', 0);
INSERT INTO `sys_area` VALUES ('340603', '340600', '相山区', '安徽省', '淮北市', '相山区', '安徽省淮北市相山区', 0);
INSERT INTO `sys_area` VALUES ('340604', '340600', '烈山区', '安徽省', '淮北市', '烈山区', '安徽省淮北市烈山区', 0);
INSERT INTO `sys_area` VALUES ('340621', '340600', '濉溪县', '安徽省', '淮北市', '濉溪县', '安徽省淮北市濉溪县', 0);
INSERT INTO `sys_area` VALUES ('340700', '340000', '铜陵市', '安徽省', '铜陵市', '', '安徽省铜陵市', 0);
INSERT INTO `sys_area` VALUES ('340701', '340700', '市辖区', '安徽省', '铜陵市', '市辖区', '安徽省铜陵市市辖区', 0);
INSERT INTO `sys_area` VALUES ('340705', '340700', '铜官区', '安徽省', '铜陵市', '铜官区', '安徽省铜陵市铜官区', 0);
INSERT INTO `sys_area` VALUES ('340706', '340700', '义安区', '安徽省', '铜陵市', '义安区', '安徽省铜陵市义安区', 0);
INSERT INTO `sys_area` VALUES ('340711', '340700', '郊区', '安徽省', '铜陵市', '郊区', '安徽省铜陵市郊区', 0);
INSERT INTO `sys_area` VALUES ('340722', '340700', '枞阳县', '安徽省', '铜陵市', '枞阳县', '安徽省铜陵市枞阳县', 0);
INSERT INTO `sys_area` VALUES ('340800', '340000', '安庆市', '安徽省', '安庆市', '', '安徽省安庆市', 0);
INSERT INTO `sys_area` VALUES ('340801', '340800', '市辖区', '安徽省', '安庆市', '市辖区', '安徽省安庆市市辖区', 0);
INSERT INTO `sys_area` VALUES ('340802', '340800', '迎江区', '安徽省', '安庆市', '迎江区', '安徽省安庆市迎江区', 0);
INSERT INTO `sys_area` VALUES ('340803', '340800', '大观区', '安徽省', '安庆市', '大观区', '安徽省安庆市大观区', 0);
INSERT INTO `sys_area` VALUES ('340811', '340800', '宜秀区', '安徽省', '安庆市', '宜秀区', '安徽省安庆市宜秀区', 0);
INSERT INTO `sys_area` VALUES ('340822', '340800', '怀宁县', '安徽省', '安庆市', '怀宁县', '安徽省安庆市怀宁县', 0);
INSERT INTO `sys_area` VALUES ('340824', '340800', '潜山县', '安徽省', '安庆市', '潜山县', '安徽省安庆市潜山县', 0);
INSERT INTO `sys_area` VALUES ('340825', '340800', '太湖县', '安徽省', '安庆市', '太湖县', '安徽省安庆市太湖县', 0);
INSERT INTO `sys_area` VALUES ('340826', '340800', '宿松县', '安徽省', '安庆市', '宿松县', '安徽省安庆市宿松县', 0);
INSERT INTO `sys_area` VALUES ('340827', '340800', '望江县', '安徽省', '安庆市', '望江县', '安徽省安庆市望江县', 0);
INSERT INTO `sys_area` VALUES ('340828', '340800', '岳西县', '安徽省', '安庆市', '岳西县', '安徽省安庆市岳西县', 0);
INSERT INTO `sys_area` VALUES ('340881', '340800', '桐城市', '安徽省', '安庆市', '桐城市', '安徽省安庆市桐城市', 0);
INSERT INTO `sys_area` VALUES ('341000', '340000', '黄山市', '安徽省', '黄山市', '', '安徽省黄山市', 0);
INSERT INTO `sys_area` VALUES ('341001', '341000', '市辖区', '安徽省', '黄山市', '市辖区', '安徽省黄山市市辖区', 0);
INSERT INTO `sys_area` VALUES ('341002', '341000', '屯溪区', '安徽省', '黄山市', '屯溪区', '安徽省黄山市屯溪区', 0);
INSERT INTO `sys_area` VALUES ('341003', '341000', '黄山区', '安徽省', '黄山市', '黄山区', '安徽省黄山市黄山区', 0);
INSERT INTO `sys_area` VALUES ('341004', '341000', '徽州区', '安徽省', '黄山市', '徽州区', '安徽省黄山市徽州区', 0);
INSERT INTO `sys_area` VALUES ('341021', '341000', '歙县', '安徽省', '黄山市', '歙县', '安徽省黄山市歙县', 0);
INSERT INTO `sys_area` VALUES ('341022', '341000', '休宁县', '安徽省', '黄山市', '休宁县', '安徽省黄山市休宁县', 0);
INSERT INTO `sys_area` VALUES ('341023', '341000', '黟县', '安徽省', '黄山市', '黟县', '安徽省黄山市黟县', 0);
INSERT INTO `sys_area` VALUES ('341024', '341000', '祁门县', '安徽省', '黄山市', '祁门县', '安徽省黄山市祁门县', 0);
INSERT INTO `sys_area` VALUES ('341100', '340000', '滁州市', '安徽省', '滁州市', '', '安徽省滁州市', 0);
INSERT INTO `sys_area` VALUES ('341101', '341100', '市辖区', '安徽省', '滁州市', '市辖区', '安徽省滁州市市辖区', 0);
INSERT INTO `sys_area` VALUES ('341102', '341100', '琅琊区', '安徽省', '滁州市', '琅琊区', '安徽省滁州市琅琊区', 0);
INSERT INTO `sys_area` VALUES ('341103', '341100', '南谯区', '安徽省', '滁州市', '南谯区', '安徽省滁州市南谯区', 0);
INSERT INTO `sys_area` VALUES ('341122', '341100', '来安县', '安徽省', '滁州市', '来安县', '安徽省滁州市来安县', 0);
INSERT INTO `sys_area` VALUES ('341124', '341100', '全椒县', '安徽省', '滁州市', '全椒县', '安徽省滁州市全椒县', 0);
INSERT INTO `sys_area` VALUES ('341125', '341100', '定远县', '安徽省', '滁州市', '定远县', '安徽省滁州市定远县', 0);
INSERT INTO `sys_area` VALUES ('341126', '341100', '凤阳县', '安徽省', '滁州市', '凤阳县', '安徽省滁州市凤阳县', 0);
INSERT INTO `sys_area` VALUES ('341181', '341100', '天长市', '安徽省', '滁州市', '天长市', '安徽省滁州市天长市', 0);
INSERT INTO `sys_area` VALUES ('341182', '341100', '明光市', '安徽省', '滁州市', '明光市', '安徽省滁州市明光市', 0);
INSERT INTO `sys_area` VALUES ('341200', '340000', '阜阳市', '安徽省', '阜阳市', '', '安徽省阜阳市', 0);
INSERT INTO `sys_area` VALUES ('341201', '341200', '市辖区', '安徽省', '阜阳市', '市辖区', '安徽省阜阳市市辖区', 0);
INSERT INTO `sys_area` VALUES ('341202', '341200', '颍州区', '安徽省', '阜阳市', '颍州区', '安徽省阜阳市颍州区', 0);
INSERT INTO `sys_area` VALUES ('341203', '341200', '颍东区', '安徽省', '阜阳市', '颍东区', '安徽省阜阳市颍东区', 0);
INSERT INTO `sys_area` VALUES ('341204', '341200', '颍泉区', '安徽省', '阜阳市', '颍泉区', '安徽省阜阳市颍泉区', 0);
INSERT INTO `sys_area` VALUES ('341221', '341200', '临泉县', '安徽省', '阜阳市', '临泉县', '安徽省阜阳市临泉县', 0);
INSERT INTO `sys_area` VALUES ('341222', '341200', '太和县', '安徽省', '阜阳市', '太和县', '安徽省阜阳市太和县', 0);
INSERT INTO `sys_area` VALUES ('341225', '341200', '阜南县', '安徽省', '阜阳市', '阜南县', '安徽省阜阳市阜南县', 0);
INSERT INTO `sys_area` VALUES ('341226', '341200', '颍上县', '安徽省', '阜阳市', '颍上县', '安徽省阜阳市颍上县', 0);
INSERT INTO `sys_area` VALUES ('341282', '341200', '界首市', '安徽省', '阜阳市', '界首市', '安徽省阜阳市界首市', 0);
INSERT INTO `sys_area` VALUES ('341300', '340000', '宿州市', '安徽省', '宿州市', '', '安徽省宿州市', 0);
INSERT INTO `sys_area` VALUES ('341301', '341300', '市辖区', '安徽省', '宿州市', '市辖区', '安徽省宿州市市辖区', 0);
INSERT INTO `sys_area` VALUES ('341302', '341300', '埇桥区', '安徽省', '宿州市', '埇桥区', '安徽省宿州市埇桥区', 0);
INSERT INTO `sys_area` VALUES ('341321', '341300', '砀山县', '安徽省', '宿州市', '砀山县', '安徽省宿州市砀山县', 0);
INSERT INTO `sys_area` VALUES ('341322', '341300', '萧县', '安徽省', '宿州市', '萧县', '安徽省宿州市萧县', 0);
INSERT INTO `sys_area` VALUES ('341323', '341300', '灵璧县', '安徽省', '宿州市', '灵璧县', '安徽省宿州市灵璧县', 0);
INSERT INTO `sys_area` VALUES ('341324', '341300', '泗县', '安徽省', '宿州市', '泗县', '安徽省宿州市泗县', 0);
INSERT INTO `sys_area` VALUES ('341500', '340000', '六安市', '安徽省', '六安市', '', '安徽省六安市', 0);
INSERT INTO `sys_area` VALUES ('341501', '341500', '市辖区', '安徽省', '六安市', '市辖区', '安徽省六安市市辖区', 0);
INSERT INTO `sys_area` VALUES ('341502', '341500', '金安区', '安徽省', '六安市', '金安区', '安徽省六安市金安区', 0);
INSERT INTO `sys_area` VALUES ('341503', '341500', '裕安区', '安徽省', '六安市', '裕安区', '安徽省六安市裕安区', 0);
INSERT INTO `sys_area` VALUES ('341504', '341500', '叶集区', '安徽省', '六安市', '叶集区', '安徽省六安市叶集区', 0);
INSERT INTO `sys_area` VALUES ('341522', '341500', '霍邱县', '安徽省', '六安市', '霍邱县', '安徽省六安市霍邱县', 0);
INSERT INTO `sys_area` VALUES ('341523', '341500', '舒城县', '安徽省', '六安市', '舒城县', '安徽省六安市舒城县', 0);
INSERT INTO `sys_area` VALUES ('341524', '341500', '金寨县', '安徽省', '六安市', '金寨县', '安徽省六安市金寨县', 0);
INSERT INTO `sys_area` VALUES ('341525', '341500', '霍山县', '安徽省', '六安市', '霍山县', '安徽省六安市霍山县', 0);
INSERT INTO `sys_area` VALUES ('341600', '340000', '亳州市', '安徽省', '亳州市', '', '安徽省亳州市', 0);
INSERT INTO `sys_area` VALUES ('341601', '341600', '市辖区', '安徽省', '亳州市', '市辖区', '安徽省亳州市市辖区', 0);
INSERT INTO `sys_area` VALUES ('341602', '341600', '谯城区', '安徽省', '亳州市', '谯城区', '安徽省亳州市谯城区', 0);
INSERT INTO `sys_area` VALUES ('341621', '341600', '涡阳县', '安徽省', '亳州市', '涡阳县', '安徽省亳州市涡阳县', 0);
INSERT INTO `sys_area` VALUES ('341622', '341600', '蒙城县', '安徽省', '亳州市', '蒙城县', '安徽省亳州市蒙城县', 0);
INSERT INTO `sys_area` VALUES ('341623', '341600', '利辛县', '安徽省', '亳州市', '利辛县', '安徽省亳州市利辛县', 0);
INSERT INTO `sys_area` VALUES ('341700', '340000', '池州市', '安徽省', '池州市', '', '安徽省池州市', 0);
INSERT INTO `sys_area` VALUES ('341701', '341700', '市辖区', '安徽省', '池州市', '市辖区', '安徽省池州市市辖区', 0);
INSERT INTO `sys_area` VALUES ('341702', '341700', '贵池区', '安徽省', '池州市', '贵池区', '安徽省池州市贵池区', 0);
INSERT INTO `sys_area` VALUES ('341721', '341700', '东至县', '安徽省', '池州市', '东至县', '安徽省池州市东至县', 0);
INSERT INTO `sys_area` VALUES ('341722', '341700', '石台县', '安徽省', '池州市', '石台县', '安徽省池州市石台县', 0);
INSERT INTO `sys_area` VALUES ('341723', '341700', '青阳县', '安徽省', '池州市', '青阳县', '安徽省池州市青阳县', 0);
INSERT INTO `sys_area` VALUES ('341800', '340000', '宣城市', '安徽省', '宣城市', '', '安徽省宣城市', 0);
INSERT INTO `sys_area` VALUES ('341801', '341800', '市辖区', '安徽省', '宣城市', '市辖区', '安徽省宣城市市辖区', 0);
INSERT INTO `sys_area` VALUES ('341802', '341800', '宣州区', '安徽省', '宣城市', '宣州区', '安徽省宣城市宣州区', 0);
INSERT INTO `sys_area` VALUES ('341821', '341800', '郎溪县', '安徽省', '宣城市', '郎溪县', '安徽省宣城市郎溪县', 0);
INSERT INTO `sys_area` VALUES ('341822', '341800', '广德县', '安徽省', '宣城市', '广德县', '安徽省宣城市广德县', 0);
INSERT INTO `sys_area` VALUES ('341823', '341800', '泾县', '安徽省', '宣城市', '泾县', '安徽省宣城市泾县', 0);
INSERT INTO `sys_area` VALUES ('341824', '341800', '绩溪县', '安徽省', '宣城市', '绩溪县', '安徽省宣城市绩溪县', 0);
INSERT INTO `sys_area` VALUES ('341825', '341800', '旌德县', '安徽省', '宣城市', '旌德县', '安徽省宣城市旌德县', 0);
INSERT INTO `sys_area` VALUES ('341881', '341800', '宁国市', '安徽省', '宣城市', '宁国市', '安徽省宣城市宁国市', 0);
INSERT INTO `sys_area` VALUES ('350000', '86', '福建省', '福建省', '', '', '福建省', 0);
INSERT INTO `sys_area` VALUES ('350100', '350000', '福州市', '福建省', '福州市', '', '福建省福州市', 0);
INSERT INTO `sys_area` VALUES ('350101', '350100', '市辖区', '福建省', '福州市', '市辖区', '福建省福州市市辖区', 0);
INSERT INTO `sys_area` VALUES ('350102', '350100', '鼓楼区', '福建省', '福州市', '鼓楼区', '福建省福州市鼓楼区', 0);
INSERT INTO `sys_area` VALUES ('350103', '350100', '台江区', '福建省', '福州市', '台江区', '福建省福州市台江区', 0);
INSERT INTO `sys_area` VALUES ('350104', '350100', '仓山区', '福建省', '福州市', '仓山区', '福建省福州市仓山区', 0);
INSERT INTO `sys_area` VALUES ('350105', '350100', '马尾区', '福建省', '福州市', '马尾区', '福建省福州市马尾区', 0);
INSERT INTO `sys_area` VALUES ('350111', '350100', '晋安区', '福建省', '福州市', '晋安区', '福建省福州市晋安区', 0);
INSERT INTO `sys_area` VALUES ('350121', '350100', '闽侯县', '福建省', '福州市', '闽侯县', '福建省福州市闽侯县', 0);
INSERT INTO `sys_area` VALUES ('350122', '350100', '连江县', '福建省', '福州市', '连江县', '福建省福州市连江县', 0);
INSERT INTO `sys_area` VALUES ('350123', '350100', '罗源县', '福建省', '福州市', '罗源县', '福建省福州市罗源县', 0);
INSERT INTO `sys_area` VALUES ('350124', '350100', '闽清县', '福建省', '福州市', '闽清县', '福建省福州市闽清县', 0);
INSERT INTO `sys_area` VALUES ('350125', '350100', '永泰县', '福建省', '福州市', '永泰县', '福建省福州市永泰县', 0);
INSERT INTO `sys_area` VALUES ('350128', '350100', '平潭县', '福建省', '福州市', '平潭县', '福建省福州市平潭县', 0);
INSERT INTO `sys_area` VALUES ('350181', '350100', '福清市', '福建省', '福州市', '福清市', '福建省福州市福清市', 0);
INSERT INTO `sys_area` VALUES ('350182', '350100', '长乐市', '福建省', '福州市', '长乐市', '福建省福州市长乐市', 0);
INSERT INTO `sys_area` VALUES ('350200', '350000', '厦门市', '福建省', '厦门市', '', '福建省厦门市', 0);
INSERT INTO `sys_area` VALUES ('350201', '350200', '市辖区', '福建省', '厦门市', '市辖区', '福建省厦门市市辖区', 0);
INSERT INTO `sys_area` VALUES ('350203', '350200', '思明区', '福建省', '厦门市', '思明区', '福建省厦门市思明区', 0);
INSERT INTO `sys_area` VALUES ('350205', '350200', '海沧区', '福建省', '厦门市', '海沧区', '福建省厦门市海沧区', 0);
INSERT INTO `sys_area` VALUES ('350206', '350200', '湖里区', '福建省', '厦门市', '湖里区', '福建省厦门市湖里区', 0);
INSERT INTO `sys_area` VALUES ('350211', '350200', '集美区', '福建省', '厦门市', '集美区', '福建省厦门市集美区', 0);
INSERT INTO `sys_area` VALUES ('350212', '350200', '同安区', '福建省', '厦门市', '同安区', '福建省厦门市同安区', 0);
INSERT INTO `sys_area` VALUES ('350213', '350200', '翔安区', '福建省', '厦门市', '翔安区', '福建省厦门市翔安区', 0);
INSERT INTO `sys_area` VALUES ('350300', '350000', '莆田市', '福建省', '莆田市', '', '福建省莆田市', 0);
INSERT INTO `sys_area` VALUES ('350301', '350300', '市辖区', '福建省', '莆田市', '市辖区', '福建省莆田市市辖区', 0);
INSERT INTO `sys_area` VALUES ('350302', '350300', '城厢区', '福建省', '莆田市', '城厢区', '福建省莆田市城厢区', 0);
INSERT INTO `sys_area` VALUES ('350303', '350300', '涵江区', '福建省', '莆田市', '涵江区', '福建省莆田市涵江区', 0);
INSERT INTO `sys_area` VALUES ('350304', '350300', '荔城区', '福建省', '莆田市', '荔城区', '福建省莆田市荔城区', 0);
INSERT INTO `sys_area` VALUES ('350305', '350300', '秀屿区', '福建省', '莆田市', '秀屿区', '福建省莆田市秀屿区', 0);
INSERT INTO `sys_area` VALUES ('350322', '350300', '仙游县', '福建省', '莆田市', '仙游县', '福建省莆田市仙游县', 0);
INSERT INTO `sys_area` VALUES ('350400', '350000', '三明市', '福建省', '三明市', '', '福建省三明市', 0);
INSERT INTO `sys_area` VALUES ('350401', '350400', '市辖区', '福建省', '三明市', '市辖区', '福建省三明市市辖区', 0);
INSERT INTO `sys_area` VALUES ('350402', '350400', '梅列区', '福建省', '三明市', '梅列区', '福建省三明市梅列区', 0);
INSERT INTO `sys_area` VALUES ('350403', '350400', '三元区', '福建省', '三明市', '三元区', '福建省三明市三元区', 0);
INSERT INTO `sys_area` VALUES ('350421', '350400', '明溪县', '福建省', '三明市', '明溪县', '福建省三明市明溪县', 0);
INSERT INTO `sys_area` VALUES ('350423', '350400', '清流县', '福建省', '三明市', '清流县', '福建省三明市清流县', 0);
INSERT INTO `sys_area` VALUES ('350424', '350400', '宁化县', '福建省', '三明市', '宁化县', '福建省三明市宁化县', 0);
INSERT INTO `sys_area` VALUES ('350425', '350400', '大田县', '福建省', '三明市', '大田县', '福建省三明市大田县', 0);
INSERT INTO `sys_area` VALUES ('350426', '350400', '尤溪县', '福建省', '三明市', '尤溪县', '福建省三明市尤溪县', 0);
INSERT INTO `sys_area` VALUES ('350427', '350400', '沙县', '福建省', '三明市', '沙县', '福建省三明市沙县', 0);
INSERT INTO `sys_area` VALUES ('350428', '350400', '将乐县', '福建省', '三明市', '将乐县', '福建省三明市将乐县', 0);
INSERT INTO `sys_area` VALUES ('350429', '350400', '泰宁县', '福建省', '三明市', '泰宁县', '福建省三明市泰宁县', 0);
INSERT INTO `sys_area` VALUES ('350430', '350400', '建宁县', '福建省', '三明市', '建宁县', '福建省三明市建宁县', 0);
INSERT INTO `sys_area` VALUES ('350481', '350400', '永安市', '福建省', '三明市', '永安市', '福建省三明市永安市', 0);
INSERT INTO `sys_area` VALUES ('350500', '350000', '泉州市', '福建省', '泉州市', '', '福建省泉州市', 0);
INSERT INTO `sys_area` VALUES ('350501', '350500', '市辖区', '福建省', '泉州市', '市辖区', '福建省泉州市市辖区', 0);
INSERT INTO `sys_area` VALUES ('350502', '350500', '鲤城区', '福建省', '泉州市', '鲤城区', '福建省泉州市鲤城区', 0);
INSERT INTO `sys_area` VALUES ('350503', '350500', '丰泽区', '福建省', '泉州市', '丰泽区', '福建省泉州市丰泽区', 0);
INSERT INTO `sys_area` VALUES ('350504', '350500', '洛江区', '福建省', '泉州市', '洛江区', '福建省泉州市洛江区', 0);
INSERT INTO `sys_area` VALUES ('350505', '350500', '泉港区', '福建省', '泉州市', '泉港区', '福建省泉州市泉港区', 0);
INSERT INTO `sys_area` VALUES ('350521', '350500', '惠安县', '福建省', '泉州市', '惠安县', '福建省泉州市惠安县', 0);
INSERT INTO `sys_area` VALUES ('350524', '350500', '安溪县', '福建省', '泉州市', '安溪县', '福建省泉州市安溪县', 0);
INSERT INTO `sys_area` VALUES ('350525', '350500', '永春县', '福建省', '泉州市', '永春县', '福建省泉州市永春县', 0);
INSERT INTO `sys_area` VALUES ('350526', '350500', '德化县', '福建省', '泉州市', '德化县', '福建省泉州市德化县', 0);
INSERT INTO `sys_area` VALUES ('350527', '350500', '金门县', '福建省', '泉州市', '金门县', '福建省泉州市金门县', 0);
INSERT INTO `sys_area` VALUES ('350581', '350500', '石狮市', '福建省', '泉州市', '石狮市', '福建省泉州市石狮市', 0);
INSERT INTO `sys_area` VALUES ('350582', '350500', '晋江市', '福建省', '泉州市', '晋江市', '福建省泉州市晋江市', 0);
INSERT INTO `sys_area` VALUES ('350583', '350500', '南安市', '福建省', '泉州市', '南安市', '福建省泉州市南安市', 0);
INSERT INTO `sys_area` VALUES ('350600', '350000', '漳州市', '福建省', '漳州市', '', '福建省漳州市', 0);
INSERT INTO `sys_area` VALUES ('350601', '350600', '市辖区', '福建省', '漳州市', '市辖区', '福建省漳州市市辖区', 0);
INSERT INTO `sys_area` VALUES ('350602', '350600', '芗城区', '福建省', '漳州市', '芗城区', '福建省漳州市芗城区', 0);
INSERT INTO `sys_area` VALUES ('350603', '350600', '龙文区', '福建省', '漳州市', '龙文区', '福建省漳州市龙文区', 0);
INSERT INTO `sys_area` VALUES ('350622', '350600', '云霄县', '福建省', '漳州市', '云霄县', '福建省漳州市云霄县', 0);
INSERT INTO `sys_area` VALUES ('350623', '350600', '漳浦县', '福建省', '漳州市', '漳浦县', '福建省漳州市漳浦县', 0);
INSERT INTO `sys_area` VALUES ('350624', '350600', '诏安县', '福建省', '漳州市', '诏安县', '福建省漳州市诏安县', 0);
INSERT INTO `sys_area` VALUES ('350625', '350600', '长泰县', '福建省', '漳州市', '长泰县', '福建省漳州市长泰县', 0);
INSERT INTO `sys_area` VALUES ('350626', '350600', '东山县', '福建省', '漳州市', '东山县', '福建省漳州市东山县', 0);
INSERT INTO `sys_area` VALUES ('350627', '350600', '南靖县', '福建省', '漳州市', '南靖县', '福建省漳州市南靖县', 0);
INSERT INTO `sys_area` VALUES ('350628', '350600', '平和县', '福建省', '漳州市', '平和县', '福建省漳州市平和县', 0);
INSERT INTO `sys_area` VALUES ('350629', '350600', '华安县', '福建省', '漳州市', '华安县', '福建省漳州市华安县', 0);
INSERT INTO `sys_area` VALUES ('350681', '350600', '龙海市', '福建省', '漳州市', '龙海市', '福建省漳州市龙海市', 0);
INSERT INTO `sys_area` VALUES ('350700', '350000', '南平市', '福建省', '南平市', '', '福建省南平市', 0);
INSERT INTO `sys_area` VALUES ('350701', '350700', '市辖区', '福建省', '南平市', '市辖区', '福建省南平市市辖区', 0);
INSERT INTO `sys_area` VALUES ('350702', '350700', '延平区', '福建省', '南平市', '延平区', '福建省南平市延平区', 0);
INSERT INTO `sys_area` VALUES ('350703', '350700', '建阳区', '福建省', '南平市', '建阳区', '福建省南平市建阳区', 0);
INSERT INTO `sys_area` VALUES ('350721', '350700', '顺昌县', '福建省', '南平市', '顺昌县', '福建省南平市顺昌县', 0);
INSERT INTO `sys_area` VALUES ('350722', '350700', '浦城县', '福建省', '南平市', '浦城县', '福建省南平市浦城县', 0);
INSERT INTO `sys_area` VALUES ('350723', '350700', '光泽县', '福建省', '南平市', '光泽县', '福建省南平市光泽县', 0);
INSERT INTO `sys_area` VALUES ('350724', '350700', '松溪县', '福建省', '南平市', '松溪县', '福建省南平市松溪县', 0);
INSERT INTO `sys_area` VALUES ('350725', '350700', '政和县', '福建省', '南平市', '政和县', '福建省南平市政和县', 0);
INSERT INTO `sys_area` VALUES ('350781', '350700', '邵武市', '福建省', '南平市', '邵武市', '福建省南平市邵武市', 0);
INSERT INTO `sys_area` VALUES ('350782', '350700', '武夷山市', '福建省', '南平市', '武夷山市', '福建省南平市武夷山市', 0);
INSERT INTO `sys_area` VALUES ('350783', '350700', '建瓯市', '福建省', '南平市', '建瓯市', '福建省南平市建瓯市', 0);
INSERT INTO `sys_area` VALUES ('350800', '350000', '龙岩市', '福建省', '龙岩市', '', '福建省龙岩市', 0);
INSERT INTO `sys_area` VALUES ('350801', '350800', '市辖区', '福建省', '龙岩市', '市辖区', '福建省龙岩市市辖区', 0);
INSERT INTO `sys_area` VALUES ('350802', '350800', '新罗区', '福建省', '龙岩市', '新罗区', '福建省龙岩市新罗区', 0);
INSERT INTO `sys_area` VALUES ('350803', '350800', '永定区', '福建省', '龙岩市', '永定区', '福建省龙岩市永定区', 0);
INSERT INTO `sys_area` VALUES ('350821', '350800', '长汀县', '福建省', '龙岩市', '长汀县', '福建省龙岩市长汀县', 0);
INSERT INTO `sys_area` VALUES ('350823', '350800', '上杭县', '福建省', '龙岩市', '上杭县', '福建省龙岩市上杭县', 0);
INSERT INTO `sys_area` VALUES ('350824', '350800', '武平县', '福建省', '龙岩市', '武平县', '福建省龙岩市武平县', 0);
INSERT INTO `sys_area` VALUES ('350825', '350800', '连城县', '福建省', '龙岩市', '连城县', '福建省龙岩市连城县', 0);
INSERT INTO `sys_area` VALUES ('350881', '350800', '漳平市', '福建省', '龙岩市', '漳平市', '福建省龙岩市漳平市', 0);
INSERT INTO `sys_area` VALUES ('350900', '350000', '宁德市', '福建省', '宁德市', '', '福建省宁德市', 0);
INSERT INTO `sys_area` VALUES ('350901', '350900', '市辖区', '福建省', '宁德市', '市辖区', '福建省宁德市市辖区', 0);
INSERT INTO `sys_area` VALUES ('350902', '350900', '蕉城区', '福建省', '宁德市', '蕉城区', '福建省宁德市蕉城区', 0);
INSERT INTO `sys_area` VALUES ('350921', '350900', '霞浦县', '福建省', '宁德市', '霞浦县', '福建省宁德市霞浦县', 0);
INSERT INTO `sys_area` VALUES ('350922', '350900', '古田县', '福建省', '宁德市', '古田县', '福建省宁德市古田县', 0);
INSERT INTO `sys_area` VALUES ('350923', '350900', '屏南县', '福建省', '宁德市', '屏南县', '福建省宁德市屏南县', 0);
INSERT INTO `sys_area` VALUES ('350924', '350900', '寿宁县', '福建省', '宁德市', '寿宁县', '福建省宁德市寿宁县', 0);
INSERT INTO `sys_area` VALUES ('350925', '350900', '周宁县', '福建省', '宁德市', '周宁县', '福建省宁德市周宁县', 0);
INSERT INTO `sys_area` VALUES ('350926', '350900', '柘荣县', '福建省', '宁德市', '柘荣县', '福建省宁德市柘荣县', 0);
INSERT INTO `sys_area` VALUES ('350981', '350900', '福安市', '福建省', '宁德市', '福安市', '福建省宁德市福安市', 0);
INSERT INTO `sys_area` VALUES ('350982', '350900', '福鼎市', '福建省', '宁德市', '福鼎市', '福建省宁德市福鼎市', 0);
INSERT INTO `sys_area` VALUES ('360000', '86', '江西省', '江西省', '', '', '江西省', 0);
INSERT INTO `sys_area` VALUES ('360100', '360000', '南昌市', '江西省', '南昌市', '', '江西省南昌市', 0);
INSERT INTO `sys_area` VALUES ('360101', '360100', '市辖区', '江西省', '南昌市', '市辖区', '江西省南昌市市辖区', 0);
INSERT INTO `sys_area` VALUES ('360102', '360100', '东湖区', '江西省', '南昌市', '东湖区', '江西省南昌市东湖区', 0);
INSERT INTO `sys_area` VALUES ('360103', '360100', '西湖区', '江西省', '南昌市', '西湖区', '江西省南昌市西湖区', 0);
INSERT INTO `sys_area` VALUES ('360104', '360100', '青云谱区', '江西省', '南昌市', '青云谱区', '江西省南昌市青云谱区', 0);
INSERT INTO `sys_area` VALUES ('360105', '360100', '湾里区', '江西省', '南昌市', '湾里区', '江西省南昌市湾里区', 0);
INSERT INTO `sys_area` VALUES ('360111', '360100', '青山湖区', '江西省', '南昌市', '青山湖区', '江西省南昌市青山湖区', 0);
INSERT INTO `sys_area` VALUES ('360112', '360100', '新建区', '江西省', '南昌市', '新建区', '江西省南昌市新建区', 0);
INSERT INTO `sys_area` VALUES ('360121', '360100', '南昌县', '江西省', '南昌市', '南昌县', '江西省南昌市南昌县', 0);
INSERT INTO `sys_area` VALUES ('360123', '360100', '安义县', '江西省', '南昌市', '安义县', '江西省南昌市安义县', 0);
INSERT INTO `sys_area` VALUES ('360124', '360100', '进贤县', '江西省', '南昌市', '进贤县', '江西省南昌市进贤县', 0);
INSERT INTO `sys_area` VALUES ('360200', '360000', '景德镇市', '江西省', '景德镇市', '', '江西省景德镇市', 0);
INSERT INTO `sys_area` VALUES ('360201', '360200', '市辖区', '江西省', '景德镇市', '市辖区', '江西省景德镇市市辖区', 0);
INSERT INTO `sys_area` VALUES ('360202', '360200', '昌江区', '江西省', '景德镇市', '昌江区', '江西省景德镇市昌江区', 0);
INSERT INTO `sys_area` VALUES ('360203', '360200', '珠山区', '江西省', '景德镇市', '珠山区', '江西省景德镇市珠山区', 0);
INSERT INTO `sys_area` VALUES ('360222', '360200', '浮梁县', '江西省', '景德镇市', '浮梁县', '江西省景德镇市浮梁县', 0);
INSERT INTO `sys_area` VALUES ('360281', '360200', '乐平市', '江西省', '景德镇市', '乐平市', '江西省景德镇市乐平市', 0);
INSERT INTO `sys_area` VALUES ('360300', '360000', '萍乡市', '江西省', '萍乡市', '', '江西省萍乡市', 0);
INSERT INTO `sys_area` VALUES ('360301', '360300', '市辖区', '江西省', '萍乡市', '市辖区', '江西省萍乡市市辖区', 0);
INSERT INTO `sys_area` VALUES ('360302', '360300', '安源区', '江西省', '萍乡市', '安源区', '江西省萍乡市安源区', 0);
INSERT INTO `sys_area` VALUES ('360313', '360300', '湘东区', '江西省', '萍乡市', '湘东区', '江西省萍乡市湘东区', 0);
INSERT INTO `sys_area` VALUES ('360321', '360300', '莲花县', '江西省', '萍乡市', '莲花县', '江西省萍乡市莲花县', 0);
INSERT INTO `sys_area` VALUES ('360322', '360300', '上栗县', '江西省', '萍乡市', '上栗县', '江西省萍乡市上栗县', 0);
INSERT INTO `sys_area` VALUES ('360323', '360300', '芦溪县', '江西省', '萍乡市', '芦溪县', '江西省萍乡市芦溪县', 0);
INSERT INTO `sys_area` VALUES ('360400', '360000', '九江市', '江西省', '九江市', '', '江西省九江市', 0);
INSERT INTO `sys_area` VALUES ('360401', '360400', '市辖区', '江西省', '九江市', '市辖区', '江西省九江市市辖区', 0);
INSERT INTO `sys_area` VALUES ('360402', '360400', '濂溪区', '江西省', '九江市', '濂溪区', '江西省九江市濂溪区', 0);
INSERT INTO `sys_area` VALUES ('360403', '360400', '浔阳区', '江西省', '九江市', '浔阳区', '江西省九江市浔阳区', 0);
INSERT INTO `sys_area` VALUES ('360421', '360400', '九江县', '江西省', '九江市', '九江县', '江西省九江市九江县', 0);
INSERT INTO `sys_area` VALUES ('360423', '360400', '武宁县', '江西省', '九江市', '武宁县', '江西省九江市武宁县', 0);
INSERT INTO `sys_area` VALUES ('360424', '360400', '修水县', '江西省', '九江市', '修水县', '江西省九江市修水县', 0);
INSERT INTO `sys_area` VALUES ('360425', '360400', '永修县', '江西省', '九江市', '永修县', '江西省九江市永修县', 0);
INSERT INTO `sys_area` VALUES ('360426', '360400', '德安县', '江西省', '九江市', '德安县', '江西省九江市德安县', 0);
INSERT INTO `sys_area` VALUES ('360428', '360400', '都昌县', '江西省', '九江市', '都昌县', '江西省九江市都昌县', 0);
INSERT INTO `sys_area` VALUES ('360429', '360400', '湖口县', '江西省', '九江市', '湖口县', '江西省九江市湖口县', 0);
INSERT INTO `sys_area` VALUES ('360430', '360400', '彭泽县', '江西省', '九江市', '彭泽县', '江西省九江市彭泽县', 0);
INSERT INTO `sys_area` VALUES ('360481', '360400', '瑞昌市', '江西省', '九江市', '瑞昌市', '江西省九江市瑞昌市', 0);
INSERT INTO `sys_area` VALUES ('360482', '360400', '共青城市', '江西省', '九江市', '共青城市', '江西省九江市共青城市', 0);
INSERT INTO `sys_area` VALUES ('360483', '360400', '庐山市', '江西省', '九江市', '庐山市', '江西省九江市庐山市', 0);
INSERT INTO `sys_area` VALUES ('360500', '360000', '新余市', '江西省', '新余市', '', '江西省新余市', 0);
INSERT INTO `sys_area` VALUES ('360501', '360500', '市辖区', '江西省', '新余市', '市辖区', '江西省新余市市辖区', 0);
INSERT INTO `sys_area` VALUES ('360502', '360500', '渝水区', '江西省', '新余市', '渝水区', '江西省新余市渝水区', 0);
INSERT INTO `sys_area` VALUES ('360521', '360500', '分宜县', '江西省', '新余市', '分宜县', '江西省新余市分宜县', 0);
INSERT INTO `sys_area` VALUES ('360600', '360000', '鹰潭市', '江西省', '鹰潭市', '', '江西省鹰潭市', 0);
INSERT INTO `sys_area` VALUES ('360601', '360600', '市辖区', '江西省', '鹰潭市', '市辖区', '江西省鹰潭市市辖区', 0);
INSERT INTO `sys_area` VALUES ('360602', '360600', '月湖区', '江西省', '鹰潭市', '月湖区', '江西省鹰潭市月湖区', 0);
INSERT INTO `sys_area` VALUES ('360622', '360600', '余江县', '江西省', '鹰潭市', '余江县', '江西省鹰潭市余江县', 0);
INSERT INTO `sys_area` VALUES ('360681', '360600', '贵溪市', '江西省', '鹰潭市', '贵溪市', '江西省鹰潭市贵溪市', 0);
INSERT INTO `sys_area` VALUES ('360700', '360000', '赣州市', '江西省', '赣州市', '', '江西省赣州市', 0);
INSERT INTO `sys_area` VALUES ('360701', '360700', '市辖区', '江西省', '赣州市', '市辖区', '江西省赣州市市辖区', 0);
INSERT INTO `sys_area` VALUES ('360702', '360700', '章贡区', '江西省', '赣州市', '章贡区', '江西省赣州市章贡区', 0);
INSERT INTO `sys_area` VALUES ('360703', '360700', '南康区', '江西省', '赣州市', '南康区', '江西省赣州市南康区', 0);
INSERT INTO `sys_area` VALUES ('360721', '360700', '赣县', '江西省', '赣州市', '赣县', '江西省赣州市赣县', 0);
INSERT INTO `sys_area` VALUES ('360722', '360700', '信丰县', '江西省', '赣州市', '信丰县', '江西省赣州市信丰县', 0);
INSERT INTO `sys_area` VALUES ('360723', '360700', '大余县', '江西省', '赣州市', '大余县', '江西省赣州市大余县', 0);
INSERT INTO `sys_area` VALUES ('360724', '360700', '上犹县', '江西省', '赣州市', '上犹县', '江西省赣州市上犹县', 0);
INSERT INTO `sys_area` VALUES ('360725', '360700', '崇义县', '江西省', '赣州市', '崇义县', '江西省赣州市崇义县', 0);
INSERT INTO `sys_area` VALUES ('360726', '360700', '安远县', '江西省', '赣州市', '安远县', '江西省赣州市安远县', 0);
INSERT INTO `sys_area` VALUES ('360727', '360700', '龙南县', '江西省', '赣州市', '龙南县', '江西省赣州市龙南县', 0);
INSERT INTO `sys_area` VALUES ('360728', '360700', '定南县', '江西省', '赣州市', '定南县', '江西省赣州市定南县', 0);
INSERT INTO `sys_area` VALUES ('360729', '360700', '全南县', '江西省', '赣州市', '全南县', '江西省赣州市全南县', 0);
INSERT INTO `sys_area` VALUES ('360730', '360700', '宁都县', '江西省', '赣州市', '宁都县', '江西省赣州市宁都县', 0);
INSERT INTO `sys_area` VALUES ('360731', '360700', '于都县', '江西省', '赣州市', '于都县', '江西省赣州市于都县', 0);
INSERT INTO `sys_area` VALUES ('360732', '360700', '兴国县', '江西省', '赣州市', '兴国县', '江西省赣州市兴国县', 0);
INSERT INTO `sys_area` VALUES ('360733', '360700', '会昌县', '江西省', '赣州市', '会昌县', '江西省赣州市会昌县', 0);
INSERT INTO `sys_area` VALUES ('360734', '360700', '寻乌县', '江西省', '赣州市', '寻乌县', '江西省赣州市寻乌县', 0);
INSERT INTO `sys_area` VALUES ('360735', '360700', '石城县', '江西省', '赣州市', '石城县', '江西省赣州市石城县', 0);
INSERT INTO `sys_area` VALUES ('360781', '360700', '瑞金市', '江西省', '赣州市', '瑞金市', '江西省赣州市瑞金市', 0);
INSERT INTO `sys_area` VALUES ('360800', '360000', '吉安市', '江西省', '吉安市', '', '江西省吉安市', 0);
INSERT INTO `sys_area` VALUES ('360801', '360800', '市辖区', '江西省', '吉安市', '市辖区', '江西省吉安市市辖区', 0);
INSERT INTO `sys_area` VALUES ('360802', '360800', '吉州区', '江西省', '吉安市', '吉州区', '江西省吉安市吉州区', 0);
INSERT INTO `sys_area` VALUES ('360803', '360800', '青原区', '江西省', '吉安市', '青原区', '江西省吉安市青原区', 0);
INSERT INTO `sys_area` VALUES ('360821', '360800', '吉安县', '江西省', '吉安市', '吉安县', '江西省吉安市吉安县', 0);
INSERT INTO `sys_area` VALUES ('360822', '360800', '吉水县', '江西省', '吉安市', '吉水县', '江西省吉安市吉水县', 0);
INSERT INTO `sys_area` VALUES ('360823', '360800', '峡江县', '江西省', '吉安市', '峡江县', '江西省吉安市峡江县', 0);
INSERT INTO `sys_area` VALUES ('360824', '360800', '新干县', '江西省', '吉安市', '新干县', '江西省吉安市新干县', 0);
INSERT INTO `sys_area` VALUES ('360825', '360800', '永丰县', '江西省', '吉安市', '永丰县', '江西省吉安市永丰县', 0);
INSERT INTO `sys_area` VALUES ('360826', '360800', '泰和县', '江西省', '吉安市', '泰和县', '江西省吉安市泰和县', 0);
INSERT INTO `sys_area` VALUES ('360827', '360800', '遂川县', '江西省', '吉安市', '遂川县', '江西省吉安市遂川县', 0);
INSERT INTO `sys_area` VALUES ('360828', '360800', '万安县', '江西省', '吉安市', '万安县', '江西省吉安市万安县', 0);
INSERT INTO `sys_area` VALUES ('360829', '360800', '安福县', '江西省', '吉安市', '安福县', '江西省吉安市安福县', 0);
INSERT INTO `sys_area` VALUES ('360830', '360800', '永新县', '江西省', '吉安市', '永新县', '江西省吉安市永新县', 0);
INSERT INTO `sys_area` VALUES ('360881', '360800', '井冈山市', '江西省', '吉安市', '井冈山市', '江西省吉安市井冈山市', 0);
INSERT INTO `sys_area` VALUES ('360900', '360000', '宜春市', '江西省', '宜春市', '', '江西省宜春市', 0);
INSERT INTO `sys_area` VALUES ('360901', '360900', '市辖区', '江西省', '宜春市', '市辖区', '江西省宜春市市辖区', 0);
INSERT INTO `sys_area` VALUES ('360902', '360900', '袁州区', '江西省', '宜春市', '袁州区', '江西省宜春市袁州区', 0);
INSERT INTO `sys_area` VALUES ('360921', '360900', '奉新县', '江西省', '宜春市', '奉新县', '江西省宜春市奉新县', 0);
INSERT INTO `sys_area` VALUES ('360922', '360900', '万载县', '江西省', '宜春市', '万载县', '江西省宜春市万载县', 0);
INSERT INTO `sys_area` VALUES ('360923', '360900', '上高县', '江西省', '宜春市', '上高县', '江西省宜春市上高县', 0);
INSERT INTO `sys_area` VALUES ('360924', '360900', '宜丰县', '江西省', '宜春市', '宜丰县', '江西省宜春市宜丰县', 0);
INSERT INTO `sys_area` VALUES ('360925', '360900', '靖安县', '江西省', '宜春市', '靖安县', '江西省宜春市靖安县', 0);
INSERT INTO `sys_area` VALUES ('360926', '360900', '铜鼓县', '江西省', '宜春市', '铜鼓县', '江西省宜春市铜鼓县', 0);
INSERT INTO `sys_area` VALUES ('360981', '360900', '丰城市', '江西省', '宜春市', '丰城市', '江西省宜春市丰城市', 0);
INSERT INTO `sys_area` VALUES ('360982', '360900', '樟树市', '江西省', '宜春市', '樟树市', '江西省宜春市樟树市', 0);
INSERT INTO `sys_area` VALUES ('360983', '360900', '高安市', '江西省', '宜春市', '高安市', '江西省宜春市高安市', 0);
INSERT INTO `sys_area` VALUES ('361000', '360000', '抚州市', '江西省', '抚州市', '', '江西省抚州市', 0);
INSERT INTO `sys_area` VALUES ('361001', '361000', '市辖区', '江西省', '抚州市', '市辖区', '江西省抚州市市辖区', 0);
INSERT INTO `sys_area` VALUES ('361002', '361000', '临川区', '江西省', '抚州市', '临川区', '江西省抚州市临川区', 0);
INSERT INTO `sys_area` VALUES ('361021', '361000', '南城县', '江西省', '抚州市', '南城县', '江西省抚州市南城县', 0);
INSERT INTO `sys_area` VALUES ('361022', '361000', '黎川县', '江西省', '抚州市', '黎川县', '江西省抚州市黎川县', 0);
INSERT INTO `sys_area` VALUES ('361023', '361000', '南丰县', '江西省', '抚州市', '南丰县', '江西省抚州市南丰县', 0);
INSERT INTO `sys_area` VALUES ('361024', '361000', '崇仁县', '江西省', '抚州市', '崇仁县', '江西省抚州市崇仁县', 0);
INSERT INTO `sys_area` VALUES ('361025', '361000', '乐安县', '江西省', '抚州市', '乐安县', '江西省抚州市乐安县', 0);
INSERT INTO `sys_area` VALUES ('361026', '361000', '宜黄县', '江西省', '抚州市', '宜黄县', '江西省抚州市宜黄县', 0);
INSERT INTO `sys_area` VALUES ('361027', '361000', '金溪县', '江西省', '抚州市', '金溪县', '江西省抚州市金溪县', 0);
INSERT INTO `sys_area` VALUES ('361028', '361000', '资溪县', '江西省', '抚州市', '资溪县', '江西省抚州市资溪县', 0);
INSERT INTO `sys_area` VALUES ('361029', '361000', '东乡县', '江西省', '抚州市', '东乡县', '江西省抚州市东乡县', 0);
INSERT INTO `sys_area` VALUES ('361030', '361000', '广昌县', '江西省', '抚州市', '广昌县', '江西省抚州市广昌县', 0);
INSERT INTO `sys_area` VALUES ('361100', '360000', '上饶市', '江西省', '上饶市', '', '江西省上饶市', 0);
INSERT INTO `sys_area` VALUES ('361101', '361100', '市辖区', '江西省', '上饶市', '市辖区', '江西省上饶市市辖区', 0);
INSERT INTO `sys_area` VALUES ('361102', '361100', '信州区', '江西省', '上饶市', '信州区', '江西省上饶市信州区', 0);
INSERT INTO `sys_area` VALUES ('361103', '361100', '广丰区', '江西省', '上饶市', '广丰区', '江西省上饶市广丰区', 0);
INSERT INTO `sys_area` VALUES ('361121', '361100', '上饶县', '江西省', '上饶市', '上饶县', '江西省上饶市上饶县', 0);
INSERT INTO `sys_area` VALUES ('361123', '361100', '玉山县', '江西省', '上饶市', '玉山县', '江西省上饶市玉山县', 0);
INSERT INTO `sys_area` VALUES ('361124', '361100', '铅山县', '江西省', '上饶市', '铅山县', '江西省上饶市铅山县', 0);
INSERT INTO `sys_area` VALUES ('361125', '361100', '横峰县', '江西省', '上饶市', '横峰县', '江西省上饶市横峰县', 0);
INSERT INTO `sys_area` VALUES ('361126', '361100', '弋阳县', '江西省', '上饶市', '弋阳县', '江西省上饶市弋阳县', 0);
INSERT INTO `sys_area` VALUES ('361127', '361100', '余干县', '江西省', '上饶市', '余干县', '江西省上饶市余干县', 0);
INSERT INTO `sys_area` VALUES ('361128', '361100', '鄱阳县', '江西省', '上饶市', '鄱阳县', '江西省上饶市鄱阳县', 0);
INSERT INTO `sys_area` VALUES ('361129', '361100', '万年县', '江西省', '上饶市', '万年县', '江西省上饶市万年县', 0);
INSERT INTO `sys_area` VALUES ('361130', '361100', '婺源县', '江西省', '上饶市', '婺源县', '江西省上饶市婺源县', 0);
INSERT INTO `sys_area` VALUES ('361181', '361100', '德兴市', '江西省', '上饶市', '德兴市', '江西省上饶市德兴市', 0);
INSERT INTO `sys_area` VALUES ('370000', '86', '山东省', '山东省', '', '', '山东省', 0);
INSERT INTO `sys_area` VALUES ('370100', '370000', '济南市', '山东省', '济南市', '', '山东省济南市', 0);
INSERT INTO `sys_area` VALUES ('370101', '370100', '市辖区', '山东省', '济南市', '市辖区', '山东省济南市市辖区', 0);
INSERT INTO `sys_area` VALUES ('370102', '370100', '历下区', '山东省', '济南市', '历下区', '山东省济南市历下区', 0);
INSERT INTO `sys_area` VALUES ('370103', '370100', '市中区', '山东省', '济南市', '市中区', '山东省济南市市中区', 0);
INSERT INTO `sys_area` VALUES ('370104', '370100', '槐荫区', '山东省', '济南市', '槐荫区', '山东省济南市槐荫区', 0);
INSERT INTO `sys_area` VALUES ('370105', '370100', '天桥区', '山东省', '济南市', '天桥区', '山东省济南市天桥区', 0);
INSERT INTO `sys_area` VALUES ('370112', '370100', '历城区', '山东省', '济南市', '历城区', '山东省济南市历城区', 0);
INSERT INTO `sys_area` VALUES ('370113', '370100', '长清区', '山东省', '济南市', '长清区', '山东省济南市长清区', 0);
INSERT INTO `sys_area` VALUES ('370124', '370100', '平阴县', '山东省', '济南市', '平阴县', '山东省济南市平阴县', 0);
INSERT INTO `sys_area` VALUES ('370125', '370100', '济阳县', '山东省', '济南市', '济阳县', '山东省济南市济阳县', 0);
INSERT INTO `sys_area` VALUES ('370126', '370100', '商河县', '山东省', '济南市', '商河县', '山东省济南市商河县', 0);
INSERT INTO `sys_area` VALUES ('370181', '370100', '章丘市', '山东省', '济南市', '章丘市', '山东省济南市章丘市', 0);
INSERT INTO `sys_area` VALUES ('370200', '370000', '青岛市', '山东省', '青岛市', '', '山东省青岛市', 0);
INSERT INTO `sys_area` VALUES ('370201', '370200', '市辖区', '山东省', '青岛市', '市辖区', '山东省青岛市市辖区', 0);
INSERT INTO `sys_area` VALUES ('370202', '370200', '市南区', '山东省', '青岛市', '市南区', '山东省青岛市市南区', 0);
INSERT INTO `sys_area` VALUES ('370203', '370200', '市北区', '山东省', '青岛市', '市北区', '山东省青岛市市北区', 0);
INSERT INTO `sys_area` VALUES ('370211', '370200', '黄岛区', '山东省', '青岛市', '黄岛区', '山东省青岛市黄岛区', 0);
INSERT INTO `sys_area` VALUES ('370212', '370200', '崂山区', '山东省', '青岛市', '崂山区', '山东省青岛市崂山区', 0);
INSERT INTO `sys_area` VALUES ('370213', '370200', '李沧区', '山东省', '青岛市', '李沧区', '山东省青岛市李沧区', 0);
INSERT INTO `sys_area` VALUES ('370214', '370200', '城阳区', '山东省', '青岛市', '城阳区', '山东省青岛市城阳区', 0);
INSERT INTO `sys_area` VALUES ('370281', '370200', '胶州市', '山东省', '青岛市', '胶州市', '山东省青岛市胶州市', 0);
INSERT INTO `sys_area` VALUES ('370282', '370200', '即墨市', '山东省', '青岛市', '即墨市', '山东省青岛市即墨市', 0);
INSERT INTO `sys_area` VALUES ('370283', '370200', '平度市', '山东省', '青岛市', '平度市', '山东省青岛市平度市', 0);
INSERT INTO `sys_area` VALUES ('370285', '370200', '莱西市', '山东省', '青岛市', '莱西市', '山东省青岛市莱西市', 0);
INSERT INTO `sys_area` VALUES ('370300', '370000', '淄博市', '山东省', '淄博市', '', '山东省淄博市', 0);
INSERT INTO `sys_area` VALUES ('370301', '370300', '市辖区', '山东省', '淄博市', '市辖区', '山东省淄博市市辖区', 0);
INSERT INTO `sys_area` VALUES ('370302', '370300', '淄川区', '山东省', '淄博市', '淄川区', '山东省淄博市淄川区', 0);
INSERT INTO `sys_area` VALUES ('370303', '370300', '张店区', '山东省', '淄博市', '张店区', '山东省淄博市张店区', 0);
INSERT INTO `sys_area` VALUES ('370304', '370300', '博山区', '山东省', '淄博市', '博山区', '山东省淄博市博山区', 0);
INSERT INTO `sys_area` VALUES ('370305', '370300', '临淄区', '山东省', '淄博市', '临淄区', '山东省淄博市临淄区', 0);
INSERT INTO `sys_area` VALUES ('370306', '370300', '周村区', '山东省', '淄博市', '周村区', '山东省淄博市周村区', 0);
INSERT INTO `sys_area` VALUES ('370321', '370300', '桓台县', '山东省', '淄博市', '桓台县', '山东省淄博市桓台县', 0);
INSERT INTO `sys_area` VALUES ('370322', '370300', '高青县', '山东省', '淄博市', '高青县', '山东省淄博市高青县', 0);
INSERT INTO `sys_area` VALUES ('370323', '370300', '沂源县', '山东省', '淄博市', '沂源县', '山东省淄博市沂源县', 0);
INSERT INTO `sys_area` VALUES ('370400', '370000', '枣庄市', '山东省', '枣庄市', '', '山东省枣庄市', 0);
INSERT INTO `sys_area` VALUES ('370401', '370400', '市辖区', '山东省', '枣庄市', '市辖区', '山东省枣庄市市辖区', 0);
INSERT INTO `sys_area` VALUES ('370402', '370400', '市中区', '山东省', '枣庄市', '市中区', '山东省枣庄市市中区', 0);
INSERT INTO `sys_area` VALUES ('370403', '370400', '薛城区', '山东省', '枣庄市', '薛城区', '山东省枣庄市薛城区', 0);
INSERT INTO `sys_area` VALUES ('370404', '370400', '峄城区', '山东省', '枣庄市', '峄城区', '山东省枣庄市峄城区', 0);
INSERT INTO `sys_area` VALUES ('370405', '370400', '台儿庄区', '山东省', '枣庄市', '台儿庄区', '山东省枣庄市台儿庄区', 0);
INSERT INTO `sys_area` VALUES ('370406', '370400', '山亭区', '山东省', '枣庄市', '山亭区', '山东省枣庄市山亭区', 0);
INSERT INTO `sys_area` VALUES ('370481', '370400', '滕州市', '山东省', '枣庄市', '滕州市', '山东省枣庄市滕州市', 0);
INSERT INTO `sys_area` VALUES ('370500', '370000', '东营市', '山东省', '东营市', '', '山东省东营市', 0);
INSERT INTO `sys_area` VALUES ('370501', '370500', '市辖区', '山东省', '东营市', '市辖区', '山东省东营市市辖区', 0);
INSERT INTO `sys_area` VALUES ('370502', '370500', '东营区', '山东省', '东营市', '东营区', '山东省东营市东营区', 0);
INSERT INTO `sys_area` VALUES ('370503', '370500', '河口区', '山东省', '东营市', '河口区', '山东省东营市河口区', 0);
INSERT INTO `sys_area` VALUES ('370505', '370500', '垦利区', '山东省', '东营市', '垦利区', '山东省东营市垦利区', 0);
INSERT INTO `sys_area` VALUES ('370522', '370500', '利津县', '山东省', '东营市', '利津县', '山东省东营市利津县', 0);
INSERT INTO `sys_area` VALUES ('370523', '370500', '广饶县', '山东省', '东营市', '广饶县', '山东省东营市广饶县', 0);
INSERT INTO `sys_area` VALUES ('370600', '370000', '烟台市', '山东省', '烟台市', '', '山东省烟台市', 0);
INSERT INTO `sys_area` VALUES ('370601', '370600', '市辖区', '山东省', '烟台市', '市辖区', '山东省烟台市市辖区', 0);
INSERT INTO `sys_area` VALUES ('370602', '370600', '芝罘区', '山东省', '烟台市', '芝罘区', '山东省烟台市芝罘区', 0);
INSERT INTO `sys_area` VALUES ('370611', '370600', '福山区', '山东省', '烟台市', '福山区', '山东省烟台市福山区', 0);
INSERT INTO `sys_area` VALUES ('370612', '370600', '牟平区', '山东省', '烟台市', '牟平区', '山东省烟台市牟平区', 0);
INSERT INTO `sys_area` VALUES ('370613', '370600', '莱山区', '山东省', '烟台市', '莱山区', '山东省烟台市莱山区', 0);
INSERT INTO `sys_area` VALUES ('370634', '370600', '长岛县', '山东省', '烟台市', '长岛县', '山东省烟台市长岛县', 0);
INSERT INTO `sys_area` VALUES ('370681', '370600', '龙口市', '山东省', '烟台市', '龙口市', '山东省烟台市龙口市', 0);
INSERT INTO `sys_area` VALUES ('370682', '370600', '莱阳市', '山东省', '烟台市', '莱阳市', '山东省烟台市莱阳市', 0);
INSERT INTO `sys_area` VALUES ('370683', '370600', '莱州市', '山东省', '烟台市', '莱州市', '山东省烟台市莱州市', 0);
INSERT INTO `sys_area` VALUES ('370684', '370600', '蓬莱市', '山东省', '烟台市', '蓬莱市', '山东省烟台市蓬莱市', 0);
INSERT INTO `sys_area` VALUES ('370685', '370600', '招远市', '山东省', '烟台市', '招远市', '山东省烟台市招远市', 0);
INSERT INTO `sys_area` VALUES ('370686', '370600', '栖霞市', '山东省', '烟台市', '栖霞市', '山东省烟台市栖霞市', 0);
INSERT INTO `sys_area` VALUES ('370687', '370600', '海阳市', '山东省', '烟台市', '海阳市', '山东省烟台市海阳市', 0);
INSERT INTO `sys_area` VALUES ('370700', '370000', '潍坊市', '山东省', '潍坊市', '', '山东省潍坊市', 0);
INSERT INTO `sys_area` VALUES ('370701', '370700', '市辖区', '山东省', '潍坊市', '市辖区', '山东省潍坊市市辖区', 0);
INSERT INTO `sys_area` VALUES ('370702', '370700', '潍城区', '山东省', '潍坊市', '潍城区', '山东省潍坊市潍城区', 0);
INSERT INTO `sys_area` VALUES ('370703', '370700', '寒亭区', '山东省', '潍坊市', '寒亭区', '山东省潍坊市寒亭区', 0);
INSERT INTO `sys_area` VALUES ('370704', '370700', '坊子区', '山东省', '潍坊市', '坊子区', '山东省潍坊市坊子区', 0);
INSERT INTO `sys_area` VALUES ('370705', '370700', '奎文区', '山东省', '潍坊市', '奎文区', '山东省潍坊市奎文区', 0);
INSERT INTO `sys_area` VALUES ('370724', '370700', '临朐县', '山东省', '潍坊市', '临朐县', '山东省潍坊市临朐县', 0);
INSERT INTO `sys_area` VALUES ('370725', '370700', '昌乐县', '山东省', '潍坊市', '昌乐县', '山东省潍坊市昌乐县', 0);
INSERT INTO `sys_area` VALUES ('370781', '370700', '青州市', '山东省', '潍坊市', '青州市', '山东省潍坊市青州市', 0);
INSERT INTO `sys_area` VALUES ('370782', '370700', '诸城市', '山东省', '潍坊市', '诸城市', '山东省潍坊市诸城市', 0);
INSERT INTO `sys_area` VALUES ('370783', '370700', '寿光市', '山东省', '潍坊市', '寿光市', '山东省潍坊市寿光市', 0);
INSERT INTO `sys_area` VALUES ('370784', '370700', '安丘市', '山东省', '潍坊市', '安丘市', '山东省潍坊市安丘市', 0);
INSERT INTO `sys_area` VALUES ('370785', '370700', '高密市', '山东省', '潍坊市', '高密市', '山东省潍坊市高密市', 0);
INSERT INTO `sys_area` VALUES ('370786', '370700', '昌邑市', '山东省', '潍坊市', '昌邑市', '山东省潍坊市昌邑市', 0);
INSERT INTO `sys_area` VALUES ('370800', '370000', '济宁市', '山东省', '济宁市', '', '山东省济宁市', 0);
INSERT INTO `sys_area` VALUES ('370801', '370800', '市辖区', '山东省', '济宁市', '市辖区', '山东省济宁市市辖区', 0);
INSERT INTO `sys_area` VALUES ('370811', '370800', '任城区', '山东省', '济宁市', '任城区', '山东省济宁市任城区', 0);
INSERT INTO `sys_area` VALUES ('370812', '370800', '兖州区', '山东省', '济宁市', '兖州区', '山东省济宁市兖州区', 0);
INSERT INTO `sys_area` VALUES ('370826', '370800', '微山县', '山东省', '济宁市', '微山县', '山东省济宁市微山县', 0);
INSERT INTO `sys_area` VALUES ('370827', '370800', '鱼台县', '山东省', '济宁市', '鱼台县', '山东省济宁市鱼台县', 0);
INSERT INTO `sys_area` VALUES ('370828', '370800', '金乡县', '山东省', '济宁市', '金乡县', '山东省济宁市金乡县', 0);
INSERT INTO `sys_area` VALUES ('370829', '370800', '嘉祥县', '山东省', '济宁市', '嘉祥县', '山东省济宁市嘉祥县', 0);
INSERT INTO `sys_area` VALUES ('370830', '370800', '汶上县', '山东省', '济宁市', '汶上县', '山东省济宁市汶上县', 0);
INSERT INTO `sys_area` VALUES ('370831', '370800', '泗水县', '山东省', '济宁市', '泗水县', '山东省济宁市泗水县', 0);
INSERT INTO `sys_area` VALUES ('370832', '370800', '梁山县', '山东省', '济宁市', '梁山县', '山东省济宁市梁山县', 0);
INSERT INTO `sys_area` VALUES ('370881', '370800', '曲阜市', '山东省', '济宁市', '曲阜市', '山东省济宁市曲阜市', 0);
INSERT INTO `sys_area` VALUES ('370883', '370800', '邹城市', '山东省', '济宁市', '邹城市', '山东省济宁市邹城市', 0);
INSERT INTO `sys_area` VALUES ('370900', '370000', '泰安市', '山东省', '泰安市', '', '山东省泰安市', 0);
INSERT INTO `sys_area` VALUES ('370901', '370900', '市辖区', '山东省', '泰安市', '市辖区', '山东省泰安市市辖区', 0);
INSERT INTO `sys_area` VALUES ('370902', '370900', '泰山区', '山东省', '泰安市', '泰山区', '山东省泰安市泰山区', 0);
INSERT INTO `sys_area` VALUES ('370911', '370900', '岱岳区', '山东省', '泰安市', '岱岳区', '山东省泰安市岱岳区', 0);
INSERT INTO `sys_area` VALUES ('370921', '370900', '宁阳县', '山东省', '泰安市', '宁阳县', '山东省泰安市宁阳县', 0);
INSERT INTO `sys_area` VALUES ('370923', '370900', '东平县', '山东省', '泰安市', '东平县', '山东省泰安市东平县', 0);
INSERT INTO `sys_area` VALUES ('370982', '370900', '新泰市', '山东省', '泰安市', '新泰市', '山东省泰安市新泰市', 0);
INSERT INTO `sys_area` VALUES ('370983', '370900', '肥城市', '山东省', '泰安市', '肥城市', '山东省泰安市肥城市', 0);
INSERT INTO `sys_area` VALUES ('371000', '370000', '威海市', '山东省', '威海市', '', '山东省威海市', 0);
INSERT INTO `sys_area` VALUES ('371001', '371000', '市辖区', '山东省', '威海市', '市辖区', '山东省威海市市辖区', 0);
INSERT INTO `sys_area` VALUES ('371002', '371000', '环翠区', '山东省', '威海市', '环翠区', '山东省威海市环翠区', 0);
INSERT INTO `sys_area` VALUES ('371003', '371000', '文登区', '山东省', '威海市', '文登区', '山东省威海市文登区', 0);
INSERT INTO `sys_area` VALUES ('371082', '371000', '荣成市', '山东省', '威海市', '荣成市', '山东省威海市荣成市', 0);
INSERT INTO `sys_area` VALUES ('371083', '371000', '乳山市', '山东省', '威海市', '乳山市', '山东省威海市乳山市', 0);
INSERT INTO `sys_area` VALUES ('371100', '370000', '日照市', '山东省', '日照市', '', '山东省日照市', 0);
INSERT INTO `sys_area` VALUES ('371101', '371100', '市辖区', '山东省', '日照市', '市辖区', '山东省日照市市辖区', 0);
INSERT INTO `sys_area` VALUES ('371102', '371100', '东港区', '山东省', '日照市', '东港区', '山东省日照市东港区', 0);
INSERT INTO `sys_area` VALUES ('371103', '371100', '岚山区', '山东省', '日照市', '岚山区', '山东省日照市岚山区', 0);
INSERT INTO `sys_area` VALUES ('371121', '371100', '五莲县', '山东省', '日照市', '五莲县', '山东省日照市五莲县', 0);
INSERT INTO `sys_area` VALUES ('371122', '371100', '莒县', '山东省', '日照市', '莒县', '山东省日照市莒县', 0);
INSERT INTO `sys_area` VALUES ('371200', '370000', '莱芜市', '山东省', '莱芜市', '', '山东省莱芜市', 0);
INSERT INTO `sys_area` VALUES ('371201', '371200', '市辖区', '山东省', '莱芜市', '市辖区', '山东省莱芜市市辖区', 0);
INSERT INTO `sys_area` VALUES ('371202', '371200', '莱城区', '山东省', '莱芜市', '莱城区', '山东省莱芜市莱城区', 0);
INSERT INTO `sys_area` VALUES ('371203', '371200', '钢城区', '山东省', '莱芜市', '钢城区', '山东省莱芜市钢城区', 0);
INSERT INTO `sys_area` VALUES ('371300', '370000', '临沂市', '山东省', '临沂市', '', '山东省临沂市', 0);
INSERT INTO `sys_area` VALUES ('371301', '371300', '市辖区', '山东省', '临沂市', '市辖区', '山东省临沂市市辖区', 0);
INSERT INTO `sys_area` VALUES ('371302', '371300', '兰山区', '山东省', '临沂市', '兰山区', '山东省临沂市兰山区', 0);
INSERT INTO `sys_area` VALUES ('371311', '371300', '罗庄区', '山东省', '临沂市', '罗庄区', '山东省临沂市罗庄区', 0);
INSERT INTO `sys_area` VALUES ('371312', '371300', '河东区', '山东省', '临沂市', '河东区', '山东省临沂市河东区', 0);
INSERT INTO `sys_area` VALUES ('371321', '371300', '沂南县', '山东省', '临沂市', '沂南县', '山东省临沂市沂南县', 0);
INSERT INTO `sys_area` VALUES ('371322', '371300', '郯城县', '山东省', '临沂市', '郯城县', '山东省临沂市郯城县', 0);
INSERT INTO `sys_area` VALUES ('371323', '371300', '沂水县', '山东省', '临沂市', '沂水县', '山东省临沂市沂水县', 0);
INSERT INTO `sys_area` VALUES ('371324', '371300', '兰陵县', '山东省', '临沂市', '兰陵县', '山东省临沂市兰陵县', 0);
INSERT INTO `sys_area` VALUES ('371325', '371300', '费县', '山东省', '临沂市', '费县', '山东省临沂市费县', 0);
INSERT INTO `sys_area` VALUES ('371326', '371300', '平邑县', '山东省', '临沂市', '平邑县', '山东省临沂市平邑县', 0);
INSERT INTO `sys_area` VALUES ('371327', '371300', '莒南县', '山东省', '临沂市', '莒南县', '山东省临沂市莒南县', 0);
INSERT INTO `sys_area` VALUES ('371328', '371300', '蒙阴县', '山东省', '临沂市', '蒙阴县', '山东省临沂市蒙阴县', 0);
INSERT INTO `sys_area` VALUES ('371329', '371300', '临沭县', '山东省', '临沂市', '临沭县', '山东省临沂市临沭县', 0);
INSERT INTO `sys_area` VALUES ('371400', '370000', '德州市', '山东省', '德州市', '', '山东省德州市', 0);
INSERT INTO `sys_area` VALUES ('371401', '371400', '市辖区', '山东省', '德州市', '市辖区', '山东省德州市市辖区', 0);
INSERT INTO `sys_area` VALUES ('371402', '371400', '德城区', '山东省', '德州市', '德城区', '山东省德州市德城区', 0);
INSERT INTO `sys_area` VALUES ('371403', '371400', '陵城区', '山东省', '德州市', '陵城区', '山东省德州市陵城区', 0);
INSERT INTO `sys_area` VALUES ('371422', '371400', '宁津县', '山东省', '德州市', '宁津县', '山东省德州市宁津县', 0);
INSERT INTO `sys_area` VALUES ('371423', '371400', '庆云县', '山东省', '德州市', '庆云县', '山东省德州市庆云县', 0);
INSERT INTO `sys_area` VALUES ('371424', '371400', '临邑县', '山东省', '德州市', '临邑县', '山东省德州市临邑县', 0);
INSERT INTO `sys_area` VALUES ('371425', '371400', '齐河县', '山东省', '德州市', '齐河县', '山东省德州市齐河县', 0);
INSERT INTO `sys_area` VALUES ('371426', '371400', '平原县', '山东省', '德州市', '平原县', '山东省德州市平原县', 0);
INSERT INTO `sys_area` VALUES ('371427', '371400', '夏津县', '山东省', '德州市', '夏津县', '山东省德州市夏津县', 0);
INSERT INTO `sys_area` VALUES ('371428', '371400', '武城县', '山东省', '德州市', '武城县', '山东省德州市武城县', 0);
INSERT INTO `sys_area` VALUES ('371481', '371400', '乐陵市', '山东省', '德州市', '乐陵市', '山东省德州市乐陵市', 0);
INSERT INTO `sys_area` VALUES ('371482', '371400', '禹城市', '山东省', '德州市', '禹城市', '山东省德州市禹城市', 0);
INSERT INTO `sys_area` VALUES ('371500', '370000', '聊城市', '山东省', '聊城市', '', '山东省聊城市', 0);
INSERT INTO `sys_area` VALUES ('371501', '371500', '市辖区', '山东省', '聊城市', '市辖区', '山东省聊城市市辖区', 0);
INSERT INTO `sys_area` VALUES ('371502', '371500', '东昌府区', '山东省', '聊城市', '东昌府区', '山东省聊城市东昌府区', 0);
INSERT INTO `sys_area` VALUES ('371521', '371500', '阳谷县', '山东省', '聊城市', '阳谷县', '山东省聊城市阳谷县', 0);
INSERT INTO `sys_area` VALUES ('371522', '371500', '莘县', '山东省', '聊城市', '莘县', '山东省聊城市莘县', 0);
INSERT INTO `sys_area` VALUES ('371523', '371500', '茌平县', '山东省', '聊城市', '茌平县', '山东省聊城市茌平县', 0);
INSERT INTO `sys_area` VALUES ('371524', '371500', '东阿县', '山东省', '聊城市', '东阿县', '山东省聊城市东阿县', 0);
INSERT INTO `sys_area` VALUES ('371525', '371500', '冠县', '山东省', '聊城市', '冠县', '山东省聊城市冠县', 0);
INSERT INTO `sys_area` VALUES ('371526', '371500', '高唐县', '山东省', '聊城市', '高唐县', '山东省聊城市高唐县', 0);
INSERT INTO `sys_area` VALUES ('371581', '371500', '临清市', '山东省', '聊城市', '临清市', '山东省聊城市临清市', 0);
INSERT INTO `sys_area` VALUES ('371600', '370000', '滨州市', '山东省', '滨州市', '', '山东省滨州市', 0);
INSERT INTO `sys_area` VALUES ('371601', '371600', '市辖区', '山东省', '滨州市', '市辖区', '山东省滨州市市辖区', 0);
INSERT INTO `sys_area` VALUES ('371602', '371600', '滨城区', '山东省', '滨州市', '滨城区', '山东省滨州市滨城区', 0);
INSERT INTO `sys_area` VALUES ('371603', '371600', '沾化区', '山东省', '滨州市', '沾化区', '山东省滨州市沾化区', 0);
INSERT INTO `sys_area` VALUES ('371621', '371600', '惠民县', '山东省', '滨州市', '惠民县', '山东省滨州市惠民县', 0);
INSERT INTO `sys_area` VALUES ('371622', '371600', '阳信县', '山东省', '滨州市', '阳信县', '山东省滨州市阳信县', 0);
INSERT INTO `sys_area` VALUES ('371623', '371600', '无棣县', '山东省', '滨州市', '无棣县', '山东省滨州市无棣县', 0);
INSERT INTO `sys_area` VALUES ('371625', '371600', '博兴县', '山东省', '滨州市', '博兴县', '山东省滨州市博兴县', 0);
INSERT INTO `sys_area` VALUES ('371626', '371600', '邹平县', '山东省', '滨州市', '邹平县', '山东省滨州市邹平县', 0);
INSERT INTO `sys_area` VALUES ('371700', '370000', '菏泽市', '山东省', '菏泽市', '', '山东省菏泽市', 0);
INSERT INTO `sys_area` VALUES ('371701', '371700', '市辖区', '山东省', '菏泽市', '市辖区', '山东省菏泽市市辖区', 0);
INSERT INTO `sys_area` VALUES ('371702', '371700', '牡丹区', '山东省', '菏泽市', '牡丹区', '山东省菏泽市牡丹区', 0);
INSERT INTO `sys_area` VALUES ('371703', '371700', '定陶区', '山东省', '菏泽市', '定陶区', '山东省菏泽市定陶区', 0);
INSERT INTO `sys_area` VALUES ('371721', '371700', '曹县', '山东省', '菏泽市', '曹县', '山东省菏泽市曹县', 0);
INSERT INTO `sys_area` VALUES ('371722', '371700', '单县', '山东省', '菏泽市', '单县', '山东省菏泽市单县', 0);
INSERT INTO `sys_area` VALUES ('371723', '371700', '成武县', '山东省', '菏泽市', '成武县', '山东省菏泽市成武县', 0);
INSERT INTO `sys_area` VALUES ('371724', '371700', '巨野县', '山东省', '菏泽市', '巨野县', '山东省菏泽市巨野县', 0);
INSERT INTO `sys_area` VALUES ('371725', '371700', '郓城县', '山东省', '菏泽市', '郓城县', '山东省菏泽市郓城县', 0);
INSERT INTO `sys_area` VALUES ('371726', '371700', '鄄城县', '山东省', '菏泽市', '鄄城县', '山东省菏泽市鄄城县', 0);
INSERT INTO `sys_area` VALUES ('371728', '371700', '东明县', '山东省', '菏泽市', '东明县', '山东省菏泽市东明县', 0);
INSERT INTO `sys_area` VALUES ('410000', '86', '河南省', '河南省', '', '', '河南省', 0);
INSERT INTO `sys_area` VALUES ('410100', '410000', '郑州市', '河南省', '郑州市', '', '河南省郑州市', 0);
INSERT INTO `sys_area` VALUES ('410101', '410100', '市辖区', '河南省', '郑州市', '市辖区', '河南省郑州市市辖区', 0);
INSERT INTO `sys_area` VALUES ('410102', '410100', '中原区', '河南省', '郑州市', '中原区', '河南省郑州市中原区', 0);
INSERT INTO `sys_area` VALUES ('410103', '410100', '二七区', '河南省', '郑州市', '二七区', '河南省郑州市二七区', 0);
INSERT INTO `sys_area` VALUES ('410104', '410100', '管城回族区', '河南省', '郑州市', '管城回族区', '河南省郑州市管城回族区', 0);
INSERT INTO `sys_area` VALUES ('410105', '410100', '金水区', '河南省', '郑州市', '金水区', '河南省郑州市金水区', 0);
INSERT INTO `sys_area` VALUES ('410106', '410100', '上街区', '河南省', '郑州市', '上街区', '河南省郑州市上街区', 0);
INSERT INTO `sys_area` VALUES ('410108', '410100', '惠济区', '河南省', '郑州市', '惠济区', '河南省郑州市惠济区', 0);
INSERT INTO `sys_area` VALUES ('410122', '410100', '中牟县', '河南省', '郑州市', '中牟县', '河南省郑州市中牟县', 0);
INSERT INTO `sys_area` VALUES ('410181', '410100', '巩义市', '河南省', '郑州市', '巩义市', '河南省郑州市巩义市', 0);
INSERT INTO `sys_area` VALUES ('410182', '410100', '荥阳市', '河南省', '郑州市', '荥阳市', '河南省郑州市荥阳市', 0);
INSERT INTO `sys_area` VALUES ('410183', '410100', '新密市', '河南省', '郑州市', '新密市', '河南省郑州市新密市', 0);
INSERT INTO `sys_area` VALUES ('410184', '410100', '新郑市', '河南省', '郑州市', '新郑市', '河南省郑州市新郑市', 0);
INSERT INTO `sys_area` VALUES ('410185', '410100', '登封市', '河南省', '郑州市', '登封市', '河南省郑州市登封市', 0);
INSERT INTO `sys_area` VALUES ('410200', '410000', '开封市', '河南省', '开封市', '', '河南省开封市', 0);
INSERT INTO `sys_area` VALUES ('410201', '410200', '市辖区', '河南省', '开封市', '市辖区', '河南省开封市市辖区', 0);
INSERT INTO `sys_area` VALUES ('410202', '410200', '龙亭区', '河南省', '开封市', '龙亭区', '河南省开封市龙亭区', 0);
INSERT INTO `sys_area` VALUES ('410203', '410200', '顺河回族区', '河南省', '开封市', '顺河回族区', '河南省开封市顺河回族区', 0);
INSERT INTO `sys_area` VALUES ('410204', '410200', '鼓楼区', '河南省', '开封市', '鼓楼区', '河南省开封市鼓楼区', 0);
INSERT INTO `sys_area` VALUES ('410205', '410200', '禹王台区', '河南省', '开封市', '禹王台区', '河南省开封市禹王台区', 0);
INSERT INTO `sys_area` VALUES ('410211', '410200', '金明区', '河南省', '开封市', '金明区', '河南省开封市金明区', 0);
INSERT INTO `sys_area` VALUES ('410212', '410200', '祥符区', '河南省', '开封市', '祥符区', '河南省开封市祥符区', 0);
INSERT INTO `sys_area` VALUES ('410221', '410200', '杞县', '河南省', '开封市', '杞县', '河南省开封市杞县', 0);
INSERT INTO `sys_area` VALUES ('410222', '410200', '通许县', '河南省', '开封市', '通许县', '河南省开封市通许县', 0);
INSERT INTO `sys_area` VALUES ('410223', '410200', '尉氏县', '河南省', '开封市', '尉氏县', '河南省开封市尉氏县', 0);
INSERT INTO `sys_area` VALUES ('410225', '410200', '兰考县', '河南省', '开封市', '兰考县', '河南省开封市兰考县', 0);
INSERT INTO `sys_area` VALUES ('410300', '410000', '洛阳市', '河南省', '洛阳市', '', '河南省洛阳市', 0);
INSERT INTO `sys_area` VALUES ('410301', '410300', '市辖区', '河南省', '洛阳市', '市辖区', '河南省洛阳市市辖区', 0);
INSERT INTO `sys_area` VALUES ('410302', '410300', '老城区', '河南省', '洛阳市', '老城区', '河南省洛阳市老城区', 0);
INSERT INTO `sys_area` VALUES ('410303', '410300', '西工区', '河南省', '洛阳市', '西工区', '河南省洛阳市西工区', 0);
INSERT INTO `sys_area` VALUES ('410304', '410300', '瀍河回族区', '河南省', '洛阳市', '瀍河回族区', '河南省洛阳市瀍河回族区', 0);
INSERT INTO `sys_area` VALUES ('410305', '410300', '涧西区', '河南省', '洛阳市', '涧西区', '河南省洛阳市涧西区', 0);
INSERT INTO `sys_area` VALUES ('410306', '410300', '吉利区', '河南省', '洛阳市', '吉利区', '河南省洛阳市吉利区', 0);
INSERT INTO `sys_area` VALUES ('410311', '410300', '洛龙区', '河南省', '洛阳市', '洛龙区', '河南省洛阳市洛龙区', 0);
INSERT INTO `sys_area` VALUES ('410322', '410300', '孟津县', '河南省', '洛阳市', '孟津县', '河南省洛阳市孟津县', 0);
INSERT INTO `sys_area` VALUES ('410323', '410300', '新安县', '河南省', '洛阳市', '新安县', '河南省洛阳市新安县', 0);
INSERT INTO `sys_area` VALUES ('410324', '410300', '栾川县', '河南省', '洛阳市', '栾川县', '河南省洛阳市栾川县', 0);
INSERT INTO `sys_area` VALUES ('410325', '410300', '嵩县', '河南省', '洛阳市', '嵩县', '河南省洛阳市嵩县', 0);
INSERT INTO `sys_area` VALUES ('410326', '410300', '汝阳县', '河南省', '洛阳市', '汝阳县', '河南省洛阳市汝阳县', 0);
INSERT INTO `sys_area` VALUES ('410327', '410300', '宜阳县', '河南省', '洛阳市', '宜阳县', '河南省洛阳市宜阳县', 0);
INSERT INTO `sys_area` VALUES ('410328', '410300', '洛宁县', '河南省', '洛阳市', '洛宁县', '河南省洛阳市洛宁县', 0);
INSERT INTO `sys_area` VALUES ('410329', '410300', '伊川县', '河南省', '洛阳市', '伊川县', '河南省洛阳市伊川县', 0);
INSERT INTO `sys_area` VALUES ('410381', '410300', '偃师市', '河南省', '洛阳市', '偃师市', '河南省洛阳市偃师市', 0);
INSERT INTO `sys_area` VALUES ('410400', '410000', '平顶山市', '河南省', '平顶山市', '', '河南省平顶山市', 0);
INSERT INTO `sys_area` VALUES ('410401', '410400', '市辖区', '河南省', '平顶山市', '市辖区', '河南省平顶山市市辖区', 0);
INSERT INTO `sys_area` VALUES ('410402', '410400', '新华区', '河南省', '平顶山市', '新华区', '河南省平顶山市新华区', 0);
INSERT INTO `sys_area` VALUES ('410403', '410400', '卫东区', '河南省', '平顶山市', '卫东区', '河南省平顶山市卫东区', 0);
INSERT INTO `sys_area` VALUES ('410404', '410400', '石龙区', '河南省', '平顶山市', '石龙区', '河南省平顶山市石龙区', 0);
INSERT INTO `sys_area` VALUES ('410411', '410400', '湛河区', '河南省', '平顶山市', '湛河区', '河南省平顶山市湛河区', 0);
INSERT INTO `sys_area` VALUES ('410421', '410400', '宝丰县', '河南省', '平顶山市', '宝丰县', '河南省平顶山市宝丰县', 0);
INSERT INTO `sys_area` VALUES ('410422', '410400', '叶县', '河南省', '平顶山市', '叶县', '河南省平顶山市叶县', 0);
INSERT INTO `sys_area` VALUES ('410423', '410400', '鲁山县', '河南省', '平顶山市', '鲁山县', '河南省平顶山市鲁山县', 0);
INSERT INTO `sys_area` VALUES ('410425', '410400', '郏县', '河南省', '平顶山市', '郏县', '河南省平顶山市郏县', 0);
INSERT INTO `sys_area` VALUES ('410481', '410400', '舞钢市', '河南省', '平顶山市', '舞钢市', '河南省平顶山市舞钢市', 0);
INSERT INTO `sys_area` VALUES ('410482', '410400', '汝州市', '河南省', '平顶山市', '汝州市', '河南省平顶山市汝州市', 0);
INSERT INTO `sys_area` VALUES ('410500', '410000', '安阳市', '河南省', '安阳市', '', '河南省安阳市', 0);
INSERT INTO `sys_area` VALUES ('410501', '410500', '市辖区', '河南省', '安阳市', '市辖区', '河南省安阳市市辖区', 0);
INSERT INTO `sys_area` VALUES ('410502', '410500', '文峰区', '河南省', '安阳市', '文峰区', '河南省安阳市文峰区', 0);
INSERT INTO `sys_area` VALUES ('410503', '410500', '北关区', '河南省', '安阳市', '北关区', '河南省安阳市北关区', 0);
INSERT INTO `sys_area` VALUES ('410505', '410500', '殷都区', '河南省', '安阳市', '殷都区', '河南省安阳市殷都区', 0);
INSERT INTO `sys_area` VALUES ('410506', '410500', '龙安区', '河南省', '安阳市', '龙安区', '河南省安阳市龙安区', 0);
INSERT INTO `sys_area` VALUES ('410522', '410500', '安阳县', '河南省', '安阳市', '安阳县', '河南省安阳市安阳县', 0);
INSERT INTO `sys_area` VALUES ('410523', '410500', '汤阴县', '河南省', '安阳市', '汤阴县', '河南省安阳市汤阴县', 0);
INSERT INTO `sys_area` VALUES ('410526', '410500', '滑县', '河南省', '安阳市', '滑县', '河南省安阳市滑县', 0);
INSERT INTO `sys_area` VALUES ('410527', '410500', '内黄县', '河南省', '安阳市', '内黄县', '河南省安阳市内黄县', 0);
INSERT INTO `sys_area` VALUES ('410581', '410500', '林州市', '河南省', '安阳市', '林州市', '河南省安阳市林州市', 0);
INSERT INTO `sys_area` VALUES ('410600', '410000', '鹤壁市', '河南省', '鹤壁市', '', '河南省鹤壁市', 0);
INSERT INTO `sys_area` VALUES ('410601', '410600', '市辖区', '河南省', '鹤壁市', '市辖区', '河南省鹤壁市市辖区', 0);
INSERT INTO `sys_area` VALUES ('410602', '410600', '鹤山区', '河南省', '鹤壁市', '鹤山区', '河南省鹤壁市鹤山区', 0);
INSERT INTO `sys_area` VALUES ('410603', '410600', '山城区', '河南省', '鹤壁市', '山城区', '河南省鹤壁市山城区', 0);
INSERT INTO `sys_area` VALUES ('410611', '410600', '淇滨区', '河南省', '鹤壁市', '淇滨区', '河南省鹤壁市淇滨区', 0);
INSERT INTO `sys_area` VALUES ('410621', '410600', '浚县', '河南省', '鹤壁市', '浚县', '河南省鹤壁市浚县', 0);
INSERT INTO `sys_area` VALUES ('410622', '410600', '淇县', '河南省', '鹤壁市', '淇县', '河南省鹤壁市淇县', 0);
INSERT INTO `sys_area` VALUES ('410700', '410000', '新乡市', '河南省', '新乡市', '', '河南省新乡市', 0);
INSERT INTO `sys_area` VALUES ('410701', '410700', '市辖区', '河南省', '新乡市', '市辖区', '河南省新乡市市辖区', 0);
INSERT INTO `sys_area` VALUES ('410702', '410700', '红旗区', '河南省', '新乡市', '红旗区', '河南省新乡市红旗区', 0);
INSERT INTO `sys_area` VALUES ('410703', '410700', '卫滨区', '河南省', '新乡市', '卫滨区', '河南省新乡市卫滨区', 0);
INSERT INTO `sys_area` VALUES ('410704', '410700', '凤泉区', '河南省', '新乡市', '凤泉区', '河南省新乡市凤泉区', 0);
INSERT INTO `sys_area` VALUES ('410711', '410700', '牧野区', '河南省', '新乡市', '牧野区', '河南省新乡市牧野区', 0);
INSERT INTO `sys_area` VALUES ('410721', '410700', '新乡县', '河南省', '新乡市', '新乡县', '河南省新乡市新乡县', 0);
INSERT INTO `sys_area` VALUES ('410724', '410700', '获嘉县', '河南省', '新乡市', '获嘉县', '河南省新乡市获嘉县', 0);
INSERT INTO `sys_area` VALUES ('410725', '410700', '原阳县', '河南省', '新乡市', '原阳县', '河南省新乡市原阳县', 0);
INSERT INTO `sys_area` VALUES ('410726', '410700', '延津县', '河南省', '新乡市', '延津县', '河南省新乡市延津县', 0);
INSERT INTO `sys_area` VALUES ('410727', '410700', '封丘县', '河南省', '新乡市', '封丘县', '河南省新乡市封丘县', 0);
INSERT INTO `sys_area` VALUES ('410728', '410700', '长垣县', '河南省', '新乡市', '长垣县', '河南省新乡市长垣县', 0);
INSERT INTO `sys_area` VALUES ('410781', '410700', '卫辉市', '河南省', '新乡市', '卫辉市', '河南省新乡市卫辉市', 0);
INSERT INTO `sys_area` VALUES ('410782', '410700', '辉县市', '河南省', '新乡市', '辉县市', '河南省新乡市辉县市', 0);
INSERT INTO `sys_area` VALUES ('410800', '410000', '焦作市', '河南省', '焦作市', '', '河南省焦作市', 0);
INSERT INTO `sys_area` VALUES ('410801', '410800', '市辖区', '河南省', '焦作市', '市辖区', '河南省焦作市市辖区', 0);
INSERT INTO `sys_area` VALUES ('410802', '410800', '解放区', '河南省', '焦作市', '解放区', '河南省焦作市解放区', 0);
INSERT INTO `sys_area` VALUES ('410803', '410800', '中站区', '河南省', '焦作市', '中站区', '河南省焦作市中站区', 0);
INSERT INTO `sys_area` VALUES ('410804', '410800', '马村区', '河南省', '焦作市', '马村区', '河南省焦作市马村区', 0);
INSERT INTO `sys_area` VALUES ('410811', '410800', '山阳区', '河南省', '焦作市', '山阳区', '河南省焦作市山阳区', 0);
INSERT INTO `sys_area` VALUES ('410821', '410800', '修武县', '河南省', '焦作市', '修武县', '河南省焦作市修武县', 0);
INSERT INTO `sys_area` VALUES ('410822', '410800', '博爱县', '河南省', '焦作市', '博爱县', '河南省焦作市博爱县', 0);
INSERT INTO `sys_area` VALUES ('410823', '410800', '武陟县', '河南省', '焦作市', '武陟县', '河南省焦作市武陟县', 0);
INSERT INTO `sys_area` VALUES ('410825', '410800', '温县', '河南省', '焦作市', '温县', '河南省焦作市温县', 0);
INSERT INTO `sys_area` VALUES ('410882', '410800', '沁阳市', '河南省', '焦作市', '沁阳市', '河南省焦作市沁阳市', 0);
INSERT INTO `sys_area` VALUES ('410883', '410800', '孟州市', '河南省', '焦作市', '孟州市', '河南省焦作市孟州市', 0);
INSERT INTO `sys_area` VALUES ('410900', '410000', '濮阳市', '河南省', '濮阳市', '', '河南省濮阳市', 0);
INSERT INTO `sys_area` VALUES ('410901', '410900', '市辖区', '河南省', '濮阳市', '市辖区', '河南省濮阳市市辖区', 0);
INSERT INTO `sys_area` VALUES ('410902', '410900', '华龙区', '河南省', '濮阳市', '华龙区', '河南省濮阳市华龙区', 0);
INSERT INTO `sys_area` VALUES ('410922', '410900', '清丰县', '河南省', '濮阳市', '清丰县', '河南省濮阳市清丰县', 0);
INSERT INTO `sys_area` VALUES ('410923', '410900', '南乐县', '河南省', '濮阳市', '南乐县', '河南省濮阳市南乐县', 0);
INSERT INTO `sys_area` VALUES ('410926', '410900', '范县', '河南省', '濮阳市', '范县', '河南省濮阳市范县', 0);
INSERT INTO `sys_area` VALUES ('410927', '410900', '台前县', '河南省', '濮阳市', '台前县', '河南省濮阳市台前县', 0);
INSERT INTO `sys_area` VALUES ('410928', '410900', '濮阳县', '河南省', '濮阳市', '濮阳县', '河南省濮阳市濮阳县', 0);
INSERT INTO `sys_area` VALUES ('411000', '410000', '许昌市', '河南省', '许昌市', '', '河南省许昌市', 0);
INSERT INTO `sys_area` VALUES ('411001', '411000', '市辖区', '河南省', '许昌市', '市辖区', '河南省许昌市市辖区', 0);
INSERT INTO `sys_area` VALUES ('411002', '411000', '魏都区', '河南省', '许昌市', '魏都区', '河南省许昌市魏都区', 0);
INSERT INTO `sys_area` VALUES ('411023', '411000', '许昌县', '河南省', '许昌市', '许昌县', '河南省许昌市许昌县', 0);
INSERT INTO `sys_area` VALUES ('411024', '411000', '鄢陵县', '河南省', '许昌市', '鄢陵县', '河南省许昌市鄢陵县', 0);
INSERT INTO `sys_area` VALUES ('411025', '411000', '襄城县', '河南省', '许昌市', '襄城县', '河南省许昌市襄城县', 0);
INSERT INTO `sys_area` VALUES ('411081', '411000', '禹州市', '河南省', '许昌市', '禹州市', '河南省许昌市禹州市', 0);
INSERT INTO `sys_area` VALUES ('411082', '411000', '长葛市', '河南省', '许昌市', '长葛市', '河南省许昌市长葛市', 0);
INSERT INTO `sys_area` VALUES ('411100', '410000', '漯河市', '河南省', '漯河市', '', '河南省漯河市', 0);
INSERT INTO `sys_area` VALUES ('411101', '411100', '市辖区', '河南省', '漯河市', '市辖区', '河南省漯河市市辖区', 0);
INSERT INTO `sys_area` VALUES ('411102', '411100', '源汇区', '河南省', '漯河市', '源汇区', '河南省漯河市源汇区', 0);
INSERT INTO `sys_area` VALUES ('411103', '411100', '郾城区', '河南省', '漯河市', '郾城区', '河南省漯河市郾城区', 0);
INSERT INTO `sys_area` VALUES ('411104', '411100', '召陵区', '河南省', '漯河市', '召陵区', '河南省漯河市召陵区', 0);
INSERT INTO `sys_area` VALUES ('411121', '411100', '舞阳县', '河南省', '漯河市', '舞阳县', '河南省漯河市舞阳县', 0);
INSERT INTO `sys_area` VALUES ('411122', '411100', '临颍县', '河南省', '漯河市', '临颍县', '河南省漯河市临颍县', 0);
INSERT INTO `sys_area` VALUES ('411200', '410000', '三门峡市', '河南省', '三门峡市', '', '河南省三门峡市', 0);
INSERT INTO `sys_area` VALUES ('411201', '411200', '市辖区', '河南省', '三门峡市', '市辖区', '河南省三门峡市市辖区', 0);
INSERT INTO `sys_area` VALUES ('411202', '411200', '湖滨区', '河南省', '三门峡市', '湖滨区', '河南省三门峡市湖滨区', 0);
INSERT INTO `sys_area` VALUES ('411203', '411200', '陕州区', '河南省', '三门峡市', '陕州区', '河南省三门峡市陕州区', 0);
INSERT INTO `sys_area` VALUES ('411221', '411200', '渑池县', '河南省', '三门峡市', '渑池县', '河南省三门峡市渑池县', 0);
INSERT INTO `sys_area` VALUES ('411224', '411200', '卢氏县', '河南省', '三门峡市', '卢氏县', '河南省三门峡市卢氏县', 0);
INSERT INTO `sys_area` VALUES ('411281', '411200', '义马市', '河南省', '三门峡市', '义马市', '河南省三门峡市义马市', 0);
INSERT INTO `sys_area` VALUES ('411282', '411200', '灵宝市', '河南省', '三门峡市', '灵宝市', '河南省三门峡市灵宝市', 0);
INSERT INTO `sys_area` VALUES ('411300', '410000', '南阳市', '河南省', '南阳市', '', '河南省南阳市', 0);
INSERT INTO `sys_area` VALUES ('411301', '411300', '市辖区', '河南省', '南阳市', '市辖区', '河南省南阳市市辖区', 0);
INSERT INTO `sys_area` VALUES ('411302', '411300', '宛城区', '河南省', '南阳市', '宛城区', '河南省南阳市宛城区', 0);
INSERT INTO `sys_area` VALUES ('411303', '411300', '卧龙区', '河南省', '南阳市', '卧龙区', '河南省南阳市卧龙区', 0);
INSERT INTO `sys_area` VALUES ('411321', '411300', '南召县', '河南省', '南阳市', '南召县', '河南省南阳市南召县', 0);
INSERT INTO `sys_area` VALUES ('411322', '411300', '方城县', '河南省', '南阳市', '方城县', '河南省南阳市方城县', 0);
INSERT INTO `sys_area` VALUES ('411323', '411300', '西峡县', '河南省', '南阳市', '西峡县', '河南省南阳市西峡县', 0);
INSERT INTO `sys_area` VALUES ('411324', '411300', '镇平县', '河南省', '南阳市', '镇平县', '河南省南阳市镇平县', 0);
INSERT INTO `sys_area` VALUES ('411325', '411300', '内乡县', '河南省', '南阳市', '内乡县', '河南省南阳市内乡县', 0);
INSERT INTO `sys_area` VALUES ('411326', '411300', '淅川县', '河南省', '南阳市', '淅川县', '河南省南阳市淅川县', 0);
INSERT INTO `sys_area` VALUES ('411327', '411300', '社旗县', '河南省', '南阳市', '社旗县', '河南省南阳市社旗县', 0);
INSERT INTO `sys_area` VALUES ('411328', '411300', '唐河县', '河南省', '南阳市', '唐河县', '河南省南阳市唐河县', 0);
INSERT INTO `sys_area` VALUES ('411329', '411300', '新野县', '河南省', '南阳市', '新野县', '河南省南阳市新野县', 0);
INSERT INTO `sys_area` VALUES ('411330', '411300', '桐柏县', '河南省', '南阳市', '桐柏县', '河南省南阳市桐柏县', 0);
INSERT INTO `sys_area` VALUES ('411381', '411300', '邓州市', '河南省', '南阳市', '邓州市', '河南省南阳市邓州市', 0);
INSERT INTO `sys_area` VALUES ('411400', '410000', '商丘市', '河南省', '商丘市', '', '河南省商丘市', 0);
INSERT INTO `sys_area` VALUES ('411401', '411400', '市辖区', '河南省', '商丘市', '市辖区', '河南省商丘市市辖区', 0);
INSERT INTO `sys_area` VALUES ('411402', '411400', '梁园区', '河南省', '商丘市', '梁园区', '河南省商丘市梁园区', 0);
INSERT INTO `sys_area` VALUES ('411403', '411400', '睢阳区', '河南省', '商丘市', '睢阳区', '河南省商丘市睢阳区', 0);
INSERT INTO `sys_area` VALUES ('411421', '411400', '民权县', '河南省', '商丘市', '民权县', '河南省商丘市民权县', 0);
INSERT INTO `sys_area` VALUES ('411422', '411400', '睢县', '河南省', '商丘市', '睢县', '河南省商丘市睢县', 0);
INSERT INTO `sys_area` VALUES ('411423', '411400', '宁陵县', '河南省', '商丘市', '宁陵县', '河南省商丘市宁陵县', 0);
INSERT INTO `sys_area` VALUES ('411424', '411400', '柘城县', '河南省', '商丘市', '柘城县', '河南省商丘市柘城县', 0);
INSERT INTO `sys_area` VALUES ('411425', '411400', '虞城县', '河南省', '商丘市', '虞城县', '河南省商丘市虞城县', 0);
INSERT INTO `sys_area` VALUES ('411426', '411400', '夏邑县', '河南省', '商丘市', '夏邑县', '河南省商丘市夏邑县', 0);
INSERT INTO `sys_area` VALUES ('411481', '411400', '永城市', '河南省', '商丘市', '永城市', '河南省商丘市永城市', 0);
INSERT INTO `sys_area` VALUES ('411500', '410000', '信阳市', '河南省', '信阳市', '', '河南省信阳市', 0);
INSERT INTO `sys_area` VALUES ('411501', '411500', '市辖区', '河南省', '信阳市', '市辖区', '河南省信阳市市辖区', 0);
INSERT INTO `sys_area` VALUES ('411502', '411500', '浉河区', '河南省', '信阳市', '浉河区', '河南省信阳市浉河区', 0);
INSERT INTO `sys_area` VALUES ('411503', '411500', '平桥区', '河南省', '信阳市', '平桥区', '河南省信阳市平桥区', 0);
INSERT INTO `sys_area` VALUES ('411521', '411500', '罗山县', '河南省', '信阳市', '罗山县', '河南省信阳市罗山县', 0);
INSERT INTO `sys_area` VALUES ('411522', '411500', '光山县', '河南省', '信阳市', '光山县', '河南省信阳市光山县', 0);
INSERT INTO `sys_area` VALUES ('411523', '411500', '新县', '河南省', '信阳市', '新县', '河南省信阳市新县', 0);
INSERT INTO `sys_area` VALUES ('411524', '411500', '商城县', '河南省', '信阳市', '商城县', '河南省信阳市商城县', 0);
INSERT INTO `sys_area` VALUES ('411525', '411500', '固始县', '河南省', '信阳市', '固始县', '河南省信阳市固始县', 0);
INSERT INTO `sys_area` VALUES ('411526', '411500', '潢川县', '河南省', '信阳市', '潢川县', '河南省信阳市潢川县', 0);
INSERT INTO `sys_area` VALUES ('411527', '411500', '淮滨县', '河南省', '信阳市', '淮滨县', '河南省信阳市淮滨县', 0);
INSERT INTO `sys_area` VALUES ('411528', '411500', '息县', '河南省', '信阳市', '息县', '河南省信阳市息县', 0);
INSERT INTO `sys_area` VALUES ('411600', '410000', '周口市', '河南省', '周口市', '', '河南省周口市', 0);
INSERT INTO `sys_area` VALUES ('411601', '411600', '市辖区', '河南省', '周口市', '市辖区', '河南省周口市市辖区', 0);
INSERT INTO `sys_area` VALUES ('411602', '411600', '川汇区', '河南省', '周口市', '川汇区', '河南省周口市川汇区', 0);
INSERT INTO `sys_area` VALUES ('411621', '411600', '扶沟县', '河南省', '周口市', '扶沟县', '河南省周口市扶沟县', 0);
INSERT INTO `sys_area` VALUES ('411622', '411600', '西华县', '河南省', '周口市', '西华县', '河南省周口市西华县', 0);
INSERT INTO `sys_area` VALUES ('411623', '411600', '商水县', '河南省', '周口市', '商水县', '河南省周口市商水县', 0);
INSERT INTO `sys_area` VALUES ('411624', '411600', '沈丘县', '河南省', '周口市', '沈丘县', '河南省周口市沈丘县', 0);
INSERT INTO `sys_area` VALUES ('411625', '411600', '郸城县', '河南省', '周口市', '郸城县', '河南省周口市郸城县', 0);
INSERT INTO `sys_area` VALUES ('411626', '411600', '淮阳县', '河南省', '周口市', '淮阳县', '河南省周口市淮阳县', 0);
INSERT INTO `sys_area` VALUES ('411627', '411600', '太康县', '河南省', '周口市', '太康县', '河南省周口市太康县', 0);
INSERT INTO `sys_area` VALUES ('411628', '411600', '鹿邑县', '河南省', '周口市', '鹿邑县', '河南省周口市鹿邑县', 0);
INSERT INTO `sys_area` VALUES ('411681', '411600', '项城市', '河南省', '周口市', '项城市', '河南省周口市项城市', 0);
INSERT INTO `sys_area` VALUES ('411700', '410000', '驻马店市', '河南省', '驻马店市', '', '河南省驻马店市', 0);
INSERT INTO `sys_area` VALUES ('411701', '411700', '市辖区', '河南省', '驻马店市', '市辖区', '河南省驻马店市市辖区', 0);
INSERT INTO `sys_area` VALUES ('411702', '411700', '驿城区', '河南省', '驻马店市', '驿城区', '河南省驻马店市驿城区', 0);
INSERT INTO `sys_area` VALUES ('411721', '411700', '西平县', '河南省', '驻马店市', '西平县', '河南省驻马店市西平县', 0);
INSERT INTO `sys_area` VALUES ('411722', '411700', '上蔡县', '河南省', '驻马店市', '上蔡县', '河南省驻马店市上蔡县', 0);
INSERT INTO `sys_area` VALUES ('411723', '411700', '平舆县', '河南省', '驻马店市', '平舆县', '河南省驻马店市平舆县', 0);
INSERT INTO `sys_area` VALUES ('411724', '411700', '正阳县', '河南省', '驻马店市', '正阳县', '河南省驻马店市正阳县', 0);
INSERT INTO `sys_area` VALUES ('411725', '411700', '确山县', '河南省', '驻马店市', '确山县', '河南省驻马店市确山县', 0);
INSERT INTO `sys_area` VALUES ('411726', '411700', '泌阳县', '河南省', '驻马店市', '泌阳县', '河南省驻马店市泌阳县', 0);
INSERT INTO `sys_area` VALUES ('411727', '411700', '汝南县', '河南省', '驻马店市', '汝南县', '河南省驻马店市汝南县', 0);
INSERT INTO `sys_area` VALUES ('411728', '411700', '遂平县', '河南省', '驻马店市', '遂平县', '河南省驻马店市遂平县', 0);
INSERT INTO `sys_area` VALUES ('411729', '411700', '新蔡县', '河南省', '驻马店市', '新蔡县', '河南省驻马店市新蔡县', 0);
INSERT INTO `sys_area` VALUES ('419000', '410000', '省直辖县级行政区划', '河南省', '省直辖县级行政区划', '', '河南省省直辖县级行政区划', 0);
INSERT INTO `sys_area` VALUES ('419001', '419000', '济源市', '河南省', '省直辖县级行政区划', '济源市', '河南省省直辖县级行政区划济源市', 0);
INSERT INTO `sys_area` VALUES ('420000', '86', '湖北省', '湖北省', '', '', '湖北省', 0);
INSERT INTO `sys_area` VALUES ('420100', '420000', '武汉市', '湖北省', '武汉市', '', '湖北省武汉市', 0);
INSERT INTO `sys_area` VALUES ('420101', '420100', '市辖区', '湖北省', '武汉市', '市辖区', '湖北省武汉市市辖区', 0);
INSERT INTO `sys_area` VALUES ('420102', '420100', '江岸区', '湖北省', '武汉市', '江岸区', '湖北省武汉市江岸区', 0);
INSERT INTO `sys_area` VALUES ('420103', '420100', '江汉区', '湖北省', '武汉市', '江汉区', '湖北省武汉市江汉区', 0);
INSERT INTO `sys_area` VALUES ('420104', '420100', '硚口区', '湖北省', '武汉市', '硚口区', '湖北省武汉市硚口区', 0);
INSERT INTO `sys_area` VALUES ('420105', '420100', '汉阳区', '湖北省', '武汉市', '汉阳区', '湖北省武汉市汉阳区', 0);
INSERT INTO `sys_area` VALUES ('420106', '420100', '武昌区', '湖北省', '武汉市', '武昌区', '湖北省武汉市武昌区', 0);
INSERT INTO `sys_area` VALUES ('420107', '420100', '青山区', '湖北省', '武汉市', '青山区', '湖北省武汉市青山区', 0);
INSERT INTO `sys_area` VALUES ('420111', '420100', '洪山区', '湖北省', '武汉市', '洪山区', '湖北省武汉市洪山区', 0);
INSERT INTO `sys_area` VALUES ('420112', '420100', '东西湖区', '湖北省', '武汉市', '东西湖区', '湖北省武汉市东西湖区', 0);
INSERT INTO `sys_area` VALUES ('420113', '420100', '汉南区', '湖北省', '武汉市', '汉南区', '湖北省武汉市汉南区', 0);
INSERT INTO `sys_area` VALUES ('420114', '420100', '蔡甸区', '湖北省', '武汉市', '蔡甸区', '湖北省武汉市蔡甸区', 0);
INSERT INTO `sys_area` VALUES ('420115', '420100', '江夏区', '湖北省', '武汉市', '江夏区', '湖北省武汉市江夏区', 0);
INSERT INTO `sys_area` VALUES ('420116', '420100', '黄陂区', '湖北省', '武汉市', '黄陂区', '湖北省武汉市黄陂区', 0);
INSERT INTO `sys_area` VALUES ('420117', '420100', '新洲区', '湖北省', '武汉市', '新洲区', '湖北省武汉市新洲区', 0);
INSERT INTO `sys_area` VALUES ('420200', '420000', '黄石市', '湖北省', '黄石市', '', '湖北省黄石市', 0);
INSERT INTO `sys_area` VALUES ('420201', '420200', '市辖区', '湖北省', '黄石市', '市辖区', '湖北省黄石市市辖区', 0);
INSERT INTO `sys_area` VALUES ('420202', '420200', '黄石港区', '湖北省', '黄石市', '黄石港区', '湖北省黄石市黄石港区', 0);
INSERT INTO `sys_area` VALUES ('420203', '420200', '西塞山区', '湖北省', '黄石市', '西塞山区', '湖北省黄石市西塞山区', 0);
INSERT INTO `sys_area` VALUES ('420204', '420200', '下陆区', '湖北省', '黄石市', '下陆区', '湖北省黄石市下陆区', 0);
INSERT INTO `sys_area` VALUES ('420205', '420200', '铁山区', '湖北省', '黄石市', '铁山区', '湖北省黄石市铁山区', 0);
INSERT INTO `sys_area` VALUES ('420222', '420200', '阳新县', '湖北省', '黄石市', '阳新县', '湖北省黄石市阳新县', 0);
INSERT INTO `sys_area` VALUES ('420281', '420200', '大冶市', '湖北省', '黄石市', '大冶市', '湖北省黄石市大冶市', 0);
INSERT INTO `sys_area` VALUES ('420300', '420000', '十堰市', '湖北省', '十堰市', '', '湖北省十堰市', 0);
INSERT INTO `sys_area` VALUES ('420301', '420300', '市辖区', '湖北省', '十堰市', '市辖区', '湖北省十堰市市辖区', 0);
INSERT INTO `sys_area` VALUES ('420302', '420300', '茅箭区', '湖北省', '十堰市', '茅箭区', '湖北省十堰市茅箭区', 0);
INSERT INTO `sys_area` VALUES ('420303', '420300', '张湾区', '湖北省', '十堰市', '张湾区', '湖北省十堰市张湾区', 0);
INSERT INTO `sys_area` VALUES ('420304', '420300', '郧阳区', '湖北省', '十堰市', '郧阳区', '湖北省十堰市郧阳区', 0);
INSERT INTO `sys_area` VALUES ('420322', '420300', '郧西县', '湖北省', '十堰市', '郧西县', '湖北省十堰市郧西县', 0);
INSERT INTO `sys_area` VALUES ('420323', '420300', '竹山县', '湖北省', '十堰市', '竹山县', '湖北省十堰市竹山县', 0);
INSERT INTO `sys_area` VALUES ('420324', '420300', '竹溪县', '湖北省', '十堰市', '竹溪县', '湖北省十堰市竹溪县', 0);
INSERT INTO `sys_area` VALUES ('420325', '420300', '房县', '湖北省', '十堰市', '房县', '湖北省十堰市房县', 0);
INSERT INTO `sys_area` VALUES ('420381', '420300', '丹江口市', '湖北省', '十堰市', '丹江口市', '湖北省十堰市丹江口市', 0);
INSERT INTO `sys_area` VALUES ('420500', '420000', '宜昌市', '湖北省', '宜昌市', '', '湖北省宜昌市', 0);
INSERT INTO `sys_area` VALUES ('420501', '420500', '市辖区', '湖北省', '宜昌市', '市辖区', '湖北省宜昌市市辖区', 0);
INSERT INTO `sys_area` VALUES ('420502', '420500', '西陵区', '湖北省', '宜昌市', '西陵区', '湖北省宜昌市西陵区', 0);
INSERT INTO `sys_area` VALUES ('420503', '420500', '伍家岗区', '湖北省', '宜昌市', '伍家岗区', '湖北省宜昌市伍家岗区', 0);
INSERT INTO `sys_area` VALUES ('420504', '420500', '点军区', '湖北省', '宜昌市', '点军区', '湖北省宜昌市点军区', 0);
INSERT INTO `sys_area` VALUES ('420505', '420500', '猇亭区', '湖北省', '宜昌市', '猇亭区', '湖北省宜昌市猇亭区', 0);
INSERT INTO `sys_area` VALUES ('420506', '420500', '夷陵区', '湖北省', '宜昌市', '夷陵区', '湖北省宜昌市夷陵区', 0);
INSERT INTO `sys_area` VALUES ('420525', '420500', '远安县', '湖北省', '宜昌市', '远安县', '湖北省宜昌市远安县', 0);
INSERT INTO `sys_area` VALUES ('420526', '420500', '兴山县', '湖北省', '宜昌市', '兴山县', '湖北省宜昌市兴山县', 0);
INSERT INTO `sys_area` VALUES ('420527', '420500', '秭归县', '湖北省', '宜昌市', '秭归县', '湖北省宜昌市秭归县', 0);
INSERT INTO `sys_area` VALUES ('420528', '420500', '长阳土家族自治县', '湖北省', '宜昌市', '长阳土家族自治县', '湖北省宜昌市长阳土家族自治县', 0);
INSERT INTO `sys_area` VALUES ('420529', '420500', '五峰土家族自治县', '湖北省', '宜昌市', '五峰土家族自治县', '湖北省宜昌市五峰土家族自治县', 0);
INSERT INTO `sys_area` VALUES ('420581', '420500', '宜都市', '湖北省', '宜昌市', '宜都市', '湖北省宜昌市宜都市', 0);
INSERT INTO `sys_area` VALUES ('420582', '420500', '当阳市', '湖北省', '宜昌市', '当阳市', '湖北省宜昌市当阳市', 0);
INSERT INTO `sys_area` VALUES ('420583', '420500', '枝江市', '湖北省', '宜昌市', '枝江市', '湖北省宜昌市枝江市', 0);
INSERT INTO `sys_area` VALUES ('420600', '420000', '襄阳市', '湖北省', '襄阳市', '', '湖北省襄阳市', 0);
INSERT INTO `sys_area` VALUES ('420601', '420600', '市辖区', '湖北省', '襄阳市', '市辖区', '湖北省襄阳市市辖区', 0);
INSERT INTO `sys_area` VALUES ('420602', '420600', '襄城区', '湖北省', '襄阳市', '襄城区', '湖北省襄阳市襄城区', 0);
INSERT INTO `sys_area` VALUES ('420606', '420600', '樊城区', '湖北省', '襄阳市', '樊城区', '湖北省襄阳市樊城区', 0);
INSERT INTO `sys_area` VALUES ('420607', '420600', '襄州区', '湖北省', '襄阳市', '襄州区', '湖北省襄阳市襄州区', 0);
INSERT INTO `sys_area` VALUES ('420624', '420600', '南漳县', '湖北省', '襄阳市', '南漳县', '湖北省襄阳市南漳县', 0);
INSERT INTO `sys_area` VALUES ('420625', '420600', '谷城县', '湖北省', '襄阳市', '谷城县', '湖北省襄阳市谷城县', 0);
INSERT INTO `sys_area` VALUES ('420626', '420600', '保康县', '湖北省', '襄阳市', '保康县', '湖北省襄阳市保康县', 0);
INSERT INTO `sys_area` VALUES ('420682', '420600', '老河口市', '湖北省', '襄阳市', '老河口市', '湖北省襄阳市老河口市', 0);
INSERT INTO `sys_area` VALUES ('420683', '420600', '枣阳市', '湖北省', '襄阳市', '枣阳市', '湖北省襄阳市枣阳市', 0);
INSERT INTO `sys_area` VALUES ('420684', '420600', '宜城市', '湖北省', '襄阳市', '宜城市', '湖北省襄阳市宜城市', 0);
INSERT INTO `sys_area` VALUES ('420700', '420000', '鄂州市', '湖北省', '鄂州市', '', '湖北省鄂州市', 0);
INSERT INTO `sys_area` VALUES ('420701', '420700', '市辖区', '湖北省', '鄂州市', '市辖区', '湖北省鄂州市市辖区', 0);
INSERT INTO `sys_area` VALUES ('420702', '420700', '梁子湖区', '湖北省', '鄂州市', '梁子湖区', '湖北省鄂州市梁子湖区', 0);
INSERT INTO `sys_area` VALUES ('420703', '420700', '华容区', '湖北省', '鄂州市', '华容区', '湖北省鄂州市华容区', 0);
INSERT INTO `sys_area` VALUES ('420704', '420700', '鄂城区', '湖北省', '鄂州市', '鄂城区', '湖北省鄂州市鄂城区', 0);
INSERT INTO `sys_area` VALUES ('420800', '420000', '荆门市', '湖北省', '荆门市', '', '湖北省荆门市', 0);
INSERT INTO `sys_area` VALUES ('420801', '420800', '市辖区', '湖北省', '荆门市', '市辖区', '湖北省荆门市市辖区', 0);
INSERT INTO `sys_area` VALUES ('420802', '420800', '东宝区', '湖北省', '荆门市', '东宝区', '湖北省荆门市东宝区', 0);
INSERT INTO `sys_area` VALUES ('420804', '420800', '掇刀区', '湖北省', '荆门市', '掇刀区', '湖北省荆门市掇刀区', 0);
INSERT INTO `sys_area` VALUES ('420821', '420800', '京山县', '湖北省', '荆门市', '京山县', '湖北省荆门市京山县', 0);
INSERT INTO `sys_area` VALUES ('420822', '420800', '沙洋县', '湖北省', '荆门市', '沙洋县', '湖北省荆门市沙洋县', 0);
INSERT INTO `sys_area` VALUES ('420881', '420800', '钟祥市', '湖北省', '荆门市', '钟祥市', '湖北省荆门市钟祥市', 0);
INSERT INTO `sys_area` VALUES ('420900', '420000', '孝感市', '湖北省', '孝感市', '', '湖北省孝感市', 0);
INSERT INTO `sys_area` VALUES ('420901', '420900', '市辖区', '湖北省', '孝感市', '市辖区', '湖北省孝感市市辖区', 0);
INSERT INTO `sys_area` VALUES ('420902', '420900', '孝南区', '湖北省', '孝感市', '孝南区', '湖北省孝感市孝南区', 0);
INSERT INTO `sys_area` VALUES ('420921', '420900', '孝昌县', '湖北省', '孝感市', '孝昌县', '湖北省孝感市孝昌县', 0);
INSERT INTO `sys_area` VALUES ('420922', '420900', '大悟县', '湖北省', '孝感市', '大悟县', '湖北省孝感市大悟县', 0);
INSERT INTO `sys_area` VALUES ('420923', '420900', '云梦县', '湖北省', '孝感市', '云梦县', '湖北省孝感市云梦县', 0);
INSERT INTO `sys_area` VALUES ('420981', '420900', '应城市', '湖北省', '孝感市', '应城市', '湖北省孝感市应城市', 0);
INSERT INTO `sys_area` VALUES ('420982', '420900', '安陆市', '湖北省', '孝感市', '安陆市', '湖北省孝感市安陆市', 0);
INSERT INTO `sys_area` VALUES ('420984', '420900', '汉川市', '湖北省', '孝感市', '汉川市', '湖北省孝感市汉川市', 0);
INSERT INTO `sys_area` VALUES ('421000', '420000', '荆州市', '湖北省', '荆州市', '', '湖北省荆州市', 0);
INSERT INTO `sys_area` VALUES ('421001', '421000', '市辖区', '湖北省', '荆州市', '市辖区', '湖北省荆州市市辖区', 0);
INSERT INTO `sys_area` VALUES ('421002', '421000', '沙市区', '湖北省', '荆州市', '沙市区', '湖北省荆州市沙市区', 0);
INSERT INTO `sys_area` VALUES ('421003', '421000', '荆州区', '湖北省', '荆州市', '荆州区', '湖北省荆州市荆州区', 0);
INSERT INTO `sys_area` VALUES ('421022', '421000', '公安县', '湖北省', '荆州市', '公安县', '湖北省荆州市公安县', 0);
INSERT INTO `sys_area` VALUES ('421023', '421000', '监利县', '湖北省', '荆州市', '监利县', '湖北省荆州市监利县', 0);
INSERT INTO `sys_area` VALUES ('421024', '421000', '江陵县', '湖北省', '荆州市', '江陵县', '湖北省荆州市江陵县', 0);
INSERT INTO `sys_area` VALUES ('421081', '421000', '石首市', '湖北省', '荆州市', '石首市', '湖北省荆州市石首市', 0);
INSERT INTO `sys_area` VALUES ('421083', '421000', '洪湖市', '湖北省', '荆州市', '洪湖市', '湖北省荆州市洪湖市', 0);
INSERT INTO `sys_area` VALUES ('421087', '421000', '松滋市', '湖北省', '荆州市', '松滋市', '湖北省荆州市松滋市', 0);
INSERT INTO `sys_area` VALUES ('421100', '420000', '黄冈市', '湖北省', '黄冈市', '', '湖北省黄冈市', 0);
INSERT INTO `sys_area` VALUES ('421101', '421100', '市辖区', '湖北省', '黄冈市', '市辖区', '湖北省黄冈市市辖区', 0);
INSERT INTO `sys_area` VALUES ('421102', '421100', '黄州区', '湖北省', '黄冈市', '黄州区', '湖北省黄冈市黄州区', 0);
INSERT INTO `sys_area` VALUES ('421121', '421100', '团风县', '湖北省', '黄冈市', '团风县', '湖北省黄冈市团风县', 0);
INSERT INTO `sys_area` VALUES ('421122', '421100', '红安县', '湖北省', '黄冈市', '红安县', '湖北省黄冈市红安县', 0);
INSERT INTO `sys_area` VALUES ('421123', '421100', '罗田县', '湖北省', '黄冈市', '罗田县', '湖北省黄冈市罗田县', 0);
INSERT INTO `sys_area` VALUES ('421124', '421100', '英山县', '湖北省', '黄冈市', '英山县', '湖北省黄冈市英山县', 0);
INSERT INTO `sys_area` VALUES ('421125', '421100', '浠水县', '湖北省', '黄冈市', '浠水县', '湖北省黄冈市浠水县', 0);
INSERT INTO `sys_area` VALUES ('421126', '421100', '蕲春县', '湖北省', '黄冈市', '蕲春县', '湖北省黄冈市蕲春县', 0);
INSERT INTO `sys_area` VALUES ('421127', '421100', '黄梅县', '湖北省', '黄冈市', '黄梅县', '湖北省黄冈市黄梅县', 0);
INSERT INTO `sys_area` VALUES ('421181', '421100', '麻城市', '湖北省', '黄冈市', '麻城市', '湖北省黄冈市麻城市', 0);
INSERT INTO `sys_area` VALUES ('421182', '421100', '武穴市', '湖北省', '黄冈市', '武穴市', '湖北省黄冈市武穴市', 0);
INSERT INTO `sys_area` VALUES ('421200', '420000', '咸宁市', '湖北省', '咸宁市', '', '湖北省咸宁市', 0);
INSERT INTO `sys_area` VALUES ('421201', '421200', '市辖区', '湖北省', '咸宁市', '市辖区', '湖北省咸宁市市辖区', 0);
INSERT INTO `sys_area` VALUES ('421202', '421200', '咸安区', '湖北省', '咸宁市', '咸安区', '湖北省咸宁市咸安区', 0);
INSERT INTO `sys_area` VALUES ('421221', '421200', '嘉鱼县', '湖北省', '咸宁市', '嘉鱼县', '湖北省咸宁市嘉鱼县', 0);
INSERT INTO `sys_area` VALUES ('421222', '421200', '通城县', '湖北省', '咸宁市', '通城县', '湖北省咸宁市通城县', 0);
INSERT INTO `sys_area` VALUES ('421223', '421200', '崇阳县', '湖北省', '咸宁市', '崇阳县', '湖北省咸宁市崇阳县', 0);
INSERT INTO `sys_area` VALUES ('421224', '421200', '通山县', '湖北省', '咸宁市', '通山县', '湖北省咸宁市通山县', 0);
INSERT INTO `sys_area` VALUES ('421281', '421200', '赤壁市', '湖北省', '咸宁市', '赤壁市', '湖北省咸宁市赤壁市', 0);
INSERT INTO `sys_area` VALUES ('421300', '420000', '随州市', '湖北省', '随州市', '', '湖北省随州市', 0);
INSERT INTO `sys_area` VALUES ('421301', '421300', '市辖区', '湖北省', '随州市', '市辖区', '湖北省随州市市辖区', 0);
INSERT INTO `sys_area` VALUES ('421303', '421300', '曾都区', '湖北省', '随州市', '曾都区', '湖北省随州市曾都区', 0);
INSERT INTO `sys_area` VALUES ('421321', '421300', '随县', '湖北省', '随州市', '随县', '湖北省随州市随县', 0);
INSERT INTO `sys_area` VALUES ('421381', '421300', '广水市', '湖北省', '随州市', '广水市', '湖北省随州市广水市', 0);
INSERT INTO `sys_area` VALUES ('422800', '420000', '恩施土家族苗族自治州', '湖北省', '恩施土家族苗族自治州', '', '湖北省恩施土家族苗族自治州', 0);
INSERT INTO `sys_area` VALUES ('422801', '422800', '恩施市', '湖北省', '恩施土家族苗族自治州', '恩施市', '湖北省恩施土家族苗族自治州恩施市', 0);
INSERT INTO `sys_area` VALUES ('422802', '422800', '利川市', '湖北省', '恩施土家族苗族自治州', '利川市', '湖北省恩施土家族苗族自治州利川市', 0);
INSERT INTO `sys_area` VALUES ('422822', '422800', '建始县', '湖北省', '恩施土家族苗族自治州', '建始县', '湖北省恩施土家族苗族自治州建始县', 0);
INSERT INTO `sys_area` VALUES ('422823', '422800', '巴东县', '湖北省', '恩施土家族苗族自治州', '巴东县', '湖北省恩施土家族苗族自治州巴东县', 0);
INSERT INTO `sys_area` VALUES ('422825', '422800', '宣恩县', '湖北省', '恩施土家族苗族自治州', '宣恩县', '湖北省恩施土家族苗族自治州宣恩县', 0);
INSERT INTO `sys_area` VALUES ('422826', '422800', '咸丰县', '湖北省', '恩施土家族苗族自治州', '咸丰县', '湖北省恩施土家族苗族自治州咸丰县', 0);
INSERT INTO `sys_area` VALUES ('422827', '422800', '来凤县', '湖北省', '恩施土家族苗族自治州', '来凤县', '湖北省恩施土家族苗族自治州来凤县', 0);
INSERT INTO `sys_area` VALUES ('422828', '422800', '鹤峰县', '湖北省', '恩施土家族苗族自治州', '鹤峰县', '湖北省恩施土家族苗族自治州鹤峰县', 0);
INSERT INTO `sys_area` VALUES ('429000', '420000', '省直辖县级行政区划', '湖北省', '省直辖县级行政区划', '', '湖北省省直辖县级行政区划', 0);
INSERT INTO `sys_area` VALUES ('429004', '429000', '仙桃市', '湖北省', '省直辖县级行政区划', '仙桃市', '湖北省省直辖县级行政区划仙桃市', 0);
INSERT INTO `sys_area` VALUES ('429005', '429000', '潜江市', '湖北省', '省直辖县级行政区划', '潜江市', '湖北省省直辖县级行政区划潜江市', 0);
INSERT INTO `sys_area` VALUES ('429006', '429000', '天门市', '湖北省', '省直辖县级行政区划', '天门市', '湖北省省直辖县级行政区划天门市', 0);
INSERT INTO `sys_area` VALUES ('429021', '429000', '神农架林区', '湖北省', '省直辖县级行政区划', '神农架林区', '湖北省省直辖县级行政区划神农架林区', 0);
INSERT INTO `sys_area` VALUES ('430000', '86', '湖南省', '湖南省', '', '', '湖南省', 0);
INSERT INTO `sys_area` VALUES ('430100', '430000', '长沙市', '湖南省', '长沙市', '', '湖南省长沙市', 0);
INSERT INTO `sys_area` VALUES ('430101', '430100', '市辖区', '湖南省', '长沙市', '市辖区', '湖南省长沙市市辖区', 0);
INSERT INTO `sys_area` VALUES ('430102', '430100', '芙蓉区', '湖南省', '长沙市', '芙蓉区', '湖南省长沙市芙蓉区', 0);
INSERT INTO `sys_area` VALUES ('430103', '430100', '天心区', '湖南省', '长沙市', '天心区', '湖南省长沙市天心区', 0);
INSERT INTO `sys_area` VALUES ('430104', '430100', '岳麓区', '湖南省', '长沙市', '岳麓区', '湖南省长沙市岳麓区', 0);
INSERT INTO `sys_area` VALUES ('430105', '430100', '开福区', '湖南省', '长沙市', '开福区', '湖南省长沙市开福区', 0);
INSERT INTO `sys_area` VALUES ('430111', '430100', '雨花区', '湖南省', '长沙市', '雨花区', '湖南省长沙市雨花区', 0);
INSERT INTO `sys_area` VALUES ('430112', '430100', '望城区', '湖南省', '长沙市', '望城区', '湖南省长沙市望城区', 0);
INSERT INTO `sys_area` VALUES ('430121', '430100', '长沙县', '湖南省', '长沙市', '长沙县', '湖南省长沙市长沙县', 0);
INSERT INTO `sys_area` VALUES ('430124', '430100', '宁乡县', '湖南省', '长沙市', '宁乡县', '湖南省长沙市宁乡县', 0);
INSERT INTO `sys_area` VALUES ('430181', '430100', '浏阳市', '湖南省', '长沙市', '浏阳市', '湖南省长沙市浏阳市', 0);
INSERT INTO `sys_area` VALUES ('430200', '430000', '株洲市', '湖南省', '株洲市', '', '湖南省株洲市', 0);
INSERT INTO `sys_area` VALUES ('430201', '430200', '市辖区', '湖南省', '株洲市', '市辖区', '湖南省株洲市市辖区', 0);
INSERT INTO `sys_area` VALUES ('430202', '430200', '荷塘区', '湖南省', '株洲市', '荷塘区', '湖南省株洲市荷塘区', 0);
INSERT INTO `sys_area` VALUES ('430203', '430200', '芦淞区', '湖南省', '株洲市', '芦淞区', '湖南省株洲市芦淞区', 0);
INSERT INTO `sys_area` VALUES ('430204', '430200', '石峰区', '湖南省', '株洲市', '石峰区', '湖南省株洲市石峰区', 0);
INSERT INTO `sys_area` VALUES ('430211', '430200', '天元区', '湖南省', '株洲市', '天元区', '湖南省株洲市天元区', 0);
INSERT INTO `sys_area` VALUES ('430221', '430200', '株洲县', '湖南省', '株洲市', '株洲县', '湖南省株洲市株洲县', 0);
INSERT INTO `sys_area` VALUES ('430223', '430200', '攸县', '湖南省', '株洲市', '攸县', '湖南省株洲市攸县', 0);
INSERT INTO `sys_area` VALUES ('430224', '430200', '茶陵县', '湖南省', '株洲市', '茶陵县', '湖南省株洲市茶陵县', 0);
INSERT INTO `sys_area` VALUES ('430225', '430200', '炎陵县', '湖南省', '株洲市', '炎陵县', '湖南省株洲市炎陵县', 0);
INSERT INTO `sys_area` VALUES ('430281', '430200', '醴陵市', '湖南省', '株洲市', '醴陵市', '湖南省株洲市醴陵市', 0);
INSERT INTO `sys_area` VALUES ('430300', '430000', '湘潭市', '湖南省', '湘潭市', '', '湖南省湘潭市', 0);
INSERT INTO `sys_area` VALUES ('430301', '430300', '市辖区', '湖南省', '湘潭市', '市辖区', '湖南省湘潭市市辖区', 0);
INSERT INTO `sys_area` VALUES ('430302', '430300', '雨湖区', '湖南省', '湘潭市', '雨湖区', '湖南省湘潭市雨湖区', 0);
INSERT INTO `sys_area` VALUES ('430304', '430300', '岳塘区', '湖南省', '湘潭市', '岳塘区', '湖南省湘潭市岳塘区', 0);
INSERT INTO `sys_area` VALUES ('430321', '430300', '湘潭县', '湖南省', '湘潭市', '湘潭县', '湖南省湘潭市湘潭县', 0);
INSERT INTO `sys_area` VALUES ('430381', '430300', '湘乡市', '湖南省', '湘潭市', '湘乡市', '湖南省湘潭市湘乡市', 0);
INSERT INTO `sys_area` VALUES ('430382', '430300', '韶山市', '湖南省', '湘潭市', '韶山市', '湖南省湘潭市韶山市', 0);
INSERT INTO `sys_area` VALUES ('430400', '430000', '衡阳市', '湖南省', '衡阳市', '', '湖南省衡阳市', 0);
INSERT INTO `sys_area` VALUES ('430401', '430400', '市辖区', '湖南省', '衡阳市', '市辖区', '湖南省衡阳市市辖区', 0);
INSERT INTO `sys_area` VALUES ('430405', '430400', '珠晖区', '湖南省', '衡阳市', '珠晖区', '湖南省衡阳市珠晖区', 0);
INSERT INTO `sys_area` VALUES ('430406', '430400', '雁峰区', '湖南省', '衡阳市', '雁峰区', '湖南省衡阳市雁峰区', 0);
INSERT INTO `sys_area` VALUES ('430407', '430400', '石鼓区', '湖南省', '衡阳市', '石鼓区', '湖南省衡阳市石鼓区', 0);
INSERT INTO `sys_area` VALUES ('430408', '430400', '蒸湘区', '湖南省', '衡阳市', '蒸湘区', '湖南省衡阳市蒸湘区', 0);
INSERT INTO `sys_area` VALUES ('430412', '430400', '南岳区', '湖南省', '衡阳市', '南岳区', '湖南省衡阳市南岳区', 0);
INSERT INTO `sys_area` VALUES ('430421', '430400', '衡阳县', '湖南省', '衡阳市', '衡阳县', '湖南省衡阳市衡阳县', 0);
INSERT INTO `sys_area` VALUES ('430422', '430400', '衡南县', '湖南省', '衡阳市', '衡南县', '湖南省衡阳市衡南县', 0);
INSERT INTO `sys_area` VALUES ('430423', '430400', '衡山县', '湖南省', '衡阳市', '衡山县', '湖南省衡阳市衡山县', 0);
INSERT INTO `sys_area` VALUES ('430424', '430400', '衡东县', '湖南省', '衡阳市', '衡东县', '湖南省衡阳市衡东县', 0);
INSERT INTO `sys_area` VALUES ('430426', '430400', '祁东县', '湖南省', '衡阳市', '祁东县', '湖南省衡阳市祁东县', 0);
INSERT INTO `sys_area` VALUES ('430481', '430400', '耒阳市', '湖南省', '衡阳市', '耒阳市', '湖南省衡阳市耒阳市', 0);
INSERT INTO `sys_area` VALUES ('430482', '430400', '常宁市', '湖南省', '衡阳市', '常宁市', '湖南省衡阳市常宁市', 0);
INSERT INTO `sys_area` VALUES ('430500', '430000', '邵阳市', '湖南省', '邵阳市', '', '湖南省邵阳市', 0);
INSERT INTO `sys_area` VALUES ('430501', '430500', '市辖区', '湖南省', '邵阳市', '市辖区', '湖南省邵阳市市辖区', 0);
INSERT INTO `sys_area` VALUES ('430502', '430500', '双清区', '湖南省', '邵阳市', '双清区', '湖南省邵阳市双清区', 0);
INSERT INTO `sys_area` VALUES ('430503', '430500', '大祥区', '湖南省', '邵阳市', '大祥区', '湖南省邵阳市大祥区', 0);
INSERT INTO `sys_area` VALUES ('430511', '430500', '北塔区', '湖南省', '邵阳市', '北塔区', '湖南省邵阳市北塔区', 0);
INSERT INTO `sys_area` VALUES ('430521', '430500', '邵东县', '湖南省', '邵阳市', '邵东县', '湖南省邵阳市邵东县', 0);
INSERT INTO `sys_area` VALUES ('430522', '430500', '新邵县', '湖南省', '邵阳市', '新邵县', '湖南省邵阳市新邵县', 0);
INSERT INTO `sys_area` VALUES ('430523', '430500', '邵阳县', '湖南省', '邵阳市', '邵阳县', '湖南省邵阳市邵阳县', 0);
INSERT INTO `sys_area` VALUES ('430524', '430500', '隆回县', '湖南省', '邵阳市', '隆回县', '湖南省邵阳市隆回县', 0);
INSERT INTO `sys_area` VALUES ('430525', '430500', '洞口县', '湖南省', '邵阳市', '洞口县', '湖南省邵阳市洞口县', 0);
INSERT INTO `sys_area` VALUES ('430527', '430500', '绥宁县', '湖南省', '邵阳市', '绥宁县', '湖南省邵阳市绥宁县', 0);
INSERT INTO `sys_area` VALUES ('430528', '430500', '新宁县', '湖南省', '邵阳市', '新宁县', '湖南省邵阳市新宁县', 0);
INSERT INTO `sys_area` VALUES ('430529', '430500', '城步苗族自治县', '湖南省', '邵阳市', '城步苗族自治县', '湖南省邵阳市城步苗族自治县', 0);
INSERT INTO `sys_area` VALUES ('430581', '430500', '武冈市', '湖南省', '邵阳市', '武冈市', '湖南省邵阳市武冈市', 0);
INSERT INTO `sys_area` VALUES ('430600', '430000', '岳阳市', '湖南省', '岳阳市', '', '湖南省岳阳市', 0);
INSERT INTO `sys_area` VALUES ('430601', '430600', '市辖区', '湖南省', '岳阳市', '市辖区', '湖南省岳阳市市辖区', 0);
INSERT INTO `sys_area` VALUES ('430602', '430600', '岳阳楼区', '湖南省', '岳阳市', '岳阳楼区', '湖南省岳阳市岳阳楼区', 0);
INSERT INTO `sys_area` VALUES ('430603', '430600', '云溪区', '湖南省', '岳阳市', '云溪区', '湖南省岳阳市云溪区', 0);
INSERT INTO `sys_area` VALUES ('430611', '430600', '君山区', '湖南省', '岳阳市', '君山区', '湖南省岳阳市君山区', 0);
INSERT INTO `sys_area` VALUES ('430621', '430600', '岳阳县', '湖南省', '岳阳市', '岳阳县', '湖南省岳阳市岳阳县', 0);
INSERT INTO `sys_area` VALUES ('430623', '430600', '华容县', '湖南省', '岳阳市', '华容县', '湖南省岳阳市华容县', 0);
INSERT INTO `sys_area` VALUES ('430624', '430600', '湘阴县', '湖南省', '岳阳市', '湘阴县', '湖南省岳阳市湘阴县', 0);
INSERT INTO `sys_area` VALUES ('430626', '430600', '平江县', '湖南省', '岳阳市', '平江县', '湖南省岳阳市平江县', 0);
INSERT INTO `sys_area` VALUES ('430681', '430600', '汨罗市', '湖南省', '岳阳市', '汨罗市', '湖南省岳阳市汨罗市', 0);
INSERT INTO `sys_area` VALUES ('430682', '430600', '临湘市', '湖南省', '岳阳市', '临湘市', '湖南省岳阳市临湘市', 0);
INSERT INTO `sys_area` VALUES ('430700', '430000', '常德市', '湖南省', '常德市', '', '湖南省常德市', 0);
INSERT INTO `sys_area` VALUES ('430701', '430700', '市辖区', '湖南省', '常德市', '市辖区', '湖南省常德市市辖区', 0);
INSERT INTO `sys_area` VALUES ('430702', '430700', '武陵区', '湖南省', '常德市', '武陵区', '湖南省常德市武陵区', 0);
INSERT INTO `sys_area` VALUES ('430703', '430700', '鼎城区', '湖南省', '常德市', '鼎城区', '湖南省常德市鼎城区', 0);
INSERT INTO `sys_area` VALUES ('430721', '430700', '安乡县', '湖南省', '常德市', '安乡县', '湖南省常德市安乡县', 0);
INSERT INTO `sys_area` VALUES ('430722', '430700', '汉寿县', '湖南省', '常德市', '汉寿县', '湖南省常德市汉寿县', 0);
INSERT INTO `sys_area` VALUES ('430723', '430700', '澧县', '湖南省', '常德市', '澧县', '湖南省常德市澧县', 0);
INSERT INTO `sys_area` VALUES ('430724', '430700', '临澧县', '湖南省', '常德市', '临澧县', '湖南省常德市临澧县', 0);
INSERT INTO `sys_area` VALUES ('430725', '430700', '桃源县', '湖南省', '常德市', '桃源县', '湖南省常德市桃源县', 0);
INSERT INTO `sys_area` VALUES ('430726', '430700', '石门县', '湖南省', '常德市', '石门县', '湖南省常德市石门县', 0);
INSERT INTO `sys_area` VALUES ('430781', '430700', '津市市', '湖南省', '常德市', '津市市', '湖南省常德市津市市', 0);
INSERT INTO `sys_area` VALUES ('430800', '430000', '张家界市', '湖南省', '张家界市', '', '湖南省张家界市', 0);
INSERT INTO `sys_area` VALUES ('430801', '430800', '市辖区', '湖南省', '张家界市', '市辖区', '湖南省张家界市市辖区', 0);
INSERT INTO `sys_area` VALUES ('430802', '430800', '永定区', '湖南省', '张家界市', '永定区', '湖南省张家界市永定区', 0);
INSERT INTO `sys_area` VALUES ('430811', '430800', '武陵源区', '湖南省', '张家界市', '武陵源区', '湖南省张家界市武陵源区', 0);
INSERT INTO `sys_area` VALUES ('430821', '430800', '慈利县', '湖南省', '张家界市', '慈利县', '湖南省张家界市慈利县', 0);
INSERT INTO `sys_area` VALUES ('430822', '430800', '桑植县', '湖南省', '张家界市', '桑植县', '湖南省张家界市桑植县', 0);
INSERT INTO `sys_area` VALUES ('430900', '430000', '益阳市', '湖南省', '益阳市', '', '湖南省益阳市', 0);
INSERT INTO `sys_area` VALUES ('430901', '430900', '市辖区', '湖南省', '益阳市', '市辖区', '湖南省益阳市市辖区', 0);
INSERT INTO `sys_area` VALUES ('430902', '430900', '资阳区', '湖南省', '益阳市', '资阳区', '湖南省益阳市资阳区', 0);
INSERT INTO `sys_area` VALUES ('430903', '430900', '赫山区', '湖南省', '益阳市', '赫山区', '湖南省益阳市赫山区', 0);
INSERT INTO `sys_area` VALUES ('430921', '430900', '南县', '湖南省', '益阳市', '南县', '湖南省益阳市南县', 0);
INSERT INTO `sys_area` VALUES ('430922', '430900', '桃江县', '湖南省', '益阳市', '桃江县', '湖南省益阳市桃江县', 0);
INSERT INTO `sys_area` VALUES ('430923', '430900', '安化县', '湖南省', '益阳市', '安化县', '湖南省益阳市安化县', 0);
INSERT INTO `sys_area` VALUES ('430981', '430900', '沅江市', '湖南省', '益阳市', '沅江市', '湖南省益阳市沅江市', 0);
INSERT INTO `sys_area` VALUES ('431000', '430000', '郴州市', '湖南省', '郴州市', '', '湖南省郴州市', 0);
INSERT INTO `sys_area` VALUES ('431001', '431000', '市辖区', '湖南省', '郴州市', '市辖区', '湖南省郴州市市辖区', 0);
INSERT INTO `sys_area` VALUES ('431002', '431000', '北湖区', '湖南省', '郴州市', '北湖区', '湖南省郴州市北湖区', 0);
INSERT INTO `sys_area` VALUES ('431003', '431000', '苏仙区', '湖南省', '郴州市', '苏仙区', '湖南省郴州市苏仙区', 0);
INSERT INTO `sys_area` VALUES ('431021', '431000', '桂阳县', '湖南省', '郴州市', '桂阳县', '湖南省郴州市桂阳县', 0);
INSERT INTO `sys_area` VALUES ('431022', '431000', '宜章县', '湖南省', '郴州市', '宜章县', '湖南省郴州市宜章县', 0);
INSERT INTO `sys_area` VALUES ('431023', '431000', '永兴县', '湖南省', '郴州市', '永兴县', '湖南省郴州市永兴县', 0);
INSERT INTO `sys_area` VALUES ('431024', '431000', '嘉禾县', '湖南省', '郴州市', '嘉禾县', '湖南省郴州市嘉禾县', 0);
INSERT INTO `sys_area` VALUES ('431025', '431000', '临武县', '湖南省', '郴州市', '临武县', '湖南省郴州市临武县', 0);
INSERT INTO `sys_area` VALUES ('431026', '431000', '汝城县', '湖南省', '郴州市', '汝城县', '湖南省郴州市汝城县', 0);
INSERT INTO `sys_area` VALUES ('431027', '431000', '桂东县', '湖南省', '郴州市', '桂东县', '湖南省郴州市桂东县', 0);
INSERT INTO `sys_area` VALUES ('431028', '431000', '安仁县', '湖南省', '郴州市', '安仁县', '湖南省郴州市安仁县', 0);
INSERT INTO `sys_area` VALUES ('431081', '431000', '资兴市', '湖南省', '郴州市', '资兴市', '湖南省郴州市资兴市', 0);
INSERT INTO `sys_area` VALUES ('431100', '430000', '永州市', '湖南省', '永州市', '', '湖南省永州市', 0);
INSERT INTO `sys_area` VALUES ('431101', '431100', '市辖区', '湖南省', '永州市', '市辖区', '湖南省永州市市辖区', 0);
INSERT INTO `sys_area` VALUES ('431102', '431100', '零陵区', '湖南省', '永州市', '零陵区', '湖南省永州市零陵区', 0);
INSERT INTO `sys_area` VALUES ('431103', '431100', '冷水滩区', '湖南省', '永州市', '冷水滩区', '湖南省永州市冷水滩区', 0);
INSERT INTO `sys_area` VALUES ('431121', '431100', '祁阳县', '湖南省', '永州市', '祁阳县', '湖南省永州市祁阳县', 0);
INSERT INTO `sys_area` VALUES ('431122', '431100', '东安县', '湖南省', '永州市', '东安县', '湖南省永州市东安县', 0);
INSERT INTO `sys_area` VALUES ('431123', '431100', '双牌县', '湖南省', '永州市', '双牌县', '湖南省永州市双牌县', 0);
INSERT INTO `sys_area` VALUES ('431124', '431100', '道县', '湖南省', '永州市', '道县', '湖南省永州市道县', 0);
INSERT INTO `sys_area` VALUES ('431125', '431100', '江永县', '湖南省', '永州市', '江永县', '湖南省永州市江永县', 0);
INSERT INTO `sys_area` VALUES ('431126', '431100', '宁远县', '湖南省', '永州市', '宁远县', '湖南省永州市宁远县', 0);
INSERT INTO `sys_area` VALUES ('431127', '431100', '蓝山县', '湖南省', '永州市', '蓝山县', '湖南省永州市蓝山县', 0);
INSERT INTO `sys_area` VALUES ('431128', '431100', '新田县', '湖南省', '永州市', '新田县', '湖南省永州市新田县', 0);
INSERT INTO `sys_area` VALUES ('431129', '431100', '江华瑶族自治县', '湖南省', '永州市', '江华瑶族自治县', '湖南省永州市江华瑶族自治县', 0);
INSERT INTO `sys_area` VALUES ('431200', '430000', '怀化市', '湖南省', '怀化市', '', '湖南省怀化市', 0);
INSERT INTO `sys_area` VALUES ('431201', '431200', '市辖区', '湖南省', '怀化市', '市辖区', '湖南省怀化市市辖区', 0);
INSERT INTO `sys_area` VALUES ('431202', '431200', '鹤城区', '湖南省', '怀化市', '鹤城区', '湖南省怀化市鹤城区', 0);
INSERT INTO `sys_area` VALUES ('431221', '431200', '中方县', '湖南省', '怀化市', '中方县', '湖南省怀化市中方县', 0);
INSERT INTO `sys_area` VALUES ('431222', '431200', '沅陵县', '湖南省', '怀化市', '沅陵县', '湖南省怀化市沅陵县', 0);
INSERT INTO `sys_area` VALUES ('431223', '431200', '辰溪县', '湖南省', '怀化市', '辰溪县', '湖南省怀化市辰溪县', 0);
INSERT INTO `sys_area` VALUES ('431224', '431200', '溆浦县', '湖南省', '怀化市', '溆浦县', '湖南省怀化市溆浦县', 0);
INSERT INTO `sys_area` VALUES ('431225', '431200', '会同县', '湖南省', '怀化市', '会同县', '湖南省怀化市会同县', 0);
INSERT INTO `sys_area` VALUES ('431226', '431200', '麻阳苗族自治县', '湖南省', '怀化市', '麻阳苗族自治县', '湖南省怀化市麻阳苗族自治县', 0);
INSERT INTO `sys_area` VALUES ('431227', '431200', '新晃侗族自治县', '湖南省', '怀化市', '新晃侗族自治县', '湖南省怀化市新晃侗族自治县', 0);
INSERT INTO `sys_area` VALUES ('431228', '431200', '芷江侗族自治县', '湖南省', '怀化市', '芷江侗族自治县', '湖南省怀化市芷江侗族自治县', 0);
INSERT INTO `sys_area` VALUES ('431229', '431200', '靖州苗族侗族自治县', '湖南省', '怀化市', '靖州苗族侗族自治县', '湖南省怀化市靖州苗族侗族自治县', 0);
INSERT INTO `sys_area` VALUES ('431230', '431200', '通道侗族自治县', '湖南省', '怀化市', '通道侗族自治县', '湖南省怀化市通道侗族自治县', 0);
INSERT INTO `sys_area` VALUES ('431281', '431200', '洪江市', '湖南省', '怀化市', '洪江市', '湖南省怀化市洪江市', 0);
INSERT INTO `sys_area` VALUES ('431300', '430000', '娄底市', '湖南省', '娄底市', '', '湖南省娄底市', 0);
INSERT INTO `sys_area` VALUES ('431301', '431300', '市辖区', '湖南省', '娄底市', '市辖区', '湖南省娄底市市辖区', 0);
INSERT INTO `sys_area` VALUES ('431302', '431300', '娄星区', '湖南省', '娄底市', '娄星区', '湖南省娄底市娄星区', 0);
INSERT INTO `sys_area` VALUES ('431321', '431300', '双峰县', '湖南省', '娄底市', '双峰县', '湖南省娄底市双峰县', 0);
INSERT INTO `sys_area` VALUES ('431322', '431300', '新化县', '湖南省', '娄底市', '新化县', '湖南省娄底市新化县', 0);
INSERT INTO `sys_area` VALUES ('431381', '431300', '冷水江市', '湖南省', '娄底市', '冷水江市', '湖南省娄底市冷水江市', 0);
INSERT INTO `sys_area` VALUES ('431382', '431300', '涟源市', '湖南省', '娄底市', '涟源市', '湖南省娄底市涟源市', 0);
INSERT INTO `sys_area` VALUES ('433100', '430000', '湘西土家族苗族自治州', '湖南省', '湘西土家族苗族自治州', '', '湖南省湘西土家族苗族自治州', 0);
INSERT INTO `sys_area` VALUES ('433101', '433100', '吉首市', '湖南省', '湘西土家族苗族自治州', '吉首市', '湖南省湘西土家族苗族自治州吉首市', 0);
INSERT INTO `sys_area` VALUES ('433122', '433100', '泸溪县', '湖南省', '湘西土家族苗族自治州', '泸溪县', '湖南省湘西土家族苗族自治州泸溪县', 0);
INSERT INTO `sys_area` VALUES ('433123', '433100', '凤凰县', '湖南省', '湘西土家族苗族自治州', '凤凰县', '湖南省湘西土家族苗族自治州凤凰县', 0);
INSERT INTO `sys_area` VALUES ('433124', '433100', '花垣县', '湖南省', '湘西土家族苗族自治州', '花垣县', '湖南省湘西土家族苗族自治州花垣县', 0);
INSERT INTO `sys_area` VALUES ('433125', '433100', '保靖县', '湖南省', '湘西土家族苗族自治州', '保靖县', '湖南省湘西土家族苗族自治州保靖县', 0);
INSERT INTO `sys_area` VALUES ('433126', '433100', '古丈县', '湖南省', '湘西土家族苗族自治州', '古丈县', '湖南省湘西土家族苗族自治州古丈县', 0);
INSERT INTO `sys_area` VALUES ('433127', '433100', '永顺县', '湖南省', '湘西土家族苗族自治州', '永顺县', '湖南省湘西土家族苗族自治州永顺县', 0);
INSERT INTO `sys_area` VALUES ('433130', '433100', '龙山县', '湖南省', '湘西土家族苗族自治州', '龙山县', '湖南省湘西土家族苗族自治州龙山县', 0);
INSERT INTO `sys_area` VALUES ('440000', '86', '广东省', '广东省', '', '', '广东省', 0);
INSERT INTO `sys_area` VALUES ('440100', '440000', '广州市', '广东省', '广州市', '', '广东省广州市', 0);
INSERT INTO `sys_area` VALUES ('440101', '440100', '市辖区', '广东省', '广州市', '市辖区', '广东省广州市市辖区', 0);
INSERT INTO `sys_area` VALUES ('440103', '440100', '荔湾区', '广东省', '广州市', '荔湾区', '广东省广州市荔湾区', 0);
INSERT INTO `sys_area` VALUES ('440104', '440100', '越秀区', '广东省', '广州市', '越秀区', '广东省广州市越秀区', 0);
INSERT INTO `sys_area` VALUES ('440105', '440100', '海珠区', '广东省', '广州市', '海珠区', '广东省广州市海珠区', 0);
INSERT INTO `sys_area` VALUES ('440106', '440100', '天河区', '广东省', '广州市', '天河区', '广东省广州市天河区', 0);
INSERT INTO `sys_area` VALUES ('440111', '440100', '白云区', '广东省', '广州市', '白云区', '广东省广州市白云区', 0);
INSERT INTO `sys_area` VALUES ('440112', '440100', '黄埔区', '广东省', '广州市', '黄埔区', '广东省广州市黄埔区', 0);
INSERT INTO `sys_area` VALUES ('440113', '440100', '番禺区', '广东省', '广州市', '番禺区', '广东省广州市番禺区', 0);
INSERT INTO `sys_area` VALUES ('440114', '440100', '花都区', '广东省', '广州市', '花都区', '广东省广州市花都区', 0);
INSERT INTO `sys_area` VALUES ('440115', '440100', '南沙区', '广东省', '广州市', '南沙区', '广东省广州市南沙区', 0);
INSERT INTO `sys_area` VALUES ('440117', '440100', '从化区', '广东省', '广州市', '从化区', '广东省广州市从化区', 0);
INSERT INTO `sys_area` VALUES ('440118', '440100', '增城区', '广东省', '广州市', '增城区', '广东省广州市增城区', 0);
INSERT INTO `sys_area` VALUES ('440200', '440000', '韶关市', '广东省', '韶关市', '', '广东省韶关市', 0);
INSERT INTO `sys_area` VALUES ('440201', '440200', '市辖区', '广东省', '韶关市', '市辖区', '广东省韶关市市辖区', 0);
INSERT INTO `sys_area` VALUES ('440203', '440200', '武江区', '广东省', '韶关市', '武江区', '广东省韶关市武江区', 0);
INSERT INTO `sys_area` VALUES ('440204', '440200', '浈江区', '广东省', '韶关市', '浈江区', '广东省韶关市浈江区', 0);
INSERT INTO `sys_area` VALUES ('440205', '440200', '曲江区', '广东省', '韶关市', '曲江区', '广东省韶关市曲江区', 0);
INSERT INTO `sys_area` VALUES ('440222', '440200', '始兴县', '广东省', '韶关市', '始兴县', '广东省韶关市始兴县', 0);
INSERT INTO `sys_area` VALUES ('440224', '440200', '仁化县', '广东省', '韶关市', '仁化县', '广东省韶关市仁化县', 0);
INSERT INTO `sys_area` VALUES ('440229', '440200', '翁源县', '广东省', '韶关市', '翁源县', '广东省韶关市翁源县', 0);
INSERT INTO `sys_area` VALUES ('440232', '440200', '乳源瑶族自治县', '广东省', '韶关市', '乳源瑶族自治县', '广东省韶关市乳源瑶族自治县', 0);
INSERT INTO `sys_area` VALUES ('440233', '440200', '新丰县', '广东省', '韶关市', '新丰县', '广东省韶关市新丰县', 0);
INSERT INTO `sys_area` VALUES ('440281', '440200', '乐昌市', '广东省', '韶关市', '乐昌市', '广东省韶关市乐昌市', 0);
INSERT INTO `sys_area` VALUES ('440282', '440200', '南雄市', '广东省', '韶关市', '南雄市', '广东省韶关市南雄市', 0);
INSERT INTO `sys_area` VALUES ('440300', '440000', '深圳市', '广东省', '深圳市', '', '广东省深圳市', 0);
INSERT INTO `sys_area` VALUES ('440301', '440300', '市辖区', '广东省', '深圳市', '市辖区', '广东省深圳市市辖区', 0);
INSERT INTO `sys_area` VALUES ('440303', '440300', '罗湖区', '广东省', '深圳市', '罗湖区', '广东省深圳市罗湖区', 0);
INSERT INTO `sys_area` VALUES ('440304', '440300', '福田区', '广东省', '深圳市', '福田区', '广东省深圳市福田区', 0);
INSERT INTO `sys_area` VALUES ('440305', '440300', '南山区', '广东省', '深圳市', '南山区', '广东省深圳市南山区', 0);
INSERT INTO `sys_area` VALUES ('440306', '440300', '宝安区', '广东省', '深圳市', '宝安区', '广东省深圳市宝安区', 0);
INSERT INTO `sys_area` VALUES ('440307', '440300', '龙岗区', '广东省', '深圳市', '龙岗区', '广东省深圳市龙岗区', 0);
INSERT INTO `sys_area` VALUES ('440308', '440300', '盐田区', '广东省', '深圳市', '盐田区', '广东省深圳市盐田区', 0);
INSERT INTO `sys_area` VALUES ('440400', '440000', '珠海市', '广东省', '珠海市', '', '广东省珠海市', 0);
INSERT INTO `sys_area` VALUES ('440401', '440400', '市辖区', '广东省', '珠海市', '市辖区', '广东省珠海市市辖区', 0);
INSERT INTO `sys_area` VALUES ('440402', '440400', '香洲区', '广东省', '珠海市', '香洲区', '广东省珠海市香洲区', 0);
INSERT INTO `sys_area` VALUES ('440403', '440400', '斗门区', '广东省', '珠海市', '斗门区', '广东省珠海市斗门区', 0);
INSERT INTO `sys_area` VALUES ('440404', '440400', '金湾区', '广东省', '珠海市', '金湾区', '广东省珠海市金湾区', 0);
INSERT INTO `sys_area` VALUES ('440500', '440000', '汕头市', '广东省', '汕头市', '', '广东省汕头市', 0);
INSERT INTO `sys_area` VALUES ('440501', '440500', '市辖区', '广东省', '汕头市', '市辖区', '广东省汕头市市辖区', 0);
INSERT INTO `sys_area` VALUES ('440507', '440500', '龙湖区', '广东省', '汕头市', '龙湖区', '广东省汕头市龙湖区', 0);
INSERT INTO `sys_area` VALUES ('440511', '440500', '金平区', '广东省', '汕头市', '金平区', '广东省汕头市金平区', 0);
INSERT INTO `sys_area` VALUES ('440512', '440500', '濠江区', '广东省', '汕头市', '濠江区', '广东省汕头市濠江区', 0);
INSERT INTO `sys_area` VALUES ('440513', '440500', '潮阳区', '广东省', '汕头市', '潮阳区', '广东省汕头市潮阳区', 0);
INSERT INTO `sys_area` VALUES ('440514', '440500', '潮南区', '广东省', '汕头市', '潮南区', '广东省汕头市潮南区', 0);
INSERT INTO `sys_area` VALUES ('440515', '440500', '澄海区', '广东省', '汕头市', '澄海区', '广东省汕头市澄海区', 0);
INSERT INTO `sys_area` VALUES ('440523', '440500', '南澳县', '广东省', '汕头市', '南澳县', '广东省汕头市南澳县', 0);
INSERT INTO `sys_area` VALUES ('440600', '440000', '佛山市', '广东省', '佛山市', '', '广东省佛山市', 0);
INSERT INTO `sys_area` VALUES ('440601', '440600', '市辖区', '广东省', '佛山市', '市辖区', '广东省佛山市市辖区', 0);
INSERT INTO `sys_area` VALUES ('440604', '440600', '禅城区', '广东省', '佛山市', '禅城区', '广东省佛山市禅城区', 0);
INSERT INTO `sys_area` VALUES ('440605', '440600', '南海区', '广东省', '佛山市', '南海区', '广东省佛山市南海区', 0);
INSERT INTO `sys_area` VALUES ('440606', '440600', '顺德区', '广东省', '佛山市', '顺德区', '广东省佛山市顺德区', 0);
INSERT INTO `sys_area` VALUES ('440607', '440600', '三水区', '广东省', '佛山市', '三水区', '广东省佛山市三水区', 0);
INSERT INTO `sys_area` VALUES ('440608', '440600', '高明区', '广东省', '佛山市', '高明区', '广东省佛山市高明区', 0);
INSERT INTO `sys_area` VALUES ('440700', '440000', '江门市', '广东省', '江门市', '', '广东省江门市', 0);
INSERT INTO `sys_area` VALUES ('440701', '440700', '市辖区', '广东省', '江门市', '市辖区', '广东省江门市市辖区', 0);
INSERT INTO `sys_area` VALUES ('440703', '440700', '蓬江区', '广东省', '江门市', '蓬江区', '广东省江门市蓬江区', 0);
INSERT INTO `sys_area` VALUES ('440704', '440700', '江海区', '广东省', '江门市', '江海区', '广东省江门市江海区', 0);
INSERT INTO `sys_area` VALUES ('440705', '440700', '新会区', '广东省', '江门市', '新会区', '广东省江门市新会区', 0);
INSERT INTO `sys_area` VALUES ('440781', '440700', '台山市', '广东省', '江门市', '台山市', '广东省江门市台山市', 0);
INSERT INTO `sys_area` VALUES ('440783', '440700', '开平市', '广东省', '江门市', '开平市', '广东省江门市开平市', 0);
INSERT INTO `sys_area` VALUES ('440784', '440700', '鹤山市', '广东省', '江门市', '鹤山市', '广东省江门市鹤山市', 0);
INSERT INTO `sys_area` VALUES ('440785', '440700', '恩平市', '广东省', '江门市', '恩平市', '广东省江门市恩平市', 0);
INSERT INTO `sys_area` VALUES ('440800', '440000', '湛江市', '广东省', '湛江市', '', '广东省湛江市', 0);
INSERT INTO `sys_area` VALUES ('440801', '440800', '市辖区', '广东省', '湛江市', '市辖区', '广东省湛江市市辖区', 0);
INSERT INTO `sys_area` VALUES ('440802', '440800', '赤坎区', '广东省', '湛江市', '赤坎区', '广东省湛江市赤坎区', 0);
INSERT INTO `sys_area` VALUES ('440803', '440800', '霞山区', '广东省', '湛江市', '霞山区', '广东省湛江市霞山区', 0);
INSERT INTO `sys_area` VALUES ('440804', '440800', '坡头区', '广东省', '湛江市', '坡头区', '广东省湛江市坡头区', 0);
INSERT INTO `sys_area` VALUES ('440811', '440800', '麻章区', '广东省', '湛江市', '麻章区', '广东省湛江市麻章区', 0);
INSERT INTO `sys_area` VALUES ('440823', '440800', '遂溪县', '广东省', '湛江市', '遂溪县', '广东省湛江市遂溪县', 0);
INSERT INTO `sys_area` VALUES ('440825', '440800', '徐闻县', '广东省', '湛江市', '徐闻县', '广东省湛江市徐闻县', 0);
INSERT INTO `sys_area` VALUES ('440881', '440800', '廉江市', '广东省', '湛江市', '廉江市', '广东省湛江市廉江市', 0);
INSERT INTO `sys_area` VALUES ('440882', '440800', '雷州市', '广东省', '湛江市', '雷州市', '广东省湛江市雷州市', 0);
INSERT INTO `sys_area` VALUES ('440883', '440800', '吴川市', '广东省', '湛江市', '吴川市', '广东省湛江市吴川市', 0);
INSERT INTO `sys_area` VALUES ('440900', '440000', '茂名市', '广东省', '茂名市', '', '广东省茂名市', 0);
INSERT INTO `sys_area` VALUES ('440901', '440900', '市辖区', '广东省', '茂名市', '市辖区', '广东省茂名市市辖区', 0);
INSERT INTO `sys_area` VALUES ('440902', '440900', '茂南区', '广东省', '茂名市', '茂南区', '广东省茂名市茂南区', 0);
INSERT INTO `sys_area` VALUES ('440904', '440900', '电白区', '广东省', '茂名市', '电白区', '广东省茂名市电白区', 0);
INSERT INTO `sys_area` VALUES ('440981', '440900', '高州市', '广东省', '茂名市', '高州市', '广东省茂名市高州市', 0);
INSERT INTO `sys_area` VALUES ('440982', '440900', '化州市', '广东省', '茂名市', '化州市', '广东省茂名市化州市', 0);
INSERT INTO `sys_area` VALUES ('440983', '440900', '信宜市', '广东省', '茂名市', '信宜市', '广东省茂名市信宜市', 0);
INSERT INTO `sys_area` VALUES ('441200', '440000', '肇庆市', '广东省', '肇庆市', '', '广东省肇庆市', 0);
INSERT INTO `sys_area` VALUES ('441201', '441200', '市辖区', '广东省', '肇庆市', '市辖区', '广东省肇庆市市辖区', 0);
INSERT INTO `sys_area` VALUES ('441202', '441200', '端州区', '广东省', '肇庆市', '端州区', '广东省肇庆市端州区', 0);
INSERT INTO `sys_area` VALUES ('441203', '441200', '鼎湖区', '广东省', '肇庆市', '鼎湖区', '广东省肇庆市鼎湖区', 0);
INSERT INTO `sys_area` VALUES ('441204', '441200', '高要区', '广东省', '肇庆市', '高要区', '广东省肇庆市高要区', 0);
INSERT INTO `sys_area` VALUES ('441223', '441200', '广宁县', '广东省', '肇庆市', '广宁县', '广东省肇庆市广宁县', 0);
INSERT INTO `sys_area` VALUES ('441224', '441200', '怀集县', '广东省', '肇庆市', '怀集县', '广东省肇庆市怀集县', 0);
INSERT INTO `sys_area` VALUES ('441225', '441200', '封开县', '广东省', '肇庆市', '封开县', '广东省肇庆市封开县', 0);
INSERT INTO `sys_area` VALUES ('441226', '441200', '德庆县', '广东省', '肇庆市', '德庆县', '广东省肇庆市德庆县', 0);
INSERT INTO `sys_area` VALUES ('441284', '441200', '四会市', '广东省', '肇庆市', '四会市', '广东省肇庆市四会市', 0);
INSERT INTO `sys_area` VALUES ('441300', '440000', '惠州市', '广东省', '惠州市', '', '广东省惠州市', 0);
INSERT INTO `sys_area` VALUES ('441301', '441300', '市辖区', '广东省', '惠州市', '市辖区', '广东省惠州市市辖区', 0);
INSERT INTO `sys_area` VALUES ('441302', '441300', '惠城区', '广东省', '惠州市', '惠城区', '广东省惠州市惠城区', 0);
INSERT INTO `sys_area` VALUES ('441303', '441300', '惠阳区', '广东省', '惠州市', '惠阳区', '广东省惠州市惠阳区', 0);
INSERT INTO `sys_area` VALUES ('441322', '441300', '博罗县', '广东省', '惠州市', '博罗县', '广东省惠州市博罗县', 0);
INSERT INTO `sys_area` VALUES ('441323', '441300', '惠东县', '广东省', '惠州市', '惠东县', '广东省惠州市惠东县', 0);
INSERT INTO `sys_area` VALUES ('441324', '441300', '龙门县', '广东省', '惠州市', '龙门县', '广东省惠州市龙门县', 0);
INSERT INTO `sys_area` VALUES ('441400', '440000', '梅州市', '广东省', '梅州市', '', '广东省梅州市', 0);
INSERT INTO `sys_area` VALUES ('441401', '441400', '市辖区', '广东省', '梅州市', '市辖区', '广东省梅州市市辖区', 0);
INSERT INTO `sys_area` VALUES ('441402', '441400', '梅江区', '广东省', '梅州市', '梅江区', '广东省梅州市梅江区', 0);
INSERT INTO `sys_area` VALUES ('441403', '441400', '梅县区', '广东省', '梅州市', '梅县区', '广东省梅州市梅县区', 0);
INSERT INTO `sys_area` VALUES ('441422', '441400', '大埔县', '广东省', '梅州市', '大埔县', '广东省梅州市大埔县', 0);
INSERT INTO `sys_area` VALUES ('441423', '441400', '丰顺县', '广东省', '梅州市', '丰顺县', '广东省梅州市丰顺县', 0);
INSERT INTO `sys_area` VALUES ('441424', '441400', '五华县', '广东省', '梅州市', '五华县', '广东省梅州市五华县', 0);
INSERT INTO `sys_area` VALUES ('441426', '441400', '平远县', '广东省', '梅州市', '平远县', '广东省梅州市平远县', 0);
INSERT INTO `sys_area` VALUES ('441427', '441400', '蕉岭县', '广东省', '梅州市', '蕉岭县', '广东省梅州市蕉岭县', 0);
INSERT INTO `sys_area` VALUES ('441481', '441400', '兴宁市', '广东省', '梅州市', '兴宁市', '广东省梅州市兴宁市', 0);
INSERT INTO `sys_area` VALUES ('441500', '440000', '汕尾市', '广东省', '汕尾市', '', '广东省汕尾市', 0);
INSERT INTO `sys_area` VALUES ('441501', '441500', '市辖区', '广东省', '汕尾市', '市辖区', '广东省汕尾市市辖区', 0);
INSERT INTO `sys_area` VALUES ('441502', '441500', '城区', '广东省', '汕尾市', '城区', '广东省汕尾市城区', 0);
INSERT INTO `sys_area` VALUES ('441521', '441500', '海丰县', '广东省', '汕尾市', '海丰县', '广东省汕尾市海丰县', 0);
INSERT INTO `sys_area` VALUES ('441523', '441500', '陆河县', '广东省', '汕尾市', '陆河县', '广东省汕尾市陆河县', 0);
INSERT INTO `sys_area` VALUES ('441581', '441500', '陆丰市', '广东省', '汕尾市', '陆丰市', '广东省汕尾市陆丰市', 0);
INSERT INTO `sys_area` VALUES ('441600', '440000', '河源市', '广东省', '河源市', '', '广东省河源市', 0);
INSERT INTO `sys_area` VALUES ('441601', '441600', '市辖区', '广东省', '河源市', '市辖区', '广东省河源市市辖区', 0);
INSERT INTO `sys_area` VALUES ('441602', '441600', '源城区', '广东省', '河源市', '源城区', '广东省河源市源城区', 0);
INSERT INTO `sys_area` VALUES ('441621', '441600', '紫金县', '广东省', '河源市', '紫金县', '广东省河源市紫金县', 0);
INSERT INTO `sys_area` VALUES ('441622', '441600', '龙川县', '广东省', '河源市', '龙川县', '广东省河源市龙川县', 0);
INSERT INTO `sys_area` VALUES ('441623', '441600', '连平县', '广东省', '河源市', '连平县', '广东省河源市连平县', 0);
INSERT INTO `sys_area` VALUES ('441624', '441600', '和平县', '广东省', '河源市', '和平县', '广东省河源市和平县', 0);
INSERT INTO `sys_area` VALUES ('441625', '441600', '东源县', '广东省', '河源市', '东源县', '广东省河源市东源县', 0);
INSERT INTO `sys_area` VALUES ('441700', '440000', '阳江市', '广东省', '阳江市', '', '广东省阳江市', 0);
INSERT INTO `sys_area` VALUES ('441701', '441700', '市辖区', '广东省', '阳江市', '市辖区', '广东省阳江市市辖区', 0);
INSERT INTO `sys_area` VALUES ('441702', '441700', '江城区', '广东省', '阳江市', '江城区', '广东省阳江市江城区', 0);
INSERT INTO `sys_area` VALUES ('441704', '441700', '阳东区', '广东省', '阳江市', '阳东区', '广东省阳江市阳东区', 0);
INSERT INTO `sys_area` VALUES ('441721', '441700', '阳西县', '广东省', '阳江市', '阳西县', '广东省阳江市阳西县', 0);
INSERT INTO `sys_area` VALUES ('441781', '441700', '阳春市', '广东省', '阳江市', '阳春市', '广东省阳江市阳春市', 0);
INSERT INTO `sys_area` VALUES ('441800', '440000', '清远市', '广东省', '清远市', '', '广东省清远市', 0);
INSERT INTO `sys_area` VALUES ('441801', '441800', '市辖区', '广东省', '清远市', '市辖区', '广东省清远市市辖区', 0);
INSERT INTO `sys_area` VALUES ('441802', '441800', '清城区', '广东省', '清远市', '清城区', '广东省清远市清城区', 0);
INSERT INTO `sys_area` VALUES ('441803', '441800', '清新区', '广东省', '清远市', '清新区', '广东省清远市清新区', 0);
INSERT INTO `sys_area` VALUES ('441821', '441800', '佛冈县', '广东省', '清远市', '佛冈县', '广东省清远市佛冈县', 0);
INSERT INTO `sys_area` VALUES ('441823', '441800', '阳山县', '广东省', '清远市', '阳山县', '广东省清远市阳山县', 0);
INSERT INTO `sys_area` VALUES ('441825', '441800', '连山壮族瑶族自治县', '广东省', '清远市', '连山壮族瑶族自治县', '广东省清远市连山壮族瑶族自治县', 0);
INSERT INTO `sys_area` VALUES ('441826', '441800', '连南瑶族自治县', '广东省', '清远市', '连南瑶族自治县', '广东省清远市连南瑶族自治县', 0);
INSERT INTO `sys_area` VALUES ('441881', '441800', '英德市', '广东省', '清远市', '英德市', '广东省清远市英德市', 0);
INSERT INTO `sys_area` VALUES ('441882', '441800', '连州市', '广东省', '清远市', '连州市', '广东省清远市连州市', 0);
INSERT INTO `sys_area` VALUES ('441900', '440000', '东莞市', '广东省', '东莞市', '', '广东省东莞市', 0);
INSERT INTO `sys_area` VALUES ('442000', '440000', '中山市', '广东省', '中山市', '', '广东省中山市', 0);
INSERT INTO `sys_area` VALUES ('445100', '440000', '潮州市', '广东省', '潮州市', '', '广东省潮州市', 0);
INSERT INTO `sys_area` VALUES ('445101', '445100', '市辖区', '广东省', '潮州市', '市辖区', '广东省潮州市市辖区', 0);
INSERT INTO `sys_area` VALUES ('445102', '445100', '湘桥区', '广东省', '潮州市', '湘桥区', '广东省潮州市湘桥区', 0);
INSERT INTO `sys_area` VALUES ('445103', '445100', '潮安区', '广东省', '潮州市', '潮安区', '广东省潮州市潮安区', 0);
INSERT INTO `sys_area` VALUES ('445122', '445100', '饶平县', '广东省', '潮州市', '饶平县', '广东省潮州市饶平县', 0);
INSERT INTO `sys_area` VALUES ('445200', '440000', '揭阳市', '广东省', '揭阳市', '', '广东省揭阳市', 0);
INSERT INTO `sys_area` VALUES ('445201', '445200', '市辖区', '广东省', '揭阳市', '市辖区', '广东省揭阳市市辖区', 0);
INSERT INTO `sys_area` VALUES ('445202', '445200', '榕城区', '广东省', '揭阳市', '榕城区', '广东省揭阳市榕城区', 0);
INSERT INTO `sys_area` VALUES ('445203', '445200', '揭东区', '广东省', '揭阳市', '揭东区', '广东省揭阳市揭东区', 0);
INSERT INTO `sys_area` VALUES ('445222', '445200', '揭西县', '广东省', '揭阳市', '揭西县', '广东省揭阳市揭西县', 0);
INSERT INTO `sys_area` VALUES ('445224', '445200', '惠来县', '广东省', '揭阳市', '惠来县', '广东省揭阳市惠来县', 0);
INSERT INTO `sys_area` VALUES ('445281', '445200', '普宁市', '广东省', '揭阳市', '普宁市', '广东省揭阳市普宁市', 0);
INSERT INTO `sys_area` VALUES ('445300', '440000', '云浮市', '广东省', '云浮市', '', '广东省云浮市', 0);
INSERT INTO `sys_area` VALUES ('445301', '445300', '市辖区', '广东省', '云浮市', '市辖区', '广东省云浮市市辖区', 0);
INSERT INTO `sys_area` VALUES ('445302', '445300', '云城区', '广东省', '云浮市', '云城区', '广东省云浮市云城区', 0);
INSERT INTO `sys_area` VALUES ('445303', '445300', '云安区', '广东省', '云浮市', '云安区', '广东省云浮市云安区', 0);
INSERT INTO `sys_area` VALUES ('445321', '445300', '新兴县', '广东省', '云浮市', '新兴县', '广东省云浮市新兴县', 0);
INSERT INTO `sys_area` VALUES ('445322', '445300', '郁南县', '广东省', '云浮市', '郁南县', '广东省云浮市郁南县', 0);
INSERT INTO `sys_area` VALUES ('445381', '445300', '罗定市', '广东省', '云浮市', '罗定市', '广东省云浮市罗定市', 0);
INSERT INTO `sys_area` VALUES ('450000', '86', '广西壮族自治区', '广西壮族自治区', '', '', '广西壮族自治区', 0);
INSERT INTO `sys_area` VALUES ('450100', '450000', '南宁市', '广西壮族自治区', '南宁市', '', '广西壮族自治区南宁市', 0);
INSERT INTO `sys_area` VALUES ('450101', '450100', '市辖区', '广西壮族自治区', '南宁市', '市辖区', '广西壮族自治区南宁市市辖区', 0);
INSERT INTO `sys_area` VALUES ('450102', '450100', '兴宁区', '广西壮族自治区', '南宁市', '兴宁区', '广西壮族自治区南宁市兴宁区', 0);
INSERT INTO `sys_area` VALUES ('450103', '450100', '青秀区', '广西壮族自治区', '南宁市', '青秀区', '广西壮族自治区南宁市青秀区', 0);
INSERT INTO `sys_area` VALUES ('450105', '450100', '江南区', '广西壮族自治区', '南宁市', '江南区', '广西壮族自治区南宁市江南区', 0);
INSERT INTO `sys_area` VALUES ('450107', '450100', '西乡塘区', '广西壮族自治区', '南宁市', '西乡塘区', '广西壮族自治区南宁市西乡塘区', 0);
INSERT INTO `sys_area` VALUES ('450108', '450100', '良庆区', '广西壮族自治区', '南宁市', '良庆区', '广西壮族自治区南宁市良庆区', 0);
INSERT INTO `sys_area` VALUES ('450109', '450100', '邕宁区', '广西壮族自治区', '南宁市', '邕宁区', '广西壮族自治区南宁市邕宁区', 0);
INSERT INTO `sys_area` VALUES ('450110', '450100', '武鸣区', '广西壮族自治区', '南宁市', '武鸣区', '广西壮族自治区南宁市武鸣区', 0);
INSERT INTO `sys_area` VALUES ('450123', '450100', '隆安县', '广西壮族自治区', '南宁市', '隆安县', '广西壮族自治区南宁市隆安县', 0);
INSERT INTO `sys_area` VALUES ('450124', '450100', '马山县', '广西壮族自治区', '南宁市', '马山县', '广西壮族自治区南宁市马山县', 0);
INSERT INTO `sys_area` VALUES ('450125', '450100', '上林县', '广西壮族自治区', '南宁市', '上林县', '广西壮族自治区南宁市上林县', 0);
INSERT INTO `sys_area` VALUES ('450126', '450100', '宾阳县', '广西壮族自治区', '南宁市', '宾阳县', '广西壮族自治区南宁市宾阳县', 0);
INSERT INTO `sys_area` VALUES ('450127', '450100', '横县', '广西壮族自治区', '南宁市', '横县', '广西壮族自治区南宁市横县', 0);
INSERT INTO `sys_area` VALUES ('450200', '450000', '柳州市', '广西壮族自治区', '柳州市', '', '广西壮族自治区柳州市', 0);
INSERT INTO `sys_area` VALUES ('450201', '450200', '市辖区', '广西壮族自治区', '柳州市', '市辖区', '广西壮族自治区柳州市市辖区', 0);
INSERT INTO `sys_area` VALUES ('450202', '450200', '城中区', '广西壮族自治区', '柳州市', '城中区', '广西壮族自治区柳州市城中区', 0);
INSERT INTO `sys_area` VALUES ('450203', '450200', '鱼峰区', '广西壮族自治区', '柳州市', '鱼峰区', '广西壮族自治区柳州市鱼峰区', 0);
INSERT INTO `sys_area` VALUES ('450204', '450200', '柳南区', '广西壮族自治区', '柳州市', '柳南区', '广西壮族自治区柳州市柳南区', 0);
INSERT INTO `sys_area` VALUES ('450205', '450200', '柳北区', '广西壮族自治区', '柳州市', '柳北区', '广西壮族自治区柳州市柳北区', 0);
INSERT INTO `sys_area` VALUES ('450206', '450200', '柳江区', '广西壮族自治区', '柳州市', '柳江区', '广西壮族自治区柳州市柳江区', 0);
INSERT INTO `sys_area` VALUES ('450222', '450200', '柳城县', '广西壮族自治区', '柳州市', '柳城县', '广西壮族自治区柳州市柳城县', 0);
INSERT INTO `sys_area` VALUES ('450223', '450200', '鹿寨县', '广西壮族自治区', '柳州市', '鹿寨县', '广西壮族自治区柳州市鹿寨县', 0);
INSERT INTO `sys_area` VALUES ('450224', '450200', '融安县', '广西壮族自治区', '柳州市', '融安县', '广西壮族自治区柳州市融安县', 0);
INSERT INTO `sys_area` VALUES ('450225', '450200', '融水苗族自治县', '广西壮族自治区', '柳州市', '融水苗族自治县', '广西壮族自治区柳州市融水苗族自治县', 0);
INSERT INTO `sys_area` VALUES ('450226', '450200', '三江侗族自治县', '广西壮族自治区', '柳州市', '三江侗族自治县', '广西壮族自治区柳州市三江侗族自治县', 0);
INSERT INTO `sys_area` VALUES ('450300', '450000', '桂林市', '广西壮族自治区', '桂林市', '', '广西壮族自治区桂林市', 0);
INSERT INTO `sys_area` VALUES ('450301', '450300', '市辖区', '广西壮族自治区', '桂林市', '市辖区', '广西壮族自治区桂林市市辖区', 0);
INSERT INTO `sys_area` VALUES ('450302', '450300', '秀峰区', '广西壮族自治区', '桂林市', '秀峰区', '广西壮族自治区桂林市秀峰区', 0);
INSERT INTO `sys_area` VALUES ('450303', '450300', '叠彩区', '广西壮族自治区', '桂林市', '叠彩区', '广西壮族自治区桂林市叠彩区', 0);
INSERT INTO `sys_area` VALUES ('450304', '450300', '象山区', '广西壮族自治区', '桂林市', '象山区', '广西壮族自治区桂林市象山区', 0);
INSERT INTO `sys_area` VALUES ('450305', '450300', '七星区', '广西壮族自治区', '桂林市', '七星区', '广西壮族自治区桂林市七星区', 0);
INSERT INTO `sys_area` VALUES ('450311', '450300', '雁山区', '广西壮族自治区', '桂林市', '雁山区', '广西壮族自治区桂林市雁山区', 0);
INSERT INTO `sys_area` VALUES ('450312', '450300', '临桂区', '广西壮族自治区', '桂林市', '临桂区', '广西壮族自治区桂林市临桂区', 0);
INSERT INTO `sys_area` VALUES ('450321', '450300', '阳朔县', '广西壮族自治区', '桂林市', '阳朔县', '广西壮族自治区桂林市阳朔县', 0);
INSERT INTO `sys_area` VALUES ('450323', '450300', '灵川县', '广西壮族自治区', '桂林市', '灵川县', '广西壮族自治区桂林市灵川县', 0);
INSERT INTO `sys_area` VALUES ('450324', '450300', '全州县', '广西壮族自治区', '桂林市', '全州县', '广西壮族自治区桂林市全州县', 0);
INSERT INTO `sys_area` VALUES ('450325', '450300', '兴安县', '广西壮族自治区', '桂林市', '兴安县', '广西壮族自治区桂林市兴安县', 0);
INSERT INTO `sys_area` VALUES ('450326', '450300', '永福县', '广西壮族自治区', '桂林市', '永福县', '广西壮族自治区桂林市永福县', 0);
INSERT INTO `sys_area` VALUES ('450327', '450300', '灌阳县', '广西壮族自治区', '桂林市', '灌阳县', '广西壮族自治区桂林市灌阳县', 0);
INSERT INTO `sys_area` VALUES ('450328', '450300', '龙胜各族自治县', '广西壮族自治区', '桂林市', '龙胜各族自治县', '广西壮族自治区桂林市龙胜各族自治县', 0);
INSERT INTO `sys_area` VALUES ('450329', '450300', '资源县', '广西壮族自治区', '桂林市', '资源县', '广西壮族自治区桂林市资源县', 0);
INSERT INTO `sys_area` VALUES ('450330', '450300', '平乐县', '广西壮族自治区', '桂林市', '平乐县', '广西壮族自治区桂林市平乐县', 0);
INSERT INTO `sys_area` VALUES ('450331', '450300', '荔浦县', '广西壮族自治区', '桂林市', '荔浦县', '广西壮族自治区桂林市荔浦县', 0);
INSERT INTO `sys_area` VALUES ('450332', '450300', '恭城瑶族自治县', '广西壮族自治区', '桂林市', '恭城瑶族自治县', '广西壮族自治区桂林市恭城瑶族自治县', 0);
INSERT INTO `sys_area` VALUES ('450400', '450000', '梧州市', '广西壮族自治区', '梧州市', '', '广西壮族自治区梧州市', 0);
INSERT INTO `sys_area` VALUES ('450401', '450400', '市辖区', '广西壮族自治区', '梧州市', '市辖区', '广西壮族自治区梧州市市辖区', 0);
INSERT INTO `sys_area` VALUES ('450403', '450400', '万秀区', '广西壮族自治区', '梧州市', '万秀区', '广西壮族自治区梧州市万秀区', 0);
INSERT INTO `sys_area` VALUES ('450405', '450400', '长洲区', '广西壮族自治区', '梧州市', '长洲区', '广西壮族自治区梧州市长洲区', 0);
INSERT INTO `sys_area` VALUES ('450406', '450400', '龙圩区', '广西壮族自治区', '梧州市', '龙圩区', '广西壮族自治区梧州市龙圩区', 0);
INSERT INTO `sys_area` VALUES ('450421', '450400', '苍梧县', '广西壮族自治区', '梧州市', '苍梧县', '广西壮族自治区梧州市苍梧县', 0);
INSERT INTO `sys_area` VALUES ('450422', '450400', '藤县', '广西壮族自治区', '梧州市', '藤县', '广西壮族自治区梧州市藤县', 0);
INSERT INTO `sys_area` VALUES ('450423', '450400', '蒙山县', '广西壮族自治区', '梧州市', '蒙山县', '广西壮族自治区梧州市蒙山县', 0);
INSERT INTO `sys_area` VALUES ('450481', '450400', '岑溪市', '广西壮族自治区', '梧州市', '岑溪市', '广西壮族自治区梧州市岑溪市', 0);
INSERT INTO `sys_area` VALUES ('450500', '450000', '北海市', '广西壮族自治区', '北海市', '', '广西壮族自治区北海市', 0);
INSERT INTO `sys_area` VALUES ('450501', '450500', '市辖区', '广西壮族自治区', '北海市', '市辖区', '广西壮族自治区北海市市辖区', 0);
INSERT INTO `sys_area` VALUES ('450502', '450500', '海城区', '广西壮族自治区', '北海市', '海城区', '广西壮族自治区北海市海城区', 0);
INSERT INTO `sys_area` VALUES ('450503', '450500', '银海区', '广西壮族自治区', '北海市', '银海区', '广西壮族自治区北海市银海区', 0);
INSERT INTO `sys_area` VALUES ('450512', '450500', '铁山港区', '广西壮族自治区', '北海市', '铁山港区', '广西壮族自治区北海市铁山港区', 0);
INSERT INTO `sys_area` VALUES ('450521', '450500', '合浦县', '广西壮族自治区', '北海市', '合浦县', '广西壮族自治区北海市合浦县', 0);
INSERT INTO `sys_area` VALUES ('450600', '450000', '防城港市', '广西壮族自治区', '防城港市', '', '广西壮族自治区防城港市', 0);
INSERT INTO `sys_area` VALUES ('450601', '450600', '市辖区', '广西壮族自治区', '防城港市', '市辖区', '广西壮族自治区防城港市市辖区', 0);
INSERT INTO `sys_area` VALUES ('450602', '450600', '港口区', '广西壮族自治区', '防城港市', '港口区', '广西壮族自治区防城港市港口区', 0);
INSERT INTO `sys_area` VALUES ('450603', '450600', '防城区', '广西壮族自治区', '防城港市', '防城区', '广西壮族自治区防城港市防城区', 0);
INSERT INTO `sys_area` VALUES ('450621', '450600', '上思县', '广西壮族自治区', '防城港市', '上思县', '广西壮族自治区防城港市上思县', 0);
INSERT INTO `sys_area` VALUES ('450681', '450600', '东兴市', '广西壮族自治区', '防城港市', '东兴市', '广西壮族自治区防城港市东兴市', 0);
INSERT INTO `sys_area` VALUES ('450700', '450000', '钦州市', '广西壮族自治区', '钦州市', '', '广西壮族自治区钦州市', 0);
INSERT INTO `sys_area` VALUES ('450701', '450700', '市辖区', '广西壮族自治区', '钦州市', '市辖区', '广西壮族自治区钦州市市辖区', 0);
INSERT INTO `sys_area` VALUES ('450702', '450700', '钦南区', '广西壮族自治区', '钦州市', '钦南区', '广西壮族自治区钦州市钦南区', 0);
INSERT INTO `sys_area` VALUES ('450703', '450700', '钦北区', '广西壮族自治区', '钦州市', '钦北区', '广西壮族自治区钦州市钦北区', 0);
INSERT INTO `sys_area` VALUES ('450721', '450700', '灵山县', '广西壮族自治区', '钦州市', '灵山县', '广西壮族自治区钦州市灵山县', 0);
INSERT INTO `sys_area` VALUES ('450722', '450700', '浦北县', '广西壮族自治区', '钦州市', '浦北县', '广西壮族自治区钦州市浦北县', 0);
INSERT INTO `sys_area` VALUES ('450800', '450000', '贵港市', '广西壮族自治区', '贵港市', '', '广西壮族自治区贵港市', 0);
INSERT INTO `sys_area` VALUES ('450801', '450800', '市辖区', '广西壮族自治区', '贵港市', '市辖区', '广西壮族自治区贵港市市辖区', 0);
INSERT INTO `sys_area` VALUES ('450802', '450800', '港北区', '广西壮族自治区', '贵港市', '港北区', '广西壮族自治区贵港市港北区', 0);
INSERT INTO `sys_area` VALUES ('450803', '450800', '港南区', '广西壮族自治区', '贵港市', '港南区', '广西壮族自治区贵港市港南区', 0);
INSERT INTO `sys_area` VALUES ('450804', '450800', '覃塘区', '广西壮族自治区', '贵港市', '覃塘区', '广西壮族自治区贵港市覃塘区', 0);
INSERT INTO `sys_area` VALUES ('450821', '450800', '平南县', '广西壮族自治区', '贵港市', '平南县', '广西壮族自治区贵港市平南县', 0);
INSERT INTO `sys_area` VALUES ('450881', '450800', '桂平市', '广西壮族自治区', '贵港市', '桂平市', '广西壮族自治区贵港市桂平市', 0);
INSERT INTO `sys_area` VALUES ('450900', '450000', '玉林市', '广西壮族自治区', '玉林市', '', '广西壮族自治区玉林市', 0);
INSERT INTO `sys_area` VALUES ('450901', '450900', '市辖区', '广西壮族自治区', '玉林市', '市辖区', '广西壮族自治区玉林市市辖区', 0);
INSERT INTO `sys_area` VALUES ('450902', '450900', '玉州区', '广西壮族自治区', '玉林市', '玉州区', '广西壮族自治区玉林市玉州区', 0);
INSERT INTO `sys_area` VALUES ('450903', '450900', '福绵区', '广西壮族自治区', '玉林市', '福绵区', '广西壮族自治区玉林市福绵区', 0);
INSERT INTO `sys_area` VALUES ('450921', '450900', '容县', '广西壮族自治区', '玉林市', '容县', '广西壮族自治区玉林市容县', 0);
INSERT INTO `sys_area` VALUES ('450922', '450900', '陆川县', '广西壮族自治区', '玉林市', '陆川县', '广西壮族自治区玉林市陆川县', 0);
INSERT INTO `sys_area` VALUES ('450923', '450900', '博白县', '广西壮族自治区', '玉林市', '博白县', '广西壮族自治区玉林市博白县', 0);
INSERT INTO `sys_area` VALUES ('450924', '450900', '兴业县', '广西壮族自治区', '玉林市', '兴业县', '广西壮族自治区玉林市兴业县', 0);
INSERT INTO `sys_area` VALUES ('450981', '450900', '北流市', '广西壮族自治区', '玉林市', '北流市', '广西壮族自治区玉林市北流市', 0);
INSERT INTO `sys_area` VALUES ('451000', '450000', '百色市', '广西壮族自治区', '百色市', '', '广西壮族自治区百色市', 0);
INSERT INTO `sys_area` VALUES ('451001', '451000', '市辖区', '广西壮族自治区', '百色市', '市辖区', '广西壮族自治区百色市市辖区', 0);
INSERT INTO `sys_area` VALUES ('451002', '451000', '右江区', '广西壮族自治区', '百色市', '右江区', '广西壮族自治区百色市右江区', 0);
INSERT INTO `sys_area` VALUES ('451021', '451000', '田阳县', '广西壮族自治区', '百色市', '田阳县', '广西壮族自治区百色市田阳县', 0);
INSERT INTO `sys_area` VALUES ('451022', '451000', '田东县', '广西壮族自治区', '百色市', '田东县', '广西壮族自治区百色市田东县', 0);
INSERT INTO `sys_area` VALUES ('451023', '451000', '平果县', '广西壮族自治区', '百色市', '平果县', '广西壮族自治区百色市平果县', 0);
INSERT INTO `sys_area` VALUES ('451024', '451000', '德保县', '广西壮族自治区', '百色市', '德保县', '广西壮族自治区百色市德保县', 0);
INSERT INTO `sys_area` VALUES ('451026', '451000', '那坡县', '广西壮族自治区', '百色市', '那坡县', '广西壮族自治区百色市那坡县', 0);
INSERT INTO `sys_area` VALUES ('451027', '451000', '凌云县', '广西壮族自治区', '百色市', '凌云县', '广西壮族自治区百色市凌云县', 0);
INSERT INTO `sys_area` VALUES ('451028', '451000', '乐业县', '广西壮族自治区', '百色市', '乐业县', '广西壮族自治区百色市乐业县', 0);
INSERT INTO `sys_area` VALUES ('451029', '451000', '田林县', '广西壮族自治区', '百色市', '田林县', '广西壮族自治区百色市田林县', 0);
INSERT INTO `sys_area` VALUES ('451030', '451000', '西林县', '广西壮族自治区', '百色市', '西林县', '广西壮族自治区百色市西林县', 0);
INSERT INTO `sys_area` VALUES ('451031', '451000', '隆林各族自治县', '广西壮族自治区', '百色市', '隆林各族自治县', '广西壮族自治区百色市隆林各族自治县', 0);
INSERT INTO `sys_area` VALUES ('451081', '451000', '靖西市', '广西壮族自治区', '百色市', '靖西市', '广西壮族自治区百色市靖西市', 0);
INSERT INTO `sys_area` VALUES ('451100', '450000', '贺州市', '广西壮族自治区', '贺州市', '', '广西壮族自治区贺州市', 0);
INSERT INTO `sys_area` VALUES ('451101', '451100', '市辖区', '广西壮族自治区', '贺州市', '市辖区', '广西壮族自治区贺州市市辖区', 0);
INSERT INTO `sys_area` VALUES ('451102', '451100', '八步区', '广西壮族自治区', '贺州市', '八步区', '广西壮族自治区贺州市八步区', 0);
INSERT INTO `sys_area` VALUES ('451103', '451100', '平桂区', '广西壮族自治区', '贺州市', '平桂区', '广西壮族自治区贺州市平桂区', 0);
INSERT INTO `sys_area` VALUES ('451121', '451100', '昭平县', '广西壮族自治区', '贺州市', '昭平县', '广西壮族自治区贺州市昭平县', 0);
INSERT INTO `sys_area` VALUES ('451122', '451100', '钟山县', '广西壮族自治区', '贺州市', '钟山县', '广西壮族自治区贺州市钟山县', 0);
INSERT INTO `sys_area` VALUES ('451123', '451100', '富川瑶族自治县', '广西壮族自治区', '贺州市', '富川瑶族自治县', '广西壮族自治区贺州市富川瑶族自治县', 0);
INSERT INTO `sys_area` VALUES ('451200', '450000', '河池市', '广西壮族自治区', '河池市', '', '广西壮族自治区河池市', 0);
INSERT INTO `sys_area` VALUES ('451201', '451200', '市辖区', '广西壮族自治区', '河池市', '市辖区', '广西壮族自治区河池市市辖区', 0);
INSERT INTO `sys_area` VALUES ('451202', '451200', '金城江区', '广西壮族自治区', '河池市', '金城江区', '广西壮族自治区河池市金城江区', 0);
INSERT INTO `sys_area` VALUES ('451221', '451200', '南丹县', '广西壮族自治区', '河池市', '南丹县', '广西壮族自治区河池市南丹县', 0);
INSERT INTO `sys_area` VALUES ('451222', '451200', '天峨县', '广西壮族自治区', '河池市', '天峨县', '广西壮族自治区河池市天峨县', 0);
INSERT INTO `sys_area` VALUES ('451223', '451200', '凤山县', '广西壮族自治区', '河池市', '凤山县', '广西壮族自治区河池市凤山县', 0);
INSERT INTO `sys_area` VALUES ('451224', '451200', '东兰县', '广西壮族自治区', '河池市', '东兰县', '广西壮族自治区河池市东兰县', 0);
INSERT INTO `sys_area` VALUES ('451225', '451200', '罗城仫佬族自治县', '广西壮族自治区', '河池市', '罗城仫佬族自治县', '广西壮族自治区河池市罗城仫佬族自治县', 0);
INSERT INTO `sys_area` VALUES ('451226', '451200', '环江毛南族自治县', '广西壮族自治区', '河池市', '环江毛南族自治县', '广西壮族自治区河池市环江毛南族自治县', 0);
INSERT INTO `sys_area` VALUES ('451227', '451200', '巴马瑶族自治县', '广西壮族自治区', '河池市', '巴马瑶族自治县', '广西壮族自治区河池市巴马瑶族自治县', 0);
INSERT INTO `sys_area` VALUES ('451228', '451200', '都安瑶族自治县', '广西壮族自治区', '河池市', '都安瑶族自治县', '广西壮族自治区河池市都安瑶族自治县', 0);
INSERT INTO `sys_area` VALUES ('451229', '451200', '大化瑶族自治县', '广西壮族自治区', '河池市', '大化瑶族自治县', '广西壮族自治区河池市大化瑶族自治县', 0);
INSERT INTO `sys_area` VALUES ('451281', '451200', '宜州市', '广西壮族自治区', '河池市', '宜州市', '广西壮族自治区河池市宜州市', 0);
INSERT INTO `sys_area` VALUES ('451300', '450000', '来宾市', '广西壮族自治区', '来宾市', '', '广西壮族自治区来宾市', 0);
INSERT INTO `sys_area` VALUES ('451301', '451300', '市辖区', '广西壮族自治区', '来宾市', '市辖区', '广西壮族自治区来宾市市辖区', 0);
INSERT INTO `sys_area` VALUES ('451302', '451300', '兴宾区', '广西壮族自治区', '来宾市', '兴宾区', '广西壮族自治区来宾市兴宾区', 0);
INSERT INTO `sys_area` VALUES ('451321', '451300', '忻城县', '广西壮族自治区', '来宾市', '忻城县', '广西壮族自治区来宾市忻城县', 0);
INSERT INTO `sys_area` VALUES ('451322', '451300', '象州县', '广西壮族自治区', '来宾市', '象州县', '广西壮族自治区来宾市象州县', 0);
INSERT INTO `sys_area` VALUES ('451323', '451300', '武宣县', '广西壮族自治区', '来宾市', '武宣县', '广西壮族自治区来宾市武宣县', 0);
INSERT INTO `sys_area` VALUES ('451324', '451300', '金秀瑶族自治县', '广西壮族自治区', '来宾市', '金秀瑶族自治县', '广西壮族自治区来宾市金秀瑶族自治县', 0);
INSERT INTO `sys_area` VALUES ('451381', '451300', '合山市', '广西壮族自治区', '来宾市', '合山市', '广西壮族自治区来宾市合山市', 0);
INSERT INTO `sys_area` VALUES ('451400', '450000', '崇左市', '广西壮族自治区', '崇左市', '', '广西壮族自治区崇左市', 0);
INSERT INTO `sys_area` VALUES ('451401', '451400', '市辖区', '广西壮族自治区', '崇左市', '市辖区', '广西壮族自治区崇左市市辖区', 0);
INSERT INTO `sys_area` VALUES ('451402', '451400', '江州区', '广西壮族自治区', '崇左市', '江州区', '广西壮族自治区崇左市江州区', 0);
INSERT INTO `sys_area` VALUES ('451421', '451400', '扶绥县', '广西壮族自治区', '崇左市', '扶绥县', '广西壮族自治区崇左市扶绥县', 0);
INSERT INTO `sys_area` VALUES ('451422', '451400', '宁明县', '广西壮族自治区', '崇左市', '宁明县', '广西壮族自治区崇左市宁明县', 0);
INSERT INTO `sys_area` VALUES ('451423', '451400', '龙州县', '广西壮族自治区', '崇左市', '龙州县', '广西壮族自治区崇左市龙州县', 0);
INSERT INTO `sys_area` VALUES ('451424', '451400', '大新县', '广西壮族自治区', '崇左市', '大新县', '广西壮族自治区崇左市大新县', 0);
INSERT INTO `sys_area` VALUES ('451425', '451400', '天等县', '广西壮族自治区', '崇左市', '天等县', '广西壮族自治区崇左市天等县', 0);
INSERT INTO `sys_area` VALUES ('451481', '451400', '凭祥市', '广西壮族自治区', '崇左市', '凭祥市', '广西壮族自治区崇左市凭祥市', 0);
INSERT INTO `sys_area` VALUES ('460000', '86', '海南省', '海南省', '', '', '海南省', 0);
INSERT INTO `sys_area` VALUES ('460100', '460000', '海口市', '海南省', '海口市', '', '海南省海口市', 0);
INSERT INTO `sys_area` VALUES ('460101', '460100', '市辖区', '海南省', '海口市', '市辖区', '海南省海口市市辖区', 0);
INSERT INTO `sys_area` VALUES ('460105', '460100', '秀英区', '海南省', '海口市', '秀英区', '海南省海口市秀英区', 0);
INSERT INTO `sys_area` VALUES ('460106', '460100', '龙华区', '海南省', '海口市', '龙华区', '海南省海口市龙华区', 0);
INSERT INTO `sys_area` VALUES ('460107', '460100', '琼山区', '海南省', '海口市', '琼山区', '海南省海口市琼山区', 0);
INSERT INTO `sys_area` VALUES ('460108', '460100', '美兰区', '海南省', '海口市', '美兰区', '海南省海口市美兰区', 0);
INSERT INTO `sys_area` VALUES ('460200', '460000', '三亚市', '海南省', '三亚市', '', '海南省三亚市', 0);
INSERT INTO `sys_area` VALUES ('460201', '460200', '市辖区', '海南省', '三亚市', '市辖区', '海南省三亚市市辖区', 0);
INSERT INTO `sys_area` VALUES ('460202', '460200', '海棠区', '海南省', '三亚市', '海棠区', '海南省三亚市海棠区', 0);
INSERT INTO `sys_area` VALUES ('460203', '460200', '吉阳区', '海南省', '三亚市', '吉阳区', '海南省三亚市吉阳区', 0);
INSERT INTO `sys_area` VALUES ('460204', '460200', '天涯区', '海南省', '三亚市', '天涯区', '海南省三亚市天涯区', 0);
INSERT INTO `sys_area` VALUES ('460205', '460200', '崖州区', '海南省', '三亚市', '崖州区', '海南省三亚市崖州区', 0);
INSERT INTO `sys_area` VALUES ('460300', '460000', '三沙市', '海南省', '三沙市', '', '海南省三沙市', 0);
INSERT INTO `sys_area` VALUES ('460400', '460000', '儋州市', '海南省', '儋州市', '', '海南省儋州市', 0);
INSERT INTO `sys_area` VALUES ('469000', '460000', '省直辖县级行政区划', '海南省', '省直辖县级行政区划', '', '海南省省直辖县级行政区划', 0);
INSERT INTO `sys_area` VALUES ('469001', '469000', '五指山市', '海南省', '省直辖县级行政区划', '五指山市', '海南省省直辖县级行政区划五指山市', 0);
INSERT INTO `sys_area` VALUES ('469002', '469000', '琼海市', '海南省', '省直辖县级行政区划', '琼海市', '海南省省直辖县级行政区划琼海市', 0);
INSERT INTO `sys_area` VALUES ('469005', '469000', '文昌市', '海南省', '省直辖县级行政区划', '文昌市', '海南省省直辖县级行政区划文昌市', 0);
INSERT INTO `sys_area` VALUES ('469006', '469000', '万宁市', '海南省', '省直辖县级行政区划', '万宁市', '海南省省直辖县级行政区划万宁市', 0);
INSERT INTO `sys_area` VALUES ('469007', '469000', '东方市', '海南省', '省直辖县级行政区划', '东方市', '海南省省直辖县级行政区划东方市', 0);
INSERT INTO `sys_area` VALUES ('469021', '469000', '定安县', '海南省', '省直辖县级行政区划', '定安县', '海南省省直辖县级行政区划定安县', 0);
INSERT INTO `sys_area` VALUES ('469022', '469000', '屯昌县', '海南省', '省直辖县级行政区划', '屯昌县', '海南省省直辖县级行政区划屯昌县', 0);
INSERT INTO `sys_area` VALUES ('469023', '469000', '澄迈县', '海南省', '省直辖县级行政区划', '澄迈县', '海南省省直辖县级行政区划澄迈县', 0);
INSERT INTO `sys_area` VALUES ('469024', '469000', '临高县', '海南省', '省直辖县级行政区划', '临高县', '海南省省直辖县级行政区划临高县', 0);
INSERT INTO `sys_area` VALUES ('469025', '469000', '白沙黎族自治县', '海南省', '省直辖县级行政区划', '白沙黎族自治县', '海南省省直辖县级行政区划白沙黎族自治县', 0);
INSERT INTO `sys_area` VALUES ('469026', '469000', '昌江黎族自治县', '海南省', '省直辖县级行政区划', '昌江黎族自治县', '海南省省直辖县级行政区划昌江黎族自治县', 0);
INSERT INTO `sys_area` VALUES ('469027', '469000', '乐东黎族自治县', '海南省', '省直辖县级行政区划', '乐东黎族自治县', '海南省省直辖县级行政区划乐东黎族自治县', 0);
INSERT INTO `sys_area` VALUES ('469028', '469000', '陵水黎族自治县', '海南省', '省直辖县级行政区划', '陵水黎族自治县', '海南省省直辖县级行政区划陵水黎族自治县', 0);
INSERT INTO `sys_area` VALUES ('469029', '469000', '保亭黎族苗族自治县', '海南省', '省直辖县级行政区划', '保亭黎族苗族自治县', '海南省省直辖县级行政区划保亭黎族苗族自治县', 0);
INSERT INTO `sys_area` VALUES ('469030', '469000', '琼中黎族苗族自治县', '海南省', '省直辖县级行政区划', '琼中黎族苗族自治县', '海南省省直辖县级行政区划琼中黎族苗族自治县', 0);
INSERT INTO `sys_area` VALUES ('500000', '86', '重庆市', '重庆市', '', '', '重庆市', 0);
INSERT INTO `sys_area` VALUES ('500100', '500000', '市辖区', '重庆市', '市辖区', '', '重庆市市辖区', 0);
INSERT INTO `sys_area` VALUES ('500101', '500100', '万州区', '重庆市', '市辖区', '万州区', '重庆市市辖区万州区', 0);
INSERT INTO `sys_area` VALUES ('500102', '500100', '涪陵区', '重庆市', '市辖区', '涪陵区', '重庆市市辖区涪陵区', 0);
INSERT INTO `sys_area` VALUES ('500103', '500100', '渝中区', '重庆市', '市辖区', '渝中区', '重庆市市辖区渝中区', 0);
INSERT INTO `sys_area` VALUES ('500104', '500100', '大渡口区', '重庆市', '市辖区', '大渡口区', '重庆市市辖区大渡口区', 0);
INSERT INTO `sys_area` VALUES ('500105', '500100', '江北区', '重庆市', '市辖区', '江北区', '重庆市市辖区江北区', 0);
INSERT INTO `sys_area` VALUES ('500106', '500100', '沙坪坝区', '重庆市', '市辖区', '沙坪坝区', '重庆市市辖区沙坪坝区', 0);
INSERT INTO `sys_area` VALUES ('500107', '500100', '九龙坡区', '重庆市', '市辖区', '九龙坡区', '重庆市市辖区九龙坡区', 0);
INSERT INTO `sys_area` VALUES ('500108', '500100', '南岸区', '重庆市', '市辖区', '南岸区', '重庆市市辖区南岸区', 0);
INSERT INTO `sys_area` VALUES ('500109', '500100', '北碚区', '重庆市', '市辖区', '北碚区', '重庆市市辖区北碚区', 0);
INSERT INTO `sys_area` VALUES ('500110', '500100', '綦江区', '重庆市', '市辖区', '綦江区', '重庆市市辖区綦江区', 0);
INSERT INTO `sys_area` VALUES ('500111', '500100', '大足区', '重庆市', '市辖区', '大足区', '重庆市市辖区大足区', 0);
INSERT INTO `sys_area` VALUES ('500112', '500100', '渝北区', '重庆市', '市辖区', '渝北区', '重庆市市辖区渝北区', 0);
INSERT INTO `sys_area` VALUES ('500113', '500100', '巴南区', '重庆市', '市辖区', '巴南区', '重庆市市辖区巴南区', 0);
INSERT INTO `sys_area` VALUES ('500114', '500100', '黔江区', '重庆市', '市辖区', '黔江区', '重庆市市辖区黔江区', 0);
INSERT INTO `sys_area` VALUES ('500115', '500100', '长寿区', '重庆市', '市辖区', '长寿区', '重庆市市辖区长寿区', 0);
INSERT INTO `sys_area` VALUES ('500116', '500100', '江津区', '重庆市', '市辖区', '江津区', '重庆市市辖区江津区', 0);
INSERT INTO `sys_area` VALUES ('500117', '500100', '合川区', '重庆市', '市辖区', '合川区', '重庆市市辖区合川区', 0);
INSERT INTO `sys_area` VALUES ('500118', '500100', '永川区', '重庆市', '市辖区', '永川区', '重庆市市辖区永川区', 0);
INSERT INTO `sys_area` VALUES ('500119', '500100', '南川区', '重庆市', '市辖区', '南川区', '重庆市市辖区南川区', 0);
INSERT INTO `sys_area` VALUES ('500120', '500100', '璧山区', '重庆市', '市辖区', '璧山区', '重庆市市辖区璧山区', 0);
INSERT INTO `sys_area` VALUES ('500151', '500100', '铜梁区', '重庆市', '市辖区', '铜梁区', '重庆市市辖区铜梁区', 0);
INSERT INTO `sys_area` VALUES ('500152', '500100', '潼南区', '重庆市', '市辖区', '潼南区', '重庆市市辖区潼南区', 0);
INSERT INTO `sys_area` VALUES ('500153', '500100', '荣昌区', '重庆市', '市辖区', '荣昌区', '重庆市市辖区荣昌区', 0);
INSERT INTO `sys_area` VALUES ('500154', '500100', '开州区', '重庆市', '市辖区', '开州区', '重庆市市辖区开州区', 0);
INSERT INTO `sys_area` VALUES ('500200', '500000', '县', '重庆市', '县', '', '重庆市县', 0);
INSERT INTO `sys_area` VALUES ('500228', '500200', '梁平县', '重庆市', '县', '梁平县', '重庆市县梁平县', 0);
INSERT INTO `sys_area` VALUES ('500229', '500200', '城口县', '重庆市', '县', '城口县', '重庆市县城口县', 0);
INSERT INTO `sys_area` VALUES ('500230', '500200', '丰都县', '重庆市', '县', '丰都县', '重庆市县丰都县', 0);
INSERT INTO `sys_area` VALUES ('500231', '500200', '垫江县', '重庆市', '县', '垫江县', '重庆市县垫江县', 0);
INSERT INTO `sys_area` VALUES ('500232', '500200', '武隆县', '重庆市', '县', '武隆县', '重庆市县武隆县', 0);
INSERT INTO `sys_area` VALUES ('500233', '500200', '忠县', '重庆市', '县', '忠县', '重庆市县忠县', 0);
INSERT INTO `sys_area` VALUES ('500235', '500200', '云阳县', '重庆市', '县', '云阳县', '重庆市县云阳县', 0);
INSERT INTO `sys_area` VALUES ('500236', '500200', '奉节县', '重庆市', '县', '奉节县', '重庆市县奉节县', 0);
INSERT INTO `sys_area` VALUES ('500237', '500200', '巫山县', '重庆市', '县', '巫山县', '重庆市县巫山县', 0);
INSERT INTO `sys_area` VALUES ('500238', '500200', '巫溪县', '重庆市', '县', '巫溪县', '重庆市县巫溪县', 0);
INSERT INTO `sys_area` VALUES ('500240', '500200', '石柱土家族自治县', '重庆市', '县', '石柱土家族自治县', '重庆市县石柱土家族自治县', 0);
INSERT INTO `sys_area` VALUES ('500241', '500200', '秀山土家族苗族自治县', '重庆市', '县', '秀山土家族苗族自治县', '重庆市县秀山土家族苗族自治县', 0);
INSERT INTO `sys_area` VALUES ('500242', '500200', '酉阳土家族苗族自治县', '重庆市', '县', '酉阳土家族苗族自治县', '重庆市县酉阳土家族苗族自治县', 0);
INSERT INTO `sys_area` VALUES ('500243', '500200', '彭水苗族土家族自治县', '重庆市', '县', '彭水苗族土家族自治县', '重庆市县彭水苗族土家族自治县', 0);
INSERT INTO `sys_area` VALUES ('510000', '86', '四川省', '四川省', '', '', '四川省', 0);
INSERT INTO `sys_area` VALUES ('510100', '510000', '成都市', '四川省', '成都市', '', '四川省成都市', 0);
INSERT INTO `sys_area` VALUES ('510101', '510100', '市辖区', '四川省', '成都市', '市辖区', '四川省成都市市辖区', 0);
INSERT INTO `sys_area` VALUES ('510104', '510100', '锦江区', '四川省', '成都市', '锦江区', '四川省成都市锦江区', 0);
INSERT INTO `sys_area` VALUES ('510105', '510100', '青羊区', '四川省', '成都市', '青羊区', '四川省成都市青羊区', 0);
INSERT INTO `sys_area` VALUES ('510106', '510100', '金牛区', '四川省', '成都市', '金牛区', '四川省成都市金牛区', 0);
INSERT INTO `sys_area` VALUES ('510107', '510100', '武侯区', '四川省', '成都市', '武侯区', '四川省成都市武侯区', 0);
INSERT INTO `sys_area` VALUES ('510108', '510100', '成华区', '四川省', '成都市', '成华区', '四川省成都市成华区', 0);
INSERT INTO `sys_area` VALUES ('510112', '510100', '龙泉驿区', '四川省', '成都市', '龙泉驿区', '四川省成都市龙泉驿区', 0);
INSERT INTO `sys_area` VALUES ('510113', '510100', '青白江区', '四川省', '成都市', '青白江区', '四川省成都市青白江区', 0);
INSERT INTO `sys_area` VALUES ('510114', '510100', '新都区', '四川省', '成都市', '新都区', '四川省成都市新都区', 0);
INSERT INTO `sys_area` VALUES ('510115', '510100', '温江区', '四川省', '成都市', '温江区', '四川省成都市温江区', 0);
INSERT INTO `sys_area` VALUES ('510116', '510100', '双流区', '四川省', '成都市', '双流区', '四川省成都市双流区', 0);
INSERT INTO `sys_area` VALUES ('510121', '510100', '金堂县', '四川省', '成都市', '金堂县', '四川省成都市金堂县', 0);
INSERT INTO `sys_area` VALUES ('510124', '510100', '郫县', '四川省', '成都市', '郫县', '四川省成都市郫县', 0);
INSERT INTO `sys_area` VALUES ('510129', '510100', '大邑县', '四川省', '成都市', '大邑县', '四川省成都市大邑县', 0);
INSERT INTO `sys_area` VALUES ('510131', '510100', '蒲江县', '四川省', '成都市', '蒲江县', '四川省成都市蒲江县', 0);
INSERT INTO `sys_area` VALUES ('510132', '510100', '新津县', '四川省', '成都市', '新津县', '四川省成都市新津县', 0);
INSERT INTO `sys_area` VALUES ('510181', '510100', '都江堰市', '四川省', '成都市', '都江堰市', '四川省成都市都江堰市', 0);
INSERT INTO `sys_area` VALUES ('510182', '510100', '彭州市', '四川省', '成都市', '彭州市', '四川省成都市彭州市', 0);
INSERT INTO `sys_area` VALUES ('510183', '510100', '邛崃市', '四川省', '成都市', '邛崃市', '四川省成都市邛崃市', 0);
INSERT INTO `sys_area` VALUES ('510184', '510100', '崇州市', '四川省', '成都市', '崇州市', '四川省成都市崇州市', 0);
INSERT INTO `sys_area` VALUES ('510185', '510100', '简阳市', '四川省', '成都市', '简阳市', '四川省成都市简阳市', 0);
INSERT INTO `sys_area` VALUES ('510300', '510000', '自贡市', '四川省', '自贡市', '', '四川省自贡市', 0);
INSERT INTO `sys_area` VALUES ('510301', '510300', '市辖区', '四川省', '自贡市', '市辖区', '四川省自贡市市辖区', 0);
INSERT INTO `sys_area` VALUES ('510302', '510300', '自流井区', '四川省', '自贡市', '自流井区', '四川省自贡市自流井区', 0);
INSERT INTO `sys_area` VALUES ('510303', '510300', '贡井区', '四川省', '自贡市', '贡井区', '四川省自贡市贡井区', 0);
INSERT INTO `sys_area` VALUES ('510304', '510300', '大安区', '四川省', '自贡市', '大安区', '四川省自贡市大安区', 0);
INSERT INTO `sys_area` VALUES ('510311', '510300', '沿滩区', '四川省', '自贡市', '沿滩区', '四川省自贡市沿滩区', 0);
INSERT INTO `sys_area` VALUES ('510321', '510300', '荣县', '四川省', '自贡市', '荣县', '四川省自贡市荣县', 0);
INSERT INTO `sys_area` VALUES ('510322', '510300', '富顺县', '四川省', '自贡市', '富顺县', '四川省自贡市富顺县', 0);
INSERT INTO `sys_area` VALUES ('510400', '510000', '攀枝花市', '四川省', '攀枝花市', '', '四川省攀枝花市', 0);
INSERT INTO `sys_area` VALUES ('510401', '510400', '市辖区', '四川省', '攀枝花市', '市辖区', '四川省攀枝花市市辖区', 0);
INSERT INTO `sys_area` VALUES ('510402', '510400', '东区', '四川省', '攀枝花市', '东区', '四川省攀枝花市东区', 0);
INSERT INTO `sys_area` VALUES ('510403', '510400', '西区', '四川省', '攀枝花市', '西区', '四川省攀枝花市西区', 0);
INSERT INTO `sys_area` VALUES ('510411', '510400', '仁和区', '四川省', '攀枝花市', '仁和区', '四川省攀枝花市仁和区', 0);
INSERT INTO `sys_area` VALUES ('510421', '510400', '米易县', '四川省', '攀枝花市', '米易县', '四川省攀枝花市米易县', 0);
INSERT INTO `sys_area` VALUES ('510422', '510400', '盐边县', '四川省', '攀枝花市', '盐边县', '四川省攀枝花市盐边县', 0);
INSERT INTO `sys_area` VALUES ('510500', '510000', '泸州市', '四川省', '泸州市', '', '四川省泸州市', 0);
INSERT INTO `sys_area` VALUES ('510501', '510500', '市辖区', '四川省', '泸州市', '市辖区', '四川省泸州市市辖区', 0);
INSERT INTO `sys_area` VALUES ('510502', '510500', '江阳区', '四川省', '泸州市', '江阳区', '四川省泸州市江阳区', 0);
INSERT INTO `sys_area` VALUES ('510503', '510500', '纳溪区', '四川省', '泸州市', '纳溪区', '四川省泸州市纳溪区', 0);
INSERT INTO `sys_area` VALUES ('510504', '510500', '龙马潭区', '四川省', '泸州市', '龙马潭区', '四川省泸州市龙马潭区', 0);
INSERT INTO `sys_area` VALUES ('510521', '510500', '泸县', '四川省', '泸州市', '泸县', '四川省泸州市泸县', 0);
INSERT INTO `sys_area` VALUES ('510522', '510500', '合江县', '四川省', '泸州市', '合江县', '四川省泸州市合江县', 0);
INSERT INTO `sys_area` VALUES ('510524', '510500', '叙永县', '四川省', '泸州市', '叙永县', '四川省泸州市叙永县', 0);
INSERT INTO `sys_area` VALUES ('510525', '510500', '古蔺县', '四川省', '泸州市', '古蔺县', '四川省泸州市古蔺县', 0);
INSERT INTO `sys_area` VALUES ('510600', '510000', '德阳市', '四川省', '德阳市', '', '四川省德阳市', 0);
INSERT INTO `sys_area` VALUES ('510601', '510600', '市辖区', '四川省', '德阳市', '市辖区', '四川省德阳市市辖区', 0);
INSERT INTO `sys_area` VALUES ('510603', '510600', '旌阳区', '四川省', '德阳市', '旌阳区', '四川省德阳市旌阳区', 0);
INSERT INTO `sys_area` VALUES ('510623', '510600', '中江县', '四川省', '德阳市', '中江县', '四川省德阳市中江县', 0);
INSERT INTO `sys_area` VALUES ('510626', '510600', '罗江县', '四川省', '德阳市', '罗江县', '四川省德阳市罗江县', 0);
INSERT INTO `sys_area` VALUES ('510681', '510600', '广汉市', '四川省', '德阳市', '广汉市', '四川省德阳市广汉市', 0);
INSERT INTO `sys_area` VALUES ('510682', '510600', '什邡市', '四川省', '德阳市', '什邡市', '四川省德阳市什邡市', 0);
INSERT INTO `sys_area` VALUES ('510683', '510600', '绵竹市', '四川省', '德阳市', '绵竹市', '四川省德阳市绵竹市', 0);
INSERT INTO `sys_area` VALUES ('510700', '510000', '绵阳市', '四川省', '绵阳市', '', '四川省绵阳市', 0);
INSERT INTO `sys_area` VALUES ('510701', '510700', '市辖区', '四川省', '绵阳市', '市辖区', '四川省绵阳市市辖区', 0);
INSERT INTO `sys_area` VALUES ('510703', '510700', '涪城区', '四川省', '绵阳市', '涪城区', '四川省绵阳市涪城区', 0);
INSERT INTO `sys_area` VALUES ('510704', '510700', '游仙区', '四川省', '绵阳市', '游仙区', '四川省绵阳市游仙区', 0);
INSERT INTO `sys_area` VALUES ('510705', '510700', '安州区', '四川省', '绵阳市', '安州区', '四川省绵阳市安州区', 0);
INSERT INTO `sys_area` VALUES ('510722', '510700', '三台县', '四川省', '绵阳市', '三台县', '四川省绵阳市三台县', 0);
INSERT INTO `sys_area` VALUES ('510723', '510700', '盐亭县', '四川省', '绵阳市', '盐亭县', '四川省绵阳市盐亭县', 0);
INSERT INTO `sys_area` VALUES ('510725', '510700', '梓潼县', '四川省', '绵阳市', '梓潼县', '四川省绵阳市梓潼县', 0);
INSERT INTO `sys_area` VALUES ('510726', '510700', '北川羌族自治县', '四川省', '绵阳市', '北川羌族自治县', '四川省绵阳市北川羌族自治县', 0);
INSERT INTO `sys_area` VALUES ('510727', '510700', '平武县', '四川省', '绵阳市', '平武县', '四川省绵阳市平武县', 0);
INSERT INTO `sys_area` VALUES ('510781', '510700', '江油市', '四川省', '绵阳市', '江油市', '四川省绵阳市江油市', 0);
INSERT INTO `sys_area` VALUES ('510800', '510000', '广元市', '四川省', '广元市', '', '四川省广元市', 0);
INSERT INTO `sys_area` VALUES ('510801', '510800', '市辖区', '四川省', '广元市', '市辖区', '四川省广元市市辖区', 0);
INSERT INTO `sys_area` VALUES ('510802', '510800', '利州区', '四川省', '广元市', '利州区', '四川省广元市利州区', 0);
INSERT INTO `sys_area` VALUES ('510811', '510800', '昭化区', '四川省', '广元市', '昭化区', '四川省广元市昭化区', 0);
INSERT INTO `sys_area` VALUES ('510812', '510800', '朝天区', '四川省', '广元市', '朝天区', '四川省广元市朝天区', 0);
INSERT INTO `sys_area` VALUES ('510821', '510800', '旺苍县', '四川省', '广元市', '旺苍县', '四川省广元市旺苍县', 0);
INSERT INTO `sys_area` VALUES ('510822', '510800', '青川县', '四川省', '广元市', '青川县', '四川省广元市青川县', 0);
INSERT INTO `sys_area` VALUES ('510823', '510800', '剑阁县', '四川省', '广元市', '剑阁县', '四川省广元市剑阁县', 0);
INSERT INTO `sys_area` VALUES ('510824', '510800', '苍溪县', '四川省', '广元市', '苍溪县', '四川省广元市苍溪县', 0);
INSERT INTO `sys_area` VALUES ('510900', '510000', '遂宁市', '四川省', '遂宁市', '', '四川省遂宁市', 0);
INSERT INTO `sys_area` VALUES ('510901', '510900', '市辖区', '四川省', '遂宁市', '市辖区', '四川省遂宁市市辖区', 0);
INSERT INTO `sys_area` VALUES ('510903', '510900', '船山区', '四川省', '遂宁市', '船山区', '四川省遂宁市船山区', 0);
INSERT INTO `sys_area` VALUES ('510904', '510900', '安居区', '四川省', '遂宁市', '安居区', '四川省遂宁市安居区', 0);
INSERT INTO `sys_area` VALUES ('510921', '510900', '蓬溪县', '四川省', '遂宁市', '蓬溪县', '四川省遂宁市蓬溪县', 0);
INSERT INTO `sys_area` VALUES ('510922', '510900', '射洪县', '四川省', '遂宁市', '射洪县', '四川省遂宁市射洪县', 0);
INSERT INTO `sys_area` VALUES ('510923', '510900', '大英县', '四川省', '遂宁市', '大英县', '四川省遂宁市大英县', 0);
INSERT INTO `sys_area` VALUES ('511000', '510000', '内江市', '四川省', '内江市', '', '四川省内江市', 0);
INSERT INTO `sys_area` VALUES ('511001', '511000', '市辖区', '四川省', '内江市', '市辖区', '四川省内江市市辖区', 0);
INSERT INTO `sys_area` VALUES ('511002', '511000', '市中区', '四川省', '内江市', '市中区', '四川省内江市市中区', 0);
INSERT INTO `sys_area` VALUES ('511011', '511000', '东兴区', '四川省', '内江市', '东兴区', '四川省内江市东兴区', 0);
INSERT INTO `sys_area` VALUES ('511024', '511000', '威远县', '四川省', '内江市', '威远县', '四川省内江市威远县', 0);
INSERT INTO `sys_area` VALUES ('511025', '511000', '资中县', '四川省', '内江市', '资中县', '四川省内江市资中县', 0);
INSERT INTO `sys_area` VALUES ('511028', '511000', '隆昌县', '四川省', '内江市', '隆昌县', '四川省内江市隆昌县', 0);
INSERT INTO `sys_area` VALUES ('511100', '510000', '乐山市', '四川省', '乐山市', '', '四川省乐山市', 0);
INSERT INTO `sys_area` VALUES ('511101', '511100', '市辖区', '四川省', '乐山市', '市辖区', '四川省乐山市市辖区', 0);
INSERT INTO `sys_area` VALUES ('511102', '511100', '市中区', '四川省', '乐山市', '市中区', '四川省乐山市市中区', 0);
INSERT INTO `sys_area` VALUES ('511111', '511100', '沙湾区', '四川省', '乐山市', '沙湾区', '四川省乐山市沙湾区', 0);
INSERT INTO `sys_area` VALUES ('511112', '511100', '五通桥区', '四川省', '乐山市', '五通桥区', '四川省乐山市五通桥区', 0);
INSERT INTO `sys_area` VALUES ('511113', '511100', '金口河区', '四川省', '乐山市', '金口河区', '四川省乐山市金口河区', 0);
INSERT INTO `sys_area` VALUES ('511123', '511100', '犍为县', '四川省', '乐山市', '犍为县', '四川省乐山市犍为县', 0);
INSERT INTO `sys_area` VALUES ('511124', '511100', '井研县', '四川省', '乐山市', '井研县', '四川省乐山市井研县', 0);
INSERT INTO `sys_area` VALUES ('511126', '511100', '夹江县', '四川省', '乐山市', '夹江县', '四川省乐山市夹江县', 0);
INSERT INTO `sys_area` VALUES ('511129', '511100', '沐川县', '四川省', '乐山市', '沐川县', '四川省乐山市沐川县', 0);
INSERT INTO `sys_area` VALUES ('511132', '511100', '峨边彝族自治县', '四川省', '乐山市', '峨边彝族自治县', '四川省乐山市峨边彝族自治县', 0);
INSERT INTO `sys_area` VALUES ('511133', '511100', '马边彝族自治县', '四川省', '乐山市', '马边彝族自治县', '四川省乐山市马边彝族自治县', 0);
INSERT INTO `sys_area` VALUES ('511181', '511100', '峨眉山市', '四川省', '乐山市', '峨眉山市', '四川省乐山市峨眉山市', 0);
INSERT INTO `sys_area` VALUES ('511300', '510000', '南充市', '四川省', '南充市', '', '四川省南充市', 0);
INSERT INTO `sys_area` VALUES ('511301', '511300', '市辖区', '四川省', '南充市', '市辖区', '四川省南充市市辖区', 0);
INSERT INTO `sys_area` VALUES ('511302', '511300', '顺庆区', '四川省', '南充市', '顺庆区', '四川省南充市顺庆区', 0);
INSERT INTO `sys_area` VALUES ('511303', '511300', '高坪区', '四川省', '南充市', '高坪区', '四川省南充市高坪区', 0);
INSERT INTO `sys_area` VALUES ('511304', '511300', '嘉陵区', '四川省', '南充市', '嘉陵区', '四川省南充市嘉陵区', 0);
INSERT INTO `sys_area` VALUES ('511321', '511300', '南部县', '四川省', '南充市', '南部县', '四川省南充市南部县', 0);
INSERT INTO `sys_area` VALUES ('511322', '511300', '营山县', '四川省', '南充市', '营山县', '四川省南充市营山县', 0);
INSERT INTO `sys_area` VALUES ('511323', '511300', '蓬安县', '四川省', '南充市', '蓬安县', '四川省南充市蓬安县', 0);
INSERT INTO `sys_area` VALUES ('511324', '511300', '仪陇县', '四川省', '南充市', '仪陇县', '四川省南充市仪陇县', 0);
INSERT INTO `sys_area` VALUES ('511325', '511300', '西充县', '四川省', '南充市', '西充县', '四川省南充市西充县', 0);
INSERT INTO `sys_area` VALUES ('511381', '511300', '阆中市', '四川省', '南充市', '阆中市', '四川省南充市阆中市', 0);
INSERT INTO `sys_area` VALUES ('511400', '510000', '眉山市', '四川省', '眉山市', '', '四川省眉山市', 0);
INSERT INTO `sys_area` VALUES ('511401', '511400', '市辖区', '四川省', '眉山市', '市辖区', '四川省眉山市市辖区', 0);
INSERT INTO `sys_area` VALUES ('511402', '511400', '东坡区', '四川省', '眉山市', '东坡区', '四川省眉山市东坡区', 0);
INSERT INTO `sys_area` VALUES ('511403', '511400', '彭山区', '四川省', '眉山市', '彭山区', '四川省眉山市彭山区', 0);
INSERT INTO `sys_area` VALUES ('511421', '511400', '仁寿县', '四川省', '眉山市', '仁寿县', '四川省眉山市仁寿县', 0);
INSERT INTO `sys_area` VALUES ('511423', '511400', '洪雅县', '四川省', '眉山市', '洪雅县', '四川省眉山市洪雅县', 0);
INSERT INTO `sys_area` VALUES ('511424', '511400', '丹棱县', '四川省', '眉山市', '丹棱县', '四川省眉山市丹棱县', 0);
INSERT INTO `sys_area` VALUES ('511425', '511400', '青神县', '四川省', '眉山市', '青神县', '四川省眉山市青神县', 0);
INSERT INTO `sys_area` VALUES ('511500', '510000', '宜宾市', '四川省', '宜宾市', '', '四川省宜宾市', 0);
INSERT INTO `sys_area` VALUES ('511501', '511500', '市辖区', '四川省', '宜宾市', '市辖区', '四川省宜宾市市辖区', 0);
INSERT INTO `sys_area` VALUES ('511502', '511500', '翠屏区', '四川省', '宜宾市', '翠屏区', '四川省宜宾市翠屏区', 0);
INSERT INTO `sys_area` VALUES ('511503', '511500', '南溪区', '四川省', '宜宾市', '南溪区', '四川省宜宾市南溪区', 0);
INSERT INTO `sys_area` VALUES ('511521', '511500', '宜宾县', '四川省', '宜宾市', '宜宾县', '四川省宜宾市宜宾县', 0);
INSERT INTO `sys_area` VALUES ('511523', '511500', '江安县', '四川省', '宜宾市', '江安县', '四川省宜宾市江安县', 0);
INSERT INTO `sys_area` VALUES ('511524', '511500', '长宁县', '四川省', '宜宾市', '长宁县', '四川省宜宾市长宁县', 0);
INSERT INTO `sys_area` VALUES ('511525', '511500', '高县', '四川省', '宜宾市', '高县', '四川省宜宾市高县', 0);
INSERT INTO `sys_area` VALUES ('511526', '511500', '珙县', '四川省', '宜宾市', '珙县', '四川省宜宾市珙县', 0);
INSERT INTO `sys_area` VALUES ('511527', '511500', '筠连县', '四川省', '宜宾市', '筠连县', '四川省宜宾市筠连县', 0);
INSERT INTO `sys_area` VALUES ('511528', '511500', '兴文县', '四川省', '宜宾市', '兴文县', '四川省宜宾市兴文县', 0);
INSERT INTO `sys_area` VALUES ('511529', '511500', '屏山县', '四川省', '宜宾市', '屏山县', '四川省宜宾市屏山县', 0);
INSERT INTO `sys_area` VALUES ('511600', '510000', '广安市', '四川省', '广安市', '', '四川省广安市', 0);
INSERT INTO `sys_area` VALUES ('511601', '511600', '市辖区', '四川省', '广安市', '市辖区', '四川省广安市市辖区', 0);
INSERT INTO `sys_area` VALUES ('511602', '511600', '广安区', '四川省', '广安市', '广安区', '四川省广安市广安区', 0);
INSERT INTO `sys_area` VALUES ('511603', '511600', '前锋区', '四川省', '广安市', '前锋区', '四川省广安市前锋区', 0);
INSERT INTO `sys_area` VALUES ('511621', '511600', '岳池县', '四川省', '广安市', '岳池县', '四川省广安市岳池县', 0);
INSERT INTO `sys_area` VALUES ('511622', '511600', '武胜县', '四川省', '广安市', '武胜县', '四川省广安市武胜县', 0);
INSERT INTO `sys_area` VALUES ('511623', '511600', '邻水县', '四川省', '广安市', '邻水县', '四川省广安市邻水县', 0);
INSERT INTO `sys_area` VALUES ('511681', '511600', '华蓥市', '四川省', '广安市', '华蓥市', '四川省广安市华蓥市', 0);
INSERT INTO `sys_area` VALUES ('511700', '510000', '达州市', '四川省', '达州市', '', '四川省达州市', 0);
INSERT INTO `sys_area` VALUES ('511701', '511700', '市辖区', '四川省', '达州市', '市辖区', '四川省达州市市辖区', 0);
INSERT INTO `sys_area` VALUES ('511702', '511700', '通川区', '四川省', '达州市', '通川区', '四川省达州市通川区', 0);
INSERT INTO `sys_area` VALUES ('511703', '511700', '达川区', '四川省', '达州市', '达川区', '四川省达州市达川区', 0);
INSERT INTO `sys_area` VALUES ('511722', '511700', '宣汉县', '四川省', '达州市', '宣汉县', '四川省达州市宣汉县', 0);
INSERT INTO `sys_area` VALUES ('511723', '511700', '开江县', '四川省', '达州市', '开江县', '四川省达州市开江县', 0);
INSERT INTO `sys_area` VALUES ('511724', '511700', '大竹县', '四川省', '达州市', '大竹县', '四川省达州市大竹县', 0);
INSERT INTO `sys_area` VALUES ('511725', '511700', '渠县', '四川省', '达州市', '渠县', '四川省达州市渠县', 0);
INSERT INTO `sys_area` VALUES ('511781', '511700', '万源市', '四川省', '达州市', '万源市', '四川省达州市万源市', 0);
INSERT INTO `sys_area` VALUES ('511800', '510000', '雅安市', '四川省', '雅安市', '', '四川省雅安市', 0);
INSERT INTO `sys_area` VALUES ('511801', '511800', '市辖区', '四川省', '雅安市', '市辖区', '四川省雅安市市辖区', 0);
INSERT INTO `sys_area` VALUES ('511802', '511800', '雨城区', '四川省', '雅安市', '雨城区', '四川省雅安市雨城区', 0);
INSERT INTO `sys_area` VALUES ('511803', '511800', '名山区', '四川省', '雅安市', '名山区', '四川省雅安市名山区', 0);
INSERT INTO `sys_area` VALUES ('511822', '511800', '荥经县', '四川省', '雅安市', '荥经县', '四川省雅安市荥经县', 0);
INSERT INTO `sys_area` VALUES ('511823', '511800', '汉源县', '四川省', '雅安市', '汉源县', '四川省雅安市汉源县', 0);
INSERT INTO `sys_area` VALUES ('511824', '511800', '石棉县', '四川省', '雅安市', '石棉县', '四川省雅安市石棉县', 0);
INSERT INTO `sys_area` VALUES ('511825', '511800', '天全县', '四川省', '雅安市', '天全县', '四川省雅安市天全县', 0);
INSERT INTO `sys_area` VALUES ('511826', '511800', '芦山县', '四川省', '雅安市', '芦山县', '四川省雅安市芦山县', 0);
INSERT INTO `sys_area` VALUES ('511827', '511800', '宝兴县', '四川省', '雅安市', '宝兴县', '四川省雅安市宝兴县', 0);
INSERT INTO `sys_area` VALUES ('511900', '510000', '巴中市', '四川省', '巴中市', '', '四川省巴中市', 0);
INSERT INTO `sys_area` VALUES ('511901', '511900', '市辖区', '四川省', '巴中市', '市辖区', '四川省巴中市市辖区', 0);
INSERT INTO `sys_area` VALUES ('511902', '511900', '巴州区', '四川省', '巴中市', '巴州区', '四川省巴中市巴州区', 0);
INSERT INTO `sys_area` VALUES ('511903', '511900', '恩阳区', '四川省', '巴中市', '恩阳区', '四川省巴中市恩阳区', 0);
INSERT INTO `sys_area` VALUES ('511921', '511900', '通江县', '四川省', '巴中市', '通江县', '四川省巴中市通江县', 0);
INSERT INTO `sys_area` VALUES ('511922', '511900', '南江县', '四川省', '巴中市', '南江县', '四川省巴中市南江县', 0);
INSERT INTO `sys_area` VALUES ('511923', '511900', '平昌县', '四川省', '巴中市', '平昌县', '四川省巴中市平昌县', 0);
INSERT INTO `sys_area` VALUES ('512000', '510000', '资阳市', '四川省', '资阳市', '', '四川省资阳市', 0);
INSERT INTO `sys_area` VALUES ('512001', '512000', '市辖区', '四川省', '资阳市', '市辖区', '四川省资阳市市辖区', 0);
INSERT INTO `sys_area` VALUES ('512002', '512000', '雁江区', '四川省', '资阳市', '雁江区', '四川省资阳市雁江区', 0);
INSERT INTO `sys_area` VALUES ('512021', '512000', '安岳县', '四川省', '资阳市', '安岳县', '四川省资阳市安岳县', 0);
INSERT INTO `sys_area` VALUES ('512022', '512000', '乐至县', '四川省', '资阳市', '乐至县', '四川省资阳市乐至县', 0);
INSERT INTO `sys_area` VALUES ('513200', '510000', '阿坝藏族羌族自治州', '四川省', '阿坝藏族羌族自治州', '', '四川省阿坝藏族羌族自治州', 0);
INSERT INTO `sys_area` VALUES ('513201', '513200', '马尔康市', '四川省', '阿坝藏族羌族自治州', '马尔康市', '四川省阿坝藏族羌族自治州马尔康市', 0);
INSERT INTO `sys_area` VALUES ('513221', '513200', '汶川县', '四川省', '阿坝藏族羌族自治州', '汶川县', '四川省阿坝藏族羌族自治州汶川县', 0);
INSERT INTO `sys_area` VALUES ('513222', '513200', '理县', '四川省', '阿坝藏族羌族自治州', '理县', '四川省阿坝藏族羌族自治州理县', 0);
INSERT INTO `sys_area` VALUES ('513223', '513200', '茂县', '四川省', '阿坝藏族羌族自治州', '茂县', '四川省阿坝藏族羌族自治州茂县', 0);
INSERT INTO `sys_area` VALUES ('513224', '513200', '松潘县', '四川省', '阿坝藏族羌族自治州', '松潘县', '四川省阿坝藏族羌族自治州松潘县', 0);
INSERT INTO `sys_area` VALUES ('513225', '513200', '九寨沟县', '四川省', '阿坝藏族羌族自治州', '九寨沟县', '四川省阿坝藏族羌族自治州九寨沟县', 0);
INSERT INTO `sys_area` VALUES ('513226', '513200', '金川县', '四川省', '阿坝藏族羌族自治州', '金川县', '四川省阿坝藏族羌族自治州金川县', 0);
INSERT INTO `sys_area` VALUES ('513227', '513200', '小金县', '四川省', '阿坝藏族羌族自治州', '小金县', '四川省阿坝藏族羌族自治州小金县', 0);
INSERT INTO `sys_area` VALUES ('513228', '513200', '黑水县', '四川省', '阿坝藏族羌族自治州', '黑水县', '四川省阿坝藏族羌族自治州黑水县', 0);
INSERT INTO `sys_area` VALUES ('513230', '513200', '壤塘县', '四川省', '阿坝藏族羌族自治州', '壤塘县', '四川省阿坝藏族羌族自治州壤塘县', 0);
INSERT INTO `sys_area` VALUES ('513231', '513200', '阿坝县', '四川省', '阿坝藏族羌族自治州', '阿坝县', '四川省阿坝藏族羌族自治州阿坝县', 0);
INSERT INTO `sys_area` VALUES ('513232', '513200', '若尔盖县', '四川省', '阿坝藏族羌族自治州', '若尔盖县', '四川省阿坝藏族羌族自治州若尔盖县', 0);
INSERT INTO `sys_area` VALUES ('513233', '513200', '红原县', '四川省', '阿坝藏族羌族自治州', '红原县', '四川省阿坝藏族羌族自治州红原县', 0);
INSERT INTO `sys_area` VALUES ('513300', '510000', '甘孜藏族自治州', '四川省', '甘孜藏族自治州', '', '四川省甘孜藏族自治州', 0);
INSERT INTO `sys_area` VALUES ('513301', '513300', '康定市', '四川省', '甘孜藏族自治州', '康定市', '四川省甘孜藏族自治州康定市', 0);
INSERT INTO `sys_area` VALUES ('513322', '513300', '泸定县', '四川省', '甘孜藏族自治州', '泸定县', '四川省甘孜藏族自治州泸定县', 0);
INSERT INTO `sys_area` VALUES ('513323', '513300', '丹巴县', '四川省', '甘孜藏族自治州', '丹巴县', '四川省甘孜藏族自治州丹巴县', 0);
INSERT INTO `sys_area` VALUES ('513324', '513300', '九龙县', '四川省', '甘孜藏族自治州', '九龙县', '四川省甘孜藏族自治州九龙县', 0);
INSERT INTO `sys_area` VALUES ('513325', '513300', '雅江县', '四川省', '甘孜藏族自治州', '雅江县', '四川省甘孜藏族自治州雅江县', 0);
INSERT INTO `sys_area` VALUES ('513326', '513300', '道孚县', '四川省', '甘孜藏族自治州', '道孚县', '四川省甘孜藏族自治州道孚县', 0);
INSERT INTO `sys_area` VALUES ('513327', '513300', '炉霍县', '四川省', '甘孜藏族自治州', '炉霍县', '四川省甘孜藏族自治州炉霍县', 0);
INSERT INTO `sys_area` VALUES ('513328', '513300', '甘孜县', '四川省', '甘孜藏族自治州', '甘孜县', '四川省甘孜藏族自治州甘孜县', 0);
INSERT INTO `sys_area` VALUES ('513329', '513300', '新龙县', '四川省', '甘孜藏族自治州', '新龙县', '四川省甘孜藏族自治州新龙县', 0);
INSERT INTO `sys_area` VALUES ('513330', '513300', '德格县', '四川省', '甘孜藏族自治州', '德格县', '四川省甘孜藏族自治州德格县', 0);
INSERT INTO `sys_area` VALUES ('513331', '513300', '白玉县', '四川省', '甘孜藏族自治州', '白玉县', '四川省甘孜藏族自治州白玉县', 0);
INSERT INTO `sys_area` VALUES ('513332', '513300', '石渠县', '四川省', '甘孜藏族自治州', '石渠县', '四川省甘孜藏族自治州石渠县', 0);
INSERT INTO `sys_area` VALUES ('513333', '513300', '色达县', '四川省', '甘孜藏族自治州', '色达县', '四川省甘孜藏族自治州色达县', 0);
INSERT INTO `sys_area` VALUES ('513334', '513300', '理塘县', '四川省', '甘孜藏族自治州', '理塘县', '四川省甘孜藏族自治州理塘县', 0);
INSERT INTO `sys_area` VALUES ('513335', '513300', '巴塘县', '四川省', '甘孜藏族自治州', '巴塘县', '四川省甘孜藏族自治州巴塘县', 0);
INSERT INTO `sys_area` VALUES ('513336', '513300', '乡城县', '四川省', '甘孜藏族自治州', '乡城县', '四川省甘孜藏族自治州乡城县', 0);
INSERT INTO `sys_area` VALUES ('513337', '513300', '稻城县', '四川省', '甘孜藏族自治州', '稻城县', '四川省甘孜藏族自治州稻城县', 0);
INSERT INTO `sys_area` VALUES ('513338', '513300', '得荣县', '四川省', '甘孜藏族自治州', '得荣县', '四川省甘孜藏族自治州得荣县', 0);
INSERT INTO `sys_area` VALUES ('513400', '510000', '凉山彝族自治州', '四川省', '凉山彝族自治州', '', '四川省凉山彝族自治州', 0);
INSERT INTO `sys_area` VALUES ('513401', '513400', '西昌市', '四川省', '凉山彝族自治州', '西昌市', '四川省凉山彝族自治州西昌市', 0);
INSERT INTO `sys_area` VALUES ('513422', '513400', '木里藏族自治县', '四川省', '凉山彝族自治州', '木里藏族自治县', '四川省凉山彝族自治州木里藏族自治县', 0);
INSERT INTO `sys_area` VALUES ('513423', '513400', '盐源县', '四川省', '凉山彝族自治州', '盐源县', '四川省凉山彝族自治州盐源县', 0);
INSERT INTO `sys_area` VALUES ('513424', '513400', '德昌县', '四川省', '凉山彝族自治州', '德昌县', '四川省凉山彝族自治州德昌县', 0);
INSERT INTO `sys_area` VALUES ('513425', '513400', '会理县', '四川省', '凉山彝族自治州', '会理县', '四川省凉山彝族自治州会理县', 0);
INSERT INTO `sys_area` VALUES ('513426', '513400', '会东县', '四川省', '凉山彝族自治州', '会东县', '四川省凉山彝族自治州会东县', 0);
INSERT INTO `sys_area` VALUES ('513427', '513400', '宁南县', '四川省', '凉山彝族自治州', '宁南县', '四川省凉山彝族自治州宁南县', 0);
INSERT INTO `sys_area` VALUES ('513428', '513400', '普格县', '四川省', '凉山彝族自治州', '普格县', '四川省凉山彝族自治州普格县', 0);
INSERT INTO `sys_area` VALUES ('513429', '513400', '布拖县', '四川省', '凉山彝族自治州', '布拖县', '四川省凉山彝族自治州布拖县', 0);
INSERT INTO `sys_area` VALUES ('513430', '513400', '金阳县', '四川省', '凉山彝族自治州', '金阳县', '四川省凉山彝族自治州金阳县', 0);
INSERT INTO `sys_area` VALUES ('513431', '513400', '昭觉县', '四川省', '凉山彝族自治州', '昭觉县', '四川省凉山彝族自治州昭觉县', 0);
INSERT INTO `sys_area` VALUES ('513432', '513400', '喜德县', '四川省', '凉山彝族自治州', '喜德县', '四川省凉山彝族自治州喜德县', 0);
INSERT INTO `sys_area` VALUES ('513433', '513400', '冕宁县', '四川省', '凉山彝族自治州', '冕宁县', '四川省凉山彝族自治州冕宁县', 0);
INSERT INTO `sys_area` VALUES ('513434', '513400', '越西县', '四川省', '凉山彝族自治州', '越西县', '四川省凉山彝族自治州越西县', 0);
INSERT INTO `sys_area` VALUES ('513435', '513400', '甘洛县', '四川省', '凉山彝族自治州', '甘洛县', '四川省凉山彝族自治州甘洛县', 0);
INSERT INTO `sys_area` VALUES ('513436', '513400', '美姑县', '四川省', '凉山彝族自治州', '美姑县', '四川省凉山彝族自治州美姑县', 0);
INSERT INTO `sys_area` VALUES ('513437', '513400', '雷波县', '四川省', '凉山彝族自治州', '雷波县', '四川省凉山彝族自治州雷波县', 0);
INSERT INTO `sys_area` VALUES ('520000', '86', '贵州省', '贵州省', '', '', '贵州省', 0);
INSERT INTO `sys_area` VALUES ('520100', '520000', '贵阳市', '贵州省', '贵阳市', '', '贵州省贵阳市', 0);
INSERT INTO `sys_area` VALUES ('520101', '520100', '市辖区', '贵州省', '贵阳市', '市辖区', '贵州省贵阳市市辖区', 0);
INSERT INTO `sys_area` VALUES ('520102', '520100', '南明区', '贵州省', '贵阳市', '南明区', '贵州省贵阳市南明区', 0);
INSERT INTO `sys_area` VALUES ('520103', '520100', '云岩区', '贵州省', '贵阳市', '云岩区', '贵州省贵阳市云岩区', 0);
INSERT INTO `sys_area` VALUES ('520111', '520100', '花溪区', '贵州省', '贵阳市', '花溪区', '贵州省贵阳市花溪区', 0);
INSERT INTO `sys_area` VALUES ('520112', '520100', '乌当区', '贵州省', '贵阳市', '乌当区', '贵州省贵阳市乌当区', 0);
INSERT INTO `sys_area` VALUES ('520113', '520100', '白云区', '贵州省', '贵阳市', '白云区', '贵州省贵阳市白云区', 0);
INSERT INTO `sys_area` VALUES ('520115', '520100', '观山湖区', '贵州省', '贵阳市', '观山湖区', '贵州省贵阳市观山湖区', 0);
INSERT INTO `sys_area` VALUES ('520121', '520100', '开阳县', '贵州省', '贵阳市', '开阳县', '贵州省贵阳市开阳县', 0);
INSERT INTO `sys_area` VALUES ('520122', '520100', '息烽县', '贵州省', '贵阳市', '息烽县', '贵州省贵阳市息烽县', 0);
INSERT INTO `sys_area` VALUES ('520123', '520100', '修文县', '贵州省', '贵阳市', '修文县', '贵州省贵阳市修文县', 0);
INSERT INTO `sys_area` VALUES ('520181', '520100', '清镇市', '贵州省', '贵阳市', '清镇市', '贵州省贵阳市清镇市', 0);
INSERT INTO `sys_area` VALUES ('520200', '520000', '六盘水市', '贵州省', '六盘水市', '', '贵州省六盘水市', 0);
INSERT INTO `sys_area` VALUES ('520201', '520200', '钟山区', '贵州省', '六盘水市', '钟山区', '贵州省六盘水市钟山区', 0);
INSERT INTO `sys_area` VALUES ('520203', '520200', '六枝特区', '贵州省', '六盘水市', '六枝特区', '贵州省六盘水市六枝特区', 0);
INSERT INTO `sys_area` VALUES ('520221', '520200', '水城县', '贵州省', '六盘水市', '水城县', '贵州省六盘水市水城县', 0);
INSERT INTO `sys_area` VALUES ('520222', '520200', '盘县', '贵州省', '六盘水市', '盘县', '贵州省六盘水市盘县', 0);
INSERT INTO `sys_area` VALUES ('520300', '520000', '遵义市', '贵州省', '遵义市', '', '贵州省遵义市', 0);
INSERT INTO `sys_area` VALUES ('520301', '520300', '市辖区', '贵州省', '遵义市', '市辖区', '贵州省遵义市市辖区', 0);
INSERT INTO `sys_area` VALUES ('520302', '520300', '红花岗区', '贵州省', '遵义市', '红花岗区', '贵州省遵义市红花岗区', 0);
INSERT INTO `sys_area` VALUES ('520303', '520300', '汇川区', '贵州省', '遵义市', '汇川区', '贵州省遵义市汇川区', 0);
INSERT INTO `sys_area` VALUES ('520304', '520300', '播州区', '贵州省', '遵义市', '播州区', '贵州省遵义市播州区', 0);
INSERT INTO `sys_area` VALUES ('520322', '520300', '桐梓县', '贵州省', '遵义市', '桐梓县', '贵州省遵义市桐梓县', 0);
INSERT INTO `sys_area` VALUES ('520323', '520300', '绥阳县', '贵州省', '遵义市', '绥阳县', '贵州省遵义市绥阳县', 0);
INSERT INTO `sys_area` VALUES ('520324', '520300', '正安县', '贵州省', '遵义市', '正安县', '贵州省遵义市正安县', 0);
INSERT INTO `sys_area` VALUES ('520325', '520300', '道真仡佬族苗族自治县', '贵州省', '遵义市', '道真仡佬族苗族自治县', '贵州省遵义市道真仡佬族苗族自治县', 0);
INSERT INTO `sys_area` VALUES ('520326', '520300', '务川仡佬族苗族自治县', '贵州省', '遵义市', '务川仡佬族苗族自治县', '贵州省遵义市务川仡佬族苗族自治县', 0);
INSERT INTO `sys_area` VALUES ('520327', '520300', '凤冈县', '贵州省', '遵义市', '凤冈县', '贵州省遵义市凤冈县', 0);
INSERT INTO `sys_area` VALUES ('520328', '520300', '湄潭县', '贵州省', '遵义市', '湄潭县', '贵州省遵义市湄潭县', 0);
INSERT INTO `sys_area` VALUES ('520329', '520300', '余庆县', '贵州省', '遵义市', '余庆县', '贵州省遵义市余庆县', 0);
INSERT INTO `sys_area` VALUES ('520330', '520300', '习水县', '贵州省', '遵义市', '习水县', '贵州省遵义市习水县', 0);
INSERT INTO `sys_area` VALUES ('520381', '520300', '赤水市', '贵州省', '遵义市', '赤水市', '贵州省遵义市赤水市', 0);
INSERT INTO `sys_area` VALUES ('520382', '520300', '仁怀市', '贵州省', '遵义市', '仁怀市', '贵州省遵义市仁怀市', 0);
INSERT INTO `sys_area` VALUES ('520400', '520000', '安顺市', '贵州省', '安顺市', '', '贵州省安顺市', 0);
INSERT INTO `sys_area` VALUES ('520401', '520400', '市辖区', '贵州省', '安顺市', '市辖区', '贵州省安顺市市辖区', 0);
INSERT INTO `sys_area` VALUES ('520402', '520400', '西秀区', '贵州省', '安顺市', '西秀区', '贵州省安顺市西秀区', 0);
INSERT INTO `sys_area` VALUES ('520403', '520400', '平坝区', '贵州省', '安顺市', '平坝区', '贵州省安顺市平坝区', 0);
INSERT INTO `sys_area` VALUES ('520422', '520400', '普定县', '贵州省', '安顺市', '普定县', '贵州省安顺市普定县', 0);
INSERT INTO `sys_area` VALUES ('520423', '520400', '镇宁布依族苗族自治县', '贵州省', '安顺市', '镇宁布依族苗族自治县', '贵州省安顺市镇宁布依族苗族自治县', 0);
INSERT INTO `sys_area` VALUES ('520424', '520400', '关岭布依族苗族自治县', '贵州省', '安顺市', '关岭布依族苗族自治县', '贵州省安顺市关岭布依族苗族自治县', 0);
INSERT INTO `sys_area` VALUES ('520425', '520400', '紫云苗族布依族自治县', '贵州省', '安顺市', '紫云苗族布依族自治县', '贵州省安顺市紫云苗族布依族自治县', 0);
INSERT INTO `sys_area` VALUES ('520500', '520000', '毕节市', '贵州省', '毕节市', '', '贵州省毕节市', 0);
INSERT INTO `sys_area` VALUES ('520501', '520500', '市辖区', '贵州省', '毕节市', '市辖区', '贵州省毕节市市辖区', 0);
INSERT INTO `sys_area` VALUES ('520502', '520500', '七星关区', '贵州省', '毕节市', '七星关区', '贵州省毕节市七星关区', 0);
INSERT INTO `sys_area` VALUES ('520521', '520500', '大方县', '贵州省', '毕节市', '大方县', '贵州省毕节市大方县', 0);
INSERT INTO `sys_area` VALUES ('520522', '520500', '黔西县', '贵州省', '毕节市', '黔西县', '贵州省毕节市黔西县', 0);
INSERT INTO `sys_area` VALUES ('520523', '520500', '金沙县', '贵州省', '毕节市', '金沙县', '贵州省毕节市金沙县', 0);
INSERT INTO `sys_area` VALUES ('520524', '520500', '织金县', '贵州省', '毕节市', '织金县', '贵州省毕节市织金县', 0);
INSERT INTO `sys_area` VALUES ('520525', '520500', '纳雍县', '贵州省', '毕节市', '纳雍县', '贵州省毕节市纳雍县', 0);
INSERT INTO `sys_area` VALUES ('520526', '520500', '威宁彝族回族苗族自治县', '贵州省', '毕节市', '威宁彝族回族苗族自治县', '贵州省毕节市威宁彝族回族苗族自治县', 0);
INSERT INTO `sys_area` VALUES ('520527', '520500', '赫章县', '贵州省', '毕节市', '赫章县', '贵州省毕节市赫章县', 0);
INSERT INTO `sys_area` VALUES ('520600', '520000', '铜仁市', '贵州省', '铜仁市', '', '贵州省铜仁市', 0);
INSERT INTO `sys_area` VALUES ('520601', '520600', '市辖区', '贵州省', '铜仁市', '市辖区', '贵州省铜仁市市辖区', 0);
INSERT INTO `sys_area` VALUES ('520602', '520600', '碧江区', '贵州省', '铜仁市', '碧江区', '贵州省铜仁市碧江区', 0);
INSERT INTO `sys_area` VALUES ('520603', '520600', '万山区', '贵州省', '铜仁市', '万山区', '贵州省铜仁市万山区', 0);
INSERT INTO `sys_area` VALUES ('520621', '520600', '江口县', '贵州省', '铜仁市', '江口县', '贵州省铜仁市江口县', 0);
INSERT INTO `sys_area` VALUES ('520622', '520600', '玉屏侗族自治县', '贵州省', '铜仁市', '玉屏侗族自治县', '贵州省铜仁市玉屏侗族自治县', 0);
INSERT INTO `sys_area` VALUES ('520623', '520600', '石阡县', '贵州省', '铜仁市', '石阡县', '贵州省铜仁市石阡县', 0);
INSERT INTO `sys_area` VALUES ('520624', '520600', '思南县', '贵州省', '铜仁市', '思南县', '贵州省铜仁市思南县', 0);
INSERT INTO `sys_area` VALUES ('520625', '520600', '印江土家族苗族自治县', '贵州省', '铜仁市', '印江土家族苗族自治县', '贵州省铜仁市印江土家族苗族自治县', 0);
INSERT INTO `sys_area` VALUES ('520626', '520600', '德江县', '贵州省', '铜仁市', '德江县', '贵州省铜仁市德江县', 0);
INSERT INTO `sys_area` VALUES ('520627', '520600', '沿河土家族自治县', '贵州省', '铜仁市', '沿河土家族自治县', '贵州省铜仁市沿河土家族自治县', 0);
INSERT INTO `sys_area` VALUES ('520628', '520600', '松桃苗族自治县', '贵州省', '铜仁市', '松桃苗族自治县', '贵州省铜仁市松桃苗族自治县', 0);
INSERT INTO `sys_area` VALUES ('522300', '520000', '黔西南布依族苗族自治州', '贵州省', '黔西南布依族苗族自治州', '', '贵州省黔西南布依族苗族自治州', 0);
INSERT INTO `sys_area` VALUES ('522301', '522300', '兴义市', '贵州省', '黔西南布依族苗族自治州', '兴义市', '贵州省黔西南布依族苗族自治州兴义市', 0);
INSERT INTO `sys_area` VALUES ('522322', '522300', '兴仁县', '贵州省', '黔西南布依族苗族自治州', '兴仁县', '贵州省黔西南布依族苗族自治州兴仁县', 0);
INSERT INTO `sys_area` VALUES ('522323', '522300', '普安县', '贵州省', '黔西南布依族苗族自治州', '普安县', '贵州省黔西南布依族苗族自治州普安县', 0);
INSERT INTO `sys_area` VALUES ('522324', '522300', '晴隆县', '贵州省', '黔西南布依族苗族自治州', '晴隆县', '贵州省黔西南布依族苗族自治州晴隆县', 0);
INSERT INTO `sys_area` VALUES ('522325', '522300', '贞丰县', '贵州省', '黔西南布依族苗族自治州', '贞丰县', '贵州省黔西南布依族苗族自治州贞丰县', 0);
INSERT INTO `sys_area` VALUES ('522326', '522300', '望谟县', '贵州省', '黔西南布依族苗族自治州', '望谟县', '贵州省黔西南布依族苗族自治州望谟县', 0);
INSERT INTO `sys_area` VALUES ('522327', '522300', '册亨县', '贵州省', '黔西南布依族苗族自治州', '册亨县', '贵州省黔西南布依族苗族自治州册亨县', 0);
INSERT INTO `sys_area` VALUES ('522328', '522300', '安龙县', '贵州省', '黔西南布依族苗族自治州', '安龙县', '贵州省黔西南布依族苗族自治州安龙县', 0);
INSERT INTO `sys_area` VALUES ('522600', '520000', '黔东南苗族侗族自治州', '贵州省', '黔东南苗族侗族自治州', '', '贵州省黔东南苗族侗族自治州', 0);
INSERT INTO `sys_area` VALUES ('522601', '522600', '凯里市', '贵州省', '黔东南苗族侗族自治州', '凯里市', '贵州省黔东南苗族侗族自治州凯里市', 0);
INSERT INTO `sys_area` VALUES ('522622', '522600', '黄平县', '贵州省', '黔东南苗族侗族自治州', '黄平县', '贵州省黔东南苗族侗族自治州黄平县', 0);
INSERT INTO `sys_area` VALUES ('522623', '522600', '施秉县', '贵州省', '黔东南苗族侗族自治州', '施秉县', '贵州省黔东南苗族侗族自治州施秉县', 0);
INSERT INTO `sys_area` VALUES ('522624', '522600', '三穗县', '贵州省', '黔东南苗族侗族自治州', '三穗县', '贵州省黔东南苗族侗族自治州三穗县', 0);
INSERT INTO `sys_area` VALUES ('522625', '522600', '镇远县', '贵州省', '黔东南苗族侗族自治州', '镇远县', '贵州省黔东南苗族侗族自治州镇远县', 0);
INSERT INTO `sys_area` VALUES ('522626', '522600', '岑巩县', '贵州省', '黔东南苗族侗族自治州', '岑巩县', '贵州省黔东南苗族侗族自治州岑巩县', 0);
INSERT INTO `sys_area` VALUES ('522627', '522600', '天柱县', '贵州省', '黔东南苗族侗族自治州', '天柱县', '贵州省黔东南苗族侗族自治州天柱县', 0);
INSERT INTO `sys_area` VALUES ('522628', '522600', '锦屏县', '贵州省', '黔东南苗族侗族自治州', '锦屏县', '贵州省黔东南苗族侗族自治州锦屏县', 0);
INSERT INTO `sys_area` VALUES ('522629', '522600', '剑河县', '贵州省', '黔东南苗族侗族自治州', '剑河县', '贵州省黔东南苗族侗族自治州剑河县', 0);
INSERT INTO `sys_area` VALUES ('522630', '522600', '台江县', '贵州省', '黔东南苗族侗族自治州', '台江县', '贵州省黔东南苗族侗族自治州台江县', 0);
INSERT INTO `sys_area` VALUES ('522631', '522600', '黎平县', '贵州省', '黔东南苗族侗族自治州', '黎平县', '贵州省黔东南苗族侗族自治州黎平县', 0);
INSERT INTO `sys_area` VALUES ('522632', '522600', '榕江县', '贵州省', '黔东南苗族侗族自治州', '榕江县', '贵州省黔东南苗族侗族自治州榕江县', 0);
INSERT INTO `sys_area` VALUES ('522633', '522600', '从江县', '贵州省', '黔东南苗族侗族自治州', '从江县', '贵州省黔东南苗族侗族自治州从江县', 0);
INSERT INTO `sys_area` VALUES ('522634', '522600', '雷山县', '贵州省', '黔东南苗族侗族自治州', '雷山县', '贵州省黔东南苗族侗族自治州雷山县', 0);
INSERT INTO `sys_area` VALUES ('522635', '522600', '麻江县', '贵州省', '黔东南苗族侗族自治州', '麻江县', '贵州省黔东南苗族侗族自治州麻江县', 0);
INSERT INTO `sys_area` VALUES ('522636', '522600', '丹寨县', '贵州省', '黔东南苗族侗族自治州', '丹寨县', '贵州省黔东南苗族侗族自治州丹寨县', 0);
INSERT INTO `sys_area` VALUES ('522700', '520000', '黔南布依族苗族自治州', '贵州省', '黔南布依族苗族自治州', '', '贵州省黔南布依族苗族自治州', 0);
INSERT INTO `sys_area` VALUES ('522701', '522700', '都匀市', '贵州省', '黔南布依族苗族自治州', '都匀市', '贵州省黔南布依族苗族自治州都匀市', 0);
INSERT INTO `sys_area` VALUES ('522702', '522700', '福泉市', '贵州省', '黔南布依族苗族自治州', '福泉市', '贵州省黔南布依族苗族自治州福泉市', 0);
INSERT INTO `sys_area` VALUES ('522722', '522700', '荔波县', '贵州省', '黔南布依族苗族自治州', '荔波县', '贵州省黔南布依族苗族自治州荔波县', 0);
INSERT INTO `sys_area` VALUES ('522723', '522700', '贵定县', '贵州省', '黔南布依族苗族自治州', '贵定县', '贵州省黔南布依族苗族自治州贵定县', 0);
INSERT INTO `sys_area` VALUES ('522725', '522700', '瓮安县', '贵州省', '黔南布依族苗族自治州', '瓮安县', '贵州省黔南布依族苗族自治州瓮安县', 0);
INSERT INTO `sys_area` VALUES ('522726', '522700', '独山县', '贵州省', '黔南布依族苗族自治州', '独山县', '贵州省黔南布依族苗族自治州独山县', 0);
INSERT INTO `sys_area` VALUES ('522727', '522700', '平塘县', '贵州省', '黔南布依族苗族自治州', '平塘县', '贵州省黔南布依族苗族自治州平塘县', 0);
INSERT INTO `sys_area` VALUES ('522728', '522700', '罗甸县', '贵州省', '黔南布依族苗族自治州', '罗甸县', '贵州省黔南布依族苗族自治州罗甸县', 0);
INSERT INTO `sys_area` VALUES ('522729', '522700', '长顺县', '贵州省', '黔南布依族苗族自治州', '长顺县', '贵州省黔南布依族苗族自治州长顺县', 0);
INSERT INTO `sys_area` VALUES ('522730', '522700', '龙里县', '贵州省', '黔南布依族苗族自治州', '龙里县', '贵州省黔南布依族苗族自治州龙里县', 0);
INSERT INTO `sys_area` VALUES ('522731', '522700', '惠水县', '贵州省', '黔南布依族苗族自治州', '惠水县', '贵州省黔南布依族苗族自治州惠水县', 0);
INSERT INTO `sys_area` VALUES ('522732', '522700', '三都水族自治县', '贵州省', '黔南布依族苗族自治州', '三都水族自治县', '贵州省黔南布依族苗族自治州三都水族自治县', 0);
INSERT INTO `sys_area` VALUES ('530000', '86', '云南省', '云南省', '', '', '云南省', 0);
INSERT INTO `sys_area` VALUES ('530100', '530000', '昆明市', '云南省', '昆明市', '', '云南省昆明市', 0);
INSERT INTO `sys_area` VALUES ('530101', '530100', '市辖区', '云南省', '昆明市', '市辖区', '云南省昆明市市辖区', 0);
INSERT INTO `sys_area` VALUES ('530102', '530100', '五华区', '云南省', '昆明市', '五华区', '云南省昆明市五华区', 0);
INSERT INTO `sys_area` VALUES ('530103', '530100', '盘龙区', '云南省', '昆明市', '盘龙区', '云南省昆明市盘龙区', 0);
INSERT INTO `sys_area` VALUES ('530111', '530100', '官渡区', '云南省', '昆明市', '官渡区', '云南省昆明市官渡区', 0);
INSERT INTO `sys_area` VALUES ('530112', '530100', '西山区', '云南省', '昆明市', '西山区', '云南省昆明市西山区', 0);
INSERT INTO `sys_area` VALUES ('530113', '530100', '东川区', '云南省', '昆明市', '东川区', '云南省昆明市东川区', 0);
INSERT INTO `sys_area` VALUES ('530114', '530100', '呈贡区', '云南省', '昆明市', '呈贡区', '云南省昆明市呈贡区', 0);
INSERT INTO `sys_area` VALUES ('530122', '530100', '晋宁县', '云南省', '昆明市', '晋宁县', '云南省昆明市晋宁县', 0);
INSERT INTO `sys_area` VALUES ('530124', '530100', '富民县', '云南省', '昆明市', '富民县', '云南省昆明市富民县', 0);
INSERT INTO `sys_area` VALUES ('530125', '530100', '宜良县', '云南省', '昆明市', '宜良县', '云南省昆明市宜良县', 0);
INSERT INTO `sys_area` VALUES ('530126', '530100', '石林彝族自治县', '云南省', '昆明市', '石林彝族自治县', '云南省昆明市石林彝族自治县', 0);
INSERT INTO `sys_area` VALUES ('530127', '530100', '嵩明县', '云南省', '昆明市', '嵩明县', '云南省昆明市嵩明县', 0);
INSERT INTO `sys_area` VALUES ('530128', '530100', '禄劝彝族苗族自治县', '云南省', '昆明市', '禄劝彝族苗族自治县', '云南省昆明市禄劝彝族苗族自治县', 0);
INSERT INTO `sys_area` VALUES ('530129', '530100', '寻甸回族彝族自治县', '云南省', '昆明市', '寻甸回族彝族自治县', '云南省昆明市寻甸回族彝族自治县', 0);
INSERT INTO `sys_area` VALUES ('530181', '530100', '安宁市', '云南省', '昆明市', '安宁市', '云南省昆明市安宁市', 0);
INSERT INTO `sys_area` VALUES ('530300', '530000', '曲靖市', '云南省', '曲靖市', '', '云南省曲靖市', 0);
INSERT INTO `sys_area` VALUES ('530301', '530300', '市辖区', '云南省', '曲靖市', '市辖区', '云南省曲靖市市辖区', 0);
INSERT INTO `sys_area` VALUES ('530302', '530300', '麒麟区', '云南省', '曲靖市', '麒麟区', '云南省曲靖市麒麟区', 0);
INSERT INTO `sys_area` VALUES ('530303', '530300', '沾益区', '云南省', '曲靖市', '沾益区', '云南省曲靖市沾益区', 0);
INSERT INTO `sys_area` VALUES ('530321', '530300', '马龙县', '云南省', '曲靖市', '马龙县', '云南省曲靖市马龙县', 0);
INSERT INTO `sys_area` VALUES ('530322', '530300', '陆良县', '云南省', '曲靖市', '陆良县', '云南省曲靖市陆良县', 0);
INSERT INTO `sys_area` VALUES ('530323', '530300', '师宗县', '云南省', '曲靖市', '师宗县', '云南省曲靖市师宗县', 0);
INSERT INTO `sys_area` VALUES ('530324', '530300', '罗平县', '云南省', '曲靖市', '罗平县', '云南省曲靖市罗平县', 0);
INSERT INTO `sys_area` VALUES ('530325', '530300', '富源县', '云南省', '曲靖市', '富源县', '云南省曲靖市富源县', 0);
INSERT INTO `sys_area` VALUES ('530326', '530300', '会泽县', '云南省', '曲靖市', '会泽县', '云南省曲靖市会泽县', 0);
INSERT INTO `sys_area` VALUES ('530381', '530300', '宣威市', '云南省', '曲靖市', '宣威市', '云南省曲靖市宣威市', 0);
INSERT INTO `sys_area` VALUES ('530400', '530000', '玉溪市', '云南省', '玉溪市', '', '云南省玉溪市', 0);
INSERT INTO `sys_area` VALUES ('530401', '530400', '市辖区', '云南省', '玉溪市', '市辖区', '云南省玉溪市市辖区', 0);
INSERT INTO `sys_area` VALUES ('530402', '530400', '红塔区', '云南省', '玉溪市', '红塔区', '云南省玉溪市红塔区', 0);
INSERT INTO `sys_area` VALUES ('530403', '530400', '江川区', '云南省', '玉溪市', '江川区', '云南省玉溪市江川区', 0);
INSERT INTO `sys_area` VALUES ('530422', '530400', '澄江县', '云南省', '玉溪市', '澄江县', '云南省玉溪市澄江县', 0);
INSERT INTO `sys_area` VALUES ('530423', '530400', '通海县', '云南省', '玉溪市', '通海县', '云南省玉溪市通海县', 0);
INSERT INTO `sys_area` VALUES ('530424', '530400', '华宁县', '云南省', '玉溪市', '华宁县', '云南省玉溪市华宁县', 0);
INSERT INTO `sys_area` VALUES ('530425', '530400', '易门县', '云南省', '玉溪市', '易门县', '云南省玉溪市易门县', 0);
INSERT INTO `sys_area` VALUES ('530426', '530400', '峨山彝族自治县', '云南省', '玉溪市', '峨山彝族自治县', '云南省玉溪市峨山彝族自治县', 0);
INSERT INTO `sys_area` VALUES ('530427', '530400', '新平彝族傣族自治县', '云南省', '玉溪市', '新平彝族傣族自治县', '云南省玉溪市新平彝族傣族自治县', 0);
INSERT INTO `sys_area` VALUES ('530428', '530400', '元江哈尼族彝族傣族自治县', '云南省', '玉溪市', '元江哈尼族彝族傣族自治县', '云南省玉溪市元江哈尼族彝族傣族自治县', 0);
INSERT INTO `sys_area` VALUES ('530500', '530000', '保山市', '云南省', '保山市', '', '云南省保山市', 0);
INSERT INTO `sys_area` VALUES ('530501', '530500', '市辖区', '云南省', '保山市', '市辖区', '云南省保山市市辖区', 0);
INSERT INTO `sys_area` VALUES ('530502', '530500', '隆阳区', '云南省', '保山市', '隆阳区', '云南省保山市隆阳区', 0);
INSERT INTO `sys_area` VALUES ('530521', '530500', '施甸县', '云南省', '保山市', '施甸县', '云南省保山市施甸县', 0);
INSERT INTO `sys_area` VALUES ('530523', '530500', '龙陵县', '云南省', '保山市', '龙陵县', '云南省保山市龙陵县', 0);
INSERT INTO `sys_area` VALUES ('530524', '530500', '昌宁县', '云南省', '保山市', '昌宁县', '云南省保山市昌宁县', 0);
INSERT INTO `sys_area` VALUES ('530581', '530500', '腾冲市', '云南省', '保山市', '腾冲市', '云南省保山市腾冲市', 0);
INSERT INTO `sys_area` VALUES ('530600', '530000', '昭通市', '云南省', '昭通市', '', '云南省昭通市', 0);
INSERT INTO `sys_area` VALUES ('530601', '530600', '市辖区', '云南省', '昭通市', '市辖区', '云南省昭通市市辖区', 0);
INSERT INTO `sys_area` VALUES ('530602', '530600', '昭阳区', '云南省', '昭通市', '昭阳区', '云南省昭通市昭阳区', 0);
INSERT INTO `sys_area` VALUES ('530621', '530600', '鲁甸县', '云南省', '昭通市', '鲁甸县', '云南省昭通市鲁甸县', 0);
INSERT INTO `sys_area` VALUES ('530622', '530600', '巧家县', '云南省', '昭通市', '巧家县', '云南省昭通市巧家县', 0);
INSERT INTO `sys_area` VALUES ('530623', '530600', '盐津县', '云南省', '昭通市', '盐津县', '云南省昭通市盐津县', 0);
INSERT INTO `sys_area` VALUES ('530624', '530600', '大关县', '云南省', '昭通市', '大关县', '云南省昭通市大关县', 0);
INSERT INTO `sys_area` VALUES ('530625', '530600', '永善县', '云南省', '昭通市', '永善县', '云南省昭通市永善县', 0);
INSERT INTO `sys_area` VALUES ('530626', '530600', '绥江县', '云南省', '昭通市', '绥江县', '云南省昭通市绥江县', 0);
INSERT INTO `sys_area` VALUES ('530627', '530600', '镇雄县', '云南省', '昭通市', '镇雄县', '云南省昭通市镇雄县', 0);
INSERT INTO `sys_area` VALUES ('530628', '530600', '彝良县', '云南省', '昭通市', '彝良县', '云南省昭通市彝良县', 0);
INSERT INTO `sys_area` VALUES ('530629', '530600', '威信县', '云南省', '昭通市', '威信县', '云南省昭通市威信县', 0);
INSERT INTO `sys_area` VALUES ('530630', '530600', '水富县', '云南省', '昭通市', '水富县', '云南省昭通市水富县', 0);
INSERT INTO `sys_area` VALUES ('530700', '530000', '丽江市', '云南省', '丽江市', '', '云南省丽江市', 0);
INSERT INTO `sys_area` VALUES ('530701', '530700', '市辖区', '云南省', '丽江市', '市辖区', '云南省丽江市市辖区', 0);
INSERT INTO `sys_area` VALUES ('530702', '530700', '古城区', '云南省', '丽江市', '古城区', '云南省丽江市古城区', 0);
INSERT INTO `sys_area` VALUES ('530721', '530700', '玉龙纳西族自治县', '云南省', '丽江市', '玉龙纳西族自治县', '云南省丽江市玉龙纳西族自治县', 0);
INSERT INTO `sys_area` VALUES ('530722', '530700', '永胜县', '云南省', '丽江市', '永胜县', '云南省丽江市永胜县', 0);
INSERT INTO `sys_area` VALUES ('530723', '530700', '华坪县', '云南省', '丽江市', '华坪县', '云南省丽江市华坪县', 0);
INSERT INTO `sys_area` VALUES ('530724', '530700', '宁蒗彝族自治县', '云南省', '丽江市', '宁蒗彝族自治县', '云南省丽江市宁蒗彝族自治县', 0);
INSERT INTO `sys_area` VALUES ('530800', '530000', '普洱市', '云南省', '普洱市', '', '云南省普洱市', 0);
INSERT INTO `sys_area` VALUES ('530801', '530800', '市辖区', '云南省', '普洱市', '市辖区', '云南省普洱市市辖区', 0);
INSERT INTO `sys_area` VALUES ('530802', '530800', '思茅区', '云南省', '普洱市', '思茅区', '云南省普洱市思茅区', 0);
INSERT INTO `sys_area` VALUES ('530821', '530800', '宁洱哈尼族彝族自治县', '云南省', '普洱市', '宁洱哈尼族彝族自治县', '云南省普洱市宁洱哈尼族彝族自治县', 0);
INSERT INTO `sys_area` VALUES ('530822', '530800', '墨江哈尼族自治县', '云南省', '普洱市', '墨江哈尼族自治县', '云南省普洱市墨江哈尼族自治县', 0);
INSERT INTO `sys_area` VALUES ('530823', '530800', '景东彝族自治县', '云南省', '普洱市', '景东彝族自治县', '云南省普洱市景东彝族自治县', 0);
INSERT INTO `sys_area` VALUES ('530824', '530800', '景谷傣族彝族自治县', '云南省', '普洱市', '景谷傣族彝族自治县', '云南省普洱市景谷傣族彝族自治县', 0);
INSERT INTO `sys_area` VALUES ('530825', '530800', '镇沅彝族哈尼族拉祜族自治县', '云南省', '普洱市', '镇沅彝族哈尼族拉祜族自治县', '云南省普洱市镇沅彝族哈尼族拉祜族自治县', 0);
INSERT INTO `sys_area` VALUES ('530826', '530800', '江城哈尼族彝族自治县', '云南省', '普洱市', '江城哈尼族彝族自治县', '云南省普洱市江城哈尼族彝族自治县', 0);
INSERT INTO `sys_area` VALUES ('530827', '530800', '孟连傣族拉祜族佤族自治县', '云南省', '普洱市', '孟连傣族拉祜族佤族自治县', '云南省普洱市孟连傣族拉祜族佤族自治县', 0);
INSERT INTO `sys_area` VALUES ('530828', '530800', '澜沧拉祜族自治县', '云南省', '普洱市', '澜沧拉祜族自治县', '云南省普洱市澜沧拉祜族自治县', 0);
INSERT INTO `sys_area` VALUES ('530829', '530800', '西盟佤族自治县', '云南省', '普洱市', '西盟佤族自治县', '云南省普洱市西盟佤族自治县', 0);
INSERT INTO `sys_area` VALUES ('530900', '530000', '临沧市', '云南省', '临沧市', '', '云南省临沧市', 0);
INSERT INTO `sys_area` VALUES ('530901', '530900', '市辖区', '云南省', '临沧市', '市辖区', '云南省临沧市市辖区', 0);
INSERT INTO `sys_area` VALUES ('530902', '530900', '临翔区', '云南省', '临沧市', '临翔区', '云南省临沧市临翔区', 0);
INSERT INTO `sys_area` VALUES ('530921', '530900', '凤庆县', '云南省', '临沧市', '凤庆县', '云南省临沧市凤庆县', 0);
INSERT INTO `sys_area` VALUES ('530922', '530900', '云县', '云南省', '临沧市', '云县', '云南省临沧市云县', 0);
INSERT INTO `sys_area` VALUES ('530923', '530900', '永德县', '云南省', '临沧市', '永德县', '云南省临沧市永德县', 0);
INSERT INTO `sys_area` VALUES ('530924', '530900', '镇康县', '云南省', '临沧市', '镇康县', '云南省临沧市镇康县', 0);
INSERT INTO `sys_area` VALUES ('530925', '530900', '双江拉祜族佤族布朗族傣族自治县', '云南省', '临沧市', '双江拉祜族佤族布朗族傣族自治县', '云南省临沧市双江拉祜族佤族布朗族傣族自治县', 0);
INSERT INTO `sys_area` VALUES ('530926', '530900', '耿马傣族佤族自治县', '云南省', '临沧市', '耿马傣族佤族自治县', '云南省临沧市耿马傣族佤族自治县', 0);
INSERT INTO `sys_area` VALUES ('530927', '530900', '沧源佤族自治县', '云南省', '临沧市', '沧源佤族自治县', '云南省临沧市沧源佤族自治县', 0);
INSERT INTO `sys_area` VALUES ('532300', '530000', '楚雄彝族自治州', '云南省', '楚雄彝族自治州', '', '云南省楚雄彝族自治州', 0);
INSERT INTO `sys_area` VALUES ('532301', '532300', '楚雄市', '云南省', '楚雄彝族自治州', '楚雄市', '云南省楚雄彝族自治州楚雄市', 0);
INSERT INTO `sys_area` VALUES ('532322', '532300', '双柏县', '云南省', '楚雄彝族自治州', '双柏县', '云南省楚雄彝族自治州双柏县', 0);
INSERT INTO `sys_area` VALUES ('532323', '532300', '牟定县', '云南省', '楚雄彝族自治州', '牟定县', '云南省楚雄彝族自治州牟定县', 0);
INSERT INTO `sys_area` VALUES ('532324', '532300', '南华县', '云南省', '楚雄彝族自治州', '南华县', '云南省楚雄彝族自治州南华县', 0);
INSERT INTO `sys_area` VALUES ('532325', '532300', '姚安县', '云南省', '楚雄彝族自治州', '姚安县', '云南省楚雄彝族自治州姚安县', 0);
INSERT INTO `sys_area` VALUES ('532326', '532300', '大姚县', '云南省', '楚雄彝族自治州', '大姚县', '云南省楚雄彝族自治州大姚县', 0);
INSERT INTO `sys_area` VALUES ('532327', '532300', '永仁县', '云南省', '楚雄彝族自治州', '永仁县', '云南省楚雄彝族自治州永仁县', 0);
INSERT INTO `sys_area` VALUES ('532328', '532300', '元谋县', '云南省', '楚雄彝族自治州', '元谋县', '云南省楚雄彝族自治州元谋县', 0);
INSERT INTO `sys_area` VALUES ('532329', '532300', '武定县', '云南省', '楚雄彝族自治州', '武定县', '云南省楚雄彝族自治州武定县', 0);
INSERT INTO `sys_area` VALUES ('532331', '532300', '禄丰县', '云南省', '楚雄彝族自治州', '禄丰县', '云南省楚雄彝族自治州禄丰县', 0);
INSERT INTO `sys_area` VALUES ('532500', '530000', '红河哈尼族彝族自治州', '云南省', '红河哈尼族彝族自治州', '', '云南省红河哈尼族彝族自治州', 0);
INSERT INTO `sys_area` VALUES ('532501', '532500', '个旧市', '云南省', '红河哈尼族彝族自治州', '个旧市', '云南省红河哈尼族彝族自治州个旧市', 0);
INSERT INTO `sys_area` VALUES ('532502', '532500', '开远市', '云南省', '红河哈尼族彝族自治州', '开远市', '云南省红河哈尼族彝族自治州开远市', 0);
INSERT INTO `sys_area` VALUES ('532503', '532500', '蒙自市', '云南省', '红河哈尼族彝族自治州', '蒙自市', '云南省红河哈尼族彝族自治州蒙自市', 0);
INSERT INTO `sys_area` VALUES ('532504', '532500', '弥勒市', '云南省', '红河哈尼族彝族自治州', '弥勒市', '云南省红河哈尼族彝族自治州弥勒市', 0);
INSERT INTO `sys_area` VALUES ('532523', '532500', '屏边苗族自治县', '云南省', '红河哈尼族彝族自治州', '屏边苗族自治县', '云南省红河哈尼族彝族自治州屏边苗族自治县', 0);
INSERT INTO `sys_area` VALUES ('532524', '532500', '建水县', '云南省', '红河哈尼族彝族自治州', '建水县', '云南省红河哈尼族彝族自治州建水县', 0);
INSERT INTO `sys_area` VALUES ('532525', '532500', '石屏县', '云南省', '红河哈尼族彝族自治州', '石屏县', '云南省红河哈尼族彝族自治州石屏县', 0);
INSERT INTO `sys_area` VALUES ('532527', '532500', '泸西县', '云南省', '红河哈尼族彝族自治州', '泸西县', '云南省红河哈尼族彝族自治州泸西县', 0);
INSERT INTO `sys_area` VALUES ('532528', '532500', '元阳县', '云南省', '红河哈尼族彝族自治州', '元阳县', '云南省红河哈尼族彝族自治州元阳县', 0);
INSERT INTO `sys_area` VALUES ('532529', '532500', '红河县', '云南省', '红河哈尼族彝族自治州', '红河县', '云南省红河哈尼族彝族自治州红河县', 0);
INSERT INTO `sys_area` VALUES ('532530', '532500', '金平苗族瑶族傣族自治县', '云南省', '红河哈尼族彝族自治州', '金平苗族瑶族傣族自治县', '云南省红河哈尼族彝族自治州金平苗族瑶族傣族自治县', 0);
INSERT INTO `sys_area` VALUES ('532531', '532500', '绿春县', '云南省', '红河哈尼族彝族自治州', '绿春县', '云南省红河哈尼族彝族自治州绿春县', 0);
INSERT INTO `sys_area` VALUES ('532532', '532500', '河口瑶族自治县', '云南省', '红河哈尼族彝族自治州', '河口瑶族自治县', '云南省红河哈尼族彝族自治州河口瑶族自治县', 0);
INSERT INTO `sys_area` VALUES ('532600', '530000', '文山壮族苗族自治州', '云南省', '文山壮族苗族自治州', '', '云南省文山壮族苗族自治州', 0);
INSERT INTO `sys_area` VALUES ('532601', '532600', '文山市', '云南省', '文山壮族苗族自治州', '文山市', '云南省文山壮族苗族自治州文山市', 0);
INSERT INTO `sys_area` VALUES ('532622', '532600', '砚山县', '云南省', '文山壮族苗族自治州', '砚山县', '云南省文山壮族苗族自治州砚山县', 0);
INSERT INTO `sys_area` VALUES ('532623', '532600', '西畴县', '云南省', '文山壮族苗族自治州', '西畴县', '云南省文山壮族苗族自治州西畴县', 0);
INSERT INTO `sys_area` VALUES ('532624', '532600', '麻栗坡县', '云南省', '文山壮族苗族自治州', '麻栗坡县', '云南省文山壮族苗族自治州麻栗坡县', 0);
INSERT INTO `sys_area` VALUES ('532625', '532600', '马关县', '云南省', '文山壮族苗族自治州', '马关县', '云南省文山壮族苗族自治州马关县', 0);
INSERT INTO `sys_area` VALUES ('532626', '532600', '丘北县', '云南省', '文山壮族苗族自治州', '丘北县', '云南省文山壮族苗族自治州丘北县', 0);
INSERT INTO `sys_area` VALUES ('532627', '532600', '广南县', '云南省', '文山壮族苗族自治州', '广南县', '云南省文山壮族苗族自治州广南县', 0);
INSERT INTO `sys_area` VALUES ('532628', '532600', '富宁县', '云南省', '文山壮族苗族自治州', '富宁县', '云南省文山壮族苗族自治州富宁县', 0);
INSERT INTO `sys_area` VALUES ('532800', '530000', '西双版纳傣族自治州', '云南省', '西双版纳傣族自治州', '', '云南省西双版纳傣族自治州', 0);
INSERT INTO `sys_area` VALUES ('532801', '532800', '景洪市', '云南省', '西双版纳傣族自治州', '景洪市', '云南省西双版纳傣族自治州景洪市', 0);
INSERT INTO `sys_area` VALUES ('532822', '532800', '勐海县', '云南省', '西双版纳傣族自治州', '勐海县', '云南省西双版纳傣族自治州勐海县', 0);
INSERT INTO `sys_area` VALUES ('532823', '532800', '勐腊县', '云南省', '西双版纳傣族自治州', '勐腊县', '云南省西双版纳傣族自治州勐腊县', 0);
INSERT INTO `sys_area` VALUES ('532900', '530000', '大理白族自治州', '云南省', '大理白族自治州', '', '云南省大理白族自治州', 0);
INSERT INTO `sys_area` VALUES ('532901', '532900', '大理市', '云南省', '大理白族自治州', '大理市', '云南省大理白族自治州大理市', 0);
INSERT INTO `sys_area` VALUES ('532922', '532900', '漾濞彝族自治县', '云南省', '大理白族自治州', '漾濞彝族自治县', '云南省大理白族自治州漾濞彝族自治县', 0);
INSERT INTO `sys_area` VALUES ('532923', '532900', '祥云县', '云南省', '大理白族自治州', '祥云县', '云南省大理白族自治州祥云县', 0);
INSERT INTO `sys_area` VALUES ('532924', '532900', '宾川县', '云南省', '大理白族自治州', '宾川县', '云南省大理白族自治州宾川县', 0);
INSERT INTO `sys_area` VALUES ('532925', '532900', '弥渡县', '云南省', '大理白族自治州', '弥渡县', '云南省大理白族自治州弥渡县', 0);
INSERT INTO `sys_area` VALUES ('532926', '532900', '南涧彝族自治县', '云南省', '大理白族自治州', '南涧彝族自治县', '云南省大理白族自治州南涧彝族自治县', 0);
INSERT INTO `sys_area` VALUES ('532927', '532900', '巍山彝族回族自治县', '云南省', '大理白族自治州', '巍山彝族回族自治县', '云南省大理白族自治州巍山彝族回族自治县', 0);
INSERT INTO `sys_area` VALUES ('532928', '532900', '永平县', '云南省', '大理白族自治州', '永平县', '云南省大理白族自治州永平县', 0);
INSERT INTO `sys_area` VALUES ('532929', '532900', '云龙县', '云南省', '大理白族自治州', '云龙县', '云南省大理白族自治州云龙县', 0);
INSERT INTO `sys_area` VALUES ('532930', '532900', '洱源县', '云南省', '大理白族自治州', '洱源县', '云南省大理白族自治州洱源县', 0);
INSERT INTO `sys_area` VALUES ('532931', '532900', '剑川县', '云南省', '大理白族自治州', '剑川县', '云南省大理白族自治州剑川县', 0);
INSERT INTO `sys_area` VALUES ('532932', '532900', '鹤庆县', '云南省', '大理白族自治州', '鹤庆县', '云南省大理白族自治州鹤庆县', 0);
INSERT INTO `sys_area` VALUES ('533100', '530000', '德宏傣族景颇族自治州', '云南省', '德宏傣族景颇族自治州', '', '云南省德宏傣族景颇族自治州', 0);
INSERT INTO `sys_area` VALUES ('533102', '533100', '瑞丽市', '云南省', '德宏傣族景颇族自治州', '瑞丽市', '云南省德宏傣族景颇族自治州瑞丽市', 0);
INSERT INTO `sys_area` VALUES ('533103', '533100', '芒市', '云南省', '德宏傣族景颇族自治州', '芒市', '云南省德宏傣族景颇族自治州芒市', 0);
INSERT INTO `sys_area` VALUES ('533122', '533100', '梁河县', '云南省', '德宏傣族景颇族自治州', '梁河县', '云南省德宏傣族景颇族自治州梁河县', 0);
INSERT INTO `sys_area` VALUES ('533123', '533100', '盈江县', '云南省', '德宏傣族景颇族自治州', '盈江县', '云南省德宏傣族景颇族自治州盈江县', 0);
INSERT INTO `sys_area` VALUES ('533124', '533100', '陇川县', '云南省', '德宏傣族景颇族自治州', '陇川县', '云南省德宏傣族景颇族自治州陇川县', 0);
INSERT INTO `sys_area` VALUES ('533300', '530000', '怒江傈僳族自治州', '云南省', '怒江傈僳族自治州', '', '云南省怒江傈僳族自治州', 0);
INSERT INTO `sys_area` VALUES ('533301', '533300', '泸水市', '云南省', '怒江傈僳族自治州', '泸水市', '云南省怒江傈僳族自治州泸水市', 0);
INSERT INTO `sys_area` VALUES ('533323', '533300', '福贡县', '云南省', '怒江傈僳族自治州', '福贡县', '云南省怒江傈僳族自治州福贡县', 0);
INSERT INTO `sys_area` VALUES ('533324', '533300', '贡山独龙族怒族自治县', '云南省', '怒江傈僳族自治州', '贡山独龙族怒族自治县', '云南省怒江傈僳族自治州贡山独龙族怒族自治县', 0);
INSERT INTO `sys_area` VALUES ('533325', '533300', '兰坪白族普米族自治县', '云南省', '怒江傈僳族自治州', '兰坪白族普米族自治县', '云南省怒江傈僳族自治州兰坪白族普米族自治县', 0);
INSERT INTO `sys_area` VALUES ('533400', '530000', '迪庆藏族自治州', '云南省', '迪庆藏族自治州', '', '云南省迪庆藏族自治州', 0);
INSERT INTO `sys_area` VALUES ('533401', '533400', '香格里拉市', '云南省', '迪庆藏族自治州', '香格里拉市', '云南省迪庆藏族自治州香格里拉市', 0);
INSERT INTO `sys_area` VALUES ('533422', '533400', '德钦县', '云南省', '迪庆藏族自治州', '德钦县', '云南省迪庆藏族自治州德钦县', 0);
INSERT INTO `sys_area` VALUES ('533423', '533400', '维西傈僳族自治县', '云南省', '迪庆藏族自治州', '维西傈僳族自治县', '云南省迪庆藏族自治州维西傈僳族自治县', 0);
INSERT INTO `sys_area` VALUES ('540000', '86', '西藏自治区', '西藏自治区', '', '', '西藏自治区', 0);
INSERT INTO `sys_area` VALUES ('540100', '540000', '拉萨市', '西藏自治区', '拉萨市', '', '西藏自治区拉萨市', 0);
INSERT INTO `sys_area` VALUES ('540101', '540100', '市辖区', '西藏自治区', '拉萨市', '市辖区', '西藏自治区拉萨市市辖区', 0);
INSERT INTO `sys_area` VALUES ('540102', '540100', '城关区', '西藏自治区', '拉萨市', '城关区', '西藏自治区拉萨市城关区', 0);
INSERT INTO `sys_area` VALUES ('540103', '540100', '堆龙德庆区', '西藏自治区', '拉萨市', '堆龙德庆区', '西藏自治区拉萨市堆龙德庆区', 0);
INSERT INTO `sys_area` VALUES ('540121', '540100', '林周县', '西藏自治区', '拉萨市', '林周县', '西藏自治区拉萨市林周县', 0);
INSERT INTO `sys_area` VALUES ('540122', '540100', '当雄县', '西藏自治区', '拉萨市', '当雄县', '西藏自治区拉萨市当雄县', 0);
INSERT INTO `sys_area` VALUES ('540123', '540100', '尼木县', '西藏自治区', '拉萨市', '尼木县', '西藏自治区拉萨市尼木县', 0);
INSERT INTO `sys_area` VALUES ('540124', '540100', '曲水县', '西藏自治区', '拉萨市', '曲水县', '西藏自治区拉萨市曲水县', 0);
INSERT INTO `sys_area` VALUES ('540126', '540100', '达孜县', '西藏自治区', '拉萨市', '达孜县', '西藏自治区拉萨市达孜县', 0);
INSERT INTO `sys_area` VALUES ('540127', '540100', '墨竹工卡县', '西藏自治区', '拉萨市', '墨竹工卡县', '西藏自治区拉萨市墨竹工卡县', 0);
INSERT INTO `sys_area` VALUES ('540200', '540000', '日喀则市', '西藏自治区', '日喀则市', '', '西藏自治区日喀则市', 0);
INSERT INTO `sys_area` VALUES ('540202', '540200', '桑珠孜区', '西藏自治区', '日喀则市', '桑珠孜区', '西藏自治区日喀则市桑珠孜区', 0);
INSERT INTO `sys_area` VALUES ('540221', '540200', '南木林县', '西藏自治区', '日喀则市', '南木林县', '西藏自治区日喀则市南木林县', 0);
INSERT INTO `sys_area` VALUES ('540222', '540200', '江孜县', '西藏自治区', '日喀则市', '江孜县', '西藏自治区日喀则市江孜县', 0);
INSERT INTO `sys_area` VALUES ('540223', '540200', '定日县', '西藏自治区', '日喀则市', '定日县', '西藏自治区日喀则市定日县', 0);
INSERT INTO `sys_area` VALUES ('540224', '540200', '萨迦县', '西藏自治区', '日喀则市', '萨迦县', '西藏自治区日喀则市萨迦县', 0);
INSERT INTO `sys_area` VALUES ('540225', '540200', '拉孜县', '西藏自治区', '日喀则市', '拉孜县', '西藏自治区日喀则市拉孜县', 0);
INSERT INTO `sys_area` VALUES ('540226', '540200', '昂仁县', '西藏自治区', '日喀则市', '昂仁县', '西藏自治区日喀则市昂仁县', 0);
INSERT INTO `sys_area` VALUES ('540227', '540200', '谢通门县', '西藏自治区', '日喀则市', '谢通门县', '西藏自治区日喀则市谢通门县', 0);
INSERT INTO `sys_area` VALUES ('540228', '540200', '白朗县', '西藏自治区', '日喀则市', '白朗县', '西藏自治区日喀则市白朗县', 0);
INSERT INTO `sys_area` VALUES ('540229', '540200', '仁布县', '西藏自治区', '日喀则市', '仁布县', '西藏自治区日喀则市仁布县', 0);
INSERT INTO `sys_area` VALUES ('540230', '540200', '康马县', '西藏自治区', '日喀则市', '康马县', '西藏自治区日喀则市康马县', 0);
INSERT INTO `sys_area` VALUES ('540231', '540200', '定结县', '西藏自治区', '日喀则市', '定结县', '西藏自治区日喀则市定结县', 0);
INSERT INTO `sys_area` VALUES ('540232', '540200', '仲巴县', '西藏自治区', '日喀则市', '仲巴县', '西藏自治区日喀则市仲巴县', 0);
INSERT INTO `sys_area` VALUES ('540233', '540200', '亚东县', '西藏自治区', '日喀则市', '亚东县', '西藏自治区日喀则市亚东县', 0);
INSERT INTO `sys_area` VALUES ('540234', '540200', '吉隆县', '西藏自治区', '日喀则市', '吉隆县', '西藏自治区日喀则市吉隆县', 0);
INSERT INTO `sys_area` VALUES ('540235', '540200', '聂拉木县', '西藏自治区', '日喀则市', '聂拉木县', '西藏自治区日喀则市聂拉木县', 0);
INSERT INTO `sys_area` VALUES ('540236', '540200', '萨嘎县', '西藏自治区', '日喀则市', '萨嘎县', '西藏自治区日喀则市萨嘎县', 0);
INSERT INTO `sys_area` VALUES ('540237', '540200', '岗巴县', '西藏自治区', '日喀则市', '岗巴县', '西藏自治区日喀则市岗巴县', 0);
INSERT INTO `sys_area` VALUES ('540300', '540000', '昌都市', '西藏自治区', '昌都市', '', '西藏自治区昌都市', 0);
INSERT INTO `sys_area` VALUES ('540302', '540300', '卡若区', '西藏自治区', '昌都市', '卡若区', '西藏自治区昌都市卡若区', 0);
INSERT INTO `sys_area` VALUES ('540321', '540300', '江达县', '西藏自治区', '昌都市', '江达县', '西藏自治区昌都市江达县', 0);
INSERT INTO `sys_area` VALUES ('540322', '540300', '贡觉县', '西藏自治区', '昌都市', '贡觉县', '西藏自治区昌都市贡觉县', 0);
INSERT INTO `sys_area` VALUES ('540323', '540300', '类乌齐县', '西藏自治区', '昌都市', '类乌齐县', '西藏自治区昌都市类乌齐县', 0);
INSERT INTO `sys_area` VALUES ('540324', '540300', '丁青县', '西藏自治区', '昌都市', '丁青县', '西藏自治区昌都市丁青县', 0);
INSERT INTO `sys_area` VALUES ('540325', '540300', '察雅县', '西藏自治区', '昌都市', '察雅县', '西藏自治区昌都市察雅县', 0);
INSERT INTO `sys_area` VALUES ('540326', '540300', '八宿县', '西藏自治区', '昌都市', '八宿县', '西藏自治区昌都市八宿县', 0);
INSERT INTO `sys_area` VALUES ('540327', '540300', '左贡县', '西藏自治区', '昌都市', '左贡县', '西藏自治区昌都市左贡县', 0);
INSERT INTO `sys_area` VALUES ('540328', '540300', '芒康县', '西藏自治区', '昌都市', '芒康县', '西藏自治区昌都市芒康县', 0);
INSERT INTO `sys_area` VALUES ('540329', '540300', '洛隆县', '西藏自治区', '昌都市', '洛隆县', '西藏自治区昌都市洛隆县', 0);
INSERT INTO `sys_area` VALUES ('540330', '540300', '边坝县', '西藏自治区', '昌都市', '边坝县', '西藏自治区昌都市边坝县', 0);
INSERT INTO `sys_area` VALUES ('540400', '540000', '林芝市', '西藏自治区', '林芝市', '', '西藏自治区林芝市', 0);
INSERT INTO `sys_area` VALUES ('540402', '540400', '巴宜区', '西藏自治区', '林芝市', '巴宜区', '西藏自治区林芝市巴宜区', 0);
INSERT INTO `sys_area` VALUES ('540421', '540400', '工布江达县', '西藏自治区', '林芝市', '工布江达县', '西藏自治区林芝市工布江达县', 0);
INSERT INTO `sys_area` VALUES ('540422', '540400', '米林县', '西藏自治区', '林芝市', '米林县', '西藏自治区林芝市米林县', 0);
INSERT INTO `sys_area` VALUES ('540423', '540400', '墨脱县', '西藏自治区', '林芝市', '墨脱县', '西藏自治区林芝市墨脱县', 0);
INSERT INTO `sys_area` VALUES ('540424', '540400', '波密县', '西藏自治区', '林芝市', '波密县', '西藏自治区林芝市波密县', 0);
INSERT INTO `sys_area` VALUES ('540425', '540400', '察隅县', '西藏自治区', '林芝市', '察隅县', '西藏自治区林芝市察隅县', 0);
INSERT INTO `sys_area` VALUES ('540426', '540400', '朗县', '西藏自治区', '林芝市', '朗县', '西藏自治区林芝市朗县', 0);
INSERT INTO `sys_area` VALUES ('540500', '540000', '山南市', '西藏自治区', '山南市', '', '西藏自治区山南市', 0);
INSERT INTO `sys_area` VALUES ('540501', '540500', '市辖区', '西藏自治区', '山南市', '市辖区', '西藏自治区山南市市辖区', 0);
INSERT INTO `sys_area` VALUES ('540502', '540500', '乃东区', '西藏自治区', '山南市', '乃东区', '西藏自治区山南市乃东区', 0);
INSERT INTO `sys_area` VALUES ('540521', '540500', '扎囊县', '西藏自治区', '山南市', '扎囊县', '西藏自治区山南市扎囊县', 0);
INSERT INTO `sys_area` VALUES ('540522', '540500', '贡嘎县', '西藏自治区', '山南市', '贡嘎县', '西藏自治区山南市贡嘎县', 0);
INSERT INTO `sys_area` VALUES ('540523', '540500', '桑日县', '西藏自治区', '山南市', '桑日县', '西藏自治区山南市桑日县', 0);
INSERT INTO `sys_area` VALUES ('540524', '540500', '琼结县', '西藏自治区', '山南市', '琼结县', '西藏自治区山南市琼结县', 0);
INSERT INTO `sys_area` VALUES ('540525', '540500', '曲松县', '西藏自治区', '山南市', '曲松县', '西藏自治区山南市曲松县', 0);
INSERT INTO `sys_area` VALUES ('540526', '540500', '措美县', '西藏自治区', '山南市', '措美县', '西藏自治区山南市措美县', 0);
INSERT INTO `sys_area` VALUES ('540527', '540500', '洛扎县', '西藏自治区', '山南市', '洛扎县', '西藏自治区山南市洛扎县', 0);
INSERT INTO `sys_area` VALUES ('540528', '540500', '加查县', '西藏自治区', '山南市', '加查县', '西藏自治区山南市加查县', 0);
INSERT INTO `sys_area` VALUES ('540529', '540500', '隆子县', '西藏自治区', '山南市', '隆子县', '西藏自治区山南市隆子县', 0);
INSERT INTO `sys_area` VALUES ('540530', '540500', '错那县', '西藏自治区', '山南市', '错那县', '西藏自治区山南市错那县', 0);
INSERT INTO `sys_area` VALUES ('540531', '540500', '浪卡子县', '西藏自治区', '山南市', '浪卡子县', '西藏自治区山南市浪卡子县', 0);
INSERT INTO `sys_area` VALUES ('542400', '540000', '那曲地区', '西藏自治区', '那曲地区', '', '西藏自治区那曲地区', 0);
INSERT INTO `sys_area` VALUES ('542421', '542400', '那曲县', '西藏自治区', '那曲地区', '那曲县', '西藏自治区那曲地区那曲县', 0);
INSERT INTO `sys_area` VALUES ('542422', '542400', '嘉黎县', '西藏自治区', '那曲地区', '嘉黎县', '西藏自治区那曲地区嘉黎县', 0);
INSERT INTO `sys_area` VALUES ('542423', '542400', '比如县', '西藏自治区', '那曲地区', '比如县', '西藏自治区那曲地区比如县', 0);
INSERT INTO `sys_area` VALUES ('542424', '542400', '聂荣县', '西藏自治区', '那曲地区', '聂荣县', '西藏自治区那曲地区聂荣县', 0);
INSERT INTO `sys_area` VALUES ('542425', '542400', '安多县', '西藏自治区', '那曲地区', '安多县', '西藏自治区那曲地区安多县', 0);
INSERT INTO `sys_area` VALUES ('542426', '542400', '申扎县', '西藏自治区', '那曲地区', '申扎县', '西藏自治区那曲地区申扎县', 0);
INSERT INTO `sys_area` VALUES ('542427', '542400', '索县', '西藏自治区', '那曲地区', '索县', '西藏自治区那曲地区索县', 0);
INSERT INTO `sys_area` VALUES ('542428', '542400', '班戈县', '西藏自治区', '那曲地区', '班戈县', '西藏自治区那曲地区班戈县', 0);
INSERT INTO `sys_area` VALUES ('542429', '542400', '巴青县', '西藏自治区', '那曲地区', '巴青县', '西藏自治区那曲地区巴青县', 0);
INSERT INTO `sys_area` VALUES ('542430', '542400', '尼玛县', '西藏自治区', '那曲地区', '尼玛县', '西藏自治区那曲地区尼玛县', 0);
INSERT INTO `sys_area` VALUES ('542431', '542400', '双湖县', '西藏自治区', '那曲地区', '双湖县', '西藏自治区那曲地区双湖县', 0);
INSERT INTO `sys_area` VALUES ('542500', '540000', '阿里地区', '西藏自治区', '阿里地区', '', '西藏自治区阿里地区', 0);
INSERT INTO `sys_area` VALUES ('542521', '542500', '普兰县', '西藏自治区', '阿里地区', '普兰县', '西藏自治区阿里地区普兰县', 0);
INSERT INTO `sys_area` VALUES ('542522', '542500', '札达县', '西藏自治区', '阿里地区', '札达县', '西藏自治区阿里地区札达县', 0);
INSERT INTO `sys_area` VALUES ('542523', '542500', '噶尔县', '西藏自治区', '阿里地区', '噶尔县', '西藏自治区阿里地区噶尔县', 0);
INSERT INTO `sys_area` VALUES ('542524', '542500', '日土县', '西藏自治区', '阿里地区', '日土县', '西藏自治区阿里地区日土县', 0);
INSERT INTO `sys_area` VALUES ('542525', '542500', '革吉县', '西藏自治区', '阿里地区', '革吉县', '西藏自治区阿里地区革吉县', 0);
INSERT INTO `sys_area` VALUES ('542526', '542500', '改则县', '西藏自治区', '阿里地区', '改则县', '西藏自治区阿里地区改则县', 0);
INSERT INTO `sys_area` VALUES ('542527', '542500', '措勤县', '西藏自治区', '阿里地区', '措勤县', '西藏自治区阿里地区措勤县', 0);
INSERT INTO `sys_area` VALUES ('610000', '86', '陕西省', '陕西省', '', '', '陕西省', 0);
INSERT INTO `sys_area` VALUES ('610100', '610000', '西安市', '陕西省', '西安市', '', '陕西省西安市', 0);
INSERT INTO `sys_area` VALUES ('610101', '610100', '市辖区', '陕西省', '西安市', '市辖区', '陕西省西安市市辖区', 0);
INSERT INTO `sys_area` VALUES ('610102', '610100', '新城区', '陕西省', '西安市', '新城区', '陕西省西安市新城区', 0);
INSERT INTO `sys_area` VALUES ('610103', '610100', '碑林区', '陕西省', '西安市', '碑林区', '陕西省西安市碑林区', 0);
INSERT INTO `sys_area` VALUES ('610104', '610100', '莲湖区', '陕西省', '西安市', '莲湖区', '陕西省西安市莲湖区', 0);
INSERT INTO `sys_area` VALUES ('610111', '610100', '灞桥区', '陕西省', '西安市', '灞桥区', '陕西省西安市灞桥区', 0);
INSERT INTO `sys_area` VALUES ('610112', '610100', '未央区', '陕西省', '西安市', '未央区', '陕西省西安市未央区', 0);
INSERT INTO `sys_area` VALUES ('610113', '610100', '雁塔区', '陕西省', '西安市', '雁塔区', '陕西省西安市雁塔区', 0);
INSERT INTO `sys_area` VALUES ('610114', '610100', '阎良区', '陕西省', '西安市', '阎良区', '陕西省西安市阎良区', 0);
INSERT INTO `sys_area` VALUES ('610115', '610100', '临潼区', '陕西省', '西安市', '临潼区', '陕西省西安市临潼区', 0);
INSERT INTO `sys_area` VALUES ('610116', '610100', '长安区', '陕西省', '西安市', '长安区', '陕西省西安市长安区', 0);
INSERT INTO `sys_area` VALUES ('610117', '610100', '高陵区', '陕西省', '西安市', '高陵区', '陕西省西安市高陵区', 0);
INSERT INTO `sys_area` VALUES ('610122', '610100', '蓝田县', '陕西省', '西安市', '蓝田县', '陕西省西安市蓝田县', 0);
INSERT INTO `sys_area` VALUES ('610124', '610100', '周至县', '陕西省', '西安市', '周至县', '陕西省西安市周至县', 0);
INSERT INTO `sys_area` VALUES ('610125', '610100', '户县', '陕西省', '西安市', '户县', '陕西省西安市户县', 0);
INSERT INTO `sys_area` VALUES ('610200', '610000', '铜川市', '陕西省', '铜川市', '', '陕西省铜川市', 0);
INSERT INTO `sys_area` VALUES ('610201', '610200', '市辖区', '陕西省', '铜川市', '市辖区', '陕西省铜川市市辖区', 0);
INSERT INTO `sys_area` VALUES ('610202', '610200', '王益区', '陕西省', '铜川市', '王益区', '陕西省铜川市王益区', 0);
INSERT INTO `sys_area` VALUES ('610203', '610200', '印台区', '陕西省', '铜川市', '印台区', '陕西省铜川市印台区', 0);
INSERT INTO `sys_area` VALUES ('610204', '610200', '耀州区', '陕西省', '铜川市', '耀州区', '陕西省铜川市耀州区', 0);
INSERT INTO `sys_area` VALUES ('610222', '610200', '宜君县', '陕西省', '铜川市', '宜君县', '陕西省铜川市宜君县', 0);
INSERT INTO `sys_area` VALUES ('610300', '610000', '宝鸡市', '陕西省', '宝鸡市', '', '陕西省宝鸡市', 0);
INSERT INTO `sys_area` VALUES ('610301', '610300', '市辖区', '陕西省', '宝鸡市', '市辖区', '陕西省宝鸡市市辖区', 0);
INSERT INTO `sys_area` VALUES ('610302', '610300', '渭滨区', '陕西省', '宝鸡市', '渭滨区', '陕西省宝鸡市渭滨区', 0);
INSERT INTO `sys_area` VALUES ('610303', '610300', '金台区', '陕西省', '宝鸡市', '金台区', '陕西省宝鸡市金台区', 0);
INSERT INTO `sys_area` VALUES ('610304', '610300', '陈仓区', '陕西省', '宝鸡市', '陈仓区', '陕西省宝鸡市陈仓区', 0);
INSERT INTO `sys_area` VALUES ('610322', '610300', '凤翔县', '陕西省', '宝鸡市', '凤翔县', '陕西省宝鸡市凤翔县', 0);
INSERT INTO `sys_area` VALUES ('610323', '610300', '岐山县', '陕西省', '宝鸡市', '岐山县', '陕西省宝鸡市岐山县', 0);
INSERT INTO `sys_area` VALUES ('610324', '610300', '扶风县', '陕西省', '宝鸡市', '扶风县', '陕西省宝鸡市扶风县', 0);
INSERT INTO `sys_area` VALUES ('610326', '610300', '眉县', '陕西省', '宝鸡市', '眉县', '陕西省宝鸡市眉县', 0);
INSERT INTO `sys_area` VALUES ('610327', '610300', '陇县', '陕西省', '宝鸡市', '陇县', '陕西省宝鸡市陇县', 0);
INSERT INTO `sys_area` VALUES ('610328', '610300', '千阳县', '陕西省', '宝鸡市', '千阳县', '陕西省宝鸡市千阳县', 0);
INSERT INTO `sys_area` VALUES ('610329', '610300', '麟游县', '陕西省', '宝鸡市', '麟游县', '陕西省宝鸡市麟游县', 0);
INSERT INTO `sys_area` VALUES ('610330', '610300', '凤县', '陕西省', '宝鸡市', '凤县', '陕西省宝鸡市凤县', 0);
INSERT INTO `sys_area` VALUES ('610331', '610300', '太白县', '陕西省', '宝鸡市', '太白县', '陕西省宝鸡市太白县', 0);
INSERT INTO `sys_area` VALUES ('610400', '610000', '咸阳市', '陕西省', '咸阳市', '', '陕西省咸阳市', 0);
INSERT INTO `sys_area` VALUES ('610401', '610400', '市辖区', '陕西省', '咸阳市', '市辖区', '陕西省咸阳市市辖区', 0);
INSERT INTO `sys_area` VALUES ('610402', '610400', '秦都区', '陕西省', '咸阳市', '秦都区', '陕西省咸阳市秦都区', 0);
INSERT INTO `sys_area` VALUES ('610403', '610400', '杨陵区', '陕西省', '咸阳市', '杨陵区', '陕西省咸阳市杨陵区', 0);
INSERT INTO `sys_area` VALUES ('610404', '610400', '渭城区', '陕西省', '咸阳市', '渭城区', '陕西省咸阳市渭城区', 0);
INSERT INTO `sys_area` VALUES ('610422', '610400', '三原县', '陕西省', '咸阳市', '三原县', '陕西省咸阳市三原县', 0);
INSERT INTO `sys_area` VALUES ('610423', '610400', '泾阳县', '陕西省', '咸阳市', '泾阳县', '陕西省咸阳市泾阳县', 0);
INSERT INTO `sys_area` VALUES ('610424', '610400', '乾县', '陕西省', '咸阳市', '乾县', '陕西省咸阳市乾县', 0);
INSERT INTO `sys_area` VALUES ('610425', '610400', '礼泉县', '陕西省', '咸阳市', '礼泉县', '陕西省咸阳市礼泉县', 0);
INSERT INTO `sys_area` VALUES ('610426', '610400', '永寿县', '陕西省', '咸阳市', '永寿县', '陕西省咸阳市永寿县', 0);
INSERT INTO `sys_area` VALUES ('610427', '610400', '彬县', '陕西省', '咸阳市', '彬县', '陕西省咸阳市彬县', 0);
INSERT INTO `sys_area` VALUES ('610428', '610400', '长武县', '陕西省', '咸阳市', '长武县', '陕西省咸阳市长武县', 0);
INSERT INTO `sys_area` VALUES ('610429', '610400', '旬邑县', '陕西省', '咸阳市', '旬邑县', '陕西省咸阳市旬邑县', 0);
INSERT INTO `sys_area` VALUES ('610430', '610400', '淳化县', '陕西省', '咸阳市', '淳化县', '陕西省咸阳市淳化县', 0);
INSERT INTO `sys_area` VALUES ('610431', '610400', '武功县', '陕西省', '咸阳市', '武功县', '陕西省咸阳市武功县', 0);
INSERT INTO `sys_area` VALUES ('610481', '610400', '兴平市', '陕西省', '咸阳市', '兴平市', '陕西省咸阳市兴平市', 0);
INSERT INTO `sys_area` VALUES ('610500', '610000', '渭南市', '陕西省', '渭南市', '', '陕西省渭南市', 0);
INSERT INTO `sys_area` VALUES ('610501', '610500', '市辖区', '陕西省', '渭南市', '市辖区', '陕西省渭南市市辖区', 0);
INSERT INTO `sys_area` VALUES ('610502', '610500', '临渭区', '陕西省', '渭南市', '临渭区', '陕西省渭南市临渭区', 0);
INSERT INTO `sys_area` VALUES ('610503', '610500', '华州区', '陕西省', '渭南市', '华州区', '陕西省渭南市华州区', 0);
INSERT INTO `sys_area` VALUES ('610522', '610500', '潼关县', '陕西省', '渭南市', '潼关县', '陕西省渭南市潼关县', 0);
INSERT INTO `sys_area` VALUES ('610523', '610500', '大荔县', '陕西省', '渭南市', '大荔县', '陕西省渭南市大荔县', 0);
INSERT INTO `sys_area` VALUES ('610524', '610500', '合阳县', '陕西省', '渭南市', '合阳县', '陕西省渭南市合阳县', 0);
INSERT INTO `sys_area` VALUES ('610525', '610500', '澄城县', '陕西省', '渭南市', '澄城县', '陕西省渭南市澄城县', 0);
INSERT INTO `sys_area` VALUES ('610526', '610500', '蒲城县', '陕西省', '渭南市', '蒲城县', '陕西省渭南市蒲城县', 0);
INSERT INTO `sys_area` VALUES ('610527', '610500', '白水县', '陕西省', '渭南市', '白水县', '陕西省渭南市白水县', 0);
INSERT INTO `sys_area` VALUES ('610528', '610500', '富平县', '陕西省', '渭南市', '富平县', '陕西省渭南市富平县', 0);
INSERT INTO `sys_area` VALUES ('610581', '610500', '韩城市', '陕西省', '渭南市', '韩城市', '陕西省渭南市韩城市', 0);
INSERT INTO `sys_area` VALUES ('610582', '610500', '华阴市', '陕西省', '渭南市', '华阴市', '陕西省渭南市华阴市', 0);
INSERT INTO `sys_area` VALUES ('610600', '610000', '延安市', '陕西省', '延安市', '', '陕西省延安市', 0);
INSERT INTO `sys_area` VALUES ('610601', '610600', '市辖区', '陕西省', '延安市', '市辖区', '陕西省延安市市辖区', 0);
INSERT INTO `sys_area` VALUES ('610602', '610600', '宝塔区', '陕西省', '延安市', '宝塔区', '陕西省延安市宝塔区', 0);
INSERT INTO `sys_area` VALUES ('610603', '610600', '安塞区', '陕西省', '延安市', '安塞区', '陕西省延安市安塞区', 0);
INSERT INTO `sys_area` VALUES ('610621', '610600', '延长县', '陕西省', '延安市', '延长县', '陕西省延安市延长县', 0);
INSERT INTO `sys_area` VALUES ('610622', '610600', '延川县', '陕西省', '延安市', '延川县', '陕西省延安市延川县', 0);
INSERT INTO `sys_area` VALUES ('610623', '610600', '子长县', '陕西省', '延安市', '子长县', '陕西省延安市子长县', 0);
INSERT INTO `sys_area` VALUES ('610625', '610600', '志丹县', '陕西省', '延安市', '志丹县', '陕西省延安市志丹县', 0);
INSERT INTO `sys_area` VALUES ('610626', '610600', '吴起县', '陕西省', '延安市', '吴起县', '陕西省延安市吴起县', 0);
INSERT INTO `sys_area` VALUES ('610627', '610600', '甘泉县', '陕西省', '延安市', '甘泉县', '陕西省延安市甘泉县', 0);
INSERT INTO `sys_area` VALUES ('610628', '610600', '富县', '陕西省', '延安市', '富县', '陕西省延安市富县', 0);
INSERT INTO `sys_area` VALUES ('610629', '610600', '洛川县', '陕西省', '延安市', '洛川县', '陕西省延安市洛川县', 0);
INSERT INTO `sys_area` VALUES ('610630', '610600', '宜川县', '陕西省', '延安市', '宜川县', '陕西省延安市宜川县', 0);
INSERT INTO `sys_area` VALUES ('610631', '610600', '黄龙县', '陕西省', '延安市', '黄龙县', '陕西省延安市黄龙县', 0);
INSERT INTO `sys_area` VALUES ('610632', '610600', '黄陵县', '陕西省', '延安市', '黄陵县', '陕西省延安市黄陵县', 0);
INSERT INTO `sys_area` VALUES ('610700', '610000', '汉中市', '陕西省', '汉中市', '', '陕西省汉中市', 0);
INSERT INTO `sys_area` VALUES ('610701', '610700', '市辖区', '陕西省', '汉中市', '市辖区', '陕西省汉中市市辖区', 0);
INSERT INTO `sys_area` VALUES ('610702', '610700', '汉台区', '陕西省', '汉中市', '汉台区', '陕西省汉中市汉台区', 0);
INSERT INTO `sys_area` VALUES ('610721', '610700', '南郑县', '陕西省', '汉中市', '南郑县', '陕西省汉中市南郑县', 0);
INSERT INTO `sys_area` VALUES ('610722', '610700', '城固县', '陕西省', '汉中市', '城固县', '陕西省汉中市城固县', 0);
INSERT INTO `sys_area` VALUES ('610723', '610700', '洋县', '陕西省', '汉中市', '洋县', '陕西省汉中市洋县', 0);
INSERT INTO `sys_area` VALUES ('610724', '610700', '西乡县', '陕西省', '汉中市', '西乡县', '陕西省汉中市西乡县', 0);
INSERT INTO `sys_area` VALUES ('610725', '610700', '勉县', '陕西省', '汉中市', '勉县', '陕西省汉中市勉县', 0);
INSERT INTO `sys_area` VALUES ('610726', '610700', '宁强县', '陕西省', '汉中市', '宁强县', '陕西省汉中市宁强县', 0);
INSERT INTO `sys_area` VALUES ('610727', '610700', '略阳县', '陕西省', '汉中市', '略阳县', '陕西省汉中市略阳县', 0);
INSERT INTO `sys_area` VALUES ('610728', '610700', '镇巴县', '陕西省', '汉中市', '镇巴县', '陕西省汉中市镇巴县', 0);
INSERT INTO `sys_area` VALUES ('610729', '610700', '留坝县', '陕西省', '汉中市', '留坝县', '陕西省汉中市留坝县', 0);
INSERT INTO `sys_area` VALUES ('610730', '610700', '佛坪县', '陕西省', '汉中市', '佛坪县', '陕西省汉中市佛坪县', 0);
INSERT INTO `sys_area` VALUES ('610800', '610000', '榆林市', '陕西省', '榆林市', '', '陕西省榆林市', 0);
INSERT INTO `sys_area` VALUES ('610801', '610800', '市辖区', '陕西省', '榆林市', '市辖区', '陕西省榆林市市辖区', 0);
INSERT INTO `sys_area` VALUES ('610802', '610800', '榆阳区', '陕西省', '榆林市', '榆阳区', '陕西省榆林市榆阳区', 0);
INSERT INTO `sys_area` VALUES ('610803', '610800', '横山区', '陕西省', '榆林市', '横山区', '陕西省榆林市横山区', 0);
INSERT INTO `sys_area` VALUES ('610821', '610800', '神木县', '陕西省', '榆林市', '神木县', '陕西省榆林市神木县', 0);
INSERT INTO `sys_area` VALUES ('610822', '610800', '府谷县', '陕西省', '榆林市', '府谷县', '陕西省榆林市府谷县', 0);
INSERT INTO `sys_area` VALUES ('610824', '610800', '靖边县', '陕西省', '榆林市', '靖边县', '陕西省榆林市靖边县', 0);
INSERT INTO `sys_area` VALUES ('610825', '610800', '定边县', '陕西省', '榆林市', '定边县', '陕西省榆林市定边县', 0);
INSERT INTO `sys_area` VALUES ('610826', '610800', '绥德县', '陕西省', '榆林市', '绥德县', '陕西省榆林市绥德县', 0);
INSERT INTO `sys_area` VALUES ('610827', '610800', '米脂县', '陕西省', '榆林市', '米脂县', '陕西省榆林市米脂县', 0);
INSERT INTO `sys_area` VALUES ('610828', '610800', '佳县', '陕西省', '榆林市', '佳县', '陕西省榆林市佳县', 0);
INSERT INTO `sys_area` VALUES ('610829', '610800', '吴堡县', '陕西省', '榆林市', '吴堡县', '陕西省榆林市吴堡县', 0);
INSERT INTO `sys_area` VALUES ('610830', '610800', '清涧县', '陕西省', '榆林市', '清涧县', '陕西省榆林市清涧县', 0);
INSERT INTO `sys_area` VALUES ('610831', '610800', '子洲县', '陕西省', '榆林市', '子洲县', '陕西省榆林市子洲县', 0);
INSERT INTO `sys_area` VALUES ('610900', '610000', '安康市', '陕西省', '安康市', '', '陕西省安康市', 0);
INSERT INTO `sys_area` VALUES ('610901', '610900', '市辖区', '陕西省', '安康市', '市辖区', '陕西省安康市市辖区', 0);
INSERT INTO `sys_area` VALUES ('610902', '610900', '汉滨区', '陕西省', '安康市', '汉滨区', '陕西省安康市汉滨区', 0);
INSERT INTO `sys_area` VALUES ('610921', '610900', '汉阴县', '陕西省', '安康市', '汉阴县', '陕西省安康市汉阴县', 0);
INSERT INTO `sys_area` VALUES ('610922', '610900', '石泉县', '陕西省', '安康市', '石泉县', '陕西省安康市石泉县', 0);
INSERT INTO `sys_area` VALUES ('610923', '610900', '宁陕县', '陕西省', '安康市', '宁陕县', '陕西省安康市宁陕县', 0);
INSERT INTO `sys_area` VALUES ('610924', '610900', '紫阳县', '陕西省', '安康市', '紫阳县', '陕西省安康市紫阳县', 0);
INSERT INTO `sys_area` VALUES ('610925', '610900', '岚皋县', '陕西省', '安康市', '岚皋县', '陕西省安康市岚皋县', 0);
INSERT INTO `sys_area` VALUES ('610926', '610900', '平利县', '陕西省', '安康市', '平利县', '陕西省安康市平利县', 0);
INSERT INTO `sys_area` VALUES ('610927', '610900', '镇坪县', '陕西省', '安康市', '镇坪县', '陕西省安康市镇坪县', 0);
INSERT INTO `sys_area` VALUES ('610928', '610900', '旬阳县', '陕西省', '安康市', '旬阳县', '陕西省安康市旬阳县', 0);
INSERT INTO `sys_area` VALUES ('610929', '610900', '白河县', '陕西省', '安康市', '白河县', '陕西省安康市白河县', 0);
INSERT INTO `sys_area` VALUES ('611000', '610000', '商洛市', '陕西省', '商洛市', '', '陕西省商洛市', 0);
INSERT INTO `sys_area` VALUES ('611001', '611000', '市辖区', '陕西省', '商洛市', '市辖区', '陕西省商洛市市辖区', 0);
INSERT INTO `sys_area` VALUES ('611002', '611000', '商州区', '陕西省', '商洛市', '商州区', '陕西省商洛市商州区', 0);
INSERT INTO `sys_area` VALUES ('611021', '611000', '洛南县', '陕西省', '商洛市', '洛南县', '陕西省商洛市洛南县', 0);
INSERT INTO `sys_area` VALUES ('611022', '611000', '丹凤县', '陕西省', '商洛市', '丹凤县', '陕西省商洛市丹凤县', 0);
INSERT INTO `sys_area` VALUES ('611023', '611000', '商南县', '陕西省', '商洛市', '商南县', '陕西省商洛市商南县', 0);
INSERT INTO `sys_area` VALUES ('611024', '611000', '山阳县', '陕西省', '商洛市', '山阳县', '陕西省商洛市山阳县', 0);
INSERT INTO `sys_area` VALUES ('611025', '611000', '镇安县', '陕西省', '商洛市', '镇安县', '陕西省商洛市镇安县', 0);
INSERT INTO `sys_area` VALUES ('611026', '611000', '柞水县', '陕西省', '商洛市', '柞水县', '陕西省商洛市柞水县', 0);
INSERT INTO `sys_area` VALUES ('620000', '86', '甘肃省', '甘肃省', '', '', '甘肃省', 0);
INSERT INTO `sys_area` VALUES ('620100', '620000', '兰州市', '甘肃省', '兰州市', '', '甘肃省兰州市', 0);
INSERT INTO `sys_area` VALUES ('620101', '620100', '市辖区', '甘肃省', '兰州市', '市辖区', '甘肃省兰州市市辖区', 0);
INSERT INTO `sys_area` VALUES ('620102', '620100', '城关区', '甘肃省', '兰州市', '城关区', '甘肃省兰州市城关区', 0);
INSERT INTO `sys_area` VALUES ('620103', '620100', '七里河区', '甘肃省', '兰州市', '七里河区', '甘肃省兰州市七里河区', 0);
INSERT INTO `sys_area` VALUES ('620104', '620100', '西固区', '甘肃省', '兰州市', '西固区', '甘肃省兰州市西固区', 0);
INSERT INTO `sys_area` VALUES ('620105', '620100', '安宁区', '甘肃省', '兰州市', '安宁区', '甘肃省兰州市安宁区', 0);
INSERT INTO `sys_area` VALUES ('620111', '620100', '红古区', '甘肃省', '兰州市', '红古区', '甘肃省兰州市红古区', 0);
INSERT INTO `sys_area` VALUES ('620121', '620100', '永登县', '甘肃省', '兰州市', '永登县', '甘肃省兰州市永登县', 0);
INSERT INTO `sys_area` VALUES ('620122', '620100', '皋兰县', '甘肃省', '兰州市', '皋兰县', '甘肃省兰州市皋兰县', 0);
INSERT INTO `sys_area` VALUES ('620123', '620100', '榆中县', '甘肃省', '兰州市', '榆中县', '甘肃省兰州市榆中县', 0);
INSERT INTO `sys_area` VALUES ('620200', '620000', '嘉峪关市', '甘肃省', '嘉峪关市', '', '甘肃省嘉峪关市', 0);
INSERT INTO `sys_area` VALUES ('620201', '620200', '市辖区', '甘肃省', '嘉峪关市', '市辖区', '甘肃省嘉峪关市市辖区', 0);
INSERT INTO `sys_area` VALUES ('620300', '620000', '金昌市', '甘肃省', '金昌市', '', '甘肃省金昌市', 0);
INSERT INTO `sys_area` VALUES ('620301', '620300', '市辖区', '甘肃省', '金昌市', '市辖区', '甘肃省金昌市市辖区', 0);
INSERT INTO `sys_area` VALUES ('620302', '620300', '金川区', '甘肃省', '金昌市', '金川区', '甘肃省金昌市金川区', 0);
INSERT INTO `sys_area` VALUES ('620321', '620300', '永昌县', '甘肃省', '金昌市', '永昌县', '甘肃省金昌市永昌县', 0);
INSERT INTO `sys_area` VALUES ('620400', '620000', '白银市', '甘肃省', '白银市', '', '甘肃省白银市', 0);
INSERT INTO `sys_area` VALUES ('620401', '620400', '市辖区', '甘肃省', '白银市', '市辖区', '甘肃省白银市市辖区', 0);
INSERT INTO `sys_area` VALUES ('620402', '620400', '白银区', '甘肃省', '白银市', '白银区', '甘肃省白银市白银区', 0);
INSERT INTO `sys_area` VALUES ('620403', '620400', '平川区', '甘肃省', '白银市', '平川区', '甘肃省白银市平川区', 0);
INSERT INTO `sys_area` VALUES ('620421', '620400', '靖远县', '甘肃省', '白银市', '靖远县', '甘肃省白银市靖远县', 0);
INSERT INTO `sys_area` VALUES ('620422', '620400', '会宁县', '甘肃省', '白银市', '会宁县', '甘肃省白银市会宁县', 0);
INSERT INTO `sys_area` VALUES ('620423', '620400', '景泰县', '甘肃省', '白银市', '景泰县', '甘肃省白银市景泰县', 0);
INSERT INTO `sys_area` VALUES ('620500', '620000', '天水市', '甘肃省', '天水市', '', '甘肃省天水市', 0);
INSERT INTO `sys_area` VALUES ('620501', '620500', '市辖区', '甘肃省', '天水市', '市辖区', '甘肃省天水市市辖区', 0);
INSERT INTO `sys_area` VALUES ('620502', '620500', '秦州区', '甘肃省', '天水市', '秦州区', '甘肃省天水市秦州区', 0);
INSERT INTO `sys_area` VALUES ('620503', '620500', '麦积区', '甘肃省', '天水市', '麦积区', '甘肃省天水市麦积区', 0);
INSERT INTO `sys_area` VALUES ('620521', '620500', '清水县', '甘肃省', '天水市', '清水县', '甘肃省天水市清水县', 0);
INSERT INTO `sys_area` VALUES ('620522', '620500', '秦安县', '甘肃省', '天水市', '秦安县', '甘肃省天水市秦安县', 0);
INSERT INTO `sys_area` VALUES ('620523', '620500', '甘谷县', '甘肃省', '天水市', '甘谷县', '甘肃省天水市甘谷县', 0);
INSERT INTO `sys_area` VALUES ('620524', '620500', '武山县', '甘肃省', '天水市', '武山县', '甘肃省天水市武山县', 0);
INSERT INTO `sys_area` VALUES ('620525', '620500', '张家川回族自治县', '甘肃省', '天水市', '张家川回族自治县', '甘肃省天水市张家川回族自治县', 0);
INSERT INTO `sys_area` VALUES ('620600', '620000', '武威市', '甘肃省', '武威市', '', '甘肃省武威市', 0);
INSERT INTO `sys_area` VALUES ('620601', '620600', '市辖区', '甘肃省', '武威市', '市辖区', '甘肃省武威市市辖区', 0);
INSERT INTO `sys_area` VALUES ('620602', '620600', '凉州区', '甘肃省', '武威市', '凉州区', '甘肃省武威市凉州区', 0);
INSERT INTO `sys_area` VALUES ('620621', '620600', '民勤县', '甘肃省', '武威市', '民勤县', '甘肃省武威市民勤县', 0);
INSERT INTO `sys_area` VALUES ('620622', '620600', '古浪县', '甘肃省', '武威市', '古浪县', '甘肃省武威市古浪县', 0);
INSERT INTO `sys_area` VALUES ('620623', '620600', '天祝藏族自治县', '甘肃省', '武威市', '天祝藏族自治县', '甘肃省武威市天祝藏族自治县', 0);
INSERT INTO `sys_area` VALUES ('620700', '620000', '张掖市', '甘肃省', '张掖市', '', '甘肃省张掖市', 0);
INSERT INTO `sys_area` VALUES ('620701', '620700', '市辖区', '甘肃省', '张掖市', '市辖区', '甘肃省张掖市市辖区', 0);
INSERT INTO `sys_area` VALUES ('620702', '620700', '甘州区', '甘肃省', '张掖市', '甘州区', '甘肃省张掖市甘州区', 0);
INSERT INTO `sys_area` VALUES ('620721', '620700', '肃南裕固族自治县', '甘肃省', '张掖市', '肃南裕固族自治县', '甘肃省张掖市肃南裕固族自治县', 0);
INSERT INTO `sys_area` VALUES ('620722', '620700', '民乐县', '甘肃省', '张掖市', '民乐县', '甘肃省张掖市民乐县', 0);
INSERT INTO `sys_area` VALUES ('620723', '620700', '临泽县', '甘肃省', '张掖市', '临泽县', '甘肃省张掖市临泽县', 0);
INSERT INTO `sys_area` VALUES ('620724', '620700', '高台县', '甘肃省', '张掖市', '高台县', '甘肃省张掖市高台县', 0);
INSERT INTO `sys_area` VALUES ('620725', '620700', '山丹县', '甘肃省', '张掖市', '山丹县', '甘肃省张掖市山丹县', 0);
INSERT INTO `sys_area` VALUES ('620800', '620000', '平凉市', '甘肃省', '平凉市', '', '甘肃省平凉市', 0);
INSERT INTO `sys_area` VALUES ('620801', '620800', '市辖区', '甘肃省', '平凉市', '市辖区', '甘肃省平凉市市辖区', 0);
INSERT INTO `sys_area` VALUES ('620802', '620800', '崆峒区', '甘肃省', '平凉市', '崆峒区', '甘肃省平凉市崆峒区', 0);
INSERT INTO `sys_area` VALUES ('620821', '620800', '泾川县', '甘肃省', '平凉市', '泾川县', '甘肃省平凉市泾川县', 0);
INSERT INTO `sys_area` VALUES ('620822', '620800', '灵台县', '甘肃省', '平凉市', '灵台县', '甘肃省平凉市灵台县', 0);
INSERT INTO `sys_area` VALUES ('620823', '620800', '崇信县', '甘肃省', '平凉市', '崇信县', '甘肃省平凉市崇信县', 0);
INSERT INTO `sys_area` VALUES ('620824', '620800', '华亭县', '甘肃省', '平凉市', '华亭县', '甘肃省平凉市华亭县', 0);
INSERT INTO `sys_area` VALUES ('620825', '620800', '庄浪县', '甘肃省', '平凉市', '庄浪县', '甘肃省平凉市庄浪县', 0);
INSERT INTO `sys_area` VALUES ('620826', '620800', '静宁县', '甘肃省', '平凉市', '静宁县', '甘肃省平凉市静宁县', 0);
INSERT INTO `sys_area` VALUES ('620900', '620000', '酒泉市', '甘肃省', '酒泉市', '', '甘肃省酒泉市', 0);
INSERT INTO `sys_area` VALUES ('620901', '620900', '市辖区', '甘肃省', '酒泉市', '市辖区', '甘肃省酒泉市市辖区', 0);
INSERT INTO `sys_area` VALUES ('620902', '620900', '肃州区', '甘肃省', '酒泉市', '肃州区', '甘肃省酒泉市肃州区', 0);
INSERT INTO `sys_area` VALUES ('620921', '620900', '金塔县', '甘肃省', '酒泉市', '金塔县', '甘肃省酒泉市金塔县', 0);
INSERT INTO `sys_area` VALUES ('620922', '620900', '瓜州县', '甘肃省', '酒泉市', '瓜州县', '甘肃省酒泉市瓜州县', 0);
INSERT INTO `sys_area` VALUES ('620923', '620900', '肃北蒙古族自治县', '甘肃省', '酒泉市', '肃北蒙古族自治县', '甘肃省酒泉市肃北蒙古族自治县', 0);
INSERT INTO `sys_area` VALUES ('620924', '620900', '阿克塞哈萨克族自治县', '甘肃省', '酒泉市', '阿克塞哈萨克族自治县', '甘肃省酒泉市阿克塞哈萨克族自治县', 0);
INSERT INTO `sys_area` VALUES ('620981', '620900', '玉门市', '甘肃省', '酒泉市', '玉门市', '甘肃省酒泉市玉门市', 0);
INSERT INTO `sys_area` VALUES ('620982', '620900', '敦煌市', '甘肃省', '酒泉市', '敦煌市', '甘肃省酒泉市敦煌市', 0);
INSERT INTO `sys_area` VALUES ('621000', '620000', '庆阳市', '甘肃省', '庆阳市', '', '甘肃省庆阳市', 0);
INSERT INTO `sys_area` VALUES ('621001', '621000', '市辖区', '甘肃省', '庆阳市', '市辖区', '甘肃省庆阳市市辖区', 0);
INSERT INTO `sys_area` VALUES ('621002', '621000', '西峰区', '甘肃省', '庆阳市', '西峰区', '甘肃省庆阳市西峰区', 0);
INSERT INTO `sys_area` VALUES ('621021', '621000', '庆城县', '甘肃省', '庆阳市', '庆城县', '甘肃省庆阳市庆城县', 0);
INSERT INTO `sys_area` VALUES ('621022', '621000', '环县', '甘肃省', '庆阳市', '环县', '甘肃省庆阳市环县', 0);
INSERT INTO `sys_area` VALUES ('621023', '621000', '华池县', '甘肃省', '庆阳市', '华池县', '甘肃省庆阳市华池县', 0);
INSERT INTO `sys_area` VALUES ('621024', '621000', '合水县', '甘肃省', '庆阳市', '合水县', '甘肃省庆阳市合水县', 0);
INSERT INTO `sys_area` VALUES ('621025', '621000', '正宁县', '甘肃省', '庆阳市', '正宁县', '甘肃省庆阳市正宁县', 0);
INSERT INTO `sys_area` VALUES ('621026', '621000', '宁县', '甘肃省', '庆阳市', '宁县', '甘肃省庆阳市宁县', 0);
INSERT INTO `sys_area` VALUES ('621027', '621000', '镇原县', '甘肃省', '庆阳市', '镇原县', '甘肃省庆阳市镇原县', 0);
INSERT INTO `sys_area` VALUES ('621100', '620000', '定西市', '甘肃省', '定西市', '', '甘肃省定西市', 0);
INSERT INTO `sys_area` VALUES ('621101', '621100', '市辖区', '甘肃省', '定西市', '市辖区', '甘肃省定西市市辖区', 0);
INSERT INTO `sys_area` VALUES ('621102', '621100', '安定区', '甘肃省', '定西市', '安定区', '甘肃省定西市安定区', 0);
INSERT INTO `sys_area` VALUES ('621121', '621100', '通渭县', '甘肃省', '定西市', '通渭县', '甘肃省定西市通渭县', 0);
INSERT INTO `sys_area` VALUES ('621122', '621100', '陇西县', '甘肃省', '定西市', '陇西县', '甘肃省定西市陇西县', 0);
INSERT INTO `sys_area` VALUES ('621123', '621100', '渭源县', '甘肃省', '定西市', '渭源县', '甘肃省定西市渭源县', 0);
INSERT INTO `sys_area` VALUES ('621124', '621100', '临洮县', '甘肃省', '定西市', '临洮县', '甘肃省定西市临洮县', 0);
INSERT INTO `sys_area` VALUES ('621125', '621100', '漳县', '甘肃省', '定西市', '漳县', '甘肃省定西市漳县', 0);
INSERT INTO `sys_area` VALUES ('621126', '621100', '岷县', '甘肃省', '定西市', '岷县', '甘肃省定西市岷县', 0);
INSERT INTO `sys_area` VALUES ('621200', '620000', '陇南市', '甘肃省', '陇南市', '', '甘肃省陇南市', 0);
INSERT INTO `sys_area` VALUES ('621201', '621200', '市辖区', '甘肃省', '陇南市', '市辖区', '甘肃省陇南市市辖区', 0);
INSERT INTO `sys_area` VALUES ('621202', '621200', '武都区', '甘肃省', '陇南市', '武都区', '甘肃省陇南市武都区', 0);
INSERT INTO `sys_area` VALUES ('621221', '621200', '成县', '甘肃省', '陇南市', '成县', '甘肃省陇南市成县', 0);
INSERT INTO `sys_area` VALUES ('621222', '621200', '文县', '甘肃省', '陇南市', '文县', '甘肃省陇南市文县', 0);
INSERT INTO `sys_area` VALUES ('621223', '621200', '宕昌县', '甘肃省', '陇南市', '宕昌县', '甘肃省陇南市宕昌县', 0);
INSERT INTO `sys_area` VALUES ('621224', '621200', '康县', '甘肃省', '陇南市', '康县', '甘肃省陇南市康县', 0);
INSERT INTO `sys_area` VALUES ('621225', '621200', '西和县', '甘肃省', '陇南市', '西和县', '甘肃省陇南市西和县', 0);
INSERT INTO `sys_area` VALUES ('621226', '621200', '礼县', '甘肃省', '陇南市', '礼县', '甘肃省陇南市礼县', 0);
INSERT INTO `sys_area` VALUES ('621227', '621200', '徽县', '甘肃省', '陇南市', '徽县', '甘肃省陇南市徽县', 0);
INSERT INTO `sys_area` VALUES ('621228', '621200', '两当县', '甘肃省', '陇南市', '两当县', '甘肃省陇南市两当县', 0);
INSERT INTO `sys_area` VALUES ('622900', '620000', '临夏回族自治州', '甘肃省', '临夏回族自治州', '', '甘肃省临夏回族自治州', 0);
INSERT INTO `sys_area` VALUES ('622901', '622900', '临夏市', '甘肃省', '临夏回族自治州', '临夏市', '甘肃省临夏回族自治州临夏市', 0);
INSERT INTO `sys_area` VALUES ('622921', '622900', '临夏县', '甘肃省', '临夏回族自治州', '临夏县', '甘肃省临夏回族自治州临夏县', 0);
INSERT INTO `sys_area` VALUES ('622922', '622900', '康乐县', '甘肃省', '临夏回族自治州', '康乐县', '甘肃省临夏回族自治州康乐县', 0);
INSERT INTO `sys_area` VALUES ('622923', '622900', '永靖县', '甘肃省', '临夏回族自治州', '永靖县', '甘肃省临夏回族自治州永靖县', 0);
INSERT INTO `sys_area` VALUES ('622924', '622900', '广河县', '甘肃省', '临夏回族自治州', '广河县', '甘肃省临夏回族自治州广河县', 0);
INSERT INTO `sys_area` VALUES ('622925', '622900', '和政县', '甘肃省', '临夏回族自治州', '和政县', '甘肃省临夏回族自治州和政县', 0);
INSERT INTO `sys_area` VALUES ('622926', '622900', '东乡族自治县', '甘肃省', '临夏回族自治州', '东乡族自治县', '甘肃省临夏回族自治州东乡族自治县', 0);
INSERT INTO `sys_area` VALUES ('622927', '622900', '积石山保安族东乡族撒拉族自治县', '甘肃省', '临夏回族自治州', '积石山保安族东乡族撒拉族自治县', '甘肃省临夏回族自治州积石山保安族东乡族撒拉族自治县', 0);
INSERT INTO `sys_area` VALUES ('623000', '620000', '甘南藏族自治州', '甘肃省', '甘南藏族自治州', '', '甘肃省甘南藏族自治州', 0);
INSERT INTO `sys_area` VALUES ('623001', '623000', '合作市', '甘肃省', '甘南藏族自治州', '合作市', '甘肃省甘南藏族自治州合作市', 0);
INSERT INTO `sys_area` VALUES ('623021', '623000', '临潭县', '甘肃省', '甘南藏族自治州', '临潭县', '甘肃省甘南藏族自治州临潭县', 0);
INSERT INTO `sys_area` VALUES ('623022', '623000', '卓尼县', '甘肃省', '甘南藏族自治州', '卓尼县', '甘肃省甘南藏族自治州卓尼县', 0);
INSERT INTO `sys_area` VALUES ('623023', '623000', '舟曲县', '甘肃省', '甘南藏族自治州', '舟曲县', '甘肃省甘南藏族自治州舟曲县', 0);
INSERT INTO `sys_area` VALUES ('623024', '623000', '迭部县', '甘肃省', '甘南藏族自治州', '迭部县', '甘肃省甘南藏族自治州迭部县', 0);
INSERT INTO `sys_area` VALUES ('623025', '623000', '玛曲县', '甘肃省', '甘南藏族自治州', '玛曲县', '甘肃省甘南藏族自治州玛曲县', 0);
INSERT INTO `sys_area` VALUES ('623026', '623000', '碌曲县', '甘肃省', '甘南藏族自治州', '碌曲县', '甘肃省甘南藏族自治州碌曲县', 0);
INSERT INTO `sys_area` VALUES ('623027', '623000', '夏河县', '甘肃省', '甘南藏族自治州', '夏河县', '甘肃省甘南藏族自治州夏河县', 0);
INSERT INTO `sys_area` VALUES ('630000', '86', '青海省', '青海省', '', '', '青海省', 0);
INSERT INTO `sys_area` VALUES ('630100', '630000', '西宁市', '青海省', '西宁市', '', '青海省西宁市', 0);
INSERT INTO `sys_area` VALUES ('630101', '630100', '市辖区', '青海省', '西宁市', '市辖区', '青海省西宁市市辖区', 0);
INSERT INTO `sys_area` VALUES ('630102', '630100', '城东区', '青海省', '西宁市', '城东区', '青海省西宁市城东区', 0);
INSERT INTO `sys_area` VALUES ('630103', '630100', '城中区', '青海省', '西宁市', '城中区', '青海省西宁市城中区', 0);
INSERT INTO `sys_area` VALUES ('630104', '630100', '城西区', '青海省', '西宁市', '城西区', '青海省西宁市城西区', 0);
INSERT INTO `sys_area` VALUES ('630105', '630100', '城北区', '青海省', '西宁市', '城北区', '青海省西宁市城北区', 0);
INSERT INTO `sys_area` VALUES ('630121', '630100', '大通回族土族自治县', '青海省', '西宁市', '大通回族土族自治县', '青海省西宁市大通回族土族自治县', 0);
INSERT INTO `sys_area` VALUES ('630122', '630100', '湟中县', '青海省', '西宁市', '湟中县', '青海省西宁市湟中县', 0);
INSERT INTO `sys_area` VALUES ('630123', '630100', '湟源县', '青海省', '西宁市', '湟源县', '青海省西宁市湟源县', 0);
INSERT INTO `sys_area` VALUES ('630200', '630000', '海东市', '青海省', '海东市', '', '青海省海东市', 0);
INSERT INTO `sys_area` VALUES ('630202', '630200', '乐都区', '青海省', '海东市', '乐都区', '青海省海东市乐都区', 0);
INSERT INTO `sys_area` VALUES ('630203', '630200', '平安区', '青海省', '海东市', '平安区', '青海省海东市平安区', 0);
INSERT INTO `sys_area` VALUES ('630222', '630200', '民和回族土族自治县', '青海省', '海东市', '民和回族土族自治县', '青海省海东市民和回族土族自治县', 0);
INSERT INTO `sys_area` VALUES ('630223', '630200', '互助土族自治县', '青海省', '海东市', '互助土族自治县', '青海省海东市互助土族自治县', 0);
INSERT INTO `sys_area` VALUES ('630224', '630200', '化隆回族自治县', '青海省', '海东市', '化隆回族自治县', '青海省海东市化隆回族自治县', 0);
INSERT INTO `sys_area` VALUES ('630225', '630200', '循化撒拉族自治县', '青海省', '海东市', '循化撒拉族自治县', '青海省海东市循化撒拉族自治县', 0);
INSERT INTO `sys_area` VALUES ('632200', '630000', '海北藏族自治州', '青海省', '海北藏族自治州', '', '青海省海北藏族自治州', 0);
INSERT INTO `sys_area` VALUES ('632221', '632200', '门源回族自治县', '青海省', '海北藏族自治州', '门源回族自治县', '青海省海北藏族自治州门源回族自治县', 0);
INSERT INTO `sys_area` VALUES ('632222', '632200', '祁连县', '青海省', '海北藏族自治州', '祁连县', '青海省海北藏族自治州祁连县', 0);
INSERT INTO `sys_area` VALUES ('632223', '632200', '海晏县', '青海省', '海北藏族自治州', '海晏县', '青海省海北藏族自治州海晏县', 0);
INSERT INTO `sys_area` VALUES ('632224', '632200', '刚察县', '青海省', '海北藏族自治州', '刚察县', '青海省海北藏族自治州刚察县', 0);
INSERT INTO `sys_area` VALUES ('632300', '630000', '黄南藏族自治州', '青海省', '黄南藏族自治州', '', '青海省黄南藏族自治州', 0);
INSERT INTO `sys_area` VALUES ('632321', '632300', '同仁县', '青海省', '黄南藏族自治州', '同仁县', '青海省黄南藏族自治州同仁县', 0);
INSERT INTO `sys_area` VALUES ('632322', '632300', '尖扎县', '青海省', '黄南藏族自治州', '尖扎县', '青海省黄南藏族自治州尖扎县', 0);
INSERT INTO `sys_area` VALUES ('632323', '632300', '泽库县', '青海省', '黄南藏族自治州', '泽库县', '青海省黄南藏族自治州泽库县', 0);
INSERT INTO `sys_area` VALUES ('632324', '632300', '河南蒙古族自治县', '青海省', '黄南藏族自治州', '河南蒙古族自治县', '青海省黄南藏族自治州河南蒙古族自治县', 0);
INSERT INTO `sys_area` VALUES ('632500', '630000', '海南藏族自治州', '青海省', '海南藏族自治州', '', '青海省海南藏族自治州', 0);
INSERT INTO `sys_area` VALUES ('632521', '632500', '共和县', '青海省', '海南藏族自治州', '共和县', '青海省海南藏族自治州共和县', 0);
INSERT INTO `sys_area` VALUES ('632522', '632500', '同德县', '青海省', '海南藏族自治州', '同德县', '青海省海南藏族自治州同德县', 0);
INSERT INTO `sys_area` VALUES ('632523', '632500', '贵德县', '青海省', '海南藏族自治州', '贵德县', '青海省海南藏族自治州贵德县', 0);
INSERT INTO `sys_area` VALUES ('632524', '632500', '兴海县', '青海省', '海南藏族自治州', '兴海县', '青海省海南藏族自治州兴海县', 0);
INSERT INTO `sys_area` VALUES ('632525', '632500', '贵南县', '青海省', '海南藏族自治州', '贵南县', '青海省海南藏族自治州贵南县', 0);
INSERT INTO `sys_area` VALUES ('632600', '630000', '果洛藏族自治州', '青海省', '果洛藏族自治州', '', '青海省果洛藏族自治州', 0);
INSERT INTO `sys_area` VALUES ('632621', '632600', '玛沁县', '青海省', '果洛藏族自治州', '玛沁县', '青海省果洛藏族自治州玛沁县', 0);
INSERT INTO `sys_area` VALUES ('632622', '632600', '班玛县', '青海省', '果洛藏族自治州', '班玛县', '青海省果洛藏族自治州班玛县', 0);
INSERT INTO `sys_area` VALUES ('632623', '632600', '甘德县', '青海省', '果洛藏族自治州', '甘德县', '青海省果洛藏族自治州甘德县', 0);
INSERT INTO `sys_area` VALUES ('632624', '632600', '达日县', '青海省', '果洛藏族自治州', '达日县', '青海省果洛藏族自治州达日县', 0);
INSERT INTO `sys_area` VALUES ('632625', '632600', '久治县', '青海省', '果洛藏族自治州', '久治县', '青海省果洛藏族自治州久治县', 0);
INSERT INTO `sys_area` VALUES ('632626', '632600', '玛多县', '青海省', '果洛藏族自治州', '玛多县', '青海省果洛藏族自治州玛多县', 0);
INSERT INTO `sys_area` VALUES ('632700', '630000', '玉树藏族自治州', '青海省', '玉树藏族自治州', '', '青海省玉树藏族自治州', 0);
INSERT INTO `sys_area` VALUES ('632701', '632700', '玉树市', '青海省', '玉树藏族自治州', '玉树市', '青海省玉树藏族自治州玉树市', 0);
INSERT INTO `sys_area` VALUES ('632722', '632700', '杂多县', '青海省', '玉树藏族自治州', '杂多县', '青海省玉树藏族自治州杂多县', 0);
INSERT INTO `sys_area` VALUES ('632723', '632700', '称多县', '青海省', '玉树藏族自治州', '称多县', '青海省玉树藏族自治州称多县', 0);
INSERT INTO `sys_area` VALUES ('632724', '632700', '治多县', '青海省', '玉树藏族自治州', '治多县', '青海省玉树藏族自治州治多县', 0);
INSERT INTO `sys_area` VALUES ('632725', '632700', '囊谦县', '青海省', '玉树藏族自治州', '囊谦县', '青海省玉树藏族自治州囊谦县', 0);
INSERT INTO `sys_area` VALUES ('632726', '632700', '曲麻莱县', '青海省', '玉树藏族自治州', '曲麻莱县', '青海省玉树藏族自治州曲麻莱县', 0);
INSERT INTO `sys_area` VALUES ('632800', '630000', '海西蒙古族藏族自治州', '青海省', '海西蒙古族藏族自治州', '', '青海省海西蒙古族藏族自治州', 0);
INSERT INTO `sys_area` VALUES ('632801', '632800', '格尔木市', '青海省', '海西蒙古族藏族自治州', '格尔木市', '青海省海西蒙古族藏族自治州格尔木市', 0);
INSERT INTO `sys_area` VALUES ('632802', '632800', '德令哈市', '青海省', '海西蒙古族藏族自治州', '德令哈市', '青海省海西蒙古族藏族自治州德令哈市', 0);
INSERT INTO `sys_area` VALUES ('632821', '632800', '乌兰县', '青海省', '海西蒙古族藏族自治州', '乌兰县', '青海省海西蒙古族藏族自治州乌兰县', 0);
INSERT INTO `sys_area` VALUES ('632822', '632800', '都兰县', '青海省', '海西蒙古族藏族自治州', '都兰县', '青海省海西蒙古族藏族自治州都兰县', 0);
INSERT INTO `sys_area` VALUES ('632823', '632800', '天峻县', '青海省', '海西蒙古族藏族自治州', '天峻县', '青海省海西蒙古族藏族自治州天峻县', 0);
INSERT INTO `sys_area` VALUES ('640000', '86', '宁夏回族自治区', '宁夏回族自治区', '', '', '宁夏回族自治区', 0);
INSERT INTO `sys_area` VALUES ('640100', '640000', '银川市', '宁夏回族自治区', '银川市', '', '宁夏回族自治区银川市', 0);
INSERT INTO `sys_area` VALUES ('640101', '640100', '市辖区', '宁夏回族自治区', '银川市', '市辖区', '宁夏回族自治区银川市市辖区', 0);
INSERT INTO `sys_area` VALUES ('640104', '640100', '兴庆区', '宁夏回族自治区', '银川市', '兴庆区', '宁夏回族自治区银川市兴庆区', 0);
INSERT INTO `sys_area` VALUES ('640105', '640100', '西夏区', '宁夏回族自治区', '银川市', '西夏区', '宁夏回族自治区银川市西夏区', 0);
INSERT INTO `sys_area` VALUES ('640106', '640100', '金凤区', '宁夏回族自治区', '银川市', '金凤区', '宁夏回族自治区银川市金凤区', 0);
INSERT INTO `sys_area` VALUES ('640121', '640100', '永宁县', '宁夏回族自治区', '银川市', '永宁县', '宁夏回族自治区银川市永宁县', 0);
INSERT INTO `sys_area` VALUES ('640122', '640100', '贺兰县', '宁夏回族自治区', '银川市', '贺兰县', '宁夏回族自治区银川市贺兰县', 0);
INSERT INTO `sys_area` VALUES ('640181', '640100', '灵武市', '宁夏回族自治区', '银川市', '灵武市', '宁夏回族自治区银川市灵武市', 0);
INSERT INTO `sys_area` VALUES ('640200', '640000', '石嘴山市', '宁夏回族自治区', '石嘴山市', '', '宁夏回族自治区石嘴山市', 0);
INSERT INTO `sys_area` VALUES ('640201', '640200', '市辖区', '宁夏回族自治区', '石嘴山市', '市辖区', '宁夏回族自治区石嘴山市市辖区', 0);
INSERT INTO `sys_area` VALUES ('640202', '640200', '大武口区', '宁夏回族自治区', '石嘴山市', '大武口区', '宁夏回族自治区石嘴山市大武口区', 0);
INSERT INTO `sys_area` VALUES ('640205', '640200', '惠农区', '宁夏回族自治区', '石嘴山市', '惠农区', '宁夏回族自治区石嘴山市惠农区', 0);
INSERT INTO `sys_area` VALUES ('640221', '640200', '平罗县', '宁夏回族自治区', '石嘴山市', '平罗县', '宁夏回族自治区石嘴山市平罗县', 0);
INSERT INTO `sys_area` VALUES ('640300', '640000', '吴忠市', '宁夏回族自治区', '吴忠市', '', '宁夏回族自治区吴忠市', 0);
INSERT INTO `sys_area` VALUES ('640301', '640300', '市辖区', '宁夏回族自治区', '吴忠市', '市辖区', '宁夏回族自治区吴忠市市辖区', 0);
INSERT INTO `sys_area` VALUES ('640302', '640300', '利通区', '宁夏回族自治区', '吴忠市', '利通区', '宁夏回族自治区吴忠市利通区', 0);
INSERT INTO `sys_area` VALUES ('640303', '640300', '红寺堡区', '宁夏回族自治区', '吴忠市', '红寺堡区', '宁夏回族自治区吴忠市红寺堡区', 0);
INSERT INTO `sys_area` VALUES ('640323', '640300', '盐池县', '宁夏回族自治区', '吴忠市', '盐池县', '宁夏回族自治区吴忠市盐池县', 0);
INSERT INTO `sys_area` VALUES ('640324', '640300', '同心县', '宁夏回族自治区', '吴忠市', '同心县', '宁夏回族自治区吴忠市同心县', 0);
INSERT INTO `sys_area` VALUES ('640381', '640300', '青铜峡市', '宁夏回族自治区', '吴忠市', '青铜峡市', '宁夏回族自治区吴忠市青铜峡市', 0);
INSERT INTO `sys_area` VALUES ('640400', '640000', '固原市', '宁夏回族自治区', '固原市', '', '宁夏回族自治区固原市', 0);
INSERT INTO `sys_area` VALUES ('640401', '640400', '市辖区', '宁夏回族自治区', '固原市', '市辖区', '宁夏回族自治区固原市市辖区', 0);
INSERT INTO `sys_area` VALUES ('640402', '640400', '原州区', '宁夏回族自治区', '固原市', '原州区', '宁夏回族自治区固原市原州区', 0);
INSERT INTO `sys_area` VALUES ('640422', '640400', '西吉县', '宁夏回族自治区', '固原市', '西吉县', '宁夏回族自治区固原市西吉县', 0);
INSERT INTO `sys_area` VALUES ('640423', '640400', '隆德县', '宁夏回族自治区', '固原市', '隆德县', '宁夏回族自治区固原市隆德县', 0);
INSERT INTO `sys_area` VALUES ('640424', '640400', '泾源县', '宁夏回族自治区', '固原市', '泾源县', '宁夏回族自治区固原市泾源县', 0);
INSERT INTO `sys_area` VALUES ('640425', '640400', '彭阳县', '宁夏回族自治区', '固原市', '彭阳县', '宁夏回族自治区固原市彭阳县', 0);
INSERT INTO `sys_area` VALUES ('640500', '640000', '中卫市', '宁夏回族自治区', '中卫市', '', '宁夏回族自治区中卫市', 0);
INSERT INTO `sys_area` VALUES ('640501', '640500', '市辖区', '宁夏回族自治区', '中卫市', '市辖区', '宁夏回族自治区中卫市市辖区', 0);
INSERT INTO `sys_area` VALUES ('640502', '640500', '沙坡头区', '宁夏回族自治区', '中卫市', '沙坡头区', '宁夏回族自治区中卫市沙坡头区', 0);
INSERT INTO `sys_area` VALUES ('640521', '640500', '中宁县', '宁夏回族自治区', '中卫市', '中宁县', '宁夏回族自治区中卫市中宁县', 0);
INSERT INTO `sys_area` VALUES ('640522', '640500', '海原县', '宁夏回族自治区', '中卫市', '海原县', '宁夏回族自治区中卫市海原县', 0);
INSERT INTO `sys_area` VALUES ('650000', '86', '新疆维吾尔自治区', '新疆维吾尔自治区', '', '', '新疆维吾尔自治区', 0);
INSERT INTO `sys_area` VALUES ('650100', '650000', '乌鲁木齐市', '新疆维吾尔自治区', '乌鲁木齐市', '', '新疆维吾尔自治区乌鲁木齐市', 0);
INSERT INTO `sys_area` VALUES ('650101', '650100', '市辖区', '新疆维吾尔自治区', '乌鲁木齐市', '市辖区', '新疆维吾尔自治区乌鲁木齐市市辖区', 0);
INSERT INTO `sys_area` VALUES ('650102', '650100', '天山区', '新疆维吾尔自治区', '乌鲁木齐市', '天山区', '新疆维吾尔自治区乌鲁木齐市天山区', 0);
INSERT INTO `sys_area` VALUES ('650103', '650100', '沙依巴克区', '新疆维吾尔自治区', '乌鲁木齐市', '沙依巴克区', '新疆维吾尔自治区乌鲁木齐市沙依巴克区', 0);
INSERT INTO `sys_area` VALUES ('650104', '650100', '新市区', '新疆维吾尔自治区', '乌鲁木齐市', '新市区', '新疆维吾尔自治区乌鲁木齐市新市区', 0);
INSERT INTO `sys_area` VALUES ('650105', '650100', '水磨沟区', '新疆维吾尔自治区', '乌鲁木齐市', '水磨沟区', '新疆维吾尔自治区乌鲁木齐市水磨沟区', 0);
INSERT INTO `sys_area` VALUES ('650106', '650100', '头屯河区', '新疆维吾尔自治区', '乌鲁木齐市', '头屯河区', '新疆维吾尔自治区乌鲁木齐市头屯河区', 0);
INSERT INTO `sys_area` VALUES ('650107', '650100', '达坂城区', '新疆维吾尔自治区', '乌鲁木齐市', '达坂城区', '新疆维吾尔自治区乌鲁木齐市达坂城区', 0);
INSERT INTO `sys_area` VALUES ('650109', '650100', '米东区', '新疆维吾尔自治区', '乌鲁木齐市', '米东区', '新疆维吾尔自治区乌鲁木齐市米东区', 0);
INSERT INTO `sys_area` VALUES ('650121', '650100', '乌鲁木齐县', '新疆维吾尔自治区', '乌鲁木齐市', '乌鲁木齐县', '新疆维吾尔自治区乌鲁木齐市乌鲁木齐县', 0);
INSERT INTO `sys_area` VALUES ('650200', '650000', '克拉玛依市', '新疆维吾尔自治区', '克拉玛依市', '', '新疆维吾尔自治区克拉玛依市', 0);
INSERT INTO `sys_area` VALUES ('650201', '650200', '市辖区', '新疆维吾尔自治区', '克拉玛依市', '市辖区', '新疆维吾尔自治区克拉玛依市市辖区', 0);
INSERT INTO `sys_area` VALUES ('650202', '650200', '独山子区', '新疆维吾尔自治区', '克拉玛依市', '独山子区', '新疆维吾尔自治区克拉玛依市独山子区', 0);
INSERT INTO `sys_area` VALUES ('650203', '650200', '克拉玛依区', '新疆维吾尔自治区', '克拉玛依市', '克拉玛依区', '新疆维吾尔自治区克拉玛依市克拉玛依区', 0);
INSERT INTO `sys_area` VALUES ('650204', '650200', '白碱滩区', '新疆维吾尔自治区', '克拉玛依市', '白碱滩区', '新疆维吾尔自治区克拉玛依市白碱滩区', 0);
INSERT INTO `sys_area` VALUES ('650205', '650200', '乌尔禾区', '新疆维吾尔自治区', '克拉玛依市', '乌尔禾区', '新疆维吾尔自治区克拉玛依市乌尔禾区', 0);
INSERT INTO `sys_area` VALUES ('650400', '650000', '吐鲁番市', '新疆维吾尔自治区', '吐鲁番市', '', '新疆维吾尔自治区吐鲁番市', 0);
INSERT INTO `sys_area` VALUES ('650402', '650400', '高昌区', '新疆维吾尔自治区', '吐鲁番市', '高昌区', '新疆维吾尔自治区吐鲁番市高昌区', 0);
INSERT INTO `sys_area` VALUES ('650421', '650400', '鄯善县', '新疆维吾尔自治区', '吐鲁番市', '鄯善县', '新疆维吾尔自治区吐鲁番市鄯善县', 0);
INSERT INTO `sys_area` VALUES ('650422', '650400', '托克逊县', '新疆维吾尔自治区', '吐鲁番市', '托克逊县', '新疆维吾尔自治区吐鲁番市托克逊县', 0);
INSERT INTO `sys_area` VALUES ('650500', '650000', '哈密市', '新疆维吾尔自治区', '哈密市', '', '新疆维吾尔自治区哈密市', 0);
INSERT INTO `sys_area` VALUES ('650502', '650500', '伊州区', '新疆维吾尔自治区', '哈密市', '伊州区', '新疆维吾尔自治区哈密市伊州区', 0);
INSERT INTO `sys_area` VALUES ('650521', '650500', '巴里坤哈萨克自治县', '新疆维吾尔自治区', '哈密市', '巴里坤哈萨克自治县', '新疆维吾尔自治区哈密市巴里坤哈萨克自治县', 0);
INSERT INTO `sys_area` VALUES ('650522', '650500', '伊吾县', '新疆维吾尔自治区', '哈密市', '伊吾县', '新疆维吾尔自治区哈密市伊吾县', 0);
INSERT INTO `sys_area` VALUES ('652300', '650000', '昌吉回族自治州', '新疆维吾尔自治区', '昌吉回族自治州', '', '新疆维吾尔自治区昌吉回族自治州', 0);
INSERT INTO `sys_area` VALUES ('652301', '652300', '昌吉市', '新疆维吾尔自治区', '昌吉回族自治州', '昌吉市', '新疆维吾尔自治区昌吉回族自治州昌吉市', 0);
INSERT INTO `sys_area` VALUES ('652302', '652300', '阜康市', '新疆维吾尔自治区', '昌吉回族自治州', '阜康市', '新疆维吾尔自治区昌吉回族自治州阜康市', 0);
INSERT INTO `sys_area` VALUES ('652323', '652300', '呼图壁县', '新疆维吾尔自治区', '昌吉回族自治州', '呼图壁县', '新疆维吾尔自治区昌吉回族自治州呼图壁县', 0);
INSERT INTO `sys_area` VALUES ('652324', '652300', '玛纳斯县', '新疆维吾尔自治区', '昌吉回族自治州', '玛纳斯县', '新疆维吾尔自治区昌吉回族自治州玛纳斯县', 0);
INSERT INTO `sys_area` VALUES ('652325', '652300', '奇台县', '新疆维吾尔自治区', '昌吉回族自治州', '奇台县', '新疆维吾尔自治区昌吉回族自治州奇台县', 0);
INSERT INTO `sys_area` VALUES ('652327', '652300', '吉木萨尔县', '新疆维吾尔自治区', '昌吉回族自治州', '吉木萨尔县', '新疆维吾尔自治区昌吉回族自治州吉木萨尔县', 0);
INSERT INTO `sys_area` VALUES ('652328', '652300', '木垒哈萨克自治县', '新疆维吾尔自治区', '昌吉回族自治州', '木垒哈萨克自治县', '新疆维吾尔自治区昌吉回族自治州木垒哈萨克自治县', 0);
INSERT INTO `sys_area` VALUES ('652700', '650000', '博尔塔拉蒙古自治州', '新疆维吾尔自治区', '博尔塔拉蒙古自治州', '', '新疆维吾尔自治区博尔塔拉蒙古自治州', 0);
INSERT INTO `sys_area` VALUES ('652701', '652700', '博乐市', '新疆维吾尔自治区', '博尔塔拉蒙古自治州', '博乐市', '新疆维吾尔自治区博尔塔拉蒙古自治州博乐市', 0);
INSERT INTO `sys_area` VALUES ('652702', '652700', '阿拉山口市', '新疆维吾尔自治区', '博尔塔拉蒙古自治州', '阿拉山口市', '新疆维吾尔自治区博尔塔拉蒙古自治州阿拉山口市', 0);
INSERT INTO `sys_area` VALUES ('652722', '652700', '精河县', '新疆维吾尔自治区', '博尔塔拉蒙古自治州', '精河县', '新疆维吾尔自治区博尔塔拉蒙古自治州精河县', 0);
INSERT INTO `sys_area` VALUES ('652723', '652700', '温泉县', '新疆维吾尔自治区', '博尔塔拉蒙古自治州', '温泉县', '新疆维吾尔自治区博尔塔拉蒙古自治州温泉县', 0);
INSERT INTO `sys_area` VALUES ('652800', '650000', '巴音郭楞蒙古自治州', '新疆维吾尔自治区', '巴音郭楞蒙古自治州', '', '新疆维吾尔自治区巴音郭楞蒙古自治州', 0);
INSERT INTO `sys_area` VALUES ('652801', '652800', '库尔勒市', '新疆维吾尔自治区', '巴音郭楞蒙古自治州', '库尔勒市', '新疆维吾尔自治区巴音郭楞蒙古自治州库尔勒市', 0);
INSERT INTO `sys_area` VALUES ('652822', '652800', '轮台县', '新疆维吾尔自治区', '巴音郭楞蒙古自治州', '轮台县', '新疆维吾尔自治区巴音郭楞蒙古自治州轮台县', 0);
INSERT INTO `sys_area` VALUES ('652823', '652800', '尉犁县', '新疆维吾尔自治区', '巴音郭楞蒙古自治州', '尉犁县', '新疆维吾尔自治区巴音郭楞蒙古自治州尉犁县', 0);
INSERT INTO `sys_area` VALUES ('652824', '652800', '若羌县', '新疆维吾尔自治区', '巴音郭楞蒙古自治州', '若羌县', '新疆维吾尔自治区巴音郭楞蒙古自治州若羌县', 0);
INSERT INTO `sys_area` VALUES ('652825', '652800', '且末县', '新疆维吾尔自治区', '巴音郭楞蒙古自治州', '且末县', '新疆维吾尔自治区巴音郭楞蒙古自治州且末县', 0);
INSERT INTO `sys_area` VALUES ('652826', '652800', '焉耆回族自治县', '新疆维吾尔自治区', '巴音郭楞蒙古自治州', '焉耆回族自治县', '新疆维吾尔自治区巴音郭楞蒙古自治州焉耆回族自治县', 0);
INSERT INTO `sys_area` VALUES ('652827', '652800', '和静县', '新疆维吾尔自治区', '巴音郭楞蒙古自治州', '和静县', '新疆维吾尔自治区巴音郭楞蒙古自治州和静县', 0);
INSERT INTO `sys_area` VALUES ('652828', '652800', '和硕县', '新疆维吾尔自治区', '巴音郭楞蒙古自治州', '和硕县', '新疆维吾尔自治区巴音郭楞蒙古自治州和硕县', 0);
INSERT INTO `sys_area` VALUES ('652829', '652800', '博湖县', '新疆维吾尔自治区', '巴音郭楞蒙古自治州', '博湖县', '新疆维吾尔自治区巴音郭楞蒙古自治州博湖县', 0);
INSERT INTO `sys_area` VALUES ('652900', '650000', '阿克苏地区', '新疆维吾尔自治区', '阿克苏地区', '', '新疆维吾尔自治区阿克苏地区', 0);
INSERT INTO `sys_area` VALUES ('652901', '652900', '阿克苏市', '新疆维吾尔自治区', '阿克苏地区', '阿克苏市', '新疆维吾尔自治区阿克苏地区阿克苏市', 0);
INSERT INTO `sys_area` VALUES ('652922', '652900', '温宿县', '新疆维吾尔自治区', '阿克苏地区', '温宿县', '新疆维吾尔自治区阿克苏地区温宿县', 0);
INSERT INTO `sys_area` VALUES ('652923', '652900', '库车县', '新疆维吾尔自治区', '阿克苏地区', '库车县', '新疆维吾尔自治区阿克苏地区库车县', 0);
INSERT INTO `sys_area` VALUES ('652924', '652900', '沙雅县', '新疆维吾尔自治区', '阿克苏地区', '沙雅县', '新疆维吾尔自治区阿克苏地区沙雅县', 0);
INSERT INTO `sys_area` VALUES ('652925', '652900', '新和县', '新疆维吾尔自治区', '阿克苏地区', '新和县', '新疆维吾尔自治区阿克苏地区新和县', 0);
INSERT INTO `sys_area` VALUES ('652926', '652900', '拜城县', '新疆维吾尔自治区', '阿克苏地区', '拜城县', '新疆维吾尔自治区阿克苏地区拜城县', 0);
INSERT INTO `sys_area` VALUES ('652927', '652900', '乌什县', '新疆维吾尔自治区', '阿克苏地区', '乌什县', '新疆维吾尔自治区阿克苏地区乌什县', 0);
INSERT INTO `sys_area` VALUES ('652928', '652900', '阿瓦提县', '新疆维吾尔自治区', '阿克苏地区', '阿瓦提县', '新疆维吾尔自治区阿克苏地区阿瓦提县', 0);
INSERT INTO `sys_area` VALUES ('652929', '652900', '柯坪县', '新疆维吾尔自治区', '阿克苏地区', '柯坪县', '新疆维吾尔自治区阿克苏地区柯坪县', 0);
INSERT INTO `sys_area` VALUES ('653000', '650000', '克孜勒苏柯尔克孜自治州', '新疆维吾尔自治区', '克孜勒苏柯尔克孜自治州', '', '新疆维吾尔自治区克孜勒苏柯尔克孜自治州', 0);
INSERT INTO `sys_area` VALUES ('653001', '653000', '阿图什市', '新疆维吾尔自治区', '克孜勒苏柯尔克孜自治州', '阿图什市', '新疆维吾尔自治区克孜勒苏柯尔克孜自治州阿图什市', 0);
INSERT INTO `sys_area` VALUES ('653022', '653000', '阿克陶县', '新疆维吾尔自治区', '克孜勒苏柯尔克孜自治州', '阿克陶县', '新疆维吾尔自治区克孜勒苏柯尔克孜自治州阿克陶县', 0);
INSERT INTO `sys_area` VALUES ('653023', '653000', '阿合奇县', '新疆维吾尔自治区', '克孜勒苏柯尔克孜自治州', '阿合奇县', '新疆维吾尔自治区克孜勒苏柯尔克孜自治州阿合奇县', 0);
INSERT INTO `sys_area` VALUES ('653024', '653000', '乌恰县', '新疆维吾尔自治区', '克孜勒苏柯尔克孜自治州', '乌恰县', '新疆维吾尔自治区克孜勒苏柯尔克孜自治州乌恰县', 0);
INSERT INTO `sys_area` VALUES ('653100', '650000', '喀什地区', '新疆维吾尔自治区', '喀什地区', '', '新疆维吾尔自治区喀什地区', 0);
INSERT INTO `sys_area` VALUES ('653101', '653100', '喀什市', '新疆维吾尔自治区', '喀什地区', '喀什市', '新疆维吾尔自治区喀什地区喀什市', 0);
INSERT INTO `sys_area` VALUES ('653121', '653100', '疏附县', '新疆维吾尔自治区', '喀什地区', '疏附县', '新疆维吾尔自治区喀什地区疏附县', 0);
INSERT INTO `sys_area` VALUES ('653122', '653100', '疏勒县', '新疆维吾尔自治区', '喀什地区', '疏勒县', '新疆维吾尔自治区喀什地区疏勒县', 0);
INSERT INTO `sys_area` VALUES ('653123', '653100', '英吉沙县', '新疆维吾尔自治区', '喀什地区', '英吉沙县', '新疆维吾尔自治区喀什地区英吉沙县', 0);
INSERT INTO `sys_area` VALUES ('653124', '653100', '泽普县', '新疆维吾尔自治区', '喀什地区', '泽普县', '新疆维吾尔自治区喀什地区泽普县', 0);
INSERT INTO `sys_area` VALUES ('653125', '653100', '莎车县', '新疆维吾尔自治区', '喀什地区', '莎车县', '新疆维吾尔自治区喀什地区莎车县', 0);
INSERT INTO `sys_area` VALUES ('653126', '653100', '叶城县', '新疆维吾尔自治区', '喀什地区', '叶城县', '新疆维吾尔自治区喀什地区叶城县', 0);
INSERT INTO `sys_area` VALUES ('653127', '653100', '麦盖提县', '新疆维吾尔自治区', '喀什地区', '麦盖提县', '新疆维吾尔自治区喀什地区麦盖提县', 0);
INSERT INTO `sys_area` VALUES ('653128', '653100', '岳普湖县', '新疆维吾尔自治区', '喀什地区', '岳普湖县', '新疆维吾尔自治区喀什地区岳普湖县', 0);
INSERT INTO `sys_area` VALUES ('653129', '653100', '伽师县', '新疆维吾尔自治区', '喀什地区', '伽师县', '新疆维吾尔自治区喀什地区伽师县', 0);
INSERT INTO `sys_area` VALUES ('653130', '653100', '巴楚县', '新疆维吾尔自治区', '喀什地区', '巴楚县', '新疆维吾尔自治区喀什地区巴楚县', 0);
INSERT INTO `sys_area` VALUES ('653131', '653100', '塔什库尔干塔吉克自治县', '新疆维吾尔自治区', '喀什地区', '塔什库尔干塔吉克自治县', '新疆维吾尔自治区喀什地区塔什库尔干塔吉克自治县', 0);
INSERT INTO `sys_area` VALUES ('653200', '650000', '和田地区', '新疆维吾尔自治区', '和田地区', '', '新疆维吾尔自治区和田地区', 0);
INSERT INTO `sys_area` VALUES ('653201', '653200', '和田市', '新疆维吾尔自治区', '和田地区', '和田市', '新疆维吾尔自治区和田地区和田市', 0);
INSERT INTO `sys_area` VALUES ('653221', '653200', '和田县', '新疆维吾尔自治区', '和田地区', '和田县', '新疆维吾尔自治区和田地区和田县', 0);
INSERT INTO `sys_area` VALUES ('653222', '653200', '墨玉县', '新疆维吾尔自治区', '和田地区', '墨玉县', '新疆维吾尔自治区和田地区墨玉县', 0);
INSERT INTO `sys_area` VALUES ('653223', '653200', '皮山县', '新疆维吾尔自治区', '和田地区', '皮山县', '新疆维吾尔自治区和田地区皮山县', 0);
INSERT INTO `sys_area` VALUES ('653224', '653200', '洛浦县', '新疆维吾尔自治区', '和田地区', '洛浦县', '新疆维吾尔自治区和田地区洛浦县', 0);
INSERT INTO `sys_area` VALUES ('653225', '653200', '策勒县', '新疆维吾尔自治区', '和田地区', '策勒县', '新疆维吾尔自治区和田地区策勒县', 0);
INSERT INTO `sys_area` VALUES ('653226', '653200', '于田县', '新疆维吾尔自治区', '和田地区', '于田县', '新疆维吾尔自治区和田地区于田县', 0);
INSERT INTO `sys_area` VALUES ('653227', '653200', '民丰县', '新疆维吾尔自治区', '和田地区', '民丰县', '新疆维吾尔自治区和田地区民丰县', 0);
INSERT INTO `sys_area` VALUES ('654000', '650000', '伊犁哈萨克自治州', '新疆维吾尔自治区', '伊犁哈萨克自治州', '', '新疆维吾尔自治区伊犁哈萨克自治州', 0);
INSERT INTO `sys_area` VALUES ('654002', '654000', '伊宁市', '新疆维吾尔自治区', '伊犁哈萨克自治州', '伊宁市', '新疆维吾尔自治区伊犁哈萨克自治州伊宁市', 0);
INSERT INTO `sys_area` VALUES ('654003', '654000', '奎屯市', '新疆维吾尔自治区', '伊犁哈萨克自治州', '奎屯市', '新疆维吾尔自治区伊犁哈萨克自治州奎屯市', 0);
INSERT INTO `sys_area` VALUES ('654004', '654000', '霍尔果斯市', '新疆维吾尔自治区', '伊犁哈萨克自治州', '霍尔果斯市', '新疆维吾尔自治区伊犁哈萨克自治州霍尔果斯市', 0);
INSERT INTO `sys_area` VALUES ('654021', '654000', '伊宁县', '新疆维吾尔自治区', '伊犁哈萨克自治州', '伊宁县', '新疆维吾尔自治区伊犁哈萨克自治州伊宁县', 0);
INSERT INTO `sys_area` VALUES ('654022', '654000', '察布查尔锡伯自治县', '新疆维吾尔自治区', '伊犁哈萨克自治州', '察布查尔锡伯自治县', '新疆维吾尔自治区伊犁哈萨克自治州察布查尔锡伯自治县', 0);
INSERT INTO `sys_area` VALUES ('654023', '654000', '霍城县', '新疆维吾尔自治区', '伊犁哈萨克自治州', '霍城县', '新疆维吾尔自治区伊犁哈萨克自治州霍城县', 0);
INSERT INTO `sys_area` VALUES ('654024', '654000', '巩留县', '新疆维吾尔自治区', '伊犁哈萨克自治州', '巩留县', '新疆维吾尔自治区伊犁哈萨克自治州巩留县', 0);
INSERT INTO `sys_area` VALUES ('654025', '654000', '新源县', '新疆维吾尔自治区', '伊犁哈萨克自治州', '新源县', '新疆维吾尔自治区伊犁哈萨克自治州新源县', 0);
INSERT INTO `sys_area` VALUES ('654026', '654000', '昭苏县', '新疆维吾尔自治区', '伊犁哈萨克自治州', '昭苏县', '新疆维吾尔自治区伊犁哈萨克自治州昭苏县', 0);
INSERT INTO `sys_area` VALUES ('654027', '654000', '特克斯县', '新疆维吾尔自治区', '伊犁哈萨克自治州', '特克斯县', '新疆维吾尔自治区伊犁哈萨克自治州特克斯县', 0);
INSERT INTO `sys_area` VALUES ('654028', '654000', '尼勒克县', '新疆维吾尔自治区', '伊犁哈萨克自治州', '尼勒克县', '新疆维吾尔自治区伊犁哈萨克自治州尼勒克县', 0);
INSERT INTO `sys_area` VALUES ('654200', '650000', '塔城地区', '新疆维吾尔自治区', '塔城地区', '', '新疆维吾尔自治区塔城地区', 0);
INSERT INTO `sys_area` VALUES ('654201', '654200', '塔城市', '新疆维吾尔自治区', '塔城地区', '塔城市', '新疆维吾尔自治区塔城地区塔城市', 0);
INSERT INTO `sys_area` VALUES ('654202', '654200', '乌苏市', '新疆维吾尔自治区', '塔城地区', '乌苏市', '新疆维吾尔自治区塔城地区乌苏市', 0);
INSERT INTO `sys_area` VALUES ('654221', '654200', '额敏县', '新疆维吾尔自治区', '塔城地区', '额敏县', '新疆维吾尔自治区塔城地区额敏县', 0);
INSERT INTO `sys_area` VALUES ('654223', '654200', '沙湾县', '新疆维吾尔自治区', '塔城地区', '沙湾县', '新疆维吾尔自治区塔城地区沙湾县', 0);
INSERT INTO `sys_area` VALUES ('654224', '654200', '托里县', '新疆维吾尔自治区', '塔城地区', '托里县', '新疆维吾尔自治区塔城地区托里县', 0);
INSERT INTO `sys_area` VALUES ('654225', '654200', '裕民县', '新疆维吾尔自治区', '塔城地区', '裕民县', '新疆维吾尔自治区塔城地区裕民县', 0);
INSERT INTO `sys_area` VALUES ('654226', '654200', '和布克赛尔蒙古自治县', '新疆维吾尔自治区', '塔城地区', '和布克赛尔蒙古自治县', '新疆维吾尔自治区塔城地区和布克赛尔蒙古自治县', 0);
INSERT INTO `sys_area` VALUES ('654300', '650000', '阿勒泰地区', '新疆维吾尔自治区', '阿勒泰地区', '', '新疆维吾尔自治区阿勒泰地区', 0);
INSERT INTO `sys_area` VALUES ('654301', '654300', '阿勒泰市', '新疆维吾尔自治区', '阿勒泰地区', '阿勒泰市', '新疆维吾尔自治区阿勒泰地区阿勒泰市', 0);
INSERT INTO `sys_area` VALUES ('654321', '654300', '布尔津县', '新疆维吾尔自治区', '阿勒泰地区', '布尔津县', '新疆维吾尔自治区阿勒泰地区布尔津县', 0);
INSERT INTO `sys_area` VALUES ('654322', '654300', '富蕴县', '新疆维吾尔自治区', '阿勒泰地区', '富蕴县', '新疆维吾尔自治区阿勒泰地区富蕴县', 0);
INSERT INTO `sys_area` VALUES ('654323', '654300', '福海县', '新疆维吾尔自治区', '阿勒泰地区', '福海县', '新疆维吾尔自治区阿勒泰地区福海县', 0);
INSERT INTO `sys_area` VALUES ('654324', '654300', '哈巴河县', '新疆维吾尔自治区', '阿勒泰地区', '哈巴河县', '新疆维吾尔自治区阿勒泰地区哈巴河县', 0);
INSERT INTO `sys_area` VALUES ('654325', '654300', '青河县', '新疆维吾尔自治区', '阿勒泰地区', '青河县', '新疆维吾尔自治区阿勒泰地区青河县', 0);
INSERT INTO `sys_area` VALUES ('654326', '654300', '吉木乃县', '新疆维吾尔自治区', '阿勒泰地区', '吉木乃县', '新疆维吾尔自治区阿勒泰地区吉木乃县', 0);
INSERT INTO `sys_area` VALUES ('659000', '650000', '自治区直辖县级行政区划', '新疆维吾尔自治区', '自治区直辖县级行政区划', '', '新疆维吾尔自治区自治区直辖县级行政区划', 0);
INSERT INTO `sys_area` VALUES ('659001', '659000', '石河子市', '新疆维吾尔自治区', '自治区直辖县级行政区划', '石河子市', '新疆维吾尔自治区自治区直辖县级行政区划石河子市', 0);
INSERT INTO `sys_area` VALUES ('659002', '659000', '阿拉尔市', '新疆维吾尔自治区', '自治区直辖县级行政区划', '阿拉尔市', '新疆维吾尔自治区自治区直辖县级行政区划阿拉尔市', 0);
INSERT INTO `sys_area` VALUES ('659003', '659000', '图木舒克市', '新疆维吾尔自治区', '自治区直辖县级行政区划', '图木舒克市', '新疆维吾尔自治区自治区直辖县级行政区划图木舒克市', 0);
INSERT INTO `sys_area` VALUES ('659004', '659000', '五家渠市', '新疆维吾尔自治区', '自治区直辖县级行政区划', '五家渠市', '新疆维吾尔自治区自治区直辖县级行政区划五家渠市', 0);
INSERT INTO `sys_area` VALUES ('659006', '659000', '铁门关市', '新疆维吾尔自治区', '自治区直辖县级行政区划', '铁门关市', '新疆维吾尔自治区自治区直辖县级行政区划铁门关市', 0);

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `sys_log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `terminal_id` bigint(20) DEFAULT NULL,
  `terminal_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `log_content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `record_date` datetime(0) DEFAULT NULL,
  `locate_ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`sys_log_id`) USING BTREE,
  INDEX `FK_Reference_15`(`terminal_id`) USING BTREE,
  CONSTRAINT `FK_Reference_15` FOREIGN KEY (`terminal_id`) REFERENCES `terminal` (`terminal_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (1, 28, '深圳-东门', '日志进程启动', '2019-10-19 14:19:05', '125.216.242.10', 0);
INSERT INTO `sys_log` VALUES (2, 28, '深圳-东门', '播放器进程启动', '2019-10-19 14:19:05', '125.216.242.10', 0);
INSERT INTO `sys_log` VALUES (3, 28, '深圳-东门', '启动播放进程', '2019-10-19 14:19:18', '125.216.242.10', 0);
INSERT INTO `sys_log` VALUES (4, 28, '深圳-东门', '日志进程启动', '2019-10-19 14:23:30', '183.6.159.134', 0);
INSERT INTO `sys_log` VALUES (5, 28, '深圳-东门', '播放器进程启动', '2019-10-19 14:23:30', '183.6.159.134', 0);
INSERT INTO `sys_log` VALUES (6, 28, '深圳-东门', '启动播放进程', '2019-10-19 14:23:43', '183.6.159.134', 0);
INSERT INTO `sys_log` VALUES (7, 28, '深圳-东门', '日志进程启动', '2019-10-19 14:25:59', '183.6.159.134', 0);
INSERT INTO `sys_log` VALUES (8, 28, '深圳-东门', '播放器进程启动', '2019-10-19 14:25:59', '183.6.159.134', 0);
INSERT INTO `sys_log` VALUES (9, 28, '深圳-东门', '启动播放进程', '2019-10-19 14:26:12', '183.6.159.134', 0);
INSERT INTO `sys_log` VALUES (10, 28, '深圳-东门', '日志进程启动', '2019-10-19 14:40:59', '183.6.159.134', 0);
INSERT INTO `sys_log` VALUES (11, 28, '深圳-东门', '播放器进程启动', '2019-10-19 14:40:59', '183.6.159.134', 0);
INSERT INTO `sys_log` VALUES (12, 28, '深圳-东门', '启动播放进程', '2019-10-19 14:41:12', '183.6.159.134', 0);
INSERT INTO `sys_log` VALUES (13, 28, '深圳-东门', '日志进程启动', '2019-11-26 18:59:46', '125.216.242.214', 0);
INSERT INTO `sys_log` VALUES (14, 28, '深圳-东门', '播放器进程启动', '2019-11-26 18:59:47', '125.216.242.214', 0);
INSERT INTO `sys_log` VALUES (15, 28, '深圳-东门', '启动播放进程', '2019-11-26 19:00:01', '125.216.242.214', 0);

-- ----------------------------
-- Table structure for terminal
-- ----------------------------
DROP TABLE IF EXISTS `terminal`;
CREATE TABLE `terminal`  (
  `terminal_id` bigint(50) NOT NULL AUTO_INCREMENT,
  `serial_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `terminal_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `terminal_describe` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mac_addr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `resolution_length` int(11) DEFAULT NULL,
  `resolution_width` int(11) DEFAULT NULL,
  `led_length` int(11) DEFAULT NULL,
  `led_width` int(11) DEFAULT NULL,
  `start_spot_top` int(11) DEFAULT NULL,
  `start_spot_left` int(11) DEFAULT NULL,
  `run_start_time` time(0) DEFAULT NULL,
  `run_end_time` time(0) DEFAULT NULL,
  `area_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `area_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `detail_address` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `state` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `connect_password` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '',
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`terminal_id`) USING BTREE,
  INDEX `FK_Reference_1`(`area_code`) USING BTREE,
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`area_code`) REFERENCES `sys_area` (`code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of terminal
-- ----------------------------
INSERT INTO `terminal` VALUES (9, '001', '南都', '', '202.105.74.192', '1C1B0D11ACFE', 1600, 900, 1350, 840, 0, 0, '07:25:00', '23:35:00', '440100', '广东省广州市', '1', '激活', '123456', 0);
INSERT INTO `terminal` VALUES (28, '003', '深圳-东门', NULL, '121.35.45.146', '00E74C680167', 1024, 768, 960, 530, 0, 0, '09:20:00', '22:00:00', '440300', '广东省深圳市', NULL, '激活', '123456', 0);
INSERT INTO `terminal` VALUES (29, '004', '佛山-ICC', NULL, '116.20.112.103', '00E64C68020A', 1920, 1080, 1920, 576, 0, 0, '06:55:00', '22:05:00', '440600', '广东省佛山市', NULL, '激活', '123456', 0);
INSERT INTO `terminal` VALUES (31, '005', '清远-市政府', NULL, '116.16.55.24', '000B001F8F53', 1024, 768, 960, 528, 0, 0, '07:20:00', '20:10:00', '441800', '广东省清远市', NULL, '激活', '123456', 0);
INSERT INTO `terminal` VALUES (32, '006', '车天车地', NULL, '121.32.127.94', '00E04C6800AF', 1024, 768, 767, 672, 0, 0, '07:25:00', '22:35:00', '440100', '广东省广州市', NULL, '激活', '123456', 0);
INSERT INTO `terminal` VALUES (33, '007', '深圳-新绿岛', '', '183.17.162.77', '7427EAA86111', 900, 1440, 456, 1440, 0, 0, '07:55:00', '22:05:00', '440300', '广东省深圳市', '1', '激活', '123456', 0);
INSERT INTO `terminal` VALUES (34, '008', '深圳-金凯广场', NULL, '119.137.87.192', '00E64C680E6A', 1920, 1080, 1600, 612, 0, 0, '07:25:00', '22:35:00', '440300', '广东省深圳市', NULL, '激活', '123456', 0);
INSERT INTO `terminal` VALUES (35, '009', '江门-住建广场', NULL, '119.133.112.203', '5CAC4CB027E5', 1280, 768, 800, 448, 0, 0, '07:50:00', '22:10:00', '440700', '广东省江门市', NULL, '禁用', '123456', 1);
INSERT INTO `terminal` VALUES (36, '010', '东莞-大朗新世纪广场', '', '183.57.199.217', '70E24C68005C', 1024, 768, 540, 370, 0, 0, '08:25:00', '22:35:00', '441900', '广东省东莞市', 'iiii', '禁用', '123456', 0);
INSERT INTO `terminal` VALUES (37, '011', '惠州-花边岭广场', NULL, '112.97.193.217', '1C1B0D10C56D', 1280, 768, 960, 577, 0, 0, '07:20:00', '22:35:00', '441300', '广东省惠州市', NULL, '激活', '123456', 0);
INSERT INTO `terminal` VALUES (38, '012', '肇庆-星湖广场', NULL, '183.19.168.227', '00E74C68015D', 1280, 1024, 768, 480, 0, 0, '08:50:00', '22:40:00', '441200', '广东省肇庆市', NULL, '激活', '123456', 0);
INSERT INTO `terminal` VALUES (39, '013', '云浮-东街口', NULL, '183.20.15.25', '002540747000', 1280, 768, 384, 240, 0, 0, '07:50:00', '22:10:00', '445300', '广东省云浮市', NULL, '激活', '123456', 0);
INSERT INTO `terminal` VALUES (40, '014', '中山-兴中广场', NULL, '14.21.235.150', '5CAC4CB02B66', 1280, 768, 1220, 480, 0, 0, '07:20:00', '22:30:00', '442000', '广东省中山市', NULL, '激活', '123456', 1);
INSERT INTO `terminal` VALUES (41, '015', '中山-益华广场', NULL, '183.32.169.120', '00E04C68001B', 1024, 768, 848, 640, 0, 0, '08:20:00', '23:40:00', '442000', '广东省中山市', NULL, '激活', '123456', 0);
INSERT INTO `terminal` VALUES (42, '016', '潮州-蓝玥湾酒店', NULL, '112.97.58.3', '00E54C6800DB', 1280, 1024, 1120, 520, 0, 0, '07:00:00', '23:59:59', '445100', '广东省潮州市', NULL, '激活', '123456', 0);
INSERT INTO `terminal` VALUES (43, '019', '江门-中泰来大酒店', NULL, '116.27.103.14', '00E74C680184', 1440, 900, 960, 528, 0, 0, '07:50:00', '22:30:00', '440700', '广东省江门市', NULL, '激活', '123456', 0);
INSERT INTO `terminal` VALUES (44, '111-222-333', '广州测试终端３1', NULL, '192.168.0.238', '000000000000', 1280, 1024, 1024, 768, 0, 0, '09:00:00', '22:00:00', '440100', '广东省广州市', NULL, '禁用', '123456', 1);
INSERT INTO `terminal` VALUES (45, '017', '珠海-钰海国际', NULL, '183.53.191.194', '00E64C6801DC', 1920, 1080, 1720, 696, 0, 83, '07:20:00', '22:40:00', '440400', '广东省珠海市', NULL, '激活', '123456', 0);
INSERT INTO `terminal` VALUES (46, '002', '北京路', NULL, '121.32.5.221', '00E04C68002D', 1280, 1024, 998, 480, 0, 0, '07:30:00', '22:00:52', '440100', '广东省广州市', NULL, '禁用', '123456', 1);
INSERT INTO `terminal` VALUES (47, '020', '深圳-北方大厦', NULL, '112.97.63.154', 'C03FD57793AA', 1280, 2048, 512, 1896, 88, 0, '07:25:00', '22:35:00', '440300', '广东省深圳市', NULL, '激活', '123456', 0);
INSERT INTO `terminal` VALUES (48, '021', '外经贸大厦', NULL, '113.65.13.242', '6C0B846CAC58', 960, 3150, 795, 3015, 1080, 0, '07:55:00', '22:30:00', '440100', '广东省广州市', NULL, '激活', '123456', 0);
INSERT INTO `terminal` VALUES (49, '100', '办公室大屏', '', '', '', 1024, 768, 1024, 768, 0, 0, '08:00:00', '22:00:00', '440100', '广东省广州市', '广州大道中289号', '激活', '123456', 0);

-- ----------------------------
-- Table structure for transfer_log
-- ----------------------------
DROP TABLE IF EXISTS `transfer_log`;
CREATE TABLE `transfer_log`  (
  `transfer_log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `terminal_id` bigint(20) DEFAULT NULL,
  `terminal_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `transfer_start_time` datetime(0) DEFAULT NULL,
  `transfer_end_time` datetime(0) DEFAULT NULL,
  `transfer_file_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `transfer_file_id` bigint(20) DEFAULT NULL,
  `finished` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `pname` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`transfer_log_id`) USING BTREE,
  INDEX `FK_Reference_5`(`terminal_id`) USING BTREE,
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`terminal_id`) REFERENCES `terminal` (`terminal_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL,
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_account` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_password` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `cellphone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `state` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `FK_Reference_8`(`role_id`) USING BTREE,
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 1, 'admin', 'admin', '1', '13807070705', '', '激活', 0);
INSERT INTO `user` VALUES (4, 3, '素材上传人', 'muploader', '1', 'q', '', '激活', 0);
INSERT INTO `user` VALUES (5, 4, '素材审核人', 'mcheck', '1', '11', '', '激活', 0);
INSERT INTO `user` VALUES (9, 6, '播表一级审核人', 'ptable1', '1', '212', '', '激活', 0);
INSERT INTO `user` VALUES (10, 7, '播表二级审核人', 'ptable2', '1', '13', '', '激活', 0);
INSERT INTO `user` VALUES (11, 10, '排播人员', 'broader', '1', '11', '', '激活', 0);
INSERT INTO `user` VALUES (12, 3, '素材上传', 'test1', '123456', '', '', '激活', 0);
INSERT INTO `user` VALUES (13, 4, '素材审核', 'test2', '123456', '', '', '激活', 0);
INSERT INTO `user` VALUES (14, 10, '排播', 'test3', '123456', '', '', '激活', 0);
INSERT INTO `user` VALUES (15, 6, '一级审核', 'test4', '123456', '', '', '激活', 0);
INSERT INTO `user` VALUES (16, 7, '二级审核', 'test5', '123456', '', '', '激活', 0);
INSERT INTO `user` VALUES (17, 3, 'demo1', 'demo1', '1', '', '', '激活', 0);
INSERT INTO `user` VALUES (18, 3, '杨美娟', 'yangmj', '123456', '', '', '激活', 0);
INSERT INTO `user` VALUES (19, 1, '苏胜轩', 'susx', 'ssx888', '', '', '激活', 0);
INSERT INTO `user` VALUES (20, 1, '杨洋', 'yangy', 'yy888', '', '', '激活', 0);
INSERT INTO `user` VALUES (21, 1, '潘富鸾', 'panfl', '123456', '', '', '激活', 0);
INSERT INTO `user` VALUES (22, 1, '吴凡超', 'wufc', '123456', '', '', '激活', 0);
INSERT INTO `user` VALUES (23, 1, '李胜', 'lis', 'ls888', '', '', '激活', 0);

SET FOREIGN_KEY_CHECKS = 1;
