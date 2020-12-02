CHALLENGE 1:
SELECT authors.au_id as 'AUTHOR ID', 
authors.au_lname as 'LAST NAME', 
authors.au_fname as 'FIRST NAME',
titles.title as 'TITLE',
publishers.pub_name as 'PUBLISHER'
FROM titles
JOIN titleauthor
on titles.title_id = titleauthor.title_id
JOIN authors
on authors.au_id = titleauthor.au_id
JOIN publishers
on titles.pub_id = publishers.pub_id;

CHALLENGE 2
SELECT authors.au_id as 'AUTHOR ID', 
authors.au_lname as 'LAST NAME', 
authors.au_fname as 'FIRST NAME',
titles.title as 'TITLE',
publishers.pub_name as 'PUBLISHER',
count(*) as 'TITLE COUNT'
FROM titles
JOIN titleauthor
on titles.title_id = titleauthor.title_id
JOIN authors
on authors.au_id = titleauthor.au_id
JOIN publishers
on titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, publishers.pub_name;

CHALLENGE 3
SELECT authors.au_id as 'AUTHOR ID', 
authors.au_lname as 'LAST NAME', 
authors.au_fname as 'FIRST NAME',
sales.title_id as 'TITLES',
COUNT(*) as 'TOTAL'
FROM sales
JOIN titleauthor on sales.title_id = titleauthor.title_id
JOIN authors
on authors.au_id = titleauthor.au_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC LIMIT 3;
