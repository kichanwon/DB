/*
 * 
 */
--1 line 

ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
--	12c 버전 이전 문법 허용 구문

CREATE USER workbook IDENTIFIED BY workbook;
-- user/PW 생성 ( kh/kh1234 )


GRANT resource, CONNECT TO workbook;
ALTER USER workbook DEFAULT TABLESPACE system quota unlimited ON system;
/*
 * 사용자 계정 권한 부여 설정
 * resource	: 테이블이나 인덱스같은 DB 객체를 생성할 권한
 * connect	: DB에 연결하고 로그인 할 수 있는 권한
 * 
 * 객체가 생성될 수 있는 공간 할당량 unlimeted 지정
 */



SELECT * FROM all_users;