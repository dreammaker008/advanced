-- MySQL dump 10.13  Distrib 5.7.21, for Win64 (x86_64)
--
-- Host: localhost    Database: yii2advanced
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
-- Table structure for table `auth_assignment`
--

DROP TABLE IF EXISTS `auth_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `idx-auth_assignment-user_id` (`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_assignment`
--

LOCK TABLES `auth_assignment` WRITE;
/*!40000 ALTER TABLE `auth_assignment` DISABLE KEYS */;
INSERT INTO `auth_assignment` VALUES ('市场','1',1551189595),('市场','2',1551425788),('操作市场','2',1551425989);
/*!40000 ALTER TABLE `auth_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item`
--

DROP TABLE IF EXISTS `auth_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item`
--

LOCK TABLES `auth_item` WRITE;
/*!40000 ALTER TABLE `auth_item` DISABLE KEYS */;
INSERT INTO `auth_item` VALUES ('/*',2,NULL,NULL,NULL,1551418846,1551418846),('/admin/*',2,NULL,NULL,NULL,1551418845,1551418845),('/admin/assignment/*',2,NULL,NULL,NULL,1551418845,1551418845),('/admin/assignment/assign',2,NULL,NULL,NULL,1551418845,1551418845),('/admin/assignment/index',2,NULL,NULL,NULL,1551418845,1551418845),('/admin/assignment/revoke',2,NULL,NULL,NULL,1551418845,1551418845),('/admin/assignment/view',2,NULL,NULL,NULL,1551418845,1551418845),('/admin/default/*',2,NULL,NULL,NULL,1551418845,1551418845),('/admin/default/index',2,NULL,NULL,NULL,1551418845,1551418845),('/admin/menu/*',2,NULL,NULL,NULL,1551418845,1551418845),('/admin/menu/create',2,NULL,NULL,NULL,1551418845,1551418845),('/admin/menu/delete',2,NULL,NULL,NULL,1551418845,1551418845),('/admin/menu/index',2,NULL,NULL,NULL,1551418845,1551418845),('/admin/menu/update',2,NULL,NULL,NULL,1551418845,1551418845),('/admin/menu/view',2,NULL,NULL,NULL,1551418845,1551418845),('/admin/permission/*',2,NULL,NULL,NULL,1551418845,1551418845),('/admin/permission/assign',2,NULL,NULL,NULL,1551418845,1551418845),('/admin/permission/create',2,NULL,NULL,NULL,1551418845,1551418845),('/admin/permission/delete',2,NULL,NULL,NULL,1551418845,1551418845),('/admin/permission/index',2,NULL,NULL,NULL,1551418845,1551418845),('/admin/permission/remove',2,NULL,NULL,NULL,1551418845,1551418845),('/admin/permission/update',2,NULL,NULL,NULL,1551418845,1551418845),('/admin/permission/view',2,NULL,NULL,NULL,1551418845,1551418845),('/admin/role/*',2,NULL,NULL,NULL,1551418845,1551418845),('/admin/role/assign',2,NULL,NULL,NULL,1551418845,1551418845),('/admin/role/create',2,NULL,NULL,NULL,1551418845,1551418845),('/admin/role/delete',2,NULL,NULL,NULL,1551418845,1551418845),('/admin/role/index',2,NULL,NULL,NULL,1551418845,1551418845),('/admin/role/remove',2,NULL,NULL,NULL,1551418845,1551418845),('/admin/role/update',2,NULL,NULL,NULL,1551418845,1551418845),('/admin/role/view',2,NULL,NULL,NULL,1551418845,1551418845),('/admin/route/*',2,NULL,NULL,NULL,1551418845,1551418845),('/admin/route/assign',2,NULL,NULL,NULL,1551418845,1551418845),('/admin/route/create',2,NULL,NULL,NULL,1551418845,1551418845),('/admin/route/index',2,NULL,NULL,NULL,1551418845,1551418845),('/admin/route/refresh',2,NULL,NULL,NULL,1551418845,1551418845),('/admin/route/remove',2,NULL,NULL,NULL,1551418845,1551418845),('/admin/rule/*',2,NULL,NULL,NULL,1551418845,1551418845),('/admin/rule/create',2,NULL,NULL,NULL,1551418845,1551418845),('/admin/rule/delete',2,NULL,NULL,NULL,1551418845,1551418845),('/admin/rule/index',2,NULL,NULL,NULL,1551418845,1551418845),('/admin/rule/update',2,NULL,NULL,NULL,1551418845,1551418845),('/admin/rule/view',2,NULL,NULL,NULL,1551418845,1551418845),('/admin/user/*',2,NULL,NULL,NULL,1551418845,1551418845),('/admin/user/activate',2,NULL,NULL,NULL,1551418845,1551418845),('/admin/user/change-password',2,NULL,NULL,NULL,1551418845,1551418845),('/admin/user/delete',2,NULL,NULL,NULL,1551418845,1551418845),('/admin/user/index',2,NULL,NULL,NULL,1551418845,1551418845),('/admin/user/login',2,NULL,NULL,NULL,1551418845,1551418845),('/admin/user/logout',2,NULL,NULL,NULL,1551418845,1551418845),('/admin/user/request-password-reset',2,NULL,NULL,NULL,1551418845,1551418845),('/admin/user/reset-password',2,NULL,NULL,NULL,1551418845,1551418845),('/admin/user/signup',2,NULL,NULL,NULL,1551418845,1551418845),('/admin/user/view',2,NULL,NULL,NULL,1551418845,1551418845),('/debug/*',2,NULL,NULL,NULL,1551418845,1551418845),('/debug/default/*',2,NULL,NULL,NULL,1551418845,1551418845),('/debug/default/db-explain',2,NULL,NULL,NULL,1551418845,1551418845),('/debug/default/download-mail',2,NULL,NULL,NULL,1551418845,1551418845),('/debug/default/index',2,NULL,NULL,NULL,1551418845,1551418845),('/debug/default/toolbar',2,NULL,NULL,NULL,1551418845,1551418845),('/debug/default/view',2,NULL,NULL,NULL,1551418845,1551418845),('/debug/user/*',2,NULL,NULL,NULL,1551418845,1551418845),('/debug/user/reset-identity',2,NULL,NULL,NULL,1551418845,1551418845),('/debug/user/set-identity',2,NULL,NULL,NULL,1551418845,1551418845),('/gii/*',2,NULL,NULL,NULL,1551418845,1551418845),('/gii/default/*',2,NULL,NULL,NULL,1551418845,1551418845),('/gii/default/action',2,NULL,NULL,NULL,1551418845,1551418845),('/gii/default/diff',2,NULL,NULL,NULL,1551418845,1551418845),('/gii/default/index',2,NULL,NULL,NULL,1551418845,1551418845),('/gii/default/preview',2,NULL,NULL,NULL,1551418845,1551418845),('/gii/default/view',2,NULL,NULL,NULL,1551418845,1551418845),('/goods/*',2,NULL,NULL,NULL,1551323257,1551323257),('/goods/create',2,NULL,NULL,NULL,1551323134,1551323134),('/goods/delete',2,NULL,NULL,NULL,1551323134,1551323134),('/goods/index',2,NULL,NULL,NULL,1551323134,1551323134),('/goods/update',2,NULL,NULL,NULL,1551323134,1551323134),('/goods/view',2,NULL,NULL,NULL,1551323134,1551323134),('/kuaidi/*',2,NULL,NULL,NULL,1551418845,1551418845),('/kuaidi/default/*',2,NULL,NULL,NULL,1551418845,1551418845),('/kuaidi/default/index',2,NULL,NULL,NULL,1551418845,1551418845),('/site/*',2,NULL,NULL,NULL,1551418846,1551418846),('/site/error',2,NULL,NULL,NULL,1551418846,1551418846),('/site/index',2,NULL,NULL,NULL,1551418846,1551418846),('/site/login',2,NULL,NULL,NULL,1551418846,1551418846),('/site/logout',2,NULL,NULL,NULL,1551418846,1551418846),('市场',1,NULL,NULL,NULL,1551189120,1551189120),('操作市场',2,NULL,NULL,NULL,1551189268,1551189268),('普通用户',1,NULL,NULL,NULL,1551323442,1551323442);
/*!40000 ALTER TABLE `auth_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item_child`
--

DROP TABLE IF EXISTS `auth_item_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item_child`
--

LOCK TABLES `auth_item_child` WRITE;
/*!40000 ALTER TABLE `auth_item_child` DISABLE KEYS */;
INSERT INTO `auth_item_child` VALUES ('市场','/*'),('市场','/admin/*'),('市场','/admin/assignment/*'),('市场','/admin/assignment/assign'),('市场','/admin/assignment/index'),('市场','/admin/assignment/revoke'),('市场','/admin/assignment/view'),('市场','/admin/default/*'),('市场','/admin/default/index'),('市场','/admin/menu/*'),('市场','/admin/menu/create'),('市场','/admin/menu/delete'),('市场','/admin/menu/index'),('市场','/admin/menu/update'),('市场','/admin/menu/view'),('市场','/admin/permission/*'),('市场','/admin/permission/assign'),('市场','/admin/permission/create'),('市场','/admin/permission/delete'),('市场','/admin/permission/index'),('市场','/admin/permission/remove'),('市场','/admin/permission/update'),('市场','/admin/permission/view'),('市场','/admin/role/*'),('市场','/admin/role/assign'),('市场','/admin/role/create'),('市场','/admin/role/delete'),('市场','/admin/role/index'),('市场','/admin/role/remove'),('市场','/admin/role/update'),('市场','/admin/role/view'),('市场','/admin/route/*'),('市场','/admin/route/assign'),('市场','/admin/route/create'),('市场','/admin/route/index'),('市场','/admin/route/refresh'),('市场','/admin/route/remove'),('市场','/admin/rule/*'),('市场','/admin/rule/create'),('市场','/admin/rule/delete'),('市场','/admin/rule/index'),('市场','/admin/rule/update'),('市场','/admin/rule/view'),('市场','/admin/user/*'),('市场','/admin/user/activate'),('市场','/admin/user/change-password'),('市场','/admin/user/delete'),('市场','/admin/user/index'),('市场','/admin/user/login'),('市场','/admin/user/logout'),('市场','/admin/user/request-password-reset'),('市场','/admin/user/reset-password'),('市场','/admin/user/signup'),('市场','/admin/user/view'),('市场','/debug/*'),('市场','/debug/default/*'),('市场','/debug/default/db-explain'),('市场','/debug/default/download-mail'),('市场','/debug/default/index'),('市场','/debug/default/toolbar'),('市场','/debug/default/view'),('市场','/debug/user/*'),('市场','/debug/user/reset-identity'),('市场','/debug/user/set-identity'),('市场','/gii/*'),('市场','/gii/default/*'),('市场','/gii/default/action'),('市场','/gii/default/diff'),('市场','/gii/default/index'),('市场','/gii/default/preview'),('市场','/gii/default/view'),('市场','/goods/*'),('操作市场','/goods/*'),('市场','/goods/create'),('操作市场','/goods/create'),('市场','/goods/delete'),('操作市场','/goods/delete'),('市场','/goods/index'),('操作市场','/goods/index'),('普通用户','/goods/index'),('市场','/goods/update'),('操作市场','/goods/update'),('市场','/goods/view'),('操作市场','/goods/view'),('市场','/kuaidi/*'),('市场','/kuaidi/default/*'),('市场','/kuaidi/default/index'),('市场','/site/*'),('市场','/site/error'),('市场','/site/index'),('市场','/site/login'),('市场','/site/logout'),('市场','操作市场');
/*!40000 ALTER TABLE `auth_item_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_rule`
--

DROP TABLE IF EXISTS `auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_rule`
--

LOCK TABLES `auth_rule` WRITE;
/*!40000 ALTER TABLE `auth_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (1,'ttttt'),(2,'ffff');
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `data` blob,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (2,'权限控制',NULL,'/admin/default/index',NULL,NULL),(3,'路由',2,'/admin/route/index',NULL,NULL),(4,'权限',2,'/admin/permission/index',NULL,NULL),(5,'角色',2,'/admin/role/index',NULL,NULL),(6,'分配',2,'/admin/assignment/index',NULL,NULL),(7,'菜单',2,'/admin/menu/index',NULL,NULL),(8,'规则',2,'/admin/rule/index',NULL,NULL);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration`
--

DROP TABLE IF EXISTS `migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration`
--

LOCK TABLES `migration` WRITE;
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
INSERT INTO `migration` VALUES ('m000000_000000_base',1551175132),('m130524_201442_init',1551175181),('m140602_111327_create_menu_table',1551188563),('m160312_050000_create_user',1551188563),('m140506_102106_rbac_init',1551188642),('m170907_052038_rbac_add_index_on_auth_assignment_user_id',1551188642),('m180523_151638_rbac_updates_indexes_without_prefix',1551188642),('m190228_015952_create_goods_table',1551319402);
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'chenxiangzhun','h3BrJe4WgfasOxyIu9e0Wt5lqCfMMzIj','$2y$13$k3CfoswMHTZa/IuwT.sVnOegSqRiCvojDMbYko.l75zqSm2yeCh.y',NULL,'test@test.com',10,1551189177,1551189177),(2,'cxz','GZ8qFr_Id30vMJ1luyNGMdE7V0elM9QX','$2y$13$0Sv8iGVqJcjdPiNvamDgPeylSPMNULabPYHiCGuzQX5F4Ga2S8lrC',NULL,'test@test.com1',10,1551323543,1551323543);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-01 19:49:22
