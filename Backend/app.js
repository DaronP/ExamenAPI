const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const mysql = require('mysql');

const app = express();
app.use(bodyParser.json());
app.use(cors());

// Configuración de conexión a MySQL
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'admin',
    database: 'empresa'
});

db.connect((err) => {
    if (err) throw err;
    console.log('Connectio to MySQL database successful!');
});


//----------------Consultas-------------------
// Consulta 1: Obtener todos los apellidos de los empleados
app.get('/consulta1', (req, res) => {
    const query = 'SELECT apellidos FROM empleado';
    db.query(query, (err, results) => {
        if (err) throw err;
        res.json(results);
    });
});

// Consulta 2: Obtener los apellidos de los empleados sin repeticiones
app.get('/consulta2', (req, res) => {
    const query = 'SELECT DISTINCT apellidos FROM empleado';
    db.query(query, (err, results) => {
        if (err) throw err;
        res.json(results);
    });
});

// Consulta 3: Obtener todos los datos de los empleados que se apellidan “Pérez”
app.get('/consulta3', (req, res) => {
    const query = 'SELECT * FROM empleado WHERE apellidos LIKE "%PEREZ%"';
    db.query(query, (err, results) => {
        if (err) throw err;
        res.json(results);
    });
});

// Consulta 4: Obtener todos los datos de los empleados que se apellidan “Pérez” o “López”
app.get('/consulta4', (req, res) => {
    const query = 'SELECT * FROM empleado WHERE apellidos LIKE "%PEREZ%" OR apellidos LIKE "%LOPEZ%"';
    db.query(query, (err, results) => {
        if (err) throw err;
        res.json(results);
    });
});

// Consulta 5: Obtener todos los datos de los empleados que trabajan para el departamento “Contabilidad”
app.get('/consulta5', (req, res) => {
    const query = `
        SELECT e.* FROM empleado e
        INNER JOIN departamento d ON e.cod_depto = d.codigo_departamento
        WHERE d.nombre_depto = "Contabilidad"
    `;
    db.query(query, (err, results) => {
        if (err) throw err;
        res.json(results);
    });
});

// Consulta 6: Obtener todos los datos de los empleados que trabajan para los departamentos “Contabilidad” y “Gerencia”
app.get('/consulta6', (req, res) => {
    const query = `
        SELECT e.* FROM empleado e
        INNER JOIN departamento d ON e.cod_depto = d.codigo_departamento
        WHERE d.nombre_depto IN ("Contabilidad", "Gerencia")
    `;
    db.query(query, (err, results) => {
        if (err) throw err;
        res.json(results);
    });
});

// Consulta 7: Obtener todos los datos de los empleados cuyo apellido comienza por la letra “P” 
app.get('/consulta7', (req, res) => {
    const query = 'SELECT * FROM empleado WHERE LEFT(apellidos, 1) LIKE "%P%"';
    db.query(query, (err, results) => {
        if (err) throw err;
        res.json(results);
    });
});

// Consulta 8: Obtener el presupuesto total de todos los departamentos. 
app.get('/consulta8', (req, res) => {
    const query = 'SELECT SUM(presupuesto) AS presupuesto_total FROM departamento';
    db.query(query, (err, results) => {
        if (err) throw err;
        res.json(results);
    });
});

// Consulta 9: Obtener el número de empleados por cada departamento. 
app.get('/consulta9', (req, res) => {
    const query = 'SELECT COUNT(*) AS empleados, d.nombre_depto AS departamento FROM empleado INNER JOIN departamento d ON d.codigo_departamento = cod_depto GROUP BY cod_depto';
    db.query(query, (err, results) => {
        if (err) throw err;
        res.json(results);
    });
});

// Consulta 10: Obtener un listado completo de empleados, incluyendo por cada empleado los datos del empleado y de su departamento.  
app.get('/consulta10', (req, res) => {
    const query = 'SELECT e.dpi, e.nombre, e.apellidos, e.cod_depto, d.nombre_depto, d.presupuesto FROM empleado e INNER JOIN departamento d ON e.cod_depto = d.codigo_departamento';
    db.query(query, (err, results) => {
        if (err) throw err;
        res.json(results);
    });
});

// Consulta 11: Obtener un listado completo de empleados, mostrando su nombre y apellido, junto con el nombre y presupuesto del departamento. Todo ordenado descendentemente por el apellido.   
app.get('/consulta11', (req, res) => {
    const query = 'SELECT e.dpi, e.nombre, e.apellidos, e.cod_depto, d.nombre_depto, d.presupuesto FROM empleado e INNER JOIN departamento d ON e.cod_depto = d.codigo_departamento ORDER BY e.apellidos DESC';
    db.query(query, (err, results) => {
        if (err) throw err;
        res.json(results);
    });
});

// Consulta 12: Obtener los nombres y apellidos de los empleados que trabajen en departamentos cuyo presupuesto sea mayor a 60,000.    
app.get('/consulta12', (req, res) => {
    const query = 'SELECT e.nombre, e.apellidos, d.nombre_depto, d.presupuesto FROM empleado e INNER JOIN departamento d ON d.codigo_departamento = e.cod_depto WHERE d.presupuesto > 60000';
    db.query(query, (err, results) => {
        if (err) throw err;
        res.json(results);
    });
});

// Consulta 13: Obtener los datos de los departamentos cuyo presupuesto es superior al presupuesto medio de todos los departamentos.     
app.get('/consulta13', (req, res) => {
    const query = 'SELECT codigo_departamento, nombre_depto, presupuesto, (SELECT AVG(presupuesto) FROM departamento) as promedio FROM departamento WHERE presupuesto > (SELECT AVG(presupuesto) FROM departamento) ORDER BY codigo_departamento';
    db.query(query, (err, results) => {
        if (err) throw err;
        res.json(results);
    });
});

// Consulta 14: Obtener los nombres de los departamentos que tienen más de 2 empleados.      
app.get('/consulta14', (req, res) => {
    const query = 'SELECT COUNT(*) AS empleados, d.nombre_depto AS departamento FROM empleado e INNER JOIN departamento d ON d.codigo_departamento = e.cod_depto GROUP BY e.cod_depto HAVING COUNT(*) > 2';
    db.query(query, (err, results) => {
        if (err) throw err;
        res.json(results);
    });
});

// Consulta 15: Agregar un nuevo departamento “Control de Calidad”, con presupuesto de 40,000 y código 11. Y agregar un empleado vinculado a este departamento de nombre Esther Vásquez y con DNI: 28948238      
app.post('/departamento', (req, res) => {
    const query = 'INSERT INTO departamento SET ?';

    var data = [];

    for(var i in req.body)
    {
        data.push(req.body[i]);
    };

    const codigo_departamento = data[0];
    const nombre_depto = data[1];
    const presupuesto = data[2];

    db.query(query, { codigo_departamento, nombre_depto, presupuesto }, (err, result) => {
        if (err) {
            res.status(500).send('Error adding department...');
        } else {
            res.send('Data added successfully!');
        }
    });
});

app.post('/empleado', (req, res) => {
    const query = 'INSERT INTO empleado SET ?';

    var data = [];

    for(var i in req.body)
    {
        data.push(req.body[i]);
    };

    const dpi = data[0];
    const nombre = data[1];
    const apellidos = data[2];
    const cod_depto = data[3];

    db.query(query, { dpi, nombre, apellidos, cod_depto }, (err, result) => {
        if (err) {
            res.status(500).send('Error aadding employee...');
        } else {
            res.send('Data added successfully!');
        }
    });
});





app.listen(3000, () => {
    console.log('API corriendo en el puerto 3000');
});
