/*
	2.Revise the ice cream survey crosstab in Listing 12-11 to flip the table. 
	In other words, make flavor the rows and office the columns.
	Which elements of the query do you need to change? Are the counts different?
*/

SELECT *
	 FROM crosstab('SELECT  flavor,
				   			office,
                         count(*)
                  FROM ice_cream_survey
                  GROUP BY flavor, office
                  ORDER BY flavor',

              	 'SELECT office
                  FROM ice_cream_survey
                  GROUP BY office
                  ORDER BY office')

	AS (flavor varchar(20),
      Downtown bigint,
      Midtown bigint,
      Uptown bigint);



