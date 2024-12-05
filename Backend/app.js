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
    console.log('Conectado a la base de datos MySQL');
});

// Endpoints para la tabla departamento
app.get('/departamento', (req, res) => {
    const query = 'SELECT * FROM departamento';
    db.query(query, (err, results) => {
        if (err) throw err;
        res.json(results);
    });
});

app.post('/departamento', (req, res) => {
    const { codigo_departamento, nombre_depto, presupuesto } = req.body;
    const query = 'INSERT INTO departamento SET ?';
    db.query(query, { codigo_departamento, nombre_depto, presupuesto }, (err, result) => {
        if (err) throw err;
        res.send('Departamento agregado.');
    });
});

app.put('/departamento/:codigo', (req, res) => {
    const { codigo } = req.params;
    const { nombre_depto, presupuesto } = req.body;
    const query = 'UPDATE departamento SET nombre_depto = ?, presupuesto = ? WHERE codigo_departamento = ?';
    db.query(query, [nombre_depto, presupuesto, codigo], (err, result) => {
        if (err) throw err;
        res.send('Departamento actualizado.');
    });
});

// Endpoints para la tabla empleado
// Obtener todos los empleados
app.get('/empleado', (req, res) => {
    const query = 'SELECT * FROM empleado';
    db.query(query, (err, results) => {
        if (err) throw err;
        res.json(results);
    });
});

app.post('/empleado', (req, res) => {
    const { dpi, nombre, apellidos, cod_depto } = req.body;
    const query = 'INSERT INTO empleado SET ?';
    db.query(query, { dpi, nombre, apellidos, cod_depto }, (err, result) => {
        if (err) throw err;
        res.send('Empleado agregado.');
    });
});

app.put('/empleado/:dpi', (req, res) => {
    const { dpi } = req.params;
    const { nombre, apellidos, cod_depto } = req.body;
    const query = 'UPDATE empleado SET nombre = ?, apellidos = ?, cod_depto = ? WHERE dpi = ?';
    db.query(query, [nombre, apellidos, cod_depto, dpi], (err, result) => {
        if (err) throw err;
        res.send('Empleado actualizado.');
    });
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

app.listen(3000, () => {
    console.log('API corriendo en el puerto 3000');
});
