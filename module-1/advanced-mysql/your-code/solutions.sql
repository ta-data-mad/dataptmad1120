CHALLENGE 1

#STEP 1: Calculate the royalty of each sale for each author and the advance for each author and publication.

SELECT
titleauthor.title_id AS 'Title ID',
titleauthor.au_id AS 'Author ID',
(titles.advance * titleauthor.royaltyper / 100) AS 'Advance',
(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS 'Royalty'
FROM titles 
INNER JOIN sales ON sales.title_id = titles.title_id 
INNER JOIN titleauthor ON titleauthor.title_id = sales.title_id 
ORDER BY titleauthor.title_id;


#STEP 2: Aggregate the total royalties for each title and author.
SELECT 
step_1.title_id AS 'Title ID',
step_1.au_id AS 'Author ID',
--step_1.Advance,
SUM(step_1.Royalty) AS Royalties
FROM
(SELECT titleauthor.title_id,
titleauthor.au_id,
titles.advance * titleauthor.royaltyper / 100 AS Advance,
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS Royalty
FROM titles
INNER JOIN sales ON sales.title_id = titles.title_id
INNER JOIN titleauthor ON titleauthor.title_id = sales.title_id) step_1
GROUP BY step_1.title_id,
         step_1.au_id
ORDER BY step_1.title_id;


#STEP 3:Calculate the total profits of each author. 
SELECT step_2.au_id AS 'Author ID',
ROUND(SUM(step_2.Advance + step_2.Royalties),2) AS Profits
FROM 
(SELECT 
step_1.title_id,
step_1.au_id,
step_1.Advance,
SUM(step_1.Royalty) AS Royalties
FROM
(SELECT titleauthor.title_id,
titleauthor.au_id,
titles.advance * titleauthor.royaltyper / 100 AS Advance,
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS Royalty
FROM titles
INNER JOIN sales ON sales.title_id = titles.title_id
INNER JOIN titleauthor ON titleauthor.title_id = sales.title_id) step_1
GROUP BY step_1.title_id,
         step_1.au_id) step_2
GROUP BY step_2.au_id
ORDER BY Profits DESC 
LIMIT 3;


CHALLENGE 2

#First, I have created the first temporary table:
CREATE TEMPORARY TABLE step_1 AS
SELECT
titleauthor.title_id AS 'Title ID',
titleauthor.au_id AS 'Author ID',
(titles.advance * titleauthor.royaltyper / 100) AS 'Advance',
(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS 'Royalty'
FROM titles 
INNER JOIN sales ON sales.title_id = titles.title_id 
INNER JOIN titleauthor ON titleauthor.title_id = sales.title_id 
ORDER BY titleauthor.title_id;

#Then, the second one:
CREATE TEMPORARY TABLE step_2 AS
SELECT
step_1.title_id AS 'Title ID',
step_1.au_id AS 'Author ID',
SUM(step_1.Royalty) AS Royalties
FROM
(SELECT titleauthor.title_id,
titleauthor.au_id,
titles.advance * titleauthor.royaltyper / 100 AS Advance,
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS Royalty
FROM titles
INNER JOIN sales ON sales.title_id = titles.title_id
INNER JOIN titleauthor ON titleauthor.title_id = sales.title_id) step_1
GROUP BY step_1.title_id,
         step_1.au_id
ORDER BY step_1.title_id;


#At the end, I have do the query using results of both temporary tables:
SELECT 
step_2.'Author ID',
ROUND(SUM(step_1.Advance + step_2.Royalties),2) AS Profits
FROM step_1
JOIN step_2 ON step_1.'Title ID' = step_2.'Title ID'
GROUP BY step_2.'Author ID'
ORDER BY Profits DESC
LIMIT 3
#I don't get the correct value and I don't know exactly why. 



CHALLENGE 3
CREATE TABLE most_profiting_authors AS 
SELECT 
step_2.'Author ID',
ROUND(SUM(step_1.Advance + step_2.Royalties),2) AS Profits
FROM step_1
JOIN step_2 ON step_1.'Title ID' = step_2.'Title ID'
GROUP BY step_2.'Author ID'
ORDER BY Profits DESC
LIMIT 3



