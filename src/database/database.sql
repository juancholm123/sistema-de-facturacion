create database facturacion;

use facturacion;

create table persona(id_persona int not null);
alter table persona add column fk_rol int not null;
alter table persona add column fk_municipio int not null;
alter table persona add column documento int(10) not null;
alter table persona add column p_nombre varchar(50) not null;
alter table persona add column s_nombre varchar(50)  null;
alter table persona add column p_apellido varchar(50) not null;
alter table persona add column s_apellido varchar(50) not null;

create table municipio(id_municipio int not null);
alter table municipio add column fk_departamento int not null;
alter table municipio add column municipio varchar(50) not null;

create table departamento(id_departamento int not null);
alter table departamento add column departamento varchar(50) not null;

create table direccion(id_direccion int not null);
alter table direccion add column fk_persona int  null;
alter table direccion add column fk_empresa int  null;
alter table direccion add column direccion varchar(50) not null;
alter table direccion add column barrio varchar(50) not null;

create table telefono(id_telefono int not null);
alter table telefono add column fk_persona int not null;
alter table telefono add column numero int(11) not null;

create table rol(id_rol int not null);
alter table rol add column rol varchar(50) not null;
alter table rol add column estado boolean not null;


create table empresa(id_empresa int not null);
alter table empresa add column fk_municipio int not null;
alter table empresa add column empresa varchar(50) not null;
alter table empresa add column descripcion text not null;

create table persona_pertenece_empresa(id_persona int not null);
alter table persona_pertenece_empresa add column id_empresa int not null;
alter table persona_pertenece_empresa add column fecha date not null;
alter table persona_pertenece_empresa add column estado boolean not null;

create table producto(id_producto int not null);
alter table producto add column fk_empresa int  not null;
alter table producto add column producto varchar(50) not null;
alter table producto add column descripcion text not null;
alter table producto add column estado enum('AGOTADO','DISPONIBLE') not null;

create table precio(id_precio int not null);
alter table precio add column fk_producto int not null;
alter table precio add column fk_medida int not null;
alter table precio add column precio double not null;

create table medida(id_medida int not null);
alter table medida add column medida varchar(50)  not null;

create table medida_tiene_producto(id_medida int not null);
alter table medida_tiene_producto add column id_producto int  not null;
alter table medida_tiene_producto add column estado boolean  not null;

create table pedido(id_pedido int not null);
alter table pedido add column fk_persona int  not null;
alter table pedido add column total double not null;
alter table pedido add column fecha date not null;
alter table pedido add column estado varchar(100) not null;

create table pedido_tiene_producto(id_pedido int not null);
alter table pedido_tiene_producto add column id_producto int  not null;
alter table pedido_tiene_producto add column cantidad int  not null; 
alter table pedido_tiene_producto add column total double  not null; 

----Laves Primarias----
alter table persona add constraint pk_persona primary key(id_persona);
alter table municipio add constraint pk_municipio primary key(id_municipio);
alter table departamento add constraint pk_departamento primary key(id_departamento);
alter table direccion add constraint pk_direccion primary key(id_direccion);
alter table telefono add constraint pk_telefono primary key(id_telefono);
alter table rol add constraint pk_rol primary key(id_rol);
alter table empresa add constraint pk_empresa primary key(id_empresa);
alter table pedido add constraint pk_pedido primary key(id_pedido);
alter table producto add constraint pk_producto primary key(id_producto);
alter table medida add constraint pk_medida primary key(id_medida);
alter table precio add constraint pk_precio primary key(id_precio);
alter table persona_pertenece_empresa add constraint pk_persona_pertenece_empresa primary key(id_persona, id_empresa);
alter table pedido_tiene_producto add constraint pk_pedido_tiene_producto primary key(id_pedido, id_producto);
alter table medida_tiene_producto add constraint pk_medida_tiene_producto primary key(id_medida, id_producto);

----Auto Increment----
alter table persona modify id_persona int auto_increment;
alter table municipio modify id_municipio int auto_increment;
alter table departamento modify id_departamento int auto_increment;
alter table direccion modify id_direccion int auto_increment;
alter table telefono modify id_telefono int auto_increment;
alter table rol modify id_rol int auto_increment;
alter table empresa modify id_empresa int auto_increment;
alter table pedido modify id_pedido int auto_increment;
alter table producto modify id_producto int auto_increment;
alter table medida modify id_medida int auto_increment;
alter table precio modify id_precio int auto_increment;
----Laves Foraneas----
alter table persona add constraint fk_p_rol foreign key(fk_rol)references rol(id_rol);
alter table persona add constraint fk_p_municipio foreign key(fk_municipio)references municipio(id_municipio);
alter table telefono add constraint fk_t_persona foreign key(fk_persona)references persona(id_persona);
alter table municipio add constraint fk_m_depertamento foreign key(fk_departamento)references departamento(id_departamento);
alter table direccion add constraint fk_d_persona foreign key(fk_persona)references persona(id_persona);
alter table direccion add constraint fk_d_empresa foreign key(fk_empresa)references empresa(id_empresa);
alter table empresa add constraint fk_e_municipio foreign key(fk_municipio)references municipio(id_municipio);
alter table pedido add constraint fk_pe_persona foreign key(fk_persona)references persona(id_persona);
alter table producto add constraint fk_pro_empresa foreign key(fk_empresa)references empresa(id_empresa);
alter table  precio add constraint fk_pre_producto foreign key(fk_producto)references producto(id_producto); 
alter table  precio add constraint fk_pre_medida foreign key(fk_medida)references medida(id_medida); 
alter table persona_pertenece_empresa add constraint fk_persona_pertenece_empresa foreign key(id_empresa)references empresa(id_empresa);
alter table persona_pertenece_empresa add constraint fk_empre_pertenece_perso foreign key(id_persona)references persona(id_persona); 
alter table  pedido_tiene_producto add constraint fk_pedido_tiene_producto foreign key(id_pedido)references pedido(id_pedido); 
alter table  pedido_tiene_producto add constraint fk_pedi_tiene_pro foreign key(id_producto)references producto(id_producto); 
alter table  medida_tiene_producto add constraint fk_medida_tiene_producto foreign key(id_medida)references medida(id_medida); 
alter table  medida_tiene_producto add constraint fk_medi_tiene_pro foreign key(id_producto)references producto(id_producto); 

-------Datos----------

insert into rol(rol,estado)values('ADMIN',1);
insert into rol(rol,estado)values('TRABAJADOR',1);
insert into rol(rol,estado)values('CLIENTE',1);

insert into persona (fk_rol,fk_municipio,documento,p_nombre,s_nombre,p_apellido,s_apellido)values(1,365,1117552690,'JUAN','CAMILO','LOPEZ',' MARIN');

insert into empresa (fk_municipio,empresa,descripcion)values(365,'JL','EMPRESA DEDICADA AL DESARROLLO DE SOFTWARE');

