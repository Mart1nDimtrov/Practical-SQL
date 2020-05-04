/*
	3.As a bonus challenge, revisit the libraries data in the table
	pls_fy2014_pupld14a in Chapter 8. Rank library agencies based on the rate of visits per 1,000 
	population (column popu_lsa), and limit the query to agencies serving 250,000 people or more.
*/

-- check data
SELECT * FROM pls_fy2014_pupld14a pls14 
WHERE popu_lsa IS NULL OR popu_lsa < 0;

SELECT stabr,
	   libname,
	   round(((visits / popu_lsa) * 1000), 1) as rate_visits_1000
FROM pls_fy2014_pupld14a pls14
WHERE popu_lsa >= 250000 AND visits >= 0 AND popu_lsa >= 0
ORDER BY ((visits / popu_lsa) * 1000) DESC;


