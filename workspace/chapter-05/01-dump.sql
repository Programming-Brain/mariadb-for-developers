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
-- Current Database: `todo`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `todo` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `todo`;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `description` varchar(250) NOT NULL,
  `due_date` date DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `completed_at` datetime DEFAULT NULL,
  `status` enum('IN_PROGRESS','DONE') DEFAULT NULL,
  `priority` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk_items_user_id` (`user_id`),
  KEY `fk_items_project_id` (`project_id`),
  KEY `idx_status` (`status`),
  CONSTRAINT `fk_items_project_id` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  CONSTRAINT `fk_items_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `items_description_valid` CHECK (trim(`description`) <> '')
) ENGINE=InnoDB AUTO_INCREMENT=228 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,31,1,'Develop API endpoints','2024-09-18','2024-02-19 00:00:00',NULL,'IN_PROGRESS',0),(2,9,18,'Refactor database schema','2024-03-22','2024-03-13 00:00:00','2024-03-26 00:00:00','DONE',1),(3,18,16,'Migrate to microservices architecture','2024-05-01','2024-01-14 00:00:00',NULL,'IN_PROGRESS',0),(4,43,3,'Design user interface for mobile app','2024-09-26','2024-02-21 00:00:00',NULL,'IN_PROGRESS',0),(5,5,7,'Design user interface for mobile app','2024-03-24','2024-03-14 00:00:00','2024-04-03 00:00:00','DONE',0),(6,45,6,'Optimize network throughput','2024-04-06','2024-03-20 00:00:00','2024-04-08 00:00:00','DONE',0),(7,22,17,'Develop API endpoints','2023-12-14','2023-11-27 00:00:00','2023-12-28 00:00:00','DONE',0),(8,4,1,'Refactor database schema','2024-04-23','2024-03-25 00:00:00','2024-04-27 00:00:00','DONE',0),(9,43,13,'Implement OAuth2 authentication','2024-08-09','2023-12-20 00:00:00',NULL,'IN_PROGRESS',0),(10,12,15,'Implement OAuth2 authentication','2024-07-15','2024-03-03 00:00:00',NULL,'IN_PROGRESS',0),(11,26,9,'Develop API endpoints','2024-07-14','2024-02-29 00:00:00',NULL,'IN_PROGRESS',1),(12,46,17,'Enhance cybersecurity measures','2024-09-24','2024-03-05 00:00:00',NULL,'IN_PROGRESS',0),(13,9,8,'Migrate to microservices architecture','2024-05-16','2023-11-18 00:00:00',NULL,'IN_PROGRESS',0),(14,3,8,'Migrate to microservices architecture','2024-07-23','2023-11-10 00:00:00',NULL,'IN_PROGRESS',0),(15,27,13,'Upgrade server hardware','2024-04-02','2024-03-26 00:00:00','2024-04-12 00:00:00','DONE',0),(16,33,17,'Enhance cybersecurity measures','2024-01-19','2024-01-04 00:00:00','2024-01-26 00:00:00','DONE',0),(17,28,5,'Set up continuous integration','2023-12-20','2023-12-07 00:00:00','2024-01-04 00:00:00','DONE',0),(18,45,6,'Optimize network throughput','2024-05-28','2024-03-15 00:00:00',NULL,'IN_PROGRESS',0),(19,17,12,'Enhance cybersecurity measures','2023-11-16','2023-10-31 00:00:00','2023-11-18 00:00:00','DONE',0),(20,26,14,'Optimize network throughput','2024-10-20','2023-11-04 00:00:00',NULL,'IN_PROGRESS',0),(21,29,6,'Enhance cybersecurity measures','2023-11-17','2023-11-09 00:00:00','2023-11-18 00:00:00','DONE',0),(22,23,14,'Develop API endpoints','2023-11-19','2023-10-27 00:00:00','2023-11-26 00:00:00','DONE',0),(23,28,14,'Implement OAuth2 authentication','2024-10-15','2024-03-14 00:00:00',NULL,'IN_PROGRESS',0),(24,32,6,'Set up continuous integration','2024-05-12','2024-02-08 00:00:00',NULL,'IN_PROGRESS',0),(25,18,12,'Migrate to microservices architecture','2024-08-31','2023-12-11 00:00:00',NULL,'IN_PROGRESS',0),(26,30,13,'Optimize network throughput','2024-09-11','2024-03-07 00:00:00',NULL,'IN_PROGRESS',0),(27,44,13,'Migrate to microservices architecture','2024-03-10','2024-02-11 00:00:00','2024-03-11 00:00:00','DONE',1),(28,28,9,'Set up continuous integration','2023-12-31','2023-12-29 00:00:00','2024-01-15 00:00:00','DONE',0),(29,37,4,'Upgrade server hardware','2024-09-10','2024-01-13 00:00:00',NULL,'IN_PROGRESS',0),(30,48,4,'Develop API endpoints','2023-11-02','2023-10-09 00:00:00','2023-11-17 00:00:00','DONE',0),(31,23,17,'Refactor database schema','2024-07-12','2024-01-09 00:00:00',NULL,'IN_PROGRESS',1),(32,37,8,'Create user documentation','2024-01-19','2023-12-23 00:00:00','2024-01-31 00:00:00','DONE',0),(33,49,1,'Upgrade server hardware','2024-10-14','2023-11-05 00:00:00',NULL,'IN_PROGRESS',0),(34,14,18,'Migrate to microservices architecture','2023-12-09','2023-12-04 00:00:00','2023-12-22 00:00:00','DONE',0),(35,1,15,'Upgrade server hardware','2024-09-03','2023-12-30 00:00:00',NULL,'IN_PROGRESS',0),(36,26,1,'Enhance cybersecurity measures','2023-11-14','2023-10-22 00:00:00','2023-11-26 00:00:00','DONE',0),(37,21,19,'Optimize network throughput','2024-08-05','2024-01-01 00:00:00',NULL,'IN_PROGRESS',1),(38,2,1,'Set up continuous integration','2024-08-20','2024-03-15 00:00:00',NULL,'IN_PROGRESS',0),(39,11,10,'Enhance cybersecurity measures','2023-12-13','2023-12-03 00:00:00','2023-12-14 00:00:00','DONE',0),(40,32,10,'Migrate to microservices architecture','2024-06-12','2023-12-08 00:00:00',NULL,'IN_PROGRESS',0),(41,32,8,'Upgrade server hardware','2024-07-16','2023-11-06 00:00:00',NULL,'IN_PROGRESS',0),(42,27,17,'Migrate to microservices architecture','2024-08-19','2024-03-22 00:00:00',NULL,'IN_PROGRESS',0),(43,49,4,'Refactor database schema','2024-03-10','2024-02-16 00:00:00','2024-03-23 00:00:00','DONE',0),(44,42,2,'Refactor database schema','2024-04-16','2024-03-22 00:00:00','2024-04-28 00:00:00','DONE',0),(45,5,18,'Develop API endpoints','2024-06-04','2023-12-28 00:00:00',NULL,'IN_PROGRESS',0),(46,39,19,'Implement OAuth2 authentication','2024-03-17','2024-03-09 00:00:00','2024-03-25 00:00:00','DONE',0),(47,27,15,'Design user interface for mobile app','2024-02-26','2024-02-23 00:00:00','2024-03-11 00:00:00','DONE',0),(48,5,10,'Refactor database schema','2024-01-26','2024-01-08 00:00:00','2024-01-29 00:00:00','DONE',0),(49,14,16,'Design user interface for mobile app','2024-10-15','2024-01-05 00:00:00',NULL,'IN_PROGRESS',0),(50,10,10,'Migrate to microservices architecture','2024-05-07','2024-01-22 00:00:00',NULL,'IN_PROGRESS',0),(51,1,10,'Implement OAuth2 authentication','2024-07-31','2023-11-22 00:00:00',NULL,'IN_PROGRESS',0),(52,48,7,'Create user documentation','2024-08-02','2023-12-02 00:00:00',NULL,'IN_PROGRESS',1),(53,2,4,'Implement OAuth2 authentication','2024-08-17','2023-12-29 00:00:00',NULL,'IN_PROGRESS',0),(54,1,17,'Upgrade server hardware','2024-04-18','2024-03-22 00:00:00','2024-04-30 00:00:00','DONE',0),(55,21,11,'Develop API endpoints','2024-10-04','2024-01-24 00:00:00',NULL,'IN_PROGRESS',0),(56,26,18,'Optimize network throughput','2024-03-05','2024-02-13 00:00:00','2024-03-18 00:00:00','DONE',0),(57,31,15,'Enhance cybersecurity measures','2024-09-23','2023-12-27 00:00:00',NULL,'IN_PROGRESS',1),(58,41,13,'Upgrade server hardware','2023-12-23','2023-12-11 00:00:00','2023-12-28 00:00:00','DONE',1),(59,24,12,'Optimize network throughput','2024-08-30','2023-11-30 00:00:00',NULL,'IN_PROGRESS',0),(60,28,14,'Enhance cybersecurity measures','2023-12-15','2023-12-11 00:00:00','2023-12-27 00:00:00','DONE',0),(61,35,10,'Design user interface for mobile app','2024-02-18','2024-01-29 00:00:00','2024-02-28 00:00:00','DONE',0),(62,19,6,'Upgrade server hardware','2024-07-13','2024-03-03 00:00:00',NULL,'IN_PROGRESS',0),(63,2,14,'Create user documentation','2024-04-18','2024-04-05 00:00:00','2024-04-25 00:00:00','DONE',0),(64,31,16,'Enhance cybersecurity measures','2024-06-17','2024-03-12 00:00:00',NULL,'IN_PROGRESS',0),(65,39,13,'Implement OAuth2 authentication','2024-07-03','2023-11-20 00:00:00',NULL,'IN_PROGRESS',0),(66,41,2,'Migrate to microservices architecture','2024-01-02','2023-12-28 00:00:00','2024-01-04 00:00:00','DONE',1),(67,13,3,'Set up continuous integration','2024-03-30','2024-03-08 00:00:00','2024-04-06 00:00:00','DONE',0),(68,14,17,'Design user interface for mobile app','2024-10-05','2023-12-25 00:00:00',NULL,'IN_PROGRESS',0),(69,24,9,'Upgrade server hardware','2023-12-09','2023-11-24 00:00:00','2023-12-24 00:00:00','DONE',0),(70,38,8,'Implement OAuth2 authentication','2023-11-21','2023-11-08 00:00:00','2023-11-23 00:00:00','DONE',0),(71,50,16,'Develop API endpoints','2024-02-07','2024-01-26 00:00:00','2024-02-22 00:00:00','DONE',0),(72,41,18,'Enhance cybersecurity measures','2024-04-05','2024-03-27 00:00:00','2024-04-20 00:00:00','DONE',0),(73,41,16,'Set up continuous integration','2024-05-29','2024-01-31 00:00:00',NULL,'IN_PROGRESS',1),(74,1,19,'Develop API endpoints','2024-10-04','2023-12-01 00:00:00',NULL,'IN_PROGRESS',1),(75,22,16,'Enhance cybersecurity measures','2023-11-13','2023-11-05 00:00:00','2023-11-27 00:00:00','DONE',1),(76,29,14,'Optimize network throughput','2024-07-21','2024-03-03 00:00:00',NULL,'IN_PROGRESS',0),(77,3,1,'Develop API endpoints','2024-04-27','2024-04-10 00:00:00','2024-05-11 00:00:00','DONE',0),(78,13,1,'Implement OAuth2 authentication','2023-12-02','2023-11-23 00:00:00','2023-12-03 00:00:00','DONE',1),(79,15,17,'Set up continuous integration','2024-01-13','2023-12-24 00:00:00','2024-01-25 00:00:00','DONE',0),(80,11,1,'Create user documentation','2024-05-16','2024-02-10 00:00:00',NULL,'IN_PROGRESS',0),(81,8,2,'Refactor database schema','2024-02-14','2024-02-05 00:00:00','2024-02-15 00:00:00','DONE',0),(82,38,11,'Enhance cybersecurity measures','2024-02-06','2024-01-25 00:00:00','2024-02-08 00:00:00','DONE',1),(83,48,6,'Upgrade server hardware','2023-12-16','2023-12-03 00:00:00','2023-12-31 00:00:00','DONE',0),(84,2,4,'Enhance cybersecurity measures','2024-08-06','2024-03-01 00:00:00',NULL,'IN_PROGRESS',1),(85,14,14,'Refactor database schema','2024-01-31','2024-01-11 00:00:00','2024-02-12 00:00:00','DONE',0),(86,46,2,'Refactor database schema','2024-03-24','2024-03-21 00:00:00','2024-04-06 00:00:00','DONE',0),(87,22,1,'Develop API endpoints','2024-03-21','2024-03-02 00:00:00','2024-03-22 00:00:00','DONE',0),(88,11,5,'Optimize network throughput','2024-09-11','2024-02-15 00:00:00',NULL,'IN_PROGRESS',0),(89,32,5,'Refactor database schema','2024-10-11','2023-11-13 00:00:00',NULL,'IN_PROGRESS',0),(90,48,9,'Optimize network throughput','2024-05-04','2023-12-26 00:00:00',NULL,'IN_PROGRESS',0),(91,13,19,'Optimize network throughput','2024-03-07','2024-02-29 00:00:00','2024-03-15 00:00:00','DONE',0),(92,17,7,'Set up continuous integration','2024-07-08','2024-03-06 00:00:00',NULL,'IN_PROGRESS',0),(93,14,6,'Upgrade server hardware','2024-03-24','2024-03-12 00:00:00','2024-04-08 00:00:00','DONE',0),(94,3,17,'Migrate to microservices architecture','2024-02-13','2024-02-02 00:00:00','2024-02-22 00:00:00','DONE',1),(95,12,17,'Develop API endpoints','2023-12-04','2023-12-03 00:00:00','2023-12-07 00:00:00','DONE',0),(96,33,17,'Design user interface for mobile app','2024-01-13','2024-01-05 00:00:00','2024-01-22 00:00:00','DONE',0),(97,11,16,'Refactor database schema','2024-04-11','2024-04-05 00:00:00','2024-04-23 00:00:00','DONE',0),(98,35,14,'Create user documentation','2024-07-24','2024-03-25 00:00:00',NULL,'IN_PROGRESS',1),(99,21,11,'Enhance cybersecurity measures','2024-09-18','2023-11-02 00:00:00',NULL,'IN_PROGRESS',0),(100,30,9,'Create user documentation','2024-04-04','2024-03-28 00:00:00','2024-04-07 00:00:00','DONE',0),(101,39,19,'Design user interface for mobile app','2024-05-28','2023-11-04 00:00:00',NULL,'IN_PROGRESS',0),(102,26,2,'Implement OAuth2 authentication','2024-05-15','2023-11-20 00:00:00',NULL,'IN_PROGRESS',0),(103,6,5,'Design user interface for mobile app','2023-12-03','2023-11-24 00:00:00','2023-12-15 00:00:00','DONE',0),(104,20,10,'Optimize network throughput','2023-11-02','2023-10-29 00:00:00','2023-11-13 00:00:00','DONE',0),(105,38,14,'Migrate to microservices architecture','2023-11-09','2023-10-16 00:00:00','2023-11-21 00:00:00','DONE',1),(106,46,15,'Implement OAuth2 authentication','2024-03-31','2024-03-13 00:00:00','2024-04-10 00:00:00','DONE',0),(107,26,3,'Develop API endpoints','2024-08-02','2024-01-03 00:00:00',NULL,'IN_PROGRESS',0),(108,48,8,'Set up continuous integration','2024-06-14','2023-11-15 00:00:00',NULL,'IN_PROGRESS',1),(109,36,3,'Design user interface for mobile app','2024-03-22','2024-02-25 00:00:00','2024-03-31 00:00:00','DONE',0),(110,39,2,'Implement OAuth2 authentication','2024-08-17','2024-03-28 00:00:00',NULL,'IN_PROGRESS',0),(111,2,4,'Optimize network throughput','2023-11-25','2023-11-08 00:00:00','2023-11-26 00:00:00','DONE',0),(112,29,11,'Set up continuous integration','2023-12-15','2023-12-11 00:00:00','2023-12-19 00:00:00','DONE',0),(113,47,7,'Enhance cybersecurity measures','2024-06-26','2024-02-08 00:00:00',NULL,'IN_PROGRESS',1),(114,27,2,'Design user interface for mobile app','2024-07-04','2024-01-23 00:00:00',NULL,'IN_PROGRESS',0),(115,47,5,'Optimize network throughput','2024-02-28','2024-02-14 00:00:00','2024-03-10 00:00:00','DONE',0),(116,33,12,'Refactor database schema','2024-04-19','2024-03-20 00:00:00','2024-05-01 00:00:00','DONE',0),(117,18,13,'Migrate to microservices architecture','2023-11-05','2023-10-15 00:00:00','2023-11-10 00:00:00','DONE',0),(118,18,18,'Migrate to microservices architecture','2024-02-07','2024-01-17 00:00:00','2024-02-17 00:00:00','DONE',0),(119,21,3,'Implement OAuth2 authentication','2024-06-15','2024-01-05 00:00:00',NULL,'IN_PROGRESS',0),(120,26,2,'Create user documentation','2024-01-30','2024-01-23 00:00:00','2024-02-14 00:00:00','DONE',0),(121,31,2,'Optimize network throughput','2024-02-09','2024-01-30 00:00:00','2024-02-16 00:00:00','DONE',0),(122,47,12,'Enhance cybersecurity measures','2023-12-18','2023-11-22 00:00:00','2023-12-27 00:00:00','DONE',0),(123,33,13,'Set up continuous integration','2024-04-14','2024-04-06 00:00:00','2024-04-28 00:00:00','DONE',0),(124,30,9,'Develop API endpoints','2024-07-31','2024-02-19 00:00:00',NULL,'IN_PROGRESS',0),(125,11,15,'Refactor database schema','2024-10-02','2023-12-28 00:00:00',NULL,'IN_PROGRESS',0),(126,9,15,'Create user documentation','2024-05-07','2024-02-27 00:00:00',NULL,'IN_PROGRESS',0),(127,3,8,'Enhance cybersecurity measures','2024-02-11','2024-01-16 00:00:00','2024-02-17 00:00:00','DONE',0),(128,5,19,'Set up continuous integration','2024-10-19','2023-11-14 00:00:00',NULL,'IN_PROGRESS',0),(129,11,17,'Develop API endpoints','2024-09-11','2024-01-10 00:00:00',NULL,'IN_PROGRESS',0),(130,48,2,'Create user documentation','2024-06-07','2024-02-24 00:00:00',NULL,'IN_PROGRESS',0),(131,14,8,'Create user documentation','2023-12-15','2023-11-17 00:00:00','2023-12-30 00:00:00','DONE',0),(132,30,3,'Enhance cybersecurity measures','2024-05-24','2024-02-08 00:00:00',NULL,'IN_PROGRESS',0),(133,39,5,'Set up continuous integration','2024-01-17','2023-12-23 00:00:00','2024-01-24 00:00:00','DONE',0),(134,38,7,'Develop API endpoints','2024-06-08','2023-11-17 00:00:00',NULL,'IN_PROGRESS',0),(135,23,14,'Refactor database schema','2024-05-29','2024-02-15 00:00:00',NULL,'IN_PROGRESS',0),(136,10,5,'Design user interface for mobile app','2024-02-06','2024-01-26 00:00:00','2024-02-21 00:00:00','DONE',0),(137,22,7,'Implement OAuth2 authentication','2024-02-17','2024-01-31 00:00:00','2024-03-03 00:00:00','DONE',0),(138,41,1,'Design user interface for mobile app','2024-01-19','2024-01-03 00:00:00','2024-02-03 00:00:00','DONE',0),(139,32,2,'Optimize network throughput','2023-12-18','2023-12-16 00:00:00','2023-12-24 00:00:00','DONE',0),(140,42,19,'Create user documentation','2024-05-03','2024-02-08 00:00:00',NULL,'IN_PROGRESS',0),(141,36,7,'Create user documentation','2024-02-12','2024-02-02 00:00:00','2024-02-20 00:00:00','DONE',1),(142,11,17,'Upgrade server hardware','2024-08-29','2024-02-27 00:00:00',NULL,'IN_PROGRESS',0),(143,44,4,'Upgrade server hardware','2024-05-10','2023-12-28 00:00:00',NULL,'IN_PROGRESS',0),(144,6,3,'Migrate to microservices architecture','2024-04-01','2024-03-21 00:00:00','2024-04-09 00:00:00','DONE',0),(145,35,9,'Upgrade server hardware','2024-02-24','2024-02-21 00:00:00','2024-02-29 00:00:00','DONE',0),(146,22,17,'Implement OAuth2 authentication','2023-11-06','2023-10-10 00:00:00','2023-11-11 00:00:00','DONE',0),(147,21,5,'Develop API endpoints','2024-05-11','2023-11-29 00:00:00',NULL,'IN_PROGRESS',0),(148,16,14,'Set up continuous integration','2024-02-19','2024-01-20 00:00:00','2024-02-24 00:00:00','DONE',0),(149,12,4,'Enhance cybersecurity measures','2024-10-19','2024-03-04 00:00:00',NULL,'IN_PROGRESS',0),(150,7,8,'Set up continuous integration','2023-12-31','2023-12-04 00:00:00','2024-01-05 00:00:00','DONE',0),(151,34,10,'Upgrade server hardware','2023-12-30','2023-12-20 00:00:00','2024-01-14 00:00:00','DONE',1),(152,18,8,'Design user interface for mobile app','2024-01-01','2023-12-16 00:00:00','2024-01-15 00:00:00','DONE',0),(153,11,12,'Design user interface for mobile app','2024-10-21','2024-02-13 00:00:00',NULL,'IN_PROGRESS',0),(154,20,5,'Create user documentation','2024-08-08','2023-11-11 00:00:00',NULL,'IN_PROGRESS',0),(155,34,18,'Optimize network throughput','2024-09-14','2024-01-27 00:00:00',NULL,'IN_PROGRESS',0),(156,11,18,'Enhance cybersecurity measures','2023-11-13','2023-10-17 00:00:00','2023-11-21 00:00:00','DONE',0),(157,8,15,'Implement OAuth2 authentication','2024-01-17','2024-01-10 00:00:00','2024-01-23 00:00:00','DONE',1),(158,25,12,'Implement OAuth2 authentication','2024-06-13','2024-01-07 00:00:00',NULL,'IN_PROGRESS',0),(159,44,5,'Develop API endpoints','2023-12-31','2023-12-28 00:00:00','2024-01-04 00:00:00','DONE',0),(160,27,18,'Optimize network throughput','2023-12-28','2023-12-09 00:00:00','2024-01-07 00:00:00','DONE',1),(161,42,4,'Set up continuous integration','2024-06-13','2024-01-18 00:00:00',NULL,'IN_PROGRESS',0),(162,38,9,'Create user documentation','2024-03-26','2024-03-24 00:00:00','2024-03-30 00:00:00','DONE',0),(163,8,3,'Optimize network throughput','2024-03-23','2024-02-26 00:00:00','2024-04-03 00:00:00','DONE',0),(164,5,11,'Optimize network throughput','2024-05-24','2023-11-16 00:00:00',NULL,'IN_PROGRESS',0),(165,19,12,'Set up continuous integration','2024-07-13','2024-02-01 00:00:00',NULL,'IN_PROGRESS',0),(166,45,16,'Refactor database schema','2024-08-23','2024-03-01 00:00:00',NULL,'IN_PROGRESS',0),(167,49,1,'Enhance cybersecurity measures','2024-01-11','2024-01-04 00:00:00','2024-01-15 00:00:00','DONE',0),(168,22,3,'Enhance cybersecurity measures','2023-12-12','2023-12-03 00:00:00','2023-12-26 00:00:00','DONE',0),(169,11,2,'Design user interface for mobile app','2023-12-21','2023-12-16 00:00:00','2023-12-28 00:00:00','DONE',1),(170,37,19,'Optimize network throughput','2024-07-19','2024-01-05 00:00:00',NULL,'IN_PROGRESS',1),(171,2,13,'Refactor database schema','2024-07-11','2024-02-25 00:00:00',NULL,'IN_PROGRESS',0),(172,38,12,'Design user interface for mobile app','2024-07-31','2024-01-19 00:00:00',NULL,'IN_PROGRESS',0),(173,17,11,'Refactor database schema','2024-03-14','2024-03-02 00:00:00','2024-03-18 00:00:00','DONE',0),(174,45,16,'Create user documentation','2024-08-01','2023-11-19 00:00:00',NULL,'IN_PROGRESS',0),(175,36,5,'Migrate to microservices architecture','2023-12-17','2023-11-24 00:00:00','2023-12-20 00:00:00','DONE',0),(176,10,13,'Refactor database schema','2024-09-20','2024-03-20 00:00:00',NULL,'IN_PROGRESS',0),(177,34,8,'Upgrade server hardware','2023-12-25','2023-12-02 00:00:00','2024-01-06 00:00:00','DONE',0),(178,33,9,'Develop API endpoints','2024-09-06','2024-03-21 00:00:00',NULL,'IN_PROGRESS',0),(179,43,15,'Upgrade server hardware','2024-03-20','2024-03-11 00:00:00','2024-03-30 00:00:00','DONE',0),(180,40,15,'Optimize network throughput','2024-07-20','2024-02-11 00:00:00',NULL,'IN_PROGRESS',0),(181,9,16,'Refactor database schema','2024-05-27','2023-11-20 00:00:00',NULL,'IN_PROGRESS',0),(182,28,4,'Optimize network throughput','2024-03-15','2024-03-01 00:00:00','2024-03-29 00:00:00','DONE',0),(183,24,8,'Enhance cybersecurity measures','2024-09-26','2024-02-23 00:00:00',NULL,'IN_PROGRESS',0),(184,24,4,'Implement OAuth2 authentication','2023-12-11','2023-11-17 00:00:00','2023-12-24 00:00:00','DONE',1),(185,19,4,'Enhance cybersecurity measures','2024-08-03','2024-01-10 00:00:00',NULL,'IN_PROGRESS',0),(186,24,6,'Upgrade server hardware','2024-10-18','2024-03-14 00:00:00',NULL,'IN_PROGRESS',0),(187,12,11,'Design user interface for mobile app','2024-06-14','2024-03-07 00:00:00',NULL,'IN_PROGRESS',1),(188,40,2,'Design user interface for mobile app','2024-06-22','2023-12-30 00:00:00',NULL,'IN_PROGRESS',0),(189,23,8,'Implement OAuth2 authentication','2024-10-02','2024-03-03 00:00:00',NULL,'IN_PROGRESS',0),(190,33,3,'Develop API endpoints','2024-08-04','2024-03-01 00:00:00',NULL,'IN_PROGRESS',0),(191,25,19,'Migrate to microservices architecture','2023-12-24','2023-12-17 00:00:00','2024-01-08 00:00:00','DONE',0),(192,28,19,'Refactor database schema','2024-10-21','2024-03-02 00:00:00',NULL,'IN_PROGRESS',0),(193,33,10,'Design user interface for mobile app','2024-08-23','2024-03-28 00:00:00',NULL,'IN_PROGRESS',0),(194,37,15,'Refactor database schema','2024-03-12','2024-03-03 00:00:00','2024-03-17 00:00:00','DONE',1),(195,10,18,'Optimize network throughput','2023-11-23','2023-11-13 00:00:00','2023-11-27 00:00:00','DONE',0),(196,29,19,'Optimize network throughput','2024-02-24','2024-02-14 00:00:00','2024-02-25 00:00:00','DONE',0),(197,26,3,'Design user interface for mobile app','2024-02-13','2024-02-03 00:00:00','2024-02-22 00:00:00','DONE',0),(198,20,14,'Refactor database schema','2024-03-05','2024-02-27 00:00:00','2024-03-10 00:00:00','DONE',0),(199,37,7,'Implement OAuth2 authentication','2024-03-29','2024-03-19 00:00:00','2024-04-05 00:00:00','DONE',0),(200,9,17,'Refactor database schema','2023-12-31','2023-12-03 00:00:00','2024-01-02 00:00:00','DONE',1),(201,6,18,'Migrate to microservices architecture','2024-07-21','2024-03-01 00:00:00',NULL,'IN_PROGRESS',0),(202,41,9,'Refactor database schema','2023-12-10','2023-11-13 00:00:00','2023-12-25 00:00:00','DONE',0),(203,35,4,'Optimize network throughput','2024-09-12','2023-11-02 00:00:00',NULL,'IN_PROGRESS',0),(204,43,9,'Implement OAuth2 authentication','2024-05-16','2023-11-26 00:00:00',NULL,'IN_PROGRESS',1),(205,18,11,'Design user interface for mobile app','2024-08-07','2024-02-25 00:00:00',NULL,'IN_PROGRESS',0),(206,46,5,'Upgrade server hardware','2023-11-18','2023-11-01 00:00:00','2023-11-19 00:00:00','DONE',0),(207,12,7,'Upgrade server hardware','2024-09-18','2024-03-19 00:00:00',NULL,'IN_PROGRESS',0),(208,42,15,'Refactor database schema','2024-04-11','2024-03-15 00:00:00','2024-04-25 00:00:00','DONE',0),(209,36,6,'Design user interface for mobile app','2024-08-29','2024-02-15 00:00:00',NULL,'IN_PROGRESS',0),(210,10,7,'Migrate to microservices architecture','2024-08-14','2024-02-05 00:00:00',NULL,'IN_PROGRESS',0),(211,21,4,'Enhance cybersecurity measures','2024-04-02','2024-03-23 00:00:00','2024-04-07 00:00:00','DONE',1),(212,46,9,'Optimize network throughput','2024-04-25','2024-03-26 00:00:00','2024-05-06 00:00:00','DONE',0),(213,31,18,'Set up continuous integration','2024-07-10','2024-02-29 00:00:00',NULL,'IN_PROGRESS',1),(214,21,15,'Migrate to microservices architecture','2024-10-16','2023-12-26 00:00:00',NULL,'IN_PROGRESS',0),(215,8,16,'Enhance cybersecurity measures','2023-11-10','2023-10-15 00:00:00','2023-11-22 00:00:00','DONE',0),(216,13,3,'Optimize network throughput','2024-06-23','2023-11-21 00:00:00',NULL,'IN_PROGRESS',0),(217,39,12,'Migrate to microservices architecture','2023-11-03','2023-10-20 00:00:00','2023-11-04 00:00:00','DONE',1),(218,36,6,'Create user documentation','2024-10-11','2024-02-18 00:00:00',NULL,'IN_PROGRESS',0),(219,33,17,'Implement OAuth2 authentication','2024-06-14','2024-03-09 00:00:00',NULL,'IN_PROGRESS',0),(220,13,5,'Upgrade server hardware','2024-04-23','2024-04-02 00:00:00','2024-05-03 00:00:00','DONE',0),(221,25,10,'Enhance cybersecurity measures','2024-05-08','2024-01-20 00:00:00',NULL,'IN_PROGRESS',0),(222,7,4,'Enhance cybersecurity measures','2024-02-15','2024-02-03 00:00:00','2024-02-19 00:00:00','DONE',0),(223,41,3,'Create user documentation','2024-02-17','2024-01-28 00:00:00','2024-02-24 00:00:00','DONE',1),(224,28,12,'Migrate to microservices architecture','2024-04-20','2024-04-02 00:00:00','2024-04-29 00:00:00','DONE',1),(225,7,17,'Upgrade server hardware','2024-01-18','2024-01-11 00:00:00','2024-01-25 00:00:00','DONE',0),(226,50,12,'Migrate to microservices architecture','2024-08-29','2024-01-21 00:00:00',NULL,'IN_PROGRESS',1),(227,39,16,'Optimize network throughput','2024-09-17','2023-10-31 00:00:00',NULL,'IN_PROGRESS',0);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items_tags`
--

DROP TABLE IF EXISTS `items_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items_tags` (
  `item_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`item_id`,`tag_id`),
  KEY `fk_items_tags_tag_id` (`tag_id`),
  CONSTRAINT `fk_items_tags_item_id` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  CONSTRAINT `fk_items_tags_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items_tags`
