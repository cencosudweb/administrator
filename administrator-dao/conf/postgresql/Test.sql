SELECT * FROM agreement;
SELECT * FROM authorities;
SELECT * FROM channels;
SELECT * FROM commerce;
SELECT * FROM commerce_agreement_fi;
SELECT * FROM document;
SELECT * FROM economic_activity;
SELECT * FROM financial_institution;
SELECT * FROM groups;
SELECT * FROM paid_type;
SELECT * FROM provider;
SELECT * FROM questions;
SELECT * FROM questions_answers;
SELECT * FROM rate;
SELECT * FROM system_log;
SELECT * FROM tariffgroup;
SELECT * FROM tariffgroup_plan;
SELECT * FROM tariffplan;
SELECT * FROM times_limit;
SELECT * FROM type_document;
SELECT * FROM urls_callback;
SELECT * FROM users;
SELECT * FROM users_authorities;
SELECT * FROM users_commerce;
SELECT * FROM users_financial_institution;
SELECT * FROM users_questions_answers;
SELECT * FROM cdr_asterisk;

update cdr_asterisk set calldate = '"2016-01-27 09:08:56"' where id = 1
update cdr_asterisk set calldate = '"2016-02-07 09:08:56"' where id = 1

select * from users

select 'aa' || 'ss'
select now()
select to_char( now(), 'yyyy-MM-01') AS formal
select to_char(MIN(now()),'yyyy-MM-01')
select MIN(1);
SELECT CONCAT('ssss', ' ', 'ssssss');
SELECT to_char(DATE '2014-04-01', 'DD/MM/YYYY');
select to_char(125.8::real, '999D9')

select ((cast(3 as float))/(cast(60 as float) + cast (4 as float))) as item4;
select ( (cast(4 as float))/ (cast(60 as float) + cast (4 as float))) as item4
select CONCAT ( to_char(MIN(now()),'yyyy-MM-01'), ' / ', to_char(MIN(now()),'yyyy-MM-31') ) AS DAY

select to_char(now(),'yyyy-MM-DD HH24:MI:SS')

select to_char(125.8::real, '999D9')
SELECT CAST(coalesce('1', '0') AS integer);
SELECT CAST('2222' AS integer);

select cast('1111' as int)
select SUBSTRING(11,'-',-1)
select now ()

select substring('Hola Mundo' from 2 for 5);
select substring_index(11.00000, '||', 1) as field1
select substring(11.00000, '-', 11.00000) as field1
select split_part('11.00000', '.', 1) || '/' || split_part('sss@asasas',  '@', 1)

SELECT  CONCAT(SUBSTRING_INDEX('sss@asasas','@',-1),'/',SUBSTRING_INDEX('sss@asasas','@',1),'/') 

select regexp_replace('-1111', '-', '\2/\1')

select ( cast(11.00000 as int) )
select to_char(11.00000, '999D9')
select to_char(11.00000::real, '999D9')
select to_char(11333.00000, '999D99S')
select to_char(999.00222000, '999')

select cast(11.00000::numeric)
SELECT 11.00000::numeric          AS _numeric;

select to_char()
  select to_char(11.00000::numeric)    

select cast(split_part(11.00000::numeric, '.', 1) as int)
select split_part('111122.00222000', '.', 1)

SELECT CAST(split_part( to_char(11.00000, '999'), '.', 1) as INTEGER),
SELECT COALESCE(null, 0);
SELECT COALESCE(NULL, 'Empty') AS field_alias
SELECT CASE WHEN NULL IS NULL THEN 'Empty' ELSE field END AS field_alias 


SELECT  'SSS'||', '||'III' FROM ...

 SELECT accountcode -- "0338778408"
     FROM cdr_asterisk
     WHERE accountcode || '' -- || au_lname
           = '0338778408';
SELECT * FROM cdr_asterisk where id > 0  AND accountcode || '' = '0338778408'
SELECT * FROM cdr_asterisk where id > 0  AND calldate || '' >= '2016-01-01 00:00:00'
SELECT * FROM cdr_asterisk where id > 0  ' AND accountcode = 0338778408'::varchar;

