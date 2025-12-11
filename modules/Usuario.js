const db = require("../Server");

// Obtener Usuario
exports.obtenerusuarioporcredenciales =(email , contrasena, tarde) =>{

    const query = `SELECT ID_User, nombre, email, contrasena, imagen, descripcion
     FROM Usuario WHERE email = ? AND contrasena = ?`;

    db.query(query,[email,contrasena], tarde);
};

// Obtener Usuario por email

exports.obtenerusuarioemail = (email,tarde)=>{
    
    const query = `SELECT email FROM Usuario WHERE email = ? `;

    db.query(query,[email], tarde);
}

// Insertar Usuario
exports.insertarusuario = (nombre,email,contrasena, tarde) => {

    const imagen = "N/A"
    const descripcion = "N/A"

    
    const query = `
        INSERT INTO Usuario (ID_User, nombre, email, contrasena, imagen, descripcion)
        VALUES (NULL, ?, ?, ?, ?, ?)`;

    db.query(query, [nombre,email,contrasena,imagen,descripcion], tarde);
};