SELECT
    SUM(CASE WHEN payment_type = 1 THEN total_amount ELSE 0 END) AS card_revenue,
    SUM(CASE WHEN payment_type = 2 THEN total_amount ELSE 0 END) AS cash_revenue,
    COUNT(CASE WHEN payment_type = 1 THEN 1 END) AS card_trips,
    COUNT(CASE WHEN payment_type = 2 THEN 1 END) AS cash_trips
FROM dbo.yellow_tripdata_2023_01;