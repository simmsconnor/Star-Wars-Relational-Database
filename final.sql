# Star-Wars-Relational-Database

-- FINAL PROJECT  CONNOR SIMMS

DROP SCHEMA IF EXISTS "finalProject" CASCADE;
CREATE SCHEMA "finalProject";
SET search_path TO "finalProject";

-- DIRECTORS 5

CREATE TABLE "DIRECTORS" (
	"directorId"		TEXT		 PRIMARY KEY,
    "college"           TEXT         NOT NULL,
    "isMale"            BOOLEAN      NOT NULL,
    "dob"               DATE         NOT NULL,
    "dod"               DATE         NULL
);

INSERT INTO "DIRECTORS"
("directorId", "college", "isMale", "dob", "dod")
VALUES
('George Lucas', 'University of Sourthern California', 't', '1944-05-14', NULL),
('Irvin Kershner', 'University of Southern California', 't', '1923-04-29', '2010-11-27'),
('Richard Marquand', 'King''s', 't', '1937-09-22', '1987-09-4'),
('J.J. Abrams', 'Sarah Lawrence', 't', '1966-06-27', NULL),
('Rian Johnson', 'University of Southern California', 't', '1973-12-17', NULL);


SELECT * FROM "DIRECTORS"
LIMIT 1;

-- FILM_LOCATIONS 26

CREATE TABLE "FILM_LOCATIONS" (
	"name"		    TEXT		 PRIMARY KEY,
	"state"		    TEXT         NULL,
	"country"		TEXT         NOT NULL
);

INSERT INTO "FILM_LOCATIONS"
("name", "state", "country")
VALUES
('Royal Palace of Caserta', NULL, 'Italy'),
('Eyjafjallajokull', NULL, 'Iceland'),
('Mount Etna', NULL, 'Italy'),
('Grindelwald', NULL, 'Switzerland'),
('Finse', NULL, 'Norway'),
('Death Valley', 'CA', 'United States'),
('Rub al Khali Desert', NULL, 'United Arab Emirates'),
('Salar de Uyuni', NULL, 'Bolivia'),
('Pinewood Studios', 'CA', 'United States'),
('Cardington Airship Hangars', NULL, 'England'),
('Wadi Rum', NULL, 'Jordan'),
('Ivinghoe Beacon', NULL, 'England'),
('Fawley Power Station', NULL, 'England'),
('Dubrovnik', NULL, 'Croatia'),
('Clevelys', NULL, 'England'),
('Malin Head', NULL, 'Ireland'),
('Myrdalssandur Beach', NULL, 'Iceland'),
('Forest of Dean', NULL, 'England'),
('Greenham Common', NULL, 'England'),
('Krafla Volcano', NULL, 'Iceland'),
('Skellig Michael', NULL, 'Ireland'),
('Villa del Balbianello', NULL, 'Italy'),
('Hardangerjokulen Glacier', NULL, 'Norway'),
('Mayan ruins', NULL, 'Guatemala'),
('Plaza de Espana', NULL, 'Spain'),
('Laamu Atoll', NULL, 'Maldives');


SELECT * FROM "FILM_LOCATIONS"
LIMIT 1;

-- PLANETS 9

CREATE TABLE "PLANETS" (
	"name"		        TEXT		 PRIMARY KEY,
	"climate"		    TEXT         NOT NULL,
	"terrain"		    TEXT         NOT NULL,
    "population"        INTEGER      NULL,
    "filmedAt"          TEXT         NOT NULL,
    FOREIGN KEY ("filmedAt") REFERENCES "FILM_LOCATIONS"("name")
);


