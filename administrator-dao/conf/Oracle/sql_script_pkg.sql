 -- --------------------------------------------------------------
-- PACKAGE SYSTEM_PKG_CARGAR_COMBO
-- --------------------------------------------------------------  
	  

create or replace package SYSTEM_PKG_CARGAR_COMBO
/*************************************************************************
* Nombre package    : SYSTEM_PKG_CARGA_COMBO                            *
* Fecha             : 10/03/2017                                         *
* Autor             : Jose Garrido J.                                    *
* Descripcion       : Packete que con tiene SP                           *
* Parametros        :                                                    *
**************************************************************************/
/*************************************************************************
* Nombre Procedure : SYSTEM_CARGA_COMBO                            *
*                  : Tipo Cursor                                         *
* Fecha            : 10/03/2017                                          *
* Autor            : Jose Garrido J.                                     *
* Parametros       :                                                     *
**************************************************************************/

 is
   procedure SYSTEM_CARGAR_COMBO; 

end SYSTEM_PKG_CARGAR_COMBO;


create or replace package body        SYSTEM_PKG_CARGAR_COMBO is
    --
  PROCEDURE SYSTEM_CARGAR_COMBO AS
  CURSOR C1 IS select
                      LLAVE, TC_PO_LINE_ID, CUMPL_CALC, CUMPL_EOM, CUMPL_BTK, FECHA_COMPROMISO_EOM, FECHA_COMPROMISO_BTK, ESTADO_CALCE_EOM
                      ,SUBESTADO_CALCE_EOM, FECHA_CALCE_EOM, HORA_CALCE_EOM, ESTADO_CALCE_BTK, SUBESTADO_CALCE_BTK,FECHA_CALCE_BTK,HORA_CALCE_BTK,CRUCE_ESTADO
                      ,CRUCE_SUB_ESTADO,N_SOLICITUD_CLIENTE,N_ORDEN_DISTRIBU,FECHA_CREACION_ORDEN,EST_ORDEN,ESTADO_DE_LINEA,SKU,CANT_DESC_SKU,LOCAL_VENTA,DEPART
                      ,BODEGADESP,RUTCLIENTE,NOMBRECLIENTE,APELLIDOCLIENTE,DIRECCION_CLIENTE,COD_COMUNA,COMUNA,CIUDAD,REGION,HORARIO
                      ,TIPO_ORDEN,TIPO_VENTA,O_FACILITY_ALIAS_ID,REGIONENTREGA,TIPO_DE_ORDEN,GUIA,RUT_EMP,DESC_EMP,TIPOGUI,CLIENTE_RETIRA,FECHA_PRIMER_INTENTO
                      ,NUMERO_INTENTOS,FECHA_CREA_PKT,HORA_CREA_PKT,NRO_OLA,FECHA_INICIO_OLA,HORA_INICIO_OLA,FECHA_TERMINO_OLA,HORA_TERMINO_OLA,FECHA_CIERRE_CARGA
                      ,HORA_CIERRE_CARGA,FECEMIGUI,LEAD_TIME_TRANSPORTE,DIA_SEMANA_ETA,ENTREGA_DIA_COMPROMISO,VENTA_EMPRESA
                      ,CUMPLE,CUMPLIMIENTO_2,CUMPLE_RESUMEN,BODEGA_DESPACHO,DIF_ETA_CARGA,FECHA_CARGA_REQUERIDA,EVAL_SISTEMA,EVAL_CD,EVAL_1er_INTENTO
                      ,CUMPLIMIENTO_CLIENTE,RESPONSABLE,TIPO_CUMPLIMIENTO
              from VISTA_CARGAR_CUMPLIMIENTO ;
   SERVIDOR				                  VARCHAR(50);
	 SALIDA					                  VARCHAR(200);
	 v_nCNT_LEI				                INT;
	 v_nMUESTRA_MSG          		      INT;
    v_LLAVE                         VARCHAR(200);
    v_TC_PO_LINE_ID                 VARCHAR(200);
    v_CUMPL_CALC                    VARCHAR(200);
    v_CUMPL_EOM                     VARCHAR(200);
    v_CUMPL_BTK                     VARCHAR(200);
    v_FECHA_COMPROMISO_EOM          VARCHAR(200);
    v_FECHA_COMPROMISO_BTK          VARCHAR(200);
    v_ESTADO_CALCE_EOM              VARCHAR(200);
    v_SUBESTADO_CALCE_EOM           VARCHAR(200);
    v_FECHA_CALCE_EOM               VARCHAR(200);
    v_HORA_CALCE_EOM                VARCHAR(200);
    v_ESTADO_CALCE_BTK              VARCHAR(200);
    v_SUBESTADO_CALCE_BTK           VARCHAR(200);
    v_FECHA_CALCE_BTK               VARCHAR(200);
    v_HORA_CALCE_BTK                VARCHAR(200);
    v_CRUCE_ESTADO                  VARCHAR(200);
    v_CRUCE_SUB_ESTADO              VARCHAR(200);
    v_N_SOLICITUD_CLIENTE           VARCHAR(200);
    v_N_ORDEN_DISTRIBU              VARCHAR(200);
    v_FECHA_CREACION_ORDEN          VARCHAR(200);
    v_EST_ORDEN                     VARCHAR(200);
    v_ESTADO_DE_LINEA               VARCHAR(200);
    v_SKU                           VARCHAR(200);
    v_CANT_DESC_SKU                 VARCHAR(200);
    v_LOCAL_VENTA                   VARCHAR(200);
    v_DEPART                        VARCHAR(200);
    v_BODEGADESP                    VARCHAR(200);
    v_RUTCLIENTE                    VARCHAR(200);
    v_NOMBRECLIENTE                 VARCHAR(200);
    v_APELLIDOCLIENTE               VARCHAR(200);
    v_DIRECCION_CLIENTE             VARCHAR(200);
    v_COD_COMUNA                    VARCHAR(200);
    v_COMUNA                        VARCHAR(200);
    v_CIUDAD                        VARCHAR(200);
    v_REGION                        VARCHAR(200);
    v_HORARIO                       VARCHAR(200);
    v_TIPO_ORDEN                    VARCHAR(200);
    v_TIPO_VENTA                    VARCHAR(200);
    v_O_FACILITY_ALIAS_ID           VARCHAR(200);
    v_REGIONENTREGA                 VARCHAR(200);
    v_TIPO_DE_ORDEN                 VARCHAR(200);
    v_GUIA                          VARCHAR(200);
    v_RUT_EMP                       VARCHAR(200);
    v_DESC_EMP                      VARCHAR(200);
    v_TIPOGUI                       VARCHAR(200);
    v_CLIENTE_RETIRA                VARCHAR(200);
    v_FECHA_PRIMER_INTENTO          VARCHAR(200);
    v_NUMERO_INTENTOS               VARCHAR(200);
    v_FECHA_CREA_PKT                VARCHAR(200);
    v_HORA_CREA_PKT                 VARCHAR(200);
    v_NRO_OLA                       VARCHAR(200);
    v_FECHA_INICIO_OLA              VARCHAR(200);
    v_HORA_INICIO_OLA               VARCHAR(200);
    v_FECHA_TERMINO_OLA             VARCHAR(200);
    v_HORA_TERMINO_OLA              VARCHAR(200);
    v_FECHA_CIERRE_CARGA            VARCHAR(200);
    v_HORA_CIERRE_CARGA             VARCHAR(200);
    v_FECEMIGUI                     VARCHAR(200);
    v_LEAD_TIME_TRANSPORTE          VARCHAR(200);
    v_DIA_SEMANA_ETA                VARCHAR(200);
    v_ENTREGA_DIA_COMPROMISO        VARCHAR(200);
    v_VENTA_EMPRESA                 VARCHAR(200);
    v_CUMPLE                        VARCHAR(200);
    v_CUMPLIMIENTO_2                VARCHAR(200);
    v_CUMPLE_RESUMEN                VARCHAR(200);
    v_BODEGA_DESPACHO               VARCHAR(200);
    v_DIF_ETA_CARGA                 VARCHAR(200);
    v_FECHA_CARGA_REQUERIDA         VARCHAR(200);
    v_EVAL_SISTEMA                  VARCHAR(200);
    v_EVAL_CD                       VARCHAR(200);
    v_EVAL_1er_INTENTO              VARCHAR(200);
    v_CUMPLIMIENTO_CLIENTE          VARCHAR(200);
    v_RESPONSABLE                   VARCHAR(200);
    v_TIPO_CUMPLIMIENTO             VARCHAR(200);
    
    v_EXIST_TIPO_ORDEN				      INTEGER;
    v_EXIST_TIPO_VENTA				      INTEGER;
    v_EXIST_CLIENTE_RETIRA				  INTEGER;
    v_EXIST_DESCRIPCION_EMPRESA			INTEGER;
    v_EXIST_TIPO_GUIA				        INTEGER;
    v_EXIST_HORARIO				          INTEGER;
    v_EXIST_ESTADO_CUMPLE				    INTEGER;
    
    pi_nCASO_EJC  INTEGER;

   
   -- pi_nCASO_EJC INTEGER;
  BEGIN
  --DBMS_OUTPUT.ENABLE(70000000000000000000000000000000000000000000000000000000000000000000);
    --set serveroutput on size unlimited;
    -- pi_nCASO_EJC :=;
    v_nMUESTRA_MSG := 1; --PARA MOSTRAR LOS PRINT (SOLO PARA REVISION DE EJECUION)
    pi_nCASO_EJC :=1;
    DBMS_OUTPUT.PUT_LINE('' || '' || '' || '');
    DBMS_OUTPUT.PUT_LINE('' || '' || '' || '' || '.. INICIO ETAPA PROCESO INSERTAR TABLA CUMPLIMIENTO');
    DBMS_OUTPUT.PUT_LINE('' || '' || '' || '');
    
    IF pi_nCASO_EJC IN (1) THEN
      DBMS_OUTPUT.PUT_LINE('' || '' || '' || '');
      DBMS_OUTPUT.PUT_LINE('' || '' || '' || '' || '.. INICIO INSERTAR FILA CUMPLIMIENTO');
      DBMS_OUTPUT.PUT_LINE('' || '' || '' || '');
      v_nCNT_LEI := 0;
      
    --REM INSERTING into cumplimiento
    --SET DEFINE OFF;
    dbms_output.enable(null); --linea de codigo infinito
    
    OPEN C1; 
    FETCH C1 INTO v_LLAVE, v_TC_PO_LINE_ID, v_CUMPL_CALC, v_CUMPL_EOM, v_CUMPL_BTK, v_FECHA_COMPROMISO_EOM, v_FECHA_COMPROMISO_BTK, v_ESTADO_CALCE_EOM
                  ,v_SUBESTADO_CALCE_EOM, v_FECHA_CALCE_EOM, v_HORA_CALCE_EOM, v_ESTADO_CALCE_BTK, v_SUBESTADO_CALCE_BTK,v_FECHA_CALCE_BTK,v_HORA_CALCE_BTK,v_CRUCE_ESTADO
                  ,v_CRUCE_SUB_ESTADO,v_N_SOLICITUD_CLIENTE,v_N_ORDEN_DISTRIBU,v_FECHA_CREACION_ORDEN,v_EST_ORDEN,v_ESTADO_DE_LINEA,v_SKU,v_CANT_DESC_SKU,v_LOCAL_VENTA,v_DEPART
                  ,v_BODEGADESP,v_RUTCLIENTE,v_NOMBRECLIENTE,v_APELLIDOCLIENTE,v_DIRECCION_CLIENTE,v_COD_COMUNA,v_COMUNA,v_CIUDAD,v_REGION,v_HORARIO
                  ,v_TIPO_ORDEN,v_TIPO_VENTA,v_O_FACILITY_ALIAS_ID,v_REGIONENTREGA,v_TIPO_DE_ORDEN,v_GUIA,v_RUT_EMP,v_DESC_EMP,v_TIPOGUI,v_CLIENTE_RETIRA,v_FECHA_PRIMER_INTENTO
                  ,v_NUMERO_INTENTOS,v_FECHA_CREA_PKT,v_HORA_CREA_PKT,v_NRO_OLA,v_FECHA_INICIO_OLA,v_HORA_INICIO_OLA,v_FECHA_TERMINO_OLA,v_HORA_TERMINO_OLA,v_FECHA_CIERRE_CARGA
                  ,v_HORA_CIERRE_CARGA,v_FECEMIGUI,v_LEAD_TIME_TRANSPORTE,v_DIA_SEMANA_ETA,v_ENTREGA_DIA_COMPROMISO,v_VENTA_EMPRESA
                  ,v_CUMPLE,v_CUMPLIMIENTO_2,v_CUMPLE_RESUMEN,v_BODEGA_DESPACHO,v_DIF_ETA_CARGA,v_FECHA_CARGA_REQUERIDA,v_EVAL_SISTEMA,v_EVAL_CD,v_EVAL_1er_INTENTO
                  ,v_CUMPLIMIENTO_CLIENTE,v_RESPONSABLE,v_TIPO_CUMPLIMIENTO;
    WHILE C1%FOUND LOOP
      DBMS_OUTPUT.PUT_LINE( v_LLAVE || '-' ||  v_TC_PO_LINE_ID || '-' ||  v_CUMPL_CALC || '-' ||  v_CUMPL_EOM || '-' ||  v_CUMPL_BTK || '-' ||  v_FECHA_COMPROMISO_EOM || '-' ||  v_FECHA_COMPROMISO_BTK || '-' ||  v_ESTADO_CALCE_EOM
                   || '-' || v_SUBESTADO_CALCE_EOM || '-' ||  v_FECHA_CALCE_EOM || '-' ||  v_HORA_CALCE_EOM || '-' ||  v_ESTADO_CALCE_BTK || '-' ||  v_SUBESTADO_CALCE_BTK || '-' || v_FECHA_CALCE_BTK || '-' || v_HORA_CALCE_BTK || '-' || v_CRUCE_ESTADO
                   || '-' || v_CRUCE_SUB_ESTADO || '-' || v_N_SOLICITUD_CLIENTE || '-' || v_N_ORDEN_DISTRIBU || '-' || v_FECHA_CREACION_ORDEN || '-' || v_EST_ORDEN || '-' || v_ESTADO_DE_LINEA || '-' || v_SKU || '-' || v_CANT_DESC_SKU || '-' || v_LOCAL_VENTA || '-' || v_DEPART
                   || '-' || v_BODEGADESP || '-' || v_RUTCLIENTE || '-' || v_NOMBRECLIENTE || '-' || v_APELLIDOCLIENTE || '-' || v_DIRECCION_CLIENTE || '-' || v_COD_COMUNA || '-' || v_COMUNA || '-' || v_CIUDAD || '-' || v_REGION || '-' || v_HORARIO
                   || '-' || v_TIPO_ORDEN || '-' || v_TIPO_VENTA || '-' || v_O_FACILITY_ALIAS_ID || '-' || v_REGIONENTREGA || '-' || v_TIPO_DE_ORDEN || '-' || v_GUIA || '-' || v_RUT_EMP || '-' || v_DESC_EMP || '-' || v_TIPOGUI || '-' || v_CLIENTE_RETIRA || '-' || v_FECHA_PRIMER_INTENTO
                   || '-' || v_NUMERO_INTENTOS || '-' || v_FECHA_CREA_PKT || '-' || v_HORA_CREA_PKT || '-' || v_NRO_OLA || '-' || v_FECHA_INICIO_OLA || '-' || v_HORA_INICIO_OLA || '-' || v_FECHA_TERMINO_OLA || '-' || v_HORA_TERMINO_OLA || '-' || v_FECHA_CIERRE_CARGA
                   || '-' || v_HORA_CIERRE_CARGA || '-' || v_FECEMIGUI || '-' || v_LEAD_TIME_TRANSPORTE || '-' || v_DIA_SEMANA_ETA || '-' || v_ENTREGA_DIA_COMPROMISO || '-' || v_VENTA_EMPRESA
                   || '-' || v_CUMPLE || '-' || v_CUMPLIMIENTO_2 || '-' || v_CUMPLE_RESUMEN || '-' || v_BODEGA_DESPACHO || '-' || v_DIF_ETA_CARGA || '-' ||  TO_DATE(v_FECHA_CARGA_REQUERIDA, 'YYYY-MM-DD HH24:MI:SS')  || '-' || v_EVAL_SISTEMA || '-' || v_EVAL_CD || '-' || v_EVAL_1er_INTENTO
                   || '-' || v_CUMPLIMIENTO_CLIENTE || '-' || v_RESPONSABLE || '-' || v_TIPO_CUMPLIMIENTO
                          );
      v_nCNT_LEI := v_nCNT_LEI + 1;
      
      --REM INSERTING into CUMPLIMIENTO
      --SET DEFINE OFF;
       -- --------------------------------------------------------------
			-- SE VERIFICA SI EL TIPO DE ORDEN SE ENCUENTRA
      -- --------------------------------------------------------------
      SELECT COUNT(*) INTO v_EXIST_TIPO_ORDEN FROM KPIWEB.TIPO_ORDEN  WHERE TIPO_ORDEN.DESCRIPTION = v_TIPO_DE_ORDEN;
			IF (v_EXIST_TIPO_ORDEN = 0) THEN	
         INSERT INTO KPIWEB.TIPO_ORDEN (DESCRIPTION) VALUES (v_TIPO_DE_ORDEN);
         COMMIT;	 
      END IF;
      
      -- --------------------------------------------------------------
			-- SE VERIFICA SI EL TIPO DE VENTA SE ENCUENTRA
      -- --------------------------------------------------------------
       SELECT COUNT(*) INTO v_EXIST_TIPO_VENTA FROM KPIWEB.TIPO_VENTA  WHERE TIPO_VENTA.DESCRIPTION = v_TIPO_VENTA;
			IF (v_EXIST_TIPO_VENTA = 0) THEN	
         --DBMS_OUTPUT.PUT_LINE('' || '' || '' || '' || '.. INICIO INSERTAR TIPO_VENTA')
         INSERT INTO KPIWEB.TIPO_VENTA (DESCRIPTION) VALUES (v_TIPO_VENTA);
         COMMIT;	 
      END IF;
      
      -- --------------------------------------------------------------
			-- SE VERIFICA
       -- SI CLIENTE RETIRA SE ENCUENTRA
      -- --------------------------------------------------------------
      SELECT COUNT(*) INTO v_EXIST_CLIENTE_RETIRA FROM KPIWEB.CLIENTE_RETIRA  WHERE CLIENTE_RETIRA.DESCRIPTION = v_CLIENTE_RETIRA;
			IF (v_EXIST_CLIENTE_RETIRA = 0) THEN	
         INSERT INTO KPIWEB.CLIENTE_RETIRA (DESCRIPTION) VALUES (v_CLIENTE_RETIRA);
         COMMIT;	 
      END IF;
			
      -- --------------------------------------------------------------
			-- SE VERIFICA SIDESCRIPCION DE EMPRESA SE ENCUENTRA
      -- --------------------------------------------------------------
      SELECT COUNT(*) INTO v_EXIST_DESCRIPCION_EMPRESA FROM KPIWEB.DESCRIPCION_EMPRESA  WHERE DESCRIPCION_EMPRESA.DESCRIPTION = v_DESC_EMP;
			IF (v_EXIST_DESCRIPCION_EMPRESA = 0) THEN	
         INSERT INTO KPIWEB.DESCRIPCION_EMPRESA (DESCRIPTION) VALUES (v_DESC_EMP);
         COMMIT;	 
      END IF;
      
      -- --------------------------------------------------------------
			-- SE VERIFICA SI EL TIPO DE GUIA SE ENCUENTRA
      -- --------------------------------------------------------------  
      SELECT COUNT(*) INTO v_EXIST_TIPO_GUIA FROM KPIWEB.TIPO_GUIA  WHERE TIPO_GUIA.DESCRIPTION = v_TIPOGUI;
			IF (v_EXIST_TIPO_GUIA = 0) THEN	
         INSERT INTO KPIWEB.TIPO_GUIA (DESCRIPTION) VALUES (v_TIPOGUI);
         COMMIT;	 
      END IF;
    
      -- --------------------------------------------------------------
			-- SE VERIFICA SI EL HORARIO SE ENCUENTRA
      -- --------------------------------------------------------------  
      SELECT COUNT(*) INTO v_EXIST_HORARIO FROM KPIWEB.HORARIO  WHERE HORARIO.DESCRIPTION = v_HORARIO;
			IF (v_EXIST_HORARIO = 0) THEN	
         INSERT INTO KPIWEB.HORARIO (DESCRIPTION) VALUES (v_HORARIO);
         COMMIT;	 
      END IF;
     
      -- --------------------------------------------------------------
			-- SE VERIFICA SI EL ESTADO DE CUMPLIMIENTO SE ENCUENTRA
      -- --------------------------------------------------------------  
      SELECT COUNT(*) INTO v_EXIST_ESTADO_CUMPLE FROM KPIWEB.ESTADO_CUMPLE  WHERE ESTADO_CUMPLE.DESCRIPTION = v_CUMPLE;
			IF (v_EXIST_ESTADO_CUMPLE = 0) THEN	
         INSERT INTO KPIWEB.ESTADO_CUMPLE (DESCRIPTION) VALUES (v_CUMPLE);
         COMMIT;	 
      END IF;
     

				   
      
      FETCH C1 INTO  v_LLAVE, v_TC_PO_LINE_ID, v_CUMPL_CALC, v_CUMPL_EOM, v_CUMPL_BTK, v_FECHA_COMPROMISO_EOM, v_FECHA_COMPROMISO_BTK, v_ESTADO_CALCE_EOM
                  ,v_SUBESTADO_CALCE_EOM, v_FECHA_CALCE_EOM, v_HORA_CALCE_EOM, v_ESTADO_CALCE_BTK, v_SUBESTADO_CALCE_BTK,v_FECHA_CALCE_BTK,v_HORA_CALCE_BTK,v_CRUCE_ESTADO
                  ,v_CRUCE_SUB_ESTADO,v_N_SOLICITUD_CLIENTE,v_N_ORDEN_DISTRIBU,v_FECHA_CREACION_ORDEN,v_EST_ORDEN,v_ESTADO_DE_LINEA,v_SKU,v_CANT_DESC_SKU,v_LOCAL_VENTA,v_DEPART
                  ,v_BODEGADESP,v_RUTCLIENTE,v_NOMBRECLIENTE,v_APELLIDOCLIENTE,v_DIRECCION_CLIENTE,v_COD_COMUNA,v_COMUNA,v_CIUDAD,v_REGION,v_HORARIO
                  ,v_TIPO_ORDEN,v_TIPO_VENTA,v_O_FACILITY_ALIAS_ID,v_REGIONENTREGA,v_TIPO_DE_ORDEN,v_GUIA,v_RUT_EMP,v_DESC_EMP,v_TIPOGUI,v_CLIENTE_RETIRA,v_FECHA_PRIMER_INTENTO
                  ,v_NUMERO_INTENTOS,v_FECHA_CREA_PKT,v_HORA_CREA_PKT,v_NRO_OLA,v_FECHA_INICIO_OLA,v_HORA_INICIO_OLA,v_FECHA_TERMINO_OLA,v_HORA_TERMINO_OLA,v_FECHA_CIERRE_CARGA
                  ,v_HORA_CIERRE_CARGA,v_FECEMIGUI,v_LEAD_TIME_TRANSPORTE,v_DIA_SEMANA_ETA,v_ENTREGA_DIA_COMPROMISO,v_VENTA_EMPRESA
                  ,v_CUMPLE,v_CUMPLIMIENTO_2,v_CUMPLE_RESUMEN,v_BODEGA_DESPACHO,v_DIF_ETA_CARGA,v_FECHA_CARGA_REQUERIDA,v_EVAL_SISTEMA,v_EVAL_CD,v_EVAL_1er_INTENTO
                  ,v_CUMPLIMIENTO_CLIENTE,v_RESPONSABLE,v_TIPO_CUMPLIMIENTO;
      IF v_nMUESTRA_MSG = 1 THEN
        DBMS_OUTPUT.PUT_LINE(' pi_nCASO_EJC '  || pi_nCASO_EJC);
      END IF;
      
    END LOOP;
    CLOSE C1;
      DBMS_OUTPUT.PUT_LINE('' || '' || '' || '');
      DBMS_OUTPUT.PUT_LINE('' || '' || '' || '' || '... TERMINO INSERTAR FILA CUMPLIMIENTO');
      DBMS_OUTPUT.PUT_LINE('' || '' || '' || '');
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('' || '' || '' || '');
    DBMS_OUTPUT.PUT_LINE('' || '' || '' ||  'REG LEIDOS ' ||  v_nCNT_LEI);
    DBMS_OUTPUT.PUT_LINE('' || '' || '' || '');
  
    DBMS_OUTPUT.PUT_LINE('' || '' || '' || '');
    DBMS_OUTPUT.PUT_LINE('' || '' || '' || '... TERMINO ETAPA PROCESO INSERTAR TABLA CUMPLIMIENTO');
    DBMS_OUTPUT.PUT_LINE('' || '' || '' || '');
    
  end SYSTEM_CARGAR_COMBO;
  
