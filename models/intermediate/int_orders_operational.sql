-- Operational_margin = margin + shipping_fee - log_cost - ship_cost

SELECT
ord.orders_id
,ord.date_date
,ord.revenue
,ord.quantity
,ord.purchase_cost
,ord.margin
,ROUND(ord.margin + ship.shipping_fee - ship.logcost - ship.ship_cost,2) AS operational_margin
,ship.shipping_fee
,ship.logcost
,ship.ship_cost
FROM {{ ref("int_orders_margin")}} AS ord
LEFT JOIN {{ ref("stg_raw__ship")}} AS ship USING(orders_id)
ORDER BY orders_id DESC