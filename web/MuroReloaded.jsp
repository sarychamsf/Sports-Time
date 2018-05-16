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

        <style>

            html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video {
                margin: 0;
                padding: 0;
                border: 0;
                font-size: 100%;
                font: inherit;
                vertical-align: baseline;
                outline: none;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
            }
            html { height: 101%; }
            body { background: #e3e0ef url('images/bg.png'); font-size: 62.5%; line-height: 1; font-family: Arial, sans-serif; padding-bottom: 65px; }

            ::selection { background: #d7d0f3; }
            ::-moz-selection { background: #d7d0f3; }
            ::-webkit-selection { background: #d7d0f3; }

            article, aside, details, figcaption, figure, footer, header, hgroup, menu, nav, section { display: block; }
            ol, ul { list-style: none; }

            blockquote, q { quotes: none; }
            blockquote:before, blockquote:after, q:before, q:after { content: ''; content: none; }
            strong { font-weight: bold; } 

            table { border-collapse: collapse; border-spacing: 0; }
            img { border: 0; max-width: 100%; }


            h1 { font-family: 'Wellfleet', 'Trebuchet MS', Tahoma, Arial, sans-serif; font-size: 2.85em; line-height: 1.6em; font-weight: normal; color: #756f8b; text-shadow: 0px 1px 1px #fff; margin-bottom: 21px; }

            p { font-family: Arial, Geneva, Verdana, sans-serif; font-size: 1.3em; line-height: 1.42em; margin-bottom: 12px; font-weight: normal; color: #656565; }

            a { color: #896dc6; text-decoration: none; }
            a:hover { text-decoration: underline; }

            /* page layout structure */ 
            #w { display: block; width: 700px; margin: 0 auto; padding-top: 35px; }

            #container { 
                display: block; 
                width: 100%; 
                background: #fff; 
                padding: 14px 20px; 
                -webkit-border-radius: 4px; 
                -moz-border-radius: 4px; 
                border-radius: 4px; 
                -webkit-box-shadow: 1px 1px 1px rgba(0,0,0,0.3);
                -moz-box-shadow: 1px 1px 1px rgba(0,0,0,0.3);
                box-shadow: 1px 1px 1px rgba(0,0,0,0.3);
            }


            #comments { display: block; }

            #comments .cmmnt, ul .cmmnt, ul ul .cmmnt { display: block; position: relative; padding-left: 65px; border-top: 1px solid #ddd; }

            #comments .cmmnt .avatar  { position: absolute; top: 8px; left: 0; }
            #comments .cmmnt .avatar img { 
                -webkit-border-radius: 3px; 
                -moz-border-radius: 3px; 
                border-radius: 3px; 
                -webkit-box-shadow: 1px 1px 2px rgba(0,0,0,0.44);
                -moz-box-shadow: 1px 1px 2px rgba(0,0,0,0.44);
                box-shadow: 1px 1px 2px rgba(0,0,0,0.44);
                -webkit-transition: all 0.4s linear;
                -moz-transition: all 0.4s linear;
                -ms-transition: all 0.4s linear;
                -o-transition: all 0.4s linear;
                transition: all 0.4s linear;
            }

            #comments .cmmnt .avatar a:hover img { opacity: 0.77; }


            #comments .cmmnt .cmmnt-content { padding: 0px 3px; padding-bottom: 12px; padding-top: 8px; }
            #comments .cmmnt .cmmnt-content header { font-size: 1.3em; display: block; margin-bottom: 8px; }
            #comments .cmmnt .cmmnt-content header .pubdate { color: #777; }
            #comments .cmmnt .cmmnt-content header .userlink { font-weight: bold; } 
            #comments .cmmnt .replies { margin-bottom: 7px; }

            .post-author-bio {
                margin: 20px auto 10px;
                padding: 40px 30px;
                background: #BEE2F8;
                color: #fff;
            }

            .post-author-bio .avatar {
                vertical-align: middle;
                -webkit-border-radius: 50%;
                -moz-border-radius: 50%;
                border-radius: 50%;
                float: left;
            }

            .post-author-bio-content {
                margin-left: 135px;
            }

            .post-author-name {
                margin-top: 0;
                /* margin-left: 133px; */
                font-size: 24px;
                padding-top: 0;
                padding-bottom: 15px;
                text-transform: uppercase;
            }

            .author-bio-text {
                font-size: 16px;
                line-height: 24px;
                float: left;
                /* padding-left: 134px; */
                width: 100%;
                box-sizing: border-box;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
            }

        </style>

        <style>
            body {font-family: Arial, Helvetica, sans-serif;}

            input[type=text], select, textarea {
                width: 100%;
                padding: 12px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
                margin-top: 6px;
                margin-bottom: 16px;
                resize: vertical;
            }

            input[type=submit] {
                background-color: #4CAF50;
                color: white;
                padding: 12px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            input[type=submit]:hover {
                background-color: #45a049;
            }

            .container {
                border-radius: 5px;
                background-color: #BEE2F8;
                padding: 20px;
            }
        </style>

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
                            <a class="nav-link" rel="tooltip" title="" data-placement="bottom" href="https://twitter.com/SportsTimeUSA" target="_blank" data-original-title="Síguenos en Twitter">
                                <i class="fa fa-twitter"></i>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" rel="tooltip" title="" data-placement="bottom" href="https://www.facebook.com/Sports-Time-448388048915031/" target="_blank" data-original-title="Síguenos en Facebook">
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

                                        <center>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <div class="form-check form-check-radio form-check-inline">
                                                <h6>Ayuda:</h6>
                                                <a tabindex="0" class="button" role="button" data-toggle="popover" data-trigger="focus" title="LAS NOTIFICACIONES..." data-content="Te permiten publicar un mensaje y que los demás lo vean. Este posee una duración en DÍAS."><img title="ayuda" src="https://image.flaticon.com/icons/svg/148/148769.svg" alt="Sports Time" width=17 height=17 hspace="10"></a>
                                            </div>
                                        </center>
                                    </div>
                                </div>


                                <div class="container" style="padding-top: 20px; margin: 20px; width: 800px; align-self:center;">

                                        <label for="name">Título</label>
                                        <input type="text" id="lname" name="name" placeholder="Título...">

                                        <label for="lname">Duración (en días)</label>
                                        <input id="duracion" type="text" name="duracion" placeholder="Duración en días...">

                                        <label for="subject">Mensaje</label>
                                        <textarea id="mensaje" name="message" placeholder="Descripción..." style="height:300px"></textarea>

                                        <input id="publicar" type="submit" value="Publicar">

                                </div>       







                                <div class="post-author-bio clearfix" style="margin-left: 20
                                     px;margin-right: 20px">
                                    <img alt="" src="https://secure.gravatar.com/avatar/a856f0348a2e1c8fa9c2b8b4f1e618d7?s=114&amp;d=mm&amp;r=g" srcset="https://secure.gravatar.com/avatar/a856f0348a2e1c8fa9c2b8b4f1e618d7?s=228&amp;d=mm&amp;r=g 2x" class="avatar avatar-114 photo" height="114" width="114"> 
                                    <div class="post-author-bio-content">
                                        <h2 class="post-author-name">
                                            <a href="/author/Jake-Rocheleau">By Jake Rocheleau</a>
                                        </h2>
                                        <div class="author-bio-text">Jake is a writer and user experience designer on the web. He publishes articles discussing HTML5/CSS3 and jQuery coding techniques. Find out more on <a href="http://byjakewithlove.com/">his website</a> or you can follow his updates on Twitter <a href="http://twitter.com/jakerocheleau">@jakerocheleau</a>    <a data-title="Articles by Jake Rocheleau" href="/author/Jake-Rocheleau">More articles </a> by Jake Rocheleau  </div>
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
