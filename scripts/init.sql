CREATE TABLE IF NOT EXISTS airports (
	id SERIAL PRIMARY KEY,
	code TEXT NOT NULL,
	city TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS people (
	id SERIAL PRIMARY KEY,
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS flights (
	id SERIAL PRIMARY KEY,
	origin_id INTEGER NOT NULL,
	destination_id INTEGER NOT NULL,
	duration INTEGER NOT NULL,
	CONSTRAINT fk_origin_id FOREIGN KEY (origin_id) REFERENCES airports(id),
	CONSTRAINT fk_destination_id FOREIGN KEY (destination_id) REFERENCES airports(id)
);

CREATE TABLE IF NOT EXISTS passengers (
	person_id INTEGER NOT NULL,
	flight_id INTEGER NOT NULL,
	CONSTRAINT fk_person_id FOREIGN KEY (person_id) REFERENCES people(id),
	CONSTRAINT fk_flight_id FOREIGN KEY (flight_id) REFERENCES flights(id)
);

INSERT INTO airports
	(code, city)
	VALUES
	('ORD', 'Chicago'),
	('IST', 'Istanbul'),
	('LIM', 'Lima'),
	('LHR', 'London'),
	('LAX', 'Los Angeles'),
	('SVO', 'Moscow'),
	('JFK', 'New York'),
	('CDG', 'Paris'),
	('PVG', 'Shanghai'),
	('NRT', 'Tokyo');

INSERT INTO people
	(first_name , last_name)
	VALUES
	('Harry', 'Potter'),
	('Ron', 'Weasley'),
	('Hermione', 'Granger'),
	('Draco', 'Malfoy'),
	('Luna', 'Lovegood'),
	('Ginny', 'Weasley'),
	('Neville', 'Longbottom'),
	('Cedric', 'Diggory');

INSERT INTO flights
	(origin_id, destination_id, duration)
	VALUES
	(7, 4, 415),
	(9, 8, 760),
	(2, 10, 700),
	(7, 8, 435),
	(6, 8, 245),
	(3, 7, 455),
	(1, 8, 540),
	(5, 10, 720);

INSERT INTO passengers
	(person_id, flight_id)
	VALUES
	(1, 1),
	(2, 1),
	(2, 4),
	(3, 2),
	(4, 4),
	(5, 6),
	(6, 6),
	(7, 8),
	(8, 7);
