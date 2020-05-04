/*
3.Rank teachers hired since January 1, 2010, ordered by highest paid to lowest.
*/

SELECT * FROM public.teachers
WHERE hire_date >= '2010-01-01'
ORDER BY salary desc;