end SYSTEM_PKG_CARGAR_COMBO;


 -- --------------------------------------------------------------
-- PACKAGE SYSTEM_PKG_CUMPLIMIENTO SERVIDOR
-- --------------------------------------------------------------  

create or replace package SYSTEM_PKG_CUMPLIMIENTO
/*************************************************************************
* Nombre package    : SYSTEM_PKG_CUMPLIMIENTO                            *
* Fecha             : 10/03/2017                                         *
* Autor             : Jose Garrido J.                                    *
* Descripcion       : Packete que con tiene SP                           *
* Parametros        :                                                    *
**************************************************************************/
/*************************************************************************
* Nombre Procedure : SYSTEM_SP_LIS_TIPO_ORDEN                            *
*                  : Tipo Cursor                                         *
* Fecha            : 10/03/2017                                          *
* Autor            : Jose Garrido J.                                     *
* Parametros       :                                                     *
**************************************************************************/
/*************************************************************************
* Nombre Procedure : SYSTEM_SP_ACTUALIZA_MODELO                           *
*                  : Tipo Procedimiento                                   *
* Fecha            : 03/03/2017                                           *
* Autor            : Jose Garrido J.                                      *
* Descripcion      : Actualiza Modelo Cumplimiento                        *
* Parametros       :                                                      *
**************************************************************************/

 is
   procedure SYSTEM_ACTUALIZA_MODELO; 
   procedure SYSTEM_CARGAR_CUMPLIMIENTO(pi_nCASO_EJC integer); 

