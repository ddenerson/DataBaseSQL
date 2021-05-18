-- 1 - Select All Books Written Before 1980 (non inclusive)



select * from books where released_year < 1980;


--------------------------------------------------------------------

-- 2 - Select All Books Written By Eggers Or Chabon



select title,author_lname,author_fname from books where author_lname='Eggers' or author_lname='Chabon';

---------------------------------------------------------------------

-- 3 - Select All Books Written By Lahiri, Published after 2000



select * from books where author_lname='Lahiri' and released_year > 2000


---------------------------------------------------------------------

-- 4 - Select All books with page counts between 100 and 200


select * from books where pages > 100 and pages < 200; 


---------------------------------------------------------------------

-- 5 - Select all books where author_lname  starts with a 'C' or an 'S''


select * from books where author_lname like 'C%' or author_lname like 'S%'


---------------------------------------------------------------------

-- 6 - Make this

-- +-----------------------------------------------------+----------------+---------------+
-- | title                                               | author_lname   | TYPE          |
-- +-----------------------------------------------------+----------------+---------------+
-- | The Namesake                                        | Lahiri         | Novel         |
-- | Norse Mythology                                     | Gaiman         | Novel         |
-- | American Gods                                       | Gaiman         | Novel         |
-- | Interpreter of Maladies                             | Lahiri         | Novel         |
-- | A Hologram for the King: A Novel                    | Eggers         | Novel         | 
-- | The Circle                                          | Eggers         | Novel         |
-- | The Amazing Adventures of Kavalier & Clay           | Chabon         | Novel         |
-- | Just Kids                                           | Smith          | Memoir        |
-- | A Heartbreaking Work of Staggering Genius           | Eggers         | Memoir        |
-- | Coraline                                            | Gaiman         | Novel         |
-- | What We Talk About When We Talk About Love: Stories | Carver         | Short Stories |
-- | Where I'm Calling From: Selected Stories            | Carver         | Short Stories |
-- | White Noise                                         | DeLillo        | Novel         |
-- | Cannery Row                                         | Steinbeck      | Novel         |
-- | Oblivion: Stories                                   | Foster Wallace | Short Stories |
-- | Consider the Lobster                                | Foster Wallace | Novel         |
-- | 10% Happier                                         | Harris         | Novel         |
-- | fake_book                                           | Harris         | Novel         |
-- | Lincoln In The Bardo                                | Saunders       | Novel         |
-- +-----------------------------------------------------+----------------+---------------+

select title,
    author_lname,
    case 
    when title like '%stories%' then 'Short Stories'    
    when title = 'just Kids' or title = 'A Heartbreaking Work of Staggering Genius' then 'Memoir'
    else 'Novel'
    End as type
from books;  

---------------------------------------------------------------------






