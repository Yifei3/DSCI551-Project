CREATE DATABASE  IF NOT EXISTS `marshall` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `marshall`;
-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (x86_64)
--
-- Host: 127.0.0.1    Database: marshall
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
INSERT INTO `students` VALUES (101,'Richard Wilson','female','richardwilson114@university.edu',3,3.74),(102,'Barbara Hernandez','female','barbarahernandez128@university.edu',3,2.76),(103,'Mary Lopez','female','marylopez125@university.edu',3,3.18),(104,'Jennifer Taylor','male','jennifertaylor102@university.edu',3,2.42),(105,'David Thomas','female','davidthomas112@university.edu',3,2.72),(106,'John Brown','female','johnbrown126@university.edu',3,2.98),(107,'Sarah Davis','female','sarahdavis124@university.edu',3,3.63),(108,'Robert Miller','female','robertmiller113@university.edu',3,2.80),(109,'John Johnson','male','johnjohnson110@university.edu',3,3.60),(110,'Linda Johnson','male','lindajohnson112@university.edu',3,2.75),(111,'Jessica Lopez','female','jessicalopez146@university.edu',3,3.91),(112,'Thomas Taylor','male','thomastaylor109@university.edu',3,2.12),(113,'Charles Lopez','male','charleslopez116@university.edu',3,3.63),(114,'Jennifer Jones','male','jenniferjones150@university.edu',3,3.18),(115,'Michael Miller','male','michaelmiller145@university.edu',3,3.90),(116,'Jennifer Moore','female','jennifermoore127@university.edu',3,2.62),(117,'Michael Brown','male','michaelbrown117@university.edu',3,2.36),(118,'Robert Martin','female','robertmartin124@university.edu',3,2.95),(119,'Joseph Smith','female','josephsmith108@university.edu',3,2.76),(120,'Thomas Gonzalez','female','thomasgonzalez103@university.edu',3,3.02),(121,'Linda Anderson','male','lindaanderson115@university.edu',3,3.15),(122,'Patricia Johnson','male','patriciajohnson105@university.edu',3,3.50),(123,'Elizabeth Taylor','male','elizabethtaylor118@university.edu',3,2.84),(124,'James Davis','male','jamesdavis119@university.edu',3,3.22),(125,'William Smith','female','williamsmith123@university.edu',3,3.08),(126,'Sarah Wilson','male','sarahwilson107@university.edu',3,2.67),(127,'James Johnson','male','jamesjohnson108@university.edu',3,2.88),(128,'Jennifer Wilson','female','jenniferwilson121@university.edu',3,3.45),(129,'Joseph Martinez','male','josephmartinez106@university.edu',3,2.93),(130,'Susan Davis','female','susandavis103@university.edu',3,3.16),(131,'James Lopez','male','jameslopez122@university.edu',3,3.04),(132,'John Jones','female','johnjones107@university.edu',3,2.16),(133,'Robert Williams','male','robertwilliams134@university.edu',3,3.79),(134,'Thomas Gonzalez','female','thomasgonzalez138@university.edu',3,2.73),(135,'William Anderson','male','williamanderson142@university.edu',3,2.29),(136,'Richard Martinez','female','richardmartinez124@university.edu',3,3.87),(137,'Jessica Davis','female','jessicadavis132@university.edu',3,3.83),(138,'Karen Brown','female','karenbrown102@university.edu',3,2.59),(139,'Joseph Williams','female','josephwilliams141@university.edu',3,3.77),(140,'William Rodriguez','female','williamrodriguez114@university.edu',3,2.93),(141,'John Miller','female','johnmiller142@university.edu',3,2.15),(142,'Richard Gonzalez','female','richardgonzalez142@university.edu',3,3.75),(143,'Richard Gonzalez','male','richardgonzalez146@university.edu',3,3.96),(144,'James Lopez','male','jameslopez116@university.edu',3,2.60),(145,'Linda Smith','female','lindasmith141@university.edu',3,2.83),(146,'David Thomas','female','davidthomas136@university.edu',3,3.56),(147,'Karen Smith','female','karensmith134@university.edu',3,2.47),(148,'Patricia Anderson','male','patriciaanderson114@university.edu',3,3.35),(149,'Elizabeth Gonzalez','female','elizabethgonzalez106@university.edu',3,2.49),(150,'Susan Jackson','male','susanjackson126@university.edu',3,3.06);
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