INSERT INTO "PLANETS"
("name", "climate", "terrain", "population", "filmedAt")
VALUES
('Naboo', 'Plesant weather', 'Rolling Plains', '542685847', 'Royal Palace of Caserta'),
('Kamino', 'Temperate', 'Ocean/Rock', '1000000000', 'Eyjafjallajokull'),
('Mustafar', 'High Temperates', 'Volcanic', '20000', 'Mount Etna'),
('Alderaan', 'Rain/Snow', 'Lush Valleys', '2000000000', 'Grindelwald'),
('Hoth', 'Very Low Temperatures', 'Snow/Ice', NULL, 'Finse'),
('Tatooine', 'Extremely Arid', 'Hot Deserts', '200000', 'Death Valley'),
('Jakku', 'Relatively Cold', 'Scorched Badlands', '52292228', 'Rub al Khali Desert'),
('Crait', 'Temperate', 'Mountains/Canyons', NULL, 'Salar de Uyuni'),
('Exegol', 'Dry Conditions', 'Dark Desert Flats', NULL, 'Pinewood Studios');


SELECT * FROM "PLANETS"
LIMIT 1;

-- TITLES 9

CREATE TABLE "TITLES" (
	"title"		        TEXT		 PRIMARY KEY,
	"director"		    TEXT         NOT NULL,
	"planet"		    TEXT         NOT NULL,
    "releaseYear"       INTEGER      NOT NULL,
    "length"            INTEGER      NOT NULL,
    "episode"           TEXT         NOT NULL,
    "cost"              FLOAT        CHECK ("cost" >= 0) NOT NULL,
    FOREIGN KEY ("director") REFERENCES "DIRECTORS"("directorId"),
    FOREIGN KEY ("planet") REFERENCES "PLANETS"("name")
    
);

INSERT INTO "TITLES"
("title", "director", "planet", "releaseYear", "length", "episode", "cost")
VALUES
('The Phantom Menace', 'George Lucas', 'Naboo', '1999', '131', 'I', '115'),
('Attack of the Clones', 'George Lucas', 'Kamino', '2002', '120', 'II', '653.8'),
('Revenge of the Sith', 'George Lucas','Mustafar', '2005', '140', 'III', '113'),
('A New Hope', 'George Lucas','Alderaan', '1977', '121', 'IV', '11'),
('The Empire Strikes Back', 'Irvin Kershner','Hoth', '1980', '124', 'V', '30.5'),
('Return of the Jedi', 'Richard Marquand', 'Tatooine', '1983', '131', 'VI', '32.5'),
('The Force Awakens', 'J.J. Abrams', 'Jakku', '2015', '138', 'VII', '447'),
('The Last Jedi', 'Rian Johnson', 'Crait', '2017', '152', 'VIII', '300'),
('The Rise of Skywalker', 'J.J. Abrams', 'Exegol', '2019', '142', 'IX', '416');


SELECT * FROM "TITLES"
LIMIT 1;

-- CAST 15

CREATE TABLE "CAST" (
	"role"		    TEXT		 PRIMARY KEY,
	"fn"		    TEXT         NOT NULL,
	"mn"		    TEXT         NULL,
    "ln"            TEXT         NOT NULL,
    "suff"          TEXT         NULL,
    "dob"           DATE         NOT NULL,
    "dod"           DATE         NULL,
    "birthCity"		TEXT		 NOT NULL,
	"birthState"    TEXT         NULL,
	"birthCountry"  TEXT         NOT NULL,
    "isMale"        BOOLEAN      NOT NULL,
    "college"       TEXT         NULL,
    "major"         TEXT         NULL,
    "gradSchool"    BOOLEAN      NULL
    
);


