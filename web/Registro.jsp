<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@page import="Dao.Crud_Coach"%>

<!DOCTYPE html>
<html lang="en">

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
            Sports Time - Registro
        </title>
        <!--     Fonts and icons     -->
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
        <link rel="stylesheet" href="./assets/css/material-kit.css?v=2.0.2">
        <link rel="stylesheet" href="./assets/css/personalizar.css">

        <%

            HttpSession misession = request.getSession(true);

            if (misession.getAttribute("usuario") != null) {

                if (misession.getAttribute("usuario") == "Entrenador") {

                    response.sendRedirect("Coach.jsp");

                } else if (misession.getAttribute("usuario") == "Deportista") {
                    response.sendRedirect("Athlete.jsp");

                }

            }

        %>



        <script>

            function Numeros(string) {//Solo numeros
                var out = '';
                var filtro = '1234567890';//Caracteres validos

                //Recorrer el texto y verificar si el caracter se encuentra en la lista de validos 
                for (var i = 0; i < string.length; i++)
                    if (filtro.indexOf(string.charAt(i)) != -1)
                        //Se añaden a la salida los caracteres validos
                        out += string.charAt(i);

                //Retornar valor filtrado
                return out;
            }

            function Text(string) {//solo letras
                var out = '';
                //Se añaden las letras validas
                var filtro = 'abcdefghijklmnñopqrstuvwxyzABCDEFGHIJKLMNÑOPQRSTUVWXYZáéíóú';//Caracteres validos

                for (var i = 0; i < string.length; i++)
                    if (filtro.indexOf(string.charAt(i)) != -1)
                        out += string.charAt(i);
                return out;
            }

            function DateString(string) {//Formato fecha dd/mm/yyyy
                var out = '';
                var filtro = '1234567890/';//Caracteres validos

                //Recorrer el texto y verificar si el caracter se encuentra en la lista de validos 
                for (var i = 0; i < string.length; i++) {
                    if ((filtro.indexOf(string.charAt(i)) != -1) && ((i != 2)) && ((i != 5)))
                        //Se añaden a la salida los caracteres validos
                        out += string.charAt(i);
                    if ((i == 2) || (i == 5))
                        out += '/';
                }
                //Retornar valor filtrado
                return out;
            }

            function Telf(string) {//Telefonos
                var out = '';
                var filtro = '1234567890+';//Caracteres validos

                //Recorrer el texto y verificar si el caracter se encuentra en la lista de validos 
                for (var i = 0; i < string.length; i++) {
                    if ((filtro.indexOf(string.charAt(i)) != -1))
                        //Se añaden a la salida los caracteres validos
                        out += string.charAt(i);
                }
                //Retornar valor filtrado
                return out;
            }

        </script>


    </head>

    <body class="signup-page ">
        <nav class="navbar  navbar-transparent    navbar-absolute  navbar-expand-lg " color-on-scroll="100" id="sectionsNav">

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
                            <a class="nav-link" rel="tooltip" title="" data-placement="bottom" href="./Login.jsp" data-original-title="Inicia Sesión">
                                <i class="material-icons">face</i>
                            </a>
                        </li>
                        <a href="./Login.jsp" class="btn btn-info btn-round">Inicia Sesión</a>
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
            <div class="container">
                <div class="row">
                    <div class="col-md-10 ml-auto mr-auto">
                        <div class="card card-signup">
                            <h2 class="card-title text-center">Regístrate</h2>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-5 ml-auto">
                                        <div class="info info-horizontal">
                                            <div class="info info-horizontal">
                                                <div class="description">
                                                    <h4 class="info-title"> <img src="https://image.flaticon.com/icons/svg/149/149066.svg" alt="Rutina" width=36 height=36 hspace="5"> Red social para deportistas con diferentes roles.</h4>
                                                    <p class="description">
                                                        Inicia sesión como entrenador o como deportista, inscríbete a entrenamientos, permanece en contacto con tus compañeros y mucho más.
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="info info-horizontal">                            
                                            <div class="info info-horizontal">
                                                <div class="description">
                                                    <h4 class="info-title"> <img src="https://image.flaticon.com/icons/svg/265/265733.svg" alt="Rutina" width=36 height=36 hspace="5">Gráficas de Rendimiento.</h4>
                                                    <p class="description">
                                                        Observa tu progreso como deportista.
                                                    </p>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="info info-horizontal">
                                            <div class="description">
                                                <h4 class="info-title"> <img src="https://image.flaticon.com/icons/svg/251/251974.svg" alt="Sports Time" width=36 height=36 hspace="5"> Registro de tiempos.</h4>
                                                <p class="description">
                                                    Registra los tiempos como entrenador de tus deportistas.
                                                </p>
                                            </div>
                                        </div>
                                        <div class="info info-horizontal">
                                            <div class="description">
                                                <h4 class="info-title"> <img src="http://lou-yservices.fr/images/icon-assistante-de-gestion-grand-est-nancy-lou-yservices.png" alt="Rutina" width=36 height=36 hspace="5"> Gestión de Rutinas.</h4>
                                                <p class="description">
                                                    Crea rutinas de entrenamiento y participa en ellas.
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-5 mr-auto">


                                        <form method="post" action="Register_Servlet" enctype="multipart/form-data" >


                                            <div class="form-group">
                                                <div class="input-group">
                                                    <img src="https://image.flaticon.com/icons/svg/138/138672.svg" alt="Sports Time" width=30 height=30 hspace="13">
                                                    <input name="Name" id="Name2" type="text" class="form-control" placeholder="Nombre" onkeyup="this.value = Text(this.value)">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <img src="https://image.flaticon.com/icons/svg/138/138672.svg" alt="Sports Time" width=30 height=30 hspace="13">
                                                    <input name="Lastname" id="Lastname2" type="text" class="form-control" placeholder="Apellido" onkeyup="this.value = Text(this.value)">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="input-group">
                                                    <img src="https://image.flaticon.com/icons/svg/148/148860.svg" alt="Sports Time" width=30 height=30 hspace="13">
                                                    <input name="Identification_Card" id="Identification_Card2" type="text" class="form-control" placeholder="Cédula" onkeyup="this.value = Numeros(this.value)">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="input-group">
                                                    <img src="https://image.flaticon.com/icons/svg/226/226892.svg" alt="Sports Time" width=30 height=30 hspace="13">
                                                    <input name="Genre" id="Genre2" type="text" class="form-control" placeholder="Género" onkeyup="this.value = Text(this.value)">
                                                </div>
                                            </div>   

                                            <div class="form-group">
                                                <div class="input-group">
                                                    <img src="https://image.flaticon.com/icons/svg/123/123392.svg" alt="Sports Time" width=30 height=30 hspace="13">
                                                    <input name="Born_Date" id="Born_Date2" type="text" class="form-control" placeholder="Fecha de nacimiento (dd/mm/aaaa)" maxlength="10" onkeyup="this.value = DateString(this.value)">
                                                </div>
                                            </div>    

                                            <div class="form-group">
                                                <div class="input-group">
                                                    <img src="https://image.flaticon.com/icons/svg/249/249196.svg" alt="Sports Time" width=30 height=30 hspace="13">
                                                    <input name="Height" id="Height2" type="text" class="form-control" placeholder="Altura" onkeyup="this.value = Numeros(this.value)">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="input-group">
                                                    <img src="https://image.flaticon.com/icons/svg/755/755356.svg" alt="Sports Time" width=30 height=30 hspace="13">
                                                    <input name="Weight" id="weight2" type="text" class="form-control" placeholder="Peso" onkeyup="this.value = Numeros(this.value)">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="input-group">
                                                    <img src="https://image.flaticon.com/icons/svg/151/151917.svg" alt="Sports Time" width=30 height=30 hspace="13">
                                                    <input name="Category" id="Category2" type="text" class="form-control" placeholder="Categoría" onkeyup="this.value = Text(this.value)">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="input-group">
                                                    <img src="https://image.flaticon.com/icons/svg/134/134951.svg" alt="Sports Time" width=30 height=30 hspace="13">
                                                    <input name="Cellphone" id="Cellphone2" type="text" class="form-control" placeholder="Teléfono" onkeyup="this.value = Telf(this.value)">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="input-group">
                                                    <img src="https://image.flaticon.com/icons/svg/770/770674.svg" alt="Sports Time" width=30 height=30 hspace="13">
                                                    <input name="Eps" id="Eps2" type="text" class="form-control" placeholder="EPS" onkeyup="this.value = TextNum(this.value)">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="input-group">
                                                    <img src="https://image.flaticon.com/icons/svg/578/578691.svg" alt="Sports Time" width=30 height=30 hspace="13">
                                                    <input name="Emergency_Number" id="Emergency_Number2" type="text" class="form-control" placeholder="Número de emergencia" onkeyup="this.value = Telf(this.value)">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="input-group">
                                                    <img src="https://image.flaticon.com/icons/svg/187/187165.svg" alt="Sports Time" width=30 height=30 hspace="13">
                                                    <input name="Allergies" id="Allergies2" type="text" class="form-control" placeholder="Alergias" onkeyup="this.value = Text(this.value)">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="input-group">
                                                    <img src="https://image.flaticon.com/icons/svg/576/576845.svg" alt="Sports Time" width=30 height=30 hspace="13">
                                                    <input name="Diseases" id="Diseases2" type="text" class="form-control" placeholder="Enfermedades" onkeyup="this.value = Text(this.value)">
                                                </div>
                                            </div>


                                            <div class="form-group">
                                                <div class="input-group">
                                                    <img src="https://image.flaticon.com/icons/svg/204/204310.svg" alt="Sports Time" width=30 height=30 hspace="13">
                                                    <input name="Password" id="Password21" type="password" placeholder="Contraseña" class="form-control" />
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <br><p>Selecciona tu entrenador:</p>
                                                <div class="input-group">
                                                    <img src="https://image.flaticon.com/icons/svg/167/167738.svg" alt="Sports Time" width=30 height=30 hspace="13">
                                                    <select name="Coach" class="form-control" id="Coach1">
                                                        <% Crud_Coach crr2 = new Crud_Coach();
                                                           for (int i = 0; i < crr2.findAll().size(); i++) {
                                                        %>
                                                        <option value="<%=crr2.findAll().get(i).getName() + " " + crr2.findAll().get(i).getLastname()%>"  ><%=crr2.findAll().get(i).getName() + " " + crr2.findAll().get(i).getLastname()%></option>
                                                        <%
                                                           }
                                                        %>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <br><p>Selecciona tu jornada:</p>
                                                <div class="input-group">
                                                    <img src="https://image.flaticon.com/icons/svg/557/557033.svg" alt="Sports Time" width=30 height=30 hspace="13">
                                                    <select name="Jornada" class="form-control" id="jornada">
                                                        <%
                                                            String[] temp2 = new String[2];
                                                            temp2[0] = "Mañana";
                                                            temp2[1] = "Tarde";
                                                            for (int i = 0; i < temp2.length; i++) {
                                                        %>
                                                        <option value="<%=temp2[i]%>"  ><%=temp2[i]%>  </option>
                                                        <%
                                                            }
                                                        %>
                                                    </select>
                                                </div>
                                            </div>        

                                            <div class="form-group">
                                                <br><p>Selecciona tu rol:</p>
                                                <div class="form-check form-check-radio form-check-inline">

                                                    <label class="form-check-label">  
                                                        <img src="https://ebasketballcoach.com/op/wp-content/uploads/2016/10/basketballcoach500trans.png" alt="Sports Time" width=30 height=30 hspace="13">
                                                        <input class="form-check-input" type="radio" name="Role" onClick="value = 1" value="Role_Entrenador"> Entrenador
                                                        <span class="circle">
                                                            <span class="check"></span>
                                                        </span>
                                                    </label>

                                                    <label class="form-check-label">  
                                                        <img src="https://image.flaticon.com/icons/svg/432/432275.svg" alt="Sports Time" width=30 height=30 hspace="13">
                                                        <input class="form-check-input" type="radio" name="Role" onClick="value = 2" value="Role_Deportista"> Deportista
                                                        <span class="circle">
                                                            <span class="check"></span>
                                                        </span>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <p>Descripción:</p>
                                                <div class="input-group">
                                                    <img src="https://image.flaticon.com/icons/svg/265/265703.svg" alt="Sports Time" width=30 height=30 hspace="13">
                                                    <textarea name="Description" class="form-control" id="Description2" rows="4"></textarea>
                                                </div>
                                            </div>

                                            <br><br>
                                            <div class="form-group">
                                                <p>Selecciona una imagen de perfil:</p>
                                                <div class="form-group form-file-upload form-file-simple">
                                                    <input name="fototxt" id="fototxt" type="text" class="form-control inputFileVisible" placeholder="Simple chooser...">
                                                    <input name="fotofile" id="fotofile" type="file" class="inputFileHidden" accept=".jpg, .jpeg, .png">
                                                </div>
                                            </div>   

                                            <br><br>
                                            <div class="card-footer justify-content-center">
                                                <input id="register1" type="submit" value="Registrarte" class="btn btn-info btn-round">
                                            </div>

                                        </form>

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
                        }
                        );
        </script>

    </body>

</html>