SELECT MONTH(won_date), declared_monthly_revenue
FROM ml_closed_deals_dataset
GROUP BY MONTH(won_date)
ORDER BY MONTH(won_date)

SELECT DISTINCT MONTH(won_date) FROM ml_closed_deals_dataset