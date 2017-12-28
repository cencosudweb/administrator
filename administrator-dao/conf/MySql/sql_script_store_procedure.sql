create or replace PROCEDURE sp_channels(
userNameParam IN VARCHAR2, cursorParam OUT SYS_REFCURSOR)
IS
l_total       INTEGER;
BEGIN
  -- =============================================
	-- Autor	:	JOSE GARRIDO
	-- ALTER  date	:	<2010120>
	-- Description	:	<Obtiene canales>
	-- Modificacion	: 
	-- EJEMPLO	: 
	--	begin sp_channels('1'); end;
	-- =============================================
  -- SELECT COUNT(*) INTO cnt FROM CHANNELS WHERE id = v_id;
  l_total:= 10000;

  OPEN cursorParam FOR
  SELECT * FROM CHANNELS WHERE ID = userNameParam;

END;

create or replace PROCEDURE CURSOR_1(codeq VARCHAR2)
IS
   Vequi VARCHAR2(3);
   CURSOR C1 IS SELECT ID,DESCRIPTION from CHANNELS ;-- where ID=Vequi;
   Vid INT;
   Vnom VARCHAR(15);
BEGIN
   vequi:=codeq;
   OPEN C1;
   FETCH C1 INTO Vid, vnom;
   WHILE C1%FOUND LOOP
      DBMS_OUTPUT.PUT_LINE(Vid || Vnom);
      -- UPDATE CHANNELS SET DESCRIPTION = 'Web12' where ID = Vid;
      FETCH C1 INTO Vid, Vnom;
   END LOOP;
   CLOSE C1;
END;

create or replace Function obtener_total
   ( vtariff INTEGER, vaccountcode IN VARCHAR2,vstarttime IN VARCHAR2,vendtime IN VARCHAR2)
   RETURN number
IS
   cnumber number;
   v_TOT_REG				FLOAT;
  SALIDA					VARCHAR(200);
   
   CURSOR c1
   IS
     -- SELECT id  FROM users;
      select 
      (CASE WHEN userfield is not null THEN (SELECT replace(replace(replace(CAST(rate.rateinitial AS integer),'.'),'-'),' ') AS total FROM tariffgroup INNER JOIN tariffgroup_plan  ON tariffgroup.id=tariffgroup_plan.idtariffgroup LEFT OUTER JOIN tariffplan  ON tariffgroup_plan.idtariffplan=tariffplan.id LEFT OUTER JOIN rate  ON tariffplan.id=rate.idtariffplan WHERE tariffgroup.id = vtariff  AND  substr(userfield,0,LENGTH(dialprefix))=dialprefix and rownum <= 1) * CAST(SUM(billsec) AS float) / 60   ELSE 0 END) AS total 
      -- sum(billsec) as total
      from cdr_asterisk this_ 
      where this_.accountcode=vaccountcode   and this_.calldate>=TO_DATE(vstarttime, 'YYYY-MM-DD HH24:MI:SS') AND  this_.calldate<=TO_DATE(vendtime, 'YYYY-MM-DD HH24:MI:SS')
      group by userfield, accountcode;

BEGIN
/*
   OPEN c1;
   FETCH c1 INTO cnumber;
    if c1%notfound then
       cnumber := 2;
    end if;
   CLOSE c1;
   */
   
   SALIDA := vaccountcode;
   v_TOT_REG := 0;
   OPEN c1;
      LOOP
        
        FETCH c1 into cnumber;
        -- WHILE C2%FOUND LOOP
        EXIT WHEN c1%NOTFOUND;
         v_TOT_REG := v_TOT_REG + cnumber;
         
         
        END LOOP;
      CLOSE c1;
      cnumber := v_TOT_REG;
      DBMS_OUTPUT.PUT_LINE( 'cnumber-' || cnumber || '------' || '' || vaccountcode || '-' || vstarttime || '-' || vendtime || '-- ' || SALIDA);

 RETURN cnumber;

END;

