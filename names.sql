drop table if exists names;
create table names(name string) row format delimited fields terminated by ',' lines terminated by '\n';
load data inpath 's3://emr-hive-bucket-1/names.txt' into table names;
insert overwrite directory 's3://emr-hive-bucket-1/output/hive/' select name, length(name) from names;
