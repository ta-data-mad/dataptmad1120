#CHALLENGE 1

SELECT authors.au_id as AUTHOR_ID, authors.au_fname as FIRST_NAME, authors.au_lname as LAST_NAME, titles.title as TITLES, publishers.pub_name as PUBLISHER
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id 
JOIN titles ON titleauthor.title_id = titles.title_id 
JOIN publishers ON titles.pub_id  = publishers.pub_id 

#CHALLENGE 2

SELECT authors.au_id as AUTHOR_ID, authors.au_fname as FIRST_NAME, authors.au_lname as LAST_NAME, publishers.pub_name as PUBLISHER, count(titles.title) as T_COUNT
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id 
JOIN titles ON titleauthor.title_id = titles.title_id 
JOIN publishers ON titles.pub_id  = publishers.pub_id 
GROUP BY AUTHOR_ID
ORDER BY T_COUNT DESC;

#CHALLENGE 3

SELECT authors.au_id as AUTHOR_ID, authors.au_fname as FIRST_NAME, authors.au_lname as LAST_NAME, sum(sales.qty) as T_SALES
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id 
JOIN titles ON titleauthor.title_id = titles.title_id 
JOIN sales ON titles.title_id = sales.title_id
GROUP BY AUTHOR_ID
ORDER BY T_SALES DESC
LIMIT 3;

#CHALLENGE 4

SELECT authors.au_id as AUTHOR_ID, authors.au_fname as FIRST_NAME, authors.au_lname as LAST_NAME, COALESCE(sum(sales.qty),0) as T_SALES
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id 
LEFT JOIN titles ON titleauthor.title_id = titles.title_id 
LEFT JOIN sales ON titles.title_id = sales.title_id
GROUP BY AUTHOR_ID
ORDER BY T_SALES DESC


