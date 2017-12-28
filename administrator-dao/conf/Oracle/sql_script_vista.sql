


-- -----------------------------------------------------
-- Table VISTA_CUMPLIMIENTO
-- -----------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "TXD"."VISTA_CUMPLIMIENTO" ("LLAVE", "TC_PO_LINE_ID", "CUMPL_CALC", "CUMPL_EOM", "CUMPL_BTK", "FECHA_COMPROMISO_EOM", "FECHA_COMPROMISO_BTK", "ESTADO_CALCE_EOM", "SUBESTADO_CALCE_EOM", "FECHA_CALCE_EOM", "HORA_CALCE_EOM", "ESTADO_CALCE_BTK", "SUBESTADO_CALCE_BTK", "FECHA_CALCE_BTK", "HORA_CALCE_BTK", "CRUCE_ESTADO", "CRUCE_SUB_ESTADO", "N_SOLICITUD_CLIENTE", "N_ORDEN_DISTRIBU", "FECHA_CREACION_ORDEN", "EST_ORDEN", "ESTADO_DE_LINEA", "SKU", "CANT_DESC_SKU", "LOCAL_VENTA", "DEPART", "BODEGADESP", "RUTCLIENTE", "NOMBRECLIENTE", "APELLIDOCLIENTE", "DIRECCION_CLIENTE", "COD_COMUNA", "COMUNA", "CIUDAD", "REGION", "HORARIO", "TIPO_ORDEN", "TIPO_VENTA", "O_FACILITY_ALIAS_ID", "REGIONENTREGA", "TIPO_DE_ORDEN", "GUIA", "RUT_EMP", "DESC_EMP", "TIPOGUI", "CLIENTE_RETIRA", "FECHA_PRIMER_INTENTO", "NUMERO_INTENTOS", "FECHA_CREA_PKT", "HORA_CREA_PKT", "NRO_OLA", "FECHA_INICIO_OLA", "HORA_INICIO_OLA", "FECHA_TERMINO_OLA", "HORA_TERMINO_OLA", "FECHA_CIERRE_CARGA", "HORA_CIERRE_CARGA", "FECEMIGUI", "LEAD_TIME_TRANSPORTE", "DIA_SEMANA_ETA", "ENTREGA_DIA_COMPROMISO", "VENTA_EMPRESA") AS 
  SELECT E.N_SOLICITUD_CLIENTE || '-' || E.SKU AS LLAVE, 
      E.TC_PO_LINE_ID,  
      CASE
          WHEN E.TIPO_VENTA IN ('CD DESPACHA', 'VEV CD') THEN
            CASE 
                 WHEN 
                      E.EST_ENTREGA IN ('Entregado','Entrega ','Entrega parcial', 'Recogido', 'Recogido parcial') 
                      AND (TO_NUMBER(TO_CHAR((E.FECHACOMPROMISO),'YYYYMMDD')) - TO_NUMBER(TO_CHAR((B.FECHA_LLEGADA),'YYYYMMDD')))  < -0.001 THEN 'ATRASADO'
                 WHEN E.EST_ENTREGA IN ('Entregado','Entrega ','Entrega parcial', 'Recogido', 'Recogido parcial') 
                      AND (TO_NUMBER(TO_CHAR((E.FECHACOMPROMISO),'YYYYMMDD')) - TO_NUMBER(TO_CHAR((B.FECHA_LLEGADA),'YYYYMMDD'))) <= 0 THEN 'EN FECHA'
                 WHEN E.EST_ENTREGA IN ('Entregado','Entrega ','Entrega parcial', 'Recogido', 'Recogido parcial') 
                      AND (TO_NUMBER(TO_CHAR((E.FECHACOMPROMISO),'YYYYMMDD')) - TO_NUMBER(TO_CHAR((B.FECHA_LLEGADA),'YYYYMMDD'))) > 0 THEN 'ADELANTADO'
            END
          WHEN E.TIPO_VENTA IN ('VEV PD') THEN
            CASE 
                 WHEN E.EST_ENTREGA IS NOT NULL THEN E.CUMPLIMIENTO
                 WHEN E.EST_ENTREGA IS NULL THEN 'VeV PD - En Ruta o CT'
            END
      END AS CUMPL_CALC, 
      E.CUMPLIMIENTO AS CUMPL_EOM,
      B.CUMPLIMIENTO AS CUMPL_BTK, 
      E.FECHACOMPROMISO AS FECHA_COMPROMISO_EOM,
      B.FECHA_COMPROMISO AS FECHA_COMPROMISO_BTK,
      E.EST_1 AS ESTADO_CALCE_EOM, 
      E.EST_ENTREGA AS SUBESTADO_CALCE_EOM, 
      E.FECHA_ENTR_CLIENTE AS FECHA_CALCE_EOM, 
      TO_CHAR(E.FECHA_ENTR_CLIENTE, 'HH24:MI:SS') AS HORA_CALCE_EOM,
      B.ESTADO AS ESTADO_CALCE_BTK, 
      B.SUBESTADO AS SUBESTADO_CALCE_BTK, 
      B.FECHA_LLEGADA AS FECHA_CALCE_BTK,
      TO_CHAR(B.FECHA_LLEGADA, 'HH24:MI:SS') AS HORA_CALCE_BTK,
      CASE 
           WHEN E.EST_1 = 'Sin Informacion' THEN B.ESTADO
           ELSE E.EST_1 END AS CRUCE_ESTADO,
      CASE 
           WHEN E.EST_ENTREGA = 'Sin Informacion' THEN B.SUBESTADO
           ELSE E.EST_ENTREGA END AS CRUCE_SUB_ESTADO,    
      E.N_SOLICITUD_CLIENTE, E.N_ORDEN_DISTRIBU, E.FECHA_CREACION_ORDEN, 
      E.EST_ORDEN, E.ESTADO_DE_LINEA, E.SKU, E.CANT_DESC_SKU, E.LOCAL_VENTA, E.DEPART, E.BODEGADESP,  
      E.RUTCLIENTE, E.NOMBRECLIENTE, E.APELLIDOCLIENTE, E.DIRECCION_CLIENTE, E.D_POSTAL_CODE AS COD_COMUNA, E.COMUNA, 
      E.CIUDAD, E.REGION, E.HORARIO, E.TIPO_ORDEN, E.TIPO_VENTA, 
      E.O_FACILITY_ALIAS_ID, E.REGIONENTREGA, 
      E.TIPO_DE_ORDEN, B.GUIA, B.RUT_EMP, B.DESC_EMP, B.TIPOGUI,
      CASE 
           WHEN E.COMUNA = 'RENCA' AND E.DIRECCION_CLIENTE LIKE '%CAMINO%VECINAL%' THEN 'SI'
           WHEN E.RUTCLIENTE = 'RENCA' AND E.DIRECCION_CLIENTE LIKE '%CAMINO%VECINAL%' THEN 'SI'
           ELSE 'NO' 
      END AS CLIENTE_RETIRA, 
      B.FECHA_PRIMER_INTENTO, B.NUMERO_INTENTOS,
      W.FEC_CREA_HD_PKT AS FECHA_CREA_PKT,
      TO_CHAR(W.FEC_CREA_HD_PKT, 'HH24:MI:SS') AS HORA_CREA_PKT,
      W.NRO_OLA,
      W.FECHA_INICIO_OLA, 
      TO_CHAR(W.FECHA_INICIO_OLA, 'HH24:MI:SS') AS HORA_INICIO_OLA,
      W.FECHA_TERMINO_OLA, 
      TO_CHAR(W.FECHA_TERMINO_OLA, 'HH24:MI:SS') AS HORA_TERMINO_OLA,  
      W.FECHA_CIERRE_CARGA, 
      TO_CHAR(W.FECHA_CIERRE_CARGA, 'HH24:MI:SS') AS HORA_CIERRE_CARGA,
      B.FECEMIGUI, L.LEAD_TIME_TRANSPORTE,
      (TO_CHAR(E.FECHACOMPROMISO,'D')) AS DIA_SEMANA_ETA, 
      -- E.D_POSTAL_CODE, E.O_FACILITY_ALIAS_ID,
      CASE 
        -- El parametro -1 cambia segun servidor en este caso es win server se resta uno 
        --para identificar el dia que por alguna razon no lo hace correcto y cuando es
        -- domingo es 0 
        WHEN TO_NUMBER((TO_CHAR(E.FECHACOMPROMISO,'D'))-1) = 1 THEN L.LLEGA_MONDAY
        WHEN TO_NUMBER((TO_CHAR(E.FECHACOMPROMISO,'D'))-1) = 2 THEN L.LLEGA_TUESDAY
        WHEN TO_NUMBER((TO_CHAR(E.FECHACOMPROMISO,'D'))-1) = 3 THEN L.LLEGA_WEDNESDAY
        WHEN TO_NUMBER((TO_CHAR(E.FECHACOMPROMISO,'D'))-1) = 4 THEN L.LLEGA_THURSDAY
        WHEN TO_NUMBER((TO_CHAR(E.FECHACOMPROMISO,'D'))-1) = 5 THEN L.LLEGA_FRIDAY
        WHEN TO_NUMBER((TO_CHAR(E.FECHACOMPROMISO,'D'))-1) = 6 THEN L.LLEGA_SATURDAY
        WHEN TO_NUMBER((TO_CHAR(E.FECHACOMPROMISO,'D'))-1) = 0 THEN L.LLEGA_SUNDAY
      END AS ENTREGA_DIA_COMPROMISO,
      E.VENTA_EMPRESA
  FROM EOM_CUMPLIMIENTO E 
        LEFT OUTER JOIN KPI_CUMPLIMIENTO B
          ON E.N_SOLICITUD_CLIENTE = B.NUMSOLGUI 
            AND E.SKU = B.SKU
        LEFT OUTER JOIN WMS_OLA_CARGA_HIST W
          ON E.N_ORDEN_DISTRIBU = W.PICK_TICKET
            AND E.SKU = W.SKU
        LEFT OUTER JOIN LEAD_TIME L
          ON TO_NUMBER(E.D_POSTAL_CODE) = L.COMUNA_CODE
            AND E.O_FACILITY_ALIAS_ID =  TO_NUMBER(L.ORIGEN)
  WHERE E.TIPO_VENTA IN ('CD DESPACHA', 'VEV CD') 
      -- AND E.N_SOLICITUD_CLIENTE IN ('102832251')
  GROUP BY 
      E.N_SOLICITUD_CLIENTE || '-' || E.SKU, E.TC_PO_LINE_ID,  
      CASE
          WHEN E.TIPO_VENTA IN ('CD DESPACHA', 'VEV CD') THEN
            CASE 
                 WHEN 
                      E.EST_ENTREGA IN ('Entregado','Entrega ','Entrega parcial', 'Recogido', 'Recogido parcial') 
                      AND (TO_NUMBER(TO_CHAR((E.FECHACOMPROMISO),'YYYYMMDD')) - TO_NUMBER(TO_CHAR((B.FECHA_LLEGADA),'YYYYMMDD')))  < -0.001 THEN 'ATRASADO'
                 WHEN E.EST_ENTREGA IN ('Entregado','Entrega ','Entrega parcial', 'Recogido', 'Recogido parcial') 
                      AND (TO_NUMBER(TO_CHAR((E.FECHACOMPROMISO),'YYYYMMDD')) - TO_NUMBER(TO_CHAR((B.FECHA_LLEGADA),'YYYYMMDD'))) <= 0 THEN 'EN FECHA'
                 WHEN E.EST_ENTREGA IN ('Entregado','Entrega ','Entrega parcial', 'Recogido', 'Recogido parcial') 
                      AND (TO_NUMBER(TO_CHAR((E.FECHACOMPROMISO),'YYYYMMDD')) - TO_NUMBER(TO_CHAR((B.FECHA_LLEGADA),'YYYYMMDD'))) > 0 THEN 'ADELANTADO'
            END
          WHEN E.TIPO_VENTA IN ('VEV PD') THEN
            CASE 
                 WHEN E.EST_ENTREGA IS NOT NULL THEN E.CUMPLIMIENTO
                 WHEN E.EST_ENTREGA IS NULL THEN 'VeV PD - En Ruta o CT'
            END
      END, 
      E.CUMPLIMIENTO, B.CUMPLIMIENTO, E.FECHACOMPROMISO, B.FECHA_COMPROMISO,
      E.EST_1, E.EST_ENTREGA, E.FECHA_ENTR_CLIENTE, 
      TO_CHAR(E.FECHA_ENTR_CLIENTE, 'HH24:MI:SS'),
      B.ESTADO, B.SUBESTADO, B.FECHA_LLEGADA,
      TO_CHAR(B.FECHA_LLEGADA, 'HH24:MI:SS'),
      CASE 
           WHEN E.EST_1 = 'Sin Informacion' THEN B.ESTADO
           ELSE E.EST_1 END,
      CASE 
           WHEN E.EST_ENTREGA = 'Sin Informacion' THEN B.SUBESTADO
           ELSE E.EST_ENTREGA END,    
      E.N_SOLICITUD_CLIENTE, E.N_ORDEN_DISTRIBU, E.FECHA_CREACION_ORDEN, 
      E.EST_ORDEN, E.ESTADO_DE_LINEA, E.SKU, E.CANT_DESC_SKU, E.LOCAL_VENTA, E.DEPART, E.BODEGADESP,  
      E.RUTCLIENTE, E.NOMBRECLIENTE, E.APELLIDOCLIENTE, E.DIRECCION_CLIENTE, E.D_POSTAL_CODE, E.COMUNA, 
      E.CIUDAD, E.REGION, E.HORARIO, E.TIPO_ORDEN, E.TIPO_VENTA, 
      -- E.GDD, E.HOJARUTA, 
      E.O_FACILITY_ALIAS_ID, E.REGIONENTREGA, 
      E.TIPO_DE_ORDEN, B.GUIA, B.RUT_EMP, B.DESC_EMP, B.TIPOGUI,
      B.FECHA_PRIMER_INTENTO, B.NUMERO_INTENTOS, 
      W.FEC_CREA_HD_PKT, TO_CHAR(W.FEC_CREA_HD_PKT, 'HH24:MI:SS'),
      W.NRO_OLA, W.FECHA_INICIO_OLA, TO_CHAR(W.FECHA_INICIO_OLA, 'HH24:MI:SS'),
      W.FECHA_TERMINO_OLA, TO_CHAR(W.FECHA_TERMINO_OLA, 'HH24:MI:SS'),  
      W.FECHA_CIERRE_CARGA, TO_CHAR(W.FECHA_CIERRE_CARGA, 'HH24:MI:SS'),
      B.FECEMIGUI, L.LEAD_TIME_TRANSPORTE, (TO_CHAR(E.FECHACOMPROMISO,'D')),    
      CASE 
        WHEN TO_NUMBER((TO_CHAR(E.FECHACOMPROMISO,'D'))-1) = 1 THEN L.LLEGA_MONDAY
        WHEN TO_NUMBER((TO_CHAR(E.FECHACOMPROMISO,'D'))-1) = 2 THEN L.LLEGA_TUESDAY
        WHEN TO_NUMBER((TO_CHAR(E.FECHACOMPROMISO,'D'))-1) = 3 THEN L.LLEGA_WEDNESDAY
        WHEN TO_NUMBER((TO_CHAR(E.FECHACOMPROMISO,'D'))-1) = 4 THEN L.LLEGA_THURSDAY
        WHEN TO_NUMBER((TO_CHAR(E.FECHACOMPROMISO,'D'))-1) = 5 THEN L.LLEGA_FRIDAY
        WHEN TO_NUMBER((TO_CHAR(E.FECHACOMPROMISO,'D'))-1) = 6 THEN L.LLEGA_SATURDAY
        WHEN TO_NUMBER((TO_CHAR(E.FECHACOMPROMISO,'D'))-1) = 0 THEN L.LLEGA_SUNDAY
      END,
      E.VENTA_EMPRESA
  ORDER BY E.N_SOLICITUD_CLIENTE, E.TC_PO_LINE_ID;

  -- -----------------------------------------------------
