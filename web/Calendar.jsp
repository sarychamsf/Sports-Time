<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sports Time - Calendario</title>

        <script src="https://code.jquery.com/jquery-1.9.1.js"></script>
        <script src="Script/script1.js" type="text/javascript"></script>
        <script src="Script/script1.js" type="text/javascript"></script>

        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
        <link rel="stylesheet" href="./assets/css/material-kit.css?v=2.0.2">

        <!-- jQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>

        <!-- custom scripts --> 
        <script type="text/javascript" src="js/script.js"></script> 

        <!-- bootstrap -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" crossorigin="anonymous"></script>
        <link  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" >

        <!-- fullcalendar -->
        <link href="css/fullcalendar.css" rel="stylesheet" />
        <link href="css/fullcalendar.print.css" rel="stylesheet" media="print" />
        <script src="js/moment.min.js"></script>
        <script src="js/fullcalendar.js"></script>

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

    <body>  

    <center>
        <div style="align-self: center">
            <div class="brand">
                <a class="navbar-brand" href="./Login.jsp"> <img src="assets/img/LogoNoLetra.png" alt="Sports Time" width=145 height=145> </a>
                <a class="navbar-brand" href="./Login.jsp"> <img src="assets/img/Nombre.png" alt="Sports Time" width=400 height=103> </a>
            </div>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">

                </li>
            </ul>
        </div>
    </center>


    <!-- add calander in this div -->

    <div style="margin-top: 100px">

        <div class="container">
            <div class="row">
                <div id="calendar"></div>

            </div>
        </div>

        <br>
        <br>

        <div class="control-group">
            <div class="field desc">
                <div class="card-footer justify-content-center">
                    <center>
                        <input class="btn btn-info btn-round" id="volver" type="submit" value="Volver">    
                    </center>
                </div>
            </div>
        </div>


        <!-- Modal  to Add Event -->
        <div id="createEventModal" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">Ã—</button>
                        <h4 class="modal-title">Add Event</h4>
                    </div>
                    <div class="modal-body">
                        <div class="control-group">
                            <label class="control-label" for="inputPatient">Event:</label>
                            <div class="field desc">
                                <input class="form-control" id="title" name="title" placeholder="Event" type="text" value="">
                            </div>
                        </div>

                        <input type="hidden" id="startTime"/>
                        <input type="hidden" id="endTime"/>



                        <div class="control-group">
                            <label class="control-label" for="when">When:</label>
                            <div class="controls controls-row" id="when" style="margin-top:5px;">
                            </div>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
                        <button type="submit" class="btn btn-primary" id="submitButton">Save</button>
                    </div>
                </div>

            </div>
        </div>

        <!-- Modal to Event Details -->
        <div id="calendarModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">Ã—</button>
                        <h4 class="modal-title">Event Details</h4>
                    </div>
                    <div id="modalBody" class="modal-body">
                        <h4 id="modalTitle" class="modal-title"></h4>
                        <div id="modalWhen" style="margin-top:5px;"></div>
                    </div>
                    <input type="hidden" id="eventID"/>
                    <div class="modal-footer">
                        <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
                        <button type="submit" class="btn btn-danger" id="deleteButton">Delete</button>
                    </div>
                </div>
            </div>
        </div>
        <!--Modal-->
    </div>

</body>
</html>
