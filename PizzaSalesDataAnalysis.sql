---To Fetch The All Data----------------------------------------------------

select * from pizza_sales



---To Find The Total_Price  / Total_Revenue of the the Pizza Orers----------------------------------

select sum(total_price) as Total_Revenue_of_PizzaSales  from pizza_sales



---- To Find The Avg Order Value---------------------------------------------------------

select sum(total_price) / count(distinct order_id) as Avg_OrderValue from pizza_sales



----------To Find Total Pizza_Sales-------------------------------------------------------------

select sum(quantity) as Total_Pizza_Sold from pizza_sales



-------To Find Total Number Of Orders---------------------------------------------

select count(distinct order_id) from pizza_sales



-------Avg Pizzas Per Order----------------------------------------

select cast(cast (sum(quantity) as decimal (10,2))/
cast(count(distinct order_id) as decimal (10,2))
as decimal (10,2))as Avg_pizzas_PerOrder from pizza_sales



-----------------------------To Find The Total Order as Per Day-----------------------------------

select datename(DW,order_date) as Order_Day ,count(distinct order_id) as Total_Order from pizza_sales
group by datename(DW,order_date)



-------------------To Find The Total Order as Per Month---------------------------------------------

select datename(month,order_date) as Order_PerMonth,count(distinct order_id) as Total_Order from pizza_sales 
group by datename(month,order_date)



------------------------------------To Find The Total Sales as Per Pizza Category and % of Total Sales------------

select pizza_category,sum(total_price)as Total_Sales, sum(total_price)*100/ (select sum(total_price) from pizza_sales
where month (order_date)=1) 
as Per_of_Total_Sales from pizza_sales where month (order_date)=1
group by pizza_category



--------------------------------------To Find The Total Sales as Per Pizza_Size and % of Total Sales--------------

select pizza_size,cast(sum(total_price) as decimal (10,2))as Total_Sales , cast(sum(total_price)*100/(select sum(total_price) from pizza_sales
where datepart(quarter,order_date)=1) as decimal (10,2))
as Per_of_Total_Sales from pizza_sales where datepart(quarter,order_date)=1 ---Here 1 means january!
group by pizza_size order by pizza_size asc



--------------------------------------To Find The Total Sales as Per Pizza_Name Under Top 5/Bottom---------------------------------------

select top 5 pizza_name ,sum(total_price)as Total_Sales_PerName from pizza_sales group by pizza_name order by Total_Sales_PerName desc

select top 5 pizza_name ,sum(total_price)as Total_Sales_PerName from pizza_sales group by pizza_name order by Total_Sales_PerName asc



-------------------------------To Find The Total Quantity as Per Pizza_Name Under Top 5/Bottom-------------------

select top 5 pizza_name ,sum(quantity)as Total_Quantity from pizza_sales group by pizza_name order by Total_Quantity asc

select top 5 pizza_name ,sum(quantity)as Total_Quantity from pizza_sales group by pizza_name order by Total_Quantity desc



-----------------------------------To Find The Total Orders as Per Pizza_Name Under Top 5/Bottom------------------------------

select top 5 pizza_name ,count(distinct order_id)as Total_Orders from pizza_sales group by pizza_name order by Total_Orders desc

select top 5 pizza_name ,count(distinct order_id)as Total_Orders from pizza_sales group by pizza_name order by Total_Orders asc

