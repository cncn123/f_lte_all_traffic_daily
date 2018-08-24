select SUM(up_flow) up_flow, SUM(down_flow) down_flow FROM(
	SELECT SUM(up_flow)/1024/1024/1024/1024 up_flow, SUM(down_flow)/1024/1024/1024/1024 down_flow FROM edc_wg.f_lte_http_20180408 where msisdn='92049388'
	UNION
	SELECT SUM(up_flow)/1024/1024/1024/1024 up_flow, SUM(down_flow)/1024/1024/1024/1024 down_flow FROM edc_wg.f_lte_other_20180408 where msisdn='92049388'
	UNION
	SELECT SUM(up_flow)/1024/1024/1024/1024 up_flow, SUM(down_flow)/1024/1024/1024/1024 down_flow FROM edc_wg.f_lte_common_20180408 where msisdn='92049388'
 )b  


--cmccfj
-- unit : B
-- convert to
-- TB



SELECT imsi, to_timestamp(starttime) starttime, imei, msisdn, country_name, operator_name, procedure_type, 
       status, purged
  FROM map.sub_map_path where starttime>1522540800 and msisdn='92049388' order by starttime desc;


--cmhk_roaming



SELECT SUM(up_flow) up_flow, SUM(down_flow) down_flow, app_class_name FROM(
	SELECT SUM(up_flow)/1024/1024/1024/1024 up_flow, SUM(down_flow)/1024/1024/1024/1024 down_flow, app_class_top FROM edc_wg.f_lte_http_20180408 GROUP BY app_class_top
	UNION
	SELECT SUM(up_flow)/1024/1024/1024/1024 up_flow, SUM(down_flow)/1024/1024/1024/1024 down_flow, app_class_top FROM edc_wg.f_lte_other_20180408 GROUP BY app_class_top
	UNION
	SELECT SUM(up_flow)/1024/1024/1024/1024 up_flow, SUM(down_flow)/1024/1024/1024/1024 down_flow, app_class_top FROM edc_wg.f_lte_common_20180408 GROUP BY app_class_top
)b LEFT JOIN
(SELECT distinct app_class_id, app_class_name
 FROM edc_wg.d_app_all) c
ON b.app_class_top=c.app_class_id 
ORDER BY down_flow DESC


--- sub class


SELECT msisdn, SUM(up_flow) up_flow, SUM(down_flow) down_flow, app_class_name, app_sub_class_name FROM(
	SELECT SUM(up_flow)/1024/1024/1024/1024 up_flow, SUM(down_flow)/1024/1024/1024/1024 down_flow, msisdn, app_class_top, app_class FROM edc_wg.f_lte_http_20180408 WHERE msisdn='92049388' GROUP BY msisdn, app_class_top, app_class
	UNION
	SELECT SUM(up_flow)/1024/1024/1024/1024 up_flow, SUM(down_flow)/1024/1024/1024/1024 down_flow, msisdn, app_class_top, app_class FROM edc_wg.f_lte_other_20180408 WHERE msisdn='92049388' GROUP BY msisdn, app_class_top, app_class
	UNION
	SELECT SUM(up_flow)/1024/1024/1024/1024 up_flow, SUM(down_flow)/1024/1024/1024/1024 down_flow, msisdn, app_class_top, app_class FROM edc_wg.f_lte_common_20180408 WHERE msisdn='92049388' GROUP BY msisdn, app_class_top, app_class
)b LEFT JOIN
(SELECT distinct app_class_id, app_class_name, app_sub_class_id, app_sub_class_name
 FROM edc_wg.d_app_all) c
ON b.app_class_top=c.app_class_id
AND b.app_class = c.app_sub_class_id
GROUP BY msisdn, app_class_name, app_sub_class_name
ORDER BY down_flow DESC 	


-- f_lte_http_YYYYMMDD                     20171101
-- f_lte_common_YYYYMMDD				   20180404
-- f_lte_other_YYYYMMDD					   20180327



SELECT msisdn, SUM(up_flow) up_flow, SUM(down_flow) down_flow, app_class_name, app_sub_class_name FROM(
	SELECT SUM(up_flow)/1024/1024/1024/1024 up_flow, SUM(down_flow)/1024/1024/1024/1024 down_flow, msisdn, app_class_top, app_class FROM edc_wg.f_lte_http_20180408  GROUP BY msisdn, app_class_top, app_class
	UNION
	SELECT SUM(up_flow)/1024/1024/1024/1024 up_flow, SUM(down_flow)/1024/1024/1024/1024 down_flow, msisdn, app_class_top, app_class FROM edc_wg.f_lte_other_20180408  GROUP BY msisdn, app_class_top, app_class
	UNION
	SELECT SUM(up_flow)/1024/1024/1024/1024 up_flow, SUM(down_flow)/1024/1024/1024/1024 down_flow, msisdn, app_class_top, app_class FROM edc_wg.f_lte_common_20180408  GROUP BY msisdn, app_class_top, app_class
)b LEFT JOIN
(SELECT distinct app_class_id, app_class_name, app_sub_class_id, app_sub_class_name
 FROM edc_wg.d_app_all) c
