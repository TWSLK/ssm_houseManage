/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.0.24-community-nt : Database - fangwuzulinsys
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`fangwuzulinsys` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `fangwuzulinsys`;

/*Table structure for table `bbs` */

DROP TABLE IF EXISTS `bbs`;

CREATE TABLE `bbs` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `pubtime` varchar(30) default NULL,
  `uid` int(11) default NULL,
  `bid` int(11) default NULL,
  `sta` varchar(10) default NULL,
  `note` text,
  `note2` text,
  `htime` varchar(30) default NULL,
  `btype` varchar(10) default NULL,
  `hid` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bbs` */

insert  into `bbs`(`id`,`name`,`pubtime`,`uid`,`bid`,`sta`,`note`,`note2`,`htime`,`btype`,`hid`) values (1,'测试标题','2020-02-23 17:36:08',4,NULL,'待回复','这里是留言的内容',NULL,NULL,'留言',NULL),(2,'我的留言11','2020-02-23 17:36:08',5,NULL,'待回复','这里是内容看看看看！<img src=\"http://localhost:8080/fangwuzulinsys/kindeditor/plugins/emoticons/images/13.gif\" border=\"0\" alt=\"\" />',NULL,NULL,'留言',NULL),(3,'留言标题','2020-02-23 17:36:08',6,NULL,'待回复','这里是内容',NULL,NULL,'留言',NULL),(4,'留言11','2020-02-26 17:30:12',7,NULL,'待回复','333',NULL,NULL,'留言',NULL),(5,NULL,NULL,NULL,4,'回复',NULL,'444<img src=\"http://localhost:8080/fangwuzulinsys/kindeditor/plugins/emoticons/images/0.gif\" border=\"0\" alt=\"\" />','2020-02-26 17:30:23','回复',7);

/*Table structure for table `ftype` */

DROP TABLE IF EXISTS `ftype`;

CREATE TABLE `ftype` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `btype` varchar(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ftype` */

