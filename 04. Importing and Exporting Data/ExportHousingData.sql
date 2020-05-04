/*
	2.Using the table us_counties_2010 you created and filled in this chapter, 
	export to a CSV file the 20 counties in the United States that have the most housing units.
	Make sure you export only each county’s name, state, and number of housing units. 
	(Hint: Housing units are totaled for each county in the column housing_unit_count_100_percent.)
*/

COPY (
    SELECT geo_name, state_us_abbreviation, housing_unit_count_100_percent 
    FROM us_counties_2010
    ORDER BY housing_unit_count_100_percent DESC
	LIMIT 20 
     )
TO 'C:\yourdirectory\us_countries.txt'
WITH (FORMAT CSV, HEADER, DELIMITER '|');