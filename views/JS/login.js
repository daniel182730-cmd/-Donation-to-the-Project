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
    const password = e.target.password.value;

    const response = await fetch("/usuario/login", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ nombre, password })
    });

    const data = await response.json();
    console.log(data);
});

// ==============================
// Enviar formulario REGISTRO
// ==============================

document.getElementById("form-register").addEventListener("submit", async (e) => {
    e.preventDefault();

    const nombre = e.target.nombre.value;
    const email = e.target.email.value;
    const password = e.target.password.value;

    const response = await fetch("/usuario/registrar", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ nombre, email, password })
    });

    const data = await response.json();
    console.log(data);
});

