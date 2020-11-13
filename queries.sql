-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

select 
p.productname,
c.categoryname
from Product as p
join Category as c 
on p.CategoryId = c.Id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

select 
o.id,
s.companyname 
from [Order] as o
join Shipper as s
on o.shipvia = s.id
where OrderDate < [2012-08-09];

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

select 
od.OrderId,
p.ProductName,
od.Quantity 
from OrderDetail as od
join Product as p 
on od.ProductId = p.Id
where OrderId = 10251
order by p.ProductName;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

select 
o.Id,
c.CompanyName, 
e.LastName 
from [Order] as o 
join Customer as c
on o.CustomerId = c.Id
join Employee as e 
on o.EmployeeId = e.Id;

-- NOTES 

-- select Product.productname, Product.supplierid from Product;
-- select p.productname, p.supplierid from Product as p;
-- select p.productname as "Product Name", p.supplierid from Product as p;

/*select 
p.productname as "Product Name", 
p.supplierid,
s.companyname 
from Product as p 
join Supplier as s
on p.supplierid = s.id;*/

/*select 
p.productname as "Product Name", 
s.companyname as "Supplier Name"
from Product as p 
join Supplier as s
on p.supplierid = s.id;*/

-- show big boss a view with product name and category name
/*select p.productname as "Product Name",
c.categoryname as "Category"
from Product as p 
join Category as c
on p.CategoryId = c.Id;*/

/*select 
p.productname as "Product Name",
s.companyname as "Supplier Name",
c.categoryname as "Category",
p.Unitprice as "Unit Price"
from Product as p 
join Supplier as s 
on p.supplierid = s.id
join Category as c
on p.CategoryId = c.Id
where p.unitprice > 100
order by p.unitprice desc;*/

/*select 
c.categoryname || " rocks!" as "Category Name",
max(p.unitprice) as "largest unit price in the category",
min(p.unitprice) as "smallest unit price in the category",
avg(p.unitprice) as "average unit price in the category",
count(p.id) as "number of products in the category"
from Product as p
join Category as c 
on p.categoryid = c.id
group by p.categoryid;*/