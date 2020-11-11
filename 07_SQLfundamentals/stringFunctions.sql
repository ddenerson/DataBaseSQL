-- 1- Reverse and Uppercase the following sentence
-- "Why does my cat look at me with such hatred?"

SELECT REVERSE(UPPER('Why does my cat look at me with such hatred?') );

-------------------------------------------------------------------------

-- 2- Replace spaces in titles with '->

SELECT [replace](title, ' ', '->') 
  FROM books;


-------------------------------------------------------------------------

-- 3- You Know What To Do!
--------------------------------
--   	+----------------------+
--	| full name in         |
--	+----------------------+
--	| JHUMPA LAHIRI        |
--	| NEIL GAIMAN          |
--	| NEIL GAIMAN          |
--	| JHUMPA LAHIRI        |
--	| DAVE EGGERS          |
--	| DAVE EGGERS          |
--	| MICHAEL CHABON       |
--	| PATTI SMITH          |
--	| DAVE EGGERS          |
--	| NEIL GAIMAN          |
--	| RAYMOND CARVER       |
--	| RAYMOND CARVER       |
--	| DON DELILLO          |
--	| JOHN STEINBECK       |
--	| DAVID FOSTER WALLACE |
--	| DAVID FOSTER WALLACE |
--	| ADAM SMITH           |
---------------------------------

SELECT author_fname || ' ' || author_lname AS [full name]
  FROM books;




-------------------------------------------------------------------------

-- 4- Make This Happen

-- +--------------------------------------------------------------------------+
-- | blurb                                                                    |
-- +--------------------------------------------------------------------------+
-- | The Namesake was released in 2003                                        |
-- | Norse Mythology was released in 2016                                     |
-- | American Gods was released in 2001                                       |
-- | Interpreter of Maladies was released in 1996                             |
-- | A Hologram for the King: A Novel was released in 2012                    |
-- | The Circle was released in 2013                                          |
-- | The Amazing Adventures of Kavalier & Clay was released in 2000           |
-- | Just Kids was released in 2010                                           |
-- | A Heartbreaking Work of Staggering Genius: was released in 2001          |
-- | Coraline was released in 2003                                            |
-- | What We Talk About When We Talk About Love: Stories was released in 1981 |
-- | Where I'm Calling From: Selected Stories was released in 1989            |
-- | White Noise was released in 1985                                         |
-- | Cannery Row was released in 1945                                         |
-- | Oblivion: Stories was released in 2004                                   |
-- | Consider the Lobster was released in 2005                                |
-------------------------------------------------------------------------------

SELECT title || ' ' || 'was realeased in ' || released_year AS blurb
  FROM books;

-------------------------------------------------------------------------

-- 5- Print book titles and the length of each title

--    +-----------------------------------------------------+-----------------+
--    | title                                               | character count |
--    +-----------------------------------------------------+-----------------+
--    | The Namesake                                        |              12 |
--    | Norse Mythology                                     |              15 |
--    | American Gods                                       |              13 |
--    | Interpreter of Maladies                             |              23 |
--    | A Hologram for the King: A Novel                    |              32 |
--    | The Circle                                          |              10 |
--    | The Amazing Adventures of Kavalier & Clay           |              41 |
--    | Just Kids                                           |               9 |
--    | A Heartbreaking Work of Staggering Genius:          |              42 |
--    | Coraline                                            |               8 |
--    | What We Talk About When We Talk About Love: Stories |              51 |
--    | Where I'm Calling From: Selected Stories            |              40 |
--    | White Noise                                         |              11 |
--    | Cannery Row                                         |              11 |
--    | Oblivion: Stories                                   |              17 |
--    | Consider the Lobster                                |              20 | |
--    +-----------------------------------------------------+-----------------+



-- 5- Print book titles and the length of each title

select title ||'        ' ||  LENGTH(title) as 'title | character count' from books;
