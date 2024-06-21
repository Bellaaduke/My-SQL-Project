--SQL PROJECT PORTFOLIO

--To Identify all the product names in the database

Select * from Production.Product;

Select Name from Production.Product;

---- To Find the total number of employees.

Select COUNT(*) AS TotalEmployees FROM HumanResources.Employee;

----List the names and list prices of products costing more than $100.

SELECT Name, ListPrice FROM Production.Product WHERE ListPrice > 100;
-----Show the names of products along with their subcategory names.

SELECT p.Name AS ProductName, s.Name AS SubcategoryName
FROM Production.Product p
JOIN Production.ProductSubcategory s ON p.ProductSubcategoryID = s.ProductSubcategoryID;

------Get the average list price of all products.

SELECT AVG(ListPrice) AS AverageListPrice FROM Production.Product;

------Find the top 5 most expensive products.

SELECT TOP 5 Name, ListPrice FROM Production.Product ORDER BY ListPrice DESC;

-------Get the total sales amount for each sales order.

SELECT SalesOrderID, SUM(LineTotal) AS TotalAmount
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID;

-----Retrieve the sales order IDs and order dates for orders placed in 2022.

SELECT SalesOrderID, OrderDate FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2022;

-------List the first and last names of employees who are sales representatives.

SELECT e.FirstName, e.LastName
FROM Person.Person e
JOIN Sales.SalesPerson sp ON e.BusinessEntityID = sp.BusinessEntityID;

-----Retrieve the contact details of customers whose email addresses end with 'adventure-works.com'.

SELECT FirstName, LastName, EmailAddress
FROM Person.Person p
JOIN Person.EmailAddress e ON p.BusinessEntityID = e.BusinessEntityID
WHERE e.EmailAddress LIKE '%@adventure-works.com';

------Find the sales orders that have more than 5 items.

SELECT SalesOrderID
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
HAVING COUNT(*) > 5;

-------Show the product names and their standard costs for products with a standard cost greater than the average standard cost.

SELECT Name, StandardCost
FROM Production.Product
WHERE StandardCost > (SELECT AVG(StandardCost) FROM Production.Product);

-----Find the total quantity of each product ordered.
SELECT ProductID, SUM(OrderQty) AS TotalQuantity
FROM Sales.SalesOrderDetail
GROUP BY ProductID;

-------Retrieve the names of employees who have not been assigned to any department.

SELECT FirstName, LastName
FROM Person.Person e
LEFT JOIN HumanResources.EmployeeDepartmentHistory edh ON e.BusinessEntityID = edh.BusinessEntityID
WHERE edh.DepartmentID IS NULL;

-------Get the names and sales order IDs of customers who ordered the product 'Road-150'.

SELECT p.FirstName, p.LastName, soh.SalesOrderID
FROM Sales.SalesOrderHeader soh
JOIN Sales.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
JOIN Production.Product prod ON sod.ProductID = prod.ProductID
JOIN Person.Person p ON soh.CustomerID = p.BusinessEntityID
WHERE prod.Name = 'Road-150';