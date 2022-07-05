CREATE DATABASE  IF NOT EXISTS `hfr_product_ordering_dev` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `hfr_product_ordering_dev`;
-- MariaDB dump 10.18  Distrib 10.5.8-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 83.138.186.3    Database: hfr_product_ordering_dev
-- ------------------------------------------------------
-- Server version	10.5.10-MariaDB

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `location_id` mediumint(8) unsigned NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address_label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `postal_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('Active','Inactive','Delete') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addresses_location_id_foreign` (`location_id`),
  KEY `addresses_company_id_foreign` (`company_id`),
  CONSTRAINT `addresses_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `addresses_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,4,535,'United Kingdom','Default','123465','+447678123457','Active','2021-05-13 06:21:26','2021-05-13 06:21:26'),(2,7,1604,'UK','Default','12346','+447678123456','Active','2021-05-13 06:23:06','2021-05-13 06:23:06'),(3,6,2,'30 Long St, Tetbury GL8 8AQ, United Kingdom','Default','GL89AQ','+447654567806','Active','2021-05-14 10:45:02','2021-05-14 10:45:02');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_values`
--

DROP TABLE IF EXISTS `attribute_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_values` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` mediumint(8) unsigned NOT NULL,
  `attribute_value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_values_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_values`
--

LOCK TABLES `attribute_values` WRITE;
/*!40000 ALTER TABLE `attribute_values` DISABLE KEYS */;
INSERT INTO `attribute_values` VALUES (1,1,'656','Active',1,NULL,'2021-03-15 10:14:29',NULL),(2,1,'657','Active',1,1,'2021-03-15 10:14:44','2021-03-17 14:33:26'),(3,4,'Blue','Active',1,NULL,'2021-05-13 06:24:32',NULL),(4,4,'Red','Active',1,NULL,'2021-05-13 11:54:35',NULL),(5,4,'Black','Active',1,NULL,'2021-05-13 11:54:57',NULL);
/*!40000 ALTER TABLE `attribute_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attributes` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes`
--

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
INSERT INTO `attributes` VALUES (1,'Weight','Active',1,1,'2021-03-15 10:09:31','2021-05-13 11:53:43'),(2,'Size','Active',1,1,'2021-03-17 14:31:46','2021-05-13 11:53:11'),(3,'Height','Active',1,1,'2021-03-17 14:32:03','2021-05-13 11:53:27'),(4,'Color','Active',1,NULL,'2021-05-13 06:24:22',NULL),(5,'Width','Active',1,NULL,'2021-05-13 11:54:02',NULL);
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banners` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `banner_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `banner_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `banner_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `banner_link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('Active','Inactive','Delete') COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `button_text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `priority` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banners`
--

LOCK TABLES `banners` WRITE;
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
INSERT INTO `banners` VALUES (1,'Test Banner','1620894476-d3b6488dd189048d58d82a4aee68dcef.jpg','treter','http://test.com/testproduct','Active',1,1,'2021-03-15 12:24:24','2021-05-13 08:27:57',NULL,NULL),(2,'test banner title','1615987932.jpg','test desc','http://testbanner.com','Active',1,1,'2021-03-17 13:32:11','2021-04-06 12:27:09',NULL,NULL),(3,'Home Page Banner','1620894506-0ba3d60362c7e6d256cfc1f37156bad9.jpg','Home Page Banner','https://www.amazon.in/dp/B085J1J32G?pf_rd_r=CZCXDXQZVY2NN82TH22H&pf_rd_p=dbc5263e-ef77-40f7-a395-5f276dcc022a','Active',1,NULL,'2021-05-13 08:28:27',NULL,'Mobile Phones',1);
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brands` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `brand_description` text COLLATE utf8_unicode_ci NOT NULL,
  `brand_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('Active','Inactive','Delete') COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `attribute_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`attribute_data`)),
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_product_id_foreign` (`product_id`),
  KEY `carts_store_id_foreign` (`store_id`),
  CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `carts_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (1,1,2,10,1,'2021-04-14 11:53:28',NULL,NULL),(2,3,2,100,1,'2021-05-13 07:14:56','[{\"id\":2,\"attribute_name\":\"m,m,\",\"attribute_value\":\"657\"}]',NULL);
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category_type` enum('Product','Blog','Others') COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('Active','Inactive','Delete') COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Beds','Product','<p>fdgdf gf gdf</p>','1615802661.jpg','beds','Active',1,1,'2021-05-13 11:05:40','2021-05-13 11:05:40',3),(2,'Wardrobes','Product','<p>hfgh</p>','1615991991.png','wardrobes','Active',1,NULL,'2021-05-13 11:07:03','2021-05-13 11:07:03',3),(3,'Furniture','Product',NULL,'1620887112-image2.jpg','furniture','Active',1,NULL,'2021-05-13 11:04:47','2021-05-13 11:04:47',NULL),(4,'Sofa','Product',NULL,'1620887164-logo.jpg','sofa','Active',1,NULL,'2021-05-13 11:05:58','2021-05-13 11:05:58',3);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company_type` int(11) NOT NULL COMMENT '"2"=>"Admin" , "3"=>"Supplier" , "4"=>"Store"',
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alternate_mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('Active','Inactive','Delete') COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `companies_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'Tomathon Test Store',3,'tompearson@homeserverepairs.co.uk','7857084424',NULL,'1615473610-TPCoding.png','Active',1,NULL,'2021-03-11 14:40:10',NULL),(2,'Madhavi Chavan',4,'madhavichavan@homeserverepairs.co.uk','123456789',NULL,'1615799500-accounting cycle 2.png','Delete',1,1,'2021-03-15 09:11:40','2021-03-15 09:11:49'),(3,'Madhavi Chavan',4,'madhavichavan1@homeserverepairs.co.uk','123456789',NULL,'1615799566-accounting system.png','Active',1,1,'2021-03-15 09:12:46','2021-05-14 10:55:09'),(4,'test supplier',3,'testSupplier@test.com','+447678123457','5345345','1615989352-Homeserve Logo final.jpg','Active',1,1,'2021-03-17 13:55:52','2021-05-13 06:21:26'),(5,'test supplier',4,'testSupplier1@test.com','54353454','4543','1615989583-Homeserve-Logo-206x32.png','Active',1,NULL,'2021-03-17 13:59:43',NULL),(6,'Lorfords',3,'lorfords@test.com','+447654567806','5345345','1620989102-lo.png','Inactive',1,1,'2021-03-17 14:00:27','2021-05-14 10:55:54'),(7,'SupplierCompany',3,'suppliercompany@gmail.com','+447678123456',NULL,'1620886986-logo.jpg','Active',1,NULL,'2021-05-13 06:23:06',NULL);
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaint_activity`
--

DROP TABLE IF EXISTS `complaint_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complaint_activity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `complaint_id` int(10) unsigned NOT NULL,
  `complaint_status` enum('Unresolved','Inprogress','Resolved') COLLATE utf8_unicode_ci NOT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `complaint_activity_complaint_id_foreign` (`complaint_id`),
  CONSTRAINT `complaint_activity_complaint_id_foreign` FOREIGN KEY (`complaint_id`) REFERENCES `complaints` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaint_activity`
--

LOCK TABLES `complaint_activity` WRITE;
/*!40000 ALTER TABLE `complaint_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `complaint_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaint_type`
--

DROP TABLE IF EXISTS `complaint_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complaint_type` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `complaint_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaint_type`
--

LOCK TABLES `complaint_type` WRITE;
/*!40000 ALTER TABLE `complaint_type` DISABLE KEYS */;
INSERT INTO `complaint_type` VALUES (1,'Damages','2021-04-13 19:46:39',NULL),(2,'Wrong items','2021-04-13 19:46:39',NULL),(3,'Less quantity received','2021-04-13 19:46:39',NULL),(4,'Over quantity received','2021-04-13 19:46:39',NULL),(5,'Expired date items received','2021-04-13 19:46:39',NULL),(6,'Wrong colour and sizing received','2021-04-13 19:46:39',NULL),(7,'Late deliveries','2021-04-13 19:46:39',NULL);
/*!40000 ALTER TABLE `complaint_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaints`
--

DROP TABLE IF EXISTS `complaints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complaints` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_details_id` int(10) unsigned NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `complaint_type_id` smallint(5) unsigned NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `complaint_status` enum('Unresolved','Inprogress','Resolved') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `complaints_order_details_id_foreign` (`order_details_id`),
  KEY `complaints_order_id_foreign` (`order_id`),
  KEY `complaints_complaint_type_id_foreign` (`complaint_type_id`),
  CONSTRAINT `complaints_complaint_type_id_foreign` FOREIGN KEY (`complaint_type_id`) REFERENCES `complaint_type` (`id`),
  CONSTRAINT `complaints_order_details_id_foreign` FOREIGN KEY (`order_details_id`) REFERENCES `order_details` (`id`),
  CONSTRAINT `complaints_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaints`
--

LOCK TABLES `complaints` WRITE;
/*!40000 ALTER TABLE `complaints` DISABLE KEYS */;
/*!40000 ALTER TABLE `complaints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_logs`
--

DROP TABLE IF EXISTS `email_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sent_by` int(11) NOT NULL,
  `sent_from` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sent_to` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_logs`
--

LOCK TABLES `email_logs` WRITE;
/*!40000 ALTER TABLE `email_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enquirys`
--

DROP TABLE IF EXISTS `enquirys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enquirys` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enquirys`
--

LOCK TABLES `enquirys` WRITE;
/*!40000 ALTER TABLE `enquirys` DISABLE KEYS */;
/*!40000 ALTER TABLE `enquirys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventories`
--

DROP TABLE IF EXISTS `inventories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `instock_quntity` int(11) NOT NULL,
  `sold_quntity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `inventories_product_id_foreign` (`product_id`),
  CONSTRAINT `inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventories`
--

LOCK TABLES `inventories` WRITE;
/*!40000 ALTER TABLE `inventories` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `town` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `province` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1719 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'Ampthill','Bedfordshire','England'),(2,'Arlesey','Bedfordshire','England'),(3,'Bedford','Bedfordshire','England'),(4,'Biggleswade','Bedfordshire','England'),(5,'Dunstable','Bedfordshire','England'),(6,'Flitwick','Bedfordshire','England'),(7,'Houghton Regis','Bedfordshire','England'),(8,'Kempston','Bedfordshire','England'),(9,'Leighton Buzzard','Bedfordshire','England'),(10,'Linslade','Bedfordshire','England'),(11,'Luton','Bedfordshire','England'),(12,'Potton','Bedfordshire','England'),(13,'Sandy','Bedfordshire','England'),(14,'Shefford','Bedfordshire','England'),(15,'Stotfold','Bedfordshire','England'),(16,'Wixams','Bedfordshire','England'),(17,'Woburn','Bedfordshire','England'),(18,'Ascot','Berkshire','England'),(19,'Bracknell','Berkshire','England'),(20,'Crowthorne','Berkshire','England'),(21,'Earley','Berkshire','England'),(22,'Eton','Berkshire','England'),(23,'Hungerford','Berkshire','England'),(24,'Lambourn','Berkshire','England'),(25,'Maidenhead','Berkshire','England'),(26,'Newbury','Berkshire','England'),(27,'Reading','Berkshire','England'),(28,'Sandhurst','Berkshire','England'),(29,'Slough','Berkshire','England'),(30,'Thatcham','Berkshire','England'),(31,'Windsor','Berkshire','England'),(32,'Wokingham','Berkshire','England'),(33,'Woodley','Berkshire','England'),(34,'Bristol','Bristol','England'),(35,'Amersham','Buckinghamshire','England'),(36,'Aylesbury','Buckinghamshire','England'),(37,'Beaconsfield','Buckinghamshire','England'),(38,'Bletchley','Buckinghamshire','England'),(39,'Buckingham','Buckinghamshire','England'),(40,'Chesham','Buckinghamshire','England'),(41,'Fenny Stratford','Buckinghamshire','England'),(42,'High Wycombe','Buckinghamshire','England'),(43,'Marlow','Buckinghamshire','England'),(44,'Milton Keynes','Buckinghamshire','England'),(45,'Newport Pagnell','Buckinghamshire','England'),(46,'Olney','Buckinghamshire','England'),(47,'Princes Risborough','Buckinghamshire','England'),(48,'Stony Stratford','Buckinghamshire','England'),(49,'Wendover','Buckinghamshire','England'),(50,'Winslow','Buckinghamshire','England'),(51,'Woburn Sands','Buckinghamshire','England'),(52,'Wolverton and Greenleys','Buckinghamshire','England'),(53,'Cambridge','Cambridgeshire','England'),(54,'Chatteris','Cambridgeshire','England'),(55,'Ely','Cambridgeshire','England'),(56,'Fulbourn','Cambridgeshire','England'),(57,'Godmanchester','Cambridgeshire','England'),(58,'Hanley Grange','Cambridgeshire','England'),(59,'Huntingdon','Cambridgeshire','England'),(60,'March','Cambridgeshire','England'),(61,'Northstowe','Cambridgeshire','England'),(62,'Peterborough','Cambridgeshire','England'),(63,'Ramsey','Cambridgeshire','England'),(64,'Soham','Cambridgeshire','England'),(65,'St Ives','Cambridgeshire','England'),(66,'St Neots','Cambridgeshire','England'),(67,'Whittlesey','Cambridgeshire','England'),(68,'Wisbech','Cambridgeshire','England'),(69,'Alsager','Cheshire','England'),(70,'Birchwood','Cheshire','England'),(71,'Bollington','Cheshire','England'),(72,'Chester','Cheshire','England'),(73,'Congleton','Cheshire','England'),(74,'Crewe','Cheshire','England'),(75,'Ellesmere Port','Cheshire','England'),(76,'Frodsham','Cheshire','England'),(77,'Knutsford','Cheshire','England'),(78,'Macclesfield','Cheshire','England'),(79,'Malpas','Cheshire','England'),(80,'Middlewich','Cheshire','England'),(81,'Nantwich','Cheshire','England'),(82,'Neston','Cheshire','England'),(83,'Northwich','Cheshire','England'),(84,'Poynton with Worth','Cheshire','England'),(85,'Runcorn','Cheshire','England'),(86,'Sandbach','Cheshire','England'),(87,'Warrington','Cheshire','England'),(88,'Widnes','Cheshire','England'),(89,'Wilmslow','Cheshire','England'),(90,'Winsford','Cheshire','England'),(91,'Bodmin','Cornwall','England'),(92,'Bude','Cornwall','England'),(93,'Callington','Cornwall','England'),(94,'Camborne','Cornwall','England'),(95,'Camelford','Cornwall','England'),(96,'Charlestown','Cornwall','England'),(97,'Falmouth','Cornwall','England'),(98,'Fowey','Cornwall','England'),(99,'Hayle','Cornwall','England'),(100,'Helston','Cornwall','England'),(101,'Launceston','Cornwall','England'),(102,'Liskeard','Cornwall','England'),(103,'Looe','Cornwall','England'),(104,'Lostwithiel','Cornwall','England'),(105,'Marazion','Cornwall','England'),(106,'Newlyn','Cornwall','England'),(107,'Newquay','Cornwall','England'),(108,'Padstow','Cornwall','England'),(109,'Par','Cornwall','England'),(110,'Penryn','Cornwall','England'),(111,'Penzance','Cornwall','England'),(112,'Porthleven','Cornwall','England'),(113,'Redruth','Cornwall','England'),(114,'Saltash','Cornwall','England'),(115,'St Austell','Cornwall','England'),(116,'St Blazey','Cornwall','England'),(117,'St Columb Major','Cornwall','England'),(118,'St Ives','Cornwall','England'),(119,'St Just','Cornwall','England'),(120,'St Mawes','Cornwall','England'),(121,'Stratton','Cornwall','England'),(122,'Torpoint','Cornwall','England'),(123,'Truro','Cornwall','England'),(124,'Wadebridge','Cornwall','England'),(125,'Barnard Castle','County Durham','England'),(126,'Billingham','County Durham','England'),(127,'Bishop Auckland','County Durham','England'),(128,'Chester le Street','County Durham','England'),(129,'Consett','County Durham','England'),(130,'Crook','County Durham','England'),(131,'Darlington','County Durham','England'),(132,'Durham','County Durham','England'),(133,'Eaglescliffe','County Durham','England'),(134,'Eastington','County Durham','England'),(135,'Ferryhill','County Durham','England'),(136,'Greater Willington','County Durham','England'),(137,'Hartlepool','County Durham','England'),(138,'Newton Aycliffe','County Durham','England'),(139,'Peterlee','County Durham','England'),(140,'Seaham','County Durham','England'),(141,'Sedgefield','County Durham','England'),(142,'Shildon','County Durham','England'),(143,'Spennymoor','County Durham','England'),(144,'Stanhope','County Durham','England'),(145,'Stanley','County Durham','England'),(146,'Stockton on Tees','County Durham','England'),(147,'Tow Law','County Durham','England'),(148,'Willington','County Durham','England'),(149,'Wolsingham','County Durham','England'),(150,'Alston','Cumbria','England'),(151,'Ambleside','Cumbria','England'),(152,'Appleby in Westmorland','Cumbria','England'),(153,'Aspatria','Cumbria','England'),(154,'Barrow in Furness','Cumbria','England'),(155,'Bowness on Windermere','Cumbria','England'),(156,'Brampton','Cumbria','England'),(157,'Broughton in Furness','Cumbria','England'),(158,'Carlisle','Cumbria','England'),(159,'Cleator Moor','Cumbria','England'),(160,'Cockermouth','Cumbria','England'),(161,'Dalton in Furness','Cumbria','England'),(162,'Egremont','Cumbria','England'),(163,'Grange over Sands','Cumbria','England'),(164,'Harrington','Cumbria','England'),(165,'Kendal','Cumbria','England'),(166,'Keswick','Cumbria','England'),(167,'Kirkby Lonsdale','Cumbria','England'),(168,'Kirkby Stephen','Cumbria','England'),(169,'Longtown','Cumbria','England'),(170,'Maryport','Cumbria','England'),(171,'Millom','Cumbria','England'),(172,'Milnthorpe','Cumbria','England'),(173,'Orgill','Cumbria','England'),(174,'Penrith','Cumbria','England'),(175,'Sedbergh','Cumbria','England'),(176,'Silloth','Cumbria','England'),(177,'Staveley','Cumbria','England'),(178,'Ulverston','Cumbria','England'),(179,'Whitehaven','Cumbria','England'),(180,'Wigton','Cumbria','England'),(181,'Windermere','Cumbria','England'),(182,'Workington','Cumbria','England'),(183,'Alfreton','Derbyshire','England'),(184,'Ashbourne','Derbyshire','England'),(185,'Bakewell','Derbyshire','England'),(186,'Barrow Hill and Whittington','Derbyshire','England'),(187,'Belper','Derbyshire','England'),(188,'Bolsover','Derbyshire','England'),(189,'Buxton','Derbyshire','England'),(190,'Chapel en le Frith','Derbyshire','England'),(191,'Chesterfield','Derbyshire','England'),(192,'Clay Cross','Derbyshire','England'),(193,'Darley Dale','Derbyshire','England'),(194,'Derby','Derbyshire','England'),(195,'Dronfield','Derbyshire','England'),(196,'Dronfield Woodhouse','Derbyshire','England'),(197,'Eckington','Derbyshire','England'),(198,'Fairfield','Derbyshire','England'),(199,'Glossop','Derbyshire','England'),(200,'Hadfield','Derbyshire','England'),(201,'Heanor','Derbyshire','England'),(202,'Ilkeston','Derbyshire','England'),(203,'Killamarsh','Derbyshire','England'),(204,'Langley Mill','Derbyshire','England'),(205,'Long Eaton','Derbyshire','England'),(206,'Matlock','Derbyshire','England'),(207,'Melbourne','Derbyshire','England'),(208,'Netherthorpe','Derbyshire','England'),(209,'New Mills','Derbyshire','England'),(210,'Over Woodhouse','Derbyshire','England'),(211,'Ripley','Derbyshire','England'),(212,'Sandiacre','Derbyshire','England'),(213,'Shallcross','Derbyshire','England'),(214,'Shirebrook','Derbyshire','England'),(215,'Staveley','Derbyshire','England'),(216,'Swadlincote','Derbyshire','England'),(217,'Whaley Bridge','Derbyshire','England'),(218,'Wirksworth','Derbyshire','England'),(219,'Ashburton','Devon','England'),(220,'Axminster','Devon','England'),(221,'Bampton','Devon','England'),(222,'Barnstaple','Devon','England'),(223,'Bideford','Devon','England'),(224,'Bovey Tracey','Devon','England'),(225,'Bradninch','Devon','England'),(226,'Brixham','Devon','England'),(227,'Buckfastleigh','Devon','England'),(228,'Budleigh Salterton','Devon','England'),(229,'Chagford','Devon','England'),(230,'Chudleigh','Devon','England'),(231,'Chulmleigh','Devon','England'),(232,'Colyton','Devon','England'),(233,'Crediton','Devon','England'),(234,'Cullompton','Devon','England'),(235,'Dartmouth','Devon','England'),(236,'Dawlish','Devon','England'),(237,'Exeter','Devon','England'),(238,'Exmouth','Devon','England'),(239,'Great Torrington','Devon','England'),(240,'Hartland','Devon','England'),(241,'Hatherleigh','Devon','England'),(242,'Highampton','Devon','England'),(243,'Holsworthy','Devon','England'),(244,'Honiton','Devon','England'),(245,'Ilfracombe','Devon','England'),(246,'Ivybridge','Devon','England'),(247,'Kingsbridge','Devon','England'),(248,'Kingsteignton','Devon','England'),(249,'Lynton','Devon','England'),(250,'Modbury','Devon','England'),(251,'Moretonhampstead','Devon','England'),(252,'Newton Abbot','Devon','England'),(253,'North Tawton','Devon','England'),(254,'Northam','Devon','England'),(255,'Okehampton','Devon','England'),(256,'Ottery St Mary','Devon','England'),(257,'Paignton','Devon','England'),(258,'Plymouth','Devon','England'),(259,'Princetown','Devon','England'),(260,'Salcombe','Devon','England'),(261,'Seaton','Devon','England'),(262,'Sherford','Devon','England'),(263,'Sidmouth','Devon','England'),(264,'South Molton','Devon','England'),(265,'Tavistock','Devon','England'),(266,'Teignmouth','Devon','England'),(267,'Tiverton','Devon','England'),(268,'Topsham','Devon','England'),(269,'Torquay','Devon','England'),(270,'Totnes','Devon','England'),(271,'Beaminster','Dorset','England'),(272,'Blandford Forum','Dorset','England'),(273,'Bournemouth','Dorset','England'),(274,'Bridport','Dorset','England'),(275,'Chickerell','Dorset','England'),(276,'Christchurch','Dorset','England'),(277,'Dorchester','Dorset','England'),(278,'Ferndown','Dorset','England'),(279,'Gillingham','Dorset','England'),(280,'Highcliffe','Dorset','England'),(281,'Lyme Regis','Dorset','England'),(282,'Poole','Dorset','England'),(283,'Portland','Dorset','England'),(284,'Shaftesbury','Dorset','England'),(285,'Sherborne','Dorset','England'),(286,'Stalbridge','Dorset','England'),(287,'Sturminster Newton','Dorset','England'),(288,'Swanage','Dorset','England'),(289,'Verwood','Dorset','England'),(290,'Wareham','Dorset','England'),(291,'Weymouth','Dorset','England'),(292,'Wimborne Minster','Dorset','England'),(293,'Beverley','East Riding of Yorkshire','England'),(294,'Bridlington','East Riding of Yorkshire','England'),(295,'Brough','East Riding of Yorkshire','England'),(296,'Driffield','East Riding of Yorkshire','England'),(297,'Goole','East Riding of Yorkshire','England'),(298,'Hedon','East Riding of Yorkshire','England'),(299,'Hessle','East Riding of Yorkshire','England'),(300,'Hornsea','East Riding of Yorkshire','England'),(301,'Howden','East Riding of Yorkshire','England'),(302,'Market Weighton','East Riding of Yorkshire','England'),(303,'Pocklington','East Riding of Yorkshire','England'),(304,'Snaith','East Riding of Yorkshire','England'),(305,'South Cave','East Riding of Yorkshire','England'),(306,'Withernsea','East Riding of Yorkshire','England'),(307,'Battle','East Sussex','England'),(308,'Bexhill on Sea','East Sussex','England'),(309,'Brighton','East Sussex','England'),(310,'Crowborough','East Sussex','England'),(311,'Eastbourne','East Sussex','England'),(312,'Hailsham','East Sussex','England'),(313,'Hastings','East Sussex','England'),(314,'Heathfield','East Sussex','England'),(315,'Hove','East Sussex','England'),(316,'Lewes','East Sussex','England'),(317,'Newhaven','East Sussex','England'),(318,'Ore Valley','East Sussex','England'),(319,'Peacehaven','East Sussex','England'),(320,'Polegate','East Sussex','England'),(321,'Rye','East Sussex','England'),(322,'Seaford','East Sussex','England'),(323,'Telscombe','East Sussex','England'),(324,'Uckfield','East Sussex','England'),(325,'Wadhurst','East Sussex','England'),(326,'Winchelsea','East Sussex','England'),(327,'Basildon','Essex','England'),(328,'Billericay','Essex','England'),(329,'Braintree','Essex','England'),(330,'Brentwood','Essex','England'),(331,'Brightlingsea','Essex','England'),(332,'Buckhurst Hill','Essex','England'),(333,'Burnham on Crouch','Essex','England'),(334,'Canvey Island','Essex','England'),(335,'Chafford Hundred','Essex','England'),(336,'Chelmsford','Essex','England'),(337,'Clackwell','Essex','England'),(338,'Clacton on Sea','Essex','England'),(339,'Coggeshall','Essex','England'),(340,'Colchester','Essex','England'),(341,'Corringham','Essex','England'),(342,'Dovercourt','Essex','England'),(343,'Eastwood','Essex','England'),(344,'Epping','Essex','England'),(345,'Frinton on Sea','Essex','England'),(346,'Grays','Essex','England'),(347,'Great Dunmow','Essex','England'),(348,'Hadleigh','Essex','England'),(349,'Halstead','Essex','England'),(350,'Harlow','Essex','England'),(351,'Harwich','Essex','England'),(352,'Heybridge','Essex','England'),(353,'Hockley','Essex','England'),(354,'Holland on Sea','Essex','England'),(355,'Ingatestone','Essex','England'),(356,'Laindon','Essex','England'),(357,'Langdon Hills','Essex','England'),(358,'Leigh on Sea','Essex','England'),(359,'Loughton','Essex','England'),(360,'Maldon','Essex','England'),(361,'Manningtree','Essex','England'),(362,'North Shoebury','Essex','England'),(363,'Ongar','Essex','England'),(364,'Parkeston','Essex','England'),(365,'Pitsea','Essex','England'),(366,'Prettlewell','Essex','England'),(367,'Rayleigh','Essex','England'),(368,'Rochford','Essex','England'),(369,'Romford','Essex','England'),(370,'Saffron Walden','Essex','England'),(371,'Shoeburyness','Essex','England'),(372,'South Benfleet','Essex','England'),(373,'South Woodham Ferrers','Essex','England'),(374,'Southchurch','Essex','England'),(375,'Southend on Sea','Essex','England'),(376,'Southminster','Essex','England'),(377,'Stanfield le Hope','Essex','England'),(378,'Thaxted','Essex','England'),(379,'Thorpe Bay','Essex','England'),(380,'Tilbury','Essex','England'),(381,'Waltham Abbey','Essex','England'),(382,'Walton on the Naze','Essex','England'),(383,'West Mersea','Essex','England'),(384,'West Thurrock','Essex','England'),(385,'West Tilbury','Essex','England'),(386,'Westcliff on Sea','Essex','England'),(387,'Wickford','Essex','England'),(388,'Witham','Essex','England'),(389,'Wivenhoe','Essex','England'),(390,'Berkeley','Gloucestershire','England'),(391,'Bradley Stoke','Gloucestershire','England'),(392,'Cheltenham','Gloucestershire','England'),(393,'Chipping Campden','Gloucestershire','England'),(394,'Chipping Sodbury','Gloucestershire','England'),(395,'Cinderford','Gloucestershire','England'),(396,'Cirencester','Gloucestershire','England'),(397,'Coleford','Gloucestershire','England'),(398,'Dursley','Gloucestershire','England'),(399,'Fairford','Gloucestershire','England'),(400,'Filton','Gloucestershire','England'),(401,'Gloucester','Gloucestershire','England'),(402,'Kingswood','Gloucestershire','England'),(403,'Lechlade','Gloucestershire','England'),(404,'Lydney','Gloucestershire','England'),(405,'Minchinhampton','Gloucestershire','England'),(406,'Mitcheldean','Gloucestershire','England'),(407,'Moreton in Marsh','Gloucestershire','England'),(408,'Nailsworth','Gloucestershire','England'),(409,'Newent','Gloucestershire','England'),(410,'Northleach','Gloucestershire','England'),(411,'Painswick','Gloucestershire','England'),(412,'Patchway','Gloucestershire','England'),(413,'Stonehouse','Gloucestershire','England'),(414,'Stow on the Wold','Gloucestershire','England'),(415,'Stroud','Gloucestershire','England'),(416,'Tetbury','Gloucestershire','England'),(417,'Tewkesbury','Gloucestershire','England'),(418,'Thornbury','Gloucestershire','England'),(419,'Wickwar','Gloucestershire','England'),(420,'Winchcombe','Gloucestershire','England'),(421,'Wotton under Edge','Gloucestershire','England'),(422,'Yate','Gloucestershire','England'),(423,'Acton','Greater London','England'),(424,'Barking','Greater London','England'),(425,'Barnes','Greater London','England'),(426,'Beckenham','Greater London','England'),(427,'Bexley','Greater London','England'),(428,'Brentford','Greater London','England'),(429,'Bromley','Greater London','England'),(430,'Chingford','Greater London','England'),(431,'Croydon','Greater London','England'),(432,'Dagenham','Greater London','England'),(433,'Ealing','Greater London','England'),(434,'East Ham','Greater London','England'),(435,'Edgware','Greater London','England'),(436,'Edmonton','Greater London','England'),(437,'Enfield','Greater London','England'),(438,'Erith','Greater London','England'),(439,'Finchley','Greater London','England'),(440,'Harrow','Greater London','England'),(441,'Hendon','Greater London','England'),(442,'Hornsey','Greater London','England'),(443,'Ilford','Greater London','England'),(444,'Kingston upon Thames','Greater London','England'),(445,'Leyton','Greater London','England'),(446,'Mitcham','Greater London','England'),(447,'Richmond','Greater London','England'),(448,'Southall','Greater London','England'),(449,'Southgate','Greater London','England'),(450,'St Mary Cray','Greater London','England'),(451,'Surbiton','Greater London','England'),(452,'Tottenham','Greater London','England'),(453,'Twickenham','Greater London','England'),(454,'Uxbridge','Greater London','England'),(455,'Walthamstow','Greater London','England'),(456,'Wembley','Greater London','England'),(457,'West Ham','Greater London','England'),(458,'Willesden','Greater London','England'),(459,'Wimbledon','Greater London','England'),(460,'Wood Green','Greater London','England'),(461,'Altrincham','Greater Manchester','England'),(462,'Ashton in Makerfield','Greater Manchester','England'),(463,'Ashton under Lyne','Greater Manchester','England'),(464,'Atherton','Greater Manchester','England'),(465,'Audenshaw','Greater Manchester','England'),(466,'Blackrod','Greater Manchester','England'),(467,'Bolton','Greater Manchester','England'),(468,'Bury','Greater Manchester','England'),(469,'Cadishead','Greater Manchester','England'),(470,'Chadderton','Greater Manchester','England'),(471,'Cheadle','Greater Manchester','England'),(472,'Cheadle Hulme','Greater Manchester','England'),(473,'Denton','Greater Manchester','England'),(474,'Droylsden','Greater Manchester','England'),(475,'Dukinfield','Greater Manchester','England'),(476,'Eccles','Greater Manchester','England'),(477,'Failsworth','Greater Manchester','England'),(478,'Farnworth','Greater Manchester','England'),(479,'Golbourne','Greater Manchester','England'),(480,'Heywood','Greater Manchester','England'),(481,'Hindley','Greater Manchester','England'),(482,'Horwich','Greater Manchester','England'),(483,'Hyde','Greater Manchester','England'),(484,'Ince in Makerfield','Greater Manchester','England'),(485,'Irlam','Greater Manchester','England'),(486,'Kearsley','Greater Manchester','England'),(487,'Leigh','Greater Manchester','England'),(488,'Littleborough','Greater Manchester','England'),(489,'Manchester','Greater Manchester','England'),(490,'Middleton','Greater Manchester','England'),(491,'Milnrow','Greater Manchester','England'),(492,'Mossley','Greater Manchester','England'),(493,'Oldham','Greater Manchester','England'),(494,'Partington','Greater Manchester','England'),(495,'Pendlebury','Greater Manchester','England'),(496,'Prestwich','Greater Manchester','England'),(497,'Radcliffe','Greater Manchester','England'),(498,'Ramsbottom','Greater Manchester','England'),(499,'Rochdale','Greater Manchester','England'),(500,'Royton','Greater Manchester','England'),(501,'Sale','Greater Manchester','England'),(502,'Salford','Greater Manchester','England'),(503,'Shaw and Crompton','Greater Manchester','England'),(504,'Stalybridge','Greater Manchester','England'),(505,'Stockport','Greater Manchester','England'),(506,'Stretford','Greater Manchester','England'),(507,'Swinton','Greater Manchester','England'),(508,'Tottington','Greater Manchester','England'),(509,'Tyldsley','Greater Manchester','England'),(510,'Walkden','Greater Manchester','England'),(511,'Westhoughton','Greater Manchester','England'),(512,'Whitefield','Greater Manchester','England'),(513,'Wigan','Greater Manchester','England'),(514,'Worsley','Greater Manchester','England'),(515,'Aldershot','Hampshire','England'),(516,'Alton','Hampshire','England'),(517,'Andover','Hampshire','England'),(518,'Basingstoke','Hampshire','England'),(519,'Bishop\'s Waltham','Hampshire','England'),(520,'Blackwater and Hawley','Hampshire','England'),(521,'Bordon','Hampshire','England'),(522,'Eastleigh','Hampshire','England'),(523,'Emsworth','Hampshire','England'),(524,'Fareham','Hampshire','England'),(525,'Farnborough','Hampshire','England'),(526,'Fleet','Hampshire','England'),(527,'Fordingbridge','Hampshire','England'),(528,'Gosport','Hampshire','England'),(529,'Havant','Hampshire','England'),(530,'Hedge End','Hampshire','England'),(531,'Hythe','Hampshire','England'),(532,'Lee on the Solent','Hampshire','England'),(533,'Lymington','Hampshire','England'),(534,'Lyndhurst','Hampshire','England'),(535,'New Alresford','Hampshire','England'),(536,'New Milton','Hampshire','England'),(537,'North Camp','Hampshire','England'),(538,'Petersfield','Hampshire','England'),(539,'Portchester','Hampshire','England'),(540,'Portsmouth','Hampshire','England'),(541,'Ringwood','Hampshire','England'),(542,'Romsey','Hampshire','England'),(543,'Southampton','Hampshire','England'),(544,'Southsea','Hampshire','England'),(545,'Southwick','Hampshire','England'),(546,'Tadley','Hampshire','England'),(547,'Totton','Hampshire','England'),(548,'Waterlooville','Hampshire','England'),(549,'Whitchurch','Hampshire','England'),(550,'Whitehill','Hampshire','England'),(551,'Wickham','Hampshire','England'),(552,'Winchester','Hampshire','England'),(553,'Yateley','Hampshire','England'),(554,'Bromyard','Herefordshire','England'),(555,'Hatfield','Herefordshire','England'),(556,'Hereford','Herefordshire','England'),(557,'Kington','Herefordshire','England'),(558,'Ledbury','Herefordshire','England'),(559,'Leominster','Herefordshire','England'),(560,'Longtown','Herefordshire','England'),(561,'Ross on Wye','Herefordshire','England'),(562,'Baldock','Hertfordshire','England'),(563,'Barnet','Hertfordshire','England'),(564,'Berkhamsted','Hertfordshire','England'),(565,'Bishop\'s Stortford','Hertfordshire','England'),(566,'Borehamwood','Hertfordshire','England'),(567,'Broxbourne','Hertfordshire','England'),(568,'Buntingford','Hertfordshire','England'),(569,'Bushey','Hertfordshire','England'),(570,'Cheshunt','Hertfordshire','England'),(571,'Chorleywood','Hertfordshire','England'),(572,'Elstree','Hertfordshire','England'),(573,'Harpenden','Hertfordshire','England'),(574,'Hatfield','Hertfordshire','England'),(575,'Hemel Hempstead','Hertfordshire','England'),(576,'Hertford','Hertfordshire','England'),(577,'Hitchin','Hertfordshire','England'),(578,'Hoddesdon','Hertfordshire','England'),(579,'Letchworth','Hertfordshire','England'),(580,'Potters Bar','Hertfordshire','England'),(581,'Rickmansworth','Hertfordshire','England'),(582,'Royston','Hertfordshire','England'),(583,'Sawbridgeworth','Hertfordshire','England'),(584,'Stevenage','Hertfordshire','England'),(585,'Tring','Hertfordshire','England'),(586,'Waltham Cross','Hertfordshire','England'),(587,'Ware','Hertfordshire','England'),(588,'Watford','Hertfordshire','England'),(589,'Welwyn Garden City','Hertfordshire','England'),(590,'Appley','Isle of Wight','England'),(591,'Brading','Isle of Wight','England'),(592,'Cowes','Isle of Wight','England'),(593,'East Cowes','Isle of Wight','England'),(594,'Newport','Isle of Wight','England'),(595,'Ryde','Isle of Wight','England'),(596,'Sandown','Isle of Wight','England'),(597,'Shanklin','Isle of Wight','England'),(598,'Ventnor','Isle of Wight','England'),(599,'Yarmouth','Isle of Wight','England'),(600,'Ashford','Kent','England'),(601,'Broadstairs','Kent','England'),(602,'Canterbury','Kent','England'),(603,'Chatham','Kent','England'),(604,'Cranbrook','Kent','England'),(605,'Crayford','Kent','England'),(606,'Dartford','Kent','England'),(607,'Deal','Kent','England'),(608,'Dover','Kent','England'),(609,'Edenbridge','Kent','England'),(610,'Faversham','Kent','England'),(611,'Folkestone','Kent','England'),(612,'Fordwich','Kent','England'),(613,'Gillingham','Kent','England'),(614,'Gravesend','Kent','England'),(615,'Greenhill','Kent','England'),(616,'Herne Bay','Kent','England'),(617,'Hythe','Kent','England'),(618,'Lydd','Kent','England'),(619,'Maidstone','Kent','England'),(620,'Margate','Kent','England'),(621,'Minster','Kent','England'),(622,'New Romney','Kent','England'),(623,'Northfleet','Kent','England'),(624,'Orpington','Kent','England'),(625,'Paddock Wood','Kent','England'),(626,'Queenborough','Kent','England'),(627,'Rainham','Kent','England'),(628,'Ramsgate','Kent','England'),(629,'Rochester','Kent','England'),(630,'Royal Tunbridge Wells','Kent','England'),(631,'Sandwich','Kent','England'),(632,'Sevenoaks','Kent','England'),(633,'Sheerness','Kent','England'),(634,'Sittingbourne','Kent','England'),(635,'Snodland','Kent','England'),(636,'Southborough','Kent','England'),(637,'Strood','Kent','England'),(638,'Swanley','Kent','England'),(639,'Swanscombe and Greenhithe','Kent','England'),(640,'Tenterden','Kent','England'),(641,'Tonbridge','Kent','England'),(642,'Tunbridge Wells','Kent','England'),(643,'West Malling','Kent','England'),(644,'Westerham','Kent','England'),(645,'Westgate on Sea','Kent','England'),(646,'Whitstable','Kent','England'),(647,'Accrington','Lancashire','England'),(648,'Adlington','Lancashire','England'),(649,'Bacup','Lancashire','England'),(650,'Barnoldswick','Lancashire','England'),(651,'Blackburn','Lancashire','England'),(652,'Blackpool','Lancashire','England'),(653,'Brierfield','Lancashire','England'),(654,'Burnley','Lancashire','England'),(655,'Carnforth','Lancashire','England'),(656,'Chorley','Lancashire','England'),(657,'Clayton le Moors','Lancashire','England'),(658,'Cleveleys','Lancashire','England'),(659,'Clitheroe','Lancashire','England'),(660,'Colne','Lancashire','England'),(661,'Darwen','Lancashire','England'),(662,'Failsworth','Lancashire','England'),(663,'Fleetwood','Lancashire','England'),(664,'Garstang','Lancashire','England'),(665,'Great Harwood','Lancashire','England'),(666,'Haslingden','Lancashire','England'),(667,'Kirkham','Lancashire','England'),(668,'Lancaster','Lancashire','England'),(669,'Leyland','Lancashire','England'),(670,'Longridge','Lancashire','England'),(671,'Lytham St Annes','Lancashire','England'),(672,'Medlar with Wesham','Lancashire','England'),(673,'Morecambe','Lancashire','England'),(674,'Nelson','Lancashire','England'),(675,'Ormskirk','Lancashire','England'),(676,'Oswaldtwistle','Lancashire','England'),(677,'Padiham','Lancashire','England'),(678,'Penwortham','Lancashire','England'),(679,'Poulton le Fylde','Lancashire','England'),(680,'Preesall','Lancashire','England'),(681,'Preston','Lancashire','England'),(682,'Rawtenstall','Lancashire','England'),(683,'Skelmersdale','Lancashire','England'),(684,'Thornton','Lancashire','England'),(685,'Thornton Cleveleys','Lancashire','England'),(686,'Wesham','Lancashire','England'),(687,'Whitworth','Lancashire','England'),(688,'Ashby de la Zouch','Leicestershire','England'),(689,'Ashby Woulds','Leicestershire','England'),(690,'Braunstone Town','Leicestershire','England'),(691,'Coalville','Leicestershire','England'),(692,'Earl Shilton','Leicestershire','England'),(693,'Hinckley','Leicestershire','England'),(694,'Leicester','Leicestershire','England'),(695,'Loughborough','Leicestershire','England'),(696,'Lutterworth','Leicestershire','England'),(697,'Market Bosworth','Leicestershire','England'),(698,'Market Harborough','Leicestershire','England'),(699,'Melton Mowbray','Leicestershire','England'),(700,'Oadby','Leicestershire','England'),(701,'Shepshed','Leicestershire','England'),(702,'Syston','Leicestershire','England'),(703,'Wigston Magna','Leicestershire','England'),(704,'Alford','Lincolnshire','England'),(705,'Barton upon Humber','Lincolnshire','England'),(706,'Boston','Lincolnshire','England'),(707,'Bottesford','Lincolnshire','England'),(708,'Bourne','Lincolnshire','England'),(709,'Brigg','Lincolnshire','England'),(710,'Broughton','Lincolnshire','England'),(711,'Burgh le Marsh','Lincolnshire','England'),(712,'Caistor','Lincolnshire','England'),(713,'Cleethorpes','Lincolnshire','England'),(714,'Coningsby','Lincolnshire','England'),(715,'Crowland','Lincolnshire','England'),(716,'Crowle','Lincolnshire','England'),(717,'Epworth','Lincolnshire','England'),(718,'Gainsborough','Lincolnshire','England'),(719,'Grantham','Lincolnshire','England'),(720,'Grimsby','Lincolnshire','England'),(721,'Holbeach','Lincolnshire','England'),(722,'Horncastle','Lincolnshire','England'),(723,'Immingham','Lincolnshire','England'),(724,'Kirton in Lindsey','Lincolnshire','England'),(725,'Lincoln','Lincolnshire','England'),(726,'Little Coates','Lincolnshire','England'),(727,'Long Sutton','Lincolnshire','England'),(728,'Louth','Lincolnshire','England'),(729,'Mablethorpe','Lincolnshire','England'),(730,'Mablethorpe and Sutton','Lincolnshire','England'),(731,'Market Deeping','Lincolnshire','England'),(732,'Market Rasen','Lincolnshire','England'),(733,'North Hykeham','Lincolnshire','England'),(734,'Scunthorpe','Lincolnshire','England'),(735,'Skegness','Lincolnshire','England'),(736,'Sleaford','Lincolnshire','England'),(737,'Spalding','Lincolnshire','England'),(738,'Spilsby','Lincolnshire','England'),(739,'Stamford','Lincolnshire','England'),(740,'The Deepings','Lincolnshire','England'),(741,'Wainfleet','Lincolnshire','England'),(742,'Winterton','Lincolnshire','England'),(743,'Wragby','Lincolnshire','England'),(744,'Bebington','Merseyside','England'),(745,'Birkenhead','Merseyside','England'),(746,'Bootle','Merseyside','England'),(747,'Bromborough','Merseyside','England'),(748,'Crosby','Merseyside','England'),(749,'Earlestown','Merseyside','England'),(750,'Formby','Merseyside','England'),(751,'Halewood','Merseyside','England'),(752,'Heswall','Merseyside','England'),(753,'Hoylake','Merseyside','England'),(754,'Huyton','Merseyside','England'),(755,'Kirkby','Merseyside','England'),(756,'Liverpool','Merseyside','England'),(757,'Maghull','Merseyside','England'),(758,'Newton le Willows','Merseyside','England'),(759,'Prescot','Merseyside','England'),(760,'Rainford','Merseyside','England'),(761,'Rainhill','Merseyside','England'),(762,'Southport','Merseyside','England'),(763,'St Helens','Merseyside','England'),(764,'Wallasey','Merseyside','England'),(765,'Whiston','Merseyside','England'),(766,'Acle','Norfolk','England'),(767,'Attleborough','Norfolk','England'),(768,'Aylsham','Norfolk','England'),(769,'Caister on Sea','Norfolk','England'),(770,'Cromer','Norfolk','England'),(771,'Dereham','Norfolk','England'),(772,'Diss','Norfolk','England'),(773,'Downham Market','Norfolk','England'),(774,'Fakenham','Norfolk','England'),(775,'Gorleston','Norfolk','England'),(776,'Great Yarmouth','Norfolk','England'),(777,'Hingham','Norfolk','England'),(778,'Holt','Norfolk','England'),(779,'Hunstanton','Norfolk','England'),(780,'King\'s Lynn','Norfolk','England'),(781,'Loddon','Norfolk','England'),(782,'North Walsham','Norfolk','England'),(783,'Norwich','Norfolk','England'),(784,'Rackheath','Norfolk','England'),(785,'Redenhall with Harleston','Norfolk','England'),(786,'Reepham','Norfolk','England'),(787,'Sheringham','Norfolk','England'),(788,'Stalham','Norfolk','England'),(789,'Swaffham','Norfolk','England'),(790,'Thetford','Norfolk','England'),(791,'Thorpe St Andrew','Norfolk','England'),(792,'Watton','Norfolk','England'),(793,'Wells next the Sea','Norfolk','England'),(794,'Wroxham','Norfolk','England'),(795,'Wymondham','Norfolk','England'),(796,'Bedale','North Yorkshire','England'),(797,'Bentham','North Yorkshire','England'),(798,'Boroughbridge','North Yorkshire','England'),(799,'Colburn','North Yorkshire','England'),(800,'Easingwold','North Yorkshire','England'),(801,'Eston','North Yorkshire','England'),(802,'Filey','North Yorkshire','England'),(803,'Grangetown','North Yorkshire','England'),(804,'Grassington','North Yorkshire','England'),(805,'Guisborough','North Yorkshire','England'),(806,'Harrogate','North Yorkshire','England'),(807,'Hawes','North Yorkshire','England'),(808,'Haxby','North Yorkshire','England'),(809,'Helmsley','North Yorkshire','England'),(810,'Ingleby Barwick','North Yorkshire','England'),(811,'Kirkbymoorside','North Yorkshire','England'),(812,'Knaresborough','North Yorkshire','England'),(813,'Leyburn','North Yorkshire','England'),(814,'Loftus','North Yorkshire','England'),(815,'Malton','North Yorkshire','England'),(816,'Masham','North Yorkshire','England'),(817,'Middleham','North Yorkshire','England'),(818,'Middlesbrough','North Yorkshire','England'),(819,'Northallerton','North Yorkshire','England'),(820,'Norton on Derwent','North Yorkshire','England'),(821,'Pateley Bridge','North Yorkshire','England'),(822,'Pickering','North Yorkshire','England'),(823,'Redcar','North Yorkshire','England'),(824,'Richmond','North Yorkshire','England'),(825,'Ripon','North Yorkshire','England'),(826,'Robin Hood\'s Bay','North Yorkshire','England'),(827,'Saltburn by the Sea','North Yorkshire','England'),(828,'Scarborough','North Yorkshire','England'),(829,'Selby','North Yorkshire','England'),(830,'Settle','North Yorkshire','England'),(831,'Sherburn in Elmet','North Yorkshire','England'),(832,'Skelton in Cleveland','North Yorkshire','England'),(833,'Skipton','North Yorkshire','England'),(834,'Stockton on Tees','North Yorkshire','England'),(835,'Stokesley','North Yorkshire','England'),(836,'Tadcaster','North Yorkshire','England'),(837,'Thirsk','North Yorkshire','England'),(838,'Thornaby on Tees','North Yorkshire','England'),(839,'Whitby','North Yorkshire','England'),(840,'Yarm','North Yorkshire','England'),(841,'York','North Yorkshire','England'),(842,'Brackley','Northamptonshire','England'),(843,'Burton Latimer','Northamptonshire','England'),(844,'Corby','Northamptonshire','England'),(845,'Daventry','Northamptonshire','England'),(846,'Desborough','Northamptonshire','England'),(847,'Higham Ferrers','Northamptonshire','England'),(848,'Irthlingborough','Northamptonshire','England'),(849,'Kettering','Northamptonshire','England'),(850,'Northampton','Northamptonshire','England'),(851,'Oundle','Northamptonshire','England'),(852,'Raunds','Northamptonshire','England'),(853,'Rothwell','Northamptonshire','England'),(854,'Rushden','Northamptonshire','England'),(855,'Thrapston','Northamptonshire','England'),(856,'Towcester','Northamptonshire','England'),(857,'Wellingborough','Northamptonshire','England'),(858,'Alnwick','Northumberland','England'),(859,'Amble','Northumberland','England'),(860,'Ashington','Northumberland','England'),(861,'Bedlington','Northumberland','England'),(862,'Berwick upon Tweed','Northumberland','England'),(863,'Blyth','Northumberland','England'),(864,'Corbridge','Northumberland','England'),(865,'Cramlington','Northumberland','England'),(866,'Haltwhistle','Northumberland','England'),(867,'Hexham','Northumberland','England'),(868,'Morpeth','Northumberland','England'),(869,'Newbiggin by the Sea','Northumberland','England'),(870,'Ponteland','Northumberland','England'),(871,'Prudhoe','Northumberland','England'),(872,'Rothbury','Northumberland','England'),(873,'West Bedlington','Northumberland','England'),(874,'Wooler','Northumberland','England'),(875,'Arnold','Nottinghamshire','England'),(876,'Beeston','Nottinghamshire','England'),(877,'Bingham','Nottinghamshire','England'),(878,'Bracebridge','Nottinghamshire','England'),(879,'Bulwell','Nottinghamshire','England'),(880,'Carlton','Nottinghamshire','England'),(881,'Cotgrave','Nottinghamshire','England'),(882,'East Retford','Nottinghamshire','England'),(883,'Eastwood','Nottinghamshire','England'),(884,'Harworth and Bircotes','Nottinghamshire','England'),(885,'Hucknall','Nottinghamshire','England'),(886,'Kilton','Nottinghamshire','England'),(887,'Kimberley','Nottinghamshire','England'),(888,'Kirkby in Ashfield','Nottinghamshire','England'),(889,'Mansfield','Nottinghamshire','England'),(890,'Netherfield','Nottinghamshire','England'),(891,'Newark on Trent','Nottinghamshire','England'),(892,'Nottingham','Nottinghamshire','England'),(893,'Ollerton','Nottinghamshire','England'),(894,'Ollerton and Boughton','Nottinghamshire','England'),(895,'Retford','Nottinghamshire','England'),(896,'Southwell','Nottinghamshire','England'),(897,'Stapleford','Nottinghamshire','England'),(898,'Sutton in Ashfield','Nottinghamshire','England'),(899,'Warsop','Nottinghamshire','England'),(900,'West Bridgefield','Nottinghamshire','England'),(901,'Worksop','Nottinghamshire','England'),(902,'Abingdon','Oxfordshire','England'),(903,'Banbury','Oxfordshire','England'),(904,'Bicester','Oxfordshire','England'),(905,'Burford','Oxfordshire','England'),(906,'Carterton','Oxfordshire','England'),(907,'Charlbury','Oxfordshire','England'),(908,'Chipping Norton','Oxfordshire','England'),(909,'Didcot','Oxfordshire','England'),(910,'Dorchester','Oxfordshire','England'),(911,'Faringdon','Oxfordshire','England'),(912,'Henley on Thames','Oxfordshire','England'),(913,'Neithrop','Oxfordshire','England'),(914,'Oxford','Oxfordshire','England'),(915,'Ruscote','Oxfordshire','England'),(916,'Thame','Oxfordshire','England'),(917,'Wallingford','Oxfordshire','England'),(918,'Wantage','Oxfordshire','England'),(919,'Watlington','Oxfordshire','England'),(920,'Weston Otmoor','Oxfordshire','England'),(921,'Witney','Oxfordshire','England'),(922,'Woodstock','Oxfordshire','England'),(923,'Oakham','Rutland','England'),(924,'Uppingham','Rutland','England'),(925,'Bishop\'s Castle','Shropshire','England'),(926,'Bridgnorth','Shropshire','England'),(927,'Broseley','Shropshire','England'),(928,'Church Stretton','Shropshire','England'),(929,'Cleobury Mortimer','Shropshire','England'),(930,'Clun','Shropshire','England'),(931,'Craven Arms','Shropshire','England'),(932,'Dawley','Shropshire','England'),(933,'Ellesmere','Shropshire','England'),(934,'Ludlow','Shropshire','England'),(935,'Madeley','Shropshire','England'),(936,'Market Drayton','Shropshire','England'),(937,'Much Wenlock','Shropshire','England'),(938,'Newport','Shropshire','England'),(939,'Oakengates','Shropshire','England'),(940,'Oswestry','Shropshire','England'),(941,'Shifnal','Shropshire','England'),(942,'Shrewsbury','Shropshire','England'),(943,'Telford','Shropshire','England'),(944,'Wellington','Shropshire','England'),(945,'Wem','Shropshire','England'),(946,'Whitchurch','Shropshire','England'),(947,'Axbridge','Somerset','England'),(948,'Bath','Somerset','England'),(949,'Bridgwater','Somerset','England'),(950,'Bruton','Somerset','England'),(951,'Burnham on Sea','Somerset','England'),(952,'Castle Cary','Somerset','England'),(953,'Chard','Somerset','England'),(954,'Clevedon','Somerset','England'),(955,'Crewkerne','Somerset','England'),(956,'Dulverton','Somerset','England'),(957,'Frome','Somerset','England'),(958,'Glastonbury','Somerset','England'),(959,'Highbridge','Somerset','England'),(960,'Ilminster','Somerset','England'),(961,'Keynsham','Somerset','England'),(962,'Langport','Somerset','England'),(963,'Midsomer Norton','Somerset','England'),(964,'Minehead','Somerset','England'),(965,'Nailsea','Somerset','England'),(966,'North Petherton','Somerset','England'),(967,'Norton Radstock','Somerset','England'),(968,'Portishead','Somerset','England'),(969,'Portishead and North Weston','Somerset','England'),(970,'Radstock','Somerset','England'),(971,'Shepton Mallet','Somerset','England'),(972,'Somerton','Somerset','England'),(973,'South Petherton','Somerset','England'),(974,'Street','Somerset','England'),(975,'Taunton','Somerset','England'),(976,'Watchet','Somerset','England'),(977,'Wellington','Somerset','England'),(978,'Wells','Somerset','England'),(979,'Weston super Mare','Somerset','England'),(980,'Wincanton','Somerset','England'),(981,'Winsford','Somerset','England'),(982,'Wiveliscombe','Somerset','England'),(983,'Yeovil','Somerset','England'),(984,'Anston','South Yorkshire','England'),(985,'Askern','South Yorkshire','England'),(986,'Barnsley','South Yorkshire','England'),(987,'Bawtry','South Yorkshire','England'),(988,'Brierley','South Yorkshire','England'),(989,'Conisbrough','South Yorkshire','England'),(990,'Dinnington','South Yorkshire','England'),(991,'Doncaster','South Yorkshire','England'),(992,'Edlington','South Yorkshire','England'),(993,'Hatfield','South Yorkshire','England'),(994,'Hoyland','South Yorkshire','England'),(995,'Maltby','South Yorkshire','England'),(996,'Mexborough','South Yorkshire','England'),(997,'Penistone','South Yorkshire','England'),(998,'Rotherham','South Yorkshire','England'),(999,'Sheffield','South Yorkshire','England'),(1000,'Stainforth','South Yorkshire','England'),(1001,'Stocksbridge','South Yorkshire','England'),(1002,'Swinton','South Yorkshire','England'),(1003,'Thorne','South Yorkshire','England'),(1004,'Tickhill','South Yorkshire','England'),(1005,'Wath upon Dearne','South Yorkshire','England'),(1006,'Wombwell','South Yorkshire','England'),(1007,'Alton','Staffordshire','England'),(1008,'Biddulph','Staffordshire','England'),(1009,'Burntwood','Staffordshire','England'),(1010,'Burslem','Staffordshire','England'),(1011,'Burton upon Trent','Staffordshire','England'),(1012,'Cannock','Staffordshire','England'),(1013,'Cheadle','Staffordshire','England'),(1014,'Eccleshall','Staffordshire','England'),(1015,'Fazeley','Staffordshire','England'),(1016,'Fenton','Staffordshire','England'),(1017,'Hednesford','Staffordshire','England'),(1018,'Kidsgrove','Staffordshire','England'),(1019,'Leek','Staffordshire','England'),(1020,'Lichfield','Staffordshire','England'),(1021,'Longton','Staffordshire','England'),(1022,'Newcastle under Lyme','Staffordshire','England'),(1023,'Penkridge','Staffordshire','England'),(1024,'Perry Crofts','Staffordshire','England'),(1025,'Rugeley','Staffordshire','England'),(1026,'Stafford','Staffordshire','England'),(1027,'Stoke on Trent','Staffordshire','England'),(1028,'Stone','Staffordshire','England'),(1029,'Tamworth','Staffordshire','England'),(1030,'Tunstall','Staffordshire','England'),(1031,'Uttoxeter','Staffordshire','England'),(1032,'Aldeburgh','Suffolk','England'),(1033,'Beccles','Suffolk','England'),(1034,'Brandon','Suffolk','England'),(1035,'Bungay','Suffolk','England'),(1036,'Bury St Edmunds','Suffolk','England'),(1037,'Carlton Colville','Suffolk','England'),(1038,'Clare','Suffolk','England'),(1039,'Dommoc','Suffolk','England'),(1040,'Dunwich','Suffolk','England'),(1041,'Eye','Suffolk','England'),(1042,'Felixstowe','Suffolk','England'),(1043,'Framlingham','Suffolk','England'),(1044,'Hadleigh','Suffolk','England'),(1045,'Halesworth','Suffolk','England'),(1046,'Haverhill','Suffolk','England'),(1047,'Ipswich','Suffolk','England'),(1048,'Kesgrave','Suffolk','England'),(1049,'Leiston','Suffolk','England'),(1050,'Lowestoft','Suffolk','England'),(1051,'Mildenhall','Suffolk','England'),(1052,'Needham Market','Suffolk','England'),(1053,'Newmarket','Suffolk','England'),(1054,'Orford','Suffolk','England'),(1055,'Otley','Suffolk','England'),(1056,'Saxmundham','Suffolk','England'),(1057,'Southwold','Suffolk','England'),(1058,'Stowmarket','Suffolk','England'),(1059,'Sudbury','Suffolk','England'),(1060,'Woodbridge','Suffolk','England'),(1061,'Ashford','Surrey','England'),(1062,'Beltchingley','Surrey','England'),(1063,'Camberley','Surrey','England'),(1064,'Chertsey','Surrey','England'),(1065,'Croydon','Surrey','England'),(1066,'Dorking','Surrey','England'),(1067,'Egham','Surrey','England'),(1068,'Epsom','Surrey','England'),(1069,'Esher','Surrey','England'),(1070,'Farnham','Surrey','England'),(1071,'Godalming','Surrey','England'),(1072,'Gomshall','Surrey','England'),(1073,'Gratton','Surrey','England'),(1074,'Great Brookham','Surrey','England'),(1075,'Guildford','Surrey','England'),(1076,'Haslemere','Surrey','England'),(1077,'Horley','Surrey','England'),(1078,'Kingston upon Thames','Surrey','England'),(1079,'Leatherhead','Surrey','England'),(1080,'Redhill','Surrey','England'),(1081,'Reigate','Surrey','England'),(1082,'Southwark','Surrey','England'),(1083,'Staines upon Thames','Surrey','England'),(1084,'Walton on Thames','Surrey','England'),(1085,'Weybridge','Surrey','England'),(1086,'Woking','Surrey','England'),(1087,'Birtley','Tyne and Wear','England'),(1088,'Blaydon on tyne','Tyne and Wear','England'),(1089,'Cullercoats','Tyne and Wear','England'),(1090,'Darsley Park','Tyne and Wear','England'),(1091,'Dunston','Tyne and Wear','England'),(1092,'Gateshead','Tyne and Wear','England'),(1093,'Hetton','Tyne and Wear','England'),(1094,'Houghton le Spring','Tyne and Wear','England'),(1095,'Howdon','Tyne and Wear','England'),(1096,'Jarrow','Tyne and Wear','England'),(1097,'Killingworth','Tyne and Wear','England'),(1098,'Little Benton','Tyne and Wear','England'),(1099,'Longbenton','Tyne and Wear','England'),(1100,'Low Fell','Tyne and Wear','England'),(1101,'Newcastle upon Tyne','Tyne and Wear','England'),(1102,'North Shields','Tyne and Wear','England'),(1103,'Ryton','Tyne and Wear','England'),(1104,'Sheriff Hill','Tyne and Wear','England'),(1105,'South Shields','Tyne and Wear','England'),(1106,'Sunderland','Tyne and Wear','England'),(1107,'Tynemouth','Tyne and Wear','England'),(1108,'Wallsend','Tyne and Wear','England'),(1109,'Washington','Tyne and Wear','England'),(1110,'Whitley Bay','Tyne and Wear','England'),(1111,'Willington Quay','Tyne and Wear','England'),(1112,'Windy Nook','Tyne and Wear','England'),(1113,'Alcester','Warwickshire','England'),(1114,'Atherstone','Warwickshire','England'),(1115,'Bedworth','Warwickshire','England'),(1116,'Coleshill','Warwickshire','England'),(1117,'Henley in Arden','Warwickshire','England'),(1118,'Kenilworth','Warwickshire','England'),(1119,'Middle Quinton','Warwickshire','England'),(1120,'Nuneaton','Warwickshire','England'),(1121,'Royal Leamington Spa','Warwickshire','England'),(1122,'Rugby','Warwickshire','England'),(1123,'Shipston on Stour','Warwickshire','England'),(1124,'Southam','Warwickshire','England'),(1125,'Stratford upon Avon','Warwickshire','England'),(1126,'Warwick','Warwickshire','England'),(1127,'Whitnash','Warwickshire','England'),(1128,'Aldridge','West Midlands','England'),(1129,'Bilston','West Midlands','England'),(1130,'Birmingham','West Midlands','England'),(1131,'Blackheath','West Midlands','England'),(1132,'Bloxwich','West Midlands','England'),(1133,'Brierley Hill','West Midlands','England'),(1134,'Brownhills','West Midlands','England'),(1135,'Coal Pool','West Midlands','England'),(1136,'Coseley','West Midlands','England'),(1137,'Coventry','West Midlands','England'),(1138,'Cradley Heath','West Midlands','England'),(1139,'Darlaston','West Midlands','England'),(1140,'Dudley','West Midlands','England'),(1141,'Fordbridge','West Midlands','England'),(1142,'Gornal','West Midlands','England'),(1143,'Halesowen','West Midlands','England'),(1144,'Lye','West Midlands','England'),(1145,'Moxley','West Midlands','England'),(1146,'Netherton','West Midlands','England'),(1147,'Oldbury','West Midlands','England'),(1148,'Pelsall','West Midlands','England'),(1149,'Rowley Regis','West Midlands','England'),(1150,'Sedgley','West Midlands','England'),(1151,'Smethwick','West Midlands','England'),(1152,'Solihull','West Midlands','England'),(1153,'Stourbridge','West Midlands','England'),(1154,'Sutton Coldfield','West Midlands','England'),(1155,'Tipton','West Midlands','England'),(1156,'Walsall','West Midlands','England'),(1157,'Wednesbury','West Midlands','England'),(1158,'Wednesfield','West Midlands','England'),(1159,'West Bromwich','West Midlands','England'),(1160,'Willenhall','West Midlands','England'),(1161,'Wolverhampton','West Midlands','England'),(1162,'Arundel','West Sussex','England'),(1163,'Bognor Regis','West Sussex','England'),(1164,'Burgess Hill','West Sussex','England'),(1165,'Chichester','West Sussex','England'),(1166,'Crawley','West Sussex','England'),(1167,'Cuckfield','West Sussex','England'),(1168,'East Grinstead','West Sussex','England'),(1169,'Haywards Heath','West Sussex','England'),(1170,'Horsham','West Sussex','England'),(1171,'Littlehampton','West Sussex','England'),(1172,'Midhurst','West Sussex','England'),(1173,'Petworth','West Sussex','England'),(1174,'Selsey','West Sussex','England'),(1175,'Shoreham by Sea','West Sussex','England'),(1176,'Southwick','West Sussex','England'),(1177,'Steyning','West Sussex','England'),(1178,'Worthing','West Sussex','England'),(1179,'Baildon','West Yorkshire','England'),(1180,'Batley','West Yorkshire','England'),(1181,'Bingley','West Yorkshire','England'),(1182,'Bradford','West Yorkshire','England'),(1183,'Brighouse','West Yorkshire','England'),(1184,'Castleford','West Yorkshire','England'),(1185,'Cleckheaton','West Yorkshire','England'),(1186,'Denholme','West Yorkshire','England'),(1187,'Dewsbury','West Yorkshire','England'),(1188,'Elland','West Yorkshire','England'),(1189,'Farsley','West Yorkshire','England'),(1190,'Featherstone','West Yorkshire','England'),(1191,'Garforth','West Yorkshire','England'),(1192,'Guiseley','West Yorkshire','England'),(1193,'Halifax','West Yorkshire','England'),(1194,'Hebden Bridge','West Yorkshire','England'),(1195,'Hebden Royd','West Yorkshire','England'),(1196,'Heckmondwike','West Yorkshire','England'),(1197,'Hemsworth','West Yorkshire','England'),(1198,'Holmfirth','West Yorkshire','England'),(1199,'Horsforth','West Yorkshire','England'),(1200,'Huddersfield','West Yorkshire','England'),(1201,'Ilkley','West Yorkshire','England'),(1202,'Keighley','West Yorkshire','England'),(1203,'Knottingley','West Yorkshire','England'),(1204,'Leeds','West Yorkshire','England'),(1205,'Meltham','West Yorkshire','England'),(1206,'Mirfield','West Yorkshire','England'),(1207,'Morley','West Yorkshire','England'),(1208,'Mytholmroyd','West Yorkshire','England'),(1209,'Normanton','West Yorkshire','England'),(1210,'Ossett','West Yorkshire','England'),(1211,'Otley','West Yorkshire','England'),(1212,'Pontefract','West Yorkshire','England'),(1213,'Pudsey','West Yorkshire','England'),(1214,'Rothwell','West Yorkshire','England'),(1215,'Shipley','West Yorkshire','England'),(1216,'Silsden','West Yorkshire','England'),(1217,'South Elmsall','West Yorkshire','England'),(1218,'South Kirkby and Moorthorpe','West Yorkshire','England'),(1219,'Sowerby Bridge','West Yorkshire','England'),(1220,'Todmorden','West Yorkshire','England'),(1221,'Wakefield','West Yorkshire','England'),(1222,'Wetherby','West Yorkshire','England'),(1223,'Yeadon','West Yorkshire','England'),(1224,'Amesbury','Wiltshire','England'),(1225,'Bradford on Avon','Wiltshire','England'),(1226,'Calne','Wiltshire','England'),(1227,'Chippenham','Wiltshire','England'),(1228,'Corsham','Wiltshire','England'),(1229,'Cricklade','Wiltshire','England'),(1230,'Devizes','Wiltshire','England'),(1231,'Highworth','Wiltshire','England'),(1232,'Ludgershall','Wiltshire','England'),(1233,'Malmesbury','Wiltshire','England'),(1234,'Marlborough','Wiltshire','England'),(1235,'Melksham','Wiltshire','England'),(1236,'Mere','Wiltshire','England'),(1237,'Royal Wootton Bassett','Wiltshire','England'),(1238,'Salisbury','Wiltshire','England'),(1239,'Swindon','Wiltshire','England'),(1240,'Tidworth','Wiltshire','England'),(1241,'Tisbury','Wiltshire','England'),(1242,'Trowbridge','Wiltshire','England'),(1243,'Warminster','Wiltshire','England'),(1244,'Westbury','Wiltshire','England'),(1245,'Wilton','Wiltshire','England'),(1246,'Bewdley','Worcestershire','England'),(1247,'Bromsgrove','Worcestershire','England'),(1248,'Droitwich Spa','Worcestershire','England'),(1249,'Evesham','Worcestershire','England'),(1250,'Great Malvern','Worcestershire','England'),(1251,'Kidderminster','Worcestershire','England'),(1252,'Malvern','Worcestershire','England'),(1253,'Pershore','Worcestershire','England'),(1254,'Redditch','Worcestershire','England'),(1255,'Stourport on Severn','Worcestershire','England'),(1256,'Tenbury Wells','Worcestershire','England'),(1257,'Upton upon Severn','Worcestershire','England'),(1258,'Worcester','Worcestershire','England'),(1259,'Antrim','County Antrim','Northern Ireland'),(1260,'Ballycastle','County Antrim','Northern Ireland'),(1261,'Ballyclare','County Antrim','Northern Ireland'),(1262,'Ballymena','County Antrim','Northern Ireland'),(1263,'Ballymoney','County Antrim','Northern Ireland'),(1264,'Bushmills','County Antrim','Northern Ireland'),(1265,'Carrickfergus','County Antrim','Northern Ireland'),(1266,'Crumlin','County Antrim','Northern Ireland'),(1267,'Greenisland','County Antrim','Northern Ireland'),(1268,'Larne','County Antrim','Northern Ireland'),(1269,'Lisburn','County Antrim','Northern Ireland'),(1270,'Merville Garden Village','County Antrim','Northern Ireland'),(1271,'Newtownabbey','County Antrim','Northern Ireland'),(1272,'Portrush','County Antrim','Northern Ireland'),(1273,'Randalstown','County Antrim','Northern Ireland'),(1274,'Armagh','County Armagh','Northern Ireland'),(1275,'Craigavon','County Armagh','Northern Ireland'),(1276,'Lurgan','County Armagh','Northern Ireland'),(1277,'Markethill','County Armagh','Northern Ireland'),(1278,'Newry','County Armagh','Northern Ireland'),(1279,'Portadown','County Armagh','Northern Ireland'),(1280,'Ballynahinch','County Down','Northern Ireland'),(1281,'Banbridge','County Down','Northern Ireland'),(1282,'Bangor','County Down','Northern Ireland'),(1283,'Carryduff','County Down','Northern Ireland'),(1284,'Castlewellan','County Down','Northern Ireland'),(1285,'Comber','County Down','Northern Ireland'),(1286,'Donaghadee','County Down','Northern Ireland'),(1287,'Doromore','County Down','Northern Ireland'),(1288,'Downpatrick','County Down','Northern Ireland'),(1289,'Dundonald','County Down','Northern Ireland'),(1290,'Holywood','County Down','Northern Ireland'),(1291,'Kilkeel','County Down','Northern Ireland'),(1292,'Killyleagh','County Down','Northern Ireland'),(1293,'Lisburn','County Down','Northern Ireland'),(1294,'Newcastle','County Down','Northern Ireland'),(1295,'Newtownards','County Down','Northern Ireland'),(1296,'Portaferry','County Down','Northern Ireland'),(1297,'Rostrevor','County Down','Northern Ireland'),(1298,'Saintfield','County Down','Northern Ireland'),(1299,'Warrenpoint','County Down','Northern Ireland'),(1300,'Enniskillen','County Fermanagh','Northern Ireland'),(1301,'Lisnaskea','County Fermanagh','Northern Ireland'),(1302,'Coleraine','County Londonderry','Northern Ireland'),(1303,'Derry','County Londonderry','Northern Ireland'),(1304,'Limavady','County Londonderry','Northern Ireland'),(1305,'Magherafelt','County Londonderry','Northern Ireland'),(1306,'Portstewart','County Londonderry','Northern Ireland'),(1307,'Castlederg','County Tyrone','Northern Ireland'),(1308,'Clogher','County Tyrone','Northern Ireland'),(1309,'Coalisland','County Tyrone','Northern Ireland'),(1310,'Cookstown','County Tyrone','Northern Ireland'),(1311,'Dungannon','County Tyrone','Northern Ireland'),(1312,'Fintona','County Tyrone','Northern Ireland'),(1313,'Fivemiletown','County Tyrone','Northern Ireland'),(1314,'Omagh','County Tyrone','Northern Ireland'),(1315,'Strabane','County Tyrone','Northern Ireland'),(1316,'Aberdeen','Aberdeenshire','Scotland'),(1317,'Alford','Aberdeenshire','Scotland'),(1318,'Ballater','Aberdeenshire','Scotland'),(1319,'Banchory','Aberdeenshire','Scotland'),(1320,'Banff','Aberdeenshire','Scotland'),(1321,'Banff and Macduff','Aberdeenshire','Scotland'),(1322,'Blackburn','Aberdeenshire','Scotland'),(1323,'Boddam','Aberdeenshire','Scotland'),(1324,'Clerkhill','Aberdeenshire','Scotland'),(1325,'Ellon','Aberdeenshire','Scotland'),(1326,'Fraserburgh','Aberdeenshire','Scotland'),(1327,'Huntly','Aberdeenshire','Scotland'),(1328,'Insch','Aberdeenshire','Scotland'),(1329,'Inverbervie','Aberdeenshire','Scotland'),(1330,'Inverurie','Aberdeenshire','Scotland'),(1331,'Kemnay','Aberdeenshire','Scotland'),(1332,'Kintore','Aberdeenshire','Scotland'),(1333,'Laurencekirk','Aberdeenshire','Scotland'),(1334,'Macduff','Aberdeenshire','Scotland'),(1335,'Maud','Aberdeenshire','Scotland'),(1336,'Oldmeldrum','Aberdeenshire','Scotland'),(1337,'Peterhead','Aberdeenshire','Scotland'),(1338,'Portlethen','Aberdeenshire','Scotland'),(1339,'Portsoy','Aberdeenshire','Scotland'),(1340,'Red Cloak','Aberdeenshire','Scotland'),(1341,'Rosehearty','Aberdeenshire','Scotland'),(1342,'Stonehaven','Aberdeenshire','Scotland'),(1343,'Turriff','Aberdeenshire','Scotland'),(1344,'Westhill','Aberdeenshire','Scotland'),(1345,'Arbroath','Angus','Scotland'),(1346,'Brechin','Angus','Scotland'),(1347,'Carnoustie','Angus','Scotland'),(1348,'Forfar','Angus','Scotland'),(1349,'Kirriemuir','Angus','Scotland'),(1350,'Monifieth','Angus','Scotland'),(1351,'Montrose','Angus','Scotland'),(1352,'Alloa','Clackmannanshire','Scotland'),(1353,'Alva','Clackmannanshire','Scotland'),(1354,'Clackmannan','Clackmannanshire','Scotland'),(1355,'Dollar','Clackmannanshire','Scotland'),(1356,'Menstrie','Clackmannanshire','Scotland'),(1357,'Tillicoultry','Clackmannanshire','Scotland'),(1358,'Tullibody','Clackmannanshire','Scotland'),(1359,'Annan','Dumfries and Galloway','Scotland'),(1360,'Castle Douglas','Dumfries and Galloway','Scotland'),(1361,'Dalbeattie','Dumfries and Galloway','Scotland'),(1362,'Dumfries','Dumfries and Galloway','Scotland'),(1363,'Gatehouse of Fleet','Dumfries and Galloway','Scotland'),(1364,'Gretna','Dumfries and Galloway','Scotland'),(1365,'Kelloholm','Dumfries and Galloway','Scotland'),(1366,'Kirkconnel','Dumfries and Galloway','Scotland'),(1367,'Kirkcudbright','Dumfries and Galloway','Scotland'),(1368,'Langholm','Dumfries and Galloway','Scotland'),(1369,'Lochmaben','Dumfries and Galloway','Scotland'),(1370,'Lockerbie','Dumfries and Galloway','Scotland'),(1371,'Moffat','Dumfries and Galloway','Scotland'),(1372,'Monreith','Dumfries and Galloway','Scotland'),(1373,'Newbridge Drive','Dumfries and Galloway','Scotland'),(1374,'Newton Stewart','Dumfries and Galloway','Scotland'),(1375,'Sanquhar','Dumfries and Galloway','Scotland'),(1376,'Stranraer','Dumfries and Galloway','Scotland'),(1377,'Thornhill','Dumfries and Galloway','Scotland'),(1378,'Wigtown','Dumfries and Galloway','Scotland'),(1379,'Dundee','Dundee','Scotland'),(1380,'Cockenzie and Port Seton','East Lothian','Scotland'),(1381,'Dunbar','East Lothian','Scotland'),(1382,'Haddington','East Lothian','Scotland'),(1383,'Musselburgh','East Lothian','Scotland'),(1384,'North Berwick','East Lothian','Scotland'),(1385,'Prestonpans','East Lothian','Scotland'),(1386,'Tranent','East Lothian','Scotland'),(1387,'Edinburgh?','Edinburgh?','Scotland'),(1388,'Airth','Falkirk','Scotland'),(1389,'Bo\'ness','Falkirk','Scotland'),(1390,'Bonnybridge','Falkirk','Scotland'),(1391,'Borrowstounness','Falkirk','Scotland'),(1392,'Carron','Falkirk','Scotland'),(1393,'Denny','Falkirk','Scotland'),(1394,'Duniplace','Falkirk','Scotland'),(1395,'Dunmore','Falkirk','Scotland'),(1396,'Falkirk','Falkirk','Scotland'),(1397,'Grahamston','Falkirk','Scotland'),(1398,'Grangemouth','Falkirk','Scotland'),(1399,'Larbert','Falkirk','Scotland'),(1400,'Stenhousemuir','Falkirk','Scotland'),(1401,'Anstruther','Fife','Scotland'),(1402,'Auchtermuchty','Fife','Scotland'),(1403,'Balcurvie','Fife','Scotland'),(1404,'Ballingry','Fife','Scotland'),(1405,'Benarty','Fife','Scotland'),(1406,'Buckhaven','Fife','Scotland'),(1407,'Burntisland','Fife','Scotland'),(1408,'Collydean','Fife','Scotland'),(1409,'Cowdenbeath','Fife','Scotland'),(1410,'Crail','Fife','Scotland'),(1411,'Cupar','Fife','Scotland'),(1412,'Dalgety Bay','Fife','Scotland'),(1413,'Dunfermline','Fife','Scotland'),(1414,'Dysart','Fife','Scotland'),(1415,'East Wemyss','Fife','Scotland'),(1416,'Falkland','Fife','Scotland'),(1417,'Glenrothes','Fife','Scotland'),(1418,'Inverkeithing','Fife','Scotland'),(1419,'Kelty','Fife','Scotland'),(1420,'Kincardine','Fife','Scotland'),(1421,'Kinghorn','Fife','Scotland'),(1422,'Kinglassie','Fife','Scotland'),(1423,'Kirkcaldy','Fife','Scotland'),(1424,'Ladybank','Fife','Scotland'),(1425,'Letham','Fife','Scotland'),(1426,'Leuchars','Fife','Scotland'),(1427,'Leven','Fife','Scotland'),(1428,'Levenmouth','Fife','Scotland'),(1429,'Lochgelly','Fife','Scotland'),(1430,'Markinch','Fife','Scotland'),(1431,'Methil','Fife','Scotland'),(1432,'Newburgh','Fife','Scotland'),(1433,'Newport on Tay','Fife','Scotland'),(1434,'North Queensferry','Fife','Scotland'),(1435,'Pitcoudie','Fife','Scotland'),(1436,'Pittenweem','Fife','Scotland'),(1437,'Rosyth','Fife','Scotland'),(1438,'St Andrews','Fife','Scotland'),(1439,'St Monans','Fife','Scotland'),(1440,'Tayport','Fife','Scotland'),(1441,'Woodhaven','Fife','Scotland'),(1442,'Wormit','Fife','Scotland'),(1443,'Alness','Highlands','Scotland'),(1444,'Aviemore','Highlands','Scotland'),(1445,'Brora','Highlands','Scotland'),(1446,'Cromarty','Highlands','Scotland'),(1447,'Dingwall','Highlands','Scotland'),(1448,'Dornoch','Highlands','Scotland'),(1449,'Fort William','Highlands','Scotland'),(1450,'Fortrose','Highlands','Scotland'),(1451,'Grantown on Spey','Highlands','Scotland'),(1452,'Invergordon','Highlands','Scotland'),(1453,'Inverlochy','Highlands','Scotland'),(1454,'Inverness','Highlands','Scotland'),(1455,'Kingussie','Highlands','Scotland'),(1456,'Mallaig','Highlands','Scotland'),(1457,'Nairn','Highlands','Scotland'),(1458,'Portree','Highlands','Scotland'),(1459,'Tain','Highlands','Scotland'),(1460,'Thurso','Highlands','Scotland'),(1461,'Ullapool','Highlands','Scotland'),(1462,'Wick','Highlands','Scotland'),(1463,'Bathgate','Lothian','Scotland'),(1464,'Dalkeith','Lothian','Scotland'),(1465,'Dunbar','Lothian','Scotland'),(1466,'Edinburgh','Lothian','Scotland'),(1467,'Haddington','Lothian','Scotland'),(1468,'Linlithgow','Lothian','Scotland'),(1469,'Loanhead','Lothian','Scotland'),(1470,'Musselburgh','Lothian','Scotland'),(1471,'North Berwick','Lothian','Scotland'),(1472,'Penicuik','Lothian','Scotland'),(1473,'Buckie','Moray','Scotland'),(1474,'Cullen','Moray','Scotland'),(1475,'Dufftown','Moray','Scotland'),(1476,'Elgin','Moray','Scotland'),(1477,'Forres','Moray','Scotland'),(1478,'Keith','Moray','Scotland'),(1479,'Lossiemouth','Moray','Scotland'),(1480,'Aberfeldy','Perth and Kinross','Scotland'),(1481,'Auchterarder','Perth and Kinross','Scotland'),(1482,'Birnam','Perth and Kinross','Scotland'),(1483,'Blackford','Perth and Kinross','Scotland'),(1484,'Blair Atholl','Perth and Kinross','Scotland'),(1485,'Blairgowrie and Rattray','Perth and Kinross','Scotland'),(1486,'Bridge of Earn','Perth and Kinross','Scotland'),(1487,'Bridge of Tilt','Perth and Kinross','Scotland'),(1488,'Comrie','Perth and Kinross','Scotland'),(1489,'Coupar Angus','Perth and Kinross','Scotland'),(1490,'Crieff','Perth and Kinross','Scotland'),(1491,'Kinross','Perth and Kinross','Scotland'),(1492,'Perth','Perth and Kinross','Scotland'),(1493,'Pitlochry','Perth and Kinross','Scotland'),(1494,'Scone','Perth and Kinross','Scotland'),(1495,'Coldstream','Scottish Borders','Scotland'),(1496,'Duns','Scottish Borders','Scotland'),(1497,'Earlston','Scottish Borders','Scotland'),(1498,'Eyemouth','Scottish Borders','Scotland'),(1499,'Galashiels','Scottish Borders','Scotland'),(1500,'Greenlaw','Scottish Borders','Scotland'),(1501,'Hawick','Scottish Borders','Scotland'),(1502,'Innerleithen','Scottish Borders','Scotland'),(1503,'Jedburgh','Scottish Borders','Scotland'),(1504,'Kelso','Scottish Borders','Scotland'),(1505,'Lauder','Scottish Borders','Scotland'),(1506,'Melrose','Scottish Borders','Scotland'),(1507,'Newtown St Boswells','Scottish Borders','Scotland'),(1508,'Peebles','Scottish Borders','Scotland'),(1509,'Selkirk','Scottish Borders','Scotland'),(1510,'Bridge of Allan','Stirlingshire','Scotland'),(1511,'Callander','Stirlingshire','Scotland'),(1512,'Doune','Stirlingshire','Scotland'),(1513,'Dunblane','Stirlingshire','Scotland'),(1514,'Stirling','Stirlingshire','Scotland'),(1515,'Airdrie','Strathclyde','Scotland'),(1516,'Ayr','Strathclyde','Scotland'),(1517,'Barrhead','Strathclyde','Scotland'),(1518,'Bearsden','Strathclyde','Scotland'),(1519,'Bellshill','Strathclyde','Scotland'),(1520,'Biggar','Strathclyde','Scotland'),(1521,'Campbeltown','Strathclyde','Scotland'),(1522,'Carluke','Strathclyde','Scotland'),(1523,'Clydebank','Strathclyde','Scotland'),(1524,'Coatbridge','Strathclyde','Scotland'),(1525,'Cumbernauld','Strathclyde','Scotland'),(1526,'Dumbarton','Strathclyde','Scotland'),(1527,'Dunoon','Strathclyde','Scotland'),(1528,'East Kilbride','Strathclyde','Scotland'),(1529,'Glasgow','Strathclyde','Scotland'),(1530,'Gourock','Strathclyde','Scotland'),(1531,'Greenock','Strathclyde','Scotland'),(1532,'Hamilton','Strathclyde','Scotland'),(1533,'Helensburgh','Strathclyde','Scotland'),(1534,'Inveraray','Strathclyde','Scotland'),(1535,'Irvine','Strathclyde','Scotland'),(1536,'Johnstone','Strathclyde','Scotland'),(1537,'Kilbarchan','Strathclyde','Scotland'),(1538,'Kilmarnock','Strathclyde','Scotland'),(1539,'Kilwinning','Strathclyde','Scotland'),(1540,'Lanark','Strathclyde','Scotland'),(1541,'Largs','Strathclyde','Scotland'),(1542,'Lochgilphead','Strathclyde','Scotland'),(1543,'Maybole','Strathclyde','Scotland'),(1544,'Milngavie','Strathclyde','Scotland'),(1545,'Motherwell','Strathclyde','Scotland'),(1546,'Oban','Strathclyde','Scotland'),(1547,'Paisley','Strathclyde','Scotland'),(1548,'Prestwick','Strathclyde','Scotland'),(1549,'Rothesay','Strathclyde','Scotland'),(1550,'Rutherglen','Strathclyde','Scotland'),(1551,'Saltcoats','Strathclyde','Scotland'),(1552,'Tobermory','Strathclyde','Scotland'),(1553,'Troon','Strathclyde','Scotland'),(1554,'Armadale','West Lothian','Scotland'),(1555,'Ballencrieff','West Lothian','Scotland'),(1556,'Bathgate','West Lothian','Scotland'),(1557,'Blackburn','West Lothian','Scotland'),(1558,'Blackridge','West Lothian','Scotland'),(1559,'Bridgend','West Lothian','Scotland'),(1560,'Broxburn','West Lothian','Scotland'),(1561,'East Calder','West Lothian','Scotland'),(1562,'Linlithgow','West Lothian','Scotland'),(1563,'Livingston','West Lothian','Scotland'),(1564,'Stoneyburn','West Lothian','Scotland'),(1565,'Whitburn','West Lothian','Scotland'),(1566,'Kirkwall','Western Isles','Scotland'),(1567,'Lerwick','Western Isles','Scotland'),(1568,'Stornoway','Western Isles','Scotland'),(1569,'Amlwch','Anglesey','Wales'),(1570,'Beaumaris','Anglesey','Wales'),(1571,'Benllech','Anglesey','Wales'),(1572,'Holyhead','Anglesey','Wales'),(1573,'Llanfairpwllgwyngyll','Anglesey','Wales'),(1574,'Llangefni','Anglesey','Wales'),(1575,'Menai Bridge','Anglesey','Wales'),(1576,'Ammanford','Carmarthenshire','Wales'),(1577,'Burry Port','Carmarthenshire','Wales'),(1578,'Carmarthen','Carmarthenshire','Wales'),(1579,'Garnant','Carmarthenshire','Wales'),(1580,'Glanamman','Carmarthenshire','Wales'),(1581,'Kidwelly','Carmarthenshire','Wales'),(1582,'Laugharne','Carmarthenshire','Wales'),(1583,'Llandeilo','Carmarthenshire','Wales'),(1584,'Llandovery','Carmarthenshire','Wales'),(1585,'Llanelli','Carmarthenshire','Wales'),(1586,'Newcastle Emlyn','Carmarthenshire','Wales'),(1587,'St Clears','Carmarthenshire','Wales'),(1588,'Whitland','Carmarthenshire','Wales'),(1589,'Aberaeron','Ceredigion','Wales'),(1590,'Aberystwyth','Ceredigion','Wales'),(1591,'Cardigan','Ceredigion','Wales'),(1592,'Lampeter','Ceredigion','Wales'),(1593,'Llandysul','Ceredigion','Wales'),(1594,'New Quay','Ceredigion','Wales'),(1595,'Tregaron','Ceredigion','Wales'),(1596,'Abergele','Conwy','Wales'),(1597,'Colwyn Bay','Conwy','Wales'),(1598,'Conwy','Conwy','Wales'),(1599,'Deganwy','Conwy','Wales'),(1600,'Llandudno','Conwy','Wales'),(1601,'Llandudno Junction','Conwy','Wales'),(1602,'Llanfairfechan','Conwy','Wales'),(1603,'Llanrwst','Conwy','Wales'),(1604,'Old Colwyn','Conwy','Wales'),(1605,'Penmaenmawr','Conwy','Wales'),(1606,'Towyn','Conwy','Wales'),(1607,'Carrog','Denbighshire','Wales'),(1608,'Corwen','Denbighshire','Wales'),(1609,'Denbigh','Denbighshire','Wales'),(1610,'Gellifor','Denbighshire','Wales'),(1611,'Llangollen','Denbighshire','Wales'),(1612,'Prestatyn','Denbighshire','Wales'),(1613,'Rhuddlan','Denbighshire','Wales'),(1614,'Rhyl','Denbighshire','Wales'),(1615,'Ruthin','Denbighshire','Wales'),(1616,'St Asaph','Denbighshire','Wales'),(1617,'Bagallit','Flintshire','Wales'),(1618,'Broughton','Flintshire','Wales'),(1619,'Buckley','Flintshire','Wales'),(1620,'Caerwys','Flintshire','Wales'),(1621,'Connah\'s Quay','Flintshire','Wales'),(1622,'Ewole','Flintshire','Wales'),(1623,'Flint','Flintshire','Wales'),(1624,'Hawarden','Flintshire','Wales'),(1625,'Holywell','Flintshire','Wales'),(1626,'Mold','Flintshire','Wales'),(1627,'Queensferry','Flintshire','Wales'),(1628,'Saltney','Flintshire','Wales'),(1629,'Shotton','Flintshire','Wales'),(1630,'Abertillery','Gwent','Wales'),(1631,'Blaina','Gwent','Wales'),(1632,'Brynmawr','Gwent','Wales'),(1633,'Cwmbran','Gwent','Wales'),(1634,'Ebbw Vale','Gwent','Wales'),(1635,'Newport','Gwent','Wales'),(1636,'Tafarnaubach','Gwent','Wales'),(1637,'Tredegar','Gwent','Wales'),(1638,'Bala','Gwynedd','Wales'),(1639,'Bangor','Gwynedd','Wales'),(1640,'Barmouth','Gwynedd','Wales'),(1641,'Beaumaris','Gwynedd','Wales'),(1642,'Betws y Coed','Gwynedd','Wales'),(1643,'Blaenau Ffestiniog','Gwynedd','Wales'),(1644,'Caernarfon','Gwynedd','Wales'),(1645,'Conwy','Gwynedd','Wales'),(1646,'Criccieth','Gwynedd','Wales'),(1647,'Dolgellau','Gwynedd','Wales'),(1648,'Ffestiniog','Gwynedd','Wales'),(1649,'Harlech','Gwynedd','Wales'),(1650,'Holyhead','Gwynedd','Wales'),(1651,'Llanberis','Gwynedd','Wales'),(1652,'Llanfachreth','Gwynedd','Wales'),(1653,'Nefyn','Gwynedd','Wales'),(1654,'Porthmadog','Gwynedd','Wales'),(1655,'Pwllheli','Gwynedd','Wales'),(1656,'Tywyn','Gwynedd','Wales'),(1657,'Y Felinheli','Gwynedd','Wales'),(1658,'Aberdare','Mid Glamorgan','Wales'),(1659,'Bridgend','Mid Glamorgan','Wales'),(1660,'Caerphilly','Mid Glamorgan','Wales'),(1661,'Llantrisant','Mid Glamorgan','Wales'),(1662,'Maesteg','Mid Glamorgan','Wales'),(1663,'Merthyr Tydfil','Mid Glamorgan','Wales'),(1664,'Pontypridd','Mid Glamorgan','Wales'),(1665,'Porth','Mid Glamorgan','Wales'),(1666,'Porthcawl','Mid Glamorgan','Wales'),(1667,'Abergavenny','Monmouthshire','Wales'),(1668,'Caldicot','Monmouthshire','Wales'),(1669,'Chepstow','Monmouthshire','Wales'),(1670,'Monmouth','Monmouthshire','Wales'),(1671,'Usk','Monmouthshire','Wales'),(1672,'Fishguard','Pembrokeshire','Wales'),(1673,'Goodwick','Pembrokeshire','Wales'),(1674,'Hakin','Pembrokeshire','Wales'),(1675,'Haverfordwest','Pembrokeshire','Wales'),(1676,'Milford Haven','Pembrokeshire','Wales'),(1677,'Narberth','Pembrokeshire','Wales'),(1678,'Newport','Pembrokeshire','Wales'),(1679,'Neyland','Pembrokeshire','Wales'),(1680,'Pembroke','Pembrokeshire','Wales'),(1681,'Pembroke Dock','Pembrokeshire','Wales'),(1682,'St Davids','Pembrokeshire','Wales'),(1683,'Tenby','Pembrokeshire','Wales'),(1684,'Brecon','Powys','Wales'),(1685,'Builth Wells','Powys','Wales'),(1686,'Cefnllys','Powys','Wales'),(1687,'Crickhowell','Powys','Wales'),(1688,'Hay on Wye','Powys','Wales'),(1689,'Knighton','Powys','Wales'),(1690,'Llandrindod Wells','Powys','Wales'),(1691,'Llanfair Caereinion','Powys','Wales'),(1692,'Llanfyllin','Powys','Wales'),(1693,'Llangors','Powys','Wales'),(1694,'Llanidloes','Powys','Wales'),(1695,'Llanwrtyd Wells','Powys','Wales'),(1696,'Machynlleth','Powys','Wales'),(1697,'Montgomery','Powys','Wales'),(1698,'Newtown','Powys','Wales'),(1699,'Old Radnor','Powys','Wales'),(1700,'Presteigne','Powys','Wales'),(1701,'Rhayader','Powys','Wales'),(1702,'Talgarth','Powys','Wales'),(1703,'Welshpool','Powys','Wales'),(1704,'Barry','South Glamorgan','Wales'),(1705,'Cardiff','South Glamorgan','Wales'),(1706,'Cowbridge','South Glamorgan','Wales'),(1707,'Llantwit Major','South Glamorgan','Wales'),(1708,'Penarth','South Glamorgan','Wales'),(1709,'Gorseinon','West Glamorgan','Wales'),(1710,'Lliw Valey','West Glamorgan','Wales'),(1711,'Neath','West Glamorgan','Wales'),(1712,'Port Talbot','West Glamorgan','Wales'),(1713,'Swansea','West Glamorgan','Wales'),(1714,'Chirk','Wrexham','Wales'),(1715,'Overton on Dee','Wrexham','Wales'),(1716,'Rhosllannerchrugog','Wrexham','Wales'),(1717,'Rhosnesni','Wrexham','Wales'),(1718,'Wrexham','Wrexham','Wales');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_details`
--

DROP TABLE IF EXISTS `meta_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meta_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Table Name',
  `type_id` int(11) NOT NULL COMMENT 'Table Record ID',
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keyword` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('Active','Inactive') COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_details`
--

LOCK TABLES `meta_details` WRITE;
/*!40000 ALTER TABLE `meta_details` DISABLE KEYS */;
INSERT INTO `meta_details` VALUES (1,'category',3,NULL,NULL,NULL,'Active',1,NULL,'2021-05-13 06:25:12','2021-05-13 06:25:12'),(2,'categories',2,NULL,NULL,NULL,'Active',1,NULL,'2021-05-13 11:07:03','2021-05-13 11:07:03'),(3,'category',4,NULL,NULL,NULL,'Active',1,NULL,'2021-05-13 06:26:04','2021-05-13 06:26:04'),(4,'categories',4,NULL,NULL,NULL,'Active',1,NULL,'2021-05-13 11:05:58','2021-05-13 11:05:58'),(5,'product',7,NULL,NULL,NULL,'Active',1,NULL,'2021-05-13 11:24:44','2021-05-13 11:24:44'),(6,'product',5,NULL,NULL,NULL,'Active',1,NULL,'2021-05-13 10:02:26','2021-05-13 10:02:26'),(7,'product',6,NULL,NULL,NULL,'Active',1,NULL,'2021-05-13 10:04:34','2021-05-13 10:04:34'),(8,'categories',1,NULL,NULL,NULL,'Active',1,NULL,'2021-05-13 11:05:40','2021-05-13 11:05:40'),(9,'categories',3,NULL,NULL,NULL,'Active',1,NULL,'2021-05-13 11:04:47','2021-05-13 11:04:47'),(10,'product',10,NULL,NULL,NULL,'Active',1,NULL,'2021-05-13 12:15:14','2021-05-13 12:15:14');
/*!40000 ALTER TABLE `meta_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2021_01_13_110009_create_roles_table',1),(5,'2021_01_14_064853_create_permissions_table',1),(6,'2021_01_14_064912_create_role_permissions_table',1),(7,'2021_01_14_093229_create_companies_table',1),(8,'2021_01_14_093229_create_user_profiles_table',1),(9,'2021_01_14_105147_create_banners_table',1),(10,'2021_01_14_110242_create_enquirys_table',1),(11,'2021_01_14_115057_create_countries_table',1),(12,'2021_01_14_120505_create_locations_table',1),(13,'2021_01_14_122226_create_user_logs_table',1),(14,'2021_01_14_123604_create_email_logs_table',1),(15,'2021_01_15_054908_create_categories_table',1),(16,'2021_01_15_062527_create_brands_table',1),(17,'2021_01_15_070710_create_products_table',1),(18,'2021_01_15_092345_create_product_images_table',1),(19,'2021_01_15_092506_create_product_prices_table',1),(20,'2021_01_15_092618_create_attributes_table',1),(21,'2021_01_15_092652_create_attribute_values_table',1),(22,'2021_01_15_092737_create_product_attributes_table',1),(23,'2021_01_15_092918_create_inventories_table',1),(24,'2021_01_15_093040_create_carts_table',1),(25,'2021_01_15_093154_create_status_table',1),(26,'2021_01_15_093221_create_orders_table',1),(27,'2021_01_15_093255_create_order_details_table',1),(28,'2021_01_15_093338_create_order_history_table',1),(29,'2021_01_15_110401_create_complaints_table',1),(30,'2021_01_19_000000_create_meta_table',1),(31,'2021_01_29_070446_create_product_categories_table',1),(32,'2021_02_24_053901_create_product_price_history_table',1),(33,'2021_03_04_125250_update_tables',2),(34,'2021_03_10_070714_update_company',2),(35,'2021_03_15_064603_create_complaint_type_table',2),(36,'2021_03_17_100918_update_migration_phase2',2),(37,'2021_03_24_061256_update_migration_phase3',2),(38,'2021_03_24_062004_create_complaint_activity',2),(39,'2021_04_03_065814_update_banner_table',2),(40,'2021_04_07_061700_update_meta_table',2),(41,'2021_04_28_075115_update_category_table',3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `store_company_id` int(10) unsigned NOT NULL,
  `supplier_company_id` int(10) unsigned NOT NULL,
  `product_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `po_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `invoice_no` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_price` double(10,2) NOT NULL,
  `product_commission` double(10,2) NOT NULL,
  `store_price` double(10,2) NOT NULL,
  `product_sku` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `shipping_postcode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shipping_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `location_id` mediumint(8) unsigned NOT NULL,
  `order_status_id` smallint(5) unsigned NOT NULL,
  `delivery_estimation` date DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `attribute_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`attribute_data`)),
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_details_order_id_foreign` (`order_id`),
  KEY `order_details_product_id_foreign` (`product_id`),
  KEY `order_details_location_id_foreign` (`location_id`),
  KEY `order_details_order_status_id_foreign` (`order_status_id`),
  KEY `order_details_store_company_id_foreign` (`store_company_id`),
  KEY `order_details_supplier_company_id_foreign` (`supplier_company_id`),
  CONSTRAINT `order_details_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`),
  CONSTRAINT `order_details_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_details_order_status_id_foreign` FOREIGN KEY (`order_status_id`) REFERENCES `order_status` (`id`),
  CONSTRAINT `order_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `order_details_store_company_id_foreign` FOREIGN KEY (`store_company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `order_details_supplier_company_id_foreign` FOREIGN KEY (`supplier_company_id`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_history`
--

DROP TABLE IF EXISTS `order_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_details_id` int(10) unsigned NOT NULL,
  `order_status_id` smallint(5) unsigned NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_history_order_details_id_foreign` (`order_details_id`),
  KEY `order_history_order_status_id_foreign` (`order_status_id`),
  CONSTRAINT `order_history_order_details_id_foreign` FOREIGN KEY (`order_details_id`) REFERENCES `order_details` (`id`),
  CONSTRAINT `order_history_order_status_id_foreign` FOREIGN KEY (`order_status_id`) REFERENCES `order_status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_history`
--

LOCK TABLES `order_history` WRITE;
/*!40000 ALTER TABLE `order_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_status`
--

DROP TABLE IF EXISTS `order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_status` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `status_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status`
--

LOCK TABLES `order_status` WRITE;
/*!40000 ALTER TABLE `order_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_company_id` int(10) unsigned NOT NULL,
  `po_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order_amount` double(10,2) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `highlight_order` enum('No','Yes') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_store_company_id_foreign` (`store_company_id`),
  CONSTRAINT `orders_store_company_id_foreign` FOREIGN KEY (`store_company_id`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('Active','Inactive','Delete') COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `permission_for` enum('1','2','3','4') COLLATE utf8_unicode_ci NOT NULL COMMENT '1=>All, 2=>Admin, 3=>Supplier, 4=>Store',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'View User','View User Details','Active',1,NULL,'2021-04-13 19:46:39',NULL,'1'),(2,'Add User','Add User','Active',1,NULL,'2021-04-13 19:46:39',NULL,'1'),(3,'Edit User','Edit User','Active',1,NULL,'2021-04-13 19:46:39',NULL,'1'),(4,'Delete User','Delete User','Active',1,NULL,'2021-04-13 19:46:39',NULL,'1'),(5,'Change User Status','Change status Active/Inactive','Active',1,NULL,'2021-04-13 19:46:39',NULL,'1'),(6,'View Role','View Role Details','Active',1,NULL,'2021-04-13 19:46:39',NULL,'2'),(7,'Add Role','Add Role','Active',1,NULL,'2021-04-13 19:46:39',NULL,'2'),(8,'Edit Role','Edit Role','Active',1,NULL,'2021-04-13 19:46:39',NULL,'2'),(9,'Delete Role','Delete Role','Active',1,NULL,'2021-04-13 19:46:39',NULL,'2'),(10,'Change Role Status','Change status Active/Inactive','Active',1,NULL,'2021-04-13 19:46:39',NULL,'2'),(11,'ACL Management','ACL Management','Active',1,NULL,'2021-04-13 19:46:39',NULL,'2'),(12,'View Enquiry','View Enquiry','Active',1,NULL,'2021-04-13 19:46:39',NULL,'2'),(13,'View Banner','View All Banner Details','Active',1,NULL,'2021-04-13 19:46:39',NULL,'2'),(14,'Add Banner','Add Banner','Active',1,NULL,'2021-04-13 19:46:39',NULL,'2'),(15,'Edit Banner','Edit Banner','Active',1,NULL,'2021-04-13 19:46:39',NULL,'2'),(16,'Delete Banner','Delete Banner','Active',1,NULL,'2021-04-13 19:46:39',NULL,'2'),(17,'Change Banner Status','Change Banner status Active/Inactive','Active',1,NULL,'2021-04-13 19:46:39',NULL,'2'),(18,'View Category','View All Category Details','Active',1,NULL,'2021-04-13 19:46:39',NULL,'2'),(19,'Add Category','Add Category','Active',1,NULL,'2021-04-13 19:46:39',NULL,'2'),(20,'Edit Category','Edit Category','Active',1,NULL,'2021-04-13 19:46:39',NULL,'2'),(21,'Delete Category','Delete Category','Active',1,NULL,'2021-04-13 19:46:39',NULL,'2'),(22,'Change Category Status','Change Category status Active/Inactive','Active',1,NULL,'2021-04-13 19:46:39',NULL,'2'),(23,'View Product','View All Product Details','Active',1,NULL,'2021-04-13 19:46:39',NULL,'1'),(24,'Add Product','Add Product','Active',1,NULL,'2021-04-13 19:46:39',NULL,'1'),(25,'Edit Product','Edit Product','Active',1,NULL,'2021-04-13 19:46:39',NULL,'1'),(26,'Delete Product','Delete Product','Active',1,NULL,'2021-04-13 19:46:39',NULL,'1'),(27,'Change Product Status','Change Product status Active/Inactive','Active',1,NULL,'2021-04-13 19:46:39',NULL,'1'),(28,'View Attribute','View Attribute Details','Active',1,NULL,'2021-04-13 19:46:39',NULL,'2'),(29,'Add Attribute','Add Attribute','Active',1,NULL,'2021-04-13 19:46:39',NULL,'2'),(30,'Edit Attribute','Edit Attribute','Active',1,NULL,'2021-04-13 19:46:39',NULL,'2'),(31,'Delete Attribute','Delete Attribute','Active',1,NULL,'2021-04-13 19:46:39',NULL,'2'),(32,'Change Attribute Status','Change status Active/Inactive','Active',1,NULL,'2021-04-13 19:46:39',NULL,'2'),(33,'View Attribute Values','View Attribute Details','Active',1,NULL,'2021-04-13 19:46:39',NULL,'2'),(34,'Add Attribute Values','Add Attribute Values','Active',1,NULL,'2021-04-13 19:46:39',NULL,'2'),(35,'Edit Attribute Values','Edit Attribute Values','Active',1,NULL,'2021-04-13 19:46:39',NULL,'2'),(36,'Delete Attribute Values','Delete Attribute Values','Active',1,NULL,'2021-04-13 19:46:39',NULL,'2'),(37,'Change Attribute Values Status','Change status Active/Inactive','Active',1,NULL,'2021-04-13 19:46:39',NULL,'2'),(38,'View Company','View All Company Details','Active',1,NULL,'2021-04-13 19:46:39',NULL,'2'),(39,'Add Company','Add Company','Active',1,NULL,'2021-04-13 19:46:39',NULL,'2'),(40,'Edit Company','Edit Company','Active',1,NULL,'2021-04-13 19:46:39',NULL,'2'),(41,'Delete Company','Delete Company','Active',1,NULL,'2021-04-13 19:46:39',NULL,'2'),(42,'Change Company Status','Change Company status Active/Inactive','Active',1,NULL,'2021-04-13 19:46:39',NULL,'2'),(43,'View Order','View All Orders','Active',1,NULL,'2021-04-13 19:46:39',NULL,'1'),(44,'Acknowledged Order','Acknowledged All Orders','Active',1,NULL,'2021-04-13 19:46:39',NULL,'1'),(45,'InProcess Order','InProcess All Orders','Active',1,NULL,'2021-04-13 19:46:39',NULL,'1'),(46,'Dispatched Order','Dispatched All Orders','Active',1,NULL,'2021-04-13 19:46:39',NULL,'1'),(47,'Delivered Order','Delivered All Orders','Active',1,NULL,'2021-04-13 19:46:39',NULL,'1'),(48,'Cancelled Order','Cancelled All Orders','Active',1,NULL,'2021-04-13 19:46:39',NULL,'1'),(49,'Order Details Status Filter','Order Details Status Filter','Active',1,NULL,'2021-04-13 19:46:39',NULL,'1'),(50,'Track Orders','Track Orders','Active',1,NULL,'2021-04-13 19:46:39',NULL,'1'),(51,'Supplier Filter','Supplier Filter','Active',1,NULL,'2021-04-13 19:46:39',NULL,'1'),(52,'Estimation Date','Estimation Date','Active',1,NULL,'2021-04-13 19:46:39',NULL,'1'),(53,'Manage Stock','Manage Stock','Active',1,NULL,'2021-04-13 19:46:39',NULL,'1'),(54,'Price History','Price History','Active',1,NULL,'2021-04-13 19:46:39',NULL,'1'),(55,'Product Price','Product Price','Active',1,NULL,'2021-04-13 19:46:39',NULL,'1'),(56,'View Complaints','View Complaints','Active',1,NULL,'2021-04-13 19:46:39',NULL,'1'),(57,'View Activity','View Activity','Active',1,NULL,'2021-04-13 19:46:39',NULL,'1'),(58,'Manage Complaint','Manage Complaint','Active',1,NULL,'2021-04-13 19:46:39',NULL,'1');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_attributes`
--

DROP TABLE IF EXISTS `product_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_attributes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `attribute_id` mediumint(8) unsigned NOT NULL,
  `attribute_value_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_attributes_product_id_foreign` (`product_id`),
  KEY `product_attributes_attribute_id_foreign` (`attribute_id`),
  KEY `product_attributes_attribute_value_id_foreign` (`attribute_value_id`),
  CONSTRAINT `product_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`),
  CONSTRAINT `product_attributes_attribute_value_id_foreign` FOREIGN KEY (`attribute_value_id`) REFERENCES `attribute_values` (`id`),
  CONSTRAINT `product_attributes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_attributes`
--

LOCK TABLES `product_attributes` WRITE;
/*!40000 ALTER TABLE `product_attributes` DISABLE KEYS */;
INSERT INTO `product_attributes` VALUES (1,1,1,1),(2,1,1,2),(3,2,1,2),(5,3,1,2),(6,4,1,2),(9,5,1,1),(10,6,4,3),(13,7,4,3),(14,10,4,5);
/*!40000 ALTER TABLE `product_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `category_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_categories_product_id_foreign` (`product_id`),
  KEY `product_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `product_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `product_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_categories`
--

LOCK TABLES `product_categories` WRITE;
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;
INSERT INTO `product_categories` VALUES (1,1,1),(2,2,2),(3,2,1),(6,3,2),(7,3,1),(8,4,1),(11,5,2),(12,6,2),(13,6,4),(16,7,1),(17,10,4);
/*!40000 ALTER TABLE `product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `image_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_images_product_id_foreign` (`product_id`),
  CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (1,1,'1615809218-chart 3.jpg'),(2,1,'1615809218-chart1.jpg'),(3,1,'1615809218-chart2.jpg'),(4,2,'1615992685-accounting cycle 2.png'),(5,2,'1615992685-accounting cycle 3.png'),(6,2,'1615992685-accounting cycle.png'),(7,2,'1615992685-accounting system 1.png'),(8,7,'1620905084-bed2.jpg'),(9,7,'1620905085-bed1.jpg'),(10,7,'1620905085-bed.jpg');
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_price_history`
--

DROP TABLE IF EXISTS `product_price_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_price_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  `product_price` double(10,2) NOT NULL,
  `store_price` double(10,2) NOT NULL,
  `commission` double(10,2) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_price_history_product_id_foreign` (`product_id`),
  KEY `product_price_history_store_id_foreign` (`store_id`),
  CONSTRAINT `product_price_history_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `product_price_history_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_price_history`
--

LOCK TABLES `product_price_history` WRITE;
/*!40000 ALTER TABLE `product_price_history` DISABLE KEYS */;
INSERT INTO `product_price_history` VALUES (4,5,2,100.00,150.00,10.00,1,'2021-05-13 06:52:47');
/*!40000 ALTER TABLE `product_price_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_prices`
--

DROP TABLE IF EXISTS `product_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_prices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_id` int(10) unsigned NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `product_price` double(10,2) NOT NULL,
  `commission` double(10,2) NOT NULL,
  `store_price` double(10,2) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_prices_product_id_foreign` (`product_id`),
  KEY `product_prices_store_id_foreign` (`store_id`),
  KEY `product_prices_supplier_id_foreign` (`supplier_id`),
  CONSTRAINT `product_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `product_prices_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `product_prices_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_prices`
--

LOCK TABLES `product_prices` WRITE;
/*!40000 ALTER TABLE `product_prices` DISABLE KEYS */;
INSERT INTO `product_prices` VALUES (1,1,2,5,100.00,10.00,150.00,1,NULL,'2021-05-13 06:52:47','2021-05-13 06:52:47');
/*!40000 ALTER TABLE `product_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company_id` int(10) unsigned NOT NULL,
  `model_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `short_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `featured_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `brochure` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_sku` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_price` double(10,2) NOT NULL,
  `commission` double(10,2) NOT NULL,
  `quantity` mediumint(9) NOT NULL,
  `manage_inventory` enum('Yes','No') COLLATE utf8_unicode_ci NOT NULL,
  `inventory_status` enum('INSTOCK','ARCHIVED','OUT OF STOCK') COLLATE utf8_unicode_ci NOT NULL,
  `backorders` enum('INSTOCK','ARCHIVED','OUT OF STOCK') COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('Active','Inactive','Delete') COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `featured` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `store_price` double(10,2) NOT NULL,
  `show_publicly` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `products_company_id_foreign` (`company_id`),
  CONSTRAINT `products_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'tryty','tryty',1,'676','fgdf','<p>gdfgfdg</p>','1615809218-chart2.jpg','1615809218-chart1.jpg','65665',76.00,67.00,5,'Yes','INSTOCK','INSTOCK','Active',1,NULL,'2021-03-15 11:53:38','2021-03-15 11:53:38','no',0.00,'no'),(2,'hghg','hghg',6,'54654654','nvb','<p>nvbnvbnvbn</p>','1615992685-accounting cycle 2.png','1615992685-accounting cycle 3.png','tytry',76.00,6.00,6,'Yes','INSTOCK','INSTOCK','Delete',1,1,'2021-03-17 14:51:25','2021-05-13 11:59:58','no',0.00,'no'),(3,'hghg','hghg',1,'54654654','hgfhf','<p>ghgfhfgh</p>','','','tytry',76.00,6.00,6,'Yes','INSTOCK','INSTOCK','Active',1,NULL,'2021-03-17 14:54:35','2021-03-17 14:55:19','no',0.00,'no'),(4,'hghg','hghg',6,'54654654','tert','<p>ertert</p>','','','tytry',76.00,6.00,6,'Yes','INSTOCK','INSTOCK','Active',1,NULL,'2021-03-17 14:59:46','2021-03-17 14:59:46','no',0.00,'no'),(5,'Samsung Galaxy M51 (Electric Blue, 6GB RAM, 128GB Storage)','samsung-galaxy-m51-electric-blue-6gb-ram-128gb-storage',1,'FDGD647','wertyuiop[','<p>wertyuiop</p>\n\n<p>gdhfjkl;</p>','1620887377-81fwKtv0VHL._SL1500_.jpg','1620887378-Software-manual.pdf','SM-M515FZBDINS',100.00,10.00,500,'Yes','INSTOCK','INSTOCK','Active',1,1,'2021-05-13 06:29:38','2021-05-13 10:02:26','yes',250.00,'no'),(6,'Samsung Galaxy M51 (Electric Blue, 6GB RAM, 128GB Storage)','samsung-galaxy-m51-electric-blue-6gb-ram-128gb-storage',1,'FDGD647','wertyuiop[','<p>wertyuiop</p>\n\n<p>gdhfjkl;</p>','1620887406-81fwKtv0VHL._SL1500_.jpg','1620887407-Software-manual.pdf','SM-M515FZBDINS',100.00,10.00,100,'Yes','INSTOCK','INSTOCK','Active',1,NULL,'2021-05-13 06:30:07','2021-05-13 10:04:34','yes',250.00,'yes'),(7,'Perfect Homes Opus Engineered Wood Queen Box Bed','product2',1,'FDGD649','The material used in this bed is laminated from all sides to give it full protection from moisture and other external factors.','<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width: 500px;\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Bed Material</td>\r\n			<td>Engineered Wood</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bed Material Subtype</td>\r\n			<td>Particle Board</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Upholstery Included</td>\r\n			<td>No</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Finish Type</td>\r\n			<td>Laminate</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Finish Color</td>\r\n			<td>Dark Walnut</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Storage Type</td>\r\n			<td>Box</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Headboard Type</td>\r\n			<td>Open Storage</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>','1620904630-bed.jpg','','SKU003',200.00,20.00,100,'Yes','INSTOCK','INSTOCK','Active',1,1,'2021-05-13 06:31:24','2021-05-13 11:24:44','yes',350.00,'yes'),(8,'Deckup Giona Study Table and Office Desk','deckup-giona-study-table-and-office-desk',7,'B07H3BGW1N','Deckup Giona Study Table and Office Desk (Walnut, Matte Finish)','<h1>About this item</h1>\n\n<ul>\n	<li>Product Dimensions: Length (46 Inches / 116 CMs), Width (22 Inches / 57 CMs), Height (28 Inches / 72 CMs)</li>\n	<li>Primary Material: Engineered Wood with Laminate</li>\n	<li>Color: Walnut, Finish: Matte Finish, Style: Contemporary</li>\n	<li>Assembly Required: The product requires basic assembly and comes with DIY (Do-It-Yourself) assembly instructions</li>\n	<li>Care Instructions: Wipe it clean with a dry cloth. Do not use water. Wipe any spills immediately</li>\n</ul>','1620907294-81IR6WKKTLL._AC_SL1500_.jpg','','B07H3BGW1N',4799.00,100.00,100,'Yes','INSTOCK','INSTOCK','Active',1,NULL,'2021-05-13 12:01:34','2021-05-13 12:01:34','yes',5500.00,'yes'),(9,'Astonishing 3 Seater Sofa in Shiny Light Grey Colour','astonishing-3-seater-sofa-in-shiny-light-grey-colour',1,'SOFA1','Flight 3 Seater Sofa','<div class=\"v-prod-comp-dtls-label font-14 pf-medium-bold-text\">&nbsp;</div>\r\n\r\n<div class=\"v-prod-comp-dtls-wrap\">\r\n<div class=\"v-prod-comp-dtls-list\">\r\n<div class=\"v-prod-comp-dtls-listitem\"><span class=\"v-prod-comp-dtls-listitem-label\">Brand:</span> <span class=\"v-prod-comp-dtls-listitem-value pf-text-grey\" itemprop=\"brand\">Dreamzz Furniture</span></div>\r\n\r\n<div class=\"v-prod-comp-dtls-listitem\"><span class=\"v-prod-comp-dtls-listitem-label\">Dimensions:</span> <span class=\"v-prod-comp-dtls-listitem-value pf-text-grey\">H 33 x W 92 x D 34; Seating Height-14<br />\r\n(all dimensions in inches)</span></div>\r\n\r\n<div class=\"v-prod-comp-dtls-listitem\"><span class=\"v-prod-comp-dtls-listitem-label\">Weight:</span> <span class=\"v-prod-comp-dtls-listitem-value pf-text-grey\">48 KG</span></div>\r\n\r\n<div class=\"v-prod-comp-dtls-listitem\"><span class=\"v-prod-comp-dtls-listitem-label\">Warranty:</span> <span class=\"v-prod-comp-dtls-listitem-value pf-text-grey\">12 Months&#39; Warranty</span></div>\r\n\r\n<div class=\"v-prod-comp-dtls-listitem\"><span class=\"v-prod-comp-dtls-listitem-label\">Assembly:</span> <span class=\"v-prod-comp-dtls-listitem-value pf-text-grey\">Carpenter Assembly</span></div>\r\n\r\n<div class=\"v-prod-comp-dtls-listitem\"><span class=\"v-prod-comp-dtls-listitem-label\">Primary Material:</span> <span class=\"v-prod-comp-dtls-listitem-value pf-text-grey\" itemprop=\"material\">Fabric</span></div>\r\n\r\n<div class=\"v-prod-comp-dtls-listitem\"><span class=\"v-prod-comp-dtls-listitem-label\">Room Type:</span> <span class=\"v-prod-comp-dtls-listitem-value pf-text-grey\">Living Room</span></div>\r\n\r\n<div class=\"v-prod-comp-dtls-listitem\"><span class=\"v-prod-comp-dtls-listitem-label\">Seating Height:</span> <span class=\"v-prod-comp-dtls-listitem-value pf-text-grey\">14</span></div>\r\n\r\n<div class=\"v-prod-comp-dtls-listitem\"><span class=\"v-prod-comp-dtls-listitem-label\">Sku:</span> <span class=\"v-prod-comp-dtls-listitem-value pf-text-grey\" itemprop=\"sku\">FN1623813-S-PM22933</span></div>\r\n</div>\r\n</div>','1620907719-56101502SD01296_A1.jpg','','M21G',10012.00,21.00,10,'Yes','INSTOCK','INSTOCK','Active',1,NULL,'2021-05-13 12:08:40','2021-05-13 12:08:40','yes',10040.00,'yes'),(10,'Astonishing 3 Seater Sofa in Shiny Light Grey Colour','astonishing-3-seater-sofa-in-shiny-light-grey-colour',1,'SOFA1','Flight 3 Seater Sofa','<div class=\"v-prod-comp-dtls-label font-14 pf-medium-bold-text\">&nbsp;</div>\r\n\r\n<div class=\"v-prod-comp-dtls-wrap\">\r\n<div class=\"v-prod-comp-dtls-list\">\r\n<div class=\"v-prod-comp-dtls-listitem\"><span class=\"v-prod-comp-dtls-listitem-label\">Brand:</span> <span class=\"v-prod-comp-dtls-listitem-value pf-text-grey\" itemprop=\"brand\">Dreamzz Furniture</span></div>\r\n\r\n<div class=\"v-prod-comp-dtls-listitem\"><span class=\"v-prod-comp-dtls-listitem-label\">Dimensions:</span> <span class=\"v-prod-comp-dtls-listitem-value pf-text-grey\">H 33 x W 92 x D 34; Seating Height-14<br />\r\n(all dimensions in inches)</span></div>\r\n\r\n<div class=\"v-prod-comp-dtls-listitem\"><span class=\"v-prod-comp-dtls-listitem-label\">Weight:</span> <span class=\"v-prod-comp-dtls-listitem-value pf-text-grey\">48 KG</span></div>\r\n\r\n<div class=\"v-prod-comp-dtls-listitem\"><span class=\"v-prod-comp-dtls-listitem-label\">Warranty:</span> <span class=\"v-prod-comp-dtls-listitem-value pf-text-grey\">12 Months&#39; Warranty</span></div>\r\n\r\n<div class=\"v-prod-comp-dtls-listitem\"><span class=\"v-prod-comp-dtls-listitem-label\">Assembly:</span> <span class=\"v-prod-comp-dtls-listitem-value pf-text-grey\">Carpenter Assembly</span></div>\r\n\r\n<div class=\"v-prod-comp-dtls-listitem\"><span class=\"v-prod-comp-dtls-listitem-label\">Primary Material:</span> <span class=\"v-prod-comp-dtls-listitem-value pf-text-grey\" itemprop=\"material\">Fabric</span></div>\r\n\r\n<div class=\"v-prod-comp-dtls-listitem\"><span class=\"v-prod-comp-dtls-listitem-label\">Room Type:</span> <span class=\"v-prod-comp-dtls-listitem-value pf-text-grey\">Living Room</span></div>\r\n\r\n<div class=\"v-prod-comp-dtls-listitem\"><span class=\"v-prod-comp-dtls-listitem-label\">Seating Height:</span> <span class=\"v-prod-comp-dtls-listitem-value pf-text-grey\">14</span></div>\r\n\r\n<div class=\"v-prod-comp-dtls-listitem\"><span class=\"v-prod-comp-dtls-listitem-label\">Sku:</span> <span class=\"v-prod-comp-dtls-listitem-value pf-text-grey\" itemprop=\"sku\">FN1623813-S-PM22933</span></div>\r\n</div>\r\n</div>','1620907751-56101502SD01296_A1.jpg','','M21G',10012.00,21.00,10,'Yes','INSTOCK','INSTOCK','Active',1,NULL,'2021-05-13 12:09:11','2021-05-13 12:15:14','yes',10040.00,'yes');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permissions`
--

DROP TABLE IF EXISTS `role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` smallint(5) unsigned NOT NULL,
  `permission_id` mediumint(8) unsigned NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role_permissions_role_id_foreign` (`role_id`),
  KEY `role_permissions_permission_id_foreign` (`permission_id`),
  CONSTRAINT `role_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`),
  CONSTRAINT `role_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permissions`
--

LOCK TABLES `role_permissions` WRITE;
/*!40000 ALTER TABLE `role_permissions` DISABLE KEYS */;
INSERT INTO `role_permissions` VALUES (1,6,1,1,'2021-03-11 14:43:29'),(2,6,2,1,'2021-03-11 14:43:29'),(3,6,3,1,'2021-03-11 14:43:29'),(4,6,4,1,'2021-03-11 14:43:29'),(5,6,5,1,'2021-03-11 14:43:29'),(6,6,6,1,'2021-03-11 14:43:29'),(7,6,7,1,'2021-03-11 14:43:29'),(8,6,8,1,'2021-03-11 14:43:29'),(9,6,9,1,'2021-03-11 14:43:29'),(10,6,10,1,'2021-03-11 14:43:29'),(11,6,11,1,'2021-03-11 14:43:29'),(12,6,12,1,'2021-03-11 14:43:29'),(13,6,13,1,'2021-03-11 14:43:29'),(14,6,14,1,'2021-03-11 14:43:29'),(15,6,15,1,'2021-03-11 14:43:29'),(16,6,16,1,'2021-03-11 14:43:29'),(17,6,17,1,'2021-03-11 14:43:29'),(18,6,18,1,'2021-03-11 14:43:29'),(19,6,19,1,'2021-03-11 14:43:29'),(20,6,20,1,'2021-03-11 14:43:29'),(21,6,21,1,'2021-03-11 14:43:29'),(22,6,22,1,'2021-03-11 14:43:29'),(23,6,23,1,'2021-03-11 14:43:29'),(24,6,24,1,'2021-03-11 14:43:29'),(25,6,25,1,'2021-03-11 14:43:29'),(26,6,26,1,'2021-03-11 14:43:29'),(27,6,27,1,'2021-03-11 14:43:29'),(28,6,28,1,'2021-03-11 14:43:29'),(29,6,29,1,'2021-03-11 14:43:29'),(30,6,30,1,'2021-03-11 14:43:29'),(31,6,31,1,'2021-03-11 14:43:29'),(32,6,32,1,'2021-03-11 14:43:29'),(33,6,33,1,'2021-03-11 14:43:29'),(34,6,34,1,'2021-03-11 14:43:29'),(35,6,35,1,'2021-03-11 14:43:29'),(36,6,36,1,'2021-03-11 14:43:29'),(37,6,37,1,'2021-03-11 14:43:29'),(38,6,38,1,'2021-03-11 14:43:29'),(39,6,39,1,'2021-03-11 14:43:29'),(40,6,40,1,'2021-03-11 14:43:29'),(41,6,41,1,'2021-03-11 14:43:29'),(42,6,42,1,'2021-03-11 14:43:29'),(43,6,43,1,'2021-03-11 14:43:29'),(44,6,44,1,'2021-03-11 14:43:29'),(45,6,45,1,'2021-03-11 14:43:29'),(46,6,46,1,'2021-03-11 14:43:29'),(47,6,47,1,'2021-03-11 14:43:29'),(48,6,48,1,'2021-03-11 14:43:29'),(49,6,49,1,'2021-03-11 14:43:29'),(50,6,50,1,'2021-03-11 14:43:29'),(51,6,51,1,'2021-03-11 14:43:29'),(52,6,52,1,'2021-03-11 14:43:29'),(59,7,1,1,'2021-03-17 13:26:55'),(60,7,2,1,'2021-03-17 13:26:55'),(61,7,3,1,'2021-03-17 13:26:55'),(62,7,4,1,'2021-03-17 13:26:55'),(63,7,5,1,'2021-03-17 13:26:55'),(64,7,6,1,'2021-03-17 13:26:55'),(65,7,30,1,'2021-03-17 13:26:55'),(66,7,31,1,'2021-03-17 13:26:55'),(67,7,32,1,'2021-03-17 13:26:55'),(68,7,33,1,'2021-03-17 13:26:55'),(69,7,34,1,'2021-03-17 13:26:55'),(70,7,35,1,'2021-03-17 13:26:55'),(72,4,1,1,'2021-05-13 10:23:12'),(73,4,23,1,'2021-05-13 10:23:12'),(74,4,43,1,'2021-05-13 10:23:12'),(75,4,56,1,'2021-05-13 10:23:12'),(76,4,57,1,'2021-05-13 10:23:12'),(77,4,58,1,'2021-05-13 10:23:12');
/*!40000 ALTER TABLE `role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('Active','Inactive','Delete') COLLATE utf8_unicode_ci NOT NULL,
  `role_parent_id` smallint(6) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Super Admin','Super Admin have access of all the events occuring in the system.','Active',0,1,NULL,'2021-03-03 14:46:29',NULL),(2,'Admin','Admin have access of all the events occuring in the system.','Active',0,1,NULL,'2021-03-03 14:46:29',NULL),(3,'Supplier','Supplier can do some specific task in the system related to product. Supplier will performed action(Confirm, Cancel, Dispatch) on the order placed by store of their own product and can manage inventry.','Active',0,1,NULL,'2021-03-03 14:46:29',NULL),(4,'Store','Store can do some specific task in the system related to product. Store will mange their own profile address and can placed order.','Active',0,1,NULL,'2021-03-03 14:46:29',NULL),(5,'Test Role','This is a test role','Active',2,1,NULL,'2021-03-11 14:34:25',NULL),(6,'Test Supplier','Test Supplier','Active',3,1,NULL,'2021-03-11 14:41:23',NULL),(7,'Test Role 1','fdgdfgdf','Active',2,1,1,'2021-03-15 12:26:18','2021-05-13 06:19:15'),(8,'Test Role 2','asdasd','Delete',2,1,1,'2021-03-17 13:22:30','2021-03-17 13:25:03'),(9,'Account Manager','','Active',4,1,NULL,'2021-05-13 10:19:33',NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_logs`
--

DROP TABLE IF EXISTS `user_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `record_id` int(11) NOT NULL,
  `table_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_agent` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_logs_user_id_foreign` (`user_id`),
  KEY `user_logs_record_id_index` (`record_id`),
  CONSTRAINT `user_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_logs`
--

LOCK TABLES `user_logs` WRITE;
/*!40000 ALTER TABLE `user_logs` DISABLE KEYS */;
INSERT INTO `user_logs` VALUES (1,1,1,'attributes','Attribute has been added by admin@gmail.com','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36 Edg/89.0.774.50','2021-03-15 10:09:31'),(2,1,1,'attribute_values','Attribute Value has been added by admin@gmail.com','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36 Edg/89.0.774.50','2021-03-15 10:14:29'),(3,1,2,'attribute_values','Attribute Value has been added by admin@gmail.com','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36 Edg/89.0.774.50','2021-03-15 10:14:44'),(4,1,2,'attributes','Attribute has been added by admin@gmail.com','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36','2021-03-17 14:31:46'),(5,1,3,'attributes','Attribute has been added by admin@gmail.com','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36','2021-03-17 14:32:03'),(6,1,2,'attribute_values','Attribute Value has been updated by admin@gmail.com','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36','2021-03-17 14:32:58'),(7,1,2,'attribute_values','Attribute Value has been updated by admin@gmail.com','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36','2021-03-17 14:33:26'),(8,1,2,'banners','Banner has been updated by admin@gmail.com','103.29.220.138 | Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36','2021-04-06 12:27:09'),(9,1,1,'banners','Banner has been updated by admin@gmail.com','103.29.220.138 | Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36','2021-04-06 12:27:29'),(10,1,1,'carts','Product in cart has been added by admin@gmail.com','103.110.6.21 | Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36','2021-04-14 11:53:28'),(11,1,11,'users','User has been updated by admin@gmail.com','82.47.85.81 | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36','2021-05-12 11:48:24'),(12,1,7,'roles','Role has been updated by admin@gmail.com','157.36.150.104 | Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36','2021-05-13 06:19:15'),(13,1,4,'role_permissions','Permissions has been updated for Role ID - 4 by admin@gmail.com','157.36.150.104 | Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36','2021-05-13 06:19:56'),(14,1,4,'companies','Company has been updated by admin@gmail.com','157.36.150.104 | Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36','2021-05-13 06:21:26'),(15,1,7,'companies','Company has been added by admin@gmail.com','157.36.150.104 | Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36','2021-05-13 06:23:06'),(16,1,3,'users','User has been updated by admin@gmail.com','157.36.150.104 | Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36','2021-05-13 06:23:46'),(17,1,2,'attributes','Attribute has been updated by admin@gmail.com','157.36.150.104 | Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36','2021-05-13 06:24:06'),(18,1,4,'attributes','Attribute has been added by admin@gmail.com','157.36.150.104 | Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36','2021-05-13 06:24:22'),(19,1,3,'attribute_values','Attribute Value has been added by admin@gmail.com','157.36.150.104 | Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36','2021-05-13 06:24:32'),(20,1,3,'categories','Category Category has been added by admin@gmail.com','157.36.150.104 | Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36','2021-05-13 06:25:12'),(21,1,2,'categories','Test category Category has been updated by admin@gmail.com','157.36.150.104 | Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36','2021-05-13 06:25:27'),(22,1,4,'categories','Category2 Category has been added by admin@gmail.com','157.36.150.104 | Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36','2021-05-13 06:26:04'),(23,1,2,'categories','Test category Category has been updated by admin@gmail.com','157.36.150.104 | Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36','2021-05-13 06:26:58'),(24,1,2,'categories','Test category2 Category has been updated by admin@gmail.com','157.36.150.104 | Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36','2021-05-13 06:27:20'),(25,1,4,'categories','Category2 Category has been updated by admin@gmail.com','157.36.150.104 | Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36','2021-05-13 06:41:21'),(26,1,1,'product_prices','Store ID - 2 price for Product ID 5 has been added by admin@gmail.com','157.36.150.104 | Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36','2021-05-13 06:52:47'),(27,1,7,'products','Product has been updated by admin@gmail.com','157.36.150.104 | Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36','2021-05-13 07:13:00'),(28,1,2,'carts','Product in cart has been added by admin@gmail.com','157.36.150.104 | Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36','2021-05-13 07:14:56'),(29,1,1,'banners','Banner has been updated by admin@gmail.com','157.36.150.104 | Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36','2021-05-13 08:23:49'),(30,1,1,'banners','Banner has been updated by admin@gmail.com','157.36.150.104 | Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36','2021-05-13 08:27:57'),(31,1,3,'banners','Banner has been added by admin@gmail.com','157.36.150.104 | Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36','2021-05-13 08:28:27'),(32,1,5,'products','Product has been updated by admin@gmail.com','157.36.150.104 | Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36','2021-05-13 09:19:48'),(33,1,5,'products','Product has been updated by admin@gmail.com','157.36.150.104 | Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36','2021-05-13 10:02:26'),(34,1,6,'products','Product has been updated by admin@gmail.com','157.36.150.104 | Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36','2021-05-13 10:04:34'),(35,1,12,'users','User has been updated by admin@gmail.com','47.15.3.158 | Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36','2021-05-13 10:10:18'),(36,1,9,'roles','Role has been added by admin@gmail.com','47.15.3.158 | Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36','2021-05-13 10:19:33'),(37,1,4,'role_permissions','Permissions has been updated for Role ID - 4 by admin@gmail.com','47.15.3.158 | Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36','2021-05-13 10:23:12'),(38,1,12,'users','User has been updated by admin@gmail.com','157.36.150.104 | Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36','2021-05-13 11:01:54'),(39,1,1,'categories','Test category Category has been updated by admin@gmail.com','47.15.3.158 | Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36','2021-05-13 11:03:40'),(40,1,3,'categories','Furniture Category has been updated by admin@gmail.com','157.47.231.123 | Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:88.0) Gecko/20100101 Firefox/88.0','2021-05-13 11:04:47'),(41,1,1,'categories','Beds Category has been updated by admin@gmail.com','157.47.231.123 | Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:88.0) Gecko/20100101 Firefox/88.0','2021-05-13 11:05:40'),(42,1,4,'categories','Sofa Category has been updated by admin@gmail.com','157.47.231.123 | Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:88.0) Gecko/20100101 Firefox/88.0','2021-05-13 11:05:58'),(43,1,2,'categories','Wardrobes Category has been updated by admin@gmail.com','157.47.231.123 | Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:88.0) Gecko/20100101 Firefox/88.0','2021-05-13 11:07:03'),(44,1,7,'products','Product has been updated by admin@gmail.com','157.47.231.123 | Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:88.0) Gecko/20100101 Firefox/88.0','2021-05-13 11:17:10'),(45,1,7,'products','Product has been updated by admin@gmail.com','157.47.231.123 | Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:88.0) Gecko/20100101 Firefox/88.0','2021-05-13 11:21:21'),(46,1,7,'products','Product has been updated by admin@gmail.com','157.47.231.123 | Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:88.0) Gecko/20100101 Firefox/88.0','2021-05-13 11:24:45'),(47,1,2,'attributes','Attribute has been updated by admin@gmail.com','157.47.231.123 | Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:88.0) Gecko/20100101 Firefox/88.0','2021-05-13 11:53:11'),(48,1,3,'attributes','Attribute has been updated by admin@gmail.com','157.47.231.123 | Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:88.0) Gecko/20100101 Firefox/88.0','2021-05-13 11:53:27'),(49,1,1,'attributes','Attribute has been updated by admin@gmail.com','157.47.231.123 | Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:88.0) Gecko/20100101 Firefox/88.0','2021-05-13 11:53:43'),(50,1,5,'attributes','Attribute has been added by admin@gmail.com','157.47.231.123 | Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:88.0) Gecko/20100101 Firefox/88.0','2021-05-13 11:54:02'),(51,1,4,'attribute_values','Attribute Value has been added by admin@gmail.com','157.47.231.123 | Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:88.0) Gecko/20100101 Firefox/88.0','2021-05-13 11:54:35'),(52,1,5,'attribute_values','Attribute Value has been added by admin@gmail.com','157.47.231.123 | Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:88.0) Gecko/20100101 Firefox/88.0','2021-05-13 11:54:57'),(53,1,10,'products','Product has been updated by admin@gmail.com','157.47.231.123 | Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:88.0) Gecko/20100101 Firefox/88.0','2021-05-13 12:15:14'),(54,1,12,'users','User has been updated by admin@gmail.com','47.15.5.218 | Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36','2021-05-14 04:27:03'),(55,1,6,'companies','Company has been updated by admin@gmail.com','157.38.226.15 | Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:88.0) Gecko/20100101 Firefox/88.0','2021-05-14 10:45:02');
/*!40000 ALTER TABLE `user_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profiles`
--

DROP TABLE IF EXISTS `user_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_profiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `company_id` int(10) unsigned NOT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alternate_mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_profile_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_profiles_user_id_foreign` (`user_id`),
  KEY `user_profiles_company_id_foreign` (`company_id`),
  CONSTRAINT `user_profiles_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `user_profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profiles`
--

LOCK TABLES `user_profiles` WRITE;
/*!40000 ALTER TABLE `user_profiles` DISABLE KEYS */;
INSERT INTO `user_profiles` VALUES (1,2,1,'7857084424',NULL,'',1,NULL,'2021-03-11 14:44:30',NULL),(2,3,7,'+447678123459',NULL,'',1,1,'2021-03-11 14:59:39','2021-05-13 06:23:46'),(10,1,1,'+441384473000','+441384473000','',1,NULL,'2021-04-13 19:46:39',NULL),(11,11,1,'07449877367',NULL,'',1,NULL,'2021-05-12 11:48:24',NULL),(12,12,3,'+447678123456',NULL,'',1,1,'2021-05-13 10:10:18','2021-05-14 04:27:03');
/*!40000 ALTER TABLE `user_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` smallint(6) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `status` enum('Active','Inactive','Delete') COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'Super Admin','admin@gmail.com',NULL,'$2y$10$CPJgQ5ivzCQw9WkC17cmYuDroLRGJDN6x2ChMp8BjvVGpL96SyetC',NULL,0,'Active',1,NULL,'2021-03-03 14:46:29',NULL),(2,3,'Tomathon','tompearson@homeserverepairs.co.uk',NULL,'$2y$10$Hccb/YmpiGjOW4i9rvPrq./dIdlEZHi7mNkcs4wKk5oJ6EROG.2rW',NULL,0,'Active',1,NULL,'2021-03-11 14:44:30','2021-03-11 14:55:51'),(3,3,'Tomathon 2','thomaspearson@homeserverepairs.co.uk',NULL,'$2y$10$X4uyBWekQxCjY7Al2NVy4uK7zDdMKgg5GMAqMWSKfKhX0WwuXsEyi',NULL,0,'Active',1,1,'2021-03-11 14:59:39','2021-05-13 06:23:46'),(4,2,'madhavi chavan','chavanhfr@gmail.com',NULL,'$2y$10$3scdAOk19G358d8jAb7aEerLJ25lCu3358mSFErj.dUdid6MCmL5S',NULL,0,'Active',1,NULL,'2021-03-15 11:39:56',NULL),(5,5,'kjhk','tuser2@test.com',NULL,'$2y$10$VRYKwwiUBZZdDCUNKm7BdOkbhtX8vYH8Ek6zCtTBq04m4TZyyrNYu',NULL,4,'Active',1,NULL,'2021-03-15 11:56:53',NULL),(6,5,'test supplier','testUser@test.com',NULL,'$2y$10$QIPfjQVBcR8SBpRUfHgNt.5eESbfh1ag2haeTrGGxYDow4o2/I4su',NULL,NULL,'Active',1,NULL,'2021-03-17 14:04:59',NULL),(7,5,'test supplier','testSupplier@test.com',NULL,'$2y$10$IpYMGUG5BHRZBRXRdk3uzuHJebsaorzIuGApihroL9Yf.kfA9TxsS',NULL,NULL,'Active',1,NULL,'2021-03-17 14:07:32',NULL),(8,5,'test supplier','testUser1@test.com',NULL,'$2y$10$fAoDGv9SEdPKPVgI5mTH9u4SMBGJFBPDn1RihRnzU8oif9AE0D2aW',NULL,NULL,'Active',1,NULL,'2021-03-17 14:11:25',NULL),(9,5,'test user','testUser2@test.com',NULL,'$2y$10$vP4asSj7B959oVOGwnhssubiZUIwXJO.v1zhMb6iOSbRJmlfqRFL2',NULL,NULL,'Active',1,NULL,'2021-03-17 14:12:40',NULL),(10,5,'test user','testUser7@test.com',NULL,'$2y$10$77Go.HE0/HLg2VAmDPkc3OCLCD/WZ5QegsuH894ARxk/HaowlWKue',NULL,NULL,'Active',1,NULL,'2021-03-17 14:18:50',NULL),(11,6,'Patrick','patrickmiller@homeserverepairs.co.uk',NULL,'$2y$10$8e0U36tt8ipjJoy87oyveuJdsl.hOE8faMeSumZSbi0Z3MvlD4NR6',NULL,2,'Active',1,NULL,'2021-05-12 11:48:24',NULL),(12,4,'Test User Store 1','testuser1@gmail.com',NULL,'$2y$10$N3rqJ/9fcJGYofPz.Irmd.Iv3/Mm3GI78zsjBM7ziAIZXkwoF1xCO',NULL,0,'Active',1,1,'2021-05-13 10:10:18','2021-05-14 04:27:03');
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

-- Dump completed on 2021-05-17 11:32:16
