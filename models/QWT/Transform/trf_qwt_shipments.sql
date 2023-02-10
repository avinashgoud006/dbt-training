
{{ config (materialized = 'table', database = 'QWT_Analytics', schema = 'Transform')}}

with shipments as 
(
    select 
        ORDERID,
        LINENO,
        SHIPPERID,
        CUSTOMERID,  
        PRODUCTID,
        EMPLOYEEID,
        SHIPMENTDATE
    from {{ ref('stg_qwt_shipments') }}
),

shippers as 
(
    select * 
    from QWT_ANALYTICS.STAGING.STG_QWT_SHIPPERS
),

final as 
(
    select
        shipments.ORDERID,
        shipments.LINENO,
        shipments.SHIPPERID,
        shipments.CUSTOMERID,  
        shipments.PRODUCTID,
        shipments.EMPLOYEEID,
        shipments.SHIPMENTDATE,
        shippers.COMPANYNAME
    from shipments
    left join 
    shippers
    using (SHIPPERID)
)

select * from final