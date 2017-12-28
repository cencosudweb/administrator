SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `trazabilidad` ;
CREATE SCHEMA IF NOT EXISTS `trazabilidad` DEFAULT CHARACTER SET latin1 ;
DROP SCHEMA IF EXISTS `cencosuds_kit` ;
CREATE SCHEMA IF NOT EXISTS `cencosuds_kit` ;
USE `trazabilidad` ;

-- -----------------------------------------------------
-- Table `trazabilidad`.`times_limit`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `trazabilidad`.`times_limit` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `description` VARCHAR(45) NOT NULL ,
  `time_limit_month` INT NOT NULL ,
  PRIMARY KEY (`id`) )
-- ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trazabilidad`.`agreement`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `trazabilidad`.`agreement` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `numero_convenio` VARCHAR(10) NOT NULL ,
  `status` INT(1) NOT NULL ,
  `fecha_inicio` INT(10) NULL DEFAULT NULL ,
  `fecha_fin` INT(10) NULL DEFAULT NULL ,
  `id_time_limit` INT NULL DEFAULT NULL ,
  `commerce_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_time_limit_idx` (`id_time_limit` ASC) ,
  CONSTRAINT `fk_time_limit`
    FOREIGN KEY (`id_time_limit` )
    REFERENCES `trazabilidad`.`times_limit` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
-- ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `trazabilidad`.`authorities`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `trazabilidad`.`authorities` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `authority` VARCHAR(45) NOT NULL ,
  `description` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
-- ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `trazabilidad`.`economic_activity`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `trazabilidad`.`economic_activity` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(300) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
-- ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `trazabilidad`.`commerce`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `trazabilidad`.`commerce` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `rut` VARCHAR(12) NOT NULL ,
  `razon_social` VARCHAR(45) NOT NULL ,
  `mnemotecnico` VARCHAR(5) NOT NULL ,
  `fecha_activacion` INT(10) NOT NULL ,
  `id_actividad_economica` INT(11) NOT NULL ,
  `status` INT(1) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `rut_UNIQUE` (`rut` ASC) ,
  INDEX `fk_economic_activity_idx` (`id_actividad_economica` ASC) ,
  CONSTRAINT `fk_economic_activity`
    FOREIGN KEY (`id_actividad_economica` )
    REFERENCES `trazabilidad`.`economic_activity` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
-- ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `trazabilidad`.`financial_institution`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `trazabilidad`.`financial_institution` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `rut` VARCHAR(12) NOT NULL ,
  `razon_social` VARCHAR(45) NOT NULL ,
  `mnemotecnico` VARCHAR(5) NOT NULL ,
  `fecha_activacion` INT(10) NULL DEFAULT NULL ,
  `status` INT(1) NULL DEFAULT NULL ,
  `invocation_path` VARCHAR(500) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `rut_UNIQUE` (`rut` ASC) )
-- ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `trazabilidad`.`commerce_agreement_fi`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `trazabilidad`.`commerce_agreement_fi` (
  `financial_institution_id` INT(11) NOT NULL ,
  `commerce_id` INT(11) NOT NULL ,
  `agreement_id` INT(11) NOT NULL ,
  INDEX `fk_commerce_agreement_if_financial_institution1_idx` (`financial_institution_id` ASC) ,
  INDEX `fk_commerce_agreement_if_commerce_idx` (`commerce_id` ASC) ,
  INDEX `fk_commerce_agreement_if_agreement1_idx` (`agreement_id` ASC) ,
  PRIMARY KEY (`financial_institution_id`, `commerce_id`, `agreement_id`) ,
  CONSTRAINT `fk_commerce_agreement_if_commerce`
    FOREIGN KEY (`commerce_id` )
    REFERENCES `trazabilidad`.`commerce` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_commerce_agreement_if_financial_institution1`
    FOREIGN KEY (`financial_institution_id` )
    REFERENCES `trazabilidad`.`financial_institution` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_commerce_agreement_if_agreement1`
    FOREIGN KEY (`agreement_id` )
    REFERENCES `trazabilidad`.`agreement` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
-- ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `trazabilidad`.`questions`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `trazabilidad`.`questions` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `question` VARCHAR(300) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
-- ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `trazabilidad`.`questions_answers`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `trazabilidad`.`questions_answers` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `question` VARCHAR(300) NULL DEFAULT NULL ,
  `answer` VARCHAR(300) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
-- ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `trazabilidad`.`channels`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `trazabilidad`.`channels` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `description` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) )
-- ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trazabilidad`.`urls_callback`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `trazabilidad`.`urls_callback` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `id_agreement` INT(11) NULL DEFAULT NULL ,
  `end_path` VARCHAR(500) NULL DEFAULT NULL ,
  `confirmation_path` VARCHAR(500) NULL DEFAULT NULL ,
  `id_channel` INT NULL DEFAULT NULL ,
  `confirmation_method` VARCHAR(15) NULL ,
  `confirmation_output` VARCHAR(15) NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_agreement_idx` (`id_agreement` ASC) ,
  INDEX `fk_channel_idx` (`id_channel` ASC) ,
  CONSTRAINT `fk_agreement`
    FOREIGN KEY (`id_agreement` )
    REFERENCES `trazabilidad`.`agreement` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_channel`
    FOREIGN KEY (`id_channel` )
    REFERENCES `trazabilidad`.`channels` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
-- ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `trazabilidad`.`users`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `trazabilidad`.`users` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `username` VARCHAR(10) NOT NULL ,
  `password` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(300) NULL DEFAULT NULL ,
  `rut` VARCHAR(11) NULL DEFAULT NULL ,
  `email` VARCHAR(45) NOT NULL ,
  `phone` VARCHAR(15) NULL DEFAULT NULL ,
  `status` INT(1) NULL DEFAULT '2' ,
  `attempts` INT(1) NULL DEFAULT '3' ,
  `password_expire` INT(10) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) ,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) )
-- ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `trazabilidad`.`users_authorities`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `trazabilidad`.`users_authorities` (
  `id_user` INT(11) NOT NULL ,
  `id_authorities` INT(11) NOT NULL ,
  PRIMARY KEY (`id_user`, `id_authorities`) ,
  INDEX `fk_user_ua_idx` (`id_user` ASC) ,
  INDEX `fk_authorities_ua_idx` (`id_authorities` ASC) ,
  CONSTRAINT `fk_user_ua`
    FOREIGN KEY (`id_user` )
    REFERENCES `trazabilidad`.`users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_authorities_ua`
    FOREIGN KEY (`id_authorities` )
    REFERENCES `trazabilidad`.`authorities` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
-- ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `trazabilidad`.`users_commerce`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `trazabilidad`.`users_commerce` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `id_user` INT(11) NULL DEFAULT NULL ,
  `id_commerce` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_user_idx` (`id_user` ASC) ,
  INDEX `fk_commerce_idx` (`id_commerce` ASC) ,
  CONSTRAINT `fk_user_c`
    FOREIGN KEY (`id_user` )
    REFERENCES `trazabilidad`.`users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_commerce_c`
    FOREIGN KEY (`id_commerce` )
    REFERENCES `trazabilidad`.`commerce` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
-- ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `trazabilidad`.`users_financial_institution`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `trazabilidad`.`users_financial_institution` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `id_user` INT(11) NULL DEFAULT NULL ,
  `id_financial_institution` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_user_idx` (`id_user` ASC) ,
  INDEX `fk_financial_idx` (`id_financial_institution` ASC) ,
  CONSTRAINT `fk_user_if`
    FOREIGN KEY (`id_user` )
    REFERENCES `trazabilidad`.`users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_financial_if`
    FOREIGN KEY (`id_financial_institution` )
    REFERENCES `trazabilidad`.`financial_institution` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
-- ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `trazabilidad`.`users_questions_answers`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `trazabilidad`.`users_questions_answers` (
  `id_user` INT(11) NOT NULL ,
  `id_question_answer` INT(11) NOT NULL ,
  PRIMARY KEY (`id_user`, `id_question_answer`) ,
  INDEX `fk_question_uqa_idx` (`id_question_answer` ASC) ,
  CONSTRAINT `fk_user_uqa`
    FOREIGN KEY (`id_user` )
    REFERENCES `trazabilidad`.`users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_question_uqa`
    FOREIGN KEY (`id_question_answer` )
    REFERENCES `trazabilidad`.`questions_answers` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
-- ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;




-- -----------------------------------------------------
-- Table system_log
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `trazabilidad`.`system_log` (
  id INT NOT NULL AUTO_INCREMENT,
  iduser INT NOT NULL,
  loglevel INT NOT NULL,
  action VARCHAR(255)  NOT NULL,
  description VARCHAR(255)  NOT NULL,
  data VARCHAR(255), -- data BLOB,
  tablename VARCHAR(255) NOT NULL,
  pagename VARCHAR(255) NOT NULL,
  ipaddress VARCHAR(255) NOT NULL,
  creationdate DATETIME NOT NULL,
  agent int NOT NULL ,
  PRIMARY KEY  (id)
);


CREATE  TABLE  BODEGA_CTL (
  id INT NOT NULL AUTO_INCREMENT,
  codigo VARCHAR(45) NOT NULL ,
  description VARCHAR(45) NOT NULL ,
  CONSTRAINT bodega_ctl_PK PRIMARY KEY (id) 
);

-- -----------------------------------------------------
-- areas
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `trazabilidad`.`areas`   (
  id INT NOT NULL AUTO_INCREMENT,
  description VARCHAR(45) NOT NULL ,
  CONSTRAINT AREAS_PK PRIMARY KEY (id) 
);


-- -----------------------------------------------------
-- contrantes
-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `trazabilidad`.`contratantes`   (
  id INT NOT NULL AUTO_INCREMENT,
  description VARCHAR(45) NOT NULL ,
  id_gerente int not null,
  CONSTRAINT CONTRATANTES_PK PRIMARY KEY (id) 
);


CREATE  TABLE  estado_orden_stock (
  id INT NOT NULL AUTO_INCREMENT,
  description VARCHAR(45) NOT NULL ,
  codigo VARCHAR(45) NOT NULL ,
  CONSTRAINT estado_orden_stock_PK PRIMARY KEY (id) 
);


-- -----------------------------------------------------
-- CONTRATANTES
-- -----------------------------------------------------

CREATE  TABLE  CONTRATANTES (
  id INT NOT NULL AUTO_INCREMENT,
  description VARCHAR(45) NOT NULL ,
  CONSTRAINT CONTRATANTES_PK PRIMARY KEY (id) 
);


-- -----------------------------------------------------
-- gerentes
-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `trazabilidad`.`gerentes`   (
  id INT NOT NULL AUTO_INCREMENT,
  description VARCHAR(45) NOT NULL ,
  id_padrino int not null,
  CONSTRAINT GERENTES_PK PRIMARY KEY (id) 
);

-- -----------------------------------------------------
-- padrinos
-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `trazabilidad`.`padrinos`   (
  id INT NOT NULL AUTO_INCREMENT,
  description VARCHAR(45) NOT NULL ,
  id_tienda int not null,
  CONSTRAINT PADRINOS_PK PRIMARY KEY (id) 
);

-- -----------------------------------------------------
-- prioridades
-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `trazabilidad`.`prioridades`   (
  id INT NOT NULL AUTO_INCREMENT,
  description VARCHAR(45) NOT NULL ,
  CONSTRAINT PRIORIDADES_PK PRIMARY KEY (id) 
);

-- -----------------------------------------------------
-- reportados
-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `trazabilidad`.`reportados`   (
  id INT NOT NULL AUTO_INCREMENT,
  description VARCHAR(45) NOT NULL ,
  CONSTRAINT REPORTADOS_PK PRIMARY KEY (id) 
);

-- -----------------------------------------------------
-- soportes
-- -----------------------------------------------------


CREATE  TABLE IF NOT EXISTS `trazabilidad`.`soportes`   (
  id INT NOT NULL AUTO_INCREMENT,
  description VARCHAR(45) NOT NULL ,
  id_contraparte int not null,
  CONSTRAINT REPORTADOS_PK PRIMARY KEY (id) 
);

-- -----------------------------------------------------
-- tiendas
-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `trazabilidad`.`tiendas`   (
  id INT NOT NULL AUTO_INCREMENT,
  description VARCHAR(45) NOT NULL ,
  id_flag INT NOT NULL,
  CONSTRAINT TIENDAS_PK PRIMARY KEY (id) 
);

-- -----------------------------------------------------
-- Table flag
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `trazabilidad`.`flag`   (

id INT NOT NULL AUTO_INCREMENT,
DESCRIPTION VARCHAR(255), 
PRIMARY KEY (id) 
);

-- -----------------------------------------------------
-- Table estados
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `trazabilidad`.`estados`   (

id INT NOT NULL AUTO_INCREMENT,
DESCRIPTION VARCHAR(255), 
PRIMARY KEY (id) 
);


-- -----------------------------------------------------
-- Table `trazabilidad`.`PAUTAS`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `trazabilidad`.`pautas`   (
  id INT NOT NULL AUTO_INCREMENT,
  NUMERO_REQUERIMIENTO INT NOT NULL ,
  ID_TIENDA INT NOT NULL ,
  ID_PADRINO INT NOT NULL ,
  ID_GERENTE INT NOT NULL ,
  ID_CONTRATANTE INT NOT NULL ,
  ID_SOPORTE INT NOT NULL ,
  ID_REPORTADO INT NOT NULL ,
  ID_AREA INT NOT NULL ,
  ID_PRIORIDAD INT NOT NULL ,
  ID_ESTADO INT NOT NULL ,
  DESCRIPCION_ISSUE VARCHAR(3000) NOT NULL ,
  OBSERVACION VARCHAR(3000) NOT NULL ,
  FECHA_VISITA VARCHAR(15) NOT NULL ,
  TICKET_CU VARCHAR(50) NOT NULL ,
  CONSTRAINT PAUTAS_PK PRIMARY KEY (id) ,
  
  CONSTRAINT FK_ID_TIENDA_PAUTA
    FOREIGN KEY (id_tienda )
    REFERENCES tiendas (id ),
  
  CONSTRAINT FK_ID_PADRINO_PAUTA
    FOREIGN KEY (id_padrino )
    REFERENCES padrinos (id ),

  CONSTRAINT FK_ID_GERENTE_PAUTA
    FOREIGN KEY (id_gerente )
    REFERENCES gerentes (id ),  
  
  CONSTRAINT FK_ID_CONTRATANTE_PAUTA
    FOREIGN KEY (id_contratante )
    REFERENCES contratantes (id ),  

  CONSTRAINT FK_ID_SOPORTE_PAUTA
    FOREIGN KEY (id_soporte )
    REFERENCES soportes (id ),  
  
  CONSTRAINT FK_ID_REPORTADO_PAUTA
    FOREIGN KEY (id_reportado )
    REFERENCES reportados (id ),

  CONSTRAINT FK_ID_AREA_PAUTA
    FOREIGN KEY (id_area )
    REFERENCES areas (id ),
  
  CONSTRAINT FK_ID_PRIORIDAD_PAUTA
    FOREIGN KEY (id_prioridad )
    REFERENCES prioridades (id ),
    
   CONSTRAINT FK_ID_ESTADO_PAUTA
    FOREIGN KEY (id_estado )
    REFERENCES estados (id ) 
  
);

-- -----------------------------------------------------
-- Table `trazabilidad`.`secuencia`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `trazabilidad`.`secuencia`   (
  id INT NOT NULL AUTO_INCREMENT,
  DESCRIPTION VARCHAR(45) NOT NULL ,
  CONTADOR INT DEFAULT 0 NOT NULL ,
  FECHA VARCHAR(20) NOT NULL ,
  CONSTRAINT SECUENCIA_PK PRIMARY KEY (id) 
);


-----------------------------------------
-----------------------------------------


-- -----------------------------------------------------
-- Table estado_cumple
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `trazabilidad`.`estado_cumple`   (

id INT NOT NULL AUTO_INCREMENT,
DESCRIPTION VARCHAR(255), 
PRIMARY KEY (id) 
);






-- -----------------------------------------------------
-- Table estado_cumple_resumen
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `trazabilidad`.`estado_cumple_resumen`   (
id INT NOT NULL AUTO_INCREMENT,
DESCRIPTION VARCHAR(255), 
PRIMARY KEY (id) 
);




-- -----------------------------------------------------
-- Table estado_cumplimiento
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `trazabilidad`.`estado_cumplimiento`   (

id INT NOT NULL AUTO_INCREMENT,
DESCRIPTION VARCHAR(255), 
PRIMARY KEY (id) 
);




-- -----------------------------------------------------
-- Table estado_responable
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `trazabilidad`.`estado_responsable`   (

id INT NOT NULL AUTO_INCREMENT,
DESCRIPTION VARCHAR(255), 
PRIMARY KEY (id) 
);





-- -----------------------------------------------------
-- Table tipo_orden
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `trazabilidad`.`tipo_orden`   (

id INT NOT NULL AUTO_INCREMENT,
DESCRIPTION VARCHAR(255), 
PRIMARY KEY (id) 
);




-- -----------------------------------------------------
-- Table cliente_retira
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `trazabilidad`.`cliente_retira`   (

id INT NOT NULL AUTO_INCREMENT,
DESCRIPTION VARCHAR(255), 
PRIMARY KEY (id) 
);





-- -----------------------------------------------------
-- Table descripcion_empresa
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `trazabilidad`.`descripcion_empresa`   (

id INT NOT NULL AUTO_INCREMENT,
DESCRIPTION VARCHAR(255), 
PRIMARY KEY (id) 
);





-- -----------------------------------------------------
-- Table tipo_guia
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `trazabilidad`.`tipo_guia`   (

id INT NOT NULL AUTO_INCREMENT,
DESCRIPTION VARCHAR(255), 
PRIMARY KEY (id) 
);



-- -----------------------------------------------------
-- Table tipo_cumplimiento
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `trazabilidad`.`tipo_cumplimiento`   (

id INT NOT NULL AUTO_INCREMENT,
DESCRIPTION VARCHAR(255), 
PRIMARY KEY (id) 
);




-- -----------------------------------------------------
-- Table horario
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `trazabilidad`.`horario`   (

id INT NOT NULL AUTO_INCREMENT,
DESCRIPTION VARCHAR(255), 
PRIMARY KEY (id) 
);





-- -----------------------------------------------------
-- Table venta_empresa
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `trazabilidad`.`venta_empresa`   (

id INT NOT NULL AUTO_INCREMENT,
DESCRIPTION VARCHAR(255), 
PRIMARY KEY (id) 
);


-- -----------------------------------------------------
-- Table tipo_venta
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `trazabilidad`.`tipo_venta`   (

id INT NOT NULL AUTO_INCREMENT,
DESCRIPTION VARCHAR(255), 
PRIMARY KEY (id) 
);






-- -----------------------------------------------------
-- Table cuadratura_oc_vta_comp
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `trazabilidad`.`cuadratura_oc_vta_comp`   (

id INT NOT NULL AUTO_INCREMENT,
RELNUM float unsigned NOT NULL DEFAULT '0' NOT NULL, 
POMUMB float unsigned NOT NULL DEFAULT '0' NOT NULL, 
INUMBR float unsigned NOT NULL DEFAULT '0' NOT NULL, 
RELBL5 INT, 
CANTIDAD_COMP1 INT, 
CANTIDAD_COMP2 INT, 
FECHA_INGRESO VARCHAR(20) ,
PRIMARY KEY (id) 
);



-- -----------------------------------------------------
-- Table cumplimiento_estatico_ws
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `trazabilidad`.`cumplimiento_estatico_ws`   (
  id INT NOT NULL AUTO_INCREMENT,
  DESCRIPTION_CUMPLE VARCHAR(30) NOT NULL,
  CANTIDAD_CUMPLE INT NOT NULL,
  PORCENTAJE_CUMPLE float unsigned NOT NULL DEFAULT '0' NOT NULL NOT NULL,
  DESCRIPTION_ATRASADO VARCHAR(30) NOT NULL,
  CANTIDAD_ATRASADO INT NOT NULL,
  PORCENTAJE_ATRASADO float unsigned NOT NULL DEFAULT '0' NOT NULL NOT NULL,
  DESCRIPTION_NO_CUMPLE VARCHAR(30) NOT NULL,
  CANTIDAD_NO_CUMPLE INT NOT NULL,
  PORCENTAJE_NO_CUMPLE float unsigned NOT NULL DEFAULT '0' NOT NULL NOT NULL,
  CANTIDAD_TOTAL INT NOT NULL,
  PORCENTAJE_TOTAL float unsigned NOT NULL DEFAULT '0' NOT NULL NOT NULL,
  FECHA_COMPROMISO_EOM VARCHAR(15) NOT NULL,
  PRIMARY KEY (id) 
);



-- -----------------------------------------------------
-- Table ORDENES_STOCK_PENDIENTES
-- -----------------------------------------------------
CREATE  TABLE  ordenes_stock_pendientes (
  id INT NOT NULL AUTO_INCREMENT,
  ORDEN INT NOT NULL,
  NRO_DE_LINEA VARCHAR(30) NOT NULL,
  DO_DTL_STATUS VARCHAR(30) NOT NULL,
  TIPOORDEN VARCHAR(30) NOT NULL,
  PEDIDO VARCHAR(30) NOT NULL,
  SKU VARCHAR(30) NOT NULL,
  CANTIDAD_PENDIENTE VARCHAR(30) NOT NULL,
  BODEGA VARCHAR(30) NOT NULL,
  FECHA_CREACION VARCHAR(30) NOT NULL,
  STAT_CODE  INT NOT NULL,
  ESTADO  INT NOT NULL,
  
  DISTRO_NBR  VARCHAR(40) NULL,
  PO_NBR  VARCHAR(40) NULL,
  SIZE_DESC  VARCHAR(40) NULL,
  SHPD_QTY  VARCHAR(40) NULL,
  TC_ORDER_ID  INT NOT NULL,
  CANTIDAD_DESPACHADA  INT NOT NULL,
  CANTIDAD_ORDENADA  INT NOT NULL,
  ORDERID  INT NOT NULL,
  ORDERLINEID  INT NOT NULL,
  EQUALS_QHPD_DESPACHA  VARCHAR(20) NULL,
  
  PRIMARY KEY (id) 
);


DROP TABLE CUADRATURA_DO;
select * from CUADRATURA_DO;
CREATE  TABLE  CUADRATURA_DO (
  ID INT NOT NULL AUTO_INCREMENT,
  ORDENNUM  INT   NULL ,
  EST_SC  INT  NULL ,
  --F_CREACION TIMESTAMP WITH TIME ZONE ,
  F_CREACION VARCHAR(45)  NULL ,
  ETA VARCHAR(45)  NULL ,
  FECHALIBERADA VARCHAR(45) NULL ,
  FACILITY  VARCHAR(45) NULL ,
  SOLCLIENTE  VARCHAR(45)  NULL ,
  DO_EOM VARCHAR(45)  NULL ,
  EST_DO VARCHAR(45)  NULL ,
  T_ORDEN VARCHAR(45)  NULL ,
  ANT_EST VARCHAR(45)  NULL ,
  NUEV_EST VARCHAR(45)  NULL ,
  DO_WMS VARCHAR(45) NULL ,
  SC VARCHAR(45) NULL ,  
  ESTADO INT  NULL ,   
  CONSTRAINT CUADRATURA_DO_PK PRIMARY KEY (id) 
);

-- -----------------------------------------------------
-- Table SKU_SERVICIO_WS
-- -----------------------------------------------------
CREATE  TABLE  SKU_SERVICIO_WS (
  id INT NOT NULL AUTO_INCREMENT,
  INUMBR INT NOT NULL,
  PRSDEP INT NOT NULL,
  PRSSDP INT NOT NULL,
  PRSCLA INT NOT NULL,
  PRSVND INT NOT NULL,
  prstip VARCHAR(30) NOT NULL,
  PRIMARY KEY (id) 
);


  CREATE TABLE cumplimiento
   (	
	ID INT NOT NULL AUTO_INCREMENT,
	TC_PO_LINE_ID VARCHAR(255 ), 
	CUMPL_CALC VARCHAR(255 ), 
	CUMPL_EOM VARCHAR(255 ), 
	CUMPL_BTK VARCHAR(255 ), 
	FECHA_COMPROMISO_EOM VARCHAR(255 ), 
	FECHA_COMPROMISO_BTK VARCHAR(255 ), 
	ESTADO_CALCE_EOM VARCHAR(255 ), 
	SUBESTADO_CALCE_EOM VARCHAR(255 ), 
	FECHA_CALCE_EOM VARCHAR(255 ), 
	HORA_CALCE_EOM VARCHAR(255 ), 
	ESTADO_CALCE_BTK VARCHAR(255 ), 
	SUBESTADO_CALCE_BTK VARCHAR(255 ), 
	FECHA_CALCE_BTK VARCHAR(255 ), 
	HORA_CALCE_BTK VARCHAR(255 ), 
	CRUCE_ESTADO VARCHAR(255 ), 
	CRUCE_SUB_ESTADO VARCHAR(255 ), 
	N_SOLICITUD_CLIENTE VARCHAR(255 ), 
	N_ORDEN_DISTRIBU VARCHAR(255 ), 
	FECHA_CREACION_ORDEN VARCHAR(255 ), 
	EST_ORDEN VARCHAR(255 ), 
	ESTADO_DE_LINEA VARCHAR(255 ), 
	SKU VARCHAR(255 ), 
	CANT_DESC_SKU VARCHAR(255 ), 
	LOCAL_VENTA VARCHAR(255 ), 
	DEPART VARCHAR(255 ), 
	BODEGADESP VARCHAR(255 ), 
	RUTCLIENTE VARCHAR(255 ), 
	NOMBRECLIENTE VARCHAR(255 ), 
	APELLIDOCLIENTE VARCHAR(255 ), 
	DIRECCION_CLIENTE VARCHAR(255 ), 
	COD_COMUNA VARCHAR(255 ), 
	COMUNA VARCHAR(255 ), 
	CIUDAD VARCHAR(255 ), 
	REGION VARCHAR(255 ), 
	HORARIO VARCHAR(255 ), 
	TIPO_ORDEN VARCHAR(255 ), 
	TIPO_VENTA VARCHAR(255 ), 
	O_FACILITY_ALIAS_ID VARCHAR(255 ), 
	REGIONENTREGA VARCHAR(255 ), 
	TIPO_DE_ORDEN VARCHAR(255 ), 
	GUIA VARCHAR(255 ), 
	RUT_EMP VARCHAR(255 ), 
	DESC_EMP VARCHAR(255 ), 
	TIPOGUI VARCHAR(255 ), 
	CLIENTE_RETIRA VARCHAR(255 ), 
	FECHA_PRIMER_INTENTO VARCHAR(255 ), 
	NUMERO_INTENTOS VARCHAR(255 ), 
	FECHA_CREA_PKT VARCHAR(255 ), 
	HORA_CREA_PKT VARCHAR(255 ), 
	NRO_OLA VARCHAR(255 ), 
	FECHA_INICIO_OLA VARCHAR(255 ), 
	HORA_INICIO_OLA VARCHAR(255 ), 
	FECHA_TERMINO_OLA VARCHAR(255 ), 
	HORA_TERMINO_OLA VARCHAR(255 ), 
	FECHA_CIERRE_CARGA VARCHAR(255 ), 
	HORA_CIERRE_CARGA VARCHAR(255 ), 
	FECEMIGUI VARCHAR(255 ), 
	LEAD_TIME_TRANSPORTE VARCHAR(255 ), 
	DIA_SEMANA_ETA VARCHAR(255 ), 
	ENTREGA_DIA_COMPROMISO VARCHAR(255 ), 
	VENTA_EMPRESA VARCHAR(255 ), 
	CUMPLE VARCHAR(255 ), 
	CUMPLIMIENTO_2 VARCHAR(255 ), 
	CUMPLE_RESUMEN VARCHAR(255 ), 
	BODEGA_DESPACHO VARCHAR(255 ), 
	DIF_ETA_CARGA VARCHAR(255 ), 
	FECHA_CARGA_REQUERIDA VARCHAR(255 ), 
	EVAL_SISTEMA VARCHAR(255 ), 
	EVAL_CD VARCHAR(255 ), 
	EVAL_1ER_INTENTO VARCHAR(255 ), 
	CUMPLIMIENTO_CLIENTE VARCHAR(255 ), 
	RESPONSABLE VARCHAR(255 ), 
	TIPO_CUMPLIMIENTO VARCHAR(255 ), 
	LLAVE VARCHAR(255 ), 
	FECHA_INGRESO DATE, 
	CUMPLIMIENTO_FORMULA VARCHAR(255 ), 
	 PRIMARY KEY (ID)
)



CREATE  TABLE  estado_ctl (
  id INT NOT NULL AUTO_INCREMENT, 
  codigo VARCHAR(45) NOT NULL ,
  description VARCHAR(45) NOT NULL ,
  CONSTRAINT estado_ctl_PK PRIMARY KEY (id) 
);


-- -----------------------------------------------------
-- Table CUMPLIMIENTO_KPIWEB
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `trazabilidad`.`cumplimiento_kpiweb`   (
  ID INT NOT NULL AUTO_INCREMENT, 
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
  TIPO_CUMPLIMIENTO INT DEFAULT 3 NOT NULL, 

  PRIMARY KEY (ID) ,
  
  CONSTRAINT FK_ID_CUMPLE_C_KPIWEB
    FOREIGN KEY (id_cumple )
    REFERENCES estado_cumple (id ),
  
  CONSTRAINT FK_ID_CUMPLE_RESUMEN_C_KPIWEB
    FOREIGN KEY (id_cumple_resumen )
    REFERENCES estado_cumple_resumen (id ),
  
  CONSTRAINT FK_ID_CUMPLIMIENTO_2_C_KPIWEB
    FOREIGN KEY (id_cumplimiento_2 )
    REFERENCES estado_cumplimiento (id ),
  
  CONSTRAINT FK_ID_RESPONSABLE_C_KPIWEB
    FOREIGN KEY (id_responsable )
    REFERENCES estado_responsable (id ),
  
  CONSTRAINT FK_ID_TIPO_ORDEN_C_KPIWEB
    FOREIGN KEY (id_tipo_orden )
    REFERENCES tipo_orden (id ),
  
  CONSTRAINT FK_ID_TIPO_VENTA_C_KPIWEB
    FOREIGN KEY (id_tipo_venta )
    REFERENCES tipo_venta (id ),
  
  
  CONSTRAINT FK_ID_CLIENTE_RETIRA_C_KPIWEB
    FOREIGN KEY (id_cliente_retira )
    REFERENCES cliente_retira (id ),
  
  CONSTRAINT FK_ID_DESC_EMP_C_KPIWEB
    FOREIGN KEY (id_desc_emp )
    REFERENCES descripcion_empresa (id ),
  
  
  CONSTRAINT FK_ID_TIPOGUI_C_KPIWEB
    FOREIGN KEY (id_tipogui )
    REFERENCES tipo_guia (id ),
  
  CONSTRAINT FK_ID_HORARIO_C_KPIWEB
    FOREIGN KEY (id_horario )
    REFERENCES horario (id ),
  
  CONSTRAINT FK_ID_VENTA_EMPRESA_C_KPIWEB
    FOREIGN KEY (id_venta_empresa )
    REFERENCES venta_empresa (id ), 

    CONSTRAINT FK_TIPO_CUMPLIMIENTO_KPIWEB
    FOREIGN KEY (tipo_cumplimiento )
    REFERENCES tipo_cumplimiento (id )
  
  );



-- -----------------------------------------------------
-- Table CUMPLIMIENTO_KPIWEB
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `trazabilidad`.`Cumplimiento_Kpiweb_Estatico`   (
  ID INT NOT NULL AUTO_INCREMENT, 
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
  TIPO_CUMPLIMIENTO INT DEFAULT 3 NOT NULL, 
  FECHA_COMPROMISO_EOM VARCHAR(10), 
  PRIMARY KEY (ID) ,
  
  CONSTRAINT FK_ID_CUMPLE_C_KPIWEB_EST
    FOREIGN KEY (id_cumple )
    REFERENCES estado_cumple (id ),
  
  CONSTRAINT FK_ID_CUMPLE_RESUMEN_C_KPIWEB_EST
    FOREIGN KEY (id_cumple_resumen )
    REFERENCES estado_cumple_resumen (id ),
  
  CONSTRAINT FK_ID_CUMPLIMIENTO_2_C_KPIWEB_EST
    FOREIGN KEY (id_cumplimiento_2 )
    REFERENCES estado_cumplimiento (id ),
  
  CONSTRAINT FK_ID_RESPONSABLE_C_KPIWEB_EST
    FOREIGN KEY (id_responsable )
    REFERENCES estado_responsable (id ),
  
  CONSTRAINT FK_ID_TIPO_ORDEN_C_KPIWEB
    FOREIGN KEY (id_tipo_orden )
    REFERENCES tipo_orden (id ),
  
  CONSTRAINT FK_ID_TIPO_VENTA_C_KPIWEB_EST
    FOREIGN KEY (id_tipo_venta )
    REFERENCES tipo_venta (id ),
  
  
  CONSTRAINT FK_ID_CLIENTE_RETIRA_C_KPIWEB_EST
    FOREIGN KEY (id_cliente_retira )
    REFERENCES cliente_retira (id ),
  
  CONSTRAINT FK_ID_DESC_EMP_C_KPIWEB_EST
    FOREIGN KEY (id_desc_emp )
    REFERENCES descripcion_empresa (id ),
  
  
  CONSTRAINT FK_ID_TIPOGUI_C_KPIWEB_EST
    FOREIGN KEY (id_tipogui )
    REFERENCES tipo_guia (id ),
  
  CONSTRAINT FK_ID_HORARIO_C_KPIWEB_EST
    FOREIGN KEY (id_horario )
    REFERENCES horario (id ),
  
  CONSTRAINT FK_ID_VENTA_EMPRESA_C_KPIWEB_EST
    FOREIGN KEY (id_venta_empresa )
    REFERENCES venta_empresa (id ), 

    CONSTRAINT FK_TIPO_CUMPLIMIENTO_KPIWEB_EST
    FOREIGN KEY (tipo_cumplimiento )
    REFERENCES tipo_cumplimiento (id )
  
  );


  CREATE TABLE cuadratura_ctl
   (
    
      ID INT NOT NULL AUTO_INCREMENT, 
      carga INT  NULL, 
      bodega INT  NULL, 
      fecha VARCHAR(45)  NULL, 
      tipo VARCHAR(45)  NULL, 
      tran_nbr INT  NULL, 
      tienda INT  NULL, 
      guias INT  NULL, 
      detalles INT  NULL, 
      cant_Wms INT  NULL, 
      procesado_jda VARCHAR(45)  NULL, 
      encontrados INT  NULL,
    PRIMARY KEY (id) 
) ;

CREATE  TABLE IF NOT EXISTS `trazabilidad`.`ecommerce_soporte_venta`   (
   
      ID INT NOT NULL AUTO_INCREMENT, 
      NUMORDEN INT NOT NULL, 
      CODIGO_DESPACHO INT NOT NULL, 
     FECTRANTSL VARCHAR(45) NOT NULL, 
     NUMCTLTSL INT NOT NULL, 
     NUMTERTSL INT NOT NULL, 
     NUMTRANTSL INT NOT NULL, 
     PXQ INT NOT NULL, 
     SKU INT NOT NULL, 
     LOLOCA INT NOT NULL, 
     ESTORDEN INT NOT NULL, 
     TIPO_ESTADO_OC INT NOT NULL, 
     TIPVTA INT NOT NULL, 
     TIPOPAG INT NOT NULL, 
     TIPO_ESTADO INT NOT NULL, 
      TIPO_RELACION INT NOT NULL, 
    PRIMARY KEY (id) 
) ;



-- -----------------------------------------------------
-- Table HORARIO_VTAV_ACT_STOCK
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `trazabilidad`.`horario_vtav_act_stock`   (


id INT NOT NULL AUTO_INCREMENT,
FECHA VARCHAR(255), 
ESTADO VARCHAR(255), 
PRIMARY KEY (id) 
);


-- -----------------------------------------------------
-- Table horario_tra_act
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `trazabilidad`.`horario_trazabilidad_act`   (


id INT NOT NULL AUTO_INCREMENT,
FECHA VARCHAR(255), 
ESTADO VARCHAR(255), 
PRIMARY KEY (id) 
);

HorarioTrazabilidadActualizacion

-----------------------

-- -----------------------------------------------------
-- Table tipo_estado_oc_vtav
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `trazabilidad`.`tipo_estado_oc_vtav`   (  

id INT NOT NULL AUTO_INCREMENT,
DESCRIPTION VARCHAR(255), 
PRIMARY KEY (id) 
);





-- -----------------------------------------------------
-- Table tipo_estado_oc_vtav_stock
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `trazabilidad`.`tipo_estado_oc_vtav_stock`   (
id INT NOT NULL AUTO_INCREMENT,
DESCRIPTION VARCHAR(255), 
PRIMARY KEY (id) 
);

-- -----------------------------------------------------
-- Table HORARIO_DE_ACTUALIZACION
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `trazabilidad`.`horario_vtav_act`   (  

id INT NOT NULL AUTO_INCREMENT,
FECHA VARCHAR(255), 
ESTADO VARCHAR(255), 
PRIMARY KEY (id) 
);




-- -----------------------------------------------------
-- Table cuadratura_oc_vtav_comp
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `trazabilidad`.`cuadratura_oc_vtav_comp`   (
id INT NOT NULL AUTO_INCREMENT,
RELNUM float unsigned NOT NULL DEFAULT '0' NOT NULL NOT NULL, 
POMUMB float unsigned NOT NULL DEFAULT '0' NOT NULL NOT NULL, 
INUMBR float unsigned NOT NULL DEFAULT '0' NOT NULL NOT NULL, 
RELBL5 INT, 
CANTIDAD_COMP1 INT, 
CANTIDAD_COMP2 INT, 
FECHA_INGRESO VARCHAR(20) ,
PRIMARY KEY (id) 
);


-- -----------------------------------------------------
-- Table cuadratura_oc_vtav_eom
-- -----------------------------------------------------

CREATE  TABLE  cuadratura_oc_vtav_eom (

id INT NOT NULL AUTO_INCREMENT,
SOLICITUDORIGINAL VARCHAR(255), 
N_ORDEN_DISTRIBU VARCHAR(255), 
SOLICITUD VARCHAR(255), 
FECHA_CREACION_ORDEN VARCHAR(255), 
ORIGEN VARCHAR(255), 
CANCELADO VARCHAR(255), 
PRIMARY KEY (id) 
);





-- -----------------------------------------------------
-- Table cuadratura_oc_vtav_jda
-- -----------------------------------------------------
CREATE  TABLE cuadratura_oc_vtav_jda   (

id INT NOT NULL AUTO_INCREMENT,
PONUMB VARCHAR(255), 
POVNUM VARCHAR(255), 
NUMDO VARCHAR(255), 
POFECE VARCHAR(255), 
POHORE VARCHAR(255), 
EX14ERROR VARCHAR(255), 
EX14FREGi VARCHAR(255), 
DESPA VARCHAR(255), 
PRIMARY KEY (id) 
);


----------------
CREATE  TABLE IF NOT EXISTS `trazabilidad`.`cuadratura_venta_verde`   (
   
      ID INT NOT NULL AUTO_INCREMENT, 
    SOLICITUDORIGINAL VARCHAR(255) NOT NULL, 
    N_ORDEN_DISTRIBU VARCHAR(255) NOT NULL, 
    FECHA_CREACION_ORDEN VARCHAR(45) NOT NULL, 
    PONUMB VARCHAR(255) NOT NULL, 
    EX14ERROR VARCHAR (255) NOT NULL, 
    DESPA VARCHAR (255) NOT NULL, 
    TIPO_ESTADO INT NOT NULL, 
    TIPO_RELACION INT NOT NULL, 
    
  RELNUM VARCHAR(255) NOT NULL, 
    INUMBR VARCHAR(255) NOT NULL, 
    RELBL5 VARCHAR(255) NOT NULL, 
    LOGENCONTRADOENJDA VARCHAR(255) NOT NULL, 

    
  
    PRIMARY KEY (id) 
) ;




-- -----------------------------------------------------
-- Table `trazabilidad`.`estado_od`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `trazabilidad`.`estado_od` (
  id INT NOT NULL AUTO_INCREMENT ,
  codigo INT NOT NULL ,
  description VARCHAR(45) NOT NULL ,
  PRIMARY KEY (id) )
-- ENGINE = InnoDB;


USE `cencosuds_kit` ;

-- -----------------------------------------------------
-- Table `cencosuds_kit`.`shopping_cart`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cencosuds_kit`.`shopping_cart` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `car_reference` VARCHAR(50) NULL ,
  `agremment_id` INT(11) NULL ,
  `arrival_date` INT(10) NULL ,
  `channel_id` INT NULL ,
  `status` INT NULL ,
  `total` DECIMAL(10,2) NULL ,
  `items_number` INT NULL ,
  PRIMARY KEY (`id`) )
-- ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cencosuds_kit`.`items`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cencosuds_kit`.`items` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `id_cart` INT NULL ,
  `number` VARCHAR(45) NULL ,
  `identification` VARCHAR(45) NULL ,
  `description` VARCHAR(200) NULL ,
  `expire` VARCHAR(45) NULL ,
  `amount` INT NULL ,
  `quantity` INT NULL ,
  `aditional_data` VARCHAR(500) NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_cart_p_idx` (`id_cart` ASC) ,
  CONSTRAINT `fk_cart_p`
    FOREIGN KEY (`id_cart` )
    REFERENCES `cencosuds_kit`.`shopping_cart` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
-- ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cencosuds_kit`.`notifications`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cencosuds_kit`.`notifications` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `shopping_cart_id` INT NULL ,
  `status` INT NULL ,
  `type` INT NULL ,
  `return_code` VARCHAR(45) NULL ,
  `return_description` VARCHAR(500) NULL ,
  `total` INT NULL ,
  `cencosud_numbers` INT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_shopping_cart_n_idx` (`shopping_cart_id` ASC) ,
  CONSTRAINT `fk_shopping_cart_n`
    FOREIGN KEY (`shopping_cart_id` )
    REFERENCES `cencosuds_kit`.`shopping_cart` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
-- ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cencosuds_kit`.`conciliations_commerce`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cencosuds_kit`.`conciliations_commerce` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `commerce_id` INT NULL ,
  `init_accounting_date` DATETIME NULL ,
  `end_accounting_date` DATETIME NULL ,
  `release_date` INT NULL ,
  `status` INT NULL ,
  `is_decrease` INT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_commerce_cf_idx` (`commerce_id` ASC) ,
  CONSTRAINT `fk_commerce_cf`
    FOREIGN KEY (`commerce_id` )
    REFERENCES `trazabilidad`.`commerce` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
-- ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cencosuds_kit`.`conciliations_financial`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cencosuds_kit`.`conciliations_financial` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `financial_id` INT NULL ,
  `arrival_date` DATETIME NULL ,
  `init_accounting_date` DATETIME NULL ,
  `end_accounting_date` DATETIME NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_financial_cf_idx` (`financial_id` ASC) ,
  CONSTRAINT `fk_financial_cf`
    FOREIGN KEY (`financial_id` )
    REFERENCES `trazabilidad`.`financial_institution` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
-- ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cencosuds_kit`.`tracking`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cencosuds_kit`.`tracking` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `shopping_cart_id` INT NULL ,
  `date` INT(10) NULL DEFAULT NULL ,
  `code` VARCHAR(5) NULL ,
  `msg` VARCHAR(50) NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_shopping_cart_t_idx` (`shopping_cart_id` ASC) ,
  CONSTRAINT `fk_shopping_cart_t`
    FOREIGN KEY (`shopping_cart_id` )
    REFERENCES `cencosuds_kit`.`shopping_cart` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
-- ENGINE = InnoDB;




  CREATE TABLE cuadratura_vtav_pd
   (
      ID INT NOT NULL AUTO_INCREMENT, 
      tc_po_line_id VARCHAR(255) NOT NULL, 
      n_Solicitud_cliente VARCHAR(255) NOT NULL, 
     n_orden_distribu VARCHAR(45) NOT NULL, 
    fecha_creacion_orden VARCHAR(20) NOT NULL, 
    fechacompromiso VARCHAR(20) NOT NULL, 
	estorden VARCHAR(255) NOT NULL, 
	estLineaorden VARCHAR(255) NOT NULL, 
	estado_od VARCHAR(255) NOT NULL, 
	sku VARCHAR(255) NOT NULL, 
	descsku VARCHAR(255) NOT NULL, 
	cantsku VARCHAR(255) NOT NULL, 
	despacho VARCHAR(255) NOT NULL, 
	tipo_orden VARCHAR(255) NOT NULL, 
	mes VARCHAR(255) NOT NULL, 
	ano VARCHAR(255) NOT NULL, 
    descripcion_tipo_orden VARCHAR(255) NOT NULL, 
	tipo_venta INT NOT NULL, 
	tipo_numero_distribuicion INT NOT NULL,  
	horario INT NOT NULL, 
	horario2 INT NOT NULL, 
    fecha_creacion VARCHAR(255) NOT NULL, 
    PRIMARY KEY (id) 
) ;




-- -----------------------------------------------------
-- Table `cencosuds_kit`.`notifications_extras`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cencosuds_kit`.`notifications_extras` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `id_notifications` INT NULL ,
  `transaction_date` DATETIME NULL ,
  `voucher_number` VARCHAR(50) NULL ,
  `accouting_date` DATETIME NULL ,
  `agreement_number` VARCHAR(10) NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_notifications_ne_idx` (`id_notifications` ASC) ,
  CONSTRAINT `fk_notifications_ne`
    FOREIGN KEY (`id_notifications` )
    REFERENCES `cencosuds_kit`.`notifications` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
-- ENGINE = InnoDB;

USE `trazabilidad` ;
USE `cencosuds_kit` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
