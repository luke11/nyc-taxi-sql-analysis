WITH ZoneRevenue AS (
    SELECT
        z.Zone AS pickup_zone,
        SUM(t.fare_amount) AS total_revenue
    FROM dbo.yellow_tripdata_2023_01 AS t
    JOIN dbo.taxi_zone_lookup AS z
        ON t.PULocationID = z.LocationID
    GROUP BY z.Zone
)

SELECT
    pickup_zone,
    total_revenue
FROM ZoneRevenue
ORDER BY total_revenue DESC;