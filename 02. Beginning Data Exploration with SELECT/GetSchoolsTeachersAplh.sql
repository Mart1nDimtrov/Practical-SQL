/*
1.The school district superintendent asks for a list of teachers in each school. 
Write a query that lists the schools in alphabetical order along with teachers ordered by last name A–Z.
*/

SELECT school, first_name || ' ' || last_name as full_name
FROM public.teachers
ORDER BY school ASC, full_name ASC;