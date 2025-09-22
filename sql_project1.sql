create database project1;
use project1;
select * from customers;
select * from orders;
select * from order_details;
select * from products;
select * from suppliers;
select * from reviews;



#TASK_3
select city,count(name) from customers
group by city;

select productname,category from products
where category="Fruits";


#Task_4
create table customer(customerid varchar(50) primary key,
name varchar(30) unique, age int not null check(age>18),gender varchar(20),
city varchar(30), state varchar(30),country varchar(20));


#Task_5
insert into products values
("0216awea-5drt-4d37-ae69-8a78b3756691", "Fish Fruit",
 "Fruits", "Dairy", 433, 765, "2a8745b2-86da-7b3b-51a3-0d4be543b42a");
insert into products values
("0265adsa-6rtt-4r47-er66-8a78f7467468", "Early Snack", "Snacks", 
"Sub-Snacks-3", 967, 846, "9u6346e7-65yh-3h8i-27h6-9gn6f278n75s"),
("0743arta-5drt-4d67-ty79-8g46h3753580", "Weight Baker", "Bakery", 
"Sub-Bakery-2", 267, 734, "4f87454r-75hj-3h6k-37h9-5h43b420d4a");


#Task_6
update products set stockquantity = 767 where productid="0743arta-5drt-4d67-ty79-8g46h3753580";

select * from products where stockquantity=767;


#Task_7
delete from suppliers where city="South Ana";

set sql_safe_updates=0;


#Task_8
alter table reviews add check(rating between 1 and 5);

alter table customers modify primemember varchar(50);
alter table customers alter column PrimeMember set default 'No';

select * from customers;


#Task_9
select * from orders where orderdate>"2024-01-01";

select a.productid,a.productname,avg(b.rating) as avg_rating
from products as a
inner join reviews as b
on a.productid=b.productid
group by a.productid
having avg(b.rating)>4;


select orderid,productid,(quantity*unitprice) as sales,
rank() over(partition by productid order by (quantity*unitprice) desc) as rank_list
from order_details;


#Task_10
select a.name,sum(b.orderamount+b.deliveryfee) as total
from customers as a
inner join orders as b
on a.customerid=b.customerid
group by a.customerid;


select a.name,sum(b.orderamount+b.deliveryfee) as total,
rank() over(order by sum(b.orderamount+b.deliveryfee) desc)as rank_list
from customers as a
inner join orders as b
on a.customerid=b.customerid
group by a.name;

select customerid,orderamount,deliveryfee,(orderamount+deliveryfee) as spent
from orders where (orderamount+deliveryfee)>5000;
     

#Taks_11
select a.orderid,b.productid,b.quantity,b.unitprice,b.discount,
((quantity*unitprice)-discount) as revenue from orders as a
inner join order_details as b
on a.orderid=b.orderid;

select orderid,orderdate from orders where orderdate="2025-01-01";

select supplierid,productname,stockquantity from products
where stockquantity>0;


#Task_12
create table categories (
categoryid int primary key,
categoryname varchar(50),
subcategoryname varchar(50));

select * from categories;

alter table products add categoryid int;

select * from products;

#Task_13
select productname,revenue from
(select a.productname,sum(b.quantity*b.unitprice) as revenue 
from products as a
inner join order_details as b
on a.productid=b.productid
group  by a.productid,a.productname
order by revenue desc limit 3)
as top3product; 


select customerid,name from customers
where customerid not in (select distinct customerid from orders);


#Task_14
select city,count(primemember)from customers
group by city;

select a.fk_Category as category,count(b.orderid) as count from
products as a inner join order_details as b
on a.productid=b.productid
group by a.fk_Category 
order by count(b.orderid) desc
limit 3;



