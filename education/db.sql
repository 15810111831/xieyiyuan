-- MySQL dump 10.13  Distrib 8.0.12, for osx10.13 (x86_64)
--
-- Host: 127.0.0.1    Database: teach
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
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
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add 授课科目',6,'add_subject'),(17,'Can change 授课科目',6,'change_subject'),(18,'Can delete 授课科目',6,'delete_subject'),(19,'Can add 授课科目',7,'add_price'),(20,'Can change 授课科目',7,'change_price'),(21,'Can delete 授课科目',7,'delete_price'),(22,'Can add 区县',8,'add_district'),(23,'Can change 区县',8,'change_district'),(24,'Can delete 区县',8,'delete_district'),(25,'Can add 身份',9,'add_position'),(26,'Can change 身份',9,'change_position'),(27,'Can delete 身份',9,'delete_position'),(28,'Can add 教师信息',10,'add_teacherprofile'),(29,'Can change 教师信息',10,'change_teacherprofile'),(30,'Can delete 教师信息',10,'delete_teacherprofile'),(31,'Can add 学生信息',11,'add_studentprofile'),(32,'Can change 学生信息',11,'change_studentprofile'),(33,'Can delete 学生信息',11,'delete_studentprofile'),(34,'Can add user',12,'add_user'),(35,'Can change user',12,'change_user'),(36,'Can delete user',12,'delete_user'),(37,'Can add 授课方式',13,'add_way'),(38,'Can change 授课方式',13,'change_way'),(39,'Can delete 授课方式',13,'delete_way'),(40,'Can add Token',14,'add_token'),(41,'Can change Token',14,'change_token'),(42,'Can delete Token',14,'delete_token'),(43,'Can add 学校',15,'add_school'),(44,'Can change 学校',15,'change_school'),(45,'Can delete 学校',15,'delete_school'),(46,'Can add (u\'\\u5e74\\u7ea7\',)',16,'add_grade'),(47,'Can change (u\'\\u5e74\\u7ea7\',)',16,'change_grade'),(48,'Can delete (u\'\\u5e74\\u7ea7\',)',16,'delete_grade'),(49,'Can add 请家教-下单',17,'add_engage'),(50,'Can change 请家教-下单',17,'change_engage'),(51,'Can delete 请家教-下单',17,'delete_engage'),(52,'Can add 文章类别',18,'add_articletype'),(53,'Can change 文章类别',18,'change_articletype'),(54,'Can delete 文章类别',18,'delete_articletype'),(55,'Can add 文章',19,'add_article'),(56,'Can change 文章',19,'change_article'),(57,'Can delete 文章',19,'delete_article'),(58,'Can add 评论',20,'add_comment'),(59,'Can change 评论',20,'change_comment'),(60,'Can delete 评论',20,'delete_comment'),(61,'Can add (u\'\\u9009\\u62e9\\u6559\\u5e08\',)',21,'add_choiceteacher'),(62,'Can change (u\'\\u9009\\u62e9\\u6559\\u5e08\',)',21,'change_choiceteacher'),(63,'Can delete (u\'\\u9009\\u62e9\\u6559\\u5e08\',)',21,'delete_choiceteacher'),(64,'Can add 教师评价',22,'add_usercomment'),(65,'Can change 教师评价',22,'change_usercomment'),(66,'Can delete 教师评价',22,'delete_usercomment');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
INSERT INTO `authtoken_token` VALUES ('715958c991d8b1c7bc29a5cc77474d690075fcf1','2019-04-11 01:55:56.794015',15),('b9643770e2083615beaf8dd0b5018a58b812d690','2019-04-09 02:39:23.311561',1),('cdd506b61aa1a6c726d703659377783a37001a23','2019-04-11 03:30:49.949819',20),('fd61061d744d510548700ccfbbd2b4576a9799e8','2019-04-28 06:50:52.210986',22);
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
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
  KEY `django_admin_log_user_id_c564eba6_fk_users_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-04-08 08:20:27.044869','1','海淀',1,'[{\"added\": {}}]',8,1),(2,'2019-04-08 08:20:30.002542','2','朝阳',1,'[{\"added\": {}}]',8,1),(3,'2019-04-08 08:20:32.572705','3','东城',1,'[{\"added\": {}}]',8,1),(4,'2019-04-08 08:20:35.116868','4','西城',1,'[{\"added\": {}}]',8,1),(5,'2019-04-08 08:20:56.706176','5','丰台',1,'[{\"added\": {}}]',8,1),(6,'2019-04-08 08:21:00.149201','6','石景山',1,'[{\"added\": {}}]',8,1),(7,'2019-04-08 08:21:17.087662','7','房山',1,'[{\"added\": {}}]',8,1),(8,'2019-04-08 08:21:20.583214','8','门头沟',1,'[{\"added\": {}}]',8,1),(9,'2019-04-08 08:21:23.382372','9','通州',1,'[{\"added\": {}}]',8,1),(10,'2019-04-08 08:21:26.138884','10','昌平',1,'[{\"added\": {}}]',8,1),(11,'2019-04-08 08:21:33.828285','11','顺义',1,'[{\"added\": {}}]',8,1),(12,'2019-04-08 08:21:37.918045','12','怀柔',1,'[{\"added\": {}}]',8,1),(13,'2019-04-08 08:21:42.110135','13','密云',1,'[{\"added\": {}}]',8,1),(14,'2019-04-08 08:21:46.843367','14','延庆',1,'[{\"added\": {}}]',8,1),(15,'2019-04-08 08:21:50.753240','15','平谷',1,'[{\"added\": {}}]',8,1),(16,'2019-04-08 08:22:02.890584','16','大兴',1,'[{\"added\": {}}]',8,1),(17,'2019-04-08 08:23:43.087156','1','本人上门',1,'[{\"added\": {}}]',13,1),(18,'2019-04-08 08:23:46.795697','2','学生上门',1,'[{\"added\": {}}]',13,1),(19,'2019-04-08 08:24:09.147211','3','网上辅导',1,'[{\"added\": {}}]',13,1),(20,'2019-04-08 08:26:19.946612','1','300元–800元/每小时 300/小时',1,'[{\"added\": {}}]',7,1),(21,'2019-04-08 08:26:33.322912','2','350-500元一小时 350/小时',1,'[{\"added\": {}}]',7,1),(22,'2019-04-08 08:27:01.420193','3','600元每小时，竞赛课另议 600/小时',1,'[{\"added\": {}}]',7,1),(23,'2019-04-08 08:27:26.858711','4','300-500元/小时 300/小时',1,'[{\"added\": {}}]',7,1),(24,'2019-04-11 07:20:17.512609','20','teacher2',2,'[{\"changed\": {\"fields\": [\"position\"], \"object\": \"\\u8d75\\u8001\\u5e08\", \"name\": \"\\u6559\\u5e08\\u4fe1\\u606f\"}}]',12,1),(25,'2019-04-11 07:23:35.247684','20','teacher2',2,'[{\"changed\": {\"fields\": [\"position\"], \"object\": \"\\u8d75\\u8001\\u5e08\", \"name\": \"\\u6559\\u5e08\\u4fe1\\u606f\"}}]',12,1),(26,'2019-04-11 09:14:48.771221','1','幼儿',1,'[{\"added\": {}}]',16,1),(27,'2019-04-11 09:14:52.705457','2','一年级',1,'[{\"added\": {}}]',16,1),(28,'2019-04-11 09:14:54.999354','3','二年级',1,'[{\"added\": {}}]',16,1),(29,'2019-04-11 09:14:57.603653','4','三年级',1,'[{\"added\": {}}]',16,1),(30,'2019-04-11 09:14:59.372530','5','四年级',1,'[{\"added\": {}}]',16,1),(31,'2019-04-11 09:15:01.826219','6','五年级',1,'[{\"added\": {}}]',16,1),(32,'2019-04-11 09:15:05.865772','7','六年级',1,'[{\"added\": {}}]',16,1),(33,'2019-04-11 09:15:17.427697','8','初一',1,'[{\"added\": {}}]',16,1),(34,'2019-04-11 09:15:20.101118','9','初二',1,'[{\"added\": {}}]',16,1),(35,'2019-04-11 09:15:21.851373','10','初三',1,'[{\"added\": {}}]',16,1),(36,'2019-04-11 09:15:24.682837','11','高一',1,'[{\"added\": {}}]',16,1),(37,'2019-04-11 09:15:27.073176','12','高二',1,'[{\"added\": {}}]',16,1),(38,'2019-04-11 09:15:28.933432','13','高三',1,'[{\"added\": {}}]',16,1),(39,'2019-04-11 09:15:51.263512','14','三校生',1,'[{\"added\": {}}]',16,1),(40,'2019-04-11 09:15:54.269598','15','自考生',1,'[{\"added\": {}}]',16,1),(41,'2019-04-11 09:16:03.848549','16','大一',1,'[{\"added\": {}}]',16,1),(42,'2019-04-11 09:16:05.103794','17','大二',1,'[{\"added\": {}}]',16,1),(43,'2019-04-11 09:16:06.733389','18','打散',1,'[{\"added\": {}}]',16,1),(44,'2019-04-11 09:16:09.390743','19','大三',1,'[{\"added\": {}}]',16,1),(45,'2019-04-11 09:16:11.485723','20','大四',1,'[{\"added\": {}}]',16,1),(46,'2019-04-11 09:16:16.846331','21','成人',1,'[{\"added\": {}}]',16,1),(47,'2019-04-11 09:16:27.349066','22','外国人',1,'[{\"added\": {}}]',16,1),(48,'2019-04-11 09:16:30.572276','23','其他情况',1,'[{\"added\": {}}]',16,1),(49,'2019-04-11 09:16:36.162438','18','打散',3,'',16,1),(50,'2019-04-20 08:20:11.114208','2','家教成功案例',1,'[{\"added\": {}}]',18,1),(51,'2019-04-20 08:20:29.139627','3','请家教常见问题',1,'[{\"added\": {}}]',18,1),(52,'2019-04-20 08:20:42.766785','4','做家教常见问题',1,'[{\"added\": {}}]',18,1),(53,'2019-04-20 08:20:45.375956','5','其他',1,'[{\"added\": {}}]',18,1),(54,'2019-04-21 09:35:48.582077','20','teacher2',2,'[{\"changed\": {\"fields\": [\"head_img\"], \"object\": \"\\u8d75\\u8001\\u5e08\", \"name\": \"\\u6559\\u5e08\\u4fe1\\u606f\"}}]',12,1),(55,'2019-04-21 09:42:19.305521','1','第一次发表文章试试',2,'[{\"changed\": {\"fields\": [\"content\", \"status\"]}}]',19,1),(56,'2019-04-21 11:58:22.670848','1','第一次评论啊',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',20,1),(57,'2019-04-27 05:05:47.102434','1','测试教师评价',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',22,1),(58,'2019-04-27 14:42:22.712621','20','teacher2',2,'[{\"changed\": {\"fields\": [\"head_img\"], \"object\": \"\\u8d75\\u8001\\u5e08\", \"name\": \"\\u6559\\u5e08\\u4fe1\\u606f\"}}]',12,1),(59,'2019-04-28 00:50:16.798417','2','请家教应该注意那些问题？',2,'[{\"changed\": {\"fields\": [\"content\", \"status\"]}}]',19,1),(60,'2019-04-28 05:57:09.240617','1','怎样做个好家教?',2,'[{\"changed\": {\"fields\": [\"title\", \"content\", \"click_num\"]}}]',19,1),(61,'2019-04-28 05:58:47.857925','3','请家教辅导三大注意事项',1,'[{\"added\": {}}]',19,1),(62,'2019-04-28 06:11:18.222943','22','teacher3',1,'[{\"added\": {}}, {\"added\": {\"object\": \"\\u6768\\u6559\\u5458\", \"name\": \"\\u6559\\u5e08\\u4fe1\\u606f\"}}]',12,1),(63,'2019-04-28 06:20:44.637023','20','teacher2',2,'[{\"changed\": {\"fields\": [\"name\", \"gender\", \"education\", \"position\", \"teach\", \"info\", \"description\", \"cert\", \"resume\", \"subjects\", \"status\"], \"object\": \"\\u9f99\\u6559\\u5458\", \"name\": \"\\u6559\\u5e08\\u4fe1\\u606f\"}}]',12,1),(64,'2019-04-28 06:48:11.553776','22','teacher3',2,'[{\"changed\": {\"fields\": [\"password\"]}}, {\"changed\": {\"fields\": [\"status\"], \"object\": \"\\u6768\\u6559\\u5458\", \"name\": \"\\u6559\\u5e08\\u4fe1\\u606f\"}}]',12,1),(65,'2019-04-28 08:53:44.963169','23','teacher4',1,'[{\"added\": {}}, {\"added\": {\"object\": \"\\u51af\\u6559\\u5458\", \"name\": \"\\u6559\\u5e08\\u4fe1\\u606f\"}}]',12,1),(66,'2019-04-28 08:55:22.826349','22','teacher3',2,'[{\"changed\": {\"fields\": [\"head_img\"], \"object\": \"\\u6768\\u6559\\u5458\", \"name\": \"\\u6559\\u5e08\\u4fe1\\u606f\"}}]',12,1),(67,'2019-04-28 09:24:44.969483','24','teacher5',1,'[{\"added\": {}}, {\"added\": {\"object\": \"\\u675c\\u6559\\u5458\", \"name\": \"\\u6559\\u5e08\\u4fe1\\u606f\"}}]',12,1),(68,'2019-04-28 09:30:07.231828','25','teacher6',1,'[{\"added\": {}}, {\"added\": {\"object\": \"\\u6768\\u6559\\u5458\", \"name\": \"\\u6559\\u5e08\\u4fe1\\u606f\"}}]',12,1),(69,'2019-04-29 09:14:29.268555','33','中央民族大学',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',15,1),(70,'2019-04-29 09:14:37.561773','34','中国地质大学(北京)',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',15,1),(71,'2019-04-29 09:17:09.980985','57','民族舞',1,'[{\"added\": {}}]',6,1),(72,'2019-04-29 09:17:16.811736','58','芭蕾舞',1,'[{\"added\": {}}]',6,1),(73,'2019-04-29 09:17:24.613200','59','古典舞',1,'[{\"added\": {}}]',6,1),(74,'2019-04-29 09:18:05.082009','26','teacher7',1,'[{\"added\": {}}, {\"added\": {\"object\": \"\\u674e\\u6559\\u5458\", \"name\": \"\\u6559\\u5e08\\u4fe1\\u606f\"}}]',12,1),(75,'2019-04-29 09:22:24.255369','27','teacher8',1,'[{\"added\": {}}, {\"added\": {\"object\": \"\\u674e\\u6559\\u5458\", \"name\": \"\\u6559\\u5e08\\u4fe1\\u606f\"}}]',12,1),(76,'2019-04-29 09:22:34.219022','26','teacher7',2,'[{\"changed\": {\"fields\": [\"status\"], \"object\": \"\\u674e\\u6559\\u5458\", \"name\": \"\\u6559\\u5e08\\u4fe1\\u606f\"}}]',12,1),(77,'2019-05-05 00:55:42.106113','4','请家教辅导三大注意事项',1,'[{\"added\": {}}]',19,1),(78,'2019-05-05 00:56:56.945744','5','易教五星教员谈：家教老师如何快速得到学员的认可',1,'[{\"added\": {}}]',19,1),(79,'2019-05-05 00:57:07.432644','5','五星教员谈：家教老师如何快速得到学员的认可',2,'[{\"changed\": {\"fields\": [\"title\", \"status\"]}}]',19,1),(80,'2019-05-05 00:57:59.676221','6','为孩子请家教的四点好处',1,'[{\"added\": {}}]',19,1),(81,'2019-05-05 00:59:09.204516','7','孩子做家务该不该给“劳务费” 让很多家长都陷入了误区之中',1,'[{\"added\": {}}]',19,1),(82,'2019-05-05 00:59:52.970787','8','孩子成长中最为关键的这8年请家长们抓住',1,'[{\"added\": {}}]',19,1),(83,'2019-05-05 01:00:54.732646','9','怎样将一个坏消息告诉孩子',1,'[{\"added\": {}}]',19,1),(84,'2019-05-05 01:34:08.354870','2','第一次发布奥评论啊',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',20,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(14,'authtoken','token'),(4,'contenttypes','contenttype'),(19,'post','article'),(18,'post','articletype'),(20,'post','comment'),(5,'sessions','session'),(21,'tutor','choiceteacher'),(17,'tutor','engage'),(16,'tutor','grade'),(8,'users','district'),(9,'users','position'),(7,'users','price'),(15,'users','school'),(11,'users','studentprofile'),(6,'users','subject'),(10,'users','teacherprofile'),(12,'users','user'),(22,'users','usercomment'),(13,'users','way');
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-04-08 07:15:45.505783'),(2,'contenttypes','0002_remove_content_type_name','2019-04-08 07:15:45.616187'),(3,'auth','0001_initial','2019-04-08 07:15:45.973697'),(4,'auth','0002_alter_permission_name_max_length','2019-04-08 07:15:46.023178'),(5,'auth','0003_alter_user_email_max_length','2019-04-08 07:15:46.032615'),(6,'auth','0004_alter_user_username_opts','2019-04-08 07:15:46.044990'),(7,'auth','0005_alter_user_last_login_null','2019-04-08 07:15:46.055109'),(8,'auth','0006_require_contenttypes_0002','2019-04-08 07:15:46.058804'),(9,'auth','0007_alter_validators_add_error_messages','2019-04-08 07:15:46.066747'),(10,'auth','0008_alter_user_username_max_length','2019-04-08 07:15:46.079589'),(11,'users','0001_initial','2019-04-08 07:15:47.172891'),(12,'admin','0001_initial','2019-04-08 07:15:47.282432'),(13,'admin','0002_logentry_remove_auto_add','2019-04-08 07:15:47.333870'),(14,'sessions','0001_initial','2019-04-08 07:15:47.368296'),(15,'users','0002_auto_20190408_1533','2019-04-08 07:33:14.967027'),(16,'authtoken','0001_initial','2019-04-09 02:37:49.858883'),(17,'authtoken','0002_auto_20160226_1747','2019-04-09 02:37:50.523493'),(18,'users','0003_auto_20190409_1548','2019-04-09 07:48:40.141618'),(19,'users','0004_teacherprofile_teach','2019-04-11 09:00:34.859260'),(20,'tutor','0001_initial','2019-04-11 09:00:35.344663'),(21,'post','0001_initial','2019-04-16 03:21:18.287200'),(22,'post','0002_article_status','2019-04-16 03:24:03.919042'),(23,'tutor','0002_engage_code','2019-04-19 01:18:50.630886'),(24,'post','0003_auto_20190420_1451','2019-04-20 06:51:15.947360'),(25,'users','0005_teacherprofile_head_img','2019-04-21 07:38:52.986735'),(26,'users','0006_teacherprofile_email','2019-04-21 08:28:15.730059'),(27,'tutor','0003_engage_create_datetime','2019-04-21 10:56:51.607122'),(28,'post','0004_comment','2019-04-21 11:30:12.438654'),(29,'tutor','0004_choiceteacher','2019-04-27 02:33:27.106245'),(30,'tutor','0005_choiceteacher_student','2019-04-27 03:30:18.241722'),(31,'users','0007_usercomment','2019-04-27 04:59:09.947630'),(32,'tutor','0006_auto_20190427_2158','2019-04-27 13:58:15.012498'),(33,'tutor','0007_choiceteacher_pay_status','2019-04-27 14:08:55.415077'),(34,'users','0008_teacherprofile_rate','2019-04-28 06:29:59.490175');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('3rspnddqyr3ox5c9jtzjozh9j22wgs9z','YTdlNGQ2NzRkNDA1YmQxNDlkYmFmNzBiNDUxOTMwMDUyNzc2MGI5ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImUzNmFiOGY5M2MwNmIzN2I2ZTQ0NmMyZjEwMmJjODM1OWM2N2Q1MDgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2019-05-11 14:42:07.538476'),('4gx11ejgtd7xjonj8u83dktcbam1mfvl','ZDY5MzgzNmQxMDQ4ZWEyYzMxYmY5ODg3NjE2ZTlhZmFiODUyZWJiNzp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ0YjgyNzM3Yjg5MzE0YTkwZDdlZDc5OGM4NzMyOWUxNjZkOGZmNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyMiJ9','2019-05-12 06:50:52.318168'),('5dr8su55nzkkd4o6f5fpprt5ougvwofa','YTdlNGQ2NzRkNDA1YmQxNDlkYmFmNzBiNDUxOTMwMDUyNzc2MGI5ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImUzNmFiOGY5M2MwNmIzN2I2ZTQ0NmMyZjEwMmJjODM1OWM2N2Q1MDgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2019-05-04 06:51:33.708752'),('5pr5bj0kyvpebo9pfp0yon42kl8tue0s','YTdlNGQ2NzRkNDA1YmQxNDlkYmFmNzBiNDUxOTMwMDUyNzc2MGI5ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImUzNmFiOGY5M2MwNmIzN2I2ZTQ0NmMyZjEwMmJjODM1OWM2N2Q1MDgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2019-04-30 03:18:29.947240'),('7w2xhq7pcd0uhjtd2qfhpfd8xbqtqp8q','YTdlNGQ2NzRkNDA1YmQxNDlkYmFmNzBiNDUxOTMwMDUyNzc2MGI5ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImUzNmFiOGY5M2MwNmIzN2I2ZTQ0NmMyZjEwMmJjODM1OWM2N2Q1MDgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2019-04-30 05:49:27.183589'),('9871flp34c2oxwgjczkv04acf9gs6vh2','MDk1ZTdjNWRlNDBiYWY0YzllYmE1YmRkOWVmZTA2YjIxZGU1YTdlYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ3ZWVmMzNhMzJmNjliNDAzZTgzOTlkOTRmM2U2ODg3NmJmMDkyNjciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyMCJ9','2019-04-30 06:28:01.447335'),('a2lk2ig2s4pqdinh6k3u00qnkgo2b45d','OWIwYjUyMjAxYzNiOTU4YmM1MmY5NGJjZjZhNjNkZTJkNTQ1ODBmYTp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ3ZWVmMzNhMzJmNjliNDAzZTgzOTlkOTRmM2U2ODg3NmJmMDkyNjciLCJfYXV0aF91c2VyX2lkIjoiMjAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9','2019-05-04 07:35:16.205866'),('dejbf3hzq2y17ven5ap7z35p6k5uzhgj','YTdlNGQ2NzRkNDA1YmQxNDlkYmFmNzBiNDUxOTMwMDUyNzc2MGI5ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImUzNmFiOGY5M2MwNmIzN2I2ZTQ0NmMyZjEwMmJjODM1OWM2N2Q1MDgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2019-05-19 00:54:50.852244'),('deoxrnaw1889q2mitawb4j1l7oy2vonr','YTdlNGQ2NzRkNDA1YmQxNDlkYmFmNzBiNDUxOTMwMDUyNzc2MGI5ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImUzNmFiOGY5M2MwNmIzN2I2ZTQ0NmMyZjEwMmJjODM1OWM2N2Q1MDgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2019-05-12 05:56:39.826893'),('dp7g3ql3i4ttzh7labrmirn30ajne8xr','OWIwYjUyMjAxYzNiOTU4YmM1MmY5NGJjZjZhNjNkZTJkNTQ1ODBmYTp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ3ZWVmMzNhMzJmNjliNDAzZTgzOTlkOTRmM2U2ODg3NmJmMDkyNjciLCJfYXV0aF91c2VyX2lkIjoiMjAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9','2019-04-30 06:21:58.792498'),('e7k4af4839ulqg3x4ngxty4drxsdjtpd','YTdlNGQ2NzRkNDA1YmQxNDlkYmFmNzBiNDUxOTMwMDUyNzc2MGI5ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImUzNmFiOGY5M2MwNmIzN2I2ZTQ0NmMyZjEwMmJjODM1OWM2N2Q1MDgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2019-05-11 03:22:34.521799'),('f75v6fjauiretaozhf9ytnkazikg5dwh','ODVhZWQ3YjA5ZWJiYjA4OTE1MmNmMjQyOTY5ZjExMzMyODZjZGQzZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ4MTIxOTZiYzlkYmQ5ZWFjZTQzMzM3Yjc1ZjE2ZjhjZTJiNGUyZmUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNSJ9','2019-04-30 05:47:28.201617'),('f9f09jbbiwjyu8efh5crbop8ubov9ux5','YTdlNGQ2NzRkNDA1YmQxNDlkYmFmNzBiNDUxOTMwMDUyNzc2MGI5ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImUzNmFiOGY5M2MwNmIzN2I2ZTQ0NmMyZjEwMmJjODM1OWM2N2Q1MDgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2019-05-02 00:52:24.122602'),('k3hl9nidzkbl8dpjnx46dkhmnhjqjubo','MDk1ZTdjNWRlNDBiYWY0YzllYmE1YmRkOWVmZTA2YjIxZGU1YTdlYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ3ZWVmMzNhMzJmNjliNDAzZTgzOTlkOTRmM2U2ODg3NmJmMDkyNjciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyMCJ9','2019-05-05 08:16:01.091413'),('lz7z9ec31vygorbn56n4emlqqsg0x4tm','YTdlNGQ2NzRkNDA1YmQxNDlkYmFmNzBiNDUxOTMwMDUyNzc2MGI5ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImUzNmFiOGY5M2MwNmIzN2I2ZTQ0NmMyZjEwMmJjODM1OWM2N2Q1MDgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2019-05-12 06:47:20.564847'),('m3ubti7pneujh8n9p2vgm5iqhy7mv5qf','YTdlNGQ2NzRkNDA1YmQxNDlkYmFmNzBiNDUxOTMwMDUyNzc2MGI5ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImUzNmFiOGY5M2MwNmIzN2I2ZTQ0NmMyZjEwMmJjODM1OWM2N2Q1MDgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2019-04-23 07:28:17.504590'),('nbyer4wjg1mgh3t2ltau39fsn4y9xfid','YTdlNGQ2NzRkNDA1YmQxNDlkYmFmNzBiNDUxOTMwMDUyNzc2MGI5ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImUzNmFiOGY5M2MwNmIzN2I2ZTQ0NmMyZjEwMmJjODM1OWM2N2Q1MDgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2019-05-13 09:11:36.885092'),('p781w4wqkl379afolnx7rre5g798cnn2','OWIwYjUyMjAxYzNiOTU4YmM1MmY5NGJjZjZhNjNkZTJkNTQ1ODBmYTp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ3ZWVmMzNhMzJmNjliNDAzZTgzOTlkOTRmM2U2ODg3NmJmMDkyNjciLCJfYXV0aF91c2VyX2lkIjoiMjAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9','2019-05-02 02:24:56.846356'),('py8ahufvfs6ka4at0t589hyd8vetxvxs','YTdlNGQ2NzRkNDA1YmQxNDlkYmFmNzBiNDUxOTMwMDUyNzc2MGI5ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImUzNmFiOGY5M2MwNmIzN2I2ZTQ0NmMyZjEwMmJjODM1OWM2N2Q1MDgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2019-05-12 08:49:51.898757'),('qup17bykzmpmhz3hwjtam1s49rq2g3w4','MDk1ZTdjNWRlNDBiYWY0YzllYmE1YmRkOWVmZTA2YjIxZGU1YTdlYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ3ZWVmMzNhMzJmNjliNDAzZTgzOTlkOTRmM2U2ODg3NmJmMDkyNjciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyMCJ9','2019-04-30 06:27:35.342976'),('w12dwgem5t3dx2p443j5sozmx58en78h','YTdlNGQ2NzRkNDA1YmQxNDlkYmFmNzBiNDUxOTMwMDUyNzc2MGI5ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImUzNmFiOGY5M2MwNmIzN2I2ZTQ0NmMyZjEwMmJjODM1OWM2N2Q1MDgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2019-05-05 08:03:28.142223'),('ws8v82yvhxmdvnuu34r4v68mx4imixfm','MDk1ZTdjNWRlNDBiYWY0YzllYmE1YmRkOWVmZTA2YjIxZGU1YTdlYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ3ZWVmMzNhMzJmNjliNDAzZTgzOTlkOTRmM2U2ODg3NmJmMDkyNjciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyMCJ9','2019-04-30 05:49:39.314838'),('y3fhiyg14jgtp4c8eyp4vrnabjmm76f2','MDk1ZTdjNWRlNDBiYWY0YzllYmE1YmRkOWVmZTA2YjIxZGU1YTdlYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ3ZWVmMzNhMzJmNjliNDAzZTgzOTlkOTRmM2U2ODg3NmJmMDkyNjciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyMCJ9','2019-04-30 06:23:00.253876');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_article`
--

