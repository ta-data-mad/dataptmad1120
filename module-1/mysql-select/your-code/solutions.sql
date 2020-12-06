Challenge 1:

SELECT authors.au_id,
authors.au_lname,
authors.au_fname,
titles.title,
publishers.pub_name
FROM titles
JOIN titleauthor
ON titles.title_id= titleauthor.title_id 
JOIN authors
ON titleauthor.au_id = authors.au_id 
JOIN publishers
ON titles.pub_id =publishers.pub_id


Challenge 2:

SELECT authors.au_id,
authors.au_lname,
authors.au_fname,
publishers.pub_id,
count(titles.title)
FROM titles
JOIN titleauthor
ON titles.title_id= titleauthor.title_id 
JOIN authors
ON titleauthor.au_id = authors.au_id 
JOIN publishers
ON titles.pub_id =publishers.pub_id
GROUP BY titles.title;


Challenge 3:

SELECT authors.au_id,
authors.au_lname,
authors.au_fname,
Sum(sales.qty) AS total
FROM titles
JOIN titleauthor
ON titles.title_id= titleauthor.title_id 
JOIN authors
ON titleauthor.au_id = authors.au_id 
JOIN sales
ON titles.title_id =sales.title_id 
GROUP BY authors.au_id 
ORDER BY total DESC 
LIMIT 3;


Challenge 4:
SELECT authors.au_id,
authors.au_lname,
authors.au_fname,
Coalesce(Sum(sales.qty),0) AS total
FROM authors
LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id 
LEFT JOIN titles
ON titleauthor.title_id = titles.title_id 
LEFT JOIN sales
ON titles.title_id = sales.title_id
GROUP BY authors.au_id 
ORDER BY total DESC 
