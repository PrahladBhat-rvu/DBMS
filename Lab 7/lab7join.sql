- Lab Experiment 05: To implement different types of joins: Inner Join, Outer Join (Left, Right, Full), and Natural Join.

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME:
-- USN:
-- SECTION:
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(),
       @@hostname AS Host_Name,
       VERSION() AS MySQL_Version,
       NOW() AS Current_Date_Time;

-- Write your code below this line along with the output

-- table 01: Customers
create database Shop;
use Shop;
-- CREATE  a TABLE named Customers (customer_id INT PRIMARY KEY,customer_name VARCHAR(50),city VARCHAR(50)
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);
-- insert 5 records
INSERT INTO Customers (customer_id, customer_name, city)
VALUES
(1, 'Alice', 'Bangalore'),
(2, 'Bob', 'Mumbai'),
(3, 'Charlie', 'Bangalore'),
(4, 'David', 'Delhi'),
(5, 'Eve', 'Bangalore');

-- TABLE:02 Orders Table

-- CREATE a TABLE named Orders (order_id INT PRIMARY KEY,customer_id INT foreign key,product_name VARCHAR(50),order_date DATE,
    -- insert 5 records
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_name VARCHAR(50),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
INSERT INTO Orders (order_id, customer_id, product_name, order_date)
VALUES
(101, 1, 'Laptop', '2023-09-10'),
(102, 2, 'Phone', '2023-09-12'),
(103, 3, 'Tablet', '2023-09-15'),
(104, 1, 'Headphones', '2023-09-20'),
(105, 4, 'Monitor', '2023-09-18');

-- TASK FOR STUDENTS

 
-- Write and Execute Queries
/*
1. Inner Join –
   Find all orders placed by customers from the city "Bangalore."
   List all customers with the products they ordered.
   Show customer names and their order dates.
   Display order IDs with the corresponding customer names.
   Find the number of orders placed by each customer.
   Show city names along with the products ordered by customers.
*/
SELECT c.customer_name, o.product_name, o.order_date
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id
WHERE c.city = 'Bangalore';
/* customer_name product_name order_date
Alice Laptop 2023-09-10
Alice Headphones 2023-09-20
Charlie Tablet 2023-09-15*/
SELECT c.customer_name, o.product_name
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id;
/*customer_name product_name
Alice Laptop
Alice Headphones
Bob Phone
Charlie Tablet
David Monitor*/
SELECT c.customer_name, o.order_date
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id;
/* customer_name order_date
Alice 2023-09-10
Alice 2023-09-20
Bob 2023-09-12
Charlie 2023-09-15
David 2023-09-18*/
SELECT o.order_id, c.customer_name
FROM Orders o
INNER JOIN Customers c ON o.customer_id = c.customer_id;

SELECT c.customer_name, COUNT(o.order_id) AS number_of_orders
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name;
/* order_id customer_name
101 Alice
104 Alice
102 Bob
103 Charlie
105 David*/
SELECT c.city, o.product_name
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id;
/*city product_name
Bangalore Laptop
Bangalore Headphones
Mumbai Phone
Bangalore Tablet
Delhi Monitor*/
/*
2  Left Outer Join –
    Find all customers and their orders, even if a customer has no orders.
    List all customers and the products they ordered.
    Show customer IDs, names, and their order IDs.
    Find the total number of orders (if any) placed by each customer.
    Retrieve customers who have not placed any orders.
Display customer names with their order dates.
-- Write your code below this line along with the output
*/
SELECT c.customer_name, o.product_name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id;
/* customer_name product_name
Alice Laptop
Alice Headphones
Bob Phone
Charlie Tablet
David Monitor
Eve */
-- Left Outer Join: List all customers and the products they ordered.
SELECT c.customer_name, o.product_name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id;
/* customer_name product_name
Alice Laptop
Alice Headphones
Bob Phone
Charlie Tablet
David Monitor
Eve */

SELECT c.customer_id, c.customer_name, o.order_id
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id;


SELECT c.customer_name, COUNT(o.order_id) AS total_orders
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name;
/* customer_id customer_name order_id
1 Alice 101
1 Alice 104
2 Bob 102
3 Charlie 103
4 David 105
5 Eve */

SELECT c.customer_name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;
/*customer_name
Eve*/

SELECT c.customer_name, o.order_date
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id;
  /*customer_name order_date
Alice 2023-09-10
Alice 2023-09-20
Bob 2023-09-12
Charlie 2023-09-15
David 2023-09-18
Eve */
/* 3: Right Outer Join –
      Find all orders and their corresponding customers, even if an order doesn't have a customer associated with it.
      Show all orders with the customer names.
      Display product names with the customers who ordered them.
 List order IDs with customer cities.
      Find the number of orders per customer (include those without orders).
 Retrieve customers who do not have any matching orders.
     Write your code below this line along with the output
 */
SELECT o.order_id, o.product_name, c.customer_name
FROM Orders o
RIGHT JOIN Customers c ON o.customer_id = c.customer_id;
/* customer_name order_date
Alice 2023-09-10
Alice 2023-09-20
Bob 2023-09-12
Charlie 2023-09-15
David 2023-09-18
Eve */
SELECT o.order_id, o.product_name, c.customer_name
FROM Orders o
RIGHT JOIN Customers c ON o.customer_id = c.customer_id;
/* order_id product_name customer_name
101 Laptop Alice
104 Headphones Alice
102 Phone Bob
103 Tablet Charlie
105 Monitor David
Eve*/
SELECT o.product_name, c.customer_name
FROM Orders o
RIGHT JOIN Customers c ON o.customer_id = c.customer_id;
/*product_name customer_name
Laptop Alice
Headphones Alice
Phone Bob
Tablet Charlie
Monitor David
Eve*/
SELECT o.order_id, c.city
FROM Orders o
RIGHT JOIN Customers c ON o.customer_id = c.customer_id;
/*order_id city
101 Bangalore
104 Bangalore
102 Mumbai
103 Bangalore
105 Delhi
Bangalore*/
SELECT c.customer_name, COUNT(o.order_id) AS number_of_orders
FROM Customers c
RIGHT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name;
/* customer_name number_of_orders
Alice 2
Bob 1
Charlie 1
David 1*/
SELECT c.customer_name
FROM Customers c
RIGHT JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

/* 4: Full Outer Join –
        Find all customers and their orders, including those customers with no orders and orders without a customer.
        List all customers and products, whether they placed an order or not.
        Show customer IDs with order IDs (include unmatched ones).
Display customer names with order dates.
Find all unmatched records (customers without orders and orders without customers).
        Show customer cities with products.
     Write your code below this line along with the output
  */   SELECT c.customer_name, o.product_name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
UNION
SELECT c.customer_name, o.product_name
FROM Orders o
RIGHT JOIN Customers c ON o.customer_id = c.customer_id;
/*customer_name product_name
Alice Laptop
Alice Headphones
Bob Phone
Charlie Tablet
David Monitor
Eve
*/
SELECT c.customer_name, o.product_name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
UNION
SELECT c.customer_name, o.product_name
FROM Orders o
RIGHT JOIN Customers c ON o.customer_id = c.customer_id;
/* customer_name product_name
Alice Laptop
Alice Headphones
Bob Phone
Charlie Tablet
David Monitor
Eve */
SELECT c.customer_id, o.order_id
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
UNION
SELECT c.customer_id, o.order_id
FROM Orders o
RIGHT JOIN Customers c ON o.customer_id = c.customer_id;
/* customer_id order_id
1 101
1 104
2 102
3 103
4 105
5 */
SELECT c.customer_name, o.order_date
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
UNION
SELECT c.customer_name, o.order_date
FROM Orders o
RIGHT JOIN Customers c ON o.customer_id = c.customer_id;
/*customer_name order_date
Alice 2023-09-10
Alice 2023-09-20
Bob 2023-09-12
Charlie 2023-09-15
David 2023-09-18
Eve */

SELECT c.customer_name, o.product_name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL
UNION
SELECT c.customer_name, o.product_name
FROM Orders o
RIGHT JOIN Customers c ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;
/* customer_name product_name
Eve */
SELECT c.city, o.product_name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
UNION
SELECT c.city, o.product_name
FROM Orders o
RIGHT JOIN Customers c ON o.customer_id = c.customer_id;
/* city product_name
Bangalore Laptop
Bangalore Headphones
Mumbai Phone
Bangalore Tablet
Delhi Monitor
Bangalore */
  /* 5: Natural Join –
          Find all orders placed by customers.
          List all customers with the products they ordered using NATURAL JOIN.
          Show customer names along with their order dates using NATURAL JOIN.
          Find all customer cities and the products ordered by those customers using NATURAL JOIN.

     Write your code below this line along with the output
  */

SELECT *
FROM Customers c
NATURAL JOIN Orders o;
/* customer_id customer_name city order_id product_name order_date
1 Alice Bangalore 101 Laptop 2023-09-10
2 Bob Mumbai 102 Phone 2023-09-12
3 Charlie Bangalore 103 Tablet 2023-09-15
1 Alice Bangalore 104 Headphones 2023-09-20
4 David Delhi 105 Monitor 2023-09-18*/
SELECT c.customer_name, o.product_name
FROM Customers c
NATURAL JOIN Orders o;
/*customer_name product_name
Alice Laptop
Bob Phone
Charlie Tablet
Alice Headphones
David Monitor*/
SELECT c.customer_name, o.order_date
FROM Customers c
NATURAL JOIN Orders o;
/* customer_name order_date
Alice 2023-09-10
Bob 2023-09-12
Charlie 2023-09-15
Alice 2023-09-20
David 2023-09-18*/
SELECT c.city, o.product_name
FROM Customers c
NATURAL JOIN Orders o;
/* customer_name order_date
Alice 2023-09-10
Bob 2023-09-12
Charlie 2023-09-15
Alice 2023-09-20
David 2023-09-18*/
  -- END OF THE EXPERIMENT
