/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.6.21-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: squashdb
-- ------------------------------------------------------
-- Server version	10.6.21-MariaDB-ubu2004

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ACL_CLASS`
--

DROP TABLE IF EXISTS `ACL_CLASS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACL_CLASS` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASSNAME` varchar(255) NOT NULL COMMENT 'Fully qualified classname',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CT_UN_CLASSNAME` (`CLASSNAME`),
  UNIQUE KEY `DX_CLASS_NAME` (`CLASSNAME`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACL_CLASS`
--

LOCK TABLES `ACL_CLASS` WRITE;
/*!40000 ALTER TABLE `ACL_CLASS` DISABLE KEYS */;
INSERT INTO `ACL_CLASS` VALUES (8,'org.squashtest.tm.domain.actionword.ActionWordLibrary'),(4,'org.squashtest.tm.domain.campaign.CampaignLibrary'),(6,'org.squashtest.tm.domain.customreport.CustomReportLibrary'),(1,'org.squashtest.tm.domain.project.Project'),(5,'org.squashtest.tm.domain.project.ProjectTemplate'),(2,'org.squashtest.tm.domain.requirement.RequirementLibrary'),(3,'org.squashtest.tm.domain.testcase.TestCaseLibrary'),(7,'org.squashtest.tm.domain.tf.automationrequest.AutomationRequestLibrary');
/*!40000 ALTER TABLE `ACL_CLASS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACL_GROUP`
--

DROP TABLE IF EXISTS `ACL_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACL_GROUP` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `QUALIFIED_NAME` varchar(50) DEFAULT NULL,
  `ACTIVE` bit(1) NOT NULL DEFAULT b'1',
  `DESCRIPTION` longtext NOT NULL DEFAULT '',
  `CREATED_BY` varchar(100) NOT NULL,
  `CREATED_ON` datetime NOT NULL,
  `LAST_MODIFIED_BY` varchar(100) DEFAULT NULL,
  `LAST_MODIFIED_ON` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CT_UN_ACL_GRP_QUAL_NAME` (`QUALIFIED_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACL_GROUP`
--

LOCK TABLES `ACL_GROUP` WRITE;
/*!40000 ALTER TABLE `ACL_GROUP` DISABLE KEYS */;
INSERT INTO `ACL_GROUP` VALUES (2,'squashtest.acl.group.tm.TestEditor','','','Upgrade Squash 8.0','2025-04-28 12:14:16',NULL,NULL),(4,'squashtest.acl.group.tm.ProjectViewer','','','Upgrade Squash 8.0','2025-04-28 12:14:16',NULL,NULL),(5,'squashtest.acl.group.tm.ProjectManager','','','Upgrade Squash 8.0','2025-04-28 12:14:16',NULL,NULL),(6,'squashtest.acl.group.tm.TestRunner','','','Upgrade Squash 8.0','2025-04-28 12:14:16',NULL,NULL),(7,'squashtest.acl.group.tm.TestDesigner','','','Upgrade Squash 8.0','2025-04-28 12:14:16',NULL,NULL),(8,'squashtest.acl.group.tm.AdvanceTester','','','Upgrade Squash 8.0','2025-04-28 12:14:16',NULL,NULL),(9,'squashtest.acl.group.tm.Validator','','','Upgrade Squash 8.0','2025-04-28 12:14:16',NULL,NULL),(10,'squashtest.acl.group.tm.AutomatedTestWriter','','','Upgrade Squash 8.0','2025-04-28 12:14:16',NULL,NULL);
/*!40000 ALTER TABLE `ACL_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACL_GROUP_PERMISSION`
--

DROP TABLE IF EXISTS `ACL_GROUP_PERMISSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACL_GROUP_PERMISSION` (
  `ACL_GROUP_ID` bigint(20) NOT NULL,
  `PERMISSION_MASK` int(11) NOT NULL DEFAULT 0 COMMENT 'Mask of permissions as defined by spring security',
  `CLASS_ID` bigint(20) NOT NULL COMMENT 'The class to which the permissions apply',
  `PERMISSION_ORDER` int(11) NOT NULL DEFAULT 0,
  `GRANTING` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ACL_GROUP_ID`,`CLASS_ID`,`PERMISSION_MASK`),
  KEY `FK_SC_AUTH_ACL_CLASS` (`CLASS_ID`),
  CONSTRAINT `FK_ACL_GRP_PERMISSION_ACL_GRP` FOREIGN KEY (`ACL_GROUP_ID`) REFERENCES `ACL_GROUP` (`ID`),
  CONSTRAINT `FK_SC_AUTH_ACL_CLASS` FOREIGN KEY (`CLASS_ID`) REFERENCES `ACL_CLASS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACL_GROUP_PERMISSION`
--

LOCK TABLES `ACL_GROUP_PERMISSION` WRITE;
/*!40000 ALTER TABLE `ACL_GROUP_PERMISSION` DISABLE KEYS */;
INSERT INTO `ACL_GROUP_PERMISSION` VALUES (2,1,1,0,''),(2,1,2,0,''),(2,2,2,0,''),(2,4,2,0,''),(2,8,2,0,''),(2,64,2,0,''),(2,256,2,0,''),(2,1024,2,0,''),(2,1,3,0,''),(2,2,3,0,''),(2,4,3,0,''),(2,8,3,0,''),(2,64,3,0,''),(2,256,3,0,''),(2,1024,3,0,''),(2,1,4,0,''),(2,2,4,0,''),(2,4,4,0,''),(2,8,4,0,''),(2,64,4,0,''),(2,128,4,0,''),(2,256,4,0,''),(2,1024,4,0,''),(2,4096,4,0,''),(2,1,6,0,''),(2,2,6,0,''),(2,4,6,0,''),(2,8,6,0,''),(2,1024,6,0,''),(2,8192,7,0,''),(2,1,8,0,''),(2,2,8,0,''),(2,4,8,0,''),(2,8,8,0,''),(2,64,8,0,''),(2,1024,8,0,''),(4,1,1,0,''),(4,1,2,0,''),(4,1,3,0,''),(4,1,4,0,''),(4,4096,4,0,''),(4,1,6,0,''),(4,1,8,0,''),(5,1,1,0,''),(5,32,1,0,''),(5,512,1,0,''),(5,32768,1,0,''),(5,65536,1,0,''),(5,1,2,0,''),(5,2,2,0,''),(5,4,2,0,''),(5,8,2,0,''),(5,64,2,0,''),(5,256,2,0,''),(5,512,2,0,''),(5,1024,2,0,''),(5,1,3,0,''),(5,2,3,0,''),(5,4,3,0,''),(5,8,3,0,''),(5,64,3,0,''),(5,256,3,0,''),(5,512,3,0,''),(5,1024,3,0,''),(5,1,4,0,''),(5,2,4,0,''),(5,4,4,0,''),(5,8,4,0,''),(5,64,4,0,''),(5,128,4,0,''),(5,256,4,0,''),(5,1024,4,0,''),(5,2048,4,0,''),(5,4096,4,0,''),(5,1,6,0,''),(5,2,6,0,''),(5,4,6,0,''),(5,8,6,0,''),(5,1024,6,0,''),(5,8192,7,0,''),(5,16384,7,0,''),(5,1,8,0,''),(5,2,8,0,''),(5,4,8,0,''),(5,8,8,0,''),(5,64,8,0,''),(5,512,8,0,''),(5,1024,8,0,''),(6,1,1,0,''),(6,1,2,0,''),(6,64,2,0,''),(6,1,3,0,''),(6,64,3,0,''),(6,1,4,0,''),(6,128,4,0,''),(6,1024,4,0,''),(6,1,6,0,''),(6,1,8,0,''),(6,64,8,0,''),(7,1,1,0,''),(7,1,2,0,''),(7,2,2,0,''),(7,4,2,0,''),(7,8,2,0,''),(7,64,2,0,''),(7,256,2,0,''),(7,1024,2,0,''),(7,1,3,0,''),(7,2,3,0,''),(7,4,3,0,''),(7,8,3,0,''),(7,64,3,0,''),(7,256,3,0,''),(7,1024,3,0,''),(7,1,4,0,''),(7,4096,4,0,''),(7,1,6,0,''),(7,8192,7,0,''),(7,1,8,0,''),(7,2,8,0,''),(7,4,8,0,''),(7,8,8,0,''),(7,64,8,0,''),(7,1024,8,0,''),(8,1,1,0,''),(8,1,2,0,''),(8,64,2,0,''),(8,256,2,0,''),(8,1,3,0,''),(8,2,3,0,''),(8,64,3,0,''),(8,256,3,0,''),(8,1,4,0,''),(8,64,4,0,''),(8,128,4,0,''),(8,1024,4,0,''),(8,4096,4,0,''),(8,1,6,0,''),(8,8192,7,0,''),(8,1,8,0,''),(8,2,8,0,''),(8,64,8,0,''),(9,1,1,0,''),(9,1,2,0,''),(9,2,2,0,''),(9,64,2,0,''),(9,1024,2,0,''),(9,1,3,0,''),(9,2,3,0,''),(9,64,3,0,''),(9,1024,3,0,''),(9,1,4,0,''),(9,4096,4,0,''),(9,1,6,0,''),(9,8192,7,0,''),(9,1,8,0,''),(9,2,8,0,''),(9,64,8,0,''),(9,1024,8,0,''),(10,1,1,0,''),(10,1,3,0,''),(10,16384,3,0,''),(10,16384,7,0,'');
/*!40000 ALTER TABLE `ACL_GROUP_PERMISSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACL_OBJECT_IDENTITY`
--

DROP TABLE IF EXISTS `ACL_OBJECT_IDENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACL_OBJECT_IDENTITY` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `IDENTITY` bigint(20) NOT NULL COMMENT 'The id of the target entity',
  `CLASS_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IDENTITY` (`IDENTITY`,`CLASS_ID`),
  KEY `FK_ACL_OBJ_ID_ACL_CLASS` (`CLASS_ID`),
  KEY `DX_OBJ_ID_IDENTITY` (`IDENTITY`),
  CONSTRAINT `FK_ACL_OBJ_ID_ACL_CLASS` FOREIGN KEY (`CLASS_ID`) REFERENCES `ACL_CLASS` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACL_OBJECT_IDENTITY`
--

LOCK TABLES `ACL_OBJECT_IDENTITY` WRITE;
/*!40000 ALTER TABLE `ACL_OBJECT_IDENTITY` DISABLE KEYS */;
INSERT INTO `ACL_OBJECT_IDENTITY` VALUES (1,1,1),(3,1,2),(2,1,3),(4,1,4),(5,1,6),(6,1,7),(7,1,8),(8,2,1),(10,2,2),(9,2,3),(11,2,4),(12,2,6),(13,2,7),(14,2,8);
/*!40000 ALTER TABLE `ACL_OBJECT_IDENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACL_RESPONSIBILITY_SCOPE_ENTRY`
--

DROP TABLE IF EXISTS `ACL_RESPONSIBILITY_SCOPE_ENTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACL_RESPONSIBILITY_SCOPE_ENTRY` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PARTY_ID` bigint(20) DEFAULT NULL,
  `ACL_GROUP_ID` bigint(20) NOT NULL,
  `OBJECT_IDENTITY_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RESP_SCOPE_ACL_GRP` (`ACL_GROUP_ID`),
  KEY `FK_RESP_SCOPE_OBJ_ID` (`OBJECT_IDENTITY_ID`),
  KEY `fk_arse_party` (`PARTY_ID`),
  CONSTRAINT `FK_RESP_SCOPE_ACL_GRP` FOREIGN KEY (`ACL_GROUP_ID`) REFERENCES `ACL_GROUP` (`ID`),
  CONSTRAINT `FK_RESP_SCOPE_OBJ_ID` FOREIGN KEY (`OBJECT_IDENTITY_ID`) REFERENCES `ACL_OBJECT_IDENTITY` (`ID`),
  CONSTRAINT `fk_arse_party` FOREIGN KEY (`PARTY_ID`) REFERENCES `CORE_PARTY` (`PARTY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACL_RESPONSIBILITY_SCOPE_ENTRY`
--

LOCK TABLES `ACL_RESPONSIBILITY_SCOPE_ENTRY` WRITE;
/*!40000 ALTER TABLE `ACL_RESPONSIBILITY_SCOPE_ENTRY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACL_RESPONSIBILITY_SCOPE_ENTRY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACTION_TEST_STEP`
--

DROP TABLE IF EXISTS `ACTION_TEST_STEP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACTION_TEST_STEP` (
  `TEST_STEP_ID` bigint(20) NOT NULL COMMENT 'Shared key with TEST_STEP table',
  `ACTION` longtext NOT NULL DEFAULT '',
  `EXPECTED_RESULT` longtext NOT NULL DEFAULT '',
  `ATTACHMENT_LIST_ID` bigint(20) DEFAULT NULL COMMENT 'clé étrangère vers un ATTACHMENT_LIST, l''entité qui gère les pièces jointes. ',
  PRIMARY KEY (`TEST_STEP_ID`),
  KEY `fk_action_test_step_attachment_list` (`ATTACHMENT_LIST_ID`),
  CONSTRAINT `fk_action_step_test_step` FOREIGN KEY (`TEST_STEP_ID`) REFERENCES `TEST_STEP` (`TEST_STEP_ID`),
  CONSTRAINT `fk_action_test_step_attachment_list` FOREIGN KEY (`ATTACHMENT_LIST_ID`) REFERENCES `ATTACHMENT_LIST` (`ATTACHMENT_LIST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACTION_TEST_STEP`
--

LOCK TABLES `ACTION_TEST_STEP` WRITE;
/*!40000 ALTER TABLE `ACTION_TEST_STEP` DISABLE KEYS */;
INSERT INTO `ACTION_TEST_STEP` VALUES (1,'<p>Aller sur le site&nbsp;</p>\n','<p>Redirection vers la page de login</p>\n',20),(2,'<p>Renseigner email valide</p>\n','<p>email dans champs de formulaire</p>\n\n<p>&nbsp;</p>\n',21),(3,'<p>Renseigner mdp valide dans champ</p>\n','<p>Mdp valide flout&eacute;&nbsp;</p>\n',22),(4,'<p>Cliquer sur connecter</p>\n','<p>Redirection vers page d&#39;acceuil du projet</p>\n',23);
/*!40000 ALTER TABLE `ACTION_TEST_STEP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACTION_WORD`
--

DROP TABLE IF EXISTS `ACTION_WORD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACTION_WORD` (
  `ACTION_WORD_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` longtext DEFAULT NULL,
  `CREATED_BY` varchar(100) NOT NULL,
  `CREATED_ON` datetime NOT NULL,
  `LAST_MODIFIED_BY` varchar(100) DEFAULT NULL,
  `LAST_MODIFIED_ON` datetime DEFAULT NULL,
  `TOKEN` varchar(766) NOT NULL,
  `PROJECT_ID` bigint(20) NOT NULL,
  `LAST_IMPLEMENTATION_TECHNOLOGY` varchar(30) DEFAULT NULL COMMENT 'Technology used for last implementation',
  `LAST_IMPLEMENTATION_DATE` datetime DEFAULT NULL COMMENT 'Date of last implementation',
  PRIMARY KEY (`ACTION_WORD_ID`),
  UNIQUE KEY `uc_aw_token_project_id` (`TOKEN`,`PROJECT_ID`),
  KEY `idx_fk_action_word_project` (`PROJECT_ID`),
  CONSTRAINT `fk_action_word_project` FOREIGN KEY (`PROJECT_ID`) REFERENCES `PROJECT` (`PROJECT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACTION_WORD`
--

LOCK TABLES `ACTION_WORD` WRITE;
/*!40000 ALTER TABLE `ACTION_WORD` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACTION_WORD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACTION_WORD_FRAGMENT`
--

DROP TABLE IF EXISTS `ACTION_WORD_FRAGMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACTION_WORD_FRAGMENT` (
  `ACTION_WORD_FRAGMENT_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'primary key, auto-generated',
  `ACTION_WORD_ID` bigint(20) DEFAULT NULL COMMENT 'Foreign key to the action word',
  `FRAGMENT_ORDER` int(11) DEFAULT NULL COMMENT 'the fragment order in action word fragment list',
  PRIMARY KEY (`ACTION_WORD_FRAGMENT_ID`),
  UNIQUE KEY `uc_action_word_fragment_order` (`ACTION_WORD_ID`,`FRAGMENT_ORDER`),
  KEY `idx_fk_action_word_fragment_action_word_id` (`ACTION_WORD_ID`),
  CONSTRAINT `fk_action_word_fragment_action_word_id` FOREIGN KEY (`ACTION_WORD_ID`) REFERENCES `ACTION_WORD` (`ACTION_WORD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='base table for Action word fragments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACTION_WORD_FRAGMENT`
--

LOCK TABLES `ACTION_WORD_FRAGMENT` WRITE;
/*!40000 ALTER TABLE `ACTION_WORD_FRAGMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACTION_WORD_FRAGMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACTION_WORD_LIBRARY`
--

DROP TABLE IF EXISTS `ACTION_WORD_LIBRARY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACTION_WORD_LIBRARY` (
  `AWL_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'The auto-generated id',
  `ATTACHMENT_LIST_ID` bigint(20) DEFAULT NULL COMMENT 'Foreign key to ATTACHMENT_LIST',
  PRIMARY KEY (`AWL_ID`),
  KEY `idx_action_word_library` (`AWL_ID`),
  KEY `idx_fk_awl_attachment_list` (`ATTACHMENT_LIST_ID`),
  CONSTRAINT `fk_awLib_attachment_list` FOREIGN KEY (`ATTACHMENT_LIST_ID`) REFERENCES `ATTACHMENT_LIST` (`ATTACHMENT_LIST_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACTION_WORD_LIBRARY`
--

LOCK TABLES `ACTION_WORD_LIBRARY` WRITE;
/*!40000 ALTER TABLE `ACTION_WORD_LIBRARY` DISABLE KEYS */;
INSERT INTO `ACTION_WORD_LIBRARY` VALUES (1,6),(2,13);
/*!40000 ALTER TABLE `ACTION_WORD_LIBRARY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACTION_WORD_LIBRARY_NODE`
--

DROP TABLE IF EXISTS `ACTION_WORD_LIBRARY_NODE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACTION_WORD_LIBRARY_NODE` (
  `AWLN_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'The auto-generated id',
  `NAME` varchar(255) DEFAULT NULL,
  `ENTITY_TYPE` varchar(50) DEFAULT NULL,
  `ENTITY_ID` bigint(20) DEFAULT NULL,
  `AWL_ID` bigint(20) DEFAULT NULL COMMENT 'Foreign key to the ACTION_WORD_LIBRARY',
  PRIMARY KEY (`AWLN_ID`),
  KEY `idx_action_word_library_node` (`AWLN_ID`),
  KEY `idx_fk_awln_awl` (`AWL_ID`),
  CONSTRAINT `fk_awln_awl` FOREIGN KEY (`AWL_ID`) REFERENCES `ACTION_WORD_LIBRARY` (`AWL_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACTION_WORD_LIBRARY_NODE`
--

LOCK TABLES `ACTION_WORD_LIBRARY_NODE` WRITE;
/*!40000 ALTER TABLE `ACTION_WORD_LIBRARY_NODE` DISABLE KEYS */;
INSERT INTO `ACTION_WORD_LIBRARY_NODE` VALUES (1,'Beaurain','LIBRARY',1,1),(2,'Test','LIBRARY',2,2);
/*!40000 ALTER TABLE `ACTION_WORD_LIBRARY_NODE` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`squashuser`@`%`*/ /*!50003 trigger ins_awln_after after insert on
      ACTION_WORD_LIBRARY_NODE
      for each row insert ignore into
      AWLN_RELATIONSHIP_CLOSURE values (new.awln_id, new.awln_id, 0) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`squashuser`@`%`*/ /*!50003 trigger del_awln_before before delete on
      ACTION_WORD_LIBRARY_NODE
      for each row delete from
      AWLN_RELATIONSHIP_CLOSURE where ancestor_id=old.awln_id and
      descendant_id=old.awln_id */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ACTION_WORD_PARAMETER`
--

DROP TABLE IF EXISTS `ACTION_WORD_PARAMETER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACTION_WORD_PARAMETER` (
  `ACTION_WORD_FRAGMENT_ID` bigint(20) NOT NULL COMMENT 'Shared key with ACTION_WORD_FRAGMENT table',
  `NAME` varchar(255) NOT NULL COMMENT 'the name of the action word parameter',
  `DEFAULT_VALUE` varchar(255) NOT NULL COMMENT 'the default value of the action word parameter',
  PRIMARY KEY (`ACTION_WORD_FRAGMENT_ID`),
  KEY `idx_fk_action_word_parameter_action_word_fragment` (`ACTION_WORD_FRAGMENT_ID`),
  CONSTRAINT `fk_action_word_parameter_action_word_fragment` FOREIGN KEY (`ACTION_WORD_FRAGMENT_ID`) REFERENCES `ACTION_WORD_FRAGMENT` (`ACTION_WORD_FRAGMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACTION_WORD_PARAMETER`
--

LOCK TABLES `ACTION_WORD_PARAMETER` WRITE;
/*!40000 ALTER TABLE `ACTION_WORD_PARAMETER` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACTION_WORD_PARAMETER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACTION_WORD_PARAMETER_VALUE`
--

DROP TABLE IF EXISTS `ACTION_WORD_PARAMETER_VALUE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACTION_WORD_PARAMETER_VALUE` (
  `ACTION_WORD_PARAMETER_VALUE_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'primary key, auto-generated',
  `VALUE` varchar(255) NOT NULL COMMENT 'the value of the action word parameter value',
  `ACTION_WORD_FRAGMENT_ID` bigint(20) NOT NULL COMMENT 'the action word parameter by which this value replaces',
  `KEYWORD_TEST_STEP_ID` bigint(20) NOT NULL COMMENT 'the keyword test step in which this value is used',
  PRIMARY KEY (`ACTION_WORD_PARAMETER_VALUE_ID`),
  KEY `idx_fk_action_word_parameter_value_action_word_fragment_id` (`ACTION_WORD_FRAGMENT_ID`),
  KEY `idx_fk_action_word_parameter_value_keyword_test_step_id` (`KEYWORD_TEST_STEP_ID`),
  CONSTRAINT `fk_action_word_parameter_value_action_word_fragment_id` FOREIGN KEY (`ACTION_WORD_FRAGMENT_ID`) REFERENCES `ACTION_WORD_PARAMETER` (`ACTION_WORD_FRAGMENT_ID`),
  CONSTRAINT `fk_action_word_parameter_value_keyword_test_step_id` FOREIGN KEY (`KEYWORD_TEST_STEP_ID`) REFERENCES `KEYWORD_TEST_STEP` (`TEST_STEP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACTION_WORD_PARAMETER_VALUE`
--

LOCK TABLES `ACTION_WORD_PARAMETER_VALUE` WRITE;
/*!40000 ALTER TABLE `ACTION_WORD_PARAMETER_VALUE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACTION_WORD_PARAMETER_VALUE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACTION_WORD_TEXT`
--

DROP TABLE IF EXISTS `ACTION_WORD_TEXT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACTION_WORD_TEXT` (
  `ACTION_WORD_FRAGMENT_ID` bigint(20) NOT NULL COMMENT 'Shared key with ACTION_WORD_FRAGMENT table',
  `TEXT` varchar(255) NOT NULL COMMENT 'the content of the action word text',
  PRIMARY KEY (`ACTION_WORD_FRAGMENT_ID`),
  KEY `idx_fk_action_word_text_action_word_fragment` (`ACTION_WORD_FRAGMENT_ID`),
  CONSTRAINT `fk_action_word_text_action_word_fragment` FOREIGN KEY (`ACTION_WORD_FRAGMENT_ID`) REFERENCES `ACTION_WORD_FRAGMENT` (`ACTION_WORD_FRAGMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACTION_WORD_TEXT`
--

LOCK TABLES `ACTION_WORD_TEXT` WRITE;
/*!40000 ALTER TABLE `ACTION_WORD_TEXT` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACTION_WORD_TEXT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AI_SERVER`
--

DROP TABLE IF EXISTS `AI_SERVER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `AI_SERVER` (
  `SERVER_ID` bigint(20) NOT NULL COMMENT 'The id of the ai server, foreign key to third_party_server.',
  `PAYLOAD_TEMPLATE` longtext DEFAULT NULL COMMENT 'The body of the json sent',
  `JSON_PATH` varchar(255) DEFAULT NULL COMMENT 'Specifies the JSON path used to locate the node containing the response in AI-generated test cases.',
  PRIMARY KEY (`SERVER_ID`),
  CONSTRAINT `fk_ai_server_third_party_server` FOREIGN KEY (`SERVER_ID`) REFERENCES `THIRD_PARTY_SERVER` (`SERVER_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AI_SERVER`
--

LOCK TABLES `AI_SERVER` WRITE;
/*!40000 ALTER TABLE `AI_SERVER` DISABLE KEYS */;
/*!40000 ALTER TABLE `AI_SERVER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `API_TOKEN`
--

DROP TABLE IF EXISTS `API_TOKEN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `API_TOKEN` (
  `TOKEN_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'primary key for API_TOKEN',
  `USER_ID` bigint(20) NOT NULL COMMENT 'foreign key to CORE_USER.PARTY_ID',
  `UUID` varchar(36) NOT NULL COMMENT 'Unique UUID to identify a token in database',
  `NAME` varchar(255) NOT NULL,
  `PERMISSIONS` varchar(50) NOT NULL COMMENT 'READ for GET and READ_WRITE for all methods',
  `CREATED_ON` datetime NOT NULL,
  `EXPIRY_DATE` varchar(10) NOT NULL,
  `LAST_USAGE` datetime DEFAULT NULL,
  `CREATED_BY` varchar(100) NOT NULL,
  PRIMARY KEY (`TOKEN_ID`),
  UNIQUE KEY `UUID` (`UUID`),
  KEY `idx_fk_api_token_user_id` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `API_TOKEN`
--

LOCK TABLES `API_TOKEN` WRITE;
/*!40000 ALTER TABLE `API_TOKEN` DISABLE KEYS */;
/*!40000 ALTER TABLE `API_TOKEN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ATTACHMENT`
--

DROP TABLE IF EXISTS `ATTACHMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ATTACHMENT` (
  `ATTACHMENT_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'clé primaire de la piece jointe. Devrait être autogénérée.',
  `NAME` varchar(255) NOT NULL COMMENT 'nom de la piece jointe',
  `TYPE` varchar(10) NOT NULL COMMENT 'type de la piece jointe. Cette information pourrait etre trivialement deduite du nom de fichier',
  `SIZE` bigint(20) NOT NULL COMMENT 'taille de la piece jointe en octet. Cette information est déterminée au moment de l''upload et doit etre fournie a la base     dès sa création',
  `ADDED_ON` datetime NOT NULL COMMENT 'Date de l''ajout de la piece jointe.',
  `CONTENT_ID` bigint(20) DEFAULT NULL COMMENT 'cle etrangere vers la table ATTACHMENT_CONTENT',
  `ATTACHMENT_LIST_ID` bigint(20) NOT NULL,
  `LAST_MODIFIED_ON` datetime DEFAULT NULL COMMENT 'the date when the attachment was last modified',
  PRIMARY KEY (`ATTACHMENT_ID`),
  KEY `fk_attachment_content` (`CONTENT_ID`),
  KEY `idx_attachment` (`ATTACHMENT_ID`),
  KEY `fk_attachment_att_list` (`ATTACHMENT_LIST_ID`),
  CONSTRAINT `fk_attachment_att_list` FOREIGN KEY (`ATTACHMENT_LIST_ID`) REFERENCES `ATTACHMENT_LIST` (`ATTACHMENT_LIST_ID`),
  CONSTRAINT `fk_attachment_content` FOREIGN KEY (`CONTENT_ID`) REFERENCES `ATTACHMENT_CONTENT` (`ATTACHMENT_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ATTACHMENT`
--

LOCK TABLES `ATTACHMENT` WRITE;
/*!40000 ALTER TABLE `ATTACHMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `ATTACHMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ATTACHMENT_CONTENT`
--

DROP TABLE IF EXISTS `ATTACHMENT_CONTENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ATTACHMENT_CONTENT` (
  `ATTACHMENT_CONTENT_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'clé primaire du contenu de la piece jointe. Devrait être autogénérée.',
  `STREAM_CONTENT` mediumblob DEFAULT NULL,
  PRIMARY KEY (`ATTACHMENT_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ATTACHMENT_CONTENT`
--

LOCK TABLES `ATTACHMENT_CONTENT` WRITE;
/*!40000 ALTER TABLE `ATTACHMENT_CONTENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `ATTACHMENT_CONTENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ATTACHMENT_LIST`
--

DROP TABLE IF EXISTS `ATTACHMENT_LIST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ATTACHMENT_LIST` (
  `ATTACHMENT_LIST_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'clé primaire, devrait être autogénérée.',
  PRIMARY KEY (`ATTACHMENT_LIST_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ATTACHMENT_LIST`
--

LOCK TABLES `ATTACHMENT_LIST` WRITE;
/*!40000 ALTER TABLE `ATTACHMENT_LIST` DISABLE KEYS */;
INSERT INTO `ATTACHMENT_LIST` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23);
/*!40000 ALTER TABLE `ATTACHMENT_LIST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTH_USER`
--

DROP TABLE IF EXISTS `AUTH_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTH_USER` (
  `LOGIN` varchar(100) NOT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `ACTIVE` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`LOGIN`),
  UNIQUE KEY `IDX_AUTHENTICATION` (`LOGIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Stores users credentials';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTH_USER`
--

LOCK TABLES `AUTH_USER` WRITE;
/*!40000 ALTER TABLE `AUTH_USER` DISABLE KEYS */;
INSERT INTO `AUTH_USER` VALUES ('admin','{bcrypt}$2a$10$XOva3aVwNg5Zh6ZYkcsDseRwGITeXd5tonyYhbG3YnNumotK1iMGi','');
/*!40000 ALTER TABLE `AUTH_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTOMATED_EXECUTION_EXTENDER`
--

DROP TABLE IF EXISTS `AUTOMATED_EXECUTION_EXTENDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTOMATED_EXECUTION_EXTENDER` (
  `EXTENDER_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MASTER_EXECUTION_ID` bigint(20) NOT NULL COMMENT 'foreign key to the Execution it attaches to.',
  `TEST_ID` bigint(20) DEFAULT NULL,
  `RESULT_URL` varchar(300) DEFAULT NULL COMMENT 'urls longer than 300 chars should go to hell',
  `SUITE_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `RESULT_SUMMARY` longtext DEFAULT NULL COMMENT 'a short debriefing of a test once it has been       executed, for instance an error message',
  `NODE_NAME` varchar(50) DEFAULT '' COMMENT 'Name of the node which ran the test',
  `EXECUTION_EXTENDER_ORDER` bigint(20) DEFAULT NULL COMMENT 'order of automated executions extenders within an automated suite',
  `TEST_TECHNOLOGY` varchar(36) DEFAULT NULL,
  `DURATION` int(11) DEFAULT NULL COMMENT 'the execution time of a automation test',
  `FLAG` varchar(50) DEFAULT NULL COMMENT 'Indicates the status of the automated test (e.g., To be analysed, Flaky, Fixed)',
  PRIMARY KEY (`EXTENDER_ID`),
  KEY `fk_auto_exec_exec` (`MASTER_EXECUTION_ID`),
  KEY `fk_auto_exec_auto_test` (`TEST_ID`),
  KEY `fk_auto_exec_suite` (`SUITE_ID`),
  CONSTRAINT `fk_auto_exec_auto_test` FOREIGN KEY (`TEST_ID`) REFERENCES `AUTOMATED_TEST` (`TEST_ID`),
  CONSTRAINT `fk_auto_exec_exec` FOREIGN KEY (`MASTER_EXECUTION_ID`) REFERENCES `EXECUTION` (`EXECUTION_ID`),
  CONSTRAINT `fk_auto_exec_suite` FOREIGN KEY (`SUITE_ID`) REFERENCES `AUTOMATED_SUITE` (`SUITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTOMATED_EXECUTION_EXTENDER`
--

LOCK TABLES `AUTOMATED_EXECUTION_EXTENDER` WRITE;
/*!40000 ALTER TABLE `AUTOMATED_EXECUTION_EXTENDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `AUTOMATED_EXECUTION_EXTENDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTOMATED_EXECUTION_FAILURE_DETAIL`
--

DROP TABLE IF EXISTS `AUTOMATED_EXECUTION_FAILURE_DETAIL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTOMATED_EXECUTION_FAILURE_DETAIL` (
  `FAILURE_DETAIL_ID` bigint(20) NOT NULL,
  `EXECUTION_EXTENDER_ID` bigint(20) NOT NULL,
  KEY `idx_automated_execution_failure_detail_execution_extender_id` (`EXECUTION_EXTENDER_ID`),
  KEY `idx_automated_execution_failure_detail_failure_detail_id` (`FAILURE_DETAIL_ID`),
  CONSTRAINT `fk_automated_execution_failure_detail_execution_id` FOREIGN KEY (`EXECUTION_EXTENDER_ID`) REFERENCES `AUTOMATED_EXECUTION_EXTENDER` (`EXTENDER_ID`),
  CONSTRAINT `fk_automated_execution_failure_detail_failure_detail_id` FOREIGN KEY (`FAILURE_DETAIL_ID`) REFERENCES `FAILURE_DETAIL` (`FAILURE_DETAIL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTOMATED_EXECUTION_FAILURE_DETAIL`
--

LOCK TABLES `AUTOMATED_EXECUTION_FAILURE_DETAIL` WRITE;
/*!40000 ALTER TABLE `AUTOMATED_EXECUTION_FAILURE_DETAIL` DISABLE KEYS */;
/*!40000 ALTER TABLE `AUTOMATED_EXECUTION_FAILURE_DETAIL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTOMATED_SUITE`
--

DROP TABLE IF EXISTS `AUTOMATED_SUITE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTOMATED_SUITE` (
  `SUITE_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `CREATED_BY` varchar(100) NOT NULL,
  `CREATED_ON` datetime NOT NULL,
  `LAST_MODIFIED_BY` varchar(100) DEFAULT NULL,
  `LAST_MODIFIED_ON` datetime DEFAULT NULL,
  `EXECUTION_STATUS` varchar(255) DEFAULT 'READY',
  `ITERATION_ID` bigint(20) DEFAULT NULL,
  `TEST_SUITE_ID` bigint(20) DEFAULT NULL,
  `ATTACHMENT_LIST_ID` bigint(20) DEFAULT NULL COMMENT 'foreign key to ATTACHMENT_LIST, entity dealing with attachment.',
  PRIMARY KEY (`SUITE_ID`),
  KEY `fk_automated_suite_iteration` (`ITERATION_ID`),
  KEY `fk_automated_suite_test_suite` (`TEST_SUITE_ID`),
  KEY `fk_automated_suite_attachment_list` (`ATTACHMENT_LIST_ID`),
  CONSTRAINT `fk_automated_suite_attachment_list` FOREIGN KEY (`ATTACHMENT_LIST_ID`) REFERENCES `ATTACHMENT_LIST` (`ATTACHMENT_LIST_ID`),
  CONSTRAINT `fk_automated_suite_iteration` FOREIGN KEY (`ITERATION_ID`) REFERENCES `ITERATION` (`ITERATION_ID`),
  CONSTRAINT `fk_automated_suite_test_suite` FOREIGN KEY (`TEST_SUITE_ID`) REFERENCES `TEST_SUITE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTOMATED_SUITE`
--

LOCK TABLES `AUTOMATED_SUITE` WRITE;
/*!40000 ALTER TABLE `AUTOMATED_SUITE` DISABLE KEYS */;
/*!40000 ALTER TABLE `AUTOMATED_SUITE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTOMATED_SUITE_WORKFLOWS`
--

DROP TABLE IF EXISTS `AUTOMATED_SUITE_WORKFLOWS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTOMATED_SUITE_WORKFLOWS` (
  `SUITE_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'foreign key to AUTOMATED_SUITE',
  `WORKFLOW_ID` varchar(100) NOT NULL COMMENT 'id of the workflow launched from the suite',
  `PROJECT_ID` bigint(20) NOT NULL COMMENT 'original project id',
  KEY `fk_automated_suite_workflows_suite_id` (`SUITE_ID`),
  KEY `idx_fk_automated_suite_workflows_project_id` (`PROJECT_ID`),
  CONSTRAINT `fk_automated_suite_workflows_project` FOREIGN KEY (`PROJECT_ID`) REFERENCES `PROJECT` (`PROJECT_ID`),
  CONSTRAINT `fk_automated_suite_workflows_suite_id` FOREIGN KEY (`SUITE_ID`) REFERENCES `AUTOMATED_SUITE` (`SUITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTOMATED_SUITE_WORKFLOWS`
--

LOCK TABLES `AUTOMATED_SUITE_WORKFLOWS` WRITE;
/*!40000 ALTER TABLE `AUTOMATED_SUITE_WORKFLOWS` DISABLE KEYS */;
/*!40000 ALTER TABLE `AUTOMATED_SUITE_WORKFLOWS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTOMATED_TEST`
--

DROP TABLE IF EXISTS `AUTOMATED_TEST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTOMATED_TEST` (
  `TEST_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) DEFAULT NULL,
  `PROJECT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`TEST_ID`),
  UNIQUE KEY `uni_auto_test` (`NAME`,`PROJECT_ID`),
  KEY `fk_automated_test_project` (`PROJECT_ID`),
  CONSTRAINT `fk_automated_test_project` FOREIGN KEY (`PROJECT_ID`) REFERENCES `TEST_AUTOMATION_PROJECT` (`TA_PROJECT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTOMATED_TEST`
--

LOCK TABLES `AUTOMATED_TEST` WRITE;
/*!40000 ALTER TABLE `AUTOMATED_TEST` DISABLE KEYS */;
/*!40000 ALTER TABLE `AUTOMATED_TEST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTOMATED_TEST_TECHNOLOGY`
--

DROP TABLE IF EXISTS `AUTOMATED_TEST_TECHNOLOGY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTOMATED_TEST_TECHNOLOGY` (
  `AT_TECHNOLOGY_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL,
  `ACTION_PROVIDER_KEY` varchar(50) NOT NULL,
  `PREMIUM` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`AT_TECHNOLOGY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTOMATED_TEST_TECHNOLOGY`
--

LOCK TABLES `AUTOMATED_TEST_TECHNOLOGY` WRITE;
/*!40000 ALTER TABLE `AUTOMATED_TEST_TECHNOLOGY` DISABLE KEYS */;
INSERT INTO `AUTOMATED_TEST_TECHNOLOGY` VALUES (1,'Robot Framework','robotframework/execute@v1','\0'),(2,'Cypress','cypress/execute@v1','\0'),(3,'JUnit','junit/execute@v1','\0'),(4,'Cucumber 4','cucumber/execute@v1','\0'),(5,'SoapUI','soapui/execute@v1','\0'),(6,'Agilitest','agilitest/execute@v1',''),(7,'UFT','uft/execute@v1',''),(8,'Ranorex','ranorex/execute@v1',''),(9,'SKF','skf/execute@v1','\0'),(10,'Postman','postman/execute@v1','\0'),(11,'Cucumber 5+','cucumber5/execute@v1','\0'),(12,'Katalon','katalon/execute@v1',''),(13,'Playwright','playwright/execute@v1','\0');
/*!40000 ALTER TABLE `AUTOMATED_TEST_TECHNOLOGY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTOMATION_ENVIRONMENT_TAG`
--

DROP TABLE IF EXISTS `AUTOMATION_ENVIRONMENT_TAG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTOMATION_ENVIRONMENT_TAG` (
  `VALUE` varchar(255) DEFAULT NULL,
  `ENTITY_TYPE` varchar(50) NOT NULL,
  `ENTITY_ID` bigint(20) NOT NULL,
  UNIQUE KEY `uniq_entity_type_entity_id_value` (`ENTITY_TYPE`,`ENTITY_ID`,`VALUE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTOMATION_ENVIRONMENT_TAG`
--

LOCK TABLES `AUTOMATION_ENVIRONMENT_TAG` WRITE;
/*!40000 ALTER TABLE `AUTOMATION_ENVIRONMENT_TAG` DISABLE KEYS */;
/*!40000 ALTER TABLE `AUTOMATION_ENVIRONMENT_TAG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTOMATION_REQUEST`
--

DROP TABLE IF EXISTS `AUTOMATION_REQUEST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTOMATION_REQUEST` (
  `AUTOMATION_REQUEST_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `REQUEST_STATUS` varchar(25) NOT NULL DEFAULT 'WORK_IN_PROGRESS',
  `TRANSMITTED_ON` datetime DEFAULT NULL,
  `ASSIGNED_TO` bigint(20) DEFAULT NULL,
  `AUTOMATION_PRIORITY` int(11) DEFAULT NULL,
  `ASSIGNED_ON` datetime DEFAULT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `TRANSMITTED_BY` bigint(20) DEFAULT NULL,
  `PROJECT_ID` bigint(20) NOT NULL COMMENT 'fk to the host project',
  `CONFLICT_ASSOCIATION` text DEFAULT NULL,
  `IS_MANUAL` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`AUTOMATION_REQUEST_ID`),
  KEY `fk_automation_request_project` (`PROJECT_ID`),
  KEY `automation_request_assigned_to_idx` (`ASSIGNED_TO`),
  KEY `automation_request_created_by_idx` (`CREATED_BY`),
  KEY `automation_request_transmitted_by_idx` (`TRANSMITTED_BY`),
  CONSTRAINT `fk_automation_request_automation_assigned_to` FOREIGN KEY (`ASSIGNED_TO`) REFERENCES `CORE_USER` (`PARTY_ID`) ON DELETE SET NULL,
  CONSTRAINT `fk_automation_request_created_by` FOREIGN KEY (`CREATED_BY`) REFERENCES `CORE_USER` (`PARTY_ID`) ON DELETE SET NULL,
  CONSTRAINT `fk_automation_request_project` FOREIGN KEY (`PROJECT_ID`) REFERENCES `PROJECT` (`PROJECT_ID`),
  CONSTRAINT `fk_automation_request_transmitted_by` FOREIGN KEY (`TRANSMITTED_BY`) REFERENCES `CORE_USER` (`PARTY_ID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTOMATION_REQUEST`
--

LOCK TABLES `AUTOMATION_REQUEST` WRITE;
/*!40000 ALTER TABLE `AUTOMATION_REQUEST` DISABLE KEYS */;
/*!40000 ALTER TABLE `AUTOMATION_REQUEST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTOMATION_REQUEST_LIBRARY`
--

DROP TABLE IF EXISTS `AUTOMATION_REQUEST_LIBRARY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTOMATION_REQUEST_LIBRARY` (
  `ARL_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'autoincremented primary key',
  `ATTACHMENT_LIST_ID` bigint(20) DEFAULT NULL COMMENT 'fk to the attachment list',
  PRIMARY KEY (`ARL_ID`),
  KEY `fk_autorequestLib_attachment_list` (`ATTACHMENT_LIST_ID`),
  KEY `idx_automation_request_library` (`ARL_ID`),
  CONSTRAINT `fk_autorequestLib_attachment_list` FOREIGN KEY (`ATTACHMENT_LIST_ID`) REFERENCES `ATTACHMENT_LIST` (`ATTACHMENT_LIST_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTOMATION_REQUEST_LIBRARY`
--

LOCK TABLES `AUTOMATION_REQUEST_LIBRARY` WRITE;
/*!40000 ALTER TABLE `AUTOMATION_REQUEST_LIBRARY` DISABLE KEYS */;
INSERT INTO `AUTOMATION_REQUEST_LIBRARY` VALUES (1,5),(2,12);
/*!40000 ALTER TABLE `AUTOMATION_REQUEST_LIBRARY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTOMATION_REQUEST_LIBRARY_CONTENT`
--

DROP TABLE IF EXISTS `AUTOMATION_REQUEST_LIBRARY_CONTENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTOMATION_REQUEST_LIBRARY_CONTENT` (
  `LIBRARY_ID` bigint(20) NOT NULL COMMENT 'Foreign key to the library',
  `CONTENT_ID` bigint(20) NOT NULL COMMENT 'Foreign key to the content',
  UNIQUE KEY `CONTENT_ID` (`CONTENT_ID`),
  KEY `idx_automation_request_lib_content_content` (`CONTENT_ID`),
  KEY `idx_automation_request_lib_content_lib` (`LIBRARY_ID`),
  CONSTRAINT `fk_automation_request_lib_content_content` FOREIGN KEY (`CONTENT_ID`) REFERENCES `AUTOMATION_REQUEST` (`AUTOMATION_REQUEST_ID`),
  CONSTRAINT `fk_automation_rquest_lib_content_lib` FOREIGN KEY (`LIBRARY_ID`) REFERENCES `AUTOMATION_REQUEST_LIBRARY` (`ARL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTOMATION_REQUEST_LIBRARY_CONTENT`
--

LOCK TABLES `AUTOMATION_REQUEST_LIBRARY_CONTENT` WRITE;
/*!40000 ALTER TABLE `AUTOMATION_REQUEST_LIBRARY_CONTENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `AUTOMATION_REQUEST_LIBRARY_CONTENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AWLN_RELATIONSHIP`
--

DROP TABLE IF EXISTS `AWLN_RELATIONSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `AWLN_RELATIONSHIP` (
  `ANCESTOR_ID` bigint(20) DEFAULT NULL COMMENT 'Foreign key to parent node',
  `DESCENDANT_ID` bigint(20) NOT NULL COMMENT 'Foreign key to child node',
  `CONTENT_ORDER` bigint(20) DEFAULT NULL COMMENT 'Order in its parent node',
  KEY `idx_awln_relationship_descendant` (`DESCENDANT_ID`),
  KEY `idx_awln_relationship_ancestor` (`ANCESTOR_ID`),
  CONSTRAINT `fk_awln_relationship_ancestor` FOREIGN KEY (`ANCESTOR_ID`) REFERENCES `ACTION_WORD_LIBRARY_NODE` (`AWLN_ID`),
  CONSTRAINT `fk_awln_relationship_descendant` FOREIGN KEY (`DESCENDANT_ID`) REFERENCES `ACTION_WORD_LIBRARY_NODE` (`AWLN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AWLN_RELATIONSHIP`
--

LOCK TABLES `AWLN_RELATIONSHIP` WRITE;
/*!40000 ALTER TABLE `AWLN_RELATIONSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `AWLN_RELATIONSHIP` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`squashuser`@`%`*/ /*!50003 trigger attach_awln_after after insert on AWLN_RELATIONSHIP
      for each row insert ignore into AWLN_RELATIONSHIP_CLOSURE
      select
      c1.ancestor_id, c2.descendant_id, c1.depth+c2.depth+1
      from
      AWLN_RELATIONSHIP_CLOSURE c1
      cross join AWLN_RELATIONSHIP_CLOSURE c2
      where c1.descendant_id = new.ancestor_id
      and c2.ancestor_id = new.descendant_id */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`squashuser`@`%`*/ /*!50003 trigger detach_awln_before before delete on
      AWLN_RELATIONSHIP
      for each row delete clos1 from
      AWLN_RELATIONSHIP_CLOSURE clos1
      join AWLN_RELATIONSHIP_CLOSURE clos2
      on
      clos1.descendant_id=clos2.descendant_id
      left join
      AWLN_RELATIONSHIP_CLOSURE clos3
      on clos3.ancestor_id = clos2.ancestor_id
      and clos3.descendant_id = clos1.ancestor_id
      where
      clos2.ancestor_id = old.descendant_id
      and clos3.ancestor_id is null */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `AWLN_RELATIONSHIP_CLOSURE`
--

DROP TABLE IF EXISTS `AWLN_RELATIONSHIP_CLOSURE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `AWLN_RELATIONSHIP_CLOSURE` (
  `ANCESTOR_ID` bigint(20) NOT NULL COMMENT 'cle etrangere vers le noeud parent. La relation est parfois d''un noeud vers lui meme.',
  `DESCENDANT_ID` bigint(20) NOT NULL COMMENT 'cle etrangere vers l''element fils. La relation est parfois d''un noeud vers lui meme.',
  `DEPTH` smallint(6) NOT NULL COMMENT 'stores how deep is the descendant element nested in the subtree of the ancestor element',
  UNIQUE KEY `ANCESTOR_ID` (`ANCESTOR_ID`,`DESCENDANT_ID`),
  KEY `idx_awln_relationship_clos_desc` (`DESCENDANT_ID`),
  KEY `idx_awln_relationship_clos_anc` (`ANCESTOR_ID`),
  CONSTRAINT `fk_awln_relationship_clos_anc` FOREIGN KEY (`ANCESTOR_ID`) REFERENCES `ACTION_WORD_LIBRARY_NODE` (`AWLN_ID`),
  CONSTRAINT `fk_awln_relationship_clos_desc` FOREIGN KEY (`DESCENDANT_ID`) REFERENCES `ACTION_WORD_LIBRARY_NODE` (`AWLN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AWLN_RELATIONSHIP_CLOSURE`
--

LOCK TABLES `AWLN_RELATIONSHIP_CLOSURE` WRITE;
/*!40000 ALTER TABLE `AWLN_RELATIONSHIP_CLOSURE` DISABLE KEYS */;
INSERT INTO `AWLN_RELATIONSHIP_CLOSURE` VALUES (1,1,0),(2,2,0);
/*!40000 ALTER TABLE `AWLN_RELATIONSHIP_CLOSURE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BUGTRACKER`
--

DROP TABLE IF EXISTS `BUGTRACKER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `BUGTRACKER` (
  `BUGTRACKER_ID` bigint(20) NOT NULL,
  `KIND` varchar(50) NOT NULL DEFAULT 'mantis' COMMENT 'tells what kind of connector should be used',
  `IFRAME_FRIENDLY` bit(1) NOT NULL DEFAULT b'0' COMMENT 'tells if the bugtracker page can be accessed through an iframe',
  PRIMARY KEY (`BUGTRACKER_ID`),
  CONSTRAINT `fk_bugtracker_third_party_server` FOREIGN KEY (`BUGTRACKER_ID`) REFERENCES `THIRD_PARTY_SERVER` (`SERVER_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='stores bugtrackers informations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BUGTRACKER`
--

LOCK TABLES `BUGTRACKER` WRITE;
/*!40000 ALTER TABLE `BUGTRACKER` DISABLE KEYS */;
/*!40000 ALTER TABLE `BUGTRACKER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BUGTRACKER_PROJECT`
--

DROP TABLE IF EXISTS `BUGTRACKER_PROJECT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `BUGTRACKER_PROJECT` (
  `BUGTRACKER_PROJECT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BUGTRACKER_PROJECT_NAME` varchar(255) DEFAULT NULL,
  `BUGTRACKER_PROJECT_ORDER` int(11) NOT NULL,
  `PROJECT_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`BUGTRACKER_PROJECT_ID`),
  KEY `idx_bugtracker_project` (`BUGTRACKER_PROJECT_ID`),
  KEY `idx_fk_bugtracker_project_project_id` (`PROJECT_ID`),
  CONSTRAINT `fk_bugtracker_project_project_id` FOREIGN KEY (`PROJECT_ID`) REFERENCES `PROJECT` (`PROJECT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BUGTRACKER_PROJECT`
--

LOCK TABLES `BUGTRACKER_PROJECT` WRITE;
/*!40000 ALTER TABLE `BUGTRACKER_PROJECT` DISABLE KEYS */;
/*!40000 ALTER TABLE `BUGTRACKER_PROJECT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CALL_TEST_STEP`
--

DROP TABLE IF EXISTS `CALL_TEST_STEP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CALL_TEST_STEP` (
  `TEST_STEP_ID` bigint(20) NOT NULL COMMENT 'Shared key with TEST_STEP table',
  `CALLED_TEST_CASE_ID` bigint(20) NOT NULL COMMENT 'ID of called test case',
  `CALLED_DATASET` bigint(20) DEFAULT NULL COMMENT 'A reference to the called dataset (if any). The fk constraint must set null when the dataset is deleted.',
  `DELEGATE_PARAMETER_VALUES` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Says whether the parameters of the called test case must be set by the caller test case or not',
  PRIMARY KEY (`TEST_STEP_ID`),
  KEY `fk_call_step_called_test_case` (`CALLED_TEST_CASE_ID`),
  KEY `fk_call_step_dataset` (`CALLED_DATASET`),
  CONSTRAINT `fk_call_step_called_test_case` FOREIGN KEY (`CALLED_TEST_CASE_ID`) REFERENCES `TEST_CASE` (`TCLN_ID`),
  CONSTRAINT `fk_call_step_dataset` FOREIGN KEY (`CALLED_DATASET`) REFERENCES `DATASET` (`DATASET_ID`) ON DELETE SET NULL,
  CONSTRAINT `fk_call_step_test_step` FOREIGN KEY (`TEST_STEP_ID`) REFERENCES `TEST_STEP` (`TEST_STEP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CALL_TEST_STEP`
--

LOCK TABLES `CALL_TEST_STEP` WRITE;
/*!40000 ALTER TABLE `CALL_TEST_STEP` DISABLE KEYS */;
/*!40000 ALTER TABLE `CALL_TEST_STEP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CAMPAIGN`
--

DROP TABLE IF EXISTS `CAMPAIGN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CAMPAIGN` (
  `CLN_ID` bigint(20) NOT NULL,
  `ACTUAL_END_AUTO` bit(1) NOT NULL COMMENT 'Drapeau indiquant si l''utilisateur a choisit une determination automatique de la date de depart effective ou non.',
  `ACTUAL_END_DATE` datetime DEFAULT NULL COMMENT 'Date de fin effective (reelle) de la campagne.',
  `ACTUAL_START_AUTO` bit(1) NOT NULL COMMENT 'Drapeau indiquant si l''utilisateur a choisit une determination automatique de la date de fin effective ou non.',
  `ACTUAL_START_DATE` datetime DEFAULT NULL COMMENT 'Date de depar effective (reelle) de la campagne.',
  `SCHEDULED_END_DATE` datetime DEFAULT NULL COMMENT 'Date planifiee de fin de la campagne.',
  `SCHEDULED_START_DATE` datetime DEFAULT NULL COMMENT 'Date planifiee de debut de la campagne.',
  `REFERENCE` varchar(50) DEFAULT '' COMMENT 'a reference lavel for a campaign',
  `CAMPAIGN_STATUS` varchar(30) NOT NULL DEFAULT 'UNDEFINED',
  PRIMARY KEY (`CLN_ID`),
  CONSTRAINT `FK_CAMPAIGN_CL_NODE` FOREIGN KEY (`CLN_ID`) REFERENCES `CAMPAIGN_LIBRARY_NODE` (`CLN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CAMPAIGN`
--

LOCK TABLES `CAMPAIGN` WRITE;
/*!40000 ALTER TABLE `CAMPAIGN` DISABLE KEYS */;
/*!40000 ALTER TABLE `CAMPAIGN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CAMPAIGN_FOLDER`
--

DROP TABLE IF EXISTS `CAMPAIGN_FOLDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CAMPAIGN_FOLDER` (
  `CLN_ID` bigint(20) NOT NULL COMMENT 'cle primaire, qui est une cle etrangere vers la table CAMPAIGN_LIBRARY_NODE. Ne doit donc pas etre autogeneree.',
  PRIMARY KEY (`CLN_ID`),
  CONSTRAINT `FK_CAMPAIGN_FOLDER_CL_NODE` FOREIGN KEY (`CLN_ID`) REFERENCES `CAMPAIGN_LIBRARY_NODE` (`CLN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CAMPAIGN_FOLDER`
--

LOCK TABLES `CAMPAIGN_FOLDER` WRITE;
/*!40000 ALTER TABLE `CAMPAIGN_FOLDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `CAMPAIGN_FOLDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CAMPAIGN_ITERATION`
--

DROP TABLE IF EXISTS `CAMPAIGN_ITERATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CAMPAIGN_ITERATION` (
  `CAMPAIGN_ID` bigint(20) NOT NULL,
  `ITERATION_ID` bigint(20) NOT NULL,
  `ITERATION_ORDER` int(11) NOT NULL,
  UNIQUE KEY `CAMPAIGN_ID` (`CAMPAIGN_ID`,`ITERATION_ORDER`),
  KEY `fk_camp_iter_iteration` (`ITERATION_ID`),
  CONSTRAINT `fk_camp_iter_campaign` FOREIGN KEY (`CAMPAIGN_ID`) REFERENCES `CAMPAIGN` (`CLN_ID`),
  CONSTRAINT `fk_camp_iter_iteration` FOREIGN KEY (`ITERATION_ID`) REFERENCES `ITERATION` (`ITERATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CAMPAIGN_ITERATION`
--

LOCK TABLES `CAMPAIGN_ITERATION` WRITE;
/*!40000 ALTER TABLE `CAMPAIGN_ITERATION` DISABLE KEYS */;
/*!40000 ALTER TABLE `CAMPAIGN_ITERATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CAMPAIGN_LIBRARY`
--

DROP TABLE IF EXISTS `CAMPAIGN_LIBRARY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CAMPAIGN_LIBRARY` (
  `CL_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'cle primaire autogeneree',
  `ATTACHMENT_LIST_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CL_ID`),
  KEY `idx_campaign_library` (`CL_ID`),
  KEY `fk_campLib_attachment_list` (`ATTACHMENT_LIST_ID`),
  CONSTRAINT `fk_campLib_attachment_list` FOREIGN KEY (`ATTACHMENT_LIST_ID`) REFERENCES `ATTACHMENT_LIST` (`ATTACHMENT_LIST_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CAMPAIGN_LIBRARY`
--

LOCK TABLES `CAMPAIGN_LIBRARY` WRITE;
/*!40000 ALTER TABLE `CAMPAIGN_LIBRARY` DISABLE KEYS */;
INSERT INTO `CAMPAIGN_LIBRARY` VALUES (1,1),(2,8);
/*!40000 ALTER TABLE `CAMPAIGN_LIBRARY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CAMPAIGN_LIBRARY_CONTENT`
--

DROP TABLE IF EXISTS `CAMPAIGN_LIBRARY_CONTENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CAMPAIGN_LIBRARY_CONTENT` (
  `LIBRARY_ID` bigint(20) NOT NULL COMMENT 'cle etrangere vers une bibliotheque de campagnes.',
  `CONTENT_ID` bigint(20) NOT NULL COMMENT 'cle etrangere vers un noeud de la bibliotheque de campagnes.',
  `CONTENT_ORDER` int(11) NOT NULL,
  UNIQUE KEY `CONTENT_ID` (`CONTENT_ID`),
  UNIQUE KEY `dx_cl_content_cl_node` (`CONTENT_ID`),
  KEY `dx_cl_content_campaign_lib` (`LIBRARY_ID`),
  CONSTRAINT `fk_cl_content_content` FOREIGN KEY (`CONTENT_ID`) REFERENCES `CAMPAIGN_LIBRARY_NODE` (`CLN_ID`),
  CONSTRAINT `fk_cl_content_lib` FOREIGN KEY (`LIBRARY_ID`) REFERENCES `CAMPAIGN_LIBRARY` (`CL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CAMPAIGN_LIBRARY_CONTENT`
--

LOCK TABLES `CAMPAIGN_LIBRARY_CONTENT` WRITE;
/*!40000 ALTER TABLE `CAMPAIGN_LIBRARY_CONTENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `CAMPAIGN_LIBRARY_CONTENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CAMPAIGN_LIBRARY_NODE`
--

DROP TABLE IF EXISTS `CAMPAIGN_LIBRARY_NODE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CAMPAIGN_LIBRARY_NODE` (
  `CLN_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'cle primaire autogeneree',
  `DESCRIPTION` longtext DEFAULT NULL,
  `NAME` varchar(255) NOT NULL COMMENT 'Le nom/label de l''element en question.',
  `CREATED_BY` varchar(100) NOT NULL,
  `CREATED_ON` datetime NOT NULL COMMENT 'Date de creation de cette campagne. Il s''agit de la date de creation de l''entree dans    la base, non d''une date metier.',
  `LAST_MODIFIED_ON` datetime DEFAULT NULL COMMENT 'Date de derniere mise a jour de cette instance.',
  `LAST_MODIFIED_BY` varchar(100) DEFAULT NULL,
  `PROJECT_ID` bigint(20) DEFAULT NULL COMMENT 'FK to the Project to which belongs this resource',
  `ATTACHMENT_LIST_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CLN_ID`),
  KEY `fk_cln_project` (`PROJECT_ID`),
  KEY `fk_campNode_attachment_list` (`ATTACHMENT_LIST_ID`),
  KEY `idx_cln_name` (`NAME`),
  CONSTRAINT `fk_campNode_attachment_list` FOREIGN KEY (`ATTACHMENT_LIST_ID`) REFERENCES `ATTACHMENT_LIST` (`ATTACHMENT_LIST_ID`),
  CONSTRAINT `fk_cln_project` FOREIGN KEY (`PROJECT_ID`) REFERENCES `PROJECT` (`PROJECT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CAMPAIGN_LIBRARY_NODE`
--

LOCK TABLES `CAMPAIGN_LIBRARY_NODE` WRITE;
/*!40000 ALTER TABLE `CAMPAIGN_LIBRARY_NODE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CAMPAIGN_LIBRARY_NODE` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`squashuser`@`%`*/ /*!50003 trigger ins_cln_after after insert on
			CAMPAIGN_LIBRARY_NODE
			for each row insert ignore into
			CLN_RELATIONSHIP_CLOSURE values (new.cln_id, new.cln_id, 0) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`squashuser`@`%`*/ /*!50003 trigger del_cln_before before delete on
			CAMPAIGN_LIBRARY_NODE
			for each row delete from
			CLN_RELATIONSHIP_CLOSURE where ancestor_id=old.cln_id and
			descendant_id=old.cln_id */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `CAMPAIGN_TEST_PLAN_ITEM`
--

DROP TABLE IF EXISTS `CAMPAIGN_TEST_PLAN_ITEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CAMPAIGN_TEST_PLAN_ITEM` (
  `CTPI_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'clé primaire du test plan. Devrait être autogénérée.',
  `CAMPAIGN_ID` bigint(20) DEFAULT NULL COMMENT 'cle etrangere vers CAMPAIGN',
  `TEST_CASE_ID` bigint(20) NOT NULL COMMENT 'cle etrangere vers TEST_CASE',
  `USER_ID` bigint(20) DEFAULT NULL COMMENT 'Id de l''utilisateur assigné a ce cas de test reférenncé',
  `TEST_PLAN_ORDER` int(11) DEFAULT NULL COMMENT 'numéro d''ordre d''une execution dans la liste des test plans d''une itération.',
  `DATASET_ID` bigint(20) DEFAULT NULL COMMENT 'the dataset the test plan item should use so that new iterations will now use those datasets',
  PRIMARY KEY (`CTPI_ID`),
  UNIQUE KEY `uc_campaign_test_plan_item_order` (`CAMPAIGN_ID`,`TEST_PLAN_ORDER`),
  KEY `fk_camp_tp_testcase` (`TEST_CASE_ID`),
  KEY `idx_camptestplan` (`CTPI_ID`),
  KEY `fk_camp_tp_user` (`USER_ID`),
  KEY `fk_camp_test_plan_item_dataset` (`DATASET_ID`),
  CONSTRAINT `fk_camp_test_plan_item_dataset` FOREIGN KEY (`DATASET_ID`) REFERENCES `DATASET` (`DATASET_ID`),
  CONSTRAINT `fk_camp_tp_campaign` FOREIGN KEY (`CAMPAIGN_ID`) REFERENCES `CAMPAIGN` (`CLN_ID`),
  CONSTRAINT `fk_camp_tp_testcase` FOREIGN KEY (`TEST_CASE_ID`) REFERENCES `TEST_CASE` (`TCLN_ID`),
  CONSTRAINT `fk_camp_tp_user` FOREIGN KEY (`USER_ID`) REFERENCES `CORE_USER` (`PARTY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CAMPAIGN_TEST_PLAN_ITEM`
--

LOCK TABLES `CAMPAIGN_TEST_PLAN_ITEM` WRITE;
/*!40000 ALTER TABLE `CAMPAIGN_TEST_PLAN_ITEM` DISABLE KEYS */;
/*!40000 ALTER TABLE `CAMPAIGN_TEST_PLAN_ITEM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CHART_AXIS_COLUMN`
--

DROP TABLE IF EXISTS `CHART_AXIS_COLUMN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CHART_AXIS_COLUMN` (
  `CHART_COLUMN_ID` bigint(20) NOT NULL COMMENT 'foreign key to CHART_COLUMN_PROTOTYPE',
  `LABEL` varchar(100) DEFAULT NULL COMMENT 'a label for this axis. If non null, will override the default label in the CHART_COLUMN_PROTOTYPE',
  `AXIS_OPERATION` varchar(20) DEFAULT NULL COMMENT 'may define an additional operation about how data are grouped on this axis, most of the time ''NONE'' is fine, however     for Timestamp columns an adequate aggregation (day, month etc) may be useful',
  `AXIS_RANK` int(11) DEFAULT NULL COMMENT 'in which order the axis are processed (if relevant)',
  `CUF_ID` bigint(20) DEFAULT NULL COMMENT 'a column to persist cuf id relative to this axis',
  `CHART_DEFINITION_ID` bigint(20) DEFAULT NULL COMMENT 'foreign key to the chart_definition',
  KEY `fk_chart_axis_chart_def` (`CHART_DEFINITION_ID`),
  KEY `fk_axis_column_chart_column` (`CHART_COLUMN_ID`),
  CONSTRAINT `fk_axis_column_chart_column` FOREIGN KEY (`CHART_COLUMN_ID`) REFERENCES `QUERY_COLUMN_PROTOTYPE` (`QUERY_COLUMN_ID`),
  CONSTRAINT `fk_chart_axis_chart_def` FOREIGN KEY (`CHART_DEFINITION_ID`) REFERENCES `CHART_DEFINITION` (`CHART_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CHART_AXIS_COLUMN`
--

LOCK TABLES `CHART_AXIS_COLUMN` WRITE;
/*!40000 ALTER TABLE `CHART_AXIS_COLUMN` DISABLE KEYS */;
/*!40000 ALTER TABLE `CHART_AXIS_COLUMN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CHART_COLUMN_ROLE`
--

DROP TABLE IF EXISTS `CHART_COLUMN_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CHART_COLUMN_ROLE` (
  `CHART_COLUMN_ID` bigint(20) NOT NULL COMMENT 'foreign key to CHART_COLUMN_PROTOTYPE',
  `ROLE` varchar(255) DEFAULT NULL COMMENT 'name of a role for the referenced column',
  KEY `fk_column_role_chart_column` (`CHART_COLUMN_ID`),
  CONSTRAINT `fk_column_role_chart_column` FOREIGN KEY (`CHART_COLUMN_ID`) REFERENCES `QUERY_COLUMN_PROTOTYPE` (`QUERY_COLUMN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CHART_COLUMN_ROLE`
--

LOCK TABLES `CHART_COLUMN_ROLE` WRITE;
/*!40000 ALTER TABLE `CHART_COLUMN_ROLE` DISABLE KEYS */;
INSERT INTO `CHART_COLUMN_ROLE` VALUES (1,'MEASURE'),(1,'AXIS'),(1,'FILTER'),(4,'MEASURE'),(4,'AXIS'),(4,'FILTER'),(5,'MEASURE'),(5,'AXIS'),(5,'FILTER'),(6,'MEASURE'),(6,'AXIS'),(6,'FILTER'),(7,'MEASURE'),(7,'AXIS'),(7,'FILTER'),(8,'FILTER'),(8,'AXIS'),(9,'MEASURE'),(9,'AXIS'),(9,'FILTER'),(10,'MEASURE'),(10,'AXIS'),(10,'FILTER'),(11,'MEASURE'),(11,'AXIS'),(11,'FILTER'),(12,'AXIS'),(12,'FILTER'),(13,'AXIS'),(13,'FILTER'),(14,'AXIS'),(14,'FILTER'),(15,'AXIS'),(15,'FILTER'),(16,'FILTER'),(16,'MEASURE'),(19,'MEASURE'),(19,'AXIS'),(19,'FILTER'),(20,'FILTER'),(20,'AXIS'),(21,'MEASURE'),(21,'AXIS'),(21,'FILTER'),(22,'MEASURE'),(22,'AXIS'),(22,'FILTER'),(23,'MEASURE'),(23,'AXIS'),(23,'FILTER'),(24,'MEASURE'),(24,'AXIS'),(24,'FILTER'),(25,'AXIS'),(25,'FILTER'),(26,'AXIS'),(26,'FILTER'),(27,'AXIS'),(27,'FILTER'),(28,'AXIS'),(28,'FILTER'),(37,'MEASURE'),(37,'AXIS'),(37,'FILTER'),(39,'FILTER'),(39,'MEASURE'),(40,'AXIS'),(40,'FILTER'),(41,'AXIS'),(41,'FILTER'),(42,'AXIS'),(42,'FILTER'),(43,'AXIS'),(43,'FILTER'),(46,'MEASURE'),(46,'AXIS'),(46,'FILTER'),(47,'FILTER'),(47,'MEASURE'),(48,'AXIS'),(48,'FILTER'),(49,'AXIS'),(49,'FILTER'),(50,'AXIS'),(50,'FILTER'),(51,'AXIS'),(51,'FILTER'),(54,'MEASURE'),(54,'AXIS'),(54,'FILTER'),(55,'MEASURE'),(55,'AXIS'),(55,'FILTER'),(56,'MEASURE'),(56,'AXIS'),(56,'FILTER'),(57,'MEASURE'),(57,'AXIS'),(57,'FILTER'),(58,'MEASURE'),(58,'AXIS'),(58,'FILTER'),(59,'MEASURE'),(59,'AXIS'),(59,'FILTER'),(60,'MEASURE'),(60,'AXIS'),(60,'FILTER'),(66,'MEASURE'),(66,'AXIS'),(66,'FILTER'),(67,'AXIS'),(67,'FILTER'),(68,'AXIS'),(68,'FILTER'),(69,'AXIS'),(69,'FILTER'),(70,'AXIS'),(70,'FILTER'),(71,'MEASURE'),(71,'AXIS'),(71,'FILTER'),(2,'MEASURE'),(2,'AXIS'),(2,'FILTER'),(17,'MEASURE'),(17,'AXIS'),(17,'FILTER'),(18,'MEASURE'),(18,'AXIS'),(18,'FILTER'),(30,'MEASURE'),(30,'AXIS'),(30,'FILTER'),(31,'MEASURE'),(31,'AXIS'),(31,'FILTER'),(32,'MEASURE'),(32,'AXIS'),(32,'FILTER'),(33,'MEASURE'),(33,'AXIS'),(33,'FILTER'),(34,'MEASURE'),(34,'AXIS'),(34,'FILTER'),(35,'MEASURE'),(35,'AXIS'),(35,'FILTER'),(36,'MEASURE'),(36,'AXIS'),(36,'FILTER'),(44,'MEASURE'),(44,'AXIS'),(44,'FILTER'),(45,'MEASURE'),(45,'AXIS'),(45,'FILTER'),(52,'MEASURE'),(52,'AXIS'),(52,'FILTER'),(53,'MEASURE'),(53,'AXIS'),(53,'FILTER'),(61,'MEASURE'),(61,'AXIS'),(61,'FILTER'),(62,'MEASURE'),(62,'AXIS'),(62,'FILTER'),(63,'MEASURE'),(63,'AXIS'),(63,'FILTER'),(64,'MEASURE'),(64,'AXIS'),(64,'FILTER'),(65,'MEASURE'),(65,'AXIS'),(65,'FILTER'),(72,'FILTER'),(73,'MEASURE'),(73,'AXIS'),(73,'FILTER'),(95,'MEASURE'),(95,'AXIS'),(95,'FILTER'),(96,'MEASURE'),(96,'AXIS'),(96,'FILTER'),(97,'MEASURE'),(97,'AXIS'),(97,'FILTER'),(98,'MEASURE'),(98,'AXIS'),(98,'FILTER'),(99,'MEASURE'),(99,'AXIS'),(99,'FILTER'),(100,'MEASURE'),(100,'AXIS'),(100,'FILTER'),(101,'MEASURE'),(101,'AXIS'),(101,'FILTER'),(102,'MEASURE'),(102,'AXIS'),(102,'FILTER'),(103,'MEASURE'),(103,'AXIS'),(103,'FILTER'),(104,'MEASURE'),(104,'AXIS'),(104,'FILTER'),(105,'MEASURE'),(105,'AXIS'),(105,'FILTER'),(106,'MEASURE'),(106,'AXIS'),(106,'FILTER'),(107,'MEASURE'),(107,'AXIS'),(107,'FILTER'),(108,'MEASURE'),(108,'AXIS'),(108,'FILTER'),(109,'MEASURE'),(109,'AXIS'),(109,'FILTER'),(110,'MEASURE'),(110,'AXIS'),(110,'FILTER'),(111,'MEASURE'),(111,'AXIS'),(111,'FILTER'),(112,'MEASURE'),(112,'AXIS'),(112,'FILTER'),(113,'MEASURE'),(113,'AXIS'),(113,'FILTER'),(114,'MEASURE'),(114,'AXIS'),(114,'FILTER'),(115,'MEASURE'),(115,'AXIS'),(115,'FILTER'),(116,'MEASURE'),(116,'AXIS'),(116,'FILTER'),(117,'MEASURE'),(117,'AXIS'),(117,'FILTER'),(118,'MEASURE'),(118,'AXIS'),(118,'FILTER'),(119,'MEASURE'),(119,'AXIS'),(119,'FILTER'),(120,'MEASURE'),(120,'AXIS'),(120,'FILTER'),(121,'MEASURE'),(121,'AXIS'),(121,'FILTER'),(122,'MEASURE'),(122,'AXIS'),(122,'FILTER'),(123,'MEASURE'),(123,'AXIS'),(123,'FILTER'),(124,'MEASURE'),(124,'AXIS'),(124,'FILTER'),(72,'MEASURE'),(72,'AXIS'),(179,'MEASURE'),(179,'AXIS'),(179,'FILTER'),(186,'MEASURE'),(186,'AXIS'),(186,'FILTER'),(203,'MEASURE'),(203,'AXIS'),(203,'FILTER'),(204,'MEASURE'),(204,'AXIS'),(204,'FILTER'),(205,'MEASURE'),(205,'AXIS'),(205,'FILTER'),(206,'MEASURE'),(206,'AXIS'),(206,'FILTER'),(207,'MEASURE'),(207,'AXIS'),(207,'FILTER');
/*!40000 ALTER TABLE `CHART_COLUMN_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CHART_DEFINITION`
--

DROP TABLE IF EXISTS `CHART_DEFINITION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CHART_DEFINITION` (
  `CHART_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'autogenerated ID',
  `NAME` varchar(50) DEFAULT NULL COMMENT 'The name of this chart',
  `VISIBILITY` varchar(20) DEFAULT NULL COMMENT 'whether this chart is ''PRIVATE'' or ''PUBLIC''',
  `CHART_TYPE` varchar(20) DEFAULT NULL COMMENT 'whether this chart is a ''PIE'', ''BAR'' etc',
  `DESCRIPTION` longtext DEFAULT NULL COMMENT 'additional informations about this chart',
  `PROJECT_ID` bigint(20) NOT NULL COMMENT 'cle etrangere vers le projet. ',
  `CREATED_BY` varchar(100) NOT NULL,
  `CREATED_ON` datetime NOT NULL,
  `LAST_MODIFIED_BY` varchar(100) DEFAULT NULL,
  `LAST_MODIFIED_ON` datetime DEFAULT NULL,
  `SCOPE_TYPE` varchar(20) DEFAULT NULL COMMENT 'a column to persist the scope type',
  PRIMARY KEY (`CHART_ID`),
  KEY `fk_project_chart_definition_project_id` (`PROJECT_ID`),
  KEY `idx_chart_definition` (`CHART_ID`),
  CONSTRAINT `fk_project_chart_definition_project_id` FOREIGN KEY (`PROJECT_ID`) REFERENCES `PROJECT` (`PROJECT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CHART_DEFINITION`
--

LOCK TABLES `CHART_DEFINITION` WRITE;
/*!40000 ALTER TABLE `CHART_DEFINITION` DISABLE KEYS */;
/*!40000 ALTER TABLE `CHART_DEFINITION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CHART_FILTER`
--

DROP TABLE IF EXISTS `CHART_FILTER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CHART_FILTER` (
  `FILTER_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'autogenerated ID',
  `CHART_COLUMN_ID` bigint(20) NOT NULL COMMENT 'foreign key to a CHART_COLUMN_PROTOTYPE',
  `FILTER_OPERATION` varchar(20) DEFAULT NULL COMMENT 'a comparison operator',
  `CUF_ID` bigint(20) DEFAULT NULL COMMENT 'a column to persist cuf id relative to this filter',
  `CHART_DEFINITION_ID` bigint(20) DEFAULT NULL COMMENT 'foreign key to the chart_definition',
  PRIMARY KEY (`FILTER_ID`),
  KEY `idx_chart_filter` (`FILTER_ID`),
  KEY `fk_chart_filter_chart_def` (`CHART_DEFINITION_ID`),
  KEY `fk_chart_filter_chart_column` (`CHART_COLUMN_ID`),
  CONSTRAINT `fk_chart_filter_chart_column` FOREIGN KEY (`CHART_COLUMN_ID`) REFERENCES `QUERY_COLUMN_PROTOTYPE` (`QUERY_COLUMN_ID`),
  CONSTRAINT `fk_chart_filter_chart_def` FOREIGN KEY (`CHART_DEFINITION_ID`) REFERENCES `CHART_DEFINITION` (`CHART_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CHART_FILTER`
--

LOCK TABLES `CHART_FILTER` WRITE;
/*!40000 ALTER TABLE `CHART_FILTER` DISABLE KEYS */;
/*!40000 ALTER TABLE `CHART_FILTER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CHART_FILTER_VALUES`
--

DROP TABLE IF EXISTS `CHART_FILTER_VALUES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CHART_FILTER_VALUES` (
  `FILTER_ID` bigint(20) NOT NULL COMMENT 'foreign key to CHART_FILTER',
  `FILTER_VALUE` varchar(255) DEFAULT NULL COMMENT 'a value for this filter',
  KEY `fk_chart_filter_value_chart_column` (`FILTER_ID`),
  CONSTRAINT `fk_chart_filter_value_chart_column` FOREIGN KEY (`FILTER_ID`) REFERENCES `CHART_FILTER` (`FILTER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CHART_FILTER_VALUES`
--

LOCK TABLES `CHART_FILTER_VALUES` WRITE;
/*!40000 ALTER TABLE `CHART_FILTER_VALUES` DISABLE KEYS */;
/*!40000 ALTER TABLE `CHART_FILTER_VALUES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CHART_MEASURE_COLUMN`
--

DROP TABLE IF EXISTS `CHART_MEASURE_COLUMN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CHART_MEASURE_COLUMN` (
  `CHART_COLUMN_ID` bigint(20) NOT NULL COMMENT 'foreign key to the CHART_COLUMN_PROTOTYPE this measure applies to',
  `LABEL` varchar(30) DEFAULT NULL COMMENT 'a label for this measure. Will override the default label of the column prototype if non null.',
  `MEASURE_OPERATION` varchar(20) DEFAULT NULL COMMENT 'the measure applied to the column',
  `MEASURE_RANK` int(11) DEFAULT NULL COMMENT 'the order in which the measure will be displayed when the chart is rendered.',
  `CUF_ID` bigint(20) DEFAULT NULL COMMENT 'a column to persist cuf id relative to this measure',
  `CHART_DEFINITION_ID` bigint(20) DEFAULT NULL COMMENT 'foreign key to the chart_definition',
  KEY `fk_chart_meas_chart_def` (`CHART_DEFINITION_ID`),
  KEY `fk_chart_measure_chart_column` (`CHART_COLUMN_ID`),
  CONSTRAINT `fk_chart_meas_chart_def` FOREIGN KEY (`CHART_DEFINITION_ID`) REFERENCES `CHART_DEFINITION` (`CHART_ID`),
  CONSTRAINT `fk_chart_measure_chart_column` FOREIGN KEY (`CHART_COLUMN_ID`) REFERENCES `QUERY_COLUMN_PROTOTYPE` (`QUERY_COLUMN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CHART_MEASURE_COLUMN`
--

LOCK TABLES `CHART_MEASURE_COLUMN` WRITE;
/*!40000 ALTER TABLE `CHART_MEASURE_COLUMN` DISABLE KEYS */;
/*!40000 ALTER TABLE `CHART_MEASURE_COLUMN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CHART_PROJECT_SCOPE`
--

DROP TABLE IF EXISTS `CHART_PROJECT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CHART_PROJECT_SCOPE` (
  `CHART_PROJECT_SCOPE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CHART_ID` bigint(20) NOT NULL,
  `PROJECT_SCOPE` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`CHART_PROJECT_SCOPE_ID`),
  KEY `fk_chart_project_scope_chart_definition` (`CHART_ID`),
  CONSTRAINT `fk_chart_project_scope_chart_definition` FOREIGN KEY (`CHART_ID`) REFERENCES `CHART_DEFINITION` (`CHART_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CHART_PROJECT_SCOPE`
--

LOCK TABLES `CHART_PROJECT_SCOPE` WRITE;
/*!40000 ALTER TABLE `CHART_PROJECT_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CHART_PROJECT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CHART_SCOPE`
--

DROP TABLE IF EXISTS `CHART_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CHART_SCOPE` (
  `CHART_ID` bigint(20) NOT NULL COMMENT 'foreign key to a CHART_DEFINITION',
  `ENTITY_REFERENCE_TYPE` varchar(50) DEFAULT NULL COMMENT 'the type of the referenced entity',
  `ENTITY_REFERENCE_ID` bigint(20) DEFAULT NULL,
  KEY `fk_chart_scope_chart_definition` (`CHART_ID`),
  CONSTRAINT `fk_chart_scope_chart_definition` FOREIGN KEY (`CHART_ID`) REFERENCES `CHART_DEFINITION` (`CHART_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CHART_SCOPE`
--

LOCK TABLES `CHART_SCOPE` WRITE;
/*!40000 ALTER TABLE `CHART_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CHART_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLN_RELATIONSHIP`
--

DROP TABLE IF EXISTS `CLN_RELATIONSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLN_RELATIONSHIP` (
  `ANCESTOR_ID` bigint(20) NOT NULL COMMENT 'cle etrangere vers le repertoire parent (il s''agit necessairement d''un repertoire).',
  `DESCENDANT_ID` bigint(20) NOT NULL COMMENT 'cle etrangere vers l''element fils.',
  `CONTENT_ORDER` int(11) NOT NULL,
  UNIQUE KEY `DESCENDANT_ID` (`DESCENDANT_ID`),
  KEY `dx_cln_relationship_descendant` (`DESCENDANT_ID`),
  KEY `idx_fk_cln_relationship_ancestor` (`ANCESTOR_ID`),
  CONSTRAINT `fk_cln_relationship_ancestor` FOREIGN KEY (`ANCESTOR_ID`) REFERENCES `CAMPAIGN_LIBRARY_NODE` (`CLN_ID`),
  CONSTRAINT `idx_cln_relationship_descendant` FOREIGN KEY (`DESCENDANT_ID`) REFERENCES `CAMPAIGN_LIBRARY_NODE` (`CLN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLN_RELATIONSHIP`
--

LOCK TABLES `CLN_RELATIONSHIP` WRITE;
/*!40000 ALTER TABLE `CLN_RELATIONSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLN_RELATIONSHIP` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`squashuser`@`%`*/ /*!50003 trigger attach_cln_after after insert on CLN_RELATIONSHIP
			for each row insert ignore into CLN_RELATIONSHIP_CLOSURE
			select
			c1.ancestor_id, c2.descendant_id, c1.depth+c2.depth+1
			from
			CLN_RELATIONSHIP_CLOSURE c1
			cross join CLN_RELATIONSHIP_CLOSURE c2
			where c1.descendant_id = new.ancestor_id
			and c2.ancestor_id = new.descendant_id */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`squashuser`@`%`*/ /*!50003 trigger detach_cln_before before delete on
			CLN_RELATIONSHIP
			for each row delete clos1 from
			CLN_RELATIONSHIP_CLOSURE clos1
			join CLN_RELATIONSHIP_CLOSURE clos2
			on
			clos1.descendant_id=clos2.descendant_id
			left join
			CLN_RELATIONSHIP_CLOSURE clos3
			on clos3.ancestor_id = clos2.ancestor_id
			and clos3.descendant_id = clos1.ancestor_id
			where
			clos2.ancestor_id = old.descendant_id
			and clos3.ancestor_id is null */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `CLN_RELATIONSHIP_CLOSURE`
--

DROP TABLE IF EXISTS `CLN_RELATIONSHIP_CLOSURE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLN_RELATIONSHIP_CLOSURE` (
  `ANCESTOR_ID` bigint(20) NOT NULL COMMENT 'cle etrangere vers le noeud parent. La relation est parfois d''un noeud vers lui meme.',
  `DESCENDANT_ID` bigint(20) NOT NULL COMMENT 'cle etrangere vers l''element fils. La relation est parfois d''un noeud vers lui meme.',
  `DEPTH` smallint(6) NOT NULL COMMENT 'stores how deep is the descendant element nested in the subtree of the ancestor element',
  UNIQUE KEY `uniq_cln_clos` (`ANCESTOR_ID`,`DESCENDANT_ID`),
  KEY `idx_cln_relationship_clos_desc` (`DESCENDANT_ID`),
  KEY `idx_cln_relationship_clos_anc` (`ANCESTOR_ID`),
  CONSTRAINT `fk_cln_relationship_clos_anc` FOREIGN KEY (`ANCESTOR_ID`) REFERENCES `CAMPAIGN_LIBRARY_NODE` (`CLN_ID`),
  CONSTRAINT `fk_cln_relationship_clos_desc` FOREIGN KEY (`DESCENDANT_ID`) REFERENCES `CAMPAIGN_LIBRARY_NODE` (`CLN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLN_RELATIONSHIP_CLOSURE`
--

LOCK TABLES `CLN_RELATIONSHIP_CLOSURE` WRITE;
/*!40000 ALTER TABLE `CLN_RELATIONSHIP_CLOSURE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLN_RELATIONSHIP_CLOSURE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CONNECTION_ATTEMPT_LOG`
--

DROP TABLE IF EXISTS `CONNECTION_ATTEMPT_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CONNECTION_ATTEMPT_LOG` (
  `ATTEMPT_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'autogenerated ID',
  `LOGIN` varchar(100) DEFAULT NULL,
  `CONNECTION_DATE` datetime NOT NULL COMMENT 'Date of connection',
  `SUCCESS` bit(1) NOT NULL COMMENT 'if connection succeeded or not',
  PRIMARY KEY (`ATTEMPT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CONNECTION_ATTEMPT_LOG`
--

LOCK TABLES `CONNECTION_ATTEMPT_LOG` WRITE;
/*!40000 ALTER TABLE `CONNECTION_ATTEMPT_LOG` DISABLE KEYS */;
INSERT INTO `CONNECTION_ATTEMPT_LOG` VALUES (1,'admin','2025-04-28 14:19:31',''),(2,'admin','2025-04-28 14:46:52','');
/*!40000 ALTER TABLE `CONNECTION_ATTEMPT_LOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CORE_CONFIG`
--

DROP TABLE IF EXISTS `CORE_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CORE_CONFIG` (
  `STR_KEY` varchar(255) NOT NULL COMMENT 'Configuration Key',
  `VALUE` text DEFAULT NULL COMMENT 'Configuration value',
  PRIMARY KEY (`STR_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CORE_CONFIG`
--

LOCK TABLES `CORE_CONFIG` WRITE;
/*!40000 ALTER TABLE `CORE_CONFIG` DISABLE KEYS */;
INSERT INTO `CORE_CONFIG` VALUES ('autoconnect.on.connection.enabled','false'),('LOGIN_MESSAGE','<p><span style=\"color:#ff0000;\">The administrator default login is <strong>admin/admin</strong> (you can change this password in the &quot;<em>My account (admin)</em>&quot; menu).</span></p><p>Go to the &quot;<em>Administration&quot;</em> menu (in the bottom left corner) to create new users and projects, or change this default home message.</p><p>&nbsp;</p>'),('squashtest.tm.database.version','9.0.0'),('uploadfilter.fileExtensions.whitelist','txt, doc, xls, ppt, docx, xlsx, pptx, odt, ods, odp, pdf'),('uploadfilter.upload.import.sizeLimitInBytes','2000000'),('uploadfilter.upload.sizeLimitInBytes','4000000'),('WELCOME_MESSAGE','<p><span style=\"color:#ff0000;\">The administrator default login is <strong>admin/admin</strong> (you can change this password in the &quot;<em>My account (admin)</em>&quot; menu).</span></p><p>Go to the &quot;<em>Administration&quot;</em> menu (in the bottom left corner) to create new users and projects, or change this default home message.</p><p>&nbsp;</p>');
/*!40000 ALTER TABLE `CORE_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CORE_GROUP`
--

DROP TABLE IF EXISTS `CORE_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CORE_GROUP` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `QUALIFIED_NAME` varchar(255) NOT NULL COMMENT 'Qualified name of the group, both used as a functional key and a localization key. Should be something like ''squashtest.authz.group._app module_._GroupName_''',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CT_UN_GRP_QUAL_NAME` (`QUALIFIED_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CORE_GROUP`
--

LOCK TABLES `CORE_GROUP` WRITE;
/*!40000 ALTER TABLE `CORE_GROUP` DISABLE KEYS */;
INSERT INTO `CORE_GROUP` VALUES (1,'squashtest.authz.group.core.Admin'),(4,'squashtest.authz.group.tm.TestAutomationServer'),(2,'squashtest.authz.group.tm.User');
/*!40000 ALTER TABLE `CORE_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CORE_GROUP_AUTHORITY`
--

DROP TABLE IF EXISTS `CORE_GROUP_AUTHORITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CORE_GROUP_AUTHORITY` (
  `GROUP_ID` bigint(20) NOT NULL COMMENT 'Shared key with CORE_GROUP table',
  `AUTHORITY` varchar(50) NOT NULL COMMENT 'The authority',
  KEY `DX_GRP_ID` (`GROUP_ID`),
  CONSTRAINT `FK_GRP_AUTH_GRP` FOREIGN KEY (`GROUP_ID`) REFERENCES `CORE_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CORE_GROUP_AUTHORITY`
--

LOCK TABLES `CORE_GROUP_AUTHORITY` WRITE;
/*!40000 ALTER TABLE `CORE_GROUP_AUTHORITY` DISABLE KEYS */;
INSERT INTO `CORE_GROUP_AUTHORITY` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_TM_USER'),(4,'ROLE_TA_API_CLIENT');
/*!40000 ALTER TABLE `CORE_GROUP_AUTHORITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CORE_GROUP_MEMBER`
--

DROP TABLE IF EXISTS `CORE_GROUP_MEMBER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CORE_GROUP_MEMBER` (
  `PARTY_ID` bigint(20) DEFAULT NULL,
  `GROUP_ID` bigint(20) NOT NULL,
  UNIQUE KEY `DX_GRP_MEMBER` (`PARTY_ID`,`GROUP_ID`),
  KEY `FK_GRP_MEMBER_GRP` (`GROUP_ID`),
  CONSTRAINT `FK_GRP_MEMBER_GRP` FOREIGN KEY (`GROUP_ID`) REFERENCES `CORE_GROUP` (`ID`),
  CONSTRAINT `fk_group_member_party` FOREIGN KEY (`PARTY_ID`) REFERENCES `CORE_PARTY` (`PARTY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CORE_GROUP_MEMBER`
--

LOCK TABLES `CORE_GROUP_MEMBER` WRITE;
/*!40000 ALTER TABLE `CORE_GROUP_MEMBER` DISABLE KEYS */;
INSERT INTO `CORE_GROUP_MEMBER` VALUES (1,1);
/*!40000 ALTER TABLE `CORE_GROUP_MEMBER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CORE_PARTY`
--

DROP TABLE IF EXISTS `CORE_PARTY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CORE_PARTY` (
  `PARTY_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`PARTY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CORE_PARTY`
--

LOCK TABLES `CORE_PARTY` WRITE;
/*!40000 ALTER TABLE `CORE_PARTY` DISABLE KEYS */;
INSERT INTO `CORE_PARTY` VALUES (1);
/*!40000 ALTER TABLE `CORE_PARTY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CORE_PARTY_AUTHORITY`
--

DROP TABLE IF EXISTS `CORE_PARTY_AUTHORITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CORE_PARTY_AUTHORITY` (
  `PARTY_ID` bigint(20) NOT NULL COMMENT 'The CORE_PARTY ',
  `AUTHORITY` varchar(50) NOT NULL COMMENT 'The authority',
  KEY `FK_PARTY_AUTHORITY_PARTY` (`PARTY_ID`),
  CONSTRAINT `FK_PARTY_AUTHORITY_PARTY` FOREIGN KEY (`PARTY_ID`) REFERENCES `CORE_PARTY` (`PARTY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CORE_PARTY_AUTHORITY`
--

LOCK TABLES `CORE_PARTY_AUTHORITY` WRITE;
/*!40000 ALTER TABLE `CORE_PARTY_AUTHORITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `CORE_PARTY_AUTHORITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CORE_TEAM`
--

DROP TABLE IF EXISTS `CORE_TEAM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CORE_TEAM` (
  `PARTY_ID` bigint(20) NOT NULL COMMENT 'cle primaire, qui est aussi une cle etrangere vers la table PARTY_ID Ne doit donc pas etre autogeneree.',
  `NAME` varchar(50) NOT NULL,
  `CREATED_BY` varchar(100) NOT NULL,
  `CREATED_ON` datetime NOT NULL COMMENT 'Date de creation. Il s''agit de la date de creation de l''entree dans      la base, non d''une date metier.',
  `LAST_MODIFIED_ON` datetime DEFAULT NULL COMMENT 'Date de derniere mise a jour de cette instance.',
  `LAST_MODIFIED_BY` varchar(100) DEFAULT NULL,
  `DESCRIPTION` longtext DEFAULT NULL,
  PRIMARY KEY (`PARTY_ID`),
  CONSTRAINT `fk_team_party` FOREIGN KEY (`PARTY_ID`) REFERENCES `CORE_PARTY` (`PARTY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CORE_TEAM`
--

LOCK TABLES `CORE_TEAM` WRITE;
/*!40000 ALTER TABLE `CORE_TEAM` DISABLE KEYS */;
/*!40000 ALTER TABLE `CORE_TEAM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CORE_TEAM_MEMBER`
--

DROP TABLE IF EXISTS `CORE_TEAM_MEMBER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CORE_TEAM_MEMBER` (
  `TEAM_ID` bigint(20) NOT NULL,
  `USER_ID` bigint(20) NOT NULL,
  UNIQUE KEY `DX_TEAM_MEMBER` (`TEAM_ID`,`USER_ID`),
  KEY `fk_team_member_user` (`USER_ID`),
  CONSTRAINT `fk_team_member_team` FOREIGN KEY (`TEAM_ID`) REFERENCES `CORE_TEAM` (`PARTY_ID`),
  CONSTRAINT `fk_team_member_user` FOREIGN KEY (`USER_ID`) REFERENCES `CORE_USER` (`PARTY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CORE_TEAM_MEMBER`
--

LOCK TABLES `CORE_TEAM_MEMBER` WRITE;
/*!40000 ALTER TABLE `CORE_TEAM_MEMBER` DISABLE KEYS */;
/*!40000 ALTER TABLE `CORE_TEAM_MEMBER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CORE_USER`
--

DROP TABLE IF EXISTS `CORE_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CORE_USER` (
  `PARTY_ID` bigint(20) NOT NULL,
  `LOGIN` varchar(100) NOT NULL,
  `FIRST_NAME` varchar(50) NOT NULL DEFAULT '' COMMENT 'The user''s first name',
  `LAST_NAME` varchar(50) NOT NULL DEFAULT '' COMMENT 'The user''s last name',
  `EMAIL` varchar(255) DEFAULT '',
  `ACTIVE` bit(1) NOT NULL DEFAULT b'0' COMMENT 'User is active or not',
  `CREATED_BY` varchar(100) NOT NULL,
  `CREATED_ON` datetime NOT NULL COMMENT 'Date de creation de cet utilisateur. Il s''agit de la date de creation de l''entree dans       la base, non d''une date metier.',
  `LAST_MODIFIED_ON` datetime DEFAULT NULL COMMENT 'Date de derniere mise a jour de cette instance.',
  `LAST_MODIFIED_BY` varchar(100) DEFAULT NULL,
  `LAST_CONNECTED_ON` datetime DEFAULT NULL COMMENT 'a column to persist the last connection date',
  `CAN_DELETE_FROM_FRONT` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`PARTY_ID`),
  UNIQUE KEY `CT_UNIQUE_USER_LOGIN` (`LOGIN`),
  UNIQUE KEY `DX_USER_LOGIN` (`LOGIN`),
  CONSTRAINT `fk_core_user_party` FOREIGN KEY (`PARTY_ID`) REFERENCES `CORE_PARTY` (`PARTY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CORE_USER`
--

LOCK TABLES `CORE_USER` WRITE;
/*!40000 ALTER TABLE `CORE_USER` DISABLE KEYS */;
INSERT INTO `CORE_USER` VALUES (1,'admin','','Squash Administrator','admin@squashtest.org','','liquibase','2025-04-28 12:13:40',NULL,NULL,'2025-04-28 14:46:52','');
/*!40000 ALTER TABLE `CORE_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CRLN_RELATIONSHIP`
--

DROP TABLE IF EXISTS `CRLN_RELATIONSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CRLN_RELATIONSHIP` (
  `ANCESTOR_ID` bigint(20) DEFAULT NULL COMMENT 'cle etrangere vers le noeud parent',
  `DESCENDANT_ID` bigint(20) NOT NULL COMMENT 'cle etrangere vers l''element fils. ',
  `CONTENT_ORDER` bigint(20) DEFAULT NULL COMMENT 'numéro d''ordre du noeud dans son parent',
  KEY `idx_crln_relationship_descendant` (`DESCENDANT_ID`),
  KEY `idx_crln_relationship_ancestor` (`ANCESTOR_ID`),
  CONSTRAINT `fk_crln_relationship_ancestor` FOREIGN KEY (`ANCESTOR_ID`) REFERENCES `CUSTOM_REPORT_LIBRARY_NODE` (`CRLN_ID`),
  CONSTRAINT `fk_crln_relationship_descendant` FOREIGN KEY (`DESCENDANT_ID`) REFERENCES `CUSTOM_REPORT_LIBRARY_NODE` (`CRLN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CRLN_RELATIONSHIP`
--

LOCK TABLES `CRLN_RELATIONSHIP` WRITE;
/*!40000 ALTER TABLE `CRLN_RELATIONSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `CRLN_RELATIONSHIP` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`squashuser`@`%`*/ /*!50003 trigger attach_crln_after after insert on CRLN_RELATIONSHIP
		for each row insert ignore into CRLN_RELATIONSHIP_CLOSURE
		select
		c1.ancestor_id, c2.descendant_id, c1.depth+c2.depth+1
		from
		CRLN_RELATIONSHIP_CLOSURE c1
		cross join CRLN_RELATIONSHIP_CLOSURE c2
		where c1.descendant_id = new.ancestor_id
		and c2.ancestor_id = new.descendant_id */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`squashuser`@`%`*/ /*!50003 trigger detach_crln_before before delete on
		CRLN_RELATIONSHIP
		for each row delete clos1 from
		CRLN_RELATIONSHIP_CLOSURE clos1
		join CRLN_RELATIONSHIP_CLOSURE clos2
		on
		clos1.descendant_id=clos2.descendant_id
		left join
		CRLN_RELATIONSHIP_CLOSURE clos3
		on clos3.ancestor_id = clos2.ancestor_id
		and clos3.descendant_id = clos1.ancestor_id
		where
		clos2.ancestor_id = old.descendant_id
		and clos3.ancestor_id is null */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `CRLN_RELATIONSHIP_CLOSURE`
--

DROP TABLE IF EXISTS `CRLN_RELATIONSHIP_CLOSURE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CRLN_RELATIONSHIP_CLOSURE` (
  `ANCESTOR_ID` bigint(20) NOT NULL COMMENT 'cle etrangere vers le noeud parent. La relation est parfois d''un noeud vers lui meme.',
  `DESCENDANT_ID` bigint(20) NOT NULL COMMENT 'cle etrangere vers l''element fils. La relation est parfois d''un noeud vers lui meme.',
  `DEPTH` smallint(6) NOT NULL COMMENT 'stores how deep is the descendant element nested in the subtree of the ancestor element',
  UNIQUE KEY `ANCESTOR_ID` (`ANCESTOR_ID`,`DESCENDANT_ID`),
  KEY `idx_crln_relationship_clos_desc` (`DESCENDANT_ID`),
  KEY `idx_crln_relationship_clos_anc` (`ANCESTOR_ID`),
  CONSTRAINT `fk_crln_relationship_clos_anc` FOREIGN KEY (`ANCESTOR_ID`) REFERENCES `CUSTOM_REPORT_LIBRARY_NODE` (`CRLN_ID`),
  CONSTRAINT `fk_crln_relationship_clos_desc` FOREIGN KEY (`DESCENDANT_ID`) REFERENCES `CUSTOM_REPORT_LIBRARY_NODE` (`CRLN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CRLN_RELATIONSHIP_CLOSURE`
--

LOCK TABLES `CRLN_RELATIONSHIP_CLOSURE` WRITE;
/*!40000 ALTER TABLE `CRLN_RELATIONSHIP_CLOSURE` DISABLE KEYS */;
INSERT INTO `CRLN_RELATIONSHIP_CLOSURE` VALUES (1,1,0),(2,2,0);
/*!40000 ALTER TABLE `CRLN_RELATIONSHIP_CLOSURE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOM_EXPORT_COLUMN`
--

DROP TABLE IF EXISTS `CUSTOM_EXPORT_COLUMN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CUSTOM_EXPORT_COLUMN` (
  `CUSTOM_EXPORT_ID` bigint(20) NOT NULL COMMENT 'Foreign key to the Custom Export',
  `LABEL` varchar(255) DEFAULT NULL,
  `CUF_ID` bigint(20) DEFAULT NULL,
  KEY `fk_custom_export_column_custom_export_id` (`CUSTOM_EXPORT_ID`),
  CONSTRAINT `fk_custom_export_column_custom_export_id` FOREIGN KEY (`CUSTOM_EXPORT_ID`) REFERENCES `CUSTOM_REPORT_CUSTOM_EXPORT` (`CRCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOM_EXPORT_COLUMN`
--

LOCK TABLES `CUSTOM_EXPORT_COLUMN` WRITE;
/*!40000 ALTER TABLE `CUSTOM_EXPORT_COLUMN` DISABLE KEYS */;
/*!40000 ALTER TABLE `CUSTOM_EXPORT_COLUMN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOM_EXPORT_SCOPE`
--

DROP TABLE IF EXISTS `CUSTOM_EXPORT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CUSTOM_EXPORT_SCOPE` (
  `CUSTOM_EXPORT_ID` bigint(20) NOT NULL COMMENT 'Foreign key to the Custom Export',
  `ENTITY_REFERENCE_TYPE` varchar(50) DEFAULT NULL,
  `ENTITY_REFERENCE_ID` bigint(20) DEFAULT NULL,
  KEY `fk_custom_export_scope_custom_export_id` (`CUSTOM_EXPORT_ID`),
  CONSTRAINT `fk_custom_export_scope_custom_export_id` FOREIGN KEY (`CUSTOM_EXPORT_ID`) REFERENCES `CUSTOM_REPORT_CUSTOM_EXPORT` (`CRCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOM_EXPORT_SCOPE`
--

LOCK TABLES `CUSTOM_EXPORT_SCOPE` WRITE;
/*!40000 ALTER TABLE `CUSTOM_EXPORT_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CUSTOM_EXPORT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOM_FIELD`
--

DROP TABLE IF EXISTS `CUSTOM_FIELD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CUSTOM_FIELD` (
  `CF_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FIELD_TYPE` varchar(3) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  `LABEL` varchar(255) NOT NULL DEFAULT '',
  `OPTIONAL` bit(1) NOT NULL DEFAULT b'1',
  `DEFAULT_VALUE` varchar(255) DEFAULT NULL,
  `INPUT_TYPE` varchar(30) DEFAULT NULL,
  `CODE` varchar(30) NOT NULL DEFAULT '',
  `LARGE_DEFAULT_VALUE` text DEFAULT NULL COMMENT 'this column is used by rich text cufs. It contains HTML data.',
  `NUMERIC_DEFAULT_VALUE` decimal(20,5) DEFAULT NULL COMMENT 'a column to persist numeric cuf',
  PRIMARY KEY (`CF_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOM_FIELD`
--

LOCK TABLES `CUSTOM_FIELD` WRITE;
/*!40000 ALTER TABLE `CUSTOM_FIELD` DISABLE KEYS */;
/*!40000 ALTER TABLE `CUSTOM_FIELD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOM_FIELD_BINDING`
--

DROP TABLE IF EXISTS `CUSTOM_FIELD_BINDING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CUSTOM_FIELD_BINDING` (
  `CFB_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CF_ID` bigint(20) NOT NULL,
  `BOUND_ENTITY` varchar(30) NOT NULL,
  `BOUND_PROJECT_ID` bigint(20) NOT NULL,
  `POSITION` int(11) DEFAULT NULL,
  PRIMARY KEY (`CFB_ID`),
  UNIQUE KEY `uc_cf_entity_proj_bnd` (`BOUND_PROJECT_ID`,`BOUND_ENTITY`,`CF_ID`),
  KEY `fk_cfb_cf` (`CF_ID`),
  CONSTRAINT `fk_cfb_bound_project` FOREIGN KEY (`BOUND_PROJECT_ID`) REFERENCES `PROJECT` (`PROJECT_ID`),
  CONSTRAINT `fk_cfb_cf` FOREIGN KEY (`CF_ID`) REFERENCES `CUSTOM_FIELD` (`CF_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOM_FIELD_BINDING`
--

LOCK TABLES `CUSTOM_FIELD_BINDING` WRITE;
/*!40000 ALTER TABLE `CUSTOM_FIELD_BINDING` DISABLE KEYS */;
/*!40000 ALTER TABLE `CUSTOM_FIELD_BINDING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOM_FIELD_OPTION`
--

DROP TABLE IF EXISTS `CUSTOM_FIELD_OPTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CUSTOM_FIELD_OPTION` (
  `CF_ID` bigint(20) NOT NULL,
  `LABEL` varchar(255) NOT NULL,
  `POSITION` int(11) DEFAULT NULL,
  `CODE` varchar(30) NOT NULL DEFAULT '',
  `COLOUR` varchar(7) DEFAULT NULL,
  KEY `fk_cf_option_cf` (`CF_ID`),
  CONSTRAINT `fk_cf_option_cf` FOREIGN KEY (`CF_ID`) REFERENCES `CUSTOM_FIELD` (`CF_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOM_FIELD_OPTION`
--

LOCK TABLES `CUSTOM_FIELD_OPTION` WRITE;
/*!40000 ALTER TABLE `CUSTOM_FIELD_OPTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `CUSTOM_FIELD_OPTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOM_FIELD_RENDERING_LOCATION`
--

DROP TABLE IF EXISTS `CUSTOM_FIELD_RENDERING_LOCATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CUSTOM_FIELD_RENDERING_LOCATION` (
  `CFB_ID` bigint(20) NOT NULL,
  `RENDERING_LOCATION` varchar(30) NOT NULL,
  KEY `fk_cfb_render_loc_cfb` (`CFB_ID`),
  CONSTRAINT `fk_cfb_render_loc_cfb` FOREIGN KEY (`CFB_ID`) REFERENCES `CUSTOM_FIELD_BINDING` (`CFB_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOM_FIELD_RENDERING_LOCATION`
--

LOCK TABLES `CUSTOM_FIELD_RENDERING_LOCATION` WRITE;
/*!40000 ALTER TABLE `CUSTOM_FIELD_RENDERING_LOCATION` DISABLE KEYS */;
/*!40000 ALTER TABLE `CUSTOM_FIELD_RENDERING_LOCATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOM_FIELD_VALUE`
--

DROP TABLE IF EXISTS `CUSTOM_FIELD_VALUE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CUSTOM_FIELD_VALUE` (
  `CFV_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'technical id',
  `BOUND_ENTITY_ID` bigint(20) NOT NULL COMMENT 'the id of the bound entity',
  `BOUND_ENTITY_TYPE` varchar(30) NOT NULL COMMENT 'the kind of entity. Note that this information is also contained by the                  custom field binding.',
  `CFB_ID` bigint(20) NOT NULL COMMENT 'the custom field binding that holds all the data',
  `VALUE` varchar(255) DEFAULT NULL COMMENT 'the value of that particular custom field value',
  `LARGE_VALUE` text DEFAULT NULL COMMENT 'this column is used by rich text cufs. It contains HTML data.',
  `FIELD_TYPE` varchar(3) NOT NULL DEFAULT 'CF' COMMENT 'CF : simple, RTF : rich text field',
  `NUMERIC_VALUE` decimal(20,5) DEFAULT NULL COMMENT 'a column to persist numeric cuf',
  `CF_ID` bigint(20) DEFAULT NULL COMMENT 'dernomalize the custom field id for custom report queries',
  PRIMARY KEY (`CFV_ID`),
  UNIQUE KEY `u_cfv_type_id_binding` (`BOUND_ENTITY_TYPE`,`BOUND_ENTITY_ID`,`CFB_ID`),
  KEY `fk_cfv_cf_binding` (`CFB_ID`),
  KEY `idx_cfv_entity_id` (`BOUND_ENTITY_ID`),
  KEY `idx_cfv_entity_type` (`BOUND_ENTITY_TYPE`),
  KEY `idx_cfv_custom_field_id` (`CF_ID`),
  CONSTRAINT `fk_cfv_cf_binding` FOREIGN KEY (`CFB_ID`) REFERENCES `CUSTOM_FIELD_BINDING` (`CFB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOM_FIELD_VALUE`
--

LOCK TABLES `CUSTOM_FIELD_VALUE` WRITE;
/*!40000 ALTER TABLE `CUSTOM_FIELD_VALUE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CUSTOM_FIELD_VALUE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOM_FIELD_VALUE_OPTION`
--

DROP TABLE IF EXISTS `CUSTOM_FIELD_VALUE_OPTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CUSTOM_FIELD_VALUE_OPTION` (
  `CFV_ID` bigint(20) NOT NULL,
  `LABEL` varchar(255) NOT NULL,
  `POSITION` int(11) NOT NULL,
  KEY `fk_cfv_option_cfv` (`CFV_ID`),
  CONSTRAINT `fk_cfv_option_cfv` FOREIGN KEY (`CFV_ID`) REFERENCES `CUSTOM_FIELD_VALUE` (`CFV_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='The table.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOM_FIELD_VALUE_OPTION`
--

LOCK TABLES `CUSTOM_FIELD_VALUE_OPTION` WRITE;
/*!40000 ALTER TABLE `CUSTOM_FIELD_VALUE_OPTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `CUSTOM_FIELD_VALUE_OPTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOM_REPORT_CHART_BINDING`
--

DROP TABLE IF EXISTS `CUSTOM_REPORT_CHART_BINDING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CUSTOM_REPORT_CHART_BINDING` (
  `CRCB_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'pk genere',
  `CRD_ID` bigint(20) NOT NULL COMMENT 'cle etrangere vers le dashboard. ',
  `CHART_ID` bigint(20) NOT NULL COMMENT 'cle etrangere vers le chart. ',
  `ROW` int(11) DEFAULT NULL,
  `COL` int(11) DEFAULT NULL,
  `SIZE_X` int(11) DEFAULT NULL,
  `SIZE_Y` int(11) DEFAULT NULL,
  PRIMARY KEY (`CRCB_ID`),
  KEY `fk_chart_bindind_custom_report_dashboard_crd_id` (`CRD_ID`),
  KEY `fk_chart_bindind_chart_definition_chart_id` (`CHART_ID`),
  CONSTRAINT `fk_chart_bindind_chart_definition_chart_id` FOREIGN KEY (`CHART_ID`) REFERENCES `CHART_DEFINITION` (`CHART_ID`),
  CONSTRAINT `fk_chart_bindind_custom_report_dashboard_crd_id` FOREIGN KEY (`CRD_ID`) REFERENCES `CUSTOM_REPORT_DASHBOARD` (`CRD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOM_REPORT_CHART_BINDING`
--

LOCK TABLES `CUSTOM_REPORT_CHART_BINDING` WRITE;
/*!40000 ALTER TABLE `CUSTOM_REPORT_CHART_BINDING` DISABLE KEYS */;
/*!40000 ALTER TABLE `CUSTOM_REPORT_CHART_BINDING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOM_REPORT_CUSTOM_EXPORT`
--

DROP TABLE IF EXISTS `CUSTOM_REPORT_CUSTOM_EXPORT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CUSTOM_REPORT_CUSTOM_EXPORT` (
  `CRCE_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'The auto-generated id',
  `NAME` varchar(255) DEFAULT NULL COMMENT 'The name of the Custom Export',
  `PROJECT_ID` bigint(20) NOT NULL COMMENT 'Foreign key to the Project',
  `CREATED_BY` varchar(100) NOT NULL,
  `CREATED_ON` datetime NOT NULL,
  `LAST_MODIFIED_BY` varchar(100) DEFAULT NULL,
  `LAST_MODIFIED_ON` datetime DEFAULT NULL,
  PRIMARY KEY (`CRCE_ID`),
  KEY `idx_fk_custom_export_project_id` (`PROJECT_ID`),
  CONSTRAINT `fk_custom_export_project_id` FOREIGN KEY (`PROJECT_ID`) REFERENCES `PROJECT` (`PROJECT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOM_REPORT_CUSTOM_EXPORT`
--

LOCK TABLES `CUSTOM_REPORT_CUSTOM_EXPORT` WRITE;
/*!40000 ALTER TABLE `CUSTOM_REPORT_CUSTOM_EXPORT` DISABLE KEYS */;
/*!40000 ALTER TABLE `CUSTOM_REPORT_CUSTOM_EXPORT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOM_REPORT_DASHBOARD`
--

DROP TABLE IF EXISTS `CUSTOM_REPORT_DASHBOARD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CUSTOM_REPORT_DASHBOARD` (
  `CRD_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'pk genere',
  `NAME` varchar(255) DEFAULT NULL,
  `PROJECT_ID` bigint(20) NOT NULL COMMENT 'cle etrangere vers le projet. ',
  `CREATED_BY` varchar(100) NOT NULL,
  `CREATED_ON` datetime NOT NULL,
  `LAST_MODIFIED_BY` varchar(100) DEFAULT NULL,
  `LAST_MODIFIED_ON` datetime DEFAULT NULL,
  PRIMARY KEY (`CRD_ID`),
  KEY `fk_project_custom_report_dashboard_project_id` (`PROJECT_ID`),
  CONSTRAINT `fk_project_custom_report_dashboard_project_id` FOREIGN KEY (`PROJECT_ID`) REFERENCES `PROJECT` (`PROJECT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOM_REPORT_DASHBOARD`
--

LOCK TABLES `CUSTOM_REPORT_DASHBOARD` WRITE;
/*!40000 ALTER TABLE `CUSTOM_REPORT_DASHBOARD` DISABLE KEYS */;
/*!40000 ALTER TABLE `CUSTOM_REPORT_DASHBOARD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOM_REPORT_FOLDER`
--

DROP TABLE IF EXISTS `CUSTOM_REPORT_FOLDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CUSTOM_REPORT_FOLDER` (
  `CRF_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'pk genere',
  `NAME` varchar(255) DEFAULT NULL,
  `DESCRIPTION` longtext DEFAULT NULL,
  `PROJECT_ID` bigint(20) NOT NULL COMMENT 'cle etrangere vers le projet. ',
  PRIMARY KEY (`CRF_ID`),
  KEY `fk_project_custom_report_folder_project_id` (`PROJECT_ID`),
  CONSTRAINT `fk_project_custom_report_folder_project_id` FOREIGN KEY (`PROJECT_ID`) REFERENCES `PROJECT` (`PROJECT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOM_REPORT_FOLDER`
--

LOCK TABLES `CUSTOM_REPORT_FOLDER` WRITE;
/*!40000 ALTER TABLE `CUSTOM_REPORT_FOLDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `CUSTOM_REPORT_FOLDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOM_REPORT_LIBRARY`
--

DROP TABLE IF EXISTS `CUSTOM_REPORT_LIBRARY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CUSTOM_REPORT_LIBRARY` (
  `CRL_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'pk genere',
  `ATTACHMENT_LIST_ID` bigint(20) DEFAULT NULL COMMENT 'FK to ATTACHMENT_LIST',
  PRIMARY KEY (`CRL_ID`),
  KEY `IDX_CUSTOM_REPORT_LIBRARY` (`CRL_ID`),
  KEY `fk_crl_attachment_list` (`ATTACHMENT_LIST_ID`),
  CONSTRAINT `fk_crl_attachment_list` FOREIGN KEY (`ATTACHMENT_LIST_ID`) REFERENCES `ATTACHMENT_LIST` (`ATTACHMENT_LIST_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOM_REPORT_LIBRARY`
--

LOCK TABLES `CUSTOM_REPORT_LIBRARY` WRITE;
/*!40000 ALTER TABLE `CUSTOM_REPORT_LIBRARY` DISABLE KEYS */;
INSERT INTO `CUSTOM_REPORT_LIBRARY` VALUES (1,4),(2,11);
/*!40000 ALTER TABLE `CUSTOM_REPORT_LIBRARY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOM_REPORT_LIBRARY_NODE`
--

DROP TABLE IF EXISTS `CUSTOM_REPORT_LIBRARY_NODE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CUSTOM_REPORT_LIBRARY_NODE` (
  `CRLN_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'pk genere',
  `NAME` varchar(255) DEFAULT NULL,
  `ENTITY_TYPE` varchar(50) DEFAULT NULL,
  `ENTITY_ID` bigint(20) DEFAULT NULL,
  `CRL_ID` bigint(20) DEFAULT NULL COMMENT 'fk to the containing CUSTOM_REPORT_LIBRARY',
  PRIMARY KEY (`CRLN_ID`),
  KEY `fk_crln_custom_report_library_crl_id` (`CRL_ID`),
  CONSTRAINT `fk_crln_custom_report_library_crl_id` FOREIGN KEY (`CRL_ID`) REFERENCES `CUSTOM_REPORT_LIBRARY` (`CRL_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOM_REPORT_LIBRARY_NODE`
--

LOCK TABLES `CUSTOM_REPORT_LIBRARY_NODE` WRITE;
/*!40000 ALTER TABLE `CUSTOM_REPORT_LIBRARY_NODE` DISABLE KEYS */;
INSERT INTO `CUSTOM_REPORT_LIBRARY_NODE` VALUES (1,'Beaurain','LIBRARY',1,1),(2,'Test','LIBRARY',2,2);
/*!40000 ALTER TABLE `CUSTOM_REPORT_LIBRARY_NODE` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`squashuser`@`%`*/ /*!50003 trigger ins_crln_after after insert on
		CUSTOM_REPORT_LIBRARY_NODE
		for each row insert ignore into
		CRLN_RELATIONSHIP_CLOSURE values (new.crln_id, new.crln_id, 0) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`squashuser`@`%`*/ /*!50003 trigger del_crln_before before delete on
		CUSTOM_REPORT_LIBRARY_NODE
		for each row delete from
		CRLN_RELATIONSHIP_CLOSURE where ancestor_id=old.crln_id and
		descendant_id=old.crln_id */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `CUSTOM_REPORT_REPORT_BINDING`
--

DROP TABLE IF EXISTS `CUSTOM_REPORT_REPORT_BINDING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CUSTOM_REPORT_REPORT_BINDING` (
  `CRRB_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'pk genere',
  `CRD_ID` bigint(20) NOT NULL COMMENT 'cle etrangere vers le dashboard. ',
  `REPORT_ID` bigint(20) NOT NULL COMMENT 'cle etrangere vers le report. ',
  `ROW` int(11) DEFAULT NULL,
  `COL` int(11) DEFAULT NULL,
  `SIZE_X` int(11) DEFAULT NULL,
  `SIZE_Y` int(11) DEFAULT NULL,
  PRIMARY KEY (`CRRB_ID`),
  KEY `fk_report_bindind_custom_report_dashboard_crd_id` (`CRD_ID`),
  KEY `fk_chart_bindind_report_definition_report_id` (`REPORT_ID`),
  CONSTRAINT `fk_chart_bindind_report_definition_report_id` FOREIGN KEY (`REPORT_ID`) REFERENCES `REPORT_DEFINITION` (`REPORT_ID`),
  CONSTRAINT `fk_report_bindind_custom_report_dashboard_crd_id` FOREIGN KEY (`CRD_ID`) REFERENCES `CUSTOM_REPORT_DASHBOARD` (`CRD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOM_REPORT_REPORT_BINDING`
--

LOCK TABLES `CUSTOM_REPORT_REPORT_BINDING` WRITE;
/*!40000 ALTER TABLE `CUSTOM_REPORT_REPORT_BINDING` DISABLE KEYS */;
/*!40000 ALTER TABLE `CUSTOM_REPORT_REPORT_BINDING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) DEFAULT NULL,
  `AUTHOR` varchar(255) DEFAULT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` VALUES ('1','gfouquet','auth/auth.changelog-1.0.xml','2025-04-28 12:13:40',1,'EXECUTED','8:3d9ef6ff908a32ab0bbf37a6a87b4998','createTable tableName=AUTH_USER; createIndex indexName=IDX_AUTHENTICATION, tableName=AUTH_USER; insert tableName=AUTH_USER','',NULL,'4.19.0',NULL,'legacy','5842419196'),('1','gfouquet','core/core.changelog-0.15.0.xml','2025-04-28 12:13:40',2,'EXECUTED','8:055dd90ad38219f8193c6a49a1791387','createTable tableName=CORE_USER; createIndex indexName=DX_USER_LOGIN, tableName=CORE_USER','',NULL,'4.19.0',NULL,'legacy','5842419196'),('2','gfouquet','core/core.changelog-0.15.0.xml','2025-04-28 12:13:40',3,'EXECUTED','8:3524c5f35c59cdac07e97f678410c887','createTable tableName=CORE_GROUP','',NULL,'4.19.0',NULL,'legacy','5842419196'),('3','gfouquet','core/core.changelog-0.15.0.xml','2025-04-28 12:13:40',4,'EXECUTED','8:37a3be801f407c743188a5c35ddab6fb','createTable tableName=CORE_GROUP_AUTHORITY; createIndex indexName=DX_GRP_ID, tableName=CORE_GROUP_AUTHORITY','',NULL,'4.19.0',NULL,'legacy','5842419196'),('4','gfouquet','core/core.changelog-0.15.0.xml','2025-04-28 12:13:40',5,'EXECUTED','8:8ed24313055b9c1061e6598f1ecfb40d','createTable tableName=CORE_GROUP_MEMBER; createIndex indexName=DX_GRP_MEMBER, tableName=CORE_GROUP_MEMBER','',NULL,'4.19.0',NULL,'legacy','5842419196'),('5','gfouquet','core/core.changelog-0.15.0.xml','2025-04-28 12:13:40',6,'EXECUTED','8:498253d8a7b4423f27ab556d6b567e1d','insert tableName=CORE_GROUP; insert tableName=CORE_GROUP_AUTHORITY; insert tableName=CORE_GROUP_AUTHORITY; insert tableName=CORE_USER; insert tableName=CORE_GROUP_MEMBER','',NULL,'4.19.0',NULL,'legacy','5842419196'),('7','gfouquet','core/core.changelog-0.15.0.xml','2025-04-28 12:13:40',7,'EXECUTED','8:17b7a3610b14cac414514bd80adfbe60','createTable tableName=ACL_CLASS; createIndex indexName=DX_CLASS_NAME, tableName=ACL_CLASS','',NULL,'4.19.0',NULL,'legacy','5842419196'),('8','gfouquet','core/core.changelog-0.15.0.xml','2025-04-28 12:13:40',8,'EXECUTED','8:6430e03210e17fc411d599f1c44ed253','createTable tableName=ACL_OBJECT_IDENTITY; addUniqueConstraint tableName=ACL_OBJECT_IDENTITY; createIndex indexName=DX_OBJ_ID_IDENTITY, tableName=ACL_OBJECT_IDENTITY','',NULL,'4.19.0',NULL,'legacy','5842419196'),('9','gfouquet','core/core.changelog-0.15.0.xml','2025-04-28 12:13:40',9,'EXECUTED','8:484cb95f2ebb0b80cbc9e84a82326b71','createTable tableName=ACL_GROUP','',NULL,'4.19.0',NULL,'legacy','5842419196'),('10','gfouquet','core/core.changelog-0.15.0.xml','2025-04-28 12:13:40',10,'EXECUTED','8:b20818cdcce60e485ac93f35dff82fa6','createTable tableName=ACL_GROUP_PERMISSION; addPrimaryKey constraintName=PK_ACL_GRP_PERMISSION, tableName=ACL_GROUP_PERMISSION','',NULL,'4.19.0',NULL,'legacy','5842419196'),('11','gfouquet','core/core.changelog-0.15.0.xml','2025-04-28 12:13:40',11,'EXECUTED','8:72cc4523a501dbbe41a564861b9f781d','createTable tableName=ACL_RESPONSIBILITY_SCOPE_ENTRY','',NULL,'4.19.0',NULL,'legacy','5842419196'),('core-0.20.0.01','ramoussou','core/core.changelog-0.20.0.xml','2025-04-28 12:13:40',12,'EXECUTED','8:2cd6847655e834de27ab193dd6dce68e','createTable tableName=CORE_CONFIG','Creation of a new table CORE_CONFIG containing Application configuration',NULL,'4.19.0',NULL,'legacy','5842419196'),('core-0.20.0.02','gfouquet','core/core.changelog-0.20.0.xml','2025-04-28 12:13:40',13,'EXECUTED','8:ef79d86b09bba9709eec0c58596b246a','sql','Default welcome message',NULL,'4.19.0',NULL,'legacy','5842419196'),('core-1.1.1.RELEASE.01','mpagnon','core/core.changelog-1.1.1.xml','2025-04-28 12:13:40',14,'EXECUTED','8:e3ba4fe0cda3717bd05b71f091b7e4ec','sql','Add new line in CORE_CONFIG for LOGIN_MESSAGE',NULL,'4.19.0',NULL,'legacy','5842419196'),('core-feat-327','mpagnon','core/core.changelog-1.4.0.xml','2025-04-28 12:13:40',15,'EXECUTED','8:323c895a060d7f87a79287ea2c7d1489','sql','Because admin was not active , need to make sure that all user active in auth_user are active in core_user',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.14.0.01','bsiri','tm/tm.changelog-0.15.0.xml','2025-04-28 12:13:40',16,'EXECUTED','8:5d3b93c579ca3e2716f45d1e1860fb7f','createTable tableName=ISSUE; createIndex indexName=idx_issue, tableName=ISSUE','This table maintains the mapping between an issue in Squash and an\n			issue in the remote bugtracker',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.14.0.02','bsiri','tm/tm.changelog-0.15.0.xml','2025-04-28 12:13:40',17,'EXECUTED','8:3ab8c4e40f4a554ed9bb8aec931e9f8e','createTable tableName=ISSUE_LIST; createIndex indexName=idx_issue_list, tableName=ISSUE_LIST','each Squash entity that may be attached to one or several bugs will be given an issue list. This table will maintain that list, an entry means that some entity refering to it have several.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.14.0.03','bsiri','tm/tm.changelog-0.15.0.xml','2025-04-28 12:13:40',18,'EXECUTED','8:2020ecc2a7f9697b1bcbcdc950764a11','createTable tableName=ISSUE_LIST_CONTENT','This table will map one issue_list to (0,several) issues',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.14.0.04','bsiri','tm/tm.changelog-0.15.0.xml','2025-04-28 12:13:40',19,'EXECUTED','8:7d216543a6e43252c9d9a6c7f39f4b2b','createTable tableName=ATTACHMENT_CONTENT','Cette table contient le contenu d\'une pièce jointe, dont les meta infos sont stockees dans la\n			table ATTACHMENT. La relation entre les deux tables est 1-1',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.14.0.05','bsiri','tm/tm.changelog-0.15.0.xml','2025-04-28 12:13:40',20,'EXECUTED','8:4f375dd25e0120e0392f4869f59e92d1','createTable tableName=ATTACHMENT; createIndex indexName=idx_attachment, tableName=ATTACHMENT','Cette table stockera les pieces jointes. La piece elle même est un blob stocke a part dans\n					la table ATTACHMENT_CONTENT. La relation entre les deux tables est 1-1',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.14.0.06','bsiri','tm/tm.changelog-0.15.0.xml','2025-04-28 12:13:40',21,'EXECUTED','8:5e04a2b804609a1feae02e24bd6a1500','createTable tableName=ATTACHMENT_LIST','Cette table matérialise une liste d\'ATTACHMENT. Bien qu\'elle ne contienne que sa clé primaire, sa raison d\'exister est, au niveau de l\'application, de fournir une entité indépendante des entités métier auquel on rajoute les pièces jointes.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.14.0.07','bsiri','tm/tm.changelog-0.15.0.xml','2025-04-28 12:13:40',22,'EXECUTED','8:ecc4ab3f7d2a383d967c43687264b78b','createTable tableName=ATTACHMENT_LIST_CONTENT','Table d\'association entre un cas de test et ses pieces jointes',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.14.0.08','ramoussou','tm/tm.changelog-0.15.0.xml','2025-04-28 12:13:40',23,'EXECUTED','8:a8b05b7b8080db15350f486b617a659c','createTable tableName=PROJECT; createIndex indexName=idx_project, tableName=PROJECT','Table representant les projets englobants les libraries d\'entite que nous utilisons.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.14.0.09','bsiri','tm/tm.changelog-0.15.0.xml','2025-04-28 12:13:40',24,'EXECUTED','8:fd1c7bb9ed332c714dd2b5010e0b12c4','createTable tableName=TEST_CASE_LIBRARY; createIndex indexName=idx_test_case_library, tableName=TEST_CASE_LIBRARY','Cette table gere les bibliotheques de cas de test. Une bibliotheque de cas de test peut contenir plusieurs\n		repertoires et/ou cas de test, ces deux entites etant regroupees sous l\'appellation generique d\'element de bibliotheque\n		de cas de test (...',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.14.0.10','bsiri','tm/tm.changelog-0.15.0.xml','2025-04-28 12:13:40',25,'EXECUTED','8:016e5344da49c0996032a6e8906d01c6','createTable tableName=REQUIREMENT_LIBRARY; createIndex indexName=idx_requirement_library, tableName=REQUIREMENT_LIBRARY','Cette table gere les bibliotheques d\'exigences. Une bibliotheque d\'exigences peut contenir plusieurs repertoires\n				et/ou exigences, ces deux entites etant regroupees sous l\'appellation generique d\'element de bibliotheque d\'exigences (requirement...',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.14.0.11','bsiri','tm/tm.changelog-0.15.0.xml','2025-04-28 12:13:40',26,'EXECUTED','8:d7c016fa07a3268e2c27c88b7e975a26','createTable tableName=CAMPAIGN_LIBRARY; createIndex indexName=idx_campaign_library, tableName=CAMPAIGN_LIBRARY','Cette table gere les bibliotheques de campagnes. Une bibliotheque\n		de campagnes peut contenir plusieurs repertoires et/ou campagnes, ces deux\n		entites etant regroupees sous l\'appellation generique d\'element de bibliotheque\n		de campagnes (campai...',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.14.0.12','ramoussou','tm/tm.changelog-0.15.0.xml','2025-04-28 12:13:41',27,'EXECUTED','8:36341a758e071e22a1ab1b8988c9f4a2','addForeignKeyConstraint baseTableName=PROJECT, constraintName=fk_project_cl, referencedTableName=CAMPAIGN_LIBRARY; addForeignKeyConstraint baseTableName=PROJECT, constraintName=fk_project_tcl, referencedTableName=TEST_CASE_LIBRARY; addForeignKeyCo...','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.14.0.13','bsiri','tm/tm.changelog-0.15.0.xml','2025-04-28 12:13:41',28,'EXECUTED','8:e79b3efcef7b253333fd8bfab54ba5bf','createTable tableName=TEST_CASE_LIBRARY_NODE','Cette table represente un element (generique) faisant partie d\'une bibliotheque de cas de test. Cet element\n		generique peut representer soit un repertoire, soit un cas de test. Pour cette raison, que l\'utilisateur cree l\'un ou\n		l\'autre cette tab...',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.14.0.14','bsiri','tm/tm.changelog-0.15.0.xml','2025-04-28 12:13:41',29,'EXECUTED','8:40263cfeea6dcd999fb700b91afd9196','createTable tableName=REQUIREMENT_LIBRARY_NODE','Cette table represente un element (generique) faisant partie d\'une bibliotheque d\'exigences. Cet element\n				generique peut representer soit un repertoire, soit une exigence. Pour cette raison, que l\'utilisateur cree l\'un ou l\'autre\n				cette tabl...',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.14.0.15','bsiri','tm/tm.changelog-0.15.0.xml','2025-04-28 12:13:41',30,'EXECUTED','8:8bdf4f59505a4bdecf8b5e030079cd27','createTable tableName=CAMPAIGN_LIBRARY_NODE','Cette table represente un element (generique) faisant partie\n				d\'une bibliotheque de campagne. Cet element generique peut representer soit\n				un repertoire, soit une campagne. Pour cette raison, que l\'utilisateur cree\n				l\'un ou l\'autre cette ...',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.14.0.16','bsiri','tm/tm.changelog-0.15.0.xml','2025-04-28 12:13:41',31,'EXECUTED','8:4abfcdf848e74b00431338408a53f696','createTable tableName=TEST_CASE; createIndex indexName=idx_test_case, tableName=TEST_CASE','Cette table gere les cas de test proprement dits. Une entree dans cette table indique que l\'element reference dans la table TEST_CASE_LIBRARY_NODE par la cle primaire (egalement cle etrangere) est de type cas de test.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.14.0.17','bsiri','tm/tm.changelog-0.15.0.xml','2025-04-28 12:13:41',32,'EXECUTED','8:f23e095ddd7fb06a8ed0d7e8c38eb496','createTable tableName=TEST_CASE_FOLDER; createIndex indexName=idx_tc_folder, tableName=TEST_CASE_FOLDER','Cette table est rudimentaire. La cle primaire est simplement une cle etrangere vers la table TEST_CASE_LIBRARY_NODE (relation qualifiante).\n		Une entree dans cette table indique que l\'element indexe par cette cle est de type repertoire.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.14.0.18','bsiri','tm/tm.changelog-0.15.0.xml','2025-04-28 12:13:41',33,'EXECUTED','8:84a56cc824a8768759d99b80cd666d1e','createTable tableName=TEST_CASE_LIBRARY_CONTENT; createIndex indexName=idx_test_case_lib_content_content, tableName=TEST_CASE_LIBRARY_CONTENT; createIndex indexName=idx_test_case_lib_content_lib, tableName=TEST_CASE_LIBRARY_CONTENT','Cette table associe les bibliotheques de cas de test a leur contenu (elements de bibliotheques de cas de test).\n		Le contenu d\'une bibliotheque de cas de test est arborescent et est represente suivant un patron composite\n		(voire TEST_CASE_LIBRARY...',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.14.0.19','bsiri','tm/tm.changelog-0.15.0.xml','2025-04-28 12:13:41',34,'EXECUTED','8:3148598af5a9a91deeed6281bb250afa','createTable tableName=TCLN_RELATIONSHIP; createIndex indexName=idx_tcln_relationship_descendant, tableName=TCLN_RELATIONSHIP; createIndex indexName=idx_tcln_relationship_ancestor, tableName=TCLN_RELATIONSHIP','Cette table gere la hierarchie entre elements d\'une bibliotheque de cas de test, associant un element fils a\n		un repertoire parent (si non NULL) ou eventuellement aucun (NULL, dans le cas ou l\'element est a la racine de la bibliotheque\n		de cas d...',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.14.0.20','bsiri','tm/tm.changelog-0.15.0.xml','2025-04-28 12:13:41',35,'EXECUTED','8:1e3cbed34f0726277e26243cda1bacdd','createTable tableName=CAMPAIGN','Cette table gere les campagnes proprement dites. Une entree\n				dans cette table indique que l\'element reference dans la table CAMPAIGN_LIBRARY_NODE\n				par la cle primaire (egalement cle etrangere) est de type campagne.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.14.0.21','bsiri','tm/tm.changelog-0.15.0.xml','2025-04-28 12:13:41',36,'EXECUTED','8:08391f23434a77a19409938d033a4840','createTable tableName=CAMPAIGN_FOLDER','Cette table est rudimentaire. La cle primaire est simplement\n				une cle etrangere vers la table CAMPAIGN_LIBRARY_NODE (relation qualifiante).\n				Une entree dans cette table indique que l\'element indexe par cette cle est\n				de type repertoire.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.14.0.22','bsiri','tm/tm.changelog-0.15.0.xml','2025-04-28 12:13:41',37,'EXECUTED','8:f9f47b93e7c62712769f4e658b49ba0d','createTable tableName=CAMPAIGN_LIBRARY_CONTENT; createIndex indexName=dx_cl_content_cl_node, tableName=CAMPAIGN_LIBRARY_CONTENT; createIndex indexName=dx_cl_content_campaign_lib, tableName=CAMPAIGN_LIBRARY_CONTENT','Cette table gere les bibliotheques de campagnes. Une bibliotheque\n				de campagnes peut contenir plusieurs repertoires et/ou campagnes, ces deux\n				entites etant regroupees sous l\'appellation generique d\'element de bibliotheque\n				de campagnes (...',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.14.0.23','bsiri','tm/tm.changelog-0.15.0.xml','2025-04-28 12:13:41',38,'EXECUTED','8:610f40da3f5d51f9c509df03a469cf89','createTable tableName=CLN_RELATIONSHIP; createIndex indexName=dx_cln_relationship_descendant, tableName=CLN_RELATIONSHIP; createIndex indexName=dx_cln_relationship_ancestor, tableName=CLN_RELATIONSHIP','Cette table gere la hierarchie entre elements d\'une bibliotheque\n				de campagne, associant un element fils a un repertoire parent (si non NULL)\n				ou eventuellement aucun (NULL, dans le cas ou l\'element est a la racine de\n				la bibliotheque de ...',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.14.0.24','bsiri','tm/tm.changelog-0.15.0.xml','2025-04-28 12:13:41',39,'EXECUTED','8:df334bc9e9238ad2869a538b20e056a7','createTable tableName=ITERATION','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.14.0.25','bsiri','tm/tm.changelog-0.15.0.xml','2025-04-28 12:13:41',40,'EXECUTED','8:c139a8e6808bf6ea2a43a0de3557b7ac','createTable tableName=CAMPAIGN_ITERATION','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.14.0.26','bsiri','tm/tm.changelog-0.15.0.xml','2025-04-28 12:13:41',41,'EXECUTED','8:4e9bed3b356f31dda9baa615f8cc6371','createTable tableName=TEST_STEP','Cette table gere les pas de test d\'un cas de test.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.14.0.27','bsiri','tm/tm.changelog-0.15.0.xml','2025-04-28 12:13:41',42,'EXECUTED','8:d21e2ddc45e4d0d37921acafcf001819','createTable tableName=TEST_CASE_STEPS; createIndex indexName=idx_tc_steps_step, tableName=TEST_CASE_STEPS; createIndex indexName=idx_tc_steps_tc, tableName=TEST_CASE_STEPS','Cette table associe un cas de test a ses pas de test. Cette table d\'association existe pour ajouter un attribut d\'ordre (la liste des pas de test est ordonnee). La cle primaire est ici composite, et ne doit pas etre autogeneree.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.14.0.28','xpr','tm/tm.changelog-0.15.0.xml','2025-04-28 12:13:41',43,'EXECUTED','8:6751ed9d2dc5a49ebde66b5840692425','createTable tableName=PROJECT_FILTER; createIndex indexName=DX_UN_PROJECT_FILTER_USER, tableName=PROJECT_FILTER','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.14.0.29','xpr','tm/tm.changelog-0.15.0.xml','2025-04-28 12:13:41',44,'EXECUTED','8:e834c57168097eaac73da92840dd6303','createTable tableName=PROJECT_FILTER_ENTRY; addPrimaryKey constraintName=PK_PROJ_FILTER_ENTRY, tableName=PROJECT_FILTER_ENTRY; createIndex indexName=dx_pfp_project, tableName=PROJECT_FILTER_ENTRY; createIndex indexName=dx_pfp_filter, tableName=PRO...','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.14.0.30','bsiri','tm/tm.changelog-0.15.0.xml','2025-04-28 12:13:41',45,'EXECUTED','8:f11d50d3c4ba925807be95b3da868cd4','createTable tableName=REQUIREMENT; createIndex indexName=idx_requirement, tableName=REQUIREMENT','Cette table gere les exigences proprement dites. Une entree dans cette table indique que l\'element reference\n				dans la table REQUIREMENT_LIBRARY_NODE par la cle primaire (egalement cle etrangere) est de type exigence.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.14.0.31','bsiri','tm/tm.changelog-0.15.0.xml','2025-04-28 12:13:41',46,'EXECUTED','8:05a1d246c9664dc19a17e52bd07ce978','createTable tableName=REQUIREMENT_FOLDER; createIndex indexName=idx_req_folder, tableName=REQUIREMENT_FOLDER','Cette table est rudimentaire. La cle primaire est simplement une cle etrangere vers la table REQUIREMENT_LIBRARY_NODE\n				(relation qualifiante). Une entree dans cette table indique que l\'element indexe par cette cle est de type repertoire.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.14.0.32','bsiri','tm/tm.changelog-0.15.0.xml','2025-04-28 12:13:42',47,'EXECUTED','8:8991560988f2b0dac1c7cc5eec4c02a8','createTable tableName=REQUIREMENT_LIBRARY_CONTENT; createIndex indexName=idx_requirement_lib_content_content, tableName=REQUIREMENT_LIBRARY_CONTENT; createIndex indexName=idx_requirement_lib_content_lib, tableName=REQUIREMENT_LIBRARY_CONTENT','Cette table associe les bibliotheques d\'exigences a leur contenu (elements de bibliotheques d\'exigence).\n		Le contenu d\'une bibliotheque d\'exigence est arborescent et est represente suivant un patron composite (voire REQUIREMENT_LIBRARY_NODE,\n		RE...',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.14.0.33','bsiri','tm/tm.changelog-0.15.0.xml','2025-04-28 12:13:42',48,'EXECUTED','8:854410f19a07111ac4eb5b10cf9cb66a','createTable tableName=RLN_RELATIONSHIP; createIndex indexName=idx_rln_relationship_descendant, tableName=RLN_RELATIONSHIP; createIndex indexName=idx_rln_relationship_ancestor, tableName=RLN_RELATIONSHIP','Cette table gere la hierarchie entre elements d\'une bibliotheque d\'exigences, associant un element fils\n				a un repertoire parent.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.14.0.34','bsiri','tm/tm.changelog-0.15.0.xml','2025-04-28 12:13:42',49,'EXECUTED','8:4627a9de93c1c4a2147036f8c9d403a5','createTable tableName=ITEM_TEST_PLAN; createIndex indexName=idx_itertestplan, tableName=ITEM_TEST_PLAN','Cette table associe un cas de test avec une liste d\'execution. Elle conserve également\n		en mémoire le status d\'execution, qui devra sera mis à jour au fur et à mesure qu\'une execution\n		est ajoutée ou exécutée.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.14.0.35','bsiri','tm/tm.changelog-0.15.0.xml','2025-04-28 12:13:42',50,'EXECUTED','8:28a12dbdd4437ee8892579c9c9e22c6e','createTable tableName=ITEM_TEST_PLAN_LIST; createIndex indexName=idx_ITEM_TESTplan_iteration, tableName=ITEM_TEST_PLAN_LIST; createIndex indexName=idx_ITEM_TESTplan_testplan, tableName=ITEM_TEST_PLAN_LIST','Cette table associe une iteration a ses test plans. Cette table d\'association existe pour ajouter un attribut d\'ordre (la liste des test plans est ordonnée). La clé primaire est ici composite, et ne doit pas être autogénérée.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.14.0.36','bsiri','tm/tm.changelog-0.15.0.xml','2025-04-28 12:13:42',51,'EXECUTED','8:d266e227f26cef64aa9d63917b89f4e4','createTable tableName=EXECUTION; createIndex indexName=idx_execution, tableName=EXECUTION','Table des executions. Une execution correspond à un cas de test, et ses pas d\'execution correspondent à des pas de test. Pour assurer un contrôle sur les modifications de l\'entité source une référence est gardée vers le cas de test source.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.14.0.37','bsiri','tm/tm.changelog-0.15.0.xml','2025-04-28 12:13:42',52,'EXECUTED','8:f33084c7ffae3c6ed7a1d3e81b451973','createTable tableName=ITEM_TEST_PLAN_EXECUTION; createIndex indexName=idx_testplan_exec_testplan, tableName=ITEM_TEST_PLAN_EXECUTION; createIndex indexName=idx_testplan_exec_exec, tableName=ITEM_TEST_PLAN_EXECUTION','Associe les executions aux test plans',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.14.0.38','bsiri','tm/tm.changelog-0.15.0.xml','2025-04-28 12:13:42',53,'EXECUTED','8:3938ae5e9a0b4bd3212655e86fb2704d','createTable tableName=EXECUTION_STEP; createIndex indexName=idx_executionstep, tableName=EXECUTION_STEP','Cette table gère les pas d\'execution d\'une execution. Voir la table EXECUTION pour plus de détails.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.14.0.39','bsiri','tm/tm.changelog-0.15.0.xml','2025-04-28 12:13:42',54,'EXECUTED','8:bc70b347adec2a2ffb481e0d1dd7ba0f','createTable tableName=EXECUTION_EXECUTION_STEPS; createIndex indexName=idx_exec_exec_step_exec, tableName=EXECUTION_EXECUTION_STEPS; createIndex indexName=idx_exec_exec_step_exec_step, tableName=EXECUTION_EXECUTION_STEPS','Cette table associe une executions à ses pas d\'execution. Cette table d\'association existe pour ajouter un attribut d\'ordre (la liste des pas executions est ordonnée). La clé primaire est ici composite, et ne doit pas être autogénérée.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.14.0.40','bsiri','tm/tm.changelog-0.15.0.xml','2025-04-28 12:13:42',55,'EXECUTED','8:58262c6d8f1291e2eafb30508a7377cf','createTable tableName=TEST_CASE_REQUIREMENT_LINK; addPrimaryKey constraintName=pk_tc_req_link, tableName=TEST_CASE_REQUIREMENT_LINK; createIndex indexName=idx_tc_req_tc, tableName=TEST_CASE_REQUIREMENT_LINK; createIndex indexName=idx_tc_req_req, t...','Cette table gere les associations entre cas de test et exigences.\n				La cle primaire est composite et ne doit pas etre autogeneree.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.14.0.41','adurand','tm/tm.changelog-0.15.0.xml','2025-04-28 12:13:42',56,'EXECUTED','8:afd6c698b88ab38465f010b2e15b1e6f','createTable tableName=CAMPAIGN_TEST_PLAN; addPrimaryKey constraintName=pk_camp_tp, tableName=CAMPAIGN_TEST_PLAN; createIndex indexName=idx_camp_tp_camp, tableName=CAMPAIGN_TEST_PLAN','Cette table gere les associations entre les campagnes et les cas de test (= les plans de test des campagnes).La cle primaire est composite et ne doit pas etre autogeneree.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.14.0.43','xpr','tm/tm.changelog-0.15.0.xml','2025-04-28 12:13:42',57,'EXECUTED','8:5d49f7b9a14768e1d2a69b901eb72369','sql','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.14.0.44','gfouquet','tm/tm.changelog-0.15.0.xml','2025-04-28 12:13:42',58,'EXECUTED','8:84af8be16b16c30984d3a48cf12ff34c','insert tableName=CORE_GROUP_AUTHORITY; insert tableName=CORE_GROUP; insert tableName=CORE_GROUP_AUTHORITY; insert tableName=CORE_GROUP; insert tableName=CORE_GROUP_AUTHORITY; insert tableName=ACL_CLASS; insert tableName=ACL_GROUP; insert tableName...','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.14.0.45','gfouquet','tm/tm.changelog-0.15.0.xml','2025-04-28 12:13:42',59,'EXECUTED','8:b87f2918468fac72651eccadb2898192','insert tableName=ACL_GROUP; insert tableName=ACL_GROUP_PERMISSION','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.17.0.01','gfouquet','tm/tm.changelog-0.17.0.xml','2025-04-28 12:13:42',60,'EXECUTED','8:3605a3f2fdb2c5f88f12d05f99f657dd','createTable tableName=ACTION_TEST_STEP','This table stores \"action\" tests steps, i.e. steps with an action and expected result, which were formerly stored in TEST_STEP',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.17.0.02','gfouquet','tm/tm.changelog-0.17.0.xml','2025-04-28 12:13:42',61,'EXECUTED','8:5b3ee015db37a18baf9cf10b687b471e','sql','Data migration from TEST_STEP to ACTION_TEST_STEP',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.17.0.03','gfouquet','tm/tm.changelog-0.17.0.xml','2025-04-28 12:13:42',62,'EXECUTED','8:f1d9345092fa7b2269da4794be68a972','dropForeignKeyConstraint baseTableName=TEST_STEP, constraintName=fk_test_step__attachment_list; dropColumn columnName=ACTION, tableName=TEST_STEP; dropColumn columnName=EXPECTED_RESULT, tableName=TEST_STEP; dropColumn columnName=ATTACHMENT_LIST_ID...','Removes useless comlumns from TEST_STEP',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.17.0.04','gfouquet','tm/tm.changelog-0.17.0.xml','2025-04-28 12:13:42',63,'EXECUTED','8:c840200146ebff14aaa673695e2c082c','createTable tableName=CALL_TEST_STEP','This table stores \"call\" tests steps, i.e. steps which call an entire test case',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.19.0.01','ramoussou','tm/tm.changelog-0.19.0.xml','2025-04-28 12:13:42',64,'EXECUTED','8:ad46b14330533a66289110f0391edec8','createTable tableName=CAMPAIGN_TEST_PLAN_ITEM; createIndex indexName=idx_camptestplan, tableName=CAMPAIGN_TEST_PLAN_ITEM','We have to set campaign_ID and Test_plan_order to \"true\" to let hibernate persist new items',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.19.0.02','ramoussou','tm/tm.changelog-0.19.0.xml','2025-04-28 12:13:42',65,'EXECUTED','8:ab232337d4ea59b9517418f86ce936e8','sql','Migrates data from unordered campaign test plan table to ordered test plan table.\n	 		Items which references (soft) deleted test cases and which should not be in the table are not migrated',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.19.0.04','ramoussou','tm/tm.changelog-0.19.0.xml','2025-04-28 12:13:42',66,'EXECUTED','8:8a22997a222ba3d4795b8d3205bb3b3a','sql','Calculate and insert and add Not null constraint on order for Campaign Test Plan for myssql',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.19.0.06','ramoussou','tm/tm.changelog-0.19.0.xml','2025-04-28 12:13:42',67,'EXECUTED','8:1513496bc6e7e42d55289448d23a5ce1','dropTable tableName=CAMPAIGN_TEST_PLAN','Drop table CAMPAIGN_TEST_PLAN',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.19.0.07','ramoussou','tm/tm.changelog-0.19.0.xml','2025-04-28 12:13:43',68,'EXECUTED','8:46ca6a04862330a49c334f13e897abf8','addColumn tableName=ITEM_TEST_PLAN','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.20.0.01','gfouquet','tm/tm.changelog-0.20.0.xml','2025-04-28 12:13:43',69,'EXECUTED','8:54c3ebe91db56778cde9e87d8d4d77db','dropForeignKeyConstraint baseTableName=TEST_CASE_LIBRARY, constraintName=fk_tcl_project; dropColumn columnName=PROJECT_ID, tableName=TEST_CASE_LIBRARY','The PROJECT_ID foreign key in TEST_CASE_LIBRARY is useless, the useful one is in the PROJECT table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.20.0.02','gfouquet','tm/tm.changelog-0.20.0.xml','2025-04-28 12:13:43',70,'EXECUTED','8:f0ef7eed1568f2722690dc4270632b72','dropForeignKeyConstraint baseTableName=REQUIREMENT_LIBRARY, constraintName=fk_rl_project; dropColumn columnName=PROJECT_ID, tableName=REQUIREMENT_LIBRARY','The PROJECT_ID foreign key in REQUIREMENT_LIBRARY is useless, the useful one is in the PROJECT table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.20.0.03','gfouquet','tm/tm.changelog-0.20.0.xml','2025-04-28 12:13:43',71,'EXECUTED','8:7f782a7a9ea306ffaa6cf58433ab21cb','dropForeignKeyConstraint baseTableName=CAMPAIGN_LIBRARY, constraintName=fk_cl_project; dropColumn columnName=PROJECT_ID, tableName=CAMPAIGN_LIBRARY','The PROJECT_ID foreign key in CAMPAIGN_LIBRARY is useless, the useful one is in the PROJECT table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.20.0.05','bsiri','tm/tm.changelog-0.20.0.xml','2025-04-28 12:13:43',72,'EXECUTED','8:0969ff7e63508bf077c77d3161274cc6','dropNotNullConstraint columnName=ISSUE_LIST_ID, tableName=EXECUTION; dropNotNullConstraint columnName=ISSUE_LIST_ID, tableName=EXECUTION_STEP','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.20.0.07','bsiri','tm/tm.changelog-0.20.0.xml','2025-04-28 12:13:43',73,'EXECUTED','8:2a0ba7e062dba6f26d6b3a92d7583ea5','dropForeignKeyConstraint baseTableName=CAMPAIGN_TEST_PLAN_ITEM, constraintName=fk_camp_tp_user; addForeignKeyConstraint baseTableName=CAMPAIGN_TEST_PLAN_ITEM, constraintName=fk_camp_tp_user, referencedTableName=CORE_USER','add an ondelete set null to the fk campaign test plan item  -> core user',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.20.0.40','gfouquet','tm/tm.changelog-0.20.0.xml','2025-04-28 12:13:43',74,'EXECUTED','8:bba76e65c8a5a74eba758644e9772461','addColumn tableName=ATTACHMENT; sql; dropTable tableName=ATTACHMENT_LIST_CONTENT; addForeignKeyConstraint baseTableName=ATTACHMENT, constraintName=fk_attachment_att_list, referencedTableName=ATTACHMENT_LIST; addNotNullConstraint columnName=ATTACHM...','Replace the ATTACHMENT_LIST_CONTENT table by a FK in ATTACHMENT',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.20.0.41','gfouquet','tm/tm.changelog-0.20.0.xml','2025-04-28 12:13:43',75,'EXECUTED','8:725e99af4ddae5c100b82592a8690917','addColumn tableName=ISSUE; sql; dropTable tableName=ISSUE_LIST_CONTENT; addForeignKeyConstraint baseTableName=ISSUE, constraintName=fk_issue_issue_list, referencedTableName=ISSUE_LIST; addNotNullConstraint columnName=ISSUE_LIST_ID, tableName=ISSUE','Replace the ISSUE_LIST_CONTENT table by a FK in ISSUE',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.20.0.42','gfouquet','tm/tm.changelog-0.20.0.xml','2025-04-28 12:13:43',76,'EXECUTED','8:fbfd69634e8ded997ef0474b29ac9013','renameTable newTableName=ITERATION_TEST_PLAN_ITEM, oldTableName=ITEM_TEST_PLAN','Rename ITEM_TEST_PLAN into ITERATION_TEST_PLAN_ITEM',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.23.0.01','bsiri','tm/tm.changelog-0.23.0.xml','2025-04-28 12:13:43',77,'EXECUTED','8:dec41aae12984def474e0c8ba00d0414','sql','remove ProjectManager and TestRunner from the ACL permission table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.23.0.02','bsiri','tm/tm.changelog-0.23.0.xml','2025-04-28 12:13:43',78,'EXECUTED','8:df0ccbd27da3fa11f2252a61948a5150','sql','all users that were ProjectManager or TestRunner on anything are now TestEditor',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-0.23.0.03','bsiri','tm/tm.changelog-0.23.0.xml','2025-04-28 12:13:43',79,'EXECUTED','8:e8510b02716b7df4ca8bc71c30b7f762','sql','remove ProjectManager and TestRunner from the existing acl groups',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.1.0.01','gfouquet','tm/tm.changelog-1.1.0.xml','2025-04-28 12:13:43',80,'EXECUTED','8:79711f5ccac1251f0be10867d4f9b8d9','update tableName=EXECUTION','Corrects status to BLOCKED in EXECUTION table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.1.0.02','gfouquet','tm/tm.changelog-1.1.0.xml','2025-04-28 12:13:43',81,'EXECUTED','8:bb74182fc3b1d8ac8e7e5b5bb3bd1e65','update tableName=EXECUTION_STEP','Corrects status to BLOCKED in EXECUTION_STEP table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.1.0.03','gfouquet','tm/tm.changelog-1.1.0.xml','2025-04-28 12:13:43',82,'EXECUTED','8:2bdda49f84cdd5586893510ee798110d','update tableName=ITERATION_TEST_PLAN_ITEM','Corrects status to BLOCKED in EXECUTION_STEP table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.1.0.04','gfouquet','tm/tm.changelog-1.1.0.xml','2025-04-28 12:13:43',83,'EXECUTED','8:e6a1b1f7191a69c48f641e1e5f859c64','addColumn tableName=TEST_CASE','Adds an importance to test cases',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.1.0.05','gfouquet','tm/tm.changelog-1.1.0.xml','2025-04-28 12:13:43',84,'EXECUTED','8:94a92b8fcfbf7311a600a96350337f6e','addColumn tableName=TEST_CASE','Adds a auto compute importance property to test cases',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.1.0.06','gfouquet','tm/tm.changelog-1.1.0.xml','2025-04-28 12:13:43',85,'EXECUTED','8:bbdcf879786a1e72a9b0c46f67ae75d7','insert tableName=CORE_CONFIG','Adds a TM database version number',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.1.0.07','gfouquet','tm/tm.changelog-1.1.0.xml','2025-04-28 12:13:43',86,'EXECUTED','8:342f29e07b846b0a75c82fa8abc00bc7','createTable tableName=RESOURCE','A tree node organizes resources. These are stored in the RESOURCE table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.1.0.08','gfouquet','tm/tm.changelog-1.1.0.xml','2025-04-28 12:13:43',87,'EXECUTED','8:17221cba8034de0f0634f1626b6f6c9d','createTable tableName=SIMPLE_RESOURCE; addColumn tableName=REQUIREMENT_FOLDER','SIMPLE_RESOURCE stores \"concrete\" resources with a name and a description',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.1.0.09','gfouquet','tm/tm.changelog-1.1.0.xml','2025-04-28 12:13:43',88,'EXECUTED','8:729b3829b5a9762ae664b759726487de','sql; sql; sql','Moves requirement folder data into SIMPLE_RESOURCE table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.1.0.10','gfouquet','tm/tm.changelog-1.1.0.xml','2025-04-28 12:13:43',89,'EXECUTED','8:75b1b57b1635f22bfb9db311487bb714','createTable tableName=REQUIREMENT_VERSION; addUniqueConstraint constraintName=cu_version_of_requirement, tableName=REQUIREMENT_VERSION','Creates REQUIREMENT_VERSION table in which we store the versions of requirements',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.1.0.11','gfouquet','tm/tm.changelog-1.1.0.xml','2025-04-28 12:13:43',90,'EXECUTED','8:09e0e1815b7746adbceb0863d16626b8','sql; sql','Migrates requirement data into REQUIREMENT_VERSION table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.1.0.12','gfouquet','tm/tm.changelog-1.1.0.xml','2025-04-28 12:13:43',91,'EXECUTED','8:4d48b4d8f39e94e6c1e50c4fe6eb1ce5','addColumn tableName=REQUIREMENT; sql','Adds the \'latest version\' relationship between REQUIREMENT and REQUIREMENT_VERSION tables',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.1.0.13','gfouquet','tm/tm.changelog-1.1.0.xml','2025-04-28 12:13:44',92,'EXECUTED','8:9c4699c8a8acaf98c44dd69ef58fef6e','createTable tableName=TEST_CASE_VERIFIED_REQUIREMENT_VERSION; sql; addNotNullConstraint columnName=VERIFIED_REQ_VERSION_ID, tableName=TEST_CASE_VERIFIED_REQUIREMENT_VERSION; addNotNullConstraint columnName=VERIFYING_TEST_CASE_ID, tableName=TEST_CA...','Test Cases now cover Requirements versions. We create a new association table and populate it from TEST_CASE_REQUIREMENT_LINK',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.1.0.14','gfouquet','tm/tm.changelog-1.1.0.xml','2025-04-28 12:13:44',93,'EXECUTED','8:bb06fbe90bd75bbe215e7966b280e55a','dropForeignKeyConstraint baseTableName=TEST_CASE_REQUIREMENT_LINK, constraintName=fk_tc_req_tc; dropForeignKeyConstraint baseTableName=TEST_CASE_REQUIREMENT_LINK, constraintName=fk_tc_req_req; dropTable tableName=TEST_CASE_REQUIREMENT_LINK','Trashes the now useless TEST_CASE_REQUIREMENT_LINK table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.1.0.15','bsiri','tm/tm.changelog-1.1.0.xml','2025-04-28 12:13:44',94,'EXECUTED','8:44d2544f57717e78e4b98d69816653b7','createTable tableName=REQUIREMENT_AUDIT_EVENT','This table is the main table of the event logging system, in other words the history of a business entity. As for Squash TM\n		version 1.1.0 and until further notice, we log here requirement modifications only. It may grows to log other entities in...',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.1.0.16','bsiri','tm/tm.changelog-1.1.0.xml','2025-04-28 12:13:44',95,'EXECUTED','8:6574b3e3b2628237cf94e751854f48c4','createTable tableName=REQUIREMENT_CREATION','It is a child table of REQUIREMENT_AUDIT_EVENT. This table exists for the sole purpose of qualifying a given event in a creation event, as such its content is empty (the sheer presence\n		of an entry in this table is sufficient)',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.1.0.17','bsiri','tm/tm.changelog-1.1.0.xml','2025-04-28 12:13:44',96,'EXECUTED','8:1d1e9e5f9fa68541dc488dc7721a3cbc','createTable tableName=REQUIREMENT_PROPERTY_CHANGE','This is a child table of REQUIREMENT_AUDIT_EVENT. This table will log updates on the target entity. Not every operations will be logged. \n			Note 1 : As for version 1.1.0 and until further notice for the sake of simplicity we log both the former a...',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.1.0.18','bsiri','tm/tm.changelog-1.1.0.xml','2025-04-28 12:13:44',97,'EXECUTED','8:309bef213b6d1d108841560a4246d15e','createTable tableName=REQUIREMENT_LARGE_PROPERTY_CHANGE','This is a child table of REQUIREMENT_AUDIT_EVENT. This table will log updates on the target entity. Not every operations will be logged. \n			Note 1 : As for version 1.1.0 and until further notice for the sake of simplicity we log both the former a...',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.1.0.19','bsiri','tm/tm.changelog-1.1.0.xml','2025-04-28 12:13:44',98,'EXECUTED','8:a1c790a9625973f23e6486620edb3ef5','sql; sql','Will immediately update the tables with the create_events of existing requirements.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.1.0.20','gfouquet','tm/tm.changelog-1.1.0.xml','2025-04-28 12:13:44',99,'EXECUTED','8:88439c6c1d08d203621902dd7c5b4700','dropColumn columnName=REFERENCE, tableName=REQUIREMENT; dropColumn columnName=CRITICALITY, tableName=REQUIREMENT; dropForeignKeyConstraint baseTableName=REQUIREMENT, constraintName=fk_requirement_attachment_list; dropColumn columnName=ATTACHMENT_L...','Remove obsolete columns from REQUIREMENT and REQUIREMENT_LIBRARY_NODE table. \n			Data is now in REQUIREMENT_VERSION and REQUIREMENT_FOLDER tables.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.1.0.21','fogaillard','tm/tm.changelog-1.1.0.xml','2025-04-28 12:13:44',100,'EXECUTED','8:03bf284d5de34979ee98fcac237c5185','addColumn tableName=TEST_CASE','Add Prerequisite collumn to the test_case table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.1.0.22','bsiri','tm/tm.changelog-1.1.0.xml','2025-04-28 12:13:44',101,'EXECUTED','8:75a63f617964c60504d4b4f74538326b','createTable tableName=TEST_SUITE','Add the table TEST_SUITE. A TEST_SUITE is basically a view on a subset of ITERATION_TEST_PLAN_ITEMs.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.1.0.23','bsiri','tm/tm.changelog-1.1.0.xml','2025-04-28 12:13:44',102,'EXECUTED','8:63216caca4ea5bc08a3dd61771acfd15','createTable tableName=ITERATION_TEST_SUITE; createIndex indexName=dx_iteration_test_suite_iteration, tableName=ITERATION_TEST_SUITE; createIndex indexName=dx_iteration_test_suite_suite, tableName=ITERATION_TEST_SUITE','Association table between ITERATION and TEST_SUITE. Like in many other places here, the purpose of this association table is not to model a n-n cardinality between ITERATION and \n			TEST_SUITE, but 1-n. We thus gain performance at the expense of t...',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.1.0.24','bsiri','tm/tm.changelog-1.1.0.xml','2025-04-28 12:13:44',103,'EXECUTED','8:69633e16af59a99ff6f92ca1c17cc960','addColumn tableName=ITERATION_TEST_PLAN_ITEM','Hereby an ITERATION_TEST_PLAN_ITEM shalt reference 0 or 1 TEST_SUITE',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.1.0.25','fogaillard','tm/tm.changelog-1.1.0.xml','2025-04-28 12:13:45',104,'EXECUTED','8:64beff4d7a26329a9dc5fb98a5f5a797','addColumn tableName=EXECUTION','Add Prerequisite collumn to the execution table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.2.0.32','mpagnon','tm/tm.changelog-1.2.0.xml','2025-04-28 12:13:45',105,'EXECUTED','8:ea6c2c957bd92325cba5ee9c85c3f71a','insert tableName=ACL_GROUP; insert tableName=ACL_GROUP_PERMISSION; insert tableName=ACL_GROUP_PERMISSION; insert tableName=ACL_GROUP_PERMISSION; insert tableName=ACL_GROUP_PERMISSION; insert tableName=ACL_GROUP_PERMISSION','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.2.0.34-1','mpagnon','tm/tm.changelog-1.2.0.xml','2025-04-28 12:13:45',106,'EXECUTED','8:df895c0ab60666290d00fcc5d85b4350','insert tableName=ACL_CLASS; insert tableName=ACL_CLASS; insert tableName=ACL_CLASS; insert tableName=ACL_GROUP; insert tableName=ACL_GROUP; insert tableName=ACL_GROUP; insert tableName=ACL_GROUP','add acl-class and acl-groups',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.2.0.34-2','mpagnon','tm/tm.changelog-1.2.0.xml','2025-04-28 12:13:45',107,'EXECUTED','8:0a20e77cd60ff8192cb3f4eab1fd1330','sql','remove existing permissions and redefine them',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.2.0.34-3','mpagnon','tm/tm.changelog-1.2.0.xml','2025-04-28 12:13:45',108,'EXECUTED','8:2c4154d3dedd5a2d5ad03d815625f719','insert tableName=ACL_GROUP_PERMISSION; insert tableName=ACL_GROUP_PERMISSION; insert tableName=ACL_GROUP_PERMISSION; insert tableName=ACL_GROUP_PERMISSION; insert tableName=ACL_GROUP_PERMISSION; insert tableName=ACL_GROUP_PERMISSION; insert tableN...','ProjectManager / Project\nProjectManager / RequirementLibrary\nProjectManager / TestCaseLibrary\nProjectManager / CampaignLibrary',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.2.0.34-4','mpagnon','tm/tm.changelog-1.2.0.xml','2025-04-28 12:13:45',109,'EXECUTED','8:80fc9728f9ecf5729d91d51a55683db5','insert tableName=ACL_GROUP_PERMISSION; insert tableName=ACL_GROUP_PERMISSION; insert tableName=ACL_GROUP_PERMISSION; insert tableName=ACL_GROUP_PERMISSION; insert tableName=ACL_GROUP_PERMISSION; insert tableName=ACL_GROUP_PERMISSION; insert tableN...','TestEditor / Project\nTestEditor / RequirementLibrary\nTestEditor / TestCaseLibrary\nTestEditor / CampaignLibrary',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.2.0.34-5','mpagnon','tm/tm.changelog-1.2.0.xml','2025-04-28 12:13:45',110,'EXECUTED','8:442fecf2d0d1649958c7cf17e0150f14','insert tableName=ACL_GROUP_PERMISSION; insert tableName=ACL_GROUP_PERMISSION; insert tableName=ACL_GROUP_PERMISSION; insert tableName=ACL_GROUP_PERMISSION','ProjectViewer / Project\nProjectViewer / RequirementLibrary\nProjectViewer / TestCaseLibrary\nProjectViewer / CampaignLibrary',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.2.0.34-6','mpagnon','tm/tm.changelog-1.2.0.xml','2025-04-28 12:13:45',111,'EXECUTED','8:e9a6938cb60760fbc4f1a7ae6ebae60c','insert tableName=ACL_GROUP_PERMISSION; insert tableName=ACL_GROUP_PERMISSION; insert tableName=ACL_GROUP_PERMISSION; insert tableName=ACL_GROUP_PERMISSION; insert tableName=ACL_GROUP_PERMISSION','TestRunner / RequirementLibrary\nTestRunner / TestCaseLibrary\nTestRunner / CampaignLibrary',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.2.0.34-7','mpagnon','tm/tm.changelog-1.2.0.xml','2025-04-28 12:13:45',112,'EXECUTED','8:5196f954a29ec7833620d2d2d8001690','insert tableName=ACL_GROUP_PERMISSION; insert tableName=ACL_GROUP_PERMISSION; insert tableName=ACL_GROUP_PERMISSION; insert tableName=ACL_GROUP_PERMISSION; insert tableName=ACL_GROUP_PERMISSION; insert tableName=ACL_GROUP_PERMISSION; insert tableN...','TestDesigner / Project\nTestDesigner / RequirementLibrary\nTestDesigner / TestCaseLibrary\nTestDesigner / CampaignLibrary',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.2.0.34-8','mpagnon','tm/tm.changelog-1.2.0.xml','2025-04-28 12:13:45',113,'EXECUTED','8:0a85c048a69744ab0eff91190e40fe75','insert tableName=ACL_GROUP_PERMISSION; insert tableName=ACL_GROUP_PERMISSION; insert tableName=ACL_GROUP_PERMISSION; insert tableName=ACL_GROUP_PERMISSION; insert tableName=ACL_GROUP_PERMISSION; insert tableName=ACL_GROUP_PERMISSION; insert tableN...','AdvanceTester / Project\nAdvanceTester / RequirementLibrary\nAdvanceTester / TestCaseLibrary\nAdvanceTester / CampaignLibrary',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.2.0.34-9','mpagnon','tm/tm.changelog-1.2.0.xml','2025-04-28 12:13:45',114,'EXECUTED','8:5b83193a8c1b7b387f50935278853e20','insert tableName=ACL_GROUP_PERMISSION; insert tableName=ACL_GROUP_PERMISSION; insert tableName=ACL_GROUP_PERMISSION; insert tableName=ACL_GROUP_PERMISSION; insert tableName=ACL_GROUP_PERMISSION; insert tableName=ACL_GROUP_PERMISSION','Validator / Project\nValidator / RequirementLibrary\nValidator / TestCaseLibrary\nValidator / CampaignLibrary',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.2.0.34-10','mpagnon','tm/tm.changelog-1.2.0.xml','2025-04-28 12:13:45',115,'EXECUTED','8:7166ec234158f10ae406f272eb810666','sql; sql','Existing Data Update: Delete acls for deleted projects in 1.1.1',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.2.0.34-11','mpagnon','tm/tm.changelog-1.2.0.xml','2025-04-28 12:13:45',116,'EXECUTED','8:12fca5f06a2e5c12fad9adde57337512','sql','Existing Data Update for ACL_OBJECT_IDENTITY / REQUIREMENT_LIBRARY',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.2.0.34-12','mpagnon','tm/tm.changelog-1.2.0.xml','2025-04-28 12:13:45',117,'EXECUTED','8:450b3049fc6157e097e52ca7e1b138e7','sql','Existing Data Update for ACL_OBJECT_IDENTITY / TEST_CASE_LIBRARY',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.2.0.34-13','mpagnon','tm/tm.changelog-1.2.0.xml','2025-04-28 12:13:45',118,'EXECUTED','8:4455aaa5dff6c7c21a1247ec49da92cd','sql','Existing Data Update for ACL_OBJECT_IDENTITY / CAMPAIGN_LIBRARY',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.2.0.34-14','mpagnon','tm/tm.changelog-1.2.0.xml','2025-04-28 12:13:45',119,'EXECUTED','8:44f2b72ee88e0aa842f272db57e0d15c','sql','Existing Data Update for ACL_RESPONSIBILITY_SCOPE_ENTRY / REQUIREMENT_LIBRARY',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.2.0.34-15','mpagnon','tm/tm.changelog-1.2.0.xml','2025-04-28 12:13:45',120,'EXECUTED','8:9f26b152572e99793d1ac6816a43c81d','sql','Existing Data Update for ACL_RESPONSIBILITY_SCOPE_ENTRY / TEST_CASE_LIBRARY',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.2.0.34-16','mpagnon','tm/tm.changelog-1.2.0.xml','2025-04-28 12:13:45',121,'EXECUTED','8:0bb69c3d56cfb4e35be396ac5e58c112','sql','Existing Data Update for ACL_RESPONSIBILITY_SCOPE_ENTRY / CAMPAIGN_LIBRARY',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.2.0.35-01','bsiri','tm/tm.changelog-1.2.0.xml','2025-04-28 12:13:45',122,'EXECUTED','8:e747523846c5ed292fb6c7bfb9740da1','addColumn tableName=ISSUE; createIndex indexName=idx_bt_name, tableName=ISSUE','table ISSUE nows holds the bugtracker name where the remote issues are hosted',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.2.0.36-01','mpagnon','tm/tm.changelog-1.2.0.xml','2025-04-28 12:13:45',123,'EXECUTED','8:25ffc75b0ead3aa18d43d3d241262ca9','addColumn tableName=REQUIREMENT_VERSION','table RequirementVersion nows holds a Category attribute',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.2.0.36-02','mpagnon','tm/tm.changelog-1.2.0.xml','2025-04-28 12:13:45',124,'EXECUTED','8:5e1f96983c7cb1a0e83ae376619c3f84','addColumn tableName=TEST_CASE','table Test-Case nows holds a Reference attribute',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.3.0.01','gfouquet','tm/tm.changelog-1.3.0.xml','2025-04-28 12:13:45',125,'EXECUTED','8:d67bb6124a9935b8167b1b4662927757','update tableName=CORE_CONFIG','Adds a TM database version number',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.3.0.2','gfouquet','tm/tm.changelog-1.3.0.xml','2025-04-28 12:13:45',126,'EXECUTED','8:0ec33fb5aa2c59df7bfc6cdc8cddfff0','sql','Add a default group to users who do not have one (should be users from alpha versions)',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.3.0-feat-1112.0','bsiri','tm/tm.changelog-1.3.0.xml','2025-04-28 12:13:45',127,'EXECUTED','8:d41d8cd98f00b204e9800998ecf8427e','empty','The following serie of changeset labelled tm-1.3-feat-1112.x implements the closure table\n			modelization for tree-like data	at\n			http://www.mysqlperformanceblog.com/2011/02/14/moving-subtrees-in-closure-table/,\n			with a focus on the mysql-speci...',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.3.0-feat-1112.01','bsiri','tm/tm.changelog-1.3.0.xml','2025-04-28 12:13:45',128,'EXECUTED','8:b6e7e58a746810a5b5f47ff5b7eba060','createTable tableName=TCLN_RELATIONSHIP_CLOSURE; createIndex indexName=idx_tcln_relationship_clos_desc, tableName=TCLN_RELATIONSHIP_CLOSURE; createIndex indexName=idx_tcln_relationship_clos_anc, tableName=TCLN_RELATIONSHIP_CLOSURE','closure table for test case library nodes. Its content is set and modified by four triggers, see\n			changeset \'tm-1.3-feat-1112.05-mysql\' or \'tm-1.3-feat-1112.05-h2\'.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.3.0-feat-1112.02','bsiri','tm/tm.changelog-1.3.0.xml','2025-04-28 12:13:45',129,'EXECUTED','8:5f2965c6052880bcc7b620a324442bef','createTable tableName=RLN_RELATIONSHIP_CLOSURE; createIndex indexName=idx_rln_relationship_clos_desc, tableName=RLN_RELATIONSHIP_CLOSURE; createIndex indexName=idx_rln_relationship_clos_anc, tableName=RLN_RELATIONSHIP_CLOSURE','closure table for requirement library nodes. Its content is set and modified by four triggers, see\n			changeset \'tm-1.3-feat-1112.06-mysql\' or \'tm-1.3-feat-1112.06-h2\'.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.3.0-feat-1112.03','bsiri','tm/tm.changelog-1.3.0.xml','2025-04-28 12:13:45',130,'EXECUTED','8:c0f7ef97f02b9034218ee874a8e37664','createTable tableName=CLN_RELATIONSHIP_CLOSURE; createIndex indexName=idx_cln_relationship_clos_desc, tableName=CLN_RELATIONSHIP_CLOSURE; createIndex indexName=idx_cln_relationship_clos_anc, tableName=CLN_RELATIONSHIP_CLOSURE','closure table for campaign library nodes. Its content is set and modified by four triggers, see\n			changeset \'tm-1.3-feat-1112.07-mysql\' or \'tm-1.3-feat-1112.07-h2\'.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.3.0-feat-1112.04','bsiri','tm/tm.changelog-1.3.0.xml','2025-04-28 12:13:45',131,'EXECUTED','8:82390dab2ef8d88d92b5633ceaa105e1','createTable tableName=TCLN_RELATIONSHIP_TMP; createTable tableName=RLN_RELATIONSHIP_TMP; createTable tableName=CLN_RELATIONSHIP_TMP; sql; sql; sql; sql; sql; sql','first step of the migration : creation of temporary tables in which we will dump\n			the X_RELATIONSHIP tables, then truncate the later. We will reinsert the data once\n			the triggers are all set.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.3.0-feat-1112.05-mysql','bsiri','tm/tm.changelog-1.3.0.xml','2025-04-28 12:13:45',132,'EXECUTED','8:17123de05225585b1b9cc62306b44334','sql; sql; sql; sql','mysql-triggers for TCLN_RELATIONSHIP_CLOSURE table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.3.0-feat-1112.06-mysql','bsiri','tm/tm.changelog-1.3.0.xml','2025-04-28 12:13:45',133,'EXECUTED','8:5ee5e18c073ca7ac1880dc5f9470ddb8','sql; sql; sql; sql','mysql-triggers for RLN_RELATIONSHIP_CLOSURE table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.3.0-feat-1112.07-mysql','bsiri','tm/tm.changelog-1.3.0.xml','2025-04-28 12:13:45',134,'EXECUTED','8:53d0b3d696f4e77145aa14e4fe55ecc4','sql; sql; sql; sql','mysql-triggers for CLN_RELATIONSHIP_CLOSURE table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.3.0-feat-1112.08','bsiri','tm/tm.changelog-1.3.0.xml','2025-04-28 12:13:45',135,'EXECUTED','8:5f54649ea2e1588ab1b315322a5f4a66','sql; sql; sql','this step is mandatory if we want the next one to work (triggers need the nodes to have self-reference in the closure tables)',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.3.0-feat-1112.09','bsiri','tm/tm.changelog-1.3.0.xml','2025-04-28 12:13:45',136,'EXECUTED','8:1094739e703332e8b458be2316f88e61','sql; sql; sql','we can now reinsert our data from the tmp tables and let the triggers do the job',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.3.0-feat-1112.10','bsiri','tm/tm.changelog-1.3.0.xml','2025-04-28 12:13:45',137,'EXECUTED','8:ac6c51cee3c0dacc8f67971cb3ac85a2','dropTable tableName=TCLN_RELATIONSHIP_TMP; dropTable tableName=RLN_RELATIONSHIP_TMP; dropTable tableName=CLN_RELATIONSHIP_TMP','If success, we can now drop our temp tables and complete the migration',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.3.0-feat-1209.01','mpagnon','tm/tm.changelog-1.3.0.xml','2025-04-28 12:13:45',138,'EXECUTED','8:51f3aec0712253ff164f236ab0673307','createTable tableName=BUGTRACKER','To connect Squash TM to a bugtracker, you must provide the name and the url of the bugtracker. The mantis plugin is shipped with the application\n	 IFRAME_FRIENDLY :tells if the bugtracker page can be accessed through an iframe : if the response he...',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.3.0-feat-1181.01','bsiri','tm/tm.changelog-1.3.0.xml','2025-04-28 12:13:45',139,'EXECUTED','8:59851e575739afe2883bde38b98a826c','createTable tableName=TEST_AUTOMATION_SERVER; createIndex indexName=idx_autotest_server, tableName=TEST_AUTOMATION_SERVER; addUniqueConstraint constraintName=uni_autotest_server, tableName=TEST_AUTOMATION_SERVER','creating table TEST_AUTOMATION_SERVER',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.3.0-feat-1181.02','bsiri','tm/tm.changelog-1.3.0.xml','2025-04-28 12:13:45',140,'EXECUTED','8:ee88a2e8cd8c855b038614fbf673969d','createTable tableName=TEST_AUTOMATION_PROJECT; createIndex indexName=idx_auto_test_project, tableName=TEST_AUTOMATION_PROJECT; addUniqueConstraint constraintName=uni_autotest_project, tableName=TEST_AUTOMATION_PROJECT','creating table TEST_AUTOMATION_PROJECT',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.3.0-feat-1181.03','bsiri','tm/tm.changelog-1.3.0.xml','2025-04-28 12:13:46',141,'EXECUTED','8:964bf60732b6b169049b8c69aef3a44d','addColumn tableName=PROJECT','now a PROJECT may or may not have test automation enabled',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.3.0-feat-1181.04','bsiri','tm/tm.changelog-1.3.0.xml','2025-04-28 12:13:46',142,'EXECUTED','8:f02d1949114f3ad883bebf32826222f1','createTable tableName=TM_TA_PROJECTS; addPrimaryKey constraintName=pk_tm_ta_projects, tableName=TM_TA_PROJECTS','table where TM projects and TA projects are bound to each others',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.3.0-feat-1194.01','mpagnon','tm/tm.changelog-1.3.0.xml','2025-04-28 12:13:46',143,'EXECUTED','8:17c48fe1bc427eb11dcef751a5d425b4','createTable tableName=BUGTRACKER_BINDING','Bugtracker project represent the project\'s name in a configured bugtracker',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.3.0-feat-1194.04','mpagnon','tm/tm.changelog-1.3.0.xml','2025-04-28 12:13:46',144,'EXECUTED','8:86f6d7c670961034792a94bcd19d47fc','sql','Data migration: add all bugtrackers that had an issue',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.3.0-feat-1194.05','mpagnon','tm/tm.changelog-1.3.0.xml','2025-04-28 12:13:46',145,'EXECUTED','8:9988978cd539cad5825d4d38c13025af','addColumn tableName=ISSUE','New foreign key in ISSUE table that points to a BUGTRACKER',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.3.0-feat-1194.06','mpagnon','tm/tm.changelog-1.3.0.xml','2025-04-28 12:13:46',146,'EXECUTED','8:e5e998d9314b8c63dd1b0cf4b277e596','sql','Data migration : update issue\'s bugtracker FK with migrated BTs',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.3.0-feat-1194.07','mpagnon','tm/tm.changelog-1.3.0.xml','2025-04-28 12:13:46',147,'EXECUTED','8:b78973176d167ccbd820a55e90aad2e3','dropColumn columnName=BT_NAME, tableName=ISSUE','Drop of column \"BT_NAME\" on table issue because it is not used anymore => use of FK to table BUGTRACKER instead',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.3.0-feat-1194.08','mpagnon','tm/tm.changelog-1.3.0.xml','2025-04-28 12:13:46',148,'EXECUTED','8:89f404e6ddfe747a5ab83b985af561a7','addNotNullConstraint columnName=BUGTRACKER_ID, tableName=ISSUE','After Data migration : issue\'s bugtracker must not be null',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.3.0-feat-1210.01','bsiri','tm/tm.changelog-1.3.0.xml','2025-04-28 12:13:46',149,'EXECUTED','8:2c1f6c7ed17779b0c35a44d1d6d5e8b3','createTable tableName=AUTOMATED_TEST; addUniqueConstraint constraintName=uni_auto_test, tableName=AUTOMATED_TEST','Creation of the table AUTOMATED_TEST',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.3.0-feat-1210.02','bsiri','tm/tm.changelog-1.3.0.xml','2025-04-28 12:13:46',150,'EXECUTED','8:57c3dcb67b055fe67cb7314528cbe1aa','addColumn tableName=TEST_CASE','a TEST_CASE can now refer to 0 or 1 AUTOMATED_TEST',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.3.0-feat-1210.03','gfouquet','tm/tm.changelog-1.3.0.xml','2025-04-28 12:13:46',151,'EXECUTED','8:b2a3d3a51d970eb38c67a0fb63421388','insert tableName=CORE_GROUP; insert tableName=CORE_GROUP_AUTHORITY','Added a role / group for test automation clients',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.3.0-feat-1211.01','bsiri','tm/tm.changelog-1.3.0.xml','2025-04-28 12:13:46',152,'EXECUTED','8:ecf1e42d21760d8ffc8bc23631fdeb54','createTable tableName=AUTOMATED_SUITE','Creation of the automated suites table. Note that althought its ID is\n			still the primary key, it won\'t be autogenerated : the system will supply it\n			along the rest instead.\n\n			A automated suite groups together a bunch of test automation execu...',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.3.0-feat-1211.02','bsiri','tm/tm.changelog-1.3.0.xml','2025-04-28 12:13:46',153,'EXECUTED','8:8d5db31f6c48476056b0b087e474d41e','createTable tableName=AUTOMATED_EXECUTION_EXTENDER','Table for the automated executions extender. An automated execution is\n			an extension to Executions that handles things related to test automation.\n\n			The correct business model would have been that an automated execution is a specialization of\n...',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.4.0.00','gfouquet','tm/tm.changelog-1.4.0.xml','2025-04-28 12:13:46',154,'EXECUTED','8:47d4503dc22d75c6e4340159a517bdc8','update tableName=CORE_CONFIG','Adds a TM database version number',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.4.0-feat-1109.01','gfouquet','tm/tm.changelog-1.4.0.xml','2025-04-28 12:13:46',155,'EXECUTED','8:5f0d873c1d91b85e3774ab6c07edc713','createTable tableName=CUSTOM_FIELD','Creates a table for Custom Fields',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.4.0-feat-1109.02','gfouquet','tm/tm.changelog-1.4.0.xml','2025-04-28 12:13:46',156,'EXECUTED','8:b26d04016cf7e30c5677b5e270bae690','createTable tableName=CUSTOM_FIELD_OPTION','Creates a table for Custom Fields Options',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.4.0-feat-1390.01','gfouquet','tm/tm.changelog-1.4.0.xml','2025-04-28 12:13:46',157,'EXECUTED','8:1f63580988cd0ac375147c25b71db8ac','createTable tableName=CUSTOM_FIELD_BINDING; addUniqueConstraint constraintName=uc_cf_entity_proj_bnd, tableName=CUSTOM_FIELD_BINDING','Creates a table for Custom Fields Binding',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.4.0-feat-1390.02','gfouquet','tm/tm.changelog-1.4.0.xml','2025-04-28 12:13:46',158,'EXECUTED','8:3dfbb528ef03de65f14eb152014c2bdc','createTable tableName=CUSTOM_FIELD_RENDERING_LOCATION','Creates a table for rendering locations of a bound custom field',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.4.0.feat-1513.01','mpagnon','tm/tm.changelog-1.4.0.xml','2025-04-28 12:13:46',159,'EXECUTED','8:1e5fe54adc3e7b02dbaba826944fd900','addColumn tableName=TEST_CASE_LIBRARY_NODE; addColumn tableName=CAMPAIGN_LIBRARY_NODE; addColumn tableName=RESOURCE; addColumn tableName=PROJECT; addColumn tableName=REQUIREMENT_LIBRARY; addColumn tableName=TEST_CASE_LIBRARY; addColumn tableName=C...','Add property attachment list in library nodes, projects and libraries',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.4.0.feat-1513.02','mpagnon','tm/tm.changelog-1.4.0.xml','2025-04-28 12:13:46',160,'EXECUTED','8:a544746773f1033e47515a544c9b18e3','sql; sql; sql','Migrate existing attachment lists',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.4.0.feat-1513.03','mpagnon','tm/tm.changelog-1.4.0.xml','2025-04-28 12:13:47',161,'EXECUTED','8:a921fd0f39ba6cce8100d1874fe5f202','addColumn tableName=ATTACHMENT_LIST; sql; sql; dropForeignKeyConstraint baseTableName=ATTACHMENT_LIST, constraintName=fk_tcln; dropColumn columnName=TCLN_ID, tableName=ATTACHMENT_LIST','Add attachment lists to test_case_folders',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.4.0.feat-1513.04','mpagnon','tm/tm.changelog-1.4.0.xml','2025-04-28 12:13:47',162,'EXECUTED','8:76838efd394db1c0516055a81a6e4035','addColumn tableName=ATTACHMENT_LIST; sql; sql; dropForeignKeyConstraint baseTableName=ATTACHMENT_LIST, constraintName=fk_cln; dropColumn columnName=CLN_ID, tableName=ATTACHMENT_LIST','Add attachment lists to campaign_folders',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.4.0.feat-1513.05','mpagnon','tm/tm.changelog-1.4.0.xml','2025-04-28 12:13:47',163,'EXECUTED','8:1d57bcfb9f9178e1fe76e1232dda8418','addColumn tableName=ATTACHMENT_LIST; sql; sql; dropForeignKeyConstraint baseTableName=ATTACHMENT_LIST, constraintName=fk_sr; dropColumn columnName=RES_ID, tableName=ATTACHMENT_LIST','Add attachment lists to requirement folders',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.4.0.feat-1513.06','mpagnon','tm/tm.changelog-1.4.0.xml','2025-04-28 12:13:47',164,'EXECUTED','8:17f4c1960e10e28b5e1d8452233cbe10','addColumn tableName=ATTACHMENT_LIST; sql; sql; dropForeignKeyConstraint baseTableName=ATTACHMENT_LIST, constraintName=fk_project; dropColumn columnName=PROJECT_ID, tableName=ATTACHMENT_LIST','Add attachment lists to projects',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.4.0.feat-1513.07','mpagnon','tm/tm.changelog-1.4.0.xml','2025-04-28 12:13:47',165,'EXECUTED','8:741b34777bada69e897109fac527cd34','addColumn tableName=ATTACHMENT_LIST; sql; sql; dropForeignKeyConstraint baseTableName=ATTACHMENT_LIST, constraintName=fk_rLib; dropColumn columnName=RL_ID, tableName=ATTACHMENT_LIST','Add attachment lists to reqLib',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.4.0.feat-1513.08','mpagnon','tm/tm.changelog-1.4.0.xml','2025-04-28 12:13:47',166,'EXECUTED','8:83934b979af1c904fa5c961f67e16d26','addColumn tableName=ATTACHMENT_LIST; sql; sql; dropForeignKeyConstraint baseTableName=ATTACHMENT_LIST, constraintName=fk_tcLib; dropColumn columnName=TCL_ID, tableName=ATTACHMENT_LIST','Add attachment lists to test_case_library',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.4.0.feat-1513.09','mpagnon','tm/tm.changelog-1.4.0.xml','2025-04-28 12:13:47',167,'EXECUTED','8:80471c4ed7a864008f3780723581604c','addColumn tableName=ATTACHMENT_LIST; sql; sql; dropForeignKeyConstraint baseTableName=ATTACHMENT_LIST, constraintName=fk_cLib; dropColumn columnName=CL_ID, tableName=ATTACHMENT_LIST','Add attachment lists to campaign libraries',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.4.0.feat-1513.010','mpagnon','tm/tm.changelog-1.4.0.xml','2025-04-28 12:13:48',168,'EXECUTED','8:910e041f846e1c2f0e9797e7c3e0db09','addNotNullConstraint columnName=ATTACHMENT_LIST_ID, tableName=TEST_CASE_LIBRARY_NODE; addNotNullConstraint columnName=ATTACHMENT_LIST_ID, tableName=CAMPAIGN_LIBRARY_NODE; addNotNullConstraint columnName=ATTACHMENT_LIST_ID, tableName=RESOURCE; addN...','Make attachment_list_ids new fks not nullable',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.4.0.feat-1513.11','mpagnon','tm/tm.changelog-1.4.0.xml','2025-04-28 12:13:48',169,'EXECUTED','8:3cb3532cce4a9ba7a85d2bd935735d13','dropForeignKeyConstraint baseTableName=TEST_CASE, constraintName=fk_test_case_attachment_list; dropForeignKeyConstraint baseTableName=CAMPAIGN, constraintName=fk_campaign_attachment_list; dropForeignKeyConstraint baseTableName=REQUIREMENT_VERSION,...','Drop previous attachment list ids',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.4.0.feat-1392.01','bsiri','tm/tm.changelog-1.4.0.xml','2025-04-28 12:13:48',170,'EXECUTED','8:e419045701cd1d660c290d9cebc96d71','createTable tableName=CUSTOM_FIELD_VALUE','The table CUSTOM_FIELD_VALUE holds instances of a CUSTOM_FIELD that are bound to instances of :\n			test cases, requirement version, campagnes, iterations and test suites. A custom field value is created\n			when a custom field binding is created or...',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.4.0.feat-1553.00','flaurens','tm/tm.changelog-1.4.0.xml','2025-04-28 12:13:48',171,'EXECUTED','8:687080f9bf005ab2a5ee3064e3a9235b','addColumn tableName=TEST_CASE','Adds a nature field to test cases',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.4.0.feat-1554.00','flaurens','tm/tm.changelog-1.4.0.xml','2025-04-28 12:13:48',172,'EXECUTED','8:1c43b37cb04adca934b62633b595ed08','addColumn tableName=TEST_CASE','Adds a type field to test cases',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.4.0.feat-1609.00','flaurens','tm/tm.changelog-1.4.0.xml','2025-04-28 12:13:48',173,'EXECUTED','8:7d3c71ee41d2af7a983ca1855ff775f3','addColumn tableName=TEST_CASE','Adds a status field to test cases',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.4.0.feat-1596.00','flaurens','tm/tm.changelog-1.4.0.xml','2025-04-28 12:13:48',174,'EXECUTED','8:98717315ac63d2f0ec87d045f9a0e7fd','addColumn tableName=EXECUTION','Adds test case related fields to executions for denormalization',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.4.0.feat-1596.01','flaurens','tm/tm.changelog-1.4.0.xml','2025-04-28 12:13:48',175,'EXECUTED','8:0746b8b92b662185b04724e135518a48','sql','adds test case information to executions created prior to the changeset tm-1.4.0.feat-1596.00',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.4.0.feat-1596.01-b','mpagnon','tm/tm.changelog-1.4.0.xml','2025-04-28 12:13:48',176,'EXECUTED','8:f9eb3cff4afa408a01c77ed552491ea7','sql','this grammar is not supported by h2 and is more efficient',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.4.0.feat-1110.01','gfouquet','tm/tm.changelog-1.4.0.xml','2025-04-28 12:13:48',177,'EXECUTED','8:a6f68a8239f86c9e6fdbee0610d4a558','addColumn tableName=PROJECT','Adds a type discriminator column on PROJECT',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.4.0.feat-1393.01','mpagnon','tm/tm.changelog-1.4.0.xml','2025-04-28 12:13:48',178,'EXECUTED','8:d379b785e3df9b3bfe8ddd40e32cc75b','insert tableName=ACL_CLASS','Adds a className for the ProjectTemplate, this is needed so that a project template can hold user\'s permissions',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.4.0.feat-1628.01','flaurens','tm/tm.changelog-1.4.0.xml','2025-04-28 12:13:48',179,'EXECUTED','8:cc41991917196a77889b24836899a3f0','addDefaultValue columnName=REFERENCE, tableName=REQUIREMENT_VERSION; addDefaultValue columnName=REFERENCE, tableName=TEST_CASE; addDefaultValue columnName=REFERENCE, tableName=EXECUTION; modifyDataType columnName=REFERENCE, tableName=REQUIREMENT_V...','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.4.0.feat-1638.01','mpagnon','tm/tm.changelog-1.4.0.xml','2025-04-28 12:13:48',180,'EXECUTED','8:ec3f5d309c82e25742b70c9cb60b2530','addColumn tableName=CUSTOM_FIELD','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.4.0.feat-1638.02','mpagnon','tm/tm.changelog-1.4.0.xml','2025-04-28 12:13:48',181,'EXECUTED','8:32a32aad58ccb2a3d1e4f8353ac51c6f','addColumn tableName=CUSTOM_FIELD_OPTION','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.4.1.00','mpagnon','tm/tm.changelog-1.4.1.xml','2025-04-28 12:13:48',182,'EXECUTED','8:e64714660838abe288858a785b925c7a','update tableName=CORE_CONFIG','Adds a TM database version number',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.4.1.issue-1864-01','mpagnon','tm/tm.changelog-1.4.1.xml','2025-04-28 12:13:48',183,'EXECUTED','8:24a3af879eb0b03292ab5e34fc4e1547','sql','fixed database integrity for execution importance',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.4.1.issue-1864-02','mpagnon','tm/tm.changelog-1.4.1.xml','2025-04-28 12:13:48',184,'EXECUTED','8:0d0369cdf5535f7c8549757e3df6d8c1','sql','fixed database integrity for execution tc_nature',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.4.1.issue-1864-03','mpagnon','tm/tm.changelog-1.4.1.xml','2025-04-28 12:13:48',185,'EXECUTED','8:b56f8d7e673cc2c1967de32a86ae3929','sql','fixed database integrity for execution tc_type',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.4.1.issue-1864-04','mpagnon','tm/tm.changelog-1.4.1.xml','2025-04-28 12:13:48',186,'EXECUTED','8:d9c21801b86b940f5e8370048c6e2ae6','sql','fixed database integrity for execution tc_status',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.5.0.00','mpagnon','tm/tm.changelog-1.5.0.xml','2025-04-28 12:13:48',187,'EXECUTED','8:e21f74e20ec335f77a64538102408c85','update tableName=CORE_CONFIG','Update TM database version number',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.5.0.feat-1596.02','bsiri','tm/tm.changelog-1.5.0.xml','2025-04-28 12:13:48',188,'EXECUTED','8:3ccf3fe5de209e1556bb8d0be7bf2661','dropTable tableName=EXECUTION_TEST_CASE_DATA','dropping the temp table from changest tm-1.4.0.feat-1596.01',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.5.0.00-issue-1838.01','mpagnon','tm/tm.changelog-1.5.0.xml','2025-04-28 12:13:48',189,'EXECUTED','8:a52132e64716ffdf7220ef3a69d67f7a','sql','Update table custom-field-value so that all mandatory cuf have a value',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.5.0.00-feat-1390.03','bsiri','tm/tm.changelog-1.5.0.xml','2025-04-28 12:13:48',190,'EXECUTED','8:f3faf7e95d011321140d9e6385ef2cd6','dropForeignKeyConstraint baseTableName=CUSTOM_FIELD_RENDERING_LOCATION, constraintName=fk_cfb_render_loc_cfb; addForeignKeyConstraint baseTableName=CUSTOM_FIELD_RENDERING_LOCATION, constraintName=fk_cfb_render_loc_cfb, referencedTableName=CUSTOM_F...','adding cascade delete on the rendering locations when custom field bindings are removed (prune the orphans)',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.5.0.00-feat-1850.01','mpagnon','tm/tm.changelog-1.5.0.xml','2025-04-28 12:13:48',191,'EXECUTED','8:db8ccd6b71ac152fd69424e36c783041','createTable tableName=DENORMALIZED_FIELD_VALUE; addForeignKeyConstraint baseTableName=DENORMALIZED_FIELD_VALUE, constraintName=fk_dfv_cfv_binding, referencedTableName=CUSTOM_FIELD_VALUE','The table DENORMALIZED_FIELD_VALUE holds instances of a FIELD that are bound to instances of :\n			executions, execution-steps	when they are created from test-cases or test-case-steps holding CUSTOM_FIELDS.\n			A \"denormalized field value\" is destro...',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.5.0.00-feat-1850.02','mpagnon','tm/tm.changelog-1.5.0.xml','2025-04-28 12:13:48',192,'EXECUTED','8:c90694cb598e087cd8be205d61f88578','createTable tableName=DENORMALIZED_FIELD_RENDERING_LOCATION; addForeignKeyConstraint baseTableName=DENORMALIZED_FIELD_RENDERING_LOCATION, constraintName=fk_dfb_render_loc_dfb, referencedTableName=DENORMALIZED_FIELD_VALUE','Create table for denormalized field rendering location',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.5.0-feat-821','gfouquet','tm/tm.changelog-1.5.0.xml','2025-04-28 12:13:48',193,'EXECUTED','8:9b0a858bca6a4a9bf0a86c6d6a18b0b1','update tableName=ACL_CLASS; update tableName=ACL_CLASS; update tableName=ACL_CLASS; update tableName=ACL_CLASS; update tableName=ACL_CLASS','Change class names in ACL system',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.5.0.00-feat-1864.01','mpagnon','tm/tm.changelog-1.5.0.xml','2025-04-28 12:13:48',194,'EXECUTED','8:6ac26b6e93872549457b02672218bdd5','createTable tableName=CORE_PARTY; createTable tableName=CORE_TEAM','Create tables CORE_PARTY, CORE_TEAM',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.5.0.00-feat-1864.02','mpagnon','tm/tm.changelog-1.5.0.xml','2025-04-28 12:13:48',195,'EXECUTED','8:ccee6a16065b0bd3a8b2e9d446979e1d','dropForeignKeyConstraint baseTableName=CAMPAIGN_TEST_PLAN_ITEM, constraintName=fk_camp_tp_user; dropForeignKeyConstraint baseTableName=ITERATION_TEST_PLAN_ITEM, constraintName=fk_itertestplan_user; dropForeignKeyConstraint baseTableName=ACL_RESPON...','change name of USER_ID into PARTY_ID in CORE_USER, ACL_RESPONSIBILITY_SCOPE_ENTRY and CORE_GROUP_MEMBER. We need to drop FKs on user first.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.5.0.00-feat-1864.04','mpagnon','tm/tm.changelog-1.5.0.xml','2025-04-28 12:13:48',196,'EXECUTED','8:a1007915d3c3e3d68a49d416b23c9c48','sql','Create a PARTY for each CORE_USER',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.5.0.00-feat-1864.05','mpagnon','tm/tm.changelog-1.5.0.xml','2025-04-28 12:13:49',197,'EXECUTED','8:114d2114c5421dc19d25d68de87e989c','addForeignKeyConstraint baseTableName=ACL_RESPONSIBILITY_SCOPE_ENTRY, constraintName=fk_arse_party, referencedTableName=CORE_PARTY; addForeignKeyConstraint baseTableName=CORE_GROUP_MEMBER, constraintName=fk_group_member_party, referencedTableName=...','Replace reference on user with reference on party',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.5.0.00-feat-1864.06','mpagnon','tm/tm.changelog-1.5.0.xml','2025-04-28 12:13:49',198,'EXECUTED','8:007750c2047ec9e3736fc4d66421407a','dropPrimaryKey tableName=CORE_USER; addPrimaryKey constraintName=pk_core_user, tableName=CORE_USER; addForeignKeyConstraint baseTableName=CORE_USER, constraintName=fk_core_user_party, referencedTableName=CORE_PARTY; addForeignKeyConstraint baseTab...','Remove autoIncrement on core_user pk and add fk on Party table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.5.0.00-feat-1864.03','mpagnon','tm/tm.changelog-1.5.0.xml','2025-04-28 12:13:49',199,'EXECUTED','8:19e2f95851cfb6a5c61f8f12bd333114','createTable tableName=CORE_TEAM_MEMBER; createIndex indexName=DX_TEAM_MEMBER, tableName=CORE_TEAM_MEMBER','create table team member',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.5.0.00-feat-1984.01','flaurens','tm/tm.changelog-1.5.0.xml','2025-04-28 12:13:49',200,'EXECUTED','8:93c290514f581af3cd51df75bb065da9','createTable tableName=TEST_SUITE_TEST_PLAN_ITEM','create table item_test_plan_test_suite',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.5.0.00-feat-1984.02','flaurens','tm/tm.changelog-1.5.0.xml','2025-04-28 12:13:49',201,'EXECUTED','8:3ffa83eebe5e3b17e2f783e06c1bc8fe','sql; dropForeignKeyConstraint baseTableName=ITERATION_TEST_PLAN_ITEM, constraintName=fk_itpi_testsuite; dropColumn columnName=TEST_SUITE, tableName=ITERATION_TEST_PLAN_ITEM','migrate data to table test_suite_test_plan_item',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.5.0.00-feat-1902.01','bsiri','tm/tm.changelog-1.5.0.xml','2025-04-28 12:13:49',202,'EXECUTED','8:cc49ba7569341dba54c4287e4b6ef1ca','createTable tableName=TEST_CASE_LIBRARY_PLUGINS; createTable tableName=REQUIREMENT_LIBRARY_PLUGINS; createTable tableName=CAMPAIGN_LIBRARY_PLUGINS','creating the tables and references for the workspace plugins',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.5.0.00-feat-1984.03','flaurens','tm/tm.changelog-1.5.0.xml','2025-04-28 12:13:49',203,'EXECUTED','8:12bf0cc7b35d36d35ec5a8def84bb07c','addColumn tableName=TEST_SUITE_TEST_PLAN_ITEM','add column for ordering to table TEST_SUITE_TEST_PLAN_ITEM',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.5.0.00-feat-2003.01','mpagnon','tm/tm.changelog-1.5.0.xml','2025-04-28 12:13:49',204,'EXECUTED','8:f6880055add614f749f7cc30aa109492','dropForeignKeyConstraint baseTableName=TEST_CASE_VERIFIED_REQUIREMENT_VERSION, constraintName=fk_verified_req_version; dropForeignKeyConstraint baseTableName=TEST_CASE_VERIFIED_REQUIREMENT_VERSION, constraintName=fk_verifying_test_case; dropUnique...','Action Steps now cover Requirements versions. We need to create a new table that will be an enhancement of the TEST_CASE_VERIFIED_REQUIREMENT_VERSION one.\nWe drop the constraint of the old TEST_CASE_VERIFIED_REQUIREMENT_VERSION so that we can crea...',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.5.0.00-feat-2003.02','mpagnon','tm/tm.changelog-1.5.0.xml','2025-04-28 12:13:49',205,'EXECUTED','8:c11e14595441a13056edc8f8c4eff9da','sql','We migrate datas from TEST_CASE_VERIFIED_REQUIREMENT_VERSION to REQUIREMENT_VERSION_COVERAGE.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.5.0.00-feat-2003.03','mpagnon','tm/tm.changelog-1.5.0.xml','2025-04-28 12:13:49',206,'EXECUTED','8:ead4924b2d9a1ad541aa904ff47be503','dropTable tableName=TEST_CASE_VERIFIED_REQUIREMENT_VERSION','We drop the old TEST_CASE_VERIFIED_REQUIREMENT_VERSION table.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.5.0.00-feat-2003.04','mpagnon','tm/tm.changelog-1.5.0.xml','2025-04-28 12:13:49',207,'EXECUTED','8:d394f967b4143695a514bef61a8e648c','createTable tableName=VERIFYING_STEPS','Let\'s add a table VERIFYING_STEPS to hold the steps that are concerned by the requirement coverage',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.5.0.00-feat-1966.01','bsiri','tm/tm.changelog-1.5.0.xml','2025-04-28 12:13:50',208,'EXECUTED','8:767ece40938d9f4eb9d7fa938bdc580a','sql','fixing mysql text data type for Squash schema version 1.4.x and before (see issue 1966). Dev note : it would have been best to use\n		the tag <modifyColumn> instead of raw sql, because the xml could have been efficiently parsed by the dbdoc generat...',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.5.0.00-issue-2061.01','mpagnon','tm/tm.changelog-1.5.0.xml','2025-04-28 12:13:50',209,'EXECUTED','8:23803de2900584e5ecb5fe684ab76954','sql','Because imported test-cases did not have custom-field-values we need to fix the database.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.5.0.00-issue-2146.01','mpagnon','tm/tm.changelog-1.5.0.xml','2025-04-28 12:13:50',210,'EXECUTED','8:480994cb73b1f307f015655b5f5a1f13','sql; addNotNullConstraint columnName=PROPERTY_NAME, tableName=REQUIREMENT_PROPERTY_CHANGE; sql; addNotNullConstraint columnName=PROPERTY_NAME, tableName=REQUIREMENT_LARGE_PROPERTY_CHANGE; sql; addNotNullConstraint columnName=REFERENCE, tableName=E...','This issue is due to null values in database when @NotNull constraint is present in the bean.\n		This changeSet we will make all java @NotNull be present in database\n--------------------REQUIREMENT_PROPERTY_CHANGE----------------------------\n------...',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.5.1','mpagnon','tm/tm.changelog-1.5.1.xml','2025-04-28 12:13:50',211,'EXECUTED','8:d667debef895d572025fd75862960353','update tableName=CORE_CONFIG','Update TM database version number',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.5.0.issue-2261-01','mpagnon,bsiri','tm/tm.changelog-1.5.1.xml','2025-04-28 12:13:50',212,'EXECUTED','8:5cdd869204dac97550e46b24fc71985d','sql','This issue is due to null values in test_suite_test_plan_item.test_plan_order after migration to 1.5.0\nFirst we create help table that will help us match the iteration test plan orders with the test-suite\'s test plan items.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.6.0','mpagnon','tm/tm.changelog-1.6.0.xml','2025-04-28 12:13:50',213,'EXECUTED','8:84970f7425d89df00712293dba61866a','update tableName=CORE_CONFIG','Update TM database version number',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.6.0.issue-2334-01','flaurens','tm/tm.changelog-1.6.0.xml','2025-04-28 12:13:50',214,'EXECUTED','8:694074944d1b6e20e367f03d838e7f77','createTable tableName=CORE_TEAM_TEMP; sql; dropColumn columnName=DESCRIPTION, tableName=CORE_TEAM; addColumn tableName=CORE_TEAM; sql; dropTable tableName=CORE_TEAM_TEMP','Change type of column description in table core_team',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.6.0.feat-1101-01','mpagnon','tm/tm.changelog-1.6.0.xml','2025-04-28 12:13:50',215,'EXECUTED','8:7e472cea2bfbeb95236406d8d5ca915f','createTable tableName=PARAMETER; addUniqueConstraint tableName=PARAMETER','Add table to handle test cases PARAMETERS',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.6.0.feat-1101-02','mpagnon','tm/tm.changelog-1.6.0.xml','2025-04-28 12:13:50',216,'EXECUTED','8:2467d49174e0943b8d5906d10c36acb3','createTable tableName=DATASET; addUniqueConstraint tableName=DATASET; createTable tableName=DATASET_PARAM_VALUE; addUniqueConstraint tableName=DATASET_PARAM_VALUE','Add tables to handle test cases DATASETS',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.6.0.feat-1128-01','mpagnon','tm/tm.changelog-1.6.0.xml','2025-04-28 12:13:50',217,'EXECUTED','8:073426e993c97f1e37629c0d6f6c2ef9','addColumn tableName=ITERATION_TEST_PLAN_ITEM','Add column to bind a test plan item to a DATASET',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.6.0.issue-2203-01','flaurens','tm/tm.changelog-1.6.0.xml','2025-04-28 12:13:50',218,'EXECUTED','8:58fb190c17063540b58234793162b412','sql','remove inactive users from all teams',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.6.0.issue-2203-02','flaurens','tm/tm.changelog-1.6.0.xml','2025-04-28 12:13:50',219,'EXECUTED','8:794203f439413516472851390612f223','sql','remove core rights of inactive users',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.6.0.issue-2203-03','flaurens','tm/tm.changelog-1.6.0.xml','2025-04-28 12:13:50',220,'EXECUTED','8:702109314d54d654f8702d9294c0a1ee','sql','remove acl rights of inactive users',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.6.0.issue-2454-01','bsiri','tm/tm.changelog-1.6.0.xml','2025-04-28 12:13:50',221,'EXECUTED','8:79608767aec1d03030279efb78f23813','sql','cleaning test suite test plan ordering : some collections have non-contiguous elements. This\n		is due to issue #2454, because of shortcomings in the code in charge of deleting test cases and dependent\n		entities.\n			It looks pretty much like tm-1....',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.6.0.issue-2474-01','bsiri','tm/tm.changelog-1.6.0.xml','2025-04-28 12:13:50',222,'EXECUTED','8:09ab8b482d1a03ac958f883056b52a8c','sql','fixes the action test steps having no custom fields when copied from one project to another. Works for both mysql and h2.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.6.0.issue-2485-01','flaurens','tm/tm.changelog-1.6.0.xml','2025-04-28 12:13:50',223,'EXECUTED','8:2e2b194d7eb3af45f3c9d92a3eb26c8e','dropForeignKeyConstraint baseTableName=DENORMALIZED_FIELD_VALUE, constraintName=fk_dfv_cfv_binding; addForeignKeyConstraint baseTableName=DENORMALIZED_FIELD_VALUE, constraintName=fk_dfv_cfv_binding, referencedTableName=CUSTOM_FIELD_VALUE','replaces fk-constraint which wrongly cascades the deletion of denormalized field values',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.6.0.issue-2536-01','flaurens','tm/tm.changelog-1.6.0.xml','2025-04-28 12:13:50',224,'EXECUTED','8:85bbad401d41bee173273597b6d6809b','insert tableName=ACL_GROUP_PERMISSION','giving testrunners reading rights on projects',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.7.0','bsiri','tm/tm.changelog-1.7.0.xml','2025-04-28 12:13:50',225,'EXECUTED','8:2bc98fe63621679dd7cc8436de5b62d8','update tableName=CORE_CONFIG','Update TM database version number',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.7.0.feat-1107-01','bsiri','tm/tm.changelog-1.7.0.xml','2025-04-28 12:13:51',226,'EXECUTED','8:38f2b9ae47fb1c6f007b81044945d8fc','dropForeignKeyConstraint baseTableName=RLN_RELATIONSHIP, constraintName=fk_rln_relationship_ancestor; dropForeignKeyConstraint baseTableName=RLN_RELATIONSHIP, constraintName=fk_rln_relationship_descendant; addForeignKeyConstraint baseTableName=RLN...','Modifying RLN_RELATIONSHIP and RLN_RELATIONSHIP_CLOSURE : requirements can now accept more requirements \n		(but no folders). Cautious : there is no way to express that a a requirement can only accept requirements as children.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.7.0.feat-1090-01','flaurens','tm/tm.changelog-1.7.0.xml','2025-04-28 12:13:51',227,'EXECUTED','8:5b695760ae999387bf5ec72c3bf62a5c','insert tableName=CORE_CONFIG','adding entries for indexing dates in table core_config',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.7.0.feat-1090-02','flaurens','tm/tm.changelog-1.7.0.xml','2025-04-28 12:13:51',228,'EXECUTED','8:d4e5119ff3110db39b779b3c0666adbf','insert tableName=CORE_CONFIG','adding entries for indexing dates in table core_config',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.7.0.feat-1090-03','flaurens','tm/tm.changelog-1.7.0.xml','2025-04-28 12:13:51',229,'EXECUTED','8:05ed2acfebdcc619c59b89495a1a796d','insert tableName=CORE_CONFIG','adding entries for indexing dates in table core_config',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.7.0.feat-1090-04','flaurens','tm/tm.changelog-1.7.0.xml','2025-04-28 12:13:51',230,'EXECUTED','8:f7c58d0ed017d1deab7db7332cc80bc3','insert tableName=CORE_CONFIG','adding entries for indexing versions in table core_config',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.7.0.feat-1090-05','flaurens','tm/tm.changelog-1.7.0.xml','2025-04-28 12:13:51',231,'EXECUTED','8:7088947921b455d7ae7f4bba555f77c3','insert tableName=CORE_CONFIG','adding entries for indexing versions in table core_config',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.7.0.feat-1090-06','flaurens','tm/tm.changelog-1.7.0.xml','2025-04-28 12:13:51',232,'EXECUTED','8:69f283ea9cfaf80cfac57360dd3b2fd3','insert tableName=CORE_CONFIG','adding entries for indexing versions in table core_config',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.7.0.feat-2648','mpagnon','tm/tm.changelog-1.7.0.xml','2025-04-28 12:13:51',233,'EXECUTED','8:9e14362311c84e802e1b7dd0a76a96fd','insert tableName=ACL_GROUP_PERMISSION; insert tableName=ACL_GROUP_PERMISSION; insert tableName=ACL_GROUP_PERMISSION; delete tableName=ACL_GROUP_PERMISSION; delete tableName=ACL_GROUP_PERMISSION; delete tableName=ACL_GROUP_PERMISSION; delete tableN...','add permission EXTENDED_DELETE to Project Manager on Campaign library\nadd permission EXPORT to Test Runner on Requirement library\nadd permission EXPORT to Test Runner on Test-case library\nremove permission WRITE to Advance tester on Campaign libra...',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.7.1','mpagnon','tm/tm.changelog-1.7.1.xml','2025-04-28 12:13:51',234,'EXECUTED','8:9fb57c775efdc1df8328e60e9451dbfe','update tableName=CORE_CONFIG','Update TM database version number',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.7.1.issue-2873-01','mpagnon','tm/tm.changelog-1.7.1.xml','2025-04-28 12:13:51',235,'EXECUTED','8:7272f8f2270ba64bde072ffb28e34500','createTable tableName=ENTITIES_TO_DELETE','Delete ghost executions\ncreate table to store the id of entities to delete',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.7.1.issue-2873-02','mpagnon','tm/tm.changelog-1.7.1.xml','2025-04-28 12:13:51',236,'EXECUTED','8:c15f92dd81b0c9c31614090a8c56978c','sql','Store the ids of the ghost executions',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.7.1.issue-2873-03','mpagnon','tm/tm.changelog-1.7.1.xml','2025-04-28 12:13:51',237,'EXECUTED','8:5ef52276cc018068dc1991cfd87d619a','sql','Store the ids of the execution steps',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.7.1.issue-2873-04','mpagnon','tm/tm.changelog-1.7.1.xml','2025-04-28 12:13:51',238,'EXECUTED','8:71001eefb8d42caf4254974e320560f9','sql; sql','Store the ids of the issue lists to delete',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.7.1.issue-2873-05','mpagnon','tm/tm.changelog-1.7.1.xml','2025-04-28 12:13:51',239,'EXECUTED','8:d863755915078c39df6ba89e904decb3','sql; sql','Store the ids of the issue lists to delete',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.7.1.issue-2873-06','mpagnon','tm/tm.changelog-1.7.1.xml','2025-04-28 12:13:51',240,'EXECUTED','8:2a83700005cdc28dea66c8c684614489','delete tableName=ISSUE','DELETE Issues of execution and execution steps to delete',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.7.1.issue-2873-07','mpagnon','tm/tm.changelog-1.7.1.xml','2025-04-28 12:13:51',241,'EXECUTED','8:ff7b8bc5a12da202bc90530ec6cb4fdd','delete tableName=AUTOMATED_EXECUTION_EXTENDER','DELETE Automated execution extender of executions to delete',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.7.1.issue-2873-08','mpagnon','tm/tm.changelog-1.7.1.xml','2025-04-28 12:13:51',242,'EXECUTED','8:f4bdb1e5374512923e80ab8d71eb4373','delete tableName=AUTOMATED_SUITE','DELETE automated suites that are not linked to any automated execution extender',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.7.1.issue-2873-09','mpagnon','tm/tm.changelog-1.7.1.xml','2025-04-28 12:13:51',243,'EXECUTED','8:c5721418be2eb4249876cbce4e4c88eb','delete tableName=EXECUTION_EXECUTION_STEPS; delete tableName=EXECUTION_STEP','Delete execution steps of ghost executions',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.7.1.issue-2873-10','mpagnon','tm/tm.changelog-1.7.1.xml','2025-04-28 12:13:51',244,'EXECUTED','8:1156cb430ad5b69595e8d19502495cde','delete tableName=EXECUTION','Delete ghost executions',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.7.1.issue-2873-11','mpagnon','tm/tm.changelog-1.7.1.xml','2025-04-28 12:13:51',245,'EXECUTED','8:c0efea33fdf229f3f19da5016117e61f','delete tableName=ATTACHMENT; delete tableName=ATTACHMENT_CONTENT; delete tableName=ATTACHMENT_LIST','DELETE Attachments of execution and execution steps to delete',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.7.1.issue-2873-12','mpagnon','tm/tm.changelog-1.7.1.xml','2025-04-28 12:13:51',246,'EXECUTED','8:469b75e66f5a61c58781b5d1580b8b49','delete tableName=ISSUE_LIST','DELETE issue lists of executions and execution-steps to delete',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.7.1.issue-2873-13','mpagnon','tm/tm.changelog-1.7.1.xml','2025-04-28 12:13:51',247,'EXECUTED','8:dc231f69059c5088b3d1a2c631639652','dropTable tableName=ENTITIES_TO_DELETE','Drop table used to store the ids of the entities to delete',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.8.0','mpagnon','tm/tm.changelog-1.8.0.xml','2025-04-28 12:13:51',248,'EXECUTED','8:8b6b499d7389ff8110221970eb80c9a7','update tableName=CORE_CONFIG','Update TM database version number',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.8.0.feat-2688','mpagnon','tm/tm.changelog-1.8.0.xml','2025-04-28 12:13:51',249,'EXECUTED','8:56601fe862e0e0ba8c8a4815ab83b5f7','sql','add permission READ_UNASSIGNED on Campaign library for all users but TestRunners',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.8.0.issue-1846-02','mpagnon','tm/tm.changelog-1.8.0.xml','2025-04-28 12:13:51',250,'EXECUTED','8:6673cb98a415026d6fef23212ce1eeb2','dropColumn columnName=DELETED_ON, tableName=CAMPAIGN_LIBRARY_NODE; dropColumn columnName=DELETED_ON, tableName=TEST_CASE_LIBRARY_NODE; dropColumn columnName=DELETED_ON, tableName=REQUIREMENT_LIBRARY_NODE; dropColumn columnName=DELETED_ON, tableNam...','Remove the DELETED_ON columns',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.8.0.issue-3009-01','bsiri','tm/tm.changelog-1.8.0.xml','2025-04-28 12:13:51',251,'EXECUTED','8:a0cfe094f7eb99ad49cd260803846c5e','sql','As of 1.8.0 anyone that executes a test becomes de facto its assignee. This changeset will update the iteration\n			test plan items and assign it to the last executor (if any) if it hasn\'t an assignee already',NULL,'4.19.0',NULL,'legacy','5842419196'),('core-1.8.0-feat-2699-00','bsiri','tm/tm.changelog-1.8.0.xml','2025-04-28 12:13:51',252,'EXECUTED','8:bf8b1e3ef0b1c9b26541538750aeb153','sql','actually remove user accounts that were deactivated',NULL,'4.19.0',NULL,'legacy','5842419196'),('core-1.8.0-feat-2699-01','bsiri','tm/tm.changelog-1.8.0.xml','2025-04-28 12:13:51',253,'EXECUTED','8:164df9ae9d3f977b88d2ab101b6ccb1f','update tableName=CORE_GROUP','the CORE_GROUP squashtest.tm.group.User is now renamed to the normalized squashtest.authz.group.tm.User',NULL,'4.19.0',NULL,'legacy','5842419196'),('core-1.8.0-feat-2699-02','bsiri','tm/tm.changelog-1.8.0.xml','2025-04-28 12:13:51',254,'EXECUTED','8:bca2911749887a9a1b375d20a595dc83','update tableName=CORE_GROUP_MEMBER; delete tableName=CORE_GROUP_AUTHORITY; delete tableName=CORE_GROUP','the CORE_GROUP squashtest.authz.tm.group.ProjectManager is deleted and the users belonging to that group are now\n		demoted to squashtest.authz.group.tm.User',NULL,'4.19.0',NULL,'legacy','5842419196'),('core-1.8.0-feat-2699-03','bsiri','tm/tm.changelog-1.8.0.xml','2025-04-28 12:13:51',255,'EXECUTED','8:be47ff6ce0b7158c0ca139853ce283fd','createTable tableName=CORE_PARTY_AUTHORITY','The table CORE_PARY_AUTHORITY stores personal authorities. As for TM 1.8.0 the users and teams now have blanket permissions\n			(aka authorities) for themselves, not only via core_group membership. However, a user will still belong to one of the CO...',NULL,'4.19.0',NULL,'legacy','5842419196'),('core-1.8.0-feat-2699-04','bsiri','tm/tm.changelog-1.8.0.xml','2025-04-28 12:13:51',256,'EXECUTED','8:02d8d2b9728de4c3bbc5b692bff3ef6d','sql','we have now to set the role ROLE_TM_PROJECT_MANAGER to the corresponding users',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.8.0.issue-2899-1','bsiri','tm/tm.changelog-1.8.0.xml','2025-04-28 12:13:51',257,'EXECUTED','8:a545daa4cad19216cee6121b1e4f5db8','sql','Clean up the database from dead entities that slipped through the deletion routines (mysql, postgresql)',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.8.2','flaurens','tm/tm.changelog-1.8.2.xml','2025-04-28 12:13:51',258,'EXECUTED','8:59a000b04124198fe97e3146a18c7a39','update tableName=CORE_CONFIG','Update TM database version number',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.8.2.feature-3120-01','flaurens','tm/tm.changelog-1.8.2.xml','2025-04-28 12:13:51',259,'EXECUTED','8:954fdde75f17f05fb0b2b93c03fda108','createTable tableName=DENORMALIZED_FIELD_OPTION','Adding denormalized field option table for editable denormalized list valued cufs',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.8.2.feature-3120-02','flaurens','tm/tm.changelog-1.8.2.xml','2025-04-28 12:13:51',260,'EXECUTED','8:02169d341d58170c037f44ad29505421','update tableName=DENORMALIZED_FIELD_VALUE','Old list valued cufs are editable as simple text cufs',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.8.2.feature-3120-03','flaurens','tm/tm.changelog-1.8.2.xml','2025-04-28 12:13:51',261,'EXECUTED','8:2b9cc750f49093e0a2ff6b166276b400','addColumn tableName=DENORMALIZED_FIELD_VALUE','Adding a field type column to denormalized field value table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.8.2-feat-3127-01','bsiri','tm/tm.changelog-1.8.2.xml','2025-04-28 12:13:51',262,'EXECUTED','8:8baba4afe1f2d7ec386e93a862f5c76a','createTable tableName=LIBRARY_PLUGIN_BINDING; addUniqueConstraint constraintName=uniq_plugin_binding, tableName=LIBRARY_PLUGIN_BINDING','As of now X_LIBRARY_PLUGINS are merged in the single table LIBRARY_PLUGIN_BINDING',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.8.2-feat-3127-02','bsiri','tm/tm.changelog-1.8.2.xml','2025-04-28 12:13:51',263,'EXECUTED','8:d94b6b9ae66e4f1c3059141d80c3f56d','createTable tableName=LIBRARY_PLUGIN_BINDING_PROPERTY','create the table LIBRARY_PLUGIN_PROPERTY',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.8.2-feat-3127-03','bsiri','tm/tm.changelog-1.8.2.xml','2025-04-28 12:13:51',264,'EXECUTED','8:16874602945dba14e36c5a38ea0f6d57','dropTable tableName=TEST_CASE_LIBRARY_PLUGINS; dropTable tableName=REQUIREMENT_LIBRARY_PLUGINS; dropTable tableName=CAMPAIGN_LIBRARY_PLUGINS','drop the old tables',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.9.0','flaurens','tm/tm.changelog-1.9.0.xml','2025-04-28 12:13:51',265,'EXECUTED','8:322d58b4cb09062ece234d4788512f7c','update tableName=CORE_CONFIG','Update TM database version number',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.9.0.feature-3138-1','flaurens','tm/tm.changelog-1.9.0.xml','2025-04-28 12:13:51',266,'EXECUTED','8:367fbd54470e1f23e19a32a235663f8c','addColumn tableName=CLN_RELATIONSHIP; addColumn tableName=RLN_RELATIONSHIP; addColumn tableName=TCLN_RELATIONSHIP; addColumn tableName=REQUIREMENT_LIBRARY_CONTENT; addColumn tableName=TEST_CASE_LIBRARY_CONTENT; addColumn tableName=CAMPAIGN_LIBRARY...','Adding columns to order descendants in node relationship tables',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.9.0.feature-3138-2','flaurens','tm/tm.changelog-1.9.0.xml','2025-04-28 12:13:51',267,'EXECUTED','8:d08125b31e4e2b61a3d4299136c95cfb','sql','Creating default order which is identical with the alphabetical order',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.9.0.feature-3138-4','flaurens','tm/tm.changelog-1.9.0.xml','2025-04-28 12:13:51',268,'EXECUTED','8:53a891c33e5e7ed3f88c420186dff341','sql','Creating default order which is identical with the alphabetical order',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.9.0.feature-3138-6','flaurens','tm/tm.changelog-1.9.0.xml','2025-04-28 12:13:51',269,'EXECUTED','8:d60812dc550399c79cc003382144cfcf','sql','Creating default order which is identical with the alphabetical order',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.9.0.feature-3138-8','flaurens','tm/tm.changelog-1.9.0.xml','2025-04-28 12:13:51',270,'EXECUTED','8:508181d596694554bf432e21fbcbec5d','dropNotNullConstraint columnName=VERIFIED_REQ_VERSION_ID, tableName=REQUIREMENT_VERSION_COVERAGE','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.9.0.feature-3211-1','flaurens','tm/tm.changelog-1.9.0.xml','2025-04-28 12:13:51',271,'EXECUTED','8:a3dce417956fd22e92fea138eb4bb622','createTable tableName=DISABLED_EXECUTION_STATUS','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.9.0.feature-3211-2','flaurens','tm/tm.changelog-1.9.0.xml','2025-04-28 12:13:51',272,'EXECUTED','8:90362fe008c552c0fca71fe4e8cce9ea','sql','Inserting default disabled execution statuses for existing libraries',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.9.0-issue-3236-01','flaurens','tm/tm.changelog-1.9.0.xml','2025-04-28 12:13:51',273,'EXECUTED','8:5107cca5ee7718d74f9e2b7a3d7b345d','sql','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.9.0-issue--01','flaurens','tm/tm.changelog-1.9.0.xml','2025-04-28 12:13:51',274,'EXECUTED','8:805ca0dfc2a467ecdc3c9b7c6ffa6a77','dropNotNullConstraint columnName=ACTION, tableName=ACTION_TEST_STEP','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.9.0-issue-3140-01','mpagnon','tm/tm.changelog-1.9.0.xml','2025-04-28 12:13:51',275,'EXECUTED','8:03ec8252a7f4865c8475438733a5f1b3','sql','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.10.0','bsiri','tm/tm.changelog-1.10.0.xml','2025-04-28 12:13:51',276,'EXECUTED','8:c9fb10720986837eae47c3661483c684','update tableName=CORE_CONFIG','Update TM database version number',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.10.0.feature-3481-1','bsiri','tm/tm.changelog-1.10.0.xml','2025-04-28 12:13:51',277,'EXECUTED','8:61f9a82add8930097376054289b700f4','dropNotNullConstraint columnName=TEST_ID, tableName=AUTOMATED_EXECUTION_EXTENDER','before the cleanup, we need to relax some constraints',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.10.0.feature-3481-2','bsiri','tm/tm.changelog-1.10.0.xml','2025-04-28 12:13:51',278,'EXECUTED','8:ac8a755f09a91815588ee6fdc79b989c','sql; sql; sql; sql; sql; sql; sql','cleaning up unused entities',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.10.0.feature-3481-3','bsiri','tm/tm.changelog-1.10.0.xml','2025-04-28 12:13:51',279,'EXECUTED','8:d70380277307269a80a90d9f420bf0a7','addColumn tableName=TEST_AUTOMATION_SERVER; sql; sql; addNotNullConstraint columnName=NAME, tableName=TEST_AUTOMATION_SERVER; addUniqueConstraint tableName=TEST_AUTOMATION_SERVER; addNotNullConstraint columnName=CREATED_ON, tableName=TEST_AUTOMATI...','The test automation servers are now \'auditable\' (dates and authors of creation/modification are recorded) and has\n		several other attributes',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.10.0.feature-3481-4','bsiri','tm/tm.changelog-1.10.0.xml','2025-04-28 12:13:52',280,'EXECUTED','8:a3af1d22d24b1669302c99277c43fcaa','createTable tableName=PROTO_TEST_AUTOMATION_PROJECT; sql; dropTable tableName=TM_TA_PROJECTS; dropForeignKeyConstraint baseTableName=AUTOMATED_TEST, constraintName=fk_automated_test_project; dropTable tableName=TEST_AUTOMATION_PROJECT; renameTable...','The associative table TM_TA_PROJECTS is totally re-purposed as TEST_AUTOMATION_PROJECT\n			(and the former table is ditched).',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.10.0.feature-3481-5','bsiri','tm/tm.changelog-1.10.0.xml','2025-04-28 12:13:52',281,'EXECUTED','8:fd037f2b007d78a30201b94b45d6474b','addColumn tableName=PROJECT; dropColumn columnName=TEST_AUTOMATION_ENABLED, tableName=PROJECT','A TM project is now hard-bound to a TA server',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.10.0.feature-3481-6','bsiri','tm/tm.changelog-1.10.0.xml','2025-04-28 12:13:52',282,'EXECUTED','8:7de916fc08d5d87e6c2fe34026c35886','sql','migrating existing data to the new schema',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.10.0.feature-3481-6','gfouquet','tm/tm.changelog-1.10.0.xml','2025-04-28 12:13:52',283,'EXECUTED','8:39460d77595f309783bb7344142d2174','addColumn tableName=AUTOMATED_EXECUTION_EXTENDER','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.10.0.feature-3481-7','flaurens','tm/tm.changelog-1.10.0.xml','2025-04-28 12:13:52',284,'EXECUTED','8:827045ccc204c7f602bddfc6869147f2','addColumn tableName=AUTOMATED_EXECUTION_EXTENDER','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.10.0.feature-3481-8','flaurens','tm/tm.changelog-1.10.0.xml','2025-04-28 12:13:52',285,'EXECUTED','8:70da0f476b1b6dec60cd259db677686e','sql','Creating default order which is identical with the alphabetical order',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.10.0','bsiri','tm/tm.changelog-1.10.3.xml','2025-04-28 12:13:52',286,'EXECUTED','8:cbfd539884ec003142f31bf813f3a6bb','update tableName=CORE_CONFIG','Update TM database version number',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.10.3-issue-3807-3808-1','bsiri','tm/tm.changelog-1.10.3.xml','2025-04-28 12:13:52',287,'EXECUTED','8:df7e7fa2dd744c966480e94215f8aa60','createIndex indexName=idx_cfv_entity_id, tableName=CUSTOM_FIELD_VALUE; createIndex indexName=idx_cfv_entity_type, tableName=CUSTOM_FIELD_VALUE; createIndex indexName=idx_dfv_entity_id, tableName=DENORMALIZED_FIELD_VALUE; createIndex indexName=idx_...','Adding much needed indexes',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.10.5','mpagnon','tm/tm.changelog-1.10.5.xml','2025-04-28 12:13:52',288,'EXECUTED','8:94e53469ea62b14c641753493dd73aca','update tableName=CORE_CONFIG','Update TM database version number',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.10.5-issue-3860-1','mpagnon','tm/tm.changelog-1.10.5.xml','2025-04-28 12:13:52',289,'EXECUTED','8:e916e83acb708a8b24351be70ff2728e','createTable tableName=CUF_VALUES_TO_SAVE; createIndex indexName=idx_cuf_values_to_save, tableName=CUF_VALUES_TO_SAVE; sql; sql; dropIndex indexName=idx_cuf_values_to_save, tableName=CUF_VALUES_TO_SAVE; dropTable tableName=CUF_VALUES_TO_SAVE','Removing duplicate values',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.10.5-issue-3860-3','mpagnon','tm/tm.changelog-1.10.5.xml','2025-04-28 12:13:52',290,'EXECUTED','8:b1b7e409663ab6da95cb4f9aa21fdba2','createTable tableName=STEPS_SHOULD_HAVE_CUF_VALUES; sql; sql; sql; dropTable tableName=STEPS_SHOULD_HAVE_CUF_VALUES','add missing custom field values',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.11.0','flaurens','tm/tm.changelog-1.11.0.xml','2025-04-28 12:13:52',291,'EXECUTED','8:03a0d2fab9cdab890310d899b02e884f','update tableName=CORE_CONFIG','Update TM database version number',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.11.0.feature-3576-1','bsiri','tm/tm.changelog-1.11.0.xml','2025-04-28 12:13:52',292,'EXECUTED','8:046be71c438101fd3b919c2c57f4507e','addColumn tableName=CUSTOM_FIELD','Prepares the table CUSTOM_FIELD for possible default_values of type TEXT.\n  		Also accepts now a new value for the column FIELD_TYPE : RTF (for rich text fields) - no structural changes for that though.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.11.0.feature-3576-2','bsiri','tm/tm.changelog-1.11.0.xml','2025-04-28 12:13:52',293,'EXECUTED','8:e8e15c8f5b92d56655543e59bf88c57e','addColumn tableName=CUSTOM_FIELD_VALUE','prepares the table CUSTOM_FIELD_VALUE for values of type CLOB, and adds support for inheritance to that end.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.11.0.feature-3576-3','bsiri','tm/tm.changelog-1.11.0.xml','2025-04-28 12:13:52',294,'EXECUTED','8:275f19eeecd96b3df5a5768f7d75a0c5','addColumn tableName=DENORMALIZED_FIELD_VALUE','Prepares the table DENORMALIZED_FIELD_VALUE for values of type CLOB, and adds support for inheritance to that end.\n  		Also accepts now a new value for the column FIELD_TYPE : RTF (for rich text fields) - no structural changes for that though.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.11.0.feature-3556-4','kdrifi','tm/tm.changelog-1.11.0.xml','2025-04-28 12:13:52',295,'EXECUTED','8:4ef890c9a78f75194ffba62010194127','delete tableName=CORE_GROUP_AUTHORITY; delete tableName=CORE_GROUP_AUTHORITY','Cleaning duplicates of column ROLE_USER in table core_group _authority',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.11.0.feature-3577-1','mpagnon','tm/tm.changelog-1.11.0.xml','2025-04-28 12:13:52',296,'EXECUTED','8:3f8e023b7e017ef8467ec2b398a0ecb6','modifyDataType columnName=INPUT_TYPE, tableName=CUSTOM_FIELD; modifyDataType columnName=FIELD_TYPE, tableName=CUSTOM_FIELD; modifyDataType columnName=FIELD_TYPE, tableName=DENORMALIZED_FIELD_VALUE; modifyDataType columnName=INPUT_TYPE, tableName=D...','Fix columns with CHAR(X) types to VARCHAR(X) type to avoid blank space filling by Postgresql',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.9.0.feature-3138-2','jsimon','tm/tm.changelog-1.11.0.xml','2025-04-28 12:13:52',297,'EXECUTED','8:481e650cd1e40f2a7642889911903e39','addNotNullConstraint columnName=CONTENT_ORDER, tableName=CAMPAIGN_LIBRARY_CONTENT; addNotNullConstraint columnName=CONTENT_ORDER, tableName=CLN_RELATIONSHIP','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.9.0.feature-3138-4','jsimon','tm/tm.changelog-1.11.0.xml','2025-04-28 12:13:52',298,'EXECUTED','8:9377d668adfd32c2a981d69615b54d04','addNotNullConstraint columnName=CONTENT_ORDER, tableName=RLN_RELATIONSHIP; addNotNullConstraint columnName=CONTENT_ORDER, tableName=REQUIREMENT_LIBRARY_CONTENT','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.9.0.feature-3138-6','jsimon','tm/tm.changelog-1.11.0.xml','2025-04-28 12:13:52',299,'EXECUTED','8:1b5f45c17e669616d5ba536cc9452d02','addNotNullConstraint columnName=CONTENT_ORDER, tableName=TCLN_RELATIONSHIP; addNotNullConstraint columnName=CONTENT_ORDER, tableName=TEST_CASE_LIBRARY_CONTENT','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.11.0.feature-3693-1','bsiri','tm/tm.changelog-1.11.0.xml','2025-04-28 12:13:53',300,'EXECUTED','8:3d28fc731b1b0df5b42e60edd0a21c6b','addColumn tableName=CALL_TEST_STEP; addForeignKeyConstraint baseTableName=CALL_TEST_STEP, constraintName=fk_call_step_dataset, referencedTableName=DATASET','Adding support for call-step level management of datasets',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.11.0.feature-3693-2','bsiri','tm/tm.changelog-1.11.0.xml','2025-04-28 12:13:53',301,'EXECUTED','8:dd832c6cfeba03cdd1024f942f566970','update tableName=CALL_TEST_STEP','For back compatibility, the call steps migrating from an existing DB will now be set to delegate the parameters',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.11.0.feature-3700-1','bsiri','tm/tm.changelog-1.11.0.xml','2025-04-28 12:13:53',302,'EXECUTED','8:5ff62c57bf0c4707cbf77606d1c0eff0','addColumn tableName=CAMPAIGN_TEST_PLAN_ITEM','Items of a campaign test plan can now reference Datasets',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.11.0.feature-3701-1','bsiri','tm/tm.changelog-1.11.0.xml','2025-04-28 12:13:53',303,'EXECUTED','8:81dfe5232f8d4d181dd151c922e82950','addColumn tableName=EXECUTION','An execution now remembers which dataset was used (or not). That new column encodes three states :\n				\"\" -> no dataset used,\n				somelabel -> the label of the dataset used,\n				null -> the test case had no parameters anyway',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.12.0','jsimon','tm/tm.changelog-1.12.0.xml','2025-04-28 12:13:53',304,'EXECUTED','8:88dcb691497aee7858074ead96323310','update tableName=CORE_CONFIG','Update TM database version number',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.12.0.feature-3607-1','jsimon','tm/tm.changelog-1.12.0.xml','2025-04-28 12:13:53',305,'EXECUTED','8:ff298f12a8e741d51cb3663d01d766b9','createTable tableName=MILESTONE; createIndex indexName=idx_milestone, tableName=MILESTONE','Table for Milestones',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.12.0.feature-3608-1','jsimon','tm/tm.changelog-1.12.0.xml','2025-04-28 12:13:53',306,'EXECUTED','8:7014f97d59bcedceceffac2ed37cb395','createTable tableName=MILESTONE_BINDING','Table for MilestoneBinding',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.12.0.feature-3609-1','jsimon','tm/tm.changelog-1.12.0.xml','2025-04-28 12:13:53',307,'EXECUTED','8:2e3d1a102954dddc6cc105b918d2f0dd','createTable tableName=MILESTONE_BINDING_PERIMETER','Table for MilestoneBindingPerimeter',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.12.0.feature-3823-1','bsiri','tm/tm.changelog-1.12.0.xml','2025-04-28 12:13:53',308,'EXECUTED','8:bbcf8622b215aa6f1c3c19862268a45e','createTable tableName=CUSTOM_FIELD_VALUE_OPTION','Creating the values table for multi-valued custom fields, much like CUSTOM_FIELD_OPTION is. \n  	Note : the DELETE CASCADE on the foreign key is necessary because Hibernate won\'t do it (as specified, see HHH-5529)',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.12.0.feature-3823-2','bsiri','tm/tm.changelog-1.12.0.xml','2025-04-28 12:13:53',309,'EXECUTED','8:c6894fb57d027f3243603da4a04e65ee','createTable tableName=DENORMALIZED_FIELD_VALUE_OPTION','Same table for the denormalized field values',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.12.0.feature-3823-3','bsiri','tm/tm.changelog-1.12.0.xml','2025-04-28 12:13:53',310,'EXECUTED','8:f3f4cbfade0669a80a7b3eedf09efe65','dropNotNullConstraint columnName=POSITION, tableName=CUSTOM_FIELD_OPTION; dropNotNullConstraint columnName=POSITION, tableName=DENORMALIZED_FIELD_OPTION','tables CUSTOM_FIELD_OPTION and DENORMALIZED_FIELD_OPTION no longer enforce the option position.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.12.0.issue-4017-1','bsiri','tm/tm.changelog-1.12.0.xml','2025-04-28 12:13:53',311,'EXECUTED','8:fd4099f77e0d72f3912b5c487ca698ed','modifyDataType columnName=OLD_VALUE, tableName=REQUIREMENT_PROPERTY_CHANGE; modifyDataType columnName=NEW_VALUE, tableName=REQUIREMENT_PROPERTY_CHANGE','Some columns in REQUIREMENT_PROPERTY_CHANGE are too short compared to what \n  	they are supposed to store. This changeset makes them bigger.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.12.0.feat-4068-1','bsiri','tm/tm.changelog-1.12.0.xml','2025-04-28 12:13:53',312,'EXECUTED','8:699c9f1d850fa6df903852d0ffe93348','createTable tableName=INFO_LIST; createIndex indexName=idx_info_list_code, tableName=INFO_LIST; createTable tableName=INFO_LIST_ITEM; createIndex indexName=idx_info_list_item_code, tableName=INFO_LIST_ITEM; createIndex indexName=idx_info_list_labe...','creating the table structure for parameterized list',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.12.0.feat-4068-2','bsiri','tm/tm.changelog-1.12.0.xml','2025-04-28 12:13:53',313,'EXECUTED','8:227e13ef4bed0445d8266877b348765c','addColumn tableName=EXECUTION','Updating the definition of an execution',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.12.0.feat-4068-3','bsiri','tm/tm.changelog-1.12.0.xml','2025-04-28 12:13:53',314,'EXECUTED','8:50774e205e67740e4e184d893efd86a3','insert tableName=INFO_LIST; insert tableName=INFO_LIST_ITEM; insert tableName=INFO_LIST_ITEM; insert tableName=INFO_LIST_ITEM; insert tableName=INFO_LIST_ITEM; insert tableName=INFO_LIST_ITEM; insert tableName=INFO_LIST_ITEM; insert tableName=INFO...','inserting the default lists in the database',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.12.0.feat-4068-4','bsiri','tm/tm.changelog-1.12.0.xml','2025-04-28 12:13:53',315,'EXECUTED','8:932e211beea488279ced250ca90e7797','addColumn tableName=PROJECT','other structural modifications',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.12.0.feat-4068-6','bsiri','tm/tm.changelog-1.12.0.xml','2025-04-28 12:13:54',316,'EXECUTED','8:97a9a415af4e8d507a458dc6fe0f379f','renameColumn newColumnName=TC_NATURE_OLD, oldColumnName=TC_NATURE, tableName=TEST_CASE; addColumn tableName=TEST_CASE; sql; dropColumn columnName=TC_NATURE_OLD, tableName=TEST_CASE; renameColumn newColumnName=TC_TYPE_OLD, oldColumnName=TC_TYPE, ta...','migrate the test cases',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.12.0.feat-4068-7','bsiri','tm/tm.changelog-1.12.0.xml','2025-04-28 12:13:54',317,'EXECUTED','8:6cf6f64c283662f01379ae8a0d0c25f9','renameColumn newColumnName=CATEGORY_OLD, oldColumnName=CATEGORY, tableName=REQUIREMENT_VERSION; addColumn tableName=REQUIREMENT_VERSION; sql; dropColumn columnName=CATEGORY_OLD, tableName=REQUIREMENT_VERSION','migrate the requirements',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.12.0.feat-4068-8','bsiri','tm/tm.changelog-1.12.0.xml','2025-04-28 12:13:54',318,'EXECUTED','8:1989bab44697afb24e198d91d88c6a73','sql; dropColumn columnName=TC_NATURE, tableName=EXECUTION; dropColumn columnName=TC_TYPE, tableName=EXECUTION','migrating the columns from EXECUTION',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.12.0.feat-3764-1','flaurens','tm/tm.changelog-1.12.0.xml','2025-04-28 12:13:54',319,'EXECUTED','8:e76f4c9d87bcdf267ec3edc0b42876da','createTable tableName=oauth_client_details; createTable tableName=oauth_client_token; createTable tableName=oauth_access_token; createTable tableName=oauth_refresh_token; createTable tableName=oauth_code; createTable tableName=oauth_approvals; add...','Tables for OAuth2 Support',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.12.0.feat-4171-1','jsimon','tm/tm.changelog-1.12.0.xml','2025-04-28 12:13:54',320,'EXECUTED','8:ca6c8021a7f62cb1fdc93baf4e19470e','insert tableName=CORE_CONFIG; insert tableName=CORE_CONFIG; insert tableName=CORE_CONFIG','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.12.0.feat-3611-1','bsiri','tm/tm.changelog-1.12.0.xml','2025-04-28 12:13:54',321,'EXECUTED','8:a8873f6339b44d8d0309c4b7c080e739','createTable tableName=MILESTONE_TEST_CASE; createTable tableName=MILESTONE_REQ_VERSION; createTable tableName=MILESTONE_CAMPAIGN','Creating the tables modeling the relationships between milestones and test cases, requirement versions \n    		and campaigns',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.12.3','bsiri','tm/tm.changelog-1.12.3.xml','2025-04-28 12:13:54',322,'EXECUTED','8:dc6d2d6170ded24cc95fc871d154fb67','update tableName=CORE_CONFIG','Update TM database version number',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.12.3-issue-5965-1-1-mysql','bsiri','tm/tm.changelog-1.12.3.xml','2025-04-28 12:13:54',323,'EXECUTED','8:d503967dc40ddb816822f91c9f7b8dab','sql','Fixing data in TCLN_RELATIONSHIP_CLOSURE that need to be',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.12.3-issue-5965-1-2-mysql','bsiri','tm/tm.changelog-1.12.3.xml','2025-04-28 12:13:54',324,'EXECUTED','8:8caf1c706891a32c2dc5c03d4cab6b31','sql','Fixing data in RLN_RELATIONSHIP_CLOSURE that need to be',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.12.3-issue-5965-1-3-mysql','bsiri','tm/tm.changelog-1.12.3.xml','2025-04-28 12:13:54',325,'EXECUTED','8:1c2e6953ad3a54e81ac0e35bd7243a59','sql','Fixing data in CLN_RELATIONSHIP_CLOSURE that need to be',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.12.3-issue-5965-2-1','bsiri','tm/tm.changelog-1.12.3.xml','2025-04-28 12:13:54',326,'EXECUTED','8:6df9afbc155d2a2f2a8eeaa99293695a','addUniqueConstraint constraintName=uniq_tcln_clos, tableName=TCLN_RELATIONSHIP_CLOSURE; addUniqueConstraint constraintName=uniq_rln_clos, tableName=RLN_RELATIONSHIP_CLOSURE; addUniqueConstraint constraintName=uniq_cln_clos, tableName=CLN_RELATIONS...','now we can add the unique constraints on the closure tables',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.12.3-issue-3-1','bsiri','tm/tm.changelog-1.12.3.xml','2025-04-28 12:13:54',327,'EXECUTED','8:45f6005adfd2eb582c2a2e0363b2bd19','sql; sql','redefining some triggers for table TCLN_RELATIONHIP and TEST_CASE_LIBRARY_NODE',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.12.3-issue-3-2','bsiri','tm/tm.changelog-1.12.3.xml','2025-04-28 12:13:54',328,'EXECUTED','8:e96af54bacfc057629f3bb3467ff9b94','sql; sql','redefining some triggers for table RLN_RELATIONHIP and REQUIREMENT_LIBRARY_NODE',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.12.3-issue-3-3','bsiri','tm/tm.changelog-1.12.3.xml','2025-04-28 12:13:54',329,'EXECUTED','8:6a6dc999aafc298928ad7355b260551f','sql; sql','redefining some triggers for table CLN_RELATIONHIP and CAMPAIGN_LIBRARY_NODE',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.13.0','bsiri','tm/tm.changelog-1.13.0.xml','2025-04-28 12:13:54',330,'EXECUTED','8:13996fdeedbab45a870eeca858068c0f','update tableName=CORE_CONFIG','Update TM database version number',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.13.0-feature-5155-1','jsimon','tm/tm.changelog-1.13.0.xml','2025-04-28 12:13:54',331,'EXECUTED','8:e397bd92c3bdcfc84dfca4fc0b205734','createTable tableName=BUGTRACKER_PROJECT; createIndex indexName=idx_bugtracker_project, tableName=BUGTRACKER_PROJECT; sql; dropColumn columnName=PROJECT_NAME, tableName=BUGTRACKER_BINDING','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.13.0-feature-5162-1','bsiri','tm/tm.changelog-1.13.0.xml','2025-04-28 12:13:54',332,'EXECUTED','8:8e09f2a6da2c3c1149758c74ecadf01f','addColumn tableName=CAMPAIGN; addColumn tableName=ITERATION; sql','Now campaigns and iterations have a reference too',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.13.0-feature-4022-1','jsimon','tm/tm.changelog-1.13.0.xml','2025-04-28 12:13:54',333,'EXECUTED','8:cba1a6c81e923e30998ae40ded91abe5','addColumn tableName=PROJECT','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.13.0-feature-5292-issues','bsiri','tm/tm.changelog-1.13.0.xml','2025-04-28 12:13:54',334,'EXECUTED','8:691090d097e12d381b20397fd41df475','createView viewName=EXECUTION_ISSUES_CLOSURE','creating a view that helps querying on all the issues reported in an execution because\n			querying EXECUTION and EXECUTION_STEP separately is just a pain in the ass.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.13.0-feature-5375-1','jsimon, bsiri','tm/tm.changelog-1.13.0.xml','2025-04-28 12:13:55',335,'EXECUTED','8:0c44a4f407fc0b126fdafe12412717f1','createTable tableName=CHART_QUERY; createTable tableName=CHART_DEFINITION; createIndex indexName=idx_chart_definition, tableName=CHART_DEFINITION; createTable tableName=CHART_COLUMN_PROTOTYPE; createIndex indexName=idx_column_prototype, tableName=...','The table CHART_QUERY aggregates 1..* CHART_MEASURE_COLUMN, 1..* CHART_AXIS_COLUMN and 0..* CHART_FILTER\n			(see these table for more informations). It may be referenced by either a CHART_DEFINITION (as a query),\n			either a COLUMN_PROTOTYPE (as a...',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.13.0-feature-5375-2','bsiri','tm/tm.changelog-1.13.0.xml','2025-04-28 12:13:55',336,'EXECUTED','8:5e79060c1b57a7082052eb0a99d2b68d','sql','populate the column prototype referential data (generated from src/main/script/MakeChartColumns.groovy)',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.13.0-feature-5292-1','jthebault','tm/tm.changelog-1.13.0.xml','2025-04-28 12:13:55',337,'EXECUTED','8:b14a1ed4742e92aaf267d903b94432fb','createTable tableName=CUSTOM_REPORT_LIBRARY; createIndex indexName=IDX_CUSTOM_REPORT_LIBRARY, tableName=CUSTOM_REPORT_LIBRARY; createTable tableName=CUSTOM_REPORT_LIBRARY_NODE; createTable tableName=CRLN_RELATIONSHIP; createIndex indexName=idx_crl...','This table contains the relations between two custom reports nodes. If a node is root, parent id will be null and descendant id will be itself.\n		a given node can be referenced as descendant only one time so we can map the join with hibernate\nclos...',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.13.0-feat-5292-2-mysql','jthebault','tm/tm.changelog-1.13.0.xml','2025-04-28 12:13:55',338,'EXECUTED','8:77ab09adfc0906d841d57624e46f455f','sql; sql; sql; sql','mysql-triggers for CRLN_RELATIONSHIP_CLOSURE table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.13.0-feat-5292-3','jthebault','tm/tm.changelog-1.13.0.xml','2025-04-28 12:13:55',339,'EXECUTED','8:5884d6c41307e073b4b162814fbd26f5','sql; sql; sql; sql; dropColumn columnName=TMP_CRL_ID, tableName=ATTACHMENT_LIST','Migration for custom report workspace evolution. Mainly create the Library entities and their nodes, attachement list...',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.13.0-feature-5292-4','bsiri','tm/tm.changelog-1.13.0.xml','2025-04-28 12:13:55',340,'EXECUTED','8:0cea90188e94c0803f7a72648a525b19','addForeignKeyConstraint baseTableName=PROJECT, constraintName=fk_project_crl, referencedTableName=CUSTOM_REPORT_LIBRARY; addForeignKeyConstraint baseTableName=CUSTOM_REPORT_LIBRARY, constraintName=fk_crl_attachment_list, referencedTableName=ATTACH...','set the foreign key constraints from project to custom report library, and from custom report_library to attachment_list',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.13.0-feature-5375-4','jsimon','tm/tm.changelog-1.13.0.xml','2025-04-28 12:13:55',341,'EXECUTED','8:8d03e54c82ce1a0365b8bff9db1813ef','createTable tableName=CHART_PROJECT_SCOPE','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.13.0-feature-5265-1','bsiri','tm/tm.changelog-1.13.0.xml','2025-04-28 12:13:55',342,'EXECUTED','8:4803f8b36971e183b131933ef8c57853','createTable tableName=REQUIREMENT_SYNC_EXTENDER','This table holds the optional extension for requirement, that flags them as synchronized requirement',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.13.0-feature-5265-2','bsiri','tm/tm.changelog-1.13.0.xml','2025-04-28 12:13:55',343,'EXECUTED','8:eb46a85670d8df585dd9799feb298151','addColumn tableName=REQUIREMENT','adding a column recording how a requirement should be managed',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.13.1','jthebault','tm/tm.changelog-1.13.1.xml','2025-04-28 12:13:55',344,'EXECUTED','8:5dfe51f4e5794497122d0883a79ea680','update tableName=CORE_CONFIG','Update TM database version number',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.13.1-ACL-Custom-Report-Library','jthebault','tm/tm.changelog-1.13.1.xml','2025-04-28 12:13:55',345,'EXECUTED','8:b3353aee971b32f7a206730a99b71913','sql','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.13.3','bsiri','tm/tm.changelog-1.13.3.xml','2025-04-28 12:13:55',346,'EXECUTED','8:583d37bd7df8df56d447daace1221115','update tableName=CORE_CONFIG','Update TM database version number',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.13.3-feature-5265-1','bsiri','tm/tm.changelog-1.13.3.xml','2025-04-28 12:13:55',347,'EXECUTED','8:ad3d502b277a0e8dda58acdbe2fdd508','modifyDataType columnName=PLUGIN_BINDING_VALUE, tableName=LIBRARY_PLUGIN_BINDING_PROPERTY','making the capacity of plugin configuration items larger',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.13.3-feature-5265-2','bsiri','tm/tm.changelog-1.13.3.xml','2025-04-28 12:13:56',348,'EXECUTED','8:35006cedc4c73243a67d4c2cf2f40f24','addColumn tableName=REQUIREMENT_SYNC_EXTENDER; dropForeignKeyConstraint baseTableName=REQUIREMENT_SYNC_EXTENDER, constraintName=fk_sync_extender_bugtracker; renameColumn newColumnName=SERVER_ID, oldColumnName=BUGTRACKER_ID, tableName=REQUIREMENT_S...','reworking table REQUIREMENT_SYNC_EXTENDER',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.13.3-feature-5265-3','bsiri','tm/tm.changelog-1.13.3.xml','2025-04-28 12:13:56',349,'EXECUTED','8:fe6f4a07b70b8d871d45343bc60e2ba1','createIndex indexName=idx_sync_remote_req_id, tableName=REQUIREMENT_SYNC_EXTENDER; createIndex indexName=idx_sync_remote_projfilter, tableName=REQUIREMENT_SYNC_EXTENDER','adding useful indexes',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.13.3-feature-5265-4','bsiri','tm/tm.changelog-1.13.3.xml','2025-04-28 12:13:56',350,'EXECUTED','8:2e16043bb6f1dd0782f3b9e2ef3df413','createView viewName=RLN_RESOURCE','This view maps a requirement library node to its main resource. Some would say \n			it is redundant with what can be found in tables REQUIREMENT or REQUIREMENT_FOLDER\n			but seriously it makes simple things likes getting the name of a generic \n			R...',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.13.3-feature-5265-5','bsiri','tm/tm.changelog-1.13.3.xml','2025-04-28 12:13:56',351,'EXECUTED','8:1a73b17e530c2ca172ada8511878181a','createTable tableName=SYNC_REQUIREMENT_CREATION; createTable tableName=SYNC_REQUIREMENT_UPDATE','new requirement audit trail tables for synchronization events',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.13.5','jthebault','tm/tm.changelog-1.13.5.xml','2025-04-28 12:13:56',352,'EXECUTED','8:73c40d201987202855e9197795ed789d','update tableName=CORE_CONFIG','Update TM database version number',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.13.5-issue-6291','jthebault','tm/tm.changelog-1.13.5.xml','2025-04-28 12:13:56',353,'EXECUTED','8:648348de98c9cf73908fcff0911ec3ab','sql','Delete orphan lines in cuf values. Only for cuf values bind to a removed execution.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.14.0','bsiri','tm/tm.changelog-1.14.0.xml','2025-04-28 12:13:56',354,'EXECUTED','8:b8a4cc8d0b66bdc42ac118684ecde133','update tableName=CORE_CONFIG','Update TM database version number',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.14.0-feature-5416','jthebault','tm/tm.changelog-1.14.0.xml','2025-04-28 12:13:56',355,'EXECUTED','8:fdc67ca09020a062cad0e5cde3c582c2','createTable tableName=PARTY_PREFERENCE','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.14.1','bsiri','tm/tm.changelog-1.14.1.xml','2025-04-28 12:13:56',356,'EXECUTED','8:a4951c9aab722dc6da389d1fbbea4de6','update tableName=CORE_CONFIG','Update TM database version number',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.14.1-issue-6340-1','bsiri','tm/tm.changelog-1.14.1.xml','2025-04-28 12:13:56',357,'EXECUTED','8:2a456f87ed5132be98b83b0d7e8e28c7','dropForeignKeyConstraint baseTableName=DENORMALIZED_FIELD_OPTION, constraintName=fk_df_option_dfv; addForeignKeyConstraint baseTableName=DENORMALIZED_FIELD_OPTION, constraintName=fk_df_option_dfv, referencedTableName=DENORMALIZED_FIELD_VALUE','For the purpose of the cleanup to come, we must activate on delete cascade\n            between DENORMALIZED_FIELD_OPTION and DENORMALIZED_FIELD_VALUE',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.14.1-issue-6340-2b','bsiri','tm/tm.changelog-1.14.1.xml','2025-04-28 12:13:56',358,'EXECUTED','8:6a477771aaff19c16ab84dca9a8cfa8c','sql','Fixing the extraneous custom field values (for test cases) and denormalized field values (for executions)\n          for MySQL',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.14.1-issue-6340-3','bsiri','tm/tm.changelog-1.14.1.xml','2025-04-28 12:13:56',359,'EXECUTED','8:33fe9e5bafdda2bd39ccdacb36ed1e1c','addUniqueConstraint constraintName=u_dfv_id_type_code, tableName=DENORMALIZED_FIELD_VALUE; addUniqueConstraint constraintName=u_cfv_id_type_binding, tableName=CUSTOM_FIELD_VALUE','enforcing uniticy on the custom field values and denormalized field values -\n          if later on there are more double insert let it fail fast',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.15.0','jthebault','tm/tm.changelog-1.15.0.xml','2025-04-28 12:13:56',360,'EXECUTED','8:5f0abce44da7fdf9a9c5af45b1896931','update tableName=CORE_CONFIG','Update TM database version number',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.15.0-feature-6365','jthebault','tm/tm.changelog-1.15.0.xml','2025-04-28 12:13:56',361,'EXECUTED','8:5e2d4acbeca777f1468dc2a16ec2e1d5','addColumn tableName=CUSTOM_FIELD; addColumn tableName=CUSTOM_FIELD_VALUE; addColumn tableName=DENORMALIZED_FIELD_VALUE','column for numeric cufs',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.15.0-cuf-custom-report-1','jthebault','tm/tm.changelog-1.15.0.xml','2025-04-28 12:13:56',362,'EXECUTED','8:48fde32bf41c5ebb21d3b82d80887134','createTable tableName=TEMP_CUF_ID; createIndex indexName=idx_tmp_cuf_cuf_id, tableName=TEMP_CUF_ID; createIndex indexName=idx_tmp_cuf_cfv_id, tableName=TEMP_CUF_ID; addColumn tableName=CUSTOM_FIELD_VALUE; createIndex indexName=idx_cfv_custom_field...','Denormalize the cuf ID inside the cuf values, so we don\'t have to make two more joins in custom reports',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.15.0-cuf-custom-report-2','jthebault','tm/tm.changelog-1.15.0.xml','2025-04-28 12:13:56',363,'EXECUTED','8:4e194cffc73cc151ca615ab0189f82bd','sql; sql; sql; sql; sql; sql; sql; sql; sql; sql; addColumn tableName=CHART_MEASURE_COLUMN; addColumn tableName=CHART_AXIS_COLUMN; addColumn tableName=CHART_FILTER','columns prototypes for custom fields bound to requirement version.\ncolumns prototypes for custom fields bound to test case.\ncolumns prototypes for custom fields bound to campaign.\ncolumns prototypes for custom fields bound to iteration.\ncolumns pr...',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.15.0-feat-5417','jthebault','tm/tm.changelog-1.15.0.xml','2025-04-28 12:13:56',364,'EXECUTED','8:b8cad20d9086d2e3aa076b1897eaecf1','addColumn tableName=CHART_DEFINITION; sql','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.15.0-feat-5417-2','jthebault','tm/tm.changelog-1.15.0.xml','2025-04-28 12:13:56',365,'EXECUTED','8:acbefa25edb59180ef38ac904e8c4252','sql','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.15.0-feat-5417-3','jthebault','tm/tm.changelog-1.15.0.xml','2025-04-28 12:13:56',366,'EXECUTED','8:0d03bc0eac56362f6ffd647868a39f21','sql','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.16.0-SQUASH-5232-add-databasechangelog-new-columns','jprioux','tm/tm.changelog-1.16.0.xml','2025-04-28 12:13:56',367,'EXECUTED','8:aeea36396a9ec2a5a73082a8a593b123','sql','Add Contexts, labels and deployment_id columns to DATABASECHANGELOG Table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.16.0','jprioux','tm/tm.changelog-1.16.0.xml','2025-04-28 12:13:56',368,'EXECUTED','8:ef2d0b4d85aa73343955979430857140','update tableName=CORE_CONFIG','Update TM database version number',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.16.0-feature-6763','jprioux','tm/tm.changelog-1.16.0.xml','2025-04-28 12:13:56',369,'EXECUTED','8:9177032ded7ea353d8e4f8e87eafe649','addColumn tableName=CORE_USER','column for last connected on',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.16.0-feature-6799','jlor','tm/tm.changelog-1.16.0.xml','2025-04-28 12:13:56',370,'EXECUTED','8:2c2333c7188e9c02b475b74e2b5408fe','createTable tableName=REQUIREMENT_VERSION_LINK_TYPE; createTable tableName=REQUIREMENT_VERSION_LINK; insert tableName=REQUIREMENT_VERSION_LINK_TYPE; insert tableName=REQUIREMENT_VERSION_LINK_TYPE; insert tableName=REQUIREMENT_VERSION_LINK_TYPE','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.17.0-SQUASH-5232-add-databasechangelog-new-columns','jprioux','tm/tm.changelog-1.17.0.xml','2025-04-28 12:13:56',371,'EXECUTED','8:aeea36396a9ec2a5a73082a8a593b123','sql','Add Contexts, labels and deployment_id columns to DATABASECHANGELOG Table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.17.0','jthebault','tm/tm.changelog-1.17.0.xml','2025-04-28 12:13:56',372,'EXECUTED','8:635106608f9ea0995f9c28da565b8652','update tableName=CORE_CONFIG','Update TM database version number',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.17.0-feature-6921','zyang','tm/tm.changelog-1.17.0.xml','2025-04-28 12:13:56',373,'EXECUTED','8:7c2bee7c946ec37dcf1c94a8edeb197f','addColumn tableName=CAMPAIGN; addColumn tableName=ITERATION','Adds a status field to campaign and iteration',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.17.0','zyang','tm/tm.changelog-1.17.0.xml','2025-04-28 12:13:56',374,'EXECUTED','8:a51a3bbf6dfc42620313e2eef68df1cb','createTable tableName=REPORT_DEFINITION','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.17.0-feature-6921','cholc','tm/tm.changelog-1.17.0.xml','2025-04-28 12:13:56',375,'EXECUTED','8:7ecf63ab62a5066758ac61daadb4b949','addColumn tableName=TEST_SUITE','Adds a execution status field to the test suites',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.17.0-feature-sqtm-167','bsiri','tm/tm.changelog-1.17.0.xml','2025-04-28 12:13:56',376,'EXECUTED','8:dae8f23fb21f93b77c6246708ce0d72d','createTable tableName=STORED_CREDENTIALS; addColumn tableName=BUGTRACKER','Adding the ability to use application-level credentials that allows Squash interact with a bugtracker on its own\n      (ie instead of requiring the current user to authenticate).',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.17.0-jira-sync-01','jthebault','tm/tm.changelog-1.17.0.xml','2025-04-28 12:13:56',377,'EXECUTED','8:b70c85f02dd90cf9d8ce3b2a6e9cf76d','createTable tableName=REMOTE_SYNCHRONISATION','Add a remote synchronisation table in squash tm.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.17.0-jira-sync-02','jthebault','tm/tm.changelog-1.17.0.xml','2025-04-28 12:13:56',378,'EXECUTED','8:77686424e0ff386fcc4e120065c7c6fc','createTable tableName=REQUIREMENT_FOLDER_SYNC_EXTENDER','Add a remote folder synchronisation table in squash tm.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.17.0-jira-sync-03','jthebault','tm/tm.changelog-1.17.0.xml','2025-04-28 12:13:57',379,'EXECUTED','8:98f597ab35b289fca921d3062ea9795e','dropNotNullConstraint columnName=REMOTE_FILTER_NAME, tableName=REQUIREMENT_SYNC_EXTENDER; addColumn tableName=REQUIREMENT_SYNC_EXTENDER; createIndex indexName=req_sync_extender_remote_parent_id_idx, tableName=REQUIREMENT_SYNC_EXTENDER','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.17.0-Issue-6967','jthebault','tm/tm.changelog-1.17.0.xml','2025-04-28 12:13:57',380,'EXECUTED','8:3cdbf1b9fd528540de692dda7c1b941e','createIndex indexName=tcln_name_idx, tableName=TEST_CASE_LIBRARY_NODE','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.18.0-SQUASH-5232-add-databasechangelog-new-columns','jprioux','tm/tm.changelog-1.18.0.xml','2025-04-28 12:13:57',381,'EXECUTED','8:aeea36396a9ec2a5a73082a8a593b123','sql','Add Contexts, labels and deployment_id columns to DATABASECHANGELOG Table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.18.0','jthebault','tm/tm.changelog-1.18.0.xml','2025-04-28 12:13:57',382,'EXECUTED','8:c007b82557a1da7abdfc8a0a8dd981ef','update tableName=CORE_CONFIG','Update TM database version number',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.18.0-connection-log-table','aguilhem','tm/tm.changelog-1.18.0.xml','2025-04-28 12:13:57',383,'EXECUTED','8:0fc79047ba04c43e0002af165e25172d','createTable tableName=CONNECTION_ATTEMPT_LOG','Create Connection Attempt Log Table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.18.0-project-template-link','jlor','tm/tm.changelog-1.18.0.xml','2025-04-28 12:13:57',384,'EXECUTED','8:e24e3c9048470677dbd774874095f7c1','addColumn tableName=PROJECT','Adding a column to keep the link between a Project and a Project Template',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.18.0-feature-7183.1-mysql','jprioux','tm/tm.changelog-1.18.0.xml','2025-04-28 12:13:57',385,'EXECUTED','8:713d639a95dc96a1169e2dac3b7acfac','sql; addUniqueConstraint constraintName=uc_test_case_steps_order, tableName=TEST_CASE_STEPS','mysql - add unique constraint for ordered list : test case steps',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.18.0-feature-7183.2-mysql','jprioux','tm/tm.changelog-1.18.0.xml','2025-04-28 12:13:57',386,'EXECUTED','8:9612f16af003129d5ab212a0a1afdbcb','sql; addUniqueConstraint constraintName=uc_item_test_plan_list_order, tableName=ITEM_TEST_PLAN_LIST','mysql - add unique constraint for ordered list : tcs in iteration',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.18.0-feature-7183.3-mysql','jprioux','tm/tm.changelog-1.18.0.xml','2025-04-28 12:13:57',387,'EXECUTED','8:7f432b6d0794f9f2f6fbf97a9f4dbada','sql; addUniqueConstraint constraintName=uc_test_suite_test_plan_item_order, tableName=TEST_SUITE_TEST_PLAN_ITEM','mysql - add unique constraint for ordered list : tcs in test suite',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.18.0-feature-7183.4-mysql','jprioux','tm/tm.changelog-1.18.0.xml','2025-04-28 12:13:57',388,'EXECUTED','8:96bd6445c0ddca1b37d16f5c18f84481','sql; addUniqueConstraint constraintName=uc_campaign_test_plan_item_order, tableName=CAMPAIGN_TEST_PLAN_ITEM','mysql - add unique constraint for ordered list : tcs in campaign',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.18.0-binding-report-to-dashboard','zyang','tm/tm.changelog-1.18.0.xml','2025-04-28 12:13:57',389,'EXECUTED','8:3d397a73a7554ac2dec23e806278fc3f','createTable tableName=CUSTOM_REPORT_REPORT_BINDING','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.18.0-scripted-test-case','jthebault','tm/tm.changelog-1.18.0.xml','2025-04-28 12:13:57',390,'EXECUTED','8:d5249b00e7375b24091e878316a2492b','createTable tableName=SCRIPTED_TC_EXTENDER; createIndex indexName=scripted_tc_extender_test_case_id_idx, tableName=SCRIPTED_TC_EXTENDER; createTable tableName=SCRIPTED_EXECUTION_EXTENDER; createIndex indexName=scripted_execution_extender_execution...','Create the scripted test case table\nCreate the scripted execution table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.18.0-modification-report','zyang','tm/tm.changelog-1.18.0.xml','2025-04-28 12:13:57',391,'EXECUTED','8:d18f312340f2a9695467f8b970bd18c4','addColumn tableName=REPORT_DEFINITION','Adds a summary field to report definition',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.18.0-oauth1a-consumer-1','bsiri','tm/tm.changelog-1.18.0.xml','2025-04-28 12:13:57',392,'EXECUTED','8:40cf2cb2853a3de0486875b356e99208','addColumn tableName=STORED_CREDENTIALS; addUniqueConstraint constraintName=uniq_stored_credentials_server_user, tableName=STORED_CREDENTIALS','StoredCredentials can now store either credentials, either general configuration.\n        A new column appear so we can hint what is the type of the payload.\n        Also, users can now have stored credentials (even though they can\'t manage them y...',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.18.0-oauth1a-consumer-2','bsiri','tm/tm.changelog-1.18.0.xml','2025-04-28 12:13:57',393,'EXECUTED','8:7ef0a187573741b67e5c7d67d737ca66','addColumn tableName=BUGTRACKER','Bugtracker now declare which authentication protocol should be used upfront.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.18.0-email-column-resizing','aguilhem','tm/tm.changelog-1.18.0.xml','2025-04-28 12:13:58',394,'EXECUTED','8:1459ae06e7ed1049f85d05dba10c783a','modifyDataType columnName=EMAIL, tableName=CORE_USER; addDefaultValue columnName=EMAIL, tableName=CORE_USER','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.19.0-SQUASH-5232-add-databasechangelog-new-columns','jprioux','tm/tm.changelog-1.19.0.xml','2025-04-28 12:13:58',395,'EXECUTED','8:aeea36396a9ec2a5a73082a8a593b123','sql','Add Contexts, labels and deployment_id columns to DATABASECHANGELOG Table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.19.0','cholc','tm/tm.changelog-1.19.0.xml','2025-04-28 12:13:58',396,'EXECUTED','8:79d344adec29f8523acb83f31ca09402','update tableName=CORE_CONFIG','Update TM database version number',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.19.0-SQTM-400-info-list-item','cholc','tm/tm.changelog-1.19.0.xml','2025-04-28 12:13:58',397,'EXECUTED','8:69536af651c134f813bc37a03070beea','addColumn tableName=INFO_LIST_ITEM','Adds a colour field to info list items',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.19.0-SQTM-400-custom-field-option','cholc','tm/tm.changelog-1.19.0.xml','2025-04-28 12:13:58',398,'EXECUTED','8:067e8b87f39929938617cd84c0930654','addColumn tableName=CUSTOM_FIELD_OPTION','Adds a colour field to custom field options',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.19.0-SQTM-409-iteration-test-suite-remove-constraint','cholc','tm/tm.changelog-1.19.0.xml','2025-04-28 12:13:58',399,'EXECUTED','8:47251f14e90438d1cf29942477eac5ac','addColumn tableName=ITERATION_TEST_SUITE; dropForeignKeyConstraint baseTableName=ITERATION_TEST_SUITE, constraintName=fk_iteration_test_suite_suite; update tableName=ITERATION_TEST_SUITE; dropColumn columnName=TEST_SUITE_ID, tableName=ITERATION_TE...','To drop an unique constraint, you need the constraint\'s name, which we don\'t have, so here we copy the\n      column and delete the original',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.19.0-SQTM-409-iteration-test-suite-order','cholc','tm/tm.changelog-1.19.0.xml','2025-04-28 12:13:58',400,'EXECUTED','8:c604993a6bcdbb239a2d95791e071a41','addColumn tableName=ITERATION_TEST_SUITE','add an order to iterations\' test suites',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.19.0-SQTM-409-iteration-test-suite-order-generation','cholc','tm/tm.changelog-1.19.0.xml','2025-04-28 12:13:58',401,'EXECUTED','8:d05b4845192d3b6f3f38ee79045e259b','sql; addUniqueConstraint constraintName=uc_iteration_iteration_test_suite_order, tableName=ITERATION_TEST_SUITE; addNotNullConstraint columnName=ITERATION_TEST_SUITE_ORDER, tableName=ITERATION_TEST_SUITE','will compute the order of the test suites in the iterations, should work for all databases',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.19.0-up-sb2-1','bsiri','tm/tm.changelog-1.19.0.xml','2025-04-28 12:13:58',402,'EXECUTED','8:4fec87dfb8b26d239bda1ae3f6573939','modifyDataType columnName=PASSWORD, tableName=AUTH_USER','Passwords are now much longer since we also store the salt.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.19.0-SQTM-399-infolist-items-default-colours','cholc','tm/tm.changelog-1.19.0.xml','2025-04-28 12:13:58',403,'EXECUTED','8:024f29efbde813cf2093f9a88524ebde','update tableName=INFO_LIST_ITEM; update tableName=INFO_LIST_ITEM; update tableName=INFO_LIST_ITEM; update tableName=INFO_LIST_ITEM; update tableName=INFO_LIST_ITEM; update tableName=INFO_LIST_ITEM; update tableName=INFO_LIST_ITEM; update tableName...','Requirement categories colours\nTest cases natures colours\nTest cases types colours',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.19.0-SQTM-453-execution-name-maxlength','jprioux','tm/tm.changelog-1.19.0.xml','2025-04-28 12:13:58',404,'EXECUTED','8:3cb1611a1b730b40a0cb7703b48af530','modifyDataType columnName=NAME, tableName=EXECUTION; addNotNullConstraint columnName=NAME, tableName=EXECUTION','Increase max length for execution name',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.19.0-SQTM-508-automation-request','aboittiaux','tm/tm.changelog-1.19.0.xml','2025-04-28 12:13:58',405,'EXECUTED','8:5748276926c63e23884eab6c5bec0219','createTable tableName=AUTOMATION_REQUEST; createIndex indexName=automation_request_assigned_to_idx, tableName=AUTOMATION_REQUEST; createIndex indexName=automation_request_created_by_idx, tableName=AUTOMATION_REQUEST; createIndex indexName=automati...','Create table AUTOMATION_REQUEST to Gherkin\'s test cases',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.19.0-SQTM-519-automation-request-library-1','bsiri','tm/tm.changelog-1.19.0.xml','2025-04-28 12:13:58',406,'EXECUTED','8:d50286a3e29feee52710b1b901b61221','createTable tableName=AUTOMATION_REQUEST_LIBRARY; createIndex indexName=idx_automation_request_library, tableName=AUTOMATION_REQUEST_LIBRARY','Creating the AutomationRequestLibrary',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.19.0-SQTM-519-automation-request-library-2','bsiri','tm/tm.changelog-1.19.0.xml','2025-04-28 12:13:58',407,'EXECUTED','8:180f840f2a84db732425975563ea575b','sql','New entries in the ACL infrastructure.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.19.0-SQTM-519-automation-request-library-3','bsiri','tm/tm.changelog-1.19.0.xml','2025-04-28 12:13:58',408,'EXECUTED','8:5cbe1b343b76e479c1690c7740b57a66','createTable tableName=AUTOMATION_REQUEST_LIBRARY_CONTENT; createIndex indexName=idx_automation_request_lib_content_content, tableName=AUTOMATION_REQUEST_LIBRARY_CONTENT; createIndex indexName=idx_automation_request_lib_content_lib, tableName=AUTOM...','The automation request library content table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.19.0-SQTM-519-automation-request-library-4','bsiri','tm/tm.changelog-1.19.0.xml','2025-04-28 12:13:59',409,'EXECUTED','8:8ab0815e2d2f628387e03680cac07cb5','addColumn tableName=PROJECT','Add a Project fk to the AutomationRequestLibrary',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.19.0-SQTM-519-automation-request-library-5','bsiri','tm/tm.changelog-1.19.0.xml','2025-04-28 12:13:59',410,'EXECUTED','8:6ff106ef30e97bcc441802c7e131a5f9','sql','Create one such library for each existing projects',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.19.0-SQTM-510-add-roles-automation','aboittiaux','tm/tm.changelog-1.19.0.xml','2025-04-28 12:13:59',411,'EXECUTED','8:a3bdb0be7bc17d10b27d23bfc7066a98','sql','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.19.0-SQTM-524-automation-workflow-by-project','jprioux','tm/tm.changelog-1.19.0.xml','2025-04-28 12:13:59',412,'EXECUTED','8:11beffcb803f2a36c49f51746e8e80bd','addColumn tableName=PROJECT','add a boolean in project table to activate or not the automation workflow',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.19.0-SQTM-create-auth-users','bsiri','tm/tm.changelog-1.19.0.xml','2025-04-28 12:13:59',413,'EXECUTED','8:de146a8d54324c093d99ec78aadced43','sql','add the missing entries in AUTH_USER for users that only exist in CORE_USER (eg a user created by LDAP)',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.19.0-Mantis-7833','jprioux','tm/tm.changelog-1.19.0.xml','2025-04-28 12:13:59',414,'EXECUTED','8:bf7e3cd98a3544c6515edcf56cc27f1a','modifyDataType columnName=REMOTE_PROJECT_ID, tableName=REQUIREMENT_SYNC_EXTENDER','Increase remote project id limit to 100 for redmine bt project keys',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.19.0-SQTM-536-autoexec-gherkin-1','bsiri','tm/tm.changelog-1.19.0.xml','2025-04-28 12:13:59',415,'EXECUTED','8:744d6d83f37e99e23cba94af126c24b5','addColumn tableName=TEST_AUTOMATION_PROJECT','Add a flag to the test automation project that tells whether it is able to run Gherkin tests.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.19.0-SQTM-543-third-party-server-1','bsiri','tm/tm.changelog-1.19.0.xml','2025-04-28 12:13:59',416,'EXECUTED','8:ce4477c2e4c807d6dc8b136dc6bba2c9','createTable tableName=THIRD_PARTY_SERVER','Create the table THIRD_PARTY_SERVER',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.19.0-SQTM-543-third-party-server-2','bsiri','tm/tm.changelog-1.19.0.xml','2025-04-28 12:13:59',417,'EXECUTED','8:f06ca5fee15abe6e10e53e2847d0a3f3','sql','migrate data from table BUGTRACKER to table THIRD_PARTY_SERVER',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.19.0-SQTM-543-third-party-server-3','bsiri','tm/tm.changelog-1.19.0.xml','2025-04-28 12:13:59',418,'EXECUTED','8:0528f96f8480293d795ddda1dd55c913','dropColumn columnName=NAME, tableName=BUGTRACKER; dropColumn columnName=URL, tableName=BUGTRACKER; dropColumn columnName=AUTH_POLICY, tableName=BUGTRACKER; dropColumn columnName=AUTH_PROTOCOL, tableName=BUGTRACKER; addForeignKeyConstraint baseTabl...','Drop the now unused columns from BUGTRACKER and create the FK from BUGTRACKER to THIRD_PARTY_SERVER',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.19.0-SQTM-543-third-party-server-4','bsiri','tm/tm.changelog-1.19.0.xml','2025-04-28 12:13:59',419,'EXECUTED','8:e97abf79dc8bc186c5d90e1ea4fe71fc','dropForeignKeyConstraint baseTableName=STORED_CREDENTIALS, constraintName=fk_stored_credentials_authenticated_server; createIndex indexName=idx_fk_stored_credentials_authenticated_server, tableName=STORED_CREDENTIALS; addForeignKeyConstraint baseT...','change the foreign key stored_credentials -> bugtracker to stored_credentials -> third_party_server',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.19.0-SQTM-534-third-party-server-5-mysql','bsiri','tm/tm.changelog-1.19.0.xml','2025-04-28 12:13:59',420,'EXECUTED','8:20978d49f03b16ebab5174b63af793a3','sql','For Mysql / Maria DB, remove the autoincrement on bugtracker_id',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.19.0-SQTM-512-scm-server-management','jlor','tm/tm.changelog-1.19.0.xml','2025-04-28 12:13:59',421,'EXECUTED','8:dc5c89d7514ccc3ed65c24da7b28c501','createTable tableName=SCM_SERVER; addForeignKeyConstraint baseTableName=SCM_SERVER, constraintName=fk_scm_server_third_party_server, referencedTableName=THIRD_PARTY_SERVER','Add new table for scm (source code management) server.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.19.0-SQTM-512-scm-repository-management','jlor','tm/tm.changelog-1.19.0.xml','2025-04-28 12:13:59',422,'EXECUTED','8:1f223494883f21790714bfbcbe72a98f','createTable tableName=SCM_REPOSITORY; addUniqueConstraint tableName=SCM_REPOSITORY','Add new table for scm (source code management) repository.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.19.0-SQTM-512-project-scm-repository-binding','jlor','tm/tm.changelog-1.19.0.xml','2025-04-28 12:13:59',423,'EXECUTED','8:51a65c795e339379daf7294e51333ef5','addColumn tableName=PROJECT','Add foreign key in project table to reference a scm (source code management) repository.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.19.0-Mantis-7547','jprioux','tm/tm.changelog-1.19.0.xml','2025-04-28 12:13:59',424,'EXECUTED','8:6126f9f59100826dc05c3555f38986a5','modifyDataType columnName=REMOTE_REQ_ID, tableName=REQUIREMENT_SYNC_EXTENDER','Increase remote req id limit to 50 for jira',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.20.0-SQUASH-5232-add-databasechangelog-new-columns','jprioux','tm/tm.changelog-1.20.0.xml','2025-04-28 12:14:00',425,'EXECUTED','8:aeea36396a9ec2a5a73082a8a593b123','sql','Add Contexts, labels and deployment_id columns to DATABASECHANGELOG Table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.20.0','jprioux','tm/tm.changelog-1.20.0.xml','2025-04-28 12:14:00',426,'EXECUTED','8:40a4910e6e1ed25cb552ea9738932b45','update tableName=CORE_CONFIG','Update TM database version number',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.20.0-TM-176-custom-report-custom-export','jlor','tm/tm.changelog-1.20.0.xml','2025-04-28 12:14:00',427,'EXECUTED','8:f7f4ef7509454043f88ab0a7e31c37cf','createTable tableName=CUSTOM_REPORT_CUSTOM_EXPORT; createIndex indexName=idx_fk_custom_export_project_id, tableName=CUSTOM_REPORT_CUSTOM_EXPORT','Create new object CustomExport in Custom Report Workspace',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.20.0-TM-125-use-tm-tree-structure-in-scm-repository','jlor','tm/tm.changelog-1.20.0.xml','2025-04-28 12:14:00',428,'EXECUTED','8:57cc3d196516127155dcb5bf59c55623','addColumn tableName=PROJECT','Add an option in Project automation settings to use the tm tree structure when transmitting test cases to a scm repository',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.20.0-TM-220-add-missing-role-automation','agu','tm/tm.changelog-1.20.0.xml','2025-04-28 12:14:00',429,'EXECUTED','8:c3fa6d2a8e11cdb916bc12fba2e614a6','sql','Add missing automation role following changeset tm-1.19.0-SQTM-510-add-roles-automation',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.20.0-TM-91-custom-export-column','jlor','tm/tm.changelog-1.20.0.xml','2025-04-28 12:14:00',430,'EXECUTED','8:8ab1ff8e93d87f1a9a392a91f2f40aee','createTable tableName=CUSTOM_EXPORT_SCOPE; createTable tableName=CUSTOM_EXPORT_COLUMN','Create new tables to store the scope and the columns of a custom export',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.20.0-TM-13-add-conflict-association-ismanual','amk','tm/tm.changelog-1.20.0.xml','2025-04-28 12:14:00',431,'EXECUTED','8:512da79f1ba13b4d90f93330f55e4857','addColumn tableName=AUTOMATION_REQUEST','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.20.0-TM-13-update-is-manual','amk','tm/tm.changelog-1.20.0.xml','2025-04-28 12:14:00',432,'EXECUTED','8:8f1f6b0e92ea901ba36e05c5e8c5f284','sql','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.20.0-TM-13-association-auto-cdt-script-auto','amk','tm/tm.changelog-1.20.0.xml','2025-04-28 12:14:00',433,'EXECUTED','8:cc29599f706535058f452efde830f808','addColumn tableName=TEST_CASE; addUniqueConstraint constraintName=uc_test_case_uuid, tableName=TEST_CASE','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.20.0-TM-13-update-uuid-mysql','amk','tm/tm.changelog-1.20.0.xml','2025-04-28 12:14:00',434,'EXECUTED','8:d7350144f0a4ef6254338b0ae64c8761','sql','generate uuid if it\'s null',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.20.0-TM-503-clean-campaign-test-plan-item-table','aguilhem','tm/tm.changelog-1.20.0.xml','2025-04-28 12:14:00',435,'EXECUTED','8:543a8baa8a796d8a02bda9e1481eb5c3','sql','Clean CAMPAIGN_TEST_PLAN_ITEM table from line with null value in CAMPAIGN_ID',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.20.0-TM-180','abo','tm/tm.changelog-1.20.0.xml','2025-04-28 12:14:00',436,'EXECUTED','8:fae81432b7f1592c40f09cc4a8a3671d','sql','Change dataType for RequirementStatus',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.20.0-TM-282-00','bsiri','tm/tm.changelog-1.20.0.xml','2025-04-28 12:14:00',437,'EXECUTED','8:1a34d66e86ff4d4792fd83f59f6b4f7e','dropForeignKeyConstraint baseTableName=CHART_DEFINITION, constraintName=fk_chart_query; dropForeignKeyConstraint baseTableName=CHART_COLUMN_PROTOTYPE, constraintName=fk_column_query; dropForeignKeyConstraint baseTableName=CHART_AXIS_COLUMN, constr...','Preparatory step : dropping foreign keys pointing to CHART_QUERY and CHART_COLUMN_PROTOTYPE.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.20.0-TM-282-01b-mysql','bsiri','tm/tm.changelog-1.20.0.xml','2025-04-28 12:14:00',438,'EXECUTED','8:354101a838039ece2fa9ef61df1babfe','renameTable newTableName=QUERY_MODEL, oldTableName=CHART_QUERY; renameTable newTableName=QUERY_COLUMN_PROTOTYPE, oldTableName=CHART_COLUMN_PROTOTYPE; renameColumn newColumnName=QUERY_MODEL_ID, oldColumnName=CHART_QUERY_ID, tableName=QUERY_MODEL; r...','Rename CHART_QUERY and CHART_COLUMN_PROTOTYPE and their primary keys',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.20.0-TM-282-01c','bsiri','tm/tm.changelog-1.20.0.xml','2025-04-28 12:14:00',439,'EXECUTED','8:0838e295a67421777980d4cf6f27687d','addNotNullConstraint columnName=LABEL, tableName=QUERY_COLUMN_PROTOTYPE; addUniqueConstraint tableName=QUERY_COLUMN_PROTOTYPE','Adding unique constraint on QUERY_COLUMN_PROTOTYPE.LABEL since its likely to act as\n  		a surrogate primary key.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.20.0-TM-282-02','bsiri','tm/tm.changelog-1.20.0.xml','2025-04-28 12:14:00',440,'EXECUTED','8:832719b04afe3992b84846699fec71c0','createTable tableName=QUERY_PROJECTION_COLUMN; createTable tableName=QUERY_AGGREGATION_COLUMN; createTable tableName=QUERY_FILTER_COLUMN; createIndex indexName=idx_query_filter, tableName=QUERY_FILTER_COLUMN; createTable tableName=QUERY_FILTER_VAL...','Create the new tables that hosts the query components.\nThis table define which columns are part of tuple returned by a query.\nThis table indicates which projected columns are aggregated on for a given query.\nThis table defines the columns on which...',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.20.0-TM-282-03','bsiri','tm/tm.changelog-1.20.0.xml','2025-04-28 12:14:00',441,'EXECUTED','8:887d59d3b19a71e685aa3b4180e9066d','sql','Now the fun part : migrate the former content into the new content',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.20.0-TM-282-04a','bsiri','tm/tm.changelog-1.20.0.xml','2025-04-28 12:14:00',442,'EXECUTED','8:5c7c1eccf7a59321ea28a78ecabf7d2e','addColumn tableName=CHART_AXIS_COLUMN; addColumn tableName=CHART_FILTER; addColumn tableName=CHART_MEASURE_COLUMN','Creating the new foreign keys from CHART_X_COLUMNS tables, to CHART_DEFINITION. Initially nullable.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.20.0-TM-282-04b','bsiri','tm/tm.changelog-1.20.0.xml','2025-04-28 12:14:00',443,'EXECUTED','8:bc982fa1e771287e287bd82f5b0f201b','sql','Populating the new foreign keys from the tables CHART_X_COLUMN  to CHART_DEFINITION',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.20.0-TM-282-04c','bsiri','tm/tm.changelog-1.20.0.xml','2025-04-28 12:14:01',444,'EXECUTED','8:fdbd961549d616f6d0a079569fe07518','sql; sql','Deleting the former referential data (that now exist in the new QUERY_X tables)\nalso delete the former QUERY_MODELs that previously had user data,\n      because now the CHART_X_COLUMNS now solely rely on their CHART_DEFINITION',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.20.0-TM-282-04d','bsiri','tm/tm.changelog-1.20.0.xml','2025-04-28 12:14:01',445,'EXECUTED','8:3ce40d83b308578a642dcc9906ca0f3d','dropColumn columnName=QUERY_ID, tableName=CHART_AXIS_COLUMN; dropColumn columnName=QUERY_ID, tableName=CHART_FILTER; dropColumn columnName=QUERY_ID, tableName=CHART_MEASURE_COLUMN; dropColumn columnName=QUERY_ID, tableName=CHART_DEFINITION','Now dropping the now useless columns that pointed to QUERY_MODEL',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.20.0-TM-282-05','bsiri','tm/tm.changelog-1.20.0.xml','2025-04-28 12:14:01',446,'EXECUTED','8:9884b527e4d8e3a558375cf9f9ce7c26','addForeignKeyConstraint baseTableName=QUERY_COLUMN_PROTOTYPE, constraintName=fk_query_col_query_model, referencedTableName=QUERY_MODEL; addForeignKeyConstraint baseTableName=CHART_COLUMN_ROLE, constraintName=fk_column_role_chart_column, referenced...','Rewiring the remaining foreign keys.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.20.0-TM-282-06','bsiri','tm/tm.changelog-1.20.0.xml','2025-04-28 12:14:01',447,'EXECUTED','8:9ae050474bd9ce20d62e8fea9039fc4e','sql','Inserting now the new columns and querymodels in the database\nFor the subqueries we have to use (w)hacky SQL. This is because we need to select-insert from no table,\n    which is supported with specific syntax by each table but aren\'t compatible t...',NULL,'4.19.0',NULL,'legacy','5842419196'),('create_index_fulltext_mysql','abo','tm/tm.changelog-1.20.0.xml','2025-04-28 12:14:01',448,'EXECUTED','8:9e6d73b1d057e921627bd735554fbdb8','sql','Create fulltext index on specific columns to search on it',NULL,'4.19.0',NULL,'legacy','5842419196'),('update_datatype_to_fulltext_search','abo','tm/tm.changelog-1.20.0.xml','2025-04-28 12:14:01',449,'EXECUTED','8:4479991d949f86f34672dd9e9cd9d400','sql','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.20.0-TM-282-delete-lastindexing-properties','jprioux','tm/tm.changelog-1.20.0.xml','2025-04-28 12:14:01',450,'EXECUTED','8:70c0bf3c3e6f269fc3e7b0cf662451de','sql','Delete all lastindexing properties from core config',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.21.0-SQUASH-5232-add-databasechangelog-new-columns','jprioux','tm/tm.changelog-1.21.0.xml','2025-04-28 12:14:01',451,'EXECUTED','8:aeea36396a9ec2a5a73082a8a593b123','sql','Add Contexts, labels and deployment_id columns to DATABASECHANGELOG Table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.21.0','jprioux','tm/tm.changelog-1.21.0.xml','2025-04-28 12:14:01',452,'EXECUTED','8:eb3feb01de277a67ff0cd5e29967db76','update tableName=CORE_CONFIG','Update TM database version number',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.21.0-TM-244-remote-automation-request-extender','jlor','tm/tm.changelog-1.21.0.xml','2025-04-28 12:14:01',453,'EXECUTED','8:d884d1b527d71e6732d90ae44a006dfe','createTable tableName=REMOTE_AUTOMATION_REQUEST_EXTENDER; createIndex indexName=idx_fk_remote_automation_request_extender_automation_request_id, tableName=REMOTE_AUTOMATION_REQUEST_EXTENDER; createIndex indexName=idx_fk_remote_automation_request_e...','Create new table for RemoteAutomationRequestExtender',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.21.0-TM-248-automation-workflow-type','jlor','tm/tm.changelog-1.21.0.xml','2025-04-28 12:14:01',454,'EXECUTED','8:929763da9d90be57088f04868ad02201','addColumn tableName=PROJECT; sql','Modify column ALLOW_AUTOMATION_WORKFLOW into AUTOMATION_WORKFLOW_TYPE',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.21.0-TM-248-plugin-type','amk','tm/tm.changelog-1.21.0.xml','2025-04-28 12:14:01',455,'EXECUTED','8:4d58d15572c268a50ac2fbddbec509f9','addColumn tableName=LIBRARY_PLUGIN_BINDING','add new column PLUGIN_TYPE into LIBRARY_PLUGIN_BINDING',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.21.0-TM-211-active','amk','tm/tm.changelog-1.21.0.xml','2025-04-28 12:14:01',456,'EXECUTED','8:240329fdd9d27baee14fd0958332c569','addColumn tableName=LIBRARY_PLUGIN_BINDING','add new column ACTIVE into LIBRARY_PLUGIN_BINDING',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.21.0-TM-649-sync-enable','api','tm/tm.changelog-1.21.0.xml','2025-04-28 12:14:01',457,'EXECUTED','8:57636328da4d9f5b75fab99241fa5eb4','addColumn tableName=REMOTE_SYNCHRONISATION','add new column Sync_Enable into REMOTE_SYNCHONISATION',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.21.0-TM-211-last-sync-date','amk','tm/tm.changelog-1.21.0.xml','2025-04-28 12:14:01',458,'EXECUTED','8:07cf71a79269ade079ea39832560652a','addColumn tableName=REMOTE_AUTOMATION_REQUEST_EXTENDER','add new column LAST-SYNC-DATE into REMOTE_AUTOMATION_REQUEST_EXTENDER',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.21.0-TM-725-add-committer-mail-in-scm-server','jlor','tm/tm.changelog-1.21.0.xml','2025-04-28 12:14:01',459,'EXECUTED','8:e051e8ad2d2a6220a258ad3240ebf823','addColumn tableName=SCM_SERVER','Add column COMMITTER_MAIL in SCM_SERVER',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.21.0-TM-713-add-axis_and_measure-to-execution_is_auto','abo','tm/tm.changelog-1.21.0.xml','2025-04-28 12:14:01',460,'EXECUTED','8:081013621cd9074ccda595855ece98c2','sql','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.21.0-TM-211-sent-value-for-sync','amk','tm/tm.changelog-1.21.0.xml','2025-04-28 12:14:01',461,'EXECUTED','8:2ef2dfed74f847f837a5b81aa7025619','addColumn tableName=REMOTE_AUTOMATION_REQUEST_EXTENDER','add new column SENT_VALUE_FOR_SYNC into REMOTE_AUTOMATION_REQUEST_EXTENDER',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.21.0-TM-916-918-synchronizable-issue-status','amk','tm/tm.changelog-1.21.0.xml','2025-04-28 12:14:01',462,'EXECUTED','8:cd8dc13f182fe565a72a4c00d95763c6','addColumn tableName=REMOTE_AUTOMATION_REQUEST_EXTENDER','add new column SYNCHRONIZABLE_ISSUE_STATUS into REMOTE_AUTOMATION_REQUEST_EXTENDER',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.21.0-TM-875-last-sync-date-squash','amk','tm/tm.changelog-1.21.0.xml','2025-04-28 12:14:01',463,'EXECUTED','8:caa74bc72f5abd3467117e5ba0887a01','addColumn tableName=REMOTE_AUTOMATION_REQUEST_EXTENDER','add new column LAST-SYNC-DATE into REMOTE_AUTOMATION_REQUEST_EXTENDER',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.21.0-TM-846.1-mysql','jlor','tm/tm.changelog-1.21.0.xml','2025-04-28 12:14:02',464,'EXECUTED','8:20f810e0edc0d3c9cda10b434a15d304','sql; addUniqueConstraint tableName=CAMPAIGN_ITERATION','MySQL - Add unique constraint on order column for iterations in campaign',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.21.0-TM-846.2-mysql','jlor','tm/tm.changelog-1.21.0.xml','2025-04-28 12:14:02',465,'EXECUTED','8:4e7fa40628e3b1331d9d1f4ee61ae87d','sql; addUniqueConstraint tableName=ITEM_TEST_PLAN_EXECUTION','MySQL - Add unique constraint on order column for executions in itpi',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.21.0-TM-846.3-mysql','jlor','tm/tm.changelog-1.21.0.xml','2025-04-28 12:14:02',466,'EXECUTED','8:ee3f3cbacf44f1577a761ed928b6f6ac','sql; addUniqueConstraint tableName=EXECUTION_EXECUTION_STEPS','MySQL - Add unique constraint on order column for steps in execution',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.21.0-TM-996-modify-entity-reference-id-type','jprioux','tm/tm.changelog-1.21.0.xml','2025-04-28 12:14:02',467,'EXECUTED','8:4820a152f32a0acb2441cd5c55d5e2a6','modifyDataType columnName=ENTITY_REFERENCE_ID, tableName=CHART_SCOPE','Modify ENTITY_REFERENCE_ID data type in CHART_SCOPE',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.22.0-SQUASH-5232-add-databasechangelog-new-columns','jprioux','tm/tm.changelog-1.22.0.xml','2025-04-28 12:14:02',468,'EXECUTED','8:aeea36396a9ec2a5a73082a8a593b123','sql','Add Contexts, labels and deployment_id columns to DATABASECHANGELOG Table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.22.0','jthebault','tm/tm.changelog-1.22.0.xml','2025-04-28 12:14:02',469,'EXECUTED','8:b0881e9c070a0a75173bd86d509cb25a','update tableName=CORE_CONFIG','Update TM database version number',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.22.0-squash-167-test-it-uuid-for-tf-side-trigger','edegenetais','tm/tm.changelog-1.22.0.xml','2025-04-28 12:14:02',470,'EXECUTED','8:cb55e1be7759db53ef699f33ecf14b6b','addColumn tableName=ITERATION; addUniqueConstraint constraintName=uc_iteration_uuid, tableName=ITERATION','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.22.0-squash-167-update-iteration-uuid-mysql','edegenetais','tm/tm.changelog-1.22.0.xml','2025-04-28 12:14:02',471,'EXECUTED','8:97ee959eb14b87fce015a7304edb4329','sql','Created missing UUIDs on upgrade to add the not-null constraint.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.22.0-SQUASH-174-action-word-table','jlor','tm/tm.changelog-1.22.0.xml','2025-04-28 12:14:02',472,'EXECUTED','8:9b22e3a2765e31b9300ba49843d31cda','createTable tableName=ACTION_WORD; createIndex indexName=idx_fk_action_word_project, tableName=ACTION_WORD; addUniqueConstraint constraintName=uc_aw_token_project_id, tableName=ACTION_WORD','Add action word table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.22.0-SQUASH-174-keyword-test-step-table','jlor','tm/tm.changelog-1.22.0.xml','2025-04-28 12:14:02',473,'EXECUTED','8:9ea4af57ac8717e4d6e9cbb765ba10a3','createTable tableName=KEYWORD_TEST_STEP; createIndex indexName=idx_fk_keyword_test_step_action_word, tableName=KEYWORD_TEST_STEP','Add keyword test step table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.22.0-SQUASH-174-update-query-filter','jlor','tm/tm.changelog-1.22.0.xml','2025-04-28 12:14:02',474,'EXECUTED','8:f73428381928dfb4b5c813c715ea5b36','sql; sql','Changes in QueryBuilder related tables concerning TEST_CASE_CALLSTEPCOUNT prototype column: adding a new subclass of TestStep (KeywordTestStep) broke the QueryBuilder',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.22.0-TEST_CASE_HIERARCHY_MODIFICATION','jlor','tm/tm.changelog-1.22.0.xml','2025-04-28 12:14:02',475,'EXECUTED','8:c1de3a0f1654209d41c56f4a0ced4cf0','createTable tableName=KEYWORD_TEST_CASE; dropColumn columnName=SCRIPTED_TC_EXTENDER_ID, tableName=SCRIPTED_TC_EXTENDER; renameTable newTableName=SCRIPTED_TEST_CASE, oldTableName=SCRIPTED_TC_EXTENDER; dropForeignKeyConstraint baseTableName=SCRIPTED...','Create KEYWORD_TEST_CASE table. Update SCRIPTED_TC_EXTENDER table/column',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.22.0-SQUASH-325-update-tc-kind-column-prototype','jlor','tm/tm.changelog-1.22.0.xml','2025-04-28 12:14:02',476,'EXECUTED','8:19a7c2029b3655a03380376c7ee16a34','sql','In QueryColumnPrototype table, at TestCaseKind line, change data_type column value from Level_enum to Entity',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.22.0-SQUASH-325-drop-tc-kind-column','jlor','tm/tm.changelog-1.22.0.xml','2025-04-28 12:14:02',477,'EXECUTED','8:4301a9f6570c32fb97dc2adf1def1008','dropColumn columnName=TC_KIND, tableName=TEST_CASE','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.22.0-SQUASH-325-drop-language-column-in-scripted-tc','jlor','tm/tm.changelog-1.22.0.xml','2025-04-28 12:14:02',478,'EXECUTED','8:02a9a59bb06bf18ebf59e78d9d8473f6','dropColumn columnName=LANGUAGE, tableName=SCRIPTED_TEST_CASE','LANGUAGE is no longer necessary for ScriptedTestCase, as it is always GHERKIN.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.22.0-squash-421-add-test-suite-uuid','aguilhem','tm/tm.changelog-1.22.0.xml','2025-04-28 12:14:02',479,'EXECUTED','8:509ab177ee49be7eda3b756e636500c2','addColumn tableName=TEST_SUITE; addUniqueConstraint constraintName=uc_test_suite_uuid, tableName=TEST_SUITE','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.22.0-squash-421-update-test-suite-uuid-mysql','aguilhem','tm/tm.changelog-1.22.0.xml','2025-04-28 12:14:02',480,'EXECUTED','8:5d54095afb8aee7def6d702b5361149c','sql','Created missing UUIDs on upgrade to add the not-null constraint.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.22.0-SQUASH-325-EXECUTION_HIERARCHY_MODIFICATION','jlor','tm/tm.changelog-1.22.0.xml','2025-04-28 12:14:03',481,'EXECUTED','8:06fcfa3a3c883a223c1adbe236167088','renameTable newTableName=SCRIPTED_EXECUTION, oldTableName=SCRIPTED_EXECUTION_EXTENDER; dropColumn columnName=SCRIPTED_EXECUTION_EXTENDER_ID, tableName=SCRIPTED_EXECUTION; addPrimaryKey tableName=SCRIPTED_EXECUTION; dropColumn columnName=LANGUAGE, ...','Create KEYWORD_EXECUTION table. Update SCRIPTED_EXECUTION_EXTENDER table/column.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.22.0-SQUASH-350-PARAMETER_IN_ACTION_WORD','qtran','tm/tm.changelog-1.22.0.xml','2025-04-28 12:14:03',482,'EXECUTED','8:80490faa749274bfe39edad0ff1b28cd','createTable tableName=ACTION_WORD_FRAGMENT; createIndex indexName=idx_fk_action_word_fragment_action_word_id, tableName=ACTION_WORD_FRAGMENT; addUniqueConstraint constraintName=uc_action_word_fragment_order, tableName=ACTION_WORD_FRAGMENT; createT...','Create ACTION_WORD_FRAGMENT table\nCreate new table for Action word text elements\nCreate new table for Action word parameter elements\nCreate new table for Action word parameter value',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.22.0-SQUASH-302-action-word-workspace','jlor','tm/tm.changelog-1.22.0.xml','2025-04-28 12:14:03',483,'EXECUTED','8:357323374c8bd4022311dccdc360f8de','createTable tableName=ACTION_WORD_LIBRARY; createIndex indexName=idx_action_word_library, tableName=ACTION_WORD_LIBRARY; createIndex indexName=idx_fk_awl_attachment_list, tableName=ACTION_WORD_LIBRARY; sql; addColumn tableName=PROJECT; createIndex...','Create action word library table\nInsert corresponding entries in ACL tables\nAdd foreign key to the library in a project\nCreate one action word library for each existing project',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.22.0-SQUASH-302-action-word-workspace-2','jlor','tm/tm.changelog-1.22.0.xml','2025-04-28 12:14:03',484,'EXECUTED','8:a8b4c9d2a4a0d9192a220a0cf5bac889','createTable tableName=ACTION_WORD_LIBRARY_NODE; createIndex indexName=idx_action_word_library_node, tableName=ACTION_WORD_LIBRARY_NODE; createIndex indexName=idx_fk_awln_awl, tableName=ACTION_WORD_LIBRARY_NODE; sql; createTable tableName=AWLN_RELA...','Create action word library node table\nCreate one action word library node for each library created\nCreate action word library node relationship table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.22.0-SQUASH-794-auditable-automated-suite','aguilhem','tm/tm.changelog-1.22.0.xml','2025-04-28 12:14:03',485,'EXECUTED','8:89c3edca29fb9158d99f47df8644e662','addColumn tableName=AUTOMATED_SUITE; addColumn tableName=AUTOMATED_SUITE; addColumn tableName=AUTOMATED_SUITE; addColumn tableName=AUTOMATED_SUITE','Make Automated Suite auditable',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.22.0-SQUASH-794-automated-suite-migration-mysql','aguilhem','tm/tm.changelog-1.22.0.xml','2025-04-28 12:14:03',486,'EXECUTED','8:1b6acb827f4de7609109c660d2b81581','sql','Add audit data on automated suite for mysql',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.22.0-SQUASH-795','aguilhem','tm/tm.changelog-1.22.0.xml','2025-04-28 12:14:03',487,'EXECUTED','8:2545fb692f41e233d959e25f061768bd','addColumn tableName=AUTOMATED_SUITE','Adds a execution status field to the automated suites',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.22.0-SQUASH-795-migration-mysql','aguilhem','tm/tm.changelog-1.22.0.xml','2025-04-28 12:14:03',488,'EXECUTED','8:ed56340d2b40dff22b2ed9fffaf528f4','sql','Compute preexisting automated suites status for mysql',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.22.0-SQUASH-896-add-indexes-for-search-sort-columns','jprioux','tm/tm.changelog-1.22.0.xml','2025-04-28 12:14:04',489,'EXECUTED','8:ddd3e53dd0db6e2388b067f003d2af0c','createIndex indexName=idx_project_name, tableName=PROJECT; createIndex indexName=idx_tc_reference, tableName=TEST_CASE; createIndex indexName=idx_tc_importance, tableName=TEST_CASE; createIndex indexName=idx_req_reference, tableName=REQUIREMENT_VE...','add indexes on default search sort columns',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.22.0-SQUASH-891','aguilhem','tm/tm.changelog-1.22.0.xml','2025-04-28 12:14:04',490,'EXECUTED','8:3c63dafa6caa65c87bf1c2fb2e276184','addColumn tableName=AUTOMATED_SUITE','Automated Suite can be directly linked to an iteration or a test suite',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.22.0-SQUASH-291-bdd-impl-techno-and-language','jlor','tm/tm.changelog-1.22.0.xml','2025-04-28 12:14:04',491,'EXECUTED','8:e6b7e355cdf35114da07e367b3f8a4b1','addColumn tableName=PROJECT','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.22.0-SQUASH-306-create-closure-table','mqtran','tm/tm.changelog-1.22.0.xml','2025-04-28 12:14:04',492,'EXECUTED','8:06bcc0cfcc52a9439894246fb1e2e7d7','createTable tableName=AWLN_RELATIONSHIP_CLOSURE; createIndex indexName=idx_awln_relationship_clos_desc, tableName=AWLN_RELATIONSHIP_CLOSURE; createIndex indexName=idx_awln_relationship_clos_anc, tableName=AWLN_RELATIONSHIP_CLOSURE; addUniqueConstr...','closure table for action word library nodes. Its content is set and modified by 4 triggers',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.22.0-SQUASH-306-closure-mysql-trigger','mqtran','tm/tm.changelog-1.22.0.xml','2025-04-28 12:14:04',493,'EXECUTED','8:99c94bd8dee7684f5708cbdd8be51714','sql; sql; sql; sql','mysql-triggers for AWLN_RELATIONSHIP_CLOSURE table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.22.0-SQUASH-1107-aw-last-impl-techno-and-date','jlor','tm/tm.changelog-1.22.0.xml','2025-04-28 12:14:04',494,'EXECUTED','8:fa4f55442bdc4ef925b0f0f7b47241e6','addColumn tableName=ACTION_WORD','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.22.0-SQUASH-1284-migration-mysql','qtran','tm/tm.changelog-1.22.0.xml','2025-04-28 12:14:04',495,'EXECUTED','8:844ad09002420d65905a1f0cb00722a0','sql; sql; sql','Remove all CUF values and CUF value options attaching to any deleted Test Case folder for postgresql\nRemove all CUF values and CUF value options attaching to any deleted Campaign folder for postgresql\nRemove all CUF values and CUF value options at...',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.22.0-SQUASH-1466-test-case-source-code-repository-url','akatz','tm/tm.changelog-1.22.0.xml','2025-04-28 12:14:04',496,'EXECUTED','8:424581cf54ca82b5e98d6b7a11d5ece9','addColumn tableName=TEST_CASE','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.22.0-SQUASH-1975-automation-server-migration-1','aguilhem','tm/tm.changelog-1.22.0.xml','2025-04-28 12:14:04',497,'EXECUTED','8:2abe3a47754f5fabba4f030020b0b6e3','createTable tableName=MIG_SQUASH_1975; dropForeignKeyConstraint baseTableName=TEST_AUTOMATION_PROJECT, constraintName=fk_ta_project_ta_server; dropForeignKeyConstraint baseTableName=PROJECT, constraintName=tm_project_ta_server; sql','Preparation for data migration',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.22.0-SQUASH-1975-automation-server-migration-2-mysql','aguilhem','tm/tm.changelog-1.22.0.xml','2025-04-28 12:14:04',498,'EXECUTED','8:7e59a4918ea64e2b44459c1ac6fce782','sql','Transform Test Automation Server to Third Party Server',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.22.0-SQUASH-1975-automation-server-migration-3','aguilhem','tm/tm.changelog-1.22.0.xml','2025-04-28 12:14:04',499,'EXECUTED','8:54e999b15137f7b0ea516c8f04d4aefe','dropUniqueConstraint constraintName=UNI_AUTOTEST_SERVER, tableName=TEST_AUTOMATION_SERVER; dropColumn columnName=NAME, tableName=TEST_AUTOMATION_SERVER; dropColumn columnName=BASE_URL, tableName=TEST_AUTOMATION_SERVER; dropColumn columnName=LOGIN,...','Finalisation of test automation server data migration',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.22.0-SQUASH-1975-automation-server-migration-4-mysql','aguilhem','tm/tm.changelog-1.22.0.xml','2025-04-28 12:14:04',500,'EXECUTED','8:3c57a8bd44361b4d2a171cccef22573e','sql','For Mysql / Maria DB, remove the autoincrement on server_id',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.22.0-SQUASH-808-automated-suites-lifetime','jlor','tm/tm.changelog-1.22.0.xml','2025-04-28 12:14:04',501,'EXECUTED','8:686610a61a21f666f4433fe91d6d4f37','addColumn tableName=PROJECT','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.22.0-SQUASH-2032-fix-null-description-in-requirement','jlor','tm/tm.changelog-1.22.0.xml','2025-04-28 12:14:04',502,'EXECUTED','8:016cf5b75e98acf9ad9a2156392d1158','sql','Replace null descriptions by empty strings in requirements',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.22.0-SQUASH-2106-automated-suite-attachment','aguilhem','tm/tm.changelog-1.22.0.xml','2025-04-28 12:14:04',503,'EXECUTED','8:3a1e95ebd72330ea10047f0e5eb063b0','addColumn tableName=AUTOMATED_SUITE','Give possibility to AUTOMATED_SUITE to have ATTACHMENT',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.22.0-SQUASH-2106-automated-suite-attachment-2','aguilhem','tm/tm.changelog-1.22.0.xml','2025-04-28 12:14:04',504,'EXECUTED','8:1f936d07cc345e9989ad30ba2003bd60','sql','Create one attachment list for each automated suite',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.22.0-SQUASH-2141-automated-test-technology','aguilhem','tm/tm.changelog-1.22.0.xml','2025-04-28 12:14:05',505,'EXECUTED','8:0004b1046102aac90079cfed96744a61','createTable tableName=AUTOMATED_TEST_TECHNOLOGY; sql; addColumn tableName=TEST_CASE','create automated test technology table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.22.0.SQUASH-1596-autocnnect-on-connection-config','jprioux','tm/tm.changelog-1.22.0.xml','2025-04-28 12:14:05',506,'EXECUTED','8:3a759e92d54d14ea83f54ec05c7e9e90','insert tableName=CORE_CONFIG','add system parameter for autoconnect on connection configuration',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.22.2-SQUASH-5232-add-databasechangelog-new-columns','jprioux','tm/tm.changelog-1.22.2.xml','2025-04-28 12:14:05',507,'EXECUTED','8:aeea36396a9ec2a5a73082a8a593b123','sql','Add Contexts, labels and deployment_id columns to DATABASECHANGELOG Table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.22.2','jprioux','tm/tm.changelog-1.22.2.xml','2025-04-28 12:14:05',508,'EXECUTED','8:1d09c980a897f71d3d73c0ca2c47ce70','update tableName=CORE_CONFIG','Update TM database version number',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.22.2-SQUASH-2701-1-add-tc-scm-repository-id-column','jprioux','tm/tm.changelog-1.22.2.xml','2025-04-28 12:14:05',509,'EXECUTED','8:fd3c66d334caa1b7a5d6069caf9439ab','addColumn tableName=TEST_CASE; createIndex indexName=idx_fk_tc_scm_repository, tableName=TEST_CASE','Add a new column in test case for link to scm repository',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.22.2-SQUASH-2701-2-scm-repository-url-temporary-table','jprioux','tm/tm.changelog-1.22.2.xml','2025-04-28 12:14:05',510,'EXECUTED','8:2847aa4932eaed45bfa918715620ac19','createTable tableName=SCM_REPOSITORY_URL_MIGRATION_TEMP','Create temporary table for migration',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.22.2-SQUASH-2701-3-mysql-migration-for-scm-repo-url','jprioux','tm/tm.changelog-1.22.2.xml','2025-04-28 12:14:05',511,'EXECUTED','8:e601c8de15c2cbd7147a13ad12a181eb','sql; sql; sql; sql; sql','Migration part if scm repository url has been added in tc',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.22.2-SQUASH-2701-4-drop-old-column-and-temp-table','jprioux','tm/tm.changelog-1.22.2.xml','2025-04-28 12:14:05',512,'EXECUTED','8:f96bcbcab7834eff17cc6da7d75d0b1d','dropColumn columnName=SOURCE_CODE_REPOSITORY_URL, tableName=TEST_CASE; dropTable tableName=SCM_REPOSITORY_URL_MIGRATION_TEMP','Drop unnecessary old column and the temporary table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.22.2-SQUASH-2834-modify-scm-repo-unique-constraint','jlor','tm/tm.changelog-1.22.2.xml','2025-04-28 12:14:05',513,'EXECUTED','8:9be1e9071813ddbb3900c7789932d3ae','createTable tableName=SCM_REPOSITORY_DATA_TEMP; sql; dropForeignKeyConstraint baseTableName=PROJECT, constraintName=fk_project_scm_repository; dropForeignKeyConstraint baseTableName=TEST_CASE, constraintName=fk_tc_scm_repository; dropTable tableNa...','Modify SCM_REPOSITORY unique constraint (name, server_id) to (name, working_branch, server_id)',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.22.2-add-auto-test-tech','aguilhem','tm/tm.changelog-1.22.2.xml','2025-04-28 12:14:05',514,'EXECUTED','8:bfa1aaf9176fea66ebdcbf35bf9601a8','sql','Add new compatible auto. test tech.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.22.3-SQUASH-5232-add-databasechangelog-new-columns','jprioux','tm/tm.changelog-1.22.3.xml','2025-04-28 12:14:05',515,'EXECUTED','8:aeea36396a9ec2a5a73082a8a593b123','sql','Add Contexts, labels and deployment_id columns to DATABASECHANGELOG Table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.22.3','abo','tm/tm.changelog-1.22.3.xml','2025-04-28 12:14:05',516,'EXECUTED','8:af6bd86e995970c48070cb1e1c13a42c','update tableName=CORE_CONFIG','Update TM database version number',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.22.3-grant-waa-permission-on-tc-to-atw','abo','tm/tm.changelog-1.22.3.xml','2025-04-28 12:14:05',517,'EXECUTED','8:1695dc83448c8af047c88cad9136fa23','sql','Grant WRITE AS AUTOMATION permission on test case to automation test writer',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.22.5-SQUASH-5232-add-databasechangelog-new-columns','jprioux','tm/tm.changelog-1.22.5.xml','2025-04-28 12:14:05',518,'EXECUTED','8:aeea36396a9ec2a5a73082a8a593b123','sql','Add Contexts, labels and deployment_id columns to DATABASECHANGELOG Table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.22.5','agu','tm/tm.changelog-1.22.5.xml','2025-04-28 12:14:05',519,'EXECUTED','8:63b73c08d86b5a6b1ad3a371b25517a6','update tableName=CORE_CONFIG','Update TM database version number',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-1.22.5-add-skf-auto-test-tech','aguilhem','tm/tm.changelog-1.22.5.xml','2025-04-28 12:14:05',520,'EXECUTED','8:3213d65b3721fa769d9788f6fc8baa0e','sql','Add SKF to compatible auto. test tech.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-2.0.0-SQUASH-5232-add-databasechangelog-new-columns','jprioux','tm/tm.changelog-2.00.0.xml','2025-04-28 12:14:05',521,'EXECUTED','8:aeea36396a9ec2a5a73082a8a593b123','sql','Add Contexts, labels and deployment_id columns to DATABASECHANGELOG Table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-2.00.0','jthebault','tm/tm.changelog-2.00.0.xml','2025-04-28 12:14:05',522,'EXECUTED','8:a825b30fff38e2efedfd83294c39b4bb','sql; update tableName=CORE_CONFIG','Add Contexts, labels and deployment_id columns to DATABASECHANGELOG Table\nUpdate TM database version number',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-2.00.0-fix-missing-indexes','jthebault','tm/tm.changelog-2.00.0.xml','2025-04-28 12:14:06',523,'EXECUTED','8:0fa23315b4723e8ada698ed92f6fde51','createIndex indexName=idx_rln_created_by, tableName=REQUIREMENT_LIBRARY_NODE; createIndex indexName=idx_rln_last_modified_by, tableName=REQUIREMENT_LIBRARY_NODE; createIndex indexName=idx_tcln_created_by, tableName=TEST_CASE_LIBRARY_NODE; createIn...','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-2.00.0-update-default-test-case-nature-icon-name','aboittiaux','tm/tm.changelog-2.00.0.xml','2025-04-28 12:14:06',524,'EXECUTED','8:8e21e8667030f50886d49d42cc1ff565','sql','Change default tc nature icons',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-2.00.0-update-default-test-case-type-icon-name','aboittiaux','tm/tm.changelog-2.00.0.xml','2025-04-28 12:14:06',525,'EXECUTED','8:728c6a9327901a02b3e071a758d460d1','sql','Change default tc type icons',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-2.00.0-update-default-requirement-category-icon-name','aboittiaux','tm/tm.changelog-2.00.0.xml','2025-04-28 12:14:06',526,'EXECUTED','8:3b7c9340baecc4c5d4005df2b61be813','sql','Change default requirement category icons',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-2.00.0-update-custom-infolist-icon-name','aboittiaux','tm/tm.changelog-2.00.0.xml','2025-04-28 12:14:06',527,'EXECUTED','8:2702bbf2ef02825046f13812e3b21369','createIndex indexName=idx_info_list_item_icon_name_temp, tableName=INFO_LIST_ITEM; sql; dropIndex indexName=idx_info_list_item_icon_name_temp, tableName=INFO_LIST_ITEM','Change infolist item icons',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-2.00.0-update-execution-tc-nat-icon-name','aboittiaux','tm/tm.changelog-2.00.0.xml','2025-04-28 12:14:06',528,'EXECUTED','8:da5ca52c754665dc5e7a0914c211a182','createIndex indexName=idx_exec_tc_nat_icon_name_temp, tableName=EXECUTION; createIndex indexName=idx_exec_tc_nat_code_temp, tableName=EXECUTION; sql; dropIndex indexName=idx_exec_tc_nat_icon_name_temp, tableName=EXECUTION; dropIndex indexName=idx_...','Change execution tc nat icon name',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-2.00.0-update-execution-tc-typ-icon-name','aboittiaux','tm/tm.changelog-2.00.0.xml','2025-04-28 12:14:06',529,'EXECUTED','8:6936047ac4dc1fd64de93ce250aa272a','createIndex indexName=idx_exec_tc_typ_icon_name_temp, tableName=EXECUTION; createIndex indexName=idx_exec_tc_typ_code_temp, tableName=EXECUTION; sql; dropIndex indexName=idx_exec_tc_typ_icon_name_temp, tableName=EXECUTION; dropIndex indexName=idx_...','Change execution tc typ icon name',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-2.00.0-grant-attach-permission-on-projects-to-pms','pckerneis','tm/tm.changelog-2.00.0.xml','2025-04-28 12:14:06',530,'EXECUTED','8:fab951e5be1a6abbdeda2f0ab7bdb3ef','sql','Grant ATTACH permission on projects to project managers',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-2.00.0-missing-entries-in-awln_relationship_closure','jlor','tm/tm.changelog-2.00.0.xml','2025-04-28 12:14:06',531,'EXECUTED','8:43287961f9dd755fe8da39bfc5d09c7a','sql','insert missing entries in awln_relationship_closure: former projects data were not inserted.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-2.00.0-grant-read-permission-on-projects-to-atw','abo','tm/tm.changelog-2.00.0.xml','2025-04-28 12:14:06',532,'EXECUTED','8:244707d9175446e17e41de62745396ee','sql','Grant READ permission on projects to automation test writer',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-2.00.0-fix-resource-missing-indexes','jthebault','tm/tm.changelog-2.00.0.xml','2025-04-28 12:14:06',533,'EXECUTED','8:be2dd0b9c7be8c624c5680eca0717f21','createIndex indexName=idx_resource_created_by, tableName=RESOURCE; createIndex indexName=idx_resource_last_modified_by, tableName=RESOURCE; createIndex indexName=idx_resource_name, tableName=RESOURCE','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-2.00.0-change-item_test_plan_lastexecby-entity-type','jthebault','tm/tm.changelog-2.00.0.xml','2025-04-28 12:14:06',534,'EXECUTED','8:f19960fbaf5bbd347ed3424f4e8b8a88','sql','Fix sort on ITEM_TEST_PLAN_LASTEXECBY column - issue 3768',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-2.00.0-add-dataset-name-column-prototype','jthebault','tm/tm.changelog-2.00.0.xml','2025-04-28 12:14:06',535,'EXECUTED','8:b554be85fc5bd66e2885a094f79775ae','sql','Fix sort on ITEM_TEST_PLAN_DATASET_LABEL column - issue 3988',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-2.1.0-SQUASH-5232-add-databasechangelog-new-columns','jprioux','tm/tm.changelog-2.1.0.xml','2025-04-28 12:14:06',536,'EXECUTED','8:aeea36396a9ec2a5a73082a8a593b123','sql','Add Contexts, labels and deployment_id columns to DATABASECHANGELOG Table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-2.1.0','dclaerhout','tm/tm.changelog-2.1.0.xml','2025-04-28 12:14:06',537,'EXECUTED','8:58af94593b5537caa99340aa72618824','update tableName=CORE_CONFIG','Update TM database version number',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-2.1.0-add-remote-req-perimeter-status','dclaerhout','tm/tm.changelog-2.1.0.xml','2025-04-28 12:14:06',538,'EXECUTED','8:692f8c68acac6e331b0a29eb8c086a4d','addColumn tableName=REQUIREMENT_SYNC_EXTENDER','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-2.1.0-SQUASH-4052-delete-owner-in-report-and-chart','jprioux','tm/tm.changelog-2.1.0.xml','2025-04-28 12:14:06',539,'EXECUTED','8:7742eb5108ca31bae3ac8987b55f2a92','dropForeignKeyConstraint baseTableName=CHART_DEFINITION, constraintName=fk_chart_owner; dropColumn columnName=USER_ID, tableName=CHART_DEFINITION; dropForeignKeyConstraint baseTableName=REPORT_DEFINITION, constraintName=fk_report_owner; dropColumn...','Remove the USER_ID columns and associated foreign keys',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-2.1.0-add-template-configurable-plugin-binding','pckerneis','tm/tm.changelog-2.1.0.xml','2025-04-28 12:14:06',540,'EXECUTED','8:94099c234b0589cdc0de65e2700f67c6','createTable tableName=TEMPLATE_CONFIGURABLE_PLUGIN_BINDING','Add the template_configurable_plugin_binding table.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-3.0.0-SQUASH-5232-add-databasechangelog-new-columns','jprioux','tm/tm.changelog-3.0.0.xml','2025-04-28 12:14:06',541,'EXECUTED','8:aeea36396a9ec2a5a73082a8a593b123','sql','Add Contexts, labels and deployment_id columns to DATABASECHANGELOG Table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-3.0.0','jprioux','tm/tm.changelog-3.0.0.xml','2025-04-28 12:14:06',542,'EXECUTED','8:9254911af0917cdffe1fae5d26ededaa','update tableName=CORE_CONFIG','Update TM database version number',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-3.0.0-SQUASH-4293-update-execution-nat-and-typ-icon-name','jprioux','tm/tm.changelog-3.0.0.xml','2025-04-28 12:14:06',543,'EXECUTED','8:ce9cc7b5d5edf3f2464876428719a92d','createIndex indexName=idx_exec_tc_nat_code_temp, tableName=EXECUTION; createIndex indexName=idx_exec_tc_typ_code_temp, tableName=EXECUTION; sql; dropIndex indexName=idx_exec_tc_nat_code_temp, tableName=EXECUTION; dropIndex indexName=idx_exec_tc_ty...','Update nature and type icon name for execution with native info list',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-3.0.0-increase-varchar-number-for-dataset-param-value','dclaerhout','tm/tm.changelog-3.0.0.xml','2025-04-28 12:14:07',544,'EXECUTED','8:412f61602b04daa0d1ef4fddb206e7c1','modifyDataType columnName=PARAM_VALUE, tableName=DATASET_PARAM_VALUE; addNotNullConstraint columnName=PARAM_VALUE, tableName=DATASET_PARAM_VALUE; addDefaultValue columnName=PARAM_VALUE, tableName=DATASET_PARAM_VALUE','Change varchar from 255 to 1024 for dataset param value',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-3.0.0-SQUASH-4299-update-def-icon-name-001','jprioux','tm/tm.changelog-3.0.0.xml','2025-04-28 12:14:07',545,'EXECUTED','8:e32b9db731ddcc8b919467de6bfb6aa4','createIndex indexName=idx_info_list_item_icon_name_temp, tableName=INFO_LIST_ITEM; sql; dropIndex indexName=idx_info_list_item_icon_name_temp, tableName=INFO_LIST_ITEM','Update all def icon name when used in info list item',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-3.0.0-SQUASH-4299-update-def-icon-name-002','jprioux','tm/tm.changelog-3.0.0.xml','2025-04-28 12:14:07',546,'EXECUTED','8:004dced576c006518dee7d135d6a892f','createIndex indexName=idx_exec_tc_nat_icon_name_temp, tableName=EXECUTION; sql; dropIndex indexName=idx_exec_tc_nat_icon_name_temp, tableName=EXECUTION','Update all def icon name when used in tc nat execution',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-3.0.0-SQUASH-4299-update-def-icon-name-003','jprioux','tm/tm.changelog-3.0.0.xml','2025-04-28 12:14:07',547,'EXECUTED','8:6dc0390299da83f2394166d22ec2a521','createIndex indexName=idx_exec_tc_typ_icon_name_temp, tableName=EXECUTION; sql; dropIndex indexName=idx_exec_tc_typ_icon_name_temp, tableName=EXECUTION','Update all def icon name when used in tc type execution',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-3.0.0-SQMAP-636-add-new-attributes-to-custom-chart','dclaerhout','tm/tm.changelog-3.0.0.xml','2025-04-28 12:14:07',548,'EXECUTED','8:4b3258866993dcd3dcdf54efe16d6d4d','update tableName=QUERY_COLUMN_PROTOTYPE; update tableName=QUERY_COLUMN_PROTOTYPE; sql; sql; sql; sql; sql; sql; sql; sql; sql; sql; sql','Add new attributes concerning test cases to generate custom charts',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-3.0.0-SQUASH-4310-create-delete-working-table','jthebault','tm/tm.changelog-3.0.0.xml','2025-04-28 12:14:07',549,'EXECUTED','8:86bc0ae3fb7afdbac79014f8cfcacf0b','createTable tableName=WORK_DELETE_ENTITIES; createIndex indexName=work_delete_entities_entity_type_idx, tableName=WORK_DELETE_ENTITIES; createIndex indexName=work_delete_entities_entity_id_idx, tableName=WORK_DELETE_ENTITIES; createIndex indexName...','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-3.0.0-add-bt-project-reference-in-issue','jthebault','tm/tm.changelog-3.0.0.xml','2025-04-28 12:14:07',550,'EXECUTED','8:bc71f44e17c49046a2f7a665ed29c0fa','addColumn tableName=ISSUE; createIndex indexName=issue_remote_issue_id_idx, tableName=ISSUE','Changing the type to allow storage of large jsonified object, without using jsonb for backward compat',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-3.0.0-TM-632-01-add-high-lvl-req-table','jthebault','tm/tm.changelog-3.0.0.xml','2025-04-28 12:14:07',551,'EXECUTED','8:5bb19cfcfa3c1a84806c2884e15bf4c3','createTable tableName=HIGH_LEVEL_REQUIREMENT','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-3.0.0-TM-632-02-add-query-column-proto','jthebault','tm/tm.changelog-3.0.0.xml','2025-04-28 12:14:07',552,'EXECUTED','8:ca600dfdb9b6b41aa24c4503d60a2448','sql','Inserting column proto for high level requirements',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-3.0.0-TM-632-03-add-high-lvl-req-reference','jthebault','tm/tm.changelog-3.0.0.xml','2025-04-28 12:14:07',553,'EXECUTED','8:47f7ed5dee2f57838291212d723c51b6','addColumn tableName=REQUIREMENT','add reference column to allow requirement to be linked to high level requirements',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-3.0.0-SQUASH-4196-add-new-attributes-to-requirement-search','dclaerhout','tm/tm.changelog-3.0.0.xml','2025-04-28 12:14:07',554,'EXECUTED','8:cb590fdfcfaa788d30085cdcf1835437','sql; sql; sql; sql; sql','Add new attributes for high level requirement in search',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-3.0.0-SQUASH-4436-add-automated_test_technologies','pckerneis','tm/tm.changelog-3.0.0.xml','2025-04-28 12:14:07',555,'EXECUTED','8:d6978b6d4a1c68fe50b6e304ab8d1738','sql; sql','Add automated test technologies (Cucumber 5+ and Postman)',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-3.0.0-SQUASH-4584-apply_InfoList_default_value','cduvigneau','tm/tm.changelog-3.0.0.xml','2025-04-28 12:14:07',556,'EXECUTED','8:03834030f6b7da3ced9f2d64c5bbb964','sql','Set InfoList default value for old Test Case and Requirement',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-3.0.0-SQUASH-4436-add-premium-column','pckerneis','tm/tm.changelog-3.0.0.xml','2025-04-28 12:14:07',557,'EXECUTED','8:a218dea8a3efc6882bd40c170f647e2c','addColumn tableName=AUTOMATED_TEST_TECHNOLOGY; update tableName=AUTOMATED_TEST_TECHNOLOGY; update tableName=AUTOMATED_TEST_TECHNOLOGY; update tableName=AUTOMATED_TEST_TECHNOLOGY; update tableName=AUTOMATED_TEST_TECHNOLOGY','Add \'premium\' column for test technologies',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-4.0.0-SQUASH-5232-add-databasechangelog-new-columns','jprioux','tm/tm.changelog-4.0.0.xml','2025-04-28 12:14:07',558,'EXECUTED','8:aeea36396a9ec2a5a73082a8a593b123','sql','Add Contexts, labels and deployment_id columns to DATABASECHANGELOG Table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-4.0.0','jlor','tm/tm.changelog-4.0.0.xml','2025-04-28 12:14:07',559,'EXECUTED','8:025f887ac0f9e3e270627db101013aa0','update tableName=CORE_CONFIG','Update TM database version number',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-4.0.0-squash-4931-projects-data-migration','jlor','tm/tm.changelog-4.0.0.xml','2025-04-28 12:14:07',560,'EXECUTED','8:475f0a521671864f5e605ab2289c8831','update tableName=PROJECT','Migrate PROJECT.BDD_IMPLEMENTATION_TECHNOLOGY from value \'CUCUMBER\' to \'CUCUMBER_4\'',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-4.0.0-squash-4931-projects-default-value-modification','jlor','tm/tm.changelog-4.0.0.xml','2025-04-28 12:14:07',561,'EXECUTED','8:2c1b71469d4348feecc17ae521bbc030','addDefaultValue columnName=BDD_IMPLEMENTATION_TECHNOLOGY, tableName=PROJECT','Modify default value of PROJECT.BDD_IMPLEMENTATION_TECHNOLOGY from value \'CUCUMBER\' to \'CUCUMBER_5_PLUS\'',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-4.0.0-squash-4931-action-words-data-migration','jlor','tm/tm.changelog-4.0.0.xml','2025-04-28 12:14:07',562,'EXECUTED','8:0b655a20f2467fba73a1e177ca742c28','update tableName=ACTION_WORD','Migrate ACTION_WORD.LAST_IMPLEMENTATION_TECHNOLOGY from value \'CUCUMBER\' to \'CUCUMBER_4\'',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-4.0.0-squash-5025-token-auth-migration-for-mantis','bms','tm/tm.changelog-4.0.0.xml','2025-04-28 12:14:07',563,'EXECUTED','8:07a476b6374767f3d4851a834c9934a4','sql','Migrate BASIC_AUTH TO TOKEN_AUTH in third_party_server table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-4.0.0-squash-5035-add-owner-column-to-remote-synchronisation','cduvigneau','tm/tm.changelog-4.0.0.xml','2025-04-28 12:14:07',564,'EXECUTED','8:40f17eb9122b6900038675ec503289e9','addColumn tableName=REMOTE_SYNCHRONISATION; createIndex indexName=idx_fk_remote_sync_owner, tableName=REMOTE_SYNCHRONISATION','Add Owner Column to REMOTE_SYNCHRONISATION Table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-4.0.0-delete-column-test-case-version','jlor','tm/tm.changelog-4.0.0.xml','2025-04-28 12:14:07',565,'EXECUTED','8:159df6b73e57c91cc93be6589b236122','dropColumn columnName=VERSION, tableName=TEST_CASE','Delete TEST_CASE.VERSION which is not and was never used',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-4.0.0-sqmap-879-automation-environment-tag','jlor','tm/tm.changelog-4.0.0.xml','2025-04-28 12:14:07',566,'EXECUTED','8:2a3fc3b94331a522eaf3fd685c97773a','createTable tableName=AUTOMATION_ENVIRONMENT_TAG; addUniqueConstraint constraintName=uniq_value_entity_type_entity_id, tableName=AUTOMATION_ENVIRONMENT_TAG','Create table AUTOMATION_ENVIRONMENT_TAG',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-4.0.0-sqmap-879-add-project-inherits-env-tag-column','pckerneis','tm/tm.changelog-4.0.0.xml','2025-04-28 12:14:07',567,'EXECUTED','8:d978baa2a38d4182fe4c50c1da0ab300','addColumn tableName=PROJECT','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-4.0.0-sqmap-879-add-project-level-credentials','pckerneis','tm/tm.changelog-4.0.0.xml','2025-04-28 12:14:07',568,'EXECUTED','8:9309f9f9fa4752b65ca68bfb504c872f','addColumn tableName=STORED_CREDENTIALS','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-4.0.0-SQUASH-4923-remove-orphan-project-filters','dclaerhout','tm/tm.changelog-4.0.0.xml','2025-04-28 12:14:07',569,'EXECUTED','8:49763b942b13245884a80c6c3cabce0c','sql','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-4.0.0-squash-5384-taserver-observer-url-column','pckerneis','tm/tm.changelog-4.0.0.xml','2025-04-28 12:14:07',570,'EXECUTED','8:c2d0bb202997d68a0a96a0c7e3371188','addColumn tableName=TEST_AUTOMATION_SERVER','Add OBSERVER_URL column to TEST_AUTOMATION_SERVER',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-4.1.0','bmsaddek','tm/tm.changelog-4.1.0.xml','2025-04-28 12:14:07',571,'EXECUTED','8:e23ead1b9d0bb7b58a91a48c3b8cb738','update tableName=CORE_CONFIG','Update TM database version number',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-4.1.0-sqmap-879-environment-variable','bmsaddek','tm/tm.changelog-4.1.0.xml','2025-04-28 12:14:07',572,'EXECUTED','8:cd633867f6f5f4f83702a1ecb98c1c8c','createTable tableName=ENVIRONMENT_VARIABLE; createIndex indexName=idx_ev_name, tableName=ENVIRONMENT_VARIABLE; addUniqueConstraint constraintName=uc_ev_name, tableName=ENVIRONMENT_VARIABLE','Create table ENVIRONMENT_VARIABLE',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-4.1.0-sqmap-879-environment-variable_option','bmsaddek','tm/tm.changelog-4.1.0.xml','2025-04-28 12:14:08',573,'EXECUTED','8:2eed485efc3eb8548585dd25a5306515','createTable tableName=ENVIRONMENT_VARIABLE_OPTION; createIndex indexName=idx_fk_ev_option_ev, tableName=ENVIRONMENT_VARIABLE_OPTION; addUniqueConstraint constraintName=uc_ev_option_label, tableName=ENVIRONMENT_VARIABLE_OPTION','Creates a table for Environment Variable Options',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-4.1.0-sqmap-879-environment-variable_binding','bmsaddek','tm/tm.changelog-4.1.0.xml','2025-04-28 12:14:08',574,'EXECUTED','8:ce1612f975708be70df55888e085a811','createTable tableName=ENVIRONMENT_VARIABLE_BINDING; createIndex indexName=idx_fk_ev_binding_ev, tableName=ENVIRONMENT_VARIABLE_BINDING; createIndex indexName=idx_fk_ev_binding_server, tableName=ENVIRONMENT_VARIABLE_BINDING; addUniqueConstraint con...','Creates a table for Environment Variable Binding',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-4.1.0-sqmap-879-environment-variable_value','bmsaddek','tm/tm.changelog-4.1.0.xml','2025-04-28 12:14:08',575,'EXECUTED','8:65be21f7c45926ea0b31d1906333f96d','createTable tableName=ENVIRONMENT_VARIABLE_VALUE; createIndex indexName=idx_fk_ev_value_binding, tableName=ENVIRONMENT_VARIABLE_VALUE; createIndex indexName=idx_evv_entity_id, tableName=ENVIRONMENT_VARIABLE_VALUE; createIndex indexName=idx_evv_ent...','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-4.1.0-sqmap-879-denormalized-environment-variable','bmsaddek','tm/tm.changelog-4.1.0.xml','2025-04-28 12:14:08',576,'EXECUTED','8:ee179aababb312a8dee75c67785c094d','createTable tableName=DENORMALIZED_ENVIRONMENT_VARIABLE; createIndex indexName=idx_fk_dev_environment_variable, tableName=DENORMALIZED_ENVIRONMENT_VARIABLE; createIndex indexName=idx_dev_holder_id, tableName=DENORMALIZED_ENVIRONMENT_VARIABLE; crea...','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-4.1.0-sqmap-879-denormalized-environment-tag','bmsaddek','tm/tm.changelog-4.1.0.xml','2025-04-28 12:14:08',577,'EXECUTED','8:fe1806eef598e87ccacce2dcdf8a7d1e','createTable tableName=DENORMALIZED_ENVIRONMENT_TAG; createIndex indexName=idx_det_holder_id, tableName=DENORMALIZED_ENVIRONMENT_TAG; createIndex indexName=idx_det_holder_type, tableName=DENORMALIZED_ENVIRONMENT_TAG; addUniqueConstraint constraintN...','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-5.0.0','bmsaddek','tm/tm.changelog-5.0.0.xml','2025-04-28 12:14:08',578,'EXECUTED','8:ddd83a5610bd728072f355a2b538db35','update tableName=CORE_CONFIG','Update TM database version number',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-5.0.0-SQUASH-5923-increase-max-size-for-databasechangelog','jprioux','tm/tm.changelog-5.0.0.xml','2025-04-28 12:14:08',579,'EXECUTED','8:c07f3378fe9a5eefabb12c39b0fa3a08','modifyDataType columnName=ID, tableName=DATABASECHANGELOG; modifyDataType columnName=AUTHOR, tableName=DATABASECHANGELOG','Increase max size for ID and author columns in databasechangelog table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-5.0.0-SQUASH-5745-Add-environment-variables-to-project','bmsaddek','tm/tm.changelog-5.0.0.xml','2025-04-28 12:14:08',580,'EXECUTED','8:9f17e23b3e0705d47adc71a2d6c90833','addColumn tableName=ENVIRONMENT_VARIABLE_BINDING; createIndex indexName=idx_evb_entity_id, tableName=ENVIRONMENT_VARIABLE_BINDING; createIndex indexName=idx_evb_entity_type, tableName=ENVIRONMENT_VARIABLE_BINDING; dropForeignKeyConstraint baseTabl...','Add VALUE, ENTITY_TYPE columns to ENVIRONMENT_VARIABLE_BINDING Table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-5.0.0-SQUASH-5745-environment-variable-data-migration-server-value','lmurat','tm/tm.changelog-5.0.0.xml','2025-04-28 12:14:08',581,'EXECUTED','8:5537a8373d62f421d1753c6e536b2c31','sql','Migrate environment variable values in environment_variable_binding table it\'s a server value',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-5.0.0-SQUASH-5745-environment-variable-data-migration-default-value','lmurat','tm/tm.changelog-5.0.0.xml','2025-04-28 12:14:08',582,'EXECUTED','8:7f39425624e0fa1f975a8fca8e3b6437','sql','Migrate environment variable values in environment_variable_binding table when project value doesn\'t exist in environment variable value table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-5.0.0-SQUASH-5745-environment-variable-data-migration-project-value','lmurat','tm/tm.changelog-5.0.0.xml','2025-04-28 12:14:08',583,'EXECUTED','8:0a01a8b66eadd5c42daa00227460d393','sql','Migrate environment variable values in environment_variable_binding table when project value exist in environment variable value table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-5.0.0-SQUASH-5745-Drop-environment-variable-value-table','lmurat','tm/tm.changelog-5.0.0.xml','2025-04-28 12:14:08',584,'EXECUTED','8:231d11cf680fe71bc8f25eb3df9f0c1b','dropColumn columnName=bound_server_id, tableName=ENVIRONMENT_VARIABLE_BINDING; dropTable tableName=ENVIRONMENT_VARIABLE_VALUE; addUniqueConstraint constraintName=uc_evb_id_type_ev_id_binding, tableName=ENVIRONMENT_VARIABLE_BINDING','Drop old environment variable values',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-5.0.0-SQUASH-5745-Add-environment-variables-type-to-denormalized-environment-variable','bmsaddek','tm/tm.changelog-5.0.0.xml','2025-04-28 12:14:08',585,'EXECUTED','8:1fb134d3b3e63fc03f56419b952cd1cc','addColumn tableName=DENORMALIZED_ENVIRONMENT_VARIABLE','Add TYPE column to DENORMALIZED_ENVIRONMENT_VARIABLE Table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-5.0.0-SQUASH-5890-environment-variable-data-migration-variable-type','bmsaddek','tm/tm.changelog-5.0.0.xml','2025-04-28 12:14:08',586,'EXECUTED','8:70a968f47cd20a7dcfaedf26dc408bbc','sql','Copy environment variable type in denormalized_environment_variable table if the variable has not been deleted',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-5.0.0-add-user-custom-delete-permission','pckerneis','tm/tm.changelog-5.0.0.xml','2025-04-28 12:14:08',587,'EXECUTED','8:de173256e065f48609f2a9d900c4575d','addColumn tableName=CORE_USER','Add a column for custom delete permissions on CORE_USER table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-5.0.0-squash-5665-update-welcome-and-login-message','lmurat','tm/tm.changelog-5.0.0.xml','2025-04-28 12:14:08',588,'EXECUTED','8:c570593a856701eeaef40e261906ca49','sql','Adapt default welcome and login message to new front',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-5.0.0-squash-5881-update-length-for-test-suite-name','lmurat','tm/tm.changelog-5.0.0.xml','2025-04-28 12:14:08',589,'EXECUTED','8:616136c4a235c82336eac693310da3da','modifyDataType columnName=NAME, tableName=TEST_SUITE','Increase character limit for test suite name to 255',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-5.0.0-squash-5384-taserver-eventbus-url-column','pckerneis','tm/tm.changelog-5.0.0.xml','2025-04-28 12:14:08',590,'EXECUTED','8:91348b0e8aca3f2b2fa893d2294cf5d1','addColumn tableName=TEST_AUTOMATION_SERVER','Add EVENT_BUS_URL column to TEST_AUTOMATION_SERVER',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-5.0.0-squash-5749-add-test-technology-tag-to-automated-execution-extender','lmurat','tm/tm.changelog-5.0.0.xml','2025-04-28 12:14:08',591,'EXECUTED','8:740bdcd4f3747a8a58221d76e1444adf','addColumn tableName=AUTOMATED_EXECUTION_EXTENDER','Add the automated test technology tag to the automated execution extender',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-6.0.0','lmurat','tm/tm.changelog-6.0.0.xml','2025-04-28 12:14:08',592,'EXECUTED','8:58f17ae7fc8eee68e0b45d9a115f3784','update tableName=CORE_CONFIG','Update TM database version number',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-6.0.0-SQUASH-6260-cleanup-core-party-authority-table','lmurat','tm/tm.changelog-6.0.0.xml','2025-04-28 12:14:08',593,'EXECUTED','8:e9c6db4305989db996f20fbc3f141c15','sql','Remove ROLE_TM_USER from CORE_PARTY_AUTHORITY',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-6.0.0-SQUASH-6284-login-up-to-100-characters','mbrugniere','tm/tm.changelog-6.0.0.xml','2025-04-28 12:14:13',594,'EXECUTED','8:aa6203fbbef514e97eabeed812f50af1','modifyDataType columnName=CREATED_BY, tableName=ACTION_WORD; addNotNullConstraint columnName=CREATED_BY, tableName=ACTION_WORD; modifyDataType columnName=LAST_MODIFIED_BY, tableName=ACTION_WORD; modifyDataType columnName=LOGIN, tableName=AUTH_USER...','Update login maxlength for all tables concerned (from 50 to 100)',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-6.0.0-create-exploratory-test-case','pckerneis','tm/tm.changelog-6.0.0.xml','2025-04-28 12:14:13',595,'EXECUTED','8:d6da1d9d969d794b17ee935215a2fe51','createTable tableName=EXPLORATORY_TEST_CASE','Create the exploratory test case table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-6.0.0-create-exploratory-execution','pckerneis','tm/tm.changelog-6.0.0.xml','2025-04-28 12:14:13',596,'EXECUTED','8:2fdd0cc5a94cb40c2062cc8582d3af5c','createTable tableName=EXPLORATORY_EXECUTION; createIndex indexName=idx_fk_exploratory_execution_assignee, tableName=EXPLORATORY_EXECUTION','Create the exploratory execution table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-6.0.0-create-session-note-for-exploratory-execution','mbrugniere','tm/tm.changelog-6.0.0.xml','2025-04-28 12:14:13',597,'EXECUTED','8:5d4e3cbd2cd18de34195e9c16bc613b3','createTable tableName=SESSION_NOTE; createIndex indexName=idx_fk_session_note_execution, tableName=SESSION_NOTE; createIndex indexName=idx_fk_session_note_issue_list_id, tableName=SESSION_NOTE; createIndex indexName=idx_session_note_created_by, ta...','Create the session note table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-6.0.0-ISSUE-269-increase-max-size-for-test-reference','dclaerhout','tm/tm.changelog-6.0.0.xml','2025-04-28 12:14:13',598,'EXECUTED','8:a21dc7000c7d5844f60f7b8095bc3bfd','modifyDataType columnName=AUTOMATED_TEST_REFERENCE, tableName=TEST_CASE','Increase max size for automated test reference in test case table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-6.0.0-issue-368-add-additional-configuration-to-test-automation-server','fahadi','tm/tm.changelog-6.0.0.xml','2025-04-28 12:14:13',599,'EXECUTED','8:ae13402136cbb1b79a45e90dec8a42b0','addColumn tableName=TEST_AUTOMATION_SERVER','Add additional configuration to the test automation server',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-6.0.0-update-execution_issues_closure','mbrugniere','tm/tm.changelog-6.0.0.xml','2025-04-28 12:14:13',600,'EXECUTED','8:63142af44781509e4550973a244cc317','dropView viewName=EXECUTION_ISSUES_CLOSURE; createView viewName=EXECUTION_ISSUES_CLOSURE','Consider session notes to get all known issues for an execution',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-6.0.0-add-grid-column-display-reference-table','jmarque','tm/tm.changelog-6.0.0.xml','2025-04-28 12:14:13',601,'EXECUTED','8:e47ff361f4ee9d8fd94b75322b9692ba','createTable tableName=GRID_COLUMN_DISPLAY_REFERENCE; createIndex indexName=idx_fk_grid_column_display_reference_party_id, tableName=GRID_COLUMN_DISPLAY_REFERENCE; createIndex indexName=idx_fk_grid_column_display_reference_project_id, tableName=GRI...','Create the grid reference table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-6.0.0-add-grid-column-display-configuration-table','jmarque','tm/tm.changelog-6.0.0.xml','2025-04-28 12:14:13',602,'EXECUTED','8:e95b4bb90b311b5f84648616241b6e5d','createTable tableName=GRID_COLUMN_DISPLAY_CONFIGURATION; createIndex indexName=idx_fk_grid_column_display_configuration_gcdr_id, tableName=GRID_COLUMN_DISPLAY_CONFIGURATION','Create the grid configuration table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-6.0.0-create-exploratory-execution-event-table','pckerneis','tm/tm.changelog-6.0.0.xml','2025-04-28 12:14:13',603,'EXECUTED','8:3244ed07a4fbf493862937af300edcf9','createTable tableName=EXPLORATORY_EXECUTION_EVENT; addUniqueConstraint constraintName=uc_exploratory_execution_event_execution_id_event_date, tableName=EXPLORATORY_EXECUTION_EVENT','Create the exploratory session event table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-6.0.0-add-dataset-parameter-order','pckerneis','tm/tm.changelog-6.0.0.xml','2025-04-28 12:14:13',604,'EXECUTED','8:4009792036fb3f54151827a230cca8cf','addColumn tableName=PARAMETER','add an order to parameters',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-6.0.0-add-dataset-parameter-order-generation','pckerneis','tm/tm.changelog-6.0.0.xml','2025-04-28 12:14:13',605,'EXECUTED','8:d4ce63dae76f992f49574be99c6bdcd7','sql; addNotNullConstraint columnName=PARAM_ORDER, tableName=PARAMETER','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-6.0.0-add-exploratory-session-overview','mbrugniere','tm/tm.changelog-6.0.0.xml','2025-04-28 12:14:13',606,'EXECUTED','8:ee55c8c1aa5423a03523dc4b5f506522','createTable tableName=EXPLORATORY_SESSION_OVERVIEW; createIndex indexName=idx_fk_exploratory_session_overview_itpi, tableName=EXPLORATORY_SESSION_OVERVIEW; createIndex indexName=idx_fk_exploratory_session_overview_attachment_list, tableName=EXPLOR...','Create the exploratory session overview table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-6.0.0-squash-remove-resultpublisher-plugin-binding','bms','tm/tm.changelog-6.0.0.xml','2025-04-28 12:14:13',607,'EXECUTED','8:0b1332faad6e21410756b12d60f8ff92','sql','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-6.0.0-667-rename-squashautom-ta-server-kind','jprioux','tm/tm.changelog-6.0.0.xml','2025-04-28 12:14:13',608,'EXECUTED','8:a0980811d3c54a8db982dc315e878f94','update tableName=TEST_AUTOMATION_SERVER','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-7.0.0','mbrugniere','tm/tm.changelog-7.0.0.xml','2025-04-28 12:14:13',609,'EXECUTED','8:4d84039428ec1c6e75236450ae5a2b45','update tableName=CORE_CONFIG','Update TM database version number',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-7.0.0-45-clean-database-of-nulls-in-action-steps','mbrugniere','tm/tm.changelog-7.0.0.xml','2025-04-28 12:14:13',610,'EXECUTED','8:15d6f2ec592778bc044a2ec3442f2b70','update tableName=ACTION_TEST_STEP; update tableName=ACTION_TEST_STEP; update tableName=EXECUTION_STEP; update tableName=EXECUTION_STEP','Clean database of null values in test steps and execution steps',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-7.0.0-895-action-and-expected_result_should_not_be_nullable','mbrugniere','tm/tm.changelog-7.0.0.xml','2025-04-28 12:14:13',611,'EXECUTED','8:c73ee0e5cd76bc2fda03748af103f49f','addNotNullConstraint columnName=ACTION, tableName=ACTION_TEST_STEP; addDefaultValue columnName=ACTION, tableName=ACTION_TEST_STEP; addNotNullConstraint columnName=EXPECTED_RESULT, tableName=ACTION_TEST_STEP; addDefaultValue columnName=EXPECTED_RES...','Add not null constraint on columns action and expected_result',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-7.0.0-876-update-cufs-in-column-configuration','jma','tm/tm.changelog-7.0.0.xml','2025-04-28 12:14:13',612,'EXECUTED','8:cde1f300d157fb293173c7e75fdf4cfa','sql','Delete active_column_id if it does not match any cuf code. Replace the cuf\'s code with the cuf\'s id.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-7.0.0-create-sprint-table','jprioux','tm/tm.changelog-7.0.0.xml','2025-04-28 12:14:13',613,'EXECUTED','8:18267a63e61cdab26f9855b65b90bd0d','createTable tableName=SPRINT; createIndex indexName=idx_fk_sprint_remote_synchronisation, tableName=SPRINT','Create the sprint table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-7.0.0-create-sprint-req-version-table','rfortoso','tm/tm.changelog-7.0.0.xml','2025-04-28 12:14:14',614,'EXECUTED','8:d70d42ae489fc3fd45cf52013e4bfefb','createTable tableName=SPRINT_REQ_VERSION; createIndex indexName=idx_fk_sprint_req_version_req_version_id, tableName=SPRINT_REQ_VERSION; createIndex indexName=idx_fk_sprint_req_version_sprint_id, tableName=SPRINT_REQ_VERSION','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-7.0.0-create-sprint-requirement-sync-extender-table','dclaerhout','tm/tm.changelog-7.0.0.xml','2025-04-28 12:14:14',615,'EXECUTED','8:6c4950fc89283d5d5dd18c568bd1f7ec','createTable tableName=SPRINT_REQUIREMENT_SYNC_EXTENDER; createIndex indexName=idx_fk_sprint_req_sync_ext_sprint_req_version_id, tableName=SPRINT_REQUIREMENT_SYNC_EXTENDER; createIndex indexName=idx_fk_sprint_req_sync_ext_remote_sync_id, tableName=...','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-7.0.0-create-automated-suite-workflows-table','bmsaddek','tm/tm.changelog-7.0.0.xml','2025-04-28 12:14:14',616,'EXECUTED','8:cc52a817525ce5158a3b29a5bba15f03','sql; createTable tableName=AUTOMATED_SUITE_WORKFLOWS; createIndex indexName=idx_fk_automated_suite_workflows_project_id, tableName=AUTOMATED_SUITE_WORKFLOWS','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-7.0.0-create-ai-server-table','jmarque','tm/tm.changelog-7.0.0.xml','2025-04-28 12:14:14',617,'EXECUTED','8:76fde6bb17ff2d4b5b1579d3d154027b','createTable tableName=AI_SERVER; addForeignKeyConstraint baseTableName=AI_SERVER, constraintName=fk_ai_server_third_party_server, referencedTableName=THIRD_PARTY_SERVER','Create the ai server table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-7.0.0-add-column-killswitch-url-in-test-automation-server','ngouriou','tm/tm.changelog-7.0.0.xml','2025-04-28 12:14:14',618,'EXECUTED','8:6bbcbe34f1b840c9d8e25847201c9676','addColumn tableName=TEST_AUTOMATION_SERVER','Add killswitch_url column in test automation server table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-7.0.0-add-column-ai_server_id-in-project','mbrugniere','tm/tm.changelog-7.0.0.xml','2025-04-28 12:14:14',619,'EXECUTED','8:b3f8a0984f0ee0bfd3c730f22b0425a4','addColumn tableName=PROJECT; createIndex indexName=idx_fk_project_ai_server, tableName=PROJECT','Add column ai_server_id in project table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-7.0.0-record-info-test-case-drafted-by-artificial-intelligence','mbrugniere','tm/tm.changelog-7.0.0.xml','2025-04-28 12:14:14',620,'EXECUTED','8:bcaf72c1d4f8da1ae849712f9efca60b','addColumn tableName=TEST_CASE','Add column drafted_by_ai in test_case table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-7.0.0-filtering-on-drafted-by-ai-in-test-case-search-grid','mbrugniere','tm/tm.changelog-7.0.0.xml','2025-04-28 12:14:14',621,'EXECUTED','8:fa118be4a0a61d59568884451e47f8f0','sql','Add entry in QUERY_COLUMN_PROTOTYPE for filtering on TEST_CASE.drafted_by_ai',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-7.0.0-create-test_plan-tables','pckerneis','tm/tm.changelog-7.0.0.xml','2025-04-28 12:14:15',622,'EXECUTED','8:c2fef64400785013d39a8bda01b48a35','createTable tableName=TEST_PLAN; createIndex indexName=idx_fk_test_plan_campaign_library, tableName=TEST_PLAN; createTable tableName=TEST_PLAN_ITEM; createIndex indexName=idx_fk_test_plan_item_test_plan, tableName=TEST_PLAN_ITEM; createIndex index...','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-7.0.0-fix-mapping-tc-add-automation-req-fk','bmsaddek','tm/tm.changelog-7.0.0.xml','2025-04-28 12:14:15',623,'EXECUTED','8:79b633d345dc36d5c68b438189b29dd4','addColumn tableName=TEST_CASE','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-7.0.0-fix-mapping-tc-import-ar-fk-mariadb','bmsaddek','tm/tm.changelog-7.0.0.xml','2025-04-28 12:14:15',624,'EXECUTED','8:4d662401e170ff82964e8b26f49a86f3','sql','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-7.0.0-fix-mapping-tc-add-columns-indexes','bmsaddek','tm/tm.changelog-7.0.0.xml','2025-04-28 12:14:15',625,'EXECUTED','8:05a38a10abfc634c2a9ac197cd2efc10','createIndex indexName=idx_test_case_automation_request_id, tableName=TEST_CASE','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-7.0.0-fix-mapping-automation-request-drop-column','bmsaddek','tm/tm.changelog-7.0.0.xml','2025-04-28 12:14:15',626,'EXECUTED','8:64c56c847b133ec34241efc1e34234a8','dropForeignKeyConstraint baseTableName=AUTOMATION_REQUEST, constraintName=fk_automation_request_test_case; dropColumn columnName=TEST_CASE_ID, tableName=AUTOMATION_REQUEST','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-7.0.0-create-sprint-group-table','jprioux','tm/tm.changelog-7.0.0.xml','2025-04-28 12:14:15',627,'EXECUTED','8:fb4b09576cc2cdef18f619b0053c946e','createTable tableName=SPRINT_GROUP','Create the sprint group table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-7.0.0-expand_cln_relationship_ancestor_fk','jprioux','tm/tm.changelog-7.0.0.xml','2025-04-28 12:14:15',628,'EXECUTED','8:a3838d3d4e3a8e1fb286740c4e800049','dropForeignKeyConstraint baseTableName=CLN_RELATIONSHIP, constraintName=fk_cln_relationship_ancestor; dropIndex indexName=dx_cln_relationship_ancestor, tableName=CLN_RELATIONSHIP; addForeignKeyConstraint baseTableName=CLN_RELATIONSHIP, constraintN...','Expand ANCESTOR_ID from cln_relationship to include campaign library node, not only folder',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-7.0.0-replace-invalid-br-tags','pckerneis','tm/tm.changelog-7.0.0.xml','2025-04-28 12:14:15',629,'EXECUTED','8:aebb68aba075b09e4c850463b32407d7','sql','Replace invalid br tags in test case description',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-7.0.0-fix-mapping-bugtracker-project-binding','bmsaddek','tm/tm.changelog-7.0.0.xml','2025-04-28 12:14:15',630,'EXECUTED','8:18cfd43a240330ad96073c3a5ae96319','addColumn tableName=BUGTRACKER_PROJECT; addColumn tableName=PROJECT; createIndex indexName=idx_fk_bugtracker_project_project_id, tableName=BUGTRACKER_PROJECT; createIndex indexName=idx_fk_project_bugtracker_id, tableName=PROJECT','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-7.0.0-fix-mapping-bugtracker-project-import-fk-mariadb','bmsaddek','tm/tm.changelog-7.0.0.xml','2025-04-28 12:14:15',631,'EXECUTED','8:93c01b1fe4c597680e42c9c25e69f4ab','sql','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-7.0.0-fix-mapping-bugtracker-project-drop-table','bmsaddek','tm/tm.changelog-7.0.0.xml','2025-04-28 12:14:15',632,'EXECUTED','8:54b76e597930c56c35c72c1a8f78384a','dropForeignKeyConstraint baseTableName=BUGTRACKER_PROJECT, constraintName=fk_bugtracker_project_bugtracker_binding; dropColumn columnName=BUGTRACKER_BINDING_ID, tableName=BUGTRACKER_PROJECT; dropTable tableName=BUGTRACKER_BINDING; addNotNullConstr...','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-7.0.0-1558-add-playwright-automated_test_technologies','xzhao-meinman','tm/tm.changelog-7.0.0.xml','2025-04-28 12:14:15',633,'EXECUTED','8:e80a70004244bf60542d2d151dd65f72','sql','Add automated test technology Playwright',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-7.0.0-squash-1647-add-auditables-and-description-to-third-party-server-mariadb','jpmarque','tm/tm.changelog-7.0.0.xml','2025-04-28 12:14:16',634,'EXECUTED','8:77279900390dce2b9e959d5c66b07af7','sql','Add auditables and description to THIRD_PARTY_SERVER, copy data from TEST_AUTOMATION_SERVER, remove columns from TEST_AUTOMATION_SERVER',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-7.1.0','mbrugniere','tm/tm.changelog-7.1.0.xml','2025-04-28 12:14:16',635,'EXECUTED','8:ea0d172d40d095bc7053c0259b1110ee','update tableName=CORE_CONFIG','Update TM database version number',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-7.1.0-create-api-token-table','mbrugniere','tm/tm.changelog-7.1.0.xml','2025-04-28 12:14:16',636,'EXECUTED','8:a963b876b65dedeee2b60d12c9604d43','createTable tableName=API_TOKEN; createIndex indexName=idx_fk_api_token_user_id, tableName=API_TOKEN','Create table API_TOKEN',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-7.1.0-fix-description-type-in-third-party-server','jprioux','tm/tm.changelog-7.1.0.xml','2025-04-28 12:14:16',637,'EXECUTED','8:599cea132082bf9a04989afe4f62cbff','modifyDataType columnName=DESCRIPTION, tableName=THIRD_PARTY_SERVER','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-7.1.0-fix-description-default-value-in-third-party-server','jprioux','tm/tm.changelog-7.1.0.xml','2025-04-28 12:14:16',638,'EXECUTED','8:9f48efe5cf3a47ad251f48cd46084661','addDefaultValue columnName=DESCRIPTION, tableName=THIRD_PARTY_SERVER; update tableName=THIRD_PARTY_SERVER','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-7.2.0','bmsaddek','tm/tm.changelog-7.2.0.xml','2025-04-28 12:14:16',639,'EXECUTED','8:452cb5a85754124805f0685c0a6ae768','update tableName=CORE_CONFIG','Update TM database version number',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-7.2.0-remove-item-test-plan-execution-constraint-mariadb','bmsaddek','tm/tm.changelog-7.2.0.xml','2025-04-28 12:14:16',640,'EXECUTED','8:bf489119d2c553d936f481238cf34f6b','dropUniqueConstraint constraintName=ITEM_TEST_PLAN_ID, tableName=ITEM_TEST_PLAN_EXECUTION','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-7.3.0','pckerneis','tm/tm.changelog-7.3.0.xml','2025-04-28 12:14:16',641,'EXECUTED','8:3a5394376de4cb89158bc268bd33a7a2','update tableName=CORE_CONFIG','Update TM database version number',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-7.3.0-add-REPORTING_CACHE_CREDENTIALS-column-to-STORED_CREDENTIALS','pckerneis','tm/tm.changelog-7.3.0.xml','2025-04-28 12:14:16',642,'EXECUTED','8:c249c656db1c42ccf3d358a36bacbc09','addColumn tableName=STORED_CREDENTIALS','Add REPORTING_CACHE_CREDENTIALS column to STORED_CREDENTIALS',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-8.0.0','mbrugniere','tm/tm.changelog-8.0.0.xml','2025-04-28 12:14:16',643,'EXECUTED','8:3ceae00424129e084f4b6a5efee23117','update tableName=CORE_CONFIG','Update TM database version number',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-8.0.0-1658-add-column-duration-in-automated-execution-extender-table','xzhao','tm/tm.changelog-8.0.0.xml','2025-04-28 12:14:16',644,'EXECUTED','8:e0e7805c08ac485fe2bbb7bf7d0d2fe2','addColumn tableName=AUTOMATED_EXECUTION_EXTENDER','Add column duration in automated execution extender table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-8.0.0-custom-field-value-update-unique-constraint','rfortoso','tm/tm.changelog-8.0.0.xml','2025-04-28 12:14:16',645,'EXECUTED','8:4f3a0b55c4df19e56041ca5c162b1008','dropUniqueConstraint constraintName=u_cfv_id_type_binding, tableName=CUSTOM_FIELD_VALUE; addUniqueConstraint constraintName=u_cfv_type_id_binding, tableName=CUSTOM_FIELD_VALUE','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-8.0.0-denormalized_field_value-update-unique-constraint','rfortoso','tm/tm.changelog-8.0.0.xml','2025-04-28 12:14:16',646,'EXECUTED','8:f3ba3ce76fbf82353da8b0415f715825','dropUniqueConstraint constraintName=u_dfv_id_type_code, tableName=DENORMALIZED_FIELD_VALUE; addUniqueConstraint constraintName=u_dfv_type_id_code, tableName=DENORMALIZED_FIELD_VALUE','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-8.0.0-denormalized_environment_variable-update-unique-constraint','rfortoso','tm/tm.changelog-8.0.0.xml','2025-04-28 12:14:16',647,'EXECUTED','8:2a9e5d4f18bc7db6f74d169d551f843f','dropUniqueConstraint constraintName=uc_dev_id_type_name, tableName=DENORMALIZED_ENVIRONMENT_VARIABLE; addUniqueConstraint constraintName=uc_dev_type_id_name, tableName=DENORMALIZED_ENVIRONMENT_VARIABLE','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-8.0.0-denormalized_environment_tag-update-unique-constraint','rfortoso','tm/tm.changelog-8.0.0.xml','2025-04-28 12:14:16',648,'EXECUTED','8:c6ad67883f7109946cf1ffff0678c076','dropUniqueConstraint constraintName=uc_det_id_type_value, tableName=DENORMALIZED_ENVIRONMENT_TAG; addUniqueConstraint constraintName=uc_det_type_id_value, tableName=DENORMALIZED_ENVIRONMENT_TAG','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-8.0.0-environment_variable_binding-update-unique-constraint','rfortoso','tm/tm.changelog-8.0.0.xml','2025-04-28 12:14:16',649,'EXECUTED','8:3b6252f797ff27d1c53207796efeac42','dropUniqueConstraint constraintName=uc_evb_id_type_ev_id_binding, tableName=ENVIRONMENT_VARIABLE_BINDING; addUniqueConstraint constraintName=uc_type_evb_id_ev_id_binding, tableName=ENVIRONMENT_VARIABLE_BINDING','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-8.0.0-automation_environment_tag-update-unique-constraint','rfortoso','tm/tm.changelog-8.0.0.xml','2025-04-28 12:14:16',650,'EXECUTED','8:e0ac05807349e41c5fb24882f3256bc1','dropUniqueConstraint constraintName=uniq_value_entity_type_entity_id, tableName=AUTOMATION_ENVIRONMENT_TAG; addUniqueConstraint constraintName=uniq_entity_type_entity_id_value, tableName=AUTOMATION_ENVIRONMENT_TAG','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-8.0.0-modify_restrain_to_active_sprint_json_keys','pguygot','tm/tm.changelog-8.0.0.xml','2025-04-28 12:14:16',651,'EXECUTED','8:4b4ab12e5c9115ef2734c999f0b03d75','sql','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-8.0.0-remove-unnecessary-roles','jprioux','tm/tm.changelog-8.0.0.xml','2025-04-28 12:14:16',652,'EXECUTED','8:b1310cf368e526076a4c0a3e41ea173b','delete tableName=CORE_PARTY_AUTHORITY','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-8.0.0-add_remote_sync_id_in_sprint_group_table','pguygot','tm/tm.changelog-8.0.0.xml','2025-04-28 12:14:16',653,'EXECUTED','8:ab75704ac33d88c07dc647d55a209db5','addColumn tableName=SPRINT_GROUP; createIndex indexName=idx_fk_sprint_group_remote_synchronisation, tableName=SPRINT_GROUP','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-8.0.0-add-manage-milestone-permission','jprioux','tm/tm.changelog-8.0.0.xml','2025-04-28 12:14:16',654,'EXECUTED','8:f63c6efd6230cf89245269e638b71e7f','sql','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-8.0.0-add-manage-project-clearance-permission','jprioux','tm/tm.changelog-8.0.0.xml','2025-04-28 12:14:16',655,'EXECUTED','8:8151553eb35af33e5a046096b2fbcb92','sql','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-8.0.0-add-active-in-acl-group','jprioux','tm/tm.changelog-8.0.0.xml','2025-04-28 12:14:16',656,'EXECUTED','8:a33c7db7a1b65e1600e946c9a804b3a0','addColumn tableName=ACL_GROUP','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-8.0.0-add-description-in-acl-group','jprioux','tm/tm.changelog-8.0.0.xml','2025-04-28 12:14:16',657,'EXECUTED','8:90908be5c955b9e6f6878df7d5e99a14','addColumn tableName=ACL_GROUP','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-8.0.0-add-auditable-columns-in-sprint-req-version','pckerneis','tm/tm.changelog-8.0.0.xml','2025-04-28 12:14:16',658,'EXECUTED','8:02201a57474d7eeb1dc41031c8ad7ef7','addColumn tableName=SPRINT_REQ_VERSION; update tableName=SPRINT_REQ_VERSION; addNotNullConstraint columnName=CREATED_BY, tableName=SPRINT_REQ_VERSION; addNotNullConstraint columnName=CREATED_ON, tableName=SPRINT_REQ_VERSION','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-8.0.0-add-auditable-columns-in-acl-group','jprioux','tm/tm.changelog-8.0.0.xml','2025-04-28 12:14:16',659,'EXECUTED','8:b07db4b6d67364ca49b76d4a5c2e60dc','addColumn tableName=ACL_GROUP; update tableName=ACL_GROUP; addNotNullConstraint columnName=CREATED_BY, tableName=ACL_GROUP; addNotNullConstraint columnName=CREATED_ON, tableName=ACL_GROUP','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-8.0.0-limit-acl-group-name-to-50','jprioux','tm/tm.changelog-8.0.0.xml','2025-04-28 12:14:16',660,'EXECUTED','8:3c5bc661f688ac35d2b3ad1929342cf8','modifyDataType columnName=QUALIFIED_NAME, tableName=ACL_GROUP','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-8.0.0-add-created-by-column-in-api-token','mbrugniere','tm/tm.changelog-8.0.0.xml','2025-04-28 12:14:16',661,'EXECUTED','8:9404e667316dc61a95ac0ee404b3d0cd','addColumn tableName=API_TOKEN; sql; addNotNullConstraint columnName=CREATED_BY, tableName=API_TOKEN','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-8.0.0-add-table-for-pivot-format-import','dclaerhout','tm/tm.changelog-8.0.0.xml','2025-04-28 12:14:17',662,'EXECUTED','8:182841e2348a8a1a850279ea79433dae','createTable tableName=PIVOT_FORMAT_IMPORT; createIndex indexName=idx_fk_pivot_format_import_created_by, tableName=PIVOT_FORMAT_IMPORT; createIndex indexName=idx_fk_pivot_format_import_project_id, tableName=PIVOT_FORMAT_IMPORT','Add a pivot format import table in squash tm.',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-8.0.0-harmonize-profile-permissions','jprioux','tm/tm.changelog-8.0.0.xml','2025-04-28 12:14:17',663,'EXECUTED','8:fc4815e7a7ebdefcda58cca7097f3c55','sql','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-8.0.0-add-credentials_not_shared-column-in-scm-server-table','xzhao','tm/tm.changelog-8.0.0.xml','2025-04-28 12:14:17',664,'EXECUTED','8:e88afd4ddf2c6cdc58e6c17d65b625f9','addColumn tableName=SCM_SERVER','Add column credentials_not_shared in scm_server table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-8.0.0-remove-the-table-denormalized_field_option-from-the-squash-database','jmarque and rfortoso','tm/tm.changelog-8.0.0.xml','2025-04-28 12:14:17',665,'EXECUTED','8:6ea53df6b0039eb00791fdf0aebf1b37','sql','DENORMALIZED_FIELD_OPTION has been unused for some time',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-8.0.0-add-validation-status-column-in-sprint-requirement-version-table','mbrugniere','tm/tm.changelog-8.0.0.xml','2025-04-28 12:14:17',666,'EXECUTED','8:4480a1f0cc522bd990a1b965452f1850','addColumn tableName=SPRINT_REQ_VERSION','Add column validation_status in sprint_req_version table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-8.0.0-add-last_modified_on-column-in-attachment-table','xzhao','tm/tm.changelog-8.0.0.xml','2025-04-28 12:14:17',667,'EXECUTED','8:08c07169b1e0c8a508a59e9dc106033e','addColumn tableName=ATTACHMENT','Add column last_modified_on in attachment table',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-8.0.0-add-import-permission-to-project-manager-profile','jprioux','tm/tm.changelog-8.0.0.xml','2025-04-28 12:14:17',668,'EXECUTED','8:424f4d1d95847836a0cfbc5f01d4a5b6','sql','',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-8.1.0','jmarque','tm/tm.changelog-8.1.0.xml','2025-04-28 12:14:17',669,'EXECUTED','8:b293157010cba4efa843fe739ba153fb','update tableName=CORE_CONFIG','Update TM database version number',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-8.1.0-replace-SSF-by-CF-in-denormalized-field-table','jmarque','tm/tm.changelog-8.1.0.xml','2025-04-28 12:14:17',670,'EXECUTED','8:70b98e0de120a1d5ee6c33d589d95483','update tableName=DENORMALIZED_FIELD_VALUE','Remove SSF reference in DENORMALIZED_FIELD_VALUE',NULL,'4.19.0',NULL,'legacy','5842419196'),('tm-9.0.0-remove-oauth1a-cred-and-conf','jprioux','tm/tm.changelog-9.0.0.xml','2025-04-28 12:14:17',671,'EXECUTED','8:6c00b4a099cdea06af5d64acac1c8be0','delete tableName=STORED_CREDENTIALS','Remove OAUTH_1A stored credentials and configuration',NULL,'4.19.0',NULL,NULL,'5842419196'),('tm-9.0.0-migrate-oauth1a-to-oauth2','jprioux','tm/tm.changelog-9.0.0.xml','2025-04-28 12:14:17',672,'EXECUTED','8:1d3f4f687c9fdb5e275325af04b5fb41','update tableName=THIRD_PARTY_SERVER','Migrate OAUTH_1A third party servers to OAUTH_2',NULL,'4.19.0',NULL,NULL,'5842419196'),('tm-9.0.0-remove-active-column-in-project-table','jmarque','tm/tm.changelog-9.0.0.xml','2025-04-28 12:14:17',673,'EXECUTED','8:ceb06d803646effd21814256a8cf57e2','dropColumn columnName=ACTIVE, tableName=PROJECT','Remove column active in project table',NULL,'4.19.0',NULL,NULL,'5842419196'),('tm-9.0.0-add-index-on-execution-last-executed-on-to-improve-performance','mbrugniere','tm/tm.changelog-9.0.0.xml','2025-04-28 12:14:17',674,'EXECUTED','8:195380be628eb4dda7b3d7c0f03fa11f','createIndex indexName=idx_execution_last_executed_on, tableName=EXECUTION','Add index on the last_executed_on column of the execution table',NULL,'4.19.0',NULL,NULL,'5842419196'),('tm-9.0.0-create-failure-detail-table','fahadi','tm/tm.changelog-9.0.0.xml','2025-04-28 12:14:17',675,'EXECUTED','8:e084ff35ffc3874b6c07a9da08f21e7a','createTable tableName=FAILURE_DETAIL','Create the failure detail table',NULL,'4.19.0',NULL,NULL,'5842419196'),('tm-9.0.0-create-failure-detail-indexes','fahadi','tm/tm.changelog-9.0.0.xml','2025-04-28 12:14:17',676,'EXECUTED','8:848c730f92bb5d4cb8c88d55a36a5fc8','createIndex indexName=idx_failure_detail_item_test_plan_id, tableName=FAILURE_DETAIL; createIndex indexName=idx_failure_detail_created_by, tableName=FAILURE_DETAIL; createIndex indexName=idx_fk_failure_detail_issue_list_id, tableName=FAILURE_DETAIL','Create indexes for failure detail table',NULL,'4.19.0',NULL,NULL,'5842419196'),('tm-9.0.0-create-automated-execution-failure-detail-table','fahadi','tm/tm.changelog-9.0.0.xml','2025-04-28 12:14:17',677,'EXECUTED','8:2585831f5957249668c387bec6c7c957','createTable tableName=AUTOMATED_EXECUTION_FAILURE_DETAIL','Create the automated execution failure detail table',NULL,'4.19.0',NULL,NULL,'5842419196'),('tm-9.0.0-create-automated-execution-failure-detail-indexes','fahadi','tm/tm.changelog-9.0.0.xml','2025-04-28 12:14:17',678,'EXECUTED','8:39636ee52f9b0231be90caf3c682584d','createIndex indexName=idx_automated_execution_failure_detail_execution_extender_id, tableName=AUTOMATED_EXECUTION_FAILURE_DETAIL; createIndex indexName=idx_automated_execution_failure_detail_failure_detail_id, tableName=AUTOMATED_EXECUTION_FAILURE...','Create indexes for automated execution failure detail table',NULL,'4.19.0',NULL,NULL,'5842419196'),('tm-9.0.0-add-automated-execution-failure-detail-foreign-keys','fahadi','tm/tm.changelog-9.0.0.xml','2025-04-28 12:14:17',679,'EXECUTED','8:28115c82ae4f5f518af84277273eece7','addForeignKeyConstraint baseTableName=AUTOMATED_EXECUTION_FAILURE_DETAIL, constraintName=fk_automated_execution_failure_detail_failure_detail_id, referencedTableName=FAILURE_DETAIL; addForeignKeyConstraint baseTableName=AUTOMATED_EXECUTION_FAILURE...','Add foreign key constraints for automated execution failure detail table',NULL,'4.19.0',NULL,NULL,'5842419196'),('tm-9.0.0-add-remote_req_state-column-in-sprint_requirement_sync_extender-table','mbrugniere','tm/tm.changelog-9.0.0.xml','2025-04-28 12:14:17',680,'EXECUTED','8:ab49190db71d6a39dafaea23efa7e22d','addColumn tableName=SPRINT_REQUIREMENT_SYNC_EXTENDER','Add remote_req_state column in SPRINT_REQUIREMENT_SYNC_EXTENDER',NULL,'4.19.0',NULL,NULL,'5842419196'),('tm-9.0.0-add-column-flag-in-automated-execution-extender-table','xzhao','tm/tm.changelog-9.0.0.xml','2025-04-28 12:14:17',681,'EXECUTED','8:e36509f445940d4e7fbcd93cfc7fecb1','addColumn tableName=AUTOMATED_EXECUTION_EXTENDER','Add column flag in automated execution extender table to store test execution indicators',NULL,'4.19.0',NULL,NULL,'5842419196'),('tm-9.0.0','jprioux','tm/tm.changelog-9.0.0.xml','2025-04-28 12:14:17',682,'EXECUTED','8:310bb7c96ccd4a1250a7bb0ba4d7ca13','update tableName=CORE_CONFIG','Update TM database version number',NULL,'4.19.0',NULL,NULL,'5842419196');
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES (1,'\0',NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATASET`
--

DROP TABLE IF EXISTS `DATASET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATASET` (
  `DATASET_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'the DATASET primary key',
  `NAME` varchar(255) NOT NULL DEFAULT '' COMMENT 'the dataset name, should be unique among parameters of the same test case',
  `TEST_CASE_ID` bigint(20) NOT NULL COMMENT 'the test case where the parameter is declared',
  PRIMARY KEY (`DATASET_ID`),
  UNIQUE KEY `NAME` (`NAME`,`TEST_CASE_ID`),
  KEY `fk_dataset_test_case` (`TEST_CASE_ID`),
  CONSTRAINT `fk_dataset_test_case` FOREIGN KEY (`TEST_CASE_ID`) REFERENCES `TEST_CASE` (`TCLN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATASET`
--

LOCK TABLES `DATASET` WRITE;
/*!40000 ALTER TABLE `DATASET` DISABLE KEYS */;
/*!40000 ALTER TABLE `DATASET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATASET_PARAM_VALUE`
--

DROP TABLE IF EXISTS `DATASET_PARAM_VALUE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATASET_PARAM_VALUE` (
  `DATASET_PARAM_VALUE_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'the DATASET_PARAM_VALUE primary key',
  `DATASET_ID` bigint(20) NOT NULL COMMENT 'the dataset holding the value for the parameter',
  `PARAM_ID` bigint(20) NOT NULL COMMENT 'the parameter to set the value of',
  `PARAM_VALUE` varchar(1024) NOT NULL DEFAULT '',
  PRIMARY KEY (`DATASET_PARAM_VALUE_ID`),
  UNIQUE KEY `DATASET_ID` (`DATASET_ID`,`PARAM_ID`),
  KEY `fk_dataset_param_value_param` (`PARAM_ID`),
  CONSTRAINT `fk_dataset_param_value_dataset` FOREIGN KEY (`DATASET_ID`) REFERENCES `DATASET` (`DATASET_ID`),
  CONSTRAINT `fk_dataset_param_value_param` FOREIGN KEY (`PARAM_ID`) REFERENCES `PARAMETER` (`PARAM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATASET_PARAM_VALUE`
--

LOCK TABLES `DATASET_PARAM_VALUE` WRITE;
/*!40000 ALTER TABLE `DATASET_PARAM_VALUE` DISABLE KEYS */;
/*!40000 ALTER TABLE `DATASET_PARAM_VALUE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DENORMALIZED_ENVIRONMENT_TAG`
--

DROP TABLE IF EXISTS `DENORMALIZED_ENVIRONMENT_TAG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `DENORMALIZED_ENVIRONMENT_TAG` (
  `DET_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'technical id',
  `HOLDER_ID` bigint(20) NOT NULL,
  `HOLDER_TYPE` varchar(30) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL COMMENT 'the value of that particular environment tag value',
  PRIMARY KEY (`DET_ID`),
  UNIQUE KEY `uc_det_type_id_value` (`HOLDER_TYPE`,`HOLDER_ID`,`VALUE`),
  KEY `idx_det_holder_id` (`HOLDER_ID`),
  KEY `idx_det_holder_type` (`HOLDER_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DENORMALIZED_ENVIRONMENT_TAG`
--

LOCK TABLES `DENORMALIZED_ENVIRONMENT_TAG` WRITE;
/*!40000 ALTER TABLE `DENORMALIZED_ENVIRONMENT_TAG` DISABLE KEYS */;
/*!40000 ALTER TABLE `DENORMALIZED_ENVIRONMENT_TAG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DENORMALIZED_ENVIRONMENT_VARIABLE`
--

DROP TABLE IF EXISTS `DENORMALIZED_ENVIRONMENT_VARIABLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `DENORMALIZED_ENVIRONMENT_VARIABLE` (
  `DEV_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'technical id',
  `EV_ID` bigint(20) DEFAULT NULL,
  `HOLDER_ID` bigint(20) NOT NULL,
  `HOLDER_TYPE` varchar(30) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL COMMENT 'the value of that particular environment variable value',
  `TYPE` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`DEV_ID`),
  UNIQUE KEY `uc_dev_type_id_name` (`HOLDER_TYPE`,`HOLDER_ID`,`NAME`),
  KEY `idx_fk_dev_environment_variable` (`EV_ID`),
  KEY `idx_dev_holder_id` (`HOLDER_ID`),
  KEY `idx_dev_holder_type` (`HOLDER_TYPE`),
  CONSTRAINT `fk_dev_environment_variable` FOREIGN KEY (`EV_ID`) REFERENCES `ENVIRONMENT_VARIABLE` (`EV_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DENORMALIZED_ENVIRONMENT_VARIABLE`
--

LOCK TABLES `DENORMALIZED_ENVIRONMENT_VARIABLE` WRITE;
/*!40000 ALTER TABLE `DENORMALIZED_ENVIRONMENT_VARIABLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `DENORMALIZED_ENVIRONMENT_VARIABLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DENORMALIZED_FIELD_RENDERING_LOCATION`
--

DROP TABLE IF EXISTS `DENORMALIZED_FIELD_RENDERING_LOCATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `DENORMALIZED_FIELD_RENDERING_LOCATION` (
  `DFV_ID` bigint(20) NOT NULL,
  `RENDERING_LOCATION` varchar(30) NOT NULL,
  KEY `fk_dfb_render_loc_dfb` (`DFV_ID`),
  CONSTRAINT `fk_dfb_render_loc_dfb` FOREIGN KEY (`DFV_ID`) REFERENCES `DENORMALIZED_FIELD_VALUE` (`DFV_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DENORMALIZED_FIELD_RENDERING_LOCATION`
--

LOCK TABLES `DENORMALIZED_FIELD_RENDERING_LOCATION` WRITE;
/*!40000 ALTER TABLE `DENORMALIZED_FIELD_RENDERING_LOCATION` DISABLE KEYS */;
/*!40000 ALTER TABLE `DENORMALIZED_FIELD_RENDERING_LOCATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DENORMALIZED_FIELD_VALUE`
--

DROP TABLE IF EXISTS `DENORMALIZED_FIELD_VALUE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `DENORMALIZED_FIELD_VALUE` (
  `DFV_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CFV_ID` bigint(20) DEFAULT NULL COMMENT 'the custom field value where the denormalized field is copied from',
  `CODE` varchar(30) NOT NULL DEFAULT '',
  `DENORMALIZED_FIELD_HOLDER_ID` bigint(20) NOT NULL COMMENT 'the id of the denormalized field holder.',
  `DENORMALIZED_FIELD_HOLDER_TYPE` varchar(30) NOT NULL COMMENT 'the kind of entity.',
  `INPUT_TYPE` varchar(30) DEFAULT NULL,
  `LABEL` varchar(255) NOT NULL DEFAULT '',
  `POSITION` int(11) DEFAULT NULL,
  `VALUE` varchar(255) DEFAULT NULL COMMENT 'the value of that particular custom field value',
  `FIELD_TYPE` varchar(3) DEFAULT NULL,
  `LARGE_VALUE` text DEFAULT NULL COMMENT 'this column is used by rich text cufs. It contains HTML data.',
  `NUMERIC_VALUE` decimal(20,5) DEFAULT NULL COMMENT 'a column to persist denormalized numeric cuf',
  PRIMARY KEY (`DFV_ID`),
  UNIQUE KEY `u_dfv_type_id_code` (`DENORMALIZED_FIELD_HOLDER_TYPE`,`DENORMALIZED_FIELD_HOLDER_ID`,`CODE`),
  KEY `fk_dfv_cfv_binding` (`CFV_ID`),
  KEY `idx_dfv_entity_id` (`DENORMALIZED_FIELD_HOLDER_ID`),
  KEY `idx_dfv_entity_type` (`DENORMALIZED_FIELD_HOLDER_TYPE`),
  CONSTRAINT `fk_dfv_cfv_binding` FOREIGN KEY (`CFV_ID`) REFERENCES `CUSTOM_FIELD_VALUE` (`CFV_ID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DENORMALIZED_FIELD_VALUE`
--

LOCK TABLES `DENORMALIZED_FIELD_VALUE` WRITE;
/*!40000 ALTER TABLE `DENORMALIZED_FIELD_VALUE` DISABLE KEYS */;
/*!40000 ALTER TABLE `DENORMALIZED_FIELD_VALUE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DENORMALIZED_FIELD_VALUE_OPTION`
--

DROP TABLE IF EXISTS `DENORMALIZED_FIELD_VALUE_OPTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `DENORMALIZED_FIELD_VALUE_OPTION` (
  `DFV_ID` bigint(20) NOT NULL,
  `LABEL` varchar(255) NOT NULL,
  `POSITION` int(11) NOT NULL,
  KEY `fk_dfv_option_dfv` (`DFV_ID`),
  CONSTRAINT `fk_dfv_option_dfv` FOREIGN KEY (`DFV_ID`) REFERENCES `DENORMALIZED_FIELD_VALUE` (`DFV_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DENORMALIZED_FIELD_VALUE_OPTION`
--

LOCK TABLES `DENORMALIZED_FIELD_VALUE_OPTION` WRITE;
/*!40000 ALTER TABLE `DENORMALIZED_FIELD_VALUE_OPTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `DENORMALIZED_FIELD_VALUE_OPTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DISABLED_EXECUTION_STATUS`
--

DROP TABLE IF EXISTS `DISABLED_EXECUTION_STATUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `DISABLED_EXECUTION_STATUS` (
  `CL_ID` bigint(20) NOT NULL,
  `EXECUTION_STATUS` varchar(255) NOT NULL,
  KEY `FK_DISABLED_EXEC_STATUS_CL_ID` (`CL_ID`),
  CONSTRAINT `FK_DISABLED_EXEC_STATUS_CL_ID` FOREIGN KEY (`CL_ID`) REFERENCES `CAMPAIGN_LIBRARY` (`CL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DISABLED_EXECUTION_STATUS`
--

LOCK TABLES `DISABLED_EXECUTION_STATUS` WRITE;
/*!40000 ALTER TABLE `DISABLED_EXECUTION_STATUS` DISABLE KEYS */;
INSERT INTO `DISABLED_EXECUTION_STATUS` VALUES (1,'SETTLED'),(2,'SETTLED');
/*!40000 ALTER TABLE `DISABLED_EXECUTION_STATUS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ENVIRONMENT_VARIABLE`
--

DROP TABLE IF EXISTS `ENVIRONMENT_VARIABLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ENVIRONMENT_VARIABLE` (
  `EV_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FIELD_TYPE` varchar(5) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `INPUT_TYPE` varchar(30) NOT NULL,
  PRIMARY KEY (`EV_ID`),
  UNIQUE KEY `uc_ev_name` (`NAME`),
  KEY `idx_ev_name` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ENVIRONMENT_VARIABLE`
--

LOCK TABLES `ENVIRONMENT_VARIABLE` WRITE;
/*!40000 ALTER TABLE `ENVIRONMENT_VARIABLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ENVIRONMENT_VARIABLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ENVIRONMENT_VARIABLE_BINDING`
--

DROP TABLE IF EXISTS `ENVIRONMENT_VARIABLE_BINDING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ENVIRONMENT_VARIABLE_BINDING` (
  `EVB_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `EV_ID` bigint(20) NOT NULL,
  `ENTITY_ID` bigint(20) DEFAULT NULL,
  `ENTITY_TYPE` varchar(30) DEFAULT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`EVB_ID`),
  UNIQUE KEY `uc_type_evb_id_ev_id_binding` (`ENTITY_TYPE`,`ENTITY_ID`,`EV_ID`),
  KEY `idx_fk_ev_binding_ev` (`EV_ID`),
  KEY `idx_evb_entity_id` (`ENTITY_ID`),
  KEY `idx_evb_entity_type` (`ENTITY_TYPE`),
  CONSTRAINT `fk_ev_binding_ev` FOREIGN KEY (`EV_ID`) REFERENCES `ENVIRONMENT_VARIABLE` (`EV_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ENVIRONMENT_VARIABLE_BINDING`
--

LOCK TABLES `ENVIRONMENT_VARIABLE_BINDING` WRITE;
/*!40000 ALTER TABLE `ENVIRONMENT_VARIABLE_BINDING` DISABLE KEYS */;
/*!40000 ALTER TABLE `ENVIRONMENT_VARIABLE_BINDING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ENVIRONMENT_VARIABLE_OPTION`
--

DROP TABLE IF EXISTS `ENVIRONMENT_VARIABLE_OPTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ENVIRONMENT_VARIABLE_OPTION` (
  `EV_ID` bigint(20) NOT NULL,
  `LABEL` varchar(255) NOT NULL,
  `POSITION` int(11) NOT NULL,
  UNIQUE KEY `uc_ev_option_label` (`EV_ID`,`LABEL`),
  KEY `idx_fk_ev_option_ev` (`EV_ID`),
  CONSTRAINT `fk_ev_option_ev` FOREIGN KEY (`EV_ID`) REFERENCES `ENVIRONMENT_VARIABLE` (`EV_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ENVIRONMENT_VARIABLE_OPTION`
--

LOCK TABLES `ENVIRONMENT_VARIABLE_OPTION` WRITE;
/*!40000 ALTER TABLE `ENVIRONMENT_VARIABLE_OPTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `ENVIRONMENT_VARIABLE_OPTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EXECUTION`
--

DROP TABLE IF EXISTS `EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `EXECUTION` (
  `EXECUTION_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'clé primaire de l''execution. Devrait être autogénérée.',
  `TCLN_ID` bigint(20) DEFAULT NULL COMMENT 'Clé étrangère vers le cas de test référencé. Cette information est redondante puisque     il s''agit toujours du même que celui du test plan, cependant cette information ne devant     jamais évoluer il n''y a pas de risque à dénormaliser',
  `CREATED_BY` varchar(100) NOT NULL,
  `CREATED_ON` datetime NOT NULL COMMENT 'Date de création de cette execution. Il s''agit de la date de création de l''entrée dans la base, non d''une date métier.',
  `LAST_MODIFIED_BY` varchar(100) DEFAULT NULL,
  `LAST_MODIFIED_ON` datetime DEFAULT NULL COMMENT 'Date de dernière mise à jour de cette instance.',
  `DESCRIPTION` longtext DEFAULT NULL,
  `NAME` varchar(308) NOT NULL,
  `EXECUTION_MODE` varchar(255) DEFAULT NULL COMMENT 'Mode d''execution de cette execution. Bien que ce champs soit caractère variable, les données réelles    seront la représentation texte d''un type énuméré. C''est une copie du mode d''execution du cas de test référencé.',
  `EXECUTION_STATUS` varchar(255) DEFAULT NULL COMMENT 'Status d''execution de ce plan de test. Bien que ce champs soit caractère variable, les données réelles    seront la représentation texte d''un type énuméré. Sera recalculé en fonction du status de    sa derniere execution',
  `LAST_EXECUTED_BY` varchar(255) DEFAULT NULL COMMENT 'Nom du dernier utilisateur ayant execute cet instance.',
  `LAST_EXECUTED_ON` datetime DEFAULT NULL COMMENT 'Date de derniere execution de cette instance.',
  `ATTACHMENT_LIST_ID` bigint(20) DEFAULT NULL COMMENT 'clé étrangère vers un ATTACHMENT_LIST, l''entité qui gère les pièces jointes. ',
  `ISSUE_LIST_ID` bigint(20) DEFAULT NULL,
  `PREREQUISITE` longtext NOT NULL,
  `TC_STATUS` varchar(30) NOT NULL DEFAULT 'WORK_IN_PROGRESS',
  `IMPORTANCE` varchar(20) NOT NULL DEFAULT 'LOW',
  `REFERENCE` varchar(50) NOT NULL DEFAULT '',
  `TC_DESCRIPTION` longtext DEFAULT NULL,
  `DATASET_LABEL` varchar(255) DEFAULT NULL COMMENT 'the name of the dataset used',
  `TC_NAT_LABEL` varchar(100) DEFAULT NULL COMMENT 'a label to be displayed. If the item is builtin this label will be a i18n key, else the label will        be displayed verbatim',
  `TC_NAT_CODE` varchar(30) DEFAULT NULL COMMENT 'a code that helps identifying that item. Note that unlike the original version the values for       that column will not be unique.',
  `TC_NAT_ICON_NAME` varchar(100) DEFAULT NULL COMMENT 'the identifier of the icon to be displayed',
  `TC_TYP_LABEL` varchar(100) DEFAULT NULL COMMENT 'a label to be displayed. If the item is builtin this label will be a i18n key, else the label will  be displayed verbatim',
  `TC_TYP_CODE` varchar(30) DEFAULT NULL COMMENT 'a code that helps identifying that item. Note that unlike the original version the values for       that column will not be unique.',
  `TC_TYP_ICON_NAME` varchar(100) DEFAULT NULL COMMENT 'the identifier of the icon to be displayed',
  `TEST_PLAN_ITEM_ID` bigint(20) DEFAULT NULL,
  `EXECUTION_ORDER` int(11) DEFAULT NULL,
  PRIMARY KEY (`EXECUTION_ID`),
  KEY `fk_execution_attachment_list` (`ATTACHMENT_LIST_ID`),
  KEY `fk_execution_test_case` (`TCLN_ID`),
  KEY `fk_execution_issue_list` (`ISSUE_LIST_ID`),
  KEY `idx_execution` (`EXECUTION_ID`),
  KEY `idx_fk_execution_test_plan_item` (`TEST_PLAN_ITEM_ID`),
  KEY `idx_execution_last_executed_on` (`LAST_EXECUTED_ON`),
  CONSTRAINT `fk_execution_attachment_list` FOREIGN KEY (`ATTACHMENT_LIST_ID`) REFERENCES `ATTACHMENT_LIST` (`ATTACHMENT_LIST_ID`),
  CONSTRAINT `fk_execution_issue_list` FOREIGN KEY (`ISSUE_LIST_ID`) REFERENCES `ISSUE_LIST` (`ISSUE_LIST_ID`),
  CONSTRAINT `fk_execution_test_case` FOREIGN KEY (`TCLN_ID`) REFERENCES `TEST_CASE` (`TCLN_ID`),
  CONSTRAINT `fk_execution_test_plan_item` FOREIGN KEY (`TEST_PLAN_ITEM_ID`) REFERENCES `TEST_PLAN_ITEM` (`TEST_PLAN_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EXECUTION`
--

LOCK TABLES `EXECUTION` WRITE;
/*!40000 ALTER TABLE `EXECUTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EXECUTION_EXECUTION_STEPS`
--

DROP TABLE IF EXISTS `EXECUTION_EXECUTION_STEPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `EXECUTION_EXECUTION_STEPS` (
  `EXECUTION_ID` bigint(20) NOT NULL COMMENT 'clé étrangère vers la table EXECUTION.',
  `EXECUTION_STEP_ID` bigint(20) NOT NULL COMMENT 'clé étrangère vers EXECUTION_STEP',
  `EXECUTION_STEP_ORDER` int(11) NOT NULL COMMENT 'numéro d''ordre d''un pas d''execution dans la liste des pas d''executions d''une execution.',
  UNIQUE KEY `EXECUTION_ID` (`EXECUTION_ID`,`EXECUTION_STEP_ORDER`),
  KEY `idx_exec_exec_step_exec` (`EXECUTION_ID`),
  KEY `idx_exec_exec_step_exec_step` (`EXECUTION_STEP_ID`),
  CONSTRAINT `fk_exec_exec_step_exec` FOREIGN KEY (`EXECUTION_ID`) REFERENCES `EXECUTION` (`EXECUTION_ID`),
  CONSTRAINT `fk_exec_exec_step_exec_step` FOREIGN KEY (`EXECUTION_STEP_ID`) REFERENCES `EXECUTION_STEP` (`EXECUTION_STEP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EXECUTION_EXECUTION_STEPS`
--

LOCK TABLES `EXECUTION_EXECUTION_STEPS` WRITE;
/*!40000 ALTER TABLE `EXECUTION_EXECUTION_STEPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `EXECUTION_EXECUTION_STEPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `EXECUTION_ISSUES_CLOSURE`
--

DROP TABLE IF EXISTS `EXECUTION_ISSUES_CLOSURE`;
/*!50001 DROP VIEW IF EXISTS `EXECUTION_ISSUES_CLOSURE`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `EXECUTION_ISSUES_CLOSURE` AS SELECT
 1 AS `execution_id`,
  1 AS `issue_id` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `EXECUTION_STEP`
--

DROP TABLE IF EXISTS `EXECUTION_STEP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `EXECUTION_STEP` (
  `EXECUTION_STEP_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'clé primaire autogénérée.',
  `EXPECTED_RESULT` longtext NOT NULL DEFAULT '',
  `ACTION` longtext NOT NULL DEFAULT '',
  `EXECUTION_STATUS` varchar(255) DEFAULT NULL COMMENT 'Status de l''execution de ce pas d''execution. Bien que ce champs soit caractère variable, les données réelles    seront la représentation texte d''un type énuméré.',
  `LAST_EXECUTED_BY` varchar(255) DEFAULT NULL COMMENT 'Nom du dernier utilisateur ayant execute cet instance.',
  `LAST_EXECUTED_ON` datetime DEFAULT NULL COMMENT 'Date de derniere execution de cette instance.',
  `COMMENT` longtext DEFAULT NULL,
  `TEST_STEP_ID` bigint(20) DEFAULT NULL COMMENT 'Clé étrangère vers le pas de test référencé',
  `CREATED_BY` varchar(100) NOT NULL,
  `CREATED_ON` datetime NOT NULL COMMENT 'Date de création de ce pas d''execution. Il s''agit de la date de création de l''entrée dans la base, non d''une date métier.',
  `LAST_MODIFIED_BY` varchar(100) DEFAULT NULL,
  `LAST_MODIFIED_ON` datetime DEFAULT NULL COMMENT 'Date de dernière mise à jour de cette instance.',
  `ATTACHMENT_LIST_ID` bigint(20) DEFAULT NULL COMMENT 'clé étrangère vers un ATTACHMENT_LIST, l''entité qui gère les pièces jointes. ',
  `ISSUE_LIST_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`EXECUTION_STEP_ID`),
  KEY `fk_execution_step__attachment_list` (`ATTACHMENT_LIST_ID`),
  KEY `fk_execution_step_issue_list` (`ISSUE_LIST_ID`),
  KEY `fk_executionstep_teststep` (`TEST_STEP_ID`),
  KEY `idx_executionstep` (`EXECUTION_STEP_ID`),
  CONSTRAINT `fk_execution_step__attachment_list` FOREIGN KEY (`ATTACHMENT_LIST_ID`) REFERENCES `ATTACHMENT_LIST` (`ATTACHMENT_LIST_ID`),
  CONSTRAINT `fk_execution_step_issue_list` FOREIGN KEY (`ISSUE_LIST_ID`) REFERENCES `ISSUE_LIST` (`ISSUE_LIST_ID`),
  CONSTRAINT `fk_executionstep_teststep` FOREIGN KEY (`TEST_STEP_ID`) REFERENCES `TEST_STEP` (`TEST_STEP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EXECUTION_STEP`
--

LOCK TABLES `EXECUTION_STEP` WRITE;
/*!40000 ALTER TABLE `EXECUTION_STEP` DISABLE KEYS */;
/*!40000 ALTER TABLE `EXECUTION_STEP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EXPLORATORY_EXECUTION`
--

DROP TABLE IF EXISTS `EXPLORATORY_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `EXPLORATORY_EXECUTION` (
  `EXECUTION_ID` bigint(20) NOT NULL COMMENT 'primary key shared with EXECUTION',
  `ASSIGNEE_ID` bigint(20) DEFAULT NULL,
  `TASK_DIVISION` varchar(255) DEFAULT NULL,
  `REVIEWED` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`EXECUTION_ID`),
  KEY `idx_fk_exploratory_execution_assignee` (`ASSIGNEE_ID`),
  CONSTRAINT `fk_exploratory_execution_core_user` FOREIGN KEY (`ASSIGNEE_ID`) REFERENCES `CORE_USER` (`PARTY_ID`),
  CONSTRAINT `fk_exploratory_execution_execution` FOREIGN KEY (`EXECUTION_ID`) REFERENCES `EXECUTION` (`EXECUTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EXPLORATORY_EXECUTION`
--

LOCK TABLES `EXPLORATORY_EXECUTION` WRITE;
/*!40000 ALTER TABLE `EXPLORATORY_EXECUTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `EXPLORATORY_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EXPLORATORY_EXECUTION_EVENT`
--

DROP TABLE IF EXISTS `EXPLORATORY_EXECUTION_EVENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `EXPLORATORY_EXECUTION_EVENT` (
  `EVENT_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'primary key for EXPLORATORY_EXECUTION_EVENT',
  `EXECUTION_ID` bigint(20) NOT NULL COMMENT 'foreign key to EXECUTION',
  `EVENT_DATE` datetime(3) NOT NULL,
  `AUTHOR` varchar(100) NOT NULL,
  `EVENT_TYPE` varchar(30) NOT NULL,
  PRIMARY KEY (`EVENT_ID`),
  UNIQUE KEY `uc_exploratory_execution_event_execution_id_event_date` (`EXECUTION_ID`,`EVENT_DATE`),
  CONSTRAINT `fk_exploratory_execution_event_execution` FOREIGN KEY (`EXECUTION_ID`) REFERENCES `EXECUTION` (`EXECUTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EXPLORATORY_EXECUTION_EVENT`
--

LOCK TABLES `EXPLORATORY_EXECUTION_EVENT` WRITE;
/*!40000 ALTER TABLE `EXPLORATORY_EXECUTION_EVENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `EXPLORATORY_EXECUTION_EVENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EXPLORATORY_SESSION_OVERVIEW`
--

DROP TABLE IF EXISTS `EXPLORATORY_SESSION_OVERVIEW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `EXPLORATORY_SESSION_OVERVIEW` (
  `OVERVIEW_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ITEM_TEST_PLAN_ID` bigint(20) DEFAULT NULL,
  `CHARTER` longtext DEFAULT NULL COMMENT 'the charter for an exploratory session overview',
  `SESSION_DURATION` int(11) DEFAULT NULL COMMENT 'the test session planned duration in minutes',
  `NAME` varchar(255) NOT NULL,
  `REFERENCE` varchar(50) NOT NULL DEFAULT '',
  `DUE_DATE` datetime DEFAULT NULL,
  `SESSION_STATUS` varchar(50) NOT NULL DEFAULT 'TO_DO',
  `COMMENTS` longtext DEFAULT NULL,
  `ATTACHMENT_LIST_ID` bigint(20) DEFAULT NULL COMMENT 'Foreign key to attachment list',
  `TEST_PLAN_ITEM_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`OVERVIEW_ID`),
  KEY `idx_fk_exploratory_session_overview_itpi` (`ITEM_TEST_PLAN_ID`),
  KEY `idx_fk_exploratory_session_overview_attachment_list` (`ATTACHMENT_LIST_ID`),
  KEY `idx_fk_exploratory_session_test_plan_item` (`TEST_PLAN_ITEM_ID`),
  CONSTRAINT `fk_exploratory_session_overview` FOREIGN KEY (`ITEM_TEST_PLAN_ID`) REFERENCES `ITERATION_TEST_PLAN_ITEM` (`ITEM_TEST_PLAN_ID`),
  CONSTRAINT `fk_exploratory_session_overview_attachment_list` FOREIGN KEY (`ATTACHMENT_LIST_ID`) REFERENCES `ATTACHMENT_LIST` (`ATTACHMENT_LIST_ID`),
  CONSTRAINT `fk_exploratory_session_test_plan_item` FOREIGN KEY (`TEST_PLAN_ITEM_ID`) REFERENCES `TEST_PLAN_ITEM` (`TEST_PLAN_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EXPLORATORY_SESSION_OVERVIEW`
--

LOCK TABLES `EXPLORATORY_SESSION_OVERVIEW` WRITE;
/*!40000 ALTER TABLE `EXPLORATORY_SESSION_OVERVIEW` DISABLE KEYS */;
/*!40000 ALTER TABLE `EXPLORATORY_SESSION_OVERVIEW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EXPLORATORY_TEST_CASE`
--

DROP TABLE IF EXISTS `EXPLORATORY_TEST_CASE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `EXPLORATORY_TEST_CASE` (
  `TCLN_ID` bigint(20) NOT NULL COMMENT 'primary key shared with TEST_CASE',
  `CHARTER` longtext DEFAULT NULL COMMENT 'the charter for an exploratory test_case',
  `SESSION_DURATION` int(11) DEFAULT NULL COMMENT 'the test session planned duration in minutes',
  PRIMARY KEY (`TCLN_ID`),
  CONSTRAINT `fk_exploratory_test_case` FOREIGN KEY (`TCLN_ID`) REFERENCES `TEST_CASE` (`TCLN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EXPLORATORY_TEST_CASE`
--

LOCK TABLES `EXPLORATORY_TEST_CASE` WRITE;
/*!40000 ALTER TABLE `EXPLORATORY_TEST_CASE` DISABLE KEYS */;
/*!40000 ALTER TABLE `EXPLORATORY_TEST_CASE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FAILURE_DETAIL`
--

DROP TABLE IF EXISTS `FAILURE_DETAIL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `FAILURE_DETAIL` (
  `FAILURE_DETAIL_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'primary key for FAILURE_DETAIL',
  `MESSAGE` text DEFAULT NULL,
  `CREATED_BY` varchar(100) NOT NULL,
  `CREATED_ON` datetime NOT NULL,
  `ITEM_TEST_PLAN_ID` bigint(20) NOT NULL COMMENT 'foreign key to ITPI',
  `ISSUE_LIST_ID` bigint(20) DEFAULT NULL COMMENT 'Foreign key to issue list',
  PRIMARY KEY (`FAILURE_DETAIL_ID`),
  KEY `idx_failure_detail_item_test_plan_id` (`ITEM_TEST_PLAN_ID`),
  KEY `idx_failure_detail_created_by` (`CREATED_BY`),
  KEY `idx_fk_failure_detail_issue_list_id` (`ISSUE_LIST_ID`),
  CONSTRAINT `fk_failure_detail_issue_list` FOREIGN KEY (`ISSUE_LIST_ID`) REFERENCES `ISSUE_LIST` (`ISSUE_LIST_ID`),
  CONSTRAINT `fk_failure_detail_itpi_id` FOREIGN KEY (`ITEM_TEST_PLAN_ID`) REFERENCES `ITERATION_TEST_PLAN_ITEM` (`ITEM_TEST_PLAN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FAILURE_DETAIL`
--

LOCK TABLES `FAILURE_DETAIL` WRITE;
/*!40000 ALTER TABLE `FAILURE_DETAIL` DISABLE KEYS */;
/*!40000 ALTER TABLE `FAILURE_DETAIL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GRID_COLUMN_DISPLAY_CONFIGURATION`
--

DROP TABLE IF EXISTS `GRID_COLUMN_DISPLAY_CONFIGURATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `GRID_COLUMN_DISPLAY_CONFIGURATION` (
  `GCDC_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'primary key for GRID_COLUMN_DISPLAY_CONFIGURATION',
  `GCDR_ID` bigint(20) NOT NULL COMMENT 'foreign key to GRID_COLUMN_DISPLAY_REFERENCE',
  `ACTIVE_COLUMN_ID` varchar(100) NOT NULL,
  PRIMARY KEY (`GCDC_ID`),
  KEY `idx_fk_grid_column_display_configuration_gcdr_id` (`GCDR_ID`),
  CONSTRAINT `fk_grid_col_display_config_grid_col_display_ref` FOREIGN KEY (`GCDR_ID`) REFERENCES `GRID_COLUMN_DISPLAY_REFERENCE` (`GCDR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GRID_COLUMN_DISPLAY_CONFIGURATION`
--

LOCK TABLES `GRID_COLUMN_DISPLAY_CONFIGURATION` WRITE;
/*!40000 ALTER TABLE `GRID_COLUMN_DISPLAY_CONFIGURATION` DISABLE KEYS */;
/*!40000 ALTER TABLE `GRID_COLUMN_DISPLAY_CONFIGURATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GRID_COLUMN_DISPLAY_REFERENCE`
--

DROP TABLE IF EXISTS `GRID_COLUMN_DISPLAY_REFERENCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `GRID_COLUMN_DISPLAY_REFERENCE` (
  `GCDR_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'primary key for GRID_COLUMN_DISPLAY_REFERENCE',
  `PARTY_ID` bigint(20) NOT NULL COMMENT 'foreign key to CORE_USER',
  `GRID_ID` varchar(100) NOT NULL,
  `PROJECT_ID` bigint(20) DEFAULT NULL COMMENT 'foreign key to PROJECT',
  PRIMARY KEY (`GCDR_ID`),
  KEY `idx_fk_grid_column_display_reference_party_id` (`PARTY_ID`),
  KEY `idx_fk_grid_column_display_reference_project_id` (`PROJECT_ID`),
  CONSTRAINT `fk_grid_column_display_reference_core_user` FOREIGN KEY (`PARTY_ID`) REFERENCES `CORE_USER` (`PARTY_ID`),
  CONSTRAINT `fk_grid_column_display_reference_project` FOREIGN KEY (`PROJECT_ID`) REFERENCES `PROJECT` (`PROJECT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GRID_COLUMN_DISPLAY_REFERENCE`
--

LOCK TABLES `GRID_COLUMN_DISPLAY_REFERENCE` WRITE;
/*!40000 ALTER TABLE `GRID_COLUMN_DISPLAY_REFERENCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `GRID_COLUMN_DISPLAY_REFERENCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HIGH_LEVEL_REQUIREMENT`
--

DROP TABLE IF EXISTS `HIGH_LEVEL_REQUIREMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `HIGH_LEVEL_REQUIREMENT` (
  `RLN_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`RLN_ID`),
  CONSTRAINT `fk_high_lvl_requirement_requirement` FOREIGN KEY (`RLN_ID`) REFERENCES `REQUIREMENT` (`RLN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HIGH_LEVEL_REQUIREMENT`
--

LOCK TABLES `HIGH_LEVEL_REQUIREMENT` WRITE;
/*!40000 ALTER TABLE `HIGH_LEVEL_REQUIREMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `HIGH_LEVEL_REQUIREMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INFO_LIST`
--

DROP TABLE IF EXISTS `INFO_LIST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `INFO_LIST` (
  `INFO_LIST_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'the ID',
  `LABEL` varchar(100) DEFAULT NULL COMMENT 'the label for this list. Would noly be displayed in the administration page as the name  actually displayed to regular uses would depend on the role of that list on a given projet (criticality, nature etc)',
  `DESCRIPTION` text DEFAULT NULL COMMENT 'a description for that list',
  `CODE` varchar(30) NOT NULL COMMENT 'a code that helps identifying that list',
  `CREATED_BY` varchar(100) NOT NULL,
  `CREATED_ON` datetime NOT NULL COMMENT 'the time at when that list was created',
  `LAST_MODIFIED_BY` varchar(100) DEFAULT NULL,
  `LAST_MODIFIED_ON` datetime DEFAULT NULL COMMENT 'Time when the list was touched last',
  PRIMARY KEY (`INFO_LIST_ID`),
  UNIQUE KEY `CODE` (`CODE`),
  UNIQUE KEY `LABEL` (`LABEL`),
  KEY `idx_info_list_code` (`CODE`),
  KEY `idx_info_list_label` (`LABEL`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INFO_LIST`
--

LOCK TABLES `INFO_LIST` WRITE;
/*!40000 ALTER TABLE `INFO_LIST` DISABLE KEYS */;
INSERT INTO `INFO_LIST` VALUES (1,'infolist.category.default','','DEF_REQ_CAT','system','2010-01-01 00:00:00','system','2010-01-01 00:00:00'),(2,'infolist.nature.default','','DEF_TC_NAT','system','2010-01-01 00:00:00','system','2010-01-01 00:00:00'),(3,'infolist.type.default','','DEF_TC_TYP','system','2010-01-01 00:00:00','system','2010-01-01 00:00:00');
/*!40000 ALTER TABLE `INFO_LIST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INFO_LIST_ITEM`
--

DROP TABLE IF EXISTS `INFO_LIST_ITEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `INFO_LIST_ITEM` (
  `ITEM_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'an ID, what did you expect ?',
  `ITEM_TYPE` varchar(3) NOT NULL COMMENT 'discriminator telling whether this item is user-made or builtin in the app. Pick one of ''USR'' or ''SYS''',
  `LIST_ID` bigint(20) DEFAULT NULL COMMENT 'foreign key to the list this item belongs to. Allows ''NULL'' for Hibernate to work.',
  `ITEM_INDEX` int(11) DEFAULT NULL COMMENT 'the position of that item in the list. Allows ''NULL'' for Hibernate to work.',
  `LABEL` varchar(100) NOT NULL COMMENT 'a label to be displayed. If the item is builtin this label will be a i18n key, else the label will be displayed verbatim',
  `CODE` varchar(30) NOT NULL COMMENT 'a code that helps identifying that item',
  `IS_DEFAULT` bit(1) NOT NULL DEFAULT b'0' COMMENT 'whether this item is the default item for         its list. Only one item per list should have it true ',
  `ICON_NAME` varchar(100) DEFAULT NULL COMMENT 'the identifier of the icon to be displayed',
  `COLOUR` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`ITEM_ID`),
  UNIQUE KEY `CODE` (`CODE`),
  KEY `fk_info_item_list` (`LIST_ID`),
  KEY `idx_info_list_item_code` (`CODE`),
  CONSTRAINT `fk_info_item_list` FOREIGN KEY (`LIST_ID`) REFERENCES `INFO_LIST` (`INFO_LIST_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INFO_LIST_ITEM`
--

LOCK TABLES `INFO_LIST_ITEM` WRITE;
/*!40000 ALTER TABLE `INFO_LIST_ITEM` DISABLE KEYS */;
INSERT INTO `INFO_LIST_ITEM` VALUES (1,'SYS',1,0,'requirement.category.CAT_FUNCTIONAL','CAT_FUNCTIONAL','\0','monitor','#7594CD'),(2,'SYS',1,1,'requirement.category.CAT_NON_FUNCTIONAL','CAT_NON_FUNCTIONAL','\0','server','#BB5759'),(3,'SYS',1,2,'requirement.category.CAT_USE_CASE','CAT_USE_CASE','\0','read','#A1C181'),(4,'SYS',1,3,'requirement.category.CAT_BUSINESS','CAT_BUSINESS','\0','briefcase','#619B8A'),(5,'SYS',1,4,'requirement.category.CAT_TEST_REQUIREMENT','CAT_TEST_REQUIREMENT','\0','checked_checkbox','#C3AB77'),(6,'SYS',1,5,'requirement.category.CAT_UNDEFINED','CAT_UNDEFINED','','indeterminate_checkbox_empty','#CDCDCD'),(7,'SYS',1,6,'requirement.category.CAT_ERGONOMIC','CAT_ERGONOMIC','\0','puzzle','#8F6057'),(8,'SYS',1,7,'requirement.category.CAT_PERFORMANCE','CAT_PERFORMANCE','\0','dashboard','#FCCA46'),(9,'SYS',1,8,'requirement.category.CAT_TECHNICAL','CAT_TECHNICAL','\0','key','#233D4D'),(10,'SYS',1,9,'requirement.category.CAT_USER_STORY','CAT_USER_STORY','\0','bookmark','#094C75'),(11,'SYS',1,10,'requirement.category.CAT_SECURITY','CAT_SECURITY','\0','protect','#FE7F2D'),(12,'SYS',2,0,'test-case.nature.NAT_UNDEFINED','NAT_UNDEFINED','','indeterminate_checkbox_empty','#CDCDCD'),(13,'SYS',2,1,'test-case.nature.NAT_FUNCTIONAL_TESTING','NAT_FUNCTIONAL_TESTING','\0','monitor','#7594CD'),(14,'SYS',2,2,'test-case.nature.NAT_BUSINESS_TESTING','NAT_BUSINESS_TESTING','\0','briefcase','#619B8A'),(15,'SYS',2,3,'test-case.nature.NAT_USER_TESTING','NAT_USER_TESTING','\0','user','#A1C181'),(16,'SYS',2,4,'test-case.nature.NAT_NON_FUNCTIONAL_TESTING','NAT_NON_FUNCTIONAL_TESTING','\0','server','#BB5759'),(17,'SYS',2,5,'test-case.nature.NAT_PERFORMANCE_TESTING','NAT_PERFORMANCE_TESTING','\0','dashboard','#FCCA46'),(18,'SYS',2,6,'test-case.nature.NAT_SECURITY_TESTING','NAT_SECURITY_TESTING','\0','protect','#FE7F2D'),(19,'SYS',2,7,'test-case.nature.NAT_ATDD','NAT_ATDD','\0','circular_arrows','#233D4D'),(20,'SYS',3,0,'test-case.type.TYP_UNDEFINED','TYP_UNDEFINED','','indeterminate_checkbox_empty','#CDCDCD'),(21,'SYS',3,1,'test-case.type.TYP_COMPLIANCE_TESTING','TYP_COMPLIANCE_TESTING','\0','task_completed','#5B9367'),(22,'SYS',3,2,'test-case.type.TYP_CORRECTION_TESTING','TYP_CORRECTION_TESTING','\0','bug','#CD533B'),(23,'SYS',3,3,'test-case.type.TYP_EVOLUTION_TESTING','TYP_EVOLUTION_TESTING','\0','circled_up_right','#D8A86E'),(24,'SYS',3,4,'test-case.type.TYP_REGRESSION_TESTING','TYP_REGRESSION_TESTING','\0','circular_arrows','#F2E77E'),(25,'SYS',3,5,'test-case.type.TYP_END_TO_END_TESTING','TYP_END_TO_END_TESTING','\0','journey','#2D5635'),(26,'SYS',3,6,'test-case.type.TYP_PARTNER_TESTING','TYP_PARTNER_TESTING','\0','handshake','#F2E2CE');
/*!40000 ALTER TABLE `INFO_LIST_ITEM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ISSUE`
--

DROP TABLE IF EXISTS `ISSUE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ISSUE` (
  `ISSUE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `REMOTE_ISSUE_ID` varchar(255) NOT NULL COMMENT 'considering the different types    a bugtracker may use for its own primary keys, we use here a varchar type as it is generic enough',
  `ISSUE_LIST_ID` bigint(20) NOT NULL,
  `BUGTRACKER_ID` bigint(20) NOT NULL,
  `ADDITIONAL_DATA` text DEFAULT NULL COMMENT 'Column for json info. Use it only when remote_key is not enough to fetch issue',
  PRIMARY KEY (`ISSUE_ID`),
  KEY `idx_issue` (`ISSUE_ID`),
  KEY `fk_issue_issue_list` (`ISSUE_LIST_ID`),
  KEY `fk_issue_bugtracker` (`BUGTRACKER_ID`),
  KEY `issue_remote_issue_id_idx` (`REMOTE_ISSUE_ID`),
  CONSTRAINT `fk_issue_bugtracker` FOREIGN KEY (`BUGTRACKER_ID`) REFERENCES `BUGTRACKER` (`BUGTRACKER_ID`),
  CONSTRAINT `fk_issue_issue_list` FOREIGN KEY (`ISSUE_LIST_ID`) REFERENCES `ISSUE_LIST` (`ISSUE_LIST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ISSUE`
--

LOCK TABLES `ISSUE` WRITE;
/*!40000 ALTER TABLE `ISSUE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ISSUE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ISSUE_LIST`
--

DROP TABLE IF EXISTS `ISSUE_LIST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ISSUE_LIST` (
  `ISSUE_LIST_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ISSUE_LIST_ID`),
  KEY `idx_issue_list` (`ISSUE_LIST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ISSUE_LIST`
--

LOCK TABLES `ISSUE_LIST` WRITE;
/*!40000 ALTER TABLE `ISSUE_LIST` DISABLE KEYS */;
/*!40000 ALTER TABLE `ISSUE_LIST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ITEM_TEST_PLAN_EXECUTION`
--

DROP TABLE IF EXISTS `ITEM_TEST_PLAN_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ITEM_TEST_PLAN_EXECUTION` (
  `ITEM_TEST_PLAN_ID` bigint(20) NOT NULL COMMENT 'clé étrangère vers ITEM_TEST_PLAN.',
  `EXECUTION_ID` bigint(20) NOT NULL COMMENT 'clé étrangère vers la table EXECUTION',
  `EXECUTION_ORDER` int(11) NOT NULL COMMENT 'numéro d''ordre d''une execution dans la liste des test plans d''une itération.',
  KEY `idx_testplan_exec_testplan` (`ITEM_TEST_PLAN_ID`),
  KEY `idx_testplan_exec_exec` (`EXECUTION_ID`),
  CONSTRAINT `fk_testplan_exec_exec` FOREIGN KEY (`EXECUTION_ID`) REFERENCES `EXECUTION` (`EXECUTION_ID`),
  CONSTRAINT `fk_testplan_exec_testplan` FOREIGN KEY (`ITEM_TEST_PLAN_ID`) REFERENCES `ITERATION_TEST_PLAN_ITEM` (`ITEM_TEST_PLAN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ITEM_TEST_PLAN_EXECUTION`
--

LOCK TABLES `ITEM_TEST_PLAN_EXECUTION` WRITE;
/*!40000 ALTER TABLE `ITEM_TEST_PLAN_EXECUTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `ITEM_TEST_PLAN_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ITEM_TEST_PLAN_LIST`
--

DROP TABLE IF EXISTS `ITEM_TEST_PLAN_LIST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ITEM_TEST_PLAN_LIST` (
  `ITERATION_ID` bigint(20) NOT NULL COMMENT 'clé étrangère vers ITERATION.',
  `ITEM_TEST_PLAN_ID` bigint(20) NOT NULL COMMENT 'clé étrangère vers la table ITEM_TEST_PLAN',
  `ITEM_TEST_PLAN_ORDER` int(11) NOT NULL COMMENT 'numéro d''ordre d''une execution dans la liste des test plans d''une itération.',
  UNIQUE KEY `uc_item_test_plan_list_order` (`ITERATION_ID`,`ITEM_TEST_PLAN_ORDER`),
  KEY `idx_ITEM_TESTplan_iteration` (`ITERATION_ID`),
  KEY `idx_ITEM_TESTplan_testplan` (`ITEM_TEST_PLAN_ID`),
  CONSTRAINT `fk_ITEM_TESTplan_testplan` FOREIGN KEY (`ITEM_TEST_PLAN_ID`) REFERENCES `ITERATION_TEST_PLAN_ITEM` (`ITEM_TEST_PLAN_ID`),
  CONSTRAINT `fk_item_test_plan_iteration` FOREIGN KEY (`ITERATION_ID`) REFERENCES `ITERATION` (`ITERATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ITEM_TEST_PLAN_LIST`
--

LOCK TABLES `ITEM_TEST_PLAN_LIST` WRITE;
/*!40000 ALTER TABLE `ITEM_TEST_PLAN_LIST` DISABLE KEYS */;
/*!40000 ALTER TABLE `ITEM_TEST_PLAN_LIST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ITERATION`
--

DROP TABLE IF EXISTS `ITERATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ITERATION` (
  `ITERATION_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` longtext DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  `CREATED_BY` varchar(100) NOT NULL,
  `CREATED_ON` datetime NOT NULL,
  `LAST_MODIFIED_BY` varchar(100) DEFAULT NULL,
  `LAST_MODIFIED_ON` datetime DEFAULT NULL,
  `ACTUAL_END_AUTO` bit(1) NOT NULL,
  `ACTUAL_END_DATE` datetime DEFAULT NULL,
  `ACTUAL_START_AUTO` bit(1) NOT NULL,
  `ACTUAL_START_DATE` datetime DEFAULT NULL,
  `SCHEDULED_END_DATE` datetime DEFAULT NULL,
  `SCHEDULED_START_DATE` datetime DEFAULT NULL,
  `ATTACHMENT_LIST_ID` bigint(20) DEFAULT NULL COMMENT 'clé étrangère vers un ATTACHMENT_LIST, l''entité qui gère les pièces jointes. ',
  `REFERENCE` varchar(50) DEFAULT '' COMMENT 'a reference lavel for an iteration',
  `ITERATION_STATUS` varchar(30) NOT NULL DEFAULT 'UNDEFINED',
  `UUID` varchar(36) NOT NULL,
  PRIMARY KEY (`ITERATION_ID`),
  UNIQUE KEY `uc_iteration_uuid` (`UUID`),
  KEY `fk_iteration__attachment_list` (`ATTACHMENT_LIST_ID`),
  KEY `idx_iteration_name` (`NAME`),
  CONSTRAINT `fk_iteration__attachment_list` FOREIGN KEY (`ATTACHMENT_LIST_ID`) REFERENCES `ATTACHMENT_LIST` (`ATTACHMENT_LIST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ITERATION`
--

LOCK TABLES `ITERATION` WRITE;
/*!40000 ALTER TABLE `ITERATION` DISABLE KEYS */;
/*!40000 ALTER TABLE `ITERATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ITERATION_TEST_PLAN_ITEM`
--

DROP TABLE IF EXISTS `ITERATION_TEST_PLAN_ITEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ITERATION_TEST_PLAN_ITEM` (
  `ITEM_TEST_PLAN_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'clé primaire du test plan. Devrait être autogénérée.',
  `EXECUTION_STATUS` varchar(255) DEFAULT NULL COMMENT 'Status d''execution de ce plan de test. Bien que ce champs soit caractère variable, les données réelles    seront la représentation texte d''un type énuméré. Sera recalculé en fonction du status de    sa derniere execution',
  `LAST_EXECUTED_BY` varchar(255) DEFAULT NULL COMMENT 'Nom du dernier utilisateur ayant execute cet instance.',
  `LAST_EXECUTED_ON` datetime DEFAULT NULL COMMENT 'Date de derniere execution de cette instance.',
  `TCLN_ID` bigint(20) DEFAULT NULL COMMENT 'Clé étrangère vers le cas de test référencé',
  `LABEL` varchar(255) DEFAULT NULL COMMENT 'Le label (duplicata du nom du cas de test) du test plan',
  `CREATED_BY` varchar(100) NOT NULL,
  `CREATED_ON` datetime NOT NULL COMMENT 'Date de création du test plan. Il s''agit de la date de création de l''entrée dans la base, non d''une date métier.',
  `LAST_MODIFIED_BY` varchar(100) DEFAULT NULL,
  `LAST_MODIFIED_ON` datetime DEFAULT NULL COMMENT 'Date de dernière mise à jour de cette instance.',
  `USER_ID` bigint(20) DEFAULT NULL COMMENT 'Id de l''utilisateur assigné a ce cas de test reférenncé',
  `DATASET_ID` bigint(20) DEFAULT NULL COMMENT 'the dataset the test plan item should use to replace the parameters in new execution steps',
  PRIMARY KEY (`ITEM_TEST_PLAN_ID`),
  KEY `fk_itertestplan_test_case` (`TCLN_ID`),
  KEY `idx_itertestplan` (`ITEM_TEST_PLAN_ID`),
  KEY `fk_itertestplan_user` (`USER_ID`),
  KEY `fk_iteration_test_plan_item_dataset` (`DATASET_ID`),
  CONSTRAINT `fk_iteration_test_plan_item_dataset` FOREIGN KEY (`DATASET_ID`) REFERENCES `DATASET` (`DATASET_ID`),
  CONSTRAINT `fk_itertestplan_test_case` FOREIGN KEY (`TCLN_ID`) REFERENCES `TEST_CASE` (`TCLN_ID`),
  CONSTRAINT `fk_itertestplan_user` FOREIGN KEY (`USER_ID`) REFERENCES `CORE_USER` (`PARTY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ITERATION_TEST_PLAN_ITEM`
--

LOCK TABLES `ITERATION_TEST_PLAN_ITEM` WRITE;
/*!40000 ALTER TABLE `ITERATION_TEST_PLAN_ITEM` DISABLE KEYS */;
/*!40000 ALTER TABLE `ITERATION_TEST_PLAN_ITEM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ITERATION_TEST_SUITE`
--

DROP TABLE IF EXISTS `ITERATION_TEST_SUITE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ITERATION_TEST_SUITE` (
  `ITERATION_ID` bigint(20) NOT NULL,
  `TEST_SUITE_ID` bigint(20) NOT NULL,
  `ITERATION_TEST_SUITE_ORDER` int(11) NOT NULL,
  UNIQUE KEY `uc_iteration_iteration_test_suite_order` (`ITERATION_ID`,`ITERATION_TEST_SUITE_ORDER`),
  KEY `dx_iteration_test_suite_iteration` (`ITERATION_ID`),
  KEY `fk_iteration_test_suite_suite` (`TEST_SUITE_ID`),
  CONSTRAINT `fk_iteration_test_suite_iteration` FOREIGN KEY (`ITERATION_ID`) REFERENCES `ITERATION` (`ITERATION_ID`),
  CONSTRAINT `fk_iteration_test_suite_suite` FOREIGN KEY (`TEST_SUITE_ID`) REFERENCES `TEST_SUITE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ITERATION_TEST_SUITE`
--

LOCK TABLES `ITERATION_TEST_SUITE` WRITE;
/*!40000 ALTER TABLE `ITERATION_TEST_SUITE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ITERATION_TEST_SUITE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYWORD_EXECUTION`
--

DROP TABLE IF EXISTS `KEYWORD_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYWORD_EXECUTION` (
  `EXECUTION_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`EXECUTION_ID`),
  CONSTRAINT `fk_keyword_exec_exec` FOREIGN KEY (`EXECUTION_ID`) REFERENCES `EXECUTION` (`EXECUTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYWORD_EXECUTION`
--

LOCK TABLES `KEYWORD_EXECUTION` WRITE;
/*!40000 ALTER TABLE `KEYWORD_EXECUTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `KEYWORD_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYWORD_TEST_CASE`
--

DROP TABLE IF EXISTS `KEYWORD_TEST_CASE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYWORD_TEST_CASE` (
  `TCLN_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`TCLN_ID`),
  CONSTRAINT `fk_keyword_tc_tc` FOREIGN KEY (`TCLN_ID`) REFERENCES `TEST_CASE` (`TCLN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYWORD_TEST_CASE`
--

LOCK TABLES `KEYWORD_TEST_CASE` WRITE;
/*!40000 ALTER TABLE `KEYWORD_TEST_CASE` DISABLE KEYS */;
/*!40000 ALTER TABLE `KEYWORD_TEST_CASE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYWORD_TEST_STEP`
--

DROP TABLE IF EXISTS `KEYWORD_TEST_STEP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYWORD_TEST_STEP` (
  `TEST_STEP_ID` bigint(20) NOT NULL COMMENT 'Shared key with TEST_STEP table',
  `ACTION_WORD_ID` bigint(20) NOT NULL COMMENT 'The action word which this test step uses',
  `KEYWORD` varchar(20) NOT NULL COMMENT 'A keyword test step keyword',
  `DATATABLE` text DEFAULT NULL COMMENT 'A keyword test step datatable',
  `DOCSTRING` text DEFAULT NULL COMMENT 'A keyword test step docstring',
  `COMMENT` text DEFAULT NULL COMMENT 'A keyword test step comment',
  PRIMARY KEY (`TEST_STEP_ID`),
  KEY `idx_fk_keyword_test_step_action_word` (`ACTION_WORD_ID`),
  CONSTRAINT `fk_keyword_test_step_action_word_id` FOREIGN KEY (`ACTION_WORD_ID`) REFERENCES `ACTION_WORD` (`ACTION_WORD_ID`),
  CONSTRAINT `fk_keyword_test_step_test_step` FOREIGN KEY (`TEST_STEP_ID`) REFERENCES `TEST_STEP` (`TEST_STEP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYWORD_TEST_STEP`
--

LOCK TABLES `KEYWORD_TEST_STEP` WRITE;
/*!40000 ALTER TABLE `KEYWORD_TEST_STEP` DISABLE KEYS */;
/*!40000 ALTER TABLE `KEYWORD_TEST_STEP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LIBRARY_PLUGIN_BINDING`
--

DROP TABLE IF EXISTS `LIBRARY_PLUGIN_BINDING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `LIBRARY_PLUGIN_BINDING` (
  `PLUGIN_BINDING_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'primary key (autogenerated)',
  `LIBRARY_ID` bigint(20) DEFAULT NULL COMMENT 'ID of the library. It is explicitely nullable because hibernate will first create the row then update this column.',
  `LIBRARY_TYPE` char(1) NOT NULL COMMENT 'discriminator of the library. T: test case library, R : requirement library, C : campaign library',
  `PLUGIN_ID` varchar(50) NOT NULL COMMENT 'id of the plugin. Note that those plugins aren''t stored in the database and the plugin registry is purely software                (it is basically based on the presence/absence of an OSGI services published by each plugin) so we cannot really enforce referential               integrity. Still, although technically that column cannot be a foreign key, the application uses it as if.',
  `PLUGIN_TYPE` varchar(25) DEFAULT NULL COMMENT 'This column specifies which type of plugin is used. for now only one type used: Automation.',
  `ACTIVE` bit(1) DEFAULT b'1' COMMENT 'This column specifies if plugin is enable or disable for a project .',
  PRIMARY KEY (`PLUGIN_BINDING_ID`),
  UNIQUE KEY `uniq_plugin_binding` (`LIBRARY_ID`,`LIBRARY_TYPE`,`PLUGIN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LIBRARY_PLUGIN_BINDING`
--

LOCK TABLES `LIBRARY_PLUGIN_BINDING` WRITE;
/*!40000 ALTER TABLE `LIBRARY_PLUGIN_BINDING` DISABLE KEYS */;
/*!40000 ALTER TABLE `LIBRARY_PLUGIN_BINDING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LIBRARY_PLUGIN_BINDING_PROPERTY`
--

DROP TABLE IF EXISTS `LIBRARY_PLUGIN_BINDING_PROPERTY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `LIBRARY_PLUGIN_BINDING_PROPERTY` (
  `PLUGIN_BINDING_ID` bigint(20) NOT NULL COMMENT 'foreign key to LIBRARY_PLUGIN_BINDING',
  `PLUGIN_BINDING_KEY` varchar(30) NOT NULL COMMENT 'key of this property',
  `PLUGIN_BINDING_VALUE` longtext DEFAULT NULL,
  KEY `fk_libplugin_property_libplugin` (`PLUGIN_BINDING_ID`),
  CONSTRAINT `fk_libplugin_property_libplugin` FOREIGN KEY (`PLUGIN_BINDING_ID`) REFERENCES `LIBRARY_PLUGIN_BINDING` (`PLUGIN_BINDING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LIBRARY_PLUGIN_BINDING_PROPERTY`
--

LOCK TABLES `LIBRARY_PLUGIN_BINDING_PROPERTY` WRITE;
/*!40000 ALTER TABLE `LIBRARY_PLUGIN_BINDING_PROPERTY` DISABLE KEYS */;
/*!40000 ALTER TABLE `LIBRARY_PLUGIN_BINDING_PROPERTY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MILESTONE`
--

DROP TABLE IF EXISTS `MILESTONE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `MILESTONE` (
  `MILESTONE_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Primary key',
  `LABEL` varchar(30) NOT NULL COMMENT 'Milestone label',
  `STATUS` varchar(30) DEFAULT NULL COMMENT 'Milestone status',
  `END_DATE` datetime NOT NULL COMMENT 'Term date',
  `DESCRIPTION` longtext DEFAULT NULL COMMENT 'Milestone description',
  `M_RANGE` varchar(30) NOT NULL COMMENT 'Milestone range',
  `CREATED_BY` varchar(100) NOT NULL,
  `CREATED_ON` datetime NOT NULL COMMENT 'Date of creation.',
  `LAST_MODIFIED_BY` varchar(100) DEFAULT NULL,
  `LAST_MODIFIED_ON` datetime DEFAULT NULL COMMENT 'Date of last update',
  `USER_ID` bigint(20) NOT NULL COMMENT 'the user that own the milestone',
  PRIMARY KEY (`MILESTONE_ID`),
  UNIQUE KEY `LABEL` (`LABEL`),
  KEY `fk_milestone_owner` (`USER_ID`),
  KEY `idx_milestone` (`MILESTONE_ID`),
  CONSTRAINT `fk_milestone_owner` FOREIGN KEY (`USER_ID`) REFERENCES `CORE_USER` (`PARTY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MILESTONE`
--

LOCK TABLES `MILESTONE` WRITE;
/*!40000 ALTER TABLE `MILESTONE` DISABLE KEYS */;
/*!40000 ALTER TABLE `MILESTONE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MILESTONE_BINDING`
--

DROP TABLE IF EXISTS `MILESTONE_BINDING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `MILESTONE_BINDING` (
  `MILESTONE_BINDING_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MILESTONE_ID` bigint(20) NOT NULL,
  `PROJECT_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`MILESTONE_BINDING_ID`),
  KEY `FK_MILESTONE_BINDING_PROJECT` (`PROJECT_ID`),
  KEY `FK_MILESTONE_BINDING_MILESTONE` (`MILESTONE_ID`),
  CONSTRAINT `FK_MILESTONE_BINDING_MILESTONE` FOREIGN KEY (`MILESTONE_ID`) REFERENCES `MILESTONE` (`MILESTONE_ID`),
  CONSTRAINT `FK_MILESTONE_BINDING_PROJECT` FOREIGN KEY (`PROJECT_ID`) REFERENCES `PROJECT` (`PROJECT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MILESTONE_BINDING`
--

LOCK TABLES `MILESTONE_BINDING` WRITE;
/*!40000 ALTER TABLE `MILESTONE_BINDING` DISABLE KEYS */;
/*!40000 ALTER TABLE `MILESTONE_BINDING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MILESTONE_BINDING_PERIMETER`
--

DROP TABLE IF EXISTS `MILESTONE_BINDING_PERIMETER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `MILESTONE_BINDING_PERIMETER` (
  `MILESTONE_BINDING_PERIMETER_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MILESTONE_ID` bigint(20) NOT NULL,
  `PROJECT_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`MILESTONE_BINDING_PERIMETER_ID`),
  KEY `FK_MILESTONE_BINDING_PERIMETER_MILESTONE` (`MILESTONE_ID`),
  KEY `FK_MILESTONE_BINDING_PERIMETER_PROJECT` (`PROJECT_ID`),
  CONSTRAINT `FK_MILESTONE_BINDING_PERIMETER_MILESTONE` FOREIGN KEY (`MILESTONE_ID`) REFERENCES `MILESTONE` (`MILESTONE_ID`),
  CONSTRAINT `FK_MILESTONE_BINDING_PERIMETER_PROJECT` FOREIGN KEY (`PROJECT_ID`) REFERENCES `PROJECT` (`PROJECT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MILESTONE_BINDING_PERIMETER`
--

LOCK TABLES `MILESTONE_BINDING_PERIMETER` WRITE;
/*!40000 ALTER TABLE `MILESTONE_BINDING_PERIMETER` DISABLE KEYS */;
/*!40000 ALTER TABLE `MILESTONE_BINDING_PERIMETER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MILESTONE_CAMPAIGN`
--

DROP TABLE IF EXISTS `MILESTONE_CAMPAIGN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `MILESTONE_CAMPAIGN` (
  `MILESTONE_ID` bigint(20) NOT NULL COMMENT 'foreign key to table MILESTONE',
  `CAMPAIGN_ID` bigint(20) NOT NULL COMMENT 'foreign key to table CAMPAIGN',
  KEY `milestone_camp_milestone` (`MILESTONE_ID`),
  KEY `milestone_camp_camp` (`CAMPAIGN_ID`),
  CONSTRAINT `milestone_camp_camp` FOREIGN KEY (`CAMPAIGN_ID`) REFERENCES `CAMPAIGN` (`CLN_ID`),
  CONSTRAINT `milestone_camp_milestone` FOREIGN KEY (`MILESTONE_ID`) REFERENCES `MILESTONE` (`MILESTONE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MILESTONE_CAMPAIGN`
--

LOCK TABLES `MILESTONE_CAMPAIGN` WRITE;
/*!40000 ALTER TABLE `MILESTONE_CAMPAIGN` DISABLE KEYS */;
/*!40000 ALTER TABLE `MILESTONE_CAMPAIGN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MILESTONE_REQ_VERSION`
--

DROP TABLE IF EXISTS `MILESTONE_REQ_VERSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `MILESTONE_REQ_VERSION` (
  `MILESTONE_ID` bigint(20) NOT NULL COMMENT 'foreign key to table MILESTONE',
  `REQ_VERSION_ID` bigint(20) NOT NULL COMMENT 'foreign key to table REQUIREMENT_VERSION',
  KEY `milestone_rqv_rqv` (`REQ_VERSION_ID`),
  KEY `milestone_rqv_milestone` (`MILESTONE_ID`),
  CONSTRAINT `milestone_rqv_milestone` FOREIGN KEY (`MILESTONE_ID`) REFERENCES `MILESTONE` (`MILESTONE_ID`),
  CONSTRAINT `milestone_rqv_rqv` FOREIGN KEY (`REQ_VERSION_ID`) REFERENCES `REQUIREMENT_VERSION` (`RES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MILESTONE_REQ_VERSION`
--

LOCK TABLES `MILESTONE_REQ_VERSION` WRITE;
/*!40000 ALTER TABLE `MILESTONE_REQ_VERSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `MILESTONE_REQ_VERSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MILESTONE_TEST_CASE`
--

DROP TABLE IF EXISTS `MILESTONE_TEST_CASE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `MILESTONE_TEST_CASE` (
  `MILESTONE_ID` bigint(20) NOT NULL COMMENT 'foreign key to table MILESTONE',
  `TEST_CASE_ID` bigint(20) NOT NULL COMMENT 'foreign key to table TEST_CASE',
  KEY `milestone_tc_milestone` (`MILESTONE_ID`),
  KEY `milestone_tc_tc` (`TEST_CASE_ID`),
  CONSTRAINT `milestone_tc_milestone` FOREIGN KEY (`MILESTONE_ID`) REFERENCES `MILESTONE` (`MILESTONE_ID`),
  CONSTRAINT `milestone_tc_tc` FOREIGN KEY (`TEST_CASE_ID`) REFERENCES `TEST_CASE` (`TCLN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MILESTONE_TEST_CASE`
--

LOCK TABLES `MILESTONE_TEST_CASE` WRITE;
/*!40000 ALTER TABLE `MILESTONE_TEST_CASE` DISABLE KEYS */;
/*!40000 ALTER TABLE `MILESTONE_TEST_CASE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PARAMETER`
--

DROP TABLE IF EXISTS `PARAMETER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `PARAMETER` (
  `PARAM_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'the PARAMETER primary key',
  `NAME` varchar(255) NOT NULL DEFAULT '' COMMENT 'the parameter name, should be unique among parameters of the same test case',
  `TEST_CASE_ID` bigint(20) NOT NULL COMMENT 'the test case where the parameter is declared',
  `DESCRIPTION` longtext NOT NULL COMMENT 'the description of the parameter',
  `PARAM_ORDER` int(11) NOT NULL,
  PRIMARY KEY (`PARAM_ID`),
  UNIQUE KEY `NAME` (`NAME`,`TEST_CASE_ID`),
  KEY `fk_parameter_test_case` (`TEST_CASE_ID`),
  CONSTRAINT `fk_parameter_test_case` FOREIGN KEY (`TEST_CASE_ID`) REFERENCES `TEST_CASE` (`TCLN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PARAMETER`
--

LOCK TABLES `PARAMETER` WRITE;
/*!40000 ALTER TABLE `PARAMETER` DISABLE KEYS */;
/*!40000 ALTER TABLE `PARAMETER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PARTY_PREFERENCE`
--

DROP TABLE IF EXISTS `PARTY_PREFERENCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `PARTY_PREFERENCE` (
  `PREFERENCE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PARTY_ID` bigint(20) NOT NULL COMMENT 'foreign key to the core_party table',
  `PREFERENCE_KEY` varchar(50) DEFAULT NULL,
  `PREFERENCE_VALUE` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`PREFERENCE_ID`),
  KEY `fk_party_preference_core_party_party_id` (`PARTY_ID`),
  CONSTRAINT `fk_party_preference_core_party_party_id` FOREIGN KEY (`PARTY_ID`) REFERENCES `CORE_PARTY` (`PARTY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PARTY_PREFERENCE`
--

LOCK TABLES `PARTY_PREFERENCE` WRITE;
/*!40000 ALTER TABLE `PARTY_PREFERENCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `PARTY_PREFERENCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PIVOT_FORMAT_IMPORT`
--

DROP TABLE IF EXISTS `PIVOT_FORMAT_IMPORT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `PIVOT_FORMAT_IMPORT` (
  `PFI_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL COMMENT 'Foreign key to the user that requested the pivot format import',
  `CREATED_ON` datetime NOT NULL,
  `FILE_PATH` varchar(255) NOT NULL,
  `STATUS` varchar(50) NOT NULL,
  `PROJECT_ID` bigint(20) DEFAULT NULL,
  `IMPORT_TYPE` varchar(50) NOT NULL,
  `SUCCESSFULLY_IMPORTED_ON` datetime DEFAULT NULL,
  PRIMARY KEY (`PFI_ID`),
  KEY `idx_fk_pivot_format_import_created_by` (`CREATED_BY`),
  KEY `idx_fk_pivot_format_import_project_id` (`PROJECT_ID`),
  CONSTRAINT `fk_pivot_format_import_core_user_party_id` FOREIGN KEY (`CREATED_BY`) REFERENCES `CORE_USER` (`PARTY_ID`) ON DELETE CASCADE,
  CONSTRAINT `fk_pivot_format_import_project_project_id` FOREIGN KEY (`PROJECT_ID`) REFERENCES `PROJECT` (`PROJECT_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PIVOT_FORMAT_IMPORT`
--

LOCK TABLES `PIVOT_FORMAT_IMPORT` WRITE;
/*!40000 ALTER TABLE `PIVOT_FORMAT_IMPORT` DISABLE KEYS */;
/*!40000 ALTER TABLE `PIVOT_FORMAT_IMPORT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROJECT`
--

DROP TABLE IF EXISTS `PROJECT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROJECT` (
  `PROJECT_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'cle primaire de la table',
  `NAME` varchar(255) NOT NULL COMMENT 'nom du projet',
  `DESCRIPTION` longtext DEFAULT NULL,
  `LABEL` varchar(255) DEFAULT NULL COMMENT 'Label du projet',
  `CREATED_BY` varchar(100) NOT NULL,
  `CREATED_ON` datetime NOT NULL COMMENT 'Date de creation de ce projet. Il s''agit de la date de creation de l''entree dans la base, non d''une date metier.',
  `LAST_MODIFIED_BY` varchar(100) DEFAULT NULL,
  `LAST_MODIFIED_ON` datetime DEFAULT NULL COMMENT 'Date de derniere mise a jour de cette instance.',
  `CL_ID` bigint(20) DEFAULT NULL COMMENT 'cle etrangere de la table campaign-Library',
  `TCL_ID` bigint(20) DEFAULT NULL COMMENT 'cle etrangere de la table TESTCASE-Library',
  `RL_ID` bigint(20) DEFAULT NULL COMMENT 'cle etrangere de la table REQUIREMENT-Library',
  `ATTACHMENT_LIST_ID` bigint(20) NOT NULL,
  `PROJECT_TYPE` char(1) NOT NULL DEFAULT 'P' COMMENT 'P: project, T: project template',
  `TA_SERVER_ID` bigint(20) DEFAULT NULL COMMENT 'the reference to the test automation server',
  `REQ_CATEGORIES_LIST` bigint(20) NOT NULL DEFAULT 1 COMMENT 'foreign key to the requirement categories used in that project',
  `TC_NATURES_LIST` bigint(20) NOT NULL DEFAULT 2 COMMENT 'foreign key to the test case natures used in that project',
  `TC_TYPES_LIST` bigint(20) NOT NULL DEFAULT 3 COMMENT 'foreign key to the test case types used in that project',
  `ALLOW_TC_MODIF_DURING_EXEC` bit(1) NOT NULL DEFAULT b'0',
  `CRL_ID` bigint(20) DEFAULT NULL COMMENT 'FK FOR CUSTOM_REPORT_LIBRARY.CRL_ID',
  `TEMPLATE_ID` bigint(20) DEFAULT NULL,
  `ARL_ID` bigint(20) DEFAULT NULL COMMENT 'fk to the automation request library',
  `ALLOW_AUTOMATION_WORKFLOW` bit(1) NOT NULL DEFAULT b'0',
  `SCM_REPOSITORY_ID` bigint(20) DEFAULT NULL,
  `USE_TREE_STRUCTURE_IN_SCM_REPO` bit(1) NOT NULL DEFAULT b'1',
  `AUTOMATION_WORKFLOW_TYPE` varchar(25) NOT NULL DEFAULT 'NONE' COMMENT 'This column precises which workflow type is used.',
  `AWL_ID` bigint(20) DEFAULT NULL,
  `BDD_IMPLEMENTATION_TECHNOLOGY` varchar(30) NOT NULL DEFAULT 'CUCUMBER_5_PLUS',
  `BDD_SCRIPT_LANGUAGE` varchar(30) NOT NULL DEFAULT 'ENGLISH',
  `AUTOMATED_SUITES_LIFETIME` int(11) DEFAULT NULL,
  `INHERITS_ENVIRONMENT_TAGS` bit(1) NOT NULL DEFAULT b'1',
  `AI_SERVER_ID` bigint(20) DEFAULT NULL COMMENT 'the reference to the artificial intelligence server',
  `BUGTRACKER_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PROJECT_ID`),
  KEY `idx_project` (`PROJECT_ID`),
  KEY `fk_project_cl` (`CL_ID`),
  KEY `fk_project_tcl` (`TCL_ID`),
  KEY `fk_project_rl` (`RL_ID`),
  KEY `fk_project_attachment_list` (`ATTACHMENT_LIST_ID`),
  KEY `proj_req_categories` (`REQ_CATEGORIES_LIST`),
  KEY `proj_tc_natures` (`TC_NATURES_LIST`),
  KEY `proj_tc_types` (`TC_TYPES_LIST`),
  KEY `fk_project_crl` (`CRL_ID`),
  KEY `fk_project_template_id` (`TEMPLATE_ID`),
  KEY `fk_project_arl` (`ARL_ID`),
  KEY `idx_fk_project_awl` (`AWL_ID`),
  KEY `idx_project_name` (`NAME`),
  KEY `tm_project_ta_server` (`TA_SERVER_ID`),
  KEY `fk_project_scm_repository` (`SCM_REPOSITORY_ID`),
  KEY `idx_fk_project_ai_server` (`AI_SERVER_ID`),
  KEY `idx_fk_project_bugtracker_id` (`BUGTRACKER_ID`),
  CONSTRAINT `fk_project_ai_server` FOREIGN KEY (`AI_SERVER_ID`) REFERENCES `AI_SERVER` (`SERVER_ID`),
  CONSTRAINT `fk_project_arl` FOREIGN KEY (`ARL_ID`) REFERENCES `AUTOMATION_REQUEST_LIBRARY` (`ARL_ID`),
  CONSTRAINT `fk_project_attachment_list` FOREIGN KEY (`ATTACHMENT_LIST_ID`) REFERENCES `ATTACHMENT_LIST` (`ATTACHMENT_LIST_ID`),
  CONSTRAINT `fk_project_awl` FOREIGN KEY (`AWL_ID`) REFERENCES `ACTION_WORD_LIBRARY` (`AWL_ID`),
  CONSTRAINT `fk_project_bugtracker_id` FOREIGN KEY (`BUGTRACKER_ID`) REFERENCES `BUGTRACKER` (`BUGTRACKER_ID`),
  CONSTRAINT `fk_project_cl` FOREIGN KEY (`CL_ID`) REFERENCES `CAMPAIGN_LIBRARY` (`CL_ID`),
  CONSTRAINT `fk_project_crl` FOREIGN KEY (`CRL_ID`) REFERENCES `CUSTOM_REPORT_LIBRARY` (`CRL_ID`),
  CONSTRAINT `fk_project_rl` FOREIGN KEY (`RL_ID`) REFERENCES `REQUIREMENT_LIBRARY` (`RL_ID`),
  CONSTRAINT `fk_project_scm_repository` FOREIGN KEY (`SCM_REPOSITORY_ID`) REFERENCES `SCM_REPOSITORY` (`SCM_REPOSITORY_ID`),
  CONSTRAINT `fk_project_tcl` FOREIGN KEY (`TCL_ID`) REFERENCES `TEST_CASE_LIBRARY` (`TCL_ID`),
  CONSTRAINT `fk_project_template_id` FOREIGN KEY (`TEMPLATE_ID`) REFERENCES `PROJECT` (`PROJECT_ID`),
  CONSTRAINT `proj_req_categories` FOREIGN KEY (`REQ_CATEGORIES_LIST`) REFERENCES `INFO_LIST` (`INFO_LIST_ID`),
  CONSTRAINT `proj_tc_natures` FOREIGN KEY (`TC_NATURES_LIST`) REFERENCES `INFO_LIST` (`INFO_LIST_ID`),
  CONSTRAINT `proj_tc_types` FOREIGN KEY (`TC_TYPES_LIST`) REFERENCES `INFO_LIST` (`INFO_LIST_ID`),
  CONSTRAINT `tm_project_ta_server` FOREIGN KEY (`TA_SERVER_ID`) REFERENCES `TEST_AUTOMATION_SERVER` (`SERVER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROJECT`
--

LOCK TABLES `PROJECT` WRITE;
/*!40000 ALTER TABLE `PROJECT` DISABLE KEYS */;
INSERT INTO `PROJECT` VALUES (1,'Beaurain','','','admin','2025-04-28 14:34:59',NULL,NULL,1,1,1,7,'P',NULL,1,2,3,'\0',1,NULL,1,'\0',NULL,'','NONE',1,'CUCUMBER_5_PLUS','ENGLISH',NULL,'',NULL,NULL),(2,'Test','','','admin','2025-04-28 14:35:10',NULL,NULL,2,2,2,14,'P',NULL,1,2,3,'\0',2,NULL,2,'\0',NULL,'','NONE',2,'CUCUMBER_5_PLUS','ENGLISH',NULL,'',NULL,NULL);
/*!40000 ALTER TABLE `PROJECT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROJECT_FILTER`
--

DROP TABLE IF EXISTS `PROJECT_FILTER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROJECT_FILTER` (
  `PROJECT_FILTER_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ACTIVATED` bit(1) NOT NULL DEFAULT b'0' COMMENT 'filter activated yes or no',
  `USER_LOGIN` varchar(255) NOT NULL COMMENT 'unique user login',
  PRIMARY KEY (`PROJECT_FILTER_ID`),
  KEY `DX_UN_PROJECT_FILTER_USER` (`USER_LOGIN`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROJECT_FILTER`
--

LOCK TABLES `PROJECT_FILTER` WRITE;
/*!40000 ALTER TABLE `PROJECT_FILTER` DISABLE KEYS */;
INSERT INTO `PROJECT_FILTER` VALUES (1,'\0','admin');
/*!40000 ALTER TABLE `PROJECT_FILTER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROJECT_FILTER_ENTRY`
--

DROP TABLE IF EXISTS `PROJECT_FILTER_ENTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROJECT_FILTER_ENTRY` (
  `PROJECT_ID` bigint(20) NOT NULL COMMENT 'foreign key to project',
  `FILTER_ID` bigint(20) NOT NULL COMMENT 'foreign key to filter',
  PRIMARY KEY (`PROJECT_ID`,`FILTER_ID`),
  KEY `dx_pfp_project` (`PROJECT_ID`),
  KEY `dx_pfp_filter` (`FILTER_ID`),
  CONSTRAINT `FK_PROJ_FILTER_ENTRY_PROJ` FOREIGN KEY (`PROJECT_ID`) REFERENCES `PROJECT` (`PROJECT_ID`),
  CONSTRAINT `FK_PROJ_FILTER_ENTRY_PROJ_FILTER` FOREIGN KEY (`FILTER_ID`) REFERENCES `PROJECT_FILTER` (`PROJECT_FILTER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROJECT_FILTER_ENTRY`
--

LOCK TABLES `PROJECT_FILTER_ENTRY` WRITE;
/*!40000 ALTER TABLE `PROJECT_FILTER_ENTRY` DISABLE KEYS */;
/*!40000 ALTER TABLE `PROJECT_FILTER_ENTRY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QUERY_AGGREGATION_COLUMN`
--

DROP TABLE IF EXISTS `QUERY_AGGREGATION_COLUMN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `QUERY_AGGREGATION_COLUMN` (
  `QUERY_MODEL_ID` bigint(20) NOT NULL COMMENT 'foreign key to a QUERY_MODEL. ',
  `QUERY_COLUMN_ID` bigint(20) NOT NULL COMMENT 'foreign key to the QUERY_COLUMN_PROTOTYPE which must be aggregated on',
  `LABEL` varchar(30) DEFAULT NULL COMMENT 'A label for this projected column. Will override the default label of the column prototype if non null.',
  `AGGREGATION_OPERATION` varchar(20) DEFAULT NULL COMMENT 'the operation applied to the column, if any.',
  `AGGREGATION_RANK` int(11) DEFAULT NULL COMMENT 'the order in which this projected column in the returned tuple.',
  `CUF_ID` bigint(20) DEFAULT NULL COMMENT 'the custom field id for this projection column, if the referenced column is a custom field.',
  KEY `fk_query_aggr_query_model` (`QUERY_MODEL_ID`),
  KEY `fk_query_aggr_query_column` (`QUERY_COLUMN_ID`),
  CONSTRAINT `fk_query_aggr_query_column` FOREIGN KEY (`QUERY_COLUMN_ID`) REFERENCES `QUERY_COLUMN_PROTOTYPE` (`QUERY_COLUMN_ID`),
  CONSTRAINT `fk_query_aggr_query_model` FOREIGN KEY (`QUERY_MODEL_ID`) REFERENCES `QUERY_MODEL` (`QUERY_MODEL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QUERY_AGGREGATION_COLUMN`
--

LOCK TABLES `QUERY_AGGREGATION_COLUMN` WRITE;
/*!40000 ALTER TABLE `QUERY_AGGREGATION_COLUMN` DISABLE KEYS */;
INSERT INTO `QUERY_AGGREGATION_COLUMN` VALUES (1,1,NULL,'NONE',0,NULL),(2,7,NULL,'NONE',0,NULL),(3,7,NULL,'NONE',0,NULL),(4,19,NULL,'NONE',0,NULL),(5,19,NULL,'NONE',0,NULL),(6,19,NULL,'NONE',0,NULL),(7,19,NULL,'NONE',0,NULL),(8,19,NULL,'NONE',0,NULL),(9,19,NULL,'NONE',0,NULL),(10,19,NULL,'NONE',0,NULL),(11,37,NULL,'NONE',0,NULL),(12,37,NULL,'NONE',0,NULL),(13,46,NULL,'NONE',0,NULL),(14,46,NULL,'NONE',0,NULL),(15,54,NULL,'NONE',0,NULL),(16,54,NULL,'NONE',0,NULL),(17,54,NULL,'NONE',0,NULL),(18,54,NULL,'NONE',0,NULL),(19,54,NULL,'NONE',0,NULL),(20,66,NULL,'NONE',0,NULL),(21,66,NULL,'NONE',0,NULL),(22,7,NULL,'NONE',0,NULL),(23,19,NULL,'NONE',0,NULL),(24,19,NULL,'NONE',0,NULL),(25,19,NULL,'NONE',0,NULL),(26,54,NULL,'NONE',0,NULL),(27,54,NULL,'NONE',0,NULL),(28,19,NULL,'NONE',0,NULL),(29,19,NULL,'NONE',0,NULL),(30,1,NULL,'NONE',0,NULL);
/*!40000 ALTER TABLE `QUERY_AGGREGATION_COLUMN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QUERY_COLUMN_PROTOTYPE`
--

DROP TABLE IF EXISTS `QUERY_COLUMN_PROTOTYPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `QUERY_COLUMN_PROTOTYPE` (
  `QUERY_COLUMN_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `COLUMN_TYPE` varchar(15) DEFAULT NULL COMMENT 'complementary information about the nature of this column : native attribute (''ATTRIBUTE''),     computed field (''CALCULATED'') - often as a subquery -, or custom field (''CUF'')',
  `SUBQUERY_ID` bigint(20) DEFAULT NULL COMMENT 'optional foreign key to a (sub) CHART_QUERY',
  `LABEL` varchar(255) NOT NULL,
  `ENTITY_TYPE` varchar(30) DEFAULT NULL COMMENT 'The kind of entities this column belongs to',
  `ENTITY_ROLE` varchar(40) DEFAULT NULL COMMENT 'a complementary qualifier for ENTITY_TYPE,           used when an entity has an auxialiary role regarding another entity.           For instance an InfoListItem may have a role of nature for a TestCase,           or category for a RequirementVersion. May be null if nothing special about it.',
  `ATTRIBUTE_NAME` varchar(255) DEFAULT NULL COMMENT 'The name of the attribute of the entity',
  `DATA_TYPE` varchar(50) DEFAULT NULL COMMENT 'Data type of the attribute',
  `BUSINESS` bit(1) DEFAULT b'1' COMMENT 'tells whether this column is public or internal.',
  `ATTRIBUTE_TYPE` varchar(15) DEFAULT NULL COMMENT 'complementary information about the nature of this column : native attribute (''ATTRIBUTE''),     computed field (''CALCULATED'') - often as a subquery -, or custom field (''CUF'')',
  PRIMARY KEY (`QUERY_COLUMN_ID`),
  UNIQUE KEY `LABEL` (`LABEL`),
  KEY `idx_column_prototype` (`QUERY_COLUMN_ID`),
  KEY `fk_query_col_query_model` (`SUBQUERY_ID`),
  CONSTRAINT `fk_query_col_query_model` FOREIGN KEY (`SUBQUERY_ID`) REFERENCES `QUERY_MODEL` (`QUERY_MODEL_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QUERY_COLUMN_PROTOTYPE`
--

LOCK TABLES `QUERY_COLUMN_PROTOTYPE` WRITE;
/*!40000 ALTER TABLE `QUERY_COLUMN_PROTOTYPE` DISABLE KEYS */;
INSERT INTO `QUERY_COLUMN_PROTOTYPE` VALUES (1,'ATTRIBUTE',NULL,'REQUIREMENT_ID','REQUIREMENT',NULL,'id','NUMERIC','',NULL),(2,'CALCULATED',1,'REQUIREMENT_NB_VERSIONS','REQUIREMENT',NULL,'count(requirementVersionCoverages)','NUMERIC','',NULL),(3,'ATTRIBUTE',NULL,'REQUIREMENT_PROJECT','REQUIREMENT',NULL,'project.id','NUMERIC','\0',NULL),(4,'ATTRIBUTE',NULL,'REQUIREMENT_CRITICALITY','REQUIREMENT',NULL,'resource.criticality','LEVEL_ENUM','',NULL),(5,'ATTRIBUTE',NULL,'REQUIREMENT_STATUS','REQUIREMENT',NULL,'resource.status','REQUIREMENT_STATUS','',NULL),(6,'ATTRIBUTE',NULL,'REQUIREMENT_CATEGORY','REQUIREMENT',NULL,'resource.category.code','INFO_LIST_ITEM','',NULL),(7,'ATTRIBUTE',NULL,'REQUIREMENT_VERSION_ID','REQUIREMENT_VERSION',NULL,'id','NUMERIC','',NULL),(8,'ATTRIBUTE',NULL,'REQUIREMENT_VERSION_REFERENCE','REQUIREMENT_VERSION',NULL,'reference','STRING','',NULL),(9,'ATTRIBUTE',NULL,'REQUIREMENT_VERSION_CATEGORY','REQUIREMENT_VERSION',NULL,'category.code','INFO_LIST_ITEM','',NULL),(10,'ATTRIBUTE',NULL,'REQUIREMENT_VERSION_CRITICALITY','REQUIREMENT_VERSION',NULL,'criticality','LEVEL_ENUM','',NULL),(11,'ATTRIBUTE',NULL,'REQUIREMENT_VERSION_STATUS','REQUIREMENT_VERSION',NULL,'status','REQUIREMENT_STATUS','',NULL),(12,'ATTRIBUTE',NULL,'REQUIREMENT_VERSION_CREATED_BY','REQUIREMENT_VERSION',NULL,'audit.createdBy','STRING','',NULL),(13,'ATTRIBUTE',NULL,'REQUIREMENT_VERSION_CREATED_ON','REQUIREMENT_VERSION',NULL,'audit.createdOn','DATE','',NULL),(14,'ATTRIBUTE',NULL,'REQUIREMENT_VERSION_MODIFIED_BY','REQUIREMENT_VERSION',NULL,'audit.lastModifiedBy','STRING','',NULL),(15,'ATTRIBUTE',NULL,'REQUIREMENT_VERSION_MODIFIED_ON','REQUIREMENT_VERSION',NULL,'audit.lastModifiedOn','DATE','',NULL),(16,'ATTRIBUTE',NULL,'REQUIREMENT_VERSION_VERS_NUM','REQUIREMENT_VERSION',NULL,'versionNumber','NUMERIC','',NULL),(17,'CALCULATED',2,'REQUIREMENT_VERSION_TCCOUNT','REQUIREMENT_VERSION',NULL,'count(requirementVersionCoverages)','NUMERIC','',NULL),(18,'CALCULATED',3,'REQUIREMENT_VERSION_MILCOUNT','REQUIREMENT_VERSION',NULL,'count(milestones)','NUMERIC','',NULL),(19,'ATTRIBUTE',NULL,'TEST_CASE_ID','TEST_CASE',NULL,'id','NUMERIC','',NULL),(20,'ATTRIBUTE',NULL,'TEST_CASE_REFERENCE','TEST_CASE',NULL,'reference','STRING','',NULL),(21,'ATTRIBUTE',NULL,'TEST_CASE_IMPORTANCE','TEST_CASE',NULL,'importance','LEVEL_ENUM','',NULL),(22,'ATTRIBUTE',NULL,'TEST_CASE_NATURE','TEST_CASE',NULL,'nature.code','INFO_LIST_ITEM','',NULL),(23,'ATTRIBUTE',NULL,'TEST_CASE_TYPE','TEST_CASE',NULL,'type.code','INFO_LIST_ITEM','',NULL),(24,'ATTRIBUTE',NULL,'TEST_CASE_STATUS','TEST_CASE',NULL,'status','LEVEL_ENUM','',NULL),(25,'ATTRIBUTE',NULL,'TEST_CASE_CREATED_BY','TEST_CASE',NULL,'audit.createdBy','STRING','',NULL),(26,'ATTRIBUTE',NULL,'TEST_CASE_CREATED_ON','TEST_CASE',NULL,'audit.createdOn','DATE','',NULL),(27,'ATTRIBUTE',NULL,'TEST_CASE_MODIFIED_BY','TEST_CASE',NULL,'audit.lastModifiedBy','STRING','',NULL),(28,'ATTRIBUTE',NULL,'TEST_CASE_MODIFIED_ON','TEST_CASE',NULL,'audit.lastModifiedOn','DATE','',NULL),(29,'ATTRIBUTE',NULL,'TEST_CASE_PROJECT','TEST_CASE',NULL,'project.id','NUMERIC','\0',NULL),(30,'CALCULATED',4,'TEST_CASE_VERSCOUNT','TEST_CASE',NULL,'count(requirementVersionCoverages)','NUMERIC','',NULL),(31,'CALCULATED',5,'TEST_CASE_CALLSTEPCOUNT','TEST_CASE',NULL,'count(steps[class=\"CallTestStep\"])','NUMERIC','',NULL),(32,'CALCULATED',6,'TEST_CASE_STEPCOUNT','TEST_CASE',NULL,'count(steps)','NUMERIC','',NULL),(33,'CALCULATED',7,'TEST_CASE_MILCOUNT','TEST_CASE',NULL,'count(milestones)','NUMERIC','',NULL),(34,'CALCULATED',8,'TEST_CASE_ITERCOUNT','TEST_CASE',NULL,'count(iterations)','NUMERIC','',NULL),(35,'CALCULATED',9,'TEST_CASE_EXECOUNT','TEST_CASE',NULL,'count(executions)','NUMERIC','',NULL),(36,'CALCULATED',10,'TEST_CASE_HASAUTOSCRIPT','TEST_CASE',NULL,'notnull(automatedTest)','BOOLEAN','',NULL),(37,'ATTRIBUTE',NULL,'CAMPAIGN_ID','CAMPAIGN',NULL,'id','NUMERIC','',NULL),(38,'ATTRIBUTE',NULL,'CAMPAIGN_PROJECT','CAMPAIGN',NULL,'project.id','NUMERIC','\0',NULL),(39,'ATTRIBUTE',NULL,'CAMPAIGN_REFERENCE','CAMPAIGN',NULL,'reference','STRING','',NULL),(40,'ATTRIBUTE',NULL,'CAMPAIGN_SCHED_START','CAMPAIGN',NULL,'scheduledPeriod.scheduledStartDate','DATE','',NULL),(41,'ATTRIBUTE',NULL,'CAMPAIGN_SCHED_END','CAMPAIGN',NULL,'scheduledPeriod.scheduledEndDate','DATE','',NULL),(42,'ATTRIBUTE',NULL,'CAMPAIGN_ACTUAL_START','CAMPAIGN',NULL,'actualPeriod.actualStartDate','DATE','',NULL),(43,'ATTRIBUTE',NULL,'CAMPAIGN_ACTUAL_END','CAMPAIGN',NULL,'actualPeriod.actualEndDate','DATE','',NULL),(44,'CALCULATED',11,'CAMPAIGN_ITERCOUNT','CAMPAIGN',NULL,'count(iterations)','NUMERIC','',NULL),(45,'CALCULATED',12,'CAMPAIGN_ISSUECOUNT','CAMPAIGN',NULL,'count(issues)','NUMERIC','',NULL),(46,'ATTRIBUTE',NULL,'ITERATION_ID','ITERATION',NULL,'id','NUMERIC','',NULL),(47,'ATTRIBUTE',NULL,'ITERATION_REFERENCE','ITERATION',NULL,'reference','STRING','',NULL),(48,'ATTRIBUTE',NULL,'ITERATION_SCHED_START','ITERATION',NULL,'scheduledPeriod.scheduledStartDate','DATE','',NULL),(49,'ATTRIBUTE',NULL,'ITERATION_SCHED_END','ITERATION',NULL,'scheduledPeriod.scheduledEndDate','DATE','',NULL),(50,'ATTRIBUTE',NULL,'ITERATION_ACTUAL_START','ITERATION',NULL,'actualPeriod.actualStartDate','DATE','',NULL),(51,'ATTRIBUTE',NULL,'ITERATION_ACTUAL_END','ITERATION',NULL,'actualPeriod.actualEndDate','DATE','',NULL),(52,'CALCULATED',13,'ITERATION_ITEMCOUNT','ITERATION',NULL,'count(testPlans)','NUMERIC','',NULL),(53,'CALCULATED',14,'ITERATION_ISSUECOUNT','ITERATION',NULL,'count(issues)','NUMERIC','',NULL),(54,'ATTRIBUTE',NULL,'ITEM_TEST_PLAN_ID','ITEM_TEST_PLAN',NULL,'id','NUMERIC','',NULL),(55,'ATTRIBUTE',NULL,'ITEM_TEST_PLAN_LABEL','ITEM_TEST_PLAN',NULL,'label','STRING','',NULL),(56,'ATTRIBUTE',NULL,'ITEM_TEST_PLAN_STATUS','ITEM_TEST_PLAN',NULL,'executionStatus','EXECUTION_STATUS','',NULL),(57,'ATTRIBUTE',NULL,'ITEM_TEST_PLAN_LASTEXECON','ITEM_TEST_PLAN',NULL,'lastExecutedOn','DATE','',NULL),(58,'ATTRIBUTE',NULL,'ITEM_TEST_PLAN_DATASET_LABEL','ITEM_TEST_PLAN',NULL,'referencedDataset.name','STRING','',NULL),(59,'ATTRIBUTE',NULL,'ITEM_TEST_PLAN_TESTER','ITEM_TEST_PLAN',NULL,'user.login','STRING','',NULL),(60,'ATTRIBUTE',NULL,'ITEM_TEST_PLAN_TC_ID','ITEM_TEST_PLAN',NULL,'referencedTestCase.id','NUMERIC','',NULL),(61,'CALCULATED',15,'ITEM_TEST_PLAN_TC_DELETED','ITEM_TEST_PLAN',NULL,'isnull(referencedTestCase)','BOOLEAN','',NULL),(62,'CALCULATED',16,'ITEM_TEST_PLAN_IS_EXECUTED','ITEM_TEST_PLAN',NULL,'notnull(executions)','BOOLEAN','',NULL),(63,'CALCULATED',17,'ITEM_TEST_PLAN_MANEXCOUNT','ITEM_TEST_PLAN',NULL,'count(executions[auto=\"false\"])','NUMERIC','',NULL),(64,'CALCULATED',18,'ITEM_TEST_PLAN_AUTOEXCOUNT','ITEM_TEST_PLAN',NULL,'count(executions[auto=\"true\"])','NUMERIC','',NULL),(65,'CALCULATED',19,'ITEM_TEST_PLAN_ISSUECOUNT','ITEM_TEST_PLAN',NULL,'count(issues)','NUMERIC','',NULL),(66,'ATTRIBUTE',NULL,'EXECUTION_ID','EXECUTION',NULL,'id','NUMERIC','',NULL),(67,'ATTRIBUTE',NULL,'EXECUTION_LABEL','EXECUTION',NULL,'name','STRING','',NULL),(68,'ATTRIBUTE',NULL,'EXECUTION_DS_LABEL','EXECUTION',NULL,'datasetLabel','STRING','',NULL),(69,'ATTRIBUTE',NULL,'EXECUTION_LASTEXEC','EXECUTION',NULL,'lastExecutedOn','DATE','',NULL),(70,'ATTRIBUTE',NULL,'EXECUTION_TESTER_LOGIN','EXECUTION',NULL,'lastExecutedBy','STRING','',NULL),(71,'ATTRIBUTE',NULL,'EXECUTION_STATUS','EXECUTION',NULL,'executionStatus','EXECUTION_STATUS','',NULL),(72,'CALCULATED',20,'EXECUTION_ISAUTO','EXECUTION',NULL,'notnull(automatedExecutionExtender)','BOOLEAN','',NULL),(73,'CALCULATED',21,'EXECUTION_ISSUECOUNT','EXECUTION',NULL,'count(issues)','NUMERIC','',NULL),(74,'ATTRIBUTE',NULL,'ISSUE_ID','ISSUE',NULL,'id','NUMERIC','\0',NULL),(75,'ATTRIBUTE',NULL,'ISSUE_REMOTE_ID','ISSUE',NULL,'remoteIssueId','STRING','\0',NULL),(76,'ATTRIBUTE',NULL,'ISSUE_STATUS','ISSUE',NULL,'status','STRING','\0',NULL),(77,'ATTRIBUTE',NULL,'ISSUE_SEVERITY','ISSUE',NULL,'severity','STRING','\0',NULL),(78,'ATTRIBUTE',NULL,'ISSUE_BUGTRACKER','ISSUE',NULL,'bugtracker','STRING','\0',NULL),(79,'ATTRIBUTE',NULL,'TEST_CASE_STEP_ID','TEST_CASE_STEP',NULL,'id','NUMERIC','\0',NULL),(80,'ATTRIBUTE',NULL,'TEST_CASE_STEP_CLASS','TEST_CASE_STEP',NULL,'class','NUMERIC','\0',NULL),(81,'ATTRIBUTE',NULL,'TEST_CASE_NATURE_ID','INFO_LIST_ITEM','TEST_CASE_NATURE','id','NUMERIC','\0',NULL),(82,'ATTRIBUTE',NULL,'TEST_CASE_NATURE_LABEL','INFO_LIST_ITEM','TEST_CASE_NATURE','label','STRING','\0',NULL),(83,'ATTRIBUTE',NULL,'TEST_CASE_TYPE_ID','INFO_LIST_ITEM','TEST_CASE_TYPE','id','NUMERIC','\0',NULL),(84,'ATTRIBUTE',NULL,'TEST_CASE_TYPE_LABEL','INFO_LIST_ITEM','TEST_CASE_TYPE','label','STRING','\0',NULL),(85,'ATTRIBUTE',NULL,'REQUIREMENT_VERSION_CATEGORY_ID','INFO_LIST_ITEM','REQUIREMENT_VERSION_CATEGORY','id','NUMERIC','\0',NULL),(86,'ATTRIBUTE',NULL,'REQUIREMENT_VERSION_CATEGORY_LABEL','INFO_LIST_ITEM','REQUIREMENT_VERSION_CATEGORY','label','STRING','\0',NULL),(87,'ATTRIBUTE',NULL,'TEST_CASE_MILESTONE_ID','MILESTONE','TEST_CASE_MILESTONE','id','NUMERIC','\0',NULL),(88,'ATTRIBUTE',NULL,'TEST_CASE_MILESTONE_LABEL','MILESTONE','TEST_CASE_MILESTONE','label','STRING','\0',NULL),(89,'ATTRIBUTE',NULL,'REQUIREMENT_VERSION_MILESTONE_ID','MILESTONE','REQUIREMENT_VERSION_MILESTONE','id','NUMERIC','\0',NULL),(90,'ATTRIBUTE',NULL,'REQUIREMENT_VERSION_MILESTONE_LABEL','MILESTONE','REQUIREMENT_VERSION_MILESTONE','label','STRING','\0',NULL),(91,'ATTRIBUTE',NULL,'ITERATION_TEST_PLAN_ASSIGNED_USER_ID','USER','ITERATION_TEST_PLAN_ASSIGNED_USER','id','NUMERIC','\0',NULL),(92,'ATTRIBUTE',NULL,'ITERATION_TEST_PLAN_ASSIGNED_USER_LOGIN','USER','ITERATION_TEST_PLAN_ASSIGNED_USER','login','STRING','\0',NULL),(93,'ATTRIBUTE',NULL,'AUTOMATED_TEST_ID','AUTOMATED_TEST',NULL,'id','NUMERIC','\0',NULL),(94,'ATTRIBUTE',NULL,'AUTOMATED_EXECUTION_EXTENDER_ID','AUTOMATED_EXECUTION_EXTENDER',NULL,'id','NUMERIC','\0',NULL),(95,'CUF',NULL,'REQUIREMENT_VERSION_CUF_TEXT','REQUIREMENT_VERSION','CUSTOM_FIELD','value','STRING','',NULL),(96,'CUF',NULL,'REQUIREMENT_VERSION_CUF_CHECKBOX','REQUIREMENT_VERSION','CUSTOM_FIELD','value','BOOLEAN_AS_STRING','',NULL),(97,'CUF',NULL,'REQUIREMENT_VERSION_CUF_LIST','REQUIREMENT_VERSION','CUSTOM_FIELD','value','LIST','',NULL),(98,'CUF',NULL,'REQUIREMENT_VERSION_CUF_DATE','REQUIREMENT_VERSION','CUSTOM_FIELD','value','DATE_AS_STRING','',NULL),(99,'CUF',NULL,'REQUIREMENT_VERSION_CUF_TAG','REQUIREMENT_VERSION','CUSTOM_FIELD','value','TAG','',NULL),(100,'CUF',NULL,'REQUIREMENT_VERSION_CUF_NUMERIC','REQUIREMENT_VERSION','CUSTOM_FIELD','value','NUMERIC','',NULL),(101,'CUF',NULL,'TEST_CASE_CUF_TEXT','TEST_CASE','CUSTOM_FIELD','value','STRING','',NULL),(102,'CUF',NULL,'TEST_CASE_CUF_CHECKBOX','TEST_CASE','CUSTOM_FIELD','value','BOOLEAN_AS_STRING','',NULL),(103,'CUF',NULL,'TEST_CASE_CUF_LIST','TEST_CASE','CUSTOM_FIELD','value','LIST','',NULL),(104,'CUF',NULL,'TEST_CASE_CUF_DATE','TEST_CASE','CUSTOM_FIELD','value','DATE_AS_STRING','',NULL),(105,'CUF',NULL,'TEST_CASE_CUF_TAG','TEST_CASE','CUSTOM_FIELD','value','TAG','',NULL),(106,'CUF',NULL,'TEST_CASE_CUF_NUMERIC','TEST_CASE','CUSTOM_FIELD','value','NUMERIC','',NULL),(107,'CUF',NULL,'CAMPAIGN_CUF_TEXT','CAMPAIGN','CUSTOM_FIELD','value','STRING','',NULL),(108,'CUF',NULL,'CAMPAIGN_CUF_CHECKBOX','CAMPAIGN','CUSTOM_FIELD','value','BOOLEAN_AS_STRING','',NULL),(109,'CUF',NULL,'CAMPAIGN_CUF_LIST','CAMPAIGN','CUSTOM_FIELD','value','LIST','',NULL),(110,'CUF',NULL,'CAMPAIGN_CUF_DATE','CAMPAIGN','CUSTOM_FIELD','value','DATE_AS_STRING','',NULL),(111,'CUF',NULL,'CAMPAIGN_CUF_TAG','CAMPAIGN','CUSTOM_FIELD','value','TAG','',NULL),(112,'CUF',NULL,'CAMPAIGN_CUF_NUMERIC','CAMPAIGN','CUSTOM_FIELD','value','NUMERIC','',NULL),(113,'CUF',NULL,'ITERATION_CUF_TEXT','ITERATION','CUSTOM_FIELD','value','STRING','',NULL),(114,'CUF',NULL,'ITERATION_CUF_CHECKBOX','ITERATION','CUSTOM_FIELD','value','BOOLEAN_AS_STRING','',NULL),(115,'CUF',NULL,'ITERATION_CUF_LIST','ITERATION','CUSTOM_FIELD','value','LIST','',NULL),(116,'CUF',NULL,'ITERATION_CUF_DATE','ITERATION','CUSTOM_FIELD','value','DATE_AS_STRING','',NULL),(117,'CUF',NULL,'ITERATION_CUF_TAG','ITERATION','CUSTOM_FIELD','value','TAG','',NULL),(118,'CUF',NULL,'ITERATION_CUF_NUMERIC','ITERATION','CUSTOM_FIELD','value','NUMERIC','',NULL),(119,'CUF',NULL,'EXECUTION_CUF_TEXT','EXECUTION','CUSTOM_FIELD','value','STRING','',NULL),(120,'CUF',NULL,'EXECUTION_CUF_CHECKBOX','EXECUTION','CUSTOM_FIELD','value','BOOLEAN_AS_STRING','',NULL),(121,'CUF',NULL,'EXECUTION_CUF_LIST','EXECUTION','CUSTOM_FIELD','value','LIST','',NULL),(122,'CUF',NULL,'EXECUTION_CUF_DATE','EXECUTION','CUSTOM_FIELD','value','DATE_AS_STRING','',NULL),(123,'CUF',NULL,'EXECUTION_CUF_TAG','EXECUTION','CUSTOM_FIELD','value','TAG','',NULL),(124,'CUF',NULL,'EXECUTION_CUF_NUMERIC','EXECUTION','CUSTOM_FIELD','value','NUMERIC','',NULL),(125,'ATTRIBUTE',NULL,'CAMPAIGN_MILESTONE_ID','MILESTONE','CAMPAIGN_MILESTONE','id','NUMERIC','\0',NULL),(126,'ENTITY',NULL,'REQUIREMENT_ENTITY','REQUIREMENT',NULL,NULL,'ENTITY','\0',NULL),(127,'ENTITY',NULL,'REQUIREMENT_VERSION_ENTITY','REQUIREMENT_VERSION',NULL,NULL,'ENTITY','\0',NULL),(128,'ENTITY',NULL,'TEST_CASE_ENTITY','TEST_CASE',NULL,NULL,'ENTITY','\0',NULL),(129,'ENTITY',NULL,'CAMPAIGN_ENTITY','CAMPAIGN',NULL,NULL,'ENTITY','\0',NULL),(130,'ENTITY',NULL,'ITERATION_ENTITY','ITERATION',NULL,NULL,'ENTITY','\0',NULL),(131,'ENTITY',NULL,'ITEM_TEST_PLAN_ENTITY','ITEM_TEST_PLAN',NULL,NULL,'ENTITY','\0',NULL),(132,'ENTITY',NULL,'EXECUTION_ENTITY','EXECUTION',NULL,NULL,'ENTITY','\0',NULL),(133,'ENTITY',NULL,'ISSUE_ENTITY','ISSUE',NULL,NULL,'ENTITY','\0',NULL),(134,'ENTITY',NULL,'TEST_CASE_STEP_ENTITY','TEST_CASE_STEP',NULL,NULL,'ENTITY','\0',NULL),(135,'ENTITY',NULL,'TEST_CASE_NATURE_ENTITY','INFO_LIST_ITEM','TEST_CASE_NATURE',NULL,'ENTITY','\0',NULL),(136,'ENTITY',NULL,'TEST_CASE_TYPE_ENTITY','INFO_LIST_ITEM','TEST_CASE_TYPE',NULL,'ENTITY','\0',NULL),(137,'ENTITY',NULL,'REQUIREMENT_VERSION_CATEGORY_ENTITY','INFO_LIST_ITEM','REQUIREMENT_VERSION_CATEGORY',NULL,'ENTITY','\0',NULL),(138,'ENTITY',NULL,'ITERATION_TEST_PLAN_ASSIGNED_USER_ENTITY','USER','ITERATION_TEST_PLAN_ASSIGNED_USER',NULL,'ENTITY','\0',NULL),(139,'ENTITY',NULL,'TEST_CASE_MILESTONE_ENTITY','MILESTONE','TEST_CASE_MILESTONE',NULL,'ENTITY','\0',NULL),(140,'ENTITY',NULL,'REQUIREMENT_VERSION_MILESTONE_ENTITY','MILESTONE','REQUIREMENT_VERSION_MILESTONE',NULL,'ENTITY','\0',NULL),(141,'ENTITY',NULL,'CAMPAIGN_MILESTONE_ENTITY','MILESTONE','CAMPAIGN_MILESTONE',NULL,'ENTITY','\0',NULL),(142,'ENTITY',NULL,'AUTOMATED_TEST_ENTITY','AUTOMATED_TEST',NULL,NULL,'ENTITY','\0',NULL),(143,'ENTITY',NULL,'AUTOMATED_EXECUTION_EXTENDER_ENTITY','AUTOMATED_EXECUTION_EXTENDER',NULL,NULL,'ENTITY','\0',NULL),(144,'ENTITY',NULL,'TEST_CASE_ATTLIST_ENTITY','ATTACHMENT_LIST','TEST_CASE_ATTLIST',NULL,'ENTITY','\0',NULL),(145,'ENTITY',NULL,'REQUIREMENT_VERSION_ATTLIST_ENTITY','ATTACHMENT_LIST','REQUIREMENT_VERSION_ATTLIST',NULL,'ENTITY','\0',NULL),(146,'ENTITY',NULL,'CAMPAIGN_ATTLIST_ENTITY','ATTACHMENT_LIST','CAMPAIGN_ATTLIST',NULL,'ENTITY','\0',NULL),(147,'ENTITY',NULL,'TEST_CASE_ATTACHMENT_ENTITY','ATTACHMENT','TEST_CASE_ATTACHMENT',NULL,'ENTITY','\0',NULL),(148,'ENTITY',NULL,'CAMPAIGN_ATTACHMENT_ENTITY','ATTACHMENT','CAMPAIGN_ATTACHMENT',NULL,'ENTITY','\0',NULL),(149,'ENTITY',NULL,'REQUIREMENT_VERSION_ATTACHMENT_ENTITY','ATTACHMENT','REQUIREMENT_VERSION_ATTACHMENT',NULL,'ENTITY','\0',NULL),(150,'ENTITY',NULL,'DATASET_ENTITY','DATASET',NULL,NULL,'ENTITY','\0',NULL),(151,'ENTITY',NULL,'PARAMETER_ENTITY','PARAMETER',NULL,NULL,'ENTITY','\0',NULL),(152,'ENTITY',NULL,'TEST_CASE_PROJECT_ENTITY','PROJECT','TEST_CASE_PROJECT',NULL,'ENTITY','\0',NULL),(153,'ENTITY',NULL,'REQUIREMENT_PROJECT_ENTITY','PROJECT','REQUIREMENT_PROJECT',NULL,'ENTITY','\0',NULL),(154,'ENTITY',NULL,'CAMPAIGN_PROJECT_ENTITY','PROJECT','CAMPAIGN_PROJECT',NULL,'ENTITY','\0',NULL),(155,'ENTITY',NULL,'ITEM_SUITE_ENTITY','TEST_SUITE','ITEM_SUITE',NULL,'ENTITY','\0',NULL),(156,'ENTITY',NULL,'AUTOMATION_REQUEST_ENTITY','AUTOMATION_REQUEST',NULL,NULL,'ENTITY','\0',NULL),(157,'ATTRIBUTE',NULL,'CAMPAIGN_MILESTONE_LABEL','MILESTONE','CAMPAIGN_MILESTONE','label','STRING','\0',NULL),(158,'ATTRIBUTE',NULL,'TEST_CASE_PROJECT_ID','PROJECT','TEST_CASE_PROJECT','id','NUMERIC','\0',NULL),(159,'ATTRIBUTE',NULL,'TEST_CASE_PROJECT_NAME','PROJECT','TEST_CASE_PROJECT','name','STRING','\0',NULL),(160,'ATTRIBUTE',NULL,'REQUIREMENT_PROJECT_ID','PROJECT','REQUIREMENT_PROJECT','id','NUMERIC','\0',NULL),(161,'ATTRIBUTE',NULL,'REQUIREMENT_PROJECT_NAME','PROJECT','REQUIREMENT_PROJECT','name','STRING','\0',NULL),(162,'ATTRIBUTE',NULL,'CAMPAIGN_PROJECT_ID','PROJECT','CAMPAIGN_PROJECT','id','NUMERIC','\0',NULL),(163,'ATTRIBUTE',NULL,'CAMPAIGN_PROJECT_NAME','PROJECT','CAMPAIGN_PROJECT','name','STRING','\0',NULL),(164,'ATTRIBUTE',NULL,'TEST_CASE_ATTLIST_ID','ATTACHMENT_LIST','TEST_CASE_ATTLIST','id','NUMERIC','\0',NULL),(165,'ATTRIBUTE',NULL,'REQUIREMENT_VERSION_ATTLIST_ID','ATTACHMENT_LIST','REQUIREMENT_VERSION_ATTLIST','id','NUMERIC','\0',NULL),(166,'ATTRIBUTE',NULL,'CAMPAIGN_ATTLIST_ID','ATTACHMENT_LIST','CAMPAIGN_ATTLIST','id','NUMERIC','\0',NULL),(167,'ATTRIBUTE',NULL,'TEST_CASE_ATTACHMENT_ID','ATTACHMENT','TEST_CASE_ATTACHMENT','id','NUMERIC','\0',NULL),(168,'ATTRIBUTE',NULL,'REQUIREMENT_VERSION_ATTACHMENT_ID','ATTACHMENT','REQUIREMENT_VERSION_ATTACHMENT','id','NUMERIC','\0',NULL),(169,'ATTRIBUTE',NULL,'CAMPAIGN_ATTACHMENT_ID','ATTACHMENT','CAMPAIGN_ATTACHMENT','id','NUMERIC','\0',NULL),(170,'ATTRIBUTE',NULL,'DATASET_ID','DATASET',NULL,'id','NUMERIC','\0',NULL),(171,'ATTRIBUTE',NULL,'PARAMETER_ID','PARAMETER',NULL,'id','NUMERIC','\0',NULL),(172,'ATTRIBUTE',NULL,'TEST_CASE_MILESTONE_STATUS','MILESTONE','TEST_CASE_MILESTONE','status','LEVEL_ENUM','\0',NULL),(173,'ATTRIBUTE',NULL,'TEST_CASE_MILESTONE_END_DATE','MILESTONE','TEST_CASE_MILESTONE','endDate','DATE','\0',NULL),(174,'ATTRIBUTE',NULL,'REQUIREMENT_VERSION_MILESTONE_STATUS','MILESTONE','REQUIREMENT_VERSION_MILESTONE','status','LEVEL_ENUM','\0',NULL),(175,'ATTRIBUTE',NULL,'REQUIREMENT_VERSION_MILESTONE_END_DATE','MILESTONE','REQUIREMENT_VERSION_MILESTONE','endDate','DATE','\0',NULL),(176,'ATTRIBUTE',NULL,'CAMPAIGN_MILESTONE_STATUS','MILESTONE','CAMPAIGN_MILESTONE','status','LEVEL_ENUM','\0',NULL),(177,'ATTRIBUTE',NULL,'CAMPAIGN_MILESTONE_END_DATE','MILESTONE','CAMPAIGN_MILESTONE','endDate','DATE','\0',NULL),(178,'ATTRIBUTE',NULL,'AUTOMATION_REQUEST_ID','AUTOMATION_REQUEST',NULL,'id','NUMERIC','\0',NULL),(179,'ATTRIBUTE',NULL,'AUTOMATION_REQUEST_STATUS','AUTOMATION_REQUEST',NULL,'requestStatus','LEVEL_ENUM','',NULL),(180,'ATTRIBUTE',NULL,'REQUIREMENT_VERSION_NAME','REQUIREMENT_VERSION',NULL,'name','STRING','\0',NULL),(181,'ATTRIBUTE',NULL,'REQUIREMENT_VERSION_DESCRIPTION','REQUIREMENT_VERSION',NULL,'description','TEXT','\0',NULL),(182,'ATTRIBUTE',NULL,'TEST_CASE_NAME','TEST_CASE',NULL,'name','STRING','\0',NULL),(183,'ATTRIBUTE',NULL,'TEST_CASE_DESCRIPTION','TEST_CASE',NULL,'description','TEXT','\0',NULL),(184,'ENTITY',NULL,'TEST_CASE_KIND','TEST_CASE',NULL,'kind','ENTITY','\0',NULL),(185,'ATTRIBUTE',NULL,'TEST_CASE_PREQUISITE','TEST_CASE',NULL,'prerequisite','TEXT','\0',NULL),(186,'ATTRIBUTE',NULL,'TEST_CASE_AUTOMATABLE','TEST_CASE',NULL,'automatable','LEVEL_ENUM','',NULL),(187,'ATTRIBUTE',NULL,'CAMPAIGN_NAME','CAMPAIGN',NULL,'name','STRING','\0',NULL),(188,'ATTRIBUTE',NULL,'ITERATION_NAME','ITERATION',NULL,'name','STRING','\0',NULL),(189,'ATTRIBUTE',NULL,'ITEM_SUITE_ID','TEST_SUITE','ITEM_SUITE','id','NUMERIC','\0',NULL),(190,'ATTRIBUTE',NULL,'EXECUTION_EXECUTION_MODE','EXECUTION',NULL,'executionMode','LEVEL_ENUM','\0',NULL),(191,'ATTRIBUTE',NULL,'EXECUTION_LAST_EXECUTED_ON','EXECUTION',NULL,'lastExecutedOn','DATE','\0',NULL),(192,'ATTRIBUTE',NULL,'ITEM_TEST_PLAN_LASTEXECBY','ITEM_TEST_PLAN',NULL,'lastExecutedBy','STRING','\0',NULL),(193,'CALCULATED',22,'REQUIREMENT_VERSION_ATTCOUNT','REQUIREMENT_VERSION',NULL,'count(attachment)','NUMERIC','\0',NULL),(194,'CALCULATED',23,'TEST_CASE_ATTCOUNT','TEST_CASE',NULL,'count(attachment)','NUMERIC','\0',NULL),(195,'CALCULATED',24,'TEST_CASE_PARAMCOUNT','TEST_CASE',NULL,'count(parameter)','NUMERIC','\0',NULL),(196,'CALCULATED',25,'TEST_CASE_DATASETCOUNT','TEST_CASE',NULL,'count(dataset)','NUMERIC','\0',NULL),(197,'CALCULATED',26,'ITEM_TEST_PLAN_SUITECOUNT','ITEM_TEST_PLAN',NULL,'count(testSuites)','NUMERIC','\0',NULL),(198,'CALCULATED',27,'ITEM_TEST_PLAN_DSCOUNT','ITEM_TEST_PLAN',NULL,'count(datasets)','NUMERIC','\0',NULL),(199,'ATTRIBUTE',NULL,'DATASET_NAME','DATASET',NULL,'name','STRING','\0',NULL),(200,'ENTITY',NULL,'SCM_REPOSITORY_ENTITY','SCM_REPOSITORY',NULL,NULL,'ENTITY','\0',NULL),(201,'ATTRIBUTE',NULL,'SCM_REPOSITORY_ID','SCM_REPOSITORY',NULL,'id','NUMERIC','\0',NULL),(202,'ATTRIBUTE',NULL,'TEST_CASE_AUTOMATED_TEST_REFERENCE','TEST_CASE',NULL,'automatedTestReference','STRING','\0',NULL),(203,'CALCULATED',28,'TEST_CASE_HAS_BOUND_SCM_REPOSITORY','TEST_CASE',NULL,'notnull(scmRepository)','BOOLEAN','',NULL),(204,'CALCULATED',29,'TEST_CASE_HAS_BOUND_AUTOMATED_TEST_REFERENCE','TEST_CASE',NULL,'notnull(automatedTestReference)','BOOLEAN','',NULL),(205,'ATTRIBUTE',NULL,'TEST_CASE_AUTOMATED_TEST_TECHNOLOGY','TEST_CASE',NULL,'automatedTestTechnology.name','AUTOMATED_TEST_TECHNOLOGY','',NULL),(206,'ATTRIBUTE',NULL,'AUTOMATION_REQUEST_TRANSMISSION_DATE','AUTOMATION_REQUEST',NULL,'transmissionDate','DATE','',NULL),(207,'ATTRIBUTE',NULL,'AUTOMATION_REQUEST_AUTOMATION_PRIORITY','AUTOMATION_REQUEST',NULL,'automationPriority','NUMERIC','',NULL),(208,'ENTITY',NULL,'REQUIREMENT_KIND','REQUIREMENT',NULL,NULL,'ENTITY','\0',NULL),(209,'CALCULATED',30,'REQUIREMENT_BOUND_TO_HIGH_LEVEL_REQUIREMENT','REQUIREMENT',NULL,'notnull(highLevelRequirement)','BOOLEAN','\0',NULL),(210,'ENTITY',NULL,'HIGH_LEVEL_REQUIREMENT_ENTITY','HIGH_LEVEL_REQUIREMENT',NULL,NULL,'ENTITY','\0',NULL),(211,'ATTRIBUTE',NULL,'HIGH_LEVEL_REQUIREMENT_ID','HIGH_LEVEL_REQUIREMENT',NULL,'id','NUMERIC','\0',NULL),(212,'ATTRIBUTE',NULL,'TEST_CASE_DRAFTED_BY_AI','TEST_CASE',NULL,'draftedByAi','BOOLEAN','\0',NULL);
/*!40000 ALTER TABLE `QUERY_COLUMN_PROTOTYPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QUERY_FILTER_COLUMN`
--

DROP TABLE IF EXISTS `QUERY_FILTER_COLUMN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `QUERY_FILTER_COLUMN` (
  `QUERY_FILTER_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'autogenerated ID',
  `QUERY_COLUMN_ID` bigint(20) NOT NULL COMMENT 'foreign key to a QUERY_COLUMN_PROTOTYPE',
  `QUERY_MODEL_ID` bigint(20) NOT NULL COMMENT 'foreign key to a QUERY_MODEL',
  `FILTER_OPERATION` varchar(20) DEFAULT NULL COMMENT 'a comparison operator',
  `CUF_ID` bigint(20) DEFAULT NULL COMMENT 'the custom field id for this filter column, if the referenced column is a custom field.',
  PRIMARY KEY (`QUERY_FILTER_ID`),
  KEY `fk_query_filter_query_model` (`QUERY_MODEL_ID`),
  KEY `fk_query_filter_query_column` (`QUERY_COLUMN_ID`),
  KEY `idx_query_filter` (`QUERY_FILTER_ID`),
  CONSTRAINT `fk_query_filter_query_column` FOREIGN KEY (`QUERY_COLUMN_ID`) REFERENCES `QUERY_COLUMN_PROTOTYPE` (`QUERY_COLUMN_ID`),
  CONSTRAINT `fk_query_filter_query_model` FOREIGN KEY (`QUERY_MODEL_ID`) REFERENCES `QUERY_MODEL` (`QUERY_MODEL_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QUERY_FILTER_COLUMN`
--

LOCK TABLES `QUERY_FILTER_COLUMN` WRITE;
/*!40000 ALTER TABLE `QUERY_FILTER_COLUMN` DISABLE KEYS */;
INSERT INTO `QUERY_FILTER_COLUMN` VALUES (1,134,5,'IS_CLASS',NULL),(2,94,17,'NOT_NULL',NULL),(3,94,18,'NOT_NULL',NULL);
/*!40000 ALTER TABLE `QUERY_FILTER_COLUMN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QUERY_FILTER_VALUES`
--

DROP TABLE IF EXISTS `QUERY_FILTER_VALUES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `QUERY_FILTER_VALUES` (
  `QUERY_FILTER_ID` bigint(20) NOT NULL COMMENT 'foreign key to QUERY_FILTER_COLUMN',
  `FILTER_VALUE` varchar(255) DEFAULT NULL COMMENT 'a value for this filter',
  KEY `fk_query_filter_value_query_filter` (`QUERY_FILTER_ID`),
  CONSTRAINT `fk_query_filter_value_query_filter` FOREIGN KEY (`QUERY_FILTER_ID`) REFERENCES `QUERY_FILTER_COLUMN` (`QUERY_FILTER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QUERY_FILTER_VALUES`
--

LOCK TABLES `QUERY_FILTER_VALUES` WRITE;
/*!40000 ALTER TABLE `QUERY_FILTER_VALUES` DISABLE KEYS */;
INSERT INTO `QUERY_FILTER_VALUES` VALUES (1,'org.squashtest.tm.domain.testcase.CallTestStep'),(2,'FALSE'),(3,'TRUE');
/*!40000 ALTER TABLE `QUERY_FILTER_VALUES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QUERY_MODEL`
--

DROP TABLE IF EXISTS `QUERY_MODEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `QUERY_MODEL` (
  `QUERY_MODEL_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) DEFAULT NULL COMMENT 'internal usage, when this CHART_QUERY is a    CHART_COLUMN_PROTOTYPE subquery the name helps identify which one',
  `STRATEGY` varchar(20) DEFAULT NULL COMMENT 'says how the query builder should integrate this query    to a main query. Accepts values : MAIN, SUBQUERY or INLINED',
  `JOIN_STYLE` varchar(10) DEFAULT NULL COMMENT 'generally indicate whether should use inner join or left join when a    natural join is possible. Possible values : INNER_JOIN or LEFT_JOIN',
  PRIMARY KEY (`QUERY_MODEL_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QUERY_MODEL`
--

LOCK TABLES `QUERY_MODEL` WRITE;
/*!40000 ALTER TABLE `QUERY_MODEL` DISABLE KEYS */;
INSERT INTO `QUERY_MODEL` VALUES (1,'REQUIREMENT_NB_VERSIONS_SUBQUERY','SUBQUERY','INNER_JOIN'),(2,'REQUIREMENT_VERSION_TCCOUNT_SUBQUERY','SUBQUERY','LEFT_JOIN'),(3,'REQUIREMENT_VERSION_MILCOUNT_SUBQUERY','SUBQUERY','LEFT_JOIN'),(4,'TEST_CASE_VERSCOUNT_SUBQUERY','SUBQUERY','LEFT_JOIN'),(5,'TEST_CASE_CALLSTEPCOUNT_SUBQUERY','SUBQUERY','LEFT_JOIN'),(6,'TEST_CASE_STEPCOUNT_SUBQUERY','SUBQUERY','LEFT_JOIN'),(7,'TEST_CASE_VERSION_MILCOUNT_SUBQUERY','SUBQUERY','LEFT_JOIN'),(8,'TEST_CASE_ITERCOUNT_SUBQUERY','SUBQUERY','LEFT_JOIN'),(9,'TEST_CASE_EXECOUNT_SUBQUERY','SUBQUERY','LEFT_JOIN'),(10,'TEST_CASE_HASAUTOSCRIPT_SUBQUERY','INLINED','LEFT_JOIN'),(11,'CAMPAIGN_ITERCOUNT_SUBQUERY','SUBQUERY','LEFT_JOIN'),(12,'CAMPAIGN_ISSUECOUNT_SUBQUERY','SUBQUERY','LEFT_JOIN'),(13,'ITERATION_ITEMCOUNT_SUBQUERY','SUBQUERY','LEFT_JOIN'),(14,'ITERATION_ISSUECOUNT_SUBQUERY','SUBQUERY','LEFT_JOIN'),(15,'ITEM_TEST_PLAN_TCDELETED_SUBQUERY','INLINED','LEFT_JOIN'),(16,'ITEM_TEST_PLAN_ISEXECUTED_SUBQUERY','SUBQUERY','LEFT_JOIN'),(17,'ITEM_TEST_PLAN_MANEXCOUNT_SUBQUERY','SUBQUERY','LEFT_JOIN'),(18,'ITEM_TEST_PLAN_AUTOEXCOUNT_SUBQUERY','SUBQUERY','LEFT_JOIN'),(19,'ITEM_TEST_PLAN_ISSUECOUNT_SUBQUERY','SUBQUERY','LEFT_JOIN'),(20,'EXECUTION_ISAUTO_SUBQUERY','SUBQUERY','LEFT_JOIN'),(21,'EXECUTION_ISSUECOUNT_SUBQUERY','SUBQUERY','LEFT_JOIN'),(22,'REQUIREMENT_VERSION_ATTCOUNT_SUBQUERY','SUBQUERY','LEFT_JOIN'),(23,'TEST_CASE_ATTCOUNT_SUBQUERY','SUBQUERY','LEFT_JOIN'),(24,'TEST_CASE_PARAMCOUNT_SUBQUERY','SUBQUERY','LEFT_JOIN'),(25,'TEST_CASE_DATASETCOUNT_SUBQUERY','SUBQUERY','LEFT_JOIN'),(26,'ITEM_TEST_PLAN_SUITECOUNT_SUBQUERY','SUBQUERY','LEFT_JOIN'),(27,'ITEM_TEST_PLAN_DSCOUNT_SUBQUERY','SUBQUERY','LEFT_JOIN'),(28,'TEST_CASE_HAS_BOUND_SCM_REPOSITORY_SUBQUERY','SUBQUERY','LEFT_JOIN'),(29,'TEST_CASE_HAS_BOUND_AUTOMATED_TEST_SUBQUERY','SUBQUERY','LEFT_JOIN'),(30,'REQUIREMENT_BOUND_TO_HIGH_LEVEL_REQUIREMENT_SUBQUERY','SUBQUERY','LEFT_JOIN');
/*!40000 ALTER TABLE `QUERY_MODEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QUERY_ORDERING_COLUMN`
--

DROP TABLE IF EXISTS `QUERY_ORDERING_COLUMN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `QUERY_ORDERING_COLUMN` (
  `QUERY_MODEL_ID` bigint(20) NOT NULL COMMENT 'foreign key to a QUERY_MODEL. Note that this is a denormalization : that value could be retrieved via the referenced projection column',
  `QUERY_COLUMN_ID` bigint(20) NOT NULL COMMENT 'foreign key to the QUERY_COLUMN_PROTOTYPE which must be ordered',
  `ORDER_OPERATION` varchar(20) DEFAULT NULL COMMENT 'the operation applied to the column, if any. It must mirror the operation applied to the column they reference in the projection/aggregation clause.',
  `ORDER_RANK` int(11) DEFAULT NULL COMMENT 'the order in which this ordering instruction must be treated.',
  `ORDER_DIR` char(3) DEFAULT 'ASC' COMMENT 'either ASC or DESC',
  `CUF_ID` bigint(20) DEFAULT NULL COMMENT 'the custom field id for this filter column, if the referenced column is a custom field.',
  KEY `fk_query_order_query_model` (`QUERY_MODEL_ID`),
  KEY `fk_query_order_query_column` (`QUERY_COLUMN_ID`),
  CONSTRAINT `fk_query_order_query_column` FOREIGN KEY (`QUERY_COLUMN_ID`) REFERENCES `QUERY_COLUMN_PROTOTYPE` (`QUERY_COLUMN_ID`),
  CONSTRAINT `fk_query_order_query_model` FOREIGN KEY (`QUERY_MODEL_ID`) REFERENCES `QUERY_MODEL` (`QUERY_MODEL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QUERY_ORDERING_COLUMN`
--

LOCK TABLES `QUERY_ORDERING_COLUMN` WRITE;
/*!40000 ALTER TABLE `QUERY_ORDERING_COLUMN` DISABLE KEYS */;
INSERT INTO `QUERY_ORDERING_COLUMN` VALUES (1,1,'NONE',0,'ASC',NULL),(2,7,'NONE',0,'ASC',NULL),(3,7,'NONE',0,'ASC',NULL),(4,19,'NONE',0,'ASC',NULL),(5,19,'NONE',0,'ASC',NULL),(6,19,'NONE',0,'ASC',NULL),(7,19,'NONE',0,'ASC',NULL),(8,19,'NONE',0,'ASC',NULL),(9,19,'NONE',0,'ASC',NULL),(10,19,'NONE',0,'ASC',NULL),(11,37,'NONE',0,'ASC',NULL),(12,37,'NONE',0,'ASC',NULL),(13,46,'NONE',0,'ASC',NULL),(14,46,'NONE',0,'ASC',NULL),(15,54,'NONE',0,'ASC',NULL),(16,54,'NONE',0,'ASC',NULL),(17,54,'NONE',0,'ASC',NULL),(18,54,'NONE',0,'ASC',NULL),(19,54,'NONE',0,'ASC',NULL),(20,66,'NONE',0,'ASC',NULL),(21,66,'NONE',0,'ASC',NULL),(1,7,'COUNT',1,'ASC',NULL),(2,19,'COUNT',1,'ASC',NULL),(3,89,'COUNT',1,'ASC',NULL),(4,7,'COUNT',1,'ASC',NULL),(5,79,'COUNT',1,'ASC',NULL),(6,79,'COUNT',1,'ASC',NULL),(7,87,'COUNT',1,'ASC',NULL),(8,46,'COUNT',1,'ASC',NULL),(9,66,'COUNT',1,'ASC',NULL),(10,93,'NOT_NULL',1,'ASC',NULL),(11,46,'COUNT',1,'ASC',NULL),(12,75,'COUNT',1,'ASC',NULL),(13,54,'COUNT',1,'ASC',NULL),(14,75,'COUNT',1,'ASC',NULL),(15,19,'IS_NULL',1,'ASC',NULL),(16,66,'NOT_NULL',1,'ASC',NULL),(17,66,'COUNT',1,'ASC',NULL),(18,66,'COUNT',1,'ASC',NULL),(19,75,'COUNT',1,'ASC',NULL),(20,94,'NOT_NULL',1,'ASC',NULL),(21,75,'COUNT',1,'ASC',NULL),(28,19,'NONE',0,'ASC',NULL),(29,202,'NONE',0,'ASC',NULL),(30,1,'NONE',0,'ASC',NULL);
/*!40000 ALTER TABLE `QUERY_ORDERING_COLUMN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QUERY_PROJECTION_COLUMN`
--

DROP TABLE IF EXISTS `QUERY_PROJECTION_COLUMN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `QUERY_PROJECTION_COLUMN` (
  `QUERY_COLUMN_ID` bigint(20) NOT NULL COMMENT 'foreign key to the QUERY_COLUMN_PROTOTYPE this projection applies to',
  `QUERY_MODEL_ID` bigint(20) NOT NULL COMMENT 'foreign key to a QUERY_MODEL',
  `LABEL` varchar(30) DEFAULT NULL COMMENT 'A label for this projected column. Will override the default label of the column prototype if non null.',
  `PROJECTION_OPERATION` varchar(20) DEFAULT NULL COMMENT 'the operation applied to the column, if any.',
  `PROJECTION_RANK` int(11) DEFAULT NULL COMMENT 'the order in which this projected column in the returned tuple.',
  `CUF_ID` bigint(20) DEFAULT NULL COMMENT 'the custom field id for this projection column, if the referenced column is a custom field.',
  KEY `fk_query_projection_query_column` (`QUERY_COLUMN_ID`),
  KEY `fk_query_projection_query_model` (`QUERY_MODEL_ID`),
  CONSTRAINT `fk_query_projection_query_column` FOREIGN KEY (`QUERY_COLUMN_ID`) REFERENCES `QUERY_COLUMN_PROTOTYPE` (`QUERY_COLUMN_ID`),
  CONSTRAINT `fk_query_projection_query_model` FOREIGN KEY (`QUERY_MODEL_ID`) REFERENCES `QUERY_MODEL` (`QUERY_MODEL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QUERY_PROJECTION_COLUMN`
--

LOCK TABLES `QUERY_PROJECTION_COLUMN` WRITE;
/*!40000 ALTER TABLE `QUERY_PROJECTION_COLUMN` DISABLE KEYS */;
INSERT INTO `QUERY_PROJECTION_COLUMN` VALUES (7,1,NULL,'COUNT',0,NULL),(19,2,NULL,'COUNT',0,NULL),(89,3,NULL,'COUNT',0,NULL),(7,4,NULL,'COUNT',0,NULL),(79,5,NULL,'COUNT',0,NULL),(79,6,NULL,'COUNT',0,NULL),(87,7,NULL,'COUNT',0,NULL),(46,8,NULL,'COUNT',0,NULL),(66,9,NULL,'COUNT',0,NULL),(93,10,NULL,'NOT_NULL',0,NULL),(46,11,NULL,'COUNT',0,NULL),(75,12,NULL,'COUNT',0,NULL),(54,13,NULL,'COUNT',0,NULL),(75,14,NULL,'COUNT',0,NULL),(19,15,NULL,'IS_NULL',0,NULL),(66,16,NULL,'NOT_NULL',0,NULL),(66,17,NULL,'COUNT',0,NULL),(66,18,NULL,'COUNT',0,NULL),(75,19,NULL,'COUNT',0,NULL),(94,20,NULL,'NOT_NULL',0,NULL),(75,21,NULL,'COUNT',0,NULL),(168,22,NULL,'COUNT',0,NULL),(167,23,NULL,'COUNT',0,NULL),(171,24,NULL,'COUNT',0,NULL),(170,25,NULL,'COUNT',0,NULL),(189,26,NULL,'COUNT',0,NULL),(170,27,NULL,'COUNT',0,NULL),(201,28,NULL,'NOT_NULL',0,NULL),(202,29,NULL,'NOT_NULL',0,NULL),(211,30,NULL,'NOT_NULL',0,NULL);
/*!40000 ALTER TABLE `QUERY_PROJECTION_COLUMN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REMOTE_AUTOMATION_REQUEST_EXTENDER`
--

DROP TABLE IF EXISTS `REMOTE_AUTOMATION_REQUEST_EXTENDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `REMOTE_AUTOMATION_REQUEST_EXTENDER` (
  `REMOTE_AUTOMATION_REQUEST_EXTENDER_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'The auto-generated id',
  `AUTOMATION_REQUEST_ID` bigint(20) NOT NULL COMMENT 'The automation request this extender extends',
  `SERVER_ID` bigint(20) DEFAULT NULL COMMENT 'The bugtracker to which the automation request is linked',
  `REMOTE_STATUS` varchar(255) DEFAULT NULL COMMENT 'The remote status as defined in the bugtracker',
  `REMOTE_ISSUE_KEY` varchar(255) NOT NULL COMMENT 'The remote issue key as generated by Jira',
  `REMOTE_REQUEST_URL` varchar(300) DEFAULT NULL COMMENT 'The Url to the remote request',
  `REMOTE_ASSIGNED_TO` varchar(300) NOT NULL COMMENT 'email of the assigned',
  `LAST_SYNC_DATE` datetime DEFAULT NULL COMMENT 'Date of the last synchronisation.',
  `SENT_VALUE_FOR_SYNC` longtext DEFAULT NULL COMMENT 'The values ​​of the test case fields sent during synchronization.',
  `SYNCHRONIZABLE_ISSUE_STATUS` varchar(25) DEFAULT NULL COMMENT 'this column can be set to: TO SYNCHRONIZE, DELETED, MOVED_PROJECT and MOVED_ISSUE_TYPE ; and it is updated after each synchronization.',
  `LAST_SYNC_DATE_SQUASH` datetime DEFAULT NULL COMMENT 'Date of the last synchronisation squash to remote server.',
  PRIMARY KEY (`REMOTE_AUTOMATION_REQUEST_EXTENDER_ID`),
  KEY `idx_fk_remote_automation_request_extender_automation_request_id` (`AUTOMATION_REQUEST_ID`),
  KEY `idx_fk_remote_automation_request_extender_server_id` (`SERVER_ID`),
  CONSTRAINT `fk_remote_automation_request_extender_automation_request_id` FOREIGN KEY (`AUTOMATION_REQUEST_ID`) REFERENCES `AUTOMATION_REQUEST` (`AUTOMATION_REQUEST_ID`),
  CONSTRAINT `fk_remote_automation_request_extender_server_id` FOREIGN KEY (`SERVER_ID`) REFERENCES `BUGTRACKER` (`BUGTRACKER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REMOTE_AUTOMATION_REQUEST_EXTENDER`
--

LOCK TABLES `REMOTE_AUTOMATION_REQUEST_EXTENDER` WRITE;
/*!40000 ALTER TABLE `REMOTE_AUTOMATION_REQUEST_EXTENDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `REMOTE_AUTOMATION_REQUEST_EXTENDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REMOTE_SYNCHRONISATION`
--

DROP TABLE IF EXISTS `REMOTE_SYNCHRONISATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `REMOTE_SYNCHRONISATION` (
  `REMOTE_SYNCHRONISATION_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PROJECT_ID` bigint(20) NOT NULL,
  `SERVER_ID` bigint(20) NOT NULL,
  `REMOTE_SYNCHRONISATION_NAME` varchar(255) NOT NULL,
  `KIND` varchar(50) NOT NULL,
  `REMOTE_SELECT_TYPE` varchar(50) DEFAULT NULL,
  `REMOTE_SELECT_VALUE` varchar(1000) DEFAULT NULL,
  `LAST_SUCCESSFUL_SYNC_DATE` datetime DEFAULT NULL,
  `LAST_SYNC_DATE` datetime DEFAULT NULL,
  `LAST_SYNC_STATUS` varchar(20) DEFAULT NULL,
  `SYNC_STATUS` varchar(20) DEFAULT NULL,
  `REMOTE_SYNCHRONISATION_OPTIONS` longtext DEFAULT NULL,
  `SYNC_ENABLE` bit(1) NOT NULL DEFAULT b'1' COMMENT 'This column specifies if synchronisation is enable or disable for a project',
  `OWNER_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`REMOTE_SYNCHRONISATION_ID`),
  KEY `fk_remote_sync__bugtracker__bugtracker_id` (`SERVER_ID`),
  KEY `fk_remote_sync__project__project_id` (`PROJECT_ID`),
  KEY `idx_fk_remote_sync_owner` (`OWNER_ID`),
  CONSTRAINT `fk_remote_sync__bugtracker__bugtracker_id` FOREIGN KEY (`SERVER_ID`) REFERENCES `BUGTRACKER` (`BUGTRACKER_ID`),
  CONSTRAINT `fk_remote_sync__project__project_id` FOREIGN KEY (`PROJECT_ID`) REFERENCES `PROJECT` (`PROJECT_ID`),
  CONSTRAINT `fk_remote_sync_owner` FOREIGN KEY (`OWNER_ID`) REFERENCES `CORE_USER` (`PARTY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REMOTE_SYNCHRONISATION`
--

LOCK TABLES `REMOTE_SYNCHRONISATION` WRITE;
/*!40000 ALTER TABLE `REMOTE_SYNCHRONISATION` DISABLE KEYS */;
/*!40000 ALTER TABLE `REMOTE_SYNCHRONISATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REPORT_DEFINITION`
--

DROP TABLE IF EXISTS `REPORT_DEFINITION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `REPORT_DEFINITION` (
  `REPORT_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'autogenerated ID',
  `NAME` varchar(255) DEFAULT NULL COMMENT 'The name of this chart',
  `DESCRIPTION` longtext DEFAULT NULL COMMENT 'additional informations about this report',
  `PLUGIN_NAMESPACE` varchar(255) DEFAULT NULL COMMENT 'The namespace of the report plugin',
  `PARAMETERS` longtext DEFAULT NULL COMMENT 'parameters to generate the report',
  `PROJECT_ID` bigint(20) NOT NULL COMMENT 'foreign key to the projet',
  `CREATED_BY` varchar(100) NOT NULL,
  `CREATED_ON` datetime NOT NULL,
  `LAST_MODIFIED_BY` varchar(100) DEFAULT NULL,
  `LAST_MODIFIED_ON` datetime DEFAULT NULL,
  `SUMMARY` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`REPORT_ID`),
  KEY `fk_project_report_definition_project_id` (`PROJECT_ID`),
  CONSTRAINT `fk_project_report_definition_project_id` FOREIGN KEY (`PROJECT_ID`) REFERENCES `PROJECT` (`PROJECT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REPORT_DEFINITION`
--

LOCK TABLES `REPORT_DEFINITION` WRITE;
/*!40000 ALTER TABLE `REPORT_DEFINITION` DISABLE KEYS */;
/*!40000 ALTER TABLE `REPORT_DEFINITION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIREMENT`
--

DROP TABLE IF EXISTS `REQUIREMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIREMENT` (
  `RLN_ID` bigint(20) NOT NULL COMMENT 'cle primaire, qui est aussi une cle etrangere vers la table REQUIREMENT_LIBRARY_NODE. Ne doit donc pas etre autogeneree.',
  `CURRENT_VERSION_ID` bigint(20) DEFAULT NULL COMMENT 'FK to REQUIREMENT_VERSION linking to the requirement''s latest version. Should not be null but the column is nullable because of cyclic relationship between the tables.',
  `MODE` varchar(15) DEFAULT 'NATIVE' COMMENT 'Says whether a requirement is NATIVE or SYNCHRONIZED',
  `HIGH_LEVEL_REQUIREMENT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`RLN_ID`),
  KEY `idx_requirement` (`RLN_ID`),
  KEY `fk_requirement_current_version` (`CURRENT_VERSION_ID`),
  KEY `fk_requirement_high_lvl_requirement` (`HIGH_LEVEL_REQUIREMENT_ID`),
  CONSTRAINT `fk_requirement_current_version` FOREIGN KEY (`CURRENT_VERSION_ID`) REFERENCES `REQUIREMENT_VERSION` (`RES_ID`),
  CONSTRAINT `fk_requirement_high_lvl_requirement` FOREIGN KEY (`HIGH_LEVEL_REQUIREMENT_ID`) REFERENCES `HIGH_LEVEL_REQUIREMENT` (`RLN_ID`),
  CONSTRAINT `fk_requirement_requirement_node` FOREIGN KEY (`RLN_ID`) REFERENCES `REQUIREMENT_LIBRARY_NODE` (`RLN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIREMENT`
--

LOCK TABLES `REQUIREMENT` WRITE;
/*!40000 ALTER TABLE `REQUIREMENT` DISABLE KEYS */;
INSERT INTO `REQUIREMENT` VALUES (4,4,'NATIVE',NULL);
/*!40000 ALTER TABLE `REQUIREMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIREMENT_AUDIT_EVENT`
--

DROP TABLE IF EXISTS `REQUIREMENT_AUDIT_EVENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIREMENT_AUDIT_EVENT` (
  `EVENT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `REQ_VERSION_ID` bigint(20) NOT NULL COMMENT 'the ID of the target entity. As for 1.1.0 and until further notice, the target is always a requirement version.',
  `EVENT_DATE` datetime NOT NULL COMMENT 'the timestamp of the log entry',
  `AUTHOR` varchar(255) NOT NULL COMMENT 'the login of the user who generated the event',
  PRIMARY KEY (`EVENT_ID`),
  KEY `fk_audit_event_requirement_version` (`REQ_VERSION_ID`),
  CONSTRAINT `fk_audit_event_requirement_version` FOREIGN KEY (`REQ_VERSION_ID`) REFERENCES `REQUIREMENT_VERSION` (`RES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIREMENT_AUDIT_EVENT`
--

LOCK TABLES `REQUIREMENT_AUDIT_EVENT` WRITE;
/*!40000 ALTER TABLE `REQUIREMENT_AUDIT_EVENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `REQUIREMENT_AUDIT_EVENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIREMENT_CREATION`
--

DROP TABLE IF EXISTS `REQUIREMENT_CREATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIREMENT_CREATION` (
  `EVENT_ID` bigint(20) NOT NULL COMMENT 'primary key, which is also a foreign key to REQUIREMENT_AUDIT_EVENT (they share that key : do not make this table autoincrement it).',
  PRIMARY KEY (`EVENT_ID`),
  CONSTRAINT `fk_create_audit` FOREIGN KEY (`EVENT_ID`) REFERENCES `REQUIREMENT_AUDIT_EVENT` (`EVENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIREMENT_CREATION`
--

LOCK TABLES `REQUIREMENT_CREATION` WRITE;
/*!40000 ALTER TABLE `REQUIREMENT_CREATION` DISABLE KEYS */;
/*!40000 ALTER TABLE `REQUIREMENT_CREATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIREMENT_FOLDER`
--

DROP TABLE IF EXISTS `REQUIREMENT_FOLDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIREMENT_FOLDER` (
  `RLN_ID` bigint(20) NOT NULL COMMENT 'cle primaire, qui est une cle etrangere vers la table REQUIREMENT_LIBRARY_NODE. Ne doit donc pas etre autogeneree.',
  `RES_ID` bigint(20) DEFAULT NULL COMMENT 'FK to SIMPLE_RESOURCE table',
  PRIMARY KEY (`RLN_ID`),
  KEY `idx_req_folder` (`RLN_ID`),
  KEY `fk_req_folder_simple_resource` (`RES_ID`),
  CONSTRAINT `fk_folder_requirement_node` FOREIGN KEY (`RLN_ID`) REFERENCES `REQUIREMENT_LIBRARY_NODE` (`RLN_ID`),
  CONSTRAINT `fk_req_folder_simple_resource` FOREIGN KEY (`RES_ID`) REFERENCES `SIMPLE_RESOURCE` (`RES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIREMENT_FOLDER`
--

LOCK TABLES `REQUIREMENT_FOLDER` WRITE;
/*!40000 ALTER TABLE `REQUIREMENT_FOLDER` DISABLE KEYS */;
INSERT INTO `REQUIREMENT_FOLDER` VALUES (1,1),(2,2),(3,3);
/*!40000 ALTER TABLE `REQUIREMENT_FOLDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIREMENT_FOLDER_SYNC_EXTENDER`
--

DROP TABLE IF EXISTS `REQUIREMENT_FOLDER_SYNC_EXTENDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIREMENT_FOLDER_SYNC_EXTENDER` (
  `RF_SYNC_EXTENDER_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `REMOTE_SYNCHRONISATION_ID` bigint(20) NOT NULL COMMENT 'Only one master folder should be targeted by a given synchronisation',
  `REMOTE_FOLDER_ID` varchar(255) DEFAULT NULL,
  `REMOTE_FOLDER_STATUS` varchar(50) DEFAULT NULL,
  `REQUIREMENT_FOLDER_ID` bigint(20) NOT NULL COMMENT 'Only one extender for any folder in Squash TM',
  `TYPE` varchar(30) NOT NULL,
  PRIMARY KEY (`RF_SYNC_EXTENDER_ID`),
  UNIQUE KEY `REQUIREMENT_FOLDER_ID` (`REQUIREMENT_FOLDER_ID`),
  KEY `fk_req_folder_sync_extender__remote_sync_remote_sync_id` (`REMOTE_SYNCHRONISATION_ID`),
  CONSTRAINT `fk_req_folder_sync_extender__remote_sync_remote_sync_id` FOREIGN KEY (`REMOTE_SYNCHRONISATION_ID`) REFERENCES `REMOTE_SYNCHRONISATION` (`REMOTE_SYNCHRONISATION_ID`),
  CONSTRAINT `fk_req_folder_sync_extender__req_folder__rln_id` FOREIGN KEY (`REQUIREMENT_FOLDER_ID`) REFERENCES `REQUIREMENT_FOLDER` (`RLN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIREMENT_FOLDER_SYNC_EXTENDER`
--

LOCK TABLES `REQUIREMENT_FOLDER_SYNC_EXTENDER` WRITE;
/*!40000 ALTER TABLE `REQUIREMENT_FOLDER_SYNC_EXTENDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `REQUIREMENT_FOLDER_SYNC_EXTENDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIREMENT_LARGE_PROPERTY_CHANGE`
--

DROP TABLE IF EXISTS `REQUIREMENT_LARGE_PROPERTY_CHANGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIREMENT_LARGE_PROPERTY_CHANGE` (
  `EVENT_ID` bigint(20) NOT NULL COMMENT 'primary key, which is also a foreign key to REQUIREMENT_AUDIT_EVENT (they share that key : do not make this table autoincrement it).',
  `OLD_VALUE` longtext DEFAULT NULL,
  `NEW_VALUE` longtext DEFAULT NULL,
  `PROPERTY_NAME` varchar(100) NOT NULL,
  PRIMARY KEY (`EVENT_ID`),
  CONSTRAINT `fk_lPPT_change_audit` FOREIGN KEY (`EVENT_ID`) REFERENCES `REQUIREMENT_AUDIT_EVENT` (`EVENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIREMENT_LARGE_PROPERTY_CHANGE`
--

LOCK TABLES `REQUIREMENT_LARGE_PROPERTY_CHANGE` WRITE;
/*!40000 ALTER TABLE `REQUIREMENT_LARGE_PROPERTY_CHANGE` DISABLE KEYS */;
/*!40000 ALTER TABLE `REQUIREMENT_LARGE_PROPERTY_CHANGE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIREMENT_LIBRARY`
--

DROP TABLE IF EXISTS `REQUIREMENT_LIBRARY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIREMENT_LIBRARY` (
  `RL_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'cle primaire autogeneree',
  `ATTACHMENT_LIST_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`RL_ID`),
  KEY `idx_requirement_library` (`RL_ID`),
  KEY `fk_reqLib_attachment_list` (`ATTACHMENT_LIST_ID`),
  CONSTRAINT `fk_reqLib_attachment_list` FOREIGN KEY (`ATTACHMENT_LIST_ID`) REFERENCES `ATTACHMENT_LIST` (`ATTACHMENT_LIST_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIREMENT_LIBRARY`
--

LOCK TABLES `REQUIREMENT_LIBRARY` WRITE;
/*!40000 ALTER TABLE `REQUIREMENT_LIBRARY` DISABLE KEYS */;
INSERT INTO `REQUIREMENT_LIBRARY` VALUES (1,2),(2,9);
/*!40000 ALTER TABLE `REQUIREMENT_LIBRARY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIREMENT_LIBRARY_CONTENT`
--

DROP TABLE IF EXISTS `REQUIREMENT_LIBRARY_CONTENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIREMENT_LIBRARY_CONTENT` (
  `LIBRARY_ID` bigint(20) NOT NULL COMMENT 'cle etrangere vers une bibliotheque d''exigence.',
  `CONTENT_ID` bigint(20) NOT NULL COMMENT 'cle etrangere vers un noeud de la bibliotheque d''exigences.',
  `CONTENT_ORDER` int(11) NOT NULL,
  UNIQUE KEY `CONTENT_ID` (`CONTENT_ID`),
  KEY `idx_requirement_lib_content_content` (`CONTENT_ID`),
  KEY `idx_requirement_lib_content_lib` (`LIBRARY_ID`),
  CONSTRAINT `fk_requirement_lib_content_content` FOREIGN KEY (`CONTENT_ID`) REFERENCES `REQUIREMENT_LIBRARY_NODE` (`RLN_ID`),
  CONSTRAINT `fk_requirement_lib_content_lib` FOREIGN KEY (`LIBRARY_ID`) REFERENCES `REQUIREMENT_LIBRARY` (`RL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIREMENT_LIBRARY_CONTENT`
--

LOCK TABLES `REQUIREMENT_LIBRARY_CONTENT` WRITE;
/*!40000 ALTER TABLE `REQUIREMENT_LIBRARY_CONTENT` DISABLE KEYS */;
INSERT INTO `REQUIREMENT_LIBRARY_CONTENT` VALUES (1,1,0),(1,2,1),(1,3,2);
/*!40000 ALTER TABLE `REQUIREMENT_LIBRARY_CONTENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIREMENT_LIBRARY_NODE`
--

DROP TABLE IF EXISTS `REQUIREMENT_LIBRARY_NODE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIREMENT_LIBRARY_NODE` (
  `RLN_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'cle primaire autogeneree',
  `CREATED_BY` varchar(100) NOT NULL,
  `CREATED_ON` datetime NOT NULL COMMENT 'Date de creation de cette exigence. Il s''agit de la date de creation de l''entree dans la base, non d''une date metier.',
  `LAST_MODIFIED_BY` varchar(100) DEFAULT NULL,
  `LAST_MODIFIED_ON` datetime DEFAULT NULL COMMENT 'Date de derniere mise a jour de cette instance.',
  `PROJECT_ID` bigint(20) DEFAULT NULL COMMENT 'FK to the Project to which belongs this resource',
  PRIMARY KEY (`RLN_ID`),
  KEY `fk_rln_project` (`PROJECT_ID`),
  KEY `idx_rln_created_by` (`CREATED_BY`),
  KEY `idx_rln_last_modified_by` (`LAST_MODIFIED_BY`),
  CONSTRAINT `fk_rln_project` FOREIGN KEY (`PROJECT_ID`) REFERENCES `PROJECT` (`PROJECT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIREMENT_LIBRARY_NODE`
--

LOCK TABLES `REQUIREMENT_LIBRARY_NODE` WRITE;
/*!40000 ALTER TABLE `REQUIREMENT_LIBRARY_NODE` DISABLE KEYS */;
INSERT INTO `REQUIREMENT_LIBRARY_NODE` VALUES (1,'admin','2025-04-28 14:35:49',NULL,NULL,1),(2,'admin','2025-04-28 14:36:03',NULL,NULL,1),(3,'admin','2025-04-28 14:36:14',NULL,NULL,1),(4,'admin','2025-04-28 14:39:23','admin','2025-04-28 14:39:23',1);
/*!40000 ALTER TABLE `REQUIREMENT_LIBRARY_NODE` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`squashuser`@`%`*/ /*!50003 trigger ins_rln_after after insert on
			REQUIREMENT_LIBRARY_NODE
			for each row insert ignore into
			RLN_RELATIONSHIP_CLOSURE values (new.rln_id, new.rln_id, 0) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`squashuser`@`%`*/ /*!50003 trigger del_rln_before before delete on
			REQUIREMENT_LIBRARY_NODE
			for each row delete from
			RLN_RELATIONSHIP_CLOSURE where ancestor_id=old.rln_id and
			descendant_id=old.rln_id */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `REQUIREMENT_PROPERTY_CHANGE`
--

DROP TABLE IF EXISTS `REQUIREMENT_PROPERTY_CHANGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIREMENT_PROPERTY_CHANGE` (
  `EVENT_ID` bigint(20) NOT NULL COMMENT 'primary key, which is also a foreign key to REQUIREMENT_AUDIT_EVENT (they share that key : do not make this table autoincrement it).',
  `OLD_VALUE` varchar(255) DEFAULT NULL,
  `NEW_VALUE` varchar(255) DEFAULT NULL,
  `PROPERTY_NAME` varchar(100) NOT NULL,
  PRIMARY KEY (`EVENT_ID`),
  CONSTRAINT `fk_PPT_change_audit` FOREIGN KEY (`EVENT_ID`) REFERENCES `REQUIREMENT_AUDIT_EVENT` (`EVENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIREMENT_PROPERTY_CHANGE`
--

LOCK TABLES `REQUIREMENT_PROPERTY_CHANGE` WRITE;
/*!40000 ALTER TABLE `REQUIREMENT_PROPERTY_CHANGE` DISABLE KEYS */;
/*!40000 ALTER TABLE `REQUIREMENT_PROPERTY_CHANGE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIREMENT_SYNC_EXTENDER`
--

DROP TABLE IF EXISTS `REQUIREMENT_SYNC_EXTENDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIREMENT_SYNC_EXTENDER` (
  `REQ_SYNC_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'autogenerated key',
  `REQUIREMENT_ID` bigint(20) NOT NULL COMMENT 'foreign key to the (now synchronized) requirement',
  `SERVER_ID` bigint(20) DEFAULT NULL,
  `REMOTE_REQ_ID` varchar(50) DEFAULT NULL,
  `REMOTE_PROJECT_ID` varchar(100) DEFAULT NULL,
  `REMOTE_REQ_URL` varchar(300) DEFAULT NULL COMMENT 'the url of the remote requirement',
  `LAST_SYNCHRONIZED_BY` varchar(100) DEFAULT NULL,
  `REMOTE_FILTER_NAME` varchar(150) DEFAULT NULL,
  `REMOTE_SYNCHRONISATION_ID` bigint(20) DEFAULT NULL,
  `REMOTE_LAST_UPDATED` datetime DEFAULT NULL,
  `REMOTE_PARENT_ID` varchar(30) DEFAULT NULL,
  `REMOTE_REQ_PERIMETER_STATUS` varchar(30) NOT NULL DEFAULT 'UNKNOWN',
  PRIMARY KEY (`REQ_SYNC_ID`),
  KEY `fk_sync_extender_server` (`SERVER_ID`),
  KEY `fk_sync_extender_requirement` (`REQUIREMENT_ID`),
  KEY `idx_sync_remote_req_id` (`REMOTE_REQ_ID`),
  KEY `idx_sync_remote_projfilter` (`REMOTE_PROJECT_ID`,`REMOTE_FILTER_NAME`),
  KEY `fk_req_sync_extender__remote_sync_remote_sync_id` (`REMOTE_SYNCHRONISATION_ID`),
  KEY `req_sync_extender_remote_parent_id_idx` (`REMOTE_PARENT_ID`),
  CONSTRAINT `fk_req_sync_extender__remote_sync_remote_sync_id` FOREIGN KEY (`REMOTE_SYNCHRONISATION_ID`) REFERENCES `REMOTE_SYNCHRONISATION` (`REMOTE_SYNCHRONISATION_ID`),
  CONSTRAINT `fk_sync_extender_requirement` FOREIGN KEY (`REQUIREMENT_ID`) REFERENCES `REQUIREMENT` (`RLN_ID`) ON DELETE CASCADE,
  CONSTRAINT `fk_sync_extender_server` FOREIGN KEY (`SERVER_ID`) REFERENCES `BUGTRACKER` (`BUGTRACKER_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIREMENT_SYNC_EXTENDER`
--

LOCK TABLES `REQUIREMENT_SYNC_EXTENDER` WRITE;
/*!40000 ALTER TABLE `REQUIREMENT_SYNC_EXTENDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `REQUIREMENT_SYNC_EXTENDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIREMENT_VERSION`
--

DROP TABLE IF EXISTS `REQUIREMENT_VERSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIREMENT_VERSION` (
  `RES_ID` bigint(20) NOT NULL COMMENT 'shared key with RESOURCE table',
  `REQUIREMENT_ID` bigint(20) DEFAULT NULL COMMENT 'FK to the requirement. Should not be null but is nullable because of cyclic association REQ - REQ_VER',
  `REFERENCE` varchar(50) NOT NULL DEFAULT '',
  `VERSION_NUMBER` int(11) DEFAULT 1 COMMENT 'This requirement''s version number',
  `CRITICALITY` varchar(50) NOT NULL DEFAULT 'UNDEFINED' COMMENT 'Requirement criticality. Althought this field is a variable character, the data will be the text representation of an enumeration',
  `REQUIREMENT_STATUS` varchar(50) NOT NULL DEFAULT 'WORK_IN_PROGRESS',
  `CATEGORY` bigint(20) NOT NULL DEFAULT 1 COMMENT 'foreign key to the info list item',
  PRIMARY KEY (`RES_ID`),
  UNIQUE KEY `cu_version_of_requirement` (`REQUIREMENT_ID`,`VERSION_NUMBER`),
  KEY `fk_req_nature` (`CATEGORY`),
  KEY `idx_req_reference` (`REFERENCE`),
  KEY `idx_req_status` (`REQUIREMENT_STATUS`),
  KEY `idx_req_criticality` (`CRITICALITY`),
  CONSTRAINT `fk_req_nature` FOREIGN KEY (`CATEGORY`) REFERENCES `INFO_LIST_ITEM` (`ITEM_ID`),
  CONSTRAINT `fk_req_version_resource` FOREIGN KEY (`RES_ID`) REFERENCES `RESOURCE` (`RES_ID`),
  CONSTRAINT `fk_requirement_version_requirement` FOREIGN KEY (`REQUIREMENT_ID`) REFERENCES `REQUIREMENT` (`RLN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIREMENT_VERSION`
--

LOCK TABLES `REQUIREMENT_VERSION` WRITE;
/*!40000 ALTER TABLE `REQUIREMENT_VERSION` DISABLE KEYS */;
INSERT INTO `REQUIREMENT_VERSION` VALUES (4,4,'',1,'MINOR','WORK_IN_PROGRESS',6);
/*!40000 ALTER TABLE `REQUIREMENT_VERSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIREMENT_VERSION_COVERAGE`
--

DROP TABLE IF EXISTS `REQUIREMENT_VERSION_COVERAGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIREMENT_VERSION_COVERAGE` (
  `REQUIREMENT_VERSION_COVERAGE_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'generated surrogate key',
  `VERIFIED_REQ_VERSION_ID` bigint(20) DEFAULT NULL,
  `VERIFYING_TEST_CASE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`REQUIREMENT_VERSION_COVERAGE_ID`),
  UNIQUE KEY `uc_tc_verifies_req_version` (`VERIFIED_REQ_VERSION_ID`,`VERIFYING_TEST_CASE_ID`),
  KEY `fk_verifying_test_case` (`VERIFYING_TEST_CASE_ID`),
  CONSTRAINT `fk_verified_req_version` FOREIGN KEY (`VERIFIED_REQ_VERSION_ID`) REFERENCES `REQUIREMENT_VERSION` (`RES_ID`),
  CONSTRAINT `fk_verifying_test_case` FOREIGN KEY (`VERIFYING_TEST_CASE_ID`) REFERENCES `TEST_CASE` (`TCLN_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIREMENT_VERSION_COVERAGE`
--

LOCK TABLES `REQUIREMENT_VERSION_COVERAGE` WRITE;
/*!40000 ALTER TABLE `REQUIREMENT_VERSION_COVERAGE` DISABLE KEYS */;
INSERT INTO `REQUIREMENT_VERSION_COVERAGE` VALUES (1,4,1);
/*!40000 ALTER TABLE `REQUIREMENT_VERSION_COVERAGE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIREMENT_VERSION_LINK`
--

DROP TABLE IF EXISTS `REQUIREMENT_VERSION_LINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIREMENT_VERSION_LINK` (
  `LINK_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `LINK_TYPE_ID` bigint(20) NOT NULL COMMENT 'foreign key to the requirement_version_link_type table',
  `LINK_DIRECTION` bit(1) NOT NULL DEFAULT b'0',
  `REQUIREMENT_VERSION_ID` bigint(20) NOT NULL COMMENT 'foreign key for requirement version to requirement_version table',
  `RELATED_REQUIREMENT_VERSION_ID` bigint(20) NOT NULL COMMENT 'foreign key for related requirement version to requirement_version table',
  PRIMARY KEY (`LINK_ID`),
  KEY `fk_req_version_link_req_version_link_type_link_type_id` (`LINK_TYPE_ID`),
  KEY `fk_requirement_version_link_related_requirement_version_id` (`RELATED_REQUIREMENT_VERSION_ID`),
  KEY `fk_requirement_version_link_requirement_version_id` (`REQUIREMENT_VERSION_ID`),
  CONSTRAINT `fk_req_version_link_req_version_link_type_link_type_id` FOREIGN KEY (`LINK_TYPE_ID`) REFERENCES `REQUIREMENT_VERSION_LINK_TYPE` (`TYPE_ID`),
  CONSTRAINT `fk_requirement_version_link_related_requirement_version_id` FOREIGN KEY (`RELATED_REQUIREMENT_VERSION_ID`) REFERENCES `REQUIREMENT_VERSION` (`RES_ID`),
  CONSTRAINT `fk_requirement_version_link_requirement_version_id` FOREIGN KEY (`REQUIREMENT_VERSION_ID`) REFERENCES `REQUIREMENT_VERSION` (`RES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIREMENT_VERSION_LINK`
--

LOCK TABLES `REQUIREMENT_VERSION_LINK` WRITE;
/*!40000 ALTER TABLE `REQUIREMENT_VERSION_LINK` DISABLE KEYS */;
/*!40000 ALTER TABLE `REQUIREMENT_VERSION_LINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIREMENT_VERSION_LINK_TYPE`
--

DROP TABLE IF EXISTS `REQUIREMENT_VERSION_LINK_TYPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIREMENT_VERSION_LINK_TYPE` (
  `TYPE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ROLE_1` varchar(50) DEFAULT NULL,
  `ROLE_1_CODE` varchar(30) DEFAULT NULL,
  `ROLE_2` varchar(50) DEFAULT NULL,
  `ROLE_2_CODE` varchar(30) DEFAULT NULL,
  `IS_DEFAULT` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Only one item per list should have it true ',
  PRIMARY KEY (`TYPE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIREMENT_VERSION_LINK_TYPE`
--

LOCK TABLES `REQUIREMENT_VERSION_LINK_TYPE` WRITE;
/*!40000 ALTER TABLE `REQUIREMENT_VERSION_LINK_TYPE` DISABLE KEYS */;
INSERT INTO `REQUIREMENT_VERSION_LINK_TYPE` VALUES (1,'requirement-version.link.type.related','RELATED','requirement-version.link.type.related','RELATED',''),(2,'requirement-version.link.type.parent','PARENT','requirement-version.link.type.child','CHILD','\0'),(3,'requirement-version.link.type.duplicate','DUPLICATE','requirement-version.link.type.duplicate','DUPLICATE','\0');
/*!40000 ALTER TABLE `REQUIREMENT_VERSION_LINK_TYPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE`
--

DROP TABLE IF EXISTS `RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE` (
  `RES_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'generated surrogate key',
  `NAME` varchar(255) NOT NULL COMMENT 'Resource''s name',
  `DESCRIPTION` longtext DEFAULT NULL,
  `CREATED_BY` varchar(100) NOT NULL,
  `CREATED_ON` datetime NOT NULL COMMENT 'When this requirement''s version was created',
  `LAST_MODIFIED_BY` varchar(100) DEFAULT NULL,
  `LAST_MODIFIED_ON` datetime DEFAULT NULL COMMENT 'When this requirement''s version was last modified',
  `ATTACHMENT_LIST_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`RES_ID`),
  KEY `fk_resource_attachment_list` (`ATTACHMENT_LIST_ID`),
  KEY `idx_resource_created_by` (`CREATED_BY`),
  KEY `idx_resource_last_modified_by` (`LAST_MODIFIED_BY`),
  KEY `idx_resource_name` (`NAME`),
  FULLTEXT KEY `resource_description_fulltext_idx` (`DESCRIPTION`),
  CONSTRAINT `fk_resource_attachment_list` FOREIGN KEY (`ATTACHMENT_LIST_ID`) REFERENCES `ATTACHMENT_LIST` (`ATTACHMENT_LIST_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE`
--

LOCK TABLES `RESOURCE` WRITE;
/*!40000 ALTER TABLE `RESOURCE` DISABLE KEYS */;
INSERT INTO `RESOURCE` VALUES (1,'Connexion','','admin','2025-04-28 14:35:49',NULL,NULL,15),(2,'Page Liste Société','','admin','2025-04-28 14:36:03',NULL,NULL,16),(3,'NavBar','','admin','2025-04-28 14:36:14',NULL,NULL,17),(4,'Connexion avec identifiants valides','','admin','2025-04-28 14:39:23','admin','2025-04-28 14:40:01',18);
/*!40000 ALTER TABLE `RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RLN_RELATIONSHIP`
--

DROP TABLE IF EXISTS `RLN_RELATIONSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `RLN_RELATIONSHIP` (
  `ANCESTOR_ID` bigint(20) NOT NULL COMMENT 'cle etrangere vers le repertoire parent (il s''agit necessairement d''un repertoire).',
  `DESCENDANT_ID` bigint(20) NOT NULL COMMENT 'cle etrangere vers l''element fils.',
  `CONTENT_ORDER` int(11) NOT NULL,
  UNIQUE KEY `DESCENDANT_ID` (`DESCENDANT_ID`),
  KEY `idx_rln_relationship_descendant` (`DESCENDANT_ID`),
  KEY `idx_rln_relationship_ancestor` (`ANCESTOR_ID`),
  CONSTRAINT `fk_rln_relationship_ancestor` FOREIGN KEY (`ANCESTOR_ID`) REFERENCES `REQUIREMENT_LIBRARY_NODE` (`RLN_ID`),
  CONSTRAINT `fk_rln_relationship_descendant` FOREIGN KEY (`DESCENDANT_ID`) REFERENCES `REQUIREMENT_LIBRARY_NODE` (`RLN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RLN_RELATIONSHIP`
--

LOCK TABLES `RLN_RELATIONSHIP` WRITE;
/*!40000 ALTER TABLE `RLN_RELATIONSHIP` DISABLE KEYS */;
INSERT INTO `RLN_RELATIONSHIP` VALUES (1,4,0);
/*!40000 ALTER TABLE `RLN_RELATIONSHIP` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`squashuser`@`%`*/ /*!50003 trigger attach_rln_after after insert on RLN_RELATIONSHIP
			for each row insert ignore into RLN_RELATIONSHIP_CLOSURE
			select
			c1.ancestor_id, c2.descendant_id, c1.depth+c2.depth+1
			from
			RLN_RELATIONSHIP_CLOSURE c1
			cross join RLN_RELATIONSHIP_CLOSURE c2
			where c1.descendant_id = new.ancestor_id
			and c2.ancestor_id =
			new.descendant_id */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`squashuser`@`%`*/ /*!50003 trigger detach_rln_before before delete on
			RLN_RELATIONSHIP
			for each row delete clos1
            from RLN_RELATIONSHIP_CLOSURE clos1

            join RLN_RELATIONSHIP_CLOSURE clos2
			on clos1.descendant_id=clos2.descendant_id

            left join RLN_RELATIONSHIP_CLOSURE clos3
			on clos3.ancestor_id = clos2.ancestor_id
			and clos3.descendant_id = clos1.ancestor_id

            where clos2.ancestor_id = old.descendant_id
			and clos3.ancestor_id is null */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `RLN_RELATIONSHIP_CLOSURE`
--

DROP TABLE IF EXISTS `RLN_RELATIONSHIP_CLOSURE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `RLN_RELATIONSHIP_CLOSURE` (
  `ANCESTOR_ID` bigint(20) NOT NULL COMMENT 'cle etrangere vers le noeud parent. La relation est parfois d''un noeud vers lui meme.',
  `DESCENDANT_ID` bigint(20) NOT NULL COMMENT 'cle etrangere vers l''element fils. La relation est parfois d''un noeud vers lui meme.',
  `DEPTH` smallint(6) NOT NULL COMMENT 'stores how deep is the descendant element nested in the subtree of the ancestor element',
  UNIQUE KEY `uniq_rln_clos` (`ANCESTOR_ID`,`DESCENDANT_ID`),
  KEY `idx_rln_relationship_clos_desc` (`DESCENDANT_ID`),
  KEY `idx_rln_relationship_clos_anc` (`ANCESTOR_ID`),
  CONSTRAINT `fk_rln_relationship_clos_anc` FOREIGN KEY (`ANCESTOR_ID`) REFERENCES `REQUIREMENT_LIBRARY_NODE` (`RLN_ID`),
  CONSTRAINT `fk_rln_relationship_clos_desc` FOREIGN KEY (`DESCENDANT_ID`) REFERENCES `REQUIREMENT_LIBRARY_NODE` (`RLN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RLN_RELATIONSHIP_CLOSURE`
--

LOCK TABLES `RLN_RELATIONSHIP_CLOSURE` WRITE;
/*!40000 ALTER TABLE `RLN_RELATIONSHIP_CLOSURE` DISABLE KEYS */;
INSERT INTO `RLN_RELATIONSHIP_CLOSURE` VALUES (1,1,0),(1,4,1),(2,2,0),(3,3,0),(4,4,0);
/*!40000 ALTER TABLE `RLN_RELATIONSHIP_CLOSURE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `RLN_RESOURCE`
--

DROP TABLE IF EXISTS `RLN_RESOURCE`;
/*!50001 DROP VIEW IF EXISTS `RLN_RESOURCE`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `RLN_RESOURCE` AS SELECT
 1 AS `rln_id`,
  1 AS `res_id` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `SCM_REPOSITORY`
--

DROP TABLE IF EXISTS `SCM_REPOSITORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCM_REPOSITORY` (
  `SCM_REPOSITORY_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'The auto-generated id of the scm repository.',
  `SERVER_ID` bigint(20) NOT NULL COMMENT 'The foreign key to the related SCM_SEVER',
  `NAME` varchar(255) NOT NULL COMMENT 'The name of the repository.',
  `WORKING_BRANCH` varchar(255) NOT NULL COMMENT 'The name of the working branch on which SquashTM will push.',
  `REPOSITORY_PATH` varchar(255) NOT NULL COMMENT 'The absolute path to the local repository on the local server.',
  `WORKING_FOLDER_PATH` varchar(255) DEFAULT NULL COMMENT 'The relative path of the working folder in which SquashTM will push.',
  PRIMARY KEY (`SCM_REPOSITORY_ID`),
  UNIQUE KEY `uniq_scm_repo_name_branch_server_id` (`NAME`,`WORKING_BRANCH`,`SERVER_ID`),
  KEY `idx_fk_scm_repository_scm_server` (`SERVER_ID`),
  CONSTRAINT `fk_scm_repository_scm_server` FOREIGN KEY (`SERVER_ID`) REFERENCES `SCM_SERVER` (`SERVER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCM_REPOSITORY`
--

LOCK TABLES `SCM_REPOSITORY` WRITE;
/*!40000 ALTER TABLE `SCM_REPOSITORY` DISABLE KEYS */;
/*!40000 ALTER TABLE `SCM_REPOSITORY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCM_SERVER`
--

DROP TABLE IF EXISTS `SCM_SERVER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCM_SERVER` (
  `SERVER_ID` bigint(20) NOT NULL COMMENT 'The id of the scm server.',
  `KIND` varchar(30) NOT NULL COMMENT 'The kind of scm server.',
  `COMMITTER_MAIL` varchar(255) NOT NULL DEFAULT '',
  `CREDENTIALS_NOT_SHARED` bit(1) NOT NULL DEFAULT b'0' COMMENT 'the credentials_not_shared prevent git credentials propagation',
  PRIMARY KEY (`SERVER_ID`),
  CONSTRAINT `fk_scm_server_third_party_server` FOREIGN KEY (`SERVER_ID`) REFERENCES `THIRD_PARTY_SERVER` (`SERVER_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCM_SERVER`
--

LOCK TABLES `SCM_SERVER` WRITE;
/*!40000 ALTER TABLE `SCM_SERVER` DISABLE KEYS */;
/*!40000 ALTER TABLE `SCM_SERVER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCRIPTED_EXECUTION`
--

DROP TABLE IF EXISTS `SCRIPTED_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCRIPTED_EXECUTION` (
  `SCRIPT_NAME` varchar(255) DEFAULT NULL COMMENT 'script name,by example feature name for Gherkin',
  `EXECUTION_ID` bigint(20) NOT NULL COMMENT 'foreign key to EXECUTION',
  PRIMARY KEY (`EXECUTION_ID`),
  KEY `scripted_execution_extender_execution_id_idx` (`EXECUTION_ID`),
  CONSTRAINT `fk_scripted_extender_execution` FOREIGN KEY (`EXECUTION_ID`) REFERENCES `EXECUTION` (`EXECUTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCRIPTED_EXECUTION`
--

LOCK TABLES `SCRIPTED_EXECUTION` WRITE;
/*!40000 ALTER TABLE `SCRIPTED_EXECUTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `SCRIPTED_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCRIPTED_TEST_CASE`
--

DROP TABLE IF EXISTS `SCRIPTED_TEST_CASE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCRIPTED_TEST_CASE` (
  `SCRIPT` longtext DEFAULT NULL COMMENT 'the test case script',
  `TCLN_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`TCLN_ID`),
  KEY `scripted_tc_extender_test_case_id_idx` (`TCLN_ID`),
  CONSTRAINT `fk_scripted_extender_test_case` FOREIGN KEY (`TCLN_ID`) REFERENCES `TEST_CASE` (`TCLN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCRIPTED_TEST_CASE`
--

LOCK TABLES `SCRIPTED_TEST_CASE` WRITE;
/*!40000 ALTER TABLE `SCRIPTED_TEST_CASE` DISABLE KEYS */;
/*!40000 ALTER TABLE `SCRIPTED_TEST_CASE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SESSION_NOTE`
--

DROP TABLE IF EXISTS `SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `SESSION_NOTE` (
  `NOTE_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'primary key for SESSION_NOTE',
  `EXECUTION_ID` bigint(20) NOT NULL COMMENT 'foreign key to EXECUTION',
  `KIND` varchar(30) NOT NULL DEFAULT 'COMMENT',
  `CONTENT` longtext NOT NULL DEFAULT '',
  `CREATED_BY` varchar(100) NOT NULL,
  `CREATED_ON` datetime NOT NULL,
  `LAST_MODIFIED_BY` varchar(100) DEFAULT NULL,
  `LAST_MODIFIED_ON` datetime DEFAULT NULL,
  `ATTACHMENT_LIST_ID` bigint(20) DEFAULT NULL COMMENT 'Foreign key to attachment list',
  `ISSUE_LIST_ID` bigint(20) DEFAULT NULL COMMENT 'Foreign key to issue list',
  `NOTE_ORDER` int(11) DEFAULT NULL COMMENT 'Order in the note list',
  PRIMARY KEY (`NOTE_ID`),
  KEY `idx_fk_session_note_execution` (`EXECUTION_ID`),
  KEY `idx_fk_session_note_issue_list_id` (`ISSUE_LIST_ID`),
  KEY `idx_session_note_created_by` (`CREATED_BY`),
  KEY `idx_session_note_last_modified_by` (`LAST_MODIFIED_BY`),
  KEY `idx_fk_session_note_attachment_list` (`ATTACHMENT_LIST_ID`),
  CONSTRAINT `fk_session_note_attachment_list` FOREIGN KEY (`ATTACHMENT_LIST_ID`) REFERENCES `ATTACHMENT_LIST` (`ATTACHMENT_LIST_ID`),
  CONSTRAINT `fk_session_note_execution` FOREIGN KEY (`EXECUTION_ID`) REFERENCES `EXECUTION` (`EXECUTION_ID`),
  CONSTRAINT `fk_session_note_issue_list` FOREIGN KEY (`ISSUE_LIST_ID`) REFERENCES `ISSUE_LIST` (`ISSUE_LIST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SESSION_NOTE`
--

LOCK TABLES `SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SIMPLE_RESOURCE`
--

DROP TABLE IF EXISTS `SIMPLE_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `SIMPLE_RESOURCE` (
  `RES_ID` bigint(20) NOT NULL COMMENT 'shared key with RESOURCE table',
  PRIMARY KEY (`RES_ID`),
  CONSTRAINT `fk_resource` FOREIGN KEY (`RES_ID`) REFERENCES `RESOURCE` (`RES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SIMPLE_RESOURCE`
--

LOCK TABLES `SIMPLE_RESOURCE` WRITE;
/*!40000 ALTER TABLE `SIMPLE_RESOURCE` DISABLE KEYS */;
INSERT INTO `SIMPLE_RESOURCE` VALUES (1),(2),(3);
/*!40000 ALTER TABLE `SIMPLE_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SPRINT`
--

DROP TABLE IF EXISTS `SPRINT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `SPRINT` (
  `CLN_ID` bigint(20) NOT NULL COMMENT 'Shared key with CAMPAIGN_LIBRARY_NODE table',
  `STATUS` varchar(50) NOT NULL DEFAULT 'UPCOMING',
  `REMOTE_SYNCHRONISATION_ID` bigint(20) DEFAULT NULL,
  `REMOTE_SPRINT_ID` bigint(20) DEFAULT NULL,
  `REMOTE_NAME` varchar(255) DEFAULT NULL,
  `REMOTE_STATE` varchar(50) DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `REFERENCE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CLN_ID`),
  KEY `idx_fk_sprint_remote_synchronisation` (`REMOTE_SYNCHRONISATION_ID`),
  CONSTRAINT `fk_sprint_campaign_library_node` FOREIGN KEY (`CLN_ID`) REFERENCES `CAMPAIGN_LIBRARY_NODE` (`CLN_ID`),
  CONSTRAINT `fk_sprint_remote_synchronisation` FOREIGN KEY (`REMOTE_SYNCHRONISATION_ID`) REFERENCES `REMOTE_SYNCHRONISATION` (`REMOTE_SYNCHRONISATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SPRINT`
--

LOCK TABLES `SPRINT` WRITE;
/*!40000 ALTER TABLE `SPRINT` DISABLE KEYS */;
/*!40000 ALTER TABLE `SPRINT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SPRINT_GROUP`
--

DROP TABLE IF EXISTS `SPRINT_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `SPRINT_GROUP` (
  `CLN_ID` bigint(20) NOT NULL COMMENT 'Shared key with CAMPAIGN_LIBRARY_NODE table',
  `REMOTE_SYNCHRONISATION_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`CLN_ID`),
  KEY `idx_fk_sprint_group_remote_synchronisation` (`REMOTE_SYNCHRONISATION_ID`),
  CONSTRAINT `fk_sprint_group_campaign_library_node` FOREIGN KEY (`CLN_ID`) REFERENCES `CAMPAIGN_LIBRARY_NODE` (`CLN_ID`),
  CONSTRAINT `fk_sprint_group_remote_synchronisation` FOREIGN KEY (`REMOTE_SYNCHRONISATION_ID`) REFERENCES `REMOTE_SYNCHRONISATION` (`REMOTE_SYNCHRONISATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SPRINT_GROUP`
--

LOCK TABLES `SPRINT_GROUP` WRITE;
/*!40000 ALTER TABLE `SPRINT_GROUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `SPRINT_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SPRINT_REQUIREMENT_SYNC_EXTENDER`
--

DROP TABLE IF EXISTS `SPRINT_REQUIREMENT_SYNC_EXTENDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `SPRINT_REQUIREMENT_SYNC_EXTENDER` (
  `SPRINT_REQ_SYNC_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'primary key for SPRINT_REQUIREMENT_SYNC_EXTENDER',
  `SPRINT_REQ_VERSION_ID` bigint(20) NOT NULL,
  `REMOTE_REQ_ID` varchar(50) DEFAULT NULL,
  `REMOTE_REQ_URL` varchar(300) DEFAULT NULL,
  `REMOTE_PROJECT_ID` varchar(100) DEFAULT NULL,
  `REMOTE_LAST_UPDATED` datetime DEFAULT NULL,
  `REMOTE_SYNCHRONISATION_ID` bigint(20) DEFAULT NULL,
  `REMOTE_PERIMETER_STATUS` varchar(30) NOT NULL DEFAULT 'UNKNOWN',
  `REMOTE_REQ_STATE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`SPRINT_REQ_SYNC_ID`),
  KEY `idx_fk_sprint_req_sync_ext_sprint_req_version_id` (`SPRINT_REQ_VERSION_ID`),
  KEY `idx_fk_sprint_req_sync_ext_remote_sync_id` (`REMOTE_SYNCHRONISATION_ID`),
  CONSTRAINT `fk_sprint_req_sync_ext_remote_sync_id` FOREIGN KEY (`REMOTE_SYNCHRONISATION_ID`) REFERENCES `REMOTE_SYNCHRONISATION` (`REMOTE_SYNCHRONISATION_ID`),
  CONSTRAINT `fk_sprint_req_sync_ext_sprint_req_version_id` FOREIGN KEY (`SPRINT_REQ_VERSION_ID`) REFERENCES `SPRINT_REQ_VERSION` (`SPRINT_REQ_VERSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SPRINT_REQUIREMENT_SYNC_EXTENDER`
--

LOCK TABLES `SPRINT_REQUIREMENT_SYNC_EXTENDER` WRITE;
/*!40000 ALTER TABLE `SPRINT_REQUIREMENT_SYNC_EXTENDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `SPRINT_REQUIREMENT_SYNC_EXTENDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SPRINT_REQ_VERSION`
--

DROP TABLE IF EXISTS `SPRINT_REQ_VERSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `SPRINT_REQ_VERSION` (
  `SPRINT_REQ_VERSION_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'primary key for SPRINT_REQ_VERSION',
  `REQ_VERSION_ID` bigint(20) DEFAULT NULL,
  `SPRINT_ID` bigint(20) NOT NULL,
  `REFERENCE` varchar(50) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `STATUS` varchar(50) DEFAULT NULL,
  `CRITICALITY` varchar(50) DEFAULT NULL,
  `CATEGORY` varchar(50) DEFAULT NULL,
  `DESCRIPTION` longtext DEFAULT NULL,
  `MODE` varchar(15) DEFAULT 'NATIVE' COMMENT 'Says whether a sprint req version is NATIVE or SYNCHRONIZED',
  `TEST_PLAN_ID` bigint(20) NOT NULL,
  `CREATED_BY` varchar(100) NOT NULL,
  `CREATED_ON` datetime NOT NULL,
  `LAST_MODIFIED_BY` varchar(100) DEFAULT NULL,
  `LAST_MODIFIED_ON` datetime DEFAULT NULL,
  `VALIDATION_STATUS` varchar(50) NOT NULL DEFAULT 'TO_BE_TESTED',
  PRIMARY KEY (`SPRINT_REQ_VERSION_ID`),
  KEY `idx_fk_sprint_req_version_req_version_id` (`REQ_VERSION_ID`),
  KEY `idx_fk_sprint_req_version_sprint_id` (`SPRINT_ID`),
  KEY `idx_fk_sprint_req_version_test_plan` (`TEST_PLAN_ID`),
  CONSTRAINT `fk_sprint_req_version_req_version_id` FOREIGN KEY (`REQ_VERSION_ID`) REFERENCES `REQUIREMENT_VERSION` (`RES_ID`),
  CONSTRAINT `fk_sprint_req_version_sprint_id` FOREIGN KEY (`SPRINT_ID`) REFERENCES `SPRINT` (`CLN_ID`),
  CONSTRAINT `fk_sprint_req_version_test_plan` FOREIGN KEY (`TEST_PLAN_ID`) REFERENCES `TEST_PLAN` (`TEST_PLAN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SPRINT_REQ_VERSION`
--

LOCK TABLES `SPRINT_REQ_VERSION` WRITE;
/*!40000 ALTER TABLE `SPRINT_REQ_VERSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `SPRINT_REQ_VERSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STORED_CREDENTIALS`
--

DROP TABLE IF EXISTS `STORED_CREDENTIALS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `STORED_CREDENTIALS` (
  `CREDENTIAL_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `ENC_VERSION` smallint(6) DEFAULT NULL COMMENT 'the version of encryption service used. Possibly the value will remain to 1 forever.',
  `ENC_CREDENTIALS` text DEFAULT NULL COMMENT 'the credentials as an encrypted string',
  `AUTHENTICATED_SERVER` bigint(20) DEFAULT NULL COMMENT 'foreign key to the server to authenticate',
  `CONTENT_TYPE` varchar(4) DEFAULT 'CRED' COMMENT 'the role of the content, either CRED or CONF',
  `AUTHENTICATED_USER` bigint(20) DEFAULT NULL COMMENT 'Foreign key to the user account that owns the credentials. A NULL value means that Squash-TM               owns the credentials (app-level credentials).',
  `PROJECT_ID` bigint(20) DEFAULT NULL COMMENT 'Foreign key to the project bound to these credentials. NULL for app-level and user-level credentials.',
  `REPORTING_CACHE_CREDENTIALS` bit(1) DEFAULT b'0',
  PRIMARY KEY (`CREDENTIAL_ID`),
  UNIQUE KEY `uniq_stored_credentials_server_user` (`AUTHENTICATED_SERVER`,`AUTHENTICATED_USER`,`CONTENT_TYPE`),
  KEY `fk_stored_credentials_user` (`AUTHENTICATED_USER`),
  KEY `idx_fk_stored_credentials_authenticated_server` (`AUTHENTICATED_SERVER`),
  KEY `fk_stored_credentials_project` (`PROJECT_ID`),
  CONSTRAINT `fk_stored_credentials_authenticated_server` FOREIGN KEY (`AUTHENTICATED_SERVER`) REFERENCES `THIRD_PARTY_SERVER` (`SERVER_ID`) ON DELETE CASCADE,
  CONSTRAINT `fk_stored_credentials_project` FOREIGN KEY (`PROJECT_ID`) REFERENCES `PROJECT` (`PROJECT_ID`),
  CONSTRAINT `fk_stored_credentials_user` FOREIGN KEY (`AUTHENTICATED_USER`) REFERENCES `CORE_USER` (`PARTY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STORED_CREDENTIALS`
--

LOCK TABLES `STORED_CREDENTIALS` WRITE;
/*!40000 ALTER TABLE `STORED_CREDENTIALS` DISABLE KEYS */;
/*!40000 ALTER TABLE `STORED_CREDENTIALS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SYNC_REQUIREMENT_CREATION`
--

DROP TABLE IF EXISTS `SYNC_REQUIREMENT_CREATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `SYNC_REQUIREMENT_CREATION` (
  `EVENT_ID` bigint(20) NOT NULL COMMENT 'primary key, which is also a foreign key to REQUIREMENT_AUDIT_EVENT (they share that key : do not make this table autoincrement it).',
  `SOURCE` varchar(255) NOT NULL COMMENT 'the url of the synchronized requirement at the time of creation',
  PRIMARY KEY (`EVENT_ID`),
  CONSTRAINT `fk_sync_create_audit` FOREIGN KEY (`EVENT_ID`) REFERENCES `REQUIREMENT_AUDIT_EVENT` (`EVENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SYNC_REQUIREMENT_CREATION`
--

LOCK TABLES `SYNC_REQUIREMENT_CREATION` WRITE;
/*!40000 ALTER TABLE `SYNC_REQUIREMENT_CREATION` DISABLE KEYS */;
/*!40000 ALTER TABLE `SYNC_REQUIREMENT_CREATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SYNC_REQUIREMENT_UPDATE`
--

DROP TABLE IF EXISTS `SYNC_REQUIREMENT_UPDATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `SYNC_REQUIREMENT_UPDATE` (
  `EVENT_ID` bigint(20) NOT NULL COMMENT 'primary key, which is also a foreign key to REQUIREMENT_AUDIT_EVENT (they share that key : do not make this table autoincrement it).',
  `SOURCE` varchar(255) NOT NULL COMMENT 'the url of the synchronized requirement at the time of update',
  PRIMARY KEY (`EVENT_ID`),
  CONSTRAINT `fk_sync_update_audit` FOREIGN KEY (`EVENT_ID`) REFERENCES `REQUIREMENT_AUDIT_EVENT` (`EVENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SYNC_REQUIREMENT_UPDATE`
--

LOCK TABLES `SYNC_REQUIREMENT_UPDATE` WRITE;
/*!40000 ALTER TABLE `SYNC_REQUIREMENT_UPDATE` DISABLE KEYS */;
/*!40000 ALTER TABLE `SYNC_REQUIREMENT_UPDATE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TCLN_RELATIONSHIP`
--

DROP TABLE IF EXISTS `TCLN_RELATIONSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `TCLN_RELATIONSHIP` (
  `ANCESTOR_ID` bigint(20) NOT NULL COMMENT 'cle etrangere vers le repertoire parent (il s''agit necessairement d''un repertoire).',
  `DESCENDANT_ID` bigint(20) NOT NULL COMMENT 'cle etrangere vers l''element fils. ',
  `CONTENT_ORDER` int(11) NOT NULL,
  UNIQUE KEY `DESCENDANT_ID` (`DESCENDANT_ID`),
  KEY `idx_tcln_relationship_descendant` (`DESCENDANT_ID`),
  KEY `idx_tcln_relationship_ancestor` (`ANCESTOR_ID`),
  CONSTRAINT `fk_tcln_relationship_ancestor` FOREIGN KEY (`ANCESTOR_ID`) REFERENCES `TEST_CASE_FOLDER` (`TCLN_ID`),
  CONSTRAINT `fk_tcln_relationship_descendant` FOREIGN KEY (`DESCENDANT_ID`) REFERENCES `TEST_CASE_LIBRARY_NODE` (`TCLN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TCLN_RELATIONSHIP`
--

LOCK TABLES `TCLN_RELATIONSHIP` WRITE;
/*!40000 ALTER TABLE `TCLN_RELATIONSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `TCLN_RELATIONSHIP` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`squashuser`@`%`*/ /*!50003 trigger attach_tcln_after after insert on
			TCLN_RELATIONSHIP
			for each row insert ignore into TCLN_RELATIONSHIP_CLOSURE
			select c1.ancestor_id, c2.descendant_id, c1.depth+c2.depth+1
			from
			TCLN_RELATIONSHIP_CLOSURE c1
			cross join TCLN_RELATIONSHIP_CLOSURE c2
			where c1.descendant_id = new.ancestor_id
			and c2.ancestor_id =
			new.descendant_id */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`squashuser`@`%`*/ /*!50003 trigger detach_tcln_before before delete on
			TCLN_RELATIONSHIP
			for each row delete clos1 from
			TCLN_RELATIONSHIP_CLOSURE clos1
			join TCLN_RELATIONSHIP_CLOSURE clos2
			on clos1.descendant_id=clos2.descendant_id
			left join
			TCLN_RELATIONSHIP_CLOSURE clos3
			on clos3.ancestor_id =
			clos2.ancestor_id
			and clos3.descendant_id = clos1.ancestor_id
			where
			clos2.ancestor_id = old.descendant_id
			and clos3.ancestor_id is null */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `TCLN_RELATIONSHIP_CLOSURE`
--

DROP TABLE IF EXISTS `TCLN_RELATIONSHIP_CLOSURE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `TCLN_RELATIONSHIP_CLOSURE` (
  `ANCESTOR_ID` bigint(20) NOT NULL COMMENT 'cle etrangere vers le noeud parent. La relation est parfois d''un noeud vers lui meme.',
  `DESCENDANT_ID` bigint(20) NOT NULL COMMENT 'cle etrangere vers l''element fils. La relation est parfois d''un noeud vers lui meme.',
  `DEPTH` smallint(6) NOT NULL COMMENT 'stores how deep is the descendant element nested in the subtree of the ancestor element',
  UNIQUE KEY `uniq_tcln_clos` (`ANCESTOR_ID`,`DESCENDANT_ID`),
  KEY `idx_tcln_relationship_clos_desc` (`DESCENDANT_ID`),
  KEY `idx_tcln_relationship_clos_anc` (`ANCESTOR_ID`),
  CONSTRAINT `fk_tcln_relationship_clos_anc` FOREIGN KEY (`ANCESTOR_ID`) REFERENCES `TEST_CASE_LIBRARY_NODE` (`TCLN_ID`),
  CONSTRAINT `fk_tcln_relationship_clos_desc` FOREIGN KEY (`DESCENDANT_ID`) REFERENCES `TEST_CASE_LIBRARY_NODE` (`TCLN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TCLN_RELATIONSHIP_CLOSURE`
--

LOCK TABLES `TCLN_RELATIONSHIP_CLOSURE` WRITE;
/*!40000 ALTER TABLE `TCLN_RELATIONSHIP_CLOSURE` DISABLE KEYS */;
INSERT INTO `TCLN_RELATIONSHIP_CLOSURE` VALUES (1,1,0);
/*!40000 ALTER TABLE `TCLN_RELATIONSHIP_CLOSURE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TEMPLATE_CONFIGURABLE_PLUGIN_BINDING`
--

DROP TABLE IF EXISTS `TEMPLATE_CONFIGURABLE_PLUGIN_BINDING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `TEMPLATE_CONFIGURABLE_PLUGIN_BINDING` (
  `BINDING_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PROJECT_TEMPLATE_ID` bigint(20) NOT NULL,
  `PROJECT_ID` bigint(20) NOT NULL,
  `PLUGIN_ID` varchar(50) NOT NULL,
  PRIMARY KEY (`BINDING_ID`),
  KEY `fk_template_configurable_plugin_binding__template__project_id` (`PROJECT_TEMPLATE_ID`),
  KEY `fk_template_configurable_plugin_binding__project__project_id` (`PROJECT_ID`),
  CONSTRAINT `fk_template_configurable_plugin_binding__project__project_id` FOREIGN KEY (`PROJECT_ID`) REFERENCES `PROJECT` (`PROJECT_ID`),
  CONSTRAINT `fk_template_configurable_plugin_binding__template__project_id` FOREIGN KEY (`PROJECT_TEMPLATE_ID`) REFERENCES `PROJECT` (`PROJECT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TEMPLATE_CONFIGURABLE_PLUGIN_BINDING`
--

LOCK TABLES `TEMPLATE_CONFIGURABLE_PLUGIN_BINDING` WRITE;
/*!40000 ALTER TABLE `TEMPLATE_CONFIGURABLE_PLUGIN_BINDING` DISABLE KEYS */;
/*!40000 ALTER TABLE `TEMPLATE_CONFIGURABLE_PLUGIN_BINDING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TEST_AUTOMATION_PROJECT`
--

DROP TABLE IF EXISTS `TEST_AUTOMATION_PROJECT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `TEST_AUTOMATION_PROJECT` (
  `TA_PROJECT_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'the primary key',
  `TM_PROJECT_ID` bigint(20) NOT NULL COMMENT 'the reference to the TM project',
  `LABEL` varchar(50) NOT NULL COMMENT 'the (friendly) alias for that TA project ',
  `REMOTE_NAME` varchar(50) NOT NULL COMMENT 'the (real) name of the remote test automation project',
  `SERVER_ID` bigint(20) NOT NULL COMMENT 'foreign key to the automated test server',
  `EXECUTION_ENVIRONMENTS` varchar(255) NOT NULL DEFAULT '' COMMENT 'the list of approved slaves servers',
  `CAN_RUN_GHERKIN` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`TA_PROJECT_ID`),
  UNIQUE KEY `uniq_tm_ta_project_job` (`TM_PROJECT_ID`,`REMOTE_NAME`,`SERVER_ID`),
  UNIQUE KEY `uniq_tm_ta_project_label` (`TM_PROJECT_ID`,`LABEL`),
  KEY `fk_ta_project_ta_server` (`SERVER_ID`),
  CONSTRAINT `fk_ta_project_ta_server` FOREIGN KEY (`SERVER_ID`) REFERENCES `TEST_AUTOMATION_SERVER` (`SERVER_ID`),
  CONSTRAINT `fk_ta_project_tm_project` FOREIGN KEY (`TM_PROJECT_ID`) REFERENCES `PROJECT` (`PROJECT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TEST_AUTOMATION_PROJECT`
--

LOCK TABLES `TEST_AUTOMATION_PROJECT` WRITE;
/*!40000 ALTER TABLE `TEST_AUTOMATION_PROJECT` DISABLE KEYS */;
/*!40000 ALTER TABLE `TEST_AUTOMATION_PROJECT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TEST_AUTOMATION_SERVER`
--

DROP TABLE IF EXISTS `TEST_AUTOMATION_SERVER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `TEST_AUTOMATION_SERVER` (
  `SERVER_ID` bigint(20) NOT NULL,
  `KIND` varchar(30) NOT NULL DEFAULT 'jenkins' COMMENT 'the kind of automated test server TM will deal with.',
  `MANUAL_SLAVE_SELECTION` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Should the user select which slave will run the tests (if there are some) ?',
  `OBSERVER_URL` varchar(255) DEFAULT NULL,
  `EVENT_BUS_URL` varchar(255) DEFAULT NULL,
  `ADDITIONAL_CONFIGURATION` longtext DEFAULT NULL,
  `KILLSWITCH_URL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SERVER_ID`),
  KEY `idx_autotest_server` (`SERVER_ID`),
  CONSTRAINT `fk_test_automation_server_third_party_server` FOREIGN KEY (`SERVER_ID`) REFERENCES `THIRD_PARTY_SERVER` (`SERVER_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TEST_AUTOMATION_SERVER`
--

LOCK TABLES `TEST_AUTOMATION_SERVER` WRITE;
/*!40000 ALTER TABLE `TEST_AUTOMATION_SERVER` DISABLE KEYS */;
/*!40000 ALTER TABLE `TEST_AUTOMATION_SERVER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TEST_CASE`
--

DROP TABLE IF EXISTS `TEST_CASE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `TEST_CASE` (
  `TCLN_ID` bigint(20) NOT NULL COMMENT 'cle primaire, qui est aussi une cle etrangere vers la table TEST_CASE_LIBRARY_NODE. Ne doit donc pas etre autogeneree.',
  `EXECUTION_MODE` varchar(255) DEFAULT NULL COMMENT 'Mode d''execution du test case. Bien que ce champs soit caractere variable, les donnees reelles seront la representation texte d''un type enumere.',
  `IMPORTANCE` varchar(20) NOT NULL DEFAULT 'LOW' COMMENT 'The importance of the test case',
  `IMPORTANCE_AUTO` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Should the importance be automatically computed',
  `PREREQUISITE` longtext NOT NULL,
  `REFERENCE` varchar(50) NOT NULL DEFAULT '',
  `TA_TEST` bigint(20) DEFAULT NULL,
  `TC_STATUS` varchar(30) NOT NULL DEFAULT 'WORK_IN_PROGRESS',
  `TC_NATURE` bigint(20) NOT NULL DEFAULT 12 COMMENT 'foreign key to the info list item',
  `TC_TYPE` bigint(20) NOT NULL DEFAULT 20 COMMENT 'foreign key to the info list item',
  `AUTOMATABLE` char(1) DEFAULT 'M' COMMENT 'Y: Yes, N: No, M: Maybe',
  `UUID` varchar(36) NOT NULL,
  `AUTOMATED_TEST_REFERENCE` varchar(512) DEFAULT NULL,
  `AUTOMATED_TEST_TECHNOLOGY` bigint(20) DEFAULT NULL COMMENT 'foreign key to AUTOMATED_TEST_TECHNOLOGY',
  `SCM_REPOSITORY_ID` bigint(20) DEFAULT NULL COMMENT 'foreign key to SCM_REPOSITORY, link to associated scm repository.',
  `DRAFTED_BY_AI` bit(1) DEFAULT b'0' COMMENT 'is the test case drafted by artificial intelligence',
  `AUTOMATION_REQUEST_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`TCLN_ID`),
  UNIQUE KEY `uc_test_case_uuid` (`UUID`),
  KEY `idx_test_case` (`TCLN_ID`),
  KEY `fk_test_case_ta_test` (`TA_TEST`),
  KEY `fk_tc_nature` (`TC_NATURE`),
  KEY `fk_tc_type` (`TC_TYPE`),
  KEY `idx_tc_reference` (`REFERENCE`),
  KEY `idx_tc_importance` (`IMPORTANCE`),
  KEY `fk_test_case_automated_test_technology` (`AUTOMATED_TEST_TECHNOLOGY`),
  KEY `idx_fk_tc_scm_repository` (`SCM_REPOSITORY_ID`),
  KEY `idx_test_case_automation_request_id` (`AUTOMATION_REQUEST_ID`),
  FULLTEXT KEY `tc_prerequisite_fulltext_idx` (`PREREQUISITE`),
  CONSTRAINT `fk_tc_nature` FOREIGN KEY (`TC_NATURE`) REFERENCES `INFO_LIST_ITEM` (`ITEM_ID`),
  CONSTRAINT `fk_tc_scm_repository` FOREIGN KEY (`SCM_REPOSITORY_ID`) REFERENCES `SCM_REPOSITORY` (`SCM_REPOSITORY_ID`),
  CONSTRAINT `fk_tc_type` FOREIGN KEY (`TC_TYPE`) REFERENCES `INFO_LIST_ITEM` (`ITEM_ID`),
  CONSTRAINT `fk_test_case_automated_test_technology` FOREIGN KEY (`AUTOMATED_TEST_TECHNOLOGY`) REFERENCES `AUTOMATED_TEST_TECHNOLOGY` (`AT_TECHNOLOGY_ID`),
  CONSTRAINT `fk_test_case_automation_request_id` FOREIGN KEY (`AUTOMATION_REQUEST_ID`) REFERENCES `AUTOMATION_REQUEST` (`AUTOMATION_REQUEST_ID`),
  CONSTRAINT `fk_test_case_ta_test` FOREIGN KEY (`TA_TEST`) REFERENCES `AUTOMATED_TEST` (`TEST_ID`),
  CONSTRAINT `fk_test_case_test_case_node` FOREIGN KEY (`TCLN_ID`) REFERENCES `TEST_CASE_LIBRARY_NODE` (`TCLN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TEST_CASE`
--

LOCK TABLES `TEST_CASE` WRITE;
/*!40000 ALTER TABLE `TEST_CASE` DISABLE KEYS */;
INSERT INTO `TEST_CASE` VALUES (1,'MANUAL','LOW','\0','','',NULL,'WORK_IN_PROGRESS',12,20,'M','de3557b7-d0f3-451e-94f3-178eb8de6b11',NULL,NULL,NULL,'\0',NULL);
/*!40000 ALTER TABLE `TEST_CASE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TEST_CASE_FOLDER`
--

DROP TABLE IF EXISTS `TEST_CASE_FOLDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `TEST_CASE_FOLDER` (
  `TCLN_ID` bigint(20) NOT NULL COMMENT 'cle primaire, qui est une cle etrangere vers la table CAMPAIGN_LIBRARY_NODE. Ne doit donc pas etre autogeneree.',
  PRIMARY KEY (`TCLN_ID`),
  KEY `idx_tc_folder` (`TCLN_ID`),
  CONSTRAINT `fk_folder_test_case_node` FOREIGN KEY (`TCLN_ID`) REFERENCES `TEST_CASE_LIBRARY_NODE` (`TCLN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TEST_CASE_FOLDER`
--

LOCK TABLES `TEST_CASE_FOLDER` WRITE;
/*!40000 ALTER TABLE `TEST_CASE_FOLDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `TEST_CASE_FOLDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TEST_CASE_LIBRARY`
--

DROP TABLE IF EXISTS `TEST_CASE_LIBRARY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `TEST_CASE_LIBRARY` (
  `TCL_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'cle primaire autogeneree',
  `ATTACHMENT_LIST_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`TCL_ID`),
  KEY `idx_test_case_library` (`TCL_ID`),
  KEY `fk_tcLib_attachment_list` (`ATTACHMENT_LIST_ID`),
  CONSTRAINT `fk_tcLib_attachment_list` FOREIGN KEY (`ATTACHMENT_LIST_ID`) REFERENCES `ATTACHMENT_LIST` (`ATTACHMENT_LIST_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TEST_CASE_LIBRARY`
--

LOCK TABLES `TEST_CASE_LIBRARY` WRITE;
/*!40000 ALTER TABLE `TEST_CASE_LIBRARY` DISABLE KEYS */;
INSERT INTO `TEST_CASE_LIBRARY` VALUES (1,3),(2,10);
/*!40000 ALTER TABLE `TEST_CASE_LIBRARY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TEST_CASE_LIBRARY_CONTENT`
--

DROP TABLE IF EXISTS `TEST_CASE_LIBRARY_CONTENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `TEST_CASE_LIBRARY_CONTENT` (
  `LIBRARY_ID` bigint(20) NOT NULL COMMENT 'cle etrangere vers une bibliotheque de cas de test.',
  `CONTENT_ID` bigint(20) NOT NULL COMMENT 'cle etrangere vers un noeud de la bibliotheque de cas de test.',
  `CONTENT_ORDER` int(11) NOT NULL,
  UNIQUE KEY `CONTENT_ID` (`CONTENT_ID`),
  KEY `idx_test_case_lib_content_content` (`CONTENT_ID`),
  KEY `idx_test_case_lib_content_lib` (`LIBRARY_ID`),
  CONSTRAINT `fk_test_case_lib_content_content` FOREIGN KEY (`CONTENT_ID`) REFERENCES `TEST_CASE_LIBRARY_NODE` (`TCLN_ID`),
  CONSTRAINT `fk_test_case_lib_content_lib` FOREIGN KEY (`LIBRARY_ID`) REFERENCES `TEST_CASE_LIBRARY` (`TCL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TEST_CASE_LIBRARY_CONTENT`
--

LOCK TABLES `TEST_CASE_LIBRARY_CONTENT` WRITE;
/*!40000 ALTER TABLE `TEST_CASE_LIBRARY_CONTENT` DISABLE KEYS */;
INSERT INTO `TEST_CASE_LIBRARY_CONTENT` VALUES (1,1,0);
/*!40000 ALTER TABLE `TEST_CASE_LIBRARY_CONTENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TEST_CASE_LIBRARY_NODE`
--

DROP TABLE IF EXISTS `TEST_CASE_LIBRARY_NODE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `TEST_CASE_LIBRARY_NODE` (
  `TCLN_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'cle primaire autogeneree.',
  `DESCRIPTION` longtext DEFAULT NULL,
  `NAME` varchar(255) NOT NULL COMMENT 'Le nom/label de l''element en question.',
  `CREATED_BY` varchar(100) NOT NULL,
  `CREATED_ON` datetime NOT NULL COMMENT 'Date de creation de ce cas de test. Il s''agit de la date de creation de l''entree dans la base, non d''une date metier.',
  `LAST_MODIFIED_BY` varchar(100) DEFAULT NULL,
  `LAST_MODIFIED_ON` datetime DEFAULT NULL COMMENT 'Date de derniere mise a jour de cette instance.',
  `PROJECT_ID` bigint(20) DEFAULT NULL COMMENT 'FK to the Project to which belongs this resource',
  `ATTACHMENT_LIST_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`TCLN_ID`),
  KEY `fk_tcln_project` (`PROJECT_ID`),
  KEY `fk_tcNode_attachment_list` (`ATTACHMENT_LIST_ID`),
  KEY `tcln_name_idx` (`NAME`),
  KEY `idx_tcln_created_by` (`CREATED_BY`),
  KEY `idx_tcln_last_modified_by` (`LAST_MODIFIED_BY`),
  FULLTEXT KEY `tcln_description_fulltext_idx` (`DESCRIPTION`),
  CONSTRAINT `fk_tcNode_attachment_list` FOREIGN KEY (`ATTACHMENT_LIST_ID`) REFERENCES `ATTACHMENT_LIST` (`ATTACHMENT_LIST_ID`),
  CONSTRAINT `fk_tcln_project` FOREIGN KEY (`PROJECT_ID`) REFERENCES `PROJECT` (`PROJECT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TEST_CASE_LIBRARY_NODE`
--

LOCK TABLES `TEST_CASE_LIBRARY_NODE` WRITE;
/*!40000 ALTER TABLE `TEST_CASE_LIBRARY_NODE` DISABLE KEYS */;
INSERT INTO `TEST_CASE_LIBRARY_NODE` VALUES (1,'','Connexion identifiants valides','admin','2025-04-28 14:39:51','admin','2025-04-28 14:41:25',1,19);
/*!40000 ALTER TABLE `TEST_CASE_LIBRARY_NODE` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`squashuser`@`%`*/ /*!50003 trigger ins_tcln_after after insert on
			TEST_CASE_LIBRARY_NODE
			for each row insert ignore into
			TCLN_RELATIONSHIP_CLOSURE values (new.tcln_id, new.tcln_id, 0) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`squashuser`@`%`*/ /*!50003 trigger del_tcln_before before delete on
			TEST_CASE_LIBRARY_NODE
			for each row delete from
			TCLN_RELATIONSHIP_CLOSURE where ancestor_id=old.tcln_id and
			descendant_id=old.tcln_id */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `TEST_CASE_STEPS`
--

DROP TABLE IF EXISTS `TEST_CASE_STEPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `TEST_CASE_STEPS` (
  `TEST_CASE_ID` bigint(20) NOT NULL COMMENT 'cle etrangere vers TEST_CASE.',
  `STEP_ID` bigint(20) NOT NULL COMMENT 'cle etrangere vers la table TEST_STEP.',
  `STEP_ORDER` int(11) NOT NULL COMMENT 'numero d''ordre d''un pas de test dans la liste des pas de test d''un cas de test.',
  UNIQUE KEY `uc_test_case_steps_order` (`TEST_CASE_ID`,`STEP_ORDER`),
  KEY `idx_tc_steps_step` (`STEP_ID`),
  KEY `idx_tc_steps_tc` (`TEST_CASE_ID`),
  CONSTRAINT `fk_tc_steps_step` FOREIGN KEY (`STEP_ID`) REFERENCES `TEST_STEP` (`TEST_STEP_ID`),
  CONSTRAINT `fk_tc_steps_tc` FOREIGN KEY (`TEST_CASE_ID`) REFERENCES `TEST_CASE` (`TCLN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TEST_CASE_STEPS`
--

LOCK TABLES `TEST_CASE_STEPS` WRITE;
/*!40000 ALTER TABLE `TEST_CASE_STEPS` DISABLE KEYS */;
INSERT INTO `TEST_CASE_STEPS` VALUES (1,1,0),(1,2,1),(1,3,2),(1,4,3);
/*!40000 ALTER TABLE `TEST_CASE_STEPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TEST_PLAN`
--

DROP TABLE IF EXISTS `TEST_PLAN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `TEST_PLAN` (
  `TEST_PLAN_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `CL_ID` bigint(20) NOT NULL COMMENT 'foreign key to parent CampaignLibrary',
  PRIMARY KEY (`TEST_PLAN_ID`),
  KEY `idx_fk_test_plan_campaign_library` (`CL_ID`),
  CONSTRAINT `fk_test_plan_campaign_library` FOREIGN KEY (`CL_ID`) REFERENCES `CAMPAIGN_LIBRARY` (`CL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TEST_PLAN`
--

LOCK TABLES `TEST_PLAN` WRITE;
/*!40000 ALTER TABLE `TEST_PLAN` DISABLE KEYS */;
/*!40000 ALTER TABLE `TEST_PLAN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TEST_PLAN_ITEM`
--

DROP TABLE IF EXISTS `TEST_PLAN_ITEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `TEST_PLAN_ITEM` (
  `TEST_PLAN_ITEM_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `TEST_PLAN_ID` bigint(20) NOT NULL COMMENT 'fk to the parent test plan',
  `ITEM_ORDER` int(11) NOT NULL,
  `EXECUTION_STATUS` varchar(255) NOT NULL DEFAULT 'READY',
  `LAST_EXECUTED_BY` varchar(255) DEFAULT NULL,
  `LAST_EXECUTED_ON` datetime DEFAULT NULL,
  `TCLN_ID` bigint(20) DEFAULT NULL,
  `DATASET_ID` bigint(20) DEFAULT NULL,
  `LABEL` varchar(255) NOT NULL,
  `ASSIGNEE_ID` bigint(20) DEFAULT NULL,
  `CREATED_BY` varchar(100) NOT NULL,
  `CREATED_ON` datetime NOT NULL,
  `LAST_MODIFIED_BY` varchar(100) DEFAULT NULL,
  `LAST_MODIFIED_ON` datetime DEFAULT NULL,
  PRIMARY KEY (`TEST_PLAN_ITEM_ID`),
  KEY `idx_fk_test_plan_item_test_plan` (`TEST_PLAN_ID`),
  KEY `idx_fk_test_plan_item_test_case` (`TCLN_ID`),
  KEY `idx_fk_test_plan_item_dataset` (`DATASET_ID`),
  KEY `idx_fk_test_plan_item_user` (`ASSIGNEE_ID`),
  CONSTRAINT `fk_test_plan_item_dataset` FOREIGN KEY (`DATASET_ID`) REFERENCES `DATASET` (`DATASET_ID`),
  CONSTRAINT `fk_test_plan_item_test_case` FOREIGN KEY (`TCLN_ID`) REFERENCES `TEST_CASE` (`TCLN_ID`),
  CONSTRAINT `fk_test_plan_item_test_plan` FOREIGN KEY (`TEST_PLAN_ID`) REFERENCES `TEST_PLAN` (`TEST_PLAN_ID`),
  CONSTRAINT `fk_test_plan_item_user` FOREIGN KEY (`ASSIGNEE_ID`) REFERENCES `CORE_USER` (`PARTY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TEST_PLAN_ITEM`
--

LOCK TABLES `TEST_PLAN_ITEM` WRITE;
/*!40000 ALTER TABLE `TEST_PLAN_ITEM` DISABLE KEYS */;
/*!40000 ALTER TABLE `TEST_PLAN_ITEM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TEST_STEP`
--

DROP TABLE IF EXISTS `TEST_STEP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `TEST_STEP` (
  `TEST_STEP_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'cle primaire autogeneree.',
  PRIMARY KEY (`TEST_STEP_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TEST_STEP`
--

LOCK TABLES `TEST_STEP` WRITE;
/*!40000 ALTER TABLE `TEST_STEP` DISABLE KEYS */;
INSERT INTO `TEST_STEP` VALUES (1),(2),(3),(4);
/*!40000 ALTER TABLE `TEST_STEP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TEST_SUITE`
--

DROP TABLE IF EXISTS `TEST_SUITE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `TEST_SUITE` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) DEFAULT NULL,
  `DESCRIPTION` longtext DEFAULT NULL,
  `ATTACHMENT_LIST_ID` bigint(20) NOT NULL,
  `CREATED_BY` varchar(100) NOT NULL,
  `CREATED_ON` datetime NOT NULL COMMENT 'When this test suite was created',
  `LAST_MODIFIED_BY` varchar(100) DEFAULT NULL,
  `LAST_MODIFIED_ON` datetime DEFAULT NULL COMMENT 'When this test suite was last modified',
  `EXECUTION_STATUS` varchar(255) DEFAULT 'READY',
  `UUID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `uc_test_suite_uuid` (`UUID`),
  KEY `fk_test_suite_attachment_list` (`ATTACHMENT_LIST_ID`),
  CONSTRAINT `fk_test_suite_attachment_list` FOREIGN KEY (`ATTACHMENT_LIST_ID`) REFERENCES `ATTACHMENT_LIST` (`ATTACHMENT_LIST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TEST_SUITE`
--

LOCK TABLES `TEST_SUITE` WRITE;
/*!40000 ALTER TABLE `TEST_SUITE` DISABLE KEYS */;
/*!40000 ALTER TABLE `TEST_SUITE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TEST_SUITE_TEST_PLAN_ITEM`
--

DROP TABLE IF EXISTS `TEST_SUITE_TEST_PLAN_ITEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `TEST_SUITE_TEST_PLAN_ITEM` (
  `TPI_ID` bigint(20) NOT NULL,
  `SUITE_ID` bigint(20) NOT NULL,
  `TEST_PLAN_ORDER` int(11) NOT NULL,
  UNIQUE KEY `uc_test_suite_test_plan_item_order` (`SUITE_ID`,`TEST_PLAN_ORDER`),
  KEY `fk_test_suite_test_plan_item_test_plan_item` (`TPI_ID`),
  CONSTRAINT `fk_test_suite_test_plan_item_test_plan_item` FOREIGN KEY (`TPI_ID`) REFERENCES `ITERATION_TEST_PLAN_ITEM` (`ITEM_TEST_PLAN_ID`),
  CONSTRAINT `fk_test_suite_test_plan_item_test_suite` FOREIGN KEY (`SUITE_ID`) REFERENCES `TEST_SUITE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TEST_SUITE_TEST_PLAN_ITEM`
--

LOCK TABLES `TEST_SUITE_TEST_PLAN_ITEM` WRITE;
/*!40000 ALTER TABLE `TEST_SUITE_TEST_PLAN_ITEM` DISABLE KEYS */;
/*!40000 ALTER TABLE `TEST_SUITE_TEST_PLAN_ITEM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `THIRD_PARTY_SERVER`
--

DROP TABLE IF EXISTS `THIRD_PARTY_SERVER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `THIRD_PARTY_SERVER` (
  `SERVER_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'primary key, autogenerated',
  `NAME` varchar(50) NOT NULL COMMENT 'name of the server',
  `URL` varchar(400) NOT NULL COMMENT 'the base url',
  `AUTH_POLICY` varchar(30) DEFAULT 'USER' COMMENT 'the policy that decides who needs to authenticate',
  `AUTH_PROTOCOL` varchar(30) NOT NULL DEFAULT 'BASIC_AUTH' COMMENT 'the protocol that should be used for that server',
  `CREATED_BY` varchar(100) NOT NULL,
  `CREATED_ON` datetime NOT NULL,
  `LAST_MODIFIED_BY` varchar(100) DEFAULT NULL,
  `LAST_MODIFIED_ON` datetime DEFAULT NULL,
  `DESCRIPTION` longtext DEFAULT '',
  PRIMARY KEY (`SERVER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='base table for third party servers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `THIRD_PARTY_SERVER`
--

LOCK TABLES `THIRD_PARTY_SERVER` WRITE;
/*!40000 ALTER TABLE `THIRD_PARTY_SERVER` DISABLE KEYS */;
/*!40000 ALTER TABLE `THIRD_PARTY_SERVER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VERIFYING_STEPS`
--

DROP TABLE IF EXISTS `VERIFYING_STEPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `VERIFYING_STEPS` (
  `REQUIREMENT_VERSION_COVERAGE_ID` bigint(20) NOT NULL COMMENT 'FK to the concerned requirement-version-coverage',
  `TEST_STEP_ID` bigint(20) NOT NULL COMMENT 'FK to the concerned action test step',
  KEY `fk_verifying_step_action_test_step` (`TEST_STEP_ID`),
  KEY `fk_verifying_step_requirement_version_coverage` (`REQUIREMENT_VERSION_COVERAGE_ID`),
  CONSTRAINT `fk_verifying_step_action_test_step` FOREIGN KEY (`TEST_STEP_ID`) REFERENCES `ACTION_TEST_STEP` (`TEST_STEP_ID`),
  CONSTRAINT `fk_verifying_step_requirement_version_coverage` FOREIGN KEY (`REQUIREMENT_VERSION_COVERAGE_ID`) REFERENCES `REQUIREMENT_VERSION_COVERAGE` (`REQUIREMENT_VERSION_COVERAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VERIFYING_STEPS`
--

LOCK TABLES `VERIFYING_STEPS` WRITE;
/*!40000 ALTER TABLE `VERIFYING_STEPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `VERIFYING_STEPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WORK_DELETE_ENTITIES`
--

DROP TABLE IF EXISTS `WORK_DELETE_ENTITIES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `WORK_DELETE_ENTITIES` (
  `ENTITY_ID` bigint(20) NOT NULL,
  `ENTITY_TYPE` varchar(100) NOT NULL,
  `OPERATION_ID` varchar(50) NOT NULL,
  KEY `work_delete_entities_entity_type_idx` (`ENTITY_TYPE`),
  KEY `work_delete_entities_entity_id_idx` (`ENTITY_ID`),
  KEY `work_delete_entities_operation_id_idx` (`OPERATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WORK_DELETE_ENTITIES`
--

LOCK TABLES `WORK_DELETE_ENTITIES` WRITE;
/*!40000 ALTER TABLE `WORK_DELETE_ENTITIES` DISABLE KEYS */;
/*!40000 ALTER TABLE `WORK_DELETE_ENTITIES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_token`
--

DROP TABLE IF EXISTS `oauth_access_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_access_token` (
  `TOKEN_ID` varchar(255) NOT NULL,
  `TOKEN` longblob DEFAULT NULL,
  `AUTHENTICATION_ID` varchar(255) DEFAULT NULL,
  `USER_NAME` varchar(255) DEFAULT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `AUTHENTICATION` longblob DEFAULT NULL,
  `REFRESH_TOKEN` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`TOKEN_ID`),
  UNIQUE KEY `AUTHENTICATION_ID` (`AUTHENTICATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_token`
--

LOCK TABLES `oauth_access_token` WRITE;
/*!40000 ALTER TABLE `oauth_access_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_access_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_approvals`
--

DROP TABLE IF EXISTS `oauth_approvals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_approvals` (
  `USERID` varchar(255) NOT NULL,
  `CLIENTID` varchar(255) NOT NULL,
  `SCOPE` varchar(255) DEFAULT NULL,
  `STATUS` varchar(10) DEFAULT NULL,
  `EXPIRESAT` datetime DEFAULT NULL,
  `LASTMODIFIEDAT` datetime DEFAULT NULL,
  PRIMARY KEY (`USERID`,`CLIENTID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_approvals`
--

LOCK TABLES `oauth_approvals` WRITE;
/*!40000 ALTER TABLE `oauth_approvals` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_approvals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_client_details`
--

DROP TABLE IF EXISTS `oauth_client_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_client_details` (
  `CLIENT_ID` varchar(255) NOT NULL,
  `CLIENT_SECRET` varchar(255) DEFAULT NULL,
  `RESOURCE_IDS` varchar(255) DEFAULT NULL,
  `SCOPE` varchar(255) DEFAULT 'location,locationhistory',
  `AUTHORIZED_GRANT_TYPES` varchar(255) DEFAULT 'password,authorization_code,refresh_token,implicit',
  `WEB_SERVER_REDIRECT_URI` varchar(255) DEFAULT NULL,
  `AUTHORITIES` varchar(255) DEFAULT 'ROLE_CLIENT, ROLE_TRUSTED_CLIENT',
  `ACCESS_TOKEN_VALIDITY` bigint(20) DEFAULT 60,
  `REFRESH_TOKEN_VALIDITY` bigint(20) DEFAULT NULL,
  `ADDITIONAL_INFORMATION` longtext DEFAULT NULL,
  `AUTOAPPROVE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_client_details`
--

LOCK TABLES `oauth_client_details` WRITE;
/*!40000 ALTER TABLE `oauth_client_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_client_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_client_token`
--

DROP TABLE IF EXISTS `oauth_client_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_client_token` (
  `TOKEN_ID` varchar(255) NOT NULL,
  `TOKEN` longblob DEFAULT NULL,
  `AUTHENTICATION_ID` varchar(255) DEFAULT NULL,
  `USER_NAME` varchar(255) DEFAULT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`TOKEN_ID`),
  UNIQUE KEY `AUTHENTICATION_ID` (`AUTHENTICATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_client_token`
--

LOCK TABLES `oauth_client_token` WRITE;
/*!40000 ALTER TABLE `oauth_client_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_client_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_code`
--

DROP TABLE IF EXISTS `oauth_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_code` (
  `CODE` varchar(255) NOT NULL,
  `AUTHENTICATION` longblob DEFAULT NULL,
  PRIMARY KEY (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_code`
--

LOCK TABLES `oauth_code` WRITE;
/*!40000 ALTER TABLE `oauth_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_token`
--

DROP TABLE IF EXISTS `oauth_refresh_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_refresh_token` (
  `TOKEN_ID` varchar(255) NOT NULL,
  `TOKEN` longblob DEFAULT NULL,
  `AUTHENTICATION` longblob DEFAULT NULL,
  PRIMARY KEY (`TOKEN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_token`
--

LOCK TABLES `oauth_refresh_token` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `EXECUTION_ISSUES_CLOSURE`
--

/*!50001 DROP VIEW IF EXISTS `EXECUTION_ISSUES_CLOSURE`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`squashuser`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `EXECUTION_ISSUES_CLOSURE` AS select `exec`.`EXECUTION_ID` AS `execution_id`,`issue`.`ISSUE_ID` AS `issue_id` from (`EXECUTION` `exec` join `ISSUE` `issue` on(`exec`.`ISSUE_LIST_ID` = `issue`.`ISSUE_LIST_ID`)) union select `eesteps`.`EXECUTION_ID` AS `execution_id`,`issue`.`ISSUE_ID` AS `issue_id` from ((`EXECUTION_EXECUTION_STEPS` `eesteps` join `EXECUTION_STEP` `estep` on(`eesteps`.`EXECUTION_STEP_ID` = `estep`.`EXECUTION_STEP_ID`)) join `ISSUE` `issue` on(`estep`.`ISSUE_LIST_ID` = `issue`.`ISSUE_LIST_ID`)) union select `sn`.`EXECUTION_ID` AS `execution_id`,`ISSUE`.`ISSUE_ID` AS `issue_id` from (`SESSION_NOTE` `sn` join `ISSUE` on(`ISSUE`.`ISSUE_LIST_ID` = `sn`.`ISSUE_LIST_ID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `RLN_RESOURCE`
--

/*!50001 DROP VIEW IF EXISTS `RLN_RESOURCE`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`squashuser`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `RLN_RESOURCE` AS select `fold`.`RLN_ID` AS `rln_id`,`fold`.`RES_ID` AS `res_id` from `REQUIREMENT_FOLDER` `fold` union select `req`.`RLN_ID` AS `rln_id`,`req`.`CURRENT_VERSION_ID` AS `res_id` from `REQUIREMENT` `req` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-28 13:05:44
