USE sql_sql_store

SELECT *
FROM customers


SELECT *
FROM order_items
WHERE order_id = 6 AND unit_price * quantity>30

SELECT DISTINCT  state
FROM customers

SELECT *
FROM Customers
WHERE state = 'va'

SELECT *
FROM orders
WHERE order_date >= '2019-01-01'

SELECT name, unit_price,unit_price*1.1 AS new_price
FROM custoemrs

SELECT *
FROM Customers
WHERE state = ("VA") OR  state = ("FL") OR  state  = "GA"

SELECT *
FROM Customers
WHERE state IN ("VA","FL","GA")

SELECT *
FROM Customers
WHERE state NOT IN ("VA","FL","GA")

SELECT *
FROM products
WHERE quantity_in_stock IN (49,38,72)

SELECT *
FROM Customers
WHERE points >=1000 AND points <= 3000

SELECT *
FROM Customers
WHERE points BETWEEN 1000 AND 3000

SELECT *
FROM Customers
WHERE birth_date BETWEEN '1990-01-01' AND '2000-01-01'

SELECT *
FROM Customers
WHERE last_name LIKE 'b%'

SELECT *
FROM Customers
WHERE first_name LIKE 'brush%'

SELECT *
FROM Customers
WHERE first_name LIKE '%brush%'


SELECT *
FROM Customers
WHERE last_name LIKE '%y'

SELECT *
FROM Customers
WHERE last_name LIKE 'b____y'
-- % any number of characters
-- _ single character

SELECT *
FROM Customers
WHERE address LIKE '%trail%' OR
      address LIKE '%avenue'

SELECT *
FROM Customers
WHERE phone LIKE '%9'


SELECT *
FROM Customers
WHERE last_name  REGEXP 'field'

SELECT *
FROM Customers
WHERE last_name LIKE '%field%'

SELECT *
FROM Customers
WHERE last_name REGEXP "^field"

SELECT *
FROM Customers
WHERE last_name REGEXP "field$"

SELECT *
FROM Customers
WHERE last_name REGEXP "^field|mac|rose"

SELECT *
FROM Customers
WHERE last_name REGEXP "field$|mac|rose"

SELECT *
FROM Customers
WHERE last_name REGEXP "[gim]e" 
-- ge ie me
SELECT *
FROM Customers
WHERE last_name REGEXP "[a-h]e"
-- ^ beginng
-- $ end
-- | logical or 
-- [abcd]
-- [a-d]

SELECT *
FROM Customers
WHERE first_name REGEXP "ELKA|AMBUR"

SELECT *
FROM Customers
WHERE last_name REGEXP "EY$|ON$"

SELECT *
FROM Customers
WHERE last_name REGEXP  "^MY|SE"

SELECT *
FROM Customers
WHERE last_name REGEXP 'b[ru]'
-- [br\bu]


SELECT *
FROM Customers
WHERE phone IS NOT NULL


SELECT *
FROM Customers
WHERE phone IS NULL


SELECT *
FROM orders
WHERE shipper_id IS NULL


SELECT *
FROM Customers
ORDER BY first_name DESC


SELECT *
FROM Customers
ORDER BY first_name DESC


SELECT first_name, last_name ,10 AS points
FROM Customers
ORDER BY points,first_name

SELECT birth_date,first_name,last_name, 10 AS points
FROM Customers
ORDER BY 1,2

SELECT *,quantity * unit_price AS total_price
FROM orders_items
WHERE order_id = 2
ORDER BY total_price DESC

SELECT * FROM Customers
LIMIT 3 


SELECT * FROM Customers
LIMIT 300

SELECT *
FROM Customers
LIMIT 6,3
-- STEP 6 RENTURN 3 RECORDS

-- Get the top three loyal customers
SELECT *
FROM Customers
ORDER BY points DESC
LIMIT 3

-- AWALS IN END+


SELECT *
FROM orders
JOIN customers
    ON orders.customers_id = customers.customers_id

SELECT order_id,first_name,last_name
FROM orders
JOIN Customers
    ON orders.customers_id = customers.customers_id

SELECT order_id,customer_id,first_name,last_name
FROM orders
JOIN customers
    ON orders.customer_id = customers.customer_id

SELECT order_id,orders.customer_id,first_name,last_name
FROM orders
JOIN customers
    ON orders.customer_id = customers.customer_id

SELECT order_id,o.customer_id,first_name,last_name
FROM orders o
JOIN customers 
    ON o.customer_id = c.customer_id
    

