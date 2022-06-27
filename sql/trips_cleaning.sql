-- Cleaning trips table

-- back-up tables
CREATE TABLE bike_trips.trips_p1_original AS
SELECT * FROM bike_trips.trips_p1;

CREATE TABLE bike_trips.trips_p2_original AS
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


----------------------- trips_p1 -------------------------
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

-- Import csv file
-- id_changes_p1.csv
CREATE TABLE bike_trips.id_changes_p1 (
  old_name varchar, 
  new_id int);
-- Import
COPY bike_trips.id_changes_p1 (old_name, new_id)
FROM 'D:/Github/divvy-bikeshare/csv files/stations/id_changes_p1.csv' 
DELIMITER ',' CSV HEADER;

-- name_changes_p1.csv
-- Create table
CREATE TABLE bike_trips.name_changes_p1 (
  old_name varchar, 
  new_name varchar);
-- Import
COPY bike_trips.name_changes_p1 (old_name, new_name)
FROM 'D:/Github/divvy-bikeshare/csv files/stations/name_changes_p1.csv' 
DELIMITER ',' CSV HEADER;

-- ID change
-- start_station_id
UPDATE bike_trips.trips_p1 as s
SET start_station_id = c.new_id
FROM bike_trips.id_changes_p1 as c
WHERE s.start_station_name = c.old_name;
-- end_station_id
UPDATE bike_trips.trips_p1 as s
SET end_station_id = c.new_id
FROM bike_trips.id_changes_p1 as c
WHERE s.end_station_name = c.old_name;
	
-- Name change
-- trips table
-- start_station_name
UPDATE bike_trips.trips_p1 as s
SET start_station_name = c.new_name
FROM bike_trips.name_changes_p1 as c
WHERE s.start_station_name = c.old_name;

-- end_station_name
UPDATE bike_trips.trips_p1 as s
SET end_station_name = c.new_name
FROM bike_trips.name_changes_p1 as c
WHERE s.end_station_name = c.old_name;
	
--------------------  trips_p2  -----------------------

-- trips_p2
-- Check missing/ dirty data
SELECT t.id, t.name
FROM (
  SELECT DISTINCT start_station_id as id, start_station_name as name 
  FROM bike_trips.trips_p2
  UNION
  SELECT DISTINCT end_station_id as id, end_station_name as name 
  FROM bike_trips.trips_p2) as t
WHERE NOT EXISTS (SELECT id, name
				 FROM bike_trips.stations as s
				 WHERE CAST(s.id AS varchar) = t.id)
UNION
SELECT t.id, t.name
FROM (
  SELECT DISTINCT start_station_name as name, start_station_id as id 
  FROM bike_trips.trips_p2
  UNION
  SELECT DISTINCT end_station_name as name, end_station_id as id 
  FROM bike_trips.trips_p2)as t
WHERE NOT EXISTS (SELECT s.id, s.name
				 FROM bike_trips.stations as s
				 WHERE s.name = t.name);

-- Import csv file
-- id_changes_p2.csv
-- Create table
CREATE TABLE bike_trips.id_changes_p2 (
  old_name varchar,
  new_id varchar);
-- Import
COPY bike_trips.id_changes_p2 (old_name, new_id)
FROM 'D:/Github/divvy-bikeshare/csv files/stations/id_changes_p2.csv' 
DELIMITER ',' CSV HEADER;

-- name_changes_p2.csv
-- Create table
CREATE TABLE bike_trips.name_changes_p2 (
  old_name varchar,
  new_name varchar);
-- Import
COPY bike_trips.name_changes_p2 (old_name, new_name)
FROM 'D:/Github/divvy-bikeshare/csv files/stations/name_changes_p2.csv' 
DELIMITER ',' CSV HEADER NULL 'null';


-- ID change
-- start_station_id
UPDATE bike_trips.trips_p2
SET start_station_id = CASE
  WHEN start_station_id = '13221' THEN '61'
  WHEN start_station_id = '20215' THEN '732'
  WHEN start_station_id = 'WL-008' THEN '57'
  END
WHERE start_station_id IN ('13221', '20215', 'WL-008');

UPDATE bike_trips.trips_p2 as s
SET start_station_id = c.new_id
FROM bike_trips.id_changes_p2 as c
WHERE s.start_station_name = c.old_name;

-- end_station_id
UPDATE bike_trips.trips_p2
SET end_station_id = CASE
  WHEN end_station_id = '13221' THEN '61'
  WHEN end_station_id = '20215' THEN '732'
  WHEN end_station_id = 'WL-008' THEN '57'
  END
WHERE end_station_id IN ('13221', '20215', 'WL-008');

UPDATE bike_trips.trips_p2 as s
SET end_station_id = c.new_id
FROM bike_trips.id_changes_p2 as c
WHERE s.end_station_name = c.old_name; 


-- Name change
-- start_station_name
UPDATE bike_trips.trips_p2
SET start_station_name = CASE
  WHEN start_station_id = '61' THEN 'Wood St & Milwaukee Ave'
  WHEN start_station_id = '732' THEN 'Hegewisch Metra Station'
  WHEN start_station_id = '57' THEN 'Clinton St & Roosevelt Rd'
  END
WHERE start_station_id IN ('61', '732', '57');

UPDATE bike_trips.trips_p2 as s
SET start_station_name = c.new_name
FROM bike_trips.name_changes_p2 as c
WHERE s.start_station_name = c.old_name;

-- end_station_name
UPDATE bike_trips.trips_p2
SET end_station_name = CASE
  WHEN end_station_id = '61' THEN 'Wood St & Milwaukee Ave'
  WHEN end_station_id = '732' THEN 'Hegewisch Metra Station'
  WHEN end_station_id = '57' THEN 'Clinton St & Roosevelt Rd'
  END
WHERE end_station_id IN ('61', '732', '57');

UPDATE bike_trips.trips_p2 as s
SET end_station_name = c.new_name
FROM bike_trips.name_changes_p2 as c
WHERE s.end_station_name = c.old_name;



--------------------- Combine table: trips --------------------

-- trips_p1
-- change data type of column trip_id: numeric to character varying
ALTER TABLE bike_trips.trips_p1
ALTER COLUMN trip_id varchar;
-- rename column trip_id to ride_id
ALTER TABLE bike_trips.trips_p1
RENAME COLUMN trip_id TO ride_id;

-- trips_p2
-- remove columns: start_lat, start_lng, end_lat & end_lng
ALTER TABLE bike_trips.trips_p2
DROP COLUMN start_lat, start_lng, end_lat, end_lng;
-- fill missing data: duration, using start_time and end_time
INSERT INTO bike_trips.trips_p2
SELECT EXTRACT(EPOCH FROM(end_time - start_time))::int as duration 
FROM bike_trips.trips_p2;
-- change data type of column start_station_id & end_station_id: character varying to integer
-- start_station_id
ALTER TABLE bike_trips.trips_p2
ALTER COLUMN start_station_id integer;
-- end_station_id
ALTER TABLE bike_trips.trips_p2
ALTER COLUMN end_station_id integer;

