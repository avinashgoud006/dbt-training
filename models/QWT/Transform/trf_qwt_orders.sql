{{ 
config ( materialized = 'table', database = 'QWT_Analytics', schema = 'Transform') 
}}

with orders as 
(
  select *  from {{ ref('stg_qwt_orders') }}
), 

orderdetails as 
(
  select * from {{ ref('stg_qwt_order_details') }}
), 

final as 
(
select
orders.OrderID, 
orders.OrderDate, 
orders.CustomerID, 
orders.EmployeeID, 
orders.ShipperID, 
orders.Freight, 
( orderdetails.UnitPrice * orderdetails.Quantity * (1 - orderdetails.Discount)) as LineSalesAmount
from 
orders 
left join 
orderdetails 
using (OrderID)
) 

select *  from final