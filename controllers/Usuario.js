// links de modules
const {
    obtenerusuarioporcredenciales,
    obtenerusuarioemail,
    insertarusuario
} = require("../modules/Usuario");


//------------
// LOGIN
//------------

// control de errores
exports.autenticarusuario = (req, res) =>{
    const {email, contrasena} = req.body;

    if(!email || !contrasena){
        return res.status(400).json({success: false, message: "Les Faltan Datos"})
    }

    obtenerusuarioporcredenciales(email,contrasena,(err, results)=>{

        if(err) return res.status(401).json({success: false, message: "Email o contraseña incorrecta"});

    });

    const user = results[0];

    // Guardar seccion
    req.seccion.user = {
        id: user.ID_user,
        nombre: user.nombre,
        email: user.email,
        imagen: user.imagen,
        descripcion: user.descripcion
    };

    return res.json({success: true, message:"Login Exitoso", user: req.seccion.user});
};

//---------------
// Registrar
//---------------

exports.registrarUsuario = (req, res) => {
    const { nombre, email, contrasena } = req.body;

    //capturar errores

    if (!nombre || !email || !contrasena) {
        return res.status(400).json({ success: false, message: "Faltan datos" });
    }

    // Verificar si ya existe el email
    obtenerUsuarioPorNombre(email, (err, results) => {
        if (err) return res.status(500).json({ success: false, message: err.message });

        if (results.length > 0) {
            return res.status(409).json({ success: false, message: "El email ya está registrado" });
        }

        // Insertar usuario con imagen y descripcion = "N-A"
        insertarUsuario(nombre, email, contrasena, (errInsert) => {
            if (errInsert) return res.status(500).json({ success: false, message: errInsert.message });

            // Guardar sesión automáticamente
            req.session.user = {
                nombre,
                email,
                contrasena,
                imagen: "N-A",
                descripcion: "N-A"
            };

            return res.json({ success: true, message: "Usuario registrado exitosamente" });
        });
    });
};

// -------------------------
// LOGOUT
// -------------------------
exports.cerrarSesion = (req, res) => {
    req.session.destroy();
    return res.json({ success: true, message: "Sesión cerrada" });
};