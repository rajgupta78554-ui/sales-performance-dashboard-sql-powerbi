CREATE DATABASE sales_project;
USE sales_project;

CREATE TABLE orders (
    order_id TEXT,
    date DATE,
    status TEXT,
    category TEXT,
    qty INT,
    amount FLOAT,
    ship_state TEXT,
    ship_city TEXT
);

SELECT SUM(amount) AS total_revenue
FROM sample_data_clean;

SELECT COUNT(*) AS total_orders
FROM sample_data_clean ;

select category, sum(amount) as revenue
from sample_data_clean
group by category 
order by revenue desc;

describe sample_data_clean;

ALTER TABLE sample_data_clean
CHANGE `ship-state` ship_state TEXT;

ALTER TABLE sample_data_clean
CHANGE `ship-city` ship_city TEXT;

select ship_state, sum(amount) as revenue 
from sample_data_clean
group by ship_state
order by revenue desc;

SELECT DATE_FORMAT(date, '%Y-%m') AS month,
       SUM(amount) AS revenue
FROM sample_data_clean
GROUP BY month
ORDER BY month;

select count(case when status= 'Cancelled' then 1 end ) *100 / count(*) as Cancellation_Rate 
from sample_data_clean;

SELECT SUM(status = 'Cancelled') * 100 / COUNT(*) AS Cancellation_Rate
FROM sample_data_clean;


select ship_city, sum(amount) as revenue
from sample_data_clean
group by ship_city
order by revenue desc limit 5;

select avg(amount) as avg_order_value 
from sample_data_clean;

select sum(amount)/count(*) as avg_order_value
from sample_data_clean;

select * from sales_project.cleaned_data