AND calldate || '' >= '2016-01-01 00:00:00'

AND calldate >= CAST(CONCAT ( v_starttime,  ' ') as timestamp)



Hibernate: 
select this_.id as id13_0_, this_.accountcode as accountc2_13_0_, this_.amaflags as amaflags13_0_, this_.answer as answer13_0_, this_.billsec as billsec13_0_, this_.calldate as calldate13_0_, this_.channel as channel13_0_, this_.clid as clid13_0_, this_.dcontext as dcontext13_0_, this_.disposition as disposi10_13_0_, this_.dst as dst13_0_, this_.dstchannel as dstchannel13_0_, this_.duration as duration13_0_, this_.end1 as end14_13_0_, this_.lastapp as lastapp13_0_, this_.lastdata as lastdata13_0_, this_.src as src13_0_, this_.uniqueid as uniqueid13_0_, this_.userfield as userfield13_0_ 
from cdr_asterisk this_ 
where this_.calldate>='2016-01-01 00:00:00' and this_.calldate<='2016-01-27 23:59:59' order by this_.calldate desc limit 101 offset 0

Hibernate: 
select EXTRACT (DAY FROM calldate) as day, SUM(billsec) as calltime, SUM(0) as cost, count(*) as nbcall, SUM(0) as buy, SUM(case when billsec>0 then 1 ELSE 0 END) as success_calls, SUM(case when billsec>0 then 1 ELSE 0 END) AS answered_calls, SUM(CASE WHEN disposition='BUSY' THEN 1 ELSE 0 END) AS busy_calls, SUM(CASE WHEN disposition='NO ANSWER' THEN 1 ELSE 0 END) AS no_answered_calls, SUM(CASE WHEN disposition='FAILED' THEN 1 ELSE 0 END) AS failed_calls, SUM(CASE WHEN disposition='CONGESTION' THEN 1 ELSE 0 END) AS congestion_calls, SUM(CASE WHEN disposition='CHANUNAVAIL' THEN 1 ELSE 0 END) AS chanunavail_calls 
from cdr_asterisk this_ 
where this_.calldate>='2016-01-01 00:00:00' and this_.calldate<='2016-01-27 23:59:59'
group by day order by day desc

Hibernate: 
select EXTRACT (HOUR FROM calldate) as hour, SUM(billsec) as calltime, SUM(0) as cost, count(*) as nbcall, SUM(0) as buy, SUM(case when billsec>0 then 1 ELSE 0 END) as success_calls, SUM(case when billsec>0 then 1 ELSE 0 END) AS answered_calls, SUM(CASE WHEN disposition='BUSY' THEN 1 ELSE 0 END) AS busy_calls, SUM(CASE WHEN disposition='NO ANSWER' THEN 1 ELSE 0 END) AS no_answered_calls, SUM(CASE WHEN disposition='FAILED' THEN 1 ELSE 0 END) AS failed_calls, SUM(CASE WHEN disposition='CONGESTION' THEN 1 ELSE 0 END) AS congestion_calls, SUM(CASE WHEN disposition='CHANUNAVAIL' THEN 1 ELSE 0 END) AS chanunavail_calls 
from cdr_asterisk this_ 
where this_.calldate>='2016-01-01 00:00:00' and this_.calldate<='2016-01-27 23:59:59'
group by hour order by hour desc

