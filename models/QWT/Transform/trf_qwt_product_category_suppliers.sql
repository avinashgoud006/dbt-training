{{ config(materialized = "table", database = "QWT_Analytics", schema = "Transform") }}

with products as 
(
  select * from {{ ref("stg_qwt_products") }}
), 

categories as 
(
  select * from QWT_ANALYTICS.STAGING.STG_QWT_CATEGORIES
), 

suppliers as 
(
  select * from {{ ref("stg_qwt_suppliers") }}
), 

final as 
(
  select
  products.productid, 
  products.productname, 
  products.supplierid, 
  products.categoryid, 
  products.quantityperunit, 
  products.unitcost, 
  products.unitprice, 
  products.unitsinstock, 
  products.unitsonorder, 
  categories.categoryname, 
  suppliers.companyname
  from 
    products
    	left join 
    categories 
    using (categoryid)
  	  left join 
    suppliers 
    using (supplierid)
) 

select * from final