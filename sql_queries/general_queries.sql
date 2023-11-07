-- Inspect the distribution of the delivery_status
select distinct 
    delivery_status,count(delivery_status) as delivery_status_distribution
from dataco_project.cleaned_dataco_product_recategorized
group by 1
order by delivery_status_distribution desc
;


-- Inspect the distribution of the shipping_mode
select distinct 
    shipping_mode,count(shipping_mode) as shipping_mode_distribution
from dataco_project.cleaned_dataco_product_recategorized
group by 1
order by shipping_mode_distribution desc
;


-- Shipping Mode by different Delivery Status
select distinct 
    shipping_mode
    ,delivery_status
    ,count(delivery_status) as delivery_status_distribution
from dataco_project.cleaned_dataco_product_recategorized
group by 1, 2
order by delivery_status_distribution desc
;


-- Inspect the average late days for each shipping_mode
select distinct 
    shipping_mode
    ,avg((days_for_shipping_real - days_for_shipment_scheduled)) as average_late_days
from dataco_project.cleaned_dataco_product_recategorized
where delivery_status = 'late delivery'
group by 1
order by average_late_days desc
;


-- Most popular product rank (number of transcations) overall: top 20
select distinct 
    product_name
    ,round(product_price, 2) as product_price
    ,count(*) as num_of_transactions
from dataco_project.cleaned_dataco_product_recategorized
group by 1, 2
order by num_of_transactions desc
limit 20
;


-- Most popular product rank (number of transcations) overall with their late days: inspect top 20
select distinct 
    product_name
    ,round(product_price, 2) as product_price
    ,count(*) as num_of_transactions
    ,avg((days_for_shipping_real - days_for_shipment_scheduled)) as product_average_late_days
from dataco_project.cleaned_dataco_product_recategorized
group by 1, 2
order by num_of_transactions desc
limit 20
;


-- Most popular product rank for delivery_status = 'late delivery' (number of transcations) overall: top 20
select distinct 
    product_name
    ,round(product_price, 2) as product_price
    ,count(*) as num_of_transactions
from dataco_project.cleaned_dataco_product_recategorized
where delivery_status = 'late delivery'
group by 1, 2
order by num_of_transactions desc
limit 20
;

-- Most popular product rank for delivery_status = 'late delivery' with thier average late day (number of transcation) overall: top 20
select distinct 
    product_name
    ,round(product_price, 2) as product_price
    ,count(*) as num_of_transactions
    ,avg((days_for_shipping_real - days_for_shipment_scheduled)) as product_average_late_days
from dataco_project.cleaned_dataco_product_recategorized
where delivery_status = 'late delivery'
group by 1, 2
order by num_of_transactions desc
limit 20
;



-- Products distribution within the each shipping mode that are 'late delivery'
select distinct 
    'first class' as shipping_mode
    ,product_name
    ,round(product_price, 2) as product_price
    ,count(*) as num_of_transactions_record
    ,avg((days_for_shipping_real - days_for_shipment_scheduled)) as average_late_days
from dataco_project.cleaned_dataco_product_recategorized
where delivery_status = 'late delivery' and shipping_mode = 'first class'
group by 1, 2, 3
union all 
select distinct 
    'second class' as shipping_mode
    ,product_name
    ,round(product_price, 2) as product_price
    ,count(*) as num_of_transactions_record
    ,avg((days_for_shipping_real - days_for_shipment_scheduled)) as average_late_days
from dataco_project.cleaned_dataco_product_recategorized
where delivery_status = 'late delivery' and shipping_mode = 'second class'
group by 1, 2, 3
union all 
select distinct 
    'standard class' as shipping_mode
    ,product_name
    ,round(product_price, 2) as product_price
    ,count(*) as num_of_transactions_record
    ,avg((days_for_shipping_real - days_for_shipment_scheduled)) as average_late_days
from dataco_project.cleaned_dataco_product_recategorized
where delivery_status = 'late delivery' and shipping_mode = 'standard class'
group by 1, 2, 3
union all 
select distinct 
    'same day' as shipping_mode
    ,product_name
    ,round(product_price, 2) as product_price
    ,count(*) as num_of_transactions_record
    ,avg((days_for_shipping_real - days_for_shipment_scheduled)) as average_late_days
from dataco_project.cleaned_dataco_product_recategorized
where delivery_status = 'late delivery' and shipping_mode = 'same day'
group by 1, 2, 3
order by shipping_mode, average_late_days desc
;


