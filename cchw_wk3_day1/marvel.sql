DROP TABLE movies;
DROP TABLE people;

CREATE TABLE movies (
	id SERIAL8 PRIMARY KEY,
	title VARCHAR(255),
	year INT2,
	show_time VARCHAR(255)
);

CREATE TABLE people (
	id SERIAL8 PRIMARY KEY,
	name VARCHAR(255)
);

INSERT INTO people (name) VALUES ('Stuart Black');
INSERT INTO people (name) VALUES ('Euan Cunningham');
INSERT INTO people (name) VALUES ('Mark Ditzel');
INSERT INTO people (name) VALUES ('Tahnee Downie');
INSERT INTO people (name) VALUES ('Molly Drumm');
INSERT INTO people (name) VALUES ('Robbie Dumbrell');
INSERT INTO people (name) VALUES ('Beata Ficek');
INSERT INTO people (name) VALUES ('Joanna Gora');
INSERT INTO people (name) VALUES ('Patrycja Graczyk');
INSERT INTO people (name) VALUES ('Vicky Jackson-Five');
INSERT INTO people (name) VALUES ('Marcin Jerwan');
INSERT INTO people (name) VALUES ('Garry McCrum');
INSERT INTO people (name) VALUES ('Gemma Percival');
INSERT INTO people (name) VALUES ('Digory Philbrow');
INSERT INTO people (name) VALUES ('Ricardo Ruiz');
INSERT INTO people (name) VALUES ('Kirstin Ryan');
INSERT INTO people (name) VALUES ('Mike Thorpe');
INSERT INTO people (name) VALUES ('Raphael Ugha');
INSERT INTO people (name) VALUES ('Emil Vaklinov');
INSERT INTO people (name) VALUES ('Donald Trump');

INSERT INTO movies (title, year, show_time) VALUES ('Iron Man', 2008, '18:45');
INSERT INTO movies (title, year, show_time) VALUES ('The Incredible Hulk', 2008, '13:35');
INSERT INTO movies (title, year, show_time) VALUES ('Iron Man 2', 2010, '16:55');
INSERT INTO movies (title, year, show_time) VALUES ('Thor', 2011, '15:05');
INSERT INTO movies (title, year, show_time) VALUES ('Captain America: The First Avenger', 2011, '20:05');
INSERT INTO movies (title, year, show_time) VALUES ('Avengers Assemble', 2012, '12:55');
INSERT INTO movies (title, year, show_time) VALUES ('Iron Man 3', 2013, '21:55');
INSERT INTO movies (title, year, show_time) VALUES ('Thor: The Dark World', 2013, '12:45');
INSERT INTO movies (title, year, show_time) VALUES ('Batman Begins', 2005, '12:30');
INSERT INTO movies (title, year, show_time) VALUES ('Captain America: The Winter Soldier', 2014, '15:40');
INSERT INTO movies (title, year, show_time) VALUES ('Guardians of the Galaxy', 2014, '22:20');
INSERT INTO movies (title, year, show_time) VALUES ('Avengers: Age of Ultron', 2015, '21:55');
INSERT INTO movies (title, year, show_time) VALUES ('Ant-Man', 2015, '21:20');
INSERT INTO movies (title, year, show_time) VALUES ('Captain America: Civil War', 2016, '16:15');
INSERT INTO movies (title, year, show_time) VALUES ('Doctor Strange', 2016, '23:50');
INSERT INTO movies (title, year, show_time) VALUES ('Guardians of the Galaxy 2', 2017, '13:05');
INSERT INTO movies (title, year, show_time) VALUES ('Spider-Man: Homecoming', 2017, '20:45');
INSERT INTO movies (title, year, show_time) VALUES ('Thor: Ragnarok', 2017, '15:20');
INSERT INTO movies (title, year, show_time) VALUES ('Black Panther', 2018, '12:45');

-- Return ALL the data in the 'movies' table.
SELECT * FROM movies;

-- Return ONLY the name column from the 'people' table
SELECT name FROM people;

-- Oops! Someone at CodeClan spelled Vicky's name wrong! Change it to reflect the proper spelling ('Vicky Jackson-Five' should be 'Vicky Jackson').
UPDATE people SET name = 'Vicky Jackson' WHERE name = 'Vicky Jackson-Five';

-- Return ONLY your name from the 'people' table.
SELECT name FROM people WHERE name = 'Mike Thorpe';

-- The cinema is showing 'Batman Begins', but Batman is DC, not Marvel! Delete the entry from the 'movies' table.
DELETE FROM movies WHERE movies.title='Batman Begins';

-- Create a new entry in the 'people' table with the name of one of the instructors.
INSERT INTO people (name) VALUES ('Alex Bazlington');

-- Donald Trump has decided to hijack our movie evening, Remove him from the table of people.
DELETE FROM people WHERE people.name='Donald Trump';

-- The cinema has just heard that they will be holding an exclusive midnight showing of 'Avengers: Infinity War'!! Create a new entry in the 'movies' table to reflect this.
INSERT INTO movies (title, year, show_time) VALUES ('Avengers: Infinity War', 2018, '16:25');

-- The cinema would also like to make the Guardians movies a back to back feature. Find out the show time of "Guardians of the Galaxy" and set the show time of "Guardians of the Galaxy 2" to start two hours later.
SELECT show_time FROM movies WHERE movies.title = 'Guardians of the Galaxy';
UPDATE movies SET show_time = '00:20' WHERE movies.title = 'Guardians of the Galaxy 2';

-- Research how to delete multiple entries from your table in a single command.
DELETE FROM movies WHERE movies.id > 5

--IN, BETWEEN, LIKE '%some-text%' - statements used to match entries
