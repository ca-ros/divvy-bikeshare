SELECT 
  DISTINCT ride_id, 
  start_lat, 
  start_lng, 
  start_station_id, 
  start_station_name 
FROM bike_trips.trips_p2
WHERE start_station_name IS NULL

SELECT COUNT(*) 
FROM bike_trips.trips_p2
WHERE (start_station_name IS NULL 
AND start_station_id IS NULL)
OR (end_station_name IS NULL
AND end_station_id IS NULL)
-- 1158190 null records

SELECT COUNT(*)
FROM bike_trips.trips_p2
-- 9136746

SELECT 
 (SELECT CAST(COUNT(*) AS numeric) 
  FROM bike_trips.trips_p2
  WHERE (start_station_name IS NULL 
  AND start_station_id IS NULL)
  OR (end_station_name IS NULL
  AND end_station_id IS NULL)
  ) /	
 (SELECT CAST(COUNT(*) AS numeric)
  FROM bike_trips.trips_p2) * 100 AS omitted_data

-- finding the percent of omiited data
SELECT round(100 * 
 (SELECT CAST(COUNT(*) AS numeric) 
  FROM bike_trips.trips_p2
  WHERE (start_station_name IS NULL 
  AND start_station_id IS NULL)
  OR (end_station_name IS NULL
  AND end_station_id IS NULL)
  ) /	
 (SELECT CAST(COUNT(*) AS numeric)
  FROM bike_trips.trips_p2)
			 , 2) AS omitted_data_percent



SELECT * FROM bike_trips.trips_p2
WHERE start_station_name = 'WEST CHI-WATSON'

SELECT * FROM bike_trips.trips_p2
WHERE start_station_name = 'WATSON TESTING - DIVVY'

