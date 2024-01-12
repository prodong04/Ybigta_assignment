SELECT * FROM Customers;
SELECT * FROM OrderDetails;
SELECT * FROM Orders;
SELECT * FROM Products;
SELECT * FROM Categories;



#과제1-1
SELECT Cu.CustomerID, Cu.CustomerName, FORMAT(SUM(Pr.Price * Od.Quantity), 2) as 구매금액
FROM Customers Cu 
JOIN Orders O ON Cu.CustomerID = O.CustomerID
JOIN Orderdetails Od ON O.OrderID = Od.OrderID
JOIN Products Pr ON Od.ProductID = Pr.ProductID
GROUP BY Cu.CustomerID, Cu.CustomerName
ORDER BY Cu.CustomerID;

#과제1-2

SELECT Ca.CategoryName, SUM(Quantity) AS 판매량 , FORMAT(SUM(Od.Quantity * Pr.Price), 2) AS 판매금액
FROM Categories Ca
JOIN Products Pr ON Ca.CategoryID = Pr.CategoryID
JOIN Orderdetails Od ON Pr.ProductID = Od.ProductID
JOIN ORDERS O ON Od.OrderID = O.OrderID
GROUP BY Ca.CategoryName
ORDER BY 판매량 DESC, 판매금액 DESC;

#과제 1-3

SELECT Ca.CategoryName, SUM(Quantity) AS 판매량 , FORMAT(SUM(Od.Quantity * Pr.Price), 2) AS 판매금액
FROM Categories Ca
JOIN Products Pr ON Ca.CategoryID = Pr.CategoryID
JOIN Orderdetails Od ON Pr.ProductID = Od.ProductID
JOIN ORDERS O ON Od.OrderID = O.OrderID
GROUP BY Ca.CategoryName
HAVING SUM(Od.Quantity * Pr.Price) > (
	SELECT SUM(Od.Quantity * Pr.Price)
	FROM Categories Ca
	JOIN Products Pr ON Ca.CategoryID = Pr.CategoryID
	JOIN Orderdetails Od ON Pr.ProductID = Od.ProductID
	JOIN ORDERS O ON Od.OrderID = O.OrderID
	WHERE Ca.CategoryName = 'Seafood'
	GROUP BY Ca.CategoryName)
ORDER BY 판매량 DESC;

    