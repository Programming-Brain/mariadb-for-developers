-- MariaDB dump 10.19  Distrib 10.6.16-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: mariadb-server    Database: todo
-- ------------------------------------------------------
-- Server version	11.3.2-MariaDB-1:11.3.2+maria~ubu2204-log

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
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `description` text DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_items_user_id` (`user_id`),
  CONSTRAINT `fk_items_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES ('Turn bugs into \"features\"',1,1),('Refactor lunch plans',2,2),('Fork the kitchen',3,3),('Automate kitchen cleanup',4,3),('Use the rubber duck',6,1),('Escape the office maze',7,1),('Rename variables to emojis',8,1),('Install light theme',9,1),('Reboot the refrigerator',10,2),('Ping the pizza delivery',11,3),('Commit to gym',12,3),('Merge breakfast and lunch',13,5),('Rollback bedtime',14,5),('Checkout the weekend',15,6),('Push code to production on Friday',16,7),('Pull request for vacation',17,7),('Branch out hobbies',18,8),('Archive old emails',19,8),('Fetch coffee',20,8),('Stash snacks in desk',21,8),('Fix name',22,9),('Fake it until I make it',23,9);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `password` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_users_name` (`name`) USING HASH,
  CONSTRAINT `users_name_not_empty` CHECK (trim(`name`) <> ''),
  CONSTRAINT `users_password_valid` CHECK (octet_length(`password`) >= 5)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Maria','pass1'),(2,'John','pass2'),(3,'Jane','pass3'),(5,'Cee Sharp','dotnet789'),(6,'Harry Scripter','magicMethods'),(7,'Sally Sequel','joinTheFun'),(8,'Rick Rollback','neverGonnaCommitYouUp'),(9,'Alias McAlias','imposterSyndrome');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-11  0:49:39
