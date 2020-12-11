CHALLENGE 1 

STEP 1

SELECT titleauthor.title_id AS 'Title ID',
titleauthor.au_id AS 'Author ID',
titles.advance * titleauthor.royaltyper / 100 AS 'Advance',
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS 'Royalty'
FROM titles
INNER JOIN sales
ON sales.title_id = titles.title_id
INNER JOIN titleauthor
ON titleauthor.title_id = sales.title_id 
ORDER BY titleauthor.title_id;


STEP 2 

WITH step_1 AS
(SELECT titleauthor.title_id AS 'Title ID',
titleauthor.au_id AS 'Author ID',
titles.advance * titleauthor.royaltyper / 100 AS 'Advance',
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS 'Royalty'
FROM titles
INNER JOIN sales
ON sales.title_id = titles.title_id
INNER JOIN titleauthor
ON titleauthor.title_id = sales.title_id 
ORDER BY titleauthor.title_id
)
SELECT 'Title ID',
'Author ID',
'Advance',
SUM(Royalty) AS Royalties
FROM step_1
GROUP BY 'Author ID', 'Title ID'
ORDER BY 'Title ID';



STEP 3 

WITH step_2 AS (
WITH step_1 AS (
SELECT titleauthor.title_id AS 'Title ID',
titleauthor.au_id AS 'Author ID',
titles.advance * titleauthor.royaltyper / 100 AS 'Advance',
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS 'Royalty'
FROM titles
INNER JOIN sales
ON sales.title_id = titles.title_id
INNER JOIN titleauthor
ON titleauthor.title_id = sales.title_id 
ORDER BY titleauthor.title_id
)
SELECT 'Title ID',
'Author ID',
'Advance',
SUM(Royalty) AS Royalties
FROM step_1
GROUP BY 'Author ID', 'Title ID'
ORDER BY 'Title ID'
)
SELECT 'Author ID',
ROUND(SUM('Advance' + Royalties), 2) AS Profits
FROM step_2
GROUP BY 'Author ID'
ORDER BY Profits DESC
LIMIT 3;



CHALLENGE 2

CREATE TEMPORARY TABLE IF NOT EXISTS challenge_2 AS
WITH step_2 AS (
WITH step_1 AS (
SELECT titleauthor.title_id AS 'Title ID',
titleauthor.au_id AS 'Author ID',
titles.advance * titleauthor.royaltyper / 100 AS 'Advance',
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS 'Royalty'
FROM titles
INNER JOIN sales
ON sales.title_id = titles.title_id
INNER JOIN titleauthor
ON titleauthor.title_id = sales.title_id 
ORDER BY titleauthor.title_id
)
SELECT 'Title ID',
'Author ID',
'Advance',
SUM(Royalty) AS Royalties
FROM step_1
GROUP BY 'Author ID', 'Title ID'
ORDER BY 'Title ID'
)
SELECT 'Author ID',
ROUND(SUM('Advance' + Royalties), 2) AS Profits
FROM step_2
GROUP BY 'Author ID'
ORDER BY Profits DESC
LIMIT 3;



CHALLENGE 3

CREATE TABLE IF NOT EXISTS challenge_3 AS
WITH step_2 AS (
WITH step_1 AS (
SELECT titleauthor.title_id AS 'Title ID',
titleauthor.au_id AS 'Author ID',
titles.advance * titleauthor.royaltyper / 100 AS 'Advance',
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS 'Royalty'
FROM titles
INNER JOIN sales
ON sales.title_id = titles.title_id
INNER JOIN titleauthor
ON titleauthor.title_id = sales.title_id 
ORDER BY titleauthor.title_id
)
SELECT 'Title ID',
'Author ID',
'Advance',
SUM(Royalty) AS Royalties
FROM step_1
GROUP BY 'Author ID', 'Title ID'
ORDER BY 'Title ID'
)
SELECT 'Author ID',
ROUND(SUM('Advance' + Royalties), 2) AS Profits
FROM step_2
GROUP BY 'Author ID'
ORDER BY Profits DESC;






























