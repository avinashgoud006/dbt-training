{{config (materialized = 'table',Database="QWT_ANALYTICS",schema='Staging') }}

select * from QWT_RAW.QWT_DATA.Shipments