/*
 Navicat Premium Data Transfer

 Source Server         : 本地服务器
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : localhost:3306
 Source Schema         : yadmin

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 19/12/2020 21:20:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add permission', 1, 'add_permission');
INSERT INTO `auth_permission` VALUES (2, 'Can change permission', 1, 'change_permission');
INSERT INTO `auth_permission` VALUES (3, 'Can delete permission', 1, 'delete_permission');
INSERT INTO `auth_permission` VALUES (4, 'Can view permission', 1, 'view_permission');
INSERT INTO `auth_permission` VALUES (5, 'Can add group', 2, 'add_group');
INSERT INTO `auth_permission` VALUES (6, 'Can change group', 2, 'change_group');
INSERT INTO `auth_permission` VALUES (7, 'Can delete group', 2, 'delete_group');
INSERT INTO `auth_permission` VALUES (8, 'Can view group', 2, 'view_group');
INSERT INTO `auth_permission` VALUES (9, 'Can add content type', 3, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (10, 'Can change content type', 3, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (11, 'Can delete content type', 3, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (12, 'Can view content type', 3, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (13, 'Can add sys city', 4, 'add_syscity');
INSERT INTO `auth_permission` VALUES (14, 'Can change sys city', 4, 'change_syscity');
INSERT INTO `auth_permission` VALUES (15, 'Can delete sys city', 4, 'delete_syscity');
INSERT INTO `auth_permission` VALUES (16, 'Can view sys city', 4, 'view_syscity');
INSERT INTO `auth_permission` VALUES (17, 'Can add sys dictionary', 5, 'add_sysdictionary');
INSERT INTO `auth_permission` VALUES (18, 'Can change sys dictionary', 5, 'change_sysdictionary');
INSERT INTO `auth_permission` VALUES (19, 'Can delete sys dictionary', 5, 'delete_sysdictionary');
INSERT INTO `auth_permission` VALUES (20, 'Can view sys dictionary', 5, 'view_sysdictionary');
INSERT INTO `auth_permission` VALUES (21, 'Can add sys dictionarylist', 6, 'add_sysdictionarylist');
INSERT INTO `auth_permission` VALUES (22, 'Can change sys dictionarylist', 6, 'change_sysdictionarylist');
INSERT INTO `auth_permission` VALUES (23, 'Can delete sys dictionarylist', 6, 'delete_sysdictionarylist');
INSERT INTO `auth_permission` VALUES (24, 'Can view sys dictionarylist', 6, 'view_sysdictionarylist');
INSERT INTO `auth_permission` VALUES (25, 'Can add sys log', 7, 'add_syslog');
INSERT INTO `auth_permission` VALUES (26, 'Can change sys log', 7, 'change_syslog');
INSERT INTO `auth_permission` VALUES (27, 'Can delete sys log', 7, 'delete_syslog');
INSERT INTO `auth_permission` VALUES (28, 'Can view sys log', 7, 'view_syslog');
INSERT INTO `auth_permission` VALUES (29, 'Can add sys menu', 8, 'add_sysmenu');
INSERT INTO `auth_permission` VALUES (30, 'Can change sys menu', 8, 'change_sysmenu');
INSERT INTO `auth_permission` VALUES (31, 'Can delete sys menu', 8, 'delete_sysmenu');
INSERT INTO `auth_permission` VALUES (32, 'Can view sys menu', 8, 'view_sysmenu');
INSERT INTO `auth_permission` VALUES (33, 'Can add sys province', 9, 'add_sysprovince');
INSERT INTO `auth_permission` VALUES (34, 'Can change sys province', 9, 'change_sysprovince');
INSERT INTO `auth_permission` VALUES (35, 'Can delete sys province', 9, 'delete_sysprovince');
INSERT INTO `auth_permission` VALUES (36, 'Can view sys province', 9, 'view_sysprovince');
INSERT INTO `auth_permission` VALUES (37, 'Can add sys role', 10, 'add_sysrole');
INSERT INTO `auth_permission` VALUES (38, 'Can change sys role', 10, 'change_sysrole');
INSERT INTO `auth_permission` VALUES (39, 'Can delete sys role', 10, 'delete_sysrole');
INSERT INTO `auth_permission` VALUES (40, 'Can view sys role', 10, 'view_sysrole');
INSERT INTO `auth_permission` VALUES (41, 'Can add sys roleauth', 11, 'add_sysroleauth');
INSERT INTO `auth_permission` VALUES (42, 'Can change sys roleauth', 11, 'change_sysroleauth');
INSERT INTO `auth_permission` VALUES (43, 'Can delete sys roleauth', 11, 'delete_sysroleauth');
INSERT INTO `auth_permission` VALUES (44, 'Can view sys roleauth', 11, 'view_sysroleauth');
INSERT INTO `auth_permission` VALUES (45, 'Can add sys roleauthdata', 12, 'add_sysroleauthdata');
INSERT INTO `auth_permission` VALUES (46, 'Can change sys roleauthdata', 12, 'change_sysroleauthdata');
INSERT INTO `auth_permission` VALUES (47, 'Can delete sys roleauthdata', 12, 'delete_sysroleauthdata');
INSERT INTO `auth_permission` VALUES (48, 'Can view sys roleauthdata', 12, 'view_sysroleauthdata');
INSERT INTO `auth_permission` VALUES (49, 'Can add sys user', 13, 'add_sysuser');
INSERT INTO `auth_permission` VALUES (50, 'Can change sys user', 13, 'change_sysuser');
INSERT INTO `auth_permission` VALUES (51, 'Can delete sys user', 13, 'delete_sysuser');
INSERT INTO `auth_permission` VALUES (52, 'Can view sys user', 13, 'view_sysuser');

-- ----------------------------
-- Table structure for captcha_captchastore
-- ----------------------------
DROP TABLE IF EXISTS `captcha_captchastore`;
CREATE TABLE `captcha_captchastore`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `response` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `hashkey` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `hashkey`(`hashkey`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 87 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of captcha_captchastore
-- ----------------------------
INSERT INTO `captcha_captchastore` VALUES (1, '4+9=', '13', '18de943ef94394f4638495bcc7327e8f8ad11059', '2020-10-19 16:15:43.798368');
INSERT INTO `captcha_captchastore` VALUES (2, '9+4=', '13', 'efec4ae61fe3c7f6d395d8df805a2caf2a96111e', '2020-10-19 16:15:56.303863');
INSERT INTO `captcha_captchastore` VALUES (3, '4+1=', '5', '33e4992c0aac611f2c054619be1020d98e287fe2', '2020-10-19 16:18:47.610424');
INSERT INTO `captcha_captchastore` VALUES (4, '9+3=', '12', '5d79acdbf3beb0c7b3debfd15eabd6e777c13615', '2020-10-19 16:20:01.287709');
INSERT INTO `captcha_captchastore` VALUES (5, '6-5=', '1', '7ff2645ca278c7ff654be6d561e3202384d3de6a', '2020-10-19 16:23:42.541956');
INSERT INTO `captcha_captchastore` VALUES (6, '5*2=', '10', 'b2be0e470c83bd69b853a68746753b2995aec412', '2020-10-19 16:25:32.215186');
INSERT INTO `captcha_captchastore` VALUES (7, '8-7=', '1', '95a39d9b1bc666f7706a155985985293cf465164', '2020-10-19 16:26:28.343298');
INSERT INTO `captcha_captchastore` VALUES (8, '4*3=', '12', '8af18489e375be47db5fe0e26acfc7114672fb08', '2020-10-19 16:30:22.278457');
INSERT INTO `captcha_captchastore` VALUES (9, '6-2=', '4', '588c73d9126def36231461a1bca4ae838b508f88', '2020-10-19 16:34:33.177964');
INSERT INTO `captcha_captchastore` VALUES (10, '4*9=', '36', '77d1255d56c782293859bb119488b49f8b3a5eb0', '2020-10-19 16:34:47.688327');
INSERT INTO `captcha_captchastore` VALUES (11, '6-2=', '4', '3751b7d04229cdd994096e86b7a3759c048738dd', '2020-10-19 16:36:38.786976');
INSERT INTO `captcha_captchastore` VALUES (12, '10*10=', '100', 'fd2d21b59d48a1d706b15f128254f65ba72a7602', '2020-10-19 16:36:42.156086');
INSERT INTO `captcha_captchastore` VALUES (13, '1+7=', '8', '8186fb109c2d3eba49ec067b2b17da18e32856e2', '2020-10-19 16:37:50.078385');
INSERT INTO `captcha_captchastore` VALUES (14, '4*10=', '40', '44b67b3b160623489daa0014c6438718b6c54c79', '2020-10-19 16:37:51.347183');
INSERT INTO `captcha_captchastore` VALUES (15, '8+5=', '13', 'd2be14942d64077b743e52d40723a0de8b89a750', '2020-10-19 16:37:52.043069');
INSERT INTO `captcha_captchastore` VALUES (16, '1+1=', '2', 'f641c8529c151d3b2a99a3441ede0a8c0d2f3080', '2020-10-19 16:37:52.252908');
INSERT INTO `captcha_captchastore` VALUES (17, '9+3=', '12', 'c67a5e5c66adee893437e4bae75360cf5322db59', '2020-10-19 16:37:52.434445');
INSERT INTO `captcha_captchastore` VALUES (18, '5-3=', '2', '41484e89b38e0745eadfc515f1506833e69cfd34', '2020-10-19 16:37:53.081531');
INSERT INTO `captcha_captchastore` VALUES (19, '8-8=', '0', 'c0c99122aa40bf4f5fb10773f17151308676db47', '2020-10-19 16:38:26.798184');
INSERT INTO `captcha_captchastore` VALUES (20, '7+10=', '17', '2439ec5cc18d1e7d7fac35afbbb6ba2756bf358a', '2020-10-19 16:38:29.501939');
INSERT INTO `captcha_captchastore` VALUES (21, '10+2=', '12', 'a4862f8f35ab116911ab74a9d66a7f21e611549a', '2020-10-19 16:39:00.944783');
INSERT INTO `captcha_captchastore` VALUES (22, '10-7=', '3', 'b62f79d8a45cd319e598f808b78cd056a28d5024', '2020-10-19 16:39:02.125742');
INSERT INTO `captcha_captchastore` VALUES (23, '2*9=', '18', '4126f992becbe51213638410770252d39e43709f', '2020-10-19 16:39:34.594609');
INSERT INTO `captcha_captchastore` VALUES (24, '1+9=', '10', '72c4c4dacdc069a1368e871c0bd41b4e191d4e70', '2020-10-19 16:39:35.403745');
INSERT INTO `captcha_captchastore` VALUES (25, '7+10=', '17', '34f5429461ae1725e470315a67c883fdd730506e', '2020-10-19 16:39:36.285070');
INSERT INTO `captcha_captchastore` VALUES (26, '9-2=', '7', '23846ce1f0e492da2e114662ca865f97142473ed', '2020-10-19 16:39:36.492957');
INSERT INTO `captcha_captchastore` VALUES (27, '1+6=', '7', 'ffdd4607a0a4c3baeb0f28d07b9808d5212a86ca', '2020-10-19 16:39:36.650093');
INSERT INTO `captcha_captchastore` VALUES (28, '8+6=', '14', 'dc9f2b7e915f74c5f41e6adf1b4e643fb895c92e', '2020-10-19 16:39:36.818983');
INSERT INTO `captcha_captchastore` VALUES (29, '10+4=', '14', '7e571f52eeb22448b7a752c956ea3dbaf1a230ee', '2020-10-19 16:39:37.571435');
INSERT INTO `captcha_captchastore` VALUES (30, '4+6=', '10', '4b1ab111149f7fb9ac4b4135241635dea5cb248c', '2020-10-19 16:39:37.778347');
INSERT INTO `captcha_captchastore` VALUES (31, '4*6=', '24', '66b4300ac25af47c2597da872d6ecfe926acdb07', '2020-10-19 16:39:38.114090');
INSERT INTO `captcha_captchastore` VALUES (32, '8*3=', '24', 'e07c6b1ba20246baf4f2065b0be4a9a0ea446897', '2020-10-19 16:39:38.412746');
INSERT INTO `captcha_captchastore` VALUES (33, '8-2=', '6', '0fc4409153a390c4001d3329b6f55ffbf0dc23a9', '2020-10-19 16:39:38.858830');
INSERT INTO `captcha_captchastore` VALUES (34, '1*1=', '1', '8e08e475dbe1526ae3524c54de865c88a70748c0', '2020-10-19 16:39:39.042302');
INSERT INTO `captcha_captchastore` VALUES (35, '5+5=', '10', '1b3b5a7f6e10c4c251b64ac8fb9a688b769ca22a', '2020-10-19 16:39:39.226766');
INSERT INTO `captcha_captchastore` VALUES (36, '9+4=', '13', '021124e352a246e17f6623b2e4b0a9505cb1b9ab', '2020-10-19 16:43:41.201847');
INSERT INTO `captcha_captchastore` VALUES (37, '4*4=', '16', '17fecb1f28932a03db83670f1ac23c59d35c3530', '2020-10-19 16:43:42.470645');
INSERT INTO `captcha_captchastore` VALUES (38, '2*7=', '14', '0ecb7cc24d9b70a86e916410cdbaaf7d89f865c1', '2020-10-19 16:43:50.865228');
INSERT INTO `captcha_captchastore` VALUES (39, '10-5=', '5', 'd64f398760b806e6761179910c9adb447f7fb327', '2020-10-19 16:43:51.945658');
INSERT INTO `captcha_captchastore` VALUES (40, '5*2=', '10', '3f2126358c21569ebe6ed8ac50d611303a73b1f5', '2020-10-19 17:29:10.657885');
INSERT INTO `captcha_captchastore` VALUES (41, '2*3=', '6', '91452fb2e9988e645d362c02b65ca0530b4832ee', '2020-10-19 17:29:12.017449');
INSERT INTO `captcha_captchastore` VALUES (42, '10*1=', '10', 'd98c22d2e6e08390820f25aa49d4906ffb0cc469', '2020-10-19 17:29:18.471725');
INSERT INTO `captcha_captchastore` VALUES (43, '9-2=', '7', '8724ad2eea96f4a4c81dca343c10792a77ea0570', '2020-10-19 17:29:20.448155');
INSERT INTO `captcha_captchastore` VALUES (44, '4*6=', '24', 'f5f60ec636b22a1719b82703bd65dbdf9eedb585', '2020-10-19 17:29:55.615795');
INSERT INTO `captcha_captchastore` VALUES (45, '10*5=', '50', '363802eb635a8a23ede5bbf893be2f2f90d05c1f', '2020-10-19 17:30:57.772664');
INSERT INTO `captcha_captchastore` VALUES (46, '4+5=', '9', '23598b576e920fbae26dfcb518305b68f88d117c', '2020-10-19 17:31:23.581966');
INSERT INTO `captcha_captchastore` VALUES (47, '1+5=', '6', '64a29ad49728157cd22fda604f33f94ee3487bdd', '2020-10-19 17:31:59.915879');
INSERT INTO `captcha_captchastore` VALUES (48, '6+3=', '9', '6e8f2ab295e07c7c4ee1545380b746ab7bdeef13', '2020-10-19 17:33:20.221978');
INSERT INTO `captcha_captchastore` VALUES (49, 'KLKX', 'klkx', '3b86179bdec4aa5dea73206604a471c634834570', '2020-10-19 17:34:01.811548');
INSERT INTO `captcha_captchastore` VALUES (50, 'KEVT', 'kevt', 'bedc9b26804e0055380c2adba821eef0f75151bc', '2020-10-19 17:37:01.648721');
INSERT INTO `captcha_captchastore` VALUES (51, 'YNZJ', 'ynzj', 'c1e0efad13482b746a3960f1a75ade30824bc276', '2020-10-19 17:37:13.208315');
INSERT INTO `captcha_captchastore` VALUES (52, 'WZIM', 'wzim', 'dcfb7f8ac9d8e4f40c9a41f28f2cc2c0643b9a43', '2020-10-19 17:38:31.842685');
INSERT INTO `captcha_captchastore` VALUES (53, 'IIXA', 'iixa', 'e64ab27b0b798429bbdbce6f3fede253c20b2b74', '2020-10-19 17:38:44.536517');
INSERT INTO `captcha_captchastore` VALUES (54, 'IKKO', 'ikko', '132c4b6213f10e3a3036420afa4ccc79ecfed879', '2020-10-19 17:38:55.679564');
INSERT INTO `captcha_captchastore` VALUES (55, 'LANQ', 'lanq', '1901cc95b5c4422948dc13e18933a14748e45957', '2020-10-19 17:39:40.212594');
INSERT INTO `captcha_captchastore` VALUES (56, 'YWXS', 'ywxs', 'a4224048aae70548044156adb70af8e733933e52', '2020-10-19 19:25:24.276061');
INSERT INTO `captcha_captchastore` VALUES (57, 'ZAEW', 'zaew', 'd0536a2c1d8c86242daae352ef2aa7dadcf03bef', '2020-10-19 19:30:45.672144');
INSERT INTO `captcha_captchastore` VALUES (58, 'YKXC', 'ykxc', '0f80b322799632c067d87d89bf57dd02b21a5102', '2020-10-19 19:30:47.672954');
INSERT INTO `captcha_captchastore` VALUES (59, 'RZKB', 'rzkb', '82299831d56cbecae0003c25bf1d8cd61b6ff463', '2020-10-19 19:30:48.326860');
INSERT INTO `captcha_captchastore` VALUES (60, 'YEKR', 'yekr', '7eeb307862f88725e0a818d962311fe4e9f59165', '2020-10-19 19:55:32.339861');
INSERT INTO `captcha_captchastore` VALUES (61, 'DSIC', 'dsic', '01c27e4a6311bef9eb382da8fedbc0fac096d969', '2020-10-19 19:57:04.632156');
INSERT INTO `captcha_captchastore` VALUES (62, 'NLIQ', 'nliq', '6d2ddf55cad01033f8581988af9d070788c711a5', '2020-10-19 20:00:32.767038');
INSERT INTO `captcha_captchastore` VALUES (63, 'ICLO', 'iclo', 'fe77d68ffd711eeb116d672e27a521f7f4d07329', '2020-10-19 20:30:14.559444');
INSERT INTO `captcha_captchastore` VALUES (64, 'TETV', 'tetv', 'fac4e88a2525c4b528c09fee5f5e335216754818', '2020-10-19 20:32:38.801994');
INSERT INTO `captcha_captchastore` VALUES (65, 'OVQT', 'ovqt', 'd1f206ca503a2a41deffb115e4ea96b425e0da3d', '2020-12-18 23:20:07.461512');
INSERT INTO `captcha_captchastore` VALUES (66, 'BJWH', 'bjwh', '38f529ccf88e280c2635096b3dace01420ad5731', '2020-12-19 11:17:03.352753');
INSERT INTO `captcha_captchastore` VALUES (67, 'FVLK', 'fvlk', '47765f94078c1d383d8295576a29a23a647d880b', '2020-12-19 11:44:23.423551');
INSERT INTO `captcha_captchastore` VALUES (68, 'HTDZ', 'htdz', '1224c5bea3a4190d932f61cc13932df3ffa08af0', '2020-12-19 11:44:36.641153');
INSERT INTO `captcha_captchastore` VALUES (69, 'OUKL', 'oukl', '4ca5f07d660dbcbe54dff8f26301d18c4d71c226', '2020-12-19 11:48:49.799178');
INSERT INTO `captcha_captchastore` VALUES (70, 'UPMZ', 'upmz', '7fe62cccc26f638379219a4728e682a0f3d0bba4', '2020-12-19 14:12:05.823268');
INSERT INTO `captcha_captchastore` VALUES (71, 'TQSL', 'tqsl', 'c16b5b135bc675783ee20d1615e7b0f7fa5c931b', '2020-12-19 16:38:29.917714');
INSERT INTO `captcha_captchastore` VALUES (72, 'CYXD', 'cyxd', 'e40c86d9b5510cc9afb580867c07c601862e746a', '2020-12-19 16:51:14.091145');
INSERT INTO `captcha_captchastore` VALUES (73, 'GWDP', 'gwdp', '4ed6ee3cb344ab1404cfd19daa4cbd4e8737e13a', '2020-12-19 16:51:27.623411');
INSERT INTO `captcha_captchastore` VALUES (74, 'ARNE', 'arne', '89a38b113292b45a0d909cb9db1384ee0d5faa9f', '2020-12-19 16:54:18.510963');
INSERT INTO `captcha_captchastore` VALUES (75, 'SMWW', 'smww', 'aaaf7f8206bcb56e760627c2bc3a24ec6d6e00fe', '2020-12-19 16:55:49.258895');
INSERT INTO `captcha_captchastore` VALUES (76, 'HXXB', 'hxxb', '288eb8624bb6bddad13097a391b2687bef1f94bc', '2020-12-19 16:55:56.076257');
INSERT INTO `captcha_captchastore` VALUES (77, 'NLOM', 'nlom', '9901d5652131275e164f6d576aed04c3b1272e16', '2020-12-19 16:56:20.617083');
INSERT INTO `captcha_captchastore` VALUES (78, 'XQWC', 'xqwc', '3f8189f7afe664a441f630e97b669b55ef5553b9', '2020-12-19 16:56:47.012719');
INSERT INTO `captcha_captchastore` VALUES (79, 'HVAN', 'hvan', 'd29fa840495c30a3afe11bd229353d025da770e5', '2020-12-19 16:57:08.645603');
INSERT INTO `captcha_captchastore` VALUES (80, 'HBQP', 'hbqp', '3ecedda4ac68ecc4cfd7ec1cf0fe6d9e90e4ad73', '2020-12-19 18:51:51.293838');
INSERT INTO `captcha_captchastore` VALUES (81, 'RSOJ', 'rsoj', '173dc4c5f1f977b29b5bb8e470b8e17fd60ebc0f', '2020-12-19 18:52:08.431918');
INSERT INTO `captcha_captchastore` VALUES (82, 'GQFT', 'gqft', '8533d7117503511f6e4ab5fb0f7425da0180e365', '2020-12-19 18:52:15.883732');
INSERT INTO `captcha_captchastore` VALUES (83, 'XDOY', 'xdoy', '369f8c4a6875f79806a0ed2c110661c88cbdbd2d', '2020-12-19 19:49:12.718120');
INSERT INTO `captcha_captchastore` VALUES (84, 'DEOT', 'deot', '9f17880b37aa7a84010ef536d081e86009c1f5e9', '2020-12-19 21:03:43.050843');
INSERT INTO `captcha_captchastore` VALUES (85, 'XRTF', 'xrtf', 'de4e1c37e3e3b1d0e2ad9b1ec21b14b54f60433c', '2020-12-19 21:03:50.019993');
INSERT INTO `captcha_captchastore` VALUES (86, 'WLCW', 'wlcw', '1247918f910be0c9912dc88c50cbcfbfe6c748c5', '2020-12-19 21:06:03.696240');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (2, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (1, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (3, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (4, 'yAdmin', 'syscity');
INSERT INTO `django_content_type` VALUES (5, 'yAdmin', 'sysdictionary');
INSERT INTO `django_content_type` VALUES (6, 'yAdmin', 'sysdictionarylist');
INSERT INTO `django_content_type` VALUES (7, 'yAdmin', 'syslog');
INSERT INTO `django_content_type` VALUES (8, 'yAdmin', 'sysmenu');
INSERT INTO `django_content_type` VALUES (9, 'yAdmin', 'sysprovince');
INSERT INTO `django_content_type` VALUES (10, 'yAdmin', 'sysrole');
INSERT INTO `django_content_type` VALUES (11, 'yAdmin', 'sysroleauth');
INSERT INTO `django_content_type` VALUES (12, 'yAdmin', 'sysroleauthdata');
INSERT INTO `django_content_type` VALUES (13, 'yAdmin', 'sysuser');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2020-12-18 23:09:40.390575');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2020-12-18 23:09:40.412516');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2020-12-18 23:09:40.500319');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2020-12-18 23:09:40.584072');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0003_alter_user_email_max_length', '2020-12-18 23:09:40.587049');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0004_alter_user_username_opts', '2020-12-18 23:09:40.591039');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0005_alter_user_last_login_null', '2020-12-18 23:09:40.596025');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0006_require_contenttypes_0002', '2020-12-18 23:09:40.597023');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2020-12-18 23:09:40.601012');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0008_alter_user_username_max_length', '2020-12-18 23:09:40.604004');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2020-12-18 23:09:40.607994');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0010_alter_group_name_max_length', '2020-12-18 23:09:40.614976');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0011_update_proxy_permissions', '2020-12-18 23:09:40.618965');
INSERT INTO `django_migrations` VALUES (14, 'yAdmin', '0001_initial', '2020-12-18 23:09:40.822421');

-- ----------------------------
-- Table structure for sys_city
-- ----------------------------
DROP TABLE IF EXISTS `sys_city`;
CREATE TABLE `sys_city`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CityId` int(11) NOT NULL,
  `CityCode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CityName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ProvinceCode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionary`;
CREATE TABLE `sys_dictionary`  (
  `Dic_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Config` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CreateDate` datetime(6) NULL DEFAULT NULL,
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DBServer` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DbSql` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DicName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DicNo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Enable` int(11) NOT NULL,
  `Modifier` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(6) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  `OrderNo` int(11) NULL DEFAULT NULL,
  `ParentId` int(11) NOT NULL,
  `Remark` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Dic_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_dictionarylist
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionarylist`;
CREATE TABLE `sys_dictionarylist`  (
  `DicList_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CreateDate` datetime(6) NULL DEFAULT NULL,
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DicName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DicValue` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Dic_ID` int(11) NULL DEFAULT NULL,
  `Enable` int(11) NULL DEFAULT NULL,
  `Modifier` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(6) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  `OrderNo` int(11) NULL DEFAULT NULL,
  `Remark` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`DicList_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `BeginDate` datetime(6) NULL DEFAULT NULL,
  `BrowserType` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ElapsedTime` int(11) NULL DEFAULT NULL,
  `EndDate` datetime(6) NULL DEFAULT NULL,
  `ExceptionInfo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `LogType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RequestParameter` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ResponseParameter` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `Role_Id` int(11) NULL DEFAULT NULL,
  `ServiceIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Success` int(11) NULL DEFAULT NULL,
  `Url` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UserIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UserName` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `User_Id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `Menu_Id` int(11) NOT NULL AUTO_INCREMENT,
  `MenuName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Auth` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Enable` int(11) NULL DEFAULT NULL,
  `OrderNo` int(11) NULL DEFAULT NULL,
  `TableName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ParentId` int(11) NOT NULL,
  `Url` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CreateDate` datetime(6) NULL DEFAULT NULL,
  `Creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(6) NULL DEFAULT NULL,
  `Modifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Menu_Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '菜单管理', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'navicon', NULL, 1, 1, 'menu', 0, '/menu', '2020-12-15 20:52:16.000000', NULL, '2020-12-17 18:55:27.805064', NULL);
INSERT INTO `sys_menu` VALUES (2, '角色管理', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新增\",\"value\":\"Create\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"}]', 'address-card-o', NULL, 1, 2, 'role', 0, '/role', '2020-12-16 19:53:32.867142', NULL, '2020-12-19 12:04:19.094228', NULL);
INSERT INTO `sys_menu` VALUES (3, '权限管理', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新增\",\"value\":\"Create\"}]', 'shield', NULL, 1, 3, 'permission', 0, '/permission', '2020-12-16 20:18:13.316681', NULL, '2020-12-19 12:05:26.835170', NULL);
INSERT INTO `sys_menu` VALUES (4, '用户管理', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新增\",\"value\":\"Create\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"上传\",\"value\":\"Upload\"},{\"text\":\"审核\",\"value\":\"Audit\"}]', 'users', NULL, 1, 4, 'user', 0, '/user', '2020-12-16 20:20:23.733877', NULL, '2020-12-19 12:05:52.170794', NULL);

-- ----------------------------
-- Table structure for sys_province
-- ----------------------------
DROP TABLE IF EXISTS `sys_province`;
CREATE TABLE `sys_province`  (
  `ProvinceId` int(11) NOT NULL AUTO_INCREMENT,
  `ProvinceCode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ProvinceName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `RegionCode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ProvinceId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `Role_Id` int(11) NOT NULL AUTO_INCREMENT,
  `CreateDate` datetime(6) NULL DEFAULT NULL,
  `Creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DeleteBy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DeptName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Dept_Id` int(11) NULL DEFAULT NULL,
  `Enable` int(11) NULL DEFAULT NULL,
  `Modifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(6) NULL DEFAULT NULL,
  `OrderNo` int(11) NULL DEFAULT NULL,
  `ParentId` int(11) NOT NULL,
  `RoleName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Role_Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '2020-12-17 19:06:56.000000', NULL, NULL, NULL, NULL, 1, NULL, '2020-12-17 19:07:00.000000', 1, 0, '超管');
INSERT INTO `sys_role` VALUES (2, '2020-12-17 19:13:30.235251', NULL, NULL, NULL, NULL, 1, NULL, '2020-12-17 22:14:56.954078', NULL, 1, '管理员');

-- ----------------------------
-- Table structure for sys_roleauth
-- ----------------------------
DROP TABLE IF EXISTS `sys_roleauth`;
CREATE TABLE `sys_roleauth`  (
  `Auth_Id` int(11) NOT NULL AUTO_INCREMENT,
  `AuthValue` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CreateDate` datetime(6) NULL DEFAULT NULL,
  `Creator` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Menu_Id` int(11) NOT NULL,
  `Modifier` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(6) NULL DEFAULT NULL,
  `Role_Id` int(11) NULL DEFAULT NULL,
  `User_Id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Auth_Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_roleauth
-- ----------------------------
INSERT INTO `sys_roleauth` VALUES (14, 'Search', '2020-12-19 19:53:44.843490', NULL, 1, NULL, '2020-12-19 19:53:44.843490', 2, NULL);
INSERT INTO `sys_roleauth` VALUES (15, 'Search,Create,Delete,Update', '2020-12-19 19:53:44.844486', NULL, 2, NULL, '2020-12-19 19:53:44.844486', 2, NULL);
INSERT INTO `sys_roleauth` VALUES (16, 'Search,Create', '2020-12-19 19:53:44.845484', NULL, 3, NULL, '2020-12-19 19:53:44.845484', 2, NULL);
INSERT INTO `sys_roleauth` VALUES (17, 'Search,Create,Delete,Update,Import,Export,Upload,Audit', '2020-12-19 19:53:44.845484', NULL, 4, NULL, '2020-12-19 19:53:44.845484', 2, NULL);

-- ----------------------------
-- Table structure for sys_roleauthdata
-- ----------------------------
DROP TABLE IF EXISTS `sys_roleauthdata`;
CREATE TABLE `sys_roleauthdata`  (
  `Auth_Id` int(11) NOT NULL,
  `DataType_Id` int(11) NULL DEFAULT NULL,
  `Role_Id` int(11) NULL DEFAULT NULL,
  `User_Id` int(11) NULL DEFAULT NULL,
  `Node_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LevelID` int(11) NULL DEFAULT NULL,
  `AuthValue` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CreateDate` datetime(6) NULL DEFAULT NULL,
  `Modifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`Auth_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `User_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AppType` int(11) NULL DEFAULT NULL,
  `AuditDate` datetime(6) NULL DEFAULT NULL,
  `AuditStatus` int(11) NULL DEFAULT NULL,
  `Auditor` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CreateDate` datetime(6) NULL DEFAULT NULL,
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DeptName` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Dept_Id` int(11) NULL DEFAULT NULL,
  `Email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Enable` int(11) NOT NULL,
  `Gender` int(11) NULL DEFAULT NULL,
  `HeadImageUrl` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IsRegregisterPhone` int(11) NOT NULL,
  `LastLoginDate` datetime(6) NULL DEFAULT NULL,
  `LastModifyPwdDate` datetime(6) NULL DEFAULT NULL,
  `Mobile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Modifier` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(6) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  `OrderNo` int(11) NULL DEFAULT NULL,
  `Role_Id` int(11) NOT NULL,
  `RoleName` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PhoneNo` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Tel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UserTrueName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Token` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`User_Id`) USING BTREE,
  UNIQUE INDEX `Username`(`Username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (NULL, 1, '', '', 1, 1, '2020-12-10 11:03:17.923270', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1638245306@qq.com', 1, 1, 'https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png', 0, NULL, NULL, '18228169007', NULL, NULL, NULL, NULL, 1, '超管', NULL, NULL, NULL, '超级管理员', 'admin', 'pbkdf2_sha256$150000$mjEKLessmIRl$Ifl5Rfw1ds7l6jxjNWHzq/koy7Dy0kpE1TAeyZ/Ypbc=', NULL);
INSERT INTO `sys_user` VALUES (NULL, 0, '', '', 0, 1, '2020-12-17 21:10:12.093747', 2, NULL, NULL, NULL, NULL, NULL, '2020-12-17 21:10:12.093747', NULL, NULL, NULL, NULL, NULL, 1, 1, 'https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png', 1, NULL, NULL, NULL, NULL, '2020-12-17 21:10:48.690152', NULL, NULL, 2, '', NULL, NULL, NULL, '测试1', 'test', 'pbkdf2_sha256$150000$TtUYjiQTVM0R$UEuTTLxJ1obXsaGDcKtZ+yRCGAlyehxUhQve2gFDp00=', NULL);

-- ----------------------------
-- Table structure for sys_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_groups`;
CREATE TABLE `sys_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sysuser_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `sys_user_groups_sysuser_id_group_id_d89870ff_uniq`(`sysuser_id`, `group_id`) USING BTREE,
  INDEX `sys_user_groups_group_id_9b8b43fc_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `sys_user_groups_group_id_9b8b43fc_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sys_user_groups_sysuser_id_c05c83fe_fk_sys_user_User_Id` FOREIGN KEY (`sysuser_id`) REFERENCES `sys_user` (`User_Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_user_permissions`;
CREATE TABLE `sys_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sysuser_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `sys_user_user_permissions_sysuser_id_permission_id_e0fa024f_uniq`(`sysuser_id`, `permission_id`) USING BTREE,
  INDEX `sys_user_user_permis_permission_id_55623e22_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `sys_user_user_permis_permission_id_55623e22_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sys_user_user_permis_sysuser_id_66b315b8_fk_sys_user_` FOREIGN KEY (`sysuser_id`) REFERENCES `sys_user` (`User_Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