end SYSTEM_PKG_CUMPLIMIENTO;


create or replace package body        SYSTEM_PKG_CUMPLIMIENTO is
  PROCEDURE SYSTEM_ACTUALIZA_MODELO AS 
  BEGIN
  
        UPDATE beetrack SET subestado = 'Dirección Errónea' WHERE subestado LIKE '%Direccin Errnea%';
    UPDATE beetrack SET subestado = 'Dirección Errónea' WHERE subestado LIKE '%Direccin Erronea%';
    UPDATE beetrack SET subestado = 'Dirección Errónea' WHERE subestado LIKE '%Direccin erronea%';
    UPDATE beetrack SET subestado = 'Cliente No Está' WHERE subestado LIKE '%Cliente No Est%';
    UPDATE beetrack SET subestado = 'Motivos Cliente' WHERE subestado LIKE '%Motivos Cliente%';
    UPDATE beetrack SET subestado = 'Motivos Cliente' WHERE subestado LIKE '%Motivo Cliente%';
    UPDATE beetrack SET subestado = 'Daño Producto' WHERE subestado LIKE '%Dao Producto%';
    UPDATE beetrack SET subestado = 'Motivo Transportes' WHERE subestado LIKE '%Motivos Transporte%';
    UPDATE beetrack SET subestado = 'No Cumple Condición' WHERE subestado LIKE '%No cumple condic%';
    UPDATE beetrack SET subestado = 'En Cliente' WHERE subestado IS NULL AND estado = 'Recogido'; 
    UPDATE beetrack SET subestado = 'En Cliente' WHERE subestado IS NULL AND estado = 'Entregado'; 
    UPDATE beetrack SET subestado = 'Error Sistémico' WHERE subestado = 'Error sistmico';
    UPDATE beetrack SET subestado = 'Nota de Crédito' WHERE subestado = 'Nota de Crdito';
    -- UPDATE beetrack SET subestado = 'Recogido En Expedición (Click And Collect)' WHERE subestado = 'Recogido En Expedicin (Click )';
    -- UPDATE beetrack SET subestado = 'En Expedición (Click And Collect)' WHERE subestado = 'En Expedicin (Click )';
    UPDATE beetrack SET subestado = 'Rechazo Expedición' WHERE subestado = 'Rechazo Expedicin';
    UPDATE beetrack SET estado = 'Entrega Parcial' WHERE estado = 'Entrega parcial'; 
    UPDATE beetrack SET estado = 'En Proceso de Carga' WHERE estado = 'Ingresado al sistema';

    UPDATE BEETRACK SET ESTADO = 'En Ruta o CT' WHERE ESTADO LIKE 'CT%' AND SUBESTADO IS NULL; 
    --SELECT * FROM BEETRACK WHERE ESTADO LIKE 'CT%' AND SUBESTADO IS NULL; 
    UPDATE KPI_CUMPLIMIENTO SET estado = 'En Proceso de Carga' WHERE estado = 'Ingresado al sistema';
    
-- PASO 2 -> Actualiza la tabla histórica de KPI de Beetrack
    DELETE FROM KPI_CUMPLIMIENTO WHERE guia IN (SELECT guia FROM beetrack);

-- PASO 3 -> Se inserta a la tabla de KPI las guias gestionadas.
    INSERT INTO KPI_CUMPLIMIENTO
    (SELECT DISTINCT
    CASE 
      WHEN b1.estado in ('Entregado','Entrega ','Entrega parcial', 'Recogido', 'Recogido parcial') AND (b1.fecsoldes-b1.fecha_llegada) < -1 THEN 'ATRASADO'
      WHEN b1.estado in ('Entregado','Entrega ','Entrega parcial', 'Recogido', 'Recogido parcial') AND (b1.fecsoldes-b1.fecha_llegada) <= 0 THEN 'EN FECHA'
      WHEN b1.estado in ('Entregado','Entrega ','Entrega parcial', 'Recogido', 'Recogido parcial') AND (b1.fecsoldes-b1.fecha_llegada) >0 THEN 'ADELANTADO'
    ELSE 
      'No Cumplimiento'
    END cumplimiento, 
    b1.NUMCORHR HOJA_RUTA, b1.GUIA, RUT_EMP, DESC_EMP,NUMSOLGUI,   
    b1.FECHA_LLEGADA fecha_llegada,
    b1.ESTADO, SUBESTADO, 
    to_date(FECSOLDES, 'dd/mm/yy hh24:mi') fecha_compromiso, 
    b1.do_id, b1.codregi, 
    b1.codcomu, b1.tipogui, b1.localventa, b1.localdespa, b1.jornada, b1.SKU, b1.FECHA_PRIMER_INTENTO, b1.NUMERO_DE_INTENTOS, b1.FECEMIGUI, b1.DO_LINE_ID
    FROM beetrack b1
    JOIN (SELECT guia, MAX(fecha_llegada) fecha_llegada 
          FROM beetrack  
          GROUP BY guia) b2
    ON b1.guia = b2.guia AND b1.fecha_llegada = b2.fecha_llegada);
    
-- PASO 4 -> Se inserta a la tabla de KPI las guias que no han sido gestionadas.
    INSERT INTO KPI_CUMPLIMIENTO
    select distinct 'No Cumplimiento' cumplimiento, 
    b1.NUMCORHR HOJA_RUTA, b1.GUIA, RUT_EMP, DESC_EMP,NUMSOLGUI,    
    b1.FECHA_LLEGADA fecha_llegada,
    b1.ESTADO, SUBESTADO, 
    to_date(FECSOLDES, 'dd/mm/yy hh24:mi') fecha_compromiso, 
    b1.do_id, b1.codregi, 
    b1.codcomu, b1.tipogui, b1.localventa, b1.localdespa, b1.jornada, b1.SKU, b1.FECHA_PRIMER_INTENTO, b1.NUMERO_DE_INTENTOS, b1.FECEMIGUI, b1.DO_LINE_ID
    from beetrack b1
    where b1.guia not in (select K.guia from KPI_CUMPLIMIENTO K)
    and b1.fecha_llegada is null     
    and b1.ESTADO not in('Entregado')
    order by b1.guia;

    UPDATE KPI_CUMPLIMIENTO
    SET CUMPLIMIENTO = CASE
        WHEN (TO_NUMBER(TO_CHAR((FECHA_COMPROMISO),'YYYYMMDD')) - TO_NUMBER(TO_CHAR((FECHA_LLEGADA),'YYYYMMDD'))) < -0.001 THEN 'ATRASADO'
        WHEN (TO_NUMBER(TO_CHAR((FECHA_COMPROMISO),'YYYYMMDD')) - TO_NUMBER(TO_CHAR((FECHA_LLEGADA),'YYYYMMDD'))) <= 0 THEN 'EN FECHA'
        WHEN (TO_NUMBER(TO_CHAR((FECHA_COMPROMISO),'YYYYMMDD')) - TO_NUMBER(TO_CHAR((FECHA_LLEGADA),'YYYYMMDD'))) > 0 THEN 'ADELANTADO'
    END    
    WHERE SUBESTADO = 'En Cliente' AND CUMPLIMIENTO = 'No Cumplimiento';

/*
    UPDATE KPI_CUMPLIMIENTO
    SET CUMPLIMIENTO = CASE
        WHEN (TO_NUMBER(TO_CHAR((FECHA_COMPROMISO),'YYYYMMDD')) - TO_NUMBER(TO_CHAR((FECHA_LLEGADA),'YYYYMMDD'))) < -0.001 THEN 'ATRASADO'
        WHEN (TO_NUMBER(TO_CHAR((FECHA_COMPROMISO),'YYYYMMDD')) - TO_NUMBER(TO_CHAR((FECHA_LLEGADA),'YYYYMMDD'))) <= 0 THEN 'EN FECHA'
        WHEN (TO_NUMBER(TO_CHAR((FECHA_COMPROMISO),'YYYYMMDD')) - TO_NUMBER(TO_CHAR((FECHA_LLEGADA),'YYYYMMDD'))) > 0 THEN 'ADELANTADO'
    END    
    WHERE SUBESTADO = 'En Cliente' AND CUMPLIMIENTO = 'No Cumplimiento';
*/

-- PASO 5 -> 
  UPDATE EOM_CUMPLIMIENTO_HIST SET FECHA_ENTR_CLIENTE = NULL 
  WHERE FECHA_ENTR_CLIENTE >= to_timestamp('31-12-1969 20:00:00', 'dd-mm-yyyy hh24:mi:ss')
  AND FECHA_ENTR_CLIENTE <= to_timestamp('31-12-1969 21:01:00', 'dd-mm-yyyy hh24:mi:ss');

  UPDATE EOM_CUMPLIMIENTO SET FECHA_ENTR_CLIENTE = NULL 
  WHERE FECHA_ENTR_CLIENTE >= to_timestamp('31-12-1969 20:00:00', 'dd-mm-yyyy hh24:mi:ss')
  AND FECHA_ENTR_CLIENTE <= to_timestamp('31-12-1969 21:01:00', 'dd-mm-yyyy hh24:mi:ss');
/* 
  SELECT FECHA_ENTR_CLIENTE FROM EOM_CUMPLIMIENTO WHERE 
  FECHA_ENTR_CLIENTE >= to_timestamp('31-12-1969 20:00:00', 'dd-mm-yyyy hh24:mi:ss')
  AND FECHA_ENTR_CLIENTE <= to_timestamp('31-12-1969 21:01:00', 'dd-mm-yyyy hh24:mi:ss');
*/
    UPDATE EOM_CUMPLIMIENTO set EST_ENTREGA = 'Dirección Errónea' where EST_ENTREGA like '%Mal Direcc%';
    UPDATE EOM_CUMPLIMIENTO set EST_ENTREGA = 'Expectativa' where EST_ENTREGA like '%Expectativ%';
    UPDATE EOM_CUMPLIMIENTO set EST_ENTREGA = 'Producto No Corresponde' where EST_ENTREGA like 'Equivocado';
    UPDATE EOM_CUMPLIMIENTO set EST_ENTREGA = 'Disponible Retiro Cliente' where EST_ENTREGA like '%DisRetCli%';
    UPDATE EOM_CUMPLIMIENTO set EST_ENTREGA = 'Motivo Transportes' where EST_ENTREGA like '%Por Transp%';
    UPDATE EOM_CUMPLIMIENTO set EST_ENTREGA = 'Motivos Cliente' where EST_ENTREGA like '%Por Client%';
    UPDATE EOM_CUMPLIMIENTO set EST_ENTREGA = 'Daño Producto' where EST_ENTREGA like '%Daño%';
    UPDATE EOM_CUMPLIMIENTO set EST_ENTREGA = 'Daño Producto' where EST_ENTREGA like '%DaÃ±o';
    UPDATE EOM_CUMPLIMIENTO set EST_ENTREGA = 'Cliente No Está' where EST_ENTREGA like '%No Está%';
    UPDATE EOM_CUMPLIMIENTO set EST_ENTREGA = 'Cliente No Está' where EST_ENTREGA like '%No EstÃ¡%';

    UPDATE EOM_CUMPLIMIENTO SET CUMPLIMIENTO = 'Dirección Errónea' WHERE CUMPLIMIENTO like '%Mal Direcc%';
    UPDATE EOM_CUMPLIMIENTO SET CUMPLIMIENTO = 'Expectativa' WHERE CUMPLIMIENTO like '%Expectativ%';
    UPDATE EOM_CUMPLIMIENTO SET CUMPLIMIENTO = 'Producto No Corresponde' WHERE CUMPLIMIENTO like '%Equivocado%';
    UPDATE EOM_CUMPLIMIENTO SET CUMPLIMIENTO = 'Motivo Transportes' WHERE CUMPLIMIENTO like '%Por Transp%';
    UPDATE EOM_CUMPLIMIENTO SET CUMPLIMIENTO = 'Motivos Cliente' WHERE CUMPLIMIENTO like '%Por Client%';
    UPDATE EOM_CUMPLIMIENTO SET CUMPLIMIENTO = 'Daño Producto' WHERE CUMPLIMIENTO like '%Daño%';
    UPDATE EOM_CUMPLIMIENTO SET CUMPLIMIENTO = 'Cliente No Está' WHERE CUMPLIMIENTO like '%No Está%';
    UPDATE EOM_CUMPLIMIENTO set CUMPLIMIENTO = 'Cliente No Está' where CUMPLIMIENTO like '%No EstÃ¡%';
    UPDATE EOM_CUMPLIMIENTO set CUMPLIMIENTO = 'Daño Producto' where CUMPLIMIENTO like '%DaÃ±o%';
  
   UPDATE EOM_CUMPLIMIENTO SET VENTA_EMPRESA = 'NO';
   UPDATE EOM_CUMPLIMIENTO_HIST SET VENTA_EMPRESA = 'SI' WHERE RUTCLIENTE IN 
   ('0763188280', '0154363432', '0762078465', '0762122545', '0619354001', '0760586471');
   
    DELETE FROM EOM_CUMPLIMIENTO_HIST WHERE N_SOLICITUD_CLIENTE IN (SELECT N_SOLICITUD_CLIENTE FROM EOM_CUMPLIMIENTO);
    INSERT INTO EOM_CUMPLIMIENTO_HIST SELECT * FROM EOM_CUMPLIMIENTO;

    --> En el servidor se debe ejecutar el cargador Load WMS_OLA_CARGA.bat
    DELETE FROM WMS_OLA_CARGA_HIST WHERE LLAVE IN (SELECT LLAVE FROM WMS_OLA_CARGA);
    INSERT INTO WMS_OLA_CARGA_HIST SELECT * FROM WMS_OLA_CARGA;
    
