/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.3-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: eadchatbot
-- ------------------------------------------------------
-- Server version	11.8.3-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `admin_interface_theme`
--

DROP TABLE IF EXISTS `admin_interface_theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_interface_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_visible` tinyint(1) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `logo_visible` tinyint(1) NOT NULL,
  `css_header_background_color` varchar(10) NOT NULL,
  `title_color` varchar(10) NOT NULL,
  `css_header_text_color` varchar(10) NOT NULL,
  `css_header_link_color` varchar(10) NOT NULL,
  `css_header_link_hover_color` varchar(10) NOT NULL,
  `css_module_background_color` varchar(10) NOT NULL,
  `css_module_text_color` varchar(10) NOT NULL,
  `css_module_link_color` varchar(10) NOT NULL,
  `css_module_link_hover_color` varchar(10) NOT NULL,
  `css_module_rounded_corners` tinyint(1) NOT NULL,
  `css_generic_link_color` varchar(10) NOT NULL,
  `css_generic_link_hover_color` varchar(10) NOT NULL,
  `css_save_button_background_color` varchar(10) NOT NULL,
  `css_save_button_background_hover_color` varchar(10) NOT NULL,
  `css_save_button_text_color` varchar(10) NOT NULL,
  `css_delete_button_background_color` varchar(10) NOT NULL,
  `css_delete_button_background_hover_color` varchar(10) NOT NULL,
  `css_delete_button_text_color` varchar(10) NOT NULL,
  `list_filter_dropdown` tinyint(1) NOT NULL,
  `related_modal_active` tinyint(1) NOT NULL,
  `related_modal_background_color` varchar(10) NOT NULL,
  `related_modal_rounded_corners` tinyint(1) NOT NULL,
  `logo_color` varchar(10) NOT NULL,
  `recent_actions_visible` tinyint(1) NOT NULL,
  `favicon` varchar(100) NOT NULL,
  `related_modal_background_opacity` varchar(5) NOT NULL,
  `env_name` varchar(50) NOT NULL,
  `env_visible_in_header` tinyint(1) NOT NULL,
  `env_color` varchar(10) NOT NULL,
  `env_visible_in_favicon` tinyint(1) NOT NULL,
  `related_modal_close_button_visible` tinyint(1) NOT NULL,
  `language_chooser_active` tinyint(1) NOT NULL,
  `language_chooser_display` varchar(10) NOT NULL,
  `list_filter_sticky` tinyint(1) NOT NULL,
  `form_pagination_sticky` tinyint(1) NOT NULL,
  `form_submit_sticky` tinyint(1) NOT NULL,
  `css_module_background_selected_color` varchar(10) NOT NULL,
  `css_module_link_selected_color` varchar(10) NOT NULL,
  `logo_max_height` smallint(5) unsigned NOT NULL CHECK (`logo_max_height` >= 0),
  `logo_max_width` smallint(5) unsigned NOT NULL CHECK (`logo_max_width` >= 0),
  `foldable_apps` tinyint(1) NOT NULL,
  `language_chooser_control` varchar(20) NOT NULL,
  `list_filter_highlight` tinyint(1) NOT NULL,
  `list_filter_removal_links` tinyint(1) NOT NULL,
  `show_fieldsets_as_tabs` tinyint(1) NOT NULL,
  `show_inlines_as_tabs` tinyint(1) NOT NULL,
  `css_generic_link_active_color` varchar(10) NOT NULL,
  `collapsible_stacked_inlines` tinyint(1) NOT NULL,
  `collapsible_stacked_inlines_collapsed` tinyint(1) NOT NULL,
  `collapsible_tabular_inlines` tinyint(1) NOT NULL,
  `collapsible_tabular_inlines_collapsed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_interface_theme_name_30bda70f_uniq` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_interface_theme`
--

LOCK TABLES `admin_interface_theme` WRITE;
/*!40000 ALTER TABLE `admin_interface_theme` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `admin_interface_theme` VALUES
(1,'Django',0,'Administración de Django',1,'',1,'#0C4B33','#F5DD5D','#44B78B','#FFFFFF','#C9F0DD','#44B78B','#FFFFFF','#FFFFFF','#C9F0DD',1,'#0C3C26','#156641','#0C4B33','#0C3C26','#FFFFFF','#BA2121','#A41515','#FFFFFF',1,1,'#000000',1,'#FFFFFF',1,'','0.3','',1,'#E74C3C',1,1,1,'code',1,0,0,'#FFFFCC','#FFFFFF',100,400,1,'default-select',1,0,0,0,'#29B864',0,1,0,1),
(2,'EAD-AHPF-ME',1,'Asistente Virtual Moodle - EAD - AHPF - ME',1,'',0,'#153244','#fff','#FFF','#8de2d6','#C9F0DD','#8de2d6','#3c3c3b','#3c3c3b','#153244',1,'#3c3c3b','#153244','#153244','#3c3c3b','#FFFFFF','#BA2121','#A41515','#FFFFFF',1,1,'#3c3c3b',1,'#FFFFFF',1,'','0.3','Datos registrados',1,'#ffffff',1,1,1,'code',1,0,0,'#ffcc00','#3c3c3b',100,400,1,'default-select',1,0,0,0,'#ffcc00',0,1,0,1);
/*!40000 ALTER TABLE `admin_interface_theme` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `appchatbot_consultachatbot`
--

DROP TABLE IF EXISTS `appchatbot_consultachatbot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `appchatbot_consultachatbot` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime(6) NOT NULL,
  `user_input` longtext NOT NULL,
  `predicted_tag` varchar(100) NOT NULL,
  `confidence` double NOT NULL,
  `related_tags` longtext NOT NULL,
  `user_id_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `appchatbot_consultac_user_id_id_95790923_fk_appsoport` (`user_id_id`),
  CONSTRAINT `appchatbot_consultac_user_id_id_95790923_fk_appsoport` FOREIGN KEY (`user_id_id`) REFERENCES `appsoporte_costumer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=164 ;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `appcomentarios_comment`
