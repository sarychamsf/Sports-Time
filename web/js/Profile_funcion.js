/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function verperfil(name) {
//    var valor = nombreDep+ " "+ NombreEnt;
//    alert(valor);


    $.ajax({
        url: "Temporary_Profile_Servlet",
        data: {temp: "verperfil",name:name},
        type: "POST",
        success: function (respuesta) {
            if (respuesta.trim() == "verperfil") {
                window.location.replace("Temporary_profile.jsp");
            }

        },
        error: function (data) {
            alert('error intentelo mas tarde ');
        }
    });
}

function aceptar(namesolicitud, name) {
//    var valor = nombreDep+ " "+ NombreEnt;
//    alert(valor);


    $.ajax({
        url: "Temporary_Profile_Servlet",
        data: {temp: "aceptado", namesolicitud: namesolicitud, name: name},
        type: "POST",
        success: function (respuesta) {
            if (respuesta.trim() == "aceptado") {
                window.location.replace("Solicitudes.jsp");
            }

        },
        error: function (data) {
            alert('error intentelo mas tarde ');
        }
    });
}

function rechazar(namesolicitud, name) {
//    var valor = nombreDep+ " "+ NombreEnt;
//    alert(valor);


    $.ajax({
        url: "Temporary_Profile_Servlet",
        data: {temp: "rechazado", namesolicitud: namesolicitud, name: name},
        type: "POST",
        success: function (respuesta) {
            if (respuesta.trim() == "rechazado") {
                window.location.replace("Solicitudes.jsp");
            }

        },
        error: function (data) {
            alert('error intentelo mas tarde ');
        }
    });
}



