ALTER TABLE job_position 
ADD is_open tinyint(1) NOT NULL DEFAULT (1),
ADD deleted_at datetime NULL;