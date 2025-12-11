// ==============================
// Alternar formularios (tu código)
// ==============================

const iniciarform = document.getElementById("iniciarform");
const registerform = document.getElementById("registerform");

document.getElementById("btniniciarsaccion").addEventListener("click", () => {
    iniciarform.style.display = "block";
    registerform.style.display = "none";
});

document.getElementById("btnregistrarse").addEventListener("click", () => {
    iniciarform.style.display = "none";
    registerform.style.display = "block";
});


// ==============================
// Enviar formulario LOGIN
// ==============================

document.getElementById("form-login").addEventListener("submit", async (e) => {
    e.preventDefault();

    const nombre = e.target.nombre.value;
    const contraseña = e.target.contraseña.value;

    const response = await fetch("/usuarios/login", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ nombre, contraseña })
    });

    const data = await response.json();
    console.log(data);

    if (data.success) {
        alert("Inicio de sesión correcto");
    } else {
        alert("Error: " + data.message);
    }
});


// ==============================
// Enviar formulario REGISTRO
// ==============================

document.getElementById("form-register").addEventListener("submit", async (e) => {
    e.preventDefault();

    const nombre = e.target.nombre.value;
    const email = e.target.email.value;
    const contraseña = e.target.contraseña.value;

    const response = await fetch("/usuarios/registrar", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ nombre, email, contraseña })
    });

    const data = await response.json();
    console.log(data);

    if (data.success) {
        alert("Registro exitoso");
    } else {
        alert("Error: " + data.message);
    }
});
