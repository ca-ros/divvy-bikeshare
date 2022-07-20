CREATE OR REPLACE FUNCTION table_parts(trips_part varchar(30))
  RETURNS VOID
  LANGUAGE plpgsql AS
$func$
BEGIN
  EXECUTE format('
    CREATE TABLE IF NOT EXISTS %I (
      trip_id bigint, 
      start_time timestamp without time zone, 
      end_time timestamp without time zone, 
      bike_id int, 
      trip_duration int, 
      start_station_id int, 
      start_station_name varchar(50), 
      end_station_id int, 
      end_station_name varchar(50), 
      user_type text, 
      gender text, 
      birth_year int
      )', 'trips_' || trips_part);
END
$func$;

SELECT table_parts('success')
