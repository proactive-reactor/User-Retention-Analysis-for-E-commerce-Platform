WITH first_visit AS (
  SELECT
    fullVisitorId,
    MIN(DATE(TIMESTAMP_SECONDS(visitStartTime))) AS signup_date
  FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
  GROUP BY fullVisitorId
),

activity AS (
  SELECT
    fullVisitorId,
    DATE(TIMESTAMP_SECONDS(visitStartTime)) AS activity_date
  FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
)

SELECT
  signup_date,
  activity_date,
  COUNT(DISTINCT activity.fullVisitorId) AS retained_users
FROM first_visit
JOIN activity
ON first_visit.fullVisitorId = activity.fullVisitorId
GROUP BY signup_date, activity_date
ORDER BY signup_date, activity_date;