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
        <link rel="stylesheet" href="./assets/css/personalizar.css">

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

            .scrollup{
                width:40px;
                height:40px;
                opacity:0.7;
                z-index:1000;
                position:fixed;
                bottom:70px;
                right:50px;
                display:none;
                text-indent:-9999px;
                background: url('./assets/img/up-arrow.png') no-repeat;
            }

        </style>

        <script type="text/javascript">
            $(document).ready(function () {

                $(window).scroll(function () {
                    if ($(this).scrollTop() > 100) {
                        $('.scrollup').fadeIn();
                    } else {
                        $('.scrollup').fadeOut();
                    }
                });

                $('.scrollup').click(function () {
                    $("html, body").animate({scrollTop: 0}, 600);
                    return false;
                });

            });
        </script>


        <style>

            html, body, div, span, applet, object, iframe, h1, h4, h5, h6, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video {
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
                background: #CEEDFF;
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
                color: #5ca7d5;
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

            .containerC {
                border-radius: 5px;
                background-color: #CEEDFF; <%--BEE2F8--%>
                padding: 20px;
            }


            .line{
                align-self: center;
                width: 87%;
                border-bottom: 1px solid #17AEED;
                margin-top: 30px;
                margin-bottom: 50px;
            }



        </style>

        <style>

            .tip {
                width: 0px;
                height: 0px;
                position: absolute;
                background: transparent;
                border: 10px solid #ccc;
            }

            .tip-up {
                top: -25px; /* Same as body margin top + border */
                left: 10px;
                border-right-color: transparent;
                border-left-color: transparent;
                border-top-color: transparent;
                border-bottom-color: #00BCD4;
            }

            .dialogbox .body {
                position: relative;
                width: 80%;
                margin: 10px;
                padding: 5px;
                background-color: #CEEDFF;
                border-radius: 3px;
                border: 5px solid #00BCD4;
            }

            .body .message {
                border-radius: 3px;
                font-family: Arial;
                font-size: 14px;
                line-height: 1.5;
                color: #797979;
            }

        </style>


    </head>

    <body class="signup-page" style="background-color: #CEEDFF;">

        <a href="#" class="scrollup">Scroll</a>

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
        <center>
            <a style="display:inline-block;margin-right:5px;" class="nav-link" rel="tooltip" title="" data-placement="bottom" href="./Coach.jsp" data-original-title="Perfil">
                <i class="material-icons">face</i>
            </a>
            <input style="display:inline-block;margin-right:5px;" id="sesionclose" type="submit" value="Cerrar Sesion" class="btn btn-info btn-round">
            <input style="display:inline-block;margin-right:5px;" id="volver" type="submit" value="volver" class="btn btn-info btn-round">
        </center>
    </div>

    <div class="page-header">
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

                                    <center>
                                        <div class="form-check form-check-radio form-check-inline">
                                            <h6>Ayuda:</h6>
                                            <a tabindex="0" class="button" role="button" data-toggle="popover" data-trigger="focus" title="LAS NOTIFICACIONES..." data-content="Te permiten publicar un mensaje y que los demÃ¡s lo vean. Este posee una duraciÃ³n en DÃAS."><img title="ayuda" src="https://image.flaticon.com/icons/svg/148/148769.svg" alt="Sports Time" width=17 height=17 hspace="10"></a>
                                        </div>
                                    </center>
                                </div>
                            </div>

                            <p>
                            <center>
                                <button class="btn btn-info" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                                    Publicar notificación en el Muro.
                                </button>
                            </center>
                            </p>

                            <div style="margin-bottom: 30px;" class="collapse" id="collapseExample">
                                <div class="card card-body">

                                    <br><h3 style="margin-left: 6%;" class="card-title">Publica una notificación:</h3>

                                    <div class="containerC" style="padding-top: 20px; margin: 20px; width: 90%; align-self:center;">

                                        <label for="name">Título</label>
                                        <input type="text" id="name" name="name" placeholder="Título...">

                                        <label for="duracion">Duración (en días)</label>
                                        <input id="duracion" type="text" name="duracion" placeholder="Duración en días...">

                                        <label for="mensaje">Mensaje</label>
                                        <textarea id="mensaje" name="message" placeholder="Descripción..." style="height:300px"></textarea>

                                        <input id="publicar" type="submit" value="Publicar">

                                    </div>    

                                    <br>
                                    <div class="card-footer justify-content-center">
                                        <input id="publicar" type="submit" value="Publicar" class="btn btn-info btn-round">
                                    </div> 

                                </div>
                            </div>

                            <br><br><br>

                            <h3 style="margin-left: 6%;" class="card-title">Publicaciones:</h3>

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

                            <div class="post-author-bio clearfix" style="margin: 5%;">
                                <img src="fotosdb/<%=fotoName%>" class="avatar avatar-114 photo" height="114" width="114"> 
                                <div class="post-author-bio-content">
                                    <h2 class="post-author-name">
                                        <a style="color:#00BCD4"><% out.println(co.findAll().get(i).getId()+" dijo:");%></a>
                                    </h2>
                                    <h3>                     
                                        <a style="color:#00BCD4"><% out.println(co.findAll().get(i).getName()); %></a>
                                    </h3>
                                    <div class="author-bio-text">
                                        <% out.println(co.findAll().get(i).getText()); %>
                                    </div>
                                </div>
                            </div>

                            <%
                                String itera = String.valueOf(i);
                                for (int i2 = 0; i2 < couser.findAll().size(); i2++) {
                                    if (i2 == 0) {
                            %>

                            <%}
                                if (couser.findAll().get(i2).getIdcomments().equals(itera)) {
                            %> 


                            <div class="container" style="margin-left: 15%;">
                                <div class="dialogbox">
                                    <div class="body">
                                        <span class="tip tip-up"></span>
                                        <div class="message">
                                            <span>
                                                <h4 style="margin-bottom: 1%">                     
                                                    <a style="color:#00BCD4"><% out.println(couser.findAll().get(i2).getId().toUpperCase()); %></a>
                                                </h4>
                                                <span>
                                                    <div style="margin-left: 1%">
                                                        <% out.println(couser.findAll().get(i2).getText()); %>
                                                    </div>
                                                </span>                            
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <%    }
                                }
                                String temp1 = "idcomment" + itera;
                                String temp2 = "mensajecomment" + itera;
                                String temp3 = "duracioncomment" + itera;
                                String temp4 = "comentar" + itera;
                                out.println("</center>");
                            %>

                            <br><br><br>
                            <p>
                                <button style="margin-left: 18%;" class="btn btn-info" type="button" data-toggle="collapse" data-target="#comentar" aria-expanded="false" aria-controls="collapseExample">
                                    Comentar
                                </button>
                            </p>

                            <div style="margin-bottom: 30px;" class="collapse" id="comentar">

                                <div class="card card-body" style="margin-left: 18%;width: 76%;background-color: #CEEDFF;">

                                    <br><h3 style="margin-left: 6%;" class="card-title">Comenta esta publicación:</h3>

                                    <div class="containerC" style="padding-top: 20px; margin: 20px; width: 90%; align-self:center;background-color: #00BCD4;">

                                        <label for="name" style="color: white;">Por:</label>
                                        <input type="text" id="<%=temp1%>" value="<%=name%>" readonly>

                                        <label for="duracion" style="color: white;">Duración (en días):</label>
                                        <input id="<%=temp3%>" type="text" name="duracion" placeholder="Duración en días...">

                                        <label for="mensaje" style="color: white;">Comentario:</label>
                                        <textarea id="<%=temp2%>" name="message" placeholder="Descripción..." style="height:300px"></textarea>        

                                    </div>  

                                    <br>
                                    <div class="card-footer justify-content-center">
                                        <input style="background-color: #00BCD4;" id="<%=temp4%>" type="submit" value="Comentar" onclick="redirigir('<%=itera%>')">
                                    </div> 
                                </div>

                            </div>

                            <%
                                }
                            %>

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
                </script>, Hecho por Sara Chamseddine, Juan Camilo Botonero, Sebastián Rojas, Diego León, Mario Bolaños.
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