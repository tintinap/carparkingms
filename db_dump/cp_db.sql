DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
);

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(14,'customer','buypackage'),(13,'customer','car'),(12,'customer','parking'),(11,'customer','parking_slot'),(7,'customer','parking_zone'),(8,'customer','register_user'),(10,'customer','reservation'),(9,'customer','user_sys'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
);

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add parking_zone',7,'add_parking_zone'),(26,'Can change parking_zone',7,'change_parking_zone'),(27,'Can delete parking_zone',7,'delete_parking_zone'),(28,'Can view parking_zone',7,'view_parking_zone'),(29,'Can add register_user',8,'add_register_user'),(30,'Can change register_user',8,'change_register_user'),(31,'Can delete register_user',8,'delete_register_user'),(32,'Can view register_user',8,'view_register_user'),(33,'Can add user_sys',9,'add_user_sys'),(34,'Can change user_sys',9,'change_user_sys'),(35,'Can delete user_sys',9,'delete_user_sys'),(36,'Can view user_sys',9,'view_user_sys'),(37,'Can add reservation',10,'add_reservation'),(38,'Can change reservation',10,'change_reservation'),(39,'Can delete reservation',10,'delete_reservation'),(40,'Can view reservation',10,'view_reservation'),(41,'Can add parking_slot',11,'add_parking_slot'),(42,'Can change parking_slot',11,'change_parking_slot'),(43,'Can delete parking_slot',11,'delete_parking_slot'),(44,'Can view parking_slot',11,'view_parking_slot'),(45,'Can add parking',12,'add_parking'),(46,'Can change parking',12,'change_parking'),(47,'Can delete parking',12,'delete_parking'),(48,'Can view parking',12,'view_parking'),(49,'Can add car',13,'add_car'),(50,'Can change car',13,'change_car'),(51,'Can delete car',13,'delete_car'),(52,'Can view car',13,'view_car'),(53,'Can add buypackage',14,'add_buypackage'),(54,'Can change buypackage',14,'change_buypackage'),(55,'Can delete buypackage',14,'delete_buypackage'),(56,'Can view buypackage',14,'view_buypackage');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
);

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$bGIy5Q685vqn$uEQ9qYlYo4pIDqBCQwODE0OqCDo3ODn4B5G//YfhHtc=','2020-05-01 19:44:35.067840',0,'nap_','TINNAPAT','PLANGSRI','pltinnapat@gmail.com',0,1,'2020-05-01 19:14:40.902375'),(2,'pbkdf2_sha256$150000$GXHJsxwTTOZb$lELkvWskw9vE1YKwLRtKnuhwGF7gGBm6enoEzTwZeVA=','2020-05-01 19:49:33.252788',1,'admin','poom','parin','60070028@kmitl.ac.th',1,1,'2020-05-01 19:49:08.745982');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
);
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_buypackage`
--

DROP TABLE IF EXISTS `customer_buypackage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_buypackage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `point_added` int(11) NOT NULL,
  `add_date` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_buypackage_user_id_b00f8fc6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `customer_buypackage_user_id_b00f8fc6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_buypackage`
--

