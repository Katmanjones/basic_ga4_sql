SELECT
  #event_date,
  #event_name,
  geo.country,
  #platform,
  #device.category,
  #device.mobile_brand_name,
  #device.operating_system,
  COUNT(DISTINCT (SELECT value.int_value FROM UNNEST(event_params) WHERE key = 'ga_session_id')) AS count_unique_sessions

FROM `measurelab-ga4.analytics_217052535.events_*`

WHERE _TABLE_SUFFIX BETWEEN '20221101' AND '20221107'
  AND geo.country IN ('United Kingdom', 'United States', 'India')

GROUP BY 1
