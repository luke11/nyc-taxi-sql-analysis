SELECT TOP 50
    z.Borough,
    z.Zone,
    t.total_amount,
    SUM(t.total_amount) OVER (PARTITION BY z.Borough) AS borough_total_revenue,
    AVG(t.total_amount) OVER (PARTITION BY z.Borough) AS borough_avg_trip_revenue
FROM dbo.yellow_tripdata_2023_01 t
JOIN dbo.taxi_zone_lookup z
    ON t.PULocationID = z.LocationID
ORDER BY borough_total_revenue DESC;