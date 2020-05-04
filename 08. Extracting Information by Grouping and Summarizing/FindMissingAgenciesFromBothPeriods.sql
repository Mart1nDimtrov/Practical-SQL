/*
	3.Thinking back to the types of joins you learned in Chapter 6, 
	which join type will show you all the rows in both tables, 
	including those without a match?
	Write such a query and add an IS NULL filter in a 
	WHERE clause to show agencies not included in one or the other table.
*/

 SELECT COALESCE(pls14.stabr,pls09.stabr),
		pls09.fscskey,
		pls09.libname,
		pls14.fscskey,
		pls14.libname
 FROM pls_fy2014_pupld14a pls14 FULL OUTER JOIN 
  	   pls_fy2009_pupld09a pls09 ON pls14.fscskey = pls09.fscskey 
 WHERE pls14.fscskey IS NULL OR pls09.fscskey IS NULL;