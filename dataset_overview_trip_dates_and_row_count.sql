select 
    MIN(tpep_pickup_datetime) AS earliest_trip,
    MAX(tpep_pickup_datetime) AS latest_trip
FROM dbo.yellow_tripdata_2023_01;

SELECT
    COUNT(*) AS total_rows
FROM dbo.yellow_tripdata_2023_01;