with orders as (
    select
      order_id,
      customer_id
    from
      {{ ref('stg_orders') }} 
),

payments as (
    select
      order_id,
      amount
    from
      {{  ref('stg_payments')}}

),

fct_orders as (
    select
      orders.customer_id,
      orders.order_id,
      payments.amount
    from orders
    left join payments using (order_id)
)

select * from fct_orders