INSERT INTO "CAST"
("role", "fn", "mn", "ln", "suff", "dob", "dod", "birthCity", "birthState", "birthCountry", "isMale", "college", "major", "gradSchool")
VALUES
('Luke Skywalker','Mark', 'Richard', 'Hamill', NULL, '1951-09-25', NULL, 'Oakland', 'CA', 'United States', 't', 'Los Angeles City', 'Theater Arts', 'f'),
('Han Solo', 'Harrison', NULL, 'Ford', NULL, '1942-07-13', NULL, 'Chicago', 'IL', 'United States', 't', 'Ripon', 'Philosophy', 'f'),
('Princess Leia', 'Carrie', 'Frances', 'Fisher', NULL, '1956-10-21', '2016-12-27', 'Burbank', 'CA', 'United States', 'f', 'Sarah Lawrence', NULL, 'f'),
('Obi-Wan Kenobi', 'Alec', NULL, 'Guiness', NULL, '1890-12-08', '2000-08-05', 'Maida Vale', NULL, 'United Kingdom', 't', 'Pembroke Lodge', 'Acting', 'f'),
('Chewbacca', 'Peter', 'William', 'Mayhew', NULL, '1944-05-19', '2019-04-30', 'Barnes', NULL, 'England', 't', NULL, NULL, 'f'),
('R2-D2', 'Kenny', 'George', 'Barker', NULL, '1934-08-24', '2016-08-13', 'Birmingham', NULL, 'England', 't', NULL, NULL, 'f'),
('C-3PO', 'Anthony', NULL, 'Daniels', NULL, '1946-02-21', NULL, 'Salisbury', NULL, 'England', 't', 'Rose Bruford', 'Law', 't'),
('Kylo Ren', 'Adam', 'Douglas', 'Driver', NULL, '1983-11-19', NULL, 'San Diego', 'CA', 'United States', 't', 'University of Indianapolis', 'Drama', 'f'),
('Rey Skywalker', 'Daisey', 'Jazz Isobel', 'Ridley', NULL, '1992-04-10', NULL, 'London', NULL, 'England', 'f', 'Birkbeck', NULL, 'f'),
('Finn', 'John', 'Bamidele', 'Boyega', NULL, '1992-03-17', NULL, 'London', NULL, 'England', 't', 'University of Greenwich', 'Film Studies', 'f'),
('Lando Calrissian', 'William', 'December', 'Williams', 'Jr.', '1937-04-06', NULL, 'New York City', 'NY', 'United States', 't', NULL, NULL, 'f'),
('Padme Amidala', 'Natalie', 'Hershlag', 'Portman', NULL, '1981-06-009', NULL, 'Jerusalem', NULL, 'Israel', 'f', 'Harvard', 'Psychology', 'f'),
('Anakin Skywalker', 'Hayden', NULL, 'Christensen', NULL, '1981-04-19', NULL, 'Vancouver', NULL, 'Canada', 't', NULL, NULL, 'f'),
('Poe Dameron', 'Oscar', 'Isaac', 'Hernandez Estrada', NULL, '1979-03-09', NULL, 'Guatemala City', NULL, 'Guatemala', 't', 'Miami Dada', NULL, 'f'),
('Greedo', 'Paul', NULL, 'Blake', NULL, '1949-10-20', NULL, 'Birmingham', NULL, 'England', 't', NULL, NULL, 'f');


SELECT * FROM "CAST"
LIMIT 1;


-- SPECIES 4

CREATE TABLE "SPECIES" (
	"speciesId"		    TEXT		 PRIMARY KEY,
	"classification"		TEXT         NULL,
    "language"          TEXT         NOT NULL,
    "lifespan"          INTEGER      NULL,
    "homeworld"         TEXT         NULL,
    "description"       TEXT         NOT NULL
);


INSERT INTO "SPECIES"
("speciesId", "classification", "language", "lifespan", "homeworld", "description")
VALUES
('Human', 'Mammal', 'Multi', '77', 'Multi', 'Related to great apes, but are more highly developed'),
('Droid', NULL, 'Binary', NULL, NULL, 'A fictional robot possessing some degree of AI'),
('Rodian', 'reptilian humanoid', 'Rodese', '90', 'Rodia', 'A reptilian species with antennae, green and scaled skin, large round pupil-less eyes, and snouts'),
('Wookie', 'non-sentient', 'Shyriiwook', '400', 'Kashyyyk', 'A tall species of furry humanoids from the panet Kashyyyk, who grow to a height nearly three meters');


SELECT * FROM "SPECIES"
LIMIT 1;

-- VEHICLES 18

