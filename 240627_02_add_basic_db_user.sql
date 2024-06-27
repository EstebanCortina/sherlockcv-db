CREATE USER 'client'@'%' IDENTIFIED BY '431d7a3e-3e18-4502-a854-bee351eeb7ab';

SET @current_db = DATABASE();
SET @grant_query = CONCAT('GRANT SELECT ON ', @current_db, '.* TO \'client\'@\'%\';');

PREPARE stmt FROM @grant_query;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

FLUSH PRIVILEGES;
