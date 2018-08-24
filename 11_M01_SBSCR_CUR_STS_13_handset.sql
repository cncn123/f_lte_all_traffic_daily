select * from 11_M01_SBSCR_CUR_STS where year=2018 and month=05 and day=06 and current_status <> '"Disconnected"' limit 10 ;



select contract_id,MSISDN,rateplan_tenure_in_months 



select a.contract_id,a.msisdn,a.rateplan_tenure_in_months,a.customer_group_type,b.current_used_handset_name_from_usage,b.current_used_handset_os_name_from_usage
from (
(select * from 11_M01_SBSCR_CUR_STS where year=2018 and month=05 and day=06 and current_status = '"Active"')a
LEFT JOIN  
(select * from 13_m01_sbscr_hanset_sum where year=2018 and month=05 and day=06)b
on (a.contract_id = b.contract_id)
) limit 100;

select distinct rateplan_tenure_in_months from 11_M01_SBSCR_CUR_STS where year=2018 and month=05 and day=06;	

select * from 11_M01_SBSCR_CUR_STS where year=2018 and month=05 and day=06 and msisdn = "'92049388'"


(select b.contract_id, b.msisdn, a.current_rate_plan_desc, d.current_used_handset_name_from_usage, d.current_used_handset_os_name_from_usage from(
select * from 18_m01_sbscr_rt_plan a, 11_m01_sbscr_cur_sts b where a.contract_id=b.contract_id and b.msisdn='"92049388"' and b.year=a.year and b.month=a.month and b.day=a.day and b.year=2018 and b.month=05 and b.day=06)) c
LEFT JOIN 13_m01_sbscr_hanset_sum d on (c.contract_id = d.contract_id) limit 10;


select * from (
select a.contract_id, a.current_rate_plan_desc, b.MSISDN from 18_m01_sbscr_rt_plan a, 11_m01_sbscr_cur_sts b where a.contract_id=b.contract_id and b.msisdn='"92049388"' and b.year=a.year and b.month=a.month and b.day=a.day and b.year=2018 and b.month=05 and b.day=06
) c
JOIN 
(select contract_id, current_used_handset_name_from_usage, current_used_handset_os_name_from_usage from 13_m01_sbscr_hanset_sum where year=2018 and month=05 and day=06) d on (c.contract_id = d.contract_id)



11_M01_SBSCR_CUR_STS 
13_m01_sbscr_hanset_sum