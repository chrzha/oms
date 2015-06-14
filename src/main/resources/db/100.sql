CREATE TABLE `orders` (
	`order_id` VARCHAR(50) NOT NULL,
	`order_status` INT(1) NOT NULL DEFAULT '0',
	`order_comment` VARCHAR(200) NULL DEFAULT NULL,
	`created_by` VARCHAR(50) NOT NULL,
	`created_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`updated_by` VARCHAR(50) NOT NULL,
	`updated_time` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
	PRIMARY KEY (`order_id`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;