select distinct 
	concat(market, '&', customer_segment) as 'Market + customer_segment'
    ,product_name,product_price,sales
    ,order_item_discount,order_item_discount_rate,order_item_profit_ratio
    ,`year_month`
    ,avg(benefit_per_order) as average_benefit_per_order
    ,count(*) as 'Distribution'
from dataco_project.datacocleaned
where type = 'TRANSFER' 
	and category_name_new = 'Sports Equipment & Accessories'
	and order_status = 'SUSPECTED_FRAUD'
    and year = '2015'
group by 1,2,3,4,5,6,7,8
;