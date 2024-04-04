#1. What are the most frequently used payment methods? 
SELECT YEAR(order_purchase_timestamp), 
	MONTH(order_purchase_timestamp), 
	ROUND(AVG(DATEDIFF(order_delivered_customer_date,order_purchase_timestamp))) AS delivery_speed, 
	ROUND(payment_value*0.25,2) AS `revenue` 
FROM ml_orders_dataset 
JOIN ml_order_items_dataset USING(order_id) 
JOIN ml_order_payments_dataset USING(order_id)
WHERE order_delivered_customer_date IS NOT NULL 
GROUP BY YEAR(order_purchase_timestamp), MONTH(order_purchase_timestamp) 
ORDER BY YEAR(order_purchase_timestamp), MONTH(order_purchase_timestamp); 