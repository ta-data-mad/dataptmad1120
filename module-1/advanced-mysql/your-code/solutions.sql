CHALLENGE 1

#STEP 1:
SELECT 
titles.title_id AS "Title ID",
titles.title,
titleauthor.au_id AS "Author ID",
(titles.advance * titleauthor.royaltyper/ 100) AS "Advance",
(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS "Royalty"
FROM titles 
JOIN titleauthor 
ON titles.title_id = titleauthor.title_id
JOIN sales 
ON titleauthor.title_id = sales.title_id 


#STEP 2:
WITH royalty_advance_each_author AS (
SELECT 
titles.title_id AS "Title ID",
titles.title,
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
titles.title,
"Author ID",
SUM(royalty) as "Total Royalties" 
FROM royalty_advance_each_author
GROUP BY "Author ID", "Title ID"


#STEP 3:
WITH total_royalties AS (
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
SUM(royalty) as "Total Royalties",
"Advance"
FROM royalty_advance_each_author
GROUP BY "Author ID", "Title ID"
)
SELECT 
"Author ID",
"Total Royalties" + "Advance" AS "Total Profits"
FROM total_royalties
GROUP BY "Author ID"
ORDER BY "Total Profits" DESC
LIMIT 3



CHALLENGE 2

#First, I have created the first temporary table:
CREATE A TEMPORARY TABLE royalty_advance_each_author AS
SELECT 
titles.title_id AS "Title ID",
titles.title,
titleauthor.au_id AS "Author ID",
(titles.advance * titleauthor.royaltyper/ 100) AS "Advance",
(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS "Royalty"
FROM titles 
JOIN titleauthor 
ON titles.title_id = titleauthor.title_id
JOIN sales 
ON titleauthor.title_id = sales.title_id 

#Then, the second one:
CREATE TEMPORARY TABLE total_royalties AS 
SELECT 
"Title ID",
"Author ID",
SUM(royalty) as "Total Royalties",
"Advance"
FROM royalty_advance_each_author
GROUP BY "Author ID", "Title ID"

#At the end, I have do the query using results of both temporary tables:
SELECT 
"Author ID",
"Total Royalties" + "Advance" AS "Profits"
FROM total_royalties
GROUP BY "Author ID"
ORDER BY "Profits" DESC
LIMIT 3



CHALLENGE 3
CREATE TABLE most_profiting_authors AS 
SELECT 
"Author ID",
"Total Royalties" + "Advance" AS "Profits"
FROM total_royalties
GROUP BY "Author ID"
ORDER BY "Profits" DESC
LIMIT 3



