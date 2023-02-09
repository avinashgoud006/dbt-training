{% snapshot orders_snapshot %}

{{ config 
          (
            target_database = 'QWT_ANALYTICS', 
            target_schema = 'SNAPSHOTS', 
            unique_key = 'id', 
            strategy = 'timestamp', 
            updated_at = 'order_date'
            ) 
}}

select * from RAW.JAFFLE_SHOP.ORDERS

{% endsnapshot %}