insert  into `ftype`(`id`,`name`,`btype`) values (1,'三室一厅一厨一卫',NULL),(2,'二室一厅一卫',NULL),(3,'分类03',NULL),(4,'三室一厅',NULL),(5,'一室一厅一卫',NULL),(6,'四室一厅一厨一卫',NULL);

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `id` int(11) NOT NULL auto_increment,
  `fid` int(11) default NULL,
  `img` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `price` double default NULL,
  `note` text,
  `status` varchar(50) default NULL,
  `pubtime` varchar(100) default NULL,
  `iscommend` varchar(20) default NULL,
  `uid` varchar(20) default NULL,
  `btype` varchar(20) default NULL,
  `area` varchar(255) default NULL,
  `addr` varchar(255) default NULL,
  `tel` varchar(30) default NULL,
  `tname` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_flower` (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `goods` */

insert  into `goods`(`id`,`fid`,`img`,`name`,`price`,`note`,`status`,`pubtime`,`iscommend`,`uid`,`btype`,`area`,`addr`,`tel`,`tname`) values (1,1,'1.jpg','房屋1',5000,'<img src=\"/fangwuzulinsys/attached/image/20190413/20190413184631_539.jpg\" width=\"600\" height=\"263\" alt=\"\" />','通过审核','2020-02-23 17:36:08',NULL,'1','出租','102m²','位置1','15396232144','联系人1'),(2,2,'3.jpg','出租房屋1',3600,'<img src=\"/fangwuzulinsys/attached/image/20190413/20190413184849_71.jpg\" alt=\"\" />','通过审核','2020-02-23 17:36:08',NULL,'1','出租','100m²','位置2','13652348756','联系人2'),(3,1,'5.jpg','求租房屋1',2600,'说明','通过审核','2020-02-23 17:36:08',NULL,'1','求租','100m²','位置1','14584845299','联系人1'),(4,1,'20171014083738817.jpg','求租房屋2',4200,'内容说明','通过审核','2020-02-23 17:36:08',NULL,'1','求租','98m²','位置1','15396232188','联系人01'),(5,1,'6.jpg','出租房屋3',4400,'<p>\r\n	房屋图片说明：\r\n</p>\r\n<p>\r\n	<img src=\"/fangwuzulinsys/attached/image/20190413/20190413190947_372.jpg\" alt=\"\" /> \r\n</p>','通过审核','2020-02-23 17:36:08',NULL,'1','出租','99m²','位置1','13652348756','刘三'),(6,4,'lv16.jpg','求租房屋3',3600,'<p>\r\n	内容说明\r\n</p>\r\n<p>\r\n	<br />\r\n</p>','通过审核','2020-02-23 17:36:08',NULL,'1','求租','88m²','位置1','13652348756','张三'),(7,4,'5.jpg','c出租01',3200,'房屋说明！！<img src=\"/fangwuzulinsys/attached/image/20190421/20190421111248_901.jpg\" alt=\"\" />','通过审核','2020-02-23 17:36:08','非推荐','6','出租','88m²','位置1','15396232144','测试用户02'),(8,4,'lv02.jpg','q求租房屋1',5200,'求租说明如下：','通过审核','2020-02-23 17:36:08','非推荐','6','求租','102m²','位置1','15396232199','测试用户02'),(9,1,'lv02.jpg','房屋11',3600,'房屋合同<a class=\"ke-insertfile\" href=\"/fangwuzulinsys/attached/file/20200223/20200223173511_104.docx\" target=\"_blank\">/fangwuzulinsys/attached/file/20200223/20200223173511_104.docx</a>','通过审核','2020-02-23 17:36:08',NULL,'1','出租','88','位置1','14584845215','测试用户'),(10,1,'4.jpg','出租88',3600,'房屋说明如下！','通过审核','2020-02-26 17:31:45','非推荐','7','出租','1000','位置1','15584845215','测试用户'),(12,1,'20171014083653557.jpg','出售99',1620000,'说明如下','通过审核','2020-02-26 17:34:30','非推荐','7','出售','96','位置1','15584845215','测试用户'),(13,1,'20171014083717838.jpg','求租8899',3500,'呃呃呃','通过审核','2020-02-26 17:35:24','非推荐','7','求租','1000','位置2','15584845215','测试用户');

/*Table structure for table `keep` */

DROP TABLE IF EXISTS `keep`;

CREATE TABLE `keep` (
  `id` int(11) NOT NULL auto_increment,
  `uid` int(11) default NULL,
  `fid` int(11) default NULL,
  `status` varchar(30) default NULL,
  `isdel` varchar(50) default NULL,
  `pubtime` varchar(50) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_keep` (`fid`),
  CONSTRAINT `FK_keep` FOREIGN KEY (`fid`) REFERENCES `goods` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `keep` */

