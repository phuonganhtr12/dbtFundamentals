with payment as 
    (select * from {{ ref("stg_stripe__payments") }})

select payment_id, sum(amount) as total_amount
from payment
group by payment_id
having sum(amount) < 0