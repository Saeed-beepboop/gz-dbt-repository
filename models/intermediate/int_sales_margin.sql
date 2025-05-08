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
FROM {{ ref("stg_raw__sales")}}
LEFT JOIN {{ ref("stg_raw__product")}} USING (products_id)