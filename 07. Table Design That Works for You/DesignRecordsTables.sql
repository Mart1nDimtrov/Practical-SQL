/*
	Are you ready to test yourself on the concepts covered in this chapter? Consider the following two tables from a database you’re making to keep track of your vinyl LP collection. Start by reviewing these CREATE TABLE statements:
	CREATE TABLE albums (
		album_id bigserial,
		album_catalog_code varchar(100),
		album_title text,
		album_artist text,
		album_release_date date,
		album_genre varchar(40),
		album_description text
	);

	CREATE TABLE songs (
		song_id bigserial,
		song_title text,
		song_artist text,
		album_id bigint
	);
	The albums table includes information specific to the overall collection of songs on the disc. The songs table catalogs each track on the album. Each song has a title and its own artist column, because each song might feature its own collection of artists.
	Use the tables to answer these questions:
	1.Modify these CREATE TABLE statements to include primary and foreign keys plus additional constraints on both tables. Explain why you made your choices.
	2.Instead of using album_id as a surrogate key for your primary key, are there any columns in albums that could be useful as a natural key? What would you have to know to decide?
    3.To speed up queries, which columns are good candidates for indexes?
*/

	CREATE TABLE albums (
		album_id bigserial PRIMARY KEY,
		album_catalog_code varchar(100) NOT NULL, -- use this as a natural key only for the same distributor
		album_title text NOT NULL, -- no empty name\title
		album_artist text NOT NULL,
		album_release_date date,
		album_genre varchar(40),
		album_description text
	);

	CREATE TABLE songs (
		song_id bigserial PRIMARY KEY,
		song_title text NOT NULL, -- no empty name\title
		song_artist text NOT NULL,
		album_id bigint REFERENCES albums (album_id)
	);