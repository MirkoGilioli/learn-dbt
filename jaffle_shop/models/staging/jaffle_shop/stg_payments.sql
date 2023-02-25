with payments as (
    select
      id as payment_id,
      order_id,
      payment_method,
      amount
    from {{ source('jaffle_shop', 'payments') }}
)

select * from payments
