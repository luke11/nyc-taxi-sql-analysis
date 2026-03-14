SELECT TOP 10
    z.Borough,
    z.Zone,
    COUNT(*) AS pickups_tripcount
FROM dbo.yellow_tripdata_2023_01 AS t
JOIN dbo.taxi_zone_lookup AS z
    ON t.PULocationID = z.LocationID
GROUP BY
    z.Borough,
    z.Zone
ORDER BY
    pickups_tripcount DESC;