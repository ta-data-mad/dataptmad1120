CHALLENGE 1

STEP 1:
SELECT 
titles.title_id AS "Title ID",
titleauthor.au_id AS "Author ID",
(titles.advance * titleauthor.royaltyper/ 100) AS "Advance",
(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS "Royalty"
FROM titles 
JOIN titleauthor 
ON titles.title_id = titleauthor.title_id
JOIN sales 
ON titleauthor.title_id = sales.title_id 


STEP 2:
WITH royalty_advance_each_author AS (
SELECT 
titles.title_id AS "Title ID",
titleauthor.au_id AS "Author ID",
(titles.advance * titleauthor.royaltyper/ 100) AS "Advance",
(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS "Royalty"
FROM titles 
JOIN titleauthor 
ON titles.title_id = titleauthor.title_id
JOIN sales 
ON titleauthor.title_id = sales.title_id 
)
SELECT 
"Title ID",
"Author ID",
SUM(royalty) as "Total Royalties" 
FROM royalty_advance_each_author
GROUP BY "Author ID", "Title ID"


STEP 3:

SELECT 
"Title ID",
"Author ID",
"Total Royalties",
SUM(royalty_advance_each_author.Advance) as "Total advance"
FROM total_royalty_each_author