-- Table VISTA_CARGAR_CUMPLIMIENTO SERVIDOR
-- -----------------------------------------------------


  CREATE OR REPLACE FORCE VIEW "TXD"."VISTA_CARGAR_CUMPLIMIENTO" ("LLAVE", "TC_PO_LINE_ID", "CUMPL_CALC", "CUMPL_EOM", "CUMPL_BTK", "FECHA_COMPROMISO_EOM", "FECHA_COMPROMISO_BTK", "ESTADO_CALCE_EOM", "SUBESTADO_CALCE_EOM", "FECHA_CALCE_EOM", "HORA_CALCE_EOM", "ESTADO_CALCE_BTK", "SUBESTADO_CALCE_BTK", "FECHA_CALCE_BTK", "HORA_CALCE_BTK", "CRUCE_ESTADO", "CRUCE_SUB_ESTADO", "N_SOLICITUD_CLIENTE", "N_ORDEN_DISTRIBU", "FECHA_CREACION_ORDEN", "EST_ORDEN", "ESTADO_DE_LINEA", "SKU", "CANT_DESC_SKU", "LOCAL_VENTA", "DEPART", "BODEGADESP", "RUTCLIENTE", "NOMBRECLIENTE", "APELLIDOCLIENTE", "DIRECCION_CLIENTE", "COD_COMUNA", "COMUNA", "CIUDAD", "REGION", "HORARIO", "TIPO_ORDEN", "TIPO_VENTA", "O_FACILITY_ALIAS_ID", "REGIONENTREGA", "TIPO_DE_ORDEN", "GUIA", "RUT_EMP", "DESC_EMP", "TIPOGUI", "CLIENTE_RETIRA", "FECHA_PRIMER_INTENTO", "NUMERO_INTENTOS", "FECHA_CREA_PKT", "HORA_CREA_PKT", "NRO_OLA", "FECHA_INICIO_OLA", "HORA_INICIO_OLA", "FECHA_TERMINO_OLA", "HORA_TERMINO_OLA", "FECHA_CIERRE_CARGA", "HORA_CIERRE_CARGA", "FECEMIGUI", "LEAD_TIME_TRANSPORTE", "DIA_SEMANA_ETA", "ENTREGA_DIA_COMPROMISO", "VENTA_EMPRESA", "CUMPLE", "CUMPLIMIENTO_2", "CUMPLE_RESUMEN", "BODEGA_DESPACHO", "DIF_ETA_CARGA", "FECHA_CARGA_REQUERIDA", "EVAL_SISTEMA", "EVAL_CD", "EVAL_1ER_INTENTO", "CUMPLIMIENTO_CLIENTE", "RESPONSABLE", "TIPO_CUMPLIMIENTO") AS 
  select