insert into empresa (fk_municipio,empresa,descripcion)values(365,'JP','EMPRESA DEDICADA AL DESARROLLO DE SOFTWARE');

insert into empresa (fk_municipio,empresa,descripcion)values(365,'JS','EMPRESA DEDICADA AL DESARROLLO DE SOFTWARE');

insert into persona_pertenece_empresa(id_persona,id_empresa,fecha,estado)values(1,1,NOW(),1);

insert into medida(medida)values('UNIDAD');
insert into medida(medida)values('KG');
insert into medida(medida)values('LG');
insert into medida(medida)values('ARROBA');



insert into producto(fk_empresa,producto,descripcion,estado)values(1,'PAPA AMARILLA','PAPA AMARILLA EN EXCELENTE ESTADO',2); 

insert into precio(fk_producto,fk_medida,precio)values(1,2,2000);

insert into telefono(fk_persona,numero)values(1,3222189406); 

insert into direccion(fk_persona,direccion,barrio)values(1,'CARRERA13A#10A49','JUAN XXlll'); 
insert into direccion(fk_empresa,direccion,barrio)values(1,'CARRERA13A#10A49','JUAN XXlll'); 




insert into departamento (departamento) values
('ANTIOQUIA'),
('ATLANTICO'),
('D. C. SANTA FE DE BOGOTÁ'),
('BOLIVAR'),
('BOYACA'),
('CALDAS'),
('CAQUETA'),
('CAUCA'),
('CESAR'),
('CORDOVA'),
('CUNDINAMARCA'),
('CHOCO'),
('HUILA'),
('LA GUAJIRA'),
('MAGDALENA'),
('META'),
('NARIÑO'),
('NORTE DE SANTANDER'),
('QUINDIO'),
('RISARALDA'),
('SANTANDER'),
('SUCRE'),
('TOLIMA'),
('VALLE'),
('ARAUCA'),
('CASANARE'),
('PUTUMAYO'),
('SAN ANDRES'),
('AMAZONAS'),
('GUAINIA'),
('GUAVIARE'),
('VAUPES'),
('VICHADA');


