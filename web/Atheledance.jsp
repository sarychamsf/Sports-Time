<%@page import="Dao.Crud_Coach"%>
<%@page import="Dao.Crud_Athele"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>

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

        <%
                                Crud_Athele crr2 = new Crud_Athele();
                                Crud_Coach crr = new Crud_Coach();
                                HttpSession misession1 = request.getSession(true);
                                String h = String.valueOf(misession1.getAttribute("Role"));
                                HttpSession misession2 = request.getSession(true);
                                String h1 = String.valueOf(misession2.getAttribute("v"));
                                int identifiquer = Integer.parseInt(h1);
                                   
                                ArrayList<String> nombreArrayList = new ArrayList<String>();
                                
                                for (int i = 0; i < crr2.findAll().size(); i++) {
                                    if (crr2.findAll().get(i).getCoach().equals(crr.findAll().get(identifiquer).getName() + " " + crr.findAll().get(identifiquer).getLastname()) && crr2.findAll().get(i).getJornada().equals(h)) {
                                            
                                            
                                        nombreArrayList.add(crr2.findAll().get(i).getName() + " " + crr2.findAll().get(i).getLastname());
                                            
                                            
                                          
                                    }
                                }
                                String fotoName = crr.findAll().get(identifiquer).getFotoName();
        %>



        <script>

            $(document).ready(function () {
                $('#listar1').click(function (event) {



                    var nombres = [];
                    var estado = [];
                    var paso;
                    
                    for (paso = 0; paso < <%=nombreArrayList.size()%>; paso++) {
                        nombres.push(document.getElementById("Name_Athele"+paso).innerHTML);
                        var temp='Athele'+paso;
                        estado.push($('#'+temp).val());
                    }
                    
                    var nombresfi=nombres.toString();
                    var estadofin=estado.toString();

                    var Coach_Name = document.getElementById("Coach_Name").innerHTML;
                    var Jornada = document.getElementById("Jornada").innerHTML;
                    var lenght=<%=nombreArrayList.size()%>;

                    $.ajax({
                        url: "Attendance_Servlet",
                        data: {nombresfi:nombresfi,estadofin:estadofin,lenght:lenght,Coach_Name: Coach_Name, Jornada: Jornada},
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



                                        <%
                                        
                                          for (int i = 0; i < nombreArrayList.size(); i++) {
                                          
 
                                          String idtemp="Athele"+i;
                                          String idlabeltemo="Name_Athele"+i;
                                          String nametemporalito=nombreArrayList.get(i);
                                          int ju=i;
                                          ju++;
       
                                        
                                        
                                        %>

                                        <label class="plabel"><b><%=ju%> </b></label>
                                        <input type="checkbox" id="<%=idtemp%>" value="Role_Entrenador" onClick="value = 1"/>
                                        <label id="<%=idlabeltemo%>" class="plabel"><%=nametemporalito%></label>
                                        <br>



                                        <%
                                        
                                        
                                        }
                
                                        %>



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
