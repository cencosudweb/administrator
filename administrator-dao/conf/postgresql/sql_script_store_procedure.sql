-- Function: public.sp_channels(character varying)

-- DROP FUNCTION public.sp_channels(character varying);

CREATE OR REPLACE FUNCTION public.sp_channels(id_ character varying)
  RETURNS SETOF channels AS
$BODY$
DECLARE 
    r channels%ROWTYPE; -- Variable local del tipo fila para la tabla _user.
    -- La parte "%ROWTYPE" es opcional para las versiones actuales de PG.
    r_id channels.id%TYPE; -- No la vamos a usar pero incluimos esta línea
    -- a modo de ejemplo para la definición de una variable local
    -- heredando el tipo de datos de una columna concreta de tabla/vista.
    -- http://www.sonicon.net/ca/bloc/-/blogs/postgresql-uso-de-procedimientos-para-listados-
    -- https://mittaus.wordpress.com/2011/04/02/stored-function/
    -- https://saforas.wordpress.com/2009/11/08/funciones-y-procedimientos-en-postgresql/
    -- 
    v_id INTEGER DEFAULT NULL;

BEGIN
	v_id := id_::INTEGER;


	IF NOT EXISTS(select 1 from channels WHERE id = v_id) THEN
		for r in select id, description from channels loop
		return next r;
		end loop;
	ELSE
		for r in select * from channels WHERE id = v_id loop
		return next r;
		end loop;
			
	END IF;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION public.sp_channels(character varying)
  OWNER TO postgres;



-- Function: public.sp_allcall(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, integer, integer)

-- DROP FUNCTION public.sp_allcall(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, integer, integer);

CREATE OR REPLACE FUNCTION public.sp_allcall(
    accountcode_ character varying,
    disposition_ character varying,
    starttime_ character varying,
    stoptime_ character varying,
    src_ character varying,
    dst_ character varying,
    lastdata_ character varying,
    userfield_ character varying,
    start_ integer,
    limit_ integer)
  RETURNS SETOF cdr_asterisk AS
$BODY$
DECLARE 
	-- =============================================
	-- Autor	:	JOSE GARRIDO
	-- ALTER  date	:	<20151228>
	-- Description	:	<Obtiene todas las llamadas>
	-- Modificacion	: 
	-- EJEMPLO	: 
	--	SELECT public.sp_allcall('','','','','','','','',0,0);
	--	SELECT * from sp_allcall('','','','','','','','',0,0);
	-- =============================================
    r cdr_asterisk%ROWTYPE; -- Variable local del tipo fila para la tabla _user.
   
    v_accountcode 			VARCHAR(100);
    v_disposition 			VARCHAR(100);
    v_starttime 			VARCHAR(100);
    v_stoptime 				VARCHAR(100);
    v_src				VARCHAR(100);
    v_dst				VARCHAR(100);
    v_lastdata 				VARCHAR(100);
    v_userfield 			VARCHAR(100);
    v_row				VARCHAR(400);
    v_FG_TABLE_NAME			VARCHAR(100);
    v_start				INTEGER;
    v_limit				INTEGER;
    test				VARCHAR(100);
    SQL					VARCHAR(1000);

    var 				VARCHAR(50);
    res 				VARCHAR(10);	

