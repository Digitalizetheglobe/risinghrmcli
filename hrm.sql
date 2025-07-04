-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hrm
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
-- Table structure for table `account_lists`
--

DROP TABLE IF EXISTS `account_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_lists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `account_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `initial_balance` double(20,2) NOT NULL DEFAULT '0.00',
  `account_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `branch_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_branch` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_lists`
--

LOCK TABLES `account_lists` WRITE;
/*!40000 ALTER TABLE `account_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_payment_settings`
--

DROP TABLE IF EXISTS `admin_payment_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_payment_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_payment_settings_name_created_by_unique` (`name`,`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_payment_settings`
--

LOCK TABLES `admin_payment_settings` WRITE;
/*!40000 ALTER TABLE `admin_payment_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_payment_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `allowance_options`
--

DROP TABLE IF EXISTS `allowance_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allowance_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allowance_options`
--

LOCK TABLES `allowance_options` WRITE;
/*!40000 ALTER TABLE `allowance_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `allowance_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `allowances`
--

DROP TABLE IF EXISTS `allowances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allowances` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `allowance_option` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(15,2) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allowances`
--

LOCK TABLES `allowances` WRITE;
/*!40000 ALTER TABLE `allowances` DISABLE KEYS */;
/*!40000 ALTER TABLE `allowances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcement_employees`
--

DROP TABLE IF EXISTS `announcement_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcement_employees` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `announcement_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement_employees`
--

LOCK TABLES `announcement_employees` WRITE;
/*!40000 ALTER TABLE `announcement_employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcement_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `branch_id` int NOT NULL,
  `department_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_letters`
--

DROP TABLE IF EXISTS `appointment_letters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_letters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_letters`
--

LOCK TABLES `appointment_letters` WRITE;
/*!40000 ALTER TABLE `appointment_letters` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_letters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appraisals`
--

DROP TABLE IF EXISTS `appraisals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appraisals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch` int NOT NULL DEFAULT '0',
  `employee` int NOT NULL DEFAULT '0',
  `rating` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `appraisal_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_experience` int NOT NULL DEFAULT '0',
  `marketing` int NOT NULL DEFAULT '0',
  `administration` int NOT NULL DEFAULT '0',
  `professionalism` int NOT NULL DEFAULT '0',
  `integrity` int NOT NULL DEFAULT '0',
  `attendance` int NOT NULL DEFAULT '0',
  `remark` text COLLATE utf8mb4_unicode_ci,
  `created_by` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appraisals`
--

LOCK TABLES `appraisals` WRITE;
/*!40000 ALTER TABLE `appraisals` DISABLE KEYS */;
/*!40000 ALTER TABLE `appraisals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `purchase_date` date NOT NULL,
  `supported_date` date NOT NULL,
  `amount` double(20,2) NOT NULL DEFAULT '0.00',
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance_employees`
--

DROP TABLE IF EXISTS `attendance_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance_employees` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `date` date NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clock_in` time NOT NULL,
  `clock_out` time NOT NULL,
  `late` time NOT NULL,
  `early_leaving` time NOT NULL,
  `overtime` time NOT NULL,
  `total_rest` time NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance_employees`
--

LOCK TABLES `attendance_employees` WRITE;
/*!40000 ALTER TABLE `attendance_employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendance_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `award_types`
--

DROP TABLE IF EXISTS `award_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `award_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `award_types`
--

LOCK TABLES `award_types` WRITE;
/*!40000 ALTER TABLE `award_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `award_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `awards`
--

DROP TABLE IF EXISTS `awards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `awards` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `award_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `gift` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `awards`
--

LOCK TABLES `awards` WRITE;
/*!40000 ALTER TABLE `awards` DISABLE KEYS */;
/*!40000 ALTER TABLE `awards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_forms`
--

DROP TABLE IF EXISTS `booking_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_forms` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `primary_applicant_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primary_applicant_contact_no` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primary_applicant_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primary_applicant_occupation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primary_applicant_company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primary_applicant_designation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primary_applicant_birth_date` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primary_applicant_nationality` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primary_applicant_pan_no` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primary_applicant_aadhar_no` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_applicant_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_applicant_contact_no` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_applicant_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_applicant_occupation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_applicant_company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_applicant_designation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_applicant_birth_date` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_applicant_nationality` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_applicant_pan_no` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_applicant_aadhar_no` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_id` bigint unsigned DEFAULT NULL,
  `unit_id` int DEFAULT NULL,
  `unit_size` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `plot_area` decimal(10,2) DEFAULT NULL,
  `carpet_area` decimal(10,2) DEFAULT NULL,
  `rate_per_sq_ft` decimal(10,2) DEFAULT NULL,
  `basic_cost` decimal(15,2) DEFAULT NULL,
  `cost_infrastructure` decimal(15,2) DEFAULT NULL,
  `gst` decimal(15,2) DEFAULT NULL,
  `stamp_duty` decimal(15,2) DEFAULT NULL,
  `registration` decimal(15,2) DEFAULT NULL,
  `maintenance_cost` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `other` decimal(15,2) DEFAULT NULL,
  `total_cost` decimal(20,2) DEFAULT NULL,
  `payment_data` longtext COLLATE utf8mb4_unicode_ci,
  `remaining` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_forms`
--

LOCK TABLES `booking_forms` WRITE;
/*!40000 ALTER TABLE `booking_forms` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branches` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branches`
--

LOCK TABLES `branches` WRITE;
/*!40000 ALTER TABLE `branches` DISABLE KEYS */;
INSERT INTO `branches` VALUES (1,'Pune',2,'2025-07-04 07:33:43','2025-07-04 07:33:43');
/*!40000 ALTER TABLE `branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ch_favorites`
--

DROP TABLE IF EXISTS `ch_favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ch_favorites` (
  `id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `favorite_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ch_favorites`
--

LOCK TABLES `ch_favorites` WRITE;
/*!40000 ALTER TABLE `ch_favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `ch_favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ch_messages`
--

DROP TABLE IF EXISTS `ch_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ch_messages` (
  `id` bigint NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_id` bigint NOT NULL,
  `to_id` bigint NOT NULL,
  `body` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ch_messages`
--

LOCK TABLES `ch_messages` WRITE;
/*!40000 ALTER TABLE `ch_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `ch_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commissions`
--

DROP TABLE IF EXISTS `commissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(15,2) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commissions`
--

LOCK TABLES `commissions` WRITE;
/*!40000 ALTER TABLE `commissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `commissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comp_off_leave_logs`
--

DROP TABLE IF EXISTS `comp_off_leave_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comp_off_leave_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comp_off_leave_logs`
--

LOCK TABLES `comp_off_leave_logs` WRITE;
/*!40000 ALTER TABLE `comp_off_leave_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `comp_off_leave_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comp_off_leaves`
--

DROP TABLE IF EXISTS `comp_off_leaves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comp_off_leaves` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employees_id` int unsigned NOT NULL,
  `comp_off_date` date NOT NULL,
  `comp_off_data` tinyint DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comp_off_leaves`
--

LOCK TABLES `comp_off_leaves` WRITE;
/*!40000 ALTER TABLE `comp_off_leaves` DISABLE KEYS */;
/*!40000 ALTER TABLE `comp_off_leaves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comp_offs`
--

DROP TABLE IF EXISTS `comp_offs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comp_offs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comp_offs`
--

LOCK TABLES `comp_offs` WRITE;
/*!40000 ALTER TABLE `comp_offs` DISABLE KEYS */;
/*!40000 ALTER TABLE `comp_offs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_policies`
--

DROP TABLE IF EXISTS `company_policies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_policies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_policies`
--

LOCK TABLES `company_policies` WRITE;
/*!40000 ALTER TABLE `company_policies` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_policies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competencies`
--

DROP TABLE IF EXISTS `competencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `competencies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competencies`
--

LOCK TABLES `competencies` WRITE;
/*!40000 ALTER TABLE `competencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `competencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaints`
--

DROP TABLE IF EXISTS `complaints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complaints` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `complaint_from` int NOT NULL,
  `complaint_against` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `complaint_date` date NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaints`
--

LOCK TABLES `complaints` WRITE;
/*!40000 ALTER TABLE `complaints` DISABLE KEYS */;
/*!40000 ALTER TABLE `complaints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract_attechments`
--

DROP TABLE IF EXISTS `contract_attechments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract_attechments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `contract_id` bigint unsigned NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `files` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract_attechments`
--

LOCK TABLES `contract_attechments` WRITE;
/*!40000 ALTER TABLE `contract_attechments` DISABLE KEYS */;
/*!40000 ALTER TABLE `contract_attechments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract_comments`
--

DROP TABLE IF EXISTS `contract_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract_comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `contract_id` bigint unsigned NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract_comments`
--

LOCK TABLES `contract_comments` WRITE;
/*!40000 ALTER TABLE `contract_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `contract_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract_notes`
--

DROP TABLE IF EXISTS `contract_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract_notes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `contract_id` int NOT NULL,
  `user_id` int NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract_notes`
--

LOCK TABLES `contract_notes` WRITE;
/*!40000 ALTER TABLE `contract_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `contract_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract_types`
--

DROP TABLE IF EXISTS `contract_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract_types`
--

LOCK TABLES `contract_types` WRITE;
/*!40000 ALTER TABLE `contract_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `contract_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contracts`
--

DROP TABLE IF EXISTS `contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contracts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employee_name` int NOT NULL,
  `value` double(15,2) DEFAULT NULL,
  `type` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `contract_description` longtext COLLATE utf8mb4_unicode_ci,
  `employee_signature` longtext COLLATE utf8mb4_unicode_ci,
  `company_signature` longtext COLLATE utf8mb4_unicode_ci,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contracts`
--

LOCK TABLES `contracts` WRITE;
/*!40000 ALTER TABLE `contracts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contracts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` double(8,2) NOT NULL DEFAULT '0.00',
  `limit` int NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_active` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupons`
--

LOCK TABLES `coupons` WRITE;
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_questions`
--

DROP TABLE IF EXISTS `custom_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_questions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_required` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_questions`
--

LOCK TABLES `custom_questions` WRITE;
/*!40000 ALTER TABLE `custom_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_quotes`
--

DROP TABLE IF EXISTS `daily_quotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daily_quotes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `quote` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_quotes`
--

LOCK TABLES `daily_quotes` WRITE;
/*!40000 ALTER TABLE `daily_quotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `daily_quotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deduction_options`
--

DROP TABLE IF EXISTS `deduction_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deduction_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deduction_options`
--

LOCK TABLES `deduction_options` WRITE;
/*!40000 ALTER TABLE `deduction_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `deduction_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,1,'Sales',2,'2025-07-04 07:35:42','2025-07-04 07:35:42');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deposits`
--

DROP TABLE IF EXISTS `deposits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deposits` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int NOT NULL,
  `amount` double(15,2) NOT NULL,
  `date` date NOT NULL,
  `income_category_id` int NOT NULL,
  `payer_id` int NOT NULL,
  `payment_type_id` int NOT NULL,
  `referal_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deposits`
--

LOCK TABLES `deposits` WRITE;
/*!40000 ALTER TABLE `deposits` DISABLE KEYS */;
/*!40000 ALTER TABLE `deposits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `designations`
--

DROP TABLE IF EXISTS `designations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `designations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int DEFAULT NULL,
  `department_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `designations`
--

LOCK TABLES `designations` WRITE;
/*!40000 ALTER TABLE `designations` DISABLE KEYS */;
INSERT INTO `designations` VALUES (1,1,1,'Executive',2,'2025-07-04 07:36:44','2025-07-04 07:36:44');
/*!40000 ALTER TABLE `designations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_required` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ducument_uploads`
--

DROP TABLE IF EXISTS `ducument_uploads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ducument_uploads` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ducument_uploads`
--

LOCK TABLES `ducument_uploads` WRITE;
/*!40000 ALTER TABLE `ducument_uploads` DISABLE KEYS */;
/*!40000 ALTER TABLE `ducument_uploads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_template_langs`
--

DROP TABLE IF EXISTS `email_template_langs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_template_langs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int NOT NULL,
  `lang` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_template_langs`
--

LOCK TABLES `email_template_langs` WRITE;
/*!40000 ALTER TABLE `email_template_langs` DISABLE KEYS */;
INSERT INTO `email_template_langs` VALUES (1,1,'ar','New User','<p>مرحبا,</p>\n                    <p>مرحبا بك في { app_name }.</p>\n                    <p>.. أنت الآن مستعمل</p>\n                    <p>البريد الالكتروني : { mail } كلمة السرية : { password }</p>\n                    <p>{ app_url }</p>\n                    <p>شكرا</p>\n                    <p>{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(2,1,'da','New User','<p>Hej,</p>\n                    <p>velkommen til { app_name }.</p>\n                    <p>Du er nu bruger ..</p>\n                    <p>E-mail: { email }</p>\n                    <p>kodeord: { password }</p>\n                    <p>{ app_url }</p>\n                    <p>Tak.</p>\n                    <p>{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(3,1,'de','New User','<p>Hallo,</p>\n                    <p>Willkommen bei {app_name}.</p>\n                    <p>Sie sind jetzt Benutzer.</p>\n                    <p><strong>E-Mail: {email} </strong></p>\n                    <p><strong>Kennwort: {password}</strong></p>\n                    <p>{app_url}</p>\n                    <p>Danke,</p>\n                    <p>{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(4,1,'en','New User','<p>Hello,&nbsp;<br />Welcome to {app_name}.</p>\n                    <p><strong>You are now user..</strong></p>\n                    <p><strong>Email </strong>: {email}<br /><strong>Password</strong> : {password}</p>\n                    <p>{app_url}</p>\n                    <p>Thanks,<br />{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(5,1,'es','New User','<p>Hola,</p>\n                    <p>Bienvenido a {app_name}.</p>\n                    <p>Ahora es usuario ..</p>\n                    <p><strong>Correo electr&oacute;nico: {email}</strong></p>\n                    <p><strong> Contrase&ntilde;a: {password}</strong></p>\n                    <p>{app_url}</p>\n                    <p>Gracias,</p>\n                    <p>{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(6,1,'fr','New User','<p>Bonjour,</p>\n                    <p>Bienvenue dans { app_name }.</p>\n                    <p>Vous &ecirc;tes maintenant utilisateur.</p>\n                    <p><strong>E-mail: { email } </strong></p>\n                    <p><strong>Mot de passe: { password }</strong></p>\n                    <p>{ adresse_url }</p>\n                    <p>Merci,</p>\n                    <p>{ nom_app }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(7,1,'it','New User','<p>Ciao,</p>\n                    <p>Benvenuti in {app_name}.</p>\n                    <p>Ora sei utente ..</p>\n                    <p><strong>Email: {email} </strong></p>\n                    <p><strong>Password: {password}</strong></p>\n                    <p>{app_url}</p>\n                    <p>Grazie,</p>\n                    <p>{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(8,1,'ja','New User','<p>こんにちは、</p>\n                    <p>{app_name}へようこそ。</p>\n                    <p>これで、ユーザーは</p>\n                    <p><strong>E メール : {email}</strong></p>\n                    <p><strong> パスワード : {password}</strong></p>\n                    <p>{app_url}</p>\n                    <p>ありがとう。</p>\n                    <p>{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(9,1,'nl','New User','<p>Hallo,</p>\n                    <p>Welkom bij { app_name }.</p>\n                    <p>U bent nu gebruiker ..</p>\n                    <p><strong>E-mail: { email }</strong></p>\n                    <p><strong> Wachtwoord: { password }</strong></p>\n                    <p>{ app_url }</p>\n                    <p>Bedankt.</p>\n                    <p>{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(10,1,'pl','New User','<p>Witaj,</p>\n                    <p>Witamy w aplikacji {app_name }.</p>\n                    <p>Jesteś teraz użytkownikiem ..</p>\n                    <p><strong>E-mail</strong>: {email }</p>\n                    <p><strong>Hasło</strong>: {password }</p>\n                    <p>{app_url }</p>\n                    <p>Dziękuję,</p>\n                    <p>{app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(11,1,'ru','New User','<p>Здравствуйте,</p>\n                    <p>Добро пожаловать в { app_name }.</p>\n                    <p>Вы теперь пользователь ..</p>\n                    <p><strong>Адрес электронной почты</strong>: { email }</p>\n                    <p><strong> Пароль</strong>: { password }</p>\n                    <p>{ app_url }</p>\n                    <p>Спасибо.</p>\n                    <p>{ app_name&nbsp;}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(12,1,'pt','New User','<p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Ol&aacute;, </span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Bem-vindo a {app_name}.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Voc&ecirc; agora &eacute; usu&aacute;rio ..</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\"><strong>E-mail</strong>: {email}</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\"><strong> Senha</strong>: {senha}</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">{app_url}</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Obrigado,</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">{app_name}</span></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(13,1,'tr','New User','<p>Merhaba,&nbsp;<br />Hoşgeldiniz {app_name}.</p>\n                    <p><strong>artık kullanıcısın..</strong></p>\n                    <p><strong>E-posta </strong>: {email}<br /><strong>Şifre</strong> : {password}</p>\n                    <p>{app_url}</p>\n                    <p>Teşekkürler,<br />{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(14,1,'zh','New User','<p>你好,&nbsp;<br />欢迎来到 {app_name}.</p>\n                    <p><strong>您现在是用户..</strong></p>\n                    <p><strong>电子邮件 </strong>: {email}<br /><strong>密码</strong> : {password}</p>\n                    <p>{app_url}</p>\n                    <p>谢谢,<br />{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(15,1,'he','New User','<p>שלום,&nbsp;<br />ברוך הבא ל {app_name}.</p>\n                    <p><strong>אתה כעת משתמש..</strong></p>\n                    <p><strong>אימייל </strong>: {email}<br /><strong>סיסמה</strong> : {password}</p>\n                    <p>{app_url}</p>\n                    <p>תודה,<br />{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(16,1,'pt-br','New User','<p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Ol&aacute;, </span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Bem-vindo a {app_name}.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Voc&ecirc; agora &eacute; usu&aacute;rio ..</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\"><strong>E-mail</strong>: {email}</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\"><strong> Senha</strong>: {senha}</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">{app_url}</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Obrigado,</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">{app_name}</span></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(17,2,'ar','New Employee','<p>مرحبا { employe_name } ،</p>\n                    <p>مرحبا بك في { app_name }.</p>\n                    <p>أنت الآن موظف</p>\n                    <p>البريد الالكتروني : { employe_email }</p>\n                    <p>كلمة السرية : { employe_password }</p>\n                    <p>{ app_url }</p>\n                    <p>شكرا</p>\n                    <p>{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(18,2,'da','New Employee','<p>Hej { employee_name },</p>\n                    <p>velkommen til { app_name }.</p>\n                    <p>Du er nu ansat ...</p>\n                    <p>E-mail: { employee_email }</p>\n                    <p>Kodeord: { employee_kodeord }</p>\n                    <p>{ app_url }</p>\n                    <p>Tak.</p>\n                    <p>{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(19,2,'de','New Employee','<p>Hello {employee_name},</p>\n                    <p>Willkommen bei {app_name}.</p>\n                    <p>Sie sind jetzt Mitarbeiter.</p>\n                    <p>E-Mail: {employee_email}</p>\n                    <p>Kennwort: {employee_password}</p>\n                    <p>{app_url}</p>\n                    <p>Danke,</p>\n                    <p>{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(20,2,'en','New Employee','<p>Hello {employee_name},&nbsp;<br />Welcome to {app_name}.</p>\n                    <p>You are now Employee..</p>\n                    <p><strong>Email </strong>: {employee_email}</p>\n                    <p><strong>Password</strong> : {employee_password}</p>\n                    <p>{app_url}</p>\n                    <p>Thanks,<br />{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(21,2,'es','New Employee','<p style=\"line-height: 28px;\">Hello {employee_name},</p>\n                    <p style=\"line-height: 28px;\">Bienvenido a {app_name}.</p>\n                    <p style=\"line-height: 28px;\">Ahora es Empleado.</p>\n                    <p style=\"line-height: 28px;\">Correo electr&oacute;nico: {employee_email}</p>\n                    <p style=\"line-height: 28px;\">Contrase&ntilde;a: {employee_password}</p>\n                    <p style=\"line-height: 28px;\">{app_url}</p>\n                    <p style=\"line-height: 28px;\">Gracias,</p>\n                    <p style=\"line-height: 28px;\">{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(22,2,'fr','New Employee','<p style=\"line-height: 28px;\">Hello { employee_name },</p>\n                    <p style=\"line-height: 28px;\">Bienvenue dans { app_name }.</p>\n                    <p style=\"line-height: 28px;\">Vous &ecirc;tes maintenant Employ&eacute; ..</p>\n                    <p style=\"line-height: 28px;\">Adresse &eacute;lectronique: { employee_email }</p>\n                    <p style=\"line-height: 28px;\">Mot de passe: { employee_password }</p>\n                    <p style=\"line-height: 28px;\">{ adresse_url }</p>\n                    <p style=\"line-height: 28px;\">Merci,</p>\n                    <p style=\"line-height: 28px;\">{ nom_app }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(23,2,'it','New Employee','<p style=\"line-height: 28px;\">Hello {employee_name},</p>\n                    <p style=\"line-height: 28px;\">Benvenuti in {app_name}.</p>\n                    <p style=\"line-height: 28px;\">Ora sei Dipendente ..</p>\n                    <p style=\"line-height: 28px;\">Email: {employee_email}</p>\n                    <p style=\"line-height: 28px;\">Password: {employee_password}</p>\n                    <p style=\"line-height: 28px;\">{app_url}</p>\n                    <p style=\"line-height: 28px;\">Grazie,</p>\n                    <p style=\"line-height: 28px;\">{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(24,2,'ja','New Employee','<p>{ employee_name} にようこそ、</p>\n                    <p>{app_name}へようこそ。</p>\n                    <p>今は従業員です。</p>\n                    <p>E メール : {employee_email}</p>\n                    <p>パスワード : {employee_password}</p>\n                    <p>{app_url}</p>\n                    <p>ありがとう。</p>\n                    <p>{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(25,2,'nl','New Employee','<p style=\"line-height: 28px;\">Hallo { employee_name },</p>\n                    <p style=\"line-height: 28px;\">Welkom bij { app_name }.</p>\n                    <p style=\"line-height: 28px;\">U bent nu werknemer ..</p>\n                    <p style=\"line-height: 28px;\">E-mail: { employee_email }</p>\n                    <p style=\"line-height: 28px;\">Wachtwoord: { employee_password }</p>\n                    <p style=\"line-height: 28px;\">{ app_url }</p>\n                    <p style=\"line-height: 28px;\">Bedankt.</p>\n                    <p style=\"line-height: 28px;\">{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(26,2,'pl','New Employee','<p style=\"line-height: 28px;\">Witaj {employee_name },</p>\n                    <p style=\"line-height: 28px;\">Witamy w aplikacji {app_name }.</p>\n                    <p style=\"line-height: 28px;\">Jesteś teraz Pracownik ..</p>\n                    <p style=\"line-height: 28px;\">E-mail: {employee_email }</p>\n                    <p style=\"line-height: 28px;\">Hasło: {employee_password }</p>\n                    <p style=\"line-height: 28px;\">{app_url }</p>\n                    <p style=\"line-height: 28px;\">Dziękuję,</p>\n                    <p style=\"line-height: 28px;\">{app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(27,2,'ru','New Employee','<p style=\"line-height: 28px;\">Здравствуйте, { employee_name },</p>\n                    <p style=\"line-height: 28px;\">Добро пожаловать в { app_name }.</p>\n                    <p style=\"line-height: 28px;\">Вы теперь-сотрудник ...</p>\n                    <p style=\"line-height: 28px;\">Электронная почта: { employee_email }</p>\n                    <p style=\"line-height: 28px;\">Пароль: { employee_password }</p>\n                    <p style=\"line-height: 28px;\">{ app_url }</p>\n                    <p style=\"line-height: 28px;\">Спасибо.</p>\n                    <p style=\"line-height: 28px;\">{ имя_программы }</p> ','2025-02-06 06:40:27','2025-02-06 06:40:27'),(28,2,'pt','New Employee','<p>Ol&aacute; {employee_name},</p>\n                    <p>Bem-vindo a {app_name}.</p>\n                    <p>Voc&ecirc; &eacute; agora Funcion&aacute;rio ..</p>\n                    <p>E-mail: {employee_email}</p>\n                    <p>Senha: {employee_password}</p>\n                    <p>{app_url}</p>\n                    <p>Obrigado,</p>\n                    <p>{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(29,2,'tr','New Employee','<p>Merhaba {employee_name},&nbsp;<br />Hoşgeldiniz {app_name}.</p>\n                    <p>Artık Çalışansın..</p>\n                    <p><strong>E-posta </strong>: {employee_email}</p>\n                    <p><strong>Şifre</strong> : {employee_password}</p>\n                    <p>{app_url}</p>\n                    <p>Teşekkürler,<br />{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(30,2,'zh','New Employee','<p>你好 {employee_name},&nbsp;<br />欢迎来到 {app_name}.</p>\n                    <p>您现在是员工..</p>\n                    <p><strong>电子邮件 </strong>: {employee_email}</p>\n                    <p><strong>密码</strong> : {employee_password}</p>\n                    <p>{app_url}</p>\n                    <p>谢谢,<br />{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(31,2,'he','New Employee','<p>שלום {employee_name},&nbsp;<br />ברוך הבא ל {app_name}.</p>\n                    <p>אתה עכשיו עובד..</p>\n                    <p><strong>אימייל </strong>: {employee_email}</p>\n                    <p><strong>סיסמה</strong> : {employee_password}</p>\n                    <p>{app_url}</p>\n                    <p>תודה,<br />{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(32,2,'pt-br','New Employee','<p>Ol&aacute; {employee_name},</p>\n                    <p>Bem-vindo a {app_name}.</p>\n                    <p>Voc&ecirc; &eacute; agora Funcion&aacute;rio ..</p>\n                    <p>E-mail: {employee_email}</p>\n                    <p>Senha: {employee_password}</p>\n                    <p>{app_url}</p>\n                    <p>Obrigado,</p>\n                    <p>{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(33,3,'ar','New Payroll','<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Subject :-إدارة الموارد البشرية / الشركة المعنية بإرسال المدفوعات عن طريق البريد الإلكتروني في وقت تأكيد الدفع.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">مرحبا { name } ،</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">أتمنى أن يجدك هذا البريد الإلكتروني جيدا برجاء الرجوع الى الدفع المتصل الى { salary_month&nbsp;}.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">اضغط ببساطة على الاختيار بأسفل</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">كشوف المرتبات</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">إشعر بالحرية للوصول إلى الخارج إذا عندك أي أسئلة.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">شكرا لك</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Regards,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">إدارة الموارد البشرية ،</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{ app_name }</span></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(34,3,'da','New Payroll','<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Om: HR-departementet / Kompagniet til at sende l&oslash;nsedler via e-mail p&aring; tidspunktet for bekr&aelig;ftelsen af l&oslash;nsedlerne</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Hej { name },</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">H&aring;ber denne e-mail finder dig godt! Se vedh&aelig;ftet payseddel for { salary_month }.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">klik bare p&aring; knappen nedenfor</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">L&oslash;nseddel</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Du er velkommen til at r&aelig;kke ud, hvis du har nogen sp&oslash;rgsm&aring;l.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Tak.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Med venlig hilsen</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">HR-afdelingen,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{ app_name }</span></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(35,3,'de','New Payroll','<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Betrifft: -Personalabteilung/Firma, um Payslips per E-Mail zum Zeitpunkt der Best&auml;tigung des Auszahlungsscheins zu senden</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Hi {name},</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Hoffe, diese E-Mail findet dich gut! Bitte sehen Sie den angeh&auml;ngten payslip f&uuml;r {salary_month}.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Klicken Sie einfach auf den Button unten</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Payslip</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">F&uuml;hlen Sie sich frei, wenn Sie Fragen haben.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Danke.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Betrachtet,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Personalabteilung,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{app_name}</span></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(36,3,'en','New Payroll','<p><strong>Subject</strong>:-HR department/Company to send payslips by email at time of confirmation of payslip</p>\n                    <p>Hi {name},</p>\n                    <p>Hope this email ﬁnds you well! Please see attached payslip for {salary_month}.</p>\n                    <p style=\"text-align: center;\" align=\"center\"><strong>simply click on the button below </strong></p>\n                    <p style=\"text-align: center;\" align=\"center\"><span style=\"font-size: 18pt;\"><a style=\"background: #6676ef; color: #ffffff; font-family: \"Open Sans\", Helvetica, Arial, sans-serif; font-weight: normal; line-height: 120%; margin: 0px; text-decoration: none; text-transform: none;\" href=\"{url}\" target=\"_blank\" rel=\"noopener\"> <strong style=\"color: white; font-weight: bold; text: white;\">Payslip</strong> </a></span></p>\n                    <p style=\"text-align: left;\" align=\"center\">Feel free to reach out if you have any questions.</p>\n                    <p>Thank you</p>\n                    <p><strong>Regards,</strong></p>\n                    <p><strong>HR Department,</strong></p>\n                    <p><span style=\"color: #000000; font-family: \"Open Sans\", sans-serif; font-size: 14px; background-color: #ffffff;\">{<strong>app_name</strong>}</span></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(37,3,'es','New Payroll','<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Asunto: -Departamento de RRHH/Empresa para enviar n&oacute;minas por correo electr&oacute;nico en el momento de la confirmaci&oacute;n del pago</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Hi {name},</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">&iexcl;Espero que este email le encuentre bien! Consulte la ficha de pago adjunta para {salary_month}.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">simplemente haga clic en el bot&oacute;n de abajo</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Payslip</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Si&eacute;ntase libre de llegar si usted tiene alguna pregunta.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">&iexcl;Gracias!</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Considerando,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Departamento de Recursos Humanos,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{app_name}</span></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(38,3,'fr','New Payroll','<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Objet: -Ressources humaines / Entreprise pour envoyer des feuillets de paie par courriel au moment de la confirmation du paiement</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Salut { name },</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Jesp&egrave;re que ce courriel vous trouve bien ! Veuillez consulter le bordereau de paie ci-joint pour { salary_month }.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Il suffit de cliquer sur le bouton ci-dessous</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Feuillet de paiement</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Nh&eacute;sitez pas &agrave; nous contacter si vous avez des questions.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Je vous remercie</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Regards,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">D&eacute;partement des RH,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{ app_name }</span></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(39,3,'it','New Payroll','<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Oggetto: - Dipartimento HR / Societ&agrave; per inviare busta paga via email al momento della conferma della busta paga</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Ciao {name},</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Spero che questa email ti trovi bene! Si prega di consultare la busta paga per {salary_month}.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">semplicemente clicca sul pulsante sottostante</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Busta paga</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Sentiti libero di raggiungere se hai domande.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Grazie</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Riguardo,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Dipartimento HR,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{app_name}</span></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(40,3,'ja','New Payroll','<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">件名:-HR 部門/企業は、給与明細書の確認時に電子メールで支払いを送信します。</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">こんにちは {name}、</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">この E メールでよくご確認ください。 {salary_month}の添付された payslip を参照してください。</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">下のボタンをクリックするだけで</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">給与明細書</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">質問がある場合は、自由に連絡してください。</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">ありがとう</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">よろしく</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">HR 部門</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{app_name}</span></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(41,3,'nl','New Payroll','<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Betreft: -HR-afdeling/Bedrijf om te betalen payslips per e-mail op het moment van bevestiging van de payslip</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Hallo { name },</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Hoop dat deze e-mail je goed vindt! Zie bijgevoegde payslip voor { salary_month }.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">gewoon klikken op de knop hieronder</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Loonstrook</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Voel je vrij om uit te reiken als je vragen hebt.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Dank u wel</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Betreft:</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">HR-afdeling,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{ app_name }</span></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(42,3,'pl','New Payroll','<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Temat:-Dział HR/Firma do wysyłania payslip&oacute;w drogą mailową w czasie potwierdzania payslipa</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Witaj {name },</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Mam nadzieję, że ta wiadomość znajdzie Cię dobrze! Patrz załączony payslip dla {salary_month }.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">po prostu kliknij na przycisk poniżej</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Payslip</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Czuj się swobodnie, jeśli masz jakieś pytania.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Dziękujemy</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">W odniesieniu do</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Dział HR,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{app_name }</span></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(43,3,'ru','New Payroll','<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Тема: -HR отдел/Компания для отправки паузу по электронной почте во время подтверждения паузли</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Привет { name },</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Надеюсь, это электронное письмо найдет вас хорошо! См. вложенный раздел для { salary_month }.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">просто нажмите на кнопку внизу</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Паушлип</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Не стеснитесь, если у вас есть вопросы.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Спасибо.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">С уважением,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Отдел кадров,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{ app_name }</span></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(44,3,'pt','New Payroll','<p>Assunto:-Departamento de RH / Empresa para enviar payslips por e-mail no momento da confirma&ccedil;&atilde;o do payslip</p>\n                    <p>Oi {name},</p>\n                    <p>Espero que este e-mail encontre voc&ecirc; bem! Por favor, consulte o payslip anexado por {salary_month}.</p>\n                    <p>basta clicar no bot&atilde;o abaixo</p>\n                    <p>Payslip</p>\n                    <p>Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</p>\n                    <p>Obrigado</p>\n                    <p>Considera,</p>\n                    <p>Departamento de RH,</p>\n                    <p>{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(45,3,'tr','New Payroll','<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Konu:-İK departmanı/Şirket, maaş bordrosunun onaylanması sırasında e-posta ile maaş bordrolarını gönderecek</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Merhaba { name },</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Umarım bu e-posta sizi iyi bulur! Lütfen ekteki maaş bordrosuna bakınız { salary_month }.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">sadece aşağıdaki butona tıklayın</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">maaş bordrosu</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Herhangi bir sorunuz varsa ulaşmaktan çekinmeyin.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Teşekkür ederim.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Saygılarımızla,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">İK Departmanı,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{ app_name }</span></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(46,3,'zh','New Payroll','<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">主题：-人力资源部门/公司将在工资审批期间通过电子邮件发送工资单</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">你好 { name },</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">我希望你能收到这封电子邮件！请参阅随附的工资单 { salary_month }.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">只需点击下面的按钮</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">工资单</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">如果您有任何疑问，请随时与我们联系.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">谢谢.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">问候,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">人事部,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{ app_name }</span></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(47,3,'he','New Payroll','<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">נושא:- משאבי אנוש/חברה ישלחו באימייל תלוש שכר במהלך אישור השכר</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">שלום { name },</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">אני מקווה שתקבל את המייל הזה! נא ראה תלוש שכר מצורף { salary_month }.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">פשוט לחץ על הכפתור למטה</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">גִלְיוֹן שָׂכָר</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">אם יש לך שאלות, אנא אל תהסס לפנות אלינו.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">תודה.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">בְּרָכָה,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">מחלקת כוח אדם,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{ app_name }</span></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(48,3,'pt-br','New Payroll','<p>Assunto:-Departamento de RH / Empresa para enviar payslips por e-mail no momento da confirma&ccedil;&atilde;o do payslip</p>\n                    <p>Oi {name},</p>\n                    <p>Espero que este e-mail encontre voc&ecirc; bem! Por favor, consulte o payslip anexado por {salary_month}.</p>\n                    <p>basta clicar no bot&atilde;o abaixo</p>\n                    <p>Payslip</p>\n                    <p>Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</p>\n                    <p>Obrigado</p>\n                    <p>Considera,</p>\n                    <p>Departamento de RH,</p>\n                    <p>{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(49,4,'ar','New Ticket','<p>Subject : -HR ادارة / شركة لارسال ticket ل ـ { ticket_title }</p>\n                    <p>مرحبا { ticket_name }</p>\n                    <p>آمل أن يقوم هذا البريد الالكتروني بايجادك جيدا ! ، كود التذكرة الخاص بك هو { ticket_code }.</p>\n                    <p>{ ticket_description } ،</p>\n                    <p>إشعر بالحرية للوصول إلى الخارج إذا عندك أي أسئلة.</p>\n                    <p>شكرا لك</p>\n                    <p>Regards,</p>\n                    <p>إدارة الموارد البشرية ،</p>\n                    <p>{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(50,4,'da','New Ticket','<p>Emne:-HR-afdeling / Kompagni til at sende ticket for { ticket_title }</p>\n                    <p>Hej { ticket_name },</p>\n                    <p>H&aring;ber denne e-mail finder dig godt, din ticket-kode er { ticket_code }.</p>\n                    <p>{ ticket_description },</p>\n                    <p>Du er velkommen til at r&aelig;kke ud, hvis du har nogen sp&oslash;rgsm&aring;l.</p>\n                    <p>Tak.</p>\n                    <p>Med venlig hilsen</p>\n                    <p>HR-afdelingen,</p>\n                    <p>{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(51,4,'de','New Ticket','<p>Betreff: -Personalabteilung/Firma zum Senden von Ticket f&uuml;r {ticket_title}</p>\n                    <p>Hi {ticket_name},</p>\n                    <p>Hoffen Sie, diese E-Mail findet Sie gut!, Ihr Ticketcode ist {ticket_code}.</p>\n                    <p>{ticket_description},</p>\n                    <p>F&uuml;hlen Sie sich frei, wenn Sie Fragen haben.</p>\n                    <p>Danke.</p>\n                    <p>Betrachtet,</p>\n                    <p>Personalabteilung,</p>\n                    <p>{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(52,4,'en','New Ticket','<p ><b>Subject:-HR department/Company to send ticket for {ticket_title}</b></p>\n                    <p ><b>Hi {ticket_name},</b></p>\n                    <p >Hope this email ﬁnds you well! , Your ticket code is {ticket_code}. </p></br>\n                    {ticket_description},\n                    <p >Feel free to reach out if you have any questions.</p></br>\n                    <p><b>Thank you</b></p>\n                    <p><b>Regards,</b></p>\n                    <p><b>HR Department,</b></p>\n                    <p><b>{app_name}</b></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(53,4,'es','New Ticket','<p>Asunto: -Departamento de RR.HH./Empresa para enviar el ticket de {ticket_title}</p>\n                    <p>Hi {ticket_name},</p>\n                    <p>&iexcl;Espero que este correo electr&oacute;nico te encuentre bien!, Tu c&oacute;digo de entrada es {ticket_code}.</p>\n                    <p>{ticket_description},</p>\n                    <p>Si&eacute;ntase libre de llegar si usted tiene alguna pregunta.</p>\n                    <p>&iexcl;Gracias!</p>\n                    <p>Considerando,</p>\n                    <p>Departamento de Recursos Humanos,</p>\n                    <p>{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(54,4,'fr','New Ticket','<p>Objet: -HR department / Company to send ticket for { ticket_title }</p>\n                    <p>Hi { ticket_name },</p>\n                    <p>Hope this email vous trouve bien !, Votre code de ticket est { ticket_code }.</p>\n                    <p>{ ticket_description },</p>\n                    <p>Nh&eacute;sitez pas &agrave; nous contacter si vous avez des questions.</p>\n                    <p>Je vous remercie</p>\n                    <p>Regards,</p>\n                    <p>D&eacute;partement des RH,</p>\n                    <p>{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(55,4,'it','New Ticket','<p>Oggetto: - Dipartimento HR / Societ&agrave; per inviare ticket per {ticket_title}</p>\n                    <p>Ciao {ticket_name},</p>\n                    <p>Spero che questa email ti trovi bene!, Il tuo codice del biglietto &egrave; {ticket_code}.</p>\n                    <p>{ticket_description},</p>\n                    <p>Sentiti libero di raggiungere se hai domande.</p>\n                    <p>Grazie</p>\n                    <p>Riguardo,</p>\n                    <p>Dipartimento HR,</p>\n                    <p>{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(56,4,'ja','New Ticket','<p>件名:-HR 部門/企業は、 {ticket_title} のチケットを送信します</p>\n                    <p>こんにちは {ticket_name}</p>\n                    <p>この E メールが適切に検出されることを希望しています。チケット・コードは {ticket_code}です。</p>\n                    <p>{ticket_description }</p>\n                    <p>質問がある場合は、自由に連絡してください。</p>\n                    <p>ありがとう</p>\n                    <p>よろしく</p>\n                    <p>HR 部門</p>\n                    <p>{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(57,4,'nl','New Ticket','<p>Betreft: -HR-afdeling/Bedrijf voor het verzenden van ticket voor { ticket_title }</p>\n                    <p>Hallo { ticket_name },</p>\n                    <p>Hoop dat deze e-mail u goed vindt!, Uw ticket code is { ticket_code }.</p>\n                    <p>{ ticket_description},</p>\n                    <p>Voel je vrij om uit te reiken als je vragen hebt.</p>\n                    <p>Dank u wel</p>\n                    <p>Betreft:</p>\n                    <p>HR-afdeling,</p>\n                    <p>{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(58,4,'pl','New Ticket','<p>Temat:-Dział HR/Firma do wysyłki biletu dla {ticket_title }</p>\n                    <p>Witaj {ticket_name },</p>\n                    <p>Mam nadzieję, że ta wiadomość e-mail znajduje się dobrze!, Tw&oacute;j kod zgłoszenia to {ticket_code }.</p>\n                    <p>{ticket_description },</p>\n                    <p>Czuj się swobodnie, jeśli masz jakieś pytania.</p>\n                    <p>Dziękujemy</p>\n                    <p>W odniesieniu do</p>\n                    <p>Dział HR,</p>\n                    <p>{app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(59,4,'ru','New Ticket','<p>Тема: -HR отдел/Компания для отправки билета для { ticket_title }</p>\n                    <p>Hi { ticket_name },</p>\n                    <p>Надеюсь, что это письмо найдет вас хорошо!, Ваш код паспорта-{ ticket_code }.</p>\n                    <p>{ ticket_description },</p>\n                    <p>Не стеснитесь, если у вас есть вопросы.</p>\n                    <p>Спасибо.</p>\n                    <p>С уважением,</p>\n                    <p>Отдел кадров,</p>\n                    <p>{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(60,4,'pt','New Ticket','<p>Assunto:-Departamento de RH / Empresa para enviar ingresso para {ticket_title}</p>\n                    <p>Oi {ticket_name},</p>\n                    <p>Espero que este e-mail te encontre bem!, Seu c&oacute;digo de bilhete &eacute; {ticket_code}.</p>\n                    <p>{ticket_description},</p>\n                    <p>Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</p>\n                    <p>Obrigado</p>\n                    <p>Considera,</p>\n                    <p>Departamento de RH,</p>\n                    <p>{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(61,4,'tr','New Ticket','<p ><b>Konu:-Bilet gönderilecek İK departmanı/Şirket {ticket_title}</b></p>\n                    <p ><b>MERHABA {ticket_name},</b></p>\n                    <p >Umarım bu e-posta sizi iyi bulur! , Bilet kodunuz {ticket_code}. </p></br>\n                    {ticket_description},\n                    <p >Herhangi bir sorunuz varsa çekinmeden bize ulaşın.</p></br>\n                    <p><b>Teşekkür ederim</b></p>\n                    <p><b>Saygılarımızla,</b></p>\n                    <p><b>İK Departmanı,</b></p>\n                    <p><b>{app_name}</b></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(62,4,'zh','New Ticket','<p ><b>主题：-向其发送票据的人力资源部门/公司 {ticket_title}</b></p>\n                    <p ><b>你好 {ticket_name},</b></p>\n                    <p >希望这封电子邮件能让您满意！ , 您的机票代码是 {ticket_code}. </p></br>\n                    {ticket_description},\n                    <p >如果您有任何疑问，请随时与我们联系.</p></br>\n                    <p><b>谢谢</b></p>\n                    <p><b>问候,</b></p>\n                    <p><b>人事部,</b></p>\n                    <p><b>{app_name}</b></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(63,4,'he','New Ticket','<p ><b>נושא:-מחלקת משאבי אנוש/חברה לשליחת כרטיס עבורה {ticket_title}</b></p>\n                    <p ><b>היי {ticket_name},</b></p>\n                    <p >מקווה שהמייל הזה ימצא אותך טוב! , קוד הכרטיס שלך הוא {ticket_code}. </p></br>\n                    {ticket_description},\n                    <p >אל תהסס לפנות אם יש לך שאלות.</p></br>\n                    <p><b>תודה</b></p>\n                    <p><b>בברכה,</b></p>\n                    <p><b>מחלקת משאבי אנוש,</b></p>\n                    <p><b>{app_name}</b></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(64,4,'pt-br','New Ticket','<p>Assunto:-Departamento de RH / Empresa para enviar ingresso para {ticket_title}</p>\n                    <p>Oi {ticket_name},</p>\n                    <p>Espero que este e-mail te encontre bem!, Seu c&oacute;digo de bilhete &eacute; {ticket_code}.</p>\n                    <p>{ticket_description},</p>\n                    <p>Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</p>\n                    <p>Obrigado</p>\n                    <p>Considera,</p>\n                    <p>Departamento de RH,</p>\n                    <p>{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(65,5,'ar','New Award','<p>Subject :-إدارة الموارد البشرية / الشركة المعنية بإرسال خطاب تحكيم للاعتراف بموظف</p>\n                    <p>مرحبا { award_name },</p>\n                    <p>ويسرني كثيرا أن أرشحها { award_name }</p>\n                    <p>وإنني مقتنع بأن (هي / هي) هي أفضل موظفة للحصول على الجائزة. وقد أدركت أنها شخصية موجهة نحو تحقيق الأهداف ، وتتسم بالكفاءة والفعالية في التقيد بالمواعيد. إنها دائما على استعداد لمشاركة معرفتها بالتفاصيل</p>\n                    <p>وبالإضافة إلى ذلك ، قامت (هي / هي) أحيانا بحل النزاعات والحالات الصعبة خلال ساعات العمل. (هي / هي) حصلت على بعض الجوائز من المنظمة غير الحكومية داخل البلد ؛ وكان ذلك بسبب المشاركة في أنشطة خيرية لمساعدة المحتاجين.</p>\n                    <p>وأعتقد أن هذه الصفات والصفات يجب أن تكون موضع تقدير. ولذلك ، فإن (هي / هي) تستحق أن تمنحها الجائزة بالتالي.</p>\n                    <p>إشعر بالحرية للوصول إلى الخارج إذا عندك أي أسئلة.</p>\n                    <p>شكرا لك</p>\n                    <p>Regards,</p>\n                    <p>إدارة الموارد البشرية ،</p>\n                    <p>{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(66,5,'da','New Award','<p>Om: HR-afdelingen / Kompagniet for at sende prisuddeling for at kunne genkende en medarbejder</p>\n                    <p>Hej { award_name },</p>\n                    <p>Jeg er meget glad for at nominere {award_name&nbsp;}</p>\n                    <p>Jeg er tilfreds med, at (hun) er den bedste medarbejder for prisen. Jeg har indset, at hun er en m&aring;lbevidst person, effektiv og meget punktlig. Hun er altid klar til at dele sin viden om detaljer.</p>\n                    <p>Desuden har (he/she) lejlighedsvist l&oslash;st konflikter og vanskelige situationer inden for arbejdstiden. (/hun) har modtaget nogle priser fra den ikkestatslige organisation i landet. Dette skyldes, at der skal v&aelig;re en del i velg&oslash;renhedsaktiviteter for at hj&aelig;lpe de tr&aelig;ngende.</p>\n                    <p>Jeg mener, at disse kvaliteter og egenskaber skal v&aelig;rds&aelig;tte. Derfor fortjener denne pris, at hun nominerer hende.</p>\n                    <p>Du er velkommen til at r&aelig;kke ud, hvis du har nogen sp&oslash;rgsm&aring;l.</p>\n                    <p>Tak.</p>\n                    <p>Med venlig hilsen</p>\n                    <p>HR-afdelingen,</p>\n                    <p>{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(67,5,'de','New Award','<p>Betrifft: -Personalabteilung/Firma zum Versenden von Pr&auml;mienschreiben, um einen Mitarbeiter zu erkennen</p>\n                    <p>Hi {award_name},</p>\n                    <p>Ich freue mich sehr, {award_name} zu nominieren.</p>\n                    <p>Ich bin zufrieden, dass (he/she) der beste Mitarbeiter f&uuml;r die Auszeichnung ist. Ich habe erkannt, dass sie eine gottorientierte Person ist, effizient und sehr p&uuml;nktlich. Sie ist immer bereit, ihr Wissen &uuml;ber Details zu teilen.</p>\n                    <p>Dar&uuml;ber hinaus hat (he/she) gelegentlich Konflikte und schwierige Situationen innerhalb der Arbeitszeiten gel&ouml;st. (he/she) hat einige Auszeichnungen von der Nichtregierungsorganisation innerhalb des Landes erhalten; dies war wegen der Teilnahme an Wohlt&auml;tigkeitsaktivit&auml;ten, um den Bed&uuml;rftigen zu helfen.</p>\n                    <p>Ich glaube, diese Eigenschaften und Eigenschaften m&uuml;ssen gew&uuml;rdigt werden. Daher verdient (he/she) die Auszeichnung, die sie deshalb nominiert.</p>\n                    <p>F&uuml;hlen Sie sich frei, wenn Sie Fragen haben.</p>\n                    <p>Danke.</p>\n                    <p>Betrachtet,</p>\n                    <p>Personalabteilung,</p>\n                    <p>{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(68,5,'en','New Award','<p ><b>Subject:-HR department/Company to send award letter to recognize an employee</b></p>\n                    <p ><b>Hi {award_name},</b></p>\n                    <p >I am much pleased to nominate {award_name}  </p>\n                    <p >I am satisfied that (he/she) is the best employee for the award. I have realized that she is a goal-oriented person, efficient and very punctual. She is always ready to share her knowledge of details.</p>\n                    <p>Additionally, (he/she) has occasionally solved conflicts and difficult situations within working hours. (he/she) has received some awards from the non-governmental organization within the country; this was because of taking part in charity activities to help the needy.</p>\n                    <p>I believe these qualities and characteristics need to be appreciated. Therefore, (he/she) deserves the award hence nominating her.</p>\n                    <p>Feel free to reach out if you have any questions.</p>\n                    <p><b>Thank you</b></p>\n                    <p><b>Regards,</b></p>\n                    <p><b>HR Department,</b></p>\n                    <p><b>{app_name}</b></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(69,5,'es','New Award','<p>Asunto: -Departamento de RRHH/Empresa para enviar carta de premios para reconocer a un empleado</p>\n                    <p>Hi {award_name},</p>\n                    <p>Estoy muy satisfecho de nominar {award_name}</p>\n                    <p>Estoy satisfecho de que (ella) sea el mejor empleado para el premio. Me he dado cuenta de que es una persona orientada al objetivo, eficiente y muy puntual. Ella siempre est&aacute; lista para compartir su conocimiento de los detalles.</p>\n                    <p>Adicionalmente, (he/ella) ocasionalmente ha resuelto conflictos y situaciones dif&iacute;ciles dentro de las horas de trabajo. (h/ella) ha recibido algunos premios de la organizaci&oacute;n no gubernamental dentro del pa&iacute;s; esto fue debido a participar en actividades de caridad para ayudar a los necesitados.</p>\n                    <p>Creo que estas cualidades y caracter&iacute;sticas deben ser apreciadas. Por lo tanto, (h/ella) merece el premio por lo tanto nominarla.</p>\n                    <p>Si&eacute;ntase libre de llegar si usted tiene alguna pregunta.</p>\n                    <p>&iexcl;Gracias!</p>\n                    <p>Considerando,</p>\n                    <p>Departamento de Recursos Humanos,</p>\n                    <p>{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(70,5,'fr','New Award','<p>Objet: -Minist&egrave;re des RH / Soci&eacute;t&eacute; denvoi dune lettre dattribution pour reconna&icirc;tre un employ&eacute;</p>\n                    <p>Hi { award_name },</p>\n                    <p>Je suis tr&egrave;s heureux de nommer { award_name }</p>\n                    <p>Je suis convaincu que (he/elle) est le meilleur employ&eacute; pour ce prix. Jai r&eacute;alis&eacute; quelle est une personne orient&eacute;e vers lobjectif, efficace et tr&egrave;s ponctuelle. Elle est toujours pr&ecirc;te &agrave; partager sa connaissance des d&eacute;tails.</p>\n                    <p>De plus, (he/elle) a parfois r&eacute;solu des conflits et des situations difficiles dans les heures de travail. (he/elle) a re&ccedil;u des prix de lorganisation non gouvernementale &agrave; lint&eacute;rieur du pays, parce quelle a particip&eacute; &agrave; des activit&eacute;s de bienfaisance pour aider les n&eacute;cessiteux.</p>\n                    <p>Je crois que ces qualit&eacute;s et ces caract&eacute;ristiques doivent &ecirc;tre appr&eacute;ci&eacute;es. Par cons&eacute;quent, (he/elle) m&eacute;rite le prix donc nomin&eacute;.</p>\n                    <p>Nh&eacute;sitez pas &agrave; nous contacter si vous avez des questions.</p>\n                    <p>Je vous remercie</p>\n                    <p>Regards,</p>\n                    <p>D&eacute;partement des RH,</p>\n                    <p>{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(71,5,'it','New Award','<p>Oggetto: - Dipartimento HR / Societ&agrave; per inviare lettera di premiazione per riconoscere un dipendente</p>\n                    <p>Ciao {award_name},</p>\n                    <p>Sono molto lieto di nominare {award_name}</p>\n                    <p>Sono soddisfatto che (he/lei) sia il miglior dipendente per il premio. Ho capito che &egrave; una persona orientata al goal-oriented, efficiente e molto puntuale. &Egrave; sempre pronta a condividere la sua conoscenza dei dettagli.</p>\n                    <p>Inoltre, (he/lei) ha occasionalmente risolto conflitti e situazioni difficili allinterno delle ore di lavoro. (he/lei) ha ricevuto alcuni premi dallorganizzazione non governativa allinterno del paese; questo perch&eacute; di prendere parte alle attivit&agrave; di beneficenza per aiutare i bisognosi.</p>\n                    <p>Credo che queste qualit&agrave; e caratteristiche debbano essere apprezzate. Pertanto, (he/lei) merita il premio da qui la nomina.</p>\n                    <p>Sentiti libero di raggiungere se hai domande.</p>\n                    <p>Grazie</p>\n                    <p>Riguardo,</p>\n                    <p>Dipartimento HR,</p>\n                    <p>{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(72,5,'ja','New Award','<p>件名: 従業員を認識するための表彰書を送信するための、人事部門/ 会社</p>\n                    <p>やあ {award_name }</p>\n                    <p>{award_name }をノミネートしたいと考えています。</p>\n                    <p>私は ( 彼女が ) 賞のための最高の従業員だと満足している。 私は彼女が、自分が目標指向の人間であり、効率的で、非常に時間厳守であることに気付きました。 彼女はいつも詳細についての知識を共有する準備ができている。</p>\n                    <p>また、時には労働時間内に紛争や困難な状況を解決することがある。 ( 彼女は ) 国内の非政府組織からいくつかの賞を受賞している。このことは、慈善活動に参加して、貧窮者を助けるためのものだった。</p>\n                    <p>これらの特性と特徴を評価する必要があると思います。 そのため、 ( 相続人は ) 賞に値するので彼女を指名することになる。</p>\n                    <p>質問がある場合は、自由に連絡してください。</p>\n                    <p>ありがとう</p>\n                    <p>よろしく</p>\n                    <p>HR 部門</p>\n                    <p>{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(73,5,'nl','New Award','<p>Betreft: -HR-afdeling/Bedrijf om een gunningsbrief te sturen om een werknemer te herkennen</p>\n                    <p>Hallo { award_name },</p>\n                    <p>Ik ben erg blij om { award_name } te nomineren</p>\n                    <p>Ik ben tevreden dat (he/zij) de beste werknemer voor de prijs is. Ik heb me gerealiseerd dat ze een doelgericht persoon is, effici&euml;nt en punctueel. Ze is altijd klaar om haar kennis van details te delen.</p>\n                    <p>Daarnaast heeft (he/she) af en toe conflicten en moeilijke situaties binnen de werkuren opgelost. (he/zij) heeft een aantal prijzen ontvangen van de niet-gouvernementele organisatie binnen het land; dit was vanwege het deelnemen aan liefdadigheidsactiviteiten om de behoeftigen te helpen.</p>\n                    <p>Ik ben van mening dat deze kwaliteiten en eigenschappen moeten worden gewaardeerd. Daarom, (he/she) verdient de award dus nomineren haar.</p>\n                    <p>Voel je vrij om uit te reiken als je vragen hebt.</p>\n                    <p>Dank u wel</p>\n                    <p>Betreft:</p>\n                    <p>HR-afdeling,</p>\n                    <p>{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(74,5,'pl','New Award','<p>Temat:-Dział HR/Firma do wysyłania list&oacute;w wyr&oacute;żnienia do rozpoznania pracownika</p>\n                    <p>Witaj {award_name },</p>\n                    <p>Jestem bardzo zadowolony z nominacji {award_name }</p>\n                    <p>Jestem zadowolony, że (he/she) jest najlepszym pracownikiem do nagrody. Zdałem sobie sprawę, że jest osobą zorientowaną na goły, sprawną i bardzo punktualną. Zawsze jest gotowa podzielić się swoją wiedzą na temat szczeg&oacute;ł&oacute;w.</p>\n                    <p>Dodatkowo, (he/she) od czasu do czasu rozwiązuje konflikty i trudne sytuacje w godzinach pracy. (he/she) otrzymała kilka nagr&oacute;d od organizacji pozarządowej w obrębie kraju; to z powodu wzięcia udziału w akcji charytatywnych, aby pom&oacute;c potrzebującym.</p>\n                    <p>Uważam, że te cechy i cechy muszą być docenione. Dlatego też, (he/she) zasługuje na nagrodę, stąd nominowanie jej.</p>\n                    <p>Czuj się swobodnie, jeśli masz jakieś pytania.</p>\n                    <p>Dziękujemy</p>\n                    <p>W odniesieniu do</p>\n                    <p>Dział HR,</p>\n                    <p>{app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(75,5,'ru','New Award','<p>Тема: -HR отдел/Компания отправить награда письмо о признании сотрудника</p>\n                    <p>Здравствуйте, { award_name },</p>\n                    <p>Мне очень приятно номинировать { award_name }</p>\n                    <p>Я удовлетворена тем, что (х/она) является лучшим работником премии. Я понял, что она ориентированная на цель человек, эффективная и очень пунктуальная. Она всегда готова поделиться своими знаниями о деталях.</p>\n                    <p>Кроме того, время от времени решались конфликты и сложные ситуации в рабочее время. (она) получила некоторые награды от неправительственной организации в стране; это было связано с тем, что они приняли участие в благотворительной деятельности, чтобы помочь нуждающимся.</p>\n                    <p>Я считаю, что эти качества и характеристики заслуживают высокой оценки. Таким образом, она заслуживает того, чтобы наградить ее таким образом.</p>\n                    <p>Не стеснитесь, если у вас есть вопросы.</p>\n                    <p>Спасибо.</p>\n                    <p>С уважением,</p>\n                    <p>Отдел кадров,</p>\n                    <p>{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(76,5,'pt','New Award','<p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Assunto:-Departamento de RH / Empresa para enviar carta de premia&ccedil;&atilde;o para reconhecer um funcion&aacute;rio</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Oi {award_name},</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Estou muito satisfeito em nomear {award_name}</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Estou satisfeito que (he/she) &eacute; o melhor funcion&aacute;rio para o pr&ecirc;mio. Eu percebi que ela &eacute; uma pessoa orientada a goal, eficiente e muito pontual. Ela est&aacute; sempre pronta para compartilhar seu conhecimento de detalhes.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Adicionalmente, (he/she) tem, ocasionalmente, resolvido conflitos e situa&ccedil;&otilde;es dif&iacute;ceis dentro do hor&aacute;rio de trabalho. (he/she) recebeu alguns pr&ecirc;mios da organiza&ccedil;&atilde;o n&atilde;o governamental dentro do pa&iacute;s; isso foi por ter participado de atividades de caridade para ajudar os necessitados.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Eu acredito que essas qualidades e caracter&iacute;sticas precisam ser apreciadas. Por isso, (he/she) merece o pr&ecirc;mio da&iacute; nomeando-a.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Obrigado</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Considera,</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Departamento de RH,</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">{app_name}</span></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(77,5,'tr','New Award','<p ><b>Konu:-İK departmanı/Şirket, bir çalışanı takdir etmek için ödül mektubu gönderecek</b></p>\n                    <p ><b>MERHABA {award_name},</b></p>\n                    <p >aday göstermekten çok memnunum {award_name}  </p>\n                    <p >(Onun) ödül için en iyi çalışan olduğuna memnunum. Hedef odaklı, verimli ve çok dakik biri olduğunu fark ettim. Ayrıntılarla ilgili bilgisini paylaşmaya her zaman hazırdır.</p>\n                    <p>Ayrıca, (o) zaman zaman çalışma saatleri içinde çatışmaları ve zor durumları çözmüştür. (kendisi) yurt içinde sivil toplum kuruluşlarından bazı ödüller almıştır; bunun nedeni, muhtaçlara yardım etmek için hayır faaliyetlerinde yer almaktı.</p>\n                    <p>Bu niteliklerin ve özelliklerin takdir edilmesi gerektiğine inanıyorum. Bu nedenle (o) ödülü hak ediyor ve onu aday gösteriyor.</p>\n                    <p>Herhangi bir sorunuz varsa çekinmeden bize ulaşın.</p>\n                    <p><b>Teşekkür ederim</b></p>\n                    <p><b>Saygılarımızla,</b></p>\n                    <p><b>İK Departmanı,</b></p>\n                    <p><b>{app_name}</b></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(78,5,'zh','New Award','<p ><b>主题：-人力资源部门/公司发送奖励信以表彰员工</b></p>\n                    <p ><b>你好 {award_name},</b></p>\n                    <p >我很高兴能提名 {award_name}  </p>\n                    <p >我很满意（他/她）是获得该奖项的最佳员工。我发现她是一个目标明确的人，办事效率高，而且非常准时。她随时准备分享她的细节知识.</p>\n                    <p>另外，偶尔也会在工作时间内解决一些矛盾和困难。 （他/她）获得过国内非政府组织颁发的一些奖项；这是因为参加了帮助有需要的人的慈善活动.</p>\n                    <p>我相信这些品质和特征需要得到重视。因此，（他/她）值得获奖，因此提名她.</p>\n                    <p>如果您有任何疑问，请随时与我们联系.</p>\n                    <p><b>谢谢</b></p>\n                    <p><b>问候,</b></p>\n                    <p><b>人事部,</b></p>\n                    <p><b>{app_name}</b></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(79,5,'he','New Award','<p ><b>נושא:-מחלקת משאבי אנוש/חברה לשלוח מכתב פרס כדי להכיר בעובד</b></p>\n                    <p ><b>היי {award_name},</b></p>\n                    <p >אני מאוד שמח למנות {award_name}  </p>\n                    <p >אני מרוצה ש(הוא/היא) הוא העובד הטוב ביותר עבור הפרס. הבנתי שהיא אדם ממוקד מטרה, יעילה ומאוד דייקנית. היא תמיד מוכנה לחלוק את הידע שלה בפרטים.</p>\n                    <p>בנוסף, (הוא/היא) פתר מדי פעם קונפליקטים ומצבים קשים בתוך שעות העבודה. (הוא/היא) קיבל כמה פרסים מהארגון הלא ממשלתי במדינה; זה היה בגלל השתתפות בפעילויות צדקה כדי לעזור לנזקקים.</p>\n                    <p>אני מאמין שצריך להעריך את התכונות והמאפיינים האלה. לכן, (הוא/היא) ראוי לפרס ומכאן שמינו אותה.</p>\n                    <p>אל תהסס לפנות אם יש לך שאלות.</p>\n                    <p><b>תודה</b></p>\n                    <p><b>בברכה,</b></p>\n                    <p><b>מחלקת משאבי אנוש,</b></p>\n                    <p><b>{app_name}</b></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(80,5,'pt-br','New Award','<p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Assunto:-Departamento de RH / Empresa para enviar carta de premia&ccedil;&atilde;o para reconhecer um funcion&aacute;rio</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Oi {award_name},</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Estou muito satisfeito em nomear {award_name}</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Estou satisfeito que (he/she) &eacute; o melhor funcion&aacute;rio para o pr&ecirc;mio. Eu percebi que ela &eacute; uma pessoa orientada a goal, eficiente e muito pontual. Ela est&aacute; sempre pronta para compartilhar seu conhecimento de detalhes.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Adicionalmente, (he/she) tem, ocasionalmente, resolvido conflitos e situa&ccedil;&otilde;es dif&iacute;ceis dentro do hor&aacute;rio de trabalho. (he/she) recebeu alguns pr&ecirc;mios da organiza&ccedil;&atilde;o n&atilde;o governamental dentro do pa&iacute;s; isso foi por ter participado de atividades de caridade para ajudar os necessitados.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Eu acredito que essas qualidades e caracter&iacute;sticas precisam ser apreciadas. Por isso, (he/she) merece o pr&ecirc;mio da&iacute; nomeando-a.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Obrigado</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Considera,</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Departamento de RH,</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">{app_name}</span></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(81,6,'ar','Employee Transfer','<p>Subject : -HR ادارة / شركة لارسال خطاب نقل الى موظف من مكان الى آخر.</p>\n                    <p>عزيزي { transfer_name },</p>\n                    <p>وفقا لتوجيهات الادارة ، يتم نقل الخدمات الخاصة بك w.e.f. { transfer_date }.</p>\n                    <p>مكان الادخال الجديد الخاص بك هو { transfer_department } قسم من فرع { transfer_branch } وتاريخ التحويل { transfer_date }.</p>\n                    <p>{ transfer_description }.</p>\n                    <p>إشعر بالحرية للوصول إلى الخارج إذا عندك أي أسئلة.</p>\n                    <p>شكرا لك</p>\n                    <p>Regards,</p>\n                    <p>إدارة الموارد البشرية ،</p>\n                    <p>{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(82,6,'da','Employee Transfer','<p>Emne:-HR-afdelingen / kompagniet om at sende overf&oslash;rsels brev til en medarbejder fra den ene lokalitet til den anden.</p>\n                    <p>K&aelig;re { transfer_name },</p>\n                    <p>Som Styring af direktiver overf&oslash;res dine serviceydelser w.e.f. { transfer_date }.</p>\n                    <p>Dit nye sted for postering er { transfer_departement } afdeling af { transfer_branch } gren og dato for overf&oslash;rsel { transfer_date }.</p>\n                    <p>{ transfer_description }.</p>\n                    <p>Du er velkommen til at r&aelig;kke ud, hvis du har nogen sp&oslash;rgsm&aring;l.</p>\n                    <p>Tak.</p>\n                    <p>Med venlig hilsen</p>\n                    <p>HR-afdelingen,</p>\n                    <p>{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(83,6,'de','Employee Transfer','<p>Betreff: -Personalabteilung/Unternehmen, um einen &Uuml;berweisungsschreiben an einen Mitarbeiter von einem Standort an einen anderen zu senden.</p>\n                    <p>Sehr geehrter {transfer_name},</p>\n                    <p>Wie pro Management-Direktiven werden Ihre Dienste &uuml;ber w.e.f. {transfer_date} &uuml;bertragen.</p>\n                    <p>Ihr neuer Ort der Entsendung ist {transfer_department} Abteilung von {transfer_branch} Niederlassung und Datum der &Uuml;bertragung {transfer_date}.</p>\n                    <p>{transfer_description}.</p>\n                    <p>F&uuml;hlen Sie sich frei, wenn Sie Fragen haben.</p>\n                    <p>Danke.</p>\n                    <p>Betrachtet,</p>\n                    <p>Personalabteilung,</p>\n                    <p>{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(84,6,'en','Employee Transfer','<p ><b>Subject:-HR department/Company to send transfer letter to be issued to an employee from one location to another.</b></p>\n                    <p ><b>Dear {transfer_name},</b></p>\n                    <p >As per Management directives, your services are being transferred w.e.f.{transfer_date}. </p>\n                    <p >Your new place of posting is {transfer_department} department of {transfer_branch} branch and date of transfer {transfer_date}. </p>\n                    {transfer_description}.\n                    <p>Feel free to reach out if you have any questions.</p>\n                    <p><b>Thank you</b></p>\n                    <p><b>Regards,</b></p>\n                    <p><b>HR Department,</b></p>\n                    <p><b>{app_name}</b></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(85,6,'es','Employee Transfer','<p>Asunto: -Departamento de RR.HH./Empresa para enviar carta de transferencia a un empleado de un lugar a otro.</p>\n                    <p>Estimado {transfer_name},</p>\n                    <p>Seg&uacute;n las directivas de gesti&oacute;n, los servicios se transfieren w.e.f. {transfer_date}.</p>\n                    <p>El nuevo lugar de publicaci&oacute;n es el departamento {transfer_department} de la rama {transfer_branch} y la fecha de transferencia {transfer_date}.</p>\n                    <p>{transfer_description}.</p>\n                    <p>Si&eacute;ntase libre de llegar si usted tiene alguna pregunta.</p>\n                    <p>&iexcl;Gracias!</p>\n                    <p>Considerando,</p>\n                    <p>Departamento de Recursos Humanos,</p>\n                    <p>{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(86,6,'fr','Employee Transfer','<p>Objet: -Minist&egrave;re des RH / Soci&eacute;t&eacute; denvoi dune lettre de transfert &agrave; un employ&eacute; dun endroit &agrave; un autre.</p>\n                    <p>Cher { transfer_name },</p>\n                    <p>Selon les directives de gestion, vos services sont transf&eacute;r&eacute;s dans w.e.f. { transfer_date }.</p>\n                    <p>Votre nouveau lieu daffectation est le d&eacute;partement { transfer_department } de la branche { transfer_branch } et la date de transfert { transfer_date }.</p>\n                    <p>{ description_transfert }.</p>\n                    <p>Nh&eacute;sitez pas &agrave; nous contacter si vous avez des questions.</p>\n                    <p>Je vous remercie</p>\n                    <p>Regards,</p>\n                    <p>D&eacute;partement des RH,</p>\n                    <p>{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(87,6,'it','Employee Transfer','<p>Oggetto: - Dipartimento HR / Societ&agrave; per inviare lettera di trasferimento da rilasciare a un dipendente da una localit&agrave; allaltra.</p>\n                    <p>Caro {transfer_name},</p>\n                    <p>Come per le direttive di Management, i tuoi servizi vengono trasferiti w.e.f. {transfer_date}.</p>\n                    <p>Il tuo nuovo luogo di distacco &egrave; {transfer_department} dipartimento di {transfer_branch} ramo e data di trasferimento {transfer_date}.</p>\n                    <p>{transfer_description}.</p>\n                    <p>Sentiti libero di raggiungere se hai domande.</p>\n                    <p>Grazie</p>\n                    <p>Riguardo,</p>\n                    <p>Dipartimento HR,</p>\n                    <p>{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(88,6,'ja','Employee Transfer','<p>Oggetto: - Dipartimento HR / Societ&agrave; per inviare lettera di trasferimento da rilasciare a un dipendente da una localit&agrave; allaltra.</p>\n                    <p>Caro {transfer_name},</p>\n                    <p>Come per le direttive di Management, i tuoi servizi vengono trasferiti w.e.f. {transfer_date}.</p>\n                    <p>Il tuo nuovo luogo di distacco &egrave; {transfer_department} dipartimento di {transfer_branch} ramo e data di trasferimento {transfer_date}.</p>\n                    <p>{transfer_description}.</p>\n                    <p>Sentiti libero di raggiungere se hai domande.</p>\n                    <p>Grazie</p>\n                    <p>Riguardo,</p>\n                    <p>Dipartimento HR,</p>\n                    <p>{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(89,6,'nl','Employee Transfer','<p>Betreft: -HR-afdeling/Bedrijf voor verzending van overdrachtsbrief aan een werknemer van de ene plaats naar de andere.</p>\n                    <p>Geachte { transfer_name },</p>\n                    <p>Als per beheerinstructie worden uw services overgebracht w.e.f. { transfer_date }.</p>\n                    <p>Uw nieuwe plaats van post is { transfer_department } van de afdeling { transfer_branch } en datum van overdracht { transfer_date }.</p>\n                    <p>{ transfer_description }.</p>\n                    <p>Voel je vrij om uit te reiken als je vragen hebt.</p>\n                    <p>Dank u wel</p>\n                    <p>Betreft:</p>\n                    <p>HR-afdeling,</p>\n                    <p>{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(90,6,'pl','Employee Transfer','<p>Temat:-Dział HR/Firma do wysyłania listu przelewowego, kt&oacute;ry ma być wydany pracownikowi z jednego miejsca do drugiego.</p>\n                    <p>Droga {transfer_name },</p>\n                    <p>Zgodnie z dyrektywami zarządzania, Twoje usługi są przesyłane w.e.f. {transfer_date }.</p>\n                    <p>Twoje nowe miejsce delegowania to {transfer_department } dział {transfer_branch } gałąź i data transferu {transfer_date }.</p>\n                    <p>{transfer_description }.</p>\n                    <p>Czuj się swobodnie, jeśli masz jakieś pytania.</p>\n                    <p>Dziękujemy</p>\n                    <p>W odniesieniu do</p>\n                    <p>Dział HR,</p>\n                    <p>{app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(91,6,'ru','Employee Transfer','<p>Тема: -HR отдел/Компания для отправки трансферного письма сотруднику из одного места в другое.</p>\n                    <p>Уважаемый { transfer_name },</p>\n                    <p>В соответствии с директивами управления ваши службы передаются .ef. { transfer_date }.</p>\n                    <p>Новое место разноски: { transfer_department} подразделение { transfer_branch } и дата передачи { transfer_date }.</p>\n                    <p>{ transfer_description }.</p>\n                    <p>Не стеснитесь, если у вас есть вопросы.</p>\n                    <p>Спасибо.</p>\n                    <p>С уважением,</p>\n                    <p>Отдел кадров,</p>\n                    <p>{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(92,6,'pt','Employee Transfer','<p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Assunto:-Departamento de RH / Empresa para enviar carta de transfer&ecirc;ncia para ser emitida para um funcion&aacute;rio de um local para outro.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Querido {transfer_name},</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Conforme diretivas de Gerenciamento, seus servi&ccedil;os est&atilde;o sendo transferidos w.e.f. {transfer_date}.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">O seu novo local de postagem &eacute; {transfer_departamento} departamento de {transfer_branch} ramo e data de transfer&ecirc;ncia {transfer_date}.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">{transfer_description}.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Obrigado</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Considera,</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Departamento de RH,</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">{app_name}</span></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(93,6,'tr','Employee Transfer','<p ><b>Konu:-İK departmanı/Şirket, bir çalışana bir konumdan diğerine verilecek transfer mektubunu göndermek için.</b></p>\n                    <p ><b>Sayın {transfer_name},</b></p>\n                    <p >Yönetim direktifleri uyarınca, hizmetleriniz w.e.f.{transfer_date}. </p>\n                    <p >Yeni gönderi yeriniz {transfer_department} Bölümü {transfer_branch} şube ve devir tarihi {transfer_date}. </p>\n                    {transfer_description}.\n                    <p>Herhangi bir sorunuz varsa çekinmeden bize ulaşın.</p>\n                    <p><b>Teşekkür ederim</b></p>\n                    <p><b>Saygılarımızla,</b></p>\n                    <p><b>İK Departmanı,</b></p>\n                    <p><b>{app_name}</b></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(94,6,'zh','Employee Transfer','<p ><b>主题：-人力资源部门/公司将发给员工的调动信从一个地点发送到另一个地点.</b></p>\n                    <p ><b>亲爱的 {transfer_name},</b></p>\n                    <p >根据管理层指令，您的服务将在即日起转移。{transfer_date}. </p>\n                    <p >您的新发帖地点是 {transfer_department} 部门 {transfer_branch} 分支机构和转移日期 {transfer_date}. </p>\n                    {transfer_description}.\n                    <p>如果您有任何疑问，请随时与我们联系.</p>\n                    <p><b>谢谢</b></p>\n                    <p><b>问候,</b></p>\n                    <p><b>人事部,</b></p>\n                    <p><b>{app_name}</b></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(95,6,'he','Employee Transfer','<p ><b>נושא:-מחלקת משאבי אנוש/חברה לשלוח מכתב העברה שיונפק לעובד ממקום אחד למשנהו.</b></p>\n                    <p ><b>יָקָר {transfer_name},</b></p>\n                    <p >בהתאם להנחיות ההנהלה, השירותים שלך מועברים w.e.f.{transfer_date}. </p>\n                    <p >מקום הפרסום החדש שלך הוא {transfer_department} מחלקת ה {transfer_branch} סניף ותאריך העברה {transfer_date}. </p>\n                    {transfer_description}.\n                    <p>אל תהסס לפנות אם יש לך שאלות.</p>\n                    <p><b>תודה</b></p>\n                    <p><b>בברכה,</b></p>\n                    <p><b>מחלקת משאבי אנוש,</b></p>\n                    <p><b>{app_name}</b></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(96,6,'pt-br','Employee Transfer','<p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Assunto:-Departamento de RH / Empresa para enviar carta de transfer&ecirc;ncia para ser emitida para um funcion&aacute;rio de um local para outro.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Querido {transfer_name},</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Conforme diretivas de Gerenciamento, seus servi&ccedil;os est&atilde;o sendo transferidos w.e.f. {transfer_date}.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">O seu novo local de postagem &eacute; {transfer_departamento} departamento de {transfer_branch} ramo e data de transfer&ecirc;ncia {transfer_date}.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">{transfer_description}.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Obrigado</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Considera,</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Departamento de RH,</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">{app_name}</span></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(97,7,'ar','Employee Resignation','<p>Subject :-قسم الموارد البشرية / الشركة لإرسال خطاب استقالته.</p>\n                    <p>عزيزي { assign_user } ،</p>\n                    <p>إنه لمن دواعي الأسف الشديد أن أعترف رسميا باستلام إشعار استقالتك في { notice_date } الى { resignation_date } هو اليوم الأخير لعملك.</p>\n                    <p>لقد كان من دواعي سروري العمل معكم ، وبالنيابة عن الفريق ، أود أن أتمنى لكم أفضل جدا في جميع مساعيكم في المستقبل. ومن خلال هذه الرسالة ، يرجى العثور على حزمة معلومات تتضمن معلومات مفصلة عن عملية الاستقالة.</p>\n                    <p>شكرا لكم مرة أخرى على موقفكم الإيجابي والعمل الجاد كل هذه السنوات.</p>\n                    <p>إشعر بالحرية للوصول إلى الخارج إذا عندك أي أسئلة.</p>\n                    <p>شكرا لك</p>\n                    <p>Regards,</p>\n                    <p>إدارة الموارد البشرية ،</p>\n                    <p>{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(98,7,'da','Employee Resignation','<p>Om: HR-afdelingen / Kompagniet, for at sende en opsigelse.</p>\n                    <p>K&aelig;re { assign_user },</p>\n                    <p>Det er med stor beklagelse, at jeg formelt anerkender modtagelsen af din opsigelsesmeddelelse p&aring; { notice_date } til { resignation_date } er din sidste arbejdsdag</p>\n                    <p>Det har v&aelig;ret en forn&oslash;jelse at arbejde sammen med Dem, og p&aring; vegne af teamet vil jeg &oslash;nske Dem det bedste i alle Deres fremtidige bestr&aelig;belser. Med dette brev kan du finde en informationspakke med detaljerede oplysninger om tilbagetr&aelig;delsesprocessen.</p>\n                    <p>Endnu en gang tak for Deres positive holdning og h&aring;rde arbejde i alle disse &aring;r.</p>\n                    <p>Du er velkommen til at r&aelig;kke ud, hvis du har nogen sp&oslash;rgsm&aring;l.</p>\n                    <p>Tak.</p>\n                    <p>Med venlig hilsen</p>\n                    <p>HR-afdelingen,</p>\n                    <p>{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(99,7,'de','Employee Resignation','<p>Betreff: -Personalabteilung/Firma, um R&uuml;ckmeldungsschreiben zu senden.</p>\n                    <p>Sehr geehrter {assign_user},</p>\n                    <p>Es ist mit gro&szlig;em Bedauern, dass ich den Eingang Ihrer R&uuml;cktrittshinweis auf {notice_date} an {resignation_date} offiziell best&auml;tige, ist Ihr letzter Arbeitstag.</p>\n                    <p>Es war eine Freude, mit Ihnen zu arbeiten, und im Namen des Teams m&ouml;chte ich Ihnen w&uuml;nschen, dass Sie in allen Ihren zuk&uuml;nftigen Bem&uuml;hungen am besten sind. In diesem Brief finden Sie ein Informationspaket mit detaillierten Informationen zum R&uuml;cktrittsprozess.</p>\n                    <p>Vielen Dank noch einmal f&uuml;r Ihre positive Einstellung und harte Arbeit all die Jahre.</p>\n                    <p>F&uuml;hlen Sie sich frei, wenn Sie Fragen haben.</p>\n                    <p>Danke.</p>\n                    <p>Betrachtet,</p>\n                    <p>Personalabteilung,</p>\n                    <p>{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(100,7,'en','Employee Resignation','<p ><b>Subject:-HR department/Company to send resignation letter .</b></p>\n                    <p ><b>Dear {assign_user},</b></p>\n                    <p >It is with great regret that I formally acknowledge receipt of your resignation notice on {notice_date} to {resignation_date} is your final day of work. </p>\n                    <p >It has been a pleasure working with you, and on behalf of the team, I would like to wish you the very best in all your future endeavors. Included with this letter, please find an information packet with detailed information on the resignation process. </p>\n                    <p>Thank you again for your positive attitude and hard work all these years.</p>\n                    <p>Feel free to reach out if you have any questions.</p>\n                    <p>Thank you</p>\n                    <p><b>Regards,</b></p>\n                    <p><b>HR Department,</b></p>\n                    <p><b>{app_name}</b></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(101,7,'es','Employee Resignation','<p>Asunto: -Departamento de RRHH/Empresa para enviar carta de renuncia.</p>\n                    <p>Estimado {assign_user},</p>\n                    <p>Es con gran pesar que recibo formalmente la recepci&oacute;n de su aviso de renuncia en {notice_date} a {resignation_date} es su &uacute;ltimo d&iacute;a de trabajo.</p>\n                    <p>Ha sido un placer trabajar con usted, y en nombre del equipo, me gustar&iacute;a desearle lo mejor en todos sus esfuerzos futuros. Incluido con esta carta, por favor encuentre un paquete de informaci&oacute;n con informaci&oacute;n detallada sobre el proceso de renuncia.</p>\n                    <p>Gracias de nuevo por su actitud positiva y trabajo duro todos estos a&ntilde;os.</p>\n                    <p>Si&eacute;ntase libre de llegar si usted tiene alguna pregunta.</p>\n                    <p>&iexcl;Gracias!</p>\n                    <p>Considerando,</p>\n                    <p>Departamento de Recursos Humanos,</p>\n                    <p>{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(102,7,'fr','Employee Resignation','<p>Objet: -D&eacute;partement RH / Soci&eacute;t&eacute; denvoi dune lettre de d&eacute;mission.</p>\n                    <p>Cher { assign_user },</p>\n                    <p>Cest avec grand regret que je reconnais officiellement la r&eacute;ception de votre avis de d&eacute;mission sur { notice_date } &agrave; { resignation_date } est votre dernier jour de travail.</p>\n                    <p>Cest un plaisir de travailler avec vous, et au nom de l&eacute;quipe, jaimerais vous souhaiter le meilleur dans toutes vos activit&eacute;s futures. Inclus avec cette lettre, veuillez trouver un paquet dinformation contenant des informations d&eacute;taill&eacute;es sur le processus de d&eacute;mission.</p>\n                    <p>Je vous remercie encore de votre attitude positive et de votre travail acharne durant toutes ces ann&eacute;es.</p>\n                    <p>Nh&eacute;sitez pas &agrave; nous contacter si vous avez des questions.</p>\n                    <p>Je vous remercie</p>\n                    <p>Regards,</p>\n                    <p>D&eacute;partement des RH,</p>\n                    <p>{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(103,7,'it','Employee Resignation','<p>Oggetto: - Dipartimento HR / Societ&agrave; per inviare lettera di dimissioni.</p>\n                    <p>Caro {assign_user},</p>\n                    <p>&Egrave; con grande dispiacere che riconosca formalmente la ricezione del tuo avviso di dimissioni su {notice_date} a {resignation_date} &egrave; la tua giornata di lavoro finale.</p>\n                    <p>&Egrave; stato un piacere lavorare con voi, e a nome della squadra, vorrei augurarvi il massimo in tutti i vostri futuri sforzi. Incluso con questa lettera, si prega di trovare un pacchetto informativo con informazioni dettagliate sul processo di dimissioni.</p>\n                    <p>Grazie ancora per il vostro atteggiamento positivo e duro lavoro in tutti questi anni.</p>\n                    <p>Sentiti libero di raggiungere se hai domande.</p>\n                    <p>Grazie</p>\n                    <p>Riguardo,</p>\n                    <p>Dipartimento HR,</p>\n                    <p>{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(104,7,'ja','Employee Resignation','<p>件名:-HR 部門/企業は辞表を送信します。</p>\n                    <p>{assign_user} の認証を解除します。</p>\n                    <p>{ notice_date} に対するあなたの辞任通知を { resignation_date} に正式に受理することを正式に確認することは、非常に残念です。</p>\n                    <p>あなたと一緒に仕事をしていて、チームのために、あなたの将来の努力において、あなたのことを最高のものにしたいと思っています。 このレターには、辞任プロセスに関する詳細な情報が記載されている情報パケットをご覧ください。</p>\n                    <p>これらの長年の前向きな姿勢と努力を重ねて感謝します。</p>\n                    <p>質問がある場合は、自由に連絡してください。</p>\n                    <p>ありがとう</p>\n                    <p>よろしく</p>\n                    <p>HR 部門</p>\n                    <p>{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(105,7,'nl','Employee Resignation','<p>Betreft: -HR-afdeling/Bedrijf om ontslagbrief te sturen.</p>\n                    <p>Geachte { assign_user },</p>\n                    <p>Het is met grote spijt dat ik de ontvangst van uw ontslagbrief op { notice_date } tot { resignation_date } formeel de ontvangst van uw laatste dag van het werk bevestigt.</p>\n                    <p>Het was een genoegen om met u samen te werken, en namens het team zou ik u het allerbeste willen wensen in al uw toekomstige inspanningen. Vermeld bij deze brief een informatiepakket met gedetailleerde informatie over het ontslagproces.</p>\n                    <p>Nogmaals bedankt voor uw positieve houding en hard werken al die jaren.</p>\n                    <p>Voel je vrij om uit te reiken als je vragen hebt.</p>\n                    <p>Dank u wel</p>\n                    <p>Betreft:</p>\n                    <p>HR-afdeling,</p>\n                    <p>{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(106,7,'pl','Employee Resignation','<p>Temat: -Dział HR/Firma do wysyłania listu rezygnacyjnego.</p>\n                    <p>Drogi użytkownika {assign_user },</p>\n                    <p>Z wielkim żalem, że oficjalnie potwierdzam otrzymanie powiadomienia o rezygnacji w dniu {notice_date } to {resignation_date } to tw&oacute;j ostatni dzień pracy.</p>\n                    <p>Z przyjemnością wsp&oacute;łpracujemy z Tobą, a w imieniu zespołu chciałbym życzyć Wam wszystkiego najlepszego we wszystkich swoich przyszłych przedsięwzięciu. Dołączone do tego listu prosimy o znalezienie pakietu informacyjnego ze szczeg&oacute;łowymi informacjami na temat procesu dymisji.</p>\n                    <p>Jeszcze raz dziękuję za pozytywne nastawienie i ciężką pracę przez te wszystkie lata.</p>\n                    <p>Czuj się swobodnie, jeśli masz jakieś pytania.</p>\n                    <p>Dziękujemy</p>\n                    <p>W odniesieniu do</p>\n                    <p>Dział HR,</p>\n                    <p>{app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(107,7,'ru','Employee Resignation','<p>Тема: -HR отдел/Компания отправить письмо об отставке.</p>\n                    <p>Уважаемый пользователь { assign_user },</p>\n                    <p>С большим сожалением я официально подтверждаю получение вашего уведомления об отставке { notice_date } в { resignation_date }-это ваш последний день работы.</p>\n                    <p>С Вами было приятно работать, и от имени команды я хотел бы по# желать вам самого лучшего во всех ваших будущих начинаниях. В этом письме Вы можете найти информационный пакет с подробной информацией об отставке.</p>\n                    <p>Еще раз спасибо за ваше позитивное отношение и трудолюбие все эти годы.</p>\n                    <p>Не стеснитесь, если у вас есть вопросы.</p>\n                    <p>Спасибо.</p>\n                    <p>С уважением,</p>\n                    <p>Отдел кадров,</p>\n                    <p>{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(108,7,'pt','Employee Resignation','<p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Assunto:-Departamento de RH / Empresa para enviar carta de demiss&atilde;o.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Querido {assign_user},</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">&Eacute; com grande pesar que reconhe&ccedil;o formalmente o recebimento do seu aviso de demiss&atilde;o em {notice_date} a {resignation_date} &eacute; o seu dia final de trabalho.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Foi um prazer trabalhar com voc&ecirc;, e em nome da equipe, gostaria de desej&aacute;-lo o melhor em todos os seus futuros empreendimentos. Inclu&iacute;dos com esta carta, por favor, encontre um pacote de informa&ccedil;&otilde;es com informa&ccedil;&otilde;es detalhadas sobre o processo de demiss&atilde;o.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Obrigado novamente por sua atitude positiva e trabalho duro todos esses anos.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Obrigado</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Considera,</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Departamento de RH,</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">{app_name}</span></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(109,7,'tr','Employee Resignation','<p ><b>Konu:-İstifa mektubu gönderilecek İK departmanı/Şirket.</b></p>\n                    <p ><b>Sayın {assign_user},</b></p>\n                    <p >İstifa bildiriminizi aldığımı büyük bir üzüntüyle resmen kabul ediyorum {notice_date} ile {resignation_date} işin son günü. </p>\n                    <p >Sizinle çalışmak bir zevkti ve ekip adına, gelecekteki tüm çabalarınızda size en iyisini diliyorum. Bu mektuba ek olarak, lütfen istifa süreci hakkında ayrıntılı bilgi içeren bir bilgi paketi bulun. </p>\n                    <p>Tüm bu yıllar boyunca olumlu tutumunuz ve sıkı çalışmanız için tekrar teşekkür ederiz.</p>\n                    <p>Herhangi bir sorunuz varsa ulaşmaktan çekinmeyin.</p>\n                    <p>Teşekkür ederim</p>\n                    <p><b>Saygılarımızla,</b></p>\n                    <p><b>İK Departmanı,</b></p>\n                    <p><b>{app_name}</b></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(110,7,'zh','Employee Resignation','<p ><b>主题：-人力资源部/公司发送辞职信 .</b></p>\n                    <p ><b>亲爱的 {assign_user},</b></p>\n                    <p >我非常遗憾地正式确认收到您的辞职通知 {notice_date} 到 {resignation_date} 是你最后一天的工作. </p>\n                    <p >与您合作非常愉快，我谨代表团队祝愿您在未来的工作中一切顺利。请在这封信中找到一个信息包，其中包含有关辞职流程的详细信息. </p>\n                    <p>再次感谢您这些年来的积极态度和努力.</p>\n                    <p>如果您有任何疑问，请随时与我们联系.</p>\n                    <p>谢谢</p>\n                    <p><b>问候,</b></p>\n                    <p><b>人事部,</b></p>\n                    <p><b>{app_name}</b></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(111,7,'he','Employee Resignation','<p ><b>נושא:-מחלקת משאבי אנוש/חברה לשלוח מכתב התפטרות .</b></p>\n                    <p ><b>יָקָר {assign_user},</b></p>\n                    <p >בצער רב אני מאשר רשמית את קבלת הודעת ההתפטרות שלך ביום {notice_date} ל {resignation_date} הוא היום האחרון לעבודה שלך. </p>\n                    <p >היה לי תענוג לעבוד איתך, ובשם הצוות, אני רוצה לאחל לך את הטוב ביותר בכל העשייה העתידית שלך. מצורף למכתב זה, נא למצוא חבילת מידע עם מידע מפורט על תהליך ההתפטרות. </p>\n                    <p>שוב תודה לך על הגישה החיובית והעבודה הקשה כל השנים.</p>\n                    <p>אל תהסס לפנות אם יש לך שאלות.</p>\n                    <p>תודה</p>\n                    <p><b>בברכה,</b></p>\n                    <p><b>מחלקת משאבי אנוש,</b></p>\n                    <p><b>{app_name}</b></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(112,7,'pt-br','Employee Resignation','<p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Assunto:-Departamento de RH / Empresa para enviar carta de demiss&atilde;o.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Querido {assign_user},</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">&Eacute; com grande pesar que reconhe&ccedil;o formalmente o recebimento do seu aviso de demiss&atilde;o em {notice_date} a {resignation_date} &eacute; o seu dia final de trabalho.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Foi um prazer trabalhar com voc&ecirc;, e em nome da equipe, gostaria de desej&aacute;-lo o melhor em todos os seus futuros empreendimentos. Inclu&iacute;dos com esta carta, por favor, encontre um pacote de informa&ccedil;&otilde;es com informa&ccedil;&otilde;es detalhadas sobre o processo de demiss&atilde;o.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Obrigado novamente por sua atitude positiva e trabalho duro todos esses anos.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Obrigado</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Considera,</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Departamento de RH,</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">{app_name}</span></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(113,8,'ar','Employee Trip','<p>Subject : -HR ادارة / شركة لارسال رسالة رحلة.</p>\n                    <p>عزيزي { employee_trip_name },</p>\n                    <p>قمة الصباح إليك ! أكتب إلى مكتب إدارتكم بطلب متواضع للسفر من أجل زيارة إلى الخارج عن قصد.</p>\n                    <p>وسيكون هذا المنتدى هو المنتدى الرئيسي لأعمال المناخ في العام ، وقد كان محظوظا بما فيه الكفاية لكي يرشح لتمثيل شركتنا والمنطقة خلال الحلقة الدراسية.</p>\n                    <p>إن عضويتي التي دامت ثلاث سنوات كجزء من المجموعة والمساهمات التي قدمتها إلى الشركة ، ونتيجة لذلك ، كانت مفيدة من الناحية التكافلية. وفي هذا الصدد ، فإنني أطلب منكم بصفتي الرئيس المباشر لي أن يسمح لي بالحضور.</p>\n                    <p>مزيد من التفاصيل عن الرحلة :&nbsp;</p>\n                    <p>مدة الرحلة : { start_date } الى { end_date }</p>\n                    <p>الغرض من الزيارة : { purpose_of_visit }</p>\n                    <p>مكان الزيارة : { place_of_visit }</p>\n                    <p>الوصف : { trip_description }</p>\n                    <p>إشعر بالحرية للوصول إلى الخارج إذا عندك أي أسئلة.</p>\n                    <p>شكرا لك</p>\n                    <p>Regards,</p>\n                    <p>إدارة الموارد البشرية ،</p>\n                    <p>{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(114,8,'da','Employee Trip','<p>Om: HR-afdelingen / Kompagniet, der skal sende udflugten.</p>\n                    <p>K&aelig;re { employee_trip_name },</p>\n                    <p>Godmorgen til dig! Jeg skriver til dit kontor med en ydmyg anmodning om at rejse for en { purpose_of_visit } i udlandet.</p>\n                    <p>Det ville v&aelig;re &aring;rets f&oslash;rende klimaforum, og det ville v&aelig;re heldigt nok at blive nomineret til at repr&aelig;sentere vores virksomhed og regionen under seminaret.</p>\n                    <p>Mit tre&aring;rige medlemskab som en del af den gruppe og de bidrag, jeg har givet til virksomheden, har som f&oslash;lge heraf v&aelig;ret symbiotisk fordelagtigt. I den henseende anmoder jeg om, at De som min n&aelig;rmeste overordnede giver mig lov til at deltage.</p>\n                    <p>Flere oplysninger om turen:</p>\n                    <p>Trip Duration: { start_date } til { end_date }</p>\n                    <p>Form&aring;let med Bes&oslash;g: { purpose_of_visit }</p>\n                    <p>Plads af bes&oslash;g: { place_of_visit }</p>\n                    <p>Beskrivelse: { trip_description }</p>\n                    <p>Du er velkommen til at r&aelig;kke ud, hvis du har nogen sp&oslash;rgsm&aring;l.</p>\n                    <p>Tak.</p>\n                    <p>Med venlig hilsen</p>\n                    <p>HR-afdelingen,</p>\n                    <p>{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(115,8,'de','Employee Trip','<p>Betreff: -Personalabteilung/Firma, um Reisebrief zu schicken.</p>\n                    <p>Sehr geehrter {employee_trip_name},</p>\n                    <p>Top of the morning to you! Ich schreibe an Ihre Dienststelle mit dem&uuml;tiger Bitte um eine Reise nach einem {purpose_of_visit} im Ausland.</p>\n                    <p>Es w&auml;re das f&uuml;hrende Klima-Business-Forum des Jahres und hatte das Gl&uuml;ck, nominiert zu werden, um unser Unternehmen und die Region w&auml;hrend des Seminars zu vertreten.</p>\n                    <p>Meine dreij&auml;hrige Mitgliedschaft als Teil der Gruppe und die Beitr&auml;ge, die ich an das Unternehmen gemacht habe, sind dadurch symbiotisch vorteilhaft gewesen. In diesem Zusammenhang ersuche ich Sie als meinen unmittelbaren Vorgesetzten, mir zu gestatten, zu besuchen.</p>\n                    <p>Mehr Details zu Reise:</p>\n                    <p>Dauer der Fahrt: {start_date} bis {end_date}</p>\n                    <p>Zweck des Besuchs: {purpose_of_visit}</p>\n                    <p>Ort des Besuchs: {place_of_visit}</p>\n                    <p>Beschreibung: {trip_description}</p>\n                    <p>F&uuml;hlen Sie sich frei, wenn Sie Fragen haben.</p>\n                    <p>Danke.</p>\n                    <p>Betrachtet,</p>\n                    <p>Personalabteilung,</p>\n                    <p>{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(116,8,'en','Employee Trip','<p><strong>Subject:-HR department/Company to send trip letter .</strong></p>\n                    <p><strong>Dear {employee_trip_name},</strong></p>\n                    <p>Top of the morning to you! I am writing to your department office with a humble request to travel for a {purpose_of_visit} abroad.</p>\n                    <p>It would be the leading climate business forum of the year and have been lucky enough to be nominated to represent our company and the region during the seminar.</p>\n                    <p>My three-year membership as part of the group and contributions I have made to the company, as a result, have been symbiotically beneficial. In that regard, I am requesting you as my immediate superior to permit me to attend.</p>\n                    <p>More detail about trip:{start_date} to {end_date}</p>\n                    <p>Trip Duration:{start_date} to {end_date}</p>\n                    <p>Purpose of Visit:{purpose_of_visit}</p>\n                    <p>Place of Visit:{place_of_visit}</p>\n                    <p>Description:{trip_description}</p>\n                    <p>Feel free to reach out if you have any questions.</p>\n                    <p>Thank you</p>\n                    <p><strong>Regards,</strong></p>\n                    <p><strong>HR Department,</strong></p>\n                    <p><strong>{app_name}</strong></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(117,8,'es','Employee Trip','<p>Asunto: -Departamento de RRHH/Empresa para enviar carta de viaje.</p>\n                    <p>Estimado {employee_trip_name},</p>\n                    <p>&iexcl;Top de la ma&ntilde;ana para ti! Estoy escribiendo a su oficina del departamento con una humilde petici&oacute;n de viajar para un {purpose_of_visit} en el extranjero.</p>\n                    <p>Ser&iacute;a el principal foro de negocios clim&aacute;ticos del a&ntilde;o y han tenido la suerte de ser nominados para representar a nuestra compa&ntilde;&iacute;a y a la regi&oacute;n durante el seminario.</p>\n                    <p>Mi membres&iacute;a de tres a&ntilde;os como parte del grupo y las contribuciones que he hecho a la compa&ntilde;&iacute;a, como resultado, han sido simb&oacute;ticamente beneficiosos. En ese sentido, le estoy solicitando como mi superior inmediato que me permita asistir.</p>\n                    <p>M&aacute;s detalles sobre el viaje:&nbsp;</p>\n                    <p>Duraci&oacute;n del viaje: {start_date} a {end_date}</p>\n                    <p>Finalidad de la visita: {purpose_of_visit}</p>\n                    <p>Lugar de visita: {place_of_visit}</p>\n                    <p>Descripci&oacute;n: {trip_description}</p>\n                    <p>Si&eacute;ntase libre de llegar si usted tiene alguna pregunta.</p>\n                    <p>&iexcl;Gracias!</p>\n                    <p>Considerando,</p>\n                    <p>Departamento de Recursos Humanos,</p>\n                    <p>{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(118,8,'fr','Employee Trip','<p>Objet: -Service des RH / Compagnie pour envoyer une lettre de voyage.</p>\n                    <p>Cher { employee_trip_name },</p>\n                    <p>Top of the morning to you ! J&eacute;crai au bureau de votre minist&egrave;re avec une humble demande de voyage pour une {purpose_of_visit } &agrave; l&eacute;tranger.</p>\n                    <p>Il sagit du principal forum sur le climat de lann&eacute;e et a eu la chance d&ecirc;tre d&eacute;sign&eacute; pour repr&eacute;senter notre entreprise et la r&eacute;gion au cours du s&eacute;minaire.</p>\n                    <p>Mon adh&eacute;sion de trois ans au groupe et les contributions que jai faites &agrave; lentreprise, en cons&eacute;quence, ont &eacute;t&eacute; b&eacute;n&eacute;fiques sur le plan symbiotique. &Agrave; cet &eacute;gard, je vous demande d&ecirc;tre mon sup&eacute;rieur imm&eacute;diat pour me permettre dy assister.</p>\n                    <p>Plus de d&eacute;tails sur le voyage:</p>\n                    <p>Dur&eacute;e du voyage: { start_date } &agrave; { end_date }</p>\n                    <p>Objet de la visite: { purpose_of_visit}</p>\n                    <p>Lieu de visite: { place_of_visit }</p>\n                    <p>Description: { trip_description }</p>\n                    <p>Nh&eacute;sitez pas &agrave; nous contacter si vous avez des questions.</p>\n                    <p>Je vous remercie</p>\n                    <p>Regards,</p>\n                    <p>D&eacute;partement des RH,</p>\n                    <p>{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(119,8,'it','Employee Trip','<p>Oggetto: - Dipartimento HR / Societ&agrave; per inviare lettera di viaggio.</p>\n                    <p>Caro {employee_trip_name},</p>\n                    <p>In cima al mattino a te! Scrivo al tuo ufficio dipartimento con umile richiesta di viaggio per un {purpose_of_visit} allestero.</p>\n                    <p>Sarebbe il forum aziendale sul clima leader dellanno e sono stati abbastanza fortunati da essere nominati per rappresentare la nostra azienda e la regione durante il seminario.</p>\n                    <p>La mia adesione triennale come parte del gruppo e i contributi che ho apportato allazienda, di conseguenza, sono stati simbioticamente vantaggiosi. A tal proposito, vi chiedo come mio immediato superiore per consentirmi di partecipare.</p>\n                    <p>Pi&ugrave; dettagli sul viaggio:</p>\n                    <p>Trip Duration: {start_date} a {end_date}</p>\n                    <p>Finalit&agrave; di Visita: {purpose_of_visit}</p>\n                    <p>Luogo di Visita: {place_of_visit}</p>\n                    <p>Descrizione: {trip_description}</p>\n                    <p>Sentiti libero di raggiungere se hai domande.</p>\n                    <p>Grazie</p>\n                    <p>Riguardo,</p>\n                    <p>Dipartimento HR,</p>\n                    <p>{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(120,8,'ja','Employee Trip','<p>件名:-HR 部門/会社は出張レターを送信します。</p>\n                    <p>{ employee_trip_name} に出庫します。</p>\n                    <p>朝のトップだ ! 海外で {purpose_of_visit} をお願いしたいという謙虚な要求をもって、私はあなたの部署に手紙を書いています。</p>\n                    <p>これは、今年の主要な気候ビジネス・フォーラムとなり、セミナーの開催中に当社と地域を代表する候補になるほど幸運にも恵まれています。</p>\n                    <p>私が会社に対して行った 3 年間のメンバーシップは、その結果として、共生的に有益なものでした。 その点では、私は、私が出席することを許可することを、私の即座の上司として</p>\n                    <p>トリップについての詳細 :</p>\n                    <p>トリップ期間:{start_date} を {end_date} に設定します</p>\n                    <p>アクセスの目的 :{purpose_of_visit}</p>\n                    <p>訪問の場所 :{place_of_visit}</p>\n                    <p>説明:{trip_description}</p>\n                    <p>質問がある場合は、自由に連絡してください。</p>\n                    <p>ありがとう</p>\n                    <p>よろしく</p>\n                    <p>HR 部門</p>\n                    <p>{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(121,8,'nl','Employee Trip','<p>Betreft: -HR-afdeling/Bedrijf om reisbrief te sturen.</p>\n                    <p>Geachte { employee_trip_name },</p>\n                    <p>Top van de ochtend aan u! Ik schrijf uw afdelingsbureau met een bescheiden verzoek om een { purpose_of_visit } in het buitenland te bezoeken.</p>\n                    <p>Het zou het toonaangevende klimaatforum van het jaar zijn en hebben het geluk gehad om genomineerd te worden om ons bedrijf en de regio te vertegenwoordigen tijdens het seminar.</p>\n                    <p>Mijn driejarige lidmaatschap als onderdeel van de groep en bijdragen die ik heb geleverd aan het bedrijf, als gevolg daarvan, zijn symbiotisch gunstig geweest. Wat dat betreft, verzoek ik u als mijn directe chef mij in staat te stellen aanwezig te zijn.</p>\n                    <p>Meer details over reis:</p>\n                    <p>Duur van reis: { start_date } tot { end_date }</p>\n                    <p>Doel van bezoek: { purpose_of_visit }</p>\n                    <p>Plaats van bezoek: { place_of_visit }</p>\n                    <p>Beschrijving: { trip_description }</p>\n                    <p>Voel je vrij om uit te reiken als je vragen hebt.</p>\n                    <p>Dank u we</p>\n                    <p>Betreft:</p>\n                    <p>HR-afdeling,</p>\n                    <p>{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(122,8,'pl','Employee Trip','<p>Temat:-Dział HR/Firma do wysyłania listu podr&oacute;ży.</p>\n                    <p>Szanowny {employee_trip_name },</p>\n                    <p>Od samego rana do Ciebie! Piszę do twojego biura, z pokornym prośbą o wyjazd na {purpose_of_visit&nbsp;} za granicą.</p>\n                    <p>Byłoby to wiodącym forum biznesowym w tym roku i miało szczęście być nominowane do reprezentowania naszej firmy i regionu podczas seminarium.</p>\n                    <p>Moje trzyletnie członkostwo w grupie i składkach, kt&oacute;re uczyniłem w firmie, w rezultacie, były symbiotycznie korzystne. W tym względzie, zwracam się do pana o m&oacute;j bezpośredni przełożony, kt&oacute;ry pozwoli mi na udział w tej sprawie.</p>\n                    <p>Więcej szczeg&oacute;ł&oacute;w na temat wyjazdu:</p>\n                    <p>Czas trwania rejsu: {start_date } do {end_date }</p>\n                    <p>Cel wizyty: {purpose_of_visit }</p>\n                    <p>Miejsce wizyty: {place_of_visit }</p>\n                    <p>Opis: {trip_description }</p>\n                    <p>Czuj się swobodnie, jeśli masz jakieś pytania.</p>\n                    <p>Dziękujemy</p>\n                    <p>W odniesieniu do</p>\n                    <p>Dział HR,</p>\n                    <p>{app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(123,8,'ru','Employee Trip','<p>Тема: -HR отдел/Компания для отправки письма на поездку.</p>\n                    <p>Уважаемый { employee_trip_name },</p>\n                    <p>С утра до тебя! Я пишу в ваш отдел с смиренным запросом на поездку за границу.</p>\n                    <p>Это был бы ведущий климатический бизнес-форум года и по везло, что в ходе семинара он будет представлять нашу компанию и регион.</p>\n                    <p>Мое трехлетнее членство в составе группы и взносы, которые я внес в компанию, в результате, были симбиотически выгодны. В этой связи я прошу вас как моего непосредственного начальника разрешить мне присутствовать.</p>\n                    <p>Подробнее о поездке:</p>\n                    <p>Длительность поездки: { start_date } в { end_date }</p>\n                    <p>Цель посещения: { purpose_of_visit }</p>\n                    <p>Место посещения: { place_of_visit }</p>\n                    <p>Описание: { trip_description }</p>\n                    <p>Не стеснитесь, если у вас есть вопросы.</p>\n                    <p>Спасибо.</p>\n                    <p>С уважением,</p>\n                    <p>Отдел кадров,</p>\n                    <p>{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(124,8,'pt','Employee Trip','<p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Assunto:-Departamento de RH / Empresa para enviar carta de viagem.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Querido {employee_trip_name},</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Topo da manh&atilde; para voc&ecirc;! Estou escrevendo para o seu departamento de departamento com um humilde pedido para viajar por um {purpose_of_visit} no exterior.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Seria o principal f&oacute;rum de neg&oacute;cios clim&aacute;tico do ano e teve a sorte de ser indicado para representar nossa empresa e a regi&atilde;o durante o semin&aacute;rio.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">A minha filia&ccedil;&atilde;o de tr&ecirc;s anos como parte do grupo e contribui&ccedil;&otilde;es que fiz &agrave; empresa, como resultado, foram simbioticamente ben&eacute;fico. A esse respeito, solicito que voc&ecirc; seja meu superior imediato para me permitir comparecer.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Mais detalhes sobre viagem:</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Trip Dura&ccedil;&atilde;o: {start_date} a {end_date}</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Objetivo da Visita: {purpose_of_visit}</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Local de Visita: {place_of_visit}</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Descri&ccedil;&atilde;o: {trip_description}</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Obrigado</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Considera,</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Departamento de RH,</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">{app_name}</span></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(125,8,'tr','Employee Trip','<p><strong>Konu:-İK departmanı/Şirket gezi mektubu gönderecek .</strong></p>\n                    <p><strong>Sayın {employee_trip_name},</strong></p>\n                    <p>Size sabahın en iyisi! Mütevazi bir seyahat talebiyle departman ofisinize yazıyorum {purpose_of_visit} yurt dışı.</p>\n                    <p>Yılın önde gelen iklim iş forumu olacaktı ve seminer sırasında şirketimizi ve bölgeyi temsil edecek kadar şanslıydık.</p>\n                    <p>Grubun bir parçası olarak üç yıllık üyeliğim ve bunun sonucunda şirkete yaptığım katkılar simbiyotik olarak faydalı oldu. Bu bağlamda, acil amirim olarak katılmama izin vermenizi rica ediyorum.</p>\n                    <p>Gezi hakkında daha fazla detay:{start_date} ile {end_date}</p>\n                    <p>Yolculuk Süresi:{start_date} ile {end_date}</p>\n                    <p>Ziyaret amacı:{purpose_of_visit}</p>\n                    <p>Ziyaret Yeri:{place_of_visit}</p>\n                    <p>Tanım:{trip_description}</p>\n                    <p>Herhangi bir sorunuz varsa ulaşmaktan çekinmeyin.</p>\n                    <p>Teşekkür ederim</p>\n                    <p><strong>Saygılarımızla,</strong></p>\n                    <p><strong>İK Departmanı,</strong></p>\n                    <p><strong>{app_name}</strong></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(126,8,'zh','Employee Trip','<p><strong>主题：-HR部门/公司发送出差函 .</strong></p>\n                    <p><strong>亲爱的 {employee_trip_name},</strong></p>\n                    <p>早上好！我写信给你们的部门办公室，提出一个小小的旅行请求 {purpose_of_visit} 国外.</p>\n                    <p>这将是今年领先的气候商业论坛，我们很幸运能够被提名在研讨会上代表我们公司和该地区.</p>\n                    <p>我作为团队成员的三年会员身份以及我对公司做出的贡献是共生有益的。在这方面，我请求你作为我的直接上级允许我参加.</p>\n                    <p>有关行程的更多详细信息:{start_date} 到 {end_date}</p>\n                    <p>行程持续时间:{start_date} 到 {end_date}</p>\n                    <p>参观的目的:{purpose_of_visit}</p>\n                    <p>参观地点:{place_of_visit}</p>\n                    <p>描述:{trip_description}</p>\n                    <p>如果您有任何疑问，请随时与我们联系.</p>\n                    <p>谢谢</p>\n                    <p><strong>问候,</strong></p>\n                    <p><strong>人事部,</strong></p>\n                    <p><strong>{app_name}</strong></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(127,8,'he','Employee Trip','<p><strong>נושא:-מחלקת משאבי אנוש/חברה לשלוח מכתב טיול .</strong></p>\n                    <p><strong>יָקָר {employee_trip_name},</strong></p>\n                    <p>שיא הבוקר לך! אני כותב למשרד המחלקה שלך עם בקשה צנועה לנסוע לא {purpose_of_visit} מחוץ לארץ.</p>\n                    <p>זה יהיה פורום עסקי האקלים המוביל של השנה והתמזל מזלי להיות מועמד לייצג את החברה שלנו ואת האזור במהלך הסמינר.</p>\n                    <p>חברותי בת שלוש שנים כחלק מהקבוצה והתרומות שתרמתי לחברה, כתוצאה מכך, הועילו באופן סימביוטי. בהקשר זה, אני מבקש ממך כמפקד הישיר שלי להתיר לי להשתתף.</p>\n                    <p>פרטים נוספים על הטיול:{start_date} ל {end_date}</p>\n                    <p>משך הטיול:{start_date} ל {end_date}</p>\n                    <p>מטרת הביקור:{purpose_of_visit}</p>\n                    <p>מקום ביקור:{place_of_visit}</p>\n                    <p>תיאור:{trip_description}</p>\n                    <p>אל תהסס לפנות אם יש לך שאלות.</p>\n                    <p>תודה</p>\n                    <p><strong>בברכה,</strong></p>\n                    <p><strong>מחלקת משאבי אנוש,</strong></p>\n                    <p><strong>{app_name}</strong></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(128,8,'pt-br','Employee Trip','<p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Assunto:-Departamento de RH / Empresa para enviar carta de viagem.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Querido {employee_trip_name},</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Topo da manh&atilde; para voc&ecirc;! Estou escrevendo para o seu departamento de departamento com um humilde pedido para viajar por um {purpose_of_visit} no exterior.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Seria o principal f&oacute;rum de neg&oacute;cios clim&aacute;tico do ano e teve a sorte de ser indicado para representar nossa empresa e a regi&atilde;o durante o semin&aacute;rio.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">A minha filia&ccedil;&atilde;o de tr&ecirc;s anos como parte do grupo e contribui&ccedil;&otilde;es que fiz &agrave; empresa, como resultado, foram simbioticamente ben&eacute;fico. A esse respeito, solicito que voc&ecirc; seja meu superior imediato para me permitir comparecer.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Mais detalhes sobre viagem:</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Trip Dura&ccedil;&atilde;o: {start_date} a {end_date}</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Objetivo da Visita: {purpose_of_visit}</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Local de Visita: {place_of_visit}</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Descri&ccedil;&atilde;o: {trip_description}</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Obrigado</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Considera,</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Departamento de RH,</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">{app_name}</span></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(129,9,'ar','Employee Promotion','<p>Subject : -HR القسم / الشركة لارسال رسالة تهنئة الى العمل للتهنئة بالعمل.</p>\n                    <p>عزيزي { employee_promotion_name },</p>\n                    <p>تهاني على ترقيتك الى { promotion_designation } { promotion_title } الفعال { promotion_date }.</p>\n                    <p>وسنواصل توقع تحقيق الاتساق وتحقيق نتائج عظيمة منكم في دوركم الجديد. ونأمل أن تكون قدوة للموظفين الآخرين في المنظمة.</p>\n                    <p>ونتمنى لكم التوفيق في أداءكم في المستقبل ، وتهانينا !</p>\n                    <p>ومرة أخرى ، تهانئي على الموقف الجديد.</p>\n                    <p>إشعر بالحرية للوصول إلى الخارج إذا عندك أي أسئلة.</p>\n                    <p>شكرا لك</p>\n                    <p>Regards,</p>\n                    <p>إدارة الموارد البشرية ،</p>\n                    <p>{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(130,9,'da','Employee Promotion','<p>Om: HR-afdelingen / Virksomheden om at sende en lyk&oslash;nskning til jobfremst&oslash;d.</p>\n                    <p>K&aelig;re { employee_promotion_name },</p>\n                    <p>Tillykke med din forfremmelse til { promotion_designation } { promotion_title } effektiv { promotion_date }.</p>\n                    <p>Vi vil fortsat forvente konsekvens og store resultater fra Dem i Deres nye rolle. Vi h&aring;ber, at De vil foreg&aring; med et godt eksempel for de &oslash;vrige ansatte i organisationen.</p>\n                    <p>Vi &oslash;nsker Dem held og lykke med Deres fremtidige optr&aelig;den, og tillykke!</p>\n                    <p>Endnu en gang tillykke med den nye holdning.</p>\n                    <p>Du er velkommen til at r&aelig;kke ud, hvis du har nogen sp&oslash;rgsm&aring;l.</p>\n                    <p>Tak.</p>\n                    <p>Med venlig hilsen</p>\n                    <p>HR-afdelingen,</p>\n                    <p>{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(131,9,'de','Employee Promotion','<p>Betrifft: -Personalabteilung/Unternehmen, um einen Gl&uuml;ckwunschschreiben zu senden.</p>\n                    <p>Sehr geehrter {employee_promotion_name},</p>\n                    <p>Herzlichen Gl&uuml;ckwunsch zu Ihrer Werbeaktion an {promotion_designation} {promotion_title} wirksam {promotion_date}.</p>\n                    <p>Wir werden von Ihnen in Ihrer neuen Rolle weiterhin Konsistenz und gro&szlig;e Ergebnisse erwarten. Wir hoffen, dass Sie ein Beispiel f&uuml;r die anderen Mitarbeiter der Organisation setzen werden.</p>\n                    <p>Wir w&uuml;nschen Ihnen viel Gl&uuml;ck f&uuml;r Ihre zuk&uuml;nftige Leistung, und gratulieren!</p>\n                    <p>Nochmals herzlichen Gl&uuml;ckwunsch zu der neuen Position.</p>\n                    <p>F&uuml;hlen Sie sich frei, wenn Sie Fragen haben.</p>\n                    <p>Danke.</p>\n                    <p>Betrachtet,</p>\n                    <p>Personalabteilung,</p>\n                    <p>{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(132,9,'en','Employee Promotion','<p>&nbsp;</p>\n                    <p><strong>Subject:-HR department/Company to send job promotion congratulation letter.</strong></p>\n                    <p><strong>Dear {employee_promotion_name},</strong></p>\n                    <p>Congratulations on your promotion to {promotion_designation} {promotion_title} effective {promotion_date}.</p>\n                    <p>We shall continue to expect consistency and great results from you in your new role. We hope that you will set an example for the other employees of the organization.</p>\n                    <p>We wish you luck for your future performance, and congratulations!.</p>\n                    <p>Again, congratulations on the new position.</p>\n                    <p>&nbsp;</p>\n                    <p>Feel free to reach out if you have any questions.</p>\n                    <p>Thank you</p>\n                    <p><strong>Regards,</strong></p>\n                    <p><strong>HR Department,</strong></p>\n                    <p><strong>{app_name}</strong></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(133,9,'es','Employee Promotion','<p>Asunto: -Departamento de RRHH/Empresa para enviar carta de felicitaci&oacute;n de promoci&oacute;n de empleo.</p>\n                    <p>Estimado {employee_promotion_name},</p>\n                    <p>Felicidades por su promoci&oacute;n a {promotion_designation} {promotion_title} efectiva {promotion_date}.</p>\n                    <p>Seguiremos esperando la coherencia y los grandes resultados de ustedes en su nuevo papel. Esperamos que usted ponga un ejemplo para los otros empleados de la organizaci&oacute;n.</p>\n                    <p>Le deseamos suerte para su futuro rendimiento, y felicitaciones!.</p>\n                    <p>Una vez m&aacute;s, felicidades por la nueva posici&oacute;n.</p>\n                    <p>Si&eacute;ntase libre de llegar si usted tiene alguna pregunta.</p>\n                    <p>&iexcl;Gracias!</p>\n                    <p>Considerando,</p>\n                    <p>Departamento de Recursos Humanos,</p>\n                    <p>{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(134,9,'fr','Employee Promotion','<p>Objet: -D&eacute;partement RH / Soci&eacute;t&eacute; denvoi dune lettre de f&eacute;licitations pour la promotion de lemploi.</p>\n                    <p>Cher { employee_promotion_name },</p>\n                    <p>F&eacute;licitations pour votre promotion &agrave; { promotion_d&eacute;signation } { promotion_title } effective { promotion_date }.</p>\n                    <p>Nous continuerons &agrave; vous attendre &agrave; une coh&eacute;rence et &agrave; de grands r&eacute;sultats de votre part dans votre nouveau r&ocirc;le. Nous esp&eacute;rons que vous trouverez un exemple pour les autres employ&eacute;s de lorganisation.</p>\n                    <p>Nous vous souhaitons bonne chance pour vos performances futures et f&eacute;licitations !</p>\n                    <p>Encore une fois, f&eacute;licitations pour le nouveau poste.</p>\n                    <p>Nh&eacute;sitez pas &agrave; nous contacter si vous avez des questions.</p>\n                    <p>Je vous remercie</p>\n                    <p>Regards,</p>\n                    <p>D&eacute;partement des RH,</p>\n                    <p>{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(135,9,'it','Employee Promotion','<p>Oggetto: - Dipartimento HR / Societ&agrave; per inviare la lettera di congratulazioni alla promozione del lavoro.</p>\n                    <p>Caro {employee_promotion_name},</p>\n                    <p>Complimenti per la tua promozione a {promotion_designation} {promotion_title} efficace {promotion_date}.</p>\n                    <p>Continueremo ad aspettarci coerenza e grandi risultati da te nel tuo nuovo ruolo. Ci auguriamo di impostare un esempio per gli altri dipendenti dellorganizzazione.</p>\n                    <p>Ti auguriamo fortuna per le tue prestazioni future, e complimenti!.</p>\n                    <p>Ancora, complimenti per la nuova posizione.</p>\n                    <p>Sentiti libero di raggiungere se hai domande.</p>\n                    <p>Grazie</p>\n                    <p>Riguardo,</p>\n                    <p>Dipartimento HR,</p>\n                    <p>{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(136,9,'ja','Employee Promotion','<p>件名:-HR 部門/企業は、求人広告の祝賀状を送信します。</p>\n                    <p>{ employee_promotion_name} に出庫します。</p>\n                    <p>{promotion_designation } { promotion_title} {promotion_date} 販促に対するお祝いのお祝いがあります。</p>\n                    <p>今後とも、お客様の新しい役割において一貫性と大きな成果を期待します。 組織の他の従業員の例を設定したいと考えています。</p>\n                    <p>あなたの未来のパフォーマンスをお祈りします。おめでとうございます。</p>\n                    <p>また、新しい地位について祝意を表する。</p>\n                    <p>質問がある場合は、自由に連絡してください。</p>\n                    <p>ありがとう</p>\n                    <p>よろしく</p>\n                    <p>HR 部門</p>\n                    <p>{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(137,9,'nl','Employee Promotion','<p>Betreft: -HR-afdeling/Bedrijf voor het versturen van de aanbevelingsbrief voor taakpromotie.</p>\n                    <p>Geachte { employee_promotion_name },</p>\n                    <p>Gefeliciteerd met uw promotie voor { promotion_designation } { promotion_title } effective { promotion_date }.</p>\n                    <p>Wij zullen de consistentie en de grote resultaten van u in uw nieuwe rol blijven verwachten. Wij hopen dat u een voorbeeld zult stellen voor de andere medewerkers van de organisatie.</p>\n                    <p>Wij wensen u geluk voor uw toekomstige prestaties, en gefeliciteerd!.</p>\n                    <p>Nogmaals, gefeliciteerd met de nieuwe positie.</p>\n                    <p>Voel je vrij om uit te reiken als je vragen hebt.</p>\n                    <p>Dank u wel</p>\n                    <p>Betreft:</p>\n                    <p>HR-afdeling,</p>\n                    <p>{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(138,9,'pl','Employee Promotion','<p>Temat: -Dział kadr/Firma w celu wysłania listu gratulacyjnego dla promocji zatrudnienia.</p>\n                    <p>Szanowny {employee_promotion_name },</p>\n                    <p>Gratulacje dla awansowania do {promotion_designation } {promotion_title } efektywnej {promotion_date }.</p>\n                    <p>W dalszym ciągu oczekujemy konsekwencji i wspaniałych wynik&oacute;w w Twojej nowej roli. Mamy nadzieję, że postawicie na przykład dla pozostałych pracownik&oacute;w organizacji.</p>\n                    <p>Życzymy powodzenia dla przyszłych wynik&oacute;w, gratulujemy!.</p>\n                    <p>Jeszcze raz gratulacje na nowej pozycji.</p>\n                    <p>Czuj się swobodnie, jeśli masz jakieś pytania.</p>\n                    <p>Dziękujemy</p>\n                    <p>W odniesieniu do</p>\n                    <p>Dział HR,</p>\n                    <p>{app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(139,9,'ru','Employee Promotion','<p>Тема: -HR отдел/Компания для отправки письма с поздравлением.</p>\n                    <p>Уважаемый { employee_promotion_name },</p>\n                    <p>Поздравляем вас с продвижением в { promotion_designation } { promotion_title } эффективная { promotion_date }.</p>\n                    <p>Мы будем и впредь ожидать от вас соответствия и больших результатов в вашей новой роли. Мы надеемся, что вы станете примером для других сотрудников организации.</p>\n                    <p>Желаем вам удачи и поздравлений!</p>\n                    <p>Еще раз поздравляю с новой позицией.</p>\n                    <p>Не стеснитесь, если у вас есть вопросы.</p>\n                    <p>Спасибо.</p>\n                    <p>С уважением,</p>\n                    <p>Отдел кадров,</p>\n                    <p>{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(140,9,'pt','Employee Promotion','<p style=\"font-size: 14.4px;\">Assunto:-Departamento de RH / Empresa para enviar carta de felicita&ccedil;&atilde;o de promo&ccedil;&atilde;o de emprego.</p>\n                    <p style=\"font-size: 14.4px;\">Querido {employee_promotion_name},</p>\n                    <p style=\"font-size: 14.4px;\">Parab&eacute;ns pela sua promo&ccedil;&atilde;o para {promotion_designation} {promotion_title} efetivo {promotion_date}.</p>\n                    <p style=\"font-size: 14.4px;\">Continuaremos a esperar consist&ecirc;ncia e grandes resultados a partir de voc&ecirc; em seu novo papel. Esperamos que voc&ecirc; defina um exemplo para os demais funcion&aacute;rios da organiza&ccedil;&atilde;o.</p>\n                    <p style=\"font-size: 14.4px;\">Desejamos sorte para o seu desempenho futuro, e parab&eacute;ns!.</p>\n                    <p style=\"font-size: 14.4px;\">Novamente, parab&eacute;ns pela nova posi&ccedil;&atilde;o.</p>\n                    <p style=\"font-size: 14.4px;\">Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</p>\n                    <p style=\"font-size: 14.4px;\">Obrigado</p>\n                    <p style=\"font-size: 14.4px;\">Considera,</p>\n                    <p style=\"font-size: 14.4px;\">Departamento de RH,</p>\n                    <p style=\"font-size: 14.4px;\">{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(141,9,'tr','Employee Promotion','<p><strong>Konu:-İş promosyonu tebrik mektubu gönderilecek İK departmanı/Şirket.</strong></p>\n                    <p><strong>Sayın {employee_promotion_name},</strong></p>\n                    <p>terfi ettiğiniz için tebrikler {promotion_designation} {promotion_title} etkili {promotion_date}.</p>\n                    <p>Sizden yeni görevinizde tutarlılık ve harika sonuçlar beklemeye devam edeceğiz. Kurumun diğer çalışanlarına da örnek olmanızı temenni ederiz.</p>\n                    <p>Gelecekteki performansınız için size bol şans diliyor, tebrikler!.</p>\n                    <p>Yeni pozisyon için tekrar tebrikler.</p>\n                    <p>&nbsp;</p>\n                    <p>Herhangi bir sorunuz varsa ulaşmaktan çekinmeyin.</p>\n                    <p>Teşekkür ederim</p>\n                    <p><strong>Saygılarımızla,</strong></p>\n                    <p><strong>İK Departmanı,</strong></p>\n                    <p><strong>{app_name}</strong></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(142,9,'zh','Employee Promotion','<p>&nbsp;</p>\n                    <p><strong>主题：-HR部门/公司发送职位晋升祝贺信.</strong></p>\n                    <p><strong>亲爱的{employee_promotion_name},</strong></p>\n                    <p>恭喜您晋升为 {promotion_designation} {promotion_title} 有效的 {promotion_date}.</p>\n                    <p>我们将继续期待您在新岗位上保持稳定并取得出色的成果。我们希望您能为组织的其他员工树立榜样.</p>\n                    <p>我们祝愿您未来的表现一切顺利，并表示祝贺！.</p>\n                    <p>再次祝贺您就任新职位.</p>\n                    <p>&nbsp;</p>\n                    <p>如果您有任何疑问，请随时与我们联系.</p>\n                    <p>谢谢</p>\n                    <p><strong>问候,</strong></p>\n                    <p><strong>人事部,</strong></p>\n                    <p><strong>{app_name}</strong></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(143,9,'he','Employee Promotion','<p>&nbsp;</p>\n                    <p><strong>נושא:-מחלקת משאבי אנוש/חברה לשלוח מכתב ברכה לקידום בעבודה.</strong></p>\n                    <p><strong>יָקָר {employee_promotion_name},</strong></p>\n                    <p>ברכות על הקידום שלך ל{promotion_designation} {promotion_title} יָעִיל {promotion_date}.</p>\n                    <p>נמשיך לצפות לעקביות ולתוצאות נהדרות ממך בתפקידך החדש. אנו מקווים שתהווה דוגמה לעובדי הארגון האחרים.</p>\n                    <p>אנו מאחלים לך בהצלחה בביצועים העתידיים שלך, ומזל טוב!.</p>\n                    <p>שוב, ברכות על התפקיד החדש.</p>\n                    <p>&nbsp;</p>\n                    <p>אל תהסס לפנות אם יש לך שאלות.</p>\n                    <p>תודה</p>\n                    <p><strong>בברכה,</strong></p>\n                    <p><strong>מחלקת משאבי אנוש,</strong></p>\n                    <p><strong>{app_name}</strong></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(144,9,'pt-br','Employee Promotion','<p style=\"font-size: 14.4px;\">Assunto:-Departamento de RH / Empresa para enviar carta de felicita&ccedil;&atilde;o de promo&ccedil;&atilde;o de emprego.</p>\n                    <p style=\"font-size: 14.4px;\">Querido {employee_promotion_name},</p>\n                    <p style=\"font-size: 14.4px;\">Parab&eacute;ns pela sua promo&ccedil;&atilde;o para {promotion_designation} {promotion_title} efetivo {promotion_date}.</p>\n                    <p style=\"font-size: 14.4px;\">Continuaremos a esperar consist&ecirc;ncia e grandes resultados a partir de voc&ecirc; em seu novo papel. Esperamos que voc&ecirc; defina um exemplo para os demais funcion&aacute;rios da organiza&ccedil;&atilde;o.</p>\n                    <p style=\"font-size: 14.4px;\">Desejamos sorte para o seu desempenho futuro, e parab&eacute;ns!.</p>\n                    <p style=\"font-size: 14.4px;\">Novamente, parab&eacute;ns pela nova posi&ccedil;&atilde;o.</p>\n                    <p style=\"font-size: 14.4px;\">Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</p>\n                    <p style=\"font-size: 14.4px;\">Obrigado</p>\n                    <p style=\"font-size: 14.4px;\">Considera,</p>\n                    <p style=\"font-size: 14.4px;\">Departamento de RH,</p>\n                    <p style=\"font-size: 14.4px;\">{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(145,10,'ar','Employee Complaints','<p>Subject :-قسم الموارد البشرية / الشركة لإرسال رسالة شكوى.</p>\n                    <p>عزيزي { employee_complaints_name },</p>\n                    <p>وأود أن أبلغ عن صراعا بينكم وبين الشخص الآخر. فقد وقعت عدة حوادث خلال الأيام القليلة الماضية ، وأشعر أن الوقت قد حان لتقديم شكوى رسمية ضده / لها.</p>\n                    <p>إشعر بالحرية للوصول إلى الخارج إذا عندك أي أسئلة.</p>\n                    <p>شكرا لك</p>\n                    <p>Regards,</p>\n                    <p>إدارة الموارد البشرية ،</p>\n                    <p>{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(146,10,'da','Employee Complaints','<p>Om: HR-departementet / Kompagniet for at sende klager.</p>\n                    <p>K&aelig;re { employee_complaints_name },</p>\n                    <p>Jeg vil gerne anmelde en konflikt mellem Dem og den anden person, og der er sket flere episoder i de seneste dage, og jeg mener, at det er p&aring; tide at anmelde en formel klage over for ham.</p>\n                    <p>Du er velkommen til at r&aelig;kke ud, hvis du har nogen sp&oslash;rgsm&aring;l.</p>\n                    <p>Tak.</p>\n                    <p>Med venlig hilsen</p>\n                    <p>HR-afdelingen,</p>\n                    <p>{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(147,10,'de','Employee Complaints','<p>Betrifft: -Personalabteilung/Unternehmen zum Senden von Beschwerden.</p>\n                    <p>Sehr geehrter {employee_complaints_name},</p>\n                    <p>Ich m&ouml;chte einen Konflikt zwischen Ihnen und der anderen Person melden. Es hat in den letzten Tagen mehrere Zwischenf&auml;lle gegeben, und ich glaube, es ist an der Zeit, eine formelle Beschwerde gegen ihn zu erstatten.</p>\n                    <p>F&uuml;hlen Sie sich frei, wenn Sie Fragen haben.</p>\n                    <p>Danke.</p>\n                    <p>Betrachtet,</p>\n                    <p>Personalabteilung,</p>\n                    <p>{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(148,10,'en','Employee Complaints','<p><strong>Subject:-HR department/Company to send complaints letter.</strong></p>\n                    <p><strong>Dear {employee_complaints_name},</strong></p>\n                    <p>I would like to report a conflict between you and the other person.There have been several incidents over the last few days, and I feel that it is time to report a formal complaint against him/her.</p>\n                    <p>&nbsp;</p>\n                    <p>Feel free to reach out if you have any questions.</p>\n                    <p>Thank you</p>\n                    <p><strong>Regards,</strong></p>\n                    <p><strong>HR Department,</strong></p>\n                    <p><strong>{app_name}</strong></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(149,10,'es','Employee Complaints','<p>Asunto: -Departamento de RRHH/Empresa para enviar carta de quejas.</p>\n                    <p>Estimado {employee_complaints_name},</p>\n                    <p>Me gustar&iacute;a informar de un conflicto entre usted y la otra persona. Ha habido varios incidentes en los &uacute;ltimos d&iacute;as, y creo que es hora de denunciar una queja formal contra &eacute;l.</p>\n                    <p>Si&eacute;ntase libre de llegar si usted tiene alguna pregunta.</p>\n                    <p>&iexcl;Gracias!</p>\n                    <p>Considerando,</p>\n                    <p>Departamento de Recursos Humanos,</p>\n                    <p>{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(150,10,'fr','Employee Complaints','<p>Objet: -Service des ressources humaines / Compagnie pour envoyer une lettre de plainte.</p>\n                    <p>Cher { employee_complaints_name },</p>\n                    <p>Je voudrais signaler un conflit entre vous et lautre personne. Il y a eu plusieurs incidents au cours des derniers jours, et je pense quil est temps de signaler une plainte officielle contre lui.</p>\n                    <p>Nh&eacute;sitez pas &agrave; nous contacter si vous avez des questions.</p>\n                    <p>Je vous remercie</p>\n                    <p>Regards,</p>\n                    <p>D&eacute;partement des RH,</p>\n                    <p>{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(151,10,'it','Employee Complaints','<p>Oggetto: - Dipartimento HR / Societ&agrave; per inviare lettera di reclamo.</p>\n                    <p>Caro {employee_complaints_name},</p>\n                    <p>Vorrei segnalare un conflitto tra lei e laltra persona Ci sono stati diversi incidenti negli ultimi giorni, e sento che &egrave; il momento di denunciare una denuncia formale contro di lui.</p>\n                    <p>Sentiti libero di raggiungere se hai domande.</p>\n                    <p>Grazie</p>\n                    <p>Riguardo,</p>\n                    <p>Dipartimento HR,</p>\n                    <p>{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(152,10,'ja','Employee Complaints','<p>件名:-HR 部門/会社は、クレーム・レターを送信します。</p>\n                    <p>{ employee_complaints_name} の Dear&nbsp;</p>\n                    <p>あなたと他の人との間の葛藤を報告したいと思いますこの数日間でいくつかの事件が発生しています彼女に対する正式な申し立てをする時だと感じています</p>\n                    <p>質問がある場合は、自由に連絡してください。</p>\n                    <p>ありがとう</p>\n                    <p>よろしく</p>\n                    <p>HR 部門</p>\n                    <p>{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(153,10,'nl','Employee Complaints','<p>Betreft: -HR-afdeling/Bedrijf voor het verzenden van klachtenbrief.</p>\n                    <p>Geachte { employee_complaints_name},</p>\n                    <p>Ik zou een conflict willen melden tussen u en de andere persoon. Er zijn de afgelopen dagen verschillende incidenten geweest en ik denk dat het tijd is om een formele klacht tegen hem/haar in te dienen.</p>\n                    <p>Voel je vrij om uit te reiken als je vragen hebt.</p>\n                    <p>Dank u wel</p>\n                    <p>Betreft:</p>\n                    <p>HR-afdeling,</p>\n                    <p>{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(154,10,'pl','Employee Complaints','<p>Temat:-Dział HR/Firma do wysyłania listu reklamowego.</p>\n                    <p>Szanowna {employee_complaints_name },</p>\n                    <p>Chciałbym zgłosić konflikt między tobą a drugą osobą. W ciągu ostatnich kilku dni było kilka incydent&oacute;w i czuję, że nadszedł czas, aby zgłosić oficjalną skargę przeciwko niej.</p>\n                    <p>Czuj się swobodnie, jeśli masz jakieś pytania.</p>\n                    <p>Dziękujemy</p>\n                    <p>W odniesieniu do</p>\n                    <p>Dział HR,</p>\n                    <p>{app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(155,10,'ru','Employee Complaints','<p>Тема: -HR отдел/Компания отправить письмо с жалобами.</p>\n                    <p>Уважаемый { employee_complaints_name }</p>\n                    <p>Я хотел бы сообщить о конфликте между вами и другим человеком. За последние несколько дней произошло несколько инцидентов, и я считаю, что пришло время сообщить о своей официальной жалобе.</p>\n                    <p>Не стеснитесь, если у вас есть вопросы.</p>\n                    <p>Спасибо.</p>\n                    <p>С уважением,</p>\n                    <p>Отдел кадров,</p>\n                    <p>{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(156,10,'pt','Employee Complaints','<p>Assunto:-Departamento de RH / Empresa para enviar carta de reclama&ccedil;&otilde;es.</p>\n                    <p>Querido {employee_complaints_name},</p>\n                    <p>Eu gostaria de relatar um conflito entre voc&ecirc; e a outra pessoa. Houve v&aacute;rios incidentes ao longo dos &uacute;ltimos dias, e eu sinto que &eacute; hora de relatar uma den&uacute;ncia formal contra him/her.</p>\n                    <p>Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</p>\n                    <p>Obrigado</p>\n                    <p>Considera,</p>\n                    <p>Departamento de RH,</p>\n                    <p>{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(157,10,'tr','Employee Complaints','<p><strong>Konu:-Şikayet mektubu gönderilecek İK departmanı/Şirket.</strong></p>\n                    <p><strong>Sayın {employee_complaints_name},</strong></p>\n                    <p>Diğer kişiyle aranızdaki bir anlaşmazlığı bildirmek istiyorum. Son birkaç gün içinde birkaç olay oldu ve bu kişi hakkında resmi bir şikayette bulunmanın zamanının geldiğini düşünüyorum.</p>\n                    <p>&nbsp;</p>\n                    <p>Herhangi bir sorunuz varsa ulaşmaktan çekinmeyin.</p>\n                    <p>Teşekkür ederim</p>\n                    <p><strong>Saygılarımızla,</strong></p>\n                    <p><strong>İK Departmanı,</strong></p>\n                    <p><strong>{app_name}</strong></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(158,10,'zh','Employee Complaints','<p><strong>主题：-HR部门/公司发送投诉信.</strong></p>\n                    <p><strong>亲爱的 {employee_complaints_name},</strong></p>\n                    <p>我想举报您和对方之间的冲突。过去几天发生了几起事件，我觉得是时候对他/她提出正式投诉了.</p>\n                    <p>&nbsp;</p>\n                    <p>如果您有任何疑问，请随时与我们联系.</p>\n                    <p>谢谢</p>\n                    <p><strong>问候,</strong></p>\n                    <p><strong>人事部,</strong></p>\n                    <p><strong>{app_name}</strong></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(159,10,'he','Employee Complaints','<p><strong>נושא:-מחלקת משאבי אנוש/חברה לשלוח מכתב תלונות.</strong></p>\n                    <p><strong>יָקָר {employee_complaints_name},</strong></p>\n                    <p>ברצוני לדווח על סכסוך בינך לבין האדם השני. היו מספר תקריות במהלך הימים האחרונים, ואני מרגיש שהגיע הזמן לדווח על תלונה רשמית נגדו/ה.</p>\n                    <p>&nbsp;</p>\n                    <p>אל תהסס לפנות אם יש לך שאלות.</p>\n                    <p>תודה</p>\n                    <p><strong>בברכה,</strong></p>\n                    <p><strong>מחלקת משאבי אנוש,</strong></p>\n                    <p><strong>{app_name}</strong></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(160,10,'pt-br','Employee Complaints','<p>Assunto:-Departamento de RH / Empresa para enviar carta de reclama&ccedil;&otilde;es.</p>\n                    <p>Querido {employee_complaints_name},</p>\n                    <p>Eu gostaria de relatar um conflito entre voc&ecirc; e a outra pessoa. Houve v&aacute;rios incidentes ao longo dos &uacute;ltimos dias, e eu sinto que &eacute; hora de relatar uma den&uacute;ncia formal contra him/her.</p>\n                    <p>Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</p>\n                    <p>Obrigado</p>\n                    <p>Considera,</p>\n                    <p>Departamento de RH,</p>\n                    <p>{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(161,11,'ar','Employee Warning','<p style=\"text-align: left;\"><span style=\"font-size: 12pt;\"><span style=\"color: #222222;\"><span style=\"white-space: pre-wrap;\">Subject : -HR ادارة / شركة لارسال رسالة تحذير. عزيزي { employe_warning_name }, { warning_subject } { warning_description } إشعر بالحرية للوصول إلى الخارج إذا عندك أي أسئلة. شكرا لك Regards, إدارة الموارد البشرية ، { app_name }</span></span></span></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(162,11,'da','Employee Warning','<p>Om: HR-afdelingen / kompagniet for at sende advarselsbrev.</p>\n                    <p>K&aelig;re { employee_warning_name },</p>\n                    <p>{ warning_subject }</p>\n                    <p>{ warning_description }</p>\n                    <p>Du er velkommen til at r&aelig;kke ud, hvis du har nogen sp&oslash;rgsm&aring;l.</p>\n                    <p>Tak.</p>\n                    <p>Med venlig hilsen</p>\n                    <p>HR-afdelingen,</p>\n                    <p>{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(163,11,'de','Employee Warning','<p>Betreff: -Personalabteilung/Unternehmen zum Senden von Warnschreiben.</p>\n                    <p>Sehr geehrter {employee_warning_name},</p>\n                    <p>{warning_subject}</p>\n                    <p>{warning_description}</p>\n                    <p>F&uuml;hlen Sie sich frei, wenn Sie Fragen haben.</p>\n                    <p>Danke.</p>\n                    <p>Betrachtet,</p>\n                    <p>Personalabteilung,</p>\n                    <p>{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(164,11,'en','Employee Warning','<p><strong>Subject:-HR department/Company to send warning letter.</strong></p>\n                    <p><strong>Dear {employee_warning_name},</strong></p>\n                    <p>{warning_subject}</p>\n                    <p>{warning_description}</p>\n                    <p>Feel free to reach out if you have any questions.</p>\n                    <p>Thank you</p>\n                    <p><strong>Regards,</strong></p>\n                    <p><strong>HR Department,</strong></p>\n                    <p><strong>{app_name}</strong></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(165,11,'es','Employee Warning','<p>Asunto: -Departamento de RR.HH./Empresa para enviar carta de advertencia.</p>\n                    <p>Estimado {employee_warning_name},</p>\n                    <p>{warning_subject}</p>\n                    <p>{warning_description}</p>\n                    <p>Si&eacute;ntase libre de llegar si usted tiene alguna pregunta.</p>\n                    <p>&iexcl;Gracias!</p>\n                    <p>Considerando,</p>\n                    <p>Departamento de Recursos Humanos,</p>\n                    <p>{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(166,11,'fr','Employee Warning','<p>Objet: -HR department / Company to send warning letter.</p>\n                    <p>Cher { employee_warning_name },</p>\n                    <p>{ warning_subject }</p>\n                    <p>{ warning_description }</p>\n                    <p>Nh&eacute;sitez pas &agrave; nous contacter si vous avez des questions.</p>\n                    <p>Je vous remercie</p>\n                    <p>Regards,</p>\n                    <p>D&eacute;partement des RH,</p>\n                    <p>{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(167,11,'it','Employee Warning','<p>Oggetto: - Dipartimento HR / Societ&agrave; per inviare lettera di avvertimento.</p>\n                    <p>Caro {employee_warning_name},</p>\n                    <p>{warning_subject}</p>\n                    <p>{warning_description}</p>\n                    <p>Sentiti libero di raggiungere se hai domande.</p>\n                    <p>Grazie</p>\n                    <p>Riguardo,</p>\n                    <p>Dipartimento HR,</p>\n                    <p>{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(168,11,'ja','Employee Warning','<p><span style=\"font-size: 12pt;\"><span style=\"color: #222222;\"><span style=\"white-space: pre-wrap;\">件名:-HR 部門/企業は警告レターを送信します。 { employee_warning_name} を出庫します。 {warning_subject} {warning_description} 質問がある場合は、自由に連絡してください。 ありがとう よろしく HR 部門 {app_name}</span></span></span></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(169,11,'nl','Employee Warning','<p>Betreft: -HR-afdeling/bedrijf om een waarschuwingsbrief te sturen.</p>\n                    <p>Geachte { employee_warning_name },</p>\n                    <p>{ warning_subject }</p>\n                    <p>{ warning_description }</p>\n                    <p>Voel je vrij om uit te reiken als je vragen hebt.</p>\n                    <p>Dank u wel</p>\n                    <p>Betreft:</p>\n                    <p>HR-afdeling,</p>\n                    <p>{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(170,11,'pl','Employee Warning','<p>Temat: -Dział HR/Firma do wysyłania listu ostrzegawczego.</p>\n                    <p>Szanowny {employee_warning_name },</p>\n                    <p>{warning_subject }</p>\n                    <p>{warning_description }</p>\n                    <p>Czuj się swobodnie, jeśli masz jakieś pytania.</p>\n                    <p>Dziękujemy</p>\n                    <p>W odniesieniu do</p>\n                    <p>Dział HR,</p>\n                    <p>{app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(171,11,'ru','Employee Warning','<p>Тема: -HR отдел/Компания для отправки предупреждающего письма.</p>\n                    <p>Уважаемый { employee_warning_name },</p>\n                    <p>{ warning_subject }</p>\n                    <p>{ warning_description }</p>\n                    <p>Не стеснитесь, если у вас есть вопросы.</p>\n                    <p>Спасибо.</p>\n                    <p>С уважением,</p>\n                    <p>Отдел кадров,</p>\n                    <p>{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(172,11,'pt','Employee Warning','<p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Assunto:-Departamento de RH / Empresa para enviar carta de advert&ecirc;ncia.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Querido {employee_warning_name},</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">{warning_subject}</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">{warning_description}</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Obrigado</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Considera,</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Departamento de RH,</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">{app_name}</span></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(173,11,'tr','Employee Warning','<p><strong>Konu:-İK departmanı/Şirket uyarı mektubu gönderecek.</strong></p>\n                    <p><strong>Sayın {employee_warning_name},</strong></p>\n                    <p>{warning_subject}</p>\n                    <p>{warning_description}</p>\n                    <p>Herhangi bir sorunuz varsa ulaşmaktan çekinmeyin.</p>\n                    <p>Teşekkür ederim</p>\n                    <p><strong>Saygılarımızla,</strong></p>\n                    <p><strong>İK Departmanı,</strong></p>\n                    <p><strong>{app_name}</strong></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(174,11,'zh','Employee Warning','<p><strong>主题：-人力资源部门/公司发送警告信.</strong></p>\n                    <p><strong>亲爱的{employee_warning_name},</strong></p>\n                    <p>{warning_subject}</p>\n                    <p>{warning_description}</p>\n                    <p>如果您有任何疑问，请随时与我们联系.</p>\n                    <p>谢谢</p>\n                    <p><strong>问候,</strong></p>\n                    <p><strong>人事部,</strong></p>\n                    <p><strong>{app_name}</strong></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(175,11,'he','Employee Warning','<p><strong>נושא:-מחלקת משאבי אנוש/חברה לשלוח מכתב אזהרה.</strong></p>\n                    <p><strong>יָקָר {employee_warning_name},</strong></p>\n                    <p>{warning_subject}</p>\n                    <p>{warning_description}</p>\n                    <p>אל תהסס לפנות אם יש לך שאלות.</p>\n                    <p>תודה</p>\n                    <p><strong>בברכה,</strong></p>\n                    <p><strong>מחלקת משאבי אנוש,</strong></p>\n                    <p><strong>{app_name}</strong></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(176,11,'pt-br','Employee Warning','<p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Assunto:-Departamento de RH / Empresa para enviar carta de advert&ecirc;ncia.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Querido {employee_warning_name},</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">{warning_subject}</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">{warning_description}</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Obrigado</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Considera,</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Departamento de RH,</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">{app_name}</span></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(177,12,'ar','Employee Termination','<p style=\"text-align: left;\"><span style=\"font-size: 12pt;\"><span style=\"color: #222222;\"><span style=\"white-space: pre-wrap;\"><span style=\"font-size: 12pt; white-space: pre-wrap;\">Subject :-ادارة / شركة HR لارسال رسالة انهاء. عزيزي { </span><span style=\"white-space: pre-wrap;\">employee_termination_name</span><span style=\"font-size: 12pt; white-space: pre-wrap;\"> } ، هذه الرسالة مكتوبة لإعلامك بأن عملك مع شركتنا قد تم إنهاؤه مزيد من التفاصيل عن الانهاء : تاريخ الاشعار : { </span><span style=\"white-space: pre-wrap;\">notice_date</span><span style=\"font-size: 12pt; white-space: pre-wrap;\"> } تاريخ الانهاء : { </span><span style=\"white-space: pre-wrap;\">termination_date</span><span style=\"font-size: 12pt; white-space: pre-wrap;\"> } نوع الانهاء : { termination_type } إشعر بالحرية للوصول إلى الخارج إذا عندك أي أسئلة. شكرا لك Regards, إدارة الموارد البشرية ، { app_name }</span></span></span></span></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(178,12,'da','Employee Termination','<p>Emne:-HR-afdelingen / Virksomheden om at sende afslutningstskrivelse.</p>\n                    <p>K&aelig;re { employee_termination_name },</p>\n                    <p>Dette brev er skrevet for at meddele dig, at dit arbejde med vores virksomhed er afsluttet.</p>\n                    <p>Flere oplysninger om oph&aelig;velse:</p>\n                    <p>Adviseringsdato: { notifice_date }</p>\n                    <p>Opsigelsesdato: { termination_date }</p>\n                    <p>Opsigelsestype: { termination_type }</p>\n                    <p>Du er velkommen til at r&aelig;kke ud, hvis du har nogen sp&oslash;rgsm&aring;l.</p>\n                    <p>Tak.</p>\n                    <p>Med venlig hilsen</p>\n                    <p>HR-afdelingen,</p>\n                    <p>{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(179,12,'de','Employee Termination','<p>Betreff: -Personalabteilung/Firma zum Versenden von K&uuml;ndigungsschreiben.</p>\n                    <p>Sehr geehrter {employee_termination_name},</p>\n                    <p>Dieser Brief wird Ihnen schriftlich mitgeteilt, dass Ihre Besch&auml;ftigung mit unserem Unternehmen beendet ist.</p>\n                    <p>Weitere Details zur K&uuml;ndigung:</p>\n                    <p>K&uuml;ndigungsdatum: {notice_date}</p>\n                    <p>Beendigungsdatum: {termination_date}</p>\n                    <p>Abbruchstyp: {termination_type}</p>\n                    <p>F&uuml;hlen Sie sich frei, wenn Sie Fragen haben.</p>\n                    <p>Danke.</p>\n                    <p>Betrachtet,</p>\n                    <p>Personalabteilung,</p>\n                    <p>{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(180,12,'en','Employee Termination','<p><strong>Subject:-HR department/Company to send termination letter.</strong></p>\n                    <p><strong>Dear {employee_termination_name},</strong></p>\n                    <p>This letter is written to notify you that your employment with our company is terminated.</p>\n                    <p>More detail about termination:</p>\n                    <p>Notice Date :{notice_date}</p>\n                    <p>Termination Date:{termination_date}</p>\n                    <p>Termination Type:{termination_type}</p>\n                    <p>&nbsp;</p>\n                    <p>Feel free to reach out if you have any questions.</p>\n                    <p>Thank you</p>\n                    <p><strong>Regards,</strong></p>\n                    <p><strong>HR Department,</strong></p>\n                    <p><strong>{app_name}</strong></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(181,12,'es','Employee Termination','<p>Asunto: -Departamento de RRHH/Empresa para enviar carta de rescisi&oacute;n.</p>\n                    <p>Estimado {employee_termination_name},</p>\n                    <p>Esta carta est&aacute; escrita para notificarle que su empleo con nuestra empresa ha terminado.</p>\n                    <p>M&aacute;s detalles sobre la terminaci&oacute;n:</p>\n                    <p>Fecha de aviso: {notice_date}</p>\n                    <p>Fecha de terminaci&oacute;n: {termination_date}</p>\n                    <p>Tipo de terminaci&oacute;n: {termination_type}</p>\n                    <p>Si&eacute;ntase libre de llegar si usted tiene alguna pregunta.</p>\n                    <p>&iexcl;Gracias!</p>\n                    <p>Considerando,</p>\n                    <p>Departamento de Recursos Humanos,</p>\n                    <p>{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(182,12,'fr','Employee Termination','<p>Objet: -HR department / Company to send termination letter.</p>\n                    <p>Cher { employee_termination_name },</p>\n                    <p>Cette lettre est r&eacute;dig&eacute;e pour vous aviser que votre emploi aupr&egrave;s de notre entreprise prend fin.</p>\n                    <p>Plus de d&eacute;tails sur larr&ecirc;t:</p>\n                    <p>Date de lavis: { notice_date }</p>\n                    <p>Date de fin: { termination_date}</p>\n                    <p>Type de terminaison: { termination_type }</p>\n                    <p>Nh&eacute;sitez pas &agrave; nous contacter si vous avez des questions.</p>\n                    <p>Je vous remercie</p>\n                    <p>Regards,</p>\n                    <p>D&eacute;partement des RH,</p>\n                    <p>{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(183,12,'it','Employee Termination','<p>Oggetto: - Dipartimento HR / Societ&agrave; per inviare lettera di terminazione.</p>\n                    <p>Caro {employee_termination_name},</p>\n                    <p>Questa lettera &egrave; scritta per comunicarti che la tua occupazione con la nostra azienda &egrave; terminata.</p>\n                    <p>Pi&ugrave; dettagli sulla cessazione:</p>\n                    <p>Data avviso: {notice_data}</p>\n                    <p>Data di chiusura: {termination_date}</p>\n                    <p>Tipo di terminazione: {termination_type}</p>\n                    <p>Sentiti libero di raggiungere se hai domande.</p>\n                    <p>Grazie</p>\n                    <p>Riguardo,</p>\n                    <p>Dipartimento HR,</p>\n                    <p>{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(184,12,'ja','Employee Termination','<p>件名:-HR 部門/企業は終了文字を送信します。</p>\n                    <p>{ employee_termination_name} を終了します。</p>\n                    <p>この手紙は、当社の雇用が終了していることをあなたに通知するために書かれています。</p>\n                    <p>終了についての詳細 :</p>\n                    <p>通知日 :{notice_date}</p>\n                    <p>終了日:{termination_date}</p>\n                    <p>終了タイプ:{termination_type}</p>\n                    <p>質問がある場合は、自由に連絡してください。</p>\n                    <p>ありがとう</p>\n                    <p>よろしく</p>\n                    <p>HR 部門</p>\n                    <p>{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(185,12,'nl','Employee Termination','<p>Betreft: -HR-afdeling/Bedrijf voor verzending van afgiftebrief.</p>\n                    <p>Geachte { employee_termination_name },</p>\n                    <p>Deze brief is geschreven om u te melden dat uw werk met ons bedrijf wordt be&euml;indigd.</p>\n                    <p>Meer details over be&euml;indiging:</p>\n                    <p>Datum kennisgeving: { notice_date }</p>\n                    <p>Be&euml;indigingsdatum: { termination_date }</p>\n                    <p>Be&euml;indigingstype: { termination_type }</p>\n                    <p>Voel je vrij om uit te reiken als je vragen hebt.</p>\n                    <p>Dank u wel</p>\n                    <p>Betreft:</p>\n                    <p>HR-afdeling,</p>\n                    <p>{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(186,12,'pl','Employee Termination','<p>Temat: -Dział kadr/Firma do wysyłania listu zakańczego.</p>\n                    <p>Droga {employee_termination_name },</p>\n                    <p>Ten list jest napisany, aby poinformować Cię, że Twoje zatrudnienie z naszą firmą zostaje zakończone.</p>\n                    <p>Więcej szczeg&oacute;ł&oacute;w na temat zakończenia pracy:</p>\n                    <p>Data ogłoszenia: {notice_date }</p>\n                    <p>Data zakończenia: {termination_date }</p>\n                    <p>Typ zakończenia: {termination_type }</p>\n                    <p>Czuj się swobodnie, jeśli masz jakieś pytania.</p>\n                    <p>Dziękujemy</p>\n                    <p>W odniesieniu do</p>\n                    <p>Dział HR,</p>\n                    <p>{app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(187,12,'ru','Employee Termination','<p>Тема: -HR отдел/Компания отправить письмо о прекращении.</p>\n                    <p>Уважаемый { employee_termination_name },</p>\n                    <p>Это письмо написано, чтобы уведомить вас о том, что ваше трудоустройство с нашей компанией прекратилось.</p>\n                    <p>Более подробная информация о завершении:</p>\n                    <p>Дата уведомления: { notice_date }</p>\n                    <p>Дата завершения: { termination_date }</p>\n                    <p>Тип завершения: { termination_type }</p>\n                    <p>Не стеснитесь, если у вас есть вопросы.</p>\n                    <p>Спасибо.</p>\n                    <p>С уважением,</p>\n                    <p>Отдел кадров,</p>\n                    <p>{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(188,12,'pt','Employee Termination','<p style=\"font-size: 14.4px;\">Assunto:-Departamento de RH / Empresa para enviar carta de rescis&atilde;o.</p>\n                    <p style=\"font-size: 14.4px;\">Querido {employee_termination_name},</p>\n                    <p style=\"font-size: 14.4px;\">Esta carta &eacute; escrita para notific&aacute;-lo de que seu emprego com a nossa empresa est&aacute; finalizado.</p>\n                    <p style=\"font-size: 14.4px;\">Mais detalhes sobre a finaliza&ccedil;&atilde;o:</p>\n                    <p style=\"font-size: 14.4px;\">Data de Aviso: {notice_date}</p>\n                    <p style=\"font-size: 14.4px;\">Data de Finaliza&ccedil;&atilde;o: {termination_date}</p>\n                    <p style=\"font-size: 14.4px;\">Tipo de Rescis&atilde;o: {termination_type}</p>\n                    <p style=\"font-size: 14.4px;\">Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</p>\n                    <p style=\"font-size: 14.4px;\">Obrigado</p>\n                    <p style=\"font-size: 14.4px;\">Considera,</p>\n                    <p style=\"font-size: 14.4px;\">Departamento de RH,</p>\n                    <p style=\"font-size: 14.4px;\">{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(189,12,'tr','Employee Termination','<p><strong>Konu:-İK departmanı/Şirket fesih mektubu gönderecek.</strong></p>\n                    <p><strong>Sayın {employee_termination_name},</strong></p>\n                    <p>Bu mektup, şirketimizle olan işinize son verildiğini size bildirmek için yazılmıştır.</p>\n                    <p>Sonlandırma hakkında daha fazla ayrıntı:</p>\n                    <p>Bildirim Tarihi :{notice_date}</p>\n                    <p>Bitiş tarihi:{termination_date}</p>\n                    <p>Sonlandırma Türü:{termination_type}</p>\n                    <p>&nbsp;</p>\n                    <p>Herhangi bir sorunuz varsa ulaşmaktan çekinmeyin.</p>\n                    <p>Teşekkür ederim</p>\n                    <p><strong>Saygılarımızla,</strong></p>\n                    <p><strong>İK Departmanı,</strong></p>\n                    <p><strong>{app_name}</strong></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(190,12,'zh','Employee Termination','<p><strong>主题：-人力资源部门/公司发送终止函.</strong></p>\n                    <p><strong>亲爱的 {employee_termination_name},</strong></p>\n                    <p>这封信旨在通知您，您与我们公司的雇佣关系已终止.</p>\n                    <p>有关终止的更多详细信息:</p>\n                    <p>通知日期 :{notice_date}</p>\n                    <p>终止日期:{termination_date}</p>\n                    <p>端接类型:{termination_type}</p>\n                    <p>&nbsp;</p>\n                    <p>如果您有任何疑问，请随时与我们联系.</p>\n                    <p>谢谢</p>\n                    <p><strong>问候,</strong></p>\n                    <p><strong>人事部,</strong></p>\n                    <p><strong>{app_name}</strong></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(191,12,'he','Employee Termination','<p><strong>נושא:-מחלקת משאבי אנוש/חברה לשלוח מכתב סיום.</strong></p>\n                    <p><strong>יָקָר {employee_termination_name},</strong></p>\n                    <p>מכתב זה נכתב כדי להודיע ​​לך על סיום העסקתך בחברה שלנו.</p>\n                    <p>פרטים נוספים על סיום:</p>\n                    <p>תאריך הודעה :{notice_date}</p>\n                    <p>תאריך סיום:{termination_date}</p>\n                    <p>סוג סיום:{termination_type}</p>\n                    <p>&nbsp;</p>\n                    <p>אל תהסס לפנות אם יש לך שאלות.</p>\n                    <p>תודה</p>\n                    <p><strong>בברכה,</strong></p>\n                    <p><strong>מחלקת משאבי אנוש,</strong></p>\n                    <p><strong>{app_name}</strong></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(192,12,'pt-br','Employee Termination','<p style=\"font-size: 14.4px;\">Assunto:-Departamento de RH / Empresa para enviar carta de rescis&atilde;o.</p>\n                    <p style=\"font-size: 14.4px;\">Querido {employee_termination_name},</p>\n                    <p style=\"font-size: 14.4px;\">Esta carta &eacute; escrita para notific&aacute;-lo de que seu emprego com a nossa empresa est&aacute; finalizado.</p>\n                    <p style=\"font-size: 14.4px;\">Mais detalhes sobre a finaliza&ccedil;&atilde;o:</p>\n                    <p style=\"font-size: 14.4px;\">Data de Aviso: {notice_date}</p>\n                    <p style=\"font-size: 14.4px;\">Data de Finaliza&ccedil;&atilde;o: {termination_date}</p>\n                    <p style=\"font-size: 14.4px;\">Tipo de Rescis&atilde;o: {termination_type}</p>\n                    <p style=\"font-size: 14.4px;\">Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</p>\n                    <p style=\"font-size: 14.4px;\">Obrigado</p>\n                    <p style=\"font-size: 14.4px;\">Considera,</p>\n                    <p style=\"font-size: 14.4px;\">Departamento de RH,</p>\n                    <p style=\"font-size: 14.4px;\">{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(193,13,'ar','Leave Status','<p style=\"text-align: left;\">Subject : -HR ادارة / شركة لارسال رسالة الموافقة الى { leave_status } اجازة أو ترك.</p>\n                    <p style=\"text-align: left;\">عزيزي { leave_status_name } ،</p>\n                    <p style=\"text-align: left;\">لدي { leave_status } طلب الخروج الخاص بك الى { leave_reason } من { leave_start_date } الى { leave_end_date }.</p>\n                    <p style=\"text-align: left;\">{ total_leave_days } أيام لدي { leave_status } طلب الخروج الخاص بك ل ـ { leave_reason }.</p>\n                    <p style=\"text-align: left;\">ونحن نطلب منكم أن تكملوا كل أعمالكم المعلقة أو أي قضية مهمة أخرى حتى لا تواجه الشركة أي خسارة أو مشكلة أثناء غيابكم. نحن نقدر لك مصداقيتك لإبلاغنا بوقت كاف مقدما</p>\n                    <p style=\"text-align: left;\">إشعر بالحرية للوصول إلى الخارج إذا عندك أي أسئلة.</p>\n                    <p style=\"text-align: left;\">شكرا لك</p>\n                    <p style=\"text-align: left;\">Regards,</p>\n                    <p style=\"text-align: left;\">إدارة الموارد البشرية ،</p>\n                    <p style=\"text-align: left;\">{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(194,13,'da','Leave Status','<p>Emne:-HR-afdelingen / Kompagniet for at sende godkendelsesbrev til { leave_status } en ferie eller orlov.</p>\n                    <p>K&aelig;re { leave_status_name },</p>\n                    <p>Jeg har { leave_status } din orlov-anmodning for { leave_reason } fra { leave_start_date } til { leave_end_date }.</p>\n                    <p>{ total_leave_days } dage Jeg har { leave_status } din anmodning om { leave_reason } for { leave_reason }.</p>\n                    <p>Vi beder dig om at f&aelig;rdigg&oslash;re alt dit udest&aring;ende arbejde eller andet vigtigt sp&oslash;rgsm&aring;l, s&aring; virksomheden ikke st&aring;r over for nogen tab eller problemer under dit frav&aelig;r. Vi s&aelig;tter pris p&aring; din bet&aelig;nksomhed at informere os godt p&aring; forh&aring;nd</p>\n                    <p>Du er velkommen til at r&aelig;kke ud, hvis du har nogen sp&oslash;rgsm&aring;l.</p>\n                    <p>Tak.</p>\n                    <p>Med venlig hilsen</p>\n                    <p>HR-afdelingen,</p>\n                    <p>{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(195,13,'de','Leave Status','<p>Betreff: -Personalabteilung/Firma, um den Genehmigungsschreiben an {leave_status} einen Urlaub oder Urlaub zu schicken.</p>\n                    <p>Sehr geehrter {leave_status_name},</p>\n                    <p>Ich habe {leave_status} Ihre Urlaubsanforderung f&uuml;r {leave_reason} von {leave_start_date} bis {leave_end_date}.</p>\n                    <p>{total_leave_days} Tage Ich habe {leave_status} Ihre Urlaubs-Anfrage f&uuml;r {leave_reason}.</p>\n                    <p>Wir bitten Sie, Ihre gesamte anstehende Arbeit oder ein anderes wichtiges Thema abzuschlie&szlig;en, so dass das Unternehmen w&auml;hrend Ihrer Abwesenheit keinen Verlust oder kein Problem zu Gesicht bekommen hat. Wir sch&auml;tzen Ihre Nachdenklichkeit, um uns im Vorfeld gut zu informieren</p>\n                    <p>F&uuml;hlen Sie sich frei, wenn Sie Fragen haben.</p>\n                    <p>Danke.</p>\n                    <p>Betrachtet,</p>\n                    <p>Personalabteilung,</p>\n                    <p>{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(196,13,'en','Leave Status','<p><strong>Subject:-HR department/Company to send approval letter to {leave_status} a vacation or leave.</strong></p>\n                    <p><strong>Dear {leave_status_name},</strong></p>\n                    <p>I have {leave_status} your leave request for {leave_reason} from {leave_start_date} to {leave_end_date}.</p>\n                    <p>{total_leave_days} days I have {leave_status}&nbsp; your leave request for {leave_reason}.</p>\n                    <p>We request you to complete all your pending work or any other important issue so that the company does not face any loss or problem during your absence. We appreciate your thoughtfulness to inform us well in advance</p>\n                    <p>&nbsp;</p>\n                    <p>Feel free to reach out if you have any questions.</p>\n                    <p>Thank you</p>\n                    <p><strong>Regards,</strong></p>\n                    <p><strong>HR Department,</strong></p>\n                    <p><strong>{app_name}</strong></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(197,13,'es','Leave Status','<p>Asunto: -Departamento de RR.HH./Empresa para enviar la carta de aprobaci&oacute;n a {leave_status} unas vacaciones o permisos.</p>\n                    <p>Estimado {leave_status_name},</p>\n                    <p>Tengo {leave_status} la solicitud de licencia para {leave_reason} de {leave_start_date} a {leave_end_date}.</p>\n                    <p>{total_leave_days} d&iacute;as tengo {leave_status} la solicitud de licencia para {leave_reason}.</p>\n                    <p>Le solicitamos que complete todos sus trabajos pendientes o cualquier otro asunto importante para que la empresa no se enfrente a ninguna p&eacute;rdida o problema durante su ausencia. Agradecemos su atenci&oacute;n para informarnos con mucha antelaci&oacute;n</p>\n                    <p>Si&eacute;ntase libre de llegar si usted tiene alguna pregunta.</p>\n                    <p>&iexcl;Gracias!</p>\n                    <p>Considerando,</p>\n                    <p>Departamento de Recursos Humanos,</p>\n                    <p>{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(198,13,'fr','Leave Status','<p>Objet: -HR department / Company to send approval letter to { leave_status } a vacances or leave.</p>\n                    <p>Cher { leave_status_name },</p>\n                    <p>Jai { leave_statut } votre demande de cong&eacute; pour { leave_reason } de { leave_start_date } &agrave; { leave_date_fin }.</p>\n                    <p>{ total_leave_days } jours I have { leave_status } your leave request for { leave_reason }.</p>\n                    <p>Nous vous demandons de remplir tous vos travaux en cours ou toute autre question importante afin que lentreprise ne soit pas confront&eacute;e &agrave; une perte ou &agrave; un probl&egrave;me pendant votre absence. Nous appr&eacute;cions votre attention pour nous informer longtemps &agrave; lavance</p>\n                    <p>Nh&eacute;sitez pas &agrave; nous contacter si vous avez des questions.</p>\n                    <p>Je vous remercie</p>\n                    <p>Regards,</p>\n                    <p>D&eacute;partement des RH,</p>\n                    <p>{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(199,13,'it','Leave Status','<p>Oggetto: - Dipartimento HR / Societ&agrave; per inviare lettera di approvazione a {leave_status} una vacanza o un congedo.</p>\n                    <p>Caro {leave_status_name},</p>\n                    <p>Ho {leave_status} la tua richiesta di permesso per {leave_reason} da {leave_start_date} a {leave_end_date}.</p>\n                    <p>{total_leave_days} giorni I ho {leave_status} la tua richiesta di permesso per {leave_reason}.</p>\n                    <p>Ti richiediamo di completare tutte le tue lavorazioni in sospeso o qualsiasi altra questione importante in modo che lazienda non faccia alcuna perdita o problema durante la tua assenza. Apprezziamo la vostra premura per informarci bene in anticipo</p>\n                    <p>Sentiti libero di raggiungere se hai domande.</p>\n                    <p>Grazie</p>\n                    <p>Riguardo,</p>\n                    <p>Dipartimento HR,</p>\n                    <p>{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(200,13,'ja','Leave Status','<p>件名: 承認レターを { leave_status} に送信するには、 -HR 部門/会社が休暇または休暇を入力します。</p>\n                    <p>{leave_status_name} を終了します。</p>\n                    <p>{ leave_reason } の { leave_start_date} から {leave_end_date}までの { leave_status} の終了要求を { leave_status} しています。</p>\n                    <p>{total_leave_days} 日に { leave_reason}{ leave_status} に対するあなたの休暇要求があります。</p>\n                    <p>お客様は、お客様の不在中に損失や問題が発生しないように、保留中のすべての作業またはその他の重要な問題を完了するよう要求します。 私たちは、前もってお知らせすることに感謝しています。</p>\n                    <p>質問がある場合は、自由に連絡してください。</p>\n                    <p>ありがとう</p>\n                    <p>よろしく</p>\n                    <p>HR 部門</p>\n                    <p>{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(201,13,'nl','Leave Status','<p>Betreft: -HR-afdeling/Bedrijf voor het verzenden van een goedkeuringsbrief aan { leave_status } een vakantie of verlof.</p>\n                    <p>Geachte { leave_status_name },</p>\n                    <p>Ik heb { leave_status } uw verzoek om verlof voor { leave_reason } van { leave_start_date } tot { leave_end_date }.</p>\n                    <p>{ total_leave_days } dagen Ik heb { leave_status } uw verzoek om verlof voor { leave_reason }.</p>\n                    <p>Wij vragen u om al uw lopende werk of een andere belangrijke kwestie, zodat het bedrijf geen verlies of probleem tijdens uw afwezigheid geconfronteerd. We waarderen uw bedachtzaamheid om ons van tevoren goed te informeren.</p>\n                    <p>Voel je vrij om uit te reiken als je vragen hebt.</p>\n                    <p>Dank u wel</p>\n                    <p>Betreft:</p>\n                    <p>HR-afdeling,</p>\n                    <p>{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(202,13,'pl','Leave Status','<p>Temat: -Dział kadr/Firma wysyłająca list zatwierdzający do {leave_status } wakacji lub urlop&oacute;w.</p>\n                    <p>Drogi {leave_status_name },</p>\n                    <p>Mam {leave_status } żądanie pozostania dla {leave_reason } od {leave_start_date } do {leave_end_date }.</p>\n                    <p>{total_leave_days } dni Mam {leave_status } Twoje żądanie opuszczenia dla {leave_reason }.</p>\n                    <p>Prosimy o wypełnienie wszystkich oczekujących prac lub innych ważnych kwestii, tak aby firma nie borykała się z żadną stratą lub problemem w czasie Twojej nieobecności. Doceniamy Twoją przemyślność, aby poinformować nas dobrze z wyprzedzeniem</p>\n                    <p>Czuj się swobodnie, jeśli masz jakieś pytania.</p>\n                    <p>Dziękujemy</p>\n                    <p>W odniesieniu do</p>\n                    <p>Dział HR,</p>\n                    <p>{app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(203,13,'ru','Leave Status','<p>Тема: -HR отдел/Компания отправить письмо с утверждением на { leave_status } отпуск или отпуск.</p>\n                    <p>Уважаемый { leave_status_name },</p>\n                    <p>У меня { leave_status } ваш запрос на отпуск для { leave_reason } из { leave_start_date } в { leave_end_date }.</p>\n                    <p>{ total_leave_days } дней { leave_status } ваш запрос на отпуск для { leave_reason }.</p>\n                    <p>Мы просим вас завершить все ваши ожидающие работы или любой другой важный вопрос, чтобы компания не сталкивалась с потерей или проблемой во время вашего отсутствия. Мы ценим вашу задумчивость, чтобы заблаговременно информировать нас о</p>\n                    <p>Не стеснитесь, если у вас есть вопросы.</p>\n                    <p>Спасибо.</p>\n                    <p>С уважением,</p>\n                    <p>Отдел кадров,</p>\n                    <p>{ app_name }</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(204,13,'pt','Leave Status','<p style=\"font-size: 14.4px;\">Assunto:-Departamento de RH / Empresa para enviar carta de aprova&ccedil;&atilde;o para {leave_status} f&eacute;rias ou licen&ccedil;a.</p>\n                    <p style=\"font-size: 14.4px;\">Querido {leave_status_name},</p>\n                    <p style=\"font-size: 14.4px;\">Eu tenho {leave_status} sua solicita&ccedil;&atilde;o de licen&ccedil;a para {leave_reason} de {leave_start_date} para {leave_end_date}.</p>\n                    <p style=\"font-size: 14.4px;\">{total_leave_days} dias eu tenho {leave_status} o seu pedido de licen&ccedil;a para {leave_reason}.</p>\n                    <p style=\"font-size: 14.4px;\">Solicitamos que voc&ecirc; complete todo o seu trabalho pendente ou qualquer outra quest&atilde;o importante para que a empresa n&atilde;o enfrente qualquer perda ou problema durante a sua aus&ecirc;ncia. Agradecemos a sua atenciosidade para nos informar com bastante anteced&ecirc;ncia</p>\n                    <p style=\"font-size: 14.4px;\">Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</p>\n                    <p style=\"font-size: 14.4px;\">Obrigado</p>\n                    <p style=\"font-size: 14.4px;\">Considera,</p>\n                    <p style=\"font-size: 14.4px;\">Departamento de RH,</p>\n                    <p style=\"font-size: 14.4px;\">{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(205,13,'tr','Leave Status','<p><strong>Konu:-Onay yazısının gönderileceği İK departmanı/Şirket {leave_status} tatil ya da izin.</strong></p>\n                    <p><strong>Sayın {leave_status_name},</strong></p>\n                    <p>Sahibim {leave_status} için izin talebiniz {leave_reason} itibaren {leave_start_date} ile {leave_end_date}.</p>\n                    <p>{total_leave_days} sahip olduğum günler {leave_status}&nbsp; için izin talebiniz {leave_reason}.</p>\n                    <p>Şirketin yokluğunuz sırasında herhangi bir kayıp veya sorunla karşılaşmaması için bekleyen tüm işlerinizi veya diğer önemli hususlarınızı tamamlamanızı rica ederiz. Bizi önceden bilgilendirme konusundaki düşünceniz için teşekkür ederiz</p>\n                    <p>&nbsp;</p>\n                    <p>Herhangi bir sorunuz varsa ulaşmaktan çekinmeyin.</p>\n                    <p>Teşekkür ederim</p>\n                    <p><strong>Saygılarımızla,</strong></p>\n                    <p><strong>İK Departmanı,</strong></p>\n                    <p><strong>{app_name}</strong></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(206,13,'zh','Leave Status','<p><strong>主题：-人力资源部门/公司发送批准函 {leave_status} 休假或请假.</strong></p>\n                    <p><strong>亲爱的 {leave_status_name},</strong></p>\n                    <p>我有 {leave_status} 您的请假申请 {leave_reason} 从 {leave_start_date} 到 {leave_end_date}.</p>\n                    <p>{total_leave_days} 我有的日子 {leave_status}&nbsp; 您的请假申请 {leave_reason}.</p>\n                    <p>我们要求您完成所有未完成的工作或任何其他重要问题，以便公司在您缺席期间不会面临任何损失或问题。感谢您的周到提前通知我们</p>\n                    <p>&nbsp;</p>\n                    <p>如果您有任何疑问，请随时与我们联系.</p>\n                    <p>谢谢</p>\n                    <p><strong>问候,</strong></p>\n                    <p><strong>人事部,</strong></p>\n                    <p><strong>{app_name}</strong></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(207,13,'he','Leave Status','<p><strong>Subject:-מחלקת משאבי אנוש/חברה לשלוח אליה מכתב אישור {leave_status} חופשה או חופשה.</strong></p>\n                    <p><strong>יָקָר {leave_status_name},</strong></p>\n                    <p>יש לי {leave_status} בקשת החופשה שלך עבור {leave_reason} מ {leave_start_date} ל {leave_end_date}.</p>\n                    <p>{total_leave_days} ימים שיש לי {leave_status}&nbsp; בקשת החופשה שלך עבור {leave_reason}.</p>\n                    <p>אנו מבקשים מכם להשלים את כל העבודה הממתינה או כל נושא חשוב אחר על מנת שהחברה לא תעמוד בפני כל אובדן או בעיה במהלך היעדרותכם. אנו מעריכים את התחשבותך להודיע ​​לנו זמן רב מראש</p>\n                    <p>&nbsp;</p>\n                    <p>אל תהסס לפנות אם יש לך שאלות.</p>\n                    <p>תודה</p>\n                    <p><strong>בברכה,</strong></p>\n                    <p><strong>מחלקת משאבי אנוש,</strong></p>\n                    <p><strong>{app_name}</strong></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(208,13,'pt-br','Leave Status','<p style=\"font-size: 14.4px;\">Assunto:-Departamento de RH / Empresa para enviar carta de aprova&ccedil;&atilde;o para {leave_status} f&eacute;rias ou licen&ccedil;a.</p>\n                    <p style=\"font-size: 14.4px;\">Querido {leave_status_name},</p>\n                    <p style=\"font-size: 14.4px;\">Eu tenho {leave_status} sua solicita&ccedil;&atilde;o de licen&ccedil;a para {leave_reason} de {leave_start_date} para {leave_end_date}.</p>\n                    <p style=\"font-size: 14.4px;\">{total_leave_days} dias eu tenho {leave_status} o seu pedido de licen&ccedil;a para {leave_reason}.</p>\n                    <p style=\"font-size: 14.4px;\">Solicitamos que voc&ecirc; complete todo o seu trabalho pendente ou qualquer outra quest&atilde;o importante para que a empresa n&atilde;o enfrente qualquer perda ou problema durante a sua aus&ecirc;ncia. Agradecemos a sua atenciosidade para nos informar com bastante anteced&ecirc;ncia</p>\n                    <p style=\"font-size: 14.4px;\">Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</p>\n                    <p style=\"font-size: 14.4px;\">Obrigado</p>\n                    <p style=\"font-size: 14.4px;\">Considera,</p>\n                    <p style=\"font-size: 14.4px;\">Departamento de RH,</p>\n                    <p style=\"font-size: 14.4px;\">{app_name}</p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(209,14,'ar','Contract','<p><span style=\"font-family: sans-serif;\"><strong>مرحبا </strong>{ contract_employee } </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong><strong>العقد :</strong> </strong>{ contract_subject } </span></p>\n                    <p><strong><span style=\"font-family: sans-serif;\">S</span></strong><span style=\"font-family: sans-serif;\"><strong>تاريخ البدء</strong>: { contract_start_date } </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>تاريخ الانتهاء</strong>: { contract_end_date } </span></p>\n                    <p><span style=\"font-family: sans-serif;\">اتطلع للسمع منك. </span></p>\n                    <p><strong><span style=\"font-family: sans-serif;\">Regards Regards ، </span></strong></p>\n                    <p><span style=\"font-family: sans-serif;\">{company_name}</span></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(210,14,'da','Contract','<p><span style=\"font-family: sans-serif;\"><strong>Hej </strong>{ contract_employee } </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>Aftaleemne:</strong> { contract_subject } </span></p>\n                    <p><strong><span style=\"font-family: sans-serif;\">S</span></strong><span style=\"font-family: sans-serif;\"><strong>tart-dato</strong>: { contract_start_date } </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>Slutdato</strong>: { contract_end_date } </span></p>\n                    <p><span style=\"font-family: sans-serif;\">Ser frem til at høre fra dig. </span></p>\n                    <p><strong><span style=\"font-family: sans-serif;\">Kærlig hilsen </span></strong></p>\n                    <p><span style=\"font-family: sans-serif;\">{company_name}</span></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(211,14,'de','Contract','<p><span style=\"font-family: sans-serif;\"><strong><strong> </strong></strong>{contract_employee} </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>Vertragssubjekt:</strong> {contract_subject} </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>tart-Datum</strong>: {contract_start_date} </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>Sluttdato </strong>:{contract_end_date} </span></p>\n                    <p><span style=\"font-family: sans-serif;\">Freuen Sie sich auf die von Ihnen zu h&ouml;renden Informationen. </span></p>\n                    <p><strong><span style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">-Regards, </span></span></strong></p>\n                    <p><span style=\"font-family: sans-serif;\">{company_name}</span></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(212,14,'en','Contract','<p><span style=\"font-family: sans-serif;\"><strong>Hi </strong>{contract_employee} </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>Contract Subject:</strong> {contract_subject} </span></p>\n                    <p><strong><span style=\"font-family: sans-serif;\">S</span></strong><span style=\"font-family: sans-serif;\"><strong>tart Date</strong>: {contract_start_date} </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>End Date</strong>: {contract_end_date} </span></p>\n                    <p><span style=\"font-family: sans-serif;\">Looking forward to hear from you. </span></p>\n                    <p><strong><span style=\"font-family: sans-serif;\">Kind Regards, </span></strong></p>\n                    <p><span style=\"font-family: sans-serif;\">{company_name}</span></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(213,14,'es','Contract','<p><span style=\"font-family: sans-serif;\"><strong><strong>Hi </strong></strong>{contract_employee} </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong><strong>de contrato:</strong> </strong>{contract_subject} </span></p>\n                    <p><strong><span style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">S</span></span></strong><span style=\"font-family: sans-serif;\"><strong>tart Date</strong>: {contract_start_date} </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>Fecha de finalizaci&oacute;n</strong>: {contract_end_date} </span></p>\n                    <p><span style=\"font-family: sans-serif;\">Con ganas de escuchar de usted. </span></p>\n                    <p><strong><span style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">Regards de tipo, </span></span></strong></p>\n                    <p><span style=\"font-family: sans-serif;\">{contract_name}</span></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(214,14,'fr','Contract','<p><span style=\"font-family: sans-serif;\"><strong><strong> </strong></strong>{ contract_employee } </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>Objet du contrat:</strong> { contract_subject } </span></p>\n                    <p><strong><span style=\"font-family: sans-serif;\">S</span></strong><span style=\"font-family: sans-serif;\"><strong>Date de d&eacute;but</strong>: { contract_start_date } </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>Date de fin</strong>: { contract_end_date } </span></p>\n                    <p><span style=\"font-family: sans-serif;\">Vous avez h&acirc;te de vous entendre. </span></p>\n                    <p><strong><span style=\"font-family: sans-serif;\">Kind Regards </span> </strong></p>\n                    <p><span style=\"font-family: sans-serif;\">{company_name}</span></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(215,14,'it','Contract','<p><span style=\"font-family: sans-serif;\"><strong>Ciao </strong>{contract_employee} </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>Oggetto Contratto:</strong> {contract_subject} </span></p>\n                    <p><strong><span style=\"font-family: sans-serif;\">S</span></strong><span style=\"font-family: sans-serif;\"><strong>Data tarte</strong>: {contract_start_date} </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>Data di fine</strong>: {contract_end_date} </span></p>\n                    <p><span style=\"font-family: sans-serif;\">Non vedo lora di sentire da te. </span></p>\n                    <p><strong><span style=\"font-family: sans-serif;\">Kind indipendentemente, </span></strong></p>\n                    <p><span style=\"font-family: sans-serif;\">{company_name}</span></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(216,14,'ja','Contract','<p><span style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\"><strong>ハイ </strong>{contract_employee} </span></span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>契約件名:</strong> {契約対象} </span></p>\n                    <p><strong><strong><span style=\"font-family: sans-serif;\">S</span></strong><span style=\"font-family: sans-serif;\"><strong>tart Date</strong>: </span></strong><span style=\"font-family: sans-serif;\">{contract_start_date}</span><span style=\"font-family: sans-serif;\"> </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>終了日</strong>: {contract_end_date} </span></p>\n                    <p><span style=\"font-family: sans-serif;\">お客様から連絡をお待ちしています。 </span></p>\n                    <p><strong><span style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">クインド・レード </span></span></strong></p>\n                    <p><span style=\"font-family: sans-serif;\">{company_name}</span></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(217,14,'nl','Contract','<p><span style=\"font-family: sans-serif;\"><strong>Hi </strong>{ contract_employee } </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>Contractonderwerp:</strong> { contract_subject } </span></p>\n                    <p><strong><span style=\"font-family: sans-serif;\">S</span></strong><span style=\"font-family: sans-serif;\"><strong>tart Date</strong>: { contract_start_date } </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>Einddatum</strong>: { contract_end_date } </span></p>\n                    <p><span style=\"font-family: sans-serif;\">Ik kijk ernaar uit om van u te horen. </span></p>\n                    <p><strong><span style=\"font-family: sans-serif;\">Soort Regards, </span></strong></p>\n                    <p><span style=\"font-family: sans-serif;\">{company_name}</span></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(218,14,'pl','Contract','<p><span style=\"font-family: sans-serif;\"><strong>Hi </strong>{contract_employee}</span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>Temat umowy:</strong> {contract_subject} </span></p>\n                    <p><strong><span style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">S</span></span></strong><span style=\"font-family: sans-serif;\"><strong>data tartu</strong>: {contract_start_date} </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>Data zakończenia</strong>: {contract_end_date} </span></p>\n                    <p><span style=\"font-family: sans-serif;\">Nie można się doczekać, aby usłyszeć od użytkownika. </span></p>\n                    <p><strong><span style=\"font-family: sans-serif;\">Regaty typu, </span></strong></p>\n                    <p><span style=\"font-family: sans-serif;\">{company_name}</span></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(219,14,'ru','Contract','<p><span style=\"font-family: sans-serif;\"><strong>Привет </strong>{ contract_employee } </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>Тема договора:</strong> { contract_subject } </span></p>\n                    <p><strong><span style=\"font-family: sans-serif;\">S</span></strong><span style=\"font-family: sans-serif;\"><strong>дата запуска</strong>: { contract_start_date } </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>Дата окончания</strong>: { contract_end_date } </span></p>\n                    <p><span style=\"font-family: sans-serif;\">С нетерпением ожидаю услышать от вас. </span></p>\n                    <p><strong><span style=\"font-family: sans-serif;\">Карты вида, </span></strong></p>\n                    <p><span style=\"font-family: sans-serif;\">{company_name}</span></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(220,14,'pt','Contract','<p><span style=\"font-family: sans-serif;\"><strong>Oi </strong>{contract_employee} </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>Assunto do Contrato:</strong> {contract_subject} </span></p>\n                    <p><strong><span style=\"font-family: sans-serif;\">S</span></strong><span style=\"font-family: sans-serif;\"><strong>tart Date</strong>: {contract_start_date} </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>Data de término</strong>: {contract_end_date} </span></p>\n                    <p><span style=\"font-family: sans-serif;\">Olhando para a frente para ouvir de você. </span></p>\n                    <p><strong><span style=\"font-family: sans-serif;\">Kind Considerar, </span></strong></p>\n                    <p><span style=\"font-family: sans-serif;\">{company_name}</span></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(221,14,'tr','Contract','<p><span style=\"font-family: sans-serif;\"><strong>MERHABA </strong>{contract_employee} </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>Sözleşme Konusu:</strong> {contract_subject} </span></p>\n                    <p><strong><span style=\"font-family: sans-serif;\">S</span></strong><span style=\"font-family: sans-serif;\"><strong>Başlangıç ​​tarihi</strong>: {contract_start_date} </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>Bitiş tarihi</strong>: {contract_end_date} </span></p>\n                    <p><span style=\"font-family: sans-serif;\">senden haber bekliyorum. </span></p>\n                    <p><strong><span style=\"font-family: sans-serif;\">Saygılarımla, </span></strong></p>\n                    <p><span style=\"font-family: sans-serif;\">{company_name}</span></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(222,14,'zh','Contract','<p><span style=\"font-family: sans-serif;\"><strong>你好 </strong>{contract_employee} </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>合同主体:</strong> {contract_subject} </span></p>\n                    <p><strong><span style=\"font-family: sans-serif;\"></span></strong><span style=\"font-family: sans-serif;\"><strong>开始日期</strong>: {contract_start_date} </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>结束日期</strong>: {contract_end_date} </span></p>\n                    <p><span style=\"font-family: sans-serif;\">期待着听到您的意见. </span></p>\n                    <p><strong><span style=\"font-family: sans-serif;\">亲切的问候, </span></strong></p>\n                    <p><span style=\"font-family: sans-serif;\">{company_name}</span></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(223,14,'he','Contract','<p><span style=\"font-family: sans-serif;\"><strong>היי </strong>{contract_employee} </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>נושא החוזה:</strong> {contract_subject} </span></p>\n                    <p><strong><span style=\"font-family: sans-serif;\"></span></strong><span style=\"font-family: sans-serif;\"><strong>תאריך התחלה</strong>: {contract_start_date} </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>תאריך סיום</strong>: {contract_end_date} </span></p>\n                    <p><span style=\"font-family: sans-serif;\">מצפה לשמוע ממך. </span></p>\n                    <p><strong><span style=\"font-family: sans-serif;\">בברכה, </span></strong></p>\n                    <p><span style=\"font-family: sans-serif;\">{company_name}</span></p>','2025-02-06 06:40:27','2025-02-06 06:40:27'),(224,14,'pt-br','Contract','<p><span style=\"font-family: sans-serif;\"><strong>Oi </strong>{contract_employee} </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>Assunto do Contrato:</strong> {contract_subject} </span></p>\n                    <p><strong><span style=\"font-family: sans-serif;\">S</span></strong><span style=\"font-family: sans-serif;\"><strong>tart Date</strong>: {contract_start_date} </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>Data de término</strong>: {contract_end_date} </span></p>\n                    <p><span style=\"font-family: sans-serif;\">Olhando para a frente para ouvir de você. </span></p>\n                    <p><strong><span style=\"font-family: sans-serif;\">Kind Considerar, </span></strong></p>\n                    <p><span style=\"font-family: sans-serif;\">{company_name}</span></p>','2025-02-06 06:40:27','2025-02-06 06:40:27');
/*!40000 ALTER TABLE `email_template_langs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates`
--

DROP TABLE IF EXISTS `email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_templates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates`
--

LOCK TABLES `email_templates` WRITE;
/*!40000 ALTER TABLE `email_templates` DISABLE KEYS */;
INSERT INTO `email_templates` VALUES (1,'New User',NULL,'new_user',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(2,'New Employee',NULL,'new_employee',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(3,'New Payroll',NULL,'new_payroll',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(4,'New Ticket',NULL,'new_ticket',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(5,'New Award',NULL,'new_award',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(6,'Employee Transfer',NULL,'employee_transfer',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(7,'Employee Resignation',NULL,'employee_resignation',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(8,'Employee Trip',NULL,'employee_trip',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(9,'Employee Promotion',NULL,'employee_promotion',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(10,'Employee Complaints',NULL,'employee_complaints',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(11,'Employee Warning',NULL,'employee_warning',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(12,'Employee Termination',NULL,'employee_termination',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(13,'Leave Status',NULL,'leave_status',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(14,'Contract',NULL,'contract',1,'2025-02-06 06:40:27','2025-02-06 06:40:27');
/*!40000 ALTER TABLE `email_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_documents`
--

DROP TABLE IF EXISTS `employee_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_documents` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `document_id` int NOT NULL,
  `document_value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_documents`
--

LOCK TABLES `employee_documents` WRITE;
/*!40000 ALTER TABLE `employee_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_loans`
--

DROP TABLE IF EXISTS `employee_loans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_loans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint unsigned NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `number_of_months` int NOT NULL,
  `monthly_emi` decimal(10,2) NOT NULL,
  `start_month` date NOT NULL,
  `remaining_amount` decimal(10,2) NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_loans_employee_id_foreign` (`employee_id`),
  KEY `employee_loans_created_by_foreign` (`created_by`),
  CONSTRAINT `employee_loans_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employee_loans_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_loans`
--

LOCK TABLES `employee_loans` WRITE;
/*!40000 ALTER TABLE `employee_loans` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_loans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `custom_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `office_phone_one` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `office_phone_two` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emergency_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `biometric_emp_id` int DEFAULT NULL,
  `branch_id` int NOT NULL,
  `site_id` bigint unsigned DEFAULT NULL,
  `department_id` int NOT NULL,
  `designation_id` int NOT NULL,
  `education_details` json DEFAULT NULL,
  `experience_details` json DEFAULT NULL,
  `company_doj` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `documents` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_holder_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_identifier_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_payer_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary_type` int DEFAULT NULL,
  `account_type` int DEFAULT NULL,
  `salary` double(20,2) NOT NULL DEFAULT '0.00',
  `created_by` int NOT NULL,
  `project_id` bigint unsigned DEFAULT NULL,
  `week_off_day` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `education_images` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,3,NULL,'Adarsh Sanjivan Waghmare','2000-07-04','Male','9136211332',NULL,NULL,'7020727854','305, jj heights, hinjewadi, pune','adarsh123@gmail.com','$2y$10$vEvYvTd3aoCXhxlbi9uDTeA5./Z20ygpm4eQiSAGUhhfxsZ4.WBsG','1',NULL,1,NULL,1,1,'\"[{\\\"college_name\\\":\\\"xxx\\\",\\\"passing_year\\\":\\\"2003\\\",\\\"grade\\\":\\\"2\\\",\\\"degree\\\":\\\"10th\\\",\\\"document_path\\\":\\\"education_images\\\\/edu__0_1751614693.jpg\\\"},{\\\"college_name\\\":\\\"SSC\\\",\\\"passing_year\\\":\\\"2005\\\",\\\"grade\\\":\\\"8\\\",\\\"degree\\\":\\\"12th\\\",\\\"document_path\\\":\\\"education_images\\\\/edu__1_1751614693.jpg\\\"}]\"','\"[{\\\"previous_company_name\\\":\\\"AK Infosol Pvt. Ltd.\\\",\\\"previous_designation\\\":\\\"sale\\\",\\\"start_date\\\":\\\"2025-03-01\\\",\\\"end_date\\\":\\\"2025-07-01\\\",\\\"previous_salary\\\":\\\"14997\\\"}]\"','2025-07-04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,2,NULL,'Wednesday','\"[\\\"education_images\\\\/edu__0_1751614693.jpg\\\",\\\"education_images\\\\/edu__1_1751614693.jpg\\\"]\"','2025-07-04 07:38:13','2025-07-04 07:38:13'),(2,5,NULL,'Prasad','2000-07-04','Male','7020727854',NULL,NULL,'9324219210','Pune','prasad@gmail.com','$2y$10$2HA3jmhXt1y9Kr5ZX8Q5J.mJawq7x.7jyEfJVCFj0nrK.JMkY3klC','2',NULL,1,NULL,1,1,'\"[]\"','\"[]\"','2025-07-04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,2,NULL,'Tuesday','\"[]\"','2025-07-04 08:02:08','2025-07-04 08:02:08');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_employees`
--

DROP TABLE IF EXISTS `event_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_employees` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_employees`
--

LOCK TABLES `event_employees` WRITE;
/*!40000 ALTER TABLE `event_employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int NOT NULL,
  `department_id` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_id` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expense_types`
--

DROP TABLE IF EXISTS `expense_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expense_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expense_types`
--

LOCK TABLES `expense_types` WRITE;
/*!40000 ALTER TABLE `expense_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `expense_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expenses`
--

DROP TABLE IF EXISTS `expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expenses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int NOT NULL,
  `amount` double(15,2) NOT NULL,
  `date` date NOT NULL,
  `expense_category_id` int NOT NULL,
  `payee_id` int NOT NULL,
  `payment_type_id` int NOT NULL,
  `referal_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expenses`
--

LOCK TABLES `expenses` WRITE;
/*!40000 ALTER TABLE `expenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `expenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experience_certificates`
--

DROP TABLE IF EXISTS `experience_certificates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experience_certificates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experience_certificates`
--

LOCK TABLES `experience_certificates` WRITE;
/*!40000 ALTER TABLE `experience_certificates` DISABLE KEYS */;
INSERT INTO `experience_certificates` VALUES (1,'ar','<h3 style=\"text-align: center;\">بريد إلكتروني تجربة</h3>\r\n            \r\n            \r\n            \r\n            <p>{app_name}</p>\r\n            \r\n            <p>إلي من يهمه الامر</p>\r\n            \r\n            <p>{date}</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>مدة الخدمة {duration} في {app_name}.</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>{payroll}</p>\r\n            \r\n            <p>الادوار والمسؤوليات</p>\r\n            \r\n            \r\n            \r\n            <p>وصف موجز لمسار عمل الموظف وبيان إيجابي من المدير أو المشرف.</p>\r\n            \r\n            \r\n            \r\n            <p>بإخلاص،</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>التوقيع</p>\r\n            \r\n            <p>{app_name}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(2,'da','<h3 style=\"text-align: center;\">Erfaringsbrev</h3>\r\n            \r\n            <p>{app_name}</p>\r\n            \r\n            <p>TIL HVEM DET M&Aring;TTE VEDR&Oslash;RE</p>\r\n            \r\n            <p>{date}</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>Tjenesteperiode {duration} i {app_name}.</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>{payroll}</p>\r\n            \r\n            <p>Roller og ansvar</p>\r\n            \r\n            \r\n            \r\n            <p>Kort beskrivelse af medarbejderens ans&aelig;ttelsesforl&oslash;b og positiv udtalelse fra leder eller arbejdsleder.</p>\r\n            \r\n            \r\n            \r\n            <p>Med venlig hilsen</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>Underskrift</p>\r\n            \r\n            <p>{app_name}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(3,'de','<h3 style=\"text-align: center;\">Erfahrungsbrief</h3>\r\n            \r\n            \r\n            \r\n            <p>{app_name}</p>\r\n            \r\n            <p>WEN ES ANGEHT</p>\r\n            \r\n            <p>{date}</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>Dienstzeit {duration} in {app_name}.</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>{payroll}</p>\r\n            \r\n            <p>Rollen und Verantwortlichkeiten</p>\r\n            \r\n            \r\n            \r\n            <p>Kurze Beschreibung des beruflichen Werdegangs des Mitarbeiters und eine positive Stellungnahme des Vorgesetzten oder Vorgesetzten.</p>\r\n            \r\n            \r\n            \r\n            <p>Aufrichtig,</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>Unterschrift</p>\r\n            \r\n            <p>{app_name}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(4,'en','<p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: center;\" align=\"center\"><span style=\"font-size: 18pt;\"><strong>Experience Letter</strong></span></p>\r\n            <p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: left;\" align=\"center\">&nbsp;</p>\r\n            <p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: left;\" align=\"center\">{app_name}</p>\r\n            <p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: left;\" align=\"center\">TO WHOM IT MAY CONCERN</p>\r\n            <p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: left;\" align=\"center\">{date}</p>\r\n            <p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: left;\" align=\"center\">{employee_name}</p>\r\n            <p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: left;\" align=\"center\">Tenure of Service {duration} in {app_name}.</p>\r\n            <p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: left;\" align=\"center\">{designation}</p>\r\n            <p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: left;\" align=\"center\">{payroll}</p>\r\n            <p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: left;\" align=\"center\">Roles and Responsibilities</p>\r\n            <p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: left;\" align=\"center\">&nbsp;</p>\r\n            <p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: left;\" align=\"center\">Brief description of the employee&rsquo;s course of employment and a positive statement from the manager or supervisor.</p>\r\n            <p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: left;\" align=\"center\">&nbsp;</p>\r\n            <p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: left;\" align=\"center\">Sincerely,</p>\r\n            <p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: left;\" align=\"center\">{employee_name}</p>\r\n            <p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: left;\" align=\"center\">{designation}</p>\r\n            <p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: left;\" align=\"center\">Signature</p>\r\n            <p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: left;\" align=\"center\">{app_name}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(5,'es','<h3 style=\"text-align: center;\">Carta de experiencia</h3>\r\n            \r\n            \r\n            <p>{app_name}</p>\r\n            \r\n            <p>A QUIEN LE INTERESE</p>\r\n            \r\n            <p>{date}</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>Duraci&oacute;n del servicio {duration} en {app_name}.</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>{payroll}</p>\r\n            \r\n            <p>Funciones y responsabilidades</p>\r\n            \r\n            \r\n            \r\n            <p>Breve descripci&oacute;n del curso de empleo del empleado y una declaraci&oacute;n positiva del gerente o supervisor.</p>\r\n            \r\n            \r\n            \r\n            <p>Sinceramente,</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>Firma</p>\r\n            \r\n            <p>{app_name}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(6,'fr','<h3 style=\"text-align: center;\">Lettre dexp&eacute;rience</h3>\r\n            \r\n            \r\n            \r\n            <p>{app_name}</p>\r\n            \r\n            <p>&Agrave; QUI DE DROIT</p>\r\n            \r\n            <p>{date}</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>Dur&eacute;e du service {duration} dans {app_name}.</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>{payroll}</p>\r\n            \r\n            <p>R&ocirc;les et responsabilit&eacute;s</p>\r\n            \r\n            \r\n            \r\n            <p>Br&egrave;ve description de l&eacute;volution de lemploi de lemploy&eacute; et une d&eacute;claration positive du gestionnaire ou du superviseur.</p>\r\n            \r\n            \r\n            \r\n            <p>Sinc&egrave;rement,</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>Signature</p>\r\n            \r\n            <p>{app_name}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(7,'id','<h3 style=\"text-align: center;\">Surat Pengalaman</h3>\r\n            \r\n            \r\n            \r\n            <p>{app_name}</p>\r\n            \r\n            <p>UNTUK PERHATIAN</p>\r\n            \r\n            <p>{date}</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>Jangka Waktu Layanan {duration} di {app_name}.</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>{payroll}</p>\r\n            \r\n            <p>Peran dan Tanggung Jawab</p>\r\n            \r\n            \r\n            \r\n            <p>Deskripsi singkat tentang pekerjaan karyawan dan pernyataan positif dari manajer atau supervisor.</p>\r\n            \r\n            \r\n            \r\n            <p>Sungguh-sungguh,</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>Tanda tangan</p>\r\n            \r\n            <p>{app_name}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(8,'it','<h3 style=\"text-align: center;\">Lettera di esperienza</h3>\r\n            \r\n            \r\n            \r\n            <p>{app_name}</p>\r\n            \r\n            <p>PER CHI &Egrave; COINVOLTO</p>\r\n            \r\n            <p>{date}</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>Durata del servizio {duration} in {app_name}.</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>{payroll}</p>\r\n            \r\n            <p>Ruoli e responsabilit&agrave;</p>\r\n            \r\n            \r\n            \r\n            <p>Breve descrizione del percorso lavorativo del dipendente e dichiarazione positiva del manager o supervisore.</p>\r\n            \r\n            \r\n            \r\n            <p>Cordiali saluti,</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>Firma</p>\r\n            \r\n            <p>{app_name}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(9,'ja','\r\n            <h3 style=\"text-align: center;\">体験談</h3>\r\n            \r\n            \r\n            \r\n            <p>{app_name}</p>\r\n            \r\n            <p>ご担当者様</p>\r\n            \r\n            <p>{date}</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{app_name} のサービス {duration} の保有期間。</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>{payroll}</p>\r\n            \r\n            <p>役割と責任</p>\r\n            \r\n            \r\n            \r\n            <p>従業員の雇用コースの簡単な説明と、マネージャーまたはスーパーバイザーからの肯定的な声明。</p>\r\n            \r\n            \r\n            \r\n            <p>心から、</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>サイン</p>\r\n            \r\n            <p>{app_name}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(10,'nl','<h3 style=\"text-align: center;\">Ervaringsbrief</h3>\r\n            \r\n            \r\n            <p>{app_name}</p>\r\n            \r\n            <p>VOOR WIE HET AANGAAT</p>\r\n            \r\n            <p>{date}</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>Diensttijd {duration} in {app_name}.</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>{payroll}</p>\r\n            \r\n            <p>Rollen en verantwoordelijkheden</p>\r\n            \r\n            \r\n            \r\n            <p>Korte omschrijving van het dienstverband van de medewerker en een positieve verklaring van de leidinggevende of leidinggevende.</p>\r\n            \r\n            \r\n            \r\n            <p>Eerlijk,</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>Handtekening</p>\r\n            \r\n            <p>{app_name}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(11,'pl','<h3 style=\"text-align: center;\">Doświadczenie List</h3>\r\n            \r\n            \r\n            \r\n            <p>{app_name}</p>\r\n            \r\n            <p>DO TYCH KT&Oacute;RYCH MOŻE TO DOTYCZYĆ</p>\r\n            \r\n            <p>{date}</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>Okres świadczenia usług {duration} w aplikacji {app_name}.</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>{payroll}</p>\r\n            \r\n            <p>Role i obowiązki</p>\r\n            \r\n            \r\n            \r\n            <p>Kr&oacute;tki opis przebiegu zatrudnienia pracownika oraz pozytywna opinia kierownika lub przełożonego.</p>\r\n            \r\n            \r\n            \r\n            <p>Z poważaniem,</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>Podpis</p>\r\n            \r\n            <p>{app_name}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(12,'pt','<h3 style=\"text-align: center;\">Carta de Experi&ecirc;ncia</h3>\r\n            \r\n            <p>{app_name}</p>\r\n            \r\n            <p>A QUEM POSSA INTERESSAR</p>\r\n            \r\n            <p>{date}</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>Tempo de servi&ccedil;o {duration} em {app_name}.</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>{payroll}</p>\r\n            \r\n            <p>Pap&eacute;is e responsabilidades</p>\r\n            \r\n            <p>Breve descri&ccedil;&atilde;o do curso de emprego do funcion&aacute;rio e uma declara&ccedil;&atilde;o positiva do gerente ou supervisor.</p>\r\n            \r\n            <p>Sinceramente,</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>Assinatura</p>\r\n            \r\n            <p>{app_name}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(13,'ru','<h3 style=\"text-align: center;\">Письмо об опыте</h3>\r\n            \r\n            \r\n            \r\n            <p>{app_name}</p>\r\n            \r\n            <p>ДЛЯ ПРЕДЪЯВЛЕНИЯ ПО МЕСТУ ТРЕБОВАНИЯ</p>\r\n            \r\n            <p>{date}</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>Срок службы {duration} в {app_name}.</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>{payroll}</p>\r\n            \r\n            <p>Роли и обязанности</p>\r\n            \r\n            \r\n            \r\n            <p>Краткое описание трудового стажа работника и положительное заключение руководителя или руководителя.</p>\r\n            \r\n            \r\n            \r\n            <p>Искренне,</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>Подпись</p>\r\n            \r\n            <p>{app_name}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(14,'tr','<h3 style=\"text-align: center;\">Tecrübe mektubu</h3>\r\n            \r\n            <p>{app_name}</p>\r\n            \r\n            <p>İLGİLİ MAKAMA</p>\r\n            \r\n            <p>{date}</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>Hizmet süresi {duration} içinde {app_name}.</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>{payroll}</p>\r\n            \r\n            <p>Görev ve Sorumluluklar</p>\r\n            \r\n            <p>Çalışanların istihdam sürecinin kısa açıklaması ve yönetici veya amirden olumlu bir açıklama.</p>\r\n            \r\n            <p>Samimi olarak,</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>İmza</p>\r\n            \r\n            <p>{app_name}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(15,'zh','<h3 style=\"text-align: center;\">经验信</h3>\r\n            \r\n            <p>{app_name}</p>\r\n            \r\n            <p>敬启者</p>\r\n            \r\n            <p>{date}</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>服务期限 {duration} 在 {app_name}.</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>{payroll}</p>\r\n            \r\n            <p>角色和责任</p>\r\n            \r\n            <p>员工就业历程的简要描述以及经理或主管的积极声明.</p>\r\n            \r\n            <p>真挚地,</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>签名</p>\r\n            \r\n            <p>{app_name}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(16,'he','<h3 style=\"text-align: center;\">מכתב ניסיון</h3>\r\n            \r\n            <p>{app_name}</p>\r\n            \r\n            <p>לכל מאן דבעי</p>\r\n            \r\n            <p>{date}</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>כהונת שירות {duration} ב {app_name}.</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>{payroll}</p>\r\n            \r\n            <p>תפקידים ואחריות</p>\r\n            \r\n            <p>תיאור קצר של מהלך העסקת העובדים והצהרה חיובית מהמנהל או הממונה.</p>\r\n            \r\n            <p>בכנות,</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>חֲתִימָה</p>\r\n            \r\n            <p>{app_name}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(17,'pt-br','<h3 style=\"text-align: center;\">Carta de Experi&ecirc;ncia</h3>\r\n            \r\n            <p>{app_name}</p>\r\n            \r\n            <p>A QUEM POSSA INTERESSAR</p>\r\n            \r\n            <p>{date}</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>Tempo de servi&ccedil;o {duration} em {app_name}.</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>{payroll}</p>\r\n            \r\n            <p>Pap&eacute;is e responsabilidades</p>\r\n            \r\n            <p>Breve descri&ccedil;&atilde;o do curso de emprego do funcion&aacute;rio e uma declara&ccedil;&atilde;o positiva do gerente ou supervisor.</p>\r\n            \r\n            <p>Sinceramente,</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>Assinatura</p>\r\n            \r\n            <p>{app_name}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47');
/*!40000 ALTER TABLE `experience_certificates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
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
-- Table structure for table `generate_offer_letters`
--

DROP TABLE IF EXISTS `generate_offer_letters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `generate_offer_letters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generate_offer_letters`
--

LOCK TABLES `generate_offer_letters` WRITE;
/*!40000 ALTER TABLE `generate_offer_letters` DISABLE KEYS */;
INSERT INTO `generate_offer_letters` VALUES (1,'ar','<p style=\"text-align: center;\"><span style=\"font-size: 18pt;\"><strong>رسالة عرض</strong></span></p>\r\n                    \r\n                    \r\n                    <p>عزيزي {applicationant_name} ،</p>\r\n                    \r\n                    \r\n                    <p>{app_name} متحمس لاصطحابك على متن الطائرة بصفتك {job_title}.</p>\r\n                    \r\n                    <p>كنت على بعد خطوات قليلة من الشروع في العمل. يرجى أخذ الوقت الكافي لمراجعة عرضنا الرسمي. يتضمن تفاصيل مهمة حول راتبك ومزاياك وبنود وشروط عملك المتوقع مع {app_name}.</p>\r\n                    \r\n                    \r\n                    <p>{app_name} يقدم {job_type}. المنصب بالنسبة لك كـ {job_title} ، تقديم التقارير إلى [المدير المباشر / المشرف] بدءًا من {start_date} في {workplace_location}. ساعات العمل المتوقعة هي {days_of_week}.</p>\r\n                    \r\n                    \r\n                    <p>في هذا المنصب ، يعرض عليك {app_name}&nbsp; {salary}أن تبدأ لك بمعدل دفع {salary_type} لكل {salary_duration}. سوف يتم الدفع لك على أساس.</p>\r\n                    \r\n                    \r\n                    <p>كجزء من تعويضك ، إذا كان ذلك ممكنًا ، ستصف مكافأتك ومشاركة الأرباح وهيكل العمولة وخيارات الأسهم وقواعد لجنة التعويضات هنا.</p>\r\n                    \r\n                    \r\n                    <p>بصفتك موظفًا في {app_name} ، ستكون مؤهلاً للحصول على مزايا الاسم المختصر ، مثل التأمين الصحي ، وخطة الأسهم ، والتأمين على الأسنان ، وما إلى ذلك.</p>\r\n                    \r\n                    \r\n                    <p>الرجاء توضيح موافقتك على هذه البنود وقبول هذا العرض عن طريق التوقيع على هذه الاتفاقية وتأريخها في أو قبل {offer_expiration_date}.</p>\r\n                    \r\n                    <p>بإخلاص،</p>\r\n                    \r\n                    <p>{app_name}</p>\r\n                    ',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(2,'da','<p style=\"text-align: center;\"><span style=\"font-size: 18pt;\"><strong>Tilbudsbrev</strong></span></p>\r\n                    \r\n                    <p>K&aelig;re {applicant_name}</p>\r\n                    \r\n                    <p>{app_name} er glade for at f&aring; dig med som {job_title}.</p>\r\n                    \r\n                    <p>Der var kun et par formaliteter fra at komme p&aring; arbejde. Tag dig tid til at gennemg&aring; vores formelle tilbud. Den indeholder vigtige oplysninger om din kompensation, fordele og vilk&aring;rene og betingelserne for din forventede ans&aelig;ttelse hos {app_name}.</p>\r\n                    \r\n                    <p>{app_name} tilbyder en {job_type}. stilling til dig som {job_title}, der rapporterer til [n&aelig;rmeste leder/supervisor] fra og med {start_date} p&aring;{workplace_location}. Forventet arbejdstid er {days_of_week}.</p>\r\n                    \r\n                    \r\n                    <p>I denne stilling tilbyder {app_name} at starte dig med en l&oslash;nsats p&aring; {salary} pr. {salary_type}. Du vil blive betalt p&aring; {salary_duration}-basis.</p>\r\n                    \r\n                    <p>Som en del af din kompensation, du ogs&aring; tilbyder, hvis det er relevant, vil du beskrive din bonus, overskudsdeling, kommissionsstruktur, aktieoptioner og regler for kompensationsudvalget her.</p>\r\n                    \r\n                    \r\n                    <p>Som ansat hos {app_name} vil du v&aelig;re berettiget til kort navnefordele, s&aring;som sundhedsforsikring, aktieplan, tandforsikring osv.</p>\r\n                    \r\n                    <p>Angiv venligst din accept af disse vilk&aring;r og accepter dette tilbud ved at underskrive og datere denne aftale p&aring; eller f&oslash;r {offer_expiration_date}.</p>\r\n                    \r\n                    <p>Med venlig hilsen</p>\r\n                    \r\n                    <p>{app_name}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(3,'de','<p style=\"text-align: center;\"><span style=\"font-size: 18pt;\"><strong>Angebotsschreiben</strong></span></p>\r\n                    \r\n                    \r\n                    <p>Sehr geehrter {applicant_name},</p>\r\n                    \r\n                    \r\n                    <p>{app_name} freut sich, Sie als {job_title} an Bord zu holen.</p>\r\n                    \r\n                    \r\n                    <p>Nur noch wenige Formalit&auml;ten bis zur Arbeit. Bitte nehmen Sie sich die Zeit, unser formelles Angebot zu pr&uuml;fen. Es enth&auml;lt wichtige Details zu Ihrer Verg&uuml;tung, Ihren Leistungen und den Bedingungen Ihrer voraussichtlichen Anstellung bei {app_name}.</p>\r\n                    \r\n                    \r\n                    <p>{app_name} bietet einen {job_type} an. Position f&uuml;r Sie als {job_title}, ab {start_date} am {workplace_location} unterstellt an unmittelbarer Manager/Vorgesetzter. Erwartete Arbeitszeiten sind {days_of_week}.</p>\r\n                    \r\n                    \r\n                    <p>In dieser Position bietet {app_name} Ihnen an, mit einem Gehaltssatz von {salary} pro {salary_type} zu beginnen. Sie werden auf Basis von {salary_duration} bezahlt.</p>\r\n                    \r\n                    \r\n                    <p>Als Teil Ihrer Verg&uuml;tung, die Sie gegebenenfalls auch anbieten, beschreiben Sie hier Ihren Bonus, Ihre Gewinnbeteiligung, Ihre Provisionsstruktur, Ihre Aktienoptionen und die Regeln des Verg&uuml;tungsausschusses.</p>\r\n                    \r\n                    \r\n                    <p>Als Mitarbeiter von {app_name} haben Sie Anspruch auf Kurznamenvorteile wie Krankenversicherung, Aktienplan, Zahnversicherung usw.</p>\r\n                    \r\n                    \r\n                    \r\n                    <p>Bitte erkl&auml;ren Sie Ihr Einverst&auml;ndnis mit diesen Bedingungen und nehmen Sie dieses Angebot an, indem Sie diese Vereinbarung am oder vor dem {offer_expiration_date} unterzeichnen und datieren.</p>\r\n                    \r\n                    \r\n                    <p>Aufrichtig,</p>\r\n                    \r\n                    <p>{app_name}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(4,'en','<p style=\"text-align: center;\"><strong>Offer Letter</strong></p>\r\n                    \r\n                    <p>Dear {applicant_name},</p>\r\n                    \r\n                    <p>{app_name} is excited to bring you on board as {job_title}.</p>\r\n                    \r\n                    <p>Were just a few formalities away from getting down to work. Please take the time to review our formal offer. It includes important details about your compensation, benefits, and the terms and conditions of your anticipated employment with {app_name}.</p>\r\n                    \r\n                    <p>{app_name} is offering a {job_type}. position for you as {job_title}, reporting to [immediate manager/supervisor] starting on {start_date} at{workplace_location}. Expected hours of work are{days_of_week}.</p>\r\n                    \r\n                    <p>In this position, {app_name} is offering to start you at a pay rate of {salary} per {salary_type}. You will be paid on a{salary_duration} basis.&nbsp;</p>\r\n                    \r\n                    <p>As part of your compensation, were also offering [if applicable, youll describe your bonus, profit sharing, commission structure, stock options, and compensation committee rules here].</p>\r\n                    \r\n                    <p>As an employee of {app_name} , you will be eligible for briefly name benefits, such as health insurance, stock plan, dental insurance, etc.</p>\r\n                    \r\n                    <p>Please indicate your agreement with these terms and accept this offer by signing and dating this agreement on or before {offer_expiration_date}.</p>\r\n                    \r\n                    <p>Sincerely,</p>\r\n                    <p>{app_name}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(5,'es','<p style=\"text-align: center;\"><span style=\"font-size: 18pt;\"><strong>Carta de oferta</strong></span></p>\r\n                    \r\n                    \r\n                    <p>Estimado {applicant_name},</p>\r\n                    \r\n                    <p>{app_name} se complace en incorporarlo como {job_title}.</p>\r\n                    \r\n                    \r\n                    <p>Faltaban s&oacute;lo unos tr&aacute;mites para ponerse manos a la obra. T&oacute;mese el tiempo para revisar nuestra oferta formal. Incluye detalles importantes sobre su compensaci&oacute;n, beneficios y los t&eacute;rminos y condiciones de su empleo anticipado con {app_name}.</p>\r\n                    \r\n                    \r\n                    <p>{app_name} est&aacute; ofreciendo {job_type}. posici&oacute;n para usted como {job_title}, reportando al gerente/supervisor inmediato a partir del {start_date} en {workplace_location}. Las horas de trabajo esperadas son {days_of_week}.</p>\r\n                    \r\n                    \r\n                    <p>En este puesto, {app_name} te ofrece comenzar con una tarifa de pago de {salary} por {salary_type}. Se le pagar&aacute; sobre la base de {salary_duration}.</p>\r\n                    \r\n                    \r\n                    <p>Como parte de su compensaci&oacute;n, tambi&eacute;n ofrecemos, si corresponde, aqu&iacute; describir&aacute; su bonificaci&oacute;n, participaci&oacute;n en las ganancias, estructura de comisiones, opciones sobre acciones y reglas del comit&eacute; de compensaci&oacute;n.</p>\r\n                    \r\n                    \r\n                    <p>Como empleado de {app_name}, ser&aacute; elegible para beneficios de nombre breve, como seguro m&eacute;dico, plan de acciones, seguro dental, etc.</p>\r\n                    \r\n                    \r\n                    <p>Indique su acuerdo con estos t&eacute;rminos y acepte esta oferta firmando y fechando este acuerdo el {offer_expiration_date} o antes.</p>\r\n                    \r\n                    \r\n                    <p>Sinceramente,</p>\r\n                    \r\n                    <p>{app_name}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(6,'fr','<p style=\"text-align: center;\"><span style=\"font-size: 18pt;\"><strong>Lettre doffre</strong></span></p>\r\n                    \r\n                    \r\n                    <p>Cher {applicant_name},</p>\r\n                    \r\n                    \r\n                    <p>{app_name} est ravi de vous accueillir en tant que {job_title}.</p>\r\n                    \r\n                    \r\n                    <p>&Eacute;taient juste quelques formalit&eacute;s loin de se mettre au travail. Veuillez prendre le temps dexaminer notre offre formelle. Il comprend des d&eacute;tails importants sur votre r&eacute;mun&eacute;ration, vos avantages et les termes et conditions de votre emploi pr&eacute;vu avec {app_name}.</p>\r\n                    \r\n                    \r\n                    <p>{app_name} propose un {job_type}. poste pour vous en tant que {job_title}, relevant du directeur/superviseur imm&eacute;diat &agrave; partir du {start_date} &agrave; {workplace_location}. Les heures de travail pr&eacute;vues sont de {days_of_week}.</p>\r\n                    \r\n                    \r\n                    <p>&Agrave; ce poste, {app_name} vous propose de commencer avec un taux de r&eacute;mun&eacute;ration de {salary} par {salary_type}. Vous serez pay&eacute; sur une base de {salary_duration}.</p>\r\n                    \r\n                    \r\n                    <p>Dans le cadre de votre r&eacute;mun&eacute;ration, le cas &eacute;ch&eacute;ant, vous d&eacute;crivez ici votre bonus, votre participation aux b&eacute;n&eacute;fices, votre structure de commission, vos options sur actions et les r&egrave;gles du comit&eacute; de r&eacute;mun&eacute;ration.</p>\r\n                    \r\n                    \r\n                    <p>En tant quemploy&eacute; de {app_name}, vous aurez droit &agrave; des avantages bri&egrave;vement nomm&eacute;s, tels que lassurance maladie, le plan dactionnariat, lassurance dentaire, etc.</p>\r\n                    \r\n                    \r\n                    <p>Veuillez indiquer votre accord avec ces conditions et accepter cette offre en signant et en datant cet accord au plus tard le {offer_expiration_date}.</p>\r\n                    \r\n                    \r\n                    <p>Sinc&egrave;rement,</p>\r\n                    <p>{app_name}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(7,'id','<p style=\"text-align: center;\"><span style=\"font-size: 18pt;\"><strong>Surat penawaran</strong></span></p>\r\n                    \r\n                    \r\n                    <p>{applicant_name} yang terhormat,</p>\r\n                    \r\n                    \r\n                    <p>{app_name} dengan senang hati membawa Anda sebagai {job_title}.</p>\r\n                    \r\n                    \r\n                    <p>Tinggal beberapa formalitas lagi untuk mulai bekerja. Harap luangkan waktu untuk meninjau penawaran resmi kami. Ini mencakup detail penting tentang kompensasi, tunjangan, serta persyaratan dan ketentuan pekerjaan yang Anda harapkan dengan {app_name}.</p>\r\n                    \r\n                    \r\n                    <p>{app_name} menawarkan {job_type}. posisi untuk Anda sebagai {job_title}, melapor ke manajer/penyelia langsung mulai {start_date} di{workplace_location}. Jam kerja yang diharapkan adalah{days_of_week}.</p>\r\n                    \r\n                    \r\n                    <p>Di posisi ini, {app_name} menawarkan untuk memulai Anda dengan tarif pembayaran {salary} per {salary_type}. Anda akan dibayar berdasarkan {salary_duration}.</p>\r\n                    \r\n                    \r\n                    <p>Sebagai bagian dari kompensasi Anda, yang juga ditawarkan jika berlaku, Anda akan menjelaskan bonus, pembagian keuntungan, struktur komisi, opsi saham, dan aturan komite kompensasi Anda di sini.</p>\r\n                    \r\n                    \r\n                    <p>Sebagai karyawan {app_name} , Anda akan memenuhi syarat untuk mendapatkan manfaat singkat, seperti asuransi kesehatan, paket saham, asuransi gigi, dll.</p>\r\n                    \r\n                    \r\n                    <p>Harap tunjukkan persetujuan Anda dengan persyaratan ini dan terima penawaran ini dengan menandatangani dan memberi tanggal pada perjanjian ini pada atau sebelum {offer_expiration_date}.</p>\r\n                    \r\n                    \r\n                    <p>Sungguh-sungguh,</p>\r\n                    \r\n                    <p>{app_name}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(8,'it','<p style=\"text-align: center;\"><span style=\"font-size: 18pt;\"><strong>Lettera di offerta</strong></span></p>\r\n                    \r\n                    \r\n                    <p>Gentile {nome_richiedente},</p>\r\n                    \r\n                    \r\n                    <p>{app_name} &egrave; entusiasta di portarti a bordo come {job_title}.</p>\r\n                    \r\n                    \r\n                    <p>Mancavano solo poche formalit&agrave; per mettersi al lavoro. Per favore, prenditi del tempo per rivedere la nostra offerta formale. Include dettagli importanti sul compenso, i vantaggi e i termini e le condizioni del tuo impiego previsto con {app_name}.</p>\r\n                    \r\n                    \r\n                    <p>{app_name} offre un {job_type}. posizione per te come {job_title}, riportando al manager/supervisore immediato a partire da {start_date} a {workplace_location}. Lorario di lavoro previsto &egrave; di {days_of_week}.</p>\r\n                    \r\n                    \r\n                    <p>In questa posizione, {app_name} ti offre di iniziare con una paga di {salary} per {salary_type}. Sarai pagato su base {salary_duration}.</p>\r\n                    \r\n                    \r\n                    <p>Come parte del tuo compenso, se applicabile, descrivi anche il tuo bonus, la partecipazione agli utili, la struttura delle commissioni, le stock option e le regole del comitato di compensazione qui.</p>\r\n                    \r\n                    \r\n                    <p>In qualit&agrave; di dipendente di {app_name} , avrai diritto a vantaggi per nomi brevi, come assicurazione sanitaria, piano azionario, assicurazione dentale, ecc.</p>\r\n                    \r\n                    \r\n                    <p>Indica il tuo accordo con questi termini e accetta questa offerta firmando e datando questo accordo entro il {offer_expiration_date}.</p>\r\n                    \r\n                    \r\n                    <p>Cordiali saluti,</p>\r\n                    \r\n                    <p>{app_name}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(9,'ja','<p style=\"text-align: center;\"><span style=\"font-size: 18pt;\"><strong>内定通知</strong></span></p>\r\n                    \r\n                    \r\n                    <p>{applicant_name} 様</p>\r\n                    \r\n                    <p>{app_name} は、あなたを {job_title} として迎えることに興奮しています。</p>\r\n                    \r\n                    <p>仕事に取り掛かる前に、ほんの少しの手続きがありました。時間をかけて正式なオファーを確認してください。これには、あなたの報酬、福利厚生、および {app_name} での予想される雇用条件に関する重要な詳細が含まれています。</p>\r\n                    \r\n                    <p>{app_name} が {job_type} を提供しています。 {job_title} として、{start_date} から {workplace_location} の直属のマネージャー/スーパーバイザーに報告します。予想される勤務時間は {days_of_week} です。</p>\r\n                    \r\n                    <p>このポジションでは、{app_name} は、{salary_type} あたり {salary} の賃金率であなたをスタートさせることを提案しています。 {salary_duration} 単位で支払われます。</p>\r\n                    \r\n                    <p>報酬の一部として、該当する場合は提供もしていました。ボーナス、利益分配、手数料体系、ストック オプション、および報酬委員会の規則についてここに説明します。</p>\r\n                    \r\n                    <p>{app_name} の従業員として、健康保険、ストック プラン、歯科保険などの簡単な名前の特典を受ける資格があります。</p>\r\n                    \r\n                    <p>{offer_expiration_date} 日までに本契約に署名し日付を記入して、これらの条件に同意し、このオファーを受け入れてください。</p>\r\n                    \r\n                    <p>心から、</p>\r\n                    \r\n                    <p>{app_name}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(10,'nl','<p style=\"text-align: center;\"><span style=\"font-size: 18pt;\"><strong>Aanbiedingsbrief</strong></span></p>\r\n                    \r\n                    \r\n                    \r\n                    <p>Beste {applicant_name},</p>\r\n                    \r\n                    \r\n                    \r\n                    <p>{app_name} is verheugd je aan boord te mogen verwelkomen als {job_title}.</p>\r\n                    \r\n                    \r\n                    \r\n                    <p>Waren slechts een paar formaliteiten verwijderd om aan het werk te gaan. Neem de tijd om ons formele aanbod te bekijken. Het bevat belangrijke details over uw vergoeding, voordelen en de voorwaarden van uw verwachte dienstverband bij {app_name}.</p>\r\n                    \r\n                    \r\n                    \r\n                    <p>{app_name} biedt een {job_type} aan. functie voor jou als {job_title}, rapporterend aan directe manager/supervisor vanaf {start_date} op {workplace_location}. De verwachte werkuren zijn {days_of_week}.</p>\r\n                    \r\n                    \r\n                    \r\n                    <p>In deze functie biedt {app_name} aan om je te starten tegen een salaris van {salary} per {salary_type}. U wordt betaald op basis van {salary_duration}.</p>\r\n                    \r\n                    \r\n                    \r\n                    <p>Als onderdeel van uw vergoeding, die u, indien van toepassing, ook aanbiedt, beschrijft u hier uw bonus, winstdeling, commissiestructuur, aandelenopties en regels van het vergoedingscomit&eacute;.</p>\r\n                    \r\n                    \r\n                    \r\n                    <p>Als medewerker van {app_name} kom je in aanmerking voor korte naamvoordelen, zoals een ziektekostenverzekering, aandelenplan, tandartsverzekering, enz.</p>\r\n                    \r\n                    \r\n                    \r\n                    <p>Geef aan dat u akkoord gaat met deze voorwaarden en accepteer deze aanbieding door deze overeenkomst op of v&oacute;&oacute;r {offer_expiration_date} te ondertekenen en te dateren.</p>\r\n                    \r\n                    \r\n                    \r\n                    <p>Eerlijk,</p>\r\n                    \r\n                    <p>{app_name}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(11,'pl','<p style=\"text-align: center;\"><strong><span style=\"font-size: 18pt;\">List ofertowy</span></strong></p>\r\n                    \r\n                    <p>Drogi {applicant_name},</p>\r\n                    \r\n                    <p>{app_name} z radością zaprasza Cię do wsp&oacute;łpracy jako {job_title}.</p>\r\n                    \r\n                    <p>Od rozpoczęcia pracy dzieliło mnie tylko kilka formalności. Prosimy o poświęcenie czasu na zapoznanie się z naszą oficjalną ofertą. Zawiera ważne szczeg&oacute;ły dotyczące Twojego wynagrodzenia, świadczeń oraz warunk&oacute;w Twojego przewidywanego zatrudnienia w {app_name}.</p>\r\n                    \r\n                    \r\n                    <p>{app_name} oferuje {job_type}. stanowisko dla Ciebie jako {job_title}, raportowanie do bezpośredniego przełożonego/przełożonego począwszy od {start_date} w {workplace_location}. Przewidywane godziny pracy to {days_of_week}.</p>\r\n                    \r\n                    \r\n                    <p>Na tym stanowisku {app_name} oferuje Ci rozpoczęcie pracy za stawkę {salary} za {salary_type}. Otrzymasz zapłatę na podstawie {salary_duration}.</p>\r\n                    \r\n                    \r\n                    <p>W ramach wynagrodzenia, kt&oacute;re oferowaliśmy, jeśli dotyczy, opiszesz tutaj swoją premię, podział zysk&oacute;w, strukturę prowizji, opcje na akcje i zasady komitetu ds. Wynagrodzeń.</p>\r\n                    \r\n                    \r\n                    <p>Jako pracownik {app_name} będziesz mieć prawo do kr&oacute;tkich imiennych świadczeń, takich jak ubezpieczenie zdrowotne, plan akcji, ubezpieczenie dentystyczne itp.</p>\r\n                    \r\n                    <p>Zaznacz, że zgadzasz się z tymi warunkami i zaakceptuj tę ofertę, podpisując i datując tę ​​umowę w dniu {offer_expiration_date} lub wcześniej.</p>\r\n                    \r\n                    <p>Z poważaniem,</p>\r\n                    \r\n                    <p>{app_name}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(12,'pt','<p style=\"text-align: center;\"><span style=\"font-size: 18pt;\"><strong>Carta de oferta</strong></span></p>\r\n                    \r\n                    \r\n                    <p>Prezado {applicant_name},</p>\r\n                    \r\n                    \r\n                    <p>{app_name} tem o prazer de trazer voc&ecirc; a bordo como {job_title}.</p>\r\n                    \r\n                    \r\n                    <p>Faltavam apenas algumas formalidades para come&ccedil;ar a trabalhar. Por favor, reserve um tempo para revisar nossa oferta formal. Ele inclui detalhes importantes sobre sua remunera&ccedil;&atilde;o, benef&iacute;cios e os termos e condi&ccedil;&otilde;es de seu emprego previsto com {app_name}.</p>\r\n                    \r\n                    \r\n                    <p>{app_name} est&aacute; oferecendo um {job_type}. posi&ccedil;&atilde;o para voc&ecirc; como {job_title}, reportando-se ao gerente/supervisor imediato a partir de {start_date} em {workplace_location}. As horas de trabalho previstas s&atilde;o {days_of_week}.</p>\r\n                    \r\n                    \r\n                    <p>Nesta posi&ccedil;&atilde;o, {app_name} est&aacute; oferecendo para voc&ecirc; come&ccedil;ar com uma taxa de pagamento de {salary} por {salary_type}. Voc&ecirc; ser&aacute; pago em uma base de {salary_duration}.</p>\r\n                    \r\n                    \r\n                    <p>Como parte de sua remunera&ccedil;&atilde;o, tamb&eacute;m oferecida, se aplic&aacute;vel, voc&ecirc; descrever&aacute; seu b&ocirc;nus, participa&ccedil;&atilde;o nos lucros, estrutura de comiss&otilde;es, op&ccedil;&otilde;es de a&ccedil;&otilde;es e regras do comit&ecirc; de remunera&ccedil;&atilde;o aqui.</p>\r\n                    \r\n                    \r\n                    <p>Como funcion&aacute;rio de {app_name} , voc&ecirc; se qualificar&aacute; para benef&iacute;cios de nome breve, como seguro sa&uacute;de, plano de a&ccedil;&otilde;es, seguro odontol&oacute;gico etc.</p>\r\n                    \r\n                    \r\n                    <p>Indique sua concord&acirc;ncia com estes termos e aceite esta oferta assinando e datando este contrato em ou antes de {offer_expiration_date}.</p>\r\n                    \r\n                    \r\n                    <p>Sinceramente,</p>\r\n                    \r\n                    <p>{app_name}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(13,'ru','<p style=\"text-align: center;\"><span style=\"font-size: 18pt;\"><strong>Письмо с предложением</strong></span></p>\r\n                    \r\n                    \r\n                    <p>Уважаемый {applicant_name!</p>\r\n                    \r\n                    \r\n                    <p>{app_name} рад предложить вам присоединиться к нам в качестве {job_title}.</p>\r\n                    \r\n                    \r\n                    <p>Осталось всего несколько формальностей, чтобы приступить к работе. Пожалуйста, найдите время, чтобы ознакомиться с нашим официальным предложением. В нем содержится важная информация о вашем вознаграждении, льготах и ​​условиях вашего предполагаемого трудоустройства в {app_name}.</p>\r\n                    \r\n                    \r\n                    <p>{app_name} предлагает {job_type}. должность для вас как {job_title}, подчинение непосредственному руководителю/руководителю начиная с {start_date} в {workplace_location}. Ожидаемое рабочее время: {days_of_week}.</p>\r\n                    \r\n                    \r\n                    <p>На этой должности {app_name} предлагает вам начать работу со ставкой заработной платы {salary} за {salary_type}. Вам будут платить на основе {salary_duration}.</p>\r\n                    \r\n                    \r\n                    <p>В рамках вашего вознаграждения мы также предлагаем, если это применимо, вы описываете свой бонус, распределение прибыли, структуру комиссионных, опционы на акции и правила компенсационного комитета здесь.</p>\r\n                    \r\n                    \r\n                    <p>Как сотрудник {app_name}, вы будете иметь право на краткосрочные льготы, такие как медицинская страховка, план акций, стоматологическая страховка и т. д.</p>\r\n                    \r\n                    \r\n                    <p>Пожалуйста, подтвердите свое согласие с этими условиями и примите это предложение, подписав и датировав это соглашение не позднее {offer_expiration_date}.</p>\r\n                    \r\n                    \r\n                    <p>Искренне,</p>\r\n                    <p>{app_name}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(14,'tr','<p style=\"text-align: center;\"><strong>Teklif mektubu</strong></p>\r\n                    \r\n                    <p>Canım {applicant_name},</p>\r\n                    \r\n                    <p>{app_name} olarak sizi gemiye getirmekten heyecan duyuyor {job_title}.</p>\r\n                    \r\n                    <p>İşe başlamaktan sadece birkaç formalite uzaktaydı. Lütfen resmi teklifimizi incelemek için zaman ayırın. Tazminatınız, sosyal yardımlarınız ve sizin için öngörülen istihdamınızın hüküm ve koşulları hakkında önemli ayrıntıları içerir. {app_name}.</p>\r\n                    \r\n                    <p>{app_name} teklif ediyor {job_type}. senin için pozisyon {job_title}, [acil yöneticiye/denetçiye] raporlama, şu tarihten itibaren {start_date} de{workplace_location}. Beklenen çalışma saatleri{days_of_week}.</p>\r\n                    \r\n                    <p>Bu pozisyonda, {app_name} size bir ödeme oranıyla başlamayı teklif ediyor {salary} başına {salary_type}. size bir ödeme yapılacak{salary_duration} temel.&nbsp;</p>\r\n                    \r\n                    <p>Tazminatınızın bir parçası olarak [varsa, ikramiyenizi, kâr paylaşımınızı, komisyon yapınızı, hisse senedi opsiyonlarınızı ve ücret komitesi kurallarınızı burada açıklayacaksınız].</p>\r\n                    \r\n                    <p>çalışanı olarak {app_name} , sağlık sigortası, stok planı, diş sigortası vb. gibi kısaca isim haklarına hak kazanacaksınız.</p>\r\n                    \r\n                    <p>Lütfen bu şartları kabul ettiğinizi belirtin ve bu sözleşmeyi tarihinde veya daha önce imzalayarak ve tarih atarak bu teklifi kabul edin {offer_expiration_date}.</p>\r\n                    \r\n                    <p>Samimi olarak,</p>\r\n                    <p>{app_name}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(15,'zh','<p style=\"text-align: center;\"><strong>录取通知书</strong></p>\r\n                    \r\n                    <p>亲爱的 {applicant_name},</p>\r\n                    \r\n                    <p>{app_name} 很高兴邀请您加入 {job_title}.</p>\r\n                    \r\n                    <p>只需要办理一些手续就可以开始工作了。请花时间查看我们的正式报价。它包括有关您的薪酬、福利以及您预期就业的条款和条件的重要详细信息 {app_name}.</p>\r\n                    \r\n                    <p>{app_name} 正在提供 {job_type}. 为您定位为 {job_title}, 向[直接经理/主管]汇报工作开始 {start_date} 在{workplace_location}. 预计工作时间为{days_of_week}.</p>\r\n                    \r\n                    <p>在这个位置, {app_name} 提供给你的起始工资为 {salary} 每 {salary_type}. 您将获得报酬{salary_duration} 基础.&nbsp;</p>\r\n                    \r\n                    <p>作为薪酬的一部分，我们还提供[如果适用，您将在此处描述您的奖金、利润分享、佣金结构、股票期权和薪酬委员会规则].</p>\r\n                    \r\n                    <p>作为一名员工 {app_name} , 您将有资格获得简单的福利，例如健康保险、股票计划、牙科保险等.</p>\r\n                    \r\n                    <p>请在以下日期或之前签署本协议并注明日期，以表明您同意这些条款并接受本要约 {offer_expiration_date}.</p>\r\n                    \r\n                    <p>真挚地,</p>\r\n                    <p>{app_name}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(16,'he','<p style=\"text-align: center;\"><strong>מכתב הצעה</strong></p>\r\n                    \r\n                    <p>יָקָר {applicant_name},</p>\r\n                    \r\n                    <p>{app_name} נרגש להעלות אותך לסיפון {job_title}.</p>\r\n                    \r\n                    <p>היו רק כמה הליכים פורמליים מלהגיע לעבודה. אנא הקדישו זמן לעיון בהצעה הרשמית שלנו. הוא כולל פרטים חשובים על התגמול שלך, ההטבות והתנאים וההגבלות של העסקה הצפויה שלך {app_name}.</p>\r\n                    \r\n                    <p>{app_name} מציעה א {job_type}. עמדה עבורך כ {job_title}, דיווח ל[מנהל/מפקח מיידי] החל מהיום {start_date} בְּ-{workplace_location}. שעות העבודה הצפויות הן{days_of_week}.</p>\r\n                    \r\n                    <p>בתפקיד הזה, {app_name} מציעה להתחיל אותך בשיעור שכר של {salary} לְכָל {salary_type}. תשולם לך על א{salary_duration} בָּסִיס.&nbsp;</p>\r\n                    \r\n                    <p>כחלק מהתגמול שלך, הוצעו גם [אם רלוונטי, תתאר את הבונוס שלך, חלוקת הרווחים, מבנה העמלות, אופציות למניות וכללי ועדת התגמול שלך כאן].</p>\r\n                    \r\n                    <p>בתור עובד של {app_name} , אתה תהיה זכאי להטבות עם שם קצר, כגון ביטוח בריאות, תוכנית מניות, ביטוח שיניים וכו.</p>\r\n                    \r\n                    <p>אנא ציין את הסכמתך לתנאים אלה וקבל הצעה זו על ידי חתימה ותיארוך על הסכם זה או לפני כן {offer_expiration_date}.</p>\r\n                    \r\n                    <p>בכנות,</p>\r\n                    <p>{app_name}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(17,'pt-br','<p style=\"text-align: center;\"><span style=\"font-size: 18pt;\"><strong>Carta de oferta</strong></span></p>\r\n                    \r\n                    <p>Prezado {applicant_name},</p>\r\n                    \r\n                    <p>{app_name} tem o prazer de trazer voc&ecirc; a bordo como {job_title}.</p>\r\n                    \r\n                    <p>Faltavam apenas algumas formalidades para come&ccedil;ar a trabalhar. Por favor, reserve um tempo para revisar nossa oferta formal. Ele inclui detalhes importantes sobre sua remunera&ccedil;&atilde;o, benef&iacute;cios e os termos e condi&ccedil;&otilde;es de seu emprego previsto com {app_name}.</p>\r\n                    \r\n                    <p>{app_name} est&aacute; oferecendo um {job_type}. posi&ccedil;&atilde;o para voc&ecirc; como {job_title}, reportando-se ao gerente/supervisor imediato a partir de {start_date} em {workplace_location}. As horas de trabalho previstas s&atilde;o {days_of_week}.</p>\r\n                    \r\n                    <p>Nesta posi&ccedil;&atilde;o, {app_name} est&aacute; oferecendo para voc&ecirc; come&ccedil;ar com uma taxa de pagamento de {salary} por {salary_type}. Voc&ecirc; ser&aacute; pago em uma base de {salary_duration}.</p>\r\n                    \r\n                    <p>Como parte de sua remunera&ccedil;&atilde;o, tamb&eacute;m oferecida, se aplic&aacute;vel, voc&ecirc; descrever&aacute; seu b&ocirc;nus, participa&ccedil;&atilde;o nos lucros, estrutura de comiss&otilde;es, op&ccedil;&otilde;es de a&ccedil;&otilde;es e regras do comit&ecirc; de remunera&ccedil;&atilde;o aqui.</p>\r\n                    \r\n                    <p>Como funcion&aacute;rio de {app_name} , voc&ecirc; se qualificar&aacute; para benef&iacute;cios de nome breve, como seguro sa&uacute;de, plano de a&ccedil;&otilde;es, seguro odontol&oacute;gico etc.</p>\r\n                    \r\n                    <p>Indique sua concord&acirc;ncia com estes termos e aceite esta oferta assinando e datando este contrato em ou antes de {offer_expiration_date}.</p>\r\n                    \r\n                    <p>Sinceramente,</p>\r\n                    \r\n                    <p>{app_name}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47');
/*!40000 ALTER TABLE `generate_offer_letters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genrate_payslip_options`
--

DROP TABLE IF EXISTS `genrate_payslip_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genrate_payslip_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genrate_payslip_options`
--

LOCK TABLES `genrate_payslip_options` WRITE;
/*!40000 ALTER TABLE `genrate_payslip_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `genrate_payslip_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goal_trackings`
--

DROP TABLE IF EXISTS `goal_trackings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goal_trackings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch` int NOT NULL,
  `goal_type` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_achievement` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` int NOT NULL DEFAULT '0',
  `progress` int NOT NULL DEFAULT '0',
  `created_by` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goal_trackings`
--

LOCK TABLES `goal_trackings` WRITE;
/*!40000 ALTER TABLE `goal_trackings` DISABLE KEYS */;
/*!40000 ALTER TABLE `goal_trackings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goal_types`
--

DROP TABLE IF EXISTS `goal_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goal_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goal_types`
--

LOCK TABLES `goal_types` WRITE;
/*!40000 ALTER TABLE `goal_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `goal_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `holidays`
--

DROP TABLE IF EXISTS `holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `holidays` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `occasion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holidays`
--

LOCK TABLES `holidays` WRITE;
/*!40000 ALTER TABLE `holidays` DISABLE KEYS */;
/*!40000 ALTER TABLE `holidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `income_types`
--

DROP TABLE IF EXISTS `income_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `income_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `income_types`
--

LOCK TABLES `income_types` WRITE;
/*!40000 ALTER TABLE `income_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `income_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indicators`
--

DROP TABLE IF EXISTS `indicators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `indicators` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch` int NOT NULL DEFAULT '0',
  `department` int NOT NULL DEFAULT '0',
  `designation` int NOT NULL DEFAULT '0',
  `rating` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_experience` int NOT NULL DEFAULT '0',
  `marketing` int NOT NULL DEFAULT '0',
  `administration` int NOT NULL DEFAULT '0',
  `professionalism` int NOT NULL DEFAULT '0',
  `integrity` int NOT NULL DEFAULT '0',
  `attendance` int NOT NULL DEFAULT '0',
  `created_user` int NOT NULL DEFAULT '0',
  `created_by` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indicators`
--

LOCK TABLES `indicators` WRITE;
/*!40000 ALTER TABLE `indicators` DISABLE KEYS */;
/*!40000 ALTER TABLE `indicators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interview_schedules`
--

DROP TABLE IF EXISTS `interview_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interview_schedules` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `candidate` int NOT NULL,
  `employee` int NOT NULL DEFAULT '0',
  `date` date NOT NULL,
  `time` time NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `employee_response` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interview_schedules`
--

LOCK TABLES `interview_schedules` WRITE;
/*!40000 ALTER TABLE `interview_schedules` DISABLE KEYS */;
/*!40000 ALTER TABLE `interview_schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_restricts`
--

DROP TABLE IF EXISTS `ip_restricts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_restricts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_restricts`
--

LOCK TABLES `ip_restricts` WRITE;
/*!40000 ALTER TABLE `ip_restricts` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_restricts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_application_notes`
--

DROP TABLE IF EXISTS `job_application_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_application_notes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `application_id` int NOT NULL DEFAULT '0',
  `note_created` int NOT NULL DEFAULT '0',
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_by` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_application_notes`
--

LOCK TABLES `job_application_notes` WRITE;
/*!40000 ALTER TABLE `job_application_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_application_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_applications`
--

DROP TABLE IF EXISTS `job_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_applications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `job` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resume` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_letter` text COLLATE utf8mb4_unicode_ci,
  `dob` date DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stage` int NOT NULL DEFAULT '1',
  `order` int NOT NULL DEFAULT '0',
  `skill` text COLLATE utf8mb4_unicode_ci,
  `rating` int NOT NULL DEFAULT '0',
  `is_archive` int NOT NULL DEFAULT '0',
  `custom_question` text COLLATE utf8mb4_unicode_ci,
  `terms_condition_check` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_applications`
--

LOCK TABLES `job_applications` WRITE;
/*!40000 ALTER TABLE `job_applications` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_categories`
--

DROP TABLE IF EXISTS `job_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_categories`
--

LOCK TABLES `job_categories` WRITE;
/*!40000 ALTER TABLE `job_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_on_boards`
--

DROP TABLE IF EXISTS `job_on_boards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_on_boards` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `application` int NOT NULL,
  `joining_date` date DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `days_of_week` int DEFAULT NULL,
  `salary` double(15,2) DEFAULT NULL,
  `salary_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary_duration` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `convert_to_employee` int NOT NULL DEFAULT '0',
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_on_boards`
--

LOCK TABLES `job_on_boards` WRITE;
/*!40000 ALTER TABLE `job_on_boards` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_on_boards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_stages`
--

DROP TABLE IF EXISTS `job_stages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_stages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '0',
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_stages`
--

LOCK TABLES `job_stages` WRITE;
/*!40000 ALTER TABLE `job_stages` DISABLE KEYS */;
INSERT INTO `job_stages` VALUES (1,'Applied',0,2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(2,'Phone Screen',0,2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(3,'Interview',0,2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(4,'Hired',0,2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(5,'Rejected',0,2,'2025-07-04 00:49:47','2025-07-04 00:49:47');
/*!40000 ALTER TABLE `job_stages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `requirement` text COLLATE utf8mb4_unicode_ci,
  `terms_and_conditions` text COLLATE utf8mb4_unicode_ci,
  `branch` int NOT NULL DEFAULT '0',
  `category` int NOT NULL DEFAULT '0',
  `skill` text COLLATE utf8mb4_unicode_ci,
  `position` int DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `applicant` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visibility` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_question` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
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
-- Table structure for table `join_us`
--

DROP TABLE IF EXISTS `join_us`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `join_us` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `join_us_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `join_us`
--

LOCK TABLES `join_us` WRITE;
/*!40000 ALTER TABLE `join_us` DISABLE KEYS */;
/*!40000 ALTER TABLE `join_us` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `joining_letters`
--

DROP TABLE IF EXISTS `joining_letters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `joining_letters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `joining_letters`
--

LOCK TABLES `joining_letters` WRITE;
/*!40000 ALTER TABLE `joining_letters` DISABLE KEYS */;
INSERT INTO `joining_letters` VALUES (1,'ar','<h2 style=\"text-align: center;\"><strong>خطاب الانضمام</strong></h2>\r\n            <p>{date}</p>\r\n            <p>{employee_name}</p>\r\n            <p>{address}</p>\r\n            <p>الموضوع: موعد لوظيفة {designation}</p>\r\n            <p>عزيزي {employee_name} ،</p>\r\n            <p>يسعدنا أن نقدم لك منصب {designation} مع {app_name} \"الشركة\" وفقًا للشروط التالية و</p>\r\n            <p>الظروف:</p>\r\n            <p>1. بدء العمل</p>\r\n            <p>سيصبح عملك ساريًا اعتبارًا من {start_date}</p>\r\n            <p>2. المسمى الوظيفي</p>\r\n            <p>سيكون المسمى الوظيفي الخاص بك هو {designation}.</p>\r\n            <p>3. الراتب</p>\r\n            <p>سيكون راتبك والمزايا الأخرى على النحو المبين في الجدول 1 ، طيه.</p>\r\n            <p>4. مكان الإرسال</p>\r\n            <p>سيتم إرسالك إلى {branch}. ومع ذلك ، قد يُطلب منك العمل في أي مكان عمل تمتلكه الشركة ، أو</p>\r\n            <p>قد تحصل لاحقًا.</p>\r\n            <p>5. ساعات العمل</p>\r\n            <p>أيام العمل العادية هي من الاثنين إلى الجمعة. سيُطلب منك العمل لساعات حسب الضرورة لـ</p>\r\n            <p>أداء واجباتك على النحو الصحيح تجاه الشركة. ساعات العمل العادية من {start_time} إلى {end_time} وأنت</p>\r\n            <p>من المتوقع أن يعمل ما لا يقل عن {total_hours} ساعة كل أسبوع ، وإذا لزم الأمر لساعات إضافية اعتمادًا على</p>\r\n            <p>المسؤوليات.</p>\r\n            <p>6. الإجازة / العطل</p>\r\n            <p>6.1 يحق لك الحصول على إجازة غير رسمية مدتها 12 يومًا.</p>\r\n            <p>6.2 يحق لك الحصول على إجازة مرضية مدفوعة الأجر لمدة 12 يوم عمل.</p>\r\n            <p>6.3 تخطر الشركة بقائمة الإجازات المعلنة في بداية كل عام.</p>\r\n            <p>7. طبيعة الواجبات</p>\r\n            <p>ستقوم بأداء أفضل ما لديك من واجبات متأصلة في منصبك ومهام إضافية مثل الشركة</p>\r\n            <p>قد يدعوك لأداء ، من وقت لآخر. واجباتك المحددة منصوص عليها في الجدول الثاني بهذه الرسالة.</p>\r\n            <p>8. ممتلكات الشركة</p>\r\n            <p>ستحافظ دائمًا على ممتلكات الشركة في حالة جيدة ، والتي قد يتم تكليفك بها للاستخدام الرسمي خلال فترة عملها</p>\r\n            <p>عملك ، ويجب أن تعيد جميع هذه الممتلكات إلى الشركة قبل التخلي عن الرسوم الخاصة بك ، وإلا فإن التكلفة</p>\r\n            <p>نفس الشيء سوف تسترده منك الشركة.</p>\r\n            <p>9. الاقتراض / قبول الهدايا</p>\r\n            <p>لن تقترض أو تقبل أي أموال أو هدية أو مكافأة أو تعويض مقابل مكاسبك الشخصية من أو تضع نفسك بأي طريقة أخرى</p>\r\n            <p>بموجب التزام مالي تجاه أي شخص / عميل قد تكون لديك تعاملات رسمية معه.</p>\r\n            <p>10. الإنهاء</p>\r\n            <p>10.1 يمكن للشركة إنهاء موعدك ، دون أي سبب ، من خلال إعطائك ما لا يقل عن [إشعار] قبل أشهر</p>\r\n            <p>إشعار خطي أو راتب بدلاً منه. لغرض هذا البند ، يقصد بالراتب المرتب الأساسي.</p>\r\n            <p>10.2 إنهاء عملك مع الشركة ، دون أي سبب ، من خلال تقديم ما لا يقل عن إشعار الموظف</p>\r\n            <p>أشهر الإخطار أو الراتب عن الفترة غير المحفوظة ، المتبقية بعد تعديل الإجازات المعلقة ، كما في التاريخ.</p>\r\n            <p>10.3 تحتفظ الشركة بالحق في إنهاء عملك بإيجاز دون أي فترة إشعار أو مدفوعات إنهاء</p>\r\n            <p>إذا كان لديه سبب معقول للاعتقاد بأنك مذنب بسوء السلوك أو الإهمال ، أو ارتكبت أي خرق جوهري لـ</p>\r\n            <p>العقد ، أو تسبب في أي خسارة للشركة.</p>\r\n            <p>10. 4 عند إنهاء عملك لأي سبب من الأسباب ، ستعيد إلى الشركة جميع ممتلكاتك ؛ المستندات و</p>\r\n            <p>الأوراق الأصلية ونسخها ، بما في ذلك أي عينات ، وأدبيات ، وعقود ، وسجلات ، وقوائم ، ورسومات ، ومخططات ،</p>\r\n            <p>الرسائل والملاحظات والبيانات وما شابه ذلك ؛ والمعلومات السرية التي بحوزتك أو تحت سيطرتك والمتعلقة بك</p>\r\n            <p>التوظيف أو الشؤون التجارية للعملاء.</p>\r\n            <p>11. المعلومات السرية</p>\r\n            <p>11. 1 أثناء عملك في الشركة ، سوف تكرس وقتك واهتمامك ومهارتك كلها بأفضل ما لديك من قدرات</p>\r\n            <p>عملها. لا يجوز لك ، بشكل مباشر أو غير مباشر ، الانخراط أو الارتباط بنفسك ، أو الارتباط به ، أو القلق ، أو التوظيف ، أو</p>\r\n            <p>الوقت أو متابعة أي دورة دراسية على الإطلاق ، دون الحصول على إذن مسبق من الشركة أو الانخراط في أي عمل آخر أو</p>\r\n            <p>الأنشطة أو أي وظيفة أخرى أو العمل بدوام جزئي أو متابعة أي دورة دراسية على الإطلاق ، دون إذن مسبق من</p>\r\n            <p>شركة.</p>\r\n            <p>11. المعلومات السرية</p>\r\n            <p>11. 1 أثناء عملك في الشركة ، سوف تكرس وقتك واهتمامك ومهارتك كلها بأفضل ما لديك من قدرات</p>\r\n            <p>عملها. لا يجوز لك ، بشكل مباشر أو غير مباشر ، الانخراط أو الارتباط بنفسك ، أو الارتباط به ، أو القلق ، أو التوظيف ، أو</p>\r\n            <p>الوقت أو متابعة أي دورة دراسية على الإطلاق ، دون الحصول على إذن مسبق من الشركة أو الانخراط في أي عمل آخر أو</p>\r\n            <p>الأنشطة أو أي وظيفة أخرى أو العمل بدوام جزئي أو متابعة أي دورة دراسية على الإطلاق ، دون إذن مسبق من</p>\r\n            <p>شركة.</p>\r\n            <p>11.2 يجب عليك دائمًا الحفاظ على أعلى درجة من السرية والحفاظ على سرية السجلات والوثائق وغيرها</p>\r\n            <p>المعلومات السرية المتعلقة بأعمال الشركة والتي قد تكون معروفة لك أو مخولة لك بأي وسيلة</p>\r\n            <p>ولن تستخدم هذه السجلات والمستندات والمعلومات إلا بالطريقة المصرح بها حسب الأصول لصالح الشركة. إلى عن على</p>\r\n            <p>أغراض هذا البند \"المعلومات السرية\" تعني المعلومات المتعلقة بأعمال الشركة وعملائها</p>\r\n            <p>التي لا تتوفر لعامة الناس والتي قد تتعلمها أثناء عملك. هذا يشمل،</p>\r\n            <p>على سبيل المثال لا الحصر ، المعلومات المتعلقة بالمنظمة وقوائم العملاء وسياسات التوظيف والموظفين والمعلومات</p>\r\n            <p>حول منتجات الشركة وعملياتها بما في ذلك الأفكار والمفاهيم والإسقاطات والتكنولوجيا والكتيبات والرسم والتصاميم ،</p>\r\n            <p>المواصفات وجميع الأوراق والسير الذاتية والسجلات والمستندات الأخرى التي تحتوي على هذه المعلومات السرية.</p>\r\n            <p>11.3 لن تقوم في أي وقت بإزالة أي معلومات سرية من المكتب دون إذن.</p>\r\n            <p>11.4 واجبك في الحماية وعدم الإفشاء</p>\r\n            <p>تظل المعلومات السرية سارية بعد انتهاء أو إنهاء هذه الاتفاقية و / أو عملك مع الشركة.</p>\r\n            <p>11.5 سوف يجعلك خرق شروط هذا البند عرضة للفصل بإجراءات موجزة بموجب الفقرة أعلاه بالإضافة إلى أي</p>\r\n            <p>أي تعويض آخر قد يكون للشركة ضدك في القانون.</p>\r\n            <p>12. الإخطارات</p>\r\n            <p>يجوز لك إرسال إخطارات إلى الشركة على عنوان مكتبها المسجل. يمكن أن ترسل لك الشركة إشعارات على</p>\r\n            <p>العنوان الذي أشرت إليه في السجلات الرسمية.</p>\r\n            <p>13. تطبيق سياسة الشركة</p>\r\n            <p>يحق للشركة تقديم إعلانات السياسة من وقت لآخر فيما يتعلق بمسائل مثل استحقاق الإجازة والأمومة</p>\r\n            <p>الإجازة ، ومزايا الموظفين ، وساعات العمل ، وسياسات النقل ، وما إلى ذلك ، ويمكن تغييرها من وقت لآخر وفقًا لتقديرها الخاص.</p>\r\n            <p>جميع قرارات سياسة الشركة هذه ملزمة لك ويجب أن تلغي هذه الاتفاقية إلى هذا الحد.</p>\r\n            <p>14. القانون الحاكم / الاختصاص القضائي</p>\r\n            <p>يخضع عملك في الشركة لقوانين الدولة. تخضع جميع النزاعات للاختصاص القضائي للمحكمة العليا</p>\r\n            <p>غوجارات فقط.</p>\r\n            <p>15. قبول عرضنا</p>\r\n            <p>يرجى تأكيد قبولك لعقد العمل هذا من خلال التوقيع وإعادة النسخة المكررة.</p>\r\n            <p>نرحب بكم ونتطلع إلى تلقي موافقتكم والعمل معكم.</p>\r\n            <p>تفضلوا بقبول فائق الاحترام،</p>\r\n            <p>{app_name}</p>\r\n            <p>{date}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(2,'da','<h3 style=\"text-align: center;\"><strong>Tilslutningsbrev</strong></h3>\r\n            \r\n            <p>{date}</p>\r\n            <p>{employee_name}</p>\r\n            <p>{address}</p>\r\n            <p>Emne: Udn&aelig;vnelse til stillingen som {designation}</p>\r\n            <p>K&aelig;re {employee_name}</p>\r\n            <p>Vi er glade for at kunne tilbyde dig stillingen som {designation} hos {app_name} \"Virksomheden\" p&aring; f&oslash;lgende vilk&aring;r og</p>\r\n            <p>betingelser:</p>\r\n            <p>1. P&aring;begyndelse af ans&aelig;ttelse</p>\r\n            <p>Din ans&aelig;ttelse tr&aelig;der i kraft fra {start_date}</p>\r\n            <p>2. Jobtitel</p>\r\n            <p>Din jobtitel vil v&aelig;re {designation}.</p>\r\n            <p>3. L&oslash;n</p>\r\n            <p>Din l&oslash;n og andre goder vil v&aelig;re som angivet i skema 1, hertil.</p>\r\n            <p>4. Udstationeringssted</p>\r\n            <p>Du vil blive sl&aring;et op p&aring; {branch}. Du kan dog blive bedt om at arbejde p&aring; ethvert forretningssted, som virksomheden har, eller</p>\r\n            <p>senere kan erhverve.</p>\r\n            \r\n            \r\n            <p>5. Arbejdstimer</p>\r\n            \r\n            <p>De normale arbejdsdage er mandag til fredag. Du vil blive forpligtet til at arbejde i de timer, som er n&oslash;dvendige for</p>\r\n            \r\n            <p>beh&oslash;rig varetagelse af dine pligter over for virksomheden. Den normale arbejdstid er fra {start_time} til {end_time}, og det er du</p>\r\n            \r\n            <p>forventes at arbejde ikke mindre end {total_hours} timer hver uge, og om n&oslash;dvendigt yderligere timer afh&aelig;ngigt af din</p>\r\n            \r\n            <p>ansvar.</p>\r\n            \r\n            \r\n            \r\n            <p>6. Orlov/Ferie</p>\r\n            \r\n            <p>6.1 Du har ret til tilf&aelig;ldig ferie p&aring; 12 dage.</p>\r\n            \r\n            <p>6.2 Du har ret til 12 arbejdsdages sygefrav&aelig;r med l&oslash;n.</p>\r\n            \r\n            <p>6.3 Virksomheden skal meddele en liste over erkl&aelig;rede helligdage i begyndelsen af ​​hvert &aring;r.</p>\r\n            \r\n            \r\n            \r\n            <p>7. Arbejdsopgavernes art</p>\r\n            \r\n            <p>Du vil efter bedste evne udf&oslash;re alle de opgaver, der er iboende i din stilling og s&aring;danne yderligere opgaver som virksomheden</p>\r\n            \r\n            <p>kan opfordre dig til at optr&aelig;de, fra tid til anden. Dine specifikke pligter er beskrevet i skema II hertil.</p>\r\n            \r\n            \r\n            <p>8. Firmaejendom</p>\r\n            \r\n            <p>Du vil altid vedligeholde virksomhedens ejendom i god stand, som kan blive overdraget til dig til officiel brug i l&oslash;bet af</p>\r\n            \r\n            <p>din ans&aelig;ttelse, og skal returnere al s&aring;dan ejendom til virksomheden, f&oslash;r du opgiver din afgift, i modsat fald vil omkostningerne</p>\r\n            \r\n            <p>af samme vil blive inddrevet fra dig af virksomheden.</p>\r\n            \r\n            \r\n            \r\n            <p>9. L&aring;n/modtagelse af gaver</p>\r\n            \r\n            <p>Du vil ikke l&aring;ne eller acceptere nogen penge, gave, bel&oslash;nning eller kompensation for dine personlige gevinster fra eller p&aring; anden m&aring;de placere dig selv</p>\r\n            \r\n            <p>under en &oslash;konomisk forpligtelse over for enhver person/kunde, som du m&aring;tte have officielle forbindelser med.</p>\r\n            \r\n            <p>10. Opsigelse</p>\r\n            \r\n            <p>10.1 Din ans&aelig;ttelse kan opsiges af virksomheden uden nogen grund ved at give dig mindst [varsel] m&aring;neder f&oslash;r</p>\r\n            \r\n            <p>skriftligt varsel eller l&oslash;n i stedet herfor. Ved l&oslash;n forst&aring;s i denne paragraf grundl&oslash;n.</p>\r\n            \r\n            <p>10.2 Du kan opsige dit ans&aelig;ttelsesforhold i virksomheden uden nogen grund ved at give mindst [Medarbejdermeddelelse]</p>\r\n            \r\n            <p>m&aring;neders forudg&aring;ende varsel eller l&oslash;n for den ikke-opsparede periode, tilbage efter regulering af afventende orlov, som p&aring; dato.</p>\r\n            \r\n            <p>10.3 Virksomheden forbeholder sig retten til at opsige dit ans&aelig;ttelsesforhold midlertidigt uden opsigelsesfrist eller opsigelsesbetaling</p>\r\n            \r\n            <p>hvis den har rimelig grund til at tro, at du er skyldig i forseelse eller uagtsomhed, eller har beg&aring;et et grundl&aelig;ggende brud p&aring;</p>\r\n            \r\n            <p>kontrakt, eller for&aring;rsaget tab for virksomheden.</p>\r\n            \r\n            <p>10. 4 Ved oph&oslash;r af din ans&aelig;ttelse uanset &aring;rsag, vil du returnere al ejendom til virksomheden; dokumenter, og</p>\r\n            \r\n            <p>papir, b&aring;de originale og kopier heraf, inklusive pr&oslash;ver, litteratur, kontrakter, optegnelser, lister, tegninger, tegninger,</p>\r\n            \r\n            <p>breve, notater, data og lignende; og fortrolige oplysninger, i din besiddelse eller under din kontrol vedr&oslash;rende din</p>\r\n            \r\n            <p>ans&aelig;ttelse eller til kunders forretningsforhold.</p>\r\n            <p>11. Fortrolige oplysninger</p>\r\n            \r\n            <p>11. 1 Under din ans&aelig;ttelse i virksomheden vil du bruge al din tid, opm&aelig;rksomhed og dygtighed efter bedste evne til</p>\r\n            \r\n            <p>sin virksomhed. Du m&aring; ikke, direkte eller indirekte, engagere eller associere dig med, v&aelig;re forbundet med, bekymret, ansat eller</p>\r\n            \r\n            <p>tid eller forf&oslash;lge et hvilket som helst studieforl&oslash;b uden forudg&aring;ende tilladelse fra virksomheden. involveret i anden virksomhed eller</p>\r\n            \r\n            <p>aktiviteter eller enhver anden stilling eller arbejde p&aring; deltid eller forf&oslash;lge ethvert studieforl&oslash;b uden forudg&aring;ende tilladelse fra</p>\r\n            \r\n            <p>Selskab.</p>\r\n            <p>11.2 Du skal altid opretholde den h&oslash;jeste grad af fortrolighed og opbevare optegnelser, dokumenter og andre fortrolige oplysninger.</p>\r\n            \r\n            <p>Fortrolige oplysninger vedr&oslash;rende virksomhedens virksomhed, som kan v&aelig;re kendt af dig eller betroet dig p&aring; nogen m&aring;de</p>\r\n            \r\n            <p>og du vil kun bruge s&aring;danne optegnelser, dokumenter og oplysninger p&aring; en beh&oslash;rigt autoriseret m&aring;de i virksomhedens interesse. Til</p>\r\n            \r\n            <p>form&aring;lene med denne paragraf \"Fortrolige oplysninger\" betyder oplysninger om virksomhedens og dets kunders forretning</p>\r\n            \r\n            <p>som ikke er tilg&aelig;ngelig for offentligheden, og som du kan l&aelig;re i l&oslash;bet af din ans&aelig;ttelse. Dette inkluderer,</p>\r\n            \r\n            <p>men er ikke begr&aelig;nset til information vedr&oslash;rende organisationen, dens kundelister, ans&aelig;ttelsespolitikker, personale og information</p>\r\n            \r\n            <p>om virksomhedens produkter, processer, herunder ideer, koncepter, projektioner, teknologi, manualer, tegning, design,</p>\r\n            \r\n            <p>specifikationer og alle papirer, CVer, optegnelser og andre dokumenter, der indeholder s&aring;danne fortrolige oplysninger.</p>\r\n            \r\n            <p>11.3 Du vil p&aring; intet tidspunkt fjerne fortrolige oplysninger fra kontoret uden tilladelse.</p>\r\n            \r\n            <p>11.4 Din pligt til at beskytte og ikke oplyse</p>\r\n            \r\n            <p>e Fortrolige oplysninger vil overleve udl&oslash;bet eller opsigelsen af ​​denne aftale og/eller din ans&aelig;ttelse hos virksomheden.</p>\r\n            \r\n            <p>11.5 Overtr&aelig;delse af betingelserne i denne klausul vil g&oslash;re dig ansvarlig for midlertidig afskedigelse i henhold til klausulen ovenfor ud over evt.</p>\r\n            \r\n            <p>andre retsmidler, som virksomheden m&aring;tte have mod dig i henhold til loven.</p>\r\n            <p>12. Meddelelser</p>\r\n            \r\n            <p>Meddelelser kan gives af dig til virksomheden p&aring; dets registrerede kontoradresse. Meddelelser kan gives af virksomheden til dig p&aring;</p>\r\n            \r\n            <p>den adresse, du har angivet i de officielle optegnelser.</p>\r\n            \r\n            \r\n            \r\n            <p>13. Anvendelse af virksomhedens politik</p>\r\n            \r\n            <p>Virksomheden er berettiget til fra tid til anden at afgive politiske erkl&aelig;ringer vedr&oslash;rende sager som ret til orlov, barsel</p>\r\n            \r\n            <p>orlov, ansattes ydelser, arbejdstider, overf&oslash;rselspolitikker osv., og kan &aelig;ndre det samme fra tid til anden efter eget sk&oslash;n.</p>\r\n            \r\n            <p>Alle s&aring;danne politiske beslutninger fra virksomheden er bindende for dig og tilsides&aelig;tter denne aftale i det omfang.</p>\r\n            \r\n            \r\n            \r\n            <p>14. G&aelig;ldende lov/Jurisdiktion</p>\r\n            \r\n            <p>Din ans&aelig;ttelse hos virksomheden er underlagt landets love. Alle tvister er underlagt High Courts jurisdiktion</p>\r\n            \r\n            <p>Kun Gujarat.</p>\r\n            \r\n            \r\n            \r\n            <p>15. Accept af vores tilbud</p>\r\n            \r\n            <p>Bekr&aelig;ft venligst din accept af denne ans&aelig;ttelseskontrakt ved at underskrive og returnere kopien.</p>\r\n            \r\n            \r\n            \r\n            <p>Vi byder dig velkommen og ser frem til at modtage din accept og til at arbejde sammen med dig.</p>\r\n            \r\n            \r\n            \r\n            <p>Venlig hilsen,</p>\r\n            \r\n            <p>{app_name}</p>\r\n            \r\n            <p>{date}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(3,'de','<h3 style=\"text-align: center;\"><strong>Beitrittsbrief</strong></h3>\r\n            \r\n            <p>{date}</p>\r\n            <p>{employee_name}</p>\r\n            <p>{address}</p>\r\n            \r\n            \r\n            \r\n            <p>Betreff: Ernennung f&uuml;r die Stelle von {designation}</p>\r\n            \r\n            \r\n            \r\n            \r\n            \r\n            \r\n            \r\n            <p>Sehr geehrter {employee_name},</p>\r\n            \r\n            \r\n            \r\n            <p>Wir freuen uns, Ihnen die Position von {designation} bei {app_name} dem &bdquo;Unternehmen&ldquo; zu den folgenden Bedingungen anbieten zu k&ouml;nnen</p>\r\n            \r\n            <p>Bedingungen:</p>\r\n            \r\n            \r\n            <p>1. Aufnahme des Arbeitsverh&auml;ltnisses</p>\r\n            \r\n            <p>Ihre Anstellung gilt ab dem {start_date}</p>\r\n            \r\n            \r\n            <p>2. Berufsbezeichnung</p>\r\n            \r\n            <p>Ihre Berufsbezeichnung lautet {designation}.</p>\r\n            \r\n            \r\n            <p>3. Gehalt</p>\r\n            \r\n            <p>Ihr Gehalt und andere Leistungen sind in Anhang 1 zu diesem Dokument aufgef&uuml;hrt.</p>\r\n            \r\n            \r\n            <p>4. Postort</p>\r\n            \r\n            <p>Sie werden bei {branch} eingestellt. Es kann jedoch erforderlich sein, dass Sie an jedem Gesch&auml;ftssitz arbeiten, den das Unternehmen hat, oder</p>\r\n            \r\n            <p>sp&auml;ter erwerben kann.</p>\r\n            \r\n            \r\n            <p>5. Arbeitszeit</p>\r\n            <p>Die normalen Arbeitstage sind Montag bis Freitag. Sie m&uuml;ssen so viele Stunden arbeiten, wie es f&uuml;r die erforderlich ist</p>\r\n            <p>ordnungsgem&auml;&szlig;e Erf&uuml;llung Ihrer Pflichten gegen&uuml;ber dem Unternehmen. Die normalen Arbeitszeiten sind von {start_time} bis {end_time} und Sie sind es</p>\r\n            <p>voraussichtlich nicht weniger als {total_hours} Stunden pro Woche arbeiten, und falls erforderlich, abh&auml;ngig von Ihren zus&auml;tzlichen Stunden</p>\r\n            <p>Verantwortlichkeiten.</p>\r\n            \r\n            \r\n            \r\n            <p>6. Urlaub/Urlaub</p>\r\n            \r\n            <p>6.1 Sie haben Anspruch auf Freizeiturlaub von 12 Tagen.</p>\r\n            \r\n            <p>6.2 Sie haben Anspruch auf 12 Arbeitstage bezahlten Krankenurlaub.</p>\r\n            \r\n            <p>6.3 Das Unternehmen teilt zu Beginn jedes Jahres eine Liste der erkl&auml;rten Feiertage mit.</p>\r\n            \r\n            \r\n            \r\n            <p>7. Art der Pflichten</p>\r\n            \r\n            <p>Sie werden alle Aufgaben, die mit Ihrer Funktion verbunden sind, sowie alle zus&auml;tzlichen Aufgaben als Unternehmen nach besten Kr&auml;ften erf&uuml;llen</p>\r\n            \r\n            <p>kann Sie von Zeit zu Zeit zur Leistung auffordern. Ihre spezifischen Pflichten sind in Anhang II zu diesem Dokument aufgef&uuml;hrt.</p>\r\n            \r\n            \r\n            \r\n            <p>8. Firmeneigentum</p>\r\n            \r\n            <p>Sie werden das Firmeneigentum, das Ihnen im Laufe der Zeit f&uuml;r offizielle Zwecke anvertraut werden kann, stets in gutem Zustand halten</p>\r\n            \r\n            <p>Ihrer Anstellung und muss all dieses Eigentum an das Unternehmen zur&uuml;ckgeben, bevor Sie Ihre Geb&uuml;hr aufgeben, andernfalls die Kosten</p>\r\n            \r\n            <p>derselben werden von der Gesellschaft von Ihnen zur&uuml;ckgefordert.</p>\r\n            \r\n            \r\n            \r\n            <p>9. Leihen/Annehmen von Geschenken</p>\r\n            \r\n            <p>Sie werden kein Geld, Geschenk, keine Belohnung oder Entsch&auml;digung f&uuml;r Ihre pers&ouml;nlichen Gewinne von sich leihen oder annehmen oder sich anderweitig platzieren</p>\r\n            \r\n            <p>unter finanzieller Verpflichtung gegen&uuml;ber Personen/Kunden, mit denen Sie m&ouml;glicherweise dienstliche Beziehungen unterhalten.</p>\r\n            \r\n            <p>10. K&uuml;ndigung</p>\r\n            \r\n            <p>10.1 Ihre Ernennung kann vom Unternehmen ohne Angabe von Gr&uuml;nden gek&uuml;ndigt werden, indem es Ihnen mindestens [K&uuml;ndigung] Monate im Voraus mitteilt</p>\r\n            \r\n            <p>schriftliche K&uuml;ndigung oder Gehalt statt dessen. Gehalt im Sinne dieser Klausel bedeutet Grundgehalt.</p>\r\n            \r\n            <p>10.2 Sie k&ouml;nnen Ihre Anstellung beim Unternehmen ohne Angabe von Gr&uuml;nden k&uuml;ndigen, indem Sie mindestens [Mitarbeitermitteilung]</p>\r\n            \r\n            <p>K&uuml;ndigungsfrist von Monaten oder Gehalt f&uuml;r den nicht angesparten Zeitraum, der nach Anpassung der anstehenden Urlaubstage &uuml;brig bleibt, zum Stichtag.</p>\r\n            \r\n            <p>10.3 Das Unternehmen beh&auml;lt sich das Recht vor, Ihr Arbeitsverh&auml;ltnis ohne K&uuml;ndigungsfrist oder Abfindungszahlung fristlos zu k&uuml;ndigen</p>\r\n            \r\n            <p>wenn es begr&uuml;ndeten Anlass zu der Annahme gibt, dass Sie sich eines Fehlverhaltens oder einer Fahrl&auml;ssigkeit schuldig gemacht haben oder einen wesentlichen Versto&szlig; begangen haben</p>\r\n            \r\n            <p>oder dem Unternehmen Verluste verursacht haben.</p>\r\n            \r\n            <p>10. 4 Bei Beendigung Ihres Besch&auml;ftigungsverh&auml;ltnisses, aus welchem ​​Grund auch immer, werden Sie s&auml;mtliches Eigentum an das Unternehmen zur&uuml;ckgeben; Dokumente und</p>\r\n            \r\n            <p>Papier, sowohl Original als auch Kopien davon, einschlie&szlig;lich aller Muster, Literatur, Vertr&auml;ge, Aufzeichnungen, Listen, Zeichnungen, Blaupausen,</p>\r\n            \r\n            <p>Briefe, Notizen, Daten und dergleichen; und vertrauliche Informationen, die sich in Ihrem Besitz oder unter Ihrer Kontrolle befinden und sich auf Sie beziehen</p>\r\n            \r\n            <p>Besch&auml;ftigung oder f&uuml;r die gesch&auml;ftlichen Angelegenheiten der Kunden.</p>\r\n            \r\n            <p>11. Confidential Information</p>\r\n            \r\n            <p>11. 1 During your employment with the Company you will devote your whole time, attention, and skill to the best of your ability for</p>\r\n            \r\n            <p>its business. You shall not, directly or indirectly, engage or associate yourself with, be connected with, concerned, employed, or</p>\r\n            \r\n            <p>time or pursue any course of study whatsoever, without the prior permission of the Company.engaged in any other business or</p>\r\n            \r\n            <p>activities or any other post or work part-time or pursue any course of study whatsoever, without the prior permission of the</p>\r\n            \r\n            <p>Company.</p>\r\n            \r\n            <p>11.2 You must always maintain the highest degree of confidentiality and keep as confidential the records, documents, and other&nbsp;</p>\r\n            \r\n            <p>Confidential Information relating to the business of the Company which may be known to you or confided in you by any means</p>\r\n            \r\n            <p>and you will use such records, documents and information only in a duly authorized manner in the interest of the Company. For</p>\r\n            \r\n            <p>the purposes of this clause &lsquo;Confidential Information&rsquo; means information about the Company&rsquo;s business and that of its customers</p>\r\n            \r\n            <p>which is not available to the general public and which may be learned by you in the course of your employment. This includes,</p>\r\n            \r\n            <p>but is not limited to, information relating to the organization, its customer lists, employment policies, personnel, and information</p>\r\n            \r\n            <p>about the Company&rsquo;s products, processes including ideas, concepts, projections, technology, manuals, drawing, designs,&nbsp;</p>\r\n            \r\n            <p>specifications, and all papers, resumes, records and other documents containing such Confidential Information.</p>\r\n            \r\n            <p>11.3 At no time, will you remove any Confidential Information from the office without permission.</p>\r\n            \r\n            <p>11.4 Your duty to safeguard and not disclos</p>\r\n            \r\n            <p>e Confidential Information will survive the expiration or termination of this Agreement and/or your employment with the Company.</p>\r\n            \r\n            <p>11.5 Breach of the conditions of this clause will render you liable to summary dismissal under the clause above in addition to any</p>\r\n            \r\n            <p>other remedy the Company may have against you in law.</p>\r\n            <p>12. Notices</p>\r\n            \r\n            <p>Notices may be given by you to the Company at its registered office address. Notices may be given by the Company to you at</p>\r\n            \r\n            <p>the address intimated by you in the official records.</p>\r\n            \r\n            \r\n            \r\n            <p>13. Applicability of Company Policy</p>\r\n            \r\n            <p>The Company shall be entitled to make policy declarations from time to time pertaining to matters like leave entitlement,maternity</p>\r\n            \r\n            <p>leave, employees&rsquo; benefits, working hours, transfer policies, etc., and may alter the same from time to time at its sole discretion.</p>\r\n            \r\n            <p>All such policy decisions of the Company shall be binding on you and shall override this Agreement to that&nbsp; extent.</p>\r\n            \r\n            \r\n            \r\n            <p>14. Governing Law/Jurisdiction</p>\r\n            \r\n            <p>Your employment with the Company is subject to Country laws. All disputes shall be subject to the jurisdiction of High Court</p>\r\n            \r\n            <p>Gujarat only.</p>\r\n            \r\n            \r\n            \r\n            <p>15. Acceptance of our offer</p>\r\n            \r\n            <p>Please confirm your acceptance of this Contract of Employment by signing and returning the duplicate copy.</p>\r\n            \r\n            \r\n            \r\n            <p>We welcome you and look forward to receiving your acceptance and to working with you.</p>\r\n            \r\n            \r\n            \r\n            <p>Yours Sincerely,</p>\r\n            \r\n            <p>{app_name}</p>\r\n            \r\n            <p>{date}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(4,'en','<h3 style=\"text-align: center;\">Joining Letter</h3>\r\n            <p>{date}</p>\r\n            <p>{employee_name}</p>\r\n            <p>{address}</p>\r\n            <p>Subject: Appointment for the post of {designation}</p>\r\n            <p>Dear {employee_name},</p>\r\n            <p>We are pleased to offer you the position of {designation} with {app_name} theCompany on the following terms and</p>\r\n            <p>conditions:</p>\r\n            <p>1. Commencement of employment</p>\r\n            <p>Your employment will be effective, as of {start_date}</p>\r\n            <p>2. Job title</p>\r\n            <p>Your job title will be{designation}.</p>\r\n            <p>3. Salary</p>\r\n            <p>Your salary and other benefits will be as set out in Schedule 1, hereto.</p>\r\n            <p>4. Place of posting</p>\r\n            <p>You will be posted at {branch}. You may however be required to work at any place of business which the Company has, or</p>\r\n            <p>may later acquire.</p>\r\n            <p>5. Hours of Work</p>\r\n            <p>The normal working days are Monday through Friday. You will be required to work for such hours as necessary for the</p>\r\n            <p>proper discharge of your duties to the Company. The normal working hours are from {start_time} to {end_time} and you are</p>\r\n            <p>expected to work not less than {total_hours} hours each week, and if necessary for additional hours depending on your</p>\r\n            <p>responsibilities.</p>\r\n            <p>6. Leave/Holidays</p>\r\n            <p>6.1 You are entitled to casual leave of 12 days.</p>\r\n            <p>6.2 You are entitled to 12 working days of paid sick leave.</p>\r\n            <p>6.3 The Company shall notify a list of declared holidays at the beginning of each year.</p>\r\n            <p>7. Nature of duties</p>\r\n            <p>You will perform to the best of your ability all the duties as are inherent in your post and such additional duties as the company</p>\r\n            <p>may call upon you to perform, from time to time. Your specific duties are set out in Schedule II hereto.</p>\r\n            <p>8. Company property</p>\r\n            <p>You will always maintain in good condition Company property, which may be entrusted to you for official use during the course of</p>\r\n            <p>your employment, and shall return all such property to the Company prior to relinquishment of your charge, failing which the cost</p>\r\n            <p>of the same will be recovered from you by the Company.</p>\r\n            <p>9. Borrowing/accepting gifts</p>\r\n            <p>You will not borrow or accept any money, gift, reward, or compensation for your personal gains from or otherwise place yourself</p>\r\n            <p>under pecuniary obligation to any person/client with whom you may be having official dealings.</p>\r\n            <p>10. Termination</p>\r\n            <p>10.1 Your appointment can be terminated by the Company, without any reason, by giving you not less than [Notice] months prior</p>\r\n            <p>notice in writing or salary in lieu thereof. For the purpose of this clause, salary shall mean basic salary.</p>\r\n            <p>10.2 You may terminate your employment with the Company, without any cause, by giving no less than [Employee Notice]</p>\r\n            <p>months prior notice or salary for the unsaved period, left after adjustment of pending leaves, as on date.</p>\r\n            <p>10.3 The Company reserves the right to terminate your employment summarily without any notice period or termination payment</p>\r\n            <p>if it has reasonable ground to believe you are guilty of misconduct or negligence, or have committed any fundamental breach of</p>\r\n            <p>contract, or caused any loss to the Company.</p>\r\n            <p>10. 4 On the termination of your employment for whatever reason, you will return to the Company all property; documents, and</p>\r\n            <p>paper, both original and copies thereof, including any samples, literature, contracts, records, lists, drawings, blueprints,</p>\r\n            <p>letters, notes, data and the like; and Confidential Information, in your possession or under your control relating to your</p>\r\n            <p>employment or to clients business affairs.</p>\r\n            <p>11. Confidential Information</p>\r\n            <p>11. 1 During your employment with the Company you will devote your whole time, attention, and skill to the best of your ability for</p>\r\n            <p>its business. You shall not, directly or indirectly, engage or associate yourself with, be connected with, concerned, employed, or</p>\r\n            <p>time or pursue any course of study whatsoever, without the prior permission of the Company.engaged in any other business or</p>\r\n            <p>activities or any other post or work part-time or pursue any course of study whatsoever, without the prior permission of the</p>\r\n            <p>Company.</p>\r\n            <p>11.2 You must always maintain the highest degree of confidentiality and keep as confidential the records, documents, and other</p>\r\n            <p>Confidential Information relating to the business of the Company which may be known to you or confided in you by any means</p>\r\n            <p>and you will use such records, documents and information only in a duly authorized manner in the interest of the Company. For</p>\r\n            <p>the purposes of this clauseConfidential Information means information about the Companys business and that of its customers</p>\r\n            <p>which is not available to the general public and which may be learned by you in the course of your employment. This includes,</p>\r\n            <p>but is not limited to, information relating to the organization, its customer lists, employment policies, personnel, and information</p>\r\n            <p>about the Companys products, processes including ideas, concepts, projections, technology, manuals, drawing, designs,</p>\r\n            <p>specifications, and all papers, resumes, records and other documents containing such Confidential Information.</p>\r\n            <p>11.3 At no time, will you remove any Confidential Information from the office without permission.</p>\r\n            <p>11.4 Your duty to safeguard and not disclos</p>\r\n            <p>e Confidential Information will survive the expiration or termination of this Agreement and/or your employment with the Company.</p>\r\n            <p>11.5 Breach of the conditions of this clause will render you liable to summary dismissal under the clause above in addition to any</p>\r\n            <p>other remedy the Company may have against you in law.</p>\r\n            <p>12. Notices</p>\r\n            <p>Notices may be given by you to the Company at its registered office address. Notices may be given by the Company to you at</p>\r\n            <p>the address intimated by you in the official records.</p>\r\n            <p>13. Applicability of Company Policy</p>\r\n            <p>The Company shall be entitled to make policy declarations from time to time pertaining to matters like leave entitlement,maternity</p>\r\n            <p>leave, employees benefits, working hours, transfer policies, etc., and may alter the same from time to time at its sole discretion.</p>\r\n            <p>All such policy decisions of the Company shall be binding on you and shall override this Agreement to that extent.</p>\r\n            <p>14. Governing Law/Jurisdiction</p>\r\n            <p>Your employment with the Company is subject to Country laws. All disputes shall be subject to the jurisdiction of High Court</p>\r\n            <p>Gujarat only.</p>\r\n            <p>15. Acceptance of our offer</p>\r\n            <p>Please confirm your acceptance of this Contract of Employment by signing and returning the duplicate copy.</p>\r\n            <p>We welcome you and look forward to receiving your acceptance and to working with you.</p>\r\n            <p>Yours Sincerely,</p>\r\n            <p>{app_name}</p>\r\n            <p>{date}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(5,'es','<h3 style=\"text-align: center;\"><strong>Carta de uni&oacute;n</strong></h3>\r\n            \r\n            \r\n            <p>{date}</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{address}</p>\r\n            \r\n            \r\n            \r\n            <p>Asunto: Nombramiento para el puesto de {designation}</p>\r\n            \r\n            \r\n            \r\n            <p>Estimado {employee_name},</p>\r\n            \r\n            <p>Nos complace ofrecerle el puesto de {designation} con {app_name}, la Compa&ntilde;&iacute;a en los siguientes t&eacute;rminos y</p>\r\n            \r\n            <p>condiciones:</p>\r\n            \r\n            \r\n            <p>1. Comienzo del empleo</p>\r\n            \r\n            <p>Su empleo ser&aacute; efectivo a partir del {start_date}</p>\r\n            \r\n            \r\n            <p>2. T&iacute;tulo del trabajo</p>\r\n            <p>El t&iacute;tulo de su trabajo ser&aacute; {designation}.</p>\r\n            \r\n            <p>3. Salario</p>\r\n            \r\n            <p>Su salario y otros beneficios ser&aacute;n los establecidos en el Anexo 1 del presente.</p>\r\n            \r\n            \r\n            <p>4. Lugar de destino</p>\r\n            <p>Se le publicar&aacute; en {branch}. Sin embargo, es posible que deba trabajar en cualquier lugar de negocios que tenga la Compa&ntilde;&iacute;a, o</p>\r\n            \r\n            <p>puede adquirir posteriormente.</p>\r\n            \r\n            \r\n            \r\n            <p>5. Horas de trabajo</p>\r\n            \r\n            <p>Los d&iacute;as normales de trabajo son de lunes a viernes. Se le pedir&aacute; que trabaje las horas que sean necesarias para el</p>\r\n            \r\n            <p>cumplimiento adecuado de sus deberes para con la Compa&ntilde;&iacute;a. El horario normal de trabajo es de {start_time} a {end_time} y usted est&aacute;</p>\r\n            \r\n            <p>se espera que trabaje no menos de {total_hours} horas cada semana y, si es necesario, horas adicionales dependiendo de su</p>\r\n            \r\n            <p>responsabilidades.</p>\r\n            \r\n            \r\n            \r\n            <p>6. Licencia/Vacaciones</p>\r\n            \r\n            <p>6.1 Tiene derecho a un permiso eventual de 12 d&iacute;as.</p>\r\n            \r\n            <p>6.2 Tiene derecho a 12 d&iacute;as laborables de baja por enfermedad remunerada.</p>\r\n            \r\n            <p>6.3 La Compa&ntilde;&iacute;a deber&aacute; notificar una lista de d&iacute;as festivos declarados al comienzo de cada a&ntilde;o.</p>\r\n            \r\n            \r\n            \r\n            <p>7. Naturaleza de los deberes</p>\r\n            \r\n            <p>Desempe&ntilde;ar&aacute; lo mejor que pueda todas las funciones inherentes a su puesto y aquellas funciones adicionales que la empresa</p>\r\n            \r\n            <p>puede pedirte que act&uacute;es, de vez en cuando. Sus deberes espec&iacute;ficos se establecen en el Anexo II del presente.</p>\r\n            \r\n            \r\n            \r\n            <p>8. Propiedad de la empresa</p>\r\n            \r\n            <p>Siempre mantendr&aacute; en buenas condiciones la propiedad de la Compa&ntilde;&iacute;a, que se le puede confiar para uso oficial durante el curso de</p>\r\n            \r\n            <p>su empleo, y devolver&aacute; todos esos bienes a la Compa&ntilde;&iacute;a antes de renunciar a su cargo, en caso contrario, el costo</p>\r\n            \r\n            <p>de la misma ser&aacute; recuperada de usted por la Compa&ntilde;&iacute;a.</p>\r\n            \r\n            \r\n            \r\n            <p>9. Tomar prestado/aceptar regalos</p>\r\n            \r\n            <p>No pedir&aacute; prestado ni aceptar&aacute; dinero, obsequios, recompensas o compensaciones por sus ganancias personales o se colocar&aacute; de otra manera</p>\r\n            \r\n            <p>bajo obligaci&oacute;n pecuniaria a cualquier persona/cliente con quien pueda tener tratos oficiales.</p>\r\n            <p>10. Terminaci&oacute;n</p>\r\n            \r\n            <p>10.1 Su nombramiento puede ser rescindido por la Compa&ntilde;&iacute;a, sin ning&uacute;n motivo, al darle no menos de [Aviso] meses antes</p>\r\n            \r\n            <p>aviso por escrito o salario en su lugar. Para los efectos de esta cl&aacute;usula, se entender&aacute; por salario el salario base.</p>\r\n            \r\n            <p>10.2 Puede rescindir su empleo con la Compa&ntilde;&iacute;a, sin ninguna causa, dando no menos de [Aviso al empleado]</p>\r\n            \r\n            <p>meses de preaviso o salario por el per&iacute;odo no ahorrado, remanente despu&eacute;s del ajuste de licencias pendientes, a la fecha.</p>\r\n            \r\n            <p>10.3 La Compa&ntilde;&iacute;a se reserva el derecho de rescindir su empleo sumariamente sin ning&uacute;n per&iacute;odo de preaviso o pago por rescisi&oacute;n</p>\r\n            \r\n            <p>si tiene motivos razonables para creer que usted es culpable de mala conducta o negligencia, o ha cometido una violaci&oacute;n fundamental de</p>\r\n            \r\n            <p>contrato, o causado cualquier p&eacute;rdida a la Compa&ntilde;&iacute;a.</p>\r\n            \r\n            <p>10. 4 A la terminaci&oacute;n de su empleo por cualquier motivo, devolver&aacute; a la Compa&ntilde;&iacute;a todos los bienes; documentos, y</p>\r\n            \r\n            <p>papel, tanto en original como en copia del mismo, incluyendo cualquier muestra, literatura, contratos, registros, listas, dibujos, planos,</p>\r\n            \r\n            <p>cartas, notas, datos y similares; e Informaci&oacute;n confidencial, en su posesi&oacute;n o bajo su control en relaci&oacute;n con su</p>\r\n            \r\n            <p>empleo o a los asuntos comerciales de los clientes.</p>\r\n            <p>11. Informaci&oacute;n confidencial</p>\r\n            \r\n            <p>11. 1 Durante su empleo en la Compa&ntilde;&iacute;a, dedicar&aacute; todo su tiempo, atenci&oacute;n y habilidad lo mejor que pueda para</p>\r\n            \r\n            <p>son negocios. Usted no deber&aacute;, directa o indirectamente, comprometerse o asociarse con, estar conectado, interesado, empleado o</p>\r\n            \r\n            <p>tiempo o seguir cualquier curso de estudio, sin el permiso previo de la Compa&ntilde;&iacute;a. participar en cualquier otro negocio o</p>\r\n            \r\n            <p>actividades o cualquier otro puesto o trabajo a tiempo parcial o seguir cualquier curso de estudio, sin el permiso previo de la</p>\r\n            \r\n            <p>Compa&ntilde;&iacute;a.</p>\r\n            \r\n            <p>11.2 Siempre debe mantener el m&aacute;s alto grado de confidencialidad y mantener como confidenciales los registros, documentos y otros</p>\r\n            \r\n            <p>Informaci&oacute;n confidencial relacionada con el negocio de la Compa&ntilde;&iacute;a que usted pueda conocer o confiarle por cualquier medio</p>\r\n            \r\n            <p>y utilizar&aacute; dichos registros, documentos e informaci&oacute;n solo de manera debidamente autorizada en inter&eacute;s de la Compa&ntilde;&iacute;a. Para</p>\r\n            \r\n            <p>A los efectos de esta cl&aacute;usula, \"Informaci&oacute;n confidencial\" significa informaci&oacute;n sobre el negocio de la Compa&ntilde;&iacute;a y el de sus clientes.</p>\r\n            \r\n            <p>que no est&aacute; disponible para el p&uacute;blico en general y que usted puede aprender en el curso de su empleo. Esto incluye,</p>\r\n            \r\n            <p>pero no se limita a, informaci&oacute;n relacionada con la organizaci&oacute;n, sus listas de clientes, pol&iacute;ticas de empleo, personal e informaci&oacute;n</p>\r\n            \r\n            <p>sobre los productos de la Compa&ntilde;&iacute;a, procesos que incluyen ideas, conceptos, proyecciones, tecnolog&iacute;a, manuales, dibujos, dise&ntilde;os,</p>\r\n            \r\n            <p>especificaciones, y todos los papeles, curr&iacute;culos, registros y otros documentos que contengan dicha Informaci&oacute;n Confidencial.</p>\r\n            \r\n            <p>11.3 En ning&uacute;n momento, sacar&aacute; ninguna Informaci&oacute;n Confidencial de la oficina sin permiso.</p>\r\n            \r\n            <p>11.4 Su deber de salvaguardar y no divulgar</p>\r\n            \r\n            <p>La Informaci&oacute;n Confidencial sobrevivir&aacute; a la expiraci&oacute;n o terminaci&oacute;n de este Acuerdo y/o su empleo con la Compa&ntilde;&iacute;a.</p>\r\n            \r\n            <p>11.5 El incumplimiento de las condiciones de esta cl&aacute;usula le har&aacute; pasible de despido sumario en virtud de la cl&aacute;usula anterior adem&aacute;s de cualquier</p>\r\n            \r\n            <p>otro recurso que la Compa&ntilde;&iacute;a pueda tener contra usted por ley.</p>\r\n            <p>12. Avisos</p>\r\n            \r\n            <p>Usted puede enviar notificaciones a la Compa&ntilde;&iacute;a a su domicilio social. La Compa&ntilde;&iacute;a puede enviarle notificaciones a usted en</p>\r\n            \r\n            <p>la direcci&oacute;n indicada por usted en los registros oficiales.</p>\r\n            \r\n            \r\n            \r\n            <p>13. Aplicabilidad de la pol&iacute;tica de la empresa</p>\r\n            \r\n            <p>La Compa&ntilde;&iacute;a tendr&aacute; derecho a hacer declaraciones de pol&iacute;tica de vez en cuando relacionadas con asuntos como el derecho a licencia, maternidad</p>\r\n            \r\n            <p>licencia, beneficios de los empleados, horas de trabajo, pol&iacute;ticas de transferencia, etc., y puede modificarlas de vez en cuando a su sola discreci&oacute;n.</p>\r\n            \r\n            <p>Todas las decisiones pol&iacute;ticas de la Compa&ntilde;&iacute;a ser&aacute;n vinculantes para usted y anular&aacute;n este Acuerdo en esa medida.</p>\r\n            \r\n            \r\n            \r\n            <p>14. Ley aplicable/Jurisdicci&oacute;n</p>\r\n            \r\n            <p>Su empleo con la Compa&ntilde;&iacute;a est&aacute; sujeto a las leyes del Pa&iacute;s. Todas las disputas estar&aacute;n sujetas a la jurisdicci&oacute;n del Tribunal Superior</p>\r\n            \r\n            <p>S&oacute;lo Gujarat.</p>\r\n            \r\n            \r\n            \r\n            <p>15. Aceptaci&oacute;n de nuestra oferta</p>\r\n            \r\n            <p>Por favor, confirme su aceptaci&oacute;n de este Contrato de Empleo firmando y devolviendo el duplicado.</p>\r\n            \r\n            \r\n            \r\n            <p>Le damos la bienvenida y esperamos recibir su aceptaci&oacute;n y trabajar con usted.</p>\r\n            \r\n            \r\n            \r\n            <p>Tuyo sinceramente,</p>\r\n            \r\n            <p>{app_name}</p>\r\n            \r\n            <p>{date}</p>\r\n            ',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(6,'fr','<h3 style=\"text-align: center;\">Lettre dadh&eacute;sion</h3>\r\n            \r\n            \r\n            <p>{date}</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            <p>{address}</p>\r\n            \r\n            \r\n            <p>Objet : Nomination pour le poste de {designation}</p>\r\n            \r\n            \r\n            \r\n            <p>Cher {employee_name},</p>\r\n            \r\n            \r\n            <p>Nous sommes heureux de vous proposer le poste de {designation} avec {app_name} la \"Soci&eacute;t&eacute;\" selon les conditions suivantes et</p>\r\n            \r\n            <p>les conditions:</p>\r\n            \r\n            <p>1. Entr&eacute;e en fonction</p>\r\n            \r\n            <p>Votre emploi sera effectif &agrave; partir du {start_date}</p>\r\n            \r\n            \r\n            \r\n            <p>2. Intitul&eacute; du poste</p>\r\n            \r\n            <p>Votre titre de poste sera {designation}.</p>\r\n            \r\n            \r\n            \r\n            <p>3. Salaire</p>\r\n            \r\n            <p>Votre salaire et vos autres avantages seront tels quindiqu&eacute;s &agrave; lannexe 1 ci-jointe.</p>\r\n            \r\n            \r\n            <p>4. Lieu de d&eacute;tachement</p>\r\n            <p>Vous serez affect&eacute; &agrave; {branch}. Vous pouvez cependant &ecirc;tre tenu de travailler dans nimporte quel lieu daffaires que la Soci&eacute;t&eacute; a, ou</p>\r\n            \r\n            <p>pourra acqu&eacute;rir plus tard.</p>\r\n            \r\n            \r\n            \r\n            <p>5. Heures de travail</p>\r\n            \r\n            <p>Les jours ouvrables normaux sont du lundi au vendredi. Vous devrez travailler les heures n&eacute;cessaires &agrave; la</p>\r\n            \r\n            <p>lexercice correct de vos fonctions envers la Soci&eacute;t&eacute;. Les heures normales de travail vont de {start_time} &agrave; {end_time} et vous &ecirc;tes</p>\r\n            \r\n            <p>devrait travailler au moins {total_hours} heures par semaine, et si n&eacute;cessaire des heures suppl&eacute;mentaires en fonction de votre</p>\r\n            \r\n            <p>responsabilit&eacute;s.</p>\r\n            \r\n            <p>6. Cong&eacute;s/Vacances</p>\r\n            \r\n            <p>6.1 Vous avez droit &agrave; un cong&eacute; occasionnel de 12 jours.</p>\r\n            \r\n            <p>6.2 Vous avez droit &agrave; 12 jours ouvrables de cong&eacute; de maladie pay&eacute;.</p>\r\n            \r\n            <p>6.3 La Soci&eacute;t&eacute; communiquera une liste des jours f&eacute;ri&eacute;s d&eacute;clar&eacute;s au d&eacute;but de chaque ann&eacute;e.</p>\r\n            \r\n            \r\n            \r\n            <p>7. Nature des fonctions</p>\r\n            \r\n            <p>Vous ex&eacute;cuterez au mieux de vos capacit&eacute;s toutes les t&acirc;ches inh&eacute;rentes &agrave; votre poste et les t&acirc;ches suppl&eacute;mentaires que lentreprise</p>\r\n            \r\n            <p>peut faire appel &agrave; vous pour effectuer, de temps &agrave; autre. Vos fonctions sp&eacute;cifiques sont &eacute;nonc&eacute;es &agrave; lannexe II ci-jointe.</p>\r\n            \r\n            \r\n            \r\n            <p>8. Biens sociaux</p>\r\n            \r\n            <p>Vous maintiendrez toujours en bon &eacute;tat les biens de la Soci&eacute;t&eacute;, qui peuvent vous &ecirc;tre confi&eacute;s pour un usage officiel au cours de votre</p>\r\n            \r\n            <p>votre emploi, et doit restituer tous ces biens &agrave; la Soci&eacute;t&eacute; avant labandon de votre charge, &agrave; d&eacute;faut de quoi le co&ucirc;t</p>\r\n            \r\n            <p>de m&ecirc;me seront r&eacute;cup&eacute;r&eacute;s aupr&egrave;s de vous par la Soci&eacute;t&eacute;.</p>\r\n            \r\n            \r\n            \r\n            <p>9. Emprunter/accepter des cadeaux</p>\r\n            \r\n            <p>Vous nemprunterez ni naccepterez dargent, de cadeau, de r&eacute;compense ou de compensation pour vos gains personnels ou vous placerez autrement</p>\r\n            \r\n            <p>sous obligation p&eacute;cuniaire envers toute personne/client avec qui vous pourriez avoir des relations officielles.</p>\r\n            <p>10. R&eacute;siliation</p>\r\n            \r\n            <p>10.1 Votre nomination peut &ecirc;tre r&eacute;sili&eacute;e par la Soci&eacute;t&eacute;, sans aucune raison, en vous donnant au moins [Pr&eacute;avis] mois avant</p>\r\n            \r\n            <p>un pr&eacute;avis &eacute;crit ou un salaire en tenant lieu. Aux fins de la pr&eacute;sente clause, salaire sentend du salaire de base.</p>\r\n            \r\n            <p>10.2 Vous pouvez r&eacute;silier votre emploi au sein de la Soci&eacute;t&eacute;, sans motif, en donnant au moins [Avis &agrave; lemploy&eacute;]</p>\r\n            \r\n            <p>mois de pr&eacute;avis ou de salaire pour la p&eacute;riode non &eacute;pargn&eacute;e, restant apr&egrave;s r&eacute;gularisation des cong&eacute;s en attente, &agrave; la date.</p>\r\n            \r\n            <p>10.3 La Soci&eacute;t&eacute; se r&eacute;serve le droit de r&eacute;silier votre emploi sans pr&eacute;avis ni indemnit&eacute; de licenciement.</p>\r\n            \r\n            <p>sil a des motifs raisonnables de croire que vous &ecirc;tes coupable dinconduite ou de n&eacute;gligence, ou que vous avez commis une violation fondamentale de</p>\r\n            \r\n            <p>contrat, ou caus&eacute; une perte &agrave; la Soci&eacute;t&eacute;.</p>\r\n            \r\n            <p>10. 4 &Agrave; la fin de votre emploi pour quelque raison que ce soit, vous restituerez &agrave; la Soci&eacute;t&eacute; tous les biens ; document, et</p>\r\n            \r\n            <p>papier, &agrave; la fois loriginal et les copies de celui-ci, y compris les &eacute;chantillons, la litt&eacute;rature, les contrats, les dossiers, les listes, les dessins, les plans,</p>\r\n            \r\n            <p>lettres, notes, donn&eacute;es et similaires; et Informations confidentielles, en votre possession ou sous votre contr&ocirc;le relatives &agrave; votre</p>\r\n            \r\n            <p>lemploi ou aux affaires commerciales des clients.</p>\r\n            <p>11. Informations confidentielles</p>\r\n            \r\n            <p>11. 1 Au cours de votre emploi au sein de la Soci&eacute;t&eacute;, vous consacrerez tout votre temps, votre attention et vos comp&eacute;tences au mieux de vos capacit&eacute;s pour</p>\r\n            \r\n            <p>son affaire. Vous ne devez pas, directement ou indirectement, vous engager ou vous associer &agrave;, &ecirc;tre li&eacute; &agrave;, concern&eacute;, employ&eacute; ou</p>\r\n            \r\n            <p>temps ou poursuivre quelque programme d&eacute;tudes que ce soit, sans lautorisation pr&eacute;alable de la Soci&eacute;t&eacute;. engag&eacute; dans toute autre entreprise ou</p>\r\n            \r\n            <p>activit&eacute;s ou tout autre poste ou travail &agrave; temps partiel ou poursuivre des &eacute;tudes quelconques, sans lautorisation pr&eacute;alable du</p>\r\n            \r\n            <p>Compagnie.</p>\r\n            \r\n            <p>11.2 Vous devez toujours maintenir le plus haut degr&eacute; de confidentialit&eacute; et garder confidentiels les dossiers, documents et autres</p>\r\n            \r\n            <p>Informations confidentielles relatives &agrave; lactivit&eacute; de la Soci&eacute;t&eacute; dont vous pourriez avoir connaissance ou qui vous seraient confi&eacute;es par tout moyen</p>\r\n            \r\n            <p>et vous nutiliserez ces registres, documents et informations que dune mani&egrave;re d&ucirc;ment autoris&eacute;e dans lint&eacute;r&ecirc;t de la Soci&eacute;t&eacute;. Pour</p>\r\n            \r\n            <p>aux fins de la pr&eacute;sente clause &laquo; Informations confidentielles &raquo; d&eacute;signe les informations sur les activit&eacute;s de la Soci&eacute;t&eacute; et celles de ses clients</p>\r\n            \r\n            <p>qui nest pas accessible au grand public et dont vous pourriez avoir connaissance dans le cadre de votre emploi. Ceci comprend,</p>\r\n            \r\n            <p>mais sans sy limiter, les informations relatives &agrave; lorganisation, ses listes de clients, ses politiques demploi, son personnel et les informations</p>\r\n            \r\n            <p>sur les produits, les processus de la Soci&eacute;t&eacute;, y compris les id&eacute;es, les concepts, les projections, la technologie, les manuels, les dessins, les conceptions,</p>\r\n            \r\n            <p>sp&eacute;cifications, et tous les papiers, curriculum vitae, dossiers et autres documents contenant de telles informations confidentielles.</p>\r\n            \r\n            <p>11.3 &Agrave; aucun moment, vous ne retirerez des informations confidentielles du bureau sans autorisation.</p>\r\n            \r\n            <p>11.4 Votre devoir de prot&eacute;ger et de ne pas divulguer</p>\r\n            \r\n            <p>Les Informations confidentielles survivront &agrave; lexpiration ou &agrave; la r&eacute;siliation du pr&eacute;sent Contrat et/ou &agrave; votre emploi au sein de la Soci&eacute;t&eacute;.</p>\r\n            \r\n            <p>11.5 La violation des conditions de cette clause vous rendra passible dun renvoi sans pr&eacute;avis en vertu de la clause ci-dessus en plus de tout</p>\r\n            \r\n            <p>autre recours que la Soci&eacute;t&eacute; peut avoir contre vous en droit.</p>\r\n            <p>12. Avis</p>\r\n            \r\n            <p>Des avis peuvent &ecirc;tre donn&eacute;s par vous &agrave; la Soci&eacute;t&eacute; &agrave; ladresse de son si&egrave;ge social. Des avis peuvent vous &ecirc;tre donn&eacute;s par la Soci&eacute;t&eacute; &agrave;</p>\r\n            \r\n            <p>ladresse que vous avez indiqu&eacute;e dans les registres officiels.</p>\r\n            \r\n            \r\n            \r\n            <p>13. Applicabilit&eacute; de la politique de lentreprise</p>\r\n            \r\n            <p>La Soci&eacute;t&eacute; est autoris&eacute;e &agrave; faire des d&eacute;clarations de politique de temps &agrave; autre concernant des questions telles que le droit aux cong&eacute;s, la maternit&eacute;</p>\r\n            \r\n            <p>les cong&eacute;s, les avantages sociaux des employ&eacute;s, les heures de travail, les politiques de transfert, etc., et peut les modifier de temps &agrave; autre &agrave; sa seule discr&eacute;tion.</p>\r\n            \r\n            <p>Toutes ces d&eacute;cisions politiques de la Soci&eacute;t&eacute; vous lieront et pr&eacute;vaudront sur le pr&eacute;sent Contrat dans cette mesure.</p>\r\n            \r\n            \r\n            \r\n            <p>14. Droit applicable/juridiction</p>\r\n            \r\n            <p>Votre emploi au sein de la Soci&eacute;t&eacute; est soumis aux lois du pays. Tous les litiges seront soumis &agrave; la comp&eacute;tence du tribunal de grande instance</p>\r\n            \r\n            <p>Gujarat uniquement.</p>\r\n            \r\n            \r\n            \r\n            <p>15. Acceptation de notre offre</p>\r\n            \r\n            <p>Veuillez confirmer votre acceptation de ce contrat de travail en signant et en renvoyant le duplicata.</p>\r\n            \r\n            \r\n            \r\n            <p>Nous vous souhaitons la bienvenue et nous nous r&eacute;jouissons de recevoir votre acceptation et de travailler avec vous.</p>\r\n            \r\n            \r\n            \r\n            <p>Cordialement,</p>\r\n            \r\n            <p>{app_name}</p>\r\n            \r\n            <p>{date}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(7,'id','<h3 style=\"text-align: center;\">Surat Bergabung</h3>\r\n            \r\n            \r\n            <p>{date}</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{address}</p>\r\n            \r\n            \r\n            \r\n            <p>Perihal: Pengangkatan untuk jabatan {designation}</p>\r\n            \r\n            \r\n            <p>{employee_name} yang terhormat,</p>\r\n            \r\n            <p>Kami dengan senang hati menawarkan kepada Anda, posisi {designation} dengan {app_name} sebagai Perusahaan dengan persyaratan dan</p>\r\n            \r\n            <p>kondisi:</p>\r\n            \r\n            \r\n            \r\n            <p>1. Mulai bekerja</p>\r\n            \r\n            <p>Pekerjaan Anda akan efektif, mulai {start_date}</p>\r\n            \r\n            \r\n            <p>2. Jabatan</p>\r\n            <p>Jabatan Anda adalah {designation}.</p>\r\n            \r\n            <p>3. Gaji</p>\r\n            <p>Gaji Anda dan tunjangan lainnya akan diatur dalam Jadwal 1, di sini.</p>\r\n            \r\n            \r\n            <p>4. Tempat posting</p>\r\n            \r\n            <p>Anda akan diposkan di {branch}. Namun Anda mungkin diminta untuk bekerja di tempat bisnis mana pun yang dimiliki Perusahaan, atau</p>\r\n            \r\n            <p>nantinya dapat memperoleh.</p>\r\n            \r\n            \r\n            \r\n            <p>5. Jam Kerja</p>\r\n            \r\n            <p>Hari kerja normal adalah Senin sampai Jumat. Anda akan diminta untuk bekerja selama jam-jam yang diperlukan untuk</p>\r\n            \r\n            <p>pelaksanaan tugas Anda dengan benar di Perusahaan. Jam kerja normal adalah dari {start_time} hingga {end_time} dan Anda</p>\r\n            \r\n            <p>diharapkan bekerja tidak kurang dari {total_hours} jam setiap minggu, dan jika perlu untuk jam tambahan tergantung pada</p>\r\n            \r\n            <p>tanggung jawab.</p>\r\n            \r\n            \r\n            \r\n            <p>6. Cuti/Libur</p>\r\n            \r\n            <p>6.1 Anda berhak atas cuti biasa selama 12 hari.</p>\r\n            \r\n            <p>6.2 Anda berhak atas 12 hari kerja cuti sakit berbayar.</p>\r\n            \r\n            <p>6.3 Perusahaan akan memberitahukan daftar hari libur yang diumumkan pada awal setiap tahun.</p>\r\n            \r\n            \r\n            \r\n            <p>7. Sifat tugas</p>\r\n            \r\n            <p>Anda akan melakukan yang terbaik dari kemampuan Anda semua tugas yang melekat pada jabatan Anda dan tugas tambahan seperti perusahaan</p>\r\n            \r\n            <p>dapat memanggil Anda untuk tampil, dari waktu ke waktu. Tugas khusus Anda ditetapkan dalam Jadwal II di sini.</p>\r\n            \r\n            \r\n            \r\n            <p>8. Properti perusahaan</p>\r\n            \r\n            <p>Anda akan selalu menjaga properti Perusahaan dalam kondisi baik, yang dapat dipercayakan kepada Anda untuk penggunaan resmi selama</p>\r\n            \r\n            <p>pekerjaan Anda, dan akan mengembalikan semua properti tersebut kepada Perusahaan sebelum melepaskan biaya Anda, jika tidak ada biayanya</p>\r\n            \r\n            <p>yang sama akan dipulihkan dari Anda oleh Perusahaan.</p>\r\n            \r\n            \r\n            \r\n            <p>9. Meminjam/menerima hadiah</p>\r\n            \r\n            <p>Anda tidak akan meminjam atau menerima uang, hadiah, hadiah, atau kompensasi apa pun untuk keuntungan pribadi Anda dari atau dengan cara lain menempatkan diri Anda sendiri</p>\r\n            \r\n            <p>di bawah kewajiban uang kepada setiap orang/klien dengan siapa Anda mungkin memiliki hubungan resmi.</p>\r\n            <p>10. Penghentian</p>\r\n            \r\n            <p>10.1 Penunjukan Anda dapat diakhiri oleh Perusahaan, tanpa alasan apa pun, dengan memberi Anda tidak kurang dari [Pemberitahuan] bulan sebelumnya</p>\r\n            \r\n            <p>pemberitahuan secara tertulis atau gaji sebagai penggantinya. Untuk maksud pasal ini, gaji berarti gaji pokok.</p>\r\n            \r\n            <p>10.2 Anda dapat memutuskan hubungan kerja Anda dengan Perusahaan, tanpa alasan apa pun, dengan memberikan tidak kurang dari [Pemberitahuan Karyawan]</p>\r\n            \r\n            <p>pemberitahuan atau gaji bulan sebelumnya untuk periode yang belum disimpan, yang tersisa setelah penyesuaian cuti yang tertunda, pada tanggal.</p>\r\n            \r\n            <p>10.3 Perusahaan berhak untuk mengakhiri hubungan kerja Anda dengan segera tanpa pemberitahuan jangka waktu atau pembayaran pemutusan hubungan kerja</p>\r\n            \r\n            <p>jika memiliki alasan yang masuk akal untuk meyakini bahwa Anda bersalah atas kesalahan atau kelalaian, atau telah melakukan pelanggaran mendasar apa pun terhadap</p>\r\n            \r\n            <p>kontrak, atau menyebabkan kerugian bagi Perusahaan.</p>\r\n            \r\n            <p>10. 4 Pada pemutusan hubungan kerja Anda karena alasan apa pun, Anda akan mengembalikan semua properti kepada Perusahaan; dokumen, dan</p>\r\n            \r\n            <p>kertas, baik asli maupun salinannya, termasuk contoh, literatur, kontrak, catatan, daftar, gambar, cetak biru,</p>\r\n            \r\n            <p>surat, catatan, data dan sejenisnya; dan Informasi Rahasia, yang Anda miliki atau di bawah kendali Anda terkait dengan</p>\r\n            \r\n            <p>pekerjaan atau untuk urusan bisnis klien.</p>\r\n            <p>11. Informasi Rahasia</p>\r\n            \r\n            <p>11. 1 Selama bekerja di Perusahaan, Anda akan mencurahkan seluruh waktu, perhatian, dan keterampilan Anda sebaik mungkin untuk</p>\r\n            \r\n            <p>bisnisnya. Anda tidak boleh, secara langsung atau tidak langsung, terlibat atau mengasosiasikan diri Anda dengan, terhubung dengan, terkait, dipekerjakan, atau</p>\r\n            \r\n            <p>waktu atau mengikuti program studi apapun, tanpa izin sebelumnya dari Perusahaan.terlibat dalam bisnis lain atau</p>\r\n            \r\n            <p>kegiatan atau pos atau pekerjaan paruh waktu lainnya atau mengejar program studi apa pun, tanpa izin sebelumnya dari</p>\r\n            \r\n            <p>Perusahaan.</p>\r\n            \r\n            <p>11.2 Anda harus selalu menjaga tingkat kerahasiaan tertinggi dan merahasiakan catatan, dokumen, dan lainnya</p>\r\n            \r\n            <p>Informasi Rahasia yang berkaitan dengan bisnis Perusahaan yang mungkin Anda ketahui atau rahasiakan kepada Anda dengan cara apa pun</p>\r\n            \r\n            <p>dan Anda akan menggunakan catatan, dokumen, dan informasi tersebut hanya dengan cara yang sah untuk kepentingan Perusahaan. Untuk</p>\r\n            \r\n            <p>tujuan klausul ini Informasi Rahasia berarti informasi tentang bisnis Perusahaan dan pelanggannya</p>\r\n            \r\n            <p>yang tidak tersedia untuk masyarakat umum dan yang mungkin Anda pelajari selama masa kerja Anda. Ini termasuk,</p>\r\n            \r\n            <p>tetapi tidak terbatas pada, informasi yang berkaitan dengan organisasi, daftar pelanggannya, kebijakan ketenagakerjaan, personel, dan informasi</p>\r\n            \r\n            <p>tentang produk Perusahaan, proses termasuk ide, konsep, proyeksi, teknologi, manual, gambar, desain,</p>\r\n            \r\n            <p>spesifikasi, dan semua makalah, resume, catatan dan dokumen lain yang berisi Informasi Rahasia tersebut.</p>\r\n            \r\n            <p>11.3 Kapan pun Anda akan menghapus Informasi Rahasia apa pun dari kantor tanpa izin.</p>\r\n            \r\n            <p>11.4 Kewajiban Anda untuk melindungi dan tidak mengungkapkan</p>\r\n            \r\n            <p>e Informasi Rahasia akan tetap berlaku setelah berakhirnya atau pengakhiran Perjanjian ini dan/atau hubungan kerja Anda dengan Perusahaan.</p>\r\n            \r\n            <p>11.5 Pelanggaran terhadap ketentuan klausul ini akan membuat Anda bertanggung jawab atas pemecatan singkat berdasarkan klausul di atas selain dari:</p>\r\n            \r\n            <p>upaya hukum lain yang mungkin dimiliki Perusahaan terhadap Anda secara hukum.</p>\r\n            <p>12. Pemberitahuan</p>\r\n            \r\n            <p>Pemberitahuan dapat diberikan oleh Anda kepada Perusahaan di alamat kantor terdaftarnya. Pemberitahuan dapat diberikan oleh Perusahaan kepada Anda di</p>\r\n            \r\n            <p>alamat yang diberitahukan oleh Anda dalam catatan resmi.</p>\r\n            \r\n            \r\n            \r\n            <p>13. Keberlakuan Kebijakan Perusahaan</p>\r\n            \r\n            <p>Perusahaan berhak untuk membuat pernyataan kebijakan dari waktu ke waktu berkaitan dengan hal-hal seperti hak cuti, persalinan</p>\r\n            \r\n            <p>cuti, tunjangan karyawan, jam kerja, kebijakan transfer, dll., dan dapat mengubahnya dari waktu ke waktu atas kebijakannya sendiri.</p>\r\n            \r\n            <p>Semua keputusan kebijakan Perusahaan tersebut akan mengikat Anda dan akan mengesampingkan Perjanjian ini sejauh itu.</p>\r\n            \r\n            \r\n            \r\n            <p>14. Hukum/Yurisdiksi yang Mengatur</p>\r\n            \r\n            <p>Pekerjaan Anda dengan Perusahaan tunduk pada undang-undang Negara. Semua perselisihan akan tunduk pada yurisdiksi Pengadilan Tinggi</p>\r\n            \r\n            <p>Gujarat saja.</p>\r\n            \r\n            \r\n            \r\n            <p>15. Penerimaan penawaran kami</p>\r\n            \r\n            <p>Harap konfirmasikan penerimaan Anda atas Kontrak Kerja ini dengan menandatangani dan mengembalikan salinan duplikatnya.</p>\r\n            \r\n            \r\n            \r\n            <p>Kami menyambut Anda dan berharap untuk menerima penerimaan Anda dan bekerja sama dengan Anda.</p>\r\n            \r\n            \r\n            \r\n            <p>Dengan hormat,</p>\r\n            \r\n            <p>{app_name}</p>\r\n            \r\n            <p>{date}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(8,'it','<h3 style=\"text-align: center;\">Lettera di adesione</h3>\r\n            \r\n            \r\n            <p>{date}</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{address}</p>\r\n            \r\n            <p>Oggetto: Appuntamento alla carica di {designation}</p>\r\n            \r\n            \r\n            <p>Gentile {employee_name},</p>\r\n            \r\n            <p>Siamo lieti di offrirti la posizione di {designation} con {app_name} la \"Societ&agrave;\" alle seguenti condizioni e</p>\r\n            \r\n            <p>condizioni:</p>\r\n            \r\n            \r\n            <p>1. Inizio del rapporto di lavoro</p>\r\n            \r\n            <p>Il tuo impiego sar&agrave; effettivo a partire da {start_date}</p>\r\n            \r\n            \r\n            \r\n            <p>2. Titolo di lavoro</p>\r\n            \r\n            <p>Il tuo titolo di lavoro sar&agrave; {designation}.</p>\r\n            \r\n            <p>3. Stipendio</p>\r\n            \r\n            <p>Il tuo stipendio e altri benefici saranno come indicato nellAllegato 1, qui di seguito.</p>\r\n            \r\n            \r\n            \r\n            <p>4. Luogo di invio</p>\r\n            \r\n            <p>Sarai inviato a {branch}. Tuttavia, potrebbe essere richiesto di lavorare in qualsiasi luogo di attivit&agrave; che la Societ&agrave; ha, o</p>\r\n            \r\n            <p>potr&agrave; successivamente acquisire.</p>\r\n            \r\n            \r\n            \r\n            <p>5. Orario di lavoro</p>\r\n            \r\n            <p>I normali giorni lavorativi sono dal luned&igrave; al venerd&igrave;. Ti verr&agrave; richiesto di lavorare per le ore necessarie per il</p>\r\n            \r\n            <p>corretto adempimento dei propri doveri nei confronti della Societ&agrave;. Lorario di lavoro normale va da {start_time} a {end_time} e tu lo sei</p>\r\n            \r\n            <p>dovrebbe lavorare non meno di {total_hours} ore ogni settimana e, se necessario, per ore aggiuntive a seconda del tuo</p>\r\n            \r\n            <p>responsabilit&agrave;.</p>\r\n            \r\n            \r\n            \r\n            <p>6. Permessi/Festivit&agrave;</p>\r\n            \r\n            <p>6.1 Hai diritto a un congedo occasionale di 12 giorni.</p>\r\n            \r\n            <p>6.2 Hai diritto a 12 giorni lavorativi di congedo per malattia retribuito.</p>\r\n            \r\n            <p>6.3 La Societ&agrave; comunica allinizio di ogni anno un elenco delle festivit&agrave; dichiarate.</p>\r\n            \r\n            \r\n            \r\n            <p>7. Natura degli incarichi</p>\r\n            \r\n            <p>Eseguirai al meglio delle tue capacit&agrave; tutti i compiti inerenti al tuo incarico e compiti aggiuntivi come lazienda</p>\r\n            \r\n            <p>pu&ograve; invitarti a esibirti, di tanto in tanto. I tuoi doveri specifici sono stabiliti nellAllegato II del presente documento.</p>\r\n            \r\n            \r\n            \r\n            <p>8. Propriet&agrave; aziendale</p>\r\n            \r\n            <p>Manterrete sempre in buono stato i beni dellAzienda, che nel corso dellanno potrebbero esservi affidati per uso ufficiale</p>\r\n            \r\n            <p>il tuo impiego, e restituir&agrave; tutte queste propriet&agrave; alla Societ&agrave; prima della rinuncia al tuo addebito, in caso contrario il costo</p>\r\n            \r\n            <p>degli stessi saranno da voi recuperati dalla Societ&agrave;.</p>\r\n            \r\n            \r\n            \r\n            <p>9. Prendere in prestito/accettare regali</p>\r\n            \r\n            <p>Non prenderai in prestito n&eacute; accetterai denaro, dono, ricompensa o compenso per i tuoi guadagni personali da o altrimenti collocato te stesso</p>\r\n            \r\n            <p>sotto obbligazione pecuniaria nei confronti di qualsiasi persona/cliente con cui potresti avere rapporti ufficiali.</p>\r\n            <p>10. Cessazione</p>\r\n            \r\n            <p>10.1 Il tuo incarico pu&ograve; essere risolto dalla Societ&agrave;, senza alcun motivo, dandoti non meno di [Avviso] mesi prima</p>\r\n            \r\n            <p>avviso scritto o stipendio in sostituzione di esso. Ai fini della presente clausola, per stipendio si intende lo stipendio base.</p>\r\n            \r\n            <p>10.2 &Egrave; possibile terminare il proprio rapporto di lavoro con la Societ&agrave;, senza alcuna causa, fornendo non meno di [Avviso per il dipendente]</p>\r\n            \r\n            <p>mesi di preavviso o stipendio per il periodo non risparmiato, lasciato dopo ladeguamento delle ferie pendenti, come alla data.</p>\r\n            \r\n            <p>10.3 La Societ&agrave; si riserva il diritto di terminare il rapporto di lavoro sommariamente senza alcun periodo di preavviso o pagamento di cessazione</p>\r\n            \r\n            <p>se ha fondati motivi per ritenere che tu sia colpevole di cattiva condotta o negligenza, o abbia commesso una violazione fondamentale</p>\r\n            \r\n            <p>contratto, o ha causato danni alla Societ&agrave;.</p>\r\n            \r\n            <p>10. 4 Alla cessazione del rapporto di lavoro per qualsiasi motivo, restituirete alla Societ&agrave; tutti i beni; documenti, e</p>\r\n            \r\n            <p>carta, sia in originale che in copia, inclusi eventuali campioni, letteratura, contratti, registrazioni, elenchi, disegni, progetti,</p>\r\n            \r\n            <p>lettere, note, dati e simili; e Informazioni Riservate, in tuo possesso o sotto il tuo controllo, relative alla tua</p>\r\n            \r\n            <p>lavoro o agli affari dei clienti.</p>\r\n            <p>11. Confidential Information</p>\r\n            \r\n            <p>11. 1 During your employment with the Company you will devote your whole time, attention, and skill to the best of your ability for</p>\r\n            \r\n            <p>its business. You shall not, directly or indirectly, engage or associate yourself with, be connected with, concerned, employed, or</p>\r\n            \r\n            <p>time or pursue any course of study whatsoever, without the prior permission of the Company.engaged in any other business or</p>\r\n            \r\n            <p>activities or any other post or work part-time or pursue any course of study whatsoever, without the prior permission of the</p>\r\n            \r\n            <p>Company.</p>\r\n            \r\n            <p>11.2 You must always maintain the highest degree of confidentiality and keep as confidential the records, documents, and other&nbsp;</p>\r\n            \r\n            <p>Confidential Information relating to the business of the Company which may be known to you or confided in you by any means</p>\r\n            \r\n            <p>and you will use such records, documents and information only in a duly authorized manner in the interest of the Company. For</p>\r\n            \r\n            <p>the purposes of this clause &lsquo;Confidential Information&rsquo; means information about the Company&rsquo;s business and that of its customers</p>\r\n            \r\n            <p>which is not available to the general public and which may be learned by you in the course of your employment. This includes,</p>\r\n            \r\n            <p>but is not limited to, information relating to the organization, its customer lists, employment policies, personnel, and information</p>\r\n            \r\n            <p>about the Company&rsquo;s products, processes including ideas, concepts, projections, technology, manuals, drawing, designs,&nbsp;</p>\r\n            \r\n            <p>specifications, and all papers, resumes, records and other documents containing such Confidential Information.</p>\r\n            \r\n            <p>11.3 At no time, will you remove any Confidential Information from the office without permission.</p>\r\n            \r\n            <p>11.4 Your duty to safeguard and not disclos</p>\r\n            \r\n            <p>e Confidential Information will survive the expiration or termination of this Agreement and/or your employment with the Company.</p>\r\n            \r\n            <p>11.5 Breach of the conditions of this clause will render you liable to summary dismissal under the clause above in addition to any</p>\r\n            \r\n            <p>other remedy the Company may have against you in law.</p>\r\n            <p>12. Notices</p>\r\n            \r\n            <p>Notices may be given by you to the Company at its registered office address. Notices may be given by the Company to you at</p>\r\n            \r\n            <p>the address intimated by you in the official records.</p>\r\n            \r\n            \r\n            \r\n            <p>13. Applicability of Company Policy</p>\r\n            \r\n            <p>The Company shall be entitled to make policy declarations from time to time pertaining to matters like leave entitlement,maternity</p>\r\n            \r\n            <p>leave, employees&rsquo; benefits, working hours, transfer policies, etc., and may alter the same from time to time at its sole discretion.</p>\r\n            \r\n            <p>All such policy decisions of the Company shall be binding on you and shall override this Agreement to that&nbsp; extent.</p>\r\n            \r\n            \r\n            \r\n            <p>14. Governing Law/Jurisdiction</p>\r\n            \r\n            <p>Your employment with the Company is subject to Country laws. All disputes shall be subject to the jurisdiction of High Court</p>\r\n            \r\n            <p>Gujarat only.</p>\r\n            \r\n            \r\n            \r\n            <p>15. Acceptance of our offer</p>\r\n            \r\n            <p>Please confirm your acceptance of this Contract of Employment by signing and returning the duplicate copy.</p>\r\n            \r\n            \r\n            \r\n            <p>We welcome you and look forward to receiving your acceptance and to working with you.</p>\r\n            \r\n            \r\n            \r\n            <p>Yours Sincerely,</p>\r\n            \r\n            <p>{app_name}</p>\r\n            \r\n            <p>{date}</p>\r\n            ',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(9,'ja','<h3 style=\"text-align: center;\">入会の手紙</h3>\r\n            \r\n            <p>{date}</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{address}</p>\r\n            \r\n            \r\n            \r\n            <p>件名: {designation} の役職への任命</p>\r\n            \r\n            \r\n            \r\n            <p>{employee_name} 様</p>\r\n            \r\n            \r\n            <p>{app_name} の {designation} の地位を以下の条件で「会社」として提供できることをうれしく思います。</p>\r\n            \r\n            <p>条件：</p>\r\n            \r\n            \r\n            <p>1. 雇用開始</p>\r\n            \r\n            <p>あなたの雇用は {start_date} から有効になります</p>\r\n            \r\n            \r\n            <p>2. 役職</p>\r\n            \r\n            <p>あなたの役職は{designation}になります。</p>\r\n            \r\n            \r\n            <p>3. 給与</p>\r\n            \r\n            <p>あなたの給与およびその他の福利厚生は、本明細書のスケジュール 1 に記載されているとおりです。</p>\r\n            \r\n            \r\n            <p>4. 掲示場所</p>\r\n            \r\n            <p>{branch} に掲載されます。ただし、会社が所有する事業所で働く必要がある場合があります。</p>\r\n            \r\n            <p>後で取得する場合があります。</p>\r\n            \r\n            \r\n            \r\n            <p>5. 労働時間</p>\r\n            \r\n            <p>通常の営業日は月曜日から金曜日です。あなたは、そのために必要な時間働く必要があります。</p>\r\n            \r\n            <p>会社に対するあなたの義務の適切な遂行。通常の勤務時間は {start_time} から {end_time} までで、あなたは</p>\r\n            \r\n            <p>毎週 {total_hours} 時間以上の勤務が期待される</p>\r\n            \r\n            <p>責任。</p>\r\n            \r\n            \r\n            \r\n            <p>6.休暇・休日</p>\r\n            \r\n            <p>6.1 12 日間の臨時休暇を取得する権利があります。</p>\r\n            \r\n            <p>6.2 12 日間の有給病気休暇を取る権利があります。</p>\r\n            \r\n            <p>6.3 当社は、毎年の初めに宣言された休日のリストを通知するものとします。</p>\r\n            \r\n            \r\n            \r\n            <p>7. 職務内容</p>\r\n            \r\n            <p>あなたは、自分のポストに固有のすべての義務と、会社としての追加の義務を最大限に遂行します。</p>\r\n            \r\n            <p>時々あなたに演奏を依頼するかもしれません。あなたの特定の義務は、本明細書のスケジュール II に記載されています。</p>\r\n            \r\n            \r\n            \r\n            <p>8. 会社財産</p>\r\n            \r\n            <p>あなたは、会社の所有物を常に良好な状態に維持するものとします。</p>\r\n            \r\n            <p>あなたの雇用を放棄し、あなたの料金を放棄する前に、そのようなすべての財産を会社に返還するものとします。</p>\r\n            \r\n            <p>同じのは、会社によってあなたから回収されます。</p>\r\n            \r\n            \r\n            \r\n            <p>9. 貸出・贈答品の受け取り</p>\r\n            \r\n            <p>あなたは、あなた自身から、または他の方法であなた自身の場所から個人的な利益を得るための金銭、贈り物、報酬、または補償を借りたり、受け取ったりしません。</p>\r\n            \r\n            <p>あなたが公式の取引をしている可能性のある人物/クライアントに対する金銭的義務の下で。</p>\r\n            <p>10. 終了</p>\r\n            \r\n            <p>10.1 少なくとも [通知] か月前に通知することにより、理由のいかんを問わず、会社はあなたの任命を終了することができます。</p>\r\n            \r\n            <p>書面による通知またはその代わりの給与。この条項の目的上、給与とは基本給を意味するものとします。</p>\r\n            \r\n            <p>10.2 あなたは、少なくとも [従業員通知] を提出することにより、理由のいかんを問わず、会社での雇用を終了することができます。</p>\r\n            \r\n            <p>保留中の休暇の調整後に残された、保存されていない期間の数か月前の通知または給与は、日付のとおりです。</p>\r\n            \r\n            <p>10.3 当社は、通知期間や解雇補償金なしに、あなたの雇用を即座に終了させる権利を留保します。</p>\r\n            \r\n            <p>あなたが不正行為または過失で有罪であると信じる合理的な根拠がある場合、または基本的な違反を犯した場合</p>\r\n            \r\n            <p>契約、または当社に損害を与えた。</p>\r\n            \r\n            <p>10. 4 何らかの理由で雇用が終了した場合、あなたは会社にすべての財産を返還するものとします。ドキュメント、および</p>\r\n            \r\n            <p>サンプル、文献、契約書、記録、リスト、図面、青写真を含む、原本とコピーの両方の紙、</p>\r\n            \r\n            <p>手紙、メモ、データなど。あなたが所有する、またはあなたの管理下にある機密情報。</p>\r\n            \r\n            <p>雇用またはクライアントの業務に。</p>\r\n            <p>11. 機密情報</p>\r\n            \r\n            <p>11. 1 当社での雇用期間中、あなたは自分の全時間、注意、およびスキルを、自分の能力の限りを尽くして捧げます。</p>\r\n            \r\n            <p>そのビジネス。あなたは、直接的または間接的に、関与したり、関連付けたり、接続したり、関係したり、雇用したり、または</p>\r\n            \r\n            <p>会社の事前の許可なしに、時間や学習コースを追求すること。他のビジネスに従事すること、または</p>\r\n            \r\n            <p>の事前の許可なしに、活動またはその他の投稿またはアルバイトをしたり、何らかの研究コースを追求したりすること。</p>\r\n            \r\n            <p>会社。</p>\r\n            \r\n            <p>11.2 常に最高度の機密性を維持し、記録、文書、およびその他の情報を機密として保持する必要があります。</p>\r\n            \r\n            <p>お客様が知っている、または何らかの方法でお客様に内密にされている可能性がある、当社の事業に関連する機密情報</p>\r\n            \r\n            <p>また、あなたは、会社の利益のために正当に承認された方法でのみ、そのような記録、文書、および情報を使用するものとします。為に</p>\r\n            \r\n            <p>この条項の目的 「機密情報」とは、会社の事業および顧客の事業に関する情報を意味します。</p>\r\n            \r\n            <p>これは一般には公開されておらず、雇用の過程で学習する可能性があります。これも、</p>\r\n            \r\n            <p>組織、その顧客リスト、雇用方針、人事、および情報に関連する情報に限定されません</p>\r\n            \r\n            <p>当社の製品、アイデアを含むプロセス、コンセプト、予測、技術、マニュアル、図面、デザイン、</p>\r\n            \r\n            <p>仕様、およびそのような機密情報を含むすべての書類、履歴書、記録、およびその他の文書。</p>\r\n            \r\n            <p>11.3 いかなる時も、許可なくオフィスから機密情報を削除しないでください。</p>\r\n            \r\n            <p>11.4 保護し、開示しないというあなたの義務</p>\r\n            \r\n            <p>e 機密情報は、本契約および/または当社との雇用の満了または終了後も存続します。</p>\r\n            \r\n            <p>11.5 この条項の条件に違反した場合、上記の条項に基づく略式解雇の対象となります。</p>\r\n            \r\n            <p>会社が法律であなたに対して持つことができるその他の救済。</p>\r\n            <p>12. 通知</p>\r\n            \r\n            <p>通知は、登録された事務所の住所で会社に提出することができます。通知は、当社からお客様に提供される場合があります。</p>\r\n            \r\n            <p>公式記録であなたがほのめかした住所。</p>\r\n            \r\n            \r\n            \r\n            <p>13. 会社方針の適用性</p>\r\n            \r\n            <p>会社は、休暇の資格、出産などの事項に関して、随時方針を宣言する権利を有するものとします。</p>\r\n            \r\n            <p>休暇、従業員の福利厚生、勤務時間、異動ポリシーなどであり、独自の裁量により随時変更される場合があります。</p>\r\n            \r\n            <p>当社のそのようなポリシー決定はすべて、あなたを拘束し、その範囲で本契約を無効にするものとします。</p>\r\n            \r\n            \r\n            \r\n            <p>14. 準拠法・裁判管轄</p>\r\n            \r\n            <p>当社でのあなたの雇用は、国の法律の対象となります。すべての紛争は、高等裁判所の管轄に服するものとします</p>\r\n            \r\n            <p>グジャラートのみ。</p>\r\n            \r\n            \r\n            \r\n            <p>15. オファーの受諾</p>\r\n            \r\n            <p>副本に署名して返送することにより、この雇用契約に同意したことを確認してください。</p>\r\n            \r\n            \r\n            \r\n            <p>私たちはあなたを歓迎し、あなたの受け入れを受け取り、あなたと一緒に働くことを楽しみにしています.</p>\r\n            \r\n            \r\n            \r\n            <p>敬具、</p>\r\n            \r\n            <p>{app_name}</p>\r\n            \r\n            <p>{date}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(10,'nl','<h3 style=\"text-align: center;\">Deelnemende brief</h3>\r\n            \r\n            <p>{date}</p>\r\n            \r\n            <p>{employee}</p>\r\n            \r\n            <p>{address}</p>\r\n            \r\n            <p>Onderwerp: Benoeming voor de functie van {designation}</p>\r\n            \r\n            <p>Beste {employee_name},</p>\r\n            \r\n            <p>We zijn verheugd u de positie van {designation} bij {app_name} het Bedrijf aan te bieden onder de volgende voorwaarden en</p>\r\n            \r\n            <p>conditie:</p>\r\n            \r\n            \r\n            <p>1. Indiensttreding</p>\r\n            <p>Uw dienstverband gaat in op {start_date}</p>\r\n            \r\n            \r\n            <p>2. Functietitel</p>\r\n            \r\n            <p>Uw functietitel wordt {designation}.</p>\r\n            \r\n            <p>3. Salaris</p>\r\n            \r\n            <p>Uw salaris en andere voordelen zijn zoals uiteengezet in Schema 1 hierbij.</p>\r\n            \r\n            <p>4. Plaats van detachering</p>\r\n            \r\n            <p>Je wordt geplaatst op {branch}. Het kan echter zijn dat u moet werken op een bedrijfslocatie die het Bedrijf heeft, of</p>\r\n            \r\n            <p>later kan verwerven.</p>\r\n            \r\n            \r\n            \r\n            <p>5. Werkuren</p>\r\n            \r\n            <p>De normale werkdagen zijn van maandag tot en met vrijdag. Je zal de uren moeten werken die nodig zijn voor de</p>\r\n            \r\n            <p>correcte uitvoering van uw taken jegens het bedrijf. De normale werkuren zijn van {start_time} tot {end_time} en jij bent</p>\r\n            \r\n            <p>naar verwachting niet minder dan {total_hours} uur per week werken, en indien nodig voor extra uren, afhankelijk van uw</p>\r\n            \r\n            <p>verantwoordelijkheden.</p>\r\n            \r\n            \r\n            \r\n            <p>6. Verlof/Vakantie</p>\r\n            \r\n            <p>6.1 Je hebt recht op tijdelijk verlof van 12 dagen.</p>\r\n            \r\n            <p>6.2 U heeft recht op 12 werkdagen betaald ziekteverlof.</p>\r\n            \r\n            <p>6.3 De Maatschappij stelt aan het begin van elk jaar een lijst van verklaarde feestdagen op.</p>\r\n            \r\n            \r\n            \r\n            <p>7. Aard van de taken</p>\r\n            \r\n            <p>Je voert alle taken die inherent zijn aan je functie en bijkomende taken zoals het bedrijf naar beste vermogen uit;</p>\r\n            \r\n            <p>kan van tijd tot tijd een beroep op u doen om op te treden. Uw specifieke taken zijn uiteengezet in Bijlage II hierbij.</p>\r\n            \r\n            \r\n            \r\n            <p>8. Bedrijfseigendommen</p>\r\n            \r\n            <p>U onderhoudt bedrijfseigendommen, die u in de loop van</p>\r\n            \r\n            <p>uw dienstverband, en zal al deze eigendommen aan het Bedrijf teruggeven voordat afstand wordt gedaan van uw kosten, bij gebreke waarvan de kosten</p>\r\n            \r\n            <p>hiervan zal door het Bedrijf van u worden verhaald.</p>\r\n            \r\n            \r\n            \r\n            <p>9. Geschenken lenen/aannemen</p>\r\n            \r\n            <p>U zult geen geld, geschenken, beloningen of vergoedingen voor uw persoonlijk gewin lenen of accepteren van uzelf of uzelf op een andere manier plaatsen</p>\r\n            \r\n            <p>onder geldelijke verplichting jegens een persoon/klant met wie u mogelijk offici&euml;le betrekkingen heeft.</p>\r\n            <p>10. Be&euml;indiging</p>\r\n            \r\n            <p>10.1 Uw aanstelling kan door het Bedrijf zonder opgaaf van reden worden be&euml;indigd door u minimaal [Opzegging] maanden van tevoren</p>\r\n            \r\n            <p>schriftelijke opzegging of daarvoor in de plaats komend salaris. In dit artikel wordt onder salaris verstaan ​​het basissalaris.</p>\r\n            \r\n            <p>10.2 U kunt uw dienstverband bij het Bedrijf be&euml;indigen, zonder enige reden, door niet minder dan [Mededeling van de werknemer]</p>\r\n            \r\n            <p>maanden opzegtermijn of salaris voor de niet gespaarde periode, overgebleven na aanpassing van hangende verlofdagen, zoals op datum.</p>\r\n            \r\n            <p>10.3 Het bedrijf behoudt zich het recht voor om uw dienstverband op staande voet te be&euml;indigen zonder enige opzegtermijn of be&euml;indigingsvergoeding</p>\r\n            \r\n            <p>als het redelijke grond heeft om aan te nemen dat u zich schuldig heeft gemaakt aan wangedrag of nalatigheid, of een fundamentele schending van</p>\r\n            \r\n            <p>contract, of enig verlies voor het Bedrijf veroorzaakt.</p>\r\n            \r\n            <p>10. 4 Bij be&euml;indiging van uw dienstverband om welke reden dan ook, geeft u alle eigendommen terug aan het Bedrijf; documenten, en</p>\r\n            \r\n            <p>papier, zowel origineel als kopie&euml;n daarvan, inclusief eventuele monsters, literatuur, contracten, bescheiden, lijsten, tekeningen, blauwdrukken,</p>\r\n            \r\n            <p>brieven, notities, gegevens en dergelijke; en Vertrouwelijke informatie, in uw bezit of onder uw controle met betrekking tot uw</p>\r\n            \r\n            <p>werkgelegenheid of de zakelijke aangelegenheden van klanten.</p>\r\n            <p>11. Vertrouwelijke informatie</p>\r\n            \r\n            <p>11. 1 Tijdens uw dienstverband bij het Bedrijf besteedt u al uw tijd, aandacht en vaardigheden naar uw beste vermogen aan:</p>\r\n            \r\n            <p>zijn zaken. U mag zich niet, direct of indirect, inlaten met of verbonden zijn met, betrokken zijn bij, betrokken zijn bij, in dienst zijn van of</p>\r\n            \r\n            <p>tijd doorbrengen of een studie volgen, zonder voorafgaande toestemming van het bedrijf.bezig met een ander bedrijf of</p>\r\n            \r\n            <p>werkzaamheden of enige andere functie of werk in deeltijd of het volgen van welke opleiding dan ook, zonder voorafgaande toestemming van de</p>\r\n            \r\n            <p>Bedrijf.</p>\r\n            \r\n            <p>11.2 U moet altijd de hoogste graad van vertrouwelijkheid handhaven en de records, documenten en andere</p>\r\n            \r\n            <p>Vertrouwelijke informatie met betrekking tot het bedrijf van het bedrijf die u op enigerlei wijze bekend is of in vertrouwen is genomen</p>\r\n            \r\n            <p>en u zult dergelijke records, documenten en informatie alleen gebruiken op een naar behoren gemachtigde manier in het belang van het bedrijf. Voor</p>\r\n            \r\n            <p>de doeleinden van deze clausule Vertrouwelijke informatiebetekent informatie over het bedrijf van het bedrijf en dat van zijn klanten</p>\r\n            \r\n            <p>die niet beschikbaar is voor het grote publiek en die u tijdens uw dienstverband kunt leren. Dit bevat,</p>\r\n            \r\n            <p>maar is niet beperkt tot informatie met betrekking tot de organisatie, haar klantenlijsten, werkgelegenheidsbeleid, personeel en informatie</p>\r\n            \r\n            <p>over de producten, processen van het bedrijf, inclusief idee&euml;n, concepten, projecties, technologie, handleidingen, tekeningen, ontwerpen,</p>\r\n            \r\n            <p>specificaties, en alle papieren, cvs, dossiers en andere documenten die dergelijke vertrouwelijke informatie bevatten.</p>\r\n            \r\n            <p>11.3 U verwijdert nooit vertrouwelijke informatie van het kantoor zonder toestemming.</p>\r\n            \r\n            <p>11.4 Uw plicht om te beschermen en niet openbaar te maken</p>\r\n            \r\n            <p>e Vertrouwelijke informatie blijft van kracht na het verstrijken of be&euml;indigen van deze Overeenkomst en/of uw dienstverband bij het Bedrijf.</p>\r\n            \r\n            <p>11.5 Schending van de voorwaarden van deze clausule maakt u aansprakelijk voor ontslag op staande voet op grond van de bovenstaande clausule, naast eventuele:</p>\r\n            \r\n            <p>ander rechtsmiddel dat het Bedrijf volgens de wet tegen u heeft.</p>\r\n            <p>12. Kennisgevingen</p>\r\n            \r\n            <p>Kennisgevingen kunnen door u aan het Bedrijf worden gedaan op het adres van de maatschappelijke zetel. Kennisgevingen kunnen door het bedrijf aan u worden gedaan op:</p>\r\n            \r\n            <p>het door u opgegeven adres in de offici&euml;le administratie.</p>\r\n            \r\n            \r\n            \r\n            <p>13. Toepasselijkheid van het bedrijfsbeleid</p>\r\n            \r\n            <p>Het bedrijf heeft het recht om van tijd tot tijd beleidsverklaringen af ​​te leggen met betrekking tot zaken als verlofrecht, moederschap</p>\r\n            \r\n            <p>verlof, werknemersvoordelen, werkuren, transferbeleid, enz., en kan deze van tijd tot tijd naar eigen goeddunken wijzigen.</p>\r\n            \r\n            <p>Al dergelijke beleidsbeslissingen van het Bedrijf zijn bindend voor u en hebben voorrang op deze Overeenkomst in die mate.</p>\r\n            \r\n            \r\n            \r\n            <p>14. Toepasselijk recht/jurisdictie</p>\r\n            \r\n            <p>Uw dienstverband bij het bedrijf is onderworpen aan de landelijke wetgeving. Alle geschillen zijn onderworpen aan de jurisdictie van de High Court</p>\r\n            \r\n            <p>Alleen Gujarat.</p>\r\n            \r\n            \r\n            \r\n            <p>15. Aanvaarding van ons aanbod</p>\r\n            \r\n            <p>Bevestig uw aanvaarding van deze arbeidsovereenkomst door het duplicaat te ondertekenen en terug te sturen.</p>\r\n            \r\n            \r\n            \r\n            <p>Wij heten u van harte welkom en kijken ernaar uit uw acceptatie te ontvangen en met u samen te werken.</p>\r\n            \r\n            \r\n            \r\n            <p>Hoogachtend,</p>\r\n            \r\n            <p>{app_name}</p>\r\n            \r\n            <p>{date}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(11,'pl','<h3 style=\"text-align: center;\">Dołączanie listu</h3>\r\n            \r\n            <p>{date }</p>\r\n            \r\n            <p>{employee_name }</p>\r\n            \r\n            <p>{address }</p>\r\n            \r\n            \r\n            <p>Dotyczy: mianowania na stanowisko {designation}</p>\r\n            \r\n            <p>Szanowny {employee_name },</p>\r\n            \r\n            <p>Mamy przyjemność zaoferować Państwu, stanowisko {designation} z {app_name } \"Sp&oacute;łka\" na poniższych warunkach i</p>\r\n            <p>warunki:</p>\r\n            \r\n            <p>1. Rozpoczęcie pracy</p>\r\n            \r\n            <p>Twoje zatrudnienie będzie skuteczne, jak na {start_date }</p>\r\n            \r\n            <p>2. Tytuł zadania</p>\r\n            <p>Tw&oacute;j tytuł pracy to {designation}.</p>\r\n            \r\n            <p>3. Salary</p>\r\n            \r\n            <p>Twoje wynagrodzenie i inne świadczenia będą określone w Zestawieniu 1, do niniejszego rozporządzenia.</p>\r\n            \r\n            \r\n            <p>4. Miejsce delegowania</p>\r\n            <p>Użytkownik zostanie opublikowany w {branch }. Użytkownik może jednak być zobowiązany do pracy w dowolnym miejscu prowadzenia działalności, kt&oacute;re Sp&oacute;łka posiada, lub może p&oacute;źniej nabyć.</p>\r\n            \r\n            <p>5. Godziny pracy</p>\r\n            <p>Normalne dni robocze są od poniedziałku do piątku. Będziesz zobowiązany do pracy na takie godziny, jakie są niezbędne do prawidłowego wywiązania się ze swoich obowiązk&oacute;w wobec Sp&oacute;łki. Normalne godziny pracy to {start_time } do {end_time }, a użytkownik oczekuje, że będzie pracować nie mniej niż {total_hours } godzin tygodniowo, a jeśli to konieczne, przez dodatkowe godziny w zależności od Twojego</p>\r\n            <p>odpowiedzialności.</p>\r\n            \r\n            <p>6. Urlop/Wakacje</p>\r\n            \r\n            <p>6.1 Przysługuje prawo do urlopu dorywczego w ciągu 12 dni.</p>\r\n            \r\n            <p>6.2 Użytkownik ma prawo do 12 dni roboczych od wypłatnego zwolnienia chorobowego.</p>\r\n            \r\n            <p>6.3 Sp&oacute;łka powiadamia na początku każdego roku wykaz ogłoszonych świąt.&nbsp;</p>\r\n            \r\n            \r\n            \r\n            <p>7. Rodzaj obowiązk&oacute;w</p>\r\n            \r\n            <p>Będziesz wykonywać na najlepsze ze swojej zdolności wszystkie obowiązki, jak są one nieodłączne w swoim poście i takie dodatkowe obowiązki, jak firma może zadzwonić do wykonania, od czasu do czasu. Państwa szczeg&oacute;lne obowiązki są określone w załączniku II do niniejszego rozporządzenia.</p>\r\n            \r\n            \r\n            \r\n            <p>8. Właściwość przedsiębiorstwa</p>\r\n            \r\n            <p>Zawsze będziesz utrzymywać w dobrej kondycji Firmy, kt&oacute;ra może być powierzona do użytku służbowego w trakcie trwania</p>\r\n            \r\n            <p>Twoje zatrudnienie, i zwr&oacute;ci wszystkie takie nieruchomości do Sp&oacute;łki przed zrzeczeniem się opłaty, w przeciwnym razie koszty te same będą odzyskane od Ciebie przez Sp&oacute;łkę.</p>\r\n            \r\n            <p>9. Wypożyczanie/akceptowanie prezent&oacute;w</p>\r\n            \r\n            <p>Nie będziesz pożyczał ani nie akceptować żadnych pieniędzy, dar&oacute;w, nagrody lub odszkodowania za swoje osobiste zyski z lub w inny spos&oacute;b złożyć się w ramach zobowiązania pieniężnego do jakiejkolwiek osoby/klienta, z kt&oacute;rym może być posiadanie oficjalne relacje.</p>\r\n            <p>10. Zakończenie</p>\r\n            \r\n            <p>10.1 Powołanie może zostać wypowiedziane przez Sp&oacute;łkę, bez względu na przyczynę, poprzez podanie nie mniej niż [ Zawiadomienie] miesięcy uprzedniego wypowiedzenia na piśmie lub wynagrodzenia w miejsce jego wystąpienia. Dla cel&oacute;w niniejszej klauzuli, wynagrodzenie oznacza wynagrodzenie podstawowe.</p>\r\n            \r\n            <p>10.2 Użytkownik może rozwiązać umowę o pracę ze Sp&oacute;łką, bez jakiejkolwiek przyczyny, podając nie mniej niż [ ogłoszenie o pracowniku] miesiące przed powiadomieniem lub wynagrodzeniem za niezaoszczędzony okres, pozostawiony po skorygowaniu oczekujących liści, jak na dzień.</p>\r\n            \r\n            <p>10.3 Sp&oacute;łka zastrzega sobie prawo do wypowiedzenia umowy o pracę bez okresu wypowiedzenia lub wypłaty z tytułu rozwiązania umowy, jeżeli ma on uzasadnione podstawy, aby sądzić, że jesteś winny wykroczenia lub niedbalstwa, lub popełnił jakiekolwiek istotne naruszenie umowy lub spowodował jakiekolwiek straty w Sp&oacute;łce.&nbsp;</p>\r\n            \r\n            <p>10. 4 W sprawie rozwiązania stosunku pracy z jakiegokolwiek powodu, powr&oacute;cisz do Sp&oacute;łki wszystkie nieruchomości; dokumenty, i&nbsp;</p>\r\n            \r\n            <p>papieru, zar&oacute;wno oryginału, jak i jego kopii, w tym wszelkich pr&oacute;bek, literatury, um&oacute;w, zapis&oacute;w, wykaz&oacute;w, rysunk&oacute;w, konspekt&oacute;w,</p>\r\n            \r\n            <p>listy, notatki, dane i podobne; informacje poufne, znajdujące się w posiadaniu lub pod Twoją kontrolą związane z zatrudnieniem lub sprawami biznesowymi klient&oacute;w.&nbsp; &nbsp;</p>\r\n            \r\n            \r\n            \r\n            <p>11. Informacje poufne</p>\r\n            \r\n            <p>11. 1 Podczas swojego zatrudnienia z Firmą poświęcisz cały czas, uwagę i umiejętności na najlepszą z Twoich możliwości</p>\r\n            \r\n            <p>swojej działalności gospodarczej. Użytkownik nie może, bezpośrednio lub pośrednio, prowadzić lub wiązać się z, być związany z, dotyka, zatrudniony lub czas lub prowadzić jakikolwiek kierunek studi&oacute;w, bez uprzedniej zgody Company.zaangażował się w innej działalności gospodarczej lub działalności lub jakikolwiek inny post lub pracy w niepełnym wymiarze czasu lub prowadzić jakikolwiek kierunek studi&oacute;w, bez uprzedniej zgody</p>\r\n            \r\n            <p>Firma.</p>\r\n            \r\n            <p>11.2 Zawsze musisz zachować najwyższy stopień poufności i zachować jako poufny akt, dokumenty, i inne&nbsp;</p>\r\n            \r\n            <p>Informacje poufne dotyczące działalności Sp&oacute;łki, kt&oacute;re mogą być znane Państwu lub w dowolny spos&oacute;b zwierzyny, a Użytkownik będzie posługiwać się takimi zapisami, dokumentami i informacjami tylko w spos&oacute;b należycie autoryzowany w interesie Sp&oacute;łki. Do cel&oacute;w niniejszej klauzuli \"Informacje poufne\" oznaczają informacje o działalności Sp&oacute;łki oraz o jej klientach, kt&oacute;re nie są dostępne dla og&oacute;łu społeczeństwa i kt&oacute;re mogą być przez Państwa w trakcie zatrudnienia dowiedzione przez Państwa. Obejmuje to,</p>\r\n            \r\n            <p>ale nie ogranicza się do informacji związanych z organizacją, jej listami klient&oacute;w, politykami zatrudnienia, personelem oraz informacjami o produktach firmy, procesach, w tym pomysłach, koncepcjach, projekcjach, technikach, podręcznikach, rysunkach, projektach,&nbsp;</p>\r\n            \r\n            <p>specyfikacje, a także wszystkie dokumenty, życiorysy, zapisy i inne dokumenty zawierające takie informacje poufne.</p>\r\n            \r\n            <p>11.3 W żadnym momencie nie usunie Pan żadnych Informacji Poufnych z urzędu bez zezwolenia.</p>\r\n            \r\n            <p>11.4 Tw&oacute;j obowiązek ochrony a nie disclos</p>\r\n            \r\n            <p>Informacje poufne przetrwają wygaśnięcie lub rozwiązanie niniejszej Umowy i/lub Twoje zatrudnienie w Sp&oacute;łce.</p>\r\n            \r\n            <p>11.5 Naruszenie warunk&oacute;w niniejszej klauzuli spowoduje, że Użytkownik będzie zobowiązany do skr&oacute;conej umowy w ramach klauzuli powyżej, opr&oacute;cz wszelkich innych środk&oacute;w zaradcze, jakie Sp&oacute;łka może mieć przeciwko Państwu w prawie.</p>\r\n            \r\n            \r\n            \r\n            <p>12. Uwagi</p>\r\n            \r\n            <p>Ogłoszenia mogą być podane przez Państwa do Sp&oacute;łki pod adresem jej siedziby. Ogłoszenia mogą być podane przez Sp&oacute;łkę do Państwa na adres intymniony przez Państwa w ewidencji urzędowej.</p>\r\n            \r\n            \r\n            \r\n            <p>13. Stosowność polityki firmy</p>\r\n            \r\n            <p>Sp&oacute;łka jest uprawniona do składania deklaracji politycznych od czasu do czasu dotyczących spraw takich jak prawo do urlopu macierzyńskiego, macierzyństwo</p>\r\n            \r\n            <p>urlop&oacute;w, świadczeń pracowniczych, godzin pracy, polityki transferowej itp., a także mogą zmieniać to samo od czasu do czasu według własnego uznania.</p>\r\n            \r\n            <p>Wszystkie takie decyzje polityczne Sp&oacute;łki są wiążące dla Państwa i przesłaniają niniejszą Umowę w tym zakresie.</p>\r\n            \r\n            \r\n            \r\n            <p>14. Prawo właściwe/jurysdykcja</p>\r\n            \r\n            <p>Twoje zatrudnienie ze Sp&oacute;łką podlega prawu krajowi. Wszelkie spory podlegają właściwości Sądu Najwyższego</p>\r\n            \r\n            <p>Tylko Gujarat.</p>\r\n            \r\n            \r\n            \r\n            <p>15. Akceptacja naszej oferty</p>\r\n            \r\n            <p>Prosimy o potwierdzenie przyjęcia niniejszej Umowy o pracę poprzez podpisanie i zwr&oacute;cenie duplikatu.</p>\r\n            \r\n            \r\n            \r\n            <p>Zapraszamy Państwa i czekamy na Państwa przyjęcie i wsp&oacute;łpracę z Tobą.</p>\r\n            \r\n            \r\n            \r\n            <p>Z Państwa Sincerely,</p>\r\n            \r\n            <p>{app_name }</p>\r\n            \r\n            <p>{date }</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(12,'pt','<h3 style=\"text-align: center;\">Carta De Ades&atilde;o</h3>\r\n            \r\n            <p>{data}</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{address}</p>\r\n            \r\n            \r\n            <p>Assunto: Nomea&ccedil;&atilde;o para o cargo de {designation}</p>\r\n            \r\n            <p>Querido {employee_name},</p>\r\n            \r\n            \r\n            <p>Temos o prazer de oferec&ecirc;-lo, a posi&ccedil;&atilde;o de {designation} com {app_name} a Empresa nos seguintes termos e</p>\r\n            <p>condi&ccedil;&otilde;es:</p>\r\n            \r\n            \r\n            <p>1. Comentamento do emprego</p>\r\n            \r\n            <p>Seu emprego ser&aacute; efetivo, a partir de {start_date}</p>\r\n            \r\n            \r\n            <p>2. T&iacute;tulo do emprego</p>\r\n            \r\n            <p>Seu cargo de trabalho ser&aacute; {designation}.</p>\r\n            \r\n            <p>3. Sal&aacute;rio</p>\r\n            \r\n            <p>Seu sal&aacute;rio e outros benef&iacute;cios ser&atilde;o conforme estabelecido no Planejamento 1, hereto.</p>\r\n            \r\n            <p>4. Local de postagem</p>\r\n            \r\n            <p>Voc&ecirc; ser&aacute; postado em {branch}. Voc&ecirc; pode, no entanto, ser obrigado a trabalhar em qualquer local de neg&oacute;cios que a Empresa tenha, ou possa posteriormente adquirir.</p>\r\n            \r\n            <p>5. Horas de Trabalho</p>\r\n            \r\n            <p>Os dias normais de trabalho s&atilde;o de segunda a sexta-feira. Voc&ecirc; ser&aacute; obrigado a trabalhar por tais horas, conforme necess&aacute;rio para a quita&ccedil;&atilde;o adequada de suas fun&ccedil;&otilde;es para a Companhia. As horas de trabalho normais s&atilde;o de {start_time} para {end_time} e voc&ecirc; deve trabalhar n&atilde;o menos de {total_horas} horas semanais, e se necess&aacute;rio para horas adicionais dependendo do seu</p>\r\n            <p>responsabilidades.</p>\r\n            \r\n            <p>6. Leave / Holidays</p>\r\n            \r\n            <p>6,1 Voc&ecirc; tem direito a licen&ccedil;a casual de 12 dias.</p>\r\n            \r\n            <p>6,2 Voc&ecirc; tem direito a 12 dias &uacute;teis de licen&ccedil;a remunerada remunerada.</p>\r\n            \r\n            <p>6,3 Companhia notificar&aacute; uma lista de feriados declarados no in&iacute;cio de cada ano.&nbsp;</p>\r\n            \r\n            \r\n            \r\n            <p>7. Natureza dos deveres</p>\r\n            \r\n            <p>Voc&ecirc; ir&aacute; executar ao melhor da sua habilidade todos os deveres como s&atilde;o inerentes ao seu cargo e tais deveres adicionais como a empresa pode ligar sobre voc&ecirc; para executar, de tempos em tempos. Os seus deveres espec&iacute;ficos s&atilde;o estabelecidos no Hereto do Planejamento II.</p>\r\n            \r\n            \r\n            \r\n            <p>8. Propriedade da empresa</p>\r\n            \r\n            <p>Voc&ecirc; sempre manter&aacute; em bom estado propriedade Empresa, que poder&aacute; ser confiada a voc&ecirc; para uso oficial durante o curso de</p>\r\n            \r\n            <p>o seu emprego, e devolver&aacute; toda essa propriedade &agrave; Companhia antes de abdicar de sua acusa&ccedil;&atilde;o, falhando qual o custo do mesmo ser&aacute; recuperado de voc&ecirc; pela Companhia.</p>\r\n            \r\n            \r\n            \r\n            <p>9. Borremir / aceitar presentes</p>\r\n            \r\n            <p>Voc&ecirc; n&atilde;o vai pedir empr&eacute;stimo ou aceitar qualquer dinheiro, presente, recompensa ou indeniza&ccedil;&atilde;o por seus ganhos pessoais de ou de outra forma colocar-se sob obriga&ccedil;&atilde;o pecuni&aacute;ria a qualquer pessoa / cliente com quem voc&ecirc; pode estar tendo rela&ccedil;&otilde;es oficiais.</p>\r\n            \r\n            \r\n            \r\n            <p>10. Termina&ccedil;&atilde;o</p>\r\n            \r\n            <p>10,1 Sua nomea&ccedil;&atilde;o pode ser rescindida pela Companhia, sem qualquer raz&atilde;o, dando-lhe n&atilde;o menos do que [aviso] meses de aviso pr&eacute;vio por escrito ou de sal&aacute;rio em lieu deste. Para efeito da presente cl&aacute;usula, o sal&aacute;rio deve significar sal&aacute;rio base.</p>\r\n            \r\n            <p>10,2 Voc&ecirc; pode rescindir seu emprego com a Companhia, sem qualquer causa, ao dar nada menos que [Aviso de contrata&ccedil;&atilde;o] meses de aviso pr&eacute;vio ou sal&aacute;rio para o per&iacute;odo n&atilde;o salvo, deixado ap&oacute;s ajuste de folhas pendentes, conforme data de encontro.</p>\r\n            \r\n            <p>10,3 Empresa reserva-se o direito de rescindir o seu emprego sumariamente sem qualquer prazo de aviso ou de rescis&atilde;o se tiver terreno razo&aacute;vel para acreditar que voc&ecirc; &eacute; culpado de m&aacute; conduta ou neglig&ecirc;ncia, ou tenha cometido qualquer viola&ccedil;&atilde;o fundamental de contrato, ou tenha causado qualquer perda para a Empresa.&nbsp;</p>\r\n            \r\n            <p>10. 4 Sobre a rescis&atilde;o do seu emprego por qualquer motivo, voc&ecirc; retornar&aacute; para a Empresa todos os bens; documentos e&nbsp;</p>\r\n            \r\n            <p>papel, tanto originais como c&oacute;pias dos mesmos, incluindo quaisquer amostras, literatura, contratos, registros, listas, desenhos, plantas,</p>\r\n            \r\n            <p>cartas, notas, dados e semelhantes; e Informa&ccedil;&otilde;es Confidenciais, em sua posse ou sob seu controle relacionado ao seu emprego ou aos neg&oacute;cios de neg&oacute;cios dos clientes.&nbsp; &nbsp;</p>\r\n            \r\n            \r\n            \r\n            <p>11. Informa&ccedil;&otilde;es Confidenciais</p>\r\n            \r\n            <p>11. 1 Durante o seu emprego com a Companhia voc&ecirc; ir&aacute; dedicar todo o seu tempo, aten&ccedil;&atilde;o e habilidade para o melhor de sua capacidade de</p>\r\n            \r\n            <p>o seu neg&oacute;cio. Voc&ecirc; n&atilde;o deve, direta ou indiretamente, se envolver ou associar-se com, estar conectado com, preocupado, empregado, ou tempo ou prosseguir qualquer curso de estudo, sem a permiss&atilde;o pr&eacute;via do Company.engajado em qualquer outro neg&oacute;cio ou atividades ou qualquer outro cargo ou trabalho parcial ou prosseguir qualquer curso de estudo, sem a permiss&atilde;o pr&eacute;via do</p>\r\n            \r\n            <p>Empresa.</p>\r\n            \r\n            <p>11,2 &Eacute; preciso manter sempre o mais alto grau de confidencialidade e manter como confidenciais os registros, documentos e outros&nbsp;</p>\r\n            \r\n            <p>Informa&ccedil;&otilde;es confidenciais relativas ao neg&oacute;cio da Companhia que possam ser conhecidas por voc&ecirc; ou confiadas em voc&ecirc; por qualquer meio e utilizar&atilde;o tais registros, documentos e informa&ccedil;&otilde;es apenas de forma devidamente autorizada no interesse da Companhia. Para efeitos da presente cl&aacute;usula \"Informa&ccedil;&otilde;es confidenciais\" significa informa&ccedil;&atilde;o sobre os neg&oacute;cios da Companhia e a dos seus clientes que n&atilde;o est&aacute; dispon&iacute;vel para o p&uacute;blico em geral e que poder&aacute; ser aprendida por voc&ecirc; no curso do seu emprego. Isso inclui,</p>\r\n            \r\n            <p>mas n&atilde;o se limita a, informa&ccedil;&otilde;es relativas &agrave; organiza&ccedil;&atilde;o, suas listas de clientes, pol&iacute;ticas de emprego, pessoal, e informa&ccedil;&otilde;es sobre os produtos da Companhia, processos incluindo ideias, conceitos, proje&ccedil;&otilde;es, tecnologia, manuais, desenho, desenhos,&nbsp;</p>\r\n            \r\n            <p>especifica&ccedil;&otilde;es, e todos os pap&eacute;is, curr&iacute;culos, registros e outros documentos que contenham tais Informa&ccedil;&otilde;es Confidenciais.</p>\r\n            \r\n            <p>11,3 Em nenhum momento, voc&ecirc; remover&aacute; quaisquer Informa&ccedil;&otilde;es Confidenciais do escrit&oacute;rio sem permiss&atilde;o.</p>\r\n            \r\n            <p>11,4 O seu dever de salvaguardar e n&atilde;o os desclos</p>\r\n            \r\n            <p>Informa&ccedil;&otilde;es Confidenciais sobreviver&atilde;o &agrave; expira&ccedil;&atilde;o ou &agrave; rescis&atilde;o deste Contrato e / ou do seu emprego com a Companhia.</p>\r\n            \r\n            <p>11,5 Viola&ccedil;&atilde;o das condi&ccedil;&otilde;es desta cl&aacute;usula ir&aacute; torn&aacute;-lo sujeito a demiss&atilde;o sum&aacute;ria sob a cl&aacute;usula acima, al&eacute;m de qualquer outro rem&eacute;dio que a Companhia possa ter contra voc&ecirc; em lei.</p>\r\n            \r\n            \r\n            \r\n            <p>12. Notices</p>\r\n            \r\n            <p>Os avisos podem ser conferidos por voc&ecirc; &agrave; Empresa em seu endere&ccedil;o de escrit&oacute;rio registrado. Os avisos podem ser conferidos pela Companhia a voc&ecirc; no endere&ccedil;o intimado por voc&ecirc; nos registros oficiais.</p>\r\n            \r\n            \r\n            \r\n            <p>13. Aplicabilidade da Pol&iacute;tica da Empresa</p>\r\n            \r\n            <p>A Companhia tem direito a fazer declara&ccedil;&otilde;es de pol&iacute;tica de tempos em tempos relativos a mat&eacute;rias como licen&ccedil;a de licen&ccedil;a, maternidade</p>\r\n            \r\n            <p>sair, benef&iacute;cios dos empregados, horas de trabalho, pol&iacute;ticas de transfer&ecirc;ncia, etc., e pode alterar o mesmo de vez em quando a seu exclusivo crit&eacute;rio.</p>\r\n            \r\n            <p>Todas essas decis&otilde;es de pol&iacute;tica da Companhia devem ser vinculativas para si e substituir&atilde;o este Acordo nessa medida.</p>\r\n            \r\n            \r\n            \r\n            <p>14. Direito / Jurisdi&ccedil;&atilde;o</p>\r\n            \r\n            <p>Seu emprego com a Companhia est&aacute; sujeito &agrave;s leis do Pa&iacute;s. Todas as disputas est&atilde;o sujeitas &agrave; jurisdi&ccedil;&atilde;o do Tribunal Superior</p>\r\n            \r\n            <p>Gujarat apenas.</p>\r\n            \r\n            \r\n            \r\n            <p>15. Aceita&ccedil;&atilde;o da nossa oferta</p>\r\n            \r\n            <p>Por favor, confirme sua aceita&ccedil;&atilde;o deste Contrato de Emprego assinando e retornando a c&oacute;pia duplicada.</p>\r\n            \r\n            \r\n            \r\n            <p>N&oacute;s acolhemos voc&ecirc; e estamos ansiosos para receber sua aceita&ccedil;&atilde;o e para trabalhar com voc&ecirc;.</p>\r\n            \r\n            \r\n            \r\n            <p>Seu Sinceramente,</p>\r\n            \r\n            <p>{app_name}</p>\r\n            \r\n            <p>{data}</p>\r\n            ',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(13,'ru','<h3 style=\"text-align: center;\">Присоединение к письму</h3>\r\n            \r\n            <p>{date}</p>\r\n            \r\n            <p>{ employee_name }</p>\r\n            <p>{address}</p>\r\n            \r\n            <p>Тема: Назначение на должность {designation}</p>\r\n            \r\n            <p>Уважаемый { employee_name },</p>\r\n            \r\n            <p>Мы рады предложить Вам, позицию {designation} с { app_name } Компания на следующих условиях и</p>\r\n            \r\n            <p>условия:</p>\r\n            \r\n            \r\n            <p>1. Начало работы</p>\r\n            \r\n            <p>Ваше трудоустройство будет эффективным, начиная с { start_date }</p>\r\n            \r\n            \r\n            <p>2. Название должности</p>\r\n            <p>Ваш заголовок задания будет {designation}.</p>\r\n            \r\n            <p>3. Зарплата</p>\r\n            <p>Ваши оклады и другие пособия будут установлены в соответствии с расписанием, изложенным в приложении 1 к настоящему.</p>\r\n            \r\n            <p>4. Место размещения</p>\r\n            <p>Вы будете работать в { branch }. Вы, однако, можете работать в любом месте, которое компания имеет или может впоследствии приобрести.</p>\r\n            \r\n            \r\n            \r\n            <p>5. Часы работы</p>\r\n            <p>Обычные рабочие дни-с понедельника по пятницу. Вы должны будете работать в течение таких часов, как это необходимо для надлежащего выполнения Ваших обязанностей перед компанией. Обычные рабочие часы-от { start_time } до { end_time }, и вы, как ожидается, будут работать не менее { total_hours } часов каждую неделю, и при необходимости в течение дополнительных часов в зависимости от вашего</p>\r\n            <p>ответственности.</p>\r\n            <p>6. Отпуск/Праздники</p>\r\n            \r\n            <p>6.1 Вы имеете право на случайный отпуск продолжительностью 12 дней.</p>\r\n            \r\n            <p>6.2 Вы имеете право на 12 рабочих дней оплачиваемого отпуска по болезни.</p>\r\n            \r\n            <p>6.3 Компания в начале каждого года уведомляет об объявленных праздниках.&nbsp;</p>\r\n            \r\n            \r\n            \r\n            <p>7. Характер обязанностей</p>\r\n            \r\n            <p>Вы будете выполнять все обязанности, присующие вам, и такие дополнительные обязанности, которые компания может призвать к вам, время от времени. Ваши конкретные обязанности изложены в приложении II к настоящему.</p>\r\n            \r\n            \r\n            \r\n            <p>8. Свойство компании</p>\r\n            \r\n            <p>Вы всегда будете поддерживать в хорошем состоянии имущество Компании, которое может быть доверено Вам для служебного пользования в течение</p>\r\n            \r\n            <p>вашей занятости, и возвратит все это имущество Компании до отказа от вашего заряда, при отсутствии которого стоимость одного и того же имущества будет взыскана с Вас компанией.</p>\r\n            \r\n            \r\n            \r\n            <p>9. Боровить/принять подарки</p>\r\n            \r\n            <p>Вы не будете брать взаймы или принимать какие-либо деньги, подарки, вознаграждение или компенсацию за ваши личные доходы от или в ином месте под денежный долг любому лицу/клиенту, с которым у вас могут быть официальные сделки.</p>\r\n            \r\n            \r\n            \r\n            <p>10. Прекращение</p>\r\n            \r\n            <p>10.1 Ваше назначение может быть прекращено компанией без каких бы то ни было оснований, предоставляя Вам не менее [ Уведомление] месяцев, предшея уведомлению в письменной форме или окладе вместо них. Для целей этого положения заработная плата означает базовый оклад.</p>\r\n            \r\n            <p>10.2 Вы можете прекратить свою трудовую деятельность с компанией без каких-либо причин, предоставляя не меньше, чем [ Employee Notice] months  предварительное уведомление или оклад за несохраненный период, оставатся после корректировки отложенных листьев, как на сегодняшний день.</p>\r\n            \r\n            <p>10.3 Компания оставляет за собой право прекратить вашу работу в суммарном порядке без какого-либо уведомления о сроке или увольнении, если у нее есть достаточные основания полагать, что вы виновны в проступке или халатности, или совершили какое-либо существенное нарушение договора, или причинило убытки Компании.&nbsp;</p>\r\n            \r\n            <p>10. 4 О прекращении вашей работы по какой бы то ни было причине вы вернетесь в Компании все имущество; документы, а&nbsp;</p>\r\n            \r\n            <p>бумаги, как оригинальные, так и их копии, включая любые образцы, литературу, контракты, записи, списки, чертежи, чертежи,</p>\r\n            \r\n            <p>письма, заметки, данные и тому подобное; и Конфиденциальная информация, в вашем распоряжении или под вашим контролем, связанным с вашей работой или деловыми делами клиентов.&nbsp; &nbsp;</p>\r\n            \r\n            \r\n            \r\n            <p>11. Конфиденциальная информация</p>\r\n            \r\n            <p>11. 1 Во время вашего трудоустройства с компанией Вы посвяте все свое время, внимание, умение максимально</p>\r\n            \r\n            <p>Его бизнес. Вы не должны, прямо или косвенно, заниматься или ассоциировать себя с заинтересованными, занятым, занятым, или временем, или продолжать любой курс обучения, без предварительного разрешения Компани.заниматься каким-либо другим бизнесом или деятельностью или любой другой пост или работать неполный рабочий день или заниматься какой бы то ни было исследованием, без предварительного разрешения</p>\r\n            \r\n            <p>Компания.</p>\r\n            \r\n            <p>11.2 Вы всегда должны сохранять наивысшую степень конфиденциальности и хранить в качестве конфиденциальной записи, документы и другие&nbsp;</p>\r\n            \r\n            <p>Конфиденциальная информация, касающаяся бизнеса Компании, которая может быть вам известна или конфиденциальна любым способом, и Вы будете использовать такие записи, документы и информацию только в установленном порядке в интересах Компании. Для целей настоящей статьи \"Конфиденциальная информация\" означает информацию о бизнесе Компании и о ее клиентах, которая недоступна для широкой общественности и которая может быть изучилась Вами в ходе вашей работы. Это включает в себя:</p>\r\n            \r\n            <p>но не ограничивается информацией, касающейся организации, ее списков клиентов, политики в области занятости, персонала и информации о продуктах Компании, процессах, включая идеи, концепции, прогнозы, технологии, руководства, чертеж, чертеж,&nbsp;</p>\r\n            \r\n            <p>спецификации, и все бумаги, резюме, записи и другие документы, содержащие такую Конфиденциальную Информацию.</p>\r\n            \r\n            <p>11.3 В любое время вы не будете удалять конфиденциальную информацию из офиса без разрешения.</p>\r\n            \r\n            <p>11.4 Ваш долг защищать и не отсосать</p>\r\n            \r\n            <p>e Конфиденциальная информация выдержит срок действия или прекращения действия настоящего Соглашения и/или вашей работы с компанией.</p>\r\n            \r\n            <p>11.5 Нарушение условий, изложенных в настоящем положении, приведет к тому, что в дополнение к любым другим средствам правовой защиты, которые компания может иметь против вас, в соответствии с вышеприведенным положением, вы можете получить краткое увольнение в соответствии с этим положением.</p>\r\n            \r\n            \r\n            \r\n            <p>12. Замечания</p>\r\n            \r\n            <p>Уведомления могут быть даны Вами Компании по адресу ее зарегистрированного офиса. Извещения могут быть даны компанией Вам по адресу, с которым вы в официальных отчетах.</p>\r\n            \r\n            \r\n            \r\n            <p>13. Применимость политики компании</p>\r\n            \r\n            <p>Компания вправе время от времени делать политические заявления по таким вопросам, как право на отпуск, материнство</p>\r\n            \r\n            <p>отпуска, пособия для работников, продолжительность рабочего дня, трансферная политика и т.д. и время от времени могут изменяться исключительно по своему усмотрению.</p>\r\n            \r\n            <p>Все такие принципиальные решения Компании являются обязательными для Вас и переопределяют это Соглашение в такой степени.</p>\r\n            \r\n            \r\n            \r\n            <p>14. Регулирующий Право/юрисдикция</p>\r\n            \r\n            <p>Ваше трудоустройство с компанией подпадает под действие законов страны. Все споры подлежат юрисдикции Высокого суда</p>\r\n            \r\n            <p>Только Гуджарат.</p>\r\n            \r\n            \r\n            \r\n            <p>15. Принятие нашего предложения</p>\r\n            \r\n            <p>Пожалуйста, подтвердите свое согласие с этим Договором о занятости, подписав и возвращая дубликат копии.</p>\r\n            \r\n            \r\n            \r\n            <p>Мы приветствуем Вас и надеемся на то, что Вы принимаете свое согласие и работаете с Вами.</p>\r\n            \r\n            \r\n            \r\n            <p>Искренне Ваш,</p>\r\n            \r\n            <p>{ app_name }</p>\r\n            \r\n            <p>{date}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(14,'tr','<h3 style=\"text-align: center;\">Katılma Mektubu</h3>\r\n            <p>{date}</p>\r\n            <p>{employee_name}</p>\r\n            <p>{address}</p>\r\n            <p>Konu: Kadroya randevu {designation}</p>\r\n            <p>Canım {employee_name},</p>\r\n            <p>konumunu size sunmaktan mutluluk duyuyoruz {designation} ile {app_name} Şirket aşağıdaki şartlarla ve</p>\r\n            <p>koşullar:</p>\r\n            <p>1. işe başlama</p>\r\n            <p>İşe alımınız şu tarihten itibaren etkili olacaktır {start_date}</p>\r\n            <p>2. İş unvanı</p>\r\n            <p>İş unvanınız olacak{designation}.</p>\r\n            <p>3. Maaş</p>\r\n            <p>Maaşınız ve diğer menfaatleriniz Programda belirtildiği gibi olacaktır 1, buraya.</p>\r\n            <p>4. Gönderme Yeri</p>\r\n            <p>adresinde yayınlanacaksınız {branch}. Ancak Şirketin sahip olduğu herhangi bir işyerinde çalışmanız gerekebilir veya</p>\r\n            <p>daha sonra edinebilir.</p>\r\n            <p>5. Çalışma saati</p>\r\n            <p>Normal çalışma günleri Pazartesiden Cumaya kadardır. için gerekli olan saatlerde çalışmanız istenecektir</p>\r\n            <p>Şirkete karşı görevlerinizi uygun şekilde yerine getirmek. Normal çalışma saatleri, {start_time} ile {end_time} ve sen</p>\r\n            <p>daha az çalışması beklenmiyor {total_hours} her hafta saat ve gerekirse, durumunuza bağlı olarak ek saatler</p>\r\n            <p>sorumluluklar.</p>\r\n            <p>6. İzin/Tatiller</p>\r\n            <p>6.1 12 gün izin hakkınız var.</p>\r\n            <p>6.2 12 iş günü ücretli hastalık izni hakkınız var.</p>\r\n            <p>6.3 Şirket, her yılın başında ilan edilen tatillerin bir listesini bildirecektir.</p>\r\n            <p>7. görevlerin niteliği</p>\r\n            <p>Görevinizin doğasında bulunan tüm görevleri ve şirket olarak bu tür ek görevleri elinizden gelen en iyi şekilde yerine getireceksiniz</p>\r\n            <p>zaman zaman performans göstermeniz için sizi çağırabilir. Özel görevleriniz, burada Çizelge IIde belirtilmiştir.</p>\r\n            <p>8. Şirket mülkiyeti</p>\r\n            <p>Görev süresince resmi kullanım için size emanet edilmiş olabilecek Şirket mallarını her zaman iyi durumda tutacaksınız</p>\r\n            <p>istihdamınızdan feragat etmeden önce bu tür tüm mülkleri Şirkete iade edecektir, aksi takdirde maliyet</p>\r\n            <p>aynı tutar Şirket tarafından sizden tahsil edilecektir.</p>\r\n            <p>9. Ödünç alma/hediye kabul etme</p>\r\n            <p>Kişisel kazançlarınız için kendinizden herhangi bir para, hediye, ödül veya tazminat ödünç almayacak veya kabul etmeyeceksiniz</p>\r\n            <p>resmi ilişkiler içinde olabileceğiniz herhangi bir kişiye/müşteriye karşı maddi yükümlülük altında.</p>\r\n            <p>10. Sonlandırma</p>\r\n            <p>10.1 Randevunuz Şirket tarafından size en az [Bildirim] ay öncesinden bildirimde bulunularak herhangi bir sebep göstermeksizin feshedilebilir</p>\r\n            <p>yazılı bildirim veya bunun yerine maaş. Bu maddenin amaçları doğrultusunda maaş, temel maaş anlamına gelir.</p>\r\n            <p>10.2 [Çalışan Bildirimi]nden daha az olmamak kaydıyla, Şirketteki çalışmanızı herhangi bir sebep göstermeden feshedebilirsiniz</p>\r\n            <p>ay önceden ihbar veya kaydedilmemiş dönem için maaş, tarih itibariyle bekleyen izinlerin ayarlanmasından sonra kalan.</p>\r\n            <p>10.3 Şirket, herhangi bir ihbar süresi veya fesih ödemesi olmaksızın iş akdinizi aniden feshetme hakkını saklı tutar</p>\r\n            <p>suiistimal veya ihmalden suçlu olduğunuza veya herhangi bir temel ihlalde bulunduğunuza inanmak için makul bir gerekçesi varsa</p>\r\n            <p>sözleşmeye veya Şirkete herhangi bir zarara neden oldu.</p>\r\n            <p>10. 4 Herhangi bir nedenle işinize son verildiğinde, tüm mal varlığınızı Şirkete iade edeceksiniz; belgeler ve</p>\r\n            <p>tüm numuneler, literatür, sözleşmeler, kayıtlar, listeler, çizimler, planlar dahil olmak üzere kağıt, hem orijinali hem de kopyaları,</p>\r\n            <p>mektuplar, notlar, veriler ve benzerleri; ve Gizli Bilgiler, sizin mülkiyetinizde veya kontrolünüz altında</p>\r\n            <p>İstihdam veya müşterilerin iş ilişkilerine.</p>\r\n            <p>11. Kesin bilgi</p>\r\n            <p>11. 1 Şirkette çalıştığınız süre boyunca tüm zamanınızı, dikkatinizi ve becerinizi elinizden gelenin en iyisini yapmaya adayacaksınız</p>\r\n            <p>onun işi. Doğrudan veya dolaylı olarak kendinizle ilişki kurmamalı veya ilişkilendirmemeli, bunlarla bağlantı kurmamalı, ilgilenmemeli, istihdam edilmemeli veya</p>\r\n            <p>Şirketin önceden izni olmaksızın herhangi bir eğitim kursuna devam etmeyin veya herhangi bir kursa devam etmeyin</p>\r\n            <p>faaliyetleri veya diğer herhangi bir görev veya yarı zamanlı çalışma veya önceden izin almaksızın herhangi bir eğitim kursuna devam etme</p>\r\n            <p>Şirket.</p>\r\n            <p>11.2 Her zaman en yüksek derecede gizliliği korumalı ve kayıtları, belgeleri ve diğer bilgileri gizli tutmalısınız.</p>\r\n            <p>Sizin tarafınızdan bilinebilecek veya herhangi bir şekilde size güvenilebilecek Şirketin işleriyle ilgili Gizli Bilgiler</p>\r\n            <p>ve bu tür kayıtları, belgeleri ve bilgileri yalnızca usulüne uygun olarak Şirketin çıkarları doğrultusunda kullanacaksınız. İçin</p>\r\n            <p>bu maddenin amaçları Gizli Bilgiler, Şirketin ve müşterilerinin işleri hakkında bilgi anlamına gelir</p>\r\n            <p>halka açık olmayan ve istihdamınız sırasında sizin tarafınızdan öğrenilebilecek olan. Bu içerir,</p>\r\n            <p>ancak bunlarla sınırlı olmamak üzere, kuruluşa ilişkin bilgiler, müşteri listeleri, istihdam politikaları, personel ve bilgiler</p>\r\n            <p>fikirler, kavramlar, projeksiyonlar, teknoloji, kılavuzlar, çizimler, tasarımlar dahil olmak üzere Şirketin ürünleri, süreçleri hakkında,</p>\r\n            <p>spesifikasyonlar ve bu tür Gizli Bilgileri içeren tüm belgeler, özgeçmişler, kayıtlar ve diğer belgeler.</p>\r\n            <p>11.3 Gizli Bilgileri hiçbir zaman izinsiz olarak ofisten çıkarmayacak mısınız?.</p>\r\n            <p>11.4 Koruma ve açıklamama göreviniz</p>\r\n            <p>e Gizli Bilgiler, bu Sözleşmenin sona ermesinden veya feshedilmesinden ve/veya Şirketteki istihdamınızdan sonra da geçerliliğini koruyacaktır.</p>\r\n            <p>11.5 Bu maddenin koşullarının ihlali, sizi herhangi bir ek olarak yukarıdaki madde uyarınca derhal işten çıkarmaya yükümlü kılacaktır</p>\r\n            <p>Şirketin kanunen size karşı sahip olabileceği diğer çareler.</p>\r\n            <p>12. Bildirimler</p>\r\n            <p>Tebligatlar tarafınızca Şirket in kayıtlı ofis adresine gönderilebilir. Bildirimler Şirket tarafından size şu adreste verilebilir</p>\r\n            <p>tResmi kayıtlarda sizin tarafınızdan bildirilen adres.</p>\r\n            <p>13. Şirket Politikasının Uygulanabilirliği</p>\r\n            <p>Şirket, izin hakkı, analık gibi konularda zaman zaman poliçe beyanı yapmaya yetkilidir</p>\r\n            <p>izinler, çalışanlara sağlanan faydalar, çalışma saatleri, transfer politikaları vb. ve tamamen kendi takdirine bağlı olarak zaman zaman değiştirebilir.</p>\r\n            <p>Şirketin tüm bu tür politika kararları sizin için bağlayıcı olacak ve bu Sözleşmeyi o ölçüde geçersiz kılacaktır.</p>\r\n            <p>14. Geçerli Yasa/Yargı Yetkisi</p>\r\n            <p>Şirkette istihdamınız Ülke yasalarına tabidir. Tüm ihtilaflar Yüksek Mahkemenin yargı yetkisine tabi olacaktır.</p>\r\n            <p>sadece Gujarat.</p>\r\n            <p>15. teklifimizin kabulü</p>\r\n            <p>Lütfen bu İş Sözleşmesini kabul ettiğinizi imzalayarak ve kopya kopyayı geri göndererek onaylayın.</p>\r\n            <p>Size hoş geldiniz diyor ve kabulünüzü almayı ve sizinle çalışmayı sabırsızlıkla bekliyoruz.</p>\r\n            <p>Saygılarımla,</p>\r\n            <p>{app_name}</p>\r\n            <p>{date}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(15,'zh','<h3 style=\"text-align: center;\">加盟信</h3>\r\n            <p>{date}</p>\r\n            <p>{employee_name}</p>\r\n            <p>{address}</p>\r\n            <p>主题：任命 {designation}</p>\r\n            <p>亲爱的 {employee_name},</p>\r\n            <p>我们很高兴为您提供以下职位： {designation} 和 {app_name} 公司按照以下条款和</p>\r\n            <p>状况:</p>\r\n            <p>1. 开始就业</p>\r\n            <p>您的雇佣关系将在以下日期生效 {start_date}</p>\r\n            <p>2. 职称</p>\r\n            <p>您的职位名称将是{designation}.</p>\r\n            <p>3. 薪水</p>\r\n            <p>您的工资和其他福利将在附表 1 中列出，此处为.</p>\r\n            <p>4. 发帖地点</p>\r\n            <p>您将被发布在 {branch}. 但是，您可能需要在公司拥有的任何营业地点工作，或者</p>\r\n            <p>以后可能会获得.</p>\r\n            <p>5. 几小时的工作</p>\r\n            <p>正常工作日为周一至周五。您将需要在必要的时间内工作</p>\r\n            <p>正确履行您对公司的职责。正常工作时间是从 {start_time} 到 {end_time} 而你是</p>\r\n            <p>预计工作不少于 {total_hours} 每周几个小时，如有必要，根据您的情况还可以增加几个小时</p>\r\n            <p>责任.</p>\r\n            <p>6. 休假/节假日</p>\r\n            <p>6.1 您有权享受 12 天的事假.</p>\r\n            <p>6.2 您有权享受 12 个工作日的带薪病假.</p>\r\n            <p>6.3 公司应在每年年初公布已宣布的假期清单.</p>\r\n            <p>7. 职责性质</p>\r\n            <p>您将尽最大努力履行您职位固有的所有职责以及公司的其他职责</p>\r\n            <p>可能会不时要求您表演。您的具体职责在附表 II 中列出，以便.</p>\r\n            <p>8. 公司财产</p>\r\n            <p>您将始终保持公司财产的良好状态，这些财产可能会在工作期间委托给您用于正式使用</p>\r\n            <p>您的工作，并应在放弃您的职责之前将所有此类财产归还给公司，否则费用</p>\r\n            <p>公司将向您追回相同的费用.</p>\r\n            <p>9. 借用/接受礼物</p>\r\n            <p>您不会借用或接受任何金钱、礼物、奖励或补偿来获取个人利益或以其他方式安置自己</p>\r\n            <p>对可能与您有正式往来的任何人/客户承担金钱义务.</p>\r\n            <p>10. 终止</p>\r\n            <p>10.1 公司可以在至少 [通知] 个月之前向您发出无任何理由的终止您的任命</p>\r\n            <p>书面通知或工资代替。本条所称工资是指基本工资.</p>\r\n            <p>10.2 您可以无任何理由地终止与公司的雇佣关系，只需发出不少于[员工通知]</p>\r\n            <p>提前几个月通知或未保存期间的工资，在待休假调整后剩余，截至日期.</p>\r\n            <p>10.3 公司保留立即终止雇佣关系的权利，无需任何通知期或终止付款</p>\r\n            <p>如果有合理的理由相信您犯有不当行为或疏忽，或犯有任何根本违反</p>\r\n            <p>合同，或给公司造成任何损失.</p>\r\n            <p>10. 4 无论出于何种原因终止雇佣关系，您都应将所有财产归还给公司；文件，以及</p>\r\n            <p>纸张，原件和复印件，包括任何样品、文献、合同、记录、清单、图纸、蓝图,</p>\r\n            <p>信件、笔记、数据等；您拥有或控制下的与您的相关的机密信息</p>\r\n            <p>就业或客户商务事务.</p>\r\n            <p>11. 机密信息</p>\r\n            <p>11. 1 在您受雇于公司期间，您将尽最大努力投入全部时间、注意力和技能，</p>\r\n            <p>它的业务。您不得直接或间接地参与、联系、涉及、雇用或参与</p>\r\n            <p>未经公司事先许可，花时间或进行任何学习课程。从事任何其他业务或</p>\r\n            <p>未经雇主事先许可，从事任何活动或任何其他职位或兼职工作或进行任何学习课程</p>\r\n            <p>公司.</p>\r\n            <p>11.2 您必须始终保持最高程度的机密性，并对记录、文件和其他内容保密</p>\r\n            <p>您可能知道或通过任何方式向您透露的与公司业务相关的机密信息</p>\r\n            <p>您只能以符合公司利益的正式授权方式使用此类记录、文件和信息。为了</p>\r\n            <p>本条款的目的机密信息是指有关公司业务及其客户业务的信息</p>\r\n            <p>这是一般公众无法获得的，但您可以在工作过程中了解到。这包括,</p>\r\n            <p>但不限于与组织、其客户名单、雇佣政策、人员和信息有关的信息</p>\r\n            <p>关于公司的产品、流程，包括想法、概念、预测、技术、手册、绘图、设计,</p>\r\n            <p>规范以及包含此类机密信息的所有文件、简历、记录和其他文件.</p>\r\n            <p>11.3 未经许可，您不得在任何时候从办公室删除任何机密信息.</p>\r\n            <p>11.4 您有责任保护且不泄露</p>\r\n            <p>e 机密信息在本协议到期或终止和/或您与公司的雇佣关系到期或终止后仍然有效.</p>\r\n            <p>11.5 违反本条款的条件将使您根据上述条款承担立即解雇的责任，此外，</p>\r\n            <p>公司可能在法律上对您采取的其他补救措施.</p>\r\n            <p>12. 通知</p>\r\n            <p>您可以通过公司的注册办公地址向公司发出通知。公司可能会向您发出通知，地址为：</p>\r\n            <p>您在正式记录中透露的地址.</p>\r\n            <p>13. 公司政策的适用性</p>\r\n            <p>公司有权不时就休假、生育等事宜作出政策声明</p>\r\n            <p>休假、员工福利、工作时间、调动政策等，并可自行决定不时更改.</p>\r\n            <p>公司的所有此类政策决定均对您具有约束力，并在一定程度上优先于本协议.</p>\r\n            <p>14. 适用法律/司法管辖区</p>\r\n            <p>您在公司的雇佣关系须遵守国家/地区法律。所有争议均受高等法院管辖</p>\r\n            <p>仅限古吉拉特邦.</p>\r\n            <p>15. 接受我们的报价</p>\r\n            <p>请签署并返回副本以确认您接受本雇佣合同.</p>\r\n            <p>我们欢迎您并期待得到您的认可并与您合作.</p>\r\n            <p>此致,</p>\r\n            <p>{app_name}</p>\r\n            <p>{date}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(16,'he','<h3 style=\"text-align: center;\">מכתב הצטרפות</h3>\r\n            <p>{date}</p>\r\n            <p>{employee_name}</p>\r\n            <p>{address}</p>\r\n            <p>נושא: מינוי לתפקיד של {designation}</p>\r\n            <p>יָקָר {employee_name},</p>\r\n            <p>אנו שמחים להציע לך את התפקיד של {designation} עם {app_name} החברה בתנאים הבאים ו</p>\r\n            <p>תנאים:</p>\r\n            <p>1. תחילת עבודה</p>\r\n            <p>העסקתך תהיה אפקטיבית, החל מהיום {start_date}</p>\r\n            <p>2. הגדרת תפקיד</p>\r\n            <p>שם התפקיד שלך יהיה{designation}.</p>\r\n            <p>3. שכר</p>\r\n            <p>השכר וההטבות האחרות שלך יהיו כמפורט בנספח 1, כאן ל.</p>\r\n            <p>4. מקום הפרסום</p>\r\n            <p>אתה תפורסם ב {branch}. עם זאת, ייתכן שתידרש לעבוד בכל מקום עסק שיש לחברה, או</p>\r\n            <p>עשוי לרכוש מאוחר יותר.</p>\r\n            <p>5. שעות עבודה</p>\r\n            <p>ימי העבודה הרגילים הם שני עד שישי. תידרש לעבוד במשך שעות הדרושות לצורך</p>\r\n            <p>מילוי נאות של חובותיך כלפי החברה. שעות העבודה הרגילות הן מ {start_time} ל {end_time} ואתה</p>\r\n            <p>צפוי לעבוד לא פחות מ {total_hours} שעות בכל שבוע, ובמידת הצורך לשעות נוספות בהתאם לבחירתך</p>\r\n            <p>אחריות.</p>\r\n            <p>6. עזיבה/חגים</p>\r\n            <p>6.1 אתה זכאי לחופשה מזדמנת של 12 ימים.</p>\r\n            <p>6.2 אתה זכאי ל-12 ימי עבודה של חופשת מחלה בתשלום.</p>\r\n            <p>6.3 החברה תודיע על רשימת חגים מוכרזים בתחילת כל שנה.</p>\r\n            <p>7. אופי התפקידים</p>\r\n            <p>תבצע כמיטב יכולתך את כל התפקידים הגלומים בתפקידך וחובות נוספות כמו החברה</p>\r\n            <p>עשוי לקרוא לך להופיע, מעת לעת. החובות הספציפיות שלך מפורטות בלוח הזמנים II כאן כדי.</p>\r\n            <p>8. רכוש החברה</p>\r\n            <p>תמיד תשמור על רכוש החברה במצב טוב, אשר עשוי להיות מופקד בידיך לשימוש רשמי במהלך</p>\r\n            <p>העסקתך, ותחזיר את כל הרכוש כאמור לחברה לפני ויתור על החיוב שלך, אם לא העלות</p>\r\n            <p>ממנו יגבו ממך על ידי החברה.</p>\r\n            <p>9. השאלת/קבלת מתנות</p>\r\n            <p>לא תלווה או תקבל שום כסף, מתנה, תגמול או פיצוי עבור הרווחים האישיים שלך או תציב את עצמך בדרך אחרת.</p>\r\n            <p>תחת התחייבות כספית לכל אדם/לקוח שעמו אתה עשוי לנהל עסקאות רשמיות.</p>\r\n            <p>10. סיום</p>\r\n            <p>10.1 ניתן לסיים את מינויך על ידי החברה, ללא כל סיבה, על ידי מתן הודעה לא פחות מ[הודעה] חודשים לפני כן.</p>\r\n            <p>הודעה בכתב או משכורת במקומה. לעניין סעיף זה, שכר משמעו שכר יסוד.</p>\r\n            <p>10.2 אתה רשאי לסיים את העסקתך בחברה, ללא כל סיבה, על ידי מתן לא פחות מ[הודעת עובד]</p>\r\n            <p>חודשי הודעה מוקדמת או משכורת לתקופה שלא נחסכה, שנותרה לאחר התאמת חופשות ממתינות, לפי התאריך.</p>\r\n            <p>10.3 החברה שומרת לעצמה את הזכות לסיים את העסקתך באופן סופי ללא כל תקופת הודעה מוקדמת או תשלום פיטורין</p>\r\n            <p>אם יש לו יסוד סביר להאמין שאתה אשם בהתנהגות בלתי הולמת או ברשלנות, או שביצעת הפרה יסודית כלשהי של</p>\r\n            <p>חוזה, או גרם להפסד כלשהו לחברה.</p>\r\n            <p>10. 4 עם סיום העסקתך מכל סיבה שהיא, תחזיר לחברה את כל הרכוש; מסמכים, ו</p>\r\n            <p>נייר, הן מקור והעתקים שלו, לרבות כל דוגמאות, ספרות, חוזים, רשומות, רשימות, שרטוטים, שרטוטים,</p>\r\n            <p>מכתבים, הערות, נתונים וכדומה; ומידע סודי, הנמצא ברשותך או בשליטתך, המתייחס לרשותך</p>\r\n            <p>תעסוקה או עניינים עסקיים של לקוחות.</p>\r\n            <p>11. מידע מסווג</p>\r\n            <p>11. 1 במהלך עבודתך בחברה תקדיש את כל זמנך, תשומת הלב והמיומנות שלך כמיטב יכולתך למען</p>\r\n            <p>העסק שלה. אין, במישרין או בעקיפין, לעסוק או לקשר את עצמך, להיות קשור, מודאג, מועסק, או</p>\r\n            <p>זמן או להמשיך כל מסלול לימודים שהוא, ללא אישור מראש של החברה. העוסקת בכל עסק אחר או</p>\r\n            <p>פעילות או כל משרה אחרת או עבודה במשרה חלקית או להמשיך בכל מסלול לימודים שהוא, ללא אישור מראש של</p>\r\n            <p>חֶברָה.</p>\r\n            <p>11.2 עליך תמיד לשמור על רמת הסודיות הגבוהה ביותר ולשמור בסודיות את הרשומות, המסמכים ועוד.</p>\r\n            <p>מידע סודי המתייחס לעסקים של החברה אשר עשוי להיות ידוע לך או נסתר לך בכל אמצעי</p>\r\n            <p>ואתה תשתמש ברשומות, במסמכים ובמידע כאמור רק באופן מורשה כדין לטובת החברה. ל</p>\r\n            <p>המטרות של סעיף זה מידע סודי פירושו מידע על עסקי החברה ושל לקוחותיה</p>\r\n            <p>שאינו זמין לציבור הרחב ואשר עשוי להילמד על ידך במהלך העסקתך. זה כולל,</p>\r\n            <p>אך לא מוגבל למידע הנוגע לארגון, רשימות הלקוחות שלו, מדיניות העסקה, כוח אדם ומידע</p>\r\n            <p>על מוצרי החברה, תהליכים כולל רעיונות, קונספטים, תחזיות, טכנולוגיה, מדריכים, ציור, עיצובים,</p>\r\n            <p>מפרטים, וכל הניירות, קורות החיים, הרשומות ומסמכים אחרים המכילים מידע סודי כאמור.</p>\r\n            <p>11.3 בשום זמן לא תסיר כל מידע סודי מהמשרד ללא רשות.</p>\r\n            <p>11.4 חובתך לשמור ולא לחשוף</p>\r\n            <p>מידע סודי ישרוד את תפוגה או סיומו של הסכם זה ו/או העסקתך בחברה.</p>\r\n            <p>11.5 הפרת תנאי סעיף זה תגרום לך לדין לפיטורים על הסף על פי הסעיף לעיל בנוסף לכל</p>\r\n            <p>סעד אחר שייתכן שיש לחברה נגדך בחוק.</p>\r\n            <p>12. הודעות</p>\r\n            <p>הודעות עשויות להימסר על ידך לחברה בכתובת משרדה הרשום. ייתכן שהחברה תמסור לך הודעות בכתובת</p>\r\n            <p>הכתובת שצוינה על ידך ברישומים הרשמיים.</p>\r\n            <p>13. תחולת מדיניות החברה</p>\r\n            <p>החברה תהיה רשאית להצהיר מעת לעת הצהרות מדיניות הנוגעות לעניינים כמו זכאות לחופשה, לידה</p>\r\n            <p>חופשה, הטבות לעובדים, שעות עבודה, פוליסות העברה וכו, ועשויות לשנות אותן מעת לעת לפי שיקול דעתה הבלעדי.</p>\r\n            <p>כל החלטות מדיניות כאלה של החברה יחייבו אותך ויעקפו את הסכם זה במידה זו.</p>\r\n            <p>14. חוק / סמכות שיפוט</p>\r\n            <p>העסקתך בחברה כפופה לחוקי המדינה. כל המחלוקות יהיו כפופות לסמכותו של בית המשפט העליון</p>\r\n            <p>גוג אראט בלבד.</p>\r\n            <p>15. קבלת ההצעה שלנו</p>\r\n            <p>אנא אשר את הסכמתך לחוזה העסקה זה על ידי חתימה והחזרת העותק הכפול.</p>\r\n            <p>אנו מברכים אותך ומצפים לקבל את קבלתך ולעבוד איתך.</p>\r\n            <p>בכבוד רב,</p>\r\n            <p>{app_name}</p>\r\n            <p>{date}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(17,'pt-br','<h3 style=\"text-align: center;\">Carta De Ades&atilde;o</h3>\r\n            \r\n            <p>{data}</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{address}</p>\r\n            \r\n            <p>Assunto: Nomea&ccedil;&atilde;o para o cargo de {designation}</p>\r\n            \r\n            <p>Querido {employee_name},</p>\r\n            \r\n            <p>Temos o prazer de oferec&ecirc;-lo, a posi&ccedil;&atilde;o de {designation} com {app_name} a Empresa nos seguintes termos e</p>\r\n            <p>condi&ccedil;&otilde;es:</p>\r\n            \r\n            <p>1. Comentamento do emprego</p>\r\n            \r\n            <p>Seu emprego ser&aacute; efetivo, a partir de {start_date}</p>\r\n            \r\n            <p>2. T&iacute;tulo do emprego</p>\r\n            \r\n            <p>Seu cargo de trabalho ser&aacute; {designation}.</p>\r\n            \r\n            <p>3. Sal&aacute;rio</p>\r\n            \r\n            <p>Seu sal&aacute;rio e outros benef&iacute;cios ser&atilde;o conforme estabelecido no Planejamento 1, hereto.</p>\r\n            \r\n            <p>4. Local de postagem</p>\r\n            \r\n            <p>Voc&ecirc; ser&aacute; postado em {branch}. Voc&ecirc; pode, no entanto, ser obrigado a trabalhar em qualquer local de neg&oacute;cios que a Empresa tenha, ou possa posteriormente adquirir.</p>\r\n            \r\n            <p>5. Horas de Trabalho</p>\r\n            \r\n            <p>Os dias normais de trabalho s&atilde;o de segunda a sexta-feira. Voc&ecirc; ser&aacute; obrigado a trabalhar por tais horas, conforme necess&aacute;rio para a quita&ccedil;&atilde;o adequada de suas fun&ccedil;&otilde;es para a Companhia. As horas de trabalho normais s&atilde;o de {start_time} para {end_time} e voc&ecirc; deve trabalhar n&atilde;o menos de {total_horas} horas semanais, e se necess&aacute;rio para horas adicionais dependendo do seu</p>\r\n            <p>responsabilidades.</p>\r\n            \r\n            <p>6. Leave / Holidays</p>\r\n            \r\n            <p>6,1 Voc&ecirc; tem direito a licen&ccedil;a casual de 12 dias.</p>\r\n            \r\n            <p>6,2 Voc&ecirc; tem direito a 12 dias &uacute;teis de licen&ccedil;a remunerada remunerada.</p>\r\n            \r\n            <p>6,3 Companhia notificar&aacute; uma lista de feriados declarados no in&iacute;cio de cada ano.&nbsp;</p>\r\n            \r\n            <p>7. Natureza dos deveres</p>\r\n            \r\n            <p>Voc&ecirc; ir&aacute; executar ao melhor da sua habilidade todos os deveres como s&atilde;o inerentes ao seu cargo e tais deveres adicionais como a empresa pode ligar sobre voc&ecirc; para executar, de tempos em tempos. Os seus deveres espec&iacute;ficos s&atilde;o estabelecidos no Hereto do Planejamento II.</p>\r\n            \r\n            <p>8. Propriedade da empresa</p>\r\n            \r\n            <p>Voc&ecirc; sempre manter&aacute; em bom estado propriedade Empresa, que poder&aacute; ser confiada a voc&ecirc; para uso oficial durante o curso de</p>\r\n            \r\n            <p>o seu emprego, e devolver&aacute; toda essa propriedade &agrave; Companhia antes de abdicar de sua acusa&ccedil;&atilde;o, falhando qual o custo do mesmo ser&aacute; recuperado de voc&ecirc; pela Companhia.</p>\r\n            \r\n            <p>9. Borremir / aceitar presentes</p>\r\n            \r\n            <p>Voc&ecirc; n&atilde;o vai pedir empr&eacute;stimo ou aceitar qualquer dinheiro, presente, recompensa ou indeniza&ccedil;&atilde;o por seus ganhos pessoais de ou de outra forma colocar-se sob obriga&ccedil;&atilde;o pecuni&aacute;ria a qualquer pessoa / cliente com quem voc&ecirc; pode estar tendo rela&ccedil;&otilde;es oficiais.</p>\r\n            \r\n            <p>10. Termina&ccedil;&atilde;o</p>\r\n            \r\n            <p>10,1 Sua nomea&ccedil;&atilde;o pode ser rescindida pela Companhia, sem qualquer raz&atilde;o, dando-lhe n&atilde;o menos do que [aviso] meses de aviso pr&eacute;vio por escrito ou de sal&aacute;rio em lieu deste. Para efeito da presente cl&aacute;usula, o sal&aacute;rio deve significar sal&aacute;rio base.</p>\r\n            \r\n            <p>10,2 Voc&ecirc; pode rescindir seu emprego com a Companhia, sem qualquer causa, ao dar nada menos que [Aviso de contrata&ccedil;&atilde;o] meses de aviso pr&eacute;vio ou sal&aacute;rio para o per&iacute;odo n&atilde;o salvo, deixado ap&oacute;s ajuste de folhas pendentes, conforme data de encontro.</p>\r\n            \r\n            <p>10,3 Empresa reserva-se o direito de rescindir o seu emprego sumariamente sem qualquer prazo de aviso ou de rescis&atilde;o se tiver terreno razo&aacute;vel para acreditar que voc&ecirc; &eacute; culpado de m&aacute; conduta ou neglig&ecirc;ncia, ou tenha cometido qualquer viola&ccedil;&atilde;o fundamental de contrato, ou tenha causado qualquer perda para a Empresa.&nbsp;</p>\r\n            \r\n            <p>10. 4 Sobre a rescis&atilde;o do seu emprego por qualquer motivo, voc&ecirc; retornar&aacute; para a Empresa todos os bens; documentos e&nbsp;</p>\r\n            \r\n            <p>papel, tanto originais como c&oacute;pias dos mesmos, incluindo quaisquer amostras, literatura, contratos, registros, listas, desenhos, plantas,</p>\r\n            \r\n            <p>cartas, notas, dados e semelhantes; e Informa&ccedil;&otilde;es Confidenciais, em sua posse ou sob seu controle relacionado ao seu emprego ou aos neg&oacute;cios de neg&oacute;cios dos clientes.&nbsp; &nbsp;</p>\r\n            \r\n            <p>11. Informa&ccedil;&otilde;es Confidenciais</p>\r\n            \r\n            <p>11. 1 Durante o seu emprego com a Companhia voc&ecirc; ir&aacute; dedicar todo o seu tempo, aten&ccedil;&atilde;o e habilidade para o melhor de sua capacidade de</p>\r\n            \r\n            <p>o seu neg&oacute;cio. Voc&ecirc; n&atilde;o deve, direta ou indiretamente, se envolver ou associar-se com, estar conectado com, preocupado, empregado, ou tempo ou prosseguir qualquer curso de estudo, sem a permiss&atilde;o pr&eacute;via do Company.engajado em qualquer outro neg&oacute;cio ou atividades ou qualquer outro cargo ou trabalho parcial ou prosseguir qualquer curso de estudo, sem a permiss&atilde;o pr&eacute;via do</p>\r\n            \r\n            <p>Empresa.</p>\r\n            \r\n            <p>11,2 &Eacute; preciso manter sempre o mais alto grau de confidencialidade e manter como confidenciais os registros, documentos e outros&nbsp;</p>\r\n            \r\n            <p>Informa&ccedil;&otilde;es confidenciais relativas ao neg&oacute;cio da Companhia que possam ser conhecidas por voc&ecirc; ou confiadas em voc&ecirc; por qualquer meio e utilizar&atilde;o tais registros, documentos e informa&ccedil;&otilde;es apenas de forma devidamente autorizada no interesse da Companhia. Para efeitos da presente cl&aacute;usula \"Informa&ccedil;&otilde;es confidenciais\" significa informa&ccedil;&atilde;o sobre os neg&oacute;cios da Companhia e a dos seus clientes que n&atilde;o est&aacute; dispon&iacute;vel para o p&uacute;blico em geral e que poder&aacute; ser aprendida por voc&ecirc; no curso do seu emprego. Isso inclui,</p>\r\n            \r\n            <p>mas n&atilde;o se limita a, informa&ccedil;&otilde;es relativas &agrave; organiza&ccedil;&atilde;o, suas listas de clientes, pol&iacute;ticas de emprego, pessoal, e informa&ccedil;&otilde;es sobre os produtos da Companhia, processos incluindo ideias, conceitos, proje&ccedil;&otilde;es, tecnologia, manuais, desenho, desenhos,&nbsp;</p>\r\n            \r\n            <p>especifica&ccedil;&otilde;es, e todos os pap&eacute;is, curr&iacute;culos, registros e outros documentos que contenham tais Informa&ccedil;&otilde;es Confidenciais.</p>\r\n            \r\n            <p>11,3 Em nenhum momento, voc&ecirc; remover&aacute; quaisquer Informa&ccedil;&otilde;es Confidenciais do escrit&oacute;rio sem permiss&atilde;o.</p>\r\n            \r\n            <p>11,4 O seu dever de salvaguardar e n&atilde;o os desclos</p>\r\n            \r\n            <p>Informa&ccedil;&otilde;es Confidenciais sobreviver&atilde;o &agrave; expira&ccedil;&atilde;o ou &agrave; rescis&atilde;o deste Contrato e / ou do seu emprego com a Companhia.</p>\r\n            \r\n            <p>11,5 Viola&ccedil;&atilde;o das condi&ccedil;&otilde;es desta cl&aacute;usula ir&aacute; torn&aacute;-lo sujeito a demiss&atilde;o sum&aacute;ria sob a cl&aacute;usula acima, al&eacute;m de qualquer outro rem&eacute;dio que a Companhia possa ter contra voc&ecirc; em lei.</p>\r\n            \r\n            <p>12. Notices</p>\r\n            \r\n            <p>Os avisos podem ser conferidos por voc&ecirc; &agrave; Empresa em seu endere&ccedil;o de escrit&oacute;rio registrado. Os avisos podem ser conferidos pela Companhia a voc&ecirc; no endere&ccedil;o intimado por voc&ecirc; nos registros oficiais.</p>\r\n            \r\n            <p>13. Aplicabilidade da Pol&iacute;tica da Empresa</p>\r\n            \r\n            <p>A Companhia tem direito a fazer declara&ccedil;&otilde;es de pol&iacute;tica de tempos em tempos relativos a mat&eacute;rias como licen&ccedil;a de licen&ccedil;a, maternidade</p>\r\n            \r\n            <p>sair, benef&iacute;cios dos empregados, horas de trabalho, pol&iacute;ticas de transfer&ecirc;ncia, etc., e pode alterar o mesmo de vez em quando a seu exclusivo crit&eacute;rio.</p>\r\n            \r\n            <p>Todas essas decis&otilde;es de pol&iacute;tica da Companhia devem ser vinculativas para si e substituir&atilde;o este Acordo nessa medida.</p>\r\n                \r\n            <p>14. Direito / Jurisdi&ccedil;&atilde;o</p>\r\n            \r\n            <p>Seu emprego com a Companhia est&aacute; sujeito &agrave;s leis do Pa&iacute;s. Todas as disputas est&atilde;o sujeitas &agrave; jurisdi&ccedil;&atilde;o do Tribunal Superior</p>\r\n            \r\n            <p>Gujarat apenas.</p>\r\n            \r\n            <p>15. Aceita&ccedil;&atilde;o da nossa oferta</p>\r\n            \r\n            <p>Por favor, confirme sua aceita&ccedil;&atilde;o deste Contrato de Emprego assinando e retornando a c&oacute;pia duplicada.</p>\r\n            \r\n            <p>N&oacute;s acolhemos voc&ecirc; e estamos ansiosos para receber sua aceita&ccedil;&atilde;o e para trabalhar com voc&ecirc;.</p>\r\n        \r\n            <p>Seu Sinceramente,</p>\r\n            \r\n            <p>{app_name}</p>\r\n            \r\n            <p>{data}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47');
/*!40000 ALTER TABLE `joining_letters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `landing_page_sections`
--

DROP TABLE IF EXISTS `landing_page_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `landing_page_sections` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `section_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `section_order` int NOT NULL DEFAULT '0',
  `content` text COLLATE utf8mb4_unicode_ci,
  `section_type` enum('section-1','section-2','section-3','section-4','section-5','section-6','section-7','section-8','section-9','section-10','section-plan') COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `section_demo_image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `section_blade_file_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `landing_page_sections`
--

LOCK TABLES `landing_page_sections` WRITE;
/*!40000 ALTER TABLE `landing_page_sections` DISABLE KEYS */;
/*!40000 ALTER TABLE `landing_page_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `landing_page_settings`
--

DROP TABLE IF EXISTS `landing_page_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `landing_page_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `landing_page_settings_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `landing_page_settings`
--

LOCK TABLES `landing_page_settings` WRITE;
/*!40000 ALTER TABLE `landing_page_settings` DISABLE KEYS */;
INSERT INTO `landing_page_settings` VALUES (1,'topbar_status','on','2025-07-04 00:41:57','2025-07-04 00:41:57'),(2,'topbar_notification_msg','70% Special Offer. Don’t Miss it. The offer ends in 72 hours.','2025-07-04 00:41:57','2025-07-04 00:41:57'),(3,'menubar_status','on','2025-07-04 00:41:57','2025-07-04 00:41:57'),(4,'menubar_page','[{\"menubar_page_name\": \"About Us\",\"template_name\": \"page_content\",\"page_url\": \"\",\"menubar_page_contant\": \"Welcome to the HRMGo-SaaS website. By accessing this website, you agree to comply with and be bound by the following terms and conditions of use. If you disagree with any part of these terms, please do not use our website. The content of the pages of this website is for your general information and use only. It is subject to change without notice. This website uses cookies to monitor browsing preferences. If you do allow cookies to be used, personal information may be stored by us for use by third parties. Neither we nor any third parties provide any warranty or guarantee as to the accuracy, timeliness, performance, completeness, or suitability of the information and materials found or offered on this website for any particular purpose. You acknowledge that such information and materials may contain inaccuracies or errors, and we expressly exclude liability for any such inaccuracies or errors to the fullest extent permitted by law. Your use of any information or materials on this website is entirely at your own risk, for which we shall not be liable. It shall be your own responsibility to ensure that any products, services, or information available through this website meet your specific requirements. This website contains material that is owned by or licensed to us. This material includes, but is not limited to, the design, layout, look, appearance, and graphics. Reproduction is prohibited other than in accordance with the copyright notice, which forms part of these terms and conditions. Unauthorized use of this website may give rise to a claim for damages and\\/or be a criminal offense. From time to time, this website may also include links to other websites. These links are provided for your convenience to provide further information. They do not signify that we endorse the website(s). We have no responsibility for the content of the linked website(s\",\"page_slug\": \"about_us\",\"header\": \"on\",\"footer\": \"on\",\"login\": \"on\"},{\"menubar_page_name\": \"Terms and Conditions\",\"template_name\": \"page_content\",\"page_url\": \"\",\"menubar_page_contant\": \"Welcome to the HRMGo-SaaS website. By accessing this website, you agree to comply with and be bound by the following terms and conditions of use. If you disagree with any part of these terms, please do not use our website.\\r\\n\\r\\nThe content of the pages of this website is for your general information and use only. It is subject to change without notice.\\r\\n\\r\\nThis website uses cookies to monitor browsing preferences. If you do allow cookies to be used, personal information may be stored by us for use by third parties.\\r\\n\\r\\nNeither we nor any third parties provide any warranty or guarantee as to the accuracy, timeliness, performance, completeness, or suitability of the information and materials found or offered on this website for any particular purpose. You acknowledge that such information and materials may contain inaccuracies or errors, and we expressly exclude liability for any such inaccuracies or errors to the fullest extent permitted by law.\\r\\n\\r\\nYour use of any information or materials on this website is entirely at your own risk, for which we shall not be liable. It shall be your own responsibility to ensure that any products, services, or information available through this website meet your specific requirements.\\r\\n\\r\\nThis website contains material that is owned by or licensed to us. This material includes, but is not limited to, the design, layout, look, appearance, and graphics. Reproduction is prohibited other than in accordance with the copyright notice, which forms part of these terms and conditions.\\r\\n\\r\\nUnauthorized use of this website may give rise to a claim for damages and\\/or be a criminal offense.\\r\\n\\r\\nFrom time to time, this website may also include links to other websites. These links are provided for your convenience to provide further information. They do not signify that we endorse the website(s). We have no responsibility for the content of the linked website(s).\",\"page_slug\": \"terms_and_conditions\",\"header\": \"off\",\"footer\": \"on\",\"login\": \"on\"},{\"menubar_page_name\": \"Privacy Policy\",\"template_name\": \"page_content\",\"page_url\": \"\",\"menubar_page_contant\": \"Introduction: An overview of the privacy policy, including the purpose and scope of the policy. Information Collection: Details about the types of information collected from users\\/customers, such as personal information (name, address, email), device information, usage data, and any other relevant data. Data Usage: An explanation of how the collected data will be used, including providing services, improving products, personalization, analytics, and any other legitimate business purposes. Data Sharing: Information about whether and how the company shares user data with third parties, such as partners, service providers, or affiliates, along with the purposes of such sharing. Data Security: Details about the measures taken to protect user data from unauthorized access, loss, or misuse, including encryption, secure protocols, access controls, and data breach notification procedures. User Choices: Information on the choices available to users regarding the collection, use, and sharing of their personal data, including opt-out mechanisms and account settings. Cookies and Tracking Technologies: Explanation of the use of cookies, web beacons, and similar technologies for tracking user activity and collecting information for analytics and advertising purposes. Third-Party Links: Clarification that the companys website or services may contain links to third-party websites or services and that the privacy policy does not extend to those external sites. Data Retention: Details about the retention period for user data and how long it will be stored by the company. Legal Basis and Compliance: Information about the legal basis for processing personal data, compliance with applicable data protection laws, and the rights of users under relevant privacy regulations (e.g., GDPR, CCPA). Updates to the Privacy Policy: Notification that the privacy policy may be updated from time to time, and how users will be informed of any material changes. Contact Information: How users can contact the company regarding privacy-related concerns or inquiries.\",\"page_slug\": \"privacy_policy\",\"header\": \"off\",\"footer\": \"on\",\"login\": \"on\"}]','2025-07-04 00:41:57','2025-07-04 00:41:57'),(5,'site_logo','site_logo.png','2025-07-04 00:41:57','2025-07-04 00:41:57'),(6,'site_description','We build modern web tools to help you jump-start your daily business work.','2025-07-04 00:41:57','2025-07-04 00:41:57'),(7,'home_status','on','2025-07-04 00:41:57','2025-07-04 00:41:57'),(8,'home_offer_text','70% Special Offer','2025-07-04 00:41:57','2025-07-04 00:41:57'),(9,'home_title','Home','2025-07-04 00:41:57','2025-07-04 00:41:57'),(10,'home_heading','HRMGo SaaS - HRM and Payroll Tool','2025-07-04 00:41:57','2025-07-04 00:41:57'),(11,'home_description','Use these awesome forms to login or create new account in your project for free.','2025-07-04 00:41:57','2025-07-04 00:41:57'),(12,'home_trusted_by','1000+ Customer','2025-07-04 00:41:57','2025-07-04 00:41:57'),(13,'home_live_demo_link','https://demo.workdo.io/hrmgo-saas/login','2025-07-04 00:41:57','2025-07-04 00:41:57'),(14,'home_buy_now_link','https://codecanyon.net/item/hrmgo-saas-hrm-and-payroll-tool/25982934','2025-07-04 00:41:57','2025-07-04 00:41:57'),(15,'home_banner','home_banner.png','2025-07-04 00:41:57','2025-07-04 00:41:57'),(16,'home_logo','home_logo.png,home_logo.png,home_logo.png,home_logo.png,home_logo.png,home_logo.png,home_logo.png','2025-07-04 00:41:57','2025-07-04 00:41:57'),(17,'feature_status','on','2025-07-04 00:41:57','2025-07-04 00:41:57'),(18,'feature_title','Features','2025-07-04 00:41:57','2025-07-04 00:41:57'),(19,'feature_heading','All In One Place HRM System','2025-07-04 00:41:57','2025-07-04 00:41:57'),(20,'feature_description','Use these awesome forms to login or create new account in your project for free. Use these awesome forms to login or create new account in your project for free.','2025-07-04 00:41:57','2025-07-04 00:41:57'),(21,'feature_buy_now_link','https://codecanyon.net/item/hrmgo-saas-hrm-and-payroll-tool/25982934','2025-07-04 00:41:57','2025-07-04 00:41:57'),(22,'feature_of_features','[{\"feature_logo\":\"1686575690-feature_logo.png\",\"feature_heading\":\"Feature\",\"feature_description\":\"<p>Use these awesome forms to login or create new account in your project for free.Use these awesome forms to login or create new account in your project for free.<\\/p>\"},{\"feature_logo\":\"1686545757-feature_logo.png\",\"feature_heading\":\"Support\",\"feature_description\":\"Use these awesome forms to login or create new account in your project for free.Use these awesome forms to login or create new account in your project for free.\"},{\"feature_logo\":\"1686546152-feature_logo.png\",\"feature_heading\":\"Integration\",\"feature_description\":\"Use these awesome forms to login or create new account in your project for free.Use these awesome forms to login or create new account in your project for free.\"}]','2025-07-04 00:41:57','2025-07-04 00:41:57'),(23,'highlight_feature_heading','HRMGo SaaS - HRM and Payroll Tool','2025-07-04 00:41:57','2025-07-04 00:41:57'),(24,'highlight_feature_description','Use these awesome forms to login or create new account in your project for free.','2025-07-04 00:41:57','2025-07-04 00:41:57'),(25,'highlight_feature_image','highlight_feature_image.png','2025-07-04 00:41:57','2025-07-04 00:41:57'),(26,'other_features','[{\"other_features_image\":\"1688372964-other_features_image.png\",\"other_features_heading\":\"HRMGo SaaS - HRM and Payroll Tool\",\"other_featured_description\":\"<p>Use these awesome forms to login or create new account in your project for free.<\\/p>\",\"other_feature_buy_now_link\":\"https:\\/\\/codecanyon.net\\/item\\/hrmgo-saas-hrm-and-payroll-tool\\/25982934\"},{\"other_features_image\":\"1688373001-other_features_image.png\",\"other_features_heading\":\"HRMGo SaaS - HRM and Payroll Tool\",\"other_featured_description\":\"<p>Use these awesome forms to login or create new account in your project for free.<\\/p>\",\"other_feature_buy_now_link\":\"https:\\/\\/codecanyon.net\\/item\\/hrmgo-saas-hrm-and-payroll-tool\\/25982934\"},{\"other_features_image\":\"1688373017-other_features_image.png\",\"other_features_heading\":\"HRMGo SaaS - HRM and Payroll Tool\",\"other_featured_description\":\"<p>Use these awesome forms to login or create new account in your project for free.<\\/p>\",\"other_feature_buy_now_link\":\"https:\\/\\/codecanyon.net\\/item\\/hrmgo-saas-hrm-and-payroll-tool\\/25982934\"},{\"other_features_image\":\"1688373037-other_features_image.png\",\"other_features_heading\":\"HRMGo SaaS - HRM and Payroll Tool\",\"other_featured_description\":\"<p>Use these awesome forms to login or create new account in your project for free.<\\/p>\",\"other_feature_buy_now_link\":\"https:\\/\\/codecanyon.net\\/item\\/hrmgo-saas-hrm-and-payroll-tool\\/25982934\"}]','2025-07-04 00:41:57','2025-07-04 00:41:57'),(27,'discover_status','on','2025-07-04 00:41:57','2025-07-04 00:41:57'),(28,'discover_heading','HRMGo SaaS - HRM and Payroll Tool','2025-07-04 00:41:57','2025-07-04 00:41:57'),(29,'discover_description','Use these awesome forms to login or create new account in your project for free.','2025-07-04 00:41:57','2025-07-04 00:41:57'),(30,'discover_live_demo_link','https://demo.workdo.io/hrmgo-saas/login','2025-07-04 00:41:57','2025-07-04 00:41:57'),(31,'discover_buy_now_link','https://codecanyon.net/item/hrmgo-saas-hrm-and-payroll-tool/25982934','2025-07-04 00:41:57','2025-07-04 00:41:57'),(32,'discover_of_features','[{\"discover_logo\":\"1686575797-discover_logo.png\",\"discover_heading\":\"Feature\",\"discover_description\":\"<p>Use these awesome forms to login or create new account in your project for free.Use these awesome forms to login or create new account in your project for free.<\\/p>\"},{\"discover_logo\":\"1686547242-discover_logo.png\",\"discover_heading\":\"Feature\",\"discover_description\":\"Use these awesome forms to login or create new account in your project for free.Use these awesome forms to login or create new account in your project for free.\"},{\"discover_logo\":\"1686547625-discover_logo.png\",\"discover_heading\":\"Feature\",\"discover_description\":\"Use these awesome forms to login or create new account in your project for free.Use these awesome forms to login or create new account in your project for free.\"},{\"discover_logo\":\"1686547638-discover_logo.png\",\"discover_heading\":\"Feature\",\"discover_description\":\"Use these awesome forms to login or create new account in your project for free.Use these awesome forms to login or create new account in your project for free.\"},{\"discover_logo\":\"1686547653-discover_logo.png\",\"discover_heading\":\"Feature\",\"discover_description\":\"Use these awesome forms to login or create new account in your project for free.Use these awesome forms to login or create new account in your project for free.\"},{\"discover_logo\":\"1686547662-discover_logo.png\",\"discover_heading\":\"Feature\",\"discover_description\":\"Use these awesome forms to login or create new account in your project for free.Use these awesome forms to login or create new account in your project for free.\"},{\"discover_logo\":\"1686547709-discover_logo.png\",\"discover_heading\":\"Feature\",\"discover_description\":\"Use these awesome forms to login or create new account in your project for free.Use these awesome forms to login or create new account in your project for free.\"},{\"discover_logo\":\"1686547717-discover_logo.png\",\"discover_heading\":\"Feature\",\"discover_description\":\"Use these awesome forms to login or create new account in your project for free.Use these awesome forms to login or create new account in your project for free.\"}]','2025-07-04 00:41:57','2025-07-04 00:41:57'),(33,'screenshots_status','on','2025-07-04 00:41:57','2025-07-04 00:41:57'),(34,'screenshots_heading','HRMGo SaaS - HRM and Payroll Tool','2025-07-04 00:41:57','2025-07-04 00:41:57'),(35,'screenshots_description','Use these awesome forms to login or create new account in your project for free.','2025-07-04 00:41:57','2025-07-04 00:41:57'),(36,'screenshots','[{\"screenshots\":\"1688373118-screenshots.png\",\"screenshots_heading\":\"HRM Dashboard\"},{\"screenshots\":\"1688373124-screenshots.png\",\"screenshots_heading\":\"User Roles\"},{\"screenshots\":\"1688373132-screenshots.png\",\"screenshots_heading\":\"Profile Overview\"},{\"screenshots\":\"1688373183-screenshots.png\",\"screenshots_heading\":\"HRM Users\"},{\"screenshots\":\"1688452985-screenshots.png\",\"screenshots_heading\":\"Contract Page\"},{\"screenshots\":\"1688450657-screenshots.png\",\"screenshots_heading\":\"Job Career\"}]','2025-07-04 00:41:57','2025-07-04 00:41:57'),(37,'plan_status','on','2025-07-04 00:41:57','2025-07-04 00:41:57'),(38,'plan_title','Plan','2025-07-04 00:41:57','2025-07-04 00:41:57'),(39,'plan_heading','HRMGo SaaS - HRM and Payroll Tool','2025-07-04 00:41:57','2025-07-04 00:41:57'),(40,'plan_description','Use these awesome forms to login or create new account in your project for free.','2025-07-04 00:41:57','2025-07-04 00:41:57'),(41,'faq_status','on','2025-07-04 00:41:57','2025-07-04 00:41:57'),(42,'faq_title','Faq','2025-07-04 00:41:57','2025-07-04 00:41:57'),(43,'faq_heading','HRMGo SaaS - HRM and Payroll Tool','2025-07-04 00:41:57','2025-07-04 00:41:57'),(44,'faq_description','Use these awesome forms to login or create new account in your project for free.','2025-07-04 00:41:57','2025-07-04 00:41:57'),(45,'faqs','[{\"faq_questions\":\"#What does \\\"Theme\\/Package Installation\\\" mean?\",\"faq_answer\":\"For an easy-to-install theme\\/package, we have included step-by-step detailed documentation (in English). However, if it is not done perfectly, please feel free to contact the support team at support@workdo.io\"},{\"faq_questions\":\"#What does \\\"Theme\\/Package Installation\\\" mean?\",\"faq_answer\":\"For an easy-to-install theme\\/package, we have included step-by-step detailed documentation (in English). However, if it is not done perfectly, please feel free to contact the support team at support@workdo.io\"},{\"faq_questions\":\"#What does \\\"Lifetime updates\\\" mean?\",\"faq_answer\":\"For an easy-to-install theme\\/package, we have included step-by-step detailed documentation (in English). However, if it is not done perfectly, please feel free to contact the support team at support@workdo.io\"},{\"faq_questions\":\"#What does \\\"Lifetime updates\\\" mean?\",\"faq_answer\":\"For an easy-to-install theme\\/package, we have included step-by-step detailed documentation (in English). However, if it is not done perfectly, please feel free to contact the support team at support@workdo.io\"},{\"faq_questions\":\"# What does \\\"6 months of support\\\" mean?\",\"faq_answer\":\"Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa\\r\\n                                    nesciunt\\r\\n                                    laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt\\r\\n                                    sapiente ea\\r\\n                                    proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven heard of them accusamus labore sustainable VHS.\"},{\"faq_questions\":\"# What does \\\"6 months of support\\\" mean?\",\"faq_answer\":\"Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa\\r\\n                                    nesciunt\\r\\n                                    laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt\\r\\n                                    sapiente ea\\r\\n                                    proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven heard of them accusamus labore sustainable VHS.\"}]','2025-07-04 00:41:57','2025-07-04 00:41:57'),(46,'testimonials_status','on','2025-07-04 00:41:57','2025-07-04 00:41:57'),(47,'testimonials_heading','From our Clients','2025-07-04 00:41:57','2025-07-04 00:41:57'),(48,'testimonials_description','Use these awesome forms to login or create new account in your project for free.','2025-07-04 00:41:57','2025-07-04 00:41:57'),(49,'testimonials_long_description','WorkDo seCommerce package offers you a “sales-ready.”secure online store. The package puts all the key pieces together, from design to payment processing. This gives you a headstart in your eCommerce venture. Every store is built using a reliable PHP framework -laravel. Thisspeeds up the development process while increasing the store’s security and performance.Additionally, thanks to the accompanying mobile app, you and your team can manage the store on the go. What’s more, because the app works both for you and your customers, you can use it to reach a wider audience.And, unlike popular eCommerce platforms, it doesn’t bind you to any terms and conditions or recurring fees. You get to choose where you host it or which payment gateway you use. Lastly, you getcomplete control over the looks of the store. And if it lacks any functionalities that you need, just reach out, and let’s discuss customization possibilities','2025-07-04 00:41:57','2025-07-04 00:41:57'),(50,'testimonials','[{\"testimonials_user_avtar\":\"1686634418-testimonials_user_avtar.jpg\",\"testimonials_title\":\"Tbistone\",\"testimonials_description\":\"Very quick customer support, installing this application on my machine locally, within 5 minutes of creating a ticket, the developer was able to fix the issue I had within 10 minutes. EXCELLENT! Thank you very much\",\"testimonials_user\":\"Chordsnstrings\",\"testimonials_designation\":\"from codecanyon\",\"testimonials_star\":\"5\"},{\"testimonials_user_avtar\":\"1686634425-testimonials_user_avtar.jpg\",\"testimonials_title\":\"Tbistone\",\"testimonials_description\":\"Very quick customer support, installing this application on my machine locally, within 5 minutes of creating a ticket, the developer was able to fix the issue I had within 10 minutes. EXCELLENT! Thank you very much\",\"testimonials_user\":\"Chordsnstrings\",\"testimonials_designation\":\"from codecanyon\",\"testimonials_star\":\"5\"},{\"testimonials_user_avtar\":\"1686634432-testimonials_user_avtar.jpg\",\"testimonials_title\":\"Tbistone\",\"testimonials_description\":\"Very quick customer support, installing this application on my machine locally, within 5 minutes of creating a ticket, the developer was able to fix the issue I had within 10 minutes. EXCELLENT! Thank you very much\",\"testimonials_user\":\"Chordsnstrings\",\"testimonials_designation\":\"from codecanyon\",\"testimonials_star\":\"5\"}]','2025-07-04 00:41:57','2025-07-04 00:41:57'),(51,'footer_status','on','2025-07-04 00:41:57','2025-07-04 00:41:57'),(52,'joinus_status','on','2025-07-04 00:41:57','2025-07-04 00:41:57'),(53,'joinus_heading','Join Our Community','2025-07-04 00:41:57','2025-07-04 00:41:57'),(54,'joinus_description','We build modern web tools to help you jump-start your daily business work.','2025-07-04 00:41:57','2025-07-04 00:41:57');
/*!40000 ALTER TABLE `landing_page_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fullName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'ar','Arabic','2025-07-04 00:41:57','2025-07-04 00:41:57'),(2,'zh','Chinese','2025-07-04 00:41:57','2025-07-04 00:41:57'),(3,'da','Danish','2025-07-04 00:41:57','2025-07-04 00:41:57'),(4,'de','German','2025-07-04 00:41:57','2025-07-04 00:41:57'),(5,'en','English','2025-07-04 00:41:57','2025-07-04 00:41:57'),(6,'es','Spanish','2025-07-04 00:41:57','2025-07-04 00:41:57'),(7,'fr','French','2025-07-04 00:41:57','2025-07-04 00:41:57'),(8,'he','Hebrew','2025-07-04 00:41:57','2025-07-04 00:41:57'),(9,'it','Italian','2025-07-04 00:41:57','2025-07-04 00:41:57'),(10,'ja','Japanese','2025-07-04 00:41:57','2025-07-04 00:41:57'),(11,'nl','Dutch','2025-07-04 00:41:57','2025-07-04 00:41:57'),(12,'pl','Polish','2025-07-04 00:41:57','2025-07-04 00:41:57'),(13,'pt','Portuguese','2025-07-04 00:41:57','2025-07-04 00:41:57'),(14,'ru','Russian','2025-07-04 00:41:57','2025-07-04 00:41:57'),(15,'tr','Turkish','2025-07-04 00:41:57','2025-07-04 00:41:57'),(16,'pt-br','Portuguese(Brazil)','2025-07-04 00:41:57','2025-07-04 00:41:57');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_types`
--

DROP TABLE IF EXISTS `leave_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `days` int NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_types`
--

LOCK TABLES `leave_types` WRITE;
/*!40000 ALTER TABLE `leave_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `leave_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaves`
--

DROP TABLE IF EXISTS `leaves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leaves` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `leave_type_id` int NOT NULL,
  `applied_on` date NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `total_leave_days` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `leave_reason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leaves`
--

LOCK TABLES `leaves` WRITE;
/*!40000 ALTER TABLE `leaves` DISABLE KEYS */;
/*!40000 ALTER TABLE `leaves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_deductions`
--

DROP TABLE IF EXISTS `loan_deductions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan_deductions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `loan_id` bigint unsigned NOT NULL,
  `month` date NOT NULL,
  `emi_amount` decimal(10,2) NOT NULL,
  `is_deducted` tinyint(1) NOT NULL DEFAULT '0',
  `remark` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `loan_deductions_loan_id_foreign` (`loan_id`),
  CONSTRAINT `loan_deductions_loan_id_foreign` FOREIGN KEY (`loan_id`) REFERENCES `employee_loans` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_deductions`
--

LOCK TABLES `loan_deductions` WRITE;
/*!40000 ALTER TABLE `loan_deductions` DISABLE KEYS */;
/*!40000 ALTER TABLE `loan_deductions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_options`
--

DROP TABLE IF EXISTS `loan_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_options`
--

LOCK TABLES `loan_options` WRITE;
/*!40000 ALTER TABLE `loan_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `loan_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loans`
--

DROP TABLE IF EXISTS `loans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `loan_option` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(15,2) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loans`
--

LOCK TABLES `loans` WRITE;
/*!40000 ALTER TABLE `loans` DISABLE KEYS */;
/*!40000 ALTER TABLE `loans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_details`
--

DROP TABLE IF EXISTS `login_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_details`
--

LOCK TABLES `login_details` WRITE;
/*!40000 ALTER TABLE `login_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_employees`
--

DROP TABLE IF EXISTS `meeting_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meeting_employees` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `meeting_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_employees`
--

LOCK TABLES `meeting_employees` WRITE;
/*!40000 ALTER TABLE `meeting_employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `meeting_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings`
--

DROP TABLE IF EXISTS `meetings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meetings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int NOT NULL,
  `department_id` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_id` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings`
--

LOCK TABLES `meetings` WRITE;
/*!40000 ALTER TABLE `meetings` DISABLE KEYS */;
/*!40000 ALTER TABLE `meetings` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_09_28_102009_create_settings_table',1),(5,'2019_12_14_000001_create_personal_access_tokens_table',1),(6,'2019_12_26_101754_create_departments_table',1),(7,'2019_12_26_101814_create_designations_table',1),(8,'2019_12_26_105721_create_documents_table',1),(9,'2019_12_27_083751_create_branches_table',1),(10,'2019_12_27_090831_create_employees_table',1),(11,'2019_12_27_112922_create_employee_documents_table',1),(12,'2019_12_28_050508_create_awards_table',1),(13,'2019_12_28_050919_create_award_types_table',1),(14,'2019_12_31_060916_create_termination_types_table',1),(15,'2019_12_31_062259_create_terminations_table',1),(16,'2019_12_31_070521_create_resignations_table',1),(17,'2019_12_31_072252_create_travels_table',1),(18,'2019_12_31_090637_create_promotions_table',1),(19,'2019_12_31_092838_create_transfers_table',1),(20,'2019_12_31_100319_create_warnings_table',1),(21,'2019_12_31_103019_create_complaints_table',1),(22,'2020_01_02_090837_create_payslip_types_table',1),(23,'2020_01_02_093331_create_allowance_options_table',1),(24,'2020_01_02_102558_create_loan_options_table',1),(25,'2020_01_02_103822_create_deduction_options_table',1),(26,'2020_01_02_110828_create_genrate_payslip_options_table',1),(27,'2020_01_02_111807_create_set_salaries_table',1),(28,'2020_01_03_084302_create_allowances_table',1),(29,'2020_01_03_101735_create_commissions_table',1),(30,'2020_01_03_105019_create_loans_table',1),(31,'2020_01_03_105046_create_saturation_deductions_table',1),(32,'2020_01_03_105100_create_other_payments_table',1),(33,'2020_01_03_105111_create_overtimes_table',1),(34,'2020_01_04_072527_create_pay_slips_table',1),(35,'2020_01_06_045425_create_account_lists_table',1),(36,'2020_01_06_062213_create_payees_table',1),(37,'2020_01_06_070037_create_payers_table',1),(38,'2020_01_06_072939_create_income_types_table',1),(39,'2020_01_06_073055_create_expense_types_table',1),(40,'2020_01_06_085218_create_deposits_table',1),(41,'2020_01_06_090709_create_payment_types_table',1),(42,'2020_01_06_121442_create_expenses_table',1),(43,'2020_01_06_124036_create_transfer_balances_table',1),(44,'2020_01_13_084720_create_events_table',1),(45,'2020_01_16_041720_create_announcements_table',1),(46,'2020_01_16_090747_create_leave_types_table',1),(47,'2020_01_16_093256_create_leaves_table',1),(48,'2020_01_16_110357_create_meetings_table',1),(49,'2020_01_17_051906_create_tickets_table',1),(50,'2020_01_17_112647_create_ticket_replies_table',1),(51,'2020_01_23_101613_create_meeting_employees_table',1),(52,'2020_01_23_123844_create_event_employees_table',1),(53,'2020_01_24_062752_create_announcement_employees_table',1),(54,'2020_01_27_052503_create_attendance_employees_table',1),(55,'2020_02_17_035047_create_plans_table',1),(56,'2020_02_17_072503_create_orders_table',1),(57,'2020_02_28_051636_create_time_sheets_table',1),(58,'2020_03_12_095629_create_coupons_table',1),(59,'2020_03_12_120749_create_user_coupons_table',1),(60,'2020_04_21_115823_create_assets_table',1),(61,'2020_05_01_122144_create_ducument_uploads_table',1),(62,'2020_05_04_070452_create_indicators_table',1),(63,'2020_05_05_023742_create_appraisals_table',1),(64,'2020_05_05_061241_create_goal_types_table',1),(65,'2020_05_05_095926_create_goal_trackings_table',1),(66,'2020_05_07_093520_create_company_policies_table',1),(67,'2020_05_07_131311_create_training_types_table',1),(68,'2020_05_08_023838_create_trainers_table',1),(69,'2020_05_08_043039_create_trainings_table',1),(70,'2020_05_21_065337_create_permission_tables',1),(71,'2020_07_18_065859_create_messageses_table',1),(72,'2020_10_07_034726_create_holidays_table',1),(73,'2021_03_13_093312_create_ip_restricts_table',1),(74,'2021_03_13_114832_create_job_categories_table',1),(75,'2021_03_13_123125_create_job_stages_table',1),(76,'2021_03_15_094707_create_jobs_table',1),(77,'2021_03_15_153745_create_job_applications_table',1),(78,'2021_03_16_115140_create_job_application_notes_table',1),(79,'2021_03_17_163107_create_custom_questions_table',1),(80,'2021_03_18_140630_create_interview_schedules_table',1),(81,'2021_03_22_122532_create_job_on_boards_table',1),(82,'2021_06_22_094220_create_landing_page_sections_table',1),(83,'2021_06_25_032625_admin_payment_setting',1),(84,'2021_08_20_084119_create_competencies_table',1),(85,'2021_09_10_165514_create_plan_requests_table',1),(86,'2021_11_22_043537_create_performance__types_table',1),(87,'2021_12_24_061634_create_zoom_meetings_table',1),(88,'2022_07_13_085418_create_email_templates_table',1),(89,'2022_07_13_085511_create_email_template_langs_table',1),(90,'2022_07_13_085553_user_email_templates_table',1),(91,'2022_07_26_054753_create_contract_types_table',1),(92,'2022_07_28_035621_create_contracts_table',1),(93,'2022_07_28_035654_create_contract_attechments_table',1),(94,'2022_07_28_035713_create_contract_comments_table',1),(95,'2022_07_28_035731_create_contract_notes_table',1),(96,'2022_08_10_051439_generate__offer__letter',1),(97,'2022_08_16_050109_joining_letter',1),(98,'2022_08_17_045033_experience_certificate',1),(99,'2022_08_17_065806_noc_certificate',1),(100,'2022_12_09_999999_create_favorites_table',1),(101,'2022_12_09_999999_create_messages_table',1),(102,'2023_04_19_113655_create_login_details_table',1),(103,'2023_04_24_062256_create_webhook_settings_table',1),(104,'2023_05_03_033446_create_notification_templates_table',1),(105,'2023_05_03_033536_create_notification_template_langs_table',1),(106,'2023_06_05_043450_create_landing_page_settings_table',1),(107,'2023_06_08_094417_create_template_table',1),(108,'2023_06_10_114031_create_join_us_table',1),(109,'2023_06_28_061829_create_languages_table',1),(110,'2023_12_08_065736_add_is_disable_to_users_table',1),(111,'2024_01_23_060449_add_trial_expire_date_to_users_table',1),(112,'2024_01_23_060917_add_trial_to_plans_table',1),(113,'2024_01_24_053357_update_password_for_users_table',1),(114,'2024_01_24_054034_add_is_login_enable_to_users_table',1),(115,'2024_01_30_050310_add_is_disable_to_plans_table',1),(116,'2024_01_30_094128_add_is_refund_to_orders_table',1),(117,'2024_02_01_064327_add_attachments_to_ticket_replies_table',1),(118,'2024_02_01_064335_add_attachments_to_tickets_table',1),(119,'2024_04_15_092833_create_referral_settings_table',1),(120,'2024_04_15_093303_add_referral_code_to_users',1),(121,'2024_04_15_093820_create_referral_transactions_table',1),(122,'2024_04_15_095510_create_transaction_orders_table',1),(123,'2024_04_29_125113_add_biometric_emp_id_to_employees_table',1),(124,'2024_05_02_051304_add_branch_id_to_designations_table',1),(125,'2024_05_02_072829_add_terms_and_conditions_to_jobs_table',1),(126,'2024_11_29_101854__create_to_do_lists_table',1),(127,'2025_03_31_005837_create_comp_off_leave_logs_table',1),(128,'2025_04_01_090758_create_comp_offs_table',1),(129,'2025_06_23_092217_create_appointment_letters_table',1),(130,'2025_07_03_102458_create_comp_off_leaves_table',1),(131,'2025_07_03_110635_create_employee_loans_table',1),(132,'2025_07_03_112403_update_employees_table_structure',1),(133,'2025_07_03_113634_create_loan_deductions_table',1),(134,'2025_07_03_115126_create_daily_quotes_table',2),(135,'2025_07_04_063209_create_projects_table',3),(136,'2025_07_04_063335_create_notices_table',4),(137,'2025_07_04_063537_create_booking_forms_table',5),(138,'2025_07_04_084716_create_units_table',6);
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
INSERT INTO `model_has_roles` VALUES (1,'App\\Models\\User',1),(2,'App\\Models\\User',2),(4,'App\\Models\\User',3),(2,'App\\Models\\User',4),(3,'App\\Models\\User',4),(4,'App\\Models\\User',5),(4,'App\\Models\\User',6),(4,'App\\Models\\User',7),(4,'App\\Models\\User',9),(4,'App\\Models\\User',10),(4,'App\\Models\\User',11),(4,'App\\Models\\User',12),(4,'App\\Models\\User',13),(4,'App\\Models\\User',14),(4,'App\\Models\\User',15),(4,'App\\Models\\User',16),(4,'App\\Models\\User',17),(4,'App\\Models\\User',18),(4,'App\\Models\\User',19),(4,'App\\Models\\User',20),(4,'App\\Models\\User',21),(4,'App\\Models\\User',22),(4,'App\\Models\\User',23),(4,'App\\Models\\User',24),(4,'App\\Models\\User',25),(4,'App\\Models\\User',26),(4,'App\\Models\\User',27),(4,'App\\Models\\User',28),(4,'App\\Models\\User',29),(4,'App\\Models\\User',30),(4,'App\\Models\\User',31),(4,'App\\Models\\User',32),(4,'App\\Models\\User',33),(4,'App\\Models\\User',34),(4,'App\\Models\\User',35),(4,'App\\Models\\User',36),(4,'App\\Models\\User',37),(4,'App\\Models\\User',38),(4,'App\\Models\\User',39),(4,'App\\Models\\User',40),(4,'App\\Models\\User',41),(4,'App\\Models\\User',42),(4,'App\\Models\\User',43),(4,'App\\Models\\User',44),(4,'App\\Models\\User',45),(4,'App\\Models\\User',46),(3,'App\\Models\\User',48),(3,'App\\Models\\User',49),(4,'App\\Models\\User',50),(4,'App\\Models\\User',51),(4,'App\\Models\\User',52);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noc_certificates`
--

DROP TABLE IF EXISTS `noc_certificates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `noc_certificates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noc_certificates`
--

LOCK TABLES `noc_certificates` WRITE;
/*!40000 ALTER TABLE `noc_certificates` DISABLE KEYS */;
INSERT INTO `noc_certificates` VALUES (1,'ar','<h3 style=\"text-align: center;\">شهادة عدم ممانعة</h3>\r\n            \r\n            \r\n            \r\n            <p>التاريخ: {date}</p>\r\n            \r\n            \r\n            \r\n            <p>إلى من يهمه الأمر</p>\r\n            \r\n            \r\n            \r\n            <p>هذه الشهادة مخصصة للمطالبة بشهادة عدم ممانعة (NoC) للسيدة / السيد {employee_name} إذا انضمت إلى أي مؤسسة أخرى وقدمت خدماتها / خدماتها. يتم إبلاغه لأنه قام بتصفية جميع أرصدته واستلام أمانه من شركة {app_name}.</p>\r\n            \r\n            \r\n            \r\n            <p>نتمنى لها / لها التوفيق في المستقبل.</p>\r\n            \r\n            \r\n            \r\n            <p>بإخلاص،</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>التوقيع</p>\r\n            \r\n            <p>{app_name}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(2,'da','<h3 style=\"text-align: center;\">Ingen indsigelsesattest</h3>\r\n            \r\n            \r\n            \r\n            <p>Dato: {date}</p>\r\n            \r\n            \r\n            \r\n            <p>Til hvem det m&aring;tte vedr&oslash;re</p>\r\n            \r\n            \r\n            \r\n            <p>Dette certifikat er for at g&oslash;re krav p&aring; et No Objection Certificate (NoC) for Ms. / Mr. {employee_name}, hvis hun/han tilslutter sig og leverer sine tjenester til enhver anden organisation. Det informeres, da hun/han har udlignet alle sine saldi og modtaget sin sikkerhed fra {app_name}-virksomheden.</p>\r\n            \r\n            \r\n            \r\n            <p>Vi &oslash;nsker hende/ham held og lykke i fremtiden.</p>\r\n            \r\n            \r\n            \r\n            <p>Med venlig hilsen</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>Underskrift</p>\r\n            \r\n            <p>{app_name}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(3,'de','<h3 style=\"text-align: center;\">Kein Einwand-Zertifikat</h3>\r\n            \r\n            \r\n            \r\n            <p>Datum {date}</p>\r\n            \r\n            \r\n            \r\n            <p>Wen auch immer es betrifft</p>\r\n            \r\n            \r\n            \r\n            <p>Dieses Zertifikat soll ein Unbedenklichkeitszertifikat (NoC) f&uuml;r Frau / Herrn {employee_name} beanspruchen, wenn sie/er einer anderen Organisation beitritt und ihre/seine Dienste anbietet. Sie wird informiert, da sie/er alle ihre/seine Guthaben ausgeglichen und ihre/seine Sicherheit von der Firma {app_name} erhalten hat.</p>\r\n            \r\n            \r\n            \r\n            <p>Wir w&uuml;nschen ihr/ihm viel Gl&uuml;ck f&uuml;r die Zukunft.</p>\r\n            \r\n            \r\n            \r\n            <p>Aufrichtig,</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>Unterschrift</p>\r\n            \r\n            <p>{app_name}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(4,'en','<p style=\"text-align: center;\"><span style=\"font-size: 18pt;\"><strong>No Objection Certificate</strong></span></p>\r\n            \r\n            <p>Date: {date}</p>\r\n            \r\n            <p>To Whomsoever It May Concern</p>\r\n            \r\n            <p>This certificate is to claim a No Objection Certificate (NoC) for Ms. / Mr. {employee_name} if she/he joins and provides her/his services to any other organization. It is informed as she/he has cleared all her/his balances and received her/his security from {app_name} Company.</p>\r\n            \r\n            <p>We wish her/him good luck in the future.</p>\r\n            \r\n            <p>Sincerely,</p>\r\n            <p>{employee_name}</p>\r\n            <p>{designation}</p>\r\n            <p>Signature</p>\r\n            <p>{app_name}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(5,'es','<h3 style=\"text-align: center;\">Certificado de conformidad</h3>\r\n            \r\n            \r\n            \r\n            <p>Fecha: {date}</p>\r\n            \r\n            \r\n            \r\n            <p>A quien corresponda</p>\r\n            \r\n            \r\n            \r\n            <p>Este certificado es para reclamar un Certificado de No Objeci&oacute;n (NoC) para la Sra. / Sr. {employee_name} si ella / &eacute;l se une y brinda sus servicios a cualquier otra organizaci&oacute;n. Se informa que &eacute;l/ella ha liquidado todos sus saldos y recibido su seguridad de {app_name} Company.</p>\r\n            \r\n            \r\n            \r\n            <p>Le deseamos buena suerte en el futuro.</p>\r\n            \r\n            \r\n            \r\n            <p>Sinceramente,</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>Firma</p>\r\n            \r\n            <p>{app_name}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(6,'fr','<h3 style=\"text-align: center;\">Aucun certificat dopposition</h3>\r\n            \r\n            \r\n            <p>Date : {date}</p>\r\n            \r\n            \r\n            <p>&Agrave; toute personne concern&eacute;e</p>\r\n            \r\n            \r\n            <p>Ce certificat sert &agrave; r&eacute;clamer un certificat de non-objection (NoC) pour Mme / M. {employee_name} sil rejoint et fournit ses services &agrave; toute autre organisation. Il est inform&eacute; quil a sold&eacute; tous ses soldes et re&ccedil;u sa garantie de la part de la soci&eacute;t&eacute; {app_name}.</p>\r\n            \r\n            \r\n            <p>Nous lui souhaitons bonne chance pour lavenir.</p>\r\n            \r\n            \r\n            <p>Sinc&egrave;rement,</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>Signature</p>\r\n            \r\n            <p>{app_name}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(7,'id','<h3 style=\"text-align: center;\">Sertifikat Tidak Keberatan</h3>\r\n            \r\n            \r\n            \r\n            <p>Tanggal: {date}</p>\r\n            \r\n            \r\n            \r\n            <p>Kepada Siapa Pun Yang Memprihatinkan</p>\r\n            \r\n            \r\n            \r\n            <p>Sertifikat ini untuk mengklaim No Objection Certificate (NoC) untuk Ibu / Bapak {employee_name} jika dia bergabung dan memberikan layanannya ke organisasi lain mana pun. Diberitahukan karena dia telah melunasi semua saldonya dan menerima jaminannya dari Perusahaan {app_name}.</p>\r\n            \r\n            \r\n            \r\n            <p>Kami berharap dia sukses di masa depan.</p>\r\n            \r\n            \r\n            \r\n            <p>Sungguh-sungguh,</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>Tanda tangan</p>\r\n            \r\n            <p>{app_name}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(8,'it','<h3 style=\"text-align: center;\">Certificato di nulla osta</h3>\r\n            \r\n            \r\n            \r\n            <p>Data: {date}</p>\r\n            \r\n            \r\n            \r\n            <p>A chi pu&ograve; interessare</p>\r\n            \r\n            \r\n            \r\n            <p>Questo certificato serve a richiedere un certificato di non obiezione (NoC) per la signora / il signor {employee_name} se si unisce e fornisce i suoi servizi a qualsiasi altra organizzazione. Viene informato in quanto ha liquidato tutti i suoi saldi e ricevuto la sua sicurezza dalla societ&agrave; {app_name}.</p>\r\n            \r\n            \r\n            \r\n            <p>Le auguriamo buona fortuna per il futuro.</p>\r\n            \r\n            \r\n            \r\n            <p>Cordiali saluti,</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>Firma</p>\r\n            \r\n            <p>{app_name}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(9,'ja','<h3 style=\"text-align: center;\">異議なし証明書</h3>\r\n            \r\n            \r\n            \r\n            <p>日付: {date}</p>\r\n            \r\n            \r\n            \r\n            <p>関係者各位</p>\r\n            \r\n            \r\n            \r\n            <p>この証明書は、Ms. / Mr. {employee_name} が他の組織に参加してサービスを提供する場合に、異議なし証明書 (NoC) を請求するためのものです。彼女/彼/彼がすべての残高を清算し、{app_name} 会社から彼女/彼のセキュリティを受け取ったことが通知されます。</p>\r\n            \r\n            \r\n            \r\n            <p>彼女/彼の今後の幸運を祈っています。</p>\r\n            \r\n            \r\n            \r\n            <p>心から、</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>サイン</p>\r\n            \r\n            <p>{app_name}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(10,'nl','<h3 style=\"text-align: center;\">Geen bezwaarcertificaat</h3>\r\n            \r\n            \r\n            \r\n            <p>Datum: {date}</p>\r\n            \r\n            \r\n            \r\n            <p>Aan wie het ook aangaat</p>\r\n            \r\n            \r\n            \r\n            <p>Dit certificaat is bedoeld om aanspraak te maken op een Geen Bezwaarcertificaat (NoC) voor mevrouw/dhr. {employee_name} als zij/hij lid wordt en haar/zijn diensten verleent aan een andere organisatie. Het wordt ge&iuml;nformeerd als zij/hij al haar/zijn saldos heeft gewist en haar/zijn zekerheid heeft ontvangen van {app_name} Company.</p>\r\n            \r\n            \r\n            \r\n            <p>We wensen haar/hem veel succes in de toekomst.</p>\r\n            \r\n            \r\n            \r\n            <p>Eerlijk,</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>Handtekening</p>\r\n            \r\n            <p>{app_name}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(11,'pl','<h3 style=\"text-align: center;\">Certyfikat braku sprzeciwu</h3>\r\n            \r\n            \r\n            \r\n            <p>Data: {date}</p>\r\n            \r\n            \r\n            \r\n            <p>Do kogo to może dotyczyć</p>\r\n            \r\n            \r\n            \r\n            <p>Ten certyfikat służy do ubiegania się o Certyfikat No Objection Certificate (NoC) dla Pani/Pana {employee_name}, jeśli ona/ona dołącza i świadczy swoje usługi na rzecz jakiejkolwiek innej organizacji. Jest o tym informowany, ponieważ wyczyścił wszystkie swoje salda i otrzymał swoje zabezpieczenie od firmy {app_name}.</p>\r\n            \r\n            \r\n            \r\n            <p>Życzymy jej/jej powodzenia w przyszłości.</p>\r\n            \r\n            \r\n            \r\n            <p>Z poważaniem,</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>Podpis</p>\r\n            \r\n            <p>{app_name}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(12,'pt','<h3 style=\"text-align: center;\">Certificado de n&atilde;o obje&ccedil;&atilde;o</h3>\r\n                    \r\n            <p>Data: {date}</p>\r\n            \r\n            <p>A quem interessar</p>\r\n            \r\n            <p>Este certificado &eacute; para reivindicar um Certificado de N&atilde;o Obje&ccedil;&atilde;o (NoC) para a Sra. / Sr. {employee_name} se ela ingressar e fornecer seus servi&ccedil;os a qualquer outra organiza&ccedil;&atilde;o. &Eacute; informado que ela cancelou todos os seus saldos e recebeu sua garantia da empresa {app_name}.</p>\r\n            \r\n            <p>Desejamos-lhe boa sorte no futuro.</p>\r\n            \r\n            <p>Sinceramente,</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>Assinatura</p>\r\n            \r\n            <p>{app_name}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(13,'ru','<h3 style=\"text-align: center;\">Сертификат об отсутствии возражений</h3>\r\n            \r\n            \r\n            \r\n            <p>Дата: {date}</p>\r\n            \r\n            \r\n            \r\n            <p>Кого бы это ни касалось</p>\r\n            \r\n            \r\n            \r\n            <p>Этот сертификат предназначен для получения Сертификата об отсутствии возражений (NoC) для г-жи / г-на {employee_name}, если она / он присоединяется и предоставляет свои услуги любой другой организации. Сообщается, что она/он очистила все свои балансы и получила свою безопасность от компании {app_name}.</p>\r\n            \r\n            \r\n            \r\n            <p>Мы желаем ей/ему удачи в будущем.</p>\r\n            \r\n            \r\n            \r\n            <p>Искренне,</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>Подпись</p>\r\n            \r\n            <p>{app_name}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(14,'tr','<p style=\"text-align: center;\"><span style=\"font-size: 18pt;\"><strong>İtiraz Yok Belgesi</strong></span></p>\r\n            \r\n            <p>Tarih: {date}</p>\r\n            \r\n            <p>İlgilenebilecek Kişiye</p>\r\n            \r\n            <p>Bu sertifika, Bayan / Bay için bir İtiraz Yok Sertifikası (NoC) talep etmek içindir {employee_name} başka bir kuruluşa katılır ve hizmet verirse. Tüm bakiyelerini kapattığı ve teminatını aldığı bilgisi verilir {app_name} Şirket.</p>\r\n            \r\n            <p>Kendisine gelecekte iyi şanslar diliyoruz.</p>\r\n            \r\n            <p>Samimi olarak,</p>\r\n            <p>{employee_name}</p>\r\n            <p>{designation}</p>\r\n            <p>İmza</p>\r\n            <p>{app_name}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(15,'zh','<p style=\"text-align: center;\"><span style=\"font-size: 18pt;\"><strong>无异议证书</strong></span></p>\r\n            \r\n            <p>日期: {date}</p>\r\n            \r\n            <p>致相关负责人</p>\r\n            \r\n            <p>此证书旨在为女士/先生申请无异议证书（NoC）。{employee_name} 如果她/他加入任何其他组织并向其提供服务。据了解，她/他已结清所有余额并从以下机构收到她/他的担保： {app_name} 公司.</p>\r\n            \r\n            <p>我们祝她/他未来好运.</p>\r\n            \r\n            <p>真挚地,</p>\r\n            <p>{employee_name}</p>\r\n            <p>{designation}</p>\r\n            <p>签名</p>\r\n            <p>{app_name}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(16,'he','<p style=\"text-align: center;\"><span style=\"font-size: 18pt;\"><strong>אין תעודת התנגדות</strong></span></p>\r\n            \r\n            <p>תַאֲרִיך: {date}</p>\r\n            \r\n            <p>לכל מאן דבעי</p>\r\n            \r\n            <p>תעודה זו מיועדת לתבוע אישור ללא התנגדות (NoC) עבור גב / מר. {employee_name} אם הוא/ה מצטרף ומספק את שירותיו/ה לכל ארגון אחר. זה מודיע כפי שהיא / הוא פינה את כל היתרות שלה / שלו וקיבל את האבטחה שלה / שלו {app_name} חֶברָה.</p>\r\n            \r\n            <p>אנו מאחלים לו/לה בהצלחה בעתיד.</p>\r\n            \r\n            <p>בכנות,</p>\r\n            <p>{employee_name}</p>\r\n            <p>{designation}</p>\r\n            <p>חֲתִימָה</p>\r\n            <p>{app_name}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47'),(17,'pt-br','<h3 style=\"text-align: center;\">Certificado de n&atilde;o obje&ccedil;&atilde;o</h3>\r\n                    \r\n            <p>Data: {date}</p>\r\n            \r\n            <p>A quem interessar</p>\r\n            \r\n            <p>Este certificado &eacute; para reivindicar um Certificado de N&atilde;o Obje&ccedil;&atilde;o (NoC) para a Sra. / Sr. {employee_name} se ela ingressar e fornecer seus servi&ccedil;os a qualquer outra organiza&ccedil;&atilde;o. &Eacute; informado que ela cancelou todos os seus saldos e recebeu sua garantia da empresa {app_name}.</p>\r\n            \r\n            <p>Desejamos-lhe boa sorte no futuro.</p>\r\n            \r\n            <p>Sinceramente,</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>Assinatura</p>\r\n            \r\n            <p>{app_name}</p>',2,'2025-07-04 00:49:47','2025-07-04 00:49:47');
/*!40000 ALTER TABLE `noc_certificates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notices`
--

DROP TABLE IF EXISTS `notices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notices` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `notice_startdate` date NOT NULL,
  `notice_enddate` date NOT NULL,
  `created_by` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notices`
--

LOCK TABLES `notices` WRITE;
/*!40000 ALTER TABLE `notices` DISABLE KEYS */;
/*!40000 ALTER TABLE `notices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_template_langs`
--

DROP TABLE IF EXISTS `notification_template_langs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_template_langs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int NOT NULL,
  `lang` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `variables` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_template_langs`
--

LOCK TABLES `notification_template_langs` WRITE;
/*!40000 ALTER TABLE `notification_template_langs` DISABLE KEYS */;
INSERT INTO `notification_template_langs` VALUES (1,1,'ar','تم إنشاء قسيمة دفع بتاريخ {year}.','{\n                    \"Year\": \"year\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(2,1,'da','Lønseddel genereret af {year}.','{\n                    \"Year\": \"year\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(3,1,'de','Gehaltsabrechnung erstellt vom {year}.','{\n                    \"Year\": \"year\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(4,1,'en','Payslip generated of {year}.','{\n                    \"Year\": \"year\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(5,1,'es','Nómina generada de {year}.','{\n                    \"Year\": \"year\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(6,1,'fr','Fiche de paie générée de {year}.','{\n                    \"Year\": \"year\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(7,1,'it','Busta paga generata da {year}.','{\n                    \"Year\": \"year\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(8,1,'ja','{year} の給与明細が作成されました。','{\n                    \"Year\": \"year\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(9,1,'nl','Loonstrook gegenereerd van {year}.','{\n                    \"Year\": \"year\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(10,1,'pl','Odcinek wypłaty wygenerowany za {year}.','{\n                    \"Year\": \"year\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(11,1,'pt','Folha de pagamento gerada de {year}.','{\n                    \"Year\": \"year\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(12,1,'ru','Расчетная ведомость создана за {year}.','{\n                    \"Year\": \"year\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(13,1,'tr','oluşturulan maaş bordrosu {year}.','{\n                    \"Year\": \"year\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(14,1,'zh','生成的工资单 {year}','{\n                    \"Year\": \"year\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(15,1,'he','תלוש שכר שנוצר מ {year}.','{\n                    \"Year\": \"year\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(16,1,'pt-br','Folha de pagamento gerada de {year}.','{\n                    \"Year\": \"year\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(17,2,'ar','{announcement_title} إعلان تم إنشاؤه للفرع {branch_name} من {start_date} ل {end_date}','{\n                    \"Announcement Title\": \"announcement_title\",\n                    \"Branch name\": \"branch_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(18,2,'da','{announcement_title} meddelelse oprettet for filial {branch_name} fra {start_date} to {end_date}','{\n                    \"Announcement Title\": \"announcement_title\",\n                    \"Branch name\": \"branch_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(19,2,'de','{announcement_title} Ankündigung für Filiale erstellt {branch_name} aus {start_date} Zu {end_date}','{\n                    \"Announcement Title\": \"announcement_title\",\n                    \"Branch name\": \"branch_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(20,2,'en','{announcement_title} announcement created for branch {branch_name} from {start_date} to {end_date}','{\n                    \"Announcement Title\": \"announcement_title\",\n                    \"Branch name\": \"branch_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(21,2,'es','{announcement_title} anuncio creado para sucursal {branch_name} de {start_date} a {end_date}','{\n                    \"Announcement Title\": \"announcement_title\",\n                    \"Branch name\": \"branch_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(22,2,'fr','{announcement_title} annonce créée pour la filiale {branch_name} depuis {start_date} pour {end_date}','{\n                    \"Announcement Title\": \"announcement_title\",\n                    \"Branch name\": \"branch_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(23,2,'it','{announcement_title} annuncio creato per branch {branch_name} da {start_date} A {end_date}','{\n                    \"Announcement Title\": \"announcement_title\",\n                    \"Branch name\": \"branch_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(24,2,'ja','{announcement_title} ブランチ用に作成されたお知らせ {branch_name} から {start_date} に {end_date}','{\n                    \"Announcement Title\": \"announcement_title\",\n                    \"Branch name\": \"branch_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(25,2,'nl','{announcement_title} aankondiging gemaakt voor filiaal {branch_name} van {start_date} naar {end_date}','{\n                    \"Announcement Title\": \"announcement_title\",\n                    \"Branch name\": \"branch_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(26,2,'pl','{announcement_title} ogłoszenie stworzone dla oddziału {branch_name} z {start_date} Do {end_date}','{\n                    \"Announcement Title\": \"announcement_title\",\n                    \"Branch name\": \"branch_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(27,2,'pt','{announcement_title} anúncio criado para filial {branch_name} de {start_date} para {end_date}','{\n                    \"Announcement Title\": \"announcement_title\",\n                    \"Branch name\": \"branch_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(28,2,'ru','{announcement_title} объявление создано для ветки {branch_name} от {start_date} к {end_date}','{\n                    \"Announcement Title\": \"announcement_title\",\n                    \"Branch name\": \"branch_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(29,2,'tr','{announcement_title} şube için oluşturulan duyuru {branch_name} itibaren {start_date} ile {end_date}','{\n                    \"Announcement Title\": \"announcement_title\",\n                    \"Branch name\": \"branch_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(30,2,'zh','{announcement_title} 为分支机构创建的公告 {branch_name} 从 {start_date} 到 {end_date}','{\n                    \"Announcement Title\": \"announcement_title\",\n                    \"Branch name\": \"branch_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(31,2,'he','{announcement_title} הודעה נוצרה עבור הסניף {branch_name} מ {start_date} ל {end_date}','{\n                    \"Announcement Title\": \"announcement_title\",\n                    \"Branch name\": \"branch_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(32,2,'pt-br','{announcement_title} anúncio criado para filial {branch_name} de {start_date} para {end_date}','{\n                    \"Announcement Title\": \"announcement_title\",\n                    \"Branch name\": \"branch_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(33,3,'ar','{meeting_title} تم إنشاء الاجتماع لـ {branch_name} من {date} في {time}.','{\n                    \"Meeting title\": \"meeting_title\",\n                    \"Branch name\": \"branch_name\",\n                    \"Date\": \"date\",\n                    \"Time\": \"time\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(34,3,'da','{meeting_title} møde oprettet til {branch_name} fra {date} på {time}.','{\n                    \"Meeting title\": \"meeting_title\",\n                    \"Branch name\": \"branch_name\",\n                    \"Date\": \"date\",\n                    \"Time\": \"time\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(35,3,'de','{meeting_title} Besprechung erstellt für {branch_name} aus {date} bei {time}.','{\n                    \"Meeting title\": \"meeting_title\",\n                    \"Branch name\": \"branch_name\",\n                    \"Date\": \"date\",\n                    \"Time\": \"time\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(36,3,'en','{meeting_title} meeting created for {branch_name} from {date} at {time}.','{\n                    \"Meeting title\": \"meeting_title\",\n                    \"Branch name\": \"branch_name\",\n                    \"Date\": \"date\",\n                    \"Time\": \"time\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(37,3,'es','{meeting_title} reunión creada para {branch_name} de {date} en {time}.','{\n                    \"Meeting title\": \"meeting_title\",\n                    \"Branch name\": \"branch_name\",\n                    \"Date\": \"date\",\n                    \"Time\": \"time\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(38,3,'fr','{meeting_title} réunion créée pour {branch_name} depuis {date} à {time}.','{\n                    \"Meeting title\": \"meeting_title\",\n                    \"Branch name\": \"branch_name\",\n                    \"Date\": \"date\",\n                    \"Time\": \"time\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(39,3,'it','{meeting_title} incontro creato per {branch_name} da {date} A {time}.','{\n                    \"Meeting title\": \"meeting_title\",\n                    \"Branch name\": \"branch_name\",\n                    \"Date\": \"date\",\n                    \"Time\": \"time\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(40,3,'ja','{meeting_title} のために作成された会議 {branch_name} から {date} で {time}.','{\n                    \"Meeting title\": \"meeting_title\",\n                    \"Branch name\": \"branch_name\",\n                    \"Date\": \"date\",\n                    \"Time\": \"time\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(41,3,'nl','{meeting_title} bijeenkomst gemaakt voor {branch_name} van {date} bij {time}.','{\n                    \"Meeting title\": \"meeting_title\",\n                    \"Branch name\": \"branch_name\",\n                    \"Date\": \"date\",\n                    \"Time\": \"time\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(42,3,'pl','{meeting_title} spotkanie stworzone dla {branch_name} z {date} Na {time}.','{\n                    \"Meeting title\": \"meeting_title\",\n                    \"Branch name\": \"branch_name\",\n                    \"Date\": \"date\",\n                    \"Time\": \"time\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(43,3,'pt','{meeting_title} reunião criada para {branch_name} de {date} no {time}.','{\n                    \"Meeting title\": \"meeting_title\",\n                    \"Branch name\": \"branch_name\",\n                    \"Date\": \"date\",\n                    \"Time\": \"time\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(44,3,'ru','{meeting_title} встреча создана для {branch_name} от {date} в {time}.','{\n                    \"Meeting title\": \"meeting_title\",\n                    \"Branch name\": \"branch_name\",\n                    \"Date\": \"date\",\n                    \"Time\": \"time\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(45,3,'tr','{meeting_title} için oluşturulan toplantı {branch_name} itibaren {date} de {time}.','{\n                    \"Meeting title\": \"meeting_title\",\n                    \"Branch name\": \"branch_name\",\n                    \"Date\": \"date\",\n                    \"Time\": \"time\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(46,3,'zh','{meeting_title} 为以下目的创建的会议 {branch_name} 从 {date} 在 {time}.','{\n                    \"Meeting title\": \"meeting_title\",\n                    \"Branch name\": \"branch_name\",\n                    \"Date\": \"date\",\n                    \"Time\": \"time\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(47,3,'he','{meeting_title} פגישה נוצרה עבור {branch_name} מ {date} בְּ- {time}.','{\n                    \"Meeting title\": \"meeting_title\",\n                    \"Branch name\": \"branch_name\",\n                    \"Date\": \"date\",\n                    \"Time\": \"time\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(48,3,'pt-br','{meeting_title} reunião criada para {branch_name} de {date} no {time}.','{\n                    \"Meeting title\": \"meeting_title\",\n                    \"Branch name\": \"branch_name\",\n                    \"Date\": \"date\",\n                    \"Time\": \"time\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(49,4,'ar','{award_name} خلقت ل {employee_name} من {date}.','{\n                    \"Award name\": \"award_name\",\n                    \"Employee Name\": \"employee_name\",\n                    \"Date\": \"date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(50,4,'da','{award_name} skabt til {employee_name} fra {date}.','{\n                    \"Award name\": \"award_name\",\n                    \"Employee Name\": \"employee_name\",\n                    \"Date\": \"date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(51,4,'de','{award_name} hergestellt für {employee_name} aus {date}.','{\n                    \"Award name\": \"award_name\",\n                    \"Employee Name\": \"employee_name\",\n                    \"Date\": \"date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(52,4,'en','{award_name} created for {employee_name} from {date}.','{\n                    \"Award name\": \"award_name\",\n                    \"Employee Name\": \"employee_name\",\n                    \"Date\": \"date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(53,4,'es','{award_name} creado para {employee_name} de {date}.','{\n                    \"Award name\": \"award_name\",\n                    \"Employee Name\": \"employee_name\",\n                    \"Date\": \"date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(54,4,'fr','{award_name} créé pour {employee_name} depuis {date}.','{\n                    \"Award name\": \"award_name\",\n                    \"Employee Name\": \"employee_name\",\n                    \"Date\": \"date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(55,4,'it','{award_name} creato per {employee_name} da {date}.','{\n                    \"Award name\": \"award_name\",\n                    \"Employee Name\": \"employee_name\",\n                    \"Date\": \"date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(56,4,'ja','{award_name} のために作成された {employee_name} から {date}.','{\n                    \"Award name\": \"award_name\",\n                    \"Employee Name\": \"employee_name\",\n                    \"Date\": \"date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(57,4,'nl','{award_name} gemaakt voor {employee_name} van {date}.','{\n                    \"Award name\": \"award_name\",\n                    \"Employee Name\": \"employee_name\",\n                    \"Date\": \"date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(58,4,'pl','{award_name} stworzone dla {employee_name} z {date}.','{\n                    \"Award name\": \"award_name\",\n                    \"Employee Name\": \"employee_name\",\n                    \"Date\": \"date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(59,4,'pt','{award_name} criado para {employee_name} de {date}.','{\n                    \"Award name\": \"award_name\",\n                    \"Employee Name\": \"employee_name\",\n                    \"Date\": \"date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(60,4,'ru','{award_name} предназначен для {employee_name} от {date}.','{\n                    \"Award name\": \"award_name\",\n                    \"Employee Name\": \"employee_name\",\n                    \"Date\": \"date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(61,4,'tr','{award_name} için yaratıldı {employee_name} itibaren {date}.','{\n                    \"Award name\": \"award_name\",\n                    \"Employee Name\": \"employee_name\",\n                    \"Date\": \"date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(62,4,'zh','{award_name} 已创建 为了 {employee_name} 从 {date}.','{\n                    \"Award name\": \"award_name\",\n                    \"Employee Name\": \"employee_name\",\n                    \"Date\": \"date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(63,4,'he','{award_name} נוצר עבור {employee_name} מ {date}.','{\n                    \"Award name\": \"award_name\",\n                    \"Employee Name\": \"employee_name\",\n                    \"Date\": \"date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(64,4,'pt-br','{award_name} criado para {employee_name} de {date}.','{\n                    \"Award name\": \"award_name\",\n                    \"Employee Name\": \"employee_name\",\n                    \"Date\": \"date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(65,5,'ar','{occasion_name} على {start_date} ل {end_date}.','{\n                    \"Occasion name\": \"occasion_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(66,5,'da','{occasion_name} på {start_date} til {end_date}.','{\n                    \"Occasion name\": \"occasion_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(67,5,'de','{occasion_name} An {start_date} Zu {end_date}.','{\n                    \"Occasion name\": \"occasion_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(68,5,'en','{occasion_name} on {start_date} to {end_date}.','{\n                    \"Occasion name\": \"occasion_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(69,5,'es','{occasion_name} en {start_date} a {end_date}.','{\n                    \"Occasion name\": \"occasion_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(70,5,'fr','{occasion_name} sur {start_date} pour {end_date}.','{\n                    \"Occasion name\": \"occasion_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(71,5,'it','{occasion_name} SU {start_date} A {end_date}.','{\n                    \"Occasion name\": \"occasion_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(72,5,'ja','{occasion_name} の上 {start_date} に {end_date}.','{\n                    \"Occasion name\": \"occasion_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(73,5,'nl','{occasion_name} op {start_date} naar {end_date}.','{\n                    \"Occasion name\": \"occasion_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(74,5,'pl','{occasion_name} NA {start_date} Do {end_date}.','{\n                    \"Occasion name\": \"occasion_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(75,5,'pt','{occasion_name} sobre {start_date} para {end_date}.','{\n                    \"Occasion name\": \"occasion_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(76,5,'ru','{occasion_name} на {start_date} к {end_date}.','{\n                    \"Occasion name\": \"occasion_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(77,5,'tr','{occasion_name} Açık {start_date} ile {end_date}.','{\n                    \"Occasion name\": \"occasion_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(78,5,'zh','{occasion_name} 在 {start_date} 到 {end_date}.','{\n                    \"Occasion name\": \"occasion_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(79,5,'he','{occasion_name} עַל {start_date} ל {end_date}.','{\n                    \"Occasion name\": \"occasion_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(80,5,'pt-br','{occasion_name} sobre {start_date} para {end_date}.','{\n                    \"Occasion name\": \"occasion_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(81,6,'ar','{company_policy_name} ل {branch_name} مخلوق.','{\n                    \"Company policy name\": \"company_policy_name\",\n                    \"Branch name\": \"branch_name\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(82,6,'da','{company_policy_name} til {branch_name} oprettet.','{\n                    \"Company policy name\": \"company_policy_name\",\n                    \"Branch name\": \"branch_name\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(83,6,'de','{company_policy_name} für {branch_name} erstellt.','{\n                    \"Company policy name\": \"company_policy_name\",\n                    \"Branch name\": \"branch_name\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(84,6,'en','{company_policy_name} for {branch_name} created.','{\n                    \"Company policy name\": \"company_policy_name\",\n                    \"Branch name\": \"branch_name\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(85,6,'es','{company_policy_name} para {branch_name} creada.','{\n                    \"Company policy name\": \"company_policy_name\",\n                    \"Branch name\": \"branch_name\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(86,6,'fr','{company_policy_name} pour {branch_name} créé.','{\n                    \"Company policy name\": \"company_policy_name\",\n                    \"Branch name\": \"branch_name\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(87,6,'it','{company_policy_name} per {branch_name} creata.','{\n                    \"Company policy name\": \"company_policy_name\",\n                    \"Branch name\": \"branch_name\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(88,6,'ja','{company_policy_name} ために {branch_name} 作成した.','{\n                    \"Company policy name\": \"company_policy_name\",\n                    \"Branch name\": \"branch_name\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(89,6,'nl','{company_policy_name} voor {branch_name} gemaakt.','{\n                    \"Company policy name\": \"company_policy_name\",\n                    \"Branch name\": \"branch_name\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(90,6,'pl','{company_policy_name} Do {branch_name} Utworzony.','{\n                    \"Company policy name\": \"company_policy_name\",\n                    \"Branch name\": \"branch_name\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(91,6,'pt','{company_policy_name} para {branch_name} criada.','{\n                    \"Company policy name\": \"company_policy_name\",\n                    \"Branch name\": \"branch_name\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(92,6,'ru','{company_policy_name} для {branch_name} созданный.','{\n                    \"Company policy name\": \"company_policy_name\",\n                    \"Branch name\": \"branch_name\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(93,6,'tr','{company_policy_name} için {branch_name} oluşturuldu.','{\n                    \"Company policy name\": \"company_policy_name\",\n                    \"Branch name\": \"branch_name\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(94,6,'zh','{company_policy_name} 为了 {branch_name} 已创建.','{\n                    \"Company policy name\": \"company_policy_name\",\n                    \"Branch name\": \"branch_name\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(95,6,'he','{company_policy_name} ל {branch_name} נוצר.','{\n                    \"Company policy name\": \"company_policy_name\",\n                    \"Branch name\": \"branch_name\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(96,6,'pt-br','{company_policy_name} para {branch_name} criada.','{\n                    \"Company policy name\": \"company_policy_name\",\n                    \"Branch name\": \"branch_name\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(97,7,'ar','تم إنشاء تذكرة دعم جديدة من {ticket_priority} الأولوية ل {employee_name}.','{\n                    \"Ticket priority\": \"ticket_priority\",\n                    \"Employee Name\": \"employee_name\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(98,7,'da','Ny supportbillet oprettet af {ticket_priority} prioritet for {employee_name}.','{\n                    \"Ticket priority\": \"ticket_priority\",\n                    \"Employee Name\": \"employee_name\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(99,7,'de','Neues Support-Ticket erstellt von {ticket_priority} Priorität für {employee_name}.','{\n                    \"Ticket priority\": \"ticket_priority\",\n                    \"Employee Name\": \"employee_name\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(100,7,'en','New Support ticket created of {ticket_priority} priority for {employee_name}.','{\n                    \"Ticket priority\": \"ticket_priority\",\n                    \"Employee Name\": \"employee_name\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(101,7,'es','Nuevo ticket de soporte creado de {ticket_priority} prioridad para {employee_name}.','{\n                    \"Ticket priority\": \"ticket_priority\",\n                    \"Employee Name\": \"employee_name\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(102,7,'fr','Nouveau ticket de support créé de {ticket_priority} priorité pour {employee_name}.','{\n                    \"Ticket priority\": \"ticket_priority\",\n                    \"Employee Name\": \"employee_name\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(103,7,'it','Nuovo ticket di supporto creato da {ticket_priority} priorità per {employee_name}.','{\n                    \"Ticket priority\": \"ticket_priority\",\n                    \"Employee Name\": \"employee_name\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(104,7,'ja','の新しいサポート チケットが作成されました {ticket_priority} の優先順位 {employee_name}.','{\n                    \"Ticket priority\": \"ticket_priority\",\n                    \"Employee Name\": \"employee_name\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(105,7,'nl','Nieuw supportticket gemaakt van {ticket_priority} prioriteit voor {employee_name}.','{\n                    \"Ticket priority\": \"ticket_priority\",\n                    \"Employee Name\": \"employee_name\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(106,7,'pl','Utworzono nowe zgłoszenie do pomocy technicznej {ticket_priority} priorytet dla {employee_name}.','{\n                    \"Ticket priority\": \"ticket_priority\",\n                    \"Employee Name\": \"employee_name\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(107,7,'pt','Novo ticket de suporte criado de {ticket_priority} prioridade para {employee_name}.','{\n                    \"Ticket priority\": \"ticket_priority\",\n                    \"Employee Name\": \"employee_name\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(108,7,'ru','Создан новый тикет в службу поддержки {ticket_priority} приоритет для {employee_name}.','{\n                    \"Ticket priority\": \"ticket_priority\",\n                    \"Employee Name\": \"employee_name\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(109,7,'tr','Şunun için yeni Destek bileti oluşturuldu {ticket_priority} için öncelik {employee_name}.','{\n                    \"Ticket priority\": \"ticket_priority\",\n                    \"Employee Name\": \"employee_name\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(110,7,'zh','新的支持票证创建于 {ticket_priority} 优先于 {employee_name}.','{\n                    \"Ticket priority\": \"ticket_priority\",\n                    \"Employee Name\": \"employee_name\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(111,7,'he','כרטיס תמיכה חדש נוצר מ {ticket_priority} עדיפות עבור {employee_name}.','{\n                    \"Ticket priority\": \"ticket_priority\",\n                    \"Employee Name\": \"employee_name\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(112,7,'pt-br','Novo ticket de suporte criado de {ticket_priority} prioridade para {employee_name}.','{\n                    \"Ticket priority\": \"ticket_priority\",\n                    \"Employee Name\": \"employee_name\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(113,8,'ar','{event_name} للفرع {branch_name} من {start_date} ل {end_date}','{\n                    \"Event name\": \"event_name\",\n                    \"Branch name\": \"branch_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(114,8,'da','{event_name} for filial {branch_name} fra {start_date} til {end_date}','{\n                    \"Event name\": \"event_name\",\n                    \"Branch name\": \"branch_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(115,8,'de','{event_name} für Filiale {branch_name} aus {start_date} Zu {end_date}','{\n                    \"Event name\": \"event_name\",\n                    \"Branch name\": \"branch_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(116,8,'en','{event_name} for branch {branch_name} from {start_date} to {end_date}','{\n                    \"Event name\": \"event_name\",\n                    \"Branch name\": \"branch_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(117,8,'es','{event_name} para rama {branch_name} de {start_date} a {end_date}','{\n                    \"Event name\": \"event_name\",\n                    \"Branch name\": \"branch_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(118,8,'fr','{event_name} pour la branche {branch_name} depuis {start_date} pour {end_date}','{\n                    \"Event name\": \"event_name\",\n                    \"Branch name\": \"branch_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(119,8,'it','{event_name} per ramo {branch_name} da {start_date} A {end_date}','{\n                    \"Event name\": \"event_name\",\n                    \"Branch name\": \"branch_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(120,8,'ja','{event_name} 支店用 {branch_name} から {start_date} に {end_date}','{\n                    \"Event name\": \"event_name\",\n                    \"Branch name\": \"branch_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(121,8,'nl','{event_name} voor filiaal {branch_name} van {start_date} naar {end_date}','{\n                    \"Event name\": \"event_name\",\n                    \"Branch name\": \"branch_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(122,8,'pl','{event_name} dla oddziału {branch_name} z {start_date} Do {end_date}','{\n                    \"Event name\": \"event_name\",\n                    \"Branch name\": \"branch_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(123,8,'pt','{event_name} para ramo {branch_name} de {start_date} para {end_date}','{\n                    \"Event name\": \"event_name\",\n                    \"Branch name\": \"branch_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(124,8,'ru','{event_name} для филиала {branch_name} от {start_date} к {end_date}','{\n                    \"Event name\": \"event_name\",\n                    \"Branch name\": \"branch_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(125,8,'tr','{event_name} şube için {branch_name} itibaren {start_date} ile {end_date}','{\n                    \"Event name\": \"event_name\",\n                    \"Branch name\": \"branch_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(126,8,'zh','{event_name} 对于分支机构 {branch_name} 从 {start_date} 到 {end_date}','{\n                    \"Event name\": \"event_name\",\n                    \"Branch name\": \"branch_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(127,8,'he','{event_name} עבור סניף {branch_name} מ {start_date} ל {end_date}','{\n                    \"Event name\": \"event_name\",\n                    \"Branch name\": \"branch_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(128,8,'pt-br','{event_name} para ramo {branch_name} de {start_date} para {end_date}','{\n                    \"Event name\": \"event_name\",\n                    \"Branch name\": \"branch_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(129,9,'ar','لقد كانت إجازتك {leave_status}.','{\n                    \"Leave Status\": \"leave_status\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(130,9,'da','Din orlov har været {leave_status}.','{\n                    \"Leave Status\": \"leave_status\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(131,9,'de','Ihr Urlaub war {leave_status}.','{\n                    \"Leave Status\": \"leave_status\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(132,9,'en','Your leave has been {leave_status}.','{\n                    \"Leave Status\": \"leave_status\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(133,9,'es','Tu permiso ha sido {leave_status}.','{\n                    \"Leave Status\": \"leave_status\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(134,9,'fr','Votre congé a été {leave_status}.','{\n                    \"Leave Status\": \"leave_status\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(135,9,'it','Il tuo congedo è stato {leave_status}.','{\n                    \"Leave Status\": \"leave_status\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(136,9,'ja','あなたの休暇は {leave_status}.','{\n                    \"Leave Status\": \"leave_status\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(137,9,'nl','Je verlof is geweest {leave_status}.','{\n                    \"Leave Status\": \"leave_status\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(138,9,'pl','Twój urlop był {leave_status}.','{\n                    \"Leave Status\": \"leave_status\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(139,9,'pt','sua licença foi {leave_status}.','{\n                    \"Leave Status\": \"leave_status\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(140,9,'ru','Ваш отпуск был {leave_status}.','{\n                    \"Leave Status\": \"leave_status\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(141,9,'tr','İzniniz oldu {leave_status}.','{\n                    \"Leave Status\": \"leave_status\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(142,9,'zh','你的假期已经 {leave_status}.','{\n                    \"Leave Status\": \"leave_status\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(143,9,'he','החופש שלך היה {leave_status}.','{\n                    \"Leave Status\": \"leave_status\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(144,9,'pt-br','sua licença foi {leave_status}.','{\n                    \"Leave Status\": \"leave_status\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(145,10,'ar','{purpose_of_visit} تم إنشاؤه للزيارة {place_of_visit} ل {employee_name} من {start_date} ل {end_date}.','{\n                    \"Purpose of visit\": \"purpose_of_visit\",\n                    \"Place of visit\": \"place_of_visit\",\n                    \"Employee Name\": \"employee_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(146,10,'da','{purpose_of_visit} er skabt til at besøge {place_of_visit} til {employee_name} fra {start_date} til {end_date}.','{\n                    \"Purpose of visit\": \"purpose_of_visit\",\n                    \"Place of visit\": \"place_of_visit\",\n                    \"Employee Name\": \"employee_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(147,10,'de','{purpose_of_visit} ist zum Besuchen angelegt {place_of_visit} für {employee_name} aus {start_date} Zu {end_date}.','{\n                    \"Purpose of visit\": \"purpose_of_visit\",\n                    \"Place of visit\": \"place_of_visit\",\n                    \"Employee Name\": \"employee_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(148,10,'en','{purpose_of_visit} is created to visit {place_of_visit} for {employee_name} from {start_date} to {end_date}.','{\n                    \"Purpose of visit\": \"purpose_of_visit\",\n                    \"Place of visit\": \"place_of_visit\",\n                    \"Employee Name\": \"employee_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(149,10,'es','{purpose_of_visit} se crea para visitar {place_of_visit} para {employee_name} de {start_date} a {end_date}.','{\n                    \"Purpose of visit\": \"purpose_of_visit\",\n                    \"Place of visit\": \"place_of_visit\",\n                    \"Employee Name\": \"employee_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(150,10,'fr','{purpose_of_visit} est créé pour visiter {place_of_visit} pour {employee_name} depuis {start_date} pour {end_date}.','{\n                    \"Purpose of visit\": \"purpose_of_visit\",\n                    \"Place of visit\": \"place_of_visit\",\n                    \"Employee Name\": \"employee_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(151,10,'it','{purpose_of_visit} è creato per visitare {place_of_visit} for {employee_name} per {start_date} A {end_date}.','{\n                    \"Purpose of visit\": \"purpose_of_visit\",\n                    \"Place of visit\": \"place_of_visit\",\n                    \"Employee Name\": \"employee_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(152,10,'ja','{purpose_of_visit} 訪問するために作成されます {place_of_visit} ために {employee_name} から {start_date} に {end_date}.','{\n                    \"Purpose of visit\": \"purpose_of_visit\",\n                    \"Place of visit\": \"place_of_visit\",\n                    \"Employee Name\": \"employee_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(153,10,'nl','{purpose_of_visit} is gemaakt om te bezoeken {place_of_visit} voor {employee_name} van {start_date} naar {end_date}.','{\n                    \"Purpose of visit\": \"purpose_of_visit\",\n                    \"Place of visit\": \"place_of_visit\",\n                    \"Employee Name\": \"employee_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(154,10,'pl','{purpose_of_visit} jest stworzony do zwiedzania {place_of_visit} Do {employee_name} z {start_date} Do {end_date}.','{\n                    \"Purpose of visit\": \"purpose_of_visit\",\n                    \"Place of visit\": \"place_of_visit\",\n                    \"Employee Name\": \"employee_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(155,10,'pt','{purpose_of_visit} é criado para visitar {place_of_visit} para {employee_name} de {start_date} para {end_date}.','{\n                    \"Purpose of visit\": \"purpose_of_visit\",\n                    \"Place of visit\": \"place_of_visit\",\n                    \"Employee Name\": \"employee_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(156,10,'ru','{purpose_of_visit} создан для посещения {place_of_visit} для {employee_name} от {start_date} к {end_date}.','{\n                    \"Purpose of visit\": \"purpose_of_visit\",\n                    \"Place of visit\": \"place_of_visit\",\n                    \"Employee Name\": \"employee_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(157,10,'tr','{purpose_of_visit} ziyaret etmek için yaratılmıştır {place_of_visit} için {employee_name} itibaren {start_date} ile {end_date}.','{\n                    \"Purpose of visit\": \"purpose_of_visit\",\n                    \"Place of visit\": \"place_of_visit\",\n                    \"Employee Name\": \"employee_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(158,10,'zh','{purpose_of_visit} 被创建来访问 {place_of_visit} 为了 {employee_name} 从 {start_date} 到 {end_date}.','{\n                    \"Purpose of visit\": \"purpose_of_visit\",\n                    \"Place of visit\": \"place_of_visit\",\n                    \"Employee Name\": \"employee_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(159,10,'he','{purpose_of_visit} נוצר כדי לבקר {place_of_visit} ל {employee_name} מ {start_date} ל {end_date}.','{\n                    \"Purpose of visit\": \"purpose_of_visit\",\n                    \"Place of visit\": \"place_of_visit\",\n                    \"Employee Name\": \"employee_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(160,10,'pt-br','{purpose_of_visit} é criado para visitar {place_of_visit} para {employee_name} de {start_date} para {end_date}.','{\n                    \"Purpose of visit\": \"purpose_of_visit\",\n                    \"Place of visit\": \"place_of_visit\",\n                    \"Employee Name\": \"employee_name\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(161,11,'ar','تم إنشاء الفاتورة الجديدة {contract_number} بواسطة {contract_company_name}.','{\n                    \"Contract number\": \"contract_number\",\n                    \"Contract company name\": \"contract_company_name\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(162,11,'da','Ny faktura {contract_number} oprettet af {contract_company_name}.','{\n                    \"Contract number\": \"contract_number\",\n                    \"Contract company name\": \"contract_company_name\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(163,11,'de','Neue Rechnung {contract_number} erstellt von {contract_company_name}.','{\n                    \"Contract number\": \"contract_number\",\n                    \"Contract company name\": \"contract_company_name\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(164,11,'en','New Invoice {contract_number} created by {contract_company_name}.','{\n                    \"Contract number\": \"contract_number\",\n                    \"Contract company name\": \"contract_company_name\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(165,11,'es','Nueva factura {contract_number} creada por {contract_company_name}.','{\n                    \"Contract number\": \"contract_number\",\n                    \"Contract company name\": \"contract_company_name\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(166,11,'fr','Nouvelle facture {contract_number} créée par {contract_company_name}.','{\n                    \"Contract number\": \"contract_number\",\n                    \"Contract company name\": \"contract_company_name\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(167,11,'it','Nuova fattura {contract_number} creata da {contract_company_name}.','{\n                    \"Contract number\": \"contract_number\",\n                    \"Contract company name\": \"contract_company_name\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(168,11,'ja','{contract_company_name} によって作成された新しい請求書 {contract_number}。','{\n                    \"Contract number\": \"contract_number\",\n                    \"Contract company name\": \"contract_company_name\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(169,11,'nl','Nieuwe factuur {contract_number} gemaakt door {contract_company_name}.','{\n                    \"Contract number\": \"contract_number\",\n                    \"Contract company name\": \"contract_company_name\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(170,11,'pl','Nowa faktura {contract_number} utworzona przez firmę {contract_company_name}.','{\n                    \"Contract number\": \"contract_number\",\n                    \"Contract company name\": \"contract_company_name\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(171,11,'pt','Nova fatura {contract_number} criada por {contract_company_name}.','{\n                    \"Contract number\": \"contract_number\",\n                    \"Contract company name\": \"contract_company_name\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(172,11,'ru','Новый счет {contract_number}, созданный {contract_company_name}.','{\n                    \"Contract number\": \"contract_number\",\n                    \"Contract company name\": \"contract_company_name\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(173,11,'tr','Yeni fatura {contract_number} tarafından yaratıldı {contract_company_name}.','{\n                    \"Contract number\": \"contract_number\",\n                    \"Contract company name\": \"contract_company_name\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(174,11,'zh','新发票 {contract_number} 由...制作 {contract_company_name}.','{\n                    \"Contract number\": \"contract_number\",\n                    \"Contract company name\": \"contract_company_name\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(175,11,'he','חשבונית חדשה {contract_number} נוצר על ידי {contract_company_name}.','{\n                    \"Contract number\": \"contract_number\",\n                    \"Contract company name\": \"contract_company_name\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(176,11,'pt-br','Nova fatura {contract_number} criada por {contract_company_name}.','{\n                    \"Contract number\": \"contract_number\",\n                    \"Contract company name\": \"contract_company_name\"\n                  }',1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(177,1,'en','Payslip generated of {year}.','{\n                    \"Year\": \"year\"\n                  }',2,'2025-07-03 14:34:08','2025-07-03 14:34:08');
/*!40000 ALTER TABLE `notification_template_langs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_templates`
--

DROP TABLE IF EXISTS `notification_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_templates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_templates`
--

LOCK TABLES `notification_templates` WRITE;
/*!40000 ALTER TABLE `notification_templates` DISABLE KEYS */;
INSERT INTO `notification_templates` VALUES (1,'New Monthly Payslip','new_monthly_payslip','2025-02-06 06:40:27','2025-02-06 06:40:27'),(2,'New Announcement','new_announcement','2025-02-06 06:40:27','2025-02-06 06:40:27'),(3,'New Meeting','new_meeting','2025-02-06 06:40:27','2025-02-06 06:40:27'),(4,'New Award','new_award','2025-02-06 06:40:27','2025-02-06 06:40:27'),(5,'New Holidays','new_holidays','2025-02-06 06:40:27','2025-02-06 06:40:27'),(6,'New Company Policy','new_company_policy','2025-02-06 06:40:27','2025-02-06 06:40:27'),(7,'New Ticket','new_ticket','2025-02-06 06:40:27','2025-02-06 06:40:27'),(8,'New Event','new_event','2025-02-06 06:40:27','2025-02-06 06:40:27'),(9,'Leave Approve/Reject','leave_approve_reject','2025-02-06 06:40:27','2025-02-06 06:40:27'),(10,'New Trip','new_trip','2025-02-06 06:40:27','2025-02-06 06:40:27'),(11,'New Contract','contract_notification','2025-02-06 06:40:27','2025-02-06 06:40:27');
/*!40000 ALTER TABLE `notification_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_number` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_exp_month` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_exp_year` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plan_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plan_id` int NOT NULL,
  `price` double(15,2) NOT NULL,
  `price_currency` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `txn_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Manually',
  `receipt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `is_refund` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_order_id_unique` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `other_payments`
--

DROP TABLE IF EXISTS `other_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `other_payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(15,2) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `other_payments`
--

LOCK TABLES `other_payments` WRITE;
/*!40000 ALTER TABLE `other_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `other_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `overtimes`
--

DROP TABLE IF EXISTS `overtimes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `overtimes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number_of_days` int NOT NULL,
  `hours` int NOT NULL,
  `rate` double(15,2) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `overtimes`
--

LOCK TABLES `overtimes` WRITE;
/*!40000 ALTER TABLE `overtimes` DISABLE KEYS */;
/*!40000 ALTER TABLE `overtimes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_slips`
--

DROP TABLE IF EXISTS `pay_slips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pay_slips` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `net_payble` double(15,2) NOT NULL,
  `salary_month` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `basic_salary` double(15,2) NOT NULL,
  `allowance` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `commission` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `loan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `saturation_deduction` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `other_payment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `overtime` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_slips`
--

LOCK TABLES `pay_slips` WRITE;
/*!40000 ALTER TABLE `pay_slips` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_slips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payees`
--

DROP TABLE IF EXISTS `payees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payees` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `payee_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payees`
--

LOCK TABLES `payees` WRITE;
/*!40000 ALTER TABLE `payees` DISABLE KEYS */;
/*!40000 ALTER TABLE `payees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payers`
--

DROP TABLE IF EXISTS `payers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `payer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payers`
--

LOCK TABLES `payers` WRITE;
/*!40000 ALTER TABLE `payers` DISABLE KEYS */;
/*!40000 ALTER TABLE `payers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_types`
--

DROP TABLE IF EXISTS `payment_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_types`
--

LOCK TABLES `payment_types` WRITE;
/*!40000 ALTER TABLE `payment_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payslip_types`
--

DROP TABLE IF EXISTS `payslip_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payslip_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payslip_types`
--

LOCK TABLES `payslip_types` WRITE;
/*!40000 ALTER TABLE `payslip_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `payslip_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performance__types`
--

DROP TABLE IF EXISTS `performance__types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `performance__types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performance__types`
--

LOCK TABLES `performance__types` WRITE;
/*!40000 ALTER TABLE `performance__types` DISABLE KEYS */;
/*!40000 ALTER TABLE `performance__types` ENABLE KEYS */;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=617 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'Manage User','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(2,'Create User','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(3,'Edit User','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(4,'Delete User','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(5,'Manage Role','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(6,'Create Role','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(7,'Delete Role','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(8,'Edit Role','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(9,'Manage Award','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(10,'Create Award','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(11,'Delete Award','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(12,'Edit Award','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(13,'Manage Transfer','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(14,'Create Transfer','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(15,'Delete Transfer','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(16,'Edit Transfer','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(17,'Manage Resignation','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(18,'Create Resignation','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(19,'Edit Resignation','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(20,'Delete Resignation','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(21,'Manage Travel','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(22,'Create Travel','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(23,'Edit Travel','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(24,'Delete Travel','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(25,'Manage Promotion','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(26,'Create Promotion','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(27,'Edit Promotion','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(28,'Delete Promotion','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(29,'Manage Complaint','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(30,'Create Complaint','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(31,'Edit Complaint','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(32,'Delete Complaint','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(33,'Manage Warning','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(34,'Create Warning','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(35,'Edit Warning','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(36,'Delete Warning','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(37,'Manage Termination','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(38,'Create Termination','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(39,'Edit Termination','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(40,'Delete Termination','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(41,'Manage Department','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(42,'Create Department','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(43,'Edit Department','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(44,'Delete Department','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(45,'Manage Designation','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(46,'Create Designation','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(47,'Edit Designation','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(48,'Delete Designation','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(49,'Manage Document Type','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(50,'Create Document Type','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(51,'Edit Document Type','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(52,'Delete Document Type','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(53,'Manage Branch','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(54,'Create Branch','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(55,'Edit Branch','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(56,'Delete Branch','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(57,'Manage Award Type','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(58,'Create Award Type','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(59,'Edit Award Type','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(60,'Delete Award Type','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(61,'Manage Termination Type','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(62,'Create Termination Type','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(63,'Edit Termination Type','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(64,'Delete Termination Type','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(65,'Manage Employee','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(66,'Create Employee','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(67,'Edit Employee','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(68,'Delete Employee','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(69,'Show Employee','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(70,'Manage Payslip Type','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(71,'Create Payslip Type','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(72,'Edit Payslip Type','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(73,'Delete Payslip Type','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(74,'Manage Allowance Option','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(75,'Create Allowance Option','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(76,'Edit Allowance Option','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(77,'Delete Allowance Option','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(78,'Manage Loan Option','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(79,'Create Loan Option','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(80,'Edit Loan Option','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(81,'Delete Loan Option','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(82,'Manage Deduction Option','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(83,'Create Deduction Option','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(84,'Edit Deduction Option','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(85,'Delete Deduction Option','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(86,'Manage Set Salary','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(87,'Create Set Salary','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(88,'Edit Set Salary','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(89,'Delete Set Salary','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(90,'Manage Allowance','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(91,'Create Allowance','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(92,'Edit Allowance','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(93,'Delete Allowance','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(94,'Create Commission','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(95,'Create Loan','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(96,'Create Saturation Deduction','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(97,'Create Other Payment','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(98,'Create Overtime','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(99,'Edit Commission','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(100,'Delete Commission','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(101,'Edit Loan','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(102,'Delete Loan','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(103,'Edit Saturation Deduction','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(104,'Delete Saturation Deduction','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(105,'Edit Other Payment','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(106,'Delete Other Payment','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(107,'Edit Overtime','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(108,'Delete Overtime','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(109,'Manage Pay Slip','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(110,'Create Pay Slip','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(111,'Edit Pay Slip','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(112,'Delete Pay Slip','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(113,'Manage Account List','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(114,'Create Account List','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(115,'Edit Account List','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(116,'Delete Account List','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(117,'View Balance Account List','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(118,'Manage Payee','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(119,'Create Payee','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(120,'Edit Payee','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(121,'Delete Payee','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(122,'Manage Payer','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(123,'Create Payer','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(124,'Edit Payer','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(125,'Delete Payer','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(126,'Manage Expense Type','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(127,'Create Expense Type','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(128,'Edit Expense Type','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(129,'Delete Expense Type','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(130,'Manage Income Type','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(131,'Edit Income Type','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(132,'Delete Income Type','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(133,'Create Income Type','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(134,'Manage Payment Type','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(135,'Create Payment Type','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(136,'Edit Payment Type','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(137,'Delete Payment Type','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(138,'Manage Deposit','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(139,'Create Deposit','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(140,'Edit Deposit','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(141,'Delete Deposit','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(142,'Manage Expense','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(143,'Create Expense','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(144,'Edit Expense','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(145,'Delete Expense','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(146,'Manage Transfer Balance','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(147,'Create Transfer Balance','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(148,'Edit Transfer Balance','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(149,'Delete Transfer Balance','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(150,'Manage Event','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(151,'Create Event','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(152,'Edit Event','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(153,'Delete Event','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(154,'Manage Announcement','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(155,'Create Announcement','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(156,'Edit Announcement','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(157,'Delete Announcement','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(158,'Manage Leave Type','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(159,'Create Leave Type','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(160,'Edit Leave Type','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(161,'Delete Leave Type','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(162,'Manage Leave','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(163,'Create Leave','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(164,'Edit Leave','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(165,'Delete Leave','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(166,'Manage Meeting','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(167,'Create Meeting','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(168,'Edit Meeting','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(169,'Delete Meeting','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(170,'Manage Ticket','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(171,'Create Ticket','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(172,'Edit Ticket','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(173,'Delete Ticket','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(174,'Manage Attendance','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(175,'Create Attendance','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(176,'Edit Attendance','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(177,'Delete Attendance','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(178,'Manage Language','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(179,'Create Language','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(180,'Manage Plan','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(181,'Create Plan','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(182,'Edit Plan','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(183,'Buy Plan','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(184,'Manage System Settings','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(185,'Manage Company Settings','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(186,'Manage TimeSheet','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(187,'Create TimeSheet','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(188,'Edit TimeSheet','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(189,'Delete TimeSheet','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(190,'Manage Order','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(191,'manage coupon','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(192,'create coupon','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(193,'edit coupon','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(194,'delete coupon','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(195,'Manage Assets','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(196,'Create Assets','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(197,'Edit Assets','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(198,'Delete Assets','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(199,'Manage Document','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(200,'Create Document','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(201,'Edit Document','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(202,'Delete Document','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(203,'Manage Employee Profile','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(204,'Show Employee Profile','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(205,'Manage Employee Last Login','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(206,'Manage Indicator','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(207,'Create Indicator','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(208,'Edit Indicator','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(209,'Delete Indicator','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(210,'Show Indicator','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(211,'Manage Appraisal','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(212,'Create Appraisal','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(213,'Edit Appraisal','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(214,'Delete Appraisal','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(215,'Show Appraisal','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(216,'Manage Goal Type','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(217,'Create Goal Type','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(218,'Edit Goal Type','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(219,'Delete Goal Type','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(220,'Manage Goal Tracking','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(221,'Create Goal Tracking','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(222,'Edit Goal Tracking','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(223,'Delete Goal Tracking','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(224,'Manage Company Policy','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(225,'Create Company Policy','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(226,'Edit Company Policy','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(227,'Delete Company Policy','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(228,'Manage Trainer','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(229,'Create Trainer','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(230,'Edit Trainer','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(231,'Delete Trainer','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(232,'Show Trainer','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(233,'Manage Training','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(234,'Create Training','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(235,'Edit Training','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(236,'Delete Training','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(237,'Show Training','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(238,'Manage Training Type','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(239,'Create Training Type','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(240,'Edit Training Type','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(241,'Delete Training Type','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(242,'Manage Report','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(243,'Manage Holiday','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(244,'Create Holiday','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(245,'Edit Holiday','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(246,'Delete Holiday','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(247,'Manage Job Category','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(248,'Create Job Category','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(249,'Edit Job Category','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(250,'Delete Job Category','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(251,'Manage Job Stage','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(252,'Create Job Stage','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(253,'Edit Job Stage','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(254,'Delete Job Stage','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(255,'Manage Job','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(256,'Create Job','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(257,'Edit Job','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(258,'Delete Job','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(259,'Show Job','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(260,'Manage Job Application','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(261,'Create Job Application','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(262,'Edit Job Application','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(263,'Delete Job Application','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(264,'Show Job Application','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(265,'Move Job Application','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(266,'Add Job Application Note','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(267,'Delete Job Application Note','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(268,'Add Job Application Skill','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(269,'Manage Job OnBoard','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(270,'Manage Custom Question','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(271,'Create Custom Question','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(272,'Edit Custom Question','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(273,'Delete Custom Question','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(274,'Manage Interview Schedule','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(275,'Create Interview Schedule','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(276,'Edit Interview Schedule','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(277,'Delete Interview Schedule','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(278,'Manage Career','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(279,'Manage Competencies','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(280,'Create Competencies','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(281,'Edit Competencies','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(282,'Delete Competencies','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(283,'Manage Performance Type','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(284,'Create Performance Type','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(285,'Edit Performance Type','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(286,'Delete Performance Type','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(287,'Manage Contract Type','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(288,'Create Contract Type','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(289,'Edit Contract Type','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(290,'Delete Contract Type','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(291,'Manage Contract','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(292,'Create Contract','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(293,'Edit Contract','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(294,'Delete Contract','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(295,'Store Note','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(296,'Delete Note','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(297,'Store Comment','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(298,'Delete Comment','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(299,'Delete Attachment','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(300,'Create Webhook','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(301,'Edit Webhook','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(302,'Delete Webhook','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(303,'Manage Zoom meeting','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(304,'Create Zoom meeting','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(305,'Show Zoom meeting','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(306,'Delete Zoom meeting','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(307,'Manage Biometric Attendance','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(308,'Biometric Attendance Synchronize','web','2025-02-06 06:40:26','2025-02-06 06:40:26'),(309,'Manage User','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(310,'Create User','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(311,'Edit User','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(312,'Delete User','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(313,'Manage Role','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(314,'Create Role','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(315,'Delete Role','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(316,'Edit Role','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(317,'Manage Award','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(318,'Create Award','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(319,'Delete Award','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(320,'Edit Award','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(321,'Manage Transfer','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(322,'Create Transfer','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(323,'Delete Transfer','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(324,'Edit Transfer','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(325,'Manage Resignation','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(326,'Create Resignation','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(327,'Edit Resignation','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(328,'Delete Resignation','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(329,'Manage Travel','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(330,'Create Travel','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(331,'Edit Travel','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(332,'Delete Travel','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(333,'Manage Promotion','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(334,'Create Promotion','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(335,'Edit Promotion','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(336,'Delete Promotion','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(337,'Manage Complaint','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(338,'Create Complaint','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(339,'Edit Complaint','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(340,'Delete Complaint','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(341,'Manage Warning','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(342,'Create Warning','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(343,'Edit Warning','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(344,'Delete Warning','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(345,'Manage Termination','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(346,'Create Termination','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(347,'Edit Termination','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(348,'Delete Termination','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(349,'Manage Department','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(350,'Create Department','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(351,'Edit Department','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(352,'Delete Department','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(353,'Manage Designation','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(354,'Create Designation','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(355,'Edit Designation','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(356,'Delete Designation','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(357,'Manage Document Type','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(358,'Create Document Type','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(359,'Edit Document Type','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(360,'Delete Document Type','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(361,'Manage Branch','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(362,'Create Branch','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(363,'Edit Branch','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(364,'Delete Branch','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(365,'Manage Award Type','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(366,'Create Award Type','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(367,'Edit Award Type','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(368,'Delete Award Type','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(369,'Manage Termination Type','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(370,'Create Termination Type','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(371,'Edit Termination Type','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(372,'Delete Termination Type','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(373,'Manage Employee','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(374,'Create Employee','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(375,'Edit Employee','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(376,'Delete Employee','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(377,'Show Employee','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(378,'Manage Payslip Type','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(379,'Create Payslip Type','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(380,'Edit Payslip Type','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(381,'Delete Payslip Type','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(382,'Manage Allowance Option','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(383,'Create Allowance Option','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(384,'Edit Allowance Option','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(385,'Delete Allowance Option','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(386,'Manage Loan Option','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(387,'Create Loan Option','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(388,'Edit Loan Option','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(389,'Delete Loan Option','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(390,'Manage Deduction Option','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(391,'Create Deduction Option','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(392,'Edit Deduction Option','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(393,'Delete Deduction Option','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(394,'Manage Set Salary','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(395,'Create Set Salary','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(396,'Edit Set Salary','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(397,'Delete Set Salary','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(398,'Manage Allowance','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(399,'Create Allowance','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(400,'Edit Allowance','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(401,'Delete Allowance','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(402,'Create Commission','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(403,'Create Loan','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(404,'Create Saturation Deduction','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(405,'Create Other Payment','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(406,'Create Overtime','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(407,'Edit Commission','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(408,'Delete Commission','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(409,'Edit Loan','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(410,'Delete Loan','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(411,'Edit Saturation Deduction','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(412,'Delete Saturation Deduction','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(413,'Edit Other Payment','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(414,'Delete Other Payment','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(415,'Edit Overtime','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(416,'Delete Overtime','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(417,'Manage Pay Slip','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(418,'Create Pay Slip','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(419,'Edit Pay Slip','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(420,'Delete Pay Slip','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(421,'Manage Account List','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(422,'Create Account List','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(423,'Edit Account List','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(424,'Delete Account List','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(425,'View Balance Account List','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(426,'Manage Payee','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(427,'Create Payee','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(428,'Edit Payee','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(429,'Delete Payee','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(430,'Manage Payer','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(431,'Create Payer','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(432,'Edit Payer','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(433,'Delete Payer','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(434,'Manage Expense Type','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(435,'Create Expense Type','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(436,'Edit Expense Type','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(437,'Delete Expense Type','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(438,'Manage Income Type','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(439,'Edit Income Type','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(440,'Delete Income Type','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(441,'Create Income Type','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(442,'Manage Payment Type','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(443,'Create Payment Type','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(444,'Edit Payment Type','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(445,'Delete Payment Type','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(446,'Manage Deposit','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(447,'Create Deposit','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(448,'Edit Deposit','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(449,'Delete Deposit','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(450,'Manage Expense','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(451,'Create Expense','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(452,'Edit Expense','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(453,'Delete Expense','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(454,'Manage Transfer Balance','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(455,'Create Transfer Balance','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(456,'Edit Transfer Balance','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(457,'Delete Transfer Balance','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(458,'Manage Event','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(459,'Create Event','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(460,'Edit Event','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(461,'Delete Event','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(462,'Manage Announcement','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(463,'Create Announcement','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(464,'Edit Announcement','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(465,'Delete Announcement','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(466,'Manage Leave Type','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(467,'Create Leave Type','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(468,'Edit Leave Type','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(469,'Delete Leave Type','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(470,'Manage Leave','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(471,'Create Leave','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(472,'Edit Leave','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(473,'Delete Leave','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(474,'Manage Meeting','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(475,'Create Meeting','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(476,'Edit Meeting','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(477,'Delete Meeting','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(478,'Manage Ticket','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(479,'Create Ticket','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(480,'Edit Ticket','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(481,'Delete Ticket','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(482,'Manage Attendance','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(483,'Create Attendance','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(484,'Edit Attendance','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(485,'Delete Attendance','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(486,'Manage Language','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(487,'Create Language','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(488,'Manage Plan','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(489,'Create Plan','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(490,'Edit Plan','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(491,'Buy Plan','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(492,'Manage System Settings','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(493,'Manage Company Settings','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(494,'Manage TimeSheet','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(495,'Create TimeSheet','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(496,'Edit TimeSheet','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(497,'Delete TimeSheet','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(498,'Manage Order','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(499,'manage coupon','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(500,'create coupon','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(501,'edit coupon','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(502,'delete coupon','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(503,'Manage Assets','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(504,'Create Assets','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(505,'Edit Assets','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(506,'Delete Assets','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(507,'Manage Document','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(508,'Create Document','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(509,'Edit Document','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(510,'Delete Document','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(511,'Manage Employee Profile','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(512,'Show Employee Profile','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(513,'Manage Employee Last Login','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(514,'Manage Indicator','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(515,'Create Indicator','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(516,'Edit Indicator','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(517,'Delete Indicator','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(518,'Show Indicator','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(519,'Manage Appraisal','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(520,'Create Appraisal','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(521,'Edit Appraisal','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(522,'Delete Appraisal','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(523,'Show Appraisal','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(524,'Manage Goal Type','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(525,'Create Goal Type','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(526,'Edit Goal Type','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(527,'Delete Goal Type','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(528,'Manage Goal Tracking','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(529,'Create Goal Tracking','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(530,'Edit Goal Tracking','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(531,'Delete Goal Tracking','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(532,'Manage Company Policy','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(533,'Create Company Policy','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(534,'Edit Company Policy','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(535,'Delete Company Policy','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(536,'Manage Trainer','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(537,'Create Trainer','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(538,'Edit Trainer','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(539,'Delete Trainer','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(540,'Show Trainer','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(541,'Manage Training','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(542,'Create Training','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(543,'Edit Training','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(544,'Delete Training','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(545,'Show Training','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(546,'Manage Training Type','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(547,'Create Training Type','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(548,'Edit Training Type','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(549,'Delete Training Type','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(550,'Manage Report','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(551,'Manage Holiday','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(552,'Create Holiday','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(553,'Edit Holiday','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(554,'Delete Holiday','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(555,'Manage Job Category','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(556,'Create Job Category','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(557,'Edit Job Category','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(558,'Delete Job Category','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(559,'Manage Job Stage','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(560,'Create Job Stage','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(561,'Edit Job Stage','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(562,'Delete Job Stage','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(563,'Manage Job','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(564,'Create Job','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(565,'Edit Job','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(566,'Delete Job','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(567,'Show Job','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(568,'Manage Job Application','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(569,'Create Job Application','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(570,'Edit Job Application','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(571,'Delete Job Application','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(572,'Show Job Application','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(573,'Move Job Application','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(574,'Add Job Application Note','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(575,'Delete Job Application Note','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(576,'Add Job Application Skill','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(577,'Manage Job OnBoard','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(578,'Manage Custom Question','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(579,'Create Custom Question','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(580,'Edit Custom Question','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(581,'Delete Custom Question','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(582,'Manage Interview Schedule','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(583,'Create Interview Schedule','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(584,'Edit Interview Schedule','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(585,'Delete Interview Schedule','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(586,'Manage Career','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(587,'Manage Competencies','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(588,'Create Competencies','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(589,'Edit Competencies','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(590,'Delete Competencies','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(591,'Manage Performance Type','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(592,'Create Performance Type','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(593,'Edit Performance Type','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(594,'Delete Performance Type','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(595,'Manage Contract Type','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(596,'Create Contract Type','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(597,'Edit Contract Type','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(598,'Delete Contract Type','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(599,'Manage Contract','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(600,'Create Contract','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(601,'Edit Contract','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(602,'Delete Contract','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(603,'Store Note','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(604,'Delete Note','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(605,'Store Comment','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(606,'Delete Comment','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(607,'Delete Attachment','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(608,'Create Webhook','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(609,'Edit Webhook','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(610,'Delete Webhook','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(611,'Manage Zoom meeting','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(612,'Create Zoom meeting','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(613,'Show Zoom meeting','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(614,'Delete Zoom meeting','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(615,'Manage Biometric Attendance','web','2025-03-28 18:37:19','2025-03-28 18:37:19'),(616,'Biometric Attendance Synchronize','web','2025-03-28 18:37:19','2025-03-28 18:37:19');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_requests`
--

DROP TABLE IF EXISTS `plan_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_requests` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `plan_id` int NOT NULL,
  `duration` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'monthly',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_requests`
--

LOCK TABLES `plan_requests` WRITE;
/*!40000 ALTER TABLE `plan_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plans`
--

DROP TABLE IF EXISTS `plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(30,2) DEFAULT '0.00',
  `duration` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_users` int NOT NULL DEFAULT '0',
  `max_employees` int NOT NULL DEFAULT '0',
  `storage_limit` float NOT NULL DEFAULT '0',
  `enable_chatgpt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial` int NOT NULL DEFAULT '0',
  `trial_days` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_disable` int NOT NULL DEFAULT '1',
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plans_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plans`
--

LOCK TABLES `plans` WRITE;
/*!40000 ALTER TABLE `plans` DISABLE KEYS */;
INSERT INTO `plans` VALUES (1,'Free Plan',0.00,'Lifetime',4,5,1024,'on',0,NULL,1,NULL,'free_plan.png','2025-02-06 06:40:27','2025-02-06 06:40:27');
/*!40000 ALTER TABLE `plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `project_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_startdate` date NOT NULL,
  `project_enddate` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `assigned_data` longtext COLLATE utf8mb4_unicode_ci,
  `created_by` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'EERA','baner','2025-07-10',NULL,'2025-07-04 02:32:48','2025-07-04 02:32:48','[{\"department_id\":\"1\",\"employee_ids\":[\"1\",\"2\"]}]',2);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions`
--

DROP TABLE IF EXISTS `promotions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `designation_id` int NOT NULL,
  `promotion_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `promotion_date` date NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions`
--

LOCK TABLES `promotions` WRITE;
/*!40000 ALTER TABLE `promotions` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referral_settings`
--

DROP TABLE IF EXISTS `referral_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referral_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `percentage` int NOT NULL,
  `minimum_threshold_amount` int NOT NULL,
  `is_enable` int NOT NULL DEFAULT '0',
  `guideline` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referral_settings`
--

LOCK TABLES `referral_settings` WRITE;
/*!40000 ALTER TABLE `referral_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `referral_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referral_transactions`
--

DROP TABLE IF EXISTS `referral_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referral_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `plan_id` int NOT NULL,
  `plan_price` decimal(15,2) NOT NULL DEFAULT '0.00',
  `commission` int NOT NULL,
  `referral_code` int NOT NULL DEFAULT '0',
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referral_transactions`
--

LOCK TABLES `referral_transactions` WRITE;
/*!40000 ALTER TABLE `referral_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `referral_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resignations`
--

DROP TABLE IF EXISTS `resignations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resignations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `notice_date` date NOT NULL,
  `resignation_date` date NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resignations`
--

LOCK TABLES `resignations` WRITE;
/*!40000 ALTER TABLE `resignations` DISABLE KEYS */;
/*!40000 ALTER TABLE `resignations` ENABLE KEYS */;
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
INSERT INTO `role_has_permissions` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(178,1),(179,1),(180,1),(181,1),(182,1),(184,1),(190,1),(191,1),(192,1),(193,1),(194,1),(1,2),(2,2),(3,2),(4,2),(5,2),(6,2),(7,2),(8,2),(9,2),(10,2),(11,2),(12,2),(13,2),(14,2),(15,2),(16,2),(17,2),(18,2),(19,2),(20,2),(21,2),(22,2),(23,2),(24,2),(25,2),(26,2),(27,2),(28,2),(29,2),(30,2),(31,2),(32,2),(33,2),(34,2),(35,2),(36,2),(37,2),(38,2),(39,2),(40,2),(41,2),(42,2),(43,2),(44,2),(45,2),(46,2),(47,2),(48,2),(49,2),(50,2),(51,2),(52,2),(53,2),(54,2),(55,2),(56,2),(57,2),(58,2),(59,2),(60,2),(61,2),(62,2),(63,2),(64,2),(65,2),(66,2),(67,2),(68,2),(69,2),(70,2),(71,2),(72,2),(73,2),(74,2),(75,2),(76,2),(77,2),(78,2),(79,2),(80,2),(81,2),(82,2),(83,2),(84,2),(85,2),(86,2),(87,2),(88,2),(89,2),(90,2),(91,2),(92,2),(93,2),(94,2),(95,2),(96,2),(97,2),(98,2),(99,2),(100,2),(101,2),(102,2),(103,2),(104,2),(105,2),(106,2),(107,2),(108,2),(109,2),(110,2),(111,2),(112,2),(113,2),(114,2),(115,2),(116,2),(117,2),(118,2),(119,2),(120,2),(121,2),(122,2),(123,2),(124,2),(125,2),(126,2),(127,2),(128,2),(129,2),(130,2),(131,2),(132,2),(133,2),(134,2),(135,2),(136,2),(137,2),(138,2),(139,2),(140,2),(141,2),(142,2),(143,2),(144,2),(145,2),(146,2),(147,2),(148,2),(149,2),(150,2),(151,2),(152,2),(153,2),(154,2),(155,2),(156,2),(157,2),(158,2),(159,2),(160,2),(161,2),(162,2),(163,2),(164,2),(165,2),(166,2),(167,2),(168,2),(169,2),(170,2),(171,2),(172,2),(173,2),(174,2),(175,2),(176,2),(177,2),(178,2),(180,2),(183,2),(185,2),(186,2),(187,2),(188,2),(189,2),(190,2),(195,2),(196,2),(197,2),(198,2),(199,2),(200,2),(201,2),(202,2),(203,2),(204,2),(205,2),(206,2),(207,2),(208,2),(209,2),(210,2),(211,2),(212,2),(213,2),(214,2),(215,2),(216,2),(217,2),(218,2),(219,2),(220,2),(221,2),(222,2),(223,2),(224,2),(225,2),(226,2),(227,2),(228,2),(229,2),(230,2),(231,2),(232,2),(233,2),(234,2),(235,2),(236,2),(237,2),(238,2),(239,2),(240,2),(241,2),(242,2),(243,2),(244,2),(245,2),(246,2),(247,2),(248,2),(249,2),(250,2),(251,2),(252,2),(253,2),(254,2),(255,2),(256,2),(257,2),(258,2),(259,2),(260,2),(261,2),(262,2),(263,2),(264,2),(265,2),(266,2),(267,2),(268,2),(269,2),(270,2),(271,2),(272,2),(273,2),(274,2),(275,2),(276,2),(277,2),(278,2),(279,2),(280,2),(281,2),(282,2),(283,2),(284,2),(285,2),(286,2),(287,2),(288,2),(289,2),(290,2),(291,2),(292,2),(293,2),(294,2),(295,2),(296,2),(297,2),(298,2),(299,2),(300,2),(301,2),(302,2),(303,2),(304,2),(305,2),(306,2),(307,2),(308,2),(1,3),(2,3),(3,3),(4,3),(9,3),(10,3),(11,3),(12,3),(13,3),(14,3),(15,3),(16,3),(17,3),(18,3),(19,3),(20,3),(21,3),(22,3),(23,3),(24,3),(25,3),(26,3),(27,3),(28,3),(29,3),(30,3),(31,3),(32,3),(33,3),(34,3),(35,3),(36,3),(37,3),(38,3),(39,3),(40,3),(41,3),(42,3),(43,3),(44,3),(45,3),(46,3),(47,3),(48,3),(49,3),(50,3),(51,3),(52,3),(53,3),(54,3),(55,3),(56,3),(57,3),(58,3),(59,3),(60,3),(61,3),(62,3),(63,3),(64,3),(65,3),(66,3),(67,3),(68,3),(69,3),(70,3),(71,3),(72,3),(73,3),(74,3),(75,3),(76,3),(77,3),(78,3),(79,3),(80,3),(81,3),(82,3),(83,3),(84,3),(85,3),(86,3),(87,3),(88,3),(89,3),(90,3),(91,3),(92,3),(93,3),(94,3),(95,3),(96,3),(97,3),(98,3),(99,3),(100,3),(101,3),(102,3),(103,3),(104,3),(105,3),(106,3),(107,3),(108,3),(109,3),(110,3),(111,3),(112,3),(150,3),(151,3),(152,3),(153,3),(154,3),(155,3),(156,3),(157,3),(158,3),(159,3),(160,3),(161,3),(162,3),(163,3),(164,3),(165,3),(166,3),(167,3),(168,3),(169,3),(170,3),(171,3),(172,3),(173,3),(174,3),(175,3),(176,3),(177,3),(178,3),(186,3),(187,3),(188,3),(189,3),(195,3),(196,3),(197,3),(198,3),(199,3),(203,3),(204,3),(205,3),(206,3),(207,3),(208,3),(209,3),(210,3),(211,3),(212,3),(213,3),(214,3),(215,3),(216,3),(217,3),(218,3),(219,3),(220,3),(221,3),(222,3),(223,3),(224,3),(225,3),(226,3),(227,3),(228,3),(229,3),(230,3),(231,3),(232,3),(233,3),(234,3),(235,3),(236,3),(237,3),(238,3),(239,3),(240,3),(241,3),(243,3),(244,3),(245,3),(246,3),(247,3),(248,3),(249,3),(250,3),(251,3),(252,3),(253,3),(254,3),(255,3),(256,3),(257,3),(258,3),(259,3),(260,3),(261,3),(262,3),(263,3),(264,3),(265,3),(266,3),(267,3),(268,3),(269,3),(270,3),(271,3),(272,3),(273,3),(274,3),(275,3),(276,3),(277,3),(278,3),(283,3),(284,3),(285,3),(286,3),(287,3),(288,3),(289,3),(290,3),(291,3),(292,3),(293,3),(294,3),(295,3),(296,3),(297,3),(298,3),(299,3),(303,3),(305,3),(307,3),(308,3),(9,4),(13,4),(17,4),(18,4),(19,4),(20,4),(21,4),(25,4),(29,4),(30,4),(31,4),(32,4),(33,4),(34,4),(35,4),(36,4),(37,4),(65,4),(67,4),(69,4),(90,4),(150,4),(154,4),(162,4),(163,4),(164,4),(165,4),(166,4),(170,4),(171,4),(172,4),(173,4),(174,4),(178,4),(186,4),(187,4),(188,4),(189,4),(199,4),(243,4),(278,4),(291,4),(295,4),(296,4),(297,4),(298,4),(299,4),(303,4),(305,4),(1,5),(2,5),(3,5),(4,5),(9,5),(10,5),(11,5),(12,5),(13,5),(14,5),(15,5),(16,5),(17,5),(18,5),(19,5),(20,5),(21,5),(22,5),(23,5),(24,5),(25,5),(26,5),(27,5),(28,5),(29,5),(30,5),(31,5),(32,5),(33,5),(34,5),(35,5),(36,5),(37,5),(38,5),(39,5),(40,5),(41,5),(42,5),(43,5),(44,5),(45,5),(46,5),(47,5),(48,5),(49,5),(50,5),(51,5),(52,5),(53,5),(54,5),(55,5),(56,5),(57,5),(58,5),(59,5),(60,5),(61,5),(62,5),(63,5),(64,5),(65,5),(66,5),(67,5),(68,5),(69,5),(70,5),(71,5),(72,5),(73,5),(74,5),(75,5),(76,5),(77,5),(78,5),(79,5),(80,5),(81,5),(82,5),(83,5),(84,5),(85,5),(86,5),(87,5),(88,5),(89,5),(90,5),(91,5),(92,5),(93,5),(94,5),(95,5),(96,5),(97,5),(98,5),(99,5),(100,5),(101,5),(102,5),(103,5),(104,5),(105,5),(106,5),(107,5),(108,5),(109,5),(110,5),(111,5),(112,5),(150,5),(151,5),(152,5),(153,5),(154,5),(155,5),(156,5),(157,5),(158,5),(159,5),(160,5),(161,5),(162,5),(163,5),(164,5),(165,5),(166,5),(167,5),(168,5),(169,5),(170,5),(171,5),(172,5),(173,5),(174,5),(175,5),(176,5),(177,5),(178,5),(186,5),(187,5),(188,5),(189,5),(195,5),(196,5),(197,5),(198,5),(199,5),(203,5),(204,5),(205,5),(206,5),(207,5),(208,5),(209,5),(210,5),(211,5),(212,5),(213,5),(214,5),(215,5),(216,5),(217,5),(218,5),(219,5),(220,5),(221,5),(222,5),(223,5),(224,5),(225,5),(226,5),(227,5),(228,5),(229,5),(230,5),(231,5),(232,5),(233,5),(234,5),(235,5),(236,5),(237,5),(238,5),(239,5),(240,5),(241,5),(243,5),(244,5),(245,5),(246,5),(247,5),(248,5),(249,5),(250,5),(251,5),(252,5),(253,5),(254,5),(255,5),(256,5),(257,5),(258,5),(259,5),(260,5),(261,5),(262,5),(263,5),(264,5),(265,5),(266,5),(267,5),(268,5),(269,5),(270,5),(271,5),(272,5),(273,5),(274,5),(275,5),(276,5),(277,5),(278,5),(283,5),(284,5),(285,5),(286,5),(287,5),(288,5),(289,5),(290,5),(291,5),(292,5),(293,5),(294,5),(295,5),(296,5),(297,5),(298,5),(299,5),(9,6),(13,6),(17,6),(18,6),(19,6),(20,6),(21,6),(25,6),(29,6),(30,6),(31,6),(32,6),(33,6),(34,6),(35,6),(36,6),(37,6),(65,6),(67,6),(69,6),(90,6),(150,6),(154,6),(162,6),(163,6),(164,6),(165,6),(166,6),(170,6),(171,6),(172,6),(173,6),(174,6),(178,6),(186,6),(187,6),(188,6),(189,6),(199,6),(243,6),(278,6),(291,6),(295,6),(296,6),(297,6),(298,6),(299,6);
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
  `created_by` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'super admin','web',0,'2025-02-06 06:40:26','2025-02-06 06:40:26'),(2,'company','web',1,'2025-02-06 06:40:26','2025-02-06 06:40:26'),(3,'hr','web',2,'2025-02-06 06:40:26','2025-02-06 06:40:26'),(4,'employee','web',2,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(5,'hr','web',4,'2025-02-06 06:42:36','2025-02-06 06:42:36'),(6,'employee','web',4,'2025-02-06 06:42:37','2025-02-06 06:42:37');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saturation_deductions`
--

DROP TABLE IF EXISTS `saturation_deductions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saturation_deductions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `deduction_option` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(15,2) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saturation_deductions`
--

LOCK TABLES `saturation_deductions` WRITE;
/*!40000 ALTER TABLE `saturation_deductions` DISABLE KEYS */;
/*!40000 ALTER TABLE `saturation_deductions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `set_salaries`
--

DROP TABLE IF EXISTS `set_salaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `set_salaries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `set_salaries`
--

LOCK TABLES `set_salaries` WRITE;
/*!40000 ALTER TABLE `set_salaries` DISABLE KEYS */;
/*!40000 ALTER TABLE `set_salaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_name_created_by_unique` (`name`,`created_by`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'company_logo','2_dark_logo.png',2,NULL,NULL),(2,'default_language','en',2,NULL,NULL),(3,'theme_color','#ea3538',2,NULL,NULL),(4,'color_flag','true',2,NULL,NULL),(5,'cust_theme_bg','on',2,NULL,NULL),(6,'cust_darklayout','off',2,NULL,NULL),(7,'SITE_RTL','off',2,NULL,NULL),(8,'company_favicon','2_favicon.png',2,NULL,NULL),(21,'company_name','Rising Spaces',2,NULL,NULL),(22,'company_address','Pune',2,NULL,NULL),(23,'company_city','Pune',2,NULL,NULL),(24,'company_state','Maharashtra',2,NULL,NULL),(25,'company_zipcode','411057',2,NULL,NULL),(26,'company_country','India',2,NULL,NULL),(27,'company_telephone','9136211332',2,NULL,NULL),(28,'company_start_time','10:00',2,NULL,NULL),(29,'company_end_time','18:00',2,NULL,NULL),(30,'timezone','Asia/Calcutta',2,NULL,NULL),(31,'ip_restrict','off',2,NULL,NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template`
--

DROP TABLE IF EXISTS `template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `template` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `template_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prompt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `module` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_json` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_tone` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template`
--

LOCK TABLES `template` WRITE;
/*!40000 ALTER TABLE `template` DISABLE KEYS */;
/*!40000 ALTER TABLE `template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `termination_types`
--

DROP TABLE IF EXISTS `termination_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `termination_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `termination_types`
--

LOCK TABLES `termination_types` WRITE;
/*!40000 ALTER TABLE `termination_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `termination_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terminations`
--

DROP TABLE IF EXISTS `terminations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terminations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `notice_date` date NOT NULL,
  `termination_date` date NOT NULL,
  `termination_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terminations`
--

LOCK TABLES `terminations` WRITE;
/*!40000 ALTER TABLE `terminations` DISABLE KEYS */;
/*!40000 ALTER TABLE `terminations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_replies`
--

DROP TABLE IF EXISTS `ticket_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_replies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int NOT NULL,
  `is_read` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_replies`
--

LOCK TABLES `ticket_replies` WRITE;
/*!40000 ALTER TABLE `ticket_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_id` int NOT NULL,
  `priority` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_date` date NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ticket_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ticket_created` int NOT NULL DEFAULT '0',
  `created_by` int NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_sheets`
--

DROP TABLE IF EXISTS `time_sheets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_sheets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL DEFAULT '0',
  `date` date NOT NULL,
  `hours` double(8,2) NOT NULL DEFAULT '0.00',
  `remark` text COLLATE utf8mb4_unicode_ci,
  `created_by` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_sheets`
--

LOCK TABLES `time_sheets` WRITE;
/*!40000 ALTER TABLE `time_sheets` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_sheets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `to_do_lists`
--

DROP TABLE IF EXISTS `to_do_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `to_do_lists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `task` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_completed` tinyint(1) NOT NULL DEFAULT '0',
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `to_do_lists_user_id_foreign` (`user_id`),
  CONSTRAINT `to_do_lists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `to_do_lists`
--

LOCK TABLES `to_do_lists` WRITE;
/*!40000 ALTER TABLE `to_do_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `to_do_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainers`
--

DROP TABLE IF EXISTS `trainers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `expertise` text COLLATE utf8mb4_unicode_ci,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainers`
--

LOCK TABLES `trainers` WRITE;
/*!40000 ALTER TABLE `trainers` DISABLE KEYS */;
/*!40000 ALTER TABLE `trainers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training_types`
--

DROP TABLE IF EXISTS `training_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `training_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training_types`
--

LOCK TABLES `training_types` WRITE;
/*!40000 ALTER TABLE `training_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `training_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainings`
--

DROP TABLE IF EXISTS `trainings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch` int NOT NULL,
  `trainer_option` int NOT NULL,
  `training_type` int NOT NULL,
  `trainer` int NOT NULL,
  `training_cost` double(15,2) NOT NULL DEFAULT '0.00',
  `employee` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `performance` int NOT NULL DEFAULT '0',
  `status` int NOT NULL DEFAULT '0',
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainings`
--

LOCK TABLES `trainings` WRITE;
/*!40000 ALTER TABLE `trainings` DISABLE KEYS */;
/*!40000 ALTER TABLE `trainings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_orders`
--

DROP TABLE IF EXISTS `transaction_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `req_amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `req_user_id` int NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `date` date DEFAULT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_orders`
--

LOCK TABLES `transaction_orders` WRITE;
/*!40000 ALTER TABLE `transaction_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfer_balances`
--

DROP TABLE IF EXISTS `transfer_balances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transfer_balances` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `from_account_id` int NOT NULL,
  `to_account_id` int NOT NULL,
  `date` date NOT NULL,
  `amount` double(15,2) NOT NULL,
  `payment_type_id` int NOT NULL,
  `referal_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfer_balances`
--

LOCK TABLES `transfer_balances` WRITE;
/*!40000 ALTER TABLE `transfer_balances` DISABLE KEYS */;
/*!40000 ALTER TABLE `transfer_balances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfers`
--

DROP TABLE IF EXISTS `transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transfers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `branch_id` int NOT NULL,
  `department_id` int NOT NULL,
  `transfer_date` date NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfers`
--

LOCK TABLES `transfers` WRITE;
/*!40000 ALTER TABLE `transfers` DISABLE KEYS */;
/*!40000 ALTER TABLE `transfers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travels`
--

DROP TABLE IF EXISTS `travels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `travels` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `purpose_of_visit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `place_of_visit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travels`
--

LOCK TABLES `travels` WRITE;
/*!40000 ALTER TABLE `travels` DISABLE KEYS */;
/*!40000 ALTER TABLE `travels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `units` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_size` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_id` bigint unsigned NOT NULL,
  `is_approved` tinyint NOT NULL DEFAULT '0',
  `remark` text COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `units`
--

LOCK TABLES `units` WRITE;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
/*!40000 ALTER TABLE `units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_coupons`
--

DROP TABLE IF EXISTS `user_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_coupons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user` int NOT NULL,
  `coupon` int NOT NULL,
  `order` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_coupons`
--

LOCK TABLES `user_coupons` WRITE;
/*!40000 ALTER TABLE `user_coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_email_templates`
--

DROP TABLE IF EXISTS `user_email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_email_templates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `template_id` int NOT NULL,
  `user_id` int NOT NULL,
  `is_active` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_email_templates`
--

LOCK TABLES `user_email_templates` WRITE;
/*!40000 ALTER TABLE `user_email_templates` DISABLE KEYS */;
INSERT INTO `user_email_templates` VALUES (1,1,2,1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(2,2,2,1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(3,3,2,1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(4,4,2,1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(5,5,2,1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(6,6,2,1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(7,7,2,1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(8,8,2,1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(9,9,2,1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(10,10,2,1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(11,11,2,1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(12,12,2,1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(13,13,2,1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(14,14,2,1,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(15,1,2,0,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(16,2,2,0,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(17,3,2,0,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(18,4,2,0,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(19,5,2,0,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(20,6,2,0,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(21,7,2,0,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(22,8,2,0,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(23,9,2,0,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(24,10,2,0,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(25,11,2,0,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(26,12,2,0,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(27,13,2,0,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(28,14,2,0,'2025-02-06 06:40:27','2025-02-06 06:40:27'),(29,1,2,1,'2025-02-06 06:42:36','2025-02-06 06:42:36'),(30,2,2,1,'2025-02-06 06:42:36','2025-02-06 06:42:36'),(31,3,2,1,'2025-02-06 06:42:36','2025-02-06 06:42:36'),(32,4,2,1,'2025-02-06 06:42:36','2025-02-06 06:42:36'),(33,5,2,1,'2025-02-06 06:42:36','2025-02-06 06:42:36'),(34,6,2,1,'2025-02-06 06:42:36','2025-02-06 06:42:36'),(35,7,2,1,'2025-02-06 06:42:36','2025-02-06 06:42:36'),(36,8,2,1,'2025-02-06 06:42:36','2025-02-06 06:42:36'),(37,9,2,1,'2025-02-06 06:42:36','2025-02-06 06:42:36'),(38,10,2,1,'2025-02-06 06:42:36','2025-02-06 06:42:36'),(39,11,2,1,'2025-02-06 06:42:36','2025-02-06 06:42:36'),(40,12,2,1,'2025-02-06 06:42:36','2025-02-06 06:42:36'),(41,13,2,1,'2025-02-06 06:42:36','2025-02-06 06:42:36'),(42,14,2,1,'2025-02-06 06:42:36','2025-02-06 06:42:36'),(43,1,4,0,'2025-02-06 06:42:36','2025-02-06 06:42:36'),(44,2,4,0,'2025-02-06 06:42:36','2025-02-06 06:42:36'),(45,3,4,0,'2025-02-06 06:42:36','2025-02-06 06:42:36'),(46,4,4,0,'2025-02-06 06:42:36','2025-02-06 06:42:36'),(47,5,4,0,'2025-02-06 06:42:36','2025-02-06 06:42:36'),(48,6,4,0,'2025-02-06 06:42:36','2025-02-06 06:42:36'),(49,7,4,0,'2025-02-06 06:42:36','2025-02-06 06:42:36'),(50,8,4,0,'2025-02-06 06:42:36','2025-02-06 06:42:36'),(51,9,4,0,'2025-02-06 06:42:36','2025-02-06 06:42:36'),(52,10,4,0,'2025-02-06 06:42:36','2025-02-06 06:42:36'),(53,11,4,0,'2025-02-06 06:42:36','2025-02-06 06:42:36'),(54,12,4,0,'2025-02-06 06:42:36','2025-02-06 06:42:36'),(55,13,4,0,'2025-02-06 06:42:36','2025-02-06 06:42:36'),(56,14,4,0,'2025-02-06 06:42:36','2025-02-06 06:42:36');
/*!40000 ALTER TABLE `user_email_templates` ENABLE KEYS */;
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
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'avatar.png',
  `lang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plan` int DEFAULT NULL,
  `plan_expire_date` date DEFAULT NULL,
  `requested_plan` int NOT NULL DEFAULT '0',
  `trial_expire_date` date DEFAULT NULL,
  `trial_plan` int NOT NULL DEFAULT '0',
  `is_login_enable` int NOT NULL DEFAULT '1',
  `storage_limit` double(20,2) NOT NULL DEFAULT '0.00',
  `last_login` timestamp NULL DEFAULT NULL,
  `is_active` int NOT NULL DEFAULT '1',
  `referral_code` int NOT NULL DEFAULT '0',
  `used_referral_code` int NOT NULL DEFAULT '0',
  `commission_amount` int NOT NULL DEFAULT '0',
  `active_status` tinyint(1) NOT NULL DEFAULT '0',
  `is_disable` int NOT NULL DEFAULT '1',
  `dark_mode` tinyint(1) NOT NULL DEFAULT '0',
  `messenger_color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#2180f3',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Adarsh','connect360.software@gmail.com','2025-07-03 06:16:41','$2y$10$rA.kZy6sEO/Cv1gtQDz1PO61FKO32NS6DtA7x52R7sY2DhGcLvuFi','super admin','avatar.png','en',NULL,NULL,0,NULL,0,1,0.00,NULL,1,0,0,0,0,1,0,'#2180f3','0',NULL,'2025-07-03 06:16:41','2025-07-03 06:16:41'),(2,'Rising','info@risingspaces.in','2025-07-04 00:49:47','$2y$10$QPaZ082ADUqs0SAyWe13x.Br.WrZ1MRJU4I..DBpI5cJmnOl8Nyea','company','avatar.png','en',1,NULL,0,NULL,0,1,0.00,NULL,1,480626,0,0,0,1,0,'#2180f3','1',NULL,'2025-07-04 00:49:47','2025-07-04 00:49:59'),(3,'Adarsh Sanjivan Waghmare','adarsh123@gmail.com','2025-07-04 07:38:13','$2y$10$44lvC2oUS3oc6EGo7HpE1O9qBJfNnKRTw7GySupJ3SxC2vaMNlI4C','employee','avatar.png','',NULL,NULL,0,NULL,0,1,0.00,NULL,1,0,0,0,0,1,0,'#2180f3','2',NULL,'2025-07-04 07:38:13','2025-07-04 07:38:13'),(4,'Prasad','prasad123@gmail.com','2025-07-04 07:48:25','$2y$10$uWrWJvhJ1XQpQLzPJynycuih45.knHmTTYD38MtVImCZ4TUxZF6UW','hr','avatar.png','en',NULL,NULL,0,NULL,0,1,0.00,NULL,1,0,0,0,0,1,0,'#2180f3','2',NULL,'2025-07-04 07:48:25','2025-07-04 07:48:25'),(5,'Prasad','prasad@gmail.com','2025-07-04 08:02:08','$2y$10$AiRFAisN7HGGSC4oK6b.u.usQmN4/gfZVTAFLDqWcZHfO2CHETWDC','employee','avatar.png','',NULL,NULL,0,NULL,0,1,0.00,NULL,1,0,0,0,0,1,0,'#2180f3','2',NULL,'2025-07-04 08:02:08','2025-07-04 08:02:08');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warnings`
--

DROP TABLE IF EXISTS `warnings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warnings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `warning_to` int NOT NULL,
  `warning_by` int NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warning_date` date NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warnings`
--

LOCK TABLES `warnings` WRITE;
/*!40000 ALTER TABLE `warnings` DISABLE KEYS */;
/*!40000 ALTER TABLE `warnings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webhooks`
--

DROP TABLE IF EXISTS `webhooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webhooks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `module` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webhooks`
--

LOCK TABLES `webhooks` WRITE;
/*!40000 ALTER TABLE `webhooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `webhooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoom_meetings`
--

DROP TABLE IF EXISTS `zoom_meetings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zoom_meetings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meeting_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `duration` int NOT NULL DEFAULT '0',
  `start_url` text COLLATE utf8mb4_unicode_ci,
  `join_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'waiting',
  `created_by` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoom_meetings`
--

LOCK TABLES `zoom_meetings` WRITE;
/*!40000 ALTER TABLE `zoom_meetings` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoom_meetings` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-04 14:34:52
