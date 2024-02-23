-- MariaDB dump 10.19  Distrib 10.11.6-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: NuklearWinter68
-- ------------------------------------------------------
-- Server version	10.11.6-MariaDB-0+deb12u1

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
-- Table structure for table `gameData`
--

DROP TABLE IF EXISTS `gameData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gameData` (
  `scenario` varchar(80) DEFAULT NULL,
  `name` varchar(80) DEFAULT NULL,
  `val` varchar(256) DEFAULT NULL,
  `html` varchar(512) DEFAULT NULL,
  `j` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`j`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gameData`
--

LOCK TABLES `gameData` WRITE;
/*!40000 ALTER TABLE `gameData` DISABLE KEYS */;
INSERT INTO `gameData` VALUES
('01-Day8','current scenario',NULL,NULL,NULL),
('01-Day8','map','Map.jpg','<img id=\"map\" src=\"images/Map.jpg\" hidden>',NULL),
('01-Day8','HexZero','368,216',NULL,NULL),
('01-Day8','chitDimention','150',NULL,NULL),
('01-Day8','X_multiplier','168.79310344827587',NULL,NULL),
('01-Day8','Y_multiplier','195.0',NULL,NULL),
('01-Day8','Y_adjust','97.5',NULL,NULL),
('01-Day8','yellowDot',NULL,'<img id=\"yellowDot\" src=\"images_mine/Yellow Dot.png\" hidden>','{}'),
('01-Day8','u1','RITTES REICH,1/130;King Tiger','<img id=\"u1\" src=\"images/1_130 KT front.png\" hidden>','{\"front\": \"images/1_130 KT front.png\", \"back\": \"images/1_130 KT back.png\", \"flip\": \"front\", \"hexLoc\": [5, 10], \"pixLoc\": [0, 0], \"identity\": [\"1/130\", \"King Tiger\"], \"frontData\": [10, 0, 0, 6, 5, 4, 0, 18, 0, 0, 6, 0, 0], \"currMove\": 6, \"backData\": [9, 0, 0, 6, 4, 4, 0, 18, 0, 0, 6, 0, 0], \"riverHexPlace\": 0}'),
('01-Day8','u2','RITTES REICH,1/130;Puma','<img id=\"u2\" src=\"images/1_130 Puma front.png\" hidden>','{\"front\": \"images/1_130 Puma front.png\", \"back\": \"images/1_130 Puma back.png\", \"flip\": \"front\", \"hexLoc\": [0, 6], \"pixLoc\": [0, 0], \"identity\": [\"1/130\", \"Puma\"], \"frontData\": [9, 0, 0, 4, 4, 3, 0, 15, 0, 0, 7, 0, 8], \"currMove\": 7, \"backData\": [8, 0, 0, 4, 3, 3, 0, 15, 0, 0, 7, 0, 8], \"riverHexPlace\": 0}'),
('01-Day8','AM:1/130;2','2',NULL,NULL),
('01-Day8','u3','RITTES REICH,2/130;Fallschirmjager','<img id=\"u3\" src=\"images/2_130 Fall front.png\" hidden>','{\"front\": \"images/2_130 Fall front.png\", \"back\": \"images/2_130 Fall back.png\", \"flip\": \"front\", \"hexLoc\": [3, 7], \"pixLoc\": [0, 0], \"identity\": [\"2/130\", \"Fallschirmjager\"], \"frontData\": [6, 0, 0, 3, 5, 3, 0, 18, 0, 0, 3, 0, 16], \"currMove\": 3, \"backData\": [5, 0, 0, 3, 4, 3, 0, 18, 0, 14, 3, 0, 16], \"riverHexPlace\": 0}'),
('01-Day8','u4','RITTES REICH,2/130;Fallschirmjager','<img id=\"u4\" src=\"images/2_130 Fall front.png\" hidden>','{\"front\": \"images/2_130 Fall front.png\", \"back\": \"images/2_130 Fall back.png\", \"flip\": \"front\", \"hexLoc\": [4, 3], \"pixLoc\": [0, 0], \"identity\": [\"2/130\", \"Fallschirmjager\"], \"frontData\": [6, 0, 0, 3, 5, 3, 0, 18, 0, 0, 3, 0, 16], \"currMove\": 3, \"backData\": [5, 0, 0, 3, 4, 3, 0, 18, 0, 14, 3, 0, 16], \"riverHexPlace\": 0}'),
('01-Day8','u5','RITTES REICH,2/130;SdKfz 250','<img id=\"u5\" src=\"images/2_130 250 front.png\" hidden>','{\"front\": \"images/2_130 250 front.png\", \"back\": \"images/2_130 250 back.png\", \"flip\": \"front\", \"hexLoc\": [26, 4], \"pixLoc\": [0, 0], \"identity\": [\"2/130\", \"SdKfz 250\"], \"frontData\": [8, 0, 0, 3, 4, 3, 0, 14, 0, 0, 6, 0, 2], \"currMove\": 6, \"backData\": [7, 0, 0, 3, 3, 3, 0, 14, 0, 0, 6, 0, 2], \"riverHexPlace\": 0}'),
('01-Day8','u6','RITTES REICH,2/130;SdKfz 250','<img id=\"u6\" src=\"images/2_130 250 front.png\" hidden>','{\"front\": \"images/2_130 250 front.png\", \"back\": \"images/2_130 250 back.png\", \"flip\": \"front\", \"hexLoc\": [27, 5], \"pixLoc\": [0, 0], \"identity\": [\"2/130\", \"SdKfz 250\"], \"frontData\": [8, 0, 0, 3, 4, 3, 0, 14, 0, 0, 6, 0, 2], \"currMove\": 6, \"backData\": [7, 0, 0, 3, 3, 3, 0, 14, 0, 0, 6, 0, 2], \"riverHexPlace\": 0}'),
('01-Day8','AM:2/130;2','2',NULL,NULL),
('01-Day8','u7','Black Hand,Black Hand;Zealots','<img id=\"u7\" src=\"images/Zealots front.png\" hidden>','{\"front\": \"images/Zealots front.png\", \"back\": \"images/Zealots back.png\", \"flip\": \"front\", \"hexLoc\": [14, 11], \"pixLoc\": [0, 0], \"identity\": [\"Black Hand\", \"Zealots\"], \"frontData\": [6, 0, 0, 3, 5, 3, 0, 0, 0, 13, 3, 0, 16], \"currMove\": 3, \"backData\": [5, 0, 0, 3, 4, 3, 0, 0, 0, 13, 3, 0, 16], \"riverHexPlace\": 0}'),
('01-Day8','u8','Black Hand,Black Hand;Zealots','<img id=\"u8\" src=\"images/Zealots front.png\" hidden>','{\"front\": \"images/Zealots front.png\", \"back\": \"images/Zealots back.png\", \"flip\": \"front\", \"hexLoc\": [-1, -1], \"pixLoc\": [0, 0], \"identity\": [\"Black Hand\", \"Zealots\"], \"frontData\": [6, 0, 0, 3, 5, 3, 0, 0, 0, 13, 3, 0, 16], \"currMove\": 3, \"backData\": [5, 0, 0, 3, 4, 3, 0, 0, 0, 13, 3, 0, 16], \"riverHexPlace\": 0}'),
('01-Day8','u9','Black Hand,Black Hand;Zealots','<img id=\"u9\" src=\"images/Zealots front.png\" hidden>','{\"front\": \"images/Zealots front.png\", \"back\": \"images/Zealots back.png\", \"flip\": \"front\", \"hexLoc\": [-1, -1], \"pixLoc\": [0, 0], \"identity\": [\"Black Hand\", \"Zealots\"], \"frontData\": [6, 0, 0, 3, 5, 3, 0, 0, 0, 13, 3, 0, 16], \"currMove\": 3, \"backData\": [5, 0, 0, 3, 4, 3, 0, 0, 0, 13, 3, 0, 16], \"riverHexPlace\": 0}'),
('01-Day8','u10','Black Hand,Black Hand;Zealots','<img id=\"u10\" src=\"images/Zealots front.png\" hidden>','{\"front\": \"images/Zealots front.png\", \"back\": \"images/Zealots back.png\", \"flip\": \"front\", \"hexLoc\": [-1, -1], \"pixLoc\": [0, 0], \"identity\": [\"Black Hand\", \"Zealots\"], \"frontData\": [6, 0, 0, 3, 5, 3, 0, 0, 0, 13, 3, 0, 16], \"currMove\": 3, \"backData\": [5, 0, 0, 3, 4, 3, 0, 0, 0, 13, 3, 0, 16], \"riverHexPlace\": 0}'),
('01-Day8','u11','Black Hand,Black Hand;Pest','<img id=\"u11\" src=\"images/Pest front.png\" hidden>','{\"front\": \"images/Pest front.png\", \"back\": \"images/Pest back.png\", \"flip\": \"front\", \"hexLoc\": [-1, -1], \"pixLoc\": [0, 0], \"identity\": [\"Black Hand\", \"Pest\"], \"frontData\": [0, 0, 0, 0, 4, 3, 0, 14, 0, 0, 6, 0, 10], \"currMove\": 6, \"backData\": [0, 0, 0, 0, 3, 3, 0, 14, 0, 0, 6, 0, 10], \"riverHexPlace\": 0}'),
('01-Day8','u12','Black Hand,Black Hand;Pest','<img id=\"u12\" src=\"images/Pest front.png\" hidden>','{\"front\": \"images/Pest front.png\", \"back\": \"images/Pest back.png\", \"flip\": \"front\", \"hexLoc\": [13, 11], \"pixLoc\": [0, 0], \"identity\": [\"Black Hand\", \"Pest\"], \"frontData\": [0, 0, 0, 0, 4, 3, 0, 14, 0, 0, 6, 0, 10], \"currMove\": 6, \"backData\": [0, 0, 0, 0, 3, 3, 0, 14, 0, 0, 6, 0, 10], \"riverHexPlace\": 0}'),
('01-Day8','u13','Black Hand,Black Hand;Megrim','<img id=\"u13\" src=\"images/Megrim front.png\" hidden>','{\"front\": \"images/Megrim front.png\", \"back\": \"images/Megrim back.png\", \"flip\": \"front\", \"hexLoc\": [-1, -1], \"pixLoc\": [0, 0], \"identity\": [\"Black Hand\", \"Megrim\"], \"frontData\": [10, 0, 0, 6, 4, 6, 0, 16, 0, 0, 6, 0, 0], \"currMove\": 6, \"backData\": [9, 0, 0, 6, 3, 6, 0, 16, 0, 0, 6, 0, 0], \"riverHexPlace\": 0}'),
('01-Day8','AM:Black Hand;2','2',NULL,NULL),
('01-Day8','oO18','O18','<img id=\"oO18\" src=\"images/Red control.png\" hidden>','{\"hexLoc\": [14, 17]}'),
('01-Day8','oP17','P17','<img id=\"oP17\" src=\"images/Red control.png\" hidden>','{\"hexLoc\": [15, 16]}'),
('01-Day8','oP18','P18','<img id=\"oP18\" src=\"images/Red control.png\" hidden>','{\"hexLoc\": [15, 17]}'),
('01-Day8','oQ8','Q8','<img id=\"oQ8\" src=\"images/Red control.png\" hidden>','{\"hexLoc\": [16, 7]}');
/*!40000 ALTER TABLE `gameData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(80) DEFAULT NULL,
  `type` varchar(80) DEFAULT NULL,
  `formation` varchar(80) DEFAULT NULL,
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES
(1,'1_130 Chit front.png','formation','1/130'),
(2,'1_130 CO back.png','CO/2IC','1/130'),
(3,'1_130 CO front.png','CO/2IC','1/130'),
(4,'1_130 E100 back.png','ground','1/130'),
(5,'1_130 E100 front.png','ground','1/130'),
(6,'1_130 Hummel back.png','ground','1/130'),
(7,'1_130 Hummel front.png','ground','1/130'),
(8,'1_130 KT back.png','ground','1/130'),
(9,'1_130 KT front.png','ground','1/130'),
(10,'1_130 Puma back.png','ground','1/130'),
(11,'1_130 Puma front.png','ground','1/130'),
(12,'1_7 SS 250 back.png','ground','1/7 SS'),
(13,'1_7 SS 250 front.png','ground','1/7 SS'),
(14,'1_7 SS Chit front.png','formation','1/7 SS'),
(15,'1_7 SS CO back.png','CO/2IC','1/7 SS'),
(16,'1_7 SS CO front.png','CO/2IC','1/7 SS'),
(17,'1_7 SS VT back.png','ground','1/7 SS'),
(18,'1_7 SS VT front.png','ground','1/7 SS'),
(19,'1.png','die','-'),
(20,'1st Ranger Chit front.png','formation','1st Ranger'),
(21,'1st Ranger CO back.png','CO/2IC','1st Ranger'),
(22,'1st Ranger CO front.png','CO/2IC','1st Ranger'),
(23,'1st Ranger M113 back.png','ground','1st Ranger'),
(24,'1st Ranger M113 front.png','ground','1st Ranger'),
(25,'1st Ranger M60 back.png','ground','1st Ranger'),
(26,'1st Ranger M60 front.png','ground','1st Ranger'),
(27,'1st Ranger Ranger back.png','ground','1st Ranger'),
(28,'1st Ranger Ranger front.png','ground','1st Ranger'),
(29,'2_130 250 back.png','ground','2/130'),
(30,'2_130 250 front.png','ground','2/130'),
(31,'2_130 chit front.png','formation','2/130'),
(32,'2_130 CO back.png','CO/2IC','2/130'),
(33,'2_130 CO front.png','CO/2IC','2/130'),
(34,'2_130 E100 back.png','ground','2/130'),
(35,'2_130 E100 front.png','ground','2/130'),
(36,'2_130 Fall back.png','ground','2/130'),
(37,'2_130 Fall front.png','ground','2/130'),
(38,'2_130 JT back.png','ground','2/130'),
(39,'2_130 JT front.png','ground','2/130'),
(40,'2nd Ranger BRDM back.png','ground','2nd Ranger'),
(41,'2nd Ranger BRDM front.png','ground','2nd Ranger'),
(42,'2nd Ranger Chit front.png','formation','2nd Ranger'),
(43,'2nd Ranger CO back.png','CO/2IC','2nd Ranger'),
(44,'2nd Ranger CO front.png','CO/2IC','2nd Ranger'),
(45,'2nd Ranger M113 back.png','ground','2nd Ranger'),
(46,'2nd Ranger M113 front.png','ground','2nd Ranger'),
(47,'2nd Ranger M60 back.png','ground','2nd Ranger'),
(48,'2nd Ranger M60 front.png','ground','2nd Ranger'),
(49,'2nd Ranger Ranger back.png','ground','2nd Ranger'),
(50,'2nd Ranger Ranger front.png','ground','2nd Ranger'),
(51,'2.png','die','-'),
(52,'3.png','die','-'),
(53,'4.png','die','-'),
(54,'4th G Chit front.png','formation','4th Guards'),
(55,'4th G CO back.png','CO/2IC','4th Guards'),
(56,'4th G CO front.png','CO/2IC','4th Guards'),
(57,'4th G T64 back.png','ground','4th Guards'),
(58,'4th G T64 front.png','ground','4th Guards'),
(59,'501SS Chit front.png','formation','1/501 SS'),
(60,'501SS CO back.png','CO/2IC','1/501 SS'),
(61,'501SS CO front.png','CO/2IC','1/501 SS'),
(62,'501SS E100 back.png','ground','1/501 SS'),
(63,'501SS E100 front.png','ground','1/501 SS'),
(64,'502SS 250 back.png','ground','2/501 SS'),
(65,'502SS 250 front.png','ground','2/501 SS'),
(66,'502SS Chit front.png','formation','2/501 SS'),
(67,'502SS CO back.png','CO/2IC','2/501 SS'),
(68,'502SS CO front.png','CO/2IC','2/501 SS'),
(69,'502SS E100 back.png','ground','2/501 SS'),
(70,'502SS E100 front.png','ground','2/501 SS'),
(71,'502SS JT back.png','ground','2/501 SS'),
(72,'502SS JT front.png','ground','2/501 SS'),
(73,'502SS VT back.png','ground','2/501 SS'),
(74,'502SS VT front.png','ground','2/501 SS'),
(75,'58th Chit front.png','formation','58th Rifle'),
(76,'58th CO back.png','CO/2IC','58th Rifle'),
(77,'58th CO front.png','CO/2IC','58th Rifle'),
(78,'58th M113 back.png','ground','58th Rifle'),
(79,'58th M113 front.png','ground','58th Rifle'),
(80,'58th Rangers back.png','ground','58th Rifle'),
(81,'58th Rangers front.png','ground','58th Rifle'),
(82,'58th Spetsnaz back.png','ground','58th Rifle'),
(83,'58th Spetsnaz front.png','ground','58th Rifle'),
(84,'58th T62 back.png','ground','58th Rifle'),
(85,'58th T62 front.png','ground','58th Rifle'),
(86,'5.png','die','-'),
(87,'6.png','die','-'),
(88,'9K32 front.png','weapon','-'),
(89,'A6 front.png','air','-'),
(90,'Advance.png','marker','-'),
(91,'armies-icon.png','-','-'),
(92,'Army_Menu.png','-','-'),
(93,'assault-icon.png','-','-'),
(94,'assault.png','doc','-'),
(95,'Barrage 3.png','marker','-'),
(96,'Bio 1.png','marker','-'),
(97,'Black control.png','marker','-'),
(98,'Black Hand Chit front.png','formation','Black Hand'),
(99,'Blighter back.png','ground','Black Hand'),
(100,'Blighter front.png','ground','Black Hand'),
(101,'blue control.png','marker','-'),
(102,'BRDM back.png','ground','-'),
(103,'BRDM front.png','ground','-'),
(104,'Chemical 3.png','marker','-'),
(105,'Chemical.png','marker','-'),
(106,'Chit Back.png','marker','-'),
(107,'Combat-icon.png','-','-'),
(108,'Combat.jpg','doc','-'),
(109,'Cowboys Chit front.png','formation','Cowboys'),
(110,'Cowboys Huey back.png','vtol','Cowboys'),
(111,'Cowboys Huey front.png','vtol','Cowboys'),
(112,'cup-icon.png','-','-'),
(113,'cup.jpg','-','-'),
(114,'Derek Castle.png','marker','-'),
(115,'Diskord front.png','weapon','-'),
(116,'Event-icon.png','-','-'),
(117,'Event.png','marker','-'),
(118,'Finished-icon2.png','-','-'),
(119,'Finished.png','marker','-'),
(120,'fire-icon.png','-','-'),
(121,'fire.png','doc','-'),
(122,'forward-button.png','-','-'),
(123,'globe-dark-icon.png','-','-'),
(124,'globe-icon.png','-','-'),
(125,'High Morale.png','marker','-'),
(126,'Hummel back.png','ground','-'),
(127,'Hummel front.png','ground','-'),
(128,'los-icon.png','-','-'),
(129,'Luftf front.png','weapon','-'),
(130,'M109 back.png','ground','-'),
(131,'M109 front.png','ground','-'),
(132,'M-60 front.png','weapon','-'),
(133,'M72Law front.png','weapon','-'),
(134,'magnify-minus.png','-','-'),
(135,'magnify-plus.png','-','-'),
(136,'magnify-size.png','-','-'),
(137,'Map.jpg','map','-'),
(138,'Map-mini-icon.png','-','-'),
(139,'Megrim back.png','ground','Black Hand'),
(140,'Megrim front.png','ground','Black Hand'),
(141,'MG42 front.png','weapon','-'),
(142,'Mines.png','marker','-'),
(143,'mini-map-icon.png','-','-'),
(144,'moved-icon.png','-','-'),
(145,'Moved.png','marker','-'),
(146,'Nuclear 6.png','marker','-'),
(147,'Objective.png','marker','-'),
(148,'OOC-icon.png','-','-'),
(149,'OOC.png','marker','-'),
(150,'Ostwind back.png','ground','-'),
(151,'Ostwind front.png','ground','-'),
(152,'Pest back.png','ground','Black Hand'),
(153,'Pest front.png','ground','Black Hand'),
(154,'PFT3 front.png','weapon','-'),
(155,'Puma back.png','ground','-'),
(156,'Puma front.png','ground','-'),
(157,'Rad.png','marker','-'),
(158,'Rancor back.png','ground','Black Hand'),
(159,'Rancor front.png','ground','Black Hand'),
(160,'Ravager back.png','ground','Black Hand'),
(161,'Ravager front.png','ground','Black Hand'),
(162,'Red control.png','marker','-'),
(163,'retire-button.png','-','-'),
(164,'Sandbags.png','marker','-'),
(165,'Scourge back.png','vtol','Black Hand'),
(166,'Scourge front.png','vtol','Black Hand'),
(167,'screenshot-icon.png','-','-'),
(168,'Scud front.png','ground','-'),
(169,'server-button.png','-','-'),
(170,'SG2 Chit front.png','formation','SG 2'),
(171,'SG2 Saucer back.png','vtol','SG 2'),
(172,'SG2 Saucer front.png','vtol','SG 2'),
(173,'Shaken.png','marker','-'),
(174,'Shellholes.png','marker','-'),
(175,'Smoke 3.png','marker','-'),
(176,'Smoke L1.png','marker','-'),
(177,'Smoke L2.png','marker','-'),
(178,'Splash.gif','-','-'),
(179,'Stuka front.png','air','-'),
(180,'Turn.png','marker','-'),
(181,'undo.png','-','-'),
(182,'V2 front.png','rocket','-'),
(183,'Vehicle Crew.png','marker','-'),
(184,'Vympel Chit front.png','formation','Vympel'),
(185,'Vympel Co back.png','CO/2IC','Vympel'),
(186,'Vympel Co front.png','CO/2IC','Vympel'),
(187,'Vympel Spetsnaz back.png','ground','Vympel'),
(188,'Vympel Spetsnaz front.png','ground','Vympel'),
(189,'Wreck.png','marker','-'),
(190,'XM134 front.png','weapon','-'),
(191,'Zealots back.png','ground','Black Hand'),
(192,'Zealots front.png','ground','Black Hand'),
(193,'ZSU23 back.png','ground','-'),
(194,'ZSU23 front.png','ground','-');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map`
--

DROP TABLE IF EXISTS `map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map` (
  `scenario` varchar(80) NOT NULL,
  `hexID` varchar(20) NOT NULL,
  `flags` int(10) unsigned DEFAULT 0,
  `j` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '{}' CHECK (json_valid(`j`)),
  `river` int(10) unsigned DEFAULT 0,
  PRIMARY KEY (`scenario`,`hexID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map`
--

LOCK TABLES `map` WRITE;
/*!40000 ALTER TABLE `map` DISABLE KEYS */;
INSERT INTO `map` VALUES
('map0','AA14',2,'{}',0),
('map0','AA15',2,'{}',0),
('map0','AA2',2304,'{}',0),
('map0','AA6',5120,'{}',0),
('map0','B16',2,'{}',0),
('map0','B17',2,'{}',0),
('map0','BB1',2304,'{}',0),
('map0','BB13',2,'{}',0),
('map0','BB14',2,'{}',0),
('map0','C17',2,'{}',0),
('map0','CC1',2304,'{}',0),
('map0','CC14',2,'{}',0),
('map0','CC15',2,'{}',0),
('map0','H6',2,'{}',0),
('map0','H7',2,'{}',0),
('map0','I6',2,'{}',0),
('map0','I7',2,'{}',0),
('map0','I8',2,'{}',0),
('map0','I9',2,'{}',0),
('map0','J5',2,'{}',0),
('map0','J6',2,'{}',0),
('map0','J7',2,'{}',0),
('map0','J8',2,'{}',0),
('map0','J9',2,'{}',0),
('map0','K6',2,'{}',0),
('map0','K7',2,'{}',0),
('map0','K8',2,'{}',0),
('map0','K9',2,'{}',0),
('map0','L6',2,'{}',0),
('map0','L7',2,'{}',0),
('map0','L8',2,'{}',0),
('map0','Q13',2,'{}',0),
('map0','R10',2,'{}',0),
('map0','R11',2,'{}',0),
('map0','R12',2,'{}',0),
('map0','R13',2,'{}',0),
('map0','R14',2,'{}',0),
('map0','S10',2,'{}',0),
('map0','S11',2,'{}',0),
('map0','S12',2,'{}',0),
('map0','S13',2,'{}',0),
('map0','S14',2,'{}',0),
('map0','S4',2,'{}',0),
('map0','S5',2,'{}',0),
('map0','S6',2,'{}',0),
('map0','T10',2,'{}',0),
('map0','T11',2,'{}',0),
('map0','T12',2,'{}',0),
('map0','T13',2,'{}',0),
('map0','T3',2,'{}',0),
('map0','T4',2,'{}',0),
('map0','T5',2,'{}',0),
('map0','T6',2,'{}',0),
('map0','T9',2,'{}',0),
('map0','U10',2,'{}',0),
('map0','U11',2,'{}',0),
('map0','U4',2,'{}',0),
('map0','U5',2,'{}',0),
('map0','U6',2,'{}',0),
('map0','U9',2,'{}',0),
('map0','V10',2,'{}',0),
('map0','V11',2,'{}',0),
('map0','V4',2,'{}',0),
('map0','V5',2,'{}',0),
('map0','V6',2,'{}',0),
('map0','V9',2,'{}',0),
('map0','W10',2,'{}',0),
('map0','W11',2,'{}',0),
('map0','Y5',4608,'{}',0),
('map0','Y6',2304,'{}',0),
('map0','Z14',2,'{}',0),
('map0','Z2',1280,'{}',0),
('map0','Z3',1152,'{}',0),
('map0','Z4',1152,'{}',0),
('map0','Z5',6784,'{}',0);
/*!40000 ALTER TABLE `map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t1`
--

DROP TABLE IF EXISTS `t1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1` (
  `c1` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`c1`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t1`
--

LOCK TABLES `t1` WRITE;
/*!40000 ALTER TABLE `t1` DISABLE KEYS */;
INSERT INTO `t1` VALUES
('{\"x\": 17, \"x\": \"red\"}'),
('{\"x\": 17, \"x\": \"red\", \"x\": [3, 5, 7]}');
/*!40000 ALTER TABLE `t1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unitData`
--

DROP TABLE IF EXISTS `unitData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unitData` (
  `name` varchar(80) DEFAULT NULL,
  `side` varchar(80) DEFAULT NULL,
  `Ar` int(11) DEFAULT NULL,
  `Ab` int(11) DEFAULT NULL,
  `Br` int(11) DEFAULT NULL,
  `Bw` int(11) DEFAULT NULL,
  `C` int(11) DEFAULT NULL,
  `Dw` int(11) DEFAULT NULL,
  `Dy` int(11) DEFAULT NULL,
  `Er` int(11) DEFAULT NULL,
  `Eb` int(11) DEFAULT NULL,
  `Ey` int(11) DEFAULT NULL,
  `F` int(11) DEFAULT NULL,
  `G` int(11) DEFAULT NULL,
  `H` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unitData`
--

LOCK TABLES `unitData` WRITE;
/*!40000 ALTER TABLE `unitData` DISABLE KEYS */;
INSERT INTO `unitData` VALUES
('Blighter','front',10,10,15,0,6,0,15,14,0,0,6,0,0),
('Blighter','back',9,9,15,0,5,0,15,14,0,0,6,0,0),
('BRDM-2','front',0,0,0,0,4,3,0,15,0,0,8,0,8),
('BRDM-2','back',0,0,0,0,3,3,0,15,0,0,8,0,8),
('E-100','front',11,0,0,9,5,4,0,20,0,0,6,0,0),
('E-100','back',10,0,0,9,4,4,0,20,0,0,6,0,0),
('Fallschirmjager','front',6,0,0,3,5,3,0,18,0,0,3,0,16),
('Fallschirmjager','back',5,0,0,3,4,3,0,18,0,14,3,0,16),
('Haunebu III','front',12,0,9,0,6,4,0,0,17,0,17,0,1),
('Haunebu III','back',0,0,0,0,6,4,0,0,17,0,17,0,5),
('Hummel','front',10,0,18,0,6,0,18,14,0,0,5,0,0),
('Hummel','back',9,0,18,0,5,0,18,14,0,0,5,0,0),
('Jagdtiger','front',10,0,0,7,4,4,0,18,0,0,6,0,0),
('Jagdtiger','back',10,0,0,7,3,4,0,18,0,0,6,0,0),
('Ju-87G Stuka','front',12,0,0,0,5,0,0,0,17,0,25,3,0),
('King Tiger','front',10,0,0,6,5,4,0,18,0,0,6,0,0),
('King Tiger','back',9,0,0,6,4,4,0,18,0,0,6,0,0),
('M109 Paladin','front',11,0,20,0,7,0,20,15,0,0,5,0,0),
('M109 Paladin','back',10,0,20,0,6,0,20,15,0,0,5,0,0),
('M113','front',0,0,0,0,4,3,0,14,0,0,6,0,2),
('M113','back',0,0,0,0,3,3,0,14,0,0,6,0,2),
('M60A1','front',10,0,0,7,5,4,0,17,0,0,6,0,0),
('M60A1','back',9,0,0,7,4,4,0,17,0,0,6,0,0),
('Megrim','front',10,0,0,6,4,6,0,16,0,0,6,0,0),
('Megrim','back',9,0,0,6,3,6,0,16,0,0,6,0,0),
('Ostwind','front',0,8,0,7,6,5,0,14,0,0,5,0,0),
('Ostwind','back',0,7,0,7,5,5,0,14,0,0,5,0,0),
('Pest','front',0,0,0,0,4,3,0,14,0,0,6,0,10),
('Pest','back',0,0,0,0,3,3,0,14,0,0,6,0,10),
('Puma','front',9,0,0,4,4,3,0,15,0,0,7,0,8),
('Puma','back',8,0,0,4,3,3,0,15,0,0,7,0,8),
('Rancor','front',11,0,0,8,5,4,0,19,0,0,6,0,0),
('Rancor','back',10,0,0,8,4,4,0,19,0,0,6,0,0),
('Ravager','front',11,11,0,1,7,1,0,0,0,15,3,0,1),
('Ravager','back',10,10,0,1,6,1,0,0,0,15,3,0,1),
('Scourge','front',10,0,0,4,5,4,0,0,16,0,18,0,8),
('Scourge','back',0,0,0,0,5,4,0,0,16,0,18,0,4),
('SdKfz 250','front',8,0,0,3,4,3,0,14,0,0,6,0,2),
('SdKfz 250','back',7,0,0,3,3,3,0,14,0,0,6,0,2),
('Spetsnaz','front',7,0,0,3,5,3,0,0,0,13,3,0,16),
('Spetsnaz','back',6,0,0,3,4,3,0,0,0,13,3,0,16),
('SS-1C Scud-B','front',14,0,0,0,8,0,0,13,0,0,4,0,0),
('SS-VT','front',6,0,0,3,6,3,0,0,0,13,3,0,16),
('SS-VT','back',5,0,0,3,5,3,0,0,0,13,3,0,16),
('T-64','front',12,0,0,10,4,5,0,20,0,0,7,0,0),
('T-64','back',11,0,0,10,3,5,0,20,0,0,7,0,0),
('UH-1 Huey','front',13,0,8,0,5,4,0,0,16,0,20,0,0),
('UH-1 Huey','back',0,0,0,0,5,4,0,0,16,0,20,0,6),
('US Rangers','front',6,0,0,3,5,3,0,0,0,13,4,0,16),
('US Rangers','back',5,0,0,3,4,3,0,0,0,13,4,0,16),
('Zealots','front',6,0,0,3,5,3,0,0,0,13,3,0,16),
('Zealots','back',5,0,0,3,4,3,0,0,0,13,3,0,16),
('ZSU-23-4 Shilka','front',0,9,0,7,6,5,0,15,0,0,6,0,0),
('ZSU-23-4 Shilka','back',0,8,0,7,6,5,0,15,0,0,6,0,0),
('T-62','front',11,0,0,8,4,4,0,19,0,0,7,0,0),
('T-62','back',10,0,0,8,3,4,0,19,0,0,7,0,0);
/*!40000 ALTER TABLE `unitData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `units` (
  `id` int(11) NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `formation` varchar(80) DEFAULT NULL,
  `front` int(11) DEFAULT NULL,
  `back` int(11) DEFAULT NULL,
  `notes` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `units`
--

LOCK TABLES `units` WRITE;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
INSERT INTO `units` VALUES
(1,'BRDM-2','',103,102,''),
(2,'Hummel','',127,126,''),
(3,'M109 Paladin','',131,130,''),
(4,'Ostwind','',151,150,''),
(5,'Puma','',156,155,''),
(6,'SS-1C Scud-B','',168,106,'no back'),
(7,'Ju-87G Stuka','',179,106,'no back'),
(8,'ZSU-23-4 Shilka','',194,193,''),
(9,'E-100','1/130',5,4,''),
(10,'Hummel','1/130',7,6,''),
(11,'King Tiger','1/130',9,8,''),
(12,'Puma','1/130',11,10,''),
(13,'E-100','1/501 SS',63,62,''),
(14,'SdKfz 250','1/7 SS',13,12,''),
(15,'SS-VT','1/7 SS',18,17,''),
(16,'M113','1st Ranger',24,23,''),
(17,'M60A1','1st Ranger',26,25,''),
(18,'US Rangers','1st Ranger',28,27,''),
(19,'SdKfz 250','2/130',30,29,''),
(20,'E-100','2/130',35,34,''),
(21,'Fallschirmjager','2/130',37,36,''),
(22,'Jagdtiger','2/130',39,38,''),
(23,'SdKfz 250','2/501 SS',65,64,''),
(24,'E-100','2/501 SS',70,69,''),
(25,'Jagdtiger','2/501 SS',72,71,''),
(26,'SS-VT','2/501 SS',74,73,''),
(27,'BRDM-2','2nd Ranger',41,40,''),
(28,'M113','2nd Ranger',46,45,''),
(29,'M60A1','2nd Ranger',48,47,''),
(30,'US Rangers','2nd Ranger',50,49,''),
(31,'T-64','4th Guards',58,57,''),
(32,'M113','58th Motor Rifle',79,78,''),
(33,'US Rangers','58th Motor Rifle',81,80,''),
(34,'Spetsnaz','58th Motor Rifle',83,82,''),
(35,'T-64','58th Motor Rifle',58,57,''),
(36,'Blighter','Black Hand',100,99,''),
(37,'Megrim','Black Hand',140,139,''),
(38,'Pest','Black Hand',153,152,''),
(39,'Rancor','Black Hand',159,158,''),
(40,'Ravager','Black Hand',161,160,''),
(41,'Scourge','Black Hand',166,165,'no reduced'),
(42,'Zealots','Black Hand',192,191,''),
(43,'UH-1 Huey','Cowboys',111,110,'no reduced'),
(44,'Haunebu III','SG 2',172,171,'no reduced'),
(45,'Spetsnaz','Vympel',188,187,''),
(46,'T-62','58th Motor Rifle',85,84,'');
/*!40000 ALTER TABLE `units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `v_no_back_units`
--

DROP TABLE IF EXISTS `v_no_back_units`;
/*!50001 DROP VIEW IF EXISTS `v_no_back_units`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_no_back_units` AS SELECT
 1 AS `name` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_no_reduced_units`
--

DROP TABLE IF EXISTS `v_no_reduced_units`;
/*!50001 DROP VIEW IF EXISTS `v_no_reduced_units`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_no_reduced_units` AS SELECT
 1 AS `name` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_normal_units`
--

DROP TABLE IF EXISTS `v_normal_units`;
/*!50001 DROP VIEW IF EXISTS `v_normal_units`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_normal_units` AS SELECT
 1 AS `name` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_unit_back`
--

DROP TABLE IF EXISTS `v_unit_back`;
/*!50001 DROP VIEW IF EXISTS `v_unit_back`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_unit_back` AS SELECT
 1 AS `id`,
  1 AS `name`,
  1 AS `formation`,
  1 AS `back` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_unit_back_data`
--

DROP TABLE IF EXISTS `v_unit_back_data`;
/*!50001 DROP VIEW IF EXISTS `v_unit_back_data`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_unit_back_data` AS SELECT
 1 AS `formation`,
  1 AS `name`,
  1 AS `Ar`,
  1 AS `Ab`,
  1 AS `Br`,
  1 AS `Bw`,
  1 AS `C`,
  1 AS `Dw`,
  1 AS `Dy`,
  1 AS `Er`,
  1 AS `Eb`,
  1 AS `Ey`,
  1 AS `F`,
  1 AS `G`,
  1 AS `H`,
  1 AS `back` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_unit_front`
--

DROP TABLE IF EXISTS `v_unit_front`;
/*!50001 DROP VIEW IF EXISTS `v_unit_front`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_unit_front` AS SELECT
 1 AS `id`,
  1 AS `name`,
  1 AS `formation`,
  1 AS `front` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_unit_front_data`
--

DROP TABLE IF EXISTS `v_unit_front_data`;
/*!50001 DROP VIEW IF EXISTS `v_unit_front_data`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_unit_front_data` AS SELECT
 1 AS `formation`,
  1 AS `name`,
  1 AS `Ar`,
  1 AS `Ab`,
  1 AS `Br`,
  1 AS `Bw`,
  1 AS `C`,
  1 AS `Dw`,
  1 AS `Dy`,
  1 AS `Er`,
  1 AS `Eb`,
  1 AS `Ey`,
  1 AS `F`,
  1 AS `G`,
  1 AS `H`,
  1 AS `front` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_units`
--

DROP TABLE IF EXISTS `v_units`;
/*!50001 DROP VIEW IF EXISTS `v_units`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_units` AS SELECT
 1 AS `id`,
  1 AS `name`,
  1 AS `formation`,
  1 AS `front`,
  1 AS `back` */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_no_back_units`
--

/*!50001 DROP VIEW IF EXISTS `v_no_back_units`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`ayeka`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_no_back_units` AS select distinct `units`.`name` AS `name` from `units` where `units`.`notes` = 'no back' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_no_reduced_units`
--

/*!50001 DROP VIEW IF EXISTS `v_no_reduced_units`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`ayeka`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_no_reduced_units` AS select distinct `units`.`name` AS `name` from `units` where `units`.`notes` = 'no reduced' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_normal_units`
--

/*!50001 DROP VIEW IF EXISTS `v_normal_units`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`ayeka`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_normal_units` AS select distinct `units`.`name` AS `name` from `units` where `units`.`notes` = '' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_unit_back`
--

/*!50001 DROP VIEW IF EXISTS `v_unit_back`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`ayeka`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_unit_back` AS select `b`.`id` AS `id`,`b`.`name` AS `name`,`b`.`formation` AS `formation`,`a`.`name` AS `back` from (`images` `a` join `units` `b`) where `a`.`id` = `b`.`back` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_unit_back_data`
--

/*!50001 DROP VIEW IF EXISTS `v_unit_back_data`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`ayeka`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_unit_back_data` AS select `b`.`formation` AS `formation`,`a`.`name` AS `name`,`a`.`Ar` AS `Ar`,`a`.`Ab` AS `Ab`,`a`.`Br` AS `Br`,`a`.`Bw` AS `Bw`,`a`.`C` AS `C`,`a`.`Dw` AS `Dw`,`a`.`Dy` AS `Dy`,`a`.`Er` AS `Er`,`a`.`Eb` AS `Eb`,`a`.`Ey` AS `Ey`,`a`.`F` AS `F`,`a`.`G` AS `G`,`a`.`H` AS `H`,`b`.`back` AS `back` from (`unitData` `a` join `v_unit_back` `b`) where `a`.`name` = `b`.`name` and `a`.`side` = 'back' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_unit_front`
--

/*!50001 DROP VIEW IF EXISTS `v_unit_front`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`ayeka`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_unit_front` AS select `b`.`id` AS `id`,`b`.`name` AS `name`,`b`.`formation` AS `formation`,`a`.`name` AS `front` from (`images` `a` join `units` `b`) where `a`.`id` = `b`.`front` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_unit_front_data`
--

/*!50001 DROP VIEW IF EXISTS `v_unit_front_data`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`ayeka`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_unit_front_data` AS select `b`.`formation` AS `formation`,`a`.`name` AS `name`,`a`.`Ar` AS `Ar`,`a`.`Ab` AS `Ab`,`a`.`Br` AS `Br`,`a`.`Bw` AS `Bw`,`a`.`C` AS `C`,`a`.`Dw` AS `Dw`,`a`.`Dy` AS `Dy`,`a`.`Er` AS `Er`,`a`.`Eb` AS `Eb`,`a`.`Ey` AS `Ey`,`a`.`F` AS `F`,`a`.`G` AS `G`,`a`.`H` AS `H`,`b`.`front` AS `front` from (`unitData` `a` join `v_unit_front` `b`) where `a`.`name` = `b`.`name` and `a`.`side` = 'front' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_units`
--

/*!50001 DROP VIEW IF EXISTS `v_units`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`ayeka`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_units` AS select `a`.`id` AS `id`,`a`.`name` AS `name`,`a`.`formation` AS `formation`,`a`.`front` AS `front`,`b`.`back` AS `back` from (`v_unit_front` `a` join `v_unit_back` `b`) where `a`.`id` = `b`.`id` */;
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

-- Dump completed on 2024-02-23 18:43:20