COMMIT;


-- select * from eom_cumplimiento where n_solicitud_cliente = '109307555' --420622999'

  end SYSTEM_ACTUALIZA_MODELO;
  
  PROCEDURE SYSTEM_CARGAR_CUMPLIMIENTO(pi_nCASO_EJC integer) AS
  CURSOR C1 IS select
                      LLAVE, TC_PO_LINE_ID, CUMPL_CALC, CUMPL_EOM, CUMPL_BTK, FECHA_COMPROMISO_EOM, FECHA_COMPROMISO_BTK, ESTADO_CALCE_EOM
                      ,SUBESTADO_CALCE_EOM, FECHA_CALCE_EOM, HORA_CALCE_EOM, ESTADO_CALCE_BTK, SUBESTADO_CALCE_BTK,FECHA_CALCE_BTK,HORA_CALCE_BTK,CRUCE_ESTADO
                      ,CRUCE_SUB_ESTADO,N_SOLICITUD_CLIENTE,N_ORDEN_DISTRIBU,FECHA_CREACION_ORDEN,EST_ORDEN,ESTADO_DE_LINEA,SKU,CANT_DESC_SKU,LOCAL_VENTA,DEPART
                      ,BODEGADESP,RUTCLIENTE,NOMBRECLIENTE,APELLIDOCLIENTE,DIRECCION_CLIENTE,COD_COMUNA,COMUNA,CIUDAD,REGION,HORARIO
                      ,TIPO_ORDEN,TIPO_VENTA,O_FACILITY_ALIAS_ID,REGIONENTREGA,TIPO_DE_ORDEN,GUIA,RUT_EMP,DESC_EMP,TIPOGUI,CLIENTE_RETIRA,FECHA_PRIMER_INTENTO
                      ,NUMERO_INTENTOS,FECHA_CREA_PKT,HORA_CREA_PKT,NRO_OLA,FECHA_INICIO_OLA,HORA_INICIO_OLA,FECHA_TERMINO_OLA,HORA_TERMINO_OLA,FECHA_CIERRE_CARGA
                      ,HORA_CIERRE_CARGA,FECEMIGUI,LEAD_TIME_TRANSPORTE,DIA_SEMANA_ETA,ENTREGA_DIA_COMPROMISO,VENTA_EMPRESA
                      ,CUMPLE,CUMPLIMIENTO_2,CUMPLE_RESUMEN,BODEGA_DESPACHO,DIF_ETA_CARGA,FECHA_CARGA_REQUERIDA,EVAL_SISTEMA,EVAL_CD,EVAL_1er_INTENTO
                      ,CUMPLIMIENTO_CLIENTE,RESPONSABLE,TIPO_CUMPLIMIENTO
              from VISTA_CARGAR_CUMPLIMIENTO;
   SERVIDOR				VARCHAR(50);
	 SALIDA					VARCHAR(200);
	 v_nCNT_LEI				INT;
	 v_nMUESTRA_MSG          		INT;
    v_LLAVE VARCHAR(200);
    v_TC_PO_LINE_ID VARCHAR(200);
    v_CUMPL_CALC VARCHAR(200);
    v_CUMPL_EOM VARCHAR(200);
    v_CUMPL_BTK VARCHAR(200);
    v_FECHA_COMPROMISO_EOM VARCHAR(200);
    v_FECHA_COMPROMISO_BTK VARCHAR(200);
    v_ESTADO_CALCE_EOM VARCHAR(200);
    v_SUBESTADO_CALCE_EOM VARCHAR(200);
    v_FECHA_CALCE_EOM VARCHAR(200);
    v_HORA_CALCE_EOM VARCHAR(200);
    v_ESTADO_CALCE_BTK VARCHAR(200);
    v_SUBESTADO_CALCE_BTK VARCHAR(200);
    v_FECHA_CALCE_BTK VARCHAR(200);
    v_HORA_CALCE_BTK VARCHAR(200);
    v_CRUCE_ESTADO VARCHAR(200);
    v_CRUCE_SUB_ESTADO VARCHAR(200);
    v_N_SOLICITUD_CLIENTE VARCHAR(200);
    v_N_ORDEN_DISTRIBU VARCHAR(200);
    v_FECHA_CREACION_ORDEN VARCHAR(200);
    v_EST_ORDEN VARCHAR(200);
    v_ESTADO_DE_LINEA VARCHAR(200);
    v_SKU VARCHAR(200);
    v_CANT_DESC_SKU VARCHAR(200);
    v_LOCAL_VENTA VARCHAR(200);
    v_DEPART VARCHAR(200);
    v_BODEGADESP VARCHAR(200);
    v_RUTCLIENTE VARCHAR(200);
    v_NOMBRECLIENTE VARCHAR(200);
    v_APELLIDOCLIENTE VARCHAR(200);
    v_DIRECCION_CLIENTE VARCHAR(200);
    v_COD_COMUNA VARCHAR(200);
    v_COMUNA VARCHAR(200);
    v_CIUDAD VARCHAR(200);
    v_REGION VARCHAR(200);
    v_HORARIO VARCHAR(200);
    v_TIPO_ORDEN VARCHAR(200);
    v_TIPO_VENTA VARCHAR(200);
    v_O_FACILITY_ALIAS_ID VARCHAR(200);
    v_REGIONENTREGA VARCHAR(200);
    v_TIPO_DE_ORDEN VARCHAR(200);
    v_GUIA VARCHAR(200);
    v_RUT_EMP VARCHAR(200);
    v_DESC_EMP VARCHAR(200);
    v_TIPOGUI VARCHAR(200);
    v_CLIENTE_RETIRA VARCHAR(200);
    v_FECHA_PRIMER_INTENTO VARCHAR(200);
    v_NUMERO_INTENTOS VARCHAR(200);
    v_FECHA_CREA_PKT VARCHAR(200);
    v_HORA_CREA_PKT VARCHAR(200);
    v_NRO_OLA VARCHAR(200);
    v_FECHA_INICIO_OLA VARCHAR(200);
    v_HORA_INICIO_OLA VARCHAR(200);
    v_FECHA_TERMINO_OLA VARCHAR(200);
    v_HORA_TERMINO_OLA VARCHAR(200);
    v_FECHA_CIERRE_CARGA VARCHAR(200);
    v_HORA_CIERRE_CARGA VARCHAR(200);
    v_FECEMIGUI VARCHAR(200);
    v_LEAD_TIME_TRANSPORTE VARCHAR(200);
    v_DIA_SEMANA_ETA VARCHAR(200);
    v_ENTREGA_DIA_COMPROMISO VARCHAR(200);
    v_VENTA_EMPRESA VARCHAR(200);
    v_CUMPLE VARCHAR(200);
    v_CUMPLIMIENTO_2 VARCHAR(200);
    v_CUMPLE_RESUMEN VARCHAR(200);
    v_BODEGA_DESPACHO VARCHAR(200);
    v_DIF_ETA_CARGA VARCHAR(200);
    v_FECHA_CARGA_REQUERIDA VARCHAR(200);
    v_EVAL_SISTEMA VARCHAR(200);
    v_EVAL_CD VARCHAR(200);
    v_EVAL_1er_INTENTO VARCHAR(200);
    v_CUMPLIMIENTO_CLIENTE VARCHAR(200);
    v_RESPONSABLE VARCHAR(200);
    v_TIPO_CUMPLIMIENTO VARCHAR(200);
   -- pi_nCASO_EJC INTEGER;
  BEGIN
  --DBMS_OUTPUT.ENABLE(70000000000000000000000000000000000000000000000000000000000000000000);
    --set serveroutput on size unlimited;
    -- pi_nCASO_EJC :=;
    v_nMUESTRA_MSG := 1; --PARA MOSTRAR LOS PRINT (SOLO PARA REVISION DE EJECUION)
    
    DBMS_OUTPUT.PUT_LINE('' || '' || '' || '');
    DBMS_OUTPUT.PUT_LINE('' || '' || '' || '' || '.. INICIO ETAPA PROCESO INSERTAR TABLA CUMPLIMIENTO');
    DBMS_OUTPUT.PUT_LINE('' || '' || '' || '');
    
    IF pi_nCASO_EJC IN (1) THEN
      DBMS_OUTPUT.PUT_LINE('' || '' || '' || '');
      DBMS_OUTPUT.PUT_LINE('' || '' || '' || '' || '.. INICIO INSERTAR FILA CUMPLIMIENTO');
      DBMS_OUTPUT.PUT_LINE('' || '' || '' || '');
      v_nCNT_LEI := 0;
      
    --REM INSERTING into cumplimiento
    --SET DEFINE OFF;
    dbms_output.enable(null); --linea de codigo infinito
    
    OPEN C1; 
    FETCH C1 INTO v_LLAVE, v_TC_PO_LINE_ID, v_CUMPL_CALC, v_CUMPL_EOM, v_CUMPL_BTK, v_FECHA_COMPROMISO_EOM, v_FECHA_COMPROMISO_BTK, v_ESTADO_CALCE_EOM
                  ,v_SUBESTADO_CALCE_EOM, v_FECHA_CALCE_EOM, v_HORA_CALCE_EOM, v_ESTADO_CALCE_BTK, v_SUBESTADO_CALCE_BTK,v_FECHA_CALCE_BTK,v_HORA_CALCE_BTK,v_CRUCE_ESTADO
                  ,v_CRUCE_SUB_ESTADO,v_N_SOLICITUD_CLIENTE,v_N_ORDEN_DISTRIBU,v_FECHA_CREACION_ORDEN,v_EST_ORDEN,v_ESTADO_DE_LINEA,v_SKU,v_CANT_DESC_SKU,v_LOCAL_VENTA,v_DEPART
                  ,v_BODEGADESP,v_RUTCLIENTE,v_NOMBRECLIENTE,v_APELLIDOCLIENTE,v_DIRECCION_CLIENTE,v_COD_COMUNA,v_COMUNA,v_CIUDAD,v_REGION,v_HORARIO
                  ,v_TIPO_ORDEN,v_TIPO_VENTA,v_O_FACILITY_ALIAS_ID,v_REGIONENTREGA,v_TIPO_DE_ORDEN,v_GUIA,v_RUT_EMP,v_DESC_EMP,v_TIPOGUI,v_CLIENTE_RETIRA,v_FECHA_PRIMER_INTENTO
                  ,v_NUMERO_INTENTOS,v_FECHA_CREA_PKT,v_HORA_CREA_PKT,v_NRO_OLA,v_FECHA_INICIO_OLA,v_HORA_INICIO_OLA,v_FECHA_TERMINO_OLA,v_HORA_TERMINO_OLA,v_FECHA_CIERRE_CARGA
                  ,v_HORA_CIERRE_CARGA,v_FECEMIGUI,v_LEAD_TIME_TRANSPORTE,v_DIA_SEMANA_ETA,v_ENTREGA_DIA_COMPROMISO,v_VENTA_EMPRESA
                  ,v_CUMPLE,v_CUMPLIMIENTO_2,v_CUMPLE_RESUMEN,v_BODEGA_DESPACHO,v_DIF_ETA_CARGA,v_FECHA_CARGA_REQUERIDA,v_EVAL_SISTEMA,v_EVAL_CD,v_EVAL_1er_INTENTO
                  ,v_CUMPLIMIENTO_CLIENTE,v_RESPONSABLE,v_TIPO_CUMPLIMIENTO;
    WHILE C1%FOUND LOOP
      DBMS_OUTPUT.PUT_LINE( v_LLAVE || '-' ||  v_TC_PO_LINE_ID || '-' ||  v_CUMPL_CALC || '-' ||  v_CUMPL_EOM || '-' ||  v_CUMPL_BTK || '-' ||  v_FECHA_COMPROMISO_EOM || '-' ||  v_FECHA_COMPROMISO_BTK || '-' ||  v_ESTADO_CALCE_EOM
                   || '-' || v_SUBESTADO_CALCE_EOM || '-' ||  v_FECHA_CALCE_EOM || '-' ||  v_HORA_CALCE_EOM || '-' ||  v_ESTADO_CALCE_BTK || '-' ||  v_SUBESTADO_CALCE_BTK || '-' || v_FECHA_CALCE_BTK || '-' || v_HORA_CALCE_BTK || '-' || v_CRUCE_ESTADO
                   || '-' || v_CRUCE_SUB_ESTADO || '-' || v_N_SOLICITUD_CLIENTE || '-' || v_N_ORDEN_DISTRIBU || '-' || v_FECHA_CREACION_ORDEN || '-' || v_EST_ORDEN || '-' || v_ESTADO_DE_LINEA || '-' || v_SKU || '-' || v_CANT_DESC_SKU || '-' || v_LOCAL_VENTA || '-' || v_DEPART
                   || '-' || v_BODEGADESP || '-' || v_RUTCLIENTE || '-' || v_NOMBRECLIENTE || '-' || v_APELLIDOCLIENTE || '-' || v_DIRECCION_CLIENTE || '-' || v_COD_COMUNA || '-' || v_COMUNA || '-' || v_CIUDAD || '-' || v_REGION || '-' || v_HORARIO
                   || '-' || v_TIPO_ORDEN || '-' || v_TIPO_VENTA || '-' || v_O_FACILITY_ALIAS_ID || '-' || v_REGIONENTREGA || '-' || v_TIPO_DE_ORDEN || '-' || v_GUIA || '-' || v_RUT_EMP || '-' || v_DESC_EMP || '-' || v_TIPOGUI || '-' || v_CLIENTE_RETIRA || '-' || v_FECHA_PRIMER_INTENTO
                   || '-' || v_NUMERO_INTENTOS || '-' || v_FECHA_CREA_PKT || '-' || v_HORA_CREA_PKT || '-' || v_NRO_OLA || '-' || v_FECHA_INICIO_OLA || '-' || v_HORA_INICIO_OLA || '-' || v_FECHA_TERMINO_OLA || '-' || v_HORA_TERMINO_OLA || '-' || v_FECHA_CIERRE_CARGA
                   || '-' || v_HORA_CIERRE_CARGA || '-' || v_FECEMIGUI || '-' || v_LEAD_TIME_TRANSPORTE || '-' || v_DIA_SEMANA_ETA || '-' || v_ENTREGA_DIA_COMPROMISO || '-' || v_VENTA_EMPRESA
                   || '-' || v_CUMPLE || '-' || v_CUMPLIMIENTO_2 || '-' || v_CUMPLE_RESUMEN || '-' || v_BODEGA_DESPACHO || '-' || v_DIF_ETA_CARGA || '-' ||  TO_DATE(v_FECHA_CARGA_REQUERIDA, 'YYYY-MM-DD HH24:MI:SS')  || '-' || v_EVAL_SISTEMA || '-' || v_EVAL_CD || '-' || v_EVAL_1er_INTENTO
                   || '-' || v_CUMPLIMIENTO_CLIENTE || '-' || v_RESPONSABLE || '-' || v_TIPO_CUMPLIMIENTO
                          );
      v_nCNT_LEI := v_nCNT_LEI + 1;
      
      --REM INSERTING into CUMPLIMIENTO
      --SET DEFINE OFF;
      Insert into KPIWEB.CUMPLIMIENTO (LLAVE,TC_PO_LINE_ID,CUMPL_CALC,CUMPL_EOM,CUMPL_BTK,FECHA_COMPROMISO_EOM,FECHA_COMPROMISO_BTK,ESTADO_CALCE_EOM,SUBESTADO_CALCE_EOM,FECHA_CALCE_EOM,HORA_CALCE_EOM,ESTADO_CALCE_BTK,SUBESTADO_CALCE_BTK,FECHA_CALCE_BTK,HORA_CALCE_BTK,CRUCE_ESTADO,CRUCE_SUB_ESTADO,N_SOLICITUD_CLIENTE,N_ORDEN_DISTRIBU,FECHA_CREACION_ORDEN,EST_ORDEN,ESTADO_DE_LINEA,SKU,CANT_DESC_SKU,LOCAL_VENTA,DEPART,BODEGADESP,RUTCLIENTE,NOMBRECLIENTE,APELLIDOCLIENTE,DIRECCION_CLIENTE,COD_COMUNA,COMUNA,CIUDAD,REGION,HORARIO,TIPO_ORDEN,TIPO_VENTA,O_FACILITY_ALIAS_ID,REGIONENTREGA,TIPO_DE_ORDEN,GUIA,RUT_EMP,DESC_EMP,TIPOGUI,CLIENTE_RETIRA,FECHA_PRIMER_INTENTO,NUMERO_INTENTOS,FECHA_CREA_PKT,HORA_CREA_PKT,NRO_OLA,FECHA_INICIO_OLA,HORA_INICIO_OLA,FECHA_TERMINO_OLA,HORA_TERMINO_OLA,FECHA_CIERRE_CARGA,HORA_CIERRE_CARGA,FECEMIGUI,LEAD_TIME_TRANSPORTE,DIA_SEMANA_ETA,ENTREGA_DIA_COMPROMISO,VENTA_EMPRESA,CUMPLE,CUMPLIMIENTO_2,CUMPLE_RESUMEN,BODEGA_DESPACHO,DIF_ETA_CARGA,FECHA_CARGA_REQUERIDA,EVAL_SISTEMA,EVAL_CD,EVAL_1ER_INTENTO,CUMPLIMIENTO_CLIENTE,RESPONSABLE,TIPO_CUMPLIMIENTO, FECHA_INGRESO) 
				   
				   values (v_LLAVE,v_TC_PO_LINE_ID,v_CUMPL_CALC,v_CUMPL_EOM,v_CUMPL_BTK,v_FECHA_COMPROMISO_EOM,v_FECHA_COMPROMISO_BTK,v_ESTADO_CALCE_EOM
                   ,v_SUBESTADO_CALCE_EOM,v_FECHA_CALCE_EOM,v_HORA_CALCE_EOM,v_ESTADO_CALCE_BTK,v_SUBESTADO_CALCE_BTK ,v_FECHA_CALCE_BTK ,v_HORA_CALCE_BTK ,v_CRUCE_ESTADO
                   ,v_CRUCE_SUB_ESTADO ,v_N_SOLICITUD_CLIENTE ,v_N_ORDEN_DISTRIBU ,v_FECHA_CREACION_ORDEN ,v_EST_ORDEN ,v_ESTADO_DE_LINEA ,v_SKU ,v_CANT_DESC_SKU ,v_LOCAL_VENTA ,v_DEPART
                   ,v_BODEGADESP ,v_RUTCLIENTE ,v_NOMBRECLIENTE ,v_APELLIDOCLIENTE ,v_DIRECCION_CLIENTE ,v_COD_COMUNA ,v_COMUNA ,v_CIUDAD ,v_REGION ,v_HORARIO
                   ,v_TIPO_ORDEN ,v_TIPO_VENTA ,v_O_FACILITY_ALIAS_ID ,v_REGIONENTREGA ,v_TIPO_DE_ORDEN ,v_GUIA ,v_RUT_EMP ,v_DESC_EMP ,v_TIPOGUI ,v_CLIENTE_RETIRA ,v_FECHA_PRIMER_INTENTO
                   ,v_NUMERO_INTENTOS ,v_FECHA_CREA_PKT ,v_HORA_CREA_PKT ,v_NRO_OLA ,v_FECHA_INICIO_OLA ,v_HORA_INICIO_OLA ,v_FECHA_TERMINO_OLA ,v_HORA_TERMINO_OLA ,v_FECHA_CIERRE_CARGA
                   ,v_HORA_CIERRE_CARGA ,v_FECEMIGUI ,v_LEAD_TIME_TRANSPORTE ,v_DIA_SEMANA_ETA ,v_ENTREGA_DIA_COMPROMISO ,v_VENTA_EMPRESA
                   ,v_CUMPLE ,v_CUMPLIMIENTO_2 ,v_CUMPLE_RESUMEN ,v_BODEGA_DESPACHO ,v_DIF_ETA_CARGA ,v_FECHA_CARGA_REQUERIDA ,v_EVAL_SISTEMA ,v_EVAL_CD ,v_EVAL_1er_INTENTO
                   ,v_CUMPLIMIENTO_CLIENTE ,v_RESPONSABLE ,v_TIPO_CUMPLIMIENTO,SYSDATE);
			COMMIT;	   
      
      FETCH C1 INTO  v_LLAVE, v_TC_PO_LINE_ID, v_CUMPL_CALC, v_CUMPL_EOM, v_CUMPL_BTK, v_FECHA_COMPROMISO_EOM, v_FECHA_COMPROMISO_BTK, v_ESTADO_CALCE_EOM
                  ,v_SUBESTADO_CALCE_EOM, v_FECHA_CALCE_EOM, v_HORA_CALCE_EOM, v_ESTADO_CALCE_BTK, v_SUBESTADO_CALCE_BTK,v_FECHA_CALCE_BTK,v_HORA_CALCE_BTK,v_CRUCE_ESTADO
                  ,v_CRUCE_SUB_ESTADO,v_N_SOLICITUD_CLIENTE,v_N_ORDEN_DISTRIBU,v_FECHA_CREACION_ORDEN,v_EST_ORDEN,v_ESTADO_DE_LINEA,v_SKU,v_CANT_DESC_SKU,v_LOCAL_VENTA,v_DEPART
                  ,v_BODEGADESP,v_RUTCLIENTE,v_NOMBRECLIENTE,v_APELLIDOCLIENTE,v_DIRECCION_CLIENTE,v_COD_COMUNA,v_COMUNA,v_CIUDAD,v_REGION,v_HORARIO
                  ,v_TIPO_ORDEN,v_TIPO_VENTA,v_O_FACILITY_ALIAS_ID,v_REGIONENTREGA,v_TIPO_DE_ORDEN,v_GUIA,v_RUT_EMP,v_DESC_EMP,v_TIPOGUI,v_CLIENTE_RETIRA,v_FECHA_PRIMER_INTENTO
                  ,v_NUMERO_INTENTOS,v_FECHA_CREA_PKT,v_HORA_CREA_PKT,v_NRO_OLA,v_FECHA_INICIO_OLA,v_HORA_INICIO_OLA,v_FECHA_TERMINO_OLA,v_HORA_TERMINO_OLA,v_FECHA_CIERRE_CARGA
                  ,v_HORA_CIERRE_CARGA,v_FECEMIGUI,v_LEAD_TIME_TRANSPORTE,v_DIA_SEMANA_ETA,v_ENTREGA_DIA_COMPROMISO,v_VENTA_EMPRESA
                  ,v_CUMPLE,v_CUMPLIMIENTO_2,v_CUMPLE_RESUMEN,v_BODEGA_DESPACHO,v_DIF_ETA_CARGA,v_FECHA_CARGA_REQUERIDA,v_EVAL_SISTEMA,v_EVAL_CD,v_EVAL_1er_INTENTO
                  ,v_CUMPLIMIENTO_CLIENTE,v_RESPONSABLE,v_TIPO_CUMPLIMIENTO;
      IF v_nMUESTRA_MSG = 1 THEN
        DBMS_OUTPUT.PUT_LINE(' pi_nCASO_EJC '  || pi_nCASO_EJC);
      END IF;
      
    END LOOP;
    CLOSE C1;
      DBMS_OUTPUT.PUT_LINE('' || '' || '' || '');
      DBMS_OUTPUT.PUT_LINE('' || '' || '' || '' || '... TERMINO INSERTAR FILA CUMPLIMIENTO');
      DBMS_OUTPUT.PUT_LINE('' || '' || '' || '');
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('' || '' || '' || '');
    DBMS_OUTPUT.PUT_LINE('' || '' || '' ||  'REG LEIDOS ' ||  v_nCNT_LEI);
    DBMS_OUTPUT.PUT_LINE('' || '' || '' || '');
  
    DBMS_OUTPUT.PUT_LINE('' || '' || '' || '');
    DBMS_OUTPUT.PUT_LINE('' || '' || '' || '... TERMINO ETAPA PROCESO INSERTAR TABLA CUMPLIMIENTO');
    DBMS_OUTPUT.PUT_LINE('' || '' || '' || '');
    
  end SYSTEM_CARGAR_CUMPLIMIENTO;
  
