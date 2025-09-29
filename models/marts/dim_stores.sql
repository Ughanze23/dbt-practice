with stores as (
    select * from {{ ref('stg_jaffle_shop__location') }}
)

select * from stores