<h1 align = "center">Data Wrangling</h1>

Data sources:
- [Divvy bikes](https://divvybikes.com), download the raw data-sets [here](https://divvy-tripdata.s3.amazonaws.com/index.html)
- [Chicago Data Portal](https://data.cityofchicago.org/), download the raw stations-table [here](https://data.cityofchicago.org/api/views/bbyy-e7gq/rows.csv?accessType=DOWNLOAD)

<sub>Tool used:</sub>
- *PostgreSQL*
- *RStudio*

<details><summary>Skills applied</summary>
<p>

- Git - version control
- Excel

  - Conditional Formatting
  - Data filter
  - VLOOKUP
  - Pivot table
  - IF/ IFNA
- SQL 

  - CREATE TABLE
  - CREATE DB
  - SELECT DISTINCT
  - UPDATE TABLE
  - HAVING
  - LIKE
  - WILDCARDS
  - ALTER TABLE/ ALTER COLUMN
  - IN
  - CASE
  - CAST
  - EXTRACT: YEAR, EPOCH
  - JOINS
  - UNION
  - SUB QUERY
  - ROUND (percentage)
- R

  -
  -
  -
  -
  -
- googling hard hehe
</p></details>

<h2 align = "center">Table of Contents</h2>

I. [Setting up SQL Environment](https://github.com/56i8/divvy-bikeshare/tree/master/documentations#setting-up-sql-environment)

II. [Combining Data](https://github.com/56i8/divvy-bikeshare/tree/master/documentations#combining-data)

- [2013](https://github.com/56i8/divvy-bikeshare/tree/master/documentations#2013)
- [2014](https://github.com/56i8/divvy-bikeshare/tree/master/documentations#2014)
- [2015](https://github.com/56i8/divvy-bikeshare/tree/master/documentations#2015)
- [2016](https://github.com/56i8/divvy-bikeshare/tree/master/documentations#2016)
- [2017](https://github.com/56i8/divvy-bikeshare/tree/master/documentations#2017)
- [2018](https://github.com/56i8/divvy-bikeshare/tree/master/documentations#2018)
- [2019](https://github.com/56i8/divvy-bikeshare/tree/master/documentations#2019)
- [2020](https://github.com/56i8/divvy-bikeshare/tree/master/documentations#2020)
- [2021](https://github.com/56i8/divvy-bikeshare/tree/master/documentations#2021)

III. [Trips table](https://github.com/56i8/divvy-bikeshare/tree/master/documentations#trips-table)

- [First table: trips_p1](https://github.com/56i8/divvy-bikeshare/tree/master/documentations#first-table-trips_p1)
- [Second table: trips_p2](https://github.com/56i8/divvy-bikeshare/tree/master/documentations#second-table-trips_p2)
- [Combining tables: trips]()

IV. [Stations table]()

- [Cleaning]()


<h2 align = "center">Setting up SQL Environment</h2>

The SQL database that I used in this analysis is [PostgreSQL](https://www.postgresql.org) and I used [pgAdmin 4](https://www.pgadmin.org/download/) as the database tool.

*PgAdmin 4* has a default schema named "Public", it can be seen under Servers > PostgreSQL 14 > Databases > postgres > Schemas > Public.

We need to create another schema named "bike_trips" to compile all our files under it, instead in "public" schema. Follow the steps:

1. *Right click* "Schemas".
2. *Click* "Create".
3. *Click* "Schema".
4. On **Name**, enter "bike_trips".
5. *Click* "Save".

Lastly, to open the **Query Tool** press *ALT + SHIFT + Q*, or click the Query tool icon on the upper-left corner of pgAdmin.

<h2 align = "center">Combining data</h2>

The process of combining all the data into one table as a yearly data and using the **File Naming Convention (FNC)**.

Steps:

1. Download all the data for year 2013 to 2021 [here](https://divvy-tripdata.s3.amazonaws.com/index.html).
2. Download the stations data [here](https://data.cityofchicago.org/api/views/bbyy-e7gq/rows.csv?accessType=DOWNLOAD), this data is from [Chicago Data Portal](https://data.cityofchicago.org/). For this analysis, I will refer to the table as **Stations table**.
3. After extracting the zip files, compile separately all the yearly bike-trips data and the stations data included in that folder. Name the folder as the year it represents.
4. Start compiling the data.
5. For file naming convention, all combined trip-data must named by "year" followed by "-divvy-tripdata.csv"

*Using RStudio*
```r
# load the necessary library

install.library(tidyverse)
library(tidyverse)
```
<h3 align = "center"><strong>2013</strong></h3>

Rename the trip data "Divvy-Trips_2013.csv" to "2013-divvy-tripdata.csv"

Import the csv file into the database.

<sub>*PostgreSQL*</sub>
```sql
-- Create table
CREATE TABLE bike_trips.trips_2013 (
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
  birth_year int);
```

```sql
-- Import csv file
COPY bike_trips.trips_2013 (
  trip_id, 
  start_time, 
  end_time, 
  bike_id, 
  trip_duration, 
  start_station_id, 
  start_station_name, 
  end_station_id, 
  end_station_name, 
  user_type, 
  gender, 
  birth_year) 
FROM 'D:/Github/large csv files/divvy-bikeshare/trips/2013-divvy-tripdata.csv' 
DELIMITER ',' CSV HEADER;
```

<h3 align = "center"><strong>2014</strong></h3>

<sub>*RStudio*</sub>

```r
# Merge 2014_tripdata
df_2014 <- list.files(path="D:/Github/large csv files/divvy-bikeshare/trips/2014", full.names = TRUE) %>% 
  lapply(read_csv) %>% 
  bind_rows 
```

```r
# Export the combined 2014_tripdata
write.csv(df_2014,"D:/Github/large csv files/divvy-bikeshare/trips/2014-divvy-tripdata.csv", row.names = FALSE)
```
> Follow the file naming guideline, file name should be "2014-divvy-tripdata.csv".

Import the csv file into the database.

<sub>*PostgreSQL*</sub>
```sql
-- Create table
CREATE TABLE bike_trips.trips_2014 (
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
  birth_year int);
```

```sql
-- Import csv file
COPY bike_trips.trips_2014 (
  trip_id, 
  start_time, 
  end_time, 
  bike_id, 
  trip_duration, 
  start_station_id, 
  start_station_name, 
  end_station_id, 
  end_station_name, 
  user_type, 
  gender, 
  birth_year) 
FROM 'D:/Github/large csv files/divvy-bikeshare/trips/2014-divvy-tripdata.csv' 
DELIMITER ',' CSV HEADER QUOTE '"' NULL 'NA';
```

<h3 align = "center"><strong>2015</strong></h3>

<sub>*RStudio*</sub>

```r
# Merge 2015_tripdata
df_2015 <- list.files(path="D:/Github/large csv files/divvy-bikeshare/trips/2015", full.names = TRUE) %>% 
  lapply(read_csv) %>% 
  bind_rows 
```

```r
# Export the combined 2015_tripdata
write.csv(df_2015,"D:/Github/large csv files/divvy-bikeshare/trips/2015-divvy-tripdata.csv", row.names = FALSE)
```
> Follow the file naming guideline, file name should be "2015-divvy-tripdata.csv".

Import the csv file into the database.

<sub>*PostgreSQL*</sub>
```sql
-- Create table
CREATE TABLE bike_trips.trips_2015 (
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
  birth_year int);
```

```sql
-- Import csv file
COPY bike_trips.trips_2015 (
  trip_id, 
  start_time, 
  end_time, 
  bike_id, 
  trip_duration, 
  start_station_id, 
  start_station_name, 
  end_station_id, 
  end_station_name, 
  user_type, 
  gender, 
  birth_year) 
FROM 'D:/Github/large csv files/divvy-bikeshare/trips/2015-divvy-tripdata.csv' 
DELIMITER ',' CSV HEADER QUOTE '"' NULL 'NA';
```

<h3 align = "center"><strong>2016</strong></h3>

<sub>*RStudio*</sub>

```r
# Merge 2016_tripdata
df_2016 <- list.files(path="D:/Github/large csv files/divvy-bikeshare/trips/2016", full.names = TRUE) %>% 
  lapply(read_csv) %>% 
  bind_rows 
```

```r
# Export the combined 2016_tripdata
write.csv(df_2016,"D:/Github/large csv files/divvy-bikeshare/trips/2016-divvy-tripdata.csv", row.names = FALSE)
```
> Follow the file naming guideline, file name should be "2016-divvy-tripdata.csv".

Import the csv file into the database.

<sub>*PostgreSQL*</sub>
```sql
-- Create table
CREATE TABLE bike_trips.trips_2016 (
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
  birth_year int);
  ```

```sql
-- Import csv file
COPY bike_trips.trips_2016 (
  trip_id, 
  start_time, 
  end_time, 
  bike_id, 
  trip_duration, 
  start_station_id, 
  start_station_name, 
  end_station_id, 
  end_station_name, 
  user_type, 
  gender, 
  birth_year) 
FROM 'D:/Github/large csv files/divvy-bikeshare/trips/2016-divvy-tripdata.csv' 
DELIMITER ',' CSV HEADER QUOTE '"' NULL 'NA';
```

<h3 align = "center"><strong>2017</strong></h3>

<sub>*RStudio*</sub>

```r
# Merge 2017_tripdata
df_2017 <- list.files(path="D:/Github/large csv files/divvy-bikeshare/trips/2017", full.names = TRUE) %>% 
  lapply(read_csv) %>% 
  bind_rows 
```

```r
# Export the combined 2017_tripdata
write.csv(df_2017,"D:/Github/large csv files/divvy-bikeshare/trips/2017-divvy-tripdata.csv", row.names = FALSE)
```
> Follow the file naming guideline, file name should be "2017-divvy-tripdata.csv".

Import the csv file into the database.

<sub>*PostgreSQL*</sub>
```sql
-- Create table
CREATE TABLE bike_trips.trips_2017 (
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
  birth_year int);
```

```sql
-- Import csv file
COPY bike_trips.trips_2017 (
  trip_id, 
  start_time, 
  end_time, 
  bike_id, 
  trip_duration, 
  start_station_id, 
  start_station_name, 
  end_station_id, 
  end_station_name, 
  user_type, 
  gender, 
  birth_year) 
FROM 'D:/Github/large csv files/divvy-bikeshare/trips/2017-divvy-tripdata.csv' 
DELIMITER ',' CSV HEADER QUOTE '"' NULL 'NA';
```

<h3 align = "center"><strong>2018</strong></h3>

<sub>*RStudio*</sub>

```r
# Merge 2018_tripdata
df_2018 <- list.files(path="D:/Github/large csv files/divvy-bikeshare/trips/2018", full.names = TRUE) %>% 
  lapply(read_csv) %>% 
  bind_rows 
```

```r
# Export the combined 2018_tripdata
write.csv(df_2018,"D:/Github/large csv files/divvy-bikeshare/trips/2018-divvy-tripdata.csv", row.names = FALSE)
```
> Follow the file naming guideline, file name should be "2018-divvy-tripdata.csv".

Import the csv file into the database.

<sub>*PostgreSQL*</sub>
```sql
-- Create table
CREATE TABLE bike_trips.trips_2018 (
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
  birth_year int);
```

```sql
-- Import csv file
COPY bike_trips.trips_2018 (
  trip_id, 
  start_time, 
  end_time, 
  bike_id, 
  trip_duration, 
  start_station_id, 
  start_station_name, 
  end_station_id, 
  end_station_name, 
  user_type, 
  gender, 
  birth_year) 
FROM 'D:/Github/large csv files/divvy-bikeshare/trips/2018-divvy-tripdata.csv' 
DELIMITER ',' CSV HEADER QUOTE '"' NULL 'NA';
```

<h3 align = "center"><strong>2019</strong></h3>

This data set has inconsistent column naming. By using [Notepad++](https://notepad-plus-plus.org/downloads/) to open large datasets, each quarterly files are opened and inspected. We can see that 2019_Q2 table has different column names than the other tables, which will affect the merging process of the csv files. 2019_Q2 column name was matched to the rest of the other quarterly tables.

<sub>*RStudio*</sub>

```r
# Merge 2019_tripdata
df_2019 <- list.files(path="D:/Github/large csv files/divvy-bikeshare/trips/2019", full.names = TRUE) %>% 
  lapply(read_csv) %>% 
  bind_rows 
```

```r
# Export the combined 2019_tripdata
write.csv(df_2019,"D:/Github/large csv files/divvy-bikeshare/trips/2019-divvy-tripdata.csv", row.names = FALSE)
```
> Follow the file naming guideline, file name should be "2019-divvy-tripdata.csv".

Import the csv file into the database.

<sub>*PostgreSQL*</sub>
```sql
-- Create table
CREATE TABLE bike_trips.trips_2019 (
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
  birth_year int);
```

```sql
-- Import csv file
COPY bike_trips.trips_2019 (
  trip_id, 
  start_time, 
  end_time, 
  bike_id, 
  trip_duration, 
  start_station_id, 
  start_station_name, 
  end_station_id, 
  end_station_name, 
  user_type, 
  gender, 
  birth_year) 
FROM 'D:/Github/large csv files/divvy-bikeshare/trips/2019-divvy-tripdata.csv' 
DELIMITER ',' CSV HEADER QUOTE '"' NULL 'NA';
```

<h3 align = "center"><strong>2020</strong></h3>

<sub>*RStudio*</sub>

```r
# Merge 2020_tripdata
df_2020 <- list.files(path="D:/Github/large csv files/divvy-bikeshare/trips/2020", full.names = TRUE) %>% 
  lapply(read_csv) %>% 
  bind_rows 
```

```r
# Export the combined 2020_tripdata
write.csv(df_2020,"D:/Github/large csv files/divvy-bikeshare/trips/2020-divvy-tripdata.csv", row.names = FALSE)
```
> Follow the file naming guideline, file name should be "2020-divvy-tripdata.csv".

Import the csv file into the database.

<sub>*PostgreSQL*</sub>
```sql
-- Create table
CREATE TABLE bike_trips.trips_2020 (
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
  birth_year int);
```

```sql
-- Import csv file
COPY bike_trips.trips_2020 (
  trip_id, 
  start_time, 
  end_time, 
  bike_id, 
  trip_duration, 
  start_station_id, 
  start_station_name, 
  end_station_id, 
  end_station_name, 
  user_type, 
  gender, 
  birth_year) 
FROM 'D:/Github/large csv files/divvy-bikeshare/trips/2020-divvy-tripdata.csv' 
DELIMITER ',' CSV HEADER QUOTE '"' NULL 'NA';
```

<h3 align = "center"><strong>2021</strong></h3>

<sub>*RStudio*</sub>

```r
# Merge 2021_tripdata
df_2021 <- list.files(path="D:/Github/large csv files/divvy-bikeshare/trips/2021", full.names = TRUE) %>% 
  lapply(read_csv) %>% 
  bind_rows 
```

```r
# Export the combined 2021_tripdata
write.csv(df_2021,"D:/Github/large csv files/divvy-bikeshare/trips/2021-divvy-tripdata.csv", row.names = FALSE)
```
> Follow the file naming guideline, file name should be "2021-divvy-tripdata.csv".

Import the csv file into the database.

<sub>*PostgreSQL*</sub>
```sql
-- Create table
CREATE TABLE bike_trips.trips_2021 (
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
  birth_year int);
```

```sql
-- Import csv file
COPY bike_trips.trips_2021 (
  trip_id, 
  start_time, 
  end_time, 
  bike_id, 
  trip_duration, 
  start_station_id, 
  start_station_name, 
  end_station_id, 
  end_station_name, 
  user_type, 
  gender, 
  birth_year) 
FROM 'D:/Github/large csv files/divvy-bikeshare/trips/2021-divvy-tripdata.csv' 
DELIMITER ',' CSV HEADER QUOTE '"' NULL 'NA';
```

Upon checking the structure of the tables in each year, we can notice that 2013-2019 have same data structure, while 2020-2021 have a different type of structure.

Since the type of data from year 2020-2021 is different; where the station_ids are varchar instead of bigint and tables have an additional columns for stations' latitude and longitude, we will compile the two range of years separately.

Combine all the trips from year 2020-2021, and do the same for year 2020-2021.

> I named the year 2013-2019 table as trips_p1, and 2020-2021 table as trips_p2.

trips_p1
```sql
CREATE TABLE AS bike_trips.trips_p1
  SELECT * FROM bike_trips.trips_2013
  UNION ALL
  SELECT * FROM bike_trips.trips_2014
  UNION ALL
  SELECT * FROM bike_trips.trips_2015
  UNION ALL
  SELECT * FROM bike_trips.trips_2016
  UNION ALL
  SELECT * FROM bike_trips.trips_2017
  UNION ALL
  SELECT * FROM bike_trips.trips_2018
  UNION ALL
  SELECT * FROM bike_trips.trips_2019;
```

trips_p2
```sql
CREATE TABLE AS bike_trips.trips_p2
  SELECT * FROM bike_trips.trips_2020
  UNION ALL
  SELECT * FROM bike_trips.trips_2021;
```

<h2 align = "center">Trips table</h2>

The process of cleaning station names and station IDs in trips table, by verifying and matching the data available in Google Maps and Stations table.

Import the csv file from [Chicago Data Portal](https://data.cityofchicago.org).

Before importing the file:

- By using **Find and Replace**, remove the all the parenthesis on **coordinates** column. Find "(" or ")" then leave the *Replace with* field as blank. Do it for both open and close parenthesis.
- Change data: Not in Service = No, In Service = Yes.
- Save the file.

*Import csv file*

- Rename column: Station Name = name, Total Docks = docks, Status = in_service, Location = coordinate. 
```sql
-- Create table
CREATE TABLE bike_trips.stations_original (
  id bigint,
  name varchar,
  docks int,
  docks_in_service int,
  in_service text,
  latitude numeric,
  longitude numeric,
  coordinate point);
```

```sql
-- Import csv file
COPY bike_trips.stations_original (
  id,
  name,
  docks,
  docks_in_service,
  in_service,
  latitude,
  longitude,
  coordinate)
FROM 'D:/Github/divvy-bikeshare/csv files/stations/Divvy_Bicycle_Stations.csv'
DELIMITER ',' CSV HEADER;
```

- Remove column: Docks in Service. Create a back-up table.
```sql
-- Create modified table
CREATE TABLE bike_trips.stations AS
SELECT 
  id,
  name,
  docks,
  in_service,
  latitude,
  longitude,
  coordinate
FROM bike_trips.stations_original
ORDER BY id;
```

Export table as [Stations.csv]()

Run a query to find all the missing/ mismatch station names and IDs to the **Stations** table. It includes columns *start_station_name*, *end_station_name*, *start_station_id* and *end_station_id*.

<h3 align = "center"><strong>First table: trips_p1</strong></h3>

```sql
-- stations in trips_p1 where not in Stations table, 2013-2019
-- check the data

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
				 WHERE s.name = t.name);
-- 149 records
```

Export the result as [trips_p1_stations.csv]().

In order to analyze the table, the following is done:
1. Open the csv file using MS Excel. Rename columns: **id = old_id** & **name = old_name**.
2. Create a new header for column C: **new_id**, column D: **new_name**, and column E: **changes**.
3. **Import the Stations table**: Under *Data* > *Get & Transform Data* > *Get Data* > *From File* > *From Text/CSV* > locate [Stations.csv](). Under *Data Type Detection*, select *Do not detect data types* and click **Load**.
4. **Remove row1**: Under *Table Design* > *Tools* > click **Convert to Range**, select **OK**. Then delete row1 which contains column#.
5. *Right Click* column C and select Insert. Copy ColumnA to ColumnC, this will create another column of **ID** but on the right side of station names.
6. **Freeze the header row/ top row**: Under *View* > *Window* > *Freeze Panes* > *Freeze Top Row*. Do the same for the other sheet.
7. In **trips_p1_stations** sheet:

   - **Cell C2**: enter the formula `=IFNA(VLOOKUP(TEXT(B2,0),Stations!$B:$D,2,FALSE),"same")`, then press Enter. Click the cell again and double-click the *bottom-right* corner of the cell to copy the formula in the entire row.
   - **Cell D2**: enter the formula `=IFNA(VLOOKUP(TEXT(A2,0),Stations!$A:$B,2,FALSE),"same")`, then press Enter. Click the cell again and double-click the *bottom-right* corner of the cell to copy the formula in the entire row.
   - **Cell E2**: enter the formula `=IF(AND(D2="same",C2="same"),"missing",IF(B2=D2,"same",IF(AND(A2<>C2,D2="same"),"id",IF(B2<>D2,"name"))))`, then press Enter. Click the cell again and double-click the *bottom-right* corner of the cell to copy the formula in the entire row.
   
8. **Use conditinal formatting**: Under *Home* > *Styles* > *Conditional Formatting* > *Highlight Cell Rules* > *Text that contains*

    - **Column C**: *Text that contains* > "*same*" with **Green Fill with Dark Green Text**.
    - **Column D**: *Text that contains* > "*same*" with **Green Fill with Dark Green Text**.
    - **Column E**: 
      - *Text that contains* > "*missing*" with **Light Red Fill with Dark Red Text**.
      - *Text that contains* > "*name*" with **Yellow Fill with Dark Yellow Text**.
      - *Text that contains* > "*id*" with **Green Fill with Dark Green Text**.
      
9. Validate the **new_name** column by searching each names in [Google Maps](https://www.google.com/maps) and locate nearby **divvy-stations**.
10. **Create another table**: 

    - For **missing stations**:
      - Filter changes column with values **missing**. Copy columns **old_id** and **old_name** into a new blank workbook and save it as [missing_stations_p1.csv]().
    - For **id changes**:
      - Filter changes column with values **id**. Copy columns **old_name** and **new_id** into a new blank workbook and save it as [id_changes_p1.csv]().
    - For **name changes**:
      - Filter changes column with values **name**. Copy columns **old_name** and **new_name** into a new blank workbook and save it as [name_changes_p1.csv]().

> **Optional**: You can hide error values indicators. Under *File* > *Options* > *Formulas* > *Error Checking* > uncheck *Enable background error checking*.

<details><summary>Validating sample:</summary>
<p>

- station_id = 17
- Either a missing station_id **17** or station_name **Wood St & Division St**.

Using [Google Maps](https://www.google.com/maps) to validate the station_name.

- Search **Chicago** to focus the search in Chicago City.

![Chicago](https://snipboard.io/vYIsW9.jpg)

- Enter the station_name, **Wood St & Division St**, and *press Enter*.
- Click **Nearby** and search **divvy**, to search nearby divvy-bike stations.

![17](https://snipboard.io/n4qvdG.jpg)

- Hover over to the nearest station to view the station name.

![17.2](https://snipboard.io/LHBqnm.jpg)

The nearest station is **Honore St & Division St**.

> Upon checking the **Stations** table on ID number 17, we can confirm that station_id 17 is Honore St & Division St.

![17 excel](https://snipboard.io/najrpI.jpg)

> Thus, **Wood St & Division St** is a wrong station name and must be replaced with correct name **Honore St & Division St**. You can also notice under **changes** column, it says **name**, which means **name change**.

![sample excel](https://snipboard.io/ixN0TV.jpg)

</p></details>

--

> Upon checking, 2 station names from **trips_p1** table has already existing names in **Stations** table. Thus, duplicate station names with a different "station_id". There are also *26 stations* missing from the offical **Stations** table.

Missing stations:

- Filter the **correct_name** column, click the drop-down icon and search **missing**.
- Copy all the **id** and **name** into a new blank workbook and save the file as [missing_stations_p1.csv](https://github.com/56i8/divvy-bikeshare/blob/master/csv%20files/stations/missing_stations_p1.csv).

<details><summary>missing_stations_p1.csv</summary>
<p>

Filter the **changes** column with values **missing**.

![filter column](https://snipboard.io/uDPFAE.jpg)

![table here](https://snipboard.io/dFiTNB.jpg)

Copy all the **old_id** and **old_name** into a new blank workbook and save the file as **missing_stations_p1.csv**.

![missing_stations_p1](https://snipboard.io/EM9P2o.jpg)

</p></details>

<details><summary>name_changes_p1.csv</summary>
<p>

Filter the **changes** column with values **name**. 

![filter column](https://snipboard.io/AUq4Nm.jpg)

![table here](https://snipboard.io/IgMjfP.jpg)

Copy columns **old_name** and **new_name** into a new blank workbook and save the file as **name_changes_p1.csv**.

![name_changes_p1](https://snipboard.io/E8vH4w.jpg)

</p></details>

--

Going back to PostgreSQL:

Stations names **Lakefront Trail & Bryn Mawr Ave** and **Michigan Ave & 71st St** already have existing IDs in **Stations** table.

Since the smaller station ID is not used in **Stations** table, I used it as a new station ID which are **459** and **651** for **Lakefront Trail & Bryn Mawr Ave** and **Michigan Ave & 71st St** respectively.

**SQL Queries:**

*Import csv file*

- id_changes_p1.csv
```sql
CREATE TABLE bike_trips.id_changes_p1 (
  old_name varchar, 
  new_id int);

-- Import
COPY bike_trips.id_changes_p1 (old_name, new_id)
FROM 'D:/Github/divvy-bikeshare/csv files/stations/id_changes_p1.csv' 
DELIMITER ',' CSV HEADER;
```

- name_changes_p1.csv
```sql
-- Create table
CREATE TABLE bike_trips.name_changes_p1 (
  old_name varchar, 
  new_name varchar);

-- Import
COPY bike_trips.name_changes_p1 (old_name, new_name)
FROM 'D:/Github/divvy-bikeshare/csv files/stations/name_changes_p1.csv' 
DELIMITER ',' CSV HEADER;
```

*ID change*

- start_station_id
```sql
UPDATE bike_trips.trips_p1 as s
SET start_station_id = c.new_id
FROM bike_trips.id_changes_p1 as c
WHERE s.start_station_name = c.old_name;
```

- end_station_id
```sql
UPDATE bike_trips.trips_p1 as s
SET end_station_id = c.new_id
FROM bike_trips.id_changes_p1 as c
WHERE s.end_station_name = c.old_name;
```

*Name change*
```sql
-- start_station_name
UPDATE bike_trips.trips_p1 as s
SET start_station_name = c.new_name
FROM bike_trips.name_changes_p1 as c
WHERE s.start_station_name = c.old_name;
```
```sql
-- end_station_name
UPDATE bike_trips.trips_p1 as s
SET end_station_name = c.new_name
FROM bike_trips.name_changes_p1 as c
WHERE s.end_station_name = c.old_name;
```

> P.S. After cleaning both tables, some data are added into **id_changes_p1.csv** & **name_changes_p1.csv**. Worry not since all the uploaded and linked files are updated.

<h3 align = "center"><strong>Second table: trips_p2</strong></h3>

```sql
-- stations in trips_p2 where not in Stations table, 2020-2021
-- check the data
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
-- 701 records
```
Export the result as [trips_p2_stations.csv](https://github.com/56i8/divvy-bikeshare/blob/master/csv%20files/stations/trips_p2_stations.csv). 

With some minor changes, repeat the steps of analysis done in MS Excel:

**Analysis:**

1. Open the csv file using MS Excel. Rename columns: **id = old_id** & **name = old_name**.
2. Create a new header for column C: **new_id**, column D: **new_name** and column E: **changes**.
3. **Import the Stations table**: Under *Data* > *Get & Transform Data* > *Get Data* > *From File* > *From Text/CSV* > locate [Stations.csv](). Under *Data Type Detection* > select *Do not detect data types* and click **Load**.
4. **Remove row1**: Under *Table Design* > *Tools* > click **Convert to Range**, select **OK**. Then delete row1 which contains column#.
5. *Right Click* column C and select Insert. Copy ColumnA to ColumnC, this will create another column of "id" but on the right side of station names.
6. **Freeze the header row/ top row**: Under *View* > *Window* > *Freeze Panes* > *Freeze Top Row*. Do the same for the other sheet.
7. In **trips_p2_stations** sheet:

    - **Cell C2**: enter the formula `=IFNA(VLOOKUP(TEXT(B2,0),Stations!$B:$D,2,FALSE),"same")`, then press Enter. Click the cell again and double-click the bottom-right corner of the cell to copy the formula in the entire row.
    - **Cell D2**: enter the formula `=IFNA(VLOOKUP(TEXT(A2,0),Stations!$A:$B,2,FALSE),"same")`, then press Enter. Click the cell again and double-click the bottom-right corner of the cell to copy the formula in the entire row.
    - **Cell E2**: enter the formula `=IF(AND(D2="same",C2="same"),"missing",IF(B2=D2,"same",IF(AND(A2<>C2,D2="same"),"id",IF(AND(B2<>D2,C2="same"),"name",IF(AND(A2<>C2,B2<>D2),"conflict")))))`, then press Enter. Click cell E2 again and double-click the bottom-right corner of the cell to copy the formula in the entire row.

8. **Use conditinal formatting**: Under *Home* > *Styles* > *Conditional Formatting* > *Highlight Cell Rules* > *Text that contains*

    - **Column C**: Text that contains > "*same*" with **Green Fill with Dark Green Text**.
    - **Column D**: Text that contains > "*same*" with **Green Fill with Dark Green Text**.
    - **Column E**:
      - *Text that contains* > "*missing*" with **Light Red Fill with Dark Red Text**.
      - *Text that contains* > "*name*" with **Yellow Fill with Dark Yellow Text**.
      - *Text that contains* > "*id*" with **Green Fill with Dark Green Text**.
      - *Text that contains* > "*conflict*" with **Custom Format**. I used **Light Blue fill with Dark Blue Text**.
9. Validate the **new_name** column by searching each names in [Google Maps](https://www.google.com/maps) and locate nearby **divvy-stations**.
10. **Create another table**: 

    - For **missing stations**:
      - Filter changes column with values **missing**. Copy columns **old_id** and **old_name** into a new blank workbook and save it as [missing_stations_p2.csv]().
    - For **id changes**:
      - Filter changes column with values **id**. Copy columns **old_name** and **new_id** into a new blank workbook and save it as [id_changes_p2.csv]().
    - For **name changes**:
      - Filter changes column with values **name**. Copy columns **old_name** and **new_name** into a new blank workbook and save it as [name_changes_p2.csv]().


> **Optional**: You can hide error values indicators. Under *File* > *Options* > *Formulas* > *Error Checking* > uncheck *Enable background error checking*.

> Upon checking we can identify which names are duplicated, used a wrong station_id and missing from the official **Stations** table. By sorting the column by **id_status**, we can see that all the station_id in column A has a mixed types of data, *varchar* and *bigint*.

**Cleaning process:**

1. Sort the sheet by **status** column in descending order
2. Replace all values in **id_status** column with values in **id** column that has a **status** as **free**.
3. Replace all the **not found** values in **id_status** column with values in **id** column.
4. ID change:
> Upon checking the IDs, we will find duplicate IDs with different station names. If we verify each names using [Google Maps](https://www.google.com/maps), we can confirm that the other Station name also exists. Thus, different station name with an invalid ID (since the used ID is already on the records), the ID is then changed to **null**.
- 13221 > 61
- 20215 > 732
- WL-008 > 57
- table here [id_changes_p2.csv](https://github.com/56i8/divvy-bikeshare/blob/master/csv%20files/stations/id_changes_p2.csv)

> Import the csv file into the database.
5. Name change:
> Some stations names have null values, data are filled after finding same station ID. Also by comparing same station IDs we can see different station names, the station name that has recorded station ID in **Stations** table are used.
- 61 = Wood St & Milwaukee Ave
- 732 = Hegewisch Metra Station
- 57 = Clinton St & Roosevelt Rd
- table here: [name_changes_p2.csv](https://github.com/56i8/divvy-bikeshare/blob/master/csv%20files/stations/name_changes_p2.csv)

> Import the csv file into the database.
6. List of missing stations from **Stations** table.
- table here [missing_stations_p2.csv](https://github.com/56i8/divvy-bikeshare/blob/master/csv%20files/stations/missing_stations_p2.csv)

**SQL Queries:**

*Import csv files*

- id_changes_p2.csv

```sql
-- Create table
CREATE TABLE bike_trips.id_changes_p2 (
  old_name varchar,
  new_id int);

-- Import
COPY bike_trips.id_changes_p2 (old_name, new_id)
FROM 'D:/Github/divvy-bikeshare/csv files/stations/id_changes_p2.csv' 
DELIMITER ',' CSV HEADER NULL 'null';
```

- name_changes_p2.csv

```sql
-- Create table
CREATE TABLE bike_trips.name_changes_p2 (
  old_name varchar,
  new_name varchar);

-- Import
COPY bike_trips.name_changes_p2 (old_name, new_name)
FROM 'D:/Github/divvy-bikeshare/csv files/stations/name_changes_p2.csv' 
DELIMITER ',' CSV HEADER NULL 'null';
```

*ID change*

- start_station_id

```sql
UPDATE bike_trips.trips_p2
SET start_station_id = CASE
  WHEN start_station_id = '13221' THEN '61'
  WHEN start_station_id = '20215' THEN '732'
  WHEN start_station_id = 'WL-008' THEN '57'
  END
WHERE start_station_id IN ('13221', '20215', 'WL-008');
```
```sql
UPDATE bike_trips.trips_p2 as s
SET start_station_id = CAST(c.new_id AS varchar)
FROM bike_trips.id_changes_p2 as c
WHERE s.start_station_name = c.old_name;
```

- end_station_id
```sql
UPDATE bike_trips.trips_p2
SET end_station_id = CASE
  WHEN end_station_id = '13221' THEN '61'
  WHEN end_station_id = '20215' THEN '732'
  WHEN end_station_id = 'WL-008' THEN '57'
  END
WHERE end_station_id IN ('13221', '20215', 'WL-008');
```
```sql
UPDATE bike_trips.trips_p2 as s
SET end_station_id = CAST(c.new_id AS varchar)
FROM bike_trips.id_changes_p2 as c
WHERE s.end_station_name = c.old_name;
```

*Name change*
CASE
- start_station
```sql
UPDATE bike_trips.trips_p2
SET start_station_name = CASE
  WHEN start_station_id = '61' THEN 'Wood St & Milwaukee Ave'
  WHEN start_station_id = '732' THEN 'Hegewisch Metra Station'
  WHEN start_station_id = '57' THEN 'Clinton St & Roosevelt Rd'
  END
WHERE start_station_id IN ('61', '732', '57');
```
```sql
UPDATE bike_trips.trips_p2 as s
SET start_station_name = c.new_name
FROM bike_trips.name_changes_p2 as c
WHERE s.start_station_name = c.old_name;
```

- end_station
```sql
UPDATE bike_trips.trips_p2
SET end_station_name = CASE
  WHEN end_station_id = '61' THEN 'Wood St & Milwaukee Ave'
  WHEN end_station_id = '732' THEN 'Hegewisch Metra Station'
  WHEN end_station_id = '57' THEN 'Clinton St & Roosevelt Rd'
  END
WHERE end_station_id IN ('61', '732', '57');
```
```sql
UPDATE bike_trips.trips_p2 as s
SET end_station_name = c.new_name
FROM bike_trips.name_changes_p2 as c
WHERE s.end_station_name = c.old_name;
```

> P.S. After cleaning both tables, some data are added into **id_changes_p1.csv** & **name_changes_p1.csv**. Worry not since all the uploaded and linked files are updated.



<h3 align = "center"><strong>Combine table: trips</strong></h3>

Before combining both tables, some changes has to be made first. By checking the schema of the tables we can see the differences in their data. After modifying, merge both tables into one and save as **trips** table.

<h4><strong>Schema</strong></h4>

*Table Columns*

- trips_p1

```
| Field name         | Type                        |
| ------------------ | --------------------------- |
| trip_id            | bigint                     |
| start_time         | timestamp without time zone |
| end_time           | timestamp without time zone |
| bike_id            | integer                     |
| duration           | integer                     |
| start_station_id   | integer                     |
| start_station_name | character varying           |
| end_station_id     | integer                     |
| end_station_name   | character varying           |
| user_type          | text                        |
| gender             | text                        |
| birth_year         | integer                     |
```

- trips_p2
```
| Field name         | Type                        |
| ------------------ | --------------------------- |
| ride_id            | character varying           |
| rideable_type      | character varying           |
| start_time         | timestamp without time zone |
| end_time           | timestamp without time zone |
| start_station_id   | character varying           |
| start_station_name | character varying           |
| end_station_id     | character varying           |
| end_station_name   | character varying           |
| start_lat          | numeric                     |
| start_lng          | numeric                     |
| end_lat            | numeric                     |
| end_lng            | numeric                     |
| user_type          | text                        |
```
Changes to be made on trips_p1:

- change data type of column trip_id: bigint to character varying
- rename column: trip_id to ride_id

Changes to be made on trips_p2:

- remove columns: start_lat, start_lng, end_lat & end_lng
- fill missing data: duration, using start_time and end_time
- change data type of column start_station_id & end_station_id: character varying to integer

**SQL Query:**

```sql
CREATE TABLE bike_trips.trips AS
SELECT 
  CAST(trip_id AS varchar) AS ride_id,
  CAST(null AS varchar) AS rideable_type,
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
  birth_year
FROM bike_trips.trips_p1
UNION ALL
SELECT
  ride_id,
  rideable_type,
  CAST(null AS int) AS bike_id,
  start_time,
  end_time,
  EXTRACT(EPOCH FROM(end_time - start_time))::int as trip_duration,
  CAST(start_station_id AS int),
  start_station_name,
  CAST(end_station_id AS int),
  end_station_name,
  user_type,
  CAST(null AS text) AS gender,
  CAST(null AS int) AS birth_year;
```

Data omitted:

Omitted some data in trips_p2 that has null **station_names** AND **station_id**. This data will be filled in the future after finishing my studies in Webscraping in Python. These records doesn't contain any data about its station_names and station_IDs, but they have a coordinates which then can be used to identify the nearby **DIVVY** station name.

**12.68%** of data is omitted from trips_p2 table.

**1,158,190** records has both null names and null IDs on *start_station* and *end_station* columns.

**9,136,746** total count of data in trips_p2


```sql
-- Check the percent of omitted data
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

-- 12.68% of data is omitted
```

<h2 align = "center">Stations table</h2>

<h3><strong>Cleaning</strong></h3>
*Import csv files*

- missing_stations.csv

Adding the missing stations to Stations table

```sql
-- Import
COPY bike_trips.stations (
  id, 
  name, 
  docks, 
  latitude, 
  longitude, 
  coordinate)
FROM 'D:/Github/divvy-bikeshare/csv files/stations/missing_stations.csv'
DELIMITER ',' CSV HEADER;
```
- id_changes_stations.csv
```sql
-- Create table
CREATE TABLE bike_trips.id_changes_stations (
  old_name varchar,
  new_id int);
```
```sql
-- Import
COPY bike_trips.id_changes_stations (old_name, new_id)
FROM 'D:/Github/divvy-bikeshare/csv files/stations/id_changes_stations.csv'
DELIMITER ',' CSV HEADER;
```

*ID change*

```sql
UPDATE bike_trips.stations as s
SET id = c.new_id
FROM bike_trips.id_changes_stations as c
WHERE s.name = c.old_name;
```

**Removing unused Stations**
```sql
SELECT *
```
