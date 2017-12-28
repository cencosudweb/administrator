create or replace PROCEDURE CREA_ANY_VISTA(X_NOMBRE IN VARCHAR2 ,X_CUERPO IN VARCHAR2) IS 

BEGIN 
EXECUTE IMMEDIATE 
'CREATE OR REPLACE VIEW '||X_NOMBRE||' AS '||X_CUERPO; 
END;


create or replace PROCEDURE PROCEDIMIENTOCRUCEHUBECOMM IS
TOTAL NUMBER;
BEGIN
 UPDATE KPI_WEB_HUB_PAGOS2
    SET FLAG_VALIDACION = 1
    WHERE TO_NUMBER(OC) IN (SELECT 
                                TO_NUMBER(P.OC)
                            FROM 
                                KPI_WEB_HUB_PAGOS2 P
                            WHERE 
                                NOT EXISTS(SELECT 1 FROM KPI_WEB_ECOMMERCE2 E WHERE E.NUMORDEN = TO_NUMBER(P.OC)));    
                                COMMIT;
END;