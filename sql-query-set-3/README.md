SQL questions for pubs sample database:

Use Visual Studio to connect to the pubs database on the CSDB2 server.

Turn in a MS-Word document with your answers in the following format: Beside the question
number, cut and paste the sql query code from VS and immediately below the sql query code cut
and paste the results. Put your name at the top of the document or lose 2 points!

1. List the author’s name and number of titles which each author has produced, in a list which is
alphabetical by the authors names, including those authors who may not have yet produced any
titles.
2. List the state and quantity of books sold by each author in each state, for all those authors who
have sold more than 30 books in a given state, ordered such that all sales from a given state are
listed sequentially but the highest sales per state are listed first.
3. For each author whose last name begins with ‘Green’ list the full name and quantity of books
sold in each state, including in the list any authors who may not yet have sold any books in any
state. List this alphabetically by author, and by state if an author sold in multiple states.
4. List the titles and prices for all books for which there is another book being sold at the same
price. List these in order by the price, from smallest to largest.
5. Find the title of any book that has sold copies in every store.

Note: write your query so that

(a) no work is done prior to the query. i.e. Don’t look up the authors of PC8888 and then run a
query based on the author id. Look up the authors as part of the query.
and

(b) no work is done after the query. i.e. Don’t list all the numbers and expect the reader to add
them up or find the max, etc.
Turn in your MS-Word document, named sqlquery3.docx, using Easel.
