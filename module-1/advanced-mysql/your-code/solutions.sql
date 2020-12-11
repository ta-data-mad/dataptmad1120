#Challenge 1

#Step1

SELECT
titles.title_id  as "Title ID",
titles.title as "Title",
titleauthor.au_id as "Author ID",
titles.advance * titleauthor.royaltyper / 100 as "Advance",
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as  "Royalty"
FROM titles
JOIN titleauthor
ON titles.title_id = titleauthor.title_id
JOIN sales
ON titleauthor.title_id = sales.title_id;

#Step2

