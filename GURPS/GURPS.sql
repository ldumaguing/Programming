-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: localhost    Database: GURPS
-- ------------------------------------------------------
-- Server version	5.5.5-10.5.16-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Instances`
--

DROP TABLE IF EXISTS `Instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Instances` (
  `Id` int(10) unsigned NOT NULL,
  `ClassType` varchar(128) DEFAULT NULL,
  `Name` varchar(128) DEFAULT NULL,
  `Definition` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`Definition`)),
  `Tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`Tags`)),
  `LocX` int(11) DEFAULT NULL,
  `LocY` int(11) DEFAULT NULL,
  `LocZ` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Instances`
--

LOCK TABLES `Instances` WRITE;
/*!40000 ALTER TABLE `Instances` DISABLE KEYS */;
INSERT INTO `Instances` VALUES (0,NULL,'asdf',NULL,NULL,NULL,NULL,NULL),(1,NULL,'asdf',NULL,NULL,NULL,NULL,NULL),(2,NULL,'asdf',NULL,NULL,NULL,NULL,NULL),(3,NULL,'asdf','{\n\"basic attributes\": {\n\"ST\": 10,\n\"DX\": 10,\n\"IQ\": 10,\n\"HT\": 10\n},\n\"secondary characteristics\": {\n\"damage\": {\n\"thrust\": \"\",\n\"swing\": \"\"\n},\n\"basic lift\": 0,\n\"HP\": 0,\n\"Will\": 0,\n\"Per\": 0,\n\"FP\": 0,\n\"basic speed\": 0,\n\"basic move\": 0\n},\n\"anatomy\": {\n\"head\": {\n\"skull\": {},\n\"eyes\": {},\n\"face\": {}\n},\n\"body\": {\n\"neck\": {},\n\"torso\": {},\n\"groin\": {}\n},\n\"limbs\": {\n\"arms\": {\n\"hands\": {}\n},\n\"legs\": {\n\"feet\": {}\n}}}\n}',NULL,NULL,NULL,NULL),(4,NULL,'asdf','{\n\"basic attributes\": {\n\"ST\": 10,\n\"DX\": 10,\n\"IQ\": 10,\n\"HT\": 10\n},\n\"secondary characteristics\": {\n\"damage\": {\n\"thrust\": \"\",\n\"swing\": \"\"\n},\n\"basic lift\": 0,\n\"HP\": 0,\n\"Will\": 0,\n\"Per\": 0,\n\"FP\": 0,\n\"basic speed\": 0,\n\"basic move\": 0\n},\n\"anatomy\": {\n\"head\": {\n\"skull\": {},\n\"eyes\": {},\n\"face\": {}\n},\n\"body\": {\n\"neck\": {},\n\"torso\": {},\n\"groin\": {}\n},\n\"limbs\": {\n\"arms\": {\n\"hands\": {}\n},\n\"legs\": {\n\"feet\": {}\n}}}\n}',NULL,NULL,NULL,NULL),(5,NULL,'asdf','{\n\"basic attributes\": {\n\"ST\": 10,\n\"DX\": 10,\n\"IQ\": 10,\n\"HT\": 10\n},\n\"secondary characteristics\": {\n\"damage\": {\n\"thrust\": \"\",\n\"swing\": \"\"\n},\n\"basic lift\": 0,\n\"HP\": 0,\n\"Will\": 0,\n\"Per\": 0,\n\"FP\": 0,\n\"basic speed\": 0,\n\"basic move\": 0\n},\n\"anatomy\": {\n\"head\": {\n\"skull\": {},\n\"eyes\": {},\n\"face\": {}\n},\n\"body\": {\n\"neck\": {},\n\"torso\": {},\n\"groin\": {}\n},\n\"limbs\": {\n\"arms\": {\n\"hands\": {}\n},\n\"legs\": {\n\"feet\": {}\n}}}\n}',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `Instances` ENABLE KEYS */;
UNLOCK TABLES;