BEGIN
	v_accountcode 			:= accountcode_;
	v_disposition 			:= disposition_;
	v_starttime 			:= starttime_;
	v_stoptime 			:= stoptime_;
	v_src 				:= src_;
	v_dst 				:= dst_;
	v_lastdata 			:= lastdata_::VARCHAR(1000);
	v_userfield 			:= userfield_::VARCHAR(1000);
        v_FG_TABLE_NAME			:= 'asterisk.cdr_asterisk';
	v_start				:= start_;
	v_limit				:= limit_;
	SQL				:= '';

	SQL := CONCAT('select 1 from cdr_asterisk WHERE id > 0 ');
	RAISE NOTICE 'Inicio  query si existe%', SQL;  -- Prints 30
	
	
	IF NOT EXISTS(
			select 1 
			from 
				cdr_asterisk 
			WHERE id > 0 
			and calldate >= CAST(CONCAT ( v_starttime,  ' ') as timestamp) 
			and calldate <= CAST(CONCAT ( v_stoptime,  ' ') as timestamp) 
			and (accountcode	like '%'||v_accountcode||'%' or v_accountcode = '-')
			and (disposition	like '%'||v_disposition||'%' or v_disposition = '-')
			and (src		like '%'||v_src||'%' or v_src = '-')
			and (dst		like '%'||v_dst||'%' or v_dst = '-')
			and (lastdata		like '%'||v_lastdata||'%' or v_lastdata = '-')
			and (userfield		like '%'||v_userfield||'%' or v_userfield = '-')
			
		     ) THEN
		for r in 
			select 
				id, 
				calldate,
				clid,
				src,
				dst,
				dcontext,
				lastapp,
				lastdata,
				duration,
				billsec,
				disposition,
				channel,
				dstchannel,
				amaflags,
				accountcode,
				uniqueid,
				userfield,
				answer,
				end1
			from 
				cdr_asterisk 
			WHERE 
				id > 0 
			and calldate >= CAST(CONCAT ( v_starttime,  ' ') as timestamp) 
			and calldate <= CAST(CONCAT ( v_stoptime,  ' ') as timestamp) 
			and (accountcode	like '%'||v_accountcode||'%' or v_accountcode = '-')
			and (disposition	like '%'||v_disposition||'%' or v_disposition = '-')
			and (src		like '%'||v_src||'%' or v_src = '-')
			and (dst		like '%'||v_dst||'%' or v_dst = '-')
			and (lastdata		like '%'||v_lastdata||'%' or v_lastdata = '-')
			and (userfield		like '%'||v_userfield||'%' or v_userfield = '-')
			limit v_limit offset v_start
		loop
		return next r;
		end loop;
	ELSE
		for r in select
				id, 
				calldate,
				clid,
				src,
				dst,
				dcontext,
				lastapp,
				lastdata,
				duration,
				billsec,
				disposition,
				channel,
				dstchannel,
				amaflags,
				accountcode,
				uniqueid,
				userfield,
				answer,
				end1 			
		
			 from 
			       cdr_asterisk 
			 WHERE 
			       id > 0 
			 and calldate >= CAST(CONCAT ( v_starttime,  ' ') as timestamp) 
			 and calldate <= CAST(CONCAT ( v_stoptime,  ' ') as timestamp) 
			 and (accountcode	like '%'||v_accountcode||'%' or v_accountcode = '-')
			 and (disposition	like '%'||v_disposition||'%' or v_disposition = '-')
			 and (src		like '%'||v_src||'%' or v_src = '-')
			 and (dst		like '%'||v_dst||'%' or v_dst = '-')
			 and (lastdata		like '%'||v_lastdata||'%' or v_lastdata = '-')
			 and (userfield		like '%'||v_userfield||'%' or v_userfield = '-')
			 limit v_limit offset v_start
		loop
		return next r;
		end loop;
			
	END IF;
	
	RAISE NOTICE 'Termina query %', '';  -- Prints 30
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION public.sp_allcall(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, integer, integer)
  OWNER TO postgres;
  
  -- Function: public.sp_allcallsummaryday(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying)

-- DROP FUNCTION public.sp_allcallsummaryday(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying);

CREATE OR REPLACE FUNCTION public.sp_allcallsummaryday(
    accountcode_ character varying,
    disposition_ character varying,
    starttime_ character varying,
    stoptime_ character varying,
    src_ character varying,
    dst_ character varying,
    lastdata_ character varying,
    userfield_ character varying)
  RETURNS SETOF cdr_asterisk AS
