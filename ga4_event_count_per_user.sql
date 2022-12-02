SELECT
  event_name,
  COUNT(user_pseudo_id) AS count_of_users,
  COUNT(DISTINCT user_pseudo_id) AS count_of_unique_users,
  ROUND(SAFE_DIVIDE(COUNT(user_pseudo_id),COUNT(DISTINCT user_pseudo_id)),2) AS event_count_per_user

FROM `measurelab-ga4.analytics_217052535.events_*` 

WHERE _TABLE_SUFFIX BETWEEN '20221101' AND '20221107'

GROUP BY 1
