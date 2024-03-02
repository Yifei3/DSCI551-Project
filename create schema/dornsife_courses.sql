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
INSERT INTO `courses` VALUES ('ART150',18,'Art History',2,'Thursday 18:00',10,'Introduction to Art History'),('BIOL101',26,'Cell Biology',2,'Friday 8:00',26,'Introduction to Cell Biology'),('CHEM200',27,'Organic Chemistry',2,'Friday 18:00',19,'Introduction to Organic Chemistry'),('ECON102',17,'Microeconomics',2,'Friday 10:00',28,'Introduction to Microeconomics'),('ENGL123',25,'Literature',2,'Friday 13:00',28,'Introduction to Literature'),('HIST201',17,'World History',2,'Wednesday 18:00',20,'Introduction to World History'),('MATH150',17,'Calculus',2,'Wednesday 11:00',30,'Introduction to Calculus'),('PHYS101',16,'Mechanics',2,'Monday 11:00',20,'Introduction to Mechanics'),('PSYC100',27,'Psychology',2,'Monday 16:00',25,'Introduction to Psychology'),('SOC101',27,'Sociology',2,'Tuesday 13:00',29,'Introduction to Sociology');
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
