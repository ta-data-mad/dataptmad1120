# CHALLENGE 1 

SELECT title_id, au_id, SUM(sales_royalty) AS royalties, advance, (sales_royalty + advance) AS profit
FROM (
SELECT authors.au_id ,
	   authors.au_fname AS au_name,
	   sales.ord_num, 
	   titles.title_id,
	   titles.title AS titles, 
	   sales.qty, 
	   titles.royalty,
	   titles.advance * titleauthor.royaltyper /100 as advance,
	   titles.price * sales.qty / 100 * titleauthor.royaltyper /100 AS sales_royalty
FROM sales
JOIN titles ON sales.title_id = titles.title_id
JOIN titleauthor ON titles.title_id = titleauthor.title_id 
JOIN authors ON authors.au_id = titleauthor.au_id
)
GROUP BY title_id, au_id
ORDER BY sales_royalty DESC
LIMIT 3

#CHALLENGE 2 
