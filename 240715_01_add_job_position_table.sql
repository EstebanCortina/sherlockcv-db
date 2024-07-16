CREATE TABLE job_position(
	id varchar(36) default(uuid()) NOT NULL PRIMARY KEY,
	name varchar(40) NOT NULL,
	description TEXT NOT NULL,
	key_points TEXT NULL
);