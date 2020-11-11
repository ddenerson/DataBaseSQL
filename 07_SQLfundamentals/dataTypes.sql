-- 1 - What's a good use case for CHAR?

create table info(name varchar(50),gender char(5));

------------------------------------------------------------------

-- 2 - Fill In The Blanks

--	CREATE TABLE inventory
--	(
--    	  item_name ____________,
--        price ________________,
--        quantity _____________
--        );
--  (price is always < 1,000,000)


create table inventory(item_name varchar(5),price decimal(8,2),quantity int);



------------------------------------------------------------------


-- 3 - Print Out The Current Day Of The Week
(The Number)


 select dayofweek(now());



------------------------------------------------------------------

-- 4 - Print Out The Current Day Of The Week (The Day Name)


select date_format(now(), '%W');


------------------------------------------------------------------

-- 5 - Print out the current day and time using this format: mm/dd/yyyy

select date_format(now(),'%m/%d/%Y');


------------------------------------------------------------------

-- 6 - Print out the current day and time using this format:
-- January 2nd at 3:15 April 1st at 10:18


select date_format(now(), '%M %D at %h:%i');

------------------------------------------------------------------

-- 7 - Create a tweets table that stores: The Tweet content - A Username - Time it was created


create table tweets(content varchar(184),username varchar(20), created TIMESTAMP DEFAULT NOW());

