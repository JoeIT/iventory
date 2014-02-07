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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- Dumping data for table inventory.item: ~30 rows (approximately)
DELETE FROM `item`;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` (`id`, `code`, `new_code`, `accounting_code`, `type_id`, `name`, `brand_id`, `material_id`, `color_id`, `origin_id`, `location_id`, `owner_id`, `quantity`, `unit_cost`, `minimum_cost`, `expected_cost`, `sales_cost`, `condition_id`, `availability_id`, `comment`, `photo_dir`, `creation_date`, `modified_date`) VALUES
	(1, '04-001', '', '40.06.04.00001', 5, 'Maquina de costura triple brazo largo', 10, 6, 8, 3, 15, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA:\r\nBRAZO LARGO\r\nMARCA: PFAFF\r\nSERIE: 533860\r\n\r\nMOTOR:\r\nMARCA: ZOJE\r\nSERIE: 8123272\r\n\r\nMESON CON BASE METALICA DE 0,77M X 1,53M X 0,61M COLOR PLOMO', '04-001', '2014-02-05 15:02:25', '2014-02-07 15:02:54'),
	(2, '04-002', '', '30.06.04.00002', 5, 'Maquina de costura TRIPLE', 10, 6, 4, 3, 15, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\nMAQUINA DE COSER:\r\nMARCA: PFAFF\r\nSERIE: 509785\r\nMODELO: 1245\r\n\r\nMOTOR:\r\nMARCA: HOHSING\r\nSERIE: A-803311\r\n\r\nCON MESON DE MADERA DE 0,80M X 1,22M X 0,54M COLOR BLANCO', '04-002', '2014-02-06 17:02:47', '2014-02-07 15:02:37'),
	(3, '04-005', '', '30.06.04.00005', 5, 'Maquina de costura triple', 10, 6, 8, 3, 15, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA:\r\nMARCA: PFAFF\r\nSERIE: 509786\r\nMODELO: 1245\r\n\r\nMOTOR:\r\nMARCA: JUKI\r\nSERIE: A-758972\r\n\r\nCON MESON DE MADERA DE 0,79M X 1,22M X 0,54M\r\n', '04-005', '2014-02-07 15:02:46', '2014-02-07 15:02:04'),
	(4, '04-051', '', '30.06.04.00051', 5, '', 13, 6, 1, 4, 14, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 1, 1, '1 GLB.\r\n\r\nMAQUINA\r\nMARCA: BUTTERFLY\r\nMODELO: S25- 1\r\nSERIE: 9311253\r\n\r\nMOTOR\r\nMARCA: HOHSING\r\nSERIE: M7111002\r\n\r\nCON MESA FORRADA CON FORMICA COLOR PLOMO\r\n', '04-051', '2014-02-07 15:02:58', '2014-02-07 15:02:26'),
	(5, '04-067', '', '30.06.04.00067', 5, '', 12, 6, 1, 3, 14, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 1, 1, '1 GLB.\r\n\r\nMAQUINA\r\nMARCA: ADLER\r\nMODELO: 69-372\r\nSERIE: 16090\r\n\r\nMOTOR\r\nMARCA: ZOJE\r\nSERIE: 8228\r\n', '04-067', '2014-02-07 15:02:43', '2014-02-07 15:02:39'),
	(6, '04-068', '', '30.06.04.00068', 5, '', 12, 6, 1, 3, 14, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 1, 1, '1 GLB.\r\nMAQUINA:\r\nMARCA: ADLER\r\nMODELO: 69-372\r\nSERIE: 10105\r\n\r\nMOTOR\r\nMARCA: ZOJE\r\nSERIE: 8112273\r\n', '04-068', '2014-02-07 15:02:01', '2014-02-07 15:02:02'),
	(7, '04-069', '', '30.06.04.00069', 5, '', 12, 6, 1, 3, 14, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 1, 1, '1 GLB.\r\n\r\nMAQUINA\r\nMARCA: ADLER\r\nMODELO: 69-372\r\nSERIE: 15491\r\n\r\nMOTOR\r\nMARCA: ZOJE\r\nSERIE: 8859\r\n', '04-069', '2014-02-07 15:02:30', NULL),
	(8, '04-070', '', '30.06.04.00070', 5, '', 10, 6, 1, 3, 14, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 1, 1, '1 GLB.\r\n\r\nMAQUINA\r\nMARCA: PFAFF\r\nMODELO: 335-H3\r\nSERIE: 515448\r\n\r\nMOTOR\r\nMARCA: ZOJE\r\nSERIE: 47565\r\n', '04-070', '2014-02-07 16:02:39', NULL),
	(9, '04-071', '', '30.06.04.00071', 5, '', 14, 6, 1, 6, 14, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 1, 1, '1 GLB.\r\n\r\nMAQUINA\r\nMARCA: JUKY\r\nMODELO: DDL-5550 HG\r\n', '04-071', '2014-02-07 16:02:14', NULL),
	(10, '04-093', '', '30.06.04.00093', 5, 'Maquina de costura plana', 13, 6, 1, 4, 15, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA\r\nMARCA: BUTTERFLY\r\nMODELO: GC25- 1\r\nSERIE: 96040506\r\n\r\nMOTOR\r\nMARCA: HOHSING\r\nSERIE: 06183502\r\n\r\nEn buen estado, puesta a punto y con las piezas completas.\r\nMesa de madera forrada con fornica.\r\n', '04-093', '2014-02-07 16:02:12', '2014-02-07 16:02:15'),
	(11, '04-154', '', '30.06.04.00154', 5, 'Maquina de costura plana', 15, 6, 1, 4, 15, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 1, 1, '1 GLB.\r\n\r\nMAQUINA\r\nMARCA: FDM\r\n\r\nMOTOR\r\nSERIE: # 312698\r\n', '04-154', '2014-02-07 16:02:04', '2014-02-07 16:02:20'),
	(12, '04-159', '', '30.06.04.00159', 5, 'Maquina de costura plana', 15, 6, 1, 4, 15, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA\r\nMARCA: FDM\r\n\r\nMOTOR\r\nSERIE: # 312677\r\n', '04-159', '2014-02-07 16:02:29', '2014-02-07 16:02:38'),
	(13, '04-079', '', '30.10.04.00079', 5, 'Maquina de costura plana', 16, 6, 1, 6, 5, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA\r\nMARCA: CONSEW\r\nMODELO: 231-H\r\nSERIE: K1923G\r\n', '04-079', '2014-02-07 16:02:34', '2014-02-07 16:02:48'),
	(14, '04-080', '', '30.10.04.00080', 5, 'Maquina de costura plana', 16, 6, 1, 6, 5, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA\r\nMARCA: CONSEW\r\nMODELO: 231-H\r\nSERIE: K1972G\r\n', '04-080', '2014-02-07 16:02:09', NULL),
	(15, '04-150', '', '30.10.04.00150', 5, 'Maquina de costura plana', 15, 6, 9, 4, 15, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA\r\nMARCA: FDM\r\n\r\nMOTOR\r\nSERIE: # 031216767\r\n', '04-150', '2014-02-07 16:02:14', '2014-02-07 16:02:00'),
	(16, '04-155', '', '30.10.04.00155', 5, 'Maquina de costura plana', 15, 6, 1, 4, 7, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA\r\nMARCA: FDM\r\n\r\nMOTOR:\r\nSERIE: # 312674\r\n', '04-155', '2014-02-07 16:02:46', NULL),
	(17, '04-004', '', '30.11.04.00004', 5, 'Maquina de costura Over Lock', 17, 6, 1, 6, 15, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA\r\nMARCA: SIRUBA\r\nSERIE: 4072134L\r\nMODELO: 757 F-516H2-56\r\n\r\nMOTOR\r\nMARCA: HOHSING\r\nSERIE: E- 1106969\r\n\r\nCON MESON DE MADERA DE 0,77M X 1,21M X 0,50M', '04-004', '2014-02-07 16:02:00', NULL),
	(18, '04-062', '', '30.11.04.00062', 5, 'Maquina de costura triple', 10, 6, 1, 3, 5, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA\r\nMARCA: PFAFF\r\nMODELO: 1245 -6/01\r\nSERIE: 2571694\r\n\r\nMOTOR\r\nMARCA: HOHSING\r\nMODELO: CL 1221\r\nSERIE: E1107000\r\n', '04-062', '2014-02-07 16:02:46', NULL),
	(19, '04-085', '', '30.11.04.00085', 5, 'Maquina de costura TUBO', 10, 6, 9, 3, 5, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA\r\nMARCA: PFAFF\r\nMODELO: 335-G\r\nSERIE: 507545\r\n\r\nMOTOR\r\nMARCA: HOHSING\r\nSERIE: A636210\r\n', '04-085', '2014-02-07 17:02:35', '2014-02-07 17:02:02'),
	(20, '04-088', '', '30.11.04.00088', 5, 'Maquina de costura TUBO', 10, 6, 1, 3, 5, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA\r\nMARCA: PFAFF\r\nMODELO: 335-G\r\nSERIE: 538120\r\n\r\nMOTOR\r\nMARCA: ZOJE\r\nSERIE: 8329\r\n', '04-088', '2014-02-07 17:02:51', NULL),
	(21, '04-101', '', '30.11.04.00101', 5, 'Maquina de costura TUBO', 18, 6, 2, 5, 15, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA\r\nMARCA: TIPPMANN\r\nMODELO: PNF\r\nSERIE: 650\r\nCOLOR: NEGRO\r\n\r\nCON MESA METALICA COLOR PLOMO\r\n', '04-101', '2014-02-07 17:02:41', NULL),
	(22, '04-117', '', '30.11.04.00117', 5, 'Maquina de costura NEUMATICA y de POSTE', 12, 6, 1, 3, 15, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA\r\nMARCA: SADA DURKOPP ADLER\r\nMODELO: 267 C/SA\r\n\r\nMOTOR\r\nMARCA: COMELZ ARGO 42/A ADK 505', '04-117', '2014-02-07 17:02:29', '2014-02-07 17:02:23'),
	(23, '04-143', '', '30.11.04.00143', 5, 'Maquina de costura PLANA', 15, 6, 1, 4, 7, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA\r\nMARCA: FDM\r\n\r\nMOTOR\r\nSERIE: # 031216506\r\n', '04-143', '2014-02-07 17:02:34', NULL),
	(24, '04-146', '', '30.11.04.00146', 5, 'Maquina de costura PLANA', 15, 6, 1, 4, 15, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA\r\nMARCA: FDM\r\n\r\nMOTOR\r\nSERIE: # 031216720', '04-146', '2014-02-07 17:02:58', NULL),
	(25, '04-148', '', '30.11.04.00148', 5, 'Maquina de costura PLANA', 15, 6, 1, 4, 15, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA\r\nMARCA: FDM\r\n\r\nMOTOR\r\nSERIE: # 031216757', '04-148', '2014-02-07 17:02:52', NULL),
	(26, '04-053', '', '30.12.04.00053', 5, 'Maquina costura TUBO', 19, 6, 1, 7, 15, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA DE COSER\r\nMARCA: SUNSTAR\r\nMODELO: KM-380\r\nSERIE: 92070380\r\n\r\nMOTOR\r\nMARCA: HOHSING\r\nSERIE: A-363438\r\n\r\nCON MESA DE MADERA FORRADO CON FORMICA CREMA\r\n', '04-053', '2014-02-07 17:02:10', NULL),
	(27, '04-054', '', '30.12.04.00054', 5, 'Maquina de costura TUBO', 19, 6, 1, 7, 15, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA DE COSER\r\nMARCA: SUNSTAR\r\nMODELO: KM-380\r\nSERIE: 95021232\r\n\r\nMOTOR\r\nMARCA: SUNSTAR\r\nSERIE: 52243\r\n\r\nCON MESA DE MADERA FORRADO CON FORMICA CREMA\r\n', '04-054', '2014-02-07 17:02:51', NULL),
	(28, '04-055', '', '30.12.04.00055', 5, 'Maquina de costura TUBO', 19, 6, 1, 7, 7, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA DE COSER\r\nMARCA: SUNSTAR\r\nMODELO: KM-380\r\nSERIE: 97034146\r\n\r\nMOTOR\r\nMARCA: HOHSING\r\nSERIE: A-686538\r\n\r\nCON MESA DE MADERA FORRADO CON FORMICA CREMA\r\n', '04-055', '2014-02-07 17:02:49', NULL),
	(29, '04-064', '', '30.12.04.00064', 5, 'Maquina de costura TRIPLE', 10, 6, 1, 3, 16, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA DE COSER\r\nMARCA: PFAFF\r\nMODELO: 1245-6/01\r\nSERIE: 2571692\r\n\r\nMOTOR\r\nMARCA: HOHSING\r\nMODELO: CL 1221\r\nSERIE: E-1106835', '04-064', '2014-02-07 17:02:34', NULL),
	(30, '04-086', '', '30.12.04.00086', 5, 'Maquina de costura TUBO', 10, 6, 1, 3, 15, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nMAQUINA DE COSER\r\nMARCA: PFAFF\r\nMODELO: 335-G\r\nSERIE: 508524\r\n\r\nMOTOR\r\nMARCA: JUKI\r\nSERIE: A700897\r\n', '04-086', '2014-02-07 17:02:15', NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- Dumping data for table inventory.item_brand: ~19 rows (approximately)
DELETE FROM `item_brand`;
/*!40000 ALTER TABLE `item_brand` DISABLE KEYS */;
INSERT INTO `item_brand` (`id`, `name`) VALUES
	(1, '- Seleccionar -'),
	(2, 'SONY'),
	(3, 'SAMSUNG'),
	(4, 'TOYOTA'),
	(5, 'FIAT'),
	(6, 'LG'),
	(7, 'DELL'),
	(8, 'HP'),
	(9, 'ACER'),
	(10, 'PFAFF'),
	(11, 'No hay dato'),
	(12, 'ADLER'),
	(13, 'BUTTERFLY'),
	(14, 'JUKY'),
	(15, 'FDM'),
	(16, 'CONSEW'),
	(17, 'SIRUBA'),
	(18, 'TIPPMANN'),
	(19, 'SUNSTAR');
/*!40000 ALTER TABLE `item_brand` ENABLE KEYS */;


-- Dumping structure for table inventory.item_color
DROP TABLE IF EXISTS `item_color`;
CREATE TABLE IF NOT EXISTS `item_color` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Dumping data for table inventory.item_color: ~9 rows (approximately)
DELETE FROM `item_color`;
/*!40000 ALTER TABLE `item_color` DISABLE KEYS */;
INSERT INTO `item_color` (`id`, `name`) VALUES
	(1, '- Seleccionar -'),
	(2, 'Negro'),
	(3, 'Azul'),
	(4, 'Blanco'),
	(5, 'Amarillo'),
	(6, 'Verde'),
	(7, 'No hay dato'),
	(8, 'Beige'),
	(9, 'Plomo');
/*!40000 ALTER TABLE `item_color` ENABLE KEYS */;


-- Dumping structure for table inventory.item_condition
DROP TABLE IF EXISTS `item_condition`;
CREATE TABLE IF NOT EXISTS `item_condition` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Dumping data for table inventory.item_condition: ~7 rows (approximately)
DELETE FROM `item_condition`;
/*!40000 ALTER TABLE `item_condition` DISABLE KEYS */;
INSERT INTO `item_condition` (`id`, `name`, `description`) VALUES
	(1, '- Seleccionar -', NULL),
	(2, '1 - Nuevo', NULL),
	(3, '2 - Buen estado', NULL),
	(4, '3 - Medio uso', NULL),
	(6, '4 - Dañado', NULL),
	(7, '5 - Inservible', NULL),
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

-- Dumping data for table inventory.item_location: ~18 rows (approximately)
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
	(15, 'Area línea producción', NULL),
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

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