SELECT *
FROM order_items oi
JOIN products p ON oi.product_id =p.product_id

SELECT order_id, oi.product_id,quantity,unit_price
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id

SELECT order_id,oi.product_id,quantity,oi.unit_price
FROM order_items io
JOIN products p ON oi.product_id =p.product_id

SELECT *
FROM order_items oi
JOIN sql_inventory.products p 
    ON oi.product_id = p.product_id

-- DATABASE  sql_inventory sql_store
USE sql_inventory

SELECT *
FROM sql_store.order_items oi
JOIN products p
    ON oi.product_id = p.product_id

USE sql_hr;

SELECT *
FROM employees e
JOIN employees m
    ON e.reports_to = m.employee_id
-- self_join

SELECT 
    e.employee_id,
    e.first_name,
    m.first_name AS manager
FROM employees e 
JOIN employees m 
    ON e.reports_to = m.employee_id

USE sql_store

SELECT sql_store;
FROM orders o 
JOIN customers c 
    ON o.customer_id = c.customer_id
JOIN order_status os
    ON o.status = os.order_status_id

USE sql_store

SELECT
    o.order_id,
    o.order_date,
    c.first_name,
    c.last_name,
    os.name AS status
FROM orders o 
JOIN customers c 
    ON o.customer_id = c.customer_id
JOIN order_status os
    ON o.status = os.order_status_id


-- Joining Multiple Tables
USE sql_invoicing;

SELECT
    p.date,
    p.invoice_id,
    p.amount,
    c.name,
    pm.name
FROM payments p 
JOIN clients c 
    ON p.clients = c.clients_id
JOIN payment_methods pm 
    ON p.payment_method =pm.payment_method


-- Compound Join Conditions
SELECT *
FROM order_items oi
JOIN order_item_notes oin
    ON oi.order_id = oin.order_id
    AND oi.product_id = oin.product_id

-- Implicit Join Syntax
--Cross 
SELECT *
FROM orders o
JOIN customers c 
    ON o.custoemr_id = c.custoemr_id

SELECT *
FROM orders o , customers c
WHERE o.custoemr_id = c.custoemr_id

SELECT *
FROM orders o, customers c

SELECT *
FROM orders o
JOIN customers c 
    ON o.custoemr_id = c.custoemr_id

SELECT
    c.custoemr_id,
    c.first_name,
    o.order_id
FROM custoemrs c 
JOIN orders o 
    ON c.custoemr_id = o.custoemr_id
ORDER BY  c.custoemr_id

SELECT 
    c.customer_id
    c.first_name,
    o.order_id
FROM customers c  --C表的内容无论是否成立都会返回
-- left ↑ 
LEFT JOIN orders o
    ON c.customer_id = o.custoemr_id
ORDER BY c.customer_id
-- 无论是否右边的条件成立，他都会成功

SELECT 
    c.customer_id
    c.first_name,
    o.order_id
FROM customers c  --C表的内容无论是否成立都会返回
LEFT JOIN orders o
    ON c.customer_id = o.custoemr_id
ORDER BY c.customer_id

SELECT 
    c.custoemr_id,
    c.first_name,
    o.order_id
FROM custoemrs c 
RIGHT JOIN orders o 
    ON c.customer_id = o.custoemr_id
ORDER BY c.custoemr_id


SELECT 
    c.custoemr_id,
    c.first_name,
    o.order_id
FROM  orders o  
RIGHT JOIN custoemrs c 
    ON c.customer_id = o.custoemr_id
ORDER BY c.custoemr_id

--LEFT OUTER JOIN JOIN INNER JOIN

SELECT 
    p.product_id,
    p.name,
    oi.quantity
FROM products p 
LEFT JOIN order_items oi
    ON p.product_id = oi.product_id



--Outer Join Between Multiple Tables
SELECT 
    c.custoemr_id,
    c.first_name,
    o.order_id
FROM customers c
LEFT JOIN orders o
    ON c.custoemr_id = o.custoemr_id
JOIN shipper_id sh 
    ON o.shipper_id =sh.shipper_id
ORDER BY c.custoemr_id 


SELECT 
    c.custoemr_id,
    c.first_name,   
    o.order_id,
    sh.name AS shipper
FROM customers c 
LEFT JOIN orders o 
    ON c.customer_id = o.custoemr_id
