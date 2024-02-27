-- --------------------------------------------------------
-- Sunucu:                       127.0.0.1
-- Sunucu sürümü:                10.4.21-MariaDB - mariadb.org binary distribution
-- Sunucu İşletim Sistemi:       Win64
-- HeidiSQL Sürüm:               11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- korsan_oyun_dunyasi için veritabanı yapısı dökülüyor
CREATE DATABASE IF NOT EXISTS `korsan_oyun_dunyasi` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `korsan_oyun_dunyasi`;

-- tablo yapısı dökülüyor korsan_oyun_dunyasi.oyun_adi
CREATE TABLE IF NOT EXISTS `oyun_adi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad` varchar(50) NOT NULL DEFAULT '',
  `tur_sira` int(11) NOT NULL,
  `yas` tinyint(4) NOT NULL DEFAULT 0,
  `kapak_gorsel_adi` varchar(150) NOT NULL,
  `boyut` int(11) NOT NULL,
  `sistem_gerekimi` text NOT NULL,
  `yapimci_sira` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_oyun_adi_tur` (`tur_sira`),
  KEY `FK_oyun_adi_yapimci` (`yapimci_sira`),
  CONSTRAINT `FK_oyun_adi_tur` FOREIGN KEY (`tur_sira`) REFERENCES `tur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_oyun_adi_yapimci` FOREIGN KEY (`yapimci_sira`) REFERENCES `yapimci` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- korsan_oyun_dunyasi.oyun_adi: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `oyun_adi` DISABLE KEYS */;
/*!40000 ALTER TABLE `oyun_adi` ENABLE KEYS */;

-- tablo yapısı dökülüyor korsan_oyun_dunyasi.tur
CREATE TABLE IF NOT EXISTS `tur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- korsan_oyun_dunyasi.tur: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `tur` DISABLE KEYS */;
/*!40000 ALTER TABLE `tur` ENABLE KEYS */;

-- tablo yapısı dökülüyor korsan_oyun_dunyasi.yapimci
CREATE TABLE IF NOT EXISTS `yapimci` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `yapimci_adi` varchar(50) NOT NULL,
  `ktarih` date NOT NULL,
  `personel` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- korsan_oyun_dunyasi.yapimci: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `yapimci` DISABLE KEYS */;
/*!40000 ALTER TABLE `yapimci` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
