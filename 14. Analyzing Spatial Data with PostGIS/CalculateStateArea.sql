/*
	1.Earlier, you found which U.S. county has the largest area.
	Now, aggregate the county data to find the area of each state in square miles.
	(Use the statefp10 column in the us_counties_2010_shp table.)
	How many states are bigger than the Yukon-Koyukuk area?
*/

SELECT 
       statefp10 AS st,
       SUM(round(
             ( ST_Area(geom::geography) / 2589988.110336 )::numeric, 2
            ))  AS square_miles
FROM us_counties_2010_shp
GROUP BY statefp10
ORDER BY square_miles DESC
LIMIT 5;