SELECT
  #event_date,
  #event_name,
  #geo.country,
  #platform,
  device.category,
  #device.mobile_brand_name,
  #device.operating_system,
  COUNT(DISTINCT user_pseudo_id)

FROM `measurelab-ga4.analytics_217052535.events_*`

WHERE _TABLE_SUFFIX BETWEEN '20221101' AND '20221107'

GROUP BY 1
