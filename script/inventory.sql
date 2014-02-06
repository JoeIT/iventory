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
  `code` varchar(50) DEFAULT NULL,
  `new_code` varchar(50) DEFAULT NULL,
  `accounting_code` varchar(50) DEFAULT NULL,
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
  `photo_dir` varchar(100) NOT NULL,
  `creation_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table inventory.item: ~1 rows (approximately)
DELETE FROM `item`;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` (`id`, `code`, `new_code`, `accounting_code`, `type_id`, `name`, `brand_id`, `material_id`, `color_id`, `origin_id`, `location_id`, `owner_id`, `quantity`, `unit_cost`, `minimum_cost`, `expected_cost`, `sales_cost`, `condition_id`, `availability_id`, `comment`, `photo_dir`, `creation_date`, `modified_date`) VALUES
	(1, '04-001', '', '30.06.04.00002', 3, 'MAQUINA DE COSTURA TRIPLE BRAZO LARGO', 9, 5, 6, 17, 5, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 2, 3, 'MAQUINA:\r\nMarca: PFAFF\r\nModelo: PFAFF\r\nSerie: 633860\r\n\r\nMOTOR:\r\nMarca: ZOJE\r\nModelo: DOL12H-1\r\nSerie: 8123272', '04-001', '2014-02-05 15:02:25', '2014-02-06 08:02:30');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;


-- Dumping structure for table inventory.item_availability
DROP TABLE IF EXISTS `item_availability`;
CREATE TABLE IF NOT EXISTS `item_availability` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table inventory.item_availability: ~4 rows (approximately)
DELETE FROM `item_availability`;
/*!40000 ALTER TABLE `item_availability` DISABLE KEYS */;
INSERT INTO `item_availability` (`id`, `name`, `description`) VALUES
	(1, '- Seleccionar -', NULL),
	(2, 'En venta', NULL),
	(3, 'NO venta', NULL),
	(4, 'No hay dato', NULL);
/*!40000 ALTER TABLE `item_availability` ENABLE KEYS */;


-- Dumping structure for table inventory.item_brand
DROP TABLE IF EXISTS `item_brand`;
CREATE TABLE IF NOT EXISTS `item_brand` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Dumping data for table inventory.item_brand: ~11 rows (approximately)
DELETE FROM `item_brand`;
/*!40000 ALTER TABLE `item_brand` DISABLE KEYS */;
INSERT INTO `item_brand` (`id`, `name`) VALUES
	(1, '- Seleccionar -'),
	(2, 'Sony'),
	(3, 'Samsung'),
	(4, 'Toyota'),
	(5, 'Fiat'),
	(6, 'Lg'),
	(7, 'Dell'),
	(8, 'Hp'),
	(9, 'Acer'),
	(10, 'PFAFF'),
	(11, 'No hay dato');
/*!40000 ALTER TABLE `item_brand` ENABLE KEYS */;


-- Dumping structure for table inventory.item_color
DROP TABLE IF EXISTS `item_color`;
CREATE TABLE IF NOT EXISTS `item_color` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Dumping data for table inventory.item_color: ~7 rows (approximately)
DELETE FROM `item_color`;
/*!40000 ALTER TABLE `item_color` DISABLE KEYS */;
INSERT INTO `item_color` (`id`, `name`) VALUES
	(1, '- Seleccionar -'),
	(2, 'Negro'),
	(3, 'Azul'),
	(4, 'Blanco'),
	(5, 'Amarillo'),
	(6, 'Verde'),
	(7, 'No hay dato');
/*!40000 ALTER TABLE `item_color` ENABLE KEYS */;


-- Dumping structure for table inventory.item_condition
DROP TABLE IF EXISTS `item_condition`;
CREATE TABLE IF NOT EXISTS `item_condition` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Dumping data for table inventory.item_condition: ~8 rows (approximately)
DELETE FROM `item_condition`;
/*!40000 ALTER TABLE `item_condition` DISABLE KEYS */;
INSERT INTO `item_condition` (`id`, `name`, `description`) VALUES
	(1, '- Seleccionar -', NULL),
	(2, 'Nuevo', NULL),
	(3, 'Buen estado', NULL),
	(4, 'Medio uso', NULL),
	(5, 'Antiguo', NULL),
	(6, 'Dañado', NULL),
	(7, 'Inservible', NULL),
	(8, 'No hay dato', NULL);
/*!40000 ALTER TABLE `item_condition` ENABLE KEYS */;


