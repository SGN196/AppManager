-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: appinfodb
-- ------------------------------------------------------
-- Server version	5.7.21-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `app_info`
--

DROP TABLE IF EXISTS `app_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_info` (
  `id` bigint(30) NOT NULL AUTO_INCREMENT,
  `software_name` varchar(45) DEFAULT NULL,
  `apk_name` varchar(45) DEFAULT NULL,
  `support_rom` varchar(45) DEFAULT NULL,
  `interface_language` varchar(45) DEFAULT NULL,
  `software_size` decimal(20,2) DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `dev_id` bigint(30) DEFAULT NULL,
  `app_info` varchar(5000) DEFAULT NULL,
  `status` bigint(30) DEFAULT NULL,
  `on_sale_date` datetime DEFAULT NULL,
  `off_sale_date` datetime DEFAULT NULL,
  `flatform_id` bigint(30) DEFAULT NULL,
  `category_level3` bigint(30) DEFAULT NULL,
  `downloads` bigint(30) DEFAULT NULL,
  `created_by` bigint(30) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `modify_by` bigint(30) DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `category_level1` bigint(30) DEFAULT NULL,
  `category_level2` bigint(30) DEFAULT NULL,
  `logo_pic_path` varchar(500) DEFAULT NULL,
  `logo_loc_path` varchar(500) DEFAULT NULL,
  `version_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_info`
--

LOCK TABLES `app_info` WRITE;
/*!40000 ALTER TABLE `app_info` DISABLE KEYS */;
INSERT INTO `app_info` VALUES (48,'谷歌拼音输入法','com.google.android.inputmethod.pinyin','4.2及更高版本','简体中文',2.00,NULL,2,'谷歌拼音输入法是一款专门用于输入中文的输入法',2,NULL,NULL,2,29,23,1,'2018-09-22 11:11:11',NULL,NULL,1,3,NULL,NULL,NULL),(50,'bbbbb','com.google.android.inputmethod.pinyin','4.2及更高版本','简体中文',3.44,NULL,2,'谷歌拼音输入法是一款专门用于输入中文的输入法',2,NULL,NULL,2,29,23,1,'2018-09-22 11:11:11',NULL,NULL,1,3,NULL,NULL,NULL),(51,'ccc','com.google.android.inputmethod.pinyin','4.2及更高版本','简体中文',3.43,NULL,2,'谷歌拼音输入法是一款专门用于输入中文的输入法',2,NULL,NULL,2,29,213,1,'2018-09-22 11:11:11',NULL,NULL,1,3,NULL,NULL,NULL),(52,'dddd','com.google.android.inputmethod.pinyin','4.2及更高版本','简体中文',3.44,NULL,2,'谷歌拼音输入法是一款专门用于输入中文的输入法',2,NULL,NULL,2,29,2131,1,'2018-09-22 11:11:11',NULL,NULL,1,3,NULL,NULL,NULL),(53,'eeee','com.google.android.inputmethod.pinyin','4.2及更高版本','简体中文',3.44,NULL,2,'谷歌拼音输入法是一款专门用于输入中文的输入法',3,NULL,NULL,2,29,567,1,'2018-09-22 11:11:11',NULL,NULL,1,3,NULL,NULL,NULL),(54,'fffffff','com.google.android.inputmethod.pinyin','4.2及更高版本','简体中文',3.44,NULL,2,'谷歌拼音输入法是一款专门用于输入中文的输入法',3,NULL,NULL,3,29,567,1,'2018-09-22 11:11:11',NULL,NULL,1,3,NULL,NULL,NULL),(55,'ggggghgggg','com.google.android.inputmethod.pinyin','4.2及更高版本','简体中文',3.44,NULL,2,'谷歌拼音输入法是一款专门用于输入中文的输入法',2,NULL,NULL,3,29,65,1,'2018-09-22 11:11:11',NULL,NULL,1,3,NULL,NULL,NULL),(56,'hhhh','com.google.android.inputmethod.pinyin','4.2及更高版本','简体中文',3.44,NULL,2,'谷歌拼音输入法是一款专门用于输入中文的输入法',1,NULL,NULL,3,29,756,1,'2018-09-22 11:11:11',NULL,NULL,1,3,NULL,NULL,NULL),(57,'iiiiii','com.google.android.inputmethod.pinyin','4.2及更高版本','简体中文',3.44,NULL,2,'谷歌拼音输入法是一款专门用于输入中文的输入法',2,NULL,NULL,3,29,345,1,'2018-09-22 11:11:11',NULL,NULL,1,3,NULL,NULL,NULL),(58,'jjjjjjj','com.google.android.inputmethod.pinyin','4.2及更高版本','简体中文',3.44,NULL,2,'谷歌拼音输入法是一款专门用于输入中文的输入法',2,NULL,NULL,2,29,4333,1,'2018-09-22 11:11:11',NULL,NULL,1,3,NULL,NULL,NULL),(59,'kkkkkk','com.google.android.inputmethod.pinyin','4.2及更高版本','简体中文',3.44,NULL,2,'谷歌拼音输入法是一款专门用于输入中文的输入法',2,NULL,NULL,2,29,4444,1,'2018-09-22 11:11:11',NULL,NULL,1,3,NULL,NULL,NULL),(60,'lllllll','com.google.android.inputmethod.pinyin','4.2及更高版本','简体中文',3.44,NULL,2,'谷歌拼音输入法是一款专门用于输入中文的输入法',2,NULL,NULL,2,29,3332,1,'2018-09-22 11:11:11',NULL,NULL,1,3,NULL,NULL,NULL),(61,'mmmmmmmmmm','com.google.android.inputmethod.pinyin','4.2及更高版本','简体中文',3.44,NULL,2,'谷歌拼音输入法是一款专门用于输入中文的输入法',2,NULL,NULL,1,29,333,1,'2018-09-22 11:11:11',NULL,NULL,1,3,NULL,NULL,NULL),(62,'吹牛','aaa','aaa','english',222.00,NULL,2,'3333333333',1,NULL,NULL,1,45,NULL,2,NULL,NULL,NULL,2,21,NULL,NULL,NULL),(63,'吹牛','aaa','aaa','english',222.00,NULL,2,'3333333333',1,NULL,NULL,1,45,NULL,2,NULL,NULL,NULL,2,21,NULL,NULL,NULL),(64,'界面好丑','com.caiqian.duang','4.4','chinese',222.00,NULL,2,'跑完睡觉',1,NULL,NULL,1,NULL,NULL,2,NULL,NULL,NULL,2,25,NULL,NULL,NULL),(65,'跑完睡觉2','2222','4.3','abc',222.00,NULL,2,'我看看今天几点睡',1,NULL,NULL,1,NULL,NULL,2,NULL,NULL,NULL,1,5,NULL,NULL,NULL),(66,'666','666','666','666',666.00,NULL,2,'333',1,NULL,NULL,3,45,NULL,2,'2018-12-09 02:28:33',NULL,NULL,2,21,NULL,NULL,NULL),(67,'哈哈哈','滚滚滚','222','222',222.00,NULL,2,'2132132',1,NULL,NULL,2,43,NULL,2,'2018-12-09 02:32:49',NULL,NULL,2,20,NULL,NULL,NULL),(68,'分为非','333','11','11',1.00,NULL,2,'飞飞飞',1,NULL,NULL,2,45,NULL,2,'2018-12-09 02:33:39',NULL,NULL,2,21,NULL,NULL,NULL);
/*!40000 ALTER TABLE `app_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-09 18:21:05
