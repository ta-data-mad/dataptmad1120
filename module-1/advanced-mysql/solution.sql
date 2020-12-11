# CHALLENGE_1 

SELECT au_id, sales_royalty_total + advance as profit
FROM (
SELECT title_id, au_id, SUM(sales_royalty) as sales_royalty_total, advance
FROM (
SELECT titles.title_id, 
	   titleauthor.au_id, 
	   titles.advance * titleauthor.royaltyper / 100 as advance,
	   titles.price * sales.qty * titles.royalty /100 * titleauthor.royaltyper / 100 as sales_royalty
FROM titles
JOIN titleauthor ON titles.title_id = titleauthor.title_id
JOIN sales ON titles.title_id = sales.title_id
)
GROUP BY au_id, title_id
)
ORDER BY profit  DESC
LIMIT 3

#CHALLENGE_2 
#STEP_1

CREATE TEMPORARY TABLE table_1 as 
	   SELECT titles.title_id, 
	          titleauthor.au_id, 
	          titles.advance * titleauthor.royaltyper / 100 as advance,
	          titles.price * sales.qty * titles.royalty /100 * titleauthor.royaltyper / 100 as sales_royalty
       FROM titles
       JOIN titleauthor ON titles.title_id = titleauthor.title_id
       JOIN sales ON titles.title_id = sales.title_id
       
#STEP_2    
CREATE TEMPORARY TABLE table_2 as 
SELECT title_id, au_id, SUM(sales_royalty) as sales_royalty_total, advance
FROM table_1
GROUP BY au_id, title_id

#STEP_3
       
SELECT au_id, sales_royalty_total + advance as profit
FROM table_2
ORDER BY profit  DESC
LIMIT 3
