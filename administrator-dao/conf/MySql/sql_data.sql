INSERT INTO `trazabilidad`.`users` (`id`,`username`,`password`,`name`,`rut`,`email`,`phone`,`status`,`attempts`,`password_expire`) VALUES (1,'admin','4a7d1ed414474e4033ac29ccb8653d9b','Admin','15567863-1','j.garrido@lftech.cl','55442222',0,3,0);
INSERT INTO `trazabilidad`.`users` (`id`,`username`,`password`,`name`,`rut`,`email`,`phone`,`status`,`attempts`,`password_expire`) VALUES (2,'financial','4a7d1ed414474e4033ac29ccb8653d9b','Bco Santander','5236307-1','jose.floyd.jose@gmail.com','11223344',0,3,0);
INSERT INTO `trazabilidad`.`users` (`id`,`username`,`password`,`name`,`rut`,`email`,`phone`,`status`,`attempts`,`password_expire`) VALUES (3,'commerce','4a7d1ed414474e4033ac29ccb8653d9b','Pc Factory','13563067-5','jose_floyd@hotmail.com','33224411',0,3,0);
INSERT INTO `trazabilidad`.`authorities` (`id`,`authority`,`description`) VALUES (1,'ROLE_ADMIN','OROV');
INSERT INTO `trazabilidad`.`authorities` (`id`,`authority`,`description`) VALUES (2,'ROLE_USER_IF','Institucion Financiera');
INSERT INTO `trazabilidad`.`authorities` (`id`,`authority`,`description`) VALUES (3,'ROLE_COMMERCE','Comercio');
INSERT INTO `trazabilidad`.`authorities` (`id`, `authority`, `description`) VALUES (4, 'ROLE_PENDING', 'Password Pendiente');
INSERT INTO `trazabilidad`.`users_authorities` (`id_user`, `id_authorities`) VALUES ('1', '1');
INSERT INTO `trazabilidad`.`users_authorities` (`id_user`, `id_authorities`) VALUES ('2', '2');
INSERT INTO `trazabilidad`.`users_authorities` (`id_user`, `id_authorities`) VALUES ('3', '3');
INSERT INTO `trazabilidad`.`economic_activity` (`id`,`nombre`) VALUES (1,'Pub & Restaurant');
INSERT INTO `trazabilidad`.`economic_activity` (`id`,`nombre`) VALUES (2,'Venta de equipos computacionales');
INSERT INTO `trazabilidad`.`economic_activity` (`id`,`nombre`) VALUES (3,'Entretencion ');
INSERT INTO `trazabilidad`.`commerce` (`id`,`rut`,`razon_social`,`mnemotecnico`,`fecha_activacion`,`id_actividad_economica`,`status`) VALUES (1,'9820490-3','Restauran La Casita','RLC',1366721511,1,0);
INSERT INTO `trazabilidad`.`commerce` (`id`,`rut`,`razon_social`,`mnemotecnico`,`fecha_activacion`,`id_actividad_economica`,`status`) VALUES (2,'6545553-6','Pc Factory','PCF',1366721511,2,0);
INSERT INTO `trazabilidad`.`commerce` (`id`,`rut`,`razon_social`,`mnemotecnico`,`fecha_activacion`,`id_actividad_economica`,`status`) VALUES (3,'23526755-1','Fantasilandia','FTA',1366721511,3,0);
INSERT INTO `trazabilidad`.`financial_institution` (`id`,`rut`,`razon_social`,`mnemotecnico`,`fecha_activacion`,`status`,`invocation_path`) VALUES (1,'22164358-5','Banco Santander','BSTR',1366721511,0,'');
INSERT INTO `trazabilidad`.`financial_institution` (`id`,`rut`,`razon_social`,`mnemotecnico`,`fecha_activacion`,`status`,`invocation_path`) VALUES (2,'7702265-1','Banco Ripley','BRPY',1366721511,0,'');
INSERT INTO `trazabilidad`.`financial_institution` (`id`,`rut`,`razon_social`,`mnemotecnico`,`fecha_activacion`,`status`,`invocation_path`) VALUES (3,'8394623-7','Banco de Chile','BCHL',1366721511,0,'');
INSERT INTO `trazabilidad`.`users_commerce` (`id`,`id_user`,`id_commerce`) VALUES (1,3,2);
INSERT INTO `trazabilidad`.`users_financial_institution` (`id`,`id_user`,`id_financial_institution`) VALUES (1,2,1);
INSERT INTO `trazabilidad`.`questions` (`question`) VALUES ('Cual es el nombre de mi primera mascota?');
INSERT INTO `trazabilidad`.`questions` (`question`) VALUES ('Cual es el segundo nombre de mi madre?');
INSERT INTO `trazabilidad`.`questions` (`question`) VALUES ('Ciudad de Nacimiento?');
INSERT INTO `trazabilidad`.`questions` (`question`) VALUES ('Programa favorito de TV?');
INSERT INTO `trazabilidad`.`questions` (`question`) VALUES ('Banda de musica preferida?');
INSERT INTO `trazabilidad`.`questions` (`question`) VALUES ('Cual es tu comida favorita?');
INSERT INTO `trazabilidad`.`questions_answers` (`question`, `answer`) VALUES ('Lugar de nacimiento?', 'respuesta1');
INSERT INTO `trazabilidad`.`questions_answers` (`question`, `answer`) VALUES ('Nombre madre?', 'respuesta2');
INSERT INTO `trazabilidad`.`questions_answers` (`question`, `answer`) VALUES ('Nombre Mascota?', 'respuesta3');
INSERT INTO `trazabilidad`.`questions_answers` (`question`, `answer`) VALUES ('Lugar de nacimiento?', 'respuesta1');
INSERT INTO `trazabilidad`.`questions_answers` (`question`, `answer`) VALUES ('Nombre madre?', 'respuesta2');
INSERT INTO `trazabilidad`.`questions_answers` (`question`, `answer`) VALUES ('Nombre Mascota?', 'respuesta3');
INSERT INTO `trazabilidad`.`questions_answers` (`question`, `answer`) VALUES ('Lugar de nacimiento?', 'respuesta1');
INSERT INTO `trazabilidad`.`questions_answers` (`question`, `answer`) VALUES ('Nombre madre?', 'respuesta2');
INSERT INTO `trazabilidad`.`questions_answers` (`question`, `answer`) VALUES ('Lugar de nacimiento?', 'respuesta3');
INSERT INTO `trazabilidad`.`users_questions_answers` (`id_user`, `id_question_answer`) VALUES ('1', '1');
INSERT INTO `trazabilidad`.`users_questions_answers` (`id_user`, `id_question_answer`) VALUES ('1', '2');
INSERT INTO `trazabilidad`.`users_questions_answers` (`id_user`, `id_question_answer`) VALUES ('1', '3');
INSERT INTO `trazabilidad`.`users_questions_answers` (`id_user`, `id_question_answer`) VALUES ('2', '1');
INSERT INTO `trazabilidad`.`users_questions_answers` (`id_user`, `id_question_answer`) VALUES ('2', '2');
INSERT INTO `trazabilidad`.`users_questions_answers` (`id_user`, `id_question_answer`) VALUES ('2', '3');
INSERT INTO `trazabilidad`.`users_questions_answers` (`id_user`, `id_question_answer`) VALUES ('3', '1');
INSERT INTO `trazabilidad`.`users_questions_answers` (`id_user`, `id_question_answer`) VALUES ('3', '2');
INSERT INTO `trazabilidad`.`users_questions_answers` (`id_user`, `id_question_answer`) VALUES ('3', '3');
INSERT INTO `trazabilidad`.`channels` (`description`) VALUES ('Web');
INSERT INTO `trazabilidad`.`channels` (`description`) VALUES ('Mobile');
INSERT INTO `trazabilidad`.`times_limit` (`description`, `time_limit_month`) VALUES ('Semestral', '6');
INSERT INTO `trazabilidad`.`times_limit` (`description`, `time_limit_month`) VALUES ('Anual', '12');
INSERT INTO `trazabilidad`.`agreement` (`numero_convenio`, `status`, `fecha_inicio`, `fecha_fin`, `id_time_limit`, `commerce_id`) VALUES ('F-100', '0', '1357067794', '1387134994', '2', '1');
INSERT INTO `trazabilidad`.`agreement` (`numero_convenio`, `status`, `fecha_inicio`, `fecha_fin`, `id_time_limit`, `commerce_id`) VALUES ('F-200', '0', '1357067794', '1387134994', '2', '1');
INSERT INTO `trazabilidad`.`agreement` (`numero_convenio`, `status`, `fecha_inicio`, `fecha_fin`, `id_time_limit`, `commerce_id`) VALUES ('F-300', '0', '1357067794', '1387134994', '2', '2');
INSERT INTO `trazabilidad`.`urls_callback` (`id`,`id_agreement`,`end_path`,`confirmation_path`,`id_channel`,`confirmation_method`,`confirmation_output`) VALUES (1,1,'www.lacasita.cl/finPago.do?idTrx=','http://security-services.taisachile.cl/security-services/bolsaonlineservice/validahorariooperacion',1,'GET','JSON');
INSERT INTO `trazabilidad`.`commerce_agreement_fi` (`commerce_id`, `financial_institution_id`, `agreement_id`) VALUES (1,1,1);


