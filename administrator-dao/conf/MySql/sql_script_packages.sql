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