
-- -----------------------------------------------------
-- Table times_limit
-- -----------------------------------------------------


DROP TABLE times_limit;

CREATE  TABLE  times_limit (
  id SERIAL NOT NULL, -- id SERIAL NOT NULL, 
  description  VARCHAR(45) NOT NULL,
  time_limit_month INT NOT NULL ,
 CONSTRAINT times_limit_PK PRIMARY KEY( id )) ;
 
 
 -- -----------------------------------------------------
-- Table `billings_admin`.`agreement`
-- -----------------------------------------------------
select * from agreement;

CREATE  TABLE  agreement (
  id SERIAL NOT NULL,
  numero_convenio VARCHAR(10) NOT NULL ,
  status INT NOT NULL,
  fecha_inicio INT NULL DEFAULT NULL ,
  fecha_fin INT NULL DEFAULT NULL ,
  id_time_limit INT NULL DEFAULT NULL ,
  commerce_id INT NULL DEFAULT NULL ,
  PRIMARY KEY (id) ,
  CONSTRAINT fk_id_time_limit FOREIGN KEY (id_time_limit)
      REFERENCES times_limit (id) 
 
 ) ;
 
 
 
 -- -----------------------------------------------------
-- Table `postgres`.`authorities`
-- -----------------------------------------------------
CREATE  TABLE  authorities (
  id SERIAL NOT NULL,
  authority  VARCHAR(45) NOT NULL,
  description  VARCHAR(45) NOT NULL,
PRIMARY KEY( id )) ;


-- -----------------------------------------------------
-- Table `postgres`.`economic_activity`
-- -----------------------------------------------------
CREATE  TABLE  economic_activity (
  id SERIAL NOT NULL,
  nombre  VARCHAR(300) NOT NULL,
PRIMARY KEY( id )) ;


-- -----------------------------------------------------
-- Table `postgres`.`commerce`
-- -----------------------------------------------------

CREATE  TABLE  commerce (
  id SERIAL NOT NULL,
  rut VARCHAR(12) NOT NULL ,
  razon_social VARCHAR(45) NOT NULL ,
  mnemotecnico VARCHAR(5) NOT NULL ,
  fecha_activacion INT NOT NULL ,
  id_actividad_economica INT NOT NULL ,
  status INT NOT NULL ,
  PRIMARY KEY (id) ,
  CONSTRAINT fk_economic_activity FOREIGN KEY (id_actividad_economica)
      REFERENCES economic_activity (id) 
  ) ;

  
  -- -----------------------------------------------------
-- Table financial_institution
-- -----------------------------------------------------
 CREATE  TABLE  financial_institution (
  id SERIAL NOT NULL,
  rut  VARCHAR(12) NOT NULL ,
  razon_social VARCHAR(45) NOT NULL ,
  mnemotecnico VARCHAR(5) NOT NULL ,
  fecha_activacion INT NOT NULL,
  status INT NOT NULL,
  invocation_path VARCHAR(500) NOT NULL ,
PRIMARY KEY( id )) ;

CREATE UNIQUE INDEX rutFI_UNIQUE ON financial_institution (rut);

 
SELECT * FROM commerce_agreement_fi;
-- -----------------------------------------------------
-- Table `billings_admin`.`commerce_agreement_fi`
-- -----------------------------------------------------

-- select * from commerce_agreement_fi;
CREATE  TABLE  commerce_agreement_fi (
  financial_institution_id INT NOT NULL,
  commerce_id INT NOT NULL,
  agreement_id INT NOT NULL,
  
  PRIMARY KEY (financial_institution_id, commerce_id, agreement_id),
  CONSTRAINT fk_c_a_if_commerce FOREIGN KEY (commerce_id)
      REFERENCES commerce (id), 
  CONSTRAINT fk_c_a_if_f_institution1 FOREIGN KEY (financial_institution_id)
  	REFERENCES financial_institution (id),
  CONSTRAINT fk_c_a_if_agreement1X FOREIGN KEY (agreement_id)
  REFERENCES agreement (id)
 ) ;
 
 
  -- -----------------------------------------------------
