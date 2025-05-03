-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: studentdb
-- ------------------------------------------------------
-- Server version	8.0.42

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
  `student_name` varchar(100) NOT NULL,
  `programme` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`student_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES ('Amina Johnson','Software Engineering'),('Chausiku Evans','Computer Science'),('Ethan Garcia','Software Engineering'),('Fatuma Brown','Information Technology'),('Fiona Mpoki','Infoormation Technology'),('George Russsel','Software Engineering'),('Hussein Davis','Software Engineering'),('Jane Smith','Computer Science'),('John Doe','Software Engineering'),('Lewis Hamilton','Computer Science');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjects` (
  `name` varchar(100) NOT NULL,
  `year` int DEFAULT NULL,
  `program` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES ('Advanced Java',3,'Software Engineering'),('Artificial Intelligence',4,'Software Engineering'),('Big Data Analysis',4,'Software Engineering'),('Calculus',1,'Software Engineering'),('Communication Skills',1,'Software Engineering'),('Computer Architecture',2,'Software Engineering'),('Computer Graphics',3,'Software Engineering'),('Computer Maintenance',4,'Software Engineering'),('Computer Networking protocols',2,'Software Engineering'),('Data Mining',3,'Software Engineering'),('Data Structures',2,'Software Engineering'),('Database Systems',2,'Software Engineering'),('Development Studies',1,'Software Engineering'),('Discrete Mathematics',1,'Software Engineering'),('Distributed Database',3,'Software Engineering'),('Distributed Systems',4,'Software Engineering'),('Human Computer Interactions',4,'Software Engineering'),('ICT Research',2,'Software Engineering'),('Internet Programming',3,'Software Engineering'),('Introcduction to IT',1,'Software Engineering'),('Introduction to Programming',1,'Software Engineering'),('Linear Algebra',1,'Software Engineering'),('Mathematical Foundations of IT Security',1,'Software Engineering'),('Mobile Apps',3,'Software Engineering'),('Open Source technologies',2,'Software Engineering'),('Operating Systems',2,'Software Engineering'),('Project Management',4,'Software Engineering'),('Selected topics in Software Engineering',3,'Software Engineering'),('Software Deployment and Management',4,'Software Engineering'),('System Design and Analysis',2,'Software Engineering');
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-03 16:18:31
