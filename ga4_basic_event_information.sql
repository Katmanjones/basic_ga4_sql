SELECT
  event_date,
  event_name,
  TIMESTAMP_MICROS(event_timestamp) AS event_timestamp,
  (SELECT value.int_value FROM UNNEST(event_params) WHERE key = 'ga_session_id') AS session_id,
  user_pseudo_id,
  (SELECT value.int_value FROM UNNEST(event_params) WHERE key = 'ga_session_number') AS session_number,

FROM `measurelab-ga4.analytics_217052535.events_*`

WHERE _TABLE_SUFFIX BETWEEN '20221101' AND '20221107'
  AND user_pseudo_id IS NOT NULL