LEFT JOIN shippers sh 
    ON o.shipper_id = sh.shipper_id
ORDER BY c.customer_id 


SELECT 
    o.order_id,
    o.order_date,
    c.first_name AS customer
    sh.name AS shipper
FROM orders o 
JOIN custromers c  
    ON o.custoemr_id = c.custoemr_id --always matched
LEFT JOIN shippers sh
    ON o.shipper_id =sh.shipper_id
JOIN order_status os
    ON o.status =os.order_status_id

--Self Outer Joins
USE sql_hr;

SELECT
    e.employee_id,
    e.first_name,
    m.first_name AS manager
FROM employees e 
LEFT JOIN employees m 
    ON e.reports_to = m.employee_id  

-- The USING Clause
SELECT
    o.order_id,
    c.first_name,
    sh.name AS
FROM orders o 
JOIN customers c
    -- ON o.customer_id = c.customer_id
    USING (customer_id)
JOIN shipper sh 
    USING (shipper_id)


SELECT *
FROM order_items oi
JOIN order_item_notes oin
    ON oi.order_id = oin.order_id AND
        oi.product_id = oin.product_id


SELECT *
FROM order_items oi 
JOIN order_item_notes oin 
    USING(order_id,product_id)


USE sql_invocing;

SELECT 
    p.date,
    c.name AS client,
    p.amount,
    pm.name AS payment_method 
FROM payments p 
JOIN clients c USING(clients_id)
JOIN payment_methods pm
    ON p.payment_method = pm.payment_method_id

--Natural Joins
SELECT 
    o.order_id,
    c.first_name
FROM orders o 
NATURAL JOIN customers c  
-- automatically  merge same name 

--Cross Joins
SELECT 
    c.first_name AS customer
    p.first_name AS products
FROM customers c 
CROSS JOIN products p 

SELECT 
    c.first_name AS customer,
    p.name AS product
FROM customers c 
CROSS JOIN products p
ORDER BY c.first_name 

SELECT 
    c.first_name AS customer,
    p.name AS product
FROM customers c, orders o 
ORDER BY c.first_name

-- Do a cross join between shippers and products
--      using the implicit syntax
--      and then using the explicit syntax

-- implicit
SELECT 
    sh.name AS shipper,
    p.name AS product
FROM shippers sh, products p
ORDER BY sh.name 


--explicit
SELECT 
    sh.name AS shipper,
    p.name AS product
FROM shippers sh
CROSS JOIN products p 
ORDER BY sh.name 

--Unions
--hard coding
SELECT *
FROM orders
WHERE order_date >= '2019-01-01'

SELECT
    order_id,
    order_date,
    'Active' AS status
FROM orders 
WHERE order_date >= '2019-01-01'
UNION
SELECT 
    order_id,
    order_date,
    'Archived' AS status
FROM orders
WHERE order_date < '2019-01-01'


SELECT name AS full_name  -- display the orders for query
FROM shippers
UNION
SELECT first_name
FROM customers 

SELECT
    custoemr_id,
    first_name,
    points,
    'Brone' AS type
FROM customers 
WHERE points <2000
ORDER BY first_name 
UNION
SELECT 
    customer_id,
    first_name,
    points,
    'Sliver' AS type 
FROM custoemrs 
WHERE points BETWEEN 2000 AND 3000
ORDER BY first_name
UNION
SELECT 
    customer_id,
    first_name,
    points,
    'Gold' AS type 
FROM custoemrs 
WHERE points > 3000
ORDER BY first_name
-- Column Attributes
-- Inserting a Row

INSERT INTO customers
VALUES(DEFAULT)

INSERT INTO customer 
VALUES(200)

INSERT INTO customer
VALUES(DEFAULT,'John','Smith','1990-01-01')

INSERT INTO customers
VALUES (DEFAULT,'John','Smith',NULL)

INSERT INTO customers(
    first_name,
    last_name,
    birth_date,
    address,
    city,
    state,
)
VALUES(
    DEFAULT,
    'John',
    'Smith',
    '1990-01-01',
    NULL,
    'address',
    'CA',
)
-- Inserting Multiple Rows
INSERT INTO orders (customer_id,order_date,status)
VALUES (1,'2019-01-02',1);

INSERT INTO order_items
VALUES( LAST_INSERT_ID(),1,1,2.95)
--                       ID,NUMBER,PRICE

-- Creating a Copy of Table
CREATE TABLE orders_archived AS
SELECT * FROM orders

