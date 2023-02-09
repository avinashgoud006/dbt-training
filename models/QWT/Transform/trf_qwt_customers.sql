{{ config (materialized = 'table', database = 'QWT_Analytics', schema = 'Transform')}}

with customers as 
(
	select 
		CUSTID as CustomerID, 
		COMPANYNAME as CompanyName, 
		CONTACTNAME as ContactName, 
		CITY, 
		COUNTRY, 
		DIVID as DivisionID, 
		ADDRESS, 
		FAX, 
		PHONE, 
		POSTALCODE, 
		STATEPRO as StateProvince
	from {{ ref('stg_qwt_customers') }}
),

divisions as 
(
	select * 
	from QWT_ANALYTICS.STAGING.STG_QWT_DIVISIONS
),

final as 
(
    select
        customers.CustomerID ,
        customers.CompanyName ,
        customers.ContactName ,
        customers.City , 
        customers.Country ,
        customers.DivisionID ,
        customers.Address ,
        customers.Fax ,
        customers.Phone ,
        customers.PostalCode ,
        customers.StateProvince,
        divisions.DivisionName
    from customers
    left join 
    divisions 
    using (DivisionID)
)

select * from final