http://semonkey.com/2017-10-26-zabbix_purge.html

#!/bin/bash

read -r -p "Are You Sure to purge old data from zabbix? [Y/n] " input

case $input in
    [yY][eE][sS]|[yY])
 echo "purge start"
psql -Uzabbix -dzabbix -a -f "./purge.sql"
 echo "purge finished"
 ;;

    [nN][oO]|[nN])
 echo "operation cancelled"
       ;;

    *)
 echo "Invalid input...operation cancelled"
 exit 1
 ;;
esac



[root@zabbix1 ~]# ./purge.sh 
Are You Sure to purge old data from zabbix? [Y/n] y
purge start
Password for user zabbix: 
delete FROM alerts where age(to_timestamp(alerts.clock)) > interval '10 days';
DELETE 0
delete FROM acknowledges where age(to_timestamp(acknowledges.clock)) > interval '10 days';
DELETE 0
delete FROM events where age(to_timestamp(events.clock)) > interval '10 days';
DELETE 1464
delete FROM history where age(to_timestamp(history.clock)) > interval '10 days';
DELETE 0
delete FROM history_uint where age(to_timestamp(history_uint.clock)) > interval '10 days' ;
DELETE 465672
delete FROM history_str  where age(to_timestamp(history_str.clock)) > interval '10 days' ;
DELETE 0
delete FROM history_text where age(to_timestamp(history_text.clock)) > interval '10 days' ;
DELETE 77616
delete FROM history_log where age(to_timestamp(history_log.clock)) > interval '10 days' ;
DELETE 0
delete FROM trends where age(to_timestamp(trends.clock)) > interval '30 days';
DELETE 39826
delete FROM trends_uint where age(to_timestamp(trends_uint.clock)) > interval '30 days' ;
DELETE 40665
delete from history where itemid not in (select itemid from items where status='0');
DELETE 0
delete from history_uint where itemid not in (select itemid from items where status='0');
DELETE 0
delete from history_str where itemid not in (select itemid from items where status='0');
DELETE 0
delete from history_text where itemid not in (select itemid from items where status='0');
DELETE 0
delete from history_log where itemid not in (select itemid from items where status='0');
DELETE 0
delete from trends where itemid not in (select itemid from items where status='0');
DELETE 0
delete from trends_uint where itemid not in (select itemid from items where status='0');
DELETE 0
purge finished
[root@zabbix1 ~]# 
