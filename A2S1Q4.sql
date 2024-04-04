SELECT
    price,
    AVG(o.review_score) AS average_customer_rating,
    COUNT(review_id)
FROM ml_products_dataset AS p 
    JOIN ml_product_category_name_translation USING(product_category_name)
	JOIN ml_order_items_dataset AS oi USING(product_id)
	JOIN ml_order_reviews_dataset AS o USING(order_id)
    WHERE product_category_name_english LIKE '%furniture%' 
GROUP BY price
ORDER BY price DESC; 