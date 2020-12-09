
'Solution for exercise 1'

SELECT authors.au_id as "AUTHOR ID" , au_lname AS "LAST NAME" , au_fname AS "FIRST NAME" , title AS "TITLE" , pub_name AS "PUBLISHER"
FROM authors
INNER JOIN  titleauthor ON authors.au_id = titleauthor.au_id 
INNER JOIN  titles ON titleauthor.title_id = titles.title_id 
INNER JOIN  publishers ON titles.pub_id = publishers.pub_id
ORDER BY authors.au_id , publisher DESC;


'Solution for exercise 2'

SELECT authors.au_id as "AUTHOR ID" , au_lname AS "LAST NAME" , au_fname AS "FIRST NAME", pub_name AS "PUBLISHER" , COUNT(title) as "TITLE COUNT" 
FROM authors
INNER JOIN  titleauthor ON authors.au_id = titleauthor.au_id 
INNER JOIN  titles ON titleauthor.title_id = titles.title_id 
INNER JOIN  publishers ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id , pub_name
ORDER BY authors.au_id DESC;


'Solution for exercise 3'

SELECT authors.au_id as "AUTHOR ID" , au_lname AS "LAST NAME" , au_fname AS "FIRST NAME", sum(qty) AS "TOTAL"
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id 
INNER JOIN titles ON titleauthor.title_id = titles.title_id 
INNER JOIN sales ON  sales.title_id = titles.title_id 
GROUP BY authors.au_id 
ORDER BY TOTAL DESC
LIMIT 3;


'Solution for exercise 4'

SELECT authors.au_id as "AUTHOR ID" , au_lname AS "LAST NAME" , au_fname AS "FIRST NAME",  IFNULL(sum(qty), 0) AS "TOTAL"
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id 
LEFT JOIN titles ON titleauthor.title_id = titles.title_id 
LEFT JOIN sales ON  sales.title_id = titles.title_id 
GROUP BY authors.au_id 
ORDER BY TOTAL DESC;

