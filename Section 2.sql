#Section 2

#1. What are the most frequently used payment methods?

SELECT payment_type, COUNT(order_id) AS `usage`
FROM ml_order_payments_dataset
GROUP BY payment_type
ORDER BY `usage` DESC;

#2. Are there any trends between delivery speed and revenue, orders, items sold, or customers?
-- part 1
SELECT YEAR(order_purchase_timestamp), MONTH(order_purchase_timestamp), ROUND(AVG(DATEDIFF(order_delivered_customer_date,order_purchase_timestamp))) AS delivery_speed, ROUND(SUM(price)*0.25 - freight_value,2) AS `revenue`
FROM ml_orders_dataset
JOIN ml_order_items_dataset USING(order_id)
WHERE order_delivered_customer_date IS NOT NULL
GROUP BY YEAR(order_purchase_timestamp), MONTH(order_purchase_timestamp)
ORDER BY YEAR(order_purchase_timestamp), MONTH(order_purchase_timestamp);

-- part 2
SELECT YEAR(order_purchase_timestamp), MONTH(order_purchase_timestamp), MAX(DATEDIFF(order_delivered_customer_date, order_purchase_timestamp)) AS max_delivery_speed, MIN(DATEDIFF(order_delivered_customer_date, order_purchase_timestamp)) AS min_delivery_speed,ROUND(AVG(DATEDIFF(order_delivered_customer_date, order_purchase_timestamp))) AS delivery_speed, COUNT(order_id)
FROM ml_orders_dataset
WHERE order_delivered_customer_date IS NOT NULL
GROUP BY YEAR(order_purchase_timestamp), MONTH(order_purchase_timestamp)
ORDER BY YEAR(order_purchase_timestamp), MONTH(order_purchase_timestamp);

-- part 4
SELECT YEAR(order_purchase_timestamp), MONTH(order_purchase_timestamp), ROUND(AVG(DATEDIFF(order_delivered_customer_date,order_purchase_timestamp))) AS delivery_speed, COUNT(customer_id)
FROM ml_orders_dataset
WHERE order_delivered_customer_date IS NOT NULL
GROUP BY YEAR(order_purchase_timestamp), MONTH(order_purchase_timestamp)
ORDER BY YEAR(order_purchase_timestamp), MONTH(order_purchase_timestamp);
#3. Is there a relationship between the number of reviews and the average review score?
SELECT review_creation_date, AVG(review_score) OVER(ORDER BY DATE(review_creation_date)), COUNT(review_id) OVER (ORDER BY DATE(review_creation_date))
FROM ml_order_reviews_dataset
GROUP BY DATE(review_creation_date)
ORDER BY review_creation_date;

#4. What is the average review by product category and customer location (state)?
-- attention some products are reviewed only once or twice
SELECT product_category_name_english AS `product categories`, COUNT(review_id) AS `number of reviews`, AVG(review_score) AS `average review score`
FROM ml_product_category_name_translation
JOIN ml_products_dataset USING(product_category_name)
JOIN ml_order_items_dataset USING(product_id)
JOIN ml_order_reviews_dataset USING(order_id)
GROUP BY product_category_name_english
ORDER BY AVG(review_score) DESC;

SELECT customer_state, COUNT(review_id), AVG(review_score)
FROM ml_customers_dataset
JOIN ml_orders_dataset USING(customer_id)
JOIN ml_order_reviews_dataset USING(order_id)
GROUP BY customer_state;