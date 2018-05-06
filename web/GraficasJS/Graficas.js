/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function GraficaLineal() {
    $.ajax({
        url: "Graficas",
        type: 'Get',
        success: function (data) {
            var listasDatos = $.parseJSON(data);
            var lista = listasDatos[2];
            var nombres = lista[0];
            console.log(lista);

            var stilePoint = ['circle', 'triangle', 'rect', 'rectRot', 'star'];
///Valores Eje X
            var tamaño = 0;
            for (var i = 1, max = lista.length; i < max; i++) {
                if (tamaño < lista[i].length) {
                    tamaño = lista[i].length;
                }
            }
            var labelsDt = [];
            for (var i = 0, max = tamaño; i < max; i++) {
                labelsDt.push("Serie " + (i + 1));
            }

            console.log(labelsDt);
            var barChartData = {
                labels: labelsDt,
                datasets: []
            };

            var color = Chart.helpers.color;
            var colorNames = Object.keys(window.chartColors);
            for (var i = 0, max = nombres.length; i < max; i++) {
                var colorName = colorNames[i % colorNames.length];
                var dsColor = window.chartColors[colorName];
                var dsStyle = stilePoint[i % stilePoint.length];
                var newDataset = {
                    label: nombres[i],
                    backgroundColor: color(dsColor).alpha(0.5).rgbString(),
                    borderColor: dsColor,
                    borderWidth: 3,
                    pointRadius: 7,
                    pointHoverRadius: 15,
                    pointStyle: dsStyle,
                    data: [],
                    fill: false,
                    pointBorderColor: 'rgb(0, 0, 0)'
                };

                for (var index = 0; index < lista[i].length; ++index) {
                    var nombreDat = lista[i + 1];
                }

                newDataset.data = nombreDat;

                console.log(nombreDat)
                barChartData.datasets.push(newDataset);
            }


            function createConfig() {
                return {
                    type: 'line',
                    data: barChartData,
                    options: {
                        responsive: true,
                        title: {
                            display: true,
                            text: 'Grafica comparacion Deportistas'
                        },
                        legend: {
                            position: 'top',
                            labels: {
                                usePointStyle: true
                            }
                        },
                        tooltips: {
                            mode: 'index',
                            intersect: false
                        },
                        scales: {
                            xAxes: [{
                                    display: true,
                                    scaleLabel: {
                                        display: true,
                                        labelString: 'Ronda-Serie'
                                    }
                                }],
                            yAxes: [{
                                    display: true,
                                    scaleLabel: {
                                        display: true,
                                        labelString: 'Tiempo'
                                    }
                                }]
                        }
                    }
                };
            }

            Chart.plugins.register({
                afterDatasetsDraw: function (chart) {
                    var ctx = chart.ctx;

                    chart.data.datasets.forEach(function (dataset, i) {
                        var meta = chart.getDatasetMeta(i);
                        if (!meta.hidden) {
                            meta.data.forEach(function (element, index) {
                                // Draw the text in black, with the specified font
                                ctx.fillStyle = 'rgb(0, 0, 0)';
                                var fontSize = 20;
                                var fontStyle = 'normal';
                                var fontFamily = 'Helvetica Neue';
                                ctx.font = Chart.helpers.fontString(fontSize, fontStyle, fontFamily);

                                // Just naively convert to string for now
                                var dataString = dataset.data[index].toString();

                                // Make sure alignment settings are correct
                                ctx.textAlign = 'center';
                                ctx.textBaseline = 'middle';

                                var padding = 5;
                                var position = element.tooltipPosition();
                                ctx.fillText(dataString, position.x, position.y - (fontSize / 2) - padding);
                            });
                        }
                    });
                }
            });
            BorrarGrafica();
            var ctx = document.getElementById('chart2').getContext('2d');
            var config = createConfig();
            window.Grafica = new Chart(ctx, config);
        },
        error: function () {
            alert('error con los datos DE las Graficas');
        }
    });



}
function toggleSmooth(btn) {
    var value = btn.classList.toggle('btn-on');
    Chart.helpers.each(Chart.instances, function (chart) {
        chart.options.elements.line.tension = value ? 0.4 : 0.000001;
        chart.update();
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
            FiltroEstilos();
        },
        error: function () {
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
            var listasDatos = $.parseJSON(data);
            var lista = listasDatos[0];
            console.log(lista);
            $("#FehcasF").empty();
            if (lista !== null) {
                for (var i = 0, max = lista.length; i < max; i++) {
                    $("#FehcasF").append('<option value=' + lista[i] + '>' + lista[i] + '</option>');
                }
            }
            FiltroEstilos();
        },
        error: function () {
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
        error: function () {
            alert('error Filtro Estilos');
        }
    });
}

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
            DatosFiltro2();
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
            GraficaFiltros();
        },
        error: function () {
            alert('Disculpa, No hay Datos para El Filtro');
        }
    });
}

function DatosFiltro2() {
    $.ajax({
        url: "Graficas",
        data: {DistanciaJX: $("#DistaciaF").val()},
        type: "POST",
        success: function (data) {
            var listasDatos = $.parseJSON(data);
            var lista = listasDatos[2];
            console.log(lista);
            GraficaLineal();
        },
        error: function () {
            alert('Disculpa, No hay Datos para El Filtro2');
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

function BorrarGrafica() {
    document.getElementById('canvas-holder1').innerHTML = '';
    $("#canvas-holder1").append('<canvas id="chart2"></canvas>' + '<button onclick="toggleSmooth(this)">Smooth</button>');
}