-- Table `payments_admin`.`questions`
-- -----------------------------------------------------
CREATE  TABLE  questions (
  id SERIAL NOT NULL,
  question  VARCHAR(300) NOT NULL,
PRIMARY KEY( id )) ;

-- -----------------------------------------------------
-- Table `payments_admin`.`questions_answers`
-- -----------------------------------------------------
CREATE  TABLE  questions_answers (
  id SERIAL NOT NULL,
  question  VARCHAR(300) NOT NULL,
  answer  VARCHAR(300) NOT NULL,
PRIMARY KEY( id )) ;


-- -----------------------------------------------------
-- Table `payments_admin`.`questions_answers`
-- -----------------------------------------------------
CREATE  TABLE  channels (
  id SERIAL NOT NULL,
  description  VARCHAR(300) NOT NULL,
PRIMARY KEY( id )) ;


-- -----------------------------------------------------
-- Table `payments_admin`.`urls_callback`
-- -----------------------------------------------------
select * from urls_callback;
DROP TABLE urls_callback;

CREATE  TABLE  urls_callback (
  id SERIAL NOT NULL,
  id_agreement INT NOT NULL ,
  end_path  VARCHAR(500) NOT NULL,
  confirmation_path  VARCHAR(500) NOT NULL,
  id_channel INT NOT NULL ,
  confirmation_method  VARCHAR(15) NOT NULL,
  confirmation_output  VARCHAR(15) NOT NULL,
  PRIMARY KEY( id ),
  CONSTRAINT fk_agreement FOREIGN KEY (id_agreement)
    REFERENCES agreement (id),
  CONSTRAINT fk_channel FOREIGN KEY (id_channel )
     REFERENCES channels (id)  
 
 ) ;
 
 
 
 - CREATE UNIQUE INDEX fk_channel_idx ON urls_callback (id_channel);

-- -----------------------------------------------------
-- Table users
-- -----------------------------------------------------

CREATE  TABLE  users (
  id SERIAL NOT NULL,
  username  VARCHAR(10) NOT NULL,
  password  VARCHAR(50) NOT NULL,
  name  VARCHAR(300) NOT NULL,
  rut  VARCHAR(11) NOT NULL,
  email  VARCHAR(45) NOT NULL,
  phone  VARCHAR(15) NOT NULL, 
  status INT NOT NULL ,
  attempts INT NOT NULL ,
  password_expire INT NOT NULL ,
 CONSTRAINT fk_agreement PRIMARY KEY( id )) ;

 
-- CREATE UNIQUE INDEX username_UNIQUE ON users (username);
-- CREATE UNIQUE INDEX email_UNIQUE ON users (email);
 
 
 
 -- -----------------------------------------------------
-- Table users_authorities
-- -----------------------------------------------------
 CREATE  TABLE  users_authorities (
  id_user INT NOT NULL,
  id_authorities INT NOT NULL,
   PRIMARY KEY( id_user, id_authorities ),
   
   CONSTRAINT fk_user_ua
    FOREIGN KEY (id_user )
    REFERENCES users (id ),
    CONSTRAINT fk_authorities_ua
    FOREIGN KEY (id_authorities )
    REFERENCES authorities (id )
    
) ;
select * from CUMPLIMIENTO_KPIWEB;
delete from users_authorities where id_user= 1 and id_authorities = 4


select * from users_commerce;
delete from users_authorities where id_user= 1 and id_authorities = 4


select * from users_financial_institution;
delete from users_authorities where id_user= 1 and id_authorities = 4

-- -----------------------------------------------------
-- Table users_commerce
-- -----------------------------------------------------

CREATE  TABLE  users_commerce (
  id INT NOT NULL,
  id_user INT NOT NULL,
  id_commerce INT NOT NULL,
  PRIMARY KEY( id ),
   
   CONSTRAINT fk_user_c
    FOREIGN KEY (id_user )
    REFERENCES users (id ),
    CONSTRAINT fk_commerce_c
    FOREIGN KEY (id_commerce )
    REFERENCES commerce (id )
    
) ;
 



 -- -----------------------------------------------------
