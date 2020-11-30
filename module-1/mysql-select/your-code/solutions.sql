SOLUTION TO CHALLENGE 1:
	
SELECT 
authors.au_id as "AUTHOR ID",
authors.au_lname as "LAST NAME",
authors.au_fname as "FIRST NAME",
titles.title as "TITLE",
publishers.pub_name as "PUBLISHER" 
FROM authors
JOIN titleauthor 
ON authors.au_id = titleauthor.au_id
JOIN titles
ON titleauthor.title_id = titles.title_id 
JOIN publishers
ON titles.pub_id = publishers.pub_id 

SOLUTION TO CHALLENGE 2:

SELECT 
authors.au_id, 
authors.au_fname, 
authors.au_lname, 
publishers.pub_name, 
count(publishers.pub_id) as titles_published 
FROM authors
JOIN titleauthor 
ON authors.au_id = titleauthor.au_id
JOIN titles
ON titleauthor.title_id = titles.title_id
JOIN publishers
ON titles.pub_id = publishers.pub_id 
GROUP BY 
authors.au_id, 
authors.au_fname, 
authors.au_lname, 
publishers.pub_name
ORDER BY titles_published DESC 
