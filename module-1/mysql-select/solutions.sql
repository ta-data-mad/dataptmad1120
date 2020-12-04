CHALLENGE 1

SELECT authors.au_id AS AUTHOR_ID, 
authors.au_lname AS LAST_NAME, 
authors.au_fname AS FIRST_NAME,
titles.title,
publishers.pub_name AS PUBLISHER
FROM titles
JOIN titleauthor
ON titles.title_id = titleauthor.title_id
JOIN authors
ON authors.au_id = titleauthor.au_id
JOIN publishers
ON titles.pub_id = publishers.pub_id;

--> yes, my query is right because the total rows are 25, as the total number of records in table "titleauthor".

SELECT authors.au_id AS AUTHOR_ID, 
authors.au_lname AS LAST_NAME, 
authors.au_fname AS FIRST_NAME,
publishers.pub_name AS PUBLISHER,
COUNT(titles.pub_id) AS TITLE_COUNT
FROM titles
JOIN titleauthor
ON titles.title_id = titleauthor.title_id
JOIN authors
ON authors.au_id = titleauthor.au_id
JOIN publishers
ON titles.pub_id = publishers.pub_id;
