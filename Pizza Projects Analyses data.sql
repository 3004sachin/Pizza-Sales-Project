



--Total Revenue
select SUM(total_price) as total_revenue from [dbo].[Pizza_sales]

--Avg order values
select SUM(total_price) / count(distinct  order_id) as Avg_order_value from [dbo].[Pizza_sales]
--total unique value in order_id 


--Total Pizzas sold 
select SUM(quantity)  as total_pizzas_sold from [dbo].[Pizza_sales]

--- Total  order by order_id 
select COUNT(distinct order_id) as Total_order from [dbo].[Pizza_sales]

-- avg pizza per order 

select cast(cast(SUM(quantity) as decimal(10,2))  / 
cast(COUNT(distinct order_id )as decimal(10,2))  as decimal(10,2))  as Avg_Pizzas_per_order from [dbo].[Pizza_sales] 

--- daily Trend 
select DATENAME(DW, order_date) as order_day, count(Distinct order_id ) as Total_order
 from [dbo].[Pizza_sales]
group by DATENAME(DW, order_date)

--- Hourly Trend
select DATEPART(hour,order_time) as order_hours,
COUNT(distinct order_id) as total_order from [dbo].[Pizza_sales]
group by  DATEPART(hour,order_time) 
order by  DATEPART(hour,order_time) 

--Monthy Trend 
select  DATENAME(Month,order_date) as Monthy_order,
COUNT(distinct order_id) as total_order from Pizza_sales
group by DATENAME(Month,order_date)
order by  total_order desc


---Percentage of sales by categories :
select 
pizza_category,sum(total_price) as total_sales ,cAST(sum(total_price) * 100 / 
(select sum(total_price) from [dbo].[Pizza_sales])

AS decimal(10,2)) as pct 
from [dbo].[Pizza_sales]
group by pizza_category

--percentage of sales by pizza size
select pizza_size, sum(total_price) as total_sale , cast(SUM(total_price) * 100 / (select sum(total_price)
as total_prize from [dbo].[Pizza_sales]) as decimal(10,2)) as pct
from [dbo].[Pizza_sales] 
group by pizza_size
order by total_sale desc
 
--pizza sold by pizza category
select pizza_category, sum( quantity)  as total_category_qun from [dbo].[Pizza_sales]
group by pizza_category 


---- top 5 best Revenue pizza  by total pizzas sold:
select top 5 pizza_name, cast(SUM(total_price) as decimal(10,2)) as total_price from [dbo].[Pizza_sales]
group by pizza_name
order by total_price desc 

-- top 5 best sellers by total pizzas sold:
select top 5  pizza_name, cast(SUM(quantity) as decimal(10,2)) as total_Pizza_sold from [dbo].[Pizza_sales]
group by pizza_name
order by total_Pizza_sold desc 


--   bottom 5 worst sallers  by total pizzas sold 
select top 5 pizza_name, cast(SUM(quantity) as decimal(10,2)) as total_Pizza_sold from [dbo].[Pizza_sales]
group by pizza_name
order by total_Pizza_sold asc 

--total sales by  Day
select datename(DW,order_Date) as order_day, cast(sum(total_price)  as decimal(10,2)) as total_Sales 
from [Pizza_sales]
group by  datename(DW,order_Date)
order by total_Sales desc

--total order by day 
select DATENAME(dw,order_date) as order_day, COUNT(distinct order_id) as total_order
 from [Pizza_sales]
 group by DATENAME(dw,order_date) 
 order by total_order Desc 