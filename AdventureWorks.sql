--1) Which shippers do we have? We have a table called Shippers. Return all the fields from all the shipper.

select * from Shippers

--2) We only want to see two columns, CategoryName and Description from categories table 

  select CategoryName, Description
  from Categories

-- 3) We’d like to see just the FirstName, LastName, and HireDate of all the employees with the Title of Sales Representative. 
select * from Employees
select FirstName, LastName, HireDate
from Employees
where title = 'sales representative'


--4) Now we’d like to see the same columns as above, but only for those employees that both have the title of Sales Representative, and also are in the United States

select FirstName, LastName, HireDate
from Employees
where title = 'sales representative' and Country = 'USA'

--5) Show all the orders placed by a specific employee. The EmployeeID for this Employee is 5.

select OrderID,OrderDate
 From Orders
 Where EmployeeID = 5


 --6) In the Suppliers table, show the SupplierID, ContactName, and ContactTitle for those Suppliers whose ContactTitle is not Marketing Manager.

select * from Suppliers

  select SupplierID, ContactName, ContactTitle
  from Suppliers
  where ContactTitle = 'Marketing Manager'


--7) In the products table, we’d like to see the ProductID and ProductName for those products where the ProductName includes the string “queso”.

select * from Products

  select ProductID, ProductName
  from Products
  where ProductName like '%queso%'

--8) Write a query that shows the OrderID, CustomerID, and ShipCountry for the orders where the ShipCountry is either France or Belgium.

select * from Orders

  select CustomerID, ShipCountry
  from Orders
  where ShipCountry = 'france' or ShipCountry = 'belgium'

--9) Write a query that shows the OrderID, CustomerID, and ShipCountry for the orders where the ShipCountry is either France or Belgium.

   Select OrderID,CustomerID,ShipCountry
  From Orders
  where
  ShipCountry in('Brazil','Mexico','Argentina','Venezuela')


  --10) Show the FirstName, LastName, Title, and BirthDate. Order the results by BirthDate, so we have the oldest employees first.
  select * from Employees
 
 
  Select FirstName,LastName,Title,BirthDate 
  From Employees
  Order By Birthdate desc

--11) In the output of the query above, showing the Employees in order of BirthDate, we see the time of the BirthDate field, which we don’t want. Show only the date portion of the BirthDate field.

  Select FirstName,LastName,Title,BirthDate = CONVERT (Date,Birthdate)
  From Employees
  Order By Birthdate desc

--12) Show the FirstName and LastName columns from the Employees table, and then create a new column called FullName, showing FirstName and LastName joined together in one column, with a space in-between.

  select FirstName, LastName,  FullName = FirstName+' ' + LastName
  from Employees

--13) In the OrderDetails table, we have the fields UnitPrice and Quantity. Create a new field, TotalPrice, that multiplies these two together. We’ll ignore the Discount field for now. In addition, show the 
--OrderID, ProductID, UnitPrice, and Quantity. Order by OrderID and ProductID.'

 Select
 OrderID,ProductID,UnitPrice,Quantity
 ,UnitPrice * Quantity as TotalPrice 
 From [Order Details]
 Order by
 OrderID,ProductID

--14) How many customers? How many customers do we have in the Customers table? 

 Select TotalCustomers = count(*)
 from Customers

--15) When was the first order? Show the date of the first order ever made in the Orders table.
  
  Select FirstOrder = min(OrderDate)
  From Orders

--17) Show a list of all the different values in the Customers table for ContactTitles. Also include a count for each ContactTitle

 Select ContactTitle,TotalContactTitle = count(*)
 From Customers
 Group by ContactTitle
 Order by count(*) desc

--18) We’d like to see, for each product, the associated Supplier. Show the ProductID, ProductName, and the CompanyName of the Supplier. Sort by ProductID.

  select * from Products
  select * from Suppliers

  select ProductID, ProductName, CompanyName
  from Products p
  join Suppliers s
  on p.SupplierID = s.SupplierID
  order by ProductID