$BODY$
DECLARE 
	-- =============================================
	-- Autor	:	JOSE GARRIDO
	-- ALTER  date	:	<20151228>
	-- Description	:	<Obtiene todas las llamadas>
	-- Modificacion	: 
	-- EJEMPLO	: 
	--	SELECT public.sp_allcallsummaryday('','','','','','','','');
	--	SELECT * from sp_allcallsummaryday('','','','','','','','');
	-- =============================================
    r cdr_asterisk%ROWTYPE; -- Variable local del tipo fila para la tabla _user.
   
    v_accountcode 			VARCHAR(100);
    v_disposition 			VARCHAR(100);
    v_starttime 			VARCHAR(100);
    v_stoptime 				VARCHAR(100);
    v_src				VARCHAR(100);
    v_dst				VARCHAR(100);
    v_lastdata 				VARCHAR(100);
    v_userfield 			VARCHAR(100);
    v_row				VARCHAR(400);
    v_FG_TABLE_NAME			VARCHAR(100);
    SQL					VARCHAR(1000);

    var 				VARCHAR(50);
    res 				VARCHAR(10);	

BEGIN
	v_accountcode 			:= accountcode_;
	v_disposition 			:= disposition_;
	v_starttime 			:= starttime_;
	v_stoptime 			:= stoptime_;
	v_src 				:= src_;
	v_dst 				:= dst_;
	v_lastdata 			:= lastdata_;
	v_userfield 			:= userfield_;
        v_FG_TABLE_NAME			:= 'asterisk.cdr_asterisk';
	SQL				:= '';

	SQL := CONCAT('select 1 from cdr_asterisk WHERE id > 0 ');
	RAISE NOTICE 'Inicio  query si existe%', SQL;  -- Prints 30
	
	
	IF NOT EXISTS(
			select 1 
			from 
				cdr_asterisk 
			WHERE id > 0 
			and calldate >= CAST(CONCAT ( v_starttime,  ' ') as timestamp) 
			and calldate <= CAST(CONCAT ( v_stoptime,  ' ') as timestamp) 
			and (accountcode	like '%'||v_accountcode||'%' or v_accountcode = '-')
			and (disposition	like '%'||v_disposition||'%' or v_disposition = '-')
			and (src		like '%'||v_src||'%' or v_src = '-')
			and (dst		like '%'||v_dst||'%' or v_dst = '-')
			and (lastdata		like '%'||v_lastdata||'%' or v_lastdata = '-')
			and (userfield		like '%'||v_userfield||'%' or v_userfield = '-')
			
		     ) THEN
		for r in 
			select 
				
				EXTRACT (DAY FROM calldate) as day
				

				-- SUM(billsec) as calltime
				-- SUM(0) as cost, 
				-- count(*) as nbcall
				-- SUM(0) as buy, 
				-- SUM(case when billsec>0 then 1 ELSE 0 END) as success_calls, 
				-- SUM(case when billsec>0 then 1 ELSE 0 END) AS answered_calls, 
				-- SUM(CASE WHEN disposition='BUSY' THEN 1 ELSE 0 END) AS busy_calls, 
				-- SUM(CASE WHEN disposition='NO ANSWER' THEN 1 ELSE 0 END) AS no_answered_calls, 
				-- SUM(CASE WHEN disposition='FAILED' THEN 1 ELSE 0 END) AS failed_calls,
				-- SUM(CASE WHEN disposition='CONGESTION' THEN 1 ELSE 0 END) AS congestion_calls, 
				-- SUM(CASE WHEN disposition='CHANUNAVAIL' THEN 1 ELSE 0 END) AS chanunavail_calls 

			from 
				cdr_asterisk 
			WHERE 
				 calldate >= CAST(CONCAT ( v_starttime,  ' ') as timestamp) 
			and calldate <= CAST(CONCAT ( v_stoptime,  ' ') as timestamp) 
			and (accountcode	like '%'||v_accountcode||'%' or v_accountcode = '-')
			and (disposition	like '%'||v_disposition||'%' or v_disposition = '-')
			and (src		like '%'||v_src||'%' or v_src = '-')
			and (dst		like '%'||v_dst||'%' or v_dst = '-')
			and (lastdata		like '%'||v_lastdata||'%' or v_lastdata = '-')
			and (userfield		like '%'||v_userfield||'%' or v_userfield = '-')
			group by day order by day desc

		loop
		return next r;
		end loop;
	ELSE
		for r in select
				
				EXTRACT (DAY FROM calldate) as day
				
				-- SUM(billsec) as calltime
				-- SUM(0) as cost, 
				-- count(*) as nbcall
				-- SUM(0) as buy, 
				-- SUM(case when billsec>0 then 1 ELSE 0 END) as success_calls, 
				-- SUM(case when billsec>0 then 1 ELSE 0 END) AS answered_calls, 
				-- SUM(CASE WHEN disposition='BUSY' THEN 1 ELSE 0 END) AS busy_calls, 
				-- SUM(CASE WHEN disposition='NO ANSWER' THEN 1 ELSE 0 END) AS no_answered_calls, 
				-- SUM(CASE WHEN disposition='FAILED' THEN 1 ELSE 0 END) AS failed_calls, 
				-- SUM(CASE WHEN disposition='CONGESTION' THEN 1 ELSE 0 END) AS congestion_calls, 
				-- SUM(CASE WHEN disposition='CHANUNAVAIL' THEN 1 ELSE 0 END) AS chanunavail_calls 
 			
		
			 from 
			       cdr_asterisk 
			 WHERE 
			       calldate >= CAST(CONCAT ( v_starttime,  ' ') as timestamp) 
			 and calldate <= CAST(CONCAT ( v_stoptime,  ' ') as timestamp) 
			 and (accountcode	like '%'||v_accountcode||'%' or v_accountcode = '-')
			 and (disposition	like '%'||v_disposition||'%' or v_disposition = '-')
			 and (src		like '%'||v_src||'%' or v_src = '-')
			 and (dst		like '%'||v_dst||'%' or v_dst = '-')
			 and (lastdata		like '%'||v_lastdata||'%' or v_lastdata = '-')
			 and (userfield		like '%'||v_userfield||'%' or v_userfield = '-')
			 group by day order by day desc
		loop
		return next r;
		end loop;
			
	END IF;
	
	RAISE NOTICE 'Termina query %', '';  -- Prints 30
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION public.sp_allcallsummaryday(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying)
  OWNER TO postgres;
  
  -- Function: public.obtener_total(refcursor, character varying, character varying, character varying, integer)

