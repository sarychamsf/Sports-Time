<%@page import="Dao.Crud_Times"%>
<%@page import="Dao.Crud_Athele"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Dao.Crud_Times"%>
<%@page import="Dao.Crud_Athele"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <head>


        <script type="text/javascript" src="js/chartJS/Chart.min.js"></script>
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/Graficas.js"></script>

        <script src="https://code.jquery.com/jquery-1.9.1.js"></script>
        <script src="Script/script1.js" type="text/javascript"></script>

        <link rel="stylesheet" href="assets/css/style_crono.css">


        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

        <!-- Favicons -->
        <link rel="apple-touch-icon" href="./assets/img/kit/free/favicon.png">
        <link rel="icon" href="./assets/img/kit/free/favicon.png">
        <title>
            Sports Time - Gráficas de Rendimiento
        </title>
        <!--     Fonts and icons     -->
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
        <link rel="stylesheet" href="./assets/css/material-kit.css?v=2.0.2">

        <style>
            .caja{
                margin: auto;
                max-width: 250px;
                padding: 20px;
                border: 1px solid #BDBDBD;
            }
            .caja select{
                width: 100%;
                font-size: 16px;
                padding: 5px;
            }
            .resultados{
                margin: auto;
                margin-top: 40px;
                width: 1000px;
            }
        </style>

    </head>

    <body class="signup-page">

        <script>
            $(document).ready(function () {
                $('#volver').click(function (event) {
                    window.location.replace("uniquegraph.jsp");
                    $.ajax({
                        success: function (respuesta) {
                        }
                    });
                });
            });
        </script>

        <script>
            $(document).ready(function () {
                $('#perfil').click(function (event) {
                    window.location.replace("Athlete.jsp");
                    $.ajax({
                        success: function (respuesta) {
                        }
                    });
                });
            });
        </script>
        <%
        Crud_Athele crr2 = new Crud_Athele();
        HttpSession misession1 = request.getSession(true);
        String h = String.valueOf(misession1.getAttribute("v"));
        int identifiquer = Integer.parseInt(h);
        String nomDep = crr2.findAll().get(identifiquer).getName() + " " + crr2.findAll().get(identifiquer).getLastname();
        String nomEnt = crr2.findAll().get(identifiquer).getCoach();
        %>
        <script>
            $(document).ready(FiltroFecha('<%=nomDep%>', '<%=nomEnt%>'));
        </script>

        <nav class="navbar navbar-transparent navbar-absolute navbar-expand-lg" id="sectionsNav">
            <div class="container">
                <div class="navbar-translate">
                    <div class="brand">
                        <a class="navbar-brand" href="./Login.jsp"> <img src="assets/img/LogoNoLetra.png" alt="Sports Time" width=145 height=145> </a>
                        <a class="navbar-brand" href="./Login.jsp"> <img src="assets/img/Nombre.png" alt="Sports Time" width=400 height=103> </a>
                    </div>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" rel="tooltip" title="" data-placement="bottom" href="./Athlete.jsp" data-original-title="Perfil">
                                <i class="material-icons">face</i>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" rel="tooltip" title="" data-placement="bottom" href="https://twitter.com/sarychamsf" target="_blank" data-original-title="Síguenos en Twitter">
                                <i class="fa fa-twitter"></i>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" rel="tooltip" title="" data-placement="bottom" href="https://www.facebook.com/sarychamsf" target="_blank" data-original-title="Síguenos en Facebook">
                                <i class="fa fa-facebook-square"></i>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" rel="tooltip" title="" data-placement="bottom" href="https://www.instagram.com/sarychamsf" target="_blank" data-original-title="Síguenos en Instagram">
                                <i class="fa fa-instagram"></i>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

        </nav>

        <div class="page-header " style="background-image: url('assets/img/kit/bg2.jpg'); background-size: cover; background-position: top center;">
            <div class="profile-content">
                <div class="container">
                    <div class="row">
                        <div class="col-md-10 ml-auto mr-auto">
                            <div class="card card-signup">

                                <center>
                                    <div class="profile">

                                        <h2 class="card-title text-center">Gráficas de Rendimiento</h2>
                                        <br>
                                    </div>
                                </center>
                                <div class="card-body">



                                    <div id="TAblaJQ">

                                        <center>
                                            <div style="width:100px; height: 50px">
                                                <SELECT class="form-control" name="FehcasF" SIZE="1" id="FehcasF" onchange="FiltroEstilos()" ></SELECT>
                                                <SELECT class="form-control" name="EstilosF" SIZE="1" id="EstilosF" onchange="FiltroDistancia()"></SELECT>
                                                <SELECT class="form-control" name="DistaciaF" SIZE="1" id="DistaciaF" onchange="DatosFiltro('<%=nomDep%>')"></SELECT>
                                            </div>
                                        </center>
                                        <br>
                                        <br>
                                        <br>
                                        <br>
                                        <center>
                                            <button class="btn btn-info btn-round" onclick="GraficaFiltros('<%=nomDep%>')">Grafica</button>
                                        </center>
                                        <br>
                                        <br><br><br>
                                        <div ><canvas id="grafico"></canvas></div>

                                    </div>



                                    <br>
                                    <div class="card-footer justify-content-center">
                                        <a href="./Athlete.jsp" class="btn btn-info btn-round">Volver</a>
                                        <br><br><br><br>
                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>


        <footer class="footer" style="background-image: url('assets/img/kit/ft.jpg'); background-size: cover; background-position: top center;">
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
