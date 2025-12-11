// importar codigos
const express = require("express");
const mysql = require("mysql2");
const cors = require("cors");

// aplicacion express

const app = express();
app.use(cors());
app.use(express.json());

// configuracion mysql
const db = mysql.createConnection({
    host:"localhost",
    user:"root",
    password:"S@lmon182730",
    database:"kickstarter"
});

// probar conexión
db.connect(err =>{
    if(err) return console.log(err);
    console.log("conectado a mysql")
})

//comprobando
app.get("/usuarios", (req, res) => {
    db.query("SELECT * FROM usuarios", (err, result) => {
        if (err) return res.json(err);
        res.json(result);
    });
});

// servidor
app.listen(5500,() => console.log("servidor back se aloga en el puerto 3000"));

module.exports = db;