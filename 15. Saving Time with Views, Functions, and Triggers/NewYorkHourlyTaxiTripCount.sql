/*
	1.Create a view that displays the number of
	New York City taxi trips per hour. 
	Use the taxi data in Chapter 11 and 
	the query in Listing 11-8 on page 182.
*/

CREATE OR REPLACE VIEW taxi_trips_per_hour_count AS
SELECT
    date_part('hour', tpep_pickup_datetime) AS trip_hour,
    count(*)
FROM nyc_yellow_taxi_trips_2016_06_01
GROUP BY trip_hour
ORDER BY trip_hour;

SELECT * FROM taxi_trips_per_hour_count;


