SELECT
    COUNT(*) AS invalid_trip_count
FROM dbo.yellow_tripdata_2023_01
WHERE
    trip_distance = 0
    OR total_amount < 0
    OR tpep_dropoff_datetime < tpep_pickup_datetime;