{{ config (materialized = 'view', database = 'QWT_Analytics', schema = 'Reporting')}}

select * from {{ ref('trf_qwt_employee_snapshot') }}