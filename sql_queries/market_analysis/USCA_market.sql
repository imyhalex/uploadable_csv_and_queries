with USCA_market as (select * 
from dataco_project.cleaned_dataco_product_recategorized
where market = 'usca')

-- Top 10 most popular product by each market with the average of quantieties purchases
select 
    product_name
    ,count(*) as number_of_transactions
    ,avg(order_item_quantity) as average_quantity_purchased
from USCA_market
group by product_name
order by
    number_of_transactions desc 
limit 10;



-- Shipping Mode by different Delivery Status
select distinct 
    shipping_mode
    ,delivery_status
    ,count(delivery_status) as delivery_status_distribution
from USCA_market
group by 1, 2
order by delivery_status_distribution desc
;
