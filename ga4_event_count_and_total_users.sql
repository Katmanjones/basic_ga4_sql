SELECT
  event_name,
  COUNT(user_pseudo_id) AS count_of_users,
  COUNT(DISTINCT user_pseudo_id) AS count_of_unique_users,

FROM `measurelab-ga4.analytics_217052535.events_*` 

WHERE _TABLE_SUFFIX BETWEEN '20221101' AND '20221107'

GROUP BY 1
