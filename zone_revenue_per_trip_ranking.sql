WITH zone_base AS (
    SELECT
        z.Borough,
        z.Zone,
        COUNT(*) AS total_trips,
        SUM(t.total_amount) AS total_revenue,
        AVG(t.trip_distance) AS avg_trip_distance
    FROM dbo.yellow_tripdata_2023_01 t
    JOIN dbo.taxi_zone_lookup z
        ON t.PULocationID = z.LocationID
    GROUP BY
        z.Borough,
        z.Zone
),
zone_enriched AS (
    SELECT
        Borough,
        Zone,
        total_trips,
        total_revenue,
        avg_trip_distance,
        total_revenue / NULLIF(total_trips, 0) AS revenue_per_trip
    FROM zone_base
),
zone_ranked AS (
    SELECT
        Borough,
        Zone,
        total_trips,
        total_revenue,
        avg_trip_distance,
        revenue_per_trip,
        RANK() OVER (ORDER BY revenue_per_trip DESC) AS revenue_rank
    FROM zone_enriched
)
SELECT
    Borough,
    Zone,
    total_trips,
    total_revenue,
    avg_trip_distance,
    revenue_per_trip,
    revenue_rank
FROM zone_ranked
ORDER BY revenue_rank;