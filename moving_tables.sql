SELECT * FROM public.history_text order by clock asc;

SELECT * FROM partitions.history_text_p2019_06_14 order by clock desc;

SELECT * FROM history_text WHERE clock >= 1560139201 AND clock < '1560225601';

1559275201

SELECT * INTO partitions.history_text_p2019_06_10 FROM history_text WHERE clock >= 1560139201 AND clock < '1560225601';

SELECT * INTO partitions.history_text_p2019_05_30 FROM history_text WHERE clock >= 1559188801 AND clock < '1559275201';

SELECT * FROM partitions.history_text_p2019_06_15 order by clock desc;

SELECT * FROM partitions.history_text_p2019_05_30 order by clock asc;

SELECT * INTO films_recent FROM films WHERE date_prod >= '2002-01-01';

1560139201 10 00:00:00
1560225601 11 00:00:00
1560312001 12 00:00:00
