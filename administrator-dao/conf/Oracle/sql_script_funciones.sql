 -- --------------------------------------------------------------
-- FUNCION BUSCAR_RESPONSABLE SERVIDOR
-- --------------------------------------------------------------  
create or replace function BUSCAR_RESPONSABLE (CUMPL_CALC VARCHAR, CUMPL_BTK VARCHAR, CUMPL_EOM VARCHAR, CRUCE_SUB_ESTADO VARCHAR, CRUCE_ESTADO VARCHAR, ESTADO_DE_LINEA VARCHAR, ESTADO_CALCE_BTK VARCHAR, GUIA VARCHAR)
  return VARCHAR
 is
 RESULTADO					VARCHAR(200);
 begin 
   RESULTADO := 
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
                    = 'ATRASADO' THEN 'ATRASADO'
                ELSE
                    CASE   WHEN
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
                              = 'ADELANTADO'  OR
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
                                                = 'EN FECHA'  THEN 'CUMPLIMIENTO'
                      ELSE
                          CASE   WHEN 
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
                                      = 'Producto No Corresponde' 
                                      OR 
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
                                      = 'Preparación CD'
                                      OR 
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
                                      = 'Daño Producto' 
                                      OR 
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
                                      = 'Motivo Transportes' 
                                      OR 
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
                                      = 'En Proceso de Carga' 
                                      OR 
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
                                      = 'RechaEXP' 
                                      OR 
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
                                      = 'En Ruta o CT' 
                                      OR 
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
                                      = 'Error Sistémico'  THEN 'PROBLEMA PARIS'
                            ELSE
                              CASE   WHEN 
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
                                        = 'Motivos Cliente' 
                                        OR 
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
                                        = 'Expectativa' OR 
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
                                        = 'Cliente No Está' OR 
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
                                        = 'Dirección Errónea' OR 
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
                                        = 'NCporPlazo' OR 
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
                                        = 'Nota de Crédito'  THEN 'PROBLEMA CLIENTE'
                                ELSE
                                  'SIN INFORMACION'
                              END
                          END
                    END
                END
              );
   return RESULTADO;
 end;
 
 -- --------------------------------------------------------------
-- FUNCION OBTENER_CUMPLE SERVIDOR
-- --------------------------------------------------------------  
 create or replace function OBTENER_CUMPLE (CUMPL_CALC VARCHAR, CUMPL_BTK VARCHAR, CUMPL_EOM VARCHAR, CRUCE_SUB_ESTADO VARCHAR, CRUCE_ESTADO VARCHAR, ESTADO_DE_LINEA VARCHAR, ESTADO_CALCE_BTK VARCHAR, GUIA VARCHAR)
  return VARCHAR
 is
 RESULTADO					VARCHAR(200);
 begin 
   RESULTADO := 
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
                      = 'ADELANTADO' THEN '1.- CUMPLE'
                ELSE
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
                        = 'EN FECHA'  THEN '1.- CUMPLE'
                      ELSE
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
                            = 'ATRASADO'  THEN '2.- ATRASADO'
                            ELSE
                              '3.- NO CUMPLE'
                          END
                    END
                END
              ) ;
   return RESULTADO;
 end;
 -- --------------------------------------------------------------
-- FUNCION OBTENER_CUMPLE_RESUMEN
-- --------------------------------------------------------------  
 create or replace function OBTENER_CUMPLE_RESUMEN (CUMPL_CALC VARCHAR, CUMPL_BTK VARCHAR, CUMPL_EOM VARCHAR, CRUCE_SUB_ESTADO VARCHAR, CRUCE_ESTADO VARCHAR, ESTADO_DE_LINEA VARCHAR, ESTADO_CALCE_BTK VARCHAR, GUIA VARCHAR)
  return VARCHAR
 is
 RESULTADO					VARCHAR(200);
 begin 
   RESULTADO := 
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
                    = 'ATRASADO' THEN 'ATRASADO'
                ELSE
                    CASE   WHEN
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
                              = 'ADELANTADO'  OR
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
                                                = 'EN FECHA'  THEN 'CUMPLIMIENTO'
                      ELSE
                          CASE   WHEN 
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
                                      = 'Producto No Corresponde' 
                                      OR 
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
                                      = 'Preparación CD'
                                      
                                      OR 
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
                                      = 'Daño Producto' 
                                      OR 
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
                                      = 'Motivo Transportes' 
                                      OR 
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
                                      = 'En Proceso de Carga' 
                                      OR 
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
                                      = 'RechaEXP' 
                                      OR 
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
                                      = 'En Ruta o CT' 
                                      OR 
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
                                      = 'Error Sistémico'  THEN 'PROBLEMA PARIS'
                            ELSE
                              CASE   WHEN 
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
                                        = 'Motivos Cliente' 
                                        OR 
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
                                        = 'Expectativa' OR 
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
                                        = 'Cliente No Está' OR 
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
                                        = 'Dirección Errónea' OR 
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
                                        = 'NCporPlazo' OR 
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
                                        = 'Nota de Crédito'  THEN 'PROBLEMA CLIENTE'
                                ELSE
                                  'SIN INFORMACION'
                              END
                          END
                    END
                END
              ) ;
   return RESULTADO;
 end;
 -- --------------------------------------------------------------