ON b.app_class_top=c.app_class_id
AND b.app_class = c.app_sub_class_id
GROUP BY msisdn, app_class_name, app_sub_class_name
ORDER BY down_flow DESC 	


SELECT msisdn, SUM(up_flow) up_flow, SUM(down_flow) down_flow, app_class_name, app_sub_class_name FROM(
	SELECT SUM(up_flow)/1024/1024/1024/1024 up_flow, SUM(down_flow)/1024/1024/1024/1024 down_flow, msisdn, app_class_top, app_class FROM edc_wg.f_lte_http_20180408  GROUP BY msisdn, app_class_top, app_class
	UNION
	SELECT SUM(up_flow)/1024/1024/1024/1024 up_flow, SUM(down_flow)/1024/1024/1024/1024 down_flow, msisdn, app_class_top, app_class FROM edc_wg.f_lte_other_20180408  GROUP BY msisdn, app_class_top, app_class
	UNION
	SELECT SUM(up_flow)/1024/1024/1024/1024 up_flow, SUM(down_flow)/1024/1024/1024/1024 down_flow, msisdn, app_class_top, app_class FROM edc_wg.f_lte_common_20180408  GROUP BY msisdn, app_class_top, app_class
)b LEFT JOIN
(SELECT distinct app_class_id, app_class_name, app_sub_class_id, app_sub_class_name
 FROM edc_wg.d_app_all) c
ON b.app_class_top=c.app_class_id
AND b.app_class = c.app_sub_class_id
GROUP BY msisdn, app_class_name, app_sub_class_name
ORDER BY down_flow DESC 	




--- top5 of each




SELECT msisdn, SUM(up_flow) up_flow, SUM(down_flow) down_flow, app_class_name, app_sub_class_name FROM(


	SELECT msisdn, SUM(up_flow) up_flow, SUM(down_flow) down_flow,app_class_top, app_class FROM (
	SELECT SUM(up_flow)/1024/1024/1024/1024 up_flow, SUM(down_flow)/1024/1024/1024/1024 down_flow, msisdn, app_class_top, app_class FROM edc_wg.f_lte_http_20180408  GROUP BY msisdn, app_class_top, app_class
	UNION
	SELECT SUM(up_flow)/1024/1024/1024/1024 up_flow, SUM(down_flow)/1024/1024/1024/1024 down_flow, msisdn, app_class_top, app_class FROM edc_wg.f_lte_other_20180408  GROUP BY msisdn, app_class_top, app_class
	UNION
	SELECT SUM(up_flow)/1024/1024/1024/1024 up_flow, SUM(down_flow)/1024/1024/1024/1024 down_flow, msisdn, app_class_top, app_class FROM edc_wg.f_lte_common_20180408  GROUP BY msisdn, app_class_top, app_class
)b
	LEFT JOIN
(SELECT distinct app_class_id, app_class_name, app_sub_class_id, app_sub_class_name
 FROM edc_wg.d_app_all) c
ON b.app_class_top=c.app_class_id
AND b.app_class = c.app_sub_class_id
GROUP BY msisdn, app_class_name, app_sub_class_name
ORDER BY down_flow DESC 
)


SELECT msisdn, SUM(up_flow) up_flow, SUM(down_flow) down_flow, app_class_name, app_sub_class_name FROM

SELECT msisdn, SUM(up_flow) up_flow, SUM(down_flow) down_flow, ROW_NUMBER() OVER(PARTITION BY b.msisdn ORDER BY down_flow DESC) rank
FROM
(
	SELECT SUM(up_flow)/1024/1024/1024/1024 up_flow, SUM(down_flow)/1024/1024/1024/1024 down_flow, msisdn, app_class_top, app_class FROM edc_wg.f_lte_http_20180408 WHERE msisdn='92049388'  GROUP BY msisdn, app_class_top, app_class
	UNION
	SELECT SUM(up_flow)/1024/1024/1024/1024 up_flow, SUM(down_flow)/1024/1024/1024/1024 down_flow, msisdn, app_class_top, app_class FROM edc_wg.f_lte_other_20180408  WHERE msisdn='92049388' GROUP BY msisdn, app_class_top, app_class
	UNION
	SELECT SUM(up_flow)/1024/1024/1024/1024 up_flow, SUM(down_flow)/1024/1024/1024/1024 down_flow, msisdn, app_class_top, app_class FROM edc_wg.f_lte_common_20180408  WHERE msisdn='92049388' GROUP BY msisdn, app_class_top, app_class
)b LEFT JOIN
(SELECT distinct app_class_id, app_class_name, app_sub_class_id, app_sub_class_name
 FROM edc_wg.d_app_all) c
