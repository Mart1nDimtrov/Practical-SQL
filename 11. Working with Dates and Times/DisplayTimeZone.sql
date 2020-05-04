/*
	2.Using the AT TIME ZONE keywords, write a query that displays 
	the date and time for London, Johannesburg, Moscow, and Melbourne 
	the moment January 1, 2100, arrives in New York City.
*/

SELECT * FROM pg_timezone_abbrevs;
-- check specific time zones
SELECT * FROM pg_timezone_names;

SET timezone TO 'US/Eastern';

-- London
SELECT '2100-01-01 00:00 BST'::timestamp with time zone;
-- Melbourne
SELECT '2100-01-01 00:00 AEST'::timestamp with time zone;
-- Johannesburg
SELECT '2100-01-01 00:00 SAST'::timestamp with time zone;
-- Moscow
SELECT '2100-01-01 00:00 MSK'::timestamp with time zone;


















