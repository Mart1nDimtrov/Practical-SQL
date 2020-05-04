/*
	3.Was the 2010 median county population higher in California or New York?
*/

SELECT  state_us_abbreviation,
		percentile_cont(.5)
        WITHIN GROUP (ORDER BY p0010001)
FROM us_counties_2010
WHERE state_us_abbreviation IN('CA','NY')
GROUP BY state_us_abbreviation;

-- taken from GitHub to check
SELECT
  percentile_cont(.5)
  WITHIN GROUP (ORDER BY (
    SELECT
      p0010001
    WHERE state_us_abbreviation = 'CA'
  )) AS "CA State Median",
  percentile_cont(.5)
  WITHIN GROUP (ORDER BY (
    SELECT p0010001
    WHERE state_us_abbreviation = 'NY'
  )) AS "NY State Median"
FROM us_counties_2010;
