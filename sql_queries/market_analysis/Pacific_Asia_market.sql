with Pacific_Asia_market as (select * 
from dataco_project.cleaned_dataco_product_recategorized
where market = 'pacific asia')

-- Top 10 most popular product by each market with the average of quantieties purchases
select 
    product_name
    ,count(*) as number_of_transactions
    ,avg(order_item_quantity) as average_quantity_purchased
from Paficic_Asia_market
group by product_name
order by
    number_of_transactions desc 
limit 10;


-- The component of the country in market
select distinct
    order_country,count(order_country) as country_distribution
from Pacific_Asia_market
where order_year = 2015
group by 1
;