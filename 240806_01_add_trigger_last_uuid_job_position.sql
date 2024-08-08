DROP TRIGGER IF EXISTS ai_job_position_uuid_insert;
CREATE TRIGGER ai_job_position_uuid_insert AFTER INSERT ON job_position
FOR EACH ROW BEGIN
    SET @last_uuid = NEW.id;
END;