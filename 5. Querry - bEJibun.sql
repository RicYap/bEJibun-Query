--1.	Display ItemName, ItemPrice, and Item Total (obtained from the sum of purchase�s quantity) of every item from all purchase that haven�t arrived, and the Item Total of the said item is greater than 100. Display the data sorted according to the Item Total in descending order.

SELECT ItemName, ItemPrice, [Item Total]=SUM(Qty)
FROM PurchaseHeader ph
	JOIN PurchaseDetail pd
	ON ph.PurchaseID=pd.PurchaseID
	JOIN Item it
	ON pd.ItemID=it.ItemID
WHERE ArrivalDate IS NULL
GROUP BY ItemName, ItemPrice
HAVING SUM(Qty)>100
ORDER BY SUM(Qty) DESC

--2.	Display VendorName, Domain Name (obtained from all letters of vendor's email, after the letter �@�), and Average Purchased Item (obtained from the average of the quantities of the items that have been purchased from the vendor) of every vendor whose address is on �Food Street�, and Domain Name is not �gmail.com�.

SELECT VendorName, 
	[Domain Name]=RIGHT(VendorEmail,CHARINDEX('@',REVERSE(VendorEmail))-1),
	[Average Purchased Item]=AVG(Qty)
FROM Vendor vn
	JOIN PurchaseHeader ph
	ON vn.VendorID=ph.VendorID
	JOIN PurchaseDetail pd
	ON ph.PurchaseID=pd.PurchaseID
WHERE RIGHT(VendorEmail,CHARINDEX('@',REVERSE(VendorEmail))-1) <> ('gmail.com')
	AND VendorAddress='Food Street'
GROUP BY VendorName, VendorEmail

--3.	Display Month (obtained from the month of sales� date), Minimum Quantity Sold (obtained from the minimum of the sales� quantity), and Maximum Quantity Sold (obtained from the maximum of the sales� quantity) from every sales transaction that happens in 2019, excluding the quantity of items with the type of either �Food� or �Drink�.
SELECT [Month]=MONTH(SalesDate), [Minimum Quantity Sold]=MIN(Qty), [Maximum Quantity Sold]=MAX(Qty)
FROM SalesHeader sh
	JOIN SalesDetail sd
	ON sh.SalesID=sd.SalesID
	JOIN Item it
	ON sd.ItemID=it.ItemID
	JOIN ItemType itt 
	ON it.ItemTypeID=itt.ItemTypeID
WHERE YEAR(SalesDate)=2019 AND ItemTypeName NOT IN ('Food', 'Drink')
GROUP BY SalesDate

--4.	Display Staff Number, (obtained from StaffID, by replacing �ST� with �Staff �), StaffName, Salary (obtained from the staff's salary, added by �Rp. � in front of the salary), Sales Count (obtained from the count of the sales transaction), and Average Sales Quantity (obtained from the average of the sales quantity) for each staff who serve customer of opposite gender in February.
SELECT [Staff Number]=REPLACE(sf.StaffID, 'ST', 'Staff'), StaffName, [Salary]='Rp. '+CONVERT(VARCHAR,StaffSalary), [Sales Count]=COUNT(sd.SalesID), [Average Sales Quantity]=AVG(Qty)
FROM Staff sf
	JOIN SalesHeader sh
	ON sf.StaffID=sh.StaffID
	JOIN Customer cr
	ON sh.CustomerID=cr.CustomerID
	JOIN SalesDetail sd
	ON sh.SalesID=sd.SalesID
WHERE StaffGender <> CustomerGender AND DATENAME(MONTH,SalesDate)='February'
GROUP BY sf.StaffID, StaffName, StaffSalary

--5.	Display Customer Initial (obtained from the first letter and the last letter of the customer�s name), Transaction Date (obtained from the sales date in �mm dd, yyyy� Format), and Quantity from sales transactions which are done by female customer, and the sales quantity is higher than the average quantity of all sales transaction.
--(alias subquery)

SELECT [Customer Initial]=LEFT(CustomerName,1)+RIGHT(CustomerName,1),
	   [Transaction Date]=CONVERT(VARCHAR,SalesDate, 107),
	   [Quantity]=Qty
FROM Customer c
	JOIN SalesHeader sh
	ON c.CustomerID=sh.CustomerID
	JOIN SalesDetail sd
	ON sh.SalesID=sd.SalesID,
	(
		SELECT AVG(Qty) AS avg_qty
		FROM SalesDetail
	) AS s
WHERE CustomerGender='Female'
	  AND Qty > s.avg_qty

--6.	Display ID (obtained from vendor�s id in lower case), VendorName, and Phone Number (obtained from vendor's phone, by replacing the first character of the vendor�s phone with �+62�) from every purchase transaction, where the transaction�s quantity is higher than the minimum of all purchase transaction, and the transaction�s item id is odd. The same vendor may be displayed more than once.
--(alias subquery)

SELECT [ID]=LOWER(v.VendorID),
	   VendorName,
	   [Phone Number]=STUFF(VendorPhone,1,1,'+62'),
	   Qty
FROM Vendor v
	JOIN PurchaseHeader ph
	ON v.VendorID=ph.VendorID
	JOIN PurchaseDetail pd
	ON ph.PurchaseID=pd.PurchaseID,
	(
		SELECT MIN(Qty) AS min_qty
		FROM PurchaseDetail
	) AS s
WHERE CONVERT(INT, RIGHT(ItemID,1))%2<>0
	  AND Qty> s.min_qty

--7.	Display StaffName, VendorName, PurchaseID, Total Purchased Quantity (obtained from the sum of purchase quantity), Ordered Day (obtained from the difference in day between the purchase date and current date, and ends with � Days ago�) for every transaction which Total Purchased Quantity is greater than the maximum quantity of all transactions that arrived less than a week after the purchase.
--(alias subquery)

SELECT StaffName, 
	   VendorName, 
	   ph.PurchaseID, 
	   [Total Purchased Quantity]=SUM(Qty),
	   [Ordered Day]=CONVERT(VARCHAR,DATEDIFF(DAY, PurchaseDate, GETDATE()))+' Days ago'
FROM PurchaseHeader ph
	JOIN Vendor v
	ON ph.VendorID=v.VendorID
	JOIN Staff sf
	ON ph.StaffID=sf.StaffID
	JOIN PurchaseDetail pd
	ON ph.PurchaseID=pd.PurchaseID,
	(
			SELECT MAX(Qty) AS max_qty
			FROM PurchaseDetail
	) AS s
WHERE (DAY(ArrivalDate)-DAY(PurchaseDate))<7
GROUP BY StaffName, VendorName, ph.PurchaseID, PurchaseDate, s.max_qty
HAVING SUM(Qty)> s.max_qty

--8.	Display Day (obtained from the name of the day of the sales transaction, such as �Monday�), Item Sales Amount (obtained from the count of the item sales) from each sale, only including items which price is less than the average of the price of items with the type of either �Electronic� or �Gadgets�. Display only the two data with the smallest sales transaction count.
--(alias subquery)

SELECT TOP 2
    [Day]=DATENAME(WEEKDAY, SalesDate),
    [Item Sales Amount]=COUNT(it.ItemID)
FROM SalesHeader sh
    JOIN SalesDetail sd
    ON sh.SalesID=sd.SalesID 
    JOIN Item it
    ON sd.ItemID=it.ItemID
    JOIN ItemType itt
    ON it.ItemTypeID=itt.ItemTypeID,
    (
        SELECT AVG(ItemPrice) AS avg_itemPrice
        FROM Item it
            JOIN ItemType itt
            ON it.ItemTypeID=itt.ItemTypeID
        WHERE ItemTypeName IN ('Electronic','Gadget')
    ) AS s
WHERE ItemPrice< s.avg_itemPrice
GROUP BY SalesDate
ORDER BY COUNT(it.ItemID)

--9.	Create a view called �Customer Statistic by Gender� which display CustomerGender, Maximum Sales (obtained from the maximum of the sales quantity) and Minimum Sales (obtained from the minimum of the sales quantity) for every transaction with the quantity between 10 and 50 and the customer date of birth's range are between 1998 and 1999.
CREATE VIEW [Customer Statistic by Gender] 
AS
SELECT CustomerGender, [Maximum Sales]=MAX(Qty), [Minimum Sales]=MIN(Qty)
FROM Customer c
	JOIN SalesHeader sh
	ON c.CustomerID=sh.CustomerID
	JOIN SalesDetail sd
	ON sh.SalesID=sd.SalesID
WHERE Qty BETWEEN 10 AND 50
	AND YEAR(CustomerDOB) BETWEEN 1998 AND 1999
GROUP BY CustomerGender

--10.	Create a view called �Item Type Statistic� to display Item Type (obtained from item type�s name in uppercase), Average Price (obtained from the average of item's price) and Number of Item Variety (obtained from the count of items) for every item type which started with F and include only the items which minimum purchase is higher than 5.

CREATE VIEW [Item Type Statistic]
AS
SELECT [Item Type]=UPPER(ItemTypeName),
	   [Average Price]=AVG(ItemPrice),
	   [Number of Item Variety]=COUNT(ItemID)
FROM Item it
	JOIN ItemType itt
	ON it.ItemTypeID=itt.ItemTypeID
WHERE ItemTypeName LIKE 'F%' 
	  AND MinPurchase>5
GROUP BY ItemTypeName
