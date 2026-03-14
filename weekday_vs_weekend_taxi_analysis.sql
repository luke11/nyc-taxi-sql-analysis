SELECT
    CASE
        WHEN DATENAME(WEEKDAY, tpep_pickup_datetime) IN ('Saturday', 'Sunday') THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type,
    COUNT(*) AS total_trips,
    AVG(total_amount) AS avg_revenue_per_trip,
    AVG(trip_distance) AS avg_trip_distance
FROM dbo.yellow_tripdata_2023_01
GROUP BY
    CASE
        WHEN DATENAME(WEEKDAY, tpep_pickup_datetime) IN ('Saturday', 'Sunday') THEN 'Weekend'
        ELSE 'Weekday'
    END
ORDER BY total_trips DESC;