NVL(LLAVE,'-') AS LLAVE
  ,TC_PO_LINE_ID
  ,CUMPL_CALC
  ,CUMPL_EOM
  ,CUMPL_BTK
  ,TO_CHAR(FECHA_COMPROMISO_EOM, 'YYYY-MM-DD HH24:MI:SS') AS FECHA_COMPROMISO_EOM
  ,TO_CHAR(FECHA_COMPROMISO_BTK, 'YYYY-MM-DD HH24:MI:SS') AS FECHA_COMPROMISO_BTK
  ,ESTADO_CALCE_EOM
  ,SUBESTADO_CALCE_EOM
  ,TO_CHAR(FECHA_CALCE_EOM, 'YYYY-MM-DD HH24:MI:SS') AS FECHA_CALCE_EOM
  ,HORA_CALCE_EOM
  ,ESTADO_CALCE_BTK
  ,SUBESTADO_CALCE_BTK
  ,TO_CHAR(FECHA_CALCE_BTK, 'YYYY-MM-DD HH24:MI:SS') AS FECHA_CALCE_BTK
  ,HORA_CALCE_BTK
  ,CRUCE_ESTADO
  ,CRUCE_SUB_ESTADO
  ,N_SOLICITUD_CLIENTE
  ,N_ORDEN_DISTRIBU
  ,TO_CHAR(FECHA_CREACION_ORDEN, 'YYYY-MM-DD HH24:MI:SS') AS FECHA_CREACION_ORDEN
  ,EST_ORDEN
  ,ESTADO_DE_LINEA
  ,SKU
  ,CANT_DESC_SKU
  ,LOCAL_VENTA
  ,DEPART
  ,BODEGADESP
  ,RUTCLIENTE
  ,NOMBRECLIENTE
  ,APELLIDOCLIENTE
  ,DIRECCION_CLIENTE
  ,COD_COMUNA
  ,COMUNA
  ,CIUDAD
  ,REGION
  ,NVL(HORARIO,'-') AS HORARIO
  ,TIPO_ORDEN
  ,NVL(TIPO_VENTA,'-') AS TIPO_VENTA
  ,O_FACILITY_ALIAS_ID
  ,REGIONENTREGA
  ,NVL(TIPO_DE_ORDEN,'-') AS TIPO_DE_ORDEN
  ,GUIA
  ,RUT_EMP
  ,NVL(DESC_EMP,'-') AS DESC_EMP
  ,NVL(TIPOGUI,'-') AS TIPOGUI
  ,NVL(CLIENTE_RETIRA,'-') AS CLIENTE_RETIRA
  ,TO_CHAR(FECHA_PRIMER_INTENTO, 'YYYY-MM-DD HH24:MI:SS') AS FECHA_PRIMER_INTENTO
  ,NUMERO_INTENTOS
  ,TO_CHAR(FECHA_CREA_PKT, 'YYYY-MM-DD HH24:MI:SS') AS FECHA_CREA_PKT
  ,HORA_CREA_PKT
  ,NRO_OLA
  ,TO_CHAR(FECHA_INICIO_OLA, 'YYYY-MM-DD HH24:MI:SS') AS FECHA_INICIO_OLA
  ,HORA_INICIO_OLA
  ,TO_CHAR(FECHA_TERMINO_OLA, 'YYYY-MM-DD HH24:MI:SS') AS FECHA_TERMINO_OLA
  ,HORA_TERMINO_OLA
  ,TO_CHAR(FECHA_CIERRE_CARGA, 'YYYY-MM-DD HH24:MI:SS') AS FECHA_CIERRE_CARGA
  ,HORA_CIERRE_CARGA
  ,TO_CHAR(FECEMIGUI, 'YYYY-MM-DD HH24:MI:SS') AS FECEMIGUI
  ,LEAD_TIME_TRANSPORTE
  ,DIA_SEMANA_ETA
  ,ENTREGA_DIA_COMPROMISO
  ,NVL(VENTA_EMPRESA,'-') AS VENTA_EMPRESA
  
  ,OBTENER_CUMPLE(CUMPL_CALC, CUMPL_BTK, CUMPL_EOM, CRUCE_SUB_ESTADO, CRUCE_ESTADO, ESTADO_DE_LINEA, ESTADO_CALCE_BTK, GUIA) AS CUMPLE
  ,OBTENER_CUMPLIIENTO_2(CUMPL_CALC, CUMPL_BTK, CUMPL_EOM, CRUCE_SUB_ESTADO, CRUCE_ESTADO, ESTADO_DE_LINEA, ESTADO_CALCE_BTK, GUIA, EST_ORDEN) AS CUMPLIMIENTO_2
  ,OBTENER_CUMPLE_RESUMEN(CUMPL_CALC, CUMPL_BTK, CUMPL_EOM, CRUCE_SUB_ESTADO, CRUCE_ESTADO, ESTADO_DE_LINEA, ESTADO_CALCE_BTK, GUIA) AS CUMPLE_RESUMEN
  ,(
  CASE 
      WHEN O_FACILITY_ALIAS_ID = '200' OR O_FACILITY_ALIAS_ID = '012' OR O_FACILITY_ALIAS_ID = '12' OR TO_NUMBER(O_FACILITY_ALIAS_ID, '999') = 12 OR TO_NUMBER(O_FACILITY_ALIAS_ID, '999') = 200 THEN O_FACILITY_ALIAS_ID
  ELSE
      'Proveedor'
  END
  ) AS BODEGA_DESPACHO
  , NVL(TO_NUMBER( TO_DATE(FECHA_COMPROMISO_EOM, 'DD/MM/YYYY HH24:MI:SS')-TO_DATE(FECHA_CIERRE_CARGA, 'DD/MM/YYYY HH24:MI:SS')),45666) AS DIF_ETA_CARGA
  ,
  TO_CHAR(
  TO_DATE(
  (
  CASE 
      --OBTIENE EL NUMERO DEL DIA DE LA SEMANA
      WHEN ( TO_NUMBER((TO_CHAR(TO_DATE(FECHA_COMPROMISO_EOM, 'DD-MON-YY')-LEAD_TIME_TRANSPORTE,'D'))) -1) = 0  THEN  TO_CHAR(TO_DATE(FECHA_COMPROMISO_EOM, 'DD-MON-YY')-LEAD_TIME_TRANSPORTE-1,  'DD-MON-YY')
  ELSE
      TO_CHAR( TO_DATE(FECHA_COMPROMISO_EOM, 'DD-MON-YY')-LEAD_TIME_TRANSPORTE,  'DD-MON-YY')
  END
  )
  , 'DD-MON-YY')
  , 'YYYY-MM-DD HH24:MI:SS')
  AS FECHA_CARGA_REQUERIDA
  ,(
  CASE WHEN 
            (
            CASE 
                WHEN 
                (
                CASE 
                    WHEN CUMPL_CALC ='' OR CUMPL_CALC IS NULL THEN 
                      CASE 
                               WHEN CUMPL_BTK = '' OR CUMPL_BTK IS NULL OR CUMPL_BTK = 'No Cumplimiento'  THEN 
                                  CASE 
                                    WHEN CUMPL_EOM = 'Sin Informacion'   THEN 
                                    
                                        CASE 
                                            WHEN CRUCE_SUB_ESTADO = '' OR CRUCE_SUB_ESTADO IS NULL   THEN 
                                                  CASE 
                                                    WHEN CRUCE_ESTADO = '' OR CRUCE_ESTADO IS NULL   THEN 
                                                          CASE 
                                                            WHEN ESTADO_DE_LINEA = 'Shipped'   THEN 
                                                                  CASE 
                                                                      WHEN ESTADO_CALCE_BTK = 'En Proceso de Carga'   THEN ESTADO_CALCE_BTK 
                                                                  ELSE
                                                                    CASE 
                                                                      WHEN GUIA = '' OR GUIA IS NULL   THEN 'Problema Carga Guía'  ELSE 'En Ruta o CT'
                                                                    
                                                                    END
                                                                  END
                                                          ELSE
                                                            'Preparación CD'
                                                          END
                                                  ELSE
                                                    CRUCE_ESTADO
                                                  END
                                        ELSE
                                          CRUCE_SUB_ESTADO
                                        END
                                  ELSE
                                    CUMPL_EOM
                                  END
                      
                      ELSE
                        CUMPL_BTK
                      END
                ELSE
                    CUMPL_CALC
                END
                )
                = 'Sin Informacion' 
                    THEN 'Sin Información ' || '(' || (CASE   WHEN ESTADO_DE_LINEA = '' OR ESTADO_DE_LINEA IS NULL  THEN EST_ORDEN ELSE ESTADO_DE_LINEA END) || ')'
            ELSE
              
                (
                CASE 
                    WHEN CUMPL_CALC ='' OR CUMPL_CALC IS NULL THEN 
                      CASE 
                               WHEN CUMPL_BTK = '' OR CUMPL_BTK IS NULL OR CUMPL_BTK = 'No Cumplimiento'  THEN 
                                  CASE 
                                    WHEN CUMPL_EOM = 'Sin Informacion'   THEN 
                                    
                                        CASE 
                                            WHEN CRUCE_SUB_ESTADO = '' OR CRUCE_SUB_ESTADO IS NULL   THEN 
                                                  CASE 
                                                    WHEN CRUCE_ESTADO = '' OR CRUCE_ESTADO IS NULL   THEN 
                                                          CASE 
                                                            WHEN ESTADO_DE_LINEA = 'Shipped'   THEN 
                                                                  CASE 
                                                                      WHEN ESTADO_CALCE_BTK = 'En Proceso de Carga'   THEN ESTADO_CALCE_BTK 
                                                                  ELSE
                                                                    CASE 
                                                                      WHEN GUIA = '' OR GUIA IS NULL   THEN 'Problema Carga Guía'  ELSE 'En Ruta o CT'
                                                                    
                                                                    END
                                                                  END
                                                          ELSE
                                                            'Preparación CD'
                                                          END
                                                  ELSE
                                                    CRUCE_ESTADO
                                                  END
                                        ELSE
                                          CRUCE_SUB_ESTADO
                                        END
                                  ELSE
                                    CUMPL_EOM
                                  END
                      
                      ELSE
                        CUMPL_BTK
                      END
                ELSE
                    CUMPL_CALC
                END
                )
            END
          )
          = 'Problema Carga Guía'  THEN 'No Cumple'
  ELSE
      CASE  WHEN ENTREGA_DIA_COMPROMISO = 1  THEN 'Cumple'
      ELSE
        CASE WHEN ENTREGA_DIA_COMPROMISO = 0  THEN 'No Cumple'
        ELSE
          'Faltan Datos'
        END
      END
  END
  ) AS EVAL_SISTEMA
  ,(
  CASE WHEN ( FECHA_CIERRE_CARGA = '' OR FECHA_CIERRE_CARGA IS NULL OR LEAD_TIME_TRANSPORTE = '' OR LEAD_TIME_TRANSPORTE IS NULL)  THEN 'Sin información'
  ELSE
      CASE  WHEN 
               -- 20-MAR-17
               (
                CASE 
                    WHEN ( TO_NUMBER((TO_CHAR(TO_DATE(FECHA_COMPROMISO_EOM, 'DD-MON-YY')-LEAD_TIME_TRANSPORTE,'D'))) -1) = 0  THEN  (TO_DATE(FECHA_COMPROMISO_EOM, 'DD-MON-YY')-LEAD_TIME_TRANSPORTE)-1
                ELSE
                    TO_DATE(FECHA_COMPROMISO_EOM, 'DD-MON-YY')-TO_NUMBER(LEAD_TIME_TRANSPORTE)
                END
                ) >=  TO_DATE(FECHA_CIERRE_CARGA, 'DD-MON-YY')   THEN 'Cumple'
      ELSE
        'No Cumple'
      END
  END
  ) AS EVAL_CD
  ,(
  CASE WHEN FECHA_PRIMER_INTENTO = '' OR FECHA_PRIMER_INTENTO IS NULL   THEN 'No Cumple'
  ELSE
      CASE  WHEN TO_DATE(FECHA_PRIMER_INTENTO, 'DD-MON-YY') <= TO_DATE(FECHA_COMPROMISO_EOM, 'DD-MON-YY')  THEN 'Cumple'
      ELSE
        'No Cumple'
      END
  END
  ) AS EVAL_1er_INTENTO
  ,OBTENER_CUMPLIMIENTO_CLIENTE(CUMPL_CALC, CUMPL_BTK, CUMPL_EOM, CRUCE_SUB_ESTADO, CRUCE_ESTADO, ESTADO_DE_LINEA, ESTADO_CALCE_BTK, GUIA, FECHA_CALCE_EOM, FECHA_CALCE_BTK, FECHA_COMPROMISO_EOM, FECHA_COMPROMISO_BTK) AS CUMPLIMIENTO_CLIENTE
  ,(
  CASE 
    WHEN  NOT(OBTENER_CUMPLE_RESUMEN(CUMPL_CALC, CUMPL_BTK, CUMPL_EOM, CRUCE_SUB_ESTADO, CRUCE_ESTADO, ESTADO_DE_LINEA, ESTADO_CALCE_BTK, GUIA) = 'CUMPLIMIENTO')  THEN 
      CASE 
        WHEN  OBTENER_EVAL_SISTEMA(CUMPL_CALC, CUMPL_BTK, CUMPL_EOM, CRUCE_SUB_ESTADO, CRUCE_ESTADO, ESTADO_DE_LINEA, ESTADO_CALCE_BTK, GUIA, EST_ORDEN, ENTREGA_DIA_COMPROMISO) = 'No Cumple' THEN 'Sistemas'
      ELSE
        CASE 
          WHEN  OBTENER_EVOLUCION_CD(FECHA_CIERRE_CARGA, LEAD_TIME_TRANSPORTE, FECHA_COMPROMISO_EOM) = 'No Cumple' THEN 'CD'
        ELSE
          CASE 
            WHEN  OBTENER_PRIMER_INTENTO(FECHA_PRIMER_INTENTO, FECHA_COMPROMISO_EOM) = 'Cumple' THEN 
              CASE 
                WHEN  OBTENER_RESPONSABLES(CUMPL_CALC, CUMPL_BTK, CUMPL_EOM, CRUCE_SUB_ESTADO, CRUCE_ESTADO, ESTADO_DE_LINEA, ESTADO_CALCE_BTK, GUIA) IN ('Expectativa', 'Cliente No Está', 'Dirección Errónea', 'Motivos Cliente', 'NCredito', 'Nota de Crédito', 'RechaEXP')   THEN 'Cliente'
                WHEN  OBTENER_RESPONSABLES(CUMPL_CALC, CUMPL_BTK, CUMPL_EOM, CRUCE_SUB_ESTADO, CRUCE_ESTADO, ESTADO_DE_LINEA, ESTADO_CALCE_BTK, GUIA) IN ('Daño Producto')   THEN 'Proveedor, CD o Transporte'
                WHEN  OBTENER_RESPONSABLES(CUMPL_CALC, CUMPL_BTK, CUMPL_EOM, CRUCE_SUB_ESTADO, CRUCE_ESTADO, ESTADO_DE_LINEA, ESTADO_CALCE_BTK, GUIA) IN ('Sin Informacion')   THEN 'Falta Información'
                WHEN  OBTENER_RESPONSABLES(CUMPL_CALC, CUMPL_BTK, CUMPL_EOM, CRUCE_SUB_ESTADO, CRUCE_ESTADO, ESTADO_DE_LINEA, ESTADO_CALCE_BTK, GUIA) IN ('Producto No Corresponde')   THEN 'CD o Transporte'
                WHEN  OBTENER_RESPONSABLES(CUMPL_CALC, CUMPL_BTK, CUMPL_EOM, CRUCE_SUB_ESTADO, CRUCE_ESTADO, ESTADO_DE_LINEA, ESTADO_CALCE_BTK, GUIA) IN ('Motivo Transportes', 'En Ruta o CT')   THEN 'Transporte'
                WHEN  OBTENER_RESPONSABLES(CUMPL_CALC, CUMPL_BTK, CUMPL_EOM, CRUCE_SUB_ESTADO, CRUCE_ESTADO, ESTADO_DE_LINEA, ESTADO_CALCE_BTK, GUIA) IN ('Preparación CD', 'En Proceso de Carga')   THEN 'CD'
                WHEN  OBTENER_RESPONSABLES(CUMPL_CALC, CUMPL_BTK, CUMPL_EOM, CRUCE_SUB_ESTADO, CRUCE_ESTADO, ESTADO_DE_LINEA, ESTADO_CALCE_BTK, GUIA) IN ('Error Sistémico')   THEN 'Sistemas'
                WHEN  OBTENER_RESPONSABLES(CUMPL_CALC, CUMPL_BTK, CUMPL_EOM, CRUCE_SUB_ESTADO, CRUCE_ESTADO, ESTADO_DE_LINEA, ESTADO_CALCE_BTK, GUIA) IN ('Problema Carga Guía')   THEN 'CD o Sistemas'
              ELSE
                'Cliente'
              END
          ELSE
                CASE 
                  WHEN  ( 
                          OBTENER_RESPONSABLES(CUMPL_CALC, CUMPL_BTK, CUMPL_EOM, CRUCE_SUB_ESTADO, CRUCE_ESTADO, ESTADO_DE_LINEA, ESTADO_CALCE_BTK, GUIA) = 'ATRASADO' AND OBTENER_EVOLUCION_CD(FECHA_CIERRE_CARGA, LEAD_TIME_TRANSPORTE, FECHA_COMPROMISO_EOM) = 'Cumple') 
                          or 
                          (OBTENER_EVOLUCION_CD(FECHA_CIERRE_CARGA, LEAD_TIME_TRANSPORTE, FECHA_COMPROMISO_EOM) = 'Cumple' AND OBTENER_PRIMER_INTENTO(FECHA_PRIMER_INTENTO, FECHA_COMPROMISO_EOM) = 'No Cumple') THEN 'Transporte'
                ELSE 
                  CASE 
                    WHEN  (OBTENER_EVOLUCION_CD(FECHA_CIERRE_CARGA, LEAD_TIME_TRANSPORTE, FECHA_COMPROMISO_EOM) = 'Sin Información' AND OBTENER_PRIMER_INTENTO(FECHA_PRIMER_INTENTO, FECHA_COMPROMISO_EOM) = 'No Cumple') OR (OBTENER_RESPONSABLES(CUMPL_CALC, CUMPL_BTK, CUMPL_EOM, CRUCE_SUB_ESTADO, CRUCE_ESTADO, ESTADO_DE_LINEA, ESTADO_CALCE_BTK, GUIA) = 'En Ruta o CT' OR OBTENER_RESPONSABLES(CUMPL_CALC, CUMPL_BTK, CUMPL_EOM, CRUCE_SUB_ESTADO, CRUCE_ESTADO, ESTADO_DE_LINEA, ESTADO_CALCE_BTK, GUIA) = 'ATRASADO') THEN 'Sin Información'
                      ELSE 
                        CASE 
                          WHEN  OBTENER_RESPONSABLES(CUMPL_CALC, CUMPL_BTK, CUMPL_EOM, CRUCE_SUB_ESTADO, CRUCE_ESTADO, ESTADO_DE_LINEA, ESTADO_CALCE_BTK, GUIA) IN ('Expectativa', 'Cliente No Está', 'Dirección Errónea', 'Motivos Cliente', 'NCredito', 'Nota de Crédito', 'RechaEXP')   THEN 'Cliente'
                          WHEN  OBTENER_RESPONSABLES(CUMPL_CALC, CUMPL_BTK, CUMPL_EOM, CRUCE_SUB_ESTADO, CRUCE_ESTADO, ESTADO_DE_LINEA, ESTADO_CALCE_BTK, GUIA) IN ('Daño Producto')   THEN 'Proveedor, CD o Transporte'
                          WHEN  OBTENER_RESPONSABLES(CUMPL_CALC, CUMPL_BTK, CUMPL_EOM, CRUCE_SUB_ESTADO, CRUCE_ESTADO, ESTADO_DE_LINEA, ESTADO_CALCE_BTK, GUIA) IN ('Sin Informacion')   THEN 'Falta Información'
                          WHEN  OBTENER_RESPONSABLES(CUMPL_CALC, CUMPL_BTK, CUMPL_EOM, CRUCE_SUB_ESTADO, CRUCE_ESTADO, ESTADO_DE_LINEA, ESTADO_CALCE_BTK, GUIA) IN ('Producto No Corresponde')   THEN 'CD o Transporte'
                          WHEN  OBTENER_RESPONSABLES(CUMPL_CALC, CUMPL_BTK, CUMPL_EOM, CRUCE_SUB_ESTADO, CRUCE_ESTADO, ESTADO_DE_LINEA, ESTADO_CALCE_BTK, GUIA) IN ('Motivo Transportes', 'En Ruta o CT')   THEN 'Transporte'
                          WHEN  OBTENER_RESPONSABLES(CUMPL_CALC, CUMPL_BTK, CUMPL_EOM, CRUCE_SUB_ESTADO, CRUCE_ESTADO, ESTADO_DE_LINEA, ESTADO_CALCE_BTK, GUIA) IN ('Preparación CD', 'En Proceso de Carga')   THEN 'CD'
                          WHEN  OBTENER_RESPONSABLES(CUMPL_CALC, CUMPL_BTK, CUMPL_EOM, CRUCE_SUB_ESTADO, CRUCE_ESTADO, ESTADO_DE_LINEA, ESTADO_CALCE_BTK, GUIA) IN ('Error Sistémico')   THEN 'Sistemas'
                          WHEN  OBTENER_RESPONSABLES(CUMPL_CALC, CUMPL_BTK, CUMPL_EOM, CRUCE_SUB_ESTADO, CRUCE_ESTADO, ESTADO_DE_LINEA, ESTADO_CALCE_BTK, GUIA) IN ('Problema Carga Guía')   THEN 'CD o Sistemas'
                        ELSE
                          'Sin información'
                        END
                  END
                END
          END
        END
      END
  ELSE
    '-'
  END
  ) AS RESPONSABLE
  ,OBTENER_TIPO_CUMPLIMIENTO(CUMPL_CALC, CUMPL_BTK, CUMPL_EOM, CRUCE_SUB_ESTADO, CRUCE_ESTADO, ESTADO_DE_LINEA, ESTADO_CALCE_BTK, GUIA) AS TIPO_CUMPLIMIENTO

 
