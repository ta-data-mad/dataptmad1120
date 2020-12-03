## Challenge 1 - Who Have Published What At Where?

SELECT authors.au_id AS 'AUTHOR ID', authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME', titles.title AS 'TITLE', publishers.pub_name AS PUBLISHER
FROM titles
JOIN publishers ON titles.pub_id = publishers.pub_id
JOIN titleauthor ON titles.title_id = titleauthor.title_id
JOIN authors ON titleauthor.au_id = authors.au_id;

## Challenge 2 - Who Have Published How Many At Where?

SELECT authors.au_id AS 'AUTHOR ID', authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME', publishers.pub_name AS 'PUBLISHER', 
COUNT(titles.pub_id) AS 'TITLE COUNT'
FROM titles
JOIN publishers ON titles.pub_id = publishers.pub_id
JOIN titleauthor ON titles.title_id = titleauthor.title_id
JOIN authors ON titleauthor.au_id = authors.au_id
GROUP BY authors.au_id, publishers.pub_name 

## Challenge 3 - Best Selling Authors

SELECT authors.au_id AS 'AUTHOR ID', authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME', SUM(sales.qty) AS 'TOTAL'
FROM titles
JOIN publishers ON titles.pub_id = publishers.pub_id
JOIN titleauthor ON titles.title_id = titleauthor.title_id
JOIN authors ON titleauthor.au_id = authors.au_id
JOIN sales ON titles.title_id = sales.title_id 
GROUP BY authors.au_id
ORDER BY SUM(sales.qty) DESC
LIMIT 3;

## Challenge 4 - Best Selling Authors Ranking

SELECT authors.au_id AS 'AUTHOR ID', authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME', COALESCE(SUM(sales.qty), 0) AS 'TOTAL'
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN sales ON sales.title_id = titleauthor.title_id 
GROUP BY authors.au_id
ORDER BY COALESCE(SUM(sales.qty), 0) DESC;