-- Truncate table
INSERT INTO orders_archived
SELECT *
FROM orders
WHERE order_date < '2019-01-01'

USE sql_invocing;

CREATE TABLE invoice_archived AS
SELECT
    i.invoce_id,
    i.number,
    c.name AS client,
    i.invoice_total,
    i.payment_total,
    i.payment_date,
    i.due_date
FROM invoices i 
JOIN clients c 
    USING (client_id)
WHERE payment_date IS NOT NULL 

-- Updating a Single Row
UPDATE invoices
SET payment_total = 10, payment_date = '2019-03-01' 
WHERE invoice_id = 1

UPDATE invoices 
SET payment_total = DEFAULT, payment_date = NULL
WHERE invoice_id =1

UPDATE invoices
SET payment_total = invoice_total *0.5,
    payment_date = due_date
WHERE invoice_id =3 


-- UPDATE Multiple Rows 
UPDATE invoices
SET
    payment_total = invoice_total * 0.5
    payment_date = due_date
WHERE client_id = 3
-- MYSQLBENCH take a  careful way to update,only permit you update one message

UPDATE invoices
SET 
    payment_total = invoice_total * 0.5
    payment_date = due_date 
WHERE client_id IN (3,4)

-- Write a SQL statement to
--      give any customers born before 1990
--      50 extra points
-- sql_store
USE sql_store;

UPDATE customers
SET points = points + 50
WHERE birth_date < '1990-01-01'

--Using Subqueries in Updates
UPDATE invoices
SET
    payment_total = invoice_total * 0.5 
    payment_date = due_date
WHERE client_id = 3;

SELECT  client_id
FROM clients
WHERE name = 'Myworks'

UPDATE invoices
SET
    payment_total = invoice_total * 0.5 
    payment_date = due_date
WHERE client_id = (
    SELECT  client_id
    FROM clients
    WHERE name = 'Myworks'
)

UPDATE invoices
SET
    payment_total = invoice_total * 0.5
    payment_date  = due_date
WHERE client_id IN
            (SELECT client_id
            FROM clients 
            WHERE state IN("CA","NY"))

UPDATE invoices
SET
    payment_total = invoice_total *0.5
    payment_date = due_date
WHERE payment_date IS NULL

-- Ace  Customer
-- sql_invoicing

SELECT *
FROM customers
WHERE points > 3000


UPDATE orders
SET comments = 'Gold customer' 
WHERE  customer_id IN (
                SELECT customer_id
                FROM customers
                WHERE points > 3000)
--DELETING ROWS
DELETE FROM invoices
WHERE invoice_id = (
    SELECT *
    FROM clients 
    WHERE name = 'Myworks'
)

-- Restoring the  Databases
-- Aggregate Functions
-- MAX
SELECT 
    MAX(invoice_total) AS highest,
    MIN(invoice_total) AS lowest,
    AVG(invoice_total) AS average,
    SUM(invoice_total) AS total,
    COUNT(invoice_total) AS number_of_invoices
    COUNT(payment_date) AS count_of_payments
    --作用于非空 
    COUNT (*) AS total_records  --contain  null values
    
FROM invoices 
WHERE invoice_date > '2019-07-01'


SELECT
    MAX(invoice_total) AS highest,
    MIN(invoice_total) AS lowest,
    AVG(invoice_total) AS average,
    SUM(invoice_total * 1.1) AS total,
    COUNT(DISTINCT client_id ) AS total_records
FROM invoices
WHERE invoice_date > '2019-07-01'


SELECT
    'First half of 2019' AS date_range,
    SUM(invoice_total) AS total_sales,
    SUM(payment_total) AS total_payments,
    SUM(invoice_total-payment_total) AS what_we
FROM invoices
WHERE invoice_date
    BETWEEN '2019-01-01' AND '2019-06-30'
UNION
SELECT
    'Second half of 2019' AS date_range,
    SUM(invoice_total) AS total_sales,
    SUM(payment_total) AS total_payments,
    SUM(invoice_total-payment_total) AS what_we
FROM invoices
WHERE invoice_date
    BETWEEN '2019-07-01' AND '2019-12-31'
UNION
SELECT
    'Total'  AS date_range,
    SUM(invoice_total) AS total_sales,
    SUM(payment_total) AS total_payments,
    SUM(invoice_total-payment_total) AS what_we
FROM invoices
WHERE invoice_date
    BETWEEN '2019-01-01' AND '2019-12-31'
