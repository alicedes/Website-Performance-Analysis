#2. Are there any trends between delivery speed and revenue, orders, items sold, or customers?

SELECT (DATE(order_delivered_customer_date)-DATE(order_purchase_timestamp)) AS delivery_speed, declared_monthly_revenue
FROM ml_closed_deals_dataset
LEFT JOIN ml_sellers_dataset USING(seller_id)
LEFT JOIN ml_geolocation_dataset ON geolocation_zip_code_prefix=seller_zip_code_prefix
LEFT JOIN ml_customers_dataset  ON geolocation_zip_code_prefix=customer_zip_code_prefix
LEFT JOIN ml_orders_dataset USING(customer_id)
GROUP BY MONTH(order_purchase_timestamp);

SELECT corr((DATE(order_delivered_customer_date)-DATE(order_purchase_timestamp)), declared_monthly_renvenue)
FROM ml_orders_dataset
JOIN ml_customers_dataset USING(customer_id)
JOIN ml_geolocation_dataset ON geolocation_zip_code_prefix=customer_zip_code_prefix
JOIN ml_sellers_dataset ON geolocation_zip_code_prefix=seller_zip_code_prefix
JOIN ml_closed_deals_dataset USING(seller_id);


SELECT order_purchase_timestamp
FROM ml_orders_datase;
    
SELECT order_delivered_customer_date
FROM ml_orders_dataset;

