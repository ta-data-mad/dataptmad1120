#CHALLENGE 1
-- Step 1

SELECT
titles.title_id AS "Title ID",
titleauthor.au_id AS "Author ID",
titles.advance * titleauthor.royaltyper /100 AS "Advance",
titles.price * sales.qty * titles.royalty /100 * titleauthor.royaltyper/100 AS "Royalty"
FROM titles
JOIN sales ON sales.title_id = titles.title_id 
JOIN titleauthor ON titleauthor.title_id = sales.title_id 
ORDER BY titleauthor.title_id;

-- Step 2

SELECT
titles.title_id AS "Title ID",
titleauthor.au_id AS "Author ID",
SUM(titles.price * sales.qty * titles.royalty /100 * titleauthor.royaltyper/100) AS "Royalties"
FROM titles
JOIN sales ON sales.title_id = titles.title_id 
JOIN titleauthor ON titleauthor.title_id = sales.title_id
GROUP BY "Author ID", "Title ID"
ORDER BY titleauthor.title_id;

-- Step 3

SELECT step_2.au_id AS "Author ID",
       ROUND(SUM(step_2.Advance + step_2.Royalties), 2) AS Profits
FROM
  (SELECT step_1.title_id,
          step_1.au_id,
          step_1.Advance,
          SUM(step_1.Royalty) AS Royalties
   FROM
     (SELECT titleauthor.title_id,
             titleauthor.au_id,
             titles.advance * titleauthor.royaltyper / 100 AS Advance,
             titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS Royalty
      FROM titles
      INNER JOIN sales ON sales.title_id = titles.title_id
      INNER JOIN titleauthor ON titleauthor.title_id = sales.title_id) step_1
   GROUP BY step_1.title_id,
            step_1.au_id) step_2
GROUP BY step_2.au_id
ORDER BY Profits DESC
LIMIT 3;


#CHALLENGE 2
---1---
CREATE TABLE IF NOT EXISTS temp_table AS
SELECT step_1.title_id,
          step_1.au_id,
          step_1.Advance,
          SUM(step_1.Royalty) AS Royalties
   FROM
     (SELECT titleauthor.title_id,
             titleauthor.au_id,
             titles.advance * titleauthor.royaltyper / 100 AS Advance,
             titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS Royalty
      FROM titles
      INNER JOIN sales ON sales.title_id = titles.title_id
      INNER JOIN titleauthor ON titleauthor.title_id = sales.title_id) step_1
   GROUP BY step_1.title_id,
            step_1.au_id
---2---            
SELECT temp_table.au_id AS "Author ID",
ROUND(SUM(temp_table.Advance + temp_table.Royalties),2) AS Profits
FROM temp_table
GROUP BY "Author ID"
ORDER BY Profits DESC
LIMIT 3;

#CHALLENGE 3

---1---
CREATE TEMPORARY TABLE IF NOT EXISTS temp_table2 AS
SELECT temp_table.au_id AS "Author ID",
ROUND(SUM(temp_table.Advance + temp_table.Royalties),2) AS Profits
FROM temp_table
GROUP BY "Author ID"
ORDER BY Profits DESC
LIMIT 3;
---2---
CREATE TABLE IF NOT EXISTS most_profiting_authors AS
SELECT "Author ID",
Profits
FROM temp_table2;


