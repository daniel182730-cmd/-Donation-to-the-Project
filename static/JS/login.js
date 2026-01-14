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
