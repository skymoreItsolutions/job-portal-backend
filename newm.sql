-- MySQL dump 10.13  Distrib 8.3.0, for macos14 (arm64)
--
-- Host: localhost    Database: newjobportal
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
INSERT INTO `cache` VALUES ('laravel_cache_livewire-rate-limiter:a17961fa74e9275d529f489537f179c05d50c2f3','i:1;',1751791673),('laravel_cache_livewire-rate-limiter:a17961fa74e9275d529f489537f179c05d50c2f3:timer','i:1751791673;',1751791673);
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidate_educations`
--

DROP TABLE IF EXISTS `candidate_educations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidate_educations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `candidate_id` bigint unsigned NOT NULL,
  `degree` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `specialization` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `college_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `passing_marks` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pursuing` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `candidate_educations_candidate_id_foreign` (`candidate_id`),
  CONSTRAINT `candidate_educations_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidate_educations`
--

LOCK TABLES `candidate_educations` WRITE;
/*!40000 ALTER TABLE `candidate_educations` DISABLE KEYS */;
INSERT INTO `candidate_educations` VALUES (1,75,'BCA','Computer Applications','Unknown College','75.00',0,NULL,NULL);
/*!40000 ALTER TABLE `candidate_educations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidate_experiences`
--

DROP TABLE IF EXISTS `candidate_experiences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidate_experiences` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `candidate_id` bigint unsigned NOT NULL,
  `job_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `job_roles` json DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `experience_years` int NOT NULL,
  `experience_months` int DEFAULT NULL,
  `current_salary` decimal(10,2) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `candidate_experiences_candidate_id_foreign` (`candidate_id`),
  CONSTRAINT `candidate_experiences_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidate_experiences`
--

LOCK TABLES `candidate_experiences` WRITE;
/*!40000 ALTER TABLE `candidate_experiences` DISABLE KEYS */;
INSERT INTO `candidate_experiences` VALUES (1,75,'Full Stack Developer',NULL,'Future IT Rouch',2,0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `candidate_experiences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidate_languages`
--

DROP TABLE IF EXISTS `candidate_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidate_languages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `candidate_id` bigint unsigned NOT NULL,
  `language_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `candidate_languages_candidate_id_foreign` (`candidate_id`),
  CONSTRAINT `candidate_languages_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidate_languages`
--

LOCK TABLES `candidate_languages` WRITE;
/*!40000 ALTER TABLE `candidate_languages` DISABLE KEYS */;
INSERT INTO `candidate_languages` VALUES (1,75,'English',NULL,NULL),(2,75,'Japanese',NULL,NULL),(3,75,'Gujarati',NULL,NULL),(4,75,'French',NULL,NULL);
/*!40000 ALTER TABLE `candidate_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidate_skills`
--

DROP TABLE IF EXISTS `candidate_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidate_skills` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `candidate_id` bigint unsigned NOT NULL,
  `skill_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `candidate_skills_candidate_id_foreign` (`candidate_id`),
  CONSTRAINT `candidate_skills_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidate_skills`
--

LOCK TABLES `candidate_skills` WRITE;
/*!40000 ALTER TABLE `candidate_skills` DISABLE KEYS */;
INSERT INTO `candidate_skills` VALUES (1,75,'HTML',NULL,NULL),(2,75,'CSS',NULL,NULL),(3,75,'JavaScript',NULL,NULL),(4,75,'PHP',NULL,NULL),(5,75,'Laravel',NULL,NULL),(6,75,'Next.js',NULL,NULL),(7,75,'Nuxt.js',NULL,NULL),(8,75,'AI',NULL,NULL),(9,75,'Python',NULL,NULL),(10,75,'Good Communication',NULL,NULL),(11,75,'Brand Builder',NULL,NULL);
/*!40000 ALTER TABLE `candidate_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidates`
--

DROP TABLE IF EXISTS `candidates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `degree` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `specialization` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `college_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passing_marks` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pursuing` tinyint NOT NULL DEFAULT '0',
  `experience_years` int DEFAULT NULL,
  `experience_months` int DEFAULT NULL,
  `job_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job_roles` json DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_salary` decimal(10,2) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `prefers_night_shift` tinyint NOT NULL DEFAULT '0',
  `prefers_day_shift` tinyint NOT NULL DEFAULT '1',
  `work_from_home` tinyint NOT NULL DEFAULT '0',
  `work_from_office` tinyint NOT NULL DEFAULT '1',
  `field_job` tinyint NOT NULL DEFAULT '0',
  `employment_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preferred_language` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resume` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skills` text COLLATE utf8mb4_unicode_ci,
  `active_user` tinyint NOT NULL DEFAULT '1',
  `last_login` timestamp NULL DEFAULT NULL,
  `total_jobs_applied` int NOT NULL DEFAULT '0',
  `total_job_views` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `otp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp_expires_at` timestamp NULL DEFAULT NULL,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doneprofile` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `candidates_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidates`
--

LOCK TABLES `candidates` WRITE;
/*!40000 ALTER TABLE `candidates` DISABLE KEYS */;
INSERT INTO `candidates` VALUES (1,'Macie Batz','1976-01-13','Male','tyrel.stark@example.net','708 Wehner Bypass Suite 084\nLake Uriahview, OH 12290-5930','South Hayleyberg','Colorado','BCA','Computer Science','Kertzmann, Ritchie and Brekke College','96%',0,5,11,'Budget Analyst','[\"Manager\", \"Tester\", \"Developer\"]','Wilderman Group',40645.76,'1983-05-19',1,0,0,1,0,'Part-Time','English,Punjabi',NULL,'SQL,Laravel,PHP',1,'2025-05-01 09:51:45',9,6,'2025-05-01 09:51:45','2025-05-01 09:51:45',NULL,NULL,NULL,NULL,NULL,0),(2,'Lucious Von','1976-05-04','Female','kboehm@example.net','9467 Alysa Union Suite 808\nGottliebville, SD 63008-9425','Electamouth','Connecticut','B.Tech','Mechanical','Mertz Inc College','91%',0,2,1,'ccc','[\"Designer\"]','Nikolaus Inc',38668.80,'2019-01-03',0,0,1,0,0,'Intern','Punjabi,Hindi',NULL,'Laravel,PHP,SQL',1,'2025-05-01 09:51:45',7,15,'2025-05-01 09:51:45','2025-05-01 09:51:45',NULL,NULL,NULL,NULL,NULL,0),(3,'Tony Fadel','1973-02-05','Male','kelley78@example.com','333 Labadie Locks\nCaramouth, KS 92290-9170','Concepcionmouth','New York','MCA','Computer Science','Tillman, Steuber and Sawayn College','100%',0,1,8,'Nursing Instructor','[\"Manager\", \"Designer\"]','Vandervort, Bailey and Steuber',11077.17,'2019-08-03',1,0,0,1,1,'Part-Time','English,Hindi',NULL,'JavaScript,PHP,SQL',1,'2025-05-01 09:51:45',7,2,'2025-05-01 09:51:45','2025-05-01 09:51:45',NULL,NULL,NULL,NULL,NULL,0),(4,'Keenan Kozey','1974-07-31','Male','lenora.bechtelar@example.net','873 Jerde Isle\nLake Aileen, MS 19486-6602','Kendrickfort','Michigan','BCA','Mechanical','Baumbach, Kertzmann and Lynch College','100%',1,1,8,'Radio Operator','[\"Manager\", \"Designer\", \"Developer\"]','Schneider Group',35782.11,'1991-01-21',1,1,0,1,1,'Full-Time','Hindi,English',NULL,'PHP,Laravel,JavaScript',1,'2025-05-01 09:51:45',8,3,'2025-05-01 09:51:45','2025-05-01 09:51:45',NULL,NULL,NULL,NULL,NULL,0),(5,'Tavares Macejkovic','1981-12-01','Female','beer.jordyn@example.net','13787 Jaskolski Groves\nJakobfort, IL 53257','Lake Randiton','Oregon','MCA','Computer Science','Boyer PLC College','71%',1,4,8,'Announcer','[\"Manager\", \"Designer\", \"Tester\"]','Kling-Friesen',29069.07,'2000-06-26',0,1,1,1,1,'Full-Time','English,Punjabi',NULL,'Laravel,SQL,JavaScript',1,'2025-05-01 09:51:45',7,10,'2025-05-01 09:51:45','2025-05-01 09:51:45',NULL,NULL,NULL,NULL,NULL,0),(6,'Prof. Marlene Bernier PhD','1982-07-31','Other','jbergnaum@example.net','789 Eleanora Mews\nKohlerborough, WI 69294-2536','Virginieton','District of Columbia','MCA','Mechanical','Weissnat, VonRueden and Schiller College','84%',1,0,4,'Cartoonist','[\"Tester\"]','Greenholt-Haag',43439.82,'1977-08-03',0,1,1,0,1,'Full-Time','English,Hindi',NULL,'Laravel,JavaScript,SQL',1,'2025-05-01 09:51:45',1,3,'2025-05-01 09:51:45','2025-05-01 09:51:45',NULL,NULL,NULL,NULL,NULL,0),(7,'Mrs. Gina Fahey IV','1995-11-25','Male','srice@example.net','5013 Sydney Islands Apt. 134\nEast Vellashire, FL 07154','Cristville','Pennsylvania','BCA','Mechanical','Mann Inc College','70%',1,5,10,'Healthcare Practitioner','[\"Tester\", \"Designer\", \"Manager\"]','Hackett, Beatty and Ondricka',28610.64,'2014-03-25',0,0,1,0,0,'Full-Time','Hindi,English',NULL,'SQL,JavaScript,React',1,'2025-05-01 09:51:45',2,2,'2025-05-01 09:51:45','2025-05-01 09:51:45',NULL,NULL,NULL,NULL,NULL,0),(8,'Prof. Kristian Dooley','1977-06-04','Female','will.maryse@example.net','9704 Green Valleys Apt. 713\nNorth Isai, OK 79211','West Angelita','Texas','MCA','Mechanical','Zemlak Inc College','95%',1,2,2,'Accountant','[\"Manager\", \"Designer\"]','Kuvalis, McGlynn and Cruickshank',45193.82,'1984-07-24',1,0,1,0,0,'Intern','Hindi,English',NULL,'PHP,SQL,React',1,'2025-05-01 09:51:45',2,10,'2025-05-01 09:51:45','2025-05-01 09:51:45',NULL,NULL,NULL,NULL,NULL,0),(9,'Georgette Bogan','1999-03-29','Other','rollin44@example.com','225 Fritz Curve\nKarliefort, IN 90542-3603','New Kareemfurt','West Virginia','BCA','Computer Science','Hackett, Kunde and Windler College','72%',1,2,5,'Medical Laboratory Technologist','[\"Designer\"]','Orn-Durgan',17871.46,'1994-10-04',0,0,0,0,1,'Intern','English,Hindi',NULL,'Laravel,SQL,PHP',1,'2025-05-01 09:51:45',10,0,'2025-05-01 09:51:45','2025-05-01 09:51:45',NULL,NULL,NULL,NULL,NULL,0),(10,'Dr. Donavon Huel','1975-03-29','Other','addie59@example.net','19567 Denis Lodge Apt. 818\nSouth Gladys, MI 54660','Laronchester','Virginia','BCA','Computer Science','Schowalter, Ziemann and McKenzie College','79%',1,3,7,'Real Estate Sales Agent','[\"Designer\"]','Gaylord-O\'Hara',18029.23,'2025-04-12',0,0,0,0,1,'Full-Time','Punjabi,English',NULL,'JavaScript,Laravel,PHP',1,'2025-05-01 09:51:45',6,17,'2025-05-01 09:51:45','2025-05-01 09:51:45',NULL,NULL,NULL,NULL,NULL,0),(11,'Wilton Rogahn','1976-12-09','Female','xfarrell@example.org','4154 Dicki Bypass\nSchuppeshire, MN 34927','South Marlen','Mississippi','M.Tech','Computer Science','Hagenes, Simonis and Boehm College','83%',0,4,4,'Construction Driller','[\"Manager\", \"Tester\", \"Developer\"]','Turcotte, Johns and Bogan',22575.41,'2007-01-02',0,0,0,0,0,'Part-Time','English,Punjabi',NULL,'PHP,Laravel,SQL',1,'2025-05-01 09:51:45',6,12,'2025-05-01 09:51:45','2025-05-01 09:51:45',NULL,NULL,NULL,NULL,NULL,0),(12,'Josefina Boehm','1995-10-10','Other','kgleichner@example.org','617 Prosacco Green Apt. 474\nSipesburgh, AL 83758-5393','West Guidoview','Wisconsin','MCA','Mechanical','Schulist, Shields and Grant College','60%',0,0,1,'Payroll Clerk','[\"Manager\", \"Developer\", \"Designer\"]','Bins, Kunze and Rippin',35297.04,'2004-12-01',1,0,1,0,1,'Full-Time','Hindi,Punjabi',NULL,'SQL,Laravel,PHP',1,'2025-05-01 09:51:45',8,19,'2025-05-01 09:51:45','2025-05-01 09:51:45',NULL,NULL,NULL,NULL,NULL,0),(13,'Prof. Jermain Wiegand','1981-04-12','Male','rveum@example.net','59115 Keebler Ports\nMuraziktown, CO 79614','Koelpinshire','New York','MCA','Mechanical','Crist Group College','66%',0,4,1,'Nuclear Monitoring Technician','[\"Designer\", \"Manager\", \"Developer\"]','Stamm, Bergnaum and O\'Kon',23817.92,'2017-06-24',0,0,0,1,0,'Full-Time','Punjabi,English',NULL,'Laravel,React,SQL',1,'2025-05-01 09:51:45',0,1,'2025-05-01 09:51:45','2025-05-01 09:51:45',NULL,NULL,NULL,NULL,NULL,0),(14,'Prof. Emery Lebsack','1981-03-16','Other','schultz.pierce@example.net','3682 Drew Island Apt. 043\nRowanfurt, MI 37492','Port Viva','Wisconsin','BCA','Electronics','Waters-Keebler College','74%',1,4,3,'Actor','[\"Designer\", \"Manager\"]','Denesik Group',25685.33,'2018-08-17',0,1,0,1,1,'Part-Time','Punjabi,Hindi',NULL,'JavaScript,SQL,PHP',1,'2025-05-01 09:51:45',8,6,'2025-05-01 09:51:45','2025-05-01 09:51:45',NULL,NULL,NULL,NULL,NULL,0),(15,'Dr. Toby Trantow','1989-10-29','Male','rath.broderick@example.net','966 Mueller Pike\nHintzside, DC 26983','South Adella','Indiana','B.Tech','Computer Science','Runolfsson LLC College','91%',1,1,1,'Customer Service Representative','[\"Developer\", \"Designer\", \"Tester\"]','Mertz-McCullough',17948.75,'1995-08-20',0,1,0,0,1,'Full-Time','Punjabi,English',NULL,'PHP,React,SQL',1,'2025-05-01 09:51:45',7,4,'2025-05-01 09:51:45','2025-05-01 09:51:45',NULL,NULL,NULL,NULL,NULL,0),(16,'Miss Selina Spencer','1975-11-20','Female','emiliano80@example.com','663 Catalina Wells\nPort Timmothy, MN 55551-7308','Port Novella','Arkansas','M.Tech','Electronics','Fritsch, Waters and Lowe College','90%',1,5,1,'Tool Set-Up Operator','[\"Tester\", \"Manager\", \"Designer\"]','Monahan and Sons',24293.36,'1996-09-12',1,1,1,1,0,'Part-Time','Hindi,English',NULL,'React,SQL,PHP',1,'2025-05-01 09:51:45',0,2,'2025-05-01 09:51:45','2025-05-01 09:51:45',NULL,NULL,NULL,NULL,NULL,0),(17,'Raphaelle Gerlach','2002-11-23','Other','rogahn.bettie@example.org','402 Schroeder Mall\nWest Isaiahmouth, ME 99018','Kleinfort','District of Columbia','M.Tech','Electronics','Gulgowski, Shields and O\'Kon College','75%',0,1,4,'Keyboard Instrument Repairer and Tuner','[\"Tester\", \"Designer\"]','Powlowski, Schowalter and Homenick',35202.16,'2021-08-06',1,0,0,0,0,'Full-Time','Hindi,Punjabi',NULL,'React,Laravel,JavaScript',1,'2025-05-01 09:51:45',4,15,'2025-05-01 09:51:45','2025-05-01 09:51:45',NULL,NULL,NULL,NULL,NULL,0),(18,'Mrs. Electa Leuschke PhD','1991-02-15','Male','uanderson@example.net','65521 Harber Trail Apt. 392\nCormierberg, VT 49980-5981','Roderickberg','West Virginia','M.Tech','Electronics','Windler Ltd College','90%',0,4,4,'Production Control Manager','[\"Designer\", \"Tester\", \"Manager\"]','Russel Inc',44684.04,'1972-07-28',0,1,0,0,0,'Part-Time','Hindi,Punjabi',NULL,'PHP,SQL,JavaScript',1,'2025-05-01 09:51:45',6,10,'2025-05-01 09:51:45','2025-05-01 09:51:45',NULL,NULL,NULL,NULL,NULL,0),(19,'Hailie Gleason','1994-04-15','Female','bruen.daphne@example.net','33858 Krajcik Lane\nPort Dereck, IL 71640-2481','Berniecefort','Florida','BCA','Electronics','Gulgowski-Schmidt College','65%',1,1,8,'Airfield Operations Specialist','[\"Tester\"]','McLaughlin Inc',36352.62,'2021-10-20',1,1,0,1,1,'Full-Time','Hindi,Punjabi',NULL,'JavaScript,Laravel,React',1,'2025-05-01 09:51:45',0,17,'2025-05-01 09:51:45','2025-05-01 09:51:45',NULL,NULL,NULL,NULL,NULL,0),(20,'Alfredo McCullough','1985-05-09','Other','alberta86@example.net','81162 Donnelly Rapids\nNorth Gwendolynland, NE 56614-8262','New Raeganfort','Hawaii','B.Tech','Mechanical','Tremblay Inc College','86%',1,0,1,'Psychologist','[\"Manager\", \"Developer\"]','Heathcote-Beer',39244.76,'1991-05-07',1,1,0,0,0,'Intern','Punjabi,Hindi',NULL,'PHP,SQL,Laravel',1,'2025-05-01 09:51:45',7,19,'2025-05-01 09:51:45','2025-05-01 09:51:45',NULL,NULL,NULL,NULL,NULL,0),(21,NULL,NULL,NULL,'manshu.developer@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,1,0,NULL,NULL,NULL,NULL,1,'2025-05-23 10:50:49',0,0,'2025-05-01 10:00:14','2025-05-23 10:50:49',NULL,NULL,NULL,'PpfWUTDpwdHd5QQIkHsrqP2qhrV6mD5Zj2Dd1BvxQo2ywFRhRQPiyMBQcx3B',NULL,0),(22,NULL,NULL,NULL,'mehrahimanshu50@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,1,0,NULL,NULL,NULL,NULL,1,'2025-05-29 11:05:22',0,0,'2025-05-08 06:54:51','2025-05-29 11:05:22',NULL,NULL,NULL,'7FhosTtVRcFbVLVCb9vDY1YLEdpIuinPTG3KFjccfD24SQjCxxihCxonA3dQ',NULL,0),(23,NULL,NULL,NULL,'manshu@mai.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,1,0,NULL,NULL,NULL,NULL,1,NULL,0,0,'2025-05-10 07:39:04','2025-05-10 07:39:04','315495','2025-05-10 07:49:04',NULL,NULL,NULL,0),(24,NULL,NULL,NULL,'manshusmartboy@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,1,0,NULL,NULL,NULL,NULL,1,'2025-05-18 01:10:31',0,0,'2025-05-18 01:10:09','2025-05-18 01:10:31',NULL,NULL,NULL,'2J6gWRQl4s16EGySwtsYQmVUBbBZJCFuZP0ELuBbEef2nuXDO0Xtz3b4jyjh',NULL,0),(25,'Mrs. Addie Bosco V','1977-08-28','Male','khalid.hodkiewicz@example.org','60937 Yost Summit\nPort Amaniville, NV 90446','Anastacioport','North Carolina','ITI','Computer Science','Langworth-Konopelski College','67%',1,2,4,'Forensic Science Technician','\"[\\\"Tester\\\"]\"','Senger-Littel',48685.33,'2002-05-17',1,0,0,0,0,'Intern','Hindi,Punjabi',NULL,'Laravel,SQL,JavaScript',1,'2025-06-06 12:50:44',1,3,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(26,'Prof. Gunner O\'Connell','1996-08-31','Other','heidenreich.jimmy@example.net','318 Alford Views Suite 022\nSouth Kaycee, WV 00559-2639','Ankundingfurt','South Dakota','diploma','Electronics','Reichel-Bahringer College','61%',0,3,10,'Electrical Drafter','\"[\\\"Developer\\\"]\"','Kub-Haley',22520.60,'1970-04-06',1,0,0,1,0,'Full-Time','Punjabi,Hindi',NULL,'JavaScript,React,SQL',1,'2025-06-06 12:50:44',5,0,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(27,'Junior Bartell','2002-01-08','Female','america.abshire@example.net','69294 Horace Glen\nSchadenland, MD 84395','Francomouth','Hawaii','graduate','Mechanical','Schinner, Friesen and Sipes College','98%',0,0,1,'Recyclable Material Collector','\"[\\\"Manager\\\",\\\"Developer\\\",\\\"Designer\\\"]\"','Huels-Volkman',24131.37,'1971-04-28',1,0,0,1,1,'Full-Time','Hindi,Punjabi',NULL,'PHP,React,JavaScript',1,'2025-06-06 12:50:44',9,10,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(28,'Uriah Bogisich','2002-11-08','Male','czboncak@example.com','1112 Kunde Meadow Apt. 263\nNorth Marco, IA 82623','West Angelica','New Hampshire','diploma','Mechanical','Nader, Olson and Larkin College','88%',1,1,2,'Management Analyst','\"[\\\"Tester\\\"]\"','Bogan-Hegmann',32656.55,'1981-11-16',1,1,1,0,1,'Intern','English,Punjabi',NULL,'PHP,JavaScript,React',1,'2025-06-06 12:50:44',8,1,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(29,'Polly Parisian','1970-06-22','Other','oturcotte@example.net','8645 Walker Green Apt. 732\nSouth Lucindaport, AL 13713','Bayerview','Wisconsin','diploma','Mechanical','Carter Inc College','84%',0,3,9,'Casting Machine Set-Up Operator','\"[\\\"Tester\\\"]\"','Kilback-Wilderman',23843.71,'1997-09-12',0,0,0,0,1,'Intern','English,Punjabi',NULL,'Laravel,SQL,JavaScript',1,'2025-06-06 12:50:44',8,8,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(30,'Bella Jerde','1988-05-02','Female','walton.abernathy@example.net','13733 Cruickshank Plaza\nNorth Jairoburgh, UT 98924-4269','Kundefort','Michigan','ITI','Computer Science','Beatty-Abernathy College','68%',0,0,3,'Motion Picture Projectionist','\"[\\\"Developer\\\",\\\"Tester\\\"]\"','Auer-Rodriguez',40164.78,'1983-01-26',1,0,1,0,0,'Part-Time','Hindi,English',NULL,'SQL,React,Laravel',1,'2025-06-06 12:50:44',3,9,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(31,'Paris Price','1990-03-04','Female','mtorphy@example.com','33099 Alan Skyway Apt. 567\nSouth Carmelo, NM 33851-2871','Mraztown','Indiana','graduate','Electronics','O\'Conner LLC College','60%',1,0,3,'Middle School Teacher','\"[\\\"Manager\\\",\\\"Designer\\\",\\\"Tester\\\"]\"','Tromp-Treutel',10374.61,'1985-06-05',1,0,1,0,0,'Full-Time','Hindi,English',NULL,'React,PHP,SQL',1,'2025-06-06 12:50:44',0,8,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(32,'Prof. Esteban Padberg DDS','1991-12-19','Male','jaclyn48@example.org','637 Willms Crest Suite 487\nNew Eudora, CT 65613-2389','South Cecilefort','Florida','diploma','Electronics','McClure-Medhurst College','63%',1,4,2,'Dietetic Technician','\"[\\\"Designer\\\",\\\"Tester\\\",\\\"Manager\\\"]\"','Roberts, Parisian and Shanahan',21880.86,'1974-03-08',1,0,0,1,0,'Part-Time','Punjabi,Hindi',NULL,'React,JavaScript,Laravel',1,'2025-06-06 12:50:44',2,5,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(33,'Dariana Waters','1972-04-21','Male','harber.mozell@example.org','14367 Nils Gardens Apt. 278\nSporerhaven, CO 91230-1701','Bahringerberg','Minnesota','12th','Mechanical','Robel-Moore College','87%',0,3,7,'Middle School Teacher','\"[\\\"Designer\\\",\\\"Manager\\\",\\\"Developer\\\"]\"','O\'Kon-Emmerich',42221.48,'2002-04-11',1,0,0,0,0,'Full-Time','Hindi,Punjabi',NULL,'JavaScript,Laravel,React',1,'2025-06-06 12:50:44',0,17,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(34,'Fern Kessler','1980-12-09','Male','adell.ryan@example.net','93216 Sporer Ports\nNorth Green, NE 38282-9732','Swaniawskishire','Louisiana','graduate','Computer Science','Simonis-Windler College','70%',1,3,0,'Advertising Sales Agent','\"[\\\"Manager\\\",\\\"Tester\\\"]\"','Hermann, Gaylord and Bartell',38566.37,'1986-01-21',1,1,0,0,1,'Intern','Punjabi,Hindi',NULL,'JavaScript,PHP,SQL',1,'2025-06-06 12:50:44',8,5,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(35,'Laurence Kiehn','2000-04-17','Male','smayert@example.org','13457 Johns Loop Apt. 122\nEast Juliet, WI 11650-7973','Maidaberg','Kentucky','10th','Computer Science','Herzog-Ullrich College','81%',1,5,9,'Legal Secretary','\"[\\\"Developer\\\"]\"','Walter, O\'Kon and Von',10547.56,'2020-02-09',0,0,0,0,1,'Full-Time','Hindi,English',NULL,'PHP,SQL,Laravel',1,'2025-06-06 12:50:44',9,18,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(36,'Neha Maggio DDS','1998-03-08','Male','savion91@example.com','512 Monahan Station Suite 571\nWest Markusburgh, SD 54674','Manuelville','Pennsylvania','12th','Electronics','Skiles-Schneider College','84%',0,1,7,'Assembler','\"[\\\"Manager\\\"]\"','Johnston Inc',26154.04,'1985-10-16',1,1,1,0,1,'Part-Time','Hindi,Punjabi',NULL,'PHP,JavaScript,Laravel',1,'2025-06-06 12:50:44',1,17,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(37,'Prof. Francisco Kshlerin','2000-04-21','Male','boreilly@example.com','801 Carroll Branch Apt. 061\nPort Arnulfofurt, VA 50027','North Daren','Indiana','ITI','Computer Science','Schuppe, Schroeder and Jerde College','62%',0,0,11,'Ceiling Tile Installer','\"[\\\"Developer\\\",\\\"Manager\\\"]\"','Cremin-Christiansen',41273.20,'1991-11-21',1,0,1,1,0,'Part-Time','English,Punjabi',NULL,'JavaScript,Laravel,React',1,'2025-06-06 12:50:44',6,20,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(38,'Shyanne Wunsch','2000-03-22','Other','xpacocha@example.net','61161 Schultz Ville Suite 054\nCamrynmouth, VA 71472-5696','New Kasandratown','New Jersey','graduate','Electronics','Borer LLC College','77%',0,4,3,'Floor Layer','\"[\\\"Developer\\\",\\\"Designer\\\"]\"','Schmitt and Sons',44504.50,'1979-10-16',0,1,0,0,1,'Intern','Punjabi,Hindi',NULL,'SQL,Laravel,JavaScript',1,'2025-06-06 12:50:44',6,19,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(39,'Emelie Okuneva','1999-08-10','Male','herta83@example.com','16855 Jorge Stravenue Suite 359\nLake Clinton, UT 15454','East Adalbertoview','Oregon','ITI','Electronics','Kihn and Sons College','70%',1,2,11,'Radio Operator','\"[\\\"Manager\\\",\\\"Developer\\\"]\"','Klocko, Barton and Hirthe',30311.43,'1997-10-31',1,0,1,1,0,'Full-Time','Hindi,English',NULL,'Laravel,JavaScript,React',1,'2025-06-06 12:50:44',7,3,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(40,'Raphael Auer','1974-06-30','Other','lorenz93@example.org','2815 Walter Villages Apt. 686\nEast Tonyfurt, DE 46233-3942','Nitzschechester','Nevada','graduate','Computer Science','Halvorson Group College','68%',0,1,11,'Computer Systems Analyst','\"[\\\"Manager\\\",\\\"Tester\\\"]\"','Walker PLC',18565.05,'1993-04-19',1,0,0,1,0,'Intern','Punjabi,English',NULL,'JavaScript,PHP,React',1,'2025-06-06 12:50:44',1,10,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(41,'Vernon Schaefer','1990-02-26','Other','julianne90@example.org','77369 Nathan Loop\nBeckermouth, UT 35231','New Howardburgh','Alaska','ITI','Mechanical','Rolfson PLC College','80%',1,5,6,'Electrician','\"[\\\"Tester\\\"]\"','Hamill, Barrows and Hessel',29599.66,'2017-09-29',0,0,0,1,1,'Intern','Punjabi,Hindi',NULL,'SQL,Laravel,React',1,'2025-06-06 12:50:44',8,6,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(42,'Mrs. Georgianna Torp Jr.','1999-02-05','Female','jenifer.wiegand@example.org','9402 Chauncey Harbors\nNorth Karaville, MN 82716','Eddville','Oklahoma','10th','Electronics','Turner LLC College','99%',0,4,1,'Musician OR Singer','\"[\\\"Manager\\\",\\\"Designer\\\"]\"','Brekke-Mosciski',17472.77,'1990-04-26',0,0,1,0,0,'Full-Time','English,Punjabi',NULL,'PHP,SQL,JavaScript',1,'2025-06-06 12:50:44',2,9,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(43,'Antwon Hilpert Jr.','1997-03-24','Female','lzemlak@example.com','17870 Hoyt Glens Suite 838\nMohrshire, NM 46767-0274','West Jamelchester','Texas','diploma','Electronics','Bartoletti-Strosin College','94%',0,3,4,'Motor Vehicle Inspector','\"[\\\"Designer\\\"]\"','Mann, Berge and Schaefer',48932.89,'1996-10-21',0,0,1,0,1,'Intern','English,Punjabi',NULL,'PHP,JavaScript,Laravel',1,'2025-06-06 12:50:44',5,2,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(44,'Gage Deckow','1981-08-30','Other','hallie10@example.net','46927 Kunze Brook Suite 614\nNew Makenzieville, NJ 81434-2454','South Nelda','Maryland','diploma','Computer Science','Douglas, Tillman and Volkman College','69%',0,5,3,'PR Manager','\"[\\\"Designer\\\",\\\"Tester\\\",\\\"Manager\\\"]\"','Harber, Towne and Little',33418.69,'1997-07-19',0,1,1,0,1,'Full-Time','Hindi,English',NULL,'React,Laravel,SQL',1,'2025-06-06 12:50:44',2,13,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(45,'Joey D\'Amore','1990-08-26','Female','aschinner@example.org','956 Orn Springs\nNorth Michale, AZ 23955','Kobeberg','Maryland','ITI','Mechanical','Labadie Ltd College','99%',1,2,8,'Service Station Attendant','\"[\\\"Tester\\\",\\\"Manager\\\",\\\"Developer\\\"]\"','Considine LLC',16945.63,'2024-12-06',1,1,1,1,1,'Intern','Hindi,English',NULL,'SQL,Laravel,React',1,'2025-06-06 12:50:44',4,6,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(46,'Letitia Kuhlman','1974-08-28','Female','mhermann@example.org','610 Jacobi Pike\nReingermouth, NE 00016-0023','Lake Lewis','District of Columbia','postgraduate','Mechanical','Fay, Dickinson and Keeling College','97%',1,4,8,'Offset Lithographic Press Operator','\"[\\\"Tester\\\",\\\"Designer\\\"]\"','Weimann-Sanford',24836.06,'1976-12-03',0,1,1,0,0,'Full-Time','English,Punjabi',NULL,'SQL,JavaScript,Laravel',1,'2025-06-06 12:50:44',2,12,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(47,'Freeda Lindgren','1973-12-30','Other','qdickinson@example.org','426 Kerluke Cliff\nMonahanstad, OK 99117','Johnsville','New Jersey','diploma','Electronics','Larkin and Sons College','84%',0,2,7,'Streetcar Operator','\"[\\\"Designer\\\",\\\"Developer\\\",\\\"Tester\\\"]\"','Ledner-Flatley',27081.61,'2013-05-10',0,1,1,1,0,'Intern','Punjabi,English',NULL,'Laravel,SQL,React',1,'2025-06-06 12:50:44',3,16,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(48,'Aimee Hand','1992-01-25','Other','lindsey58@example.com','668 Brown Cove Apt. 403\nWest Elvie, OR 60865-6287','Noemieborough','Wisconsin','diploma','Mechanical','Bayer, Pacocha and Wisozk College','87%',0,0,8,'Log Grader and Scaler','\"[\\\"Manager\\\",\\\"Designer\\\"]\"','Oberbrunner and Sons',21852.30,'2005-10-28',1,1,0,0,1,'Part-Time','Punjabi,English',NULL,'SQL,PHP,React',1,'2025-06-06 12:50:44',1,11,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(49,'Camron Luettgen','2000-02-21','Male','augustine.hermann@example.net','64263 Magdalen Mission Suite 343\nPort Valentinefurt, PA 70366','Feeneyton','Montana','postgraduate','Mechanical','Hermann-McCullough College','65%',0,0,7,'Forging Machine Setter','\"[\\\"Designer\\\",\\\"Developer\\\",\\\"Tester\\\"]\"','Williamson-Mosciski',37758.34,'2017-04-03',0,1,0,1,0,'Intern','English,Punjabi',NULL,'React,JavaScript,SQL',1,'2025-06-06 12:50:44',10,10,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(50,'Ocie Zieme III','1987-11-04','Other','gleichner.cassandre@example.net','25088 Trantow Streets Apt. 442\nWilliamsonton, OR 54544','Hintzchester','Mississippi','ITI','Mechanical','Haley, Deckow and Dare College','60%',0,0,5,'Security Guard','\"[\\\"Manager\\\"]\"','Quitzon, Sanford and Ferry',12315.95,'1988-04-01',0,0,1,0,1,'Part-Time','English,Punjabi',NULL,'React,SQL,JavaScript',1,'2025-06-06 12:50:44',1,4,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(51,'Prof. Lela Johnson V','1993-04-06','Female','kathryn94@example.org','714 Casper Station\nSouth Madilyn, NM 50389-3627','New Matteo','Nebraska','10th','Electronics','Gutmann, Langosh and Lemke College','90%',1,3,2,'Electronics Engineering Technician','\"[\\\"Designer\\\"]\"','Lesch-Johns',18169.89,'2020-03-05',1,1,0,1,0,'Part-Time','Hindi,Punjabi',NULL,'PHP,Laravel,JavaScript',1,'2025-06-06 12:50:44',4,15,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(52,'Ms. Emelia Dooley','1991-08-11','Male','lgrady@example.org','150 Niko Trace\nJermainefort, PA 85047-0730','West Kaciestad','Arkansas','12th','Computer Science','Parisian-Ratke College','81%',1,0,5,'Gaming Dealer','\"[\\\"Developer\\\",\\\"Manager\\\",\\\"Designer\\\"]\"','Bahringer, Wilderman and Rohan',13790.75,'1987-04-11',1,1,0,1,1,'Intern','Punjabi,Hindi',NULL,'PHP,JavaScript,Laravel',1,'2025-06-06 12:50:44',1,3,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(53,'Charity Lowe','1986-09-22','Female','rmcglynn@example.com','3583 Rippin Streets\nEast Bonniefort, SC 81994-5854','Lilianetown','Washington','ITI','Electronics','DuBuque-Sawayn College','73%',0,4,5,'Gas Distribution Plant Operator','\"[\\\"Tester\\\",\\\"Manager\\\"]\"','Schoen-Schroeder',31768.13,'2001-03-11',1,1,1,1,1,'Full-Time','Punjabi,Hindi',NULL,'SQL,JavaScript,React',1,'2025-06-06 12:50:44',8,16,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(54,'Desiree Christiansen','1994-01-13','Female','desiree01@example.net','8082 Alva Square\nKozeytown, CT 68235','West Jadaberg','Wisconsin','12th','Computer Science','Ziemann, King and Skiles College','63%',0,5,8,'Art Teacher','\"[\\\"Tester\\\",\\\"Designer\\\",\\\"Developer\\\"]\"','Littel LLC',47686.21,'2003-08-31',0,1,0,1,1,'Full-Time','Punjabi,Hindi',NULL,'React,Laravel,SQL',1,'2025-06-06 12:50:44',10,3,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(55,'Tracey Powlowski','1973-10-17','Male','bosco.dana@example.org','329 Archibald Bridge\nOsinskiborough, SD 11872','New Carolanneburgh','Arkansas','postgraduate','Computer Science','Jerde-Bradtke College','95%',0,4,1,'Structural Iron and Steel Worker','\"[\\\"Tester\\\",\\\"Manager\\\",\\\"Designer\\\"]\"','Grimes-Smith',13204.94,'1987-06-21',1,1,1,0,1,'Part-Time','Punjabi,English',NULL,'PHP,JavaScript,React',1,'2025-06-06 12:50:44',4,18,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(56,'Palma White','1971-01-18','Female','burdette.gottlieb@example.org','54694 Rath Circles Apt. 433\nEast Dayton, NC 44451-4956','Raynorberg','Rhode Island','graduate','Electronics','Emard, Weber and Lakin College','64%',0,0,7,'Rail Transportation Worker','\"[\\\"Designer\\\",\\\"Tester\\\"]\"','Conn and Sons',27044.93,'2001-03-09',0,1,0,0,1,'Part-Time','Punjabi,Hindi',NULL,'PHP,SQL,React',1,'2025-06-06 12:50:44',3,9,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(57,'Dr. Al Barton','2001-07-22','Other','kylee33@example.com','405 Donato Throughway Apt. 586\nSouth Rico, OH 56058','New Rhiannon','Texas','diploma','Computer Science','Farrell Ltd College','91%',0,3,11,'Forest Fire Inspector','\"[\\\"Manager\\\",\\\"Tester\\\"]\"','Glover-Beatty',44035.75,'2005-07-06',0,1,0,0,1,'Full-Time','Punjabi,Hindi',NULL,'PHP,React,Laravel',1,'2025-06-06 12:50:44',8,13,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(58,'Elvera Wilkinson II','1972-09-30','Other','oreilly@example.net','41464 Jerald Stravenue Suite 729\nNew Maximilliaville, SD 64739','Jacobsonville','Oklahoma','12th','Electronics','Kemmer, Lowe and Stoltenberg College','66%',0,4,2,'Naval Architects','\"[\\\"Designer\\\",\\\"Developer\\\"]\"','Waters Ltd',24933.76,'1986-11-09',1,1,0,1,0,'Part-Time','Hindi,Punjabi',NULL,'PHP,SQL,Laravel',1,'2025-06-06 12:50:44',5,7,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(59,'Eugene Mohr','1990-05-05','Female','rebekah.crist@example.org','22971 Kiehn Alley\nShanaport, MN 18531-3348','Shyannfurt','Alaska','postgraduate','Electronics','Kuvalis-Kiehn College','95%',0,2,1,'Brake Machine Setter','\"[\\\"Designer\\\",\\\"Tester\\\",\\\"Developer\\\"]\"','Hayes, Champlin and Kirlin',16978.21,'2002-05-05',0,0,0,0,1,'Part-Time','English,Punjabi',NULL,'JavaScript,React,SQL',1,'2025-06-06 12:50:44',8,0,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(60,'Ms. Lera Wilderman','1995-02-01','Other','fmaggio@example.org','31900 Paucek Garden\nConsidineville, IN 29453','Cruickshankfort','Massachusetts','graduate','Electronics','VonRueden PLC College','61%',0,3,4,'Punching Machine Setters','\"[\\\"Developer\\\",\\\"Manager\\\",\\\"Tester\\\"]\"','Wunsch, Kerluke and Hettinger',34081.29,'2019-04-28',0,1,1,1,1,'Intern','Hindi,Punjabi',NULL,'Laravel,JavaScript,PHP',1,'2025-06-06 12:50:44',1,7,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(61,'Connie Murazik','2000-08-13','Female','mauricio.orn@example.org','881 Hammes Parkways Apt. 778\nEast Emery, GA 89658','Pagacton','South Carolina','10th','Electronics','Stanton, Rohan and Collier College','83%',1,4,1,'Telecommunications Line Installer','\"[\\\"Manager\\\",\\\"Designer\\\"]\"','Greenfelder, Gutkowski and O\'Kon',27497.07,'2000-04-22',1,0,0,1,0,'Intern','Hindi,English',NULL,'PHP,JavaScript,SQL',1,'2025-06-06 12:50:44',7,3,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(62,'Mr. Vicente Wolf','2001-02-09','Other','carleton62@example.org','5015 Jude Crest\nEast Sidport, KY 55381-4529','Port Aileenland','California','postgraduate','Electronics','Shanahan-Wiegand College','98%',1,3,3,'Sales and Related Workers','\"[\\\"Tester\\\",\\\"Developer\\\"]\"','Lesch, Ledner and Gulgowski',42645.76,'2013-12-26',1,0,0,0,0,'Full-Time','Punjabi,English',NULL,'JavaScript,React,SQL',1,'2025-06-06 12:50:44',1,20,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(63,'Mr. Grayson Mann II','1998-04-20','Female','aurelio.ernser@example.net','36962 Glen Wells\nTurcottestad, VT 68400','Sydnichester','Texas','12th','Electronics','Flatley and Sons College','84%',0,4,1,'Food Preparation','\"[\\\"Tester\\\",\\\"Manager\\\"]\"','Parker Group',40234.21,'2023-08-24',0,1,1,0,1,'Part-Time','Hindi,English',NULL,'JavaScript,React,PHP',1,'2025-06-06 12:50:44',7,16,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(64,'Delta Schmeler','1973-02-15','Other','fstamm@example.net','97442 Roberts Loop\nFraneckibury, OR 26438','Jairoberg','Virginia','12th','Electronics','Hills-Wolf College','100%',0,0,0,'Sawing Machine Setter','\"[\\\"Tester\\\"]\"','Schinner-Bauch',17918.62,'1990-03-22',0,0,1,1,1,'Intern','Hindi,English',NULL,'SQL,JavaScript,React',1,'2025-06-06 12:50:44',9,15,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(65,'Noel O\'Hara PhD','1981-08-02','Other','ekovacek@example.com','89902 Vivienne Roads Suite 329\nPurdybury, ME 07872','Port Darian','Oregon','10th','Computer Science','Schaden, Stark and Quitzon College','67%',0,2,1,'RN','\"[\\\"Manager\\\",\\\"Developer\\\"]\"','Wisoky, Gorczany and Kuhlman',33698.02,'2017-07-15',1,0,0,1,0,'Full-Time','Punjabi,Hindi',NULL,'React,SQL,JavaScript',1,'2025-06-06 12:50:44',1,11,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(66,'Tiara Christiansen','1978-12-06','Female','dorothy52@example.com','3697 Darren Circles\nWest Keenan, WI 15994','East Isadore','Nevada','ITI','Computer Science','Ryan-Okuneva College','68%',0,1,3,'History Teacher','\"[\\\"Developer\\\",\\\"Designer\\\"]\"','Sipes Group',21150.51,'2012-03-25',1,1,0,1,1,'Intern','Hindi,Punjabi',NULL,'SQL,Laravel,JavaScript',1,'2025-06-06 12:50:44',8,11,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(67,'Roxane Leuschke','2002-11-17','Male','taurean30@example.com','901 Will Valleys Suite 682\nNew Margret, RI 66741','Port Roscoe','South Dakota','postgraduate','Computer Science','Johnson, Effertz and Cruickshank College','92%',1,2,3,'Power Generating Plant Operator','\"[\\\"Designer\\\",\\\"Developer\\\"]\"','Weissnat-Strosin',17698.35,'1977-09-05',0,1,0,0,1,'Full-Time','Punjabi,English',NULL,'SQL,Laravel,JavaScript',1,'2025-06-06 12:50:44',4,19,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(68,'Donnie Hessel','1992-01-05','Male','snicolas@example.com','37898 Sammy Garden\nKristianshire, MD 33121-6174','Towneton','Iowa','10th','Electronics','Rosenbaum, McClure and Botsford College','76%',1,5,8,'Keyboard Instrument Repairer and Tuner','\"[\\\"Tester\\\"]\"','Maggio-Wunsch',31959.08,'1998-06-02',0,0,0,1,0,'Part-Time','Punjabi,English',NULL,'SQL,JavaScript,PHP',1,'2025-06-06 12:50:44',5,18,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(69,'Annabel Eichmann','1986-10-01','Female','sbradtke@example.net','742 Bryce Stream Apt. 102\nSouth Schuyler, KS 91054','McCluretown','Mississippi','ITI','Electronics','Hyatt, Schamberger and Leannon College','61%',1,3,10,'Mechanical Inspector','\"[\\\"Tester\\\",\\\"Designer\\\",\\\"Manager\\\"]\"','Lakin-Hills',29592.89,'2023-10-14',1,0,1,1,1,'Full-Time','Hindi,English',NULL,'SQL,React,JavaScript',1,'2025-06-06 12:50:44',1,0,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(70,'Bridget Homenick','1986-10-09','Male','orin.baumbach@example.net','196 Kaya Spring Apt. 207\nColliermouth, VT 90014-6275','Lake Carleeborough','Idaho','postgraduate','Mechanical','Heller, Ondricka and Carroll College','96%',0,3,11,'Tool Set-Up Operator','\"[\\\"Manager\\\",\\\"Designer\\\"]\"','Williamson-Gaylord',45116.09,'2010-11-22',0,0,1,0,1,'Intern','English,Hindi',NULL,'JavaScript,PHP,SQL',1,'2025-06-06 12:50:44',4,0,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(71,'Jany Hessel','1980-05-17','Male','yprohaska@example.org','7005 Hills Mission Apt. 540\nKarineburgh, MD 97324','East Beauville','North Carolina','graduate','Mechanical','Hintz-Bernhard College','60%',0,2,10,'Office Clerk','\"[\\\"Developer\\\"]\"','Hegmann Group',49078.60,'1981-06-27',0,0,1,0,1,'Intern','English,Hindi',NULL,'JavaScript,PHP,SQL',1,'2025-06-06 12:50:44',0,16,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(72,'Christiana Wolf','1992-07-01','Female','gleason.malika@example.com','77429 Stanton Drive Suite 209\nMarinamouth, SD 09715-3078','South Herta','New York','graduate','Mechanical','Weber-Ledner College','95%',0,4,2,'Travel Agent','\"[\\\"Developer\\\"]\"','Kihn Group',13765.58,'2011-09-11',0,0,1,0,0,'Part-Time','English,Punjabi',NULL,'SQL,React,Laravel',1,'2025-06-06 12:50:44',0,7,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(73,'Pete Kulas','1986-01-04','Other','nbahringer@example.net','892 Ruecker Viaduct Apt. 220\nJasentown, NC 58214','West Joshuaborough','Florida','diploma','Mechanical','Metz, Schaefer and Block College','73%',0,4,3,'Heating and Air Conditioning Mechanic','\"[\\\"Designer\\\",\\\"Tester\\\",\\\"Manager\\\"]\"','Streich-Schamberger',26653.22,'1998-05-23',0,1,1,1,0,'Full-Time','Hindi,English',NULL,'JavaScript,Laravel,React',1,'2025-06-06 12:50:44',3,3,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(74,'Prof. Mollie Adams III','1993-11-13','Male','jabbott@example.net','41548 Wisoky Mountains Apt. 281\nNew Davonside, NV 75872-5335','Port Lavernberg','Wisconsin','12th','Computer Science','Hackett-Veum College','84%',0,3,9,'Financial Services Sales Agent','\"[\\\"Developer\\\",\\\"Manager\\\",\\\"Designer\\\"]\"','Haley-Boehm',24468.40,'2008-07-29',0,1,1,1,0,'Full-Time','English,Punjabi',NULL,'PHP,React,Laravel',1,'2025-06-06 12:50:44',9,5,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(75,'Himanshu Mehra',NULL,NULL,'himanshu.mehra@example.com','123 Main Street','Chandigarh','Punjab','BCA','Computer Applications','Unknown College','75.00',0,2,0,'Full Stack Developer','[\"Full Stack Developer\"]','Future IT Rouch',NULL,NULL,0,1,1,1,0,'Full-time','English',NULL,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `candidates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employer_id` bigint unsigned NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gst_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_person` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `companies_employer_id_foreign` (`employer_id`),
  CONSTRAINT `companies_employer_id_foreign` FOREIGN KEY (`employer_id`) REFERENCES `employers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employers`
--

DROP TABLE IF EXISTS `employers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gst_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gst_certificate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_pan_card` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_gst` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_person` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `otp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `session_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_verified` tinyint(1) DEFAULT NULL,
  `is_blocked` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employers`
--

LOCK TABLES `employers` WRITE;
/*!40000 ALTER TABLE `employers` DISABLE KEYS */;
INSERT INTO `employers` VALUES (1,'','Techverse Pvt Ltd',NULL,NULL,NULL,'Bangalore, India',NULL,'hr@techverse.com','hr@techverse.com','9876543210','2025-05-01 09:52:01','2025-05-10 07:19:01',NULL,NULL,NULL,NULL,0,0),(2,'','MediCare Solutions',NULL,NULL,NULL,'Mumbai, India',NULL,'contact@medicare.com','hr@techverse.com','9123456789','2025-05-01 09:52:01','2025-05-01 09:52:01',NULL,NULL,NULL,NULL,0,0),(3,'','Techverse Pvt Ltd',NULL,NULL,NULL,'Bangalore, India',NULL,'hr@techverse.com','hr@techverse.com','9876543210','2025-05-01 09:53:36','2025-05-01 09:53:36',NULL,NULL,NULL,NULL,0,0),(4,'','MediCare Solutions',NULL,NULL,NULL,'Mumbai, India',NULL,'contact@medicare.com','hr@techverse.com','9123456789','2025-05-01 09:53:36','2025-05-01 09:53:36',NULL,NULL,NULL,NULL,0,0),(5,'','Techverse Pvt Ltd',NULL,NULL,NULL,'Bangalore, India',NULL,'hr@techverse.com','hr@techverse.com','9876543210','2025-05-01 09:55:12','2025-05-01 09:55:12',NULL,NULL,NULL,NULL,0,0),(6,'','MediCare Solutions',NULL,NULL,NULL,'Mumbai, India',NULL,'contact@medicare.com','hr@techverse.com','9123456789','2025-05-01 09:55:12','2025-05-01 09:55:12',NULL,NULL,NULL,NULL,0,0),(7,'','Techverse Pvt Ltd',NULL,NULL,NULL,'Bangalore, India',NULL,'hr@techverse.com','hr@techverse.com','9876543210','2025-05-01 09:55:28','2025-05-01 09:55:28',NULL,NULL,NULL,NULL,0,0),(8,'','MediCare Solutions',NULL,NULL,NULL,'Mumbai, India',NULL,'contact@medicare.com','hr@techverse.com','9123456789','2025-05-01 09:55:28','2025-05-10 07:19:03',NULL,NULL,NULL,NULL,0,0),(23,'f3','Swiggy',NULL,NULL,NULL,NULL,NULL,NULL,'manshusmartboy@gmail.com',NULL,'2025-05-21 11:30:12','2025-05-26 09:39:19','$2y$12$fCp1rQwx5Jl3MoZpt3bfhuhbLOXwb6f.0JVg3jAmgJvTDpn5QgzNK','2025-05-21 11:30:12',NULL,NULL,1,0),(24,'masnhu Mehra','SKymoreIt Solutions',NULL,NULL,NULL,'Mohali',NULL,NULL,'director@skymoreitsolutions.com','7988532993','2025-05-21 11:47:29','2025-05-21 12:05:22','$2y$12$pjf4RW0jiz/.4QgQxJiLdup9iB9.Xt/d/i4HYpZ8Szkz667n2DUmi','2025-05-21 11:47:29',NULL,NULL,1,NULL),(25,'Manshu','Sky MOre It',NULL,NULL,NULL,'Ambala',NULL,NULL,'skymore@skymore.com','7988532993','2025-05-23 10:47:08','2025-05-23 10:48:08','$2y$12$.kOOzYtqZbBWmib4Ts3pI.PF9Fkb/Oducd3ee00YRPV8o1dFJRBX.','2025-05-23 10:47:08',NULL,NULL,1,NULL),(27,'Manshu','Skymore',NULL,NULL,NULL,'Ambala Cantt',NULL,NULL,'manshu.de@gmail.com','7988532993','2025-05-26 09:50:44','2025-05-26 09:52:13','$2y$12$FmsBF652X5Bz8yMJAmcbSOGJCV7zK3m2wuIVJ1jiIx9PeYQgaKnxK','2025-05-26 09:50:44',NULL,NULL,1,NULL),(31,'Anv','Skure',NULL,NULL,NULL,'Amb',NULL,NULL,'mehrahimanshu50@gmail.com','7988532993','2025-05-26 11:40:29','2025-05-26 11:42:02','$2y$12$5pePYyoGB/PFOmJnPxjldesK5io0LaZybuFrJMaXjjwNSPeUM4k9e','2025-05-26 11:40:29',NULL,NULL,1,NULL),(34,'Manshu','Skymore New One',NULL,NULL,NULL,'Ambala cantt',NULL,NULL,'manshu.developer@gmail.com','7988532993','2025-06-07 00:54:07','2025-06-07 00:55:04','$2y$12$hglt18qTXI9mh1ODnVpD0uelaAlMan.iD/3x.9xWmZ4Pk7yEawYEy','2025-06-07 00:54:07',NULL,NULL,1,NULL);
/*!40000 ALTER TABLE `employers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_posting_applications`
--

DROP TABLE IF EXISTS `job_posting_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_posting_applications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `job_posting_id` bigint unsigned NOT NULL,
  `status` enum('applied','interview','rejected','hired') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `candidate_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `job_posting_applications_user_id_foreign` (`user_id`),
  KEY `job_posting_applications_job_posting_id_foreign` (`job_posting_id`),
  KEY `job_posting_applications_candidate_id_foreign` (`candidate_id`),
  CONSTRAINT `job_posting_applications_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`) ON DELETE CASCADE,
  CONSTRAINT `job_posting_applications_job_posting_id_foreign` FOREIGN KEY (`job_posting_id`) REFERENCES `job_postings` (`id`),
  CONSTRAINT `job_posting_applications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_posting_applications`
--

LOCK TABLES `job_posting_applications` WRITE;
/*!40000 ALTER TABLE `job_posting_applications` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_posting_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_postings`
--

DROP TABLE IF EXISTS `job_postings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_postings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employer_id` bigint unsigned NOT NULL,
  `job_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `job_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `work_location_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `compensation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pay_type` enum('Hourly','Salary','Per Project') COLLATE utf8mb4_unicode_ci NOT NULL,
  `joining_fee` tinyint(1) NOT NULL DEFAULT '0',
  `basic_requirements` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `additional_requirements` json DEFAULT NULL,
  `is_walkin_interview` tinyint(1) NOT NULL DEFAULT '0',
  `communication_preference` enum('Call','Whatsapp','No Preference') COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_experience_required` int DEFAULT NULL,
  `other_job_titles` json DEFAULT NULL,
  `degree_specialization` json DEFAULT NULL,
  `job_description` text COLLATE utf8mb4_unicode_ci,
  `job_expire_time` int NOT NULL DEFAULT '7',
  `number_of_candidates_required` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_verified` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `job_postings_employer_id_foreign` (`employer_id`),
  CONSTRAINT `job_postings_employer_id_foreign` FOREIGN KEY (`employer_id`) REFERENCES `employers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_postings`
--

LOCK TABLES `job_postings` WRITE;
/*!40000 ALTER TABLE `job_postings` DISABLE KEYS */;
INSERT INTO `job_postings` VALUES (1,2,'Backend Developer','part_time','Hyderabad, India','onsite','20 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',1,'Call',2,'[\"Junior HR Executive\", \"Assistant Backend Developer\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,8,'2025-05-01 09:52:01','2025-05-23 12:23:05',1),(2,2,'Graphic Designer','part_time','Chennai, India','remote','20 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',1,'Call',5,'[\"Junior Backend Developer\", \"Assistant Network Engineer\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,7,'2025-05-01 09:52:01','2025-05-23 12:23:06',1),(3,2,'Business Analyst','part_time','Chennai, India','remote','4 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',0,'Call',0,'[\"Junior Content Writer\", \"Assistant Backend Developer\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,8,'2025-05-01 09:52:01','2025-05-23 12:23:07',1),(4,1,'Backend Developer','full_time','Mumbai, India','hybrid','4 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',0,'Call',5,'[\"Junior Network Engineer\", \"Assistant Software Developer\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,1,'2025-05-01 09:52:01','2025-05-23 12:23:08',1),(5,1,'Frontend Developer','freelance','Chennai, India','onsite','16 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',1,'Call',1,'[\"Junior Backend Developer\", \"Assistant Backend Developer\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,7,'2025-05-01 09:52:01','2025-05-23 12:23:08',1),(6,2,'Customer Support Executive','part_time','Hyderabad, India','remote','4 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',0,'Call',2,'[\"Junior Software Developer\", \"Assistant Graphic Designer\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,5,'2025-05-01 09:52:01','2025-05-23 12:23:09',1),(7,1,'Sales Manager','internship','Chennai, India','onsite','8 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',0,'Call',5,'[\"Junior HR Executive\", \"Assistant HR Executive\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,4,'2025-05-01 09:52:01','2025-05-23 12:23:10',1),(8,2,'Business Analyst','freelance','Hyderabad, India','onsite','10 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',1,'Call',1,'[\"Junior Backend Developer\", \"Assistant Network Engineer\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,6,'2025-05-01 09:52:01','2025-05-23 12:23:11',1),(9,2,'Digital Marketer','part_time','Chennai, India','hybrid','5 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',1,'Call',1,'[\"Junior Frontend Developer\", \"Assistant Frontend Developer\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,10,'2025-05-01 09:52:01','2025-05-01 09:52:01',0),(10,1,'Content Writer','full_time','Chennai, India','remote','12 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',1,'Call',1,'[\"Junior QA Tester\", \"Assistant Software Developer\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,5,'2025-05-01 09:52:01','2025-05-01 09:52:01',0),(11,2,'Customer Support Executive','full_time','Bangalore, India','hybrid','3 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',1,'Call',2,'[\"Junior Business Analyst\", \"Assistant Backend Developer\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,4,'2025-05-01 09:52:01','2025-05-01 09:52:01',0),(12,1,'Backend Developer','internship','Bangalore, India','hybrid','15 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',0,'Call',3,'[\"Junior Backend Developer\", \"Assistant Backend Developer\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,10,'2025-05-01 09:52:01','2025-05-01 09:52:01',0),(13,1,'Sales Manager','internship','Bangalore, India','hybrid','4 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',1,'Call',1,'[\"Junior Graphic Designer\", \"Assistant Software Developer\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,8,'2025-05-01 09:52:01','2025-05-01 09:52:01',0),(14,1,'HR Executive','freelance','Chennai, India','onsite','14 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',1,'Call',2,'[\"Junior Digital Marketer\", \"Assistant Sales Manager\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,10,'2025-05-01 09:52:01','2025-05-01 09:52:01',0),(15,1,'Network Engineer','full_time','Pune, India','remote','3 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',0,'Call',3,'[\"Junior Software Developer\", \"Assistant Network Engineer\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,6,'2025-05-01 09:52:01','2025-05-01 09:52:01',0),(16,1,'Customer Support Executive','internship','Bangalore, India','onsite','14 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',0,'Call',3,'[\"Junior Sales Manager\", \"Assistant Content Writer\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,6,'2025-05-01 09:52:01','2025-05-01 09:52:01',0),(17,1,'Network Engineer','part_time','Hyderabad, India','remote','11 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',1,'Call',1,'[\"Junior Software Developer\", \"Assistant Backend Developer\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,10,'2025-05-01 09:53:36','2025-05-01 09:53:36',0),(18,1,'Sales Manager','internship','Chennai, India','remote','7 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',0,'Call',2,'[\"Junior Frontend Developer\", \"Assistant Business Analyst\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,1,'2025-05-01 09:53:36','2025-05-01 09:53:36',0),(19,2,'Sales Manager','part_time','Pune, India','onsite','16 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',0,'Call',1,'[\"Junior Software Developer\", \"Assistant Graphic Designer\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,3,'2025-05-01 09:53:36','2025-05-01 09:53:36',0),(20,2,'HR Executive','full_time','Bangalore, India','onsite','4 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',0,'Call',3,'[\"Junior Sales Manager\", \"Assistant Graphic Designer\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,3,'2025-05-01 09:53:36','2025-05-01 09:53:36',0),(21,2,'Graphic Designer','freelance','Mumbai, India','remote','14 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',1,'Call',2,'[\"Junior Backend Developer\", \"Assistant Content Writer\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,9,'2025-05-01 09:53:36','2025-05-01 09:53:36',0),(22,1,'Backend Developer','internship','Pune, India','onsite','6 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',0,'Call',4,'[\"Junior Digital Marketer\", \"Assistant Customer Support Executive\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,7,'2025-05-01 09:53:36','2025-05-01 09:53:36',0),(23,1,'Digital Marketer','part_time','Mumbai, India','remote','4 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',1,'Call',0,'[\"Junior Sales Manager\", \"Assistant HR Executive\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,5,'2025-05-01 09:53:36','2025-05-01 09:53:36',0),(24,1,'HR Executive','part_time','Chennai, India','hybrid','10 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',0,'Call',0,'[\"Junior Customer Support Executive\", \"Assistant Backend Developer\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,2,'2025-05-01 09:53:36','2025-05-01 09:53:36',0),(25,1,'Digital Marketer','freelance','Hyderabad, India','remote','16 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',1,'Call',2,'[\"Junior Frontend Developer\", \"Assistant Content Writer\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,4,'2025-05-01 09:53:36','2025-05-01 09:53:36',0),(26,2,'Graphic Designer','full_time','Hyderabad, India','remote','15 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',0,'Call',1,'[\"Junior Software Developer\", \"Assistant Frontend Developer\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,6,'2025-05-01 09:53:36','2025-05-01 09:53:36',0),(27,2,'Backend Developer','freelance','Pune, India','remote','5 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',1,'Call',2,'[\"Junior Content Writer\", \"Assistant Backend Developer\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,3,'2025-05-01 09:53:36','2025-05-01 09:53:36',0),(28,2,'Sales Manager','part_time','Hyderabad, India','onsite','17 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',0,'Call',5,'[\"Junior HR Executive\", \"Assistant Content Writer\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,6,'2025-05-01 09:55:12','2025-05-01 09:55:12',0),(29,1,'Frontend Developer','part_time','Mumbai, India','remote','6 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',0,'Call',4,'[\"Junior Content Writer\", \"Assistant Digital Marketer\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,10,'2025-05-01 09:55:12','2025-05-01 09:55:12',0),(30,1,'Graphic Designer','full_time','Mumbai, India','onsite','10 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',0,'Call',2,'[\"Junior Backend Developer\", \"Assistant Network Engineer\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,8,'2025-05-01 09:55:12','2025-05-01 09:55:12',0),(31,2,'Graphic Designer','full_time','Hyderabad, India','remote','4 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',0,'Call',3,'[\"Junior Sales Manager\", \"Assistant HR Executive\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,7,'2025-05-01 09:55:12','2025-05-01 09:55:12',0),(32,1,'Backend Developer','freelance','Bangalore, India','onsite','19 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',1,'Call',0,'[\"Junior Digital Marketer\", \"Assistant Business Analyst\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,10,'2025-05-01 09:55:12','2025-05-01 09:55:12',0),(33,2,'Graphic Designer','internship','Hyderabad, India','remote','4 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',0,'Call',1,'[\"Junior Backend Developer\", \"Assistant Customer Support Executive\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,3,'2025-05-01 09:55:12','2025-05-01 09:55:12',0),(34,2,'HR Executive','full_time','Mumbai, India','onsite','12 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',0,'Call',5,'[\"Junior Sales Manager\", \"Assistant Graphic Designer\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,7,'2025-05-01 09:55:12','2025-05-01 09:55:12',0),(35,1,'Customer Support Executive','internship','Mumbai, India','onsite','3 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',0,'Call',1,'[\"Junior Customer Support Executive\", \"Assistant Business Analyst\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,5,'2025-05-01 09:55:12','2025-05-01 09:55:12',0),(36,2,'Frontend Developer','freelance','Mumbai, India','hybrid','12 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',0,'Call',1,'[\"Junior Graphic Designer\", \"Assistant Digital Marketer\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,3,'2025-05-01 09:55:12','2025-05-01 09:55:12',0),(37,2,'Frontend Developer','part_time','Bangalore, India','remote','15 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',1,'Call',4,'[\"Junior Backend Developer\", \"Assistant Network Engineer\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,1,'2025-05-01 09:55:12','2025-05-01 09:55:12',0),(38,1,'QA Tester','full_time','Chennai, India','remote','12 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',1,'Call',3,'[\"Junior Backend Developer\", \"Assistant HR Executive\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,8,'2025-05-01 09:55:12','2025-05-01 09:55:12',0),(39,1,'Network Engineer','freelance','Pune, India','remote','5 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',1,'Call',0,'[\"Junior Network Engineer\", \"Assistant Backend Developer\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,4,'2025-05-01 09:55:12','2025-05-01 09:55:12',0),(40,1,'Sales Manager','freelance','Bangalore, India','onsite','17 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',0,'Call',3,'[\"Junior Content Writer\", \"Assistant Software Developer\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,3,'2025-05-01 09:55:12','2025-05-01 09:55:12',0),(41,2,'Backend Developer','freelance','Pune, India','hybrid','16 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',0,'Call',1,'[\"Junior Business Analyst\", \"Assistant Business Analyst\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,2,'2025-05-01 09:55:12','2025-05-01 09:55:12',0),(42,2,'QA Tester','freelance','Mumbai, India','remote','20 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',1,'Call',2,'[\"Junior Graphic Designer\", \"Assistant Frontend Developer\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,8,'2025-05-01 09:55:12','2025-05-01 09:55:12',0),(43,2,'Content Writer','part_time','Chennai, India','onsite','4 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',0,'Call',5,'[\"Junior Graphic Designer\", \"Assistant Sales Manager\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,10,'2025-05-01 09:55:12','2025-05-01 09:55:12',0),(44,1,'Backend Developer','part_time','Mumbai, India','remote','18 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',0,'Call',0,'[\"Junior Sales Manager\", \"Assistant Network Engineer\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,1,'2025-05-01 09:55:12','2025-05-23 12:23:01',1),(45,1,'QA Tester','freelance','Pune, India','onsite','13 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',0,'Call',1,'[\"Junior Content Writer\", \"Assistant QA Tester\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,8,'2025-05-01 09:55:28','2025-05-23 12:23:00',1),(46,1,'Digital Marketer','freelance','Mumbai, India','remote','16 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',1,'Call',3,'[\"Junior Digital Marketer\", \"Assistant Business Analyst\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,10,'2025-05-01 09:55:28','2025-05-23 12:22:58',1),(47,1,'Network Engineer','freelance','Pune, India','remote','9 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',1,'Call',1,'[\"Junior Backend Developer\", \"Assistant Graphic Designer\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,3,'2025-05-01 09:55:28','2025-05-23 12:22:57',1),(48,1,'Network Engineer','full_time','Hyderabad, India','onsite','5 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',1,'Call',4,'[\"Junior Sales Manager\", \"Assistant Customer Support Executive\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,6,'2025-05-01 09:55:28','2025-05-23 12:22:55',1),(49,2,'Backend Developer','internship','Pune, India','remote','10 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',0,'Call',2,'[\"Junior Business Analyst\", \"Assistant Frontend Developer\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,2,'2025-05-01 09:55:28','2025-05-23 12:22:55',1),(50,2,'HR Executive','internship','Chennai, India','hybrid','7 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',1,'Call',3,'[\"Junior Software Developer\", \"Assistant Graphic Designer\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,1,'2025-05-01 09:55:28','2025-05-23 12:22:53',1),(51,1,'Customer Support Executive','internship','Pune, India','remote','3 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',0,'Call',4,'[\"Junior Content Writer\", \"Assistant Graphic Designer\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,7,'2025-05-01 09:55:28','2025-05-23 12:22:51',1),(52,2,'Software Developer','full_time','Chennai, India','hybrid','16 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',0,'Call',5,'[\"Junior Software Developer\", \"Assistant Digital Marketer\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,2,'2025-05-01 09:55:28','2025-05-23 12:22:50',1),(53,2,'Digital Marketer','part_time','Mumbai, India','onsite','8 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',1,'Call',4,'[\"Junior Business Analyst\", \"Assistant Business Analyst\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,3,'2025-05-01 09:55:28','2025-05-23 12:22:49',1),(54,2,'Sales Manager','freelance','Hyderabad, India','hybrid','11 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',0,'Call',3,'[\"Junior Sales Manager\", \"Assistant Business Analyst\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,7,'2025-05-01 09:55:28','2025-05-23 12:22:49',1),(55,2,'Content Writer','internship','Mumbai, India','hybrid','9 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',0,'Call',5,'[\"Junior Business Analyst\", \"Assistant Content Writer\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,2,'2025-05-01 09:55:28','2025-05-23 12:22:48',1),(56,1,'Customer Support Executive','freelance','Pune, India','hybrid','15 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',1,'Call',2,'[\"Junior QA Tester\", \"Assistant HR Executive\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,2,'2025-05-01 09:55:28','2025-05-23 12:22:47',1),(57,2,'Business Analyst','full_time','Bangalore, India','remote','10 LPA','Hourly',0,'Basic knowledge of the domain, strong communication skills.','[\"Team player\", \"Problem-solving skills\"]',1,'Call',3,'[\"Junior Network Engineer\", \"Assistant Software Developer\"]','[\"B.Tech\", \"MBA\", \"B.Sc IT\"]','We are looking for a passionate individual to join our team.',7,2,'2025-05-01 09:55:28','2025-05-23 12:22:46',1),(58,1,'Software Engineer','Full-Time','New York','Hybrid','100000','Salary',0,'5+ years of experience, proficient in PHP','\"{\\\"skills\\\": [\\\"Laravel\\\", \\\"MySQL\\\"]}\"',0,'No Preference',5,'\"[\\\"Backend Developer\\\", \\\"Full Stack Developer\\\"]\"','\"[\\\"Computer Science\\\", \\\"Information Technology\\\"]\"','Develop and maintain web applications.',14,2,'2025-05-13 10:41:13','2025-05-23 12:22:45',1),(63,23,'tt3t3t','Full-Time','ef3fg','Work from Home','20000-19998','Salary',0,'gtrgt','\"[\\\"rtg\\\"]\"',0,'No Preference',0,'\"[\\\"Software Engineer\\\",\\\"Designer\\\"]\"','\"[\\\"High School\\\"]\"','rgrg',22,22,'2025-05-21 11:31:58','2025-05-23 12:22:44',1),(64,24,'fwf','Full-Time','Mohali','Work from Home','100000-1998','Hourly',0,'frw','\"[\\\"frrf\\\"]\"',0,'No Preference',0,'\"[\\\"Software Engineer\\\"]\"','\"[\\\"High School\\\"]\"','ewfr',10,100,'2025-05-21 12:06:36','2025-05-21 12:19:53',1),(65,24,'qawestdryftuyg','Full-Time','estrdtyfu','Work from Home','123456-123456','Hourly',0,'huouo','\"[\\\"gy\\\"]\"',0,'Call',0,'\"[\\\"Software Engineer\\\"]\"','\"[\\\"High School\\\"]\"','h',55,7,'2025-05-21 12:27:05','2025-05-23 12:22:43',1),(66,24,'qawestdryftuyg','Full-Time','estrdtyfu','Work from Home','123456-123456','Hourly',0,'huouo','\"[\\\"gy\\\"]\"',0,'Call',0,'\"[\\\"Software Engineer\\\"]\"','\"[\\\"High School\\\"]\"','h',55,7,'2025-05-21 12:27:19','2025-05-23 12:22:42',1),(67,24,'qawestdryftuyg','Full-Time','estrdtyfu','Work from Home','123456-123456','Hourly',0,'huouo','\"[\\\"gy\\\"]\"',0,'Call',0,'\"[\\\"Software Engineer\\\"]\"','\"[\\\"High School\\\"]\"','h',55,7,'2025-05-21 12:27:55','2025-05-23 12:22:40',1),(68,24,'qawestdryftuyg','Full-Time','estrdtyfu','Work from Home','123456-123456','Hourly',0,'huouo','\"[\\\"gy\\\"]\"',0,'Call',0,'\"[\\\"Software Engineer\\\"]\"','\"[\\\"High School\\\"]\"','h',55,7,'2025-05-21 12:28:27','2025-05-23 12:22:40',1),(69,24,'qawestdryftuyg','Full-Time','estrdtyfu','Work from Home','123456-123456','Hourly',0,'huouo','\"[\\\"gy\\\"]\"',0,'Call',0,'\"[\\\"Software Engineer\\\"]\"','\"[\\\"High School\\\"]\"','h',55,7,'2025-05-21 12:30:49','2025-05-23 12:22:39',1),(70,24,'qawestdryftuyg','Full-Time','estrdtyfu','Work from Home','123456-123456','Hourly',0,'huouo','\"[\\\"gy\\\"]\"',0,'Call',0,'\"[\\\"Software Engineer\\\"]\"','\"[\\\"High School\\\"]\"','h',55,7,'2025-05-21 12:32:15','2025-05-23 12:22:38',1),(71,24,'qawestdryftuyg','Full-Time','estrdtyfu','Work from Home','123456-123456','Hourly',0,'huouo','\"[\\\"gy\\\"]\"',0,'Call',0,'\"[\\\"Software Engineer\\\"]\"','\"[\\\"High School\\\"]\"','h',55,7,'2025-05-21 12:32:56','2025-05-23 12:22:37',1),(72,25,'cdwfrw','Full-Time','Ambala','Work from Home','2100-5000','Salary',0,'fr3f3f','\"[\\\"fr42\\\"]\"',0,'No Preference',3,'\"[\\\"Designer\\\"]\"','\"[\\\"High School\\\"]\"','efr4r4',20,10,'2025-05-23 10:49:57','2025-05-23 12:22:36',1),(73,31,'Full Stack developer','Freelance','ambala Cantt','Work from Home','20000-30000','Salary',0,'null','\"[\\\"CSS\\\",\\\"JavaScript\\\",\\\"Laravel\\\",\\\"Node.js\\\"]\"',0,'Call',10,'\"[\\\"Product Manager\\\"]\"','\"[\\\"Bachelor\'s Degree\\\"]\"','aesrdytfuygiuhoij',10,10,'2025-05-29 12:05:04','2025-05-29 12:05:04',0);
/*!40000 ALTER TABLE `job_postings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2025_04_23_151109_create_candidates_table',1),(5,'2025_04_23_151408_create_candidate_educations_table',1),(6,'2025_04_23_151430_create_candidate_experiences_table',1),(7,'2025_04_23_151453_create_candidate_skills_table',1),(8,'2025_04_23_151541_create_candidate_languages_table',1),(9,'2025_04_23_154810_create_employers_table',1),(10,'2025_04_23_154855_create_job_postings_table',1),(11,'2025_04_23_155959_create_job_posting_applications_table',1),(12,'2025_04_26_071329_alter_job_type_column_in_job_postings_table',1),(13,'2025_04_26_071434_alter_work_location_type_column_in_job_postings_table',1),(14,'2025_04_26_073057_modify_status_column_in_job_posting_applications_table',1),(15,'2025_04_27_054200_add_otp_fields_to_candidates_table',1),(16,'2025_04_27_105808_create_personal_access_tokens_table',1),(17,'2025_04_27_110508_make_full_name_nullable_in_candidates_table',2),(18,'2025_05_01_152249_add_candidate_id_to_job_posting_applications_table',3),(19,'2025_05_10_123509_add_fields_to_employers_table',4),(20,'2025_05_10_123600_create_companies_table',5),(21,'2025_05_10_123954_add_auth_fields_to_employers_table',6),(22,'2025_05_10_124815_add_is_blocked_to_employers_table',7),(23,'add_session_token_to_employers_table',8),(24,'2025_05_11_065811_create_otp_verifications_table',9),(25,'2025_05_26_163832_add_gst_and_pan_to_employers_table',10);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `otp_verifications`
--

DROP TABLE IF EXISTS `otp_verifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `otp_verifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `otp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `otp_verifications`
--

LOCK TABLES `otp_verifications` WRITE;
/*!40000 ALTER TABLE `otp_verifications` DISABLE KEYS */;
INSERT INTO `otp_verifications` VALUES (2,'manshu.develoepr@gmail.com','648666','2025-05-26 09:54:53','2025-05-11 02:04:03','2025-05-26 09:44:53'),(6,'manshu.developer@gmail.com','797835','2025-06-09 10:48:45','2025-05-12 08:48:44','2025-06-09 10:38:45'),(7,'masnhu.developer@gmail.com','902966','2025-05-12 09:02:37','2025-05-12 08:52:37','2025-05-12 08:52:37'),(8,'manshusmartboy@gmail.com','665339','2025-05-26 10:16:55','2025-05-14 10:41:56','2025-05-26 10:06:55'),(9,'mehrahimanshu50@gmail.com','269859','2025-06-07 00:58:06','2025-05-14 10:43:07','2025-06-07 00:48:06'),(10,'manshu.smartboy@gmail.com','768558','2025-05-21 11:38:59','2025-05-21 11:28:59','2025-05-21 11:28:59'),(11,'oicglobal9669@gmail.com','351381','2025-06-02 11:04:27','2025-06-02 10:54:27','2025-06-02 10:54:27');
/*!40000 ALTER TABLE `otp_verifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\Employer',17,'EmployerToken','f74bad65e79ae1f4fdbd19010c16b23bb792d120bc4a4aa7fca219fdaa71a2b6','[\"*\"]','2025-05-12 09:26:12',NULL,'2025-05-12 09:02:13','2025-05-12 09:26:12'),(2,'App\\Models\\Employer',18,'EmployerToken','9e360889ea7d0bff7e2264fd705197b7bfb383d56f08ecb255adf337528e5b1b','[\"*\"]','2025-05-13 10:31:54',NULL,'2025-05-13 08:46:59','2025-05-13 10:31:54'),(3,'App\\Models\\Employer',19,'EmployerToken','f8f6d61be50afa4fbc707141d6cdde015b1f3ce2c805a01f6d329acebd35bc97','[\"*\"]','2025-05-14 10:31:15',NULL,'2025-05-14 09:37:03','2025-05-14 10:31:15'),(4,'App\\Models\\Employer',20,'EmployerToken','044fca0dc565cda65b7d8b50fbd836349a1c630d9044f29e319f7aa350fa9f58','[\"*\"]','2025-05-16 10:04:57',NULL,'2025-05-15 08:11:57','2025-05-16 10:04:57'),(5,'App\\Models\\Employer',21,'EmployerToken','8cf1add6f02e7d5a22437fd9e8235d9ec2a793eb0ef09bcc5c7569e010deb355','[\"*\"]','2025-05-18 01:09:33',NULL,'2025-05-17 23:47:17','2025-05-18 01:09:33'),(6,'App\\Models\\Employer',22,'EmployerToken','f33c4b68bc589f61d75c049b7c869dbc2973baae2ff909240d72fe35bd5fd980','[\"*\"]','2025-05-21 11:17:12',NULL,'2025-05-21 11:10:24','2025-05-21 11:17:12'),(7,'App\\Models\\Employer',23,'EmployerToken','33b48b2bef0a0d35ceda5e14d1a1e34b635c63d5bcc7e3bd1aa6e2692db9a99c','[\"*\"]','2025-05-21 11:34:35',NULL,'2025-05-21 11:30:17','2025-05-21 11:34:35'),(8,'App\\Models\\Employer',24,'EmployerToken','99aa33a0a977d9d202fbde457432330a383eda651fa739aab28876a4e499b542','[\"*\"]','2025-05-23 10:37:29',NULL,'2025-05-21 11:47:37','2025-05-23 10:37:29'),(9,'App\\Models\\Employer',25,'EmployerToken','6cd334ffad222b8cf579d8b209908c39945cfd4fc894e2facf222b87f26f94f5','[\"*\"]','2025-05-23 10:50:17',NULL,'2025-05-23 10:47:13','2025-05-23 10:50:17'),(10,'App\\Models\\Employer',26,'EmployerToken','c1dadafa5fcf0d7057fcf7e7203f4123895bf4927702a3a0ee2d0752097e1c58','[\"*\"]','2025-05-23 12:26:04',NULL,'2025-05-23 12:25:40','2025-05-23 12:26:04'),(11,'App\\Models\\Employer',27,'EmployerToken','b2e7dfed1b9479c453033ece92f86549ef53cd7501ccabc82583fa620c884750','[\"*\"]','2025-05-26 09:52:16',NULL,'2025-05-26 09:50:48','2025-05-26 09:52:16'),(12,'App\\Models\\Employer',28,'EmployerToken','ce7575a65fa1ddd7207a5cc6da2297d143eaea2e4ceddda1a060304662dcbb11','[\"*\"]','2025-05-26 10:04:01',NULL,'2025-05-26 10:02:46','2025-05-26 10:04:01'),(13,'App\\Models\\Employer',28,'EmployerToken','e29e67bd1fd61da7fe537e1394f33b2a5c220726a15aa1f32c3e7674423c8d34','[\"*\"]','2025-05-26 10:06:08',NULL,'2025-05-26 10:05:50','2025-05-26 10:06:08'),(14,'App\\Models\\Employer',28,'EmployerToken','8c947b79e7a1657a0d890dd8f6628a1288c5eb4c3d5986e503a71ddcd433b2d3','[\"*\"]','2025-05-26 10:06:38',NULL,'2025-05-26 10:06:35','2025-05-26 10:06:38'),(15,'App\\Models\\Employer',23,'EmployerToken','af213453a7b22650d2338ae113f856c22285267ba0973afb7ebaf0eedfd27fe7','[\"*\"]','2025-05-26 10:08:14',NULL,'2025-05-26 10:07:12','2025-05-26 10:08:14'),(16,'App\\Models\\Employer',29,'EmployerToken','edb1a4a40fb30b3dfa387d0394c87653fd5433cccd61a79486acd154e561382a','[\"*\"]','2025-05-26 11:21:13',NULL,'2025-05-26 11:20:20','2025-05-26 11:21:13'),(17,'App\\Models\\Employer',30,'EmployerToken','9eb526be5c3f2208d3b829de55e3c8681e3134258795dca65da93e3a4f87e140','[\"*\"]','2025-05-26 11:36:36',NULL,'2025-05-26 11:26:53','2025-05-26 11:36:36'),(18,'App\\Models\\Employer',31,'EmployerToken','e6aada19441b580eaba9c879cc0692c843843a3d3842362f4591091170be9c1b','[\"*\"]','2025-05-27 11:40:08',NULL,'2025-05-26 11:40:33','2025-05-27 11:40:08'),(19,'App\\Models\\Employer',32,'EmployerToken','8ac4e1f642b09a1a8059eba3fb98f2628ac1737fc6eb1a1dcb5f83bf8909c6e4','[\"*\"]','2025-05-27 11:43:30',NULL,'2025-05-27 11:43:18','2025-05-27 11:43:30'),(20,'App\\Models\\Employer',31,'EmployerToken','e182b96fadcf1a4fd8cca69b034460dab127375985c5b93405e57fcff0b17602','[\"*\"]','2025-05-27 12:03:58',NULL,'2025-05-27 11:44:27','2025-05-27 12:03:58'),(21,'App\\Models\\Employer',32,'EmployerToken','bf0b7e57dbe36d240eddfa0f3f4ed3e325c94504beccffb4fb3de2634b8a2c79','[\"*\"]','2025-05-28 11:52:07',NULL,'2025-05-28 11:23:01','2025-05-28 11:52:07'),(22,'App\\Models\\Employer',32,'EmployerToken','ba428298aee4e20b4f86ba2e22e17aa90442c50b99bc180013c08254b6bbbde0','[\"*\"]','2025-05-29 10:14:57',NULL,'2025-05-29 09:57:04','2025-05-29 10:14:57'),(23,'App\\Models\\Employer',31,'EmployerToken','164f686573481e7e2ad19b0b7f58d77317c7d4cb7aaad82f8b22bcd3e7e060cc','[\"*\"]','2025-06-06 11:18:19',NULL,'2025-05-29 11:16:38','2025-06-06 11:18:19'),(24,'App\\Models\\Employer',33,'EmployerToken','7e376955928a6147e58c4742a166ef73268ed0262a1a054fd8b79ec2493d8f04','[\"*\"]','2025-06-02 11:38:50',NULL,'2025-06-02 10:55:19','2025-06-02 11:38:50'),(25,'App\\Models\\Employer',32,'EmployerToken','30ae2e8804d43830836929a0e9c24628d29a61a49e604588e308d507658a7ffb','[\"*\"]','2025-06-07 00:39:30',NULL,'2025-06-06 11:36:40','2025-06-07 00:39:30'),(26,'App\\Models\\Employer',31,'EmployerToken','fb5f9a80000c7f6ca03186ae34a3adadb0254ebf989730bf8ca504b48d36a0af','[\"*\"]','2025-06-07 00:48:30',NULL,'2025-06-07 00:48:27','2025-06-07 00:48:30'),(30,'App\\Models\\Employer',34,'EmployerToken','90ce5f1e9e27e0e26d7bc13f828d7a6ffa6b4c05757e46fed0874aaae4a12258','[\"*\"]',NULL,NULL,'2025-06-09 10:34:27','2025-06-09 10:34:27'),(31,'App\\Models\\Employer',34,'EmployerToken','28c70990b1ffec335eff4e3202774cdb9352a3abedad2210098b395c8e16b0a5','[\"*\"]','2025-06-09 10:39:30',NULL,'2025-06-09 10:39:21','2025-06-09 10:39:30');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('4VaBjpHxaQkFfzWhhROJViI3NAxjg5GP927xh5wB',1,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTo2OntzOjY6Il90b2tlbiI7czo0MDoiOVNSU2E0TVFkQnRyRU9WUnZ2UzRDMjJqVG05ZkFvZnVCUzJIOThNbyI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYWRtaW4vZW1wbG95ZXJzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEyJExpQ2MvV0tuY0c1ZFNhNU9pc204cU9oTFp5dm13ODN0UDdrMzRmUEt3VFEzNm44MVhzYUNtIjt9',1751791621);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin@mail.com',NULL,'$2y$12$LiCc/WKncG5dSa5Oism8qOhLZyvmw83tP7k34fPKwTQ36n81XsaCm','j7HAVTEd43QkWSHm4kzTHi6a3x6I1LqlwZfnpz6xmTP9sEuegD31V9NXxkZ4','2025-05-01 09:56:07','2025-05-01 09:56:07');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-06 14:17:33