Hibernate: 
select EXTRACT (MONTH FROM calldate) as month, SUM(billsec) as calltime, SUM(0) as cost, count(*) as nbcall, SUM(0) as buy, SUM(case when billsec>0 then 1 ELSE 0 END) as success_calls, SUM(case when billsec>0 then 1 ELSE 0 END) AS answered_calls, SUM(CASE WHEN disposition='BUSY' THEN 1 ELSE 0 END) AS busy_calls, SUM(CASE WHEN disposition='NO ANSWER' THEN 1 ELSE 0 END) AS no_answered_calls, SUM(CASE WHEN disposition='FAILED' THEN 1 ELSE 0 END) AS failed_calls, SUM(CASE WHEN disposition='CONGESTION' THEN 1 ELSE 0 END) AS congestion_calls, SUM(CASE WHEN disposition='CHANUNAVAIL' THEN 1 ELSE 0 END) AS chanunavail_calls 
from cdr_asterisk this_ 
where this_.calldate>='2016-01-01 00:00:00' and this_.calldate<'2016-02-01 00:00:00' 
group by month order by month desc

Hibernate: 
select this_.id as id13_0_, this_.accountcode as accountc2_13_0_, this_.amaflags as amaflags13_0_, this_.answer as answer13_0_, this_.billsec as billsec13_0_, this_.calldate as calldate13_0_, this_.channel as channel13_0_, this_.clid as clid13_0_, this_.dcontext as dcontext13_0_, this_.disposition as disposi10_13_0_, this_.dst as dst13_0_, this_.dstchannel as dstchannel13_0_, this_.duration as duration13_0_, this_.end1 as end14_13_0_, this_.lastapp as lastapp13_0_, this_.lastdata as lastdata13_0_, this_.src as src13_0_, this_.uniqueid as uniqueid13_0_, this_.userfield as userfield13_0_ 
from cdr_asterisk this_ 
where this_.calldate>='2016-01-01 00:00:00' and this_.calldate<='2016-01-27 23:59:59'
order by this_.calldate desc limit 100 offset 0

Hibernate:  
SELECT COUNT(*) as nbcall  FROM asterisk.dbo.cdr_asterisk c  WHERE c.calldate > 0 AND c.calldate >= '2016-01-01 00:00:00'
Hibernate:  
SELECT COUNT(*) FROM cdr_asterisk c  left outer join users u on c.accountcode=u.useraccount  AND c.calldate >= '2016-01-01 00:00:00'

Hibernate:  
SELECT COUNT(*) FROM cdr_asterisk c  left outer join users u on c.accountcode=u.useraccount  AND c.calldate >= '2016-01-01 00:00:00' AND c.calldate <= '2016-01-27 23:59:59'

Hibernate: 
select this_.id as id13_0_, this_.accountcode as accountc2_13_0_, this_.amaflags as amaflags13_0_, this_.answer as answer13_0_, this_.billsec as billsec13_0_, this_.calldate as calldate13_0_, this_.channel as channel13_0_, this_.clid as clid13_0_, this_.dcontext as dcontext13_0_, this_.disposition as disposi10_13_0_, this_.dst as dst13_0_, this_.dstchannel as dstchannel13_0_, this_.duration as duration13_0_, this_.end1 as end14_13_0_, this_.lastapp as lastapp13_0_, this_.lastdata as lastdata13_0_, this_.src as src13_0_, this_.uniqueid as uniqueid13_0_, this_.userfield as userfield13_0_ 
from cdr_asterisk this_ where this_.calldate>='2016-01-01 00:00:00' and this_.calldate<='2016-01-27 23:59:59' 
order by this_.calldate desc

Hibernate: 
Hibernate: 
select accountcode, CONCAT ( to_char(MIN(calldate),'yyyy-MM-01'), ' / ', to_char(MIN(calldate),'yyyy-MM-31') ) AS DAY, SUM(billsec) as calltime, SUM(0) as cost, count(*) as nbcall, SUM(0) as buy, SUM(case when billsec>0 then 1 ELSE 0 END) as success_calls, SUM(case when billsec>0 then 1 ELSE 0 END) AS answered_calls, SUM(CASE WHEN disposition='BUSY' THEN 1 ELSE 0 END) AS busy_calls, SUM(CASE WHEN disposition='NO ANSWER' THEN 1 ELSE 0 END) AS no_answered_calls, SUM(CASE WHEN disposition='FAILED' THEN 1 ELSE 0 END) AS failed_calls, SUM(CASE WHEN disposition='CONGESTION' THEN 1 ELSE 0 END) AS congestion_calls, SUM(CASE WHEN disposition='CHANUNAVAIL' THEN 1 ELSE 0 END) AS chanunavail_calls 
from cdr_asterisk this_ 
where this_.calldate>='2016-01-01 00:00:00' and this_.calldate<'2016-02-01 00:00:00' group by accountcode


