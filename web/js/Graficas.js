/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function GraficaEspalda(estiloID,NombreEnt) {
    $.ajax({
        url: "Graficas",
        type: 'Get',
        success: function (data) {
            DatosFiltro2(NombreEnt);
            var listasDatos = $.parseJSON(data);
            var lista = listasDatos[estiloID];
            var nombres = lista[0];
            var tiempos = lista[1];
            console.log(lista);
            console.log(nombres);
            console.log(tiempos);
            var Datos = {
                labels: nombres, datasets: [{
                        fillColor: 'rgba(91,228,146,0.6)', //COLOR DE LAS BARRAS
                        strokeColor: 'rgba(57,194,112,0.7)', //COLOR DEL BORDE DE LAS BARRAS
                        highlightFill: 'rgba(73,206,180,0.6)', //COLOR "HOVER" DE LAS BARRAS
                        highlightStroke: 'rgba(66,196,157,0.7)', //COLOR "HOVER" DEL BORDE DE LAS BARRAS
                        data: tiempos
                    }]
            };
            console.log(Datos);
            var contexto = document.getElementById('grafico').getContext('2d');
            window.Barra = new Chart(contexto).Bar(Datos, {responsive: true});
        }
    });
}

function FiltroFecha(nombreDep, NombreEnt) {
//    var valor = nombreDep+ " "+ NombreEnt;
//    alert(valor);
    $.ajax({
        url: "GrficaFiltrosSv",
        data: {nombreDepJX: nombreDep, nombreEntJX: NombreEnt},
        type: "POST",
        success: function (data) {
            var listasDatos = $.parseJSON(data);
            var lista = listasDatos[0];
            $("#FehcasF").empty();
            if (lista !== null) {
                for (var i = 0, max = lista.length; i < max; i++) {
                    $("#FehcasF").append('<option value=' + lista[i] + '>' + lista[i] + '</option>');

                }
            }
        },
        error: function (data) {
            alert('error Filtro Fechas');
        }
    });
}
function FiltroFecha2(NombreEnt) {
//    var valor = nombreDep+ " "+ NombreEnt;
//    alert(valor);
    $.ajax({
        url: "Graficas",
        data: {nombreEntJX: NombreEnt},
        type: "POST",
        success: function (data) {
            FiltroEstilos();
            DatosFiltro2();
            var listasDatos = $.parseJSON(data);
            var lista = listasDatos[0];
            console.log(lista);
            $("#FehcasF").empty();
            if (lista !== null) {
                for (var i = 0, max = lista.length; i < max; i++) {
                    $("#FehcasF").append('<option value=' + lista[i] + '>' + lista[i] + '</option>');
                }
            }
        },
        error: function (data) {
            alert('error Filtro Fechas');
        }
    });
}

function FiltroEstilos() {

    $.ajax({
        url: "GrficaFiltrosSv",
        data: {FechaJX: $("#FehcasF").val()},
        type: "POST",
        success: function (data) {
            var listasDatos = $.parseJSON(data);
            var lista = listasDatos[1];
            $("#EstilosF").empty();
            if (lista !== null) {
                for (var i = 0, max = lista.length; i < max; i++) {
                    $("#EstilosF").append('<option  value=' + lista[i] + '>' + lista[i] + '</option>');
                }
            }
            
            FiltroDistancia();
            
        },
        error: function (data) {
            alert('error Filtro Estilos');
        }
    });
}

function FiltroEstilos2(NombreEnt) {

    $.ajax({
        url: "GrficaFiltrosSv",
        data: {FechaJX: $("#FehcasF").val()},
        type: "POST",
        success: function (data) {
            DatosFiltro2(NombreEnt);
            var listasDatos = $.parseJSON(data);
            var lista = listasDatos[1];
            $("#EstilosF").empty();
            if (lista !== null) {
                for (var i = 0, max = lista.length; i < max; i++) {
                    $("#EstilosF").append('<option  value=' + lista[i] + '>' + lista[i] + '</option>');
                }
            }
            
            FiltroDistancia();
            
        },
        error: function (data) {
            alert('error Filtro Estilos');
        }
    });
}


//
function FiltroDistancia() {
//    var valor = $("#EstilosF").val();
//    alert(valor);
    $.ajax({
        url: "GrficaFiltrosSv",
        data: {EstiloJX: $("#EstilosF").val(), FechaJX: $("#FehcasF").val()},
        type: "POST",
        success: function (data) {
            var listasDatos = $.parseJSON(data);
            var lista = listasDatos[2];
            $("#DistaciaF").empty();
            if (lista !== null) {
                for (var i = 0, max = lista.length; i < max; i++) {
                    $("#DistaciaF").append('<option value=' + lista[i].Number + '>' + lista[i].Distance + '</option>');
                }
            }
        },
        error: function (data) {
            alert('error Filtro Distancias');
        }
    });
}

function DatosFiltro(nombre) {
    $.ajax({
        url: "GrficaFiltrosSv",
        data: {DistanciaJX: $("#DistaciaF").val(), nombreDepJX: nombre},
        type: "POST",
        success: function (data) {
            var listasDatos = $.parseJSON(data);
            var lista = listasDatos[3];
            console.log(lista);
        },
        error: function (data) {
            alert('Disculpa, No hay Datos para El Filtro');
        }
    });
}

function DatosFiltro2(nombre) {
    $.ajax({
        url: "Graficas",
        data: {FechaJX: $("#FehcasF").val(),EstiloJX: $("#EstilosF").val(), nombreEntJX: nombre},
        type: "POST",
        success: function (data) {
            var listasDatos = $.parseJSON(data);
            var lista = listasDatos[2];
            console.log(lista);
        },
        error: function (data) {
            alert('Disculpa, No hay Datos para El Filtro');
        }
    });
}

function GraficaFiltros(NombreEnt) {
    $.ajax({
        url: "GrficaFiltrosSv",
        type: 'Get',
        success: function (data) {
            DatosFiltro(NombreEnt);
            var listasDatos = $.parseJSON(data);
            var lista = listasDatos[3];
            var nombres = lista[0];
            var tiempos = lista[1];
            console.log(lista);
            console.log(nombres);
            console.log(tiempos);
            var Datos = {
                labels: nombres, datasets: [{
                        fillColor: 'rgba(91,228,146,0.6)', //COLOR DE LAS BARRAS
                        strokeColor: 'rgba(57,194,112,0.7)', //COLOR DEL BORDE DE LAS BARRAS
                        highlightFill: 'rgba(73,206,180,0.6)', //COLOR "HOVER" DE LAS BARRAS
                        highlightStroke: 'rgba(66,196,157,0.7)', //COLOR "HOVER" DEL BORDE DE LAS BARRAS
                        data: tiempos
                    }]
            };
            console.log(Datos);
            var contexto = document.getElementById('grafico').getContext('2d');
            window.Barra = new Chart(contexto).Bar(Datos, {responsive: true});
        }
    });
}



