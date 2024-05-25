create database assignment;
-- here select database for query
use assignment;     

/* Here i change the date and close price name into lower case from all the following databses and importing data base
 from our personal device and i use alter function for renaming the names from table....
*/
ALTER TABLE bajaj_auto RENAME COLUMN `Date` TO date;
ALTER TABLE bajaj_auto RENAME COLUMN `Close Price`TO close_price;

ALTER TABLE eicher_motors RENAME COLUMN `Date` TO date;
ALTER TABLE eicher_motors RENAME COLUMN `Close Price`TO close_price;

ALTER TABLE hero_motocorp RENAME COLUMN `Date` TO date;
ALTER TABLE hero_motocorp RENAME COLUMN `Close Price`TO close_price;

ALTER TABLE infosys RENAME COLUMN `Date` TO date;
ALTER TABLE infosys RENAME COLUMN `Close Price`TO close_price;

ALTER TABLE tcs RENAME COLUMN `Date` TO date;
ALTER TABLE tcs RENAME COLUMN `Close Price`TO close_price;

ALTER TABLE tvs_motors RENAME COLUMN `Date` TO date;
ALTER TABLE tvs_motors RENAME COLUMN `Close Price`TO close_price;

-- here we see the changes what i did in databases after using alter function...
SELECT * FROM assignment.bajaj_auto;
SELECT * FROM assignment.eicher_motors;
SELECT * FROM assignment.hero_motocorp;
SELECT * FROM assignment.infosys;
SELECT * FROM assignment.tcs;
SELECT * FROM assignment.tvs_motors;

-- solution of question 1

-- Results 1 -- Create a new table named 'bajaj1' containing the date, close price, 20 Day MA and 50 Day MA.
create table bajaj1
select row_number() over w as  Date,`close_price`,
if((ROW_NUMBER() OVER w) > 19, (avg(`close_price`) OVER (rows 19 PRECEDING)), null) `20_day_ma`,
if((ROW_NUMBER() OVER w) > 49, (avg(`close_price`) OVER (rows 49 PRECEDING)), null) `50_day_ma`
from bajaj_auto
window w as (order by Date asc);

-- Create a new table named 'eicher1' containing the date, close price, 20 Day MA and 50 Day MA.
create table eicher1
select row_number() over w as  Date,`close_price`,
if((ROW_NUMBER() OVER w) > 19, (avg(`close_price`) OVER (rows 19 PRECEDING)), null) `20_day_ma`,
if((ROW_NUMBER() OVER w) > 49, (avg(`close_price`) OVER (rows 49 PRECEDING)), null) `50_day_ma`
from eicher_motors
window w as (order by Date asc);

-- Create a new table named 'hero1' containing the date, close_price, 20_day_ma and 50_day_ma.
create table hero1
select row_number() over w as  Date,`close_price`,
if((ROW_NUMBER() OVER w) > 19, (avg(`close_price`) OVER (rows 19 PRECEDING)), null) `20_day_ma`,
if((ROW_NUMBER() OVER w) > 49, (avg(`close_price`) OVER (rows 49 PRECEDING)), null) `50_day_ma`
from hero_motocorp
window w as (order by Date asc);

-- Create a new table named 'infosys1' containing the date, close_price, 20_day_ma and 50_day_ma.
create table infosys1
select row_number() over w as  Date,`close_price`,
if((ROW_NUMBER() OVER w) > 19, (avg(`close_price`) OVER (rows 19 PRECEDING)), null) `20_day_ma`,
if((ROW_NUMBER() OVER w) > 49, (avg(`close_price`) OVER (rows 49 PRECEDING)), null) `50_day_ma`
from infosys
window w as (order by Date asc);

-- Create a new table named 'tcs1' containing the date, close_price, 20_day_ma and 50_day_ma.
create table tcs1
select row_number() over w as  Date,`close_price`,
if((ROW_NUMBER() OVER w) > 19, (avg(`close_price`) OVER (rows 19 PRECEDING)), null) `20_day_ma`,
if((ROW_NUMBER() OVER w) > 49, (avg(`close_price`) OVER (rows 49 PRECEDING)), null) `50_day_ma`
from tcs
window w as (order by Date asc);

