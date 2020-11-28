###################################################
# Challenge 1 - Who Have Published What At Where? #
###################################################
SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, t.title AS TITLE, p.pub_name AS PUBLISHER
FROM authors a JOIN titleauthor ta ON a.au_id = ta.au_id
JOIN titles t ON t.title_id = ta.title_id
JOIN publishers p ON t.pub_id = p.pub_id;


#######################################################
# Challenge 2 - Who Have Published How Many At Where? #
#######################################################
SELECT a.au_id AS AUTHOR_ID, 
	a.au_lname AS LAST_NAME, 
	a.au_fname AS FIRST_NAME, 
	p.pub_name AS PUBLISHER,
	COUNT(t.title) AS TITLE_COUNT
FROM authors a JOIN titleauthor ta ON a.au_id = ta.au_id 
JOIN titles t ON t.title_id = ta.title_id 
JOIN publishers p ON t.pub_id = p.pub_id 
GROUP BY PUBLISHER, AUTHOR_ID;


######################################
# Challenge 3 - Best Selling Authors #
######################################
SELECT a.au_id AS AUTHOR_ID,
	a.au_lname AS LAST_NAME,
	a.au_fname AS FIRST_NAME,
	SUM(s.qty) AS TOTAL
FROM authors a JOIN titleauthor ta ON a.au_id = ta.au_id
JOIN titles t ON t.title_id = ta.title_id
JOIN sales s ON t.title_id = s.title_id
GROUP BY AUTHOR_ID
ORDER BY TOTAL DESC
LIMIT 3;


##############################################
# Challenge 4 - Best Selling Authors Ranking #
##############################################
SELECT a.au_id AS AUTHOR_ID, 
	a.au_lname AS LAST_NAME, 
	a.au_fname AS FIRST_NAME, 
	IFNULL(SUM(s.qty), 0) AS TOTAL
FROM authors a LEFT JOIN titleauthor ta ON a.au_id = ta.au_id 
LEFT JOIN titles t ON t.title_id = ta.title_id 
LEFT JOIN sales s ON t.title_id = s.title_id 
GROUP BY AUTHOR_ID
ORDER BY TOTAL DESC;


