-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.11 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             8.1.0.4545
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for inventory
DROP DATABASE IF EXISTS `inventory`;
CREATE DATABASE IF NOT EXISTS `inventory` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `inventory`;


-- Dumping structure for table inventory.item
DROP TABLE IF EXISTS `item`;
CREATE TABLE IF NOT EXISTS `item` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL,
  `new_code` varchar(20) DEFAULT NULL,
  `type_id` int(8) NOT NULL,
  `name` text NOT NULL,
  `brand_id` int(8) NOT NULL,
  `material_id` int(8) NOT NULL,
  `color_id` int(8) NOT NULL,
  `origin_id` int(8) NOT NULL,
  `location_id` int(8) NOT NULL,
  `owner_id` int(8) NOT NULL,
  `quantity` decimal(10,3) DEFAULT '1.000',
  `unit_cost` decimal(10,2) DEFAULT '0.00',
  `minimum_cost` decimal(10,2) DEFAULT '0.00',
  `expected_cost` decimal(10,2) DEFAULT '0.00',
  `sales_cost` decimal(10,2) DEFAULT '0.00',
  `condition_id` int(8) NOT NULL,
  `availability_id` int(8) NOT NULL,
  `comment` text,
  `photo_dir` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `material_id` (`material_id`),
  KEY `color_id` (`color_id`),
  KEY `location_id` (`location_id`),
  KEY `owner_id` (`owner_id`),
  KEY `type_id` (`type_id`),
  KEY `brand_id` (`brand_id`),
  KEY `origin_id` (`origin_id`),
  KEY `condition_id` (`condition_id`),
  KEY `avaibility_id` (`availability_id`),
  CONSTRAINT `item_ibfk_1` FOREIGN KEY (`material_id`) REFERENCES `item_material` (`id`),
  CONSTRAINT `item_ibfk_2` FOREIGN KEY (`owner_id`) REFERENCES `item_owner` (`id`),
  CONSTRAINT `item_ibfk_3` FOREIGN KEY (`location_id`) REFERENCES `item_location` (`id`),
  CONSTRAINT `item_ibfk_4` FOREIGN KEY (`color_id`) REFERENCES `item_color` (`id`),
  CONSTRAINT `item_ibfk_5` FOREIGN KEY (`type_id`) REFERENCES `item_type` (`id`),
  CONSTRAINT `item_ibfk_6` FOREIGN KEY (`condition_id`) REFERENCES `item_condition` (`id`),
  CONSTRAINT `item_ibfk_7` FOREIGN KEY (`availability_id`) REFERENCES `item_availability` (`id`),
  CONSTRAINT `item_ibfk_8` FOREIGN KEY (`origin_id`) REFERENCES `item_origin` (`id`),
  CONSTRAINT `item_ibfk_9` FOREIGN KEY (`brand_id`) REFERENCES `item_brand` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table inventory.item: ~2 rows (approximately)
