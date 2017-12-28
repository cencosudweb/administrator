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
select * from TIPO_ORDEN
Insert into TIPO_ORDEN (ID,DESCRIPTION) values ('9','-');
Insert into TIPO_ORDEN (ID,DESCRIPTION) values ('4','POS Johnson');
Insert into TIPO_ORDEN (ID,DESCRIPTION) values ('2','InterCambio');
Insert into TIPO_ORDEN (ID,DESCRIPTION) values ('5','POS Paris');
Insert into TIPO_ORDEN (ID,DESCRIPTION) values ('3','Paris.cl');
Insert into TIPO_ORDEN (ID,DESCRIPTION) values ('1','Click & Collect');
Insert into TIPO_VENTA (ID,DESCRIPTION) values ('9','-');
Insert into TIPO_VENTA (ID,DESCRIPTION) values ('1','CD DESPACHA');
Insert into TIPO_VENTA (ID,DESCRIPTION) values ('2','VEV CD');
Insert into CLIENTE_RETIRA (ID,DESCRIPTION) values ('9','-');
Insert into CLIENTE_RETIRA (ID,DESCRIPTION) values ('1','NO');
Insert into CLIENTE_RETIRA (ID,DESCRIPTION) values ('2','SI');
Insert into DESCRIPCION_EMPRESA (ID,DESCRIPTION) values ('9','Stevens');
Insert into DESCRIPCION_EMPRESA (ID,DESCRIPTION) values ('4','Logistica La Frontera Ltda.');
Insert into DESCRIPCION_EMPRESA (ID,DESCRIPTION) values ('8','Sociedad De Transportes Matta Spa');
Insert into DESCRIPCION_EMPRESA (ID,DESCRIPTION) values ('3','DANIEL ALEJANDRO BERRIOS RODRIGUEZ');
Insert into DESCRIPCION_EMPRESA (ID,DESCRIPTION) values ('5','Navas Cargo SA');
Insert into DESCRIPCION_EMPRESA (ID,DESCRIPTION) values ('6','Rosa Maria Saa Diaz');
Insert into DESCRIPCION_EMPRESA (ID,DESCRIPTION) values ('13','URZUA Y AHUMADA LTDA. (PI-PAU)');
Insert into DESCRIPCION_EMPRESA (ID,DESCRIPTION) values ('12','Transportes Retail S.A');
Insert into DESCRIPCION_EMPRESA (ID,DESCRIPTION) values ('10','Transporte, Tecnologia Y Giros Egt Ltda.');
Insert into DESCRIPCION_EMPRESA (ID,DESCRIPTION) values ('11','TRANSPORTES EFRAEL Y COMPANIA LIMITIDA');
Insert into DESCRIPCION_EMPRESA (ID,DESCRIPTION) values ('2','Cencosud Retail S.A');
Insert into DESCRIPCION_EMPRESA (ID,DESCRIPTION) values ('7','SERVICIOS LOGISTICOS DGA S.A.');
Insert into DESCRIPCION_EMPRESA (ID,DESCRIPTION) values ('1','-');

Insert into TIPO_GUIA (ID,DESCRIPTION) values ('1','-');
Insert into TIPO_GUIA (ID,DESCRIPTION) values ('2','0');
Insert into TIPO_GUIA (ID,DESCRIPTION) values ('3','4');
Insert into TIPO_GUIA (ID,DESCRIPTION) values ('4','5');
Insert into TIPO_GUIA (ID,DESCRIPTION) values ('5','6');

Insert into HORARIO (ID,DESCRIPTION) values ('81','-');
Insert into HORARIO (ID,DESCRIPTION) values ('4','TH');
Insert into HORARIO (ID,DESCRIPTION) values ('1','AM');
Insert into HORARIO (ID,DESCRIPTION) values ('3','null');
Insert into HORARIO (ID,DESCRIPTION) values ('2','AM,PM,TH');

Insert into VENTA_EMPRESA (ID,DESCRIPTION) values ('81','-');
Insert into VENTA_EMPRESA (ID,DESCRIPTION) values ('1','NO');

