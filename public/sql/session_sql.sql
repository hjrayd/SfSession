-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.0.30 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour sfsession_hajar
DROP DATABASE IF EXISTS `sfsession_hajar`;
CREATE DATABASE IF NOT EXISTS `sfsession_hajar` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sfsession_hajar`;

-- Listage de la structure de table sfsession_hajar. category
DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table sfsession_hajar.category : ~3 rows (environ)
INSERT INTO `category` (`id`, `category_name`) VALUES
	(1, 'Office automation'),
	(2, 'Web Developer'),
	(3, 'Computer graphics');

-- Listage de la structure de table sfsession_hajar. messenger_messages
DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table sfsession_hajar.messenger_messages : ~0 rows (environ)

-- Listage de la structure de table sfsession_hajar. module
DROP TABLE IF EXISTS `module`;
CREATE TABLE IF NOT EXISTS `module` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `module_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C24262812469DE2` (`category_id`),
  CONSTRAINT `FK_C24262812469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table sfsession_hajar.module : ~9 rows (environ)
INSERT INTO `module` (`id`, `category_id`, `module_name`) VALUES
	(1, 1, 'Word'),
	(2, 1, 'Excel'),
	(3, 1, 'PowerPoint'),
	(4, 2, 'PHP'),
	(5, 2, 'SQL'),
	(6, 2, 'JavaScript'),
	(7, 3, 'Photoshop'),
	(8, 3, 'Illustrator'),
	(9, 3, 'InDesign');

-- Listage de la structure de table sfsession_hajar. program
DROP TABLE IF EXISTS `program`;
CREATE TABLE IF NOT EXISTS `program` (
  `id` int NOT NULL AUTO_INCREMENT,
  `session_id` int DEFAULT NULL,
  `module_id` int DEFAULT NULL,
  `nb_days` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_92ED7784613FECDF` (`session_id`),
  KEY `IDX_92ED7784AFC2B591` (`module_id`),
  CONSTRAINT `FK_92ED7784613FECDF` FOREIGN KEY (`session_id`) REFERENCES `session` (`id`),
  CONSTRAINT `FK_92ED7784AFC2B591` FOREIGN KEY (`module_id`) REFERENCES `module` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table sfsession_hajar.program : ~11 rows (environ)
INSERT INTO `program` (`id`, `session_id`, `module_id`, `nb_days`) VALUES
	(1, 1, 1, 2),
	(2, 1, 8, 3),
	(3, 2, 7, 3),
	(4, 2, 8, 4),
	(5, 2, 9, 3),
	(6, 3, 2, 4),
	(7, 4, 4, 3),
	(8, 4, 5, 5),
	(9, 5, 1, 3),
	(10, 5, 3, 3),
	(11, 5, 2, 1);

-- Listage de la structure de table sfsession_hajar. session
DROP TABLE IF EXISTS `session`;
CREATE TABLE IF NOT EXISTS `session` (
  `id` int NOT NULL AUTO_INCREMENT,
  `training_id` int NOT NULL,
  `session_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `number_place` int NOT NULL,
  `reserved_place` int NOT NULL,
  `remaining_place` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D044D5D4BEFD98D1` (`training_id`),
  CONSTRAINT `FK_D044D5D4BEFD98D1` FOREIGN KEY (`training_id`) REFERENCES `training` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table sfsession_hajar.session : ~5 rows (environ)
INSERT INTO `session` (`id`, `training_id`, `session_name`, `start_date`, `end_date`, `number_place`, `reserved_place`, `remaining_place`) VALUES
	(1, 1, 'Initiation Word and Excel', '2024-06-17 13:56:23', '2024-07-20 13:56:35', 8, 0, 0),
	(2, 2, 'Initation Computer graphics', '2024-06-17 14:01:43', '2024-06-19 14:01:50', 10, 0, 0),
	(3, 3, 'Initiation Accounting', '2024-06-10 14:03:05', '2024-07-29 14:03:20', 10, 0, 0),
	(4, 4, 'Initation PHP and SQL', '2024-09-01 14:04:07', '2024-12-12 14:04:29', 12, 0, 0),
	(5, 5, 'Initiation Office automation', '2024-07-12 14:06:05', '2024-07-08 14:06:50', 12, 0, 0);

-- Listage de la structure de table sfsession_hajar. session_trainee
DROP TABLE IF EXISTS `session_trainee`;
CREATE TABLE IF NOT EXISTS `session_trainee` (
  `session_id` int NOT NULL,
  `trainee_id` int NOT NULL,
  PRIMARY KEY (`session_id`,`trainee_id`),
  KEY `IDX_541E0FBD613FECDF` (`session_id`),
  KEY `IDX_541E0FBD36C682D0` (`trainee_id`),
  CONSTRAINT `FK_541E0FBD36C682D0` FOREIGN KEY (`trainee_id`) REFERENCES `trainee` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_541E0FBD613FECDF` FOREIGN KEY (`session_id`) REFERENCES `session` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table sfsession_hajar.session_trainee : ~3 rows (environ)
INSERT INTO `session_trainee` (`session_id`, `trainee_id`) VALUES
	(3, 1),
	(4, 1),
	(5, 2);

-- Listage de la structure de table sfsession_hajar. trainee
DROP TABLE IF EXISTS `trainee`;
CREATE TABLE IF NOT EXISTS `trainee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `surname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_date` datetime NOT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_trainee` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adress` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table sfsession_hajar.trainee : ~2 rows (environ)
INSERT INTO `trainee` (`id`, `surname`, `firstname`, `gender`, `birth_date`, `city`, `email_trainee`, `phone`, `adress`, `zip_code`) VALUES
	(1, 'Hajar', 'Ayaddouz', 'F', '2002-08-13 14:08:16', 'SCHILTIGHEIM', 'hajar@mail.com', '07.09.08.09.08', '3 rue de la gare', '67300'),
	(2, 'Test', 'Testi', 'M', '2003-10-22 14:09:20', 'STRASBOURG', 'test@mail.com', '00.08.07.98.87', '5 avenue de l\'Europe', '67000');

-- Listage de la structure de table sfsession_hajar. training
DROP TABLE IF EXISTS `training`;
CREATE TABLE IF NOT EXISTS `training` (
  `id` int NOT NULL AUTO_INCREMENT,
  `training_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table sfsession_hajar.training : ~5 rows (environ)
INSERT INTO `training` (`id`, `training_name`) VALUES
	(1, 'Initiation Word and Excel'),
	(2, 'Initiation Computer graphics'),
	(3, 'Initiation Accounting'),
	(4, 'Initiation PHP and SQL'),
	(5, 'Initation Office automation');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