-- Calculate the weighted average late days contributed by each product.
select distinct 
    'second class' as shipping_mode
    ,category_name_new
    ,product_name
    ,round(product_price, 2) as product_price
    ,count(*) as num_of_transactions_record
    ,avg((days_for_shipping_real - days_for_shipment_scheduled)) as average_late_days
    ,(count(*) * avg((days_for_shipping_real - days_for_shipment_scheduled))) / (
        select count(*) from dataco_project.cleaned_dataco_product_recategorized
        where delivery_status = 'late delivery' AND shipping_mode = 'second class'
    ) as weighted_impact
from dataco_project.cleaned_dataco_product_recategorized
where delivery_status = 'late delivery' and shipping_mode = 'second class'
group by 1, 2, 3, 4
order by weighted_impact desc
;


-- Calculate the weighted average late days contributed by each product.
select distinct 
    'standard class' as shipping_mode
    ,category_name_new
    ,product_name
    ,round(product_price, 2) as product_price
    ,count(*) as num_of_transactions_record
    ,avg((days_for_shipping_real - days_for_shipment_scheduled)) as average_late_days
    ,(count(*) * avg((days_for_shipping_real - days_for_shipment_scheduled))) / (
        select count(*) from dataco_project.cleaned_dataco_product_recategorized
        where delivery_status = 'late delivery' AND shipping_mode = 'standard class'
    ) as weighted_impact
from dataco_project.cleaned_dataco_product_recategorized
where delivery_status = 'late delivery' and shipping_mode = 'standard class'
group by 1, 2, 3, 4
order by weighted_impact desc
;


-- Calculate the weighted average late days contributed by each product.
select distinct 
    'first class' as shipping_mode
    ,category_name_new
    ,product_name
    ,round(product_price, 2) as product_price
    ,count(*) as num_of_transactions_record
    ,avg((days_for_shipping_real - days_for_shipment_scheduled)) as average_late_days
    ,(count(*) * avg((days_for_shipping_real - days_for_shipment_scheduled))) / (
        select count(*) from dataco_project.cleaned_dataco_product_recategorized
        where delivery_status = 'late delivery' AND shipping_mode = 'first class'
    ) as weighted_impact
from dataco_project.cleaned_dataco_product_recategorized
where delivery_status = 'late delivery' and shipping_mode = 'first class'
group by 1, 2, 3, 4
order by weighted_impact desc
;


-- Calculate the weighted average late days contributed by each product.
select distinct 
    'same day' as shipping_mode
    ,category_name_new
    ,product_name
    ,round(product_price, 2) as product_price
    ,count(*) as num_of_transactions_record
    ,avg((days_for_shipping_real - days_for_shipment_scheduled)) as average_late_days
    ,(count(*) * avg((days_for_shipping_real - days_for_shipment_scheduled))) / (
        select count(*) from dataco_project.cleaned_dataco_product_recategorized
        where delivery_status = 'late delivery' AND shipping_mode = 'same day'
    ) as weighted_impact
from dataco_project.cleaned_dataco_product_recategorized
where delivery_status = 'late delivery' and shipping_mode = 'same day'
group by 1, 2, 3, 4
order by weighted_impact desc
;


-- Number of Late Delivery per Region
select distinct
    order_region, count(*) as num_of_late_records
from dataco_project.cleaned_dataco_product_recategorized
where delivery_status = 'late delivery'
group by 1
order by num_of_late_records desc 
;


-- Inspect which order_region belongs to which market and customer country
select distinct
    market
    ,order_region
    ,count(*) as num_of_transactions
from dataco_project.cleaned_dataco_product_recategorized
group by 1, 2
order by num_of_transactions
;



-- Numner of Late Delivery per Region
select distinct
    order_region
    ,count(*) as later_delivery_count
from dataco_project.cleaned_dataco_product_recategorized
where delivery_status = 'late delivery'
group by 1
order by later_delivery_count
;

-- Total Sales and the average benefit_per_order overall 
select distinct
    category_name_new
    ,product_name
    ,round(product_price, 2) as product_price
    ,sum(sales) as total_sales
    ,round(avg(benefit_per_order), 2) as average_benefit_per_order
    ,round(avg(order_item_profit_ratio), 2) as average_item_profit_ratio
from dataco_project.cleaned_dataco_product_recategorized
group by 1, 2, 3
order by total_sales desc
;


select year_month, sum(order_profit_per_order) as sum_profit
from dataco_project.cleaned_dataco_product_recategorized
group by 1
order by year_month;
