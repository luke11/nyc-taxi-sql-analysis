SELECT
    z.Zone,
    SUM(t.total_amount) AS total_revenue,
    ROW_NUMBER() OVER (ORDER BY SUM(t.total_amount) DESC) AS row_num,
    DENSE_RANK() OVER (ORDER BY SUM(t.total_amount) DESC) AS dense_rank_num
FROM dbo.yellow_tripdata_2023_01 t
JOIN dbo.taxi_zone_lookup z
    ON t.PULocationID = z.LocationID
GROUP BY z.Zone
ORDER BY total_revenue DESC;