Insert into ESTADO_CUMPLE (ID,DESCRIPTION) values ('1','1.- CUMPLE');
Insert into ESTADO_CUMPLE (ID,DESCRIPTION) values ('2','3.- NO CUMPLE');
Insert into ESTADO_CUMPLE (ID,DESCRIPTION) values ('3','2.- ATRASADO');
Insert into ESTADO_CUMPLE_RESUMEN (ID,DESCRIPTION) values ('1','CUMPLIMIENTO');
Insert into ESTADO_CUMPLE_RESUMEN (ID,DESCRIPTION) values ('2','PROBLEMA CLIENTE');
Insert into ESTADO_CUMPLE_RESUMEN (ID,DESCRIPTION) values ('3','ATRASADO');
Insert into ESTADO_CUMPLE_RESUMEN (ID,DESCRIPTION) values ('4','PROBLEMA PARIS');
Insert into ESTADO_CUMPLE_RESUMEN (ID,DESCRIPTION) values ('5','SIN INFORMACION');
Insert into ESTADO_CUMPLIMIENTO (ID,DESCRIPTION) values ('1','EN FECHA');
Insert into ESTADO_CUMPLIMIENTO (ID,DESCRIPTION) values ('2','ADELANTADO');
Insert into ESTADO_CUMPLIMIENTO (ID,DESCRIPTION) values ('3','Motivos Cliente');
Insert into ESTADO_CUMPLIMIENTO (ID,DESCRIPTION) values ('4','ATRASADO');
Insert into ESTADO_CUMPLIMIENTO (ID,DESCRIPTION) values ('5','Daño Producto');
Insert into ESTADO_CUMPLIMIENTO (ID,DESCRIPTION) values ('6','En Ruta o CT');
Insert into ESTADO_CUMPLIMIENTO (ID,DESCRIPTION) values ('7','Dirección Errónea');
Insert into ESTADO_CUMPLIMIENTO (ID,DESCRIPTION) values ('8','Expectativa');
Insert into ESTADO_CUMPLIMIENTO (ID,DESCRIPTION) values ('10','NCredito');
Insert into ESTADO_CUMPLIMIENTO (ID,DESCRIPTION) values ('11','Motivo Transportes');
Insert into ESTADO_CUMPLIMIENTO (ID,DESCRIPTION) values ('12','Problema Carga Guía');
Insert into ESTADO_CUMPLIMIENTO (ID,DESCRIPTION) values ('13','Cliente No Está');
Insert into ESTADO_CUMPLIMIENTO (ID,DESCRIPTION) values ('14','En Proceso de Carga');
Insert into ESTADO_CUMPLIMIENTO (ID,DESCRIPTION) values ('9','Producto No Corresponde');
Insert into ESTADO_RESPONSABLE (ID,DESCRIPTION) values ('1','-');
Insert into ESTADO_RESPONSABLE (ID,DESCRIPTION) values ('2','Cliente');
Insert into ESTADO_RESPONSABLE (ID,DESCRIPTION) values ('3','Proveedor, CD o Transporte');
Insert into ESTADO_RESPONSABLE (ID,DESCRIPTION) values ('4','Transporte');
Insert into ESTADO_RESPONSABLE (ID,DESCRIPTION) values ('6','Sistemas');
Insert into ESTADO_RESPONSABLE (ID,DESCRIPTION) values ('7','CD');
Insert into ESTADO_RESPONSABLE (ID,DESCRIPTION) values ('5','CD o Transporte');

Insert into AREAS (ID,DESCRIPTION) values ('61','El área de Expedición');
Insert into AREAS (ID,DESCRIPTION) values ('62','Control Interno/Adm.Cntb. Y Tesorería');
Insert into AREAS (ID,DESCRIPTION) values ('63','POS');
Insert into AREAS (ID,DESCRIPTION) values ('64','Impresoras');
Insert into AREAS (ID,DESCRIPTION) values ('65','Otros');
Insert into AREAS (ID,DESCRIPTION) values ('1','SAC');
Insert into AREAS (ID,DESCRIPTION) values ('2','Funcionamiento Quiosco');
Insert into AREAS (ID,DESCRIPTION) values ('3','Venta con Retiro en tienda (C&C y BOPIS)');
Insert into AREAS (ID,DESCRIPTION) values ('4','Bodega');

