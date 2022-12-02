SELECT
  (SELECT value.string_value FROM UNNEST(event_params) WHERE key = 'page_title') AS page_title,
  COUNT(CASE WHEN event_name IN ('screen_view', 'page_view')
             THEN user_pseudo_id
             ELSE NULL
             END) AS count_of_users,
  COUNT(DISTINCT 
       (CASE WHEN event_name IN ('screen_view', 'page_view')
             THEN user_pseudo_id
             ELSE NULL
             END)) AS count_of_unique_users,
  ROUND(SAFE_DIVIDE(COUNT(CASE WHEN event_name IN ('screen_view', 'page_view')
                              THEN user_pseudo_id
                              ELSE NULL
                              END),
                    COUNT(DISTINCT 
                        (CASE WHEN event_name IN ('screen_view', 'page_view')
                              THEN user_pseudo_id
                              ELSE NULL
                              END))),2) AS event_count_per_user,
  COUNT(user_pseudo_id) AS count_of_all_events

FROM `measurelab-ga4.analytics_217052535.events_*` 

WHERE _TABLE_SUFFIX BETWEEN '20221101' AND '20221107'

GROUP BY 1

ORDER BY 2 DESC
