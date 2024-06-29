ALTER TABLE `user` ADD COLUMN is_active tinyint(1) default(1);
ALTER TABLE `user` ADD COLUMN deleted_at datetime;