Hibernate: 
select userfield, accountcode, 
CONCAT ( to_char(MIN(calldate),'yyyy-MM-01'), ' / ', to_char(MIN(calldate),'yyyy-MM-31') ) AS DAY, 
SUM(billsec) as calltime, SUM(0) as cost, count(*) as nbcall, SUM(0) as buy, SUM(case when billsec>0 then 1 ELSE 0 END) as success_calls, SUM(case when billsec>0 then 1 ELSE 0 END) AS answered_calls, SUM(CASE WHEN disposition='BUSY' THEN 1 ELSE 0 END) AS busy_calls, SUM(CASE WHEN disposition='NO ANSWER' THEN 1 ELSE 0 END) AS no_answered_calls, SUM(CASE WHEN disposition='FAILED' THEN 1 ELSE 0 END) AS failed_calls, SUM(CASE WHEN disposition='CONGESTION' THEN 1 ELSE 0 END) AS congestion_calls, SUM(CASE WHEN disposition='CHANUNAVAIL' THEN 1 ELSE 0 END) AS chanunavail_calls, 
(CASE WHEN userfield <> '' THEN ( SELECT CAST(split_part( to_char(rate.rateinitial, '999'), '.', 1) as INTEGER)  FROM tariffgroup INNER JOIN tariffgroup_plan  ON tariffgroup.id=tariffgroup_plan.idtariffgroup LEFT OUTER JOIN tariffplan  ON tariffgroup_plan.idtariffplan=tariffplan.id LEFT OUTER JOIN rate  ON tariffplan.id=rate.idtariffplan WHERE tariffgroup.id = 1 AND LEFT(userfield,LENGTH(dialprefix))=dialprefix LIMIT 1 OFFSET 0 ) * SUM(cast(billsec as float))  / 60 ELSE 0 END) AS total 

from cdr_asterisk this_ 
where this_.calldate>='2016-01-01 00:00:00' and this_.calldate<='2016-01-27 23:59:59' 
group by userfield, accountcode


Hibernate: 
select accountcode, EXTRACT (DAY FROM calldate) as day, SUM(billsec) as calltime, SUM(0) as cost, count(*) as nbcall, SUM(0) as buy, SUM(case when billsec>0 then 1 ELSE 0 END) as success_calls, SUM(case when billsec>0 then 1 ELSE 0 END) AS answered_calls, SUM(CASE WHEN disposition='BUSY' THEN 1 ELSE 0 END) AS busy_calls, SUM(CASE WHEN disposition='NO ANSWER' THEN 1 ELSE 0 END) AS no_answered_calls, SUM(CASE WHEN disposition='FAILED' THEN 1 ELSE 0 END) AS failed_calls, SUM(CASE WHEN disposition='CONGESTION' THEN 1 ELSE 0 END) AS congestion_calls, SUM(CASE WHEN disposition='CHANUNAVAIL' THEN 1 ELSE 0 END) AS chanunavail_calls 
from cdr_asterisk this_ 
where this_.calldate>='2016-01-01 00:00:00' and this_.calldate<='2016-01-27 23:59:59' 
group by accountcode, day order by day asc


Hibernate: 
select accountcode, CONCAT ( to_char(MIN(calldate),'yyyy-MM-01'), ' / ', to_char(MIN(calldate),'yyyy-MM-31') ) AS day, ( COALESCE((SELECT SUM(this2_.billsec) FROM  cdr_asterisk this2_ WHERE this2_.accountcode = this_.accountcode  AND this2_.calldate >= CAST(CONCAT ( to_char(calldate,'yyyy-MM-01'),  ' 00:00:00') as timestamp)  AND this2_.calldate<= CAST(CONCAT ( to_char(calldate,'yyyy-MM-01'),  ' 23:59:59') as timestamp)),0) ) AS calltime_01  
from cdr_asterisk this_ 
where this_.calldate>='2016-01-01 00:00:00' and this_.calldate<'2016-02-01 00:00:00'
group by accountcode order by day asc

