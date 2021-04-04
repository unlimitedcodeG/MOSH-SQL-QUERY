USE sql_sql_store

SELECT *
FROM customers

SELECT *
FROM order_items
WHERE order_id = 6 AND unit_price * quantity>30

SELECT DISTINCT STATE
FROm customers

SELECT *
FROM Customers
WHERE state = 'va'

SELECT *
FROM orders
WHERE order_date >='2019-01-01'

SELECT name, unit_price, unit_price*1.1 AS new_price
FROM customers

SELECT *
FROM customers
WHERE state =('VA') OR state =('FL') OR state ='GA'

SELECT *
FROM customers
where state in ('VA','FL','GA')

SELECT *
FROM customers
WHERE state NOT IN ('VA','FL','GA')

SELECT *
FROM products
WHERE quantity_in_stock IN (49,38,72)

SELECT *
FROM cutsomers
WHERE birth_date BETWEEN '1999-01-01' AND '2000-01-01'

