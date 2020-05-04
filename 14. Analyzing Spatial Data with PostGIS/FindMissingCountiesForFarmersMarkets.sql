/*
3.More than 500 rows in the farmers_markets table are missing
a value in the county column, which is an example of dirty government data.
Using the us_counties_2010_shp table and the ST_Intersects() function,
perform a spatial join to find the missing county names based on the 
longitude and latitude of each market. Because geog_point in farmers_markets 
is of the geography type and its SRID is 4326, 
you’ll need to cast geom in the census table 
to the geography type and change its SRID using ST_SetSRID().
*/

SELECT fm.*,usc.namelsad10 FROM public.farmers_markets AS fm INNER JOIN
			  public.us_counties_2010_shp AS usc ON
			  ST_Intersects(ST_SetSRID(usc.geom::geography,4326), fm.geog_point)
WHERE county IS NULL;