Insert into CONTRATANTES (DESCRIPTION, ID_GERENTE) values ('Contratantes 1',1);
Insert into CONTRATANTES (DESCRIPTION, ID_GERENTE) values ('Contratantes 2',2);
Insert into PADRINOS (ID,DESCRIPTION,ID_TIENDA) values ('76','Isabel Betancourt Cabrera','1');
Insert into PADRINOS (ID,DESCRIPTION,ID_TIENDA) values ('64','Vania Cerda Escobar','1');
Insert into PADRINOS (ID,DESCRIPTION,ID_TIENDA) values ('66','Vanessa Ester Valenzuela Diaz','1');
Insert into PADRINOS (ID,DESCRIPTION,ID_TIENDA) values ('53','Juan Alejandro Romero Veganzones','1');
Insert into PADRINOS (ID,DESCRIPTION,ID_TIENDA) values ('55','Carlos Enrique Huenul Curinao','1');
Insert into PADRINOS (ID,DESCRIPTION,ID_TIENDA) values ('68','Alexis Enrique Morales Diaz','1');
Insert into PADRINOS (ID,DESCRIPTION,ID_TIENDA) values ('70','Mauricio Montoya Araya','1');
Insert into PADRINOS (ID,DESCRIPTION,ID_TIENDA) values ('72','Amanda Munoz Alvarez','1');
Insert into PADRINOS (ID,DESCRIPTION,ID_TIENDA) values ('74','Jorge Eduardo Navarro Bustamante','1');
Insert into PADRINOS (ID,DESCRIPTION,ID_TIENDA) values ('51','Jose Luis (Externo - Empresa: ACL) Garrido','1');
Insert into PADRINOS (ID,DESCRIPTION,ID_TIENDA) values ('62','Alejandra Mendez Alvarez','1');
Insert into PADRINOS (ID,DESCRIPTION,ID_TIENDA) values ('78','Francisco Javier Galaz Arenas','1');
Insert into PADRINOS (ID,DESCRIPTION,ID_TIENDA) values ('80','Daniela Espinoza Diban','1');
Insert into PADRINOS (ID,DESCRIPTION,ID_TIENDA) values ('82','Paula Gálvez Mesina','1');
Insert into PADRINOS (ID,DESCRIPTION,ID_TIENDA) values ('84','Boris Lopez Araya','1');
Insert into PADRINOS (ID,DESCRIPTION,ID_TIENDA) values ('86','Rocio Suarez Raraz','1');
Insert into PADRINOS (ID,DESCRIPTION,ID_TIENDA) values ('88','Sebastian Andrez Criado Palomino','1');
Insert into PRIORIDADES (ID,DESCRIPTION) values ('1','Urgente');
Insert into PRIORIDADES (ID,DESCRIPTION) values ('2','Alta');
Insert into PRIORIDADES (ID,DESCRIPTION) values ('3','Medio');
Insert into PRIORIDADES (ID,DESCRIPTION) values ('4','Bajo');

