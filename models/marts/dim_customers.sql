-- models/marts/dim_customers.sql

with customers as (
    select 
        customer_id,
        first_name,
        last_name 
    from {{ ref('stg_jaffle_shop__customers') }}
),

orders as (
    select
        customer_id,
        ordered_at
    from {{ ref('stg_jaffle_shop__orders') }}
),

customer_first_order_date as (
    select 
        orders.customer_id,
        min(orders.ordered_at) as first_order_date,
        count(*) as lifetime_order_count
    from orders
    group by orders.customer_id
),

final as (
    select 
        customers.customer_id,
        customers.first_name,
        customers.last_name,
        customer_first_order_date.first_order_date,
        customer_first_order_date.lifetime_order_count
    from customers
    left join customer_first_order_date 
        on customers.customer_id = customer_first_order_date.customer_id
)

select * from final