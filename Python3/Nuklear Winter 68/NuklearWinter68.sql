-- MariaDB dump 10.19  Distrib 10.11.4-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: NuklearWinter68
-- ------------------------------------------------------
-- Server version	10.11.4-MariaDB-1~deb12u1

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
(19,'1.png','die',NULL),
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
(51,'2.png','die',NULL),
(52,'3.png','die',NULL),
(53,'4.png','die',NULL),
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
(86,'5.png','die',NULL),
(87,'6.png','die',NULL),
(88,'9K32 front.png','weapon',NULL),
(89,'A6 front.png','air',NULL),
(90,'Advance.png','marker',NULL),
(91,'armies-icon.png','-',NULL),
(92,'Army_Menu.png','-',NULL),
(93,'assault-icon.png','-',NULL),
(94,'assault.png','doc',NULL),
(95,'Barrage 3.png','marker',NULL),
(96,'Bio 1.png','marker',NULL),
(97,'Black control.png','marker',NULL),
(98,'Black Hand Chit front.png','formation','Black Hand'),
(99,'Blighter back.png','ground','Black Hand'),
(100,'Blighter front.png','ground','Black Hand'),
(101,'blue control.png','marker',NULL),
(102,'BRDM back.png','ground',NULL),
(103,'BRDM front.png','ground',NULL),
(104,'Chemical 3.png','marker',NULL),
(105,'Chemical.png','marker',NULL),
(106,'Chit Back.png','marker',NULL),
(107,'Combat-icon.png','-',NULL),
(108,'Combat.jpg','doc',NULL),
(109,'Cowboys Chit front.png','formation','Cowboys'),
(110,'Cowboys Huey back.png','vtol','Cowboys'),
(111,'Cowboys Huey front.png','vtol','Cowboys'),
(112,'cup-icon.png','-',NULL),
(113,'cup.jpg','-',NULL),
(114,'Derek Castle.png','marker',NULL),
(115,'Diskord front.png','weapon',NULL),
(116,'Event-icon.png','-',NULL),
(117,'Event.png','marker',NULL),
(118,'Finished-icon2.png','-',NULL),
(119,'Finished.png','marker',NULL),
(120,'fire-icon.png','-',NULL),
(121,'fire.png','doc',NULL),
(122,'forward-button.png','-',NULL),
(123,'globe-dark-icon.png','-',NULL),
(124,'globe-icon.png','-',NULL),
(125,'High Morale.png','marker',NULL),
(126,'Hummel back.png','ground',NULL),
(127,'Hummel front.png','ground',NULL),
(128,'los-icon.png','-',NULL),
(129,'Luftf front.png','weapon',NULL),
(130,'M109 back.png','ground',NULL),
(131,'M109 front.png','ground',NULL),
(132,'M-60 front.png','weapon',NULL),
(133,'M72Law front.png','weapon',NULL),
(134,'magnify-minus.png','-',NULL),
(135,'magnify-plus.png','-',NULL),
(136,'magnify-size.png','-',NULL),
(137,'Map.jpg','map',NULL),
(138,'Map-mini-icon.png','-',NULL),
(139,'Megrim back.png','ground','Black Hand'),
(140,'Megrim front.png','ground','Black Hand'),
(141,'MG42 front.png','weapon',NULL),
(142,'Mines.png','marker',NULL),
(143,'mini-map-icon.png','-',NULL),
(144,'moved-icon.png','-',NULL),
(145,'Moved.png','marker',NULL),
(146,'Nuclear 6.png','marker',NULL),
(147,'Objective.png','marker',NULL),
(148,'OOC-icon.png','-',NULL),
(149,'OOC.png','marker',NULL),
(150,'Ostwind back.png','ground',NULL),
(151,'Ostwind front.png','ground',NULL),
(152,'Pest back.png','ground','Black Hand'),
(153,'Pest front.png','ground','Black Hand'),
(154,'PFT3 front.png','weapon',NULL),
(155,'Puma back.png','ground',NULL),
(156,'Puma front.png','ground',NULL),
(157,'Rad.png','marker',NULL),
(158,'Rancor back.png','ground','Black Hand'),
(159,'Rancor front.png','ground','Black Hand'),
(160,'Ravager back.png','ground','Black Hand'),
(161,'Ravager front.png','ground','Black Hand'),
(162,'Red control.png','marker',NULL),
(163,'retire-button.png','-',NULL),
(164,'Sandbags.png','marker',NULL),
(165,'Scourge back.png','vtol','Black Hand'),
(166,'Scourge front.png','vtol','Black Hand'),
(167,'screenshot-icon.png','-',NULL),
(168,'Scud front.png','ground',NULL),
(169,'server-button.png','-',NULL),
(170,'SG2 Chit front.png','formation','SG 2'),
(171,'SG2 Saucer back.png','vtol','SG 2'),
(172,'SG2 Saucer front.png','vtol','SG 2'),
(173,'Shaken.png','marker',NULL),
(174,'Shellholes.png','marker',NULL),
(175,'Smoke 3.png','marker',NULL),
(176,'Smoke L1.png','marker',NULL),
(177,'Smoke L2.png','marker',NULL),
(178,'Splash.gif','-',NULL),
(179,'Stuka front.png','air',NULL),
(180,'Turn.png','marker',NULL),
(181,'undo.png','-',NULL),
(182,'V2 front.png','rocket',NULL),
(183,'Vehicle Crew.png','marker',NULL),
(184,'Vympel Chit front.png','formation','Vympel'),
(185,'Vympel Co back.png','CO/2IC','Vympel'),
(186,'Vympel Co front.png','CO/2IC','Vympel'),
(187,'Vympel Spetsnaz back.png','ground','Vympel'),
(188,'Vympel Spetsnaz front.png','ground','Vympel'),
(189,'Wreck.png','marker',NULL),
(190,'XM134 front.png','weapon',NULL),
(191,'Zealots back.png','ground','Black Hand'),
(192,'Zealots front.png','ground','Black Hand'),
(193,'ZSU23 back.png','ground',NULL),
(194,'ZSU23 front.png','ground',NULL);
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-20 23:26:15
