-- CHALLENGE 1 --
-- Step 1 --
SELECT titleauthor.title_id AS 'Title ID',
       titleauthor.au_id AS 'Author ID',
       titles.advance * titleauthor.royaltyper / 100 AS 'Advance',
       titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS 'Royalty'
FROM titles
INNER JOIN sales ON sales.title_id = titles.title_id
INNER JOIN titleauthor ON titleauthor.title_id = sales.title_id
ORDER BY titleauthor.title_id;
-- Step 2 --
SELECT step_1.title_id AS 'Title ID',
       step_1.au_id AS 'Author ID',
       --step_1.Advance,
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
ORDER BY step_1.title_id;
-- Step 3 --
SELECT step_2.au_id AS 'Author ID',
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

-- Challenge 2
-- Step 1 --

CREATE TEMP TABLE temporary_table AS 
SELECT
titleauthor.title_id AS 'Title ID',
titleauthor.au_id AS 'Author ID',
titles.advance * titleauthor.royaltyper / 100 AS 'Advance',
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS 'Royalty'
FROM titles
INNER JOIN sales ON sales.title_id = titles.title_id
INNER JOIN titleauthor ON titleauthor.title_id = sales.title_id
ORDER BY titleauthor.title_id;

-- Step 2 --

SELECT "Title ID" AS 'Title ID',
       "Author ID" AS 'Author ID',
       "Advance",
       SUM("Royalty") AS 'Royalties'
FROM temporary_table
GROUP BY "Title ID",
         "Author ID"
ORDER BY "Title ID"


-- Step 3 --

SELECT "Author ID" AS 'Author ID',
ROUND(SUM("Advance" + "Royalties"), 2) AS 'Profits'
FROM temporary_table
GROUP BY "Author ID"
ORDER BY "Profits" DESC
LIMIT 3;
