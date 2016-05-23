-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.6.26-log - MySQL Community Server (GPL)
-- ОС Сервера:                   Win32
-- HeidiSQL Версия:              9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Дамп структуры базы данных Yii2
CREATE DATABASE IF NOT EXISTS `Yii2` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `Yii2`;


-- Дамп структуры для таблица Yii2.blg_blog
CREATE TABLE IF NOT EXISTS `blg_blog` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `article` text NOT NULL,
  `create_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `FK_blg_blog_blg_user` FOREIGN KEY (`user_id`) REFERENCES `blg_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы Yii2.blg_blog: ~0 rows (приблизительно)
DELETE FROM `blg_blog`;
/*!40000 ALTER TABLE `blg_blog` DISABLE KEYS */;
/*!40000 ALTER TABLE `blg_blog` ENABLE KEYS */;


-- Дамп структуры для таблица Yii2.blg_comment
CREATE TABLE IF NOT EXISTS `blg_comment` (
  `id` int(11) NOT NULL,
  `user_id` int(45) NOT NULL,
  `blog_id` int(45) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `create_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `FK_blg_comment_blg_blog` (`blog_id`),
  CONSTRAINT `FK_blg_comment_blg_blog` FOREIGN KEY (`blog_id`) REFERENCES `blg_blog` (`id`),
  CONSTRAINT `FK_blg_comment_blg_user` FOREIGN KEY (`user_id`) REFERENCES `blg_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы Yii2.blg_comment: ~0 rows (приблизительно)
DELETE FROM `blg_comment`;
/*!40000 ALTER TABLE `blg_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `blg_comment` ENABLE KEYS */;


-- Дамп структуры для таблица Yii2.blg_user
CREATE TABLE IF NOT EXISTS `blg_user` (
  `id` int(11) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `access_token` varchar(255) NOT NULL,
  `create_date` datetime NOT NULL,
  `username` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы Yii2.blg_user: ~0 rows (приблизительно)
DELETE FROM `blg_user`;
/*!40000 ALTER TABLE `blg_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `blg_user` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
