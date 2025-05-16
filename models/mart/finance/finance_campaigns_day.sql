-- date
-- ads_margin
-- average_basket
-- operational_margin
-- ads_cost
-- ads_impression
-- ads_clicks
-- quantity
-- revenue
-- purchase_cost
-- margin
-- shipping_fee
-- log_cost
-- ship_cost

SELECT
fd.date_date AS date
, (operational_margin - ads_cost) AS ads_margin
, ROUND(average_basket, 2) AS average_basket
, operational_margin
, ads_cost
, ads_impression
, ads_clicks
, quantity
, revenue
, purchase_cost
, margin
, shipping_fees
, logcost AS log_cost
, ship_cost
FROM {{ ref("finance_days")}} AS fd
FULL OUTER JOIN {{ref ('int_campaigns_day')}} AS icd USING (date_date)
ORDER BY fd.date_date DESC