-- DROP FUNCTION public.obtener_total(refcursor, character varying, character varying, character varying, integer);

CREATE OR REPLACE FUNCTION public.obtener_total(
    refcursor,
    vaccountcode character varying,
    vstarttime character varying,
    vendtime character varying,
    vtariff integer)
  RETURNS refcursor AS
$BODY$
BEGIN
	-- https://networkfaculty.com/es/video/detail/1109-postgresql-plpgsql---trabajo-con-cursores
	OPEN $1 FOR SELECT (CASE WHEN userfield <> '' THEN ( SELECT CAST(split_part( to_char(rate.rateinitial, '999'), '.', 1) as INTEGER)  FROM tariffgroup INNER JOIN tariffgroup_plan  ON tariffgroup.id=tariffgroup_plan.idtariffgroup LEFT OUTER JOIN tariffplan  ON tariffgroup_plan.idtariffplan=tariffplan.id LEFT OUTER JOIN rate  ON tariffplan.id=rate.idtariffplan WHERE tariffgroup.id = vTARIFF AND LEFT(userfield,LENGTH(dialprefix))=dialprefix LIMIT 1 OFFSET 0 ) * SUM(cast(billsec as float))  / 60 ELSE 0 END) AS total  FROM  cdr_asterisk WHERE accountcode = vACCOUNTCODE  AND calldate  >= CAST(CONCAT ( vSTARTTIME,  ' ') as timestamp)  AND calldate  <= CAST(CONCAT ( vENDTIME,  ' ') as timestamp) 
