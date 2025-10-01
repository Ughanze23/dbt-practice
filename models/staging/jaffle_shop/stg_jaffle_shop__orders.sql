{{
    config(
        materialized='incremental',
        unique_key='order_id',
        incremental_strategy='merge'
    )
}}

with orders as (
select id as order_id,
customer as customer_id,
ordered_at,
store_id,
subtotal,
tax_paid,
order_total 
 from {{ source('jaffle_shop', 'orders') }}

)

select * from orders
 {% if is_incremental() %}
    -- this filter will only be applied on an incremental run
    where ordered_at >= (select max(ordered_at) from {{ this }}) 
{% endif %}
order by ordered_at desc
