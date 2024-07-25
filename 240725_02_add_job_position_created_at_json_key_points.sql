ALTER TABLE job_position
ADD created_at datetime NULL AFTER is_open,
MODIFY key_points JSON default(JSON_ARRAY()) NOT NULL;