/*
	2.In the FBI crime data, which cities with a population of 500,000 
	or more have the highest rates of motor vehicle thefts
	(column motor_vehicle_theft)? Which have the highest violent crime rates (column violent_crime)?
*/

SELECT
    city,
    st,
    population,
    motor_vehicle_theft,
    round(
        (motor_vehicle_theft::numeric / population) * 1000, 1
        ) AS pc_per_1000
FROM fbi_crime_data_2015
WHERE population >= 500000
ORDER BY (motor_vehicle_theft::numeric / population) DESC;

SELECT
    city,
    st,
    population,
    violent_crime,
    round(
        (violent_crime::numeric / population) * 1000, 1
        ) AS pc_per_1000
FROM fbi_crime_data_2015
WHERE population >= 500000
ORDER BY (violent_crime::numeric / population) DESC;

