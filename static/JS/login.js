// Obtener elementos
const iniciarForm = document.getElementById('iniciarform');
const registerForm = document.getElementById('registerform');
const btnRegistrarse = document.getElementById('btnregistrarse');
const btnIniciar = document.getElementById('btniniciar');

// Mostrar registro y ocultar login
btnRegistrarse.addEventListener('click', () => {
    iniciarForm.classList.remove('ver');
    iniciarForm.classList.add('nover');

    registerForm.classList.remove('nover');
    registerForm.classList.add('ver');
});

// Volver al login desde registro
btnIniciar.addEventListener('click', () => {
    registerForm.classList.remove('ver');
    registerForm.classList.add('nover');

    iniciarForm.classList.remove('nover');
    iniciarForm.classList.add('ver');
});


// ---------- LOGIN ----------
document.getElementById('form-login').addEventListener('submit', async (e) => {
    e.preventDefault();

    const formData = new FormData(e.target);
    const data = Object.fromEntries(formData.entries());

    const response = await fetch('/api/login', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    });

    const result = await response.json();

    if (result.success) {
        window.location.href = result.redirect;
    } else {
        alert(result.message);
    }
});


// ---------- REGISTER ----------
document.getElementById('form-register').addEventListener('submit', async (e) => {
    e.preventDefault();

    const formData = new FormData(e.target);
    const data = Object.fromEntries(formData.entries());

    const response = await fetch('/api/register', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    });

    const result = await response.json();

    if (result.success) {
        window.location.href = result.redirect;
    }
});