Insert into areas (ID,DESCRIPTION) values ('61','El área de Expedición');
Insert into areas (ID,DESCRIPTION) values ('62','Control Interno/Adm.Cntb. Y Tesorería');
Insert into areas (ID,DESCRIPTION) values ('63','POS');
Insert into areas (ID,DESCRIPTION) values ('64','Impresoras');
Insert into areas (ID,DESCRIPTION) values ('65','Otros');
Insert into areas (ID,DESCRIPTION) values ('1','SAC');
Insert into areas (ID,DESCRIPTION) values ('2','Funcionamiento Quiosco');
Insert into areas (ID,DESCRIPTION) values ('3','Venta con Retiro en tienda (C&C y BOPIS)');
Insert into areas (ID,DESCRIPTION) values ('4','Bodega');


Insert into contratantes (ID,DESCRIPTION,ID_GERENTE) values ('1','Contratante 1','1');
Insert into contratantes (ID,DESCRIPTION,ID_GERENTE) values ('2','Contraparte 2','2');


Insert into cuadratura_oc_vtav_comp (ID,RELNUM,POMUMB,INUMBR,RELBL5,CANTIDAD_COMP1,CANTIDAD_COMP2,FECHA_INGRESO) values ('15287','112478336','500010','339813984','119520157','2','2','20170611');

