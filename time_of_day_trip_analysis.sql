SELECT
    CASE
        WHEN DATEPART(HOUR, tpep_pickup_datetime) BETWEEN 5 AND 11 THEN 'Morning'
        WHEN DATEPART(HOUR, tpep_pickup_datetime) BETWEEN 12 AND 16 THEN 'Afternoon'
        WHEN DATEPART(HOUR, tpep_pickup_datetime) BETWEEN 17 AND 21 THEN 'Evening'
        ELSE 'Night'
    END AS time_of_day,
    COUNT(*) AS total_trips,
    AVG(total_amount) AS avg_revenue_per_trip,
    AVG(trip_distance) AS avg_trip_distance
FROM dbo.yellow_tripdata_2023_01
GROUP BY
    CASE
        WHEN DATEPART(HOUR, tpep_pickup_datetime) BETWEEN 5 AND 11 THEN 'Morning'
        WHEN DATEPART(HOUR, tpep_pickup_datetime) BETWEEN 12 AND 16 THEN 'Afternoon'
        WHEN DATEPART(HOUR, tpep_pickup_datetime) BETWEEN 17 AND 21 THEN 'Evening'
        ELSE 'Night'
    END
ORDER BY total_trips DESC;