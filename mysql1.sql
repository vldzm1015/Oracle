-- 데이타베이스목록보기
show databases; 
 
-- 데이타베이스 생성
create database test; 
 
-- 데이타베이스 사용
use test; 

-- 테이블 생성
create table temp( empno int not null auto_increment, ename varchar(20), mgr int, sal int, deptno int, primary key(empno) ); 
 
desc temp; 
 
 