insert into municipio (fk_departamento, municipio) values
( 1,'MEDELLIN'),
( 1,'ABEJORRAL'),
( 1,'ABRIAQUI'),
( 1,'ALEJANDRIA'),
( 1, 'AMAGA'),
( 1, 'AMALFI'),
( 1, 'ANDES'),
( 1, 'ANGELOPOLIS'),
( 1, 'ANGOSTURA'),
( 1, 'ANORI'),
( 1, 'ANTIOQUIA'),
( 1, 'ANZA'),
( 1, 'APARTADO'),
( 1, 'ARBOLETES'),
( 1, 'ARGELIA'),
( 1, 'ARMENIA'),
( 1, 'BARBOSA'),
( 1, 'BELMIRA'),
( 1, 'BELLO'),
( 1, 'BETANIA'),
( 1, 'BETULIA'),
( 1, 'BOLIVAR'),
( 1, 'BRICEÑO'),
( 1, 'BURITICA'),
( 1, 'CACERES'),
( 1, 'CAICEDO'),
( 1, 'CALDAS'),
( 1, 'CAMPAMENTO'),
( 1, 'CAÑASGORDAS'),
( 1, 'CARACOLI'),
(1, 'CARAMANTA'),
(1, 'CAREPA'),
(1, 'CARMEN DE VIBORAL'),
(1, 'CAROLINA'),
(1, 'CAUCASIA'),
(1, 'CHIGORODO'),
(1, 'CISNEROS'),
(1, 'COCORNA'),
(1, 'CONCEPCION'),
(1, 'CONCORDIA'),
(1, 'COPACABANA'),
(1, 'DABEIBA'),
(1, 'DON MATIAS'),
(1, 'EBEJICO'),
(1, 'EL BAGRE'),
(1, 'ENTRERRIOS'),
(1, 'ENVIGADO'),
(1, 'FREDONIA'),
(1, 'FRONTINO'),
(1, 'GIRALDO'),
(1, 'GIRARDOTA'),
(1, 'GOMEZ PLATA'),
(1, 'GRANADA'),
(1, 'GUADALUPE'),
(1, 'GUARNE'),
(1, 'GUATAPE'),
(1, 'HELICONIA'),
(1, 'HISPANIA'),
(1, 'ITAGUI'),
(1, 'ITUANGO'),
(1, 'JARDIN'),
(1, 'JERICO'),
(1, 'LA CEJA'),
(1, 'LA ESTRELLA'),
(1, 'LA PINTADA'),
(1, 'LA UNION'),
(1, 'LIBORINA'),
(1, 'MACEO'),
(1, 'MARINILLA'),
(1, 'MONTEBELLO'),
(1, 'MURINDO'),
(1, 'MUTATA'),
(1, 'NARIÑO'),
(1, 'NECOCLI'),
(1, 'NECHI'),
(1, 'OLAYA'),
(1, 'PEÑOL'),
(1, 'PEQUE'),
(1, 'PUEBLORRICO'),
(1, 'PUERTO BERRIO'),
(1, 'PUERTO NARE (LA MAGDALENA)'),
(1, 'PUERTO TRIUNFO'),
(1, 'REMEDIOS'),
(1, 'RETIRO'),
(1, 'RIONEGRO'),
(1, 'SABANALARGA'),
(1, 'SABANETA'),
(1, 'SALGAR'),
(1, 'SAN ANDRES'),
(1, 'SAN CARLOS'),
(1, 'SAN FRANCISCO'),
(1, 'SAN JERONIMO'),
(1, 'SAN JOSE DE LA MONTAÑA'),
(1, 'SAN JUAN DE URABA'),
(1, 'SAN LUIS'),
(1, 'SAN PEDRO'),
(1, 'SAN PEDRO DE URABA'),
(1, 'SAN RAFAEL'),
(1, 'SAN ROQUE'),
( 1, 'SAN VICENTE'),
( 1, 'SANTA BARBARA'),
( 1, 'SANTA ROSA DE OSOS'),
( 1, 'SANTO DOMINGO'),
( 1, 'SANTUARIO'),
( 1, 'SEGOVIA'),
( 1, 'SONSON'),
( 1, 'SOPETRAN'),
( 1, 'TAMESIS'),
( 1, 'TARAZA'),
( 1, 'TARSO'),
( 1, 'TITIRIBI'),
( 1, 'TOLEDO'),
( 1, 'TURBO'),
( 1, 'URAMITA'),
( 1, 'URRAO'),
( 1, 'VALDIVIA'),
( 1, 'VALPARAISO'),
( 1, 'VEGACHI'),
( 1, 'VENECIA'),
( 1, 'VIGIA DEL FUERTE'),
( 1, 'YALI'),
( 1, 'YARUMAL'),
( 1, 'YOLOMBO'),
( 1, 'YONDO'),
( 1, 'ZARAGOZA'),
( 2, 'BARRANQUILLA (DISTRITO ESPECIAL INDUSTRIAL Y PORTUARIO DE BARRANQUILLA)'),
( 2, 'BARANOA'),
( 2, 'CAMPO DE LA CRUZ'),
( 2, 'CANDELARIA'),
( 2, 'GALAPA'),
( 2, 'JUAN DE ACOSTA'),
( 2, 'LURUACO'),
( 2, 'MALAMBO'),
( 2, 'MANATI'),
( 2, 'PALMAR DE VARELA'),
( 2, 'PIOJO'),
( 2, 'POLO NUEVO'),
( 2, 'PONEDERA'),
( 2, 'PUERTO COLOMBIA'),
( 2, 'REPELON'),
( 2, 'SABANAGRANDE'),
( 2, 'SABANALARGA'),
( 2, 'SANTA LUCIA'),
( 2, 'SANTO TOMAS'),
( 2, 'SOLEDAD'),
( 2, 'SUAN'),
( 2, 'TUBARA'),
( 2, 'USIACURI'),
( 3, 'Santa Fe de Bogotá'),
( 3, 'USAQUEN'),
( 3, 'CHAPINERO'),
( 3, 'SANTA FE'),
( 3, 'SAN CRISTOBAL'),
( 3, 'USME'),
( 3, 'TUNJUELITO'),
( 3, 'BOSA'),
( 3, 'KENNEDY'),
( 3, 'FONTIBON'),
( 3, 'ENGATIVA'),
( 3, 'SUBA'),
( 3, 'BARRIOS UNIDOS'),
( 3, 'TEUSAQUILLO'),
( 3, 'MARTIRES'),
( 3, 'ANTONIO NARIÑO'),
( 3, 'PUENTE ARANDA'),
( 3, 'CANDELARIA'),
( 3, 'RAFAEL URIBE'),
( 3, 'CIUDAD BOLIVAR'),
( 3, 'SUMAPAZ'),
( 4, 'CARTAGENA (DISTRITO TURISTICO Y CULTURAL DE CARTAGENA)'),
( 4, 'ACHI'),
( 4, 'ALTOS DEL ROSARIO'),
( 4, 'ARENAL'),
( 4, 'ARJONA'),
( 4, 'ARROYOHONDO'),
( 4, 'BARRANCO DE LOBA'),
( 4, 'CALAMAR'),
( 4, 'CANTAGALLO'),
( 4, 'CICUCO'),
( 4, 'CORDOBA'),
( 4, 'CLEMENCIA'),
( 4, 'EL CARMEN DE BOLIVAR'),
( 4, 'EL GUAMO'),
( 4, 'EL PEÑON'),
( 4, 'HATILLO DE LOBA'),
( 4, 'MAGANGUE'),
( 4, 'MAHATES'),
( 4, 'MARGARITA'),
( 4, 'MARIA LA BAJA'),
( 4, 'MONTECRISTO'),
( 4, 'MOMPOS'),
( 4, 'MORALES'),
( 4, 'PINILLOS'),
( 4, 'REGIDOR'),
( 4, 'RIO VIEJO'),
( 4, 'SAN CRISTOBAL'),
( 4, 'SAN ESTANISLAO'),
( 4, 'SAN FERNANDO'),
( 4, 'SAN JACINTO'),
( 4, 'SAN JACINTO DEL CAUCA'),
( 4, 'SAN JUAN NEPOMUCENO'),
( 4, 'SAN MARTIN DE LOBA'),
( 4, 'SAN PABLO'),
( 4, 'SANTA CATALINA'),
( 4, 'SANTA ROSA'),
( 4, 'SANTA ROSA DEL SUR'),
( 4, 'SIMITI'),
( 4, 'SOPLAVIENTO'),
( 4, 'TALAIGUA NUEVO'),
( 4, 'TIQUISIO (PUERTO RICO)'),
( 4, 'TURBACO'),
( 4, 'TURBANA'),
( 4, 'VILLANUEVA'),
( 4, 'ZAMBRANO'),
( 5,'TUNJA'),
( 5, 'ALMEIDA'),
( 5, 'AQUITANIA'),
( 5, 'ARCABUCO'),
( 5, 'BELEN'),
( 5, 'BERBEO'),
( 5, 'BETEITIVA'),
( 5, 'BOAVITA'),
( 5, 'BOYACA'),
( 5, 'BRICEÑO'),
( 5, 'BUENAVISTA'),
( 5, 'BUSBANZA'),
( 5, 'CALDAS'),
( 5, 'CAMPOHERMOSO'),
( 5, 'CERINZA'),
( 5, 'CHINAVITA'),
( 5, 'CHIQUINQUIRA'),
( 5, 'CHISCAS'),
( 5, 'CHITA'),
( 5, 'CHITARAQUE'),
( 5, 'CHIVATA'),
( 5, 'CIENEGA'),
( 5, 'COMBITA'),
( 5, 'COPER'),
( 5, 'CORRALES'),
( 5, 'COVARACHIA'),
( 5, 'CUBARA'),
( 5, 'CUCAITA'),
( 5, 'CUITIVA'),
( 5, 'CHIQUIZA'),
( 5, 'CHIVOR'),
( 5, 'DUITAMA'),
( 5, 'EL COCUY'),
( 5, 'EL ESPINO'),
( 5, 'FIRAVITOBA'),
( 5, 'FLORESTA'),
( 5, 'GACHANTIVA'),
( 5, 'GAMEZA'),
( 5, 'GARAGOA'),
( 5, 'GUACAMAYAS'),
( 5, 'GUATEQUE'),
( 5, 'GUAYATA'),
( 5, 'GUICAN'),
( 5, 'IZA'),
( 5, 'JENESANO'),
( 5, 'JERICO'),
( 5, 'LABRANZAGRANDE'),
( 5, 'LA CAPILLA'),
( 5, 'LA VICTORIA'),
( 5, 'LA UVITA'),
( 5, 'VILLA DE LEIVA'),
( 5, 'MACANAL'),
( 5, 'MARIPI'),
( 5, 'MIRAFLORES'),
( 5, 'MONGUA'),
( 5, 'MONGUI'),
( 5, 'MONIQUIRA'),
( 5, 'MOTAVITA'),
( 5, 'MUZO'),
( 5, 'NOBSA'),
( 5, 'NUEVO COLON'),
( 5, 'OICATA'),
( 5, 'OTANCHE'),
( 5, 'PACHAVITA'),
( 5, 'PAEZ'),
( 5, 'PAIPA'),
( 5, 'PAJARITO'),
( 5, 'PANQUEBA'),
( 5, 'PAUNA'),
( 5, 'PAYA'),
( 5, 'PAZ DEL RIO'),
( 5, 'PESCA'),
( 5, 'PISBA'),
( 5, 'PUERTO BOYACA'),
( 5, 'QUIPAMA'),
( 5, 'RAMIRIQUI'),
( 5, 'RAQUIRA'),
( 5, 'RONDON'),
( 5, 'SABOYA'),
( 5, 'SACHICA'),
( 5, 'SAMACA'),
( 5, 'SAN EDUARDO'),
( 5, 'SAN JOSE DE PARE'),
( 5, 'SAN LUIS DE GACENO'),
( 5, 'SAN MATEO'),
( 5, 'SAN MIGUEL DE SEMA'),
( 5, 'SAN PABLO DE BORBUR'),
( 5, 'SANTANA'),
( 5, 'SANTA MARIA'),
( 5, 'SANTA ROSA DE VITERBO'),
( 5, 'SANTA SOFIA'),
( 5, 'SATIVANORTE'),
( 5, 'SATIVASUR'),
( 5, 'SIACHOQUE'),
( 5, 'SOATA'),
( 5, 'SOCOTA'),
( 5, 'SOCHA'),
( 5, 'SOGAMOSO'),
( 5, 'SOMONDOCO'),
( 5, 'SORA'),
( 5, 'SOTAQUIRA'),
( 5, 'SORACA'),
( 5, 'SUSACON'),
( 5, 'SUTAMARCHAN'),
( 5, 'SUTATENZA'),
( 5, 'TASCO'),
( 5, 'TENZA'),
( 5, 'TIBANA'),
( 5, 'TIBASOSA'),
( 5, 'TINJACA'),
( 5, 'TIPACOQUE'),
( 5, 'TOCA'),
( 5, 'TOGUI'),
( 5, 'TOPAGA'),
( 5, 'TOTA'),
( 5, 'TUNUNGUA'),
( 5, 'TURMEQUE'),
( 5, 'TUTA'),
( 5, 'TUTASA'),
( 5, 'UMBITA'),
( 5, 'VENTAQUEMADA'),
( 5, 'VIRACACHA'),
( 5, 'ZETAQUIRA'),
( 6, 'MANIZALES'),
( 6, 'AGUADAS'),
( 6, 'ANSERMA'),
( 6, 'ARANZAZU'),
( 6, 'BELALCAZAR'),
( 6, 'CHINCHINA'),
( 6, 'FILADELFIA'),
( 6, 'LA DORADA'),
( 6, 'LA MERCED'),
( 6, 'MANZANARES'),
( 6, 'MARMATO'),
( 6, 'MARQUETALIA'),
( 6, 'MARULANDA'),
( 6, 'NEIRA'),
( 6, 'NORCASIA'),
( 6, 'PACORA'),
( 6, 'PALESTINA'),
( 6, 'PENSILVANIA'),
( 6, 'RIOSUCIO'),
( 6, 'RISARALDA'),
( 6, 'SALAMINA'),
( 6, 'SAMANA'),
( 6, 'SAN JOSE'),
( 6, 'SUPIA'),
( 6, 'VICTORIA'),
( 6, 'VILLAMARIA'),
( 6, 'VITERBO'),
( 7, 'FLORENCIA'),
( 7, 'ALBANIA'),
( 7, 'BELEN DE LOS ANDAQUIES'),
( 7, 'CARTAGENA DEL CHAIRA'),
( 7, 'CURILLO'),
( 7, 'EL DONCELLO'),
( 7, 'EL PAUJIL'),
( 7, 'LA MONTAÑITA'),
( 7, 'MILAN'),
( 7, 'MORELIA'),
( 7, 'PUERTO RICO'),
( 7, 'SAN JOSE DE FRAGUA'),
( 7, 'SAN VICENTE DEL CAGUAN'),
( 7, 'SOLANO'),
( 7, 'SOLITA'),
( 7, 'VALPARAISO'),
( 8,  'POPAYAN'),
( 8,  'ALMAGUER'),
( 8,  'ARGELIA'),
( 8,  'BALBOA'),
( 8, 'BOLIVAR'),
( 8, 'BUENOS AIRES'),
( 8, 'CAJIBIO'),
( 8, 'CALDONO'),
( 8, 'CALOTO'),
( 8, 'CORINTO'),
( 8, 'EL TAMBO'),
( 8, 'FLORENCIA'),
( 8, 'GUAPI'),
( 8, 'INZA'),
( 8, 'JAMBALO'),
( 8, 'LA SIERRA'),
( 8, 'LA VEGA'),
( 8, 'LOPEZ (MICAY)'),
( 8, 'MERCADERES'),
( 8, 'MIRANDA'),
( 8, 'MORALES'),
( 8, 'PADILLA'),
( 8, 'PAEZ (BELALCAZAR)'),
( 8, 'PATIA (EL BORDO)'),
( 8, 'PIAMONTE'),
( 8, 'PIENDAMO'),
( 8, 'PUERTO TEJADA'),
( 8, 'PURACE (COCONUCO)'),
( 8, 'ROSAS'),
( 8, 'SAN SEBASTIAN'),
( 8, 'SANTANDER DE QUILICHAO'),
( 8, 'SANTA ROSA'),
( 8, 'SILVIA'),
( 8, 'SOTARA (PAISPAMBA)'),
( 8, 'SUAREZ'),
( 8, 'TIMBIO'),
( 8, 'TIMBIQUI'),
( 8, 'TORIBIO'),
( 8, 'TOTORO'),
( 8, 'VILLARICA'),
( 9,  'VALLEDUPAR'),
( 9,  'AGUACHICA'),
( 9,  'AGUSTIN CODAZZI'),
( 9,  'ASTREA'),
( 9,  'BECERRIL'),
( 9,  'BOSCONIA'),
( 9,  'CHIMICHAGUA'),
( 9,  'CHIRIGUANA'),
( 9,  'CURUMANI'),
( 9,  'EL COPEY'),
( 9,  'EL PASO'),
( 9,  'GAMARRA'),
( 9,  'GONZALEZ'),
( 9,  'LA GLORIA'),
( 9,  'LA JAGUA IBIRICO'),
( 9,  'MANAURE (BALCON DEL CESAR)'),
( 9,  'PAILITAS'),
( 9,  'PELAYA'),
( 9,  'PUEBLO BELLO'),
( 9,  'RIO DE ORO'),
( 9,  'LA PAZ (ROBLES)'),
( 9,  'SAN ALBERTO'),
( 9,  'SAN DIEGO'),
( 9,  'SAN MARTIN'),
( 9,  'TAMALAMEQUE'),
( 10,  'MONTERIA'),
( 10,  'AYAPEL'),
( 10,  'BUENAVISTA'),
( 10,  'CANALETE'),
( 10, 'CERETE'),
( 10, 'CHIMA'),
( 10, 'CHINU'),
( 10, 'CIENAGA DE ORO'),
( 10, 'COTORRA'),
( 10, 'LA APARTADA'),
( 10, 'LORICA'),
( 10, 'LOS CORDOBAS'),
( 10, 'MOMIL'),
( 10, 'MONTELIBANO'),
( 10, 'MOÑITOS'),
( 10, 'PLANETA RICA'),
( 10, 'PUEBLO NUEVO'),
( 10, 'PUERTO ESCONDIDO'),
( 10, 'PUERTO LIBERTADOR'),
( 10, 'PURISIMA'),
( 10, 'SAHAGUN'),
( 10, 'SAN ANDRES SOTAVENTO'),
( 10, 'SAN ANTERO'),
( 10, 'SAN BERNARDO DEL VIENTO'),
( 10, 'SAN CARLOS'),
( 10, 'SAN PELAYO'),
( 10, 'TIERRALTA'),
( 10, 'VALENCIA'),
( 11,  'AGUA DE DIOS'),
( 11, 'ALBAN'),
( 11, 'ANAPOIMA'),
( 11, 'ANOLAIMA'),
( 11, 'ARBELAEZ'),
( 11, 'BELTRAN'),
( 11, 'BITUIMA'),
( 11, 'BOJACA'),
( 11,  'CABRERA'),
( 11,  'CACHIPAY'),
( 11,  'CAJICA'),
( 11,  'CAPARRAPI'),
( 11,  'CAQUEZA'),
( 11,  'CARMEN DE CARUPA'),
( 11,  'CHAGUANI'),
( 11,  'CHIA'),
( 11,  'CHIPAQUE'),
( 11,  'CHOACHI'),
( 11,  'CHOCONTA'),
( 11,  'COGUA'),
( 11,  'COTA'),
( 11,  'CUCUNUBA'),
( 11,  'EL COLEGIO'),
( 11,  'EL PEÑON'),
( 11,  'EL ROSAL'),
( 11,  'FACATATIVA'),
( 11,  'FOMEQUE'),
( 11,  'FOSCA'),
( 11,  'FUNZA'),
( 11,  'FUQUENE'),
( 11,  'FUSAGASUGA'),
( 11,  'GACHALA'),
( 11,  'GACHANCIPA'),
( 11,  'GACHETA'),
( 11,  'GAMA'),
( 11,  'GIRARDOT'),
( 11,  'GRANADA'),
( 11,  'GUACHETA'),
( 11,  'GUADUAS'),
( 11,  'GUASCA'),
( 11,  'GUATAQUI'),
( 11,  'GUATAVITA'),
( 11,  'GUAYABAL DE SIQUIMA'),
( 11,  'GUAYABETAL'),
( 11,  'GUTIERREZ'),
( 11,  'JERUSALEN'),
( 11,  'JUNIN'),
( 11,  'LA CALERA'),
( 11,  'LA MESA'),
( 11,  'LA PALMA'),
( 11,  'LA PEÑA'),
( 11,  'LA VEGA'),
( 11,  'LENGUAZAQUE'),
( 11,  'MACHETA'),
( 11, 'MADRID'),
( 11, 'MANTA'),
( 11, 'MEDINA'),
( 11, 'MOSQUERA'),
( 11, 'NARIÑO'),
( 11, 'NEMOCON'),
( 11, 'NILO'),
( 11, 'NIMAIMA'),
( 11, 'NOCAIMA'),
( 11, 'VENECIA (OSPINA PEREZ)'),
( 11, 'PACHO'),
( 11, 'PAIME'),
( 11, 'PANDI'),
( 11, 'PARATEBUENO'),
( 11, 'PASCA'),
( 11, 'PUERTO SALGAR'),
( 11, 'PULI'),
( 11, 'QUEBRADANEGRA'),
( 11, 'QUETAME'),
( 11, 'QUIPILE'),
( 11, 'APULO (RAFAEL REYES)'),
( 11, 'RICAURTE'),
( 11, 'SAN ANTONIO DEL TEQUENDAMA'),
( 11, 'SAN BERNARDO'),
( 11, 'SAN CAYETANO'),
( 11, 'SAN FRANCISCO'),
( 11, 'SAN JUAN DE RIOSECO'),
( 11, 'SASAIMA'),
( 11, 'SESQUILE'),
( 11, 'SIBATE'),
( 11, 'SILVANIA'),
( 11, 'SIMIJACA'),
( 11, 'SOACHA'),
( 11, 'SOPO'),
( 11, 'SUBACHOQUE'),
( 11, 'SUESCA'),
( 11, 'SUPATA'),
( 11, 'SUSA'),
( 11, 'SUTATAUSA'),
( 11, 'TABIO'),
( 11, 'TAUSA'),
( 11, 'TENA'),
( 11, 'TENJO'),
( 11, 'TIBACUY'),
( 11, 'TIBIRITA'),
( 11, 'TOCAIMA'),
( 11, 'TOCANCIPA'),
( 11, 'TOPAIPI'),
( 11, 'UBALA'),
( 11, 'UBAQUE'),
( 11, 'UBATE'),
( 11, 'UNE'),
( 11, 'UTICA'),
( 11, 'VERGARA'),
( 11, 'VIANI'),
( 11, 'VILLAGOMEZ'),
( 11, 'VILLAPINZON'),
( 11, 'VILLETA'),
( 11, 'VIOTA'),
( 11, 'YACOPI'),
( 11, 'ZIPACON'),
( 11, 'ZIPAQUIRA'),
( 12,  'QUIBDO (SAN FRANCISCO DE QUIBDO)'),
( 12,  'ACANDI'),
( 12, 'ALTO BAUDO (PIE DE PATO)'),
( 12, 'ATRATO'),
( 12, 'BAGADO'),
( 12, 'BAHIA SOLANO (MUTIS)'),
( 12, 'BAJO BAUDO (PIZARRO)'),
( 12, 'BOJAYA (BELLAVISTA)'),
( 12,  'CANTON DE SAN PABLO (MANAGRU)'),
( 12,  'CONDOTO'),
( 12,  'EL CARMEN DE ATRATO'),
( 12,  'LITORAL DEL BAJO SAN JUAN (SANTA GENOVEVA DE DOCORDO)'),
( 12,  'ISTMINA'),
( 12,  'JURADO'),
( 12,  'LLORO'),
( 12,  'MEDIO ATRATO'),
( 12,  'MEDIO BAUDO'),
( 12,  'NOVITA'),
( 12,  'NUQUI'),
( 12,  'RIOQUITO'),
( 12,  'RIOSUCIO'),
( 12,  'SAN JOSE DEL PALMAR'),
( 12,  'SIPI'),
( 12,  'TADO'),
( 12,  'UNGUIA'),
( 12,  'UNION PANAMERICANA'),
( 13,  'NEIVA'),
( 13,  'ACEVEDO'),
( 13, 'AGRADO'),
( 13, 'AIPE'),
( 13, 'ALGECIRAS'),
( 13, 'ALTAMIRA'),
( 13, 'BARAYA'),
( 13,  'CAMPOALEGRE'),
( 13,  'COLOMBIA'),
( 13,  'ELIAS'),
( 13,  'GARZON'),
( 13,  'GIGANTE'),
( 13,  'GUADALUPE'),
( 13,  'HOBO'),
( 13,  'IQUIRA'),
( 13,  'ISNOS (SAN JOSE DE ISNOS)'),
( 13,  'LA ARGENTINA'),
( 13,  'LA PLATA'),
( 13,  'NATAGA'),
( 13,  'OPORAPA'),
( 13,  'PAICOL'),
( 13,  'PALERMO'),
( 13,  'PALESTINA'),
( 13,  'PITAL'),
( 13,  'PITALITO'),
( 13,  'RIVERA'),
( 13,  'SALADOBLANCO'),
( 13,  'SAN AGUSTIN'),
( 13,  'SANTA MARIA'),
( 13,  'SUAZA'),
( 13,  'TARQUI'),
( 13,  'TESALIA'),
( 13,  'TELLO'),
( 13,  'TERUEL'),
( 13,  'TIMANA'),
( 13,  'VILLAVIEJA'),
( 13,  'YAGUARA'),
( 14, 'RIOHACHA'),
( 14,  'BARRANCAS'),
( 14,  'DIBULLA'),
( 14, 'DISTRACCION'),
( 14,  'EL MOLINO'),
( 14,  'FONSECA'),
( 14,  'HATONUEVO'),
( 14,  'LA JAGUA DEL PILAR'),
( 14,  'MAICAO'),
( 14,  'MANAURE'),
( 14,  'SAN JUAN DEL CESAR'),
( 14,  'URIBIA'),
( 14,  'URUMITA'),
( 14,  'VILLANUEVA'),
( 15,  'SANTA MARTA (DISTRITO TURISTICO CULTURAL E HISTORICO DE SANTA MARTA)'),
( 15, 'ALGARROBO'),
( 15, 'ARACATACA'),
( 15, 'ARIGUANI (EL DIFICIL)'),
( 15,  'CERRO SAN ANTONIO'),
( 15,  'CHIVOLO'),
( 15,  'CIENAGA'),
( 15,  'CONCORDIA'),
( 15,  'EL BANCO'),
( 15,  'EL PIÑON'),
( 15,  'EL RETEN'),
( 15,  'FUNDACION'),
( 15,  'GUAMAL'),
( 15,  'PEDRAZA'),
( 15,  'PIJIÑO DEL CARMEN (PIJIÑO)'),
( 15,  'PIVIJAY'),
( 15,  'PLATO'),
( 15,  'PUEBLOVIEJO'),
( 15,  'REMOLINO'),
( 15,  'SABANAS DE SAN ANGEL'),
( 15,  'SALAMINA'),
( 15,  'SAN SEBASTIAN DE BUENAVISTA'),
( 15,  'SAN ZENON'),
( 15,  'SANTA ANA'),
( 15,  'SITIONUEVO'),
( 15,  'TENERIFE'),
( 16, 'VILLAVICENCIO'),
( 16, 'ACACIAS'),
( 16,  'BARRANCA DE UPIA'),
( 16,  'CABUYARO'),
( 16,  'CASTILLA LA NUEVA'),
( 16,  'SAN LUIS DE CUBARRAL'),
( 16,  'CUMARAL'),
( 16,  'EL CALVARIO'),
( 16,  'EL CASTILLO'),
( 16,  'EL DORADO'),
( 16,  'FUENTE DE ORO'),
( 16,  'GRANADA'),
( 16,  'GUAMAL'),
( 16,  'MAPIRIPAN'),
( 16,  'MESETAS'),
( 16,  'LA MACARENA'),
( 16,  'LA URIBE'),
( 16,  'LEJANIAS'),
( 16,  'PUERTO CONCORDIA'),
( 16,  'PUERTO GAITAN'),
( 16,  'PUERTO LOPEZ'),
( 16,  'PUERTO LLERAS'),
( 16,  'PUERTO RICO'),
( 16,  'RESTREPO'),
( 16,  'SAN CARLOS DE GUAROA'),
( 16,  'SAN JUAN DE ARAMA'),
( 16,  'SAN JUANITO'),
( 16,  'SAN MARTIN'),
( 16,  'VISTAHERMOSA'),
( 17,  'PASTO (SAN JUAN DE PASTO)'),
( 17,  'ALBAN (SAN JOSE)'),
( 17,  'ALDANA'),
( 17,  'ANCUYA'),
( 17,  'ARBOLEDA (BERRUECOS)'),
( 17,  'BARBACOAS'),
( 17,  'BELEN'),
( 17,  'BUESACO'),
( 17,  'COLON (GENOVA)'),
( 17,  'CONSACA'),
( 17,  'CONTADERO'),
( 17,  'CORDOBA'),
( 17,  'CUASPUD (CARLOSAMA)'),
( 17,  'CUMBAL'),
( 17,  'CUMBITARA'),
( 17,  'CHACHAGUI'),
( 17,  'EL CHARCO'),
( 17,  'EL PEÑOL'),
( 17,  'EL ROSARIO'),
( 17,  'EL TABLON'),
( 17,  'EL TAMBO'),
( 17,  'FUNES'),
( 17,  'GUACHUCAL'),
( 17,  'GUAITARILLA'),
( 17,  'GUALMATAN'),
( 17,  'ILES'),
( 17,  'IMUES'),
( 17,  'IPIALES'),
( 17,  'LA CRUZ'),
( 17,  'LA FLORIDA'),
( 17,  'LA LLANADA'),
( 17,  'LA TOLA'),
( 17,  'LA UNION'),
( 17,  'LEIVA'),
( 17,  'LINARES'),
( 17,  'LOS ANDES (SOTOMAYOR)'),
( 17,  'MAGUI (PAYAN)'),
( 17,  'MALLAMA (PIEDRANCHA)'),
( 17,  'MOSQUERA'),
( 17,  'OLAYA HERRERA (BOCAS DE SATINGA)'),
( 17,  'OSPINA'),
( 17,  'FRANCISCO PIZARRO (SALAHONDA)'),
( 17,  'POLICARPA'),
( 17,  'POTOSI'),
( 17,  'PROVIDENCIA'),
( 17,  'PUERRES'),
( 17,  'PUPIALES'),
( 17,  'RICAURTE'),
( 17,  'ROBERTO PAYAN (SAN JOSE)'),
( 17,  'SAMANIEGO'),
( 17,  'SANDONA'),
( 17,  'SAN BERNARDO'),
( 17,  'SAN LORENZO'),
( 17,  'SAN PABLO'),
( 17,  'SAN PEDRO DE CARTAGO'),
( 17,  'SANTA BARBARA (ISCUANDE)'),
( 17,  'SANTA CRUZ (GUACHAVES)'),
( 17,  'SAPUYES'),
( 17,  'TAMINANGO'),
( 17,  'TANGUA'),
( 17,  'TUMACO'),
( 17,  'TUQUERRES'),
( 17,  'YACUANQUER'),
( 18,  'CUCUTA'),
( 18,  'ABREGO'),
( 18,  'ARBOLEDAS'),
( 18,  'BOCHALEMA'),
( 18, 'BUCARASICA'),
( 18, 'CACOTA'),
( 18, 'CACHIRA'),
( 18, 'CHINACOTA'),
( 18, 'CHITAGA'),
( 18, 'CONVENCION'),
( 18, 'CUCUTILLA'),
( 18, 'DURANIA'),
( 18, 'EL CARMEN'),
( 18, 'EL TARRA'),
( 18, 'EL ZULIA'),
( 18, 'GRAMALOTE'),
( 18, 'HACARI'),
( 18, 'HERRAN'),
( 18, 'LABATECA'),
( 18, 'LA ESPERANZA'),
( 18, 'LA PLAYA'),
( 18, 'LOS PATIOS'),
( 18, 'LOURDES'),
( 18, 'MUTISCUA'),
( 18, 'OCAÑA'),
( 18, 'PAMPLONA'),
( 18, 'PAMPLONITA'),
( 18, 'PUERTO SANTANDER'),
( 18, 'RAGONVALIA'),
( 18, 'SALAZAR'),
( 18, 'SAN CALIXTO'),
( 18, 'SAN CAYETANO'),
( 18, 'SANTIAGO'),
( 18, 'SARDINATA'),
( 18, 'SILOS'),
( 18, 'TEORAMA'),
( 18, 'TIBU'),
( 18, 'TOLEDO'),
( 18, 'VILLACARO'),
( 18, 'VILLA DEL ROSARIO'),
( 19, 'ARMENIA'),
( 19, 'BUENAVISTA'),
( 19,  'CALARCA'),
( 19,  'CIRCASIA'),
( 19,  'CORDOBA'),
( 19,  'FILANDIA'),
( 19,  'GENOVA'),
( 19,  'LA TEBAIDA'),
( 19,  'MONTENEGRO'),
( 19,  'PIJAO'),
( 19,  'QUIMBAYA'),
( 19,  'SALENTO'),
( 20,  'PEREIRA'),
( 20,  'APIA'),
( 20,  'BALBOA'),
( 20,  'BELEN DE UMBRIA'),
( 20, 'DOS QUEBRADAS'),
( 20, 'GUATICA'),
( 20, 'LA CELIA'),
( 20, 'LA VIRGINIA'),
( 20, 'MARSELLA'),
( 20, 'MISTRATO'),
( 20, 'PUEBLO RICO'),
( 20, 'QUINCHIA'),
( 20, 'SANTA ROSA DE CABAL'),
( 20, 'SANTUARIO'),
( 21,  'BUCARAMANGA'),
( 21, 'AGUADA'),
( 21, 'ALBANIA'),
( 21, 'ARATOCA'),
( 21, 'BARBOSA'),
( 21, 'BARICHARA'),
( 21, 'BARRANCABERMEJA'),
( 21, 'BETULIA'),
( 21,  'BOLIVAR'),
( 21,  'CABRERA'),
( 21,  'CALIFORNIA'),
( 21,  'CAPITANEJO'),
( 21,  'CARCASI'),
( 21,  'CEPITA'),
( 21,  'CERRITO'),
( 21, 'CHARALA'),
( 21, 'CHARTA'),
( 21, 'CHIMA'),
( 21, 'CHIPATA'),
( 21, 'CIMITARRA'),
( 21, 'CONCEPCION'),
( 21, 'CONFINES'),
( 21, 'CONTRATACION'),
( 21, 'COROMORO'),
( 21, 'CURITI'),
( 21, 'EL CARMEN DE CHUCURY'),
( 21, 'EL GUACAMAYO'),
( 21, 'EL PEÑON'),
( 21, 'EL PLAYON'),
( 21, 'ENCINO'),
( 21, 'ENCISO'),
( 21, 'FLORIAN'),
( 21, 'FLORIDABLANCA'),
( 21, 'GALAN'),
( 21, 'GAMBITA'),
( 21, 'GIRON'),
( 21, 'GUACA'),
( 21, 'GUADALUPE'),
( 21, 'GUAPOTA'),
( 21, 'GUAVATA'),
( 21, 'GUEPSA'),
( 21, 'HATO'),
( 21, 'JESUS MARIA'),
( 21, 'JORDAN'),
( 21, 'LA BELLEZA'),
( 21, 'LANDAZURI'),
( 21, 'LA PAZ'),
( 21, 'LEBRIJA'),
( 21, 'LOS SANTOS'),
( 21, 'MACARAVITA'),
( 21, 'MALAGA'),
( 21, 'MATANZA'),
( 21, 'MOGOTES'),
( 21, 'MOLAGAVITA'),
( 21, 'OCAMONTE'),
( 21, 'OIBA'),
( 21, 'ONZAGA'),
( 21, 'PALMAR'),
( 21, 'PALMAS DEL SOCORRO'),
( 21, 'PARAMO'),
( 21, 'PIEDECUESTA'),
( 21, 'PINCHOTE'),
( 21, 'PUENTE NACIONAL'),
( 21, 'PUERTO PARRA'),
( 21, 'PUERTO WILCHES'),
( 21, 'RIONEGRO'),
( 21, 'SABANA DE TORRES'),
( 21, 'SAN ANDRES'),
( 21, 'SAN BENITO'),
( 21, 'SAN GIL'),
( 21, 'SAN JOAQUIN'),
( 21, 'SAN JOSE DE MIRANDA'),
( 21, 'SAN MIGUEL'),
( 21, 'SAN VICENTE DE CHUCURI'),
( 21, 'SANTA BARBARA'),
( 21, 'SANTA HELENA DEL OPON'),
( 21, 'SIMACOTA'),
( 21, 'SOCORRO'),
( 21, 'SUAITA'),
( 21, 'SUCRE'),
( 21, 'SURATA'),
( 21, 'TONA'),
( 21, 'VALLE SAN JOSE'),
( 21, 'VELEZ'),
( 21, 'VETAS'),
( 21, 'VILLANUEVA'),
( 21, 'ZAPATOCA'),
( 22,  'SINCELEJO'),
( 22,  'BUENAVISTA'),
( 22, 'CAIMITO'),
( 22, 'COLOSO (RICAURTE)'),
( 22, 'COROZAL'),
( 22, 'CHALAN'),
( 22, 'GALERAS (NUEVA GRANADA)'),
( 22, 'GUARANDA'),
( 22, 'LA UNION'),
( 22, 'LOS PALMITOS'),
( 22, 'MAJAGUAL'),
( 22, 'MORROA'),
( 22, 'OVEJAS'),
( 22, 'PALMITO'),
( 22, 'SAMPUES'),
( 22, 'SAN BENITO ABAD'),
( 22, 'SAN JUAN DE BETULIA'),
( 22, 'SAN MARCOS'),
( 22, 'SAN ONOFRE'),
( 22, 'SAN PEDRO'),
( 22, 'SINCE'),
( 22, 'SUCRE'),
( 22, 'TOLU'),
( 22, 'TOLUVIEJO'),
( 23,  'IBAGUE'),
( 23,  'ALPUJARRA'),
( 23,  'ALVARADO'),
( 23,  'AMBALEMA'),
( 23,  'ANZOATEGUI'),
( 23,  'ARMERO (GUAYABAL)'),
( 23,  'ATACO'),
( 23, 'CAJAMARCA'),
( 23, 'CARMEN APICALA'),
( 23, 'CASABIANCA'),
( 23, 'CHAPARRAL'),
( 23, 'COELLO'),
( 23, 'COYAIMA'),
( 23, 'CUNDAY'),
( 23, 'DOLORES'),
( 23, 'ESPINAL'),
( 23, 'FALAN'),
( 23, 'FLANDES'),
( 23, 'FRESNO'),
( 23, 'GUAMO'),
( 23, 'HERVEO'),
( 23, 'HONDA'),
( 23, 'ICONONZO'),
( 23, 'LERIDA'),
( 23, 'LIBANO'),
( 23, 'MARIQUITA'),
( 23, 'MELGAR'),
( 23, 'MURILLO'),
( 23, 'NATAGAIMA'),
( 23, 'ORTEGA'),
( 23, 'PALOCABILDO'),
( 23, 'PIEDRAS'),
( 23, 'PLANADAS'),
( 23, 'PRADO'),
( 23, 'PURIFICACION'),
( 23, 'RIOBLANCO'),
( 23, 'RONCESVALLES'),
( 23, 'ROVIRA'),
( 23,  'SALDAÑA'),
( 23,  'SAN ANTONIO'),
( 23,  'SAN LUIS'),
( 23,  'SANTA ISABEL'),
( 23,  'SUAREZ'),
( 23,  'VALLE DE SAN JUAN'),
( 23,  'VENADILLO'),
( 23,  'VILLAHERMOSA'),
( 23,  'VILLARRICA'),
( 24,  'CALI (SANTIAGO DE CALI)'),
( 24,  'ALCALA'),
( 24,  'ANDALUCIA'),
( 24,  'ANSERMANUEVO'),
( 24,  'ARGELIA'),
( 24, 'BOLIVAR'),
( 24, 'BUENAVENTURA'),
( 24, 'BUGA'),
( 24, 'BUGALAGRANDE'),
( 24, 'CAICEDONIA'),
( 24, 'CALIMA (DARIEN)'),
( 24, 'CANDELARIA'),
( 24, 'CARTAGO'),
( 24, 'DAGUA'),
( 24, 'EL AGUILA'),
( 24, 'EL CAIRO'),
( 24, 'EL CERRITO'),
( 24, 'EL DOVIO'),
( 24, 'FLORIDA'),
( 24, 'GINEBRA'),
( 24, 'GUACARI'),
( 24, 'JAMUNDI'),
( 24, 'LA CUMBRE'),
( 24, 'LA UNION'),
( 24, 'LA VICTORIA'),
( 24, 'OBANDO'),
( 24, 'PALMIRA'),
( 24, 'PRADERA'),
( 24, 'RESTREPO'),
( 24, 'RIOFRIO'),
( 24, 'ROLDANILLO'),
( 24, 'SAN PEDRO'),
( 24, 'SEVILLA'),
( 24, 'TORO'),
( 24, 'TRUJILLO'),
( 24, 'TULUA'),
( 24, 'ULLOA'),
( 24, 'VERSALLES'),
( 24, 'VIJES'),
( 24, 'YOTOCO'),
( 24, 'YUMBO'),
( 24, 'ZARZAL'),
( 25,  'ARAUCA'),
( 25,  'ARAUQUITA'),
( 25,  'CRAVO NORTE'),
( 25,  'FORTUL'),
( 25,  'PUERTO RONDON'),
( 25,  'SARAVENA'),
( 25,  'TAME'),
( 26,  'YOPAL'),
( 26,  'AGUAZUL'),
( 26,  'CHAMEZA'),
( 26,  'HATO COROZAL'),
( 26,  'LA SALINA'),
( 26,  'MANI'),
( 26,  'MONTERREY'),
( 26,  'NUNCHIA'),
( 26,  'OROCUE'),
( 26,  'PAZ DE ARIPORO'),
( 26,  'PORE'),
( 26,  'RECETOR'),
( 26,  'SABANALARGA'),
( 26,  'SACAMA'),
( 26,  'SAN LUIS DE PALENQUE'),
( 26,  'TAMARA'),
( 26,  'TAURAMENA'),
( 26,  'TRINIDAD'),
( 26,  'VILLANUEVA'),
( 27,  'MOCOA'),
( 27,  'COLON'),
( 27,  'ORITO'),
( 27,  'PUERTO ASIS'),
( 27,  'PUERTO CAICEDO'),
( 27,  'PUERTO GUZMAN'),
( 27,  'PUERTO LEGUIZAMO'),
( 27,  'SIBUNDOY'),
( 27,  'SAN FRANCISCO'),
( 27,  'SAN MIGUEL (LA DORADA)'),
( 27,  'SANTIAGO'),
( 27,  'LA HORMIGA (VALLE DEL GUAMUEZ)'),
( 27,  'VILLAGARZON'),
( 28,  'SAN ANDRES'),
( 28,  'PROVIDENCIA'),
( 29,  'LETICIA'),
( 29,  'EL ENCANTO'),
( 29,  'LA CHORRERA'),
( 29,  'LA PEDRERA'),
( 29,  'LA VICTORIA'),
( 29,  'MIRITI-PARANA'),
( 29,  'PUERTO ALEGRIA'),
( 29,  'PUERTO ARICA'),
( 29,  'PUERTO NARIÑO'),
( 29,  'PUERTO SANTANDER'),
( 29,  'TARAPACA'),
( 30,  'PUERTO INIRIDA'),
( 30,  'BARRANCO MINAS'),
( 30,  'SAN FELIPE'),
( 30,  'PUERTO COLOMBIA'),
( 30,  'LA GUADALUPE'),
( 30,  'CACAHUAL'),
( 30,  'PANA PANA (CAMPO ALEGRE)'),
( 30,  'MORICHAL (MORICHAL NUEVO)'),
( 31,  'SAN JOSE DEL GUAVIARE'),
( 31, 'CALAMAR'),
( 31, 'EL RETORNO'),
( 31,  'MIRAFLORES'),
( 32,  'MITU'),
( 32, 'CARURU'),
( 32,  'PACOA'),
( 32,  'TARAIRA'),
( 32,  'PAPUNAUA (MORICHAL)'),
( 32,  'YAVARATE'),
( 33,  'PUERTO CARREÑO'),
( 33, 'LA PRIMAVERA'),
( 33, 'SANTA RITA'),
( 33, 'SANTA ROSALIA'),
( 33, 'SAN JOSE DE OCUNE'),
( 33, 'CUMARIBO');


