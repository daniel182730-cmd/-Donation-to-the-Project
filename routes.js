const express = require("express");
const router = express.Router();

// Importar controllers
const {
    autenticarusuario,
    registrarUsuario,
    cerrarSeccion
} = require("./controllers/Usuario");

//-------------
//LOGIN
//-------------

router.post("/login", autenticarusuario);

router.post("/registrar", registrarUsuario);

router.post("/logout", cerrarSeccion);




//Exportar router
module.exports = router;