CREATE DATABASE  IF NOT EXISTS `emalkhana` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `emalkhana`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: emalkhana
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `accessibledepartment`
--

DROP TABLE IF EXISTS `accessibledepartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accessibledepartment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `departmentId` int DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_grade_id` (`userId`),
  KEY `adDept` (`departmentId`),
  CONSTRAINT `adDept` FOREIGN KEY (`departmentId`) REFERENCES `department` (`id`),
  CONSTRAINT `fk_grade_id` FOREIGN KEY (`userId`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accessibledepartment`
--

LOCK TABLES `accessibledepartment` WRITE;
/*!40000 ALTER TABLE `accessibledepartment` DISABLE KEYS */;
/*!40000 ALTER TABLE `accessibledepartment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courtname`
--

DROP TABLE IF EXISTS `courtname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courtname` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `updatedBy` int NOT NULL,
  `updatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isActive` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courtname`
--

LOCK TABLES `courtname` WRITE;
/*!40000 ALTER TABLE `courtname` DISABLE KEYS */;
INSERT INTO `courtname` VALUES (1,'hello',1,'2022-12-03 13:25:02',_binary '\0'),(2,'Court Dilshad Garden',1,'2022-12-05 07:36:16',_binary ''),(3,'Court - Anand Vihar',1,'2022-12-05 07:36:26',_binary ''),(4,'qwa',1,'2022-12-04 11:32:57',_binary '\0');
/*!40000 ALTER TABLE `courtname` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `isPS` bit(1) NOT NULL DEFAULT (1),
  `isActive` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Jagatpuri',_binary '',_binary ''),(2,'DCP Office',_binary '\0',_binary ''),(3,'Shahdara',_binary '',_binary ''),(5,'Seemapuri',_binary '',_binary ''),(6,'Vivek Vihar',_binary '',_binary '\0'),(7,'Krishna Nagar',_binary '',_binary ''),(8,'Anand Vihar',_binary '',_binary '');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disposal`
--

DROP TABLE IF EXISTS `disposal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disposal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `updatedBy` int NOT NULL,
  `updatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isActive` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disposal`
--

LOCK TABLES `disposal` WRITE;
/*!40000 ALTER TABLE `disposal` DISABLE KEYS */;
INSERT INTO `disposal` VALUES (1,'Disposal 3',1,'2022-11-27 10:19:32',_binary '\0'),(2,'DIsposal 2',1,'2022-11-27 10:19:20',_binary '');
/*!40000 ALTER TABLE `disposal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `head`
--

DROP TABLE IF EXISTS `head`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `head` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `updatedBy` int NOT NULL,
  `updatedOn` timestamp NULL DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP,
  `isActive` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `head`
--

LOCK TABLES `head` WRITE;
/*!40000 ALTER TABLE `head` DISABLE KEYS */;
INSERT INTO `head` VALUES (1,'Head 1',1,'2022-11-27 09:43:06',0),(2,'Head 2',1,'2022-11-27 08:30:26',1),(3,'Head 3',1,'2022-11-27 08:30:37',1);
/*!40000 ALTER TABLE `head` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mud`
--

DROP TABLE IF EXISTS `mud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mud` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mudNo` varchar(45) DEFAULT NULL,
  `year` int DEFAULT NULL,
  `departmentId` int DEFAULT NULL,
  `headId` int DEFAULT NULL,
  `photoId` varchar(1000) DEFAULT NULL,
  `seizeDate` date DEFAULT NULL,
  `ioName` varchar(45) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `statusId` int DEFAULT NULL,
  `location` varchar(500) DEFAULT NULL,
  `caseDecided` bit(1) DEFAULT NULL,
  `dateDecision` date DEFAULT NULL,
  `courtId` int DEFAULT NULL,
  `dateOrderDestroy` date DEFAULT NULL,
  `dateDestroy` date DEFAULT NULL,
  `disposalId` int DEFAULT NULL,
  `qrCodeId` int DEFAULT NULL,
  `updatedBy` int DEFAULT NULL,
  `updatedOn` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isActive` bit(1) DEFAULT b'1',
  `firNo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `departmentId` (`departmentId`),
  KEY `headid` (`headId`),
  KEY `statusId` (`statusId`),
  KEY `disposal` (`disposalId`),
  KEY `court` (`courtId`),
  CONSTRAINT `court` FOREIGN KEY (`courtId`) REFERENCES `courtname` (`id`),
  CONSTRAINT `departmentId` FOREIGN KEY (`departmentId`) REFERENCES `department` (`id`),
  CONSTRAINT `disposal` FOREIGN KEY (`disposalId`) REFERENCES `disposal` (`id`),
  CONSTRAINT `headid` FOREIGN KEY (`headId`) REFERENCES `head` (`id`),
  CONSTRAINT `statusId` FOREIGN KEY (`statusId`) REFERENCES `status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mud`
--

LOCK TABLES `mud` WRITE;
/*!40000 ALTER TABLE `mud` DISABLE KEYS */;
INSERT INTO `mud` VALUES (1,'1',1,1,2,'123','2022-12-08','a','a',2,'a',_binary '','2022-12-22',2,'2022-12-29','2022-12-31',2,NULL,1,'2022-12-04 16:27:22',_binary '\0','123'),(2,'1',1,1,2,'123','2022-12-31','asdsd','a',2,'sasd',_binary '','2022-12-31',2,'2022-12-31',NULL,2,NULL,1,'2022-12-04 16:36:07',_binary '\0','1'),(3,'1',1,3,2,'123','2022-12-31','asdsd','a',2,'sasd',_binary '','2022-12-31',2,'2022-12-31',NULL,2,NULL,1,'2022-12-04 18:12:37',_binary '\0','1'),(4,'1',1,3,2,'123','2022-12-31','asdsd','azdffsdfs',2,'sasd',_binary '','2022-12-31',2,'2022-12-31',NULL,2,NULL,1,'2022-12-04 18:13:17',_binary '\0','1'),(5,'1',1,3,2,'123','2022-12-31','asdsd','azdffsdfs',2,'sasd',_binary '','2022-12-31',2,'2022-12-31',NULL,2,NULL,1,'2022-12-04 18:14:58',_binary '\0','1'),(6,'1',1,3,2,'123','2022-12-31','asdsd','azdffsdfsasasd',2,'sasd',_binary '','2022-12-31',2,'2022-12-31',NULL,2,NULL,1,'2022-12-04 18:19:04',_binary '\0','1'),(7,'1',1,3,2,'123','2022-12-31','asdsd','azdffsdfsasasd',2,'sasd',_binary '','2022-12-31',2,'2022-12-31',NULL,2,NULL,1,'2022-12-04 18:20:42',_binary '\0','1'),(8,'1',1,3,2,'123','2022-12-31','asdsd','azdffsdfsasasd',2,'sasd',_binary '','2022-12-31',2,'2022-12-31',NULL,2,NULL,1,'2022-12-04 18:28:18',_binary '\0','1'),(13,'1',1,3,2,'123','2022-12-31','asdsd','azdffsdfsasasd',2,'sasd',_binary '','2022-12-31',2,'2022-12-31',NULL,2,NULL,1,'2022-12-04 18:29:10',_binary '\0','1'),(14,'1',1,3,2,'123','2022-12-31','asdsd','azdffsdfsasasd',2,'sasd',_binary '','2022-12-31',2,'2022-12-31',NULL,2,NULL,1,'2022-12-04 18:30:00',_binary '\0','1'),(15,'1',1,3,2,'123','2022-12-31','asdsd','azdffsdfsasasd',2,'sasd',_binary '','2022-12-31',2,'2022-12-31',NULL,2,NULL,1,'2022-12-04 18:31:53',_binary '\0','1'),(16,'1',1,3,2,'123','2022-12-31','asdsd','azdffsdfsasasd',2,'sasd',_binary '','2022-12-31',2,'2022-12-31',NULL,2,NULL,1,'2022-12-04 19:10:12',_binary '\0','1'),(17,'1',1,3,2,'D:\\EMalkhana\\00010101000000\\recorddelete.png','2022-12-31','asdsd','azdffsdfsasasd',2,'sasd',_binary '','2022-12-31',2,'2022-12-31',NULL,2,NULL,1,'2022-12-04 19:26:16',_binary '\0','1'),(18,'1',1,3,2,'photo\\00010101000000.png','2022-12-31','asdsd','azdffsdfsasasd',2,'sasd',_binary '','2022-12-31',2,'2022-12-31',NULL,2,NULL,1,'2022-12-05 05:36:50',_binary '\0','1'),(19,'1',1,3,2,'photo\\00010101000000.png','2022-12-31','asdsd','azdffsdfsasasd',2,'sasd',_binary '','2022-12-31',2,'2022-12-31',NULL,2,NULL,1,'2022-12-05 05:29:55',_binary '\0','1'),(20,'2',11,3,2,'photo\\00010101000000.png','2022-12-31','asdsd','azdffsdfsasasd',2,'sasd',_binary '','2022-12-31',2,'2022-12-31',NULL,2,NULL,1,'2022-12-05 05:36:50',_binary '','1'),(25,'1',1234,3,2,'photo\\00010101000000.png','2022-12-31','asdsd','azdffsdfsasasd',2,'sasd',_binary '','2022-12-31',2,'2022-12-31',NULL,2,NULL,1,'2022-12-05 06:23:00',_binary '','1');
/*!40000 ALTER TABLE `mud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mudmovement`
--

DROP TABLE IF EXISTS `mudmovement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mudmovement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mudNo` int NOT NULL,
  `currentlyAt` int NOT NULL,
  `leftOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `requestedBy` int NOT NULL,
  `goingAt` int NOT NULL,
  `receivedOn` date DEFAULT NULL,
  `isReceived` bit(1) DEFAULT b'0',
  `receivedBy` int DEFAULT '0',
  `isActive` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`),
  KEY `mud` (`mudNo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mudmovement`
--

LOCK TABLES `mudmovement` WRITE;
/*!40000 ALTER TABLE `mudmovement` DISABLE KEYS */;
INSERT INTO `mudmovement` VALUES (1,1,1,'2022-12-04 16:36:44',1,3,'2022-01-01',_binary '',1,_binary '\0'),(2,1,1,'2022-12-04 16:36:44',1,6,NULL,_binary '\0',0,_binary '\0'),(3,1,1,'2022-12-04 16:36:44',1,3,NULL,_binary '',1,_binary '\0'),(4,1,3,'2022-12-04 16:36:44',1,1,NULL,_binary '\0',0,_binary '');
/*!40000 ALTER TABLE `mudmovement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mudsection`
--

DROP TABLE IF EXISTS `mudsection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mudsection` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mudId` int NOT NULL,
  `sectionId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mudsec` (`mudId`),
  KEY `mudsec1` (`sectionId`),
  CONSTRAINT `mudsec` FOREIGN KEY (`mudId`) REFERENCES `mud` (`id`),
  CONSTRAINT `mudsec1` FOREIGN KEY (`sectionId`) REFERENCES `section` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mudsection`
--

LOCK TABLES `mudsection` WRITE;
/*!40000 ALTER TABLE `mudsection` DISABLE KEYS */;
INSERT INTO `mudsection` VALUES (2,1,2),(3,1,3),(4,1,7),(5,1,10),(6,3,2),(7,3,3),(8,3,7),(9,3,10),(13,1,2),(14,1,3),(15,1,7),(16,1,9),(17,1,10),(18,1,2),(19,1,3),(20,1,7),(21,1,9),(22,1,10),(23,1,2),(24,1,3),(25,1,9),(26,1,10),(27,1,2),(28,1,3),(29,1,4),(30,1,3),(31,1,9),(32,1,10),(37,15,4),(38,16,2),(39,16,4),(40,16,9),(41,17,2),(42,17,4),(43,17,9),(44,18,2),(45,18,4),(46,18,9),(47,19,2),(48,19,4),(49,19,9),(50,20,2),(51,20,4),(52,20,9),(65,25,2),(66,25,4),(67,25,9);
/*!40000 ALTER TABLE `mudsection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `url` varchar(45) NOT NULL,
  `isActive` bit(1) DEFAULT (1),
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (1,'/Mud.aspx',_binary '','Mud'),(2,'/Dashboard.aspx',_binary '','Dashboard'),(3,'/MudMovement.aspx',_binary '','MudMovement'),(4,'/PoliceStation.aspx',_binary '','PoliceStation'),(5,'/SearchMud.aspx',_binary '','SearchMud'),(6,'/Head.aspx',_binary '','Heads'),(7,'/Section.aspx',_binary '','Section'),(8,'/Status.aspx',_binary '','Status'),(9,'/Disposal.aspx',_binary '','Disposal'),(10,'/CourtName.aspx',_binary '','CourtName'),(11,'/MudOutOfStation.aspx',_binary '','MudOutOfStation'),(12,'/StatusWise.aspx',_binary '','StatusWise'),(13,'/HeadWise.aspx',_binary '','HeadWise'),(14,'/MudMovementWise.aspx',_binary '','MudMovementWise'),(15,'/DestroyedBetweenDates.aspx',_binary '','DestroyedBetweenDates'),(16,'/OrderNotDestroyed.aspx',_binary '','OrderNotDestroyed'),(17,'/PoliceStation.aspx',_binary '','PoliceStation'),(18,'/Users.aspx',_binary '','Users'),(19,'/Role.aspx',_binary '','Role'),(20,'/Permission.aspx',_binary '','Permission'),(21,'/RolePermission.aspx',_binary '','RolePermission');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `isActive` bit(1) DEFAULT (1),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'SuperAdmin',_binary ''),(2,'Admin',_binary ''),(3,'DCP',_binary '');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permission_mapping`
--

DROP TABLE IF EXISTS `role_permission_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_permission_mapping` (
  `id` int NOT NULL AUTO_INCREMENT,
  `roleId` int DEFAULT NULL,
  `permissionId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `roleId` (`roleId`),
  KEY `permissionId` (`permissionId`),
  CONSTRAINT `role_permission_mapping_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`),
  CONSTRAINT `role_permission_mapping_ibfk_2` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permission_mapping`
--

LOCK TABLES `role_permission_mapping` WRITE;
/*!40000 ALTER TABLE `role_permission_mapping` DISABLE KEYS */;
INSERT INTO `role_permission_mapping` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18),(20,1,19),(21,1,20),(23,1,21),(50,2,1),(51,2,2),(52,2,3),(53,2,5),(54,2,6),(55,2,7),(56,2,9),(57,2,10),(58,2,11),(59,2,13),(60,2,14),(61,2,15),(62,2,17),(63,3,1),(64,3,2),(65,3,3),(66,3,4),(67,3,5),(68,3,6),(69,3,7),(70,3,8),(71,3,9),(72,3,10),(73,3,11),(74,3,12),(75,3,13),(76,3,14),(77,3,15),(78,3,16),(79,3,17),(80,3,18),(81,3,19),(82,3,20),(83,3,21);
/*!40000 ALTER TABLE `role_permission_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `updatedBy` int NOT NULL,
  `updatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isActive` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES (1,'Section 1',1,'2022-12-05 07:35:55',_binary '\0'),(2,'Section 1',1,'2022-12-05 07:35:18',_binary ''),(3,'Section 2',1,'2022-12-05 07:35:55',_binary ''),(4,'Section 3',1,'2022-12-05 07:35:55',_binary ''),(7,'Section 4',1,'2022-12-05 07:35:55',_binary ''),(8,'Section 5',1,'2022-12-05 07:35:55',_binary ''),(9,'Section 6',1,'2022-12-05 07:35:55',_binary ''),(10,'Section 7',1,'2022-12-05 07:35:55',_binary ''),(11,'Section 8',1,'2022-12-05 07:35:55',_binary ''),(12,'Special Act',1,'2022-12-07 12:59:03',_binary ''),(13,'IPC 210',1,'2022-12-07 12:59:14',_binary '');
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `updatedBy` int NOT NULL,
  `updatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isActive` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'STATUS 2',1,'2022-12-05 06:11:10',_binary ''),(2,'STATUS 1',1,'2022-12-04 16:44:35',_binary '');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uniquemud`
--

DROP TABLE IF EXISTS `uniquemud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uniquemud` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mudNo` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mudNo_UNIQUE` (`mudNo`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uniquemud`
--

LOCK TABLES `uniquemud` WRITE;
/*!40000 ALTER TABLE `uniquemud` DISABLE KEYS */;
INSERT INTO `uniquemud` VALUES (18,''),(3,'1'),(2,'123456'),(1,'MUD1234');
/*!40000 ALTER TABLE `uniquemud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_department_map`
--

DROP TABLE IF EXISTS `user_department_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_department_map` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `departmentId` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_department_map`
--

LOCK TABLES `user_department_map` WRITE;
/*!40000 ALTER TABLE `user_department_map` DISABLE KEYS */;
INSERT INTO `user_department_map` VALUES (21,6,1),(22,6,2),(23,7,1),(24,7,6),(25,3,1),(26,3,6),(27,2,1),(28,2,6),(29,1,1),(30,1,3),(31,1,5),(32,1,6),(33,1,8);
/*!40000 ALTER TABLE `user_department_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `roleId` int NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `createdBy` int DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isActive` bit(1) NOT NULL DEFAULT (1),
  PRIMARY KEY (`id`),
  KEY `user1` (`roleId`),
  CONSTRAINT `user1` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Vaibhav Mittal',1,'9560630130','mittal',1,'2022-11-27 08:10:37',_binary ''),(2,'SO DCP',1,'9871072088','mittal',1,'2022-11-27 08:11:30',_binary ''),(3,'ABC',2,'asd','acv',1,'2022-12-03 16:48:02',_binary ''),(4,'a',1,'a','a',1,'2022-12-03 17:35:39',_binary ''),(5,'a',1,'a','a',1,'2022-12-03 17:53:52',_binary ''),(6,'b',1,'b','b',1,'2022-12-03 18:12:10',_binary ''),(7,'d',1,'d','d',1,'2022-12-03 18:12:24',_binary ''),(8,'e',1,'e','e',1,'2022-12-03 18:12:46',_binary ''),(9,'f',1,'f','f',1,'2022-12-03 18:14:51',_binary '');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'emalkhana'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_accdepartment_search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_accdepartment_search`(IN numUserId int)
BEGIN
	select departmentId as id, name from user_department_map left outer join department on department.id = user_department_map.departmentid where userId = numUserId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_accept_mudmovement` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_accept_mudmovement`(IN userID INT, IN moveID INT)
BEGIN

	DECLARE mudId INT ;
    DECLARE nextMudId INT;
    DECLARE goingTo INT;
    START transaction;
	update mudmovement set isReceived = 1, receivedBy = userid WHERE id = moveID;
    SET goingTo = (select goingAt from mudmovement where id = moveID);
    SET  mudId =  (select id from mud where isActive = 1 and mudNo = (select mudNo from mudmovement where id = moveId));
    
    insert into mud (mudNo ,  year ,  departmentId ,  headId ,  photoId  ,  seizeDate ,  ioName ,  description ,  statusId ,  location ,  caseDecided ,  dateDecision ,  courtId ,  dateOrderDestroy ,  dateDestroy ,  disposalId , updatedBy ,  firNo) 
     (select mudNo ,  year ,  goingTo ,  headId ,  photoId  ,  seizeDate ,  ioName ,  description ,  statusId ,  location ,  caseDecided ,  dateDecision ,  courtId ,  dateOrderDestroy ,  dateDestroy ,  disposalId , updatedBy , firNo from mud where id = mudId);
	
    update mud set isActive = 0 where id = mudId;
    SET  nextMudId =  (select id from mud where isActive = 1 and mudNo = (select mudNo from mudmovement where id = moveId));
    insert into mudsection (mudId,sectionId) (select nextMudId,ms.sectionId from mudSection ms where mudId = mudId);
	commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_accessibledepartment_Add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_accessibledepartment_Add`(IN id int, IN userId int, IN departmentId int, IN isActive bit)
BEGIN
IF 1 = (select EXISTS(select id from accessibledepartment where id = id)) THEN
update accessibledepartment set userId = userId, departmentId = departmentId, isActive = isActive
            WHERE id = id;
ELSE
insert into accessibledepartment (id, userId,departmentId, isActive) values (id, userId,departmentId, isActive);
        END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_courtname_Add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_courtname_Add`(IN numId int, IN name varchar(45), IN updatedBy int)
BEGIN
IF 1 = (select EXISTS(select id from courtname where id = numId)) THEN
update courtname set name = name, updatedBy = updatedBy
            WHERE id = numId;
ELSE
insert into courtname (name,updatedBy) values (name,updatedBy);
        END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_courtname_Search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_courtname_Search`(IN numId int)
BEGIN
	select * from courtname where id = case numId when 0 then id else numId end and isActive = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_department_Add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_department_Add`(IN numId int, IN txtName varchar(45), IN isPS bit)
BEGIN
IF 1 = (select EXISTS(select id from department where id = numId)) THEN
update department set name = txtName, isPS = isPS
            WHERE id = numId;
ELSE
insert into department (id, name, isPS) values (numId, txtName, isPS);
        END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_department_Search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_department_Search`(IN numId int)
BEGIN
	select * from department where id = case numId when 0 then id else numId end and isActive= 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_disposal_Add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_disposal_Add`(IN numid int, IN name varchar(45), IN updatedBy int)
BEGIN
IF 1 = (select EXISTS(select id from disposal where id = numid)) THEN
update disposal set name = name, updatedBy = updatedBy
            WHERE id = numid;
ELSE
insert into disposal (name,updatedBy,isActive) values (name,updatedBy,1);
        END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_disposal_Search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_disposal_Search`(IN numId int)
BEGIN
	select * from disposal where id = case numId when 0 then id else numId end and isActive = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_head_Add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_head_Add`(IN numId int, IN txtName varchar(45), IN updatedBy int)
BEGIN
IF 1 = (select EXISTS(select id from head where id = numId)) THEN
update head set name = txtName, updatedBy = updatedBy, isActive = 1
            WHERE id = numId;
ELSE
insert into head (id, name,updatedBy,isActive) values (numId, txtName,updatedBy,1);
        END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_head_Search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_head_Search`(IN numId int)
BEGIN
	select * from head where id = case numId when 0 then id else numId end and isActive = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mudmovement_Add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mudmovement_Add`(IN mudNumber int, IN requestedBy int,IN goingAt int)
BEGIN
DECLARE currentlyAt INT;
set currentlyAt = (select departmentId from mud where isActive = 1 and mudNo = mudNumber);
update mudmovement set isACtive = 0 where mudNo = mudNumber;
insert into mudmovement (mudNo,currentlyAt,requestedBy,goingAt) values (mudNumber,currentlyAt,requestedBy,goingAt);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mudmovement_out_Search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mudmovement_out_Search`(IN numUserId int,IN startDate date, IN endDate date)
BEGIN
	select * ,mudMovement.isActive as mdActive from mudMovement
    left outer join department on department.id = goingAt where isReceived = 0 
    and goingAt in 
    (select departmentId from user_department_map where userId = numUserId)
    AND leftOn >= CASE startDate when "0" then leftOn else startDate end
    AND leftOn <= CASE endDate when "0" then leftOn else endDate end;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mudmovement_Search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mudmovement_Search`(IN numUserId int)
BEGIN
	select * ,mudMovement.isActive as mdActive from mudMovement
    left outer join department on department.id = goingAt where isReceived = 0 
    and mudMovement.isActive = 1 and goingAt in 
    (select departmentId from user_department_map where userId = numUserId);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mudmovement_wise_Search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mudmovement_wise_Search`(IN numUserId int,IN startDate date, IN endDate date,IN numMudNo int)
BEGIN
	select * ,mudMovement.isActive as mdActive, mudMovement.isReceived as mdRecieve from mudMovement
    left outer join department on department.id = goingAt where goingAt in 
    (select departmentId from user_department_map where userId = numUserId)
    AND leftOn >= CASE startDate when "0" then leftOn else startDate end
    AND leftOn <= CASE endDate when "0" then leftOn else endDate end
    AND mudNo = numMudNo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mudsection_Add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mudsection_Add`(IN id int, IN mudId int, IN sectionId int)
BEGIN
IF 1 = (select EXISTS(select id from mudsection where id = id)) THEN
update mudsection set mudId = mudId, sectionId = sectionId
            WHERE id = id;
ELSE
insert into mudsection (id, mudId,sectionId) values (id, mudId,sectionId);
        END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mud_Add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mud_Add`(IN numId int, IN txtmudNo varchar(45), IN firNo varchar(45), IN year int, IN departmentId int, IN headId int, IN photoId varchar(1000) , IN seizeDate DATE, IN ioName varchar(45), IN description varchar(500), IN statusId int, IN location varchar(500), IN caseDecided bit, IN dateDecision DATE, IN courtId int, IN dateOrderDestroy DATE, IN dateDestroy DATE, IN disposalId int, IN updatedBy INT, IN isActive int, IN sectionIDs varchar(500))
BEGIN
    DECLARE strLen    INT DEFAULT 0;
    DECLARE SubStrLen INT DEFAULT 0;
    DECLARE nextMudId INT;
    DECLARE goingTo INT;
    declare uMudId int default 0;
	start transaction;
		update mud set isActive = 0 where mudNo = txtmudNo;
		insert into mud (  mudNo ,  year ,  departmentId ,  headId ,  photoId  ,  seizeDate ,  ioName ,  description ,  statusId ,  location ,  caseDecided ,  dateDecision ,  courtId ,  dateOrderDestroy ,  dateDestroy ,  disposalId , updatedBy ,  isActive, firNo) values ( txtmudNo ,  year ,  departmentId ,  headId ,  photoId  ,  seizeDate ,  ioName ,  description ,  statusId ,  location ,  caseDecided , dateDecision ,  courtId , dateOrderDestroy , dateDestroy ,  disposalId ,  updatedBy ,  isActive, firNo);
		set uMudId = (select id from mud where mudNo = txtmudNo and isActive = 1 order by id desc limit 1);
insert ignore into uniquemud (mudNo) values (txtmudNo);

 do_this:
      LOOP
		
        IF sectionIDs = '' THEN
          LEAVE do_this;
        END IF;
        
        SET strLen = CHAR_LENGTH(sectionIDs);

        INSERT INTO mudsection (mudId, sectionId) VALUES(uMudId,SUBSTRING_INDEX(sectionIDs, ',', 1));

        SET SubStrLen = CHAR_LENGTH(SUBSTRING_INDEX(sectionIDs, ',', 1))+2;
        SET sectionIDs = MID(sectionIDs, SubStrLen, strLen);

        IF sectionIDs = '' THEN
          LEAVE do_this;
        END IF;
      END LOOP do_this;
        commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Mud_detroyed_by_date_Search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Mud_detroyed_by_date_Search`(IN numUserId int,IN startDate date, IN endDate date)
BEGIN
	select *, date(seizeDate) as sDate, department.name as departmentName, head.name as 
    headName, status.name as statusName, courtname.name as courtName from mud left outer join 
    department on department.id = mud.departmentId left outer join head on head.id = mud.headId 
    left outer join courtname on courtname.id = mud.courtId left outer join status on 
    status.id = mud.statusId where mud.isActive = 1
    and department.id in (select departmentId from user_department_map where userId = numUserId)
    AND dateDestroy >= CASE startDate when "0" then dateDestroy else startDate end
    AND dateDestroy <= CASE endDate when "0" then dateDestroy else endDate end;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Mud_Head_Search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Mud_Head_Search`(IN numUserId int,IN startDate date, IN endDate date,IN numHeadId int)
BEGIN
	select *, date(seizeDate) as sDate, department.name as departmentName, head.name as 
    headName, status.name as statusName, courtname.name as courtName from mud left outer join 
    department on department.id = mud.departmentId left outer join head on head.id = mud.headId 
    left outer join courtname on courtname.id = mud.courtId left outer join status on 
    status.id = mud.statusId where mud.isActive = 1
    and department.id in (select departmentId from user_department_map where userId = numUserId)
    AND seizeDate >= CASE startDate when "0" then seizeDate else startDate end
    AND seizeDate <= CASE endDate when "0" then seizeDate else endDate end
    AND headId = numHeadId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Mud_Order_Not_destroyed_Search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Mud_Order_Not_destroyed_Search`(IN numUserId int,IN startDate date, IN endDate date)
BEGIN
	select *, date(seizeDate) as sDate, department.name as departmentName, head.name as 
    headName, status.name as statusName, courtname.name as courtName from mud left outer join 
    department on department.id = mud.departmentId left outer join head on head.id = mud.headId 
    left outer join courtname on courtname.id = mud.courtId left outer join status on 
    status.id = mud.statusId where  mud.isActive = 1
    and department.id in (select departmentId from user_department_map where userId = numUserId)
    AND dateOrderDestroy >= CASE startDate when "0" then dateOrderDestroy else startDate end
    AND dateOrderDestroy <= CASE endDate when "0" then dateOrderDestroy else endDate end
    AND DateDestroy is null;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mud_Search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mud_Search`(IN numId int, IN numUserId int)
BEGIN
	select *, date(seizeDate) as sDate, users.name as updator, department.name as departmentName, head.name as 
    headName, status.name as statusName, courtname.name as courtName from mud left outer join 
    department on department.id = mud.departmentId left outer join head on head.id = mud.headId 
    left outer join courtname on courtname.id = mud.courtId left outer join status on 
    status.id = mud.statusId left outer join users on users.id = mud.updatedBy where mud.id = case numId when 0 then mud.id else numId end and mud.isActive = 1
    and department.id in (select departmentId from user_department_map where userId = numUserId);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Mud_Status_Search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Mud_Status_Search`(IN numUserId int,IN startDate date, IN endDate date,IN numStatusId int)
BEGIN
	select *, date(seizeDate) as sDate, department.name as departmentName, head.name as 
    headName, status.name as statusName, courtname.name as courtName from mud left outer join 
    department on department.id = mud.departmentId left outer join head on head.id = mud.headId 
    left outer join courtname on courtname.id = mud.courtId left outer join status on 
    status.id = mud.statusId where mud.isActive = 1
    and department.id in (select departmentId from user_department_map where userId = numUserId)
    AND seizeDate >= CASE startDate when "0" then seizeDate else startDate end
    AND seizeDate <= CASE endDate when "0" then seizeDate else endDate end
    AND statusId = numStatusId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_permission_Add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_permission_Add`(IN numId int, IN txtName varchar(45))
BEGIN
IF 1 = (select EXISTS(select id from `permission` where id = numId)) THEN
update permission set `name` = txtName
            WHERE id = numId;
ELSE
insert into permission (id, `name`) values (numId, txtName);
        END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_permission_Search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_permission_Search`(IN numId int)
BEGIN
	select * from permission where id = case numId when 0 then id else numId end and isActive = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_roleperm_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_roleperm_add`(IN numRoleId int, IN permissionIds varchar(500))
BEGIN
DECLARE strLen    INT DEFAULT 0;
DECLARE SubStrLen INT DEFAULT 0;

delete from role_permission_mapping where roleId = numRoleId;
do_this:
      LOOP
		IF permissionIds = '' THEN
          LEAVE do_this;
        END IF;
        SET strLen = CHAR_LENGTH(permissionIds);
        INSERT INTO role_permission_mapping (roleId, permissionId) VALUES(numRoleId,
			SUBSTRING_INDEX(permissionIds, ',', 1));
        SET SubStrLen = CHAR_LENGTH(SUBSTRING_INDEX(permissionIds, ',', 1))+2;
        SET permissionIds = MID(permissionIds, SubStrLen, strLen);
        IF permissionIds = '' THEN
          LEAVE do_this;
        END IF;
      END LOOP do_this;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_role_Add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_role_Add`(IN numId int, IN txtName varchar(45))
BEGIN
IF 1 = (select EXISTS(select id from `role` where id = numId)) THEN
update role set `name` = txtName
            WHERE id = numId;
ELSE
insert into role (id, `name`) values (numId, txtName);
        END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_role_Search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_role_Search`(IN numId int)
BEGIN
	select * from role where id = case numId when 0 then id else numId end and isActive = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_search_mudmovement` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_search_mudmovement`(IN numUserId int,IN numMudNo int)
BEGIN
	select * ,mudMovement.isActive as mdActive, mudMovement.isReceived as mdRecieve from mudMovement
    left outer join department on department.id = goingAt where goingAt in 
    (select departmentId from user_department_map where userId = numUserId)
    AND mudNo = numMudNo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_section_Add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_section_Add`(IN numid int, IN name varchar(45), IN updatedBy int)
BEGIN
IF 1 = (select EXISTS(select id from section where id = numId)) THEN
update section set name = name, updatedBy = updatedBy
            WHERE id = numId;
ELSE
insert into section (name,updatedBy, isActive) values (name,updatedBy, 1);
        END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_section_Search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_section_Search`(IN numId int)
BEGIN
	select * from section where id = case numId when 0 then id else numId end and isActive = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_status_Add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_status_Add`(IN numId int, IN name varchar(45), IN updatedBy int)
BEGIN
IF 1 = (select EXISTS(select id from status where id = numId)) THEN
update status set name = name, updatedBy = updatedBy
            WHERE id = numId;
ELSE
insert into status (name,updatedBy) values (name,updatedBy);
        END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_status_Search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_status_Search`(IN numId int)
BEGIN
	select * from status where id = case numId when 0 then id else numId end and isActive = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_uniquemud_Add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_uniquemud_Add`(IN id int, IN mudNo varchar(45))
BEGIN
IF 1 = (select EXISTS(select id from uniquemud where id = id)) THEN
update uniquemud set mudNo = mudNo
            WHERE id = id;
ELSE
insert into uniquemud (id, mudNo) values (id, mudNo);
        END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_users_Add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_users_Add`(IN numId int, IN txtName varchar(45), IN roleId int, IN username varchar(45), IN password varchar(45), IN createdBy int)
BEGIN
IF 1 = (select EXISTS(select id from users where id = numId)) THEN
update users set `name` = txtName, roleId = roleId,username=username, password = password,createdBy=createdBy
            WHERE id = numId;
ELSE
insert into users (id, `name`,roleId,username,password,createdBy) values (numId, txtName,roleId,username,password,createdBy);
        END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_users_Search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_users_Search`(IN numId int)
BEGIN
	select *,`role`.`name` as rname from users join `role` where `role`.id = users.roleId and users.id = case numId when 0 then users.id else numId end and users.isActive = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_user_dept_map_Add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_user_dept_map_Add`(IN txtusername varchar(500), IN departmentIds varchar(500))
BEGIN
DECLARE strLen    INT DEFAULT 0;
DECLARE SubStrLen INT DEFAULT 0;
DECLARE numuserId INT default 0;

SET numuserId =(Select id from users where username = txtusername limit 1);

delete from user_department_map where userId = numuserId;
do_this:
      LOOP
		IF departmentIds = '' THEN
          LEAVE do_this;
        END IF;
        SET strLen = CHAR_LENGTH(departmentIds);
        INSERT INTO user_department_map (userId, departmentId) VALUES(numuserId,
			SUBSTRING_INDEX(departmentIds, ',', 1));
        SET SubStrLen = CHAR_LENGTH(SUBSTRING_INDEX(departmentIds, ',', 1))+2;
        SET departmentIds = MID(departmentIds, SubStrLen, strLen);
        IF departmentIds = '' THEN
          LEAVE do_this;
        END IF;
      END LOOP do_this;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-09 23:20:41