--19) We’d like to show a list of the Orders that were made, including the Shipper that was used. Show the OrderID, OrderDate (date only), and CompanyName of the Shipper, and sort by OrderID.
  select * from Orders
  select * from Shippers

  Select O.OrderID,OrderDate = convert(date, O.OrderDate),Shipper = S.CompanyName
  From Orders O
  join Shippers S
  on S.ShipperID = O.ShipVia
  Order by
  O.OrderID

--20) we’d like to see the total number of products in each category. Sort the results by the total number of products, in descending order

  select * from Products
  select * from Categories
  
  select CategoryName, count (*) as totalproducts
  from Products p 
  join Categories c
  on p.CategoryID = c.CategoryID
  group by CategoryName
  order by totalproducts desc

--21) show the total number of customers per Country and City

  select* from Customers

  select Country,City, totalcustomers = count(*) 
  from Customers
  group by Country,City
  order by totalcustomers desc

--22) What products do we have in our inventory that should be reordered?
  select * from Products

  select  ProductID, ProductName, UnitsInStock, ReorderLevel
  from Products
  where UnitsInStock < ReorderLevel

--23) What products do we have in our inventory that should be reordered including the unitonorder 

  select * from Products

  select ProductID, ProductName, UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued
  from Products
 where UnitsInStock + UnitsOnOrder <= ReorderLevel 
 and Discontinued = 0

/*24) A salesperson for Northwind is going on a business trip to visit customers, and would like to see a list of
   all customers, sorted by region, alphabetically. However, he wants the customers with no region (null in the Region field)
   to be at the end, instead of at the top, where you’d normally find the null values. Within the same region, companies should be sorted by ustomerID*/

  select * from Customers

  select customerID, CompanyName, region 
  from Customers
  order by
  case 
	when region is null  then 1 else 0
  end	


/*25) Some of the countries we ship to have very high freight charges. We'd like to investigate some more shipping
  options for our customers, to be able to offer them lower freight charges. Return the three ship countries
  with the highest average freight overall, in descending order by average freight.*/
  select * from Orders

  select top 3 ShipCountry,avg (Freight) as AverageFrieght
  from Orders
  group by ShipCountry
  order by AverageFrieght desc

/*26) continuing on the question above on high freight
charges. Now, instead of using all the orders we have,
we only want to see orders from the year 2015*/

 select top 3 ShipCountry,avg (Freight) as AverageFrieght
  from Orders
  where year(OrderDate) = 1997
  group by ShipCountry
  order by AverageFrieght desc 

/*27) We're continuing to work on high freight charges. We now want to get the three ship countries with the
  highest average freight charges. But instead of filtering for a particular year, we want to use the last 12 months
  of order data, using as the end date the last OrderDate in Orders*/

 select top 3 ShipCountry,avg (Freight) as AverageFrieght
  from Orders
  where year(OrderDate) = (select max(year(OrderDate)) from orders )
  group by ShipCountry
  order by AverageFrieght desc 


/*28) We would like to inquire about the association between products and the employees who handle them. in the result we
  want to see EmployeeID with 
	their last name* and orderID with the prduct name*/
  select * from Employees
  select * from Products
  select * from [Order Details]
  select * from Orders

  select E.EmployeeID, E.LastName, o.OrderID, p.ProductName, od.Quantity
  from Employees E
  join Orders O
  on E.EmployeeID = O.EmployeeID
  join [Order Details] OD
  on o.OrderID = od.OrderID
  join Products P
  on p.ProductID = od.ProductID

/*29) There are some customers who have never actually placed an order. Show these customers*/
  select * from Customers
  select * from Orders
  
  select c.CustomerID, o.OrderId
  from Customers c
  left join Orders o 
  on o.CustomerID = c.CustomerID
  where o.CustomerID is null

/*30) One employee (Margaret Peacock, EmployeeID 4) hasplaced the most orders. However, there are some customers who've never placed an order with her. Show only those customers.*/
  select c.CustomerID, o.OrderId
  from Customers c
  left join Orders o 
  on o.CustomerID = c.CustomerID
  and o.EmployeeID = 4 
  where o.CustomerID is null