end SYSTEM_PKG_CUMPLIMIENTO;

 -- --------------------------------------------------------------
-- PACKAGE SYSTEM_PKG_CUMPLIMIENTO LOCAL
-- --------------------------------------------------------------  

create or replace package SYSTEM_PKG_CUMPLIMIENTO_L
/*************************************************************************
* Nombre package    : SYSTEM_PKG_CUMPLIMIENTO                            *
* Fecha             : 10/03/2017                                         *
* Autor             : Jose Garrido J.                                    *
* Descripcion       : Packete que con tiene SP                           *
* Parametros        :                                                    *
**************************************************************************/
/*************************************************************************
* Nombre Procedure : SYSTEM_SP_LIS_TIPO_ORDEN                            *
*                  : Tipo Cursor                                         *
* Fecha            : 10/03/2017                                          *
* Autor            : Jose Garrido J.                                     *
* Parametros       :                                                     *
**************************************************************************/
/*************************************************************************
* Nombre Procedure : SYSTEM_SP_ACTUALIZA_MODELO                           *
*                  : Tipo Procedimiento                                   *
* Fecha            : 03/03/2017                                           *
* Autor            : Jose Garrido J.                                      *
* Descripcion      : Actualiza Modelo Cumplimiento                        *
* Parametros       :                                                      *
**************************************************************************/

 is
   procedure SYSTEM_ACTUALIZA_MODELO; 
   procedure SYSTEM_CARGAR_CUMPLIMIENTO(pi_nCASO_EJC integer); 

