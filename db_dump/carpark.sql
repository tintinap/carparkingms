-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: carparkingms
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add reservation',7,'add_reservation'),(26,'Can change reservation',7,'change_reservation'),(27,'Can delete reservation',7,'delete_reservation'),(28,'Can view reservation',7,'view_reservation'),(29,'Can add parking',8,'add_parking'),(30,'Can change parking',8,'change_parking'),(31,'Can delete parking',8,'delete_parking'),(32,'Can view parking',8,'view_parking'),(33,'Can add parking_slot',9,'add_parking_slot'),(34,'Can change parking_slot',9,'change_parking_slot'),(35,'Can delete parking_slot',9,'delete_parking_slot'),(36,'Can view parking_slot',9,'view_parking_slot'),(37,'Can add parking_zone',10,'add_parking_zone'),(38,'Can change parking_zone',10,'change_parking_zone'),(39,'Can delete parking_zone',10,'delete_parking_zone'),(40,'Can view parking_zone',10,'view_parking_zone'),(41,'Can add user',11,'add_user'),(42,'Can change user',11,'change_user'),(43,'Can delete user',11,'delete_user'),(44,'Can view user',11,'view_user'),(45,'Can add register_user',12,'add_register_user'),(46,'Can change register_user',12,'change_register_user'),(47,'Can delete register_user',12,'delete_register_user'),(48,'Can view register_user',12,'view_register_user'),(49,'Can add car',13,'add_car'),(50,'Can change car',13,'change_car'),(51,'Can delete car',13,'delete_car'),(52,'Can view car',13,'view_car'),(53,'Can add user_sys',11,'add_user_sys'),(54,'Can change user_sys',11,'change_user_sys'),(55,'Can delete user_sys',11,'delete_user_sys'),(56,'Can view user_sys',11,'view_user_sys'),(57,'Can add regist_user',14,'add_regist_user'),(58,'Can change regist_user',14,'change_regist_user'),(59,'Can delete regist_user',14,'delete_regist_user'),(60,'Can view regist_user',14,'view_regist_user'),(61,'Can add user',15,'add_user'),(62,'Can change user',15,'change_user'),(63,'Can delete user',15,'delete_user'),(64,'Can view user',15,'view_user');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$CY9jVaWq5n55$7L3TmFMoWQCQ7xM3HcMrc7aYN5zgnqEN6IxsEUI21Js=','2019-04-29 13:16:27.579084',1,'qwe','poom','net','pp@pp.com',1,1,'2019-04-22 13:29:53.045133'),(25,'pbkdf2_sha256$150000$coJPXCLbqJNp$leW1n1Tp9GAR28xIgKaLF9UcdtGsrz/Hgl8PcHgB+ac=','2019-05-01 16:59:53.516565',0,'1234','ooo','ppp','pp@dd1.com',0,1,'2019-04-23 17:23:36.705670'),(26,'pbkdf2_sha256$150000$wPbNmkqO9M4e$wTpdioRqWHsEigc0J+Jt6/W1KTds0JkpYK+Rny/Dlu4=',NULL,0,'321','','','pp@dd.com',0,1,'2019-04-23 17:25:05.541615'),(27,'pbkdf2_sha256$150000$ta4XtKb2yWi2$F6n+G90jlvsyw1xf9hU9Xs9nORTaUKfYU0toP4hMILo=',NULL,0,'qq','','','qq',0,1,'2019-04-23 17:26:09.617591'),(28,'pbkdf2_sha256$150000$3PYR6xMq5TYg$ncRCmZcdzz7rHd4bFrQpsKnSNLUhjaztMqoPGkv6gh0=',NULL,0,'q','','','pp@dd.com',0,1,'2019-04-24 17:13:11.293609'),(29,'pbkdf2_sha256$150000$aX10warD7tIg$erpV0wvsTufB2GC1HExOYU/JSK2LXYpxXe85sJ8ky/A=',NULL,0,'qqq','','','pp@dd.com',0,1,'2019-04-24 17:14:31.933520'),(30,'pbkdf2_sha256$150000$OlThrCgG5Xtj$ZXvyn+RcNQivXmV1lKJR1vD2OOTKCTFRUilQ/Ci8Xtw=','2019-05-03 14:29:24.272726',0,'123','kk','l;','pnet10@gmail.com',0,1,'2019-05-01 16:39:09.579703');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_car`
--

DROP TABLE IF EXISTS `customer_car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer_car` (
  `car_license_number` varchar(25) NOT NULL,
  `car_brand` varchar(100) NOT NULL,
  `car_model` varchar(100) NOT NULL,
  `car_color` varchar(50) NOT NULL,
  `register_user_id` int(11) NOT NULL,
  PRIMARY KEY (`car_license_number`),
  KEY `customer_car_register_user_id_32acd73c_fk_customer_` (`register_user_id`),
  CONSTRAINT `customer_car_register_user_id_32acd73c_fk_customer_` FOREIGN KEY (`register_user_id`) REFERENCES `customer_register_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_car`
--

LOCK TABLES `customer_car` WRITE;
/*!40000 ALTER TABLE `customer_car` DISABLE KEYS */;
INSERT INTO `customer_car` VALUES ('1','1','1','1',5),('11','ppp','q','q',9),('123','123','123','123',10),('1กค 3416','BMW','i8','ขาว',1),('hh','ok','ii','gg',5),('ii','oo','oop','lll',5),('qq','qq','qq','qq',7),('qq 1234','123','123','123',6),('qwe','qwe','qwe','qwe',5),('กด 1234','ppp','ii','ดำ',5),('บฉ 7476','Lamborghini','Centenarion','ส้ม',1);
/*!40000 ALTER TABLE `customer_car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_parking`
--

DROP TABLE IF EXISTS `customer_parking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer_parking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `arrive_at` date DEFAULT NULL,
  `leave_at` date DEFAULT NULL,
  `parking_slot_id` int(11) NOT NULL,
  `parking_zone_id` int(11) NOT NULL,
  `parking_token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_parking_parking_slot_id_d9c784b1_fk_customer_` (`parking_slot_id`),
  KEY `customer_parking_parking_zone_id_50d950cf_fk_customer_` (`parking_zone_id`),
  CONSTRAINT `customer_parking_parking_slot_id_d9c784b1_fk_customer_` FOREIGN KEY (`parking_slot_id`) REFERENCES `customer_parking_slot` (`id`),
  CONSTRAINT `customer_parking_parking_zone_id_50d950cf_fk_customer_` FOREIGN KEY (`parking_zone_id`) REFERENCES `customer_parking_zone` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_parking`
--

LOCK TABLES `customer_parking` WRITE;
/*!40000 ALTER TABLE `customer_parking` DISABLE KEYS */;
INSERT INTO `customer_parking` VALUES (1,NULL,NULL,2,1,NULL),(2,NULL,NULL,3,1,NULL),(3,NULL,NULL,4,1,NULL),(4,NULL,NULL,5,1,NULL),(5,NULL,NULL,6,1,NULL),(6,NULL,NULL,7,1,NULL),(7,NULL,NULL,8,1,NULL),(8,NULL,NULL,9,1,NULL),(9,NULL,NULL,10,1,NULL),(10,NULL,NULL,11,1,NULL),(11,NULL,NULL,12,1,NULL),(12,NULL,NULL,13,1,NULL),(13,NULL,NULL,14,1,NULL),(14,NULL,NULL,15,1,NULL),(15,NULL,NULL,16,1,NULL),(16,NULL,NULL,17,1,NULL),(17,NULL,NULL,18,1,NULL),(18,NULL,NULL,19,1,NULL),(19,NULL,NULL,20,1,NULL),(20,NULL,NULL,21,1,NULL),(21,NULL,NULL,22,1,NULL),(22,NULL,NULL,23,1,NULL),(23,NULL,NULL,24,1,NULL),(24,NULL,NULL,25,1,NULL),(25,NULL,NULL,26,1,NULL),(26,NULL,NULL,27,1,NULL),(27,NULL,NULL,28,1,NULL),(28,NULL,NULL,29,1,NULL),(29,NULL,NULL,30,1,NULL),(30,NULL,NULL,31,1,NULL),(31,NULL,NULL,32,1,NULL),(32,NULL,NULL,33,1,NULL),(33,NULL,NULL,34,1,NULL),(34,NULL,NULL,35,1,NULL),(35,NULL,NULL,36,1,NULL),(36,NULL,NULL,37,1,NULL),(37,NULL,NULL,38,1,NULL),(38,NULL,NULL,39,1,NULL),(39,NULL,NULL,40,1,NULL),(40,NULL,NULL,41,1,NULL),(41,NULL,NULL,42,1,NULL),(42,NULL,NULL,43,1,NULL),(43,NULL,NULL,44,1,NULL),(44,NULL,NULL,45,1,NULL),(45,NULL,NULL,46,1,NULL),(46,NULL,NULL,47,1,NULL),(47,NULL,NULL,48,1,NULL),(48,NULL,NULL,49,1,NULL),(49,NULL,NULL,50,1,NULL),(50,NULL,NULL,1,1,NULL),(51,NULL,NULL,2,1,NULL),(52,NULL,NULL,3,1,NULL),(53,NULL,NULL,4,1,NULL),(54,NULL,NULL,5,1,NULL),(55,NULL,NULL,6,1,NULL);
/*!40000 ALTER TABLE `customer_parking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_parking_slot`
--

DROP TABLE IF EXISTS `customer_parking_slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer_parking_slot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL,
  `parking_zone_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_parking_slo_parking_zone_id_8f331da0_fk_customer_` (`parking_zone_id`),
  CONSTRAINT `customer_parking_slo_parking_zone_id_8f331da0_fk_customer_` FOREIGN KEY (`parking_zone_id`) REFERENCES `customer_parking_zone` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_parking_slot`
--

LOCK TABLES `customer_parking_slot` WRITE;
/*!40000 ALTER TABLE `customer_parking_slot` DISABLE KEYS */;
INSERT INTO `customer_parking_slot` VALUES (1,0,1),(2,0,1),(3,0,1),(4,0,1),(5,0,1),(6,0,1),(7,1,1),(8,1,1),(9,1,1),(10,1,1),(11,1,1),(12,1,1),(13,1,1),(14,1,1),(15,1,1),(16,1,1),(17,1,1),(18,1,1),(19,1,1),(20,1,1),(21,1,1),(22,1,1),(23,1,1),(24,1,1),(25,1,1),(26,1,1),(27,1,1),(28,1,1),(29,1,1),(30,1,1),(31,1,1),(32,1,1),(33,1,1),(34,1,1),(35,1,1),(36,1,1),(37,1,1),(38,1,1),(39,1,1),(40,1,1),(41,1,1),(42,1,1),(43,1,1),(44,1,1),(45,1,1),(46,1,1),(47,1,1),(48,1,1),(49,1,1),(50,0,1),(51,1,1),(52,1,1),(53,1,1),(54,1,1);
/*!40000 ALTER TABLE `customer_parking_slot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_parking_slot_reservation`
--

DROP TABLE IF EXISTS `customer_parking_slot_reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer_parking_slot_reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parking_slot_id` int(11) NOT NULL,
  `reservation_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_parking_slot_re_parking_slot_id_reservat_57dcf44e_uniq` (`parking_slot_id`,`reservation_id`),
  KEY `customer_parking_slo_reservation_id_84cc08fb_fk_customer_` (`reservation_id`),
  CONSTRAINT `customer_parking_slo_parking_slot_id_cd85f314_fk_customer_` FOREIGN KEY (`parking_slot_id`) REFERENCES `customer_parking_slot` (`id`),
  CONSTRAINT `customer_parking_slo_reservation_id_84cc08fb_fk_customer_` FOREIGN KEY (`reservation_id`) REFERENCES `customer_reservation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_parking_slot_reservation`
--

LOCK TABLES `customer_parking_slot_reservation` WRITE;
/*!40000 ALTER TABLE `customer_parking_slot_reservation` DISABLE KEYS */;
INSERT INTO `customer_parking_slot_reservation` VALUES (1,1,1),(5,4,56),(6,5,57),(7,6,58),(2,52,51),(3,53,52),(4,54,53);
/*!40000 ALTER TABLE `customer_parking_slot_reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_parking_zone`
--

DROP TABLE IF EXISTS `customer_parking_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer_parking_zone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `capacity` int(11) NOT NULL,
  `available` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_parking_zone`
--

LOCK TABLES `customer_parking_zone` WRITE;
/*!40000 ALTER TABLE `customer_parking_zone` DISABLE KEYS */;
INSERT INTO `customer_parking_zone` VALUES (1,'คณะเทคโนโลยีสารสนเทศ',50,43);
/*!40000 ALTER TABLE `customer_parking_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_regist_user`
--

DROP TABLE IF EXISTS `customer_regist_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer_regist_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `user_fname` varchar(255) NOT NULL,
  `user_lname` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  `point` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_regist_user_user_id_331af440_fk_customer_user_sys_id` (`user_id`),
  CONSTRAINT `customer_regist_user_user_id_331af440_fk_customer_user_sys_id` FOREIGN KEY (`user_id`) REFERENCES `customer_user_sys` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_regist_user`
