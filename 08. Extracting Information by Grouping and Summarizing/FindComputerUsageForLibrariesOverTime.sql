/*
	1.We saw that library visits have declined recently in most places.
	But what is the pattern in the use of technology in libraries? 
	Both the 2014 and 2009 library survey tables contain the columns 
	gpterms (the number of internet-connected computers used by the public)
	and pitusr (uses of public internet computers per year). 
	Modify the code in Listing 8-13 to calculate the percent change 
	in the sum of each column over time. Watch out for negative values!
*/

SELECT pls14.stabr,
         sum(pls14.pitusr) AS pitusr_2014,
         sum(pls09.pitusr) AS pitusr_2009,
 		 sum(pls14.gpterms) AS gpterms_2014,
         sum(pls09.gpterms) AS gpterms_2009,
         round( (CAST(sum(pls14.pitusr) AS decimal(10,1)) - sum(pls09.pitusr)) /
                      sum(pls09.pitusr) * 100, 2 ) AS pct_change_pitusr,
		 round( (CAST(sum(pls14.gpterms) AS decimal(10,1)) - sum(pls09.gpterms)) /
                      sum(pls09.gpterms) * 100, 2 ) AS pct_change_gpterms
  FROM pls_fy2014_pupld14a pls14 JOIN pls_fy2009_pupld09a pls09
  ON pls14.fscskey = pls09.fscskey
  WHERE pls14.pitusr >= 0 AND pls09.pitusr >= 0 AND
		pls14.gpterms >= 0 AND pls09.gpterms >= 0
  GROUP BY pls14.stabr
  ORDER BY pct_change_pitusr DESC, pct_change_gpterms DESC;