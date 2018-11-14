DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS screenings;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS films;

CREATE TABLE customers (
    id SERIAL8 PRIMARY KEY,
    name VARCHAR(255),
    funds INT8
);

CREATE TABLE films (
    id SERIAL8 PRIMARY KEY,
    title VARCHAR(255),
    price INT8
);


CREATE TABLE screenings (
    id SERIAL8 PRIMARY KEY,
    show_time VARCHAR(255),
    film_id INT8 REFERENCES films(id)
);

CREATE TABLE tickets (
    id SERIAL8 PRIMARY KEY,
    customer_id INT8 REFERENCES customers(id),
    film_id INT8 REFERENCES films(id),
    screening_id INT8 REFERENCES screenings(id)
);