end SYSTEM_PKG_CUMPLIMIENTO_L;

create or replace package body        SYSTEM_PKG_CUMPLIMIENTO_L is
  PROCEDURE SYSTEM_ACTUALIZA_MODELO AS 
  BEGIN
  
        UPDATE beetrack SET subestado = 'Dirección Errónea' WHERE subestado LIKE '%Direccin Errnea%';
    UPDATE beetrack SET subestado = 'Dirección Errónea' WHERE subestado LIKE '%Direccin Erronea%';
    UPDATE beetrack SET subestado = 'Dirección Errónea' WHERE subestado LIKE '%Direccin erronea%';
    UPDATE beetrack SET subestado = 'Cliente No Está' WHERE subestado LIKE '%Cliente No Est%';
    UPDATE beetrack SET subestado = 'Motivos Cliente' WHERE subestado LIKE '%Motivos Cliente%';
    UPDATE beetrack SET subestado = 'Motivos Cliente' WHERE subestado LIKE '%Motivo Cliente%';
    UPDATE beetrack SET subestado = 'Daño Producto' WHERE subestado LIKE '%Dao Producto%';
    UPDATE beetrack SET subestado = 'Motivo Transportes' WHERE subestado LIKE '%Motivos Transporte%';
    UPDATE beetrack SET subestado = 'No Cumple Condición' WHERE subestado LIKE '%No cumple condic%';
    UPDATE beetrack SET subestado = 'En Cliente' WHERE subestado IS NULL AND estado = 'Recogido'; 
    UPDATE beetrack SET subestado = 'En Cliente' WHERE subestado IS NULL AND estado = 'Entregado'; 
    UPDATE beetrack SET subestado = 'Error Sistémico' WHERE subestado = 'Error sistmico';
    UPDATE beetrack SET subestado = 'Nota de Crédito' WHERE subestado = 'Nota de Crdito';
    -- UPDATE beetrack SET subestado = 'Recogido En Expedición (Click And Collect)' WHERE subestado = 'Recogido En Expedicin (Click )';
    -- UPDATE beetrack SET subestado = 'En Expedición (Click And Collect)' WHERE subestado = 'En Expedicin (Click )';
    UPDATE beetrack SET subestado = 'Rechazo Expedición' WHERE subestado = 'Rechazo Expedicin';
    UPDATE beetrack SET estado = 'Entrega Parcial' WHERE estado = 'Entrega parcial'; 
    UPDATE beetrack SET estado = 'En Proceso de Carga' WHERE estado = 'Ingresado al sistema';

    UPDATE BEETRACK SET ESTADO = 'En Ruta o CT' WHERE ESTADO LIKE 'CT%' AND SUBESTADO IS NULL; 
    --SELECT * FROM BEETRACK WHERE ESTADO LIKE 'CT%' AND SUBESTADO IS NULL; 
    UPDATE KPI_CUMPLIMIENTO SET estado = 'En Proceso de Carga' WHERE estado = 'Ingresado al sistema';
    
-- PASO 2 -> Actualiza la tabla histórica de KPI de Beetrack
    DELETE FROM KPI_CUMPLIMIENTO WHERE guia IN (SELECT guia FROM beetrack);

-- PASO 3 -> Se inserta a la tabla de KPI las guias gestionadas.
    INSERT INTO KPI_CUMPLIMIENTO
    (SELECT DISTINCT
    CASE 
      WHEN b1.estado in ('Entregado','Entrega ','Entrega parcial', 'Recogido', 'Recogido parcial') AND (b1.fecsoldes-b1.fecha_llegada) < -1 THEN 'ATRASADO'
      WHEN b1.estado in ('Entregado','Entrega ','Entrega parcial', 'Recogido', 'Recogido parcial') AND (b1.fecsoldes-b1.fecha_llegada) <= 0 THEN 'EN FECHA'
      WHEN b1.estado in ('Entregado','Entrega ','Entrega parcial', 'Recogido', 'Recogido parcial') AND (b1.fecsoldes-b1.fecha_llegada) >0 THEN 'ADELANTADO'
    ELSE 
      'No Cumplimiento'
    END cumplimiento, 
    b1.NUMCORHR HOJA_RUTA, b1.GUIA, RUT_EMP, DESC_EMP,NUMSOLGUI,   
    b1.FECHA_LLEGADA fecha_llegada,
    b1.ESTADO, SUBESTADO, 
    to_date(FECSOLDES, 'dd/mm/yy hh24:mi') fecha_compromiso, 
    b1.do_id, b1.codregi, 
    b1.codcomu, b1.tipogui, b1.localventa, b1.localdespa, b1.jornada, b1.SKU, b1.FECHA_PRIMER_INTENTO, b1.NUMERO_DE_INTENTOS, b1.FECEMIGUI, b1.DO_LINE_ID
    FROM beetrack b1
    JOIN (SELECT guia, MAX(fecha_llegada) fecha_llegada 
          FROM beetrack  
          GROUP BY guia) b2
    ON b1.guia = b2.guia AND b1.fecha_llegada = b2.fecha_llegada);
    
-- PASO 4 -> Se inserta a la tabla de KPI las guias que no han sido gestionadas.
    INSERT INTO KPI_CUMPLIMIENTO
    select distinct 'No Cumplimiento' cumplimiento, 
    b1.NUMCORHR HOJA_RUTA, b1.GUIA, RUT_EMP, DESC_EMP,NUMSOLGUI,    
    b1.FECHA_LLEGADA fecha_llegada,
    b1.ESTADO, SUBESTADO, 
    to_date(FECSOLDES, 'dd/mm/yy hh24:mi') fecha_compromiso, 
    b1.do_id, b1.codregi, 
    b1.codcomu, b1.tipogui, b1.localventa, b1.localdespa, b1.jornada, b1.SKU, b1.FECHA_PRIMER_INTENTO, b1.NUMERO_DE_INTENTOS, b1.FECEMIGUI, b1.DO_LINE_ID
    from beetrack b1
    where b1.guia not in (select K.guia from KPI_CUMPLIMIENTO K)
    and b1.fecha_llegada is null     
    and b1.ESTADO not in('Entregado')
    order by b1.guia;

    UPDATE KPI_CUMPLIMIENTO
    SET CUMPLIMIENTO = CASE
        WHEN (TO_NUMBER(TO_CHAR((FECHA_COMPROMISO),'YYYYMMDD')) - TO_NUMBER(TO_CHAR((FECHA_LLEGADA),'YYYYMMDD'))) < -0.001 THEN 'ATRASADO'
        WHEN (TO_NUMBER(TO_CHAR((FECHA_COMPROMISO),'YYYYMMDD')) - TO_NUMBER(TO_CHAR((FECHA_LLEGADA),'YYYYMMDD'))) <= 0 THEN 'EN FECHA'
        WHEN (TO_NUMBER(TO_CHAR((FECHA_COMPROMISO),'YYYYMMDD')) - TO_NUMBER(TO_CHAR((FECHA_LLEGADA),'YYYYMMDD'))) > 0 THEN 'ADELANTADO'
    END    
    WHERE SUBESTADO = 'En Cliente' AND CUMPLIMIENTO = 'No Cumplimiento';

/*
    UPDATE KPI_CUMPLIMIENTO
    SET CUMPLIMIENTO = CASE
        WHEN (TO_NUMBER(TO_CHAR((FECHA_COMPROMISO),'YYYYMMDD')) - TO_NUMBER(TO_CHAR((FECHA_LLEGADA),'YYYYMMDD'))) < -0.001 THEN 'ATRASADO'
        WHEN (TO_NUMBER(TO_CHAR((FECHA_COMPROMISO),'YYYYMMDD')) - TO_NUMBER(TO_CHAR((FECHA_LLEGADA),'YYYYMMDD'))) <= 0 THEN 'EN FECHA'
        WHEN (TO_NUMBER(TO_CHAR((FECHA_COMPROMISO),'YYYYMMDD')) - TO_NUMBER(TO_CHAR((FECHA_LLEGADA),'YYYYMMDD'))) > 0 THEN 'ADELANTADO'
    END    
    WHERE SUBESTADO = 'En Cliente' AND CUMPLIMIENTO = 'No Cumplimiento';
*/

-- PASO 5 -> 
  UPDATE EOM_CUMPLIMIENTO_HIST SET FECHA_ENTR_CLIENTE = NULL 
  WHERE FECHA_ENTR_CLIENTE >= to_timestamp('31-12-1969 20:00:00', 'dd-mm-yyyy hh24:mi:ss')
  AND FECHA_ENTR_CLIENTE <= to_timestamp('31-12-1969 21:01:00', 'dd-mm-yyyy hh24:mi:ss');

  UPDATE EOM_CUMPLIMIENTO SET FECHA_ENTR_CLIENTE = NULL 
  WHERE FECHA_ENTR_CLIENTE >= to_timestamp('31-12-1969 20:00:00', 'dd-mm-yyyy hh24:mi:ss')
  AND FECHA_ENTR_CLIENTE <= to_timestamp('31-12-1969 21:01:00', 'dd-mm-yyyy hh24:mi:ss');
/* 
  SELECT FECHA_ENTR_CLIENTE FROM EOM_CUMPLIMIENTO WHERE 
  FECHA_ENTR_CLIENTE >= to_timestamp('31-12-1969 20:00:00', 'dd-mm-yyyy hh24:mi:ss')
  AND FECHA_ENTR_CLIENTE <= to_timestamp('31-12-1969 21:01:00', 'dd-mm-yyyy hh24:mi:ss');
*/
    UPDATE EOM_CUMPLIMIENTO set EST_ENTREGA = 'Dirección Errónea' where EST_ENTREGA like '%Mal Direcc%';
    UPDATE EOM_CUMPLIMIENTO set EST_ENTREGA = 'Expectativa' where EST_ENTREGA like '%Expectativ%';
    UPDATE EOM_CUMPLIMIENTO set EST_ENTREGA = 'Producto No Corresponde' where EST_ENTREGA like 'Equivocado';
    UPDATE EOM_CUMPLIMIENTO set EST_ENTREGA = 'Disponible Retiro Cliente' where EST_ENTREGA like '%DisRetCli%';
    UPDATE EOM_CUMPLIMIENTO set EST_ENTREGA = 'Motivo Transportes' where EST_ENTREGA like '%Por Transp%';
    UPDATE EOM_CUMPLIMIENTO set EST_ENTREGA = 'Motivos Cliente' where EST_ENTREGA like '%Por Client%';
    UPDATE EOM_CUMPLIMIENTO set EST_ENTREGA = 'Daño Producto' where EST_ENTREGA like '%Daño%';
    UPDATE EOM_CUMPLIMIENTO set EST_ENTREGA = 'Daño Producto' where EST_ENTREGA like '%DaÃ±o';
    UPDATE EOM_CUMPLIMIENTO set EST_ENTREGA = 'Cliente No Está' where EST_ENTREGA like '%No Está%';
    UPDATE EOM_CUMPLIMIENTO set EST_ENTREGA = 'Cliente No Está' where EST_ENTREGA like '%No EstÃ¡%';

    UPDATE EOM_CUMPLIMIENTO SET CUMPLIMIENTO = 'Dirección Errónea' WHERE CUMPLIMIENTO like '%Mal Direcc%';
    UPDATE EOM_CUMPLIMIENTO SET CUMPLIMIENTO = 'Expectativa' WHERE CUMPLIMIENTO like '%Expectativ%';
    UPDATE EOM_CUMPLIMIENTO SET CUMPLIMIENTO = 'Producto No Corresponde' WHERE CUMPLIMIENTO like '%Equivocado%';
    UPDATE EOM_CUMPLIMIENTO SET CUMPLIMIENTO = 'Motivo Transportes' WHERE CUMPLIMIENTO like '%Por Transp%';
    UPDATE EOM_CUMPLIMIENTO SET CUMPLIMIENTO = 'Motivos Cliente' WHERE CUMPLIMIENTO like '%Por Client%';
    UPDATE EOM_CUMPLIMIENTO SET CUMPLIMIENTO = 'Daño Producto' WHERE CUMPLIMIENTO like '%Daño%';
    UPDATE EOM_CUMPLIMIENTO SET CUMPLIMIENTO = 'Cliente No Está' WHERE CUMPLIMIENTO like '%No Está%';
    UPDATE EOM_CUMPLIMIENTO set CUMPLIMIENTO = 'Cliente No Está' where CUMPLIMIENTO like '%No EstÃ¡%';
    UPDATE EOM_CUMPLIMIENTO set CUMPLIMIENTO = 'Daño Producto' where CUMPLIMIENTO like '%DaÃ±o%';
  
   UPDATE EOM_CUMPLIMIENTO SET VENTA_EMPRESA = 'NO';
   UPDATE EOM_CUMPLIMIENTO_HIST SET VENTA_EMPRESA = 'SI' WHERE RUTCLIENTE IN 
   ('0763188280', '0154363432', '0762078465', '0762122545', '0619354001', '0760586471');
   
    DELETE FROM EOM_CUMPLIMIENTO_HIST WHERE N_SOLICITUD_CLIENTE IN (SELECT N_SOLICITUD_CLIENTE FROM EOM_CUMPLIMIENTO);
    INSERT INTO EOM_CUMPLIMIENTO_HIST SELECT * FROM EOM_CUMPLIMIENTO;

    --> En el servidor se debe ejecutar el cargador Load WMS_OLA_CARGA.bat
    DELETE FROM WMS_OLA_CARGA_HIST WHERE LLAVE IN (SELECT LLAVE FROM WMS_OLA_CARGA);
    INSERT INTO WMS_OLA_CARGA_HIST SELECT * FROM WMS_OLA_CARGA;
    
