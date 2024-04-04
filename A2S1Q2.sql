#2. Perform a revenue analysis that details quarterly and monthly trends. Describe if any. 

USE mban_a2v2_fall23; 

SELECT  
	year, 
	CONCAT('Q', QUARTER(CONCAT(year, '-', month, '-01'))) AS quarter, 
    ROUND((SUM(payment_value)),2) / 0.25 AS revenue 
FROM ( 
    SELECT  
        opd.order_id, 
        SUBSTR(oid.shipping_limit_date, 1, 4) AS year, 
        SUBSTR(oid.shipping_limit_date, 6, 2) AS month, 
        opd.payment_value 
    FROM  
        ml_order_payments_dataset AS opd 
    JOIN  
        ml_order_items_dataset AS oid 
    ON  
        opd.order_id = oid.order_id 
) AS SUBQUERY 
GROUP BY  
    year, quarter 
ORDER BY  
    year,quarter; 