CREATE TABLE "VEHICLES" (
	"vehicleId"		    TEXT		 PRIMARY KEY,
	"movie"		        TEXT         NOT NULL,
	"owner"		        TEXT         NOT NULL,
    "capacity"          INTEGER      NOT NULL,
    "weight"            FLOAT        CHECK ("weight" >= 0) NOT NULL,
    "maxSpeed"          FLOAT        CHECK ("maxSpeed" >= 0) NOT NULL,
    "manufacturer"      TEXT         NULL,
    "price"		        FLOAT		 CHECK ("price" >= 0) NOT NULL  
);


INSERT INTO "VEHICLES"
("vehicleId", "movie", "owner", "capacity", "weight", "maxSpeed", "manufacturer", "price")
VALUES
('X-34 Landspeeder', 'A New Hope', 'Luke Skywalker', '2', '130', '250', 'SoroSuub', '10550'),
('Millennium Falcon', 'The Empire Strikes Back', 'Han Solo', '6', '50000', '1050', 'Corellian Engineering', '90000'),
('Tantive IV', 'A New Hope', 'Princess Leia', '600', '2520', '950', 'Corellian Engineering', '12000000'),
('Eta-2', 'Revenge of the Sith', 'Obi-Wan Kenobi', '1', '24000', '1500', 'Kuat Systems Engineering', '290000'),
('Command Shuttle', 'The Force Awakens', 'Kylo Ren', '5', '15000', '116', 'Sienar-Jaemus Fleet Systems', '100000'),
('Rey''s Speeder', 'The Force Awakens', 'Rey Skywalker', '1', '2000', '167', 'Teedo', '4500'),
('Lady Luck', 'The Empire Strikes Back', 'Lando Calrissian', '13', '30000', '820', 'SoroSuub', '50000'),
('Naboo royal cruiser', 'The Phantom Menace', 'Padme Amidala', '16', '32000', '100000', 'Theed Palace Space Vessel Engineering', '80000'),
('Podracer', 'The Phantom Menace', 'Anakin Skywalker', '1', '2500', '588', NULL, '11500'),
('X-wing Fighter', 'The Force Awakens', 'Poe Dameron', '2', '20000', '652', 'Incom Corporation', '150000'),
('9000 Z001 Landspeeder', 'A New Hope', 'Greedo', '2', '130', '300', 'Ubrikkian', '8000'),
('Soulless One', 'Revenge of the Sith', 'General Grevious', '1', '40000', '1100', 'Feethan Ottraw Scalable Assemblies', '890'),
('Slave I', 'The Empire Strikes Back', 'Boba Fett', '6', '80000', '850', 'Kuat Drive Yards', '10500'),
('AT-AT', 'The Empire Strikes Back', 'Watto', '43', '200000', '37', 'All Terrain Armored Transport', '150000'),
('Jedi Starfighter', 'Attack of the Clones', 'Anakin Skywalker', '2', '100000', '590', 'Kuat Systems Engineering', '180000'),
('Snowspeeder', 'Empire Strikes Back', 'Luke Skywalker', '3', '80000', '683.51', 'Flying Incom T-47', '50000'),
('Jawa Sandcrawler', 'A New Hope', 'Jawa', '1500', '6000000', '18.64', 'Corellia Mining Corporation', '50000'),
('TIE Fighter', 'The Empire Strikes Back', 'Darth Vader', '3', '44000', '7456', 'Sienar Fleet Systems', '60000');



SELECT * FROM "VEHICLES"
LIMIT 1;



-- CHARACTERS 15

CREATE TABLE "CHARACTERS" (
	"name"		        TEXT		 PRIMARY KEY,
	"species"		    TEXT         NOT NULL,
	"movie"		        TEXT         NOT NULL,
    "vehicleUsed"       TEXT         NULL,
    "height"            FLOAT        NOT NULL,
    "weight"            FLOAT        CHECK ("weight" >= 0) NOT NULL,
    "gender"            TEXT         NULL,
    FOREIGN KEY ("name") REFERENCES "CAST"("role"),
    FOREIGN KEY ("species") REFERENCES "SPECIES"("speciesId"),
    FOREIGN KEY ("movie") REFERENCES "TITLES"("title"),
    FOREIGN KEY ("vehicleUsed") REFERENCES "VEHICLES"("vehicleId")
);


