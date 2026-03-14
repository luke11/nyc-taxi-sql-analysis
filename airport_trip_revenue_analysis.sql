SELECT
    SUM(CASE WHEN airport_fee > 0 THEN total_amount ELSE 0 END) AS airport_trip_revenue,
    SUM(CASE WHEN airport_fee = 0 OR airport_fee IS NULL THEN total_amount ELSE 0 END) AS non_airport_trip_revenue,

    COUNT(CASE WHEN airport_fee > 0 THEN 1 END) AS airport_trip_count,
    COUNT(CASE WHEN airport_fee = 0 OR airport_fee IS NULL THEN 1 END) AS non_airport_trip_count
FROM dbo.yellow_tripdata_2023_01;