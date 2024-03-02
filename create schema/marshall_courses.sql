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
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `course_id` varchar(50) NOT NULL,
  `prof_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `department_id` int NOT NULL,
  `schedule_time` varchar(50) NOT NULL,
  `seat_available` int NOT NULL,
  `description` text,
  PRIMARY KEY (`course_id`),
  KEY `prof_id` (`prof_id`),
  CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`prof_id`) REFERENCES `professors` (`professor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES ('ACCT101',32,'Accounting Basics',3,'Tuesday 10:00',15,'Introduction to basic accounting principles.'),('BUS101',35,'Business Law',3,'Monday 15:00',14,'Overview of legal concepts in business.'),('ECON150',45,'Macroeconomics',3,'Monday 11:00',15,'Introduction to macroeconomic principles.'),('ENTR100',41,'Entrepreneurship',3,'Thursday 16:00',13,'Exploring the basics of starting a business.'),('FIN200',38,'Finance Essentials',3,'Friday 9:00',16,'Essentials of finance for beginners.'),('HRM150',31,'Human Resources Management',3,'Monday 11:00',23,'Introduction to HRM principles and practices.'),('INTB200',44,'International Business',3,'Monday 15:00',10,'Fundamentals of business operations across borders.'),('MGMT101',41,'Principles of Management',3,'Wednesday 9:00',13,'Foundational management concepts and theories.'),('MKT100',31,'Marketing Fundamentals',3,'Wednesday 9:00',10,'Overview of fundamental marketing concepts.'),('STAT101',38,'Statistics for Business',3,'Friday 8:00',27,'Basic statistical concepts in a business context.');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
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
