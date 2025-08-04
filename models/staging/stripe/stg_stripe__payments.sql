select 
id as payment_id,
orderid as order_id,
paymentmethod,
status,
round(amount / 100.0, 2) as amount,
created as created_at,
_batched_at as batched_at


 from {{ source('stripe', 'payment') }}
