// Obtener elementos
const iniciarForm = document.getElementById('iniciarform');
const registerForm = document.getElementById('registerform');
const btnRegistrarse = document.getElementById('btnregistrarse');

// Función para mostrar un div y ocultar el otro
function mostrarRegistro() {
    iniciarForm.classList.remove('ver');
    iniciarForm.classList.add('nover');

    registerForm.classList.remove('nover');
    registerForm.classList.add('ver');
}

// Evento del botón
btnRegistrarse.addEventListener('click', mostrarRegistro);