Insert into REPORTADOS (DESCRIPTION) values ('Reportado 1');
Insert into REPORTADOS (DESCRIPTION) values ('Reportado 2');
Insert into SOPORTES (DESCRIPTION, ID_CONTRAPARTE) values ('Soporte 1', 1);
Insert into SOPORTES (DESCRIPTION, ID_CONTRAPARTE) values ('Soporte 2', 2);
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
Insert into ESTADOS (ID,DESCRIPTION) values ('1','Abierto');
Insert into ESTADOS (ID,DESCRIPTION) values ('2','Cerrado');
Insert into PAUTAS (ID,NUMERO_REQUERIMIENTO,ID_PRIORIDAD,DESCRIPCION_ISSUE,ID_REPORTADO,ID_AREA,OBSERVACION,ID_TIENDA,ID_PADRINO,ID_GERENTE,ID_CONTRATANTE,ID_SOPORTE,FECHA_VISITA,ID_ESTADO) values ('111','776','2','Equipo mal estado Registro prueba','1','1','Teclado en mal Estado','1','88','1','1','1','2017-08-18','1');
Insert into PAUTAS (ID,NUMERO_REQUERIMIENTO,ID_PRIORIDAD,DESCRIPCION_ISSUE,ID_REPORTADO,ID_AREA,OBSERVACION,ID_TIENDA,ID_PADRINO,ID_GERENTE,ID_CONTRATANTE,ID_SOPORTE,FECHA_VISITA,ID_ESTADO) values ('96','746','4','Puerta de bodega mala','1','4','para verificar el correcto ingreso','202','76','1','1','1','2017-08-31','1');
Insert into PAUTAS (ID,NUMERO_REQUERIMIENTO,ID_PRIORIDAD,DESCRIPCION_ISSUE,ID_REPORTADO,ID_AREA,OBSERVACION,ID_TIENDA,ID_PADRINO,ID_GERENTE,ID_CONTRATANTE,ID_SOPORTE,FECHA_VISITA,ID_ESTADO) values ('113','300','1','Bodega con goteras','1','4','La oficina de la bodega tiene goteras en casi todo el techo. Han tenido que sacar los papeles (como orden de despacho) fuera de la oficina y otros taparlos con Nylon Negro. 

El gerente del local Felipe Bravo, solicita el traslado de la oficina a otra parte de la bodega. Esto requerirÃ­a el cambio de los puntos de red y alimentaciÃ³n elÃ©ctrica.','210','84','1','1','1','2017-08-10','1');
Insert into PAUTAS (ID,NUMERO_REQUERIMIENTO,ID_PRIORIDAD,DESCRIPCION_ISSUE,ID_REPORTADO,ID_AREA,OBSERVACION,ID_TIENDA,ID_PADRINO,ID_GERENTE,ID_CONTRATANTE,ID_SOPORTE,FECHA_VISITA,ID_ESTADO) values ('101','382','4','No se pueden realizar ventas con tarjetas','1','63','En la caja 6 y caja 4 no se puede vender con tarjetas de crÃ©dito o dÃ©bito. 

El administrador de la tienda, Abel Gonzalez, es que no hay comunicaciÃ³n entre la maquina de transback y el POS.','210','84','1','1','1','2017-08-10','1');
Insert into PAUTAS (ID,NUMERO_REQUERIMIENTO,ID_PRIORIDAD,DESCRIPCION_ISSUE,ID_REPORTADO,ID_AREA,OBSERVACION,ID_TIENDA,ID_PADRINO,ID_GERENTE,ID_CONTRATANTE,ID_SOPORTE,FECHA_VISITA,ID_ESTADO) values ('103','106','4','Pistola Scanner no funciona','1','63','En la caja 4, existe un scanner de mano (pistola) que no funciona. 

Nota: Como el problema se presenta hasta el dÃ­a de hoy, los cajeros/vendedores, deben ingresar los productos manualmente con el teclado numÃ©rico.','210','84','1','1','1','2017-08-10','1');
Insert into PAUTAS (ID,NUMERO_REQUERIMIENTO,ID_PRIORIDAD,DESCRIPCION_ISSUE,ID_REPORTADO,ID_AREA,OBSERVACION,ID_TIENDA,ID_PADRINO,ID_GERENTE,ID_CONTRATANTE,ID_SOPORTE,FECHA_VISITA,ID_ESTADO) values ('105','125','2','Paperless con problemas','1','1','En el area de Servicio Al Cliente, al generar una nota de crÃ?Â©dito, el software Paperless presenta problemas. El problema decanta en que no genera la nota de credito o que deja de responder. Este comportamiento se presenta reiteradamente.

La Ã?Âºltima vez ocurrido este problema fue el dÃ?Â­a 09 de Agosto 2017.','210','84','1','1','1','2017-08-10','1');
Insert into PAUTAS (ID,NUMERO_REQUERIMIENTO,ID_PRIORIDAD,DESCRIPCION_ISSUE,ID_REPORTADO,ID_AREA,OBSERVACION,ID_TIENDA,ID_PADRINO,ID_GERENTE,ID_CONTRATANTE,ID_SOPORTE,FECHA_VISITA,ID_ESTADO) values ('109','355','4','Jefes sin configuraciÃ³n de impresora','1','65','El pc de los jefes de tienda fue cambiado. DespuÃ©s de ese cambio no han podido utilizar la impresora, ya que, no esta configurada para poder utilizarla.','214','84','1','1','1','2017-08-10','1');
Insert into PAUTAS (ID,NUMERO_REQUERIMIENTO,ID_PRIORIDAD,DESCRIPCION_ISSUE,ID_REPORTADO,ID_AREA,OBSERVACION,ID_TIENDA,ID_PADRINO,ID_GERENTE,ID_CONTRATANTE,ID_SOPORTE,FECHA_VISITA,ID_ESTADO) values ('107','649','3','Impresora presenta problemas de impresiÃ?Â³n','1','1','De forma reiterada, la impresora de Servicio Al Cliente, deja de imprimir. 
Una de las causantes de este problema, es que el papel se traba en la bandeja o en la secciÃ?Â³n donde se inyecta la tinta al papel.','210','84','1','1','1','2017-08-10','1');




Insert into CUADRATURA_ECOMMERCE (ID,NUMORDEN,CODDESP,FECTRANTSL,NUMCTLTSL,NUMTERTSL,NUMTRANTSL,PXQ,SKU,CANVEND,ESTORDEN,SUBESTOC,TIPVTA,TIPOPAG) values ('516964','12653072','22','20170810','32','742','4000','2990','212426999','1','99','1','1','20');
Insert into CUADRATURA_JPDTOTDAD (ID,FECHA,LOLOCA,LONIVI,NUMERO_SD,OD_EOM,NUMCORRDUP,SKU,TOTARTTSL,DEPARTTSL,CANARTTSL,MARDESTSL,NUMTERTSL,NUMTRANTSL) values ('1202589','20170810','32','P.INTERNET               ','0','0','0','97704999','3990','704','1','0','737','6404');
Insert into ECOMMERCE_SOPORTE_VENTA (ID,NUMORDEN,CODDESP,FECTRANTSL,NUMCTLTSL,NUMTERTSL,NUMTRANTSL,PXQ,SKU,CANVEND,ESTORDEN,SUBESTOC,TIPVTA,TIPOPAG,TIPO_ESTADO,TIPO_RELACION) values ('454080','113408054','0','20170810','0','16','8670','0','839612999','0','0','0','0','0','1','3');



http://10.95.5.65:8085/administrator-web/
http://172.18.170.87:8085/administrator-web/

http://192.168.50.133:8085/administrator-web/
http://192.168.50.132:8085/administrator-web/
http://172.18.148.44:8085/administrator-web/
http://172.18.148.43:8085/administrator-web/

 