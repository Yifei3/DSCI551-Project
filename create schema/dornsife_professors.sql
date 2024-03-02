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
INSERT INTO `professors` VALUES (16,'Elizabeth Brown','female','elizabeth.brown29@university.edu',2,101813.60),(17,'Elizabeth Davis','female','elizabeth.davis16@university.edu',2,126486.84),(18,'Sarah Miller','male','sarah.miller21@university.edu',2,98635.66),(19,'Linda Martinez','female','linda.martinez30@university.edu',2,54279.54),(20,'James Davis','female','james.davis18@university.edu',2,65676.23),(21,'Charles Wilson','female','charles.wilson28@university.edu',2,83459.88),(22,'James Thomas','male','james.thomas26@university.edu',2,78900.05),(23,'Jennifer Miller','female','jennifer.miller27@university.edu',2,93622.21),(24,'Jessica Lopez','female','jessica.lopez21@university.edu',2,104534.88),(25,'Jennifer Garcia','male','jennifer.garcia26@university.edu',2,93770.82),(26,'Charles Gonzalez','male','charles.gonzalez23@university.edu',2,126314.32),(27,'William Jackson','female','william.jackson28@university.edu',2,80768.13),(28,'William Miller','male','william.miller27@university.edu',2,134269.98),(29,'William Williams','female','william.williams26@university.edu',2,119899.89),(30,'Richard Jones','male','richard.jones21@university.edu',2,69596.02);
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