-- Dumping structure for table inventory.item_location
DROP TABLE IF EXISTS `item_location`;
CREATE TABLE IF NOT EXISTS `item_location` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- Dumping data for table inventory.item_location: ~9 rows (approximately)
DELETE FROM `item_location`;
/*!40000 ALTER TABLE `item_location` DISABLE KEYS */;
INSERT INTO `item_location` (`id`, `name`, `description`) VALUES
	(1, '- Seleccionar -', NULL),
	(2, 'Sala de reuniones', NULL),
	(3, 'Oficina gerencia', NULL),
	(4, 'Area corte', NULL),
	(5, 'Area diseño', NULL),
	(6, 'Area almacén', NULL),
	(7, 'Depósito bloque oficinas', NULL),
	(8, 'Oficina contabilidad', NULL),
	(9, 'No hay dato', NULL),
	(10, 'Oficina Michelle', NULL),
	(11, 'Oficina sistemas', NULL),
	(12, 'Area impresión laser', NULL),
	(13, 'Oficina showroom', NULL),
	(14, 'Depósito trasero', NULL),
	(15, 'Planta línea', NULL),
	(16, 'Area tapiceria', NULL),
	(17, 'Area mecánica', NULL),
	(18, 'Oficinas', NULL);
/*!40000 ALTER TABLE `item_location` ENABLE KEYS */;


-- Dumping structure for table inventory.item_material
DROP TABLE IF EXISTS `item_material`;
CREATE TABLE IF NOT EXISTS `item_material` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Dumping data for table inventory.item_material: ~7 rows (approximately)
DELETE FROM `item_material`;
/*!40000 ALTER TABLE `item_material` DISABLE KEYS */;
INSERT INTO `item_material` (`id`, `name`, `description`) VALUES
	(1, '- Seleccionar -', NULL),
	(2, 'Cuero', ''),
	(3, 'Madera', ''),
	(4, 'PU', ''),
	(5, 'Plástico', ''),
	(6, 'Metal', ''),
	(7, 'No hay dato', NULL);
/*!40000 ALTER TABLE `item_material` ENABLE KEYS */;


-- Dumping structure for table inventory.item_origin
DROP TABLE IF EXISTS `item_origin`;
CREATE TABLE IF NOT EXISTS `item_origin` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- Dumping data for table inventory.item_origin: ~19 rows (approximately)
DELETE FROM `item_origin`;
/*!40000 ALTER TABLE `item_origin` DISABLE KEYS */;
INSERT INTO `item_origin` (`id`, `name`) VALUES
	(1, '- Seleccionar -'),
	(2, 'Bolivia'),
	(3, 'Alemania'),
	(4, 'China'),
	(5, 'EEUU'),
	(6, 'Japón'),
	(7, 'Korea'),
	(8, 'Taiwán'),
	(9, 'Mexico'),
	(10, 'Perú'),
	(11, 'Argentina'),
	(12, 'Brasil'),
	(13, 'Colombia'),
	(14, 'Venezuela'),
	(15, 'Paraguay'),
	(16, 'Italia'),
	(17, 'Francia'),
	(18, 'Rusia'),
	(19, 'No hay dato');
/*!40000 ALTER TABLE `item_origin` ENABLE KEYS */;


-- Dumping structure for table inventory.item_owner
DROP TABLE IF EXISTS `item_owner`;
CREATE TABLE IF NOT EXISTS `item_owner` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table inventory.item_owner: ~4 rows (approximately)
DELETE FROM `item_owner`;
/*!40000 ALTER TABLE `item_owner` DISABLE KEYS */;
INSERT INTO `item_owner` (`id`, `name`, `description`) VALUES
	(1, '- Seleccionar -', NULL),
	(2, 'Ing. Weiss', 'Cosas pertenecientes al Ing. Peter Weiss.'),
	(3, 'Macaws', NULL),
	(4, 'No hay dato', NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Dumping data for table inventory.item_type: ~12 rows (approximately)
DELETE FROM `item_type`;
/*!40000 ALTER TABLE `item_type` DISABLE KEYS */;
INSERT INTO `item_type` (`id`, `parent_id`, `name`, `description`) VALUES
	(1, NULL, '- Seleccionar -', NULL),
	(2, NULL, 'No hay dato', NULL),
	(3, NULL, 'Mueble', NULL),
	(4, NULL, 'Artículo de escritorio', NULL),
	(5, NULL, 'Maquina de coser', NULL),
	(6, NULL, 'Herramienta', NULL),
	(7, NULL, 'Automovil', NULL),
	(8, NULL, 'Maquina para ejercicios', NULL),
	(9, NULL, 'Artículo de cocina', NULL),
	(10, NULL, 'Computador', NULL),
	(11, NULL, 'Repuesto', NULL),
	(12, NULL, 'Otro', NULL);
/*!40000 ALTER TABLE `item_type` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
