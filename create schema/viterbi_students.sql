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
INSERT INTO `students` VALUES (1,'Thomas Taylor','female','thomas297@gmail.com',1,2.09),(2,'Joseph Wilson','male','joseph208@gmail.com',1,2.10),(3,'Mary Brown','male','mary220@gmail.com',1,2.53),(4,'Elizabeth Williams','female','elizabeth204@gmail.com',1,2.11),(5,'Sarah Rodriguez','male','sarah233@gmail.com',1,4.00),(6,'Michael Moore','male','michael282@gmail.com',1,2.61),(7,'Richard Martin','female','richard248@gmail.com',1,2.93),(8,'Michael Moore','male','michael204@gmail.com',1,2.84),(9,'Jennifer Hernandez','female','jennifer285@gmail.com',1,3.60),(10,'William Smith','male','william272@gmail.com',1,3.67),(11,'Susan Martin','female','susan300@gmail.com',1,3.18),(12,'William Hernandez','female','william262@gmail.com',1,3.01),(13,'Richard Hernandez','female','richard249@gmail.com',1,3.27),(14,'Robert Wilson','male','robert257@gmail.com',1,3.07),(15,'John Rodriguez','female','john236@gmail.com',1,2.53),(16,'Robert Moore','female','robert253@gmail.com',1,3.26),(17,'John Williams','female','john281@gmail.com',1,3.09),(18,'Jennifer Smith','female','jennifer267@gmail.com',1,2.33),(19,'William Smith','female','william269@gmail.com',1,3.15),(20,'William Garcia','male','william223@gmail.com',1,3.70),(21,'Patricia Wilson','female','patricia273@gmail.com',1,2.91),(22,'Barbara Gonzalez','male','barbara213@gmail.com',1,3.30),(23,'Jessica Johnson','female','jessica216@gmail.com',1,2.43),(24,'Barbara Wilson','male','barbara213@gmail.com',1,3.30),(25,'Thomas Taylor','male','thomas249@gmail.com',1,2.13),(26,'Charles Martinez','female','charles247@gmail.com',1,2.38),(27,'Susan Wilson','male','susan250@gmail.com',1,2.50),(28,'David Hernandez','female','david239@gmail.com',1,2.51),(29,'Thomas Jackson','female','thomas268@gmail.com',1,3.51),(30,'Thomas Brown','male','thomas279@gmail.com',1,2.60),(31,'James Wilson','female','james281@gmail.com',1,3.42),(32,'Jennifer Wilson','male','jennifer240@gmail.com',1,3.08),(33,'William Brown','female','william211@gmail.com',1,2.51),(34,'Patricia Martin','male','patricia296@gmail.com',1,3.78),(35,'James Davis','female','james248@gmail.com',1,3.35),(36,'Joseph Johnson','female','joseph290@gmail.com',1,2.79),(37,'William Rodriguez','female','william257@gmail.com',1,2.10),(38,'Sarah Jackson','male','sarah288@gmail.com',1,3.57),(39,'Susan Rodriguez','male','susan217@gmail.com',1,2.11),(40,'Jennifer Rodriguez','female','jennifer272@gmail.com',1,3.73),(41,'Elizabeth Williams','male','elizabeth291@gmail.com',1,2.66),(42,'Jessica Miller','female','jessica216@gmail.com',1,2.43),(43,'Jessica Taylor','female','jessica241@gmail.com',1,2.10),(44,'Jennifer Wilson','female','jennifer246@gmail.com',1,2.20),(45,'James Wilson','male','james281@gmail.com',1,3.42),(46,'Susan Johnson','male','susan262@gmail.com',1,3.06),(47,'David Jones','male','david166@gmail.com',1,2.91),(48,'Karen Garcia','male','karen200@gmail.com',1,2.96),(49,'Robert Davis','female','robert138@gmail.com',1,2.90),(50,'Joseph Williams','male','joseph147@gmail.com',1,3.63);
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
