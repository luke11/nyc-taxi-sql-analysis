WITH borough_zone_revenue AS (
    SELECT
        z.Borough,
        z.Zone,
        SUM(t.total_amount) AS total_revenue
    FROM dbo.yellow_tripdata_2023_01 t
    JOIN dbo.taxi_zone_lookup z
        ON t.PULocationID = z.LocationID
    GROUP BY
        z.Borough,
        z.Zone
)

SELECT *
FROM (
    SELECT
        Borough,
        Zone,
        total_revenue,
        RANK() OVER (
            PARTITION BY Borough
            ORDER BY total_revenue DESC
        ) AS borough_rank
    FROM borough_zone_revenue
) ranked
WHERE borough_rank <= 3
ORDER BY Borough, borough_rank;