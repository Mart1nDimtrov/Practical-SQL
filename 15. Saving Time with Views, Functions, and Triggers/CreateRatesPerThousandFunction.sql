/*
2.In Chapter 10, you learned how to calculate rates per thousand. 
Turn that formula into a rates_per_thousand() function that takes
three arguments to calculate the result:
observed_number, base_number, and decimal_places.
*/

CREATE OR REPLACE FUNCTION
rates_per_thousand(observed_number numeric,
						 base_number numeric,
						 decimal_places int DEFAULT 1)
RETURNS numeric AS
'SELECT
    round(
       (observed_number / base_number) * 1000, decimal_places
        );'
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

-- test the function with crime rates
SELECT
    city,
    st,
    population,
    property_crime,
	round(
       (property_crime::numeric / population) * 1000, 1
        ) AS pc_per_1000,
    rates_per_thousand(property_crime::numeric, population)
         AS pc_per_1000_func
FROM fbi_crime_data_2015
WHERE population >= 500000
ORDER BY pc_per_1000_func DESC;