-- The GROUP BY Clause


SELECT 
    MAX(caffeine_for_gentleman) AS powerful code,
    MIN(complex) AS lowest bug ,
    AVG(damn_home_work) AS average score,
    SUM(galgame_coder) AS support,
    COUNT (*) AS code_line  --contain  debugger values
    
FROM su*ks_school_institute 
BETWEEN '2020-06-22' AND '2020-06-22'


UPDATE caffeine_for_gentleman
SET
    night_power = powerful code * 7 hours 
    complex = NULL
WHERE deadline = 3 days;
UNION
SELECT  today_last_power
FROM earth_online
WHERE name = '水月のSQL波纹'



SELECT 
    client_id
    SUM(invoice_total) AS total_sales
FROM invoice i 
JOIN clients USING (client_id)
WHERE invoice_date >= '2019-07-01'
GROUP BY client_id
ORDER BY total sales DESC

SELECT 
    client_id,
    SUM(invoice_total)  AS total_sales
FROM invoices i 
JOIN clients USING (client_id)
WHERE invoice_date >='2019-07-01'
GROUP BY state, city
ORDER BY total_sales DESC


SELECT
    date,
    SUM(amount) AS total_payments
FROM payments 
GROUP BY date 
ORDER BY date


SELECT
    date,
    pm.name AS payment_method,
    SUM(amount) AS total_payments
FROM payments p
JOIN payment_methods pm 
    ON p.payment_method = pm.payment_method_id
GROUP BY date ,payment_method
ORDER BY date  
-- The HAVING Clause
SELECT
    client_id,
    SUM(invoice_total) AS total_sales,
    COUNT(invoice_total)
    --COUNT(*) AS number_of_invoices
FROM invoices 
GROUP BY client_id 
HAVING total_sales > 500 


SELECT
    client_id,
    SUM(invoice_total) AS total_sales,
    COUNT(*) AS number_of_invoices
FROM invoices 
GROUP BY client_id
HAVING total_sales > 500 AND number_of_invoice >5 -- 必须在select里的条件
--WHERE 在分组之前筛选数据，HAVING在分组之后筛选数据
-- WHERE 则不用考虑 select

-- Get the customers
--      located in Virginia
--      who have spent more than $100
USE sql_store;

SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(oi.quantity * oi.unit_price) AS total_sales
FROM customers 
JOIN orders o USING (customer_id)
JOIN order_item oi USING (order_id)
WHERE state = 'VA'
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING total_sales > 100

--The   ROLLUP Operator
SELECT
    client_id,
    SUM(invoice_total) AS total_sales
FROM invoice
GROUP BY client_id WITH ROLLUP 

SELECT
    client_id,
    SUM(invoice_total) AS total_sales
FROM invoice i 
JOIN clients c USING (client_id)
GROUP BY client_id WITH ROLLUP
--
SELECT 
    payment_method,
    SUM(amount) AS total
FROM payments
GROUP BY payment_method WITH ROLLUP

SELECT 
    payment_method,
    SUM(amount) AS total
FROM payments p 
JOIN payment_methods pm 
    ON p.payment_method = pm.payment_method_id
GROUP BY payment_method WITH ROLLUP


--Complex query
--Find products that are more
-- expensive than Lettuce(id = 3)

SELECT *
FROM products
WHERE unit_price >(
    SELECT unit_price
    FROM products
    WHERE product_id = 3
)

-- In sql_hr database:
--      Find employees whose earn more than average
USE sql_hr;

SELECT *
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees 
)

-- Find the products that have never been ordered
USE sql_store;

SELECT  DISTINCT product_id
FROM order_items


SELECT *
FROM products
WHERE product_id NOT IN(
    SELECT DISTINCT product_id
    FROM order_items
)

-- Find clients without invoices

USE sql_invoicing;


SELECT *
FROM clients
WHERE client_id NOT IN (
    SELECT DISTINCT client_id
    FROM invoices
)

-- Find clients without invoices
SELECT *
FROM clients
LEFT JOIN invoices USING (client_id)
WHERE invoice_id is NULL

-- Find customers who have ordered lettuce (id = 3)
--      Select customer_id,first_name,last_name

USE sql_store;

SELECT *
FROM custoemrs
WHERE customer_id IN (
    SELECT o.customer_id
    FROM order_items
    JOIN orders o USING(order_id)
    WHERE product_id = 3
)

