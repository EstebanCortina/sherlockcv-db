DELIMITER //
DROP TRIGGER IF EXISTS `ai_user_uuid`//
CREATE TRIGGER `ai_user_uuid` AFTER INSERT ON `user`
FOR EACH ROW BEGIN
    SET @last_uuid = NEW.id;
END//
DELIMITER ;

DELIMITER //
DROP TRIGGER IF EXISTS `ai_user_type_uuid`//
CREATE TRIGGER `ai_user_type_uuid` AFTER INSERT ON `user_type`
FOR EACH ROW BEGIN
    SET @last_uuid = NEW.id;
END//
DELIMITER ;