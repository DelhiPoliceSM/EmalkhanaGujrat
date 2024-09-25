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
  `updatedOn` timestamp NULL DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courtname`
--

LOCK TABLES `courtname` WRITE;
/*!40000 ALTER TABLE `courtname` DISABLE KEYS */;
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
  `isPS` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Shaanu Computers',_binary '\0'),(2,'DCP Office',_binary '\0'),(3,'Shahdara',_binary '');
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
  `updatedOn` timestamp NULL DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disposal`
--

LOCK TABLES `disposal` WRITE;
/*!40000 ALTER TABLE `disposal` DISABLE KEYS */;
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
INSERT INTO `head` VALUES (1,'Head 1',1,'2022-11-27 08:29:24',1),(2,'Head 2',1,'2022-11-27 08:30:26',1),(3,'Head 3',1,'2022-11-27 08:30:37',1);
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
  `photoId` int DEFAULT NULL,
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
  `updatedOn` timestamp NULL DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP,
  `isActive` bit(1) DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mud`
--

LOCK TABLES `mud` WRITE;
/*!40000 ALTER TABLE `mud` DISABLE KEYS */;
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
  `leftOn` date NOT NULL,
  `requestedBy` int NOT NULL,
  `goingAt` int NOT NULL,
  `receivedOn` date NOT NULL,
  `isReceived` bit(1) NOT NULL,
  `receivedBy` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mud` (`mudNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mudmovement`
--

LOCK TABLES `mudmovement` WRITE;
/*!40000 ALTER TABLE `mudmovement` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mudsection`
--

LOCK TABLES `mudsection` WRITE;
/*!40000 ALTER TABLE `mudsection` DISABLE KEYS */;
/*!40000 ALTER TABLE `mudsection` ENABLE KEYS */;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'SuperAdmin'),(2,'Admin');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
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
  `updatedOn` timestamp NULL DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
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
  `updatedOn` timestamp NULL DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
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
  `mudNo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uniquemud`
--

LOCK TABLES `uniquemud` WRITE;
/*!40000 ALTER TABLE `uniquemud` DISABLE KEYS */;
/*!40000 ALTER TABLE `uniquemud` ENABLE KEYS */;
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
  `departmentId` int NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `createdBy` int DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isActive` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user1` (`roleId`),
  KEY `user2` (`departmentId`),
  CONSTRAINT `user1` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`),
  CONSTRAINT `user2` FOREIGN KEY (`departmentId`) REFERENCES `department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin',1,1,'9560630130','mittal',1,'2022-11-27 08:10:37',_binary ''),(2,'SO DCP',1,2,'9871072088','mittal',1,'2022-11-27 08:11:30',_binary '');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'emalkhana'
--
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_courtname_Add`(IN id int, IN name varchar(45), IN updatedBy int)
BEGIN
IF 1 = (select EXISTS(select id from courtname where id = id)) THEN
update courtname set name = name, updatedBy = updatedBy
            WHERE id = id;
ELSE
insert into courtname (id, name,updatedBy) values (id, name,updatedBy);
        END IF;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_department_Add`(IN id int, IN name varchar(45), IN isPS bit)
BEGIN
IF 1 = (select EXISTS(select id from department where id = id)) THEN
update department set name = name, isPS = isPS
            WHERE id = id;
ELSE
insert into department (id, name,isPS) values (id, name,isPS);
        END IF;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_disposal_Add`(IN id int, IN name varchar(45), IN updatedBy int)
BEGIN
IF 1 = (select EXISTS(select id from disposal where id = id)) THEN
update disposal set name = name, updatedBy = updatedBy
            WHERE id = id;
ELSE
insert into disposal (id, name,updatedBy) values (id, name,updatedBy);
        END IF;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mudmovement_Add`(IN id int,IN mudNo int,IN currentlyAt int, IN leftOn DATE, IN requestedBy int,IN goingAt int,IN recievedOn DATE, IN isRecieved bit, IN receivedBy int)
