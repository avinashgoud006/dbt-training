{{config (materialized = 'table',schema='Stage',pre_hook=["insert into ANALYTICS.audit.dbt_audit_logs(execution_start_time, execution_end_time, object_name) values (current_timestamp(),null,'{{this}}')"] ) }}

select
    id as customer_id,
    {{ dbt_utils.generate_surrogate_key(['id']) }} as custhashkey,
    first_name,
    last_name
from raw.jaffle_shop.customers
where customer_id > {{ var('custid','20') }}