# ExamenAPI
Estructura del proyecto:
- Node REST API se encuentra en la carpeta Backend
- App Web se encuentra en la carpeta WebApp

Software requerido:
•	MySQL versión 8.0 o superior
•	Node.js versión 14 o superior
•	.NET SDK versión 6
•	Dependencias de Node:
o	mysql
o	cors
o	bodyparser
o	express
•	Dependencias C#:
o	WebApp

Instalación:
•	Para crear la base de datos llamada “empresa”, con sus tablas (“empleado” y “departamento”), se deben ejecutar los queries que están en el archivo “queries.sql”.
•	Para configurar la REST API de Node se debe:
o	Correr el comando “npm install” en el directorio base del proyecto de Node.js para instalar las dependencias.
o	Editar la configuración de la base de datos en el archivo app.js
o	Correr el comando “node app.js” para iniciar el servidor.

•	Base de datos MySQL
o	Está llamada “empresa” y contiene dos tablas:
	departamento:
•	código_departamento – Integer, Primary Key
•	nombre_depto – Varchar(75)
•	presupuesto – Decimal
	empleado:
•	dpi – Integer, Primary Key
•	nombre – Varchar(100)
•	apellidos – Varchar(125)
•	cod_depto – Integer, Foreign Key que referencia a departamento.codigo_departamento


Endpoints disponibles
Metodo	Endpoint	Descripcion
GET	/consulta1	Ejecuta el query de la consulta 1
GET	/consulta2	Ejecuta el query de la consulta 2
GET	/consulta3	Ejecuta el query de la consulta 3
GET	/consulta4	Ejecuta el query de la consulta 4
GET	/consulta5	Ejecuta el query de la consulta 5
GET	/consulta6	Ejecuta el query de la consulta 6
GET	/consulta7	Ejecuta el query de la consulta 7
GET	/consulta8	Ejecuta el query de la consulta 8
GET	/consulta9	Ejecuta el query de la consulta 9
GET	/consulta10	Ejecuta el query de la consulta 10
GET	/consulta11	Ejecuta el query de la consulta 11
GET	/consulta12	Ejecuta el query de la consulta 12
GET	/consulta13	Ejecuta el query de la consulta 13
GET	/consulta14	Ejecuta el query de la consulta 14
POST	/departamento	Agrega datos a la tabla departamento para la consulta 15
POST	/empleado	Agrega datos a la tabla empleado para la consulta 15