-- Table users_financial_institution
-- -----------------------------------------------------

CREATE  TABLE  users_financial_institution (
  id SERIAL NOT NULL,
  id_user INT NOT NULL,
  id_financial_institution INT NOT NULL,
  PRIMARY KEY( id ),
   
   CONSTRAINT fk_user_if
    FOREIGN KEY (id_user )
    REFERENCES users (id ),
    CONSTRAINT fk_financial_if
    FOREIGN KEY (id_financial_institution )
    REFERENCES financial_institution (id )
    
) ;



 -- -----------------------------------------------------
-- Table users_questions_answers
-- -----------------------------------------------------

CREATE  TABLE  users_questions_answers (
  id_user INT NOT NULL,
  id_question_answer INT NOT NULL,
   
   CONSTRAINT fk_user_uqax
    FOREIGN KEY (id_user )
    REFERENCES users (id ),
    CONSTRAINT fk_question_uqax
    FOREIGN KEY (id_question_answer )
    REFERENCES questions_answers (id )
    
) ;


CREATE  TABLE  system_log (
  id SERIAL NOT NULL,
  iduser INT NOT NULL,
  loglevel INT NOT NULL,
  action VARCHAR(255)  NOT NULL,
  description VARCHAR(255)  NOT NULL,
  data VARCHAR(255), -- data BLOB,
  tablename VARCHAR(255) NOT NULL,
  pagename VARCHAR(255) NOT NULL,
  ipaddress VARCHAR(255) NOT NULL,
  creationdate TIMESTAMP with time zone NOT NULL,
  agent int NOT NULL,
  PRIMARY KEY( id )
  ) ;

  
  
 
 -- -----------------------------------------------------
-- Table CLIENTE_RETIRA
-- -----------------------------------------------------
CREATE  TABLE  CLIENTE_RETIRA (

id SERIAL NOT NULL,
DESCRIPTION VARCHAR(255), 
PRIMARY KEY (id) 
);

 


-- -----------------------------------------------------
-- Table ESTADO_CUMPLE_RESUMEN
-- -----------------------------------------------------
CREATE  TABLE  ESTADO_CUMPLE_RESUMEN (

id SERIAL NOT NULL,
DESCRIPTION VARCHAR(255), 
PRIMARY KEY (id) 
);




-- -----------------------------------------------------
-- Table ESTADO_CUMPLIMIENTO
-- -----------------------------------------------------
CREATE  TABLE  ESTADO_CUMPLIMIENTO (

id SERIAL NOT NULL,
DESCRIPTION VARCHAR(255), 
PRIMARY KEY (id) 
);




-- -----------------------------------------------------
-- Table ESTADO_RESPONSABLE
-- -----------------------------------------------------

CREATE  TABLE  ESTADO_RESPONSABLE (

id SERIAL,
DESCRIPTION VARCHAR(255), 
PRIMARY KEY (id) 
);



-- -----------------------------------------------------
-- Table HORARIO
-- -----------------------------------------------------
CREATE  TABLE  HORARIO (

id SERIAL,
DESCRIPTION VARCHAR(255), 
PRIMARY KEY (id) 
);


-- -----------------------------------------------------
-- Table DESCRIPCION_EMPRESA
-- -----------------------------------------------------
CREATE  TABLE  DESCRIPCION_EMPRESA (

id serial NOT NULL,
DESCRIPTION VARCHAR(255), 
PRIMARY KEY (id) 
);
 

select * from HORARIO_VTAV_ACT_STOCK;
-- -----------------------------------------------------
-- Table HORARIO_VTAV_ACT_STOCK
-- -----------------------------------------------------
CREATE  TABLE  HORARIO_VTAV_ACT_STOCK (

id serial NOT NULL,
FECHA VARCHAR(255), 
ESTADO VARCHAR(255), 
PRIMARY KEY (id) 
);




-- -----------------------------------------------------
-- Table TIPO_ESTADO_OC_VTAV
-- -----------------------------------------------------
CREATE  TABLE  TIPO_ESTADO_OC_VTAV_STOCK (

id serial NOT NULL,
DESCRIPTION VARCHAR(255), 
PRIMARY KEY (id) 
);



