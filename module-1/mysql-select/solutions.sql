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
