/*
SQLyog Job Agent v12.09 (64 bit) Copyright(c) Webyog Inc. All Rights Reserved.


MySQL - 5.6.39 : Database - nx_smp
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`nx_smp` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `nx_smp`;

/*Table structure for table `t_authorization_info` */

DROP TABLE IF EXISTS `t_authorization_info`;

CREATE TABLE `t_authorization_info` (
  `id` int(11) NOT NULL,
  `authorizer_id` int(11) DEFAULT NULL COMMENT '授权人id',
  `authorized_name` varchar(40) DEFAULT NULL COMMENT '被授权人名字',
  `authorized_phone` varchar(11) DEFAULT NULL COMMENT '被授权人电话',
  `privileged_time` int(11) DEFAULT NULL COMMENT '特权时间（分钟）',
  `door_id` int(11) DEFAULT NULL COMMENT '门锁id',
  `door_passwd` varchar(10) DEFAULT NULL COMMENT '开门密码',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `t_authorization_info` */

/*Table structure for table `t_authorization_record` */

DROP TABLE IF EXISTS `t_authorization_record`;

CREATE TABLE `t_authorization_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) DEFAULT NULL COMMENT '授权人ID',
  `authorized_name` varchar(20) DEFAULT NULL COMMENT '被授权人姓名',
  `authorized_phone` varchar(11) DEFAULT NULL COMMENT '被授权人电话',
  `device_id` varchar(200) DEFAULT NULL COMMENT '门锁设备ID',
  `pwd` varchar(10) DEFAULT NULL COMMENT '开门密码',
  `pwdType` int(11) DEFAULT NULL COMMENT '0临时密码,2管家密码,客房密码',
  `mtoken` varchar(255) DEFAULT NULL COMMENT '用户凭证',
  `prescription` int(11) DEFAULT NULL COMMENT '时效(分钟)',
  `pwd_id` int(11) DEFAULT NULL COMMENT '门锁平台返回的密码id',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_authorization_record` */

/*Table structure for table `t_convenience_info` */

DROP TABLE IF EXISTS `t_convenience_info`;

CREATE TABLE `t_convenience_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p_m_id` int(11) DEFAULT NULL COMMENT '物业管理处ID',
  `service_type` varchar(10) DEFAULT NULL COMMENT '服务类型',
  `contacts` varchar(16) DEFAULT NULL COMMENT '联系人',
  `c_telphone` varchar(14) DEFAULT NULL COMMENT '联系方式',
  `c_address` varchar(100) DEFAULT NULL COMMENT '联系地址',
  `headimg` varchar(100) DEFAULT NULL COMMENT '头像',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `t_convenience_info` */

insert  into `t_convenience_info` values (1,1,'物业信息','李工','0755-83711123','大冲城市花园小区1栋1C101','/images/img_bm001.jpg','2017-11-26 16:42:29'),(2,1,'搬家公司','张师傅','13498572221','深圳市福田区彩福大厦嘉福阁16楼','/images/img_bm002.jpg','2017-11-26 16:49:31'),(3,1,'警务信息','雷警官','13498572222','大冲城市花园小区2栋2C101','/images/img_bm003.jpg','2017-11-26 16:49:32'),(4,1,'快递代收','付师傅','13498571111','大冲城市花园小区2栋2B101','/images/img_bm004.jpg','2017-11-26 16:49:33'),(6,2,'快递代收','123','13071252021','311栋',NULL,'2018-03-30 09:38:12'),(7,2,'物业管理','李四','15235564954','武汉市江夏区纸坊街道',NULL,'2018-03-30 14:18:03'),(8,4,'电工维修','电工','14665546465','武汉市江夏区',NULL,'2018-04-03 13:48:44');

/*Table structure for table `t_cost_type` */

DROP TABLE IF EXISTS `t_cost_type`;

CREATE TABLE `t_cost_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pay_item` int(11) DEFAULT NULL COMMENT '费用类型编号',
  `pay_name` varchar(50) DEFAULT NULL COMMENT '费用类型名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `t_cost_type` */

insert  into `t_cost_type` values (1,1,'水费'),(2,2,'房租'),(3,3,'网费'),(4,4,'物业管理费'),(5,5,'电费');

/*Table structure for table `t_energy_consumption_device` */

DROP TABLE IF EXISTS `t_energy_consumption_device`;

CREATE TABLE `t_energy_consumption_device` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `energy_type` int(11) DEFAULT NULL COMMENT '能耗设备:0水表，1电表',
  `sub_type` int(11) DEFAULT NULL COMMENT '设备子类型:电表类型(0费控,1普通)，水表类型(0冷水表,1热水表)',
  `device_id` varchar(255) DEFAULT NULL COMMENT '设备ID',
  `device_status` int(11) DEFAULT NULL COMMENT '设备状态:0在线,1离线',
  `house_id` varchar(255) DEFAULT NULL COMMENT '房间ID',
  `meter_value` double DEFAULT NULL COMMENT '水电表数值',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `t_energy_consumption_device` */

/*Table structure for table `t_equipment_sys_provider` */

DROP TABLE IF EXISTS `t_equipment_sys_provider`;

CREATE TABLE `t_equipment_sys_provider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(100) DEFAULT NULL COMMENT '提供商公司名称',
  `services` varchar(200) DEFAULT NULL COMMENT '功能服务',
  `contacts` varchar(30) DEFAULT NULL COMMENT '联系人',
  `telphone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `host` varchar(100) DEFAULT NULL COMMENT '服务器地址IP:port',
  `sys_username` varchar(40) DEFAULT NULL COMMENT '系统登录账号',
  `sys_passwd` varchar(100) DEFAULT NULL COMMENT '系统登录密码',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `t_equipment_sys_provider` */

insert  into `t_equipment_sys_provider` values (1,'珠海数字动力','持卡门禁','徐远明','13824161016',NULL,NULL,NULL,'2018-03-28 17:51:03'),(2,'蛋贝门锁','密码门禁、水电表集成','祝郝郝','18698671355',NULL,NULL,NULL,'2018-03-28 17:51:39'),(3,'门锁','娃娃哈','周生','15645891516',NULL,NULL,NULL,'2018-04-03 18:46:52');

/*Table structure for table `t_feedback` */

DROP TABLE IF EXISTS `t_feedback`;

CREATE TABLE `t_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) DEFAULT NULL COMMENT '业主id',
  `content` text COMMENT '反馈内容',
  `telphone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='反馈信息记录表';

/*Data for the table `t_feedback` */

insert  into `t_feedback` values (3,1,'这是100M独享宽带吗？吃鸡老掉线，让网关上门给我看看什么情况。','13071252022','2018-04-04 16:15:48'),(4,1,'网速真心不好，要是哪一天不掉线，我登门感谢。','13071252021','2018-04-04 16:15:55');

/*Table structure for table `t_lock_pwd` */

DROP TABLE IF EXISTS `t_lock_pwd`;

CREATE TABLE `t_lock_pwd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `telphone` varchar(11) DEFAULT NULL COMMENT '手机号',
  `doorid` int(11) DEFAULT NULL COMMENT '门锁表主键ID',
  `pwd` varchar(20) DEFAULT NULL COMMENT '开门密码',
  `type` int(11) DEFAULT NULL COMMENT '密码类型：0临时密码，2管家密码，3客房密码',
  `pwdID` varchar(20) DEFAULT NULL COMMENT '密码ID（门锁公司平台提供）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_lock_pwd` */

/*Table structure for table `t_maintenance` */

DROP TABLE IF EXISTS `t_maintenance`;

CREATE TABLE `t_maintenance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p_m_id` int(32) DEFAULT NULL COMMENT '物业管理处ID',
  `company_name` varchar(100) DEFAULT NULL COMMENT '公司名称',
  `main_business` varchar(200) DEFAULT NULL COMMENT '主营业务',
  `telephone` varchar(20) DEFAULT NULL COMMENT '公司电话号码',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `image_url` varchar(100) DEFAULT NULL COMMENT '图片地址',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

/*Data for the table `t_maintenance` */

insert  into `t_maintenance` values (32,2,'家电维修003','家电维修','12318116619','武汉市江夏区纸坊',NULL,'2018-03-30 14:27:20'),(2,3,'家电维修001公司','家电维修001业务','15912345678','深圳市南山区高新一路特1号1','/images/img001.jpg','2017-11-24 15:09:34'),(3,4,'家电维修0021公司','家电维修002业务','15912345678','深圳市南山区高新一路特1号','/images/img001.jpg','2017-11-24 15:09:34'),(4,1,'家电维修003公司','家电维修003业务','15912345678','深圳市南山区高新一路特3号','/images/img001.jpg','2017-11-24 15:09:34'),(5,1,'家电维修004公司','家电维修004业务','15912345678','深圳市南山区高新一路特1号','/images/img001.jpg','2017-11-24 15:09:34'),(6,1,'家电维修005公司','家电维修005业务','15912345678','深圳市南山区高新一路特1号','/images/img001.jpg','2017-11-24 15:09:34'),(7,1,'家电维修006公司','家电维修006业务','15912345678','深圳市南山区高新一路特1号','/images/img001.jpg','2017-11-24 15:09:34'),(8,1,'家电维修007公司','家电维修007业务','15912345678','深圳市南山区高新一路特1号','/images/img001.jpg','2017-11-24 15:09:34'),(9,1,'家电维修008公司','家电维修008业务','15912345678','深圳市南山区高新一路特1号','/images/img001.jpg','2017-11-24 15:09:34'),(10,1,'家电维修009公司','家电维修009业务','15912345678','深圳市南山区高新一路特1号','/images/img001.jpg','2017-11-24 15:09:34'),(11,1,'家电维修010公司','家电维修010业务','15912345678','深圳市南山区高新一路特1号','/images/img001.jpg','2017-11-24 15:09:34'),(12,1,'家电维修011公司','家电维修011业务','15912345678','深圳市南山区高新一路特1号','/images/img001.jpg','2017-11-24 15:09:34'),(13,3,'家电维修012公司1','家电维修012业务','15912345678','深圳市南山区高新一路特1号','/images/img001.jpg','2017-11-24 15:09:34'),(14,1,'家电维修013公司','家电维修013业务','15912345678','深圳市南山区高新一路特1号','/images/img001.jpg','2017-11-24 15:09:34'),(15,1,'家电维修014公司','家电维修014业务','15912345678','深圳市南山区高新一路特1号','/images/img001.jpg','2017-11-24 15:09:34'),(16,1,'家电维修015公司','家电维修015业务','15912345678','深圳市南山区高新一路特1号','/images/img001.jpg','2017-11-24 15:09:34'),(29,2,'家电维修010公司','家电维修012业务','13071252021','深圳市南山区高新一路特1号',NULL,'2018-03-27 13:50:56'),(31,2,'家电维修02公司','家电维修022业务','15912348888','深圳市南山区高新一路特1号',NULL,'2018-03-29 18:59:49'),(33,4,'家电维修102公司','家电维修002业务','15912345678','深圳市南山区高新一路特1号',NULL,'2018-04-02 16:53:55'),(35,1,' 家电维修0101公司','家电维修008业务,',NULL,'深圳市南山区高新一路特1号',NULL,'2018-04-04 11:20:14');

/*Table structure for table `t_notify_payment_results` */

DROP TABLE IF EXISTS `t_notify_payment_results`;

CREATE TABLE `t_notify_payment_results` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appid` varchar(32) DEFAULT NULL COMMENT '微信分配的小程序ID',
  `mch_id` varchar(32) DEFAULT NULL COMMENT '微信支付分配的商户号',
  `device_info` varchar(32) DEFAULT NULL COMMENT '设备号，小程序传"WEB"',
  `nonce_str` varchar(32) DEFAULT NULL COMMENT '随机字符串，不长于32位',
  `sign` varchar(32) DEFAULT NULL COMMENT '签名',
  `sign_type` varchar(32) DEFAULT NULL COMMENT '签名类型，目前支持HMAC-SHA256和MD5，默认为MD5',
  `result_code` varchar(16) DEFAULT NULL COMMENT 'SUCCESS/FAIL',
  `err_code` varchar(32) DEFAULT NULL COMMENT '错误返回的信息描述',
  `err_code_des` varchar(128) DEFAULT NULL COMMENT '错误返回的信息描述',
  `openid` varchar(128) DEFAULT NULL COMMENT '用户在商户appid下的唯一标识',
  `is_subscribe` varchar(1) DEFAULT NULL COMMENT '用户是否关注公众账号，Y-关注，N-未关注，仅在公众账号类型支付有效',
  `trade_type` varchar(16) DEFAULT NULL COMMENT 'JSAPI、NATIVE、APP',
  `bank_type` varchar(16) DEFAULT NULL COMMENT '银行类型，采用字符串类型的银行标识',
  `total_fee` int(11) DEFAULT NULL COMMENT '订单总金额，单位为分',
  `settlement_total_fee` int(11) DEFAULT NULL COMMENT '应结订单金额=订单金额-非充值代金券金额，应结订单金额<=订单金额',
  `fee_type` varchar(8) DEFAULT NULL COMMENT '货币类型，符合ISO4217标准的三位字母代码，默认人民币：CNY',
  `cash_fee` int(11) DEFAULT NULL COMMENT '现金支付金额订单现金支付金额',
  `cash_fee_type` varchar(16) DEFAULT NULL COMMENT '货币类型，符合ISO4217标准的三位字母代码，默认人民币：CNY',
  `coupon_fee` int(11) DEFAULT NULL COMMENT '代金券金额<=订单金额，订单金额-代金券金额=现金支付金额',
  `coupon_count` int(11) DEFAULT NULL COMMENT '代金券使用数量',
  `coupon_type_$n` int(11) DEFAULT NULL COMMENT 'CASH--充值代金券NO_CASH---非充值代金券，仅在使用了免充值代金券时有返回（取值：CASH、NO_CASH）。$n为下标,从0开始编号，举例：coupon_type_0',
  `coupon_id_$n` varchar(20) DEFAULT NULL COMMENT '代金券ID,$n为下标，从0开始编号',
  `coupon_fee_$n` int(11) DEFAULT NULL COMMENT '单个代金券支付金额,$n为下标，从0开始编号',
  `transaction_id` varchar(32) DEFAULT NULL COMMENT '微信支付订单号',
  `out_trade_no` varchar(32) DEFAULT NULL COMMENT '商户系统的订单号，与请求一致',
  `attach` varchar(128) DEFAULT NULL COMMENT '商家数据包，原样返回',
  `time_end` varchar(14) DEFAULT NULL COMMENT '支付完成时间，格式为yyyyMMddHHmmss',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `t_notify_payment_results` */

insert  into `t_notify_payment_results` values (1,'wx7d7a3a3c74c58b2e','1304857001','WEB','a3nlL97xezIMksNmixg2DLnDsv7mNIqp',NULL,NULL,'SUCCESS',NULL,NULL,'oiTgS0bfjI5H5JCgzw6x0hujqoXY','N','JSAPI','CMB_CREDIT',1,NULL,'CNY',1,NULL,NULL,NULL,NULL,NULL,NULL,'4200000002201712079565888242','Nmb98FCpHD2PVlg7UF9OQ35UgHMMFNUf','14_1','20171207015347','2017-12-07 02:27:57'),(2,'wx7d7a3a3c74c58b2e','1304857001','WEB','3Pme8eMEFFuFbz9afrFNsnC6B8LponA5',NULL,NULL,'SUCCESS',NULL,NULL,'oiTgS0bfjI5H5JCgzw6x0hujqoXY','N','JSAPI','CMB_CREDIT',1,NULL,'CNY',1,NULL,NULL,NULL,NULL,NULL,NULL,'4200000025201712079568632202','Jl137R3hIaPIhVjcIoQIuBELFE6A0qI8','13_1','20171207014409','2017-12-07 02:48:15'),(3,'wx7d7a3a3c74c58b2e','1304857001','WEB','wrvcfaJ1pgFw81kvtmnqu8s15NnrFw57',NULL,NULL,'SUCCESS',NULL,NULL,'oiTgS0bA2eUv8rEZtLXoS9weyWZ8','N','JSAPI','CFT',1,NULL,'CNY',1,NULL,NULL,NULL,NULL,NULL,NULL,'4200000027201712079566125566','G22pthm4AFO5rS1di2PE00ARlI7phj8M','13_1','20171207021801','2017-12-07 02:52:11'),(4,'wx7d7a3a3c74c58b2e','1304857001','WEB','5Ili6LtJum4b4aKn0HCxApxzMFscDi58',NULL,NULL,'SUCCESS',NULL,NULL,'oiTgS0bA2eUv8rEZtLXoS9weyWZ8','N','JSAPI','CFT',1,NULL,'CNY',1,NULL,NULL,NULL,NULL,NULL,NULL,'4200000006201712165314343730','lnH2TUiNqaJDlR2s0jgc966qTLssTaRi','15_1','20171216165202','2017-12-16 16:51:59'),(5,'wx7d7a3a3c74c58b2e','1304857001','WEB','igkCt3OFE72lfz9wg3zFgntt88yLlu8p',NULL,NULL,'SUCCESS',NULL,NULL,'oiTgS0bA2eUv8rEZtLXoS9weyWZ8','N','JSAPI','CFT',1,NULL,'CNY',1,NULL,NULL,NULL,NULL,NULL,NULL,'4200000016201712165413490729','U7acIQjT4E9R6rqM85BobmsN401QGIEN','16_1','20171216172100','2017-12-16 17:20:56'),(6,'wx7d7a3a3c74c58b2e','1304857001','WEB','qEyPwHGmfsLGKP4cEFEPGs2kKwn2mz9z',NULL,NULL,'SUCCESS',NULL,NULL,'oiTgS0cJK-bt4-q5Wa53EQhB3wAM','N','JSAPI','HXB_CREDIT',1,NULL,'CNY',1,NULL,NULL,NULL,NULL,NULL,NULL,'4200000063201802279271243993','L6oldI8L5e9VQme0fQQh3a9oJpidiJeH','21_1','20180227151421','2018-02-27 15:14:21');

/*Table structure for table `t_obtain_open_record` */

DROP TABLE IF EXISTS `t_obtain_open_record`;

CREATE TABLE `t_obtain_open_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `t_obtain_open_record` */

/*Table structure for table `t_open_door_record` */

DROP TABLE IF EXISTS `t_open_door_record`;

CREATE TABLE `t_open_door_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) DEFAULT NULL COMMENT '业主id',
  `keyname` varchar(200) DEFAULT NULL COMMENT '钥匙名称',
  `isopen` int(11) DEFAULT NULL COMMENT '1、开门失败，2开门成功',
  `style` varchar(20) DEFAULT NULL COMMENT '开门方式:密码\\手机远程\\被授权',
  `iswho` varchar(100) DEFAULT NULL COMMENT '姓名、电话',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=99 DEFAULT CHARSET=utf8 COMMENT='开门记录表';

/*Data for the table `t_open_door_record` */

insert  into `t_open_door_record` values (1,1,'大冲新城市花园小区南门',1,'手机远程','周仪,15521005743','2018-03-15 15:06:18'),(2,1,'大冲新城市花园小区南门',2,'手机远程','周仪,15521005743','2018-03-15 15:06:21'),(3,1,'大冲新城市花园小区南门',1,'手机远程','周仪,15521005743','2018-03-15 15:06:21'),(4,1,'大冲新城市花园小区南门',2,'手机远程','周仪,15521005743','2018-03-15 15:06:22'),(5,1,'大冲新城市花园小区南门',1,'手机远程','周仪,15521005743','2018-03-15 15:06:53'),(6,1,'大冲新城市花园小区南门',2,'手机远程','周仪,15521005743','2018-03-15 15:06:53'),(7,1,'大冲新城市花园小区南门',1,'手机远程','周仪,15521005743','2018-03-15 15:06:53'),(8,1,'大冲新城市花园小区南门',2,'手机远程','周仪,15521005743','2018-03-15 15:06:53'),(9,1,'大冲新城市花园小区南门',1,'手机远程','周仪,15521005743','2018-03-15 15:06:53'),(10,1,'大冲新城市花园小区南门',2,'手机远程','周仪,15521005743','2018-03-15 15:06:53'),(11,1,'大冲新城市花园小区南门',2,'手机远程','周仪,15521005743','2018-03-15 15:06:53'),(12,1,'大冲新城市花园小区南门',2,'手机远程','周仪,15521005743','2018-03-15 15:06:53'),(13,1,'大冲新城市花园小区南门',2,'手机远程','周仪,15521005743','2018-03-15 15:06:53'),(14,1,'大冲新城市花园小区南门',1,'手机远程','周仪,15521005743','2018-03-15 15:06:53'),(15,1,'大冲新城市花园小区南门',2,'手机远程','周仪,15521005743','2018-03-15 15:06:53'),(16,1,'大冲新城市花园小区南门',2,'手机远程','周仪,15521005743','2018-03-15 15:06:53'),(17,1,'大冲新城市花园小区南门',1,'手机远程','周仪,15521005743','2018-03-15 15:06:53'),(18,1,'大冲新城市花园小区南门',1,'手机远程','周仪,15521005743','2018-03-15 15:06:53'),(19,1,'大冲新城市花园小区南门',1,'手机远程','周仪,15521005743','2018-03-15 15:06:53'),(20,1,'大冲新城市花园小区南门',2,'手机远程','周仪,15521005743','2018-03-15 15:06:53'),(21,1,'大冲新城市花园小区南门',2,'手机远程','周仪,15521005743','2018-03-15 15:06:53'),(22,1,'大冲新城市花园小区南门',2,'手机远程','周仪,15521005743','2018-03-15 15:06:53'),(23,1,'大冲新城市花园小区南门',1,'手机远程','周仪,15521005743','2018-03-15 15:06:53'),(24,1,'大冲新城市花园小区南门',2,'手机远程','周仪,15521005743','2018-03-15 15:06:53'),(25,1,'大冲新城市花园小区南门',2,'手机远程','周仪,15521005743','2018-03-15 15:06:53'),(26,1,'大冲新城市花园小区南门',2,'手机远程','周仪,15521005743','2018-03-15 15:06:53'),(27,1,'大冲新城市花园小区南门',2,'手机远程','周仪,15521005743','2018-03-15 15:06:53'),(28,1,'大冲新城市花园小区南门',2,'手机远程','周仪,15521005743','2018-03-15 15:06:53'),(29,1,'大冲新城市花园小区南门',2,'手机远程','周仪,15521005743','2018-03-15 15:06:53'),(30,1,'大冲新城市花园小区南门',2,'手机远程','周仪,15521005743','2018-03-15 15:06:53'),(31,1,'大冲新城市花园小区南门',2,'手机远程','周仪,15521005743','2018-03-15 15:06:53'),(32,2,'前门—龙岗共和小区公寓',2,'手机远程','邓飞,15972935811','2018-03-17 16:51:28'),(33,1,'后门—龙岗共和小区公寓',2,'手机远程','周仪,15521005743','2018-03-17 16:51:35'),(34,1,'后门—龙岗共和小区公寓',2,'手机远程','周仪,15521005743','2018-03-17 16:51:34'),(35,1,'前门—龙岗共和小区公寓',2,'手机远程','周仪,15521005743','2018-03-17 16:51:24'),(36,1,'后门—龙岗共和小区公寓',2,'手机远程','周仪,15521005743','2018-03-17 16:51:33'),(37,1,'后门—龙岗共和小区公寓',2,'手机远程','周仪,15521005743','2018-03-17 16:51:32'),(38,2,'前门—龙岗共和小区公寓',2,'手机远程','邓飞,15972935811','2018-03-17 16:51:23'),(39,2,'前门—龙岗共和小区公寓',2,'手机远程','邓飞,15972935811','2018-03-17 16:51:21'),(40,2,'前门—龙岗共和小区公寓',2,'手机远程','邓飞,15972935811','2018-03-17 16:51:20'),(41,2,'前门—龙岗共和小区公寓',2,'手机远程','邓飞,15972935811','2018-03-17 16:51:20'),(42,1,'后门—龙岗共和小区公寓',2,'手机远程','周仪,15521005743','2018-03-17 16:51:37'),(43,1,'前门—龙岗共和小区公寓',2,'手机远程','周仪,15521005743','2018-03-17 16:51:13'),(44,2,'前门—龙岗共和小区公寓',2,'手机远程','邓飞,15972935811','2018-03-15 15:07:10'),(45,1,'后门—龙岗共和小区公寓',2,'手机远程','周仪,15521005743','2018-03-15 15:06:53'),(46,2,'前门—龙岗共和小区公寓',1,'手机远程','邓飞,15972935811','2018-03-15 15:07:10'),(47,2,'前门—龙岗共和小区公寓',1,'手机远程','邓飞,15972935811','2018-03-11 15:07:10'),(48,2,'前门—龙岗共和小区公寓',1,'手机远程','邓飞,15972935811','2018-03-11 15:07:10'),(49,2,'前门—龙岗共和小区公寓',1,'手机远程','邓飞,15972935811','2018-03-11 15:07:10'),(50,2,'前门—龙岗共和小区公寓',1,'手机远程','邓飞,15972935811','2018-03-11 15:07:10'),(51,2,'后门—龙岗共和小区公寓',1,'手机远程','邓飞,15972935811','2018-03-11 15:07:10'),(52,3,'前门—龙岗共和小区公寓',1,'手机远程','Danny,13600197878','2018-03-15 15:07:24'),(53,3,'后门—龙岗共和小区公寓',1,'手机远程','Danny,13600197878','2018-03-15 15:07:24'),(54,3,'后门—龙岗共和小区公寓',1,'手机远程','Danny,13600197878','2018-03-15 15:07:24'),(55,1,'前门—龙岗共和小区公寓',1,'手机远程','周仪,15521005743','2018-03-15 15:06:53'),(56,1,'前门—龙岗共和小区公寓',1,'手机远程','周仪,15521005743','2018-03-15 15:06:53'),(57,1,'前门—龙岗共和小区公寓',1,'手机远程','周仪,15521005743','2018-03-15 15:06:53'),(58,1,'前门—龙岗共和小区公寓',1,'手机远程','周仪,15521005743','2018-03-15 15:06:53'),(59,1,'后门—龙岗共和小区公寓',1,'手机远程','周仪,15521005743','2018-03-15 15:06:53'),(60,1,'后门—龙岗共和小区公寓',1,'手机远程','周仪,15521005743','2018-03-15 15:06:53'),(61,1,'后门—龙岗共和小区公寓',1,'手机远程','周仪,15521005743','2018-03-15 15:06:53'),(62,2,'前门—龙岗共和小区公寓',1,'手机远程','邓飞,15972935811','2018-03-13 15:07:10'),(63,2,'前门—龙岗共和小区公寓',1,'手机远程','邓飞,15972935811','2018-03-13 15:07:10'),(64,1,'前门—龙岗共和小区公寓',1,'手机远程','周仪,15521005743','2018-03-13 15:06:53'),(65,1,'前门—龙岗共和小区公寓',1,'手机远程','周仪,15521005743','2018-03-15 15:06:53'),(66,1,'后门—龙岗共和小区公寓',1,'手机远程','周仪,15521005743','2018-03-15 15:06:53'),(67,1,'后门—龙岗共和小区公寓',1,'手机远程','周仪,15521005743','2018-03-15 15:06:53'),(68,1,'后门—龙岗共和小区公寓',1,'手机远程','周仪,15521005743','2018-03-15 15:06:53'),(69,2,'前门—龙岗共和小区公寓',1,'手机远程','邓飞,15972935811','2018-03-15 15:07:10'),(70,2,'前门—龙岗共和小区公寓',1,'手机远程','邓飞,15972935811','2018-03-15 15:07:10'),(71,3,'前门—龙岗共和小区公寓',1,'手机远程','Danny,13600197878','2018-03-15 15:07:24'),(72,3,'后门—龙岗共和小区公寓',1,'手机远程','Danny,13600197878','2018-03-15 15:07:24'),(73,3,'后门—龙岗共和小区公寓',1,'手机远程','Danny,13600197878','2018-03-15 15:07:24'),(74,3,'前门—龙岗共和小区公寓',1,'手机远程','Danny,13600197878','2018-03-15 15:07:24'),(75,3,'后门—龙岗共和小区公寓',1,'手机远程','Danny,13600197878','2018-03-15 15:07:24'),(76,2,'前门—龙岗共和小区公寓',1,'手机远程','邓飞,15972935811','2018-03-15 15:07:10'),(77,2,'后门—龙岗共和小区公寓',1,'手机远程','邓飞,15972935811','2018-03-15 15:07:10'),(78,2,'前门—龙岗共和小区公寓',1,'手机远程','邓飞,15972935811','2018-03-15 15:07:10'),(79,2,'前门—龙岗共和小区公寓',1,'手机远程','邓飞,15972935811','2018-03-15 15:07:10'),(80,2,'前门—龙岗共和小区公寓',1,'手机远程','邓飞,15972935811','2018-03-15 15:07:10'),(81,2,'前门—龙岗共和小区公寓',1,'手机远程','邓飞,15972935811','2018-03-15 15:07:10'),(82,2,'前门—龙岗共和小区公寓',1,'手机远程','邓飞,15972935811','2018-03-15 15:07:10'),(83,2,'前门—龙岗共和小区公寓',1,'手机远程','邓飞,15972935811','2018-03-15 15:07:10'),(84,2,'前门—龙岗共和小区公寓',1,'手机远程','邓飞,15972935811','2018-03-15 15:07:10'),(85,2,'前门—龙岗共和小区公寓',1,'手机远程','邓飞,15972935811','2018-03-15 15:07:10'),(86,2,'前门—龙岗共和小区公寓',1,'手机远程','邓飞,15972935811','2018-03-15 15:07:10'),(87,2,'前门—龙岗共和小区公寓',1,'手机远程','邓飞,15972935811','2018-03-15 15:07:10'),(88,2,'前门—龙岗共和小区公寓',1,'手机远程','邓飞,15972935811','2018-03-15 15:07:10'),(89,2,'前门—龙岗共和小区公寓',1,'手机远程','邓飞,15972935811','2018-03-15 15:07:10'),(90,2,'前门—龙岗共和小区公寓',1,'手机远程','邓飞,15972935811','2018-03-15 15:07:10'),(91,2,'前门—龙岗共和小区公寓',1,'手机远程','邓飞,15972935811','2018-03-15 15:07:10'),(92,2,'前门—龙岗共和小区公寓',1,'手机远程','邓飞,15972935811','2018-03-15 15:07:10'),(93,2,'前门—龙岗共和小区公寓',1,'手机远程','邓飞,15972935811','2018-03-15 15:07:10'),(94,2,'前门—龙岗共和小区公寓',1,'手机远程','邓飞,15972935811','2018-03-15 15:07:10'),(95,2,'前门—龙岗共和小区公寓',1,'手机远程','邓飞,15972935811','2018-03-15 15:07:10'),(96,2,'前门—龙岗共和小区公寓',1,'手机远程','邓飞,15972935811','2018-03-15 15:07:10'),(97,2,'后门—龙岗共和小区公寓',1,'手机远程','邓飞,15972935811','2018-03-15 15:07:10'),(98,2,'后门—龙岗共和小区公寓',1,'手开','邓飞,15972935811','2018-03-27 15:53:08');

/*Table structure for table `t_owner_account` */

DROP TABLE IF EXISTS `t_owner_account`;

CREATE TABLE `t_owner_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `telphone` varchar(11) DEFAULT NULL COMMENT '用户名',
  `userpwd` varchar(200) DEFAULT NULL COMMENT '密码',
  `balance` double DEFAULT NULL COMMENT '账户余额',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='业主帐号表';

/*Data for the table `t_owner_account` */

insert  into `t_owner_account` values (1,'15521005743','b6d5f22d83056ccbdc94cb4cb73acde809cf5381f0a35d75f0266c50707f9852',0,'2018-04-04 13:48:21'),(2,'15972935811','c2ec18a3136c47533fc886e5ba18e985fe02246c7d987a49f8bc101ddfab1921',0,'2018-04-04 13:48:48'),(3,'13600197878','e1ee83fc10aa6f6479271fb022db806980ceb0699915062b260b1fff1fe19daf',0,'2018-04-04 13:49:01'),(4,'15801791047','a3583ac3c9a853e6a1b7985d006624d0c0ee92e26242ff5826228b1ebe877de8',0,'2018-04-04 13:49:11');

/*Table structure for table `t_owner_house_relation` */

DROP TABLE IF EXISTS `t_owner_house_relation`;

CREATE TABLE `t_owner_house_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ownerid` int(11) DEFAULT NULL COMMENT '业主ID',
  `infoid` int(11) DEFAULT NULL COMMENT '业主信息ID',
  `createtime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `t_owner_house_relation` */

insert  into `t_owner_house_relation` values (1,1,1,'2018-03-30 14:30:03'),(2,2,2,'2018-03-30 14:30:06'),(3,3,3,'2018-03-30 14:30:07'),(4,4,4,'2018-03-30 14:30:09'),(5,8,11,'2018-03-30 15:15:17'),(6,9,12,'2018-03-30 15:26:52'),(7,10,13,'2018-03-30 15:29:19'),(8,11,14,'2018-03-30 15:34:21'),(9,12,15,'2018-03-30 15:40:54'),(10,13,16,'2018-04-03 19:26:44'),(11,14,17,'2018-04-04 09:27:40'),(12,15,18,'2018-04-04 09:28:39'),(13,15,19,'2018-04-04 09:31:50'),(14,16,20,'2018-04-04 09:39:55'),(15,17,21,'2018-04-04 13:35:14'),(16,16,22,'2018-04-04 13:38:24'),(17,18,23,'2018-04-04 13:55:00'),(18,18,24,'2018-04-04 14:25:01'),(19,19,25,'2018-04-04 14:59:25'),(20,20,26,'2018-04-04 15:13:28'),(21,16,27,'2018-04-04 15:15:41'),(22,16,27,'2018-04-04 15:18:17'),(23,20,28,'2018-04-04 15:19:04'),(24,21,29,'2018-04-04 15:23:20');

/*Table structure for table `t_owner_info` */

DROP TABLE IF EXISTS `t_owner_info`;

CREATE TABLE `t_owner_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ownername` varchar(16) DEFAULT NULL COMMENT '业主姓名',
  `telphone` varchar(11) DEFAULT NULL COMMENT '业主联系电话',
  `p_m_id` int(11) DEFAULT NULL COMMENT '物业ID',
  `units` varchar(12) DEFAULT NULL COMMENT 'x栋x单元',
  `rooms` varchar(12) DEFAULT NULL COMMENT '房间号',
  `isliving` int(11) DEFAULT NULL COMMENT '是否居住，0否，1是',
  `leave_time` varchar(30) DEFAULT NULL COMMENT '退房时间',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

/*Data for the table `t_owner_info` */

insert  into `t_owner_info` values (1,'周仪','15521005743',1,'2栋2E座','906',1,NULL,'2018-03-30 15:03:46'),(2,'邓飞','15972935811',4,'2栋2C座','708',1,NULL,'2018-04-03 10:06:44'),(3,'Danny','13600197878',1,'1栋8C座','1006',1,NULL,'2018-03-30 15:03:49'),(4,'李挚','15801791047',2,'1栋6A座','1001',1,NULL,'2018-03-30 15:03:50'),(9,'李四','15823992343',1,'21栋2A座','11',0,'2018-04-04 15:36:23.427','2018-04-04 15:36:23'),(11,'晓华','15922282222',3,'3栋1B座','8011',1,NULL,'2018-04-03 10:06:37'),(12,'周杰伦','15901200000',1,'21栋8A座','180010',0,'2018-04-04 15:36:46.578','2018-04-04 15:36:46'),(13,'小明','13802301111',2,'9栋1C座','12021',1,NULL,'2018-04-03 10:06:40'),(14,'王五','13902020000',1,'7栋2A座','8011',1,NULL,'2018-04-04 13:47:56'),(15,'小S','15802037855',1,'19栋21座','110623',0,'2018-04-04 15:36:39.22','2018-04-04 15:36:38'),(16,'王五','16455465456',1,'1栋2C座','321',0,'2018-04-04 15:36:19.868','2018-04-04 15:36:19'),(28,'李四','13071252023',1,'1栋C座','1004',0,'2018-04-04 15:21:34.944','2018-04-04 15:22:30'),(25,'成龙','13071252024',1,'1栋C座','010',1,NULL,'2018-04-04 14:59:25'),(27,'张飞','13071252025',1,'1栋C座','10002',1,NULL,'2018-04-04 15:18:18'),(26,'刘备','13071252023',1,'1栋C座','010',1,NULL,'2018-04-04 15:13:28'),(24,'王菲','13071252026',1,'1栋C座','102',1,NULL,'2018-04-04 14:25:01'),(29,'四小龙','13071252027',1,'1栋C座','103',1,NULL,'2018-04-04 15:23:20');

/*Table structure for table `t_owner_key_relation` */

DROP TABLE IF EXISTS `t_owner_key_relation`;

CREATE TABLE `t_owner_key_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) DEFAULT NULL COMMENT '业主id',
  `key_id` int(11) DEFAULT NULL COMMENT '钥匙id',
  `status` int(11) DEFAULT NULL COMMENT '状态1为可用，2为无效',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='业主和钥匙关联表';