--

LOCK TABLES `items_tags` WRITE;
/*!40000 ALTER TABLE `items_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `items_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prizes`
--

DROP TABLE IF EXISTS `prizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prizes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_prizes_name` (`name`),
  CONSTRAINT `prizes_name_valid` CHECK (trim(`name`) <> '')
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prizes`
--

LOCK TABLES `prizes` WRITE;
/*!40000 ALTER TABLE `prizes` DISABLE KEYS */;
INSERT INTO `prizes` VALUES (1,'Wine - White, Schroder And Schyl',90),(2,'Instant Coffee',85),(3,'Soup Bowl Clear 8oz92008',72),(4,'Oyster - In Shell',90),(5,'Muffin - Carrot Individual Wrap',64),(6,'Crackers - Graham',91),(7,'Icecream Bar - Del Monte',72),(8,'Bagelers',8),(9,'Black Currants',72),(10,'Pail For Lid 1537',69),(11,'Cake - Dulce De Leche',56),(12,'Persimmons',19),(13,'Pasta - Fettuccine, Egg, Fresh',62),(14,'Mikes Hard Lemonade',57),(15,'Beer - Fruli',86),(16,'Tomatoes - Diced, Canned',26),(17,'Soup - Tomato Mush. Florentine',1),(18,'Coffee - 10oz Cup 92961',68),(19,'Table Cloth 62x120 White',53),(20,'Compound - Rum',26);
/*!40000 ALTER TABLE `prizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `status` enum('NOT_STARTED','IN_PROGRESS','DONE','CANCELED','DEACTIVATED') NOT NULL DEFAULT 'NOT_STARTED',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_projects_name` (`name`),
  KEY `fk_projects_parent_id` (`parent_id`),
  CONSTRAINT `fk_projects_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `projects` (`id`),
  CONSTRAINT `projects_name_valid` CHECK (trim(`name`) <> ''),
  CONSTRAINT `projects_description_valid` CHECK (trim(`description`) <> '')
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,NULL,'Orion Network Optimization','Developing a network enhancement tool for optimizing data traffic and reducing latency across distributed systems.','IN_PROGRESS'),(2,NULL,'Quantum Data Analysis','Implementing quantum computing techniques to solve complex data analysis problems more efficiently than classical computing allows.','IN_PROGRESS'),(3,NULL,'Cloud Migration Suite','Provides a comprehensive solution for migrating various workloads to cloud environments with minimal downtime and continuous integration support.','IN_PROGRESS'),(4,NULL,'Blockchain Ledger System','Creating a secure, scalable blockchain-based ledger system to provide immutable transaction records for financial institutions.','IN_PROGRESS'),(5,NULL,'AI Customer Support','Utilizing artificial intelligence to automate customer support, enabling real-time responses and increasing overall customer satisfaction.','IN_PROGRESS'),(6,NULL,'Cybersecurity Threat Detection','Developing advanced machine learning models to detect and respond to cybersecurity threats in real time.','IN_PROGRESS'),(7,NULL,'Mobile App Deployment Platform','Enables businesses to build, test, and deploy mobile applications quickly across multiple platforms with a focus on user experience and performance.','IN_PROGRESS'),(8,2,'Quantum Algorithm Development','Focuses on the creation and optimization of quantum algorithms that enhance data processing speeds and accuracy, pushing the boundaries of current quantum computing capabilities.','IN_PROGRESS'),(9,2,'Quantum Computing Security','Aims to develop robust security protocols specifically for quantum computing environments to safeguard sensitive data against quantum and classical threats.','IN_PROGRESS'),(10,4,'Hybrid Cloud Integration','Design and implement solutions for integrating hybrid cloud environments, focusing on seamless connectivity between on-premises infrastructure and cloud services.','IN_PROGRESS'),(11,4,'Cloud Data Compliance','Ensures that all data migration strategies adhere to global compliance standards, including GDPR and HIPAA, to safeguard data integrity and privacy.','IN_PROGRESS'),(12,4,'Cloud Automation Tools','Develop automation tools to streamline the migration process, reduce manual tasks and minimize the potential for human error.','IN_PROGRESS'),(13,4,'Performance Optimization','Optimize cloud configurations to ensure high performance and cost efficiency, analyzing resource usage and adjusting provisioning as necessary.','IN_PROGRESS'),(14,5,'Chatbot Development','Develop AI-powered chatbots designed to handle customer inquiries automatically, providing responses based on natural language processing and machine learning.','IN_PROGRESS'),(15,5,'Voice Recognition Integration','Integrate advanced voice recognition capabilities into customer support systems to allow voice-driven interactions, improving accessibility and user experience.','IN_PROGRESS'),(16,5,'Predictive Customer Analytics','Utilize AI to analyze customer data and predict future support needs, enabling proactive support and personalized customer service strategies.','IN_PROGRESS'),(17,16,'Behavioral Pattern Recognition','Develop algorithms to identify and analyze behavioral patterns in customer interactions, enabling more accurate predictions of customer needs and behaviors.','IN_PROGRESS'),(18,16,'Customer Sentiment Analysis','Implement sentiment analysis tools to gauge customer emotions from textual feedback, enhancing the responsiveness and personalization of support services.','IN_PROGRESS'),(19,16,'Analytics Dashboard Development','Create a comprehensive analytics dashboard that provides real-time insights into customer behavior and support performance metrics.','IN_PROGRESS');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_tags_name` (`name`),
  CONSTRAINT `tags_name_valid` CHECK (trim(`name`) <> '')
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (6,'Basic Industries'),(5,'Consumer Services'),(1,'Finance'),(2,'Health Care'),(3,'Miscellaneous'),(4,'Technology');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `password` varchar(500) NOT NULL,
  `name` varchar(750) NOT NULL,
  `blocked` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_users_email` (`email`),
  CONSTRAINT `users_name_not_empty` CHECK (trim(`name`) <> ''),
  CONSTRAINT `users_password_valid` CHECK (octet_length(`password`) >= 5),
  CONSTRAINT `users_email_valid` CHECK (`email` regexp '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}$')
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'kvoase0@indiegogo.com','cR0\"7U8*u%j','Kittie Voase',0,'2024-03-22 00:00:00'),(2,'ylawty1@flickr.com','xJ5*H34m','Yul Lawty',0,'2023-06-02 00:00:00'),(3,'jaxleby2@scientificamerican.com','xJ0=K3>O','Joey Axleby',0,'2023-06-04 00:00:00'),(4,'mfransoni3@rediff.com','pP4{ccA','Moll Fransoni',0,'2024-01-05 00:00:00'),(5,'mpiddick4@example.com','xW3*Yg~tp`Ds','Moe Piddick',0,'2024-02-24 00:00:00'),(6,'bwarters5@yellowpages.com','xE8,nO>VjPk5','Brenda Warters',0,'2023-12-23 00:00:00'),(7,'sgallgher6@facebook.com','cL6>Kr\'Tg6Zv','Sancho Gallgher',0,'2024-02-22 00:00:00'),(8,'kstonner7@mlb.com','tZ4}NI','Krisha Stonner',0,'2023-02-14 00:00:00'),(9,'dseale8@loc.gov','vU8*k$xcc','Devondra Seale',1,'2023-05-06 00:00:00'),(10,'ijephson9@sakura.ne.jp','dT4!|\"QC','Ivan Jephson',0,'2024-01-18 00:00:00'),(11,'jderlea@hc360.com','yU9}!#r=c5','Janet Derle',0,'2024-01-09 00:00:00'),(12,'fsellimanb@apache.org','hT3/>G*z','Fayette Selliman',0,'2023-12-10 00:00:00'),(13,'imistryc@gov.uk','rO4#TTrgg@','Irene Mistry',0,'2023-01-15 00:00:00'),(14,'jfalkinderd@ebay.com','lH8$a/f@','Jackqueline Falkinder',0,'2023-08-29 00:00:00'),(15,'gbinnse@phoca.cz','nD8#Zxm','Gerhardt Binns',0,'2023-06-06 00:00:00'),(16,'mcontif@free.fr','xM0_6H\'50','Margi Conti',0,'2023-08-14 00:00:00'),(17,'lkieferg@google.com.au','cT1.lgXAS','Leo Kiefer',1,'2024-02-04 00:00:00'),(18,'ngoldieh@ed.gov','tC8*{7e\'+J_','Nani Goldie',0,'2023-07-31 00:00:00'),(19,'tcollini@tripadvisor.com','aA7=P_JT1','Tildy Collin',0,'2023-02-27 00:00:00'),(20,'gpitonej@bbb.org','pG0*,WYD1','Goldarina Pitone',0,'2023-11-10 00:00:00'),(21,'bmilesk@reference.com','fK6#L/','Bari Miles',0,'2023-01-02 00:00:00'),(22,'jrippinl@google.it','wG2`4d','Julita Rippin',1,'2023-06-14 00:00:00'),(23,'cgrewcockm@feedburner.com','vZ9+BI}2e?O','Corrie Grewcock',0,'2023-11-15 00:00:00'),(24,'hfebvren@nasa.gov','tM9%}q','Horacio Febvre',0,'2023-07-12 00:00:00'),(25,'anestero@php.net','hR6(`B','Astrix Nester',0,'2022-12-22 00:00:00'),(26,'adurberp@newyorker.com','bP9#t\"<','Adham Durber',0,'2024-01-01 00:00:00'),(27,'coreaganq@istockphoto.com','aU4@iMXY{3!O','Celestyna O\'Reagan',0,'2023-06-13 00:00:00'),(28,'fmarqueser@intel.com','nM4_thA2','Filia Marquese',0,'2024-03-06 00:00:00'),(29,'sspellissys@xing.com','mH8#ljU','Selby Spellissy',0,'2023-06-13 00:00:00'),(30,'mdaymondt@cbslocal.com','fR1=%a%2\'','Mart Daymond',0,'2023-12-11 00:00:00'),(31,'dmcquorkelu@wikia.com','tD6{w|vJQw','Darda McQuorkel',0,'2023-12-18 00:00:00'),(32,'labbisonv@simplemachines.org','xV3~`+uyy?J','Leontyne Abbison',0,'2023-05-18 00:00:00'),(33,'swhelanw@technorati.com','mA5.GV','Sandi Whelan',1,'2023-04-25 00:00:00'),(34,'smaccaheex@free.fr','tV9<`hU','Skylar MacCahee',0,'2024-01-19 00:00:00'),(35,'fmityushiny@pen.io','vT4~B\'T}&_(','Fallon Mityushin',0,'2022-12-06 00:00:00'),(36,'rchesneyz@usda.gov','oE6@hM(0M7{G','Raffarty Chesney',0,'2023-11-06 00:00:00'),(37,'nidale10@ezinearticles.com','eG5\'A/FB','Nona Idale',0,'2023-05-03 00:00:00'),(38,'rmanilo11@amazzon.de','cT3.U)8omcrb','Raye Manilo',0,'2023-02-11 00:00:00'),(39,'tcampelli12@purevolume.com','gS9_e?3S7S','Tiffie Campelli',0,'2023-10-16 00:00:00'),(40,'pwelden13@miitbeian.gov.cn','zM6\'Y@=#!M_','Prescott Welden',0,'2023-02-23 00:00:00'),(41,'jorcott14@usa.gov','kJ9.6)','Junie Orcott',0,'2023-01-28 00:00:00'),(42,'plambdin15@weather.com','sZ5>%\")','Pamelina Lambdin',0,'2023-07-23 00:00:00'),(43,'tbeeching16@google.it','kP8.XyUL3	E','Tiffany Beeching',0,'2024-04-28 00:00:00'),(44,'fbeidebeke17@nba.com','dL2!wwzl$9','Fairlie Beidebeke',0,'2024-01-27 00:00:00'),(45,'bsommerland18@dot.gov','nE7)}F{{!Fr','Brittne Sommerland',0,'2023-03-07 00:00:00'),(46,'badrian19@comsenz.com','gD3(q7g#tbzr','Barbette Adrian',0,'2023-02-06 00:00:00'),(47,'kpaffitt1a@about.me','xE7*fW','Kory Paffitt',0,'2023-08-07 00:00:00'),(48,'dissard1b@deliciousdays.com','wM4+G5)\'yqc','Demetre Issard',0,'2023-09-09 00:00:00'),(49,'bjeacock1c@abc.net.au','dF0\"dW','Birgit Jeacock',0,'2023-02-20 00:00:00'),(50,'lmouncher1d@answers.com','bE8/hbj({l`','Lorrin Mouncher',0,'2023-07-31 00:00:00');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `winners`
--

DROP TABLE IF EXISTS `winners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `winners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `prize_id` int(11) NOT NULL,
  `awarded_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_winners_user_id` (`user_id`),
  KEY `fk_winners_prize_id` (`prize_id`),
  CONSTRAINT `fk_winners_prize_id` FOREIGN KEY (`prize_id`) REFERENCES `prizes` (`id`),
  CONSTRAINT `fk_winners_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `winners`
--

LOCK TABLES `winners` WRITE;
/*!40000 ALTER TABLE `winners` DISABLE KEYS */;
INSERT INTO `winners` VALUES (1,37,20,'2024-03-15'),(2,12,5,'2024-04-26'),(3,23,1,'2024-02-17'),(4,45,13,'2024-04-09'),(5,9,7,'2024-02-01'),(6,14,18,'2024-05-21'),(7,22,11,'2024-05-15'),(8,6,8,'2024-03-20'),(9,30,14,'2024-04-18');
/*!40000 ALTER TABLE `winners` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-28 17:19:22