DELETE FROM `item`;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` (`id`, `code`, `new_code`, `type_id`, `name`, `brand_id`, `material_id`, `color_id`, `origin_id`, `location_id`, `owner_id`, `quantity`, `unit_cost`, `minimum_cost`, `expected_cost`, `sales_cost`, `condition_id`, `availability_id`, `comment`, `photo_dir`) VALUES
	(1, 'Cod1', 'Cod2', 1, 'Algún nombre', 1, 3, 4, 5, 3, 1, 2.000, 250.00, 200.00, 245.00, 225.00, 2, 1, 'Ta weno el item', NULL),
	(2, '', '', 2, '', 8, 1, 4, 2, 5, 1, 0.000, 0.00, 0.00, 0.00, 0.00, 4, 1, NULL, NULL);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;


-- Dumping structure for table inventory.item_availability
DROP TABLE IF EXISTS `item_availability`;
CREATE TABLE IF NOT EXISTS `item_availability` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table inventory.item_availability: ~2 rows (approximately)
DELETE FROM `item_availability`;
/*!40000 ALTER TABLE `item_availability` DISABLE KEYS */;
INSERT INTO `item_availability` (`id`, `name`, `description`) VALUES
	(1, 'En venta', NULL),
	(2, 'NO venta', NULL);
/*!40000 ALTER TABLE `item_availability` ENABLE KEYS */;


-- Dumping structure for table inventory.item_brand
DROP TABLE IF EXISTS `item_brand`;
CREATE TABLE IF NOT EXISTS `item_brand` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Dumping data for table inventory.item_brand: ~8 rows (approximately)
DELETE FROM `item_brand`;
/*!40000 ALTER TABLE `item_brand` DISABLE KEYS */;
INSERT INTO `item_brand` (`id`, `name`) VALUES
	(1, 'Sony'),
	(2, 'Samsung'),
	(3, 'Toyota'),
	(4, 'Fiat'),
	(5, 'Lg'),
	(6, 'Dell'),
	(7, 'Hp'),
	(8, 'Acer');
/*!40000 ALTER TABLE `item_brand` ENABLE KEYS */;


-- Dumping structure for table inventory.item_color
DROP TABLE IF EXISTS `item_color`;
CREATE TABLE IF NOT EXISTS `item_color` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table inventory.item_color: ~5 rows (approximately)
DELETE FROM `item_color`;
/*!40000 ALTER TABLE `item_color` DISABLE KEYS */;
INSERT INTO `item_color` (`id`, `name`) VALUES
	(1, 'Negro'),
	(2, 'Azul'),
	(3, 'Blanco'),
	(4, 'Amarillo'),
	(5, 'Verde');
/*!40000 ALTER TABLE `item_color` ENABLE KEYS */;


-- Dumping structure for table inventory.item_condition
DROP TABLE IF EXISTS `item_condition`;
CREATE TABLE IF NOT EXISTS `item_condition` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dumping data for table inventory.item_condition: ~6 rows (approximately)
DELETE FROM `item_condition`;
/*!40000 ALTER TABLE `item_condition` DISABLE KEYS */;
INSERT INTO `item_condition` (`id`, `name`, `description`) VALUES
	(1, 'Nuevo', NULL),
	(2, 'Buen estado', NULL),
	(3, 'Medio uso', NULL),
	(4, 'Antiguo', NULL),
	(5, 'Dañado', NULL),
	(6, 'Inservible', NULL);
/*!40000 ALTER TABLE `item_condition` ENABLE KEYS */;


-- Dumping structure for table inventory.item_location
DROP TABLE IF EXISTS `item_location`;
CREATE TABLE IF NOT EXISTS `item_location` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Dumping data for table inventory.item_location: ~7 rows (approximately)
DELETE FROM `item_location`;
/*!40000 ALTER TABLE `item_location` DISABLE KEYS */;
INSERT INTO `item_location` (`id`, `name`, `description`) VALUES
	(1, 'Sala de reuniones', NULL),
	(2, 'Oficina Gerencia', NULL),
	(3, 'Area corte', NULL),
	(4, 'Area diseño', NULL),
	(5, 'Almacén', NULL),
	(6, 'Depósito', NULL),
	(7, 'Oficina contabilidad', NULL);
/*!40000 ALTER TABLE `item_location` ENABLE KEYS */;


-- Dumping structure for table inventory.item_material
DROP TABLE IF EXISTS `item_material`;
CREATE TABLE IF NOT EXISTS `item_material` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table inventory.item_material: ~5 rows (approximately)
DELETE FROM `item_material`;
/*!40000 ALTER TABLE `item_material` DISABLE KEYS */;
INSERT INTO `item_material` (`id`, `name`, `description`) VALUES
	(1, 'Cuero', ''),
	(2, 'Madera', ''),
	(3, 'PU', ''),
	(4, 'Plástico', ''),
	(5, 'Metal', '');
/*!40000 ALTER TABLE `item_material` ENABLE KEYS */;


-- Dumping structure for table inventory.item_origin
DROP TABLE IF EXISTS `item_origin`;
CREATE TABLE IF NOT EXISTS `item_origin` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- Dumping data for table inventory.item_origin: ~16 rows (approximately)
DELETE FROM `item_origin`;
/*!40000 ALTER TABLE `item_origin` DISABLE KEYS */;
INSERT INTO `item_origin` (`id`, `name`) VALUES
	(1, 'Bolivia'),
	(2, 'Alemania'),
	(3, 'Chino'),
	(4, 'EEUU'),
	(5, 'Japón'),
	(6, 'Korea'),
	(7, 'Taiwán'),
	(8, 'Mexico'),
	(9, 'Perú'),
	(10, 'Argentina'),
	(11, 'Brasil'),
	(12, 'Colombia'),
	(13, 'Venezuela'),
	(14, 'Paraguay'),
	(15, 'Italia'),
	(16, 'Francia');
/*!40000 ALTER TABLE `item_origin` ENABLE KEYS */;


-- Dumping structure for table inventory.item_owner
DROP TABLE IF EXISTS `item_owner`;
CREATE TABLE IF NOT EXISTS `item_owner` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table inventory.item_owner: ~2 rows (approximately)
DELETE FROM `item_owner`;
/*!40000 ALTER TABLE `item_owner` DISABLE KEYS */;
INSERT INTO `item_owner` (`id`, `name`, `description`) VALUES
	(1, 'Ing. Weiss', 'Cosas pertenecientes al Ing. Weiss.'),
	(2, 'Macaws', NULL);
/*!40000 ALTER TABLE `item_owner` ENABLE KEYS */;


-- Dumping structure for table inventory.item_type
DROP TABLE IF EXISTS `item_type`;
CREATE TABLE IF NOT EXISTS `item_type` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `parent_id` int(8) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `item_type_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `item_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table inventory.item_type: ~2 rows (approximately)
DELETE FROM `item_type`;
/*!40000 ALTER TABLE `item_type` DISABLE KEYS */;
INSERT INTO `item_type` (`id`, `parent_id`, `name`, `description`) VALUES
	(1, NULL, 'Silla de oficina', NULL),
	(2, NULL, 'Escritorio', NULL);
/*!40000 ALTER TABLE `item_type` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
