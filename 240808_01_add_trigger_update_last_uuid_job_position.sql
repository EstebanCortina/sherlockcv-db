DROP TRIGGER IF EXISTS ai_job_position_uuid_update;
CREATE TRIGGER ai_job_position_uuid AFTER UPDATE ON job_position
FOR EACH ROW BEGIN
    SET @last_uuid = NEW.id;
END;