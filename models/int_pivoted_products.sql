with products as (

    select * from {{ ref('stg_jaffle_shop__products') }}
)

{% set product_types = ['beverage','jaffle']%}

select product_type ,

{% for product_type in product_types %}
{%- if not loop.last -%}
avg(product_price) as {{product_type}}_avg_price,
{% else %}
avg(product_price) as {{product_type}}_avg_price
{%- endif -%}
{% endfor%}

from products
group by 1