/*31) We want to send all of our high-value customers a special VIP gift. We're defining high-value customers as those who've made at least 1 order with a total value
  (not including the discount) equal to $10,000 or more. We only want to consider orders made in the year 1997.*/


  select * from Customers
  select * from Orders
  select * from [Order Details]

  select c.CustomerID, c.CompanyName, c.ContactName, sum(od.UnitPrice*od.Quantity) as TotalOrderAmount,year(o.OrderDate) as YearOfOrder
  from Customers c
  join Orders o
  on c.CustomerID = o.CustomerID
  join [Order Details] od
  on od.OrderID = o.OrderID
  where YEAR(OrderDate)= 1997
  group by c.CustomerID, c.CompanyName,c.ContactName,year(o.OrderDate)
  having sum(od.UnitPrice*od.Quantity) > 10000


--32) Change the above query to use the discount when calculating high-value customers. Order by the total amount which includes the discount

  
  select c.CustomerID, c.CompanyName, c.ContactName, round (sum(od.UnitPrice*od.Quantity*(1-Discount)),2) as TotalOrderAmount,year(o.OrderDate) as YearOfOrder
  from Customers c
  join Orders o
  on c.CustomerID = o.CustomerID
  join [Order Details] od
  on od.OrderID = o.OrderID
  where YEAR(OrderDate)= 1997
  group by c.CustomerID, c.CompanyName,c.ContactName,year(o.OrderDate)
  having sum(od.UnitPrice*od.Quantity) > 10000

/*33)At the end of the month, salespeople are likely to try much harder to get orders, to meet their month-end quotas. 
  Show all orders made on the last day of the month. Order by EmployeeID and OrderID*/


  Select
  EmployeeID,OrderID,OrderDate
  From Orders
  Where OrderDate = EOMONTH(OrderDate)
  Order by
  EmployeeID,OrderID

/*33)The Northwind mobile app developers are testing an app that customers will use to show orders. In order to
make sure that even the largest orders will show up correctly on the app, they'd like some samples of
orders that have lots of individual line items. Show the 10 orders with the most line items, in order of total
line items.*/

  select * from Orders
  select * from [Order Details]

  select top 10 o.OrderID, count (*)
  from orders o
  join [Order Details] od
  on o.OrderID = od.OrderID
  group by o.OrderID
  order by count (*) desc

/*34) App developers would now like to just get a random assortment of orders for beta testing on their app. Show a random set of 2% of all orders.*/

  Select top 2 percent
  OrderID
  From Orders
  Order By NewID()

/*35)one of the salespeople, has come to you with a request. She thinks that she accidentally double-entered a line item on an order, with a different
ProductID, but the same quantity. She remembers that the quantity was 60 or more. Show all the OrderIDs with line items that match this, in order of OrderID*/
select * from [Order Details]


  select OrderID, Quantity
  from [Order Details]
  where Quantity >= 60
  group by OrderID, Quantity
  having count(*)>1



/*36) we now want to show details of the order, for orders that match the above criteria.*/


with  duplicates as (
	  select  OrderID, Quantity
	  from [Order Details]
	  where  Quantity >= 60
	  group by OrderID, Quantity
	  having count(*)>1
  )
  select distinct OrderID, ProductID,UnitPrice, Quantity, Discount
  from [Order Details]
  where OrderID in ( select OrderID from duplicates ) and Quantity >= 60
  order by  OrderID, Quantity desc
 
 -- other way of doing the same

    with  duplicates as (
  select  OrderID, Quantity
  from [Order Details]
  where  Quantity >= 60
  group by OrderID, Quantity
  having count(*)>1
  ),
  details as (
  select  OrderID, ProductID,UnitPrice, Quantity, Discount
  from [Order Details]
    where  Quantity >= 60

 )

  select details.OrderID, ProductID, UnitPrice, details.Quantity, Discount
  from duplicates
  left join details 
  on duplicates.OrderID = details.OrderID


/*37) Some customers are complaining about their orders arriving late. Which orders are late?*/
select * from Orders

select OrderID, OrderDate, RequiredDate,ShippedDate
from Orders
where ShippedDate> RequiredDate