/*
Navicat MySQL Data Transfer

Source Server         : mysql-localhost
Source Server Version : 50162
Source Host           : localhost:3306
Source Database       : newbegin

Target Server Type    : MYSQL
Target Server Version : 50162
File Encoding         : 65001

Date: 2014-12-30 18:39:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_0e939a4f` (`group_id`),
  KEY `auth_group_permissions_8373b171` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_58c48ba9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_417f1b1c` (`content_type_id`),
  CONSTRAINT `auth_permissi_content_type_id_51277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add permission', '1', 'add_permission');
INSERT INTO `auth_permission` VALUES ('2', 'Can change permission', '1', 'change_permission');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete permission', '1', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('4', 'Can add group', '2', 'add_group');
INSERT INTO `auth_permission` VALUES ('5', 'Can change group', '2', 'change_group');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete group', '2', 'delete_group');
INSERT INTO `auth_permission` VALUES ('7', 'Can add user', '3', 'add_user');
INSERT INTO `auth_permission` VALUES ('8', 'Can change user', '3', 'change_user');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete user', '3', 'delete_user');
INSERT INTO `auth_permission` VALUES ('10', 'Can view group', '2', 'view_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can view permission', '1', 'view_permission');
INSERT INTO `auth_permission` VALUES ('12', 'Can view user', '3', 'view_user');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '4', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '4', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '4', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can view content type', '4', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('17', 'Can add session', '5', 'add_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can change session', '5', 'change_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete session', '5', 'delete_session');
INSERT INTO `auth_permission` VALUES ('20', 'Can view session', '5', 'view_session');
INSERT INTO `auth_permission` VALUES ('21', 'Can add Bookmark', '6', 'add_bookmark');
INSERT INTO `auth_permission` VALUES ('22', 'Can change Bookmark', '6', 'change_bookmark');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete Bookmark', '6', 'delete_bookmark');
INSERT INTO `auth_permission` VALUES ('24', 'Can add User Setting', '7', 'add_usersettings');
INSERT INTO `auth_permission` VALUES ('25', 'Can change User Setting', '7', 'change_usersettings');
INSERT INTO `auth_permission` VALUES ('26', 'Can delete User Setting', '7', 'delete_usersettings');
INSERT INTO `auth_permission` VALUES ('27', 'Can add User Widget', '8', 'add_userwidget');
INSERT INTO `auth_permission` VALUES ('28', 'Can change User Widget', '8', 'change_userwidget');
INSERT INTO `auth_permission` VALUES ('29', 'Can delete User Widget', '8', 'delete_userwidget');
INSERT INTO `auth_permission` VALUES ('30', 'Can view Bookmark', '6', 'view_bookmark');
INSERT INTO `auth_permission` VALUES ('31', 'Can view User Setting', '7', 'view_usersettings');
INSERT INTO `auth_permission` VALUES ('32', 'Can view User Widget', '8', 'view_userwidget');
INSERT INTO `auth_permission` VALUES ('33', 'Can add revision', '9', 'add_revision');
INSERT INTO `auth_permission` VALUES ('34', 'Can change revision', '9', 'change_revision');
INSERT INTO `auth_permission` VALUES ('35', 'Can delete revision', '9', 'delete_revision');
INSERT INTO `auth_permission` VALUES ('36', 'Can add version', '10', 'add_version');
INSERT INTO `auth_permission` VALUES ('37', 'Can change version', '10', 'change_version');
INSERT INTO `auth_permission` VALUES ('38', 'Can delete version', '10', 'delete_version');
INSERT INTO `auth_permission` VALUES ('39', 'Can view revision', '9', 'view_revision');
INSERT INTO `auth_permission` VALUES ('40', 'Can view version', '10', 'view_version');
INSERT INTO `auth_permission` VALUES ('41', 'Can add 产品规格', '11', 'add_productspec');
INSERT INTO `auth_permission` VALUES ('42', 'Can change 产品规格', '11', 'change_productspec');
INSERT INTO `auth_permission` VALUES ('43', 'Can delete 产品规格', '11', 'delete_productspec');
INSERT INTO `auth_permission` VALUES ('44', 'Can add 基础产品', '12', 'add_baseproduct');
INSERT INTO `auth_permission` VALUES ('45', 'Can change 基础产品', '12', 'change_baseproduct');
INSERT INTO `auth_permission` VALUES ('46', 'Can delete 基础产品', '12', 'delete_baseproduct');
INSERT INTO `auth_permission` VALUES ('47', 'Can add 销售产品', '13', 'add_product');
INSERT INTO `auth_permission` VALUES ('48', 'Can change 销售产品', '13', 'change_product');
INSERT INTO `auth_permission` VALUES ('49', 'Can delete 销售产品', '13', 'delete_product');
INSERT INTO `auth_permission` VALUES ('50', 'Can add 客户', '14', 'add_customer');
INSERT INTO `auth_permission` VALUES ('51', 'Can change 客户', '14', 'change_customer');
INSERT INTO `auth_permission` VALUES ('52', 'Can delete 客户', '14', 'delete_customer');
INSERT INTO `auth_permission` VALUES ('53', 'Can add 订单', '15', 'add_order');
INSERT INTO `auth_permission` VALUES ('54', 'Can change 订单', '15', 'change_order');
INSERT INTO `auth_permission` VALUES ('55', 'Can delete 订单', '15', 'delete_order');
INSERT INTO `auth_permission` VALUES ('56', 'Can add 订单元素', '16', 'add_orderitem');
INSERT INTO `auth_permission` VALUES ('57', 'Can change 订单元素', '16', 'change_orderitem');
INSERT INTO `auth_permission` VALUES ('58', 'Can delete 订单元素', '16', 'delete_orderitem');
INSERT INTO `auth_permission` VALUES ('59', 'Can view 产品规格', '11', 'view_productspec');
INSERT INTO `auth_permission` VALUES ('60', 'Can view 基础产品', '12', 'view_baseproduct');
INSERT INTO `auth_permission` VALUES ('61', 'Can view 客户', '14', 'view_customer');
INSERT INTO `auth_permission` VALUES ('62', 'Can view 订单', '15', 'view_order');
INSERT INTO `auth_permission` VALUES ('63', 'Can view 订单元素', '16', 'view_orderitem');
INSERT INTO `auth_permission` VALUES ('64', 'Can view 销售产品', '13', 'view_product');
INSERT INTO `auth_permission` VALUES ('65', 'Can add log entry', '17', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('66', 'Can change log entry', '17', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('67', 'Can delete log entry', '17', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('68', 'Can view log entry', '17', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('69', 'Can add test', '18', 'add_test');
INSERT INTO `auth_permission` VALUES ('70', 'Can change test', '18', 'change_test');
INSERT INTO `auth_permission` VALUES ('71', 'Can delete test', '18', 'delete_test');
INSERT INTO `auth_permission` VALUES ('72', 'Can view test', '18', 'view_test');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$12000$tCGc216euLMO$CPQ6NJ8R3PTBmtA7Av7vmbiD/fVeqeV5WqbucNOznaA=', '2014-12-30 04:26:40', '1', 'hyx1161', '', '', 'hyx1161@163.com', '1', '1', '2014-12-10 08:16:02');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_e8701ad4` (`user_id`),
  KEY `auth_user_groups_0e939a4f` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_30a071c9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_24702650_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_e8701ad4` (`user_id`),
  KEY `auth_user_user_permissions_8373b171` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_417f1b1c` (`content_type_id`),
  KEY `django_admin_log_e8701ad4` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_1c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin__content_type_id_5151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_3ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'permission', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('2', 'group', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('3', 'user', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('4', 'content type', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('5', 'session', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('6', 'Bookmark', 'xadmin', 'bookmark');
INSERT INTO `django_content_type` VALUES ('7', 'User Setting', 'xadmin', 'usersettings');
INSERT INTO `django_content_type` VALUES ('8', 'User Widget', 'xadmin', 'userwidget');
INSERT INTO `django_content_type` VALUES ('9', 'revision', 'reversion', 'revision');
INSERT INTO `django_content_type` VALUES ('10', 'version', 'reversion', 'version');
INSERT INTO `django_content_type` VALUES ('11', '产品规格', 'salemanagement', 'productspec');
INSERT INTO `django_content_type` VALUES ('12', '基础产品', 'salemanagement', 'baseproduct');
INSERT INTO `django_content_type` VALUES ('13', '销售产品', 'salemanagement', 'product');
INSERT INTO `django_content_type` VALUES ('14', '客户', 'salemanagement', 'customer');
INSERT INTO `django_content_type` VALUES ('15', '订单', 'salemanagement', 'order');
INSERT INTO `django_content_type` VALUES ('16', '订单元素', 'salemanagement', 'orderitem');
INSERT INTO `django_content_type` VALUES ('17', 'log entry', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('18', 'test', 'salemanagement', 'test');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2014-12-10 08:15:40');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2014-12-10 08:15:43');
INSERT INTO `django_migrations` VALUES ('3', 'reversion', '0001_initial', '2014-12-10 08:15:44');
INSERT INTO `django_migrations` VALUES ('4', 'sessions', '0001_initial', '2014-12-10 08:15:44');
INSERT INTO `django_migrations` VALUES ('5', 'admin', '0001_initial', '2014-12-11 03:32:43');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('0s0ybnzygbn3rs9mpxyud005ksnb3l61', 'ZmFiN2U1NDM1ZTE1ZmJiMTI4YTZiN2FlM2UxNjdhMDRhYjNjMDNlZTp7fQ==', '2014-12-24 10:25:31');
INSERT INTO `django_session` VALUES ('94erd4x6aswaw4256bn87esg8gdiax72', 'MDIwYzY3Y2U0Y2E2ZTg3OTVkMjA5YzA4MGQ0YjhjMWJkYjRhODVlMDp7IkxJU1RfUVVFUlkiOltbInNhbGVtYW5hZ2VtZW50IiwiY3VzdG9tZXIiXSwiIl0sIl9hdXRoX3VzZXJfaGFzaCI6ImQyMDUzMjkzNjBlYWJjY2FlNDZjYjI3NWQ0NmJlNGI2MzRiMjY3NDYiLCJfYXV0aF91c2VyX2lkIjoxLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9', '2014-12-24 08:53:13');
INSERT INTO `django_session` VALUES ('berdqfvqh9zh34t3oc6q7qcts2cwc0fi', 'MTYwODc0ODkxY2Y3YzU0MzIwODhjOWJhODU5YTEwYzM3NjE2YzY0ZTp7Il9hdXRoX3VzZXJfaWQiOjEsIkxJU1RfUVVFUlkiOltbInNhbGVtYW5hZ2VtZW50IiwidGVzdCJdLCIiXSwiX2F1dGhfdXNlcl9oYXNoIjoiZDIwNTMyOTM2MGVhYmNjYWU0NmNiMjc1ZDQ2YmU0YjYzNGIyNjc0NiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2015-01-12 08:15:49');
INSERT INTO `django_session` VALUES ('flzt6ifdky5nbpceeyjcln0l15vw06c4', 'NTg4MzgxNGU5NGY2NjQ5NjI5MWI0ZThkN2ZjNjIxODk3MTE0NjgxMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiTElTVF9RVUVSWSI6W1sic2FsZW1hbmFnZW1lbnQiLCJwcm9kdWN0Il0sIiJdLCJfYXV0aF91c2VyX2hhc2giOiJkMjA1MzI5MzYwZWFiY2NhZTQ2Y2IyNzVkNDZiZTRiNjM0YjI2NzQ2IiwiX2F1dGhfdXNlcl9pZCI6MX0=', '2015-01-13 10:28:36');
INSERT INTO `django_session` VALUES ('k0hlmgerxp0me7kq3c25o5burvfk0go1', 'NzJkYzMyODczOWViMGNjOWQ2NGQ5YWMzNGI5ODhiNDg1YTcwOWMxNDp7IkxJU1RfUVVFUlkiOltbInNhbGVtYW5hZ2VtZW50IiwicHJvZHVjdCJdLCIiXSwiX2F1dGhfdXNlcl9oYXNoIjoiZDIwNTMyOTM2MGVhYmNjYWU0NmNiMjc1ZDQ2YmU0YjYzNGIyNjc0NiIsIl9hdXRoX3VzZXJfaWQiOjEsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2015-01-09 08:01:02');
INSERT INTO `django_session` VALUES ('pnxhujb0g1g2il7n4wv08mlt3f525414', 'N2QxYmIyMzU2Mjk0YWI0NzkzYmY4MzIyYmNlMDdkODg5MzQwNDNlMjp7Il9hdXRoX3VzZXJfaWQiOjEsIkxJU1RfUVVFUlkiOltbInNhbGVtYW5hZ2VtZW50IiwicHJvZHVjdHNwZWMiXSwiIl0sIl9hdXRoX3VzZXJfaGFzaCI6ImQyMDUzMjkzNjBlYWJjY2FlNDZjYjI3NWQ0NmJlNGI2MzRiMjY3NDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9', '2015-01-09 10:36:54');
INSERT INTO `django_session` VALUES ('qz08e20kwygq9qx9e67e27hjbdiblrnq', 'MTYwODc0ODkxY2Y3YzU0MzIwODhjOWJhODU5YTEwYzM3NjE2YzY0ZTp7Il9hdXRoX3VzZXJfaWQiOjEsIkxJU1RfUVVFUlkiOltbInNhbGVtYW5hZ2VtZW50IiwidGVzdCJdLCIiXSwiX2F1dGhfdXNlcl9oYXNoIjoiZDIwNTMyOTM2MGVhYmNjYWU0NmNiMjc1ZDQ2YmU0YjYzNGIyNjc0NiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2015-01-12 07:13:45');
INSERT INTO `django_session` VALUES ('xgqr35ah8mprj0pzd7apdxz2h0wdkk21', 'MzFkNGQyM2M2N2EyMWY2YWJhYTNmZGRhZjQwNTgxZjI3YWNhMDRmYTp7Il9hdXRoX3VzZXJfaWQiOjEsIkxJU1RfUVVFUlkiOltbInNhbGVtYW5hZ2VtZW50IiwiY3VzdG9tZXIiXSwiIl0sIl9hdXRoX3VzZXJfaGFzaCI6ImQyMDUzMjkzNjBlYWJjY2FlNDZjYjI3NWQ0NmJlNGI2MzRiMjY3NDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9', '2014-12-24 10:15:44');

-- ----------------------------
-- Table structure for reversion_revision
-- ----------------------------
DROP TABLE IF EXISTS `reversion_revision`;
CREATE TABLE `reversion_revision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manager_slug` varchar(200) NOT NULL,
  `date_created` datetime NOT NULL,
  `comment` longtext NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reversion_revision_b16b0f06` (`manager_slug`),
  KEY `reversion_revision_c69e55a4` (`date_created`),
  KEY `reversion_revision_e8701ad4` (`user_id`),
  CONSTRAINT `reversion_revision_user_id_5b2ec55e_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reversion_revision
-- ----------------------------
INSERT INTO `reversion_revision` VALUES ('1', 'default', '2014-12-11 02:02:16', '初始化版本', '1');
INSERT INTO `reversion_revision` VALUES ('2', 'default', '2014-12-11 02:03:10', '初始化版本', '1');
INSERT INTO `reversion_revision` VALUES ('3', 'default', '2014-12-11 02:03:19', '初始化版本', '1');
INSERT INTO `reversion_revision` VALUES ('4', 'default', '2014-12-22 08:31:07', '初始化版本', '1');
INSERT INTO `reversion_revision` VALUES ('5', 'default', '2014-12-22 08:31:39', '初始化版本', '1');
INSERT INTO `reversion_revision` VALUES ('6', 'default', '2014-12-26 08:21:31', '初始化版本', '1');
INSERT INTO `reversion_revision` VALUES ('7', 'default', '2014-12-30 08:58:28', '初始化版本', '1');
INSERT INTO `reversion_revision` VALUES ('8', 'default', '2014-12-30 09:03:36', '初始化版本', '1');
INSERT INTO `reversion_revision` VALUES ('9', 'default', '2014-12-30 09:54:07', '初始化版本', '1');
INSERT INTO `reversion_revision` VALUES ('10', 'default', '2014-12-30 10:28:20', '初始化版本', '1');

-- ----------------------------
-- Table structure for reversion_version
-- ----------------------------
DROP TABLE IF EXISTS `reversion_version`;
CREATE TABLE `reversion_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` longtext NOT NULL,
  `object_id_int` int(11) DEFAULT NULL,
  `format` varchar(255) NOT NULL,
  `serialized_data` longtext NOT NULL,
  `object_repr` longtext NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `revision_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reversion_version_0c9ba3a3` (`object_id_int`),
  KEY `reversion_version_417f1b1c` (`content_type_id`),
  KEY `reversion_version_5de09a8d` (`revision_id`),
  CONSTRAINT `reversion_version_revision_id_4916a950_fk_reversion_revision_id` FOREIGN KEY (`revision_id`) REFERENCES `reversion_revision` (`id`),
  CONSTRAINT `reversion_ver_content_type_id_26d4c4a9_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reversion_version
-- ----------------------------
INSERT INTO `reversion_version` VALUES ('1', '1', '1', 'json', '[{\"fields\": {\"update_date\": \"2014-12-11T02:02:16.866Z\", \"create_date\": \"2014-12-11T02:02:16.866Z\", \"name\": \"\\u4f55\\u5b87\\u661f\", \"point\": 0, \"pinyin\": \"heyuxing\", \"member_no\": \"\", \"phone\": \"15821389004\", \"birth\": \"2014-12-11\", \"address\": \"\\u4e0a\\u6d77\\u5e02\\u666e\\u9640\\u533a\"}, \"model\": \"salemanagement.customer\", \"pk\": 1}]', '何宇星', '14', '1');
INSERT INTO `reversion_version` VALUES ('2', '1', '1', 'json', '[{\"fields\": {\"update_date\": \"2014-12-11T02:03:10.091Z\", \"create_date\": \"2014-12-11T02:03:10.091Z\", \"name\": \"\\u989c\\u8272\", \"value\": \"\\u9ed1\\u8272\"}, \"model\": \"salemanagement.productspec\", \"pk\": 1}]', '颜色:黑色', '11', '2');
INSERT INTO `reversion_version` VALUES ('3', '2', '2', 'json', '[{\"fields\": {\"update_date\": \"2014-12-11T02:03:19.662Z\", \"create_date\": \"2014-12-11T02:03:19.662Z\", \"name\": \"\\u989c\\u8272\", \"value\": \"\\u767d\\u8272\"}, \"model\": \"salemanagement.productspec\", \"pk\": 2}]', '颜色:白色', '11', '3');
INSERT INTO `reversion_version` VALUES ('4', '1', '1', 'json', '[{\"fields\": {\"update_date\": \"2014-12-22T08:31:07.144Z\", \"code\": \"yuxing\", \"create_date\": \"2014-12-22T08:31:07.144Z\", \"name\": \"he\", \"point\": 11, \"pinyin\": \"aa\", \"price\": \"11\", \"cost\": \"11\", \"unit\": \"\\u4ef6\"}, \"model\": \"salemanagement.baseproduct\", \"pk\": 1}]', 'he', '12', '4');
INSERT INTO `reversion_version` VALUES ('5', '1', '1', 'json', '[{\"fields\": {\"update_date\": \"2014-12-22T08:31:39.720Z\", \"create_date\": \"2014-12-22T08:31:39.720Z\", \"product_spec\": [2], \"point\": 1, \"price\": \"112\", \"cost\": \"11\", \"base_product\": 1, \"unit\": \"\\u4ef6\"}, \"model\": \"salemanagement.product\", \"pk\": 1}]', 'he 颜色:白色 ', '13', '5');
INSERT INTO `reversion_version` VALUES ('6', '3', '3', 'json', '[{\"fields\": {\"update_date\": \"2014-12-26T08:21:31.101Z\", \"create_date\": \"2014-12-26T08:21:31.101Z\", \"name\": \"\\u989c\\u8272\", \"value\": \"\\u767d\\u8272\"}, \"model\": \"salemanagement.productspec\", \"pk\": 3}]', '颜色:白色', '11', '6');
INSERT INTO `reversion_version` VALUES ('7', '4', '4', 'json', '[{\"fields\": {\"update_date\": \"2014-12-30T08:58:28.327Z\", \"create_date\": \"2014-12-30T08:58:28.327Z\", \"name\": \"\\u5c3a\\u5bf8\", \"value\": \"\\u5927\\u53f7\"}, \"model\": \"salemanagement.productspec\", \"pk\": 4}]', '尺寸:大号', '11', '7');
INSERT INTO `reversion_version` VALUES ('8', '5', '5', 'json', '[{\"fields\": {\"update_date\": \"2014-12-30T09:03:36.242Z\", \"create_date\": \"2014-12-30T09:03:36.242Z\", \"name\": \"\\u5c3a\\u5bf8\", \"value\": \"\\u4e2d\\u53f7\"}, \"model\": \"salemanagement.productspec\", \"pk\": 5}]', '尺寸:中号', '11', '8');
INSERT INTO `reversion_version` VALUES ('9', '6', '6', 'json', '[{\"fields\": {\"update_date\": \"2014-12-30T09:54:07.230Z\", \"create_date\": \"2014-12-30T09:54:07.230Z\", \"name\": \"\\u5c3a\\u5bf8\", \"value\": \"\\u5c0f\\u53f7\"}, \"model\": \"salemanagement.productspec\", \"pk\": 6}]', '尺寸:小号', '11', '9');
INSERT INTO `reversion_version` VALUES ('10', '2', '2', 'json', '[{\"fields\": {\"update_date\": \"2014-12-30T10:28:20.084Z\", \"create_date\": \"2014-12-30T10:28:20.084Z\", \"product_spec\": [5], \"point\": 11, \"price\": \"11\", \"cost\": \"111\", \"base_product\": 1, \"unit\": \"\\u4ef6\"}, \"model\": \"salemanagement.product\", \"pk\": 2}]', 'he 尺寸:中号 ', '13', '10');

-- ----------------------------
-- Table structure for salemanagement_baseproduct
-- ----------------------------
DROP TABLE IF EXISTS `salemanagement_baseproduct`;
CREATE TABLE `salemanagement_baseproduct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `code` varchar(50) NOT NULL,
  `pinyin` varchar(60) NOT NULL,
  `unit` varchar(30) NOT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `cost` decimal(8,2) DEFAULT NULL,
  `point` int(11) NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of salemanagement_baseproduct
-- ----------------------------
INSERT INTO `salemanagement_baseproduct` VALUES ('1', 'he', 'yuxing', 'aa', '件', '11.00', '11.00', '11', '2014-12-22 08:31:07', '2014-12-22 08:31:07');

-- ----------------------------
-- Table structure for salemanagement_customer
-- ----------------------------
DROP TABLE IF EXISTS `salemanagement_customer`;
CREATE TABLE `salemanagement_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `pinyin` varchar(60) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `address` varchar(128) NOT NULL,
  `birth` date DEFAULT NULL,
  `point` int(11) NOT NULL,
  `member_no` varchar(30) NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of salemanagement_customer
-- ----------------------------
INSERT INTO `salemanagement_customer` VALUES ('1', '何宇星', 'heyuxing', '15821389004', '上海市普陀区', '2014-12-11', '0', '', '2014-12-11 02:02:16', '2014-12-11 02:02:16');

-- ----------------------------
-- Table structure for salemanagement_order
-- ----------------------------
DROP TABLE IF EXISTS `salemanagement_order`;
CREATE TABLE `salemanagement_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_code` varchar(50) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `should_pay` decimal(8,2) NOT NULL,
  `pre_pay` decimal(8,2) NOT NULL,
  `actual_pay` decimal(8,2) NOT NULL,
  `had_pay` tinyint(1) NOT NULL,
  `point` int(11) NOT NULL,
  `cost` decimal(8,2) NOT NULL,
  `discount` int(11) NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `salemanagement_order_09847825` (`customer_id`),
  CONSTRAINT `customer_id_refs_id_3d78ce86` FOREIGN KEY (`customer_id`) REFERENCES `salemanagement_customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of salemanagement_order
-- ----------------------------

-- ----------------------------
-- Table structure for salemanagement_orderitem
-- ----------------------------
DROP TABLE IF EXISTS `salemanagement_orderitem`;
CREATE TABLE `salemanagement_orderitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `should_pay` decimal(8,2) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `cost` decimal(8,2) NOT NULL,
  `discount` int(11) NOT NULL,
  `point` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `salemanagement_orderitem_68d25c7a` (`order_id`),
  KEY `salemanagement_orderitem_7f1b40ad` (`product_id`),
  CONSTRAINT `order_id_refs_id_d0c3466a` FOREIGN KEY (`order_id`) REFERENCES `salemanagement_order` (`id`),
  CONSTRAINT `product_id_refs_id_6e7cf895` FOREIGN KEY (`product_id`) REFERENCES `salemanagement_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of salemanagement_orderitem
-- ----------------------------

-- ----------------------------
-- Table structure for salemanagement_product
-- ----------------------------
DROP TABLE IF EXISTS `salemanagement_product`;
CREATE TABLE `salemanagement_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `base_product_id` int(11) NOT NULL,
  `unit` varchar(30) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `cost` decimal(8,2) NOT NULL,
  `point` int(11) NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `salemanagement_product_8e446c3b` (`base_product_id`),
  CONSTRAINT `base_product_id_refs_id_3199c93d` FOREIGN KEY (`base_product_id`) REFERENCES `salemanagement_baseproduct` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of salemanagement_product
-- ----------------------------
INSERT INTO `salemanagement_product` VALUES ('1', '1', '件', '112.00', '11.00', '1', '2014-12-22 08:31:39', '2014-12-22 08:31:39');
INSERT INTO `salemanagement_product` VALUES ('2', '1', '件', '11.00', '111.00', '11', '2014-12-30 10:28:20', '2014-12-30 10:28:20');

-- ----------------------------
-- Table structure for salemanagement_productspec
-- ----------------------------
DROP TABLE IF EXISTS `salemanagement_productspec`;
CREATE TABLE `salemanagement_productspec` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `value` varchar(128) NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of salemanagement_productspec
-- ----------------------------
INSERT INTO `salemanagement_productspec` VALUES ('1', '颜色', '黑色', '2014-12-11 02:03:10', '2014-12-11 02:03:10');
INSERT INTO `salemanagement_productspec` VALUES ('3', '颜色', '白色', '2014-12-26 08:21:31', '2014-12-26 08:21:31');
INSERT INTO `salemanagement_productspec` VALUES ('4', '尺寸', '大号', '2014-12-30 08:58:28', '2014-12-30 08:58:28');
INSERT INTO `salemanagement_productspec` VALUES ('5', '尺寸', '中号', '2014-12-30 09:03:36', '2014-12-30 09:03:36');
INSERT INTO `salemanagement_productspec` VALUES ('6', '尺寸', '小号', '2014-12-30 09:54:07', '2014-12-30 09:54:07');

-- ----------------------------
-- Table structure for salemanagement_product_product_spec
-- ----------------------------
DROP TABLE IF EXISTS `salemanagement_product_product_spec`;
CREATE TABLE `salemanagement_product_product_spec` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `productspec_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_id` (`product_id`,`productspec_id`),
  KEY `salemanagement_product_product_spec_7f1b40ad` (`product_id`),
  KEY `salemanagement_product_product_spec_f86c6fd8` (`productspec_id`),
  CONSTRAINT `productspec_id_refs_id_92a3dcb9` FOREIGN KEY (`productspec_id`) REFERENCES `salemanagement_productspec` (`id`),
  CONSTRAINT `product_id_refs_id_9f10f1b2` FOREIGN KEY (`product_id`) REFERENCES `salemanagement_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of salemanagement_product_product_spec
-- ----------------------------
INSERT INTO `salemanagement_product_product_spec` VALUES ('1', '2', '5');

-- ----------------------------
-- Table structure for salemanagement_test
-- ----------------------------
DROP TABLE IF EXISTS `salemanagement_test`;
CREATE TABLE `salemanagement_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `gender` varchar(2) NOT NULL,
  `birthday` date DEFAULT NULL,
  `img` varchar(100) DEFAULT NULL,
  `phoneNum` varchar(13) DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  `hobbies` varchar(100) DEFAULT NULL,
  `regTime` datetime DEFAULT NULL,
  `bio` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of salemanagement_test
-- ----------------------------
INSERT INTO `salemanagement_test` VALUES ('1', 'hyx', 'hyx', 'M', '2014-12-29', 'photo/yeepayphone.jpg', '', '', '', null, '');

-- ----------------------------
-- Table structure for xadmin_bookmark
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_bookmark`;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `url_name` varchar(64) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookmark_6340c63c` (`user_id`),
  KEY `xadmin_bookmark_37ef4eb4` (`content_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_bookmark
-- ----------------------------

-- ----------------------------
-- Table structure for xadmin_usersettings
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_usersettings`;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_6340c63c` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
INSERT INTO `xadmin_usersettings` VALUES ('1', '1', 'dashboard:home:pos', '');

-- ----------------------------
-- Table structure for xadmin_userwidget
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_userwidget`;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_6340c63c` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_userwidget
-- ----------------------------