create or replace PROCEDURE sp_gen_update_balance_cli(pi_nCASO_EJC integer, vstarttime VARCHAR2, vendtime VARCHAR2)
IS
   Vequi VARCHAR2(3);
   CURSOR C1 IS SELECT id, rut, paidtype,attempts, STATUS ,id_tariff,useraccount, credit from USERS ;
   CURSOR C2 IS SELECT id from USERS ;

   C3 SYS_REFCURSOR;
   cnumber number;
   
   SERVIDOR				VARCHAR(50);
	 SALIDA					VARCHAR(200);
	 OPE_REC					NUMERIC;
	 OPE_CLI					NUMERIC;
	 OPE_CLI_UNI				NUMERIC;
	 OPE_CLI_REP				NUMERIC;
	 CLI_ACT					NUMERIC;
	 OPE_ALT					NUMERIC;
	 OPE_ALT_OPE_SIN_REC			NUMERIC;
	 OPE_ALT_CAM_EST				NUMERIC;
	 OPE_BAJ					NUMERIC;
	 EST_CLI					NUMERIC;
	 ALT_SIN_REC				NUMERIC;
	 BAJ_SIN_CLI				NUMERIC;
	 FEC_TER					VARCHAR(08);
	
	-- -----------------------------------------------------------
	 vBEM_MNT_DEU_DIA        		FLOAT;            	-- VALOR DEUDA DIA
	 vBEM_EST_REG			 	VARCHAR(1);       	-- CODIGO DE REGISTRO
	-- -----------------------------------------------------------------------------------------
	 k_vFEC_PCS				VARCHAR(8);
	 k_vCLI_VIG				VARCHAR(1);
	 k_vCLI_NO_VIG			 	VARCHAR(1);
	 k_vCLI_HIS				VARCHAR(1);
	
	-- -----------------------------------------------------------------------------------------	
	 v_nCNT_LEI				INT;
	 v_nCNT_VIG				INT;
	 v_nCNT_VIG_INS			 	INT; 
	 v_nCNT_VIG_UPD			 	FLOAT;
	 v_nCNT_NO_VIG			 	INT;
	 v_nCNT_VIG_SIN_DEU  	 		INT;
	 v_nCNT_NO_VIG_CMB_EST	 		INT; 
	 v_nCNT_NO_VIG_HIS		 	INT;
	 v_nCNT_VIG_SD           		INT; 
	 v_nPCS_BTC			     	INT;
	 v_nCANT_UPD			 	INT;
	
	-- -----------------------------------------------------------------------------------------	
	 v_vTXT_CASO_EJC				VARCHAR(50);
	
	-- -----------------------------------------------------------------------------------------	
	 COD_EST_BIT			 	VARCHAR(3);       	-- CODIGO DE ESTADO DE CLICIO DE BITACORA
	
	-- -----------------------------------------------------------------------------------------	
	 v_nMUESTRA_MSG          		INT; 			--  MOSTRAR LOS PRINT (SOLO PARA REVISION DE EJECUION)
	-- -----------------------------------------------------------------------------------------
	
	-- -----------------------------------------------------------------------------------------
	 v_PAID_TYPE				INTEGER;
	 v_ID					INTEGER;
	 vCUR_RUT_CLI			 	VARCHAR(15);      	-- RUT DEL CLIENTE
	 v_ATTEMPTS				INTEGER;
	 v_STATUS				INTEGER;
	 v_ID_TARIFF				INTEGER;
	 v_USERACCOUNT          			VARCHAR(12); 
	 v_CREDIT          			FLOAT; 
   
    v_ID2					INTEGER;
	
	 v_BALANCE_DIA				FLOAT;            	-- VALOR SALDO DIA
	 v_TOT_REG				FLOAT;
	 v_TOT_REG_S_VGTE			FLOAT;
   v_TOT_REG_N_VGTE			FLOAT;
   
   
   v_EXIST_VIGENTE				INTEGER;
   v_EXIST_ESTADO				INTEGER;
   Vid INT;
   Vnom VARCHAR(15);
   -- pi_nCASO_EJC INTEGER;
