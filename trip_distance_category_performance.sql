SELECT
    CASE
        WHEN trip_distance < 1 THEN 'Short Trip'
        WHEN trip_distance >= 1 AND trip_distance < 10 THEN 'Medium Trip'
        ELSE 'Long Trip'
    END AS trip_category,
    COUNT(*) AS total_trips,
    AVG(total_amount) AS avg_revenue_per_trip,
    AVG(trip_distance) AS avg_trip_distance
FROM dbo.yellow_tripdata_2023_01
GROUP BY
    CASE
        WHEN trip_distance < 1 THEN 'Short Trip'
        WHEN trip_distance >= 1 AND trip_distance < 10 THEN 'Medium Trip'
        ELSE 'Long Trip'
    END
ORDER BY total_trips DESC;