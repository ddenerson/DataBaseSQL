-- 1- Create a new table
-- Add this information >>> shirt_id(INT) |article(VARCHAR) |color(VARCHAR) |shirt_size(VARCHAR) |last_worn(VARCHAR) 


CREATE TABLE shirts (
    shirt_id   INTEGER      PRIMARY KEY AUTOINCREMENT
                            NOT NULL,
    article    VARCHAR (20),
    color      VARCHAR (10),
    shirt_size VARCHAR (10),
    last_worm  INT
);

---------------------------------------------------------------------------------------------------


-- 2- Get All That Data In There

-------------------------------

-- t-shirt - white - S - 10
-- t-shirt- green - S - 200 
-- polo shirt - black - M - 10
-- tank top - blue - S - 50 
-- t-shirt - pink - S - 0
-- polo shirt - red - M - 5
-- tank top - white - S - 200 
-- tank top - blue - M - 15

-------------------------------


INSERT INTO shirts (
                       article,
                       color,
                       shirt_size,
                       last_worm
                   )
                   VALUES (
                       't-shirt',
                       'white',
                       'S',
                       10
                   ),
                   (
                       't-shirt',
                       'green',
                       'S',
                       200
                   ),
                   (
                       'polo shirt',
                       'black',
                       'M',
                       10
                   ),
                   (
                       'tank top',
                       'blue',
                       'S',
                       50
                   ),
                   (
                       't-shirt',
                       'pink',
                       'S',
                       0
                   ),
                   (
                       'polo shirt',
                       'red',
                       'M',
                       5
                   ),
                   (
                       'tank top',
                       'white',
                       'S',
                       200
                   ),
                   (
                       'tank top',
                       'blue',
                       'M',
                       15
                   );


---------------------------------------------------------------------------------------------------

-- 3- Add A New Shirt
-- Purple polo shirt, size M last worn 50 days ago

insert into shirts(article,color,shirt_size,last_worm) values('polo shirt','purple','M',50);
      
---------------------------------------------------------------------------------------------------

-- 4- SELECT all shirts
-- But Only Print Out Article and Color

select article,color from shirts;
                                
---------------------------------------------------------------------------------------------------


 -- 5- SELECT all medium shirts
-- Print Out Everything But shirt_id

select * from shirts where shirt_size = 'M';

---------------------------------------------------------------------------------------------------

-- 6- Update all polo shirts
--  Change their size to L

update shirts set shirt_size='L' where article = 'polo shirt';
 
---------------------------------------------------------------------------------------------------

 -- 7- Update the shirt last worn 15 days ago
 -- Change last_worn to 0
 
update shirts set last_worm = 0 where last_worm = 15;

---------------------------------------------------------------------------------------------------

-- 8- Update all white shirts
-- Change size to 'XS' and color to 'off white'


UPDATE shirts SET color='off white', shirt_size='XS' WHERE color='white';

---------------------------------------------------------------------------------------------------

-- 9- Delete all old shirts
-- Last worn 200 days ago

delete from shirts where last_worm = 200;

---------------------------------------------------------------------------------------------------

 -- 10- Delete all tank tops
 -- 

delete from shirts where article = 'tank top';


---------------------------------------------------------------------------------------------------

-- 11- Delete all shirts

delete from shirts;


---------------------------------------------------------------------------------------------------
-- 12- Drop the entire shirts table

drop table shirts;

