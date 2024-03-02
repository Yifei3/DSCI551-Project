CREATE DATABASE  IF NOT EXISTS `viterbi` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `viterbi`;
-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (x86_64)
--
-- Host: 127.0.0.1    Database: viterbi
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
-- Table structure for table `professors`
--

DROP TABLE IF EXISTS `professors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professors` (
  `professor_id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `department_id` int NOT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`professor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professors`
--

LOCK TABLES `professors` WRITE;
/*!40000 ALTER TABLE `professors` DISABLE KEYS */;
INSERT INTO `professors` VALUES (1,'James Brown','female','james.brown16@university.edu',1,86991.23),(2,'Michael Moore','female','michael.moore24@university.edu',1,108867.19),(3,'Barbara Davis','male','barbara.davis22@university.edu',1,72632.97),(4,'Jennifer Garcia','male','jennifer.garcia2@university.edu',1,130153.24),(5,'Joseph Wilson','male','joseph.wilson1@university.edu',1,74611.57),(6,'Elizabeth Thomas','female','elizabeth.thomas18@university.edu',1,67038.53),(7,'Elizabeth Miller','female','elizabeth.miller34@university.edu',1,84727.16),(8,'Elizabeth Wilson','female','elizabeth.wilson10@university.edu',1,105676.70),(9,'Sarah Hernandez','male','sarah.hernandez9@university.edu',1,65362.45),(10,'Robert Hernandez','female','robert.hernandez48@university.edu',1,139292.15),(11,'William Davis','female','william.davis10@university.edu',1,79531.83),(12,'Joseph Lopez','male','joseph.lopez44@university.edu',1,53595.61),(13,'Jessica Jackson','female','jessica.jackson41@university.edu',1,92655.58),(14,'Linda Jones','male','linda.jones42@university.edu',1,120841.07),(15,'Sarah Williams','male','sarah.williams31@university.edu',1,92871.98);
/*!40000 ALTER TABLE `professors` ENABLE KEYS */;
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
