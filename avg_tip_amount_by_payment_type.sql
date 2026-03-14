SELECT
    CASE payment_type
        WHEN 1 THEN 'Credit Card'
        WHEN 2 THEN 'Cash'
        WHEN 3 THEN 'No Charge'
        WHEN 4 THEN 'Dispute'
        WHEN 5 THEN 'Unknown'
        WHEN 6 THEN 'Voided Trip'
        ELSE 'Other'
    END AS payment_method,
    COUNT(*) AS total_trips,
    AVG(tip_amount) AS avg_tip_amount
FROM dbo.yellow_tripdata_2023_01
GROUP BY payment_type
ORDER BY total_trips DESC;