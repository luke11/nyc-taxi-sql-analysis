SELECT
    COUNT(*) AS total_trips,
    SUM(fare_amount) AS total_revenue,
    AVG(fare_amount) AS average_fare,
    AVG(trip_distance) AS average_trip_distance
FROM dbo.yellow_tripdata_2023_01;