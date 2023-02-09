{{ config (materialized = 'incremental', database = 'QWT_Analytics', schema = 'Staging', unique_key = ['OrderID', 'LineNo'] ) }}

select 
OrderID,
LineNo,
ProductID,
Quantity,
UnitPrice,
Discount,
Load_date

from QWT_RAW.QWT_Data.order_details

 {% if is_incremental() %}

where Load_date > (select max(Load_date) from {{ this }})

{% endif %}