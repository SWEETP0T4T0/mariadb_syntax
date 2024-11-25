/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.5.2-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: store
-- ------------------------------------------------------
-- Server version	11.5.2-MariaDB

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
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `ID` bigint(20) NOT NULL,
  `PRODUCT_ID` bigint(20) NOT NULL,
  `ORDER_NUMBER` bigint(20) NOT NULL,
  `ORDER_NAME` varchar(255) NOT NULL,
  `PRODUCT_NAME` varchar(255) NOT NULL,
  `PRODUCT_COUNT` varchar(255) NOT NULL,
  `ADDRESS` varchar(255) NOT NULL,
  `ORDER_DATE` datetime NOT NULL DEFAULT current_timestamp(),
  `DEL_FEE` varchar(255) NOT NULL DEFAULT '3000',
  PRIMARY KEY (`ID`,`PRODUCT_ID`),
  KEY `PRODUCT_ID` (`PRODUCT_ID`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `user` (`id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES
(1,1,1,'JAMES','삼겹살','30KG','CHINA','2024-11-22 15:28:28','3000'),
(1,3,1,'JAMES','항정살','30KG','CHINA','2024-11-22 15:29:32','3000'),
(2,5,2,'MARIA','앞다리살','10KG','JAPAN','2024-11-22 15:34:05','3000'),
(3,2,3,'MICAEL','안심','10KG','KOREA','2024-11-22 15:35:15','3000'),
(3,4,3,'MICAEL','치마살','10KG','KOREA','2024-11-22 15:35:44','3000'),
(3,6,3,'MICAEL','살치살','5KG','KOREA','2024-11-22 15:36:11','3000'),
(5,3,4,'RACHEL','항정살','50KG','ENG','2024-11-22 15:37:25','3000'),
(5,4,4,'RACHEL','치마살','30KG','ENG','2024-11-22 15:38:20','3000'),
(5,5,4,'RACHEL','앞다리살','50KG','ENG','2024-11-22 15:37:47','3000');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `PRODUCT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PRODUCT_NAME` varchar(255) NOT NULL,
  `CATEGORY` enum('돼지','소','닭') NOT NULL,
  `PRICE` bigint(20) NOT NULL,
  `MEET_TIME` datetime NOT NULL,
  `SELLER_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`PRODUCT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES
(1,'삼겹살','돼지',12000,'2024-11-20 00:00:00','BEDRO'),
(2,'안심','소',15000,'2024-11-21 00:00:00','RACHEL'),
(3,'항정살','돼지',13000,'2024-11-20 00:00:00','BEDRO'),
(4,'치마살','소',18000,'2024-11-18 00:00:00','RACHEL'),
(5,'앞다리살','돼지',10000,'2024-11-02 00:00:00','JOY'),
(6,'살치살','소',9000,'2024-11-03 00:00:00','JOY');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL,
  `CALL_NUMBER` varchar(255) NOT NULL,
  `PASSWORD` bigint(20) NOT NULL,
  `ADDRESS` varchar(255) NOT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `USER_INFO` enum('COMMON','SELLER') NOT NULL DEFAULT 'COMMON',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES
(1,'JAMES','111',1234,'CHINA','JAMES1@GMAIL.COM','COMMON'),
(2,'MARIA','112',1234,'JAPAN','MARIA1@GMAIL.COM','COMMON'),
(3,'MICAEL','123',1235,'KOREA','MICAEL@GMAIL.COM','COMMON'),
(4,'BEDRO','124',1233,'AUS','BEDRO@GMAIL.COM','SELLER'),
(5,'CANDY','113',1234,'JER','CANDY@GMAIL.COM','COMMON'),
(6,'Rachel','125',1236,'ENG','Rachel@GMAIL.COM','SELLER'),
(7,'JOY','126',1237,'TURKEY','JOY@gmail.com','SELLER');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2024-11-25 10:04:00
