########################################
# Challenge 1 - Most Profiting Authors #
########################################

# Step 1: Calculate the royalty of each sale for each author and the advance for each author and publication
SELECT t.title_id,
	t2.au_id,
	(t.advance * t2.royaltyper / 100) AS advance,
	(t.price * s.qty * (t.royalty / 100) * t2.royaltyper / 100) AS sales_royalty
FROM titles t JOIN titleauthor t2 ON t.title_id = t2.title_id 
JOIN sales s ON s.title_id = t.title_id 


# Step 2: Aggregate the total royalties for each title and author
WITH royalty_and_advance AS (
SELECT t.title_id,
	t2.au_id,
	(t.advance * t2.royaltyper / 100) AS advance,
	(t.price * s.qty * (t.royalty / 100) * t2.royaltyper / 100) AS sales_royalty
FROM titles t JOIN titleauthor t2 ON t.title_id = t2.title_id 
JOIN sales s ON s.title_id = t.title_id 
)
SELECT title_id,
	au_id,
	advance,
	SUM(sales_royalty) as total_royalty
FROM royalty_and_advance
GROUP BY title_id, au_id


# Step 3: Calculate the total profits of each author
WITH royalty_and_advance AS (
SELECT t.title_id,
	t2.au_id,
	(t.advance * t2.royaltyper / 100) AS advance,
	(t.price * s.qty * (t.royalty / 100) * t2.royaltyper / 100) AS sales_royalty
FROM titles t JOIN titleauthor t2 ON t.title_id = t2.title_id
JOIN sales s ON s.title_id = t.title_id
),
total_royalty AS (
SELECT title_id,
	au_id,
	advance,
	SUM(sales_royalty) as total_royalty
FROM royalty_and_advance
GROUP BY title_id, au_id
)
SELECT au_id,
	SUM(advance + total_royalty) AS total_profits_per_author
FROM total_royalty
GROUP BY au_id
ORDER BY total_profits_per_author DESC
LIMIT 3


######################################
# Challenge 2 - Alternative Solution #
######################################
CREATE TEMPORARY TABLE temp_calc_advance_and_royalties AS ( 
SELECT t.title_id,
        t2.au_id,
        (t.advance * t2.royaltyper / 100) AS advance,
        (t.price * s.qty * (t.royalty / 100) * t2.royaltyper / 100) AS sales_royalty
FROM titles t JOIN titleauthor t2 ON t.title_id = t2.title_id
JOIN sales s ON s.title_id = t.title_id
)

CREATE TEMPORARY TABLE temp_calc_total_royalty_per_author AS ( 
SELECT title_id,
        au_id,
        advance,
        SUM(sales_royalty) as total_royalty
FROM temp_calc_advance_and_royalties
GROUP BY title_id, au_id, advance
)

SELECT au_id,
        SUM(advance + total_royalty) AS total_profits_per_author
FROM temp_calc_total_royalty_per_author
GROUP BY au_id
ORDER BY total_profits_per_author DESC
LIMIT 3


###############
# Challenge 3 #
###############
CREATE TABLE most_profiting_authors AS (
SELECT au_id,
        SUM(advance + total_royalty) AS profits
FROM temp_calc_total_royalty_per_author
GROUP BY au_id
)

