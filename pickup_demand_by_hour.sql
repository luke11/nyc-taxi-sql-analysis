SELECT
    payment_type,
    COUNT(*) AS ride_count
FROM dbo.yellow_tripdata_2023_01
GROUP BY payment_type
ORDER BY ride_count DESC;