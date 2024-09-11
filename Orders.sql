 select * from orders;

--find top 10 highest revenue generating products 
select product_id, sum(sale_price) as sales
from orders
group by product_id
order by sales desc
limit 10;

--find top 5 highest selling products in each region
select distinct(region) from orders;

with cte as (
select region, product_id, sum(sale_price) as sales
from orders
group by region, product_id
)
select * from
(select *, row_number() over(partition by region order by sales desc) as rn from cte)
where rn <=5
;

--find month over month growth comparison for 2022 and 2023 sales eg : jan 2022 vs jan 2023

with cte as(
select extract(year from order_date) as or_year, extract(month from order_date) as or_month, sum(sale_price) as sales
from orders
group by or_year, or_month
)
select or_month,
sum(case when or_year = 2022 then sales else 0 end) as sales_2022,
sum(case when or_year = 2023 then sales else 0 end) as sales_2023
from cte
group by or_month
order by or_month;

--for each category which month had highest sales 
with cte as(
select category, TO_CHAR(order_date, 'yyyy-mm') as year_month, sum(sale_price) as sales
from orders
group by category, year_month
--order by category, year_month
)
select * from(
select *,
row_number() over(partition by category order by sales desc) as rn
from cte
)
where rn = 1;


--which sub category had highest growth by profit in 2023 compare to 2022
with cte as(
select sub_category, extract(year from order_date) as or_year, sum(sale_price) as sales
from orders
group by sub_category, or_year
order by sub_category, or_year
),
cte2 as(
select sub_category, 
sum(case when or_year = 2022 then sales else 0 end) as sales_2022,
sum(case when or_year = 2023 then sales else 0 end) as sales_2023
from cte
group by sub_category
)
select *,
(((sales_2023-sales_2022)/sales_2022)*100) as change
from cte2
order by change desc
limit 1;
















