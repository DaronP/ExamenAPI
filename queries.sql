CREATE DATABASE empresa;

CREATE TABLE departamento
(codigo_departamento INT PRIMARY KEY,
nombre_depto VARCHAR(75),
presupuesto DECIMAL);

CREATE TABLE empleado
(
dpi INT PRIMARY KEY,
nombre VARCHAR(100),
apellidos VARCHAR(125),
cod_depto INT ,
FOREIGN KEY (cod_depto)
REFERENCES departamento(codigo_departamento)
);

INSERT INTO departamento(codigo_departamento,nombre_depto,presupuesto) VALUES(001,'Gerencia',55000);
INSERT INTO departamento(codigo_departamento,nombre_depto,presupuesto) VALUES(002,'Administración y Finanzas',118000);
INSERT INTO departamento(codigo_departamento,nombre_depto,presupuesto) VALUES(003,'Contabilidad',63550);
INSERT INTO departamento(codigo_departamento,nombre_depto,presupuesto) VALUES(004,'RRHH',45000);
INSERT INTO departamento(codigo_departamento,nombre_depto,presupuesto) VALUES(005,'Proyectos',1305000);
INSERT INTO departamento(codigo_departamento,nombre_depto,presupuesto) VALUES(006,'Comercial',354647);
INSERT INTO departamento(codigo_departamento,nombre_depto,presupuesto) VALUES(007,'Mercadeo',556000);
INSERT INTO departamento(codigo_departamento,nombre_depto,presupuesto) VALUES(008,'Produccion',13500300);
INSERT INTO departamento(codigo_departamento,nombre_depto,presupuesto) VALUES(009,'Logistica',5905400);
INSERT INTO departamento(codigo_departamento,nombre_depto,presupuesto) VALUES(010,'Bodega',2566500);
INSERT INTO departamento(codigo_departamento,nombre_depto,presupuesto) VALUES(012,'Inteligencia',65000);
INSERT INTO departamento(codigo_departamento,nombre_depto,presupuesto) VALUES(014,'Informática',157000);
INSERT INTO departamento(codigo_departamento,nombre_depto,presupuesto) VALUES(077,'Investigacion',157000);


INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(16967,'AARON ISAAC','PAR GUITZ',3);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(15251,'ADELFA VERONICA','PEREZ LOPEZ',5);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(13621,'ADELIO','PEREZ Y PEREZ',9);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(15752,'ADELSO','ZUÑIGA REGALADO',1);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(18228,'ADELY NATYNELLY','MARGOTTIUL CU',10);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(25757,'BECERA SUZZETH','OVALLE ROLDAN',7);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(22011,'BEIMER DANILO','PEREZ BAUTISTA',2);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(13382,'BELBETH YESENIA','HERNANDEZ GONZALEZ',4);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(10569,'BELGICA ANABELLA','DERAS ROMAN',77);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(18600,'BELICA ANABELA','MIRANDA MONZON',6);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(21163,'BELLANIRA DANALY','MEDRANO MORALES',12);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(13837,'BELMIN PINEDA','GONZALEZ',1);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(24367,'BELSY KORINA','ALVARADO HERNANDEZ',5);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(20561,'BELSY LORENA','DE LEON GODINEZ',8);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(17449,'BELSY YUCELA','SOLANO CRUZ',3);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(19107,'CARMEN LUCIA','ACU RECINOS',5);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(20940,'CARMEN LUCIA','NAJARRO RUANO',9);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(24517,'CARMEN MARIA','AREVALO HERNANDEZ',10);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(20784,'DAVID JOSUE','LOPHES GUZMAN',7);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(20523,'DAVID LIONEL','PIVARAL ALBUREZ',14);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(22891,'DAVID MOISES','ELIAS AGUILAR',4);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(13332,'DAVID OSWALDO','QUIYUCH TOCAY',7);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(24434,'DAVID RIGOBERTO','VILLEDA SANCHEZ',6);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(24815,'DAVID URBANO','PIVARAL GONZALEZ',6);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(13071,'DAVID YURAMBIR','RIVERA ALVARADO',5);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(15277,'DAYRIN LIZMENIA','TEO SALGUERO',1);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(16052,'DAYRIN ROCIO','MEJIA',8);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(22073,'DEBBIE DEL CARMEN','SOLOMAN ORTIZ',1);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(20252,'DEBORA CELESTE','CHAN GUERRA',3);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(16199,'DEBORA GREACE','AVILA CHACON',5);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(20391,'DEBORA GUISELA','MEJICANOS',10);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(26053,'DEBORA MARIE','ESTHERPALACIOS VALDEZ',7);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(19291,'DEBORA MISHELL','CIFUENTES ESCOBAR',14);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(20418,'DEBORA RAQUEL','JUAREZ FUENTES',4);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(23647,'DEBORA RENEE','RODRIGUEZ RECINOS',1);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(21707,'DEBORAH VIOLETA','SIERRA LOPEZ',77);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(22661,'DEBRACK INDIRA','LOYO BRAN',6);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(21112,'DEBRAH ESTHER','LOBOS TOLEDO',12);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(16194,'DEGLY LEONEL','RODERICOMORALES NOGUERA',5);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(24546,'DEICY MARILIS','PINEDA REVOLORIO',8);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(25551,'DEISY VANESSA','FRANCO CERNA',3);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(21957,'DELBERT URIEL','DOMINGUEZ MARTINEZ',14);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(11518,'DELCY NOHEMI','SALGUERO ESQUIVEL',9);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(24823,'DELFINA JEANNETTE','GARCIA MORALES',10);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(10882,'DELHI YOHANA','OROZCO JUAREZ',7);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(20930,'EDGAR ROLANDO','LOPEZ TOJES',2);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(20112,'EDGAR ROLANDO','ORTIZ GONZALEZ',4);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(10755,'EVER LIBERATO','MARTINEZ BARRIOS',14);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(22595,'EVER MANOLO','MORALES LOPEZ',6);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(15628,'EZVIN OSWALDO','GUERRA GALVEZ',12);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(19969,'EZZIO GIANCARLO','GUILLEN AYAU',1);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(12360,'FABIAN ALBERTO','RAMOS BARAHONA',8);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(24618,'FABIAN ALFONSO','GARCIA ALVARADO',14);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(13176,'FABIAN','DE LEON PEREZ',9);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(11267,'FABIAN HERIBERTO','MOLINA SOSA',2);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(18302,'FABIOLA CORINA','MANZANERO GARCIA',3);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(14055,'FRANCISCO RAUL','ALVARADO CHAVEZ',5);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(20627,'FRANCISCO RAYMUNDO','UJPAN VASQUEZ',3);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(17606,'FRANZ ROBERTO','POLANCO MEJIA',9);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(22183,'FRED ERICK','RENEGARCIA GARCIA',10);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(16423,'FREDY ESTUARDO','OGALDEZ FERNANDEZ',7);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(20963,'GABRIELA SOFIA','PORTILLO LOPEZ',2);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(23517,'GARDENIA ENEDINA','MAZA CASTELLANOS',4);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(14693,'GARY ALEXANDER','CONTRERAS NAJERA',3);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(21712,'GILMAR ALEXANDER','CUC GUERRERO',7);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(19855,'GREYS MARIANA','PINTO',6);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(11583,'GUSTAVO ADOLFO','TABIN GRAMAJO',12);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(18303,'HENRY ERNESTO','RODRIGUEZ VILLALTA',8);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(12871,'HENRY ESTEBAN','SOSOF RAMIREZ',3);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(19484,'INGRID YESENIA','CHAVARRIA MORAN',5);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(18005,'INGRID YESENIA','LOPEZ GALVEZ',3);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(24270,'JUAN CARLOS','AMARRA ROBLES',9);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(17193,'KARLA MARIELA','DE LEON LOPEZ',10);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(16970,'KARLA OLIVIA','IXMUCANEALVA ARROYO',7);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(21454,'LIDIA ELIZABETH','SOLARES',2);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(17668,'LIDIA ENCARNACION','COY MACZ',4);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(12816,'OCTAVIO','CHEGUEN GONZALEZ',1);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(15802,'ROSA ODILIA','NAVASSI DIAZ',77);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(23204,'ROSALICIA','GUZMAN ALDANA',6);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(25659,'SANDRA IVONNE','MARTINEZ AGUILAR',12);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(16407,'SANDRA LISSETTE','MORALES RAMIREZ',8);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(22263 ,'TERESA DE JESUS','GONZALEZ TELON',3);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(15112 ,'TERESA DE JESUS','VASQUEZ VILLATORO',3);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(13365 ,'WENDY LISBETH','MARROQUIN CASTILLO',5);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(11725 ,'WILFIDO','PANTALEON PACHECO',9);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(16177 ,'WILFREDO','ALDANA ARCHILA',10);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(19261 ,'YESIKA MANUELA','MACARIO TAQUIEJ',7);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(21731 ,'ZULMY RAQUEL','GARCIA CISNEROS',2);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(20275 ,'ZULY GABRIELA','ALVARADO BARRIOS',4);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(13729 ,'ZULY MAYTE','SANDOVAL SANDOVAL',77);

select * from departamento;
select * from empleado ORDER BY apellidos DESC;

SELECT apellidos FROM empleado;
SELECT DISTINCT apellidos FROM empleado;

SELECT SUM(presupuesto) FROM departamento;

SELECT e.dpi, e.nombre, e.apellidos, e.cod_depto, d.nombre_depto, d.presupuesto 
FROM empleado e 
INNER JOIN departamento d ON e.cod_depto = d.codigo_departamento
ORDER BY e.apellidos DESC;

SELECT e.nombre, e.apellidos, d.nombre_depto, d.presupuesto FROM empleado e INNER JOIN departamento d ON d.codigo_departamento = e.cod_depto WHERE d.presupuesto > 60000;

SELECT codigo_departamento, nombre_depto, presupuesto, (SELECT AVG(presupuesto) FROM departamento) as promedio FROM departamento WHERE presupuesto > (SELECT AVG(presupuesto) FROM departamento) ORDER BY codigo_departamento;

SELECT COUNT(*) AS empleados, d.nombre_depto AS departamento FROM empleado e INNER JOIN departamento d ON d.codigo_departamento = e.cod_depto GROUP BY e.cod_depto HAVING COUNT(*) > 2;

DELETE FROM empleado WHERE dpi = 28948238;
DELETE FROM departamento WHERE codigo_departamento = 11;