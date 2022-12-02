SELECT
  (SELECT value.string_value FROM UNNEST(event_params) WHERE key = 'page_title'),
  COUNT(user_pseudo_id) AS count_of_users,
  COUNT(DISTINCT user_pseudo_id) AS count_of_unique_users,
  ROUND(SAFE_DIVIDE(COUNT(user_pseudo_id),COUNT(DISTINCT user_pseudo_id)),2) AS event_count_per_user

FROM `measurelab-ga4.analytics_217052535.events_*` 

WHERE _TABLE_SUFFIX BETWEEN '20221101' AND '20221107'
  AND event_name IN ('screen_view', 'page_view')

GROUP BY 1

ORDER BY 2 DESC