-- -----------------------------------------------------
-- Table TIPO_GUIA
-- -----------------------------------------------------
CREATE  TABLE  TIPO_GUIA (

id serial NOT NULL,
DESCRIPTION VARCHAR(255), 
PRIMARY KEY (id) 
);
CREATE  INDEX FK_TIPO_GUIA ON TIPO_GUIA(DESCRIPTION ASC); 


-- -----------------------------------------------------
-- Table TIPO_ORDEN
-- -----------------------------------------------------
CREATE  TABLE  TIPO_ORDEN (

id serial NOT NULL,
DESCRIPTION VARCHAR(255), 
PRIMARY KEY (id) 
);



-- -----------------------------------------------------
-- Table TIPO_VENTA
-- -----------------------------------------------------
CREATE  TABLE  TIPO_VENTA (

id serial NOT NULL,
DESCRIPTION VARCHAR(255), 
PRIMARY KEY (id) 
);


-- -----------------------------------------------------
-- Table VENTA_EMPRESA
-- -----------------------------------------------------
CREATE  TABLE  VENTA_EMPRESA (

id serial NOT NULL,
DESCRIPTION VARCHAR(255), 
PRIMARY KEY (id) 
);

-- -----------------------------------------------------
-- Table CUADRATURA_OC_VTAV_COMPARATIVO
-- -----------------------------------------------------
  CREATE TABLE CUADRATURA_OC_VTAV_COMP 
   (
   ID SERIAL NOT NULL, 
	RELNUM numeric(126), 
	POMUMB numeric(126), 
	INUMBR numeric(126), 
	RELBL5 INT, 
	CANTIDAD_COMP1 INT, 
	CANTIDAD_COMP2 INT, 
	FECHA_INGRESO VARCHAR(255), 
	 PRIMARY KEY (ID)
	 )

CREATE  INDEX FK_VENTA_EMPRESA ON VENTA_EMPRESA(DESCRIPTION ASC); 

select * from CUMPLIMIENTO_ESTATICO_WS;