-- FUNCION OBTENER_CUMPLIMIENTO
-- --------------------------------------------------------------  
 create or replace function OBTENER_CUMPLIMIENTO (CUMPL_CALC VARCHAR, CUMPL_BTK VARCHAR, CUMPL_EOM VARCHAR, CRUCE_SUB_ESTADO VARCHAR, CRUCE_ESTADO VARCHAR, ESTADO_DE_LINEA VARCHAR, ESTADO_CALCE_BTK VARCHAR, GUIA VARCHAR)
  return VARCHAR
 is
 RESULTADO					VARCHAR(200);
 begin 
   RESULTADO := 
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
              ) ;
   return RESULTADO;
 end;
 --
 --
 create or replace function OBTENER_CUMPLIMIENTO_CLIENTE (CUMPL_CALC VARCHAR, CUMPL_BTK VARCHAR, CUMPL_EOM VARCHAR, CRUCE_SUB_ESTADO VARCHAR, CRUCE_ESTADO VARCHAR, ESTADO_DE_LINEA VARCHAR, ESTADO_CALCE_BTK VARCHAR, GUIA VARCHAR, FECHA_CALCE_EOM VARCHAR, FECHA_CALCE_BTK VARCHAR, FECHA_COMPROMISO_EOM VARCHAR, FECHA_COMPROMISO_BTK VARCHAR)
  return VARCHAR
 is
 RESULTADO					VARCHAR(200);
 begin 
   RESULTADO := 
                (
                CASE WHEN ( (
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
                            = 'ADELANTADO' OR 
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
                            = 'ATRASADO' OR 
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
                            = 'EN FECHA') AND 
                            ( TO_NUMBER((TO_CHAR(TO_DATE(FECHA_CALCE_EOM, 'YYYY-MM-DD HH24:MI:SS'),'D')))>0 AND TO_NUMBER((TO_CHAR(TO_DATE(FECHA_CALCE_BTK, 'YYYY-MM-DD HH24:MI:SS'),'D')))>0 AND NOT(TO_DATE(FECHA_CALCE_EOM, 'YYYY-MM-DD HH24:MI:SS') = TO_DATE(FECHA_CALCE_BTK, 'YYYY-MM-DD HH24:MI:SS') )) OR
                            ( TO_NUMBER((TO_CHAR(TO_DATE(FECHA_COMPROMISO_EOM, 'YYYY-MM-DD HH24:MI:SS'),'D')))>0 AND TO_NUMBER((TO_CHAR(TO_DATE(FECHA_COMPROMISO_BTK, 'YYYY-MM-DD HH24:MI:SS'),'D')))>0 AND NOT(TO_DATE(FECHA_COMPROMISO_EOM, 'YYYY-MM-DD HH24:MI:SS') = TO_DATE(FECHA_COMPROMISO_BTK, 'YYYY-MM-DD HH24:MI:SS') ))
                            
                          )  THEN 'Fecha EOM y Beetrack distintas'
                ELSE
                  '-'
                END
              ) ;
   return RESULTADO;
 end;
 -- --------------------------------------------------------------
-- FUNCION OBTENER_EVAL_SISTEMA
-- --------------------------------------------------------------
 create or replace function OBTENER_EVAL_SISTEMA (CUMPL_CALC VARCHAR, CUMPL_BTK VARCHAR, CUMPL_EOM VARCHAR, CRUCE_SUB_ESTADO VARCHAR, CRUCE_ESTADO VARCHAR, ESTADO_DE_LINEA VARCHAR, ESTADO_CALCE_BTK VARCHAR, GUIA VARCHAR, EST_ORDEN VARCHAR, ENTREGA_DIA_COMPROMISO VARCHAR)
  return VARCHAR
 is
 RESULTADO					VARCHAR(200);
 begin 
   RESULTADO := 
                (
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
      CASE  WHEN ENTREGA_DIA_COMPROMISO = 1  THEN 'Cumple' --1
      ELSE
        CASE WHEN ENTREGA_DIA_COMPROMISO = 0  THEN 'No Cumple' -- 0
        ELSE
          'Faltan Datos'
        END
      END
  END
);
   return RESULTADO;
 end;
 -- --------------------------------------------------------------
