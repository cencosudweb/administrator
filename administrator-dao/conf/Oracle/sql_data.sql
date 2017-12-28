INSERT INTO users (id,username,password,name,rut,email,phone,status,attempts,password_expire) VALUES (1,'admin','e10adc3949ba59abbe56e057f20f883e','Admin','15567863-1','j.garrido@lftech.cl','55442222',0,3,0);
INSERT INTO users (id,username,password,name,rut,email,phone,status,attempts,password_expire) VALUES (2,'financial','e10adc3949ba59abbe56e057f20f883e','Bco Santander','5236307-1','jose.floyd.jose@gmail.com','11223344',0,3,0);
INSERT INTO users (id,username,password,name,rut,email,phone,status,attempts,password_expire) VALUES (3,'commerce','e10adc3949ba59abbe56e057f20f883e','Pc Factory','13563067-5','jose_floyd@hotmail.com','33224411',0,3,0);
INSERT INTO authorities (id,authority,description) VALUES (1,'ROLE_ADMIN','OROV');
INSERT INTO authorities (id,authority,description) VALUES (2,'ROLE_USER_IF','Institucion Financiera');
INSERT INTO authorities (id,authority,description) VALUES (3,'ROLE_COMMERCE','Comercio');
INSERT INTO authorities (id, authority, description) VALUES (4, 'ROLE_PENDING', 'Password Pendiente');
INSERT INTO users_authorities (id_user, id_authorities) VALUES ('1', '1');
INSERT INTO users_authorities (id_user, id_authorities) VALUES ('2', '2');
INSERT INTO users_authorities (id_user, id_authorities) VALUES ('3', '3');
INSERT INTO economic_activity (id,nombre) VALUES (1,'Pub & Restaurant');
INSERT INTO economic_activity (id,nombre) VALUES (2,'Venta de equipos computacionales');
INSERT INTO economic_activity (id,nombre) VALUES (3,'Entretencion ');
INSERT INTO commerce (id,rut,razon_social,mnemotecnico,fecha_activacion,id_actividad_economica,status) VALUES (1,'9820490-3','Restauran La Casita','RLC',1366721511,1,0);
INSERT INTO commerce (id,rut,razon_social,mnemotecnico,fecha_activacion,id_actividad_economica,status) VALUES (2,'6545553-6','Pc Factory','PCF',1366721511,2,0);
INSERT INTO commerce (id,rut,razon_social,mnemotecnico,fecha_activacion,id_actividad_economica,status) VALUES (3,'23526755-1','Fantasilandia','FTA',1366721511,3,0);
INSERT INTO financial_institution (id,rut,razon_social,mnemotecnico,fecha_activacion,status,invocation_path) VALUES (1,'22164358-5','Banco Santander','BSTR',1366721511,0,'/');
INSERT INTO financial_institution (id,rut,razon_social,mnemotecnico,fecha_activacion,status,invocation_path) VALUES (2,'7702265-1','Banco Ripley','BRPY',1366721511,0,'/');
INSERT INTO financial_institution (id,rut,razon_social,mnemotecnico,fecha_activacion,status,invocation_path) VALUES (3,'8394623-7','Banco de Chile','BCHL',1366721511,0,'/');
INSERT INTO users_commerce (id,id_user,id_commerce) VALUES (1,3,2);
INSERT INTO users_financial_institution (id,id_user,id_financial_institution) VALUES (1,2,1);
INSERT INTO questions (question) VALUES ('Cual es el nombre de mi primera mascota?');
INSERT INTO questions (question) VALUES ('Cual es el segundo nombre de mi madre?');
INSERT INTO questions (question) VALUES ('Ciudad de Nacimiento?');
INSERT INTO questions (question) VALUES ('Programa favorito de TV?');
INSERT INTO questions (question) VALUES ('Banda de musica preferida?');
INSERT INTO questions (question) VALUES ('Cual es tu comida favorita?');
INSERT INTO questions_answers (question, answer) VALUES ('Lugar de nacimiento?', 'respuesta1');
INSERT INTO questions_answers (question, answer) VALUES ('Nombre madre?', 'respuesta2');
INSERT INTO questions_answers (question, answer) VALUES ('Nombre Mascota?', 'respuesta3');
INSERT INTO questions_answers (question, answer) VALUES ('Lugar de nacimiento?', 'respuesta1');
INSERT INTO questions_answers (question, answer) VALUES ('Nombre madre?', 'respuesta2');
INSERT INTO questions_answers (question, answer) VALUES ('Nombre Mascota?', 'respuesta3');
INSERT INTO questions_answers (question, answer) VALUES ('Lugar de nacimiento?', 'respuesta1');
INSERT INTO questions_answers (question, answer) VALUES ('Nombre madre?', 'respuesta2');
INSERT INTO questions_answers (question, answer) VALUES ('Lugar de nacimiento?', 'respuesta3');
INSERT INTO users_questions_answers (id_user, id_question_answer) VALUES ('1', '1');
INSERT INTO users_questions_answers (id_user, id_question_answer) VALUES ('1', '2');
INSERT INTO users_questions_answers (id_user, id_question_answer) VALUES ('1', '3');
INSERT INTO users_questions_answers (id_user, id_question_answer) VALUES ('2', '1');
INSERT INTO users_questions_answers (id_user, id_question_answer) VALUES ('2', '2');
INSERT INTO users_questions_answers (id_user, id_question_answer) VALUES ('2', '3');
INSERT INTO users_questions_answers (id_user, id_question_answer) VALUES ('3', '1');
INSERT INTO users_questions_answers (id_user, id_question_answer) VALUES ('3', '2');
INSERT INTO users_questions_answers (id_user, id_question_answer) VALUES ('3', '3');
INSERT INTO channels (description) VALUES ('Web');
INSERT INTO channels (description) VALUES ('Mobile');
INSERT INTO times_limit (description, time_limit_month) VALUES ('Semestral', 6);
INSERT INTO times_limit (description, time_limit_month) VALUES ('Anual', 12);
INSERT INTO agreement (numero_convenio, status, fecha_inicio, fecha_fin, id_time_limit, commerce_id) VALUES ('F-100', '0', '1357067794', '1387134994', '2', '1');
INSERT INTO agreement (numero_convenio, status, fecha_inicio, fecha_fin, id_time_limit, commerce_id) VALUES ('F-200', '0', '1357067794', '1387134994', '2', '1');
INSERT INTO agreement (numero_convenio, status, fecha_inicio, fecha_fin, id_time_limit, commerce_id) VALUES ('F-300', '0', '1357067794', '1387134994', '2', '2');
INSERT INTO urls_callback (id,id_agreement,end_path,confirmation_path,id_channel,confirmation_method,confirmation_output) VALUES (1,1,'www.lacasita.cl/finPago.do?idTrx=','http://security-services.taisachile.cl/security-services/bolsaonlineservice/validahorariooperacion',1,'GET','JSON');
INSERT INTO commerce_agreement_fi (commerce_id, financial_institution_id, agreement_id) VALUES (1,1,1);