-- -----------------------------------------------------
-- Table CUMPLIMIENTO_KPIWEB_WS
-- -----------------------------------------------------
CREATE  TABLE  CUMPLIMIENTO_ESTATICO_WS (
  id SERIAL NOT NULL,
  
  description_cumple VARCHAR(300) NOT NULL,
  cantidad_cumple INT NOT NULL,
  porcentaje_cumple numeric(126) NOT NULL,
  
  description_atrasado VARCHAR(300) NOT NULL,
  cantidad_atrasado INT NOT NULL,
  porcentaje_atrasado numeric(126) NOT NULL,
  
  description_no_cumple VARCHAR(300) NOT NULL,
  cantidad_no_cumple INT NOT NULL,
  porcentaje_no_cumple numeric(126) NOT NULL,

  cantidad_total INT NOT NULL,
  
  porcentaje_total numeric(126) NOT NULL,

  FECHA_COMPROMISO_EOM VARCHAR(300) NOT NULL,
  
  PRIMARY KEY (id) 
);





  CREATE TABLE CUMPLIMIENTO (	
	ID SERIAL NOT NULL, 
	LLAVE VARCHAR(255 ), 
	TC_PO_LINE_ID VARCHAR(255), 
	CUMPL_CALC VARCHAR(255), 
	CUMPL_EOM VARCHAR(255), 
	CUMPL_BTK VARCHAR(255), 
	FECHA_COMPROMISO_EOM VARCHAR(255), 
	FECHA_COMPROMISO_BTK VARCHAR(255), 
	ESTADO_CALCE_EOM VARCHAR(255), 
	SUBESTADO_CALCE_EOM VARCHAR(255), 
	FECHA_CALCE_EOM VARCHAR(255), 
	HORA_CALCE_EOM VARCHAR(255), 
	ESTADO_CALCE_BTK VARCHAR(255 ), 
	SUBESTADO_CALCE_BTK VARCHAR(255), 
	FECHA_CALCE_BTK VARCHAR(255), 
	HORA_CALCE_BTK VARCHAR(255), 
	CRUCE_ESTADO VARCHAR(255), 
	CRUCE_SUB_ESTADO VARCHAR(255), 
	N_SOLICITUD_CLIENTE VARCHAR(255), 
	N_ORDEN_DISTRIBU VARCHAR(255), 
	FECHA_CREACION_ORDEN VARCHAR(255), 
	EST_ORDEN VARCHAR(255), 
	ESTADO_DE_LINEA VARCHAR(255), 
	SKU VARCHAR(255), 
	CANT_DESC_SKU VARCHAR(255), 
	LOCAL_VENTA VARCHAR(255), 
	DEPART VARCHAR(255), 
	BODEGADESP VARCHAR(255 ), 
	RUTCLIENTE VARCHAR(255), 
	NOMBRECLIENTE VARCHAR(255), 
	APELLIDOCLIENTE VARCHAR(255), 
	DIRECCION_CLIENTE VARCHAR(255), 
	COD_COMUNA VARCHAR(255), 
	COMUNA VARCHAR(255), 
	CIUDAD VARCHAR(255), 
	REGION VARCHAR(255), 
	HORARIO VARCHAR(255), 
	TIPO_ORDEN VARCHAR(255), 
	TIPO_VENTA VARCHAR(255), 
	O_FACILITY_ALIAS_ID VARCHAR(255), 
	REGIONENTREGA VARCHAR(255), 
	TIPO_DE_ORDEN VARCHAR(255), 
	GUIA VARCHAR(255), 
	RUT_EMP VARCHAR(255), 
	DESC_EMP VARCHAR(255), 
	TIPOGUI VARCHAR(255), 
	CLIENTE_RETIRA VARCHAR(255), 
	FECHA_PRIMER_INTENTO VARCHAR(255), 
	NUMERO_INTENTOS VARCHAR(255), 
	FECHA_CREA_PKT VARCHAR(255), 
	HORA_CREA_PKT VARCHAR(255), 
	NRO_OLA VARCHAR(255), 
	FECHA_INICIO_OLA VARCHAR(255 ), 
	HORA_INICIO_OLA VARCHAR(255), 
	FECHA_TERMINO_OLA VARCHAR(255), 
	HORA_TERMINO_OLA VARCHAR(255), 
	FECHA_CIERRE_CARGA VARCHAR(255), 
	HORA_CIERRE_CARGA VARCHAR(255), 
	FECEMIGUI VARCHAR(255), 
	LEAD_TIME_TRANSPORTE VARCHAR(255), 
	DIA_SEMANA_ETA VARCHAR(255), 
	ENTREGA_DIA_COMPROMISO VARCHAR(255), 
	VENTA_EMPRESA VARCHAR(255), 
	CUMPLE VARCHAR(255 ), 
	CUMPLIMIENTO_2 VARCHAR(255), 
	CUMPLE_RESUMEN VARCHAR(255), 
	BODEGA_DESPACHO VARCHAR(255), 
	DIF_ETA_CARGA VARCHAR(255), 
	FECHA_CARGA_REQUERIDA VARCHAR(255), 
	EVAL_SISTEMA VARCHAR(255), 
	EVAL_CD VARCHAR(255), 
	EVAL_1ER_INTENTO VARCHAR(255), 
	CUMPLIMIENTO_CLIENTE VARCHAR(255), 
	RESPONSABLE VARCHAR(255), 
	TIPO_CUMPLIMIENTO VARCHAR(255), 
	FECHA_INGRESO DATE, 
	PRIMARY KEY (ID) 
	);		
	
	
	
	
	
