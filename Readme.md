#Time Zone Service

###Instalation


You need to install:

 - postgresql
 - postgis


Create database for service


Make this sql commands

```
CREATE EXTENSION postgis;
CREATE EXTENSION postgis_topology;
CREATE EXTENSION fuzzystrmatch;
CREATE EXTENSION postgis_tiger_geocoder;
```

Download tz_world from http://efele.net/maps/tz/world/ and unpack it


Convert tz_world.shp to SQL dump and push it to your service database

```
/usr/lib/postgresql/9.1/bin/shp2pgsql -D tz_world.shp > dump.sql
psql -d your_database_name -f dump.sql
```

Make migrations

```
bundle exec rake db:migrate
```

To get offsets make 'actualize' task

```
bundle exec rake offsets:actualize
```

To ensure that your offsets is actual make this task regularly.

Done!


###Usage

/timezone/name?lat=55&lng=30 request will return you json like this {"timezone":"Europe/Minsk"}

###Tests

```
$ bundle exec rpsec
```