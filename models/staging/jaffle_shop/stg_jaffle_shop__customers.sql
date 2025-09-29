with customers as (
    select 
        string_field_0 as customer_id,
        split(string_field_1, ' ')[safe_offset(0)] as first_name,
        split(string_field_1, ' ')[safe_offset(1)] as last_name
    from {{ source('jaffle_shop', 'customers') }}
)

select * from customers