/*Data for the table `t_owner_key_relation` */

insert  into `t_owner_key_relation` values (1,1,1,1,'2017-11-26 15:09:57'),(2,1,2,1,'2017-11-26 15:10:30'),(3,2,1,1,'2018-01-17 19:11:21'),(4,2,2,1,'2018-01-17 19:11:35'),(5,3,1,1,'2018-01-18 14:00:13'),(6,3,2,1,'2018-01-18 14:00:10');

/*Table structure for table `t_owner_paycat` */

DROP TABLE IF EXISTS `t_owner_paycat`;

CREATE TABLE `t_owner_paycat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p_m_id` int(11) DEFAULT NULL COMMENT '物业管理处ID',
  `owner_id` int(11) DEFAULT NULL COMMENT '业主ID',
  `owner_name` varchar(50) DEFAULT NULL COMMENT '业主名字',
  `pay_item` int(11) DEFAULT NULL COMMENT '費用類型',
  `amount` double DEFAULT NULL COMMENT '金额',
  `status` int(11) DEFAULT NULL COMMENT '缴费状态0:已缴 1:未缴',
  `finishtime` timestamp NULL DEFAULT NULL COMMENT '缴费完成时间',
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

/*Data for the table `t_owner_paycat` */

insert  into `t_owner_paycat` values (1,2,2,'邓飞',4,30000,0,'2017-10-10 16:44:40','2017-10-04 16:44:40'),(2,2,2,'邓飞',3,4000,0,'2017-10-10 16:44:40','2017-10-04 16:44:40'),(3,2,2,'邓飞',2,200000,0,'2017-10-10 16:44:40','2017-10-04 16:44:40'),(4,2,2,'邓飞',1,50000,0,'2017-10-10 16:44:40','2017-10-04 16:44:40'),(5,2,2,'邓飞',1,50000,0,'2017-11-04 16:26:59','2017-11-04 16:26:59'),(6,2,2,'邓飞',2,200000,0,'2017-11-04 16:26:59','2017-11-04 16:26:59'),(7,2,2,'邓飞',3,4000,0,'2017-11-04 16:26:59','2017-11-04 16:26:59'),(8,2,2,'邓飞',4,30000,0,'2017-11-04 16:26:59','2017-11-04 16:26:59'),(13,2,2,'邓飞',1,1,0,'2017-12-16 17:13:06','2017-11-26 16:26:59'),(14,2,2,'邓飞',2,1,0,'2017-12-16 17:13:09','2017-11-26 16:26:59'),(15,2,2,'邓飞',3,1,0,'2017-12-16 17:13:10','2017-11-26 16:26:59'),(16,2,2,'邓飞',4,1,0,'2017-12-16 17:20:56','2017-11-26 16:26:59'),(17,2,1,'周仪',1,1,1,'2018-03-22 11:32:33','2018-01-03 17:19:38'),(18,2,1,'周仪',2,1,1,'2018-03-22 11:32:35','2018-01-03 17:20:23'),(19,2,1,'周仪',3,1,1,'2018-03-22 11:32:37','2018-01-03 17:20:25'),(20,2,1,'周仪',4,1,1,'2018-03-22 11:32:38','2018-01-03 17:20:26'),(21,2,3,'Danny',1,1,0,'2018-02-27 15:14:21','2018-02-27 11:58:03'),(22,2,3,'Danny',2,1,1,'2018-03-22 11:32:45','2018-02-27 11:58:26'),(23,2,3,'Danny',3,1,1,'2018-03-22 11:32:47','2018-02-27 11:58:28'),(24,2,3,'Danny',4,1,1,'2018-03-22 11:32:49','2018-02-27 11:58:29'),(25,2,3,'Danny',5,1,1,'2018-03-22 11:32:51','2018-02-27 15:09:14'),(26,2,2,'邓飞',1,1,1,'2018-03-22 11:32:52','2018-02-27 15:09:16'),(27,2,2,'邓飞',2,1,1,'2018-03-22 11:32:54','2018-02-27 15:09:18'),(28,2,2,'邓飞',3,1,1,'2018-03-22 11:32:55','2018-02-27 15:09:19'),(29,2,2,'邓飞',4,1,1,'2018-03-22 11:32:57','2018-03-14 13:09:05'),(30,2,2,'邓飞',5,1,1,'2018-03-22 11:32:58','2018-03-14 13:09:08'),(65,1,0,'李志',1,100,0,'2018-04-02 16:48:46','2018-04-02 16:48:46'),(32,1,4,'李一',2,1,0,'2018-03-22 11:33:02','2018-03-14 13:09:11'),(33,1,4,'李一',3,1,1,'2018-03-22 11:33:03','2018-03-15 14:28:21'),(67,1,0,'李斯',5,100,0,'2018-04-03 19:27:56','2018-04-03 19:27:56'),(35,1,4,'李挚',5,1,0,'2018-03-22 11:33:07','2018-03-15 14:28:25'),(69,1,0,'张三',1,100,0,'2018-04-03 19:55:58','2018-04-03 19:56:27'),(68,1,0,'李斯',1,100,0,'2018-04-03 19:31:41','2018-04-03 19:31:40'),(66,1,0,'李志',1,100,0,'2018-04-02 16:48:52','2018-04-02 16:48:52'),(59,1,0,'4234',1,435,0,'2018-03-30 20:43:11','2018-03-30 20:43:17'),(64,1,0,'张三',1,122,0,'2018-04-02 09:55:57','2018-04-02 09:56:08'),(74,1,0,'张三',2,1000,1,NULL,'2018-04-04 10:19:52');

