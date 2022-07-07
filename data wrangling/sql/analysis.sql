-- group by hour
CREATE TABLE bike_trips.analysis AS
SELECT SUM(count) as total_trips, name, date, hour
FROM (
	SELECT 
	  COUNT(start_station_name) as count, 
	  start_station_name as name, 
	  CAST(start_time as date) as date,
	  EXTRACT(HOUR FROM start_time) as hour
	FROM bike_trips.trips
	WHERE trip_duration > 60
	GROUP BY 
	 date, name, hour
	UNION ALL
	SELECT 
	  COUNT(end_station_name) as count, 
	  end_station_name as name, 
	  CAST(start_time as date) as date,
	  EXTRACT(HOUR FROM start_time) as hour
	FROM bike_trips.trips
	WHERE trip_duration > 60
	GROUP BY 
	 date, name, hour
	) as t
GROUP BY name, date, hour
HAVING name IS NOT NULL
ORDER BY date, hour;


