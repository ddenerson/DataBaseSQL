-- 1 - Print the number of books in the database

select count(title) from books;


----------------------------------------------------------------------


-- 2 - Print out how many books were released in each year

select count(released_year),released_year from books group by released_year;


----------------------------------------------------------------------


-- 3 - Print out the total number of books in stock

select SUM(stock_quantity) as 'SUM OF STOCK' from books;



----------------------------------------------------------------------

-- 4 - Find the average released_year for each author


SELECT AVG(released_year) as ' AVERAGE' from books;


----------------------------------------------------------------------

-- 5 - Make This Happen


-- +------+---------+-----------+
-- | year | # books | avg pages |
-- +------+---------+-----------+
-- | 1945 |       1 |  181.0000 |
-- | 1981 |       1 |  176.0000 |
-- | 1985 |       1 |  320.0000 |
-- | 1989 |       1 |  526.0000 |
-- | 1996 |       1 |  198.0000 |
-- | 2000 |       1 |  634.0000 |
-- | 2001 |       3 |  443.3333 |
-- | 2003 |       2 |  249.5000 |
-- | 2004 |       1 |  329.0000 |
-- | 2005 |       1 |  343.0000 |
-- | 2010 |       1 |  304.0000 |
-- | 2012 |       1 |  352.0000 |
-- | 2013 |       1 |  504.0000 |
-- | 2014 |       1 |  256.0000 |
-- | 2016 |       1 |  304.0000 |
-- | 2017 |       1 |  367.0000 |
-- +------+---------+-----------+


select released_year as 'year',count(released_year) as 'books',avg(pages) as 'avg pages' from books group by released_year