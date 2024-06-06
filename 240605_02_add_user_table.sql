CREATE TABLE `user` (
	`id` varchar(36) default(uuid()) not null primary key,
	`name` varchar(50) not null,
	`last_name` varchar(50) not null,
	`email` varchar(60) not null,
	`password` varchar(255) not null,
	`user_type_id` varchar(36) not null,
	CONSTRAINT `fk_user_user_type_id` FOREIGN KEY (`user_type_id`) REFERENCES `user_type`(`id`)
);