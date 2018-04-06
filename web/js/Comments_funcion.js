/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function redirigir(id) {
//    var valor = nombreDep+ " "+ NombreEnt;
//    alert(valor);
 
 
    var temp1="#idcomment"+id;
    var temp2="#mensajecomment"+id;
    var temp3="#duracioncomment"+id;
    
    var idcommentuser = $(temp1).val();
    var mensajecomment = $(temp2).val();
    var duracioncomment = $(temp3).val();
    alert(idcommentuser);
    alert(mensajecomment);
    alert(duracioncomment);
    
    $.ajax({
        url: "Comment_Servlet",
        data: {id: id,idcommentuser:idcommentuser,mensajecomment:mensajecomment,duracioncomment:duracioncomment},
        type: "POST",
        success: function (respuesta) {

            if (respuesta.trim() == "comentado") {
                window.location.replace("Muro.jsp");
            }

        },
        error: function (data) {
            alert('error intentelo mas tarde ');
        }
    });
}
