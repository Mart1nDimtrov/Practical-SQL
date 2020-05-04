/*
	2.Using the 2010 Census county data, 
	find out which New York state county has the highest percentage
	of the population that identified as “American Indian/Alaska Native Alone.”
	What can you learn about that county from online research that explains the relatively
	large proportion of American Indian population compared with other New York counties?
*/

SELECT geo_name,
       state_us_abbreviation AS "st",
       (CAST (p0010005 AS numeric(8,1)) / p0010001) * 100 AS "pct_indian"
FROM us_counties_2010
WHERE state_us_abbreviation = 'NY'
ORDER BY "pct_indian" DESC;