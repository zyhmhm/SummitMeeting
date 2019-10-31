/*
Navicat MySQL Data Transfer

Source Server         : mysql1
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : db_dingcan

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-10-26 09:04:13
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
  `fabulous` int(11) DEFAULT 0 COMMENT '点赞量',
  `imageurl` varchar(255) DEFAULT '' COMMENT '商品图片路径',
  `number` int(11) DEFAULT 0 COMMENT '销量',
  `shop_id` int(11) NOT NULL COMMENT '店铺id',
  `gener_id` int(11) NOT NULL COMMENT '外键，类别，商品类别',
  PRIMARY KEY (`id`),
  KEY `gener_id` (`gener_id`),
  CONSTRAINT `goods_ibfk_1` FOREIGN KEY (`gener_id`) REFERENCES `t_gener` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '冰淇淋', '3', '特别好吃', '0', null, '0', '1', '1');
INSERT INTO `goods` VALUES ('2', '蒜台肉丝', '8', '好吃不贵', '0', null, '0', '2', '3');
INSERT INTO `goods` VALUES ('3', '法式牛排', '25', '美味的很', '0', null, '0', '3', '4');
INSERT INTO `goods` VALUES ('4', '红豆布丁烧奶', '9', '软糯红豆嫩布丁，鲜香甘甜，浓郁的奶香与红豆完美相融，满足感充分体现在你的唇齿和心间', '54', '', '0', '1', '1');
INSERT INTO `goods` VALUES ('5', '焦糖珍奶', '10', '奶茶中的经典款，用不过时，焦糖的甜珍奶的鲜，永远有人喜欢。', '98', '', '103', '1', '1');
INSERT INTO `goods` VALUES ('6', '葡萄柚益菌多', '15', '新鲜葡萄柚与优菌多相遇，酸甜的滋味在唇齿间流转，只需闭上眼用心品味这让人欲罢不能的清爽感。', '45', '', '63', '1', '1');
INSERT INTO `goods` VALUES ('7', '美味奶油蛋糕', '45', '本店蛋糕现做现卖，请顾客朋友提前预定电话：12312345678', '45', '', '56', '5', '4');

-- ----------------------------
-- Table structure for `t_gener`
-- ----------------------------
DROP TABLE IF EXISTS `t_gener`;
CREATE TABLE `t_gener` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gener_name` varchar(255) DEFAULT '' COMMENT '类别名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_gener
-- ----------------------------
INSERT INTO `t_gener` VALUES ('1', '甜品');
INSERT INTO `t_gener` VALUES ('2', '炒菜');
INSERT INTO `t_gener` VALUES ('3', '汤');
INSERT INTO `t_gener` VALUES ('4', '中餐');
INSERT INTO `t_gener` VALUES ('5', '西餐');
INSERT INTO `t_gener` VALUES ('6', '早餐');
INSERT INTO `t_gener` VALUES ('7', '午餐');
INSERT INTO `t_gener` VALUES ('8', '快餐');
INSERT INTO `t_gener` VALUES ('9', '面食');
INSERT INTO `t_gener` VALUES ('10', '海鲜');

-- ----------------------------
-- Table structure for `t_order`
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，唯一标识，订单id',
  `shop_id` int(11) NOT NULL COMMENT '商家店铺id',
  `user_id` int(11) NOT NULL COMMENT '下单人用户id',
  `statu` int(11) NOT NULL COMMENT '订单状态标识，0为未支付，1为已支付,2已接单，3已取货，4正在路上，5已送达',
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('1', '1', '1', '1', '2019-10-26 08:55:57', '2019-10-26 08:56:00', '50', '张三', '125336478525', '宝相寺');
INSERT INTO `t_order` VALUES ('2', '3', '2', '1', '2019-10-26 08:57:31', '2019-10-26 08:57:33', '12', '张三', '125336478525', '宝相寺');
INSERT INTO `t_order` VALUES ('3', '1', '1', '3', '2019-10-26 08:58:31', '2019-10-26 08:58:35', '13', '刘省', '7445787511', '万里堡');
INSERT INTO `t_order` VALUES ('5', '4', '5', '0', '2019-10-25 19:28:30', '2019-10-25 19:28:34', '21', '王红', '7885459', '湖中亭');
INSERT INTO `t_order` VALUES ('8', '8', '4', '2', '2019-10-25 19:42:04', '2019-10-25 19:42:07', '54.5', '李强', '4587512', '飞翔技术学院');
INSERT INTO `t_order` VALUES ('10', '7', '1', '4', '2019-10-25 19:46:35', '2019-10-25 19:46:38', '12', '扩晶环', '7777', '黄金富豪级');

-- ----------------------------
-- Table structure for `t_order_goods`
-- ----------------------------
DROP TABLE IF EXISTS `t_order_goods`;
CREATE TABLE `t_order_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `number` int(11) DEFAULT 1 COMMENT '订单对应商品的数量',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `goods_id` (`goods_id`),
  CONSTRAINT `t_order_goods_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `t_order` (`id`),
  CONSTRAINT `t_order_goods_ibfk_2` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order_goods
-- ----------------------------
INSERT INTO `t_order_goods` VALUES ('1', '5', '1', '1');
INSERT INTO `t_order_goods` VALUES ('2', '5', '2', '1');
INSERT INTO `t_order_goods` VALUES ('3', '5', '4', '1');
INSERT INTO `t_order_goods` VALUES ('4', '1', '1', '1');
INSERT INTO `t_order_goods` VALUES ('5', '3', '3', '1');
INSERT INTO `t_order_goods` VALUES ('6', '3', '7', '1');
INSERT INTO `t_order_goods` VALUES ('8', '8', '1', '1');

-- ----------------------------
-- Table structure for `t_shop`
-- ----------------------------
DROP TABLE IF EXISTS `t_shop`;
CREATE TABLE `t_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商家id',
  `shopname` varchar(255) DEFAULT '' COMMENT '店铺名称',
  `addr` varchar(255) NOT NULL COMMENT '店铺地址',
  `tell` varchar(255) NOT NULL COMMENT '店铺电话',
  `user_id` int(11) DEFAULT NULL COMMENT '商家id，店铺属于哪个商家',
  `open_ime` varchar(255) DEFAULT '00-00' COMMENT '开门时间',
  `close_time` varchar(255) DEFAULT '24-00',
  `image_url` varchar(255) DEFAULT NULL COMMENT '店铺图片的地址',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_shop
-- ----------------------------
INSERT INTO `t_shop` VALUES ('1', '好吃的店', '空中阁楼', '123', '1', '00-00', '24-00', null);
INSERT INTO `t_shop` VALUES ('3', '西餐', '步行街1', '1257896', '1', '00-00', '24-00', null);
INSERT INTO `t_shop` VALUES ('4', '煲仔饭', '中鼎大厦7楼', '1123456', '1', '00-00', '24-00', null);
INSERT INTO `t_shop` VALUES ('6', '胡辣汤', '北三环西路甲18号院-1号大钟寺中坤广场c座', '1123456', '2', '00-00', '24-00', null);
INSERT INTO `t_shop` VALUES ('7', '热干面', '北三环西路甲18号院-1号大钟寺中坤广场c座', '1123456', '2', '00-00', '24-00', null);
INSERT INTO `t_shop` VALUES ('8', '煲仔饭', '中鼎大厦7楼', '1123456', '1', '00-00', '24-00', null);
INSERT INTO `t_shop` VALUES ('10', '米线', '中鼎大厦7楼', '1123456', '1', '00-00', '24-00', null);
INSERT INTO `t_shop` VALUES ('11', '米线', '北三环西路甲18号院-1号大钟寺中坤广场c座', '7894', '1', '00-00', '24-00', null);
INSERT INTO `t_shop` VALUES ('12', '饺子', '中鼎大厦7楼', '7894', '2', '00-00', '24-00', null);
INSERT INTO `t_shop` VALUES ('14', '胡辣汤', '中鼎大厦7楼', '7894', '2', '00-00', '24-00', null);
INSERT INTO `t_shop` VALUES ('15', '热干面', '天润广场', '7894', '1', '00-00', '24-00', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'zhangsan', '123', '123', 'zs@qq.com', '123456', '空中阁楼', '1');
INSERT INTO `t_user` VALUES ('2', 'wangwu', '456', '4546', 'ddd@ui.com', '1234568', '步行街1', '1');
INSERT INTO `t_user` VALUES ('3', 'xiaowang', '5869', '4565', 'jk@yy.com', '7777777', '万花园', '0');
INSERT INTO `t_user` VALUES ('4', 'zhaosi', '789', '5555', '545@qi.com', '9888888', '宝相寺', '0');
INSERT INTO `t_user` VALUES ('5', '李明', 'sdsds', '12548796', 'ww@rr.com', '78988', '万家广场', '1');
INSERT INTO `t_user` VALUES ('6', '李红', '456123', '7854', 'sd@iu.com', '7778787', '中锋园', '0');
INSERT INTO `t_user` VALUES ('7', '李明', '787778', '121545', 'lim@tt.com', '00000', '嵩山lu', '0');
INSERT INTO `t_user` VALUES ('8', '李强', '456', '9875', 'ioiou@qq.com', '785', '无名路', '1');
