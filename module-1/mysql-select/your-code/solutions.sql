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
titleauthor.au_id as "AUTHOR ID", 
authors.au_lname as "LAST NAME", 
authors.au_fname as "FIRST NAME", 
publishers.pub_name as "PUBLISHER", 
count(publishers.pub_id) as titles_published 
FROM authors
JOIN titleauthor 
ON authors.au_id = titleauthor.au_id
JOIN titles
ON titleauthor.title_id = titles.title_id
JOIN publishers
ON titles.pub_id = publishers.pub_id 
GROUP BY 
titleauthor.au_id, 
authors.au_fname, 
authors.au_lname, 
publishers.pub_name
ORDER BY titles_published DESC

SOLUTION TO CHALLENGE 3:

SELECT
authors.au_id as "AUTHOR ID",
authors.au_lname as "LAST NAME",
authors.au_fname as "FIRST NAME",
SUM(sales.qty) as "TOTAL"
FROM authors
JOIN titleauthor
ON authors.au_id = titleauthor.au_id
JOIN titles
ON titleauthor.title_id = titles.title_id
JOIN publishers
ON titles.pub_id = publishers.pub_id
cJOIN sales
ON titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC 
LIMIT 3


SOLUTION CHALLENGE 4:

SELECT
IFNULL(titleauthor.au_id, 0) as "AUTHOR ID",
authors.au_lname as "LAST NAME",
authors.au_fname as "FIRST NAME",
IFNULL(SUM(sales.qty),0) as "TOTAL"
FROM authors
LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN publishers
ON titles.pub_id = publishers.pub_id
LEFT JOIN sales
ON titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC
