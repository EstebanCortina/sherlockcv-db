CREATE USER 'client'@'%' IDENTIFIED BY '89456354-a16d-4e7e-ac6c-d52ae0886029';

SET @current_db = DATABASE();
SET @grant_query = CONCAT('GRANT SELECT ON ', @current_db, '.* TO \'client\'@\'%\';');

PREPARE stmt FROM @grant_query;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

FLUSH PRIVILEGES;