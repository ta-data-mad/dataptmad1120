# CHALLENGE 1 

SELECT au_id, total_royalties + advance AS total_income
FROM (
SELECT title_id, SUM(sales_royalty) AS total_royalties, advance, au_id, title_id 
FROM (
SELECT authors.au_id,
	   titles.title_id,
	   titles.advance * titleauthor.royaltyper /100 as advance,
	   titles.price * sales.qty / 100 * titleauthor.royaltyper /100 AS sales_royalty
FROM sales
JOIN titles ON sales.title_id = titles.title_id
JOIN titleauthor ON titles.title_id = titleauthor.title_id 
JOIN authors ON authors.au_id = titleauthor.au_id
)
GROUP BY au_id, title_id 
)
ORDER BY total_income DESC

#CHALLENGE 2 