INSERT INTO system_log(iduser,loglevel,action,description,data,tablename,pagename,ipaddress,creationdate,agent) VALUES (1,1,1,'User Logged in to website','/','/','PP_Intro.php','192.168.10.51',to_date('2014-03-21 09:15:00', 'YYYY-MM-DD HH24:MI:SS'),1);
Insert into CUMPLIMIENTO (ID,TC_PO_LINE_ID,CUMPL_CALC,CUMPL_EOM,CUMPL_BTK,FECHA_COMPROMISO_EOM,FECHA_COMPROMISO_BTK,ESTADO_CALCE_EOM,SUBESTADO_CALCE_EOM,FECHA_CALCE_EOM,HORA_CALCE_EOM,ESTADO_CALCE_BTK,SUBESTADO_CALCE_BTK,FECHA_CALCE_BTK,HORA_CALCE_BTK,CRUCE_ESTADO,CRUCE_SUB_ESTADO,N_SOLICITUD_CLIENTE,N_ORDEN_DISTRIBU,FECHA_CREACION_ORDEN,EST_ORDEN,ESTADO_DE_LINEA,SKU,CANT_DESC_SKU,LOCAL_VENTA,DEPART,BODEGADESP,RUTCLIENTE,NOMBRECLIENTE,APELLIDOCLIENTE,DIRECCION_CLIENTE,COD_COMUNA,COMUNA,CIUDAD,REGION,HORARIO,TIPO_ORDEN,TIPO_VENTA,O_FACILITY_ALIAS_ID,REGIONENTREGA,TIPO_DE_ORDEN,GUIA,RUT_EMP,DESC_EMP,TIPOGUI,CLIENTE_RETIRA,FECHA_PRIMER_INTENTO,NUMERO_INTENTOS,FECHA_CREA_PKT,HORA_CREA_PKT,NRO_OLA,FECHA_INICIO_OLA,HORA_INICIO_OLA,FECHA_TERMINO_OLA,HORA_TERMINO_OLA,FECHA_CIERRE_CARGA,HORA_CIERRE_CARGA,FECEMIGUI,LEAD_TIME_TRANSPORTE,DIA_SEMANA_ETA,ENTREGA_DIA_COMPROMISO,VENTA_EMPRESA,CUMPLE,CUMPLIMIENTO_2,CUMPLE_RESUMEN,BODEGA_DESPACHO,DIF_ETA_CARGA,FECHA_CARGA_REQUERIDA,EVAL_SISTEMA,EVAL_CD,EVAL_1ER_INTENTO,CUMPLIMIENTO_CLIENTE,RESPONSABLE,TIPO_CUMPLIMIENTO,LLAVE,FECHA_INGRESO) values ('8435793','2','EN FECHA','EN FECHA','EN FECHA','2017-06-20 00:00:00','2017-06-20 00:00:00','Entregado','Entregado','2017-06-20 16:15:39','16:15:39','Entregado','En Cliente','2017-06-20 15:30:26','15:30:26','Entregado','Entregado','107173672','119536472','2017-06-13 03:00:59','Shipped','Shipped','978519999','1','null','649','200','0132377235','LUISA','HERNANDEZ           SILVA','SANTA ROSA&&6811','130120','SAN RAMON','SANTIAGO','13','TH','Paris.cl','CD DESPACHA','200','RM','Paris.cl','5433849','760566306','SERVICIOS LOGISTICOS DGA S.A.','0','NO','2017-06-20 15:30:26','1',null,null,null,null,null,null,null,null,null,'2017-06-19 00:00:00','1','3','1','NO','1.- CUMPLE','EN FECHA','CUMPLIMIENTO','200','45666','2017-06-19 00:00:00','Cumple','Sin información','Cumple','-','-','CUMPLIMIENTO','107173672-978519999',to_date('28/06/17','DD/MM/RR'));
Insert into ESTADO_CUMPLE (ID,DESCRIPTION) values ('1','1.- CUMPLE');
Insert into ESTADO_CUMPLE (ID,DESCRIPTION) values ('2','2.- ATRASADO');
Insert into ESTADO_CUMPLE (ID,DESCRIPTION) values ('3','3.- NO CUMPLE');
Insert into ESTADO_CUMPLE_RESUMEN (ID,DESCRIPTION) values ('1','ATRASADO');
Insert into ESTADO_CUMPLE_RESUMEN (ID,DESCRIPTION) values ('2','CUMPLIMIENTO');
Insert into ESTADO_CUMPLE_RESUMEN (ID,DESCRIPTION) values ('3','PROBLEMA CLIENTE');
Insert into ESTADO_CUMPLE_RESUMEN (ID,DESCRIPTION) values ('4','PROBLEMA PARIS');
Insert into ESTADO_CUMPLE_RESUMEN (ID,DESCRIPTION) values ('5','SIN INFORMACION');
Insert into ESTADO_CUMPLIMIENTO (ID,DESCRIPTION) values ('1','ADELANTADO');
Insert into ESTADO_CUMPLIMIENTO (ID,DESCRIPTION) values ('2','ATRASADO');
Insert into ESTADO_CUMPLIMIENTO (ID,DESCRIPTION) values ('3','Cliente No Está');
Insert into ESTADO_CUMPLIMIENTO (ID,DESCRIPTION) values ('4','Daño Producto');
Insert into ESTADO_CUMPLIMIENTO (ID,DESCRIPTION) values ('5','Dirección Errónea');
Insert into ESTADO_CUMPLIMIENTO (ID,DESCRIPTION) values ('6','EN FECHA');
Insert into ESTADO_CUMPLIMIENTO (ID,DESCRIPTION) values ('7','En Proceso de Carga');
Insert into ESTADO_CUMPLIMIENTO (ID,DESCRIPTION) values ('8','En Ruta o CT');
Insert into ESTADO_CUMPLIMIENTO (ID,DESCRIPTION) values ('9','Error Sistémico');
Insert into ESTADO_CUMPLIMIENTO (ID,DESCRIPTION) values ('10','Expectativa');
Insert into ESTADO_CUMPLIMIENTO (ID,DESCRIPTION) values ('11','Motivo Transportes');
Insert into ESTADO_CUMPLIMIENTO (ID,DESCRIPTION) values ('12','Motivos Cliente');
Insert into ESTADO_CUMPLIMIENTO (ID,DESCRIPTION) values ('13','NCredito');
Insert into ESTADO_CUMPLIMIENTO (ID,DESCRIPTION) values ('14','No Cumple Condición');
Insert into ESTADO_CUMPLIMIENTO (ID,DESCRIPTION) values ('15','No entregado');
Insert into ESTADO_CUMPLIMIENTO (ID,DESCRIPTION) values ('16','No recogido');
Insert into ESTADO_CUMPLIMIENTO (ID,DESCRIPTION) values ('17','Nota de Crédito');
Insert into ESTADO_CUMPLIMIENTO (ID,DESCRIPTION) values ('18','Preparación CD');
Insert into ESTADO_CUMPLIMIENTO (ID,DESCRIPTION) values ('19','Problema Carga Guía');
Insert into ESTADO_CUMPLIMIENTO (ID,DESCRIPTION) values ('20','Producto No Corresponde');
Insert into ESTADO_CUMPLIMIENTO (ID,DESCRIPTION) values ('21','RechaEXP');
Insert into ESTADO_CUMPLIMIENTO (ID,DESCRIPTION) values ('22','Pendiente');
Insert into ESTADO_CUMPLIMIENTO (ID,DESCRIPTION) values ('23','Recogido');
Insert into ESTADO_CUMPLIMIENTO (ID,DESCRIPTION) values ('24','En Expedicin (Click & Collect)');
Insert into ESTADO_CUMPLIMIENTO (ID,DESCRIPTION) values ('25','Cliente No Est?');
Insert into ESTADO_CUMPLIMIENTO (ID,DESCRIPTION) values ('99','No conocido');
Insert into ESTADO_RESPONSABLE (ID,DESCRIPTION) values ('1','-');
Insert into ESTADO_RESPONSABLE (ID,DESCRIPTION) values ('2','CD');
Insert into ESTADO_RESPONSABLE (ID,DESCRIPTION) values ('3','CD o Transporte');
Insert into ESTADO_RESPONSABLE (ID,DESCRIPTION) values ('4','Cliente');
Insert into ESTADO_RESPONSABLE (ID,DESCRIPTION) values ('5','Proveedor, CD o Transporte');
Insert into ESTADO_RESPONSABLE (ID,DESCRIPTION) values ('6','Sin Información');
Insert into ESTADO_RESPONSABLE (ID,DESCRIPTION) values ('7','Sin información');
Insert into ESTADO_RESPONSABLE (ID,DESCRIPTION) values ('8','Sistemas');
Insert into ESTADO_RESPONSABLE (ID,DESCRIPTION) values ('9','Transporte');
Insert into TIPO_ORDEN (ID,DESCRIPTION) values ('1','Click & Collect');
Insert into TIPO_ORDEN (ID,DESCRIPTION) values ('2','InterCambio');
Insert into TIPO_ORDEN (ID,DESCRIPTION) values ('3','Paris.cl');
Insert into TIPO_ORDEN (ID,DESCRIPTION) values ('4','POS Johnson');
Insert into TIPO_ORDEN (ID,DESCRIPTION) values ('5','POS Paris');
Insert into TIPO_ORDEN (ID,DESCRIPTION) values ('9','-');
Insert into CLIENTE_RETIRA (ID,DESCRIPTION) values ('1','NO');
Insert into CLIENTE_RETIRA (ID,DESCRIPTION) values ('2','SI');
Insert into CLIENTE_RETIRA (ID,DESCRIPTION) values ('9','-');
Insert into DESCRIPCION_EMPRESA (ID,DESCRIPTION) values ('1','-');
Insert into DESCRIPCION_EMPRESA (ID,DESCRIPTION) values ('2','Cencosud Retail S.A');
Insert into DESCRIPCION_EMPRESA (ID,DESCRIPTION) values ('3','DANIEL ALEJANDRO BERRIOS RODRIGUEZ');
Insert into DESCRIPCION_EMPRESA (ID,DESCRIPTION) values ('4','Logistica La Frontera Ltda.');
Insert into DESCRIPCION_EMPRESA (ID,DESCRIPTION) values ('5','Navas Cargo SA');
Insert into DESCRIPCION_EMPRESA (ID,DESCRIPTION) values ('6','Rosa Maria Saa Diaz');
Insert into DESCRIPCION_EMPRESA (ID,DESCRIPTION) values ('7','SERVICIOS LOGISTICOS DGA S.A.');
Insert into DESCRIPCION_EMPRESA (ID,DESCRIPTION) values ('8','Sociedad De Transportes Matta Spa');
Insert into DESCRIPCION_EMPRESA (ID,DESCRIPTION) values ('9','Stevens');
Insert into DESCRIPCION_EMPRESA (ID,DESCRIPTION) values ('10','Transporte, Tecnologia Y Giros Egt Ltda.');
Insert into DESCRIPCION_EMPRESA (ID,DESCRIPTION) values ('11','TRANSPORTES EFRAEL Y COMPANIA LIMITIDA');
Insert into DESCRIPCION_EMPRESA (ID,DESCRIPTION) values ('12','Transportes Retail S.A');
Insert into DESCRIPCION_EMPRESA (ID,DESCRIPTION) values ('13','URZUA Y AHUMADA LTDA. (PI-PAU)');
Insert into TIPO_GUIA (ID,DESCRIPTION) values ('1','-');
Insert into TIPO_GUIA (ID,DESCRIPTION) values ('2','0');
Insert into TIPO_GUIA (ID,DESCRIPTION) values ('3','4');
Insert into TIPO_GUIA (ID,DESCRIPTION) values ('4','5');
Insert into TIPO_GUIA (ID,DESCRIPTION) values ('5','6');
Insert into HORARIO (ID,DESCRIPTION) values ('1','AM');
Insert into HORARIO (ID,DESCRIPTION) values ('2','AM,PM,TH');
Insert into HORARIO (ID,DESCRIPTION) values ('3','null');
Insert into HORARIO (ID,DESCRIPTION) values ('4','TH');
Insert into HORARIO (ID,DESCRIPTION) values ('81','-');
Insert into VENTA_EMPRESA (ID,DESCRIPTION) values ('1','NO');
Insert into VENTA_EMPRESA (ID,DESCRIPTION) values ('81','-');
Insert into CUMPLIMIENTO_KPIWEB (ID,ID_CUMPLE,ID_CUMPLE_RESUMEN,ID_CUMPLIMIENTO_2,ID_RESPONSABLE,ID_TIPO_ORDEN,ID_TIPO_VENTA,ID_CLIENTE_RETIRA,ID_DESC_EMP,ID_TIPOGUI,ID_HORARIO,ID_VENTA_EMPRESA,FECHA_COMPROMISO_EOM) values ('8959663','1','2','6','1','3','1','1','7','2','4','1','2017-05-23');
Insert into CUMPLIMIENTO_KPIWEB (ID,ID_CUMPLE,ID_CUMPLE_RESUMEN,ID_CUMPLIMIENTO_2,ID_RESPONSABLE,ID_TIPO_ORDEN,ID_TIPO_VENTA,ID_CLIENTE_RETIRA,ID_DESC_EMP,ID_TIPOGUI,ID_HORARIO,ID_VENTA_EMPRESA,FECHA_COMPROMISO_EOM) values ('8959664','1','2','6','1','3','1','1','13','2','4','1','2017-05-23');
Insert into CUMPLIMIENTO_KPIWEB (ID,ID_CUMPLE,ID_CUMPLE_RESUMEN,ID_CUMPLIMIENTO_2,ID_RESPONSABLE,ID_TIPO_ORDEN,ID_TIPO_VENTA,ID_CLIENTE_RETIRA,ID_DESC_EMP,ID_TIPOGUI,ID_HORARIO,ID_VENTA_EMPRESA,FECHA_COMPROMISO_EOM) values ('8959665','1','2','1','1','3','1','1','13','2','4','1','2017-05-23');
Insert into CUMPLIMIENTO_KPIWEB (ID,ID_CUMPLE,ID_CUMPLE_RESUMEN,ID_CUMPLIMIENTO_2,ID_RESPONSABLE,ID_TIPO_ORDEN,ID_TIPO_VENTA,ID_CLIENTE_RETIRA,ID_DESC_EMP,ID_TIPOGUI,ID_HORARIO,ID_VENTA_EMPRESA,FECHA_COMPROMISO_EOM) values ('8959666','1','2','6','1','3','1','1','11','2','4','1','2017-05-23');
Insert into CUMPLIMIENTO_KPIWEB (ID,ID_CUMPLE,ID_CUMPLE_RESUMEN,ID_CUMPLIMIENTO_2,ID_RESPONSABLE,ID_TIPO_ORDEN,ID_TIPO_VENTA,ID_CLIENTE_RETIRA,ID_DESC_EMP,ID_TIPOGUI,ID_HORARIO,ID_VENTA_EMPRESA,FECHA_COMPROMISO_EOM) values ('8959667','1','2','6','1','3','2','1','13','2','4','1','2017-05-23');
Insert into CUMPLIMIENTO_KPIWEB (ID,ID_CUMPLE,ID_CUMPLE_RESUMEN,ID_CUMPLIMIENTO_2,ID_RESPONSABLE,ID_TIPO_ORDEN,ID_TIPO_VENTA,ID_CLIENTE_RETIRA,ID_DESC_EMP,ID_TIPOGUI,ID_HORARIO,ID_VENTA_EMPRESA,FECHA_COMPROMISO_EOM) values ('8959668','1','2','1','1','5','2','1','4','2','4','1','2017-05-23');
Insert into CUMPLIMIENTO_KPIWEB (ID,ID_CUMPLE,ID_CUMPLE_RESUMEN,ID_CUMPLIMIENTO_2,ID_RESPONSABLE,ID_TIPO_ORDEN,ID_TIPO_VENTA,ID_CLIENTE_RETIRA,ID_DESC_EMP,ID_TIPOGUI,ID_HORARIO,ID_VENTA_EMPRESA,FECHA_COMPROMISO_EOM) values ('8959669','1','2','6','1','3','2','1','5','2','4','1','2017-05-23');
Insert into CUMPLIMIENTO_KPIWEB (ID,ID_CUMPLE,ID_CUMPLE_RESUMEN,ID_CUMPLIMIENTO_2,ID_RESPONSABLE,ID_TIPO_ORDEN,ID_TIPO_VENTA,ID_CLIENTE_RETIRA,ID_DESC_EMP,ID_TIPOGUI,ID_HORARIO,ID_VENTA_EMPRESA,FECHA_COMPROMISO_EOM) values ('8959670','1','2','1','1','3','2','1','4','2','4','1','2017-05-23');
Insert into CUMPLIMIENTO_KPIWEB (ID,ID_CUMPLE,ID_CUMPLE_RESUMEN,ID_CUMPLIMIENTO_2,ID_RESPONSABLE,ID_TIPO_ORDEN,ID_TIPO_VENTA,ID_CLIENTE_RETIRA,ID_DESC_EMP,ID_TIPOGUI,ID_HORARIO,ID_VENTA_EMPRESA,FECHA_COMPROMISO_EOM) values ('8959671','1','2','1','1','5','2','1','4','2','4','1','2017-05-23');
Insert into CUMPLIMIENTO_KPIWEB_ESTATICO (ID,ID_CUMPLE,ID_CUMPLE_RESUMEN,ID_CUMPLIMIENTO_2,ID_RESPONSABLE,ID_TIPO_ORDEN,ID_TIPO_VENTA,ID_CLIENTE_RETIRA,ID_DESC_EMP,ID_TIPOGUI,ID_HORARIO,ID_VENTA_EMPRESA,FECHA_COMPROMISO_EOM) values ('28743','1','2','6','1','3','1','1','11','2','4','1','2017-06-05');
Insert into CUMPLIMIENTO_KPIWEB_ESTATICO (ID,ID_CUMPLE,ID_CUMPLE_RESUMEN,ID_CUMPLIMIENTO_2,ID_RESPONSABLE,ID_TIPO_ORDEN,ID_TIPO_VENTA,ID_CLIENTE_RETIRA,ID_DESC_EMP,ID_TIPOGUI,ID_HORARIO,ID_VENTA_EMPRESA,FECHA_COMPROMISO_EOM) values ('28744','1','2','1','1','3','1','1','13','2','4','1','2017-06-05');
Insert into CUMPLIMIENTO_KPIWEB_ESTATICO (ID,ID_CUMPLE,ID_CUMPLE_RESUMEN,ID_CUMPLIMIENTO_2,ID_RESPONSABLE,ID_TIPO_ORDEN,ID_TIPO_VENTA,ID_CLIENTE_RETIRA,ID_DESC_EMP,ID_TIPOGUI,ID_HORARIO,ID_VENTA_EMPRESA,FECHA_COMPROMISO_EOM) values ('28745','1','2','1','1','3','1','1','7','2','4','1','2017-06-05');
Insert into CUMPLIMIENTO_KPIWEB_ESTATICO (ID,ID_CUMPLE,ID_CUMPLE_RESUMEN,ID_CUMPLIMIENTO_2,ID_RESPONSABLE,ID_TIPO_ORDEN,ID_TIPO_VENTA,ID_CLIENTE_RETIRA,ID_DESC_EMP,ID_TIPOGUI,ID_HORARIO,ID_VENTA_EMPRESA,FECHA_COMPROMISO_EOM) values ('28746','1','2','1','1','3','1','1','7','2','4','1','2017-06-05');
Insert into CUMPLIMIENTO_KPIWEB_ESTATICO (ID,ID_CUMPLE,ID_CUMPLE_RESUMEN,ID_CUMPLIMIENTO_2,ID_RESPONSABLE,ID_TIPO_ORDEN,ID_TIPO_VENTA,ID_CLIENTE_RETIRA,ID_DESC_EMP,ID_TIPOGUI,ID_HORARIO,ID_VENTA_EMPRESA,FECHA_COMPROMISO_EOM) values ('28747','1','2','1','1','3','1','1','3','2','4','1','2017-06-05');
Insert into CUMPLIMIENTO_KPIWEB_ESTATICO (ID,ID_CUMPLE,ID_CUMPLE_RESUMEN,ID_CUMPLIMIENTO_2,ID_RESPONSABLE,ID_TIPO_ORDEN,ID_TIPO_VENTA,ID_CLIENTE_RETIRA,ID_DESC_EMP,ID_TIPOGUI,ID_HORARIO,ID_VENTA_EMPRESA,FECHA_COMPROMISO_EOM) values ('28748','1','2','1','1','3','1','1','3','2','4','1','2017-06-05');
Insert into CUMPLIMIENTO_KPIWEB_ESTATICO (ID,ID_CUMPLE,ID_CUMPLE_RESUMEN,ID_CUMPLIMIENTO_2,ID_RESPONSABLE,ID_TIPO_ORDEN,ID_TIPO_VENTA,ID_CLIENTE_RETIRA,ID_DESC_EMP,ID_TIPOGUI,ID_HORARIO,ID_VENTA_EMPRESA,FECHA_COMPROMISO_EOM) values ('28749','1','2','6','1','3','1','1','8','2','4','1','2017-06-05');
Insert into CUMPLIMIENTO_KPIWEB_ESTATICO (ID,ID_CUMPLE,ID_CUMPLE_RESUMEN,ID_CUMPLIMIENTO_2,ID_RESPONSABLE,ID_TIPO_ORDEN,ID_TIPO_VENTA,ID_CLIENTE_RETIRA,ID_DESC_EMP,ID_TIPOGUI,ID_HORARIO,ID_VENTA_EMPRESA,FECHA_COMPROMISO_EOM) values ('28750','1','2','6','1','3','1','1','4','2','4','1','2017-06-05');
Insert into CUMPLIMIENTO_KPIWEB_ESTATICO (ID,ID_CUMPLE,ID_CUMPLE_RESUMEN,ID_CUMPLIMIENTO_2,ID_RESPONSABLE,ID_TIPO_ORDEN,ID_TIPO_VENTA,ID_CLIENTE_RETIRA,ID_DESC_EMP,ID_TIPOGUI,ID_HORARIO,ID_VENTA_EMPRESA,FECHA_COMPROMISO_EOM) values ('28751','1','2','1','1','3','1','1','4','2','4','1','2017-06-05');
Insert into CUMPLIMIENTO_ESTATICO_WS (ID,DESCRIPTION_CUMPLE,CANTIDAD_CUMPLE,PORCENTAJE_CUMPLE,DESCRIPTION_ATRASADO,CANTIDAD_ATRASADO,PORCENTAJE_ATRASADO,DESCRIPTION_NO_CUMPLE,CANTIDAD_NO_CUMPLE,PORCENTAJE_NO_CUMPLE,CANTIDAD_TOTAL,PORCENTAJE_TOTAL,FECHA_COMPROMISO_EOM) values ('188','ddd','11','11','dd','11','11','dff','11','11','11','22','2017-05-05');
Insert into CUMPLIMIENTO_ESTATICO_WS (ID,DESCRIPTION_CUMPLE,CANTIDAD_CUMPLE,PORCENTAJE_CUMPLE,DESCRIPTION_ATRASADO,CANTIDAD_ATRASADO,PORCENTAJE_ATRASADO,DESCRIPTION_NO_CUMPLE,CANTIDAD_NO_CUMPLE,PORCENTAJE_NO_CUMPLE,CANTIDAD_TOTAL,PORCENTAJE_TOTAL,FECHA_COMPROMISO_EOM) values ('192','1.- CUMPLE','5700','90,45','2.- ATRASADO','2','0,03','3.- NO CUMPLE','600','9,52','6302','100','2017-06-05');
Insert into CUMPLIMIENTO_ESTATICO_WS (ID,DESCRIPTION_CUMPLE,CANTIDAD_CUMPLE,PORCENTAJE_CUMPLE,DESCRIPTION_ATRASADO,CANTIDAD_ATRASADO,PORCENTAJE_ATRASADO,DESCRIPTION_NO_CUMPLE,CANTIDAD_NO_CUMPLE,PORCENTAJE_NO_CUMPLE,CANTIDAD_TOTAL,PORCENTAJE_TOTAL,FECHA_COMPROMISO_EOM) values ('351','1.- CUMPLE','2535','91,55','2.- ATRASADO','0','0','3.- NO CUMPLE','234','8,45','2769','100','2017-06-12');
Insert into CUMPLIMIENTO_ESTATICO_WS (ID,DESCRIPTION_CUMPLE,CANTIDAD_CUMPLE,PORCENTAJE_CUMPLE,DESCRIPTION_ATRASADO,CANTIDAD_ATRASADO,PORCENTAJE_ATRASADO,DESCRIPTION_NO_CUMPLE,CANTIDAD_NO_CUMPLE,PORCENTAJE_NO_CUMPLE,CANTIDAD_TOTAL,PORCENTAJE_TOTAL,FECHA_COMPROMISO_EOM) values ('362','1.- CUMPLE','6024','92,28','2.- ATRASADO','0','0','3.- NO CUMPLE','504','7,72','6528','100','2017-06-06');
Insert into CUMPLIMIENTO_ESTATICO_WS (ID,DESCRIPTION_CUMPLE,CANTIDAD_CUMPLE,PORCENTAJE_CUMPLE,DESCRIPTION_ATRASADO,CANTIDAD_ATRASADO,PORCENTAJE_ATRASADO,DESCRIPTION_NO_CUMPLE,CANTIDAD_NO_CUMPLE,PORCENTAJE_NO_CUMPLE,CANTIDAD_TOTAL,PORCENTAJE_TOTAL,FECHA_COMPROMISO_EOM) values ('384','1.- CUMPLE','2007','95,94','2.- ATRASADO','0','0','3.- NO CUMPLE','85','4,06','2092','100','2017-06-15');
Insert into CUMPLIMIENTO_ESTATICO_WS (ID,DESCRIPTION_CUMPLE,CANTIDAD_CUMPLE,PORCENTAJE_CUMPLE,DESCRIPTION_ATRASADO,CANTIDAD_ATRASADO,PORCENTAJE_ATRASADO,DESCRIPTION_NO_CUMPLE,CANTIDAD_NO_CUMPLE,PORCENTAJE_NO_CUMPLE,CANTIDAD_TOTAL,PORCENTAJE_TOTAL,FECHA_COMPROMISO_EOM) values ('385','1.- CUMPLE','1910','94,27','2.- ATRASADO','0','0','3.- NO CUMPLE','116','5,73','2026','100','2017-06-14');
Insert into CUMPLIMIENTO_ESTATICO_WS (ID,DESCRIPTION_CUMPLE,CANTIDAD_CUMPLE,PORCENTAJE_CUMPLE,DESCRIPTION_ATRASADO,CANTIDAD_ATRASADO,PORCENTAJE_ATRASADO,DESCRIPTION_NO_CUMPLE,CANTIDAD_NO_CUMPLE,PORCENTAJE_NO_CUMPLE,CANTIDAD_TOTAL,PORCENTAJE_TOTAL,FECHA_COMPROMISO_EOM) values ('403','1.- CUMPLE','2929','91,65','2.- ATRASADO','10','0,31','3.- NO CUMPLE','257','8,04','3196','100','2017-06-20');
Insert into CUMPLIMIENTO_ESTATICO_WS (ID,DESCRIPTION_CUMPLE,CANTIDAD_CUMPLE,PORCENTAJE_CUMPLE,DESCRIPTION_ATRASADO,CANTIDAD_ATRASADO,PORCENTAJE_ATRASADO,DESCRIPTION_NO_CUMPLE,CANTIDAD_NO_CUMPLE,PORCENTAJE_NO_CUMPLE,CANTIDAD_TOTAL,PORCENTAJE_TOTAL,FECHA_COMPROMISO_EOM) values ('422','1.- CUMPLE','2830','92,82','2.- ATRASADO','4','0,13','3.- NO CUMPLE','215','7,05','3049','100','2017-06-23');
Insert into CUMPLIMIENTO_ESTATICO_WS (ID,DESCRIPTION_CUMPLE,CANTIDAD_CUMPLE,PORCENTAJE_CUMPLE,DESCRIPTION_ATRASADO,CANTIDAD_ATRASADO,PORCENTAJE_ATRASADO,DESCRIPTION_NO_CUMPLE,CANTIDAD_NO_CUMPLE,PORCENTAJE_NO_CUMPLE,CANTIDAD_TOTAL,PORCENTAJE_TOTAL,FECHA_COMPROMISO_EOM) values ('513','1.- CUMPLE','3107','91,73','2.- ATRASADO','3','0,09','3.- NO CUMPLE','277','8,18','3387','100','2017-06-28');
Insert into TIPO_ESTADO_OC_VTAV (ID,DESCRIPTION) values ('1','Encontrado');
Insert into TIPO_ESTADO_OC_VTAV (ID,DESCRIPTION) values ('2','No Encontrado');
Insert into TIPO_ESTADO_OC_VTAV (ID,DESCRIPTION) values ('3','Oc con Error');
Insert into TIPO_ESTADO_OC_VTAV_STOCK (ID,DESCRIPTION) values ('3','OC Mensaje Vacio');
Insert into TIPO_ESTADO_OC_VTAV_STOCK (ID,DESCRIPTION) values ('1','Oc Correcta');
Insert into TIPO_ESTADO_OC_VTAV_STOCK (ID,DESCRIPTION) values ('2','OC Error');
Insert into CUADRATURA_OC_VTAV_EOM (ID,SOLICITUDORIGINAL,N_ORDEN_DISTRIBU,SOLICITUD,FECHA_CREACION_ORDEN,ORIGEN,CANCELADO) values ('239521','111358130','118780962','111358130','2017-04-27 07:00:12.000000','24440','No Cancelado');
Insert into CUADRATURA_OC_VTAV_EOM (ID,SOLICITUDORIGINAL,N_ORDEN_DISTRIBU,SOLICITUD,FECHA_CREACION_ORDEN,ORIGEN,CANCELADO) values ('239522','111338403','118761137','111338403','2017-04-26 09:42:35.000000','22593','No Cancelado');
Insert into CUADRATURA_OC_VTAV_EOM (ID,SOLICITUDORIGINAL,N_ORDEN_DISTRIBU,SOLICITUD,FECHA_CREACION_ORDEN,ORIGEN,CANCELADO) values ('239523','111336879','118761265','111336879','2017-04-26 10:00:23.000000','21588','No Cancelado');
Insert into CUADRATURA_OC_VTAV_EOM (ID,SOLICITUDORIGINAL,N_ORDEN_DISTRIBU,SOLICITUD,FECHA_CREACION_ORDEN,ORIGEN,CANCELADO) values ('239524','111358152','118780963','111358152','2017-04-27 07:00:12.000000','24440','No Cancelado');
Insert into CUADRATURA_OC_VTAV_EOM (ID,SOLICITUDORIGINAL,N_ORDEN_DISTRIBU,SOLICITUD,FECHA_CREACION_ORDEN,ORIGEN,CANCELADO) values ('239525','111336768','118761247','111336768','2017-04-26 10:00:22.000000','24374','No Cancelado');
Insert into CUADRATURA_OC_VTAV_EOM (ID,SOLICITUDORIGINAL,N_ORDEN_DISTRIBU,SOLICITUD,FECHA_CREACION_ORDEN,ORIGEN,CANCELADO) values ('239526','111336854','118761254','111336854','2017-04-26 10:00:22.000000','24440','No Cancelado');
Insert into CUADRATURA_OC_VTAV_EOM (ID,SOLICITUDORIGINAL,N_ORDEN_DISTRIBU,SOLICITUD,FECHA_CREACION_ORDEN,ORIGEN,CANCELADO) values ('239527','111336488','118761258','111336488','2017-04-26 10:00:23.000000','29750','No Cancelado');
Insert into CUADRATURA_OC_VTAV_EOM (ID,SOLICITUDORIGINAL,N_ORDEN_DISTRIBU,SOLICITUD,FECHA_CREACION_ORDEN,ORIGEN,CANCELADO) values ('239528','111336792','118761261','111336792','2017-04-26 10:00:23.000000','32014','No Cancelado');
Insert into CUADRATURA_OC_VTAV_EOM (ID,SOLICITUDORIGINAL,N_ORDEN_DISTRIBU,SOLICITUD,FECHA_CREACION_ORDEN,ORIGEN,CANCELADO) values ('239529','111336837','118761251','111336837','2017-04-26 10:00:22.000000','32644','No Cancelado');
Insert into CUADRATURA_OC_VTAV_JDA (ID,PONUMB,POVNUM,NUMDO,POFECE,POHORE,EX14ERROR,EX14FREGI,DESPA) values ('1375','449160','24374','118709208','20170423','074110','[23-04-2017 07:41] La OC se cargo correctamente                                                     ','20170423','PD ');
Insert into CUADRATURA_OC_VTAV_JDA (ID,PONUMB,POVNUM,NUMDO,POFECE,POHORE,EX14ERROR,EX14FREGI,DESPA) values ('1376','449161','24374','118709209','20170423','074110','[23-04-2017 07:41] La OC se cargo correctamente                                                     ','20170423','PD ');
Insert into CUADRATURA_OC_VTAV_JDA (ID,PONUMB,POVNUM,NUMDO,POFECE,POHORE,EX14ERROR,EX14FREGI,DESPA) values ('1377','449184','24374','118709457','20170423','123827','[23-04-2017 12:38] La OC se cargo correctamente                                                     ','20170423','PD ');
Insert into CUADRATURA_OC_VTAV_JDA (ID,PONUMB,POVNUM,NUMDO,POFECE,POHORE,EX14ERROR,EX14FREGI,DESPA) values ('1378','449185','21367','118709458','20170423','123827','[23-04-2017 12:38] La OC se cargo correctamente                                                     ','20170423','PD ');
Insert into CUADRATURA_OC_VTAV_JDA (ID,PONUMB,POVNUM,NUMDO,POFECE,POHORE,EX14ERROR,EX14FREGI,DESPA) values ('1379','449186','24374','118709459','20170423','123827','[23-04-2017 12:38] La OC se cargo correctamente                                                     ','20170423','PD ');
Insert into CUADRATURA_OC_VTAV_JDA (ID,PONUMB,POVNUM,NUMDO,POFECE,POHORE,EX14ERROR,EX14FREGI,DESPA) values ('1380','449188','21367','118709461','20170423','123827','[23-04-2017 12:38] La OC se cargo correctamente                                                     ','20170423','PD ');
Insert into CUADRATURA_OC_VTAV_JDA (ID,PONUMB,POVNUM,NUMDO,POFECE,POHORE,EX14ERROR,EX14FREGI,DESPA) values ('1381','449192','21367','118709465','20170423','123828','[23-04-2017 12:38] La OC se cargo correctamente                                                     ','20170423','PD ');
Insert into CUADRATURA_OC_VTAV_JDA (ID,PONUMB,POVNUM,NUMDO,POFECE,POHORE,EX14ERROR,EX14FREGI,DESPA) values ('1382','449193','24440','118709466','20170423','123828','[23-04-2017 12:38] La OC se cargo correctamente                                                     ','20170423','PD ');
Insert into CUADRATURA_OC_VTAV_JDA (ID,PONUMB,POVNUM,NUMDO,POFECE,POHORE,EX14ERROR,EX14FREGI,DESPA) values ('1383','449194','24374','118709467','20170423','123828','[23-04-2017 12:38] La OC se cargo correctamente                                                     ','20170423','PD ');
Insert into CUADRATURA_OC_VTAV_JDA_STOCK (ID,PONUMB,POVNUM,NUMDO,POFECE,POHORE,EX14ERROR,EX14FREGI,DESPA) values ('108193','449160','24374','118709208','20170423','074110','[23-04-2017 07:41] La OC se cargo correctamente                                                     ','20170423','PD ');
Insert into CUADRATURA_OC_VTAV_JDA_STOCK (ID,PONUMB,POVNUM,NUMDO,POFECE,POHORE,EX14ERROR,EX14FREGI,DESPA) values ('108194','449161','24374','118709209','20170423','074110','[23-04-2017 07:41] La OC se cargo correctamente                                                     ','20170423','PD ');
Insert into CUADRATURA_OC_VTAV_JDA_STOCK (ID,PONUMB,POVNUM,NUMDO,POFECE,POHORE,EX14ERROR,EX14FREGI,DESPA) values ('108195','449184','24374','118709457','20170423','123827','[23-04-2017 12:38] La OC se cargo correctamente                                                     ','20170423','PD ');
Insert into CUADRATURA_OC_VTAV_JDA_STOCK (ID,PONUMB,POVNUM,NUMDO,POFECE,POHORE,EX14ERROR,EX14FREGI,DESPA) values ('108196','449185','21367','118709458','20170423','123827','[23-04-2017 12:38] La OC se cargo correctamente                                                     ','20170423','PD ');
Insert into CUADRATURA_OC_VTAV_JDA_STOCK (ID,PONUMB,POVNUM,NUMDO,POFECE,POHORE,EX14ERROR,EX14FREGI,DESPA) values ('108197','449186','24374','118709459','20170423','123827','[23-04-2017 12:38] La OC se cargo correctamente                                                     ','20170423','PD ');
Insert into CUADRATURA_OC_VTAV_JDA_STOCK (ID,PONUMB,POVNUM,NUMDO,POFECE,POHORE,EX14ERROR,EX14FREGI,DESPA) values ('108198','449188','21367','118709461','20170423','123827','[23-04-2017 12:38] La OC se cargo correctamente                                                     ','20170423','PD ');
Insert into CUADRATURA_OC_VTAV_JDA_STOCK (ID,PONUMB,POVNUM,NUMDO,POFECE,POHORE,EX14ERROR,EX14FREGI,DESPA) values ('108199','449192','21367','118709465','20170423','123828','[23-04-2017 12:38] La OC se cargo correctamente                                                     ','20170423','PD ');
Insert into CUADRATURA_OC_VTAV_JDA_STOCK (ID,PONUMB,POVNUM,NUMDO,POFECE,POHORE,EX14ERROR,EX14FREGI,DESPA) values ('108200','449193','24440','118709466','20170423','123828','[23-04-2017 12:38] La OC se cargo correctamente                                                     ','20170423','PD ');
Insert into CUADRATURA_OC_VTAV_JDA_STOCK (ID,PONUMB,POVNUM,NUMDO,POFECE,POHORE,EX14ERROR,EX14FREGI,DESPA) values ('108201','449194','24374','118709467','20170423','123828','[23-04-2017 12:38] La OC se cargo correctamente                                                     ','20170423','PD ');
Insert into HORARIO_VTAV_ACT (ID,FECHA,ESTADO) values ('26','2017-06-09 09:47:44','2');
Insert into HORARIO_VTAV_ACT_STOCK (ID,FECHA,ESTADO) values ('26','2017-06-09 09:47:44','2');
Insert into CUADRATURA_OC_VTAV_COMPARATIVO (ID,SOLICITUDORIGINAL,N_ORDEN_DISTRIBU,SOLICITUD,FECHA_CREACION_ORDEN,CANCELADO,ESTADO,PONUMB,POVNUM,NUMDO,POFECE,POHORE,EX14ERROR,EX14FREGI,DESPA) values ('32567','111282013','118712320','111282013','2017-04-24 07:00:16.000000','No Cancelado','Encontrado','449775','24440','118712320           ','20170424','073720','[24-04-2017 07:37] La OC se cargo correctamente                                                     ','20170424','PD ');
Insert into CUADRATURA_OC_VTAV_COMPARATIVO (ID,SOLICITUDORIGINAL,N_ORDEN_DISTRIBU,SOLICITUD,FECHA_CREACION_ORDEN,CANCELADO,ESTADO,PONUMB,POVNUM,NUMDO,POFECE,POHORE,EX14ERROR,EX14FREGI,DESPA) values ('32568','111282429','118712418','111282429','2017-04-24 08:00:15.000000','No Cancelado','Encontrado','449779','32664','118712418           ','20170424','084453','[24-04-2017 08:44] La OC se cargo correctamente                                                     ','20170424','CD ');
Insert into CUADRATURA_OC_VTAV_COMPARATIVO (ID,SOLICITUDORIGINAL,N_ORDEN_DISTRIBU,SOLICITUD,FECHA_CREACION_ORDEN,CANCELADO,ESTADO,PONUMB,POVNUM,NUMDO,POFECE,POHORE,EX14ERROR,EX14FREGI,DESPA) values ('32569','111281919','118712318','111281919','2017-04-24 07:00:16.000000','No Cancelado','Encontrado','449773','24440','118712318           ','20170424','073720','[24-04-2017 07:37] La OC se cargo correctamente                                                     ','20170424','PD ');
Insert into CUADRATURA_OC_VTAV_COMPARATIVO (ID,SOLICITUDORIGINAL,N_ORDEN_DISTRIBU,SOLICITUD,FECHA_CREACION_ORDEN,CANCELADO,ESTADO,PONUMB,POVNUM,NUMDO,POFECE,POHORE,EX14ERROR,EX14FREGI,DESPA) values ('32570','111282000','118712321','111282000','2017-04-24 07:00:16.000000','No Cancelado','Encontrado','449776','24440','118712321           ','20170424','073720','[24-04-2017 07:37] La OC se cargo correctamente                                                     ','20170424','PD ');
Insert into CUADRATURA_OC_VTAV_COMPARATIVO (ID,SOLICITUDORIGINAL,N_ORDEN_DISTRIBU,SOLICITUD,FECHA_CREACION_ORDEN,CANCELADO,ESTADO,PONUMB,POVNUM,NUMDO,POFECE,POHORE,EX14ERROR,EX14FREGI,DESPA) values ('32571','111281928','118712323','111281928','2017-04-24 07:00:16.000000','No Cancelado','Encontrado','449778','32644','118712323           ','20170424','073721','[24-04-2017 07:37] La OC se cargo correctamente                                                     ','20170424','PD ');
Insert into CUADRATURA_OC_VTAV_COMPARATIVO (ID,SOLICITUDORIGINAL,N_ORDEN_DISTRIBU,SOLICITUD,FECHA_CREACION_ORDEN,CANCELADO,ESTADO,PONUMB,POVNUM,NUMDO,POFECE,POHORE,EX14ERROR,EX14FREGI,DESPA) values ('32572','111281960','118712317','111281960','2017-04-24 07:00:16.000000','No Cancelado','Encontrado','449772','33118','118712317           ','20170424','073720','[24-04-2017 07:37] La OC se cargo correctamente                                                     ','20170424','PD ');
Insert into CUADRATURA_OC_VTAV_COMPARATIVO (ID,SOLICITUDORIGINAL,N_ORDEN_DISTRIBU,SOLICITUD,FECHA_CREACION_ORDEN,CANCELADO,ESTADO,PONUMB,POVNUM,NUMDO,POFECE,POHORE,EX14ERROR,EX14FREGI,DESPA) values ('32573','111281979','118712319','111281979','2017-04-24 07:00:16.000000','No Cancelado','Encontrado','449774','21367','118712319           ','20170424','073720','[24-04-2017 07:37] La OC se cargo correctamente                                                     ','20170424','PD ');
Insert into CUADRATURA_OC_VTAV_COMPARATIVO (ID,SOLICITUDORIGINAL,N_ORDEN_DISTRIBU,SOLICITUD,FECHA_CREACION_ORDEN,CANCELADO,ESTADO,PONUMB,POVNUM,NUMDO,POFECE,POHORE,EX14ERROR,EX14FREGI,DESPA) values ('32574','111282054','118712421','111282054','2017-04-24 08:00:15.000000','No Cancelado','No Encontrado','#N/A','#N/A','#N/A','#N/A','#N/A','#N/A','#N/A','#N/A');
Insert into CUADRATURA_OC_VTAV_COMPARATIVO (ID,SOLICITUDORIGINAL,N_ORDEN_DISTRIBU,SOLICITUD,FECHA_CREACION_ORDEN,CANCELADO,ESTADO,PONUMB,POVNUM,NUMDO,POFECE,POHORE,EX14ERROR,EX14FREGI,DESPA) values ('32575','111282520','118712433','111282520','2017-04-24 08:00:15.000000','No Cancelado','Encontrado','449794','30175','118712433           ','20170424','084456','[24-04-2017 08:45] La OC se cargo correctamente                                                     ','20170424','CD ');