INSERT INTO "CHARACTERS"
("name", "species", "movie", "vehicleUsed", "height", "weight", "gender")
VALUES
('Luke Skywalker','Human', 'A New Hope', 'X-34 Landspeeder', '5.9', '160.9', 'male'),
('Han Solo', 'Human', 'A New Hope', 'Millennium Falcon', '6.1', '176.37', 'male'),
('Princess Leia', 'Human', 'A New Hope', 'Tantive IV', '5.1', '105', 'female'),
('Obi-Wan Kenobi', 'Human', 'Revenge of the Sith', 'Eta-2', '5.10', '178.57', 'male'),
('Chewbacca', 'Wookie', 'A New Hope', NULL, '7.6', '242.51', 'male'),
('R2-D2', 'Droid', 'The Phantom Menace', NULL, '3.7', '200', 'male'),
('C-3PO', 'Droid', 'The Phantom Menace', NULL, '5.9', '165.35', 'male'),
('Kylo Ren', 'Human', 'The Force Awakens', 'Command Shuttle', '6.3', '196.21', 'male'),
('Rey Skywalker', 'Human', 'The Force Awakens', 'Rey''s Speeder', '5.5', '119', 'female'),
('Finn', 'Human', 'The Force Awakens', NULL, '5.10', '160', 'male'),
('Lando Calrissian', 'Human', 'The Empire Strikes Back', 'Lady Luck', '6', '150', 'male'),
('Padme Amidala', 'Human', 'The Phantom Menace', 'Naboo royal cruiser', '5.3', '99', 'female'),
('Anakin Skywalker', 'Human', 'The Phantom Menace', 'Podracer', '6.1', '185', 'male'),
('Poe Dameron', 'Human', 'The Force Awakens', 'X-wing Fighter', '5.8', '176.37', 'male'),
('Greedo', 'Rodian', 'A New Hope', '9000 Z001 Landspeeder', '6', '163.14', 'male');



SELECT * FROM "CHARACTERS"
LIMIT 1;


-- JOIN QUERIES

-- 1.
-- List all characters played by male actors in A New Hope, as well as their species


CREATE FUNCTION newHope_characters()
RETURNS TABLE(
	"Name"			TEXT,
	"Species"		TEXT
)
LANGUAGE plpgsql
AS $$
	BEGIN
		RETURN QUERY
		SELECT "CHARACTERS"."name", "CHARACTERS"."species"
            FROM "CHARACTERS"
                INNER JOIN "CAST" ON "CHARACTERS"."name" = "CAST"."role"
                WHERE "CHARACTERS"."movie" = 'A New Hope' AND "CAST"."isMale" = 't'
                ORDER BY "CHARACTERS"."name";
	END
$$;

SELECT * FROM newHope_characters();

-- 2.
-- Find the directors who attended USC with the movie details they directed

CREATE FUNCTION usc_directors()
RETURNS TABLE(
	"Title"			TEXT,
	"Director"		TEXT,
	"Planet"		TEXT,
	"Release Year"	INTEGER,
	"Length"	    INTEGER,
	"Episode"	    TEXT,
	"Cost"	        FLOAT
)
LANGUAGE plpgsql
AS $$
	BEGIN
		RETURN QUERY
		SELECT "TITLES".*
            FROM "TITLES"
            INNER JOIN "DIRECTORS" ON "TITLES"."director" = "DIRECTORS"."directorId"
            WHERE "DIRECTORS"."college" = 'University of Southern California'
            ORDER BY "TITLES"."releaseYear";
	END
$$;


SELECT * FROM usc_directors();


-- 3.
-- List all characters and the vehicles they used in The Phantom Menace


CREATE FUNCTION phantom_menaceVehicles()
RETURNS TABLE(
	"Name"			TEXT,
	"Vehicle"		TEXT
)
LANGUAGE plpgsql
AS $$
	BEGIN
		RETURN QUERY
		SELECT "CHARACTERS"."name", "VEHICLES"."vehicleId"
            FROM "CHARACTERS"
            LEFT JOIN "VEHICLES" ON "CHARACTERS"."vehicleUsed" = "VEHICLES"."vehicleId"
            WHERE "CHARACTERS"."movie" = 'The Phantom Menace' AND "VEHICLES"."vehicleId" IS NOT NULL
            ORDER BY "CHARACTERS"."name";
	END
