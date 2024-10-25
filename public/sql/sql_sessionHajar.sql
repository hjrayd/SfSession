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
CREATE DATABASE IF NOT EXISTS `sfsession_hajar` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sfsession_hajar`;

-- Listage de la structure de table sfsession_hajar. category
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table sfsession_hajar.category : ~4 rows (environ)
INSERT INTO `category` (`id`, `category_name`) VALUES
	(1, 'Office automation'),
	(2, 'Web Developer'),
	(3, 'Computer graphics'),
	(4, 'Computer Science');

-- Listage de la structure de table sfsession_hajar. messenger_messages
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table sfsession_hajar.messenger_messages : ~2 rows (environ)
INSERT INTO `messenger_messages` (`id`, `body`, `headers`, `queue_name`, `created_at`, `available_at`, `delivered_at`) VALUES
	(1, 'O:36:\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\":2:{s:44:\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\";a:1:{s:46:\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\";a:1:{i:0;O:46:\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\":1:{s:55:\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\";s:21:\\"messenger.bus.default\\";}}}s:45:\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\";O:51:\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\":2:{s:60:\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\";O:39:\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\":5:{i:0;s:41:\\"registration/confirmation_email.html.twig\\";i:1;N;i:2;a:3:{s:9:\\"signedUrl\\";s:171:\\"http://127.0.0.1:8000/verify/email?expires=1729851114&signature=703x%2FVTpxVZ9FL%2B%2BfVUntuDpClJQNRdeHkF0YGM4JxI%3D&token=GAznGGJ%2BNxyV9MZCvcAxG3CyyJuCJ2m5KCSR6ApzGTA%3D\\";s:19:\\"expiresAtMessageKey\\";s:26:\\"%count% hour|%count% hours\\";s:20:\\"expiresAtMessageData\\";a:1:{s:7:\\"%count%\\";i:1;}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\":2:{s:46:\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\";a:3:{s:4:\\"from\\";a:1:{i:0;O:47:\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\":5:{s:50:\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\";s:4:\\"From\\";s:56:\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\";i:76;s:50:\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\";N;s:53:\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\";s:5:\\"utf-8\\";s:58:\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\";a:1:{i:0;O:30:\\"Symfony\\\\Component\\\\Mime\\\\Address\\":2:{s:39:\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\";s:17:\\"admin@exemple.com\\";s:36:\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\";s:10:\\"Admin Site\\";}}}}s:2:\\"to\\";a:1:{i:0;O:47:\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\":5:{s:50:\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\";s:2:\\"To\\";s:56:\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\";i:76;s:50:\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\";N;s:53:\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\";s:5:\\"utf-8\\";s:58:\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\";a:1:{i:0;O:30:\\"Symfony\\\\Component\\\\Mime\\\\Address\\":2:{s:39:\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\";s:14:\\"hajar@mail.com\\";s:36:\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\";s:0:\\"\\";}}}}s:7:\\"subject\\";a:1:{i:0;O:48:\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\":5:{s:50:\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\";s:7:\\"Subject\\";s:56:\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\";i:76;s:50:\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\";N;s:53:\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\";s:5:\\"utf-8\\";s:55:\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\";s:25:\\"Please Confirm your Email\\";}}}s:49:\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\";i:76;}i:1;N;}}i:4;N;}s:61:\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\";N;}}', '[]', 'default', '2024-10-25 09:11:54', '2024-10-25 09:11:54', NULL),
	(2, 'O:36:\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\":2:{s:44:\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\";a:1:{s:46:\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\";a:1:{i:0;O:46:\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\":1:{s:55:\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\";s:21:\\"messenger.bus.default\\";}}}s:45:\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\";O:51:\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\":2:{s:60:\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\";O:39:\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\":5:{i:0;s:41:\\"registration/confirmation_email.html.twig\\";i:1;N;i:2;a:3:{s:9:\\"signedUrl\\";s:167:\\"http://127.0.0.1:8000/verify/email?expires=1729852012&signature=nD3nFAs%2BM1TPFlRMzhtZL2ad9kt%2BYGXXHBRBsAkoAfM%3D&token=1oM5Fvn62xN2hzkC08gn9WQXXyizKp1DQT2x1g3uuV4%3D\\";s:19:\\"expiresAtMessageKey\\";s:26:\\"%count% hour|%count% hours\\";s:20:\\"expiresAtMessageData\\";a:1:{s:7:\\"%count%\\";i:1;}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\":2:{s:46:\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\";a:3:{s:4:\\"from\\";a:1:{i:0;O:47:\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\":5:{s:50:\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\";s:4:\\"From\\";s:56:\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\";i:76;s:50:\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\";N;s:53:\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\";s:5:\\"utf-8\\";s:58:\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\";a:1:{i:0;O:30:\\"Symfony\\\\Component\\\\Mime\\\\Address\\":2:{s:39:\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\";s:17:\\"admin@exemple.com\\";s:36:\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\";s:10:\\"Admin Site\\";}}}}s:2:\\"to\\";a:1:{i:0;O:47:\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\":5:{s:50:\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\";s:2:\\"To\\";s:56:\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\";i:76;s:50:\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\";N;s:53:\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\";s:5:\\"utf-8\\";s:58:\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\";a:1:{i:0;O:30:\\"Symfony\\\\Component\\\\Mime\\\\Address\\":2:{s:39:\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\";s:14:\\"hajar@mail.com\\";s:36:\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\";s:0:\\"\\";}}}}s:7:\\"subject\\";a:1:{i:0;O:48:\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\":5:{s:50:\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\";s:7:\\"Subject\\";s:56:\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\";i:76;s:50:\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\";N;s:53:\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\";s:5:\\"utf-8\\";s:55:\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\";s:25:\\"Please Confirm your Email\\";}}}s:49:\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\";i:76;}i:1;N;}}i:4;N;}s:61:\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\";N;}}', '[]', 'default', '2024-10-25 09:26:52', '2024-10-25 09:26:52', NULL);

-- Listage de la structure de table sfsession_hajar. module
CREATE TABLE IF NOT EXISTS `module` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `module_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C24262812469DE2` (`category_id`),
  CONSTRAINT `FK_C24262812469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table sfsession_hajar.module : ~10 rows (environ)
