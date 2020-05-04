/*
1.Imagine you’re building a database to catalog all the animals at your local zoo. 
You want one table to track the kinds of animals in the collection and another
table to track the specifics on each animal. Write CREATE TABLE statements for each table that include some of the columns you need. Why did you include the columns you chose?
*/

CREATE TABLE public.AnimalKinds (
	id SERIAL UNIQUE,
	AnimalKindName text
);

CREATE TABLE public.AnimalSpecifics (
	AnimalKindID INTEGER,
	IsVertebrate BIT NULL,
	IsEndotherm BIT NULL,
	FOREIGN KEY (AnimalKindID) REFERENCES AnimalKinds (id)
);