INSERT INTO trazabilidad.cumplimiento_estatico_ws (id, DESCRIPTION_CUMPLE, CANTIDAD_CUMPLE, PORCENTAJE_CUMPLE, DESCRIPTION_ATRASADO, CANTIDAD_ATRASADO, PORCENTAJE_ATRASADO, DESCRIPTION_NO_CUMPLE, CANTIDAD_NO_CUMPLE, PORCENTAJE_NO_CUMPLE, CANTIDAD_TOTAL, PORCENTAJE_TOTAL, FECHA_COMPROMISO_EOM) VALUES(0, '', 0, 0, '', 0, 0, '', 0, 0, 0, 0, '');

Insert into cumplimiento_kpiweb (ID,ID_CUMPLE,ID_CUMPLE_RESUMEN,ID_CUMPLIMIENTO_2,ID_RESPONSABLE,ID_TIPO_ORDEN,ID_TIPO_VENTA,ID_CLIENTE_RETIRA,ID_DESC_EMP,ID_TIPOGUI,ID_HORARIO,ID_VENTA_EMPRESA,FECHA_COMPROMISO_EOM,TIPO_CUMPLIMIENTO) values ('14730215','1','2','1','1','3','2','1','13','3','4','1','2017-09-25','1');
Insert into cumplimiento_kpiweb (ID,ID_CUMPLE,ID_CUMPLE_RESUMEN,ID_CUMPLIMIENTO_2,ID_RESPONSABLE,ID_TIPO_ORDEN,ID_TIPO_VENTA,ID_CLIENTE_RETIRA,ID_DESC_EMP,ID_TIPOGUI,ID_HORARIO,ID_VENTA_EMPRESA,FECHA_COMPROMISO_EOM,TIPO_CUMPLIMIENTO) values ('14730216','1','2','1','1','3','2','1','13','2','4','1','2017-09-25','1');
Insert into cumplimiento_kpiweb (ID,ID_CUMPLE,ID_CUMPLE_RESUMEN,ID_CUMPLIMIENTO_2,ID_RESPONSABLE,ID_TIPO_ORDEN,ID_TIPO_VENTA,ID_CLIENTE_RETIRA,ID_DESC_EMP,ID_TIPOGUI,ID_HORARIO,ID_VENTA_EMPRESA,FECHA_COMPROMISO_EOM,TIPO_CUMPLIMIENTO) values ('14730151','1','2','1','1','3','2','1','13','2','4','1','2017-09-25','1');
Insert into cumplimiento_kpiweb (ID,ID_CUMPLE,ID_CUMPLE_RESUMEN,ID_CUMPLIMIENTO_2,ID_RESPONSABLE,ID_TIPO_ORDEN,ID_TIPO_VENTA,ID_CLIENTE_RETIRA,ID_DESC_EMP,ID_TIPOGUI,ID_HORARIO,ID_VENTA_EMPRESA,FECHA_COMPROMISO_EOM,TIPO_CUMPLIMIENTO) values ('14730152','1','2','1','1','5','2','1','4','2','4','1','2017-09-25','1');

Insert into cumplimiento_kpiweb (ID,ID_CUMPLE,ID_CUMPLE_RESUMEN,ID_CUMPLIMIENTO_2,ID_RESPONSABLE,ID_TIPO_ORDEN,ID_TIPO_VENTA,ID_CLIENTE_RETIRA,ID_DESC_EMP,ID_TIPOGUI,ID_HORARIO,ID_VENTA_EMPRESA,FECHA_COMPROMISO_EOM,TIPO_CUMPLIMIENTO) values ('11581271','1','2','1','1','3','1','1','13','2','4','1','2017-05-31','3');


Insert into descripcion_empresa (ID,DESCRIPTION) values ('14','Guillermina Del Carmen Flores Millar');
Insert into descripcion_empresa (ID,DESCRIPTION) values ('9','Stevens');
Insert into descripcion_empresa (ID,DESCRIPTION) values ('4','Logistica La Frontera Ltda.');
Insert into descripcion_empresa (ID,DESCRIPTION) values ('8','Sociedad De Transportes Matta Spa');
Insert into descripcion_empresa (ID,DESCRIPTION) values ('3','DANIEL ALEJANDRO BERRIOS RODRIGUEZ');
Insert into descripcion_empresa (ID,DESCRIPTION) values ('5','Navas Cargo SA');
Insert into descripcion_empresa (ID,DESCRIPTION) values ('6','Rosa Maria Saa Diaz');
Insert into descripcion_empresa (ID,DESCRIPTION) values ('13','URZUA Y AHUMADA LTDA. (PI-PAU)');
Insert into descripcion_empresa (ID,DESCRIPTION) values ('12','Transportes Retail S.A');
Insert into descripcion_empresa (ID,DESCRIPTION) values ('10','Transporte, Tecnologia Y Giros Egt Ltda.');
Insert into descripcion_empresa (ID,DESCRIPTION) values ('11','TRANSPORTES EFRAEL Y COMPANIA LIMITIDA');
Insert into descripcion_empresa (ID,DESCRIPTION) values ('2','Cencosud Retail S.A');
Insert into descripcion_empresa (ID,DESCRIPTION) values ('7','SERVICIOS LOGISTICOS DGA S.A.');
Insert into descripcion_empresa (ID,DESCRIPTION) values ('1','-');




