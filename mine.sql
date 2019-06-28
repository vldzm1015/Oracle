
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