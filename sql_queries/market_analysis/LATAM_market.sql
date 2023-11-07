with LATAM_market as (select * 
from dataco_project.cleaned_dataco_product_recategorized
where market = 'latam')

-- Top 10 most popular product by each market with the average of quantieties purchases
select 
    product_name
    ,count(*) as number_of_transactions
    ,round(sum(sales), 2) as tota_sales
    ,round(avg(sales), 2)as average_sales
    ,avg(order_item_quantity) as average_quantity_purchased
from LATAM_market
group by product_name
order by
    number_of_transactions desc 
limit 10
;


-- The Overall Sales trend in 2017
select 
    order_month
    ,round(sum(sales), 2) as total_sales
from LATAM_market
where order_year = 2017
group by order_month
order by order_month asc
;


-- Calculate the number of product that are suspected_fraud in 2015
select 
    order_month
    ,count(product_name) as suspected_fradulence_num
from LATAM_market
where order_year = 2015 and order_status = 'suspect_fraud'
group by order_month 
order by order_month asc
;


-- Analyze the distributio of the customer segment in this period
select customer_segment,count(customer_segment) as customer_distribution
from LATAM_market
where order_year = 2015
group by customer_segment
;


-- The component of the country in market
select distinct
    order_country,count(order_country) as country_distribution
from LATAM_market
where order_year = 2015
group by 1
order by coountry_distribution desc
;


-- See the product category distribution difference between January and Febuary in 2015 and its rate of decrement
select a.category_name_new
    ,(b.category_distribution - a.category_distribution) as number_of_decrement
    ,concat(abs((b.category_distribution - a.category_distribution) / a.category_distribution) * 100, "%") as decrease_rate
from
(
    select distinct 
        category_name_new
        ,count(category_name_new) as category_distribution
    from LATAM_market
    where order_year = 2015 and order_month = 1
    group by 1
) a
left outer join
(
    select distinct 
        category_name_new
        ,count(category_name_new) as category_distribution
    from LATAM_market
    where order_year = 2015 and order_month = 2
    group by 1
) b on a.category_name_new = b.category_name_new
order by number_of_decrement, decrease_rate desc
;


-- Check the component of the product in January and Febuary
select  
    'January' as order_month
    ,category_name_new
    ,product_name
    ,round(product_price, 2) as product_price
    ,sum(order_item_quantity) as total_purchases
    ,round(avg(order_item_quantity), 2) as average_quantity_purchased_per_order
from LATAM_market
where order_year = 2015 and order_month = 1
group by 1, 2, 3, 4
union all 
select  
    'February' as order_month
    ,category_name_new
    ,product_name
    ,round(product_price, 2) as product_price
    ,sum(order_item_quantity) as total_purchases
    ,round(avg(order_item_quantity), 2) as average_quantity_purchased_per_order
from LATAM_market
where order_year = 2015 and order_month = 2
group by 1, 2, 3, 4
order by category_name_new, product_name, total_purchases desc
;


-- Inspect product and its quantity sold between January and Febuary
select 
    coalesce(a.category_name_new, b.category_name_new) as category_name_new
    ,coalesce(a.product_name, b.product_name) as product_name
    ,coalesce(round(a.product_price, 2), round(b.product_price, 2)) as product_price
    ,coalesce(a.total_quantity_purchases, 0) as January_quantity
    ,coalesce(b.total_quantity_purchases, 0) as Febuary_quantity
    ,(coalesce(b.total_quantity_purchases, 0) - coalesce(a.total_quantity_purchases, 0)) as quantity_differences
    ,coalesce(a.total_sales) as January_sales
    ,coalesce(b.total_sales) as February_sales
    ,(coalesce(b.total_sales, 0) - coalesce(a.total_sales, 0)) as sales_differences
from
(
    select 
        'January' as order_month
        ,category_name_new
        ,product_name
        ,product_price
        ,sum(order_item_quantity) as total_quantity_purchases
        ,round(sum(sales), 2) as total_sales
    from LATAM_market
    where order_year = 2015 and order_month = 1
    group by 1, 2, 3, 4
    order by category_name_new, total_quantity_purchases desc
) a
left outer join
(
    select 
        'February' as order_month
        ,category_name_new
        ,product_name
        ,product_price
        ,sum(order_item_quantity) as total_quantity_purchases
        ,round(sum(sales), 2) as total_sales
    from LATAM_market
    where order_year = 2015 and order_month = 2
    group by 1, 2, 3, 4
    order by category_name_new, total_quantity_purchases desc
) b on a.category_name_new = b.category_name_new and a.product_name = b.product_name
order by sales_differences, quantity_differences desc
;


-- Top 10 most popular product in LATAM 2015
select distinct
    category_name_new
    ,product_name
    ,round(product_price, 2)
    ,count(product_name) as product_name_count
from LATAM_market
where order_year = 2015
group by 1, 2, 3
order by product_name_count desc
;


-- Inspect the product distribution of consumer_segment = 'consumer' in 2015
select distinct 
    category_name_new
    ,product_name
    ,product_price
    ,count(*) as num_of_transactions
from LATAM_market
where order_year = 2015 and customer_segment = 'consumer'
group by 1, 2, 3
order by num_of_transactions desc 
;

-- Inspect the product distribution of consumer_segment = 'consumer' in 2017
select distinct 
    category_name_new
    ,product_name
    ,product_price
    ,count(*) as num_of_transactions
from LATAM_market
where order_year = 2015 and customer_segment = 'consumer'
group by 1, 2, 3
order by num_of_transactions desc 
;

-- Top 10 in February
select 
    'February' as order_month
    ,category_name_new
    ,product_name
    ,product_price
    ,sum(order_item_quantity) as total_quantity_purchases
    ,round(sum(sales), 2) as total_sales
from LATAM_market
where order_year = 2015 and order_month = 2
group by 1, 2, 3, 4
order by category_name_new, total_quantity_purchases desc
;

-- Inspect the records in Latam market by month_day in 2017
select distinct 
    concat(order_month, "/", order_day) as month_day
    ,round(sum(sales), 2) as total_sales_by_day
from LATAM_market
where order_year = 2017 and order_month in (1, 6)
group by 1
order by month_day 
;



-- Inspect the records in Latam market by month_day in 2017
select distinct 
    order_month
    ,round(sum(sales), 2) as total_sales_by_day
from LATAM_market
where order_year = 2017 and order_month in (2, 3, 4, 5)
group by 1
order by order_month
;


-- Inspect the records in Latam market by month_day in 2015
select distinct 
    order_month
    ,round(sum(sales), 2) as total_sales_by_day
from LATAM_market
where order_year = 2015 and order_month in (1, 2, 3, 4, 5)
group by 1
order by order_month
;

-- Total Sales and the average benefit_per_order in the market
-- Shipping Mode by different Delivery Status
select distinct 
    shipping_mode
    ,delivery_status
    ,count(delivery_status) as delivery_status_distribution
from LATAM_market
group by 1, 2
order by delivery_status_distribution desc
;


