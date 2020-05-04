/*
	2.Using ST_Distance(), determine how many miles 
	separate these two farmers’ markets: the Oakleaf
	Greenmarket (9700 Argyle Forest Blvd, Jacksonville, Florida)
	and Columbia Farmers Market (1701 West Ash Street, Columbia, Missouri).
	You’ll need to first find the coordinates
	for both in the farmers_markets table. 
	(Hint: You can also write this query using the Common 
	Table Expression syntax you learned in Chapter 12.)
*/

-- first find the correct markets, then calculate the distance
SELECT  fm1.market_name,
		fm2.market_name,
	    round(
              (ST_Distance(fm1.geog_point,
                           fm2.geog_point
                           ) / 1609.344)::numeric(8,5), 2
              ) AS miles_from_dt
FROM public.farmers_markets as fm1 INNER JOIN
(SELECT * FROM public.farmers_markets) as fm2 ON fm2.fmid = 1000182
WHERE fm1.fmid = 1016856;










