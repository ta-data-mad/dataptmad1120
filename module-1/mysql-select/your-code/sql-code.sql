CHALLENGE 1

SELECT authors.au_id as author_id, 
authors.au_fname as first_name , 
authors.au_lname as last_name,
titles.title,
publishers.pub_name as publisher
FROM titles
JOIN titleauthor ON titles.title_id = titleauthor.title_id
JOIN authors ON authors.au_id = titleauthor.au_id
JOIN publishers ON titles.pub_id = publishers.pub_id
;

CHALLENGE 2

SELECT authors.au_id as author_id, 
authors.au_fname as first_name, 
authors.au_lname as last_name ,
publishers.pub_name as publisher,
COUNT(DISTINCT titles.title_id) as title_count
FROM titles
JOIN titleauthor ON titles.title_id = titleauthor.title_id
JOIN authors ON authors.au_id = titleauthor.au_id
JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_fname, publishers.pub_id 
;

CHALLENGE 3

SELECT authors.au_id as author_id, 
authors.au_fname as first_name, 
authors.au_lname as last_name ,
SUM( sales.qty) as total
FROM titles
JOIN titleauthor ON titles.title_id = titleauthor.title_id
JOIN authors ON authors.au_id = titleauthor.au_id
JOIN sales ON titles.title_id = sales.title_id
GROUP BY  authors.au_id 
ORDER BY total DESC
LIMIT 3
;

CHALLENGE 4

SELECT authors.au_id as author_id, 
authors.au_fname as first_name, 
authors.au_lname as last_name ,
SUM( sales.qty) as total
FROM titles
LEFT JOIN titleauthor ON titles.title_id = titleauthor.title_id
LEFT JOIN authors ON authors.au_id = titleauthor.au_id
LEFT JOIN sales ON titles.title_id = sales.title_id
GROUP BY authors.au_id 
ORDER BY total DESC
;
