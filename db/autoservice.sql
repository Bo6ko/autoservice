-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.17-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for autoservice
CREATE DATABASE IF NOT EXISTS `autoservice` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `autoservice`;

-- Dumping structure for table autoservice.cars
CREATE TABLE IF NOT EXISTS `cars` (
  `car_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `mark_id` smallint(5) unsigned DEFAULT NULL,
  `model_id` smallint(5) unsigned DEFAULT NULL,
  `car_register_number` varchar(15) DEFAULT NULL,
  `car_created_at` datetime DEFAULT NULL,
  `car_updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `car_status` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`car_id`),
  UNIQUE KEY `car_register_number` (`car_register_number`),
  KEY `car_id` (`car_id`),
  KEY `user_id` (`user_id`),
  KEY `mark_id` (`mark_id`),
  KEY `model_id` (`model_id`),
  CONSTRAINT `FK_cars_car_marks` FOREIGN KEY (`mark_id`) REFERENCES `car_marks` (`mark_id`),
  CONSTRAINT `FK_cars_car_models` FOREIGN KEY (`model_id`) REFERENCES `car_models` (`model_id`),
  CONSTRAINT `FK_cars_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- Dumping data for table autoservice.cars: ~0 rows (approximately)
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
/*!40000 ALTER TABLE `cars` ENABLE KEYS */;

-- Dumping structure for table autoservice.car_marks
CREATE TABLE IF NOT EXISTS `car_marks` (
  `mark_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `mark_name` varchar(50) DEFAULT NULL,
  `mark_created_at` datetime DEFAULT NULL,
  `mark_updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `mark_status` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`mark_id`),
  KEY `mark_id` (`mark_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table autoservice.car_marks: ~4 rows (approximately)
/*!40000 ALTER TABLE `car_marks` DISABLE KEYS */;
INSERT INTO `car_marks` (`mark_id`, `mark_name`, `mark_created_at`, `mark_updated_at`, `mark_status`) VALUES
	(1, 'Toyota', '2020-10-25 09:39:43', '2020-10-25 09:39:43', 0),
	(2, 'Honda', '2020-10-25 09:40:02', '2020-10-25 09:40:03', 0),
	(3, 'BMV', '2020-10-25 09:40:03', '2020-10-25 09:40:03', 0),
	(4, 'Mercedes', '2020-10-25 09:40:04', '2020-10-25 09:40:04', 0);
/*!40000 ALTER TABLE `car_marks` ENABLE KEYS */;

-- Dumping structure for table autoservice.car_models
CREATE TABLE IF NOT EXISTS `car_models` (
  `model_id` smallint(5) unsigned NOT NULL DEFAULT 0,
  `mark_id` int(5) unsigned NOT NULL,
  `model_name` varchar(50) DEFAULT NULL,
  `model_created_at` datetime DEFAULT NULL,
  `model_updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `model_status` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`model_id`),
  KEY `model_id` (`model_id`),
  KEY `mark_id` (`mark_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table autoservice.car_models: ~17 rows (approximately)
/*!40000 ALTER TABLE `car_models` DISABLE KEYS */;
INSERT INTO `car_models` (`model_id`, `mark_id`, `model_name`, `model_created_at`, `model_updated_at`, `model_status`) VALUES
	(1, 1, 'C-HR', NULL, '2020-10-25 09:40:52', 0),
	(2, 1, 'RAV4', NULL, '2020-10-25 09:41:03', 0),
	(3, 1, 'Corolla', NULL, '2020-10-25 09:41:18', 0),
	(4, 1, 'Yaris', NULL, '2020-10-25 09:41:40', 0),
	(5, 2, 'Civic', NULL, '2020-10-25 09:42:10', 0),
	(6, 2, 'Accord', NULL, '2020-10-25 09:42:20', 0),
	(7, 3, 'X1', NULL, '2020-10-25 09:44:04', 0),
	(8, 3, 'X2', NULL, '2020-10-25 09:44:11', 0),
	(9, 3, 'X3', NULL, '2020-10-25 09:44:23', 0),
	(10, 3, 'X4', NULL, '2020-10-25 09:44:35', 0),
	(11, 3, 'X5', NULL, '2020-10-25 09:44:41', 0),
	(12, 3, 'X6', NULL, '2020-10-25 09:44:49', 0),
	(13, 4, 'A-Class', NULL, '2020-10-25 09:45:22', 0),
	(14, 4, 'C-Class', NULL, '2020-10-25 09:45:29', 0),
	(15, 4, 'Benz', NULL, '2020-10-25 09:45:45', 0),
	(16, 4, 'S-Class', NULL, '2020-10-25 09:46:16', 0),
	(17, 4, 'SLS AMG', NULL, '2020-10-25 09:46:24', 0);
/*!40000 ALTER TABLE `car_models` ENABLE KEYS */;

-- Dumping structure for table autoservice.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table autoservice.failed_jobs: ~0 rows (approximately)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Dumping structure for table autoservice.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table autoservice.migrations: ~4 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2021_03_08_194257_create_cars_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table autoservice.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table autoservice.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table autoservice.users
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_role` smallint(3) NOT NULL,
  `user_created_at` timestamp NULL DEFAULT NULL,
  `user_updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_status` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `users_user_email_unique` (`user_email`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table autoservice.users: ~0 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`user_id`, `user_name`, `user_email`, `user_phone`, `user_password`, `user_role`, `user_created_at`, `user_updated_at`, `user_status`) VALUES
	(1, 'Bozhidar', 'b_shopov1@gmail.com', '123132', 'qwert', 2, NULL, '2021-03-09 00:20:24', 1),
	(2, 'Bozhidar', 'b_shopov2@gmail.com', '3213123', 'qwert', 2, '2021-03-11 19:08:48', '2021-03-11 21:08:48', 1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table autoservice.user_roles
CREATE TABLE IF NOT EXISTS `user_roles` (
  `role_id` smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  `role` varchar(50) DEFAULT 'employee',
  `role_created_at` timestamp NULL DEFAULT NULL,
  `role_updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `role_status` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`role_id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table autoservice.user_roles: ~2 rows (approximately)
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` (`role_id`, `role`, `role_created_at`, `role_updated_at`, `role_status`) VALUES
	(1, 'employee', '2021-03-08 23:19:27', '2021-03-08 23:19:27', 1),
	(2, 'client', '2021-03-08 23:19:42', '2021-03-08 23:19:56', 1);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
