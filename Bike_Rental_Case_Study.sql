use bike_rental;

drop table if exists customer;
create table customer
(
	id		int primary key,
	name	varchar(30),
	email	varchar(50)
);


drop table if exists bike;
create table bike
(
	id					int primary key,
	model				varchar(50),
	category			varchar(50),
	price_per_hour		decimal,
	price_per_day		decimal,
	status				varchar(20)
);


drop table if exists rental;
create table rental
(
	id					int primary key,
	customer_id			int references customer(id),
	bike_id				int references bike(id),
	start_timestamp		timestamp,
	duration			int,
	total_paid			decimal
);


drop table if exists membership_type;
create table membership_type
(
	id				int primary key,
	name			varchar(50),
	description		varchar(500),
	price			decimal
);


drop table if exists membership;
create table membership
(
	id					int primary key,
	membership_type_id	int references membership_type(id),
	customer_id			int references customer(id),
	start_date			date,
	end_date			date,
	total_paid			decimal
);

INSERT INTO customer (id, name, email)
VALUES 
(1, 'John Doe', 'john.doe@example.com'),
(2, 'Alice Smith', 'alice.smith@example.com'),
(3, 'Bob Johnson', 'bob.johnson@example.com'),
(4, 'Eva Brown', 'eva.brown@example.com'),
(5, 'Michael Lee', 'michael.lee@example.com'),
(6, 'Sarah White', 'sarah.white@example.com'),
(7, 'David Wilson', 'david.wilson@example.com'),
(8, 'Emily Davis', 'emily.davis@example.com'),
(9, 'Daniel Miller', 'daniel.miller@example.com'),
(10, 'Olivia Taylor', 'olivia.taylor@example.com');

INSERT INTO bike (id,model,category,price_per_hour,price_per_day,`status`)
VALUES 
(1, 'Mountain Bike 1', 'mountain bike', 10.00, 50.00, 'available'),
(2, 'Road Bike 1', 'road bike', 12.00, 60.00, 'available'),
(3, 'Hybrid Bike 1', 'hybrid', 8.00, 40.00, 'rented'),
(4, 'Electric Bike 1', 'electric', 15.00, 75.00, 'available'),
(5, 'Mountain Bike 2', 'mountain bike', 10.00, 50.00, 'out of service'),
(6, 'Road Bike 2', 'road bike', 12.00, 60.00, 'available'),
(7, 'Hybrid Bike 2', 'hybrid', 8.00, 40.00, 'out of service'),
(8, 'Electric Bike 2', 'electric', 15.00, 75.00, 'available'),
(9, 'Mountain Bike 3', 'mountain bike', 10.00, 50.00, 'rented'),
(10, 'Road Bike 3', 'road bike', 12.00, 60.00, 'available');

INSERT INTO rental (id,customer_id, bike_id,start_timestamp,duration,total_paid)
VALUES 
(1, 1, 1, '2022-11-01 10:00:00', 240, 50.00),
(2, 1, 1, '2022-11-02 10:00:00', 245, 50.00),
(3, 1, 1, '2022-11-03 10:00:00', 250, 50.00),
(4, 1, 1, '2022-11-04 10:00:00', 235, 50.00),
(5, 1, 1, '2022-12-05 10:00:00', 155, 50.00),
(6, 2, 2, '2022-12-08 11:00:00', 250, 60.00),
(7, 3, 3, '2022-12-13 12:00:00', 245, 40.00),
(8, 1, 1, '2023-01-05 10:00:00', 240, 50.00),
(9, 2, 2, '2023-01-08 11:00:00', 235, 60.00),
(10, 3, 3, '2023-02-13 12:00:00', 245, 40.00),
(11, 1, 1, '2023-03-05 10:00:00', 250, 50.00),
(12, 2, 2, '2023-03-08 11:00:00', 355, 60.00),
(13, 3, 3, '2023-04-13 12:00:00', 240, 40.00),
(14, 1, 1, '2023-04-01 10:00:00', 235, 50.00),
(15, 1, 6, '2023-05-01 10:00:00', 245, 60.00),
(16, 1, 2, '2023-05-01 10:00:00', 250, 60.00),
(17, 1, 3, '2023-06-01 10:00:00', 235, 40.00),
(18, 1, 4, '2023-06-01 10:00:00', 255, 75.00),
(19, 1, 5, '2023-07-01 10:00:00', 240, 50.00),
(20, 2, 2, '2023-07-02 11:00:00', 445, 60.00),
(21, 3, 3, '2023-07-03 12:00:00', 250, 40.00),
(22, 4, 4, '2023-08-04 13:00:00', 235, 75.00),
(23, 5, 5, '2023-08-05 14:00:00', 555, 50.00),
(24, 6, 6, '2023-09-06 15:00:00', 240, 60.00),
(25, 7, 7, '2023-09-07 16:00:00', 245, 40.00),
(26, 8, 8, '2023-09-08 17:00:00', 250, 75.00),
(27, 9, 9, '2023-10-09 18:00:00', 335, 50.00),
(28, 10, 10, '2023-10-10 19:00:00', 255, 60.00),
(29, 10, 1, '2023-10-10 19:00:00', 240, 50.00),
(30, 10, 2, '2023-10-10 19:00:00', 245, 60.00),
(31, 10, 3, '2023-10-10 19:00:00', 250, 40.00),
(32, 10, 4, '2023-10-10 19:00:00', 235, 75.00);


