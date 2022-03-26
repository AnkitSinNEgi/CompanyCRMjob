-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: localhost    Database: karyashaladb
-- ------------------------------------------------------
-- Server version	8.0.28-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job` (
  `job_id` int NOT NULL AUTO_INCREMENT,
  `job_user_email` varchar(255) NOT NULL,
  `job_role_id` int NOT NULL,
  `job_description` text NOT NULL,
  `job_address` text NOT NULL,
  `job_contact` varchar(16) NOT NULL,
  PRIMARY KEY (`job_id`),
  KEY `job_role_id` (`job_role_id`),
  KEY `job_user_email` (`job_user_email`),
  CONSTRAINT `job_ibfk_1` FOREIGN KEY (`job_role_id`) REFERENCES `jobrole` (`job_role_id`),
  CONSTRAINT `job_ibfk_2` FOREIGN KEY (`job_user_email`) REFERENCES `user` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (1,'ankit@company.com',5,'Lorem ipsum about fswb','34, ddn','9898989898'),(2,'ankit@company.com',2,'Description about this job','26, delhi','99887744');
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobrole`
--

DROP TABLE IF EXISTS `jobrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobrole` (
  `job_role_id` int NOT NULL AUTO_INCREMENT,
  `job_role_name` varchar(100) NOT NULL,
  PRIMARY KEY (`job_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobrole`
--

LOCK TABLES `jobrole` WRITE;
/*!40000 ALTER TABLE `jobrole` DISABLE KEYS */;
INSERT INTO `jobrole` VALUES (1,'Business Development'),(2,'HR Assistant'),(3,'Software Developer'),(4,'React Developer'),(5,'Full Stack Web Developer');
/*!40000 ALTER TABLE `jobrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobrole_to_jobseeker`
--

DROP TABLE IF EXISTS `jobrole_to_jobseeker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobrole_to_jobseeker` (
  `job_role_id` int NOT NULL,
  `job_seeker_id` int NOT NULL,
  KEY `job_role_id` (`job_role_id`),
  KEY `job_seeker_id` (`job_seeker_id`),
  CONSTRAINT `jobrole_to_jobseeker_ibfk_1` FOREIGN KEY (`job_role_id`) REFERENCES `jobrole` (`job_role_id`),
  CONSTRAINT `jobrole_to_jobseeker_ibfk_2` FOREIGN KEY (`job_seeker_id`) REFERENCES `jobseeker` (`job_seeker_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobrole_to_jobseeker`
--

LOCK TABLES `jobrole_to_jobseeker` WRITE;
/*!40000 ALTER TABLE `jobrole_to_jobseeker` DISABLE KEYS */;
INSERT INTO `jobrole_to_jobseeker` VALUES (1,1),(1,2),(2,1),(2,4),(3,3),(5,2),(5,3),(5,4);
/*!40000 ALTER TABLE `jobrole_to_jobseeker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobseeker`
--

DROP TABLE IF EXISTS `jobseeker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobseeker` (
  `job_seeker_id` int NOT NULL AUTO_INCREMENT,
  `job_seeker_name` varchar(100) NOT NULL,
  `job_seeker_email` varchar(255) NOT NULL,
  PRIMARY KEY (`job_seeker_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobseeker`
--

LOCK TABLES `jobseeker` WRITE;
/*!40000 ALTER TABLE `jobseeker` DISABLE KEYS */;
INSERT INTO `jobseeker` VALUES (1,'Ankit Negi','ankit@mail.com'),(2,'Mohan Rawat','mohan@mail.com'),(3,'Andres','andres@mail.com'),(4,'Smith','smith@mail.com');
/*!40000 ALTER TABLE `jobseeker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('Ankit Negi','ankit@company.com','a70ca1454267d4e4fc0bf2f130ba1a74');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-26 17:19:56
