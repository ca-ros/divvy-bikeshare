-- Cleaning trips_p1 & trips_p2 table

-- back-up tables
CREATE TABLE bike_trips.trips_p1_test AS
SELECT * FROM bike_trips.trips_p1;

CREATE TABLE bike_trips.trips_p2_test AS
SELECT * FROM bike_trips.trips_p2;

-- Import Data
-- Create table
CREATE TABLE bike_trips.stations (
  id numeric,
  name varchar,
  docks int,
  latitude numeric,
  longitude numeric,
  coordinate point
);
-- Import csv file
COPY bike_trips.stations (
  id,
  name,
  docks,
  latitude,
  longitude,
  coordinate)
FROM 'D:/Github/divvy-bikeshare/csv files/stations/Divvy_Bicycle_Stations.csv'
DELIMITER ',' CSV HEADER;


-- trips_p1
-- Check missing/ dirty data
SELECT t.id, t.name
FROM (
  SELECT DISTINCT start_station_id as id, start_station_name as name 
  FROM bike_trips.trips_p1
  UNION
  SELECT DISTINCT end_station_id as id, end_station_name as name
  FROM bike_trips.trips_p1) as t
WHERE NOT EXISTS (SELECT id, name
				 FROM bike_trips.stations as s
				 WHERE s.id = t.id)
UNION
SELECT t.id, t.name
FROM (
  SELECT DISTINCT start_station_name as name, start_station_id as id
  FROM bike_trips.trips_p1
  UNION
  SELECT DISTINCT end_station_name as name, end_station_id as id
  FROM bike_trips.trips_p1) as t
WHERE NOT EXISTS (SELECT id, name
				 FROM bike_trips.stations as s
				 WHERE s.name = t.name)


-- trips_p2
-- Check missing/ dirty data
SELECT t.id, t.name
FROM (
  SELECT DISTINCT start_station_id as id, start_station_name as name 
  FROM bike_trips.trips_p2_test
  UNION
  SELECT DISTINCT end_station_id as id, end_station_name as name 
  FROM bike_trips.trips_p2_test) as t
WHERE NOT EXISTS (SELECT id, name
				 FROM bike_trips.stations as s
				 WHERE CAST(s.id AS varchar) = t.id)
UNION
SELECT t.id, t.name
FROM (
  SELECT DISTINCT start_station_name as name, start_station_id as id 
  FROM bike_trips.trips_p2_test
  UNION
  SELECT DISTINCT end_station_name as name, end_station_id as id 
  FROM bike_trips.trips_p2_test)as t
WHERE NOT EXISTS (SELECT s.id, s.name
				 FROM bike_trips.stations as s
				 WHERE s.name = t.name);
				 
-- ID change
-- start_station_id
UPDATE bike_trips.trips_p2_test
SET start_station_id = CASE
  WHEN start_station_id = '13221' THEN '61'
  WHEN start_station_id = '20215' THEN '732'
  WHEN start_station_id = 'WL-008' THEN '57'
  END
WHERE start_station_id IN ('13221', '20215', 'WL-008');

UPDATE bike_trips.trips_p2_test as s
SET start_station_id = c.new_id
FROM bike_trips.id_changes_p2 as c
WHERE s.start_station_name = c.old_name;

-- end_station_id
UPDATE bike_trips.trips_p2_test
SET end_station_id = CASE
  WHEN end_station_id = '13221' THEN '61'
  WHEN end_station_id = '20215' THEN '732'
  WHEN end_station_id = 'WL-008' THEN '57'
  END
WHERE end_station_id IN ('13221', '20215', 'WL-008');

UPDATE bike_trips.trips_p2_test as s
SET end_station_id = c.new_id
FROM bike_trips.id_changes_p2 as c
WHERE s.end_station_name = c.old_name;


-- Name change
-- start_station_name
UPDATE bike_trips.trips_p2_test
SET start_station_name = CASE
  WHEN start_station_id = '61' THEN 'Wood St & Milwaukee Ave'
  WHEN start_station_id = '732' THEN 'Hegewisch Metra Station'
  WHEN start_station_id = '57' THEN 'Clinton St & Roosevelt Rd'
  END
WHERE start_station_id IN ('61', '732', '57');

UPDATE bike_trips.trips_p2_test as s
SET start_station_name = c.new_name
FROM bike_trips.name_changes_p2 as c
WHERE s.start_station_name = c.old_name;

-- end_station_name
UPDATE bike_trips.trips_p2_test
SET end_station_name = CASE
  WHEN end_station_id = '61' THEN 'Wood St & Milwaukee Ave'
  WHEN end_station_id = '732' THEN 'Hegewisch Metra Station'
  WHEN end_station_id = '57' THEN 'Clinton St & Roosevelt Rd'
  END
WHERE end_station_id IN ('61', '732', '57');

UPDATE bike_trips.trips_p2_test as s
SET end_station_name = c.new_name
FROM bike_trips.name_changes_p2 as c
WHERE s.end_station_name = c.old_name;




