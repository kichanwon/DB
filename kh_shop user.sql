
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

CREATE USER kh_shop IDENTIFIED BY khshop;

GRANT resource, CONNECT TO kh_shop;
ALTER USER kh_shop DEFAULT TABLESPACE system quota unlimited ON system;