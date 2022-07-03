SELECT SUM(count) as count, name, year
FROM (
SELECT 
  COUNT(start_station_name) as count, 
  start_station_name as name, 
  EXTRACT(YEAR from start_time) as year
FROM bike_trips.trips 
GROUP BY 
 year,
 start_station_name
UNION ALL
SELECT 
  COUNT(end_station_name) as count, 
  end_station_name as name, 
  EXTRACT(YEAR from start_time) as year
FROM bike_trips.trips 
GROUP BY 
 year,
 end_station_name
) as t
GROUP BY name, year
HAVING name IS NOT NULL
ORDER BY count DESC

