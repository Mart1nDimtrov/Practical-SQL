/*
	3.Which county had the greatest percentage loss of population between 2000 and 2010? 
	Do you have any idea why? (Hint: A major weather event happened in 2005.)
*/

SELECT  c2010.geo_name,
 		c2010.state_us_abbreviation,
		round( (CAST(c2010.p0010001 AS numeric(8,1)) - c2000.p0010001)
             / c2000.p0010001 * 100, 1 ) AS pct_change
    FROM us_counties_2010 c2010 INNER JOIN us_counties_2000 c2000
    ON c2010.state_fips = c2000.state_fips
    AND c2010.county_fips = c2000.county_fips
    AND c2010.p0010001 <> c2000.p0010001
	ORDER BY pct_change ASC
	LIMIT 1;
