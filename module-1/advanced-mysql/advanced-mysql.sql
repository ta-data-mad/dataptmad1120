#CHALLENGE 1

    #Step 1
  
SELECT titleauthor.title_id AS 'Title ID',
       titleauthor.au_id AS 'Author ID',
       titles.advance * titleauthor.royaltyper / 100 AS 'Advance',
       titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS 'Royalty'
FROM titles
JOIN sales ON sales.title_id = titles.title_id
JOIN titleauthor ON titleauthor.title_id = sales.title_id
ORDER BY titleauthor.title_id;


    #Step 2
    
SELECT 'Title ID', 'Author ID', SUM('Royalty') as 'All royalties', 'Advance'

FROM (
        SELECT titleauthor.title_id AS 'Title ID',
        titleauthor.au_id AS 'Author ID',
        titles.advance * titleauthor.royaltyper / 100 AS 'Advance',
        titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS 'Royalty'
        FROM titles
        JOIN sales ON sales.title_id = titles.title_id
        JOIN titleauthor ON titleauthor.title_id = sales.title_id
        ORDER BY titleauthor.title_id;
      )
GROUP BY 'Author ID', 'Title ID';


    #Step 3
    
SELECT 'Author ID', ((SUM('All royalties')) + SUM('Advance'))) as 'Profits'

FROM(
    
    SELECT 'Title ID', 'Author ID', SUM('Royalty') as 'All royalties', 'Advance'

FROM (
        SELECT titleauthor.title_id AS 'Title ID',
        titleauthor.au_id AS 'Author ID',
        titles.advance * titleauthor.royaltyper / 100 AS 'Advance',
        titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS 'Royalty'
        FROM titles
        JOIN sales ON sales.title_id = titles.title_id
        JOIN titleauthor ON titleauthor.title_id = sales.title_id
        ORDER BY titleauthor.title_id;
      )
GROUP BY 'Author ID', 'Title ID';
    
)

GROUP BY 'Author ID'
ORDER BY 'Profits' desc
LIMIT 3 ;
    


#CHALLENGE 2


CREATE TEMPORARY TABLE IF NOT EXISTS 'Altern Solution' AS 

SELECT 'Title ID', SUM('Royalty') as 'All royalties', 'Advance'

FROM (
        SELECT titleauthor.title_id AS 'Title ID',
        titleauthor.au_id AS 'Author ID',
        titles.advance * titleauthor.royaltyper / 100 AS 'Advance',
        titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS 'Royalty'
        FROM titles
        JOIN sales ON sales.title_id = titles.title_id
        JOIN titleauthor ON titleauthor.title_id = sales.title_id
        ORDER BY titleauthor.title_id;
        )
GROUP BY 'Author ID', 'Title ID';

#New query

SELECT 'Author ID', ((SUM('All royalties')) + SUM('Advance'))) as 'Profits'
FROM 'Altern Solution'
GROUP BY 'Author ID'
ORDER BY 'Profits' desc
LIMIT 3;


#CHALLENGE 3

CREATE TABLE IF NOT EXITS 'Most Profiting Authors'

AS

SELECT 'Author ID', ((SUM('All royalties')) + SUM('Advance'))) as 'Profits'

FROM (
      SELECT titleauthor.title_id AS 'Title ID',
      titleauthor.au_id AS 'Author ID',
      titles.advance * titleauthor.royaltyper / 100 AS'Advance',
      titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS 'Royalty'
      FROM titles
      JOIN sales ON sales.title_id = titles.title_id
      JOIN titleauthor ON titleauthor.title_id = sales.title_id
      ORDER BY titleauthor.title_id;
        )
    GROUP BY 'Author ID', 'Title ID'
)

GROUP BY 'Author ID'
ORDER BY 'Profits' desc
LIMIT 3;







    
      
   



