select distinct 
	concat(market, '&', customer_segment) as 'Market + customer_segment'
    ,count(*) as 'Distribution'
from dataco_project.datacocleaned
where type = 'TRANSFER' 
	and category_name_new = 'Sports Equipment & Accessories'
	and order_status = 'SUSPECTED_FRAUD'
    and year = '2015'
group by 1
;