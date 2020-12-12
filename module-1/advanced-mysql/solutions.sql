Challenge #1

Step 1


SELECT titles.title_id AS "Title ID", 
au_id AS "Authors ID",
(titles.advance * titleauthor.royaltyper / 100) AS Advance, 
(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS "Sales Royalty"
FROM titles
JOIN titleauthor ON titles.title_id = titleauthor.title_id 
JOIN sales ON titles.title_id = sales.title_id
;


Step 2 

SELECT "Title ID", "Authors ID", 
SUM("Sales Royalty") AS "Aggregated Royalties"
FROM (
	SELECT titles.title_id AS "Title ID", 
	au_id AS "Authors ID",
	(titles.advance * titleauthor.royaltyper / 100) AS Advance, 
	(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS "Sales Royalty"
	FROM titles
	JOIN titleauthor ON titles.title_id = titleauthor.title_id 
	JOIN sales ON titles.title_id = sales.title_id
)
GROUP BY "Authors ID", "Title ID"
;

Step 3

SELECT "Authors ID", ((SUM("Aggregated Royalties")) + (SUM(advance))) AS Profits
FROM(

	SELECT "Title ID", "Authors ID", 
	SUM("Sales Royalty") AS "Aggregated Royalties"
	FROM (
		SELECT titles.title_id AS "Title ID", 
		au_id AS "Authors ID",
		(titles.advance * titleauthor.royaltyper / 100) AS Advance, 
		(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS "Sales Royalty"
		FROM titles
		JOIN titleauthor ON titles.title_id = titleauthor.title_id 
		JOIN sales ON titles.title_id = sales.title_id
	)
GROUP BY "Authors ID"
ORDER BY "Profits" DESC
LIMIT 3
;



Challenge #2

CREATE TEMPORARY TABLE IF NOT EXISTS alternative_solution AS
SELECT "Title ID", 
"Authors ID",
SUM("Sales Royalty") as "Aggregated Royalties", 
Advance 
FROM (
		SELECT titles.title_id AS "Title ID", 
		au_id AS "Authors ID",
		(titles.advance * titleauthor.royaltyper / 100) AS Advance, 
		(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS "Sales Royalty"
		FROM titles
		JOIN titleauthor ON titles.title_id = titleauthor.title_id 
		JOIN sales ON titles.title_id = sales.title_id
)
GROUP BY "Authors ID", "Title ID"



Challenge #3

CREATE TABLE IF NOT EXISTS most_profiting_authors
AS
SELECT "Authors ID", 
((SUM("Aggregated Royalties")) + (SUM(advance))) AS Profits
FROM (
SELECT "Title ID", "Authors ID", SUM("Sales Royalty") AS "Aggregated Royalties", Advance
FROM (
		SELECT titles.title_id AS "Title ID", 
		au_id AS "Authors ID",
		(titles.advance * titleauthor.royaltyper / 100) AS Advance, 
		(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS "Sales Royalty"
		FROM titles
		JOIN titleauthor ON titles.title_id = titleauthor.title_id 
		JOIN sales ON titles.title_id = sales.title_id
)
GROUP BY "Authors ID", "Title ID" 
)
GROUP BY "Authors ID"
ORDER BY Profits
LIMIT 3
;


