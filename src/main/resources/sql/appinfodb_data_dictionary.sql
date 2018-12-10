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
-- Table structure for table `data_dictionary`
--

DROP TABLE IF EXISTS `data_dictionary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_dictionary` (
  `id` bigint(30) NOT NULL,
  `type_code` varchar(50) DEFAULT NULL,
  `type_name` varchar(50) DEFAULT NULL,
  `value_id` bigint(30) DEFAULT NULL,
  `value_name` varchar(50) DEFAULT NULL,
  `created_by` bigint(30) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `modify_by` bigint(30) DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_dictionary`
--

LOCK TABLES `data_dictionary` WRITE;
/*!40000 ALTER TABLE `data_dictionary` DISABLE KEYS */;
INSERT INTO `data_dictionary` VALUES (1,'USER_TYPE','用户类型',1,'超级管理员',1,'2018-08-30 10:10:10',NULL,NULL),(2,'USER_TYPE','用户类型',2,'财务',1,'2018-08-30 10:10:10',NULL,NULL),(3,'USER_TYPE','用户类型',3,'市场',1,'2018-08-30 10:10:10',NULL,NULL),(4,'USER_TYPE','用户类型',4,'运营',1,'2018-08-30 10:10:10',NULL,NULL),(5,'USER_TYPE','用户类型',5,'销售',1,'2018-08-30 10:10:10',NULL,NULL),(6,'APP_STATUS','APP状态',1,'待审核',1,'2018-08-30 10:10:10',NULL,NULL),(7,'APP_STATUS','APP状态',2,'审核通过',1,'2018-08-30 10:10:10',NULL,NULL),(8,'APP_STATUS','APP状态',3,'审核未通过',1,'2018-08-30 10:10:10',NULL,NULL),(9,'APP_STATUS','APP状态',4,'已上架',1,'2018-08-30 10:10:10',NULL,NULL),(10,'APP_STATUS','APP状态',5,'已下架',1,'2018-08-30 10:10:10',NULL,NULL),(11,'APP_FLATFORM','所属平台',1,'手机',1,'2018-08-30 10:10:10',NULL,NULL),(12,'APP_FLATFORM','所属平台',2,'平板',1,'2018-08-30 10:10:10',NULL,NULL),(13,'APP_FLATFORM','所属平台',3,'通用',1,'2018-08-30 10:10:10',NULL,NULL),(14,'PUBLISH_STATUS','发布状态',1,'不发布',1,'2018-08-30 10:10:10',NULL,NULL),(15,'PUBLISH_STATUS','发布状态',2,'以发布',1,'2018-08-30 10:10:10',NULL,NULL),(16,'PUBLISH_STATUS','发布状态',3,'预发布',1,'2018-08-30 10:10:10',NULL,NULL);
/*!40000 ALTER TABLE `data_dictionary` ENABLE KEYS */;
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