-- Create a new table named 'tvs1' containing the date, close_price, 20_day_ma and 50_day_ma.
create table tvs1
select row_number() over w as  Date,`close_price`,
if((ROW_NUMBER() OVER w) > 19, (avg(`close_price`) OVER (rows 19 PRECEDING)), null) `20_day_ma`,
if((ROW_NUMBER() OVER w) > 49, (avg(`close_price`) OVER (rows 49 PRECEDING)), null) `50_day_ma`
from tvs_motors
window w as (order by Date asc);

-- here we can see all calculated tables on the basis of 20day moving average n 50day moving average...
select * from bajaj1;
select * from eicher1;
select * from hero1;
select * from infosys1;
select * from tcs1;
select * from tvs1;
    


   -- solution of questoion 2 
   
-- Here i created master_stocks table... 
   create table master_stocks (
	`Date` text,
	`Bajaj` decimal(10,2),
    `Tcs` decimal(10,2),
    `Tvs` decimal(10,2),
    `Infosys` decimal(10,2),
    `Eicher` decimal(10,2),
    `Hero` decimal(10,2)  
);

-- insert values into the master_stocks table from Bajaj, Tcs, Tvs, Infosys, Eicher, Hero....
insert into master_stocks (Date, Bajaj, Tcs, Tvs, Infosys, Eicher, Hero) 
	select bajaj_auto.date, bajaj_auto.close_price, tcs.close_price, tvs_motors.close_price, infosys.close_price, 
		   eicher_motors.close_price, hero_motocorp.close_price	   	   
	from  bajaj_auto
   	inner join tcs on bajaj_auto.date = tcs.date
	inner join tvs_motors on bajaj_auto.date = tvs_motors.date
	inner join infosys on bajaj_auto.date = infosys.date
	inner join eicher_motors on bajaj_auto.date = eicher_motors.date
	inner join hero_motocorp on bajaj_auto.date = hero_motocorp.date;
    
    -- here we see the whole mater_stocks tables in which including all the data from various tables...
    select * from master_stocks;
    

-- solution of question 3

-- Here i created a table named bajaj2 in which coloumn name is close_price, date, 50_day_ma, 20_day_ma, and signal.
    create table bajaj2 (
	`date` text,
	`close_price` decimal(10,2),
    `20_day_ma` decimal(10,2),
    `50_day_ma` decimal(10,2),
     `signal` varchar(15) DEFAULT 'Hold'
);
-- here i created all following tables using like function... 
create table eicher2 like bajaj2;
create table hero2 like bajaj2;
create table infosys2 like bajaj2;
create table tcs2 like bajaj2;
create table tvs2 like bajaj2;

-- Here i inserting the valuse of date, close_price, 20_day_ma, and 50_day_ma in bajaj2 table...
insert into bajaj2 (date,close_price,20_day_ma,50_day_ma) 
	select date, close_price,20_day_ma,50_day_ma
	from  bajaj1;
    
-- Note here we using the update function for setting signal Buy if 20_day_ma > 50_day_ma...
update bajaj2
set `signal`='Buy'
where 20_day_ma > 50_day_ma;

-- Note here we using the update function for setting signal Sell if 20_day_ma < 50_day_ma...
update bajaj2
set `signal`='Sell'
where 20_day_ma < 50_day_ma;

-- here i drop the coloumn 20_day_ma from table bajaj2...
alter table bajaj2
drop column 20_day_ma;

-- here i drop the coloumn 50_day_ma from table bajaj2...
alter table bajaj2
drop column 50_day_ma;


-- Here i inserting the valuse of date, close_price, 20_day_ma, and 50_day_ma in eicher2 table from eicher1 table...
insert into eicher2 (date,close_price,20_day_ma,50_day_ma) 
	select date, close_price,20_day_ma,50_day_ma
	from  eicher1;
    
-- Note here we using the update function for setting signal Buy if 20_day_ma > 50_day_ma...    
update eicher2
set `signal`='Buy'
where 20_day_ma > 50_day_ma;

-- Note here we using the update function for setting signal Buy if 20_day_ma < 50_day_ma...
update eicher2
set `signal`='Sell'
where 20_day_ma < 50_day_ma;

-- here i drop the coloumn 20_day_ma from table eicher2...
alter table eicher2
drop column 20_day_ma;

-- here i the drop column 20_day_ma and 50_day_ma from table eicher2..
alter table eicher2
drop column 50_day_ma;

-- here we can view the table of eicher2..
select* from eicher2;

