-- SQL (DDL / DML / DCL )
-- DDL

select * from emp;

CREATE TABLE emp_copy AS
SELECT * FROM emp;

select * from emp_copy;

-- 1.사원번호가 7782인 부서를 30 번으로 변경
-- UPDATE  table_name SETcolumn=value WHEREcondition;
UPDATE   emp_copy SET deptno = 30 WHERE empno=7782;

-- 2.사원번호가 7782인 사원의 이름을 홍길숙으로 변경하고 급여를 3500 으로 변경
-- UPDATE  table_name SETcolumn=value WHEREcondition;
UPDATE   emp_copy SET ename = '홍길숙',sal = 3500 WHERE empno=7782;

--3. 모든 부서원의 보너스(Comm)를 300씩 변경
-- UPDATE  table_name SETcolumn=value WHEREcondition;
UPDATE   emp_copy SET Comm = NVL(comm,0)+300;

--4.사원 번호가 7499인 사원의 정보를 삭제
-- DELETE FROMtable_name WHEREcondition;
 DELETE  FROM emp_copy WHERE empno=7499;
 
 --5. 입사일자가 81년 6월 1일 이전인 사원의 정보를 삭제
 DELETE FROM emp_copy WHERE hiredate<'81.06.01';
 
 --6. 입사(사번 : 9999, 사원명: 홍홍홍, 업무 : IT , 월급 : 6000 )
 -- INSERT INTOtable_name( columns ) VALUES ( values );
  INSERT INTO emp_copy( empno, ename, job, sal ) VALUES ( 9999, '홍홍홍', 'IT', 6000  );
 

CREATE TABLE STUDENT (
id char(4),
name varchar2(10),
kor	number(3),
math number(3),
total number(3),
avg number(5,2)
);

--테이블 구조 확인
DESC student;
--데이터(레코드)확인
SELECT*FROM student;

--영어점수 컬럼 추가(eng number(3))
-- ALTER   TABLE  table_name ADD ( [ column_name  data_type ] );
-- ALTER   TABLE  table_nameMODIFY( [ column_name  data_type ] ); 
-- ALTER   TABLE  table_nameDROP( [ column_name ] );
ALTER TABLE student ADD(eng number(3));
-- 총점 컬럼 삭제
ALTER TABLE student DROP(total);
-- 평균 컬럼에서 소수점 1자리 변경
ALTER TABLE student MODIFY(avg number(4,1));
DESC student;


---데이타입력
INSERT INTO student VALUES('8001','홍길순',100,80,0,50);
INSERT INTO student (id,name,math,eng) VALUES ('8088','홍길동',55,88);

--데이타(레코드) 확인
SELECT * FROM student;

--