--

LOCK TABLES `customer_regist_user` WRITE;
/*!40000 ALTER TABLE `customer_regist_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_regist_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_register_user`
--

DROP TABLE IF EXISTS `customer_register_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer_register_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `point` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_register_user_user_id_f1b884ce_fk_customer_user_sys_id` (`user_id`),
  CONSTRAINT `customer_register_user_user_id_f1b884ce_fk_customer_user_sys_id` FOREIGN KEY (`user_id`) REFERENCES `customer_user_sys` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_register_user`
--

LOCK TABLES `customer_register_user` WRITE;
/*!40000 ALTER TABLE `customer_register_user` DISABLE KEYS */;
INSERT INTO `customer_register_user` VALUES (1,'0987654321',1,300),(5,'850466221',6,-1540),(6,'850466272',7,3620),(7,'850466272',8,0),(8,'850466272',9,0),(9,'850466272',10,0),(10,'987654321',11,-250);
/*!40000 ALTER TABLE `customer_register_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_reservation`
--

DROP TABLE IF EXISTS `customer_reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer_reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reserve_status` varchar(2) NOT NULL,
  `reserve_token` varchar(64) NOT NULL,
  `reserve_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_reservation`
--

LOCK TABLES `customer_reservation` WRITE;
/*!40000 ALTER TABLE `customer_reservation` DISABLE KEYS */;
INSERT INTO `customer_reservation` VALUES (1,'re','pgvqxgex498rjph9g7i6gul4r0qlxnmevv47kshmqge','2019-04-30'),(2,'re','2d9ud1b10oph7d74xujhxi79fz89hiljt18b70ryi8lc','2019-05-01'),(3,'re','r3s9d7ao3gckuczlqrf7f9tg5nqzd4lqds1kf2cay99','2019-05-01'),(4,'re','l23mlm3pvag1yj0nyatikwxvi9o4xv569rs0o7700shn','2019-05-01'),(5,'re','fd3eesmth1lfm25nccldeerclwzb3zpipbzu1f2ghg7','2019-05-01'),(6,'re','fxp9n4c5n0b3snck8vqtskbd57pdt1maa7hnsgxqng8s','2019-05-01'),(7,'re','hjuw24u6z4qd4t1ujl80h4cv7ysrpvpi8lmqfzak1lx','2019-05-01'),(8,'re','8wn9eqsplpqydi9v5fcp992nm6w4mviwcwx0ywvei2','2019-05-01'),(9,'re','iiuw5sd5hllkbj3x80polswfh24dathsbezw73jb5tc','2019-05-01'),(10,'re','xja46st1zogmgl5w9ab8xcz8qf0wid9ly3jjkml8pgd','2019-05-01'),(11,'re','9ybs2nnk5w6jxak5cigwqj1ecixnh0mn51yfob2ura','2019-05-01'),(12,'re','hx18hsysrzwcwpb7bzbm604r9zdriwrtw9a3ndwr9emv','2019-05-01'),(13,'re','a3m44t4zl9cv26kdcjabnj9jgp7xngylfmt5o5nflw0k','2019-05-01'),(14,'re','ih7qc8lnqbjvvstv46aw1l97oful9f6ql3ak4fw8w8','2019-05-01'),(15,'re','vuiap6ozwrl25w68luriqpzv9eaby6c0nll9y1sa38p','2019-05-01'),(16,'re','ge1ullsbo3t3sshvf9yoxl0eznlic26lhkxqu2xdhfxi','2019-05-01'),(17,'re','0yu5uw050x6n9ofsgkdkiazwmntka5jcrp3ulkfsig','2019-05-01'),(18,'re','oxaotuvie0iwx93mxndruookn3hwx0n3jy4b7llfj9v','2019-05-01'),(19,'re','p5w6a87mfs7uf6cfg5ru6473hdqv2d9fju7l3xfbml','2019-05-01'),(20,'re','3oj5cxreglmbet5dh2b7x49rw8s07wtc6yw013j7v4','2019-05-01'),(21,'re','59a4013sorln343ktcjtbdrlae8jpzsspgrlyacdaym','2019-05-01'),(22,'re','a6nw1vqtjjk4oxoyvjvnms95ubyz5as0kuv1365205p','2019-05-01'),(23,'re','egab6va7n7f0i8lbc03edckpjxsf6z0iekg6lau70f8q','2019-05-01'),(24,'re','6e81kx2blpag3h2w1dfwp2mdbfnv6jt7o71kmcavew','2019-05-01'),(25,'re','igysyn62aka3atlanel9o3y8ohj6omttcmite1v469w','2019-05-01'),(26,'re','vnyzzhthix05u1jg59lky3ojkrt6zglt88kxga9mvrz9','2019-05-01'),(27,'re','1qm8xmg0o9fza76gyhvlyly63voq3ioifjtbdz8bf5rp','2019-05-01'),(28,'re','a1oxgabpvncw3v9d6fve7rzs0w0jo8jobkoy8mfs7eu8','2019-05-01'),(29,'re','5kb8ts5veaq24kulmi4plek20rbtsy5l5ej5hfcv4m6','2019-05-01'),(30,'re','szoet8oldq7u7rxrxt3yb3nxsmwtxjlh1lwx32pi5z6','2019-05-01'),(31,'re','40nh34pl4dbug0bgejs25mi6yymlh7rg65kr5eh7f9','2019-05-01'),(32,'re','33pcsq0hentib3bevsv1cb9z2z71r63bdt19gug89gh','2019-05-01'),(33,'re','76y8msguqwvbhzz7w4n9yha2f3zl3jk76rxyg75xtqa','2019-05-01'),(34,'re','393gu5ck9e7zaai8co37hdvkotjhxwvrtp50nmew2qyl','2019-05-01'),(35,'re','q9yq775sfiqc4ncsvrumc4sn4n273h8sfq88w2a5laqi','2019-05-01'),(36,'re','7a279ujekh3f10viyzdub7th92d9wrc2jqr83rzsnskr','2019-05-01'),(37,'re','y0nr2j1ye5iy4kr46pzhtjogdvj2d0jsp3tnaxp6f9b','2019-05-01'),(38,'re','ivmgl31z4pe8442ctybtuhn722ukgajd7uat3bmufph','2019-05-01'),(39,'re','gq209kwmuomahhazsw6v7yd14tqmlh9k2lbz4d6mutv','2019-05-01'),(40,'re','9cjokrwylalzyoz2bxxv1rjglg4gz1zvr15e77erophy','2019-05-01'),(41,'re','amsix2jowv5pv2s1wclooemmwbfj2t8kppkvizwvobb','2019-05-01'),(42,'re','3xi3mcrkwgs0q8skczmndpcv66324iati850labc6ymc','2019-05-01'),(43,'re','2179l14rzowieu0so3lpozqlnnwnkmyjmreuaj6np6j','2019-05-01'),(44,'re','ogqdzf69hx91dfu5bwq2mo1js2ve8ajizrvvc50u0om','2019-05-01'),(45,'re','k1qozqbjtvu5aspc4csgtq5ajplsi96desp4lv1','2019-05-01'),(46,'re','2c02dciefn44evn5upzf8b8v0myeb7s6961wvqlvi6a','2019-05-01'),(47,'re','rjm7je1csnsgckspoa3jtezzxtoakyexu69fazgau','2019-05-01'),(48,'re','yp40tgf3h1na77e7jfrceopt79cqsywe97d1mc56rvl','2019-05-01'),(49,'re','0j63y25bcd2p6wu9ra1adf5t0lchlqj5ipc6mwetg7wo','2019-05-01'),(50,'re','aaa','2009-09-10'),(51,'re','aaa','2009-09-10'),(52,'re','aaa','2009-09-10'),(53,'re','aaa','2009-09-10'),(54,'re','9ff7ficfu357gpw8s71mp7kbtn3uvdfwpnos8clba8i','2019-05-04'),(55,'re','okltiii9qdsbi1he6so9vpfrw4tehnkqo7n17ucwgmo6','2019-05-04'),(56,'re','ndfw2vnkdye65d4q0vvnjxd9j7sg4qravryiqssnaph9','2019-05-04'),(57,'re','oiyqyal0kmgmmdub41gvljg4whf25yigrzg6voiofdnc','2019-05-04'),(58,'re','2o5xpa6gyy40renvat6sfck66o4xiirj8t1ocdu38f308','2019-05-04');
/*!40000 ALTER TABLE `customer_reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_user`
--

DROP TABLE IF EXISTS `customer_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_user`
--

LOCK TABLES `customer_user` WRITE;
/*!40000 ALTER TABLE `customer_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_user_sys`
--

DROP TABLE IF EXISTS `customer_user_sys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer_user_sys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(2) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `customer_user_user_id_2e11954c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_user_sys`
--

LOCK TABLES `customer_user_sys` WRITE;
/*!40000 ALTER TABLE `customer_user_sys` DISABLE KEYS */;
INSERT INTO `customer_user_sys` VALUES (1,'re',1),(6,'gu',25),(7,'re',26),(8,'re',27),(9,'re',28),(10,'re',29),(11,'re',30);
/*!40000 ALTER TABLE `customer_user_sys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(13,'customer','car'),(8,'customer','parking'),(9,'customer','parking_slot'),(10,'customer','parking_zone'),(14,'customer','regist_user'),(12,'customer','register_user'),(7,'customer','reservation'),(15,'customer','user'),(11,'customer','user_sys'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-04-22 04:02:16.842770'),(2,'auth','0001_initial','2019-04-22 04:02:17.244318'),(3,'admin','0001_initial','2019-04-22 04:02:18.455326'),(4,'admin','0002_logentry_remove_auto_add','2019-04-22 04:02:18.832090'),(5,'admin','0003_logentry_add_action_flag_choices','2019-04-22 04:02:18.855216'),(6,'contenttypes','0002_remove_content_type_name','2019-04-22 04:02:19.090486'),(7,'auth','0002_alter_permission_name_max_length','2019-04-22 04:02:19.226075'),(8,'auth','0003_alter_user_email_max_length','2019-04-22 04:02:19.277210'),(9,'auth','0004_alter_user_username_opts','2019-04-22 04:02:19.297157'),(10,'auth','0005_alter_user_last_login_null','2019-04-22 04:02:19.426508'),(11,'auth','0006_require_contenttypes_0002','2019-04-22 04:02:19.433376'),(12,'auth','0007_alter_validators_add_error_messages','2019-04-22 04:02:19.442471'),(13,'auth','0008_alter_user_username_max_length','2019-04-22 04:02:19.598290'),(14,'auth','0009_alter_user_last_name_max_length','2019-04-22 04:02:19.787336'),(15,'auth','0010_alter_group_name_max_length','2019-04-22 04:02:19.848093'),(16,'auth','0011_update_proxy_permissions','2019-04-22 04:02:19.862866'),(17,'sessions','0001_initial','2019-04-22 04:02:19.916465'),(18,'customer','0001_initial','2019-04-22 04:03:43.682860'),(19,'customer','0002_register_user_point','2019-04-22 13:46:44.021103'),(20,'customer','0003_register_user_email','2019-04-23 11:13:28.850326'),(21,'customer','0004_auto_20190423_2350','2019-04-23 16:50:32.526056'),(22,'customer','0005_auto_20190428_1445','2019-04-28 07:45:45.575876'),(23,'customer','0006_auto_20190430_1622','2019-04-30 09:23:02.613044'),(24,'customer','0007_regist_user','2019-05-03 06:11:18.148391'),(25,'customer','0008_auto_20190503_1321','2019-05-03 06:21:36.457376'),(26,'customer','0009_user','2019-05-03 06:29:06.388878'),(27,'customer','0010_parking_parking_token','2019-05-04 04:50:02.326049');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0uzybhl7sv4m5xdcaq5wdprdnzuo4cwv','N2MwZTJiMDVhODJiOTY3YzU1ZWY3YzI0YzA3OGZjZTBlNTQyYmI0ZTp7Il9hdXRoX3VzZXJfaWQiOiIzMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzE5OTM1OWEyYzUzMThiYTc0YWNjZjlkZWYxNTk4MmVjOGU4MjZjYSJ9','2019-05-17 14:29:24.279759'),('6x036meo9qraoeij9dr89pg1nncw0p14','OTU3NjVhOGU4NDJhZmQyNDFkOGYzYmUwZGY0ZTI1NWQ0YjljZTEyMTp7fQ==','2019-05-16 07:30:55.514330'),('aknggjpnrkdal6vrrj81ghtkg0trp68t','ZjE0OWRjYmI2MTA4NzAzZjcxOTQ0NmE0Y2ZmZTkxZjBhYzU1YWEwYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OGQyMWE1Zjk1Yjg3NzI4NmNlYTA5NDUxZGM5Y2YwNGMyZjRhZmI0In0=','2019-05-13 13:16:27.589875'),('edcqcp4ay5vtnajii4j2iba8zpf96zzx','Y2VmYTcxNzI0NDE2ZjQzYmNiN2ZkY2JhYjhjNzJiZTUwYTAxNTBjZDp7Il9hdXRoX3VzZXJfaWQiOiIyNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjliOGM4MjNiMjBiZTE2OWM0MTZiMDRiODhiZjEyMDcwZDc1ZTE0YyJ9','2019-05-13 14:09:40.631707'),('mt8ybtniccs5dg7uw3bcs1qodhyx0bt0','ZjE0OWRjYmI2MTA4NzAzZjcxOTQ0NmE0Y2ZmZTkxZjBhYzU1YWEwYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OGQyMWE1Zjk1Yjg3NzI4NmNlYTA5NDUxZGM5Y2YwNGMyZjRhZmI0In0=','2019-05-07 10:27:13.492992'),('papppth9jvqyslmztw3a1pfigjd6rivu','ZjE0OWRjYmI2MTA4NzAzZjcxOTQ0NmE0Y2ZmZTkxZjBhYzU1YWEwYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OGQyMWE1Zjk1Yjg3NzI4NmNlYTA5NDUxZGM5Y2YwNGMyZjRhZmI0In0=','2019-05-06 15:08:09.436207'),('vix00xxs7nzqvjeaea3zs7dcgv8cqktd','OTU3NjVhOGU4NDJhZmQyNDFkOGYzYmUwZGY0ZTI1NWQ0YjljZTEyMTp7fQ==','2019-05-16 07:30:15.277703'),('wdyk8q26kqd8qtwwi4e4rw927cdutyul','Y2VmYTcxNzI0NDE2ZjQzYmNiN2ZkY2JhYjhjNzJiZTUwYTAxNTBjZDp7Il9hdXRoX3VzZXJfaWQiOiIyNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjliOGM4MjNiMjBiZTE2OWM0MTZiMDRiODhiZjEyMDcwZDc1ZTE0YyJ9','2019-05-13 16:20:35.482516');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-04 20:52:07
