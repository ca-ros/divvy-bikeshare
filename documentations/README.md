<h1 align = "center">Data Wrangling</h1>

Data sources:
- [Divvy bikes](https://divvybikes.com), download the raw data-sets [here](https://divvy-tripdata.s3.amazonaws.com/index.html)
- [Chicago Data Portal](https://data.cityofchicago.org/), download the raw stations-table [here](https://data.cityofchicago.org/api/views/bbyy-e7gq/rows.csv?accessType=DOWNLOAD)

<sub>Tool used:</sub>
- *PostgreSQL*
- *RStudio*

<h2 align = "center">Table of Contents</h2>

I. [Setting up SQL Environment]()

II. [Combining Data]()

- [2013]()
- [2014]()
- [2015]()
- [2016]()
- [2017]()
- [2018]()
- [2019]()
- [2020]()
- [2021]()

III. [Stations Table]()

- [First table: trips_p1]()
- [Second table: trips_p2]()
- [Missing Stations]()

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

1. Download all the data for year 2013 to 2021 [here]().
2. Download the stations data here, this data is from Chicago Data Portal. For this analysis, I will refer to the table as **Official Stations** table.
3. After extracting the zip files, compile separately all the yearly bike-trips data and the stations data included in that folder. Name the folder as the year it represents.
4. Start compiling the data.
5. For file naming consistency, all combined trip-data must contain (year) followed by "-divvy-tripdata.csv"

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
  trip_id numeric, 
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
  birthyear) 
FROM 'D:/Github/divvy-bikeshare/csv files/trips/2013-divvy-tripdata.csv' 
DELIMITER ',' CSV HEADER;
```

<h3 align = "center"><strong>2014</strong></h3>

<sub>*RStudio*</sub>
```r
# Merge 2014_tripdata
df_2014 <- list.files(path="D:/Github/divvy-bikeshare/csv files/trips/2014", full.names = TRUE) %>% 
  lapply(read_csv) %>% 
  bind_rows 
```

```r
# Export the combined 2014_tripdata
write.csv(df_2014,"D:/Github/divvy-bikeshare/csv files/trips/2014-divvy-tripdata.csv", row.names = FALSE)
```
> Follow the file naming guideline, file name should be "2014-divvy-tripdata.csv".

Import the csv file into the database.

<sub>*PostgreSQL*</sub>
```sql
-- Create table
CREATE TABLE bike_trips.trips_2014 (
  trip_id numeric, 
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
FROM 'D:/Github/divvy-bikeshare/csv files/trips/2014-divvy-tripdata.csv' 
DELIMITER ',' CSV HEADER QUOTE '"' NULL 'NA';
```

<h3 align = "center"><strong>2015</strong></h3>

<sub>*RStudio*</sub>
```r
# Merge 2015_tripdata
df_2015 <- list.files(path="D:/Github/divvy-bikeshare/csv files/trips/2015", full.names = TRUE) %>% 
  lapply(read_csv) %>% 
  bind_rows 
```

```r
# Export the combined 2015_tripdata
write.csv(df_2015,"D:/Github/divvy-bikeshare/csv files/trips/2015-divvy-tripdata.csv", row.names = FALSE)
```
> Follow the file naming guideline, file name should be "2015-divvy-tripdata.csv".

Import the csv file into the database.

<sub>*PostgreSQL*</sub>
```sql
-- Create table
CREATE TABLE bike_trips.trips_2015 (
  trip_id numeric, 
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
FROM 'D:/Github/divvy-bikeshare/csv files/trips/2015-divvy-tripdata.csv' 
DELIMITER ',' CSV HEADER QUOTE '"' NULL 'NA';
```

<h3 align = "center"><strong>2016</strong></h3>

<sub>*RStudio*</sub>
```r
# Merge 2016_tripdata
df_2016 <- list.files(path="D:/Github/divvy-bikeshare/csv files/trips/2016", full.names = TRUE) %>% 
  lapply(read_csv) %>% 
  bind_rows 
```

```r
# Export the combined 2016_tripdata
write.csv(df_2016,"D:/Github/divvy-bikeshare/csv files/trips/2016-divvy-tripdata.csv", row.names = FALSE)
```
> Follow the file naming guideline, file name should be "2016-divvy-tripdata.csv".

Import the csv file into the database.

<sub>*PostgreSQL*</sub>
```sql
-- Create table
CREATE TABLE bike_trips.trips_2016 (
  trip_id numeric, 
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
FROM 'D:/Github/divvy-bikeshare/csv files/trips/2016-divvy-tripdata.csv' 
DELIMITER ',' CSV HEADER QUOTE '"' NULL 'NA';
```

<h3 align = "center"><strong>2017</strong></h3>

<sub>*RStudio*</sub>
```r
# Merge 2017_tripdata
df_2017 <- list.files(path="D:/Github/divvy-bikeshare/csv files/trips/2017", full.names = TRUE) %>% 
  lapply(read_csv) %>% 
  bind_rows 
```

```r
# Export the combined 2017_tripdata
write.csv(df_2017,"D:/Github/divvy-bikeshare/csv files/trips/2017-divvy-tripdata.csv", row.names = FALSE)
```
> Follow the file naming guideline, file name should be "2017-divvy-tripdata.csv".

Import the csv file into the database.

<sub>*PostgreSQL*</sub>
```sql
-- Create table
CREATE TABLE bike_trips.trips_2017 (
  trip_id numeric, 
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
FROM 'D:/Github/divvy-bikeshare/csv files/trips/2017-divvy-tripdata.csv' 
DELIMITER ',' CSV HEADER QUOTE '"' NULL 'NA';
```

<h3 align = "center"><strong>2018</strong></h3>

<sub>*RStudio*</sub>
```r
# Merge 2018_tripdata
df_2018 <- list.files(path="D:/Github/divvy-bikeshare/csv files/trips/2018", full.names = TRUE) %>% 
  lapply(read_csv) %>% 
  bind_rows 
```

```r
# Export the combined 2018_tripdata
write.csv(df_2018,"D:/Github/divvy-bikeshare/csv files/trips/2018-divvy-tripdata.csv", row.names = FALSE)
```
> Follow the file naming guideline, file name should be "2018-divvy-tripdata.csv".

Import the csv file into the database.

<sub>*PostgreSQL*</sub>
```sql
-- Create table
CREATE TABLE bike_trips.trips_2018 (
  trip_id numeric, 
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
FROM 'D:/Github/divvy-bikeshare/csv files/trips/2018-divvy-tripdata.csv' 
DELIMITER ',' CSV HEADER QUOTE '"' NULL 'NA';
```

<h3 align = "center"><strong>2019</strong></h3>

This data set has inconsistent column naming. By using Notepad ++ to open large datasets, each quarterly files are opened and inspected. We can see that 2019_Q2 table has different column names than the other tables, which will affect the merging process of the csv files. 2019_Q2 column name was matched to the rest of the other quarterly tables.

<sub>*RStudio*</sub>
```r
# Merge 2019_tripdata
df_2019 <- list.files(path="D:/Github/divvy-bikeshare/csv files/trips/2019", full.names = TRUE) %>% 
  lapply(read_csv) %>% 
  bind_rows 
```

```r
# Export the combined 2019_tripdata
write.csv(df_2019,"D:/Github/divvy-bikeshare/csv files/trips/2019-divvy-tripdata.csv", row.names = FALSE)
```
> Follow the file naming guideline, file name should be "2019-divvy-tripdata.csv".

Import the csv file into the database.

<sub>*PostgreSQL*</sub>
```sql
-- Create table
CREATE TABLE bike_trips.trips_2019 (
  trip_id numeric, 
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
FROM 'D:/Github/divvy-bikeshare/csv files/trips/2019-divvy-tripdata.csv' 
DELIMITER ',' CSV HEADER QUOTE '"' NULL 'NA';
```

<h3 align = "center"><strong>2020</strong></h3>

<sub>*RStudio*</sub>
```r
# Merge 2020_tripdata
df_2020 <- list.files(path="D:/Github/divvy-bikeshare/csv files/trips/2020", full.names = TRUE) %>% 
  lapply(read_csv) %>% 
  bind_rows 
```

```r
# Export the combined 2020_tripdata
write.csv(df_2020,"D:/Github/divvy-bikeshare/csv files/trips/2020-divvy-tripdata.csv", row.names = FALSE)
```
> Follow the file naming guideline, file name should be "2020-divvy-tripdata.csv".

Import the csv file into the database.

<sub>*PostgreSQL*</sub>
```sql
-- Create table
CREATE TABLE bike_trips.trips_2020 (
  trip_id numeric, 
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
FROM 'D:/Github/divvy-bikeshare/csv files/trips/2020-divvy-tripdata.csv' 
DELIMITER ',' CSV HEADER QUOTE '"' NULL 'NA';
```

<h3 align = "center"><strong>2021</strong></h3>

<sub>*RStudio*</sub>
```r
# Merge 2021_tripdata
df_2021 <- list.files(path="D:/Github/divvy-bikeshare/csv files/trips/2021", full.names = TRUE) %>% 
  lapply(read_csv) %>% 
  bind_rows 
```

```r
# Export the combined 2021_tripdata
write.csv(df_2021,"D:/Github/divvy-bikeshare/csv files/trips/2021-divvy-tripdata.csv", row.names = FALSE)
```
> Follow the file naming guideline, file name should be "2021-divvy-tripdata.csv".

Import the csv file into the database.

<sub>*PostgreSQL*</sub>
```sql
-- Create table
CREATE TABLE bike_trips.trips_2021 (
  trip_id numeric, 
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
FROM 'D:/Github/divvy-bikeshare/csv files/trips/2021-divvy-tripdata.csv' 
DELIMITER ',' CSV HEADER QUOTE '"' NULL 'NA';
```

Upon checking the structure of the tables in each year, we can notice that 2013-2019 have same data structure, while 2020-2021 have a different type of structure.

Since the type of data from year 2020-2021 is different, where the station_ids are varchar instead of numeric and tables have an additional columns for stations' latitude and longitude, we will compile the two range of years separately.

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

<h2 align = "center">Stations table</h2>

Import the csv file from [Chicago Data Portal](https://data.cityofchicago.org).

```sql
-- Create table
CREATE TABLE bike_trips.stations (
  id numeric,
  name varchar,
  docks int,
  latitude numeric,
  longitude numeric,
  coordinate point
);
```

```sql
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
```

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
				 WHERE s.name = t.name)
-- 149 records
```

Export the result as [trips_p1_stations.csv]().

In order to analyze the table, the following is done:
1. Open the saved file using MS Excel.
2. Create a new header for column C: **id_status**, and column D: **new_name**.
3. Import the Official Stations table, Data > Get Data > From Text/CSV > locate the [csv file](https://data.cityofchicago.org/api/views/bbyy-e7gq/rows.csv?accessType=DOWNLOAD) of official stations from [Chicago Data Portal](https://data.cityofchicago.org/), then click **Load**. Rename the sheet as **Stations**.
4. Now, click inside the **Stations** table, under Table Design > Tools > click **Convert to Range**, select **OK**.
5. Before proceeding, freeze the header row/ top row, go to View > Window > Freeze Panes > Freeze Top Row. Do the same for the other sheet.
6. In **trips_p1_stations** sheet, enter the formula in cell C2 `=IFNA(VLOOKUP(B2,Stations!$B$2:$C$1270,2,FALSE),"none")`, then press Enter. Click cell C2 again and double-click the *bottom-right* corner of the cell to copy the formula in the entire row.
7. Enter the formula in cell D2 `=IFNA(VLOOKUP(A2,Stations!$A$2:$B$1270,2,FALSE),"missing")`, then press Enter. Click cell D2 again and double-click the *bottom-right* corner of the cell to copy the formula in the entire row.
8. Select column D and use condition formatting to highlight missing stations. Under Home > Styles > Conditional Formatting > Highlight Cell Rules > Text that contains > enter **missing** and press **OK**.
9. Validate the **correct_name** by searching the names in google maps and find nearby **divvy-stations**.
10. Create another table for **missing stations** and save it as **missing_stations_p1.csv**.
11. Create another table for **name changes** and save it as **name_changes_p1.csv**.

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

> We can see that the nearest station is **Honore St & Division St**. Upon checking the **Stations** table on ID number 17, we can confirm that station_id 17 is Honore St & Division St.

![17 excel](https://snipboard.io/plbCEG.jpg)

> Thus, **Wood St & Division St** is a wrong station name and must be replaced with correct name **Honore St & Division St**.

![sample excel](https://snipboard.io/IQ9PBa.jpg)

</p></details>

--

> Upon checking, 2 station names from **trips_p1** table has already existing names in **Stations** table. Thus, duplicate station names with a different "station_id". There are also *26 stations* missing from the offical **Stations** table.

Missing stations:

- Filter the **correct_name** column, click the drop-down icon and search **missing**.
- Copy all the **id** and **name** into a new blank workbook and save the file as [missing_stations_p1.csv]().

<details><summary>missing_stations_p1.csv</summary>
<p>

Filter the **new_name** column with only **missing** names.

![filter column](https://snipboard.io/btFyfP.jpg)

![table here](https://snipboard.io/PcuJCj.jpg)

Copy all the **id** and **name** into a new blank workbook and save the file as **missing_stations_p1.csv**.

![missing_stations_p1](https://snipboard.io/K8XSMf.jpg)

</p></details>

<details><summary>name_changes_p1.csv</summary>
<p>

Filter the **new_name** column and remove **missing names**. 

![filter column](https://snipboard.io/MjbOcz.jpg)

![table here](https://snipboard.io/fqnZgY.jpg)

Copy all the **name** and **new_name** into a new blank workbook with columns **old_name** and **new_name** and save the file as **name_changes_p1.csv**.

![name_changes_p1](https://snipboard.io/JKUCLS.jpg)

</p></details>


Going back to PostgreSQL:

Stations names **Lakefront Trail & Bryn Mawr Ave** and **Michigan Ave & 71st St** already have existing IDs in **Stations** table.

I used the lower station ID which is **459** and **651** for **Lakefront Trail & Bryn Mawr Ave** and **Michigan Ave & 71st St** respectively.

> Station IDs are not really important in this analysis, it's only used for a faster querying.

**SQL Queries:**

*Import csv file*
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

- Stations table
```sql
UPDATE bike_trips.stations
SET id = CASE 
  WHEN name = 'Lakefront Trail & Bryn Mawr Ave' THEN 459
  WHEN name = 'Michigan Ave & 71st St' THEN 651
  END
WHERE 
  name IN (
    'Lakefront Trail & Bryn Mawr Ave', 
    'Michigan Ave & 71st St')
```

- trips_p1 table

```sql
UPDATE bike_trips.trips_p1
SET id = CASE 
  WHEN name = 'Lakefront Trail & Bryn Mawr Ave' THEN 459
  WHEN name = 'Michigan Ave & 71st St' THEN 651
  END
WHERE 
  name IN (
    'Lakefront Trail & Bryn Mawr Ave', 
    'Michigan Ave & 71st St')
```

*Name change*
- trips_p1 table

```sql
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
```

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
				 WHERE s.name = t.name)
-- 701 records
```
Export the result as [trips_p2_stations.csv](). 

With some minor changes, repeat the steps of analysis done in MS Excel:

**Analysis:**

1. Open the saved file using MS Excel.
2. Create a new header for column C: **id_status**, column D: **new_name** and column E: **status**.
3. Import the official stations table, Data > Get Data > From Text/CSV > locate the [csv file](https://data.cityofchicago.org/api/views/bbyy-e7gq/rows.csv?accessType=DOWNLOAD) of official stations from [Chicago Data Portal](https://data.cityofchicago.org/), then click **Load**. Rename the sheet as **Stations**.
4. Now, click inside the **Stations** table, under Table Design > Tools > click **Convert to Range**, select **OK**.
5. *Right Click* column C and select Insert. This action will insert new column to the left of **docks** column. A new empty column C will appear. Copy column A to column C, this will create another column of "id" but on the right side of station names.
5. Before proceeding, freeze the header row/ top row, go to View > Window > Freeze Panes > Freeze Top Row. Do the same for the other sheet.
6. In **trips_p2_stations** sheet, sort the sheet by column **id** in *Ascending Order*. Go to Data > Sort & Filter > select Filter, click the dropdown arrow on cell A1 and select **Sort Smallest to Largest**.
7. Then, enter a formula in cell C2 `=IFNA(VLOOKUP(B2,Stations!$B$2:$C$1270,2,FALSE),"not found")` and then press Enter. Click the cell again and double-click the *bottom-right* corner of the cell to copy the formula in the entire row.
8. On cell D2 `=IFNA(VLOOKUP(A2,Stations!$A$2:$B$1270,2,FALSE),"missing")` and then press Enter. Click the cell again and double-click the *bottom-right* corner of the cell to copy the formula in the entire row.
9. Also on cell E2 enter a formula `=IFNA(IF(VLOOKUP(A2,Stations!A:A,1,FALSE)=A2,"taken"),"free")` and copy the formula all the way down to **Row 63**, where ID is 704 and name is Jeffery Blvd & 91st St.

> The **id_status** column represents the existing station_id of the selected station name to the official **Stations** table and **new_name** column represents the correct station name. Also, the column E **status**, gives information if the ID used to the name is either already exist or free in the official Stations table.
 
 > Upon checking we can obviously identify which names are duplicated, used a wrong station_id and missing from the official **Stations** table. By sorting the column by **id_status**, we can see that all the station_id in column A has a mixed of *varchar* and *numeric* types of data.

**Cleaning process:**

1. Sort the sheet by **status** column in descending order
2. Replace all values in **id_status** column with values in **id** column that has a **status** as **free**.
3. Replace all the **not found** values in **id_status** column with values in **id** column.
4. ID change:
> Upon checking the IDs, we will find duplicate IDs with different station names. If we verify each names using [Google Maps](https://www.google.com/maps), we can confirm that the other Station name also exists. Thus, different station name with an invalid ID (since the used ID is already on the records), the ID is then changed to **null**.
- 13221 > 61
- 20215 > 732
- WL-008 > 57
- table here [id_changes_p2.csv]()

> Import the csv file into the database.
5. Name change:
> Some stations names have null values, data are filled after finding same station ID. Also by comparing same station IDs we can see different station names, the station name that has recorded station ID in **Stations** table are used.
- 61 = Wood St & Milwaukee Ave
- 732 = Hegewisch Metra Station
- 57 = Clinton St & Roosevelt Rd
- table here: [name_changes_p2.csv]()

> Import the csv file into the database.
6. List of missing stations from **Stations** table.
- table here [missing_stations_p2.csv]()

**SQL Queries:**

*Import csv files*

- Station ID

```sql
-- Create table
CREATE TABLE bike_trips.id_changes_p2 (
  old_name varchar,
  new_id varchar
);

-- Import
COPY bike_trips.id_changes_p2 (old_name, new_id)
FROM 'D:/Github/divvy-bikeshare/csv files/stations/id_changes_p2.csv' 
DELIMITER ',' CSV HEADER NULL 'null';
```

- Station name

```sql
-- Create table
CREATE TABLE bike_trips.name_changes_p2 (
  old_name varchar,
  new_name varchar
);

-- Import
COPY bike_trips.name_changes_p2 (old_name, new_name)
FROM 'D:/Github/divvy-bikeshare/csv files/stations/name_changes_p2.csv' 
DELIMITER ',' CSV HEADER NULL 'null';
```

*ID change*

- start_station_id

```sql
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
```

- end_station_id
```sql
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
```

*Name change*

- start_station
```sql
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
```

- end_station
```sql
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
```


Delete duplicate rows
```sql
DELETE FROM bike_trips.trips_p2_stations AS a 
  USING (
      SELECT MIN(ctid) AS ctid, name
        FROM bike_trips.trips_p2_stations
        GROUP BY name HAVING COUNT(*) > 1
      ) AS b
  WHERE a.name = b.name 
  AND a.ctid <> b.ctid
```

<h3 align = "center"><strong>Missing Stations</strong></h3>

 Cleaning **Stations** table
 ```sql

 ```