ON b.app_class_top = c.app_class_id
AND b.app_class = c.app_sub_class_id
GROUP BY msisdn, app_class_name, app_sub_class_name
ORDER BY down_flow DESC 	



select * from 
(select * from edc_wg.f_lte_all_traffic where msisdn = 92049388 and date_id = 20180503) b
LEFT JOIN
(SELECT distinct app_class_id, app_class_name, app_sub_class_id, app_sub_class_name
 FROM edc_wg.d_app_all)c
ON b.app_class_top = c.app_class_id
AND b.app_class = c.app_sub_class_id
order by down_flow desc ;


select * from edc_wg.f_lte_all_traffic_daily where date_id >= 20180501 and date_id <=20180523 


select msisdn,(CAST(up_flow AS INT)+CAST(down_flow AS INT)) as flow from edc_wg.f_lte_all_traffic_daily where date_id >= 20180501 and date_id <=20180523 and msisdn = 92049388 order by flow desc;


select cast(d.up_flow as INT), cast(d.down_flow as INT), cast((d.up_flow+d.down_flow) as INT) as flow, d.app_class_name, d.app_sub_class_name
from
(select SUM(b.up_flow)/1024/1024 as up_flow, SUM(b.down_flow)/1024/1024 as down_flow, c.app_class_name, c.app_sub_class_name FROM 
(select * from edc_wg.f_lte_all_traffic_daily where date_id >= 20180501 and date_id <= 20180523 and msisdn = 93425484) b
LEFT JOIN
(SELECT distinct app_class_id, app_class_name, app_sub_class_id, app_sub_class_name
 FROM edc_wg.d_app_all)c
ON b.app_class_top = c.app_class_id
AND b.app_class = c.app_sub_class_id
group by (c.app_class_name,c.app_sub_class_name)
)d
order by flow desc;


select cast(d.up_flow as INT), cast(d.down_flow as INT), cast((d.up_flow+d.down_flow) as INT) as flow, d.app_class_name, d.app_sub_class_name
from
(select SUM(b.up_flow)/1024/1024 as up_flow, SUM(b.down_flow)/1024/1024 as down_flow, c.app_class_name, c.app_sub_class_name FROM 
(select * from edc_wg.f_lte_all_traffic_daily where date_id >= 20180701 and date_id <= 20180731 and msisdn = 93425484) b
LEFT JOIN
(SELECT distinct app_class_id, app_class_name, app_sub_class_id, app_sub_class_name
 FROM edc_wg.d_app_all)c
ON b.app_class_top = c.app_class_id
AND b.app_class = c.app_sub_class_id
group by (c.app_class_name,c.app_sub_class_name)
)d
order by flow desc;


create table f_lte_all_traffic_roaming_2G(
    like f_lte_all_traffic
    including defaults
    including constraints
    including indexes
);



select cast(d.up_flow as decimal(50,2)), cast(d.down_flow as decimal(50,2)), cast((d.up_flow+d.down_flow) as decimal(50,2)) as flow
from
(select SUM(b.up_flow)/1024/1024 as up_flow, SUM(b.down_flow)/1024/1024 as down_flow FROM 
(select * from edc_wg.f_lte_all_traffic_daily where date_id >= 20180519 and date_id <= 20180525 and msisdn = 92049388 ) b
)d
group by date_id


select * into f_lte_all_traffic__roaming_2g_0519_0525 FROM(
select f.* from f_lte_all_traffic f JOIN Roaming_2G_user r on f.date_id = r.date_id and f.imsi = r.imsi
) g






select d.msisdn, cast((d.up_flow+d.down_flow) as INT) as flow, d.app_class_name, d.app_sub_class_name, ROW_NUMBER() OVER(PARTITION BY d.msisdn ORDER BY (d.up_flow+d.down_flow) DESC) rank
from
(select b.msisdn,SUM(b.up_flow)/1024/1024 as up_flow, SUM(b.down_flow)/1024/1024 as down_flow, c.app_class_name, c.app_sub_class_name FROM 
(select * from edc_wg.f_lte_all_traffic_daily where date_id >= 20180701 and date_id <= 20180731 and mcc='460' and
 msisdn = 93425484 ) b
LEFT JOIN
(SELECT distinct app_class_id, app_class_name, app_sub_class_id, app_sub_class_name
 FROM edc_wg.d_app_all)c
ON b.app_class_top = c.app_class_id
AND b.app_class = c.app_sub_class_id
group by (b.msisdn,c.app_class_name,c.app_sub_class_name)
)d
;


