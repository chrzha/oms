CREATE TABLE `orders` (
	`order_id` VARCHAR(50) NOT NULL,
	`order_status` INT(1) NOT NULL DEFAULT '0',
	`order_comment` VARCHAR(200) NULL DEFAULT NULL,
	`order_supplier_id` INT(11) NOT NULL,
	`order_paytype_id` INT(11) NOT NULL,
	`order_getdeptmt_id` INT(11) NULL DEFAULT NULL,
	`order_buydeptmt_id` INT(11) NULL DEFAULT NULL,
	`order_buyer_id` INT(11) NULL DEFAULT NULL,
	`order_address` VARCHAR(200) NULL DEFAULT NULL,
	`order_buytime` DATE NULL DEFAULT NULL,
	`order_gettime` DATE NULL DEFAULT NULL,
	`order_outtime` DATE NULL DEFAULT NULL,
	`order_getreason` VARCHAR(500) NULL DEFAULT NULL,
	`created_by` VARCHAR(50) NULL DEFAULT NULL,
	`created_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
	`updated_by` VARCHAR(50) NULL DEFAULT NULL,
	`updated_time` TIMESTAMP NULL DEFAULT NULL,
	PRIMARY KEY (`order_id`),
	INDEX `fk_order_supplier` (`order_supplier_id`),
	INDEX `fk_order_buy` (`order_buyer_id`),
	CONSTRAINT `fk_order_buy` FOREIGN KEY (`order_buyer_id`) REFERENCES `buyer` (`buyer_id`) ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT `fk_order_supplier` FOREIGN KEY (`order_supplier_id`) REFERENCES `supplier` (`supplier_id`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
