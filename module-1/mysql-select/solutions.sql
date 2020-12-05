SELECT * FROM titleauthor;

SELECT authors.au_id as 'Author ID', 
au_lname as 'Last Name', 
au_fname as 'First Name', 
title as Title,
publishers.pub_name as Publishers
FROM titles
JOIN titleauthor
ON titles.title_id = titleauthor.title_id 
JOIN authors
ON authors.au_id = titleauthor.au_id 
JOIN publishers
ON titles.pub_id = publishers.pub_id;


EJERCICIO 2

SELECT authors.au_id as AUTHOR_ID, 
authors.au_lname as LAST_NAME, 
authors.au_fname as FIRST_NAME, 
publishers.pub_name as PUBLISHER,
COUNT(titles.title) as TOTAL_COUNT 
FROM titles
LEFT JOIN titleauthor 
ON titles.title_id = titleauthor.title_id 
LEFT JOIN authors
ON titleauthor.au_id = authors.au_id 
LEFT JOIN publishers
ON publishers.pub_id = titles.pub_id   
GROUP BY authors.au_id 
ORDER BY TOTAL_COUNT DESC;