INSERT INTO membership_type (id,`name`,`description`,price)
VALUES 
(1, 'Basic Monthly', 'Unlimited rides with non-electric bikes. Renews monthly.', 100.00),
(2, 'Basic Annual', 'Unlimited rides with non-electric bikes. Renews annually.', 500.00),
(3, 'Premium Monthly', 'Unlimited rides with all bikes. Renews monthly.', 200.00);

INSERT INTO membership (id,membership_type_id,customer_id,start_date,end_date,total_paid)
VALUES 
(1, 2, 3, '2023-08-01', '2023-08-31', 500.00),
(2, 1, 2, '2023-08-01', '2023-08-31', 100.00),
(3, 3, 4, '2023-08-01', '2023-08-31', 200.00),
(4, 1, 1, '2023-09-01', '2023-09-30', 100.00),
(5, 2, 2, '2023-09-01', '2023-09-30', 500.00),
(6, 3, 3, '2023-09-01', '2023-09-30', 200.00),
(7, 1, 4, '2023-10-01', '2023-10-31', 100.00),
(8, 2, 5, '2023-10-01', '2023-10-31', 500.00),
(9, 3, 3, '2023-10-01', '2023-10-31', 200.00),
(10, 3, 1, '2023-11-01', '2023-11-30', 200.00),
(11, 2, 5, '2023-11-01', '2023-11-30', 500.00),
(12, 1, 2, '2023-11-01', '2023-11-30', 100.00);

-- Question 01
-- Emily would like to know how many bikes the shop owns by category. Can
-- you get this for her?
-- Display the category name and the number of bikes the shop owns in
-- each category (call this column number_of_bikes ). Show only the categories
-- where the number of bikes is greater than 2   

select category,count(distinct(model)) as number_of_bikes
from bike
group by category
having number_of_bikes > 2;

-- Question 02
--  Emily needs a list of customer names with the total number of
-- memberships purchased by each.
-- For each customer, display the customer's name and the count of
-- memberships purchased (call this column membership_count ). Sort the
-- results by membership_count , starting with the customer who has purchased
-- the highest number of memberships.
-- Keep in mind that some customers may not have purchased any
-- memberships yet. In such a situation, display 0 for the membership_count .

select c.`name`,count(m.membership_type_id) as membership_count from
customer as c
left join membership as m
on c.id = m.customer_id
group by c.id
order by membership_count desc;

-- Question 03
-- Emily is working on a special offer for the winter months. Can you help her
-- prepare a list of new rental prices?
-- For each bike, display its ID, category, old price per hour (call this column
-- old_price_per_hour ), discounted price per hour (call it new_price_per_hour ), old
-- price per day (call it old_price_per_day ), and discounted price per day (call it
-- new_price_per_day ).
-- Electric bikes should have a 10% discount for hourly rentals and a 20%
-- discount for daily rentals. Mountain bikes should have a 20% discount for
-- hourly rentals and a 50% discount for daily rentals. All other bikes should
-- have a 50% discount for all types of rentals.
-- Round the new prices to 2 decimal digits.

select id,model,category,price_per_hour as old_price_per_hour,
price_per_day as old_price_per_day,
(case when category = "electric" 
	  then round((price_per_hour -(price_per_hour *10/100)),2)
      when category = "mountain bike"
      then round((price_per_hour -(price_per_hour *20/100)),2)
      else round((price_per_hour -(price_per_hour *50/100)),2)
      end) as discounted_price_per_hour,