BEGIN
  
  -- pi_nCASO_EJC :=;
  v_nMUESTRA_MSG := 1; --PARA MOSTRAR LOS PRINT (SOLO PARA REVISION DE EJECUION)
  
  IF pi_nCASO_EJC = 1 THEN
		v_vTXT_CASO_EJC := 'SOLO CLIENTES POSTPAGOS';
	ELSE 
		v_vTXT_CASO_EJC := 'CASO INVALIDO. NO PROCESA';	
	END IF;
  
  IF pi_nCASO_EJC IN (1) THEN
    DBMS_OUTPUT.PUT_LINE('' || '' || '' || '');
    DBMS_OUTPUT.PUT_LINE('' || '' || '' || '' || '.. INICIO ETAPA PROCESO ACTUALIZACION SALDO POSTPAGOS');
    DBMS_OUTPUT.PUT_LINE('' || '' || '' || '');
    
    
    
    DBMS_OUTPUT.PUT_LINE('' || '' || '' || '');
    DBMS_OUTPUT.PUT_LINE('' || '' || '' || '' || '... TERMINO ETAPA PROCESO ACTUALIZACION SALDO POSTPAGOS');
    DBMS_OUTPUT.PUT_LINE('' || '' || '' || '');

  END IF;
  
  IF pi_nCASO_EJC IN (2) THEN
    DBMS_OUTPUT.PUT_LINE('' || '' || '' || '');
    DBMS_OUTPUT.PUT_LINE('' || '' || '' || '' || '.. INICIO ETAPA PROCESO ACTUALIZACION SALDO POSTPAGOS');
    DBMS_OUTPUT.PUT_LINE('' || '' || '' || '');
    
    k_vFEC_PCS := '';
		k_vCLI_VIG := 'S';
		k_vCLI_NO_VIG := 'N';
		k_vCLI_HIS := 'H';
		v_nCNT_LEI := 0;
		v_TOT_REG := 0;
    
    -- vequi:=codeq;
    OPEN C1; 
    FETCH C1 INTO v_ID, vCUR_RUT_CLI,v_PAID_TYPE, v_ATTEMPTS, v_STATUS, v_ID_TARIFF , v_USERACCOUNT, v_CREDIT;
    WHILE C1%FOUND LOOP
      DBMS_OUTPUT.PUT_LINE(v_ID || '-' || vCUR_RUT_CLI || '-' || v_PAID_TYPE || '-' || v_ATTEMPTS || '-' || v_STATUS || '-' || v_ID_TARIFF || '-' || v_USERACCOUNT || '-' || v_CREDIT);
      v_nCNT_LEI := v_nCNT_LEI + 1;
      -- --------------------------------------------------------------
			-- SE VERIFICA SI EL ESTADO DEL CLIENTE EN ANALISIS ES "VIGENTE"
			-- -------------------------------------------------------------- 
       -- v_EXIST_VIGENTE				INTEGER;
      --- v_EXIST_ESTADO				INTEGER;
			vBEM_EST_REG := k_vCLI_NO_VIG;
      SELECT COUNT(*) INTO v_EXIST_VIGENTE FROM users U WHERE  U.status = '0' AND U.id = v_ID AND U.paidtype = 2;
			IF (v_EXIST_VIGENTE > 0) THEN	
        vBEM_EST_REG := k_vCLI_VIG;
      END IF;
     
      -- --------------------------------------------------------------
			-- OBTENEMOS EL ESTADO ACTUAL DE PAGO DEL CLIENTE EN ANALISIS REGISTRADO.  
			-- --------------------------------------------------------------
			COD_EST_BIT := NULL;
      SELECT COUNT(*) INTO v_EXIST_ESTADO FROM users U2 WHERE  U2.id = v_ID AND U2.paidtype = 2;
			IF (v_EXIST_ESTADO > 0) THEN	
        COD_EST_BIT := 2;
      END IF;
      -- 25.50
       DBMS_OUTPUT.PUT_LINE('=========vBEM_EST_REG==========' || vBEM_EST_REG);
        DBMS_OUTPUT.PUT_LINE('========v_EXIST_ESTADO===========' || v_EXIST_ESTADO);
      -- --------------------------------------------------------------
			-- OBTENEMOS EL SALDO ACTUAL DEL USUARIO.  
			-- --------------------------------------------------------------
			v_BALANCE_DIA := v_CREDIT;
      
      -- --------------------------------------------------------------
			-- CALCULO.  
			-- --------------------------------------------------------------
			v_TOT_REG := 0;
      -- C2 := obtener_total(C2, v_USERACCOUNT, vstarttime, vendtime, v_ID_TARIFF);
      /*OPEN C2; 
      FETCH C2 INTO v_ID2;
      WHILE C2%FOUND LOOP
        v_TOT_REG := v_TOT_REG + v_ID2;
         DBMS_OUTPUT.PUT_LINE( 'v_TOT_REG-' || v_TOT_REG );
      END LOOP;
      CLOSE C2;
      */
      -- CURSOR C4 IS SELECT id from USERS ;
      /*
      C3 := obtener_total(C3, v_USERACCOUNT, vstarttime, vendtime, v_ID_TARIFF);
      LOOP
        FETCH C2 into v_ID2;
        EXIT WHEN C3%NOTFOUND;
      END LOOP;
      CLOSE C3;
      */ 
      v_TOT_REG := obtener_total(v_ID_TARIFF, v_USERACCOUNT, vstarttime, vendtime);
      DBMS_OUTPUT.PUT_LINE( 'v_TOT_REG-' || v_TOT_REG );
      -- C3 := obtener_total(C3, v_USERACCOUNT, vstarttime, vendtime, v_ID_TARIFF);
      /*
      LOOP
        FETCH C3 into cnumber;
        EXIT WHEN C3%NOTFOUND;
      END LOOP;
      CLOSE C3;
      *(
      /*
      OPEN C2;
      LOOP
        
        FETCH C2 into v_ID2;
        -- WHILE C2%FOUND LOOP
        EXIT WHEN C2%NOTFOUND;
         v_TOT_REG := v_TOT_REG + v_ID2;
         DBMS_OUTPUT.PUT_LINE( 'v_TOT_REG-' || v_TOT_REG );
        END LOOP;
      CLOSE C2;
      
       DBMS_OUTPUT.PUT_LINE( 'v_TOT_REG2-' || v_TOT_REG );
      */
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
					DBMS_OUTPUT.PUT_LINE('CASO VIG UP ACTUALIZAR' || '-' || v_TOT_REG ||  '-' || vBEM_MNT_DEU_DIA || '-' ||  v_TOT_REG_S_VGTE) ; -- v_nCNT_LEI
					UPDATE users SET credit = v_TOT_REG_S_VGTE WHERE id = v_ID;
				ELSE
					v_TOT_REG_S_VGTE :=  v_BALANCE_DIA - 0;
					UPDATE users SET credit = v_TOT_REG_S_VGTE WHERE id = v_ID;
					DBMS_OUTPUT.PUT_LINE('CASO VIG DOWN' || '-' || vBEM_MNT_DEU_DIA);
				END IF;
			ELSE 
				DBMS_OUTPUT.PUT_LINE('CASO NO  ACTUALIZA ' || '-' || v_nPCS_BTC || '-' || vBEM_MNT_DEU_DIA);
			END IF;
      
      FETCH C1 INTO  v_ID, vCUR_RUT_CLI,v_PAID_TYPE, v_ATTEMPTS, v_STATUS, v_ID_TARIFF , v_USERACCOUNT, v_CREDIT;
      IF v_nMUESTRA_MSG = 1 THEN
        DBMS_OUTPUT.PUT_LINE(' v_nPCS_BTC '  || pi_nCASO_EJC);
        DBMS_OUTPUT.PUT_LINE(' vBEM_EST_REG '  || vBEM_EST_REG);
        DBMS_OUTPUT.PUT_LINE(' COD_EST_BIT '  || COD_EST_BIT);
        DBMS_OUTPUT.PUT_LINE(' v_BALANCE_DIA '  ||  v_BALANCE_DIA);
        DBMS_OUTPUT.PUT_LINE(' vBEM_MNT_DEU_DIA '  || v_BALANCE_DIA);
      END IF;
      
    END LOOP;
    
    
    
    CLOSE C1;
    
    DBMS_OUTPUT.PUT_LINE('' || '' || '' || '');
    DBMS_OUTPUT.PUT_LINE('' || '' || '' || '' || '... TERMINO ETAPA PROCESO ACTUALIZACION SALDO POSTPAGOS');
    DBMS_OUTPUT.PUT_LINE('' || '' || '' || '');

  END IF;
  
  DBMS_OUTPUT.PUT_LINE('' || '' || '' || '');
  DBMS_OUTPUT.PUT_LINE('' || '' || '' || 'ESTADISTICAS DEL PROCESO');
  DBMS_OUTPUT.PUT_LINE('' || '' || '' || '');

  DBMS_OUTPUT.PUT_LINE('' || '' || '' || '');
  DBMS_OUTPUT.PUT_LINE('' || '' || '' ||  'REG LEIDOS' ||  v_nCNT_LEI);
  DBMS_OUTPUT.PUT_LINE('' || '' || '' || '');

  DBMS_OUTPUT.PUT_LINE('' || '' || '' || '');
  DBMS_OUTPUT.PUT_LINE('' || '' || '' || '... TERMINO ETAPA PROCESO ACTUALIZACION SALDO');
  DBMS_OUTPUT.PUT_LINE('' || '' || '' || '');
  
   
