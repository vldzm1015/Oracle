 -- emp( 사원테이블 )에 8000 사번에 본인 이름으로 월급 1000 데이타입력
 -- INSERT             INTOtable_name( columns ) VALUES ( values );
 INSERT   INTO emp ( empno, ENAME, SAL ) VALUES ( 8000, '강민희ㅏ' , 1000 );
 --입력
 INSERT   INTO emp ( empno, ENAME, SAL ) VALUES ( 8000, 'ㅁ이이이' , 1000 ); 
 --무결성 제약조건 에러
 INSERT   INTO emp ( empno, ENAME, SAL ) VALUES ( 7787, 'ㅁ이이이' , 9000 ); 
 --입력
 INSERT   INTO emp ( empno, ENAME, SAL , deptno ) VALUES ( 8001, 'ㅁ이이이' , 9000 , 20 ); 
 --입력
 INSERT   INTO emp ( empno, ENAME, SAL , deptno ) VALUES ( 8002, '홍길숙' , 9000 , 60 ); 
 --무결성 제약조건 에러
 
 -- INSERT / EDLETE / UPDATE  일 경우에만 cmommit / rollbaack 중에 고민하면됨
-- cmommit;  -- 작업내용 저장
-- rollbaack; -- 내용저장x ( 실수했을 경우 rollbaack하면 마지막 cmommit 시점으로 돌아감) 
 
 desc emp; 
 -- 구조확인
 

 SELECT * FROM emp;  
 -- 내용확인
 
 
 /*
    테이블명 : info
    hakbun  char(14)
    name    varchar2(10)
    jumin   char(4)
    gender  varchar2(10)
    age     number(3)   --  ( -999  ~ +999 )
 */
 /* 데이타 입력
    1001 학번 홍길동
    1002 학번 김길동
    1003 학번 맹길동
    주민번호가 801212-123467인 홍길동학생
    26세 남자 입력

*/
 
 CREATE TABLE info(
    hakbun  char(4),
    name    varchar2(10),
    jumin   char(14),
    gender  varchar2(10),
    age     number(3));
 
 desc info;
 SELECT * FROM info;
 
 INSERT   INTO info ( hakbun, name ) VALUES ( '1001', '홍길동' ); 
 INSERT   INTO info ( hakbun, name ) VALUES ( '1002', '김길동' ); 
 INSERT   INTO info ( hakbun, name ) VALUES ( '1002', '맹길동' ); 
 INSERT   INTO info ( jumin, name ) VALUES ( '801212-123467', '홍길동' ); 
 INSERT   INTO info ( gender, age ) VALUES ( '남자', '26' ); 
 -- PRIMARY  KEY 지정 전에는 데이터 중복가능
 
 SELECT * FROM info;
 delete FROM info;    
 
 -- 제약조건 ( 기본키 )  --테이블을 만들고 나중에 제약조건을 걸어주는 경우
ALTER  TABLE   info
ADD  CONSTRAINT  pk_info_hakbun  PRIMARY  KEY ( hakbun );
 
 INSERT   INTO info ( hakbun, name ) VALUES ( '1001', '홍길동' ); 
 INSERT   INTO info ( hakbun, name ) VALUES ( '1002', '김길동' ); 
 INSERT   INTO info ( hakbun, name ) VALUES ( '1002', '맹길동' ); --에러
 INSERT   INTO info ( jumin, name ) VALUES ( '801212-123467', '홍길동' ); --에러
 INSERT   INTO info ( gender, age ) VALUES ( '남자', '26' ); --에러

 
 -- 제약조건 확인
 SELECT constraint_name , constraint_type
 FROM user_constraints;
 
 DROP TABLE info;
 
