/*
1.Your company delivers fruit and vegetables to local grocery stores, 
and you need to track the mileage driven by each driver each day to a tenth of a mile. 
Assuming no driver would ever travel more than 999 miles in a day,
what would be an appropriate data type for the mileage column in your table? 
Why?
2.In the table listing each driver in your company, 
what are appropriate data types for the drivers’ first and last names? 
Why is it a good idea to separate first and last names into two columns rather than having one larger name column?
*/

CREATE TABLE Drivers (
	id serial UNIQUE,
	first_name text NULL,
	last_name text NULL
);

CREATE TABLE DriverMiles (
	driver_id INTEGER,
	mileage numeric(5,2) NOT NULL,
	FOREIGN KEY (driver_id) REFERENCES Drivers (id)
);

ALTER TABLE public.DriverMiles 
ADD drive_date text;

INSERT INTO public.Drivers(first_name,last_name)
VALUES ('Hey','Hey');

-- check for a valid mileage insert
INSERT INTO public.DriverMiles(driver_id,mileage,drive_date)
VALUES (1,999.99,'2010-10-10');

-- check for an invalid mileage insert
INSERT INTO public.DriverMiles(driver_id,mileage,drive_date)
VALUES (1,999.99,'2010-10-10');

SELECT * FROM public.DriverMiles;

