
CREATE OR REPLACE PROCEDURE insert_employee(
    p_first_name VARCHAR(50),
    p_last_name VARCHAR(50)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO employees (first_name, last_name)
	VALUES (p_first_name, p_last_name);
END;
$$;

CREATE OR REPLACE PROCEDURE insert_customer(
    p_first_name VARCHAR(50),
    p_last_name VARCHAR(50)
)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO customers (first_name, last_name)
	VALUES (p_first_name, p_last_name);
END;
$$;

CREATE OR REPLACE PROCEDURE insert_car(
    p_make VARCHAR(50),
    p_model VARCHAR(50),
    p_year_made INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO cars (make, model, year_made)
	VALUES (p_make, p_model, p_year_made);
END;
$$;

CREATE OR REPLACE FUNCTION insert_sale(
    p_employee_id INTEGER,
    p_car_id INTEGER
)
RETURNS VOID
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO sales (employee_id, car_id)
    VALUES (p_employee_id, p_car_id);
END;
$$;

CREATE OR REPLACE FUNCTION insert_service_ticket(
    p_customer_id INTEGER,
    p_car_id INTEGER
)
RETURNS VOID
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO service_tickets (customer_id, car_id)
    VALUES (p_customer_id, p_car_id);
END;
$$;

CREATE OR REPLACE FUNCTION mark_car_serviced(
    p_car_id INTEGER
)
RETURNS VOID
AS $$
BEGIN
    UPDATE cars
    SET serviced = TRUE
    WHERE car_id = p_car_id;
END;
$$
LANGUAGE plpgsql;



CALL insert_employee('Samuel', 'Adams');
CALL insert_employee('Davey', 'Crockett');

CALL insert_customer('Jack', 'Daniels');
CALL insert_customer('Jim', 'Beam');

CALL insert_car('Toyota', 'Corolla', 2020);
CALL insert_car('Honda', 'Accord', 2019);

SELECT insert_sale(1, 1);
SELECT insert_sale(2, 2); 

SELECT insert_service_ticket(1, 4); 
SELECT insert_service_ticket(2, 2); 

SELECT mark_car_serviced(2);
SELECT * FROM cars;


SELECT * FROM cars
ORDER BY car_id;
SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM mechanic_cars
ORDER BY car_id;
SELECT * FROM mechanics;
SELECT * FROM sales
ORDER BY car_id;
SELECT * FROM service_tickets
ORDER BY car_id;