/*Table structure for table `t_owner_pmd` */

DROP TABLE IF EXISTS `t_owner_pmd`;

CREATE TABLE `t_owner_pmd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ownerid` int(11) DEFAULT NULL COMMENT '业主编号',
  `p_m_id` int(11) DEFAULT NULL COMMENT '小区物业管理处ID',
  `createtime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Data for the table `t_owner_pmd` */

insert  into `t_owner_pmd` values (1,1,1,'2018-03-30 14:30:18'),(2,2,1,'2018-03-30 14:30:20'),(3,3,1,'2018-03-30 14:30:21'),(4,4,2,'2018-03-30 14:30:23'),(8,8,1,'2018-03-30 15:15:17'),(10,10,1,'2018-03-30 15:29:19'),(11,11,1,'2018-03-30 15:34:21'),(20,18,1,'2018-04-04 14:25:01'),(21,19,1,'2018-04-04 14:59:25'),(24,16,1,'2018-04-04 15:18:17'),(25,21,1,'2018-04-04 15:23:20');

/*Table structure for table `t_pay_unifiedorder` */

DROP TABLE IF EXISTS `t_pay_unifiedorder`;

CREATE TABLE `t_pay_unifiedorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appid` varchar(32) DEFAULT NULL COMMENT '微信分配的小程序ID',
  `mch_id` varchar(32) DEFAULT NULL COMMENT '微信支付分配的商户号',
  `device_info` varchar(32) DEFAULT NULL COMMENT '设备号，小程序传"WEB"',
  `nonce_str` varchar(32) DEFAULT NULL COMMENT '随机字符串，不长于32位',
  `sign` varchar(32) DEFAULT NULL COMMENT '签名',
  `sign_type` varchar(32) DEFAULT NULL COMMENT '签名类型，目前支持HMAC-SHA256和MD5，默认为MD5',
  `body` varchar(128) DEFAULT NULL COMMENT '商品简单描述，该字段须严格按照规范传递',
  `detail` varchar(6000) DEFAULT NULL COMMENT '单品优惠字段',
  `attach` varchar(127) DEFAULT NULL COMMENT '附加数据，在查询API和支付通知中原样返回，该字段主要用于商户携带订单的自定义数据',
  `out_trade_no` varchar(32) DEFAULT NULL COMMENT '商户系统内部的订单号,32个字符内、可包含字母, 其他说明见',
  `fee_type` varchar(16) DEFAULT NULL COMMENT '符合ISO 4217标准的三位字母代码，默认人民币：CNY',
  `total_fee` int(11) DEFAULT NULL COMMENT '订单总金额，单位为分',
  `spbill_create_ip` varchar(16) DEFAULT NULL COMMENT 'APP和网页支付提交用户端ip，Native支付填调用微信支付API的机器IP。',
  `time_start` varchar(14) DEFAULT NULL COMMENT '订单生成时间，格式为yyyyMMddHHmmss，如2009年12月25日9点10分10秒表示为20091225091010',
  `time_expire` varchar(14) DEFAULT NULL COMMENT '订单失效时间，格式为yyyyMMddHHmmss，如2009年12月27日9点10分10秒表示为20091227091010',
  `goods_tag` varchar(32) DEFAULT NULL COMMENT '商品标记，代金券或立减优惠功能的参数',
  `notify_url` varchar(256) DEFAULT NULL COMMENT '接收微信支付异步通知回调地址，通知url必须为直接可访问的url，不能携带参数。',
  `trade_type` varchar(16) DEFAULT NULL COMMENT '小程序取值如下：JSAPI',
  `limit_pay` varchar(32) DEFAULT NULL COMMENT 'no_credit--指定不能使用信用卡支付',
  `openid` varchar(128) DEFAULT NULL COMMENT 'trade_type=JSAPI，此参数必传，用户在商户appid下的唯一标识',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

/*Data for the table `t_pay_unifiedorder` */

insert  into `t_pay_unifiedorder` values (1,'wx7d7a3a3c74c58b2e','1304857001','WEB','MuqKIohw48dzMA3GLHgGPdwc8ivhO2D5','9BF0B1A1735A41477A99EBC06E877577','MD5','水电费',NULL,'13_1','1569644269','CNY',1,'116.24.15.47','20171205004955','20171207004955','水电费-1','https://api.yingtong-pm.cn:32312/v1/wxNotify','JSAPI',NULL,'oiTgS0bfjI5H5JCgzw6x0hujqoXY','2017-12-05 00:49:55'),(2,'wx7d7a3a3c74c58b2e','1304857001','WEB','eqh9yCO2vvmI3sAibb4GD0pqhxE8A5nM','EDFCCDF0B6F1490B289ADA707B25D8F4','MD5','水电费',NULL,'13_1','2140779185','CNY',1,'116.24.15.47','20171205010803','20171207010803','水电费-1','https://api.yingtong-pm.cn:32312/v1/wxNotify','JSAPI',NULL,'oiTgS0bfjI5H5JCgzw6x0hujqoXY','2017-12-05 01:08:03'),(3,'wx7d7a3a3c74c58b2e','1304857001','WEB','aOfGjbBCmmpgsOf9atLoMx7ivdydyPas','31F8F506211B9E51226DB9981B85542E','MD5','水电费',NULL,'13_1','1132608425','CNY',1,'116.24.15.47','20171205012725','20171207012725','水电费-1','https://api.yingtong-pm.cn:32312/v1/wxNotify','JSAPI',NULL,'oiTgS0bfjI5H5JCgzw6x0hujqoXY','2017-12-05 01:27:25'),(4,'wx7d7a3a3c74c58b2e','1304857001','WEB','AtdPmGMPusHuFFhLp3sf2xxM8FKoDLa6','461090967EBCFA3389F0CD289151E7DF','MD5','水电费',NULL,'13_1','1977846407','CNY',1,'14.153.238.76','20171205020652','20171207020652','水电费-1','https://api.yingtong-pm.cn:32312/v1/wxNotify','JSAPI',NULL,'oiTgS0bA2eUv8rEZtLXoS9weyWZ8','2017-12-05 02:06:52'),(5,'wx7d7a3a3c74c58b2e','1304857001','WEB','D0Pp8GyJc249OioyydoG6ODCOa3jOhN0','138200CF99071BC1FD5E5E1E0C996640','MD5','水电费',NULL,'13_1','1977846407','CNY',1,'14.153.238.76','20171205020652','20171207020652','水电费-1','https://api.yingtong-pm.cn:32312/v1/wxNotify','JSAPI',NULL,'oiTgS0bA2eUv8rEZtLXoS9weyWZ8','2017-12-05 02:06:52'),(6,'wx7d7a3a3c74c58b2e','1304857001','WEB','1vo58FKdeK95aD2ltLD3cbNzkrKpCagb','53BD9CA8314E55C2B2AB7C8513091E0A','MD5','水电费',NULL,'13_1','414850796','CNY',1,'14.153.238.76','20171205020652','20171207020652','水电费-1','https://api.yingtong-pm.cn:32312/v1/wxNotify','JSAPI',NULL,'oiTgS0bA2eUv8rEZtLXoS9weyWZ8','2017-12-05 02:06:52'),(7,'wx7d7a3a3c74c58b2e','1304857001','WEB','P3j6nzx5D1F78aC82btf6vv8iyrvIAkJ','39D38961325BC6BB0E5E14C81AC8CAA7','MD5','水电费',NULL,'13_1','1642177323','CNY',1,'14.153.238.76','20171205024437','20171207024437','水电费-1','https://api.yingtong-pm.cn:32312/v1/wxNotify','JSAPI',NULL,'oiTgS0bA2eUv8rEZtLXoS9weyWZ8','2017-12-05 02:44:37'),(8,'wx7d7a3a3c74c58b2e','1304857001','WEB','g7FEGgM61l2g2h5y2ufhldA25lJN9kvL','84E9AD0765F1E782880953444A6ED14F','MD5','水电费',NULL,'13_1','1820284806','CNY',1,'14.153.238.76','20171205025002','20171207025002','水电费-1','https://api.yingtong-pm.cn:32312/v1/wxNotify','JSAPI',NULL,'oiTgS0bA2eUv8rEZtLXoS9weyWZ8','2017-12-05 02:50:02'),(9,'wx7d7a3a3c74c58b2e','1304857001','WEB','ewA5I7Gq8eAvH0OB8fJjzdmamNjje0Hr','75B9C1F279454CB3CDE66ECABE5AFD7E','MD5','水电费',NULL,'13_1','1273646342','CNY',1,'14.153.238.76','20171205025542','20171207025542','水电费-1','https://api.yingtong-pm.cn:32312/v1/wxNotify','JSAPI',NULL,'oiTgS0bA2eUv8rEZtLXoS9weyWZ8','2017-12-05 02:55:42'),(10,'wx7d7a3a3c74c58b2e','1304857001','WEB','iDDh5obBJKdENok7D91tPEvKdOG55AGI','19271520E63763A30958144589E00FEC','MD5','水电费',NULL,'13_1','769458428','CNY',1,'14.153.238.76','20171205030143','20171207030143','水电费-1','https://api.yingtong-pm.cn:32312/v1/wxNotify','JSAPI',NULL,'oiTgS0bA2eUv8rEZtLXoS9weyWZ8','2017-12-05 03:01:43'),(11,'wx7d7a3a3c74c58b2e','1304857001','WEB','k6NDiMuHDkCeNLJoNfvMrn3mqNLPNDwo','AF444452861E48DEAEB9D1C2DBC35A6D','MD5','水电费',NULL,'13_1','289173436','CNY',1,'183.15.240.76','20171205100557','20171207100557','水电费-1','https://api.yingtong-pm.cn:32312/v1/wxNotify','JSAPI',NULL,'oiTgS0bA2eUv8rEZtLXoS9weyWZ8','2017-12-05 10:05:57'),(12,'wx7d7a3a3c74c58b2e','1304857001','WEB','x9oexaGfHbHry9E8JMC5bg65IOL85Bu9','A8393E124A4A4BAB1B5ACE2BE735346','MD5','水电费',NULL,'13_1','je4E6C76cupsUk5NpUFbCmlqR4ithdSV','CNY',1,'183.15.240.76','20171205124124','20171207124124','水电费-1','https://api.yingtong-pm.cn:32312/v1/wxNotify','JSAPI',NULL,'oiTgS0bA2eUv8rEZtLXoS9weyWZ8','2017-12-05 12:41:24'),(13,'wx7d7a3a3c74c58b2e','1304857001','WEB','L5bzNAJDsdBcyycnutN7nHPiixPFJIan','7AF1BE30624551AC9EE9BF8CD7C9BC3E','MD5','水电费',NULL,'13_1','j4GtnI2Ie17GNCI1EoUiHVSDdJTEcQcU','CNY',1,'183.15.240.76','20171205130849','20171207130849','水电费-1','https://api.yingtong-pm.cn:32312/v1/wxNotify','JSAPI',NULL,'oiTgS0bA2eUv8rEZtLXoS9weyWZ8','2017-12-05 13:08:50'),(14,'wx7d7a3a3c74c58b2e','1304857001','WEB','r1NccC7awEkkctsxrOyqM6edGudw0z06','E5BAFC6D26F740C8CB2FC24E20872C9E','MD5','水电费',NULL,'13_1','sGkfOGIM16Tis5eCFN9g5dde9NG8Nj8g','CNY',1,'116.24.15.47','20171206235929','20171208235929','水电费-1','https://api.yingtong-pm.cn:32312/v1/wxNotify','JSAPI',NULL,'oiTgS0bfjI5H5JCgzw6x0hujqoXY','2017-12-06 23:59:29'),(15,'wx7d7a3a3c74c58b2e','1304857001','WEB','PJdocOckd9zuzPda0pLqCs4ktg5x7mwh','3B623A95AECCE3FBA102F9409A19690E','MD5','水电费',NULL,'13_1','nRCtqPDBg25qLoHo6m96lTHOpUqtPakr','CNY',1,'116.24.15.47','20171207000238','20171209000238','水电费-1','https://api.yingtong-pm.cn:32312/v1/wxNotify','JSAPI',NULL,'oiTgS0bfjI5H5JCgzw6x0hujqoXY','2017-12-07 00:02:38'),(16,'wx7d7a3a3c74c58b2e','1304857001','WEB','x8xqxbCq7xkiCgpfyqfLxg5wvzI8yakh','58BB6EA82D3766A38A759C596F74253D','MD5','水电费',NULL,'13_1','csTst7oNPhHobnCEeNS8ik9IUEUb2EAt','CNY',1,'116.24.15.47','20171207000314','20171209000314','水电费-1','https://api.yingtong-pm.cn:32312/v1/wxNotify','JSAPI',NULL,'oiTgS0bfjI5H5JCgzw6x0hujqoXY','2017-12-07 00:03:14'),(17,'wx7d7a3a3c74c58b2e','1304857001','WEB','qmJ40FELLjy9dtLyNw3zchig9g4KB27c','7B315F555D7B9E701AAE110B26CD4671','MD5','水电费',NULL,'13_1','EtbGG1QoaLukQgbdpEG0CkFfs57aV7CG','CNY',1,'116.24.15.47','20171207001336','20171209001336','水电费-1','https://api.yingtong-pm.cn:32312/v1/wxNotify','JSAPI',NULL,'oiTgS0bfjI5H5JCgzw6x0hujqoXY','2017-12-07 00:13:36'),(18,'wx7d7a3a3c74c58b2e','1304857001','WEB','teo5lwF0nH4dz2ris8h707jqqgzztcNL','C94C40B2E5E74DB293CDBF6E545426E7','MD5','水电费',NULL,'13_1','enQLrmdR9LpRVnNlcJqcalc1aG9SCNkj','CNY',1,'116.24.15.47','20171207001415','20171209001415','水电费-1','https://api.yingtong-pm.cn:32312/v1/wxNotify','JSAPI',NULL,'oiTgS0bfjI5H5JCgzw6x0hujqoXY','2017-12-07 00:14:15'),(19,'wx7d7a3a3c74c58b2e','1304857001','WEB','ebuLIiAz9zo4JtLpl0PvCwwzzfyopqs2','E227FA3950FFDE9F7BFFF3FD521B97D6','MD5','房租',NULL,'14_1','bBG0RmllepHPrpmd1hLgIJ2hcnqsIIjM','CNY',1,'116.24.15.47','20171207001441','20171209001441','房租-1','https://api.yingtong-pm.cn:32312/v1/wxNotify','JSAPI',NULL,'oiTgS0bfjI5H5JCgzw6x0hujqoXY','2017-12-07 00:14:41'),(20,'wx7d7a3a3c74c58b2e','1304857001','WEB','g72yPBE1qcj50o0iak3Jnjlhre5aapav','E74E34DBCDE103E2BF91EE8695A77F7D','MD5','房租',NULL,'14_1','a0EGAISoaLhaggCo6TTMjVggrl8kTJm8','CNY',1,'116.24.15.47','20171207001520','20171209001520','房租-1','https://api.yingtong-pm.cn:32312/v1/wxNotify','JSAPI',NULL,'oiTgS0bfjI5H5JCgzw6x0hujqoXY','2017-12-07 00:15:20'),(21,'wx7d7a3a3c74c58b2e','1304857001','WEB','xHeuCEfP24Aoaz02gImejtpnjCsnyn9I','861A35DFD289543626F18238F58EFA26','MD5','水电费',NULL,'13_1','U9BTIJbSmBUOrq9d7MQSgi7aptoVN6Tu','CNY',1,'116.24.15.47','20171207001657','20171209001657','水电费-1','https://api.yingtong-pm.cn:32312/v1/wxNotify','JSAPI',NULL,'oiTgS0bfjI5H5JCgzw6x0hujqoXY','2017-12-07 00:16:57'),(22,'wx7d7a3a3c74c58b2e','1304857001','WEB','3BpI3recBLxbLsjiq6IEtnnHmB2F0woK','476A0A23A5F9E202B3CE1E059A0B22F5','MD5','水电费',NULL,'13_1','0EM0L48247HodhE9iCoEqRQ9A4Gg5DTO','CNY',1,'116.24.136.54','20171207005047','20171209005047','水电费-1','https://api.yingtong-pm.cn:32312/v1/wxNotify','JSAPI',NULL,'oiTgS0bfjI5H5JCgzw6x0hujqoXY','2017-12-07 00:50:47'),(23,'wx7d7a3a3c74c58b2e','1304857001','WEB','1s1jepmrmrDjcjJFezM6l8Ov4PnpwpIm','0CFA3AA8834B63DFEA73C79476536D61','MD5','水电费',NULL,'13_1','cOLs5P2QM58CFaCMhIbBdsqNbFhQRHdl','CNY',1,'116.24.136.54','20171207012016','20171209012016','水电费-1','https://api.yingtong-pm.cn:32312/v1/wxNotify','JSAPI',NULL,'oiTgS0bfjI5H5JCgzw6x0hujqoXY','2017-12-07 01:20:16'),(24,'wx7d7a3a3c74c58b2e','1304857001','WEB','oCuIBpKi6ldOKs9u9j2f0NdnicdmetOk','9627AFB54FBA9DFB3FE4CE349C8E2481','MD5','水电费',NULL,'13_1','pGloORgR4Ia8d6c3hTFEpk4RgAkuFGSD','CNY',1,'116.24.136.54','20171207012248','20171209012248','水电费-1','https://api.yingtong-pm.cn:32312/v1/wxNotify','JSAPI',NULL,'oiTgS0bfjI5H5JCgzw6x0hujqoXY','2017-12-07 01:22:48'),(25,'wx7d7a3a3c74c58b2e','1304857001','WEB','4nihcOOcMys8EH7fNP4LHGn9J84n8Ogq','7DC7BA8395D221A876B430F08D45FFC3','MD5','水电费',NULL,'13_1','nBqRiNqj2eOpJr6VS0JAM4QNOOrfRnDU','CNY',1,'116.24.136.54','20171207013816','20171209013816','水电费-1','https://api.yingtong-pm.cn:32312/v1/wxNotify','JSAPI',NULL,'oiTgS0bfjI5H5JCgzw6x0hujqoXY','2017-12-07 01:38:16'),(26,'wx7d7a3a3c74c58b2e','1304857001','WEB','cb5udj0Oe5bdcNGelczBif36xbdfm9i6','23C42C6BA9E0A138EFE84F2A0F139033','MD5','水电费',NULL,'13_1','43gTDpp12Bt84q189mtECm17A1qipmaa','CNY',1,'116.24.136.54','20171207013904','20171209013904','水电费-1','https://api.yingtong-pm.cn:32312/v1/wxNotify','JSAPI',NULL,'oiTgS0bfjI5H5JCgzw6x0hujqoXY','2017-12-07 01:39:04'),(27,'wx7d7a3a3c74c58b2e','1304857001','WEB','tk7E7kHBbCL31ejJzJ1njDcuqg8BNwMD','50F92A6678972840BD75E439D40F255D','MD5','水电费',NULL,'13_1','a9eqb3OSF8toELpTC3UqOnN0nomtcjsD','CNY',1,'116.24.136.54','20171207013945','20171209013945','水电费-1','https://api.yingtong-pm.cn:32312/v1/wxNotify','JSAPI',NULL,'oiTgS0bfjI5H5JCgzw6x0hujqoXY','2017-12-07 01:39:45'),(28,'wx7d7a3a3c74c58b2e','1304857001','WEB','ex3G9mlPFqx1q1lr5xEGBAeim8fDhs9O','D98E76A4BE89358D75E6A31A20C7E945','MD5','水电费',NULL,'13_1','DCO61Ch0htT0oMRubt1PSD8P8DnBLfnm','CNY',1,'116.24.136.54','20171207014143','20171209014143','水电费-1','https://api.yingtong-pm.cn:32312/v1/wxNotify','JSAPI',NULL,'oiTgS0bfjI5H5JCgzw6x0hujqoXY','2017-12-07 01:41:43'),(29,'wx7d7a3a3c74c58b2e','1304857001','WEB','3Pme8eMEFFuFbz9afrFNsnC6B8LponA5','92D5266C5D0627E7FBB5E2C8EA2B088A','MD5','水电费',NULL,'13_1','Jl137R3hIaPIhVjcIoQIuBELFE6A0qI8','CNY',1,'116.24.136.54','20171207014354','20171209014354','水电费-1','https://api.yingtong-pm.cn:32312/v1/wxNotify','JSAPI',NULL,'oiTgS0bfjI5H5JCgzw6x0hujqoXY','2017-12-07 01:43:54'),(30,'wx7d7a3a3c74c58b2e','1304857001','WEB','otiK0mGOEjDDthd0wOo0KkGy3mulncEG','9C6FDF535DA6E21E9F9CBD83079FFF1E','MD5','房租',NULL,'14_1','0uMu5jbbI6Td7qakVAoNnoa4AcHriuSM','CNY',1,'116.24.136.54','20171207015331','20171209015331','房租-1','https://api.yingtong-pm.cn:32312/v1/wxNotify','JSAPI',NULL,'oiTgS0bfjI5H5JCgzw6x0hujqoXY','2017-12-07 01:53:31'),(31,'wx7d7a3a3c74c58b2e','1304857001','WEB','a3nlL97xezIMksNmixg2DLnDsv7mNIqp','26BB40A26A79C8B016829D9E91E94C1B','MD5','房租',NULL,'14_1','Nmb98FCpHD2PVlg7UF9OQ35UgHMMFNUf','CNY',1,'116.24.136.54','20171207015333','20171209015333','房租-1','https://api.yingtong-pm.cn:32312/v1/wxNotify','JSAPI',NULL,'oiTgS0bfjI5H5JCgzw6x0hujqoXY','2017-12-07 01:53:33'),(32,'wx7d7a3a3c74c58b2e','1304857001','WEB','wrvcfaJ1pgFw81kvtmnqu8s15NnrFw57','6949AEEC76DB38720921D31CD0E55053','MD5','水电费',NULL,'13_1','G22pthm4AFO5rS1di2PE00ARlI7phj8M','CNY',1,'113.110.141.38','20171207021701','20171209021701','水电费-1','https://api.yingtong-pm.cn:32312/v1/wxNotify','JSAPI',NULL,'oiTgS0bA2eUv8rEZtLXoS9weyWZ8','2017-12-07 02:17:01'),(33,'wx7d7a3a3c74c58b2e','1304857001','WEB','5Ili6LtJum4b4aKn0HCxApxzMFscDi58','45B29B1CD49C526B9E367A5ABD5D7D61','MD5','网费',NULL,'15_1','lnH2TUiNqaJDlR2s0jgc966qTLssTaRi','CNY',1,'113.110.141.120','20171216165141','20171218165141','网费-1','https://api.yingtong-pm.cn:32312/v1/wxNotify','JSAPI',NULL,'oiTgS0bA2eUv8rEZtLXoS9weyWZ8','2017-12-16 16:51:41'),(34,'wx7d7a3a3c74c58b2e','1304857001','WEB','AcxI7ykAILMJBgd1FnxHC7nM433Aa3o6','355EB1240FB62ACB3D4EEC1EC3800CDF','MD5','物业管理费',NULL,'16_1','P08h9HMCnk4Vab22HTNlDuU40uqSdooa','CNY',1,'113.110.141.120','20171216172039','20171218172039','物业管理费-1','https://api.yingtong-pm.cn:32312/v1/wxNotify','JSAPI',NULL,'oiTgS0bA2eUv8rEZtLXoS9weyWZ8','2017-12-16 17:20:39'),(35,'wx7d7a3a3c74c58b2e','1304857001','WEB','igkCt3OFE72lfz9wg3zFgntt88yLlu8p','886AD4E2D7B3C0B905AC42A22D8E06F5','MD5','物业管理费',NULL,'16_1','U7acIQjT4E9R6rqM85BobmsN401QGIEN','CNY',1,'113.110.141.120','20171216172041','20171218172041','物业管理费-1','https://api.yingtong-pm.cn:32312/v1/wxNotify','JSAPI',NULL,'oiTgS0bA2eUv8rEZtLXoS9weyWZ8','2017-12-16 17:20:41'),(36,'wx7d7a3a3c74c58b2e','1304857001','WEB','k7DvItcrK9MM00Bo03DNhj8uHp8KgGh3','AB6C335E8BF9998943810152D8C73903','MD5','网费',NULL,'19_1','34VqTd7UCNuG295mafVPjRclpAFkgpoV','CNY',1,'117.136.40.176','20180103194823','20180105194823','网费-1','https://api.yingtong-pm.cn:32312/v1/wxNotify','JSAPI',NULL,'oiTgS0XyDjpvpTWcGJ0CBuBMdsZ4','2018-01-03 19:48:23'),(37,'wx7d7a3a3c74c58b2e','1304857001','WEB','voPskCEcwCLCpkpOsshMtI2NIx1n4GGe','AAA4B8F8E4BEA59340C5004106BF39C2','MD5','网费',NULL,'19_1','HBdBua6PL61brFT0bPNan6UtbgNgCPIB','CNY',1,'117.136.39.100','20180104163318','20180106163318','网费-1','https://api.yingtong-pm.cn:32312/v1/wxNotify','JSAPI',NULL,'oiTgS0XyDjpvpTWcGJ0CBuBMdsZ4','2018-01-04 16:33:18'),(38,'wx7d7a3a3c74c58b2e','1304857001','WEB','BA1BxtOIk24vlsxD5tbt8cu8koh2BBFA','6513DE9246A1DC18AB359EEEC8B10F2F','MD5','水电费',NULL,'17_1','f4ncIoQsm6BtiEtCStl48UaagJeDhS8N','CNY',1,'117.136.39.100','20180104164503','20180106164503','水电费-1','https://api.yingtong-pm.cn:32312/v1/wxNotify','JSAPI',NULL,'oiTgS0XyDjpvpTWcGJ0CBuBMdsZ4','2018-01-04 16:45:03'),(39,'wx7d7a3a3c74c58b2e','1304857001','WEB','niH6pzr7coO245mAv5Av837dwNk9hEp0','AB5A37478F06B945AF741B680C4081AF','MD5','水电费',NULL,'21_1','opdH88LgfHfNFmeulukbNc1f0Jp7deTI','CNY',1,'117.136.40.176','20180227151007','20180301151007','水电费-1','https://api.yingtong-pm.cn/v1/wxNotify','JSAPI',NULL,'oiTgS0XyDjpvpTWcGJ0CBuBMdsZ4','2018-02-27 15:10:07'),(40,'wx7d7a3a3c74c58b2e','1304857001','WEB','7acsglH5N27oCvexsfg0p4MNnvsNE8r6','715744657FBF63577777347B5BD9391B','MD5','水电费',NULL,'21_1','rdC6H2HJpsB6QiRfmogLT8CFEGpOBi27','CNY',1,'223.73.3.193','20180227151359','20180301151359','水电费-1','https://api.yingtong-pm.cn/v1/wxNotify','JSAPI',NULL,'oiTgS0cJK-bt4-q5Wa53EQhB3wAM','2018-02-27 15:13:59'),(41,'wx7d7a3a3c74c58b2e','1304857001','WEB','rcfMoJ9vfuAFijgl10d1HEmve0mqoOod','323F8C907D7D594CDDE69E1DB3201243','MD5','水电费',NULL,'21_1','2FElrGfkuS280q7UQktQNNmS5puHSLnL','CNY',1,'223.73.3.193','20180227151359','20180301151359','水电费-1','https://api.yingtong-pm.cn/v1/wxNotify','JSAPI',NULL,'oiTgS0cJK-bt4-q5Wa53EQhB3wAM','2018-02-27 15:13:59'),(42,'wx7d7a3a3c74c58b2e','1304857001','WEB','qEyPwHGmfsLGKP4cEFEPGs2kKwn2mz9z','549723819151B1C91BD3FD4F980D7758','MD5','水电费',NULL,'21_1','L6oldI8L5e9VQme0fQQh3a9oJpidiJeH','CNY',1,'223.73.3.193','20180227151412','20180301151412','水电费-1','https://api.yingtong-pm.cn/v1/wxNotify','JSAPI',NULL,'oiTgS0cJK-bt4-q5Wa53EQhB3wAM','2018-02-27 15:14:12'),(43,'wx7d7a3a3c74c58b2e','1304857001','WEB','k1PKirk3c3zLyMCBdJoIlH9D0FnlkExu','10C1AAE12B674682D0A1F2564EFD6124','MD5','房租',NULL,'22_1','tD7iugHfPUg3hoqSCJ0ICUlTt1huFADH','CNY',1,'117.136.79.173','20180304050001','20180306050001','房租-1','https://api.yingtong-pm.cn/v1/wxNotify','JSAPI',NULL,'oiTgS0XyDjpvpTWcGJ0CBuBMdsZ4','2018-03-04 05:00:01'),(44,'wx7d7a3a3c74c58b2e','1304857001','WEB','gnJdF6mH0pPKNHJ7sgd1hd4nFLAlMl23','5FB4A8DE2D77E92FF5338B785074242C','MD5','水电费',NULL,'29_1','Ot28jIGMFcePIAauq7PLSApQj6B40cia','CNY',1,'219.133.158.22','20180314175053','20180316175053','水电费-1','https://api.yingtong-pm.cn/v1/wxNotify','JSAPI',NULL,'oiTgS0aqMCdsHleEjUZJGpCPgUpA','2018-03-14 17:50:53');

/*Table structure for table `t_property` */

DROP TABLE IF EXISTS `t_property`;

CREATE TABLE `t_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(100) DEFAULT NULL COMMENT '物业公司名称',
  `contacts` varchar(20) DEFAULT NULL COMMENT '联系人',
  `telphone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `addr` varchar(100) DEFAULT NULL COMMENT '通信地址',
  `appid` varchar(32) DEFAULT NULL COMMENT '微信小程序ID',
  `app_secret` varchar(128) DEFAULT NULL COMMENT '微信小程序app secret',
  `app_key` varchar(48) DEFAULT NULL COMMENT '微信小程序 app key',
  `mch_id` varchar(32) DEFAULT NULL COMMENT '微信商户号',
  `logo_url` varchar(100) DEFAULT NULL COMMENT 'logo图片地址',
  `bg_url` varchar(100) DEFAULT NULL COMMENT '背景图地址',
  `icon_url` varchar(100) DEFAULT NULL COMMENT '小图标地址',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `t_property` */

insert  into `t_property` values (1,'深圳市中南永德信息技术有限公司','瀚城物业管理处','0755-23939099','深圳市福田区侨香路瀚城5-4A','wxf56fd8fb6499bccb','2c2eb10d378cf76c5ac21ee3d366d29c','7XvQBEc0Q7hj8SkxgQ0QIWwySGXjJrCd','1304857001','/images/commont/logo.png','/images/commont/head_img_003.png','/images/commont/icon_img002.png','2018-03-26 14:23:34'),(2,'新公司','福田管理处','0755-12345678','福田区','wx7d7a3a3c74c58b2e','a4d4aab175738c7b06c1142751034e32','7XvQBEc0Q7hj8SkxgQ0QIWwySGXjJrCd','1304857001','/images/commont/img-logo.png','/images/commont/img_003.png','/images/commont/img002.png','2018-03-26 14:23:34');

/*Table structure for table `t_property_management_department` */

DROP TABLE IF EXISTS `t_property_management_department`;

CREATE TABLE `t_property_management_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL COMMENT '物业ID',
  `management_department_name` varchar(100) DEFAULT NULL COMMENT '物业管理的小区名称',
  `contact_number` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `province` varchar(100) DEFAULT NULL COMMENT '省份（例如广东省）',
  `city` varchar(100) DEFAULT NULL COMMENT '城市（例如：深圳市）',
  `area` varchar(100) DEFAULT NULL COMMENT '区域（例如：南山区）',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `t_property_management_department` */

