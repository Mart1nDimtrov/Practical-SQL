/*
	3.Imagine you’re importing a file that contains a column with these values:
	17519.668
	20084.461
	18976.335
	Will a column in your target table with data type numeric(3,8) work for these values? Why or why not?
*/

-- numeric(3,8) displays an error because we specify a length of 3, and 8 digits after the decimal point
CREATE TEMPORARY TABLE figures (
	figure numeric(8,3) NULL -- fix (3,8) to (8,3)
)

COPY figures(figure)
FROM 'C:\yourlocation\numbers.txt'
WITH (FORMAT CSV);

SELECT * FROM figures;