-- -----------------------------------------------------
-- FORMULARIOS
-- -----------------------------------------------------
Insert into TIENDAS (ID,DESCRIPTION) values ('1','Tienda 1');
Insert into TIENDAS (ID,DESCRIPTION) values ('2','Tienda 2');
Insert into PADRINOS (ID,DESCRIPTION,ID_TIENDA) values ('1','Padrino 1','1');
Insert into PADRINOS (ID,DESCRIPTION,ID_TIENDA) values ('2','Padrinos 2','2');
Insert into GERENTES (ID,DESCRIPTION,ID_PADRINO) values ('1','Gerente 1','1');
Insert into GERENTES (ID,DESCRIPTION,ID_PADRINO) values ('2','Gerentes 2','2');
Insert into CONTRATANTES (ID,DESCRIPTION,ID_GERENTE) values ('1','Contratante 1','1');
Insert into CONTRATANTES (ID,DESCRIPTION,ID_GERENTE) values ('2','Contraparte 2','2');
Insert into SOPORTES (ID,DESCRIPTION,ID_CONTRAPARTE) values ('1','Soporte 1','1');
Insert into SOPORTES (ID,DESCRIPTION,ID_CONTRAPARTE) values ('2','Soporte 2','2');
Insert into REPORTADOS (ID,DESCRIPTION) values ('1','Reportado 1');
Insert into REPORTADOS (ID,DESCRIPTION) values ('2','Reportado 2');
Insert into AREAS (ID,DESCRIPTION) values ('1','Area 1');
Insert into AREAS (ID,DESCRIPTION) values ('2','Area 2');
Insert into PRIORIDADES (ID,DESCRIPTION) values ('1','Prioridades 1');
Insert into PRIORIDADES (ID,DESCRIPTION) values ('2','Prioridades 2');

