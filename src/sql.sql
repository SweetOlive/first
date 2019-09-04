/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : edu

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2019-09-04 14:04:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for budget_management
-- ----------------------------
DROP TABLE IF EXISTS `budget_management`;
CREATE TABLE `budget_management` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `introduce` varchar(255) DEFAULT NULL,
  `budget_capital` int(10) DEFAULT NULL,
  `used_capital` int(10) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_user_id` int(5) DEFAULT NULL,
  `update_user_id` int(5) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of budget_management
-- ----------------------------
INSERT INTO `budget_management` VALUES ('2', '二零一九年一月安检预算', '对铁路进行安检维修工作！', '100000', null, 'S', '00190309224643P7N800', '2019-03-09 22:46:44', '2019-03-09 22:46:44', '1', '1', '');
INSERT INTO `budget_management` VALUES ('3', '二零一九年一月物资采购预算', '查询仓库物资是否不足，对不足的物资进行有计划的采购！', '200000', null, 'S', '00190309224907Q9BB01', '2019-03-09 22:49:08', '2019-03-09 22:49:08', '1', '1', '');
INSERT INTO `budget_management` VALUES ('4', '二零一九年一月公费支出预算', '对铁路物资人员办公花销预估个大概的数值！', '50000', null, 'S', '00190309225041BH2S02', '2019-03-09 22:50:42', '2019-03-09 22:50:42', '1', '1', '');
INSERT INTO `budget_management` VALUES ('5', '二零一九年二月安检预算', '每月固定一次安检维修！', '100000', null, 'S', '001903092303031MOF00', '2019-03-09 23:03:03', '2019-03-09 23:03:03', '1', '1', '');
INSERT INTO `budget_management` VALUES ('6', '二零一九年二月物资采购预算', '每月一次物资清算，对库存不足的物资进行采购购买！', '200000', null, 'S', '00190309230355FMBO01', '2019-03-09 23:03:55', '2019-03-09 23:03:55', '1', '1', '');
INSERT INTO `budget_management` VALUES ('7', '二零一九年二月公费支出预算', '例行公费预算，给出本月公费的大概数值！', '50000', null, 'S', '001903092304451RP502', '2019-03-09 23:04:45', '2019-03-09 23:04:45', '1', '1', '');

-- ----------------------------
-- Table structure for demand_management
-- ----------------------------
DROP TABLE IF EXISTS `demand_management`;
CREATE TABLE `demand_management` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `budget_id` int(5) DEFAULT NULL,
  `department_id` int(5) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `introduce` varchar(255) DEFAULT NULL,
  `used_capital` int(10) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_user_id` int(5) DEFAULT NULL,
  `update_user_id` int(5) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of demand_management
-- ----------------------------
INSERT INTO `demand_management` VALUES ('5', null, null, '二零一九一月物资购买需求', '仓库有些物资欠缺，需购买！', '100000', 'S', '00190309225843KMVE00', '2019-03-09 22:58:44', '2019-03-09 22:58:44', '1', '1', '');
INSERT INTO `demand_management` VALUES ('6', null, null, '二零一九一月铁路维修需求', '广州市14号线铁路嘉禾望岗有路障，需要维修请求！', '200000', 'S', '00190309230637YQA103', '2019-03-09 23:06:38', '2019-03-09 23:06:38', '1', '1', '');
INSERT INTO `demand_management` VALUES ('7', null, null, '二零一九二月铁路维修需求', '广州市2号线地铁华南路段进行二月维修检查！', '200000', 'S', '00190309230823PCQ604', '2019-03-09 23:08:24', '2019-03-09 23:08:24', '1', '1', '');
INSERT INTO `demand_management` VALUES ('8', null, null, '二零一九二月铁路物资需求', '华南高速路段需要对铁轨重新排铺！', '200000', 'S', '001903092312229V3H05', '2019-03-09 23:12:22', '2019-03-09 23:12:22', '1', '1', '');

