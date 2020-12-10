SELECT 
titleauthor.au_id AS "Author ID",
titles.title_id AS "Title ID",
(titles.advance * titleauthor.royaltyper/100) AS "Advance"
FROM titleauthor
LEFT JOIN titles ON titles.title_id = titleauthor.title_id
LEFT JOIN sales ON sales.title_id = titles.title_id