"CHALLENGE 1"

SELECT 
authors.au_id as "AUTHOR ID",
authors.au_lname as "LAST NAME",
authors.au_fname as "FIRST NAME",
titles.title as "TITLE",
publishers.pub_name as "PUBLISHER" 
FROM authors
join titleauthor on titleauthor.au_id =authors.au_id
join titles on titles.title_id = titleauthor.title_id
join publishers on publishers.pub_id = titles.pub_id;

"CHALLENGE 2"

SELECT 
authors.au_id as "AUTHOR ID",
authors.au_lname as "LAST NAME",
authors.au_fname as "FIRST NAME",
publishers.pub_name as "PUBLISHER",
COUNT(titles.pub_id) as titles_published 
FROM authors
join titleauthor on titleauthor.au_id =authors.au_id
join titles on titles.title_id = titleauthor.title_id
join publishers on publishers.pub_id = titles.pub_id
group by titles.title
order by titles_published DESC ;

"CHALLENGE 3"

SELECT 
authors.au_id as "AUTHOR ID",
authors.au_lname as "LAST NAME",
authors.au_fname as "FIRST NAME",
sales.title_id as "SALES",
SUM(sales.qty) as title_SALLED 
FROM authors
join titleauthor on titleauthor.au_id =authors.au_id
join titles on titles.title_id = titleauthor.title_id
join sales on sales.title_id = titles.title_id
group by titleauthor.au_id 
order by title_SALLED DESC
LIMIT 3;

"CHALLENGE 4"

SELECT 
authors.au_id  as "AUTHOR ID",
authors.au_lname as "LAST NAME",
authors.au_fname as "FIRST NAME",
IFNULL(sum(sales.qty),0) as "TOTAL"
FROM authors
left join titleauthor on titleauthor.au_id =authors.au_id
left join titles on titles.title_id = titleauthor.title_id
left join sales on sales.title_id = titles.title_id
group by authors.au_id
order by "TOTAL" DESC;
