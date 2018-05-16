<%@page import="Dao.Crud_Athele"%>
<%@page import="Dao.Crud_Coach"%>
<%@page import="Dao.Crud_List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <script src="https://code.jquery.com/jquery-1.9.1.js"></script>
        <script src="Script/script1.js" type="text/javascript"></script>
        <script src="Script/script1.js" type="text/javascript"></script>

        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

        <!-- Favicons -->
        <link rel="apple-touch-icon" href="./assets/img/kit/free/favicon.png">
        <link rel="icon" href="./assets/img/kit/free/favicon.png">
        <title>
            Sports Time - Rutinas
        </title>
        <!--     Fonts and icons     -->
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
        <link rel="stylesheet" href="./assets/css/material-kit.css?v=2.0.2">
        <link rel="stylesheet" href="./assets/css/personalizar.css">

        <script>
            $(document).ready(function () {
                $('#Espalda').click(function (event) {

                    var Espalda = $('#Espalda').val();
                    var Libre = $('#Libre').val();
                    var Pecho = $('#Pecho').val();

                    $.ajax({
                        url: "Management_Servlet",
                        data: {Espalda: Espalda, Libre: Libre, Pecho: Pecho},
                        type: "POST",
                        success: function (respuesta) {

                            if (respuesta.trim() == "Espalda") {
                                window.location.replace("Espalda.jsp");
                            } else if (respuesta.trim() == "Libre") {
                                window.location.replace("Libre.jsp");
                            } else if (respuesta.trim() == "Pecho") {
                                window.location.replace("Pecho.jsp");
                            }

                        }
                    });
                });
            });
        </script>

        <script>
            $(document).ready(function () {
                $('#Libre').click(function (event) {

                    var Espalda = $('#Espalda').val();
                    var Libre = $('#Libre').val();
                    var Pecho = $('#Pecho').val();

                    $.ajax({
                        url: "Management_Servlet",
                        data: {Espalda: Espalda, Libre: Libre, Pecho: Pecho},
                        type: "POST",
                        success: function (respuesta) {

                            if (respuesta.trim() == "Espalda") {
                                window.location.replace("Espalda.jsp");
                            } else if (respuesta.trim() == "Libre") {
                                window.location.replace("Libre.jsp");
                            } else if (respuesta.trim() == "Pecho") {
                                window.location.replace("Pecho.jsp");
                            }

                        }
                    });
                });
            });

        </script>

        <script>
            $(document).ready(function () {
                $('#Pecho').click(function (event) {

                    var Espalda = $('#Espalda').val();
                    var Libre = $('#Libre').val();
                    var Pecho = $('#Pecho').val();

                    $.ajax({
                        url: "Management_Servlet",
                        data: {Espalda: Espalda, Libre: Libre, Pecho: Pecho},
                        type: "POST",
                        success: function (respuesta) {

                            if (respuesta.trim() == "Espalda") {
                                window.location.replace("Espalda.jsp");
                            } else if (respuesta.trim() == "Libre") {
                                window.location.replace("Libre.jsp");
                            } else if (respuesta.trim() == "Pecho") {
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

    </head>

    <body class="index-page" style="background-color: #CEEDFF;">


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
        <div style="margin-top: 10px;">
            <center>
                <a style="display:inline-block;margin-right:5px;" class="nav-link" rel="tooltip" title="" data-placement="bottom" href="https://twitter.com/SportsTimeUSA" target="_blank" data-original-title="Síguenos en Twitter">
                    <i class="fa fa-twitter"></i>
                </a>
                <a style="display:inline-block;margin-right:5px;" class="nav-link" rel="tooltip" title="" data-placement="bottom" href="https://www.facebook.com/Sports-Time-448388048915031/" target="_blank" data-original-title="Síguenos en Facebook">
                    <i class="fa fa-facebook-square"></i>
                </a>
                <a style="display:inline-block;" class="nav-link" rel="tooltip" title="" data-placement="bottom" href="https://www.instagram.com/sports_time_usa/" target="_blank" data-original-title="Síguenos en Instagram">
                    <i class="fa fa-instagram"></i>
                </a>
            </center>
        </div>
        <br>
        <center>
            <div style="margin-bottom: 10px;">
                <a style="display:inline-block;margin-right:5px;" class="nav-link" rel="tooltip" title="" data-placement="bottom" href="./Coach.jsp" data-original-title="Perfil">
                    <i class="material-icons">face</i>
                </a>
                <input style="display:inline-block;" style="margin-bottom: 20px;" id="sesionclose" type="submit" value="Cerrar Sesión" class="btn btn-info btn-round">
            </div>
        </center>
    </div>

    <br>
    <div  class="page-header" style="">   
        <div class="container">            
            <div class="row">
                <div class="col-md-10 ml-auto mr-auto">
                    <div class="card card-signup">
                        <br><br><br>
                        <div class="container">
                            <div class="row">
                                <div class="col-md-4 ml-auto mr-auto">
                                    <div class="card card-signup" style="background-image: url('assets/img/kit/ft.jpg');">
                                        <div class="card-header text-center" style="background-image: url('assets/img/kit/azul.jpg');">
                                            <h5 class="card-title text-center"><b>GESTIÓN DE RUTINAS</b></h5>
                                        </div>

                                        <p class="text-divider">Selecciona la rutina:</p>

                                        <%
                                            Crud_Athele lista = new Crud_Athele();
                                        %>

                                        <div class="card-footer justify-content-center">
                                            <input id="Espalda" type="submit" value="Espalda" onClick="value = 1" class ="btn btn-info btn-round" />
                                        </div>

                                        <div class="card-footer justify-content-center">
                                            <input type="submit" id="Libre" value="Libre" onClick="value = 1" class ="btn btn-info btn-round" />
                                        </div>

                                        <div class="card-footer justify-content-center">
                                            <input type="submit" id="Pecho" value="Pecho" onClick="value = 1" class ="btn btn-info btn-round" />
                                        </div>

                                        <div class="card-footer justify-content-center">
                                            <a href="./Coach.jsp" class="btn btn-info btn-round">Volver</a>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <br>

                        </div>
                    </div>
                </div>
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
