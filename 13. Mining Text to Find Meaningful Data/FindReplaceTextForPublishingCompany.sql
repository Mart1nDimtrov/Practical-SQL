/*
	1.The style guide of a publishing company you’re writing for
	wants you to avoid commas before suffixes in names. 
	But there are several names like Alvarez, Jr. and Williams, 
	Sr. in your database. Which functions can you use to remove the comma?
	Would a regular expression function help?
	How would you capture just the suffixes to place them into a separate column?
*/

SELECT regexp_replace(
'But there are several names like Alvarez, Jr. and Williams, Sr. in your database. ', 
'([A-z]+),( [A-z]+.)', '\1\2', 'g');

SELECT 
substring('But there are several names like Alvarez, Jr. and Williams, Sr. in your database. '
		  from ',( [A-z]+.)');
		  
SELECT regexp_matches('But there are several names like Alvarez, Jr. and Williams, Sr. in your database. ',
',( [A-z]+.)','g');
		  
		  
		  
		  
		  








