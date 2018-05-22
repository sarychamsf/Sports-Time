<%@page import="Dao.Crud_Athele"%>
<%@page import="Dao.Crud_Coach"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://code.jquery.com/jquery-1.9.1.js"></script>
        <script src="Script/script1.js" type="text/javascript"></script>
        <script src="Scriagregadopt/script1.js" type="text/javascript"></script>
        <title>Perfil</title>

        <script src="https://code.jquery.com/jquery-1.9.1.js"></script>
        <script src="Script/script1.js" type="text/javascript"></script>
        <script src="Script/script1.js" type="text/javascript"></script>

        <!--     Fonts and icons     -->
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
        <link rel="stylesheet" href="./assets/css/material-kit.css?v=2.0.2">
        <link rel="stylesheet" href="./assets/css/personalizar.css">

        <script>
            $(document).ready(function () {
                $('#volverty').click(function (event) {

                    $.ajax({
                        url: "Temporary_Profile_Servlet",
                        data: {temp: "volver"},
                        type: "POST",
                        success: function (respuesta) {
                            if (respuesta.trim() == "volver") {
                                window.location.replace("Solicitudes.jsp");
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
            <input style="margin-bottom: 20px;" id="sesionclose" type="submit" value="Cerrar Sesion" class="btn btn-info btn-round">
        </center>
    </div>

    <div class="page-header ">
        <div class="profile-content">
            <div class="container">
                <div class="row">
                    <div class="col-md-10 ml-auto mr-auto">
                        <div class="card card-signup">

                            <%
                                HttpSession misession1 = request.getSession(true);
                                String h = String.valueOf(misession1.getAttribute("Temporary_Profile"));

                                Crud_Coach crr = new Crud_Coach();
                                Crud_Athele crr2 = new Crud_Athele();

                                for (int i = 0; i < crr.findAll().size(); i++) {

                                if (h.equals(crr.findAll().get(i).getName() + " " + crr.findAll().get(i).getLastname())) {
                                    out.println("<h2 class=\"card-title text-center\"> " + crr.findAll().get(i).getName() + " " + crr.findAll().get(i).getLastname() + "</h2> <br>");

                            %> 

                            <center>
                                <div class="profile">
                                    <div class="avatar">
                                        <% String fotoName = crr.findAll().get(i).getFotoName();%>
                                        <img src="fotosdb/<%=fotoName%>" alt="Circle Image" class="img-raised rounded-circle img-fluid" width=200 height=200>
                                    </div>
                                </div>
                            </center>
                            <br><br>

                            <center>
                                <div class="form-group">
                                    <div class="form-check form-check-radio form-check-inline">
                                        <%
                                            out.println("<p><b>Género: </b>" + crr.findAll().get(i).getGenre() + "</p>");
                                        %>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="form-check form-check-radio form-check-inline">
                                        <%
                                            out.println("<p><b>Fecha de nacimiento: </b>" + crr.findAll().get(i).getBorn_Date() + "</p>");
                                        %>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="form-check form-check-radio form-check-inline">
                                        <%
                                            out.println("<p><b>Categoría: </b>" + crr.findAll().get(i).getCategory() + "</p>");
                                        %>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="form-check form-check-radio form-check-inline">
                                        <%
                                            out.println("<p><b>Teléfono: </b>" + crr.findAll().get(i).getCellphone() + "</p>");
                                        %>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="form-check form-check-radio form-check-inline">
                                        <%
                                            out.println("<p><b>Descripción: </b>" + crr.findAll().get(i).getDescription() + "</p>");
                                        %>
                                    </div>
                                </div>    
                            </center>


                            <%
                                    }
                                }

                                for (int i = 0; i < crr2.findAll().size(); i++) {
                                    if (h.equals(crr2.findAll().get(i).getName() + " " + crr2.findAll().get(i).getLastname())) {
                                        out.println("<h2 class=\"card-title text-center\"> " + crr2.findAll().get(i).getName() + " " + crr2.findAll().get(i).getLastname() + "</h2> <br>");
                            %> 


                            <center>
                                <div class="profile">
                                    <div class="avatar">
                                        <% String fotoName = crr2.findAll().get(i).getFotoName();%>
                                        <img src="fotosdb/<%=fotoName%>" alt="Circle Image" class="img-raised rounded-circle img-fluid" width=200 height=200>
                                    </div>
                                </div>
                            </center>
                            <br><br>

                            <center>
                                <div class="form-group">
                                    <div class="form-check form-check-radio form-check-inline">
                                        <%
                                            out.println("<p><b>Género: </b>" + crr2.findAll().get(i).getGenre() + "</p>");
                                        %>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="form-check form-check-radio form-check-inline">
                                        <%
                                            out.println("<p><b>Fecha de nacimiento: </b>" + crr2.findAll().get(i).getBorn_Date() + "</p>");
                                        %>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="form-check form-check-radio form-check-inline">
                                        <%
                                            out.println("<p><b>Categoría: </b>" + crr2.findAll().get(i).getCategory() + "</p>");
                                        %>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="form-check form-check-radio form-check-inline">
                                        <%
                                            out.println("<p><b>Teléfono: </b>" + crr2.findAll().get(i).getCellphone() + "</p>");
                                        %>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="form-check form-check-radio form-check-inline">
                                        <%
                                            out.println("<p><b>Descripción: </b>" + crr2.findAll().get(i).getDescription() + "</p>");
                                        %>
                                    </div>
                                </div>    
                            </center>


                            <%
}

}

                            %>


                            <div class="form-group">
                                <div class="card-footer justify-content-center">
                                    <input id="volverty" type="submit" value="volver" class="btn btn-info btn-round">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <footer class="footer">
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



    <!--                                                       Core JS Files   -->
    <script class="cssdeck" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.8.0/jquer                                                    y.min.js"></script>
    <script src="./assets/js/core/jquer                                                    y.min.js"></script>
    <script src="./assets/js/core/poppe                                                    r.min.js"></script>
    <script src="./assets/js/bootstrap-material-d                                                    esign.js"></script>
    <!--  Plugin for Date Time Picker and Full C                                                    alendar Plugin  -->
    <script src="./assets/js/plugins/momen                                                    t.min.js"></script>
    <!--	Plugin for the Datepicker, full documentation here: https://github.com/Eonasdan/bootstrap                                                    -datetimepicker -->
    <script src="./assets/js/plugins/bootstrap-datetimepicke                                                    r.min.js"></script>
    <!--	Plugin for the Sliders, full documentation here: http://refreshless.                                                    com/nouislider/ -->
    <script src="./assets/js/plugins/nouislide                                                    r.min.js"></script>
    <!-- Material Kit Core initialisations of plugins and Bootstrap Material                                                    Design Library -->
    <script src="./assets/js/material-kit.js                                                    ?v=2.0.2"></script>
    <!-- Fixed Sidebar Nav - js With initialisations For Demo Purpose, Don't Include it                                                     in your project -->
    <script src="./assets/assets-for-demo/js/material-kit                                                    -demo.js"></script>
    <script>
                    $(document).ready(function () {

//init DateTimePickers
                        materia                                    lKit.initFormExtendedDatetimepickers();
// Sliders Init
                        materialKit.initSliders();
                    });

    </script>

</body>

</html> 
