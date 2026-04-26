SELECT
  DATE(TIMESTAMP_SECONDS(visitStartTime)) AS date,
  COUNT(DISTINCT fullVisitorId) AS dau
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
GROUP BY date
ORDER BY date