/* 
테이블 레벨 제약조건 방식
 CREATE TABLE  table_name 
  ( column_name  data_type,
    CONSTRAINT  fk_name FOREIGN  KEY (column_name )
     REFERENCES    ef_table_name  ( ref_column_name )
 );
 */
 
 -- 테이블을 만들고 마지막에 제약조건을 생성하는 경우
 CREATE TABLE info(
    hakbun  char(4),
    name    varchar2(10),
    jumin   char(14),
    gender  varchar2(10),
    age     number(3),
 CONSTRAINT  pk_info_hakbun  PRIMARY  KEY ( hakbun ) 
 /* CONSTRAINT uq_info_jumin UNIQUE (jumin); */
 );
 
  DELETE FROM info; 
 --NOT NULL 
 ALTER TABLE INFO MODIFY (name varchar2(10) not null);
 desc info;
 INSERT   INTO info ( hakbun, name ) VALUES ( '1001', '홍길동' ); 
 INSERT   INTO info ( hakbun, name ) VALUES ( '1002', '김길동' ); 
 INSERT   INTO info ( hakbun, name ) VALUES ( '1002', '맹길동' ); --에러
 INSERT   INTO info ( jumin, name ) VALUES ( '801212-123467', '홍길동' ); --에러
 INSERT   INTO info (  hakbun, gender, age ) VALUES ('1111', '남자', '26' ); --에러
  
 -- PRIMARY  KEY : 무조건 들어와야하고 중복불가
 --UNIQUE 안들어와도 상관없지만 들어온다면 중복불가
 ALTER TABLE info ADD
 CONSTRAINT uq_info_jumin UNIQUE (jumin);
 
 SELECT * FROM INFO;
 INSERT   INTO info (  hakbun, name , jumin ) VALUES ('1003', '맹길동', '990101-1234567' );
 INSERT   INTO info (  hakbun, name , jumin ) VALUES ('1004', '박길동', '990101-1234567' ); 
 --에러 jumin -UNIQUE
 INSERT   INTO info (  name , jumin ) VALUES ('최길동', '980101-1234567' ); 
 --에러 hakbun -PRIMARY  KEY 
 INSERT   INTO info ( hakbun, name  ) VALUES ( '1005', '문길동' ); 
 
 --CHECK
ALTER TABLE info ADD 
CONSTRAINT ck_info_gender CHECK (gender IN ( 'M', 'F' ));

INSERT   INTO info ( hakbun, name ,gender  ) VALUES ( '1006', '배길동', 'M' ); 
INSERT   INTO info ( hakbun, name ,gender  ) VALUES ( '1007', '정길동', 'F' ); 
INSERT   INTO info ( hakbun, name ,gender  ) VALUES ( '1008', '안길동', '남자' );
--오류  gender에는 M or F 만 들어갈 수 있다.
 
 --defalut : 제약조건은 아니지만 제약조건과 같이 많이 사용 / 기본값설정
 ALTER TABLE info MODIFY ( gender char(4)default 'M' );
 
 INSERT   INTO info ( hakbun, name ) VALUES ( '1009', '강길동' ); 
 --gender 설정 안해서 기본값인 M으로 설정됨
 
  DROP TABLE info;

CREATE TABLE info(
    hakbun  char(4),
    name    varchar2(10) not null,
    jumin   char(14),
    gender  varchar2(10)default 'M',
    age     number(3),
    deptno  number(2),
    CONSTRAINT  pk_info_hakbun  PRIMARY  KEY ( hakbun ),
    CONSTRAINT uq_info_jumin UNIQUE (jumin),
    CONSTRAINT ck_info_gender CHECK (gender IN ( 'M', 'F' )),
    CONSTRAINT fk_info_deptno FOREIGN KEY (deptno) REFERENCES dept(deptno)
 );
 
INSERT INTO info ( hakbun, name, gender, deptno ) VALUES ('9000','송혜교', 'F', 10); 
INSERT INTO info ( hakbun, name, gender, deptno ) VALUES ('9001','전지현', 'F', 50); --에러
INSERT INTO info ( hakbun, name, gender, deptno ) VALUES ('9001','전지현', 'F', 40); 
 
DROP TABLE info;
 
  

   
   
 
 
 
 
 