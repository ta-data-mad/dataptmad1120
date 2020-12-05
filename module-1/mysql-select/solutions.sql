#CHALLENGE 1

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

#CHALLENGE 2

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
ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, titles.pub_id
ORDER BY COUNT(titles.pub_id) DESC;

--> the sum of TITLE_COUNT (25) is the same as the total number of records int "titleauthor" table.

#CHALLENGE 3

SELECT authors.au_id AS AUTHOR_ID, 
authors.au_lname AS LAST_NAME, 
authors.au_fname AS FIRST_NAME,
SUM(titles.ytd_sales) AS TOTAL
FROM titles
JOIN titleauthor
ON titles.title_id = titleauthor.title_id
JOIN authors
ON authors.au_id = titleauthor.au_id
GROUP BY authors.au_id, titles.ytd_sales
ORDER BY SUM(titles.ytd_sales) DESC
LIMIT 3;

--> This is my output:
AUTHOR_ID	LAST_NAME	FIRST_NAME	TOTAL
722-51-5454	DeFrance	Michel		22,246
899-46-2035	Ringer		Anne		22,246
213-46-8915	Green		Marjorie	18,722

#CHALLENGE 4

SELECT authors.au_id AS AUTHOR_ID, 
authors.au_lname AS LAST_NAME, 
authors.au_fname AS FIRST_NAME,
COALESCE(SUM(titles.ytd_sales), 0) AS TOTAL
FROM titles
JOIN titleauthor
ON titles.title_id = titleauthor.title_id
JOIN authors
ON authors.au_id = titleauthor.au_id
GROUP BY authors.au_id, titles.ytd_sales
ORDER BY SUM(titles.ytd_sales) DESC;

--> This is my output:
AUTHOR_ID	LAST_NAME	FIRST_NAME	TOTAL
722-51-5454	DeFrance	Michel		22246
899-46-2035	Ringer		Anne		22246
213-46-8915	Green		Marjorie	18722
648-92-1872	Blotchet-Halls	Reginald	15096
238-95-7766	Carson		Cheryl		8780
213-46-8915	Green		Marjorie	4095
267-41-2394	O'Leary	Michael	4095
274-80-9391	Straight	Dean		4095
409-56-7008	Bennet		Abraham	4095
427-17-2319	Dull		Ann		4095
472-27-2349	Gringlesby	Burt		4095
672-71-3249	Yokomoto	Akiko		4095
846-92-7186	Hunter		Sheryl		4095
172-32-1176	White		Johnson	4072
267-41-2394	O'Leary	Michael	3876
724-80-9391	MacFeather	Stearns	3876
486-29-1786	Locksley	Charlene	3336
899-46-2035	Ringer		Anne		2045
998-72-3567	Ringer		Albert		2045
712-45-1867	del Castillo	Innes		2032
724-80-9391	MacFeather	Stearns	375
756-30-7391	Karsen		Livia		375
807-91-6654	Panteley	Sylvia		375
998-72-3567	Ringer		Albert		111
486-29-1786	Locksley	Charlene	0
