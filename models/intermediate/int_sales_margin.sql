-- With {{ ref('stg_raw__product')}}

-- margin = revenue - purchase_cost
-- purchase_cost = quantity * purchase_price

SELECT 
products_id
,date_date
,orders_id
,revenue
,quantity
,ROUND(quantity * purchase_price) AS purchase_cost
,ROUND(revenue - ROUND(quantity * purchase_price)) AS margin
,{{ margin_percent('s.revenue', 's.quantity * CAST(p.purchase_price AS FLOAT64)') }} AS margin_percent
FROM {{ ref("stg_raw__sales")}} AS s
LEFT JOIN {{ ref("stg_raw__product")}} AS p USING (products_id)