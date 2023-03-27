create Database Customers;
Select * from Customers;
SELECT CustomerName, City, Country FROM Customers;
SELECT DISTINCT City, Country FROM Customers;
SELECT COUNT(DISTINCT Country) FROM Customers;
SELECT * FROM Customers
WHERE Country = 'USA';
SELECT * FROM Customers
WHERE customerNumber >= 100;
SELECT * FROM Customers
WHERE Country = 'USA' AND City = 'NYC';
SELECT * FROM Customers
where Country = 'Singapore' and City ='Singapore';
SELECT * FROM Customers
WHERE Country = 'USA' AND (City = 'NYC' OR City = 'New Haven' OR City ='Allentown');

SELECT * FROM Customers
ORDER BY CreditLimit DESC;
SELECT * FROM Customers
ORDER BY Country DESC;
SELECT * from cUSTOMERS
WHERE addressLine2 IS NULL;
UPDATE Customers
SET addressLine2 = ''
WHERE addressLine2 IS NULL;
SELECT * FROM Customers
LIMIT 3;

SELECT MAX(creditLimit) AS LargestcreditLimit
FROM Customers;

/* Subqueries of MySql */
Select AVG(creditLimit) from Customers;
SELECT * FROM customers;
Select customerNumber, city, state, creditLimit, (Select AVG(creditLimit) from Customers) as AVGcreditLimit
from customers;

/* How to do it with partition BY */
Select customerNumber, city, state, creditLimit,  AVG(creditLimit) over() as AVGcreditLimit
from customers;

/* subquery in from */
select a.customerNumber,AVGcreditLimit
from (select customerNumber, city, state, creditLimit,  AVG(creditLimit) over() as AVGcreditLimit
	from customers);
    
SELECT a.customerNumber, a.AVGcreditLimit
FROM (
    SELECT customerNumber, city, state, creditLimit, AVG(creditLimit) over() as AVGcreditLimit
    FROM customers
) a;
SELECT city, state, AVG(creditLimit) as AVGcreditLimit
FROM customers
GROUP BY city, state;


/* subquery in where */
SELECT customerNumber, city, state, creditLimit
FROM customers
WHERE country = 'USA' AND city = 'NYC'
LIMIT 0, 1000;

 









