select
    r.order_id
    ,r.customer_id
    ,r.order_date
    ,coalesce(p.amount,0) as amount
from {{ ref('stg_orders') }} r
left join 
(
    select order_id
    ,sum(amount) amount
    from {{ ref('stg_payments') }}
    where status = 'success'
    group by order_id
)p
on r.order_id = p.order_id
 