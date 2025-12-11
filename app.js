const express = require("express");
const path = require("path");
const session = require("express-session");
const app = express();

// =============================
//      PRODUCTOS
// =============================

// para leer json y formularios
app.use(express.json());
app.use(express.urlencoded({extended: true}));

// Manejo de seccion 
app.use(session({
    secret:"llave secreta",
    resave: false,
    saveUninitialized: false,
}));

// Servir archivos estaticos
app.use(express.static(path.join(__dirname,"views")));

// =============================
//      RUTAS
// =============================

// pagina principal
app.use("/usuario",require("./routes"));

app.get("/",(req,res) =>{
    res.sendFile(path.join(__dirname,"views","login.html"))
})

// =============================
//      INICIAR SERVIDOR
// =============================

const PORT = 3000;
app.listen(PORT, () => {
    console.log(`Servidor corriendo en http://localhost:${PORT}`);
});