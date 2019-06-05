[root@zabbix1 ~]# date -d @1559702840
Tue Jun  4 22:47:20 EDT 2019
[root@zabbix1 ~]# date
Tue Jun  4 22:48:53 EDT 2019
[root@zabbix1 ~]# date -d @1559622432
Tue Jun  4 00:27:12 EDT 2019
[root@zabbix1 ~]#

select * FROM history_uint where age(to_timestamp(history_uint.clock)) < interval '1 days';

        itemid	clock		    value		    ns
1       23292	  1559622432	234			    539424499	
177188	28347	  1559702847	359792640		715434915
