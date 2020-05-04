/*
2. Using any one of the State of the Union addresses,
count the number of unique words that are five characters or more. 
(Hint: You can use regexp_split_to_table() in a subquery 
to create a table of words to count.) Bonus: Remove commas and periods at the end of each word.
*/

select count(c.*) from (
select distinct 
lower(regexp_replace(regexp_split_to_table(speech_text, ' '),'(,|\.|\)|\(|'')','')) as word
from president_speeches
where sotu_id = 1) as c
WHERE char_length(c.word) >= 5;