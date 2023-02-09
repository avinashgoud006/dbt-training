{% snapshot trf_qwt_employee_snapshot %}
{{ 
config 
    (
     target_database = 'QWT_Analytics', 
     target_schema = 'Transform',
     unique_key = 'EmpID', 
     strategy = 'timestamp', 
     updated_at = 'Hire_Date'
    )
}}

select * from {{ ref('stg_qwt_employees') }}

{% endsnapshot%}