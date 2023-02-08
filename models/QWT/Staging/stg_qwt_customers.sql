{{config (materialized = 'table',Database="QWT_RAW",schema='Staging') }}

select *
from QWT_RAW.QWT_DATA.CUSTOMERS