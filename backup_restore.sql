# backup using custom option
/Library/PostgreSQL/9.6/bin/pg_dump --file "/Users/pennthee/Downloads/192_168_5_30_zabbixdb.sql" --host "192.168.5.30" --port "5432" --username "postgres" --no-password --verbose --format=c --blobs "zabbix"

# restore
/Library/PostgreSQL/9.6/bin/pg_restore --host "192.168.5.30" --port "5432" --username "zabbix" --role "zabbix" --dbname "zabbix" --verbose "/Users/pennthee/Downloads/192_168_5_30_zabbixdb"

/Library/PostgreSQL/9.6/bin/pg_restore --host "192.168.5.30" --port "5432" --username "zabbix" --role "zabbix" --dbname "zabbix" --verbose "/Users/pennthee/Downloads/192_168_5_30_zabbixdb"
pg_restore: connecting to database for restore
Password: 
pg_restore: [archiver (db)] Error while INITIALIZING:
pg_restore: [archiver (db)] could not execute query: ERROR:  unrecognized configuration parameter "lock_timeout"
    Command was: SET lock_timeout = 0;

pg_restore: [archiver (db)] could not execute query: ERROR:  unrecognized configuration parameter "idle_in_transaction_session_timeout"
    Command was: SET idle_in_transaction_session_timeout = 0;

pg_restore: [archiver (db)] could not execute query: ERROR:  unrecognized configuration parameter "row_security"
    Command was: SET row_security = off;

pg_restore: creating SCHEMA "public"
pg_restore: creating COMMENT "SCHEMA public"
pg_restore: creating EXTENSION "plpgsql"
pg_restore: creating COMMENT "EXTENSION plpgsql"
pg_restore: [archiver (db)] Error while PROCESSING TOC:
pg_restore: [archiver (db)] Error from TOC entry 5002; 0 0 COMMENT EXTENSION plpgsql 
pg_restore: [archiver (db)] could not execute query: ERROR:  must be owner of extension plpgsql
    Command was: COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';



pg_restore: creating TABLE "public.acknowledges"
pg_restore: [archiver (db)] Error from TOC entry 257; 1259 17571 TABLE acknowledges zabbix
pg_restore: [archiver (db)] could not execute query: ERROR:  relation "acknowledges" already exists
    Command was: CREATE TABLE public.acknowledges (
    acknowledgeid bigint NOT NULL,
    userid bigint NOT NULL,
    eventid bigint NOT NUL...
pg_restore: creating TABLE "public.actions"
pg_restore: [archiver (db)] Error from TOC entry 197; 1259 16830 TABLE actions zabbix
pg_restore: [archiver (db)] could not execute query: ERROR:  relation "actions" already exists
    Command was: CREATE TABLE public.actions (
    actionid bigint NOT NULL,
    name character varying(255) DEFAULT ''::character varying NO...
pg_restore: creating TABLE "public.alerts"
pg_restore: [archiver (db)] Error from TOC entry 244; 1259 17430 TABLE alerts zabbix
pg_restore: [archiver (db)] could not execute query: ERROR:  relation "alerts" already exists
    Command was: CREATE TABLE public.alerts (
    alertid bigint NOT NULL,
    actionid bigint NOT NULL,
    eventid bigint NOT NULL,
    use...



/Library/PostgreSQL/9.6/bin/pg_restore --host "192.168.5.30" --port "5432" --username "postgres" --role "zabbix" --dbname "zabbix" --verbose "/Users/pennthee/Downloads/192_168_5_30_zabbixdb"
pg_restore: connecting to database for restore
Password: 
pg_restore: [archiver (db)] Error while INITIALIZING:
pg_restore: [archiver (db)] could not execute query: ERROR:  unrecognized configuration parameter "lock_timeout"
    Command was: SET lock_timeout = 0;

pg_restore: [archiver (db)] could not execute query: ERROR:  unrecognized configuration parameter "idle_in_transaction_session_timeout"
    Command was: SET idle_in_transaction_session_timeout = 0;

pg_restore: [archiver (db)] could not execute query: ERROR:  unrecognized configuration parameter "row_security"
    Command was: SET row_security = off;

pg_restore: creating SCHEMA "public"
pg_restore: creating COMMENT "SCHEMA public"
pg_restore: creating EXTENSION "plpgsql"
pg_restore: creating COMMENT "EXTENSION plpgsql"
pg_restore: [archiver (db)] Error while PROCESSING TOC:
pg_restore: [archiver (db)] Error from TOC entry 5002; 0 0 COMMENT EXTENSION plpgsql 
pg_restore: [archiver (db)] could not execute query: ERROR:  must be owner of extension plpgsql
    Command was: COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';

# custom/compress backup can only be restored using pg_restore
# any attempt to restore using psql will fail

[root@zabbix1 ~]# sudo -u postgres psql -dzabbix -f /tmp/192_168_5_30_zabbixdb.sql
could not change directory to "/root"
Password: 
psql:/tmp/192_168_5_30_zabbixdb.sql:1: ERROR:  syntax error at or near "PGDMP"
LINE 1: PGDMP
        ^
GRANT
GRANT
psql:/tmp/192_168_5_30_zabbixdb.sql:10: ERROR:  syntax error at or near ""
LINE 1:     acknowledgeid bigint NOT NULL,
        ^
psql:/tmp/192_168_5_30_zabbixdb.sql:25: ERROR:  syntax error at or near ""
LINE 1:     actionid bigint NOT NULL,

psql:/tmp/192_168_5_30_zabbixdb.sql:3181: invalid command \?F
psql:/tmp/192_168_5_30_zabbixdb.sql:3182: invalid command \z??1??(?|???*
psql:/tmp/192_168_5_30_zabbixdb.sql:3183: ERROR:  invalid byte sequence for encoding "UTF8": 0x8d
psql:/tmp/192_168_5_30_zabbixdb.sql:3185: invalid command \X,?PI???^ɛ??M???????P?(bj???d?pRJ?P??7?,?o???l?Z`cj
psql:/tmp/192_168_5_30_zabbixdb.sql:3188: invalid command \?g?C?t41$W?????b???p?S??E?Vs???A??++{?*f?r9h?w?ɵ4j
psql:/tmp/192_168_5_30_zabbixdb.sql:3198: invalid command \?da~????{
psql:/tmp/192_168_5_30_zabbixdb.sql:22824: ERROR:  invalid byte sequence for encoding "UTF8": 0xd6 0x26
[root@zabbix1 ~]# 