--

DROP TABLE IF EXISTS `appcomentarios_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `appcomentarios_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_comment` datetime(6) NOT NULL,
  `comment` longtext NOT NULL,
  `user_moodle` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 ;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `appconfig_allowedorigincors`
--

DROP TABLE IF EXISTS `appconfig_allowedorigincors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `appconfig_allowedorigincors` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `origin` varchar(200) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appconfig_allowedorigincors`
--

LOCK TABLES `appconfig_allowedorigincors` WRITE;
/*!40000 ALTER TABLE `appconfig_allowedorigincors` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `appconfig_allowedorigincors` VALUES
(1,'http://localhost:4200',1);
/*!40000 ALTER TABLE `appconfig_allowedorigincors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `appconfig_supportemailconfig`
--

DROP TABLE IF EXISTS `appconfig_supportemailconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `appconfig_supportemailconfig` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `password` varchar(128) NOT NULL,
  `from_email` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `host` varchar(255) NOT NULL,
  `port` int(11) NOT NULL,
  `use_tls` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appconfig_supportemailconfig`
--

LOCK TABLES `appconfig_supportemailconfig` WRITE;
/*!40000 ALTER TABLE `appconfig_supportemailconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `appconfig_supportemailconfig` VALUES
(1,'cristian.toledo@bue.edu.ar','xjke wffv prjo khqt','Educación a Distancia - Soporte',1,'smtp.gmail.com',587,1);
/*!40000 ALTER TABLE `appconfig_supportemailconfig` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `appsoporte_costumer`
--

DROP TABLE IF EXISTS `appsoporte_costumer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `appsoporte_costumer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `idMoodle` varchar(12) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `rol_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `appsoporte_costumer_rol_id_8e9756e6_fk_appsoporte_rolcostumer_id` (`rol_id`),
  CONSTRAINT `appsoporte_costumer_rol_id_8e9756e6_fk_appsoporte_rolcostumer_id` FOREIGN KEY (`rol_id`) REFERENCES `appsoporte_rolcostumer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11223360 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appsoporte_costumer`
--

LOCK TABLES `appsoporte_costumer` WRITE;
/*!40000 ALTER TABLE `appsoporte_costumer` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `appsoporte_costumer` VALUES
(1,'12345678','ch.ariel.tole@gmail.com',6),
(2,'guest','usuario.invitado@sin.correo',5),
(3,'31925615','facundovaldiviezo@gmail.com',6),
(4,'18262416','gustavo.morcillo@bue.edu.ar',6),
(5,'17602040','marcelo.castro@bue.edu.ar',6),
(6,'18316613','marcelo.malara@bue.edu.ar',6),
(7,'24587288','rdariodepirro@gmail.com',6),
(8,'28419899','luciana.heredia@bue.edu.ar',6),
(9,'35126125','rodrigo.olguin@bue.edu.ar',6),
(10,'40129151','agustina.speranza@bue.edu.ar',6),
(11,'42077875','sol.melany@bue.edu.ar',6),
(12,'13801440','raul.vitaliano@bue.edu.ar',6),
(13,'33859286','debi_rapetti@hotmail.com',6),
(14,'26443248','fernando.maceda@bue.edu.ar',6),
(15,'17985787','patricia.montiel@bue.edu.ar',6),
(16,'18802560','rosanabeatriz.ruiz@bue.edu.ar',6),
(17,'22260663','sergio.tielli@bue.edu.ar',6),
(18,'30278507','gaston.bergua@bue.edu.ar',6),
(19,'23508292','pablo.conrado@bue.edu.ar',6),
(20,'35365653','camila.artaza@bue.edu.ar',6),
(21,'18580560','laura.artaza@bue.edu.ar',6),
(22,'21957960','rafael.prochet@bue.edu.ar',6),
(23,'18450129','mario.cebron@bue.edu.ar',6),
(24,'30892643','sebastian.camjayi@bue.edu.ar',6),
(25,'39465625','mic.fernandez@bue.edu.ar',6),
(26,'38668645','carina.croce@bue.edu.ar',6),
(27,'31898630','roxana.salinas@bue.edu.ar',6),
(28,'26691553','claudio.pachelli@bue.edu.ar',6),
(29,'16247676','federico.echevarria@bue.edu.ar',6),
(30,'35418990','daniela.misino@bue.edu.ar',6),
(31,'39772917','micael.lopez@bue.edu.ar',6),
(32,'27380680','nahuel.correa@bue.edu.ar',6),
(33,'21511064','mirta.soraide@bue.edu.ar',6),
(34,'25981845','oscar.rabina@bue.edu.ar',6),
(35,'38068087','jua.rodriguez@bue.edu.ar',6),
(36,'23673132','susana.lujan@bue.edu.ar',6),
(37,'34359406','johanna.aiza@bue.edu.ar',6),
(38,'33103215','barbara.grabe@bue.edu.ar',6),
(39,'31826590','damian.trajster@bue.edu.ar',6),
(40,'30035530','edgar.bartley@bue.edu.ar',6),
(41,'18694886','megafonr@gmail.com',6),
(42,'23068258','roxana.svagher@bue.edu.ar',6),
(43,'36530464','marcelo.kavurmaci@bue.edu.ar',6),
(44,'94182223','junior.valdivia@bue.edu.ar',6),
(45,'18027838','robertoh.maldonado@bue.edu.ar',6),
(46,'36741506','jonathan.suarez@bue.edu.ar',6),
(47,'42077143','antonella.impembo@bue.edu.ar',6),
(48,'23602273','adrian.maiello@bue.edu.ar',6),
(49,'35984160','lucila.doldan@bue.edu.ar',6),
(50,'25866280','diegoan.lopez@bue.edu.ar',6),
(51,'23877713','nancy.delfino@bue.edu.ar',6),
(52,'22114196','marianof.vazquez@bue.edu.ar',6),
(53,'16602769','roberto.schettino@bue.edu.ar',6),
(54,'28671241','silvia.vives@bue.edu.ar',6),
(55,'34534209','maria.lagarde@bue.edu.ar',6),
(56,'41163710','ALD.GONZALEZ@BUE.EDU.AR',6),
(57,'38203853','marcos.cirese@gmail.com',6),
(58,'24608963','mariela.mazzeo@bue.edu.ar',6),
(59,'30289340','ma.orono@bue.edu.ar',6),
(60,'34991645','roberto.cabellon@bue.edu.ar',6),
(61,'21487734','carlos.gonzalez@bue.edu.ar',6),
(62,'31151412','diego.neil@bue.edu.ar',6),
(63,'35233579','maria.zamojski@bue.edu.ar',6),
(64,'25559788','norberto.morales@bue.edu.ar',6),
(65,'33688193','florencia.nonini@bue.edu.ar',6),
(66,'31190872','jorgelina.hermocilla@bue.edu.ar',6),
(67,'22257810','sandro.rojas@bue.edu.ar',6),
(68,'24110476','adrian.irurueta@bue.edu.ar',6),
(69,'43993291','alan.williams@bue.edu.ar',6),
(70,'14830647','manuel.gomez@bue.edu.ar',6),
(71,'28227891','daniela.miranda@bue.edu.ar',6),
(72,'25227649','diego.picotto@bue.edu.ar',6),
(73,'18294449','sergio.lesbegueris@bue.edu.ar',6),
(74,'17761761','norberto.guerra@bue.edu.ar',6),
(75,'26400587','emiliano.reina@bue.edu.ar',6),
(76,'28615181','lucia.arancibia@bue.edu.ar',6),
(77,'35363813','virginia.bacone@bue.edu.ar',6),
(11223359,'12345688',NULL,8);
/*!40000 ALTER TABLE `appsoporte_costumer` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `appsoporte_question`
--

DROP TABLE IF EXISTS `appsoporte_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `appsoporte_question` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `text` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `override_email` varchar(254) DEFAULT NULL,
  `status` varchar(10) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `appsoporte_question_customer_id_3aa5bcf8_fk_appsoport` (`customer_id`),
  CONSTRAINT `appsoporte_question_customer_id_3aa5bcf8_fk_appsoport` FOREIGN KEY (`customer_id`) REFERENCES `appsoporte_costumer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appsoporte_question`
--

LOCK TABLES `appsoporte_question` WRITE;
/*!40000 ALTER TABLE `appsoporte_question` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `appsoporte_question` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `appsoporte_response`
--

DROP TABLE IF EXISTS `appsoporte_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `appsoporte_response` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `text` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `sent_ok` tinyint(1) NOT NULL,
  `error_log` longtext DEFAULT NULL,
  `answered_by_id` bigint(20) DEFAULT NULL,
  `question_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `question_id` (`question_id`),
  KEY `appsoporte_response_answered_by_id_2de94abe_fk_appusuari` (`answered_by_id`),
  CONSTRAINT `appsoporte_response_answered_by_id_2de94abe_fk_appusuari` FOREIGN KEY (`answered_by_id`) REFERENCES `appusuarios_user` (`id`),
  CONSTRAINT `appsoporte_response_question_id_a503d3fa_fk_appsoport` FOREIGN KEY (`question_id`) REFERENCES `appsoporte_question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appsoporte_response`
--

LOCK TABLES `appsoporte_response` WRITE;
/*!40000 ALTER TABLE `appsoporte_response` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `appsoporte_response` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `appsoporte_rolcostumer`
--

DROP TABLE IF EXISTS `appsoporte_rolcostumer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `appsoporte_rolcostumer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rol` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rol` (`rol`)
) ENGINE=InnoDB AUTO_INCREMENT=9 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appsoporte_rolcostumer`
--

LOCK TABLES `appsoporte_rolcostumer` WRITE;
/*!40000 ALTER TABLE `appsoporte_rolcostumer` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `appsoporte_rolcostumer` VALUES
(1,'Docente'),
(6,'Gestor/Referente'),
(8,'Indefinido'),
(5,'Invitada/o');
/*!40000 ALTER TABLE `appsoporte_rolcostumer` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `appusuarios_user`
--

DROP TABLE IF EXISTS `appusuarios_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `appusuarios_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `email` varchar(254) NOT NULL,
  `name` varchar(60) NOT NULL,
  `last_name` varchar(60) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `must_change_password` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appusuarios_user`
--

LOCK TABLES `appusuarios_user` WRITE;
/*!40000 ALTER TABLE `appusuarios_user` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `appusuarios_user` VALUES
(1,'pbkdf2_sha256$600000$ElqgMU9r4JamN7zC6dVMjv$kUmZOw033lIKeFuENB6m/MH5Qj8BRmtpy2jsJxFEoFA=','2025-09-02 12:42:57.737622',1,'cristian.toledo@bue.edu.ar','Christian','Toledo',1,1,'2025-08-18 13:02:57.020552',0),
(2,'',NULL,0,'angularapp@bue.edu.ar','Angular App','Frontend',1,0,'2025-05-29 00:22:22.864104',1),
(3,'pbkdf2_sha256$600000$QtqKkKYhIgLgzmuSYP5ljb$l1dulSlfMB4SrYiuQwQN/mBKvc9X9YCqYh0pG0zvxgY=','2025-09-01 22:38:55.673430',0,'rocionoelia.rodriguez@bue.edu.ar','Rocío','Rodriguez',1,1,'2025-05-29 00:26:37.540820',0);
/*!40000 ALTER TABLE `appusuarios_user` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `appusuarios_user_groups`
--

DROP TABLE IF EXISTS `appusuarios_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `appusuarios_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `appusuarios_user_groups_user_id_group_id_b9dc76f6_uniq` (`user_id`,`group_id`),
  KEY `appusuarios_user_groups_group_id_11c5ac18_fk_auth_group_id` (`group_id`),
  CONSTRAINT `appusuarios_user_groups_group_id_11c5ac18_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `appusuarios_user_groups_user_id_ffb1c0c8_fk_appusuarios_user_id` FOREIGN KEY (`user_id`) REFERENCES `appusuarios_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appusuarios_user_groups`
--

LOCK TABLES `appusuarios_user_groups` WRITE;
/*!40000 ALTER TABLE `appusuarios_user_groups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `appusuarios_user_groups` VALUES
(1,3,1);
/*!40000 ALTER TABLE `appusuarios_user_groups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `appusuarios_user_user_permissions`
--

DROP TABLE IF EXISTS `appusuarios_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `appusuarios_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `appusuarios_user_user_pe_user_id_permission_id_ee76a523_uniq` (`user_id`,`permission_id`),
  KEY `appusuarios_user_use_permission_id_608be307_fk_auth_perm` (`permission_id`),
  CONSTRAINT `appusuarios_user_use_permission_id_608be307_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `appusuarios_user_use_user_id_21c1d6ca_fk_appusuari` FOREIGN KEY (`user_id`) REFERENCES `appusuarios_user` (`id`)
) ENGINE=InnoDB ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appusuarios_user_user_permissions`
--

LOCK TABLES `appusuarios_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `appusuarios_user_user_permissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `appusuarios_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `auth_group` VALUES
(1,'EAD-User');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `auth_group_permissions` VALUES
(10,1,36),
(18,1,38),
(11,1,44),
(12,1,48),
(13,1,50),
(14,1,52),
(15,1,53),
(16,1,56),
(17,1,60);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `auth_permission` VALUES
(1,'Can add Theme',1,'add_theme'),
(2,'Can change Theme',1,'change_theme'),
(3,'Can delete Theme',1,'delete_theme'),
(4,'Can view Theme',1,'view_theme'),
(5,'Can add log entry',2,'add_logentry'),
(6,'Can change log entry',2,'change_logentry'),
(7,'Can delete log entry',2,'delete_logentry'),
(8,'Can view log entry',2,'view_logentry'),
(9,'Can add permission',3,'add_permission'),
(10,'Can change permission',3,'change_permission'),
(11,'Can delete permission',3,'delete_permission'),
(12,'Can view permission',3,'view_permission'),
(13,'Can add group',4,'add_group'),
(14,'Can change group',4,'change_group'),
(15,'Can delete group',4,'delete_group'),
(16,'Can view group',4,'view_group'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add Token',7,'add_token'),
(26,'Can change Token',7,'change_token'),
(27,'Can delete Token',7,'delete_token'),
(28,'Can view Token',7,'view_token'),
(29,'Can add Token',8,'add_tokenproxy'),
(30,'Can change Token',8,'change_tokenproxy'),
(31,'Can delete Token',8,'delete_tokenproxy'),
(32,'Can view Token',8,'view_tokenproxy'),
(33,'Can add Consulta realizada',9,'add_consultachatbot'),
(34,'Can change Consulta realizada',9,'change_consultachatbot'),
(35,'Can delete Consulta realizada',9,'delete_consultachatbot'),
(36,'Can view Consulta realizada',9,'view_consultachatbot'),
(37,'Can add Usuario',10,'add_user'),
(38,'Can change Usuario',10,'change_user'),
(39,'Can delete Usuario',10,'delete_user'),
(40,'Can view Usuario',10,'view_user'),
(41,'Can add Comentario',11,'add_comment'),
(42,'Can change Comentario',11,'change_comment'),
(43,'Can delete Comentario',11,'delete_comment'),
(44,'Can view Comentario',11,'view_comment'),
(45,'Can add Usuario Moodle',12,'add_costumer'),
(46,'Can change Usuario Moodle',12,'change_costumer'),
(47,'Can delete Usuario Moodle',12,'delete_costumer'),
(48,'Can view Usuario Moodle',12,'view_costumer'),
(49,'Can add Consulta',13,'add_question'),
(50,'Can change Consulta',13,'change_question'),
(51,'Can delete Consulta',13,'delete_question'),
(52,'Can view Consulta',13,'view_question'),
(53,'Can add Respuesta',14,'add_response'),
(54,'Can change Respuesta',14,'change_response'),
(55,'Can delete Respuesta',14,'delete_response'),
(56,'Can view Respuesta',14,'view_response'),
(57,'Can add rol costumer',15,'add_rolcostumer'),
(58,'Can change rol costumer',15,'change_rolcostumer'),
(59,'Can delete rol costumer',15,'delete_rolcostumer'),
(60,'Can view rol costumer',15,'view_rolcostumer'),
(61,'Can add Configuración CORS',16,'add_allowedorigincors'),
(62,'Can change Configuración CORS',16,'change_allowedorigincors'),
(63,'Can delete Configuración CORS',16,'delete_allowedorigincors'),
(64,'Can view Configuración CORS',16,'view_allowedorigincors'),
(65,'Can add Configuración de Correo',17,'add_supportemailconfig'),
(66,'Can change Configuración de Correo',17,'change_supportemailconfig'),
(67,'Can delete Configuración de Correo',17,'delete_supportemailconfig'),
(68,'Can view Configuración de Correo',17,'view_supportemailconfig');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_appusuarios_user_id` FOREIGN KEY (`user_id`) REFERENCES `appusuarios_user` (`id`)
) ENGINE=InnoDB ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `authtoken_token` VALUES
('8e7d5410580e4e526e51d0c77885a3a0c7af4af3','2025-05-29 00:22:29.981880',2);
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_appusuarios_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_appusuarios_user_id` FOREIGN KEY (`user_id`) REFERENCES `appusuarios_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 ;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=18 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `django_content_type` VALUES
(2,'admin','logentry'),
(1,'admin_interface','theme'),
(9,'appchatbot','consultachatbot'),
(11,'appcomentarios','comment'),
(16,'appconfig','allowedorigincors'),
(17,'appconfig','supportemailconfig'),
(12,'appsoporte','costumer'),
(13,'appsoporte','question'),
(14,'appsoporte','response'),
(15,'appsoporte','rolcostumer'),
(10,'appusuarios','user'),
(4,'auth','group'),
(3,'auth','permission'),
(7,'authtoken','token'),
(8,'authtoken','tokenproxy'),
(5,'contenttypes','contenttype'),
(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `django_migrations` VALUES
(1,'contenttypes','0001_initial','2025-08-18 13:02:53.450159'),
(2,'contenttypes','0002_remove_content_type_name','2025-08-18 13:02:53.493437'),
(3,'auth','0001_initial','2025-08-18 13:02:53.644395'),
(4,'auth','0002_alter_permission_name_max_length','2025-08-18 13:02:53.672024'),
(5,'auth','0003_alter_user_email_max_length','2025-08-18 13:02:53.677629'),
(6,'auth','0004_alter_user_username_opts','2025-08-18 13:02:53.683564'),
(7,'auth','0005_alter_user_last_login_null','2025-08-18 13:02:53.689148'),
(8,'auth','0006_require_contenttypes_0002','2025-08-18 13:02:53.691380'),
(9,'auth','0007_alter_validators_add_error_messages','2025-08-18 13:02:53.696450'),
(10,'auth','0008_alter_user_username_max_length','2025-08-18 13:02:53.701876'),
(11,'auth','0009_alter_user_last_name_max_length','2025-08-18 13:02:53.707223'),
(12,'auth','0010_alter_group_name_max_length','2025-08-18 13:02:53.726631'),
(13,'auth','0011_update_proxy_permissions','2025-08-18 13:02:53.732357'),
(14,'auth','0012_alter_user_first_name_max_length','2025-08-18 13:02:53.737675'),
(15,'appusuarios','0001_initial','2025-08-18 13:02:53.904119'),
(16,'admin','0001_initial','2025-08-18 13:02:53.964325'),
(17,'admin','0002_logentry_remove_auto_add','2025-08-18 13:02:53.971396'),
(18,'admin','0003_logentry_add_action_flag_choices','2025-08-18 13:02:53.978357'),
(19,'admin_interface','0001_initial','2025-08-18 13:02:53.992677'),
(20,'admin_interface','0002_add_related_modal','2025-08-18 13:02:54.099372'),
(21,'admin_interface','0003_add_logo_color','2025-08-18 13:02:54.127600'),
(22,'admin_interface','0004_rename_title_color','2025-08-18 13:02:54.147733'),
(23,'admin_interface','0005_add_recent_actions_visible','2025-08-18 13:02:54.176621'),
(24,'admin_interface','0006_bytes_to_str','2025-08-18 13:02:54.223058'),
(25,'admin_interface','0007_add_favicon','2025-08-18 13:02:54.253081'),
(26,'admin_interface','0008_change_related_modal_background_opacity_type','2025-08-18 13:02:54.304954'),
(27,'admin_interface','0009_add_enviroment','2025-08-18 13:02:54.367269'),
(28,'admin_interface','0010_add_localization','2025-08-18 13:02:54.379946'),
(29,'admin_interface','0011_add_environment_options','2025-08-18 13:02:54.473968'),
(30,'admin_interface','0012_update_verbose_names','2025-08-18 13:02:54.480104'),
(31,'admin_interface','0013_add_related_modal_close_button','2025-08-18 13:02:54.509395'),
(32,'admin_interface','0014_name_unique','2025-08-18 13:02:54.528405'),
(33,'admin_interface','0015_add_language_chooser_active','2025-08-18 13:02:54.561129'),
(34,'admin_interface','0016_add_language_chooser_display','2025-08-18 13:02:54.594329'),
(35,'admin_interface','0017_change_list_filter_dropdown','2025-08-18 13:02:54.598805'),
(36,'admin_interface','0018_theme_list_filter_sticky','2025-08-18 13:02:54.635742'),
(37,'admin_interface','0019_add_form_sticky','2025-08-18 13:02:54.696361'),
(38,'admin_interface','0020_module_selected_colors','2025-08-18 13:02:54.766888'),
(39,'admin_interface','0021_file_extension_validator','2025-08-18 13:02:54.773689'),
(40,'admin_interface','0022_add_logo_max_width_and_height','2025-08-18 13:02:54.838407'),
(41,'admin_interface','0023_theme_foldable_apps','2025-08-18 13:02:54.872488'),
(42,'admin_interface','0024_remove_theme_css','2025-08-18 13:02:54.893719'),
(43,'admin_interface','0025_theme_language_chooser_control','2025-08-18 13:02:54.927315'),
(44,'admin_interface','0026_theme_list_filter_highlight','2025-08-18 13:02:54.959119'),
(45,'admin_interface','0027_theme_list_filter_removal_links','2025-08-18 13:02:54.990860'),
(46,'admin_interface','0028_theme_show_fieldsets_as_tabs_and_more','2025-08-18 13:02:55.049467'),
(47,'admin_interface','0029_theme_css_generic_link_active_color','2025-08-18 13:02:55.078434'),
(48,'admin_interface','0030_theme_collapsible_stacked_inlines_and_more','2025-08-18 13:02:55.187133'),
(49,'appsoporte','0001_initial','2025-08-18 13:02:55.225483'),
(50,'appchatbot','0001_initial','2025-08-18 13:02:55.238833'),
(51,'appchatbot','0002_initial','2025-08-18 13:02:55.263227'),
(52,'appcomentarios','0001_initial','2025-08-18 13:02:55.276238'),
(53,'appsoporte','0002_initial','2025-08-18 13:02:55.400918'),
(54,'authtoken','0001_initial','2025-08-18 13:02:55.441883'),
(55,'authtoken','0002_auto_20160226_1747','2025-08-18 13:02:55.468633'),
(56,'authtoken','0003_tokenproxy','2025-08-18 13:02:55.472961'),
(57,'authtoken','0004_alter_tokenproxy_options','2025-08-18 13:02:55.478613'),
(58,'sessions','0001_initial','2025-08-18 13:02:55.507501'),
(59,'appconfig','0001_initial','2025-08-19 18:20:12.165806'),
(60,'appconfig','0002_supportemailconfig_host_supportemailconfig_port_and_more','2025-08-19 20:11:00.360965'),
(61,'appusuarios','0002_user_must_change_password','2025-09-01 21:47:11.486041'),
(62,'appsoporte','0003_alter_costumer_email','2025-09-02 12:42:23.227341');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `django_session` VALUES
('0896efj009yqg45s6o68h9fbb7unjr0v','.eJxVjEEOwiAQRe_C2hAKQgeX7nsGMsOAVA0kpV0Z765NutDtf-_9lwi4rSVsPS1hZnERRpx-N8L4SHUHfMd6azK2ui4zyV2RB-1yapye18P9OyjYy7ceHGszOgDnAVSmaDRpQIyeB28zkzKkmXxWI_I5ee0geWM5E2eLDsX7A92dOHc:1uo4Nr:LNjSs9eAzyWpp3EI32IZQvmN1bGP8gbHnkGNKPyW970','2025-09-01 18:15:03.991637'),
('3p88b8wjkuwuegpf0l3n0npqvfxf9s16','.eJxVjEEOwiAQRe_C2hAKQgeX7nsGMsOAVA0kpV0Z765NutDtf-_9lwi4rSVsPS1hZnERRpx-N8L4SHUHfMd6azK2ui4zyV2RB-1yapye18P9OyjYy7ceHGszOgDnAVSmaDRpQIyeB28zkzKkmXxWI_I5ee0geWM5E2eLDsX7A92dOHc:1utCRO:9wvhZF2sCIglLRlDF9ztfbsFmXWcTCvcqeXjrjIT9T4','2025-09-15 21:51:54.039601'),
('48odndnlwswhinvjge3j8wtmpzy0ftju','.eJxVjMEOwiAQRP-FsyGFLhQ8eu83kIVdpGpoUtqT8d9tkx50jvPezFsE3NYStsZLmEhchRKX3y5ienI9AD2w3meZ5rouU5SHIk_a5DgTv26n-3dQsJV9rVVUfd_53Clgq4ghp8hKJwd7jE4ZDEJEhMF67xyRdhksEw9gPFrx-QLSeDep:1uohtE:ZySz4SQOdsPwwh9zBNGKuKTh-HaEW8IVsY7KTnDX-C4','2025-09-03 12:26:04.351432'),
('4pzzlamjeg5yv5sm745ldp41rbbd136n','.eJxVjEEOwiAQRe_C2hCoQBmX7j0DGWBGqgaS0q6Md7dNutDtf-_9twi4LiWsneYwZXERZ3H63SKmJ9Ud5AfWe5Op1WWeotwVedAuby3T63q4fwcFe9lqa0fPSiMmDYwWXCaDxvsh0picGSwbYMUIXjNky86RJ9bkYIMqZfH5AuqJOCs:1utCkn:0m5MubA4ZKu8jDdZPInwqxe5Q052Dco15vtsrTY0ofE','2025-09-15 22:11:57.160408'),
('60jtiljf3b11i17wcsez82goz3108gl4','.eJxVjEEOwiAQRe_C2hAKQgeX7nsGMsOAVA0kpV0Z765NutDtf-_9lwi4rSVsPS1hZnERRpx-N8L4SHUHfMd6azK2ui4zyV2RB-1yapye18P9OyjYy7ceHGszOgDnAVSmaDRpQIyeB28zkzKkmXxWI_I5ee0geWM5E2eLDsX7A92dOHc:1uo911:0CJ2kJimNmuKv5WAg5fJr3BWMV2mWy4JBDQLmPwJXFg','2025-09-01 23:11:47.697915'),
('95lz9gcuhci21l8s4ca8atjmbyohtesl','.eJxVjMEOwiAQRP-FsyGFLhQ8eu83kIVdpGpoUtqT8d9tkx50jvPezFsE3NYStsZLmEhchRKX3y5ienI9AD2w3meZ5rouU5SHIk_a5DgTv26n-3dQsJV9rVVUfd_53Clgq4ghp8hKJwd7jE4ZDEJEhMF67xyRdhksEw9gPFrx-QLSeDep:1uo01V:vj5fT0HwD3c8vZyQrps9QxK7NQlR68SEoE31ilNux8E','2025-09-01 13:35:41.445524'),
('i6cwuxc3fpwra8e1bjqfl05fjrea6tyh','.eJxVjMEOwiAQRP-FsyGFLhQ8eu83kIVdpGpoUtqT8d9tkx50jvPezFsE3NYStsZLmEhchRKX3y5ienI9AD2w3meZ5rouU5SHIk_a5DgTv26n-3dQsJV9rVVUfd_53Clgq4ghp8hKJwd7jE4ZDEJEhMF67xyRdhksEw9gPFrx-QLSeDep:1uoNCf:2wPi3KuLGDgBr7AyBEWnuvBOlJsKnp4GS-7y4-lRvuY','2025-09-02 14:20:45.853697'),
('swr2koz4343j91u3qwuu1x6yfiisjyie','.eJxVjEEOwiAQRe_C2hCoQBmX7j0DGWBGqgaS0q6Md7dNutDtf-_9twi4LiWsneYwZXERZ3H63SKmJ9Ud5AfWe5Op1WWeotwVedAuby3T63q4fwcFe9lqa0fPSiMmDYwWXCaDxvsh0picGSwbYMUIXjNky86RJ9bkYIMqZfH5AuqJOCs:1utCrh:ZI8C2gB8_puSsRy0jVvO_0sIrHczGJqfg7o66ihYBMY','2025-09-15 22:19:05.259198'),
('vz3ckqce8ex1pski1vnw77aynnlg22bs','.eJxVjEEOwiAQRe_C2hAKQgeX7nsGMsOAVA0kpV0Z765NutDtf-_9lwi4rSVsPS1hZnERRpx-N8L4SHUHfMd6azK2ui4zyV2RB-1yapye18P9OyjYy7ceHGszOgDnAVSmaDRpQIyeB28zkzKkmXxWI_I5ee0geWM5E2eLDsX7A92dOHc:1uoOna:UkOeGUv2AdvQYZ6leUw6muNd0jKCUNIk7yxaA0XzolI','2025-09-02 16:02:58.695480'),
('zgk1pqqur3pg88wdaal3eflp6q2bezvy','.eJxVjDsOwjAQBe_iGllrx5-Ykj5nsDbeNQ4gR4qTCnF3EikFtG9m3ltE3NYSt8ZLnEhchRKX323E9OR6AHpgvc8yzXVdplEeijxpk8NM_Lqd7t9BwVb2OoEncAE1Y-8MKNUTqC5lzM6DBQIb0CNkTWxsYK212yUPLnWGvbLi8wXJnjbD:1utDcN:S9kBn6FA2rGaE_tD222xw7T0YdpUiSRey1_cNIovbXo','2025-09-15 23:07:19.557398');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
commit;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-09-02 16:47:26