-- Here i inserting the valuse of date, close_price, 20_day_ma, and 50_day_ma in hero2 table from hero1 table... 
insert into hero2 (date,close_price,20_day_ma,50_day_ma) 
	select date, close_price,20_day_ma,50_day_ma
	from  hero1;

    
-- Note here we using the update function for setting signal Buy if 20_day_ma > 50_day_ma...    
update hero2
set `signal`='Buy'
where 20_day_ma > 50_day_ma;

    
-- Note here we using the update function for setting signal Buy if 20_day_ma < 50_day_ma...
update hero2
set `signal`='Sell'
where 20_day_ma < 50_day_ma;

-- here i drop the coloumn 20_day_ma from table hero2...
alter table hero2
drop column 20_day_ma;
 
 -- here i drop the coloumn 50_day_ma from table hero2...
alter table hero2
drop column 50_day_ma;

-- here we can view the table of hero2..
select* from hero2;
 
 
 -- Here i inserting the valuse of date, close_price, 20_day_ma, and 50_day_ma in infosys2 table from infosys1 table... 
 insert into infosys2 (date,close_price,20_day_ma,50_day_ma) 
	select date, close_price,20_day_ma,50_day_ma
	from  infosys1;
    

-- Note here we are using the update function for setting signal Buy if 20_day_ma > 50_day_ma...    
update infosys2
set `signal`='Buy'
where 20_day_ma > 50_day_ma;


-- Note here we using the update function for setting signal Buy if 20_day_ma < 50_day_ma...
update infosys2
set `signal`='Sell'
where 20_day_ma < 50_day_ma;

-- here i drop the coloumn 20_day_ma from table infosys2...
alter table infosys2
drop column 20_day_ma;

-- here i drop the coloumn 50_day_ma from table infosys2...
alter table infosys2
drop column 50_day_ma;

-- here we can view the table of infosys2..
select* from infosys2;


-- Here i inserting the valuse of date, close_price, 20_day_ma, and 50_day_ma in tcs2 table from tcs1 table... 
 insert into tcs2 (date,close_price,20_day_ma,50_day_ma) 
	select date, close_price,20_day_ma,50_day_ma
	from  tcs1;

-- Note here we using the update function for setting signal Buy if 20_day_ma > 50_day_ma...    
update tcs2
set `signal`='Buy'
where 20_day_ma > 50_day_ma;

-- Note here we using the update function for setting signal Sell if 20_day_ma < 50_day_ma...    
update tcs2
set `signal`='Sell'
where 20_day_ma < 50_day_ma;

-- here i drop the coloumn 20_day_ma from table tcs2...
alter table tcs2
drop column 20_day_ma;

-- here i drop the coloumn 50_day_ma from table tcs2...
alter table tcs2
drop column 50_day_ma;

-- here we can view the table of tcs2..
select* from tcs2;


-- Here i inserting the valuse of date, close_price, 20_day_ma, and 50_day_ma in tvs2 table from tvs1 table... 
 insert into tvs2 (date,close_price,20_day_ma,50_day_ma) 
	select date, close_price,20_day_ma,50_day_ma
	from  tvs1;

-- Note here we using the update function for setting signal Buy if 20_day_ma > 50_day_ma...     
update tvs2
set `signal`='Buy'
where 20_day_ma > 50_day_ma;

-- Note here we using the update function for setting signal Sell if 20_day_ma < 50_day_ma... 
update tvs2
set `signal`='Sell'
where 20_day_ma < 50_day_ma;

-- here i drop the coloumn 20_day_ma from table tvs2...
alter table tvs2
drop column 20_day_ma;

-- here i drop the coloumn 50_day_ma from table tvs2...
alter table tvs2
drop column 50_day_ma;

-- here we can view the table of tvs2..
select* from tvs2;

-- here we see all the tables...
select * from bajaj2;
select * from eicher2;
select * from hero2;
select * from infosys2;
select * from tcs2;
select * from tvs2;


 -- solution of question 4
 
 
drop function if exists Trade_signal_from_bajaj;

delimiter $$

-- here we are creating a define function...
create function Trade_signal_from_bajaj(input_date text) 
  returns varchar(15) 
  deterministic
begin   
  declare output_tradesignal varchar(15);
  
  select bajaj2.`signal` into output_tradesignal from bajaj2 
  where `date` = input_date;
  
  return output_tradesignal ;
  end
  
$$ delimiter ;
 -- we can serch any number to see the trade from bajaj2...
select Trade_signal_from_bajaj('') as trade_signal;