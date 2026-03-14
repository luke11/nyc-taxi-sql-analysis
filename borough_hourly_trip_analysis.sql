SELECT
    z.Borough,
    DATEPART(HOUR, t.tpep_pickup_datetime) AS pickup_hour,
    COUNT(*) AS total_trips,
    AVG(t.total_amount) AS avg_revenue_per_trip
FROM dbo.yellow_tripdata_2023_01 t
JOIN dbo.taxi_zone_lookup z
    ON t.PULocationID = z.LocationID
GROUP BY
    z.Borough,
    DATEPART(HOUR, t.tpep_pickup_datetime)
ORDER BY
    z.Borough,
    pickup_hour;