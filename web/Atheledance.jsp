<%@page import="Dao.Crud_Coach"%>
<%@page import="Dao.Crud_Athele"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <script src="https://code.jquery.com/jquery-1.9.1.js"></script>
        <script src="Script/script1.js" type="text/javascript"></script>

        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

        <!-- Favicons -->
        <link rel="apple-touch-icon" href="./assets/img/kit/free/favicon.png">
        <link rel="icon" href="./assets/img/kit/free/favicon.png">
        <title>
            Sports Time - Asistencia
        </title>
        <!--     Fonts and icons     -->
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
        <link rel="stylesheet" href="./assets/css/material-kit.css?v=2.0.2">

        <script>

            $(document).ready(function () {
                $('#listar1').click(function (event) {

                    var Name_Athele0 = document.getElementById("Name_Athele0").innerHTML;
                    var Athele0 = $('#Athele0').val();

                    var Name_Athele1 = document.getElementById("Name_Athele1").innerHTML;
                    var Athele1 = $('#Athele1').val();

                    var Name_Athele2 = document.getElementById("Name_Athele2").innerHTML;
                    var Athele2 = $('#Athele2').val();

                    var Name_Athele3 = document.getElementById("Name_Athele3").innerHTML;
                    var Athele3 = $('#Athele3').val();

                    var Name_Athele4 = document.getElementById("Name_Athele4").innerHTML;
                    var Athele4 = $('#Athele4').val();

                    var Name_Athele5 = document.getElementById("Name_Athele5").innerHTML;
                    var Athele5 = $('#Athele5').val();

                    var Coach_Name = document.getElementById("Coach_Name").innerHTML;
                    var Jornada = document.getElementById("Jornada").innerHTML;

                    $.ajax({
                        url: "Attendance_Servlet",
                        data: {Name_Athele0: Name_Athele0, Athele0: Athele0, Name_Athele1: Name_Athele1, Athele1: Athele1, Name_Athele2: Name_Athele2, Athele2: Athele2, Name_Athele3: Name_Athele3, Athele3: Athele3, Name_Athele4: Name_Athele4, Athele4: Athele4, Name_Athele5: Name_Athele5, Athele5: Athele5, Coach_Name: Coach_Name, Jornada: Jornada},
                        type: "POST",
                        success: function (respuesta) {
                            if (respuesta) {
                                window.location.replace("Coach.jsp");
                            }
                        }
                    });
                });
            });

        </script>

    </head>

    <body class="signup-page">

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
                            <a class="nav-link" rel="tooltip" title="" data-placement="bottom" href="./Coach.jsp" data-original-title="Perfil">
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

                                <%
                                    Crud_Athele crr2 = new Crud_Athele();
                                    Crud_Coach crr = new Crud_Coach();
                                    HttpSession misession1 = request.getSession(true);
                                    String h = String.valueOf(misession1.getAttribute("Role"));
                                    HttpSession misession2 = request.getSession(true);
                                    String h1 = String.valueOf(misession2.getAttribute("v"));
                                    int identifiquer = Integer.parseInt(h1);
                                    int[] temp2 = new int[6];
                                    int y = 0;
                                    for (int i = 0; i < crr2.findAll().size(); i++) {
                                        if (crr2.findAll().get(i).getCoach().equals(crr.findAll().get(identifiquer).getName() + " " + crr.findAll().get(identifiquer).getLastname()) && crr2.findAll().get(i).getJornada().equals(h)) {
                                            temp2[y] = i;
                                            y++;
                                        }
                                    }
                                    String fotoName = crr.findAll().get(identifiquer).getFotoName();
                                %>

                                <center>
                                    <div class="profile">
                                        <div class="avatar">
                                            <h2 class="card-title text-center">Lista de Asistencia</h2> <br>
                                            <img src="fotosdb/<%=fotoName%>" alt="Circle Image" class="img-raised rounded-circle img-fluid"  width=200 height=200>
                                            <br>
                                        </div>
                                    </div>
                                </center>

                                <div id="login" class="form-action show">

                                    <center>
                                        <br>
                                        <label id="Coach_Name"><%=crr.findAll().get(identifiquer).getName() + " " + crr.findAll().get(identifiquer).getLastname()%></label>
                                        <br>
                                        <label id="Jornada"><%=h%></label>
                                        <br><br>
                                    </center>


                                    <center>
                                        <h3 class="card-title text-center">Deportistas:</h3><br>
                                        <div class="form-group">
                                            <div class="form-check form-check-radio form-check-inline">
                                                <h6>Tomar Asistencia:</h6>
                                                <a tabindex="0" class="button" role="button" data-toggle="popover" data-trigger="focus" title="PARA TOMAR LISTA:" data-content="Selecciona los deportistas presentes y presiona el botón LISTO."><img title="ayuda" src="https://image.flaticon.com/icons/svg/148/148769.svg" alt="Sports Time" width=17 height=17 hspace="10"></a>
                                            </div>
                                        </div>
                                    </center>


                                    <center>
                                        <label class="plabel"><b>1 </b></label>
                                        <input type="checkbox" id="Athele0" value="Role_Entrenador" onClick="value = 1"/>
                                        <label id="Name_Athele0" class="plabel"><%=crr2.findAll().get(temp2[0]).getName() + " " + crr2.findAll().get(temp2[0]).getLastname()%></label>
                                        <br>

                                        <label class="plabel"><b>2 </b></label>
                                        <input type="checkbox" id="Athele1" value="Role_Entrenador" onClick="value = 1"/>
                                        <label id="Name_Athele1" class="plabel"><%=crr2.findAll().get(temp2[1]).getName() + " " + crr2.findAll().get(temp2[1]).getLastname()%></label>
                                        <br>

                                        <label class="plabel"><b>3 </b></label>
                                        <input type="checkbox" id="Athele2" value="Role_Entrenador" onClick="value = 1"/>
                                        <label id="Name_Athele2" class="plabel"><%=crr2.findAll().get(temp2[2]).getName() + " " + crr2.findAll().get(temp2[2]).getLastname()%></label>
                                        <br>

                                        <label class="plabel"><b>4 </b></label>
                                        <input type="checkbox" id="Athele3" value="Role_Entrenador" onClick="value = 1"/>
                                        <label id="Name_Athele3" class="plabel"><%=crr2.findAll().get(temp2[3]).getName() + " " + crr2.findAll().get(temp2[3]).getLastname()%></label>
                                        <br>

                                        <label class="plabel"><b>5 </b></label>
                                        <input type="checkbox" id="Athele4" value="Role_Entrenador" onClick="value = 1"/>
                                        <label id="Name_Athele4" class="plabel"><%=crr2.findAll().get(temp2[4]).getName() + " " + crr2.findAll().get(temp2[4]).getLastname()%></label>
                                        <br>

                                        <label class="plabel"><b>6 </b></label>
                                        <input type="checkbox" id="Athele5" value="Role_Entrenador" onClick="value = 1"/>
                                        <label id="Name_Athele5" class="plabel"><%=crr2.findAll().get(temp2[5]).getName() + " " + crr2.findAll().get(temp2[5]).getLastname()%></label>


                                        <br><br><br>
                                        <input class="btn btn-info btn-round" id="listar1" type="submit" value="Listo"/>
                                        <a href="./Coach.jsp" class="btn btn-info btn-round">Cancelar</a>
                                        <br>
                                        <br>

                                    </center>
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