Insert into ECOMMERCE_SOPORTE_VENTA (ID,NUMORDEN,CODIGO_DESPACHO,FECTRANTSL,NUMCTLTSL,NUMTERTSL,NUMTRANTSL,PXQ,SKU,LOLOCA,ESTORDEN,TIPO_ESTADO_OC,TIPVTA,TIPOPAG,TIPO_ESTADO,TIPO_RELACION) values ('1861462','0','0','20170925','0','0','0','289990','795207999','32','0','0','0','0','3','2');
Insert into ECOMMERCE_SOPORTE_VENTA (ID,NUMORDEN,CODIGO_DESPACHO,FECTRANTSL,NUMCTLTSL,NUMTERTSL,NUMTRANTSL,PXQ,SKU,LOLOCA,ESTORDEN,TIPO_ESTADO_OC,TIPVTA,TIPOPAG,TIPO_ESTADO,TIPO_RELACION) values ('1861463','0','0','20170925','0','0','0','19990','501306999','32','0','0','0','0','3','2');
Insert into ECOMMERCE_SOPORTE_VENTA (ID,NUMORDEN,CODIGO_DESPACHO,FECTRANTSL,NUMCTLTSL,NUMTERTSL,NUMTRANTSL,PXQ,SKU,LOLOCA,ESTORDEN,TIPO_ESTADO_OC,TIPVTA,TIPOPAG,TIPO_ESTADO,TIPO_RELACION) values ('1861464','0','0','20170925','0','0','0','14990','501300999','32','0','0','0','0','3','2');
Insert into ECOMMERCE_SOPORTE_VENTA (ID,NUMORDEN,CODIGO_DESPACHO,FECTRANTSL,NUMCTLTSL,NUMTERTSL,NUMTRANTSL,PXQ,SKU,LOLOCA,ESTORDEN,TIPO_ESTADO_OC,TIPVTA,TIPOPAG,TIPO_ESTADO,TIPO_RELACION) values ('1861465','0','0','20170925','0','0','0','34990','444691999','32','0','0','0','0','3','2');
Insert into ECOMMERCE_SOPORTE_VENTA (ID,NUMORDEN,CODIGO_DESPACHO,FECTRANTSL,NUMCTLTSL,NUMTERTSL,NUMTRANTSL,PXQ,SKU,LOLOCA,ESTORDEN,TIPO_ESTADO_OC,TIPVTA,TIPOPAG,TIPO_ESTADO,TIPO_RELACION) values ('1861466','0','0','20170925','0','0','0','24990','363217999','32','0','0','0','0','3','2');
Insert into ECOMMERCE_SOPORTE_VENTA (ID,NUMORDEN,CODIGO_DESPACHO,FECTRANTSL,NUMCTLTSL,NUMTERTSL,NUMTRANTSL,PXQ,SKU,LOLOCA,ESTORDEN,TIPO_ESTADO_OC,TIPVTA,TIPOPAG,TIPO_ESTADO,TIPO_RELACION) values ('1861467','0','0','20170925','0','0','0','7990','155008005','32','0','0','0','0','3','2');
Insert into ECOMMERCE_SOPORTE_VENTA (ID,NUMORDEN,CODIGO_DESPACHO,FECTRANTSL,NUMCTLTSL,NUMTERTSL,NUMTRANTSL,PXQ,SKU,LOLOCA,ESTORDEN,TIPO_ESTADO_OC,TIPVTA,TIPOPAG,TIPO_ESTADO,TIPO_RELACION) values ('1861468','0','0','20170925','0','0','0','99990','132663999','32','0','0','0','0','3','2');


Insert into ESTADOS (ID,DESCRIPTION) values ('1','Abierto');
Insert into ESTADOS (ID,DESCRIPTION) values ('2','Cerrado');


Insert into ESTADO_CUMPLE (ID,DESCRIPTION) values ('1','1.- CUMPLE');
Insert into ESTADO_CUMPLE (ID,DESCRIPTION) values ('3','3.- NO CUMPLE');
Insert into ESTADO_CUMPLE (ID,DESCRIPTION) values ('2','2.- ATRASADO');



Insert into estado_cumple_resumen (ID,DESCRIPTION) values ('3','PROBLEMA CLIENTE');
Insert into estado_cumple_resumen (ID,DESCRIPTION) values ('4','PROBLEMA PARIS');
Insert into estado_cumple_resumen (ID,DESCRIPTION) values ('2','CUMPLIMIENTO');
Insert into estado_cumple_resumen (ID,DESCRIPTION) values ('1','ATRASADO');
Insert into estado_cumple_resumen (ID,DESCRIPTION) values ('5','SIN INFORMACION');

