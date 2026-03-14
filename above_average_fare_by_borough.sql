SELECT TOP 100
    t.tpep_pickup_datetime,
    z.Borough,
    z.Zone,
    t.fare_amount,
    t.total_amount
FROM dbo.yellow_tripdata_2023_01 t
JOIN dbo.taxi_zone_lookup z
    ON t.PULocationID = z.LocationID
WHERE t.fare_amount > (
    SELECT AVG(t2.fare_amount)
    FROM dbo.yellow_tripdata_2023_01 t2
    JOIN dbo.taxi_zone_lookup z2
        ON t2.PULocationID = z2.LocationID
    WHERE z2.Borough = z.Borough
)
ORDER BY t.fare_amount DESC;