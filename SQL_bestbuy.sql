/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
select products.name as ProductName, categories.name as CategoryName from products
inner join categories on categories.CategoryID = products.ProductID
where categories.name = 'computers';
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
select products.name, products.price, reviews.Rating from products 
inner join reviews on products.productid = reviews.ProductID
where reviews.rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
select employees.FirstName, employees.LastName, sum(sales.Quantity) as total from sales
inner join employees on employees.EmployeeID = sales.EmployeeID
group by employees.EmployeeID order by total desc limit 2;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
select d.name as 'Department Name', c.name as 'Category Name' from departments as d
inner join categories as c on c.DepartmentID = d.DepartmentID
where c.name = 'appliances' or c.name = 'games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 select p.name, Sum(s.quantity) as 'Total Sold', Sum(s.Quantity * s.PricePerUnit) as 'Total Price'
 from products as p inner join sales as s on s.ProductID = p.ProductID
 where p.ProductID = 97;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
select p.name, r.reviewer, r.rating, r.comment from products as p
inner join reviews as r on p.ProductID = r.ProductID
where r.rating = 1 and p.productid = 857;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
select e.employeeid, e.firstname, e.lastname, p.name, Sum(s.quantity) as TotalSold from sales as s
inner join employees as e on s.EmployeeID = e.EmployeeID
inner join products as p on p.productid = s.ProductID
group by e.EmployeeID, p.ProductID
order by TotalSold desc;
