/*
 Navicat Premium Data Transfer

 Source Server         : coderZ
 Source Server Type    : MySQL
 Source Server Version : 80012 (8.0.12)
 Source Host           : localhost:3306
 Source Schema         : coderhub

 Target Server Type    : MySQL
 Target Server Version : 80012 (8.0.12)
 File Encoding         : 65001

 Date: 27/04/2025 11:38:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for avatar
-- ----------------------------
DROP TABLE IF EXISTS `avatar`;
CREATE TABLE `avatar`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `mimetype` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `size` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `createAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `filename`(`filename` ASC) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `avatar_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of avatar
-- ----------------------------
INSERT INTO `avatar` VALUES (1, 'd797b58cf70004b449a08f7f8c81ed9d', 'image/png', 128989, 10, '2025-04-22 21:55:35', '2025-04-22 21:55:35');
INSERT INTO `avatar` VALUES (2, '6de05d8e0de4e67b774b055b157a4058', 'image/png', 271836, 10, '2025-04-22 23:08:34', '2025-04-22 23:08:34');
INSERT INTO `avatar` VALUES (3, '18d6de20b8f240f19c0ee5e47d129593', 'image/png', 405665, 10, '2025-04-22 23:36:09', '2025-04-22 23:36:09');
INSERT INTO `avatar` VALUES (4, '3688ddf39f12feb3d3c295e850b5024e', 'image/png', 405665, 10, '2025-04-22 23:37:41', '2025-04-22 23:37:41');
INSERT INTO `avatar` VALUES (5, '4b1058e118ed24692ed04e0092142c62', 'image/png', 405665, 10, '2025-04-22 23:44:21', '2025-04-22 23:44:21');
INSERT INTO `avatar` VALUES (6, 'cc516438cc3ecd4a595240592c8aade9', 'image/png', 405665, 10, '2025-04-23 09:16:01', '2025-04-23 09:16:01');
INSERT INTO `avatar` VALUES (7, '8912073f81fe7e8e2b29cdab415996e2', 'image/png', 405665, 10, '2025-04-23 09:18:20', '2025-04-23 09:18:20');
INSERT INTO `avatar` VALUES (8, '6d4376dc49c09457023b43e28a48b41c', 'image/png', 405665, 10, '2025-04-23 09:19:44', '2025-04-23 09:19:44');
INSERT INTO `avatar` VALUES (9, '1ca6ef923caebb9841076e0184076c33', 'image/png', 405665, 10, '2025-04-23 09:19:59', '2025-04-23 09:19:59');
INSERT INTO `avatar` VALUES (10, '66c41daa6072f8b879e188eebf07bd3a', 'image/png', 405665, 10, '2025-04-23 09:23:59', '2025-04-23 09:23:59');
INSERT INTO `avatar` VALUES (11, '01cfaf63f8ec68e9135e7417a8eb737e', 'image/png', 405665, 10, '2025-04-23 09:24:40', '2025-04-23 09:24:40');
INSERT INTO `avatar` VALUES (12, '5addec99697bde4f3ab894d8ac329eb8', 'image/png', 405665, 10, '2025-04-23 09:26:14', '2025-04-23 09:26:14');
INSERT INTO `avatar` VALUES (13, 'ce1a7481a422ca9c69e0be937fb896ae', 'image/png', 405665, 10, '2025-04-23 09:29:56', '2025-04-23 09:29:56');
INSERT INTO `avatar` VALUES (14, '1175026a2cd8ffa95cd2edca363a39e3', 'image/png', 405665, 10, '2025-04-23 09:39:07', '2025-04-23 09:39:07');
INSERT INTO `avatar` VALUES (15, 'c4de59d1f1753ae23f60da9628b3932b', 'image/png', 405665, 10, '2025-04-23 17:23:32', '2025-04-23 17:23:32');
INSERT INTO `avatar` VALUES (16, '196343f514bb238eabfa0d9d6976ff7e', 'image/png', 405665, 10, '2025-04-23 17:26:02', '2025-04-23 17:26:02');
INSERT INTO `avatar` VALUES (17, '7b99542dd5d8aa8358dc1d9c32203d0c', 'image/png', 366792, 10, '2025-04-23 17:38:53', '2025-04-23 17:38:53');
INSERT INTO `avatar` VALUES (18, 'df724228b18b1457897626d006330ff0', 'image/png', 366792, 10, '2025-04-23 17:40:58', '2025-04-23 17:40:58');
INSERT INTO `avatar` VALUES (19, 'dfe86647d68825edc804c909cfd1c6d7', 'image/png', 366792, 10, '2025-04-23 17:45:09', '2025-04-23 17:45:09');
INSERT INTO `avatar` VALUES (20, '07c8dacc821bfc0dab1ffbf3d2f96752', 'image/png', 366792, 10, '2025-04-23 17:47:35', '2025-04-23 17:47:35');
INSERT INTO `avatar` VALUES (21, '36c95ac8cfdc0add6cc1a99491d807b6', 'image/png', 366792, 10, '2025-04-23 17:52:25', '2025-04-23 17:52:25');
INSERT INTO `avatar` VALUES (22, '1251b52b4a50c5ab95980da73881194a', 'image/png', 366792, 10, '2025-04-23 17:56:23', '2025-04-23 17:56:23');
INSERT INTO `avatar` VALUES (23, '3aaa94efbea823756d7c258da806a7e7', 'image/png', 366792, 10, '2025-04-23 17:58:19', '2025-04-23 17:58:19');
INSERT INTO `avatar` VALUES (24, '403b869cdc38f5a5a276068b11aab777', 'image/png', 366792, 10, '2025-04-23 18:00:35', '2025-04-23 18:00:35');
INSERT INTO `avatar` VALUES (25, 'e7b5887357f84caa250da8707919e31f', 'image/png', 366792, 10, '2025-04-23 18:01:19', '2025-04-23 18:01:19');
INSERT INTO `avatar` VALUES (26, 'a34fde4ef971758e281c14a39bac72b5', 'image/png', 366792, 10, '2025-04-23 18:11:33', '2025-04-23 18:11:33');
INSERT INTO `avatar` VALUES (27, 'dbb9115da5b86fec8c597dda37106ef5', 'image/png', 366792, 10, '2025-04-23 18:12:34', '2025-04-23 18:12:34');
INSERT INTO `avatar` VALUES (28, '7efaaea3d1586ea02e137d42b63cb202', 'image/png', 405665, 10, '2025-04-24 21:30:45', '2025-04-24 21:30:45');
INSERT INTO `avatar` VALUES (29, '97b08c617d1ba3395adc41054b272703', 'image/png', 405665, 10, '2025-04-24 21:32:20', '2025-04-24 21:32:20');
INSERT INTO `avatar` VALUES (30, '4f970a990b46b1215dc575bae78ba3fa', 'image/png', 405665, 10, '2025-04-24 21:32:30', '2025-04-24 21:32:30');
INSERT INTO `avatar` VALUES (31, '0b7a6dddc40e07910be28c8a81131b8e', 'image/png', 405665, 10, '2025-04-24 21:32:55', '2025-04-24 21:32:55');
INSERT INTO `avatar` VALUES (32, 'e2192e4eec466959a7f5f76d94d7ba32', 'image/png', 405665, 10, '2025-04-24 21:40:48', '2025-04-24 21:40:48');
INSERT INTO `avatar` VALUES (33, '7727d419d1766d9b897718bab94422de', 'image/png', 405665, 10, '2025-04-24 21:41:46', '2025-04-24 21:41:46');
INSERT INTO `avatar` VALUES (34, '9c0fc0c44cb9b3f61468cd5f880f5d71', 'image/png', 405665, 10, '2025-04-24 22:22:05', '2025-04-24 22:22:05');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `moment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment_id` int(11) NULL DEFAULT NULL,
  `createAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `moment_id`(`moment_id` ASC) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  INDEX `comment_id`(`comment_id` ASC) USING BTREE,
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`moment_id`) REFERENCES `moment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_3` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, '坤坤打球太帅了~', 2, 10, NULL, '2025-04-19 19:24:26', '2025-04-19 19:24:26');
INSERT INTO `comment` VALUES (2, '坤坤打球太帅了~', 2, 10, 1, '2025-04-19 20:01:49', '2025-04-19 20:01:49');
INSERT INTO `comment` VALUES (3, '坤坤打球太帅了~', 6, 10, 1, '2025-04-20 15:32:13', '2025-04-20 15:32:13');

-- ----------------------------
-- Table structure for label
-- ----------------------------
DROP TABLE IF EXISTS `label`;
CREATE TABLE `label`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `createAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of label
-- ----------------------------
INSERT INTO `label` VALUES (1, '66666', '2025-04-20 18:13:43', '2025-04-20 18:13:43');
INSERT INTO `label` VALUES (2, '篮球', '2025-04-21 22:32:19', '2025-04-21 22:32:19');
INSERT INTO `label` VALUES (3, 'rap', '2025-04-21 22:32:19', '2025-04-21 22:32:19');
INSERT INTO `label` VALUES (4, '哲学', '2025-04-21 22:32:19', '2025-04-21 22:32:19');
INSERT INTO `label` VALUES (5, 'AAA', '2025-04-21 22:40:59', '2025-04-21 22:40:59');
INSERT INTO `label` VALUES (6, 'BBB', '2025-04-21 22:40:59', '2025-04-21 22:40:59');
INSERT INTO `label` VALUES (7, 'CCC', '2025-04-21 22:40:59', '2025-04-21 22:40:59');
INSERT INTO `label` VALUES (8, 'zzz', '2025-04-21 22:52:44', '2025-04-21 22:52:44');
INSERT INTO `label` VALUES (9, '666', '2025-04-21 22:52:44', '2025-04-21 22:52:44');
INSERT INTO `label` VALUES (10, '888', '2025-04-21 22:52:44', '2025-04-21 22:52:44');
INSERT INTO `label` VALUES (11, '7778888', '2025-04-21 22:56:24', '2025-04-21 22:56:24');
INSERT INTO `label` VALUES (12, '77888', '2025-04-21 22:57:19', '2025-04-21 22:57:19');
INSERT INTO `label` VALUES (13, '56ui', '2025-04-21 22:58:37', '2025-04-21 22:58:37');
INSERT INTO `label` VALUES (14, '56i', '2025-04-21 22:59:50', '2025-04-21 22:59:50');
INSERT INTO `label` VALUES (15, 'rtyu', '2025-04-21 23:00:13', '2025-04-21 23:00:13');
INSERT INTO `label` VALUES (16, '777op', '2025-04-21 23:00:50', '2025-04-21 23:00:50');
INSERT INTO `label` VALUES (17, '88op', '2025-04-21 23:00:50', '2025-04-21 23:00:50');
INSERT INTO `label` VALUES (18, 'rtyuwww', '2025-04-21 23:02:55', '2025-04-21 23:02:55');
INSERT INTO `label` VALUES (19, '777opwww', '2025-04-21 23:02:55', '2025-04-21 23:02:55');
INSERT INTO `label` VALUES (20, '88opwww', '2025-04-21 23:02:55', '2025-04-21 23:02:55');
INSERT INTO `label` VALUES (21, 'rrr555', '2025-04-22 11:45:24', '2025-04-22 11:45:24');
INSERT INTO `label` VALUES (22, 'rrr666', '2025-04-22 11:45:24', '2025-04-22 11:45:24');
INSERT INTO `label` VALUES (23, 'rrr888', '2025-04-22 11:51:09', '2025-04-22 11:51:09');
INSERT INTO `label` VALUES (24, 'rrr999', '2025-04-22 11:51:09', '2025-04-22 11:51:09');
INSERT INTO `label` VALUES (25, 'rrr101010', '2025-04-22 11:51:09', '2025-04-22 11:51:09');
INSERT INTO `label` VALUES (26, '44www', '2025-04-22 18:04:59', '2025-04-22 18:04:59');
INSERT INTO `label` VALUES (27, '55rrr', '2025-04-22 18:04:59', '2025-04-22 18:04:59');
INSERT INTO `label` VALUES (28, 'nihao', '2025-04-22 20:12:26', '2025-04-22 20:12:26');
INSERT INTO `label` VALUES (29, 'parrot', '2025-04-22 20:12:26', '2025-04-22 20:12:26');

-- ----------------------------
-- Table structure for moment
-- ----------------------------
DROP TABLE IF EXISTS `moment`;
CREATE TABLE `moment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `createAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `moment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of moment
-- ----------------------------
INSERT INTO `moment` VALUES (2, '坤坤勇敢飞，爱坤永相随~', 1, '2025-04-19 12:28:33', '2025-04-19 16:35:13');
INSERT INTO `moment` VALUES (3, '坤坤勇敢飞，爱坤永相随~', 1, '2025-04-19 12:28:33', '2025-04-19 16:57:16');
INSERT INTO `moment` VALUES (4, '坤坤勇敢飞，爱坤永相随~', 3, '2025-04-19 12:28:33', '2025-04-19 16:58:58');
INSERT INTO `moment` VALUES (5, 'If you shed tears when you miss the sun, you also miss the stars.如果你因失去了太阳而流泪，那么你也将失去群星了。', 1, '2025-04-19 12:28:33', '2025-04-19 12:28:33');
INSERT INTO `moment` VALUES (6, '在世间万物中我都发现了你，渺小时，你是阳光下一粒种子，伟大时，你隐身在高山海洋里。', 2, '2025-04-19 12:28:33', '2025-04-19 12:28:33');
INSERT INTO `moment` VALUES (7, '某一天，突然发现，许多结果都与路径无关。', 4, '2025-04-19 12:28:33', '2025-04-19 12:28:33');
INSERT INTO `moment` VALUES (8, '限定目的，能使人生变得简洁。', 2, '2025-04-19 12:28:33', '2025-04-19 12:28:33');
INSERT INTO `moment` VALUES (9, '翅膀长在你的肩上，太在乎别人对于飞行姿势的批评，所以你飞不起来', 4, '2025-04-19 12:28:33', '2025-04-19 12:28:33');
INSERT INTO `moment` VALUES (10, '一个人至少拥有一个梦想，有一个理由去坚强。心若没有栖息的地方，到哪里都是在流浪。', 2, '2025-04-19 12:28:33', '2025-04-19 12:28:33');
INSERT INTO `moment` VALUES (11, '不乱于心，不困于情。不畏将来，不念过往。如此，安好。', 3, '2025-04-19 12:28:33', '2025-04-19 12:28:33');
INSERT INTO `moment` VALUES (12, '如果你给我的，和你给别人的是一样的，那我就不要了。', 3, '2025-04-19 12:28:33', '2025-04-19 12:28:33');
INSERT INTO `moment` VALUES (13, '故事的开头总是这样，适逢其会，猝不及防。故事的结局总是这样，花开两朵，天各一方。', 2, '2025-04-19 12:28:33', '2025-04-19 12:28:33');
INSERT INTO `moment` VALUES (14, '你不愿意种花，你说，我不愿看见它一点点凋落。是的，为了避免结束，你避免了一切开始。', 2, '2025-04-19 12:28:33', '2025-04-19 12:28:33');
INSERT INTO `moment` VALUES (15, '你如果认识从前的我，也许你会原谅现在的我。', 4, '2025-04-19 12:28:33', '2025-04-19 12:28:33');
INSERT INTO `moment` VALUES (16, '每一个不曾起舞的日子，都是对生命的辜负。', 2, '2025-04-19 12:28:33', '2025-04-19 12:28:33');
INSERT INTO `moment` VALUES (17, '向来缘浅，奈何情深。', 2, '2025-04-19 12:28:33', '2025-04-19 12:28:33');
INSERT INTO `moment` VALUES (18, '心之所向 素履以往 生如逆旅 一苇以航', 3, '2025-04-19 12:28:33', '2025-04-19 12:28:33');
INSERT INTO `moment` VALUES (19, '生如夏花之绚烂，死如秋叶之静美。', 3, '2025-04-19 12:28:33', '2025-04-19 12:28:33');
INSERT INTO `moment` VALUES (20, '答案很长，我准备用一生的时间来回答，你准备要听了吗？', 4, '2025-04-19 12:28:33', '2025-04-19 12:28:33');
INSERT INTO `moment` VALUES (21, '因为爱过，所以慈悲；因为懂得，所以宽容。', 4, '2025-04-19 12:28:33', '2025-04-19 12:28:33');
INSERT INTO `moment` VALUES (22, '我们听过无数的道理，却仍旧过不好这一生。', 1, '2025-04-19 12:28:33', '2025-04-19 12:28:33');
INSERT INTO `moment` VALUES (23, '我来不及认真地年轻，待明白过来时，只能选择认真地老去。', 2, '2025-04-19 12:28:33', '2025-04-19 12:28:33');
INSERT INTO `moment` VALUES (28, '芒果芒果芒果77778888777~', 10, '2025-04-19 17:30:23', '2025-04-19 17:30:23');
INSERT INTO `moment` VALUES (29, '芒果芒果芒果77778888777~', 10, '2025-04-19 18:39:33', '2025-04-19 18:39:33');

-- ----------------------------
-- Table structure for moment_label
-- ----------------------------
DROP TABLE IF EXISTS `moment_label`;
CREATE TABLE `moment_label`  (
  `moment_id` int(11) NOT NULL,
  `label_id` int(11) NOT NULL,
  `createAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`moment_id`, `label_id`) USING BTREE,
  INDEX `label_id`(`label_id` ASC) USING BTREE,
  CONSTRAINT `moment_label_ibfk_1` FOREIGN KEY (`moment_id`) REFERENCES `moment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `moment_label_ibfk_2` FOREIGN KEY (`label_id`) REFERENCES `label` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of moment_label
-- ----------------------------
INSERT INTO `moment_label` VALUES (28, 2, '2025-04-21 22:40:36', '2025-04-21 22:40:36');
INSERT INTO `moment_label` VALUES (28, 4, '2025-04-21 22:51:54', '2025-04-21 22:51:54');
INSERT INTO `moment_label` VALUES (28, 5, '2025-04-21 22:40:59', '2025-04-21 22:40:59');
INSERT INTO `moment_label` VALUES (28, 6, '2025-04-21 22:47:48', '2025-04-21 22:47:48');
INSERT INTO `moment_label` VALUES (28, 7, '2025-04-21 22:48:41', '2025-04-21 22:48:41');
INSERT INTO `moment_label` VALUES (28, 8, '2025-04-21 22:52:44', '2025-04-21 22:52:44');
INSERT INTO `moment_label` VALUES (28, 11, '2025-04-21 22:56:24', '2025-04-21 22:56:24');
INSERT INTO `moment_label` VALUES (28, 12, '2025-04-21 22:57:19', '2025-04-21 22:57:19');
INSERT INTO `moment_label` VALUES (28, 13, '2025-04-21 22:58:44', '2025-04-21 22:58:44');
INSERT INTO `moment_label` VALUES (28, 14, '2025-04-21 22:59:50', '2025-04-21 22:59:50');
INSERT INTO `moment_label` VALUES (28, 15, '2025-04-21 23:00:13', '2025-04-21 23:00:13');
INSERT INTO `moment_label` VALUES (28, 16, '2025-04-21 23:00:50', '2025-04-21 23:00:50');
INSERT INTO `moment_label` VALUES (28, 18, '2025-04-21 23:02:55', '2025-04-21 23:02:55');
INSERT INTO `moment_label` VALUES (28, 21, '2025-04-22 11:47:54', '2025-04-22 11:47:54');
INSERT INTO `moment_label` VALUES (28, 23, '2025-04-22 11:51:13', '2025-04-22 11:51:13');
INSERT INTO `moment_label` VALUES (28, 26, '2025-04-22 18:07:44', '2025-04-22 18:07:44');
INSERT INTO `moment_label` VALUES (28, 27, '2025-04-22 18:16:07', '2025-04-22 18:16:07');
INSERT INTO `moment_label` VALUES (28, 28, '2025-04-22 20:12:26', '2025-04-22 20:12:26');
INSERT INTO `moment_label` VALUES (28, 29, '2025-04-22 20:12:26', '2025-04-22 20:12:26');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `createAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `avatar_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'hmr001', 'e10adc3949ba59abbe56e057f20f883e', '2025-04-19 12:27:08', '2025-04-19 12:27:51', NULL);
INSERT INTO `user` VALUES (2, 'hmr002', 'e10adc3949ba59abbe56e057f20f883e', '2025-04-19 12:27:14', '2025-04-19 12:27:53', NULL);
INSERT INTO `user` VALUES (3, 'hmr003', 'e10adc3949ba59abbe56e057f20f883e', '2025-04-19 12:27:19', '2025-04-19 12:27:55', NULL);
INSERT INTO `user` VALUES (4, 'hmr004', 'e10adc3949ba59abbe56e057f20f883e', '2025-04-19 12:27:23', '2025-04-19 12:27:57', NULL);
INSERT INTO `user` VALUES (10, 'hmr005', 'e10adc3949ba59abbe56e057f20f883e', '2025-04-19 17:26:19', '2025-04-23 18:00:45', 'http://localhost:8000/users/avatar/10');

-- ----------------------------
-- View structure for male_student_view
-- ----------------------------
DROP VIEW IF EXISTS `male_student_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `male_student_view` AS select `s1`.`number` AS `number`,`s1`.`name` AS `name`,`s1`.`major` AS `major`,`s2`.`subject` AS `subject`,`s2`.`score` AS `score` from (`student_info` `s1` join `student_score` `s2`) where ((`s1`.`number` = `s2`.`number`) and (`s1`.`sex` = '男'));

-- ----------------------------
-- View structure for new_male_student_view
-- ----------------------------
DROP VIEW IF EXISTS `new_male_student_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `new_male_student_view` AS select `male_student_view`.`number` AS `number`,`male_student_view`.`name` AS `name`,`male_student_view`.`major` AS `major`,`male_student_view`.`subject` AS `subject` from `male_student_view`;

SET FOREIGN_KEY_CHECKS = 1;
