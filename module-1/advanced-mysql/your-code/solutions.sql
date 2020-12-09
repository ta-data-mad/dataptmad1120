CHALLENGE 1

##Step 1: 

SELECT titles.title_id, 
au_id,
(titles.advance * titleauthor.royaltyper / 100) as advance, 
(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) as sales_royalty
FROM titles
JOIN titleauthor ON titles.title_id = titleauthor.title_id 
JOIN sales ON titles.title_id = sales.title_id
;

Step 2:

SELECT title_id,
au_id, 
SUM(sales_royalty) as aggregated_royalties
FROM (
	SELECT titles.title_id, 
	au_id, 
	(titles.advance * titleauthor.royaltyper / 100) as advance, 
	(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) as sales_royalty
	FROM titles
	JOIN titleauthor ON titles.title_id = titleauthor.title_id 
	JOIN sales ON titles.title_id = sales.title_id
)
GROUP BY au_id, title_id
;

Step 3: 

SELECT au_id, 
((SUM(aggregated_royalties)) + (SUM(advance))) AS profits
FROM(

	SELECT title_id,
	au_id,
	SUM(sales_royalty) as aggregated_royalties, 
	advance 
	FROM (
		SELECT titles.title_id, 
		au_id,
		(titles.advance * titleauthor.royaltyper / 100) as advance, 
		(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) as sales_royalty
		FROM titles
		JOIN titleauthor ON titles.title_id = titleauthor.title_id 
		JOIN sales ON titles.title_id = sales.title_id
	)
	GROUP BY au_id, title_id
)
GROUP by au_id
ORDER BY profits DESC
LIMIT 3
;

CHALLENGE 2

CREATE TEMPORARY TABLE IF NOT EXISTS alternative_solution AS
SELECT title_id, 
au_id,
SUM(sales_royalty) as aggregated_royalties, 
advance 
FROM (
	SELECT titles.title_id, 
	au_id,
	(titles.advance * titleauthor.royaltyper / 100) as advance, 
	(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) as sales_royalty
	FROM titles
	JOIN titleauthor ON titles.title_id = titleauthor.title_id 
	JOIN sales ON titles.title_id = sales.title_id
	)
GROUP BY au_id, title_id
;


SELECT au_id, ((SUM(aggregated_royalties)) + (SUM(advance))) AS profits
FROM alternative_solution
GROUP by au_id
ORDER BY profits DESC
LIMIT 3
;

CHALLENGE 3

CREATE TABLE IF NOT EXISTS most_profiting_authors
AS
SELECT au_id, 
((SUM(aggregated_royalties)) + (SUM(advance))) AS profits
FROM(
	SELECT title_id, au_id, SUM(sales_royalty) as aggregated_royalties, advance 
	FROM (
		SELECT titles.title_id, 
		au_id, 
		(titles.advance * titleauthor.royaltyper / 100) as advance, 
		(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) as sales_royalty
		FROM titles
		JOIN titleauthor ON titles.title_id = titleauthor.title_id 
		JOIN sales ON titles.title_id = sales.title_id
	)
	GROUP BY au_id, title_id
)
GROUP by au_id
ORDER BY profits DESC
LIMIT 3;
