 
#1. What are the products that are sold the most? 

SELECT product_category_name_english AS 'product categories', 

COUNT(order_id) AS 'times sold'

FROM ml_product_category_name_translation 

JOIN ml_products_dataset USING(product_category_name) 

JOIN ml_order_items_dataset USING(product_id) 

GROUP BY product_category_name_english 

ORDER BY COUNT(order_id) DESC; 