$$;


SELECT * FROM phantom_menaceVehicles();

-- OUTER JOIN QUERIES w/ 3+ TABLES
-- 4. 
-- Find details of characters, species, and associated planets

CREATE FUNCTION char_details()
RETURNS TABLE(
	"Name"			  TEXT,
	"Classification"  TEXT,
	"Planet"          TEXT
)
LANGUAGE plpgsql
AS $$
	BEGIN
		RETURN QUERY
		SELECT "CHARACTERS"."name", "SPECIES"."classification", "PLANETS"."name" AS "planet"
            FROM "CHARACTERS"
                INNER JOIN "SPECIES" ON "CHARACTERS"."species" = "SPECIES"."speciesId"
                LEFT OUTER JOIN "TITLES" ON "CHARACTERS"."movie" = "TITLES"."title"
                LEFT OUTER JOIN "PLANETS" ON "TITLES"."planet" = "PLANETS"."name"
                ORDER BY "CHARACTERS"."name";
	END
$$;

SELECT * FROM char_details();


-- Find all vehicles used by the characters and which movie they were in and who directed the movie

CREATE FUNCTION vehicles_used()
RETURNS TABLE(
	"Name"			  TEXT,
	"Vehicle"         TEXT,
	"Owner"           TEXT,
	"Title"           TEXT,
	"Director"        TEXT
)
LANGUAGE plpgsql
AS $$
	BEGIN
		RETURN QUERY
		SELECT "CHARACTERS"."name", "VEHICLES"."vehicleId", "VEHICLES"."owner", "TITLES"."title", "DIRECTORS"."directorId"
            FROM "CHARACTERS"
            LEFT OUTER JOIN "VEHICLES" ON "CHARACTERS"."vehicleUsed" = "VEHICLES"."vehicleId"
            LEFT OUTER JOIN "TITLES" ON "CHARACTERS"."movie" = "TITLES"."title"
            LEFT OUTER JOIN "DIRECTORS" ON "TITLES"."director" = "DIRECTORS"."directorId"
            WHERE "VEHICLES"."vehicleId" IS NOT NULL AND "VEHICLES"."owner" IS NOT NULL
            ORDER BY "CHARACTERS"."name";
	END
$$;

SELECT * FROM vehicles_used();


-- AGGREGATE FUNCTIONS NEW KEYWORDS(CAST, CONCAT, SUBSTRING)

-- Finds vehicles and their prices as decimals


CREATE FUNCTION price_decimal()
RETURNS TABLE(
	"Vehicle"		   TEXT,
	"Price"            FLOAT,
	"Price(Decimal)"   NUMERIC
)
LANGUAGE plpgsql
AS $$
	BEGIN
		RETURN QUERY
		SELECT "vehicleId", "price", CAST("price" AS NUMERIC(10,2)) AS "price_decimal"
            FROM "VEHICLES"
            GROUP BY "vehicleId"
            ORDER BY "price_decimal" DESC;
	END
$$;

SELECT * FROM price_decimal();

-- Calculate the average length of movies released between 1980 and 1990

CREATE FUNCTION avg_length()
RETURNS TABLE(
	"Average Length"   NUMERIC
)
LANGUAGE plpgsql
AS $$
	BEGIN
		RETURN QUERY
		SELECT AVG("length")::NUMERIC(5,2) AS "Average Length"
    FROM "TITLES"
    WHERE CONCAT("releaseYear", '') >= '1980'
      AND CONCAT("releaseYear", '') < '1990'
    HAVING COUNT(*) > 0;
	END
$$;

SELECT * FROM avg_length();


-- Find movies filmed at locations in any country that starts with a "U"

