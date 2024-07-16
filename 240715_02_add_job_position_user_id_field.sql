ALTER TABLE job_position
ADD COLUMN user_id varchar(36) AFTER id,
ADD CONSTRAINT fk_jobfk_job_position_user_id_1 
FOREIGN KEY (user_id) REFERENCES `user`(`id`);