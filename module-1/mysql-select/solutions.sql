#CHALLENGE 1

SELECT authors.au_id as AUTHOR_ID, authors.au_fname as FIRST_NAME, authors.au_lname as LAST_NAME, titles.title as TITLES, publishers.pub_name as PUBLISHER
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id 
JOIN titles ON titleauthor.title_id = titles.title_id 
JOIN publishers ON titles.pub_id  = publishers.pub_id 

#CHALLENGE 2