BEGIN
IF 1 = (select EXISTS(select id from mudmovement where id = id)) THEN
update mudmovement set mudNo = mudNo, currentlyAt = currentlyAt,leftOn=leftOn,requestedBy=requestedBy,goingAt=goingAt,recievedOn=recievedOn,isRecieved=isRecieved,receivedBy=receivedBy
            WHERE id = id;
ELSE
insert into mudmovement (id, mudNo,currentlyAt,leftOn,requestedBy,goingAt,recievedOn,isRecieved,receivedBy) values (id, mudNo,currentlyAt,leftOn,requestedBy,goingAt,recievedOn,isRecieved,receivedBy);
        END IF;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mud_Add`(IN id int, IN mudNo varchar(45), IN year int, IN departmentId int, IN headId int, IN photoId int , IN seizeDate DATE, IN ioName varchar(45), IN description varchar(500), IN statusId int, IN location varchar(500), IN caseDecided bit, IN dateDecision DATE, IN courtId int, IN dateOrderDestroy DATE, IN dateDestroy DATE, IN disposalId int, IN qrCodeId int, IN updatedBy INT, IN isActive int )
BEGIN
IF 1 = (select EXISTS(select id from mud where id = id)) THEN
update mud set  mudNo = mudNo ,  year = year ,  departmentId = departmentId ,  headId = headId ,  photoId = photoId  ,  seizeDate = seizeDate ,  ioName = ioName ,  description = description ,  statusId = statusId ,  location = location ,  caseDecided = caseDecided ,  dateDecision = dateDecision ,  courtId = courtId ,  dateOrderDestroy = dateOrderDestroy ,  dateDestroy = dateDestroy ,  disposalId =disposalId ,  qrCodeId = qrCodeId,  updatedBy = updatedBy ,  isActive = isActive
            WHERE id = id;
ELSE
insert into mud (id ,  mudNo ,  year ,  departmentId ,  headId ,  photoId  ,  seizeDate ,  ioName ,  description ,  statusId ,  location ,  caseDecided ,  dateDecision ,  courtId ,  dateOrderDestroy ,  dateDestroy ,  disposalId ,  qrCodeId,  updatedBy ,  isActive) values (id ,  mudNo ,  year ,  departmentId ,  headId ,  photoId  ,  seizeDate ,  ioName ,  description ,  statusId ,  location ,  caseDecided ,  dateDecision ,  courtId ,  dateOrderDestroy ,  dateDestroy ,  disposalId ,  qrCodeId,  updatedBy ,  isActive);
        END IF;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_role_Add`(IN id int, IN name varchar(45))
BEGIN
IF 1 = (select EXISTS(select id from role where id = id)) THEN
update role set name = name
            WHERE id = id;
ELSE
insert into role (id, name) values (id, name);
        END IF;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_section_Add`(IN id int, IN name varchar(45), IN updatedBy int)
BEGIN
IF 1 = (select EXISTS(select id from section where id = id)) THEN
update section set name = name, updatedBy = updatedBy
            WHERE id = id;
ELSE
insert into section (id, name,updatedBy) values (id, name,updatedBy);
        END IF;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_status_Add`(IN id int, IN name varchar(45), IN updatedBy int)
BEGIN
IF 1 = (select EXISTS(select id from status where id = id)) THEN
update status set name = name, updatedBy = updatedBy
            WHERE id = id;
ELSE
insert into status (id, name,updatedBy) values (id, name,updatedBy);
        END IF;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_users_Add`(IN id int, IN name varchar(45), IN roleId int, IN departmentId int ,IN username varchar(45), IN password varchar(45), IN createdBy int, IN isActive bit)
BEGIN
IF 1 = (select EXISTS(select id from users where id = id)) THEN
update users set name = name, roleId = roleId,departmentId=departmentId,username=username, password = password,createdBy=createdBy,isActive=isActive
            WHERE id = id;
ELSE
insert into users (id, name,roleId,departmentId,username,password,createdBy,isActive) values (id, name,roleId,departmentId,username,password,createdBy,isActive);
        END IF;
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

-- Dump completed on 2022-11-27 14:10:03
