SELECT
    COUNT(*) AS total_trips,
    AVG(total_amount) AS avg_revenue_per_trip,
    AVG(total_amount / NULLIF(trip_distance, 0)) AS avg_revenue_per_mile,
    AVG(tip_amount / NULLIF(fare_amount, 0)) * 100 AS avg_tip_percentage
FROM dbo.yellow_tripdata_2023_01;