from VISTA_CUMPLIMIENTO;


  -- -----------------------------------------------------
-- Table VISTA_CARGAR_CUMPLIMIENTO LOCAL
-- -----------------------------------------------------


  CREATE OR REPLACE FORCE VIEW "TXD"."VISTA_CARGAR_CUMPLIMIENTO_L" ("LLAVE", "TC_PO_LINE_ID", "CUMPL_CALC", "CUMPL_EOM", "CUMPL_BTK", "FECHA_COMPROMISO_EOM", "FECHA_COMPROMISO_BTK", "ESTADO_CALCE_EOM", "SUBESTADO_CALCE_EOM", "FECHA_CALCE_EOM", "HORA_CALCE_EOM", "ESTADO_CALCE_BTK", "SUBESTADO_CALCE_BTK", "FECHA_CALCE_BTK", "HORA_CALCE_BTK", "CRUCE_ESTADO", "CRUCE_SUB_ESTADO", "N_SOLICITUD_CLIENTE", "N_ORDEN_DISTRIBU", "FECHA_CREACION_ORDEN", "EST_ORDEN", "ESTADO_DE_LINEA", "SKU", "CANT_DESC_SKU", "LOCAL_VENTA", "DEPART", "BODEGADESP", "RUTCLIENTE", "NOMBRECLIENTE", "APELLIDOCLIENTE", "DIRECCION_CLIENTE", "COD_COMUNA", "COMUNA", "CIUDAD", "REGION", "HORARIO", "TIPO_ORDEN", "TIPO_VENTA", "O_FACILITY_ALIAS_ID", "REGIONENTREGA", "TIPO_DE_ORDEN", "GUIA", "RUT_EMP", "DESC_EMP", "TIPOGUI", "CLIENTE_RETIRA", "FECHA_PRIMER_INTENTO", "NUMERO_INTENTOS", "FECHA_CREA_PKT", "HORA_CREA_PKT", "NRO_OLA", "FECHA_INICIO_OLA", "HORA_INICIO_OLA", "FECHA_TERMINO_OLA", "HORA_TERMINO_OLA", "FECHA_CIERRE_CARGA", "HORA_CIERRE_CARGA", "FECEMIGUI", "LEAD_TIME_TRANSPORTE", "DIA_SEMANA_ETA", "ENTREGA_DIA_COMPROMISO", "VENTA_EMPRESA", "CUMPLE", "CUMPLIMIENTO_2", "CUMPLE_RESUMEN", "BODEGA_DESPACHO", "DIF_ETA_CARGA", "FECHA_CARGA_REQUERIDA", "EVAL_SISTEMA", "EVAL_CD", "EVAL_1ER_INTENTO", "CUMPLIMIENTO_CLIENTE", "RESPONSABLE", "TIPO_CUMPLIMIENTO") AS 
  select
  NVL(LLAVE,'-') AS LLAVE
  ,TC_PO_LINE_ID
  ,CUMPL_CALC
  ,CUMPL_EOM
  ,CUMPL_BTK
  ,TO_CHAR(FECHA_COMPROMISO_EOM, 'YYYY-MM-DD HH24:MI:SS') AS FECHA_COMPROMISO_EOM
  ,FECHA_COMPROMISO_BTK
  ,ESTADO_CALCE_EOM
  ,SUBESTADO_CALCE_EOM
  ,FECHA_CALCE_EOM
  ,HORA_CALCE_EOM
  ,ESTADO_CALCE_BTK
  ,SUBESTADO_CALCE_BTK
  ,FECHA_CALCE_BTK
  ,HORA_CALCE_BTK
  ,CRUCE_ESTADO
  ,CRUCE_SUB_ESTADO
  ,N_SOLICITUD_CLIENTE
  ,N_ORDEN_DISTRIBU
  ,FECHA_CREACION_ORDEN
  ,EST_ORDEN
  ,ESTADO_DE_LINEA
  ,SKU
  ,CANT_DESC_SKU
  ,LOCAL_VENTA
  ,DEPART
  ,BODEGADESP
  ,RUTCLIENTE
  ,NOMBRECLIENTE
  ,APELLIDOCLIENTE
  ,DIRECCION_CLIENTE
  ,COD_COMUNA
  ,COMUNA
  ,CIUDAD
  ,REGION
  ,NVL(HORARIO,'-') AS HORARIO
  ,TIPO_ORDEN
  ,NVL(TIPO_VENTA,'-') AS TIPO_VENTA
  ,O_FACILITY_ALIAS_ID
  ,REGIONENTREGA
  ,NVL(TIPO_DE_ORDEN,'-') AS TIPO_DE_ORDEN
  ,GUIA
  ,RUT_EMP
  ,NVL(DESC_EMP,'-') AS DESC_EMP
  ,NVL(TIPOGUI,'-') AS TIPOGUI
  ,NVL(CLIENTE_RETIRA,'-') AS CLIENTE_RETIRA
  ,FECHA_PRIMER_INTENTO
  ,NUMERO_INTENTOS
  ,FECHA_CREA_PKT
  ,HORA_CREA_PKT
  ,NRO_OLA
  ,FECHA_INICIO_OLA
  ,HORA_INICIO_OLA
  ,FECHA_TERMINO_OLA
  ,HORA_TERMINO_OLA
  ,FECHA_CIERRE_CARGA
  ,HORA_CIERRE_CARGA
  ,FECEMIGUI
  ,LEAD_TIME_TRANSPORTE
  ,DIA_SEMANA_ETA
  ,ENTREGA_DIA_COMPROMISO
  ,NVL(VENTA_EMPRESA,'-') AS VENTA_EMPRESA
  
  ,OBTENER_CUMPLE(CUMPL_CALC, CUMPL_BTK, CUMPL_EOM, CRUCE_SUB_ESTADO, CRUCE_ESTADO, ESTADO_DE_LINEA, ESTADO_CALCE_BTK, GUIA) AS CUMPLE
  ,OBTENER_CUMPLIIENTO_2(CUMPL_CALC, CUMPL_BTK, CUMPL_EOM, CRUCE_SUB_ESTADO, CRUCE_ESTADO, ESTADO_DE_LINEA, ESTADO_CALCE_BTK, GUIA, EST_ORDEN) AS CUMPLIMIENTO_2
  ,OBTENER_CUMPLE_RESUMEN(CUMPL_CALC, CUMPL_BTK, CUMPL_EOM, CRUCE_SUB_ESTADO, CRUCE_ESTADO, ESTADO_DE_LINEA, ESTADO_CALCE_BTK, GUIA) AS CUMPLE_RESUMEN
  ,(
  CASE 
      WHEN O_FACILITY_ALIAS_ID = '200' OR O_FACILITY_ALIAS_ID = '012' OR O_FACILITY_ALIAS_ID = '12' OR TO_NUMBER(O_FACILITY_ALIAS_ID, '999') = 12 OR TO_NUMBER(O_FACILITY_ALIAS_ID, '999') = 200 THEN O_FACILITY_ALIAS_ID
  ELSE
      'Proveedor'
  END
  ) AS BODEGA_DESPACHO
  , NVL(TO_NUMBER( TO_DATE(FECHA_COMPROMISO_EOM, 'DD/MM/YY HH24:MI:SS')-TO_DATE(FECHA_CIERRE_CARGA, 'DD/MM/YY HH24:MI:SS')),45666) AS DIF_ETA_CARGA
  ,(
  CASE 
      --OBTIENE EL NUMERO DEL DIA DE LA SEMANA
      WHEN TO_NUMBER((TO_CHAR(TO_DATE(FECHA_COMPROMISO_EOM, 'DD/MM/YY HH24:MI:SS')-LEAD_TIME_TRANSPORTE,'D'))) = 7  THEN  TO_CHAR(TO_DATE(FECHA_COMPROMISO_EOM, 'DD/MM/YY HH24:MI:SS')-LEAD_TIME_TRANSPORTE,  'DD/MM/YY HH24:MI:SS')
  ELSE
      TO_CHAR( TO_DATE(FECHA_COMPROMISO_EOM, 'DD/MM/YY HH24:MI:SS')-LEAD_TIME_TRANSPORTE,  'DD/MM/YY HH24:MI:SS')
  END
  ) AS FECHA_CARGA_REQUERIDA
  ,(
  CASE WHEN 
            (
            CASE 
                WHEN 
                (
                CASE 
                    WHEN CUMPL_CALC ='' OR CUMPL_CALC IS NULL THEN 
                      CASE 
                               WHEN CUMPL_BTK = '' OR CUMPL_BTK IS NULL OR CUMPL_BTK = 'No Cumplimiento'  THEN 
                                  CASE 
                                    WHEN CUMPL_EOM = 'Sin Informacion'   THEN 
                                    
                                        CASE 
                                            WHEN CRUCE_SUB_ESTADO = '' OR CRUCE_SUB_ESTADO IS NULL   THEN 
                                                  CASE 
                                                    WHEN CRUCE_ESTADO = '' OR CRUCE_ESTADO IS NULL   THEN 
                                                          CASE 
                                                            WHEN ESTADO_DE_LINEA = 'Shipped'   THEN 
                                                                  CASE 
                                                                      WHEN ESTADO_CALCE_BTK = 'En Proceso de Carga'   THEN ESTADO_CALCE_BTK 
                                                                  ELSE
                                                                    CASE 
                                                                      WHEN GUIA = '' OR GUIA IS NULL   THEN 'Problema Carga Guía'  ELSE 'En Ruta o CT'
                                                                    
                                                                    END
                                                                  END
                                                          ELSE
                                                            'Preparación CD'
                                                          END
                                                  ELSE
                                                    CRUCE_ESTADO
                                                  END
                                        ELSE
                                          CRUCE_SUB_ESTADO
                                        END
                                  ELSE
                                    CUMPL_EOM
                                  END
                      
                      ELSE
                        CUMPL_BTK
                      END
                ELSE
                    CUMPL_CALC
                END
                )
                = 'Sin Informacion' 
                    THEN 'Sin Información ' || '(' || (CASE   WHEN ESTADO_DE_LINEA = '' OR ESTADO_DE_LINEA IS NULL  THEN EST_ORDEN ELSE ESTADO_DE_LINEA END) || ')'
            ELSE
              
                (
                CASE 
                    WHEN CUMPL_CALC ='' OR CUMPL_CALC IS NULL THEN 
                      CASE 
                               WHEN CUMPL_BTK = '' OR CUMPL_BTK IS NULL OR CUMPL_BTK = 'No Cumplimiento'  THEN 
                                  CASE 
                                    WHEN CUMPL_EOM = 'Sin Informacion'   THEN 
                                    
                                        CASE 
                                            WHEN CRUCE_SUB_ESTADO = '' OR CRUCE_SUB_ESTADO IS NULL   THEN 
                                                  CASE 
                                                    WHEN CRUCE_ESTADO = '' OR CRUCE_ESTADO IS NULL   THEN 
                                                          CASE 
                                                            WHEN ESTADO_DE_LINEA = 'Shipped'   THEN 
                                                                  CASE 
                                                                      WHEN ESTADO_CALCE_BTK = 'En Proceso de Carga'   THEN ESTADO_CALCE_BTK 
                                                                  ELSE
                                                                    CASE 
                                                                      WHEN GUIA = '' OR GUIA IS NULL   THEN 'Problema Carga Guía'  ELSE 'En Ruta o CT'
                                                                    
                                                                    END
                                                                  END
                                                          ELSE
                                                            'Preparación CD'
                                                          END
                                                  ELSE
                                                    CRUCE_ESTADO
                                                  END
                                        ELSE
                                          CRUCE_SUB_ESTADO
                                        END
                                  ELSE
                                    CUMPL_EOM
                                  END
                      
                      ELSE
                        CUMPL_BTK
                      END
                ELSE
                    CUMPL_CALC
                END
                )
            END
          )
          = 'Problema Carga Guía'  THEN 'No Cumple'
  ELSE
      CASE  WHEN TO_NUMBER(ENTREGA_DIA_COMPROMISO) = 1  THEN 'Cumple'
      ELSE
        CASE WHEN TO_NUMBER(ENTREGA_DIA_COMPROMISO) = 0  THEN 'No Cumple'
        ELSE
          'Faltan Datos'
        END
      END
  END
  ) AS EVAL_SISTEMA
  ,(
  CASE WHEN ( FECHA_CIERRE_CARGA = '' OR FECHA_CIERRE_CARGA IS NULL OR LEAD_TIME_TRANSPORTE = '' OR LEAD_TIME_TRANSPORTE IS NULL)  THEN 'Sin información'
  ELSE
      CASE  WHEN 
               
               (
                CASE 
                    WHEN TO_NUMBER((TO_CHAR(TO_DATE(FECHA_COMPROMISO_EOM, 'DD/MM/YY HH24:MI:SS')-LEAD_TIME_TRANSPORTE,'D'))) = 7  THEN  (TO_DATE(FECHA_COMPROMISO_EOM, 'DD/MM/YY HH24:MI:SS')-LEAD_TIME_TRANSPORTE)-1
                ELSE
                    TO_DATE(FECHA_COMPROMISO_EOM, 'DD/MM/YY HH24:MI:SS')-TO_NUMBER(LEAD_TIME_TRANSPORTE)
                END
                ) >=  TO_DATE(FECHA_CIERRE_CARGA, 'DD/MM/YY HH24:MI:SS')   THEN 'Cumple'
      ELSE
        'No Cumple'
      END
  END
  ) AS EVAL_CD
  ,(
  CASE WHEN FECHA_PRIMER_INTENTO = '' OR FECHA_PRIMER_INTENTO IS NULL   THEN 'No Cumple'
  ELSE
      CASE  WHEN TO_DATE(FECHA_PRIMER_INTENTO, 'DD/MM/YY HH24:MI:SS') <= TO_DATE(FECHA_COMPROMISO_EOM, 'DD/MM/YY HH24:MI:SS')  THEN 'Cumple'
      ELSE
        'No Cumple'
      END
  END
  ) AS EVAL_1er_INTENTO
  ,OBTENER_CUMPLIMIENTO_CLIENTE(CUMPL_CALC, CUMPL_BTK, CUMPL_EOM, CRUCE_SUB_ESTADO, CRUCE_ESTADO, ESTADO_DE_LINEA, ESTADO_CALCE_BTK, GUIA, FECHA_CALCE_EOM, FECHA_CALCE_BTK, FECHA_COMPROMISO_EOM, FECHA_COMPROMISO_BTK) AS CUMPLIMIENTO_CLIENTE
  ,(
  CASE 
    WHEN  NOT(OBTENER_CUMPLE_RESUMEN(CUMPL_CALC, CUMPL_BTK, CUMPL_EOM, CRUCE_SUB_ESTADO, CRUCE_ESTADO, ESTADO_DE_LINEA, ESTADO_CALCE_BTK, GUIA) = 'CUMPLIMIENTO')  THEN 
      CASE 
        WHEN  OBTENER_EVAL_SISTEMA(CUMPL_CALC, CUMPL_BTK, CUMPL_EOM, CRUCE_SUB_ESTADO, CRUCE_ESTADO, ESTADO_DE_LINEA, ESTADO_CALCE_BTK, GUIA, EST_ORDEN, ENTREGA_DIA_COMPROMISO) = 'No Cumple' THEN 'Sistemas'
      ELSE
        CASE 
          WHEN  OBTENER_EVOLUCION_CD_V(FECHA_CIERRE_CARGA, LEAD_TIME_TRANSPORTE, FECHA_COMPROMISO_EOM) = 'No Cumple' THEN 'CD'
        ELSE
          CASE 
            WHEN  OBTENER_PRIMER_INTENTO_V(FECHA_PRIMER_INTENTO, FECHA_COMPROMISO_EOM) = 'Cumple' THEN 
              CASE 
                WHEN  OBTENER_CUMPLE(CUMPL_CALC, CUMPL_BTK, CUMPL_EOM, CRUCE_SUB_ESTADO, CRUCE_ESTADO, ESTADO_DE_LINEA, ESTADO_CALCE_BTK, GUIA) IN ('Expectativa', 'Cliente No Está', 'Dirección Errónea', 'Motivos Cliente', 'NCredito', 'Nota de Crédito', 'RechaEXP')   THEN 'Cliente'
                WHEN  OBTENER_CUMPLE(CUMPL_CALC, CUMPL_BTK, CUMPL_EOM, CRUCE_SUB_ESTADO, CRUCE_ESTADO, ESTADO_DE_LINEA, ESTADO_CALCE_BTK, GUIA) IN ('Daño Producto')   THEN 'Proveedor, CD o Transporte'
                WHEN  OBTENER_CUMPLE(CUMPL_CALC, CUMPL_BTK, CUMPL_EOM, CRUCE_SUB_ESTADO, CRUCE_ESTADO, ESTADO_DE_LINEA, ESTADO_CALCE_BTK, GUIA) IN ('Sin Informacion')   THEN 'Falta Información'
                WHEN  OBTENER_CUMPLE(CUMPL_CALC, CUMPL_BTK, CUMPL_EOM, CRUCE_SUB_ESTADO, CRUCE_ESTADO, ESTADO_DE_LINEA, ESTADO_CALCE_BTK, GUIA) IN ('Producto No Corresponde')   THEN 'CD o Transporte'
                WHEN  OBTENER_CUMPLE(CUMPL_CALC, CUMPL_BTK, CUMPL_EOM, CRUCE_SUB_ESTADO, CRUCE_ESTADO, ESTADO_DE_LINEA, ESTADO_CALCE_BTK, GUIA) IN ('Motivo Transportes', 'En Ruta o CT')   THEN 'Transporte'
                WHEN  OBTENER_CUMPLE(CUMPL_CALC, CUMPL_BTK, CUMPL_EOM, CRUCE_SUB_ESTADO, CRUCE_ESTADO, ESTADO_DE_LINEA, ESTADO_CALCE_BTK, GUIA) IN ('Preparación CD', 'En Proceso de Carga')   THEN 'CD'
                WHEN  OBTENER_CUMPLE(CUMPL_CALC, CUMPL_BTK, CUMPL_EOM, CRUCE_SUB_ESTADO, CRUCE_ESTADO, ESTADO_DE_LINEA, ESTADO_CALCE_BTK, GUIA) IN ('Error Sistémico')   THEN 'Sistemas'
                WHEN  OBTENER_CUMPLE(CUMPL_CALC, CUMPL_BTK, CUMPL_EOM, CRUCE_SUB_ESTADO, CRUCE_ESTADO, ESTADO_DE_LINEA, ESTADO_CALCE_BTK, GUIA) IN ('Problema Carga Guía')   THEN 'CD o Sistemas'
              ELSE
                'Cliente'
              END
          ELSE
                CASE 
                  WHEN  ( OBTENER_CUMPLE_RESUMEN(CUMPL_CALC, CUMPL_BTK, CUMPL_EOM, CRUCE_SUB_ESTADO, CRUCE_ESTADO, ESTADO_DE_LINEA, ESTADO_CALCE_BTK, GUIA) = 'ATRASADO' AND 
                          OBTENER_EVOLUCION_CD_V(FECHA_CIERRE_CARGA, LEAD_TIME_TRANSPORTE, FECHA_COMPROMISO_EOM) = 'Cumple') AND (OBTENER_EVOLUCION_CD_V(FECHA_CIERRE_CARGA, LEAD_TIME_TRANSPORTE, FECHA_COMPROMISO_EOM) = 'Cumple' OR OBTENER_PRIMER_INTENTO_V(FECHA_PRIMER_INTENTO, FECHA_COMPROMISO_EOM) = 'No Cumple') THEN 'Transporte'
                ELSE 
                  CASE 
                    WHEN  (OBTENER_EVOLUCION_CD_V(FECHA_CIERRE_CARGA, LEAD_TIME_TRANSPORTE, FECHA_COMPROMISO_EOM) = '"Sin Información' AND OBTENER_PRIMER_INTENTO_V(FECHA_PRIMER_INTENTO, FECHA_COMPROMISO_EOM) = 'No Cumple') OR (OBTENER_CUMPLIMIENTO(CUMPL_CALC, CUMPL_BTK, CUMPL_EOM, CRUCE_SUB_ESTADO, CRUCE_ESTADO, ESTADO_DE_LINEA, ESTADO_CALCE_BTK, GUIA) = 'En Ruta o CT' OR OBTENER_CUMPLIMIENTO(CUMPL_CALC, CUMPL_BTK, CUMPL_EOM, CRUCE_SUB_ESTADO, CRUCE_ESTADO, ESTADO_DE_LINEA, ESTADO_CALCE_BTK, GUIA) = 'ATRASADO') THEN 'Sin Información'
                      ELSE 
                        CASE 
                          WHEN  OBTENER_CUMPLE(CUMPL_CALC, CUMPL_BTK, CUMPL_EOM, CRUCE_SUB_ESTADO, CRUCE_ESTADO, ESTADO_DE_LINEA, ESTADO_CALCE_BTK, GUIA) IN ('Expectativa', 'Cliente No Está', 'Dirección Errónea', 'Motivos Cliente', 'NCredito', 'Nota de Crédito', 'RechaEXP')   THEN 'Cliente'
                          WHEN  OBTENER_CUMPLE(CUMPL_CALC, CUMPL_BTK, CUMPL_EOM, CRUCE_SUB_ESTADO, CRUCE_ESTADO, ESTADO_DE_LINEA, ESTADO_CALCE_BTK, GUIA) IN ('Daño Producto')   THEN 'Proveedor, CD o Transporte'
                          WHEN  OBTENER_CUMPLE(CUMPL_CALC, CUMPL_BTK, CUMPL_EOM, CRUCE_SUB_ESTADO, CRUCE_ESTADO, ESTADO_DE_LINEA, ESTADO_CALCE_BTK, GUIA) IN ('Sin Informacion')   THEN 'Falta Información'
                          WHEN  OBTENER_CUMPLE(CUMPL_CALC, CUMPL_BTK, CUMPL_EOM, CRUCE_SUB_ESTADO, CRUCE_ESTADO, ESTADO_DE_LINEA, ESTADO_CALCE_BTK, GUIA) IN ('Producto No Corresponde')   THEN 'CD o Transporte'
                          WHEN  OBTENER_CUMPLE(CUMPL_CALC, CUMPL_BTK, CUMPL_EOM, CRUCE_SUB_ESTADO, CRUCE_ESTADO, ESTADO_DE_LINEA, ESTADO_CALCE_BTK, GUIA) IN ('Motivo Transportes', 'En Ruta o CT')   THEN 'Transporte'
                          WHEN  OBTENER_CUMPLE(CUMPL_CALC, CUMPL_BTK, CUMPL_EOM, CRUCE_SUB_ESTADO, CRUCE_ESTADO, ESTADO_DE_LINEA, ESTADO_CALCE_BTK, GUIA) IN ('Preparación CD', 'En Proceso de Carga')   THEN 'CD'
                          WHEN  OBTENER_CUMPLE(CUMPL_CALC, CUMPL_BTK, CUMPL_EOM, CRUCE_SUB_ESTADO, CRUCE_ESTADO, ESTADO_DE_LINEA, ESTADO_CALCE_BTK, GUIA) IN ('Error Sistémico')   THEN 'Sistemas'
                          WHEN  OBTENER_CUMPLE(CUMPL_CALC, CUMPL_BTK, CUMPL_EOM, CRUCE_SUB_ESTADO, CRUCE_ESTADO, ESTADO_DE_LINEA, ESTADO_CALCE_BTK, GUIA) IN ('Problema Carga Guía')   THEN 'CD o Sistemas'
                        ELSE
                          'Sin información'
                        END
                  END
                END
          END
        END
      END
  ELSE
    '-'
  END
  ) AS RESPONSABLE
  ,OBTENER_TIPO_CUMPLIMIENTO(CUMPL_CALC, CUMPL_BTK, CUMPL_EOM, CRUCE_SUB_ESTADO, CRUCE_ESTADO, ESTADO_DE_LINEA, ESTADO_CALCE_BTK, GUIA) AS TIPO_CUMPLIMIENTO

from vista_CUMPLIMIENTO where 1 = 1;



  
  