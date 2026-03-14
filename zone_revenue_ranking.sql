SELECT
    z.Zone,
    SUM(t.total_amount) AS total_revenue,
    RANK() OVER (ORDER BY SUM(t.total_amount) DESC) AS zone_rank
FROM dbo.yellow_tripdata_2023_01 AS t
JOIN dbo.taxi_zone_lookup AS z
    ON t.PULocationID = z.LocationID
GROUP BY z.Zone
ORDER BY total_revenue DESC;