Insert into PAUTAS (ID,NUMERO_REQUERIMIENTO,ID_PRIORIDAD,DESCRIPCION_ISSUE,ID_REPORTADO,ID_AREA,OBSERVACION,ID_TIENDA,ID_PADRINO,ID_GERENTE,ID_CONTRATANTE,ID_SOPORTE,FECHA_VISITA) values ('4','1','1','Test 1','1','1','Test2','1','1','1','1','1','2017-07-19');
Insert into PAUTAS (ID,NUMERO_REQUERIMIENTO,ID_PRIORIDAD,DESCRIPCION_ISSUE,ID_REPORTADO,ID_AREA,OBSERVACION,ID_TIENDA,ID_PADRINO,ID_GERENTE,ID_CONTRATANTE,ID_SOPORTE,FECHA_VISITA) values ('5','1','2','Test 1222','2','2','Test2222','2','2','2','3','2','2017-07-19');
Insert into PAUTAS (ID,NUMERO_REQUERIMIENTO,ID_PRIORIDAD,DESCRIPCION_ISSUE,ID_REPORTADO,ID_AREA,OBSERVACION,ID_TIENDA,ID_PADRINO,ID_GERENTE,ID_CONTRATANTE,ID_SOPORTE,FECHA_VISITA) values ('7','0','1','xxx','1','1','xxxxx','1','1','1','1','1','2017-07-19');
Insert into PAUTAS (ID,NUMERO_REQUERIMIENTO,ID_PRIORIDAD,DESCRIPCION_ISSUE,ID_REPORTADO,ID_AREA,OBSERVACION,ID_TIENDA,ID_PADRINO,ID_GERENTE,ID_CONTRATANTE,ID_SOPORTE,FECHA_VISITA) values ('9','1','1','xxx1','1','1','xxxxx1','1','1','1','1','1','2017-07-19');
Insert into PAUTAS (ID,NUMERO_REQUERIMIENTO,ID_PRIORIDAD,DESCRIPCION_ISSUE,ID_REPORTADO,ID_AREA,OBSERVACION,ID_TIENDA,ID_PADRINO,ID_GERENTE,ID_CONTRATANTE,ID_SOPORTE,FECHA_VISITA) values ('11','1','1','DESC1','1','1','OBBB1','1','1','1','1','1','2017-07-19');
Insert into PAUTAS (ID,NUMERO_REQUERIMIENTO,ID_PRIORIDAD,DESCRIPCION_ISSUE,ID_REPORTADO,ID_AREA,OBSERVACION,ID_TIENDA,ID_PADRINO,ID_GERENTE,ID_CONTRATANTE,ID_SOPORTE,FECHA_VISITA) values ('13','1','1','xxx1','1','1','xxxxx1','1','1','1','1','1','2017-07-19');
Insert into PAUTAS (ID,NUMERO_REQUERIMIENTO,ID_PRIORIDAD,DESCRIPCION_ISSUE,ID_REPORTADO,ID_AREA,OBSERVACION,ID_TIENDA,ID_PADRINO,ID_GERENTE,ID_CONTRATANTE,ID_SOPORTE,FECHA_VISITA) values ('15','217','1','1111111111111','1','1','1111111111111','1','1','1','2','1','2017-07-19');
Insert into PAUTAS (ID,NUMERO_REQUERIMIENTO,ID_PRIORIDAD,DESCRIPCION_ISSUE,ID_REPORTADO,ID_AREA,OBSERVACION,ID_TIENDA,ID_PADRINO,ID_GERENTE,ID_CONTRATANTE,ID_SOPORTE,FECHA_VISITA) values ('17','825','1',',aaaaaaaaaaaa,dddddddd','1','1',',aaaaaaaaaaaaaa,ddddddddddddd','1','1','1','1','1','2017-07-19');
Insert into PAUTAS (ID,NUMERO_REQUERIMIENTO,ID_PRIORIDAD,DESCRIPCION_ISSUE,ID_REPORTADO,ID_AREA,OBSERVACION,ID_TIENDA,ID_PADRINO,ID_GERENTE,ID_CONTRATANTE,ID_SOPORTE,FECHA_VISITA) values ('19','481','1','sasasasa','1','1','sasasasas','1','1','1','1','1','2017-07-19');


http://10.95.5.65:8085/administrator-web/admin/savePauta
http://172.18.170.87:8085/administrator-web/admin/savePauta

http://192.168.50.133:8085/administrator-web/admin/savePauta
http://192.168.50.132:8085/administrator-web/admin/savePauta
http://172.18.148.44:8085/administrator-web/admin/savePauta
http://172.18.148.43:8085/administrator-web/admin/savePauta

 