-- -----------------------------------------------------
-- Table CUMPLIMIENTO_KPIWEB
-- -----------------------------------------------------

  CREATE TABLE CUMPLIMIENTO_KPIWEB 
   (

	ID SERIAL NOT NULL, 
	ID_CUMPLE INT NOT NULL, 
	ID_CUMPLE_RESUMEN INT NOT NULL, 
	ID_CUMPLIMIENTO_2 INT NOT NULL, 
	ID_RESPONSABLE INT NOT NULL, 
	ID_TIPO_ORDEN INT NOT NULL, 
	ID_TIPO_VENTA INT NOT NULL, 
	ID_CLIENTE_RETIRA INT NOT NULL, 
	ID_DESC_EMP INT NOT NULL, 
	ID_TIPOGUI INT NOT NULL, 
	ID_HORARIO INT NOT NULL, 
	ID_VENTA_EMPRESA INT NOT NULL, 
	FECHA_COMPROMISO_EOM VARCHAR(10), 
	PRIMARY KEY (ID)
	 
	 );
	 
	 
	 
	 
-- -----------------------------------------------------
-- Table CUMPLIMIENTO_KPIWEB
-- -----------------------------------------------------

  CREATE TABLE CUMPLIMIENTO_KPIWEB_ESTATICO 
   (

	ID SERIAL NOT NULL, 
	ID_CUMPLE INT NOT NULL , 
	ID_CUMPLE_RESUMEN INT NOT NULL , 
	ID_CUMPLIMIENTO_2 INT NOT NULL , 
	ID_RESPONSABLE INT NOT NULL , 
	ID_TIPO_ORDEN INT NOT NULL , 
	ID_TIPO_VENTA INT NOT NULL , 
	ID_CLIENTE_RETIRA INT NOT NULL , 
	ID_DESC_EMP INT NOT NULL , 
	ID_TIPOGUI INT NOT NULL ,
	ID_HORARIO INT NOT NULL , 
	ID_VENTA_EMPRESA INT NOT NULL , 
	FECHA_COMPROMISO_EOM VARCHAR(10), 
	PRIMARY KEY (ID)
	 
	 );
	 
	 
	 
	 
	 select * from financial_institution;

-- -----------------------------------------------------
-- Table ESTADO_CUMPLE
-- -----------------------------------------------------
CREATE  TABLE  ESTADO_CUMPLE (

id INT NOT NULL,
DESCRIPTION VARCHAR(255), 
PRIMARY KEY (id) 
);




-- -----------------------------------------------------
-- Table HORARIO_DE_ACTUALIZACION
-- -----------------------------------------------------
drop table HORARIO_VTAV_ACT;

CREATE  TABLE  HORARIO_VTAV_ACT (

id serial NOT NULL,
fecha VARCHAR(255),
estado VARCHAR(255),
PRIMARY KEY (id) 
);
select * from HORARIO_VTAV_ACT


-- -----------------------------------------------------
-- FORMULARIO
-- -----------------------------------------------------


-- -----------------------------------------------------
-- AREAS
-- -----------------------------------------------------

CREATE  TABLE  AREAS (
  id SERIAL NOT NULL,
  description VARCHAR(45) NOT NULL ,
  CONSTRAINT AREAS_PK PRIMARY KEY (id) 
);




-- -----------------------------------------------------
-- CONTRATANTES
-- -----------------------------------------------------

CREATE  TABLE  CONTRATANTES (
  id SERIAL NOT NULL,
  description VARCHAR(45) NOT NULL ,
  ID_GERENTE INT NOT NULL , 
  CONSTRAINT CONTRATANTES_PK PRIMARY KEY (id) 
);


-- -----------------------------------------------------
-- GERENTES
-- -----------------------------------------------------

CREATE  TABLE  GERENTES (
  id SERIAL NOT NULL,
  description VARCHAR(45) NOT NULL ,
  ID_PADRINO INT NOT NULL , 
  CONSTRAINT GERENTES_PK PRIMARY KEY (id) 
);


-- -----------------------------------------------------
-- PADRINOS
-- -----------------------------------------------------

CREATE  TABLE  PADRINOS (
  id SERIAL NOT NULL,
  description VARCHAR(45) NOT NULL ,
  ID_TIENDA INT NOT NULL , 
  CONSTRAINT PADRINOS_PK PRIMARY KEY (id) 
);


-- -----------------------------------------------------
-- PRIORIDADES
-- -----------------------------------------------------

