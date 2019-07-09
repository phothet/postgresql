SELECT h.host,i.name,i.key_,v.value,clock,(SELECT to_timestamp (clock)),
EXTRACT (minutes from now()-(SELECT to_timestamp (clock))) as DataAgeMinutes
FROM items i
LEFT JOIN hosts h on (i.hostid=h.hostid)
LEFT JOIN hosts_groups hg on (hg.hostid=h.hostid)
LEFT JOIN groups g ON (g.groupid=hg.groupid)
LEFT JOIN history v ON (i.itemid=v.itemid)
where g.name like 'Zabbix servers' AND
i.name = 'Free disk space on $1 (percentage)' AND
i.key_ <> 'vfs.fs.size[{#FSNAME},pfree]' AND
(SELECT to_timestamp (clock)) >= now() - interval '5 minutes'
