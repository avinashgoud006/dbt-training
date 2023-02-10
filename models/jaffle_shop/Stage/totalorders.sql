{{config (materialized = 'view',schema='Stage') }}

select * 
from
{{ metrics.calculate(
    metric('total_orders'), grain = 'month', dimensions = ['status']
)
}}