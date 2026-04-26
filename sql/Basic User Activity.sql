select
fullVisitorId as user_id,
visitStartTime,
DATE(TIMESTAMP_SECONDS(visitStartTime)) AS date,
totals.pageviews,
totals.transactions
from `bigquery-public-data.google_analytics_sample.ga_sessions_*`
where _TABLE_SUFFIX BETWEEN '20170301' and '20170331'