CREATE USER [A.GU.ODE_<dw>_us_trading_public_db_readers] FROM EXTERNAL PROVIDER ;
CREATE USER [A.GU.ODE_<dw>_us_trading_public_db_writers] FROM EXTERNAL PROVIDER ;
CREATE USER [A.GU.ODE_<dw>_us_trading_public_db_ddladmins] FROM EXTERNAL PROVIDER ;
 

alter user [A.GU.ODE_<dw>_us_trading_public_db_readers] with default_schema=us_trading_public;
alter user [A.GU.ODE_<dw>_us_trading_public_db_writers] with default_schema=us_trading_public;
alter user [A.GU.ODE_<dw>_us_trading_public_db_ddladmins] with default_schema=us_trading_public;
 

CREATE ROLE [us_trading_public_db_role_reader];
CREATE ROLE [us_trading_public_db_role_writer];
CREATE ROLE [us_trading_public_db_role_ddladmin];
 

GRANT SELECT ON SCHEMA :: [us_trading_public] TO [us_trading_public_db_role_reader];
 

GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA :: [us_trading_public] TO [us_trading_public_db_role_writer];
GRANT EXECUTE, ADMINISTER DATABASE BULK OPERATIONS TO [us_trading_public_db_role_writer];
 

GRANT SELECT, INSERT, UPDATE, DELETE, CONTROL ON SCHEMA :: [us_trading_public] TO [us_trading_public_db_role_ddladmin];
GRANT CREATE TABLE, CREATE VIEW, EXECUTE, ADMINISTER DATABASE BULK OPERATIONS, CREATE PROCEDURE TO [us_trading_public_db_role_ddladmin];
 

EXEC sp_addrolemember 'us_trading_public_db_role_reader', 'A.GU.ODE_<dw>_us_trading_public_db_readers';
EXEC sp_addrolemember 'us_trading_public_db_role_writer', 'A.GU.ODE_<dw>_us_trading_public_db_writers';
EXEC sp_addrolemember 'us_trading_public_db_role_ddladmin', 'A.GU.ODE_<dw>_us_trading_public_db_ddladmins';


CREATE USER [A.GU.ODE_<dw>_weather_data_dnvgl_db_readers] FROM EXTERNAL PROVIDER ;
CREATE USER [A.GU.ODE_<dw>_weather_data_dnvgl_db_writers] FROM EXTERNAL PROVIDER ;
CREATE USER [A.GU.ODE_<dw>_weather_data_dnvgl_db_ddladmins] FROM EXTERNAL PROVIDER ;
 

alter user [A.GU.ODE_<dw>_weather_data_dnvgl_db_readers] with default_schema=weather_data_dnvgl;
alter user [A.GU.ODE_<dw>_weather_data_dnvgl_db_writers] with default_schema=weather_data_dnvgl;
alter user [A.GU.ODE_<dw>_weather_data_dnvgl_db_ddladmins] with default_schema=weather_data_dnvgl;
 

CREATE ROLE [weather_data_dnvgl_db_role_reader];
CREATE ROLE [weather_data_dnvgl_db_role_writer];
CREATE ROLE [weather_data_dnvgl_db_role_ddladmin];
 

GRANT SELECT ON SCHEMA :: [weather_data_dnvgl] TO [weather_data_dnvgl_db_role_reader];
 

GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA :: [weather_data_dnvgl] TO [weather_data_dnvgl_db_role_writer];
GRANT EXECUTE, ADMINISTER DATABASE BULK OPERATIONS TO [weather_data_dnvgl_db_role_writer];
 

GRANT SELECT, INSERT, UPDATE, DELETE, CONTROL ON SCHEMA :: [weather_data_dnvgl] TO [weather_data_dnvgl_db_role_ddladmin];
GRANT CREATE TABLE, CREATE VIEW, EXECUTE, ADMINISTER DATABASE BULK OPERATIONS, CREATE PROCEDURE TO [weather_data_dnvgl_db_role_ddladmin];
 

EXEC sp_addrolemember 'weather_data_dnvgl_db_role_reader', 'A.GU.ODE_<dw>_weather_data_dnvgl_db_readers';
EXEC sp_addrolemember 'weather_data_dnvgl_db_role_writer', 'A.GU.ODE_<dw>_weather_data_dnvgl_db_writers';
EXEC sp_addrolemember 'weather_data_dnvgl_db_role_ddladmin', 'A.GU.ODE_<dw>_weather_data_dnvgl_db_ddladmins';


CREATE USER [A.GU.ODE_<dw>_weather_data_meteologica_db_readers] FROM EXTERNAL PROVIDER ;
CREATE USER [A.GU.ODE_<dw>_weather_data_meteologica_db_writers] FROM EXTERNAL PROVIDER ;
CREATE USER [A.GU.ODE_<dw>_weather_data_meteologica_db_ddladmins] FROM EXTERNAL PROVIDER ;
 

alter user [A.GU.ODE_<dw>_weather_data_meteologica_db_readers] with default_schema=weather_data_meteologica;
alter user [A.GU.ODE_<dw>_weather_data_meteologica_db_writers] with default_schema=weather_data_meteologica;
alter user [A.GU.ODE_<dw>_weather_data_meteologica_db_ddladmins] with default_schema=weather_data_meteologica;
 

CREATE ROLE [weather_data_meteologica_db_role_reader];
CREATE ROLE [weather_data_meteologica_db_role_writer];
CREATE ROLE [weather_data_meteologica_db_role_ddladmin];
 

GRANT SELECT ON SCHEMA :: [weather_data_meteologica] TO [weather_data_meteologica_db_role_reader];
 

GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA :: [weather_data_meteologica] TO [weather_data_meteologica_db_role_writer];
GRANT EXECUTE, ADMINISTER DATABASE BULK OPERATIONS TO [weather_data_meteologica_db_role_writer];
 

GRANT SELECT, INSERT, UPDATE, DELETE, CONTROL ON SCHEMA :: [weather_data_meteologica] TO [weather_data_meteologica_db_role_ddladmin];
GRANT CREATE TABLE, CREATE VIEW, EXECUTE, ADMINISTER DATABASE BULK OPERATIONS, CREATE PROCEDURE TO [weather_data_meteologica_db_role_ddladmin];
 

EXEC sp_addrolemember 'weather_data_meteologica_db_role_reader', 'A.GU.ODE_<dw>_weather_data_meteologica_db_readers';
EXEC sp_addrolemember 'weather_data_meteologica_db_role_writer', 'A.GU.ODE_<dw>_weather_data_meteologica_db_writers';
EXEC sp_addrolemember 'weather_data_meteologica_db_role_ddladmin', 'A.GU.ODE_<dw>_weather_data_meteologica_db_ddladmins';


CREATE USER [A.GU.ODE_<dw>_wp_tenaska_db_readers] FROM EXTERNAL PROVIDER ;
CREATE USER [A.GU.ODE_<dw>_wp_tenaska_db_writers] FROM EXTERNAL PROVIDER ;
CREATE USER [A.GU.ODE_<dw>_wp_tenaska_db_ddladmins] FROM EXTERNAL PROVIDER ;
 

alter user [A.GU.ODE_<dw>_wp_tenaska_db_readers] with default_schema=wp_tenaska;
alter user [A.GU.ODE_<dw>_wp_tenaska_db_writers] with default_schema=wp_tenaska;
alter user [A.GU.ODE_<dw>_wp_tenaska_db_ddladmins] with default_schema=wp_tenaska;
 

CREATE ROLE [wp_tenaska_db_role_reader];
CREATE ROLE [wp_tenaska_db_role_writer];
CREATE ROLE [wp_tenaska_db_role_ddladmin];
 

GRANT SELECT ON SCHEMA :: [wp_tenaska] TO [wp_tenaska_db_role_reader];
 

GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA :: [wp_tenaska] TO [wp_tenaska_db_role_writer];
GRANT EXECUTE, ADMINISTER DATABASE BULK OPERATIONS TO [wp_tenaska_db_role_writer];
 

GRANT SELECT, INSERT, UPDATE, DELETE, CONTROL ON SCHEMA :: [wp_tenaska] TO [wp_tenaska_db_role_ddladmin];
GRANT CREATE TABLE, CREATE VIEW, EXECUTE, ADMINISTER DATABASE BULK OPERATIONS, CREATE PROCEDURE TO [wp_tenaska_db_role_ddladmin];
 

EXEC sp_addrolemember 'wp_tenaska_db_role_reader', 'A.GU.ODE_<dw>_wp_tenaska_db_readers';
EXEC sp_addrolemember 'wp_tenaska_db_role_writer', 'A.GU.ODE_<dw>_wp_tenaska_db_writers';
EXEC sp_addrolemember 'wp_tenaska_db_role_ddladmin', 'A.GU.ODE_<dw>_wp_tenaska_db_ddladmins';

CREATE USER [A.GU.ODE_<dw>_weather_data_vaisala_db_readers] FROM EXTERNAL PROVIDER ;
CREATE USER [A.GU.ODE_<dw>_weather_data_vaisala_db_writers] FROM EXTERNAL PROVIDER ;
CREATE USER [A.GU.ODE_<dw>_weather_data_vaisala_db_ddladmins] FROM EXTERNAL PROVIDER ;
 

alter user [A.GU.ODE_<dw>_weather_data_vaisala_db_readers] with default_schema=weather_data_vaisala;
alter user [A.GU.ODE_<dw>_weather_data_vaisala_db_writers] with default_schema=weather_data_vaisala;
alter user [A.GU.ODE_<dw>_weather_data_vaisala_db_ddladmins] with default_schema=weather_data_vaisala;
 

CREATE ROLE [weather_data_vaisala_db_role_reader];
CREATE ROLE [weather_data_vaisala_db_role_writer];
CREATE ROLE [weather_data_vaisala_db_role_ddladmin];
 

GRANT SELECT ON SCHEMA :: [weather_data_vaisala] TO [weather_data_vaisala_db_role_reader];
 

GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA :: [weather_data_vaisala] TO [weather_data_vaisala_db_role_writer];
GRANT EXECUTE, ADMINISTER DATABASE BULK OPERATIONS TO [weather_data_vaisala_db_role_writer];
 

GRANT SELECT, INSERT, UPDATE, DELETE, CONTROL ON SCHEMA :: [weather_data_vaisala] TO [weather_data_vaisala_db_role_ddladmin];
GRANT CREATE TABLE, CREATE VIEW, EXECUTE, ADMINISTER DATABASE BULK OPERATIONS, CREATE PROCEDURE TO [weather_data_vaisala_db_role_ddladmin];
 

EXEC sp_addrolemember 'weather_data_vaisala_db_role_reader', 'A.GU.ODE_<dw>_weather_data_vaisala_db_readers';
EXEC sp_addrolemember 'weather_data_vaisala_db_role_writer', 'A.GU.ODE_<dw>_weather_data_vaisala_db_writers';
EXEC sp_addrolemember 'weather_data_vaisala_db_role_ddladmin', 'A.GU.ODE_<dw>_weather_data_vaisala_db_ddladmins';