SELECT TOP 20
    t.PULocationID,
    p.Zone AS pickup_zone,
    t.DOLocationID,
    d.Zone AS dropoff_zone
FROM dbo.yellow_tripdata_2023_01 AS t
LEFT JOIN dbo.taxi_zone_lookup AS p
    ON t.PULocationID = p.LocationID
LEFT JOIN dbo.taxi_zone_lookup AS d
    ON t.DOLocationID = d.LocationID;