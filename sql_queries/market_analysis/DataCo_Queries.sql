select distinct 
	market,category_name_new,round(sum(order_item_product_price * (1 - order_item_discount_rate) * order_item_profit_ratio * order_item_quantity),2) as profit_per_category_by_market
from dataco_project.datacocleaned 
where type = 'DEBIT' and order_status = 'COMPLETE'
group by 1,2
union all
select 
	market,category_name_new,round(sum(order_item_product_price * (1 - order_item_discount_rate) * order_item_profit_ratio * order_item_quantity),2) as profit_per_category_by_market
from dataco_project.datacocleaned 
where type = 'DEBIT' and order_status = 'ON_HOLD'
group by 1,2
order by market
;