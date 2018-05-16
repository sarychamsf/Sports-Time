<%@page import="java.util.ArrayList"%>
<%@page import="Datos.List1"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="Dao.Crud_Coach"%>
<%@page import="Dao.Crud_Athele"%>
<%@page import="Dao.Crud_List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <head>

        <script src="https://code.jquery.com/jquery-1.9.1.js"></script>
        <script src="Script/script1.js" type="text/javascript"></script>
        <script src="Script/script_crono.js" type="text/javascript"></script>

        <link rel="stylesheet" href="assets/css/style_crono.css">

        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

        <!-- Favicons -->
        <link rel="apple-touch-icon" href="./assets/img/kit/free/favicon.png">
        <link rel="icon" href="./assets/img/kit/free/favicon.png">
        <title>
            Sports Time - Pecho
        </title>
        <!--     Fonts and icons     -->
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
        <link rel="stylesheet" href="./assets/css/material-kit.css?v=2.0.2">
        <link rel="stylesheet" href="./assets/css/personalizar.css">

        <%
            Crud_List lista1 = new Crud_List();
            Crud_Athele athele = new Crud_Athele();
            Crud_Coach crr = new Crud_Coach();
            int contador_arreglo = 0;

            HttpSession misession1 = request.getSession(true);
            String h = String.valueOf(misession1.getAttribute("jornada"));

            HttpSession misession2 = request.getSession(true);
            String h1 = String.valueOf(misession2.getAttribute("v"));
            int identifiquer = Integer.parseInt(h1);// en que casilla se encuentra el perfil

            Date date = new Date();
            DateFormat hourdateFormat = new SimpleDateFormat("yyyy/MM/dd");
            String fecha_y_hora = hourdateFormat.format(date);

            h = "Tarde";

            for (int i1 = 0; i1 < lista1.findAll().size(); i1++) {
                if (lista1.findAll().get(i1).getDate().equals(fecha_y_hora) && lista1.findAll().get(i1).getCoach_Name().equals(crr.findAll().get(identifiquer).getName() + " " + crr.findAll().get(identifiquer).getLastname()) && lista1.findAll().get(i1).getJornada().equals(h)) {
                    contador_arreglo++;
                }
            }

            int[] temp2 = new int[contador_arreglo];
            int y = 0;

            for (int i = 0; i < lista1.findAll().size(); i++) {
                if (lista1.findAll().get(i).getDate().equals(fecha_y_hora) && lista1.findAll().get(i).getCoach_Name().equals(crr.findAll().get(identifiquer).getName() + " " + crr.findAll().get(identifiquer).getLastname()) && lista1.findAll().get(i).getJornada().equals(h)) {
                    temp2[y] = i;
                    y++;
                }
            }
        %>

        <script>
            $(document).ready(function () {
                $('#finalizar').click(function (event) {

                    var nombres = [];
                    var tiempos = [];
                    var u = 1;


                    if ($('#Name_Athele1').val() != undefined) {
                        nombres.push($('#Name_Athele1').val());
                        tiempos.push(cronometro1());
                    }

                    if ($('#Name_Athele2').val() != undefined) {
                        nombres.push($('#Name_Athele2').val());
                        tiempos.push(cronometro2());
                    }

                    if ($('#Name_Athele3').val() != undefined) {
                        nombres.push($('#Name_Athele3').val());
                        tiempos.push(cronometro3());
                    }

                    if ($('#Name_Athele4').val() != undefined) {
                        nombres.push($('#Name_Athele4').val());
                        tiempos.push(cronometro4());
                    }

                    if ($('#Name_Athele5').val() != undefined) {
                        nombres.push($('#Name_Athele5').val());
                        tiempos.push(cronometro5());
                    }

                    if ($('#Name_Athele6').val() != undefined) {
                        nombres.push($('#Name_Athele6').val());
                        tiempos.push(cronometro6());
                    }

                    if ($('#Name_Athele7').val() != undefined) {
                        nombres.push($('#Name_Athele7').val());
                        tiempos.push(cronometro7());
                    }

                    if ($('#Name_Athele8').val() != undefined) {
                        nombres.push($('#Name_Athele8').val());
                        tiempos.push(cronometro8());
                    }
                    if ($('#Name_Athele9').val() != undefined) {
                        nombres.push($('#Name_Athele9').val());
                        tiempos.push(cronometro9());
                    }

                    if ($('#Name_Athele10').val() != undefined) {
                        nombres.push($('#Name_Athele10').val());
                        tiempos.push(cronometro10());
                    }



                    var nombresfi = nombres.toString();
                    var tiempofi = tiempos.toString();
                    var Cantidad = $('#Cantidad').val();
                    var Distancia = $('#Distancia').val();

                    $.ajax({
                        url: "Pecho_Servlet",
                        data: {Cantidad: Cantidad, Distancia: Distancia, nombresfi: nombresfi, tiempofi: tiempofi},
                        type: "POST",
                        success: function (respuesta) {

                            if (respuesta.trim() == "Finalizado") {
                                window.location.replace("Management.jsp");
                            } else if (respuesta.trim() == "Relogea") {
                                window.location.replace("Pecho.jsp");

                            }

                        }
                    });
                });
            });

        </script>

        <script>
            $(document).ready(function () {
                $('#sesionclose').click(function (event) {
                    $.ajax({
                        url: "Coach_Servlet",
                        data: {Temp: "close"},
                        type: "POST",
                        success: function (respuesta) {
                            if (respuesta.trim() == "close") {
                                window.location.replace("Login.jsp");
                            }
                        }
                    });
                });
            });

        </script>

        <style>

            .reloj {
                float: left;
                font-size: -webkit-xxx-large;
                font-family: Courier,sans-serif;
                color: #363431;
            }

        </style>

    </head>

    <body class="signup-page" style="background-color: #CEEDFF;">

    <center>
        <div class="container">
            <div class="navbar-translate">
                <center>
                    <div class="brand">
                        <a class="navbar-brand" href="./Login.jsp"> <img src="assets/img/LOGORes.png" alt="Sports Time" width=80% height=80%> </a>
                    </div>
                </center>
            </div>
        </div>
    </center>

    <div>
        <div style="margin-bottom: 10px; margin-top: 10px;">
            <center>
                <a style="display:inline-block;margin-right:5px;" class="nav-link" rel="tooltip" title="" data-placement="bottom" href="https://twitter.com/SportsTimeUSA" target="_blank" data-original-title="Síguenos en Twitter">
                    <i class="fa fa-twitter"></i>
                </a>
                <a style="display:inline-block;margin-right:5px;" class="nav-link" rel="tooltip" title="" data-placement="bottom" href="https://www.facebook.com/Sports-Time-448388048915031/" target="_blank" data-original-title="Síguenos en Facebook">
                    <i class="fa fa-facebook-square"></i>
                </a>
                <a style="display:inline-block;margin-right:5px;" class="nav-link" rel="tooltip" title="" data-placement="bottom" href="https://www.instagram.com/sports_time_usa/" target="_blank" data-original-title="Síguenos en Instagram">
                    <i class="fa fa-instagram"></i>
                </a>
            </center>
        </div>
        <br>
        <center>
            <a style="display:inline-block;margin-right:5px;" class="nav-link" rel="tooltip" title="" data-placement="bottom" href="./Coach.jsp" data-original-title="Perfil">
                <i class="material-icons">face</i>
            </a>
            <input style="display:inline-block;margin-right:5px;" style="margin-bottom: 20px;" id="sesionclose" type="submit" value="Cerrar Sesion" class="btn btn-info btn-round">
        </center>
    </div>

    <br><br><br><br>
    <div class="page-header">
        <div class="main main-raised">
            <div class="profile-content">
                <center>
                    <div class="profile">
                        <br><br>
                        <h2 class="card-title text-center">Rutinas de Pecho</h2>
                    </div>
                </center>
                <div class="card-body" style="align-content: center;">

                    <div style="align-self: center;">

                        <center>
                            <div style="width:55%; height:45%;margin-bottom: 50px;padding-bottom: 50px;">

                                <center>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <img src="https://image.flaticon.com/icons/svg/106/106954.svg" alt="Sports Time" width=30 height=30 hspace="50">

                                            <%                                                
                                                HttpSession misession4 = request.getSession(true);
                                                String h4 = String.valueOf(misession4.getAttribute("repeticiones"));
                                                if (h4 != "null") {
                                            %>

                                            <p>&nbsp;</p><input id="Cantidad" type="text" class="form-control" placeholder="Cantidad" value="<%=h4%>">

                                            <%
                                                } else {
                                            %>

                                            <p>&nbsp;</p><input id="Cantidad" type="text" class="form-control" placeholder="Cantidad">

                                            <%                   
                                                }
                                            %>
                                        </div>
                                    </div>
                                </center>

                                <center>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <img src="https://image.flaticon.com/icons/svg/727/727613.svg" alt="Sports Time" width=30 height=30 hspace="50">

                                            <%  
                                                HttpSession misession5 = request.getSession(true);
                                                String h5 = String.valueOf(misession4.getAttribute("Distancia"));
                                                if (h4 != "null") {
                                            %>

                                            <input id="Distancia" type="text" class="form-control" placeholder="Distancia" value="<%=h5%>">

                                            <%
                                                } else {
                                            %>

                                            <input id="Distancia" type="text" class="form-control" placeholder="Distancia">

                                            <%                                                
                                                }
                                            %>

                                        </div>
                                    </div>
                                </center>
                            </div>

                        </center>

                    </div>

                    <center>
                        <div style="align-self: center; align-content: center;">                           
                            <%                                
                                int u = 1;
                                for (int i = 0; i < temp2.length; i++) {
                                    if (lista1.findAll().get(temp2[i]).getAthele0().equals("Asistio")) {
                                        String Name_Athele = "Name_Athele" + u;
                                        String Minutos = "Minutos" + u;
                                        String Segundos = "Segundos" + u;
                                        String Centesimas = "Centesimas" + u;
                                        String inicio = "inicio" + u;
                                        String parar = "parar" + u;
                                        String funcion = "inicio" + u + "();";
                                        String funcion2 = "parar" + u + "();";
                                        u++;
                            %>

                            <div>
                                <div id="contenedor1" class="form-check-inline">
                                    <div>
                                        <center>
                                            <div class="form-group">
                                                <input style="border:none; text-align: center;" type="text" readonly="readonly" id="<%=Name_Athele%>" value="<%=lista1.findAll().get(temp2[i]).getName_Athele0()%>"/>
                                            </div>
                                        </center>
                                        <br><br>
                                        <div>
                                            <div class="reloj" id="<%=Minutos%>">00</div>
                                            <div class="reloj" id="<%=Segundos%>">:00</div>
                                            <div class="reloj" id="<%=Centesimas%>">:00</div>
                                        </div>
                                        <br><br><br>
                                        <center>
                                            <input style="display:inline-block;margin-right:5px;" type="button" class="btn btn-success btn-round" id="<%=inicio%>" value="Start &#9658;" onclick="<%=funcion%>">
                                            <input style="display:inline-block;margin-right:5px;" type="button" class="btn btn-danger btn-round" id="<%=parar%>" value="Stop &#8718;" onclick="<%=funcion2%>" disabled>
                                        </center>
                                        <br><br><br>
                                    </div>
                                </div>

                                <%    }
                                    }
                                %>

                            </div>
                        </div>
                    </center>

                    <br><br><br>

                    <center>
                        <div>
                            <input style="display:inline-block;margin-right:5px;" class="btn btn-info btn-lg" id="finalizar" type="submit" value="Finalizar" />
                            <a style="display:inline-block;margin-right:5px;" href="./Management.jsp" class="btn btn-info btn-lg">Volver</a>
                        </div>
                    </center>

                    <br><br><br><br>

                </div>
            </div>
        </div>

        <footer class="footer" style="background-color: #CEEDFF;">
            <div class="container">
                <br>
                <center>
                    &copy;
                    <script>
            document.write(new Date().getFullYear())
                    </script>, Hecho por Sara Chamseddine, Juan Camilo Botonero, Sebastián Rojas, Diego León, Mario Bolaños
                </center>
            </div>
        </footer>

    </div>






    <!--   Core JS Files   -->
    <script class="cssdeck" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
    <script src="./assets/js/core/jquery.min.js"></script>
    <script src="./assets/js/core/popper.min.js"></script>
    <script src="./assets/js/bootstrap-material-design.js"></script>
    <!--  Plugin for Date Time Picker and Full Calendar Plugin  -->
    <script src="./assets/js/plugins/moment.min.js"></script>
    <!--	Plugin for the Datepicker, full documentation here: https://github.com/Eonasdan/bootstrap-datetimepicker -->
    <script src="./assets/js/plugins/bootstrap-datetimepicker.min.js"></script>
    <!--	Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
    <script src="./assets/js/plugins/nouislider.min.js"></script>
    <!-- Material Kit Core initialisations of plugins and Bootstrap Material Design Library -->
    <script src="./assets/js/material-kit.js?v=2.0.2"></script>
    <!-- Fixed Sidebar Nav - js With initialisations For Demo Purpose, Don't Include it in your project -->
    <script src="./assets/assets-for-demo/js/material-kit-demo.js"></script>
    <script>
            $(document).ready(function () {

                //init DateTimePickers
                materialKit.initFormExtendedDatetimepickers();

                // Sliders Init
                materialKit.initSliders();
            });
    </script>

</body>


</html>