insert  into `keep`(`id`,`uid`,`fid`,`status`,`isdel`,`pubtime`) values (1,6,NULL,'收藏','1','2020-02-23 17:36:08'),(2,5,3,'收藏','1','2020-02-23 17:36:08'),(3,7,1,'收藏','1','2020-02-26 17:45:01');

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `ggid` int(11) NOT NULL auto_increment,
  `ggpic` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `note` text,
  `isdel` varchar(20) default NULL,
  `gtype` varchar(50) default NULL,
  `pubtime` varchar(30) default NULL,
  PRIMARY KEY  (`ggid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `news` */

insert  into `news`(`ggid`,`ggpic`,`name`,`note`,`isdel`,`gtype`,`pubtime`) values (1,'20171014082538766.jpg','新闻22','<img src=\"/fangwuzulinsys/attached/image/20190316/20190316151430_717.jpg\" alt=\"\" />说明','1','新闻动态','2020-02-23 17:36:08'),(2,'20171014083549392.jpg','新闻2','<img src=\"/fangwuzulinsys/attached/image/20190316/20190316151455_347.jpg\" alt=\"\" />','1','新闻动态','2020-02-23 17:36:08'),(3,'20171014083549392.jpg','新闻3','内容','1','新闻动态','2020-02-23 17:36:08'),(4,'20171014083717838.jpg','房屋新闻11','<img src=\"/fangwuzulinsys/attached/image/20190413/20190413183906_985.jpg\" width=\"600\" height=\"349\" alt=\"\" />','1','新闻动态','2020-02-23 17:36:08'),(5,'12.jpg','房屋动态777','<p>\r\n	这个是内容\r\n</p>\r\n<p>\r\n	<img src=\"/fangwuzulinsys/attached/image/20190413/20190413190748_543.jpg\" width=\"600\" height=\"241\" alt=\"\" />\r\n</p>','1','新闻动态','2020-02-23 17:36:08'),(6,'20171014083717838.jpg','房屋动态88','说明','1','新闻动态','2020-02-23 17:36:08'),(7,'2.jpg','租赁合同11','<a class=\"ke-insertfile\" href=\"/fangwuzulinsys/attached/file/20200226/20200226173936_887.docx\" target=\"_blank\">租赁合同</a>','1','新闻动态','2020-02-26 17:40:01'),(8,'5.jpg','租赁合同88','<a class=\"ke-insertfile\" href=\"/fangwuzulinsys/attached/file/20200226/20200226174032_482.docx\" target=\"_blank\">租赁合同88</a>','1','新闻动态','2020-02-26 17:40:57');

/*Table structure for table `sysuser` */

DROP TABLE IF EXISTS `sysuser`;

CREATE TABLE `sysuser` (
  `uid` int(11) NOT NULL auto_increment,
  `uname` varchar(20) default NULL,
  `sex` varchar(10) default NULL,
  `address` varchar(100) default NULL,
  `pwd` varchar(20) default NULL,
  `utype` varchar(30) default NULL,
  `tel` varchar(20) default NULL,
  `age` varchar(10) default NULL,
  `mbanswer` varchar(30) default NULL,
  `question` varchar(30) default NULL,
  `email` varchar(30) default NULL,
  `pubtime` varchar(30) default NULL,
  `tname` varchar(50) default NULL,
  `phone` varchar(30) default NULL,
  `qq` varchar(255) default NULL,
  `weixin` varchar(255) default NULL,
  `isdel` varchar(10) default NULL,
  `ctype` varchar(20) default NULL,
  `img` varchar(255) default NULL,
  PRIMARY KEY  (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sysuser` */

insert  into `sysuser`(`uid`,`uname`,`sex`,`address`,`pwd`,`utype`,`tel`,`age`,`mbanswer`,`question`,`email`,`pubtime`,`tname`,`phone`,`qq`,`weixin`,`isdel`,`ctype`,`img`) values (1,'admin','男','武汉343号','123','管理员','14584845215',NULL,'我是谁？','admin','21521515@qq.com',NULL,NULL,NULL,NULL,'weixin1',NULL,NULL,NULL),(2,'hy01','男','武汉343号','123456','会员','14584845215',NULL,'我是谁？','hy01','21521515@qq.com','2020-02-23 17:36:08','会员01',NULL,NULL,'weixin1','1',NULL,'book4.jpg'),(5,'test01','女','地址1','123456','会员','15396232145',NULL,'我是谁？','test01','61515115@qq.com','2020-02-23 17:36:08','测试用户01',NULL,NULL,'weixin3','1',NULL,'20170915112433524.jpg'),(6,'test02','女','地址1','123456','会员','15396232145',NULL,'我是谁？','test02','61515115@qq.com','2020-02-23 17:36:08','测试用户02',NULL,NULL,'weixin3','1',NULL,'20170915113845579.jpg'),(7,'test','男','地区1','123456','会员','15584845215',NULL,'我是谁？','test','21521515@qq.com','2020-02-26 17:29:38','测试用户',NULL,NULL,'weixin1','1',NULL,'20170915112724145.jpg'),(8,'yh88','男','地区1','123456','会员','14584845288',NULL,'我是谁？','yh88',NULL,'2020-02-26 17:44:16.234','用户88',NULL,NULL,NULL,'1',NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
