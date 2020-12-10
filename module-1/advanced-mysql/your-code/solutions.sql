Challenge 1:

Step 1:

SELECT 
authors.au_id AS authors,
titles.title_id AS title_id,
sales.ord_num,
(titles.advance * titleauthor.royaltyper/100) AS advance,
(titles.price * sales.qty * titles.royalty /100 * titleauthor.royaltyper/100) AS sales_royalty
FROM 
authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titleauthor.title_id = titles.title_id 
LEFT JOIN sales ON titles.title_id = sales.title_id;



Step 2:

with step_2 AS
(SELECT 
authors.au_id AS authors,
titles.title_id AS title,
(titles.advance * titleauthor.royaltyper/100) AS advance,
(titles.price * sales.qty * titles.royalty /100 * titleauthor.royaltyper/100) AS sales_royalty
FROM 
authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titleauthor.title_id = titles.title_id 
LEFT JOIN sales ON titles.title_id = sales.title_id)
SELECT authors, title, sum(sales_royalty) AS royalties
FROM step_2
GROUP BY authors, title


Step 3:

with step_3 AS
(with step_2 AS
(SELECT 
authors.au_id AS authors,
titles.title_id AS title,
(titles.advance * titleauthor.royaltyper/100) AS advance,
(titles.price * sales.qty * titles.royalty /100 * titleauthor.royaltyper/100) AS sales_royalty
FROM 
authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titleauthor.title_id = titles.title_id 
LEFT JOIN sales ON titles.title_id = sales.title_id)
SELECT authors, title, sum(sales_royalty) AS royalties, sum(distinct advance) AS advance
FROM step_2
GROUP BY authors)
SELECT authors,
SUM(royalties) + SUM(advance) AS profits
FROM step_3
GROUP BY authors
ORDER BY profits DESC 
LIMIT 3;