select * from cliente_retira;
Insert into cliente_retira (ID,DESCRIPTION) values ('9','-');
Insert into cliente_retira (ID,DESCRIPTION) values ('1','NO');
Insert into cliente_retira (ID,DESCRIPTION) values ('2','SI');


Insert into TIPO_GUIA (ID,DESCRIPTION) values ('1','-');
Insert into TIPO_GUIA (ID,DESCRIPTION) values ('2','0');
Insert into TIPO_GUIA (ID,DESCRIPTION) values ('3','4');
Insert into TIPO_GUIA (ID,DESCRIPTION) values ('4','5');
Insert into TIPO_GUIA (ID,DESCRIPTION) values ('5','6');


Insert into tipo_orden (ID,DESCRIPTION) values ('9','-');
Insert into tipo_orden (ID,DESCRIPTION) values ('4','POS Johnson');
Insert into tipo_orden (ID,DESCRIPTION) values ('2','InterCambio');
Insert into tipo_orden (ID,DESCRIPTION) values ('5','POS Paris');
Insert into tipo_orden (ID,DESCRIPTION) values ('3','Paris.cl');
Insert into tipo_orden (ID,DESCRIPTION) values ('1','Click & Collect');


Insert into tipo_venta (ID,DESCRIPTION) values ('9','-');
Insert into tipo_venta (ID,DESCRIPTION) values ('1','CD DESPACHA');
Insert into tipo_venta (ID,DESCRIPTION) values ('2','VEV CD');

Insert into venta_empresa (ID,DESCRIPTION) values ('81','-');
Insert into venta_empresa (ID,DESCRIPTION) values ('1','NO');



Insert into estado_cumplimiento (ID,DESCRIPTION) values ('21','RechaEXP');
Insert into estado_cumplimiento (ID,DESCRIPTION) values ('161','CD TURBUS - Ruta troncal');
Insert into estado_cumplimiento (ID,DESCRIPTION) values ('162','CD TURBUS - Entregado');
Insert into estado_cumplimiento (ID,DESCRIPTION) values ('3','Cliente No Est᧩');
Insert into estado_cumplimiento (ID,DESCRIPTION) values ('16','No recogido');
Insert into estado_cumplimiento (ID,DESCRIPTION) values ('99','No conocido');
Insert into estado_cumplimiento (ID,DESCRIPTION) values ('18','Preparació');
Insert into estado_cumplimiento (ID,DESCRIPTION) values ('13','NCredito');
Insert into estado_cumplimiento (ID,DESCRIPTION) values ('5','Direcci󮠅rr󮥡');
Insert into estado_cumplimiento (ID,DESCRIPTION) values ('8','En Ruta o CT');
Insert into estado_cumplimiento (ID,DESCRIPTION) values ('15','No entregado');
Insert into estado_cumplimiento (ID,DESCRIPTION) values ('19','Problema Carga Gu');
Insert into estado_cumplimiento (ID,DESCRIPTION) values ('9','Error Sistꮩco');
Insert into estado_cumplimiento (ID,DESCRIPTION) values ('6','EN FECHA');
Insert into estado_cumplimiento (ID,DESCRIPTION) values ('1','ADELANTADO');
Insert into estado_cumplimiento (ID,DESCRIPTION) values ('10','Expectativa');
Insert into estado_cumplimiento (ID,DESCRIPTION) values ('4','Dañroducto');
Insert into estado_cumplimiento (ID,DESCRIPTION) values ('14','No Cumple Condici');
Insert into estado_cumplimiento (ID,DESCRIPTION) values ('7','En Proceso de Carga');
Insert into estado_cumplimiento (ID,DESCRIPTION) values ('20','Producto No Corresponde');
Insert into estado_cumplimiento (ID,DESCRIPTION) values ('2','ATRASADO');
Insert into estado_cumplimiento (ID,DESCRIPTION) values ('12','Motivos Cliente');
Insert into estado_cumplimiento (ID,DESCRIPTION) values ('11','Motivo Transportes');
Insert into estado_cumplimiento (ID,DESCRIPTION) values ('17','Nota de Crꥩto');
Insert into estado_cumplimiento (ID,DESCRIPTION) values ('22','Pendiente');
Insert into estado_cumplimiento (ID,DESCRIPTION) values ('24','En Expedicin (Click & Collect)');
Insert into estado_cumplimiento (ID,DESCRIPTION) values ('25','Cliente No Est?');
Insert into estado_cumplimiento (ID,DESCRIPTION) values ('181','No Recogido Motivo Transporte - Defintivo');
Insert into estado_cumplimiento (ID,DESCRIPTION) values ('23','Recogido');


REM INSERTING into ESTADO_RESPONSABLE
SET DEFINE OFF;
Insert into estado_responsable (ID,DESCRIPTION) values ('6','Sin Información');
Insert into estado_responsable (ID,DESCRIPTION) values ('3','CD o Transporte');
Insert into estado_responsable (ID,DESCRIPTION) values ('8','Sistemas');
Insert into estado_responsable (ID,DESCRIPTION) values ('5','Proveedor, CD o Transporte');
Insert into estado_responsable (ID,DESCRIPTION) values ('7','Sin información');
Insert into estado_responsable (ID,DESCRIPTION) values ('4','Cliente');
Insert into estado_responsable (ID,DESCRIPTION) values ('9','Transporte');
Insert into estado_responsable (ID,DESCRIPTION) values ('2','CD');
Insert into estado_responsable (ID,DESCRIPTION) values ('1','-');

