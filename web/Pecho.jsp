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

        <script>
            $(document).ready(function () {
                $('#finalizar').click(function (event) {


            <%

                Crud_List lista2 = new Crud_List();
                Crud_Athele athel2 = new Crud_Athele();
                Crud_Coach crr2 = new Crud_Coach();

                int[] temp22 = new int[6];
                int y2 = 0;

                HttpSession misession12 = request.getSession(true);
                String h22 = String.valueOf(misession12.getAttribute("jornada"));

                HttpSession misession22 = request.getSession(true);
                String h12 = String.valueOf(misession22.getAttribute("v"));
                int identifiquer22 = Integer.parseInt(h12);

                Date date2 = new Date();
                DateFormat hourdateFormat2 = new SimpleDateFormat("yyyy/MM/dd");
                System.out.println("Hora y fecha: " + hourdateFormat2.format(date2));
                String fecha_y_hora2 = hourdateFormat2.format(date2);

                List1 listxx = new List1();

                System.out.println("este es del el ajax");
                System.out.println(listxx.getJornada());
                System.out.println(misession12.getAttribute("jornada"));
                System.out.println("este es del el ajax");

                for (int i = 0; i < lista2.findAll().size(); i++) {

                    if (lista2.findAll().get(i).getDate().equals(fecha_y_hora2) && lista2.findAll().get(i).getCoach_Name().equals(crr2.findAll().get(identifiquer22).getName() + " " + crr2.findAll().get(identifiquer22).getLastname()) && lista2.findAll().get(i).getJornada().equals(h22)) {
                        temp22[y2] = i;

                        y2++;
                    }

                }

                if (lista2.findAll().get(temp22[0]).getAthele0().equals("Asistio")) {


            %>
                    var Name_Athele0 = document.getElementById("Name_Athele0").innerHTML;
                    var Athele0 = cronometro1();

            <%                } else {


            %>
                    var Name_Athele0 = null;
                    var Athele0 = null;


            <%        }
            %>







            <%
                if (lista2.findAll().get(temp22[1]).getAthele0().equals("Asistio")) {


            %>
                    var Name_Athele1 = document.getElementById("Name_Athele1").innerHTML;
                    var Athele1 = cronometro2();

            <%                } else {


            %>
                    var Name_Athele1 = null;
                    var Athele1 = null;


            <%        }
            %>


            <%
                if (lista2.findAll().get(temp22[2]).getAthele0().equals("Asistio")) {


            %>
                    var Name_Athele2 = document.getElementById("Name_Athele2").innerHTML;
                    var Athele2 = cronometro3();

            <%                } else {


            %>
                    var Name_Athele2 = null;
                    var Athele2 = null;


            <%        }
            %>

            <%
                if (lista2.findAll().get(temp22[3]).getAthele0().equals("Asistio")) {


            %>
                    var Name_Athele3 = document.getElementById("Name_Athele3").innerHTML;
                    var Athele3 = cronometro4();

            <%                } else {


            %>
                    var Name_Athele3 = null;
                    var Athele3 = null;


            <%        }
            %>

            <%
                if (lista2.findAll().get(temp22[4]).getAthele0().equals("Asistio")) {


            %>
                    var Name_Athele4 = document.getElementById("Name_Athele4").innerHTML;
                    var Athele4 = cronometro5();

            <%                } else {


            %>
                    var Name_Athele4 = null;
                    var Athele4 = null;


            <%        }
            %>

            <%
                if (lista2.findAll().get(temp22[5]).getAthele0().equals("Asistio")) {


            %>
                    var Name_Athele5 = document.getElementById("Name_Athele5").innerHTML;
                    var Athele5 = cronometro6();

            <%                } else {


            %>
                    var Name_Athele5 = null;
                    var Athele5 = null;


            <%        }
            %>






                    var Cantidad = $('#Cantidad').val();
                    var Distancia = $('#Distancia').val();

                    $.ajax({
                        url: "Pecho_Servlet",
                        data: {Cantidad: Cantidad, Distancia: Distancia, Name_Athele0: Name_Athele0, Athele0: Athele0, Name_Athele1: Name_Athele1, Athele1: Athele1, Name_Athele2: Name_Athele2, Athele2: Athele2, Name_Athele3: Name_Athele3, Athele3: Athele3, Name_Athele4: Name_Athele4, Athele4: Athele4, Name_Athele5: Name_Athele5, Athele5: Athele5},
                        type: "POST",
                        success: function (respuesta) {

                            if (respuesta) {
                                window.location.replace("Management.jsp");
                            }

                        }
                    });
                });
            });

        </script>

    </head>

    <body class="signup-page ">


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
                            <a href="./Coach.jsp" class="btn btn-info btn-round">Perfil</a>
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

        <div class="page-header " data-parallax="true" style="background-image: url('assets/img/kit/bg2.jpg'); background-size: cover; background-position: top center">
            <br><br><br><br><br><br><br><br><br><br><br>
            <div class="main main-raised">
                <div class="profile-content">

                    <center>
                        <div class="profile">
                            <br><br>
                            <h2 class="card-title text-center">Rutinas de Pecho</h2>
                            <br>
                        </div>
                    </center>
                    <div class="card-body" >
                        <center>
                            <p>______________________________________________________________________________________________________________________________________________________________________________________________________________________________________________</p>
                            <br>
                        </center>
                        <div style="align-self: center; margin-left: 640px;">

                            <div style="width:300px; height:200px;">
                                <center>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <img src="https://image.flaticon.com/icons/svg/106/106954.svg" alt="Sports Time" width=30 height=30 hspace="50">
                                            <p>&nbsp;</p><input id="Cantidad" type="text" class="form-control" placeholder="Cantidad">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="input-group">
                                            <img src="https://image.flaticon.com/icons/svg/727/727613.svg" alt="Sports Time" width=30 height=30 hspace="50">
                                            <input id="Distancia" type="text" class="form-control" placeholder="Distancia">
                                        </div>
                                    </div>
                                </center>

                            </div>

                            <%    Crud_List lista1 = new Crud_List();
                                Crud_Athele athele = new Crud_Athele();
                                Crud_Coach crr = new Crud_Coach();

                                int[] temp2 = new int[6];
                                int y = 0;

                                HttpSession misession1 = request.getSession(true);
                                String h = String.valueOf(misession1.getAttribute("jornada"));

                                HttpSession misession2 = request.getSession(true);
                                String h1 = String.valueOf(misession2.getAttribute("v"));
                                int identifiquer = Integer.parseInt(h1);

                                Date date = new Date();
                                DateFormat hourdateFormat = new SimpleDateFormat("yyyy/MM/dd");
                                System.out.println("Hora y fecha: " + hourdateFormat.format(date));
                                String fecha_y_hora = hourdateFormat.format(date);

                                System.out.println("-----------------------------------------");
                                System.out.println(lista1.findAll().get(0).getDate());
                                System.out.println(lista1.findAll().get(0).getCoach_Name());
                                System.out.println(lista1.findAll().get(0).getJornada());
                                System.out.println("-----------------------------------------");

                                System.out.println("-----------------------------------------");
                                System.out.println(fecha_y_hora);
                                System.out.println(h1);
                                System.out.println(h);
                                System.out.println("-----------------------------------------");

                                for (int i = 0; i < lista1.findAll().size(); i++) {

                                    if (lista1.findAll().get(i).getDate().equals(fecha_y_hora) && lista1.findAll().get(i).getCoach_Name().equals(crr.findAll().get(identifiquer).getName() + " " + crr.findAll().get(identifiquer).getLastname()) && lista1.findAll().get(i).getJornada().equals(h)) {
                                        temp2[y] = i;
                                        y++;
                                    }

                                }

                                if (lista1.findAll().get(temp2[0]).getAthele0().equals("Asistio")) {


                            %>

                        </div>

                        <center>
                            <p>______________________________________________________________________________________________________________________________________________________________________________________________________________________________________________</p>
                            <div class="form-group">

                                <div id="contenedor1" class="form-check-inline">
                                    <div style="margin: 50px;">
                                        <div class="form-group">
                                            <label class="plabel" id="Name_Athele0"><%=lista1.findAll().get(temp2[0]).getName_Athele0()%></label>
                                        </div>

                                        <p>&nbsp;</p>
                                        <div class="reloj" id="Minutos1">00</div>
                                        <div class="reloj" id="Segundos1">:00</div>
                                        <div class="reloj" id="Centesimas1">:00</div>
                                        <p>&nbsp;</p>
                                        <br><br>
                                        <input type="button" class="btn btn-success btn-round" id="inicio1" value="Start &#9658;" onclick="inicio1();">

                                        <input type="button" class="btn btn-danger btn-round" id="parar1" value="Stop &#8718;" onclick="parar1();" disabled>

                                        <p>&nbsp;</p>
                                        <p>&nbsp;</p>
                                    </div>

                                </div>

                                <%    }
                                %>

                                <%
                                    if (lista1.findAll().get(temp2[1]).getAthele0().equals("Asistio")) {
                                %>

                                <div id="contenedor2" class="form-check-inline">
                                    <div style="margin: 50px;">
                                        <div class="form-group">
                                            <label class="plabel" id="Name_Athele1"><%=lista1.findAll().get(temp2[1]).getName_Athele0()%></label>
                                        </div>
                                        <p>&nbsp;</p>
                                        <div class="reloj" id="Minutos2">00</div>
                                        <div class="reloj" id="Segundos2">:00</div>
                                        <div class="reloj" id="Centesimas2">:00</div>
                                        <p>&nbsp;</p>
                                        <br><br>
                                        <input type="button" class="btn btn-success btn-round" id="inicio2" value="Start &#9658;" onclick="inicio2();">

                                        <input type="button" class="btn btn-danger btn-round" id="parar2" value="Stop &#8718;" onclick="parar2();" disabled>

                                        <p>&nbsp;</p>
                                        <p>&nbsp;</p>
                                    </div>

                                </div>

                                <%    }
                                %>

                                <%
                                    if (lista1.findAll().get(temp2[2]).getAthele0().equals("Asistio")) {


                                %>


                                <div id="contenedor3" class="form-check-inline">
                                    <div style="margin: 50px;">
                                        <div class="form-group">
                                            <label class="plabel" id="Name_Athele2"><%=lista1.findAll().get(temp2[2]).getName_Athele0()%></label>
                                        </div>

                                        <p>&nbsp;</p>
                                        <div class="reloj" id="Minutos3">00</div>
                                        <div class="reloj" id="Segundos3">:00</div>
                                        <div class="reloj" id="Centesimas3">:00</div>
                                        <p>&nbsp;</p>

                                        <br><br>
                                        <input type="button" class="btn btn-success btn-round" id="inicio3" value="Start &#9658;" onclick="inicio3();">
                                        <input type="button" class="btn btn-danger btn-round" id="parar3" value="Stop &#8718;" onclick="parar3();" disabled>

                                        <p>&nbsp;</p>
                                        <p>&nbsp;</p>
                                    </div>
                                </div>

                                <%    }
                                %>

                                <%
                                    if (lista1.findAll().get(temp2[3]).getAthele0().equals("Asistio")) {


                                %>

                                <div id="contenedor4" class="form-check-inline">
                                    <div style="margin: 50px;">
                                        <div class="form-group">
                                            <label class="plabel" id="Name_Athele3"><%=lista1.findAll().get(temp2[3]).getName_Athele0()%></label>
                                        </div>
                                        <p>&nbsp;</p>
                                        <div class="reloj" id="Minutos4">00</div>
                                        <div class="reloj" id="Segundos4">:00</div>
                                        <div class="reloj" id="Centesimas4">:00</div>
                                        <p>&nbsp;</p>
                                        <br><br>
                                        <input type="button" class="btn btn-success btn-round" id="inicio4" value="Start &#9658;" onclick="inicio4();">
                                        <input type="button" class="btn btn-danger btn-round" id="parar4" value="Stop &#8718;" onclick="parar4();" disabled>

                                        <p>&nbsp;</p>
                                        <p>&nbsp;</p>
                                    </div>
                                </div>

                                <%    }
                                %>

                                <%
                                    if (lista1.findAll().get(temp2[4]).getAthele0().equals("Asistio")) {


                                %>

                                <div id="contenedor5" class="form-check-inline">
                                    <div style="margin: 50px;">
                                        <div class="form-group">
                                            <label class="plabel" id="Name_Athele4"><%=lista1.findAll().get(temp2[4]).getName_Athele0()%></label>
                                        </div>
                                        <p>&nbsp;</p>
                                        <div class="reloj" id="Minutos5">00</div>
                                        <div class="reloj" id="Segundos5">:00</div>
                                        <div class="reloj" id="Centesimas5">:00</div>
                                        <p>&nbsp;</p>
                                        <br><br>
                                        <input type="button" class="btn btn-success btn-round" id="inicio5" value="Start &#9658;" onclick="inicio5();">
                                        <input type="button" class="btn btn-danger btn-round" id="parar5" value="Stop &#8718;" onclick="parar5();" disabled>

                                        <p>&nbsp;</p>
                                        <p>&nbsp;</p>
                                    </div>
                                </div>

                                <%    }
                                %>

                                <%
                                    if (lista1.findAll().get(temp2[5]).getAthele0().equals("Asistio")) {
                                %>

                                <div id="contenedor6" class="form-check-inline">
                                    <div style="margin: 50px;">
                                        <div class="form-group">
                                            <label class="plabel" id="Name_Athele5"><%=lista1.findAll().get(temp2[5]).getName_Athele0()%></label>
                                        </div>
                                        <p>&nbsp;</p>
                                        <div class="reloj" id="Minutos6">00</div>
                                        <div class="reloj" id="Segundos6">:00</div>
                                        <div class="reloj" id="Centesimas6">:00</div>
                                        <p>&nbsp;</p>
                                        <br><br>
                                        <input type="button" class="btn btn-success btn-round" id="inicio6" value="Start &#9658;" onclick="inicio6();">
                                        <input type="button" class="btn btn-danger btn-round" id="parar6" value="Stop &#8718;" onclick="parar6();" disabled>

                                        <p>&nbsp;</p>
                                        <p>&nbsp;</p>
                                    </div>
                                </div>

                            </div>
                        </center>
                        <%    }
                        %>

                        <br>
                        <center>
                            <div>
                                <input class="btn btn-info btn-lg" id="finalizar" type="submit" value="Finalizar" />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="./Management.jsp" class="btn btn-info btn-lg">Volver</a>
                            </div>
                        </center>
                        <br><br><br><br>

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
