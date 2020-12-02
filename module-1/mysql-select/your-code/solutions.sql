
'Solution for exercise 1'

SELECT authors.au_id as "AUTHOR ID" , au_lname AS "LAST NAME" , au_fname AS "FIRST NAME" , title AS "TITLE" , pub_name AS "PUBLISHERS"
FROM authors
INNER JOIN  titleauthor ON authors.au_id = titleauthor.au_id 
INNER JOIN  titles ON titleauthor.title_id = titles.title_id 
INNER JOIN  publishers ON titles.pub_id = publishers.pub_id
