/*
	2.Both library survey tables contain a column called obereg,
	a two-digit Bureau of Economic Analysis Code that classifies
	each library agency according to a region of the United States,
	such as New England, Rocky Mountains, and so on. Just as we
	calculated the percent change in visits grouped by state,
	do the same to group percent changes in visits by U.S.
	region using obereg. Consult the survey documentation to
	find the meaning of each region code. For a bonus challenge,
	create a table with the obereg code as the primary key and the region name as text, 
	and join it to the summary query to group by the region name rather than the code.
*/

CREATE TABLE economic_regions (
	region_id varchar(2) PRIMARY KEY,
	region_name text NOT NULL
);

-- insert values from document
INSERT INTO economic_regions (region_id,region_name)
VALUES
('01','New England (CT ME MA NH RI VT)'),
('02','Mid East (DE DC MD NJ NY PA)'),
('03','Great Lakes (IL IN MI OH WI)'),
('04','Plains (IA KS MN MO NE ND SD)'),
('05','Southeast (AL AR FL GA KY LA MS NC SC TN VA WV)'),
('06','Soutwest (AZ NM OK TX)'),
('07','Rocky Mountains (CO ID MT UT WY)'),
('08','Far West (AK CA HI NV OR WA)'),
('09','Outlying Areas (AS GU MP PR VI)');

-- check that the insert was successful
SELECT * FROM  economic_regions;

SELECT   pls14.obereg,
		 sr.region_name,
         sum(pls14.visits) AS visits_2014,
         sum(pls09.visits) AS visits_2009,
         round( (CAST(sum(pls14.visits) AS decimal(10,1)) - sum(pls09.visits)) /
                      sum(pls09.visits) * 100, 2 ) AS pct_change
  FROM pls_fy2014_pupld14a pls14 INNER JOIN 
  	   pls_fy2009_pupld09a pls09 ON pls14.fscskey = pls09.fscskey INNER JOIN
	   economic_regions sr ON sr.region_id = pls14.obereg
  WHERE pls14.visits >= 0 AND pls09.visits >= 0
  GROUP BY pls14.obereg,sr.region_name 
  ORDER BY pct_change DESC;

