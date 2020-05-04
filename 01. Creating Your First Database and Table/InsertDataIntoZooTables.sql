/*
2.Now create INSERT statements to load sample data into the tables. 
How can you view the data via the pgAdmin tool? Create an additional INSERT statement for one of your tables.
Purposely omit one of the required commas separating the entries in the VALUES clause of the query. What is the error message? 
Would it help you find the error in the code?
*/

INSERT INTO public.AnimalKinds (AnimalKindName)
VALUES ('Mammal'),
	   ('Reptile'),
	   ('Bird');

INSERT INTO public.AnimalSpecifics (AnimalKindID,IsVertebrate,IsEndotherm)
VALUES (1, CAST(1 AS BIT), CAST(1 AS BIT)),
	   (2, CAST(1 AS BIT), CAST(0 AS BIT)),
	   (3, CAST(1 AS BIT), CAST(1 AS BIT));