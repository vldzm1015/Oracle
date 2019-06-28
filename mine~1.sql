
CREATE TABLE memberTest
(	
	id		varchar2(20) primary key,
	password	varchar2(20) not null,
	name		varchar2(10) not null,
	tel		varchar2(20),
	addr		varchar2(400)
);
select * from memberTest;



create table ajax_temp (
	name 	varchar2(10)     not null,
 	age 	varchar2(4) 		not null,
  	tel 	varchar2(14) 	not null,
	addr 	varchar2(50) 	not null
);
select * from ajax_temp;

INSERT INTO  ajax_temp(name, age, tel, addr) values(1616, 1616, 1616, 1616);



------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------


CREATE TABLE  GuestTB 
(

MESSAGE_ID 		NUMBER			primary key,	
GUEST_NAME		VARCHAR2(10)		NOT NULL,
PASSWORD			VARCHAR2(10)		NOT NULL,
MESSAGE				VARCHAR2(1024)		NOT NULL);
CREATE SEQUENCE seq_messageId_guestTb;

SELECT   * FROM GuestTB;

DELETE FROM GuestTB WHERE message_id=24 and password=7878;

SELECT A.message_id, A.guest_name, A.password, A.message
FROM 
(SELECT ROW_NUMBER() OVER(ORDER BY MESSAGE_ID DESC) AS RNUM
, MESSAGE_ID, GUEST_NAME, PASSWORD, MESSAGE FROM GuestTB ) A
WHERE A.rnum BETWEEN 4 AND 6;

SELECT ROW_NUMBER()  FROM GuestTB  ORDER BY MESSAGE_ID DESC;


------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------

CREATE TABLE  ARTICLE
(ARTICLE_ID				NUMBER		primary key,	
GROUP_ID						NUMBER,
SEQUENCE_NO				CHAR(16),
POSTING_DATE		DATE,
READ_COUNT						NUMBER,
WRITER_NAME			VARCHAR2(20),
PASSWORD					VARCHAR2(20),
TITLE							VARCHAR2(100),
CONTENT						VARCHAR2(1024));
CREATE SEQUENCE SEQ_ARTICLE_ID_ARTICLE;
CREATE SEQUENCE SEQ_GROUP_ID_ARTICLE;


------------------------------------------------------------------------------------------------------

SELECT ARTICLE_ID, GROUP_ID,  SEQUENCE_NO, POSTING_DATE , READ_COUNT, WRITER_NAME, TITLE   FROM ARTICLE WHERE ARTICLE_ID=? ORDER BY SEQUENCE_NO DESC  ;

INSERT INTO ARTICLE ( ARTICLE_ID, GROUP_ID, SEQUENCE_NO,  POSTING_DATE, READ_COUNT, WRITER_NAME, PASSWORD, TITLE, CONTENT )
values (SEQ_ARTICLE_ID_ARTICLE.nextval, 2626, 2626, sysdate, 0, 2626 , 2626, 2626, 2626 );

SELECT    * FROM ARTICLE;

SELECT A.ARTICLE_ID, A.GROUP_ID,  A.SEQUENCE_NO, A.POSTING_DATE , A.READ_COUNT, A.WRITER_NAME, A.TITLE  
FROM  (SELECT ROW_NUMBER() OVER(ORDER BY SEQUENCE_NO DESC) AS RNUM , ARTICLE_ID, GROUP_ID,  SEQUENCE_NO, POSTING_DATE , READ_COUNT, WRITER_NAME, TITLE FROM ARTICLE ) A  
WHERE A.rnum BETWEEN  1  AND 3;

DELETE FROM article;


------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------

CREATE TABLE comment_tab(
comment_no number(10) primary key,
user_id varchar2(20),
comment_content varchar2(500),
reg_date date
);

CREATE SEQUENCE seq_comment_no
increment by 1
start with 0
maxvalue 9999999
minvalue 0;


SELECT*FROM comment_tab;
INSERT INTO comment_tab (comment_no,user_id,comment_content,reg_date) VALUES(seq_comment_no.NEXTVAL,'test11','1234',SYSDATE);
INSERT INTO comment_tab (comment_no,user_id,comment_content,reg_date) VALUES(seq_comment_no.NEXTVAL,'test22','1234',SYSDATE);
INSERT INTO comment_tab (comment_no,user_id,comment_content,reg_date) VALUES(seq_comment_no.NEXTVAL,'test23','1234',SYSDATE);
INSERT INTO comment_tab (comment_no,user_id,comment_content,reg_date) VALUES(seq_comment_no.NEXTVAL,'test24','1234',SYSDATE);
INSERT INTO comment_tab (comment_no,user_id,comment_content,reg_date) VALUES(seq_comment_no.NEXTVAL,'test25','1234',SYSDATE);
INSERT INTO comment_tab (comment_no,user_id,comment_content,reg_date) VALUES(seq_comment_no.NEXTVAL,'test21','1234',SYSDATE);

DELETE  FROM comment_tab 	 WHERE comment_no=6;


UPDATE comment_tab SET  user_id='test50',  comment_content='1234'
WHERE comment_no=(SELECT comment_no FROM comment_tab WHERE comment_no=2);


------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------

CREATE TABLE  product(
pnum    NUMBER  primary key,	
pname   VARCHAR2(20),
price       CHAR(16),
pcount      CHAR(16));

CREATE TABLE  sales(
pnum     NUMBER ,	
snum    NUMBER ,	
scount      CHAR(16) ,
sdate      DATE,
CONSTRAINT SALES_FK_pnum FOREIGN KEY (pnum) REFERENCES product (pnum));
CREATE SEQUENCE seq_snum_sales;

------------------------------------------------------------------------------------------------------

INSERT INTO product(pnum, pname, price, pcount) values(3, 'caffelatte', 3000, 100);
INSERT INTO product(pnum, pname, price, pcount) values(4, 'cappuccino', 2000, 100);
INSERT INTO product(pnum, pname, price, pcount) values(5, 'dolceratte', 1000, 100);
INSERT INTO product(pnum, pname, price, pcount) values(6, 'caffemocca', 1500, 100);
INSERT INTO product(pnum, pname, price, pcount) values(7, 'frappuccino', 2000, 100);
INSERT INTO product(pnum, pname, price, pcount) values(8, 'chaitea', 1000, 100);
INSERT INTO product(pnum, pname, price, pcount) values(9, 'greentea', 1500, 100);

SELECT     * FROM product;


------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