END;
----------------------- Package -----------------------
create or replace package        SYSTEM.SYSTEM_PKG_CHANNELS
/*************************************************************************
* Nombre package    : SYSTEM_PKG_CHANNELS                            *
* Fecha             : 01/06/2016                                         *
* Autor             : Jose Garrido J.                                    *
* Descripcion       : Lista de Clientes de Un ejecutivo                  *
* Parametros        :                                                    *
**************************************************************************/
/*************************************************************************
* Nombre Procedure : SP_LIS_CHANNELS                                  *
*                  : Tipo Cursor                                         *
* Fecha            : 01/06/2016                                          *
* Autor            : Jose Garrido J.                                     *
* Parametros       :                                                     *
**************************************************************************/
 is
   TYPE RecSalida IS RECORD
        ( ID            CHANNELS.ID%TYPE,
          DESCRIPTION   CHANNELS.ID%TYPE
        );
   TYPE modcursor IS REF CURSOR RETURN RecSalida;
   procedure SP_LIS_CHANNELS (par_rol_codigo_channel IN CHANNELS.ID%TYPE ---1
                               ,cur OUT modcursor);

end SYSTEM_PKG_CHANNELS;

CREATE OR REPLACE
PACKAGE BODY SYSTEM.SYSTEM_PKG_CHANNELS AS

  procedure SP_LIS_CHANNELS (par_rol_codigo_channel IN CHANNELS.ID%TYPE ---1
                               ,cur OUT modcursor) AS
  BEGIN
    -- TAREA: Se necesita implantación para procedure SYSTEM_PKG_CHANNELS.SP_LIS_CHANNELS
    OPEN cur FOR
     SELECT CLI.ID, CLI.DESCRIPTION
     FROM CHANNELS CLI
     WHERE CLI.ID           = par_rol_codigo_channel 
     ORDER BY CLI.DESCRIPTION ASC;
  END SP_LIS_CHANNELS;

END SYSTEM_PKG_CHANNELS;

GRANT execute ON SYSTEM.SYSTEM_PKG_CHANNELS TO SYSTEM;


GRANT execute ON sp_channels2 TO SYSTEM;
GRANT execute ON sp_channels TO SYSTEM;