SELECT * FROM customers
ORDER BY customer_id;

SELECT * FROM customers_log;

CREATE TRIGGER customer_updated
BEFORE UPDATE ON customers
FOR EACH ROW
EXECUTE PROCEDURE log_customers_change();

UPDATE customers
SET first_name = 'Steve'
WHERE last_name = 'Hall';

SELECT * FROM customers
ORDER BY customer_id;

SELECT * FROM customers_log;


CREATE TRIGGER customer_insert
AFTER INSERT ON customers
FOR EACH STATEMENT
EXECUTE PROCEDURE log_customers_change();

INSERT INTO customers (first_name, last_name, email_address)
VALUES
    ('Jeffrey','Cook', 'jeffreycook@gmail.com'),
    ('Arthur','Turner', 'arthurturner@gmail.com'),
    ('Nathan','Cooper', 'nathancooper@gmail.com');

SELECT * 
FROM customers
ORDER BY customer_id;

SELECT * FROM customers_log; 

CREATE TRIGGER customer_min_age
  BEFORE UPDATE ON customers
  FOR EACH ROW
  WHEN(NEW.years_old < 13)
  EXECUTE PROCEDURE override_with_min_age();

SELECT * 
FROM customers
ORDER BY customer_id;

SELECT * FROM customers_log; 

UPDATE customers
SET years_old = 23
WHERE last_name = 'Lewis';

UPDATE customers
SET years_old = 9,
    first_name = 'Mike'
WHERE last_name = 'Hall';

SELECT * 
FROM customers
ORDER BY customer_id;

SELECT * FROM customers_log;

DROP TRIGGER  IF EXISTS customer_min_age ON customers;

SELECT * FROM information_schema.triggers;
