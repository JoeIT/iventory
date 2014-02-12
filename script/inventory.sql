-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.11 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             8.3.0.4694
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
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8;

-- Dumping data for table inventory.item: ~191 rows (approximately)
DELETE FROM `item`;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` (`id`, `code`, `new_code`, `accounting_code`, `type_id`, `name`, `brand_id`, `material_id`, `color_id`, `origin_id`, `location_id`, `owner_id`, `quantity`, `unit_cost`, `minimum_cost`, `expected_cost`, `sales_cost`, `condition_id`, `availability_id`, `comment`, `photo_dir`, `creation_date`, `modified_date`) VALUES
	(1, '04-001', '', '40.06.04.00001', 5, 'Maquina de costura triple brazo largo', 10, 6, 8, 3, 15, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA:\r\nBRAZO LARGO\r\nMARCA: PFAFF\r\nSERIE: 533860\r\n\r\nMOTOR:\r\nMARCA: ZOJE\r\nSERIE: 8123272\r\n\r\nMESON CON BASE METALICA DE 0,77M X 1,53M X 0,61M COLOR PLOMO', '04-001', '2014-02-05 15:02:25', '2014-02-07 15:02:54'),
	(2, '04-002', '', '30.06.04.00002', 5, 'Maquina de costura TRIPLE', 10, 6, 4, 3, 15, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\nMAQUINA DE COSER:\r\nMARCA: PFAFF\r\nSERIE: 509785\r\nMODELO: 1245\r\n\r\nMOTOR:\r\nMARCA: HOHSING\r\nSERIE: A-803311\r\n\r\nCON MESON DE MADERA DE 0,80M X 1,22M X 0,54M COLOR BLANCO', '04-002', '2014-02-06 17:02:47', '2014-02-10 11:02:11'),
	(3, '04-005', '', '30.06.04.00005', 5, 'Maquina de costura TRIPLE', 10, 6, 8, 3, 15, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA:\r\nMARCA: PFAFF\r\nSERIE: 509786\r\nMODELO: 1245\r\n\r\nMOTOR:\r\nMARCA: JUKI\r\nSERIE: A-758972\r\n\r\nCON MESON DE MADERA DE 0,79M X 1,22M X 0,54M\r\n', '04-005', '2014-02-07 15:02:46', '2014-02-10 13:02:41'),
	(4, '04-051', '', '30.06.04.00051', 5, '', 13, 6, 1, 4, 14, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 1, 1, '1 GLB.\r\n\r\nMAQUINA\r\nMARCA: BUTTERFLY\r\nMODELO: S25- 1\r\nSERIE: 9311253\r\n\r\nMOTOR\r\nMARCA: HOHSING\r\nSERIE: M7111002\r\n\r\nCON MESA FORRADA CON FORMICA COLOR PLOMO\r\n', '04-051', '2014-02-07 15:02:58', '2014-02-07 15:02:26'),
	(5, '04-067', '', '30.06.04.00067', 5, '', 12, 6, 1, 3, 14, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 1, 1, '1 GLB.\r\n\r\nMAQUINA\r\nMARCA: ADLER\r\nMODELO: 69-372\r\nSERIE: 16090\r\n\r\nMOTOR\r\nMARCA: ZOJE\r\nSERIE: 8228\r\n', '04-067', '2014-02-07 15:02:43', '2014-02-07 15:02:39'),
	(6, '04-068', '', '30.06.04.00068', 5, '', 12, 6, 1, 3, 14, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 1, 1, '1 GLB.\r\nMAQUINA:\r\nMARCA: ADLER\r\nMODELO: 69-372\r\nSERIE: 10105\r\n\r\nMOTOR\r\nMARCA: ZOJE\r\nSERIE: 8112273\r\n', '04-068', '2014-02-07 15:02:01', '2014-02-07 15:02:02'),
	(7, '04-069', '', '30.06.04.00069', 5, '', 12, 6, 1, 3, 14, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 1, 1, '1 GLB.\r\n\r\nMAQUINA\r\nMARCA: ADLER\r\nMODELO: 69-372\r\nSERIE: 15491\r\n\r\nMOTOR\r\nMARCA: ZOJE\r\nSERIE: 8859\r\n', '04-069', '2014-02-07 15:02:30', NULL),
	(8, '04-070', '', '30.06.04.00070', 5, '', 10, 6, 1, 3, 14, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 1, 1, '1 GLB.\r\n\r\nMAQUINA\r\nMARCA: PFAFF\r\nMODELO: 335-H3\r\nSERIE: 515448\r\n\r\nMOTOR\r\nMARCA: ZOJE\r\nSERIE: 47565\r\n', '04-070', '2014-02-07 16:02:39', NULL),
	(9, '04-071', '', '30.06.04.00071', 5, '', 14, 6, 1, 6, 14, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 1, 1, '1 GLB.\r\n\r\nMAQUINA\r\nMARCA: JUKY\r\nMODELO: DDL-5550 HG\r\n', '04-071', '2014-02-07 16:02:14', NULL),
	(10, '04-093', '', '30.06.04.00093', 5, 'Maquina de costura PLANA', 13, 6, 1, 4, 15, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA\r\nMARCA: BUTTERFLY\r\nMODELO: GC25- 1\r\nSERIE: 96040506\r\n\r\nMOTOR\r\nMARCA: HOHSING\r\nSERIE: 06183502\r\n\r\nEn buen estado, puesta a punto y con las piezas completas.\r\nMesa de madera forrada con fornica.\r\n', '04-093', '2014-02-07 16:02:12', '2014-02-10 13:02:30'),
	(11, '04-154', '', '30.06.04.00154', 5, 'Maquina de costura PLANA', 15, 6, 1, 4, 15, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 1, 1, '1 GLB.\r\n\r\nMAQUINA\r\nMARCA: FDM\r\n\r\nMOTOR\r\nSERIE: # 312698\r\n', '04-154', '2014-02-07 16:02:04', '2014-02-10 13:02:00'),
	(12, '04-159', '', '30.06.04.00159', 5, 'Maquina de costura plana', 15, 6, 1, 4, 15, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA\r\nMARCA: FDM\r\n\r\nMOTOR\r\nSERIE: # 312677\r\n', '04-159', '2014-02-07 16:02:29', '2014-02-07 16:02:38'),
	(13, '04-079', '', '30.10.04.00079', 5, 'Maquina de costura PLANA', 16, 6, 1, 6, 5, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA\r\nMARCA: CONSEW\r\nMODELO: 231-H\r\nSERIE: K1923G\r\n', '04-079', '2014-02-07 16:02:34', '2014-02-10 13:02:11'),
	(14, '04-080', '', '30.10.04.00080', 5, 'Maquina de costura PLANA', 16, 6, 1, 6, 5, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA\r\nMARCA: CONSEW\r\nMODELO: 231-H\r\nSERIE: K1972G\r\n', '04-080', '2014-02-07 16:02:09', '2014-02-10 13:02:30'),
	(15, '04-150', '', '30.10.04.00150', 5, 'Maquina de costura PLANA', 15, 6, 9, 4, 15, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA\r\nMARCA: FDM\r\n\r\nMOTOR\r\nSERIE: # 031216767\r\n', '04-150', '2014-02-07 16:02:14', '2014-02-10 13:02:58'),
	(16, '04-155', '', '30.10.04.00155', 5, 'Maquina de costura plana', 15, 6, 1, 4, 7, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA\r\nMARCA: FDM\r\n\r\nMOTOR:\r\nSERIE: # 312674\r\n', '04-155', '2014-02-07 16:02:46', NULL),
	(17, '04-004', '', '30.11.04.00004', 5, 'Maquina de costura Over Lock', 17, 6, 1, 6, 15, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA\r\nMARCA: SIRUBA\r\nSERIE: 4072134L\r\nMODELO: 757 F-516H2-56\r\n\r\nMOTOR\r\nMARCA: HOHSING\r\nSERIE: E- 1106969\r\n\r\nCON MESON DE MADERA DE 0,77M X 1,21M X 0,50M', '04-004', '2014-02-07 16:02:00', NULL),
	(18, '04-062', '', '30.11.04.00062', 5, 'Maquina de costura TRIPLE', 10, 6, 1, 3, 5, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA\r\nMARCA: PFAFF\r\nMODELO: 1245 -6/01\r\nSERIE: 2571694\r\n\r\nMOTOR\r\nMARCA: HOHSING\r\nMODELO: CL 1221\r\nSERIE: E1107000\r\n', '04-062', '2014-02-07 16:02:46', '2014-02-10 13:02:23'),
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
	(30, '04-086', '', '30.12.04.00086', 5, 'Maquina de costura TUBO', 10, 6, 1, 3, 15, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nMAQUINA DE COSER\r\nMARCA: PFAFF\r\nMODELO: 335-G\r\nSERIE: 508524\r\n\r\nMOTOR\r\nMARCA: JUKI\r\nSERIE: A700897\r\n', '04-086', '2014-02-07 17:02:15', NULL),
	(31, '04-087', '', '30.12.04.00087', 5, 'Maquina de costura TUBO', 10, 6, 1, 3, 15, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nMAQUINA DE COSER\r\nMARCA: PFAFF\r\nMODELO: 335-G\r\nSERIE: 503780\r\n\r\nMOTOR\r\nMARCA: JUKI\r\nSERIE: A71 G009\r\n', '04-087', '2014-02-10 09:02:26', '2014-02-10 09:02:43'),
	(32, '04-092', '', '30.12.04.00092', 5, 'Maquina de costura ZIGZAG', 20, 6, 1, 6, 7, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA DE COSER\r\nMARCA: SINGER\r\nSERIE: U941105017\r\n\r\nMOTOR\r\nMARCA: HOGSING\r\nSERIE: A472037\r\n', '04-092', '2014-02-10 09:02:42', NULL),
	(33, '04-142', '', '30.12.04.00142', 5, 'Maquina de costura PLANA', 15, 6, 1, 4, 7, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA DE COSER\r\nMARCA: FDM\r\n\r\nMOTOR\r\nSERIE: # 031216512', '04-142', '2014-02-10 09:02:47', NULL),
	(34, '04-144', '', '30.12.04.00144', 5, 'Maquina de costura PLANA', 15, 6, 1, 4, 7, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA DE COSER\r\nMARCA: FDM\r\n\r\nMOTOR\r\nSERIE: # 031216701\r\n', '04-144', '2014-02-10 09:02:03', NULL),
	(35, '04-145', '', '30.12.04.00145', 5, 'Maquina de costura PLANA', 15, 6, 1, 4, 15, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA DE COSER\r\nMARCA: FDM\r\n\r\nMOTOR\r\nSERIE: # 031216716\r\n', '04-145', '2014-02-10 09:02:37', NULL),
	(36, '04-147', '', '30.12.04.00147', 5, 'Maquina de costura PLANA', 15, 6, 1, 4, 7, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA DE COSER\r\nMARCA: FDM\r\n\r\nMOTOR\r\nSERIE: # 031216721\r\n', '04-147', '2014-02-10 09:02:35', NULL),
	(37, '04-149', '', '30.12.04.00149', 5, 'Maquina de costura PLANA', 15, 6, 1, 4, 15, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA DE COSER\r\nMARCA: FDM\r\n\r\nMOTOR\r\nSERIE: # 031216766', '04-149', '2014-02-10 09:02:34', NULL),
	(38, '04-151', '', '30.12.04.00151', 5, 'Maquina de costura PLANA', 15, 6, 1, 4, 15, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA DE COSER\r\nMARCA: FDM\r\n\r\nMOTOR\r\nSERIE: # 031216492', '04-151', '2014-02-10 09:02:24', NULL),
	(39, '04-152', '', '30.12.04.00152', 5, 'Maquina de costura PLANA', 15, 6, 1, 4, 7, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA DE COSER\r\nMARCA: FDM\r\n\r\nMOTOR\r\nSERIE: # 312680', '04-152', '2014-02-10 09:02:35', '2014-02-10 09:02:10'),
	(40, '04-153', '', '30.12.04.00153', 5, 'Maquina de costura PLANA', 15, 6, 1, 4, 16, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA DE COSER\r\nMARCA: FDM\r\n\r\nMOTOR\r\nSERIE: # 312674', '04-153', '2014-02-10 09:02:48', NULL),
	(41, '04-156', '', '30.12.04.00156', 5, 'Maquina de costura PLANA', 15, 6, 1, 4, 15, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA DE COSER\r\nMARCA: FDM\r\n\r\nMOTOR\r\nSERIE: # 312669', '04-156', '2014-02-10 09:02:45', NULL),
	(42, '04-158', '', '30.12.04.00158', 5, 'Maquina de costura PLANA', 15, 6, 1, 4, 15, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA DE COSER\r\nMARCA: FDM\r\n\r\nMOTOR\r\nSERIE: # 312674', '04-158', '2014-02-10 10:02:06', NULL),
	(43, '04-160', '', '30.12.04.00160', 5, 'Maquina de costura PLANA', 15, 6, 1, 4, 15, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA DE COSER\r\nMARCA: FDM\r\n\r\nMOTOR:\r\nSERIE: # 312672', '04-160', '2014-02-10 10:02:02', NULL),
	(44, '04-161', '', '30.12.04.00161', 5, 'Maquina de costura PLANA', 15, 6, 1, 4, 7, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA DE COSER\r\nMARCA: FDM\r\n\r\nMOTOR\r\nSERIE: # 312677', '04-161', '2014-02-10 10:02:21', NULL),
	(45, '04-162', '', '30.12.04.00162', 5, 'Maquina de costura PLANA', 15, 6, 1, 4, 15, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA DE COSER\r\nMARCA: FDM\r\n\r\nMOTOR\r\nSERIE: # 312695', '04-162', '2014-02-10 10:02:12', NULL),
	(46, '04-163', '', '30.12.04.00163', 5, 'Maquina de costura PLANA', 15, 6, 1, 4, 15, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA DE COSER\r\nMARCA: FDM\r\n\r\nMOTOR\r\nSERIE: # 312698', '04-163', '2014-02-10 10:02:09', NULL),
	(47, '04-164', '', '30.12.04.00164', 5, 'Maquina de costura PLANA', 15, 6, 1, 4, 9, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA DE COSER\r\nMARCA: FDM\r\n\r\nMOTOR\r\nSERIE: # 312679', '04-164', '2014-02-10 10:02:48', NULL),
	(48, '04-165', '', '30.12.04.00165', 5, 'Maquina de costura PLANA', 15, 6, 1, 4, 15, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA DE COSER\r\nMARCA: FDM\r\n\r\nMOTOR\r\nSERIE: # 312672', '04-165', '2014-02-10 10:02:26', NULL),
	(49, '04-166', '', '30.12.04.00166', 5, 'Maquina de costura TRIPLE', 15, 6, 1, 4, 5, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA DE COSER\r\nMARCA: FDM\r\n\r\nMOTOR\r\nSERIE: # 031216728', '04-166', '2014-02-10 10:02:29', NULL),
	(50, '04-172', '', '30.12.04.00172', 5, '', 10, 6, 1, 3, 16, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMOTOR Y MESA PARA MAQUINA PFAFF # 02572109', '04-172', '2014-02-10 10:02:52', NULL),
	(51, '04-173', '', '30.12.04.00173', 5, 'Maquina de costura TUBO', 10, 6, 1, 3, 15, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMOTOR Y MESA PARA MAQUINA PFAFF # 02566785', '04-173', '2014-02-10 10:02:42', NULL),
	(52, '04-040', '', '30.14.04.00040', 5, 'Maquina de costura TUBO', 10, 6, 1, 3, 6, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 2, 1, '1 GLB.\r\n\r\nCABEZAL MAQUINA MARCA PFAFF MOTOR 2566792 (EN CAJA)', '04-040', '2014-02-10 10:02:11', NULL),
	(53, '04-042', '', '30.14.04.00042', 5, 'Maquina de costura TRIPLE', 10, 6, 1, 3, 6, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 2, 1, '1 GLB.\r\n\r\nCABEZAL MAQUINA MARCA PFAFF MOTOR 2566791 (EN CAJA)', '04-042', '2014-02-10 10:02:53', NULL),
	(54, '04-043', '', '30.14.04.00043', 5, 'Maquina de costura TRIPLE', 10, 6, 1, 3, 6, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 2, 1, '1 GLB.\r\n\r\nMOTOR PARA MAQUINA DE COSER MARCA PFAFF NO. 2563836 (EN CAJA)', '04-043', '2014-02-10 10:02:28', NULL),
	(55, '04-049', '', '40.06.04.00049', 5, 'Maquina de costura TUBO', 10, 6, 1, 3, 7, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA DE COSER\r\nMARCA: PFAFF DE POSTE\r\nMODELO: 595-H3-6/01\r\nSERIE: 584761', '04-049', '2014-02-10 10:02:28', '2014-02-10 11:02:58'),
	(56, '04-056', '', '40.06.04.00056', 5, 'Maquina de costura ZAPATERIA', 21, 6, 1, 4, 7, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA DE COSER\r\nMARCA: TAKING\r\nMODELO: TK-2971\r\nSERIE: 29710222\r\n\r\nMOTOR\r\nMARCA: FREMOTOR\r\nMODELO: "N"\r\nSERIE: 12043', '04-056', '2014-02-10 10:02:27', '2014-02-10 11:02:40'),
	(57, '04-057', '', '40.06.04.00057', 5, 'Maquina de costura TUBO', 10, 6, 1, 3, 1, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA DE COSER\r\nMARCA: PFAFF\r\nMODELO: 595-H3- 6/01\r\nSERIE: 584774\r\n\r\nMOTOR\r\nMARCA: ZOJE\r\nSERIE: 0047966', '04-057', '2014-02-10 10:02:21', '2014-02-10 11:02:12'),
	(58, '04-066', '', '40.06.04.00066', 5, 'Maquina de costura TRIPLE', 10, 6, 1, 3, 15, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA DE COSER\r\nMARCA: PFAFF\r\nMODELO: 1245 -6/01\r\nSERIE: 2571695\r\n\r\nMOTOR\r\nMARCA: HOHSING\r\nSERIE: E-1106006', '04-066', '2014-02-10 10:02:43', '2014-02-10 11:02:32'),
	(59, '04-116', '', '40.06.04.00116', 5, 'Maquina de costura de BRAZO', 12, 6, 1, 3, 7, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA DE COSER\r\nMARCA: SADA DURKOPP ADLER\r\nMODELO: 267 C/SA\r\n\r\nMOTOR\r\nMARCA: COMELZ ARGO 42/A ADK 504', '04-116', '2014-02-10 11:02:33', '2014-02-10 11:02:24'),
	(60, '04-00003', '', '40.16.04.00003', 5, 'Maquina de costura TRIPLE', 10, 6, 1, 3, 1, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA DE COSER\r\nMARCA: PFAFF\r\nSERIE: 2571691\r\nMODELO: 1245\r\n\r\nMOTOR\r\nMARCA: HOHSING\r\nSERIE: E-1106940\r\n\r\nCON MESON DE MADERA DE 0,80M X 1,20M X 0,55M COLORBLANCO', '04-00003', '2014-02-10 11:02:51', '2014-02-10 11:02:06'),
	(61, '04-063', '', '40.16.04.00063', 5, 'Maquina de costura TRIPLE', 10, 6, 1, 3, 16, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nMAQUINA DE COSER\r\nMARCA: PFAFF\r\nMODELO: 1245 -6/01\r\nSERIE: 2571693\r\n\r\nMOTOR\r\nMARCA: HOHSING\r\nMODELO: CL 1221\r\nSERIE: E1106457', '04-063', '2014-02-10 11:02:49', NULL),
	(62, '03-007', '', '20.18.03.00007', 10, 'Telefono', 22, 5, 4, 6, 11, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 4, 1, 'TELEFONO\r\nMARCA: PANASONIC\r\nModelo: KX-T7730', '03-007', '2014-02-10 11:02:09', '2014-02-10 17:02:28'),
	(63, '03-232', '', '20.09.03.00232', 3, 'Mesa de escritorio', 11, 3, 10, 19, 2, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, 'Mesa pequeÃ±a tipo escritorio de 90cm largo x 40cm ancho x 72cm alto.', '03-232', '2014-02-10 14:02:37', '2014-02-12 09:02:34'),
	(64, 'X-0002', '', '', 3, 'Vitrina', 11, 3, 10, 19, 2, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, 'Vitrina:\r\n2 puertas superiores de vidrio\r\n2 cajones medios de madera\r\n2 puertas de madera inferiores', 'X-0002', '2014-02-10 14:02:55', '2014-02-11 12:02:11'),
	(65, 'X-0003', '', '', 12, 'Muestrario', 11, 6, 10, 19, 2, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, 'Muestrario de armazÃ³n metÃ¡lico y barras transversales de madera.', 'X-0003', '2014-02-10 14:02:31', '2014-02-11 12:02:17'),
	(66, 'X-0004', '', '', 12, 'Muestrario', 1, 8, 4, 1, 2, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, 'Muestrario de cartÃ³n prensado, con ganchos metÃ¡licos plateados.', 'X-0004', '2014-02-10 14:02:54', '2014-02-11 12:02:27'),
	(67, 'P-030', '', '', 10, 'Televisor ', 23, 10, 2, 5, 2, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, 'Marca: RCA\r\nModelo: MCR66R400\r\nTamaÃ±o: 25 pulgadas\r\n\r\nCon control remoto color blanco.', 'P-030', '2014-02-10 14:02:37', '2014-02-12 11:02:08'),
	(68, 'X-0005', '', '', 10, 'Receptor de seÃ±al satelital', 25, 10, 2, 7, 2, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, 'Receptor de seÃ±al satelital, con control remoto color negro.', 'X-0005', '2014-02-10 14:02:31', '2014-02-11 12:02:02'),
	(69, 'S-008', '', '', 3, 'Armario para televisor y mini componente', 11, 9, 2, 1, 2, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, 'Armario para televisor y mini componente, con divisiones laterales, frente de vidrio con una puerta.', 'S-008', '2014-02-10 14:02:50', NULL),
	(70, 'X-0006', '', '', 12, 'Pantalla para proyectar imagen', 26, 5, 2, 5, 2, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, 'Pantalla para proyectar imÃ¡genes, colo blanco, con armazÃ³n y marco color negro.', 'X-0006', '2014-02-10 15:02:02', '2014-02-11 12:02:12'),
	(71, 'S-022', '', '', 3, 'Mesita', 1, 1, 1, 1, 2, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, 'Mesita pequeÃ±a de 100cm largo x 34cm ancho x 41cm alto.', 'S-022', '2014-02-10 15:02:12', NULL),
	(72, '03-278', '', '', 12, 'Pizarra acrÃ­lica', 11, 11, 4, 19, 2, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, 'Pizarra acrÃ­lica de 80cm alto x 120cm alto.', '03-278', '2014-02-10 15:02:38', NULL),
	(73, 'S-226', '', '', 3, 'Mesa para proyectora', 11, 6, 4, 19, 2, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, 'Mesita para ubicar la proyectora y accesorios de 50cm x 50cm de base, con 86cm de alto.', 'S-226', '2014-02-10 15:02:51', NULL),
	(74, '03-242', '', '', 3, 'Silla giratoria', 11, 10, 9, 19, 2, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, 'Silla giratoria\r\nPlomo, ajustable en altura y con 5 patas con ruedas.', '03-242', '2014-02-10 16:02:32', '2014-02-10 16:02:56'),
	(75, '03-247', '', '20.09.03.00247', 3, 'Silla giratoria', 11, 10, 9, 19, 2, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, 'Silla giratoria\r\nPlomo, ajustable en altura y con 5 patas con ruedas.', '03-247', '2014-02-10 16:02:44', '2014-02-12 11:02:09'),
	(76, '03-244', '', '', 3, 'Silla giratoria', 11, 10, 9, 19, 2, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, 'Silla giratoria\r\nPlomo, ajustable en altura y con 5 patas con ruedas.', '03-244', '2014-02-10 16:02:52', NULL),
	(77, '03-241', '', '', 3, 'Silla giratoria', 11, 10, 9, 19, 2, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, 'Silla giratoria\r\nPlomo, ajustable en altura y con 5 patas con ruedas.', '03-241', '2014-02-10 16:02:54', NULL),
	(78, 'X-0007', '', '', 3, 'Silla giratoria', 11, 10, 9, 19, 2, 4, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, 'Silla giratoria\r\nPlomo, ajustable en altura y con 5 patas con ruedas.', 'X-0007', '2014-02-10 16:02:39', '2014-02-11 12:02:21'),
	(79, '03-239', '', '', 3, 'Silla giratoria', 11, 10, 9, 19, 2, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, 'Silla giratoria\r\nPlomo, ajustable en altura y con 5 patas con ruedas.', '03-239', '2014-02-10 16:02:28', NULL),
	(80, '03-245', '', '', 3, 'Silla giratoria', 11, 10, 9, 19, 2, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, 'Silla giratoria\r\nPlomo, ajustable en altura y con 5 patas con ruedas.', '03-245', '2014-02-10 16:02:58', NULL),
	(81, '03-246', '', '', 3, 'Silla giratoria', 11, 10, 9, 19, 2, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, 'Silla giratoria\r\nPlomo, ajustable en altura y con 5 patas con ruedas.', '03-246', '2014-02-10 16:02:15', NULL),
	(82, '03-243', '', '', 3, 'Silla giratoria', 11, 10, 9, 19, 2, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, 'Silla giratoria\r\nPlomo, ajustable en altura y con 5 patas con ruedas.', '03-243', '2014-02-10 16:02:30', NULL),
	(83, '03-186', '', '', 3, 'Silla giratoria', 11, 10, 2, 19, 2, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, 'Silla giratoria.\r\nCon espaldar alto, color negro, ajustable en altura y con 5 patas con ruedas.', '03-186', '2014-02-10 16:02:15', '2014-02-10 16:02:49'),
	(84, '03-199', '', '', 3, 'Silla giratoria', 11, 10, 2, 19, 2, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 6, 1, 'Silla giratoria.\r\nCon espaldar pequeÃ±o, algo daÃ±ado, color negro, ajustable en altura y con 5 patas con ruedas.', '03-199', '2014-02-10 16:02:58', NULL),
	(85, '03-210', '', '10.01.03.00210', 3, 'MesÃ³n de trabajo trapezoidal', 11, 12, 4, 19, 2, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, 'MesÃ³n de madera aglomerada melaminada, trapezoidal, con medidas base [125cm x 49cm x 70cm] y 76cm alto.', '03-210', '2014-02-10 16:02:34', NULL),
	(86, '03-207', '', '10.01.03.00207', 3, 'MesÃ³n de trabajo trapezoidal', 11, 12, 4, 19, 2, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, 'MesÃ³n de madera aglomerada melaminada, trapezoidal, con medidas base [136cm x 60cm x 70cm] y 76cm alto.', '03-207', '2014-02-10 16:02:38', NULL),
	(87, '03-213', '', '10.01.03.00213', 3, 'MesÃ³n de trabajo rectangular', 11, 12, 4, 19, 2, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, 'MesÃ³n de madera aglomerada melaminada, rectangular, con medidas base [125cm x 80cm] y 76cm alto.', '03-213', '2014-02-10 16:02:09', NULL),
	(88, '03-208', '', '10.01.03.00208', 3, 'MesÃ³n de trabajo trapezoidal', 11, 12, 4, 19, 2, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, 'MesÃ³n de madera aglomerada melaminada, trapezoidal, con medidas base [136cm x 60cm x 70cm] y 76cm alto.', '03-208', '2014-02-10 16:02:05', NULL),
	(89, '03-211', '', '10.01.03.00211', 3, 'MesÃ³n de trabajo trapezoidal', 11, 12, 4, 19, 2, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, 'MesÃ³n de madera aglomerada melaminada, trapezoidal, con medidas base [136cm x 60cm x 70cm] y 76cm alto.', '03-211', '2014-02-10 16:02:43', NULL),
	(90, '03-206', '', '10.01.03.00206', 3, 'MesÃ³n de trabajo trapezoidal', 11, 12, 4, 19, 2, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 1, 1, 'MesÃ³n de madera aglomerada melaminada, trapezoidal, con medidas base [136cm x 60cm x 70cm] y 76cm alto.', '03-206', '2014-02-10 16:02:26', '2014-02-10 16:02:31'),
	(91, '03-212', '', '10.01.03.00212', 3, 'MesÃ³n de trabajo rectangular', 11, 12, 4, 19, 2, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, 'MesÃ³n de madera aglomerada melaminada, rectangular, con medidas base [125cm x 80cm] y 76cm alto.', '03-212', '2014-02-10 17:02:15', NULL),
	(92, '03-209', '', '10.01.03.00209', 3, 'MesÃ³n de trabajo trapezoidal', 11, 12, 4, 19, 2, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, 'MesÃ³n de madera aglomerada melaminada, trapezoidal, con medidas base [136cm x 60cm x 70cm] y 76cm alto.', '03-209', '2014-02-10 17:02:20', NULL),
	(93, '03-008', '', '20.18.03.00008', 10, 'Central telefonica', 22, 10, 4, 6, 11, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, 'CENTRAL TELEFONICA MCA.\r\nPANASONIC\r\nMOD KX-TE5824', '03-008', '2014-02-10 17:02:56', '2014-02-10 17:02:40'),
	(94, 'X-0008', '', '', 10, 'Link Station', 27, 10, 2, 5, 11, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, 'Marca: Buffalo\r\nModelo: LS-CHL344\r\nCapacidad: 850Gb', 'X-0008', '2014-02-10 18:02:54', '2014-02-11 12:02:31'),
	(95, '07-060', '', '20.18.07.00060', 10, 'Link Station', 27, 10, 2, 5, 11, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, 'Marca: Buffalo\r\nModelo: LS-CHL344\r\nCapacidad: 465Gb', '07-060', '2014-02-10 18:02:13', NULL),
	(96, '03-292', '', '20.18.03.00292', 10, 'Estabilizador', 28, 10, 12, 4, 11, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\nESTABILIZADOR\r\nMARCA: STAVOL MATSUNAKA SVC 1000 N', '03-292', '2014-02-10 18:02:56', NULL),
	(97, '07-00094', '', '20.09.07.00094', 10, 'IMAC INTEL 2', 29, 10, 9, 5, 10, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nCOMPUTADORA IMAC INTEL 2"\r\nMODELO A1312\r\nSERIE NO. W8026777DB6 32GMZ/46/B/ITB/SD\r\n\r\nCON TECLADO DELUX Y RATON GENIUS.', '07-00094', '2014-02-11 09:02:58', '2014-02-11 09:02:42'),
	(98, '07-108', '', '20.09.07.00108', 10, 'Impresora a tinta', 31, 10, 2, 6, 10, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA\r\nIMPRESORA\r\nMARCA: CANON\r\nMODELO: MP230\r\n\r\nCON SISTEMA DE TINTA CONTINUA.', '07-108', '2014-02-11 09:02:33', NULL),
	(99, '07-089', '', '20.18.07.00089', 10, 'Monitor LCD', 9, 10, 2, 8, 10, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB\r\n\r\nMONITOR\r\nMARCA: ACER\r\nMODELO: X183HB\r\nSERIE: ETLEZ0W0030070AD934329\r\nTAMAÃ‘O: 18.5 PULGADAS', '07-089', '2014-02-11 09:02:56', NULL),
	(100, '07-086', '', '20.18.07.00086', 10, 'CPU', 30, 6, 2, 5, 10, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB\r\n\r\nCASE\r\nMARCA: EMACHINES\r\nMODELO: ET 1831-07\r\nSERIE PTNB602022006021CB2700\r\n\r\nCON TECLADO MARCA EMACHINES Y MOUSE GENIUS', '07-086', '2014-02-11 10:02:30', NULL),
	(101, '03-238', '', '10.01.03.00238', 10, 'Silla giratoria', 11, 5, 9, 19, 10, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA\r\n\r\nSILLA GIRATORIA', '03-238', '2014-02-11 10:02:34', NULL),
	(102, '03-203', '', '20.09.03.00203', 10, 'Estabilizador', 28, 10, 12, 4, 10, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nESTABILIZADOR DE 500V MODELO AUTOVOL N1000VA\r\n', '03-203', '2014-02-11 10:02:26', NULL),
	(103, 'X-0009', '', '', 3, 'Mesa de escritorio', 11, 12, 8, 19, 10, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, 'ESCRITORIO, COLOR BEIGE, CON UNA FILA DE 2 CAJONES.\r\nMEDIDAS 148cm x 75cm x 76.5cm alto', 'X-0009', '2014-02-11 10:02:34', '2014-02-11 12:02:42'),
	(104, '03-284', '', '20.19.03.00284', 3, 'Silla giratoria', 11, 5, 3, 19, 10, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 6, 1, '1 PZA. SILLA RECLINABLE GIRATORIA CON APOYADERAS Y RUEDAS COLOR AZUL, CON EL ESPALDAR Y BASE DAÃ‘ADOS\r\n', '03-284', '2014-02-11 11:02:40', NULL),
	(105, '03-205', '', '20.06.03.00205', 10, 'Estabilizador', 28, 10, 12, 4, 10, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB. ESTABILIZADOR MARCA MATSUNAKA STAVOL SVC 500N COLOR ROJO\r\n', '03-205', '2014-02-11 11:02:48', NULL),
	(106, 'X-0010', '', '', 10, 'TelÃ©fono digital', 22, 5, 4, 6, 10, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, 'TELEFONO DIGITAL\r\nMARCA: PANASONIC\r\nMODELO: KX-TS580LX W', 'X-0010', '2014-02-11 11:02:04', '2014-02-11 12:02:56'),
	(107, '03-230', '', '20.09.03.00230', 3, 'Mesa de escritorio', 11, 12, 10, 19, 10, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '2 PZA.\r\n\r\n1 MUEBLE DE ESCRITORIO [160cm x 79.5cm x65cm alto]\r\n1 CAJONERIA MOVIBLE [42cm x 49cm x 63cm alto]', '03-230', '2014-02-11 11:02:53', '2014-02-11 11:02:28'),
	(108, '07-061', '', '20.09.07.00061', 12, 'Mini estudio fotogrÃ¡fico', 32, 10, 13, 5, 10, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GBL.\r\n\r\nMARCA: ORTERY\r\n\r\nMINI ESTUDIO PHOTOSIMILE 200 A, DIGITAL PHOTOGRAPHY KIT INCLUDES LIGHT BOX SOFTWARE PRODUCT STAND', '07-061', '2014-02-11 11:02:39', NULL),
	(109, 'X-0011', '', '', 3, 'Silla', 11, 3, 2, 19, 10, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA. SILLA DE MADERA CON TAPIZADO FLOREADO.\r\n\r\nMEDIDAS 56cm largo x 51cm ancho x 76 cm alto.', 'X-0011', '2014-02-11 11:02:55', '2014-02-11 12:02:07'),
	(110, 'P-038', '', '', 12, 'Tripode para cÃ¡mara', 2, 6, 2, 6, 10, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1PZA.\r\n\r\nTRIPODE PARA CAMARA FOTOGRAFICA\r\nMARCA: SONY\r\nMODELO: VCT-700\r\nALTO: 105cm.', 'P-038', '2014-02-11 12:02:26', NULL),
	(111, 'X-0012', '', '', 10, 'VoIP', 33, 10, 8, 8, 11, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nVOIP\r\nMARCA: INNOMEDIA\r\nMODELO: MTA3328-2RE', 'X-0012', '2014-02-11 13:02:15', '2014-02-11 13:02:42'),
	(112, 'X-0013', '', '', 10, 'Switch', 7, 10, 2, 1, 11, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nSWITCH DELL POWERCONNECT 2324, 26 PUERTOS.', 'X-0013', '2014-02-11 13:02:54', '2014-02-11 13:02:23'),
	(113, 'S-268', '', '', 10, 'Proyectora de imagen', 34, 10, 9, 5, 11, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '8 PZAS.\r\n\r\nPROYECTOR DE IMAGENES\r\nMARCA: INFOCUS\r\nMODELO: X1\r\nSERIE: AHHP31201521\r\n\r\n1 CONTROL REMOTO\r\n1 CABLE DE ALIMENTACION ELECTRICA\r\n1 A/V\r\n1 CABLE VGA\r\n2 MANUALES\r\n1 BOLSO', 'S-268', '2014-02-11 13:02:49', '2014-02-11 13:02:17'),
	(114, 'X-0014', '', '', 10, 'Router wireless', 35, 10, 2, 5, 11, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 2, 1, '1 PZA.\r\n\r\nLINKSYS ROUTER WIRELESS-G\r\nMODELO: WRT54GL\r\n\r\nDE 2 ANTENAS', 'X-0014', '2014-02-11 14:02:42', '2014-02-11 14:02:10'),
	(115, 'X-0015', '', '', 10, 'Lector de cÃ³digo de barras', 36, 10, 2, 5, 11, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '2 PZAS.\r\n\r\n1 LECTOR DE CODIGO DE BARRAS WASPNEST BUSINESS EDITION\r\n\r\n1 LIBRO MANUAL', 'X-0015', '2014-02-11 14:02:37', NULL),
	(116, 'X-0016', '', '', 10, 'Camara de video HD', 37, 10, 2, 5, 11, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1PZA.\r\n\r\nCAMARA DE VIDEO Y FOTOGRAFIA FLIP VIDEO HD.', 'X-0016', '2014-02-11 14:02:34', NULL),
	(117, '07-090', '', '20.18.07.00090', 10, 'Monitor LCD', 9, 10, 2, 8, 11, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nMONITOR LCD PANTALLA PLANA\r\nMARCA: ACER\r\nMODELO: X183HB\r\nSERIE: ETLEZ0W0030070AD8C4329', '07-090', '2014-02-11 14:02:21', NULL),
	(118, '07-083', '', '20.18.07.00083', 10, 'CPU', 8, 10, 2, 5, 11, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB\r\n\r\nCPU\r\nMARCA: HP\r\nMODELO: PAVILION ELITE HPE-150+\r\nSERIE: MXV012023W\r\n\r\nCON UN TECLADO Y MOUSE HP.', '07-083', '2014-02-11 15:02:58', NULL),
	(119, '07-093', '', '20.18.07.00093', 10, 'Monitor LCD', 9, 10, 2, 8, 11, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB\r\n\r\nMONITOR LCD PLANA\r\nMARCA: ACER\r\nMODELO: X183HB\r\nSERIE: ETLEZ0W0030070AD954329', '07-093', '2014-02-11 15:02:49', NULL),
	(120, '07-056', '', '', 10, 'CPU', 11, 10, 4, 4, 11, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '3 PZAS.\r\n\r\nCPU CASE, PENTIUM 4, 3GHZ PROCESADOR, 1GB RAM\r\n\r\nCON TECLADO DELUX Y MOUSE SIN MARCA.', '07-056', '2014-02-11 16:02:19', NULL),
	(121, '07-074', '', '20.18.07.00074', 10, 'Impresora a toner', 8, 5, 9, 12, 11, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB\r\n\r\nIMPRESORA HP LASERJET P1505\r\nMODELO: CB412A\r\nSERIE: BRBS84YG8X\r\n\r\nINDUSTRIA BRASILERA', '07-074', '2014-02-11 16:02:43', NULL),
	(122, '07-106', '', '20.18.07.00106', 10, 'Impresora a toner', 8, 5, 4, 5, 11, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nIMPRESORA LASER JET\r\nMARCA: HP\r\nMODELO: P2035\r\nSERIE: VNB3J02653', '07-106', '2014-02-11 16:02:11', NULL),
	(123, '07-098', '', '20.18.07.00098', 10, 'Escaner', 38, 5, 2, 5, 11, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nESCANER\r\nMARCA: BULLETSCAN\r\nMODELO: F200\r\nSERIE: CN109CSC81300188', '07-098', '2014-02-11 16:02:54', NULL),
	(124, '07-058', '', '20.18.07.00058', 10, 'CPU', 7, 10, 4, 5, 11, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nCPU DELL AMD 64 DIMENSION C 521 ATHLON 64 PROCESSOR 3200 1 GHZ RAM 958 MB 80 DD MONITOR DELL S/R 72872 6 CD 1 L4L\r\n\r\nCON TECLADO SIN MARCA Y MOUSE GENIUS.\r\n', '07-058', '2014-02-11 16:02:16', NULL),
	(125, '03-011', '', '30.10.03.00011', 10, 'TelÃ©fono digital', 22, 10, 4, 6, 11, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 8, 1, '1 GLB.\r\n\r\nTEÂ‰LEFONO DIGITAL PANASONIC, MOD. KX-T7450X', '03-011', '2014-02-11 16:02:30', NULL),
	(126, 'X-0017', '', '', 10, 'Disco externo', 39, 10, 2, 5, 11, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA\r\n\r\nDISCO EXTERNO WESTERN DIGITAL, 400Gb.', 'X-0017', '2014-02-11 16:02:40', NULL),
	(127, '07-065', '', '30.11.07.00065', 10, 'Impresora de carro a cinta', 40, 10, 4, 6, 11, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 6, 1, '1 GLB.\r\n\r\nIMPRESORA EPSON\r\nMODELO: LX 810L P80SA\r\nSERIE: N 1CKE016283\r\n', '07-065', '2014-02-11 16:02:56', '2014-02-11 16:02:36'),
	(128, 'X-0018', '', '', 3, 'Cajoneria', 11, 3, 10, 19, 11, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nARCHIVERO DE MADERA, CON 2 CAJONES.', 'X-0018', '2014-02-11 16:02:48', '2014-02-11 16:02:10'),
	(129, '03-236', '', '', 3, 'Cajoneria', 11, 3, 4, 19, 11, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nARCHIVERO CON 4 CAJONES.', '03-236', '2014-02-11 16:02:39', NULL),
	(130, 'X-0019', '', '', 10, 'Impresora de carro a cinta', 40, 10, 4, 6, 11, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 6, 1, '1 PZA.\r\n\r\nIMPRESORA EPSON ACTION PRINTER 5000, DE CARRO A CINTA.', 'X-0019', '2014-02-11 16:02:41', NULL),
	(131, 'X-0020', '', '', 10, 'Estabilizador', 41, 10, 8, 6, 11, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nESTABILIZADOR OMEGA PLUS\r\nMODELO: SVR - 1500W', 'X-0020', '2014-02-11 16:02:39', NULL),
	(132, 'S-146', '', '', 3, 'Silla', 11, 6, 6, 19, 11, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nTABURETE METALICO DE COLOR VERDE CON ASIENTO DE MADERA CUADRADO\r\n\r\n', 'S-146', '2014-02-11 16:02:31', '2014-02-11 17:02:20'),
	(133, '03-041', '', '30.11.03.00041', 3, 'Taburete', 11, 6, 6, 19, 11, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nTABURETE METALICO DE COLOR VERDE CON ASIENTO DE MADERA CUADRADO.', '03-041', '2014-02-11 17:02:07', '2014-02-12 14:02:04'),
	(134, '03-215', '', '20.18.03.00215', 3, 'Silla giratoria', 11, 5, 2, 19, 11, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nSILLA GIRATORIA CON 5 RODAPIES.\r\n', '03-215', '2014-02-11 17:02:52', NULL),
	(135, '03-298', '', '20.09.03.00298', 3, 'Silla giratoria', 11, 5, 3, 19, 11, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 6, 1, '1 PZA.\r\n\r\nSILLA AZUL GIRATORIA CON APOYADERAS Y RUEDAS.', '03-298', '2014-02-11 17:02:18', NULL),
	(136, '03-289', '', '20.18.03.00289', 10, 'Estabilizador', 28, 6, 12, 4, 11, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 1, 1, '1 PZA.\r\n\r\nESTABILIZADOR MATSUNAKA STAVOL, MODELO SVC 1500 N DE 1500 W.\r\n', '03-289', '2014-02-11 17:02:37', NULL),
	(137, 'X-0021', '', '', 10, 'Quemador externo de DVD', 3, 5, 2, 7, 11, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nQUEMADOR EXTERNO DE DVD, MODELO SE-S084', 'X-0021', '2014-02-11 17:02:28', NULL),
	(138, 'S-228', '', '', 3, 'SillÃ³n', 11, 3, 2, 19, 11, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nSILLON PEQUEÃ‘O DE MADERA CAFE, TAPIZADO DE COLOR NEGRO.', 'S-228', '2014-02-11 17:02:32', NULL),
	(139, 'X-0022', '', '', 3, 'Silla giratoria', 11, 5, 10, 19, 11, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nSILLA GIRATORIA DE COLOR CAFE, CON BRAZOS NEGROS Y 5 RODAPIES.', 'X-0022', '2014-02-11 17:02:28', NULL),
	(140, 'X-0023', '', '', 10, 'Estabilizador', 41, 6, 8, 6, 11, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nESTABILIZADOR OMEGA PLUS, MODELO SVR-1500W.', 'X-0023', '2014-02-11 17:02:12', NULL),
	(141, '03-217', '', '20.18.03.00217', 10, 'Silla giratoria', 11, 5, 12, 19, 11, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nSILLA GIRATORIO COLOR ROJO CON 5 RODAPIES.\r\n', '03-217', '2014-02-11 17:02:50', NULL),
	(142, '03-060', '', '10.14.03.00060', 10, 'Estabilizador', 42, 6, 10, 4, 11, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nESTABILIZADOR MARCA CHUAN HSIN MODELO MVS-5 DE 500 VOLTIOS\r\n', '03-060', '2014-02-11 17:02:32', NULL),
	(143, 'X-0024', '', '', 10, 'Monitor LCD', 3, 5, 2, 7, 11, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nMONITOR SAMSUNG SYNCMASTER 932NWE PLUS, PANTALLA PLANA, 19 PULGADAS.', 'X-0024', '2014-02-11 17:02:30', NULL),
	(144, 'X-0025', '', '', 10, 'Monitor LCD', 3, 5, 2, 7, 11, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nMONITOR SAMSUNG SYNCMASTER 932NWE PLUS, PANTALLA PLANA, 19 PULGADAS.', 'X-0025', '2014-02-11 17:02:40', NULL),
	(145, '07-085', '', '20.18.07.00085', 1, 'CPU', 30, 10, 2, 5, 11, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nCPU, MARCA EMACHINES, MOD. ET 1831-07, SERIE PTNB6020220090A8822700\r\n\r\nCON TECLADO DELUX Y MOUSE SIN MARCA.', '07-085', '2014-02-11 17:02:15', NULL),
	(146, '07-087', '', '20.18.07.00087', 10, 'CPU', 30, 10, 2, 5, 11, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nCPU, MARCA EMACHINES, MOD. ET 1831-07, SERIE PTNB602022006021DF2700\r\n\r\nCON TECLADO DELUX Y MOUSE GENIUS.', '07-087', '2014-02-11 17:02:21', NULL),
	(147, 'X-0026', '', '', 10, 'Router wireless', 43, 5, 2, 8, 11, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nROUTER DLINK MODELO DIR-615, CON 2 ANTENAS.', 'X-0026', '2014-02-11 17:02:15', NULL),
	(148, 'S-269', '', '', 10, 'Aire acondicionado', 6, 6, 4, 7, 11, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nMAQUINA DE AIRE ACONDICIONADO, MARCA LG, MODELO LWN22XXX\r\n\r\nCON CONTROL REMOTO', 'S-269', '2014-02-11 17:02:15', '2014-02-11 18:02:25'),
	(149, 'S-227', '', '', 3, 'MesÃ³n', 11, 9, 10, 1, 11, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nMESON DE TRABAJO LARGA, CON BASE DE MADERA AGLOMERADA COLOR CAFE Y ESTRUCTURA DE METAL COLOR CAFE, CON MEDIDAS [505cm x 75cm x 77cm de alto]', 'S-227', '2014-02-11 17:02:52', NULL),
	(150, 'X-0027', '', '', 3, 'MesÃ³n', 11, 9, 10, 19, 11, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nMESON DE TRABAJO LARGO, CON BASE DE MADERA AGLOMERADA COLOR CAFE Y ESTRUCTURA DE METAL COLOR CAFE, CON MEDIDAS [370cm x 75cm x 79cm de alto]', 'X-0027', '2014-02-11 17:02:41', '2014-02-11 17:02:56'),
	(151, 'X-0028', '', '', 3, 'MesÃ³n', 11, 9, 10, 19, 11, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nMESON DE TRABAJO LARGO, CON BASE DE MADERA AGLOMERADA COLOR CAFE Y ESTRUCTURA DE METAL COLOR CAFE, CON MEDIDAS [230cm x 75cm x 79cm de alto]', 'X-0028', '2014-02-11 17:02:54', NULL),
	(152, 'S-436', '', '', 3, 'Mesa de trabajo', 11, 3, 2, 19, 11, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 4, 1, '1 PZA.\r\n\r\nMESA DE TRABAJO DE MADERA, CON MEDIDAS [100cm x 80cm x 74cm de alto]', 'S-436', '2014-02-11 17:02:15', '2014-02-11 18:02:41'),
	(153, 'X-0029', '', '', 3, 'Librero', 11, 3, 10, 19, 11, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nLIBRERO DE MADERA, CON 5 DIVISIONES, CON MEDIDAS [74.5cm x 30cm x 183cm de alto]', 'X-0029', '2014-02-11 18:02:36', NULL),
	(154, 'S-271', '', '', 1, 'CPU', 1, 1, 1, 1, 11, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 1, 1, '', 'S-271', '2014-02-12 11:02:10', NULL),
	(155, '03-167', '', '20.18.03.00167', 3, 'Mesa de escritorio', 11, 3, 10, 19, 19, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 4, 1, '1 PZA.\r\n\r\nESCRITORIO MEDIANO DE MADERA CON 3 CAJONES LADO DERECHO, MEDIDAS [127cm x 74cm x 75cm alto]', '03-167', '2014-02-12 12:02:39', '2014-02-12 12:02:25'),
	(156, 'S-162', '', '', 3, 'Buro', 11, 3, 10, 19, 19, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nBURO PEQUEÃ‘O, CON 2 PUERTAS, MEDIDAS [130cm x 53cm x 82cm alto]', 'S-162', '2014-02-12 12:02:43', NULL),
	(157, 'S-010', '', '', 3, 'Silla', 11, 6, 9, 19, 19, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 4, 1, '1 PZA.\r\n\r\nSILLA METALICA PLOMA.', 'S-010', '2014-02-12 12:02:45', NULL),
	(158, 'S-028', '', '', 3, 'Cajoneria', 11, 3, 10, 19, 19, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nCAJONERIA CAFE CON 4 CAJONES, MEDIDAS [115.5cm X 38cm x 60cm alto]', 'S-028', '2014-02-12 12:02:28', NULL),
	(159, 'S-145', '', '', 1, 'Taburete', 11, 6, 6, 19, 19, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 4, 1, '1 PZA.\r\n\r\nTABURETE METALICO VERDE CON BASE DE MADERA.', 'S-145', '2014-02-12 13:02:58', NULL),
	(160, 'X-0001', '', '', 12, 'Muestrario', 11, 5, 4, 19, 19, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nMUESTRARIO COLOR VERDE CON LOGO FORTTE Y GANCHOS PARA ACOMODAR PRODUCTOS.', 'X-0001', '2014-02-12 13:02:22', NULL),
	(161, 'X-0030', '', '', 12, 'Banner publicitario', 11, 1, 4, 19, 19, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nBANNER PUBLICITARIO DEL SISTEMA DE GESTION INTEGRADO', 'X-0030', '2014-02-12 13:02:51', NULL),
	(162, 'S-030', '', '', 3, 'Mesa de escritorio', 11, 3, 10, 19, 19, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nESCRITORIO CON 3 CAJONES AL LADO IZQUIERDO Y 1 AL LADO DERECHO, MEDIDAS [167cm x 80cm x 60cm alto]', 'S-030', '2014-02-12 13:02:22', NULL),
	(163, '03-166', '', '10.04.03.00166', 10, 'Fotocopiadora', 44, 10, 4, 6, 18, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 GLB.\r\n\r\nFOTOCOPIADORA\r\nMARCA: MINOLTA\r\nMODELO: EP1052 CS-PRO\r\nSERIE: 21719517', '03-166', '2014-02-12 13:02:12', '2014-02-12 13:02:15'),
	(164, 'S-025', '', '', 3, 'Archivero', 11, 6, 9, 19, 18, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nARCHIVERO DE METAL, CON 1 CAJON CON LLAVE Y 2 PUERTAS', 'S-025', '2014-02-12 13:02:59', NULL),
	(165, 'X-0031', '', '', 12, 'Banner publicitario', 11, 5, 15, 19, 18, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nBANNER PUBLICITARIO DE MACAWS SRL.', 'X-0031', '2014-02-12 13:02:00', '2014-02-12 13:02:50'),
	(166, 'X-0032', '', '', 3, 'Buro', 11, 1, 10, 19, 18, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nBURO DE MADERA CAFE, CON 2 PUERTAS.', 'X-0032', '2014-02-12 13:02:40', NULL),
	(167, 'X-0033', '', '', 10, 'Refrigerador', 45, 6, 13, 20, 18, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nREFRIGERADOR ELECTROLUX, DE 2 PUERTAS, MODELO DX45X', 'X-0033', '2014-02-12 13:02:15', NULL),
	(168, '03-288', '', '10.01.03.00288', 10, 'Estabilizador', 28, 6, 12, 4, 18, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nESTABILIZADOR MATSUNAKA STAVOL MODELO SVC 1500 N DE 100 W.', '03-288', '2014-02-12 13:02:56', NULL),
	(169, 'S-230', '', '', 3, 'Cajoneria', 11, 12, 4, 19, 18, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nCAJONERIA DE COLOR BLANCO CON 4 CAJONES.', 'S-230', '2014-02-12 13:02:31', NULL),
	(170, 'S-018', '', '', 3, 'Silla giratoria', 11, 5, 9, 19, 18, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nSILLA GIRATORIA, DE COLOR PLOMO CON 5 RODAPIES.', 'S-018', '2014-02-12 13:02:06', NULL),
	(171, 'X-0034', '', '', 3, 'Cubiculo de oficina', 11, 12, 4, 19, 18, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '', 'X-0034', '2014-02-12 13:02:01', NULL),
	(172, '03-171', '', '', 10, 'TelÃ©fono digital', 22, 5, 4, 6, 18, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 4, 1, '1 PZA.\r\n\r\nTELEFONO DIGITAL PANASONIC, MODELO KX-T7433', '03-171', '2014-02-12 13:02:55', NULL),
	(173, 'S-237', '', '', 3, 'Cajoneria', 11, 12, 4, 19, 18, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nCAJONERIA BLANCA, CON 4 CAJONES.', 'S-237', '2014-02-12 13:02:41', NULL),
	(174, 'S-266', '', '', 10, 'TelÃ©fono digital', 22, 5, 4, 6, 18, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 4, 1, '1 PZA.\r\n\r\nTELEFONO DIGITAL PANASONIC BLANCO, MODELO KX-T7450X', 'S-266', '2014-02-12 13:02:36', NULL),
	(175, '03-198', '', '10.04.03.00198', 1, 'Mueble de trabajo', 11, 12, 8, 19, 18, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nMUEBLE DE TRABAJO MELAMINICO COLOR BEIJE CON NEGRO DE 4 CUERPOS CON 12 CAJONES, 3 EN CADA SECCION.', '03-198', '2014-02-12 13:02:22', NULL),
	(176, '03-214', '', '20.18.03.00214', 3, 'Silla giratoria', 11, 5, 9, 19, 18, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nSILLA DE OFICINA GIRATORIO CON 5 RODAPIES.', '03-214', '2014-02-12 13:02:21', NULL),
	(177, 'X-0035', '', '', 12, 'Banner publicitario', 11, 5, 15, 19, 18, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nBANNER PUBLICITARIO DE MACAWS SRL.', 'X-0035', '2014-02-12 13:02:47', NULL),
	(178, 'X-0036', '', '', 8, 'Caminadora', 1, 10, 2, 5, 18, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 4, 1, '1 PZA.\r\n\r\nCAMINADORA PROFORM CROSS-WALK.', 'X-0036', '2014-02-12 14:02:23', NULL),
	(179, '03-218', '', '10.01.03.00218', 3, 'Silla giratoria', 11, 5, 9, 19, 18, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nSILLA DE OFICINA GIRATORIO CON 5 RODAPIES.', '03-218', '2014-02-12 14:02:18', NULL),
	(180, '03-115', '', '30.11.03.00115', 3, 'Silla', 11, 6, 9, 1, 18, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 4, 1, '1 PZA.\r\n\r\nSILLA PLEGABLE DE 0,78M DE ALTO COLOR PLOMO', '03-115', '2014-02-12 14:02:57', NULL),
	(181, '03-164', '', '30.11.03.00164', 3, 'Archivero', 11, 6, 9, 19, 18, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nMUEBLE METALICO PARA OFICINA DE 4 GAVETAS COLOR PLOMO\r\n', '03-164', '2014-02-12 14:02:50', NULL),
	(182, '03-234', '', '30.11.03.00234', 3, 'Archivero', 11, 6, 3, 2, 18, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nGAVETERO DE 4 CAJONES C/MARIPOSA', '03-234', '2014-02-12 14:02:48', '2014-02-12 14:02:32'),
	(183, 'X-0037', '', '', 3, 'Silla giratoria', 11, 5, 9, 19, 18, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nSILLA GIRATORIA CON 5 RODAPIES.', 'X-0037', '2014-02-12 14:02:43', NULL),
	(184, 'X-0038', '', '', 12, 'Basurero papelero', 11, 5, 15, 19, 18, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nBASURERO PAPELERO DE PLASTICO CON TAPA CAFE Y CONTENEDOR CREMA.', 'X-0038', '2014-02-12 14:02:35', NULL),
	(185, '03-274', '', '30.11.03.00274', 3, 'Archivero', 11, 6, 3, 19, 18, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nGAVETERO DE 4 CAJONES C/ MARIPOSA.', '03-274', '2014-02-12 14:02:08', NULL),
	(186, '03-235', '', '10.04.03.00235', 10, 'Destructora de papel', 1, 5, 4, 1, 18, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 4, 1, '1 PZA.\r\n\r\nDESTRUCTORA DE PAPEL PAPER MONSTER JUNIOR.', '03-235', '2014-02-12 14:02:20', NULL),
	(187, '03-174', '', '30.11.03.00174', 3, 'Silla giratoria', 11, 5, 9, 19, 18, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 4, 1, '1 PZA.\r\n\r\nSILLA DE OFICINA GIRATORIO CON 5 RODAPIES.', '03-174', '2014-02-12 14:02:41', NULL),
	(188, 'X-0039', '', '', 10, 'TelÃ©fono digital', 22, 5, 4, 6, 18, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nTELEFONO DIGITAL PANASONIC, MODELO KX-TS500LX W', 'X-0039', '2014-02-12 14:02:02', NULL),
	(189, 'X-0040', '', '', 10, 'TelÃ©fono digital', 22, 5, 4, 6, 18, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nTELEFONO DIGITAL PANASONIC, MODELO KX-TS500LX W.', 'X-0040', '2014-02-12 14:02:07', NULL),
	(190, '03-204', '', '10.01.03.00204', 12, 'Caja de llaves', 11, 6, 4, 19, 18, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nARCHIVERO DE LLAVES MODELO 60/2 COLOR BLANCO.', '03-204', '2014-02-12 14:02:46', NULL),
	(191, '03-297', '', '20.18.03.00297', 10, 'Estabilizador', 28, 6, 12, 4, 18, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nESTABILIZADOR MARCA STAVOL MATSUNAKA SVC 1500 N.', '03-297', '2014-02-12 14:02:27', NULL),
	(192, 'X-0041', '', '', 10, 'Switch', 46, 5, 2, 4, 18, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nENCORE SWITCH DE 24 PUERTOS, MODELO ENH924-AUT.', 'X-0041', '2014-02-12 15:02:37', NULL),
	(193, 'X-0042', '', '', 10, 'Calentador de agua', 24, 5, 4, 21, 18, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nCALENTADOR DE AGUA PHILIPS, DE 1.5 LITROS DE CAPACIDAD.', 'X-0042', '2014-02-12 15:02:27', NULL),
	(194, 'P-023', '', '', 10, 'Hub', 43, 5, 9, 8, 18, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nDLINK DFE-816, CON 16 PUERTOS.', 'P-023', '2014-02-12 15:02:13', NULL),
	(195, 'P-017', '', '', 10, 'Calentador de agua', 47, 5, 4, 1, 18, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 4, 1, '1 PZA.\r\n\r\nCALENTADOR DE AGUA OSTER, 2 LITROS DE CAPACIDAD.', 'P-017', '2014-02-12 15:02:09', NULL),
	(196, '03-219', '', '30.11.03.00219', 3, 'Silla giratoria', 11, 5, 9, 19, 18, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nSILLA GIRATORIA COLOR PLOMA, CON 5 RODAPIES.', '03-219', '2014-02-12 15:02:44', '2014-02-12 15:02:28'),
	(197, 'X-0043', '', '', 12, 'Calefactor de aire a gas', 1, 6, 16, 19, 18, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 8, 1, '1 PZA.\r\n\r\nCALEFACTOR DE AIRE A GAS VOLCAN.', 'X-0043', '2014-02-12 15:02:57', NULL),
	(198, 'S-033', '', '', 3, 'Librero', 11, 3, 10, 19, 18, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nLIBRERO DE MADERA CON 5 REPISAS.', 'S-033', '2014-02-12 15:02:03', NULL),
	(199, 'X-0044', '', '', 12, 'Gavetero', 11, 5, 5, 19, 18, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nGAVETERO CON 45 COMPARTIMENTOS PARA COSAS PEQUEÃ‘AS.', 'X-0044', '2014-02-12 15:02:53', NULL),
	(200, 'X-0045', '', '', 6, 'Casco de soldadura', 11, 5, 2, 4, 18, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nCASCO DE SOLDADURA, CARECE DEL LENTE PROTECTOR.', 'X-0045', '2014-02-12 15:02:09', NULL),
	(201, '03-008-2', '', '30.11.03.00008', 10, 'Estabilizador', 28, 6, 10, 4, 18, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nESTABILIZADOR MARCA SHUAN HSIN MODELO MVS-5 COLOR CAFEÂ‰ DE 500V.', '03-008-2', '2014-02-12 15:02:22', NULL),
	(202, 'S-246', '', '', 12, 'Extintor de incendios', 48, 6, 12, 12, 18, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nEXTINTOR DE 4 KILOS.', 'S-246', '2014-02-12 15:02:12', NULL),
	(203, 'X-0046', '', '', 12, 'Banner publicitario', 11, 5, 4, 19, 18, 3, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nBANNER PUBLICITARIO DE SISTEMA DE GESTION INTEGRADO.', 'X-0046', '2014-02-12 15:02:14', NULL),
	(204, 'S-031', '', '', 3, 'Mesa de escritorio', 11, 3, 10, 19, 12, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '1 PZA.\r\n\r\nESCRITORIO CON 2 CAJONES Y UNA GAVETA, MEDIDAS [108cm x 60cm x 132 alto]', 'S-031', '2014-02-12 15:02:32', NULL),
	(205, 'S-222', '', '', 3, 'MesÃ³n', 11, 12, 4, 19, 12, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '2 PZA.\r\n\r\nMESON FORMA L', 'S-222', '2014-02-12 15:02:35', NULL),
	(206, 'X-0047', '', '', 1, 'Mini estudio fotogrÃ¡fico', 11, 10, 4, 19, 12, 1, 1.000, 0.00, 0.00, 0.00, 0.00, 3, 1, '4 PZAS.\r\n\r\n1 MINI ESTUDIO CON ESTRUCTURA METALICA Y CUBIERTO DE TELA.\r\n3 LAMPARAS DE ILUMINACION.', 'X-0047', '2014-02-12 16:02:34', NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- Dumping data for table inventory.item_brand: ~45 rows (approximately)
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
	(19, 'SUNSTAR'),
	(20, 'SINGER'),
	(21, 'TAKING'),
	(22, 'PANASONIC'),
	(23, 'RCA'),
	(24, 'PHILIPS'),
	(25, 'SUPERBOX'),
	(26, '3M'),
	(27, 'BUFFALO'),
	(28, 'MATSUNAKA STAVOL'),
	(29, 'APPLE'),
	(30, 'EMACHINES'),
	(31, 'CANON'),
	(32, 'ORTERY'),
	(33, 'INNOMEDIA'),
	(34, 'INFOCUS'),
	(35, 'LINKSYS'),
	(36, 'WASPNEST'),
	(37, 'FLIP VIDEO'),
	(38, 'BULLETSCAN'),
	(39, 'WESTERN DIGITAL'),
	(40, 'EPSON'),
	(41, 'OMEGA'),
	(42, 'CHUAN HSIN'),
	(43, 'D-LINK'),
	(44, 'MINOLTA'),
	(45, 'ELECTROLUX'),
	(46, 'ENCORE'),
	(47, 'OSTER'),
	(48, 'RESIL');
/*!40000 ALTER TABLE `item_brand` ENABLE KEYS */;


-- Dumping structure for table inventory.item_color
DROP TABLE IF EXISTS `item_color`;
CREATE TABLE IF NOT EXISTS `item_color` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- Dumping data for table inventory.item_color: ~14 rows (approximately)
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
	(9, 'Plomo'),
	(10, 'Café'),
	(12, 'Rojo'),
	(13, 'Plateado'),
	(14, 'Dorado'),
	(15, 'Crema'),
	(16, 'Celeste');
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
	(4, '3 - Con desgaste', NULL),
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- Dumping data for table inventory.item_location: ~19 rows (approximately)
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
	(18, 'Oficina cubículos', NULL),
	(19, 'Pasillos oficinas', NULL);
/*!40000 ALTER TABLE `item_location` ENABLE KEYS */;


-- Dumping structure for table inventory.item_material
DROP TABLE IF EXISTS `item_material`;
CREATE TABLE IF NOT EXISTS `item_material` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Dumping data for table inventory.item_material: ~12 rows (approximately)
DELETE FROM `item_material`;
/*!40000 ALTER TABLE `item_material` DISABLE KEYS */;
INSERT INTO `item_material` (`id`, `name`, `description`) VALUES
	(1, '- Seleccionar -', NULL),
	(2, 'Cuero', ''),
	(3, 'Madera', ''),
	(4, 'PU', ''),
	(5, 'Plástico', ''),
	(6, 'Metal', ''),
	(7, 'No hay dato', NULL),
	(8, 'Cartón prensado', NULL),
	(9, 'Madera aglomerada', NULL),
	(10, 'Varios', NULL),
	(11, 'Acrílico', NULL),
	(12, 'Madera aglomerada melaminica', NULL);
/*!40000 ALTER TABLE `item_material` ENABLE KEYS */;


-- Dumping structure for table inventory.item_origin
DROP TABLE IF EXISTS `item_origin`;
CREATE TABLE IF NOT EXISTS `item_origin` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- Dumping data for table inventory.item_origin: ~20 rows (approximately)
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
	(19, 'No hay dato'),
	(20, 'Suecia'),
	(21, 'Polonia');
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
	(10, NULL, 'Equipo electrónico', NULL),
	(11, NULL, 'Repuesto', NULL),
	(12, NULL, 'Otro', NULL);
/*!40000 ALTER TABLE `item_type` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