select SUM(b.up_flow) as up_flow, SUM(b.down_flow) as down_flow, c.app_class_name, c.app_sub_class_name FROM 
(select * from edc_wg.f_lte_all_traffic_daily where date_id = 20180523 and msisdn = 92049388) b
LEFT JOIN
(SELECT distinct app_class_id, app_class_name, app_sub_class_id, app_sub_class_name
 FROM edc_wg.d_app_all)c
ON b.app_class_top = c.app_class_id
AND b.app_class = c.app_sub_class_id
group by (c.app_class_name,c.app_sub_class_name)
order by down_flow desc;


select * FROM 
(select * from edc_wg.f_lte_all_traffic_daily where date_id = 20180523 and msisdn = 92049388) b
LEFT JOIN
(SELECT distinct app_class_id, app_class_name, app_sub_class_id, app_sub_class_name
 FROM edc_wg.d_app_all)c
ON b.app_class_top = c.app_class_id
AND b.app_class = c.app_sub_class_id
order by down_flow desc;

select d.up_flow, d.down_flow, (d.up_flow+d.down_flow) as flow, d.app_class_name, d.app_sub_class_name
from
(select SUM(b.up_flow) as up_flow, SUM(b.down_flow) as down_flow, c.app_class_name, c.app_sub_class_name FROM 
(select * from edc_wg.f_lte_all_traffic_daily where date_id >= 20180809 and date_id <= 20180809 and msisdn = 92049388) b
LEFT JOIN
(SELECT distinct app_class_id, app_class_name, app_sub_class_id, app_sub_class_name
 FROM edc_wg.d_app_all)c
ON b.app_class_top = c.app_class_id
AND b.app_class = c.app_sub_class_id
group by (c.app_class_name,c.app_sub_class_name)
)d
order by flow desc;


select d.up_flow, d.down_flow, (d.up_flow+d.down_flow) as flow
from
(select SUM(b.up_flow) as up_flow, SUM(b.down_flow) as down_flow FROM 
(select * from edc_wg.f_lte_all_traffic_daily where date_id >= 20180519 and date_id <= 20180525 and msisdn = 92049388) b
)d


select d.msisdn, d.app_class_name,d.app_sub_class_name,d.frequency
from
(select b.msisdn, c.app_class_name, c.app_sub_class_name,count(*) as frequency FROM 
(select * from edc_wg.f_lte_all_traffic_daily where date_id >= 20180809 and date_id <= 20180809 and msisdn = 92049388) b
LEFT JOIN
(SELECT distinct app_class_id, app_class_name, app_sub_class_id, app_sub_class_name
 FROM edc_wg.d_app_all)c
ON b.app_class_top = c.app_class_id
AND b.app_class = c.app_sub_class_id
group by (b.msisdn,c.app_class_name,c.app_sub_class_name)
)d
order by frequency desc;


select * INTO user_app_top_10_0809 from
(select imsi,msisdn,app_class_name, app_sub_class_name,flow, rank() OVER (PARTITION BY imsi,msisdn ORDER BY flow Desc) as ranking from
(select imsi,msisdn, d.app_class_name, d.app_sub_class_name,(d.up_flow+d.down_flow) as flow
from
(select b.imsi,b.msisdn,SUM(b.up_flow) as up_flow, SUM(b.down_flow) as down_flow, c.app_class_name, c.app_sub_class_name FROM 
(select * from edc_wg.f_lte_all_traffic_daily where date_id >= 20180809 and date_id <= 20180809) b
LEFT JOIN
(SELECT distinct app_class_id, app_class_name, app_sub_class_id, app_sub_class_name
 FROM edc_wg.d_app_all)c
ON b.app_class_top = c.app_class_id
AND b.app_class = c.app_sub_class_id
group by (b.imsi,b.msisdn,c.app_class_name,c.app_sub_class_name)
)d
)g
)h
where ranking<=10
;



