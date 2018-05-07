<%@page import="Dao.Crud_Request"%>
<%@page import="Dao.Crud_Athele"%>
<%@page import="Dao.Crud_Coach"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <head>

        <script src="https://code.jquery.com/jquery-1.9.1.js"></script>
        <script src="Script/script1.js" type="text/javascript"></script>
        <script src="Script/script1.js" type="text/javascript"></script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://code.jquery.com/jquery-1.9.1.js"></script>
        <script src="Script/script1.js" type="text/javascript"></script>
        <script src="Scriagregadopt/script1.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/Profile_funcion.js"></script>

        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
        <link rel="stylesheet" href="./assets/css/material-kit.css?v=2.0.2">

        <title>Sports Time - Amigos</title>

        <%
            HttpSession misession34 = request.getSession(true);
            String rol = String.valueOf(misession34.getAttribute("usuario"));
            String ju = null;
            if (rol.equals("Entrenador")) {
                ju = "Coach.jsp";
            } else if (rol.equals("Deportista")) {
                ju = "Athlete.jsp";
            }

        %>

        <script>
            $(document).ready(function () {
                $('#agregar').click(function (event) {

                    
                    var destiny = $('#destiny').val();
                    $.ajax({
                        url: "Request_Servlet",
                        data: {temp: "agregar", destiny: destiny},
                        type: "POST",
                        success: function (respuesta) {
                            if (respuesta.trim() == "agregado") {
                                window.location.replace("Solicitudes.jsp");
                            }


                        }
                    });
                });
            });
        </script>

        <script>
            $(document).ready(function () {
                $('#volver').click(function (event) {

                    $.ajax({
                        url: "Request_Servlet",
                        data: {temp: "volver"},
                        type: "POST",
                        success: function (respuesta) {
                            if (respuesta.trim() == "volver") {
                                window.location.replace("<%=ju%>");
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
                            <input id="volver" type="submit" value="volver" class="btn btn-info btn-round">
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" rel="tooltip" title="" data-placement="bottom" href="https://twitter.com/sarychamsf" target="_blank" data-original-title="SÃ­guenos en Twitter">
                                <i class="fa fa-twitter"></i>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" rel="tooltip" title="" data-placement="bottom" href="https://www.facebook.com/sarychamsf" target="_blank" data-original-title="SÃ­guenos en Facebook">
                                <i class="fa fa-facebook-square"></i>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" rel="tooltip" title="" data-placement="bottom" href="https://www.instagram.com/sports_time_usa/" target="_blank" data-original-title="SÃ­guenos en Instagram">
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
                                    HttpSession misession = request.getSession(true);
                                    String name = null;
                                    String fotoName = null;

                                    if (misession.getAttribute("usuario") == "Entrenador") {

                                        Crud_Coach crr = new Crud_Coach();
                                        HttpSession misession1 = request.getSession(true);
                                        String h = String.valueOf(misession1.getAttribute("v"));
                                        int identifiquer = Integer.parseInt(h);
                                        name = crr.findAll().get(identifiquer).getName() + " " + crr.findAll().get(identifiquer).getLastname();
                                        fotoName = crr.findAll().get(identifiquer).getFotoName();
                                    }

                                    if (misession.getAttribute("usuario") == "Deportista") {

                                        Crud_Athele crr = new Crud_Athele();
                                        HttpSession misession1 = request.getSession(true);
                                        String h = String.valueOf(misession1.getAttribute("v"));
                                        int identifiquer = Integer.parseInt(h);
                                        name = crr.findAll().get(identifiquer).getName() + " " + crr.findAll().get(identifiquer).getLastname();
                                        fotoName = crr.findAll().get(identifiquer).getFotoName();
                                    }


                                %>


                                <h2 class="card-title text-center"><%=name%></h2> <br>

                                <center>
                                    <div class="profile">
                                        <div class="avatar">
                                            <img src="fotosdb/<%=fotoName%>" alt="Circle Image" class="img-raised rounded-circle img-fluid" width=200 height=200>
                                        </div>
                                    </div>
                                </center>

                                <div class="info info-horizontal">
                                    <div class="description">
                                        <h3 class="info-title"> <img src="https://image.flaticon.com/icons/svg/149/149066.svg" alt="Rutina" width=36 height=36 hspace="5"> Amigos </h3>
                                        <center>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <div class="form-check form-check-radio form-check-inline">
                                                <h6>Ayuda:</h6>
                                                <a tabindex="0" class="button" role="button" data-toggle="popover" data-trigger="focus" title="AMIGOS" data-content="Ve tus amigos, aÃ±ade usuarios y consulta sus perfiles."><img title="ayuda" src="https://image.flaticon.com/icons/svg/148/148769.svg" alt="Sports Time" width=17 height=17 hspace="10"></a>
                                            </div>
                                        </center>
                                    </div>
                                </div>

                                <div class="card-body">

                                    <div class="row">
                                        <div class="col-md-5 mr-auto">
                                            <h3 class="info-title">&nbsp;&nbsp;Enviar solicitud de amistad </h3> <br>
                                            <div style="background-image: url('assets/img/kit/ft.jpg'); width:350px; height: 200px; align-self: center; padding: 30px">
                                                <center>
                                                    <h4 class="info-title">Agrega a tu amigo:</h4>
                                                    <div class="description" style="border: 50px;">
                                                        <input id="destiny" type="text" name="name" class="form-control" placeholder="Nombre de tu amigo">
                                                        <br>
                                                        <input id="agregar" type="submit" value="Enviar Solicitud de amistad" class="btn btn-info btn-round">
                                                    </div>
                                                </center>
                                            </div>





                                        </div>
                                        <div class="col-md-5 mr-auto">
                                            <h3 class="info-title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Lista de Amigos </h3><br>
                                            <center>

                                                <div class="description" style="border: 50px;">

                                                    <%
                                                        Crud_Request reques = new Crud_Request();
                                                        String itera = null;
                                                        String name2 = null;
                                                        for (int i = 0; i < reques.findAll().size(); i++) {
                                                            if (reques.findAll().get(i).getState().equals("en espera")) {
                                                            } else if (reques.findAll().get(i).getState().equals("aceptado")) {
                                                                if (reques.findAll().get(i).getUser().equals(name) && reques.findAll().get(i).getState().equals("aceptado")) {
                                                                    name2 = reques.findAll().get(i).getDestiny();
                                                                    out.println("<h4> " + reques.findAll().get(i).getDestiny() + "</h4> ");
                                                                }
                                                                if (reques.findAll().get(i).getDestiny().equals(name) && reques.findAll().get(i).getState().equals("aceptado")) {
                                                                    name2 = reques.findAll().get(i).getUser();
                                                                    out.println("<h4> " + reques.findAll().get(i).getUser() + "</h4> ");
                                                                }
                                                                String tempo = String.valueOf(i);
                                                                itera = "verperfil" + tempo;
                                                    %>

                                                    <input id="<%=itera%>" type="submit" value="Ver perfil" onclick="verperfil('<%=name2%>')" class="btn btn-info btn-round">
                                                    <br><br>

                                                    <%
                                                            }
                                                        }
                                                    %>


                                                </div>
                                            </center>
                                            <br><br>
                                            <h3 class="info-title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Solicitudes de Amistad </h3><br>
                                            <center>
                                                <div class="description" style="border: 50px;">


                                                    <%            String namesolicitud = null;
                                                        String perfil = null;
                                                        String aceptar = null;
                                                        String rechazar = null;

                                                        for (int i = 0; i < reques.findAll().size(); i++) {

                                                            if (reques.findAll().get(i).getDestiny().equals(name) && reques.findAll().get(i).getState().equals("en espera")) {
                                                                namesolicitud = reques.findAll().get(i).getUser();
                                                                out.println("<h4> " + reques.findAll().get(i).getUser() + " " + "te a enviado una solicitud de amistad" + "</h4> ");

                                                                perfil = "verperfil" + i;
                                                                aceptar = "aceptar" + i;
                                                                rechazar = "rechazar" + i;

                                                    %>

                                                    <input id="<%=perfil%>" type="submit" value="Ver perfil" onclick="verperfil('<%=namesolicitud%>')" class="btn btn-info btn-round">
                                                    <input id="<%=aceptar%>" type="submit" value="Aceptar" onclick="aceptar('<%=namesolicitud%>', '<%=name%>')" class="btn btn-info btn-round">
                                                    <input id="<%=rechazar%>" type="submit" value="Rechzar" onclick="rechazar('<%=namesolicitud%>', '<%=name%>')" class="btn btn-info btn-round">

                                                    <%        }

                                                        }

                                                    %>



                                                </div>

                                            </center>
                                        </div>
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
                    </script>, Hecho por Sara Chamseddine, Juan Camilo Botonero, SebastiÃ¡n Rojas, Diego LeÃ³n, Mario BolaÃ±os
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
