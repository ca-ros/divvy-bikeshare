## Extracting yearly trip-stations_data

This process is done to create a separate table containing only the station details, such as:
- station_id
- station_name
- city
- latitude
- longitude
- dpcapacity
- landmark
- online_date

The data from year 2013-2017 have already a separate file for stations. So extractions of data from trip_tables are unnecessary.

#### For year 2018-2021

Perform a query for *station_names* & *id* in each year to find duplicate stations by highlighting the values using *Conditional Formatting* in Excel.

Data are **updated** and **corrected** by referring to the [cleaned](insert_link here) data set of [Divvy Bicycle Stations](https://data.cityofchicago.org/Transportation/Divvy-Bicycle-Stations/bbyy-e7gq) from [Chicago Data Portal](https://data.cityofchicago.org/).

Insights:

- landmarks are used instead of the station_name
- full name and abbreviation are mixed e.g. MLK = Martin Luther King
- (Temp) was added in some station_names
- (*) was added in some station_names

```
# start_stations_name
SELECT
  DISTINCT(start_station_id),
  start_station_name
FROM bike_trips.trips_2018
ORDER BY start_station_id;

# save resutls as ../station_tables/2018_start-stations.csv
```

```
# end_stations_name
SELECT
  DISTINCT(end_station_id),
  end_station_name
FROM bike_trips.trips_2018
ORDER BY end_station_id;

# save results as ../station_tables/2018_end-stations.csv
```
Note:

- `from_station` and `to_station` are combined into one(1) excel file
- Duplicate values are highlighted with `RED` using *Conditional Formatting*.
- Correct `station_name` are highlighted with `GREEN`.

Year 2020 & 2021 have a different format in data so I decided to create different groups of stations first for easier cleaning. One file for 2013-2019 and another file for 2020-2021, clean each file then combine them later on.

### Stations table
Cleaned Stations-table file here: [check](link_here) or [download](link_here).

Using **PostgreSQL**
```
# Create table
CREATE TABLE bike_trips.stations (
  id numeric,
  name varchar(50),
  docks int,
  latitude numeric,
  longitude numeric,
  coordinates point
  );
```

```
# Import the csv file
COPY bike_trips.stations (
  id,
  name,
  docks,
  latitude,
  longitude,
  coordinates
);
```


  