select app_class_name, app_sub_class_name,flow from
(select d.app_class_name, d.app_sub_class_name,(d.up_flow+d.down_flow) as flow
from
(select SUM(b.up_flow) as up_flow, SUM(b.down_flow) as down_flow, c.app_class_name, c.app_sub_class_name FROM 
(select * from edc_wg.f_lte_all_traffic_daily where date_id >= 20180809 and date_id <= 20180809) b
LEFT JOIN
(SELECT distinct app_class_id, app_class_name, app_sub_class_id, app_sub_class_name
 FROM edc_wg.d_app_all)c
ON b.app_class_top = c.app_class_id
AND b.app_class = c.app_sub_class_id
group by (c.app_class_name,c.app_sub_class_name)
)d
)g
order by flow desc
limit 10
;

select * INTO total_app_0809 from(
select app_class_name, app_sub_class_name,flow from
(select d.app_class_name, d.app_sub_class_name,(d.up_flow+d.down_flow) as flow
from
(select SUM(b.up_flow) as up_flow, SUM(b.down_flow) as down_flow, c.app_class_name, c.app_sub_class_name FROM 
(select * from edc_wg.f_lte_all_traffic_daily where date_id >= 20180809 and date_id <= 20180809) b
LEFT JOIN
(SELECT distinct app_class_id, app_class_name, app_sub_class_id, app_sub_class_name
 FROM edc_wg.d_app_all)c
ON b.app_class_top = c.app_class_id
AND b.app_class = c.app_sub_class_id
group by (c.app_class_name,c.app_sub_class_name)
)d
)g
order by flow desc
)h
;



SELECT app_class_name, app_sub_class_name, CAST(flow/1024/1024/1024 AS INT)as flow
  FROM edc_wg.total_app_0809
  order by flow desc;




select app_class_name, app_sub_class_name,flow from
(select d.app_class_name, d.app_sub_class_name,(d.up_flow+d.down_flow) as flow
from

select d.app_class_name,d.app_sub_class_name, count(d.msisdn) as user_num from
(
	select distinct c.app_class_name, c.app_sub_class_name, b.msisdn FROM 
(
	select * from edc_wg.f_lte_all_traffic_daily where date_id >= 20180809 and date_id <= 20180809) b
LEFT JOIN
(
	SELECT distinct app_class_id, app_class_name, app_sub_class_id, app_sub_class_name
 FROM edc_wg.d_app_all)c
ON b.app_class_top = c.app_class_id
AND b.app_class = c.app_sub_class_id
)d
group by (d.app_class_name,d.app_sub_class_name)
order by user_num desc
limit 10;


)g
order by flow desc

;


SELECT a.app_class_name, a.app_sub_class_name,a.flow,(a.flow/b.user_num) as average_usage FROM edc_wg.total_app_0809 a, edc_wg.app_user_num_0809 b
where a.app_class_name = b.app_class_name
and a.app_sub_class_name = b.app_sub_class_name



SELECT a.*,c.frequency,d.average
FROM edc_wg.user_app_top_10_0809 a, edc_wg.app_class_average_0809 b,edc_wg.app_user_frequency_0809 c, edc_wg.app_average_frequency_0809 d
WHERE a.app_class_name = b.app_class_name
and b.app_class_name = c.app_class_name
and c.app_class_name = d.app_class_name
and a.app_sub_class_name = b.app_sub_class_name
and b.app_sub_class_name = c.app_sub_class_name
and c.app_sub_class_name = d.app_sub_class_name
and 
(a.flow >= b.average_usage
or c.frequency >= d.average)


select d.app_class_name,d.app_sub_class_name, count(d.msisdn) as user_num from
(
	select distinct c.app_class_name, c.app_sub_class_name, b.msisdn FROM 
(
	select * from edc_wg.f_lte_all_traffic_daily where date_id >= 20180809 and date_id <= 20180809) b
LEFT JOIN
(
	SELECT distinct app_class_id, app_class_name, app_sub_class_id, app_sub_class_name
 FROM edc_wg.d_app_all)c
ON b.app_class_top = c.app_class_id
AND b.app_class = c.app_sub_class_id
)d
group by (d.app_class_name,d.app_sub_class_name)
order by user_num desc
limit 10;



select * from edc_wg.f_lte_all_traffic_daily where date_id >= 20180809 and date_id <= 20180809 
LEFT JOIN
(
	SELECT distinct app_class_id, app_class_name, app_sub_class_id, app_sub_class_name
 FROM edc_wg.d_app_all)c
ON b.app_class_top = c.app_class_id
AND b.app_class = c.app_sub_class_id



select a.app_class_name,a.app_sub_class_name, (a.flow/b.user_num) as average_usage from total_app_0809 a,app_user_num_0809 b
where a.app_class_name = b.app_class_name
and a.app_sub_class_name b.app_sub_class_name
limit 10