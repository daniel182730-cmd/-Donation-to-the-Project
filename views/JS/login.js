// Esto hace que se alternen los inicios de Seccion
const iniciarform = document.getElementById("iniciarform")
const registerform = document.getElementById("registerform")

document.getElementById("btniniciarsaccion").addEventListener("click", () =>{
iniciarform.style.display = "block";
registerform.style.display ="none";
})

document.getElementById("btnregistrarse").addEventListener("click",() =>{
iniciarform.style.display = "none";
registerform.style.display ="block";

})