SELECT *
FROM customers C
JOIN orders o USING (customer_id)
JOIN order_items oi USING(order_id)
WHERE oi.product_id = 3

SELECT DISTINCT customer_id,first_name,last_name
FROM customers c 
JOIN orders o USING (customer_id)
JOIN order_items oi USING (order_id)
WHERE oi.product_id = 3


--Find customers who have ordered lettuce(id = 3)
--         Select customer_id,first_name,last_name

USE sql_store;

SELECT *
FROM customers
WHERE customer_id IN (
    SELECT *
    FROM order_items
    WHERE product_id = 3
)


SELECT *
FROM customers
WHERE customer_id IN (
    SELECT o.customer_id
    FROM order_items oi
    JOIN orders o USING (order_id)
    WHERE  product_id = 3
)


SELECT DISTINCT custoemr_id,first_name,last_name
FROM customers c 
JOIN orders o USING (customer_id)
JOIN order_items oi USING (order_id)
WHERE oi.product_id = 3


-- The ALL Keyword
-- Select invoices larger than all invoices of
-- client 3

USE sql_invoicing;

SELECT *
FROM invoices
WHERE client_id = 3

SELECT MAX(invoice_total)
FROM invoices 
WHERE client_id = 3

SELECT *
FROM invoices
WHERE invoice_total >(
    SELECT MAX(invoice_total)
    FROM invoices
    WHERE client_id = 3
)
-- Select invoices larger than all invoices of
-- client 3

SELECT *
FROM invoices
WHERE invoice_total > ALL (
    SELECT invoice_total
    FROM invoices
    WHERE client_id = 3
)

-- The Any Key
-- Select clients with at least two invoices
SELECT *
FROM clients 
WHERE client_id = ANY (
    SELECT client_id
    FROM invoices
    GROUP BY client_id
    HAVING COUNT(*) >= 2
)

SELECT *
FROM clients 
WHERE client_id IN (
    SELECT client_id
    FROM invoices
    GROUP BY client_id
    HAVING COUNT(*) >= 2
)
-- No relationship
--子查询与外部查询没有相关性
-- Correlated Subqueries 相关子查询

-- Select employees whose salary is
-- above the average in their office

-- for each employee
--      calculate the avg salary for employee.office
--      return the employee if salary > avg

USE sql_hr;

SELECT *
FROM employees e
WHERE salary >(
    SELECT AVG(salary)
    FROM employees
    WHERE office_id = e.office_id
)

--Get invoices that are larger than the
-- client's average invoice amount

USE sql_invocing;


SELECT *
FROM invoices
WHERE invoice_total > (
    SELECT AVG(invoice_total)
    FROM invoices
    WHERE client_id =i.client_id
)

--The EXSITS Operator
-- Select clients that have an invoice 
SELECT *
FROM clients
WHERE client_id IN (
    SELECT DISTINCT client_id
    FROM invoices
)

SELECT *
FROM clients c 
WHERE EXISTS(
    SELECT client_id
    FROM invoices 
    WHERE client_id = c.client_id
)

--子查询没有真正返回结果集给外部查询
--相反，它只给出子查询是否有满足条件的记录
-- Find the products that have never been ordered
USE sql_store;

SELECT *
FROM products
WHERE product_id NOT IN (
    SELECT product_id
    FROM order_items
)

SELECT *
FROM products p 
WHERE NOT EXISTS(
    SELECT product_id
    FROM order_items
    WHERE product_id = p.product_id
)


-- Subqueries in the SELECT Clause
SELECT
    invoice_id,
    invoice_total,
    (SELECT AVG(invoice_total)
        FROM invoices) AS invoice_average,
    invoice_total - (SELECT invoice_avergae)
FROM invoices 


SELECT
    client_id,
    name,
    (SELECT SUM(invoice_total)
        FROM invoices
        WHERE client_id = c.client_id)  AS total_sales
    (SELECT AVG(invoice_total)FROM invoices) AS average
    (SELECT total_sales - average) AS difference
FROM clients c

--Subqueries in the FROM Clause 
SELECT *
FROM (
    SELECT
    client_id,
    name,
    (SELECT SUM(invoice_total)
        FROM invoices
        WHERE client_id = c.client_id)  AS total_sales
    (SELECT AVG(invoice_total)FROM invoices) AS average
    (SELECT total_sales - average) AS difference
FROM clients c
) as sales_summery
WHERE total_sales IS NOT NULL




















