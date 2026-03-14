SELECT TOP 10
    p.Zone AS pickup_zone,
    d.Zone AS dropoff_zone,
    COUNT(*) AS route_count
FROM dbo.yellow_tripdata_2023_01 AS t
JOIN dbo.taxi_zone_lookup AS p
    ON t.PULocationID = p.LocationID
JOIN dbo.taxi_zone_lookup AS d
    ON t.DOLocationID = d.LocationID
GROUP BY
    p.Zone,
    d.Zone
ORDER BY
    route_count DESC;