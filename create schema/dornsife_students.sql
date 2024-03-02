CREATE DATABASE  IF NOT EXISTS `dornsife` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dornsife`;
-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (x86_64)
--
-- Host: 127.0.0.1    Database: dornsife
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `student_id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `department_id` int NOT NULL,
  `gpa` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (51,'William Miller','male','williammiller57@university.edu',2,3.54),(52,'Karen Jackson','female','karenjackson100@university.edu',2,3.94),(53,'James Rodriguez','male','jamesrodriguez87@university.edu',2,2.27),(54,'William Jackson','female','williamjackson90@university.edu',2,3.91),(55,'Jessica Jackson','female','jessicajackson78@university.edu',2,2.25),(56,'Robert Williams','male','robertwilliams78@university.edu',2,3.19),(57,'Karen Lopez','female','karenlopez63@university.edu',2,2.86),(58,'Patricia Taylor','female','patriciataylor65@university.edu',2,2.99),(59,'Mary Moore','male','marymoore73@university.edu',2,2.34),(60,'David Davis','male','daviddavis81@university.edu',2,3.47),(61,'Elizabeth Martin','male','elizabethmartin74@university.edu',2,3.45),(62,'Sarah Jackson','male','sarahjackson77@university.edu',2,3.55),(63,'Robert Jackson','male','robertjackson52@university.edu',2,2.72),(64,'Linda Johnson','male','lindajohnson68@university.edu',2,3.63),(65,'Robert Anderson','female','robertanderson70@university.edu',2,3.08),(66,'John Johnson','female','johnjohnson95@university.edu',2,3.25),(67,'Jennifer Miller','female','jennifermiller64@university.edu',2,3.41),(68,'Charles Gonzalez','female','charlesgonzalez67@university.edu',2,2.12),(69,'Michael Brown','male','michaelbrown91@university.edu',2,2.65),(70,'Richard Davis','female','richarddavis82@university.edu',2,3.02),(71,'Susan Wilson','female','susanwilson85@university.edu',2,2.87),(72,'James Smith','male','jamessmith72@university.edu',2,3.12),(73,'Patricia Brown','female','patriciabrown83@university.edu',2,2.98),(74,'Jessica Davis','female','jessicadavis96@university.edu',2,3.45),(75,'Michael Johnson','male','michaeljohnson54@university.edu',2,3.60),(76,'Linda Smith','female','lindasmith59@university.edu',2,2.35),(77,'John Williams','male','johnwilliams71@university.edu',2,3.85),(78,'Jennifer Brown','female','jenniferbrown69@university.edu',2,3.25),(79,'Michael Davis','male','michaeldavis62@university.edu',2,2.95),(80,'Elizabeth Wilson','female','elizabethwilson53@university.edu',2,2.65),(81,'Mary Brown','female','marybrown74@university.edu',2,3.87),(82,'John Jackson','male','johnjackson51@university.edu',2,2.23),(83,'Michael Martin','male','michaelmartin88@university.edu',2,3.34),(84,'Sarah Jones','male','sarahjones59@university.edu',2,2.93),(85,'James Thomas','female','jamesthomas75@university.edu',2,3.70),(86,'Linda Davis','female','lindadavis75@university.edu',2,2.19),(87,'William Davis','male','williamdavis63@university.edu',2,2.04),(88,'William Martinez','male','williammartinez63@university.edu',2,2.31),(89,'Susan Smith','male','susansmith81@university.edu',2,2.35),(90,'Jessica Anderson','male','jessicaanderson88@university.edu',2,3.01),(91,'Susan Martinez','female','susanmartinez98@university.edu',2,2.76),(92,'William Jackson','male','williamjackson59@university.edu',2,3.93),(93,'Michael Smith','male','michaelsmith71@university.edu',2,2.48),(94,'Elizabeth Hernandez','female','elizabethhernandez56@university.edu',2,3.93),(95,'Thomas Brown','female','thomasbrown100@university.edu',2,2.51),(96,'Robert Johnson','male','robertjohnson54@university.edu',2,3.77),(97,'Michael Taylor','female','michaeltaylor73@university.edu',2,3.58),(98,'Thomas Lopez','female','thomaslopez68@university.edu',2,3.33),(99,'Robert Martin','female','robertmartin98@university.edu',2,3.36),(100,'Linda Garcia','female','lindagarcia91@university.edu',2,2.14);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-29 23:41:26