-- FUNCION OBTENER_EVOLUCION_CD
-- --------------------------------------------------------------
 create or replace function OBTENER_EVOLUCION_CD (FECHA_CIERRE_CARGA VARCHAR, LEAD_TIME_TRANSPORTE VARCHAR, FECHA_COMPROMISO_EOM VARCHAR)
  return VARCHAR
 is
 RESULTADO					VARCHAR(200);
 begin 
   RESULTADO := 
                (
  CASE WHEN ( FECHA_CIERRE_CARGA = '' OR FECHA_CIERRE_CARGA IS NULL OR LEAD_TIME_TRANSPORTE = '' OR LEAD_TIME_TRANSPORTE IS NULL)  THEN 'Sin información'
  ELSE
      CASE  WHEN 
               (
                CASE 
                    --WHEN TO_NUMBER((TO_CHAR(TO_DATE(FECHA_COMPROMISO_EOM, 'DD-MON-YY')-LEAD_TIME_TRANSPORTE,'D'))) = 7  THEN  (TO_DATE(FECHA_COMPROMISO_EOM, 'DD-MON-YY')-LEAD_TIME_TRANSPORTE)-1
                    WHEN ( TO_NUMBER((TO_CHAR(TO_DATE(FECHA_COMPROMISO_EOM, 'DD-MON-YY')-LEAD_TIME_TRANSPORTE,'D'))) -1) = 0  THEN  (TO_DATE(FECHA_COMPROMISO_EOM, 'DD-MON-YY')-LEAD_TIME_TRANSPORTE)-1
                ELSE
                    TO_DATE(FECHA_COMPROMISO_EOM, 'DD-MON-YY')-TO_NUMBER(LEAD_TIME_TRANSPORTE)
                END
                )
                >=  TO_DATE(FECHA_CIERRE_CARGA, 'DD-MON-YY')   THEN 'Cumple'
      ELSE
        'No Cumple'
      END
  END
  ) ;
   return RESULTADO;
 end;
 --
 --
 create or replace function OBTENER_PRIMER_INTENTO (FECHA_PRIMER_INTENTO VARCHAR, FECHA_COMPROMISO_EOM VARCHAR)
  return VARCHAR
 is
 RESULTADO					VARCHAR(200);
 begin 
   RESULTADO := 
                (
                CASE WHEN FECHA_PRIMER_INTENTO = '' OR FECHA_PRIMER_INTENTO IS NULL   THEN 'No Cumple'
                ELSE
                    CASE  WHEN TO_DATE(FECHA_PRIMER_INTENTO, 'DD-MON-YY') <= TO_DATE(FECHA_COMPROMISO_EOM, 'DD-MON-YY')  THEN 'Cumple'
                    ELSE
                      'No Cumple'
                    END
                END
              ) ;
   return RESULTADO;
 end;
 -- --------------------------------------------------------------
-- FUNCION OBTENER_RESPONSABLES
-- --------------------------------------------------------------
 create or replace function OBTENER_RESPONSABLES (CUMPL_CALC VARCHAR, CUMPL_BTK VARCHAR, CUMPL_EOM VARCHAR, CRUCE_SUB_ESTADO VARCHAR, CRUCE_ESTADO VARCHAR, ESTADO_DE_LINEA VARCHAR, ESTADO_CALCE_BTK VARCHAR, GUIA VARCHAR)
  return VARCHAR
 is
 RESULTADO					VARCHAR(200);
 begin 
   RESULTADO := 
                

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
                                           
              ) ;
   return RESULTADO;
 end;
 -- --------------------------------------------------------------
-- FUNCION OBTENER_TIPO_CUMPLIMIENTO
-- --------------------------------------------------------------
 create or replace function OBTENER_TIPO_CUMPLIMIENTO (CUMPL_CALC VARCHAR, CUMPL_BTK VARCHAR, CUMPL_EOM VARCHAR, CRUCE_SUB_ESTADO VARCHAR, CRUCE_ESTADO VARCHAR, ESTADO_DE_LINEA VARCHAR, ESTADO_CALCE_BTK VARCHAR, GUIA VARCHAR)
  return VARCHAR
 is
 RESULTADO					VARCHAR(200);
 begin 
   RESULTADO := 
                (
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
                              = 'ADELANTADO' THEN '1.- CUMPLE'
                        ELSE
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
                                = 'EN FECHA'  THEN '1.- CUMPLE'
                              ELSE
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
                                    = 'ATRASADO'  THEN '2.- ATRASADO'
                                    ELSE
                                      '3.- NO CUMPLE'
                                  END
                            END
                        END
                      )  
                        = '1.- CUMPLE'  THEN 'CUMPLIMIENTO'
                ELSE
                  'INCUMPLIMIENTO'
                END
              ) ;
   return RESULTADO;
 end;

 
 
 