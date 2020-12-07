# CHALLENGE_1

SELECT
	authors.au_id as "AUTHOR ID", 
	authors.au_lname as "LAST NAME",
	authors.au_fname as "FIRST NAME",
	titles.title as "TITLE",
	publishers.pub_name as "PUBLISHER"

FROM authors

JOIN titleauthor ON authors.au_id = titleauthor.au_id 
JOIN titles ON titleauthor.title_id = titles.title_id 
JOIN publishers ON titles.pub_id = publishers.pub_id 
;


# CHALLENGE_2

SELECT
	authors.au_id as "AUTHOR ID", 
	authors.au_lname as "LAST NAME",
	authors.au_fname as "FIRST NAME",
	titles.title as "TITLE",
	publishers.pub_name as "PUBLISHER",
	COUNT (titles.title_id) as "TITLE COUNT"

FROM authors

JOIN titleauthor ON authors.au_id = titleauthor.au_id 
JOIN titles ON titleauthor.title_id = titles.title_id
JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_fname, titles.pub_id 
;

# CHALLENGE_3

SELECT
	authors.au_id as "AUTHOR ID", 
	authors.au_lname as "LAST NAME",
	authors.au_fname as "FIRST NAME",
	SUM(sales.qty) as "TOTAL"
	

FROM authors

JOIN titleauthor ON authors.au_id = titleauthor.au_id 
JOIN sales ON titleauthor.title_id = sales.title_id 
GROUP BY authors.au_id
ORDER BY "TOTAL" DESC 
LIMIT 3
;

# CHALLENGE_3


SELECT
	authors.au_id as "AUTHOR ID", 
	authors.au_lname as "LAST NAME",
	authors.au_fname as "FIRST NAME",
	sales.qty as "TOTAL"


FROM authors

JOIN titleauthor ON authors.au_id = titleauthor.au_id 
JOIN sales ON titleauthor.title_id = sales.title_id 
GROUP BY authors.au_id 
ORDER BY "TOTAL" DESC 



