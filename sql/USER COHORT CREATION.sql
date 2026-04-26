WITH
  first_visit AS (
    SELECT
      fullVisitorId,
      MIN(DATE(TIMESTAMP_SECONDS(visitStartTime))) AS signup_date
    FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
    GROUP BY fullVisitorId
  )
  
SELECT * FROM first_visit;