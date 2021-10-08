CREATE DATABASE  IF NOT EXISTS `inventory_management` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `inventory_management`;
-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: localhost    Database: inventory_management
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth`
--

DROP TABLE IF EXISTS `auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ROLE_ID` int NOT NULL,
  `MENU_ID` int NOT NULL,
  `PERMISSION` int NOT NULL DEFAULT '1',
  `ACTIVE_FLAG` int NOT NULL DEFAULT '1',
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `menuId_foreignKey_idx` (`MENU_ID`),
  KEY `roleId_foreignKey_idx` (`ROLE_ID`),
  CONSTRAINT `menuId_foreignKey` FOREIGN KEY (`MENU_ID`) REFERENCES `menu` (`ID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `roleId_foreignKey` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`ID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth`
--

LOCK TABLES `auth` WRITE;
/*!40000 ALTER TABLE `auth` DISABLE KEYS */;
INSERT INTO `auth` VALUES (1,1,1,1,1,'2021-10-03 11:39:38','2021-10-03 11:39:38'),(2,1,2,1,1,'2021-10-03 11:39:38','2021-10-03 11:39:38'),(3,1,3,1,1,'2021-10-03 11:39:38','2021-10-03 11:39:38'),(4,1,4,1,1,'2021-10-03 11:39:38','2021-10-03 11:39:38'),(5,1,5,1,1,'2021-10-03 11:39:38','2021-10-03 11:39:38'),(6,1,6,1,1,'2021-10-03 11:39:38','2021-10-03 11:39:38'),(7,1,7,1,1,'2021-10-03 11:39:38','2021-10-03 11:39:38'),(8,1,8,1,1,'2021-10-03 11:39:38','2021-10-03 11:39:38'),(9,1,9,1,1,'2021-10-03 11:39:38','2021-10-03 11:39:38'),(10,1,10,1,1,'2021-10-03 11:39:38','2021-10-03 11:39:38'),(11,1,11,1,1,'2021-10-03 11:39:38','2021-10-03 11:39:38'),(12,1,12,1,1,'2021-10-03 11:39:38','2021-10-03 11:39:38'),(13,1,13,1,1,'2021-10-03 11:39:38','2021-10-03 11:39:38'),(14,1,14,1,1,'2021-10-03 11:39:38','2021-10-03 11:39:38'),(15,1,15,1,1,'2021-10-03 11:39:38','2021-10-03 11:39:38'),(16,1,16,1,1,'2021-10-03 11:39:38','2021-10-03 11:39:38'),(17,1,17,1,1,'2021-10-03 11:39:38','2021-10-03 11:39:38'),(18,1,18,1,1,'2021-10-03 11:39:38','2021-10-03 11:39:38'),(19,1,19,1,1,'2021-10-03 11:39:38','2021-10-03 11:39:38'),(20,1,20,1,1,'2021-10-03 11:39:38','2021-10-03 11:39:38'),(21,1,21,1,1,'2021-10-03 11:39:38','2021-10-03 11:39:38'),(22,1,22,1,1,'2021-10-03 11:39:38','2021-10-03 11:39:38'),(23,1,23,1,1,'2021-10-03 11:39:38','2021-10-03 11:39:38'),(24,1,24,1,1,'2021-10-03 11:39:38','2021-10-03 11:39:38'),(25,1,25,1,1,'2021-10-03 11:39:38','2021-10-03 11:39:38'),(26,1,26,1,1,'2021-10-03 11:39:38','2021-10-03 11:39:38'),(27,1,27,1,1,'2021-10-03 17:14:48','2021-10-03 17:14:48'),(28,1,28,1,1,'2021-10-04 07:42:36','2021-10-04 07:42:36'),(29,1,29,1,1,'2021-10-04 07:42:36','2021-10-04 07:42:36'),(30,1,30,1,1,'2021-10-04 07:42:36','2021-10-04 07:42:36'),(31,1,31,1,1,'2021-10-04 07:42:36','2021-10-04 07:42:36'),(32,1,32,1,1,'2021-10-04 07:42:36','2021-10-04 07:42:36'),(33,1,33,1,1,'2021-10-04 10:59:30','2021-10-04 10:59:30'),(34,1,34,1,1,'2021-10-04 10:59:30','2021-10-04 10:59:30'),(35,1,35,1,1,'2021-10-04 10:59:30','2021-10-04 10:59:30'),(36,1,36,1,1,'2021-10-04 10:59:30','2021-10-04 10:59:30'),(37,1,37,1,1,'2021-10-04 15:31:00','2021-10-04 15:31:00'),(38,1,38,1,1,'2021-10-04 15:53:56','2021-10-04 15:53:56'),(39,1,39,1,1,'2021-10-04 15:53:56','2021-10-04 15:53:56'),(40,1,40,1,1,'2021-10-04 15:53:56','2021-10-04 15:53:56'),(41,1,41,1,1,'2021-10-04 15:53:56','2021-10-04 15:53:56'),(42,2,1,1,1,'2021-10-05 01:58:55','2021-10-05 01:58:55'),(43,1,42,1,1,'2021-10-05 02:07:50','2021-10-05 02:07:50'),(44,1,43,1,1,'2021-10-05 02:07:50','2021-10-05 02:07:50'),(45,1,44,1,1,'2021-10-05 02:46:10','2021-10-05 02:46:10'),(46,2,5,1,1,'2021-10-05 03:27:46','2021-10-05 03:27:46');
/*!40000 ALTER TABLE `auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) NOT NULL,
  `CODE` varchar(50) NOT NULL,
  `DESCRIPTION` text,
  `ACTIVE_FLAG` int NOT NULL DEFAULT '1',
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Apple category 2021','APPLE ','Apple la thuong hieu cua My',1,'2021-09-10 11:39:40','2021-09-11 08:27:41'),(7,'Apple category 2020','APPLE 01','Apple la thuong hieu cua My',1,'2021-09-10 14:12:10','2021-09-10 14:18:21'),(8,'Samsung','SS','Samsung la thuong hieu cua Han Quoc',1,'2021-09-10 15:13:09','2021-09-11 05:20:11'),(9,'Huawei','HW','Huawei is a china',1,'2021-09-11 05:08:49','2021-09-11 05:08:49'),(10,'LG','LG','LG la thuong hieu cua Han Quoc',1,'2021-09-11 08:28:48','2021-09-11 08:28:48'),(11,'Lenovo','Lenovo','Lenovo is a china',1,'2021-10-03 16:35:34','2021-10-03 16:35:34');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `history` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ACTION_NAME` varchar(100) NOT NULL,
  `TYPE` int NOT NULL,
  `PRODUCT_ID` int NOT NULL,
  `QTY` int NOT NULL,
  `PRICE` decimal(15,2) NOT NULL,
  `ACTIVE_FLAG` int NOT NULL DEFAULT '1',
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `productId_foreignKey_idx` (`PRODUCT_ID`),
  CONSTRAINT `productId_His_foreignKey` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product_info` (`ID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` VALUES (1,'Add',1,2,5,20000000.00,1,'2021-10-03 16:24:32','2021-10-03 16:24:32'),(2,'Add',1,1,9,15000000.00,1,'2021-10-03 16:34:52','2021-10-03 16:34:52'),(3,'Add',1,3,10,30000000.00,1,'2021-10-03 16:59:46','2021-10-03 16:59:46'),(4,'Edit',1,1,8,20000000.00,1,'2021-10-03 17:20:27','2021-10-03 17:20:27'),(5,'Add',1,1,2,20000000.00,1,'2021-10-03 17:21:29','2021-10-03 17:21:29'),(6,'Add',2,2,1,10000000.00,1,'2021-10-04 07:43:25','2021-10-04 07:43:25'),(7,'Add',2,3,1,10000000.00,1,'2021-10-04 07:44:00','2021-10-04 07:44:00'),(8,'Edit',2,1,2,10000000.00,1,'2021-10-04 07:44:42','2021-10-04 07:44:42');
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CODE` varchar(100) NOT NULL,
  `TYPE` int NOT NULL,
  `PRODUCT_ID` int NOT NULL,
  `QTY` int NOT NULL,
  `PRICE` decimal(15,2) NOT NULL,
  `ACTIVE_FLAG` int NOT NULL DEFAULT '1',
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `proId_Inv_foreignKey_idx` (`PRODUCT_ID`),
  CONSTRAINT `proId_Inv_foreignKey` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product_info` (`ID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` VALUES (1,'IV001',1,1,8,20000000.00,1,'2021-10-03 16:24:32','2021-10-03 17:20:27'),(2,'IV002',1,1,9,15000000.00,1,'2021-10-03 16:34:51','2021-10-03 16:34:51'),(3,'IV003',1,3,10,30000000.00,1,'2021-10-03 16:59:46','2021-10-03 16:59:46'),(4,'IV004',1,1,2,20000000.00,1,'2021-10-03 17:21:29','2021-10-03 17:21:29'),(5,'GI001',2,2,1,10000000.00,1,'2021-10-04 07:43:25','2021-10-04 07:43:25'),(6,'GI002',2,1,2,10000000.00,1,'2021-10-04 07:44:00','2021-10-04 07:44:42');
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `PARENT_ID` int NOT NULL,
  `URL` varchar(100) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `ORDER_INDEX` int NOT NULL DEFAULT '0',
  `ACTIVE_FLAG` int NOT NULL DEFAULT '1',
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,0,'/product','Sản phẩm',1,1,'2021-10-03 11:35:04','2021-10-03 11:35:04'),(2,0,'/stock','Kho',2,1,'2021-10-03 11:35:04','2021-10-03 11:35:04'),(3,0,'/management','Quản lý',3,1,'2021-10-03 11:35:04','2021-10-03 11:35:04'),(4,1,'/product-info/list','Danh sách sản phẩm',2,1,'2021-10-03 11:35:04','2021-10-03 11:35:04'),(5,1,'/category/list','Danh sách category',1,1,'2021-10-03 11:35:04','2021-10-03 11:35:04'),(6,1,'/category/edit','Sửa',-1,1,'2021-10-03 11:35:04','2021-10-03 11:35:04'),(7,1,'/category/view','Xem',-1,1,'2021-10-03 11:35:04','2021-10-03 11:35:04'),(8,1,'/category/add','Thêm mới',-1,1,'2021-10-03 11:35:04','2021-10-03 11:35:04'),(9,1,'/category/save','Lưu',-1,1,'2021-10-03 11:35:04','2021-10-03 11:35:04'),(10,1,'/category/delete','Xoá',-1,1,'2021-10-03 11:35:04','2021-10-03 11:35:04'),(11,1,'/product-info/edit','Sửa',-1,1,'2021-10-03 11:35:04','2021-10-03 11:35:04'),(12,1,'/product-info/view','Xem',-1,1,'2021-10-03 11:35:04','2021-10-03 11:35:04'),(13,1,'/product-info/add','Thêm mới',-1,1,'2021-10-03 11:35:04','2021-10-03 11:35:04'),(14,1,'/product-info/save','Lưu',-1,1,'2021-10-03 11:35:04','2021-10-03 11:35:04'),(15,1,'/product-info/delete','Xoá',-1,1,'2021-10-03 11:35:04','2021-10-03 11:35:04'),(16,2,'/goods-receipt/list','Danh sách nhập kho',1,1,'2021-10-03 11:35:04','2021-10-03 11:35:04'),(17,2,'/goods-receipt/view','Xem',-1,1,'2021-10-03 11:35:04','2021-10-03 11:35:04'),(18,2,'/goods-receipt/add','Thêm mới',-1,1,'2021-10-03 11:35:04','2021-10-03 11:35:04'),(19,2,'/goods-receipt/save','Lưu',-1,1,'2021-10-03 11:35:04','2021-10-03 11:35:04'),(20,2,'/goods-receipt/export','Xuất báo cáo',-1,1,'2021-10-03 11:35:04','2021-10-03 11:35:04'),(21,2,'/goods-issue/list','Danh sách xuất kho',2,1,'2021-10-03 11:35:04','2021-10-03 11:35:04'),(22,2,'/product-in-stock/list','Sản phẩm trong kho',3,1,'2021-10-03 11:35:04','2021-10-03 11:35:04'),(23,2,'/history/list','Lịch sử kho',4,1,'2021-10-03 11:35:04','2021-10-03 11:35:04'),(24,3,'/user/list','Danh sách user',1,1,'2021-10-03 11:35:04','2021-10-03 11:35:04'),(25,3,'/menu/list','Danh sách menu',3,1,'2021-10-03 11:35:04','2021-10-03 11:35:04'),(26,3,'/role/list','Danh sách quyền',2,1,'2021-10-03 11:35:04','2021-10-03 11:35:04'),(27,2,'/goods-receipt/edit','Sửa',-1,1,'2021-10-03 17:14:21','2021-10-03 17:14:21'),(28,2,'/goods-issue/add','Thêm mới',-1,1,'2021-10-04 07:40:17','2021-10-04 07:40:17'),(29,2,'/goods-issue/edit','Sửa',-1,1,'2021-10-04 07:40:17','2021-10-04 07:40:17'),(30,2,'/goods-issue/view','Xem',-1,1,'2021-10-04 07:40:17','2021-10-04 07:40:17'),(31,2,'/goods-issue/save','Lưu',-1,1,'2021-10-04 07:40:17','2021-10-04 07:40:17'),(32,2,'/goods-issue/export','Xuất báo cáo',-1,1,'2021-10-04 07:40:17','2021-10-04 07:40:17'),(33,3,'/user/save','Save',-1,1,'2021-10-04 10:58:13','2021-10-04 10:58:13'),(34,3,'/user/edit','Edit',-1,1,'2021-10-04 10:58:13','2021-10-04 10:58:13'),(35,3,'/user/view','View',-1,1,'2021-10-04 10:58:13','2021-10-04 10:58:13'),(36,3,'/user/add','Add',-1,1,'2021-10-04 10:58:13','2021-10-04 10:58:13'),(37,3,'/user/update','Update',-1,1,'2021-10-04 15:30:43','2021-10-04 15:30:43'),(38,3,'/role/save','Save',-1,1,'2021-10-04 15:52:57','2021-10-04 15:52:57'),(39,3,'/role/edit','Edit',-1,1,'2021-10-04 15:52:57','2021-10-04 15:52:57'),(40,3,'/role/view','View',-1,1,'2021-10-04 15:52:57','2021-10-04 15:52:57'),(41,3,'/role/add','Add',-1,1,'2021-10-04 15:52:57','2021-10-04 15:52:57'),(42,3,'/menu/change-status','Menu Status',-1,1,'2021-10-05 02:07:09','2021-10-05 02:07:09'),(43,3,'/menu/permission','Menu Permission',-1,1,'2021-10-05 02:07:09','2021-10-05 02:07:09'),(44,3,'/menu/update-permission','Menu Update',-1,1,'2021-10-05 02:45:52','2021-10-05 02:45:52');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_in_stock`
--

DROP TABLE IF EXISTS `product_in_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_in_stock` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `PRODUCT_ID` int NOT NULL,
  `QTY` int NOT NULL,
  `PRICE` decimal(15,2) NOT NULL,
  `ACTIVE_FLAG` int NOT NULL DEFAULT '1',
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `productId_foreignKey_idx` (`PRODUCT_ID`),
  CONSTRAINT `productId_foreignKey` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product_info` (`ID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_in_stock`
--

LOCK TABLES `product_in_stock` WRITE;
/*!40000 ALTER TABLE `product_in_stock` DISABLE KEYS */;
INSERT INTO `product_in_stock` VALUES (1,3,9,30000000.00,1,'2021-10-03 16:59:46','2021-10-04 07:44:00'),(2,1,3,20000000.00,1,'2021-10-03 17:21:29','2021-10-04 07:44:42');
/*!40000 ALTER TABLE `product_in_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_info`
--

DROP TABLE IF EXISTS `product_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_info` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CATE_ID` int NOT NULL,
  `CODE` varchar(50) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `DESCRIPTION` text,
  `IMG_URL` varchar(200) NOT NULL,
  `ACTIVE_FLAG` int NOT NULL DEFAULT '1',
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `cateId_foreignKey_idx` (`CATE_ID`),
  CONSTRAINT `cateId_foreignKey` FOREIGN KEY (`CATE_ID`) REFERENCES `category` (`ID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_info`
--

LOCK TABLES `product_info` WRITE;
/*!40000 ALTER TABLE `product_info` DISABLE KEYS */;
INSERT INTO `product_info` VALUES (1,8,'SS_Note9','SamSung Note 9','SamSung Note 9 with s-pen','/upload/1631696714900_samsung-galaxy-note-9-black-600x600.jpeg',1,'2021-09-15 08:22:55','2021-09-15 09:05:15'),(2,1,'APPLE ','Apple Iphone13','Apple Iphone13','/upload/1631885451855_iphone-13-pro-max-cau-hinh_2000x2000-800-resize.png',1,'2021-09-15 09:02:37','2021-09-17 13:30:52'),(3,11,'Lenovo-L','Lenovo Legion Gaming Phone Pro','ÄÃ¢y lÃ  chÃ¢n dung chiáº¿c Lenovo Legion Gaming Phone Pro sáº¯p ra máº¯t','/upload/1633280339860_Lenovo-Legion-Gaming-Phone-Pro-image-1.jpeg',1,'2021-10-03 16:59:00','2021-10-03 16:59:00'),(4,9,'HW-N','HUAWEI nova','HUAWEI nova 8 5G, 7.64mm, HiSilicon Kirin 985 processor, 1080P resolution and 90hz refresh rate, OLED screen, 66W fast charging technology, 3700 mAh.','/upload/1633409278763_huawei-nova-8-5g-black.jpg',1,'2021-10-05 04:47:59','2021-10-05 04:47:59');
/*!40000 ALTER TABLE `product_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ROLE_NAME` varchar(50) NOT NULL,
  `DESCRIPTION` varchar(200) NOT NULL,
  `ACTIVE_FLAG` int NOT NULL DEFAULT '1',
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'admin','Admin of system',1,'2021-09-08 09:24:44','2021-09-08 09:24:44'),(2,'staff','Staff of system',1,'2021-09-08 09:24:44','2021-09-08 09:24:44'),(3,'viewer','Viewer in System',1,'2021-10-04 15:56:46','2021-10-05 04:32:24');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `USER_ID` int NOT NULL,
  `ROLE_ID` int NOT NULL,
  `ACTIVE_FLAG` int NOT NULL DEFAULT '1',
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `userId_foreign_key_idx` (`USER_ID`),
  KEY `roleId_foreign_key_idx` (`ROLE_ID`),
  CONSTRAINT `roleId_foreign_key` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`ID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `userId_foreign_key` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`ID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,1,1,1,'2021-10-03 10:56:02','2021-10-04 15:40:24'),(2,2,1,1,'2021-10-04 13:06:00','2021-10-05 04:11:09'),(3,3,2,1,'2021-10-04 13:06:51','2021-10-04 13:06:51');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `USER_NAME` varchar(50) NOT NULL,
  `PASSWORD` varchar(100) NOT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `NAME` varchar(100) NOT NULL,
  `ACTIVE_FLAG` int NOT NULL DEFAULT '1',
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','T7IaJPtdeF15b+ONqJ1JeuhCkeSN11Se','nlphuong95@gmail.com','Phuong Nguyen',1,'2021-09-07 09:20:10','2021-10-04 15:40:24'),(2,'mxuyen','0u9qiQx+A/q+TGVF1EKBQ9gyUcTPIUey','xuyendanh@gmail.ccom','My Xuyen1',1,'2021-10-04 13:06:00','2021-10-05 04:11:09'),(3,'dxuyen','b3oAQbjUWwffU1CgLTacBoouyrji8JMg','dxuyen@gmail.com','Danh Xuyen',1,'2021-10-04 13:06:51','2021-10-04 13:06:51');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-08 19:38:12
