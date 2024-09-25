CREATE DATABASE  IF NOT EXISTS `emalkhanaprohi` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `emalkhanaprohi`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: emalkhanaprohi
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `act`
--

DROP TABLE IF EXISTS `act`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `updatedBy` int NOT NULL,
  `updatedOn` timestamp NULL DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP,
  `isActive` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=23979 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act`
--

LOCK TABLES `act` WRITE;
/*!40000 ALTER TABLE `act` DISABLE KEYS */;
INSERT INTO `act` VALUES (23975,'NDPS',1,'2024-09-21 06:29:04',1),(23976,'CRPC',1,'2024-09-21 05:53:30',1),(23977,'BNS',1,'2024-09-21 05:53:30',1),(23978,'Anti Terror Act',1,'2024-09-21 06:29:06',0);
/*!40000 ALTER TABLE `act` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_mapping`
--

DROP TABLE IF EXISTS `act_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_mapping` (
  `id` int NOT NULL AUTO_INCREMENT,
  `actId` int DEFAULT NULL,
  `actSectionId` int DEFAULT NULL,
  `isActive` int DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23985 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_mapping`
--

LOCK TABLES `act_mapping` WRITE;
/*!40000 ALTER TABLE `act_mapping` DISABLE KEYS */;
INSERT INTO `act_mapping` VALUES (23975,23975,23975,1),(23976,23975,23976,1),(23977,23975,23977,1),(23978,23975,23978,1),(23979,23976,23975,1),(23980,23977,23975,1),(23981,23977,23976,1),(23982,23977,23977,1),(23983,23977,23978,1),(23984,23977,23982,1);
/*!40000 ALTER TABLE `act_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_section`
--

DROP TABLE IF EXISTS `act_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_section` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `updatedBy` int NOT NULL,
  `updatedOn` timestamp NULL DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP,
  `isActive` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=23983 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_section`
--

LOCK TABLES `act_section` WRITE;
/*!40000 ALTER TABLE `act_section` DISABLE KEYS */;
INSERT INTO `act_section` VALUES (23975,'1',1,'2024-09-21 05:54:25',1),(23976,'2',1,'2024-09-21 05:54:25',1),(23977,'3',1,'2024-09-21 05:54:25',1),(23978,'4',1,'2024-09-21 05:54:25',1),(23979,'5',1,'2024-09-21 05:54:25',1),(23980,'6',1,'2024-09-21 05:54:25',1),(23981,'421',1,'2024-09-21 06:29:27',0),(23982,'420',1,'2024-09-21 06:29:33',1);
/*!40000 ALTER TABLE `act_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courtname`
--

DROP TABLE IF EXISTS `courtname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courtname` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `updatedBy` int NOT NULL,
  `updatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isActive` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=23976 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courtname`
--

LOCK TABLES `courtname` WRITE;
/*!40000 ALTER TABLE `courtname` DISABLE KEYS */;
INSERT INTO `courtname` VALUES (3369,'સેશન જજ',1,'2024-09-17 04:56:00',_binary ''),(3370,'એડીશનલ સેશન જજ',1,'2024-09-17 04:56:00',_binary ''),(3372,'પ્રીન્સીપાલ સીનીયર સિવિલ કોર્ટ, નવસારી',1,'2024-09-17 04:56:00',_binary ''),(3750,'ચીફ જ્યુડીશીયલ મેજીસ્ટ્રેટ',1,'2024-09-17 04:56:00',_binary ''),(4421,'બીજા એડી. ચીફ જ્યુડીશીયલ મેજીસ્ટ્રેટ',22,'2024-09-17 04:56:00',_binary ''),(5606,'ત્રીજા એડી. ચીફ જ્યુડીશીયલ મેજીસ્ટ્રેટ',1,'2024-09-17 04:56:00',_binary ''),(11027,'ચોથા એડી. ચીફ જ્યુડીશીયલ મેજીસ્ટ્રેટ',1,'2024-09-17 04:56:00',_binary ''),(11757,'એડી. સિવિલ જજ અને JMFC કોર્ટ, નવસારી',1,'2024-09-17 04:56:00',_binary ''),(12987,'એડી. ચીફ જ્યુડીશીયલ મેજીસ્ટ્રેટ, ગણદેવી',1,'2024-09-17 04:56:00',_binary ''),(13522,'બીજા એડી. ચીફ જ્યુડીશીયલ મેજીસ્ટ્રેટ, ગણદેવી',1,'2024-09-17 04:56:00',_binary ''),(13924,'એડી. ચીફ જ્યુડીશીયલ મેજીસ્ટ્રેટ, ચીખલી',1,'2024-09-17 04:56:00',_binary ''),(15479,'બીજા એડી. ચીફ જ્યુડીશીયલ મેજીસ્ટ્રેટ, ચીખલી',1,'2024-09-17 04:56:00',_binary ''),(17303,'JMFC કોર્ટ, વાંસદા',1,'2024-09-17 04:56:00',_binary ''),(17507,'JMFC કોર્ટ, ખેરગામ',1,'2024-09-17 04:56:00',_binary ''),(19297,'સ્પેશીયલ કોર્ટ, POCSO act',1,'2024-09-17 04:56:00',_binary ''),(20159,'સ્પેશીયલ કોર્ટ, NDPS act',1,'2024-09-17 04:56:00',_binary ''),(20389,'સ્પેશીયલ કોર્ટ, એટ્રોસીટી એક્ટ',1,'2024-09-17 04:56:00',_binary ''),(21046,'SDM, નવસારી',1,'2024-09-17 04:56:00',_binary ''),(21120,'SDM, ચીખલી',1,'2024-09-17 04:56:00',_binary ''),(21758,'SDM, વાંસદા',1,'2024-09-17 04:56:00',_binary ''),(22662,'DySP, નવસારી',1,'2024-09-17 04:56:00',_binary ''),(22972,'DySP, ચીખલી',1,'2024-09-17 04:56:00',_binary '');
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
  `name` varchar(500) NOT NULL,
  `isPS` bit(1) NOT NULL DEFAULT (1),
  `isActive` bit(1) NOT NULL DEFAULT b'1',
  `onEMalkhana` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'નવસારી ટાઉન',_binary '',_binary '',_binary ''),(3,'નવસારી રુરલ',_binary '',_binary '',_binary ''),(5,'જલાલપોર',_binary '',_binary '',_binary ''),(6,'વિજલપોર',_binary '',_binary '',_binary ''),(7,'મરોલી',_binary '',_binary '',_binary ''),(8,'ચીખલી',_binary '',_binary '',_binary ''),(11,'ગણદેવી',_binary '',_binary '',_binary ''),(12,'બીલીમોરા',_binary '',_binary '',_binary ''),(13,'વાંસદા',_binary '',_binary '',_binary ''),(14,'ખેરગામ',_binary '',_binary '',_binary ''),(15,'સાયબર ક્રાઈમ',_binary '',_binary '',_binary ''),(16,'DCP Office',_binary '\0',_binary '',_binary ''),(17,'Out of Delhi',_binary '',_binary '',_binary ''),(18,'Ghaziabad',_binary '',_binary '',_binary '\0');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `designation`
--

DROP TABLE IF EXISTS `designation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `designation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `updatedBy` int NOT NULL,
  `updatedOn` timestamp NULL DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP,
  `isActive` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `designation`
--

LOCK TABLES `designation` WRITE;
/*!40000 ALTER TABLE `designation` DISABLE KEYS */;
INSERT INTO `designation` VALUES (1,'LR',1,'2024-09-17 04:52:33',1),(2,'PC',1,'2024-09-19 17:37:48',1),(3,'HC',1,'2024-09-19 17:37:48',1),(4,'ASI',1,'2024-09-19 17:37:48',1),(5,'PSI',1,'2024-09-19 17:37:48',1),(6,'PI',1,'2024-09-19 17:37:48',1),(7,'DySP',1,'2024-09-19 17:37:48',1);
/*!40000 ALTER TABLE `designation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disposal`
--

DROP TABLE IF EXISTS `disposal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disposal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `updatedBy` int NOT NULL,
  `updatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isActive` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disposal`
--

LOCK TABLES `disposal` WRITE;
/*!40000 ALTER TABLE `disposal` DISABLE KEYS */;
INSERT INTO `disposal` VALUES (3,'નિકાલ ઓર્ડર બાકી',1,'2024-09-17 04:56:57',_binary ''),(4,'નાશ',1,'2024-09-17 04:56:57',_binary ''),(5,'હરાજી',11,'2024-09-17 04:56:57',_binary ''),(6,'અરજદારને પરત',1,'2024-09-18 16:17:06',_binary '');
/*!40000 ALTER TABLE `disposal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fir`
--

DROP TABLE IF EXISTS `fir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fir` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firNo` varchar(45) NOT NULL,
  `departmentId` int NOT NULL,
  `updatedBy` int NOT NULL,
  `updatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isActive` bit(1) NOT NULL DEFAULT b'1',
  `ioName` varchar(45) DEFAULT NULL,
  `year` int DEFAULT NULL,
  `firTypeID` int DEFAULT NULL,
  `courtId` int DEFAULT NULL,
  `statusId` int DEFAULT NULL,
  `caseDecided` bit(1) DEFAULT b'0',
  `dateDecision` date DEFAULT NULL,
  `firDate` date DEFAULT NULL,
  `fromWhere` varchar(100) DEFAULT NULL,
  `fromWhom` varchar(100) DEFAULT NULL,
  `proesucutingAgencyId` int DEFAULT NULL,
  `reportToCourtId` varchar(100) DEFAULT NULL,
  `reportToCourtDate` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`id`),
  KEY `departmentId_fk` (`departmentId`),
  KEY `firType_fk` (`firTypeID`),
  KEY `courtId_idx` (`courtId`),
  KEY `statusId_fk_idx` (`statusId`),
  KEY `prosecutingAgency_fk` (`proesucutingAgencyId`),
  CONSTRAINT `courtId_fk` FOREIGN KEY (`courtId`) REFERENCES `courtname` (`id`),
  CONSTRAINT `departmentId_fk` FOREIGN KEY (`departmentId`) REFERENCES `department` (`id`),
  CONSTRAINT `firType_fk` FOREIGN KEY (`firTypeID`) REFERENCES `firtype` (`id`),
  CONSTRAINT `prosecutingAgency_fk` FOREIGN KEY (`proesucutingAgencyId`) REFERENCES `prosecutingagency` (`id`),
  CONSTRAINT `statusId_fk` FOREIGN KEY (`statusId`) REFERENCES `status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23989 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fir`
--

LOCK TABLES `fir` WRITE;
/*!40000 ALTER TABLE `fir` DISABLE KEYS */;
INSERT INTO `fir` VALUES (23976,'123/24',1,1,'2024-09-23 19:14:52',_binary '\0','CT Shivansh123',2024,23975,3370,3367,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23978,'567/24',5,1,'2024-09-23 19:14:52',_binary '\0','CT Shivansh',2024,23975,3370,3367,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23979,'255',12,1,'2024-09-17 05:07:43',_binary '\0','CT Shivansh',2025,23975,3370,3367,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23980,'123/24',1,1,'2024-09-23 19:14:52',_binary '\0','CT Shivansh',2024,23975,3370,3367,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23981,'289',14,1,'2024-09-17 04:59:14',_binary '','CT Shivansh',2024,23975,21046,3367,_binary '','2024-09-10',NULL,NULL,NULL,NULL,NULL,NULL),(23982,'876',11,1,'2024-09-23 19:14:52',_binary '','Himani Chaudhary',2024,23975,3370,3367,_binary '\0','2024-09-13',NULL,NULL,NULL,NULL,NULL,NULL),(23983,'123456',1,1,'2024-09-16 06:26:52',_binary '','abc',2024,23975,3370,3367,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23984,'85',1,1,'2024-09-18 05:37:58',_binary '\0','CT Shivansh',2024,23975,3369,3367,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23985,'987654321',3,1,'2024-09-18 15:23:53',_binary '','તરુન',2024,23975,4421,3367,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23986,'2',3,1,'2024-09-23 19:14:52',_binary '','સીટી શિવાંક',2024,23975,3372,3367,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23987,'10124',1,1,'2024-09-21 10:01:15',_binary '','સીટી શિવાંક',2024,23975,3369,3367,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23988,'85698',11,1,'2024-09-23 19:24:12',_binary '','CT Shivansh',2024,23975,20389,3367,_binary '\0',NULL,'2024-09-05','sadasd','adasd',2,NULL,NULL);
/*!40000 ALTER TABLE `fir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `firsection`
--

DROP TABLE IF EXISTS `firsection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `firsection` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mudId` int NOT NULL,
  `sectionId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mudsec_idx` (`mudId`),
  KEY `mudsec1_idx` (`sectionId`),
  CONSTRAINT `mudsec` FOREIGN KEY (`mudId`) REFERENCES `fir` (`id`),
  CONSTRAINT `mudsec1` FOREIGN KEY (`sectionId`) REFERENCES `act_mapping` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29480 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `firsection`
--

LOCK TABLES `firsection` WRITE;
/*!40000 ALTER TABLE `firsection` DISABLE KEYS */;
INSERT INTO `firsection` VALUES (29470,23987,23975),(29471,23987,23978),(29472,23987,23982),(29473,23987,23983),(29478,23988,23975),(29479,23988,23978);
/*!40000 ALTER TABLE `firsection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `firtype`
--

DROP TABLE IF EXISTS `firtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `firtype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `updatedBy` int NOT NULL,
  `updatedOn` timestamp NULL DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP,
  `isActive` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=23979 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `firtype`
--

LOCK TABLES `firtype` WRITE;
/*!40000 ALTER TABLE `firtype` DISABLE KEYS */;
INSERT INTO `firtype` VALUES (23975,'FIR',1,'2024-09-12 10:20:16',1),(23976,'AD',1,'2024-09-23 19:15:06',0),(23977,'SD',1,'2024-09-23 19:15:08',0),(23978,'JJ',1,'2024-09-23 19:15:10',0);
/*!40000 ALTER TABLE `firtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fsl`
--

DROP TABLE IF EXISTS `fsl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fsl` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `updatedBy` int NOT NULL,
  `updatedOn` timestamp NULL DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP,
  `isActive` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=23978 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fsl`
--

LOCK TABLES `fsl` WRITE;
/*!40000 ALTER TABLE `fsl` DISABLE KEYS */;
INSERT INTO `fsl` VALUES (23974,'FSL, સુરત',1,'2024-09-17 04:53:22',1),(23975,'FSL, ગાંધીનગર',1,'2024-09-17 04:53:22',1),(23976,'FSL4',1,'2024-09-08 04:55:22',0),(23977,'FSL, અમદાવાદ',1,'2024-09-17 04:53:22',1);
/*!40000 ALTER TABLE `fsl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `head`
--

DROP TABLE IF EXISTS `head`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `head` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `updatedBy` int NOT NULL,
  `updatedOn` timestamp NULL DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP,
  `isActive` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=23975 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `head`
--

LOCK TABLES `head` WRITE;
/*!40000 ALTER TABLE `head` DISABLE KEYS */;
INSERT INTO `head` VALUES (3369,'Murder',1,'2022-12-23 12:28:50',1),(3370,'Arms Act',10,'2023-01-03 13:13:39',1),(3371,'Hurt',10,'2023-01-03 13:13:39',1),(3372,'Postmartum',10,'2023-01-03 13:13:39',1),(3431,'CRPC',10,'2023-01-03 13:35:52',1),(3444,'SUCIDE',10,'2023-01-03 13:35:53',1),(3446,'MV theft',10,'2023-01-03 13:35:53',1),(3449,'Excise Act',10,'2023-01-03 13:35:53',1),(3455,'Rape',10,'2023-01-03 13:35:53',1),(3456,'Gambling Act',10,'2023-01-03 13:35:53',1),(3457,'NDPS Act',10,'2023-01-03 13:35:53',1),(3466,'Dacoity',10,'2023-01-03 13:35:54',1),(3467,'Extortion',10,'2023-01-03 13:35:54',1),(3504,'EXPLOSIVE',10,'2023-01-03 13:35:56',1),(3507,'Kidnapping',10,'2023-01-03 13:35:56',1),(3518,'DV Act',10,'2023-01-03 13:35:57',1),(3520,'Riot',10,'2023-01-03 13:35:57',1),(3522,'C R ACT',10,'2023-01-03 13:35:57',1),(3540,'DOWRY ',10,'2023-01-03 13:35:57',1),(3553,'EC ACT ',10,'2023-01-03 13:35:58',1),(3555,'TM ACT ',10,'2023-01-03 13:35:58',1),(3556,'Attempt of murder ',10,'2023-01-03 13:35:58',1),(3562,'OTHER IPC',10,'2023-01-03 13:35:58',1),(3565,'TMM ACT ',10,'2023-01-03 13:35:58',1),(3566,'CBT ',10,'2023-01-03 13:35:58',1),(3592,'Burglary',10,'2023-01-03 13:35:59',1),(3604,'THEFT ',10,'2023-01-03 13:35:59',1),(3605,'OTHER ACT ',10,'2023-01-03 13:35:59',1),(3612,'Cycle theft',10,'2023-01-03 13:35:59',1),(3621,'PUBLIC NUISANCE',10,'2023-01-03 13:35:59',1),(3625,'CHEATING ',10,'2023-01-03 13:36:00',1),(3642,'102CrPC',10,'2023-01-03 13:36:00',1),(3655,'SNATHING ',10,'2023-01-03 13:36:01',1),(3665,'Accident',10,'2023-01-03 13:36:01',1),(3666,'SHOP THEFT ',10,'2023-01-03 13:36:01',1),(3678,'DM West banga Act',10,'2023-01-03 13:36:01',1),(3696,'RECOVRY',10,'2023-01-03 13:36:02',1),(3715,'',10,'2023-01-03 13:36:03',1),(3739,'NUISANCE',10,'2023-01-03 13:36:03',1),(3746,'OTHER ',10,'2023-01-03 13:36:04',1),(3769,'COPY RIGHT ACT',10,'2023-01-03 13:36:04',1),(3774,'Forgery',10,'2023-01-03 13:36:04',1),(3779,'Cruelty',10,'2023-01-03 13:36:05',1),(3786,'PM',10,'2023-01-03 13:36:05',1),(3800,'ENVIORMENT ACT',10,'2023-01-03 13:36:05',1),(3870,'Electricity Act ',10,'2023-01-03 13:36:07',1),(3871,'DP Act  ',10,'2023-01-03 13:36:07',1),(3874,'ROBERY ',10,'2023-01-03 13:36:07',1),(3882,'HOUSE THEFT ',10,'2023-01-03 13:36:07',1),(3924,'MOW',10,'2023-01-03 13:36:08',1),(3935,'Homicide',10,'2023-01-04 14:25:22',1),(3959,'Eve Teasing',10,'2023-01-04 14:28:52',1),(4182,'MV Act  ',10,'2023-01-03 13:36:15',1),(4248,'Trespass',10,'2023-01-03 13:36:17',1),(4267,'IPC',10,'2023-01-03 13:36:17',1),(4274,'INQUEST',10,'2023-01-03 13:36:18',1),(4304,'Abduction ',10,'2023-01-03 13:36:18',1),(4376,'E ACT',10,'2023-01-03 13:36:20',1),(4420,'66 DP ACT',22,'2023-01-12 10:21:23',1),(4421,'POCSO ACT',11,'2023-01-13 06:40:36',1),(4422,'2017',10,'2023-01-14 13:30:07',1),(4502,'1992',10,'2023-01-14 13:30:10',1),(4503,'1993',10,'2023-01-14 13:30:10',1),(4517,'1979',10,'2023-01-14 13:30:11',1),(4518,'1981',10,'2023-01-14 13:30:11',1),(4535,'1982',10,'2023-01-14 13:30:12',1),(4537,'1983',10,'2023-01-14 13:30:12',1),(4539,'1984',10,'2023-01-14 13:30:12',1),(4543,'2009',10,'2023-01-14 13:30:12',1),(4561,'1985',10,'2023-01-14 13:30:13',1),(4564,'1987',10,'2023-01-14 13:30:13',1),(4565,'1988',10,'2023-01-14 13:30:13',1),(4567,'2015',10,'2023-01-14 13:30:13',1),(4570,'1989',10,'2023-01-14 13:30:13',1),(4572,'2018',10,'2023-01-14 13:30:13',1),(4578,'1990',10,'2023-01-14 13:30:14',1),(4579,'1991',10,'2023-01-14 13:30:14',1),(4584,'1994',10,'2023-01-14 13:30:14',1),(4598,'1995',10,'2023-01-14 13:30:15',1),(4602,'1996',10,'2023-01-14 13:30:15',1),(4604,'2016',10,'2023-01-14 13:30:15',1),(4607,'1997',10,'2023-01-14 13:30:15',1),(4612,'2002',10,'2023-01-14 13:30:15',1),(4613,'2001',10,'2023-01-14 13:30:15',1),(4626,'2003',10,'2023-01-14 13:30:16',1),(4635,'2004',10,'2023-01-14 13:30:16',1),(4650,'2005',10,'2023-01-14 13:30:17',1),(4651,'2006',10,'2023-01-14 13:30:17',1),(4675,'2007',10,'2023-01-14 13:30:17',1),(4684,'2008',10,'2023-01-14 13:30:18',1),(4763,'2010',10,'2023-01-14 13:30:20',1),(4826,'2011',10,'2023-01-14 13:30:22',1),(4834,'2012',10,'2023-01-14 13:30:23',1),(4973,'2014',10,'2023-01-14 13:30:27',1),(5041,'2013',10,'2023-01-14 13:30:30',1),(6166,'2019',10,'2023-01-14 13:31:11',1),(6439,'2020',10,'2023-01-14 13:31:21',1),(6689,'2021',10,'2023-01-14 13:31:30',1),(6703,'2022',10,'2023-01-14 13:31:30',1),(10965,'Theft',10,'2023-01-14 13:46:48',1),(10966,'Snatching',10,'2023-01-14 13:46:48',1),(10969,'OTHER',10,'2023-01-14 13:46:48',1),(10979,'DP Act',10,'2023-01-14 13:46:48',1),(10982,'HOMUCIDE',10,'2023-01-14 13:46:48',1),(10995,'EVHECHING',10,'2023-01-14 13:46:49',1),(11020,'Cheating',10,'2023-01-14 13:46:50',1),(11039,'COPY RIGHT',10,'2023-01-14 13:46:51',1),(11041,'E C ACT',10,'2023-01-14 13:46:51',1),(11042,'ATTEMPT MURDER',10,'2023-01-14 13:46:51',1),(11049,'ATTMPT MURDER',10,'2023-01-14 13:46:52',1),(11055,'EXCISE',10,'2023-01-14 13:46:52',1),(11062,'ATTMPT MURDR',10,'2023-01-14 13:46:52',1),(11072,'ATTEMPT TO MURDER',10,'2023-01-14 13:46:53',1),(11074,'ATTMPT TO MURDER',10,'2023-01-14 13:46:53',1),(11093,'DOWRY',10,'2023-01-14 13:46:54',1),(11095,'GAMBLING ACT ',10,'2023-01-14 13:46:54',1),(11098,'OTHER IPC ',10,'2023-01-14 13:46:54',1),(11099,'CR ACT',10,'2023-01-14 13:46:54',1),(11100,'ARMS ACT ',10,'2023-01-14 13:46:54',1),(11109,'ROBBERY ',10,'2023-01-14 13:46:55',1),(11113,'MO WOMEN',10,'2023-01-14 13:46:55',1),(11115,'NDPS ACT ',10,'2023-01-14 13:46:55',1),(11117,'EC ACT',10,'2023-01-14 13:46:55',1),(11142,'EXCISE ACT ',10,'2023-01-14 13:46:56',1),(11151,'ATTEMPT TO MURDER ',10,'2023-01-14 13:46:57',1),(11179,'HURT ',10,'2023-01-14 13:46:58',1),(11180,'ATT TO MURDER',10,'2023-01-14 13:46:58',1),(11191,'O.IPC',10,'2023-01-14 13:46:59',1),(11204,' THEFT',10,'2023-01-14 13:46:59',1),(11208,'MV Act ',10,'2023-01-14 13:46:59',1),(11213,'OTHER IPIC',10,'2023-01-14 13:47:00',1),(11229,'RICOVRY',10,'2023-01-14 13:47:00',1),(11230,'M O WOMEN',10,'2023-01-14 13:47:00',1),(11240,'ROBBERY',10,'2023-01-14 13:47:01',1),(11244,'A.ACT',10,'2023-01-14 13:47:01',1),(11250,'ATT TO MURDER ',10,'2023-01-14 13:47:02',1),(11260,'CrPC ',10,'2023-01-14 13:47:02',1),(11278,'DOWERY',10,'2023-01-14 13:47:03',1),(11283,'O.ACT',10,'2023-01-14 13:47:03',1),(11304,'ATT. TO MURDER ',10,'2023-01-14 13:47:04',1),(11316,'Snatching ',10,'2023-01-14 13:47:05',1),(11342,'ATTEMT TO MURDER',10,'2023-01-14 13:47:06',1),(11363,'ELECTRICITY ACT',10,'2023-01-14 13:47:07',1),(11385,'MV ACT',10,'2023-01-14 13:47:08',1),(11386,' ',10,'2023-01-14 13:47:08',1),(11387,'DP Act ',10,'2023-01-14 13:47:08',1),(11419,'HOUSE THEFT',10,'2023-01-14 13:47:10',1),(11434,'OTHER ACT',10,'2023-01-14 13:47:11',1),(11451,'RAPE ',10,'2023-01-14 13:47:12',1),(11476,'HUMOSIDE ',10,'2023-01-14 13:47:13',1),(11477,'HUMOCIDE',10,'2023-01-14 13:47:13',1),(11500,'EVE TEACHING',10,'2023-01-14 13:47:14',1),(11632,'MO WOMEN ',10,'2023-01-14 13:47:21',1),(11661,'ROBERY',10,'2023-01-14 13:47:22',1),(11677,'DOWARY',10,'2023-01-14 13:47:23',1),(11747,'INQUIST ',10,'2023-01-14 13:47:25',1),(11748,'INQEST',10,'2023-01-14 13:47:25',1),(11754,'INQEST ',10,'2023-01-14 13:47:25',1),(11787,'GAMBLINIG ACT',10,'2023-01-14 13:47:26',1),(11790,'ARMS',10,'2023-01-14 13:47:26',1),(11806,'Gambling',10,'2023-01-14 13:47:27',1),(11847,'CR Ac t ',10,'2023-01-14 13:47:28',1),(11997,'NI Act ',10,'2023-01-14 13:47:33',1),(12024,'CPT ACT',10,'2023-01-14 13:47:34',1),(12048,'ELE. ACT',10,'2023-01-14 13:47:35',1),(12088,'Electricity Ct ',10,'2023-01-14 13:47:36',1),(12103,'CR Act ',10,'2023-01-14 13:47:37',1),(12130,'CJ ACT',10,'2023-01-14 13:47:38',1),(12204,'NIT Act ',10,'2023-01-14 13:47:40',1),(12218,'ATTMPT TO MURDR',10,'2023-01-14 13:47:41',1),(12251,'DPAct',10,'2023-01-14 13:47:42',1),(12255,'Simple Hurt',10,'2023-01-14 13:47:42',1),(12257,'NDPS',10,'2023-01-14 13:47:42',1),(12271,'IT Act',10,'2023-01-14 13:47:43',1),(12332,'HOMOCIDE',10,'2023-01-14 13:47:45',1),(12335,'ATTAMPT TO MUDER',10,'2023-01-14 13:47:45',1),(12373,'ATTMT MURDER',10,'2023-01-14 13:47:46',1),(12420,'Envirnoment Act',10,'2023-01-14 13:47:47',1),(12433,'Trade Mark',10,'2023-01-14 13:47:48',1),(12438,'A. ACT',10,'2023-01-14 13:47:48',1),(12440,'EXPLOSIVE ACT',10,'2023-01-14 13:47:48',1),(12461,'174 CRPC',10,'2023-01-14 13:47:49',1),(12517,'Half Murder',10,'2023-01-14 13:47:51',1),(12597,'Abduction',10,'2023-01-14 13:47:53',1),(12647,'M O W',10,'2023-01-14 13:47:55',1),(12650,'MOW ',10,'2023-01-14 13:47:55',1),(12654,'PERSONAL SERCH',10,'2023-01-14 13:47:55',1),(12705,'SUICIDE',10,'2023-01-14 13:47:57',1),(12720,'POCSO',10,'2023-01-14 13:47:57',1),(12742,'CR',10,'2023-01-14 13:47:58',1),(12747,'CTP Act ',10,'2023-01-14 13:47:58',1),(12758,'ATEM TO MURDER',10,'2023-01-14 13:47:58',1),(12768,'MOLESTATION',10,'2023-01-14 13:47:58',1),(12778,'SIMPALERT',10,'2023-01-14 13:47:59',1),(12805,'ADERIPC',10,'2023-01-14 13:48:00',1),(12828,'ADER IPC',10,'2023-01-14 13:48:00',1),(12869,'Gamblin Act',10,'2023-01-14 13:48:02',1),(12871,'Arms Acts',10,'2023-01-14 13:48:02',1),(12879,'DPG Act',10,'2023-01-14 13:48:02',1),(12924,'C.R ACT',10,'2023-01-14 13:48:04',1),(12955,'Forgery ',10,'2023-01-14 13:48:05',1),(12963,'Cruelty ',10,'2023-01-14 13:48:05',1),(12972,'Negligence ',10,'2023-01-14 13:48:06',1),(12987,'DOWERY ',10,'2023-01-14 13:48:06',1),(12998,'TMM ACT',10,'2023-01-14 13:48:06',1),(13018,'CTPT Act ',10,'2023-01-14 13:48:07',1),(13020,'TMA Act ',10,'2023-01-14 13:48:07',1),(13021,'DNS Act ',10,'2023-01-14 13:48:07',1),(13028,'ITP Act ',10,'2023-01-14 13:48:08',1),(13029,'Fatal ',10,'2023-01-14 13:48:08',1),(13031,'OTHER Act  ',10,'2023-01-14 13:48:08',1),(13061,'THET',10,'2023-01-14 13:48:09',1),(13071,'MV Ac t ',10,'2023-01-14 13:48:09',1),(13078,'IPC ',10,'2023-01-14 13:48:09',1),(13081,'SUCIDE ',10,'2023-01-14 13:48:09',1),(13086,'ROBBREY',10,'2023-01-14 13:48:09',1),(13153,'Eve Teasing ',10,'2023-01-14 13:48:12',1),(13163,'ROBBRY',10,'2023-01-14 13:48:12',1),(13168,'SIMPLE ACCIDENT ',10,'2023-01-14 13:48:12',1),(13180,'A ACT',10,'2023-01-14 13:48:13',1),(13198,'ITP Act',10,'2023-01-14 13:48:13',1),(13208,'BB ACT',10,'2023-01-14 13:48:14',1),(13264,'SUCIDE   ',10,'2023-01-14 13:48:15',1),(13281,'OTHER CRPC',10,'2023-01-14 13:48:16',1),(13357,'107/151',10,'2023-01-14 13:48:19',1),(13398,'ATT. TO MURDER',10,'2023-01-14 13:48:20',1),(13400,' OTHER ',10,'2023-01-14 13:48:20',1),(13413,'DOWRY DEATH',10,'2023-01-14 13:48:20',1),(13466,'Robber',10,'2023-01-14 13:48:22',1),(13507,' SNATCHING ',10,'2023-01-14 13:48:23',1),(13663,'OTHER       ',10,'2023-01-14 13:48:28',1),(13700,'MURDER ',10,'2023-01-14 13:48:29',1),(13701,'RACOVRY',10,'2023-01-14 13:48:29',1),(13753,' HURT',10,'2023-01-14 13:48:31',1),(13755,'ACCDENT',10,'2023-01-14 13:48:31',1),(13764,'498',10,'2023-01-14 13:48:31',1),(13822,'OHTER IPC ',10,'2023-01-14 13:48:33',1),(13865,'HOUSE  THEFT',10,'2023-01-14 13:48:35',1),(13928,'CR ACT  ',10,'2023-01-14 13:48:37',1),(14016,'ATTEMPT OF UNNATURAL SEX',10,'2023-01-14 13:48:39',1),(14035,'Grievous Hurt ',10,'2023-01-14 13:48:40',1),(14040,'103 DP Act ',10,'2023-01-14 13:48:40',1),(14107,'ACCIDENT ',10,'2023-01-14 13:48:42',1),(14131,'363/364',10,'2023-01-14 13:48:43',1),(14146,'E V ACT',10,'2023-01-14 13:48:43',1),(14175,'CTP ACT',10,'2023-01-14 13:48:44',1),(14195,'TOBACCO ACT',10,'2023-01-14 13:48:45',1),(14236,'COTPA',10,'2023-01-14 13:48:46',1),(14316,'HOME THEFT',10,'2023-01-14 13:48:49',1),(14322,'IT Act ',10,'2023-01-14 13:48:49',1),(14328,'OTHERS',10,'2023-02-26 13:56:54',1),(14369,'MO WOMAN',10,'2023-02-26 13:56:56',1),(15345,'ACCIDENTAL DEATH',10,'2023-02-26 13:57:36',1),(16482,'DOWROY ACT',10,'2023-02-26 13:58:13',1),(16505,'ATAMP TO MUDER',10,'2023-02-26 13:58:13',1),(16555,'ATTEMPTO MURDER',10,'2023-02-26 13:58:15',1),(16590,'DPDP ACT',10,'2023-02-26 13:58:16',1),(16643,'MOWOMAN',10,'2023-02-26 13:58:18',1),(16645,'ATTEMP TO MURDER',10,'2023-02-26 13:58:18',1),(16756,'ATTEM TO MUDER',10,'2023-02-26 13:58:21',1),(16785,'ATEMP TO MUDER',10,'2023-02-26 13:58:22',1),(16803,'WOMAN',10,'2023-02-26 13:58:22',1),(16836,'ROBEERY',10,'2023-02-26 13:58:23',1),(16847,'ENVIROMENT',10,'2023-02-26 13:58:24',1),(17046,'OTHERE',10,'2023-02-26 13:58:30',1),(17111,'INQUEAT',10,'2023-02-26 13:58:32',1),(17135,'ATEM TO MUDER',10,'2023-02-26 13:58:32',1),(17189,'376',10,'2023-02-26 13:58:34',1),(17313,'WOMEN',10,'2023-02-26 13:58:38',1),(17330,'ATTAM TO MUDER',10,'2023-02-26 13:58:38',1),(17348,'ATTEM TO MURDER',10,'2023-02-26 13:58:39',1),(18090,'1974',10,'2023-04-17 15:19:50',1),(18093,'1883',10,'2023-04-17 15:19:50',1),(18108,'1986',10,'2023-04-17 15:19:50',1),(19427,'1999',10,'2023-04-17 15:20:12',1),(19471,'Z+',10,'2023-04-17 15:20:13',1),(19511,'3013',10,'2023-04-17 15:20:13',1),(19541,'218',10,'2023-04-17 15:20:14',1),(19581,'2000',10,'2023-04-17 15:20:14',1),(19686,'1998',10,'2023-04-17 15:20:16',1),(20258,'20',10,'2023-04-17 15:20:25',1),(20728,'IMPOUND',1,'2023-04-18 17:58:02',1),(20857,'ELEC.ACT',1,'2023-04-18 17:58:05',1),(20947,'COPYRIGHT',1,'2023-04-18 17:58:07',1),(21258,'ELECTRICITY',1,'2023-04-18 17:58:13',1),(21293,'CBT',1,'2023-04-18 17:58:14',1),(21733,'QURELL',1,'2023-04-18 17:58:21',1),(21756,'ENVIRONMENT',1,'2023-04-18 17:58:22',1),(21759,'63 CR ACT',1,'2023-04-18 17:58:22',1),(22387,'DMC Act',1,'2023-04-18 17:58:32',1),(22627,'376/451/354',1,'2023-04-18 17:58:36',1),(22721,'ELEC.',1,'2023-04-18 17:58:38',1),(23014,'ELEC. ACT',1,'2023-04-18 17:58:43',1),(23342,'RACK  2009 ROOM NO. 1',1,'2023-04-18 17:58:48',1),(23637,'QUARREL',1,'2023-04-18 17:58:53',1),(23658,'QURAL',1,'2023-04-18 17:58:53',1),(23974,'જુગાર',1,'2024-09-10 12:17:46',1);
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
  `photoId` varchar(1000) DEFAULT NULL,
  `seizeDate` date DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `location` varchar(500) DEFAULT NULL,
  `dateOrderDestroy` date DEFAULT NULL,
  `dateDestroy` date DEFAULT NULL,
  `qrCodeId` int DEFAULT NULL,
  `updatedBy` int DEFAULT NULL,
  `updatedOn` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isActive` bit(1) DEFAULT b'1',
  `firId` int DEFAULT NULL,
  `receiptNo` varchar(45) DEFAULT NULL,
  `disposalId` int DEFAULT NULL,
  `txtDisposalOrderNumber` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `disposalid_fk_idx` (`disposalId`),
  CONSTRAINT `disposalid_fk` FOREIGN KEY (`disposalId`) REFERENCES `disposal` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21542 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mud`
--

LOCK TABLES `mud` WRITE;
/*!40000 ALTER TABLE `mud` DISABLE KEYS */;
INSERT INTO `mud` VALUES (21515,'2024/159/1','','2024-09-03','Ek puleenda sealed','Rack 6',NULL,NULL,NULL,1,'2024-09-13 08:11:55',_binary '\0',23978,'159',NULL,NULL),(21516,'2024/159/2','','2024-09-03','Phone','Rack 4',NULL,NULL,NULL,1,'2024-09-13 08:11:55',_binary '\0',23978,'159',NULL,NULL),(21517,'2024/159/3','','2024-09-03','Case Property','Rack 2',NULL,NULL,NULL,1,'2024-09-18 05:36:46',_binary '\0',23978,'159',3,NULL),(21518,'2024/159/1','','2024-09-02','Ek puleenda sealed','Rack 6','2024-09-03',NULL,NULL,1,'2024-09-13 08:12:29',_binary '\0',23981,'159',3,NULL),(21519,'2024/159/2','','2024-09-02','Phone','Rack 4','2024-09-12',NULL,NULL,1,'2024-09-13 08:12:29',_binary '\0',23981,'159',3,NULL),(21520,'2024/159/1','','2024-09-05','Ek puleenda sealed','Rack 6','2024-09-05',NULL,NULL,1,'2024-09-18 05:36:46',_binary '\0',23981,'159',3,NULL),(21521,'2024/159/2','','2024-09-05','Phone','Rack 4','2024-09-12',NULL,NULL,1,'2024-09-18 05:36:46',_binary '\0',23981,'159',3,NULL),(21522,'2024/198/1','','2024-09-01','Ek puleenda sealed','Rack 6','2024-09-12','2024-09-13',NULL,1,'2024-09-13 10:44:02',_binary '\0',23981,'198',3,NULL),(21523,'2024/198/2','','2024-09-01','Phone','Rack 4','2024-09-12','2024-09-13',NULL,1,'2024-09-13 10:44:02',_binary '\0',23981,'198',3,NULL),(21524,'2024/198/1','','2024-09-01','Ek puleenda sealed','Rack 6','2024-09-12','2024-09-13',NULL,1,'2024-09-13 10:44:02',_binary '',23981,'198',3,NULL),(21525,'2024/198/2','','2024-09-01','Phone','Rack 4','2024-09-12','2024-09-13',NULL,1,'2024-09-13 10:44:02',_binary '',23981,'198',3,NULL),(21526,'2024/198/3','','2024-09-01','Case Property','Rack 2','2024-09-10',NULL,NULL,1,'2024-09-13 10:44:02',_binary '',23981,'198',5,NULL),(21527,'2024/965/1','','2024-09-01','Car','Rack 6',NULL,NULL,NULL,1,'2024-09-16 05:25:38',_binary '',23982,'965',5,NULL),(21528,'2024/965/2','','2024-09-01','Phone','Backyard',NULL,NULL,NULL,1,'2024-09-16 05:25:38',_binary '',23982,'965',5,NULL),(21529,'2024/22/1','','2024-09-10','jfhd','ganesh gas agency',NULL,NULL,NULL,1,'2024-09-16 06:37:41',_binary '',23983,'22',3,NULL),(21530,'2024/22/2','','2024-09-10','sfhsd','rack 4','2024-09-02','2024-09-04',NULL,1,'2024-09-17 04:57:17',_binary '',23983,'22',5,NULL),(21531,'2024/30/1','','2024-09-13','ghd','ha',NULL,NULL,NULL,1,'2024-09-16 06:38:44',_binary '',23983,'30',5,NULL),(21532,'2024/856/1','','2024-09-05','asd','asd',NULL,NULL,NULL,1,'2024-09-16 11:56:05',_binary '\0',23982,'856',3,'8974'),(21533,'2024/856/1','','2024-09-05','asd','asd',NULL,NULL,NULL,1,'2024-09-16 11:56:05',_binary '',23982,'856',3,'8975'),(21534,'2024/૧૧/1','','2024-09-11','one stick\r\nhfsajjskdf\r\nkjac','rack 2',NULL,NULL,NULL,1,'2024-09-18 15:37:40',_binary '\0',23985,'૧૧',3,''),(21535,'2024/૧૧/2','','2024-09-11','hsddsd','racjk2',NULL,NULL,NULL,1,'2024-09-18 15:31:24',_binary '',23985,'૧૧',3,''),(21536,'2024/15/1','','2024-09-21','','',NULL,NULL,NULL,1,'2024-09-18 15:32:24',_binary '',23985,'15',3,''),(21537,'2024/૧૧/1','','2024-09-11','one stick\r\nhfsajjskdf\r\nkjac','rack 2','2024-09-23','2024-09-24',NULL,1,'2024-09-18 15:37:40',_binary '',23985,'૧૧',5,''),(21538,'2024/10265/1','','2024-09-21','','',NULL,NULL,NULL,1,'2024-09-21 10:46:30',_binary '',23987,'10265',3,''),(21539,'2024/10265/2','','2024-09-21','Pistol','Rack 2',NULL,NULL,NULL,1,'2024-09-21 10:46:30',_binary '',23987,'10265',3,''),(21540,'2024/10659/1','','2024-09-02','clothes','rack 1',NULL,NULL,NULL,1,'2024-09-21 10:51:21',_binary '',23987,'10659',3,''),(21541,'2024/10659/2','','2024-09-02','shoes','rack 2',NULL,NULL,NULL,1,'2024-09-21 10:51:32',_binary '',23987,'10659',3,'');
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
  `mudNo` varchar(50) NOT NULL,
  `currentlyAt` int DEFAULT NULL,
  `leftOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `requestedBy` int NOT NULL,
  `goingAt` int NOT NULL,
  `receivedOn` date DEFAULT NULL,
  `isReceived` bit(1) DEFAULT b'0',
  `receivedBy` int DEFAULT '0',
  `isActive` bit(1) NOT NULL DEFAULT b'1',
  `isCourt` int NOT NULL DEFAULT '0',
  `sendingVia` varchar(45) NOT NULL,
  `transfereeIdPath` varchar(450) NOT NULL,
  `sentOn` date NOT NULL,
  `designationId` int DEFAULT NULL,
  `buckleNr` varchar(45) DEFAULT NULL,
  `ackNumber` varchar(45) DEFAULT NULL,
  `ackDate` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mud` (`mudNo`),
  KEY `designationid` (`designationId`),
  CONSTRAINT `designationid` FOREIGN KEY (`designationId`) REFERENCES `designation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mudmovement`
--

LOCK TABLES `mudmovement` WRITE;
/*!40000 ALTER TABLE `mudmovement` DISABLE KEYS */;
INSERT INTO `mudmovement` VALUES (29,'21524',NULL,'2024-09-18 07:21:08',1,3369,NULL,_binary '\0',0,_binary '\0',1,'Himanshi Shekhar','','2024-09-01',1,'987589',NULL,NULL),(30,'21525',NULL,'2024-09-18 07:21:09',1,3369,NULL,_binary '\0',0,_binary '\0',1,'Himanshi Shekhar','','2024-09-01',1,'987589',NULL,NULL),(31,'2024/198/1',14,'2024-09-18 07:29:06',1,3369,NULL,_binary '\0',0,_binary '\0',1,'Himanshi Shekhar','','2024-09-17',2,'987589',NULL,NULL),(32,'2024/198/2',14,'2024-09-18 07:30:14',1,3369,'2024-09-18',_binary '',0,_binary '\0',1,'Himanshi Shekhar','','2024-09-17',2,'987589','4458/96',NULL),(33,'2024/198/1',14,'2024-09-18 07:32:16',1,23974,NULL,_binary '\0',0,_binary '\0',2,'Himanshi Shekhar','','2024-09-11',4,'987589',NULL,NULL),(34,'2024/198/2',14,'2024-09-18 07:32:17',1,23974,NULL,_binary '\0',0,_binary '\0',2,'Himanshi Shekhar','','2024-09-11',4,'987589',NULL,NULL),(35,'2024/૧૧/1',3,'2024-09-18 16:07:20',1,3372,NULL,_binary '\0',0,_binary '',1,'Himanshi Shekhar','','2024-09-20',7,'',NULL,NULL),(36,'2024/૧૧/2',3,'2024-09-18 16:07:20',1,3372,NULL,_binary '\0',0,_binary '',1,'Himanshi Shekhar','','2024-09-20',7,'',NULL,NULL),(37,'2024/15/1',3,'2024-09-18 16:07:20',1,3372,NULL,_binary '\0',0,_binary '',1,'Himanshi Shekhar','','2024-09-20',7,'',NULL,NULL),(38,'2024/198/3',14,'2024-09-18 17:05:42',1,3372,NULL,_binary '\0',0,_binary '',1,'Himanshi Shekhar','','2024-09-13',4,'987589',NULL,NULL),(39,'2024/965/1',11,'2024-09-20 16:52:37',1,0,'2024-09-20',_binary '',0,_binary '\0',2,'Himanshi Shekhar','','2024-09-20',1,'','12345',NULL),(40,'2024/965/2',11,'2024-09-20 16:53:31',1,0,'2024-09-20',_binary '',0,_binary '\0',2,'Himanshi Shekhar','','2024-09-20',1,'','a1c2k-/2024',NULL),(41,'2024/856/1',11,'2024-09-20 16:46:01',1,0,NULL,_binary '\0',0,_binary '',2,'Himanshi Shekhar','','2024-09-20',1,'',NULL,NULL),(42,'2024/10265/1',1,'2024-09-21 11:57:40',1,11757,'2024-09-21',_binary '',0,_binary '\0',1,'Himanshi Shekhar','','2024-09-21',4,'85695','ack1234',NULL),(43,'2024/10265/2',1,'2024-09-21 16:32:12',1,11757,NULL,_binary '\0',0,_binary '',1,'Himanshi Shekhar','','2024-09-21',4,'85695','96584','2024-09-21');
/*!40000 ALTER TABLE `mudmovement` ENABLE KEYS */;
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
  `isActive` bit(1) NOT NULL DEFAULT b'1',
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url_UNIQUE` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (1,'/Mud.aspx',_binary '','Mud'),(2,'/Dashboard.aspx',_binary '','Dashboard'),(3,'/MudMovement.aspx',_binary '','MudMovement'),(5,'/SearchMud.aspx',_binary '','SearchMud'),(6,'/Head.aspx',_binary '','Heads'),(7,'/Section.aspx',_binary '','Section'),(8,'/Status.aspx',_binary '','Status'),(9,'/Disposal.aspx',_binary '','Disposal'),(10,'/CourtName.aspx',_binary '','CourtName'),(11,'/MudOutOfStation.aspx',_binary '','MudOutOfStation'),(12,'/StatusWise.aspx',_binary '','StatusWise'),(13,'/HeadWise.aspx',_binary '','HeadWise'),(14,'/MudMovementWise.aspx',_binary '','MudMovementWise'),(15,'/DestroyedBetweenDates.aspx',_binary '','DestroyedBetweenDates'),(16,'/OrderNotDestroyed.aspx',_binary '','OrderNotDestroyed'),(17,'/PoliceStation.aspx',_binary '','PoliceStation'),(18,'/Users.aspx',_binary '','Users'),(19,'/Role.aspx',_binary '','Role'),(20,'/Permission.aspx',_binary '','Permission'),(21,'/RolePermission.aspx',_binary '','RolePermission'),(22,'/RCSearch.aspx',_binary '','RCSearch'),(23,'/FirSearch.aspx',_binary '','FirSearch'),(24,'/ReceiptSearch.aspx',_binary '','ReceiptSearch'),(25,'/FSL.aspx',_binary '','FSL'),(26,'/FIR.aspx',_binary '','FIR'),(27,'/FirType.aspx',_binary '','FirType'),(28,'/Receipt.aspx',_binary '','Receipt'),(29,'/Transfer.aspx',_binary '','Transfer'),(31,'/Designation.aspx',_binary '','Designation'),(32,'/Act.aspx',_binary '','Act'),(33,'/ActSection.aspx',_binary '','ActSection'),(34,'/TransferAck.aspx',_binary '','TransferAck'),(35,'/SearchMuds.aspx',_binary '','SearchMuds'),(36,'/ProsecutionAgency.aspx',_binary '','ProsecutionAgency');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prosecutingagency`
--

DROP TABLE IF EXISTS `prosecutingagency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prosecutingagency` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `updatedBy` int NOT NULL,
  `updatedOn` timestamp NULL DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP,
  `isActive` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prosecutingagency`
--

LOCK TABLES `prosecutingagency` WRITE;
/*!40000 ALTER TABLE `prosecutingagency` DISABLE KEYS */;
INSERT INTO `prosecutingagency` VALUES (1,'Police station',1,'2024-09-23 19:10:32',1),(2,'SMC',1,'2024-09-23 19:10:51',1),(3,'LCB',1,'2024-09-23 19:10:59',1),(4,'SDPO',1,'2024-09-23 19:11:06',1),(5,'Range',1,'2024-09-23 19:11:14',1),(6,'Range1',1,'2024-09-23 19:12:37',0);
/*!40000 ALTER TABLE `prosecutingagency` ENABLE KEYS */;
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
  `canEditRecords` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'SuperAdmin',_binary '',_binary ''),(2,'Admin',_binary '',_binary ''),(3,'DCP',_binary '',_binary '\0'),(4,'GP',_binary '',_binary '\0'),(5,'CP',_binary '',_binary '\0'),(6,'Demo',_binary '',_binary '');
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
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permission_mapping`
--

LOCK TABLES `role_permission_mapping` WRITE;
/*!40000 ALTER TABLE `role_permission_mapping` DISABLE KEYS */;
INSERT INTO `role_permission_mapping` VALUES (50,2,1),(51,2,2),(52,2,3),(53,2,5),(54,2,6),(55,2,7),(56,2,9),(57,2,10),(58,2,11),(59,2,13),(60,2,14),(61,2,15),(62,2,17),(63,3,1),(64,3,2),(65,3,3),(67,3,5),(68,3,6),(69,3,7),(70,3,8),(71,3,9),(72,3,10),(73,3,11),(74,3,12),(75,3,13),(76,3,14),(77,3,15),(78,3,16),(79,3,17),(80,3,18),(81,3,19),(82,3,20),(83,3,21),(105,5,1),(106,5,2),(107,5,3),(108,5,5),(109,5,6),(110,5,7),(111,5,8),(112,5,9),(113,5,10),(114,5,11),(115,5,12),(116,5,13),(117,5,14),(118,5,15),(119,5,16),(120,5,17),(121,5,22),(122,1,1),(123,1,2),(124,1,3),(125,1,5),(126,1,6),(127,1,7),(128,1,8),(129,1,9),(130,1,10),(131,1,11),(132,1,12),(133,1,13),(134,1,14),(135,1,15),(136,1,16),(137,1,17),(138,1,18),(139,1,19),(140,1,20),(141,1,21),(142,1,22),(143,1,23),(144,1,24),(145,1,25),(146,1,26),(147,1,27),(148,1,28),(153,1,29),(154,1,31),(155,1,32),(156,1,33),(157,1,34),(158,1,35),(159,1,36);
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
  `name` varchar(500) NOT NULL,
  `updatedBy` int NOT NULL,
  `updatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isActive` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=71991 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES (10106,'Special Act 123',1,'2022-12-23 12:28:27',_binary ''),(10107,'Section 420',1,'2022-12-23 12:28:35',_binary ''),(10108,'25/27/54_Arms Act',10,'2023-01-03 13:13:39',_binary ''),(10109,'411/482/34_IPC',10,'2023-01-03 13:13:39',_binary ''),(10110,'',10,'2023-01-03 13:13:39',_binary ''),(10111,'324/506_IPC',10,'2023-01-03 13:13:39',_binary ''),(10112,'_',10,'2023-01-03 13:13:39',_binary ''),(10114,'174_CrPC',10,'2023-01-03 13:13:39',_binary ''),(10120,'379/411_IPC',10,'2023-01-03 13:13:39',_binary ''),(10123,'356-379_IPC',10,'2023-01-03 13:13:39',_binary ''),(10132,'379/341/34_IPC',10,'2023-01-03 13:13:39',_binary ''),(10135,'356/379/411_IPC',10,'2023-01-03 13:13:39',_binary ''),(10288,'25/54/59_Arms Act',10,'2023-01-03 13:35:52',_binary ''),(10291,'41.1D_CrPC',10,'2023-01-03 13:35:52',_binary ''),(10294,'356-379-34_IPC',10,'2023-01-03 13:35:52',_binary ''),(10312,'66.1B_DP Act',10,'2023-01-03 13:35:53',_binary ''),(10315,'285/337_IPC',10,'2023-01-03 13:35:53',_binary ''),(10318,'66.1B _DP Act',10,'2023-01-03 13:35:53',_binary ''),(10321,'308/34_IPC',10,'2023-01-03 13:35:53',_binary ''),(10324,'102_CRPC',10,'2023-01-03 13:35:53',_binary ''),(10327,'302_IPC',10,'2023-01-03 13:35:53',_binary ''),(10336,'379/482/411/34_IPC',10,'2023-01-03 13:35:53',_binary ''),(10339,'379/411/34_IPC',10,'2023-01-03 13:35:53',_binary ''),(10342,'411_IPC',10,'2023-01-03 13:35:53',_binary ''),(10345,'33/58_Excise',10,'2023-01-03 13:35:53',_binary ''),(10354,'379/356/511/34_IPC',10,'2023-01-03 13:35:53',_binary ''),(10360,'354D/506_IPC',10,'2023-01-03 13:35:53',_binary ''),(10363,'376/377_IPC',10,'2023-01-03 13:35:53',_binary ''),(10366,'4/5_Gambling Act',10,'2023-01-03 13:35:53',_binary ''),(10369,'27/61/85_NDPS Act',10,'2023-01-03 13:35:53',_binary ''),(10372,'33_Excise',10,'2023-01-03 13:35:53',_binary ''),(10381,'12/9/55_Gambling Act',10,'2023-01-03 13:35:53',_binary ''),(10384,'379/34_IPC',10,'2023-01-03 13:35:53',_binary ''),(10390,'66_DP Act',10,'2023-01-03 13:35:53',_binary ''),(10393,'379/356/411_IPC',10,'2023-01-03 13:35:53',_binary ''),(10396,'392/397/34_IPC',10,'2023-01-03 13:35:54',_binary ''),(10399,'387/506(2)/34_IPC',10,'2023-01-03 13:35:54',_binary ''),(10414,'176_CrPC',10,'2023-01-03 13:35:54',_binary ''),(10426,'32/113_DP Act',10,'2023-01-03 13:35:54',_binary ''),(10435,'467/468/471_IPC',10,'2023-01-03 13:35:54',_binary ''),(10441,'379_IPC',10,'2023-01-03 13:35:54',_binary ''),(10444,'392/411/34_IPC',10,'2023-01-03 13:35:54',_binary ''),(10456,'307/34_IPC',10,'2023-01-03 13:35:56',_binary ''),(10457,'25/27/54/59_Arms Act',10,'2023-01-03 13:35:56',_binary ''),(10471,'406/506/34_IPC',10,'2023-01-03 13:35:56',_binary ''),(10483,'328/379/411_IPC',10,'2023-01-03 13:35:56',_binary ''),(10492,'7/10/55_C R ACT',10,'2023-01-03 13:35:56',_binary ''),(10495,'27_Arms Act',10,'2023-01-03 13:35:56',_binary ''),(10498,'7/10/55_ E C ACTS',10,'2023-01-03 13:35:56',_binary ''),(10501,'147/148/149/427/452/307_IPC',10,'2023-01-03 13:35:56',_binary ''),(10504,'61/1/14_NDPS Act',10,'2023-01-03 13:35:56',_binary ''),(10507,'25_Arms Act',10,'2023-01-03 13:35:56',_binary ''),(10510,'5_EXPLOCIVE ACT',10,'2023-01-03 13:35:56',_binary ''),(10516,'61/1/4_EXCISE ACT',10,'2023-01-03 13:35:56',_binary ''),(10519,'363_IPC',10,'2023-01-03 13:35:56',_binary ''),(10522,'307_IPC',10,'2023-01-03 13:35:56',_binary ''),(10525,'5_EXPLOSIVE ACT',10,'2023-01-03 13:35:56',_binary ''),(10534,'3/4/9/55_Gambling Act',10,'2023-01-03 13:35:57',_binary ''),(10540,'8_B D ACTS',10,'2023-01-03 13:35:57',_binary ''),(10546,'394/34_IPC',10,'2023-01-03 13:35:57',_binary ''),(10552,'498A/406_IPC',10,'2023-01-03 13:35:57',_binary ''),(10555,'61/1/14_EXCISE ACTS',10,'2023-01-03 13:35:57',_binary ''),(10558,'147/148/149/341/353_IPC',10,'2023-01-03 13:35:57',_binary ''),(10564,'63/64_C R ACTS',10,'2023-01-03 13:35:57',_binary ''),(10567,'302/34_IPC',10,'2023-01-03 13:35:57',_binary ''),(10570,'61/1/14_Excise',10,'2023-01-03 13:35:57',_binary ''),(10582,'380_IPC',10,'2023-01-03 13:35:57',_binary ''),(10585,'379/356_IPC',10,'2023-01-03 13:35:57',_binary ''),(10594,'420/406/120B_IPC',10,'2023-01-03 13:35:57',_binary ''),(10600,'27/61/85_Excise',10,'2023-01-03 13:35:57',_binary ''),(10603,'27/61/86_NDPS ACT ',10,'2023-01-03 13:35:57',_binary ''),(10606,'302_IPC ',10,'2023-01-03 13:35:57',_binary ''),(10610,'27/54/59 _ARMS ACT ',10,'2023-01-03 13:35:57',_binary ''),(10612,'21/61/85_NDPS Act ',10,'2023-01-03 13:35:57',_binary ''),(10618,'498_IPC ',10,'2023-01-03 13:35:57',_binary ''),(10624,'307/302_IPC',10,'2023-01-03 13:35:57',_binary ''),(10630,'8/14_D D ACT',10,'2023-01-03 13:35:57',_binary ''),(10651,'379_IPC ',10,'2023-01-03 13:35:58',_binary ''),(10654,'498A/406 _IPC ',10,'2023-01-03 13:35:58',_binary ''),(10657,'7/10/55_EC ACT ',10,'2023-01-03 13:35:58',_binary ''),(10660,'12/9/55 _GAMBLING ACT ',10,'2023-01-03 13:35:58',_binary ''),(10663,'78/79 _TM ACT ',10,'2023-01-03 13:35:58',_binary ''),(10666,'307 IPC_ATTEMP OF MURDER ',10,'2023-01-03 13:35:58',_binary ''),(10669,'308/34_IPC ',10,'2023-01-03 13:35:58',_binary ''),(10672,'62/63/18_CR ACT ',10,'2023-01-03 13:35:58',_binary ''),(10678,'307/324/325 _IPC',10,'2023-01-03 13:35:58',_binary ''),(10681,'308_IPC ',10,'2023-01-03 13:35:58',_binary ''),(10684,'451/308 _IPC ',10,'2023-01-03 13:35:58',_binary ''),(10690,'304_IPC ',10,'2023-01-03 13:35:58',_binary ''),(10693,'78/79_TMM ACT',10,'2023-01-03 13:35:58',_binary ''),(10696,'406_IPC ',10,'2023-01-03 13:35:58',_binary ''),(10699,'78/79_TMM ACT ',10,'2023-01-03 13:35:58',_binary ''),(10702,'452/392_IPC ',10,'2023-01-03 13:35:58',_binary ''),(10708,'307_IPC ',10,'2023-01-03 13:35:58',_binary ''),(10714,'354_IPC ',10,'2023-01-03 13:35:58',_binary ''),(10723,'377/506_IPC',10,'2023-01-03 13:35:58',_binary ''),(10724,'4/8_POCSO',10,'2023-01-03 13:35:58',_binary ''),(10726,'7/10/55_EC ACT',10,'2023-01-03 13:35:58',_binary ''),(10729,'323/307 _IPC ',10,'2023-01-03 13:35:58',_binary ''),(10732,'304A_IPC',10,'2023-01-03 13:35:58',_binary ''),(10735,'302 _IPC ',10,'2023-01-03 13:35:58',_binary ''),(10750,'292_IPC',10,'2023-01-03 13:35:58',_binary ''),(10753,'326_IPC ',10,'2023-01-03 13:35:58',_binary ''),(10762,'363/376_IPC ',10,'2023-01-03 13:35:59',_binary ''),(10765,'328/302 _IPC ',10,'2023-01-03 13:35:59',_binary ''),(10768,'411_IPC ',10,'2023-01-03 13:35:59',_binary ''),(10771,'506/34_IPC ',10,'2023-01-03 13:35:59',_binary ''),(10774,'457/380_IPC ',10,'2023-01-03 13:35:59',_binary ''),(10777,'25/54/59 _GAMBLING ACT ',10,'2023-01-03 13:35:59',_binary ''),(10780,'7/10/55_EXCISE ACT ',10,'2023-01-03 13:35:59',_binary ''),(10783,'458/506_IPC ',10,'2023-01-03 13:35:59',_binary ''),(10786,'25_ARMS ACT ',10,'2023-01-03 13:35:59',_binary ''),(10789,'498A/304B_IPC ',10,'2023-01-03 13:35:59',_binary ''),(10792,'324/34_IPC ',10,'2023-01-03 13:35:59',_binary ''),(10798,'454/380_IPC ',10,'2023-01-03 13:35:59',_binary ''),(10801,'61/1/14_EXCISE ACT ',10,'2023-01-03 13:35:59',_binary ''),(10807,'12/9/55_GAMBLING ACT ',10,'2023-01-03 13:35:59',_binary ''),(10813,'13_BOMBAY ACT  ',10,'2023-01-03 13:35:59',_binary ''),(10816,'379/411_IPC ',10,'2023-01-03 13:35:59',_binary ''),(10819,'147/148/149 _IPC ',10,'2023-01-03 13:35:59',_binary ''),(10825,'304A _IPC ',10,'2023-01-03 13:35:59',_binary ''),(10831,'379/402_IPC ',10,'2023-01-03 13:35:59',_binary ''),(10837,'420/406_IPC',10,'2023-01-03 13:35:59',_binary ''),(10840,'392/34_IPC',10,'2023-01-03 13:35:59',_binary ''),(10843,'307/34/324_IPC',10,'2023-01-03 13:35:59',_binary ''),(10852,'458/380_IPC',10,'2023-01-03 13:35:59',_binary ''),(10861,'284/337_IPC',10,'2023-01-03 13:35:59',_binary ''),(10864,'380/457_IPC',10,'2023-01-03 13:35:59',_binary ''),(10867,'457/380/411 _IPC',10,'2023-01-03 13:36:00',_binary ''),(10870,'324_IPC',10,'2023-01-03 13:36:00',_binary ''),(10873,'420 _IPC ',10,'2023-01-03 13:36:00',_binary ''),(10879,'147/198/149/186/353_IPC ',10,'2023-01-03 13:36:00',_binary ''),(10882,'302/420/34_IPC ',10,'2023-01-03 13:36:00',_binary ''),(10885,'307/323/34_IPC ',10,'2023-01-03 13:36:00',_binary ''),(10888,'186/353/332 _IPC ',10,'2023-01-03 13:36:00',_binary ''),(10894,'324/506_IPC ',10,'2023-01-03 13:36:00',_binary ''),(10897,'47/147/141/452/34_IPC ',10,'2023-01-03 13:36:00',_binary ''),(10903,'25 _ARMS ACT ',10,'2023-01-03 13:36:00',_binary ''),(10906,'376/34_IPC ',10,'2023-01-03 13:36:00',_binary ''),(10909,'419/55 _GAMBLING ACT ',10,'2023-01-03 13:36:00',_binary ''),(10912,'324 _IPC ',10,'2023-01-03 13:36:00',_binary ''),(10915,'352/307/34_IPC',10,'2023-01-03 13:36:00',_binary ''),(10918,'12/9/55 _Gambling Act',10,'2023-01-03 13:36:00',_binary ''),(10921,'399/402_IPC',10,'2023-01-03 13:36:00',_binary ''),(10930,'363/376/511/354/566_IPC',10,'2023-01-03 13:36:00',_binary ''),(10933,'457/380 _IPC',10,'2023-01-03 13:36:00',_binary ''),(10936,'186/383/356_IPC',10,'2023-01-03 13:36:00',_binary ''),(10939,'376_IPC',10,'2023-01-03 13:36:00',_binary ''),(10948,'389_IPC',10,'2023-01-03 13:36:00',_binary ''),(10951,'325_IPC',10,'2023-01-03 13:36:00',_binary ''),(10954,'364 _IPC',10,'2023-01-03 13:36:00',_binary ''),(10957,'380/411_IPC',10,'2023-01-03 13:36:01',_binary ''),(10960,'25/54/59_Gambling Act',10,'2023-01-03 13:36:01',_binary ''),(10963,'356/379/34 _IPC ',10,'2023-01-03 13:36:01',_binary ''),(10966,'239/240_IPC ',10,'2023-01-03 13:36:01',_binary ''),(10975,'186/353/336_IPC ',10,'2023-01-03 13:36:01',_binary ''),(10978,'380/411_IPC ',10,'2023-01-03 13:36:01',_binary ''),(10984,'387/506_IPC ',10,'2023-01-03 13:36:01',_binary ''),(10985,'25/27/54/59 _Arms Act',10,'2023-01-03 13:36:01',_binary ''),(10990,'324/341/34_IPC',10,'2023-01-03 13:36:01',_binary ''),(10993,'279/337_IPC ',10,'2023-01-03 13:36:01',_binary ''),(10996,'381/411_IPC ',10,'2023-01-03 13:36:01',_binary ''),(10999,'3/15_MV ACT ',10,'2023-01-03 13:36:01',_binary ''),(11009,'57/44 _EXCISE ACT ',10,'2023-01-03 13:36:01',_binary ''),(11011,'273/337_IPC ',10,'2023-01-03 13:36:01',_binary ''),(11014,'334_IPC ',10,'2023-01-03 13:36:01',_binary ''),(11020,'27_Arms Act ',10,'2023-01-03 13:36:01',_binary ''),(11026,'102_CrPC ',10,'2023-01-03 13:36:01',_binary ''),(11029,'379/34_IPC ',10,'2023-01-03 13:36:01',_binary ''),(11032,'3(1)_DM WEST BEGA ACT',10,'2023-01-03 13:36:01',_binary ''),(11041,'_NDB ACT',10,'2023-01-03 13:36:01',_binary ''),(11044,'18/6/85_NDPS Act',10,'2023-01-03 13:36:02',_binary ''),(11047,'356/371_IPC',10,'2023-01-03 13:36:02',_binary ''),(11059,'186/353/332/34_IPC',10,'2023-01-03 13:36:02',_binary ''),(11065,'354_IPC',10,'2023-01-03 13:36:02',_binary ''),(11074,'363/366/376_IPC',10,'2023-01-03 13:36:02',_binary ''),(11077,'498/406_IPC',10,'2023-01-03 13:36:02',_binary ''),(11080,'448/324_IPC',10,'2023-01-03 13:36:02',_binary ''),(11095,'397/317/34_IPC',10,'2023-01-03 13:36:02',_binary ''),(11101,'307/186/353/332/506/34_IPC',10,'2023-01-03 13:36:02',_binary ''),(11104,'27/54/59_Arms Act',10,'2023-01-03 13:36:02',_binary ''),(11110,'279/338_IPC',10,'2023-01-03 13:36:02',_binary ''),(11113,'63/65_C R ACT',10,'2023-01-03 13:36:02',_binary ''),(11122,'392/393/394_IPC',10,'2023-01-03 13:36:02',_binary ''),(11131,'452/427/323/34_IPC',10,'2023-01-03 13:36:02',_binary ''),(11146,'379/511_IPC ',10,'2023-01-03 13:36:03',_binary ''),(11164,'39 EXCISE ACT_EXCISE ACT',10,'2023-01-03 13:36:03',_binary ''),(11173,'364/302_IPC',10,'2023-01-03 13:36:03',_binary ''),(11176,'406/498A_IPC',10,'2023-01-03 13:36:03',_binary ''),(11179,'323/452_IPC',10,'2023-01-03 13:36:03',_binary ''),(11188,'147/148/149/186/353_IPC',10,'2023-01-03 13:36:03',_binary ''),(11200,'377/511_IPC',10,'2023-01-03 13:36:03',_binary ''),(11203,'392_IPC',10,'2023-01-03 13:36:03',_binary ''),(11209,'498A/304B_IPC',10,'2023-01-03 13:36:03',_binary ''),(11212,'356/379/34_IPC',10,'2023-01-03 13:36:03',_binary ''),(11221,'420/34_IPC',10,'2023-01-03 13:36:03',_binary ''),(11224,'3/1_Others',10,'2023-01-03 13:36:03',_binary ''),(11231,'41/39_E C ACT',10,'2023-01-03 13:36:03',_binary ''),(11233,'302/376_IPC',10,'2023-01-03 13:36:03',_binary ''),(11236,'_SMOK ACT',10,'2023-01-03 13:36:04',_binary ''),(11242,'147/148/186/332_IPC',10,'2023-01-03 13:36:04',_binary ''),(11248,'325/34_IPC',10,'2023-01-03 13:36:04',_binary ''),(11260,'302 _IPC',10,'2023-01-03 13:36:04',_binary ''),(11275,'452/325_IPC',10,'2023-01-03 13:36:04',_binary ''),(11281,'279/337_IPC',10,'2023-01-03 13:36:04',_binary ''),(11287,'352/308_IPC',10,'2023-01-03 13:36:04',_binary ''),(11296,'304_IPC',10,'2023-01-03 13:36:04',_binary ''),(11299,'33/69 _INDIAN FOREST ACT',10,'2023-01-03 13:36:04',_binary ''),(11305,'63/65/68 _COPY RIGHT ACT',10,'2023-01-03 13:36:04',_binary ''),(11311,'279_IPC',10,'2023-01-03 13:36:04',_binary ''),(11314,'285/304A _IPC',10,'2023-01-03 13:36:04',_binary ''),(11320,'272/273/420/418/471 _IPC',10,'2023-01-03 13:36:04',_binary ''),(11321,'63/68_CR Act',10,'2023-01-03 13:36:04',_binary ''),(11323,'356/379/34_IPC ',10,'2023-01-03 13:36:04',_binary ''),(11326,'379/356/34_IPC ',10,'2023-01-03 13:36:04',_binary ''),(11332,'467/380_IPC ',10,'2023-01-03 13:36:04',_binary ''),(11335,'498A/406/270/34 _IPC ',10,'2023-01-03 13:36:05',_binary ''),(11353,'379/7411/482/34_IPC',10,'2023-01-03 13:36:05',_binary ''),(11362,'25/54/59 _Arms Act',10,'2023-01-03 13:36:05',_binary ''),(11387,'34_IPC',10,'2023-01-03 13:36:05',_binary ''),(11392,'420_IPC',10,'2023-01-03 13:36:05',_binary ''),(11398,'5/15_ENVIORMENT ACT',10,'2023-01-03 13:36:05',_binary ''),(11417,'25/27_Arms Act',10,'2023-01-03 13:36:05',_binary ''),(11422,'363/376_IPC',10,'2023-01-03 13:36:05',_binary ''),(11434,'323/341/451/506/34_IPC',10,'2023-01-03 13:36:05',_binary ''),(11440,'392/394/397/34_IPC',10,'2023-01-03 13:36:05',_binary ''),(11452,'376/377/506_IPC',10,'2023-01-03 13:36:06',_binary ''),(11455,'380/411/34_IPC',10,'2023-01-03 13:36:06',_binary ''),(11464,'135_ELECTRICITY ACT',10,'2023-01-03 13:36:06',_binary ''),(11473,'302-307_IPC',10,'2023-01-03 13:36:06',_binary ''),(11476,'283_IPC',10,'2023-01-03 13:36:06',_binary ''),(11482,'356/379/34 _IPC',10,'2023-01-03 13:36:06',_binary ''),(11485,'380/457/411/34_IPC',10,'2023-01-03 13:36:06',_binary ''),(11491,'103_DP Act',10,'2023-01-03 13:36:06',_binary ''),(11494,'41.1D _CrPC',10,'2023-01-03 13:36:06',_binary ''),(11500,'27_NDPS Act',10,'2023-01-03 13:36:06',_binary ''),(11503,'32B/34_IPC ',10,'2023-01-03 13:36:06',_binary ''),(11506,'392/394/34_IPC ',10,'2023-01-03 13:36:06',_binary ''),(11509,'377_IPC ',10,'2023-01-03 13:36:06',_binary ''),(11510,'4_POCSO ACT ',10,'2023-01-03 13:36:06',_binary ''),(11515,'306/34_IPC ',10,'2023-01-03 13:36:06',_binary ''),(11518,'420/34_IPC ',10,'2023-01-03 13:36:06',_binary ''),(11521,'376/384/363_IPC',10,'2023-01-03 13:36:06',_binary ''),(11524,'363_IPC ',10,'2023-01-03 13:36:06',_binary ''),(11528,'27/54/59_Arms Act ',10,'2023-01-03 13:36:06',_binary ''),(11530,'207_MV Act ',10,'2023-01-03 13:36:06',_binary ''),(11536,'66_DP Act ',10,'2023-01-03 13:36:06',_binary ''),(11539,'376D/506/34_IPC ',10,'2023-01-03 13:36:06',_binary ''),(11563,'392/34_IPC ',10,'2023-01-03 13:36:07',_binary ''),(11572,'420_IPC ',10,'2023-01-03 13:36:07',_binary ''),(11578,'376_IPC ',10,'2023-01-03 13:36:07',_binary ''),(11581,'174_CrPC ',10,'2023-01-03 13:36:07',_binary ''),(11590,'392/411/34_IPC ',10,'2023-01-03 13:36:07',_binary ''),(11596,'41.1D_CrPC ',10,'2023-01-03 13:36:07',_binary ''),(11599,'420/411/34_IPC ',10,'2023-01-03 13:36:07',_binary ''),(11602,'307/34_IPC ',10,'2023-01-03 13:36:07',_binary ''),(11605,'480/411_IPC ',10,'2023-01-03 13:36:07',_binary ''),(11608,'135/138_Electricity Act ',10,'2023-01-03 13:36:07',_binary ''),(11611,'103_DP Act ',10,'2023-01-03 13:36:07',_binary ''),(11617,'308/341/34_IPC ',10,'2023-01-03 13:36:07',_binary ''),(11620,'392/411_IPC ',10,'2023-01-03 13:36:07',_binary ''),(11626,'408/411_IPC ',10,'2023-01-03 13:36:07',_binary ''),(11632,'380/34_IPC ',10,'2023-01-03 13:36:07',_binary ''),(11638,'133_CrPC ',10,'2023-01-03 13:36:07',_binary ''),(11641,'379/411/34_IPC ',10,'2023-01-03 13:36:07',_binary ''),(11644,'380_IPC ',10,'2023-01-03 13:36:07',_binary ''),(11656,'376D/506/120B _IPC ',10,'2023-01-03 13:36:07',_binary ''),(11662,'457/380/511/34_IPC ',10,'2023-01-03 13:36:08',_binary ''),(11668,'451/354A/506/34_IPC ',10,'2023-01-03 13:36:08',_binary ''),(11677,'3_DP & DP ACT ',10,'2023-01-03 13:36:08',_binary ''),(11704,'363/376 _IPC',10,'2023-01-03 13:36:08',_binary ''),(11710,'380/457/511_IPC',10,'2023-01-03 13:36:08',_binary ''),(11713,'307-34 _IPC',10,'2023-01-03 13:36:08',_binary ''),(11716,'156/353/307_IPC',10,'2023-01-03 13:36:08',_binary ''),(11722,'186/353/307_IPC',10,'2023-01-03 13:36:08',_binary ''),(11734,'107/151_CrPC',10,'2023-01-03 13:36:08',_binary ''),(11740,'452/307/323/506/427/34 _IPC',10,'2023-01-03 13:36:08',_binary ''),(11761,'107/151 _CrPC',10,'2023-01-03 13:36:08',_binary ''),(11767,'107/151 _IPC',10,'2023-01-03 13:36:08',_binary ''),(11770,'354/520/323/34 _IPC',10,'2023-01-03 13:36:08',_binary ''),(11782,'25A ACT 411_IPC',10,'2023-01-03 13:36:09',_binary ''),(11794,'207_Others',10,'2023-01-03 13:36:09',_binary ''),(11800,'353/186/332/34_IPC',10,'2023-01-03 13:36:09',_binary ''),(11803,'308_IPC',10,'2023-01-03 13:36:09',_binary ''),(11809,'394/397/34_IPC',10,'2023-01-03 13:36:09',_binary ''),(11842,'20_NDPS Act',10,'2023-01-03 13:36:09',_binary ''),(11845,'3556/379_IPC',10,'2023-01-03 13:36:09',_binary ''),(11849,'_Arms Act',10,'2023-01-03 13:36:09',_binary ''),(11863,'308/506/34_IPC',10,'2023-01-03 13:36:09',_binary ''),(11866,'302/307/323/34_IPC',10,'2023-01-03 13:36:09',_binary ''),(11869,'308/323/34_IPC',10,'2023-01-03 13:36:09',_binary ''),(11872,'336/337_IPC',10,'2023-01-03 13:36:09',_binary ''),(11875,'354/354B/323/509_IPC',10,'2023-01-03 13:36:09',_binary ''),(11881,'286/188_IPC',10,'2023-01-03 13:36:09',_binary ''),(11882,'9C/B_EXPLOSIVE ACT',10,'2023-01-03 13:36:09',_binary ''),(11884,'25/54/59_IPC',10,'2023-01-03 13:36:09',_binary ''),(11890,'279/304A _IPC',10,'2023-01-03 13:36:10',_binary ''),(11923,'379/411 _IPC',10,'2023-01-03 13:36:10',_binary ''),(11932,'279/336 /337_IPC',10,'2023-01-03 13:36:10',_binary ''),(11944,'356/379/411/34_IPC',10,'2023-01-03 13:36:10',_binary ''),(11950,'325/341/506/34_IPC',10,'2023-01-03 13:36:10',_binary ''),(11959,'325/341/506/382/411_IPC',10,'2023-01-03 13:36:10',_binary ''),(11986,'452/34_CrPC',10,'2023-01-03 13:36:10',_binary ''),(11989,'376_DP Act',10,'2023-01-03 13:36:10',_binary ''),(11995,'364/506/120B_IPC',10,'2023-01-03 13:36:10',_binary ''),(12007,'3_DELHI PROACTION ACT',10,'2023-01-03 13:36:11',_binary ''),(12010,'3_DELHI PROACTIONAL ACT',10,'2023-01-03 13:36:11',_binary ''),(12022,'323/341_IPC ',10,'2023-01-03 13:36:11',_binary ''),(12031,'308/323/341/34_IPC ',10,'2023-01-03 13:36:11',_binary ''),(12037,'394/394/34_IPC ',10,'2023-01-03 13:36:11',_binary ''),(12043,'133(B) _CrPC ',10,'2023-01-03 13:36:11',_binary ''),(12058,'326A_IPC ',10,'2023-01-03 13:36:11',_binary ''),(12064,'3 _DP & DP Act ',10,'2023-01-03 13:36:11',_binary ''),(12067,'3_DP Act ',10,'2023-01-03 13:36:11',_binary ''),(12073,'3_DP & DP Act  ',10,'2023-01-03 13:36:11',_binary ''),(12079,'376/377/388/354A_IPC ',10,'2023-01-03 13:36:11',_binary ''),(12082,'379/411/482_IPC ',10,'2023-01-03 13:36:11',_binary ''),(12094,'392/394/411_IPC ',10,'2023-01-03 13:36:11',_binary ''),(12097,'498A/406/34_IPC ',10,'2023-01-03 13:36:11',_binary ''),(12103,'207_MV ACT',10,'2023-01-03 13:36:11',_binary ''),(12130,'498A/323/506/34 _IPC',10,'2023-01-03 13:36:12',_binary ''),(12133,'6_DP Act',10,'2023-01-03 13:36:12',_binary ''),(12151,'419/468/471_IPC',10,'2023-01-03 13:36:12',_binary ''),(12154,'279/304A_IPC',10,'2023-01-03 13:36:12',_binary ''),(12160,'370/34_IPC',10,'2023-01-03 13:36:12',_binary ''),(12163,'66.1_DP Act',10,'2023-01-03 13:36:12',_binary ''),(12166,'323/341/451_IPC',10,'2023-01-03 13:36:12',_binary ''),(12172,'307/506/34_IPC',10,'2023-01-03 13:36:12',_binary ''),(12178,'323/308/341_IPC',10,'2023-01-03 13:36:12',_binary ''),(12193,'379/411/34 _IPC',10,'2023-01-03 13:36:12',_binary ''),(12196,'393/34_IPC',10,'2023-01-03 13:36:12',_binary ''),(12199,'354A/323/506/34 _IPC',10,'2023-01-03 13:36:12',_binary ''),(12200,'8_POCSO',10,'2023-01-03 13:36:12',_binary ''),(12202,'406/420/120B_IPC',10,'2023-01-03 13:36:12',_binary ''),(12211,'273-509_IPC',10,'2023-01-03 13:36:12',_binary ''),(12214,'377_IPC',10,'2023-01-03 13:36:12',_binary ''),(12215,'4_POCSO ACT',10,'2023-01-03 13:36:12',_binary ''),(12226,'63/65_COPY RIGHT ACT',10,'2023-01-03 13:36:12',_binary ''),(12244,'411/482/468/471/34_IPC ',10,'2023-01-03 13:36:13',_binary ''),(12250,'392/34/34_IPC ',10,'2023-01-03 13:36:13',_binary ''),(12253,'328/506/509_IPC',10,'2023-01-03 13:36:13',_binary ''),(12271,'354/354B/323/509/506/34_IPC ',10,'2023-01-03 13:36:13',_binary ''),(12277,'308/323_IPC ',10,'2023-01-03 13:36:13',_binary ''),(12289,'379/411/482/34_IPC',10,'2023-01-03 13:36:13',_binary ''),(12298,'448/511/373/34_IPC',10,'2023-01-03 13:36:13',_binary ''),(12319,'420/511_IPC',10,'2023-01-03 13:36:13',_binary ''),(12331,'329_IPC',10,'2023-01-03 13:36:13',_binary ''),(12343,'392/34 _IPC',10,'2023-01-03 13:36:13',_binary ''),(12358,'392/411/34 _IPC',10,'2023-01-03 13:36:13',_binary ''),(12361,'323/509/354B/34_IPC',10,'2023-01-03 13:36:14',_binary ''),(12364,'25 _Arms Act',10,'2023-01-03 13:36:14',_binary ''),(12376,'392/394/34_IPC',10,'2023-01-03 13:36:14',_binary ''),(12385,'328/376/511_Arms Act',10,'2023-01-03 13:36:14',_binary ''),(12391,'308/324/506_IPC',10,'2023-01-03 13:36:14',_binary ''),(12403,'336/285_IPC',10,'2023-01-03 13:36:14',_binary ''),(12406,'498-A_IPC',10,'2023-01-03 13:36:14',_binary ''),(12407,'306_IPC',10,'2023-01-03 13:36:14',_binary ''),(12411,'34.0',10,'2023-01-03 13:36:14',_binary ''),(12418,'186/353/332/34_IPC ',10,'2023-01-03 13:36:14',_binary ''),(12430,'392/120B/34_IPC ',10,'2023-01-03 13:36:14',_binary ''),(12433,'323/354B/34_IPC ',10,'2023-01-03 13:36:14',_binary ''),(12436,'323/341/354B/34_IPC ',10,'2023-01-03 13:36:14',_binary ''),(12439,'354/323/34_IPC ',10,'2023-01-03 13:36:14',_binary ''),(12448,'279_IPC ',10,'2023-01-03 13:36:14',_binary ''),(12454,'66.1B_DP Act ',10,'2023-01-03 13:36:14',_binary ''),(12463,'363/366/376_IPC ',10,'2023-01-03 13:36:14',_binary ''),(12472,'3/4_Gambling Act',10,'2023-01-03 13:36:15',_binary ''),(12484,'392/511/34_IPC ',10,'2023-01-03 13:36:15',_binary ''),(12487,'307/186/353/34_IPC ',10,'2023-01-03 13:36:15',_binary ''),(12496,'393/34_IPC ',10,'2023-01-03 13:36:15',_binary ''),(12499,'365/302/365_IPC ',10,'2023-01-03 13:36:15',_binary ''),(12529,'33_Delhi Excise Act ',10,'2023-01-03 13:36:15',_binary ''),(12538,'33/10_Delhi Exice Act ',10,'2023-01-03 13:36:15',_binary ''),(12547,'342/354D/365/452/376/506/34_IPC ',10,'2023-01-03 13:36:15',_binary ''),(12574,'323/341/307/34_IPC',10,'2023-01-03 13:36:15',_binary ''),(12586,'376/506_IPC ',10,'2023-01-03 13:36:15',_binary ''),(12595,'33/10_Excise',10,'2023-01-03 13:36:15',_binary ''),(12598,'356/379/411/34_IPC ',10,'2023-01-03 13:36:15',_binary ''),(12601,'328/379/34_IPC',10,'2023-01-03 13:36:16',_binary ''),(12607,'41.1D 102 _CrPC',10,'2023-01-03 13:36:16',_binary ''),(12613,'33 D _Excise',10,'2023-01-03 13:36:16',_binary ''),(12625,'336/506_IPC',10,'2023-01-03 13:36:16',_binary ''),(12652,'379/482_IPC',10,'2023-01-03 13:36:16',_binary ''),(12655,'41.1C_CrPC',10,'2023-01-03 13:36:16',_binary ''),(12664,'323/34_IPC',10,'2023-01-03 13:36:16',_binary ''),(12688,'3/7/ THE ESSENTIAL _ACT',10,'2023-01-03 13:36:16',_binary ''),(12689,'188/420/34_IPC',10,'2023-01-03 13:36:16',_binary ''),(12691,'188_IPC',10,'2023-01-03 13:36:16',_binary ''),(12692,'33/58/ D _EX ACT',10,'2023-01-03 13:36:16',_binary ''),(12700,'323/341/427_IPC',10,'2023-01-03 13:36:16',_binary ''),(12703,'376/506_IPC',10,'2023-01-03 13:36:16',_binary ''),(12704,'4 POCSO _ACT ',10,'2023-01-03 13:36:16',_binary ''),(12724,'14/148/149/427_IPC',10,'2023-01-03 13:36:17',_binary ''),(12736,'12/9/55_G. ACT',10,'2023-01-03 13:36:17',_binary ''),(12739,'379/359/411_IPC',10,'2023-01-03 13:36:17',_binary ''),(12742,'448/411_IPC',10,'2023-01-03 13:36:17',_binary ''),(12748,'498A/306/34_IPC',10,'2023-01-03 13:36:17',_binary ''),(12751,'341_IPC',10,'2023-01-03 13:36:17',_binary ''),(12754,'3(1)_DM West banga Act',10,'2023-01-03 13:36:17',_binary ''),(12766,'457/380_IPC',10,'2023-01-03 13:36:17',_binary ''),(12769,'3 DP DP ACT_',10,'2023-01-03 13:36:17',_binary ''),(12775,'429/462/468/471/120B_IPC',10,'2023-01-03 13:36:17',_binary ''),(12781,'9/10_DNS ACT',10,'2023-01-03 13:36:17',_binary ''),(12784,'25_A. ACT',10,'2023-01-03 13:36:17',_binary ''),(12787,'18/9/55_G. ACT',10,'2023-01-03 13:36:17',_binary ''),(12793,'12/9/5_Gambling Act',10,'2023-01-03 13:36:17',_binary ''),(12796,'174 CRPC_CRPC',10,'2023-01-03 13:36:17',_binary ''),(12799,'356/379/411/34 IPC_IPC',10,'2023-01-03 13:36:17',_binary ''),(12811,'23/348/355/509/34_IPC',10,'2023-01-03 13:36:17',_binary ''),(12835,'174_IPC',10,'2023-01-03 13:36:18',_binary ''),(12838,'328/376/324/506/354/34_IPC',10,'2023-01-03 13:36:18',_binary ''),(12862,'306/34_IPC',10,'2023-01-03 13:36:18',_binary ''),(12868,'356/376_IPC',10,'2023-01-03 13:36:18',_binary ''),(12877,'323/509_IPC ',10,'2023-01-03 13:36:18',_binary ''),(12889,'392/397/34_IPC ',10,'2023-01-03 13:36:18',_binary ''),(12901,'420/468/471/120B_IPC ',10,'2023-01-03 13:36:18',_binary ''),(12904,'420/506/468/471/120B_IPC ',10,'2023-01-03 13:36:18',_binary ''),(12910,'365_IPC ',10,'2023-01-03 13:36:18',_binary ''),(12916,'63/65_CR Act ',10,'2023-01-03 13:36:18',_binary ''),(12919,'279/304A_IPC ',10,'2023-01-03 13:36:18',_binary ''),(12922,'379/411/482/34_IPC ',10,'2023-01-03 13:36:18',_binary ''),(12928,'420/406/506/34_IPC ',10,'2023-01-03 13:36:18',_binary ''),(12940,'323/341/354/354A/354B/506/509/34_IPC ',10,'2023-01-03 13:36:18',_binary ''),(12967,'135_Electricity Act ',10,'2023-01-03 13:36:19',_binary ''),(12970,'342/376_IPC ',10,'2023-01-03 13:36:19',_binary ''),(12971,'6_POCSO Act ',10,'2023-01-03 13:36:19',_binary ''),(12976,'304A_IPC ',10,'2023-01-03 13:36:19',_binary ''),(12985,'354/323/509/506/34_IPC ',10,'2023-01-03 13:36:19',_binary ''),(12988,'66.1B _DP Act ',10,'2023-01-03 13:36:19',_binary ''),(13003,'186/353/332_IPC ',10,'2023-01-03 13:36:19',_binary ''),(13012,'379/467/471/34_IPC ',10,'2023-01-03 13:36:19',_binary ''),(13015,'341/354/363/316/506/509_IPC ',10,'2023-01-03 13:36:19',_binary ''),(13021,'363/365/364/302/201/34_IPC ',10,'2023-01-03 13:36:19',_binary ''),(13040,' _',10,'2023-01-03 13:36:19',_binary ''),(13057,'363/368_IPC ',10,'2023-01-03 13:36:19',_binary ''),(13069,'66B _DP Act ',10,'2023-01-03 13:36:19',_binary ''),(13081,'324/341_IPC ',10,'2023-01-03 13:36:20',_binary ''),(13084,'323/341/34_IPC ',10,'2023-01-03 13:36:20',_binary ''),(13096,'392/394/397/34_IPC ',10,'2023-01-03 13:36:20',_binary ''),(13099,'447/337/304A/34_IPC',10,'2023-01-03 13:36:20',_binary ''),(13123,'382/411/34_IPC',10,'2023-01-03 13:36:20',_binary ''),(13126,'135/150_ELASTIC ACT',10,'2023-01-03 13:36:20',_binary ''),(13129,'135_ELECT ACT',10,'2023-01-03 13:36:20',_binary ''),(13150,'288/338_IPC ',10,'2023-01-03 13:36:20',_binary ''),(13156,'33/10_Excise Act ',10,'2023-01-03 13:36:20',_binary ''),(13165,'107/151_CrPC ',10,'2023-01-03 13:36:20',_binary ''),(13171,'188_IPC ',10,'2023-01-03 13:36:20',_binary ''),(13210,'323/354/354D/34_IPC',10,'2023-01-03 13:36:20',_binary ''),(13234,'379/356/411/34_IPC',10,'2023-01-03 13:36:21',_binary ''),(13237,'420/120B_IPC',10,'2023-01-03 13:36:21',_binary ''),(13258,'458/88 IPC',12,'2023-01-04 11:39:05',_binary ''),(13259,'9/1/78 DP ACT',12,'2023-01-04 11:54:16',_binary ''),(13260,'8/18 DP ACT',12,'2023-01-05 05:37:55',_binary ''),(13261,'147/148/307 IPC',12,'2023-01-05 07:02:57',_binary ''),(13262,'20/61/85 NDPS ACT',11,'2023-01-05 14:00:19',_binary ''),(13263,'379/302 IPC',11,'2023-01-06 08:30:35',_binary ''),(13264,'450 IPC',11,'2023-01-06 08:58:24',_binary ''),(13265,'395/397 IPC',11,'2023-01-06 11:53:43',_binary ''),(13266,'399 IPC',11,'2023-01-06 12:04:07',_binary ''),(13267,'395/412 IPC',11,'2023-01-06 12:18:42',_binary ''),(13268,'54 ARMS ACT',11,'2023-01-06 12:19:08',_binary ''),(13269,'A 29/411 IPC',11,'2023-01-06 12:19:57',_binary ''),(13270,'390 IPC',11,'2023-01-06 12:32:18',_binary ''),(13271,'489 IPC',11,'2023-01-06 13:03:30',_binary ''),(13272,'325/34 IPC',11,'2023-01-06 13:03:53',_binary ''),(13273,'509 IPC',11,'2023-01-07 06:16:17',_binary ''),(13274,'357 IPC',11,'2023-01-07 06:51:58',_binary ''),(13275,'109/441 IPC',12,'2023-01-07 08:06:16',_binary ''),(13276,'234/34 IPC',12,'2023-01-07 08:18:08',_binary ''),(13277,'376/366 IPC',11,'2023-01-07 09:15:57',_binary ''),(13278,'382/34 IPC',12,'2023-01-07 13:04:59',_binary ''),(13279,'282 IPC',12,'2023-01-07 13:08:25',_binary ''),(13280,'448/380/34 IPC',12,'2023-01-07 13:25:50',_binary ''),(13281,'381 IPC',12,'2023-01-07 14:21:27',_binary ''),(13282,'18/7/58 GAMBLING ACT',12,'2023-01-08 05:41:37',_binary ''),(13283,'345 ITP ACT',12,'2023-01-08 06:01:23',_binary ''),(13284,'352/336 IPC',12,'2023-01-08 07:10:30',_binary ''),(13285,'415 IPC',12,'2023-01-08 07:15:45',_binary ''),(13286,'303/366/362 IPC',12,'2023-01-08 07:31:58',_binary ''),(13287,'365/366 IPC',12,'2023-01-08 09:49:06',_binary ''),(13288,'34 IPC',12,'2023-01-08 09:49:23',_binary ''),(13289,'409 IPC',12,'2023-01-08 12:03:31',_binary ''),(13290,'272/337 IPC',11,'2023-01-09 06:04:10',_binary ''),(13291,'376/356/323/34 IPC',11,'2023-01-09 06:04:31',_binary ''),(13292,'302/326/201/34 IPC',11,'2023-01-09 07:50:26',_binary ''),(13293,'318',11,'2023-01-10 08:19:16',_binary ''),(13294,'354/354B/354D/506/34 IPC',11,'2023-01-10 08:35:15',_binary ''),(13295,'376D/376/342/354A/506/202/34 IPC',11,'2023-01-10 10:03:19',_binary ''),(13296,'6 POCSO ACT',11,'2023-01-10 10:03:45',_binary ''),(13297,'295 IPC',11,'2023-01-11 08:31:28',_binary ''),(13298,'354/509 IPC',11,'2023-01-11 10:46:37',_binary ''),(13299,'376/354/354B/495/323/34 IPC',11,'2023-01-11 10:50:25',_binary ''),(13300,'451/506/511/34 IPC',11,'2023-01-12 12:32:19',_binary ''),(13301,'387/336/120B/34 IPC',11,'2023-01-12 12:48:43',_binary ''),(13302,'28/112 DP ACT',11,'2023-01-13 05:33:38',_binary ''),(13303,'419/420/451/467/468/471/120B IPC',11,'2023-01-13 06:06:36',_binary ''),(13304,'376/354B/323/34 IPC',11,'2023-01-13 06:34:36',_binary ''),(13305,'379/506 IPC',11,'2023-01-13 06:40:03',_binary ''),(13306,'POCSO ACT',11,'2023-01-13 06:40:14',_binary ''),(13307,'323/427/506/379/34 IPC',11,'2023-01-13 06:54:07',_binary ''),(13308,'354/354A/354B IPC',11,'2023-01-13 07:00:19',_binary ''),(13309,'354A/379/411/34 IPC',11,'2023-01-13 07:18:42',_binary ''),(13310,'384 IPC',11,'2023-01-13 07:45:02',_binary ''),(13311,'67A IT ACT',11,'2023-01-13 09:19:17',_binary ''),(13312,'65 IT ACT',11,'2023-01-13 09:19:41',_binary ''),(13313,'199A/146/196/190(2) MV ACT',11,'2023-01-13 09:45:05',_binary ''),(13314,'457/380/411/34_IPC',10,'2023-01-14 13:30:07',_binary ''),(13317,'66_D.P ACT',10,'2023-01-14 13:30:07',_binary ''),(13332,'392/411_IPC',10,'2023-01-14 13:30:07',_binary ''),(13335,'66.1_D.P ACT',10,'2023-01-14 13:30:07',_binary ''),(13347,'279/411_IPC',10,'2023-01-14 13:30:08',_binary ''),(13362,'283/291_IPC',10,'2023-01-14 13:30:08',_binary ''),(13371,'356/379/_IPC',10,'2023-01-14 13:30:08',_binary ''),(13380,'498/304B_IPC',10,'2023-01-14 13:30:08',_binary ''),(13389,'457/380/411_IPC',10,'2023-01-14 13:30:08',_binary ''),(13395,'397/34_IPC',10,'2023-01-14 13:30:08',_binary ''),(13404,'354A/354B/506/341/34_IPC',10,'2023-01-14 13:30:08',_binary ''),(13423,'25/54/59_ARMS',10,'2023-01-14 13:30:09',_binary ''),(13428,'336_IPC',10,'2023-01-14 13:30:09',_binary ''),(13431,'324/34_IPC',10,'2023-01-14 13:30:09',_binary ''),(13470,'174_OTHER',10,'2023-01-14 13:30:09',_binary ''),(13479,'354/323/42734_IPC',10,'2023-01-14 13:30:09',_binary ''),(13488,'363/376/_IPC',10,'2023-01-14 13:30:09',_binary ''),(13489,'6_POCSO ACT',10,'2023-01-14 13:30:09',_binary ''),(13506,'25/27/_ARMS ACT',10,'2023-01-14 13:30:10',_binary ''),(13524,'454/380/411_IPC',10,'2023-01-14 13:30:10',_binary ''),(13557,'307/186/337_IPC',10,'2023-01-14 13:30:10',_binary ''),(13563,'21_NDPS ACT',10,'2023-01-14 13:30:10',_binary ''),(13566,'376/506/_IPC',10,'2023-01-14 13:30:11',_binary ''),(13585,'POCSO_4',10,'2023-01-14 13:30:11',_binary ''),(13620,'302/307/34/506/34_IPC',10,'2023-01-14 13:30:11',_binary ''),(13629,'77_OTHER',10,'2023-01-14 13:30:11',_binary ''),(13630,'OTHER_',10,'2023-01-14 13:30:11',_binary ''),(13662,'9/1/78_D.P ACT',10,'2023-01-14 13:30:12',_binary ''),(13680,'OTHER_OTHER',10,'2023-01-14 13:30:12',_binary ''),(13686,'307/342_IPC',10,'2023-01-14 13:30:12',_binary ''),(13689,'363/365/376_IPC',10,'2023-01-14 13:30:12',_binary ''),(13704,'506/34_IPC',10,'2023-01-14 13:30:12',_binary ''),(13743,'406/498_IPC',10,'2023-01-14 13:30:13',_binary ''),(13755,'457/380/34_IPC',10,'2023-01-14 13:30:13',_binary ''),(13764,'12_Gambling Act',10,'2023-01-14 13:30:13',_binary ''),(13782,'356/279/411/34_IPC',10,'2023-01-14 13:30:14',_binary ''),(13809,'376/506/341_IPC',10,'2023-01-14 13:30:14',_binary ''),(13839,'3/4/5/8_ITP ACT',10,'2023-01-14 13:30:14',_binary ''),(13851,'399_IPC',10,'2023-01-14 13:30:15',_binary ''),(13863,'498/304A_IPC',10,'2023-01-14 13:30:15',_binary ''),(13869,'302/307/436/34_IPC',10,'2023-01-14 13:30:15',_binary ''),(13875,'270/304A_IPC',10,'2023-01-14 13:30:15',_binary ''),(13878,'14_F. ACT',10,'2023-01-14 13:30:15',_binary ''),(13885,'25_ARMS',10,'2023-01-14 13:30:15',_binary ''),(13896,'380/411/457/34_IPC',10,'2023-01-14 13:30:15',_binary ''),(13899,'18/61/85_NDPS ACT',10,'2023-01-14 13:30:15',_binary ''),(13905,'379/511_IPC',10,'2023-01-14 13:30:15',_binary ''),(13917,'448/341_IPC',10,'2023-01-14 13:30:16',_binary ''),(13929,'380/454/411_IPC',10,'2023-01-14 13:30:16',_binary ''),(13932,'380/454_IPC',10,'2023-01-14 13:30:16',_binary ''),(13938,'103_D.P ACT',10,'2023-01-14 13:30:16',_binary ''),(13950,'380/454/411/34_IPC',10,'2023-01-14 13:30:16',_binary ''),(13956,'3/4/5_ITP ACT',10,'2023-01-14 13:30:16',_binary ''),(13962,'323/441/34_IPC',10,'2023-01-14 13:30:16',_binary ''),(13971,'328/34_IPC',10,'2023-01-14 13:30:16',_binary ''),(13974,'354B/509_IPC',10,'2023-01-14 13:30:16',_binary ''),(14001,'452/323/586_IPC',10,'2023-01-14 13:30:17',_binary ''),(14007,'307/186/353/34_IPC',10,'2023-01-14 13:30:17',_binary ''),(14025,'20/61/85_NDPS ACT',10,'2023-01-14 13:30:17',_binary ''),(14028,'354/354A_IPC',10,'2023-01-14 13:30:17',_binary ''),(14029,'8/12_POSCO ACTR',10,'2023-01-14 13:30:17',_binary ''),(14040,'394/411/34_IPC',10,'2023-01-14 13:30:17',_binary ''),(14049,'498/406/34_IPC',10,'2023-01-14 13:30:17',_binary ''),(14050,'3/4_D P ACT',10,'2023-01-14 13:30:17',_binary ''),(14082,'279/337/304A_IPC',10,'2023-01-14 13:30:18',_binary ''),(14101,'135/138/150_ELECTRICITY ACT',10,'2023-01-14 13:30:18',_binary ''),(14115,'279/337/304_IPC',10,'2023-01-14 13:30:18',_binary ''),(14118,'379/356/34_IPC',10,'2023-01-14 13:30:18',_binary ''),(14127,'337_IPC',10,'2023-01-14 13:30:18',_binary ''),(14142,'135/138_ELECTRICITY ACT',10,'2023-01-14 13:30:18',_binary ''),(14145,'186/353/332/182_IPC',10,'2023-01-14 13:30:18',_binary ''),(14148,'341/328/34_IPC',10,'2023-01-14 13:30:18',_binary ''),(14151,'356/371/411/34_IPC',10,'2023-01-14 13:30:18',_binary ''),(14154,'365/382/411/482/34_IPC',10,'2023-01-14 13:30:18',_binary ''),(14160,'41.1/102_CrPC',10,'2023-01-14 13:30:18',_binary ''),(14169,'428_IPC',10,'2023-01-14 13:30:19',_binary ''),(14217,'287/338_IPC',10,'2023-01-14 13:30:19',_binary ''),(14223,'380/381/411/34_IPC',10,'2023-01-14 13:30:19',_binary ''),(14226,'452/354/323_IPC',10,'2023-01-14 13:30:19',_binary ''),(14229,'304/308_IPC',10,'2023-01-14 13:30:19',_binary ''),(14232,'28/54/59_ARMS ACT',10,'2023-01-14 13:30:19',_binary ''),(14241,'498A/406/34_IPC',10,'2023-01-14 13:30:19',_binary ''),(14242,'4_D.P ACT',10,'2023-01-14 13:30:19',_binary ''),(14253,'406/498A/34_IPC',10,'2023-01-14 13:30:19',_binary ''),(14256,'408_IPC',10,'2023-01-14 13:30:19',_binary ''),(14265,'379/411/34/420/468/_IPC',10,'2023-01-14 13:30:20',_binary ''),(14268,'323/324/452/427/34_IPC',10,'2023-01-14 13:30:20',_binary ''),(14280,'41.1 D_CrPC',10,'2023-01-14 13:30:20',_binary ''),(14310,'452/323/506_IPC',10,'2023-01-14 13:30:20',_binary ''),(14319,'9/3/9/50/51_WILF LIFE ACT',10,'2023-01-14 13:30:20',_binary ''),(14325,'454/380_IPC',10,'2023-01-14 13:30:20',_binary ''),(14328,'325/506_IPC',10,'2023-01-14 13:30:20',_binary ''),(14331,'326/452/34_IPC',10,'2023-01-14 13:30:20',_binary ''),(14334,'452/323/34/341/506_IPC',10,'2023-01-14 13:30:20',_binary ''),(14361,'136/307/352/353/394/395/_IPC',10,'2023-01-14 13:30:21',_binary ''),(14370,'382/341_IPC',10,'2023-01-14 13:30:21',_binary ''),(14379,'363/366/376/34_IPC',10,'2023-01-14 13:30:21',_binary ''),(14385,'326_IPC',10,'2023-01-14 13:30:21',_binary ''),(14391,'63/65_CR ACT',10,'2023-01-14 13:30:21',_binary ''),(14394,'327/379/411/34_IPC',10,'2023-01-14 13:30:21',_binary ''),(14397,'382_IPC',10,'2023-01-14 13:30:21',_binary ''),(14400,'323/323/34_IPC',10,'2023-01-14 13:30:21',_binary ''),(14403,'327/379/34_IPC',10,'2023-01-14 13:30:21',_binary ''),(14406,'379/327_IPC',10,'2023-01-14 13:30:21',_binary ''),(14409,'327/379/411_IPC',10,'2023-01-14 13:30:21',_binary ''),(14415,'394/397_IPC',10,'2023-01-14 13:30:21',_binary ''),(14424,'384/34_IPC',10,'2023-01-14 13:30:21',_binary ''),(14436,'407/120B/34_IPC',10,'2023-01-14 13:30:21',_binary ''),(14481,'392/397/307/34_IPC',10,'2023-01-14 13:30:22',_binary ''),(14487,'379/411/402_IPC',10,'2023-01-14 13:30:22',_binary ''),(14511,'384/387/411/34_IPC',10,'2023-01-14 13:30:22',_binary ''),(14547,'292/224/34_IPC',10,'2023-01-14 13:30:23',_binary ''),(14565,'376/511_IPC',10,'2023-01-14 13:30:23',_binary ''),(14574,'356/379_IPC',10,'2023-01-14 13:30:23',_binary ''),(14580,'318_IPC',10,'2023-01-14 13:30:23',_binary ''),(14592,'380/457/411_IPC',10,'2023-01-14 13:30:23',_binary ''),(14601,'302/307/34_IPC',10,'2023-01-14 13:30:23',_binary ''),(14604,'323/354/354A/354B/452/34_IPC',10,'2023-01-14 13:30:23',_binary ''),(14605,'8/12_POSCO ACT',10,'2023-01-14 13:30:23',_binary ''),(14628,'39/44/50/51/_WILF LIFE ACT',10,'2023-01-14 13:30:24',_binary ''),(14640,'363/376A/506_IPC',10,'2023-01-14 13:30:24',_binary ''),(14661,'356/382/411_IPC',10,'2023-01-14 13:30:24',_binary ''),(14664,'324/354/34_IPC',10,'2023-01-14 13:30:24',_binary ''),(14670,'364/302/120_IPC',10,'2023-01-14 13:30:24',_binary ''),(14700,'307/308/323/34_IPC',10,'2023-01-14 13:30:24',_binary ''),(14721,'365/34_IPC',10,'2023-01-14 13:30:25',_binary ''),(14742,'363/377/506/34_IPC',10,'2023-01-14 13:30:25',_binary ''),(14769,'39/49/50/51_WILF LIFE ACT',10,'2023-01-14 13:30:25',_binary ''),(14778,'21/29_NDPS ACT',10,'2023-01-14 13:30:25',_binary ''),(14781,'302/324_IPC',10,'2023-01-14 13:30:25',_binary ''),(14790,'356/379/389/411/34_IPC',10,'2023-01-14 13:30:25',_binary ''),(14802,'420-34_IPC',10,'2023-01-14 13:30:26',_binary ''),(14814,'382/411/506_IPC',10,'2023-01-14 13:30:26',_binary ''),(14821,'7/10/55_EXCISE ACT',10,'2023-01-14 13:30:26',_binary ''),(14823,'382/506/34_IPC',10,'2023-01-14 13:30:26',_binary ''),(14826,'326/34_IPC',10,'2023-01-14 13:30:26',_binary ''),(14862,'324/34/506_IPC',10,'2023-01-14 13:30:26',_binary ''),(14865,'356/379/411/_IPC',10,'2023-01-14 13:30:26',_binary ''),(14868,'3_D.P ACT',10,'2023-01-14 13:30:26',_binary ''),(14889,'308/324/341/427/506/34_IPC',10,'2023-01-14 13:30:27',_binary ''),(14895,'498A/306_IPC',10,'2023-01-14 13:30:27',_binary ''),(14970,'364A_IPC',10,'2023-01-14 13:30:27',_binary ''),(14979,'394/398/34_IPC',10,'2023-01-14 13:30:28',_binary ''),(14988,'452/323_IPC',10,'2023-01-14 13:30:28',_binary ''),(14991,'328/379_IPC',10,'2023-01-14 13:30:28',_binary ''),(14997,'39/40/42/50_WILF LIFE ACT',10,'2023-01-14 13:30:28',_binary ''),(15012,'186/353/332/451/506_IPC',10,'2023-01-14 13:30:28',_binary ''),(15066,'365/394/397/34_IPC',10,'2023-01-14 13:30:29',_binary ''),(15081,'457/382_IPC',10,'2023-01-14 13:30:29',_binary ''),(15090,'323/427/308/34_IPC',10,'2023-01-14 13:30:29',_binary ''),(15132,'323/341/34_IPC',10,'2023-01-14 13:30:29',_binary ''),(15135,'323/324/341/34_IPC',10,'2023-01-14 13:30:29',_binary ''),(15144,'328/379/411/_IPC',10,'2023-01-14 13:30:29',_binary ''),(15162,'380-411_IPC',10,'2023-01-14 13:30:30',_binary ''),(15165,'380/41_IPC',10,'2023-01-14 13:30:30',_binary ''),(15168,'323/324/34_IPC',10,'2023-01-14 13:30:30',_binary ''),(15189,'354/323_IPC',10,'2023-01-14 13:30:30',_binary ''),(15195,'379/511/34_IPC',10,'2023-01-14 13:30:30',_binary ''),(15222,'304/397_IPC',10,'2023-01-14 13:30:30',_binary ''),(15228,'4/6/_POCSO ACT',10,'2023-01-14 13:30:30',_binary ''),(15231,'150/135_ELECTRICITY ACT',10,'2023-01-14 13:30:30',_binary ''),(15240,'420/468/471/34_IPC',10,'2023-01-14 13:30:31',_binary ''),(15288,'41.1_CrPC',10,'2023-01-14 13:30:31',_binary ''),(15303,'20/25/61_NDPS ACT',10,'2023-01-14 13:30:31',_binary ''),(15306,'366/376_IPC',10,'2023-01-14 13:30:31',_binary ''),(15327,'376(2)(1)_IPC',10,'2023-01-14 13:30:32',_binary ''),(15339,'439/497/34_IPC',10,'2023-01-14 13:30:32',_binary ''),(15345,'376/363_IPC',10,'2023-01-14 13:30:32',_binary ''),(15351,'498A_IPC',10,'2023-01-14 13:30:32',_binary ''),(15390,'376D/342/450/506/_IPC',10,'2023-01-14 13:30:32',_binary ''),(15391,'6_POCSO',10,'2023-01-14 13:30:32',_binary ''),(15393,'337/279_IPC',10,'2023-01-14 13:30:32',_binary ''),(15399,'420/411_IPC',10,'2023-01-14 13:30:32',_binary ''),(15447,'326B-34_IPC',10,'2023-01-14 13:30:33',_binary ''),(15450,'323/341_IPC',10,'2023-01-14 13:30:33',_binary ''),(15489,'341/323_IPC',10,'2023-01-14 13:30:33',_binary ''),(15495,'354/380_IPC',10,'2023-01-14 13:30:33',_binary ''),(15504,'382/392/411_IPC',10,'2023-01-14 13:30:33',_binary ''),(15513,'354A,B,D/452/506/509_IPC',10,'2023-01-14 13:30:34',_binary ''),(15540,'186/353/332/_IPC',10,'2023-01-14 13:30:34',_binary ''),(15570,'323/324_IPC',10,'2023-01-14 13:30:34',_binary ''),(15594,'377/342_IPC',10,'2023-01-14 13:30:35',_binary ''),(15603,'392/341/411_IPC',10,'2023-01-14 13:30:35',_binary ''),(15612,'14/149/285/506/354A_IPC',10,'2023-01-14 13:30:35',_binary ''),(15634,'63/65_COPY RIGHT',10,'2023-01-14 13:30:35',_binary ''),(15642,'325/341/34_IPC',10,'2023-01-14 13:30:35',_binary ''),(15651,'380/458/511_IPC',10,'2023-01-14 13:30:35',_binary ''),(15711,'365/342/324_IPC',10,'2023-01-14 13:30:36',_binary ''),(15723,'392/394_IPC',10,'2023-01-14 13:30:36',_binary ''),(15744,'342/323/506_IPC',10,'2023-01-14 13:30:36',_binary ''),(15753,'279/304_IPC',10,'2023-01-14 13:30:36',_binary ''),(15762,'451/354/509_IPC',10,'2023-01-14 13:30:36',_binary ''),(15765,'454/382/411_IPC',10,'2023-01-14 13:30:37',_binary ''),(15771,'354/34_IPC',10,'2023-01-14 13:30:37',_binary ''),(15777,'354A/506_IPC',10,'2023-01-14 13:30:37',_binary ''),(15786,'392/397_IPC',10,'2023-01-14 13:30:37',_binary ''),(15792,'12/9/55_Excise',10,'2023-01-14 13:30:37',_binary ''),(15813,'406_IPC',10,'2023-01-14 13:30:37',_binary ''),(15822,'186/353/332/147/_IPC',10,'2023-01-14 13:30:37',_binary ''),(15843,'392/397/452/34_IPC',10,'2023-01-14 13:30:37',_binary ''),(15861,'186/353/332/147/48/49_IPC',10,'2023-01-14 13:30:38',_binary ''),(15867,'379/411/482_IPC',10,'2023-01-14 13:30:38',_binary ''),(15870,'186/353_IPC',10,'2023-01-14 13:30:38',_binary ''),(15879,'379/411/482/347_IPC',10,'2023-01-14 13:30:38',_binary ''),(15903,'452/380/411_IPC',10,'2023-01-14 13:30:38',_binary ''),(15918,'384/385_IPC',10,'2023-01-14 13:30:38',_binary ''),(15954,'147/148/149_IPC',10,'2023-01-14 13:30:39',_binary ''),(15966,'342/376_IPC',10,'2023-01-14 13:30:39',_binary ''),(15969,'7/10/59_ELECTRICITY ACT',10,'2023-01-14 13:30:39',_binary ''),(15972,'7/10/55_ELECTRICITY ACT',10,'2023-01-14 13:30:39',_binary ''),(15978,'498A/304_IPC',10,'2023-01-14 13:30:39',_binary ''),(16029,'155A/295A/34_IPC',10,'2023-01-14 13:30:39',_binary ''),(16035,'287/304A_IPC',10,'2023-01-14 13:30:40',_binary ''),(16050,'323/354_IPC',10,'2023-01-14 13:30:40',_binary ''),(16065,'452/392/397/509/354A/506/34_IPC',10,'2023-01-14 13:30:40',_binary ''),(16092,'342/506_IPC',10,'2023-01-14 13:30:40',_binary ''),(16093,'4_POSCO ACT',10,'2023-01-14 13:30:40',_binary ''),(16104,'376/384/109/34_IPC',10,'2023-01-14 13:30:40',_binary ''),(16131,'354/506_IPC',10,'2023-01-14 13:30:41',_binary ''),(16134,'435_IPC',10,'2023-01-14 13:30:41',_binary ''),(16167,'186/353/332_IPC',10,'2023-01-14 13:30:41',_binary ''),(16173,'392/394/411/34_IPC',10,'2023-01-14 13:30:41',_binary ''),(16176,'392/397/330/34_IPC',10,'2023-01-14 13:30:41',_binary ''),(16224,'364A/34_IPC',10,'2023-01-14 13:30:42',_binary ''),(16236,'186/332/353_IPC',10,'2023-01-14 13:30:42',_binary ''),(16275,'354A/354B/509_IPC',10,'2023-01-14 13:30:42',_binary ''),(16284,'376/323/506_IPC',10,'2023-01-14 13:30:42',_binary ''),(16293,'376/420/34_IPC',10,'2023-01-14 13:30:42',_binary ''),(16296,'153A_IPC',10,'2023-01-14 13:30:42',_binary ''),(16305,'374/341/34_IPC',10,'2023-01-14 13:30:43',_binary ''),(16332,'15_NDPS ACT',10,'2023-01-14 13:30:43',_binary ''),(16335,'394/411_IPC',10,'2023-01-14 13:30:43',_binary ''),(16338,'354/323/34_IPC',10,'2023-01-14 13:30:43',_binary ''),(16353,'63_CR ACT',10,'2023-01-14 13:30:43',_binary ''),(16374,'374_IPC',10,'2023-01-14 13:30:43',_binary ''),(16392,'354/182/353/180_IPC',10,'2023-01-14 13:30:43',_binary ''),(16410,'392/397/307/411_IPC',10,'2023-01-14 13:30:44',_binary ''),(16428,'376/313/506_IPC',10,'2023-01-14 13:30:44',_binary ''),(16434,'147/148/149/308_IPC',10,'2023-01-14 13:30:44',_binary ''),(16443,'392/482/411_IPC',10,'2023-01-14 13:30:44',_binary ''),(16449,'186/350_IPC',10,'2023-01-14 13:30:44',_binary ''),(16455,'328/323/_IPC',10,'2023-01-14 13:30:44',_binary ''),(16488,'363/366_IPC',10,'2023-01-14 13:30:45',_binary ''),(16518,'354/323/506/509/_IPC',10,'2023-01-14 13:30:45',_binary ''),(16548,'323/324/424/454_IPC',10,'2023-01-14 13:30:45',_binary ''),(16581,'323/365/376/328/34_IPC',10,'2023-01-14 13:30:46',_binary ''),(16653,'308/452_IPC',10,'2023-01-14 13:30:46',_binary ''),(16683,'186/170/171_IPC',10,'2023-01-14 13:30:47',_binary ''),(16695,'376/328_IPC',10,'2023-01-14 13:30:47',_binary ''),(16701,'12_POCSO ACT',10,'2023-01-14 13:30:47',_binary ''),(16707,'381/411_IPC',10,'2023-01-14 13:30:47',_binary ''),(16717,'2_POSCO ACT',10,'2023-01-14 13:30:47',_binary ''),(16725,'356/376/328_IPC',10,'2023-01-14 13:30:47',_binary ''),(16743,'306/379/411_IPC',10,'2023-01-14 13:30:47',_binary ''),(16749,'336/379_IPC',10,'2023-01-14 13:30:48',_binary ''),(16758,'392/397/411_IPC',10,'2023-01-14 13:30:48',_binary ''),(16779,'448/380/34_IPC',10,'2023-01-14 13:30:48',_binary ''),(16782,'328/420/34_IPC',10,'2023-01-14 13:30:48',_binary ''),(16794,'365/376_IPC',10,'2023-01-14 13:30:48',_binary ''),(16803,'392/379/34_IPC',10,'2023-01-14 13:30:48',_binary ''),(16815,'328/308/56_IPC',10,'2023-01-14 13:30:48',_binary ''),(16818,'4/5/12_Gambling Act',10,'2023-01-14 13:30:48',_binary ''),(16851,'420/120/34_IPC',10,'2023-01-14 13:30:49',_binary ''),(16858,'411/34_IPC',10,'2023-01-14 13:30:49',_binary ''),(16859,'102',10,'2023-01-14 13:30:49',_binary ''),(16866,'307/323/34_IPC',10,'2023-01-14 13:30:49',_binary ''),(16896,'457/380/511_IPC',10,'2023-01-14 13:30:49',_binary ''),(16908,'381/411/34_IPC',10,'2023-01-14 13:30:49',_binary ''),(16917,'354A/509_IPC',10,'2023-01-14 13:30:49',_binary ''),(16936,'23_JJ ACT',10,'2023-01-14 13:30:50',_binary ''),(16950,'307/324_IPC',10,'2023-01-14 13:30:50',_binary ''),(16953,'336/506/34_IPC',10,'2023-01-14 13:30:50',_binary ''),(16968,'506/195A_IPC',10,'2023-01-14 13:30:50',_binary ''),(16992,'457_IPC',10,'2023-01-14 13:30:50',_binary ''),(17001,'377/376/354_IPC',10,'2023-01-14 13:30:50',_binary ''),(17004,'376/354_IPC',10,'2023-01-14 13:30:50',_binary ''),(17049,'354B/323/34_IPC',10,'2023-01-14 13:30:51',_binary ''),(17061,'170_IPC',10,'2023-01-14 13:30:51',_binary ''),(17064,'188/488_IPC',10,'2023-01-14 13:30:51',_binary ''),(17070,'323/452/354/354B/34_IPC',10,'2023-01-14 13:30:51',_binary ''),(17094,'451/354_IPC',10,'2023-01-14 13:30:51',_binary ''),(17100,'307/356_IPC',10,'2023-01-14 13:30:52',_binary ''),(17103,'376/363/354A_IPC',10,'2023-01-14 13:30:52',_binary ''),(17118,'380/454/511_IPC',10,'2023-01-14 13:30:52',_binary ''),(17133,'295/295A/153A_IPC',10,'2023-01-14 13:30:52',_binary ''),(17142,'319/420/34_IPC',10,'2023-01-14 13:30:52',_binary ''),(17145,'354/354A/34_IPC',10,'2023-01-14 13:30:52',_binary ''),(17151,'377/506/34_IPC',10,'2023-01-14 13:30:52',_binary ''),(17160,'452/354B/427_IPC',10,'2023-01-14 13:30:52',_binary ''),(17166,'354/354B_IPC',10,'2023-01-14 13:30:52',_binary ''),(17172,'452/308/506_IPC',10,'2023-01-14 13:30:52',_binary ''),(17184,'452/506/34_IPC',10,'2023-01-14 13:30:52',_binary ''),(17199,'354/354AB_IPC',10,'2023-01-14 13:30:53',_binary ''),(17250,'498/306/34_IPC',10,'2023-01-14 13:30:53',_binary ''),(17256,'354B/34_IPC',10,'2023-01-14 13:30:53',_binary ''),(17265,'354A/354D/509_IPC',10,'2023-01-14 13:30:53',_binary ''),(17286,'376.2.F.I_IPC',10,'2023-01-14 13:30:54',_binary ''),(17295,'354/354B/34_IPC',10,'2023-01-14 13:30:54',_binary ''),(17298,'376D/363/34_IPC',10,'2023-01-14 13:30:54',_binary ''),(17299,'4_POSCO',10,'2023-01-14 13:30:54',_binary ''),(17319,'363/377/506_IPC',10,'2023-01-14 13:30:54',_binary ''),(17343,'341/224/34_IPC',10,'2023-01-14 13:30:54',_binary ''),(17361,'356/379/511/34_IPC',10,'2023-01-14 13:30:54',_binary ''),(17379,'133_CrPC',10,'2023-01-14 13:30:55',_binary ''),(17386,'_POSCO ACT',10,'2023-01-14 13:30:55',_binary ''),(17409,'354/354B/323_IPC',10,'2023-01-14 13:30:55',_binary ''),(17424,'308/354A/34_IPC',10,'2023-01-14 13:30:55',_binary ''),(17425,'12_POSCO',10,'2023-01-14 13:30:55',_binary ''),(17427,'387/34_IPC',10,'2023-01-14 13:30:55',_binary ''),(17442,'354B/354D/506/509/34_IPC',10,'2023-01-14 13:30:55',_binary ''),(17448,'354B/427/452/34_IPC',10,'2023-01-14 13:30:55',_binary ''),(17451,'363/377/511_IPC',10,'2023-01-14 13:30:55',_binary ''),(17452,'6_POPSCO',10,'2023-01-14 13:30:55',_binary ''),(17478,'326A_IPC',10,'2023-01-14 13:30:56',_binary ''),(17502,'397/506_IPC',10,'2023-01-14 13:30:56',_binary ''),(17506,'506_IPC',10,'2023-01-14 13:30:56',_binary ''),(17529,'100_D.P ACT',10,'2023-01-14 13:30:56',_binary ''),(17535,'354B/509B/323/34_IPC',10,'2023-01-14 13:30:56',_binary ''),(17541,'376/328/506_IPC',10,'2023-01-14 13:30:56',_binary ''),(17553,'354A/B/451/376/511_IPC',10,'2023-01-14 13:30:57',_binary ''),(17562,'308/186/353/147/149_IPC',10,'2023-01-14 13:30:57',_binary ''),(17565,'451/354A/B/323/509_IPC',10,'2023-01-14 13:30:57',_binary ''),(17568,'304/336_IPC',10,'2023-01-14 13:30:57',_binary ''),(17577,'356/379/411/345_IPC',10,'2023-01-14 13:30:57',_binary ''),(17580,'3/4/12/9_Gambling Act',10,'2023-01-14 13:30:57',_binary ''),(17601,'341/324/506/34_IPC',10,'2023-01-14 13:30:57',_binary ''),(17604,'376/323/451_IPC',10,'2023-01-14 13:30:57',_binary ''),(17628,'365/360/34_IPC',10,'2023-01-14 13:30:57',_binary ''),(17646,'308/354A/354B/34_IPC',10,'2023-01-14 13:30:58',_binary ''),(17658,'307/452/506_IPC',10,'2023-01-14 13:30:58',_binary ''),(17715,'480/379_IPC',10,'2023-01-14 13:30:58',_binary ''),(17721,'324/341/506/34_IPC',10,'2023-01-14 13:30:58',_binary ''),(17727,'365/376/343/109/34_IPC',10,'2023-01-14 13:30:59',_binary ''),(17739,'498A/304B/34_IPC',10,'2023-01-14 13:30:59',_binary ''),(17742,'323/324/341/308/34_IPC',10,'2023-01-14 13:30:59',_binary ''),(17754,'498A/34_IPC',10,'2023-01-14 13:30:59',_binary ''),(17755,'4_DP ACT',10,'2023-01-14 13:30:59',_binary ''),(17757,'323/186/353/34_IPC',10,'2023-01-14 13:30:59',_binary ''),(17760,'354A/354D/506/4714_IPC',10,'2023-01-14 13:30:59',_binary ''),(17763,'379/482/411_IPC',10,'2023-01-14 13:30:59',_binary ''),(17778,'323/308/427_IPC',10,'2023-01-14 13:30:59',_binary ''),(17787,'452/308/34_IPC',10,'2023-01-14 13:30:59',_binary ''),(17811,'354/354B/323/341_IPC',10,'2023-01-14 13:30:59',_binary ''),(17815,'103/104_S M ACT',10,'2023-01-14 13:30:59',_binary ''),(17820,'28/61/85_NDPS ACT',10,'2023-01-14 13:31:00',_binary ''),(17835,'336/34_IPC',10,'2023-01-14 13:31:00',_binary ''),(17853,'379/41_IPC',10,'2023-01-14 13:31:00',_binary ''),(17901,'307/336_IPC',10,'2023-01-14 13:31:01',_binary ''),(17937,'498/380/511/34_IPC',10,'2023-01-14 13:31:01',_binary ''),(17976,'354A/354B/323/509_IPC',10,'2023-01-14 13:31:02',_binary ''),(18000,'342/324/354B/452/34_IPC',10,'2023-01-14 13:31:02',_binary ''),(18009,'323/341/354B/34_IPC',10,'2023-01-14 13:31:03',_binary ''),(18012,'232/354/354B/452/34_IPC',10,'2023-01-14 13:31:03',_binary ''),(18015,'392/41_IPC',10,'2023-01-14 13:31:03',_binary ''),(18030,'304A/337/279_IPC',10,'2023-01-14 13:31:03',_binary ''),(18033,'379/411/482/341_IPC',10,'2023-01-14 13:31:03',_binary ''),(18051,'392/397/411/34_IPC',10,'2023-01-14 13:31:03',_binary ''),(18055,'102 CRPC_',10,'2023-01-14 13:31:03',_binary ''),(18063,'307/452/34_IPC',10,'2023-01-14 13:31:03',_binary ''),(18081,'354A/B_IPC',10,'2023-01-14 13:31:04',_binary ''),(18090,'323/354/354B/341_IPC',10,'2023-01-14 13:31:04',_binary ''),(18111,'393/397_IPC',10,'2023-01-14 13:31:04',_binary ''),(18120,'354B/308_IPC',10,'2023-01-14 13:31:04',_binary ''),(18135,'323/342/384/389/34_IPC',10,'2023-01-14 13:31:05',_binary ''),(18138,'457/392/397/342/34_IPC',10,'2023-01-14 13:31:05',_binary ''),(18150,'_IPC',10,'2023-01-14 13:31:05',_binary ''),(18162,'393/341_IPC',10,'2023-01-14 13:31:05',_binary ''),(18174,'454/380/411/34_IPC',10,'2023-01-14 13:31:05',_binary ''),(18189,'186/353/308/34_IPC',10,'2023-01-14 13:31:05',_binary ''),(18198,'30/58_EXCISE',10,'2023-01-14 13:31:06',_binary ''),(18204,'186/353/324/34_IPC',10,'2023-01-14 13:31:06',_binary ''),(18261,'364A/506/384/34_IPC',10,'2023-01-14 13:31:07',_binary ''),(18286,'6_POSCO ACT',10,'2023-01-14 13:31:07',_binary ''),(18309,'354/323/427/345_IPC',10,'2023-01-14 13:31:07',_binary ''),(18312,'376/406/313/506/174A_IPC',10,'2023-01-14 13:31:07',_binary ''),(18345,'411/120B/34_IPC',10,'2023-01-14 13:31:08',_binary ''),(18375,'66.1B_D.P ACT',10,'2023-01-14 13:31:08',_binary ''),(18384,'427/328/34_IPC',10,'2023-01-14 13:31:09',_binary ''),(18400,'77_JJ ACT',10,'2023-01-14 13:31:09',_binary ''),(18411,'379/411 M_IPC',10,'2023-01-14 13:31:09',_binary ''),(18414,'356/279/411_IPC',10,'2023-01-14 13:31:09',_binary ''),(18417,'399/402/_IPC',10,'2023-01-14 13:31:09',_binary ''),(18438,'28_NDPS ACT',10,'2023-01-14 13:31:09',_binary ''),(18441,'379/328_IPC',10,'2023-01-14 13:31:09',_binary ''),(18453,'354B/506/34_IPC',10,'2023-01-14 13:31:10',_binary ''),(18471,'364A/368/120B/34_IPC',10,'2023-01-14 13:31:10',_binary ''),(18480,'6/24_CTP ACT',10,'2023-01-14 13:31:10',_binary ''),(18498,'41.1.D_CrPC',10,'2023-01-14 13:31:10',_binary ''),(18513,'3_DP DP ACT',10,'2023-01-14 13:31:10',_binary ''),(18552,'509/342/354B/34_IPC',10,'2023-01-14 13:31:11',_binary ''),(18567,'420/120B/34_IPC',10,'2023-01-14 13:31:11',_binary ''),(18576,'354/354B/342_IPC',10,'2023-01-14 13:31:11',_binary ''),(18594,'302/201/120B/34_IPC',10,'2023-01-14 13:31:12',_binary ''),(18597,'323/354B/506/34_IPC',10,'2023-01-14 13:31:12',_binary ''),(18603,'376/342/506_IPC',10,'2023-01-14 13:31:12',_binary ''),(18606,'376/328/384/506_IPC',10,'2023-01-14 13:31:12',_binary ''),(18627,'459/380/411_IPC',10,'2023-01-14 13:31:12',_binary ''),(18630,'392/397/302/34_IPC',10,'2023-01-14 13:31:12',_binary ''),(18636,'273/420/34_IPC',10,'2023-01-14 13:31:12',_binary ''),(18645,'354/323/509/34_IPC',10,'2023-01-14 13:31:12',_binary ''),(18648,'302/392/397_IPC',10,'2023-01-14 13:31:12',_binary ''),(18711,'376A.B_IPC',10,'2023-01-14 13:31:13',_binary ''),(18717,'307/341/34_IPC',10,'2023-01-14 13:31:13',_binary ''),(18720,'323/354B/34_IPC',10,'2023-01-14 13:31:13',_binary ''),(18723,'323/341/509_IPC',10,'2023-01-14 13:31:13',_binary ''),(18732,'302/392/397/397_IPC',10,'2023-01-14 13:31:13',_binary ''),(18738,'354B/506/509/34_IPC',10,'2023-01-14 13:31:13',_binary ''),(18756,'341/323/506/34_IPC',10,'2023-01-14 13:31:14',_binary ''),(18798,'354/342_IPC',10,'2023-01-14 13:31:14',_binary ''),(18799,'10/9_POCSO ACT',10,'2023-01-14 13:31:14',_binary ''),(18807,'354A/354D_IPC',10,'2023-01-14 13:31:14',_binary ''),(18808,'67A_IT ACT',10,'2023-01-14 13:31:14',_binary ''),(18843,'328/376/34_IPC',10,'2023-01-14 13:31:15',_binary ''),(18849,'308/352/353/186/34_IPC',10,'2023-01-14 13:31:15',_binary ''),(18861,'EDMC_EDMC',10,'2023-01-14 13:31:15',_binary ''),(18903,'3 & 4 DMSS 2008 &506_IPC',10,'2023-01-14 13:31:16',_binary ''),(18906,'41.D_CrPC',10,'2023-01-14 13:31:16',_binary ''),(18912,'344(2)_DMC ACT',10,'2023-01-14 13:31:16',_binary ''),(18966,'365/307/34_IPC',10,'2023-01-14 13:31:17',_binary ''),(19098,'57/117_DP Act',10,'2023-01-14 13:31:18',_binary ''),(19113,'376/323/341/506/34_IPC',10,'2023-01-14 13:31:19',_binary ''),(19116,'328/376/384/506_IPC',10,'2023-01-14 13:31:19',_binary ''),(19149,'195/336/506/_IPC',10,'2023-01-14 13:31:19',_binary ''),(19176,'21/61/85_NDPS Act',10,'2023-01-14 13:31:19',_binary ''),(19225,'25/57_Arms Act',10,'2023-01-14 13:31:20',_binary ''),(19248,'302/120B/34_IPC',10,'2023-01-14 13:31:20',_binary ''),(19297,'6 POCSO_ACT',10,'2023-01-14 13:31:21',_binary ''),(19299,'354/354B/509/323_IPC',10,'2023-01-14 13:31:21',_binary ''),(19311,'302/201/120B/34_',10,'2023-01-14 13:31:21',_binary ''),(19320,'77JJ_ACT',10,'2023-01-14 13:31:21',_binary ''),(19323,'77 JJ_ACT',10,'2023-01-14 13:31:21',_binary ''),(19338,'323/354/34_IPC',10,'2023-01-14 13:31:21',_binary ''),(19344,'392/397/344/34_IPC',10,'2023-01-14 13:31:21',_binary ''),(19353,'135/138/150_ELC.ACT',10,'2023-01-14 13:31:21',_binary ''),(19357,'3 DP_DP Act',10,'2023-01-14 13:31:21',_binary ''),(19386,'356/411/34_IPC',10,'2023-01-14 13:31:22',_binary ''),(19459,'482_IPC',10,'2023-01-14 13:31:22',_binary ''),(19470,'302/392/397/34/120_IPC',10,'2023-01-14 13:31:23',_binary ''),(19482,'323/354/341/34_IPC',10,'2023-01-14 13:31:23',_binary ''),(19485,'6.1B_DP Act',10,'2023-01-14 13:31:23',_binary ''),(19504,'POCSO_ACT',10,'2023-01-14 13:31:23',_binary ''),(19530,'323/354/354B/34_IPC',10,'2023-01-14 13:31:23',_binary ''),(19548,'419/511_IPC',10,'2023-01-14 13:31:23',_binary ''),(19557,'323/354/354B/506/34_IPC',10,'2023-01-14 13:31:24',_binary ''),(19608,'376/506/34_IPC',10,'2023-01-14 13:31:24',_binary ''),(19683,'3/4 DELHI_Gambling Act',10,'2023-01-14 13:31:25',_binary ''),(19698,'308/354/506_IPC',10,'2023-01-14 13:31:25',_binary ''),(19731,'354 (C)/500_IPC',10,'2023-01-14 13:31:26',_binary ''),(19732,'66E/67_ITP ACT',10,'2023-01-14 13:31:26',_binary ''),(19761,'12 DP ACT_Gambling Act',10,'2023-01-14 13:31:26',_binary ''),(19767,'9/1/78_DP ACT',10,'2023-01-14 13:31:26',_binary ''),(19776,'12 D.P. ACT_Gambling Act',10,'2023-01-14 13:31:26',_binary ''),(19815,'25/54/49_Arms Act',10,'2023-01-14 13:31:26',_binary ''),(19830,'33 DELHI_Excise',10,'2023-01-14 13:31:27',_binary ''),(19842,'302/201/506_IPC',10,'2023-01-14 13:31:27',_binary ''),(19872,'12 DP_Gambling Act',10,'2023-01-14 13:31:27',_binary ''),(19980,'232/354/376_IPC',10,'2023-01-14 13:31:28',_binary ''),(20019,'354/354B/323/34_IPC',10,'2023-01-14 13:31:29',_binary ''),(20029,'78 JJ_ACT',10,'2023-01-14 13:31:29',_binary ''),(20058,'53/116_DP Act',10,'2023-01-14 13:31:29',_binary ''),(20082,'452/323/341/34_IPC',10,'2023-01-14 13:31:29',_binary ''),(20085,'376 AB_IPC',10,'2023-01-14 13:31:29',_binary ''),(20103,'376/377/328/354/506/34_IPC',10,'2023-01-14 13:31:30',_binary ''),(20109,'342/376(D)/506/109_IPC',10,'2023-01-14 13:31:30',_binary ''),(20110,'3/4/5/_IT ACT',10,'2023-01-14 13:31:30',_binary ''),(20121,'326A//34_IPC',10,'2023-01-14 13:31:30',_binary ''),(20136,'509/506/34_IPC',10,'2023-01-14 13:31:30',_binary ''),(20146,'411/482_IPC',10,'2023-01-14 13:31:30',_binary ''),(20154,'342/376/506_IPC',10,'2023-01-14 13:31:30',_binary ''),(20160,'66.1 B_DP Act',10,'2023-01-14 13:31:30',_binary ''),(20181,'307/147/149/148/186/332/353/188/427/269/270_IPC',10,'2023-01-14 13:31:31',_binary ''),(20182,'3DP DP_DP Act',10,'2023-01-14 13:31:31',_binary ''),(20183,'51BDMA',10,'2023-01-14 13:31:31',_binary ''),(20187,'356/379/411/34_HC BIJENDER',10,'2023-01-14 13:31:31',_binary ''),(20191,'3/14_FORNIER ACT',10,'2023-01-14 13:31:31',_binary ''),(20196,'379/411 /34_IPC',10,'2023-01-14 13:31:31',_binary ''),(20250,'376/377/328/506/34_IPC',10,'2023-01-14 13:31:31',_binary ''),(20265,'304/34_IPC',10,'2023-01-14 13:31:31',_binary ''),(20286,'3/4 DP_Gambling Act',10,'2023-01-14 13:31:32',_binary ''),(20298,'342/376/366/370/506/109/34_IPC',10,'2023-01-14 13:31:32',_binary ''),(20310,'302/457_IPC',10,'2023-01-14 13:31:32',_binary ''),(20313,'302/457/380/34/120B_IPC',10,'2023-01-14 13:31:32',_binary ''),(20316,'342/376D/377/370/506/109/34_IPC',10,'2023-01-14 13:31:32',_binary ''),(20328,'302/457/380/34_IPC',10,'2023-01-14 13:31:32',_binary ''),(20332,'10_POCSO',10,'2023-01-14 13:31:32',_binary ''),(20346,'302/457/380/34/120B/411_IPC',10,'2023-01-14 13:31:32',_binary ''),(20415,'420/471/468/34_IPC',10,'2023-01-14 13:31:33',_binary ''),(20418,'354B_IPC',10,'2023-01-14 13:31:33',_binary ''),(20457,'356/379.392/34_IPC',10,'2023-01-14 13:31:34',_binary ''),(20487,'302/120/34_IPC',10,'2023-01-14 13:31:34',_binary ''),(20496,'376AB_IPC',10,'2023-01-14 13:31:34',_binary ''),(20499,'376/376-2F/328/354/506/34_IPC',10,'2023-01-14 13:31:34',_binary ''),(20502,'25/54/59_A.ACT',10,'2023-01-14 13:31:34',_binary ''),(20520,'33/58_IPC',10,'2023-01-14 13:31:34',_binary ''),(20553,'337/288_IPC',10,'2023-01-14 13:31:35',_binary ''),(20580,'195A/376/506/336_IPC',10,'2023-01-14 13:31:35',_binary ''),(20619,'308/323_IPC',10,'2023-01-14 13:31:36',_binary ''),(20706,'392/402_IPC',10,'2023-01-14 13:31:37',_binary ''),(20730,'380/451/411/34_IPC',10,'2023-01-14 13:31:37',_binary ''),(20757,'328/376/506_IPC',10,'2023-01-14 13:31:37',_binary ''),(20775,'376/323/342/506/34_IPC',10,'2023-01-14 13:31:37',_binary ''),(20836,'8_POCSO ACT',10,'2023-01-14 13:31:38',_binary ''),(20841,'288/337/304A/34_IPC',10,'2023-01-14 13:31:38',_binary ''),(20875,'103_CrPC',10,'2023-01-14 13:31:39',_binary ''),(20877,'350/379/411_IPC',10,'2023-01-14 13:31:39',_binary ''),(20907,'288/337/304A_IPC',10,'2023-01-14 13:31:39',_binary ''),(20919,'256/379_IPC',10,'2023-01-14 13:31:39',_binary ''),(20928,'256/379/34_IPC',10,'2023-01-14 13:31:39',_binary ''),(20970,'380/457/34_IPC',10,'2023-01-14 13:31:40',_binary ''),(21039,'323/354/354B/452/506/34_IPC',10,'2023-01-14 13:31:40',_binary ''),(21042,'3/9/55_Gambling Act',10,'2023-01-14 13:31:40',_binary ''),(21075,'323/341/506/354B/34_IPC',10,'2023-01-14 13:31:41',_binary ''),(21108,'376AB/354/342/365/366A_IPC',10,'2023-01-14 13:31:41',_binary ''),(21109,'6/8/10_POSCO ACT',10,'2023-01-14 13:31:41',_binary ''),(21111,'376ABV/366/342/365_IPC',10,'2023-01-14 13:31:41',_binary ''),(21112,'6/8/10_POCSO ACT',10,'2023-01-14 13:31:41',_binary ''),(21186,'452/323/324/34_IPC',10,'2023-01-14 13:31:42',_binary ''),(21189,'323/354B/506_IPC',10,'2023-01-14 13:31:42',_binary ''),(21234,'179/30.4A_IPC',10,'2023-01-14 13:31:42',_binary ''),(21246,'376AB/342/506_IPC',10,'2023-01-14 13:31:43',_binary ''),(21285,'457/511_IPC',10,'2023-01-14 13:31:43',_binary ''),(21318,'354B/506/509_IPC',10,'2023-01-14 13:31:43',_binary ''),(21327,'323/341/435/506/34_IPC',10,'2023-01-14 13:31:44',_binary ''),(21408,'451/354/354A/354B/506_IPC',10,'2023-01-14 13:31:44',_binary ''),(21420,'156/353/332_IPC',10,'2023-01-14 13:31:45',_binary ''),(21489,'376/366/366A/363_IPC',10,'2023-01-14 13:31:45',_binary ''),(21543,'376/366/363_IPC',10,'2023-01-14 13:31:46',_binary ''),(21591,'347/506/34_IPC',10,'2023-01-14 13:31:47',_binary ''),(21618,'323/354/354B_IPC',10,'2023-01-14 13:31:47',_binary ''),(21646,'9_POCSO',10,'2023-01-14 13:31:47',_binary ''),(21669,'363/363A_IPC',10,'2023-01-14 13:31:47',_binary ''),(21744,'63_COPY RIGHT',10,'2023-01-14 13:31:48',_binary ''),(21762,'307/186/353/411_IPC',10,'2023-01-14 13:31:48',_binary ''),(21771,'307/186/353/411A_IPC',10,'2023-01-14 13:31:49',_binary ''),(21810,'451/380_IPC',10,'2023-01-14 13:31:49',_binary ''),(21813,'25/54/529_Arms Act',10,'2023-01-14 13:31:49',_binary ''),(21858,'354B/323/504_IPC',10,'2023-01-14 13:31:50',_binary ''),(22053,'307/143/147/148/149/186/332/353/109_IPC',10,'2023-01-14 13:31:52',_binary ''),(22056,'307/413/147/148/149/186/332/353/109/_IPC',10,'2023-01-14 13:31:52',_binary ''),(22059,'307/143/147/148/149/332/353/109_IPC',10,'2023-01-14 13:31:52',_binary ''),(22077,'315(I)BC/23PC_ACT',10,'2023-01-14 13:31:52',_binary ''),(22078,'PNDT_ACT',10,'2023-01-14 13:31:52',_binary ''),(22200,'380/427/511_IPC',10,'2023-01-14 13:31:53',_binary ''),(22257,'341/506/509/427/188_IPC',10,'2023-01-14 13:31:54',_binary ''),(22341,'77  JJ_ACT',10,'2023-01-14 13:31:55',_binary ''),(22371,'380/448_IPC',10,'2023-01-14 13:31:55',_binary ''),(22392,'395/397/392/34_IPC',10,'2023-01-14 13:31:55',_binary ''),(22395,'356/379 /411/34_IPC',10,'2023-01-14 13:31:56',_binary ''),(22422,'427/380/511_IPC',10,'2023-01-14 13:31:56',_binary ''),(22429,'POSCO_ACT',10,'2023-01-14 13:31:56',_binary ''),(22443,'7 JJ_ACT',10,'2023-01-14 13:31:56',_binary ''),(22476,'341/323/34_IPC',10,'2023-01-14 13:31:56',_binary ''),(22494,'376/354B/506_IPC',10,'2023-01-14 13:31:57',_binary ''),(22515,'354(C)_IPC',10,'2023-01-14 13:31:57',_binary ''),(22516,'67 B_ITA',10,'2023-01-14 13:31:57',_binary ''),(22517,'12',10,'2023-01-14 13:31:57',_binary ''),(22521,'354 (C)_IPC',10,'2023-01-14 13:31:57',_binary ''),(22522,'67_ITA',10,'2023-01-14 13:31:57',_binary ''),(22523,'12 POCSO',10,'2023-01-14 13:31:57',_binary ''),(22638,'392/397/395/412/34_IPC',10,'2023-01-14 13:31:58',_binary ''),(22650,'323/324/341_IPC',10,'2023-01-14 13:31:58',_binary ''),(22692,'323/341/188/34_IPC',10,'2023-01-14 13:31:59',_binary ''),(22782,'3/5/23_PANDT ACT',10,'2023-01-14 13:32:00',_binary ''),(22827,'392/394/411_IPC',10,'2023-01-14 13:32:01',_binary ''),(22833,'392/397/4111/34_IPC',10,'2023-01-14 13:32:01',_binary ''),(22845,'409/411/182_IPC',10,'2023-01-14 13:32:01',_binary ''),(22899,'12_DP Act',10,'2023-01-14 13:32:02',_binary ''),(22926,'3/5/23_PN DT ACT',10,'2023-01-14 13:32:02',_binary ''),(23007,'392/397/411/120B/482_IPC',10,'2023-01-14 13:32:03',_binary ''),(23013,'307/323/342_IPC',10,'2023-01-14 13:32:03',_binary ''),(23037,'307/182/120B/34_IPC',10,'2023-01-14 13:32:03',_binary ''),(23040,'392/397/482/411/120B/34_IPC',10,'2023-01-14 13:32:04',_binary ''),(23067,'130_DP Act',10,'2023-01-14 13:32:04',_binary ''),(23070,'3/4/5/12/55_Gambling Act',10,'2023-01-14 13:32:04',_binary ''),(23118,'3074/120B/34_IPC',10,'2023-01-14 13:32:05',_binary ''),(23127,'12 DELHI_Gambling Act',10,'2023-01-14 13:32:05',_binary ''),(23136,'66.1B_DP',10,'2023-01-14 13:32:05',_binary ''),(23160,'376/506/328_IPC',10,'2023-01-14 13:32:05',_binary ''),(23235,'5/15_ENVIRMENT',10,'2023-01-14 13:32:07',_binary ''),(33039,'04-May_Gambling Act',10,'2023-01-14 13:46:49',_binary ''),(33054,'12-09-1955_Gambling Act',10,'2023-01-14 13:46:49',_binary ''),(33165,'07-10-1955_C R ACT',10,'2023-01-14 13:46:51',_binary ''),(33171,'07-10-1955_ E C ACTS',10,'2023-01-14 13:46:51',_binary ''),(33303,'Aug-14_D D ACT',10,'2023-01-14 13:46:54',_binary ''),(33330,'07-10-1955_EC ACT ',10,'2023-01-14 13:46:54',_binary ''),(33333,'12-09-1955_GAMBLING ACT ',10,'2023-01-14 13:46:54',_binary ''),(33397,'04-Aug_POCSO',10,'2023-01-14 13:46:55',_binary ''),(33399,'07-10-1955_EC ACT',10,'2023-01-14 13:46:55',_binary ''),(33453,'07-10-1955_EXCISE ACT ',10,'2023-01-14 13:46:56',_binary ''),(33585,'324_IPC ',10,'2023-01-14 13:46:58',_binary ''),(33627,'364_IPC',10,'2023-01-14 13:46:59',_binary ''),(33672,'Mar-15_MV ACT ',10,'2023-01-14 13:46:59',_binary ''),(33717,'18-06-1985_NDPS Act',10,'2023-01-14 13:47:00',_binary ''),(33897,'03-Jan_Others',10,'2023-01-14 13:47:03',_binary ''),(34071,'May-15_ENVIORMENT ACT',10,'2023-01-14 13:47:06',_binary ''),(35145,'03-Apr_Gambling Act',10,'2023-01-14 13:47:23',_binary ''),(35409,'12-09-1955_G. ACT',10,'2023-01-14 13:47:26',_binary ''),(35454,'09-Oct_DNS ACT',10,'2023-01-14 13:47:27',_binary ''),(35460,'18-09-1955_G. ACT',10,'2023-01-14 13:47:27',_binary ''),(35466,'12-09-2005_Gambling Act',10,'2023-01-14 13:47:27',_binary ''),(35961,'354/354B/352/506/509/427_IPC',10,'2023-01-14 13:47:33',_binary ''),(35970,'468/471/34 _IPC',10,'2023-01-14 13:47:33',_binary ''),(35994,'419/420/467/468/471/120B/34_IPC',10,'2023-01-14 13:47:33',_binary ''),(36003,'387_IPC ',10,'2023-01-14 13:47:33',_binary ''),(36015,'323/341/342/506/34_IPC ',10,'2023-01-14 13:47:33',_binary ''),(36016,'27/59/59_Arms Act',10,'2023-01-14 13:47:33',_binary ''),(36033,'452/323/304/34_IPC ',10,'2023-01-14 13:47:33',_binary ''),(36039,'135_NI Act ',10,'2023-01-14 13:47:33',_binary ''),(36042,'380/411/34_IPC ',10,'2023-01-14 13:47:33',_binary ''),(36054,'420/406/120B _IPC ',10,'2023-01-14 13:47:34',_binary ''),(36060,'315_IPC ',10,'2023-01-14 13:47:34',_binary ''),(36063,'03-Apr_DPG Act ',10,'2023-01-14 13:47:34',_binary ''),(36096,'363/323/506/377/511/34_IPC',10,'2023-01-14 13:47:34',_binary ''),(36111,'147/148/149/427/323_IPC',10,'2023-01-14 13:47:34',_binary ''),(36114,'457/380/511/34_IPC',10,'2023-01-14 13:47:34',_binary ''),(36120,'6/24/1_CPT ACT',10,'2023-01-14 13:47:34',_binary ''),(36123,'2_Gambling Act',10,'2023-01-14 13:47:34',_binary ''),(36177,'38/411/34 _IPC',10,'2023-01-14 13:47:35',_binary ''),(36228,'354/354D/506/509_IPC ',10,'2023-01-14 13:47:36',_binary ''),(36237,'379/356/411/34_IPC ',10,'2023-01-14 13:47:36',_binary ''),(36240,'420/506/34_IPC ',10,'2023-01-14 13:47:36',_binary ''),(36255,'279/338_IPC ',10,'2023-01-14 13:47:36',_binary ''),(36258,'92/93_DP Act ',10,'2023-01-14 13:47:36',_binary ''),(36267,'323/341/506/34_IPC ',10,'2023-01-14 13:47:36',_binary ''),(36276,'41.1(D) _CrPC ',10,'2023-01-14 13:47:36',_binary ''),(36288,'376/377/328_IPC ',10,'2023-01-14 13:47:36',_binary ''),(36289,'03-Apr_Dowry Act ',10,'2023-01-14 13:47:36',_binary ''),(36300,'397_IPC ',10,'2023-01-14 13:47:36',_binary ''),(36342,'279/336_IPC ',10,'2023-01-14 13:47:37',_binary ''),(36351,'419_IPC ',10,'2023-01-14 13:47:37',_binary ''),(36363,'302/34_IC ',10,'2023-01-14 13:47:37',_binary ''),(36381,'3_DP ACT',10,'2023-01-14 13:47:37',_binary ''),(36417,'323/342/506/34_IPC',10,'2023-01-14 13:47:38',_binary ''),(36429,'380/511_IPC',10,'2023-01-14 13:47:38',_binary ''),(36438,'Jun-24_CJ ACT',10,'2023-01-14 13:47:38',_binary ''),(36444,'323/341 _IPC',10,'2023-01-14 13:47:38',_binary ''),(36450,'411/34_IPC ',10,'2023-01-14 13:47:38',_binary ''),(36480,'377/498A/406/323/354/354A/354B/342/34_IPC ',10,'2023-01-14 13:47:38',_binary ''),(36481,'03-Apr_DP Act ',10,'2023-01-14 13:47:38',_binary ''),(36483,'354C/354D_IPC ',10,'2023-01-14 13:47:38',_binary ''),(36484,'66_IT Act ',10,'2023-01-14 13:47:38',_binary ''),(36498,'341/506/509/34_IPC',10,'2023-01-14 13:47:39',_binary ''),(36564,'354/323/324/341/506_IPC',10,'2023-01-14 13:47:39',_binary ''),(36570,'409/420/34_IPC',10,'2023-01-14 13:47:39',_binary ''),(36639,'315_IPC',10,'2023-01-14 13:47:40',_binary ''),(36660,'138_NIT Act ',10,'2023-01-14 13:47:40',_binary ''),(36672,'280/411_IPC',10,'2023-01-14 13:47:40',_binary ''),(36675,'66/1/14 _Excise',10,'2023-01-14 13:47:40',_binary ''),(36678,'341/328//34_IPC',10,'2023-01-14 13:47:41',_binary ''),(36711,'305/34_IPC',10,'2023-01-14 13:47:41',_binary ''),(36744,'63_CRPC',10,'2023-01-14 13:47:41',_binary ''),(36762,'33/58_Delhi Excise Act',10,'2023-01-14 13:47:41',_binary ''),(36765,'33_Excise Act',10,'2023-01-14 13:47:41',_binary ''),(36771,'288/304A_IPC',10,'2023-01-14 13:47:42',_binary ''),(36774,'107/15_CRPC',10,'2023-01-14 13:47:42',_binary ''),(36798,'302/412/34_IPC',10,'2023-01-14 13:47:42',_binary ''),(36807,'354A/354D/509/506/34_IPC',10,'2023-01-14 13:47:42',_binary ''),(36819,'20_NDPS',10,'2023-01-14 13:47:42',_binary ''),(36822,'63_Copy Right Act',10,'2023-01-14 13:47:42',_binary ''),(36852,'188/269/270/285_IPC',10,'2023-01-14 13:47:42',_binary ''),(36861,'66C & 509/34 IPC_IT Act',10,'2023-01-14 13:47:43',_binary ''),(36885,'33/58_Excise Act',10,'2023-01-14 13:47:43',_binary ''),(36906,'354 IPC_IPC',10,'2023-01-14 13:47:43',_binary ''),(36927,'341/323/354/506/34_IPC',10,'2023-01-14 13:47:43',_binary ''),(36936,'382/411_IPC',10,'2023-01-14 13:47:43',_binary ''),(36945,'363/376/342_IPC',10,'2023-01-14 13:47:43',_binary ''),(36960,'33/52_Excise',10,'2023-01-14 13:47:44',_binary ''),(37014,'354B/323/509/506/34_IPC',10,'2023-01-14 13:47:44',_binary ''),(37051,'39/34_ELECTRITY ACTS',10,'2023-01-14 13:47:45',_binary ''),(37053,'307/324/34_IPC',10,'2023-01-14 13:47:45',_binary ''),(37185,'419/420/468/471/34_IPC',10,'2023-01-14 13:47:46',_binary ''),(37191,'376/354D _IPC',10,'2023-01-14 13:47:46',_binary ''),(37194,'41.1D /102_CrPC',10,'2023-01-14 13:47:46',_binary ''),(37206,'356/379/411/482/34_IPC',10,'2023-01-14 13:47:46',_binary ''),(37251,'380/467_IPC',10,'2023-01-14 13:47:47',_binary ''),(37308,'May-15_Envirnoment Act',10,'2023-01-14 13:47:47',_binary ''),(37338,'12-09-1955_Gambling',10,'2023-01-14 13:47:48',_binary ''),(37347,'103/104_Trade Mark Act',10,'2023-01-14 13:47:48',_binary ''),(37362,'25/54/59_A. ACT',10,'2023-01-14 13:47:48',_binary ''),(37368,'188/286_IPC',10,'2023-01-14 13:47:48',_binary ''),(37407,'33_EX. ACT',10,'2023-01-14 13:47:49',_binary ''),(37425,'66.1B_DPACT',10,'2023-01-14 13:47:49',_binary ''),(37482,'67B_IT ACT',10,'2023-01-14 13:47:49',_binary ''),(37491,'387_IPC',10,'2023-01-14 13:47:49',_binary ''),(37548,'307-34_IPC',10,'2023-01-14 13:47:50',_binary ''),(37554,'380/420/467/468/120B_IPC',10,'2023-01-14 13:47:50',_binary ''),(37593,'356-379/411_IPC',10,'2023-01-14 13:47:51',_binary ''),(37596,'379/411 IPC_THEFT',10,'2023-01-14 13:47:51',_binary ''),(37599,'307/34 IPC 27/54/59 AA_IPC & Arms Act',10,'2023-01-14 13:47:51',_binary ''),(37620,'323/354/452/506/34_IPC',10,'2023-01-14 13:47:51',_binary ''),(37626,'308/325_IPC',10,'2023-01-14 13:47:51',_binary ''),(37629,'92/93_DP Act',10,'2023-01-14 13:47:51',_binary ''),(37635,'308/324/452/427/34_IPC',10,'2023-01-14 13:47:51',_binary ''),(37644,'135_EC ACT',10,'2023-01-14 13:47:51',_binary ''),(37668,'308/34 _IPC',10,'2023-01-14 13:47:51',_binary ''),(37675,'39/44_Others',10,'2023-01-14 13:47:51',_binary ''),(37677,'21-06-1985_NDPS Act',10,'2023-01-14 13:47:51',_binary ''),(37695,'376.3_IPC',10,'2023-01-14 13:47:52',_binary ''),(37722,'379/411/325_IPC',10,'2023-01-14 13:47:52',_binary ''),(37731,'323/341/506/509/354/354B/34_IPC',10,'2023-01-14 13:47:52',_binary ''),(37734,'376/366/495_IPC',10,'2023-01-14 13:47:52',_binary ''),(37761,'41.1D & 102_CrPC',10,'2023-01-14 13:47:52',_binary ''),(37785,'379/_IPC',10,'2023-01-14 13:47:53',_binary ''),(37800,'41.1D/102_CrPC',10,'2023-01-14 13:47:53',_binary ''),(37810,'4_Others',10,'2023-01-14 13:47:53',_binary ''),(37827,'324/323_IPC',10,'2023-01-14 13:47:53',_binary ''),(37839,'363/506_IPC',10,'2023-01-14 13:47:53',_binary ''),(37875,'63/65_CrPC',10,'2023-01-14 13:47:54',_binary ''),(37899,'25/54/56_Arms Act',10,'2023-01-14 13:47:54',_binary ''),(37938,'110_CrPC',10,'2023-01-14 13:47:54',_binary ''),(37956,'380/342/_IPC',10,'2023-01-14 13:47:54',_binary ''),(37989,'354B/451/323/34_IPC',10,'2023-01-14 13:47:55',_binary ''),(38019,'387/506/34_IPC',10,'2023-01-14 13:47:55',_binary ''),(38037,'279/323_IPC',10,'2023-01-14 13:47:55',_binary ''),(38121,'354A/342/376_IPC',10,'2023-01-14 13:47:56',_binary ''),(38145,'33 EXCISE_ACT',10,'2023-01-14 13:47:56',_binary ''),(38148,'207 MV_ACT',10,'2023-01-14 13:47:56',_binary ''),(38169,'323/341/506/341_IPC',10,'2023-01-14 13:47:57',_binary ''),(38196,'392/120B_IPC',10,'2023-01-14 13:47:57',_binary ''),(38199,'66_DP',10,'2023-01-14 13:47:57',_binary ''),(38208,'363/376/366A IPC & 6 POCSO_IPC & PoSCO',10,'2023-01-14 13:47:57',_binary ''),(38214,'330/457_IPC',10,'2023-01-14 13:47:57',_binary ''),(38259,'363/376/366A_IPC',10,'2023-01-14 13:47:58',_binary ''),(38265,'354/354A/506/34_IPC',10,'2023-01-14 13:47:58',_binary ''),(38274,'63/65_CR',10,'2023-01-14 13:47:58',_binary ''),(38280,'63_CR',10,'2023-01-14 13:47:58',_binary ''),(38289,'06-05-2013_CTP Act ',10,'2023-01-14 13:47:58',_binary ''),(38295,'354/509_IPC ',10,'2023-01-14 13:47:58',_binary ''),(38298,'452/554A/323 _IPC ',10,'2023-01-14 13:47:58',_binary ''),(38304,'392/397/411/34_IPC ',10,'2023-01-14 13:47:58',_binary ''),(38310,'279/304A IP_IPC ',10,'2023-01-14 13:47:58',_binary ''),(38316,'285_IPC ',10,'2023-01-14 13:47:58',_binary ''),(38325,'380/457/411/341_IPC',10,'2023-01-14 13:47:58',_binary ''),(38328,'394/397/34IPC /27ARMS_ACT',10,'2023-01-14 13:47:58',_binary ''),(38331,'207MV _ACT',10,'2023-01-14 13:47:58',_binary ''),(38340,'336IPC/25/27_Arms Act',10,'2023-01-14 13:47:58',_binary ''),(38343,'33/58 EXCISE_ACT',10,'2023-01-14 13:47:58',_binary ''),(38352,'354/354B/509/323/506/34_IPC',10,'2023-01-14 13:47:58',_binary ''),(38361,'380/454/511/34_IPC',10,'2023-01-14 13:47:59',_binary ''),(38370,'320/376_IPC',10,'2023-01-14 13:47:59',_binary ''),(38373,'354/376&10/12 POCSO_ACT',10,'2023-01-14 13:47:59',_binary ''),(38382,'323/341/506/34_IPC',10,'2023-01-14 13:47:59',_binary ''),(38385,'207 MV _ACT ',10,'2023-01-14 13:47:59',_binary ''),(38400,'207 MV _ACT',10,'2023-01-14 13:47:59',_binary ''),(38415,'323/341/506/34IPC&25/27/54/59_Arms Act',10,'2023-01-14 13:47:59',_binary ''),(38445,'323/354/354B/506/509_IPC',10,'2023-01-14 13:47:59',_binary ''),(38460,'380/109/411/506/34_IPC',10,'2023-01-14 13:48:00',_binary ''),(38463,'186/341/353/332/506/34_IPC',10,'2023-01-14 13:48:00',_binary ''),(38469,'393/436/452/34/&27_Arms Act',10,'2023-01-14 13:48:00',_binary ''),(38508,'66.1B DP _ACT',10,'2023-01-14 13:48:00',_binary ''),(38523,'376/ & 6 POCSO_ACT',10,'2023-01-14 13:48:00',_binary ''),(38532,'323/341/427/34_IPC',10,'2023-01-14 13:48:00',_binary ''),(38553,'3&4 GAMBLING _ACT',10,'2023-01-14 13:48:01',_binary ''),(38574,'354/379/34_IPC',10,'2023-01-14 13:48:01',_binary ''),(38580,'146/147/149/323/324_IPC',10,'2023-01-14 13:48:01',_binary ''),(38598,'380/457 IPC_IPC',10,'2023-01-14 13:48:01',_binary ''),(38646,'12-09-1955_G Act',10,'2023-01-14 13:48:02',_binary ''),(38679,'27/61/85_NDPS',10,'2023-01-14 13:48:02',_binary ''),(38685,'12-09-1955_DPG Act',10,'2023-01-14 13:48:02',_binary ''),(38688,'24/60/85_NDPS Act',10,'2023-01-14 13:48:02',_binary ''),(38703,'12-09-1955_DPG',10,'2023-01-14 13:48:02',_binary ''),(38736,'341/323/34_IPC ',10,'2023-01-14 13:48:03',_binary ''),(38745,'176_CrPC ',10,'2023-01-14 13:48:03',_binary ''),(38793,'07-10-1955_Others',10,'2023-01-14 13:48:03',_binary ''),(38820,'65/68_Others',10,'2023-01-14 13:48:04',_binary ''),(38838,'420/468/471/200_IPC',10,'2023-01-14 13:48:04',_binary ''),(38841,'408A/406/302/34_IPC',10,'2023-01-14 13:48:04',_binary ''),(38853,'307/353/186/34_IPC',10,'2023-01-14 13:48:04',_binary ''),(38856,'78_TMM ACT',10,'2023-01-14 13:48:04',_binary ''),(38865,'25/54/59 ARMS ACT_Arms Act',10,'2023-01-14 13:48:04',_binary ''),(38871,'3241/411_IPC ',10,'2023-01-14 13:48:04',_binary ''),(38892,'78/79_TM Act ',10,'2023-01-14 13:48:05',_binary ''),(38904,'63/65 _CR Act ',10,'2023-01-14 13:48:05',_binary ''),(38907,'307/302/34 _IPC ',10,'2023-01-14 13:48:05',_binary ''),(38913,'420/468/471/485/486 _IPC',10,'2023-01-14 13:48:05',_binary ''),(38914,'62/63_CR Act',10,'2023-01-14 13:48:05',_binary ''),(38922,'448/380/34_IPC ',10,'2023-01-14 13:48:05',_binary ''),(38937,'498/34_IPC ',10,'2023-01-14 13:48:05',_binary ''),(38949,'63_CR Act ',10,'2023-01-14 13:48:05',_binary ''),(38955,'06-01-2014_EXCISE ACT ',10,'2023-01-14 13:48:05',_binary ''),(38961,'363/366_IPC ',10,'2023-01-14 13:48:05',_binary ''),(38994,'420/506/323/34_IPC ',10,'2023-01-14 13:48:06',_binary ''),(39021,'379/39/144_IPC',10,'2023-01-14 13:48:06',_binary ''),(39042,'78/79_TMM ACTS',10,'2023-01-14 13:48:06',_binary ''),(39063,'387/338_IPC',10,'2023-01-14 13:48:07',_binary ''),(39072,'382/411/34_IPC ',10,'2023-01-14 13:48:07',_binary ''),(39081,'102_DP Act ',10,'2023-01-14 13:48:07',_binary ''),(39093,'498A/406_IPC ',10,'2023-01-14 13:48:07',_binary ''),(39102,'_CTPT Act',10,'2023-01-14 13:48:07',_binary ''),(39108,'_TMA Act ',10,'2023-01-14 13:48:07',_binary ''),(39111,'09-Oct_DNS Act ',10,'2023-01-14 13:48:07',_binary ''),(39123,'27/61/85_NDPS Act ',10,'2023-01-14 13:48:07',_binary ''),(39126,'302/34_IPC ',10,'2023-01-14 13:48:07',_binary ''),(39132,'3/4/5/8 _ITP Act ',10,'2023-01-14 13:48:08',_binary ''),(39141,'09-Oct_DIV Act ',10,'2023-01-14 13:48:08',_binary ''),(39144,'2/4/9/55_Gambling Act',10,'2023-01-14 13:48:08',_binary ''),(39156,'363/364A_IPC ',10,'2023-01-14 13:48:08',_binary ''),(39162,'9/0_DNS Act ',10,'2023-01-14 13:48:08',_binary ''),(39180,'420/406_IPC ',10,'2023-01-14 13:48:08',_binary ''),(39198,'68/1/14_Excise',10,'2023-01-14 13:48:08',_binary ''),(39234,'317_IPC ',10,'2023-01-14 13:48:09',_binary ''),(39240,'305/34_IPC ',10,'2023-01-14 13:48:09',_binary ''),(39243,'307/406/498A _IPC ',10,'2023-01-14 13:48:09',_binary ''),(39249,'323/354A/509/506_IPC ',10,'2023-01-14 13:48:09',_binary ''),(39258,'336_IPC ',10,'2023-01-14 13:48:09',_binary ''),(39259,'25/54/59 _Arms Act ',10,'2023-01-14 13:48:09',_binary ''),(39270,'379/358/411/34_IPC ',10,'2023-01-14 13:48:09',_binary ''),(39282,'489_IPC ',10,'2023-01-14 13:48:09',_binary ''),(39309,'304A/288_IPC',10,'2023-01-14 13:48:10',_binary ''),(39315,'33/58 D _Excise ACT ',10,'2023-01-14 13:48:10',_binary ''),(39348,'3/4/5/9/55_Gambling Act',10,'2023-01-14 13:48:10',_binary ''),(39354,'307/34 _IPC',10,'2023-01-14 13:48:10',_binary ''),(39384,'323/308/506/34_IPC',10,'2023-01-14 13:48:10',_binary ''),(39390,'33 D _Excise ACT ',10,'2023-01-14 13:48:10',_binary ''),(39405,'365/302_IPC',10,'2023-01-14 13:48:11',_binary ''),(39414,'20 NDPS _ACT ',10,'2023-01-14 13:48:11',_binary ''),(39420,'302/365/201/34_IPC',10,'2023-01-14 13:48:11',_binary ''),(39436,'4/19POCSO _ACT',10,'2023-01-14 13:48:11',_binary ''),(39459,'33. D _Excise ACT ',10,'2023-01-14 13:48:11',_binary ''),(39486,'356/302_IPC',10,'2023-01-14 13:48:11',_binary ''),(39495,'323/342/34/452_IPC',10,'2023-01-14 13:48:12',_binary ''),(39507,'509_IPC ',10,'2023-01-14 13:48:12',_binary ''),(39508,'66_EX Act ',10,'2023-01-14 13:48:12',_binary ''),(39528,'353/186/332_IPC ',10,'2023-01-14 13:48:12',_binary ''),(39531,'27_NDPS Act ',10,'2023-01-14 13:48:12',_binary ''),(39537,'42/497/364 _IPC',10,'2023-01-14 13:48:12',_binary ''),(39546,'68/1/85_NDPS ACT ',10,'2023-01-14 13:48:12',_binary ''),(39549,'279/396_IPC ',10,'2023-01-14 13:48:12',_binary ''),(39555,'28-11-1994_Others',10,'2023-01-14 13:48:12',_binary ''),(39570,'368_IPC',10,'2023-01-14 13:48:12',_binary ''),(39576,'376/417/506_IPC',10,'2023-01-14 13:48:13',_binary ''),(39588,'3_A ACTS',10,'2023-01-14 13:48:13',_binary ''),(39606,'498A/406/323/34_IPC',10,'2023-01-14 13:48:13',_binary ''),(39615,'193/448/380/411_IPC ',10,'2023-01-14 13:48:13',_binary ''),(39624,'03-04-2005_Gambling Act',10,'2023-01-14 13:48:13',_binary ''),(39627,'292_IPC ',10,'2023-01-14 13:48:13',_binary ''),(39630,'63/1/14_Excise',10,'2023-01-14 13:48:13',_binary ''),(39633,'307/306_IPC ',10,'2023-01-14 13:48:13',_binary ''),(39651,'323/454_IPC',10,'2023-01-14 13:48:13',_binary ''),(39663,'279-337_IPC',10,'2023-01-14 13:48:13',_binary ''),(39672,'3(1)_BB ACT',10,'2023-01-14 13:48:14',_binary ''),(39702,'10-09-1955_Gambling Act',10,'2023-01-14 13:48:14',_binary ''),(39711,'09-Oct_NDPS Act',10,'2023-01-14 13:48:14',_binary ''),(39723,'436/304A_IPC',10,'2023-01-14 13:48:14',_binary ''),(39750,'392/365/411/34_IPC',10,'2023-01-14 13:48:14',_binary ''),(39756,'285_IPC',10,'2023-01-14 13:48:14',_binary ''),(39780,'454/380/411_IPC ',10,'2023-01-14 13:48:15',_binary ''),(39792,'377/506/34_IPC ',10,'2023-01-14 13:48:15',_binary ''),(39793,'Jun-21_POCSO Act ',10,'2023-01-14 13:48:15',_binary ''),(39801,'457/380/411/34_IPC ',10,'2023-01-14 13:48:15',_binary ''),(39822,'279/304 A_IPC',10,'2023-01-14 13:48:15',_binary ''),(39825,'66.1 B _DP Act',10,'2023-01-14 13:48:15',_binary ''),(39843,'33/58D _Excise ACT ',10,'2023-01-14 13:48:15',_binary ''),(39870,'323/452/448/341_IPC',10,'2023-01-14 13:48:16',_binary ''),(39873,'385/506/34_IPC',10,'2023-01-14 13:48:16',_binary ''),(39874,'25/27 A _ACT',10,'2023-01-14 13:48:16',_binary ''),(39951,'354/35B/354D/506/_CrPC',10,'2023-01-14 13:48:17',_binary ''),(39960,'63 CR _ACT ',10,'2023-01-14 13:48:17',_binary ''),(39990,'356/379/34/411_IPC',10,'2023-01-14 13:48:17',_binary ''),(40092,'402/406_IPC ',10,'2023-01-14 13:48:18',_binary ''),(40095,'337_IPC ',10,'2023-01-14 13:48:18',_binary ''),(40122,'448/34_IPC',10,'2023-01-14 13:48:19',_binary ''),(40125,'147/148/149/186/353/332_IPC',10,'2023-01-14 13:48:19',_binary ''),(40128,'147/148/149/186/352/323/420/435/436_IPC',10,'2023-01-14 13:48:19',_binary ''),(40137,'394/371_IPC',10,'2023-01-14 13:48:19',_binary ''),(40143,'363/186/332/225_IPC',10,'2023-01-14 13:48:19',_binary ''),(40155,'452/308/323/34_IPC',10,'2023-01-14 13:48:19',_binary ''),(40164,'498A/406/506/34_IPC',10,'2023-01-14 13:48:19',_binary ''),(40185,'27-06-1955_NDPS Act',10,'2023-01-14 13:48:19',_binary ''),(40188,'06-08-2014_Excise',10,'2023-01-14 13:48:19',_binary ''),(40194,'294_IPC',10,'2023-01-14 13:48:19',_binary ''),(40206,'34/5/9/55_Gambling Act',10,'2023-01-14 13:48:20',_binary ''),(40233,'304B/34_IPC',10,'2023-01-14 13:48:20',_binary ''),(40239,'380/451_IPC',10,'2023-01-14 13:48:20',_binary ''),(40260,'238/304_IPC',10,'2023-01-14 13:48:20',_binary ''),(40287,'498/304B/34_IPC',10,'2023-01-14 13:48:20',_binary ''),(40299,'49/496/151_Others',10,'2023-01-14 13:48:21',_binary ''),(40314,'63/64_COPY RIGHT ACT',10,'2023-01-14 13:48:21',_binary ''),(40326,'307/315/34_IPC ',10,'2023-01-14 13:48:21',_binary ''),(40332,'82/83 _CRPC ',10,'2023-01-14 13:48:21',_binary ''),(40335,'379/304A_IPC ',10,'2023-01-14 13:48:21',_binary ''),(40353,'14/148/149/323/506 _IPC',10,'2023-01-14 13:48:21',_binary ''),(40380,'408/411/34_IPC',10,'2023-01-14 13:48:21',_binary ''),(40386,'186/324/353/332/34_IPC',10,'2023-01-14 13:48:22',_binary ''),(40410,'279/337 _IPC',10,'2023-01-14 13:48:22',_binary ''),(40413,'498A/304 _IPC',10,'2023-01-14 13:48:22',_binary ''),(40434,'323/324/34_IPC ',10,'2023-01-14 13:48:22',_binary ''),(40437,'3/4/5/9/55 _Gambling Act',10,'2023-01-14 13:48:22',_binary ''),(40440,'279/331/304A_IPC ',10,'2023-01-14 13:48:22',_binary ''),(40446,'392/397_IPC ',10,'2023-01-14 13:48:22',_binary ''),(40458,'394/34_IPC ',10,'2023-01-14 13:48:22',_binary ''),(40461,'386/411/34_IPC',10,'2023-01-14 13:48:22',_binary ''),(40464,'323/506_IPC',10,'2023-01-14 13:48:22',_binary ''),(40476,'379/225/336/420 _IPC ',10,'2023-01-14 13:48:22',_binary ''),(40485,'287/304A _IPC',10,'2023-01-14 13:48:23',_binary ''),(40491,'3/4/5/9/55 _Gambling Act ',10,'2023-01-14 13:48:23',_binary ''),(40497,'22-09-1955_Gambling Act',10,'2023-01-14 13:48:23',_binary ''),(40509,'279/304A _IPC ',10,'2023-01-14 13:48:23',_binary ''),(40527,'100_DP Act ',10,'2023-01-14 13:48:23',_binary ''),(40530,'337/511_IPC ',10,'2023-01-14 13:48:23',_binary ''),(40536,'288/304A _IPC ',10,'2023-01-14 13:48:23',_binary ''),(40545,'356/379/511 _IPC ',10,'2023-01-14 13:48:23',_binary ''),(40548,'66_DP Ac t ',10,'2023-01-14 13:48:23',_binary ''),(40551,'56/1/14_Excise',10,'2023-01-14 13:48:23',_binary ''),(40557,'468A/406_IPC ',10,'2023-01-14 13:48:23',_binary ''),(40560,'233/308/341 _IPC ',10,'2023-01-14 13:48:23',_binary ''),(40569,'356/379_IPC ',10,'2023-01-14 13:48:23',_binary ''),(40581,'393/394/398 _IPC ',10,'2023-01-14 13:48:24',_binary ''),(40587,'389_IPC ',10,'2023-01-14 13:48:24',_binary ''),(40605,'34/448_IPC ',10,'2023-01-14 13:48:24',_binary ''),(40623,'147/148/141/34_IPC ',10,'2023-01-14 13:48:24',_binary ''),(40665,'276/337_IPC ',10,'2023-01-14 13:48:24',_binary ''),(40701,'428_IPC ',10,'2023-01-14 13:48:25',_binary ''),(40704,'379/411 _IPC ',10,'2023-01-14 13:48:25',_binary ''),(40722,'37/411_IPC ',10,'2023-01-14 13:48:25',_binary ''),(40743,'203/342/376/506 _IPC ',10,'2023-01-14 13:48:25',_binary ''),(40746,'61/1/19_Excise',10,'2023-01-14 13:48:25',_binary ''),(40749,'420/471/46/34_IPC ',10,'2023-01-14 13:48:25',_binary ''),(40755,'392/396/34 _IPC ',10,'2023-01-14 13:48:25',_binary ''),(40758,'02-09-1955_Gambling Act',10,'2023-01-14 13:48:25',_binary ''),(40773,'25_IPC',10,'2023-01-14 13:48:26',_binary ''),(40788,'325/324/34_IPC',10,'2023-01-14 13:48:26',_binary ''),(40791,'356/379/511_IPC',10,'2023-01-14 13:48:26',_binary ''),(40794,'3/4/5/9/55_IPC',10,'2023-01-14 13:48:26',_binary ''),(40800,'392/397/411/34 _IPC ',10,'2023-01-14 13:48:26',_binary ''),(40809,'379/356/411_IPC ',10,'2023-01-14 13:48:26',_binary ''),(40830,'302/201/34_IPC ',10,'2023-01-14 13:48:26',_binary ''),(40875,'_NDPS Act',10,'2023-01-14 13:48:27',_binary ''),(40878,'33.D _Excise ACT ',10,'2023-01-14 13:48:27',_binary ''),(40884,'382/34_IPC',10,'2023-01-14 13:48:27',_binary ''),(40890,'436/34_IPC',10,'2023-01-14 13:48:27',_binary ''),(40929,'33D _Excise ACT ',10,'2023-01-14 13:48:27',_binary ''),(40971,'33/58_Excise ACT ',10,'2023-01-14 13:48:28',_binary ''),(40974,'394/411_CrPC',10,'2023-01-14 13:48:28',_binary ''),(40989,'379/ 411_IPC',10,'2023-01-14 13:48:28',_binary ''),(41004,'25/411_Arms Act',10,'2023-01-14 13:48:28',_binary ''),(41007,'41.1D & 102 _CrPC',10,'2023-01-14 13:48:28',_binary ''),(41013,'67/67B _IT ACT  ',10,'2023-01-14 13:48:28',_binary ''),(41037,'420/354D/120B/509/34_IPC',10,'2023-01-14 13:48:28',_binary ''),(41067,'379/411_CrPC',10,'2023-01-14 13:48:29',_binary ''),(41109,'323/324/506/34_IPC',10,'2023-01-14 13:48:29',_binary ''),(41121,'66/78_CR ACT ',10,'2023-01-14 13:48:29',_binary ''),(41124,'147/148/149/506/383_IPC',10,'2023-01-14 13:48:29',_binary ''),(41130,'3/4/9/55_GAMBLING ACT ',10,'2023-01-14 13:48:29',_binary ''),(41148,'307/302_IPC ',10,'2023-01-14 13:48:29',_binary ''),(41178,'63_C R ACT',10,'2023-01-14 13:48:30',_binary ''),(41196,'392/323/383/506/120B_IPC',10,'2023-01-14 13:48:30',_binary ''),(41199,'364A/34/120B_IPC',10,'2023-01-14 13:48:30',_binary ''),(41211,'354/376_IPC',10,'2023-01-14 13:48:30',_binary ''),(41226,'434/380_IPC',10,'2023-01-14 13:48:30',_binary ''),(41232,'437/380/411/34_IPC',10,'2023-01-14 13:48:30',_binary ''),(41241,'100_DP Act',10,'2023-01-14 13:48:30',_binary ''),(41250,'107_CrPC',10,'2023-01-14 13:48:31',_binary ''),(41253,'147/148/149/427_IPC',10,'2023-01-14 13:48:31',_binary ''),(41259,'397/402_IPC',10,'2023-01-14 13:48:31',_binary ''),(41268,'498A/307_IPC',10,'2023-01-14 13:48:31',_binary ''),(41280,'498A/406/586/354/323/392/34_IPC',10,'2023-01-14 13:48:31',_binary ''),(41295,'5/3/4/55_Gambling Act',10,'2023-01-14 13:48:31',_binary ''),(41304,'102_DP ACT',10,'2023-01-14 13:48:31',_binary ''),(41322,'363/368_IPC',10,'2023-01-14 13:48:31',_binary ''),(41331,'307/507/34_IPC',10,'2023-01-14 13:48:31',_binary ''),(41340,'498A/304B/34 _IPC',10,'2023-01-14 13:48:31',_binary ''),(41349,'307/302/34 _IPC',10,'2023-01-14 13:48:32',_binary ''),(41361,'279/37 _IPC',10,'2023-01-14 13:48:32',_binary ''),(41415,'363/376/328 _IPC',10,'2023-01-14 13:48:32',_binary ''),(41421,'392/397/34 _IPC',10,'2023-01-14 13:48:32',_binary ''),(41424,'3/5/7/9/35 _Gambling Act',10,'2023-01-14 13:48:32',_binary ''),(41427,'304/34 _IPC',10,'2023-01-14 13:48:32',_binary ''),(41436,'323/341/308/34_IPC',10,'2023-01-14 13:48:32',_binary ''),(41448,'380/457 _IPC',10,'2023-01-14 13:48:33',_binary ''),(41460,'489B/489C/34 _IPC',10,'2023-01-14 13:48:33',_binary ''),(41487,'13_Electricity Act ',10,'2023-01-14 13:48:33',_binary ''),(41490,'468/471/420/34_IPC',10,'2023-01-14 13:48:33',_binary ''),(41496,'408_IPC ',10,'2023-01-14 13:48:33',_binary ''),(41511,'376/342/506_IPC ',10,'2023-01-14 13:48:33',_binary ''),(41514,'147/148/434/427_IPC ',10,'2023-01-14 13:48:33',_binary ''),(41520,'364/304_IPC ',10,'2023-01-14 13:48:33',_binary ''),(41523,'63/68_CR Act ',10,'2023-01-14 13:48:33',_binary ''),(41544,'379/411/34 _IPC ',10,'2023-01-14 13:48:34',_binary ''),(41556,'288/337_IPC ',10,'2023-01-14 13:48:34',_binary ''),(41562,'392/411/34 _IPC ',10,'2023-01-14 13:48:34',_binary ''),(41565,'411/482/34_IPC ',10,'2023-01-14 13:48:34',_binary ''),(41571,'307/354/498A/323/34_IPC ',10,'2023-01-14 13:48:34',_binary ''),(41577,'356/411/34_IPC ',10,'2023-01-14 13:48:34',_binary ''),(41583,'498A/304B/34 _IPC ',10,'2023-01-14 13:48:34',_binary ''),(41601,'437/380/411_IPC ',10,'2023-01-14 13:48:34',_binary ''),(41607,'380/511/427/323_IPC ',10,'2023-01-14 13:48:34',_binary ''),(41625,'323/34_IPC ',10,'2023-01-14 13:48:34',_binary ''),(41634,'376(G)/354/452/34 _IPC ',10,'2023-01-14 13:48:35',_binary ''),(41635,'5/(8)/6_POCSO Act ',10,'2023-01-14 13:48:35',_binary ''),(41697,'33_Excise ACT ',10,'2023-01-14 13:48:35',_binary ''),(41721,'354/354B/509/506/323/34 _IPC',10,'2023-01-14 13:48:35',_binary ''),(41797,'& 4 POCSO _ACT ',10,'2023-01-14 13:48:36',_binary ''),(41835,'33/58 D EX _ACT ',10,'2023-01-14 13:48:37',_binary ''),(41848,'39/44_EX ACT ',10,'2023-01-14 13:48:37',_binary ''),(41851,'39_EX ACT ',10,'2023-01-14 13:48:37',_binary ''),(41859,'324/323/427/34_IPC ',10,'2023-01-14 13:48:37',_binary ''),(41877,'65_C R ACT ',10,'2023-01-14 13:48:37',_binary ''),(41898,'379/34 _IPC',10,'2023-01-14 13:48:37',_binary ''),(41910,'308/323/341/427/34 _IPC',10,'2023-01-14 13:48:37',_binary ''),(41937,'279/338/306_IPC ',10,'2023-01-14 13:48:38',_binary ''),(41946,'23/324/452/457/34_IPC ',10,'2023-01-14 13:48:38',_binary ''),(41949,'356/379/411_IPC ',10,'2023-01-14 13:48:38',_binary ''),(41970,'380/411/34/120B_IPC ',10,'2023-01-14 13:48:38',_binary ''),(42003,'396_IPC ',10,'2023-01-14 13:48:38',_binary ''),(42004,'25/27/54/59_Arms Act ',10,'2023-01-14 13:48:38',_binary ''),(42006,'451/423/506/427/509/34_IPC ',10,'2023-01-14 13:48:38',_binary ''),(42009,'471_IPC ',10,'2023-01-14 13:48:38',_binary ''),(42024,'448_IPC ',10,'2023-01-14 13:48:39',_binary ''),(42051,'379/41/482/34_IPC',10,'2023-01-14 13:48:39',_binary ''),(42054,'186/323/506/34_IPC ',10,'2023-01-14 13:48:39',_binary ''),(42060,'177_CrPC ',10,'2023-01-14 13:48:39',_binary ''),(42066,'285/304A_IPC ',10,'2023-01-14 13:48:39',_binary ''),(42081,'354/307/323/341/332_IPC ',10,'2023-01-14 13:48:39',_binary ''),(42087,'452/323/398/34 _IPC ',10,'2023-01-14 13:48:39',_binary ''),(42096,'377/511_IPC ',10,'2023-01-14 13:48:39',_binary ''),(42132,'376/342/506 IPC_IPC',10,'2023-01-14 13:48:40',_binary ''),(42135,'376/451/506_IPC',10,'2023-01-14 13:48:40',_binary ''),(42153,'325/34_IPC ',10,'2023-01-14 13:48:40',_binary ''),(42159,'356/36/380/34_IPC ',10,'2023-01-14 13:48:40',_binary ''),(42174,'232/452/427/506/34_HC JAGDISH ',10,'2023-01-14 13:48:40',_binary ''),(42186,'63_CrPC ',10,'2023-01-14 13:48:40',_binary ''),(42204,'395/397/411_IPC ',10,'2023-01-14 13:48:40',_binary ''),(42210,'498A/302/120B _IPC ',10,'2023-01-14 13:48:41',_binary ''),(42213,'454/380/511_IPC ',10,'2023-01-14 13:48:41',_binary ''),(42219,'324/427/506/34_IPC ',10,'2023-01-14 13:48:41',_binary ''),(42225,'52A/63/65/63_CR Act ',10,'2023-01-14 13:48:41',_binary ''),(42234,'336/304A_IPC ',10,'2023-01-14 13:48:41',_binary ''),(42237,'363/309/201_IPC ',10,'2023-01-14 13:48:41',_binary ''),(42243,'386/506/34_IPC ',10,'2023-01-14 13:48:41',_binary ''),(42255,'32/11/113_DP Act ',10,'2023-01-14 13:48:41',_binary ''),(42258,'394/536/411/34_IPC',10,'2023-01-14 13:48:41',_binary ''),(42279,'61/1/14_IPC',10,'2023-01-14 13:48:41',_binary ''),(42285,'135_Excise',10,'2023-01-14 13:48:41',_binary ''),(42294,'304A/336_IPC',10,'2023-01-14 13:48:41',_binary ''),(42303,'437/380/511/34_IPC',10,'2023-01-14 13:48:41',_binary ''),(42309,'83_CrPC',10,'2023-01-14 13:48:42',_binary ''),(42327,'320/411_IPC',10,'2023-01-14 13:48:42',_binary ''),(42333,'186/353/373/352/34_IPC',10,'2023-01-14 13:48:42',_binary ''),(42336,'323/354/506/34_IPC',10,'2023-01-14 13:48:42',_binary ''),(42363,'25/54/59_ARMS ACT ',10,'2023-01-14 13:48:42',_binary ''),(42372,'341/323/324/506/34_IPC ',10,'2023-01-14 13:48:42',_binary ''),(42387,'498A/406/304B_IPC ',10,'2023-01-14 13:48:42',_binary ''),(42390,'365/367/302 _IPC ',10,'2023-01-14 13:48:42',_binary ''),(42402,'292A/509_IPC ',10,'2023-01-14 13:48:43',_binary ''),(42405,'53/63/364_IPC ',10,'2023-01-14 13:48:43',_binary ''),(42438,'406/34_IPC ',10,'2023-01-14 13:48:43',_binary ''),(42441,'363/364_IPC',10,'2023-01-14 13:48:43',_binary ''),(42450,'399_IPC ',10,'2023-01-14 13:48:43',_binary ''),(42465,'186/153/307/392/34_IPC ',10,'2023-01-14 13:48:43',_binary ''),(42468,'479/311/34_IPC ',10,'2023-01-14 13:48:43',_binary ''),(42477,'323/356/379/34_IPC',10,'2023-01-14 13:48:43',_binary ''),(42486,'135/138/150_E V ACT',10,'2023-01-14 13:48:43',_binary ''),(42489,'135/150_E V ACT',10,'2023-01-14 13:48:43',_binary ''),(42492,'452/324/506/34_IPC',10,'2023-01-14 13:48:44',_binary ''),(42495,'292/294_IPC',10,'2023-01-14 13:48:44',_binary ''),(42504,'307/34/323/427/_IPC',10,'2023-01-14 13:48:44',_binary ''),(42522,'498A/304A_IPC',10,'2023-01-14 13:48:44',_binary ''),(42540,'365/392/411_IPC',10,'2023-01-14 13:48:44',_binary ''),(42555,'302/394/397/34_IPC',10,'2023-01-14 13:48:44',_binary ''),(42570,'288/337_IPC',10,'2023-01-14 13:48:44',_binary ''),(42573,'Jun-24_CTP ACT',10,'2023-01-14 13:48:44',_binary ''),(42585,'38_Excise',10,'2023-01-14 13:48:44',_binary ''),(42591,'363/342/376_IPC',10,'2023-01-14 13:48:45',_binary ''),(42615,'109_CrPC',10,'2023-01-14 13:48:45',_binary ''),(42621,'308/341/34 _IPC',10,'2023-01-14 13:48:45',_binary ''),(42624,'377/511 _IPC',10,'2023-01-14 13:48:45',_binary ''),(42627,'256/379/411_IPC',10,'2023-01-14 13:48:45',_binary ''),(42633,'04-May_TOBACCO ACT',10,'2023-01-14 13:48:45',_binary ''),(42645,'304A_DP Act',10,'2023-01-14 13:48:45',_binary ''),(42651,'498A/406/34 _IPC',10,'2023-01-14 13:48:45',_binary ''),(42657,'457/506_IPC ',10,'2023-01-14 13:48:45',_binary ''),(42666,'454_IPC ',10,'2023-01-14 13:48:45',_binary ''),(42669,'328/304_IPC ',10,'2023-01-14 13:48:45',_binary ''),(42672,'452/325/34_IPC ',10,'2023-01-14 13:48:45',_binary ''),(42678,'302/307/397/34_IPC ',10,'2023-01-14 13:48:45',_binary ''),(42690,'285/336 _IPC ',10,'2023-01-14 13:48:46',_binary ''),(42696,'429/469/468/471/120B_IPC',10,'2023-01-14 13:48:46',_binary ''),(42702,'379/427/411_IPC',10,'2023-01-14 13:48:46',_binary ''),(42711,'279/337_CrPC',10,'2023-01-14 13:48:46',_binary ''),(42714,'420/468/471/34_CrPC',10,'2023-01-14 13:48:46',_binary ''),(42717,'406/419/420/468/411/506/120_IPC',10,'2023-01-14 13:48:46',_binary ''),(42729,'399/397/34_IPC',10,'2023-01-14 13:48:46',_binary ''),(42735,'Jun-24_CPT ACT',10,'2023-01-14 13:48:46',_binary ''),(42741,'323/324/307/302/452/147/148/149_IPC',10,'2023-01-14 13:48:46',_binary ''),(42744,'Jun-24_Others',10,'2023-01-14 13:48:46',_binary ''),(42747,'273/384/337_IPC',10,'2023-01-14 13:48:46',_binary ''),(42750,'376/342_IPC',10,'2023-01-14 13:48:46',_binary ''),(42753,'380/437_IPC',10,'2023-01-14 13:48:46',_binary ''),(42756,'6/21/11_COTPA ACT',10,'2023-01-14 13:48:46',_binary ''),(42777,'25/54/57_Arms Act',10,'2023-01-14 13:48:46',_binary ''),(42798,'379/411 IPC_IPC',10,'2023-01-14 13:48:47',_binary ''),(42819,'392/342_IPC ',10,'2023-01-14 13:48:47',_binary ''),(42822,'498A/406/506_IPC ',10,'2023-01-14 13:48:47',_binary ''),(42835,'34_EX ACT ',10,'2023-01-14 13:48:47',_binary ''),(42864,'Mar-65_CR ACT',10,'2023-01-14 13:48:47',_binary ''),(42867,'379/411/382_IPC',10,'2023-01-14 13:48:47',_binary ''),(42876,'498A/406 _IPC',10,'2023-01-14 13:48:48',_binary ''),(42894,'63/68_CrPC ',10,'2023-01-14 13:48:48',_binary ''),(42897,'39/44_Excise Act ',10,'2023-01-14 13:48:48',_binary ''),(42903,'420/511/34 _IPC',10,'2023-01-14 13:48:48',_binary ''),(42907,'39/44_ER ACT ',10,'2023-01-14 13:48:48',_binary ''),(42912,'307/309_IPC ',10,'2023-01-14 13:48:48',_binary ''),(42942,'323/342/354/506/34_IPC',10,'2023-01-14 13:48:48',_binary ''),(43005,'5_EP Act 1986',10,'2023-01-14 13:48:49',_binary ''),(43014,'66_ IT Act ',10,'2023-01-14 13:48:49',_binary ''),(43023,'185 MV ACT',11,'2023-01-16 08:06:38',_binary ''),(43024,'395/451/170/465/471/342/354/120B IPC',11,'2023-01-16 08:49:43',_binary ''),(43025,'420/468/471 IPC',11,'2023-01-17 03:36:20',_binary ''),(43026,'354/313/498A/323/34 IPC',11,'2023-01-18 06:27:19',_binary ''),(43027,'186/342/411/120B/34 IPC',11,'2023-01-18 07:14:55',_binary ''),(43028,'297 IPC',11,'2023-02-22 08:39:48',_binary ''),(43029,'25 NDPS',11,'2023-02-22 10:09:45',_binary ''),(43030,'186/153',11,'2023-02-23 09:31:42',_binary ''),(43031,'354/491/367/506',11,'2023-02-25 11:25:09',_binary ''),(43032,'21-61-85_NDPS Act',10,'2023-02-26 13:56:54',_binary ''),(43101,'419/420_IPC',10,'2023-02-26 13:56:55',_binary ''),(43104,'323/304_IPC',10,'2023-02-26 13:56:55',_binary ''),(43116,'382/454/411_IPC',10,'2023-02-26 13:56:55',_binary ''),(43134,'363/366/370/376/34_IPC',10,'2023-02-26 13:56:56',_binary ''),(43143,'302/201/34_IPC',10,'2023-02-26 13:56:56',_binary ''),(43146,'13/113_DP Act',10,'2023-02-26 13:56:56',_binary ''),(43152,'302/341/120B_IPC',10,'2023-02-26 13:56:56',_binary ''),(43164,'354/323/452/506_IPC',10,'2023-02-26 13:56:56',_binary ''),(43188,'May-15_ENVIRONMENT',10,'2023-02-26 13:56:57',_binary ''),(43206,'379/34_',10,'2023-02-26 13:56:57',_binary ''),(43218,'463/473_IPC',10,'2023-02-26 13:56:57',_binary ''),(43230,'323_IPC',10,'2023-02-26 13:56:57',_binary ''),(43233,'61_EXCISE ACT',10,'2023-02-26 13:56:57',_binary ''),(43242,'498_IPC',10,'2023-02-26 13:56:57',_binary ''),(43248,'03-04-2009_Gambling Act',10,'2023-02-26 13:56:57',_binary ''),(43269,'32.1/113_DP Act',10,'2023-02-26 13:56:58',_binary ''),(43284,'379/506_IPC',10,'2023-02-26 13:56:58',_binary ''),(43296,'324/341_IPC',10,'2023-02-26 13:56:58',_binary ''),(43347,'323/336/341/308/34_IPC',10,'2023-02-26 13:56:59',_binary ''),(43353,'420/468/411_IPC',10,'2023-02-26 13:56:59',_binary ''),(43369,'39_ELECTRICITY ACT',10,'2023-02-26 13:56:59',_binary ''),(43371,'279/304/304A_IPC',10,'2023-02-26 13:56:59',_binary ''),(43383,'102_CR.P.C.',10,'2023-02-26 13:56:59',_binary ''),(43387,'39_ELECTRICITY ACTACT',10,'2023-02-26 13:56:59',_binary ''),(43398,'61_EX ACT.',10,'2023-02-26 13:56:59',_binary ''),(43405,'39_E. ACT',10,'2023-02-26 13:57:00',_binary ''),(43407,'379/411/356_IPC',10,'2023-02-26 13:57:00',_binary ''),(43410,'448_IPC',10,'2023-02-26 13:57:00',_binary ''),(43413,'420/380/411_IPC',10,'2023-02-26 13:57:00',_binary ''),(43416,'307/326/506/34_IPC',10,'2023-02-26 13:57:00',_binary ''),(43440,'May-15_ENVIRONMENT ACT',10,'2023-02-26 13:57:00',_binary ''),(43473,'354/354B/379/365/511/34_IPC',10,'2023-02-26 13:57:01',_binary ''),(43491,'465/466/379/468/471_IPC',10,'2023-02-26 13:57:01',_binary ''),(43503,'392/397/387_IPC',10,'2023-02-26 13:57:01',_binary ''),(43510,'04-Jun_POCSO ACT',10,'2023-02-26 13:57:01',_binary ''),(43512,'354/354B/323/506/509/34_IPC',10,'2023-02-26 13:57:01',_binary ''),(43515,'323/376/377/506/509_IPC',10,'2023-02-26 13:57:01',_binary ''),(43545,'323/354/356/452/427/34_IPC',10,'2023-02-26 13:57:02',_binary ''),(43566,'379/323_IPC',10,'2023-02-26 13:57:02',_binary ''),(43596,'420/467/468/471/120B/34_IPC',10,'2023-02-26 13:57:03',_binary ''),(43602,'376/377/506/509/120B_IPC',10,'2023-02-26 13:57:03',_binary ''),(43611,'420/467/468/471/506/120B/34_IPC',10,'2023-02-26 13:57:03',_binary ''),(43620,'03-Apr_DOWRY PROHIBITION ACT',10,'2023-02-26 13:57:03',_binary ''),(43674,'41.1C/102_CrPC',10,'2023-02-26 13:57:04',_binary ''),(43692,'307/394/341_IPC',10,'2023-02-26 13:57:04',_binary ''),(43707,'328/354/506_IPC',10,'2023-02-26 13:57:05',_binary ''),(43743,'370/370A/120B_IPC',10,'2023-02-26 13:57:05',_binary ''),(43752,'379_CrPC',10,'2023-02-26 13:57:05',_binary ''),(43755,'457/392/394/511/34_IPC',10,'2023-02-26 13:57:05',_binary ''),(43758,'224_IPC',10,'2023-02-26 13:57:06',_binary ''),(43791,'61_Excise',10,'2023-02-26 13:57:06',_binary ''),(43794,'4-5-9-55_Gambling Act',10,'2023-02-26 13:57:06',_binary ''),(43800,'370/370A/120B/376_IPC',10,'2023-02-26 13:57:06',_binary ''),(43824,'323/342/313/506/376_IPC',10,'2023-02-26 13:57:07',_binary ''),(43845,'186/353/332/382/511/34_IPC',10,'2023-02-26 13:57:07',_binary ''),(43863,'336/323/506/34_IPC',10,'2023-02-26 13:57:07',_binary ''),(43869,'03-09-1955_Gambling Act',10,'2023-02-26 13:57:07',_binary ''),(43887,'363/376/34_IPC',10,'2023-02-26 13:57:08',_binary ''),(43920,'10_POCSO ACT',10,'2023-02-26 13:57:08',_binary ''),(43953,'386/353/332/342/34_IPC',10,'2023-02-26 13:57:09',_binary ''),(43980,'03-04-1955_Gambling Act',10,'2023-02-26 13:57:09',_binary ''),(44011,'24/54/59_Arms Act',10,'2023-02-26 13:57:10',_binary ''),(44019,'160_IPC',10,'2023-02-26 13:57:10',_binary ''),(44025,'307/452/308/34_IPC',10,'2023-02-26 13:57:10',_binary ''),(44037,'380/458_IPC',10,'2023-02-26 13:57:10',_binary ''),(44070,'50_NDPS Act',10,'2023-02-26 13:57:11',_binary ''),(44085,'420/467/471/120B_IPC',10,'2023-02-26 13:57:11',_binary ''),(44103,'302/341_IPC',10,'2023-02-26 13:57:11',_binary ''),(44106,'376/387/326/420_IPC',10,'2023-02-26 13:57:11',_binary ''),(44142,'323/302/34_IPC',10,'2023-02-26 13:57:12',_binary ''),(44148,'302/323_IPC',10,'2023-02-26 13:57:12',_binary ''),(44163,'186/353/338_IPC',10,'2023-02-26 13:57:12',_binary ''),(44166,'304B/341_IPC',10,'2023-02-26 13:57:12',_binary ''),(44169,'186/353/308_IPC',10,'2023-02-26 13:57:12',_binary ''),(44223,'354/354B/452/509/34_IPC',10,'2023-02-26 13:57:13',_binary ''),(44235,'302/201_IPC',10,'2023-02-26 13:57:13',_binary ''),(44322,'323/325/34_IPC',10,'2023-02-26 13:57:14',_binary ''),(44349,'380/34_IPC',10,'2023-02-26 13:57:15',_binary ''),(44352,'399/402/34_IPC',10,'2023-02-26 13:57:15',_binary ''),(44358,'04-Aug_ITP Act',10,'2023-02-26 13:57:15',_binary ''),(44382,'413_IPC',10,'2023-02-26 13:57:15',_binary ''),(44415,'363/376/506/34_IPC',10,'2023-02-26 13:57:16',_binary ''),(44424,'420/467/468/471/474/120B/34_IPC',10,'2023-02-26 13:57:16',_binary ''),(44430,'3\\5\\55_Gambling Act',10,'2023-02-26 13:57:16',_binary ''),(44442,'20-61-85_NDPS Act',10,'2023-02-26 13:57:16',_binary ''),(44478,'3-4-5-9-55_Gambling Act',10,'2023-02-26 13:57:17',_binary ''),(44484,'420-468-471_IPC',10,'2023-02-26 13:57:17',_binary ''),(44487,'63-65_CR ACT',10,'2023-02-26 13:57:17',_binary ''),(44490,'17-18-61-85_NDPS Act',10,'2023-02-26 13:57:17',_binary ''),(44496,'365_IPC',10,'2023-02-26 13:57:17',_binary ''),(44499,'363/376/506_IPC',10,'2023-02-26 13:57:17',_binary ''),(44538,'328/381_IPC',10,'2023-02-26 13:57:18',_binary ''),(44547,'420/468/471/120/34_IPC',10,'2023-02-26 13:57:18',_binary ''),(44559,'420/468/471_IPC',10,'2023-02-26 13:57:18',_binary ''),(44580,'420/419/34_IPC',10,'2023-02-26 13:57:18',_binary ''),(44610,'28/112_DP Act',10,'2023-02-26 13:57:19',_binary ''),(44649,'307/323/324_IPC',10,'2023-02-26 13:57:19',_binary ''),(44667,'354A/354B/342_IPC',10,'2023-02-26 13:57:19',_binary ''),(44703,'376/376B/370/370A/34_IPC',10,'2023-02-26 13:57:20',_binary ''),(44712,'323/341/452_IPC',10,'2023-02-26 13:57:20',_binary ''),(44715,'366/376/506_IPC',10,'2023-02-26 13:57:20',_binary ''),(44724,'420/506_IPC',10,'2023-02-26 13:57:20',_binary ''),(44727,'63/68_COPY RIGHT',10,'2023-02-26 13:57:20',_binary ''),(44763,'379/350_IPC',10,'2023-02-26 13:57:21',_binary ''),(44781,'279/337/427_IPC',10,'2023-02-26 13:57:21',_binary ''),(44787,'307/341_IPC',10,'2023-02-26 13:57:21',_binary ''),(44814,'367/376_IPC',10,'2023-02-26 13:57:22',_binary ''),(44862,'186/353/332/506_IPC',10,'2023-02-26 13:57:22',_binary ''),(44886,'326/341_IPC',10,'2023-02-26 13:57:22',_binary ''),(44916,'419/466/471_IPC',10,'2023-02-26 13:57:23',_binary ''),(44937,'427/453_IPC',10,'2023-02-26 13:57:23',_binary ''),(44961,'323/325_IPC',10,'2023-02-26 13:57:23',_binary ''),(44985,'372/120B_IPC',10,'2023-02-26 13:57:24',_binary ''),(44988,'307/328_IPC',10,'2023-02-26 13:57:24',_binary ''),(44994,'366/369/34_IPC',10,'2023-02-26 13:57:24',_binary ''),(44997,'327/160/34_IPC',10,'2023-02-26 13:57:24',_binary ''),(45048,'323/328_IPC',10,'2023-02-26 13:57:24',_binary ''),(45105,'63/ 68_CR ACT',10,'2023-02-26 13:57:25',_binary ''),(45108,'486_IPC',10,'2023-02-26 13:57:25',_binary ''),(45150,'304/323_IPC',10,'2023-02-26 13:57:25',_binary ''),(45210,'307/394/411_IPC',10,'2023-02-26 13:57:26',_binary ''),(45225,'20/61/35_NDPS Act',10,'2023-02-26 13:57:26',_binary ''),(45228,'392/511_IPC',10,'2023-02-26 13:57:26',_binary ''),(45241,'75_JJ ACT',10,'2023-02-26 13:57:27',_binary ''),(45286,'66_IT ACT',10,'2023-02-26 13:57:27',_binary ''),(45288,'448/452/506/34_IPC',10,'2023-02-26 13:57:27',_binary ''),(45300,'A\\25/54/59_Arms Act',10,'2023-02-26 13:57:27',_binary ''),(45345,'354D/506/509_IPC',10,'2023-02-26 13:57:28',_binary ''),(45348,'395/511_IPC',10,'2023-02-26 13:57:28',_binary ''),(45369,'380/323/341/34_IPC',10,'2023-02-26 13:57:28',_binary ''),(45381,'Jul-20_COTPA ACT',10,'2023-02-26 13:57:28',_binary ''),(45384,'186/352/353_IPC',10,'2023-02-26 13:57:28',_binary ''),(45387,'307/352/323/341/354/356/506_IPC',10,'2023-02-26 13:57:28',_binary ''),(45396,'392/397/411/34/120B_IPC',10,'2023-02-26 13:57:28',_binary ''),(45402,'387/506_IPC',10,'2023-02-26 13:57:28',_binary ''),(45468,'9_Gambling Act',10,'2023-02-26 13:57:29',_binary ''),(45483,'254/54/59_Arms Act',10,'2023-02-26 13:57:29',_binary ''),(45530,'103',10,'2023-02-26 13:57:30',_binary ''),(45537,'365/323/341/342/354/354D/506_IPC',10,'2023-02-26 13:57:30',_binary ''),(45609,'188A/304B/34_IPC',10,'2023-02-26 13:57:31',_binary ''),(45666,'366/506/328_IPC',10,'2023-02-26 13:57:31',_binary ''),(45696,'420/380_IPC',10,'2023-02-26 13:57:32',_binary ''),(45705,'323/427_IPC',10,'2023-02-26 13:57:32',_binary ''),(45726,'393/398_IPC',10,'2023-02-26 13:57:32',_binary ''),(45738,'308/452/509/34_IPC',10,'2023-02-26 13:57:32',_binary ''),(45750,'376/406_IPC',10,'2023-02-26 13:57:32',_binary ''),(45762,'308/341/506/34_IPC',10,'2023-02-26 13:57:32',_binary ''),(45780,'380/457/511/34_IPC',10,'2023-02-26 13:57:33',_binary ''),(45783,'03-04-2012_Gambling Act',10,'2023-02-26 13:57:33',_binary ''),(45807,'307/454/323/341/354/354B/506/34_IPC',10,'2023-02-26 13:57:33',_binary ''),(45809,'4',10,'2023-02-26 13:57:33',_binary ''),(45819,'366/342/376D/34_IPC',10,'2023-02-26 13:57:33',_binary ''),(45822,'448/120B/506/34_IPC',10,'2023-02-26 13:57:33',_binary ''),(45825,'354A_IPC',10,'2023-02-26 13:57:33',_binary ''),(45837,'3/04/09/55_Gambling Act',10,'2023-02-26 13:57:33',_binary ''),(45903,'341/324_IPC',10,'2023-02-26 13:57:34',_binary ''),(45945,'347/398_IPC',10,'2023-02-26 13:57:34',_binary ''),(45951,'3_WB ACT',10,'2023-02-26 13:57:35',_binary ''),(45984,'323/342/506_IPC',10,'2023-02-26 13:57:35',_binary ''),(46026,'186/353/307/34_IPC',10,'2023-02-26 13:57:35',_binary ''),(46047,'489/487_IPC',10,'2023-02-26 13:57:36',_binary ''),(46071,'383/336/337_IPC',10,'2023-02-26 13:57:36',_binary ''),(46074,'323/341/336_IPC',10,'2023-02-26 13:57:36',_binary ''),(46092,'336/304A_IPC',10,'2023-02-26 13:57:36',_binary ''),(46098,'323/341/427/506/34_IPC',10,'2023-02-26 13:57:36',_binary ''),(46113,'336/338_IPC',10,'2023-02-26 13:57:36',_binary ''),(46149,'326/341/506_IPC',10,'2023-02-26 13:57:37',_binary ''),(46152,'341/452/323_IPC',10,'2023-02-26 13:57:37',_binary ''),(46158,'41.1B_CrPC',10,'2023-02-26 13:57:37',_binary ''),(46173,'354/324/506_IPC',10,'2023-02-26 13:57:37',_binary ''),(46221,'63-68_CR ACT',10,'2023-02-26 13:57:38',_binary ''),(46236,'354-452_IPC',10,'2023-02-26 13:57:38',_binary ''),(46248,'506-34_IPC',10,'2023-02-26 13:57:38',_binary ''),(46254,'420-406_IPC',10,'2023-02-26 13:57:38',_binary ''),(46257,'379-411_IPC',10,'2023-02-26 13:57:38',_binary ''),(46275,'380-457-411_IPC',10,'2023-02-26 13:57:38',_binary ''),(46284,'09-Oct_DPSH ACT',10,'2023-02-26 13:57:38',_binary ''),(46299,'304/341_IPC',10,'2023-02-26 13:57:39',_binary ''),(46311,'323/451/506_IPC',10,'2023-02-26 13:57:39',_binary ''),(46314,'354/341_IPC',10,'2023-02-26 13:57:39',_binary ''),(46368,'323/354/509_IPC',10,'2023-02-26 13:57:39',_binary ''),(46416,'323/341/506_IPC',10,'2023-02-26 13:57:40',_binary ''),(46446,'12/55/9_Gambling Act',10,'2023-02-26 13:57:40',_binary ''),(46461,'288-337_IPC',10,'2023-02-26 13:57:40',_binary ''),(46467,'4_EX ACT',10,'2023-02-26 13:57:40',_binary ''),(46473,'32\\113_DP Act',10,'2023-02-26 13:57:41',_binary ''),(46476,'33\\58D_Excise',10,'2023-02-26 13:57:41',_binary ''),(46491,'303_IPC',10,'2023-02-26 13:57:41',_binary ''),(46500,'448-452-506_IPC',10,'2023-02-26 13:57:41',_binary ''),(46503,'323-377_IPC',10,'2023-02-26 13:57:41',_binary ''),(46515,'386/457_IPC',10,'2023-02-26 13:57:41',_binary ''),(46539,'323/452_',10,'2023-02-26 13:57:41',_binary ''),(46545,'308/451_IPC',10,'2023-02-26 13:57:41',_binary ''),(46566,'3_DPDP ACT',10,'2023-02-26 13:57:42',_binary ''),(46584,'366/323/376/313/34_IPC',10,'2023-02-26 13:57:42',_binary ''),(46596,'307/326B/34_IPC',10,'2023-02-26 13:57:42',_binary ''),(46611,'3/4/12/9/55_Gambling Act',10,'2023-02-26 13:57:42',_binary ''),(46650,'304/498A/34_IPC',10,'2023-02-26 13:57:42',_binary ''),(46653,'307/452/323/341/354B/506/34_IPC',10,'2023-02-26 13:57:42',_binary ''),(46655,'25/27/54/59',10,'2023-02-26 13:57:42',_binary ''),(46656,'304B/498A/34_IPC',10,'2023-02-26 13:57:42',_binary ''),(46683,'406-498A_IPC',10,'2023-02-26 13:57:43',_binary ''),(46692,'364/302/34_IPC',10,'2023-02-26 13:57:43',_binary ''),(46698,'6_EC ACT',10,'2023-02-26 13:57:43',_binary ''),(46708,'39_E.L ACT',10,'2023-02-26 13:57:43',_binary ''),(46716,'324/452/506_IPC',10,'2023-02-26 13:57:43',_binary ''),(46737,'44,49_W.P ACT',10,'2023-02-26 13:57:43',_binary ''),(46752,'387/302_IPC',10,'2023-02-26 13:57:43',_binary ''),(46776,'341/323/506_IPC',10,'2023-02-26 13:57:44',_binary ''),(46824,'394/397/307_IPC',10,'2023-02-26 13:57:44',_binary ''),(46848,'354D/506/509/34_IPC',10,'2023-02-26 13:57:44',_binary ''),(46866,'135/150_ELECTRICITY ACT',10,'2023-02-26 13:57:45',_binary ''),(46875,'336/427_IPC',10,'2023-02-26 13:57:45',_binary ''),(46890,'360/457_IPC',10,'2023-02-26 13:57:45',_binary ''),(46899,'365/342/392/399/506/34_IPC',10,'2023-02-26 13:57:45',_binary ''),(46914,'354/354B/323/341/506/34_IPC',10,'2023-02-26 13:57:45',_binary ''),(46926,'323/452/34_IPC',10,'2023-02-26 13:57:45',_binary ''),(46980,'441/49_IPC',10,'2023-02-26 13:57:46',_binary ''),(47019,'341/347_IPC',10,'2023-02-26 13:57:46',_binary ''),(47031,'68_Excise',10,'2023-02-26 13:57:46',_binary ''),(47055,'92/93/97_DP Act',10,'2023-02-26 13:57:47',_binary ''),(47100,'304A/279_IPC',10,'2023-02-26 13:57:47',_binary ''),(47118,'302/307_IPC',10,'2023-02-26 13:57:47',_binary ''),(47139,'307/323_IPC',10,'2023-02-26 13:57:47',_binary ''),(47163,'381_IPC',10,'2023-02-26 13:57:48',_binary ''),(47172,'468/471/482_IPC',10,'2023-02-26 13:57:48',_binary ''),(47181,'294/341_IPC',10,'2023-02-26 13:57:48',_binary ''),(47214,'6_TOBBACO ACT',10,'2023-02-26 13:57:48',_binary ''),(47229,'342/452/120B_IPC',10,'2023-02-26 13:57:49',_binary ''),(47256,'308/326/341_IPC',10,'2023-02-26 13:57:49',_binary ''),(47259,'379/302/411_IPC',10,'2023-02-26 13:57:49',_binary ''),(47268,'12-09-1955_G ACT.',10,'2023-02-26 13:57:49',_binary ''),(47281,'39_ELECTRICITY  ACT',10,'2023-02-26 13:57:49',_binary ''),(47289,'12-09-1955_G. ACT.',10,'2023-02-26 13:57:49',_binary ''),(47292,'436/364A_IPC',10,'2023-02-26 13:57:49',_binary ''),(47322,'63/65/68_CR ACT.',10,'2023-02-26 13:57:49',_binary ''),(47358,'380/323/406/34_IPC',10,'2023-02-26 13:57:50',_binary ''),(47373,'15/61/85_NDPS ACT',10,'2023-02-26 13:57:50',_binary ''),(47385,'61/68_EXCISE ACT',10,'2023-02-26 13:57:50',_binary ''),(47391,'12_G ACT',10,'2023-02-26 13:57:50',_binary ''),(47460,'6_TOBACCO ACT',10,'2023-02-26 13:57:51',_binary ''),(47463,'3_CHILD ACT',10,'2023-02-26 13:57:51',_binary ''),(47493,'308/341_IPC',10,'2023-02-26 13:57:51',_binary ''),(47508,'3_Gambling Act',10,'2023-02-26 13:57:51',_binary ''),(47520,'379/341_IPC',10,'2023-02-26 13:57:52',_binary ''),(47543,'34',10,'2023-02-26 13:57:52',_binary ''),(47544,'354/35A_IPC',10,'2023-02-26 13:57:52',_binary ''),(47545,'08-Dec_POCSO ACT',10,'2023-02-26 13:57:52',_binary ''),(47556,'376/354/354D_IPC',10,'2023-02-26 13:57:52',_binary ''),(47565,'376/354D_IPC',10,'2023-02-26 13:57:52',_binary ''),(47574,'452/323/506/34_IPC',10,'2023-02-26 13:57:52',_binary ''),(47577,'457/392/397/411/341_IPC',10,'2023-02-26 13:57:52',_binary ''),(47634,'488/471_IPC',10,'2023-02-26 13:57:53',_binary ''),(47637,'387/392_IPC',10,'2023-02-26 13:57:53',_binary ''),(47661,'288_IPC',10,'2023-02-26 13:57:53',_binary ''),(47736,'41.1(d)_CrPC',10,'2023-02-26 13:57:54',_binary ''),(47862,'147/307_IPC',10,'2023-02-26 13:57:55',_binary ''),(47868,'304/323/324_IPC',10,'2023-02-26 13:57:55',_binary ''),(47895,'182_IPC',10,'2023-02-26 13:57:55',_binary ''),(47925,'376/323_IPC',10,'2023-02-26 13:57:56',_binary ''),(47937,'323/342/365/34_IPC',10,'2023-02-26 13:57:56',_binary ''),(47952,'380/511/427_IPC',10,'2023-02-26 13:57:56',_binary ''),(47982,'498A/308/342/323/506/509/34_IPC',10,'2023-02-26 13:57:56',_binary ''),(48000,'12\\9\\55_Gambling Act',10,'2023-02-26 13:57:57',_binary ''),(48012,'342/376/506/341_IPC',10,'2023-02-26 13:57:57',_binary ''),(48015,'376A/376B/377_IPC',10,'2023-02-26 13:57:57',_binary ''),(48051,'452/308_IPC',10,'2023-02-26 13:57:57',_binary ''),(48054,'40_Excise',10,'2023-02-26 13:57:57',_binary ''),(48066,'308/323/341/34_IPC',10,'2023-02-26 13:57:57',_binary ''),(48075,'420/467/468/506/120B_IPC',10,'2023-02-26 13:57:57',_binary ''),(48135,'306/323/324/341/34_IPC',10,'2023-02-26 13:57:58',_binary ''),(48138,'376/323/324_IPC',10,'2023-02-26 13:57:58',_binary ''),(48168,'307/365/34_IPC',10,'2023-02-26 13:57:58',_binary ''),(48183,'363/366/366A/376/506/34_IPC',10,'2023-02-26 13:57:58',_binary ''),(48195,'363/366/366A/306/506_IPC',10,'2023-02-26 13:57:59',_binary ''),(48228,'03-Apr_DP Act',10,'2023-02-26 13:57:59',_binary ''),(48252,'33/58_DP Act',10,'2023-02-26 13:57:59',_binary ''),(48279,'436_IPC',10,'2023-02-26 13:57:59',_binary ''),(48285,'186/353/352/307/34_IPC',10,'2023-02-26 13:57:59',_binary ''),(48288,'323/326_IPC',10,'2023-02-26 13:57:59',_binary ''),(48309,'3/5/9/55_Gambling Act',10,'2023-02-26 13:58:00',_binary ''),(48339,'302/392_IPC',10,'2023-02-26 13:58:00',_binary ''),(48354,'35_Excise',10,'2023-02-26 13:58:00',_binary ''),(48357,'392/323/511/34_IPC',10,'2023-02-26 13:58:00',_binary ''),(48369,'447_IPC',10,'2023-02-26 13:58:00',_binary ''),(48393,'392/394/389/34_IPC',10,'2023-02-26 13:58:01',_binary ''),(48460,'05-Jun_POCSO ACT',10,'2023-02-26 13:58:01',_binary ''),(48465,'5/2/9/55_Gambling Act',10,'2023-02-26 13:58:01',_binary ''),(48471,'384_IPC',10,'2023-02-26 13:58:01',_binary ''),(48486,'376C_IPC',10,'2023-02-26 13:58:02',_binary ''),(48504,'186/188_IPC',10,'2023-02-26 13:58:02',_binary ''),(48505,'9B_EXPLOSIVE ACT',10,'2023-02-26 13:58:02',_binary ''),(48510,'420/468/467/471/120B_IPC',10,'2023-02-26 13:58:02',_binary ''),(48549,'308/341/34_IPC',10,'2023-02-26 13:58:02',_binary ''),(48582,'420/7468/471/467/474/120B_IPC',10,'2023-02-26 13:58:03',_binary ''),(48654,'365/388/170/171/120B/34_IPC',10,'2023-02-26 13:58:04',_binary ''),(48660,'420/467/468/471/474/120B_IPC',10,'2023-02-26 13:58:04',_binary ''),(48672,'323/354/451/34_IPC',10,'2023-02-26 13:58:04',_binary ''),(48693,'380/457_',10,'2023-02-26 13:58:04',_binary ''),(48714,'125/9/55_Gambling Act',10,'2023-02-26 13:58:04',_binary ''),(48738,'356/506/34_IPC',10,'2023-02-26 13:58:04',_binary ''),(48753,'33/58D_Excise',10,'2023-02-26 13:58:05',_binary ''),(48774,'427/379/511_IPC',10,'2023-02-26 13:58:05',_binary ''),(48795,'12-09-1955_Excise',10,'2023-02-26 13:58:05',_binary ''),(48834,'302/363/201_IPC',10,'2023-02-26 13:58:05',_binary ''),(48852,'379/427_IPC',10,'2023-02-26 13:58:06',_binary ''),(48861,'380/455/459/34_IPC',10,'2023-02-26 13:58:06',_binary ''),(48864,'379\\411_IPC',10,'2023-02-26 13:58:06',_binary ''),(48891,'379/411/120B_IPC',10,'2023-02-26 13:58:06',_binary ''),(48892,'2/33/42/56/64_INDIAN FOREST ACT',10,'2023-02-26 13:58:06',_binary ''),(48897,'353/376(2)_IPC',10,'2023-02-26 13:58:06',_binary ''),(48903,'May-15_ENVIRONMENTAL ACT',10,'2023-02-26 13:58:06',_binary ''),(48970,'336/411/34_IPC',10,'2023-02-26 13:58:07',_binary ''),(48981,'376/498A/34_IPC',10,'2023-02-26 13:58:07',_binary ''),(48991,'323/341/308_IPC',10,'2023-02-26 13:58:07',_binary ''),(49005,'448/380_IPC',10,'2023-02-26 13:58:07',_binary ''),(49050,'324/326/506/308/377/34_IPC',10,'2023-02-26 13:58:08',_binary ''),(49056,'379/328/34_IPC',10,'2023-02-26 13:58:08',_binary ''),(49059,'307/342/427/506/341_IPC',10,'2023-02-26 13:58:08',_binary ''),(49065,'392/341_IPC',10,'2023-02-26 13:58:08',_binary ''),(49068,'279/186/353/34_IPC',10,'2023-02-26 13:58:08',_binary ''),(49070,'128/129/177',10,'2023-02-26 13:58:08',_binary ''),(49077,'419/420/468/467/471/34_IPC',10,'2023-02-26 13:58:08',_binary ''),(49083,'354/354A/457/380/511_IPC',10,'2023-02-26 13:58:08',_binary ''),(49086,'41.1(d)/102_CrPC',10,'2023-02-26 13:58:08',_binary ''),(49164,'3/4/9/55_IPC',10,'2023-02-26 13:58:09',_binary ''),(49167,'420/341_IPC',10,'2023-02-26 13:58:09',_binary ''),(49170,'379/411/462_IPC',10,'2023-02-26 13:58:09',_binary ''),(49173,'399/402/186/353/307/34_IPC',10,'2023-02-26 13:58:09',_binary ''),(49185,'323/336/341/506/34_IPC',10,'2023-02-26 13:58:09',_binary ''),(49197,'354/354B/506_IPC',10,'2023-02-26 13:58:09',_binary ''),(49209,'376/354D/506/511_IPC',10,'2023-02-26 13:58:09',_binary ''),(49221,'354/354B/323/452/509/506_IPC',10,'2023-02-26 13:58:10',_binary ''),(49257,'395/397/412/34/120B_IPC',10,'2023-02-26 13:58:10',_binary ''),(49272,'385/387/34_IPC',10,'2023-02-26 13:58:10',_binary ''),(49285,'2554/59_Arms Act',10,'2023-02-26 13:58:10',_binary ''),(49356,'307/336/34_IPC',10,'2023-02-26 13:58:11',_binary ''),(49368,'324/356_IPC',10,'2023-02-26 13:58:11',_binary ''),(49392,'279\\304A_IPC',10,'2023-02-26 13:58:11',_binary ''),(49401,'307/186_IPC',10,'2023-02-26 13:58:11',_binary ''),(49455,'380\\457_IPC',10,'2023-02-26 13:58:12',_binary ''),(49461,'279\\337_IPC',10,'2023-02-26 13:58:12',_binary ''),(49473,'25\\54_Arms Act',10,'2023-02-26 13:58:12',_binary ''),(49476,'392\\394\\397_IPC',10,'2023-02-26 13:58:12',_binary ''),(49488,'411\\34_IPC',10,'2023-02-26 13:58:12',_binary ''),(49491,'3\\4\\9\\55_Gambling Act',10,'2023-02-26 13:58:12',_binary ''),(49500,'363\\342\\376_IPC',10,'2023-02-26 13:58:13',_binary ''),(49503,'313\\377\\498A_IPC',10,'2023-02-26 13:58:13',_binary ''),(49506,'25\\27\\54\\59_Arms Act',10,'2023-02-26 13:58:13',_binary ''),(49509,'420\\467\\468\\471_IPC',10,'2023-02-26 13:58:13',_binary ''),(49512,'3\\4\\55_Gambling Act',10,'2023-02-26 13:58:13',_binary ''),(49551,'392\\34_IPC',10,'2023-02-26 13:58:13',_binary ''),(49557,'195A_IPC',10,'2023-02-26 13:58:13',_binary ''),(49587,'380\\411_IPC',10,'2023-02-26 13:58:14',_binary ''),(49590,'25\\54\\_Arms Act',10,'2023-02-26 13:58:14',_binary ''),(49593,'394\\397\\34_IPC',10,'2023-02-26 13:58:14',_binary ''),(49596,'25\\54\\59_Arms Act',10,'2023-02-26 13:58:14',_binary ''),(49599,'3\\4\\9_Gambling Act',10,'2023-02-26 13:58:14',_binary ''),(49632,'392\\397\\34_IPC',10,'2023-02-26 13:58:14',_binary ''),(49635,'380\\411\\_IPC',10,'2023-02-26 13:58:14',_binary ''),(49638,'03-04-1955_G ACT',10,'2023-02-26 13:58:14',_binary ''),(49650,'33\\38\\58_Excise',10,'2023-02-26 13:58:14',_binary ''),(49671,'394\\397\\120B\\411_IPC',10,'2023-02-26 13:58:14',_binary ''),(49672,'25\\27\\54_Arms Act',10,'2023-02-26 13:58:14',_binary ''),(49674,'279\\337\\304A_IPC',10,'2023-02-26 13:58:15',_binary ''),(49677,'451\\323\\506\\34_IPC',10,'2023-02-26 13:58:15',_binary ''),(49683,'153(A)(1)(b)\\295A_IPC',10,'2023-02-26 13:58:15',_binary ''),(49686,'393\\34_IPC',10,'2023-02-26 13:58:15',_binary ''),(49695,'379\\34_IPC',10,'2023-02-26 13:58:15',_binary ''),(49704,'328\\272_IPC',10,'2023-02-26 13:58:15',_binary ''),(49716,'380\\454\\411\\34_IPC',10,'2023-02-26 13:58:15',_binary ''),(49722,'307\\34\\_IPC',10,'2023-02-26 13:58:15',_binary ''),(49723,'25\\27_Arms Act',10,'2023-02-26 13:58:15',_binary ''),(49734,'379\\511\\411_IPC',10,'2023-02-26 13:58:15',_binary ''),(49737,'376D\\342\\506\\34_IPC',10,'2023-02-26 13:58:15',_binary ''),(49738,'3\\5_ITP Act',10,'2023-02-26 13:58:15',_binary ''),(49752,'328\\376\\_IPC',10,'2023-02-26 13:58:15',_binary ''),(49753,'4 POSCO_',10,'2023-02-26 13:58:15',_binary ''),(49755,'420\\34_IPC',10,'2023-02-26 13:58:15',_binary ''),(49758,'379\\_IPC',10,'2023-02-26 13:58:15',_binary ''),(49761,'376\\506_IPC',10,'2023-02-26 13:58:15',_binary ''),(49767,'356\\379\\411_IPC',10,'2023-02-26 13:58:16',_binary ''),(49788,'377\\511_',10,'2023-02-26 13:58:16',_binary ''),(49789,'8 POCSO_',10,'2023-02-26 13:58:16',_binary ''),(49791,'356\\379\\411\\34_IPC',10,'2023-02-26 13:58:16',_binary ''),(49800,'20\\61\\85_NDPS Act',10,'2023-02-26 13:58:16',_binary ''),(49821,'379\\356\\411\\34_IPC',10,'2023-02-26 13:58:16',_binary ''),(49830,'379\\411_',10,'2023-02-26 13:58:16',_binary ''),(49836,'387\\34_IPC',10,'2023-02-26 13:58:16',_binary ''),(49848,'3\\4\\9\\55D_Gambling Act',10,'2023-02-26 13:58:16',_binary ''),(49854,'394\\34_IPC',10,'2023-02-26 13:58:16',_binary ''),(49857,'454\\380_IPC',10,'2023-02-26 13:58:16',_binary ''),(49863,'376\\363\\_IPC',10,'2023-02-26 13:58:17',_binary ''),(49866,'103 DP_DP Act',10,'2023-02-26 13:58:17',_binary ''),(49869,'408\\411_IPC',10,'2023-02-26 13:58:17',_binary ''),(49881,'394_IPC',10,'2023-02-26 13:58:17',_binary ''),(49890,'392\\397\\411_IPC',10,'2023-02-26 13:58:17',_binary ''),(49899,'452\\341\\323\\427\\506_IPC',10,'2023-02-26 13:58:17',_binary ''),(49905,'420\\468\\471_',10,'2023-02-26 13:58:17',_binary ''),(49908,'324\\341\\506_',10,'2023-02-26 13:58:17',_binary ''),(49917,'376\\354A_IPC',10,'2023-02-26 13:58:17',_binary ''),(49938,'323\\341\\354\\506_IPC',10,'2023-02-26 13:58:17',_binary ''),(49953,'398\\324_IPC',10,'2023-02-26 13:58:17',_binary ''),(49962,'452\\341\\427_IPC',10,'2023-02-26 13:58:18',_binary ''),(49980,'379\\356_IPC',10,'2023-02-26 13:58:18',_binary ''),(49986,'354B\\34_IPC',10,'2023-02-26 13:58:18',_binary ''),(49989,'394\\411_IPC',10,'2023-02-26 13:58:18',_binary ''),(50010,'302\\34_IPC',10,'2023-02-26 13:58:18',_binary ''),(50019,'498A\\354\\323\\34_IPC',10,'2023-02-26 13:58:18',_binary ''),(50052,'392/387/34_IPC',10,'2023-02-26 13:58:18',_binary ''),(50055,'12-Sep_Gambling Act',10,'2023-02-26 13:58:18',_binary ''),(50070,'356/379_',10,'2023-02-26 13:58:19',_binary ''),(50073,'506/509_IPC',10,'2023-02-26 13:58:19',_binary ''),(50074,'67_ITP Act',10,'2023-02-26 13:58:19',_binary ''),(50079,'25/59_Arms Act',10,'2023-02-26 13:58:19',_binary ''),(50088,'20/61_NDPS Act',10,'2023-02-26 13:58:19',_binary ''),(50109,'25/54_Arms Act',10,'2023-02-26 13:58:19',_binary ''),(50118,'Dec-55_Gambling Act',10,'2023-02-26 13:58:19',_binary ''),(50124,'307/147_IPC',10,'2023-02-26 13:58:19',_binary ''),(50148,'379/356_',10,'2023-02-26 13:58:19',_binary ''),(50155,'05-Jul_SBN ACT',10,'2023-02-26 13:58:19',_binary ''),(50166,'05-Sep_Gambling Act',10,'2023-02-26 13:58:20',_binary ''),(50190,'5.15_ENVIROMENT ACT',10,'2023-02-26 13:58:20',_binary ''),(50193,'279/337/304A_CrPC',10,'2023-02-26 13:58:20',_binary ''),(50214,'436/506_IPC',10,'2023-02-26 13:58:20',_binary ''),(50265,'33/58/D_Excise',10,'2023-02-26 13:58:21',_binary ''),(50289,'377 &_IPC',10,'2023-02-26 13:58:21',_binary ''),(50290,'6 POCSO ACT_',10,'2023-02-26 13:58:21',_binary ''),(50295,'323/336/506_IPC',10,'2023-02-26 13:58:21',_binary ''),(50304,'379/ 356_IPC',10,'2023-02-26 13:58:21',_binary ''),(50310,'411_',10,'2023-02-26 13:58:21',_binary ''),(50352,'32/113_',10,'2023-02-26 13:58:21',_binary ''),(50358,'377/34_IPC',10,'2023-02-26 13:58:21',_binary ''),(50359,'4 POSCO_ACT',10,'2023-02-26 13:58:21',_binary ''),(50367,'395/_IPC',10,'2023-02-26 13:58:22',_binary ''),(50376,'317_IPC',10,'2023-02-26 13:58:22',_binary ''),(50379,'392/397/_IPC',10,'2023-02-26 13:58:22',_binary ''),(50397,'379/411_',10,'2023-02-26 13:58:22',_binary ''),(50400,'279/304A_',10,'2023-02-26 13:58:22',_binary ''),(50430,'356/ 379_IPC',10,'2023-02-26 13:58:22',_binary ''),(50440,'6 POSCO ACT_',10,'2023-02-26 13:58:22',_binary ''),(50457,'102/41.1D_CrPC',10,'2023-02-26 13:58:22',_binary ''),(50467,'67 IT_ACT',10,'2023-02-26 13:58:22',_binary ''),(50472,'377/376_IPC',10,'2023-02-26 13:58:23',_binary ''),(50514,'379/420_IPC',10,'2023-02-26 13:58:23',_binary ''),(50533,'25/27_IPC',10,'2023-02-26 13:58:23',_binary ''),(50583,'420/467/468/_IPC',10,'2023-02-26 13:58:24',_binary ''),(50595,'376/363/366_IPC',10,'2023-02-26 13:58:24',_binary ''),(50598,'May-15_ACT',10,'2023-02-26 13:58:24',_binary ''),(50604,'3/4/_Gambling Act',10,'2023-02-26 13:58:24',_binary ''),(50637,'174_Excise',10,'2023-02-26 13:58:24',_binary ''),(50664,'323/509/308_IPC',10,'2023-02-26 13:58:24',_binary ''),(50697,'323/354/354B_',10,'2023-02-26 13:58:25',_binary ''),(50712,'307/25/54_IPC',10,'2023-02-26 13:58:25',_binary ''),(50733,'12/9/_Gambling Act',10,'2023-02-26 13:58:25',_binary ''),(50760,'435/34_IPC',10,'2023-02-26 13:58:25',_binary ''),(50766,'342/337_IPC',10,'2023-02-26 13:58:25',_binary ''),(50781,'102 CRPC_CrPC',10,'2023-02-26 13:58:26',_binary ''),(50784,'323/376_IPC',10,'2023-02-26 13:58:26',_binary ''),(50787,'420/188/120B_IPC',10,'2023-02-26 13:58:26',_binary ''),(50793,'319/34_IPC',10,'2023-02-26 13:58:26',_binary ''),(50808,'509/506/147/_IPC',10,'2023-02-26 13:58:26',_binary ''),(50869,'67_IT ACT',10,'2023-02-26 13:58:26',_binary ''),(50928,'328/576/506_IPC',10,'2023-02-26 13:58:27',_binary ''),(50973,'307/ 34_IPC',10,'2023-02-26 13:58:27',_binary ''),(50994,'336/341_IPC',10,'2023-02-26 13:58:28',_binary ''),(50995,'27/54_Arms Act',10,'2023-02-26 13:58:28',_binary ''),(51033,'489C/34_IPC',10,'2023-02-26 13:58:28',_binary ''),(51075,'489A/489C_IPC',10,'2023-02-26 13:58:28',_binary ''),(51082,'30_Arms Act',10,'2023-02-26 13:58:28',_binary ''),(51126,'384/509/506/376_IPC',10,'2023-02-26 13:58:29',_binary ''),(51138,'330/411_IPC',10,'2023-02-26 13:58:29',_binary ''),(51144,'41,1D_CrPC',10,'2023-02-26 13:58:29',_binary ''),(51150,'489_IPC',10,'2023-02-26 13:58:29',_binary ''),(51168,'429/34_',10,'2023-02-26 13:58:29',_binary ''),(51169,'04-May_DELHIC CULTURE',10,'2023-02-26 13:58:29',_binary ''),(51183,'389/411_IPC',10,'2023-02-26 13:58:29',_binary ''),(51201,'363/302_IPC',10,'2023-02-26 13:58:30',_binary ''),(51207,'448/511_IPC',10,'2023-02-26 13:58:30',_binary ''),(51217,'8 POCSCO_ACT',10,'2023-02-26 13:58:30',_binary ''),(51219,'63 CR ACT_C.R ACT',10,'2023-02-26 13:58:30',_binary ''),(51222,'328/341/506_IPC',10,'2023-02-26 13:58:30',_binary ''),(51237,'402/411_IPC',10,'2023-02-26 13:58:30',_binary ''),(51243,'452/342_IPC',10,'2023-02-26 13:58:30',_binary ''),(51246,'452/320_IPC',10,'2023-02-26 13:58:30',_binary ''),(51252,'25/54_IPC',10,'2023-02-26 13:58:30',_binary ''),(51264,'24/54_Arms Act',10,'2023-02-26 13:58:30',_binary ''),(51294,'147/148/506_IPC',10,'2023-02-26 13:58:31',_binary ''),(51300,'12-May_Gambling Act',10,'2023-02-26 13:58:31',_binary ''),(51318,'376A_IPC',10,'2023-02-26 13:58:31',_binary ''),(51321,'498A,304B_IPC',10,'2023-02-26 13:58:31',_binary ''),(51369,'304B_IPC',10,'2023-02-26 13:58:31',_binary ''),(51384,'376_',10,'2023-02-26 13:58:31',_binary ''),(51387,'67_ITT ACT',10,'2023-02-26 13:58:32',_binary ''),(51426,'342/506/34_IPC',10,'2023-02-26 13:58:32',_binary ''),(51441,'376/_IPC',10,'2023-02-26 13:58:32',_binary ''),(51447,'147/148/323_IPC',10,'2023-02-26 13:58:32',_binary ''),(51459,'392/395/120B_IPC',10,'2023-02-26 13:58:32',_binary ''),(51477,'315/34_IPC',10,'2023-02-26 13:58:32',_binary ''),(51549,'63 CR_ACT',10,'2023-02-26 13:58:33',_binary ''),(51564,'188/286_',10,'2023-02-26 13:58:33',_binary ''),(51565,'9B EX_ACT',10,'2023-02-26 13:58:33',_binary ''),(51576,'323/504/34_IPC',10,'2023-02-26 13:58:33',_binary ''),(51624,'328/376_IPC',10,'2023-02-26 13:58:34',_binary ''),(51654,'223/354B/506_IPC',10,'2023-02-26 13:58:34',_binary ''),(51687,'186/353/332/307_IPC',10,'2023-02-26 13:58:35',_binary ''),(51718,'511_IPC',10,'2023-02-26 13:58:35',_binary ''),(51747,'295A/506/511_',10,'2023-02-26 13:58:35',_binary ''),(51753,'27/61_NDPS Act',10,'2023-02-26 13:58:35',_binary ''),(51758,'s',10,'2023-02-26 13:58:35',_binary ''),(51855,'42/340_IPC',10,'2023-02-26 13:58:36',_binary ''),(51870,'61/85_NDPS Act',10,'2023-02-26 13:58:37',_binary ''),(51879,'498A,406,34_IPC',10,'2023-02-26 13:58:37',_binary ''),(51891,'33 EXCISE_NDPS Act',10,'2023-02-26 13:58:37',_binary ''),(51900,'354A,12 POCSO ACT_IPC',10,'2023-02-26 13:58:37',_binary ''),(51918,'452/506_IPC',10,'2023-02-26 13:58:37',_binary ''),(51978,'174 CRPC_',10,'2023-02-26 13:58:38',_binary ''),(51981,'66.1_',10,'2023-02-26 13:58:38',_binary ''),(51984,'323-328-354D-376-506-509_IPC',10,'2023-02-26 13:58:38',_binary ''),(51987,'379-411-482_IPC',10,'2023-02-26 13:58:38',_binary ''),(51990,'3-4-9-55_Gambling Act',10,'2023-02-26 13:58:38',_binary ''),(51993,'25-54-59_Arms Act',10,'2023-02-26 13:58:38',_binary ''),(51996,'323-341-354-354A-354B-506-509_IPC',10,'2023-02-26 13:58:38',_binary ''),(52014,'186/332/506_IPC',10,'2023-02-26 13:58:38',_binary ''),(52023,'354D/354C_IPC',10,'2023-02-26 13:58:38',_binary ''),(52146,'162 CRPC',11,'2023-02-27 07:41:02',_binary ''),(52147,'367/341',11,'2023-02-28 08:24:08',_binary ''),(52148,'153 DP ACT',11,'2023-03-01 08:50:22',_binary ''),(52149,'309 IPC',11,'2023-03-03 09:20:26',_binary ''),(52150,'40 A EXCISE ACT',11,'2023-03-11 12:03:33',_binary ''),(52151,'342 IPC',11,'2023-03-11 12:34:42',_binary ''),(52167,'35/379/411/34_IPC',10,'2023-04-17 15:19:35',_binary ''),(52170,'147/148/149/323/324/307/506_IPC',10,'2023-04-17 15:19:35',_binary ''),(52188,'3_DP',10,'2023-04-17 15:19:35',_binary ''),(52197,'323/341/324/506/34_IPC',10,'2023-04-17 15:19:35',_binary ''),(52200,'489B/489C_IPC',10,'2023-04-17 15:19:35',_binary ''),(52212,'395/397/120B_IPC',10,'2023-04-17 15:19:35',_binary ''),(52218,'308/323/452/34_IPC',10,'2023-04-17 15:19:35',_binary ''),(52242,'195A/506_IPC',10,'2023-04-17 15:19:36',_binary ''),(52245,'323/452/506/34_IPC',10,'2023-04-17 15:19:36',_binary ''),(52254,'63_CR.ACT',10,'2023-04-17 15:19:36',_binary ''),(52263,'395/397/412/120B_IPC',10,'2023-04-17 15:19:36',_binary ''),(52293,'380/427/_IPC',10,'2023-04-17 15:19:36',_binary ''),(52299,'5/15 ENVIREMENT_ACT',10,'2023-04-17 15:19:36',_binary ''),(52326,'376/363/174A/4_IPC',10,'2023-04-17 15:19:36',_binary ''),(52329,'376/366_IPC',10,'2023-04-17 15:19:36',_binary ''),(52365,'25/54/59 A.ACT_Arms Act',10,'2023-04-17 15:19:37',_binary ''),(52368,'174/CRPC_CrPC',10,'2023-04-17 15:19:37',_binary ''),(52371,'392/397/34IPC_IPC',10,'2023-04-17 15:19:37',_binary ''),(52374,'323/354/34IPC_IPC',10,'2023-04-17 15:19:37',_binary ''),(52389,'392/397/411/25A. ACT_IPC',10,'2023-04-17 15:19:37',_binary ''),(52413,'354/354A/354B/376_IPC',10,'2023-04-17 15:19:37',_binary ''),(52416,'33 EXCISE ACT_Excise',10,'2023-04-17 15:19:37',_binary ''),(52458,'451/323/341_IPC',10,'2023-04-17 15:19:37',_binary ''),(52464,'3(1)_DP Act',10,'2023-04-17 15:19:37',_binary ''),(52476,'384/411/34_IPC',10,'2023-04-17 15:19:37',_binary ''),(52488,'323/308/34_IPC',10,'2023-04-17 15:19:37',_binary ''),(52518,'323/354/506/509_IPC',10,'2023-04-17 15:19:38',_binary ''),(52527,'40A_Excise',10,'2023-04-17 15:19:38',_binary ''),(52533,'498/406/323/352/34 IPC_IPC',10,'2023-04-17 15:19:38',_binary ''),(52539,'323/341/452/506/34_IPC',10,'2023-04-17 15:19:38',_binary ''),(52542,'354/323/506/509/34_IPC',10,'2023-04-17 15:19:38',_binary ''),(52560,'33/38/58_Excise',10,'2023-04-17 15:19:38',_binary ''),(52608,'307/186/353/332/34_IPC',10,'2023-04-17 15:19:38',_binary ''),(52614,'323/377/452/506/34_IPC',10,'2023-04-17 15:19:38',_binary ''),(52653,'283/290_IPC',10,'2023-04-17 15:19:39',_binary ''),(52674,'135_Others',10,'2023-04-17 15:19:39',_binary ''),(52677,'135/138/150_Others',10,'2023-04-17 15:19:39',_binary ''),(52684,'_25',10,'2023-04-17 15:19:39',_binary ''),(52710,'436/304_IPC',10,'2023-04-17 15:19:39',_binary ''),(52725,'135/150_Others',10,'2023-04-17 15:19:39',_binary ''),(52743,'498/307/34_IPC',10,'2023-04-17 15:19:39',_binary ''),(52755,'364/201/302_IPC',10,'2023-04-17 15:19:40',_binary ''),(52770,'147/148/149/186/332/353_IPC',10,'2023-04-17 15:19:40',_binary ''),(52773,'12-09-1955_',10,'2023-04-17 15:19:40',_binary ''),(52777,'_4',10,'2023-04-17 15:19:40',_binary ''),(52779,'174_Others',10,'2023-04-17 15:19:40',_binary ''),(52791,'354/506/509_IPC',10,'2023-04-17 15:19:40',_binary ''),(52794,'354/376/506_IPC',10,'2023-04-17 15:19:40',_binary ''),(52795,'_8',10,'2023-04-17 15:19:40',_binary ''),(52855,'_6',10,'2023-04-17 15:19:40',_binary ''),(52866,'174_INQUEST',10,'2023-04-17 15:19:40',_binary ''),(52876,'_102',10,'2023-04-17 15:19:40',_binary ''),(52878,'323/354/354A_IPC',10,'2023-04-17 15:19:41',_binary ''),(52896,'176_`CRPC',10,'2023-04-17 15:19:41',_binary ''),(52929,'354D/341/506_IPC',10,'2023-04-17 15:19:41',_binary ''),(52951,'_12',10,'2023-04-17 15:19:41',_binary ''),(52986,'186/353/347/325B/34_IPC',10,'2023-04-17 15:19:41',_binary ''),(52989,'63_CR. ACT',10,'2023-04-17 15:19:41',_binary ''),(52998,'454/220/380/202/411/34_IPC',10,'2023-04-17 15:19:41',_binary ''),(53010,'377/392/506_IPC',10,'2023-04-17 15:19:42',_binary ''),(53028,'25_CrPC',10,'2023-04-17 15:19:42',_binary ''),(53076,'366_IPC',10,'2023-04-17 15:19:42',_binary ''),(53079,'307/302/34_IPC',10,'2023-04-17 15:19:42',_binary ''),(53082,'148/149/506_IPC',10,'2023-04-17 15:19:42',_binary ''),(53083,'_27',10,'2023-04-17 15:19:42',_binary ''),(53103,'452/323/376/34_IPC',10,'2023-04-17 15:19:42',_binary ''),(53106,'186/353/323/325_IPC',10,'2023-04-17 15:19:42',_binary ''),(53124,'395/397_IPC',10,'2023-04-17 15:19:42',_binary ''),(53142,'147/148/149/186//353/322/323/34_IPC',10,'2023-04-17 15:19:42',_binary ''),(53205,'337/304_IPC',10,'2023-04-17 15:19:43',_binary ''),(53208,'3/4/9/8_Gambling Act',10,'2023-04-17 15:19:43',_binary ''),(53226,'392/120/34_ROBBERY',10,'2023-04-17 15:19:43',_binary ''),(53289,'186/353/34_IPC',10,'2023-04-17 15:19:43',_binary ''),(53316,'379/411/332/186/353/34_IPC',10,'2023-04-17 15:19:43',_binary ''),(53319,'420/468/411/34_IPC',10,'2023-04-17 15:19:43',_binary ''),(53322,'363/302/34_IPC',10,'2023-04-17 15:19:43',_binary ''),(53391,'448/452/34_IPC',10,'2023-04-17 15:19:44',_binary ''),(53427,'420/467/468/34_IPC',10,'2023-04-17 15:19:44',_binary ''),(53451,'09-Oct_Others',10,'2023-04-17 15:19:44',_binary ''),(53460,'402/399_IPC',10,'2023-04-17 15:19:44',_binary ''),(53481,'309_IPC',10,'2023-04-17 15:19:44',_binary ''),(53562,'448/380/506/34_IPC',10,'2023-04-17 15:19:45',_binary ''),(53565,'307/308/382/34_IPC',10,'2023-04-17 15:19:45',_binary ''),(53577,'454/480/411_IPC',10,'2023-04-17 15:19:45',_binary ''),(53586,'1/3/9B_Others',10,'2023-04-17 15:19:45',_binary ''),(53589,'113/9B_Others',10,'2023-04-17 15:19:45',_binary ''),(53595,'419/420/34_IPC',10,'2023-04-17 15:19:45',_binary ''),(53598,'337/304A_IPC',10,'2023-04-17 15:19:45',_binary ''),(53622,'458/393/34_IPC',10,'2023-04-17 15:19:45',_binary ''),(53682,'63_COPYRIGHT',10,'2023-04-17 15:19:46',_binary ''),(53730,'354/323/451/506/509/34_IPC',10,'2023-04-17 15:19:46',_binary ''),(53742,'324/452/506/34IPC_IPC',10,'2023-04-17 15:19:46',_binary ''),(53760,'324/302/120B/34 IPC_IPC',10,'2023-04-17 15:19:46',_binary ''),(53769,'27 NDPS ACT_NDPS Act',10,'2023-04-17 15:19:46',_binary ''),(53787,'489 B_IPC',10,'2023-04-17 15:19:46',_binary ''),(53808,'66_DPACT',10,'2023-04-17 15:19:46',_binary ''),(53815,'_103',10,'2023-04-17 15:19:47',_binary ''),(53823,'9A/21/22/25/25A_NDPS Act',10,'2023-04-17 15:19:47',_binary ''),(53856,'307/452/324_IPC',10,'2023-04-17 15:19:47',_binary ''),(53871,'323/342/34_IPC',10,'2023-04-17 15:19:47',_binary ''),(53881,'_3/181,39/192,146/196,185',10,'2023-04-17 15:19:47',_binary ''),(53889,'323/324/452/34_IPC',10,'2023-04-17 15:19:47',_binary ''),(53904,'302/323/324/34_IPC',10,'2023-04-17 15:19:47',_binary ''),(53910,'420/406/34_IPC',10,'2023-04-17 15:19:47',_binary ''),(53931,'287/304_IPC',10,'2023-04-17 15:19:47',_binary ''),(53949,'308/323/506_IPC',10,'2023-04-17 15:19:47',_binary ''),(53979,'356/379/482/34_IPC',10,'2023-04-17 15:19:48',_binary ''),(53985,'63_CR .ACT',10,'2023-04-17 15:19:48',_binary ''),(53988,'09-Oct_DP Act',10,'2023-04-17 15:19:48',_binary ''),(54006,'3/9/4/55_Gambling Act',10,'2023-04-17 15:19:48',_binary ''),(54018,'98/113_Others',10,'2023-04-17 15:19:48',_binary ''),(54054,'341/323/308/34_IPC',10,'2023-04-17 15:19:48',_binary ''),(54117,'63/65/68_CR.ACT',10,'2023-04-17 15:19:48',_binary ''),(54129,'411/24_IPC',10,'2023-04-17 15:19:48',_binary ''),(54180,'354/509/506/34_IPC',10,'2023-04-17 15:19:49',_binary ''),(54201,'323/354/354B/509/34_IPC',10,'2023-04-17 15:19:49',_binary ''),(54204,'_Others',10,'2023-04-17 15:19:49',_binary ''),(54207,'384/506/34_IPC',10,'2023-04-17 15:19:49',_binary ''),(54213,'May-15_Others',10,'2023-04-17 15:19:49',_binary ''),(54219,'302/_IPC',10,'2023-04-17 15:19:49',_binary ''),(54222,'302/363_IPC',10,'2023-04-17 15:19:49',_binary ''),(54225,'411/468/471_IPC',10,'2023-04-17 15:19:49',_binary ''),(54228,'377/404_IPC',10,'2023-04-17 15:19:49',_binary ''),(54267,'406/411_IPC',10,'2023-04-17 15:19:49',_binary ''),(54300,'323/186/353_IPC',10,'2023-04-17 15:19:49',_binary ''),(54309,'342/308/34_IPC',10,'2023-04-17 15:19:49',_binary ''),(54312,'63/65/68_CR. ACT',10,'2023-04-17 15:19:50',_binary ''),(54321,'292/34_IPC',10,'2023-04-17 15:19:50',_binary ''),(54333,'307/34/332/186_IPC',10,'2023-04-17 15:19:50',_binary ''),(54360,'353/308_IPC',10,'2023-04-17 15:19:50',_binary ''),(54378,'409/498_IPC',10,'2023-04-17 15:19:50',_binary ''),(54474,'304A/338/337/288/277_IPC',10,'2023-04-17 15:19:50',_binary ''),(54489,'4/5/7/8_ITP Act',10,'2023-04-17 15:19:51',_binary ''),(54579,'393_IPC',10,'2023-04-17 15:19:51',_binary ''),(54607,'_25/27',10,'2023-04-17 15:19:51',_binary ''),(54663,'324/326/34_IPC',10,'2023-04-17 15:19:52',_binary ''),(54666,'411/468/34_IPC',10,'2023-04-17 15:19:52',_binary ''),(54723,'28/110_DP Act',10,'2023-04-17 15:19:52',_binary ''),(54729,'366/368/376/34_IPC',10,'2023-04-17 15:19:52',_binary ''),(54732,'3/4/7/55_Gambling Act',10,'2023-04-17 15:19:52',_binary ''),(54744,'420/465/467/471/34_IPC',10,'2023-04-17 15:19:52',_binary ''),(54750,'408/34_IPC',10,'2023-04-17 15:19:52',_binary ''),(54756,'354/376/511/506_IPC',10,'2023-04-17 15:19:52',_binary ''),(54771,'307/186/352/332_IPC',10,'2023-04-17 15:19:52',_binary ''),(54801,'363/328/34_IPC',10,'2023-04-17 15:19:53',_binary ''),(54828,'420/467/411_IPC',10,'2023-04-17 15:19:53',_binary ''),(54843,'285/304A_IPC',10,'2023-04-17 15:19:53',_binary ''),(54876,'420/411/34_IPC',10,'2023-04-17 15:19:53',_binary ''),(54894,'308/201_IPC',10,'2023-04-17 15:19:53',_binary ''),(54906,'341/308/34_IPC',10,'2023-04-17 15:19:53',_binary ''),(54939,'381/328_IPC',10,'2023-04-17 15:19:54',_binary ''),(54954,'323/324/459_IPC',10,'2023-04-17 15:19:54',_binary ''),(54960,'207_CrPC',10,'2023-04-17 15:19:54',_binary ''),(54963,'323/325/308_IPC',10,'2023-04-17 15:19:54',_binary ''),(54972,'452/393/398/324/34_IPC',10,'2023-04-17 15:19:54',_binary ''),(54987,'395/412_IPC',10,'2023-04-17 15:19:54',_binary ''),(54990,'420/408/208/182/411_IPC',10,'2023-04-17 15:19:54',_binary ''),(55014,'381/408/411/34_IPC',10,'2023-04-17 15:19:54',_binary ''),(55017,'381/408/411_IPC',10,'2023-04-17 15:19:54',_binary ''),(55020,'307/506_IPC',10,'2023-04-17 15:19:54',_binary ''),(55026,'3/4/8/9_Gambling Act',10,'2023-04-17 15:19:54',_binary ''),(55047,'394/397/398/34_IPC',10,'2023-04-17 15:19:54',_binary ''),(55083,'346/417/34_IPC',10,'2023-04-17 15:19:54',_binary ''),(55143,'394/170_IPC',10,'2023-04-17 15:19:55',_binary ''),(55149,'380/341/34_IPC',10,'2023-04-17 15:19:55',_binary ''),(55158,'420/468/471/482411/34_IPC',10,'2023-04-17 15:19:55',_binary ''),(55179,'103_IPC',10,'2023-04-17 15:19:55',_binary ''),(55197,'337/304A/427B_IPC',10,'2023-04-17 15:19:55',_binary ''),(55233,'379/411/468/478_IPC',10,'2023-04-17 15:19:55',_binary ''),(55308,'376/354A/506/509/354B_IPC',10,'2023-04-17 15:19:56',_binary ''),(55323,'195A/509_IPC',10,'2023-04-17 15:19:56',_binary ''),(55330,'_10-Dec',10,'2023-04-17 15:19:56',_binary ''),(55407,'370/366/328/34_IPC',10,'2023-04-17 15:19:56',_binary ''),(55416,'May-15_ENVIRANMENT',10,'2023-04-17 15:19:56',_binary ''),(55425,'63 CRACT_CR ACT',10,'2023-04-17 15:19:56',_binary ''),(55458,'6/14/24/34/2003_Others',10,'2023-04-17 15:19:57',_binary ''),(55464,'394/379/34_IPC',10,'2023-04-17 15:19:57',_binary ''),(55467,'387/507_IPC',10,'2023-04-17 15:19:57',_binary ''),(55476,'363/364A/387_IPC',10,'2023-04-17 15:19:57',_binary ''),(55512,'392/397/412/34_IPC',10,'2023-04-17 15:19:57',_binary ''),(55518,'135/138/150_ELEC. ACT',10,'2023-04-17 15:19:57',_binary ''),(55539,'279/339/304_IPC',10,'2023-04-17 15:19:57',_binary ''),(55542,'363/366/365/379_IPC',10,'2023-04-17 15:19:57',_binary ''),(55581,'341/325/34_IPC',10,'2023-04-17 15:19:57',_binary ''),(55605,'135/138/150_IPC',10,'2023-04-17 15:19:57',_binary ''),(55608,'135/150_IPC',10,'2023-04-17 15:19:57',_binary ''),(55614,'302/498_IPC',10,'2023-04-17 15:19:58',_binary ''),(55623,'429/420/384/170_IPC',10,'2023-04-17 15:19:58',_binary ''),(55680,'302/364/201_IPC',10,'2023-04-17 15:19:58',_binary ''),(55701,'41.2/109_CrPC',10,'2023-04-17 15:19:58',_binary ''),(55704,'323/307/34_IPC',10,'2023-04-17 15:19:58',_binary ''),(55716,'323/325/308/34_IPC',10,'2023-04-17 15:19:58',_binary ''),(55752,'325/348/380/34_IPC',10,'2023-04-17 15:19:58',_binary ''),(55755,'365/376/34_IPC',10,'2023-04-17 15:19:58',_binary ''),(55761,'376/363/506_IPC',10,'2023-04-17 15:19:58',_binary ''),(55776,'392/397/411 IPC_IPC',10,'2023-04-17 15:19:58',_binary ''),(55785,'66_DPCT',10,'2023-04-17 15:19:58',_binary ''),(55788,'33_D.EXACT',10,'2023-04-17 15:19:58',_binary ''),(55791,'12_G.ACT',10,'2023-04-17 15:19:58',_binary ''),(55797,'363/379_IPC',10,'2023-04-17 15:19:59',_binary ''),(55818,'63_CRACT',10,'2023-04-17 15:19:59',_binary ''),(55830,'66-1B_DP ACT',10,'2023-04-17 15:19:59',_binary ''),(55833,'33/58_EX. ACT',10,'2023-04-17 15:19:59',_binary ''),(55839,'288/304A/34_IPC',10,'2023-04-17 15:19:59',_binary ''),(55866,'66 DP ACT_DP ACT',10,'2023-04-17 15:19:59',_binary ''),(55920,'3/4/5/7/8_Others',10,'2023-04-17 15:19:59',_binary ''),(55953,'323/341/325/34_IPC',10,'2023-04-17 15:19:59',_binary ''),(55956,'323/341/307/302/34_IPC',10,'2023-04-17 15:19:59',_binary ''),(55959,'324/376_IPC',10,'2023-04-17 15:19:59',_binary ''),(55962,'135/138_IPC',10,'2023-04-17 15:19:59',_binary ''),(56025,'323/324/455/506/34_IPC',10,'2023-04-17 15:20:00',_binary ''),(56052,'341/307/34_IPC',10,'2023-04-17 15:20:00',_binary ''),(56100,'406/34_IPC',10,'2023-04-17 15:20:00',_binary ''),(56190,'379/411/382/34_IPC',10,'2023-04-17 15:20:01',_binary ''),(56265,'147/148/149/323/354/422/452_IPC',10,'2023-04-17 15:20:01',_binary ''),(56271,'324/376/511_IPC',10,'2023-04-17 15:20:01',_binary ''),(56301,'363/304A_IPC',10,'2023-04-17 15:20:01',_binary ''),(56316,'323/452/566/34_IPC',10,'2023-04-17 15:20:01',_binary ''),(56331,'6/34/2003_Others',10,'2023-04-17 15:20:01',_binary ''),(56334,'6/12/24/34/2003_Others',10,'2023-04-17 15:20:01',_binary ''),(56340,'6/34/10/24/2003_Others',10,'2023-04-17 15:20:01',_binary ''),(56346,'354/373/34_IPC',10,'2023-04-17 15:20:01',_binary ''),(56391,'304/288/337_IPC',10,'2023-04-17 15:20:02',_binary ''),(56400,'323/308/328/346/34_IPC',10,'2023-04-17 15:20:02',_binary ''),(56403,'285/337/304A_IPC',10,'2023-04-17 15:20:02',_binary ''),(56427,'391/324/308/566/34_IPC',10,'2023-04-17 15:20:02',_binary ''),(56475,'33/10/10_Excise',10,'2023-04-17 15:20:02',_binary ''),(56478,'489B/489/C_IPC',10,'2023-04-17 15:20:02',_binary ''),(56506,'_25/54/59',10,'2023-04-17 15:20:02',_binary ''),(56547,'285/337/338/304A_IPC',10,'2023-04-17 15:20:02',_binary ''),(56565,'323/341/354A/354B/506_IPC',10,'2023-04-17 15:20:03',_binary ''),(56589,'509/506_IPC',10,'2023-04-17 15:20:03',_binary ''),(56628,'Jun-24_OTHER',10,'2023-04-17 15:20:03',_binary ''),(56631,'Jun-14_OTHER',10,'2023-04-17 15:20:03',_binary ''),(56634,'Jun-14_Others',10,'2023-04-17 15:20:03',_binary ''),(56649,'326/308_IPC',10,'2023-04-17 15:20:03',_binary ''),(56652,'346/364A/34_IPC',10,'2023-04-17 15:20:03',_binary ''),(56658,'323/342_IPC',10,'2023-04-17 15:20:03',_binary ''),(56676,'498A/406/354/506/34_IPC',10,'2023-04-17 15:20:03',_binary ''),(56685,'33/45/47/580_Excise',10,'2023-04-17 15:20:03',_binary ''),(56694,'377/354B_IPC',10,'2023-04-17 15:20:03',_binary ''),(56695,'_06-Dec',10,'2023-04-17 15:20:03',_binary ''),(56718,'452_IPC',10,'2023-04-17 15:20:03',_binary ''),(56730,'392/394/397/411/34_IPC',10,'2023-04-17 15:20:03',_binary ''),(56734,'_27/54/59',10,'2023-04-17 15:20:03',_binary ''),(56754,'363/376/328/34_IPC',10,'2023-04-17 15:20:04',_binary ''),(56757,'324/341/506_IPC',10,'2023-04-17 15:20:04',_binary ''),(56772,'306/330/342/34_IPC',10,'2023-04-17 15:20:04',_binary ''),(56781,'392/394/398/411/34_IPC',10,'2023-04-17 15:20:04',_binary ''),(56802,'354/509/323_IPC',10,'2023-04-17 15:20:04',_binary ''),(56805,'406/120/34_IPC',10,'2023-04-17 15:20:04',_binary ''),(56808,'323/341/327/342/347/120_IPC',10,'2023-04-17 15:20:04',_binary ''),(56811,'379/407/411/34_IPC',10,'2023-04-17 15:20:04',_binary ''),(56814,'381/34_IPC',10,'2023-04-17 15:20:04',_binary ''),(56826,'341/354/354B_IPC',10,'2023-04-17 15:20:04',_binary ''),(56835,'303/3/2007_IPC',10,'2023-04-17 15:20:04',_binary ''),(56850,'354/342/323/34_IPC',10,'2023-04-17 15:20:04',_binary ''),(56868,'354/354B/506/509_IPC',10,'2023-04-17 15:20:04',_binary ''),(56874,'380/457/511/34 IPC_IPC',10,'2023-04-17 15:20:04',_binary ''),(56883,'363/366/354_IPC',10,'2023-04-17 15:20:04',_binary ''),(56886,'392/397/411/34_',10,'2023-04-17 15:20:04',_binary ''),(56892,'285/338_IPC',10,'2023-04-17 15:20:04',_binary ''),(56931,'364/34_IPC',10,'2023-04-17 15:20:04',_binary ''),(56934,'325/354/509/34_IPC',10,'2023-04-17 15:20:04',_binary ''),(56946,'380-457_IPC',10,'2023-04-17 15:20:05',_binary ''),(56982,'354/354B/506/34_IPC',10,'2023-04-17 15:20:05',_binary ''),(56994,'338_IPC',10,'2023-04-17 15:20:05',_binary ''),(56997,'392/393/411/34 IPC_IPC',10,'2023-04-17 15:20:05',_binary ''),(57000,'328/365_IPC',10,'2023-04-17 15:20:05',_binary ''),(57009,'328/363/506_IPC',10,'2023-04-17 15:20:05',_binary ''),(57030,'380/457/_IPC',10,'2023-04-17 15:20:05',_binary ''),(57054,'376/506/120B_IPC',10,'2023-04-17 15:20:05',_binary ''),(57066,'382/392/34/_IPC',10,'2023-04-17 15:20:05',_binary ''),(57069,'342/376/34_IPC',10,'2023-04-17 15:20:05',_binary ''),(57096,'392/397/452/411/34_IPC',10,'2023-04-17 15:20:05',_binary ''),(57117,'12-09-1955_G.ACT',10,'2023-04-17 15:20:05',_binary ''),(57135,'103/04_TM ACT',10,'2023-04-17 15:20:06',_binary ''),(57150,'376/506 I_IPC',10,'2023-04-17 15:20:06',_binary ''),(57174,'3/4/9/55_G.ACT',10,'2023-04-17 15:20:06',_binary ''),(57210,'363/368/376/506_IPC',10,'2023-04-17 15:20:06',_binary ''),(57225,'323/427/506/509_IPC',10,'2023-04-17 15:20:06',_binary ''),(57267,'323/379/506_IPC',10,'2023-04-17 15:20:06',_binary ''),(57279,'323/356/506/411_IPC',10,'2023-04-17 15:20:06',_binary ''),(57282,'408/411_IPC',10,'2023-04-17 15:20:06',_binary ''),(57309,'344_SDM',10,'2023-04-17 15:20:06',_binary ''),(57318,'9/39/40/50/5/58_Others',10,'2023-04-17 15:20:07',_binary ''),(57321,'307/502_IPC',10,'2023-04-17 15:20:07',_binary ''),(57327,'363/452/506/34_IPC',10,'2023-04-17 15:20:07',_binary ''),(57343,'_07-Aug',10,'2023-04-17 15:20:07',_binary ''),(57345,'63/65_CR. ACT',10,'2023-04-17 15:20:07',_binary ''),(57351,'394/397/411/34_IPC',10,'2023-04-17 15:20:07',_binary ''),(57381,'440/506/34_IPC',10,'2023-04-17 15:20:07',_binary ''),(57384,'308/452/427/506/34_IPC',10,'2023-04-17 15:20:07',_binary ''),(57396,'376/328/354/342_IPC',10,'2023-04-17 15:20:07',_binary ''),(57423,'324/342/506/34_IPC',10,'2023-04-17 15:20:07',_binary ''),(57441,'379/411/34 IPC_IPC',10,'2023-04-17 15:20:07',_binary ''),(57447,'323/452/506_IPC',10,'2023-04-17 15:20:07',_binary ''),(57483,'135_SDM',10,'2023-04-17 15:20:07',_binary ''),(57489,'363/376/342/506/34_IPC',10,'2023-04-17 15:20:07',_binary ''),(57507,'40A_DP Act',10,'2023-04-17 15:20:08',_binary ''),(57510,'354/354A/509/323/34_IPC',10,'2023-04-17 15:20:08',_binary ''),(57525,'354/323/354D/451/506_IPC',10,'2023-04-17 15:20:08',_binary ''),(57528,'354/323/451_IPC',10,'2023-04-17 15:20:08',_binary ''),(57537,'323/324/354B_IPC',10,'2023-04-17 15:20:08',_binary ''),(57552,'459/369_IPC',10,'2023-04-17 15:20:08',_binary ''),(57582,'354/323/506/451/34_IPC',10,'2023-04-17 15:20:08',_binary ''),(57595,'_04-Jun',10,'2023-04-17 15:20:08',_binary ''),(57600,'384/387/34_IPC',10,'2023-04-17 15:20:08',_binary ''),(57633,'323/356/384/377/34_IPC',10,'2023-04-17 15:20:08',_binary ''),(57672,'363/368/377_IPC',10,'2023-04-17 15:20:08',_binary ''),(57678,'146/147/148/308/354_IPC',10,'2023-04-17 15:20:08',_binary ''),(57684,'454/380/_IPC',10,'2023-04-17 15:20:08',_binary ''),(57690,'344_Others',10,'2023-04-17 15:20:08',_binary ''),(57702,'440/34_IPC',10,'2023-04-17 15:20:09',_binary ''),(57705,'380457/34_IPC',10,'2023-04-17 15:20:09',_binary ''),(57760,'_04-Aug',10,'2023-04-17 15:20:09',_binary ''),(57789,'328/452_IPC',10,'2023-04-17 15:20:09',_binary ''),(57807,'186/323/324/353/307/394_IPC',10,'2023-04-17 15:20:09',_binary ''),(57828,'342/323_IPC',10,'2023-04-17 15:20:09',_binary ''),(57831,'344/12_Others',10,'2023-04-17 15:20:09',_binary ''),(57834,'307/498A/34_IPC',10,'2023-04-17 15:20:09',_binary ''),(57933,'448/454/380_IPC',10,'2023-04-17 15:20:10',_binary ''),(57951,'147_CRPC',10,'2023-04-17 15:20:10',_binary ''),(57954,'363/364A/302_IPC',10,'2023-04-17 15:20:10',_binary ''),(57978,'302/392 IPC_IPC',10,'2023-04-17 15:20:10',_binary ''),(57985,'_05-Jun',10,'2023-04-17 15:20:10',_binary ''),(57990,'389/120_IPC',10,'2023-04-17 15:20:10',_binary ''),(58017,'287/337_IPC',10,'2023-04-17 15:20:10',_binary ''),(58029,'354/354D/376/506_IPC',10,'2023-04-17 15:20:10',_binary ''),(58050,'376/34_IPC',10,'2023-04-17 15:20:10',_binary ''),(58074,'376/506/420_IPC',10,'2023-04-17 15:20:10',_binary ''),(58077,'392/397/308/307/34_IPC',10,'2023-04-17 15:20:10',_binary ''),(58110,'323/186/353/379/506/34_IPC',10,'2023-04-17 15:20:11',_binary ''),(58134,'457/323/34_IPC',10,'2023-04-17 15:20:11',_binary ''),(58137,'279/328_IPC',10,'2023-04-17 15:20:11',_binary ''),(58143,'376D_IPC',10,'2023-04-17 15:20:11',_binary ''),(58158,'354A/354C/506_IPC',10,'2023-04-17 15:20:11',_binary ''),(58170,'148/147/149/323/307/34_IPC',10,'2023-04-17 15:20:11',_binary ''),(58176,'452-336-506/34_IPC',10,'2023-04-17 15:20:11',_binary ''),(58185,'376/328/342/365/384/387/506_IPC',10,'2023-04-17 15:20:11',_binary ''),(58203,'323/341/354/509/34_IPC',10,'2023-04-17 15:20:11',_binary ''),(58215,'366/376/342/307/34_IPC',10,'2023-04-17 15:20:11',_binary ''),(58221,'336/352/34_IPC',10,'2023-04-17 15:20:11',_binary ''),(58224,'147/148/149/332/353_IPC',10,'2023-04-17 15:20:11',_binary ''),(58239,'387/507/34_IPC',10,'2023-04-17 15:20:11',_binary ''),(58293,'324/376/506_IPC',10,'2023-04-17 15:20:12',_binary ''),(58308,'307/392/397/34_IPC',10,'2023-04-17 15:20:12',_binary ''),(58311,'135/138_Others',10,'2023-04-17 15:20:12',_binary ''),(58317,'302/307/506/34_IPC',10,'2023-04-17 15:20:12',_binary ''),(58383,'376/452_IPC',10,'2023-04-17 15:20:12',_binary ''),(58422,'498/304 B_IPC',10,'2023-04-17 15:20:12',_binary ''),(58557,'323/325/427/506/34_IPC',10,'2023-04-17 15:20:13',_binary ''),(58624,'_20',10,'2023-04-17 15:20:13',_binary ''),(58644,'354/354A/354B/506/509/34_IPC',10,'2023-04-17 15:20:13',_binary ''),(58690,'_06-Feb',10,'2023-04-17 15:20:14',_binary ''),(58767,'354/354D/509_IPC',10,'2023-04-17 15:20:14',_binary ''),(58824,'420/492/34_IPC',10,'2023-04-17 15:20:14',_binary ''),(58830,'376/341/511/323_IPC',10,'2023-04-17 15:20:14',_binary ''),(58837,'_5',10,'2023-04-17 15:20:14',_binary ''),(58860,'287/304 A_IPC',10,'2023-04-17 15:20:15',_binary ''),(58884,'379/411/454_IPC',10,'2023-04-17 15:20:15',_binary ''),(58896,'302/365/34_IPC',10,'2023-04-17 15:20:15',_binary ''),(58902,'457/379/411_IPC',10,'2023-04-17 15:20:15',_binary ''),(58909,'_39/44',10,'2023-04-17 15:20:15',_binary ''),(58917,'394/506_IPC',10,'2023-04-17 15:20:15',_binary ''),(58938,'308/411_IPC',10,'2023-04-17 15:20:15',_binary ''),(58941,'304A/34_IPC',10,'2023-04-17 15:20:15',_binary ''),(58998,'466A_Others',10,'2023-04-17 15:20:15',_binary ''),(59013,'146/147/148/149/452/307_IPC',10,'2023-04-17 15:20:15',_binary ''),(59016,'399/402/186/353/307/411_IPC',10,'2023-04-17 15:20:15',_binary ''),(59031,'3_Others',10,'2023-04-17 15:20:15',_binary ''),(59035,'_307/201',10,'2023-04-17 15:20:15',_binary ''),(59064,'285/336_IPC',10,'2023-04-17 15:20:16',_binary ''),(59067,'147/148/149/323/324_IPC',10,'2023-04-17 15:20:16',_binary ''),(59088,'185_Others',10,'2023-04-17 15:20:16',_binary ''),(59094,'306/309/34_IPC',10,'2023-04-17 15:20:16',_binary ''),(59181,'498/406/498A_IPC',10,'2023-04-17 15:20:16',_binary ''),(59196,'39/44_IPC',10,'2023-04-17 15:20:16',_binary ''),(59199,'224/323_IPC',10,'2023-04-17 15:20:16',_binary ''),(59205,'381/341_IPC',10,'2023-04-17 15:20:16',_binary ''),(59238,'302/452/34_IPC',10,'2023-04-17 15:20:16',_binary ''),(59265,'52/63_CR. ACT',10,'2023-04-17 15:20:17',_binary ''),(59289,'457/380/511/347_IPC',10,'2023-04-17 15:20:17',_binary ''),(59307,'354/323/509_IPC',10,'2023-04-17 15:20:17',_binary ''),(59349,'323/341/354/354B_IPC',10,'2023-04-17 15:20:17',_binary ''),(59373,'376/342/328/506_IPC',10,'2023-04-17 15:20:17',_binary ''),(59376,'392/394/397/398/34_IPC',10,'2023-04-17 15:20:17',_binary ''),(59400,'380/381/34_IPC',10,'2023-04-17 15:20:17',_binary ''),(59412,'354/341/506_IPC',10,'2023-04-17 15:20:17',_binary ''),(59415,'498/34_IPC',10,'2023-04-17 15:20:17',_binary ''),(59448,'363/368/376/34_IPC',10,'2023-04-17 15:20:18',_binary ''),(59457,'287/346/201_IPC',10,'2023-04-17 15:20:18',_binary ''),(59511,'307/201/202/506/34_IPC',10,'2023-04-17 15:20:18',_binary ''),(59517,'392/34/_IPC',10,'2023-04-17 15:20:18',_binary ''),(59529,'379/456/411_IPC',10,'2023-04-17 15:20:18',_binary ''),(59601,'120B/420/411/34_IPC',10,'2023-04-17 15:20:18',_binary ''),(59613,'63/68_CR. ACT',10,'2023-04-17 15:20:18',_binary ''),(59625,'354/308_IPC',10,'2023-04-17 15:20:19',_binary ''),(59631,'384/411_IPC',10,'2023-04-17 15:20:19',_binary ''),(59673,'146/147/148/323/295_IPC',10,'2023-04-17 15:20:19',_binary ''),(59694,'379/394_IPC',10,'2023-04-17 15:20:19',_binary ''),(59697,'304B/498A_IPC',10,'2023-04-17 15:20:19',_binary ''),(59730,'03-04-2005_ITP Act',10,'2023-04-17 15:20:19',_binary ''),(59784,'452/394/411_IPC',10,'2023-04-17 15:20:19',_binary ''),(59814,'452/323/342/34_IPC',10,'2023-04-17 15:20:19',_binary ''),(59862,'419/420/468/471/379_IPC',10,'2023-04-17 15:20:20',_binary ''),(59883,'411/406_IPC',10,'2023-04-17 15:20:20',_binary ''),(59961,'147/148/149/323_IPC',10,'2023-04-17 15:20:20',_binary ''),(59973,'147/148/149/506/323/332_IPC',10,'2023-04-17 15:20:20',_binary ''),(60000,'147/148/149/452/323/324_IPC',10,'2023-04-17 15:20:20',_binary ''),(60021,'420/471/120_IPC',10,'2023-04-17 15:20:21',_binary ''),(60034,'_135',10,'2023-04-17 15:20:21',_binary ''),(60075,'354/380/411/34_IPC',10,'2023-04-17 15:20:21',_binary ''),(60093,'3/181,39/192,146/192_Others',10,'2023-04-17 15:20:21',_binary ''),(60123,'228/337_IPC',10,'2023-04-17 15:20:21',_binary ''),(60144,'3/181,29/177,32/177,207_Others',10,'2023-04-17 15:20:21',_binary ''),(60150,'41.2_CrPC',10,'2023-04-17 15:20:21',_binary ''),(60177,'147/148/149/452/308/354/323/324/34/427_IPC',10,'2023-04-17 15:20:21',_binary ''),(60183,'341/342/376/506_IPC',10,'2023-04-17 15:20:21',_binary ''),(60198,'307/323/341/34_IPC',10,'2023-04-17 15:20:21',_binary ''),(60201,'406/409/420/477/467/468/469/403/208/34_IPC',10,'2023-04-17 15:20:22',_binary ''),(60228,'354/509_IPC',10,'2023-04-17 15:20:22',_binary ''),(60255,'279/336/337_IPC',10,'2023-04-17 15:20:22',_binary ''),(60261,'392/348_IPC',10,'2023-04-17 15:20:22',_binary ''),(60262,'_27/25',10,'2023-04-17 15:20:22',_binary ''),(60343,'_9B',10,'2023-04-17 15:20:22',_binary ''),(60384,'341/342/195A/506/34_IPC',10,'2023-04-17 15:20:22',_binary ''),(60393,'33 DELHI ACT_Excise',10,'2023-04-17 15:20:22',_binary ''),(60399,'457/380_CrPC',10,'2023-04-17 15:20:23',_binary ''),(60408,'344.2_Others',10,'2023-04-17 15:20:23',_binary ''),(60423,'392/397/411/25/27 A. ACT_Arms Act',10,'2023-04-17 15:20:23',_binary ''),(60438,'323/324/504/506/34_IPC',10,'2023-04-17 15:20:23',_binary ''),(60471,'332/353/184/34_IPC',10,'2023-04-17 15:20:23',_binary ''),(60492,'324/509_IPC',10,'2023-04-17 15:20:23',_binary ''),(60498,'379/411/482 IPC_IPC',10,'2023-04-17 15:20:23',_binary ''),(60501,'482/411_IPC',10,'2023-04-17 15:20:23',_binary ''),(60507,'392/411/34 IPC_IPC',10,'2023-04-17 15:20:23',_binary ''),(60510,'63/65 CR ACT_CR. ACT',10,'2023-04-17 15:20:23',_binary ''),(60561,'354/209_IPC',10,'2023-04-17 15:20:23',_binary ''),(60615,'_CrPC',10,'2023-04-17 15:20:24',_binary ''),(60729,'356/506/509_IPC',10,'2023-04-17 15:20:24',_binary ''),(60744,'419/420/468/457/34_IPC',10,'2023-04-17 15:20:24',_binary ''),(60822,'327/34 IPC_IPC',10,'2023-04-17 15:20:25',_binary ''),(60849,'May-15_E.V. ACT',10,'2023-04-17 15:20:25',_binary ''),(60870,'323/341/452/34_IPC',10,'2023-04-17 15:20:25',_binary ''),(60886,'_25/27/54/59',10,'2023-04-17 15:20:25',_binary ''),(60900,'379/411/489/34_IPC',10,'2023-04-17 15:20:25',_binary ''),(60906,'_Gambling Act',10,'2023-04-17 15:20:25',_binary ''),(60913,'_411',10,'2023-04-17 15:20:25',_binary ''),(61035,'509_IPC',10,'2023-04-17 15:20:26',_binary ''),(61059,'323/342/398A/34_IPC',10,'2023-04-17 15:20:26',_binary ''),(61168,'_33',10,'2023-04-17 15:20:26',_binary ''),(61170,'393/397/34_IPC',10,'2023-04-17 15:20:26',_binary ''),(61179,'392/391/411/34_IPC',10,'2023-04-17 15:20:26',_binary ''),(61188,'397/411/ 34/_IPC',10,'2023-04-17 15:20:27',_binary ''),(61200,'394/397/307/411/34_IPC',10,'2023-04-17 15:20:27',_binary ''),(61209,'41.1D, 102 CRPC_CrPC',10,'2023-04-17 15:20:27',_binary ''),(61236,'186/35_IPC',10,'2023-04-17 15:20:27',_binary ''),(61251,'63_Others',10,'2023-04-17 15:20:27',_binary ''),(61290,'376/366A/6/17_IPC',10,'2023-04-17 15:20:27',_binary ''),(61291,'_POCSO ACT',10,'2023-04-17 15:20:27',_binary ''),(61296,'323/307/342/34_IPC',10,'2023-04-17 15:20:27',_binary ''),(61297,'_25 ARMS ACT',10,'2023-04-17 15:20:27',_binary ''),(61299,'393/394_IPC',10,'2023-04-17 15:20:27',_binary ''),(61353,'63/65_CT ACT',10,'2023-04-17 15:20:27',_binary ''),(61368,'397/411_IPC',10,'2023-04-17 15:20:27',_binary ''),(61389,'33_D.EX ACT',10,'2023-04-17 15:20:28',_binary ''),(61395,'33/58_D.EX. ACT',10,'2023-04-17 15:20:28',_binary ''),(61488,'284/304_IPC',10,'2023-04-17 15:20:28',_binary ''),(61503,'33/58_D.EX ACT',10,'2023-04-17 15:20:28',_binary ''),(61515,'33_D.EX.ACT',10,'2023-04-17 15:20:28',_binary ''),(61518,'354B/323/509_IPC',10,'2023-04-17 15:20:28',_binary ''),(61527,'420/342/354/509/506_IPC',10,'2023-04-17 15:20:28',_binary ''),(61542,'420/467/468/471/120/34_IPC',10,'2023-04-17 15:20:28',_binary ''),(61551,'342/377_IPC',10,'2023-04-17 15:20:28',_binary ''),(61599,'382/511/34_IPC',10,'2023-04-17 15:20:29',_binary ''),(61602,'25_A.ACT',10,'2023-04-17 15:20:29',_binary ''),(61638,'324/506/34_IPC',10,'2023-04-17 15:20:29',_binary ''),(61650,'186/353/352/506_IPC',10,'2023-04-17 15:20:29',_binary ''),(61692,'447/448/506/34_IPC',10,'2023-04-17 15:20:29',_binary ''),(61746,'33_D.EX. ACT',10,'2023-04-17 15:20:29',_binary ''),(61788,'145/147/148/186/353/308_IPC',10,'2023-04-17 15:20:30',_binary ''),(61818,'33_D.EX.',10,'2023-04-17 15:20:30',_binary ''),(61911,'32/112_DP ACT',10,'2023-04-17 15:20:30',_binary ''),(61923,'354/376/509_IPC',10,'2023-04-17 15:20:30',_binary ''),(61926,'377/342/_IPC',10,'2023-04-17 15:20:30',_binary ''),(61941,'308/342/506/34_IPC',10,'2023-04-17 15:20:30',_binary ''),(61950,'308/147/148/149_IPC',10,'2023-04-17 15:20:30',_binary ''),(61974,'03-04-2005_G.ACT',10,'2023-04-17 15:20:30',_binary ''),(61989,'286/336_IPC',10,'2023-04-17 15:20:31',_binary ''),(61995,'380/454/_IPC',10,'2023-04-17 15:20:31',_binary ''),(61998,'32/13_DP ACT',10,'2023-04-17 15:20:31',_binary ''),(62010,'3/181/482/146/115/190/207_MV ACT',10,'2023-04-17 15:20:31',_binary ''),(71985,'363/376 IPC &6 POCSO ACT',28,'2024-02-02 09:18:30',_binary ''),(71986,'323/354/354A/354B/509/34IPC&8/12POSCO ACT',28,'2024-02-05 11:55:49',_binary ''),(71987,'323/354A/354B/509/34 IPC',28,'2024-02-12 06:22:50',_binary ''),(71988,'42/468/506 IPC',28,'2024-02-27 07:03:05',_binary ''),(71989,'420/468/506 IPC',28,'2024-02-27 07:03:54',_binary ''),(71990,'380/341/448/509/120B IPC',28,'2024-02-28 07:58:12',_binary '');
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
  `name` varchar(500) NOT NULL,
  `updatedBy` int NOT NULL,
  `updatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isActive` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=23971 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (3367,'Pending Investigation',1,'2024-09-17 04:59:56',_binary ''),(3368,'Disposed',1,'2022-12-23 12:28:18',_binary ''),(3369,'Pending Trial',10,'2023-01-03 13:13:39',_binary '');
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
) ENGINE=InnoDB AUTO_INCREMENT=12920 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uniquemud`
--

LOCK TABLES `uniquemud` WRITE;
/*!40000 ALTER TABLE `uniquemud` DISABLE KEYS */;
INSERT INTO `uniquemud` VALUES (12916,'2024/10265/1'),(12917,'2024/10265/2'),(12918,'2024/10659/1'),(12919,'2024/10659/2'),(12912,'2024/૧૧/1'),(12913,'2024/૧૧/2'),(12914,'2024/15/1'),(12893,'2024/159/1'),(12894,'2024/159/2'),(12895,'2024/159/3'),(12900,'2024/198/1'),(12901,'2024/198/2'),(12904,'2024/198/3'),(12907,'2024/22/1'),(12908,'2024/22/2'),(12909,'2024/30/1'),(12910,'2024/856/1'),(12905,'2024/965/1'),(12906,'2024/965/2');
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
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_department_map`
--

LOCK TABLES `user_department_map` WRITE;
/*!40000 ALTER TABLE `user_department_map` DISABLE KEYS */;
INSERT INTO `user_department_map` VALUES (21,6,1),(22,6,2),(23,7,1),(24,7,6),(25,3,1),(26,3,6),(27,2,1),(28,2,6),(41,11,7),(42,12,7),(43,13,7),(44,14,7),(45,15,7),(46,16,7),(47,17,7),(48,18,7),(50,10,7),(51,20,11),(52,21,1),(54,23,3),(55,24,5),(56,25,14),(58,27,6),(59,28,13),(60,29,12),(61,22,15),(75,30,1),(76,30,3),(77,30,5),(78,30,6),(79,30,7),(80,30,8),(81,30,9),(82,30,10),(83,30,11),(84,30,12),(85,30,13),(86,30,14),(87,30,15),(88,26,8),(89,1,1),(90,1,3),(91,1,5),(92,1,6),(93,1,7),(94,1,8),(95,1,9),(96,1,10),(97,1,11),(98,1,12),(99,1,14),(100,1,15);
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Vaibhav Mittal',1,'9560630130','mittal',1,'2022-11-27 08:10:37',_binary ''),(2,'SO DCP',1,'9871072088','mittal',1,'2022-11-27 08:11:30',_binary '\0'),(3,'ABC',2,'asd','acv',1,'2022-12-03 16:48:02',_binary '\0'),(4,'a',1,'a','a',1,'2022-12-03 17:35:39',_binary '\0'),(5,'a',1,'a','a',1,'2022-12-03 17:53:52',_binary '\0'),(6,'b',1,'b','b',1,'2022-12-03 18:12:10',_binary '\0'),(7,'d',1,'d','d',1,'2022-12-03 18:12:24',_binary '\0'),(8,'e',1,'e','e',1,'2022-12-03 18:12:46',_binary '\0'),(9,'f',1,'f','f',1,'2022-12-03 18:14:51',_binary '\0'),(10,'ANIL KUMAR',5,'9810507638','8750',1,'2023-01-04 08:59:56',_binary ''),(11,'NISHU',5,'8527440954','NISHU123810',1,'2023-01-04 09:12:17',_binary ''),(12,'DEVKI',5,'9953462849','DEVKI1282',1,'2023-01-04 09:41:35',_binary ''),(13,'RENU',5,'8130636829','RENU2134',1,'2023-01-04 09:42:57',_binary ''),(14,'PREETI',5,'9958636909','PREETI717',1,'2023-01-04 09:44:50',_binary ''),(15,'ANJU',5,'8010570063','ANJU3284',1,'2023-01-04 09:46:28',_binary ''),(16,'RUMA',5,'8750698245','RUMA1527',1,'2023-01-04 09:47:42',_binary ''),(17,'SUMAN',5,'9267910978','SUMAN677',1,'2023-01-04 09:49:14',_binary ''),(18,'POONAM',5,'9990612040','POONAM2135',1,'2023-01-04 09:52:58',_binary ''),(19,'ANIL',5,'9810507638','ANIL851',1,'2023-01-04 11:38:43',_binary ''),(20,'Sanjeev',5,'9811697838','SAN123',1,'2023-01-12 06:26:15',_binary ''),(21,'Khursheed',5,'9873911784','RANA1270',1,'2023-01-12 07:27:02',_binary ''),(22,'Banti Hemant',5,'9899553592','1973',1,'2023-01-12 10:12:18',_binary ''),(23,'MHC{M} CP  Krishna Nagar',5,'9456800018','9873@SAM',1,'2023-01-12 10:21:31',_binary ''),(24,'umesh kumar',5,'8743919292','umesh@420',1,'2023-01-12 12:14:09',_binary ''),(25,'MHC{M} CP FARSH BAZAR',5,'9650239784','malkhana1213',1,'2023-01-12 12:18:23',_binary ''),(26,'MHC{M} CP ANAND VIHAR',5,'9639259639','Amod9639',1,'2023-01-13 06:28:17',_binary ''),(27,'MHC [M] VIVEK VIHAR',5,'9990804376','MHC1234',1,'2023-01-13 11:44:03',_binary ''),(28,'MHC[M] CP MS PARK',5,'8920810693','CCTNS123',1,'2023-01-13 12:34:51',_binary ''),(29,'MHC (M CP)',5,'7983809953','CCTNS1234',1,'2023-01-14 09:45:45',_binary ''),(30,'lukman',1,'8287793110','3110',1,'2023-05-04 06:19:56',_binary '');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'emalkhanaprohi'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_accdepartment_search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_accdepartment_search`(IN numUserId int)
BEGIN
	select departmentId as id, name from user_department_map left outer join department on department.id = user_department_map.departmentid where userId = numUserId and name is not null;
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
	update mudmovement set isReceived = 1, receivedBy = userid, receivedOn = current_date() WHERE id = moveID;
    SET goingTo = (select goingAt from mudmovement where id = moveID);
    SET  mudId =  (select id from mud where isActive = 1 and mudNo = (select mudNo from mudmovement where id = moveId));
    
    insert into mud (mudNo ,  year ,  departmentId ,  headId ,  photoId  ,  seizeDate ,  ioName ,  description ,  statusId ,  location ,  caseDecided ,  dateDecision ,  courtId ,  dateOrderDestroy ,  dateDestroy ,  disposalId , updatedBy ,  firNo) 
     (select mudNo ,  year ,  goingTo ,  headId ,  photoId  ,  seizeDate ,  ioName ,  description ,  statusId ,  location ,  caseDecided ,  dateDecision ,  courtId ,  dateOrderDestroy ,  dateDestroy ,  disposalId , updatedBy , firNo from mud where id = mudId);
	
    update mud set isActive = 0 where id = mudId;
    SET  nextMudId =  (select id from mud where isActive = 1 and mudNo = (select mudNo from mudmovement where id = moveId));
    insert into firsection (mudId,sectionId) (select nextMudId,ms.sectionId from firsection ms where mudId = mudId);
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_act_Add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_act_Add`(IN numId int, IN txtName varchar(45), IN updatedBy int)
BEGIN
IF 1 = (select EXISTS(select id from act where id = numId)) THEN
update act set name = txtName, updatedBy = updatedBy, isActive = 1
            WHERE id = numId;
ELSE
insert into act (id, name,updatedBy,isActive) values (numId, txtName,updatedBy,1);
        END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_act_mapping_Add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_act_mapping_Add`(IN numActId int, IN sectionIDs varchar(5000))
BEGIN
    DECLARE strLen    INT DEFAULT 0;
    DECLARE SubStrLen INT DEFAULT 0;
    DECLARE nextMudId INT;
    DECLARE goingTo INT;
    declare uMudId int default 0;

	start transaction;
		update act_mapping set isActive = 0 where actId = numActId;
 do_this:

      LOOP
		
        IF sectionIDs = '' THEN
          LEAVE do_this;
        END IF;
        SET strLen = CHAR_LENGTH(sectionIDs);
        INSERT INTO act_mapping (actId, actSectionid, isactive) VALUES(numActId,SUBSTRING_INDEX(sectionIDs, ',', 1), 1);
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_act_mapping_Search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_act_mapping_Search`()
BEGIN
	select id,name from act where isActive = 1 and id in (select distinct actId from act_mapping where isactive = 1);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_act_Search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_act_Search`(IN numId int)
BEGIN
	select * from act where id = case numId when 0 then id else numId end and isActive = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_act_section_Add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_act_section_Add`(IN numId int, IN txtName varchar(45), IN updatedBy int)
BEGIN
IF 1 = (select EXISTS(select id from act_section where id = numId)) THEN
update act_section set name = txtName, updatedBy = updatedBy, isActive = 1
            WHERE id = numId;
ELSE
insert into act_section (id, name,updatedBy,isActive) values (numId, txtName,updatedBy,1);
        END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_act_section_Search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_act_section_Search`(IN numId int)
BEGIN
	select * from act_section where id = case numId when 0 then id else numId end and isActive = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_courtmovement_search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_courtmovement_search`(IN numMudNo int)
BEGIN
	select *, courtname.name as cname, users.name as rname from mudmovement left outer join courtname on courtname.id = mudmovement.goingAt left outer join users on users.id = mudmovement.requestedBy where mudNo = numMudNo and isCourt = 1;
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_court_fsl_movement_Search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_court_fsl_movement_Search`(IN txtmudNo varchar(45))
BEGIN
	select mudNo, mudmovement.id  as mudMovementId, case when iscourt = 1 then 'Court' else 'FSL' end as type, case when iscourt = 1 then courtname.name else fsl.name end as cname 
    ,concat(designation.name, ' ', sendingVia, '-',buckleNr) as sentVia from mudmovement left outer join courtname on courtname.id = mudmovement.goingAt left outer join designation on designation.id = 
    mudmovement.designationid left outer join fsl on fsl.id = mudmovement.goingAt where isCourt > 0 and mudNo = txtmudNo order by mudmovement.id desc limit 1;
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_department_Add`(IN numId int, IN txtName varchar(45), IN isPS bit, IN onMalkhana bit)
BEGIN
IF 1 = (select EXISTS(select id from department where id = numId)) THEN
update department set name = txtName, isPS = isPS, onEMalkhana = onMalkhana
            WHERE id = numId;
ELSE
insert into department (id, name, isPS, onEMalkhana) values (numId, txtName, isPS, onMalkhana);
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_designation_Add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_designation_Add`(IN numId int, IN txtName varchar(45), IN updatedBy int)
BEGIN
IF 1 = (select EXISTS(select id from designation where id = numId)) THEN
update designation set name = txtName, updatedBy = updatedBy, isActive = 1
            WHERE id = numId;
ELSE
insert into designation (id, name,updatedBy,isActive) values (numId, txtName,updatedBy,1);
        END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_designation_Search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_designation_Search`(IN numId int)
BEGIN
	select * from designation where id = case numId when 0 then id else numId end and isActive = 1;
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_distinct_receipt_search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_distinct_receipt_search`(IN numUserId int)
BEGIN
	select distinct concat(receiptNo, '/',year) as receiptNo from mud left outer join fir on fir.id = mud.firId 
    left outer join department on department.id = fir.departmentId where mud.isactive = 1  and 
    department.id in (select departmentId from user_department_map where userId = numUserId);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_firNum_Search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_firNum_Search`(IN strFirNum varchar(45), IN strFirType varchar(45), IN numUserId int, in numyear int)
BEGIN
	select mudNo, firNo, mud.id as id,receiptNo from mud left outer join fir on 
    mud.firId = fir.id left outer join firtype on firtype.id = fir.firTypeID left outer join department on department.id = fir.departmentId where firNo = strFirNum and firType.name = strFirType and year = numyear and mud.isactive = 1 and department.id in (select departmentId from user_department_map where userId = numUserId);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_firsection_Add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_firsection_Add`(IN id int, IN mudId int, IN sectionId int)
BEGIN
IF 1 = (select EXISTS(select id from firsection where id = id)) THEN
update firsection set mudId = mudId, sectionId = sectionId
            WHERE id = id;
ELSE
insert into firsection (id, mudId,sectionId) values (id, mudId,sectionId);
        END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_fir_Add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_fir_Add`(IN numId int, IN bCaseDecided BIT, IN dtFirDate DATE, IN dtDateDecided DATE, IN txtfirNo varchar(45), IN numProsecutionAgencyid INT, IN txtFromWhom varchar(100), IN txtfromWhere varchar(100), IN year int, IN departmentId int, IN numFirTypeId int, IN ioName varchar(45), IN updatedBy INT, IN isActive int, IN sectionIDs varchar(500), IN numcourtid INT, IN numstatusid INT)
BEGIN
    DECLARE strLen    INT DEFAULT 0;
    DECLARE SubStrLen INT DEFAULT 0;
    DECLARE nextMudId INT;
    DECLARE goingTo INT;
    declare uMudId int default 0;

	start transaction;
		insert into fir (  proesucutingAgencyId, FromWhom, FromWhere, caseDecided, dateDecision, year ,  departmentId  ,  ioName ,  updatedBy ,  isActive, firNo, firTypeId, courtId, statusId, firDate) values ( numProsecutionAgencyid, txtFromWhom, txtfromWhere, bcaseDecided, dtdateDecided, year ,  departmentId  ,  ioName ,  updatedBy ,  isActive, txtfirNo,numFirTypeId, numCourtid, numStatusId, dtFirDate);
		set uMudId = (select id from fir where firNo = txtfirNo and isActive = 1 order by id desc limit 1);
 do_this:

      LOOP
		
        IF sectionIDs = '' THEN
          LEAVE do_this;
        END IF;
        SET strLen = CHAR_LENGTH(sectionIDs);
        INSERT INTO firsection (mudId, sectionId) VALUES(uMudId,SUBSTRING_INDEX(sectionIDs, ',', 1));
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_fir_count_Page_Wise` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_fir_count_Page_Wise`(IN numUserId int, IN searchText varchar(500))
BEGIN
	select 
    count(fir.id) 'count_data'
    from fir 
    left outer join department on department.id = fir.departmentId 
    left outer join users on users.id = fir.updatedBy 
    where fir.isActive = 1
    and department.id in (select departmentId from user_department_map where userId = numUserId)
    and firNo = (CASE searchText WHEN '' THEN FirNo ELSE searchText END);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_fir_Search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_fir_Search`(IN numId int, IN numUserId int)
BEGIN
	select *, fir.id as firId, users.name as updator, fir.updatedOn, department.name as departmentName, courtname.name as courtName, 
    status.name as statusName, concat(firType.name,'/',firNo, '/', year) as firNoWithYear from fir left outer join 
    department on department.id = fir.departmentId left outer join courtname on courtname.id = fir.courtid 
    left outer join status on status.id = fir.statusId left outer join users on users.id = fir.updatedBy 
    left outer join firType on firType.id = fir.firtypeId where fir.id = case numId when 0 then fir.id else numId end and fir.isActive = 1
    and department.id in (select departmentId from user_department_map where userId = numUserId);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_fir_Search_Page_Wise` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_fir_Search_Page_Wise`(IN numUserId int, IN searchText varchar(500), IN startRows int, IN endRows int)
BEGIN
select T.* from (
	select 
    row_number() over(order by fir.id asc) as RowNum,
    year,
    fir.id as id,
    users.name as updator, 
    department.name as departmentName, 
    courtname.name as courtname,
    status.name as statusname,
    ioname,
    CONCAT(firType.name, ' - ',firNo) as firNoWithType
    from fir 
	left outer join courtname on courtname.id = fir.courtid 
    left outer join status on status.id = fir.statusId 
    left outer join firType on firType.id = fir.firtypeId
    left outer join department on department.id = fir.departmentId 
    left outer join users on users.id = fir.updatedBy 
    where fir.isActive = 1
    and department.id in (select departmentId from user_department_map where userId = numUserId)
    and firNo = (CASE searchText WHEN '' THEN FirNo ELSE searchText END)
)T where T.RowNum between startRows and endRows;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_fir_Search_unique` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_fir_Search_unique`(IN numUserId int)
BEGIN
	select *, fir.id as firId, users.name as updator, fir.updatedOn, department.name as departmentName, courtname.name as courtName, 
    status.name as statusName, concat(firType.name,'/',firNo, '/', year) as firNoWithYear from fir left outer join 
    department on department.id = fir.departmentId left outer join courtname on courtname.id = fir.courtid 
    left outer join status on status.id = fir.statusId left outer join users on users.id = fir.updatedBy 
    left outer join firType on firType.id = fir.firtypeId where fir.isActive = 1
    and department.id in (select departmentId from user_department_map where userId = numUserId) and fir.id not in (select distinct firId from mud where isactive = 1);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_fir_type_Add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_fir_type_Add`(IN numId int, IN txtName varchar(45), IN updatedBy int)
BEGIN
IF 1 = (select EXISTS(select id from head where id = numId)) THEN
update firType set name = txtName, updatedBy = updatedBy, isActive = 1
            WHERE id = numId;
ELSE
insert into firType (id, name,updatedBy,isActive) values (numId, txtName,updatedBy,1);
        END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_fir_type_Search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_fir_type_Search`()
BEGIN
	select * from firType where isActive = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_fir_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_fir_update`(IN numProsecutionAgencyid INT, IN txtFromWhom varchar(100), IN txtfromWhere varchar(100), IN numId int, IN dtFirDate DATE, IN txtfirNo varchar(45), IN numyear int, IN numdepartmentId int, IN numFirTypeId int, IN txtioName varchar(45), IN numupdatedBy INT, IN bCaseDecided BIT, IN dtDateDecided DATE, IN isActive int, IN sectionIDs varchar(500), in numCourtId INT, in numstatusId INT)
BEGIN
    DECLARE strLen    INT DEFAULT 0;
    DECLARE SubStrLen INT DEFAULT 0;
    DECLARE nextMudId INT;
    DECLARE goingTo INT;

	start transaction;
		update fir set year = numyear, departmentId = numDepartmentid, ioname = txtIoName, updatedBy = numUpdatedBy, 
        isActive = 1, firNo = txtFirNo, firTypeId = numFirTypeId, courtId = numCourtId, statusId = numStatusId,
        caseDecided = bCaseDecided, dateDecision = dtDateDecided, firDate = dtFirDate, proesucutingAgencyId = numProsecutionAgencyid,
        FromWhom = txtFromWhom, fromWhere = txtfromWhere
        where id = numId;
		delete from firSection where mudId = numid;
 do_this:

      LOOP
		
        IF sectionIDs = '' THEN
          LEAVE do_this;
        END IF;
        SET strLen = CHAR_LENGTH(sectionIDs);
        INSERT INTO firsection (mudId, sectionId) VALUES(numId,SUBSTRING_INDEX(sectionIDs, ',', 1));
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_fsl_Add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_fsl_Add`(IN numId int, IN txtName varchar(45), IN updatedBy int)
BEGIN
IF 1 = (select EXISTS(select id from fsl where id = numId)) THEN
update fsl set name = txtName, updatedBy = updatedBy, isActive = 1
            WHERE id = numId;
ELSE
insert into fsl (id, name,updatedBy,isActive) values (numId, txtName,updatedBy,1);
        END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_fsl_Search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_fsl_Search`(IN numId int)
BEGIN
	select * from fsl where id = case numId when 0 then id else numId end and isActive = 1;
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_mudmovement_ack` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mudmovement_ack`(IN mudMovementId INT, IN txtackNumber varchar(50), IN dtackDate date)
BEGIN
	update mudMovement set ackNumber = txtAckNumber, ackDate = dtackDate, isReceived = 1, isactive = 0, receivedOn = current_timestamp() where  id = mudMovementId;
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mudmovement_Add`(IN mudNumber varchar(45), IN requestedBy int,IN goingAt int, IN bIsCourt INT, IN strSendingVia varchar(45), IN strTRansfereeIdPath varchar(450), IN dSentOn date, IN numDesignationId INT, in txtbuckleNumber varchar(45))
BEGIN 
DECLARE numcurrentlyAt INT;
DECLARE isOnMalkhana INT;
DECLARE moveId INT;
set numcurrentlyAt  = (select departmentId from mud left outer join fir on mud.firId = fir.id where mud.isActive = 1 and mudNo = mudNumber);
update mudmovement set isACtive = 0 where mudNo = mudNumber;
insert into mudmovement (mudNo, requestedBy, goingAt, isCourt, sendingVia, transfereeIdPath, isActive, sentOn, designationid, buckleNr, currentlyAt) values (mudNumber, requestedBy, goingAt, bIsCourt, strSendingVia, strTRansfereeIdPath, 1, dSentOn, numDesignationid, txtBuckleNumber, numcurrentlyAt);
set isOnMalkhana = (select onEMalkhana from department where id = goingAt);
if (0 = bIsCourt and 0 = isOnMalkhana ) then
	SET moveId = (select id from mudmovement where mudNo = mudNumber and isActive = 1);
	call sp_accept_mudmovement(requestedBy, moveId);
end if;
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mudmovement_Search`(IN numUserId int)
BEGIN
	select * ,mudMovement.isActive as mdActive from mudMovement left outer join designation on designation.id = mudmovement.designationId
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_mudnum_Search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mudnum_Search`(IN strMudNum varchar (45), IN numUserId int)
BEGIN
select *, date(seizeDate) as sDate, department.name as departmentName, disposal.name as disposalName, receiptNo,
status.name as statusName, courtname.name as courtName, users.name as updator from mud left outer join fir on mud.firId = fir.id left outer join users 
on users.id = mud.updatedBy 
left outer join department on department.id = fir.departmentId left outer join disposal on disposal.id = mud.disposalId left outer join courtname on courtname.id = FIR.courtId left outer join status on status.id = FIR.statusId where
 mud.mudNo = strMudNum and mud.isActive = 1  and department.id in (select departmentId from user_department_map where userId = numUserId);
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mud_Add`(IN numId int, IN txtmudNo varchar(45), IN firId int, IN photoId varchar(1000) , IN txtDisposalOrderNumber varchar(100), IN seizeDate DATE, IN description varchar(1000), IN location varchar(500), IN receiptNo varchar(45), IN dateOrderDestroy DATE, IN dateDestroy DATE, IN disposalId int, IN updatedBy INT, IN isActive int)
BEGIN
    DECLARE strLen    INT DEFAULT 0;

    DECLARE SubStrLen INT DEFAULT 0;
    DECLARE nextMudId INT;
    DECLARE goingTo INT;
	start transaction;
		update mud set isActive = 0 where mudNo = txtmudNo;
		insert into mud (  mudNo ,  photoId  ,  seizeDate ,  description ,  location , txtDisposalOrderNumber,  dateOrderDestroy ,  dateDestroy ,  disposalId , updatedBy ,  isActive, firId, receiptNo) values ( txtmudNo ,  photoId  ,  seizeDate ,  description ,  location ,  txtDisposalOrderNumber, dateOrderDestroy , dateDestroy ,  disposalId ,  updatedBy ,  isActive, firId, receiptNo);
insert ignore into uniquemud (mudNo) values (txtmudNo);
        commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mud_count_Page_Wise` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mud_count_Page_Wise`(IN numUserId int, IN searchText varchar(500))
BEGIN
	select 
    count(mud.id) 'count_data'
    from mud 
    left outer join fir on mud.firId = fir.id 
    left outer join department on department.id = fir.departmentId 
    where mud.isActive = 1
    and fir.departmentid in (select departmentId from user_department_map where userId = numUserId)
    and mudNo = CASE searchText WHEN '' THEN mudNo ELSE searchText END;
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Mud_detroyed_by_date_Search`(IN numUserId int,IN startDate date, IN endDate date)
BEGIN
	select *, date(seizeDate) as sDate, department.name as departmentName, head.name as 
    headName, status.name as statusName, courtname.name as courtName from mud left outer join fir on fir.id = mud.firid left outer join 
    department on department.id = fir.departmentId left outer join head on head.id = fir.headId 
    left outer join courtname on courtname.id = fir.courtId left outer join status on 
    status.id = fir.statusId where mud.isActive = 1
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Mud_Head_Search`(IN numUserId int,IN startDate date, IN endDate date,IN numHeadId int)
BEGIN
	select *, date(seizeDate) as sDate, department.name as departmentName, head.name as 
    headName, status.name as statusName, courtname.name as courtName from mud left outer join fir on fir.id = mud.firid left outer join 
    department on department.id = fir.departmentId left outer join head on head.id = fir.headId 
    left outer join courtname on courtname.id = fir.courtId left outer join status on 
    status.id = fir.statusId where mud.isActive = 1
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Mud_Order_Not_destroyed_Search`(IN numUserId int,IN startDate date, IN endDate date)
BEGIN
	select *, date(seizeDate) as sDate, department.name as departmentName, head.name as 
    headName, status.name as statusName, courtname.name as courtName from mud left outer join fir on fir.id = mud.firid left outer join 
    department on department.id = fir.departmentId left outer join head on head.id = fir.headId 
    left outer join courtname on courtname.id = fir.courtId left outer join status on 
    status.id = fir.statusId where  mud.isActive = 1
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_mud_out_but_not_ack` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mud_out_but_not_ack`(IN numUserId int)
BEGIN
	select distinct mud.mudNo, mud.ReceiptNo from mudmovement left outer join mud on mudmovement.mudNo = mud.mudno where mudmovement.isReceived = 1 and department.id in 
    (select departmentId from user_department_map where userId = numUserId) and mud.isactive = 1;
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mud_Search`(IN numId int, IN numUserId int)
BEGIN
	select *, date(seizeDate) as sDate, users.name as updator, mud.updatedOn, department.name as departmentName, status.name as statusName, courtname.name as courtName,concat(firNo, '/', fir.year) as firNoWithYear ,mud.firId as mudFirId from mud left outer join fir on fir.id = mud.firid left outer join 
    department on department.id = fir.departmentId 
    left outer join courtname on courtname.id = fir.courtId left outer join status on 
    status.id = fir.statusId left outer join users on users.id = mud.updatedBy where mud.id = case numId when 0 then mud.id else numId end and mud.isActive = 1
    and department.id in (select departmentId from user_department_map where userId = numUserId);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mud_Search_court_today` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mud_Search_court_today`(IN numId int, IN numUserId int)
BEGIN
	select *, date(seizeDate) as sDate, users.name as updator, mud.updatedOn, department.name as departmentName, status.name as statusName, courtname.name as courtName from mud left outer join fir on fir.id = mud.firid left outer join 
    department on department.id = fir.departmentId 
    left outer join courtname on courtname.id = fir.courtId left outer join status on 
    status.id = fir.statusId left outer join users on users.id = mud.updatedBy where mud.id = case numId when 0 then mud.id else numId end and mud.isActive = 1
    and department.id in (select departmentId from user_department_map where userId = numUserId) and dateDecision = curdate();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mud_Search_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mud_Search_list`(IN numUserId int)
BEGIN
	select mud.id as id, mudNo from mud left outer join fir on fir.id = mud.firid left outer join 
    department on department.id = fir.departmentId where mud.isActive = 1
    and department.id in (select departmentId from user_department_map where userId = numUserId);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mud_Search_Page_Wise` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mud_Search_Page_Wise`(IN numUserId int, IN searchText varchar(500), IN startRows int, IN endRows int)
BEGIN
select T.* from (
	select 
    row_number() over(order by mud.id asc) as RowNum,
    mud.id as id,
    mudNo, 
    receiptNo,
    seizeDate,
    description,
    year,
    date(seizeDate) as sDate, 
    users.name as updator, 
    department.name as departmentName, 
    status.name as statusName, 
    courtname.name as courtName ,
    ioname,
    firNo,
    location,
    caseDecided,
    dateDecision,
    dateOrderDestroy,
    dateDestroy
    from mud 
    left outer join fir on fir.id = mud.firid 
    left outer join department on department.id = fir.departmentId 
    left outer join courtname on courtname.id = fir.courtId 
    left outer join status on status.id = fir.statusId 
    left outer join users on users.id = mud.updatedBy 
    where mud.isActive = 1
    and department.id in (select departmentId from user_department_map where userId = numUserId)
    and (mudNo = (CASE searchText WHEN '' THEN mudNo ELSE searchText END) 
		OR firNo = (CASE searchText WHEN '' THEN FirNo ELSE searchText END))
)T where T.RowNum between startRows and endRows;
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Mud_Status_Search`(IN numUserId int,IN startDate date, IN endDate date,IN numStatusId int)
BEGIN
	select *, date(seizeDate) as sDate, department.name as departmentName, head.name as 
    headName, status.name as statusName, courtname.name as courtName from mud left outer join fir on fir.id = mud.firid left outer join 
    department on department.id = fir.departmentId left outer join head on head.id = fir.headId 
    left outer join courtname on courtname.id = fir.courtId left outer join status on 
    status.id = fir.statusId where mud.isActive = 1
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_new_act_mapping_Search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_new_act_mapping_Search`()
BEGIN
	select id,name from act where isActive = 1 and id not in (select distinct actId from act_mapping where isactive = 1);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_peosecuting_agency_Search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_peosecuting_agency_Search`(IN numId int)
BEGIN
	select * from prosecutingagency where id = case numId when 0 then id else numId end and isActive = 1;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_permission_Add`(IN numId int, IN txtName varchar(45), IN txtUrl varchar(45))
BEGIN
IF 1 = (select EXISTS(select id from `permission` where id = numId)) THEN
update permission set `name` = txtName, url = txtUrl
            WHERE id = numId;
ELSE
insert into permission (id, `name`, url) values (numId, txtName, txtUrl);
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_prosecuting_agency_Add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_prosecuting_agency_Add`(IN numId int, IN txtName varchar(45), IN updatedBy int)
BEGIN
IF 1 = (select EXISTS(select id from prosecutingagency where id = numId)) THEN
update prosecutingagency set name = txtName, updatedBy = updatedBy, isActive = 1
            WHERE id = numId;
ELSE
insert into prosecutingagency (id, name,updatedBy,isActive) values (numId, txtName,updatedBy,1);
        END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_rcNum_Search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_rcNum_Search`(IN strRcNum varchar(45))
BEGIN
	select * from mudMovement where rcNum = strRcNum;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_receiptNum_Search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_receiptNum_Search`(IN strReceiptNum varchar(45), IN numUserId int, IN numYear varchar(20))
BEGIN
	select mudNo, firNo, mud.id as id,receiptNo from mud left outer join fir on mud.firId = fir.id left outer join department on department.id = fir.departmentId where receiptNo = strReceiptNum and 
    mud.isactive = 1  and department.id in (select departmentId from user_department_map where userId = numUserId) and year(seizeDate) = numYear;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_receipt_count_Page_Wise` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_receipt_count_Page_Wise`(IN numUserId int, IN searchText varchar(500))
BEGIN
	select 
    count(distinct receiptNo) as 'count_data'
    from mud 
    left outer join fir on fir.id = mud.firId
    left outer join department on department.id = fir.departmentId 
    where mud.isActive = 1
    and department.id in (select departmentId from user_department_map where userId = numUserId)
    and receiptNo = (CASE searchText WHEN '' THEN receiptNo ELSE searchText END);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_receipt_Search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_receipt_Search`(IN numUserId int, IN numId INT)
BEGIN
	select receiptNo, date(seizeDate) as sDate, firId from mud left outer join fir on mud.firid = fir.id left outer join 
    department on department.id = fir.departmentId 
    where mud.isActive = 1 and receiptNo = case numId when 0 then receiptNo else numId end
    and department.id in (select departmentId from user_department_map where userId = numUserId) group by receiptNo, seizeDate, firID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_receipt_Search_Page_Wise` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_receipt_Search_Page_Wise`(IN numUserId int, IN searchText varchar(500), IN startRows int, IN endRows int)
BEGIN
select T.* from (
	select 
    row_number() over(order by receiptNo asc) as RowNum,
    year,
    receiptNo
    from mud
    left outer join fir on fir.id = mud.firId
    left outer join department on department.id = fir.departmentId 
    where mud.isActive = 1
    and department.id in (select departmentId from user_department_map where userId = numUserId)
    and receiptNo = (CASE searchText WHEN '' THEN receiptNo ELSE searchText END) group by receiptNo, year
)T where T.RowNum between startRows and endRows;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_rel_act_section_Search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_rel_act_section_Search`(IN numActId int)
BEGIN
	select name, id from act_section where actId = numActId and isActive = 1;
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_role_Add`(IN numId int, IN txtName varchar(45), IN canEdit BIT)
BEGIN
IF 1 = (select EXISTS(select id from `role` where id = numId)) THEN
update role set `name` = txtName, canEditRecords = canEdit
            WHERE id = numId;
ELSE
insert into role (`name`, canEditRecords ) values (txtName, canEdit);
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

-- Dump completed on 2024-09-25 19:26:35
