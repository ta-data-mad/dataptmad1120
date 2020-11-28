Challenge 1:

SELECT 
authors.au_id as "AUTHOR ID", 
authors.au_lname AS "lAST NAME",
authors.au_fname AS "FIRST NAME",
titles.title AS "TITLE",
publishers.pub_name AS "PUBLISHER"
FROM authors
join titleauthor on authors.au_id = titleauthor.au_id
join titles on titleauthor.title_id = titles.title_id
join publishers on titles.pub_id = publishers.pub_id;


Challenge 2:

SELECT 
authors.au_id as "AUTHOR ID", 
authors.au_lname AS "lAST NAME",
authors.au_fname AS "FIRST NAME",
publishers.pub_name AS "PUBLISHER",
COUNT(titles.title) AS "TITLE COUNT"
FROM authors
join titleauthor on authors.au_id = titleauthor.au_id
join titles on titleauthor.title_id = titles.title_id
join publishers on titles.pub_id = publishers.pub_id
GROUP BY titles.title;


Challenge 3:

SELECT 
authors.au_id as "AUTHOR ID", 
authors.au_lname AS "lAST NAME",
authors.au_fname AS "FIRST NAME",
SUM(sales.qty) AS "TOTAL"
FROM authors
join titleauthor on authors.au_id = titleauthor.au_id
join titles on titleauthor.title_id = titles.title_id
join sales on sales.title_id = titles.title_id 
GROUP BY authors.au_id
Order by TOTAL DESC 
LIMIT 3;


Challenge 4:

SELECT 
authors.au_id as "AUTHOR ID", 
authors.au_lname AS "lAST NAME",
authors.au_fname AS "FIRST NAME",
sum(COALESCE(sales.qty,0)) as "TOTAL"
FROM authors
left join titleauthor on authors.au_id = titleauthor.au_id
left join titles on titleauthor.title_id = titles.title_id
left join sales on sales.title_id = titles.title_id 
GROUP BY authors.au_id
Order by TOTAL desc;