CREATE  TABLE  PRIORIDADES (
  id SERIAL NOT NULL,
  description VARCHAR(45) NOT NULL ,

  CONSTRAINT PRIORIDADES_PK PRIMARY KEY (id) 
);



-- -----------------------------------------------------
-- REPORTADOS
-- -----------------------------------------------------

CREATE  TABLE  REPORTADOS (
  id SERIAL NOT NULL,
  description VARCHAR(45) NOT NULL ,
  CONSTRAINT REPORTADOS_PK PRIMARY KEY (id) 
);



-- -----------------------------------------------------
-- SOPORTES
-- -----------------------------------------------------

CREATE  TABLE  SOPORTES (
  id SERIAL NOT NULL,
  description VARCHAR(45) NOT NULL ,
  ID_CONTRAPARTE INT NOT NULL , 
  CONSTRAINT SOPORTES_PK PRIMARY KEY (id) 
);




-- -----------------------------------------------------
-- TIENDAS
-- -----------------------------------------------------

CREATE  TABLE  TIENDAS (
  id SERIAL NOT NULL,
  description VARCHAR(45) NOT NULL ,
  id_flag int NOT NULL,
  CONSTRAINT TIENDAS_PK PRIMARY KEY (id) 
);






-- -----------------------------------------------------
-- FLAG
-- -----------------------------------------------------

CREATE  TABLE  FLAG (
  id SERIAL NOT NULL,
  description VARCHAR(45) NOT NULL ,
  CONSTRAINT FLAG_PK PRIMARY KEY (id) 
);

-- -----------------------------------------------------
-- ESTADOS
-- -----------------------------------------------------

CREATE  TABLE  ESTADOS (
  id SERIAL NOT NULL,
  description VARCHAR(45) NOT NULL ,
  CONSTRAINT ESTADOS_PK PRIMARY KEY (id) 
);



-- -----------------------------------------------------
-- PAUTAS
-- -----------------------------------------------------

CREATE  TABLE  PAUTAS (
  id SERIAL NOT NULL,
  NUMERO_REQUERIMIENTO INT NOT NULL ,
  ID_PRIORIDAD INT NOT NULL ,
  DESCRIPCION_ISSUE VARCHAR(255) NOT NULL ,
  ID_REPORTADO INT NOT NULL ,
  ID_AREA INT NOT NULL ,
  OBSERVACION VARCHAR(255) NOT NULL ,
  ID_TIENDA INT NOT NULL ,
  ID_PADRINO INT NOT NULL ,
  ID_GERENTE INT NOT NULL ,
  ID_CONTRATANTE INT NOT NULL ,
  ID_SOPORTE INT NOT NULL ,
  ID_ESTADO INT NOT NULL ,
  FECHA_VISITA VARCHAR(15) NOT NULL ,
  CONSTRAINT PAUTAS_PK PRIMARY KEY (id) 
);


-- -----------------------------------------------------
-- PAUTAS
-- -----------------------------------------------------





-- -----------------------------------------------------
-- CUADRATURA_ECOMMERCE
-- -----------------------------------------------------

CREATE  TABLE  CUADRATURA_ECOMMERCE (
  id SERIAL NOT NULL,
  NUMORDEN INT NOT NULL ,
  CODDESP INT NOT NULL ,
  FECTRANTSL VARCHAR(45) NOT NULL , 
  NUMCTLTSL INT NOT NULL ,
  NUMTERTSL INT NOT NULL ,
  NUMTRANTSL INT NOT NULL ,
  PXQ INT NOT NULL ,
  SKU INT NOT NULL ,
  CANVEND INT NOT NULL ,
  ESTORDEN INT NOT NULL ,
  SUBESTOC INT NOT NULL ,
  TIPVTA INT NOT NULL ,
  TIPOPAG INT NOT NULL ,
  CONSTRAINT CUADRATURA_ECOMMERCE_PK PRIMARY KEY (id) 
);






-- -----------------------------------------------------
-- CUADRATURA_JPDTOTDAD
-- -----------------------------------------------------

