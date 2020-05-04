/*
	1.The table us_counties_2010 contains 3,143 rows, and us_counties_2000 has 3,141. 
	That reflects the ongoing adjustments to county-level geographies that typically
	 result from government decision making. Using appropriate joins and the NULL value,
	 identify which counties don’t exist in both tables. 
	For fun, search online to find out why they’re missing.
*/

SELECT c2000.geo_name AS geo_name_2000,
         c2000.state_us_abbreviation AS state_2000,
		 c2010.geo_name AS geo_name_2010,
         c2010.state_us_abbreviation AS state_2010
  FROM us_counties_2010 c2010 FULL OUTER JOIN us_counties_2000 c2000
  ON c2010.state_fips = c2000.state_fips
     AND c2010.county_fips = c2000.county_fips
  WHERE c2010.county_fips IS NULL OR c2000.county_fips IS NULL;
