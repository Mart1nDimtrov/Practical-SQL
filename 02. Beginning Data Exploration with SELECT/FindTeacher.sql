/*
2.Write a query that finds the one teacher whose first name starts with the letter S and who earns more than $40,000.
*/

SELECT * FROM public.teachers
WHERE first_name LIKE 'S%' AND salary > 40000;