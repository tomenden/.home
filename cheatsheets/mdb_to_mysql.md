
## convert mdb to mysql with mdbtools

A slight veriation of these commands can be used to convert mdb files to mysql.
Tested on OSX, should work the same on Linux

```bash
#just for looks:
mdb-tables db_file.mdb
#get mdb schema:
mdb-schema db_file.mdb > db_file.temp.schema
#for each table:
mdb-export db_file.mdb table1 > db_file.temp.table1.csv
#create sql schema from db_file.temp.schema:
vi db_file.schema.sql
#create database with encoding:
mysql
```

```sql
CREATE DATABASE db_file DEFAULT CHARACTER SET utf8;
use db_file;
exit
```
```bash
#apply schema:
mysql db_file < db_file.schema.sql
#load data from csv files:
mysql
```
```mysql
LOAD DATA LOCAL INFILE 'db_file.temp.table1.csv' INTO TABLE db_file.table1 FIELDS TERMINATED BY ',' ENCLOSED BY '"' IGNORE 1 LINES (list,of,table,names,as,defined,by,you,in,db_filedotschemadotsql);
exit
```
```
#backup:
mysqldump db_file > db_file.temp.sql
tar cvfz db_file.sql.tar.bz2 db_file.temp.sql
#clean files:
rm -f db_file.mdb db_file.temp.*
```