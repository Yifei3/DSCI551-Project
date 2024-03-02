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
INSERT INTO `professors` VALUES (31,'Thomas Williams','female','thomas.williams32@university.edu',3,145041.03),(32,'James Davis','female','james.davis41@university.edu',3,138876.33),(33,'Joseph Miller','female','joseph.miller42@university.edu',3,143634.39),(34,'Thomas Rodriguez','male','thomas.rodriguez38@university.edu',3,129806.67),(35,'Richard Garcia','male','richard.garcia45@university.edu',3,135721.27),(36,'Charles Williams','female','charles.williams40@university.edu',3,143248.80),(37,'Jessica Smith','male','jessica.smith42@university.edu',3,100998.73),(38,'Elizabeth Martin','female','elizabeth.martin36@university.edu',3,109670.17),(39,'Jennifer Martinez','male','jennifer.martinez36@university.edu',3,104541.23),(40,'Elizabeth Garcia','female','elizabeth.garcia43@university.edu',3,54847.24),(41,'Mary Anderson','male','mary.anderson31@university.edu',3,131672.31),(42,'Charles Davis','female','charles.davis45@university.edu',3,50869.24),(43,'William Lopez','female','william.lopez38@university.edu',3,147932.37),(44,'David Johnson','male','david.johnson31@university.edu',3,82641.16),(45,'Richard Miller','male','richard.miller43@university.edu',3,84696.61);
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
