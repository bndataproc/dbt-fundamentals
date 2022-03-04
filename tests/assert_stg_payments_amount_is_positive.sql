select 
    order_id
    ,sum(amount) as ttl_amt
from {{ ref('stg_payments') }}
group by order_id
having ttl_amt < 0