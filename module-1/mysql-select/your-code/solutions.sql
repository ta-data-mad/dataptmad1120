SELECT authors.au_id AS "AUTHOR ID",authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME",
titles.title AS "TITLE", publishers.pub_name AS "PUBLISHER"
FROM authors 
JOIN titleauthor ON titleauthor.au_id = authors.au_id
JOIN titles ON titles.title_id = titleauthor.title_id 
JOIN publishers ON publishers.pub_id = titles.pub_id;



SELECT authors.au_id AS "AUTHOR ID",authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME",
publishers.pub_name AS "PUBLISHER", COUNT(titles.title_id) AS "TITLE COUNT"
FROM authors 
JOIN titleauthor ON titleauthor.au_id = authors.au_id
JOIN titles ON titles.title_id = titleauthor.title_id 
JOIN publishers ON publishers.pub_id = titles.pub_id
GROUP BY "AUTHOR ID","PUBLISHER"
ORDER BY "TITLE COUNT" DESC;



SELECT authors.au_id AS "AUTHOR ID",authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME",
SUM(sales.qty) AS "TOTAL"
FROM authors 
JOIN titleauthor ON titleauthor.au_id = authors.au_id
JOIN titles ON titles.title_id = titleauthor.title_id
JOIN sales ON sales.title_id = titles.title_id 
GROUP BY "AUTHOR ID"
ORDER BY "TOTAL" DESC
LIMIT 3;

SELECT authors.au_id AS "AUTHOR ID",authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME",
SUM(sales.qty) AS "TOTAL"
FROM authors 
JOIN titleauthor ON titleauthor.au_id = authors.au_id
JOIN titles ON titles.title_id = titleauthor.title_id
JOIN sales ON sales.title_id = titles.title_id 
GROUP BY "AUTHOR ID"
ORDER BY "TOTAL" DESC

