-- Create tables for car dealership database

-- Employees table
CREATE TABLE IF NOT EXISTS employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

-- Customers table
CREATE TABLE IF NOT EXISTS customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

-- Cars table
CREATE TABLE IF NOT EXISTS cars (
    car_id SERIAL PRIMARY KEY,
    make VARCHAR(50),
    model VARCHAR(50),
    year_made INTEGER,
    sold BOOLEAN DEFAULT FALSE,
    serviced BOOLEAN DEFAULT FALSE
);

-- Sales table
CREATE TABLE IF NOT EXISTS sales (
    sale_id SERIAL PRIMARY KEY,
    employee_id INTEGER,
    car_id INTEGER,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (car_id) REFERENCES cars(car_id)
);

-- Service tickets table
CREATE TABLE IF NOT EXISTS service_tickets (
    ticket_id SERIAL PRIMARY KEY,
    customer_id INTEGER,
    car_id INTEGER,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (car_id) REFERENCES cars(car_id)
);

-- Mechanics table
CREATE TABLE IF NOT EXISTS mechanics (
    mechanic_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);



INSERT INTO employees (first_name, last_name) VALUES ('John', 'Doe');
INSERT INTO employees (first_name, last_name) VALUES ('Jane', 'Smith');

INSERT INTO customers (first_name, last_name) VALUES ('Alice', 'Johnson');
INSERT INTO customers (first_name, last_name) VALUES ('Bob', 'Williams');

INSERT INTO cars (make, model, year_made, sold, serviced) VALUES ('Toyota', 'Corolla', 2020, false, false);
INSERT INTO cars (make, model, year_made, sold, serviced) VALUES ('Honda', 'Accord', 2019, false, false);

INSERT INTO sales (employee_id, car_id) VALUES (1, 1);
INSERT INTO sales (employee_id, car_id) VALUES (2, 2);

INSERT INTO service_tickets (customer_id, car_id) VALUES (1, 1);
INSERT INTO service_tickets (customer_id, car_id) VALUES (2, 2);

INSERT INTO mechanics (first_name, last_name) VALUES ('Mike', 'Johnson');
INSERT INTO mechanics (first_name, last_name) VALUES ('Sarah', 'Smith');



SELECT * FROM cars;
SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM sales;
SELECT * FROM service_tickets;


