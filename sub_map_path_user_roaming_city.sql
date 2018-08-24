
SELECT *
  FROM map.sub_map_path
  where msisdn=92049388
  and starttime>=1522512000
  and starttime<=1527004800
  and country_name <> 'Hongkong'
  group by country_name;



  SELECT msisdn, country_name, operator_name
  FROM map.sub_map_path
  where msisdn IN ('59342095',
'92048707',
'92048533',
'92048735',
'92049542',
'92047698',
'92047038',
'92044021',
'92048095',
'92046016',
'92047651',
'92047807',
'92047863',
'92048369',
'92044007',
'68477147',
'92049328')

  and starttime>=1522512000
  and starttime<=1527004800
  and country_name <> 'Hongkong'
  group by (msisdn,country_name,operator_name)
  order by msisdn;