LOCK TABLES `customer_buypackage` WRITE;
/*!40000 ALTER TABLE `customer_buypackage` DISABLE KEYS */;
INSERT INTO `customer_buypackage` VALUES (1,480,'2020-05-02 02:16:30.516909',1);
/*!40000 ALTER TABLE `customer_buypackage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_user_sys`
--

DROP TABLE IF EXISTS `customer_user_sys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_user_sys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(2) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `customer_user_sys_user_id_fca4423b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
);/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_user_sys`
--

LOCK TABLES `customer_user_sys` WRITE;
/*!40000 ALTER TABLE `customer_user_sys` DISABLE KEYS */;
INSERT INTO `customer_user_sys` VALUES (1,'re',1);
/*!40000 ALTER TABLE `customer_user_sys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_register_user`
--

DROP TABLE IF EXISTS `customer_register_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_register_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(10) NOT NULL,
  `point` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_register_user_user_id_f1b884ce_fk_customer_user_sys_id` (`user_id`),
  CONSTRAINT `customer_register_user_user_id_f1b884ce_fk_customer_user_sys_id` FOREIGN KEY (`user_id`) REFERENCES `customer_user_sys` (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_register_user`
--

LOCK TABLES `customer_register_user` WRITE;
/*!40000 ALTER TABLE `customer_register_user` DISABLE KEYS */;
INSERT INTO `customer_register_user` VALUES (1,'0891144985',430,1);
/*!40000 ALTER TABLE `customer_register_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_car`
--

DROP TABLE IF EXISTS `customer_car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_car` (
  `car_license_number` varchar(25) NOT NULL,
  `car_brand` varchar(100) NOT NULL,
  `car_model` varchar(100) NOT NULL,
  `car_color` varchar(50) NOT NULL,
  `register_user_id` int(11) NOT NULL,
  PRIMARY KEY (`car_license_number`),
  KEY `customer_car_register_user_id_32acd73c_fk_customer_` (`register_user_id`),
  CONSTRAINT `customer_car_register_user_id_32acd73c_fk_customer_` FOREIGN KEY (`register_user_id`) REFERENCES `customer_register_user` (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_car`
--

LOCK TABLES `customer_car` WRITE;
/*!40000 ALTER TABLE `customer_car` DISABLE KEYS */;
INSERT INTO `customer_car` VALUES ('ad555',"tinnapat\'s mortor",'tnp-x','blue',1);
/*!40000 ALTER TABLE `customer_car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_parking_zone`
--

DROP TABLE IF EXISTS `customer_parking_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_parking_zone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `capacity` int(11) NOT NULL,
  `available` int(11) NOT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_parking_zone`
--

LOCK TABLES `customer_parking_zone` WRITE;
/*!40000 ALTER TABLE `customer_parking_zone` DISABLE KEYS */;
INSERT INTO `customer_parking_zone` VALUES (1,'IT building',10,10);
/*!40000 ALTER TABLE `customer_parking_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_parking_slot`
--

DROP TABLE IF EXISTS `customer_parking_slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_parking_slot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL,
  `parking_zone_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_parking_slo_parking_zone_id_8f331da0_fk_customer_` (`parking_zone_id`),
  CONSTRAINT `customer_parking_slo_parking_zone_id_8f331da0_fk_customer_` FOREIGN KEY (`parking_zone_id`) REFERENCES `customer_parking_zone` (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_parking_slot`
--

LOCK TABLES `customer_parking_slot` WRITE;
/*!40000 ALTER TABLE `customer_parking_slot` DISABLE KEYS */;
INSERT INTO `customer_parking_slot` VALUES (1,1,1),(2,1,1),(3,1,1),(4,1,1),(5,1,1),(6,1,1),(7,1,1),(8,1,1),(9,1,1),(10,1,1);
/*!40000 ALTER TABLE `customer_parking_slot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_parking`
--

DROP TABLE IF EXISTS `customer_parking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_parking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `arrive_at` date DEFAULT NULL,
  `leave_at` date DEFAULT NULL,
  `parking_token` varchar(255) DEFAULT NULL,
  `parking_slot_id` int(11) NOT NULL,
  `parking_zone_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_parking_parking_slot_id_d9c784b1_fk_customer_` (`parking_slot_id`),
  KEY `customer_parking_parking_zone_id_50d950cf_fk_customer_` (`parking_zone_id`),
  CONSTRAINT `customer_parking_parking_slot_id_d9c784b1_fk_customer_` FOREIGN KEY (`parking_slot_id`) REFERENCES `customer_parking_slot` (`id`),
  CONSTRAINT `customer_parking_parking_zone_id_50d950cf_fk_customer_` FOREIGN KEY (`parking_zone_id`) REFERENCES `customer_parking_zone` (`id`)
);

--
-- Dumping data for table `customer_parking`
--

LOCK TABLES `customer_parking` WRITE;
/*!40000 ALTER TABLE `customer_parking` DISABLE KEYS */;
INSERT INTO `customer_parking` VALUES (2,'2020-05-02','2020-05-02','aaa',1,1);
/*!40000 ALTER TABLE `customer_parking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_reservation`
--

DROP TABLE IF EXISTS `customer_reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reserve_status` varchar(2) NOT NULL,
  `reserve_token` varchar(64) NOT NULL,
  `reserve_at` date NOT NULL,
  `point_use` int(11) NOT NULL,
  `register_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_reservation_register_user_id_3a233e64_fk_customer_` (`register_user_id`),
  CONSTRAINT `customer_reservation_register_user_id_3a233e64_fk_customer_` FOREIGN KEY (`register_user_id`) REFERENCES `customer_register_user` (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_reservation`
--

LOCK TABLES `customer_reservation` WRITE;
/*!40000 ALTER TABLE `customer_reservation` DISABLE KEYS */;
INSERT INTO `customer_reservation` VALUES (1,'ca','c9ircvxxt8mdwyb8ntxj0i137d59376b8c7esdfouuwc5','2020-05-02',50,1);
/*!40000 ALTER TABLE `customer_reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_parking_slot_reservation`
--

DROP TABLE IF EXISTS `customer_parking_slot_reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_parking_slot_reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parking_slot_id` int(11) NOT NULL,
  `reservation_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_parking_slot_re_parking_slot_id_reservat_57dcf44e_uniq` (`parking_slot_id`,`reservation_id`),
  KEY `customer_parking_slo_reservation_id_84cc08fb_fk_customer_` (`reservation_id`),
  CONSTRAINT `customer_parking_slo_parking_slot_id_cd85f314_fk_customer_` FOREIGN KEY (`parking_slot_id`) REFERENCES `customer_parking_slot` (`id`),
  CONSTRAINT `customer_parking_slo_reservation_id_84cc08fb_fk_customer_` FOREIGN KEY (`reservation_id`) REFERENCES `customer_reservation` (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_parking_slot_reservation`
--

LOCK TABLES `customer_parking_slot_reservation` WRITE;
/*!40000 ALTER TABLE `customer_parking_slot_reservation` DISABLE KEYS */;
INSERT INTO `customer_parking_slot_reservation` VALUES (1,1,1);
/*!40000 ALTER TABLE `customer_parking_slot_reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-05-01 19:03:23.902977'),(2,'auth','0001_initial','2020-05-01 19:03:30.255546'),(3,'admin','0001_initial','2020-05-01 19:03:50.892288'),(4,'admin','0002_logentry_remove_auto_add','2020-05-01 19:03:54.677420'),(5,'admin','0003_logentry_add_action_flag_choices','2020-05-01 19:03:54.763389'),(6,'contenttypes','0002_remove_content_type_name','2020-05-01 19:04:01.313815'),(7,'auth','0002_alter_permission_name_max_length','2020-05-01 19:04:03.204490'),(8,'auth','0003_alter_user_email_max_length','2020-05-01 19:04:03.617510'),(9,'auth','0004_alter_user_username_opts','2020-05-01 19:04:03.750492'),(10,'auth','0005_alter_user_last_login_null','2020-05-01 19:04:05.363719'),(11,'auth','0006_require_contenttypes_0002','2020-05-01 19:04:05.447742'),(12,'auth','0007_alter_validators_add_error_messages','2020-05-01 19:04:05.550726'),(13,'auth','0008_alter_user_username_max_length','2020-05-01 19:04:07.086259'),(14,'auth','0009_alter_user_last_name_max_length','2020-05-01 19:04:11.350381'),(15,'auth','0010_alter_group_name_max_length','2020-05-01 19:04:11.920381'),(16,'auth','0011_update_proxy_permissions','2020-05-01 19:04:12.119408'),(17,'customer','0001_initial','2020-05-01 19:04:17.564776'),(18,'sessions','0001_initial','2020-05-01 19:04:48.607477');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;