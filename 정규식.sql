-- ©ю╤Се╛ а╓╠т╫д г╔гЖ
-- ╬ф╥║©м ╟╟юл евюл╨Мю╩ ╩Щ╪╨го╟М ╥╧дз╣Е╦╕ ют╥бгя хд
-- REGEXP_LIKE  ©э©║ REGEXP_REPALCE,REGEXP_INSTR, REGEXP_SUBSTR, REGEXP_COUNT гт╪Ж╣╣ южю╫ ╠в╥╞Ё╙ ╬ф╥║юг ©╧╧╝ю╨ regexp_like гт╪Ж╦╕ юл©Кго©╘╣╣ ╧╚╧Фгт.
 
-- евюл╨М ╩Щ╪╨
CREATE TABLE reg_tab( text varchar2(20) );
 
-- ╥╧дз╣Е ют╥б
INSERT INTO reg_tab VALUES('TIGER');
INSERT INTO reg_tab VALUES('TIGGER');
INSERT INTO reg_tab VALUES('elephant');
INSERT INTO reg_tab VALUES('tiger');
INSERT INTO reg_tab VALUES('tiger2');
INSERT INTO reg_tab VALUES('tiger3');
INSERT INTO reg_tab VALUES('doggy');
INSERT INTO reg_tab VALUES('5doggy');
INSERT INTO reg_tab VALUES('DOG');
INSERT INTO reg_tab VALUES('DOG2');
INSERT INTO reg_tab VALUES('╟Ё');
INSERT INTO reg_tab VALUES('cat');
INSERT INTO reg_tab VALUES('catty');
INSERT INTO reg_tab VALUES('9catty');
INSERT INTO reg_tab VALUES('catwoman');
INSERT INTO reg_tab VALUES('╟М╬Гюл');
INSERT INTO reg_tab VALUES('BAT');
INSERT INTO reg_tab VALUES('BATMAN');
INSERT INTO reg_tab VALUES('BATGIRL'); 
INSERT INTO reg_tab VALUES('0BATGIRL'); 
INSERT INTO reg_tab VALUES('╧заЦ');
 
-- д©╧т
COMMIT;

--[ ╧╝а╕ ]
SELECT *FROM reg_tab;
-- 1.  text дц╥Ёюг ╧╝юз©╜©║╪╜ 't'╥н╫цюшго╢б ╣╔юлем ╟к╩Ж
 SELECT * 
 FROM reg_tab
 WHERE  REGEXP_LIKE( text,'^t');
 
-- 2. text дц╥Ёюг ╧╝юз©╜©║╪╜ 't'╥н Ё║Ё╙╢б ╣╔юлем ╟к╩Ж
 SELECT * 
 FROM reg_tab
 WHERE  REGEXP_LIKE( text,'t$');
 
-- 3. ц╧╧Ьб╟ 't'╥н╫цюшго©╘ 5╧Ьб╟ 'r'юл юж╢б ╣╔юлем ╟к╩Ж
 SELECT * 
 FROM reg_tab
 WHERE  REGEXP_LIKE( text,'^t...r') ; 
 
-- 4. ╪Щюз╥н Ё║Ё╙╢б ╣╔юлем ╟к╩Ж
 SELECT * 
 FROM reg_tab
 WHERE REGEXP_LIKE (text,'\d$') ;
 
 select*
from reg_tab
where REGEXP_LIKE(text, '[0-9]$');
 
-- 5. ╪Щюз╥н ╫цюшго╢б ╣╔юле╦ ╟к╩Ж
 SELECT * 
 FROM reg_tab
 WHERE REGEXP_LIKE (text,'^\d') ;
 
select*
from reg_tab
where REGEXP_LIKE(text, '[0-9]$');
 
-- 6. ╪Щюз╟║ ╬ф╢я ╧╝юз╥н ╫цюшго╢б ╣╔юлем ╟к╩Ж
SELECT * 
 FROM reg_tab
 WHERE REGEXP_LIKE (text,'^\D') ; 
 

-- 7. ╢К╧╝юз╥н ╫цюшго╢б ╣╔юлем ╟к╩Ж
 SELECT * 
 FROM reg_tab
 WHERE REGEXP_LIKE (text,'^[A-Z]') ; 

 
-- 8. ╪р╧╝юз ©эюг ╧╝юз╥н ╫цюшго╢б ╣╔юлем ╟к╩Ж
SELECT * 
 FROM reg_tab
 WHERE REGEXP_LIKE (text,'^[a-z]') ; 
 
-- 9. гя╠ш╥н ╫цюшго╢б ╣╔юлем ╟к╩Ж
select*
from reg_tab
where REGEXP_LIKE(text, '^[╓║-фR]');

-- 10. ╣╔юлем аъ 'gg'Ё╙ 'GG'╟║ ╣И╬Нюж╢б ╣╔юлем ╟к╩Ж
select*
from reg_tab
where REGEXP_LIKE(text, 'gg|GG');
