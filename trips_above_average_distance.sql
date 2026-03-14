SELECT
    trip_distance,
    fare_amount,
    total_amount
FROM dbo.yellow_tripdata_2023_01
WHERE trip_distance >
(
    SELECT AVG(trip_distance)
    FROM dbo.yellow_tripdata_2023_01
);