insert  into `t_property_management_department` values (1,1,'瀚城小区1','15972935811','广东省','深圳市','福田区','2018-04-03 17:15:13'),(2,1,'瀚城小区002','15971111111','广东省','深圳市','福田区','2018-04-04 11:34:05'),(3,2,'瀚城小区001','15971111110','广东省','深圳市','福田区','2018-03-29 10:58:35'),(4,1,'小钟楼','15246811111','湖北省','武汉市','江夏区','2018-04-04 11:36:11'),(5,1,'黄鹤楼','13071252022','广东省','深圳市','福田区','2018-04-04 11:36:06'),(14,1,'兰亭序集','16465465489','湖北省','武汉市','江夏区','2018-04-04 12:00:39');

/*Table structure for table `t_sys_notice` */

DROP TABLE IF EXISTS `t_sys_notice`;

CREATE TABLE `t_sys_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `subtitle` varchar(100) DEFAULT NULL COMMENT '副标题',
  `content` text COMMENT '内容',
  `publisher` varchar(40) DEFAULT NULL COMMENT '发布者',
  `p_m_id` int(11) DEFAULT NULL COMMENT '管理处ID',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='平台公告信息表';

/*Data for the table `t_sys_notice` */

insert  into `t_sys_notice` values (2,'公告','Notice','你们好!现本小区已进入装修阶段,进出苑区人员日益增多,管理处为加强小区人员进出管理,确保苑区的安全和谐,须对苑区住户办理业主卡,住户须凭业主卡进出苑区。请业主于近期内到管理处办理,谢谢合作!',NULL,2,'2018-03-29 14:22:49'),(4,'通告','通告','三年二班的李小明同学 你妈妈拿了一瓶旺仔牛奶在门口等你',NULL,2,'2018-04-03 09:57:01'),(5,'通告','副标题','公告，是指政府、团体对重大事件当众正式公布或者公开宣告，宣布。国务院2012年4月16日发布、2012年7月1日起施行的《党政机关公文处理工作条例》，对公告的使用表述为：“适用于向国内外宣布重要事项或者法定事项”。其中包含两方面的内容：一是向国内外宣布重要事项，公布依据政策、法令采取的重大行动等；二是向国内外宣布法定事项，公布依据法律规定告知国内外的有关重要规定和重大行动等。',NULL,1,'2018-04-03 09:56:57'),(6,'紧急通知','notice','今天晚上下雨',NULL,1,'2018-04-03 09:54:40'),(7,'公告','京东公开回应称','北京商报讯（记者 吴文治 赵述评）电商所售商品的品质一直受到多方的监管和把控。4月2日，网信北京微信公众号发布消息称，北京市网信办等五部门，因京东在网上售卖相关违法违规商品、出版物及其他印刷品的行为，依法约谈网站相关负责人，并责令整改。对此，京东公开回应称，京东将落实审查管理职责，切实履行网站主体责任，将全面严肃整改。',NULL,4,'2018-04-03 09:57:39'),(20,'公关3','notice3','南京南京\n','zp001',1,'2018-04-04 09:26:07'),(19,'公告2','notice','南京南进',NULL,1,'2018-04-04 09:22:01');

/*Table structure for table `t_unlockingkey` */

DROP TABLE IF EXISTS `t_unlockingkey`;

CREATE TABLE `t_unlockingkey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p_m_id` int(11) DEFAULT NULL COMMENT '管理处ID',
  `keyname` varchar(200) DEFAULT NULL COMMENT '门锁钥匙名称',
  `doorNum` varchar(200) DEFAULT NULL COMMENT '门口机账号、设备ID',
  `type` int(11) DEFAULT NULL COMMENT '门锁类型，1磁卡开门，2密码开门',
  `dlc_id` int(11) DEFAULT NULL COMMENT '门锁公司ID',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='门锁库表';

/*Data for the table `t_unlockingkey` */

insert  into `t_unlockingkey` values (1,1,'前门—龙岗共和小区公寓','25005972',1,1,'2018-03-15 14:52:54'),(2,1,'后门—龙岗共和小区公寓','25005972',1,1,'2018-03-15 14:52:55'),(3,2,'前门—龙岗共和小区公寓','25005972',1,1,'2018-03-15 14:52:56'),(4,2,'后门—龙岗共和小区公寓','25005972',1,1,'2018-03-15 14:52:57'),(5,3,'大冲新城市花园小区南门','25005972',2,2,'2018-04-03 16:05:57');

/*Table structure for table `t_use_water_electricity` */

DROP TABLE IF EXISTS `t_use_water_electricity`;

CREATE TABLE `t_use_water_electricity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` varchar(100) DEFAULT NULL COMMENT '设备ID',
  `type` int(11) DEFAULT NULL COMMENT '1水量，2电量',
  `use_count` double DEFAULT NULL COMMENT '用量',
  `readtime` varchar(11) NOT NULL COMMENT '查看日期（yyyy-MM-dd）',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_use_water_electricity` */

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) DEFAULT NULL COMMENT '登录帐号',
  `pass_word` varchar(255) DEFAULT NULL COMMENT '登录密码',
  `gm_type` int(11) DEFAULT NULL COMMENT '管理类型：1、超级管理员2、物业公司3、小区物业管理处',
  `pid` int(11) DEFAULT NULL COMMENT '物业id',
  `p_m_id` int(11) DEFAULT NULL COMMENT '小区物业管理处ID',
  `email` varchar(100) DEFAULT NULL COMMENT '绑定邮箱',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='管理员登录信息表';

