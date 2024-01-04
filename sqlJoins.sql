 /* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
select p.name as Product, c.name as Category from bestbuy.products as p
inner join bestbuy.categories as c on c.categoryid = p.categoryid
where c.name = "Computers";
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 select p.name , p.price, r.rating from bestbuy.products as p
 inner join bestbuy.reviews as r on r.productid = p.productid where r.rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
select e.firstname,e.lastname, Sum(s.quantity) as Total 
from bestbuy.sales as s
inner join bestbuy.employees as e on e.employeeid = s.employeeid
group by e.employeeid 
order by total desc
limit 2;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
select d.name, c.name from bestbuy.categories as c
inner join bestbuy.departments as d on d.DepartmentID = c.DepartmentID
where c.name = "Appliances" or "Games";

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California) --You may need to use SUM() */
select p.name, Sum(s.quantity) as QTY_Sold, Sum(s.quantity * s.priceperunit) as Total_Price
from bestbuy.sales as s
inner join bestbuy.products as p on p.ProductID = s.ProductID
group by p.ProductID;
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
select p.name, r.reviewer, r.rating, r.comment from bestbuy.reviews as r
inner join bestbuy.products as p on p.ProductID = r.ProductID
where p.name = "Visio TV" order by rating
limit 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
select e.employeeid, e.firstname, e.lastname, p.name, Sum(s.quantity) as QTY_sold
from bestbuy.sales as s
inner join bestbuy.products as p on p.ProductID = s.productid
inner join bestbuy.employees as e on e.employeeid = s.EmployeeID
group by p.productid , e.employeeid order by employeeid;

