-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT ProductName, CategoryName
FROM Product as p
JOIN Category  as c
ON p.CategoryId = c.Id


-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT o.Id, CompanyName, OrderDate
FROM [Order] as o
JOIN Shipper as s
ON o.ShipVia = s.id;


-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT OrderId, Quantity, ProductName
FROM OrderDetail as od
JOIN Product as p
ON p.id = od.ProductId
WHERE od.OrderId = 10251
ORDER BY ProductName;


-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT DISTINCT od.OrderId as 'Order ID', e.LastName as 'Employee Last Name', c.CompanyName as 'Company Name'
FROM Customer as c
JOIN [Order]
ON c.Id = [Order].CustomerId
JOIN OrderDetail as od
ON od.OrderId = [Order].Id
JOIN Employee as e
ON e.Id = [Order].EmployeeId;