/*Data for the table `t_user` */

insert  into `t_user` values (1,'admin','123456',1,0,0,'976789649@qq.com','2018-04-02 13:31:13'),(2,'zp','735c11ad1af639152af20f79e6ce1b3ca2a7a2a7459f73c673271f8d2f17c2ff',2,1,0,'976789649@qq.com','2018-04-02 13:31:27'),(3,'zp001','0eda525d8b9d37036802e4d76a2478f3c7f30fe8f318b216a340a37234d78bc0',3,1,1,'976789649@qq.com','2018-04-03 14:40:36'),(4,'zp002','215eca2221604385565ae23507d25ad3737da749c807af9d08d242de05129214',3,1,1,'1175609090@qq.com','2018-04-03 16:17:36');

/*Table structure for table `t_validatecode` */

DROP TABLE IF EXISTS `t_validatecode`;

CREATE TABLE `t_validatecode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL COMMENT '验证码',
  `user_name` varchar(20) DEFAULT NULL COMMENT '用户名',
  `createtime` varchar(20) DEFAULT NULL COMMENT '生成时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `t_validatecode` */

insert  into `t_validatecode` values (1,'123456','zp001',NULL),(2,'eZWrxe','zp001',NULL),(3,'IyOXpp','zp001','2018-04-02 19:18:43'),(4,'PvkxmX','zp001','2018-04-02 19:36:02'),(5,'bZi6xo','zp001','2018-04-03 09:20:19'),(6,'CgNHlq','zp002','2018-04-03 09:25:50'),(7,'M11Avq','zp002','2018-04-03 09:34:32'),(8,'Nf8cFX','zp002','2018-04-03 09:35:22'),(9,'86euu8','zp002','2018-04-03 09:54:53'),(10,'qhYHFu','zp002','2018-04-03 10:03:06'),(11,'BBTs6a','zp002','2018-04-03 10:10:32'),(12,'Nfji3C','zp002','2018-04-03 10:24:00'),(13,'tcsZ9U','zp002','2018-04-03 10:24:43'),(14,'MBUoYJ','zp002','2018-04-03 10:26:38'),(15,'NdVwDt','zp002','2018-04-03 10:38:01'),(16,'gbmXjT','zp002','2018-04-03 13:21:11'),(17,'cYlgD5','zp001','2018-04-03 14:39:56'),(18,'OYSg1f','zp002','2018-04-03 15:48:11'),(19,'nZi1gA','zp002','2018-04-03 15:54:00'),(20,'57JR6n','zp002','2018-04-03 15:55:30'),(21,'198jkk','zp002','2018-04-03 16:15:27'),(22,'5GDa0y','zp002','2018-04-03 16:16:26');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
