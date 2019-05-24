CREATE TABLE GOGEK (
    ID      VARCHAR2(16),
    NAME    VARCHAR2(10) NOT NULL,
    TEL     CHAR(12),
    CONSTRAINT  PK_GOGEK_ID  PRIMARY  KEY ( ID ),
    CONSTRAINT uq_GOGEK_GOGEK UNIQUE (TEL)
    );

CREATE TABLE SANGPUM (
    NO            VARCHAR2(12),
    TITLE         VARCHAR2(20) NOT NULL,
    DETAIL        VARCHAR2(200),
    COUNT         NUMBER(20)NOT NULL,
    PRICE         NUMBER(20),
    CONSTRAINT  PK_SANGPUM_NO  PRIMARY  KEY ( NO )
    );
 
CREATE TABLE JUMUN (
    NO            CHAR(4),
    GOGEK         VARCHAR2(12) NOT NULL,
    SANGPUM       VARCHAR2(20),
    COUNT         NUMBER(20)NOT NULL,
    JUMUNIL       DATE,
    CONSTRAINT  PK_JUMUN_NO  PRIMARY  KEY ( NO ),
    CONSTRAINT JUMUN_FK_GOGEK FOREIGN KEY(GOGEK) REFERENCES GOGEK(ID),
    CONSTRAINT JUMUN_FK_SANGPUM FOREIGN KEY(SANGPUM) REFERENCES SANGPUM(NO)
    );
    
INSERT INTO gogek ( id, name, tel ) VALUES('babo1234','홍길동', '031-333-3333' );
INSERT INTO gogek ( id, name, tel ) VALUES('babo1111','김길동', '031-111-1111' );
INSERT INTO gogek ( id, name, tel ) VALUES('babo2222','홍길동', '031-222-2222' );
INSERT INTO gogek ( id, name, tel ) VALUES('babo9999','박길동', '031-333-3333' );
--UNIQUE 위배
INSERT INTO gogek ( id, name, tel ) VALUES('babo1234','맹길동', '031-999-9999' );
-- 오류  무결성 제약조건 위배. id 중복.
INSERT INTO gogek ( id, name, tel ) VALUES('babo12345','이길동', '031-333-1234' );
INSERT INTO gogek ( id, name, tel ) VALUES('123','최길동', '031-999-9999' );
INSERT INTO gogek ( id, name ) VALUES('babo','봉길동' );
INSERT INTO gogek ( id, tel ) VALUES('babo1988','031-888-8888' );
-- 오류 name에 not null

INSERT INTO sangpum ( no, title, count,price, detail ) VALUES ('A00001','이쁜바지', 30, 1000, '싸고이뻐서 금방 다 팔릴 바지입니다' );
INSERT INTO sangpum ( no, title, count,price, detail ) VALUES ('A00002','그냥바지', 20, 500, '그냥이뻐고 편안한 바지입니다' );
INSERT INTO sangpum ( no, title, count )VALUES ('B00009','윗도리', 20 );
INSERT INTO sangpum ( no, title, count,price ) VALUES ('Z0001','비싼코트', 3, 20000, '겁나 비싼코트입니다' );
-- 디테일 선언 안된 값 넣음
INSERT INTO sangpum VALUES ('Z00001','비싼코트2', 5, 20000, '겁나 비싼 코트입니다' );
-- 디테일 선언없음
INSERT INTO sangpum VALUES ('Z00001','비싼코트3','겁나 비싼 코트입니다', 5, 20000); 


INSERT INTO jumun(no, gogek, sangpum,count, jumunil) VALUES ( 1000, 'babo1234', 'A00001', 1, '2016/09/09' );
INSERT INTO jumun(no, gogek, sangpum,count, jumunil) VALUES ( 1001, 'babo1233', 'Z00001', 1, '2016/09/09' );
--에러 : 고객 부모에 없는 키 참조
INSERT INTO jumun(no, gogek, sangpum,count, jumunil) VALUES ( 1002, 'Babo1234', 'A00002', 2, '2016/09/10' );
--에러 : 고객 부모에 없는 키 참조. 대문자
INSERT INTO jumun(no, gogek, sangpum,count, jumunil) VALUES ( 1003, 'babo1234', 'B00001', 1, '2016/09/11' );
--에러 : 상품 부모에 없는 키 참조
INSERT INTO jumun(no, gogek, sangpum,count, jumunil) VALUES ( 1004, 'babo', 'Z00001', 1, '2016/10/11' );
INSERT INTO jumun(no, gogek, sangpum,count, jumunil) VALUES ( 1005, 'babo1234', 'B00009', 1, '2016/11/11' );
INSERT INTO jumun(no, gogek, sangpum,count, jumunil) VALUES ( 1006, 'babo1234', 'B00009', 1, '2016/12/12' );

-- 1. 전화번호가 없는 고객은 누구인지 고객명을 검색하세요
SELECT NAME
FROM gogek
WHERE TEL IS NULL;

-- 2. 홍씨 성을 가진 고객들의 정보를 검색하세요
SELECT ID, NAME, TEL
FROM gogek
WHERE NAME LIKE '홍%';

-- 3. babo2222 고객명을 박길동으로 변경하세요
UPDATE  gogek SET NAME = '박길동' WHERE ID='babo2222';

-- 4. 아이디 123 고객의 아이디를 babo123 으로 변경하세요
UPDATE  gogek SET ID = 'babo123' WHERE ID='123';

-- 5. 봉길동씨의 전화번호 02-555-5555를 추가하세요
UPDATE  gogek SET TEL = '02-555-5555' WHERE NAME='봉길동';

-- 6. 상품번호 B00009 에 가격 1200원 그리고 “겁나 쌕시한 옷입니다”라는 상품설명을 추가하세요
UPDATE  sangpum SET DETAIL = '겁나 쌕시한 옷입니다' , PRICE = 1200 WHERE NO='B00009';

-- 7. 이쁜바지 상품이 10개가 팔렸습니다.
UPDATE  sangpum SET COUNT = -10 , PRICE = 1200 WHERE TITLE='이쁜바지';

-- 8. Z00001 상품이 3개가 더 입고 되었습니다.
UPDATE  sangpum SET COUNT = +3  WHERE NO='Z00001';

-- 9. 상품 가격이 1000원을 넘는 상품들을 검색하세요
SELECT * FROM sangpum;
SELECT TITLe FROM sangpum WHERE price > 1000;

-- 10. 11월 이후에 주문한 상품 번호를 검색하세요
SELECT * FROM JUMUN;
SELECT sangpum FROM JUMUN WHERE JUMUNIL > '16/11/01';

-- 11. babo 고객이 주문한 상품을 A00002로 변경하고 수량을 2개로 수정하세요
UPDATE  JUMUN SET SANGPUM = 'A00002', COUNT = 2  WHERE GOGEK='babo';

-- 12. babo1234 고객이 11월에 주문한 상품 번호을 검색하세요
SELECT sangpum FROM jumun 
WHERE gogek='babo1234' and jumunil BETWEEN '16/11/01' AND '16/11/30' ;

-- 13. B00009 상품을 주문한 고객 아이디를 검색하세요
SELECT * FROM JUMUN;
SELECT GOGEK FROM JUMUN WHERE sangpum = 'B00009' ;

SELECT * FROM gogek;
SELECT * FROM JUMUN;
SELECT * FROM sangpum;










   