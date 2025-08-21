select 
string_field_0 as order_item_id,
string_field_1 as order_id,
string_field_0 as product_id
from  {{ source('jaffle_shop', 'order_items') }}