alter session set "_ORACLE_SCRIPT"=false;  
create user c##kh2 identified by kh2;
-- 오류 create user kh2 identified by kh2;
create role c##role_scott_manager;
-- 오류 create role role_scott_manager;

alter session set "_ORACLE_SCRIPT"=true;  
create user kh2 identified by kh2;
create role role_manager;

grant connect, resource to kh2;
-- connect -- 롤이름
-- 권한들의 묶음 = 롤
-- create session -- 접속권한
-- create table, alter table, drop table, create view, drop view, create sequence, alter sequence......
-- 공간 space 를 사용하는 권한들 묶어서 resource 롤에 지정함.

grant create table,create view, connect, resource  to role_manager;
-- grant 권한명, 권한명,... 롤명, 롤명,...   to 롤명, 사용자명, ... ;
grant role_manager to kh2;

revoke create view from role_manager;