group by userfield;
	RETURN $1;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.obtener_total(refcursor, character varying, character varying, character varying, integer)
  OWNER TO postgres;
  
  -- Function: public.recorrer_total_abierto()

-- DROP FUNCTION public.recorrer_total_abierto();

CREATE OR REPLACE FUNCTION public.recorrer_total_abierto()
  RETURNS void AS
$BODY$
DECLARE  r record;
c refcursor;
DECLARE v_TOT_REG				FLOAT;
BEGIN
	
	-- https://networkfaculty.com/es/video/detail/1109-postgresql-plpgsql---trabajo-con-cursores
	c := obtener_total(c,'0338778408','2016-01-01 00:00:00','2016-01-27 23:59:59',1);
	v_TOT_REG := 0;
	LOOP
		FETCH FROM c INTO r;
		EXIT WHEN NOT FOUND;
		-- RAISE NOTICE 'titulo: %', r.total;
		v_TOT_REG := v_TOT_REG + r.total;
		RAISE NOTICE 'titulo: %', r.total;
	END LOOP;
	CLOSE c;
	RAISE NOTICE 'v_TOT_REG: %', v_TOT_REG;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.recorrer_total_abierto()
  OWNER TO postgres;



  
  -- Function: public.sp_gen_update_discount_balance_cli(integer, character varying, character varying)

-- DROP FUNCTION public.sp_gen_update_discount_balance_cli(integer, character varying, character varying);

CREATE OR REPLACE FUNCTION public.sp_gen_update_discount_balance_cli(
    pi_ncaso_ejc integer,
    vstarttime character varying,
    vendtime character varying)
  RETURNS void AS
$BODY$
	DECLARE  r record;
	cursor1 CURSOR FOR SELECT id, rut, paidtype,attempts, STATUS ,id_tariff,useraccount, credit FROM users LIMIT 20;

	c2 refcursor;
	DECLARE  r2 record;

	DECLARE SERVIDOR				VARCHAR(50);
	DECLARE SALIDA					VARCHAR(200);
	DECLARE OPE_REC					NUMERIC;
	DECLARE OPE_CLI					NUMERIC;
	DECLARE OPE_CLI_UNI				NUMERIC;
	DECLARE OPE_CLI_REP				NUMERIC;
	DECLARE CLI_ACT					NUMERIC;
	DECLARE OPE_ALT					NUMERIC;
	DECLARE OPE_ALT_OPE_SIN_REC			NUMERIC;
	DECLARE OPE_ALT_CAM_EST				NUMERIC;
	DECLARE OPE_BAJ					NUMERIC;
	DECLARE EST_CLI					NUMERIC;
	DECLARE ALT_SIN_REC				NUMERIC;
	DECLARE BAJ_SIN_CLI				NUMERIC;
	DECLARE FEC_TER					VARCHAR(08);
	
	-- -----------------------------------------------------------
	DECLARE vBEM_MNT_DEU_DIA        		FLOAT;            	-- VALOR DEUDA DIA
	DECLARE vBEM_EST_REG			 	VARCHAR(1);       	-- CODIGO DE REGISTRO
	-- -----------------------------------------------------------------------------------------
	DECLARE k_vFEC_PCS				VARCHAR(8);
	DECLARE k_vCLI_VIG				VARCHAR(1);
	DECLARE k_vCLI_NO_VIG			 	VARCHAR(1);
	DECLARE k_vCLI_HIS				VARCHAR(1);
	
	-- -----------------------------------------------------------------------------------------	
	DECLARE v_nCNT_LEI				INT;
	DECLARE v_nCNT_VIG				INT;
	DECLARE v_nCNT_VIG_INS			 	INT; 
	DECLARE v_nCNT_VIG_UPD			 	FLOAT;
	DECLARE v_nCNT_NO_VIG			 	INT;
	DECLARE v_nCNT_VIG_SIN_DEU  	 		INT;
	DECLARE v_nCNT_NO_VIG_CMB_EST	 		INT; 
	DECLARE v_nCNT_NO_VIG_HIS		 	INT;
	DECLARE v_nCNT_VIG_SD           		INT; 
	DECLARE v_nPCS_BTC			     	INT;
	DECLARE v_nCANT_UPD			 	INT;
	
	-- -----------------------------------------------------------------------------------------	
	DECLARE v_vTXT_CASO_EJC				VARCHAR(50);
	
	-- -----------------------------------------------------------------------------------------	
	DECLARE COD_EST_BIT			 	VARCHAR(3);       	-- CODIGO DE ESTADO DE CLICIO DE BITACORA
	
	-- -----------------------------------------------------------------------------------------	
	DECLARE v_nMUESTRA_MSG          		INT; 			--  MOSTRAR LOS PRINT (SOLO PARA REVISION DE EJECUION)
	-- -----------------------------------------------------------------------------------------
	
	-- -----------------------------------------------------------------------------------------
	DECLARE v_PAID_TYPE				INT;
	DECLARE v_ID					INT;
	DECLARE vCUR_RUT_CLI			 	VARCHAR(15);      	-- RUT DEL CLIENTE
	DECLARE v_ATTEMPTS				INT;
	DECLARE v_STATUS				INT;
	DECLARE v_ID_TARIFF				INT;
	DECLARE v_USERACCOUNT          			VARCHAR(12); 
	DECLARE v_CREDIT          			FLOAT; 
	
	DECLARE v_BALANCE_DIA				FLOAT;            	-- VALOR SALDO DIA
	DECLARE v_TOT_REG				FLOAT;
	DECLARE v_TOT_REG_S_VGTE			FLOAT;
	DECLARE v_TOT_REG_N_VGTE			FLOAT;

