SELECT
  #event_date,
  event_name,
  #geo.country,
  #platform,
  #device.category,
  #device.mobile_brand_name,
  #device.operating_system,
  COUNT(DISTINCT user_pseudo_id) AS count_unique_users

FROM `measurelab-ga4.analytics_217052535.events_*` 

WHERE _TABLE_SUFFIX BETWEEN '20221101' AND '20221107'
  AND (SELECT value.int_value FROM UNNEST(event_params) WHERE key = 'ga_session_number') = 1

GROUP BY 1
