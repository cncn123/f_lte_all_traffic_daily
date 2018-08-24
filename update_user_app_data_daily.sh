15 1 * * * /home/gpadmin/script/jiazhi/all_traffic.sh 1> /home/gpadmin/script/jiazhi/all_traffic.log 2>&1


yyyy=`date +%Y -d "1 day ago $date"`
mm=`date +%m -d "1 day ago $date"`
dd=`date +%d -d "1 day ago $date"`
hh=`date +%H -d "1 day ago  $date"`
month="$yyyy""$mm"
date="$yyyy""$mm""$dd"
hour="$yyyy""$mm""$dd""$hh"


yyyy1=`date +%Y `
mm1=`date +%m `
dd1=`date +%d `
hh1=`date +%H `
month1="$yyyy1""$mm1"
date1="$yyyy1""$mm1""$dd1"
hour1="$yyyy1""$mm1""$dd1""$hh1"

export GPHOME=/usr/local/greenplum-db
source $GPHOME/greenplum_path.sh
export MASTER_DATA_DIRECTORY=/data1/master/gpseg-1
export PGPORT=5432
LD_LIBRARY_PATH=$GPHOME/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH




sql0="

alter table edc_wg.f_lte_all_traffic add partition p"$date" start ("$date") end ("$date1");

insert into edc_wg.f_lte_all_traffic
SELECT date_id, hour_id, city_id, county_id, vendor_id, tac, modelid,
       isvip, imsi, terminal_oid, mme_sgw_ip_add, eci, app_class_top,
       app_class, msisdn, sum(c1),sum(c2),sum(c3),sum(up_flow),sum(down_flow),sum(c4),sum(http_down),sum(
       http_re_delay),sum(comm_c1),sum(comm_c2),sum(comm_tcp_hx_delay),sum(comm_c3),sum(
       comm_tcp_wx_delay),sum(kpi10),sum(sum10),sum(kpi11),sum(sum11),sum(kpi12),sum(sum12),sum(
       kpi13),sum(sum13),sum(kpi14),sum(sum14),sum(kpi15),sum(sum15),sum(kpi16),sum(sum16),sum(kpi17),sum(
       sum17),sum(c5),sum(c6),sum(c7),sum(c8),sum(c9),sum(c10),sum(http_up),rat,mcc,mnc from
(
SELECT date_id, hour_id, city_id, county_id, vendor_id, tac, modelid,
       isvip, imsi, terminal_oid, mme_sgw_ip_add, eci, app_class_top,
       app_class, msisdn, c1, c2, c3, up_flow, down_flow, c4, http_down,
       http_re_delay, comm_c1, comm_c2, comm_tcp_hx_delay, comm_c3,
       comm_tcp_wx_delay, kpi10, sum10, kpi11, sum11, kpi12, sum12,
       kpi13, sum13, kpi14, sum14, kpi15, sum15, kpi16, sum16, kpi17,
       sum17, c5, c6, c7, c8, c9, c10, http_up, rat,mcc,mnc
FROM edc_wg.f_lte_http_"$date"
union all
SELECT date_id, hour_id, city_id, county_id, vendor_id, tac, modelid,
       isvip, imsi, terminal_oid, mme_sgw_ip_add, eci, app_class_top,
       app_class, msisdn, c1, c2, c3, up_flow, down_flow, c4, http_down,
       http_re_delay, comm_c1, comm_c2, comm_tcp_hx_delay, comm_c3,
       comm_tcp_wx_delay, kpi10, sum10, kpi11, sum11, kpi12, sum12,
       kpi13, sum13, kpi14, sum14, kpi15, sum15, kpi16, sum16, kpi17,
       sum17, c5, c6, c7, c8, c9, c10, http_up, rat,mcc,mnc
FROM edc_wg.f_lte_common_"$date"
union all
SELECT date_id, hour_id, city_id, county_id, vendor_id, tac, modelid,
       isvip, imsi, terminal_oid, mme_sgw_ip_add, eci, app_class_top,
       app_class, msisdn, c1, c2, c3, up_flow, down_flow, c4, http_down,
       http_re_delay, comm_c1, comm_c2, comm_tcp_hx_delay, comm_c3,
       comm_tcp_wx_delay, kpi10, sum10, kpi11, sum11, kpi12, sum12,
       kpi13, sum13, kpi14, sum14, kpi15, sum15, kpi16, sum16, kpi17,
       sum17, c5, c6, c7, c8, c9, c10, http_up, rat,mcc,mnc
FROM edc_wg.f_lte_other_"$date"
) a group by date_id, hour_id, city_id, county_id, vendor_id, tac, modelid,
       isvip, imsi, terminal_oid, mme_sgw_ip_add, eci, app_class_top,
       app_class, msisdn, rat,mcc,mnc;


alter table edc_wg.f_lte_all_traffic_daily add partition p"$date" start ("$date") end ("$date1");

insert into f_lte_all_traffic_daily
select
date_id,
mcc,
mnc,
rat,
modelid,
imsi,
msisdn,
app_class_top,
app_class,
sum(up_flow) up_flow,
sum(down_flow) down_flow
from f_lte_all_traffic where date_id="$date" group by date_id,mcc,mnc,rat,modelid,imsi,msisdn,app_class_top,app_class;


"
psql "dbname=cmccfj host=10.250.50.91 port=5432 user=gpadmin password=gpadmin" -c"${sql0}"
