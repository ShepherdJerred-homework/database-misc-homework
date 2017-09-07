SQL questions for pubs sample database

Use Visual Studio to connect to the pubs database on the CSDB2 server.

Turn in a MS-Word document with your answers in the following format: Beside the question
number, cut and paste the sql query code from VS and immediately below the sql query code cut
and paste the results. Put your name at the top of the document or lose 2 points!

1. List the names of the authors of the book with the highest year-to-date sales.
2. What is the total amount advanced to the author(s) of PS2091 (for all their books)? Use the same assumption about advances which was used in the previous homework assignment.
3. List the author name and quantity sold (for all books sold anywhere) for each author who sold books at the Bookbeat store.
4. Do authors sell best at stores in their home state?
 a. List the state and total sales revenue for each state where books sold in that state were written by authors including at least one author from that state. Assume that sales revenue is computed by multiplying the qty in sales by the price in titles.
 b. List the state and total sales for each state where the books sold in that state were written by authors including at least one author from another state. Assume the sales are computed as in 4a.
5. How many employees do each of the publishers employ? Produce a list of the publishers, by name, along with the total number of employees they employ, where this list is ordered with the publishers who have the most employees listed first.

Note: write your query so that

(a) no work is done prior to the query. i.e. Don’t look up the authors of PC8888 and then run a
query based on the author id. Look up the authors as part of the query.
and

(b) no work is done after the query. i.e. Don’t list all the numbers and expect the reader to add
them up or find the max, etc.
Turn in your MS-Word document, named sqlquery2.docx, using Easel.
