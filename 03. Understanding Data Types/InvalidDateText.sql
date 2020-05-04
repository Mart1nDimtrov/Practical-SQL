/*
3.Assume you have a text column that includes strings formatted as dates. 
One of the strings is written as '4//2017'.
What will happen when you try to convert that string to the timestamp data type?
*/

-- insert invalid date string
INSERT INTO public.DriverMiles(driver_id,mileage,drive_date)
VALUES (1,777.99,'4//2017');

-- check what happens when we try to convert the string to timestamp format
SELECT CAST(drive_date AS timestamp) FROM DriverMiles 
WHERE drive_date = '4//2017';