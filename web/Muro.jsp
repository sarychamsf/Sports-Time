<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="Dao.Crud_Athele"%>
<%@page import="Dao.Crud_Comments_User"%>
<%@page import="Dao.Crud_Comments"%>
<%@page import="Dao.Crud_Coach"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <head>

        <script src="https://code.jquery.com/jquery-1.9.1.js"></script>
        <script src="Script/script1.js" type="text/javascript"></script>
        <script src="js/Comments_funcion.js" type="text/javascript"></script>

        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

        <!-- Favicons -->
        <link rel="apple-touch-icon" href="./assets/img/kit/free/favicon.png">
        <link rel="icon" href="./assets/img/kit/free/favicon.png">
        <title>
            Sports Time - Muro
        </title>
        <!--     Fonts and icons     -->
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
        <link rel="stylesheet" href="./assets/css/material-kit.css?v=2.0.2">

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


        <%                  HttpSession misession = request.getSession(true);
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


        <script>
            $(document).ready(function () {
                $('#publicar').click(function (event) {

                 
                    var name = $('#name').val();
                    var mensaje = $('#mensaje').val();
                    var duracion = $('#duracion').val();

                    $.ajax({
                        url: "Wall_Servlet",
                        data: {temp: "publicar", name: name, mensaje: mensaje, duracion: duracion},
                        type: "POST",
                        success: function (respuesta) {
                            if (respuesta.trim() == "publicar") {
                                window.location.replace("Muro.jsp");
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
                        url: "Wall_Servlet",
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
                            <a class="nav-link" rel="tooltip" title="" data-placement="bottom" href="https://www.instagram.com/sports_time_usa/" target="_blank" data-original-title="Síguenos en Instagram">
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
                                        <h3 class="info-title"> <img src="https://image.flaticon.com/icons/svg/149/149066.svg" alt="Rutina" width=36 height=36 hspace="5"> Muro - Notificaciones.</h3>
                                        <p class="description" align="center">
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Publica una notificación:
                                        </p>
                                        <center>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <div class="form-check form-check-radio form-check-inline">
                                                <h6>Ayuda:</h6>
                                                <a tabindex="0" class="button" role="button" data-toggle="popover" data-trigger="focus" title="LAS NOTIFICACIONES..." data-content="Te permiten publicar un mensaje y que los demÃ¡s lo vean. Este posee una duraciÃ³n en DÃAS."><img title="ayuda" src="https://image.flaticon.com/icons/svg/148/148769.svg" alt="Sports Time" width=17 height=17 hspace="10"></a>
                                            </div>
                                        </center>
                                    </div>
                                </div>

                                <div style="background-image: url('assets/img/kit/ft.jpg'); width:450px; height: 500px; align-self: center">
                                    <div class="info info-horizontal">
                                        <h4 class="info-title">Nombre de la notificación:</h4>
                                        <div class="description">
                                            <input id="name" type="text" name="name" class="form-control" placeholder="Título...">
                                        </div>
                                    </div>

                                    <div class="info info-horizontal">
                                        <h4 class="info-title">Duración de la notificación (días):</h4>
                                        <div class="description">

                                            <input id="duracion" type="text" name="duracion" class="form-control" placeholder="Título...">
                                        </div>
                                    </div>

                                    <div class="info info-horizontal">
                                        <div class="description">
                                            <h4 class="info-title">Mensaje:</h4>
                                            <textarea id="mensaje" name="message" rows="10" cols="40" class="form-control" placeholder="Descripción..."></textarea>

                                        </div>
                                    </div>
                                </div>

                                <br>
                                <div class="card-footer justify-content-center">
                                    <input id="publicar" type="submit" value="Publicar" class="btn btn-info btn-round">
                                </div>


                                <center>
                                    <br><br>
                                    <p style="color:#17AEED">_____________________________________________________________________________________________________________________________________________</p>
                                    <br>
                                </center>

                                <%

                                    Crud_Comments co = new Crud_Comments();
                                    Crud_Comments_User couser = new Crud_Comments_User();
                                    Date date = new Date();
                                    DateFormat hourdateFormat = new SimpleDateFormat("yyyy/MM/dd");
                                    String fecha_y_hora = hourdateFormat.format(date);

                                    for (int i = 0; i < co.findAll().size(); i++) {
                                        if (fecha_y_hora.equals(co.findAll().get(i).getDate())) {
                                            co.delete(fecha_y_hora);
                                        }
                                    }

                                    for (int i = 0; i < couser.findAll().size(); i++) {
                                        if (fecha_y_hora.equals(couser.findAll().get(i).getDate())) {
                                            couser.delete(fecha_y_hora);
                                        }
                                    }

                                    for (int i = 0; i < co.findAll().size(); i++) {

                                %> 

                                <div style="background-image: url('assets/img/kit/ft.jpg'); width:600px; height: 500px; align-self: center; padding: 30px">
                                    <center>
                                        <h5 class="info-title"> Publicado por: </h5>
                                        <% out.println("<h2 class=\"text-divider\">" + co.findAll().get(i).getId() + "</h2>"); %>
                                        <br>
                                        <h5 class="info-title"> Título: </h5>
                                        <% out.println("<h2 class=\"text-divider\"> \"" + co.findAll().get(i).getName() + "\"</h2>"); %>
                                        <br>
                                        <h4 class="info-title"> Mensaje: </h4>
                                        <% out.println("<p class=\"text-divider\">" + co.findAll().get(i).getText() + "</p>"); %>
                                    </center>

                                </div>

                                <%

                                    String itera = String.valueOf(i);

                                    for (int i2 = 0; i2 < couser.findAll().size(); i2++) {

                                        if (i2 == 0) {

                                %>

                                <h3 class="info-title" style="align-self: center; margin: 50px">Comentarios de esta publicación:</h3>

                                <%}

                                    if (couser.findAll().get(i2).getIdcomments().equals(itera)) {

                                %> 

                                <div style="background-image: url('assets/img/kit/ft.jpg'); width:800px; height: 300px; align-self: center; padding: 30px">
                                    <center>
                                        <h5 class="info-title"> Comentado por: </h5>
                                        <% out.println("<h3 class=\"text-divider\">" + couser.findAll().get(i2).getId() + "</h3>"); %>
                                        <br>
                                        <h4 class="info-title"> Mensaje: </h4>
                                        <% out.println("<p class=\"text-divider\">" + couser.findAll().get(i2).getText() + "</p>"); %>
                                    </center>

                                </div>


                                <center>
                                    <br><br>
                                    <p style="color:#17AEED">___________________________________________________________________</p>
                                    <br>
                                </center>


                                <%    }

                                    }

                                    String temp1 = "idcomment" + itera;
                                    String temp2 = "mensajecomment" + itera;
                                    String temp3 = "duracioncomment" + itera;
                                    String temp4 = "comentar" + itera;

                                    out.println("</center>");

                                %>


                                <h3 class="info-title" style="align-self: center; margin: 50px">Comenta esta publicación <%=name%>...</h3>

                                <div style="background-image: url('assets/img/kit/ft.jpg'); width:450px; height: 500px; align-self: center">
                                    <div class="info info-horizontal">
                                        <h4 class="info-title">Título:</h4>
                                        <div class="description">
                                            <input id="<%=temp1%>" type="text" readonly=â€readonlyâ€ value="<%=name%>" class="form-control"/> 
                                        </div>
                                    </div>

                                    <div class="info info-horizontal">
                                        <h4 class="info-title">Duración del comentario (días):</h4>
                                        <div class="description">
                                            <input id="<%=temp3%>" type="text" name="duracion" class="form-control" placeholder="Duración...">
                                        </div>
                                    </div>

                                    <div class="info info-horizontal">
                                        <div class="description">
                                            <h4 class="info-title">Comentario:</h4>
                                            <textarea id="<%=temp2%>" name="message" rows="10" cols="40" class="form-control" placeholder="Mensaje..."></textarea>
                                        </div>
                                    </div>

                                    <center>
                                        <input id="<%=temp4%>" type="submit" value="Comentar" onclick="redirigir('<%=itera%>')" class="btn btn-info btn-round">
                                    </center>

                                </div>


                                <br><br><br><br><br><br>

                                <center>
                                    <br><br>
                                    <p style="color:#17AEED">_____________________________________________________________________________________________________________________________________________</p>
                                    <br>
                                </center>

                                <%

                                    }

                                %>



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