BEGIN
	v_nMUESTRA_MSG := 1; --PARA MOSTRAR LOS PRINT (SOLO PARA REVISION DE EJECUION)
	
	RAISE NOTICE '%', to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ' || to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ';        
	RAISE NOTICE '%', to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ' || to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' PROCESO ACTUALIZACION INFORMACION SALDO';
	RAISE NOTICE '%', to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ' || to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ' ; 

	IF pi_nCASO_EJC = 1 THEN
		v_vTXT_CASO_EJC := 'SOLO CLIENTES POSTPAGOS';
	ELSE 
		v_vTXT_CASO_EJC := 'CASO INVALIDO. NO PROCESA';	
	END IF;
	-- ---------------------------------------------------
	-- ACTUALIZACION DE SALDO PARA CLIENTES POSTPAGOS
	-- ---------------------------------------------------
	IF pi_nCASO_EJC IN (1) THEN
		RAISE NOTICE '%', to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ' || to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ';        
		RAISE NOTICE '%', to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ' || to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ... INICIO ETAPA PROCESO ACTUALIZACION SALDO POSTPAGOS';
		RAISE NOTICE '%', to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ' || to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ' ; 

		RAISE NOTICE  '%', to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ' || to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ';
		RAISE NOTICE  '%', to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ' || to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ';
		RAISE NOTICE  '%', to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ' || to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ESTADISTICAS DEL PROCESO';
		RAISE NOTICE  '%', to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ' || to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ========================';
		RAISE NOTICE  '%', to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ' || to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ';
		RAISE NOTICE  '%', to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ' || to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' OPERACIONES EN RECOBRO PREVIO PROCESO     : ' || to_char(pi_nCASO_EJC, '999');
		RAISE NOTICE  '%', to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ' || to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' OPERACIONES MENSAJES          : ' || v_vTXT_CASO_EJC ;
		RAISE NOTICE  '%', to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ' || to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ';
		RAISE NOTICE  '%', to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ' || to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ' ;

		RAISE NOTICE '%', to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ' || to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ';        
		RAISE NOTICE '%', to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ' || to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ... TERMINO ETAPA PROCESO ACTUALIZACION SALDO POSTPAGOS';
		RAISE NOTICE '%', to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ' || to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ' ;    
		     
	END IF;

	-----------------------------------------------------
	-- ACTUALIZACION DE SALDO PARA CLIENTES PREPAGOS
	-----------------------------------------------------
	IF pi_nCASO_EJC IN (2) THEN
		RAISE NOTICE '%', to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ' || to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ';        
		RAISE NOTICE '%', to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ' || to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ... INICIO ETAPA PROCESO ACTUALIZACION SALDO POSTPAGOS';
		RAISE NOTICE '%', to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ' || to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ' ; 
		
		k_vFEC_PCS := '';
		k_vCLI_VIG := 'S';
		k_vCLI_NO_VIG := 'N';
		k_vCLI_HIS := 'H';
		v_nCNT_LEI := 0;
		v_TOT_REG := 0;
	
		OPEN cursor1;
		LOOP
			FETCH FROM cursor1 INTO r;
			EXIT WHEN NOT FOUND;
			RAISE NOTICE 'titulo: %', r.id || r.rut || r.paidtype || r.attempts || r.STATUS || r.id_tariff || r.useraccount || r.credit;
			v_ID := r.id; 
			vCUR_RUT_CLI := r.rut;
			v_PAID_TYPE := r.paidtype; 
			v_ATTEMPTS := r.attempts ;  
			v_STATUS := r.STATUS;
			v_ID_TARIFF := r.id_tariff;
			v_USERACCOUNT := r.useraccount;
			v_CREDIT := r.credit;
			v_nCNT_LEI := v_nCNT_LEI + 1;

			-- --------------------------------------------------------------
			-- SE VERIFICA SI EL ESTADO DEL CLIENTE EN ANALISIS ES "VIGENTE"
			-- -------------------------------------------------------------- 
			vBEM_EST_REG := k_vCLI_NO_VIG;
			IF EXISTS (SELECT 1 FROM users U  WHERE  U.status = '0' AND U.id = v_ID AND U.paidtype = 2 ) THEN 
				vBEM_EST_REG := k_vCLI_VIG;
			END IF;

			-- --------------------------------------------------------------
			-- OBTENEMOS EL ESTADO ACTUAL DE PAGO DEL CLIENTE EN ANALISIS REGISTRADO.  
			-- --------------------------------------------------------------
			COD_EST_BIT := NULL;
			IF EXISTS (SELECT 1 FROM users U2   WHERE U2.id = v_ID AND U2.paidtype = 2) THEN 
				COD_EST_BIT := 2;
			END IF;

			-- --------------------------------------------------------------
			-- OBTENEMOS EL SALDO ACTUAL DEL USUARIO.  
			-- --------------------------------------------------------------
			v_BALANCE_DIA := v_CREDIT;

			-- --------------------------------------------------------------
			-- CALCULO.  
			-- --------------------------------------------------------------

			v_TOT_REG := 0;
			c2 := obtener_total(c2, v_USERACCOUNT, vSTARTTIME, vENDTIME, v_ID_TARIFF);
			LOOP
				FETCH FROM c2 INTO r2;
				EXIT WHEN NOT FOUND;
				v_TOT_REG := v_TOT_REG + r2.total;
				RAISE NOTICE 'TOTAL: %', r2.total;
			END LOOP;
			CLOSE c2;
			RAISE NOTICE 'v_TOT_REG: %', v_TOT_REG;
			-- --------------------------------------------------------------
			-- ESTABLECEMOS VARIABLE CON LOS VALORES   
			-- --------------------------------------------------------------    
			vBEM_MNT_DEU_DIA := v_TOT_REG;

			v_nPCS_BTC := 0; -- NO PROCESAR POR DEFAULT
			IF (vBEM_EST_REG = k_vCLI_VIG) THEN -- EL PROCESO EN PLAT. CLIENTE ES "VIGENTE" SE DEBE PROCESAR
				v_nPCS_BTC := 1; -- PROCESA ACTIALIZACION
			ELSE
				IF ((COD_EST_BIT IS NOT NULL) AND (COD_EST_BIT <> '1')) THEN -- EL CLICIO EN PLAT. CLIENTE ES "NO VIGENTE", PERO EN TIPO PAGO ES "2". SE DEBE PROCESAR 
					v_nPCS_BTC := 2; -- PROCESA  CLICIO 2
				ELSE
					v_nPCS_BTC := 0; -- NO PROCESA. CLICIO ES 1
				END IF;  
			END IF;


			IF (v_nPCS_BTC = 1) THEN -- PROCESA CLIENTE VIGENTE
				IF vBEM_MNT_DEU_DIA > .0 THEN
					v_TOT_REG_S_VGTE := v_BALANCE_DIA - vBEM_MNT_DEU_DIA;
					RAISE NOTICE '%', 'CASO VIG UP ACTUALIZAR' || '-' || to_char(v_TOT_REG, '999') ||  '-' || to_char(vBEM_MNT_DEU_DIA, '999')  || '-' ||  to_char(v_TOT_REG_S_VGTE, '999') ; -- v_nCNT_LEI
					UPDATE users SET credit = v_TOT_REG_S_VGTE WHERE id = v_ID;
				ELSE
					v_TOT_REG_S_VGTE :=  v_BALANCE_DIA - 0;
					UPDATE users SET credit = v_TOT_REG_S_VGTE WHERE id = v_ID;
					RAISE NOTICE '%',  'CASO VIG DOWN';
				END IF;
			ELSE 
				RAISE NOTICE '%', 'CASO NO  ACTUALIZA ' || v_nPCS_BTC;
			END IF; 


			

			IF @v_nMUESTRA_MSG = 1 THEN
				RAISE NOTICE '%', ' v_nPCS_BTC '  || to_char(pi_nCASO_EJC, '999');
				RAISE NOTICE '%', ' vBEM_EST_REG '  || vBEM_EST_REG;
				-- RAISE NOTICE '%', ' vCUR_TIP_REG '  || to_char(vCUR_TIP_REG, '999');
				RAISE NOTICE '%', ' COD_EST_BIT '  || COD_EST_BIT;
				-- RAISE NOTICE '%', ' vCUR_COD_EST_CLI '  || vCUR_COD_EST_CLI;
				-- RAISE NOTICE '%', ' COD_EST_BIT '  || to_char(COD_EST_BIT, '999');
				RAISE NOTICE '%', ' v_BALANCE_DIA '  ||  to_char(v_BALANCE_DIA, '999');
				RAISE NOTICE '%', ' vBEM_MNT_DEU_DIA '  || to_char(vBEM_MNT_DEU_DIA, '999');
			END IF;


			
		END LOOP;
		CLOSE cursor1;

		RAISE NOTICE  '%', to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ' || to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ';
		RAISE NOTICE  '%', to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ' || to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ';
		RAISE NOTICE  '%', to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ' || to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ESTADISTICAS DEL PROCESO';
		RAISE NOTICE  '%', to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ' || to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ========================';
		RAISE NOTICE  '%', to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ' || to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ';
		RAISE NOTICE  '%', to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ' || to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' REG LEIDOS             : ' || to_char(v_nCNT_LEI, '999');
		RAISE NOTICE  '%', to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ' || to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ';
		RAISE NOTICE  '%', to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ' || to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ' ;

		RAISE NOTICE '%', to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ' || to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ';        
		RAISE NOTICE '%', to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ' || to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ... TERMINO ETAPA PROCESO ACTUALIZACION SALDO POSTPAGOS';
		RAISE NOTICE '%', to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ' || to_char(now(),'yyyy-MM-DD HH24:MI:SS') || ' ' ; 
		
	END IF; --TERMINO CASO "2" (ACTUALIZACION SALDO POSTPAGOS)
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.sp_gen_update_discount_balance_cli(integer, character varying, character varying)
  OWNER TO postgres;


  
  


