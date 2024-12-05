# ExamenAPI
Estructura del proyecto:
- Node REST API se encuentra en la carpeta Backend
- App Web se encuentra en la carpeta WebApp

Software requerido:
- MySQL versión 8.0 o superior
- Node.js versión 14 o superior
- .NET SDK versión 6
-	Dependencias de Node:
--	mysql
--	cors
--	bodyparser
--	express
-	Dependencias C#:
--	WebApp

Instalación:
-	Para crear la base de datos llamada “empresa”, con sus tablas (“empleado” y “departamento”), se deben ejecutar los queries que están en el archivo “queries.sql”.
-	Para configurar la REST API de Node se debe:
--	Correr el comando “npm install” en el directorio base del proyecto de Node.js para instalar las dependencias.
--	Editar la configuración de la base de datos en el archivo app.js
--	Correr el comando “node app.js” para iniciar el servidor.

Base de datos MySQL
Está llamada “empresa” y contiene dos tablas:
departamento:
-	código_departamento – Integer, Primary Key
-	nombre_depto – Varchar(75)
-	presupuesto – Decimal
empleado:
-	dpi – Integer, Primary Key
-	nombre – Varchar(100)
-	apellidos – Varchar(125)
-	cod_depto – Integer, Foreign Key que referencia a departamento.codigo_departamento