Insert into flag (ID,DESCRIPTION) values ('1','Paris'), ('2','Johnson');

Insert into gerentes (ID,DESCRIPTION,ID_PADRINO) values ('1','Gerente 1','1');
Insert into gerentes (ID,DESCRIPTION,ID_PADRINO) values ('2','Gerentes 2','2');



Insert into horario (ID,DESCRIPTION) values ('81','-');
Insert into horario (ID,DESCRIPTION) values ('4','TH');
Insert into horario (ID,DESCRIPTION) values ('1','AM');
Insert into horario (ID,DESCRIPTION) values ('3','null');
Insert into horario (ID,DESCRIPTION) values ('2','AM,PM,TH');

Insert into horario_vtav_act_stock (ID,FECHA,ESTADO) values ('26','2017-06-09 09:47:44','2');

Insert into horario_vtav_act (ID,FECHA,ESTADO) values ('26','2017-06-09 09:47:44','2');


Insert into padrinos (ID,DESCRIPTION,ID_TIENDA) values ('76','Isabel Betancourt Cabrera','1');
Insert into padrinos (ID,DESCRIPTION,ID_TIENDA) values ('162','Daniel Oliva Farias','1');
Insert into PADRINOS (ID,DESCRIPTION,ID_TIENDA) values ('242','Federico Toneguzzo Lorenzetti','1');
Insert into PADRINOS (ID,DESCRIPTION,ID_TIENDA) values ('262','Gonzalo Lamatta Contreras','1');
Insert into PADRINOS (ID,DESCRIPTION,ID_TIENDA) values ('322','Conrad Gajardo Barraza','1');
Insert into PADRINOS (ID,DESCRIPTION,ID_TIENDA) values ('442','Claudio Sanchez Leiva','1');
Insert into PADRINOS (ID,DESCRIPTION,ID_TIENDA) values ('444','Pedro Antonio Madrid Diaz','1');
Insert into PADRINOS (ID,DESCRIPTION,ID_TIENDA) values ('64','Vania Cerda Escobar','1');
Insert into PADRINOS (ID,DESCRIPTION,ID_TIENDA) values ('66','Vanessa Ester Valenzuela Diaz','1');
Insert into PADRINOS (ID,DESCRIPTION,ID_TIENDA) values ('53','Juan Alejandro Romero Veganzones','1');
Insert into PADRINOS (ID,DESCRIPTION,ID_TIENDA) values ('55','Carlos Enrique Huenul Curinao','1');
Insert into PADRINOS (ID,DESCRIPTION,ID_TIENDA) values ('68','Alexis Enrique Morales Diaz','1');
Insert into PADRINOS (ID,DESCRIPTION,ID_TIENDA) values ('70','Mauricio Montoya Araya','1');
Insert into PADRINOS (ID,DESCRIPTION,ID_TIENDA) values ('72','Amanda Munoz Alvarez','1');
Insert into PADRINOS (ID,DESCRIPTION,ID_TIENDA) values ('74','Jorge Eduardo Navarro Bustamante','1');
Insert into PADRINOS (ID,DESCRIPTION,ID_TIENDA) values ('102','Diego Reyes Godoy','1');
Insert into PADRINOS (ID,DESCRIPTION,ID_TIENDA) values ('182','Matias Ignacio Juarez Soto','1');
Insert into PADRINOS (ID,DESCRIPTION,ID_TIENDA) values ('202','Jorge Andres Lewis Gabler','1');
Insert into PADRINOS (ID,DESCRIPTION,ID_TIENDA) values ('222','Perla Dinamarca Cuevas','1');
Insert into PADRINOS (ID,DESCRIPTION,ID_TIENDA) values ('224','Hernan Ventura Pinzon','1');
Insert into PADRINOS (ID,DESCRIPTION,ID_TIENDA) values ('226','Maria Fernanda Munoz Choque','1');
Insert into PADRINOS (ID,DESCRIPTION,ID_TIENDA) values ('228','Carlo Sommaruga Hernandez','1');
Insert into PADRINOS (ID,DESCRIPTION,ID_TIENDA) values ('302','Clara Levine Lira','1');
Insert into PADRINOS (ID,DESCRIPTION,ID_TIENDA) values ('364','Miguel Angel Gonzalez Oliveros','1');
Insert into PADRINOS (ID,DESCRIPTION,ID_TIENDA) values ('366','Jimmy Adam Olivos Urrutia','1');
Insert into PADRINOS (ID,DESCRIPTION,ID_TIENDA) values ('408','Pascale Mansuy De la Cruz','1');
Insert into PADRINOS (ID,DESCRIPTION,ID_TIENDA) values ('412','Daniel Prieto','1');
Insert into PADRINOS (ID,DESCRIPTION,ID_TIENDA) values ('426','Cristian Sepulveda Brand','1');
Insert into PADRINOS (ID,DESCRIPTION,ID_TIENDA) values ('344','Juan Pablo Garrido Naudon','1');
Insert into PADRINOS (ID,DESCRIPTION,ID_TIENDA) values ('462','Juan Luis Taverne Hot','1');
Insert into PADRINOS (ID,DESCRIPTION,ID_TIENDA) values ('382','Rodrigo Soto Roman','1');
Insert into PADRINOS (ID,DESCRIPTION,ID_TIENDA) values ('342','Claudio Andrade Andrade','1');
Insert into PADRINOS (ID,DESCRIPTION,ID_TIENDA) values ('362','Ricardo Bernstein Manriquez','1');


