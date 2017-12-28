drop table cdr_asterisk;

CREATE TABLE public.cdr_asterisk
(
  id SERIAL NOT NULL,
  calldate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  clid varchar(80) NOT NULL default '',
  src varchar(80)  NOT NULL default '',
  dst varchar(80)  NOT NULL default '',
  dcontext varchar(80)  NOT NULL default '',
  lastapp varchar(200)  NOT NULL default '',
  lastdata varchar(200)  NOT NULL default '',
  duration int  default NULL,
  billsec int  default NULL,
  disposition varchar(45)  default '',
  channel varchar(50)  default '',
  dstchannel varchar(50)  default '',
  amaflags varchar(50)  default '',
  accountcode varchar(20)  default '',
  uniqueid varchar(32)  NOT NULL default '',
  userfield varchar(100)  default '',
  answer TIMESTAMP NOT NULL,
  end1 TIMESTAMP NOT NULL,
  CONSTRAINT cdr_asterisk_pkey PRIMARY KEY (id)
  
);
insert  into cdr_asterisk(id,calldate,clid,src,dst,dcontext,lastapp,lastdata,duration,billsec,disposition,channel,dstchannel,amaflags,accountcode,uniqueid,userfield,answer,end1) values (1,'2016-01-27 09:08:56','','','65225483','vocalcom-sana','Hangup','',1,1,'ANSWERED','SIP/8229963122-00000007','SIP/red-sana-00000008','BILLING','0338778408','1452082136.7','ANEXO','2016-01-06 09:09:14','2016-01-06 09:08:56');
insert  into cdr_asterisk(id,calldate,clid,src,dst,dcontext,lastapp,lastdata,duration,billsec,disposition,channel,dstchannel,amaflags,accountcode,uniqueid,userfield,answer,end1) values (2,'2016-01-27 10:08:56','','','65225483','vocalcom-sana','Hangup','',1,2,'ANSWERED','SIP/8229963122-00000007','SIP/red-sana-00000008','BILLING','0338778408','1452082136.7','MOVIL GSM','2016-01-06 09:09:14','2016-01-06 09:08:56');
insert  into cdr_asterisk(id,calldate,clid,src,dst,dcontext,lastapp,lastdata,duration,billsec,disposition,channel,dstchannel,amaflags,accountcode,uniqueid,userfield,answer,end1) values (3,'2016-01-27 11:08:56','','','65225483','vocalcom-sana','Hangup','',1,3,'ANSWERED','SIP/8229963122-00000007','SIP/red-sana-00000008','BILLING','0338778408','1452082136.7','600','2016-01-06 09:09:14','2016-01-06 09:08:56');
insert  into cdr_asterisk(id,calldate,clid,src,dst,dcontext,lastapp,lastdata,duration,billsec,disposition,channel,dstchannel,amaflags,accountcode,uniqueid,userfield,answer,end1) values (4,'2016-01-27 09:08:56','','','65225483','vocalcom-sana','Hangup','',1,4,'ANSWERED','SIP/8229963122-00000007','SIP/red-sana-00000008','BILLING','0154508326','1452082136.7','ANEXO','2016-01-06 09:09:14','2016-01-06 09:08:56');
insert  into cdr_asterisk(id,calldate,clid,src,dst,dcontext,lastapp,lastdata,duration,billsec,disposition,channel,dstchannel,amaflags,accountcode,uniqueid,userfield,answer,end1) values (5,'2016-01-27 10:08:56','','','65225483','vocalcom-sana','Hangup','',1,5,'ANSWERED','SIP/8229963122-00000007','SIP/red-sana-00000008','BILLING','0154508326','1452082136.7','MOVIL GSM','2016-01-06 09:09:14','2016-01-06 09:08:56');
insert  into cdr_asterisk(id,calldate,clid,src,dst,dcontext,lastapp,lastdata,duration,billsec,disposition,channel,dstchannel,amaflags,accountcode,uniqueid,userfield,answer,end1) values (6,'2016-01-27 11:08:56','','','65225483','vocalcom-sana','Hangup','',1,6,'ANSWERED','SIP/8229963122-00000007','SIP/red-sana-00000008','BILLING','0154508326','1452082136.7','600','2016-01-06 09:09:14','2016-01-06 09:08:56');
insert  into cdr_asterisk(id,calldate,clid,src,dst,dcontext,lastapp,lastdata,duration,billsec,disposition,channel,dstchannel,amaflags,accountcode,uniqueid,userfield,answer,end1) values (7,'2016-01-27 09:08:56','','','65225483','vocalcom-sana','Hangup','',1,7,'ANSWERED','SIP/8229963122-00000007','SIP/red-sana-00000008','BILLING','4496824319','1452082136.7','ANEXO','2016-01-06 09:09:14','2016-01-06 09:08:56');
insert  into cdr_asterisk(id,calldate,clid,src,dst,dcontext,lastapp,lastdata,duration,billsec,disposition,channel,dstchannel,amaflags,accountcode,uniqueid,userfield,answer,end1) values (8,'2016-01-27 10:08:56','','','65225483','vocalcom-sana','Hangup','',1,8,'ANSWERED','SIP/8229963122-00000007','SIP/red-sana-00000008','BILLING','4496824319','1452082136.7','MOVIL GSM','2016-01-06 09:09:14','2016-01-06 09:08:56');
insert  into cdr_asterisk(id,calldate,clid,src,dst,dcontext,lastapp,lastdata,duration,billsec,disposition,channel,dstchannel,amaflags,accountcode,uniqueid,userfield,answer,end1) values (9,'2016-01-27 11:08:56','','','65225483','vocalcom-sana','Hangup','',1,9,'ANSWERED','SIP/8229963122-00000007','SIP/red-sana-00000008','BILLING','4496824319','1452082136.7','600','2016-01-06 09:09:14','2016-01-06 09:08:56');
insert  into cdr_asterisk(id,calldate,clid,src,dst,dcontext,lastapp,lastdata,duration,billsec,disposition,channel,dstchannel,amaflags,accountcode,uniqueid,userfield,answer,end1) values (10,'2016-01-27 09:08:56','','','65225483','vocalcom-sana','Hangup','',1,0,'NO ANSWER','SIP/8229963122-00000007','SIP/red-sana-00000008','BILLING','0338778408','1452082136.7','ANEXO','2016-01-06 09:09:14','2016-01-06 09:08:56');
insert  into cdr_asterisk(id,calldate,clid,src,dst,dcontext,lastapp,lastdata,duration,billsec,disposition,channel,dstchannel,amaflags,accountcode,uniqueid,userfield,answer,end1) values (11,'2016-01-27 10:08:56','','','65225483','vocalcom-sana','Hangup','',1,0,'NO ANSWER','SIP/8229963122-00000007','SIP/red-sana-00000008','BILLING','0154508326','1452082136.7','MOVIL GSM','2016-01-06 09:09:14','2016-01-06 09:08:56');
insert  into cdr_asterisk(id,calldate,clid,src,dst,dcontext,lastapp,lastdata,duration,billsec,disposition,channel,dstchannel,amaflags,accountcode,uniqueid,userfield,answer,end1) values (12,'2016-01-27 11:08:56','','','65225483','vocalcom-sana','Hangup','',1,0,'NO ANSWER','SIP/8229963122-00000007','SIP/red-sana-00000008','BILLING','4496824319','1452082136.7','600','2016-01-06 09:09:14','2016-01-06 09:08:56');



CREATE EXTENSION dblink;

 SELECT * FROM dblink('dbname=asterisk host=localhost user=postgres password=lftech.,',
    'SELECT id 
        FROM cdr_asterisk') As
            p(id int )