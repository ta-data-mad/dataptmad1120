##Challenge 1 - Most Profiting Authors
##Step 1: Calculate the royalty of each sale for each author and the advance for each author and publication

SELECT titles.title_id, au_id, (titles.advance * titleauthor.royaltyper / 100) as advance, 
(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) as sales_royalty
FROM titles
JOIN titleauthor ON titles.title_id = titleauthor.title_id 
JOIN sales ON titles.title_id = sales.title_id;

##Step 2: Aggregate the total royalties for each title and author

SELECT title_id, au_id, SUM(sales_royalty) as aggregated_royalties
FROM (
	SELECT titles.title_id, au_id, (titles.advance * titleauthor.royaltyper / 100) as advance, 
	(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) as sales_royalty
	FROM titles
	JOIN titleauthor ON titles.title_id = titleauthor.title_id 
	JOIN sales ON titles.title_id = sales.title_id
)
GROUP BY au_id, title_id;

##Step 3: Calculate the total profits of each author

SELECT au_id, ((SUM(aggregated_royalties)) + (SUM(advance))) AS profits
FROM(

	SELECT title_id, au_id, SUM(sales_royalty) as aggregated_royalties, advance 
	FROM (
		SELECT titles.title_id, au_id, (titles.advance * titleauthor.royaltyper / 100) as advance, 
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

##Challenge 2 - Alternative Solution