Insert into prioridades (ID,DESCRIPTION) values ('1','Urgente');
Insert into prioridades (ID,DESCRIPTION) values ('2','Alta');
Insert into prioridades (ID,DESCRIPTION) values ('3','Medio');
Insert into prioridades (ID,DESCRIPTION) values ('4','Bajo');

Insert into reportados (ID,DESCRIPTION) values ('1','Repo');
Insert into reportados (ID,DESCRIPTION) values ('2','Repo');

Insert into SOPORTES (ID,DESCRIPTION,ID_CONTRAPARTE) values ('1','Soporte 1','1');
Insert into SOPORTES (ID,DESCRIPTION,ID_CONTRAPARTE) values ('2','Soporte 2','2');


Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('188','Antofagasta','2');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('192','Vallenar','2');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('204','Los Andes','2');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('206','San Felipe','2');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('208','San Antonio','2');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('214','Agustinas','2');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('216','Melipilla','2');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('218','Maipu Plaza','2');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('220','Mall Alameda','2');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('182','Arica','2');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('240','Chillan','2');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('256','Mega Maipu','2');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('242','Concepcion','2');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('210','Plaza Vespucio','2');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('212','Panoramico','2');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('184','Calama','2');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('186','Iquique','2');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('190','Copiapo','2');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('194','Mega La Serena','2');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('196','Mega Coquimbo','2');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('198','Ovalle','2');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('200','Mega Vina','2');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('202','Mega Quillota','2');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('222','Mega Mall del Centro','2');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('224','Mega Quilin','2');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('226','Mega Puente Alto','2');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('228','Mega Florida Center','2');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('230','Mega San Bernardo','2');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('232','Rancagua','2');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('234','San Fernando','2');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('236','Talca','2');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('238','Linares','2');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('244','Talcahuano','2');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('246','Coronel','2');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('248','Temuco','2');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('250','Valdivia','2');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('252','Punta Arenas','2');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('254','Copiapo','1');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('1','Quilicura','1');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('104','Quilin','1');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('105','La Dehesa','1');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('106','San Bernardo','1');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('107','Alameda','1');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('108','Osorno','1');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('109','Arica','1');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('110','Iquique','1');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('111','Calama','1');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('112','Antofagasta','1');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('114','Mall Serena','1');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('115','Ovalle','1');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('116','El Belloto','1');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('117','Marina Arauco','1');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('118','Valparaiso','1');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('119','San Antonio','1');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('120','Ahumada','1');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('121','Costanera Center','1');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('122','Alto las Condes','1');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('123','Bandera','1');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('124','Florida Center','1');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('125','Nunoa','1');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('126','Maipu','1');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('127','Paseo Estacion','1');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('128','Parque Arauco','1');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('129','Lyon','1');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('130','Plaza Norte','1');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('131','Plaza Tobalaba','1');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('132','Plaza Oeste','1');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('133','Plaza Vespucio','1');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('134','Rancagua','1');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('135','Rancagua Rex','1');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('136','Curico','1');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('137','Talca','1');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('138','Los Angeles','1');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('139','Barros Arana Concepcion','1');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('140','Plaza el Trebol Talcahuano','1');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('141','Plaza el Roble Chillan','1');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('142','Portal Temuco','1');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('143','Temuco Centro','1');
Insert into TIENDAS (ID,DESCRIPTION,ID_FLAG) values ('144','Puerto Montt','1');



Insert into tipo_estado_oc_vtav_stock  (ID,DESCRIPTION) values ('3','OC Mensaje Vacio');
Insert into tipo_estado_oc_vtav_stock (ID,DESCRIPTION) values ('1','Oc Correcta');
Insert into tipo_estado_oc_vtav_stock (ID,DESCRIPTION) values ('2','OC Error');


Insert into tipo_estado_oc_vtav (ID,DESCRIPTION) values ('1','Encontrado');
Insert into tipo_estado_oc_vtav (ID,DESCRIPTION) values ('2','No Encontrado');
Insert into tipo_estado_oc_vtav (ID,DESCRIPTION) values ('3','Oc con Error');



