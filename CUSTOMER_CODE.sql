-- 1). List all customers.
select * from customer;

-- 2). Count total number of customers.
create view Total_of_customer as
select count(Customer_ID)  as Total_Customer from customer;

-- 3). Show customer names and their countries.
create view countries_wise_customer as
select distinct Country, Name from customer;

-- 4). Find the customer where countries is Denmark. 
create view Denmark_customers as
select * from customer
where Country='Denmark';

-- 5). Sort customers alphabetically by name.
create view alphabetically_by_name as
select * from customer
order by Name;

-- 6). Count number of customers from each country.
create view customer_each_country as
select distinct Country, count(*) as Count_customer from customer
group by Country;

-- 7). Find top 5 countries with the most customers.
create view top_5customers_in_country as
select distinct Country,count(*) as top_Countries from customer
group by Country
order by top_Countries desc
limit 5;

-- 8). Get customers whose name starts with ‘S’.
create view first_name_S as
select * from customer
where Name like 'S%';

-- 9). Find duplicate phone numbers (if any).
create view duplicates_phone_number as
select Phone,count(*) from customer
group by Phone
having count(*) >1;

-- 10). List all cities that have more than 1 customer.
create view more_than_one_customer as 
select City,count(*) from customer
group by City
having count(*)>1;

-- 11). Get the customer count per country and rank them.
create view customer_rank_position as
select Country, count(*) as total_customer,
rank() over (order by count(*) desc) as rank_position 
from customer
group by Country;

-- 12). Create a temporary view of Indian customers.
create view Indian_customer as
select * from customer
where Country='India';

-- 13). Find customers who live in cities ending with “bury”.
create view city_like_bury as
select * from customer
where City like '%bury';

-- 14). Mask part of the customer phone number for privacy.
create view masked_phone as
select Name,concat('xxxxxxx',right(Phone,3)) as masked_phone
from customer;

-- 15). Count customers by country and filter only those with more than 3 customers.
create view customer_count as
select distinct Country, count(*) customer_count from customer
group by Country
having customer_count>3;




