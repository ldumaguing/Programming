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
-- Sequence structure for `s1`
--

DROP SEQUENCE IF EXISTS `s1`;
CREATE SEQUENCE `s1` start with 1 minvalue 1 maxvalue 9223372036854775806 increment by 1 cache 1000 nocycle ENGINE=InnoDB;
SELECT SETVAL(`s1`, 1001, 0);

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
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES
(1,'1_130 Chit front.png','marker'),
(2,'1_130 CO back.png','marker'),
(3,'1_130 CO front.png','marker'),
(4,'1_130 E100 back.png','ground'),
(5,'1_130 E100 front.png','ground'),
(6,'1_130 Hummel back.png','ground'),
(7,'1_130 Hummel front.png','ground'),
(8,'1_130 KT back.png','ground'),
(9,'1_130 KT front.png','ground'),
(10,'1_130 Puma back.png','ground'),
(11,'1_130 Puma front.png','ground'),
(12,'1_7 SS 250 back.png','ground'),
(13,'1_7 SS 250 front.png','ground'),
(14,'1_7 SS Chit front.png','marker'),
(15,'1_7 SS CO back.png','marker'),
(16,'1_7 SS CO front.png','marker'),
(17,'1_7 SS VT back.png','ground'),
(18,'1_7 SS VT front.png','ground'),
(19,'1.png','marker'),
(20,'1st Ranger Chit front.png','marker'),
(21,'1st Ranger CO back.png','marker'),
(22,'1st Ranger CO front.png','marker'),
(23,'1st Ranger M113 back.png','ground'),
(24,'1st Ranger M113 front.png','ground'),
(25,'1st Ranger M60 back.png','ground'),
(26,'1st Ranger M60 front.png','ground'),
(27,'1st Ranger Ranger back.png','ground'),
(28,'1st Ranger Ranger front.png','ground'),
(29,'2_130 250 back.png','ground'),
(30,'2_130 250 front.png','ground'),
(31,'2_130 chit front.png','marker'),
(32,'2_130 CO back.png','marker'),
(33,'2_130 CO front.png','marker'),
(34,'2_130 E100 back.png','ground'),
(35,'2_130 E100 front.png','ground'),
(36,'2_130 Fall back.png','ground'),
(37,'2_130 Fall front.png','ground'),
(38,'2_130 JT back.png','ground'),
(39,'2_130 JT front.png','ground'),
(40,'2nd Ranger BRDM back.png','ground'),
(41,'2nd Ranger BRDM front.png','ground'),
(42,'2nd Ranger Chit front.png','marker'),
(43,'2nd Ranger CO back.png','marker'),
(44,'2nd Ranger CO front.png','marker'),
(45,'2nd Ranger M113 back.png','ground'),
(46,'2nd Ranger M113 front.png','ground'),
(47,'2nd Ranger M60 back.png','ground'),
(48,'2nd Ranger M60 front.png','ground'),
(49,'2nd Ranger Ranger back.png','ground'),
(50,'2nd Ranger Ranger front.png','ground'),
(51,'2.png','marker'),
(52,'3.png','marker'),
(53,'4.png','marker'),
(54,'4th G Chit front.png','marker'),
(55,'4th G CO back.png','marker'),
(56,'4th G CO front.png','marker'),
(57,'4th G T64 back.png','ground'),
(58,'4th G T64 front.png','ground'),
(59,'501SS Chit front.png','marker'),
(60,'501SS CO back.png','marker'),
(61,'501SS CO front.png','marker'),
(62,'501SS E100 back.png','ground'),
(63,'501SS E100 front.png','ground'),
(64,'502SS 250 back.png','ground'),
(65,'502SS 250 front.png','ground'),
(66,'502SS Chit front.png','marker'),
(67,'502SS CO back.png','marker'),
(68,'502SS CO front.png','marker'),
(69,'502SS E100 back.png','ground'),
(70,'502SS E100 front.png','ground'),
(71,'502SS JT back.png','ground'),
(72,'502SS JT front.png','ground'),
(73,'502SS VT back.png','ground'),
(74,'502SS VT front.png','ground'),
(75,'58th Chit front.png','marker'),
(76,'58th CO back.png','marker'),
(77,'58th CO front.png','marker'),
(78,'58th M113 back.png','ground'),
(79,'58th M113 front.png','ground'),
(80,'58th Rangers back.png','ground'),
(81,'58th Rangers front.png','ground'),
(82,'58th Spetsnaz back.png','ground'),
(83,'58th Spetsnaz front.png','ground'),
(84,'58th T62 back.png','ground'),
(85,'58th T62 front.png','ground'),
(86,'5.png','marker'),
(87,'6.png','marker'),
(88,'9K32 front.png','air'),
(89,'A6 front.png','air'),
(90,'Advance.png','marker'),
(91,'armies-icon.png','marker'),
(92,'Army_Menu.png','marker'),
(93,'assault-icon.png','marker'),
(94,'assault.png','marker'),
(95,'Barrage 3.png','marker'),
(96,'Bio 1.png','marker'),
(97,'Black control.png','marker'),
(98,'Black Hand Chit front.png','marker'),
(99,'Blighter back.png','ground'),
(100,'Blighter front.png','ground'),
(101,'blue control.png','marker'),
(102,'BRDM back.png','ground'),
(103,'BRDM front.png','ground'),
(104,'Chemical 3.png','marker'),
(105,'Chemical.png','marker'),
(106,'Chit Back.png','marker'),
(107,'Combat-icon.png','marker'),
(108,'Combat.jpg','marker'),
(109,'Cowboys Chit front.png','marker'),
(110,'Cowboys Huey back.png','vtol'),
(111,'Cowboys Huey front.png','vtol'),
(112,'cup-icon.png','marker'),
(113,'cup.jpg','marker'),
(114,'Derek Castle.png','marker'),
(115,'Diskord front.png','weapon'),
(116,'Event-icon.png','marker'),
(117,'Event.png','marker'),
(118,'Finished-icon2.png','marker'),
(119,'Finished.png','marker'),
(120,'fire-icon.png','marker'),
(121,'fire.png','marker'),
(122,'forward-button.png','marker'),
(123,'globe-dark-icon.png','marker'),
(124,'globe-icon.png','marker'),
(125,'High Morale.png','marker'),
(126,'Hummel back.png','ground'),
(127,'Hummel front.png','ground'),
(128,'los-icon.png','marker'),
(129,'Luftf front.png','weapon'),
(130,'M109 back.png','ground'),
(131,'M109 front.png','ground'),
(132,'M-60 front.png','weapon'),
(133,'M72Law front.png','weapon'),
(134,'magnify-minus.png','marker'),
(135,'magnify-plus.png','marker'),
(136,'magnify-size.png','marker'),
(137,'Map.jpg','map'),
(138,'Map-mini-icon.png','marker'),
(139,'Megrim back.png','ground'),
(140,'Megrim front.png','ground'),
(141,'MG42 front.png','weapon'),
(142,'Mines.png','marker'),
(143,'mini-map-icon.png','marker'),
(144,'moved-icon.png','marker'),
(145,'Moved.png','marker'),
(146,'Nuclear 6.png','marker'),
(147,'Objective.png','marker'),
(148,'OOC-icon.png','marker'),
(149,'OOC.png','marker'),
(150,'Ostwind back.png','ground'),
(151,'Ostwind front.png','ground'),
(152,'Pest back.png','ground'),
(153,'Pest front.png','ground'),
(154,'PFT3 front.png','weapon'),
(155,'Puma back.png','ground'),
(156,'Puma front.png','ground'),
(157,'Rad.png','marker'),
(158,'Rancor back.png','ground'),
(159,'Rancor front.png','ground'),
(160,'Ravager back.png','ground'),
(161,'Ravager front.png','ground'),
(162,'Red control.png','marker'),
(163,'retire-button.png','marker'),
(164,'Sandbags.png','marker'),
(165,'Scourge back.png','vtol'),
(166,'Scourge front.png','vtol'),
(167,'screenshot-icon.png','marker'),
(168,'Scud front.png','ground'),
(169,'server-button.png','marker'),
(170,'SG2 Chit front.png','marker'),
(171,'SG2 Saucer back.png','vtol'),
(172,'SG2 Saucer front.png','vtol'),
(173,'Shaken.png','marker'),
(174,'Shellholes.png','marker'),
(175,'Smoke 3.png','marker'),
(176,'Smoke L1.png','marker'),
(177,'Smoke L2.png','marker'),
(178,'Splash.gif','marker'),
(179,'Stuka front.png','air'),
(180,'Turn.png','marker'),
(181,'undo.png','marker'),
(182,'V2 front.png','rocket'),
(183,'Vehicle Crew.png','marker'),
(184,'Vympel Chit front.png','marker'),
(185,'Vympel Co back.png','marker'),
(186,'Vympel Co front.png','marker'),
(187,'Vympel Spetsnaz back.png','ground'),
(188,'Vympel Spetsnaz front.png','ground'),
(189,'Wreck.png','marker'),
(190,'XM134 front.png','weapon'),
(191,'Zealots back.png','ground'),
(192,'Zealots front.png','ground'),
(193,'ZSU23 back.png','ground'),
(194,'ZSU23 front.png','ground');
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

-- Dump completed on 2024-01-20 18:47:07
