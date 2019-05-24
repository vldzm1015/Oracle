CREATE TABLE ACCOUNT(
ACCOUNT_NUM VARCHAR2(20),
CUSTOMER VARCHAR2(20),
AMOUNT INT,
CONSTRAINT ACCOUNT_PK_ACCOUNT_NUM PRIMARY KEY (ACCOUNT_NUM));

INSERT INTO ACCOUNT(ACCOUNT_NUM,CUSTOMER,AMOUNT) VALUES ('111-11-111','홍길동',10000); 
INSERT INTO ACCOUNT(ACCOUNT_NUM,CUSTOMER,AMOUNT) VALUES ('222-22-222','박제비',2000); 
commit;

select * from account;



SELECT
    *
FROM video;
/*
select 비디오번호, 제목, 고객명, 전화번호, 
            대여일+3 반납예정일, '미납'반납여부

from 대여테이블 r 비디오테이블 v 고객테이블 c

where r.비디오번호 = v. 비디오번호
	and r.전화번호 = c.전화번호
    */
    
SELECT v.V_NUM, v.TITLE, c.NAME, r.TEL, r.RENTDAY, r.AVAILABLE
FROM RENT r INNER JOIN video v 
on r.v_num = v.v_num
INNER JOIN customer c
on c.s_tel = r.tel
where sysdate = rentday+3 or available= 'F';

SELECT
    *
FROM rent;