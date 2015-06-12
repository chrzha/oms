-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.23-log - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for srm
CREATE DATABASE IF NOT EXISTS `srm` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `srm`;


-- Dumping structure for table srm.buyer
CREATE TABLE IF NOT EXISTS `buyer` (
  `buyer_id` int(11) NOT NULL AUTO_INCREMENT,
  `gender_id` int(11) NOT NULL,
  `buyer_code` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `buyer_name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `updated_by` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`buyer_id`),
  KEY `fk_buyer_gender1_idx` (`gender_id`),
  CONSTRAINT `fk_buyer_gender1` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`gender_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table srm.buyer: ~2 rows (approximately)
/*!40000 ALTER TABLE `buyer` DISABLE KEYS */;
INSERT INTO `buyer` (`buyer_id`, `gender_id`, `buyer_code`, `buyer_name`, `create_time`, `created_by`, `update_time`, `updated_by`) VALUES
	(1, 2, 'B1', '赵六', '2015-05-07 21:54:37', NULL, NULL, NULL),
	(2, 1, 'B2', '王五', '2015-05-07 21:54:51', NULL, NULL, NULL);
/*!40000 ALTER TABLE `buyer` ENABLE KEYS */;


-- Dumping structure for table srm.gender
CREATE TABLE IF NOT EXISTS `gender` (
  `gender_id` int(11) NOT NULL AUTO_INCREMENT,
  `gender_code` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `gender_name` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `updated_by` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`gender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table srm.gender: ~2 rows (approximately)
/*!40000 ALTER TABLE `gender` DISABLE KEYS */;
INSERT INTO `gender` (`gender_id`, `gender_code`, `gender_name`, `create_time`, `created_by`, `update_time`, `updated_by`) VALUES
	(1, 'M', '男', '2015-05-07 21:47:50', NULL, NULL, NULL),
	(2, 'F', '女', '2015-05-07 21:47:59', NULL, NULL, NULL);
/*!40000 ALTER TABLE `gender` ENABLE KEYS */;


-- Dumping structure for table srm.inquiry_item
CREATE TABLE IF NOT EXISTS `inquiry_item` (
  `inq_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `inq_id` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `updated_by` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`inq_item_id`),
  KEY `fk_requested_item_material1_idx` (`material_id`),
  KEY `fk_requested_item_inquiry_list1_idx` (`inq_id`),
  CONSTRAINT `fk_requested_item_inquiry_list1` FOREIGN KEY (`inq_id`) REFERENCES `inquiry_order` (`inq_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_requested_item_material1` FOREIGN KEY (`material_id`) REFERENCES `material` (`material_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table srm.inquiry_item: ~0 rows (approximately)
/*!40000 ALTER TABLE `inquiry_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `inquiry_item` ENABLE KEYS */;


-- Dumping structure for table srm.inquiry_order
CREATE TABLE IF NOT EXISTS `inquiry_order` (
  `inq_id` int(11) NOT NULL AUTO_INCREMENT,
  `requester_id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `quote_deadline` datetime DEFAULT NULL,
  `estimated_aog` datetime DEFAULT NULL,
  `attachment` blob,
  `status` int(11) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `updated_by` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`inq_id`),
  KEY `fk_inquiry_list_requester1_idx` (`requester_id`),
  KEY `fk_inquiry_list_buyer1_idx` (`buyer_id`),
  CONSTRAINT `fk_inquiry_list_buyer1` FOREIGN KEY (`buyer_id`) REFERENCES `buyer` (`buyer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_inquiry_list_requester1` FOREIGN KEY (`requester_id`) REFERENCES `requester` (`requester_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table srm.inquiry_order: ~0 rows (approximately)
/*!40000 ALTER TABLE `inquiry_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `inquiry_order` ENABLE KEYS */;


-- Dumping structure for table srm.inq_sup
CREATE TABLE IF NOT EXISTS `inq_sup` (
  `inq_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `updated_by` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`inq_id`,`supplier_id`),
  KEY `fk_inq_sup_supplier1_idx` (`supplier_id`),
  KEY `fk_inq_sup_inquiry_list1_idx` (`inq_id`),
  CONSTRAINT `fk_inq_sup_inquiry_list1` FOREIGN KEY (`inq_id`) REFERENCES `inquiry_order` (`inq_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_inq_sup_supplier1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table srm.inq_sup: ~0 rows (approximately)
/*!40000 ALTER TABLE `inq_sup` DISABLE KEYS */;
/*!40000 ALTER TABLE `inq_sup` ENABLE KEYS */;


-- Dumping structure for table srm.material
CREATE TABLE IF NOT EXISTS `material` (
  `material_id` int(11) NOT NULL AUTO_INCREMENT,
  `uom_id` int(11) NOT NULL,
  `mat_type_id` int(11) NOT NULL,
  `material_code` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `material_name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `ref_price` float DEFAULT NULL,
  `lot_size` float DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `updated_by` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`material_id`),
  KEY `fk_material_uom1_idx` (`uom_id`),
  KEY `fk_material_material_type1_idx` (`mat_type_id`),
  CONSTRAINT `fk_material_material_type1` FOREIGN KEY (`mat_type_id`) REFERENCES `material_type` (`mat_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_material_uom1` FOREIGN KEY (`uom_id`) REFERENCES `uom` (`uom_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table srm.material: ~2 rows (approximately)
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
INSERT INTO `material` (`material_id`, `uom_id`, `mat_type_id`, `material_code`, `material_name`, `ref_price`, `lot_size`, `create_time`, `created_by`, `update_time`, `updated_by`) VALUES
	(1, 1, 1, 'GG', '钢管', 123.45, 10, '2015-05-07 21:55:30', NULL, NULL, NULL),
	(2, 6, 2, 'BWG', '保温管', 456.78, 100, '2015-05-07 21:56:20', NULL, NULL, NULL);
/*!40000 ALTER TABLE `material` ENABLE KEYS */;


-- Dumping structure for table srm.material_type
CREATE TABLE IF NOT EXISTS `material_type` (
  `mat_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `mat_type_code` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `mat_type_name` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `updated_by` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`mat_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table srm.material_type: ~3 rows (approximately)
/*!40000 ALTER TABLE `material_type` DISABLE KEYS */;
INSERT INTO `material_type` (`mat_type_id`, `mat_type_code`, `mat_type_name`, `create_time`, `created_by`, `update_time`, `updated_by`) VALUES
	(1, 'MT1', '保温材料', '2015-05-07 21:48:42', NULL, NULL, NULL),
	(2, 'MT2', '绝缘材料', '2015-05-07 21:49:11', NULL, NULL, NULL),
	(3, 'MT3', '其他', '2015-05-07 21:49:27', NULL, NULL, NULL);
/*!40000 ALTER TABLE `material_type` ENABLE KEYS */;


-- Dumping structure for table srm.purchase_item
CREATE TABLE IF NOT EXISTS `purchase_item` (
  `pur_item_id` int(11) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `updated_by` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `purchase_order_inq_id` int(11) NOT NULL,
  `material_material_id` int(11) NOT NULL,
  PRIMARY KEY (`pur_item_id`),
  KEY `fk_purchase_item_purchase_order1_idx` (`purchase_order_inq_id`),
  KEY `fk_purchase_item_material1_idx` (`material_material_id`),
  CONSTRAINT `fk_purchase_item_material1` FOREIGN KEY (`material_material_id`) REFERENCES `material` (`material_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_item_purchase_order1` FOREIGN KEY (`purchase_order_inq_id`) REFERENCES `purchase_order` (`inq_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table srm.purchase_item: ~0 rows (approximately)
/*!40000 ALTER TABLE `purchase_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_item` ENABLE KEYS */;


-- Dumping structure for table srm.purchase_order
CREATE TABLE IF NOT EXISTS `purchase_order` (
  `po_id` int(11) NOT NULL,
  `inq_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `requester_id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `arrival_period` int(11) DEFAULT NULL,
  `actual_aog` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `updated_by` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`po_id`),
  UNIQUE KEY `po_id_UNIQUE` (`po_id`),
  KEY `fk_purchase_order_inquiry_list1_idx` (`inq_id`),
  KEY `fk_purchase_order_supplier1_idx` (`supplier_id`),
  KEY `fk_purchase_order_requester1_idx` (`requester_id`),
  KEY `fk_purchase_order_buyer1_idx` (`buyer_id`),
  CONSTRAINT `fk_purchase_order_buyer1` FOREIGN KEY (`buyer_id`) REFERENCES `buyer` (`buyer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_order_inquiry_list1` FOREIGN KEY (`inq_id`) REFERENCES `inquiry_order` (`inq_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_order_requester1` FOREIGN KEY (`requester_id`) REFERENCES `requester` (`requester_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_order_supplier1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table srm.purchase_order: ~0 rows (approximately)
/*!40000 ALTER TABLE `purchase_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_order` ENABLE KEYS */;


-- Dumping structure for table srm.quotation
CREATE TABLE IF NOT EXISTS `quotation` (
  `quot_id` int(11) NOT NULL AUTO_INCREMENT,
  `inq_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL COMMENT 'status: 0-quoting,1-submitted',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `updated_by` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`quot_id`),
  KEY `fk_quotation_supplier2_idx` (`supplier_id`),
  KEY `fk_quotation_inquiry_list1_idx` (`inq_id`),
  CONSTRAINT `fk_quotation_inquiry_list1` FOREIGN KEY (`inq_id`) REFERENCES `inquiry_order` (`inq_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_quotation_supplier2` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table srm.quotation: ~0 rows (approximately)
/*!40000 ALTER TABLE `quotation` DISABLE KEYS */;
/*!40000 ALTER TABLE `quotation` ENABLE KEYS */;


-- Dumping structure for table srm.quot_item
CREATE TABLE IF NOT EXISTS `quot_item` (
  `quot_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `quot_id` int(11) NOT NULL,
  `inq_item_id` int(11) NOT NULL,
  `unit_price` int(11) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `updated_by` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`quot_item_id`),
  KEY `fk_quot_item_quotation1_idx` (`quot_id`),
  KEY `fk_quot_item_inquiry_item1_idx` (`inq_item_id`),
  CONSTRAINT `fk_quot_item_inquiry_item1` FOREIGN KEY (`inq_item_id`) REFERENCES `inquiry_item` (`inq_item_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_quot_item_quotation1` FOREIGN KEY (`quot_id`) REFERENCES `quotation` (`quot_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table srm.quot_item: ~0 rows (approximately)
/*!40000 ALTER TABLE `quot_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `quot_item` ENABLE KEYS */;


-- Dumping structure for table srm.requester
CREATE TABLE IF NOT EXISTS `requester` (
  `requester_id` int(11) NOT NULL AUTO_INCREMENT,
  `gender_id` int(11) NOT NULL,
  `workshop_id` int(11) NOT NULL,
  `requester_name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `updated_by` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`requester_id`),
  KEY `fk_requester_gender1_idx` (`gender_id`),
  KEY `fk_requester_workshop1_idx` (`workshop_id`),
  CONSTRAINT `fk_requester_gender1` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`gender_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_requester_workshop1` FOREIGN KEY (`workshop_id`) REFERENCES `workshop` (`workshop_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table srm.requester: ~2 rows (approximately)
/*!40000 ALTER TABLE `requester` DISABLE KEYS */;
INSERT INTO `requester` (`requester_id`, `gender_id`, `workshop_id`, `requester_name`, `create_time`, `created_by`, `update_time`, `updated_by`) VALUES
	(1, 2, 1, '张三', '2015-05-07 21:54:08', NULL, NULL, NULL),
	(2, 1, 2, '李四', '2015-05-07 21:54:18', NULL, NULL, NULL);
/*!40000 ALTER TABLE `requester` ENABLE KEYS */;


-- Dumping structure for table srm.supplier
CREATE TABLE IF NOT EXISTS `supplier` (
  `supplier_id` int(11) NOT NULL AUTO_INCREMENT,
  `sup_type_id` int(11) NOT NULL,
  `sup_rank_id` int(11) NOT NULL,
  `supplier_code` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `supplier_name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `address` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `updated_by` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`supplier_id`),
  KEY `fk_supplier_supplier_type1_idx` (`sup_type_id`),
  KEY `fk_supplier_supplier_rank1_idx` (`sup_rank_id`),
  CONSTRAINT `fk_supplier_supplier_rank1` FOREIGN KEY (`sup_rank_id`) REFERENCES `supplier_rank` (`sup_rank_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_supplier_supplier_type1` FOREIGN KEY (`sup_type_id`) REFERENCES `supplier_type` (`sup_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table srm.supplier: ~2 rows (approximately)
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` (`supplier_id`, `sup_type_id`, `sup_rank_id`, `supplier_code`, `supplier_name`, `address`, `create_time`, `created_by`, `update_time`, `updated_by`) VALUES
	(1, 1, 1, 'S1', '供应商1', NULL, '2015-05-07 21:53:19', NULL, NULL, NULL),
	(2, 2, 2, 'S2', '供应商2', NULL, '2015-05-07 21:53:39', NULL, NULL, NULL);
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;


-- Dumping structure for table srm.supplier_rank
CREATE TABLE IF NOT EXISTS `supplier_rank` (
  `sup_rank_id` int(11) NOT NULL AUTO_INCREMENT,
  `sup_rank_code` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `sup_rank_name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `updated_by` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`sup_rank_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table srm.supplier_rank: ~5 rows (approximately)
/*!40000 ALTER TABLE `supplier_rank` DISABLE KEYS */;
INSERT INTO `supplier_rank` (`sup_rank_id`, `sup_rank_code`, `sup_rank_name`, `create_time`, `created_by`, `update_time`, `updated_by`) VALUES
	(1, '1', '钻石', '2015-05-07 21:49:47', NULL, NULL, NULL),
	(2, '2', '金牌', '2015-05-07 21:49:53', NULL, NULL, NULL),
	(3, '3', '银牌', '2015-05-07 21:50:03', NULL, NULL, NULL),
	(4, '4', '铜牌', '2015-05-07 21:50:10', NULL, NULL, NULL),
	(5, '5', '铁牌', '2015-05-07 21:50:16', NULL, NULL, NULL);
/*!40000 ALTER TABLE `supplier_rank` ENABLE KEYS */;


-- Dumping structure for table srm.supplier_type
CREATE TABLE IF NOT EXISTS `supplier_type` (
  `sup_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `sup_type_code` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `sup_type_name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `updated_by` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`sup_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table srm.supplier_type: ~2 rows (approximately)
/*!40000 ALTER TABLE `supplier_type` DISABLE KEYS */;
INSERT INTO `supplier_type` (`sup_type_id`, `sup_type_code`, `sup_type_name`, `create_time`, `created_by`, `update_time`, `updated_by`) VALUES
	(1, '1', '本地', '2015-05-07 21:50:41', NULL, NULL, NULL),
	(2, '2', '外地', '2015-05-07 21:50:47', NULL, NULL, NULL);
/*!40000 ALTER TABLE `supplier_type` ENABLE KEYS */;


-- Dumping structure for table srm.uom
CREATE TABLE IF NOT EXISTS `uom` (
  `uom_id` int(11) NOT NULL AUTO_INCREMENT,
  `uom_name` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `updated_by` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`uom_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table srm.uom: ~10 rows (approximately)
/*!40000 ALTER TABLE `uom` DISABLE KEYS */;
INSERT INTO `uom` (`uom_id`, `uom_name`, `description`, `create_time`, `created_by`, `update_time`, `updated_by`) VALUES
	(1, '根', NULL, '2015-05-07 21:51:03', NULL, NULL, NULL),
	(2, '块', NULL, '2015-05-07 21:51:10', NULL, NULL, NULL),
	(3, '包', NULL, '2015-05-07 21:51:14', NULL, NULL, NULL),
	(4, '千克', NULL, '2015-05-07 21:51:19', NULL, NULL, NULL),
	(5, '米', NULL, '2015-05-07 21:51:22', NULL, NULL, NULL),
	(6, '卷', NULL, '2015-05-07 21:51:28', NULL, NULL, NULL),
	(7, '桶', NULL, '2015-05-07 21:51:33', NULL, NULL, NULL),
	(8, '片', NULL, '2015-05-07 21:51:37', NULL, NULL, NULL),
	(9, '个', NULL, '2015-05-07 21:51:41', NULL, NULL, NULL),
	(10, '只', NULL, '2015-05-07 21:51:44', NULL, NULL, NULL);
/*!40000 ALTER TABLE `uom` ENABLE KEYS */;


-- Dumping structure for table srm.workshop
CREATE TABLE IF NOT EXISTS `workshop` (
  `workshop_id` int(11) NOT NULL AUTO_INCREMENT,
  `workshop_code` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `workshop_name` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `updated_by` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`workshop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table srm.workshop: ~3 rows (approximately)
/*!40000 ALTER TABLE `workshop` DISABLE KEYS */;
INSERT INTO `workshop` (`workshop_id`, `workshop_code`, `workshop_name`, `create_time`, `created_by`, `update_time`, `updated_by`) VALUES
	(1, 'W1', '一号车间', '2015-05-07 21:51:55', NULL, NULL, NULL),
	(2, 'W2', '二号车间', '2015-05-07 21:52:08', NULL, NULL, NULL),
	(3, 'W3', '三号车间', '2015-05-07 21:52:20', NULL, NULL, NULL);
/*!40000 ALTER TABLE `workshop` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
