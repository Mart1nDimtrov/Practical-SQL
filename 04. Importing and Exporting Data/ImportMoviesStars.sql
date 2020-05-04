/*
	1.Write a WITH statement to include with COPY to handle the import of an imaginary text file whose first couple of rows look like this:
	id:movie:actor
	50:#Mission: Impossible#:Tom Cruise
*/

CREATE TEMPORARY TABLE  movies_stars (
	id int null,
	movie_name varchar(90),
	star_name varchar(50)
);

COPY movies_stars (id,movie_name,star_name)
FROM 'C:\yourdirectory\movies.txt'
WITH (FORMAT CSV, HEADER, DELIMITER ':', QUOTE '#');

SELECT * FROM movies_stars;

