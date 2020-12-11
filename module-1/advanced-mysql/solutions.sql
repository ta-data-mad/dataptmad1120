CHALLENGE 1

Step 1:

SELECT 
titleauthor.title_id as title_id,
titleauthor.au_id as au_id,
titles.advance * titleauthor.royaltyper / 100 as advance,
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as sales_royalty
from titleauthor
join titles
on titles.title_id = titleauthor.title_id
join sales 
on sales.title_id = titles.title_id;


Step 2:

With step_1 as (
SELECT 
titleauthor.title_id as title_id,
titleauthor.au_id as au_id,
titles.advance * titleauthor.royaltyper / 100 as advance,
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as sales_royalty
from titleauthor
join titles
on titles.title_id = titleauthor.title_id
join sales 
on sales.title_id = titles.title_id
)
SELECT step_1.title_id,
step_1.au_id,
sum(step_1.advance) as total_advance,
sum(step_1.sales_royalty) as total_sales_royalty
from step_1
group by step_1.title_id, step_1.au_id;


Step 3:

With step_1 as (
	SELECT 
	titleauthor.title_id as title_id,
	titleauthor.au_id as au_id,
	titles.advance * titleauthor.royaltyper / 100 as advance,
	titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as sales_royalty
	from titleauthor
	join titles
	on titles.title_id = titleauthor.title_id
	join sales 
	on sales.title_id = titles.title_id),
step_2 as (
	SELECT step_1.title_id,
	step_1.au_id as au_id,
	step_1.advance as total_advance,
	sum(step_1.sales_royalty) as total_sales_royalty
	from step_1
	group by step_1.title_id, step_1.au_id)
Select
step_2.au_id,
(sum(step_2.total_advance)+sum(step_2.total_sales_royalty)) as total_profits
from step_2
group by step_2.au_id
order by total_profits desc
limit 3
;


CHALLENGE 2:

CREATE TEMPORARY TABLE IF NOT EXISTS step_1 AS
SELECT 
titleauthor.title_id as title_id,
titleauthor.au_id as au_id,
titles.advance * titleauthor.royaltyper / 100 as advance,
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as sales_royalty
from titleauthor
join titles
on titles.title_id = titleauthor.title_id
join sales 
on sales.title_id = titles.title_id

CREATE TEMPORARY TABLE IF NOT EXISTS step_2 AS
SELECT step_1.title_id,
step_1.au_id as au_id,
step_1.advance as total_advance,
sum(step_1.sales_royalty) as total_sales_royalty
from step_1
group by step_1.title_id, step_1.au_id

Select
step_2.au_id,
(sum(step_2.total_advance)+sum(step_2.total_sales_royalty)) as total_profits
from step_2
group by step_2.au_id
order by total_profits desc
limit 3;


CHALLENGE 3:

CREATE tABLE author_profits AS
With step_1 as (
SELECT 
titleauthor.title_id as title_id,
titleauthor.au_id as au_id,
titles.advance * titleauthor.royaltyper / 100 as advance,
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as sales_royalty
from titleauthor
join titles
on titles.title_id = titleauthor.title_id
join sales 
on sales.title_id = titles.title_id
),
step_2 as (
SELECT step_1.title_id,
step_1.au_id as au_id,
step_1.advance as total_advance,
sum(step_1.sales_royalty) as total_sales_royalty
from step_1
group by step_1.title_id, step_1.au_id
)
Select
step_2.au_id,
(sum(step_2.total_advance)+sum(step_2.total_sales_royalty)) as profits
from step_2
group by step_2.au_id
order by total_profits desc;

