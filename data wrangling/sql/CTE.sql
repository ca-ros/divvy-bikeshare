WITH distinct_stations (id, name) AS
  (SELECT DISTINCT start_station_id as id, start_station_name as name 
  FROM bike_trips.trips_p1
  UNION
  SELECT DISTINCT end_station_id as id, end_station_name as name
  FROM bike_trips.trips_p)
  
SELECT * FROM cte_stations
WHERE

