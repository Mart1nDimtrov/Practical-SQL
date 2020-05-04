/*
	1.In Listing 10-2, the correlation coefficient, or r value,
	of the variables pct_bachelors_higher and median_hh_income was about .68.
	Write a query using the same data set to show the correlation between pct_masters_higher and median_hh_income.
	Is the r value higher or lower? What might explain the difference?
*/

SELECT corr(median_hh_income, pct_masters_higher)
    AS masters_income_r
FROM acs_2011_2015_stats;

-- check what percentage is affected by the master's degree
SELECT round(
        regr_r2(median_hh_income, pct_masters_higher)::numeric, 3
        ) AS r_squared
FROM acs_2011_2015_stats;

SELECT SUM(pct_bachelors_higher), SUM(pct_masters_higher) FROM acs_2011_2015_stats;

