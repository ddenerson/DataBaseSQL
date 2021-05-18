-- 1 - Insert data

INSERT INTO books (
                      title,
                      author_fname,
                      author_lname,
                      released_year,
                      stock_quantity,
                      pages
                  )
                  VALUES (
                      '10% Happier',
                      'Dan',
                      'Harris',
                      2014,
                      29,
                      256
                  ),
                  (
                      'fake_book',
                      'Freida',
                      'Harris',
                      2001,
                      287,
                      428
                  ),
                  (
                      'Lincoln In The Bardo',
                      'George',
                      'Saunders',
                      2017,
                      1000,
                      367
                  );


-----------------------------------------------------------------------

-- 2 - Select All Story Collections
-- Titles  That contain 'stories'


-- +-----------------------------------------------------+
-- / title                                               |
-- +-----------------------------------------------------+
-- | What We Talk About When We Talk About Love: Stories |
-- | Where I'm Calling From: Selected Stories            |
-- | Oblivion: Stories                                   |
-- +-----------------------------------------------------+


select title from books where title like '%stories%';



-----------------------------------------------------------------------

-- 3 -Find The Longest Book
-- Print Out the Title and Page Count



--     +-------------------------------------------+-------+
--     | title                                     | pages |
--     +-------------------------------------------+-------+
--     | The Amazing Adventures of Kavalier & Clay |   634 |
--     +-------------------------------------------+-------+


SELECT title,max(pages) AS pages FROM books;


-----------------------------------------------------------------------

-- 4 - Print a summary containing the title and year,for the 3 most recent books



--  +-----------------------------+
--  | summary                     |
--  +-----------------------------+
--  | Lincoln In The Bardo - 2017 |
--  | Norse Mythology - 2016      |
--  | 10% Happier - 2014          |
--  +-----------------------------+

select title, released_year from books order by released_year  DESC LIMIT 3;

-----------------------------------------------------------------------

-- 5 - Find all books with an author_lname that contains a space(" ")


-- +----------------------+----------------+
-- | title                | author_lname   |
-- +----------------------+----------------+
-- | Oblivion: Stories    | Foster Wallace |
-- | Consider the Lobster | Foster Wallace |
-- +----------------------+----------------+

select title,author_lname from books where author_lname like '%  %';


-----------------------------------------------------------------------

-- 6 - Find The 3 Books With The Lowest Stock
-- Select title, year, and stock


-- +-----------------------------------------------------+---------------+----------------+
-- | title                                               | released_year | stock_quantity |
-- +-----------------------------------------------------+---------------+----------------+
-- | American Gods                                       |          2001 |             12 |
-- | Where I'm Calling From: Selected Stories            |          1989 |             12 |
-- | What We Talk About When We Talk About Love: Stories |          1981 |             23 |
-- +-----------------------------------------------------+---------------+----------------+


select title,released_year,min(stock_quantity) from books group by stock_quantity LIMIT 3;


-----------------------------------------------------------------------

-- 7 - Print title and author_lname, sorted first by author_lname and then by title


select title, author_lname from books group by author_lname,title;


-----------------------------------------------------------------------

-- 8 - Make This Happen
-- Sorted Alphabetically By Last Name



-- +---------------------------------------------+
-- | yell                                        |
-- +---------------------------------------------+
-- | MY FAVORITE AUTHOR IS RAYMOND CARVER!       |
-- | MY FAVORITE AUTHOR IS RAYMOND CARVER!       |
-- | MY FAVORITE AUTHOR IS MICHAEL CHABON!       |
-- | MY FAVORITE AUTHOR IS DON DELILLO!          |
-- | MY FAVORITE AUTHOR IS DAVE EGGERS!          |
-- | MY FAVORITE AUTHOR IS DAVE EGGERS!          |
-- | MY FAVORITE AUTHOR IS DAVE EGGERS!          |
-- | MY FAVORITE AUTHOR IS DAVID FOSTER WALLACE! |
-- | MY FAVORITE AUTHOR IS DAVID FOSTER WALLACE! |
-- | MY FAVORITE AUTHOR IS NEIL GAIMAN!          |
-- | MY FAVORITE AUTHOR IS NEIL GAIMAN!          |
-- | MY FAVORITE AUTHOR IS NEIL GAIMAN!          |
-- | MY FAVORITE AUTHOR IS FREIDA HARRIS!        |
-- | MY FAVORITE AUTHOR IS DAN HARRIS!           |
-- | MY FAVORITE AUTHOR IS JHUMPA LAHIRI!        |
-- | MY FAVORITE AUTHOR IS JHUMPA LAHIRI!        |
-- | MY FAVORITE AUTHOR IS GEORGE SAUNDERS!      |
-- | MY FAVORITE AUTHOR IS PATTI SMITH!          |
-- | MY FAVORITE AUTHOR IS JOHN STEINBECK!       |
-- +---------------------------------------------+


select 'my favorite author is '|| ' ' || title from books as 'yeel' order by author_lname


-----------------------------------------------------------------------