CREATE FUNCTION location_start()
RETURNS TABLE(
	"Title"		   TEXT,
	"Director"	   TEXT,
	"Planet"	   TEXT,
	"Release Year" INTEGER,
	"Length"       INTEGER,
	"Episode"      TEXT,
	"Cost"         FLOAT
)
LANGUAGE plpgsql
AS $$
	BEGIN
		RETURN QUERY
		 SELECT "TITLES".*
            FROM "TITLES"
            INNER JOIN "PLANETS" ON "TITLES"."planet" = "PLANETS"."name"
            INNER JOIN "FILM_LOCATIONS" ON "PLANETS"."filmedAt" = "FILM_LOCATIONS"."name"
            WHERE SUBSTRING("FILM_LOCATIONS"."country", 1, 1) = 'U'
            GROUP BY "TITLES"."title", "TITLES"."director", "TITLES"."planet", "TITLES"."releaseYear", "TITLES"."length", "TITLES"."episode", "TITLES"."cost"
            HAVING COUNT(*) > 0
        ORDER BY "TITLES"."releaseYear" DESC;
	END
$$;

SELECT * FROM location_start();


-- WHERE CLAUSE WITH USER CONTROL

-- function to find a director
CREATE FUNCTION find_movies_directors(director_name TEXT)
RETURNS TABLE (
    "Title"         TEXT, 
    "Director"      TEXT, 
    "Release Year"   INTEGER
) 
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT "title", "director", "releaseYear"
    FROM "TITLES"
    WHERE "director" = director_name;
END
$$;


SELECT * FROM find_movies_directors('George Lucas');

-- function to find names and genders of characters in a specific movie

CREATE FUNCTION find_characters_in_movie(movie_title TEXT)
RETURNS TABLE (
    "Name"      TEXT, 
    "Gender"    TEXT
) 
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT "name", "gender"
    FROM "CHARACTERS"
    WHERE "movie" = movie_title;
END
$$;

SELECT * FROM find_characters_in_movie('The Force Awakens');

-- function to find names and countries born of cast members after a specific year

CREATE FUNCTION find_birth_year(birth_year DATE)
RETURNS TABLE (
    "First Name"    TEXT, 
    "Last Name"     TEXT, 
    "Birth Country" TEXT
) 
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT "fn", "ln", "birthCountry"
    FROM "CAST"
    WHERE "isMale" = 't' AND "dob" > birth_year;
END
$$;

SELECT * FROM find_birth_year('1951-01-01');

-- function to find lifespans of species greater than a certain amount of years

CREATE FUNCTION find_lifespan_species(min_lifespan INTEGER)
RETURNS TABLE (
    "Species" TEXT,
    "Lifespan" INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT "speciesId", "lifespan"
    FROM "SPECIES"
    WHERE "lifespan" > min_lifespan;
END
$$;

SELECT * FROM find_lifespan_species(20);

-- function to find the films release after a certain year

CREATE FUNCTION find_filmYears(min_release_year INTEGER)
RETURNS TABLE (
    "Title"         TEXT, 
    "Director"      TEXT, 
    "Release Year"  INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT "title", "director", "releaseYear"
    FROM "TITLES"
    WHERE "releaseYear" > min_release_year;
END
$$;

SELECT * FROM find_filmYears(2000);


-- TRIGGERS

-- updates the population of a planet whenever a new character is added

CREATE FUNCTION update_planet_population()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE "PLANETS" 
    SET "population" = "population" + 1 
    WHERE "name" = NEW."planet";
    RETURN NEW;
END
$$;

CREATE TRIGGER update_planet_population_trigger
AFTER INSERT ON "CHARACTERS"
FOR EACH ROW
EXECUTE FUNCTION update_planet_population();


-- updates the count of the directors whenever a new movie is added

CREATE OR REPLACE FUNCTION update_director_count()
RETURNS TRIGGER 
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE "DIRECTORS"
    SET "movieCount" = "movieCount" + 1
    WHERE "directorId" = NEW."director";
    RETURN NEW;
END
$$;

CREATE TRIGGER update_director_count_trigger
AFTER INSERT ON "TITLES"
FOR EACH ROW
EXECUTE FUNCTION update_director_count();