select * from sp_allcall(
SELECT public.sp_allcall('0338778408','','2016-01-01 00:00:00','2016-01-27 23:59:59','','','','',0,100);
SELECT * from sp_allcall('0338778408','','2016-01-01 00:00:00','2016-01-27 23:59:59','','','','',0,100);

SELECT public.sp_allcallsummaryday('','','2016-01-01 00:00:00','2016-01-27 23:59:59','','','','');
SELECT * from sp_allcallsummaryday('','','2016-01-01 00:00:00','2016-01-27 23:59:59','','','','');

SELECT public.sp_allcallsummaryhour('','','2016-01-01 00:00:00','2016-01-27 23:59:59','','','','');
SELECT * from sp_allcallsummaryhour('','','2016-01-01 00:00:00','2016-01-27 23:59:59','','','','');

SELECT public.sp_allcallsummarymonth('','','2016-01-01 00:00:00','2016-01-27 23:59:59','','','','');
SELECT * from sp_allcallsummarymonth('','','2016-01-01 00:00:00','2016-01-27 23:59:59','','','','');

SELECT public.obtener_total(
   'obtener_total','0338778408','2016-01-01 00:00:00','2016-01-27 23:59:59',1
);
SELECT * FROM recorrer_total_abierto();
select * from SP_GEN_UPDATE_DISCOUNT_BALANCE_CLI(2,'2016-01-01 00:00:00','2016-01-27 23:59:59');

SELECT * FROM  users
UPDATE users SET CREDIT = 10

"0338778408"
"0154508326"
"4496824319"
0.666666666666667
0.833333333333333
SELECT 
-- IFNULL(SUM(CASE WHEN billsec>0 THEN ( billsec / 60  * ( SELECT CONVERT(SUBSTRING_INDEX(rate.rateinitial,'-',-1),UNSIGNED INTEGER)  FROM tariffgroup INNER JOIN tariffgroup_plan  ON tariffgroup.id=tariffgroup_plan.idtariffgroup LEFT OUTER JOIN tariffplan  ON tariffgroup_plan.idtariffplan=tariffplan.id LEFT OUTER JOIN rate  ON tariffplan.id=rate.idtariffplan WHERE tariffgroup.id = v_ID_TARIFF AND LEFT(userfield,LENGTH(dialprefix))=dialprefix LIMIT 0,01) )ELSE 0 END) ,0) AS total  
(CASE WHEN 1 <> 2 THEN ( SELECT CAST(split_part( to_char(rate.rateinitial, '999'), '.', 1) as INTEGER)  FROM tariffgroup INNER JOIN tariffgroup_plan  ON tariffgroup.id=tariffgroup_plan.idtariffgroup LEFT OUTER JOIN tariffplan  ON tariffgroup_plan.idtariffplan=tariffplan.id LEFT OUTER JOIN rate  ON tariffplan.id=rate.idtariffplan WHERE tariffgroup.id = 1 AND LEFT(userfield,LENGTH(dialprefix))=dialprefix LIMIT 1 OFFSET 0 ) * SUM(cast(billsec as float))  / 60 ELSE 0 END) AS total 
-- INTO v_TOT_REG 
FROM cdr_asterisk WHERE accountcode = '0154508326'  AND calldate  >= '2016-01-01 00:00:00' AND calldate  <= '2016-01-27 23:59:59'
group by userfield
			

SELECT sum(billsec) as total FROM  cdr_asterisk WHERE accountcode = '0338778408'  AND calldate  >= '2016-01-01 00:00:00' AND calldate  <= '2016-01-27 23:59:59'
group by userfield;
