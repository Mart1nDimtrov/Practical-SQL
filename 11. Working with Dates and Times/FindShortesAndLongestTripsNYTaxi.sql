/*
	1.Using the New York City taxi data, calculate the 
	length of each ride using the pickup and drop-off timestamps.
	Sort the query results from the longest ride to the shortest. 
	Do you notice anything about the longest or shortest trips 
	that you might want to ask city officials about?
*/

SELECT tpep_dropoff_datetime,
	   tpep_pickup_datetime,
	   tpep_dropoff_datetime - tpep_pickup_datetime as trip_duration
FROM nyc_yellow_taxi_trips_2016_06_01
ORDER BY trip_duration DESC;

-- some of the pickups are after the dropoffs
-- some of the dropoffs are a day after the pickup ?