COMMIT;


-- select * from eom_cumplimiento where n_solicitud_cliente = '109307555' --420622999'

  end SYSTEM_ACTUALIZA_MODELO;
  
  PROCEDURE SYSTEM_CARGAR_CUMPLIMIENTO(pi_nCASO_EJC integer) AS
  CURSOR C1 IS select
                      LLAVE, TC_PO_LINE_ID, CUMPL_CALC, CUMPL_EOM, CUMPL_BTK, FECHA_COMPROMISO_EOM, FECHA_COMPROMISO_BTK, ESTADO_CALCE_EOM
                      ,SUBESTADO_CALCE_EOM, FECHA_CALCE_EOM, HORA_CALCE_EOM, ESTADO_CALCE_BTK, SUBESTADO_CALCE_BTK,FECHA_CALCE_BTK,HORA_CALCE_BTK,CRUCE_ESTADO
                      ,CRUCE_SUB_ESTADO,N_SOLICITUD_CLIENTE,N_ORDEN_DISTRIBU,FECHA_CREACION_ORDEN,EST_ORDEN,ESTADO_DE_LINEA,SKU,CANT_DESC_SKU,LOCAL_VENTA,DEPART
                      ,BODEGADESP,RUTCLIENTE,NOMBRECLIENTE,APELLIDOCLIENTE,DIRECCION_CLIENTE,COD_COMUNA,COMUNA,CIUDAD,REGION,HORARIO
                      ,TIPO_ORDEN,TIPO_VENTA,O_FACILITY_ALIAS_ID,REGIONENTREGA,TIPO_DE_ORDEN,GUIA,RUT_EMP,DESC_EMP,TIPOGUI,CLIENTE_RETIRA,FECHA_PRIMER_INTENTO
                      ,NUMERO_INTENTOS,FECHA_CREA_PKT,HORA_CREA_PKT,NRO_OLA,FECHA_INICIO_OLA,HORA_INICIO_OLA,FECHA_TERMINO_OLA,HORA_TERMINO_OLA,FECHA_CIERRE_CARGA
                      ,HORA_CIERRE_CARGA,FECEMIGUI,LEAD_TIME_TRANSPORTE,DIA_SEMANA_ETA,ENTREGA_DIA_COMPROMISO,VENTA_EMPRESA
                      ,CUMPLE,CUMPLIMIENTO_2,CUMPLE_RESUMEN,BODEGA_DESPACHO,DIF_ETA_CARGA,FECHA_CARGA_REQUERIDA,EVAL_SISTEMA,EVAL_CD,EVAL_1er_INTENTO
                      ,CUMPLIMIENTO_CLIENTE,RESPONSABLE,TIPO_CUMPLIMIENTO
              from VISTA_CARGAR_CUMPLIMIENTO_L ;
   SERVIDOR				VARCHAR(50);
	 SALIDA					VARCHAR(200);
	 v_nCNT_LEI				INT;
	 v_nMUESTRA_MSG          		INT;
    v_LLAVE VARCHAR(200);
    v_TC_PO_LINE_ID VARCHAR(200);
    v_CUMPL_CALC VARCHAR(200);
    v_CUMPL_EOM VARCHAR(200);
    v_CUMPL_BTK VARCHAR(200);
    v_FECHA_COMPROMISO_EOM VARCHAR(200);
    v_FECHA_COMPROMISO_BTK VARCHAR(200);
    v_ESTADO_CALCE_EOM VARCHAR(200);
    v_SUBESTADO_CALCE_EOM VARCHAR(200);
    v_FECHA_CALCE_EOM VARCHAR(200);
    v_HORA_CALCE_EOM VARCHAR(200);
    v_ESTADO_CALCE_BTK VARCHAR(200);
    v_SUBESTADO_CALCE_BTK VARCHAR(200);
    v_FECHA_CALCE_BTK VARCHAR(200);
    v_HORA_CALCE_BTK VARCHAR(200);
    v_CRUCE_ESTADO VARCHAR(200);
    v_CRUCE_SUB_ESTADO VARCHAR(200);
    v_N_SOLICITUD_CLIENTE VARCHAR(200);
    v_N_ORDEN_DISTRIBU VARCHAR(200);
    v_FECHA_CREACION_ORDEN VARCHAR(200);
    v_EST_ORDEN VARCHAR(200);
    v_ESTADO_DE_LINEA VARCHAR(200);
    v_SKU VARCHAR(200);
    v_CANT_DESC_SKU VARCHAR(200);
    v_LOCAL_VENTA VARCHAR(200);
    v_DEPART VARCHAR(200);
    v_BODEGADESP VARCHAR(200);
    v_RUTCLIENTE VARCHAR(200);
    v_NOMBRECLIENTE VARCHAR(200);
    v_APELLIDOCLIENTE VARCHAR(200);
    v_DIRECCION_CLIENTE VARCHAR(200);
    v_COD_COMUNA VARCHAR(200);
    v_COMUNA VARCHAR(200);
    v_CIUDAD VARCHAR(200);
    v_REGION VARCHAR(200);
    v_HORARIO VARCHAR(200);
    v_TIPO_ORDEN VARCHAR(200);
    v_TIPO_VENTA VARCHAR(200);
    v_O_FACILITY_ALIAS_ID VARCHAR(200);
    v_REGIONENTREGA VARCHAR(200);
    v_TIPO_DE_ORDEN VARCHAR(200);
    v_GUIA VARCHAR(200);
    v_RUT_EMP VARCHAR(200);
    v_DESC_EMP VARCHAR(200);
    v_TIPOGUI VARCHAR(200);
    v_CLIENTE_RETIRA VARCHAR(200);
    v_FECHA_PRIMER_INTENTO VARCHAR(200);
    v_NUMERO_INTENTOS VARCHAR(200);
    v_FECHA_CREA_PKT VARCHAR(200);
    v_HORA_CREA_PKT VARCHAR(200);
    v_NRO_OLA VARCHAR(200);
    v_FECHA_INICIO_OLA VARCHAR(200);
    v_HORA_INICIO_OLA VARCHAR(200);
    v_FECHA_TERMINO_OLA VARCHAR(200);
    v_HORA_TERMINO_OLA VARCHAR(200);
    v_FECHA_CIERRE_CARGA VARCHAR(200);
    v_HORA_CIERRE_CARGA VARCHAR(200);
    v_FECEMIGUI VARCHAR(200);
    v_LEAD_TIME_TRANSPORTE VARCHAR(200);
    v_DIA_SEMANA_ETA VARCHAR(200);
    v_ENTREGA_DIA_COMPROMISO VARCHAR(200);
    v_VENTA_EMPRESA VARCHAR(200);
    v_CUMPLE VARCHAR(200);
    v_CUMPLIMIENTO_2 VARCHAR(200);
    v_CUMPLE_RESUMEN VARCHAR(200);
    v_BODEGA_DESPACHO VARCHAR(200);
    v_DIF_ETA_CARGA VARCHAR(200);
    v_FECHA_CARGA_REQUERIDA VARCHAR(200);
    v_EVAL_SISTEMA VARCHAR(200);
    v_EVAL_CD VARCHAR(200);
    v_EVAL_1er_INTENTO VARCHAR(200);
    v_CUMPLIMIENTO_CLIENTE VARCHAR(200);
    v_RESPONSABLE VARCHAR(200);
    v_TIPO_CUMPLIMIENTO VARCHAR(200);
   -- pi_nCASO_EJC INTEGER;
  BEGIN
  --DBMS_OUTPUT.ENABLE(70000000000000000000000000000000000000000000000000000000000000000000);
    --set serveroutput on size unlimited;
    -- pi_nCASO_EJC :=;
    v_nMUESTRA_MSG := 1; --PARA MOSTRAR LOS PRINT (SOLO PARA REVISION DE EJECUION)
    
    DBMS_OUTPUT.PUT_LINE('' || '' || '' || '');
    DBMS_OUTPUT.PUT_LINE('' || '' || '' || '' || '.. INICIO ETAPA PROCESO INSERTAR TABLA CUMPLIMIENTO');
    DBMS_OUTPUT.PUT_LINE('' || '' || '' || '');
    
    IF pi_nCASO_EJC IN (1) THEN
      DBMS_OUTPUT.PUT_LINE('' || '' || '' || '');
      DBMS_OUTPUT.PUT_LINE('' || '' || '' || '' || '.. INICIO INSERTAR FILA CUMPLIMIENTO');
      DBMS_OUTPUT.PUT_LINE('' || '' || '' || '');
      v_nCNT_LEI := 0;
      
    --REM INSERTING into cumplimiento
    --SET DEFINE OFF;
    dbms_output.enable(null); --linea de codigo infinito
    
    OPEN C1; 
    FETCH C1 INTO v_LLAVE, v_TC_PO_LINE_ID, v_CUMPL_CALC, v_CUMPL_EOM, v_CUMPL_BTK, v_FECHA_COMPROMISO_EOM, v_FECHA_COMPROMISO_BTK, v_ESTADO_CALCE_EOM
                  ,v_SUBESTADO_CALCE_EOM, v_FECHA_CALCE_EOM, v_HORA_CALCE_EOM, v_ESTADO_CALCE_BTK, v_SUBESTADO_CALCE_BTK,v_FECHA_CALCE_BTK,v_HORA_CALCE_BTK,v_CRUCE_ESTADO
                  ,v_CRUCE_SUB_ESTADO,v_N_SOLICITUD_CLIENTE,v_N_ORDEN_DISTRIBU,v_FECHA_CREACION_ORDEN,v_EST_ORDEN,v_ESTADO_DE_LINEA,v_SKU,v_CANT_DESC_SKU,v_LOCAL_VENTA,v_DEPART
                  ,v_BODEGADESP,v_RUTCLIENTE,v_NOMBRECLIENTE,v_APELLIDOCLIENTE,v_DIRECCION_CLIENTE,v_COD_COMUNA,v_COMUNA,v_CIUDAD,v_REGION,v_HORARIO
                  ,v_TIPO_ORDEN,v_TIPO_VENTA,v_O_FACILITY_ALIAS_ID,v_REGIONENTREGA,v_TIPO_DE_ORDEN,v_GUIA,v_RUT_EMP,v_DESC_EMP,v_TIPOGUI,v_CLIENTE_RETIRA,v_FECHA_PRIMER_INTENTO
                  ,v_NUMERO_INTENTOS,v_FECHA_CREA_PKT,v_HORA_CREA_PKT,v_NRO_OLA,v_FECHA_INICIO_OLA,v_HORA_INICIO_OLA,v_FECHA_TERMINO_OLA,v_HORA_TERMINO_OLA,v_FECHA_CIERRE_CARGA
                  ,v_HORA_CIERRE_CARGA,v_FECEMIGUI,v_LEAD_TIME_TRANSPORTE,v_DIA_SEMANA_ETA,v_ENTREGA_DIA_COMPROMISO,v_VENTA_EMPRESA
                  ,v_CUMPLE,v_CUMPLIMIENTO_2,v_CUMPLE_RESUMEN,v_BODEGA_DESPACHO,v_DIF_ETA_CARGA,v_FECHA_CARGA_REQUERIDA,v_EVAL_SISTEMA,v_EVAL_CD,v_EVAL_1er_INTENTO
                  ,v_CUMPLIMIENTO_CLIENTE,v_RESPONSABLE,v_TIPO_CUMPLIMIENTO;
    WHILE C1%FOUND LOOP
      DBMS_OUTPUT.PUT_LINE( v_LLAVE || '-' ||  v_TC_PO_LINE_ID || '-' ||  v_CUMPL_CALC || '-' ||  v_CUMPL_EOM || '-' ||  v_CUMPL_BTK || '-' ||  v_FECHA_COMPROMISO_EOM || '-' ||  v_FECHA_COMPROMISO_BTK || '-' ||  v_ESTADO_CALCE_EOM
                   || '-' || v_SUBESTADO_CALCE_EOM || '-' ||  v_FECHA_CALCE_EOM || '-' ||  v_HORA_CALCE_EOM || '-' ||  v_ESTADO_CALCE_BTK || '-' ||  v_SUBESTADO_CALCE_BTK || '-' || v_FECHA_CALCE_BTK || '-' || v_HORA_CALCE_BTK || '-' || v_CRUCE_ESTADO
                   || '-' || v_CRUCE_SUB_ESTADO || '-' || v_N_SOLICITUD_CLIENTE || '-' || v_N_ORDEN_DISTRIBU || '-' || v_FECHA_CREACION_ORDEN || '-' || v_EST_ORDEN || '-' || v_ESTADO_DE_LINEA || '-' || v_SKU || '-' || v_CANT_DESC_SKU || '-' || v_LOCAL_VENTA || '-' || v_DEPART
                   || '-' || v_BODEGADESP || '-' || v_RUTCLIENTE || '-' || v_NOMBRECLIENTE || '-' || v_APELLIDOCLIENTE || '-' || v_DIRECCION_CLIENTE || '-' || v_COD_COMUNA || '-' || v_COMUNA || '-' || v_CIUDAD || '-' || v_REGION || '-' || v_HORARIO
                   || '-' || v_TIPO_ORDEN || '-' || v_TIPO_VENTA || '-' || v_O_FACILITY_ALIAS_ID || '-' || v_REGIONENTREGA || '-' || v_TIPO_DE_ORDEN || '-' || v_GUIA || '-' || v_RUT_EMP || '-' || v_DESC_EMP || '-' || v_TIPOGUI || '-' || v_CLIENTE_RETIRA || '-' || v_FECHA_PRIMER_INTENTO
                   || '-' || v_NUMERO_INTENTOS || '-' || v_FECHA_CREA_PKT || '-' || v_HORA_CREA_PKT || '-' || v_NRO_OLA || '-' || v_FECHA_INICIO_OLA || '-' || v_HORA_INICIO_OLA || '-' || v_FECHA_TERMINO_OLA || '-' || v_HORA_TERMINO_OLA || '-' || v_FECHA_CIERRE_CARGA
                   || '-' || v_HORA_CIERRE_CARGA || '-' || v_FECEMIGUI || '-' || v_LEAD_TIME_TRANSPORTE || '-' || v_DIA_SEMANA_ETA || '-' || v_ENTREGA_DIA_COMPROMISO || '-' || v_VENTA_EMPRESA
                   || '-' || v_CUMPLE || '-' || v_CUMPLIMIENTO_2 || '-' || v_CUMPLE_RESUMEN || '-' || v_BODEGA_DESPACHO || '-' || v_DIF_ETA_CARGA || '-' ||  TO_DATE(v_FECHA_CARGA_REQUERIDA, 'YYYY-MM-DD HH24:MI:SS')  || '-' || v_EVAL_SISTEMA || '-' || v_EVAL_CD || '-' || v_EVAL_1er_INTENTO
                   || '-' || v_CUMPLIMIENTO_CLIENTE || '-' || v_RESPONSABLE || '-' || v_TIPO_CUMPLIMIENTO
                          );
      v_nCNT_LEI := v_nCNT_LEI + 1;
      
      --REM INSERTING into CUMPLIMIENTO
      --SET DEFINE OFF;
      Insert into KPIWEB.CUMPLIMIENTO (LLAVE,TC_PO_LINE_ID,CUMPL_CALC,CUMPL_EOM,CUMPL_BTK,FECHA_COMPROMISO_EOM,FECHA_COMPROMISO_BTK,ESTADO_CALCE_EOM,SUBESTADO_CALCE_EOM,FECHA_CALCE_EOM,HORA_CALCE_EOM,ESTADO_CALCE_BTK,SUBESTADO_CALCE_BTK,FECHA_CALCE_BTK,HORA_CALCE_BTK,CRUCE_ESTADO,CRUCE_SUB_ESTADO,N_SOLICITUD_CLIENTE,N_ORDEN_DISTRIBU,FECHA_CREACION_ORDEN,EST_ORDEN,ESTADO_DE_LINEA,SKU,CANT_DESC_SKU,LOCAL_VENTA,DEPART,BODEGADESP,RUTCLIENTE,NOMBRECLIENTE,APELLIDOCLIENTE,DIRECCION_CLIENTE,COD_COMUNA,COMUNA,CIUDAD,REGION,HORARIO,TIPO_ORDEN,TIPO_VENTA,O_FACILITY_ALIAS_ID,REGIONENTREGA,TIPO_DE_ORDEN,GUIA,RUT_EMP,DESC_EMP,TIPOGUI,CLIENTE_RETIRA,FECHA_PRIMER_INTENTO,NUMERO_INTENTOS,FECHA_CREA_PKT,HORA_CREA_PKT,NRO_OLA,FECHA_INICIO_OLA,HORA_INICIO_OLA,FECHA_TERMINO_OLA,HORA_TERMINO_OLA,FECHA_CIERRE_CARGA,HORA_CIERRE_CARGA,FECEMIGUI,LEAD_TIME_TRANSPORTE,DIA_SEMANA_ETA,ENTREGA_DIA_COMPROMISO,VENTA_EMPRESA,CUMPLE,CUMPLIMIENTO_2,CUMPLE_RESUMEN,BODEGA_DESPACHO,DIF_ETA_CARGA,FECHA_CARGA_REQUERIDA,EVAL_SISTEMA,EVAL_CD,EVAL_1ER_INTENTO,CUMPLIMIENTO_CLIENTE,RESPONSABLE,TIPO_CUMPLIMIENTO, FECHA_INGRESO) 
				   
				   values (v_LLAVE,v_TC_PO_LINE_ID,v_CUMPL_CALC,v_CUMPL_EOM,v_CUMPL_BTK,v_FECHA_COMPROMISO_EOM,v_FECHA_COMPROMISO_BTK,v_ESTADO_CALCE_EOM
                   ,v_SUBESTADO_CALCE_EOM,v_FECHA_CALCE_EOM,v_HORA_CALCE_EOM,v_ESTADO_CALCE_BTK,v_SUBESTADO_CALCE_BTK ,v_FECHA_CALCE_BTK ,v_HORA_CALCE_BTK ,v_CRUCE_ESTADO
                   ,v_CRUCE_SUB_ESTADO ,v_N_SOLICITUD_CLIENTE ,v_N_ORDEN_DISTRIBU ,v_FECHA_CREACION_ORDEN ,v_EST_ORDEN ,v_ESTADO_DE_LINEA ,v_SKU ,v_CANT_DESC_SKU ,v_LOCAL_VENTA ,v_DEPART
                   ,v_BODEGADESP ,v_RUTCLIENTE ,v_NOMBRECLIENTE ,v_APELLIDOCLIENTE ,v_DIRECCION_CLIENTE ,v_COD_COMUNA ,v_COMUNA ,v_CIUDAD ,v_REGION ,v_HORARIO
                   ,v_TIPO_ORDEN ,v_TIPO_VENTA ,v_O_FACILITY_ALIAS_ID ,v_REGIONENTREGA ,v_TIPO_DE_ORDEN ,v_GUIA ,v_RUT_EMP ,v_DESC_EMP ,v_TIPOGUI ,v_CLIENTE_RETIRA ,v_FECHA_PRIMER_INTENTO
                   ,v_NUMERO_INTENTOS ,v_FECHA_CREA_PKT ,v_HORA_CREA_PKT ,v_NRO_OLA ,v_FECHA_INICIO_OLA ,v_HORA_INICIO_OLA ,v_FECHA_TERMINO_OLA ,v_HORA_TERMINO_OLA ,v_FECHA_CIERRE_CARGA
                   ,v_HORA_CIERRE_CARGA ,v_FECEMIGUI ,v_LEAD_TIME_TRANSPORTE ,v_DIA_SEMANA_ETA ,v_ENTREGA_DIA_COMPROMISO ,v_VENTA_EMPRESA
                   ,v_CUMPLE ,v_CUMPLIMIENTO_2 ,v_CUMPLE_RESUMEN ,v_BODEGA_DESPACHO ,v_DIF_ETA_CARGA ,v_FECHA_CARGA_REQUERIDA ,v_EVAL_SISTEMA ,v_EVAL_CD ,v_EVAL_1er_INTENTO
                   ,v_CUMPLIMIENTO_CLIENTE ,v_RESPONSABLE ,v_TIPO_CUMPLIMIENTO,SYSDATE);
			COMMIT;	   
      
      FETCH C1 INTO  v_LLAVE, v_TC_PO_LINE_ID, v_CUMPL_CALC, v_CUMPL_EOM, v_CUMPL_BTK, v_FECHA_COMPROMISO_EOM, v_FECHA_COMPROMISO_BTK, v_ESTADO_CALCE_EOM
                  ,v_SUBESTADO_CALCE_EOM, v_FECHA_CALCE_EOM, v_HORA_CALCE_EOM, v_ESTADO_CALCE_BTK, v_SUBESTADO_CALCE_BTK,v_FECHA_CALCE_BTK,v_HORA_CALCE_BTK,v_CRUCE_ESTADO
                  ,v_CRUCE_SUB_ESTADO,v_N_SOLICITUD_CLIENTE,v_N_ORDEN_DISTRIBU,v_FECHA_CREACION_ORDEN,v_EST_ORDEN,v_ESTADO_DE_LINEA,v_SKU,v_CANT_DESC_SKU,v_LOCAL_VENTA,v_DEPART
                  ,v_BODEGADESP,v_RUTCLIENTE,v_NOMBRECLIENTE,v_APELLIDOCLIENTE,v_DIRECCION_CLIENTE,v_COD_COMUNA,v_COMUNA,v_CIUDAD,v_REGION,v_HORARIO
                  ,v_TIPO_ORDEN,v_TIPO_VENTA,v_O_FACILITY_ALIAS_ID,v_REGIONENTREGA,v_TIPO_DE_ORDEN,v_GUIA,v_RUT_EMP,v_DESC_EMP,v_TIPOGUI,v_CLIENTE_RETIRA,v_FECHA_PRIMER_INTENTO
                  ,v_NUMERO_INTENTOS,v_FECHA_CREA_PKT,v_HORA_CREA_PKT,v_NRO_OLA,v_FECHA_INICIO_OLA,v_HORA_INICIO_OLA,v_FECHA_TERMINO_OLA,v_HORA_TERMINO_OLA,v_FECHA_CIERRE_CARGA
                  ,v_HORA_CIERRE_CARGA,v_FECEMIGUI,v_LEAD_TIME_TRANSPORTE,v_DIA_SEMANA_ETA,v_ENTREGA_DIA_COMPROMISO,v_VENTA_EMPRESA
                  ,v_CUMPLE,v_CUMPLIMIENTO_2,v_CUMPLE_RESUMEN,v_BODEGA_DESPACHO,v_DIF_ETA_CARGA,v_FECHA_CARGA_REQUERIDA,v_EVAL_SISTEMA,v_EVAL_CD,v_EVAL_1er_INTENTO
                  ,v_CUMPLIMIENTO_CLIENTE,v_RESPONSABLE,v_TIPO_CUMPLIMIENTO;
      IF v_nMUESTRA_MSG = 1 THEN
        DBMS_OUTPUT.PUT_LINE(' pi_nCASO_EJC '  || pi_nCASO_EJC);
      END IF;
      
    END LOOP;
    CLOSE C1;
      DBMS_OUTPUT.PUT_LINE('' || '' || '' || '');
      DBMS_OUTPUT.PUT_LINE('' || '' || '' || '' || '... TERMINO INSERTAR FILA CUMPLIMIENTO');
      DBMS_OUTPUT.PUT_LINE('' || '' || '' || '');
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('' || '' || '' || '');
    DBMS_OUTPUT.PUT_LINE('' || '' || '' ||  'REG LEIDOS ' ||  v_nCNT_LEI);
    DBMS_OUTPUT.PUT_LINE('' || '' || '' || '');
  
    DBMS_OUTPUT.PUT_LINE('' || '' || '' || '');
    DBMS_OUTPUT.PUT_LINE('' || '' || '' || '... TERMINO ETAPA PROCESO INSERTAR TABLA CUMPLIMIENTO');
    DBMS_OUTPUT.PUT_LINE('' || '' || '' || '');
    
  end SYSTEM_CARGAR_CUMPLIMIENTO;
  
end SYSTEM_PKG_CUMPLIMIENTO_L;

