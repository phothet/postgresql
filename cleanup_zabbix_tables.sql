#!/bin/bash

TABLES="history history_log history_old history_str history_text history_uint"
DBNAME=zabbix
HISTORY_DAYS=20

EPOCH_TIME=$(date --date '20 days ago' +'%s')

for table in $TABLES; do
    # remove old schema dumps
    rm -f ${table}.pre-data.sql ${table}.post-data.sql

    # dump schema
    pg_dump --section=pre-data  -t $table $DBNAME > ${table}.pre-data.sql
    pg_dump --section=post-data -t $table $DBNAME > ${table}.post-data.sql

    # create new table
    sed -r "s/\b${table}\b/${table}_copy/" ${table}.pre-data.sql \
    | psql $DBNAME -f -

    # copy data
    echo "INSERT INTO ${table}_copy \
          SELECT * FROM ${table} WHERE clock > ${EPOCH_TIME};" \
    | psql zabbix -f -

    # swap tables
    echo "ALTER TABLE ${table} RENAME TO ${table}_old;"  | psql zabbix -f -
    echo "ALTER TABLE ${table}_copy RENAME TO ${table};" | psql zabbix -f -

    # drop indexes from saved table and create new one
    sed 's/CREATE/DROP/' ${table}.post-data.sql \
    | sed 's/ ON.*/;/' \
    | psql $DBNAME -f -
    cat ${table}.post-data.sql | psql $DBNAME -f -
done