(case when category = "electric" 
	  then round((price_per_day -(price_per_day *20/100)),2)
      when category = "mountain bike"
      then round((price_per_day -(price_per_day *50/100)),2)
      else round((price_per_day -(price_per_day *50/100)),2)
      end) as discounted_price_per_day
from bike;
      
-- Question 04
-- Emily is looking for counts of the rented bikes and of the available bikes in
-- each category.
-- Display the number of available bikes (call this column
-- available_bikes_count ) and the number of rented bikes (call this column
-- rented_bikes_count ) by bike category.

select category,
sum(case when status = "available" then 1 else 0 end) as available_bikes_count,
sum(case when status = "rented" then 1 else 0 end) as rented_bikes_count
from bike
group by category;

-- Question 05
-- Emily is preparing a sales report. She needs to know the total revenue
-- from rentals by month, the total by year, and the all-time across all the
-- years
-- Display the total revenue from rentals for each month, the total for each
-- year, and the total across all the years. Do not take memberships into
-- account. There should be 3 columns: year , month , and revenue .
-- Sort the results chronologically. Display the year total after all the month
-- totals for the corresponding year. Show the all-time total as the last row

(select year(start_timestamp) as `year`,month(start_timestamp) as `month`,
sum(total_paid) as revenue
from rental 
group by `year`,`month`)
union all
(select year(start_timestamp) as `year`,null as `month`,
sum(total_paid) as revenue
from rental 
group by `year`
)
order by `year`;

-- Question 06
-- Emily has asked you to get the total revenue from memberships for each
-- combination of year, month, and membership type.
-- Display the year, the month, the name of the membership type (call this
-- column membership_type_name ), and the total revenue (call this column
-- total_revenue ) for every combination of year, month, and membership type.
-- Sort the results by year, month, and name of membership type.

select year(mem.start_date) as `year`,month(mem.start_date) as `month`,mem_type.`name`,
sum(mem.total_paid) as Total_Revenue
from membership as mem
join membership_type as mem_type
on mem.membership_type_id = mem_type.id
group by `year`,`month`,mem.membership_type_id;

-- Question 07
-- Next, Emily would like data about memberships purchased in 2023, with
-- subtotals and grand totals for all the different combinations of membership
-- types and months.
-- Display the total revenue from memberships purchased in 2023 for each
-- combination of month and membership type. Generate subtotals and
-- grand totals for all possible combinations. There should be 3 columns:
-- membership_type_name , month , and total_revenue .
-- Sort the results by membership type name alphabetically and then
-- chronologically by month.

(select mem_type.`name` as membership_type_name,month(mem.start_date) as `month`,
sum(mem.total_paid) as Total_Revenue
from membership as mem
join membership_type as mem_type
on mem.membership_type_id = mem_type.id
where year(mem.start_date) = 2023
group by `month`,membership_type_name)
union all
(select concat(mem_type.`name`," Total") as membership_type_name," " as `month`,sum(mem.total_paid) as Total_Revenue
from membership as mem
join membership_type as mem_type
on mem.membership_type_id = mem_type.id
where year(mem.start_date) = 2023
group by membership_type_name)
union all
(select "Grand Total" as membership_type_name," " as `month`,sum(mem.total_paid) as
Total_Revenue
from membership as mem
where year(mem.start_date) = 2023);

-- Question 08
-- Now it's time for the final task.
-- Emily wants to segment customers based on the number of rentals and
-- see the count of customers in each segment. Use your SQL skills to get
-- this!
-- Categorize customers based on their rental history as follows:
-- Customers who have had more than 10 rentals are categorized as 'more
-- than 10' .
-- Customers who have had 5 to 10 rentals (inclusive) are categorized as
-- 'between 5 and 10' .
-- Customers who have had fewer than 5 rentals should be categorized as
-- 'fewer than 5' .
-- Calculate the number of customers in each category. Display two columns:
-- rental_count_category (the rental count category) and customer_count (the
-- number of customers in each category).

with shortcut as (
select customer_id,count(*), 
(case when count(*) > 10 then "more than 10"
	 when count(*) between 5 and 10 then "between 5 and 10"
     when count(*) < 5 then "fewer than 5" end) as Ranking
from rental
group by customer_id)
select ranking as rental_category_count,
count(*) as customer_count 
from shortcut
group by ranking
order by customer_count;








