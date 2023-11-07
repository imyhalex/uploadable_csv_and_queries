with data_2015 as (select * 
from dataco_project.cleaned_dataco_product_recategorized
where order_year = 2015)
,
with data_2016 as (select * 
from dataco_project.cleaned_dataco_product_recategorized
where order_year = 2016)
,
with data_2017 as (select * 
from dataco_project.cleaned_dataco_product_recategorized
where order_year = 2017)


