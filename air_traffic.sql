-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE passengers
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  airline TEXT NOT NULL
);

CREATE TABLE city
(
  id SERIAL PRIMARY KEY,
  from_city TEXT NOT NULL,
  to_city TEXT NOT NULL
);

CREATE TABLE country
(
  id SERIAL PRIMARY KEY,
  from_country TEXT NOT NULL,
  to_country TEXT NOT NULL
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline TEXT NOT NULL,
  from_city TEXT NOT NULL,
  from_country TEXT NOT NULL,
  to_city TEXT NOT NULL,
  to_country TEXT NOT NULL
);

INSERT INTO tickets
  (first_name, last_name, seat, departure, arrival, airline, from_city, from_country, to_city, to_country)
VALUES
  ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 'Washington DC', 'United States', 'Seattle', 'United States'),
  ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways', 'Tokyo', 'Japan', 'London', 'United Kingdom'),
  ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta', 'Los Angeles', 'United States', 'Las Vegas', 'United States'),
  ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 'Seattle', 'United States', 'Mexico City', 'Mexico'),
  ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 'Paris', 'France', 'Casablanca', 'Morocco'),
  ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 'Dubai', 'UAE', 'Beijing', 'China'),
  ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 'New York', 'United States', 'Charlotte', 'United States'),
  ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 'Cedar Rapids', 'United States', 'Chicago', 'United States'),
  ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 'Charlotte', 'United States', 'New Orleans', 'United States'),
  ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 'Sao Paolo', 'Brazil', 'Santiago', 'Chile');

  INSERT INTO passengers
  (first_name,last_name)
VALUES
  ('Jennifer','Finch'),('Thadeus','Gathercoal'),('Sonja','Pauley'),('Waneta','Skeleton'),('Berkie','Wycliff'),('Alvin','Leathes'),('Cory','Squibbes');

INSERT INTO airlines
  (airline)
VALUES
  ('United'),('British Airways'),('Delta'),('TUI Fly Belgium'),('Air China'),('American Airlines'),('Avianca Brasil');

INSERT INTO city
  (from_city, to_city)
VALUES
  ('Washington DC','Seattle'),('Tokyo','London'),('Los Angeles','Las Vegas'),('Seattle','Mexico City'),('Paris','Casablanca'),('Dubai','Beijing'),('New York','Charlotte'),('Cedar Rapids','Chicago'),('Charlotte','New Orleans'),('Sao Paolo','Santiago');

INSERT INTO country
  (from_country, to_country)
VALUES
  ('United States','United States'),('Japan','United States'),('United States','Mexico'),('France','Morocco'),('UAE','China'),('Brazil','Chile');

ALTER TABLE tickets ADD FOREIGN KEY (passengers_id) REFERENCES passengers(id);

ALTER TABLE tickets ADD FOREIGN KEY (airline_id) REFERENCES airlines(id);

ALTER TABLE tickets ADD FOREIGN KEY (city_id) REFERENCES city(id);

ALTER TABLE tickets ADD FOREIGN KEY (country_id) REFERENCES country(id);

-- Test

SELECT passengers.first_name, passengers.last_name, tickets.seat, airlines.airline, city.from_city, country.from_country, city.to_city, country.to_country FROM tickets JOIN passengers ON tickets.passengers_id = passengers.id JOIN airlines ON tickets.airline_id = airlines.id JOIN city ON tickets.city_id = city.id JOIN country ON tickets.country_id = country.id;
