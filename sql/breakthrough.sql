SELECT
  trip_id,
  bike_id,
  start_time,
  end_time,
  trip_duration,
  start_station_id,
  start_station_name,
  end_station_id,
  end_station_name,
  user_type,
  gender,
  birthyear
FROM bike_trips.trips_p1_test
UNION ALL
SELECT
  ride_id as trip_id,
  rideable_type as ride_type,
  start_time,
  end_time,
  EXTRACT(EPOCH FROM(end_time - start_time))::int as duration,
  CAST(start_station_id as int) as start_station_id,
  start_station_name,
  CAST(end_station_id as int) as end_station_id,
  end_station_name,
  user_type
FROM bike_trips.trips_p2_test
  
  
  
SELECT (end_time - start_time) as duration FROM bike_trips.trips_p2
WHERE ride_id = 'EACB19130B0CDA4A'

-- extracting duration
SELECT EXTRACT(EPOCH FROM(end_time - start_time))::int as duration FROM bike_trips.trips_p2
WHERE ride_id = 'EACB19130B0CDA4A'


SELECT *
FROM (
	SELECT DISTINCT start_station_name as name, start_station_id as id
	FROM bike_trips.trips_p1_test
	UNION
	SELECT DISTINCT end_station_name as name, end_station_id as id
	FROM bike_trips.trips_p1_test) as t
WHERE t.id = 360


CREATE TABLE bike_trips.stations_original AS
SELECT * FROM bike_trips.stations