INSERT INTO `module` (`id`, `category_id`, `module_name`) VALUES
	(1, 1, 'Word'),
	(2, 1, 'Excel'),
	(3, 1, 'PowerPoint'),
	(4, 2, 'PHP'),
	(5, 2, 'SQL'),
	(6, 2, 'JavaScript'),
	(7, 3, 'Photoshop'),
	(8, 3, 'Illustrator'),
	(9, 3, 'InDesign'),
	(10, 3, 'CSS');

-- Listage de la structure de table sfsession_hajar. program
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table sfsession_hajar.program : ~12 rows (environ)
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
	(11, 5, 2, 1),
	(16, NULL, 1, 3);

-- Listage de la structure de table sfsession_hajar. session
CREATE TABLE IF NOT EXISTS `session` (
  `id` int NOT NULL AUTO_INCREMENT,
  `training_id` int NOT NULL,
  `session_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `number_place` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D044D5D4BEFD98D1` (`training_id`),
  CONSTRAINT `FK_D044D5D4BEFD98D1` FOREIGN KEY (`training_id`) REFERENCES `training` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table sfsession_hajar.session : ~7 rows (environ)
INSERT INTO `session` (`id`, `training_id`, `session_name`, `start_date`, `end_date`, `number_place`) VALUES
	(1, 1, 'Initiation Word and Excel', '2025-06-17 13:56:23', '2025-07-20 13:56:35', 8),
	(2, 2, 'Initation Illustrator and Photoshop', '2025-06-17 14:01:43', '2025-06-19 14:01:50', 10),
	(3, 3, 'Initiation Excel', '2025-06-10 14:03:05', '2025-07-29 14:03:20', 10),
	(4, 4, 'Initation PHP and SQL', '2025-09-01 14:04:07', '2026-12-12 14:04:29', 12),
	(5, 1, 'Initiation Powerpoint', '2025-07-12 14:06:05', '2025-07-08 14:06:50', 12),
	(7, 4, 'Initiation JavaScript', '2024-10-24 00:00:00', '2024-10-31 00:00:00', 9),
	(10, 1, 'Finished session', '2024-10-14 00:00:00', '2024-10-21 00:00:00', 3);

-- Listage de la structure de table sfsession_hajar. session_trainee
CREATE TABLE IF NOT EXISTS `session_trainee` (
  `session_id` int NOT NULL,
  `trainee_id` int NOT NULL,
  PRIMARY KEY (`session_id`,`trainee_id`),
  KEY `IDX_541E0FBD613FECDF` (`session_id`),
  KEY `IDX_541E0FBD36C682D0` (`trainee_id`),
  CONSTRAINT `FK_541E0FBD36C682D0` FOREIGN KEY (`trainee_id`) REFERENCES `trainee` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_541E0FBD613FECDF` FOREIGN KEY (`session_id`) REFERENCES `session` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table sfsession_hajar.session_trainee : ~6 rows (environ)
INSERT INTO `session_trainee` (`session_id`, `trainee_id`) VALUES
	(3, 1),
	(3, 2),
	(3, 4),
	(4, 1),
	(5, 2),
	(7, 1);

-- Listage de la structure de table sfsession_hajar. trainee
CREATE TABLE IF NOT EXISTS `trainee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `surname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_date` datetime NOT NULL,
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_trainee` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `adress` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table sfsession_hajar.trainee : ~3 rows (environ)
INSERT INTO `trainee` (`id`, `surname`, `firstname`, `gender`, `birth_date`, `city`, `email_trainee`, `phone`, `adress`, `zip_code`) VALUES
	(1, 'Hajar', 'Ayaddouz', 'F', '2002-08-13 14:08:16', 'SCHILTIGHEIM', 'hajar@mail.com', '07.09.08.09.08', '3 rue de la gare', '67300'),
	(2, 'Test', 'Testi', 'M', '2003-10-22 14:09:20', 'STRASBOURG', 'test@mail.com', '00.08.07.98.87', '5 avenue de l\'Europe', '67000'),
	(4, 'Alex', 'Test', 'F', '2005-10-19 00:00:00', 'STRASBOURG', 'haj@mail.com', '02.32.25.63.32', '30 rue des loutres', '67000');

-- Listage de la structure de table sfsession_hajar. training
CREATE TABLE IF NOT EXISTS `training` (
  `id` int NOT NULL AUTO_INCREMENT,
  `training_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table sfsession_hajar.training : ~4 rows (environ)
INSERT INTO `training` (`id`, `training_name`) VALUES
	(1, 'Office automation'),
	(2, 'Computer graphics'),
	(3, 'Accounting'),
	(4, 'Web developement');

-- Listage de la structure de table sfsession_hajar. user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pseudo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_firstname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_surname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_IDENTIFIER_EMAIL` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table sfsession_hajar.user : ~3 rows (environ)
INSERT INTO `user` (`id`, `email`, `roles`, `password`, `pseudo`, `user_firstname`, `user_surname`, `is_verified`) VALUES
	(4, 'hajar@mail.com', '["ROLE_ADMIN"]', '$2y$13$vhWJvPidJbW8eBQ9MwtwQuf9oxq8v.9MxTcft/XhVF/V7lqep5btO', 'haj', 'Hajar', 'Ayaddouz', 0),
	(6, 'admin@mail.com', '[]', '$2y$13$YhD8vSUKQHrQBMM37mYJCeBqaNPBMp1Arq27YNASJ0Gdct8JnMVa.', 'admin', 'admin', 'admin', 0),
	(8, 'haj@mail.com', '[]', '$2y$13$n2oGPwl2u4uyMjEKo3GmeucSZENHHkGQYhETHIV3zehwNhSl62vIq', 'haj', 'haj', 'haj', 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
