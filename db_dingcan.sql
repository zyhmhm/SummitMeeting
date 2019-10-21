/*
Navicat MySQL Data Transfer

Source Server         : mysql1
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : db_dingcan

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-10-21 20:17:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品的id',
  `good_name` varchar(255) NOT NULL DEFAULT '' COMMENT '商品名称',
  `price` double NOT NULL COMMENT '商品价格',
  `des` varchar(255) DEFAULT '' COMMENT '商品描述',
  `gener_id` int(11) NOT NULL COMMENT '外键，类别，商品类别',
  PRIMARY KEY (`id`),
  KEY `gener_id` (`gener_id`),
  CONSTRAINT `goods_ibfk_1` FOREIGN KEY (`gener_id`) REFERENCES `t_gener` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '冰淇淋', '3', '特别好吃', '1');
INSERT INTO `goods` VALUES ('2', '蒜台肉丝', '8', '好吃不贵', '3');
INSERT INTO `goods` VALUES ('3', '法式牛排', '25', '美味的很', '4');

-- ----------------------------
-- Table structure for `t_gener`
-- ----------------------------
DROP TABLE IF EXISTS `t_gener`;
CREATE TABLE `t_gener` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gener_name` varchar(255) DEFAULT '' COMMENT '类别名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_gener
-- ----------------------------
INSERT INTO `t_gener` VALUES ('1', '甜品');
INSERT INTO `t_gener` VALUES ('2', '炒菜');
INSERT INTO `t_gener` VALUES ('3', '汤');
INSERT INTO `t_gener` VALUES ('4', '中餐');
INSERT INTO `t_gener` VALUES ('5', '西餐');

-- ----------------------------
-- Table structure for `t_good_shops`
-- ----------------------------
DROP TABLE IF EXISTS `t_good_shops`;
CREATE TABLE `t_good_shops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `good_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`),
  KEY `good_id` (`good_id`),
  CONSTRAINT `good_id` FOREIGN KEY (`good_id`) REFERENCES `goods` (`id`),
  CONSTRAINT `shop_id` FOREIGN KEY (`shop_id`) REFERENCES `t_shop` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_good_shops
-- ----------------------------
INSERT INTO `t_good_shops` VALUES ('1', '1', '1');

-- ----------------------------
-- Table structure for `t_order`
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，唯一标识，订单id',
  `shop_id` int(11) NOT NULL COMMENT '商家店铺id',
  `user_id` int(11) NOT NULL COMMENT '下单人用户id',
  `statu` int(11) NOT NULL COMMENT '订单状态标识，0为未支付，1为已支付',
  `create_time` datetime DEFAULT NULL,
  `pay_time` datetime DEFAULT NULL,
  `price` double NOT NULL COMMENT '订单价钱',
  `contact_name` varchar(255) NOT NULL COMMENT '订单上面的联系热名称，刚创建订单的时候应该和下单用户名称一样',
  `contact_tell` varchar(255) NOT NULL COMMENT '订单的联系人电话',
  `contact_addr` varchar(255) NOT NULL COMMENT '订单的联系人地址',
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `t_order_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `t_shop` (`id`),
  CONSTRAINT `t_order_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('1', '1', '1', '1', '2019-10-20 12:03:56', '2019-10-20 12:03:59', '21', 'zhangsan', '123456', '空中阁楼');
INSERT INTO `t_order` VALUES ('2', '1', '2', '1', '2019-10-21 16:37:09', '2019-10-21 16:37:12', '55', '李恒', '45878', '万里堡');

-- ----------------------------
-- Table structure for `t_order_goods`
-- ----------------------------
DROP TABLE IF EXISTS `t_order_goods`;
CREATE TABLE `t_order_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `goods_id` (`goods_id`),
  CONSTRAINT `t_order_goods_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `t_order` (`id`),
  CONSTRAINT `t_order_goods_ibfk_2` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order_goods
-- ----------------------------
INSERT INTO `t_order_goods` VALUES ('1', '1', '1');
INSERT INTO `t_order_goods` VALUES ('2', '1', '2');
INSERT INTO `t_order_goods` VALUES ('3', '1', '3');
INSERT INTO `t_order_goods` VALUES ('4', '2', '2');

-- ----------------------------
-- Table structure for `t_shop`
-- ----------------------------
DROP TABLE IF EXISTS `t_shop`;
CREATE TABLE `t_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商家id',
  `name` varchar(255) DEFAULT '' COMMENT '店铺名称',
  `addr` varchar(255) NOT NULL COMMENT '店铺地址',
  `tell` varchar(255) NOT NULL COMMENT '店铺电话',
  `user_id` int(11) DEFAULT NULL COMMENT '商家id，店铺属于哪个商家',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_shop
-- ----------------------------
INSERT INTO `t_shop` VALUES ('1', '好吃的店', '空中阁楼', '123', '1');
INSERT INTO `t_shop` VALUES ('2', '中餐', '步行街1', '138546125', '2');
INSERT INTO `t_shop` VALUES ('3', '西餐', '步行街1', '1257896', '1');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识，用户id',
  `username` varchar(255) NOT NULL COMMENT '用户名称',
  `pwd` varchar(255) NOT NULL COMMENT '用户密码',
  `salt` varchar(255) NOT NULL COMMENT '加密的盐值',
  `emial` varchar(25) NOT NULL COMMENT '用户邮箱',
  `tell` varchar(20) NOT NULL COMMENT '用户电话',
  `adrr` varchar(255) NOT NULL COMMENT '用户地址',
  `mark` int(11) NOT NULL COMMENT '用户标记，用于区分店家和普通用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'zhangsan', '123', '123', 'zs@qq.com', '123456', '空中阁楼', '1');
INSERT INTO `t_user` VALUES ('2', 'wangwu', '456', '4546', 'ddd@ui.com', '1234568', '步行街1', '1');
INSERT INTO `t_user` VALUES ('3', 'xiaowang', '5869', '4565', 'jk@yy.com', '7777777', '万花园', '0');
INSERT INTO `t_user` VALUES ('4', 'zhaosi', '789', '5555', '545@qi.com', '9888888', '宝相寺', '0');
