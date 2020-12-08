#Challenge 1 Who have published what at where? 

SELECT 
authors.au_id AS "AUTHOR ID",
authors.au_lname AS “LAST NAME",
authors.au_fname AS "FIRST NAME",
titles.title AS "TITLE",
publishers.pub_name AS "PUBLISHER" 
FROM authors
JOIN titleauthor ON titleauthor.au_id =authors.au_id
JOIN titles ON titles.title_id = titleauthor.title_id
JOIN publishers ON publishers.pub_id = titles.pub_id; 
 
#Total rows = Total number title author = 25


#Challenge 2 Who have published how many at where?

SELECT 
authors.au_id AS "AUTHOR ID",
authors.au_lname AS "LAST NAME",
authors.au_fname AS”FIRST NAME",
publishers.pub_name AS “PUBLISHER",
COUNT(titles.pub_id) AS” TITLE COUNT" 
FROM authors
JOIN titleauthor ON titleauthor.au_id =authors.au_id
JOIN titles ON titles.title_id = titleauthor.title_id
JOIN publishers ON publishers.pub_id = titles.pub_id
GROUP BY  titles.title
ORDER BY “TITLE COUNT" DESC ;

#Summ of TITLE COUNT column = Total number titleauthor = 25

#Challenge 3 Best selling authors

SELECT 
authors.au_id AS "AUTHOR ID",
authors.au_lname AS "LAST NAME",
authors.au_fname AS "FIRST NAME",
SUM(sales.qty) AS "TOTAL"
FROM authors
JOIN titleauthor ON titleauthor.au_id =authors.au_id
JOIN titles ON titles.title_id = titleauthor.title_id
JOIN publishers ON publishers.pub_id = titles.pub_id
JOIN sales ON sales.title_id = titles.title_id 
GROUP BY titleauthor.au_id 
ORDER BY "TOTAL" DESC
LIMIT 3;

#Challenge 4 Best selling authors ranking


SELECT 
authors.au_id AS "AUTHOR ID",
authors.au_lname AS "LAST NAME",
authors.au_fname AS "FIRST NAME",
IFNULL ((sales.qty),0) AS "TOTAL"
FROM authors
LEFT JOIN titleauthor ON titleauthor.au_id =authors.au_id
LEFT JOIN titles ON titles.title_id = titleauthor.title_id
LEFT JOIN publishers ON publishers.pub_id = titles.pub_id
LEFT JOIN sales ON sales.title_id = titles.title_id 
GROUP BY author.au_id 
ORDER BY "TOTAL" DESC;


