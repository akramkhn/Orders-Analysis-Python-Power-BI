select * from df_orders

-- Find top 10 Highest revenue generating products

select top 10 product_id as product, sum(sale_price) as revenue
from df_orders
group by product_id
order by revenue desc


-- Find top 5 Highest Selling Products in each region


WITH cte as
(SELECT
	region,
	product_id,
	sum(sale_price) as revenue,
	ROW_NUMBER() OVER(PARTITION BY region ORDER BY sum(sale_price) DESC) as ranks
FROM
	df_orders
GROUP BY 
	region, product_id)

SELECT
	region,
	product_id,
	revenue
FROM 
	cte
WHERE ranks < 6



--Find month over month growth comparison for 2022 and 2023 sales eg Jan 2022 vs Jan 2023

with cte as 
(select year(order_date) as Years, datename(month, order_date) as Months, month(order_date) as month_number, sum(sale_price) as sales 
from df_orders
group by year(order_date), datename(month, order_date),  month(order_date)
)

select Months,
	sum(case when Years = 2022 then sales else 0 end) as sales_2022,
	sum(case when Years = 2023 then sales else 0 end) as sales_2023
from cte
group by month_number, Months
order by month_number


-- For each category which month had highest sales

with cte as
(select category, format(order_date, 'yyyyMM') as Months,  sum(sale_price) as sales 
from df_orders
group by category, format(order_date, 'yyyyMM')
)

select * from
(select *,
	row_number() over(partition by category order by sales desc) as rn
from cte) a
where rn = 1



-- Which sub_category had highest growth by profit in 2023 as compared to 2022

with cte as 
(select sub_category, sum(profit) as profit, year(order_date) as years
from df_orders
group by  year(order_date), sub_category),

cte_1 as
(select sub_category,
	sum(case when years = 2022 then profit else 0 end) as profit_22,
	sum(case when years = 2023 then profit else 0 end) as profit_23
from cte
group by sub_category)

select top 1 *,(profit_23 - profit_22)*100/profit_22 as growth
from cte_1
order by (profit_23 - profit_22)*100/profit_22 desc


