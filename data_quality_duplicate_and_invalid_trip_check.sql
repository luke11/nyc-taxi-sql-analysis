
SELECT
    PULocationID,
    DOLocationID,
    tpep_pickup_datetime,
    trip_distance,
    COUNT(*) AS duplicate_count
FROM dbo.yellow_tripdata_2023_01
GROUP BY
    PULocationID,
    DOLocationID,
    tpep_pickup_datetime,
    trip_distance
HAVING COUNT(*) > 1;


SELECT *
FROM dbo.yellow_tripdata_2023_01
WHERE
    trip_distance < 0
    OR fare_amount < 0
    OR total_amount < 0
    OR passenger_count < 0;
