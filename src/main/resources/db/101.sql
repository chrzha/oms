CREATE TABLE `goods` (
	`goods_id` VARCHAR(50) NOT NULL DEFAULT '0',
	`goods_name` VARCHAR(50) NOT NULL DEFAULT '0',
	`goods_type` VARCHAR(50) NOT NULL DEFAULT '0',
	`goods_buy_unit` VARCHAR(50) NOT NULL DEFAULT '0',
	`goods_comput_unit` VARCHAR(50) NOT NULL DEFAULT '0',
	`goods_comput_rate` FLOAT NOT NULL DEFAULT '0',
	`goods_price` FLOAT NOT NULL DEFAULT '0',
	`goods_in_rate` FLOAT NOT NULL DEFAULT '0',
	PRIMARY KEY (`goods_id`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
CREATE TABLE `order_goods` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`order_id` VARCHAR(50) NOT NULL DEFAULT '0',
	`goods_id` VARCHAR(50) NOT NULL DEFAULT '0',
	`count` INT(11) NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`, `order_id`, `goods_id`),
	INDEX `FK_order_goods_orders` (`order_id`),
	INDEX `FK_order_goods_goods` (`goods_id`),
	CONSTRAINT `FK_order_goods_goods` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`goods_id`) ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT `FK_order_goods_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=2
;