Insert into Cumplimiento_Kpiweb_Estatico (ID,ID_CUMPLE,ID_CUMPLE_RESUMEN,ID_CUMPLIMIENTO_2,ID_RESPONSABLE,ID_TIPO_ORDEN,ID_TIPO_VENTA,ID_CLIENTE_RETIRA,ID_DESC_EMP,ID_TIPOGUI,ID_HORARIO,ID_VENTA_EMPRESA,FECHA_COMPROMISO_EOM,TIPO_CUMPLIMIENTO) values ('199863','1','2','1','1','3','1','1','13','2','4','1','2017-06-06','3');
Insert into Cumplimiento_Kpiweb_Estatico (ID,ID_CUMPLE,ID_CUMPLE_RESUMEN,ID_CUMPLIMIENTO_2,ID_RESPONSABLE,ID_TIPO_ORDEN,ID_TIPO_VENTA,ID_CLIENTE_RETIRA,ID_DESC_EMP,ID_TIPOGUI,ID_HORARIO,ID_VENTA_EMPRESA,FECHA_COMPROMISO_EOM,TIPO_CUMPLIMIENTO) values ('199864','3','3','10','4','3','1','1','7','2','4','1','2017-06-06','3');
Insert into Cumplimiento_Kpiweb_Estatico (ID,ID_CUMPLE,ID_CUMPLE_RESUMEN,ID_CUMPLIMIENTO_2,ID_RESPONSABLE,ID_TIPO_ORDEN,ID_TIPO_VENTA,ID_CLIENTE_RETIRA,ID_DESC_EMP,ID_TIPOGUI,ID_HORARIO,ID_VENTA_EMPRESA,FECHA_COMPROMISO_EOM,TIPO_CUMPLIMIENTO) values ('199865','3','3','10','4','3','1','1','7','2','4','1','2017-06-06','3');
Insert into Cumplimiento_Kpiweb_Estatico (ID,ID_CUMPLE,ID_CUMPLE_RESUMEN,ID_CUMPLIMIENTO_2,ID_RESPONSABLE,ID_TIPO_ORDEN,ID_TIPO_VENTA,ID_CLIENTE_RETIRA,ID_DESC_EMP,ID_TIPOGUI,ID_HORARIO,ID_VENTA_EMPRESA,FECHA_COMPROMISO_EOM,TIPO_CUMPLIMIENTO) values ('199866','3','3','3','4','3','1','1','13','2','4','1','2017-06-06','3');
Insert into Cumplimiento_Kpiweb_Estatico (ID,ID_CUMPLE,ID_CUMPLE_RESUMEN,ID_CUMPLIMIENTO_2,ID_RESPONSABLE,ID_TIPO_ORDEN,ID_TIPO_VENTA,ID_CLIENTE_RETIRA,ID_DESC_EMP,ID_TIPOGUI,ID_HORARIO,ID_VENTA_EMPRESA,FECHA_COMPROMISO_EOM,TIPO_CUMPLIMIENTO) values ('199871','1','2','6','1','3','1','1','11','2','4','1','2017-06-06','3');
Insert into Cumplimiento_Kpiweb_Estatico (ID,ID_CUMPLE,ID_CUMPLE_RESUMEN,ID_CUMPLIMIENTO_2,ID_RESPONSABLE,ID_TIPO_ORDEN,ID_TIPO_VENTA,ID_CLIENTE_RETIRA,ID_DESC_EMP,ID_TIPOGUI,ID_HORARIO,ID_VENTA_EMPRESA,FECHA_COMPROMISO_EOM,TIPO_CUMPLIMIENTO) values ('199868','1','2','1','1','3','1','1','9','2','4','1','2017-06-06','3');
Insert into Cumplimiento_Kpiweb_Estatico (ID,ID_CUMPLE,ID_CUMPLE_RESUMEN,ID_CUMPLIMIENTO_2,ID_RESPONSABLE,ID_TIPO_ORDEN,ID_TIPO_VENTA,ID_CLIENTE_RETIRA,ID_DESC_EMP,ID_TIPOGUI,ID_HORARIO,ID_VENTA_EMPRESA,FECHA_COMPROMISO_EOM,TIPO_CUMPLIMIENTO) values ('199869','3','3','10','4','3','1','1','7','2','4','1','2017-06-06','3');
Insert into Cumplimiento_Kpiweb_Estatico (ID,ID_CUMPLE,ID_CUMPLE_RESUMEN,ID_CUMPLIMIENTO_2,ID_RESPONSABLE,ID_TIPO_ORDEN,ID_TIPO_VENTA,ID_CLIENTE_RETIRA,ID_DESC_EMP,ID_TIPOGUI,ID_HORARIO,ID_VENTA_EMPRESA,FECHA_COMPROMISO_EOM,TIPO_CUMPLIMIENTO) values ('199870','3','3','10','4','3','1','1','7','2','4','1','2017-06-06','3');
Insert into Cumplimiento_Kpiweb_Estatico (ID,ID_CUMPLE,ID_CUMPLE_RESUMEN,ID_CUMPLIMIENTO_2,ID_RESPONSABLE,ID_TIPO_ORDEN,ID_TIPO_VENTA,ID_CLIENTE_RETIRA,ID_DESC_EMP,ID_TIPOGUI,ID_HORARIO,ID_VENTA_EMPRESA,FECHA_COMPROMISO_EOM,TIPO_CUMPLIMIENTO) values ('199867','1','2','1','1','3','1','1','13','2','4','1','2017-06-06','3');


Insert into tipo_cumplimiento (ID,DESCRIPTION) values ('1','CUMPLIMIENTO');
Insert into tipo_cumplimiento (ID,DESCRIPTION) values ('2','INCUMPLIMIENTO');
Insert into tipo_cumplimiento (ID,DESCRIPTION) values ('3','DESCONOCIDO');