-- ----------------------------
-- Table structure for hello
-- ----------------------------
DROP TABLE IF EXISTS `hello`;
CREATE TABLE `hello` (
  `id` int(20) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL COMMENT '名字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hello
-- ----------------------------
INSERT INTO `hello` VALUES ('1', 'wushi');

-- ----------------------------
-- Table structure for price_goods_catalog
-- ----------------------------
DROP TABLE IF EXISTS `price_goods_catalog`;
CREATE TABLE `price_goods_catalog` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `department_id` int(5) DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `introduce` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `approvers` varchar(255) DEFAULT NULL,
  `copiers` varchar(255) DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `create_user_id` int(5) DEFAULT NULL,
  `update_user_id` int(5) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of price_goods_catalog
-- ----------------------------
INSERT INTO `price_goods_catalog` VALUES ('1', '中国铁路物资总局物资目录', null, '8', '00190219213404XUTS00', '总纲领', 'S', null, null, null, null, null, '1', '1', '2019-02-19 21:34:04', '2019-02-25 21:15:16', null);
INSERT INTO `price_goods_catalog` VALUES ('8', '广东省韩资铁轨企业有限公司物资目录', null, '1', '00190220215219DYMN00', '', 'F', null, null, null, null, null, '1', '1', '2019-02-20 21:52:20', '2019-02-25 21:15:07', null);
INSERT INTO `price_goods_catalog` VALUES ('10', '湖南省邯钢企业有限公司物资目录', null, '3', '001903082337564QIY00', '', 'S', null, null, null, null, null, '1', '1', '2019-03-08 23:37:57', '2019-03-08 23:37:57', null);
INSERT INTO `price_goods_catalog` VALUES ('11', '广西省壮族煤炭有限公司物资目录', null, '5', '00190309000646XXGH00', '', 'F', null, null, null, null, null, '1', '1', '2019-03-09 00:06:46', '2019-03-09 00:06:46', null);
INSERT INTO `price_goods_catalog` VALUES ('12', '广东影视业轨道有限公司物资目录', null, '7', '00190309000715TVEF01', '', 'S', null, null, null, null, null, '1', '1', '2019-03-09 00:07:15', '2019-03-09 00:07:15', null);
INSERT INTO `price_goods_catalog` VALUES ('13', '海南头叶子钢铁有限公司物资目录', null, '6', '00190309214641CKRR00', null, 'S', null, null, null, null, null, '1', '1', '2019-03-09 21:46:41', '2019-03-09 21:46:41', null);

-- ----------------------------
-- Table structure for price_goods_contact
-- ----------------------------
DROP TABLE IF EXISTS `price_goods_contact`;
CREATE TABLE `price_goods_contact` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `parent_id` int(5) DEFAULT NULL,
  `catalog_id` int(5) DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `introduce` varchar(255) DEFAULT NULL,
  `variety` varchar(255) DEFAULT NULL,
  `large_clacc` varchar(255) DEFAULT NULL,
  `small_clacc` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `count` int(10) DEFAULT NULL,
  `img_path` varchar(255) DEFAULT NULL,
  `price` double(10,4) DEFAULT NULL,
  `weight` double(10,4) DEFAULT NULL,
  `volume` double(10,4) DEFAULT NULL,
  `is_limit` varchar(255) DEFAULT NULL,
  `limit_start_time` datetime DEFAULT NULL,
  `limit_end_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_user_id` int(5) DEFAULT NULL,
  `update_user_id` int(5) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=676 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of price_goods_contact
-- ----------------------------
INSERT INTO `price_goods_contact` VALUES ('1', '-1', '1', null, null, '铁路物资总纲', null, null, null, null, null, null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `price_goods_contact` VALUES ('15', '-1', '8', null, null, '矿山路局', null, null, null, null, '0019022021522192KY01', null, '18m*18m', '组', '199', null, '0.0000', null, null, null, null, null, '2019-02-20 21:52:22', '2019-02-20 21:52:22', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('16', '15', '8', null, null, '铁轨一号', '', null, null, null, '00190220215232RFIX02', null, '18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-20 21:52:33', '2019-02-20 21:52:33', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('18', '16', '8', null, null, '铁轨', '', null, null, null, '00190220223048P6BB00', null, '10m*10m*10m', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-20 22:30:49', '2019-02-20 22:30:49', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('20', '1', '1', null, null, '金属材料', '', null, null, null, '00190225211727TGWB01', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:17:27', '2019-02-25 21:17:27', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('21', '1', '1', null, null, '非金属材料', '', null, null, null, '00190225211738AAOW02', null, '18mm*18mm*18mm', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:17:38', '2019-02-25 21:17:38', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('22', '1', '1', null, null, '轨道材料', '', null, null, null, '00190225211828OGKY03', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:18:29', '2019-02-25 21:18:29', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('23', '1', '1', null, null, '施工料具', '', null, null, null, '0019022521183670TS04', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:18:36', '2019-02-25 21:18:36', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('24', '1', '1', null, null, '电工器材', '', null, null, null, '00190225211854X4NP05', null, '10m*10m*10m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:18:54', '2019-02-25 21:18:54', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('25', '1', '1', null, null, '仪表仪器', '', null, null, null, '00190225211943TWUX06', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:19:44', '2019-02-25 21:19:44', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('26', '1', '1', null, null, '工具器具', '', null, null, null, '00190225212014632Z07', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:20:14', '2019-02-25 21:20:14', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('27', '1', '1', null, null, '机械设备', '', null, null, null, '00190225212059KF5K08', null, '18mm*18mm*18mm', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:20:59', '2019-02-25 21:20:59', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('28', '1', '1', null, null, '电工设备', '', null, null, null, '001902252121375OCO09', null, '18m', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:21:38', '2019-02-25 21:21:38', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('29', '20', '1', null, null, '生铁及黑色金属废残料', '', null, null, null, '00190225212301OR2T10', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:23:01', '2019-02-25 21:23:01', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('30', '29', '1', null, null, '铸造生铁', '各种铸造用生铁、锰铁', null, null, null, '00190225212409I0AZ11', null, '10m*10m*10m', '捆', '0', '/goods/img/2019/3/3/201903032149550000.png', '10.0000', null, null, 'Y', '2019-03-13 00:00:00', '2019-03-14 00:00:00', '2019-02-25 21:24:10', '2019-03-08 23:23:30', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('31', '29', '1', null, null, '废钢废铁', '各种废铁、废钢、金属屑', null, null, null, '00190225212430ULFD12', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:24:31', '2019-02-25 21:24:31', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('32', '29', '1', null, null, '废钢轨废道岔', '各种废旧钢轨、废道岔、废岔芯、废岔尖、废车轮、废轮箍等', null, null, null, '00190225212510P2J413', null, '18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:25:10', '2019-02-25 21:25:10', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('33', '20', '1', null, null, '型钢', '', null, null, null, '00190225212538XM9014', null, '18mm*18mm*18mm', '块', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:25:39', '2019-02-25 21:25:39', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('34', '33', '1', null, null, '圆钢', '', null, null, null, '001902252126262HOH15', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:26:27', '2019-02-25 21:26:27', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('35', '33', '1', null, null, '方钢', '', null, null, null, '001902252126419LYF16', null, '18m*18m', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:26:41', '2019-02-25 21:26:41', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('36', '33', '1', null, null, '扁钢', '', null, null, null, '00190225212647HNCE17', null, '10m*10m*10m', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:26:47', '2019-02-25 21:26:47', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('37', '33', '1', null, null, '工字钢', '', null, null, null, '00190225212711KTCE18', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:27:12', '2019-02-25 21:27:12', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('38', '33', '1', null, null, '槽钢', '', null, null, null, '00190225212718N2U119', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:27:18', '2019-02-25 21:27:18', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('39', '33', '1', null, null, '等边角钢', '', null, null, null, '00190225212737F14E20', null, '18mm*18mm*18mm', '块', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:27:38', '2019-02-25 21:27:38', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('40', '33', '1', null, null, '不等边角钢', '', null, null, null, '00190225212743BIXZ21', null, '18m*18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:27:44', '2019-02-25 21:27:44', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('41', '33', '1', null, null, '异型钢', '', null, null, null, '00190225212757OTLF22', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:27:58', '2019-02-25 21:27:58', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('42', '33', '1', null, null, '螺纹钢', '', null, null, null, '001902252128104SFE23', null, '10m*10m*10m', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:28:11', '2019-02-25 21:28:11', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('43', '33', '1', null, null, '盘条', '', null, null, null, '00190225212820IQMG24', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:28:21', '2019-02-25 21:28:21', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('44', '34', '1', null, null, '小型圆钢', '直径≤37mm的普通碳素钢热轧圆钢\r\n直径≤37mm的普通低合金钢热轧圆钢', null, null, null, '00190225212927PO1B25', null, '18m', '条', '0', null, '0.0000', null, null, 'Y', '2019-03-16 00:00:00', '2019-04-01 00:00:00', '2019-02-25 21:29:28', '2019-03-09 23:13:28', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('45', '34', '1', null, null, '中型圆钢', '38mm≤直径＜81mm普通碳素钢热轧圆钢\r\n38mm≤直径＜81mm普通低合金钢热轧圆钢', null, null, null, '00190225213013U5GU26', null, '18m*18m', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:30:13', '2019-02-25 21:30:13', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('46', '34', '1', null, null, '大型圆钢', '直径≥81mm的普通碳素钢热轧圆钢\r\n直径≥81mm的普通低合金钢热轧圆钢', null, null, null, '00190225213038HNNS27', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:30:39', '2019-02-25 21:30:39', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('47', '35', '1', null, null, '小型方钢', '截面边长≤37mm的普通碳素钢热轧方钢', null, null, null, '00190225213059K3YP28', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:30:59', '2019-02-25 21:30:59', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('48', '35', '1', null, null, '中型方钢', '38mm≤截面边长≤80mm普通碳素钢方钢', null, null, null, '00190225213120SNTN29', null, '10m*10m*10m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:31:21', '2019-02-25 21:31:21', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('49', '35', '1', null, null, '大型方钢', '截面边长＞80mm的普通碳素钢方钢', null, null, null, '001902252131363CMH30', null, '10cm*10cm*10cm', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:31:37', '2019-02-25 21:31:37', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('50', '36', '1', null, null, '小型扁钢', '厚度≤16mm、宽度≤59mm的普通碳素钢热轧扁钢\r\n18mm≤厚度≤22mm、宽度≤59mm的普通碳素钢热轧扁钢', null, null, null, '00190225213243CR3531', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:32:43', '2019-02-25 21:32:43', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('51', '36', '1', null, null, '中型扁钢', '厚度≤18mm、60mm≤宽度＜100mm的普通碳素钢热轧扁钢\r\n18mm＜厚度≤32mm、60mm≤宽度＜100mm的普通碳素钢热轧扁钢\r\n14mm＜厚度≤32mm、60mm≤宽度＜100mm的普通低合金钢扁钢', null, null, null, '001902252133179JDH32', null, '18mm*18mm*18mm', '块', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:33:17', '2019-02-25 21:33:17', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('52', '36', '1', null, null, '大型扁钢', '厚度≤18mm、宽度≥101mm的普通碳素钢扁钢\r\n18mm＜厚度≤33mm、宽度≥101mm的普通碳素钢扁钢\r\n16mm≤厚度≤40mm、宽度≥101mm的普通型合金钢扁钢', null, null, null, '00190225213347I8UW33', null, '18m', '条', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:33:47', '2019-02-25 21:33:47', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('53', '37', '1', null, null, '中型工字钢', '高度＜180mm的普通碳素钢热轧工字钢\r\n高度＜180mm的普通低合金钢热轧工字钢', null, null, null, '00190225213417T1CD34', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:34:17', '2019-02-25 21:34:17', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('54', '37', '1', null, null, '大型工字钢', '高度≥180mm的普通碳素钢热轧工字钢\r\n高度≥180mm的普通低合金钢热轧工字钢', null, null, null, '00190225213440AMEQ35', null, '10m*10m*10m', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:34:40', '2019-02-25 21:34:40', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('55', '38', '1', null, null, '中型槽钢', '高度＜180mm的普通碳素钢热轧槽钢\r\n高度＜180mm的普通低合金钢热轧槽钢', null, null, null, '00190225213514Q7RF36', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:35:14', '2019-02-25 21:35:14', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('56', '38', '1', null, null, '大型槽钢', '高度≥180mm的普通碳素钢热轧槽钢\r\n高度≥180mm的普通低合金钢热轧槽钢', null, null, null, '00190225213535CLKS37', null, '18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:35:36', '2019-02-25 21:35:36', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('57', '39', '1', null, null, '小型等边角钢', '边宽≤49mm的普通碳素钢热轧等边角钢　\r\n边宽≤49mm的普通低合金钢热轧等边角钢　', null, null, null, '00190225213602CSZX38', null, '18mm*18mm*18mm', '块', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:36:02', '2019-02-25 21:36:02', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('58', '39', '1', null, null, '中型等边角钢', '50mm≤边宽≤149mm的普通碳素钢热轧等边角钢　\r\n50mm≤边宽≤149mm的桥梁用普通碳素、低合金钢热轧等边角钢　\r\n50mm≤边宽≤149mm的普通低合金钢热轧等边角钢　', null, null, null, '0019022521365084BC39', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:36:50', '2019-02-25 21:36:50', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('59', '39', '1', null, null, '大型等边角钢', '边宽≥150mm的普通碳素钢热轧等边角钢　\r\n边宽≥150mm的桥梁用普通碳素、低合金钢热轧等边角钢　\r\n边宽≥150mm的普通低合金钢热轧等边角钢　', null, null, null, '001902252137242AR240', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:37:24', '2019-02-25 21:37:24', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('60', '40', '1', null, null, '小型不等边角钢', '边宽25/16--45/28mm的普通碳素钢热轧不等边角钢\r\n边宽25/16--45/28mm的普通低合金钢热轧不等边角钢', null, null, null, '00190225213758LN4X41', null, '10m*10m*10m', '捆', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:37:59', '2019-02-25 21:37:59', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('61', '40', '1', null, null, '中型不等边角钢', '边宽50/32--149/90mm的普通碳素钢热轧不等边角钢\r\n边宽50/32--149/90mm的桥梁用普通碳素、低合金钢热轧不等边角钢\r\n边宽50/32--149/90mm的普通低合金钢热轧不等边角钢', null, null, null, '0019022521383293NY42', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:38:32', '2019-02-25 21:38:32', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('62', '40', '1', null, null, '大型不等边角钢', '边宽≥150/100mm的普通碳素钢热轧不等边角钢\r\n边宽≥150/100mm的桥梁用普通碳素、低合金钢热轧不等边角钢\r\n边宽≥150/100mm的低合金钢热轧不等边角钢', null, null, null, '00190225213857FKRM43', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:38:57', '2019-02-25 21:38:57', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('63', '41', '1', null, null, '钢板桩', '热轧Q235A 鞍IV型\r\n热轧Q235A 鞍IV型', null, null, null, '00190225213920D6OH44', null, '18mm*18mm*18mm', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:39:21', '2019-02-25 21:39:21', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('64', '42', '1', null, null, '小型螺纹钢', '10mm≤直径≤40mm的普通低合金钢热轧螺纹钢(20MnSiV)Ⅱ级\r\n10mm≤直径≤36mm的普通低合金钢热轧螺纹钢(40Si2MnV)Ⅲ级', null, null, null, '00190225213952JUOS45', null, '18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:39:53', '2019-02-25 21:39:53', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('65', '42', '1', null, null, '调质螺纹钢', '9mm≤直径≤12mm的预应力混凝土用钢筋(热轧45Si2Cr)', null, null, null, '00190225214008KI8K46', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:40:08', '2019-02-25 21:40:08', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('66', '43', '1', null, null, '盘条', '6mm≤直径≤10mm的普通低碳钢热轧园盘条', null, null, null, '00190225214026PSM947', null, '10m*10m*10m', '捆', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:40:26', '2019-02-25 21:40:26', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('67', '20', '1', null, null, '板材', '', null, null, null, '00190225214054UXSP48', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:40:54', '2019-02-25 21:40:54', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('68', '67', '1', null, null, '钢板', '', null, null, null, '00190225214104ZFZW49', null, '18m', '条', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:41:04', '2019-02-25 21:41:04', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('69', '68', '1', null, null, '厚钢板', '厚度＞4mm的普通碳素钢热轧厚钢板\r\n厚度＞4mm的桥梁用碳素钢热轧厚钢板\r\n厚度＞4mm的桥梁用低合金厚钢板\r\n厚度＞4mm的低合金钢厚钢板(热轧09Mn2)\r\n厚度＞4mm的低合金钢厚钢板(热轧16Mn)\r\n厚度＞4mm的花纹钢板', null, null, null, '00190225214143YEOJ50', null, '18mm*18mm*18mm', '块', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:41:44', '2019-02-25 21:41:44', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('70', '68', '1', null, null, '薄钢板', '厚度≤4mm的普通碳素钢热轧薄钢板\r\n厚度≤4mm的普通碳素钢冷轧薄钢板\r\n厚度≤4mm的低合金钢薄钢板\r\n厚度≤4mm的花纹薄钢板\r\n厚度≤4mm的镀锌薄钢板及瓦楞铁皮\r\n厚度≤4mm的镀锡薄钢板', null, null, null, '00190225214212J7HP51', null, '18m*18m', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:42:12', '2019-02-25 21:42:12', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('71', '68', '1', null, null, '优质薄钢板', '厚度≤4mm不锈钢热轧薄钢板\r\n厚度≤4mm不锈钢冷轧薄钢板', null, null, null, '00190225214228Y1MB52', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:42:28', '2019-02-25 21:42:28', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('72', '68', '1', null, null, '电工用硅钢薄板', '厚度≤4mm电工用热轧硅钢薄钢板\r\n厚度≤4mm电工用冷轧硅钢薄钢板', null, null, null, '00190225214249NSRE53', null, '10m*10m*10m', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:42:49', '2019-02-25 21:42:49', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('73', '20', '1', null, null, '优质型材', '', null, null, null, '00190225214327NX6154', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:43:28', '2019-02-25 21:43:43', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('74', '73', '1', null, null, '优质型钢', '', null, null, null, '00190225214359D8JI55', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:43:59', '2019-02-25 21:43:59', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('75', '74', '1', null, null, '碳素结构钢', '碳素结构钢热轧圆钢(热轧20#--45#钢)', null, null, null, '00190225214412UP1X56', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:44:13', '2019-02-25 21:44:13', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('76', '74', '1', null, null, '碳素工具钢', '碳素工具钢热轧圆钢(热轧T8-T10)\r\n碳素工具钢热轧六角钢(热轧T8-T10)、合金工具钢六角钢', null, null, null, '00190225214423DXCY57', null, '18m', '条', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:44:23', '2019-02-25 21:44:23', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('77', '74', '1', null, null, '合金结构钢', '合金结构钢热轧圆钢（铬钢热轧20Cr--45Cr）\r\n合金结构钢热轧圆钢（铬硅钢热轧38CrSi）\r\n合金结构钢热轧圆钢（铬钼钢热轧15CrMo-42CrMo）\r\n合金结构钢热轧圆钢（铬锰硅钢和铬锰钼钢\\热轧20CrMnSi）\r\n合金结构钢热轧圆钢（锰铬钛钢和铬锡钢热轧20CrMnTi）', null, null, null, '00190225214441NM0E58', null, '10cm*10cm*10cm', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:44:41', '2019-02-25 21:44:41', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('78', '74', '1', null, null, '弹簧钢', '弹簧钢热轧圆钢(65Mn或55Si2Mn)\r\n弹簧钢热轧扁钢(65Mn或55Si2Mn)', null, null, null, '00190225214452MKKO59', null, '10m*10m*10m', '捆', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:44:52', '2019-02-25 21:44:52', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('79', '74', '1', null, null, '不锈钢', '不锈耐酸钢圆钢（2Cr13或9Cr18)\r\n耐热钢圆钢(4Cr9Si2)', null, null, null, '00190225214506A3Z160', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:45:06', '2019-02-25 21:45:06', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('80', '74', '1', null, null, '高碳优质钢', '高速工具钢圆钢(W18Cr4V)\r\n碳素工具钢中空六角钢和合金工具钢中空六角钢\r\n易切机构钢圆钢（热轧Y12、Y15、Y40Mn)', null, null, null, '00190225214515QNWL61', null, '18m*18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:45:15', '2019-02-25 21:45:15', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('81', '20', '1', null, null, '管材', '', null, null, null, '00190225214538GPOH62', null, '18mm*18mm*18mm', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:45:39', '2019-02-25 21:45:39', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('82', '81', '1', null, null, '一般无缝钢管', '', null, null, null, '00190225214549EO8U63', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:45:50', '2019-02-25 21:45:50', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('83', '81', '1', null, null, '特殊无缝钢管', '', null, null, null, '00190225214604HXVM64', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:46:04', '2019-02-25 21:46:04', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('84', '81', '1', null, null, '焊接钢管', '', null, null, null, '001902252146174V0M65', null, '10m*10m*10m', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:46:17', '2019-02-25 21:46:17', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('85', '82', '1', null, null, '热轧无逢钢管', '所有一般用热轧无逢钢管', null, null, null, '00190225214636FBMY66', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:46:37', '2019-02-25 21:46:37', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('86', '82', '1', null, null, '冷拔无逢钢管', '所有一般用冷拔无逢钢管', null, null, null, '00190225214645JIL367', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:46:46', '2019-02-25 21:46:46', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('87', '82', '1', null, null, '机车用无逢钢管', '过热管、大烟管、小烟管、拱砖管、干燥管', null, null, null, '00190225214656T9MD68', null, '18mm*18mm*18mm', '块', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:46:56', '2019-02-25 21:46:56', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('88', '83', '1', null, null, '不锈、耐酸管钢', '所有不锈、耐酸钢无缝钢管', null, null, null, '00190225214714UWZD69', null, '18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:47:14', '2019-02-25 21:47:14', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('89', '83', '1', null, null, '波纹钢管', '所有波纹无缝钢管', null, null, null, '00190225214721WIOG70', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:47:22', '2019-02-25 21:47:22', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('90', '84', '1', null, null, '普通焊接钢管', '所有普通焊接钢管和镀锌焊接钢管', null, null, null, '00190225214739SEKI71', null, '10m*10m*10m', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:47:39', '2019-02-25 21:47:39', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('91', '84', '1', null, null, '电线套管', '所有电焊电线套管', null, null, null, '00190225214747ZAQU72', null, '10cm*10cm*10cm', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:47:47', '2019-02-25 21:47:47', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('92', '84', '1', null, null, '螺旋焊缝管', '所有螺旋焊缝钢管', null, null, null, '00190225214754C7RM73', null, '18m', '条', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:47:54', '2019-02-25 21:47:54', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('93', '20', '1', null, null, '金属制品', '', null, null, null, '00190225214814KEVI74', null, '18mm*18mm*18mm', '块', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:48:15', '2019-02-25 21:48:15', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('94', '93', '1', null, null, '钢丝绳', '', null, null, null, '00190225214825QIBX75', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:48:25', '2019-02-25 21:48:25', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('95', '93', '1', null, null, '钢绞线', '', null, null, null, '00190225214831OHJP76', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:48:32', '2019-02-25 21:48:32', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('96', '93', '1', null, null, '钢丝', '', null, null, null, '001902252148394VCH77', null, '10m*10m*10m', '颗', '100', null, '10.8000', null, null, null, null, null, '2019-02-25 21:48:40', '2019-02-25 21:48:40', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('97', '93', '1', null, null, '低碳钢钢丝', '', null, null, null, '00190225214855WSSC78', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:48:56', '2019-02-25 21:48:56', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('98', '94', '1', null, null, '单股钢丝绳', '专指1股7丝的单股钢丝绳即1*7', null, null, null, '00190225214909B4K379', null, '6mm*6mm*6mm', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:49:10', '2019-02-25 21:49:10', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('99', '94', '1', null, null, '多股钢丝绳', '专指6股7丝的多股钢丝绳即6*7\r\n专指6股19丝的多股钢丝绳即6*19\r\n专指6股37丝的多股钢丝绳即6*37', null, null, null, '00190225214917VOJQ80', null, '18mm*18mm*18mm', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:49:18', '2019-02-25 21:49:54', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('100', '95', '1', null, null, '镀锌钢绞线', '所有镀锌钢绞线', null, null, null, '00190225215012LUWL81', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:50:13', '2019-02-25 21:50:13', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('101', '95', '1', null, null, '预应力钢绞线', '所有预应力钢绞线', null, null, null, '00190225215021LUBO82', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:50:21', '2019-02-25 21:50:21', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('102', '96', '1', null, null, '碳素结构钢钢丝', '所有低碳结构钢钢丝和中碳结构钢钢丝', null, null, null, '00190225215034OXSD83', null, '10m*10m*10m', '捆', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:50:35', '2019-02-25 21:50:35', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('103', '96', '1', null, null, '合金结构钢钢丝', '所有合金结构钢钢丝', null, null, null, '00190225215042GG6H84', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:50:43', '2019-02-25 21:50:43', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('104', '96', '1', null, null, '不锈钢丝', '所有不锈钢丝', null, null, null, '00190225215054FYY685', null, '18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:50:54', '2019-02-25 21:50:54', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('105', '96', '1', null, null, '钢纤维', '所有钢纤维', null, null, null, '00190225215105K8L786', null, '18m*18m', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:51:06', '2019-02-25 21:51:06', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('106', '96', '1', null, null, '预应力钢丝', '所有预应力钢丝', null, null, null, '00190225215114GBPY87', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:51:14', '2019-02-25 21:51:14', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('107', '97', '1', null, null, '镀锌低碳钢钢丝', '所有镀锌低碳钢钢丝\r\n所有通讯用镀锌低碳钢钢丝', null, null, null, '00190225215138OTPN88', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:51:38', '2019-02-25 21:51:38', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('108', '97', '1', null, null, '低碳钢钢丝', '所有一般用途低碳钢钢丝', null, null, null, '001902252151491MDA89', null, '10m*10m*10m', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:51:50', '2019-02-25 21:51:50', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('109', '20', '1', null, null, '有色金属及锭块和加工材料', '', null, null, null, '00190225215232Q8NZ90', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:52:33', '2019-02-25 21:52:33', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('110', '109', '1', null, null, '有色金属锭块', '', null, null, null, '00190225215251UL8091', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:52:51', '2019-02-25 21:52:51', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('111', '109', '1', null, null, '铜材', '', null, null, null, '00190225215257GIWD92', null, '18mm*18mm*18mm', '块', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:52:58', '2019-02-25 21:52:58', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('112', '109', '1', null, null, '铝材', '', null, null, null, '00190225215304PM6F93', null, '18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:53:04', '2019-02-25 21:53:04', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('113', '109', '1', null, null, '铅材', '', null, null, null, '00190225215350UMSI94', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:53:50', '2019-02-25 21:53:50', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('114', '109', '1', null, null, '废料', '', null, null, null, '00190225215353PFFF95', null, '10m*10m*10m', '捆', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:53:54', '2019-02-25 21:53:54', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('115', '110', '1', null, null, '有色金属锭块', '精炼铜、重熔用铝、精炼铅锭、锌锭、锡锭、电解镍', null, null, null, '00190225215411CWRJ96', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:54:12', '2019-02-25 21:54:12', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('116', '110', '1', null, null, '有色金属合金', '锡基轴承合金、铅基轴承合金、磷铜合金', null, null, null, '00190225215422R9LX97', null, '18m', '条', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:54:22', '2019-02-25 21:54:22', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('117', '111', '1', null, null, '板材', '紫铜板、黄铜板、锡青铜板、', null, null, null, '00190225215432S1TI98', null, '18mm*18mm*18mm', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:54:33', '2019-02-25 21:54:33', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('118', '111', '1', null, null, '管材', '紫铜管\r\n黄铜管', null, null, null, '00190225215443IDZO99', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:54:44', '2019-02-25 21:54:44', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('119', '111', '1', null, null, '棒材', '紫铜棒、黄铜棒\r\n锡青铜棒', null, null, null, '00190225215458JCOT100', null, '10cm*10cm*10cm', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:54:58', '2019-02-25 21:54:58', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('120', '111', '1', null, null, '带材', '紫铜带、黄铜带', null, null, null, '001902252155070ER4101', null, '10m*10m*10m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:55:08', '2019-02-25 21:55:08', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('121', '111', '1', null, null, '线材', '紫铜线', null, null, null, '00190225215516ZZ7F102', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:55:17', '2019-02-25 21:55:17', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('122', '112', '1', null, null, '板材', '铝板', null, null, null, '00190225215529FI1B103', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:55:30', '2019-02-25 21:55:30', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('123', '112', '1', null, null, '管材', '铝管及铝合金圆管\r\n铝合金方管和矩型管', null, null, null, '00190225215539TAUA104', null, '18mm*18mm*18mm', '块', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:55:39', '2019-02-25 21:55:39', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('124', '112', '1', null, null, '棒材', '铝棒', null, null, null, '001902252155537I91105', null, '18m', '条', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:55:53', '2019-02-25 21:55:53', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('125', '112', '1', null, null, '带材', '铝带及铝箔', null, null, null, '00190225215602IRJR106', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:56:02', '2019-02-25 21:56:02', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('126', '112', '1', null, null, '型材', '铝合金角铝、槽形铝型材、工字型铝型材\r\n建筑用铝型材', null, null, null, '00190225215614XM23107', null, '10m*10m*10m', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:56:15', '2019-02-25 21:56:15', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('127', '113', '1', null, null, '板材', '纯铅板', null, null, null, '001902252156286IKA108', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:56:29', '2019-02-25 21:56:29', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('128', '113', '1', null, null, '管材', '铅管', null, null, null, '00190225215638WPRH109', null, '18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:56:38', '2019-02-25 21:56:38', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('129', '114', '1', null, null, '残废料', '所有有色金属残废料', null, null, null, '00190225215650IDA0110', null, '18mm*18mm*18mm', '块', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:56:50', '2019-02-25 21:56:50', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('130', '20', '1', null, null, '铸铁管及水暖建筑五金', '', null, null, null, '00190225215734CG5D111', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:57:34', '2019-02-25 21:57:34', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('131', '130', '1', null, null, '铸铁管件', '', null, null, null, '00190225215745KIFL112', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:57:46', '2019-02-25 21:57:46', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('132', '130', '1', null, null, '水暖建筑五金', '', null, null, null, '00190225215800EFYB113', null, '10m*10m*10m', '捆', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:58:01', '2019-02-25 21:58:01', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('133', '131', '1', null, null, '铸铁单盘直管', '各种规格铸铁铸铁单盘直管', null, null, null, '00190225215838RDB9114', null, '10cm*10cm*10cm', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:58:39', '2019-02-25 21:58:39', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('134', '131', '1', null, null, '铸铁双盘直管', '各种规格铸铁铸铁双盘直管', null, null, null, '0019022521584533YQ115', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:58:46', '2019-02-25 21:58:46', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('135', '131', '1', null, null, '梯纯型柔性接口铸铁直管', '各种规格梯纯型柔性接口铸铁直管和橡胶圈', null, null, null, '00190225215904QG0O116', null, '18m*18m', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:59:04', '2019-02-25 21:59:04', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('136', '131', '1', null, null, '铸铁井壁管', '各种规格铸铁井壁管', null, null, null, '00190225215912CABQ117', null, '18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:59:13', '2019-02-25 21:59:13', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('137', '131', '1', null, null, '铸铁十字管', '各种规格铸铁十字管(含四盘、三承、四承、三盘）', null, null, null, '00190225215919IKNZ118', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:59:20', '2019-02-25 21:59:20', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('138', '131', '1', null, null, '铸铁丁字管', '\"各种规格铸铁丁字管和铸铁异径丁字管\r\n（含双承、三承、三盘、单盘双承、双盘）\"', null, null, null, '00190225215930PSUE119', null, '10m*10m*10m', '捆', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:59:30', '2019-02-25 21:59:30', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('139', '131', '1', null, null, '铸铁曲管', '\"各种规格铸铁曲管\r\n（含90度和45度的双承、承插、双盘）\"', null, null, null, '00190225215939LWIG120', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:59:39', '2019-02-25 21:59:39', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('140', '131', '1', null, null, '铸铁套管', '各种规格铸铁套管', null, null, null, '00190225215947E1JL121', null, '18m*18m', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:59:47', '2019-02-25 21:59:47', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('141', '131', '1', null, null, '铸铁短管', '各种规格铸铁插盘短管、铸铁承盘短管、铸铁乙字管', null, null, null, '00190225215954BX3D122', null, '18mm*18mm*18mm', '块', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 21:59:55', '2019-02-25 21:59:55', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('142', '131', '1', null, null, '排水铸铁管件', '\"各种规格排水铸铁直管、排水铸铁三通、\r\n排水铸铁异径三通、排水铸铁异径四通（含T型和Y型）、排水铸铁四通、排水铸铁曲管、排水铸铁套管、排水铸铁异径套管、排水铸铁乙字管、铸铁扫除管、铸铁存水弯、铸铁排水箅子、铸铁井口、铸铁井盖、铸铁栏杆、铸铁地漏等\"', null, null, null, '00190225220002J4QW123', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:00:03', '2019-02-25 22:00:03', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('143', '131', '1', null, null, '水鹤', '各种规格水鹤', null, null, null, '001902252200093G8G124', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:00:10', '2019-02-25 22:00:10', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('144', '131', '1', null, null, '水鹤零件', '各种规格水鹤零件', null, null, null, '00190225220016DFSC125', null, '10m*10m*10m', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:00:17', '2019-02-25 22:00:17', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('145', '132', '1', null, null, '可锻铸铁外接头', '\"各种规格可锻铸铁外接头（含镀锌）、可锻铸\r\n铁异径外接头（含镀锌）、钢制外接头等\"', null, null, null, '001902252200541JZ1126', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:00:54', '2019-02-25 22:00:54', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('146', '132', '1', null, null, '可锻铸铁三通', '\"各种规格可锻铸铁三通（含镀锌）、钢制三通\r\n可锻铸铁中小三通（含镀锌）、可锻铸铁中大三通（含镀锌）等\"', null, null, null, '00190225220102IWRO127', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:01:02', '2019-02-25 22:01:02', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('147', '132', '1', null, null, '可锻铸铁四通', '各种规格可锻铸铁四通（含镀锌）等', null, null, null, '00190225220110NT1T128', null, '18mm*18mm*18mm', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:01:10', '2019-02-25 22:01:10', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('148', '132', '1', null, null, '可锻铸铁弯头', '\"各种规格可锻铸铁弯头（含镀锌）、压制弯头\r\n可锻铸铁异径弯头（含镀锌）等\"', null, null, null, '00190225220119UTTC129', null, '18m', '条', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:01:19', '2019-02-25 22:01:19', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('149', '132', '1', null, null, '可锻铸铁活接头内头、锁紧螺帽', '各种规格可锻铸铁活接头内头、锁紧螺帽等', null, null, null, '00190225220131LJZX130', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:01:32', '2019-02-25 22:01:32', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('150', '132', '1', null, null, '可锻铸铁丝堵、管帽', '各种规格可锻铸铁丝堵、管帽等', null, null, null, '001902252201392W2S131', null, '10m*10m*10m', '捆', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:01:39', '2019-02-25 22:01:39', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('151', '132', '1', null, null, '可锻铸内外螺丝', '各种规格可锻铸内外螺丝（含镀锌）等', null, null, null, '00190225220147DMU0132', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:01:47', '2019-02-25 22:01:47', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('152', '132', '1', null, null, 'PVC塑料排水管件', '各种规格PVC塑料排水管件', null, null, null, '00190225220201HA2N133', null, '18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:02:01', '2019-02-25 22:02:01', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('153', '132', '1', null, null, '法兰盘', '各种规格型号法兰盘、伸缩器等', null, null, null, '00190225220208FJJH134', null, '18mm*18mm*18mm', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:02:09', '2019-02-25 22:02:09', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('154', '132', '1', null, null, '水嘴', '各种规格型号材质的冷水嘴、热水嘴等', null, null, null, '001902252202163NBD135', null, '6mm*6mm*6mm', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:02:16', '2019-02-25 22:02:16', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('155', '132', '1', null, null, '暖气片散热器', '各种规格型号材质的暖气片和散热器等', null, null, null, '00190225220226PIFA136', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:02:26', '2019-02-25 22:02:26', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('156', '132', '1', null, null, '暖气片零件', '各种规格型号的暖气片零件', null, null, null, '00190225220234KLVB137', null, '10m*10m*10m', '捆', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:02:35', '2019-02-25 22:02:35', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('157', '132', '1', null, null, '木螺丝', '各种规格沉头木螺丝', null, null, null, '00190225220243TIFT138', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:02:44', '2019-02-25 22:02:44', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('158', '132', '1', null, null, '圆钢钉', '各种规格圆钢钉、把锯钉、秋皮钉、大帽钉及其他钉钩等', null, null, null, '00190225220252LWWZ139', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:02:53', '2019-02-25 22:02:53', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('159', '132', '1', null, null, '建筑机构零件', '如：合页、拉手、把手、插销、角铁片、挂锁等', null, null, null, '00190225220300VDOE140', null, '18mm*18mm*18mm', '块', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:03:00', '2019-02-25 22:03:00', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('160', '132', '1', null, null, '卫生设备零件', '各种规格卫生设备零件等', null, null, null, '00190225220309LECG141', null, '18m*18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:03:10', '2019-02-25 22:03:10', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('161', '132', '1', null, null, '金属网、纱', '各种规格金属网、纱、镀锌刺铁丝、钢板网等', null, null, null, '00190225220317JBZM142', null, '10cm*10cm*10cm', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:03:18', '2019-02-25 22:03:18', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('162', '132', '1', null, null, '链条及绳索零件', '如：钢丝绳卡环、轧头、卡板等', null, null, null, '00190225220325JH8T143', null, '10m*10m*10m', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:03:25', '2019-02-25 22:03:25', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('163', '132', '1', null, null, '金属门、窗', '各种规格钢门、钢窗、钢框等\r\n各种铝合金门、窗等', null, null, null, '00190225220333TFAW144', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:03:34', '2019-02-25 22:03:34', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('164', '132', '1', null, null, '其他', '各种铁栏杆、铁百页、角铁横挡、钢龙骨、钢骨架等', null, null, null, '00190225220340FSLO145', null, '18m', '条', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:03:41', '2019-02-25 22:03:41', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('165', '22', '1', null, null, '钢轨及连接件', '', null, null, null, '001902252204240WJP146', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:04:24', '2019-02-25 22:04:24', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('166', '22', '1', null, null, '轨枕及扣件', '', null, null, null, '00190225220447KCLR147', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:04:47', '2019-02-25 22:04:47', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('167', '22', '1', null, null, '桥梁及配件', '', null, null, null, '00190225220502KYCB148', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:05:02', '2019-02-25 22:05:02', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('168', '23', '1', null, null, '料具设备', '', null, null, null, '00190225220530YJIW149', null, '10m*10m*10m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:05:31', '2019-02-25 22:05:31', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('169', '165', '1', null, null, '重轨', '\"指大于24kg 的各种材质的重轨（如：38kg、43kg、\r\n50kg、60kg、75kg）和异型钢轨及起重机用重轨\"', null, null, null, '00190225220547SCRL150', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:05:48', '2019-02-25 22:05:48', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('170', '165', '1', null, null, '接头连接件', '指鱼尾板、鱼尾螺栓（带帽）、单层弹簧垫圈等', null, null, null, '00190225220601REGZ151', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:06:02', '2019-02-25 22:06:02', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('171', '165', '1', null, null, '中间连接件及其配件', '\"指铁垫板、普通道钉、防爬器、轨距杆、防爬支撑、护\r\n轨铸铁梭头、异型鱼尾板、异型铁垫板、桥面用钢轨伸缩调节器等\"\r\n普通用钢轨伸缩调节器等', null, null, null, '001902252206218ISU152', null, '18mm*18mm*18mm', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:06:21', '2019-02-25 22:06:21', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('172', '165', '1', null, null, '道岔', '\"各种规格型号和材质的单开道、岔提速道岔、三开道岔\r\n、对称道岔、交分道岔、交叉渡线道岔、组合道岔等\"', null, null, null, '00190225220635PBL9153', null, '18m', '条', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:06:35', '2019-02-25 22:06:35', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('173', '165', '1', null, null, '道岔配件', '指撤轨、道轨、撤叉、扳道器、脱鞋器等', null, null, null, '00190225220647OLZQ154', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:06:47', '2019-02-25 22:06:47', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('174', '166', '1', null, null, '注油普通枕木', '指标准轨Ⅰ类和Ⅱ类型注油普通枕木、注油木短枕', null, null, null, '00190225220711YNOW155', null, '10m*10m*10m', '捆', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:07:11', '2019-02-25 22:07:11', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('175', '166', '1', null, null, '注油道岔枕木', '指标准轨用注油道岔枕木和注油氯道岔枕木', null, null, null, '00190225220721CVMA156', null, '18m*18m', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:07:21', '2019-02-25 22:07:21', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('176', '166', '1', null, null, '注油桥梁枕木', '指标准轨用注油桥梁枕木和注油氯桥梁枕木', null, null, null, '00190225220729QR4W157', null, '18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:07:30', '2019-02-25 22:07:30', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('177', '166', '1', null, null, '钢筋混凝土轨枕', '指各种预应力钢筋混凝土轨枕、枕板、桥枕、岔枕等', null, null, null, '00190225220750Z2AA158', null, '18mm*18mm*18mm', '块', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:07:50', '2019-02-25 22:08:14', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('178', '166', '1', null, null, '弹条Ⅰ型扣件', '指各规格弹条、轨距挡板、尼龙挡板座、平垫圈等', null, null, null, '00190225220823ZUZ3159', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:08:24', '2019-02-25 22:08:24', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('179', '166', '1', null, null, '70型板式扣件', '指铁座、中间扣板、接头扣板、螺纹道钉、双层弹簧垫圈等', null, null, null, '00190225220831JLM1160', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:08:31', '2019-02-25 22:08:31', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('180', '166', '1', null, null, '垫板、垫片、衬垫', '指各规格橡胶和塑料垫板、垫片、衬垫等', null, null, null, '00190225220839EXY1161', null, '10m*10m*10m', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:08:39', '2019-02-25 22:08:39', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('181', '167', '1', null, null, '钢梁', '指钢板梁、拆装梁、接合梁、焊接板梁、军用梁等', null, null, null, '00190225220854YMUE162', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:08:54', '2019-02-25 22:08:54', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('182', '167', '1', null, null, '钢梁螺栓', '指各规格钢梁用高强度螺栓带帽和高强度垫圈等', null, null, null, '00190225220901SCRP163', null, '6mm*6mm*6mm', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:09:01', '2019-02-25 22:09:01', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('183', '167', '1', null, null, '钢梁支坐', '指钢板梁支坐、接合梁支坐、拆装梁支坐等', null, null, null, '00190225220917NGLC164', null, '18mm*18mm*18mm', '块', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:09:17', '2019-02-25 22:09:17', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('184', '167', '1', null, null, '钢筋混凝土桥梁', '各规格型号预应力钢筋混凝土桥梁、钢筋混凝土桥梁等', null, null, null, '00190225220925Q3DG165', null, '18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:09:26', '2019-02-25 22:09:26', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('185', '167', '1', null, null, '钢筋混凝土桥梁用支座', '\"\r\n指钢筋混凝土铸钢支座、板式橡胶支座、平板支座、公路盆式橡胶支座、铁路盆式橡胶支座等\r\n\"', null, null, null, '00190225220935BUZK166', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:09:35', '2019-02-25 22:09:35', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('187', '168', '1', null, null, '轻轨', '指小于24kg 的各种轻轨', null, null, null, '00190225221023BZ5Y168', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:10:24', '2019-02-25 22:10:24', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('188', '168', '1', null, null, '轻轨及连接件', '指轻轨用鱼尾板、鱼尾板螺栓、弹簧垫圈等\r\n指轻轨用道钉', null, null, null, '00190225221032UV1J169', null, '18m', '条', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:10:32', '2019-02-25 22:10:32', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('189', '168', '1', null, null, '油罐', '指2立方米以上的油罐、油箱及辅助设备', null, null, null, '001902252210394LSF170', null, '18mm*18mm*18mm', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:10:40', '2019-02-25 22:10:40', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('190', '168', '1', null, null, '隧道通风管', '指隧道用铁皮通风管、玻璃纤维导风筒等', null, null, null, '00190225221046YAF2171', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:10:47', '2019-02-25 22:10:47', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('191', '168', '1', null, null, '活动房屋', '指801型、82-3型、82-2型活动房屋', null, null, null, '00190225221053EQVT172', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:10:54', '2019-02-25 22:10:54', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('192', '168', '1', null, null, '钢拱架及钢模板脚手架及扣件', '指48mm钢管及48mm钢管用扣件、隧道钢拱架、隧道拱部钢模板、隧道直边墙钢模板、隧道曲边墙钢模板、特殊钢模板、定型钢模板、钢支撑、万能杆件和各种平面钢模板、阴角模板、阳角模板、双曲可调模板、及模板配件等', null, null, null, '001902252211127BK6173', null, '10m*10m*10m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:11:12', '2019-02-25 22:11:12', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('193', '168', '1', null, null, '小矿车', '指翻斗式矿车、侧卸式矿车、梭式矿车、平板车等', null, null, null, '00190225221120ZNG7174', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:11:21', '2019-02-25 22:11:21', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('194', '21', '1', null, null, '木材', '', null, null, null, '00190225221140JO3H175', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:11:41', '2019-02-25 22:11:41', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('195', '21', '1', null, null, '水泥', '', null, null, null, '00190225221146BLND176', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:11:46', '2019-02-25 22:11:46', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('196', '21', '1', null, null, '玻璃', '', null, null, null, '00190225221151IXEC177', null, '18m', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:11:51', '2019-02-25 22:11:51', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('197', '21', '1', null, null, '石棉和制品', '', null, null, null, '00190225221207IOJW178', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:12:07', '2019-02-25 22:12:07', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('198', '21', '1', null, null, '其他非金属建筑材料', '', null, null, null, '00190225221223BC6S179', null, '10m*10m*10m', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:12:23', '2019-02-25 22:12:23', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('199', '21', '1', null, null, '混泥土制品', '', null, null, null, '00190225221242HQRE180', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:12:43', '2019-02-25 22:12:43', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('200', '21', '1', null, null, '耐火材料', '', null, null, null, '00190225221301F6MO181', null, '18m*18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:13:02', '2019-02-25 22:13:14', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('201', '21', '1', null, null, '燃料及油脂', '', null, null, null, '001902252213311QZY182', null, '18mm*18mm*18mm', '块', '10', null, '150.0000', null, null, null, null, null, '2019-02-25 22:13:32', '2019-02-25 22:13:32', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('202', '21', '1', null, null, '化工原料及化学试剂', '', null, null, null, '00190225221352T8JN183', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:13:52', '2019-02-25 22:13:52', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('203', '21', '1', null, null, '橡胶及制品', '', null, null, null, '00190225221408LNVB184', null, '10cm*10cm*10cm', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:14:08', '2019-02-25 22:14:08', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('204', '21', '1', null, null, '塑料、有机玻璃型材及塑料制品', '', null, null, null, '0019022522143836XO185', null, '10m*10m*10m', '捆', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:14:38', '2019-02-25 22:14:38', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('205', '21', '1', null, null, '纤维材料及纺织品绳索', '', null, null, null, '00190225221500QHWR186', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:15:00', '2019-02-25 22:15:00', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('206', '21', '1', null, null, '劳保用品', '', null, null, null, '00190225221510DOPD187', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:15:10', '2019-02-25 22:15:10', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('207', '21', '1', null, null, '杂备品', '', null, null, null, '00190225221523GBZD188', null, '18mm*18mm*18mm', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:15:24', '2019-02-25 22:15:24', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('208', '194', '1', null, null, '原木', '', null, null, null, '00190225221614PD2O189', null, '18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:16:14', '2019-02-25 22:16:14', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('209', '194', '1', null, null, '锯材', '', null, null, null, '00190225221625KZIX190', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:16:25', '2019-02-25 22:16:25', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('210', '194', '1', null, null, '副产品及专用材', '灰板条\r\n门窗料、木地板、架板、垫木', null, null, null, '00190225221639VHNN191', null, '10m*10m*10m', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:16:39', '2019-02-25 22:18:25', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('211', '194', '1', null, null, '枕木', '标准轨枕木', null, null, null, '00190225221704IEGR192', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:17:04', '2019-02-25 22:17:26', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('212', '194', '1', null, null, '其他木材', '', null, null, null, '00190225221714MF1S193', null, '18m', '条', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:17:15', '2019-02-25 22:17:15', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('213', '208', '1', null, null, '直接用原木', '松原木、杉原木、硬杂原木\r\n填塞木', null, null, null, '00190225221741Z1MZ194', null, '18mm*18mm*18mm', '块', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:17:42', '2019-02-25 22:17:42', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('214', '208', '1', null, null, '加工用原木', '防腐木电杆\r\n普通桩木、防腐帮桩、防腐圆木\r\n杉原条、松原条、', null, null, null, '00190225221754N8TU195', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:17:54', '2019-02-25 22:17:54', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('215', '209', '1', null, null, '板材', '松薄板、松中板、松厚板、杉薄板、杉中板、杉厚板', null, null, null, '001902252218057PS6196', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:18:06', '2019-02-25 22:18:06', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('216', '209', '1', null, null, '枋木', '（松、杉、硬杂）小枋木、中枋木、大（特）枋木', null, null, null, '001902252218139AGZ197', null, '10m*10m*10m', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:18:13', '2019-02-25 22:18:13', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('217', '212', '1', null, null, '加工板', '普通胶合板、刨花板、木丝板、细木工板', null, null, null, '00190225221835MGMO198', null, '10cm*10cm*10cm', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:18:36', '2019-02-25 22:18:36', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('218', '212', '1', null, null, '纤维板', '硬质纤维板、中密度纤维板', null, null, null, '00190225221843JHXZ199', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:18:44', '2019-02-25 22:18:44', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('219', '212', '1', null, null, '吸音板', '吸音板', null, null, null, '00190225221851EKCR200', null, '18mm*18mm*18mm', '块', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:18:52', '2019-02-25 22:18:52', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('220', '195', '1', null, null, '普通水泥', '硅酸盐水泥、（普通、矿渣、火山灰）硅酸盐水泥复合硅酸盐水泥', null, null, null, '00190225221913FX61201', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:19:14', '2019-02-25 22:19:14', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('221', '195', '1', null, null, '特种水泥', '抗硫酸水泥、快硬硅酸盐水泥、白色水泥、膨胀水泥、双快水泥', null, null, null, '001902252219226QJK202', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:19:23', '2019-02-25 22:19:23', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('222', '196', '1', null, null, '普通玻璃', '', null, null, null, '00190225221935V2SE203', null, '10m*10m*10m', '捆', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:19:35', '2019-02-25 22:19:35', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('223', '196', '1', null, null, '玻璃制品', '', null, null, null, '00190225221944KKPM204', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:19:45', '2019-02-25 22:19:45', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('224', '222', '1', null, null, '平板玻璃', '普通平板玻璃、茶色玻璃、兰色玻璃、磨砂玻璃、双层中空玻璃', null, null, null, '00190225222001MB6U205', null, '18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:20:01', '2019-02-25 22:20:01', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('225', '222', '1', null, null, '压延玻璃', '压花玻璃', null, null, null, '00190225222009VJ6E206', null, '18m*18m', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:20:09', '2019-02-25 22:20:09', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('226', '222', '1', null, null, '工业技术玻璃', '平型钢化玻璃、玻璃钢槽板', null, null, null, '00190225222016VJ2U207', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:20:17', '2019-02-25 22:20:17', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('227', '223', '1', null, null, '灯具玻璃', '手提信号灯玻璃', null, null, null, '0019022522202822JR208', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:20:28', '2019-02-25 22:20:28', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('228', '223', '1', null, null, '液面计玻璃', '水表玻璃', null, null, null, '00190225222035EJQB209', null, '10m*10m*10m', '捆', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:20:36', '2019-02-25 22:20:36', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('229', '223', '1', null, null, '玻璃管、镜', '玻璃管、玻璃垫、玻璃砖、玻璃镜、磨光玻璃镜', null, null, null, '00190225222046BAWO210', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:20:46', '2019-02-25 22:20:46', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('230', '223', '1', null, null, '玻璃纤维制品', '玻璃纤维布、玻璃布、玻璃棉毡、玻璃丝、玻璃钢（瓦、板）', null, null, null, '00190225222054UATN211', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:20:54', '2019-02-25 22:20:54', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('231', '197', '1', null, null, '石棉及石棉泥', '石棉绒、石棉、石棉灰、普通石棉泥', null, null, null, '00190225222138VDVP212', null, '18mm*18mm*18mm', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:21:38', '2019-02-25 22:21:38', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('232', '197', '1', null, null, '石棉布、带', '普通石棉布、石棉绝缘带、石棉织带', null, null, null, '00190225222147IN3N213', null, '18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:21:48', '2019-02-25 22:21:48', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('233', '197', '1', null, null, '石棉线、绳', '\"石棉线、油浸石棉线、石棉扭绳、石棉园绳、石棉方绳、\r\n石棉松绳\"', null, null, null, '00190225222156XGKX214', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:21:57', '2019-02-25 22:21:57', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('234', '197', '1', null, null, '石棉盘根', '\"油浸石棉盘根、橡胶石棉盘根、橡胶石棉铜丝盘根\r\n橡胶盘根、牛油盘根\"', null, null, null, '00190225222205E0IO215', null, '10m*10m*10m', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:22:05', '2019-02-25 22:22:05', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('235', '197', '1', null, null, '石棉纸板', '绝热石棉纸、保温石棉板、', null, null, null, '001902252222127FXQ216', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:22:12', '2019-02-25 22:22:12', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('236', '197', '1', null, null, '石棉橡胶纸板', '（高、中、低）压橡胶石棉板', null, null, null, '00190225222220AU5T217', null, '18m', '条', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:22:21', '2019-02-25 22:22:21', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('237', '197', '1', null, null, '石棉水泥瓦', '各种石棉水泥瓦', null, null, null, '00190225222227XI6N218', null, '18mm*18mm*18mm', '块', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:22:28', '2019-02-25 22:22:28', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('238', '197', '1', null, null, '石棉水泥压力管', '石棉水泥输水管及管件', null, null, null, '00190225222235SG8W219', null, '6mm*6mm*6mm', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:22:36', '2019-02-25 22:22:36', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('239', '197', '1', null, null, '石棉水泥电气绝缘板、垫', '各种石棉水泥压力板急衬垫', null, null, null, '00190225222249JBVG220', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:22:50', '2019-02-25 22:22:50', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('240', '198', '1', null, null, '胶凝材料', '', null, null, null, '00190225222412CX10221', null, '10m*10m*10m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:24:12', '2019-02-25 22:24:12', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('241', '198', '1', null, null, '石材', '\"各种天然山石、河石、加工石材、人工合成石材等。如：块石、片石、碎石、鹅卵石、花岗石、大理石、\r\n毛石、人造大理石、水磨石、石膏板、石膏复合板等\r\n\"', null, null, null, '00190225222421IKLM222', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:24:22', '2019-02-25 22:25:08', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('242', '240', '1', null, null, '无机胶凝材料', '\"石膏、石灰、粘土、膨润土、大白粉、外内墙涂料、\r\nJH801涂料、JH802涂料、777型涂料、彩砂涂料、106--108胶水、白乳胶、粉煤灰、砂胶料、石灰渣等无机材料\"', null, null, null, '00190225222440JF4X223', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:24:41', '2019-02-25 22:24:41', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('243', '240', '1', null, null, '有机胶凝材料', '\"各种石油沥青和乳化沥青、木材防腐油、各种骨胶、\r\n牛皮胶、生胶、漆片胶、熟胶等和各种合成脂胶粘剂等\"', null, null, null, '001902252224564VGW224', null, '18mm*18mm*18mm', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:24:56', '2019-02-25 22:24:56', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('244', '198', '1', null, null, '砂子', '\"\r\n各种河砂、山砂、海砂、人造砂、合成砂、标准砂、\r\n砂砾等\r\n\"', null, null, null, '00190225222540DNPD225', null, '18m', '条', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:25:40', '2019-02-25 22:25:40', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('245', '198', '1', null, null, '砖', '各种机青砖、机红砖、粘土砖、空心砖、砌块砖、页岩砖、混凝土砌块和各种陶质砖、瓷质砖等', null, null, null, '00190225222549QNOE226', null, '18m*18m', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:25:49', '2019-02-25 22:25:49', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('246', '198', '1', null, null, '建筑用卫生陶瓷', '各种建筑用卫生陶瓷及陶土管接头零件', null, null, null, '001902252226031LNL227', null, '10m*10m*10m', '捆', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:26:04', '2019-02-25 22:26:04', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('247', '198', '1', null, null, '防水隔热材料', '各种防水材料、防水涂料、隔热材料等', null, null, null, '00190225222616HMKL228', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:26:17', '2019-02-25 22:26:17', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('248', '198', '1', null, null, '竹材', '各种竹材、席材、草料、麻及其制品', null, null, null, '00190225222627MITY229', null, '18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:26:28', '2019-02-25 22:26:28', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('249', '199', '1', null, null, '混凝土管', '各种混凝土管、钢筋混凝土管、预应力和自应力钢筋混凝土管等', null, null, null, '00190225222647PJF3230', null, '18mm*18mm*18mm', '块', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:26:48', '2019-02-25 22:26:48', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('250', '199', '1', null, null, '混凝土管板\\块', '各种混凝土屋面板、隔热板、砼板、钢筋混凝土门形架等', null, null, null, '00190225222657ZDCF231', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:26:58', '2019-02-25 22:26:58', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('251', '199', '1', null, null, '混凝土管桩', '各种钢筋混凝土管桩、板桩、方柱、管桩接头', null, null, null, '00190225222705HDCW232', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:27:05', '2019-02-25 22:27:05', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('252', '199', '1', null, null, '电杆及机柱', '各种钢筋混凝土电杆、预应力钢筋混凝土电杆等', null, null, null, '00190225222714DEMI233', null, '10m*10m*10m', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:27:14', '2019-02-25 22:27:14', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('253', '199', '1', null, null, '混凝土电缆线槽及其他', '各种混凝土电缆线槽、混凝土构件和其他混凝土制品等', null, null, null, '00190225222727QDW4234', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:27:27', '2019-02-25 22:27:27', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('254', '200', '1', null, null, '耐火砖、 耐火块', '各种（直形、标准、一般）粘土耐火砖、粘土质耐火砖等\r\n各种高铝砖\r\n各种硅砖\r\n各种镁砖\r\n各种耐火预制块', null, null, null, '00190225222753V1DY235', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:27:54', '2019-02-25 22:27:54', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('255', '200', '1', null, null, '耐火泥、耐火制品原料', '', null, null, null, '00190225222803G08W236', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:28:04', '2019-02-25 22:28:04', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('256', '255', '1', null, null, '耐火泥', '各种耐火泥、耐火土', null, null, null, '00190225222813AQIS237', null, '18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:28:14', '2019-02-25 22:28:14', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('257', '255', '1', null, null, '耐火制品原料', '耐火土、硅酸铝耐火纤维原棉、瓷粉', null, null, null, '00190225222821HHAK238', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:28:22', '2019-02-25 22:28:22', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('258', '200', '1', null, null, '石墨制品、电极', '石墨电极、铝合金电极、石墨碳心、石墨润滑剂', null, null, null, '00190225222834WIJP239', null, '10m*10m*10m', '捆', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:28:34', '2019-02-25 22:28:34', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('259', '201', '1', null, null, '焦碳、煤、木碳', '各种焦碳、煤、木碳和废枕木', null, null, null, '00190225222849B25T240', null, '10cm*10cm*10cm', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:28:50', '2019-02-25 22:28:50', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('260', '201', '1', null, null, '汽油类', '各种航空汽油、汽油、车用汽油、无铅汽油', null, null, null, '00190225222856XBSV241', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:28:57', '2019-02-25 22:28:57', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('261', '201', '1', null, null, '柴油类', '各种轻柴油（0#、10#、-10#、-20#）', null, null, null, '00190225222905GPIZ242', null, '18mm*18mm*18mm', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:29:06', '2019-02-25 22:29:06', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('262', '201', '1', null, null, '煤油类', '各种煤油（合格品、一级品、优级品）', null, null, null, '00190225222920FNZP243', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:29:20', '2019-02-25 22:29:20', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('263', '201', '1', null, null, '润滑油', '', null, null, null, '00190225222930UNJQ244', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:29:31', '2019-02-25 22:29:31', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('264', '263', '1', null, null, '专用润滑油', '各种汽缸油、车轴油、汽轮机油、压缩机油、冷冻机油', null, null, null, '00190225222943HNAW245', null, '10m*10m*10m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:29:43', '2019-02-25 22:29:43', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('265', '263', '1', null, null, '普通润滑油', '各种机械油、齿轮油等\r\n各种汽机油、柴机油、汽柴油机油等', null, null, null, '00190225222952F0Z8246', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:29:53', '2019-02-25 22:29:53', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('266', '263', '1', null, null, '精密机床油及液压油', '各种导轴油、液压轨道油、液压油、轴承油、合成制动液等', null, null, null, '00190225223006IDPZ247', null, '6mm*6mm*6mm', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:30:06', '2019-02-25 22:30:06', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('267', '263', '1', null, null, '电器用油', '各种变压器油、电缆油、铅缆油', null, null, null, '00190225223014CIJW248', null, '18mm*18mm*18mm', '块', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:30:15', '2019-02-25 22:30:15', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('268', '263', '1', null, null, '泵油及其他润滑油', '各种真空泵油、缝纽机油、钟表油等', null, null, null, '00190225223027CFSR249', null, '18m', '条', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:30:27', '2019-02-25 22:30:27', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('269', '263', '1', null, null, '溶剂油及工艺油', '\"各种溶剂油、防锈油、防绣剂、桐油、蓖麻油\r\n花生油、软麻油、菜籽油、皮带油、抛光油等\"', null, null, null, '00190225223039PTMX250', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:30:40', '2019-02-25 22:30:40', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('270', '201', '1', null, null, '润滑脂', '\"各种润滑脂、钢丝绳表面脂、防锈脂\r\n工业凡士林等\"', null, null, null, '001902252230570TVV251', null, '10m*10m*10m', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:30:58', '2019-02-25 22:30:58', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('271', '201', '1', null, null, '石料腊及制品', '各种白石蜡、黄蜡、提纯地蜡、地板蜡、硬白蜡、上光蜡、砂蜡、黄蜡合剂、白蜡松香合剂等', null, null, null, '00190225223104V4SO252', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:31:05', '2019-02-25 22:31:05', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('272', '201', '1', null, null, '节能添加剂', '各种柴油添加剂、汽油添加剂、煤油添加剂等', null, null, null, '00190225223109XYYO253', null, '18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:31:09', '2019-02-25 22:31:22', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('273', '201', '1', null, null, '防冻剂', '指各种规格和型号的防冻剂', null, null, null, '00190225223132ZF4K254', null, '18mm*18mm*18mm', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:31:32', '2019-02-25 22:31:32', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('274', '202', '1', null, null, '化工产品', '', null, null, null, '00190225223204EITA255', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:32:04', '2019-02-25 22:32:04', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('275', '202', '1', null, null, '涂料', '', null, null, null, '00190225223211JQGL256', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:32:12', '2019-02-25 22:32:12', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('276', '202', '1', null, null, '颜料', '', null, null, null, '00190225223228DCF0257', null, '10m*10m*10m', '捆', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:32:29', '2019-02-25 22:32:29', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('277', '202', '1', null, null, '爆破器材', '', null, null, null, '00190225223236TUAE258', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:32:37', '2019-02-25 22:32:37', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('278', '274', '1', null, null, '工业用无机酸', '硫酸、盐酸、硝酸、磷酸、稳定剂、消泡剂等', null, null, null, '00190225223255RXQ3259', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:32:55', '2019-02-25 22:32:55', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('279', '274', '1', null, null, '工业用碱', '烧碱、纯碱、硫化碱、氢氧化钾、硫酸氢钠等', null, null, null, '00190225223304DIJZ260', null, '18mm*18mm*18mm', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:33:04', '2019-02-25 22:33:04', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('280', '274', '1', null, null, '无机盐', '各种无机盐、无机氧化剂和其他无机原料等', null, null, null, '001902252233112VLE261', null, '18m*18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:33:12', '2019-02-25 22:33:12', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('281', '274', '1', null, null, '压缩及液化气体', '氧气、乙炔、氩气、氮气、氟里昂等', null, null, null, '001902252233240CUL262', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:33:24', '2019-02-25 22:33:24', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('282', '274', '1', null, null, '工业有机酸、酐', '草酸、乙酸、硬脂酸', null, null, null, '00190225223332A1FY263', null, '10m*10m*10m', '捆', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:33:32', '2019-02-25 22:33:32', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('283', '274', '1', null, null, '烃卤类有机原料', '\"二氯乙烷、电石、四氯甲烷、粗苯、纯苯、甲苯、乙苯\r\n二甲苯、动力苯、乳化剂、砷铜合剂、氯丹原油等\"', null, null, null, '001902252233394EEY264', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:33:40', '2019-02-25 22:33:40', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('284', '274', '1', null, null, '羟类有机原料', '辛醇、甲醇、苯醇、正丁醇、丙三醇、乙醇等', null, null, null, '00190225223355KQYD265', null, '18m', '条', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:33:56', '2019-02-25 22:33:56', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('285', '274', '1', null, null, '胺基类及其他化工原料', '\"乙丙酰胺、乙二胺、松香、耸节油、木质素磺酸钙、\r\n减水剂、膨胀剂、蒸馏水等\"', null, null, null, '00190225223432LCGG266', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:34:33', '2019-02-25 22:34:33', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('286', '274', '1', null, null, '橡胶及塑料助剂', '邻苯二甲酸二丁酯', null, null, null, '001902252234450H4W267', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:34:45', '2019-02-25 22:34:45', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('287', '274', '1', null, null, '无机试剂', '氯化钴、氢氧化锂、一氧化铅、过氯化环乙铜糊液、苯磺酰胺、环烧酸钴苯乙稀溶液体等', null, null, null, '00190225223452BGDH268', null, '10cm*10cm*10cm', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:34:52', '2019-02-25 22:34:52', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('288', '274', '1', null, null, '有机试剂', '无水乙醇、无水丁醇、四氯化碳、水溶性聚氨酯等', null, null, null, '00190225223501FKOE269', null, '10m*10m*10m', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:35:02', '2019-02-25 22:35:02', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('289', '274', '1', null, null, '试纸、滤纸', '滤纸、增感纸', null, null, null, '00190225223509UEPC270', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:35:10', '2019-02-25 22:35:10', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('290', '275', '1', null, null, '清油和清漆', '各种清油、各种清漆、干柒片、生柒、樟丹油、黑铅油等', null, null, null, '001902252235238MU6271', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:35:23', '2019-02-25 22:35:23', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('291', '275', '1', null, null, '厚漆及调合柒', '各种厚柒、各种调合柒、油性调合柒、油性无光调合柒等', null, null, null, '00190225223530JMDR272', null, '18mm*18mm*18mm', '块', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:35:31', '2019-02-25 22:35:31', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('292', '275', '1', null, null, '磁柒', '各种磁柒，如：脂胶磁柒、酚醛磁柒、醇酸磁漆、硝酸外用磁柒、丙烯酸硝基磁柒、过氯乙烯外用磁漆等', null, null, null, '00190225223539IBBH273', null, '18m', '条', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:35:40', '2019-02-25 22:35:40', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('293', '275', '1', null, null, '烘柒', '各种干磁柒，如：氨基烘干磁柒、环氧脂烘干磁柒、丙烯酸烘干磁柒、酚醛烘干皱纹柒等', null, null, null, '00190225223550SQ0L274', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:35:50', '2019-02-25 22:35:50', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('294', '275', '1', null, null, '底漆和腻子', '各种底柒和各种腻子，如：脂胶底柒、硝基底柒、硝基腻子等', null, null, null, '00190225223557FTOE275', null, '10m*10m*10m', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:35:58', '2019-02-25 22:35:58', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('295', '275', '1', null, null, '绝缘柒', '各种绝缘漆、色线柒、包线柒等', null, null, null, '00190225223606HNJA276', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:36:06', '2019-02-25 22:36:06', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('296', '275', '1', null, null, '防腐柒和船舶柒', '各种耐酸柒、防腐柒、防锈柒、沥青船底柒等', null, null, null, '00190225223617QBDF277', null, '18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:36:17', '2019-02-25 22:36:17', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('297', '275', '1', null, null, '特种用柒', '各种防火柒、地板柒、黑板柒、耐热漆、烟囱柒等', null, null, null, '00190225223625XHVO278', null, '18mm*18mm*18mm', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:36:26', '2019-02-25 22:36:26', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('298', '275', '1', null, null, '辅助材料', '各种柒料稀释剂、松香水、固化剂、羧基纤维素等', null, null, null, '00190225223635UKIQ279', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:36:36', '2019-02-25 22:36:36', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('299', '276', '1', null, null, '无机颜料', '各种无机颜料，如：二氧化钛、一氧化铅、氧化铁红等', null, null, null, '0019022522364644VJ280', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:36:46', '2019-02-25 22:36:46', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('300', '276', '1', null, null, '有机颜料', '各种有机颜料,如:大红粉、甲苯胺仁、颜料绿、酞青红等', null, null, null, '00190225223653I3HC281', null, '10m*10m*10m', '捆', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:36:54', '2019-02-25 22:36:54', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('301', '276', '1', null, null, '其他颜料', '如：红朱、银朱、红土粉、黄土粉、黄纳粉、色粉等', null, null, null, '001902252237013M7F282', null, '10cm*10cm*10cm', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:37:01', '2019-02-25 22:37:01', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('302', '277', '1', null, null, '炸药', '各种铵锑炸药、胶质炸药、水胶炸药、乳胶炸药等', null, null, null, '00190225223714LILQ283', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:37:15', '2019-02-25 22:37:15', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('303', '277', '1', null, null, '雷管', '各种火雷管、瞬发电雷管、延期电雷管、毫秒延期电雷管等', null, null, null, '00190225223721QMBX284', null, '18mm*18mm*18mm', '块', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:37:22', '2019-02-25 22:37:22', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('304', '277', '1', null, null, '导火索导爆索', '各种导火索、导爆索等', null, null, null, '001902252237353A2R285', null, '18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:37:35', '2019-02-25 22:37:35', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('305', '277', '1', null, null, '导爆管非电起爆系统', '\"非电瞬发雷管、非电毫秒延期雷管、非电半秒延期雷管\r\n普通传爆雷管、导爆管等\"', null, null, null, '00190225223752T1SZ286', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:37:53', '2019-02-25 22:37:53', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('306', '277', '1', null, null, '非电起爆杂件', '塑料套管、金属套管、联接块、联接塞、金属箍、卡口器、击发枪、起爆枪、火帽、爆破用母线等', null, null, null, '00190225223759BOKZ287', null, '10m*10m*10m', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:38:00', '2019-02-25 22:38:00', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('307', '203', '1', null, null, '橡胶', '', null, null, null, '00190225223811GB8J288', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:38:12', '2019-02-25 22:38:12', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('308', '203', '1', null, null, '运输带', '', null, null, null, '00190225223819OJ9V289', null, '18m', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:38:19', '2019-02-25 22:38:19', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('309', '203', '1', null, null, '传动带', '各种胶布传动带等', null, null, null, '001902252238243LYR290', null, '18mm*18mm*18mm', '块', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:38:25', '2019-02-25 22:38:43', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('310', '203', '1', null, null, '三角带', '各种O型、A型、B型、C型、D型、E型三角带等', null, null, null, '00190225223831CXY3291', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:38:32', '2019-02-25 22:38:49', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('311', '203', '1', null, null, '橡胶管', '', null, null, null, '00190225223904N53K292', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:39:05', '2019-02-25 22:39:05', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('312', '203', '1', null, null, '橡胶板', '', null, null, null, '00190225223922ASHA293', null, '10m*10m*10m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:39:22', '2019-02-25 22:39:22', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('313', '203', '1', null, null, '轮胎', '', null, null, null, '00190225223929QV6J294', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:39:30', '2019-02-25 22:39:30', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('314', '307', '1', null, null, '天然橡胶', '各种天然橡胶，如；烟胶片、褐胶片、胶清片、国产标准橡胶、乳胶等', null, null, null, '00190225223946HRYA295', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:39:46', '2019-02-25 22:39:46', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('315', '307', '1', null, null, '合成橡胶', '各种合成橡胶，如：丁苯橡胶、充油丁苯橡胶、氯丁橡胶、顺丁橡胶、丁晴橡胶、乙炳橡胶、聚硫橡胶等', null, null, null, '00190225223955RSED296', null, '18m*18m', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:39:55', '2019-02-25 22:39:55', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('316', '308', '1', null, null, '胶布运输带', '各种普通型运输带等', null, null, null, '00190225224005ZLPS297', null, '18m', '条', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:40:05', '2019-02-25 22:40:05', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('317', '308', '1', null, null, '尼龙运输带', '各种尼龙运输带', null, null, null, '00190225224013JRKC298', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:40:13', '2019-02-25 22:40:13', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('318', '311', '1', null, null, '机车车辆专用胶管', '各种制动胶管、暖气胶管、过水胶管、耐油胶管等', null, null, null, '00190225224034UESW299', null, '10m*10m*10m', '捆', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:40:35', '2019-02-25 22:40:35', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('319', '311', '1', null, null, '耐热胶管', '各种夹布耐热胶管', null, null, null, '00190225224042XVI8300', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:40:42', '2019-02-25 22:40:42', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('320', '311', '1', null, null, '输水胶管', '各种输水胶管、铠装夹布输水胶管、红纯橡胶管等', null, null, null, '00190225224050TGYZ301', null, '18m*18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:40:51', '2019-02-25 22:40:51', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('321', '311', '1', null, null, '耐油胶管', '各种夹布耐油胶管、铠装夹布耐油胶管等', null, null, null, '00190225224058JGHR302', null, '18mm*18mm*18mm', '块', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:40:58', '2019-02-25 22:40:58', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('322', '311', '1', null, null, '风压胶管', '各种夹布风压胶管、高压胶管、铠装夹布高压胶管等', null, null, null, '00190225224106YLW8303', null, '6mm*6mm*6mm', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:41:07', '2019-02-25 22:41:07', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('323', '311', '1', null, null, '喷砂浆雾胶管', '各种喷砂胶管、喷雾胶管、', null, null, null, '001902252241139XQD304', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:41:14', '2019-02-25 22:41:14', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('324', '311', '1', null, null, '氧气乙炔胶管', '各种氧气管、乙炔管等', null, null, null, '00190225224120KLTM305', null, '10m*10m*10m', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:41:21', '2019-02-25 22:41:21', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('325', '311', '1', null, null, '其它专用胶管', '各种潜水空气胶管、夹布制孔胶管等', null, null, null, '00190225224127BWG2306', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:41:28', '2019-02-25 22:41:28', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('326', '312', '1', null, null, '普通橡胶板', '各种普通橡胶板、夹布橡胶板', null, null, null, '0019022522413724JU307', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:41:38', '2019-02-25 22:41:38', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('327', '312', '1', null, null, '耐酸、油热橡胶板', '各种耐酸（碱）橡胶板、耐油橡胶板等', null, null, null, '00190225224152HNJC308', null, '18mm*18mm*18mm', '块', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:41:53', '2019-02-25 22:41:53', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('328', '312', '1', null, null, '绝缘橡胶板', '各种绝缘橡胶板', null, null, null, '00190225224201PBXR309', null, '18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:42:01', '2019-02-25 22:42:01', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('329', '312', '1', null, null, '其它橡胶板', '\"喷砂胶咀、风水管橡胶垫、铸铁管胶圈、氧气\r\n瓶胶圈、橡胶圈、橡胶垫圈等\"', null, null, null, '00190225224209R2YD310', null, '10cm*10cm*10cm', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:42:10', '2019-02-25 22:42:10', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('330', '313', '1', null, null, '成套轮胎', '各种工程机械轮胎、汽车轮胎等', null, null, null, '0019022522421915H1311', null, '10m*10m*10m', '捆', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:42:19', '2019-02-25 22:42:19', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('331', '313', '1', null, null, '外胎', '各种工程机械车辆外胎、汽车外胎、摩托车外胎等', null, null, null, '00190225224226TFXF312', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:42:27', '2019-02-25 22:42:27', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('332', '313', '1', null, null, '内胎', '各种工程机械车辆内胎、汽车内胎、摩托车内胎等', null, null, null, '00190225224240334Z313', null, '18m', '条', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:42:40', '2019-02-25 22:42:40', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('333', '313', '1', null, null, '垫带', '各种工程机械车辆轮胎垫带、汽车轮胎垫带等', null, null, null, '00190225224247SPK3314', null, '18mm*18mm*18mm', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:42:48', '2019-02-25 22:42:48', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('334', '313', '1', null, null, '力车内外胎', '各种力车外胎、内胎等', null, null, null, '001902252242565KOZ315', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:42:57', '2019-02-25 22:42:57', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('335', '204', '1', null, null, '塑料及制品', '', null, null, null, '00190225224356HVBR316', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:43:56', '2019-02-25 22:43:56', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('336', '204', '1', null, null, '有机玻璃型材', '', null, null, null, '00190225224416RMLP317', null, '10m*10m*10m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:44:16', '2019-02-25 22:44:16', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('337', '335', '1', null, null, '合成树脂', '各种合成树脂、ABS树脂、高分子合成粘结剂等', null, null, null, '001902252244538MPO318', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:44:54', '2019-02-25 22:44:54', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('338', '335', '1', null, null, '塑料原料', '各种酚醛塑料粉、聚酰胺1010、聚丙烯、聚胺脂预聚体', null, null, null, '00190225224501Q1SH319', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:45:02', '2019-02-25 22:45:02', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('339', '335', '1', null, null, '聚氯乙烯板', '各种聚氯乙烯硬板、软板等（PVC板）', null, null, null, '00190225224512MKQY320', null, '18mm*18mm*18mm', '块', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:45:12', '2019-02-25 22:45:12', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('340', '335', '1', null, null, '聚苯乙烯板', '各种聚苯乙烯（PS）硬板等', null, null, null, '00190225224520VPHP321', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:45:20', '2019-02-25 22:45:20', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('341', '335', '1', null, null, '高压聚乙烯板', '各种高压聚乙烯（PE）板等', null, null, null, '00190225224529V3IQ322', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:45:30', '2019-02-25 22:45:30', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('342', '335', '1', null, null, '聚四氟乙烯板', '各种聚四氟乙烯（PTFE）板', null, null, null, '0019022522453716OK323', null, '10m*10m*10m', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:45:38', '2019-02-25 22:45:38', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('343', '335', '1', null, null, '其它塑料硬板', '\"给水用聚氯乙烯成型板、聚合异丁烯、塑料排水板\r\n钙塑板等\"', null, null, null, '00190225224545ECXJ324', null, '10cm*10cm*10cm', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:45:45', '2019-02-25 22:45:45', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('344', '335', '1', null, null, '聚氯乙烯硬管', '\"各种聚氯乙烯硬管、半硬聚氯乙烯管、半硬塑套接管\r\n塑料异型管等\"', null, null, null, '00190225224552YXAY325', null, '18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:45:53', '2019-02-25 22:45:53', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('345', '335', '1', null, null, '聚氯乙烯软管', '各种聚氯乙烯软管等', null, null, null, '00190225224602AUWZ326', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:46:02', '2019-02-25 22:46:02', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('346', '335', '1', null, null, '聚乙烯硬管', '各种聚乙烯硬管等', null, null, null, '00190225224611OVFN327', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:46:11', '2019-02-25 22:46:11', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('347', '335', '1', null, null, '高压聚乙烯软管', '各种高压聚乙烯软管等', null, null, null, '00190225224619HCJW328', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:46:20', '2019-02-25 22:46:20', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('348', '335', '1', null, null, '聚四氟乙烯管', '各种聚四氟乙烯管等', null, null, null, '00190225224630WEH3329', null, '10m*10m*10m', '捆', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:46:30', '2019-02-25 22:46:30', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('349', '335', '1', null, null, '聚酰胺管', '各种聚酰胺1010管等', null, null, null, '00190225224637IMGX330', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:46:37', '2019-02-25 22:46:37', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('350', '335', '1', null, null, '其他塑料制品', '各种塑料管件等', null, null, null, '00190225224644EAXG331', null, '18m*18m', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:46:44', '2019-02-25 22:46:44', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('351', '335', '1', null, null, '聚氯乙烯棒', '各种聚氯乙烯硬棒等', null, null, null, '00190225224651HUTS332', null, '18mm*18mm*18mm', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:46:51', '2019-02-25 22:46:51', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('352', '335', '1', null, null, '尼龙（PA）棒', '各种尼龙（PA）棒等', null, null, null, '00190225224707NAQK333', null, '18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:47:07', '2019-02-25 22:47:07', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('353', '336', '1', null, null, '有机玻璃板', '各种有机玻璃（PMMA）平板等', null, null, null, '00190225224731AD4G334', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:47:32', '2019-02-25 22:47:32', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('354', '336', '1', null, null, '有机玻璃管', '各种有机玻璃（PMMA）管', null, null, null, '00190225224739GCA5335', null, '10m*10m*10m', '捆', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:47:39', '2019-02-25 22:47:39', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('355', '336', '1', null, null, '有机玻璃棒', '各种有机玻璃（PMMA）棒', null, null, null, '00190225224747WKOX336', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:47:47', '2019-02-25 22:47:47', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('356', '335', '1', null, null, '泡沫塑料', '各种泡沫塑料等', null, null, null, '00190225224810XSTR337', null, '18m', '条', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:48:11', '2019-02-25 22:48:11', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('357', '335', '1', null, null, '泡沫塑料板', '各种聚苯乙烯泡沫塑料板等', null, null, null, '00190225224817DHA4338', null, '18mm*18mm*18mm', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:48:18', '2019-02-25 22:48:18', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('358', '335', '1', null, null, '聚氨酯软泡沫塑料板', '各种聚氨酯软泡沫塑料板、硬泡沫塑料板、聚乙烯高泡条等', null, null, null, '00190225224832YZVY339', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:48:32', '2019-02-25 22:48:32', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('359', '335', '1', null, null, '聚氨酯泡沫塑料油垫', '各种聚氨酯泡沫塑料油垫等', null, null, null, '00190225224845XPUG340', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:48:45', '2019-02-25 22:48:45', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('360', '335', '1', null, null, '聚苯乙烯泡沫塑料管瓦', '各种聚苯乙烯泡沫塑料管瓦等', null, null, null, '00190225224853ZN2N341', null, '10m*10m*10m', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:48:53', '2019-02-25 22:48:53', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('361', '335', '1', null, null, '聚氯乙烯薄膜', '各种聚氯乙烯压延薄膜等', null, null, null, '001902252249050ZPT342', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:49:06', '2019-02-25 22:49:06', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('362', '335', '1', null, null, '高压聚乙烯吹塑薄膜', '各种高压聚乙烯吹塑薄膜等', null, null, null, '00190225224917TBLB343', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:49:18', '2019-02-25 22:49:18', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('363', '335', '1', null, null, '聚乙烯薄膜', '各种聚乙烯薄膜等', null, null, null, '00190225224925P5TJ344', null, '18mm*18mm*18mm', '块', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:49:26', '2019-02-25 22:49:26', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('364', '335', '1', null, null, '聚四氟乙烯薄膜', '各种聚四氟乙烯薄膜等', null, null, null, '00190225224932EDAF345', null, '18m', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:49:33', '2019-02-25 22:49:33', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('365', '335', '1', null, null, '反光标志', 'FgⅠ型复合材料底板系列反光标志等', null, null, null, '00190225224940PF5Z346', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:49:40', '2019-02-25 22:49:40', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('366', '335', '1', null, null, '塑料单丝', '\"聚氯乙烯单丝、低压聚氯乙烯单丝、高压聚氯乙烯单丝\r\n聚丙烯单丝等\"', null, null, null, '00190225224950QDGK347', null, '10m*10m*10m', '捆', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:49:50', '2019-02-25 22:49:50', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('367', '335', '1', null, null, '聚氯乙烯带及其他', '各种聚氯乙烯绝缘带、胶带、塑料粘胶带、密封塑料带等\r\n各种PVC塑料止水带等\r\n各种聚四氟乙烯密封带等\r\n各种塑料编织带、尼龙编织带等\r\n各种塑料地板、塑料垫片等', null, null, null, '00190225225011ROZQ348', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:50:12', '2019-02-25 22:50:12', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('368', '335', '1', null, null, '塑料焊条', '各种聚氯乙烯焊条', null, null, null, '00190225225020F7AG349', null, '18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:50:21', '2019-02-25 22:50:21', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('369', '335', '1', null, null, '塑料贴面板', '各种塑料贴面板、塑料壁纸等', null, null, null, '00190225225027QM5S350', null, '18mm*18mm*18mm', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:50:28', '2019-02-25 22:50:28', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('370', '205', '1', null, null, '纤维', '\"棉花、大麻、黄麻、青麻、亚麻、木棉、棕皮\r\n、棕丝等\"', null, null, null, '00190225225103DZXF351', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:51:04', '2019-02-25 22:51:04', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('371', '205', '1', null, null, '棉纺织品', '', null, null, null, '00190225225116C3CB352', null, '10cm*10cm*10cm', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:51:17', '2019-02-25 22:51:17', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('372', '205', '1', null, null, '绳索', '', null, null, null, '00190225225139ZOYW353', null, '10m*10m*10m', '捆', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:51:39', '2019-02-25 22:51:39', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('373', '205', '1', null, null, '毛毡及其他纤维制品和皮革', '', null, null, null, '001902252251541TTG354', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:51:54', '2019-02-25 22:51:54', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('374', '371', '1', null, null, '棉纺品', '棉纱、白棉纱、花棉纱、轴线等', null, null, null, '001902252252124RAQ355', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:52:12', '2019-02-25 22:52:12', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('375', '371', '1', null, null, '棉织品', '各种棉布、华达呢、帆布、土工织物等', null, null, null, '00190225225220ZMYA356', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:52:21', '2019-02-25 22:52:21', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('376', '371', '1', null, null, '其他织品', '黄麻布、纺绸、丝绸、尼龙地毯等', null, null, null, '00190225225228LGRN357', null, '18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:52:29', '2019-02-25 22:52:29', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('377', '372', '1', null, null, '棕绳', '白棕绳、红棕绳等', null, null, null, '00190225225244RO56358', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:52:44', '2019-02-25 22:52:44', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('378', '372', '1', null, null, '麻绳', '线麻、细麻绳等', null, null, null, '001902252252516XGU359', null, '10m*10m*10m', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:52:52', '2019-02-25 22:52:52', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('379', '372', '1', null, null, '其他绳类', '尼龙绳、稻草绳、高硅氧棉绳、', null, null, null, '00190225225259OET5360', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:52:59', '2019-02-25 22:52:59', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('380', '373', '1', null, null, '毛毡', '各种毛毡、粗毛毡、杂毛毡、毛粘条、密封毡条等', null, null, null, '00190225225308TYNW361', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:53:09', '2019-02-25 22:53:09', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('381', '373', '1', null, null, '其他纤维制品', '脱脂棉、医用纱布、棉纱头、墨斗线、麻袋等', null, null, null, '00190225225322LF55362', null, '18mm*18mm*18mm', '块', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:53:22', '2019-02-25 22:53:22', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('382', '373', '1', null, null, '电传打印用纸', '各种打印机、传真机、复印机用纸、牛皮纸等', null, null, null, '001902252253356D4A363', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:53:35', '2019-02-25 22:53:35', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('383', '373', '1', null, null, '工业用纸', '黄板纸、滤油纸、电缆纸、青壳纸、平钢板纸等', null, null, null, '00190225225343JDCT364', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:53:43', '2019-02-25 22:53:43', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('384', '373', '1', null, null, '一般用纸', '新闻纸、印刷纸、书皮纸、有光纸、打字纸、制图纸、描图纸、晒图纸、计算纸等', null, null, null, '00190225225350DFUP365', null, '10m*10m*10m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:53:51', '2019-02-25 22:53:51', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('385', '373', '1', null, null, '人造革', '地板人造革、帆布人造革、市布人造革、漂布人造革', null, null, null, '00190225225359RQ5X366', null, '18m*18m', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:53:59', '2019-02-25 22:53:59', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('386', '373', '1', null, null, '皮革及其他', '硬牛皮、软牛皮、柒布等', null, null, null, '00190225225406CEKS367', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:54:06', '2019-02-25 22:54:06', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('387', '206', '1', null, null, '防护服装', '工作服、招待服、护士服、单大衣、衬衣、风衣、防静电工作服', null, null, null, '00190225225425V4CH368', null, '18mm*18mm*18mm', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:54:26', '2019-02-25 22:54:26', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('388', '206', '1', null, null, '一般防护用品', '\"工作帽、护士帽、护肩帽、安全帽、草帽、护肩、套袖\r\n、围裙、手套、护褪、工矿靴、毛巾、口罩、枕巾等\"', null, null, null, '00190225225438DJ44369', null, '18m', '条', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:54:39', '2019-02-25 22:54:39', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('389', '206', '1', null, null, '安全绳子 带、板、网', '安全带、电工带、安全、安全网、踩板等', null, null, null, '00190225225458DYFZ370', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:54:59', '2019-02-25 22:54:59', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('390', '206', '1', null, null, '防寒用品', '皮大衣、皮裤、皮背心、棉大衣、棉衣裤、棉背心、毛衣、毛裤等\r\n防寒帽、皮手套、棉手套、羽绒服、防寒服等', null, null, null, '001902252255092SW0371', null, '10m*10m*10m', '捆', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:55:09', '2019-02-25 22:55:09', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('391', '206', '1', null, null, '防水用品', '\"分身雨衣、长雨衣、雨披、防水胶鞋、雨鞋、军用胶鞋\r\n、下水服、下水裤、下水围腰等\"', null, null, null, '00190225225522MLKS372', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:55:22', '2019-02-25 22:55:22', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('392', '206', '1', null, null, '救生用品', '救生衣、救生圈、潜水器等', null, null, null, '00190225225529ONM1373', null, '18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:55:29', '2019-02-25 22:55:29', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('393', '206', '1', null, null, '耐酸用品', '耐酸(工作服、围裙、套袖、手套、鞋盖、靴、鞋、口罩）等', null, null, null, '00190225225536KV3D374', null, '18mm*18mm*18mm', '块', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:55:36', '2019-02-25 22:55:36', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('394', '206', '1', null, null, '耐油用品', '耐油（工作服、背带裤、手套、胶靴、围裙）等', null, null, null, '001902252255432YCE375', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:55:43', '2019-02-25 22:55:43', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('395', '206', '1', null, null, '绝缘用品', '绝缘（手套、棉鞋、皮鞋、地毯）等', null, null, null, '00190225225550OWXR376', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:55:51', '2019-02-25 22:55:51', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('396', '206', '1', null, null, '隔热用品', '石棉（工作服、上衣、工作帽、套袖、围裙、手套）等', null, null, null, '00190225225558X9HZ377', null, '10m*10m*10m', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:55:58', '2019-02-25 22:55:58', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('397', '206', '1', null, null, '防毒用品', '防毒工作服、防毒面具、滤毒罐、自救器、防毒口罩等', null, null, null, '0019022522560531TH378', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:56:06', '2019-02-25 22:56:06', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('398', '206', '1', null, null, '防尘用品', '喷砂工作衣、防尘口罩、防尘口罩滤布等', null, null, null, '00190225225612VXAP379', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:56:12', '2019-02-25 22:56:12', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('399', '206', '1', null, null, '其他防护用品', '防砂面罩、电焊面罩、防尘眼镜、电焊眼镜等', null, null, null, '00190225225618WOLN380', null, '18mm*18mm*18mm', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:56:19', '2019-02-25 22:56:19', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('400', '207', '1', null, null, '杂备品', '', null, null, null, '001902252256448UKN381', null, '18m*18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:56:45', '2019-02-25 22:56:45', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('401', '207', '1', null, null, '残废料', '', null, null, null, '00190225225655S4R6382', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:56:56', '2019-02-25 22:56:56', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('402', '400', '1', null, null, '容器', '各种桶、坛、壶、瓶、盆等', null, null, null, '00190225225710WUBR383', null, '10m*10m*10m', '捆', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:57:10', '2019-02-25 22:57:10', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('403', '400', '1', null, null, '竹、木、柳 草制品', '各种锤把、镐把、抬杠、抬筐、土箕、扫把等', null, null, null, '0019022522572191ME384', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:57:21', '2019-02-25 22:57:21', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('404', '400', '1', null, null, '刷子及其他', '钢丝刷、铜丝刷、锅炉刷、扁油刷、排笔、毛笔等', null, null, null, '001902252257297MCX385', null, '18m', '条', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:57:29', '2019-02-25 22:57:29', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('405', '400', '1', null, null, '袋、套、包', '各种工具包、工具袋、皮套等', null, null, null, '00190225225739FFAZ386', null, '18m*18m', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:57:40', '2019-02-25 22:57:40', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('406', '400', '1', null, null, '蓬布', '各种货车蓬布、防湿蓬布、汽车盖布等', null, null, null, '00190225225748JOW6387', null, '6mm*6mm*6mm', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:57:48', '2019-02-25 22:57:48', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('407', '400', '1', null, null, '加油器具', '各种油壶、油提子、油漏斗、手摇油泵等', null, null, null, '00190225225755DNIN388', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:57:56', '2019-02-25 22:57:56', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('408', '400', '1', null, null, '防护类信号器材', '各种防护类信号器材等', null, null, null, '00190225225809BKIZ389', null, '10m*10m*10m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:58:09', '2019-02-25 22:58:09', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('409', '400', '1', null, null, '其他杂备品', '汽油灯、煤油灯、手电筒、蜡烛等\r\n各种铅封、封车环、灰斗、粉笔、洗衣粉等', null, null, null, '00190225225819RFLY390', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:58:19', '2019-02-25 22:58:19', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('410', '401', '1', null, null, '棉麻纤维制品', '各种废棉、麻及纤维制品等', null, null, null, '0019022522582840NT391', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:58:29', '2019-02-25 22:58:29', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('411', '401', '1', null, null, '玻璃及制品', '各种废玻璃制品等', null, null, null, '00190225225836NIIP392', null, '18mm*18mm*18mm', '块', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:58:37', '2019-02-25 22:58:37', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('412', '401', '1', null, null, '橡胶及制品', '各种废橡胶及制品等', null, null, null, '00190225225844YJNH393', null, '18m', '条', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:58:45', '2019-02-25 22:58:45', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('413', '401', '1', null, null, '塑料制品', '各种废塑料制品等', null, null, null, '00190225225855DHGJ394', null, '10cm*10cm*10cm', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:58:55', '2019-02-25 22:58:55', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('414', '401', '1', null, null, '废油脂', '各种废机油、废柴油等', null, null, null, '00190225225902GSTK395', null, '10m*10m*10m', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 22:59:02', '2019-02-25 22:59:02', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('415', '24', '1', null, null, '裸电线', '', null, null, null, '00190225230534I3XJ396', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:05:35', '2019-02-25 23:05:35', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('416', '24', '1', null, null, '绕组线', '', null, null, null, '00190225230544OI5O397', null, '18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:05:45', '2019-02-25 23:05:45', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('417', '24', '1', null, null, '布电线', '', null, null, null, '00190225230552OPRG398', null, '18mm*18mm*18mm', '块', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:05:53', '2019-02-25 23:05:53', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('418', '24', '1', null, null, '其他电线', '', null, null, null, '00190225230607IKBH399', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:06:07', '2019-02-25 23:06:07', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('419', '24', '1', null, null, '电力电缆', '', null, null, null, '001902252306158NCY400', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:06:16', '2019-02-25 23:06:16', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('420', '24', '1', null, null, '控制信号电缆', '', null, null, null, '00190225230629GN7Z401', null, '10m*10m*10m', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:06:29', '2019-02-25 23:06:29', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('421', '24', '1', null, null, '通信电缆', '', null, null, null, '00190225230644S0Y5402', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:06:44', '2019-02-25 23:06:44', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('422', '24', '1', null, null, '电缆敷设器材', '', null, null, null, '00190225230656OOWD403', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:06:57', '2019-02-25 23:06:57', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('423', '24', '1', null, null, '电瓷金具架线器材', '', null, null, null, '00190225230714CHMQ404', null, '18mm*18mm*18mm', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:07:14', '2019-02-25 23:07:14', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('424', '24', '1', null, null, '绝缘材料', '', null, null, null, '001902252307246ET4405', null, '18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:07:25', '2019-02-25 23:07:25', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('425', '24', '1', null, null, '其他电器材料', '', null, null, null, '001902252307374RR9406', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:07:37', '2019-02-25 23:07:37', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('426', '415', '1', null, null, '裸铜线', '\"如:硬园铜线、软园铜线、裸铜线、锰铜线、\r\n硬铜绞线、软铜绞线等\"', null, null, null, '00190225230835D2K7407', null, '10m*10m*10m', '捆', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:08:36', '2019-02-25 23:08:36', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('427', '415', '1', null, null, '电车线', '如：钢铝复合接触线', null, null, null, '00190225230842G523408', null, '10cm*10cm*10cm', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:08:43', '2019-02-25 23:08:43', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('428', '415', '1', null, null, '铜包钢线', '各规格铜包钢线', null, null, null, '00190225230852TMF7409', null, '18m', '条', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:08:53', '2019-02-25 23:08:53', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('429', '415', '1', null, null, '铝包钢线', '各规格普通铝包钢线、高强度铝包钢线等', null, null, null, '001902252309014MUP410', null, '18mm*18mm*18mm', '块', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:09:01', '2019-02-25 23:09:01', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('430', '415', '1', null, null, '钢芯铝绞线', '各规格钢芯铝绞线、轻型钢芯铝绞线等', null, null, null, '00190225230909IGHN411', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:09:10', '2019-02-25 23:09:10', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('431', '415', '1', null, null, '裸铝线', '各规格软铝线、铝绞线、硬铝母线等', null, null, null, '00190225230919EHZB412', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:09:20', '2019-02-25 23:09:20', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('432', '415', '1', null, null, '铜排扁线', '硬扁铜线、软扁铜线', null, null, null, '00190225230926M24O413', null, '10m*10m*10m', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:09:27', '2019-02-25 23:09:27', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('433', '415', '1', null, null, '电刷线', '硬铜母线、铜母线、软铜母线、硬铜带、软铜带梯形铜排、硬铜电刷线等', null, null, null, '00190225230933LDEZ414', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:09:33', '2019-02-25 23:09:33', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('434', '416', '1', null, null, '漆包线', '各规格漆包铜线', null, null, null, '00190225230944X9NL415', null, '6mm*6mm*6mm', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:09:44', '2019-02-25 23:09:44', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('435', '416', '1', null, null, '丝包线', '各规格丝包铜线', null, null, null, '00190225230950EICN416', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:09:51', '2019-02-25 23:09:51', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('436', '417', '1', null, null, '橡皮绝缘电线', '\"各规格铝芯氯丁橡皮线、铝芯橡皮线、铜芯橡\r\n皮线、铜芯橡皮软线、铜芯玻璃丝包橡皮线等\"', null, null, null, '001902252310023UL2417', null, '18m', '条', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:10:03', '2019-02-25 23:10:03', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('437', '417', '1', null, null, '聚氯乙烯绝缘电线', '各规格铝芯聚氯乙烯绝缘电线、铝芯聚氯乙烯绝缘护套电线、铜芯聚氯乙烯绝缘电线、铜芯聚氯乙烯绝缘护套电线等', null, null, null, '00190225231009XUW6418', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:10:09', '2019-02-25 23:10:09', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('438', '417', '1', null, null, '电机引接线', '各规格丁睛聚氯乙烯复合物绝缘引接线和护套线', null, null, null, '001902252310155Y2A419', null, '10m*10m*10m', '捆', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:10:16', '2019-02-25 23:10:16', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('439', '417', '1', null, null, '电气化车辆用电线', '各规格电气化车辆用铜芯橡皮绝缘橡套电线、电气化车辆用铜芯橡皮绝缘棉纱编制涂蜡电线等', null, null, null, '00190225231022UY9R420', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:10:23', '2019-02-25 23:10:23', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('440', '417', '1', null, null, '通用橡套软电缆', '各规格轻型和中型橡套软电缆等', null, null, null, '00190225231028FQQE421', null, '18m*18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:10:29', '2019-02-25 23:10:29', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('441', '417', '1', null, null, '电焊机电缆', '各规格天然胶护套电焊机电缆等', null, null, null, '00190225231035SQGB422', null, '18mm*18mm*18mm', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:10:35', '2019-02-25 23:10:35', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('442', '417', '1', null, null, '腊克线', '各规格聚氯乙烯绝缘尼龙护套电线、公路车辆用铜芯聚氯乙烯绝缘低压电线、汽车及拖拉机照明腊克线等', null, null, null, '00190225231041EOML423', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:10:41', '2019-02-25 23:10:41', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('443', '418', '1', null, null, '塑料绝缘电线', '各规格铜芯聚氯乙烯绝缘连接软电线和平型连接软电线、复合物绝缘平型软线等', null, null, null, '00190225231052WG6T424', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:10:52', '2019-02-25 23:10:52', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('444', '418', '1', null, null, '电灯花线', '各规格电灯用花线', null, null, null, '00190225231100GW0C425', null, '10m*10m*10m', '捆', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:11:01', '2019-02-25 23:11:01', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('445', '418', '1', null, null, '金属屏蔽线', '各规格金属屏蔽线', null, null, null, '00190225231108W9ZJ426', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:11:08', '2019-02-25 23:11:08', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('446', '418', '1', null, null, '被复线、电话线', '中型和轻型被复线、铁芯通讯线、双芯室内电话线等', null, null, null, '00190225231117CFHQ427', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:11:18', '2019-02-25 23:11:18', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('447', '419', '1', null, null, '粘性油浸纸绝缘金属套电力电缆', '\"各规格粘性油浸纸绝缘铅套裸钢带铠装电力电缆、粘性\r\n油浸纸绝缘铅套钢带铠装纤维外被电力电缆等\"', null, null, null, '00190225231134UFXO428', null, '18mm*18mm*18mm', '块', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:11:34', '2019-02-25 23:11:34', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('448', '419', '1', null, null, '橡皮绝缘电力电缆', '\"各规格铜芯橡皮绝缘聚氯乙烯护套电力电缆、铜芯橡皮\r\n绝缘裸铅包电力电缆、\"', null, null, null, '00190225231140B1HC429', null, '18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:11:40', '2019-02-25 23:11:40', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('449', '419', '1', null, null, '聚氯乙烯绝缘护套电力电缆', '各规格铜芯和铝芯聚氯乙烯绝缘聚氯乙烯护套电力电缆、铜芯和铝芯聚氯乙烯绝缘钢带铠装氯乙烯护套电力电缆等', null, null, null, '00190225231158YFLJ430', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:11:58', '2019-02-25 23:11:58', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('450', '419', '1', null, null, '重型橡套电缆', '各规格重型橡套电缆等', null, null, null, '00190225231205FKYT431', null, '10m*10m*10m', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:12:06', '2019-02-25 23:12:06', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('451', '420', '1', null, null, '聚乙烯绝缘控制电缆', '各规格聚乙烯绝缘聚氯乙烯护套钢带铠装控制电缆等', null, null, null, '00190225231311TYBG432', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:13:12', '2019-02-25 23:13:12', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('452', '420', '1', null, null, '聚氯乙烯绝缘控制电缆', '各规格铜芯聚氯乙烯绝缘聚氯乙烯护套控制电缆等', null, null, null, '00190225231319OIJU433', null, '18m', '条', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:13:20', '2019-02-25 23:13:20', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('453', '420', '1', null, null, '特种控制电缆', '\"各规格野外用橡皮绝缘电缆、野外用橡皮绝缘屏蔽电缆\r\n、野外用橡皮绝缘控制电缆等\"', null, null, null, '00190225231326XCX7434', null, '18mm*18mm*18mm', '块', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:13:27', '2019-02-25 23:13:27', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('454', '420', '1', null, null, '聚氯乙烯绝缘信号电缆', '各规格聚氯乙烯绝缘信号电缆等', null, null, null, '001902252313354UZ2435', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:13:36', '2019-02-25 23:13:36', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('455', '420', '1', null, null, '聚乙烯绝缘信号电缆', '各规格聚乙烯绝缘信号电缆等', null, null, null, '001902252313447LJT436', null, '18m*18m', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:13:45', '2019-02-25 23:13:45', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('456', '421', '1', null, null, '市内通信电缆', '各规格铜芯纸绝缘和聚乙烯绝缘市内通信电缆等\r\n各规格聚烃绝缘市内通信电缆等', null, null, null, '00190225231401ZJQX437', null, '10m*10m*10m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:14:02', '2019-02-25 23:14:02', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('457', '421', '1', null, null, '星绞低频通信电缆', '各规格铜芯纸绝缘星绞低频通信电缆等', null, null, null, '0019022523140988PL438', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:14:09', '2019-02-25 23:14:09', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('458', '421', '1', null, null, '高频长途通信电缆', '各规格铜芯纸绝缘高频长途通信电缆等', null, null, null, '001902252314220S80439', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:14:22', '2019-02-25 23:14:22', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('459', '421', '1', null, null, '综合通信电缆', '各规格同轴综合通信电缆等', null, null, null, '00190225231430XLPV440', null, '18mm*18mm*18mm', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:14:30', '2019-02-25 23:14:30', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('460', '421', '1', null, null, '配线、局用电缆', '各规格聚乙烯配线、局用电缆等', null, null, null, '00190225231437U0VL441', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:14:38', '2019-02-25 23:14:38', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('461', '421', '1', null, null, '射频电缆及其他', '各规格实心聚乙烯绝缘同轴射频电缆及其他通信电缆等', null, null, null, '00190225231445JA44442', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:14:46', '2019-02-25 23:14:46', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('462', '421', '1', null, null, '通信光缆', '各规格通信光缆等', null, null, null, '00190225231453QIUC443', null, '10m*10m*10m', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:14:53', '2019-02-25 23:14:53', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('463', '422', '1', null, null, '电缆敷设管、钩', '各规格铅套管、电缆挂钩、铅套肩、钳接管等', null, null, null, '00190225231503X1EJ444', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:15:03', '2019-02-25 23:15:03', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('464', '422', '1', null, null, '接线盒', '各规格电缆接线盒等', null, null, null, '00190225231510ZLXZ445', null, '18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:15:11', '2019-02-25 23:15:11', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('465', '422', '1', null, null, '封头', '各规格电缆封头材料等', null, null, null, '00190225231517LAD8446', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:15:18', '2019-02-25 23:15:18', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('466', '423', '1', null, null, '高压线路电瓷', '各种高压线路电瓷等', null, null, null, '00190225231530ZAMO447', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:15:30', '2019-02-25 23:15:30', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('467', '423', '1', null, null, '高压电站、电器电瓷', '各种高压电站、电器电瓷等', null, null, null, '00190225231538PQX3448', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:15:39', '2019-02-25 23:15:39', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('468', '423', '1', null, null, '低压架空电力电瓷', '各种低压架空电力电瓷等', null, null, null, '00190225231545XD6F449', null, '10m*10m*10m', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:15:46', '2019-02-25 23:15:46', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('469', '423', '1', null, null, '低压通信电瓷', '各种低压通信电瓷等', null, null, null, '00190225231552PDVU450', null, '10cm*10cm*10cm', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:15:52', '2019-02-25 23:15:52', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('470', '423', '1', null, null, '低压布线电瓷', '各种低压布线电瓷等', null, null, null, '00190225231615WYEM451', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:16:15', '2019-02-25 23:16:15', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('471', '423', '1', null, null, '线路金具', '各种线路金具等', null, null, null, '00190225231622FHEU452', null, '18mm*18mm*18mm', '块', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:16:23', '2019-02-25 23:16:23', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('472', '423', '1', null, null, '变电金具', '各种变电金具等', null, null, null, '00190225231631F3WP453', null, '18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:16:31', '2019-02-25 23:16:31', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('473', '423', '1', null, null, '电站金具', '各种电站金具等', null, null, null, '00190225231638CNV5454', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:16:38', '2019-02-25 23:16:38', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('474', '423', '1', null, null, '铁横担', '各种铁横担等', null, null, null, '00190225231646LVIU455', null, '10m*10m*10m', '捆', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:16:46', '2019-02-25 23:16:46', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('475', '423', '1', null, null, '电线路配件', '各种电线路配件等', null, null, null, '001902252316533DKY456', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:16:54', '2019-02-25 23:16:54', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('476', '424', '1', null, null, '绝缘胶', '松香脂电缆浇注胶、沥青电缆浇注胶等', null, null, null, '001902252317081IS2457', null, '18m', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:17:09', '2019-02-25 23:17:09', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('477', '424', '1', null, null, '漆布（带）', '\"如：油性漆绸（带）、油性漆布（带）、醇酸\r\n玻璃漆布（带）等\"', null, null, null, '00190225231715VHMW458', null, '18mm*18mm*18mm', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:17:15', '2019-02-25 23:17:15', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('478', '424', '1', null, null, '漆管', '如：聚氯乙烯玻璃漆管等', null, null, null, '00190225231728VCDY459', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:17:28', '2019-02-25 23:17:28', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('479', '424', '1', null, null, '层压纸板', '如：酚醛纸板、酚醛层压纸板等', null, null, null, '00190225231735MCSQ460', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:17:35', '2019-02-25 23:17:35', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('480', '424', '1', null, null, '层压布板', '如：酚醛层压布板等', null, null, null, '001902252317424JUC461', null, '10m*10m*10m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:17:42', '2019-02-25 23:17:42', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('481', '424', '1', null, null, '层压玻璃布板', '如：酚醛层压玻璃布板、环氧酚醛层压玻璃布板等', null, null, null, '00190225231749COYU462', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:17:49', '2019-02-25 23:17:49', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('482', '424', '1', null, null, '层压管', '如：酚醛层压纸管、环氧酚醛层压玻璃布管等', null, null, null, '00190225231755QILA463', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:17:56', '2019-02-25 23:17:56', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('483', '424', '1', null, null, '层压棒', '如：酚醛层压布棒、环氧酚醛层压玻璃布棒等', null, null, null, '00190225231803L5SY464', null, '18mm*18mm*18mm', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:18:04', '2019-02-25 23:18:04', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('484', '424', '1', null, null, '云母带', '如：沥青绸云母带、醇酸纸云母带等', null, null, null, '00190225231810RL29465', null, '18m', '条', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:18:11', '2019-02-25 23:18:11', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('485', '424', '1', null, null, '云母板', '如:醇酸纸柔软云母板、醇酸玻璃柔软云母板等', null, null, null, '00190225231817Z8LL466', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:18:18', '2019-02-25 23:18:18', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('486', '424', '1', null, null, '薄膜', '如：塑料布、聚脂薄膜等', null, null, null, '00190225231825ZLZF467', null, '10m*10m*10m', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:18:26', '2019-02-25 23:18:26', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('487', '424', '1', null, null, '胶带', '\"如：半导体橡胶胶带、自粘性谷橡胶带、自粘性\r\n橡胶带、乙丙橡胶带等\"', null, null, null, '00190225231833BUMH468', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:18:34', '2019-02-25 23:18:34', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('488', '424', '1', null, null, '复合制品', '如：聚脂薄膜绝缘纸柔软复合材料等', null, null, null, '00190225231841PHV3469', null, '18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:18:41', '2019-02-25 23:18:41', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('489', '424', '1', null, null, '其他绝缘带', '如：白纱带、黑胶布、黑胶布带、黑玻璃丝带、塑料绝缘胶带、黄漆布带、黄腊带、双面半导体布带等', null, null, null, '00190225231848SI25470', null, '18mm*18mm*18mm', '块', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:18:48', '2019-02-25 23:18:48', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('490', '425', '1', null, null, '室内配线照明保安器材', '', null, null, null, '00190225231920NVYH471', null, '18m*18m', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:19:21', '2019-02-25 23:19:21', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('491', '425', '1', null, null, '通风讯响器材', '', null, null, null, '00190225231934DMQ5472', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:19:34', '2019-02-25 23:19:34', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('492', '425', '1', null, null, '干电池', '', null, null, null, '0019022523194051QH473', null, '10m*10m*10m', '捆', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:19:41', '2019-02-25 23:19:41', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('493', '425', '1', null, null, '测电器', '指低压试电笔、低压测电凿、高压测电器、测电笔氖气泡、高压测电器氖气泡等', null, null, null, '00190225231948XZIB474', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:19:48', '2019-02-25 23:19:48', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('494', '490', '1', null, null, '室内配线器材', '如:电线管卡子、护口、钢线卡、线卡、管卡、防温帽、蛇皮管、木线槽、接线板、塑料线槽、圆木垫、圆塑料垫、方木垫、各种插头、插座、吊线盒、接线盒、开关及其他室内配线器材等', null, null, null, '00190225232006BCDC475', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:20:06', '2019-02-25 23:20:06', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('495', '490', '1', null, null, '照明灯具', '各种灯光罩、灯罩、灯头、日光灯及附近等', null, null, null, '00190225232013NC84476', null, '18m*18m', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:20:14', '2019-02-25 23:20:14', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('496', '490', '1', null, null, '白炽光源', '各种普通灯泡、乳白灯泡、磨砂灯泡、彩色灯炮、低压灯泡等', null, null, null, '00190225232020JVKO477', null, '18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:20:21', '2019-02-25 23:20:21', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('497', '490', '1', null, null, '专用灯泡', '指铁路专用灯泡等', null, null, null, '00190225232028RPTR478', null, '10cm*10cm*10cm', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:20:29', '2019-02-25 23:20:29', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('498', '490', '1', null, null, '指示灯泡', '指各种规格锥型电源指示灯泡等', null, null, null, '00190225232035Y6O3479', null, '10m*10m*10m', '捆', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:20:35', '2019-02-25 23:20:35', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('499', '490', '1', null, null, '气体放电光源', '\"指日光灯管、荧光高压水银灯泡、高压钠灯泡\r\n镝灯、节能灯等\"', null, null, null, '001902252320420GE1480', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:20:43', '2019-02-25 23:20:43', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('500', '490', '1', null, null, '保安器材', '指各种瓷插熔断器、保险丝、保险片、保险管、避雷针、高压绝缘拉杆、保安盒、保安器、保险盒等', null, null, null, '00190225232049ZFBL481', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:20:50', '2019-02-25 23:20:50', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('501', '491', '1', null, null, '电扇、排风扇', '指台式电风扇、吊式电风扇、排气风善、壁扇等', null, null, null, '00190225232101VGKM482', null, '18mm*18mm*18mm', '块', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:21:01', '2019-02-25 23:21:01', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('502', '491', '1', null, null, '电铃讯响器', '指交流和直流电铃、电笛、讯响器等', null, null, null, '00190225232110KCXQ483', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:21:11', '2019-02-25 23:21:11', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('503', '491', '1', null, null, '电炉丝', '指各规格电炉丝等', null, null, null, '00190225232119U9T9484', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:21:19', '2019-02-25 23:21:19', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('504', '492', '1', null, null, '干电池', '指圆型电池、方型电池、手电池、干电池、积层电池等', null, null, null, '00190225232127ULQP485', null, '10m*10m*10m', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:21:27', '2019-02-25 23:21:27', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('505', '492', '1', null, null, '电池箱', '指800*200*300电池箱', null, null, null, '001902252321358JYC486', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:21:36', '2019-02-25 23:21:36', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('506', '25', '1', null, null, '自动化仪表及系统', '', null, null, null, '00190225232209Y5SZ487', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:22:10', '2019-02-25 23:22:10', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('507', '25', '1', null, null, '电工仪器仪表及电子测量仪器', '', null, null, null, '00190225232239NLIT488', null, '18mm*18mm*18mm', '块', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:22:40', '2019-02-25 23:22:40', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('508', '25', '1', null, null, '光学仪器', '', null, null, null, '00190225232305SX10489', null, '18m', '条', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:23:06', '2019-02-25 23:23:06', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('509', '506', '1', null, null, '温度仪表', '', null, null, null, '00190225232325OXZ6490', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:23:26', '2019-02-25 23:23:26', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('510', '506', '1', null, null, '压力仪表', '各种液体压力表、弹簧管压力表、真空表、压力真空表、数字压力表等\r\n各种电接点压力表、氧压力表、耐酸压力表、耐碱压力表、耐振压力表、乙炔压力表、减压器、压力控制仪表、压力表校验仪表、专用压力表、其他压力表等', null, null, null, '00190225232335BYD5491', null, '10m*10m*10m', '捆', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:23:36', '2019-02-25 23:24:54', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('511', '506', '1', null, null, '流量仪表', '', null, null, null, '001902252323525XHP492', null, '10cm*10cm*10cm', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:23:52', '2019-02-25 23:23:52', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('512', '509', '1', null, null, '玻璃温度计', '各种玻璃温度计', null, null, null, '00190225232409QJ6Y493', null, '18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:24:10', '2019-02-25 23:24:10', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('513', '509', '1', null, null, '双金属温度计', '各种双金属温度计', null, null, null, '00190225232418OUOA494', null, '18mm*18mm*18mm', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:24:18', '2019-02-25 23:24:18', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('514', '509', '1', null, null, '压力式温度计', '各种压力式温度计', null, null, null, '00190225232425WRFP495', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:24:25', '2019-02-25 23:24:25', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('515', '509', '1', null, null, '热电阻', '各种热电阻', null, null, null, '00190225232432C7MR496', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:24:33', '2019-02-25 23:24:33', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('516', '509', '1', null, null, '热电偶', '各种热电偶', null, null, null, '00190225232443VT9A497', null, '10m*10m*10m', '捆', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:24:43', '2019-02-25 23:24:43', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('517', '511', '1', null, null, '煤气表', '家用煤气表、煤气表等', null, null, null, '00190225232504XYNM498', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:25:04', '2019-02-25 23:25:04', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('518', '511', '1', null, null, '水表', '各种水表等', null, null, null, '00190225232511E9RX499', null, '6mm*6mm*6mm', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:25:12', '2019-02-25 23:25:12', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('519', '507', '1', null, null, '安装式电表', '', null, null, null, '00190225232543GIGP500', null, '18mm*18mm*18mm', '块', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:25:43', '2019-02-25 23:25:43', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('520', '507', '1', null, null, '数字式电表', '', null, null, null, '00190225232552QF0C501', null, '18m*18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:25:52', '2019-02-25 23:25:52', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('521', '519', '1', null, null, '交流电流表', '各种交流电流表', null, null, null, '00190225232605NCWK502', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:26:06', '2019-02-25 23:26:06', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('522', '519', '1', null, null, '交流电压表', '', null, null, null, '00190225232611CTM2503', null, '10m*10m*10m', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:26:12', '2019-02-25 23:26:12', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('523', '519', '1', null, null, '直流电流表', '', null, null, null, '00190225232617K3US504', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:26:17', '2019-02-25 23:26:17', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('524', '519', '1', null, null, '直流电压表', '', null, null, null, '00190225232622QI3P505', null, '18m', '条', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:26:22', '2019-02-25 23:26:22', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('525', '519', '1', null, null, '频率表', '', null, null, null, '00190225232627T3OU506', null, '18m*18m', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:26:27', '2019-02-25 23:26:27', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('526', '519', '1', null, null, '功率表', '各种三相有功和无功功率表、因素表、音量表等', null, null, null, '00190225232634AXIH507', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:26:35', '2019-02-25 23:26:35', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('527', '520', '1', null, null, '数字万用表', '', null, null, null, '00190225232641PMTP508', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:26:42', '2019-02-25 23:26:42', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('528', '520', '1', null, null, '数字频率表', '', null, null, null, '00190225232647X0JQ509', null, '10m*10m*10m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:26:47', '2019-02-25 23:26:47', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('529', '520', '1', null, null, '其他数字式电表', '如：固定式数字电流表、数字钳形电流表、甲烷检测仪、甲烷遥测仪等', null, null, null, '00190225232700MBMM510', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:27:00', '2019-02-25 23:27:00', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('530', '520', '1', null, null, '机电式电能仪表', '各种单项电度表、单项防窃电电度表、三相三线有功电度表、三相四线有功电度表等', null, null, null, '00190225232712ZA6T511', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:27:13', '2019-02-25 23:27:13', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('531', '520', '1', null, null, '电子式电能仪表', '种单项电子电度表、电子式单项防窃电电度表等', null, null, null, '001902252327290ZZM512', null, '18mm*18mm*18mm', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:27:30', '2019-02-25 23:27:30', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('532', '508', '1', null, null, '经纬仪', '', null, null, null, '00190225232739EURR513', null, '18m', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:27:40', '2019-02-25 23:27:40', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('533', '508', '1', null, null, '水准仪', '', null, null, null, '00190225232744HKVD514', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:27:45', '2019-02-25 23:27:45', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('534', '508', '1', null, null, '平板仪', '', null, null, null, '0019022523274997QG515', null, '10m*10m*10m', '捆', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:27:49', '2019-02-25 23:27:49', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('535', '508', '1', null, null, '测距仪', '', null, null, null, '001902252327545IUT516', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:27:54', '2019-02-25 23:27:54', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('536', '508', '1', null, null, '垂准仪', '', null, null, null, '00190225232759LUC4517', null, '18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:28:00', '2019-02-25 23:28:00', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('537', '508', '1', null, null, '罗盘仪', '', null, null, null, '001902252328058A3H518', null, '18mm*18mm*18mm', '块', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:28:05', '2019-02-25 23:28:05', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('538', '508', '1', null, null, '望远镜', '', null, null, null, '00190225232809NBDB519', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:28:10', '2019-02-25 23:28:10', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('539', '26', '1', null, null, '量具', '', null, null, null, '001902252328245ORO520', null, '10cm*10cm*10cm', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:28:24', '2019-02-25 23:28:24', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('540', '26', '1', null, null, '刀具', '', null, null, null, '00190225232831E9HV521', null, '10m*10m*10m', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:28:31', '2019-02-25 23:28:31', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('541', '26', '1', null, null, '磨具磨料', '', null, null, null, '00190225232843Z2DO522', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:28:44', '2019-02-25 23:28:44', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('542', '26', '1', null, null, '气动工具', '', null, null, null, '001902252328565ORA523', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:28:56', '2019-02-25 23:28:56', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('543', '26', '1', null, null, '电动工具', '', null, null, null, '00190225232908RODF524', null, '18mm*18mm*18mm', '块', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:29:09', '2019-02-25 23:29:09', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('544', '26', '1', null, null, '普通工具', '', null, null, null, '00190225232923PGXE525', null, '18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:29:23', '2019-02-25 23:29:23', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('545', '26', '1', null, null, '衡器', '', null, null, null, '00190225232938YO9A526', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:29:38', '2019-02-25 23:29:38', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('546', '539', '1', null, null, '游标卡尺', '各种规格游标卡尺、带表游标卡尺、硬质合金游标卡尺', null, null, null, '00190225232952USOZ527', null, '10m*10m*10m', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:29:52', '2019-02-25 23:29:52', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('547', '539', '1', null, null, '千分尺', '各种规格内径千分尺、外径千分尺、其他千分尺等', null, null, null, '00190225233000ZD1W528', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:30:01', '2019-02-25 23:30:01', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('548', '539', '1', null, null, '角度量具', '各种规格角度尺、角尺等', null, null, null, '00190225233007VC6K529', null, '18m', '条', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:30:08', '2019-02-25 23:30:08', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('549', '539', '1', null, null, '铁路专用量具', '指轮径尺、轨道尺等', null, null, null, '00190225233016UAUH530', null, '18mm*18mm*18mm', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:30:16', '2019-02-25 23:30:16', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('550', '540', '1', null, null, '钻削刀具', '指各种麻花钻、扩孔钻、中心钻、钻头及钻杆等', null, null, null, '00190225233025WU2R531', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:30:25', '2019-02-25 23:30:25', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('551', '540', '1', null, null, '绞削刀具', '指各种手用绞刀、机用绞刀等', null, null, null, '00190225233036MWJW532', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:30:37', '2019-02-25 23:30:37', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('552', '540', '1', null, null, '铣削刀具', '指各种铣刀', null, null, null, '00190225233046WVJA533', null, '10m*10m*10m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:30:46', '2019-02-25 23:30:46', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('553', '540', '1', null, null, '螺纹加工刀具', '指各种手（机）用丝锥、圆板牙等', null, null, null, '00190225233054ESHY534', null, '10cm*10cm*10cm', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:30:55', '2019-02-25 23:30:55', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('554', '541', '1', null, null, '平行砂轮', '指各种平行砂轮', null, null, null, '00190225233105ZWMN535', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:31:05', '2019-02-25 23:31:05', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('555', '541', '1', null, null, '异行砂轮', '指各种斜边砂轮、单斜边砂轮、薄片砂轮、增强砂轮等', null, null, null, '00190225233112X6QE536', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:31:12', '2019-02-25 23:31:12', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('556', '541', '1', null, null, '油石', '指各种正方油石、长方油石、双面长方油石等', null, null, null, '00190225233119RW1C537', null, '18m', '条', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:31:20', '2019-02-25 23:31:20', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('557', '541', '1', null, null, '研磨和抛光材料', '指各种研磨砂、砂布、砂纸、研磨膏、凡尔砂等', null, null, null, '00190225233127J0QG538', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:31:28', '2019-02-25 23:31:28', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('558', '541', '1', null, null, '金刚石磨具', '指各种金刚石锯片、金刚砂等', null, null, null, '00190225233136WFJW539', null, '10m*10m*10m', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:31:37', '2019-02-25 23:31:37', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('559', '542', '1', null, null, '铆钉机、把', '指各种铆钉机、铆钉把等', null, null, null, '00190225233144XXPK540', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:31:45', '2019-02-25 23:31:45', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('560', '542', '1', null, null, '气镐、气铲', '指各种气镐、气铲、捣固机、除锈器等', null, null, null, '00190225233152LXLJ541', null, '18m*18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:31:52', '2019-02-25 23:31:52', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('561', '542', '1', null, null, '气钻、气扳机', '指各种气钻、气扳机等', null, null, null, '001902252332009UEG542', null, '18mm*18mm*18mm', '块', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:32:01', '2019-02-25 23:32:01', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('562', '542', '1', null, null, '气螺刀、气剪刀', '指各种气螺刀、气剪刀等', null, null, null, '00190225233209IYFB543', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:32:10', '2019-02-25 23:32:10', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('563', '543', '1', null, null, '金属切削类', '指各种电钻、电剪刀、曲线锯、往复锯等', null, null, null, '00190225233224WHOJ544', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:32:24', '2019-02-25 23:32:24', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('564', '543', '1', null, null, '磨砂类', '指各种抛光机', null, null, null, '001902252332328RVD545', null, '10m*10m*10m', '捆', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:32:33', '2019-02-25 23:32:33', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('565', '543', '1', null, null, '装配作业类', '指各种电动扳手、电动螺丝刀等', null, null, null, '00190225233239OV8Z546', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:32:40', '2019-02-25 23:32:40', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('566', '543', '1', null, null, '林木类', '指各种电刨、电刨刀、电木钻、电圆锯、电链锯等', null, null, null, '00190225233247RECX547', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:32:48', '2019-02-25 23:32:48', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('567', '543', '1', null, null, '建筑道路类', '指各种冲击电钻、混凝土钻孔机、石材切割机等', null, null, null, '001902252332549VFN548', null, '18mm*18mm*18mm', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:32:55', '2019-02-25 23:32:55', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('568', '544', '1', null, null, '线路、土、石瓦工工具', '指各种线路工具、土工工具、石工工具、瓦工工具等', null, null, null, '00190225233304XBKZ549', null, '18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:33:05', '2019-02-25 23:33:05', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('569', '544', '1', null, null, '钳工工具', '指扳手、螺丝刀、钳、剪、锤、锉刀、刮刀、钢锯、划线工具、管子工具、孔螺纹加工工具、砂轮辅助工具等', null, null, null, '00190225233312J4SN550', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:33:13', '2019-02-25 23:33:13', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('570', '544', '1', null, null, '锻工工具', '指八角锤、圆头锤、斩口锤、铁钻、花钻等', null, null, null, '00190225233320CHY8551', null, '10m*10m*10m', '捆', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:33:20', '2019-02-25 23:33:20', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('571', '544', '1', null, null, '焊工工具', '指乙炔发生器、焊炬、割炬、电烙铁、电焊钳等', null, null, null, '00190225233327UKA0552', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:33:27', '2019-02-25 23:33:27', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('572', '544', '1', null, null, '木工、油漆工具', '指木工锯条、绕锯、大锯、伐木锯、手扳锯、鸡尾锯、夹背锯、木工圆锯片、带锯条、滚刨、推刨刀、盖铁、长柄木钻、短柄木钻、木锉、木工斧、羊角锤、木工角尺、喷漆枪、油灰刀等', null, null, null, '00190225233336NCG4553', null, '18m', '条', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:33:36', '2019-02-25 23:33:36', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('573', '544', '1', null, null, '计测工具', '指钢直尺、钢卷尺、布卷尺、材积尺、外卡钳、内卡钳、木工平尺、铁水平尺、塞尺、等', null, null, null, '00190225233343AVVE554', null, '18mm*18mm*18mm', '块', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:33:43', '2019-02-25 23:33:43', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('574', '544', '1', null, null, '电工工具', '\"指接线钳、冷轧线钳、紧线钳、登杠脚板、脚\r\n扣、电工刀、剥线钳等\"', null, null, null, '00190225233350IVJD555', null, '6mm*6mm*6mm', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:33:51', '2019-02-25 23:33:51', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('575', '544', '1', null, null, '起重搬运工具', '指各种千斤顶、铁滑车、力车及配件等', null, null, null, '0019022523335894YB556', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:33:58', '2019-02-25 23:33:58', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('576', '544', '1', null, null, '包装及其他手用工具', '指各种开箱钳、养角起钉钳、断线钳、液压钢丝绳切断器、黄油枪等', null, null, null, '00190225233405XKNU557', null, '10m*10m*10m', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:34:06', '2019-02-25 23:34:06', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('577', '545', '1', null, null, '轨道衡', '指电子轨道衡、轨道衡等', null, null, null, '00190225233414D6HA558', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:34:14', '2019-02-25 23:34:14', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('578', '545', '1', null, null, '地上衡', '指杠杆地上衡、包盘地上衡、度盘地上衡、电子地上衡等', null, null, null, '00190225233424AAD5559', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:34:25', '2019-02-25 23:34:25', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('579', '545', '1', null, null, '地中衡', '指杠杆地中衡、度盘地中衡、电子汽车衡等', null, null, null, '00190225233433TEOY560', null, '18mm*18mm*18mm', '块', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:34:33', '2019-02-25 23:34:33', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('580', '545', '1', null, null, '电子秤', '指电子台秤、电子吊秤、电子计价秤、电子配料秤等', null, null, null, '00190225233440KBZB561', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:34:41', '2019-02-25 23:34:41', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('581', '545', '1', null, null, '案秤', '指案秤、弹簧刻度盘秤等', null, null, null, '00190225233448FDUC562', null, '10cm*10cm*10cm', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:34:49', '2019-02-25 23:34:49', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('582', '545', '1', null, null, '台秤', '各种规格台秤', null, null, null, '00190225233457GTSP563', null, '10m*10m*10m', '捆', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:34:58', '2019-02-25 23:34:58', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('583', '27', '1', null, null, '矿山工程机械', '', null, null, null, '00190225233527QGBB564', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:35:27', '2019-02-25 23:35:27', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('584', '27', '1', null, null, '起重运输机械', '', null, null, null, '00190225233550UBLQ565', null, '18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:35:51', '2019-02-25 23:35:51', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('585', '27', '1', null, null, '汽车内燃机和发电机组', '', null, null, null, '00190225233639RFZB566', null, '18m*18m', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:36:40', '2019-02-25 23:36:40', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('586', '27', '1', null, null, '通用机械', '', null, null, null, '00190225233650NEKO567', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:36:51', '2019-02-25 23:36:51', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('587', '27', '1', null, null, '金切断铸木工机械', '', null, null, null, '00190225233725R9GT568', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:37:25', '2019-02-25 23:37:25', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('588', '27', '1', null, null, '消防器材', '各种泡沫设备、灭火器、风火器、消火栓、灭火剂及其他消防器材等', null, null, null, '00190225233740MVF0569', null, '10m*10m*10m', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:37:41', '2019-02-25 23:37:41', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('589', '27', '1', null, null, '紧固件', '', null, null, null, '00190225233753ZUC3570', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:37:54', '2019-02-25 23:37:54', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('590', '28', '1', null, null, '焊接材料', '', null, null, null, '00190225233803E4YV571', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:38:03', '2019-02-25 23:38:03', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('591', '28', '1', null, null, '发电机', '各种小型交流同步发电机', null, null, null, '001902252338191A36572', null, '18mm*18mm*18mm', '块', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:38:20', '2019-02-25 23:38:20', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('592', '28', '1', null, null, '电动机', '\"各种一般交流电动机、吊车用异步电动机、\r\n防爆电动机等\"', null, null, null, '00190225233830VW3J573', null, '18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:38:31', '2019-02-25 23:38:31', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('593', '28', '1', null, null, '低压电器', '', null, null, null, '00190225233838H6AW574', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:38:39', '2019-02-25 23:38:39', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('594', '583', '1', null, null, '矿山机械', '', null, null, null, '00190225233857BZYV575', null, '10m*10m*10m', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:38:58', '2019-02-25 23:38:58', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('595', '583', '1', null, null, '工程机械', '', null, null, null, '00190225233907HQ6A576', null, '18m*18m', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:39:08', '2019-02-25 23:39:08', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('596', '583', '1', null, null, '建筑机械', '', null, null, null, '00190225233918RQPZ577', null, '18m', '条', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:39:19', '2019-02-25 23:39:19', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('597', '594', '1', null, null, '破碎机械', '各种复摆鄂式破碎机、锤式破碎机等', null, null, null, '00190225233934I643578', null, '18mm*18mm*18mm', '块', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:39:35', '2019-02-25 23:39:35', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('598', '594', '1', null, null, '筛分机械', '各种振动筛', null, null, null, '00190225233944HI7H579', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:39:45', '2019-02-25 23:39:45', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('599', '594', '1', null, null, '锻钎机械', '指风动锻钎机、液压锻钎机等', null, null, null, '00190225233954TD9L580', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:39:55', '2019-02-25 23:39:55', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('600', '594', '1', null, null, '提升机械', '指矿井提升机、凿井绞车、调度绞车、卷扬机等', null, null, null, '00190225234001LBBA581', null, '10m*10m*10m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:40:02', '2019-02-25 23:40:02', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('601', '595', '1', null, null, '推土机', '', null, null, null, '00190225234009QOEB582', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:40:09', '2019-02-25 23:40:09', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('602', '595', '1', null, null, '装载机', '', null, null, null, '001902252340147ND9583', null, '6mm*6mm*6mm', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:40:15', '2019-02-25 23:40:15', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('603', '595', '1', null, null, '工程起重机', '指汽车起重机\r\n指轮胎式起重机', null, null, null, '001902252340249WJF584', null, '18mm*18mm*18mm', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:40:24', '2019-02-25 23:40:24', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('604', '595', '1', null, null, '压路机', '', null, null, null, '00190225234029BW9Q585', null, '18m', '条', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:40:30', '2019-02-25 23:40:30', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('605', '595', '1', null, null, '挖掘机', '', null, null, null, '00190225234035K2LF586', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:40:35', '2019-02-25 23:40:35', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('606', '595', '1', null, null, '凿岩机械', '各种规格型号凿岩机、掘进钻机等', null, null, null, '00190225234043JXDD587', null, '10m*10m*10m', '捆', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:40:43', '2019-02-25 23:40:43', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('607', '596', '1', null, null, '铲运机械', '各种铲运机、断面挖沟机、平地机、蛙式打夯机、振动平板夯机、通用型翻斗车等', null, null, null, '0019022523405459MK588', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:40:55', '2019-02-25 23:40:55', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('608', '596', '1', null, null, '桩工机械', '各种柴油桩锤、振动桩锤、桩架等', null, null, null, '0019022523410133DJ589', null, '18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:41:02', '2019-02-25 23:41:02', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('609', '596', '1', null, null, '水泥搅拌机械', '\"各种混凝土搅拌机、灰浆搅拌机、混凝土泵、\r\n混凝土泵车、混凝土喷射机等\"', null, null, null, '00190225234108KG5P590', null, '18mm*18mm*18mm', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:41:09', '2019-02-25 23:41:09', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('610', '596', '1', null, null, '混凝土振动机械', '各种混凝土振动器、振动台、振动棒等', null, null, null, '00190225234120BG8W591', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:41:20', '2019-02-25 23:41:20', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('611', '596', '1', null, null, '钢筋和预应力机械', '各种预应力张拉机、液压泵、钢筋弯曲机、钢筋调直机、钢筋切料机、钢筋弯箍机等', null, null, null, '00190225234132NFOO592', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:41:32', '2019-02-25 23:41:32', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('612', '596', '1', null, null, '装修机械', '各种电动喷浆机、罐式喷涂机、地面水磨石机、高处装修吊篮等', null, null, null, '00190225234139F2HL593', null, '10m*10m*10m', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:41:40', '2019-02-25 23:41:40', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('613', '596', '1', null, null, '小型施工机具', '各种套丝切管机、钢筋镦头机、锯石机等', null, null, null, '00190225234155P2IT594', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:41:55', '2019-02-25 23:41:55', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('614', '584', '1', null, null, '桥式起重机', '各种电动单梁起重机、电动单梁悬挂起重机等', null, null, null, '0019022523421099SS595', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:42:10', '2019-02-25 23:42:10', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('615', '584', '1', null, null, '单、双钩桥式起重机', '各种单、双钩桥式起重机', null, null, null, '00190225234217B3FA596', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:42:18', '2019-02-25 23:42:18', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('616', '584', '1', null, null, '门式起重机', '各种门式起重机', null, null, null, '00190225234225BU4G597', null, '18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:42:26', '2019-02-25 23:42:26', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('617', '584', '1', null, null, '电动葫芦', '', null, null, null, '00190225234231B5E7598', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:42:31', '2019-02-25 23:42:31', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('618', '584', '1', null, null, '叉车', '', null, null, null, '0019022523423675IT599', null, '10m*10m*10m', '捆', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:42:36', '2019-02-25 23:42:36', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('619', '584', '1', null, null, '电梯、升降机', '', null, null, null, '00190225234241C6HY600', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:42:42', '2019-02-25 23:42:42', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('620', '584', '1', null, null, '手动起重机', '', null, null, null, '001902252342469CMH601', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:42:47', '2019-02-25 23:42:47', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('621', '584', '1', null, null, '手动葫芦', '各种手动葫芦、环链手扳葫芦、手扳葫芦等', null, null, null, '00190225234257JZ7D602', null, '18mm*18mm*18mm', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:42:57', '2019-02-25 23:42:57', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('622', '584', '1', null, null, '手动卷扬机', '', null, null, null, '001902252343020LZF603', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:43:03', '2019-02-25 23:43:03', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('623', '584', '1', null, null, '运输设备', '', null, null, null, '001902252343128YOJ604', null, '10cm*10cm*10cm', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:43:12', '2019-02-25 23:43:12', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('624', '623', '1', null, null, '带式运输机', '', null, null, null, '00190225234326YYTI605', null, '10m*10m*10m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:43:26', '2019-02-25 23:43:26', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('625', '623', '1', null, null, '斗式提升机', '', null, null, null, '001902252343325TIY606', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:43:33', '2019-02-25 23:43:33', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('626', '623', '1', null, null, '给料机', '', null, null, null, '00190225234338K6IK607', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:43:38', '2019-02-25 23:43:38', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('627', '623', '1', null, null, '电动平台', '', null, null, null, '001902252343448VZJ608', null, '18mm*18mm*18mm', '块', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:43:44', '2019-02-25 23:43:44', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('628', '585', '1', null, null, '汽车', '', null, null, null, '00190225234405PLN3609', null, '18m', '条', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:44:06', '2019-02-25 23:44:06', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('629', '585', '1', null, null, '内燃机', '各种柴油机、汽油机等', null, null, null, '00190225234415WL52610', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:44:16', '2019-02-25 23:44:16', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('630', '585', '1', null, null, '内燃发电机组', '', null, null, null, '00190225234428CD5T611', null, '10m*10m*10m', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:44:29', '2019-02-25 23:44:29', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('631', '628', '1', null, null, '载货汽车', '各种载货汽车', null, null, null, '001902252344414OM3612', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:44:42', '2019-02-25 23:44:42', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('632', '628', '1', null, null, '专用汽车', '\"各种加油车、运油车、自卸汽车、散装水泥\r\n运输车、厢式工具车等\"', null, null, null, '00190225234449KAKJ613', null, '18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:44:49', '2019-02-25 23:44:49', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('633', '630', '1', null, null, '柴油发电机组', '各种功率的柴油发电机组', null, null, null, '001902252344589RLO614', null, '18mm*18mm*18mm', '块', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:44:59', '2019-02-25 23:44:59', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('634', '630', '1', null, null, '汽油发电机组', '各种功率的汽油发电机组', null, null, null, '00190225234505WQ2E615', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:45:06', '2019-02-25 23:45:06', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('635', '586', '1', null, null, '泵', '各种离心清水泵\r\n\"各种锅炉给水泵、热水循环泵、井用泵、潜水电泵、杂\r\n质泵等\"\r\n各种手动试压泵、电动试压泵、手摇泵等', null, null, null, '00190225234518UO0Q616', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:45:19', '2019-02-25 23:45:19', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('636', '586', '1', null, null, '气体压缩机', '各种空气压缩机、\r\n各种空压机辅助设备', null, null, null, '00190225234546XZS3617', null, '10m*10m*10m', '捆', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:45:46', '2019-02-25 23:45:46', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('637', '586', '1', null, null, '压力容器', '', null, null, null, '00190225234558M6DO618', null, '10cm*10cm*10cm', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:45:59', '2019-02-25 23:45:59', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('638', '586', '1', null, null, '制冷设备', '', null, null, null, '00190225234611OVH0619', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:46:11', '2019-02-25 23:46:11', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('639', '586', '1', null, null, '阀门', '', null, null, null, '00190225234620NIHQ620', null, '18mm*18mm*18mm', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:46:20', '2019-02-25 23:46:20', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('640', '637', '1', null, null, '钢瓶类压力容器', '各种氧气瓶、氢气瓶、氮气瓶、氯气瓶、乙炔气瓶等', null, null, null, '00190225234641OUJE621', null, '18m*18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:46:42', '2019-02-25 23:46:42', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('641', '637', '1', null, null, '储存容器', '各种储气罐、真空收集罐、蓄压器、碱液箱等', null, null, null, '00190225234649UL3M622', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:46:50', '2019-02-25 23:46:50', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('642', '638', '1', null, null, '冷却设备', '各种冷冻冷藏设备及辅机、冷却塔等', null, null, null, '00190225234702SDG2623', null, '10m*10m*10m', '捆', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:47:02', '2019-02-25 23:47:02', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('643', '638', '1', null, null, '空调设备', '各种空调器、除湿机等', null, null, null, '00190225234710ZVL6624', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:47:10', '2019-02-25 23:47:10', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('644', '639', '1', null, null, '高、中压阀门', '各种楔式阀门、法兰截止阀、角式截止阀、浮动直通式球阀、弹簧微启式安全阀等', null, null, null, '00190225234734BRNK625', null, '18m', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:47:34', '2019-02-25 23:47:34', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('645', '639', '1', null, null, '低压阀门', '各种内螺纹暗杆和明杆楔式阀门、明杆和暗杆平行双闸板闸阀、内螺纹截止阀、法兰截止阀、止回阀等', null, null, null, '00190225234742XZST626', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:47:42', '2019-02-25 23:47:42', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('646', '639', '1', null, null, '钢瓶阀门', '\"各种截断塞门、氧气瓶阀、氯气瓶阀、氮气瓶阀、乙炔\r\n瓶阀等\"', null, null, null, '001902252347495LT2627', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:47:50', '2019-02-25 23:47:50', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('647', '639', '1', null, null, '塑料阀门', '各种聚氯乙烯截止阀等', null, null, null, '00190225234758FW7C628', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:47:58', '2019-02-25 23:47:58', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('648', '639', '1', null, null, '其他阀门', '各种电磁阀、换向阀、控制阀等', null, null, null, '00190225234806Z7FT629', null, '10m*10m*10m', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:48:06', '2019-02-25 23:48:06', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('649', '587', '1', null, null, '金属切削机床', '', null, null, null, '00190225234823X1SX630', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:48:24', '2019-02-25 23:48:24', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('650', '587', '1', null, null, '砂轮机', '', null, null, null, '00190225234829YPWC631', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:48:29', '2019-02-25 23:48:29', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('651', '649', '1', null, null, '车床', '各种仪表车床、自动车床、转塔车床、曲轴车床、立式车床、落地车床、普通车床、马鞍车床、车轮车床等', null, null, null, '00190225234842MJMD632', null, '18mm*18mm*18mm', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:48:42', '2019-02-25 23:48:42', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('652', '649', '1', null, null, '钻床', '各种摇臂钻床、万向摇臂钻床、台式钻床、立式钻床等', null, null, null, '001902252348521G2F633', null, '18m', '条', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:48:53', '2019-02-25 23:48:53', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('653', '649', '1', null, null, '镗床', '\"\r\n各种深空钻镗床、单柱座标镗床、双柱座标镗床、卧式铣镗床、镗缸机等\r\n\"', null, null, null, '00190225234900SIUR634', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:49:01', '2019-02-25 23:49:01', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('654', '649', '1', null, null, '磨床', '各种无心磨床、外圆磨床、内圆磨床、车刀刃磨床等', null, null, null, '00190225234908TBN0635', null, '10m*10m*10m', '捆', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:49:09', '2019-02-25 23:49:09', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('655', '649', '1', null, null, '铣床', '各种铣床等', null, null, null, '001902252349171J2D636', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:49:17', '2019-02-25 23:49:17', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('656', '649', '1', null, null, '刨插拉床', '各种刨床、插床、拉床等', null, null, null, '001902252349245WXL637', null, '18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:49:25', '2019-02-25 23:49:25', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('657', '649', '1', null, null, '其他机床', '如：多功能工具机等', null, null, null, '00190225234932WOCO638', null, '18mm*18mm*18mm', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:49:33', '2019-02-25 23:49:33', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('658', '650', '1', null, null, '台式砂轮机', '', null, null, null, '00190225234941UVKP639', null, '6mm*6mm*6mm', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:49:42', '2019-02-25 23:49:42', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('659', '650', '1', null, null, '立式砂轮机', '', null, null, null, '00190225234946DEL8640', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:49:47', '2019-02-25 23:49:47', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('660', '650', '1', null, null, '手提式砂轮机', '', null, null, null, '001902252349524H3E641', null, '10m*10m*10m', '捆', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:49:52', '2019-02-25 23:49:52', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('661', '650', '1', null, null, '其他砂轮机', '如：双重绝缘单相砂轮机、软轴式砂轮机等', null, null, null, '00190225235000Z5IZ642', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:50:00', '2019-02-25 23:50:00', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('662', '589', '1', null, null, '螺栓类', '各种六角头螺栓、方头螺栓、半园头螺栓等', null, null, null, '001902252350218WQ2643', null, '6mm*6mm*6mm', '张', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:50:22', '2019-02-25 23:50:22', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('663', '589', '1', null, null, '螺钉类', '各种自攻螺钉、园柱螺钉、沉头螺钉等', null, null, null, '00190225235030YIRZ644', null, '18mm*18mm*18mm', '块', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:50:30', '2019-02-25 23:50:30', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('664', '589', '1', null, null, '螺母类', '各种方螺母、六角螺母、蝶形螺母、扣紧螺母等', null, null, null, '00190225235037WHQ6645', null, '18m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:50:38', '2019-02-25 23:50:38', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('665', '589', '1', null, null, '铆钉', '各种半园头铆钉、沉头铆钉、平头铆钉等', null, null, null, '00190225235046KWKW646', null, '18m*18m', '扎', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:50:46', '2019-02-25 23:50:46', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('666', '589', '1', null, null, '销', '各种开口销、销轴等', null, null, null, '00190225235058EOT4647', null, '10m*10m*10m', '包', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:50:58', '2019-02-25 23:50:58', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('667', '590', '1', null, null, '电焊条', '各种结构钢焊条、特殊焊条、不锈钢焊条、堆焊焊条、铸铁焊条和有色金属焊条等', null, null, null, '00190225235114GXOM648', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:51:14', '2019-02-25 23:51:14', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('668', '590', '1', null, null, '电焊条附件', '各种有色金属焊丝、铸铁焊丝、实芯焊丝、药芯焊丝、焊料、焊粉、焊剂等', null, null, null, '00190225235122SWH7649', null, '18m', '条', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:51:23', '2019-02-25 23:51:23', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('669', '593', '1', null, null, '自动化电器元件', '各种电压调整器、稳压器等', null, null, null, '00190225235133ZWJQ650', null, '18mm*18mm*18mm', '块', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:51:34', '2019-02-25 23:51:34', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('670', '593', '1', null, null, '直流快速断路器', '各种直流快速断路器', null, null, null, '00190225235141RZRC651', null, '18m*18m', '组', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:51:41', '2019-02-25 23:51:41', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('671', '593', '1', null, null, '机床电器', '各种机床用交流接触器', null, null, null, '00190225235150NRQ6652', null, '10cm*10cm*10cm', '个', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:51:50', '2019-02-25 23:51:50', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('672', '593', '1', null, null, '隔爆电器', '各种隔爆型自动空气开关、隔爆照明开关、隔爆照明配电盘、隔爆型接线盒、隔爆熔断器盒、隔爆型照明灯、防暴插座等', null, null, null, '00190225235159J5HF653', null, '10m*10m*10m', '颗', '0', null, '0.0000', null, null, null, null, null, '2019-02-25 23:52:00', '2019-02-25 23:52:00', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('673', '-1', '10', null, null, '邯钢有限公司目录', null, null, null, null, '00190308233758AS2K01', null, null, null, null, null, null, null, null, null, null, null, '2019-03-08 23:37:58', '2019-03-08 23:37:58', '1', '1', null);
INSERT INTO `price_goods_contact` VALUES ('675', '-1', '12', null, null, '广东影视业轨道有限公司', null, null, null, null, '00190309000844PFD802', null, null, null, null, null, null, null, null, null, null, null, '2019-03-09 00:08:45', '2019-03-09 00:08:45', '1', '1', null);

-- ----------------------------
-- Table structure for price_goods_copier
-- ----------------------------
DROP TABLE IF EXISTS `price_goods_copier`;
CREATE TABLE `price_goods_copier` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `catalog_id` int(5) DEFAULT NULL,
  `is_read` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `copier` int(5) DEFAULT NULL,
  `create_user_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of price_goods_copier
-- ----------------------------

-- ----------------------------
-- Table structure for price_goods_limit
-- ----------------------------
DROP TABLE IF EXISTS `price_goods_limit`;
CREATE TABLE `price_goods_limit` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `goods_code` varchar(255) DEFAULT NULL,
  `price_max` double(10,4) DEFAULT NULL,
  `price_min` double(10,4) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_user_id` int(5) DEFAULT NULL,
  `update_user_id` int(5) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of price_goods_limit
-- ----------------------------
INSERT INTO `price_goods_limit` VALUES ('5', '00190225212409I0AZ11', '20.0000', '10.0000', '2019-03-13 00:00:00', '2019-03-14 00:00:00', '2019-03-08 23:23:30', '2019-03-08 23:23:30', '1', '1', '');
INSERT INTO `price_goods_limit` VALUES ('6', '00190225212927PO1B25', '1500.0000', '1000.0000', '2019-03-16 00:00:00', '2019-04-01 00:00:00', '2019-03-09 23:13:28', '2019-03-09 23:13:28', '1', '1', '');

-- ----------------------------
-- Table structure for price_goods_process
-- ----------------------------
DROP TABLE IF EXISTS `price_goods_process`;
CREATE TABLE `price_goods_process` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `catalog_id` int(5) DEFAULT NULL,
  `approver_id` int(5) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `operate` varchar(255) DEFAULT NULL,
  `remaining_approvers` varchar(255) DEFAULT NULL,
  `transfer_approvers` varchar(255) DEFAULT NULL,
  `approval_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of price_goods_process
-- ----------------------------

-- ----------------------------
-- Table structure for purchase_inquiry
-- ----------------------------
DROP TABLE IF EXISTS `purchase_inquiry`;
CREATE TABLE `purchase_inquiry` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `goods_id` int(5) DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `number` int(10) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  `arriveTime` datetime DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `paied` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_user_id` int(5) DEFAULT NULL,
  `update_user_id` int(5) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of purchase_inquiry
-- ----------------------------
INSERT INTO `purchase_inquiry` VALUES ('2', '96', '8', '100', '10.80', '2019-02-22 00:00:00', '海南省沙海县文华路局', 'D', '00190223230946XXE000', '2019-02-23 23:09:46', '2019-02-23 23:09:46', null, null, '', 'Y');
INSERT INTO `purchase_inquiry` VALUES ('3', '35', '8', '100', '1101.00', '2019-03-21 00:00:00', '广东珠海黄浦路道', 'C', '001903041536443SCO00', '2019-03-04 15:36:45', '2019-03-04 15:36:45', '1', '1', '', 'Y');
INSERT INTO `purchase_inquiry` VALUES ('4', '84', '8', '1000', '1025.00', '2019-03-28 00:00:00', '北京市大兴区魏善庄镇龙海路3号237室', 'B', '00190304162931EGUB00', '2019-03-04 16:29:32', '2019-03-04 16:29:32', null, null, '', 'Y');
INSERT INTO `purchase_inquiry` VALUES ('5', '266', '8', '10', '300.00', '2019-03-14 00:00:00', '广东黄海海运船坞渡口', 'A', '00190305201856YLPT00', '2019-03-05 20:18:56', '2019-03-05 20:18:56', '1', '1', '', 'Y');
INSERT INTO `purchase_inquiry` VALUES ('6', '237', '8', '10', '39.00', '2019-03-02 00:00:00', '湖南省邯钢市邯谭县南环路58区18号', 'D', '00190305203740GGRW00', '2019-03-05 20:37:41', '2019-03-05 20:37:41', '1', '1', '', 'Y');
INSERT INTO `purchase_inquiry` VALUES ('7', '201', '8', '10', '150.00', '2019-03-11 00:00:00', '大连港大连仓储水运公司', 'A', '00190308224311BXQF00', '2019-03-08 22:43:12', '2019-03-08 22:43:12', '1', '1', '', 'Y');
INSERT INTO `purchase_inquiry` VALUES ('8', '158', '8', '10', '30.00', '2019-03-12 00:00:00', '深圳市钢铁工业生产基地', 'B', '001903082245186RFF02', '2019-03-08 22:45:19', '2019-03-08 22:45:19', '1', '1', '', 'Y');
INSERT INTO `purchase_inquiry` VALUES ('9', '498', '8', '10', '3.00', '2019-03-12 00:00:00', '重庆市渝北区金渝大道99号汽博中心内文化广场', 'C', '00190309222102XTR300', '2019-03-09 22:21:02', '2019-03-09 22:21:02', '1', '1', '', 'N');
INSERT INTO `purchase_inquiry` VALUES ('10', '446', '8', '5', '10.00', '2019-03-21 00:00:00', '华南交易中心九号仓库35号', 'B', '00190309234701X4SM01', '2019-03-09 23:47:01', '2019-03-09 23:47:01', '1', '1', '', 'N');
INSERT INTO `purchase_inquiry` VALUES ('11', '416', '8', '10', '10.00', '2019-03-23 00:00:00', '南方交易中心第九街区8号仓库', 'B', '00190309234921NMPM02', '2019-03-09 23:49:22', '2019-03-09 23:49:22', '1', '1', '', 'N');

-- ----------------------------
-- Table structure for purchase_order
-- ----------------------------
DROP TABLE IF EXISTS `purchase_order`;
CREATE TABLE `purchase_order` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `inquiry_id` int(5) DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `introduce` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `transport` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `arriveTime` datetime DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of purchase_order
-- ----------------------------
INSERT INTO `purchase_order` VALUES ('1', '2', '1', '测试订单01', '111', null, 'A', 'S', '2019-03-04 20:33:25', '00190224001720F9LE00', '2019-02-24 00:17:21', '2019-02-24 00:17:30', '1', '1', '11');
INSERT INTO `purchase_order` VALUES ('2', '2', '1', '测试订单02', '111', null, 'B', 'S', '2019-03-08 21:12:40', '00190224001748NTQ601', '2019-02-24 00:17:49', '2019-02-24 00:17:49', '1', '1', '');
INSERT INTO `purchase_order` VALUES ('3', '2', '1', '测试订单03', '测试', null, 'E', 'S', '2019-02-24 22:02:15', '00190224214143Y8IV00', '2019-02-24 21:41:44', '2019-02-24 21:41:44', '1', '1', '');
INSERT INTO `purchase_order` VALUES ('4', '5', '3', '液压油机床油', '库存不足，需购买', null, 'B', 'S', '2019-03-09 22:25:14', '00190305203924BLNN01', '2019-03-05 20:39:24', '2019-03-05 20:39:24', '1', '1', '');
INSERT INTO `purchase_order` VALUES ('5', '7', '8', '购买油脂', '油脂库存不足！', null, 'C', 'S', '2019-03-08 22:46:21', '00190308224407FTR201', '2019-03-08 22:44:07', '2019-03-08 22:44:07', '1', '1', '');
INSERT INTO `purchase_order` VALUES ('6', '8', '8', '购买圆钢钉', '库存钢钉不足！', null, 'B', 'F', null, '00190308224601Q9F703', '2019-03-08 22:46:02', '2019-03-08 22:46:02', '1', '1', '');
INSERT INTO `purchase_order` VALUES ('7', '6', '8', '购买石棉水泥瓦', '库存缺少！', null, 'C', 'P', null, '00190309001728JJN800', '2019-03-09 00:17:28', '2019-03-09 00:17:28', '1', '1', '');
INSERT INTO `purchase_order` VALUES ('8', '8', '8', '购买圆钢钉', '库存圆钢钉少于10盒，需要购买！', null, 'B', 'A', null, '001903092224539ESI00', '2019-03-09 22:24:53', '2019-03-09 22:24:53', '1', '1', '');

-- ----------------------------
-- Table structure for purchase_receiving
-- ----------------------------
DROP TABLE IF EXISTS `purchase_receiving`;
CREATE TABLE `purchase_receiving` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `order_id` int(5) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_user_id` int(5) DEFAULT NULL,
  `update_user_id` int(5) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of purchase_receiving
-- ----------------------------
INSERT INTO `purchase_receiving` VALUES ('3', '2', 'P', '001902242107499RWE02', '2019-02-24 21:07:49', '2019-02-24 21:07:49', '1', '1', '');
INSERT INTO `purchase_receiving` VALUES ('4', '3', 'P', '00190224215304CZQY00', '2019-02-24 21:53:04', '2019-02-24 22:37:00', null, '1', '');
INSERT INTO `purchase_receiving` VALUES ('5', '1', 'F', '001903042033245AUW00', '2019-03-04 20:33:25', '2019-03-04 20:33:25', '1', '1', null);
INSERT INTO `purchase_receiving` VALUES ('6', '1', 'P', '00190304203553GWDN00', '2019-03-04 20:35:53', '2019-03-04 20:35:53', '1', '1', '');
INSERT INTO `purchase_receiving` VALUES ('7', '5', 'F', '00190308224621TYSJ04', '2019-03-08 22:46:22', '2019-03-08 22:46:22', '1', '1', null);
INSERT INTO `purchase_receiving` VALUES ('8', '5', 'P', '00190308224659YN6F05', '2019-03-08 22:47:00', '2019-03-08 22:47:00', '1', '1', '');
INSERT INTO `purchase_receiving` VALUES ('9', '4', 'A', '00190309222514KJYI01', '2019-03-09 22:25:14', '2019-03-09 22:25:14', null, null, null);

-- ----------------------------
-- Table structure for storage_incoming
-- ----------------------------
DROP TABLE IF EXISTS `storage_incoming`;
CREATE TABLE `storage_incoming` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `receiving_id` int(5) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_user_id` int(5) DEFAULT NULL,
  `update_user_id` int(5) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of storage_incoming
-- ----------------------------
INSERT INTO `storage_incoming` VALUES ('3', '3', 'P', '00190224233010W2ZN02', '2019-02-24 23:30:11', '2019-02-24 23:30:11', '1', '1', '');
INSERT INTO `storage_incoming` VALUES ('5', '6', 'F', '00190304203731JXMH01', '2019-03-04 20:37:32', '2019-03-04 20:37:32', '1', '1', '');
INSERT INTO `storage_incoming` VALUES ('6', '6', 'P', '00190304203745UMGC02', '2019-03-04 20:37:46', '2019-03-04 20:37:46', '1', '1', '');
INSERT INTO `storage_incoming` VALUES ('7', '8', 'P', '00190308224811HYQF06', '2019-03-08 22:48:11', '2019-03-08 22:48:11', '1', '1', '');
INSERT INTO `storage_incoming` VALUES ('8', '4', 'A', '00190309222723H2F802', '2019-03-09 22:27:24', '2019-03-09 22:27:24', null, null, null);

-- ----------------------------
-- Table structure for storage_sending
-- ----------------------------
DROP TABLE IF EXISTS `storage_sending`;
CREATE TABLE `storage_sending` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `goods_id` int(5) DEFAULT NULL,
  `department_id` int(5) DEFAULT NULL,
  `number` int(10) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_user_id` int(5) DEFAULT NULL,
  `update_user_id` int(5) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of storage_sending
-- ----------------------------
INSERT INTO `storage_sending` VALUES ('1', '42', '2', '1', 'P', '00190225005741C90900', '2019-02-25 00:57:42', '2019-02-25 01:01:29', '1', '1', '');
INSERT INTO `storage_sending` VALUES ('3', '16', '9', '1', 'F', '00190225010213AHWF01', '2019-02-25 01:02:13', '2019-02-25 01:02:13', '1', '1', '');
INSERT INTO `storage_sending` VALUES ('4', '43', '8', '12', 'A', '001903041726456U0A00', '2019-03-04 17:26:45', '2019-03-04 17:26:45', null, null, '111');
INSERT INTO `storage_sending` VALUES ('5', '30', '17', '1', 'A', '00190304174234HNQC00', '2019-03-04 17:42:34', '2019-03-04 17:42:34', null, null, '11');

-- ----------------------------
-- Table structure for supplier_company
-- ----------------------------
DROP TABLE IF EXISTS `supplier_company`;
CREATE TABLE `supplier_company` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `credit_rating` varchar(255) DEFAULT NULL,
  `production_capacity` varchar(255) DEFAULT NULL,
  `quality` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_user_id` int(5) DEFAULT NULL,
  `update_user_id` int(5) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of supplier_company
-- ----------------------------
INSERT INTO `supplier_company` VALUES ('1', '广东省韩资铁轨企业有限公司', '00190222155343AVZP00', '222828@wwp.com', '广东省越秀区皇城大道9号尾巷', '27291991', 'P', 'A', '/company/img/2019/3/3/201903032255560001.jpg', null, '2019-02-22 15:53:44', '2019-03-08 20:25:41', '1', '1', '');
INSERT INTO `supplier_company` VALUES ('3', '湖南省邯钢企业有限公司', '00190222161256YJPM01', '888889999@hangang.com', '湖南省邯钢市区邯钢街道78号', '166680098090', 'P', 'B', '/company/img/2019/3/3/201903032255560001.jpg', null, '2019-02-22 16:12:57', '2019-03-05 20:35:38', '1', '1', '');
INSERT INTO `supplier_company` VALUES ('5', '广西省壮族煤炭有限公司', '00190222163512A6UF00', 'zhuangzu@meitan.com', '广西省摊销区北鲁东路80号', '17987900800', 'F', 'B', '/company/img/2019/3/3/201903032255560001.jpg', null, '2019-02-22 16:35:12', '2019-03-09 00:09:03', '1', '1', '');
INSERT INTO `supplier_company` VALUES ('6', '海南头叶子钢铁有限公司', '00190222163651625U01', 'touyezi@qq.com', '海南省湖州县南环中路98号', '17198373903', 'P', 'B', '/company/img/2019/3/3/201903032255430000.jpg', null, '2019-02-22 16:36:52', '2019-03-09 21:46:41', '1', '1', '');
INSERT INTO `supplier_company` VALUES ('7', '广东影视业轨道有限公司', '00190303223902NJ5S00', 'guangdongyingshiye@qq.com', '广东省广州市黄浦区北巷九行18栋23号', '880-880230', 'P', 'A', '/company/img/2019/3/3/201903032239020000.jpg', null, '2019-03-03 22:39:02', '2019-03-04 15:35:41', '1', '1', '');
INSERT INTO `supplier_company` VALUES ('8', '中国铁路物资总局', '00190308194717S27W00', 'chinaTrain@way.com', '北京市西城区鹿华路琳28号', '888888888', 'P', 'A', '/company/img/2019/3/8/201903081947170000.jpg', null, '2019-03-08 19:47:18', '2019-03-08 19:47:23', '1', '1', '');
INSERT INTO `supplier_company` VALUES ('9', '重庆永磊机电设备有限公司', '00190309214428HHIP00', 'yongbeng@163.com', '重庆市九龙坡区杨家坪西郊路33号1-30-5', '18571322222', 'A', 'A', '/company/img/2019/3/9/201903092144280000.jpg', null, '2019-03-09 21:44:29', '2019-03-09 21:44:29', '1', '1', '');
INSERT INTO `supplier_company` VALUES ('10', '四川浩铁仪器仪表公司', '00190309233724IQN500', 'cdtltx@163.com', '成都市武侯区佳灵路18号13幢1楼353号', '028-69953774', 'A', 'C', '/company/img/2019/3/9/201903092337240000.jpg', null, '2019-03-09 23:37:24', '2019-03-09 23:37:24', null, null, '');
INSERT INTO `supplier_company` VALUES ('11', '天水通号电力设备有限公司', '0019030923383255EA01', 'tsthdl@163.com', '甘肃省天水市秦州区红山路98号', '0938-4982375', 'A', 'B', '/company/img/2019/3/9/201903092338320001.jpg', null, '2019-03-09 23:38:32', '2019-03-09 23:38:32', null, null, '');
INSERT INTO `supplier_company` VALUES ('12', '兰州银利电器设备有限责任公司', '00190309233950ROO302', 'yldq2009@163.com', '兰州市城关区张苏滩579号东区3号楼', '0931-8551118', 'A', 'B', '/company/img/2019/3/9/201903092339500002.jpg', null, '2019-03-09 23:39:51', '2019-03-09 23:39:51', null, null, '');
INSERT INTO `supplier_company` VALUES ('13', '卧龙电气银川变压器有限公司', '00190309234515551K00', 'ybzhb@wolong.com', '宁夏银川市兴庆区科技园兴源路221号', '0951-6910117', 'A', 'A', '/company/img/2019/3/9/201903092345150000.jpg', null, '2019-03-09 23:45:15', '2019-03-09 23:45:15', '1', '1', '');

-- ----------------------------
-- Table structure for sys_department
-- ----------------------------
DROP TABLE IF EXISTS `sys_department`;
CREATE TABLE `sys_department` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `parent_id` int(5) DEFAULT NULL COMMENT '父部门id',
  `name` varchar(255) DEFAULT NULL COMMENT '部门名称',
  `introduce` varchar(255) DEFAULT NULL COMMENT '详细介绍',
  `create_time` datetime DEFAULT NULL,
  `upadte_time` datetime DEFAULT NULL,
  `create_user_id` int(5) DEFAULT NULL,
  `update_user_id` int(5) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_department
-- ----------------------------
INSERT INTO `sys_department` VALUES ('1', '-1', '青年之家', null, '2019-02-13 17:21:32', '2019-02-13 17:21:35', '1', '1', null);
INSERT INTO `sys_department` VALUES ('2', '1', '综合部', '承担局机关日常运转、政务公开、新闻发布、财务和资产管理等工作。组织监测分析铁路运行情况，组织开展铁路行业统计工作。承担国际、港澳台地区交流合作事务及外事工作。', '2019-02-14 00:20:26', '2019-02-25 20:55:42', '1', '1', null);
INSERT INTO `sys_department` VALUES ('8', '1', '科技研发部', '组织拟订铁路技术标准，承担铁路技术监督工作，推动铁路科技创新。组织起草铁路监督管理的法律法规、规章草案，参与研究铁路发展规划、政策和体制改革工作，承担行政复议、行政应诉工作。', '2019-02-17 22:24:30', '2019-03-04 21:00:17', '1', '1', null);
INSERT INTO `sys_department` VALUES ('9', '1', '安全管理部', '研究分析铁路安全形势、存在问题并提出完善制度机制建议。组织拟订铁路安全监督管理办法并监督实施，组织或参与铁路生产安全事故调查处理，指导、监督铁路行政执法工作。', '2019-02-17 22:24:48', '2019-03-04 20:55:31', '1', '1', null);
INSERT INTO `sys_department` VALUES ('10', '2', '办公室', '', '2019-02-25 20:55:58', '2019-03-04 21:01:09', '1', '1', null);
INSERT INTO `sys_department` VALUES ('11', '2', '秘书处', '', '2019-02-25 20:56:10', '2019-02-25 20:56:10', '1', '1', null);
INSERT INTO `sys_department` VALUES ('12', '2', '综合处', '', '2019-02-25 20:56:31', '2019-02-25 20:56:31', '1', '1', null);
INSERT INTO `sys_department` VALUES ('13', '2', '财务处', '', '2019-02-25 20:56:40', '2019-02-25 20:56:40', '1', '1', null);
INSERT INTO `sys_department` VALUES ('14', '2', '预算管理处', '', '2019-02-25 20:56:52', '2019-02-25 20:56:52', '1', '1', null);
INSERT INTO `sys_department` VALUES ('17', '8', '技术标准一部', '', '2019-02-25 20:58:18', '2019-03-04 21:00:32', '1', '1', null);
INSERT INTO `sys_department` VALUES ('18', '8', '技术标准二部', '', '2019-02-25 20:58:28', '2019-03-04 21:00:39', '1', '1', null);
INSERT INTO `sys_department` VALUES ('19', '8', '技术标准三部', '', '2019-02-25 20:58:38', '2019-03-04 21:00:48', '1', '1', null);
INSERT INTO `sys_department` VALUES ('20', '8', '技术标准四部', '', '2019-02-25 20:58:47', '2019-03-04 21:00:58', '1', '1', null);
INSERT INTO `sys_department` VALUES ('21', '9', '安全监察一部', '', '2019-02-25 20:59:46', '2019-03-04 20:54:06', '1', '1', null);
INSERT INTO `sys_department` VALUES ('22', '9', '安全监察二部', '', '2019-02-25 20:59:57', '2019-03-04 20:54:16', '1', '1', null);
INSERT INTO `sys_department` VALUES ('23', '9', '安全监察三部', '', '2019-02-25 21:00:10', '2019-03-04 20:54:27', '1', '1', null);
INSERT INTO `sys_department` VALUES ('24', '9', '安全监察四部', '', '2019-02-25 21:00:18', '2019-03-04 20:54:37', '1', '1', null);
INSERT INTO `sys_department` VALUES ('25', '9', '安全监察五部', '', '2019-02-25 21:00:39', '2019-03-04 20:54:49', '1', '1', null);
INSERT INTO `sys_department` VALUES ('26', '1', '运输管理部', '组织监督铁路运输安全、铁路运输服务质量、铁路企业承担国家规定的公益性运输任务情况，严格按照法律法规规定的条件和程序办理铁路运输有关行政许可并承担相应责任，组织拟订规范铁路运输市场秩序政策措施并监督实施。', '2019-02-25 21:01:06', '2019-03-04 20:55:48', '1', '1', null);
INSERT INTO `sys_department` VALUES ('27', '26', '陆运部', '', '2019-02-25 21:01:26', '2019-03-04 20:56:18', '1', '1', null);
INSERT INTO `sys_department` VALUES ('28', '26', '水运部', '', '2019-02-25 21:01:37', '2019-03-04 20:56:28', '1', '1', null);
INSERT INTO `sys_department` VALUES ('29', '26', '空运部', '', '2019-02-25 21:02:17', '2019-03-04 20:56:37', '1', '1', null);
INSERT INTO `sys_department` VALUES ('30', '1', '工程管理部', '组织拟订规范铁路工程建设市场秩序政策措施并监督实施，组织监督铁路工程质量安全和工程建设招标投标工作。', '2019-02-25 21:09:57', '2019-03-04 20:57:18', '1', '1', null);
INSERT INTO `sys_department` VALUES ('31', '30', '工程管理一部', '', '2019-02-25 21:10:13', '2019-03-04 20:57:45', '1', '1', null);
INSERT INTO `sys_department` VALUES ('32', '30', '工程管理二部', '', '2019-02-25 21:10:22', '2019-03-04 20:57:56', '1', '1', null);
INSERT INTO `sys_department` VALUES ('33', '30', '工程管理三部', '', '2019-02-25 21:10:30', '2019-03-04 20:58:03', '1', '1', null);
INSERT INTO `sys_department` VALUES ('34', '1', '设备管理部', '组织监督铁路设备产品质量安全，严格按照法律法规规定的条件和程序办理铁路机车车辆设计生产维修进口许可、铁路运输安全设备生产企业认定等行政许可并承担相应责任。', '2019-02-25 21:10:46', '2019-03-04 20:58:35', '1', '1', null);
INSERT INTO `sys_department` VALUES ('35', '34', '设备管理一部', '', '2019-02-25 21:10:58', '2019-03-04 20:58:48', '1', '1', null);
INSERT INTO `sys_department` VALUES ('36', '34', '设备管理二部', '', '2019-02-25 21:11:18', '2019-03-04 20:58:56', '1', '1', null);
INSERT INTO `sys_department` VALUES ('37', '34', '设备管理三部', '', '2019-02-25 21:11:26', '2019-03-04 20:59:04', '1', '1', null);
INSERT INTO `sys_department` VALUES ('38', '1', '人事管理部', '承担局机关和局属单位的人事管理、机构编制、队伍建设等工作。负责局机关退休干部工作。', '2019-02-25 21:11:43', '2019-03-04 20:59:33', '1', '1', null);
INSERT INTO `sys_department` VALUES ('39', '38', '综合处', '', '2019-02-25 21:12:01', '2019-02-25 21:12:01', '1', '1', null);
INSERT INTO `sys_department` VALUES ('40', '38', '公务员管理处', '', '2019-02-25 21:12:12', '2019-02-25 21:12:12', '1', '1', null);
INSERT INTO `sys_department` VALUES ('41', '38', '事业单位处', '', '2019-02-25 21:12:20', '2019-02-25 21:12:20', '1', '1', null);
INSERT INTO `sys_department` VALUES ('42', '38', '干部监督处', '', '2019-02-25 21:12:28', '2019-02-25 21:12:28', '1', '1', null);
INSERT INTO `sys_department` VALUES ('43', '1', '团委党委', '直属机关党委负责局机关和局属事业单位的党群工作, 受局党组委托指导地区铁路监督管理局的党群工作, 落实局党组党风廉政建设主体责任相关工作。开展党的思想建设、组织建设、作风建设、反腐败建设和制度建设, 推进精神文明建设和文化建设。', '2019-02-25 21:13:05', '2019-03-04 20:59:25', '1', '1', null);
INSERT INTO `sys_department` VALUES ('44', '43', '组织宣传处', '', '2019-02-25 21:13:17', '2019-02-25 21:13:17', '1', '1', null);
INSERT INTO `sys_department` VALUES ('45', '43', '党委办公室', '', '2019-02-25 21:13:26', '2019-02-25 21:13:26', '1', '1', null);
INSERT INTO `sys_department` VALUES ('46', '43', '纪委办公室', '', '2019-02-25 21:13:42', '2019-02-25 21:13:42', '1', '1', null);
INSERT INTO `sys_department` VALUES ('47', '26', '管运部', '', '2019-03-04 20:57:02', '2019-03-04 20:57:02', '1', '1', null);
INSERT INTO `sys_department` VALUES ('48', '30', '工程管理四部', '', '2019-03-04 20:58:15', '2019-03-04 20:58:15', '1', '1', null);
INSERT INTO `sys_department` VALUES ('49', '30', '工程管理五部', '', '2019-03-04 20:58:24', '2019-03-04 20:58:24', '1', '1', null);
INSERT INTO `sys_department` VALUES ('50', '43', '团委办公室', '', '2019-03-04 20:59:50', '2019-03-04 20:59:50', '1', '1', null);

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `links` varchar(255) DEFAULT NULL,
  `parent_id` int(5) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `create_user_id` int(5) DEFAULT NULL,
  `update_user_id` int(5) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('1', 'P_ROOT', '根部', null, '-1', '系统权限', '1', '1', '2019-03-04 22:02:21', '2019-03-04 22:02:24');
INSERT INTO `sys_permission` VALUES ('2', 'P_PERSON', '', null, '1', '个人中心', '1', '1', '2019-03-07 13:49:48', '2019-03-07 13:49:48');
INSERT INTO `sys_permission` VALUES ('3', 'P_SYS', '', null, '1', '基础管理', '1', '1', '2019-03-04 22:10:24', '2019-03-04 22:27:47');
INSERT INTO `sys_permission` VALUES ('4', 'P_PRICE', '', null, '1', '物资目录管理', '1', '1', '2019-03-04 23:11:25', '2019-03-04 23:11:25');
INSERT INTO `sys_permission` VALUES ('5', 'P_COMPANY', '', null, '1', '供应商管理', '1', '1', '2019-03-04 23:12:39', '2019-03-04 23:12:39');
INSERT INTO `sys_permission` VALUES ('7', 'P_BUDGET', '', null, '1', '预算管理', '1', '1', '2019-03-07 13:52:29', '2019-03-07 13:52:29');
INSERT INTO `sys_permission` VALUES ('8', 'P_BUY', '', null, '1', '采购管理', '1', '1', '2019-03-07 13:52:51', '2019-03-07 13:52:51');
INSERT INTO `sys_permission` VALUES ('9', 'P_SAVE', '', null, '1', '仓储管理', '1', '1', '2019-03-07 13:53:12', '2019-03-07 13:53:12');
INSERT INTO `sys_permission` VALUES ('10', 'P_PERSON_INFO', '', null, '2', '个人信息', '1', '1', '2019-03-07 13:54:18', '2019-03-07 13:54:18');
INSERT INTO `sys_permission` VALUES ('11', 'P_SYS_USER', '', null, '3', '用户管理', '1', '1', '2019-03-07 13:55:09', '2019-03-07 13:55:09');
INSERT INTO `sys_permission` VALUES ('12', 'P_SYS_ROLE', '', null, '3', '角色管理', '1', '1', '2019-03-07 13:55:43', '2019-03-07 13:55:43');
INSERT INTO `sys_permission` VALUES ('13', 'P_SYS_DEPARTMENT', '', null, '3', '部门管理', '1', '1', '2019-03-07 13:56:09', '2019-03-07 13:56:09');
INSERT INTO `sys_permission` VALUES ('14', 'P_SYS_PERMISSION', '', null, '3', '权限管理', '1', '1', '2019-03-07 13:56:51', '2019-03-07 13:56:51');
INSERT INTO `sys_permission` VALUES ('15', 'P_SYS_USER_LOOK', '', null, '11', '查看', '1', '1', '2019-03-07 14:00:18', '2019-03-07 14:00:18');
INSERT INTO `sys_permission` VALUES ('16', 'P_SYS_USER_MADE', '', null, '11', '操作', '1', '1', '2019-03-07 14:00:45', '2019-03-07 14:00:45');
INSERT INTO `sys_permission` VALUES ('17', 'P_SYS_ROLE_LOOK', '', null, '12', '查看', '1', '1', '2019-03-07 14:01:11', '2019-03-07 14:01:11');
INSERT INTO `sys_permission` VALUES ('18', 'P_SYS_ROLE_MADE', '', null, '12', '操作', '1', '1', '2019-03-07 14:01:31', '2019-03-07 14:01:31');
INSERT INTO `sys_permission` VALUES ('19', 'P_SYS_DEPARTMENT_LOOK', '', null, '13', '查看', '1', '1', '2019-03-07 14:01:49', '2019-03-07 14:01:49');
INSERT INTO `sys_permission` VALUES ('20', 'P_SYS_DEPARTMENT_MADE', '', null, '13', '操作', '1', '1', '2019-03-07 14:02:09', '2019-03-07 14:02:09');
INSERT INTO `sys_permission` VALUES ('21', 'P_SYS_PERMISSION_LOOK', '', null, '14', '查看', '1', '1', '2019-03-07 14:02:31', '2019-03-07 14:02:31');
INSERT INTO `sys_permission` VALUES ('22', 'P_SYS_PERMISSION_MADE', '', null, '14', '操作', '1', '1', '2019-03-07 14:02:47', '2019-03-07 14:02:47');
INSERT INTO `sys_permission` VALUES ('23', 'P_PRICE_ADMIN', '', null, '4', '物资目录管理', '1', '1', '2019-03-07 14:04:45', '2019-03-07 14:04:45');
INSERT INTO `sys_permission` VALUES ('24', 'P_PRICE_LIMIT', '', null, '4', '限价管理', '1', '1', '2019-03-07 14:05:01', '2019-03-07 14:05:01');
INSERT INTO `sys_permission` VALUES ('25', 'P_PRICE_ADMIN_LOOK', '', null, '23', '查看', '1', '1', '2019-03-07 14:05:38', '2019-03-07 14:05:38');
INSERT INTO `sys_permission` VALUES ('26', 'P_PRICE_ADMIN_MADE', '', null, '23', '操作', '1', '1', '2019-03-07 14:05:52', '2019-03-07 14:05:52');
INSERT INTO `sys_permission` VALUES ('27', 'P_PRICE_LIMIT_LOOK', '', null, '24', '查看', '1', '1', '2019-03-07 14:06:15', '2019-03-07 14:06:15');
INSERT INTO `sys_permission` VALUES ('28', 'P_PRICE_LIMIT_MADE', '', null, '24', '操作', '1', '1', '2019-03-07 14:06:28', '2019-03-07 14:06:28');
INSERT INTO `sys_permission` VALUES ('29', 'P_COMPANY_ADMIN', '', null, '5', '供应商管理', '1', '1', '2019-03-07 14:07:37', '2019-03-07 14:07:37');
INSERT INTO `sys_permission` VALUES ('30', 'P_COMPANY_IN', '', null, '5', '供应商准入管理', '1', '1', '2019-03-07 14:07:58', '2019-03-07 14:07:58');
INSERT INTO `sys_permission` VALUES ('31', 'P_COMPANY_ADMIN_LOOK', '', null, '29', '查看', '1', '1', '2019-03-07 14:08:18', '2019-03-07 14:08:18');
INSERT INTO `sys_permission` VALUES ('32', 'P_COMPANY_ADMIN_MADE', '', null, '29', '操作', '1', '1', '2019-03-07 14:08:30', '2019-03-07 14:08:30');
INSERT INTO `sys_permission` VALUES ('33', 'P_COMPANY_IN_LOOK', '', null, '30', '查看', '1', '1', '2019-03-07 14:08:46', '2019-03-07 14:08:46');
INSERT INTO `sys_permission` VALUES ('34', 'P_COMPANY_IN_MADE', '', null, '30', '操作', '1', '1', '2019-03-07 14:09:01', '2019-03-07 14:09:01');
INSERT INTO `sys_permission` VALUES ('35', 'P_BUDGET_ADMIN', '', null, '7', '预算管理', '1', '1', '2019-03-07 14:09:37', '2019-03-07 14:09:37');
INSERT INTO `sys_permission` VALUES ('36', 'P_BUDGET_NESS', '', null, '7', '需求管理', '1', '1', '2019-03-07 14:10:02', '2019-03-07 14:10:02');
INSERT INTO `sys_permission` VALUES ('37', 'P_BUDGET_ADMIN_LOOK', '', null, '35', '查看', '1', '1', '2019-03-07 14:10:20', '2019-03-07 14:10:20');
INSERT INTO `sys_permission` VALUES ('38', 'P_BUDGET_ADMIN_MADE', '', null, '35', '操作', '1', '1', '2019-03-07 14:10:32', '2019-03-07 14:10:32');
INSERT INTO `sys_permission` VALUES ('39', 'P_BUDGET_NESS_LOOK', '', null, '36', '查看', '1', '1', '2019-03-07 14:10:52', '2019-03-07 14:10:52');
INSERT INTO `sys_permission` VALUES ('40', 'P_BUDGET_NESS_MADE', '', null, '36', '操作', '1', '1', '2019-03-07 14:11:03', '2019-03-07 14:11:03');
INSERT INTO `sys_permission` VALUES ('41', 'P_BUY_XUN', '', null, '8', '询价单管理', '1', '1', '2019-03-07 14:11:43', '2019-03-07 14:11:43');
INSERT INTO `sys_permission` VALUES ('42', 'P_BUY_ORDER', '', null, '8', '订单管理', '1', '1', '2019-03-07 14:11:58', '2019-03-07 14:11:58');
INSERT INTO `sys_permission` VALUES ('43', 'P_BUY_INCOME', '', null, '8', '收料管理', '1', '1', '2019-03-07 14:12:18', '2019-03-07 14:12:18');
INSERT INTO `sys_permission` VALUES ('44', 'P_BUY_XUN_LOOK', '', null, '41', '查看', '1', '1', '2019-03-07 14:12:39', '2019-03-07 14:12:39');
INSERT INTO `sys_permission` VALUES ('45', 'P_BUY_XUN_MADE', '', null, '41', '操作', '1', '1', '2019-03-07 14:12:50', '2019-03-07 14:12:50');
INSERT INTO `sys_permission` VALUES ('46', 'P_BUY_ORDER_LOOK', '', null, '42', '查看', '1', '1', '2019-03-07 14:13:07', '2019-03-07 14:13:07');
INSERT INTO `sys_permission` VALUES ('47', 'P_BUY_ORDER_MADE', '', null, '42', '操作', '1', '1', '2019-03-07 14:13:17', '2019-03-07 14:13:17');
INSERT INTO `sys_permission` VALUES ('48', 'P_BUY_INCOME_LOOK', '', null, '43', '查看', '1', '1', '2019-03-07 14:13:35', '2019-03-07 14:13:35');
INSERT INTO `sys_permission` VALUES ('49', 'P_BUY_INCOME_MADE', '', null, '43', '操作', '1', '1', '2019-03-07 14:13:44', '2019-03-07 14:13:44');
INSERT INTO `sys_permission` VALUES ('50', 'P_SAVE_INSERT', '', null, '9', '进库料管理', '1', '1', '2019-03-07 14:14:36', '2019-03-07 14:14:36');
INSERT INTO `sys_permission` VALUES ('51', 'P_SAVE_SEND', '', null, '9', '发料管理', '1', '1', '2019-03-07 14:14:51', '2019-03-07 14:14:51');
INSERT INTO `sys_permission` VALUES ('52', 'P_SAVE_INSERT_LOOK', '', null, '50', '查看', '1', '1', '2019-03-07 14:15:14', '2019-03-07 14:15:14');
INSERT INTO `sys_permission` VALUES ('53', 'P_SAVE_INSERT_MADE', '', null, '50', '操作', '1', '1', '2019-03-07 14:15:24', '2019-03-07 14:15:24');
INSERT INTO `sys_permission` VALUES ('54', 'P_SAVE_SEND_LOOK', '', null, '51', '查看', '1', '1', '2019-03-07 14:15:38', '2019-03-07 14:15:38');
INSERT INTO `sys_permission` VALUES ('55', 'P_SAVE_SEND_MADE', '', null, '51', '操作', '1', '1', '2019-03-07 14:15:48', '2019-03-07 14:15:48');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `introduce` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_user_id` int(5) DEFAULT NULL,
  `update_user_id` int(5) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `is_admin` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', '无', '2019-02-16 22:39:34', '2019-02-16 22:39:34', '1', '1', null, null, null);
INSERT INTO `sys_role` VALUES ('2', '管理人员', '管理系统的人', '2019-02-16 22:46:37', '2019-03-03 12:12:51', '1', '1', null, null, null);
INSERT INTO `sys_role` VALUES ('3', '财务人员', '管理财务的人', '2019-02-16 22:46:51', '2019-02-25 20:49:23', '1', '1', null, null, null);
INSERT INTO `sys_role` VALUES ('4', '业务人员', '管理业务的人', '2019-02-16 22:49:01', '2019-02-25 20:49:35', '2', '1', null, null, null);
INSERT INTO `sys_role` VALUES ('5', '采购人员', '管理采购的人', '2019-02-25 20:48:28', '2019-02-25 20:49:49', '1', '1', null, null, null);
INSERT INTO `sys_role` VALUES ('6', '管库人员', '管理仓库的人', '2019-02-25 20:48:40', '2019-02-25 20:50:01', '1', '1', null, null, null);

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `role_id` int(5) DEFAULT NULL,
  `permission_id` int(5) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES ('51', '1', '10', '2019-03-07 14:16:01', '1');
INSERT INTO `sys_role_permission` VALUES ('52', '1', '2', '2019-03-07 14:16:01', '1');
INSERT INTO `sys_role_permission` VALUES ('53', '1', '15', '2019-03-07 14:16:02', '1');
INSERT INTO `sys_role_permission` VALUES ('54', '1', '16', '2019-03-07 14:16:02', '1');
INSERT INTO `sys_role_permission` VALUES ('55', '1', '11', '2019-03-07 14:16:02', '1');
INSERT INTO `sys_role_permission` VALUES ('56', '1', '17', '2019-03-07 14:16:02', '1');
INSERT INTO `sys_role_permission` VALUES ('57', '1', '18', '2019-03-07 14:16:02', '1');
INSERT INTO `sys_role_permission` VALUES ('58', '1', '12', '2019-03-07 14:16:02', '1');
INSERT INTO `sys_role_permission` VALUES ('59', '1', '19', '2019-03-07 14:16:02', '1');
INSERT INTO `sys_role_permission` VALUES ('60', '1', '20', '2019-03-07 14:16:02', '1');
INSERT INTO `sys_role_permission` VALUES ('61', '1', '13', '2019-03-07 14:16:02', '1');
INSERT INTO `sys_role_permission` VALUES ('62', '1', '21', '2019-03-07 14:16:02', '1');
INSERT INTO `sys_role_permission` VALUES ('63', '1', '22', '2019-03-07 14:16:02', '1');
INSERT INTO `sys_role_permission` VALUES ('64', '1', '14', '2019-03-07 14:16:02', '1');
INSERT INTO `sys_role_permission` VALUES ('65', '1', '3', '2019-03-07 14:16:02', '1');
INSERT INTO `sys_role_permission` VALUES ('66', '1', '1', '2019-03-07 14:16:02', '1');
INSERT INTO `sys_role_permission` VALUES ('67', '1', '25', '2019-03-07 14:16:02', '1');
INSERT INTO `sys_role_permission` VALUES ('68', '1', '26', '2019-03-07 14:16:02', '1');
INSERT INTO `sys_role_permission` VALUES ('69', '1', '27', '2019-03-07 14:16:02', '1');
INSERT INTO `sys_role_permission` VALUES ('70', '1', '28', '2019-03-07 14:16:02', '1');
INSERT INTO `sys_role_permission` VALUES ('71', '1', '23', '2019-03-07 14:16:02', '1');
INSERT INTO `sys_role_permission` VALUES ('72', '1', '24', '2019-03-07 14:16:03', '1');
INSERT INTO `sys_role_permission` VALUES ('73', '1', '31', '2019-03-07 14:16:03', '1');
INSERT INTO `sys_role_permission` VALUES ('74', '1', '32', '2019-03-07 14:16:03', '1');
INSERT INTO `sys_role_permission` VALUES ('75', '1', '33', '2019-03-07 14:16:03', '1');
INSERT INTO `sys_role_permission` VALUES ('76', '1', '34', '2019-03-07 14:16:03', '1');
INSERT INTO `sys_role_permission` VALUES ('77', '1', '29', '2019-03-07 14:16:03', '1');
INSERT INTO `sys_role_permission` VALUES ('78', '1', '30', '2019-03-07 14:16:03', '1');
INSERT INTO `sys_role_permission` VALUES ('79', '1', '37', '2019-03-07 14:16:03', '1');
INSERT INTO `sys_role_permission` VALUES ('80', '1', '38', '2019-03-07 14:16:03', '1');
INSERT INTO `sys_role_permission` VALUES ('81', '1', '39', '2019-03-07 14:16:03', '1');
INSERT INTO `sys_role_permission` VALUES ('82', '1', '40', '2019-03-07 14:16:03', '1');
INSERT INTO `sys_role_permission` VALUES ('83', '1', '35', '2019-03-07 14:16:03', '1');
INSERT INTO `sys_role_permission` VALUES ('84', '1', '36', '2019-03-07 14:16:03', '1');
INSERT INTO `sys_role_permission` VALUES ('85', '1', '44', '2019-03-07 14:16:03', '1');
INSERT INTO `sys_role_permission` VALUES ('86', '1', '45', '2019-03-07 14:16:03', '1');
INSERT INTO `sys_role_permission` VALUES ('87', '1', '46', '2019-03-07 14:16:03', '1');
INSERT INTO `sys_role_permission` VALUES ('88', '1', '47', '2019-03-07 14:16:03', '1');
INSERT INTO `sys_role_permission` VALUES ('89', '1', '48', '2019-03-07 14:16:03', '1');
INSERT INTO `sys_role_permission` VALUES ('90', '1', '49', '2019-03-07 14:16:03', '1');
INSERT INTO `sys_role_permission` VALUES ('91', '1', '41', '2019-03-07 14:16:03', '1');
INSERT INTO `sys_role_permission` VALUES ('92', '1', '42', '2019-03-07 14:16:03', '1');
INSERT INTO `sys_role_permission` VALUES ('93', '1', '43', '2019-03-07 14:16:03', '1');
INSERT INTO `sys_role_permission` VALUES ('94', '1', '52', '2019-03-07 14:16:03', '1');
INSERT INTO `sys_role_permission` VALUES ('95', '1', '53', '2019-03-07 14:16:03', '1');
INSERT INTO `sys_role_permission` VALUES ('96', '1', '54', '2019-03-07 14:16:04', '1');
INSERT INTO `sys_role_permission` VALUES ('97', '1', '55', '2019-03-07 14:16:04', '1');
INSERT INTO `sys_role_permission` VALUES ('98', '1', '50', '2019-03-07 14:16:04', '1');
INSERT INTO `sys_role_permission` VALUES ('99', '1', '51', '2019-03-07 14:16:04', '1');
INSERT INTO `sys_role_permission` VALUES ('100', '1', '4', '2019-03-07 14:16:04', '1');
INSERT INTO `sys_role_permission` VALUES ('101', '1', '5', '2019-03-07 14:16:04', '1');
INSERT INTO `sys_role_permission` VALUES ('102', '1', '7', '2019-03-07 14:16:04', '1');
INSERT INTO `sys_role_permission` VALUES ('103', '1', '8', '2019-03-07 14:16:04', '1');
INSERT INTO `sys_role_permission` VALUES ('104', '1', '9', '2019-03-07 14:16:04', '1');
INSERT INTO `sys_role_permission` VALUES ('105', '2', '11', '2019-03-07 14:36:00', '1');
INSERT INTO `sys_role_permission` VALUES ('106', '2', '15', '2019-03-07 14:36:00', '1');
INSERT INTO `sys_role_permission` VALUES ('107', '2', '16', '2019-03-07 14:36:00', '1');
INSERT INTO `sys_role_permission` VALUES ('108', '2', '12', '2019-03-07 14:36:00', '1');
INSERT INTO `sys_role_permission` VALUES ('109', '2', '17', '2019-03-07 14:36:00', '1');
INSERT INTO `sys_role_permission` VALUES ('110', '2', '18', '2019-03-07 14:36:00', '1');
INSERT INTO `sys_role_permission` VALUES ('111', '2', '13', '2019-03-07 14:36:00', '1');
INSERT INTO `sys_role_permission` VALUES ('112', '2', '19', '2019-03-07 14:36:01', '1');
INSERT INTO `sys_role_permission` VALUES ('113', '2', '20', '2019-03-07 14:36:01', '1');
INSERT INTO `sys_role_permission` VALUES ('114', '2', '1', '2019-03-07 14:36:01', '1');
INSERT INTO `sys_role_permission` VALUES ('115', '2', '3', '2019-03-07 14:36:01', '1');
INSERT INTO `sys_role_permission` VALUES ('124', '5', '8', '2019-03-07 14:44:12', '1');
INSERT INTO `sys_role_permission` VALUES ('125', '5', '44', '2019-03-07 14:44:12', '1');
INSERT INTO `sys_role_permission` VALUES ('126', '5', '45', '2019-03-07 14:44:12', '1');
INSERT INTO `sys_role_permission` VALUES ('127', '5', '46', '2019-03-07 14:44:12', '1');
INSERT INTO `sys_role_permission` VALUES ('128', '5', '47', '2019-03-07 14:44:12', '1');
INSERT INTO `sys_role_permission` VALUES ('129', '5', '48', '2019-03-07 14:44:12', '1');
INSERT INTO `sys_role_permission` VALUES ('130', '5', '49', '2019-03-07 14:44:12', '1');
INSERT INTO `sys_role_permission` VALUES ('131', '5', '41', '2019-03-07 14:44:12', '1');
INSERT INTO `sys_role_permission` VALUES ('132', '5', '42', '2019-03-07 14:44:12', '1');
INSERT INTO `sys_role_permission` VALUES ('133', '5', '43', '2019-03-07 14:44:12', '1');
INSERT INTO `sys_role_permission` VALUES ('134', '5', '1', '2019-03-07 14:44:12', '1');
INSERT INTO `sys_role_permission` VALUES ('143', '6', '52', '2019-03-07 14:46:35', '1');
INSERT INTO `sys_role_permission` VALUES ('144', '6', '53', '2019-03-07 14:46:35', '1');
INSERT INTO `sys_role_permission` VALUES ('145', '6', '50', '2019-03-07 14:46:35', '1');
INSERT INTO `sys_role_permission` VALUES ('146', '6', '54', '2019-03-07 14:46:35', '1');
INSERT INTO `sys_role_permission` VALUES ('147', '6', '55', '2019-03-07 14:46:35', '1');
INSERT INTO `sys_role_permission` VALUES ('148', '6', '51', '2019-03-07 14:46:35', '1');
INSERT INTO `sys_role_permission` VALUES ('149', '6', '9', '2019-03-07 14:46:35', '1');
INSERT INTO `sys_role_permission` VALUES ('150', '6', '43', '2019-03-07 14:46:36', '1');
INSERT INTO `sys_role_permission` VALUES ('151', '6', '48', '2019-03-07 14:46:36', '1');
INSERT INTO `sys_role_permission` VALUES ('152', '6', '49', '2019-03-07 14:46:36', '1');
INSERT INTO `sys_role_permission` VALUES ('153', '6', '4', '2019-03-07 14:46:36', '1');
INSERT INTO `sys_role_permission` VALUES ('154', '6', '25', '2019-03-07 14:46:36', '1');
INSERT INTO `sys_role_permission` VALUES ('155', '6', '26', '2019-03-07 14:46:36', '1');
INSERT INTO `sys_role_permission` VALUES ('156', '6', '27', '2019-03-07 14:46:36', '1');
INSERT INTO `sys_role_permission` VALUES ('157', '6', '28', '2019-03-07 14:46:36', '1');
INSERT INTO `sys_role_permission` VALUES ('158', '6', '23', '2019-03-07 14:46:36', '1');
INSERT INTO `sys_role_permission` VALUES ('159', '6', '24', '2019-03-07 14:46:36', '1');
INSERT INTO `sys_role_permission` VALUES ('160', '6', '1', '2019-03-07 14:46:36', '1');
INSERT INTO `sys_role_permission` VALUES ('161', '6', '8', '2019-03-07 14:46:36', '1');
INSERT INTO `sys_role_permission` VALUES ('162', '3', '37', '2019-03-07 14:48:40', '1');
INSERT INTO `sys_role_permission` VALUES ('163', '3', '38', '2019-03-07 14:48:41', '1');
INSERT INTO `sys_role_permission` VALUES ('164', '3', '35', '2019-03-07 14:48:41', '1');
INSERT INTO `sys_role_permission` VALUES ('165', '3', '39', '2019-03-07 14:48:41', '1');
INSERT INTO `sys_role_permission` VALUES ('166', '3', '40', '2019-03-07 14:48:41', '1');
INSERT INTO `sys_role_permission` VALUES ('167', '3', '36', '2019-03-07 14:48:41', '1');
INSERT INTO `sys_role_permission` VALUES ('168', '3', '7', '2019-03-07 14:48:41', '1');
INSERT INTO `sys_role_permission` VALUES ('169', '3', '4', '2019-03-07 14:48:41', '1');
INSERT INTO `sys_role_permission` VALUES ('170', '3', '25', '2019-03-07 14:48:41', '1');
INSERT INTO `sys_role_permission` VALUES ('171', '3', '26', '2019-03-07 14:48:41', '1');
INSERT INTO `sys_role_permission` VALUES ('172', '3', '27', '2019-03-07 14:48:41', '1');
INSERT INTO `sys_role_permission` VALUES ('173', '3', '28', '2019-03-07 14:48:41', '1');
INSERT INTO `sys_role_permission` VALUES ('174', '3', '23', '2019-03-07 14:48:41', '1');
INSERT INTO `sys_role_permission` VALUES ('175', '3', '24', '2019-03-07 14:48:41', '1');
INSERT INTO `sys_role_permission` VALUES ('176', '3', '1', '2019-03-07 14:48:41', '1');
INSERT INTO `sys_role_permission` VALUES ('177', '4', '4', '2019-03-07 14:57:08', '1');
INSERT INTO `sys_role_permission` VALUES ('178', '4', '25', '2019-03-07 14:57:08', '1');
INSERT INTO `sys_role_permission` VALUES ('179', '4', '26', '2019-03-07 14:57:08', '1');
INSERT INTO `sys_role_permission` VALUES ('180', '4', '27', '2019-03-07 14:57:09', '1');
INSERT INTO `sys_role_permission` VALUES ('181', '4', '28', '2019-03-07 14:57:09', '1');
INSERT INTO `sys_role_permission` VALUES ('182', '4', '23', '2019-03-07 14:57:09', '1');
INSERT INTO `sys_role_permission` VALUES ('183', '4', '24', '2019-03-07 14:57:09', '1');
INSERT INTO `sys_role_permission` VALUES ('184', '4', '7', '2019-03-07 14:57:09', '1');
INSERT INTO `sys_role_permission` VALUES ('185', '4', '37', '2019-03-07 14:57:09', '1');
INSERT INTO `sys_role_permission` VALUES ('186', '4', '38', '2019-03-07 14:57:09', '1');
INSERT INTO `sys_role_permission` VALUES ('187', '4', '39', '2019-03-07 14:57:09', '1');
INSERT INTO `sys_role_permission` VALUES ('188', '4', '40', '2019-03-07 14:57:09', '1');
INSERT INTO `sys_role_permission` VALUES ('189', '4', '35', '2019-03-07 14:57:09', '1');
INSERT INTO `sys_role_permission` VALUES ('190', '4', '36', '2019-03-07 14:57:09', '1');
INSERT INTO `sys_role_permission` VALUES ('191', '4', '1', '2019-03-07 14:57:09', '1');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `account_number` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sex` varchar(255) DEFAULT '',
  `birthday` datetime DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `department_id` int(5) DEFAULT NULL,
  `role_id` int(5) DEFAULT NULL,
  `power_mid_id` int(5) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_user_id` int(5) DEFAULT NULL,
  `update_user_id` int(5) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `count` int(10) DEFAULT '0',
  `img_path` varchar(255) DEFAULT NULL,
  `id_card_type` varchar(255) DEFAULT NULL,
  `id_card_number` varchar(255) DEFAULT NULL,
  `nation` varchar(255) DEFAULT NULL,
  `political_status` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '698d51a19d8a121ce581499d7b701668', '超级管理员', 'M', '1999-02-02 00:00:00', '13632216406', null, null, null, '2019-02-11 16:01:49', '2019-03-07 13:38:08', '1', '1', null, '380', '/user/img/2019/3/6/201903061802550000.jpg', '1', '4452221996060599992', '汉族', '共青团员', '广东省广州市从化区广州大学华软软件学院黄槐楼Y3109宿舍', '12', '0', '12');
INSERT INTO `sys_user` VALUES ('2', 'test01', '698d51a19d8a121ce581499d7b701668', 'test01', 'N', '2019-03-06 00:00:00', '', null, null, null, '2019-02-13 16:09:35', '2019-03-07 21:57:21', null, '1', null, '3', '/user/img/2019/3/6/201903061805200000.jpg', '2', '', '', '', '', '0', '0', '0');
INSERT INTO `sys_user` VALUES ('3', 'test02', '698d51a19d8a121ce581499d7b701668', 'test02', 'N', null, '', null, null, null, '2019-02-13 16:09:13', '2019-03-07 21:57:37', '1', '1', null, '3', '/user/img/2019/3/6/201903061807540000.jpg', '5', '', '', '', '', '0', '0', '0');
INSERT INTO `sys_user` VALUES ('4', 'test03', 'a426dcf72ba25d046591f81a5495eab7', 'test03', 'M', '2018-10-09 00:00:00', '', null, null, null, '2019-03-03 22:59:46', '2019-03-07 21:57:50', '1', '1', null, '7', null, '3', '', '', '', '', '0', '0', '0');
INSERT INTO `sys_user` VALUES ('5', 'test04', 'e10adc3949ba59abbe56e057f20f883e', 'test04', null, null, null, null, null, null, '2019-03-07 14:34:45', '2019-03-07 15:00:17', '1', '1', null, '1', null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('6', 'test05', 'e10adc3949ba59abbe56e057f20f883e', 'test05', null, null, null, null, null, null, '2019-03-07 14:59:57', '2019-03-07 15:00:27', '1', '1', null, '0', null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('7', 'test06', 'e10adc3949ba59abbe56e057f20f883e', 'test06', null, null, null, null, null, null, '2019-03-07 15:00:42', '2019-03-07 15:00:42', '1', '1', null, '0', null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('8', 'test07', 'e10adc3949ba59abbe56e057f20f883e', 'test07', null, null, null, null, null, null, '2019-03-07 15:00:51', '2019-03-07 15:00:51', '1', '1', null, '0', null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('9', 'test08', 'e10adc3949ba59abbe56e057f20f883e', 'test08', null, null, null, null, null, null, '2019-03-07 15:01:00', '2019-03-07 15:01:00', '1', '1', null, '0', null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('10', 'test09', 'e10adc3949ba59abbe56e057f20f883e', 'test09', null, null, null, null, null, null, '2019-03-07 15:01:14', '2019-03-07 15:01:14', '1', '1', null, '0', null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('11', 'test10', 'e10adc3949ba59abbe56e057f20f883e', 'test102323', null, null, null, null, null, null, '2019-03-07 15:01:25', '2019-03-07 21:00:39', '1', '1', null, '0', null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('12', 'test11', 'e10adc3949ba59abbe56e057f20f883e', 'test112323', null, null, null, null, null, null, '2019-03-07 20:58:11', '2019-03-07 21:00:40', null, null, null, '0', null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_user_department
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_department`;
CREATE TABLE `sys_user_department` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `user_id` int(5) DEFAULT NULL COMMENT '用户id',
  `department_id` int(5) DEFAULT NULL COMMENT '部门id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user_id` int(5) DEFAULT NULL COMMENT '创建人id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_user_department
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `user_id` int(5) DEFAULT NULL,
  `role_id` int(5) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('16', '1', '1', '2019-03-05 01:44:13', '1');
INSERT INTO `sys_user_role` VALUES ('18', '2', '2', '2019-03-07 15:02:50', '1');
INSERT INTO `sys_user_role` VALUES ('19', '3', '3', '2019-03-07 15:02:59', '1');
INSERT INTO `sys_user_role` VALUES ('20', '4', '4', '2019-03-07 15:03:06', '1');
INSERT INTO `sys_user_role` VALUES ('21', '5', '5', '2019-03-07 15:03:22', '1');
INSERT INTO `sys_user_role` VALUES ('22', '6', '6', '2019-03-07 15:03:29', '1');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'n1', 'n1', 'n1');
INSERT INTO `t_user` VALUES ('2', 'n', 'n', 'n');
