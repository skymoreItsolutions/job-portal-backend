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
-- Table structure for table `breezy_sessions`
--

DROP TABLE IF EXISTS `breezy_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `breezy_sessions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `authenticatable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `authenticatable_id` bigint unsigned NOT NULL,
  `panel_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guard` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `expires_at` timestamp NULL DEFAULT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `breezy_sessions_authenticatable_type_authenticatable_id_index` (`authenticatable_type`,`authenticatable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `breezy_sessions`
--

LOCK TABLES `breezy_sessions` WRITE;
/*!40000 ALTER TABLE `breezy_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `breezy_sessions` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `cache` VALUES ('laravel_cache_backup-statuses','a:1:{i:0;a:8:{s:2:\"id\";i:0;s:4:\"name\";s:7:\"Laravel\";s:4:\"disk\";s:5:\"local\";s:9:\"reachable\";b:1;s:7:\"healthy\";b:1;s:6:\"amount\";i:1;s:6:\"newest\";s:11:\"2 hours ago\";s:11:\"usedStorage\";s:8:\"39.97 MB\";}}',1752735492),('laravel_cache_backups-local','a:1:{i:0;a:4:{s:4:\"disk\";s:5:\"local\";s:4:\"path\";s:42:\"Laravel/only-files-2025-07-17-04-34-39.zip\";s:4:\"date\";s:19:\"2025-07-17 04:34:40\";s:4:\"size\";s:8:\"39.97 MB\";}}',1752735492),('laravel_cache_livewire-rate-limiter:a17961fa74e9275d529f489537f179c05d50c2f3','i:1;',1752849698),('laravel_cache_livewire-rate-limiter:a17961fa74e9275d529f489537f179c05d50c2f3:timer','i:1752849698;',1752849698),('laravel_cache_spatie.permission.cache','a:3:{s:5:\"alias\";a:4:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:10:\"guard_name\";s:1:\"r\";s:5:\"roles\";}s:11:\"permissions\";a:66:{i:0;a:4:{s:1:\"a\";i:1;s:1:\"b\";s:14:\"view_candidate\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:1;a:4:{s:1:\"a\";i:2;s:1:\"b\";s:18:\"view_any_candidate\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:2;a:4:{s:1:\"a\";i:3;s:1:\"b\";s:16:\"create_candidate\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:3;a:4:{s:1:\"a\";i:4;s:1:\"b\";s:16:\"update_candidate\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:4;a:4:{s:1:\"a\";i:5;s:1:\"b\";s:17:\"restore_candidate\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:5;a:4:{s:1:\"a\";i:6;s:1:\"b\";s:21:\"restore_any_candidate\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:6;a:4:{s:1:\"a\";i:7;s:1:\"b\";s:19:\"replicate_candidate\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:7;a:4:{s:1:\"a\";i:8;s:1:\"b\";s:17:\"reorder_candidate\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:8;a:4:{s:1:\"a\";i:9;s:1:\"b\";s:16:\"delete_candidate\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:9;a:4:{s:1:\"a\";i:10;s:1:\"b\";s:20:\"delete_any_candidate\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:10;a:4:{s:1:\"a\";i:11;s:1:\"b\";s:22:\"force_delete_candidate\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:11;a:4:{s:1:\"a\";i:12;s:1:\"b\";s:26:\"force_delete_any_candidate\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:12;a:4:{s:1:\"a\";i:13;s:1:\"b\";s:12:\"view_company\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:13;a:4:{s:1:\"a\";i:14;s:1:\"b\";s:16:\"view_any_company\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:14;a:4:{s:1:\"a\";i:15;s:1:\"b\";s:14:\"create_company\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:15;a:4:{s:1:\"a\";i:16;s:1:\"b\";s:14:\"update_company\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:16;a:4:{s:1:\"a\";i:17;s:1:\"b\";s:15:\"restore_company\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:17;a:4:{s:1:\"a\";i:18;s:1:\"b\";s:19:\"restore_any_company\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:18;a:4:{s:1:\"a\";i:19;s:1:\"b\";s:17:\"replicate_company\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:19;a:4:{s:1:\"a\";i:20;s:1:\"b\";s:15:\"reorder_company\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:20;a:4:{s:1:\"a\";i:21;s:1:\"b\";s:14:\"delete_company\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:21;a:4:{s:1:\"a\";i:22;s:1:\"b\";s:18:\"delete_any_company\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:22;a:4:{s:1:\"a\";i:23;s:1:\"b\";s:20:\"force_delete_company\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:23;a:4:{s:1:\"a\";i:24;s:1:\"b\";s:24:\"force_delete_any_company\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:24;a:4:{s:1:\"a\";i:25;s:1:\"b\";s:13:\"view_employer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:25;a:4:{s:1:\"a\";i:26;s:1:\"b\";s:17:\"view_any_employer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:26;a:4:{s:1:\"a\";i:27;s:1:\"b\";s:15:\"create_employer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:27;a:4:{s:1:\"a\";i:28;s:1:\"b\";s:15:\"update_employer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:28;a:4:{s:1:\"a\";i:29;s:1:\"b\";s:16:\"restore_employer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:29;a:4:{s:1:\"a\";i:30;s:1:\"b\";s:20:\"restore_any_employer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:30;a:4:{s:1:\"a\";i:31;s:1:\"b\";s:18:\"replicate_employer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:31;a:4:{s:1:\"a\";i:32;s:1:\"b\";s:16:\"reorder_employer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:32;a:4:{s:1:\"a\";i:33;s:1:\"b\";s:15:\"delete_employer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:33;a:4:{s:1:\"a\";i:34;s:1:\"b\";s:19:\"delete_any_employer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:34;a:4:{s:1:\"a\";i:35;s:1:\"b\";s:21:\"force_delete_employer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:35;a:4:{s:1:\"a\";i:36;s:1:\"b\";s:25:\"force_delete_any_employer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:36;a:4:{s:1:\"a\";i:37;s:1:\"b\";s:17:\"view_job::posting\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:37;a:4:{s:1:\"a\";i:38;s:1:\"b\";s:21:\"view_any_job::posting\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:38;a:4:{s:1:\"a\";i:39;s:1:\"b\";s:19:\"create_job::posting\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:39;a:4:{s:1:\"a\";i:40;s:1:\"b\";s:19:\"update_job::posting\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:40;a:4:{s:1:\"a\";i:41;s:1:\"b\";s:20:\"restore_job::posting\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:41;a:4:{s:1:\"a\";i:42;s:1:\"b\";s:24:\"restore_any_job::posting\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:42;a:4:{s:1:\"a\";i:43;s:1:\"b\";s:22:\"replicate_job::posting\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:43;a:4:{s:1:\"a\";i:44;s:1:\"b\";s:20:\"reorder_job::posting\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:44;a:4:{s:1:\"a\";i:45;s:1:\"b\";s:19:\"delete_job::posting\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:45;a:4:{s:1:\"a\";i:46;s:1:\"b\";s:23:\"delete_any_job::posting\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:46;a:4:{s:1:\"a\";i:47;s:1:\"b\";s:25:\"force_delete_job::posting\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:47;a:4:{s:1:\"a\";i:48;s:1:\"b\";s:29:\"force_delete_any_job::posting\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:48;a:4:{s:1:\"a\";i:49;s:1:\"b\";s:30:\"view_job::posting::application\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:49;a:4:{s:1:\"a\";i:50;s:1:\"b\";s:34:\"view_any_job::posting::application\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:50;a:4:{s:1:\"a\";i:51;s:1:\"b\";s:32:\"create_job::posting::application\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:51;a:4:{s:1:\"a\";i:52;s:1:\"b\";s:32:\"update_job::posting::application\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:52;a:4:{s:1:\"a\";i:53;s:1:\"b\";s:33:\"restore_job::posting::application\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:53;a:4:{s:1:\"a\";i:54;s:1:\"b\";s:37:\"restore_any_job::posting::application\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:54;a:4:{s:1:\"a\";i:55;s:1:\"b\";s:35:\"replicate_job::posting::application\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:55;a:4:{s:1:\"a\";i:56;s:1:\"b\";s:33:\"reorder_job::posting::application\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:56;a:4:{s:1:\"a\";i:57;s:1:\"b\";s:32:\"delete_job::posting::application\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:57;a:4:{s:1:\"a\";i:58;s:1:\"b\";s:36:\"delete_any_job::posting::application\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:58;a:4:{s:1:\"a\";i:59;s:1:\"b\";s:38:\"force_delete_job::posting::application\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:59;a:4:{s:1:\"a\";i:60;s:1:\"b\";s:42:\"force_delete_any_job::posting::application\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:60;a:4:{s:1:\"a\";i:61;s:1:\"b\";s:9:\"view_role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:61;a:4:{s:1:\"a\";i:62;s:1:\"b\";s:13:\"view_any_role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:62;a:4:{s:1:\"a\";i:63;s:1:\"b\";s:11:\"create_role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:63;a:4:{s:1:\"a\";i:64;s:1:\"b\";s:11:\"update_role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:64;a:4:{s:1:\"a\";i:65;s:1:\"b\";s:11:\"delete_role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:65;a:4:{s:1:\"a\";i:66;s:1:\"b\";s:15:\"delete_any_role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}}s:5:\"roles\";a:1:{i:0;a:3:{s:1:\"a\";i:1;s:1:\"b\";s:10:\"Counsellor\";s:1:\"c\";s:3:\"web\";}}}',1752936038);
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
  `job_roles` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidates`
--

LOCK TABLES `candidates` WRITE;
/*!40000 ALTER TABLE `candidates` DISABLE KEYS */;
INSERT INTO `candidates` VALUES (1,'Macie Batz','1976-01-13','Male','tyrel.stark@example.net','708 Wehner Bypass Suite 084\nLake Uriahview, OH 12290-5930','South Hayleyberg','Colorado','BCA','Computer Science','Kertzmann, Ritchie and Brekke College','96%',0,5,11,'Budget Analyst','[\"Manager\", \"Tester\", \"Developer\"]','Wilderman Group',40645.76,'1983-05-19',1,0,0,1,0,'Part-Time','English,Punjabi',NULL,'SQL,Laravel,PHP',1,'2025-05-01 09:51:45',9,6,'2025-05-01 09:51:45','2025-05-01 09:51:45',NULL,NULL,NULL,NULL,NULL,0),(2,'Lucious Von','1976-05-04','Female','kboehm@example.net','9467 Alysa Union Suite 808\nGottliebville, SD 63008-9425','Electamouth','Connecticut','B.Tech','Mechanical','Mertz Inc College','91%',0,2,1,'ccc','[\"Designer\"]','Nikolaus Inc',38668.80,'2019-01-03',0,0,1,0,0,'Intern','Punjabi,Hindi',NULL,'Laravel,PHP,SQL',1,'2025-05-01 09:51:45',7,15,'2025-05-01 09:51:45','2025-05-01 09:51:45',NULL,NULL,NULL,NULL,NULL,0),(3,'Tony Fadel','1973-02-05','Male','kelley78@example.com','333 Labadie Locks\nCaramouth, KS 92290-9170','Concepcionmouth','New York','MCA','Computer Science','Tillman, Steuber and Sawayn College','100%',0,1,8,'Nursing Instructor','[\"Manager\", \"Designer\"]','Vandervort, Bailey and Steuber',11077.17,'2019-08-03',1,0,0,1,1,'Part-Time','English,Hindi',NULL,'JavaScript,PHP,SQL',1,'2025-05-01 09:51:45',7,2,'2025-05-01 09:51:45','2025-05-01 09:51:45',NULL,NULL,NULL,NULL,NULL,0),(4,'Keenan Kozey','1974-07-31','Male','lenora.bechtelar@example.net','873 Jerde Isle\nLake Aileen, MS 19486-6602','Kendrickfort','Michigan','BCA','Mechanical','Baumbach, Kertzmann and Lynch College','100%',1,1,8,'Radio Operator','[\"Manager\", \"Designer\", \"Developer\"]','Schneider Group',35782.11,'1991-01-21',1,1,0,1,1,'Full-Time','Hindi,English',NULL,'PHP,Laravel,JavaScript',1,'2025-05-01 09:51:45',8,3,'2025-05-01 09:51:45','2025-05-01 09:51:45',NULL,NULL,NULL,NULL,NULL,0),(5,'Tavares Macejkovic','1981-12-01','Female','beer.jordyn@example.net','13787 Jaskolski Groves\nJakobfort, IL 53257','Lake Randiton','Oregon','MCA','Computer Science','Boyer PLC College','71%',1,4,8,'Announcer','[\"Manager\", \"Designer\", \"Tester\"]','Kling-Friesen',29069.07,'2000-06-26',0,1,1,1,1,'Full-Time','English,Punjabi',NULL,'Laravel,SQL,JavaScript',1,'2025-05-01 09:51:45',7,10,'2025-05-01 09:51:45','2025-05-01 09:51:45',NULL,NULL,NULL,NULL,NULL,0),(6,'Prof. Marlene Bernier PhD','1982-07-31','Other','jbergnaum@example.net','789 Eleanora Mews\nKohlerborough, WI 69294-2536','Virginieton','District of Columbia','MCA','Mechanical','Weissnat, VonRueden and Schiller College','84%',1,0,4,'Cartoonist','[\"Tester\"]','Greenholt-Haag',43439.82,'1977-08-03',0,1,1,0,1,'Full-Time','English,Hindi',NULL,'Laravel,JavaScript,SQL',1,'2025-05-01 09:51:45',1,3,'2025-05-01 09:51:45','2025-05-01 09:51:45',NULL,NULL,NULL,NULL,NULL,0),(7,'Mrs. Gina Fahey IV','1995-11-25','Male','srice@example.net','5013 Sydney Islands Apt. 134\nEast Vellashire, FL 07154','Cristville','Pennsylvania','BCA','Mechanical','Mann Inc College','70%',1,5,10,'Healthcare Practitioner','[\"Tester\", \"Designer\", \"Manager\"]','Hackett, Beatty and Ondricka',28610.64,'2014-03-25',0,0,1,0,0,'Full-Time','Hindi,English',NULL,'SQL,JavaScript,React',1,'2025-05-01 09:51:45',2,2,'2025-05-01 09:51:45','2025-05-01 09:51:45',NULL,NULL,NULL,NULL,NULL,0),(8,'Prof. Kristian Dooley','1977-06-04','Female','will.maryse@example.net','9704 Green Valleys Apt. 713\nNorth Isai, OK 79211','West Angelita','Texas','MCA','Mechanical','Zemlak Inc College','95%',1,2,2,'Accountant','[\"Manager\", \"Designer\"]','Kuvalis, McGlynn and Cruickshank',45193.82,'1984-07-24',1,0,1,0,0,'Intern','Hindi,English',NULL,'PHP,SQL,React',1,'2025-05-01 09:51:45',2,10,'2025-05-01 09:51:45','2025-05-01 09:51:45',NULL,NULL,NULL,NULL,NULL,0),(9,'Georgette Bogan','1999-03-29','Other','rollin44@example.com','225 Fritz Curve\nKarliefort, IN 90542-3603','New Kareemfurt','West Virginia','BCA','Computer Science','Hackett, Kunde and Windler College','72%',1,2,5,'Medical Laboratory Technologist','[\"Designer\"]','Orn-Durgan',17871.46,'1994-10-04',0,0,0,0,1,'Intern','English,Hindi',NULL,'Laravel,SQL,PHP',1,'2025-05-01 09:51:45',10,0,'2025-05-01 09:51:45','2025-05-01 09:51:45',NULL,NULL,NULL,NULL,NULL,0),(10,'Dr. Donavon Huel','1975-03-29','Other','addie59@example.net','19567 Denis Lodge Apt. 818\nSouth Gladys, MI 54660','Laronchester','Virginia','BCA','Computer Science','Schowalter, Ziemann and McKenzie College','79%',1,3,7,'Real Estate Sales Agent','[\"Designer\"]','Gaylord-O\'Hara',18029.23,'2025-04-12',0,0,0,0,1,'Full-Time','Punjabi,English',NULL,'JavaScript,Laravel,PHP',1,'2025-05-01 09:51:45',6,17,'2025-05-01 09:51:45','2025-05-01 09:51:45',NULL,NULL,NULL,NULL,NULL,0),(11,'Wilton Rogahn','1976-12-09','Female','xfarrell@example.org','4154 Dicki Bypass\nSchuppeshire, MN 34927','South Marlen','Mississippi','M.Tech','Computer Science','Hagenes, Simonis and Boehm College','83%',0,4,4,'Construction Driller','[\"Manager\", \"Tester\", \"Developer\"]','Turcotte, Johns and Bogan',22575.41,'2007-01-02',0,0,0,0,0,'Part-Time','English,Punjabi',NULL,'PHP,Laravel,SQL',1,'2025-05-01 09:51:45',6,12,'2025-05-01 09:51:45','2025-05-01 09:51:45',NULL,NULL,NULL,NULL,NULL,0),(12,'Josefina Boehm','1995-10-10','Other','kgleichner@example.org','617 Prosacco Green Apt. 474\nSipesburgh, AL 83758-5393','West Guidoview','Wisconsin','MCA','Mechanical','Schulist, Shields and Grant College','60%',0,0,1,'Payroll Clerk','[\"Manager\", \"Developer\", \"Designer\"]','Bins, Kunze and Rippin',35297.04,'2004-12-01',1,0,1,0,1,'Full-Time','Hindi,Punjabi',NULL,'SQL,Laravel,PHP',1,'2025-05-01 09:51:45',8,19,'2025-05-01 09:51:45','2025-05-01 09:51:45',NULL,NULL,NULL,NULL,NULL,0),(13,'Prof. Jermain Wiegand','1981-04-12','Male','rveum@example.net','59115 Keebler Ports\nMuraziktown, CO 79614','Koelpinshire','New York','MCA','Mechanical','Crist Group College','66%',0,4,1,'Nuclear Monitoring Technician','[\"Designer\", \"Manager\", \"Developer\"]','Stamm, Bergnaum and O\'Kon',23817.92,'2017-06-24',0,0,0,1,0,'Full-Time','Punjabi,English',NULL,'Laravel,React,SQL',1,'2025-05-01 09:51:45',0,1,'2025-05-01 09:51:45','2025-05-01 09:51:45',NULL,NULL,NULL,NULL,NULL,0),(14,'Prof. Emery Lebsack','1981-03-16','Other','schultz.pierce@example.net','3682 Drew Island Apt. 043\nRowanfurt, MI 37492','Port Viva','Wisconsin','BCA','Electronics','Waters-Keebler College','74%',1,4,3,'Actor','[\"Designer\", \"Manager\"]','Denesik Group',25685.33,'2018-08-17',0,1,0,1,1,'Part-Time','Punjabi,Hindi',NULL,'JavaScript,SQL,PHP',1,'2025-05-01 09:51:45',8,6,'2025-05-01 09:51:45','2025-05-01 09:51:45',NULL,NULL,NULL,NULL,NULL,0),(15,'Dr. Toby Trantow','1989-10-29','Male','rath.broderick@example.net','966 Mueller Pike\nHintzside, DC 26983','South Adella','Indiana','B.Tech','Computer Science','Runolfsson LLC College','91%',1,1,1,'Customer Service Representative','[\"Developer\", \"Designer\", \"Tester\"]','Mertz-McCullough',17948.75,'1995-08-20',0,1,0,0,1,'Full-Time','Punjabi,English',NULL,'PHP,React,SQL',1,'2025-05-01 09:51:45',7,4,'2025-05-01 09:51:45','2025-05-01 09:51:45',NULL,NULL,NULL,NULL,NULL,0),(16,'Miss Selina Spencer','1975-11-20','Female','emiliano80@example.com','663 Catalina Wells\nPort Timmothy, MN 55551-7308','Port Novella','Arkansas','M.Tech','Electronics','Fritsch, Waters and Lowe College','90%',1,5,1,'Tool Set-Up Operator','[\"Tester\", \"Manager\", \"Designer\"]','Monahan and Sons',24293.36,'1996-09-12',1,1,1,1,0,'Part-Time','Hindi,English',NULL,'React,SQL,PHP',1,'2025-05-01 09:51:45',0,2,'2025-05-01 09:51:45','2025-05-01 09:51:45',NULL,NULL,NULL,NULL,NULL,0),(17,'Raphaelle Gerlach','2002-11-23','Other','rogahn.bettie@example.org','402 Schroeder Mall\nWest Isaiahmouth, ME 99018','Kleinfort','District of Columbia','M.Tech','Electronics','Gulgowski, Shields and O\'Kon College','75%',0,1,4,'Keyboard Instrument Repairer and Tuner','[\"Tester\", \"Designer\"]','Powlowski, Schowalter and Homenick',35202.16,'2021-08-06',1,0,0,0,0,'Full-Time','Hindi,Punjabi',NULL,'React,Laravel,JavaScript',1,'2025-05-01 09:51:45',4,15,'2025-05-01 09:51:45','2025-05-01 09:51:45',NULL,NULL,NULL,NULL,NULL,0),(18,'Mrs. Electa Leuschke PhD','1991-02-15','Male','uanderson@example.net','65521 Harber Trail Apt. 392\nCormierberg, VT 49980-5981','Roderickberg','West Virginia','M.Tech','Electronics','Windler Ltd College','90%',0,4,4,'Production Control Manager','[\"Designer\", \"Tester\", \"Manager\"]','Russel Inc',44684.04,'1972-07-28',0,1,0,0,0,'Part-Time','Hindi,Punjabi',NULL,'PHP,SQL,JavaScript',1,'2025-05-01 09:51:45',6,10,'2025-05-01 09:51:45','2025-05-01 09:51:45',NULL,NULL,NULL,NULL,NULL,0),(19,'Hailie Gleason','1994-04-15','Female','bruen.daphne@example.net','33858 Krajcik Lane\nPort Dereck, IL 71640-2481','Berniecefort','Florida','BCA','Electronics','Gulgowski-Schmidt College','65%',1,1,8,'Airfield Operations Specialist','[\"Tester\"]','McLaughlin Inc',36352.62,'2021-10-20',1,1,0,1,1,'Full-Time','Hindi,Punjabi',NULL,'JavaScript,Laravel,React',1,'2025-05-01 09:51:45',0,17,'2025-05-01 09:51:45','2025-05-01 09:51:45',NULL,NULL,NULL,NULL,NULL,0),(20,'Alfredo McCullough','1985-05-09','Other','alberta86@example.net','81162 Donnelly Rapids\nNorth Gwendolynland, NE 56614-8262','New Raeganfort','Hawaii','B.Tech','Mechanical','Tremblay Inc College','86%',1,0,1,'Psychologist','[\"Manager\", \"Developer\"]','Heathcote-Beer',39244.76,'1991-05-07',1,1,0,0,0,'Intern','Punjabi,Hindi',NULL,'PHP,SQL,Laravel',1,'2025-05-01 09:51:45',7,19,'2025-05-01 09:51:45','2025-05-01 09:51:45',NULL,NULL,NULL,NULL,NULL,0),(25,'Mrs. Addie Bosco V','1977-08-28','Male','khalid.hodkiewicz@example.org','60937 Yost Summit\nPort Amaniville, NV 90446','Anastacioport','North Carolina','ITI','Computer Science','Langworth-Konopelski College','67%',1,2,4,'Forensic Science Technician','\"[\\\"Tester\\\"]\"','Senger-Littel',48685.33,'2002-05-17',1,0,0,0,0,'Intern','Hindi,Punjabi',NULL,'Laravel,SQL,JavaScript',1,'2025-06-06 12:50:44',1,3,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(26,'Prof. Gunner O\'Connell','1996-08-31','Other','heidenreich.jimmy@example.net','318 Alford Views Suite 022\nSouth Kaycee, WV 00559-2639','Ankundingfurt','South Dakota','diploma','Electronics','Reichel-Bahringer College','61%',0,3,10,'Electrical Drafter','\"[\\\"Developer\\\"]\"','Kub-Haley',22520.60,'1970-04-06',1,0,0,1,0,'Full-Time','Punjabi,Hindi',NULL,'JavaScript,React,SQL',1,'2025-06-06 12:50:44',5,0,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(27,'Junior Bartell','2002-01-08','Female','america.abshire@example.net','69294 Horace Glen\nSchadenland, MD 84395','Francomouth','Hawaii','graduate','Mechanical','Schinner, Friesen and Sipes College','98%',0,0,1,'Recyclable Material Collector','\"[\\\"Manager\\\",\\\"Developer\\\",\\\"Designer\\\"]\"','Huels-Volkman',24131.37,'1971-04-28',1,0,0,1,1,'Full-Time','Hindi,Punjabi',NULL,'PHP,React,JavaScript',1,'2025-06-06 12:50:44',9,10,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(28,'Uriah Bogisich','2002-11-08','Male','czboncak@example.com','1112 Kunde Meadow Apt. 263\nNorth Marco, IA 82623','West Angelica','New Hampshire','diploma','Mechanical','Nader, Olson and Larkin College','88%',1,1,2,'Management Analyst','\"[\\\"Tester\\\"]\"','Bogan-Hegmann',32656.55,'1981-11-16',1,1,1,0,1,'Intern','English,Punjabi',NULL,'PHP,JavaScript,React',1,'2025-06-06 12:50:44',8,1,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(29,'Polly Parisian','1970-06-22','Other','oturcotte@example.net','8645 Walker Green Apt. 732\nSouth Lucindaport, AL 13713','Bayerview','Wisconsin','diploma','Mechanical','Carter Inc College','84%',0,3,9,'Casting Machine Set-Up Operator','\"[\\\"Tester\\\"]\"','Kilback-Wilderman',23843.71,'1997-09-12',0,0,0,0,1,'Intern','English,Punjabi',NULL,'Laravel,SQL,JavaScript',1,'2025-06-06 12:50:44',8,8,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(30,'Bella Jerde','1988-05-02','Female','walton.abernathy@example.net','13733 Cruickshank Plaza\nNorth Jairoburgh, UT 98924-4269','Kundefort','Michigan','ITI','Computer Science','Beatty-Abernathy College','68%',0,0,3,'Motion Picture Projectionist','\"[\\\"Developer\\\",\\\"Tester\\\"]\"','Auer-Rodriguez',40164.78,'1983-01-26',1,0,1,0,0,'Part-Time','Hindi,English',NULL,'SQL,React,Laravel',1,'2025-06-06 12:50:44',3,9,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(31,'Paris Price','1990-03-04','Female','mtorphy@example.com','33099 Alan Skyway Apt. 567\nSouth Carmelo, NM 33851-2871','Mraztown','Indiana','graduate','Electronics','O\'Conner LLC College','60%',1,0,3,'Middle School Teacher','\"[\\\"Manager\\\",\\\"Designer\\\",\\\"Tester\\\"]\"','Tromp-Treutel',10374.61,'1985-06-05',1,0,1,0,0,'Full-Time','Hindi,English',NULL,'React,PHP,SQL',1,'2025-06-06 12:50:44',0,8,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(32,'Prof. Esteban Padberg DDS','1991-12-19','Male','jaclyn48@example.org','637 Willms Crest Suite 487\nNew Eudora, CT 65613-2389','South Cecilefort','Florida','diploma','Electronics','McClure-Medhurst College','63%',1,4,2,'Dietetic Technician','\"[\\\"Designer\\\",\\\"Tester\\\",\\\"Manager\\\"]\"','Roberts, Parisian and Shanahan',21880.86,'1974-03-08',1,0,0,1,0,'Part-Time','Punjabi,Hindi',NULL,'React,JavaScript,Laravel',1,'2025-06-06 12:50:44',2,5,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(33,'Dariana Waters','1972-04-21','Male','harber.mozell@example.org','14367 Nils Gardens Apt. 278\nSporerhaven, CO 91230-1701','Bahringerberg','Minnesota','12th','Mechanical','Robel-Moore College','87%',0,3,7,'Middle School Teacher','\"[\\\"Designer\\\",\\\"Manager\\\",\\\"Developer\\\"]\"','O\'Kon-Emmerich',42221.48,'2002-04-11',1,0,0,0,0,'Full-Time','Hindi,Punjabi',NULL,'JavaScript,Laravel,React',1,'2025-06-06 12:50:44',0,17,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(34,'Fern Kessler','1980-12-09','Male','adell.ryan@example.net','93216 Sporer Ports\nNorth Green, NE 38282-9732','Swaniawskishire','Louisiana','graduate','Computer Science','Simonis-Windler College','70%',1,3,0,'Advertising Sales Agent','\"[\\\"Manager\\\",\\\"Tester\\\"]\"','Hermann, Gaylord and Bartell',38566.37,'1986-01-21',1,1,0,0,1,'Intern','Punjabi,Hindi',NULL,'JavaScript,PHP,SQL',1,'2025-06-06 12:50:44',8,5,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(35,'Laurence Kiehn','2000-04-17','Male','smayert@example.org','13457 Johns Loop Apt. 122\nEast Juliet, WI 11650-7973','Maidaberg','Kentucky','10th','Computer Science','Herzog-Ullrich College','81%',1,5,9,'Legal Secretary','\"[\\\"Developer\\\"]\"','Walter, O\'Kon and Von',10547.56,'2020-02-09',0,0,0,0,1,'Full-Time','Hindi,English',NULL,'PHP,SQL,Laravel',1,'2025-06-06 12:50:44',9,18,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(36,'Neha Maggio DDS','1998-03-08','Male','savion91@example.com','512 Monahan Station Suite 571\nWest Markusburgh, SD 54674','Manuelville','Pennsylvania','12th','Electronics','Skiles-Schneider College','84%',0,1,7,'Assembler','\"[\\\"Manager\\\"]\"','Johnston Inc',26154.04,'1985-10-16',1,1,1,0,1,'Part-Time','Hindi,Punjabi',NULL,'PHP,JavaScript,Laravel',1,'2025-06-06 12:50:44',1,17,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(37,'Prof. Francisco Kshlerin','2000-04-21','Male','boreilly@example.com','801 Carroll Branch Apt. 061\nPort Arnulfofurt, VA 50027','North Daren','Indiana','ITI','Computer Science','Schuppe, Schroeder and Jerde College','62%',0,0,11,'Ceiling Tile Installer','\"[\\\"Developer\\\",\\\"Manager\\\"]\"','Cremin-Christiansen',41273.20,'1991-11-21',1,0,1,1,0,'Part-Time','English,Punjabi',NULL,'JavaScript,Laravel,React',1,'2025-06-06 12:50:44',6,20,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(38,'Shyanne Wunsch','2000-03-22','Other','xpacocha@example.net','61161 Schultz Ville Suite 054\nCamrynmouth, VA 71472-5696','New Kasandratown','New Jersey','graduate','Electronics','Borer LLC College','77%',0,4,3,'Floor Layer','\"[\\\"Developer\\\",\\\"Designer\\\"]\"','Schmitt and Sons',44504.50,'1979-10-16',0,1,0,0,1,'Intern','Punjabi,Hindi',NULL,'SQL,Laravel,JavaScript',1,'2025-06-06 12:50:44',6,19,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(39,'Emelie Okuneva','1999-08-10','Male','herta83@example.com','16855 Jorge Stravenue Suite 359\nLake Clinton, UT 15454','East Adalbertoview','Oregon','ITI','Electronics','Kihn and Sons College','70%',1,2,11,'Radio Operator','\"[\\\"Manager\\\",\\\"Developer\\\"]\"','Klocko, Barton and Hirthe',30311.43,'1997-10-31',1,0,1,1,0,'Full-Time','Hindi,English',NULL,'Laravel,JavaScript,React',1,'2025-06-06 12:50:44',7,3,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(40,'Raphael Auer','1974-06-30','Other','lorenz93@example.org','2815 Walter Villages Apt. 686\nEast Tonyfurt, DE 46233-3942','Nitzschechester','Nevada','graduate','Computer Science','Halvorson Group College','68%',0,1,11,'Computer Systems Analyst','\"[\\\"Manager\\\",\\\"Tester\\\"]\"','Walker PLC',18565.05,'1993-04-19',1,0,0,1,0,'Intern','Punjabi,English',NULL,'JavaScript,PHP,React',1,'2025-06-06 12:50:44',1,10,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(41,'Vernon Schaefer','1990-02-26','Other','julianne90@example.org','77369 Nathan Loop\nBeckermouth, UT 35231','New Howardburgh','Alaska','ITI','Mechanical','Rolfson PLC College','80%',1,5,6,'Electrician','\"[\\\"Tester\\\"]\"','Hamill, Barrows and Hessel',29599.66,'2017-09-29',0,0,0,1,1,'Intern','Punjabi,Hindi',NULL,'SQL,Laravel,React',1,'2025-06-06 12:50:44',8,6,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(42,'Mrs. Georgianna Torp Jr.','1999-02-05','Female','jenifer.wiegand@example.org','9402 Chauncey Harbors\nNorth Karaville, MN 82716','Eddville','Oklahoma','10th','Electronics','Turner LLC College','99%',0,4,1,'Musician OR Singer','\"[\\\"Manager\\\",\\\"Designer\\\"]\"','Brekke-Mosciski',17472.77,'1990-04-26',0,0,1,0,0,'Full-Time','English,Punjabi',NULL,'PHP,SQL,JavaScript',1,'2025-06-06 12:50:44',2,9,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(43,'Antwon Hilpert Jr.','1997-03-24','Female','lzemlak@example.com','17870 Hoyt Glens Suite 838\nMohrshire, NM 46767-0274','West Jamelchester','Texas','diploma','Electronics','Bartoletti-Strosin College','94%',0,3,4,'Motor Vehicle Inspector','\"[\\\"Designer\\\"]\"','Mann, Berge and Schaefer',48932.89,'1996-10-21',0,0,1,0,1,'Intern','English,Punjabi',NULL,'PHP,JavaScript,Laravel',1,'2025-06-06 12:50:44',5,2,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(44,'Gage Deckow','1981-08-30','Other','hallie10@example.net','46927 Kunze Brook Suite 614\nNew Makenzieville, NJ 81434-2454','South Nelda','Maryland','diploma','Computer Science','Douglas, Tillman and Volkman College','69%',0,5,3,'PR Manager','\"[\\\"Designer\\\",\\\"Tester\\\",\\\"Manager\\\"]\"','Harber, Towne and Little',33418.69,'1997-07-19',0,1,1,0,1,'Full-Time','Hindi,English',NULL,'React,Laravel,SQL',1,'2025-06-06 12:50:44',2,13,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(45,'Joey D\'Amore','1990-08-26','Female','aschinner@example.org','956 Orn Springs\nNorth Michale, AZ 23955','Kobeberg','Maryland','ITI','Mechanical','Labadie Ltd College','99%',1,2,8,'Service Station Attendant','\"[\\\"Tester\\\",\\\"Manager\\\",\\\"Developer\\\"]\"','Considine LLC',16945.63,'2024-12-06',1,1,1,1,1,'Intern','Hindi,English',NULL,'SQL,Laravel,React',1,'2025-06-06 12:50:44',4,6,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(46,'Letitia Kuhlman','1974-08-28','Female','mhermann@example.org','610 Jacobi Pike\nReingermouth, NE 00016-0023','Lake Lewis','District of Columbia','postgraduate','Mechanical','Fay, Dickinson and Keeling College','97%',1,4,8,'Offset Lithographic Press Operator','\"[\\\"Tester\\\",\\\"Designer\\\"]\"','Weimann-Sanford',24836.06,'1976-12-03',0,1,1,0,0,'Full-Time','English,Punjabi',NULL,'SQL,JavaScript,Laravel',1,'2025-06-06 12:50:44',2,12,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(47,'Freeda Lindgren','1973-12-30','Other','qdickinson@example.org','426 Kerluke Cliff\nMonahanstad, OK 99117','Johnsville','New Jersey','diploma','Electronics','Larkin and Sons College','84%',0,2,7,'Streetcar Operator','\"[\\\"Designer\\\",\\\"Developer\\\",\\\"Tester\\\"]\"','Ledner-Flatley',27081.61,'2013-05-10',0,1,1,1,0,'Intern','Punjabi,English',NULL,'Laravel,SQL,React',1,'2025-06-06 12:50:44',3,16,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(48,'Aimee Hand','1992-01-25','Other','lindsey58@example.com','668 Brown Cove Apt. 403\nWest Elvie, OR 60865-6287','Noemieborough','Wisconsin','diploma','Mechanical','Bayer, Pacocha and Wisozk College','87%',0,0,8,'Log Grader and Scaler','\"[\\\"Manager\\\",\\\"Designer\\\"]\"','Oberbrunner and Sons',21852.30,'2005-10-28',1,1,0,0,1,'Part-Time','Punjabi,English',NULL,'SQL,PHP,React',1,'2025-06-06 12:50:44',1,11,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(49,'Camron Luettgen','2000-02-21','Male','augustine.hermann@example.net','64263 Magdalen Mission Suite 343\nPort Valentinefurt, PA 70366','Feeneyton','Montana','postgraduate','Mechanical','Hermann-McCullough College','65%',0,0,7,'Forging Machine Setter','\"[\\\"Designer\\\",\\\"Developer\\\",\\\"Tester\\\"]\"','Williamson-Mosciski',37758.34,'2017-04-03',0,1,0,1,0,'Intern','English,Punjabi',NULL,'React,JavaScript,SQL',1,'2025-06-06 12:50:44',10,10,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(50,'Ocie Zieme III','1987-11-04','Other','gleichner.cassandre@example.net','25088 Trantow Streets Apt. 442\nWilliamsonton, OR 54544','Hintzchester','Mississippi','ITI','Mechanical','Haley, Deckow and Dare College','60%',0,0,5,'Security Guard','\"[\\\"Manager\\\"]\"','Quitzon, Sanford and Ferry',12315.95,'1988-04-01',0,0,1,0,1,'Part-Time','English,Punjabi',NULL,'React,SQL,JavaScript',1,'2025-06-06 12:50:44',1,4,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(51,'Prof. Lela Johnson V','1993-04-06','Female','kathryn94@example.org','714 Casper Station\nSouth Madilyn, NM 50389-3627','New Matteo','Nebraska','10th','Electronics','Gutmann, Langosh and Lemke College','90%',1,3,2,'Electronics Engineering Technician','\"[\\\"Designer\\\"]\"','Lesch-Johns',18169.89,'2020-03-05',1,1,0,1,0,'Part-Time','Hindi,Punjabi',NULL,'PHP,Laravel,JavaScript',1,'2025-06-06 12:50:44',4,15,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(52,'Ms. Emelia Dooley','1991-08-11','Male','lgrady@example.org','150 Niko Trace\nJermainefort, PA 85047-0730','West Kaciestad','Arkansas','12th','Computer Science','Parisian-Ratke College','81%',1,0,5,'Gaming Dealer','\"[\\\"Developer\\\",\\\"Manager\\\",\\\"Designer\\\"]\"','Bahringer, Wilderman and Rohan',13790.75,'1987-04-11',1,1,0,1,1,'Intern','Punjabi,Hindi',NULL,'PHP,JavaScript,Laravel',1,'2025-06-06 12:50:44',1,3,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(53,'Charity Lowe','1986-09-22','Female','rmcglynn@example.com','3583 Rippin Streets\nEast Bonniefort, SC 81994-5854','Lilianetown','Washington','ITI','Electronics','DuBuque-Sawayn College','73%',0,4,5,'Gas Distribution Plant Operator','\"[\\\"Tester\\\",\\\"Manager\\\"]\"','Schoen-Schroeder',31768.13,'2001-03-11',1,1,1,1,1,'Full-Time','Punjabi,Hindi',NULL,'SQL,JavaScript,React',1,'2025-06-06 12:50:44',8,16,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(54,'Desiree Christiansen','1994-01-13','Female','desiree01@example.net','8082 Alva Square\nKozeytown, CT 68235','West Jadaberg','Wisconsin','12th','Computer Science','Ziemann, King and Skiles College','63%',0,5,8,'Art Teacher','\"[\\\"Tester\\\",\\\"Designer\\\",\\\"Developer\\\"]\"','Littel LLC',47686.21,'2003-08-31',0,1,0,1,1,'Full-Time','Punjabi,Hindi',NULL,'React,Laravel,SQL',1,'2025-06-06 12:50:44',10,3,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(55,'Tracey Powlowski','1973-10-17','Male','bosco.dana@example.org','329 Archibald Bridge\nOsinskiborough, SD 11872','New Carolanneburgh','Arkansas','postgraduate','Computer Science','Jerde-Bradtke College','95%',0,4,1,'Structural Iron and Steel Worker','\"[\\\"Tester\\\",\\\"Manager\\\",\\\"Designer\\\"]\"','Grimes-Smith',13204.94,'1987-06-21',1,1,1,0,1,'Part-Time','Punjabi,English',NULL,'PHP,JavaScript,React',1,'2025-06-06 12:50:44',4,18,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(56,'Palma White','1971-01-18','Female','burdette.gottlieb@example.org','54694 Rath Circles Apt. 433\nEast Dayton, NC 44451-4956','Raynorberg','Rhode Island','graduate','Electronics','Emard, Weber and Lakin College','64%',0,0,7,'Rail Transportation Worker','\"[\\\"Designer\\\",\\\"Tester\\\"]\"','Conn and Sons',27044.93,'2001-03-09',0,1,0,0,1,'Part-Time','Punjabi,Hindi',NULL,'PHP,SQL,React',1,'2025-06-06 12:50:44',3,9,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(57,'Dr. Al Barton','2001-07-22','Other','kylee33@example.com','405 Donato Throughway Apt. 586\nSouth Rico, OH 56058','New Rhiannon','Texas','diploma','Computer Science','Farrell Ltd College','91%',0,3,11,'Forest Fire Inspector','\"[\\\"Manager\\\",\\\"Tester\\\"]\"','Glover-Beatty',44035.75,'2005-07-06',0,1,0,0,1,'Full-Time','Punjabi,Hindi',NULL,'PHP,React,Laravel',1,'2025-06-06 12:50:44',8,13,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(58,'Elvera Wilkinson II','1972-09-30','Other','oreilly@example.net','41464 Jerald Stravenue Suite 729\nNew Maximilliaville, SD 64739','Jacobsonville','Oklahoma','12th','Electronics','Kemmer, Lowe and Stoltenberg College','66%',0,4,2,'Naval Architects','\"[\\\"Designer\\\",\\\"Developer\\\"]\"','Waters Ltd',24933.76,'1986-11-09',1,1,0,1,0,'Part-Time','Hindi,Punjabi',NULL,'PHP,SQL,Laravel',1,'2025-06-06 12:50:44',5,7,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(59,'Eugene Mohr','1990-05-05','Female','rebekah.crist@example.org','22971 Kiehn Alley\nShanaport, MN 18531-3348','Shyannfurt','Alaska','postgraduate','Electronics','Kuvalis-Kiehn College','95%',0,2,1,'Brake Machine Setter','\"[\\\"Designer\\\",\\\"Tester\\\",\\\"Developer\\\"]\"','Hayes, Champlin and Kirlin',16978.21,'2002-05-05',0,0,0,0,1,'Part-Time','English,Punjabi',NULL,'JavaScript,React,SQL',1,'2025-06-06 12:50:44',8,0,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(60,'Ms. Lera Wilderman','1995-02-01','Other','fmaggio@example.org','31900 Paucek Garden\nConsidineville, IN 29453','Cruickshankfort','Massachusetts','graduate','Electronics','VonRueden PLC College','61%',0,3,4,'Punching Machine Setters','\"[\\\"Developer\\\",\\\"Manager\\\",\\\"Tester\\\"]\"','Wunsch, Kerluke and Hettinger',34081.29,'2019-04-28',0,1,1,1,1,'Intern','Hindi,Punjabi',NULL,'Laravel,JavaScript,PHP',1,'2025-06-06 12:50:44',1,7,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(61,'Connie Murazik','2000-08-13','Female','mauricio.orn@example.org','881 Hammes Parkways Apt. 778\nEast Emery, GA 89658','Pagacton','South Carolina','10th','Electronics','Stanton, Rohan and Collier College','83%',1,4,1,'Telecommunications Line Installer','\"[\\\"Manager\\\",\\\"Designer\\\"]\"','Greenfelder, Gutkowski and O\'Kon',27497.07,'2000-04-22',1,0,0,1,0,'Intern','Hindi,English',NULL,'PHP,JavaScript,SQL',1,'2025-06-06 12:50:44',7,3,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(62,'Mr. Vicente Wolf','2001-02-09','Other','carleton62@example.org','5015 Jude Crest\nEast Sidport, KY 55381-4529','Port Aileenland','California','postgraduate','Electronics','Shanahan-Wiegand College','98%',1,3,3,'Sales and Related Workers','\"[\\\"Tester\\\",\\\"Developer\\\"]\"','Lesch, Ledner and Gulgowski',42645.76,'2013-12-26',1,0,0,0,0,'Full-Time','Punjabi,English',NULL,'JavaScript,React,SQL',1,'2025-06-06 12:50:44',1,20,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(63,'Mr. Grayson Mann II','1998-04-20','Female','aurelio.ernser@example.net','36962 Glen Wells\nTurcottestad, VT 68400','Sydnichester','Texas','12th','Electronics','Flatley and Sons College','84%',0,4,1,'Food Preparation','\"[\\\"Tester\\\",\\\"Manager\\\"]\"','Parker Group',40234.21,'2023-08-24',0,1,1,0,1,'Part-Time','Hindi,English',NULL,'JavaScript,React,PHP',1,'2025-06-06 12:50:44',7,16,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(64,'Delta Schmeler','1973-02-15','Other','fstamm@example.net','97442 Roberts Loop\nFraneckibury, OR 26438','Jairoberg','Virginia','12th','Electronics','Hills-Wolf College','100%',0,0,0,'Sawing Machine Setter','\"[\\\"Tester\\\"]\"','Schinner-Bauch',17918.62,'1990-03-22',0,0,1,1,1,'Intern','Hindi,English',NULL,'SQL,JavaScript,React',1,'2025-06-06 12:50:44',9,15,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(65,'Noel O\'Hara PhD','1981-08-02','Other','ekovacek@example.com','89902 Vivienne Roads Suite 329\nPurdybury, ME 07872','Port Darian','Oregon','10th','Computer Science','Schaden, Stark and Quitzon College','67%',0,2,1,'RN','\"[\\\"Manager\\\",\\\"Developer\\\"]\"','Wisoky, Gorczany and Kuhlman',33698.02,'2017-07-15',1,0,0,1,0,'Full-Time','Punjabi,Hindi',NULL,'React,SQL,JavaScript',1,'2025-06-06 12:50:44',1,11,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(66,'Tiara Christiansen','1978-12-06','Female','dorothy52@example.com','3697 Darren Circles\nWest Keenan, WI 15994','East Isadore','Nevada','ITI','Computer Science','Ryan-Okuneva College','68%',0,1,3,'History Teacher','\"[\\\"Developer\\\",\\\"Designer\\\"]\"','Sipes Group',21150.51,'2012-03-25',1,1,0,1,1,'Intern','Hindi,Punjabi',NULL,'SQL,Laravel,JavaScript',1,'2025-06-06 12:50:44',8,11,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(67,'Roxane Leuschke','2002-11-17','Male','taurean30@example.com','901 Will Valleys Suite 682\nNew Margret, RI 66741','Port Roscoe','South Dakota','postgraduate','Computer Science','Johnson, Effertz and Cruickshank College','92%',1,2,3,'Power Generating Plant Operator','\"[\\\"Designer\\\",\\\"Developer\\\"]\"','Weissnat-Strosin',17698.35,'1977-09-05',0,1,0,0,1,'Full-Time','Punjabi,English',NULL,'SQL,Laravel,JavaScript',1,'2025-06-06 12:50:44',4,19,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(68,'Donnie Hessel','1992-01-05','Male','snicolas@example.com','37898 Sammy Garden\nKristianshire, MD 33121-6174','Towneton','Iowa','10th','Electronics','Rosenbaum, McClure and Botsford College','76%',1,5,8,'Keyboard Instrument Repairer and Tuner','\"[\\\"Tester\\\"]\"','Maggio-Wunsch',31959.08,'1998-06-02',0,0,0,1,0,'Part-Time','Punjabi,English',NULL,'SQL,JavaScript,PHP',1,'2025-06-06 12:50:44',5,18,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(69,'Annabel Eichmann','1986-10-01','Female','sbradtke@example.net','742 Bryce Stream Apt. 102\nSouth Schuyler, KS 91054','McCluretown','Mississippi','ITI','Electronics','Hyatt, Schamberger and Leannon College','61%',1,3,10,'Mechanical Inspector','\"[\\\"Tester\\\",\\\"Designer\\\",\\\"Manager\\\"]\"','Lakin-Hills',29592.89,'2023-10-14',1,0,1,1,1,'Full-Time','Hindi,English',NULL,'SQL,React,JavaScript',1,'2025-06-06 12:50:44',1,0,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(70,'Bridget Homenick','1986-10-09','Male','orin.baumbach@example.net','196 Kaya Spring Apt. 207\nColliermouth, VT 90014-6275','Lake Carleeborough','Idaho','postgraduate','Mechanical','Heller, Ondricka and Carroll College','96%',0,3,11,'Tool Set-Up Operator','\"[\\\"Manager\\\",\\\"Designer\\\"]\"','Williamson-Gaylord',45116.09,'2010-11-22',0,0,1,0,1,'Intern','English,Hindi',NULL,'JavaScript,PHP,SQL',1,'2025-06-06 12:50:44',4,0,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(71,'Jany Hessel','1980-05-17','Male','yprohaska@example.org','7005 Hills Mission Apt. 540\nKarineburgh, MD 97324','East Beauville','North Carolina','graduate','Mechanical','Hintz-Bernhard College','60%',0,2,10,'Office Clerk','\"[\\\"Developer\\\"]\"','Hegmann Group',49078.60,'1981-06-27',0,0,1,0,1,'Intern','English,Hindi',NULL,'JavaScript,PHP,SQL',1,'2025-06-06 12:50:44',0,16,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(72,'Christiana Wolf','1992-07-01','Female','gleason.malika@example.com','77429 Stanton Drive Suite 209\nMarinamouth, SD 09715-3078','South Herta','New York','graduate','Mechanical','Weber-Ledner College','95%',0,4,2,'Travel Agent','\"[\\\"Developer\\\"]\"','Kihn Group',13765.58,'2011-09-11',0,0,1,0,0,'Part-Time','English,Punjabi',NULL,'SQL,React,Laravel',1,'2025-06-06 12:50:44',0,7,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(73,'Pete Kulas','1986-01-04','Other','nbahringer@example.net','892 Ruecker Viaduct Apt. 220\nJasentown, NC 58214','West Joshuaborough','Florida','diploma','Mechanical','Metz, Schaefer and Block College','73%',0,4,3,'Heating and Air Conditioning Mechanic','\"[\\\"Designer\\\",\\\"Tester\\\",\\\"Manager\\\"]\"','Streich-Schamberger',26653.22,'1998-05-23',0,1,1,1,0,'Full-Time','Hindi,English',NULL,'JavaScript,Laravel,React',1,'2025-06-06 12:50:44',3,3,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(74,'Prof. Mollie Adams III','1993-11-13','Male','jabbott@example.net','41548 Wisoky Mountains Apt. 281\nNew Davonside, NV 75872-5335','Port Lavernberg','Wisconsin','12th','Computer Science','Hackett-Veum College','84%',0,3,9,'Financial Services Sales Agent','\"[\\\"Developer\\\",\\\"Manager\\\",\\\"Designer\\\"]\"','Haley-Boehm',24468.40,'2008-07-29',0,1,1,1,0,'Full-Time','English,Punjabi',NULL,'PHP,React,Laravel',1,'2025-06-06 12:50:44',9,5,'2025-06-06 12:50:44','2025-06-06 12:50:44',NULL,NULL,NULL,NULL,NULL,0),(75,'Himanshu Mehra',NULL,NULL,'himanshu.mehra@example.com','123 Main Street','Chandigarh','Punjab','BCA','Computer Applications','Unknown College','75.00',0,2,0,'Full Stack Developer','[\"Full Stack Developer\"]','Future IT Rouch',NULL,NULL,0,1,1,1,0,'Full-time','English',NULL,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(77,'manshu','2001-09-22','Male','manshu.developer@gmail.com','ambala cantt','Kurukshtra','Haryana',NULL,NULL,'Kurukshtra','90',0,1,4,'Stack','Full Stack developer','Future It Touch',30000.00,'2025-09-22',0,1,0,1,0,NULL,NULL,NULL,'[\"Raspberry Pi\",\"CSS\",\"mansh\"]',1,'2025-07-18 09:25:13',0,0,'2025-07-11 08:51:03','2025-07-18 09:25:13','877244','2025-07-11 09:05:49','7988532993','f3iW2bwur7Y5QoIV9DkS3zaw5kT86HinTsHlcQ5m1WiAhHwn23TjZmWtnj9o','$2y$12$Suog71cPBw1hfwyYCYxmhu9mc5nKnND3GaznsDuHK/uIx.2.6qO32',1),(81,'manshi','2002-09-22','Female','manshusmartboy@gmail.com','ambala cantt','amabala','haryana',NULL,NULL,'Ambal','90',0,3,NULL,'Hel','Full Stack Developer','Erimoson',40000.00,'2002-09-22',0,1,0,1,0,NULL,NULL,NULL,'[\"Raspberry Pi\"]',1,'2025-07-18 10:15:45',0,0,'2025-07-18 10:15:45','2025-07-18 10:19:14',NULL,NULL,'7988532993','c181d941-116d-40e0-b562-8542a7a39c02','$2y$12$8GXB3N3lxQX4iw3.joTpbOPDdWg1aVkM52bJnby.w6.9ryp7qlcCe',1);
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gst_certificate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `other_certificate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_approved` tinyint(1) NOT NULL DEFAULT '0',
  `company_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_person` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employer_id` (`employer_id`),
  CONSTRAINT `companies_ibfk_1` FOREIGN KEY (`employer_id`) REFERENCES `employers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (18,40,'Skymore It Solutions','documents/gst_1752743303_School Management.pdf','documents/pan_1752743303_Proposal Website with Live Radio & Interactive Features .pdf',1,'Ambala cantt',NULL,'7988532993','2025-07-17 03:38:24','2025-07-17 03:38:54'),(19,40,'HDFC Bank','documents/gst_1752744292_School Management.pdf','documents/pan_1752744292_Proposal Website with Live Radio & Interactive Features .pdf',1,'Ambala, Ambala Cantt, Ambala, Haryana, 134002, India; Hardin County, Ohio, United States; New, Owen County, Kentucky, United States',NULL,'7988532993','2025-07-17 03:54:52','2025-07-17 06:47:29');
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employers`
--

LOCK TABLES `employers` WRITE;
/*!40000 ALTER TABLE `employers` DISABLE KEYS */;
INSERT INTO `employers` VALUES (40,'Manshu Mehra',NULL,'manshu.developer@gmail.com',NULL,'2025-07-17 03:38:24','2025-07-17 03:38:57','$2y$12$08tZylFfTD/sAlxV33qKk.5wRL6gxvDNC/MEJIGWk1LpSmt6JFgeq',NULL,NULL,NULL,1,NULL);
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
-- Table structure for table `filament_comments`
--

DROP TABLE IF EXISTS `filament_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filament_comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `subject_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` bigint unsigned NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `filament_comments_subject_type_subject_id_index` (`subject_type`,`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filament_comments`
--

LOCK TABLES `filament_comments` WRITE;
/*!40000 ALTER TABLE `filament_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `filament_comments` ENABLE KEYS */;
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
  `company_id` bigint unsigned DEFAULT NULL,
  `job_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `job_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `industry` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job_role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `work_location_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `compensation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_salary` decimal(15,2) DEFAULT NULL,
  `max_salary` decimal(15,2) DEFAULT NULL,
  `incentive` decimal(15,2) DEFAULT NULL,
  `pay_type` enum('Hourly','Salary','Per Project','Salary + Incentive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `joining_fee` tinyint(1) NOT NULL DEFAULT '0',
  `basic_requirements` text COLLATE utf8mb4_unicode_ci,
  `additional_requirements` json DEFAULT NULL,
  `is_walkin_interview` tinyint(1) NOT NULL DEFAULT '0',
  `communication_preference` enum('Call','Whatsapp','No Preference','Phone') COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_experience_required` int DEFAULT NULL,
  `total_experience_max` int DEFAULT NULL,
  `other_job_titles` json DEFAULT NULL,
  `degree_specialization` json DEFAULT NULL,
  `job_description` text COLLATE utf8mb4_unicode_ci,
  `job_expire_time` int NOT NULL DEFAULT '7',
  `number_of_candidates_required` int NOT NULL DEFAULT '1',
  `english_level` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender_preference` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `perks` json DEFAULT NULL,
  `interview_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `interview_date` date DEFAULT NULL,
  `interview_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `not_email` tinyint(1) NOT NULL DEFAULT '0',
  `viewed_number` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_verified` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `job_postings_employer_id_foreign` (`employer_id`),
  CONSTRAINT `job_postings_employer_id_foreign` FOREIGN KEY (`employer_id`) REFERENCES `employers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_postings`
--

LOCK TABLES `job_postings` WRITE;
/*!40000 ALTER TABLE `job_postings` DISABLE KEYS */;
INSERT INTO `job_postings` VALUES (81,40,18,'Full Stack Developer','Full-Time','Technology','Engineering','Full Stack','Ambala Cantt, Ambala, Haryana, India; Chandigarh, India; Patiala, Punjab, India',NULL,NULL,'Work from Home','0',20000.00,25000.00,0.00,'Salary',0,'null','\"[\\\"CSS\\\",\\\"JavaScript\\\",\\\"Python\\\",\\\"React\\\",\\\"HTML\\\",\\\"Node.js\\\",\\\"Django\\\",\\\"C++\\\"]\"',0,'Whatsapp',2,NULL,'\"[]\"','\"[\\\"Graduation Not Required\\\",\\\"\\\",\\\"\\\"]\"','rvr3',7,10,'Beginner','No Preference','\"[\\\"Health Insurance\\\"]\"',NULL,'manshu.developer@gmail.com','7988532993','2025-09-22','10:00',0,1,'2025-07-17 03:41:05','2025-07-17 03:41:05',0),(82,40,18,'Accounts','Full-Time','Finance','Human Resources','Full stack','Ambala, Haryana, India; Karnal, Haryana, India; Ambala, Haryana, India',NULL,NULL,'Work from Home','0',20000.00,24000.00,0.00,'Salary',0,'null','\"[\\\"CSS\\\",\\\"JavaScript\\\",\\\"HTML\\\",\\\"Python\\\"]\"',0,'No Preference',2,NULL,'\"[]\"','\"[\\\"Graduation Not Required\\\",\\\"\\\",\\\"\\\"]\"','cefe2',7,10,'Beginner','No Preference','\"[\\\"Health Insurance\\\",\\\"Provident Fund\\\"]\"',NULL,'manshu.developer@gmail.com','7988532993','2025-07-22','10:00',1,0,'2025-07-17 03:46:32','2025-07-17 03:46:32',0),(83,40,19,'Accountant','Full-Time','Technology','Engineering','Full Stack Developer','Ambala, Ambala Cantt, Ambala, Haryana, 134002, India; Hardin County, Ohio, United States; New, Owen County, Kentucky, United States',NULL,NULL,'Work from Home','0',23000.00,40000.00,0.00,'Salary',0,'null','\"[\\\"CSS\\\",\\\"Python\\\"]\"',0,'Whatsapp',4,NULL,'\"[]\"','\"[\\\"Graduation Not Required\\\",\\\"\\\",\\\"\\\"]\"','r3f3',7,10,'Beginner','No Preference','\"[\\\"Health Insurance\\\"]\"','null','manshu.developer@gmail.com','7988532993','2025-09-22','10:00',0,1,'2025-07-17 03:54:56','2025-07-17 03:54:56',0),(84,40,19,'Full Stack','Part-Time','Technology','Human Resources','Mans','Ambala, Haryana, 134008, India; Ama, Aviatico, Bergamo, Lombardy, 24020, Italy; Karala küla, Saaremaa vald, Saare County, 93325, Estonia',NULL,NULL,'Work from Home','0',20000.00,30000.00,0.00,'Salary',0,'null','\"[\\\"CSS\\\",\\\"React\\\",\\\"Python\\\"]\"',0,'Whatsapp',0,NULL,'\"[]\"','\"[\\\"Graduation Not Required\\\",\\\"\\\",\\\"\\\"]\"','wrfrw',7,12,'Beginner','No Preference','\"[\\\"Health Insurance\\\"]\"','null','manshu.developer@gmail.com','7988532993','2002-09-22','10:00',1,0,'2025-07-17 09:14:59','2025-07-17 09:14:59',0),(85,40,18,'Full Stack Developer','Full-Time','Finance','Human Resources','Friil','Ambala, Ambala Cantt, Ambala, Haryana, 134002, India; Kacha, Долинненское сельское поселение, Bakhchysarai Raion, Republic of Crimea, 298450, Ukraine; Brazii, Arad, Romania',NULL,NULL,'Work from Home','0',3000.00,4000.00,0.00,'Salary',0,'null','\"[\\\"CSS\\\",\\\"Node.js\\\"]\"',0,'Call',0,NULL,'\"[]\"','\"[\\\"Masters\\\",\\\"MDS\\\",\\\"Prosthodontics\\\"]\"','<p>We are hiring a <strong><em>Full Stack Developer</em></strong> to join our dynamic team and help build innovative web applications.</p><p><strong><em>Key Responsibilities:</em></strong></p><ul><li><p><strong><em>Design</em></strong> and <strong><em>develop</em></strong> scalable web applications</p></li><li><p>Work on both <em>front-end</em> and <em>back-end</em> technologies</p></li><li><p>Ensure high performance and responsiveness</p></li><li><p>Collaborate with cross-functional teams in an <em>Agile</em> environment</p></li></ul><p><strong><em>Requirements:</em></strong></p><ul><li><p><strong>Proficient in JavaScript, React, and Node.js</strong></p></li><li><p><em>Strong experience</em> with relational and NoSQL databases</p></li><li><p><em>Excellent problem-solving</em> and debugging skills</p></li><li><p><em>Good understanding</em> of RESTful APIs and web services</p></li></ul><p></p>',7,10,'Advanced','No Preference','\"[\\\"Health Insurance\\\"]\"','null','manshu.developer@gmail.com','7988532993','2025-09-22','20:00',1,0,'2025-07-17 11:30:05','2025-07-17 11:30:05',0),(86,40,18,'full stack developer','Full-Time','Technology','Engineering','Full Stack developer','Ambala, Ambala Cantt, Ambala, Haryana, 134002, India; Karnal, Haryana, India; Satu Mare International Airport, DJ193C, Cionchești, Viile Satu Mare, Satu Mare, 447361, Romania',NULL,NULL,'Work from Home','0',20000.00,24000.00,0.00,'Salary',0,'null','\"[\\\"HTML\\\",\\\"JavaScript\\\",\\\"Django\\\",\\\"Laravel\\\",\\\"PHP\\\",\\\"MongoDB\\\",\\\"Java\\\",\\\"Node.js\\\"]\"',0,'Call',2,NULL,'\"[]\"','\"[\\\"Graduated\\\",\\\"BCA\\\",\\\"Computer Science\\\"]\"','<p>Full Stack Developer -</p><p>Engineering Department We are seeking a skilled and motivated Full Stack Developer to join our dynamic Engineering team.</p><p></p><p>The ideal candidate will have a strong background in programming, a solid understanding of full-stack development, and excellent problem-solving skills. This role will involve collaborating with our team to design, develop, and maintain our web applications to meet our business objectives.</p><p></p><p><strong>Key Responsibilities: </strong>-</p><p>Design, develop, and implement web applications using a full-stack development approach. - Collaborate with cross-functional teams to define, design, and ship new features. - Write clean, scalable, and reusable code following best practices and industry standards. - Conduct code reviews and ensure the quality of the software delivered. - Troubleshoot and debug applications to ensure functionality and performance. - Optimize applications for maximum speed and scalability. - Stay up-to-date with the latest technology trends and incorporate them into our development process.</p><p></p><p><strong>Qualifications</strong>:</p><p>Bachelor\'s degree in Computer Science or a related field, with a specialization in Computer Science preferred. - Minimum of 2 years of experience as a Full Stack Developer. - Strong proficiency in at least one server-side programming language (e.g., JavaScript, Python, Ruby, PHP) and one front-end programming language (e.g., HTML, CSS, JavaScript, React, Angular). - Experience with relational databases and SQL. - Familiarity with Agile development methodologies. - Excellent problem-solving skills and the ability to work under pressure. - Strong communication skills and the ability to collaborate effectively with team members. - Detail-oriented with a focus on delivering high-quality work.</p><p></p><h1><strong>Additional Information:</strong></h1><p>This is a full-time position with competitive compensation, benefits, and opportunities for growth. We are an equal opportunity employer and welcome applications from all qualified candidates regardless of race, gender, age, religion, sexual orientation, or any other protected status. We are committed to fostering a diverse and inclusive workplace and encourage applications from candidates with diverse background</p>',7,10,'Beginner','No Preference','\"[\\\"Health Insurance\\\"]\"','null','manshu.developer@gmail.com','7988532993','2001-09-22','10:00',0,0,'2025-07-18 04:27:26','2025-07-18 04:27:26',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2025_04_23_151109_create_candidates_table',1),(5,'2025_04_23_151408_create_candidate_educations_table',1),(6,'2025_04_23_151430_create_candidate_experiences_table',1),(7,'2025_04_23_151453_create_candidate_skills_table',1),(8,'2025_04_23_151541_create_candidate_languages_table',1),(9,'2025_04_23_154810_create_employers_table',1),(10,'2025_04_23_154855_create_job_postings_table',1),(11,'2025_04_23_155959_create_job_posting_applications_table',1),(12,'2025_04_26_071329_alter_job_type_column_in_job_postings_table',1),(13,'2025_04_26_071434_alter_work_location_type_column_in_job_postings_table',1),(14,'2025_04_26_073057_modify_status_column_in_job_posting_applications_table',1),(15,'2025_04_27_054200_add_otp_fields_to_candidates_table',1),(16,'2025_04_27_105808_create_personal_access_tokens_table',1),(17,'2025_04_27_110508_make_full_name_nullable_in_candidates_table',2),(18,'2025_05_01_152249_add_candidate_id_to_job_posting_applications_table',3),(19,'2025_05_10_123509_add_fields_to_employers_table',4),(20,'2025_05_10_123600_create_companies_table',5),(21,'2025_05_10_123954_add_auth_fields_to_employers_table',6),(22,'2025_05_10_124815_add_is_blocked_to_employers_table',7),(23,'add_session_token_to_employers_table',8),(24,'2025_05_11_065811_create_otp_verifications_table',9),(25,'2025_05_26_163832_add_gst_and_pan_to_employers_table',10),(26,'2025_07_17_041857_create_breezy_sessions_table',11),(27,'2025_07_17_042655_add_avatar_url_column_to_users_table',12),(28,'2025_07_17_044721_create_permission_tables',13),(29,'2025_07_17_045826_create_filament_comments_table',14),(30,'2025_07_17_045827_add_index_to_subject',14),(31,'2025_07_17_053946_create_notifications_table',15),(32,'2025_07_17_074153_add_industry_department_job_role_to_job_postings_table',15);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `otp_verifications`
--

LOCK TABLES `otp_verifications` WRITE;
/*!40000 ALTER TABLE `otp_verifications` DISABLE KEYS */;
INSERT INTO `otp_verifications` VALUES (2,'manshu.develoepr@gmail.com','501691','2025-07-12 12:14:31','2025-05-11 02:04:03','2025-07-12 12:04:31'),(6,'manshu.developer@gmail.com','363893','2025-07-18 10:39:00','2025-05-12 08:48:44','2025-07-18 10:29:00'),(7,'masnhu.developer@gmail.com','902966','2025-05-12 09:02:37','2025-05-12 08:52:37','2025-05-12 08:52:37'),(8,'manshusmartboy@gmail.com','821044','2025-07-18 10:25:25','2025-05-14 10:41:56','2025-07-18 10:15:25'),(9,'mehrahimanshu50@gmail.com','269859','2025-06-07 00:58:06','2025-05-14 10:43:07','2025-06-07 00:48:06'),(10,'manshu.smartboy@gmail.com','768558','2025-05-21 11:38:59','2025-05-21 11:28:59','2025-05-21 11:28:59'),(11,'oicglobal9669@gmail.com','351381','2025-06-02 11:04:27','2025-06-02 10:54:27','2025-06-02 10:54:27'),(12,'ap2290731@gmail.com','790849','2025-07-14 23:09:24','2025-07-14 22:59:24','2025-07-14 22:59:24'),(13,'manshu.developer@gmial.com','860898','2025-07-17 06:21:45','2025-07-17 06:11:45','2025-07-17 06:11:45'),(14,'manshusmarboy@gmail.com','699993','2025-07-18 09:29:51','2025-07-18 09:19:51','2025-07-18 09:19:51');
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
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'view_candidate','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(2,'view_any_candidate','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(3,'create_candidate','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(4,'update_candidate','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(5,'restore_candidate','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(6,'restore_any_candidate','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(7,'replicate_candidate','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(8,'reorder_candidate','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(9,'delete_candidate','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(10,'delete_any_candidate','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(11,'force_delete_candidate','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(12,'force_delete_any_candidate','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(13,'view_company','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(14,'view_any_company','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(15,'create_company','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(16,'update_company','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(17,'restore_company','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(18,'restore_any_company','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(19,'replicate_company','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(20,'reorder_company','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(21,'delete_company','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(22,'delete_any_company','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(23,'force_delete_company','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(24,'force_delete_any_company','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(25,'view_employer','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(26,'view_any_employer','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(27,'create_employer','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(28,'update_employer','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(29,'restore_employer','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(30,'restore_any_employer','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(31,'replicate_employer','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(32,'reorder_employer','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(33,'delete_employer','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(34,'delete_any_employer','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(35,'force_delete_employer','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(36,'force_delete_any_employer','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(37,'view_job::posting','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(38,'view_any_job::posting','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(39,'create_job::posting','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(40,'update_job::posting','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(41,'restore_job::posting','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(42,'restore_any_job::posting','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(43,'replicate_job::posting','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(44,'reorder_job::posting','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(45,'delete_job::posting','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(46,'delete_any_job::posting','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(47,'force_delete_job::posting','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(48,'force_delete_any_job::posting','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(49,'view_job::posting::application','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(50,'view_any_job::posting::application','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(51,'create_job::posting::application','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(52,'update_job::posting::application','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(53,'restore_job::posting::application','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(54,'restore_any_job::posting::application','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(55,'replicate_job::posting::application','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(56,'reorder_job::posting::application','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(57,'delete_job::posting::application','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(58,'delete_any_job::posting::application','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(59,'force_delete_job::posting::application','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(60,'force_delete_any_job::posting::application','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(61,'view_role','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(62,'view_any_role','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(63,'create_role','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(64,'update_role','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(65,'delete_role','web','2025-07-17 01:27:47','2025-07-17 01:27:47'),(66,'delete_any_role','web','2025-07-17 01:27:47','2025-07-17 01:27:47');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\Employer',17,'EmployerToken','f74bad65e79ae1f4fdbd19010c16b23bb792d120bc4a4aa7fca219fdaa71a2b6','[\"*\"]','2025-05-12 09:26:12',NULL,'2025-05-12 09:02:13','2025-05-12 09:26:12'),(2,'App\\Models\\Employer',18,'EmployerToken','9e360889ea7d0bff7e2264fd705197b7bfb383d56f08ecb255adf337528e5b1b','[\"*\"]','2025-05-13 10:31:54',NULL,'2025-05-13 08:46:59','2025-05-13 10:31:54'),(3,'App\\Models\\Employer',19,'EmployerToken','f8f6d61be50afa4fbc707141d6cdde015b1f3ce2c805a01f6d329acebd35bc97','[\"*\"]','2025-05-14 10:31:15',NULL,'2025-05-14 09:37:03','2025-05-14 10:31:15'),(4,'App\\Models\\Employer',20,'EmployerToken','044fca0dc565cda65b7d8b50fbd836349a1c630d9044f29e319f7aa350fa9f58','[\"*\"]','2025-05-16 10:04:57',NULL,'2025-05-15 08:11:57','2025-05-16 10:04:57'),(5,'App\\Models\\Employer',21,'EmployerToken','8cf1add6f02e7d5a22437fd9e8235d9ec2a793eb0ef09bcc5c7569e010deb355','[\"*\"]','2025-05-18 01:09:33',NULL,'2025-05-17 23:47:17','2025-05-18 01:09:33'),(6,'App\\Models\\Employer',22,'EmployerToken','f33c4b68bc589f61d75c049b7c869dbc2973baae2ff909240d72fe35bd5fd980','[\"*\"]','2025-05-21 11:17:12',NULL,'2025-05-21 11:10:24','2025-05-21 11:17:12'),(7,'App\\Models\\Employer',23,'EmployerToken','33b48b2bef0a0d35ceda5e14d1a1e34b635c63d5bcc7e3bd1aa6e2692db9a99c','[\"*\"]','2025-05-21 11:34:35',NULL,'2025-05-21 11:30:17','2025-05-21 11:34:35'),(8,'App\\Models\\Employer',24,'EmployerToken','99aa33a0a977d9d202fbde457432330a383eda651fa739aab28876a4e499b542','[\"*\"]','2025-05-23 10:37:29',NULL,'2025-05-21 11:47:37','2025-05-23 10:37:29'),(9,'App\\Models\\Employer',25,'EmployerToken','6cd334ffad222b8cf579d8b209908c39945cfd4fc894e2facf222b87f26f94f5','[\"*\"]','2025-05-23 10:50:17',NULL,'2025-05-23 10:47:13','2025-05-23 10:50:17'),(10,'App\\Models\\Employer',26,'EmployerToken','c1dadafa5fcf0d7057fcf7e7203f4123895bf4927702a3a0ee2d0752097e1c58','[\"*\"]','2025-05-23 12:26:04',NULL,'2025-05-23 12:25:40','2025-05-23 12:26:04'),(11,'App\\Models\\Employer',27,'EmployerToken','b2e7dfed1b9479c453033ece92f86549ef53cd7501ccabc82583fa620c884750','[\"*\"]','2025-05-26 09:52:16',NULL,'2025-05-26 09:50:48','2025-05-26 09:52:16'),(12,'App\\Models\\Employer',28,'EmployerToken','ce7575a65fa1ddd7207a5cc6da2297d143eaea2e4ceddda1a060304662dcbb11','[\"*\"]','2025-05-26 10:04:01',NULL,'2025-05-26 10:02:46','2025-05-26 10:04:01'),(13,'App\\Models\\Employer',28,'EmployerToken','e29e67bd1fd61da7fe537e1394f33b2a5c220726a15aa1f32c3e7674423c8d34','[\"*\"]','2025-05-26 10:06:08',NULL,'2025-05-26 10:05:50','2025-05-26 10:06:08'),(14,'App\\Models\\Employer',28,'EmployerToken','8c947b79e7a1657a0d890dd8f6628a1288c5eb4c3d5986e503a71ddcd433b2d3','[\"*\"]','2025-05-26 10:06:38',NULL,'2025-05-26 10:06:35','2025-05-26 10:06:38'),(15,'App\\Models\\Employer',23,'EmployerToken','af213453a7b22650d2338ae113f856c22285267ba0973afb7ebaf0eedfd27fe7','[\"*\"]','2025-05-26 10:08:14',NULL,'2025-05-26 10:07:12','2025-05-26 10:08:14'),(16,'App\\Models\\Employer',29,'EmployerToken','edb1a4a40fb30b3dfa387d0394c87653fd5433cccd61a79486acd154e561382a','[\"*\"]','2025-05-26 11:21:13',NULL,'2025-05-26 11:20:20','2025-05-26 11:21:13'),(17,'App\\Models\\Employer',30,'EmployerToken','9eb526be5c3f2208d3b829de55e3c8681e3134258795dca65da93e3a4f87e140','[\"*\"]','2025-05-26 11:36:36',NULL,'2025-05-26 11:26:53','2025-05-26 11:36:36'),(18,'App\\Models\\Employer',31,'EmployerToken','e6aada19441b580eaba9c879cc0692c843843a3d3842362f4591091170be9c1b','[\"*\"]','2025-05-27 11:40:08',NULL,'2025-05-26 11:40:33','2025-05-27 11:40:08'),(19,'App\\Models\\Employer',32,'EmployerToken','8ac4e1f642b09a1a8059eba3fb98f2628ac1737fc6eb1a1dcb5f83bf8909c6e4','[\"*\"]','2025-05-27 11:43:30',NULL,'2025-05-27 11:43:18','2025-05-27 11:43:30'),(20,'App\\Models\\Employer',31,'EmployerToken','e182b96fadcf1a4fd8cca69b034460dab127375985c5b93405e57fcff0b17602','[\"*\"]','2025-05-27 12:03:58',NULL,'2025-05-27 11:44:27','2025-05-27 12:03:58'),(21,'App\\Models\\Employer',32,'EmployerToken','bf0b7e57dbe36d240eddfa0f3f4ed3e325c94504beccffb4fb3de2634b8a2c79','[\"*\"]','2025-05-28 11:52:07',NULL,'2025-05-28 11:23:01','2025-05-28 11:52:07'),(22,'App\\Models\\Employer',32,'EmployerToken','ba428298aee4e20b4f86ba2e22e17aa90442c50b99bc180013c08254b6bbbde0','[\"*\"]','2025-05-29 10:14:57',NULL,'2025-05-29 09:57:04','2025-05-29 10:14:57'),(23,'App\\Models\\Employer',31,'EmployerToken','164f686573481e7e2ad19b0b7f58d77317c7d4cb7aaad82f8b22bcd3e7e060cc','[\"*\"]','2025-06-06 11:18:19',NULL,'2025-05-29 11:16:38','2025-06-06 11:18:19'),(24,'App\\Models\\Employer',33,'EmployerToken','7e376955928a6147e58c4742a166ef73268ed0262a1a054fd8b79ec2493d8f04','[\"*\"]','2025-06-02 11:38:50',NULL,'2025-06-02 10:55:19','2025-06-02 11:38:50'),(25,'App\\Models\\Employer',32,'EmployerToken','30ae2e8804d43830836929a0e9c24628d29a61a49e604588e308d507658a7ffb','[\"*\"]','2025-06-07 00:39:30',NULL,'2025-06-06 11:36:40','2025-06-07 00:39:30'),(26,'App\\Models\\Employer',31,'EmployerToken','fb5f9a80000c7f6ca03186ae34a3adadb0254ebf989730bf8ca504b48d36a0af','[\"*\"]','2025-06-07 00:48:30',NULL,'2025-06-07 00:48:27','2025-06-07 00:48:30'),(30,'App\\Models\\Employer',34,'EmployerToken','90ce5f1e9e27e0e26d7bc13f828d7a6ffa6b4c05757e46fed0874aaae4a12258','[\"*\"]',NULL,NULL,'2025-06-09 10:34:27','2025-06-09 10:34:27'),(31,'App\\Models\\Employer',34,'EmployerToken','28c70990b1ffec335eff4e3202774cdb9352a3abedad2210098b395c8e16b0a5','[\"*\"]','2025-06-09 10:39:30',NULL,'2025-06-09 10:39:21','2025-06-09 10:39:30'),(32,'App\\Models\\Employer',34,'EmployerToken','6ccf6dcca104c70fa49961858d751a1cf5b7c5e9fcfd04d629e9f7dfb1403bc3','[\"*\"]',NULL,NULL,'2025-07-06 03:28:23','2025-07-06 03:28:23'),(33,'App\\Models\\Employer',34,'EmployerToken','a5de8e3365820702f31cadb9eb5d5b648646999fdf97096ebbdadc5f3696053a','[\"*\"]','2025-07-06 08:28:52',NULL,'2025-07-06 03:30:31','2025-07-06 08:28:52'),(34,'App\\Models\\Employer',34,'EmployerToken','ede12bced9a4c1dd6d1edef7ba6ccf5e5821fcfc0f4f7972f77182d406439f43','[\"*\"]',NULL,NULL,'2025-07-09 22:51:51','2025-07-09 22:51:51'),(35,'App\\Models\\Employer',34,'EmployerToken','a871d70b4adb92f17c1a8c20c7f3efe60954217576f42ffa786a2ecba47b5197','[\"*\"]','2025-07-09 23:14:58',NULL,'2025-07-09 22:53:05','2025-07-09 23:14:58'),(36,'App\\Models\\Employer',34,'EmployerToken','ca286b8feeefc1c7cf0bc1a1e074b7f53d9d26fa7a84ffdc5de4e6899f0da4ec','[\"*\"]',NULL,NULL,'2025-07-09 23:37:11','2025-07-09 23:37:11'),(37,'App\\Models\\Employer',34,'EmployerToken','b28737d1452b22453d7209b166d1966f2e12ada7a4342d400f11f044a5777a33','[\"*\"]',NULL,NULL,'2025-07-10 00:11:16','2025-07-10 00:11:16'),(38,'App\\Models\\Employer',34,'EmployerToken','1fc071e9d36cff72c9cfb829b347028d857de0001eaffb26121a5979acf62453','[\"*\"]',NULL,NULL,'2025-07-10 00:20:00','2025-07-10 00:20:00'),(39,'App\\Models\\Employer',34,'EmployerToken','345fbd455af3d9f8d3d599f883ec63d69f7c374cf29ee6aa8a03e5baa7626638','[\"*\"]','2025-07-10 04:20:11',NULL,'2025-07-10 00:20:40','2025-07-10 04:20:11'),(40,'App\\Models\\Employer',34,'EmployerToken','d626c6fbf239ca3517d207c6fb9ff0f26426642d4f9f1078458967b1b2b151c7','[\"*\"]',NULL,NULL,'2025-07-11 08:36:20','2025-07-11 08:36:20'),(41,'App\\Models\\Employer',34,'EmployerToken','b0865c6978cfc721f3d4582e4e6955ac408b7002ad3a967dd063480c9bddeae4','[\"*\"]','2025-07-11 08:38:15',NULL,'2025-07-11 08:37:13','2025-07-11 08:38:15'),(42,'App\\Models\\Employer',34,'EmployerToken','63477e838c288b014519ef08b78cc69adcd75d201ad9de187dd9f6f1fef70cc5','[\"*\"]','2025-07-11 08:50:40',NULL,'2025-07-11 08:50:38','2025-07-11 08:50:40'),(43,'App\\Models\\Candidate',77,'CandidateToken','11fb0f772337667d1a08de5f3421e1e7488f7a20bef9a4384e062918dead0107','[\"*\"]',NULL,NULL,'2025-07-11 09:01:52','2025-07-11 09:01:52'),(44,'App\\Models\\Candidate',77,'CandidateToken','e1ea9586474da76b2f62becede719c08ba28fa631d7a1f8122d39791fbe7bdde','[\"*\"]',NULL,NULL,'2025-07-11 09:03:48','2025-07-11 09:03:48'),(45,'App\\Models\\Candidate',77,'CandidateToken','bbadfd5064341d00fa9b5d6ba9a670d90f2a6f912432ff7ae1fde19907df2d57','[\"*\"]',NULL,NULL,'2025-07-11 10:24:19','2025-07-11 10:24:19'),(46,'App\\Models\\Candidate',77,'CandidateToken','21a47546123c592ac1118f698655f05e4d64efc970399f6018aef21d509e97c3','[\"*\"]',NULL,NULL,'2025-07-11 10:29:27','2025-07-11 10:29:27'),(47,'App\\Models\\Candidate',77,'CandidateToken','a643138747b4691b5626c47576f9e8ffa66b3e149eb189f8d5d8c0a6f32bb32e','[\"*\"]',NULL,NULL,'2025-07-11 10:38:03','2025-07-11 10:38:03'),(48,'App\\Models\\Employer',34,'EmployerToken','131610187d40cd095227b1f21158f17d8eb9c0980d074bafb117281aa67535f7','[\"*\"]','2025-07-12 11:46:41',NULL,'2025-07-12 11:15:18','2025-07-12 11:46:41'),(49,'App\\Models\\Candidate',77,'CandidateToken','e974c97921dd5b8b1c42815a603b4dddcf4b44671af3a4063b9e49842b6379b5','[\"*\"]',NULL,NULL,'2025-07-12 12:05:27','2025-07-12 12:05:27'),(50,'App\\Models\\Employer',34,'EmployerToken','7d3431ad7276ecfe3efa429180edc04d6b160f25b219c91b12204eff82d41760','[\"*\"]','2025-07-12 12:18:04',NULL,'2025-07-12 12:06:16','2025-07-12 12:18:04'),(51,'App\\Models\\Employer',34,'EmployerToken','e229a5497d3053faefd9d585eba259c8dd2a14582b908da24d593abefb26a3df','[\"*\"]','2025-07-12 12:19:02',NULL,'2025-07-12 12:18:51','2025-07-12 12:19:02'),(52,'App\\Models\\Employer',34,'EmployerToken','e189973dccc92d2ff69a1d9158afe8b21f68d4393471bf970b6780abdac0610c','[\"*\"]','2025-07-13 07:58:35',NULL,'2025-07-13 04:57:07','2025-07-13 07:58:35'),(53,'App\\Models\\Candidate',77,'CandidateToken','ec92c45ae5070526d245c95b9bbcef907f547744d302b6c8f85940863cea76d7','[\"*\"]',NULL,NULL,'2025-07-13 08:30:10','2025-07-13 08:30:10'),(54,'App\\Models\\Employer',34,'EmployerToken','ed3ce44cb9acd7a8bd1853927744aedff78f792670cdee3eac05e999c1c826c5','[\"*\"]','2025-07-13 08:34:45',NULL,'2025-07-13 08:31:19','2025-07-13 08:34:45'),(55,'App\\Models\\Employer',34,'EmployerToken','481900c86bb54bdb110d6c89506a95df92fcb580e328748b867ec5619b0c61ab','[\"*\"]','2025-07-14 04:24:08',NULL,'2025-07-14 03:43:16','2025-07-14 04:24:08'),(56,'App\\Models\\Employer',36,'EmployerToken','ddb5dc47ac6d8bf7a67633b97a4be4520ce43749605ce9967872d06b13465b75','[\"*\"]','2025-07-14 09:30:27',NULL,'2025-07-14 05:50:33','2025-07-14 09:30:27'),(57,'App\\Models\\Employer',36,'EmployerToken','087bf51217d7d04c61662ff5339346f1b7da717bf66d9d8d6c3bf8ab2e451220','[\"*\"]','2025-07-14 09:31:11',NULL,'2025-07-14 09:31:07','2025-07-14 09:31:11'),(58,'App\\Models\\Candidate',77,'CandidateToken','464ce5b9d20a251211c2708facf01287f218835f625e673d38e599b37b306425','[\"*\"]',NULL,NULL,'2025-07-14 09:31:59','2025-07-14 09:31:59'),(59,'App\\Models\\Employer',37,'EmployerToken','8e46be1c8228dd760103810650a92b02bf39dcf49075457e718d934304bcf901','[\"*\"]','2025-07-14 23:13:01',NULL,'2025-07-14 23:00:57','2025-07-14 23:13:01'),(60,'App\\Models\\Candidate',77,'CandidateToken','b8b334f7252930b8e1c5813ded34f5816c293de65c5430ddec7a04b2fa9c5aec','[\"*\"]',NULL,NULL,'2025-07-14 23:19:21','2025-07-14 23:19:21'),(61,'App\\Models\\Candidate',77,'CandidateToken','c48d2efccc93db039447fb8dfab9393fbaf548d3ec72216ea0d6c176b3d026c9','[\"*\"]',NULL,NULL,'2025-07-15 00:09:04','2025-07-15 00:09:04'),(62,'App\\Models\\Candidate',77,'candidate-api','fbc63d3e1c0d7b93c748d90c54040e984369cc259f973772d63eb065749e99b2','[\"*\"]','2025-07-15 00:58:43',NULL,'2025-07-15 00:57:21','2025-07-15 00:58:43'),(63,'App\\Models\\Candidate',77,'candidate-api','ce7512d78c6bd57fe650f22bf74cd4a4b1377d297ec81f04c5909a0bad5958af','[\"*\"]',NULL,NULL,'2025-07-15 01:02:14','2025-07-15 01:02:14'),(64,'App\\Models\\Candidate',77,'candidate-api','e6981bc9ee9045290b768c3a05a963162a4e8f9bbfd556915f70420c2a95972a','[\"*\"]','2025-07-15 01:19:57',NULL,'2025-07-15 01:03:49','2025-07-15 01:19:57'),(65,'App\\Models\\Employer',38,'EmployerToken','6fcf88913175845c85d49df386c071d4a6dde98b3852440becfb0ad4eb9068a1','[\"*\"]','2025-07-15 01:54:54',NULL,'2025-07-15 01:54:39','2025-07-15 01:54:54'),(66,'App\\Models\\Candidate',77,'candidate-api','9e75c8fabacb002fb9615873df4c0e3fee5daba0f8d74e3ed90adcd43ef9504a','[\"*\"]','2025-07-15 01:56:43',NULL,'2025-07-15 01:56:08','2025-07-15 01:56:43'),(67,'App\\Models\\Employer',36,'EmployerToken','2dbaef78469cbc46631eafb7488983e16ef1a19ac2d9df8b01bb173a70034b89','[\"*\"]','2025-07-15 01:56:36',NULL,'2025-07-15 01:56:34','2025-07-15 01:56:36'),(68,'App\\Models\\Candidate',77,'candidate-api','c4e85c54229132c6eaa0dd02d8e60fa9260c5b867ddc76415a7a714e0165b951','[\"*\"]','2025-07-15 01:57:17',NULL,'2025-07-15 01:57:16','2025-07-15 01:57:17'),(69,'App\\Models\\Candidate',77,'candidate-api','ce19958dd4022f076807230517c78d5b2227a9e8c9af62bb0fc2eeb8ce00364b','[\"*\"]','2025-07-15 02:21:04',NULL,'2025-07-15 02:13:26','2025-07-15 02:21:04'),(70,'App\\Models\\Candidate',78,'candidate-api','813018dac497f26450c5ea85ce8e2e69a795860a86dd0ce62248fe275bea0d63','[\"*\"]','2025-07-15 02:38:23',NULL,'2025-07-15 02:21:57','2025-07-15 02:38:23'),(71,'App\\Models\\Candidate',78,'candidate-api','1c46a7473f190deb4a87530598f6263359717e0e43a7cab283dc6804a585f1a0','[\"*\"]','2025-07-15 02:38:57',NULL,'2025-07-15 02:38:57','2025-07-15 02:38:57'),(72,'App\\Models\\Employer',36,'EmployerToken','84a880fb28d0149b645057cc90d15ce8ef81aa81694843e748a0007d969c5a57','[\"*\"]','2025-07-16 11:34:34',NULL,'2025-07-16 11:01:16','2025-07-16 11:34:34'),(73,'App\\Models\\Employer',36,'EmployerToken','1ce118c81717f925c0782b3ee983ce63fe6f44e46ac9570215859ab410a2eaea','[\"*\"]','2025-07-17 01:17:57',NULL,'2025-07-17 01:17:52','2025-07-17 01:17:57'),(74,'App\\Models\\Employer',39,'EmployerToken','43070e553eaabcdea0dc3898ebfc5721625176d50adf1d75908a53f7288581c5','[\"*\"]','2025-07-17 02:53:24',NULL,'2025-07-17 01:20:35','2025-07-17 02:53:24'),(75,'App\\Models\\Employer',39,'EmployerToken','c753fceecf8ff94187fe3d48020da90529ee5523fe93af99a924c42de1531e67','[\"*\"]','2025-07-17 03:36:45',NULL,'2025-07-17 03:36:36','2025-07-17 03:36:45'),(76,'App\\Models\\Employer',40,'EmployerToken','c6969fbea81e82bc3e1b2a5c3aa6fb5db383d458eff58f9aba725e9367e25eaf','[\"*\"]','2025-07-18 04:27:26',NULL,'2025-07-17 03:38:28','2025-07-18 04:27:26'),(77,'App\\Models\\Employer',40,'EmployerToken','58654f735786aaaf38e15d574d8462155ef01b8994e2a638e82f706b9d9feeec','[\"*\"]','2025-07-17 06:50:27',NULL,'2025-07-17 06:12:34','2025-07-17 06:50:27'),(78,'App\\Models\\Candidate',77,'candidate-api','3e67d574bb97cd10bc7199f12453813b2e0fa79a19d2e62fce90c9d425ee285f','[\"*\"]','2025-07-18 06:21:06',NULL,'2025-07-18 06:11:37','2025-07-18 06:21:06'),(79,'App\\Models\\Candidate',77,'candidate-api','42ef9ed828a00518c04d1db1ebd9bb830136bd9315c491d471388d710453a2df','[\"*\"]','2025-07-18 08:58:11',NULL,'2025-07-18 06:21:58','2025-07-18 08:58:11'),(80,'App\\Models\\Employer',40,'EmployerToken','311e2b44490822a80817a89e7bd229a32821cda5ccbe368e231041273a972ec3','[\"*\"]','2025-07-18 08:56:42',NULL,'2025-07-18 06:27:06','2025-07-18 08:56:42'),(81,'App\\Models\\Employer',40,'EmployerToken','f2634f9e1f378827babb74592d74007370a558d466d887562378e19fc83e508b','[\"*\"]','2025-07-18 08:58:07',NULL,'2025-07-18 08:57:59','2025-07-18 08:58:07'),(82,'App\\Models\\Candidate',77,'candidate-api','1b3e884d821f16eee45afeffec4b38c816b289466d6a25a7aaa6c7acff437cc8','[\"*\"]','2025-07-18 09:07:19',NULL,'2025-07-18 08:58:48','2025-07-18 09:07:19'),(83,'App\\Models\\Candidate',77,'candidate-api','bdcc08818ddf5dd604bf7a38101fe13feba525f3b78ff8f8ca0b9c04fa60c3f5','[\"*\"]',NULL,NULL,'2025-07-18 09:08:41','2025-07-18 09:08:41'),(84,'App\\Models\\Candidate',78,'candidate-api','ac7bb9306eaa355f1d26d228fe51ba74b9768b8269524da80d777568a80d365f','[\"*\"]',NULL,NULL,'2025-07-18 09:09:53','2025-07-18 09:09:53'),(85,'App\\Models\\Candidate',79,'candidate-api','7ad5be5600fab9baff7b2bb95560f8cd916cef6e473c7ab615b63338d93df00d','[\"*\"]','2025-07-18 09:20:27',NULL,'2025-07-18 09:14:48','2025-07-18 09:20:27'),(86,'App\\Models\\Candidate',79,'candidate-api','3857696d38729c3da83d613bc828bec63ffe615325d314d5702a2b3c36ec6232','[\"*\"]',NULL,NULL,'2025-07-18 09:21:03','2025-07-18 09:21:03'),(87,'App\\Models\\Candidate',80,'candidate-api','ad02f498c602bf66a9aad4e324fd22cdb8269e0e4c49b06382b7c25bb6b25de4','[\"*\"]',NULL,NULL,'2025-07-18 09:22:23','2025-07-18 09:22:23'),(88,'App\\Models\\Candidate',77,'candidate-api','76b7ed42999ccf27a3b3ae00333185d0c0a4b8b4cb47c6445cac7f6c5dccac25','[\"*\"]','2025-07-18 09:28:25',NULL,'2025-07-18 09:25:13','2025-07-18 09:28:25'),(89,'App\\Models\\Candidate',81,'candidate-api','f7900a47b312c62accb618b940ed9d580e2968a4302c1b5eefbaa4e96095e404','[\"*\"]','2025-07-18 10:29:49',NULL,'2025-07-18 10:15:45','2025-07-18 10:29:49'),(90,'App\\Models\\Employer',40,'EmployerToken','a2668fab083d8ff603499138a099983e6cf72b1b641f0a5087def18e152c31d2','[\"*\"]','2025-07-18 10:24:24',NULL,'2025-07-18 10:24:21','2025-07-18 10:24:24'),(91,'App\\Models\\Employer',40,'EmployerToken','64a74387564147fb0a23e3bff5c2ce69481d0d75ed155cce73eb5a384b408955','[\"*\"]','2025-07-18 10:26:59',NULL,'2025-07-18 10:26:05','2025-07-18 10:26:59'),(92,'App\\Models\\Employer',40,'EmployerToken','2cbc64ebf759efc6983115da678ddabfc379e8cc759d0d91eabb70889e8a0964','[\"*\"]','2025-07-18 10:29:21',NULL,'2025-07-18 10:29:18','2025-07-18 10:29:21');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1),(60,1),(61,1),(62,1),(63,1),(64,1),(65,1),(66,1);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Counsellor','web','2025-07-17 01:27:47','2025-07-17 01:27:47');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
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
INSERT INTO `sessions` VALUES ('mO0bOwkmjqMEFUDb6173ShABBV07MyOUnprQ5DuX',1,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','YTo5OntzOjY6Il90b2tlbiI7czo0MDoiSUhTZ0J2aWxSdG5pbVZaR3NYd1lKVDRBeGh1b2J6NlFxdlFxV3FvdSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjU3OiJodHRwOi8vbG9jYWxob3N0OjgwMDAvYWRtaW4vY2FuZGlkYXRlcz90YWJsZVNlYXJjaD1tYW5zaHUiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTIkTGlDYy9XS25jRzVkU2E1T2lzbThxT2hMWnl2bXc4M3RQN2szNGZQS3dUUTM2bjgxWHNhQ20iO3M6NDA6IjQ4MDQwZWY3ZjI1NDJiMzliOWJhOWE3Mjk4M2IwZDg4X2ZpbHRlcnMiO2E6Mjp7czo5OiJzdGFydERhdGUiO047czo3OiJlbmREYXRlIjtOO31zOjY6InRhYmxlcyI7YToxOntzOjQxOiI5OTRmMDIwMmI3NmEzYzZmM2ZkZTg5NjNiNTkwMjI0ZF9wZXJfcGFnZSI7czozOiJhbGwiO31zOjg6ImZpbGFtZW50IjthOjA6e319',1752850415);
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
  `avatar_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin@mail.com',NULL,'$2y$12$LiCc/WKncG5dSa5Oism8qOhLZyvmw83tP7k34fPKwTQ36n81XsaCm','j7HAVTEd43QkWSHm4kzTHi6a3x6I1LqlwZfnpz6xmTP9sEuegD31V9NXxkZ4','2025-05-01 09:56:07','2025-07-16 22:59:43','01K0BAAEMAC0S9A461N5BP5JYY.jpg');
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

-- Dump completed on 2025-07-18 21:35:13
