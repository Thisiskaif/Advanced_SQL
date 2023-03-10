# insights-using-SQL
## Here i used a dataset provided bye Microsoft.

1. Which shippers do we have?
   We have a table called Shippers. Return all the fields
 from all the shipper.
 ### Answer
    Select
    *
    From Shippers


2. Certain fields from Categories
   In the Categories table, selecting all the fields using
this SQL:
### Answer
    Select
    CategoryName
    ,Description

from Categories

3. Sales Representatives
   We’d like to see just the FirstName, LastName, and
 HireDate of all the employees with the Title of Sales
 Representative.
### Answer
    Select
    FirstName
    ,LastName
    ,HireDate
    From Employees
    Where
   Title = 'Sales Representative'

4. Sales Representatives in the United
 States:
   Now we’d like to see the same columns as above, but
 only for those employees that both have the title of
 Sales Representative, and also are in the United States.
### answer
Select
 FirstName
 ,LastName
 ,HireDate
From Employees
Where
 Title = 'Sales Representative'
 and Country = 'USA'

5. Orders placed by specific EmployeeID:
   Show all the orders placed by a specific employee. The
 EmployeeID for this Employee (Steven Buchanan) is 5.

6. Suppliers and ContactTitles:
   In the Suppliers table, show the SupplierID,
   ContactName, and ContactTitle for those Suppliers
   whose ContactTitle is not Marketing Manager.

7. Products with “queso” in ProductName:
   In the products table, we’d like to see the ProductID
   and ProductName for those products where the
   ProductName includes the string “queso”.

8. Orders shipping to France or Belgium:
   Looking at the Orders table, there’s a field called
   ShipCountry. Write a query that shows the OrderID,
   CustomerID, and ShipCountry for the orders where the
   ShipCountry is either France or Belgium.

9. Orders shipping to any country in Latin
   America:
   Now, instead of just wanting to return all the orders
   from France of Belgium, we want to show all the
   orders from any Latin American country. But we don’t
   have a list of Latin American countries in a table in the
   Northwind database. So, just use
   list of Latin American countries that happen to be in
   the Orders table:
   Brazil
   Mexico
   Argentina
   Venezuela.

10. Employees, in order of age:
    For all the employees in the Employees table, show the
    FirstName, LastName, Title, and BirthDate. Order the
    results by BirthDate, so we have the oldest employees
    first.

11. Showing only the Date with a DateTime
    field:
    In the output of the query above, showing the
    Employees in order of BirthDate, we see the time of
    the BirthDate field, which we don’t want. Show only
    the date portion of the BirthDate field.

12. Employees full name:
    Show the FirstName and LastName columns from the
    Employees table, and then create a new column called
    FullName, showing FirstName and LastName joined
    together in one column, with a space in-between.

13. OrderDetails amount per line item:
    In the OrderDetails table, we have the fields UnitPrice
    and Quantity. Create a new field, TotalPrice, that
    multiplies these two together. We’ll ignore the
    Discount field for now.
    In addition, show the OrderID, ProductID, UnitPrice,
    and Quantity. Order by OrderID and ProductID.

14. How many customers?
    How many customers do we have in the Customers
    table? Show one value only, and don’t rely on getting
    the recordcount at the end of a resultset.

15. When was the first order?
    Show the date of the first order ever made in the
    Orders table.

16. Countries where there are customers
    Show a list of countries where the Northwind company
    has customers.
    
17. Contact titles for customers
    Show a list of all the different values in the Customers
    table for ContactTitles. Also include a count for each
    ContactTitle.
    This is similar in concept to the previous question
    “Countries where there are customers”
    , except we now
    want a count for each ContactTitle   
    
18. Products with associated supplier names
    We’d like to show, for each product, the associated
    Supplier. Show the ProductID, ProductName, and the
    CompanyName of the Supplier. Sort by ProductID.
    
19. Orders and the Shipper that was used
    We’d like to show a list of the Orders that were made,
    including the Shipper that was used. Show the
    OrderID, OrderDate (date only), and CompanyName of
    the Shipper, and sort by OrderID.
    
20. Categories, and the total products in
    each category
For this problem, we’d like to see the total number of
products in each category. Sort the results by the total
number of products, in descending order    

21. Total customers per country/city
    In the Customers table, show the total number of
  customers per Country and City
    
22. Products that need reordering
What products do we have in our inventory that should
be reordered? For now, just use the fields UnitsInStock
and ReorderLevel, where UnitsInStock is less than the
ReorderLevel, ignoring the fields UnitsOnOrder and
Discontinued.
Order the results by ProductID.


23. Products that need reordering, continued
     Now we need to incorporate these fields—
UnitsInStock, UnitsOnOrder, ReorderLevel,
Discontinued—into our calculation. We’ll define
“products that need reordering” with the following:
UnitsInStock plus UnitsOnOrder are less than
or equal to ReorderLevel
The Discontinued flag is false (0).


24. 
