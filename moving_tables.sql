SELECT * FROM public.history_text order by clock asc;

SELECT * FROM partitions.history_text_p2019_06_14 order by clock desc;

SELECT * FROM history_text WHERE clock >= 1560139201 AND clock < '1560225601';

1559275201

SELECT * INTO partitions.history_text_p2019_06_10 FROM history_text WHERE clock >= 1560139201 AND clock < '1560225601';

SELECT * INTO partitions.history_text_p2019_05_30 FROM history_text WHERE clock >= 1559188801 AND clock < '1559275201';

SELECT * FROM partitions.history_text_p2019_06_15 order by clock desc;

SELECT * FROM partitions.history_text_p2019_05_30 order by clock asc;

SELECT * INTO films_recent FROM films WHERE date_prod >= '2002-01-01';

-bash-4.2$ date -d @1559684950
Tue Jun  4 17:49:10 EDT 2019
-bash-4.2$ date -d @1559257090
Thu May 30 18:58:10 EDT 2019
-bash-4.2$ date
Fri Jun 21 23:21:49 EDT 2019
-bash-4.2$ date -d @1560297601
Tue Jun 11 20:00:01 EDT 2019
-bash-4.2$ date -d @1560297610
Tue Jun 11 20:00:10 EDT 2019
-bash-4.2$ date -d @1560297640
Tue Jun 11 20:00:40 EDT 2019
-bash-4.2$ date -d @1560297970
Tue Jun 11 20:06:10 EDT 2019
-bash-4.2$ date -d @1560473590
Thu Jun 13 20:53:10 EDT 2019
-bash-4.2$ date -d @1560297580
Tue Jun 11 19:59:40 EDT 2019
-bash-4.2$ date -d @156046960
Wed Dec 11 21:22:40 EST 1974
-bash-4.2$ date
Fri Jun 21 23:34:57 EDT 2019
-bash-4.2$ date -d @1560484780
Thu Jun 13 23:59:40 EDT 2019
-bash-4.2$ date -d @1560469690
Thu Jun 13 19:48:10 EDT 2019
-bash-4.2$ date -d @1560571180
Fri Jun 14 23:59:40 EDT 2019
-bash-4.2$ date -d @1560484810
Fri Jun 14 00:00:10 EDT 2019
-bash-4.2$ date -d @1560225580
Mon Jun 10 23:59:40 EDT 2019
-bash-4.2$ date -d @1560139210
Mon Jun 10 00:00:10 EDT 2019
-bash-4.2$ 
-bash-4.2$ 
-bash-4.2$ 
-bash-4.2$ 
-bash-4.2$ 
-bash-4.2$ date -d @1560225580
Mon Jun 10 23:59:40 EDT 2019
-bash-4.2$ date -d @1560139210
Mon Jun 10 00:00:10 EDT 2019
-bash-4.2$ 
-bash-4.2$ 
-bash-4.2$ date -d @1560657580
Sat Jun 15 23:59:40 EDT 2019
-bash-4.2$ 
-bash-4.2$ date -d @156057210
Thu Dec 12 00:13:30 EST 1974
-bash-4.2$ date -d @1560571210
Sat Jun 15 00:00:10 EDT 2019
-bash-4.2$ 
-bash-4.2$ 
-bash-4.2$ date -d @1559256910
Thu May 30 18:55:10 EDT 2019
-bash-4.2$ 
-bash-4.2$ 
-bash-4.2$ date -d @1559275180
Thu May 30 23:59:40 EDT 2019
-bash-4.2$ date -d @1559256910
Thu May 30 18:55:10 EDT 2019

1560139201 10 00:00:00
1560225601 11 00:00:00
1560312001 12 00:00:00
