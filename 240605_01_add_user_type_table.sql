CREATE TABLE `user_type`(
	id varchar(36) default(uuid()) not null primary key,
	name varchar(10) not null,
	is_active tinyint(1) default(0)
);