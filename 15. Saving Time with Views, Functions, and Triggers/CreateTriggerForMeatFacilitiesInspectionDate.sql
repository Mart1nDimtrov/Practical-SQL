/*
	3.In Chapter 9, you worked with the meat_poultry_egg_inspect 
	table that listed food processing facilities.
	Write a trigger that automatically adds an 
	inspection date each time you insert a new facility into the table. 
	Use the inspection_date column added in Listing 9-19 on page 146,
	and set the date to be six months from the current date. 
	You should be able to describe the steps needed 
	to implement a trigger and how the steps relate to each other.
*/

CREATE OR REPLACE FUNCTION add_inspection_date()
    RETURNS trigger AS
$$
BEGIN
	NEW.inspection_date := (now() + '6 months'::interval);
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER facility_insert
    BEFORE INSERT
    ON meat_poultry_egg_inspect
    FOR EACH ROW
    EXECUTE PROCEDURE add_inspection_date();

-- insert duplicates; bad practice but just for the example
INSERT INTO meat_poultry_egg_inspect 
SELECT * FROM meat_poultry_egg_inspect
WHERE est_number = 'M8765+P8765';

-- check if the trigger works
SELECT * FROM meat_poultry_egg_inspect
WHERE est_number = 'M8765+P8765';