CREATE  TABLE  CUADRATURA_JPDTOTDAD (
  id SERIAL NOT NULL,
  FECHA VARCHAR(45) NOT NULL , 
  LOLOCA INT NOT NULL ,
  LONIVI VARCHAR(45) NOT NULL , 
  NUMERO_SD INT NOT NULL ,
  OD_EOM INT NOT NULL ,
  NUMCORRDUP INT NOT NULL ,
  SKU INT NOT NULL ,
  TOTARTTSL INT NOT NULL ,
  DEPARTTSL INT NOT NULL ,
  CANARTTSL INT NOT NULL ,
  MARDESTSL INT NOT NULL ,
  NUMTERTSL INT NOT NULL ,
  NUMTRANTSL INT NOT NULL ,
  CONSTRAINT CUADRATURA_JPDTOTDAD_PK PRIMARY KEY (id) 
);



-- -----------------------------------------------------
-- CUADRATURA_JPDTOTDAD
-- -----------------------------------------------------

CREATE  TABLE  CUADRATURA_JPDTOTDAD (
  id SERIAL NOT NULL,
  FECHA VARCHAR(45) NOT NULL , 
  LOLOCA INT NOT NULL ,
  LONIVI VARCHAR(45) NOT NULL , 
  NUMERO_SD INT NOT NULL ,
  OD_EOM INT NOT NULL ,
  NUMCORRDUP INT NOT NULL ,
  SKU INT NOT NULL ,
  TOTARTTSL INT NOT NULL ,
  DEPARTTSL INT NOT NULL ,
  CANARTTSL INT NOT NULL ,
  MARDESTSL INT NOT NULL ,
  NUMTERTSL INT NOT NULL ,
  NUMTRANTSL INT NOT NULL ,
  CONSTRAINT CUADRATURA_JPDTOTDAD_PK PRIMARY KEY (id) 
);



-- -----------------------------------------------------
-- CUADRATURA_JPDTOTDAD
-- -----------------------------------------------------

CREATE  TABLE  CUADRATURA_JPDTOTDAD (
  id SERIAL NOT NULL,
  FECHA VARCHAR(45) NOT NULL , 
  LOLOCA INT NOT NULL ,
  LONIVI VARCHAR(45) NOT NULL , 
  NUMERO_SD INT NOT NULL ,
  OD_EOM INT NOT NULL ,
  NUMCORRDUP INT NOT NULL ,
  SKU INT NOT NULL ,
  TOTARTTSL INT NOT NULL ,
  DEPARTTSL INT NOT NULL ,
  CANARTTSL INT NOT NULL ,
  MARDESTSL INT NOT NULL ,
  NUMTERTSL INT NOT NULL ,
  NUMTRANTSL INT NOT NULL ,
  CONSTRAINT CUADRATURA_JPDTOTDAD_PK PRIMARY KEY (id) 
);


-- -----------------------------------------------------
-- ECOMMERCE_SOPORTE_VENTA
-- -----------------------------------------------------

CREATE  TABLE  ECOMMERCE_SOPORTE_VENTA (
  id SERIAL NOT NULL,
  NUMORDEN INT NOT NULL ,
  CODDESP INT NOT NULL ,
  FECTRANTSL VARCHAR(45) NOT NULL , 
  NUMCTLTSL INT NOT NULL ,
  NUMTERTSL INT NOT NULL ,
  NUMTRANTSL INT NOT NULL ,
  PXQ INT NOT NULL ,
  SKU INT NOT NULL ,
  CANVEND INT NOT NULL ,
  ESTORDEN INT NOT NULL ,
  SUBESTOC INT NOT NULL ,
  TIPVTA INT NOT NULL ,
  TIPOPAG INT NOT NULL ,
  TIPO_ESTADO INT NOT NULL ,
  TIPO_RELACION INT NOT NULL ,
  CONSTRAINT ECOMMERCE_SOPORTE_VENTA_PK PRIMARY KEY (id) 
);



GRANT SELECT, DELETE, INSERT, UPDATE ON  ALL TABLES IN SCHEMA  public TO postgres;

GRANT SELECT, DELETE, INSERT, UPDATE ON  TESTT TO postgres;