DROP TABLE IF EXISTS `post_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `post_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `click_num` int(11) NOT NULL,
  `create_datetime` datetime(6) NOT NULL,
  `update_datetime` datetime(6) NOT NULL,
  `type_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_article_type_id_589456cd_fk_post_articletype_id` (`type_id`),
  KEY `post_article_user_id_37ae6678_fk_users_user_id` (`user_id`),
  CONSTRAINT `post_article_type_id_589456cd_fk_post_articletype_id` FOREIGN KEY (`type_id`) REFERENCES `post_articletype` (`id`),
  CONSTRAINT `post_article_user_id_37ae6678_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_article`
--

LOCK TABLES `post_article` WRITE;
/*!40000 ALTER TABLE `post_article` DISABLE KEYS */;
INSERT INTO `post_article` VALUES (1,'怎样做个好家教?','<p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">当电话交谈、试讲您都通过之后，恭喜您已经做成功了一份家教。但是请您注意这并不是一份家教工作的结束，而仅仅是开始。一定要本着敬业守则的态度，认真做好这份工作。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">1、交往！</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">在与家长的交往中，要充分主要到家长的生活习惯和生活礼仪。特别要注意礼貌，来时道声好，去时说再见。在言语方面，注意礼貌用语，切忌说粗话。因为你的一言一行家长都看在眼里，你的学生也看在眼里。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">2、联系！</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">应该注意与家长保持联系，万一有什么事情无法按原定的时间上课，一定要及时告知家长，并协商更改时间。如果有不可抗拒之特殊原因无法继续做下去，也一定要事先告知家教中心原因，并由博雅家教中心出面酌情处理。不要让家长认为您不守信用。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">3、方法！</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">每个孩子都有特别的情况，必须根据试讲时的反馈情况制定确实可行的家教方案。同时，不仅要教会孩子一些基本的应用知识，更重要的是教会孩子学习的方法，用什么的方法可以提高学习效率，用什么方法可以降低错误比率，用什么方法可以提炼规律。只有这样，您的家教才会取得真正的效果。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">4、沟通！</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">在家教过程中，孩子是您的主攻对象，所以一定要做好与孩子的沟通，切忌摆架子，高高在上。应该摆正亦师亦友的态度，成为孩子学习的伙伴和生活的朋友，才能找到他最易接受的学习方式及最有益的学习方法。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">家教一段时间之后，要不定期与家长沟通，互相反馈孩子的发展情况，以期改进。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">5、技巧！</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">树立孩子学习的自尊心是家教成功的关键。所以您在家教过程中一定要注意：帮助树立和保护孩子的自尊心，不管孩子在学习上如何表现，都不要表现出任何一点的不屑。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">6、问题！</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">家教过程中，如果出现您无法解决的问题，请您务必与本中心、与家长进行协商，共同来解决存在的问题。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">7、修养！</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">保持自身修养，遇到问题（如与家长发生争执等）应以为人师表的态度，心平气和地解决，不应与家长发生争吵甚至出言不逊，不能解决的问题，家教中心将给予帮助。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">以上各个环节您都能做到的话，您一定是一个成功的家教工作人员了，在此向您表示祝贺！</p><p><br/></p>',1,'2019-04-20 08:49:37.007018','2019-04-28 05:57:09.238442',2,20,2),(2,'请家教应该注意那些问题？','<p>	随着新学期的开始，现在很多家长忙着给孩子找家教，但教育专家却发现不少家长对请家教的认识上还存有不少误区。究竟该如何来选择家教？自己的孩子又最需要什么样的家教？不妨让我们听一听专家学者的建议。</p><p><strong style=\"color: rgb(0, 0, 0);\">对家教作用认识不准</strong></p><p>	现在大部分家长都把请家教的主要目标定在孩子的成绩提高上，这说明家长对家教的认识还不很明确。</p><p>	专家的意见是，分数固然非常重要，但分数的背后应当是能力的提高，靠一次、两次的押题，或许一时能取得一个好成绩，但学习成绩的决定因素、学习习惯、思维习惯的培养和形成是需要一定的</p><p>	时间的。很多家长在请家教前，还没有能弄明白，或没有想过应该先弄明白三个重要问题：一、孩子现在的具体情况是怎样的？因为，每一个孩子都是不同的，在教授的过程中，需要有不同的方式、方</p><p>	法提供给他们；二、要使孩子获得提高，症结在哪里？三、通过何种途径能最快消除症结。</p><p>	北京师范大学教育科技研究中心吴老师认为，一个好的家教机构，它不会只是一味的承诺高分，如何解决孩子学习过程中遇到的障碍，给孩子一个个性化的辅导才是它所应当着重关心的。学习成绩</p><p>	不好，表现为很多症状，而对付每一个症状都需要有相应的方式、方法，比如学生厌倦学习，学习缺乏主动性就需要对学习兴趣进行提升；听课效率低，审题找不到重点，就应该对孩子的观察能力进行</p><p>	训练；遇到难题，缺乏钻研精神就要对孩子意志毅力进行训练；记忆速度慢，遗忘速度快，就要进行记忆能力训练。</p><p><strong style=\"color: rgb(0, 0, 0);\">选家教仍存在误区</strong></p><p>	综合社会上存在的种种现象，目前家长给孩子请家教存在如下几个误区：</p><p><strong style=\"color: rgb(0, 0, 0);\">第一</strong>，喜欢请高考得分高的大学生在给孩子请家教的时候，很多家长喜欢找名牌学校的高考状元，或是成绩非常拔尖的学生。认为这样的家教能感染孩子，影响孩子。其实，请家教应更看重教师没</p><p>	有相关辅导经验或能力。因为不少大学生并没有系统的师范知识，只能帮助孩子顺利完成作业。至于什么阶段的学生需要养成什么学习能力，多数没有经验的大学生是不了解的。这样，不但不能激发、</p><p>	培养孩子的学习能力，反而可能使孩子在学习上更加依赖于这些“大哥哥、大姐姐”。</p><p>	没有相关经验的大学生很难胜任特殊的家教角色。作为一家正规的家教教机构，我们多会选择师范大学或有过长期辅导经历的优秀教师。即使是选用大学生做家教老师，也必须对这些大学生进行严</p><p>	格的审核。大学生家教有自身的好处，他们容易和授课对象沟通，也容易成为孩子效仿的榜样，激励孩子好好学习。</p><p><strong style=\"color: rgb(0, 0, 0);\">第二</strong>，是找学生的任课老师很多家长愿意请孩子学校的任课老师做家教，其实这也是个误区。试想一下，孩子学习某门功课非常吃力时，多少对任课老师也有一定的心理障碍。如果不顾孩子的想法</p><p>	，请任课老师给孩子开小灶，可能造成成绩更差的现象。因为，当孩子对某门功课犯怵时，很多情况下，老师的讲课方式、方法已经对孩子没有吸引力了。而家长用高价钱请来的家教，很难收到预期的</p><p>	效果。而学校里那些有名气的教学能手，一般花大价钱也很难请到。</p><p><strong style=\"color: rgb(0, 0, 0);\">第三</strong>，很多家长一味地用考试成绩衡量学生学习是否长进，通过考试成绩来检验请家教的作用。经常会听到一些家长讲，给孩子换不换家教等考试成绩出来看了再说。其实，家教的作用应该是帮助</p><p>	孩子培养好的学习习惯，开发其学习兴趣，不是简单等同于提高学习成绩.</p>',0,'2019-04-28 00:49:48.891367','2019-04-28 00:50:16.792318',3,15,2),(3,'请家教辅导三大注意事项','<p>&nbsp; &nbsp; &nbsp; &nbsp;<span style=\"color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; background-color: rgb(255, 255, 255);\">面对孩子不是很理想的成绩单，许多家长选择了</span><a href=\"http://www.eduease.com/qingjiajiao.php\" style=\"margin: 0px; padding: 0px; color: rgb(84, 84, 84); text-decoration-line: none; font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);\">请家教</a><span style=\"color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; background-color: rgb(255, 255, 255);\">来帮助孩子学习，提高成绩。初三和高三的学生进入了中、高考的冲刺阶段，最后的半年时间至关重要，如果能得到全面系统的复习，把握好考试的趋势，相信一定会成为中高考的最后胜利者；初一和高一的学生经过半年的学习，对年级跨升的学习氛围已经适应，这个寒假正是承上启下、打好中学阶段知识基础的最佳时期；初二和高二的学生则应该从现在就开始备战中、高考了，早一天做好准备，就比其它同学多一分成功的信心和实力。因此，寒假对于每一个学生来说，都是提升成绩和学力的黄金机会，需要认真对待，好好把握</span><br style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; background-color: rgb(255, 255, 255);\">　　目前北京的家教市场鱼龙混杂，家长上当受骗的例子很多，不仅被骗了钱，更是贻误了孩子的学习良机。究竟怎样选择家教教师呢？易教网（www.eduee.com ）作为</span><a href=\"http://www.eduease.com/\" style=\"margin: 0px; padding: 0px; color: rgb(84, 84, 84); text-decoration-line: none; font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);\">北京家教</a><span style=\"color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; background-color: rgb(255, 255, 255);\">市场的领航者，在此提醒家长注意：</span><strong style=\"margin: 0px; padding: 0px; font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);\"><a href=\"http://www.eduease.com/qingjiajiao.php\" style=\"margin: 0px; padding: 0px; color: rgb(84, 84, 84); text-decoration-line: none;\">请家教</a></strong><span style=\"color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; background-color: rgb(255, 255, 255);\">要认清品牌，要选择真正有实力的放心家教机构。&nbsp;</span><br style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; background-color: rgb(255, 255, 255);\">　　注意一：审核家教机构的实力</span><br style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; background-color: rgb(255, 255, 255);\">　　目前北京的家教中介机构有几百家，家长在选择的时候，最好进行实地考查，或者到有关部门咨询一下，弄清其背景资料。那种一间小屋、几部电话的家教中介多是非法机构，提供的教师水平也根本无法得到保障。要从家教机构的规模、成立时间、是否具有正规、合法的经营执照等几方面进行综合的考查。&nbsp;</span><br style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; background-color: rgb(255, 255, 255);\">　　注意二：勿贪图“名校”“名师”</span><br style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; background-color: rgb(255, 255, 255);\">　　京城的名校、重点校众所周知，数量不多，名师数量也很有限，不可能每家教育机构都能够请到重点名校的教师来授课。社会上出现了不少冒充名师的“南郭先生”，给家教市场造成了极坏的影响。家长们选择家教的时候一定要擦亮眼睛，选择家教不是看老师有没有名，而是要看这个家教适不适合孩子。家长选择家教的时候可以根据孩子的情况加以权衡，并对家教老师进行严格审核。&nbsp;</span><br style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; background-color: rgb(255, 255, 255);\">　　注意三：分清家教和辅导班</span><br style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; background-color: rgb(255, 255, 255);\">　　寒假里很多辅导班开始招生，一对一的家教和一对多的辅导班授课效果是不同的，家教是“一对一”的教育服务，针对个别学生解决个人问题，所谓“对症下药”。家长看广告时要区分清楚，针对孩子的情况和需求进行选择.</span></p>',0,'2019-04-28 05:58:47.851230','2019-04-28 05:58:47.851288',3,20,2),(4,'请家教辅导三大注意事项','<p><span style=\"color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; background-color: rgb(255, 255, 255);\">面对孩子不是很理想的成绩单，许多家长选择了</span><a href=\"http://www.eduease.com/qingjiajiao.php\" style=\"margin: 0px; padding: 0px; color: rgb(84, 84, 84); text-decoration-line: none; font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);\">请家教</a><span style=\"color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; background-color: rgb(255, 255, 255);\">来帮助孩子学习，提高成绩。初三和高三的学生进入了中、高考的冲刺阶段，最后的半年时间至关重要，如果能得到全面系统的复习，把握好考试的趋势，相信一定会成为中高考的最后胜利者；初一和高一的学生经过半年的学习，对年级跨升的学习氛围已经适应，这个寒假正是承上启下、打好中学阶段知识基础的最佳时期；初二和高二的学生则应该从现在就开始备战中、高考了，早一天做好准备，就比其它同学多一分成功的信心和实力。因此，寒假对于每一个学生来说，都是提升成绩和学力的黄金机会，需要认真对待，好好把握</span><br style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; background-color: rgb(255, 255, 255);\">　　目前北京的家教市场鱼龙混杂，家长上当受骗的例子很多，不仅被骗了钱，更是贻误了孩子的学习良机。究竟怎样选择家教教师呢？易教网（www.eduee.com ）作为</span><a href=\"http://www.eduease.com/\" style=\"margin: 0px; padding: 0px; color: rgb(84, 84, 84); text-decoration-line: none; font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);\">北京家教</a><span style=\"color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; background-color: rgb(255, 255, 255);\">市场的领航者，在此提醒家长注意：</span><strong style=\"margin: 0px; padding: 0px; font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);\"><a href=\"http://www.eduease.com/qingjiajiao.php\" style=\"margin: 0px; padding: 0px; color: rgb(84, 84, 84); text-decoration-line: none;\">请家教</a></strong><span style=\"color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; background-color: rgb(255, 255, 255);\">要认清品牌，要选择真正有实力的放心家教机构。&nbsp;</span><br style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; background-color: rgb(255, 255, 255);\">　　注意一：审核家教机构的实力</span><br style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; background-color: rgb(255, 255, 255);\">　　目前北京的家教中介机构有几百家，家长在选择的时候，最好进行实地考查，或者到有关部门咨询一下，弄清其背景资料。那种一间小屋、几部电话的家教中介多是非法机构，提供的教师水平也根本无法得到保障。要从家教机构的规模、成立时间、是否具有正规、合法的经营执照等几方面进行综合的考查。&nbsp;</span><br style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; background-color: rgb(255, 255, 255);\">　　注意二：勿贪图“名校”“名师”</span><br style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; background-color: rgb(255, 255, 255);\">　　京城的名校、重点校众所周知，数量不多，名师数量也很有限，不可能每家教育机构都能够请到重点名校的教师来授课。社会上出现了不少冒充名师的“南郭先生”，给家教市场造成了极坏的影响。家长们选择家教的时候一定要擦亮眼睛，选择家教不是看老师有没有名，而是要看这个家教适不适合孩子。家长选择家教的时候可以根据孩子的情况加以权衡，并对家教老师进行严格审核。&nbsp;</span><br style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; background-color: rgb(255, 255, 255);\">　　注意三：分清家教和辅导班</span><br style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; background-color: rgb(255, 255, 255);\">　　寒假里很多辅导班开始招生，一对一的家教和一对多的辅导班授课效果是不同的，家教是“一对一”的教育服务，针对个别学生解决个人问题，所谓“对症下药”。家长看广告时要区分清楚，针对孩子的情况和需求进行选择.</span></p>',0,'2019-05-05 00:55:42.088834','2019-05-05 00:55:42.088879',3,23,2),(5,'五星教员谈：家教老师如何快速得到学员的认可','<p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">&nbsp;一个合格的家教老师除了在教学水平上突出之外，还需要掌握许多东西。如何才能快速被学员所接受，如何跟学员愉快的相处，并且让学员跟着自己的思维去学习。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 作为家教，一个学校课堂的有益补充，我们不用把家教的课堂氛围搞得太过严肃沉闷，本身学员白天都在学校上课，一般学校的课程都是一板一眼的，氛围相对严肃，相对比学校来说，如果学员回家后的家教课程还跟学校一样，并且毫无新意，个别学生会有厌学情绪的，大多数学员都喜欢授课幽默的老师，更多的去跟学生互动，而不是一味的讲课。家教老师完全可以利用两小时中间的休息时间跟学员随便谈谈心，了解一下目前的中学生喜欢的话题，例如他们喜欢的偶像剧，当前很火的小游戏等等，课堂氛围调整好了，让学员在愉快的氛围下学习，效果会更好。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/>　　在这里我们也需要给咱们的老师提个醒，上课之前注意一下穿着、谈吐，为人师表。有些老师上课的时候不太在意自己的形象，总感觉只要把课上好了，其他都是小问题，其实在这一方面很多家长是有点介意的，并不是要求老师衣着华丽，作为老师我们衣着以干净朴实为主，有些学员对于香水味道比较敏感，如果有洒香水的习惯也最好味道淡淡的，女教师不要浓妆艳抹，淡妆为宜。家教老师上课都会跟学员距离比较近，所以老师最好也注意一下个人卫生，否则学员感觉不舒服自己也觉得尴尬，在谈吐方面，一些老师会有一些口头语，哇塞等等，会给学员老师不稳重的感觉，作为老师这点一定要注意起来。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">&nbsp;&nbsp;<br style=\"margin: 0px; padding: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 还有一点就是上课时间的问题，家教老师一定不要有迟到早退的现象，我们不能在上课时间上卡的太死，很多老师因为所带学生太多会把时间卡的特别紧，甚至上课过程中不断看表，生怕延长一点时间会耽误下面的课。针对这种情况老师们最好不要把上课的时间安排的过于紧凑，否则慌乱之中就不能保证给每个学生上课的教课质量。早到5-10分钟到最好，到点后适当延长3-5分钟，时间充裕的情况下可以跟家长适当谈谈学员的学习情况，这样会给家长负责任的感觉。上述情况你都可以做到，那么你在家教过程中会很容易被学生所接受的。</p><p><br/></p>',0,'2019-05-05 00:56:56.939283','2019-05-05 00:57:07.428507',4,24,2),(6,'为孩子请家教的四点好处','<p><span style=\"color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; background-color: rgb(255, 255, 255);\">第一，可及时补上欠缺的知识。</span><br style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; background-color: rgb(255, 255, 255);\">　　第二，</span><strong style=\"margin: 0px; padding: 0px; font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);\"><a href=\"http://www.eduease.com/qingjiajiao.php\" style=\"margin: 0px; padding: 0px; color: rgb(84, 84, 84); text-decoration-line: none;\">请家教</a></strong><span style=\"color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; background-color: rgb(255, 255, 255);\">可以有针对性地单独授课。教师在课堂上，只能面对大多数同学的水平和进度授课，不可能面面俱到。家庭教师面对面地授课，且授课之前对学生水平已有了解，则针对性较强，学习的效率自然会大大提高。</span><br style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; background-color: rgb(255, 255, 255);\">　　第三，可以增强学生的兴趣和信心。</span><br style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; font-size: 15px; background-color: rgb(255, 255, 255);\">　　第四，能纠正学生的不良学习习惯，使学生掌握正确的学习方法。学习吃力的同学，大多在长时间里形成了这样那样的不良学习习惯。而对于普通家长来说，很难发现自己孩子在学习上的某些弊端。家庭教师就不同了，他们凭借着丰富的专业经验，会立即发现问题所在，并在潜移默化中帮助学生纠正不良习惯，使其在补上功课的同时，逐渐掌握正确的学习方法。</span></p>',0,'2019-05-05 00:57:59.674801','2019-05-05 00:57:59.674838',3,26,2),(7,'孩子做家务该不该给“劳务费” 让很多家长都陷入了误区之中','<p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">有些家长说，在外国，孩子做家务，家长给劳务报酬。于是，就效法外国人的做法，跟自己的孩子签订“家务劳动劳务合同”：如刷碗一次付1元，扫地一次付1元，取牛奶</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">一次付5角……活儿干完，经验收合格，现金支付劳务报酬。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">这些家长认为这样做有如下的好处：一，可以调动孩子参加家务劳动的积极性；二，以有偿劳动代替无偿给零花钱，孩子通过劳动所得，不会乱花；三，使孩子认识劳动的价值，增强“商品意识”。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">猛一听，这似乎很有道理。可细细一琢磨，这种做法很值得商榷。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">在市场经济社会中，劳动是一种商品。但是，并不是所有的劳动都是商品，比如自己做家务劳动等就不是，而是伦理范畴的行为，是有劳动能力的家庭成员对家庭理应尽的义务。家庭成员从家庭里获得到必要的物质和精神生活条件，就应该对家庭尽义务，参加家务劳动就是尽义务的一种形式。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">所谓“义务”，就是一种无偿的奉献，在尽义务之前不以获得他人的报偿为目的，在尽义务过程之中不以获得他人的报偿为条件，在尽义务之后也不索取什么偿和报酬。为人父母者，有义务出资、出力把子女抚养成人，适当地给未成年的孩子一些零花钱，也是尽义务的一种形式。不论父母是否指望将来依靠子女赡养，也不论将来是不是能够得到子女的报偿，凡是做父母的，都必须无条件地这样做。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">只要具备了一定的劳动能力，子女就应当自觉地无条件地承担力所能及的家务劳动。如果子女参加家务劳动也付给报酬，实际上就是把家务劳动当成一种“商品”。而“商品”是为交换而生产的劳动产品。这样，就会引导孩子把亲子之间的关系也看成是一种“金钱关系”。家长有钱，掌握支配家庭经济的权力，可以用金钱支配子女参加家务劳动；将来子女经济独立了，不需要参加家务劳动挣钱了，家务劳动最终还是要落在家长的的身上。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">假如在子女经济未独立之前，就不再给零花钱，而要子女通过参加家务劳动获得，这就等于家长是主动放弃了一部分抚养子女的责任；家长既然能放弃抚养的责任，将来子女也可以放弃赡养老人的责任，那问题可就严重了。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">家庭生活方式本身就是一种教育。跟孩子签订“家务劳动劳务合同”，无形中就淡化了父母子女亲情，而强化了父母子女间的“金钱关系”。如果父母子女之间的联系“百分之九十九也是表现在同样的‘现金交易’上”，父母让儿子做一件事，儿子会问：“你给多少钱？”给多少钱，就做多少事；不给钱，就不做事。那么，父母有钱，你是父母；没钱，就会视同陌路。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">就像法国著名作家巴尔扎克笔下的高老头一样，他的两个女儿，在父亲有钱的时侯，就千方百计地亲近父亲，讨好父亲，花言巧语地向父亲索取金钱。等到把父亲的钱财榨光以后，就像对待“榨干了的柠檬汁”一样，把父亲扔掉。高老头到死也没明白，女儿之所以这样无情无义、丧尽天良，不赖他的女儿，全赖他自己。是高老头自己亲自把父女关系变成冷冰冰的金钱关系的，他只能无奈地饮下自己亲手酿造的苦酒。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">在外国，是有跟孩子签订“家务劳动劳务合同”的。但并不是所有家庭都这样做。如某发达国家就有这样一个故事：</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">小彼得是一个商人的儿子，由于他聪明过人，社会交往和办事能力又很强，他父母经常把一些收款和付款的帐单委托他去经办，他每次都能办得很好。在跟商人打交道的过程中，渐渐地，小彼得也觉得自己似乎快成了一个小商人。</p><p><br/></p>',0,'2019-05-05 00:59:09.200449','2019-05-05 00:59:09.200504',5,27,2),(8,'孩子成长中最为关键的这8年请家长们抓住','<p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">一岁孩子：培养安全感不可错过的一年</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">很多父母在孩子一岁时就抱着很高的期望，甚至开始对他进行各种技能和思维的训练，其实，科学实验证明，孩子在一岁半前行为和智力水平基本上和猩猩一样，太早训练并没有益处。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">而父母该做的，其实是多陪孩子玩就好。这胜过任何生硬的知识，因为他在这里已经学到了更宝贵的东西，他知道自己有人疼爱，知道自己是父母最珍贵的宝贝，知道有人会帮助他，还知道这个世界的一切都那么美好。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">婴幼儿时期的孩子，每天都经历着挫折和困难，小小年纪，要千方百计的做自己力量所不能达到的事情。他们特别喜欢有人在他们身边，注意他们的举动，逗他们开心，和他们说话，以及用一切最自然的方式跟他玩闹，才会有安全感和亲熟感，成长起来也才会更顺利。我们最应该做的，是耐心的包容孩子，培养起他一生的信赖感和幸福感。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">两岁孩子：培养幽默感不可错失的一年</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">“幽默感”是彰显人格魅力的重要组成部分。然而人的幽默感起步是比较晚的。到了两岁时，孩子的幽默能力有了初步的表现，但显得很稚嫩。比如说当他看到不一致、不协调的事物时，会感觉很好笑，还会故意把夹克反过来穿，以寻找乐趣。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">两岁半，则到了培养孩子幽默感的最佳时期。他离开自我的圈子，融入了人群中。别人笑的时候，他也会跟着笑。当他和成人及小朋友们在一起时，他仍会主动向成人微笑，以此作为和成人交流的方式。对另外的小伙伴，他的交流方式多半还是肢体语言，很少去讲话。孩子主动和大人说话的时候，一般情况下是希望引起他人的注意，让别人注意一下他的行为、他拿的物品、他做的趣事或他完成的作品。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">父母要注意拓展孩子的兴趣，增添幽默的情境，较强的幽默能力，可以为他们排除许多紧张和困扰，可以使孩子受用一生。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">三岁孩子：培养创造力不可错过的一年</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">孩子的创造力萌芽发生在他三岁时，他们的创造力就来源于好奇心和活泼好动的特质，只要有合适的环境和机会启发他，潜能自然会得到最大的发挥。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">让孩子去编故事、画彩笔图、揉泥巴，并给予他鼓励，是培养他创造力的好方法。可以给他讲故事时故意不讲结尾，让他自己来编；把杂志上好玩的图片剪下来，让他根据图画自己自己编故事等。这些做法都有助于孩子积极思考，进而开发他的想象力，尤其是增强他的逻辑观念。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">还可以假设情形让他自己想象，比如在他身上又多了两只手会怎么样。把几件物品摆在他面前，先让他看一会儿，再蒙上他的眼睛，让他讲刚才看到的东西。让他动动手、动动脚，比如表演骑自行车、烤面包等也是不错的法子。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">除了让他用眼睛来观察世界外，还让他用嗅觉、味觉或触觉来感知，你可以做“触觉袋”(不透明的购物袋即可)，让他伸手去摸袋子里的东西，再告诉你他摸到了什么。种种花草、养养小动物，经常带他去郊游，同样也都能很好地启发孩子的创造力。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">四岁孩子：语言表达力飞速成长的一年</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">语言，是四岁孩子的最爱之一。他爱说话、爱韵文、喜欢说悄悄话，喜欢唱歌，甚至喜欢吼叫。喜欢把词绕来绕去，甚至还喜欢跟他的玩具说话。在遣词造句上，他们喜欢夸大，很多时候遭到父母谴责的“撒谎”，其实只不过是他想要添油加醋地夸大一下而已。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">当然，有些孩子，尤其是男孩子，开窍的时间要慢一些。不过，这种从谬误到开窍的过程是孩子的成长阶段之一，我们只需好好珍惜，不必为此担心。三岁之前，请不要去纠正孩子在语言使用上的错误，否则孩子会因为害怕说错而感到焦虑，甚至会出现结巴或者干脆不肯说话的问题。你可以用正确的说法重述一遍他的话，但是，你不要特意强调孩子的错处。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">四岁也是一个爱问问题的年龄。他们有着无穷无尽的“为什么”，一部分是为了渴望知道新的东西；一部分是为了好玩，瞎聊下去；还有一部分则是表达抗拒不从的意思。当然最主要还是用来求知的，所以请尽量满足他们。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">四岁的孩子不仅仅喜欢问你问题，也很喜欢把他知道的消息告诉给你。他的语言已经颇为丰满，和别人的对话，不但实实在在丰富了他的生活，而且更增进了他和别人之间的交情。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">五岁孩子：亲子关系最亲昵融合的一年</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">五岁孩子能控制自己的行为，而且量力而行，与人相处和谐亲密。这个阶段格外爱恋妈妈，最喜欢做的事就是让妈妈开心，妈妈的话对他来说就是金科玉律，来自妈妈的赞扬和肯定，对他来说非常重要。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">尽管时时显得相当有自信，可是他仍然十分需要妈妈的肯定，很愿意妈妈时常在他的耳边说她有多爱他。他一方面心里笃信“我喜欢你，你也喜欢我”，另一方面却又常常去问他妈妈：“你爱不爱我？”</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">正因为五岁孩子认为妈妈肯定和自己心连心，所以，有时候他会误以为妈妈应该知道他的所思所想。当他跟妈妈说话的时候，常常没有足够的耐心把该说的话全都说出来，然后又倒过来生妈妈的气，因为妈妈居然没有一下子听明白他想要说什么。做妈妈的脑筋要转得足够快才行。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">虽然偏爱妈妈，但这并不意味着爸爸就该受到冷遇。孩子往往也非常喜欢自己的爸爸，以爸爸为荣，喜欢有爸爸陪伴在身边。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">欢迎关注瑞敏儿童教育资源，微信号：amttcc</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">六岁孩子：内心矛盾最为突出的一年</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">可能是母子之间纠葛最多的年龄，五岁的时候，妈妈是他整个世界的中心；到了六岁时，他世界的中心则变成了他自己。孩子在寻找他的中心点，随着他越来越成熟和独立，他就越发想打破旧的平衡，建立属于他自己的独立王国。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">一方面喜爱妈妈、需要妈妈，离不开妈妈的挚爱与接纳；另一方面，他又渴望自己能够独立起来，因此常常又会推开妈妈，搞得不管是自己还是妈妈的日子都十分挣扎。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">爸爸也很受六岁孩子的热爱，孩子不但热切地希望得到爸爸的陪伴和关注，而且一旦得到就会如获至宝。许多孩子更害怕爸爸的不认可，而不是妈妈的不认可；他更敬佩的人是爸爸，相信爸爸什么都知道。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">与六岁孩子相处，爸爸需要更多的耐心，比如他们半点都输不起的“球风”或者“棋风”，常常到父母的抽屉里“偷”些小玩意的“不够诚实”。因为他们跟爸爸之间的纠葛通常都没有和妈妈那么深，往往对爸爸怀有一份敬畏之心，因此当孩子大发脾气或者母子间将要出现大麻烦的时候，爸爸登场亮相，往往能解救全家于水火。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">七岁孩子：抽象思维开始发展的一年</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">这是一个以思考为特征的年龄段，在这个内向的、审慎的阶段，我们所看得见的孩子心智的运作，也许比他一生之中的任何其他阶段都要多。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">开始显露抽象思维的痕迹，七岁的小学生对一个词的写法和意义开始感兴趣，而且开始喜欢用带图像的字典，他可以指出两个不同的物体有哪些相同点。他开始把思考和自己的头脑联系起来：“你必须用你的脑袋好好想想”，“我的脑子里跑出这么个想法来”。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">许多七岁孩子的思维已经处于“试运行”阶段的尾声了。在“试运行”阶段，孩子认为自己是整个世界的中心，而且认为任何会动的东西都是有生命的东西。他也会把有些事情的发生理解成跟他的意愿有关：“我想要下雨，就下雨了。”他甚至还相信物体和自然现象都会跟人一样有情绪，有思维；也会以神奇魔力来看待很多事情。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">一旦到了“具体运行”阶段，也就是从七岁左右开始，孩子既可以看到物体之间的相同之处，也可以看出它们的不同之处。他能明白容器形状的改变并不会造成量的改变，也开始理解数量的意义。如果你把10个石子摆成一排，另外再把8个石子稍微拉开一点也摆成相同长度的一排，他也能分辨得出哪一排石子数量更多。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">八岁孩子：热衷思考思维活跃的一年</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">虽然我们不能苛求八岁的孩子事事做到完美，然而这个时候他的表现已经相当不错了。在智力、体能和性格上，都有了很多好的改变，八岁的他呈现出阶段性和自己的风格。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">在对时间的感知上，他们懂得守时，会关注和时间有关的事件；对空间位置有浓厚兴趣，变得非常喜欢地理；很喜欢阅读，阅读的重点偏重于印证他已经知道的东西；算数能力则参差不齐。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">思维和语言全面发展，判断能力增强，可以运用简单的逻辑得出一定的结论，做简单的演绎推理。另一个重要的思维层面的改变是：八岁的孩子不再像过去一样相信万物有灵，现在他越来越认识到大自然的客观力量；在语言方面典型的八岁孩子十分健谈，虽然还做不到彻底的诚实，但他已经能够分得清幻想和现实。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">八岁孩子能够接受死亡的概念；不再笃信圣诞老人的存在；对好坏的概念更清晰，不再像小时候那样以父母的准许与否来判断好坏；他们虽然已经更愿意对自己的行为负责，但是通常来说，他的第一冲动仍然是去怪罪别人。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">最后，我们一定要说的是：</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">孩子的能力获得是一件极其自然的事情</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">不要奢望孩子照自己的设想发展</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">每一个孩子都是与众不同的</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">孩子成长进程的快慢都各有不同</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">不是所有的孩子在那个年龄段“都会”或者“应该”是那个。</p><p><br/></p>',0,'2019-05-05 00:59:52.958329','2019-05-05 00:59:52.958369',5,27,2),(9,'怎样将一个坏消息告诉孩子','<p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">为了保护家人，你可能做过各种尝试，让他们远离世间各种不幸消息的干扰，但最终却往往事与愿违，更糟糕的情况是他们从别人口中得知那些悲痛的信息。那么，你该怎么做呢？</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">我只跟女儿主动隐瞒过一条令人悲痛的新闻。那时她刚刚三岁，那么小的年纪承受不起马德琳•麦卡恩失踪事件（译者注：英国女童玛德琳•麦卡恩于2007年5月3日在葡萄牙失踪，至今下落不明，当时她只是一个三岁的女童。此案被称为“现代历史上最严重的人口失踪案”）。然而，事件跌宕起伏的发展让它一时间成为备受关注的焦点。为了保护女儿，我不得不切断任何有关玛德琳的消息：叠报纸、关电视几乎成了我的家常便饭。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">当然，即便如此，还是有别人“泄密”了。学校里一个大点的女孩云里雾里地把这件闹得满城风雨的事情当成八卦，给这件本来就已经很可怕的事情又加了一些恐怖的细节。这花了我好几个月的时间才跟女儿解释明白，她之前听到的虚构故事的本来面目——人们知道的也就是这样。可是，这个大点的女孩比我先告诉女儿，她的添油加醋已经根深蒂固，而且有时候还是会歪曲女儿对这件事情的看法。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">于是，我决心再也不跟她隐瞒重要的新闻了。当然，我也不会强迫宝贝们，但至少我不会让他们刻意回避。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">但是，偶尔还是会发生重大且令人沮丧的新闻事件，爸爸妈妈们想知道，如果有的话，该如何跟孩子们说？退一步讲，究竟我们应不应该跟宝贝们谈论新闻事件？</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">“当然需要！”这是儿童和青少年心理治疗师希拉里•安•塞林格给出的答案。“问题是你无法保护儿童免受信息干扰。你渴望保护孩子，让他们远离负面新闻的愿望非常美好，但实在没有让他们绝缘的方法，因为新闻无处不在。重点是别用歇斯底里的方式谈论它。”</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">这也是让孩子们了解事实的原因所在。无论是他们可以直接获取的正面信息，还是那些需要你告诉他们的新闻，让孩子们公正、客观地知晓事件非常重要。正确处理这些能够帮孩子们学会独立思考。简单说，几乎所有的新闻都难以让众人在某些事情上达成共识。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">然而，跟孩子们隐瞒信息和有目的地告知他们信息有所不同。把握尺度，了解你的孩子非常关键且很有必要。有些孩子非常敏感。（即便对待兄弟姐妹几人，你也要因人而异；你甚至需要根据每个孩子不同的年龄和敏感程度采取不同的方式。）</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">如果新闻是宝贝们听别人讲的，那么你需要重掌主动权。塞林格建议，可以先“让孩子听或看相应的新闻报道”，或者在第一时间跟他们谈论相应的信息。请注意，正式地让他们坐下“确实能够引起孩子们的重视”塞林格表示，“但是对所有的儿童，甚至是青少年而言，他们需要知道，他们的父母会保证他们安全。因此，告知孩子新闻消息时，让他们确信父母给的安全感也很重要。”</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">塞林格建议，跟宝贝们谈论新闻时，首先从安全要素切入——强化自身环境中的美好元素：比如，你们没有生活在地震灾区，你们的国家没有发生战争等，然后再讨论新闻本身。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">“孩子们会自己发现，诸如公共汽车车祸、地震、管道爆炸等令人生畏的新闻具有随机性。”塞林格解释说。“大方承认你同样对这些事情感到担忧没有问题。与其故作轻松地说‘哦，没关系，我们会没事的’，不如告诉宝贝们‘是啊，我也很紧张’。不过，你同时要让宝贝知道，你可以平衡你的担忧与实际发生的现实。”</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">接下来宝贝们可能会提出一系列问题——这让很多父母很头疼，因为通常情况下，爸爸妈妈们不晓得答案。不知道答案没关系。“如果我们可以不知道答案，也可以不理解，我们的孩子一样可以。”塞林格说，“很多人，甚至我们的教育都灌输我们如果不理解某些事情，应该感到羞愧。但实际上，我们应该继续提出问题。”</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">如果你告诉孩子们谈论自己恐惧的事情没关系，那么他们也会对此表现出自信。避免在孩子们走进房间的时候藏东西，比如关电视，关网页等；曾经这样做过的爸爸妈妈都懂，这么做反而会激发孩子的好奇心和想象力，他们更想知道到底发生了什么。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">所以“避而不谈”就像是给宝贝们讲了一半故事，并且还不允许他们有疑问。孩子往往会想象他们不知道以及他们没有被告知的故事情节，而这些往往是他们噩梦的素材。这就是为什么解答，哪怕是部分解答，都很重要的原因。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">所以，要让宝贝们提问。温馨提醒，宝贝们的问题可能会来得不是时候。如果你当时不方便说话，以“不是现在”作为回应没有问题。不过，请试着加上如下后缀：“我们待会谈这个，因为我现在在开车（或其他）。你会提醒我吗？”（女儿甚至在我交稿大限将近时追问我：“什么是恋童癖？吉米•萨维尔是谁？”最后我只好申请延期。）</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">简单、从容、真实地回答任何问题，并尽可能不要掺杂太多自己的态度。除仔细听取并确保回答问题以外，不要说更多的其他内容。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">真情流露没关系，因为你可以教孩子懂得对某些新闻有态度、有情绪是很自然的事。但要避免歇斯底里。孩子们将根据你的话做出自己的判断和选择。如果你让他们感到可以安全地谈论事件并提出问题，这将有助于他们做出自己的选择。但如果你不这么做，他们将认为他们以后不能谈论这个问题。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">请记住，情绪饱满的熊孩子可能会问一些你几个礼拜甚至几个月前就已经回答过的问题，但这并不意味着他们无时无刻都在想着这个问题。</p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 14px; margin-bottom: 14px; padding: 0px; clear: both; width: 622px; text-indent: 2em; font-size: 15px; color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, simsun; white-space: normal; background-color: rgb(255, 255, 255);\">“最重要的是，”塞林格强调，“我们给他们的一些基本的观点，使他们能够学会做出判断，而我们必须尽早开始这一过程。我会和我的孩子交流，而不是保护他们不受外界信息的影响，因为我不认为我能够使我的孩子免于外界的影响。但我相信我有能力和我的孩子就外界的信息进行有效的沟通。</p><p><br/></p>',0,'2019-05-05 01:00:54.728793','2019-05-05 01:00:54.728829',5,15,2);
/*!40000 ALTER TABLE `post_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_articletype`
--

DROP TABLE IF EXISTS `post_articletype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `post_articletype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_articletype`
--

LOCK TABLES `post_articletype` WRITE;
/*!40000 ALTER TABLE `post_articletype` DISABLE KEYS */;
INSERT INTO `post_articletype` VALUES (2,'家教成功案例'),(3,'请家教常见问题'),(4,'做家教常见问题'),(5,'其他');
/*!40000 ALTER TABLE `post_articletype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_comment`
--

DROP TABLE IF EXISTS `post_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `post_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `create_datetime` datetime(6) NOT NULL,
  `status` smallint(6) NOT NULL,
  `article_id` int(11) NOT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_comment_article_id_67e008b1_fk_post_article_id` (`article_id`),
  KEY `post_comment_comment_id_b50b4294_fk_post_comment_id` (`comment_id`),
  KEY `post_comment_user_id_cbfe4e66_fk_users_user_id` (`user_id`),
  CONSTRAINT `post_comment_article_id_67e008b1_fk_post_article_id` FOREIGN KEY (`article_id`) REFERENCES `post_article` (`id`),
  CONSTRAINT `post_comment_comment_id_b50b4294_fk_post_comment_id` FOREIGN KEY (`comment_id`) REFERENCES `post_comment` (`id`),
  CONSTRAINT `post_comment_user_id_cbfe4e66_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_comment`
--

LOCK TABLES `post_comment` WRITE;
/*!40000 ALTER TABLE `post_comment` DISABLE KEYS */;
INSERT INTO `post_comment` VALUES (1,'第一次评论啊','2019-04-21 11:58:22.668373',2,1,NULL,15),(2,'第一次发布奥评论啊','2019-05-05 01:34:08.351429',2,1,NULL,15);
/*!40000 ALTER TABLE `post_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutor_choiceteacher`
--

DROP TABLE IF EXISTS `tutor_choiceteacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tutor_choiceteacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` smallint(6) NOT NULL,
  `engage_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `end_date` date NOT NULL,
  `price` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `pay_status` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tutor_choiceteacher_engage_id_448451ec_fk_tutor_engage_id` (`engage_id`),
  KEY `tutor_choiceteacher_user_id_496b4873_fk_users_user_id` (`user_id`),
  KEY `tutor_choiceteacher_student_id_1d905280_fk_users_user_id` (`student_id`),
  CONSTRAINT `tutor_choiceteacher_engage_id_448451ec_fk_tutor_engage_id` FOREIGN KEY (`engage_id`) REFERENCES `tutor_engage` (`id`),
  CONSTRAINT `tutor_choiceteacher_student_id_1d905280_fk_users_user_id` FOREIGN KEY (`student_id`) REFERENCES `users_user` (`id`),
  CONSTRAINT `tutor_choiceteacher_user_id_496b4873_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutor_choiceteacher`
--

LOCK TABLES `tutor_choiceteacher` WRITE;
/*!40000 ALTER TABLE `tutor_choiceteacher` DISABLE KEYS */;
INSERT INTO `tutor_choiceteacher` VALUES (3,1,1,20,15,'2019-04-26',100,'2019-04-25',2);
/*!40000 ALTER TABLE `tutor_choiceteacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutor_engage`
--

DROP TABLE IF EXISTS `tutor_engage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tutor_engage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `district_des` varchar(1000) DEFAULT NULL,
  `gender` smallint(6) DEFAULT NULL,
  `subject` varchar(100) NOT NULL,
  `class_begin` varchar(50) DEFAULT NULL,
  `description` longtext,
  `teacher_gender` smallint(6) DEFAULT NULL,
  `teacher_des` longtext,
  `charge` varchar(50) NOT NULL,
  `district_id` int(11) DEFAULT NULL,
  `grade_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `code` varchar(14) NOT NULL,
  `create_datetime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `tutor_engage_district_id_29977664_fk_users_district_id` (`district_id`),
  KEY `tutor_engage_grade_id_f3ad78a5_fk_tutor_grade_id` (`grade_id`),
  KEY `tutor_engage_user_id_be2606c6_fk_users_user_id` (`user_id`),
  CONSTRAINT `tutor_engage_district_id_29977664_fk_users_district_id` FOREIGN KEY (`district_id`) REFERENCES `users_district` (`id`),
  CONSTRAINT `tutor_engage_grade_id_f3ad78a5_fk_tutor_grade_id` FOREIGN KEY (`grade_id`) REFERENCES `tutor_grade` (`id`),
  CONSTRAINT `tutor_engage_user_id_be2606c6_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutor_engage`
--

LOCK TABLES `tutor_engage` WRITE;
/*!40000 ALTER TABLE `tutor_engage` DISABLE KEYS */;
INSERT INTO `tutor_engage` VALUES (1,'李先生','13111111111','大萨达',1,'打散','大萨达','大',1,'大萨达','打撒',1,2,15,'20190421185537','2019-04-21 10:56:51.552042'),(2,'李先生','13111111111','大萨达',1,'打散','大萨达','大',1,'大萨达','打撒',1,2,15,'20190421185658','2019-04-21 10:56:58.609498');
/*!40000 ALTER TABLE `tutor_engage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutor_grade`
--

DROP TABLE IF EXISTS `tutor_grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tutor_grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutor_grade`
--

LOCK TABLES `tutor_grade` WRITE;
/*!40000 ALTER TABLE `tutor_grade` DISABLE KEYS */;
INSERT INTO `tutor_grade` VALUES (1,'幼儿'),(2,'一年级'),(3,'二年级'),(4,'三年级'),(5,'四年级'),(6,'五年级'),(7,'六年级'),(8,'初一'),(9,'初二'),(10,'初三'),(11,'高一'),(12,'高二'),(13,'高三'),(14,'三校生'),(15,'自考生'),(16,'大一'),(17,'大二'),(19,'大三'),(20,'大四'),(21,'成人'),(22,'外国人'),(23,'其他情况');
/*!40000 ALTER TABLE `tutor_grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_district`
--

DROP TABLE IF EXISTS `users_district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users_district` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_district`
--

LOCK TABLES `users_district` WRITE;
/*!40000 ALTER TABLE `users_district` DISABLE KEYS */;
INSERT INTO `users_district` VALUES (1,'海淀'),(2,'朝阳'),(3,'东城'),(4,'西城'),(5,'丰台'),(6,'石景山'),(7,'房山'),(8,'门头沟'),(9,'通州'),(10,'昌平'),(11,'顺义'),(12,'怀柔'),(13,'密云'),(14,'延庆'),(15,'平谷'),(16,'大兴');
/*!40000 ALTER TABLE `users_district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_position`
--

DROP TABLE IF EXISTS `users_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_position`
--

LOCK TABLES `users_position` WRITE;
/*!40000 ALTER TABLE `users_position` DISABLE KEYS */;
INSERT INTO `users_position` VALUES (1,'离职幼儿教师'),(2,'退休幼儿教师'),(3,'进修幼儿教师'),(4,'在职幼儿教师'),(5,'离职小学教师'),(6,'退休小学教师'),(7,'进修小学教师'),(8,'在职小学教师'),(9,'离职中学教师'),(10,'退休中学教师'),(11,'进修中学教师'),(12,'在职中学教师'),(13,'离职高中教师'),(14,'退休高中教师'),(15,'进修高中教师'),(16,'在职高中教师'),(17,'离职大学教师'),(18,'退休大学教师'),(19,'进修大学教师'),(20,'在职大学教师'),(21,'离职专业培训机构教师'),(22,'退休专业培训机构教师'),(23,'进修专业培训机构教师'),(24,'在职专业培训机构教师'),(25,'在校大一学生'),(26,'在校大二学生'),(27,'在校大三学生'),(28,'在校大四学生'),(29,'在读硕士'),(30,'在读博士'),(31,'其他学生'),(32,'硕士进修老师'),(33,'外籍华人'),(34,'外籍教师'),(35,'外籍留学生'),(36,'普通外籍人士'),(37,'其他(已经毕业离校的人员)');
/*!40000 ALTER TABLE `users_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_price`
--

DROP TABLE IF EXISTS `users_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `type` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_price`
--

LOCK TABLES `users_price` WRITE;
/*!40000 ALTER TABLE `users_price` DISABLE KEYS */;
INSERT INTO `users_price` VALUES (1,'300元–800元/每小时',300,1),(2,'350-500元一小时',350,1),(3,'600元每小时，竞赛课另议',600,1),(4,'300-500元/小时',300,1);
/*!40000 ALTER TABLE `users_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_school`
--

DROP TABLE IF EXISTS `users_school`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users_school` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_school`
--

LOCK TABLES `users_school` WRITE;
/*!40000 ALTER TABLE `users_school` DISABLE KEYS */;
INSERT INTO `users_school` VALUES (1,'北京大学'),(2,'\n清华大学'),(3,'\n中国人民大学'),(4,'\n北京师范大学'),(5,'\n首都师范大学'),(6,'\n北京交通大学'),(7,'\n北京邮电大学'),(8,'\n北京科技大学'),(9,'\n北京第二外国语学院'),(10,'\n北京理工大学'),(11,'\n北京外国语大学'),(12,'\n中央音乐学院'),(13,'\n中央美术学院'),(14,'\n北京航空航天大学'),(15,'\n中国政法大学'),(16,'\n北京语言大学'),(17,'\n中央财经大学'),(18,'\n中国音乐学院'),(19,'\n北京化工大学'),(20,'\n外交学院'),(21,'\n中央戏剧学院'),(22,'\n中国戏曲学院'),(23,'\n北京舞蹈学院'),(24,'\n北京电影学院'),(25,'\n首都体育学院'),(26,'\n北京体育大学'),(27,'\n中国科学院研究生院'),(28,'\n对外经济贸易大学'),(29,'\n北京工业大学'),(30,'\n中国矿业大学(北京)'),(31,'\n中国农业大学'),(32,'\n北京林业大学'),(33,'中央民族大学'),(34,'中国地质大学(北京)'),(35,'北方工业大学'),(36,'\n北京工商大学'),(37,'\n北京中医药大学'),(38,'\n北京服装学院'),(39,'\n中国传媒大学'),(40,'\n华北电力大学(北京)'),(41,'\n中国石油大学(北京)'),(42,'\n首都医科大学'),(43,'\n中国协和医科大学'),(44,'\n中国青年政治学院'),(45,'\n首都经济贸易大学'),(46,'\n北京教育学院国际关系学院'),(47,'\n中华女子学院'),(48,'\n北京石油化工学院'),(49,'\n北京建筑工程学院'),(50,'\n北京电子科技学院'),(51,'\n中国人民公安大学'),(52,'\n北京物资学院'),(53,'\n北京印刷学院'),(54,'\n北京信息科技大学'),(55,'\n北京联合大学');
/*!40000 ALTER TABLE `users_school` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_studentprofile`
--

DROP TABLE IF EXISTS `users_studentprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users_studentprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gender` smallint(6) NOT NULL,
  `name` varchar(32) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  `postal_code` varchar(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mobile` (`mobile`),
  KEY `users_studentprofile_user_id_d0e95184_fk_users_user_id` (`user_id`),
  CONSTRAINT `users_studentprofile_user_id_d0e95184_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_studentprofile`
--

LOCK TABLES `users_studentprofile` WRITE;
/*!40000 ALTER TABLE `users_studentprofile` DISABLE KEYS */;
INSERT INTO `users_studentprofile` VALUES (4,2,'李学员','13111111111','北京','11321',15);
/*!40000 ALTER TABLE `users_studentprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_subject`
--

DROP TABLE IF EXISTS `users_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users_subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_subject`
--

LOCK TABLES `users_subject` WRITE;
/*!40000 ALTER TABLE `users_subject` DISABLE KEYS */;
INSERT INTO `users_subject` VALUES (1,'学龄前课程'),(2,'幼儿陪读'),(3,'才艺'),(4,'小学语文'),(5,'小学数学'),(6,'小学英语'),(7,'小学陪读'),(8,'初一初二语文'),(9,'初一初二英语'),(10,'初一初二物理'),(11,'二胡'),(12,'小学全科'),(13,'初中全科'),(14,'初一初二数学'),(15,'初中陪读'),(16,'初中数理化'),(17,'高中数理化'),(18,'英语专业四级'),(19,'初级德语'),(20,'小学奥数'),(21,'初一初二化学'),(22,'初三数学'),(23,'初三物理'),(24,'初三化学'),(25,'高中生物'),(26,'高一高二数学'),(27,'高一高二物理'),(28,'高一高二化学'),(29,'高三化学'),(30,'高三物理'),(31,'初中奥数'),(32,'高三数学'),(33,'启蒙'),(34,'手工'),(35,'卡通画'),(36,'中国画'),(37,'素描'),(38,'创意画'),(39,'水粉画'),(40,'水彩画'),(41,'简笔画'),(42,'速写'),(43,'硬笔书法'),(44,'软笔书法'),(45,'初三英语'),(46,'初级英语口语'),(47,'初级新概念英语'),(48,'初级牛津英语'),(49,'初级剑桥英语'),(50,'高一高二语文'),(51,'高三英语'),(52,'英语专业八级'),(53,'考研英语'),(54,'英语四级'),(55,'英语六级'),(56,'商务英语'),(57,'民族舞'),(58,'芭蕾舞'),(59,'古典舞');
/*!40000 ALTER TABLE `users_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_teacherprofile`
--

DROP TABLE IF EXISTS `users_teacherprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users_teacherprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gender` smallint(6) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `birthday` date NOT NULL,
  `from_province` varchar(50) NOT NULL,
  `education` smallint(6) NOT NULL,
  `id_code` varchar(18) NOT NULL,
  `school_id` int(11) NOT NULL,
  `specialty` varchar(50) NOT NULL,
  `teach_age` int(11) DEFAULT NULL,
  `province` varchar(30) NOT NULL,
  `address` varchar(100) NOT NULL,
  `postal_code` varchar(10) NOT NULL,
  `status` smallint(6) NOT NULL,
  `pass_datetime` datetime(6) DEFAULT NULL,
  `id_code_pic` varchar(100) DEFAULT NULL,
  `info` longtext,
  `description` longtext,
  `cert` longtext,
  `resume` longtext,
  `life_area_id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `work_area_id` int(11) NOT NULL,
  `teach` varchar(50) DEFAULT NULL,
  `head_img` varchar(100) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `rate` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mobile` (`mobile`),
  KEY `users_teacherprofile_life_area_id_48a5c06f_fk_users_district_id` (`life_area_id`),
  KEY `users_teacherprofile_position_id_9a149cba_fk_users_position_id` (`position_id`),
  KEY `users_teacherprofile_user_id_976ceafc_fk_users_user_id` (`user_id`),
  KEY `users_teacherprofile_work_area_id_3fe947a9_fk_users_district_id` (`work_area_id`),
  KEY `users_teacherprofile_school_id_ce55eb1f` (`school_id`),
  CONSTRAINT `users_teacherprofile_life_area_id_48a5c06f_fk_users_district_id` FOREIGN KEY (`life_area_id`) REFERENCES `users_district` (`id`),
  CONSTRAINT `users_teacherprofile_position_id_9a149cba_fk_users_position_id` FOREIGN KEY (`position_id`) REFERENCES `users_position` (`id`),
  CONSTRAINT `users_teacherprofile_school_id_ce55eb1f_fk_users_school_id` FOREIGN KEY (`school_id`) REFERENCES `users_school` (`id`),
  CONSTRAINT `users_teacherprofile_user_id_976ceafc_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`),
  CONSTRAINT `users_teacherprofile_work_area_id_3fe947a9_fk_users_district_id` FOREIGN KEY (`work_area_id`) REFERENCES `users_district` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_teacherprofile`
--

LOCK TABLES `users_teacherprofile` WRITE;
/*!40000 ALTER TABLE `users_teacherprofile` DISABLE KEYS */;
INSERT INTO `users_teacherprofile` VALUES (1,2,'13111111113','龙教员','1996-04-07','北京',8,'111111111111111111',1,'计算机',NULL,'北京','北京','1132131',3,'2019-04-28 06:41:00.492730','2019/04/21/expectedresidencepriceIcon.png','龙霞：本科毕业于中央美院城市设计学院，硕士研究生毕业于中央美院壁画系，中韩日国际美术家协会会员，央美画室校长。 长达11年美术专业教育，涵盖幼儿、小学、初中，高考以及成人绘画教育。作品曾展览于韩国大使馆，中央美术学院壁画系展厅，中央美术学院展览馆，798熙丰艺术空间，湖北美术馆，韩国釜山市立文化会馆，日本福冈美术馆，宋庄国际书画院，台湾宝胜画廊台湾展厅和北京展厅，北京万荷美术馆，北京玫瑰之名艺术中心……多幅作品成功于嘉德拍卖。出版刊物有《中央美术学院学生作品素描精选》《美食论坛》《构成新概念——平面篇》《新视觉》《中国青年艺术家》《中国大学生美术作品年鉴》','专攻美术，学前，小学，初中，成人均可','龙霞：07年毕业于中央美院城市设计学院，09年毕业于中央美院壁画系研究生班，中韩日国际美术家协会会员，央美画室校长。 作品曾展览于韩国大使馆，中央美术学院壁画系展厅，中央美术学院展览馆，798熙丰艺术空间，湖北美术馆，韩国釜山市立文化会馆，日本福冈美术馆，宋庄国际书画院，台湾宝胜画廊台湾展厅和北京展厅，北京万荷美术馆，北京玫瑰之名艺术中心……多幅作品成功于嘉德拍卖。出版刊物有《中央美术学院学生作品素描精选》《美术论坛》《构成新概念——平面篇》《新视觉》《中国青年艺术家》《中国大学生美术作品年鉴》','06年开始做家教，有十多年的、多角度的针对性的不同年龄段的专业性教育经验；15年担任央美画室校长并担任部分教学任务，期间无数学生多次参加并取得相关展览的奖项。地理位置虽然有改变，但许多学生家长迄今一直保持友好并延伸性的专业性的沟通。',2,21,20,2,'专攻美术，学前，小学，初中，成人均可','headimgs/20170622131955_h4eZS.thumb.700_0.jpeg','teacher2@qq.com',4),(2,2,'13122223333','杨教员','1999-07-05','北京',4,'110221111111111111',5,'师范',NULL,'','北京海淀','11022123',3,'2019-04-28 08:56:42.680534','','本人高考数学成绩140，在理综方面突出，现在是一名在职家教老师，经验丰富。在平时积极报名学校组织的进校园活动，努力与同学们构建良好关系。在大二寒假期间，参加学校举办的河南封丘支教，收益颇多。','','','',1,26,22,1,NULL,'headimgs/u37022307112593481508fm27gp0.jpg','',2),(3,1,'13122223334','冯教员','1969-06-05','北京',5,'110221111111111111',4,'数学',NULL,'','北京朝阳','11022123',3,'2019-04-28 08:55:50.733604','','','','','',2,16,23,2,NULL,'headimgs/u1952644193724671486fm27gp0.jpg','',5),(4,1,'13122223335','杜教员','1992-12-12','河南',5,'110221111111111111',46,'教育学',NULL,'','北京朝阳','11022123',3,'2019-04-28 09:25:07.205224','','作为一名在职老师，我准备用自己的生命去影响孩子的一生，陪伴孩子的心灵，引导他们快乐的学习。\r\n运用《幸福心理学》专业知识，同理、接纳、爱每一个孩子。在教学过程中，自己擅长情商教育，提高孩子的EQ(情绪商数）/AQ（逆境商数）。不仅仅注重学科基础教育，提升孩子的学科成绩，还同步关注学生的品格基础教育，塑造良好的品格（真诚、友善、责任、爱心、乐观）。关注学生的心灵健康培养，全面发展，给学生提供一个健康的学习环境与心态。','擅长：1-由于专业是心理咨询，因此和孩子沟通很容易，能快速的走进孩子的内心，解说青少年心语，增强学生自信心，陪伴学生快乐成长。 2-数学（擅长珠心算），通过算盘的应用，长期培养后可在孩子的脑海中形成一个虚算盘，用数字0、1、5，运算大量的数学，培养逻辑思维能力。\r\n自己有学习过心理学，心理咨询，可以帮助学生建立爱的关系，营造一个很好的学习生活','美国ACI注册心理咨询师，英语四级、计算机二级、','',2,24,24,2,NULL,'headimgs/u18298864503355529358fm27gp0.jpg','',2),(5,1,'13122223336','杨教员','1996-06-08','湖南',9,'110221111111111111',1,'等离子体物理',NULL,'','北京朝阳','11022123',3,'2019-04-28 09:30:07.212090','','具有不错的表达能力和亲和力，与学生相处愉快，讲解条理清晰，深受好评。','无要求','英语四级、六级证书。全国大学生数学竞赛省一等奖、国家三等奖。全国中学生物理竞赛省一等奖、国家三等奖。高中数学竞赛省一等奖。','大学四年在读期间一直兼职家教，两名同学提升显著，数学一度从月考80分提升至期末130分。辅导学生评价一致：讲解耐心富有条理、收获很大。',2,30,25,2,NULL,'headimgs/u20779497953562122090fm27gp0.jpg','',NULL),(6,2,'13122223337','李教员','1996-11-16','黑龙江',5,'110221111111111111',33,'舞蹈教师',NULL,'','北京朝阳','11022123',3,'2019-04-29 09:22:34.209421','','擅长五岁以上孩子的基本功，软度，技巧的训练，带过的孩子参加艺术节，获过多个奖项，家教多份，有经验，一节课就可以清楚的了解孩子的长处和短处，来根据训练。群舞比赛获得过金奖和银奖，教学三年，接触孩子较多，教学内容丰富，较了解孩子的情况和家长的需求','五环外不接课','民族民间舞考级1-3级\r\n计算机考级证书\r\n各大型舞蹈比赛证书\r\n在校内表现优秀所获证书\r\n北京舞蹈学院考级证书','',4,24,26,4,NULL,'headimgs/teacher_picnet_type-0-id-84304-size-200x200-sex-1.jpg','',NULL),(7,2,'13122223338','李教员','1959-03-04','陕西',5,'110221111111111111',48,'生物',NULL,'','北京丰台','11022123',3,'2019-04-29 09:22:24.232582','','本人系北京市重点中学在职高中生物高级教师。具有丰富的教学经验，长期担任高三生物教学工作，十多年的一对一家教经历取得了很好的教学效果。生物课专业性强，很多同学需要老师的指点，我采用目标启导法教学，诠释高考会考知识点，把握教材重点难度，了解学生盲点，凝点。破解考点。预测考试动向。教给学生学习生物的方法，最大限度提高学生学习成绩。如八一中学王同学生物考试不及格。通过我的辅导会考得A,14年高考生物选择题全部正确，非选择题仅错了一个空，因此考上北大。我的教学理念是只要学生目标锁定，有一个好教学过程和方法，理想就会变为现实。欢迎学生家长与我联系，帮你孩子学好并考好生物这门课实现你们的人生梦想。','地铁可到范围均可','高中教师资格，中学高级教师','具有丰富的教学经验，长期担任高三生物教学工作，十多年的一对一家教经历取得了很好的教学效果。生物课专业性强，很多同学需要老师的指点，我采用目标启导法教学，诠释高考会考知识点，把握教材重点难度，了解学生盲点，凝点。破解考点。预测考试动向。教给学生学习生物的方法，最大限度提高学生学习成绩。如八一中学王同学生物考试不及格。通过我的辅导会考得A,14年高考生物选择题全部正确，非选择题仅错了一个空，因此考上北大。我的教学理念是只要学生目标锁定，有一个好教学过程和方法，理想就会变为现实。欢迎学生家长与我联系，帮你孩子学好并考好生物这门课实现你们的人生梦想。',5,16,27,5,NULL,'headimgs/teacher_picnet_type-0-id-81984-size-200x200-sex-1.jpg','',NULL);
/*!40000 ALTER TABLE `users_teacherprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_teacherprofile_price`
--

DROP TABLE IF EXISTS `users_teacherprofile_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users_teacherprofile_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacherprofile_id` int(11) NOT NULL,
  `price_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_teacherprofile_pri_teacherprofile_id_price__36d22058_uniq` (`teacherprofile_id`,`price_id`),
  KEY `users_teacherprofile_price_price_id_bc553c03_fk_users_price_id` (`price_id`),
  CONSTRAINT `users_teacherprofile_price_price_id_bc553c03_fk_users_price_id` FOREIGN KEY (`price_id`) REFERENCES `users_price` (`id`),
  CONSTRAINT `users_teacherprofile_teacherprofile_id_28311b34_fk_users_tea` FOREIGN KEY (`teacherprofile_id`) REFERENCES `users_teacherprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_teacherprofile_price`
--

LOCK TABLES `users_teacherprofile_price` WRITE;
/*!40000 ALTER TABLE `users_teacherprofile_price` DISABLE KEYS */;
INSERT INTO `users_teacherprofile_price` VALUES (1,1,1),(2,1,2),(3,2,1),(4,3,2),(5,4,4),(6,5,3),(7,6,4),(8,7,1),(9,7,2);
/*!40000 ALTER TABLE `users_teacherprofile_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_teacherprofile_subjects`
--

DROP TABLE IF EXISTS `users_teacherprofile_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users_teacherprofile_subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacherprofile_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_teacherprofile_sub_teacherprofile_id_subjec_280ff2a7_uniq` (`teacherprofile_id`,`subject_id`),
  KEY `users_teacherprofile_subject_id_fcf6bd72_fk_users_sub` (`subject_id`),
  CONSTRAINT `users_teacherprofile_subject_id_fcf6bd72_fk_users_sub` FOREIGN KEY (`subject_id`) REFERENCES `users_subject` (`id`),
  CONSTRAINT `users_teacherprofile_teacherprofile_id_04283985_fk_users_tea` FOREIGN KEY (`teacherprofile_id`) REFERENCES `users_teacherprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_teacherprofile_subjects`
--

LOCK TABLES `users_teacherprofile_subjects` WRITE;
/*!40000 ALTER TABLE `users_teacherprofile_subjects` DISABLE KEYS */;
INSERT INTO `users_teacherprofile_subjects` VALUES (3,1,3),(19,1,34),(20,1,35),(21,1,36),(22,1,37),(23,1,38),(24,1,39),(25,1,40),(4,2,5),(5,2,6),(6,2,7),(7,2,9),(8,2,10),(9,2,12),(10,2,14),(11,2,16),(12,2,17),(13,2,22),(14,2,23),(15,2,26),(16,2,27),(17,2,29),(18,2,30),(27,3,5),(28,3,14),(29,3,16),(30,3,17),(31,3,20),(32,3,22),(33,3,26),(26,3,32),(34,4,1),(35,4,2),(36,4,12),(37,4,33),(39,5,17),(40,5,26),(38,5,32),(41,6,57),(42,6,58),(43,6,59),(44,7,24),(45,7,25);
/*!40000 ALTER TABLE `users_teacherprofile_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_teacherprofile_teach_area`
--

DROP TABLE IF EXISTS `users_teacherprofile_teach_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users_teacherprofile_teach_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacherprofile_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_teacherprofile_tea_teacherprofile_id_distri_4f824820_uniq` (`teacherprofile_id`,`district_id`),
  KEY `users_teacherprofile_district_id_b8ea5220_fk_users_dis` (`district_id`),
  CONSTRAINT `users_teacherprofile_district_id_b8ea5220_fk_users_dis` FOREIGN KEY (`district_id`) REFERENCES `users_district` (`id`),
  CONSTRAINT `users_teacherprofile_teacherprofile_id_861ac0d9_fk_users_tea` FOREIGN KEY (`teacherprofile_id`) REFERENCES `users_teacherprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_teacherprofile_teach_area`
--

LOCK TABLES `users_teacherprofile_teach_area` WRITE;
/*!40000 ALTER TABLE `users_teacherprofile_teach_area` DISABLE KEYS */;
INSERT INTO `users_teacherprofile_teach_area` VALUES (1,1,1),(2,1,2),(3,1,3),(4,2,1),(5,2,2),(6,3,1),(7,3,2),(8,3,3),(9,3,4),(10,3,5),(11,3,9),(12,3,10),(13,3,11),(14,3,12),(15,3,13),(17,4,2),(18,4,3),(19,4,4),(20,4,5),(16,4,16),(21,5,1),(22,5,2),(23,5,3),(24,5,4),(25,5,5),(26,5,6),(27,6,1),(28,6,2),(29,6,3),(30,6,4),(31,7,1),(32,7,2),(33,7,3),(34,7,4),(35,7,5),(36,7,6),(37,7,7),(38,7,8),(39,7,9),(40,7,10),(41,7,11),(42,7,12),(43,7,13),(44,7,16);
/*!40000 ALTER TABLE `users_teacherprofile_teach_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_teacherprofile_way`
--

DROP TABLE IF EXISTS `users_teacherprofile_way`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users_teacherprofile_way` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacherprofile_id` int(11) NOT NULL,
  `way_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_teacherprofile_way_teacherprofile_id_way_id_fc9666c6_uniq` (`teacherprofile_id`,`way_id`),
  KEY `users_teacherprofile_way_way_id_ef12e607_fk_users_way_id` (`way_id`),
  CONSTRAINT `users_teacherprofile_teacherprofile_id_26445455_fk_users_tea` FOREIGN KEY (`teacherprofile_id`) REFERENCES `users_teacherprofile` (`id`),
  CONSTRAINT `users_teacherprofile_way_way_id_ef12e607_fk_users_way_id` FOREIGN KEY (`way_id`) REFERENCES `users_way` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_teacherprofile_way`
--

LOCK TABLES `users_teacherprofile_way` WRITE;
/*!40000 ALTER TABLE `users_teacherprofile_way` DISABLE KEYS */;
INSERT INTO `users_teacherprofile_way` VALUES (1,1,1),(2,1,2),(3,1,3),(4,2,1),(5,2,3),(6,3,1),(7,4,1),(8,5,1),(9,5,2),(10,6,1),(11,7,1);
/*!40000 ALTER TABLE `users_teacherprofile_way` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user`
--

DROP TABLE IF EXISTS `users_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `username` varchar(150) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `create_datetime` datetime(6) NOT NULL,
  `update_datetime` datetime(6) NOT NULL,
  `type` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user`
--

LOCK TABLES `users_user` WRITE;
/*!40000 ALTER TABLE `users_user` DISABLE KEYS */;
INSERT INTO `users_user` VALUES (1,'pbkdf2_sha256$36000$Bz6XL7CzzgoR$wdPGwwSwFy7ZiP1BA5ATdKRj5hgMAP+szRJ0AArN/AU=','2019-05-05 00:54:50.837858',1,'','','','2019-04-08 07:17:50.521984','admin',1,1,'2019-04-08 07:17:50.562390','2019-04-08 07:17:50.562444',NULL),(15,'pbkdf2_sha256$36000$TMPmIzSLNrhm$cXpJw5kJDgGmX50Nj07+/6eIK/gOuO+0xVZ00wx/ZBc=','2019-04-27 13:48:57.898725',0,'','','','2019-04-11 01:55:56.695472','student1',1,0,'2019-04-11 01:55:56.731062','2019-04-11 01:55:56.731080',2),(20,'pbkdf2_sha256$36000$Z2Qg3L1BLapg$NkNgPmg51PMdaL/ta5mcEYPYhuljr+401KYNY0/qweo=','2019-04-27 13:04:59.228695',0,'','','','2019-04-11 03:30:49.865158','teacher2',1,0,'2019-04-11 03:30:49.899227','2019-04-28 06:20:44.614722',1),(22,'pbkdf2_sha256$36000$r0weR5e8Dy8A$dtPrSGaBosvkTls4Nd5iIFjXMoRwZrlof3NQ+SOU2/Q=','2019-04-28 06:50:52.313157',0,'','','','2019-04-28 06:11:18.142736','teacher3',1,0,'2019-04-28 06:11:18.184536','2019-04-28 08:55:22.812229',1),(23,'pbkdf2_sha256$36000$miksY3huKeJS$g+wstCTZBe3zV7++YA11warcBxso0pn8zRXEjo6uSM4=',NULL,0,'','','','2019-04-28 08:53:44.878153','teacher4',1,0,'2019-04-28 08:53:44.932292','2019-04-28 08:54:28.439694',1),(24,'pbkdf2_sha256$36000$oOHHl0TdhrWO$Ess+wZ9UjjJLxJ8uN4diXflJnswKiMUR1QQACsvG6UY=',NULL,0,'','','','2019-04-28 09:24:44.911292','teacher5',1,0,'2019-04-28 09:24:44.941826','2019-04-28 09:26:07.460947',1),(25,'pbkdf2_sha256$36000$PS1vaCKk2Lwk$jMczA8YahYn/Zda/muShjFVTkjKfPqvs6tGqwLi6jlI=',NULL,0,'','','','2019-04-28 09:30:07.169861','teacher6',1,0,'2019-04-28 09:30:07.207261','2019-04-29 09:12:25.032564',1),(26,'pbkdf2_sha256$36000$b7tZJyZyheXI$oxKGxaV2iFSOJIeCLZli2hqKfkrFaulW0k2/gCG9ZmU=',NULL,0,'','','','2019-04-29 09:18:04.975999','teacher7',1,0,'2019-04-29 09:18:05.033109','2019-04-29 09:22:34.202302',1),(27,'pbkdf2_sha256$36000$7LMM9oXcvzKi$BUo5ycXFFEsoW9ZTx/wcsvabpU1w5kmmlEWlxmXgQGM=',NULL,0,'','','','2019-04-29 09:22:24.193356','teacher8',1,0,'2019-04-29 09:22:24.226447','2019-04-29 09:22:51.758859',1);
/*!40000 ALTER TABLE `users_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user_groups`
--

DROP TABLE IF EXISTS `users_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_user_groups_user_id_group_id_b88eab82_uniq` (`user_id`,`group_id`),
  KEY `users_user_groups_group_id_9afc8d0e_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_user_groups_group_id_9afc8d0e_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `users_user_groups_user_id_5f6f5a90_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user_groups`
--

LOCK TABLES `users_user_groups` WRITE;
/*!40000 ALTER TABLE `users_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user_user_permissions`
--

DROP TABLE IF EXISTS `users_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_user_user_permissions_user_id_permission_id_43338c45_uniq` (`user_id`,`permission_id`),
  KEY `users_user_user_perm_permission_id_0b93982e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_user_user_perm_permission_id_0b93982e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_user_user_permissions_user_id_20aca447_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user_user_permissions`
--

LOCK TABLES `users_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_usercomment`
--

DROP TABLE IF EXISTS `users_usercomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users_usercomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` longtext NOT NULL,
  `create_datetime` datetime(6) NOT NULL,
  `status` smallint(6) NOT NULL,
  `creator_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_usercomment_creator_id_fed61a68_fk_users_user_id` (`creator_id`),
  KEY `users_usercomment_parent_id_fb12fa4a_fk_users_usercomment_id` (`parent_id`),
  KEY `users_usercomment_user_id_38224f6e_fk_users_user_id` (`user_id`),
  CONSTRAINT `users_usercomment_creator_id_fed61a68_fk_users_user_id` FOREIGN KEY (`creator_id`) REFERENCES `users_user` (`id`),
  CONSTRAINT `users_usercomment_parent_id_fb12fa4a_fk_users_usercomment_id` FOREIGN KEY (`parent_id`) REFERENCES `users_usercomment` (`id`),
  CONSTRAINT `users_usercomment_user_id_38224f6e_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_usercomment`
--

LOCK TABLES `users_usercomment` WRITE;
/*!40000 ALTER TABLE `users_usercomment` DISABLE KEYS */;
INSERT INTO `users_usercomment` VALUES (1,'测试教师评价','2019-04-27 05:05:47.100092',2,15,NULL,20);
/*!40000 ALTER TABLE `users_usercomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_way`
--

DROP TABLE IF EXISTS `users_way`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users_way` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_way`
--

LOCK TABLES `users_way` WRITE;
/*!40000 ALTER TABLE `users_way` DISABLE KEYS */;
INSERT INTO `users_way` VALUES (1,'本人上门'),(2,'学生上门'),(3,'网上辅导');
/*!40000 ALTER TABLE `users_way` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-05 20:31:49
