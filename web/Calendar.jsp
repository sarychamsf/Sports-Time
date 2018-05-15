<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<head>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">
    <title>Sports Time - Calendario</title>

    <script src="https://code.jquery.com/jquery-1.9.1.js"></script>

    <script src="codebase/dhtmlxscheduler.js" type="text/javascript" charset="utf-8"></script>
    <link rel="stylesheet" href="./codebase/dhtmlxscheduler.css">

    <style>

        .dhx_month_body {
            border-right: 1px solid #CECECE;
            border-bottom: 1px solid #CECECE;
        }

    </style>

    <style type="text/css" >

        html, body{
            margin:0;
            padding:0;
            height:100%;
            overflow:hidden;
        }

        .dhx_cal_event div.dhx_footer,
        .dhx_cal_event.past_event div.dhx_footer,
        .dhx_cal_event.event_english div.dhx_footer,
        .dhx_cal_event.event_amarillo div.dhx_footer,
        .dhx_cal_event.event_verde div.dhx_footer{
            background-color: transparent !important;
        }
        .dhx_cal_event .dhx_body{
            -webkit-transition: opacity 0.1s;
            transition: opacity 0.1s;
            opacity: 0.7;
        }
        .dhx_cal_event .dhx_title{
            line-height: 12px;
        }
        .dhx_cal_event_line:hover,
        .dhx_cal_event:hover .dhx_body,
        .dhx_cal_event.selected .dhx_body,
        .dhx_cal_event.dhx_cal_select_menu .dhx_body{
            opacity: 1;
        }

        .dhx_cal_event.event_amarillo div, .dhx_cal_event_line.event_amarillo {
            background-color: orange !important;
            border-color: #a36800 !important;
        }
        .dhx_cal_event_clear.event_amarillo{
            color:orange !important;
        }

        .dhx_cal_event.event_verde div, .dhx_cal_event_line.event_verde{
            background-color: #36BD14 !important;
            border-color: #698490 !important;
        }
        .dhx_cal_event_clear.event_verde{
            color:#36BD14 !important;
        }

        .dhx_cal_event.event_rosa div, .dhx_cal_event_line.event_rosa {
            background-color: #FC5BD5 !important;
            border-color: #839595 !important;
        }
        .dhx_cal_event_clear.event_rosa {
            color:#B82594 !important;
        }

    </style>

    <script type="text/javascript" charset="utf-8">
        function init() {
            scheduler.config.xml_date = "%Y-%m-%d %H:%i";
            scheduler.config.time_step = 30;
            scheduler.config.multi_day = true;
            scheduler.locale.labels.section_subject = "Color";
            scheduler.config.first_hour = 6;
            scheduler.config.limit_time_select = true;
            scheduler.config.details_on_dblclick = true;
            scheduler.config.details_on_create = true;

            scheduler.templates.event_class = function (start, end, event) {
                var css = "";

                if (event.subject) // if event has subject property then special class should be assigned
                    css += "event_" + event.subject;

                if (event.id == scheduler.getState().select_id) {
                    css += " selected";
                }
                return css; // default return

            };

            var subject = [
                {key: 'azul', label: 'Azul'},
                {key: 'rosa', label: 'Rosa'},
                {key: 'amarillo', label: 'Amarillo'},
                {key: 'verde', label: 'Verde'}
            ];

            scheduler.config.lightbox.sections = [
                {name: "description", height: 43, map_to: "text", type: "textarea", focus: true},
                {name: "subject", height: 20, type: "select", options: subject, map_to: "subject"},
                {name: "time", height: 72, type: "time", map_to: "auto"}
            ];

            var dt = new Date()
            scheduler.init('scheduler_here', new Date(dt.getFullYear(), dt.getMonth(), dt.getDay()), "month");

            //CREAR UN LLAMADO AJAX A UN SERVLET. EL SERVLET ENTREGA LA LISTA DE EVENTOS. ESTA LISTA DE EVENTOS DEBE TENER EL FORMATO LOS CREADOS.
            //EL SERVLET LOS ENTREGA EN JSON Y ACÀ SE PARSEA 

//            scheduler.parse([
//                {start_date: "2018-05-18 09:00", end_date: "2018-05-18 12:00", text: "Rosa", subject: 'rosa'},
//                {start_date: "2018-05-20 10:00", end_date: "2018-05-21 16:00", text: "Amarillo", subject: 'amarillo'},
//                {start_date: "2018-05-21 10:00", end_date: "2018-05-21 14:00", text: "Verde", subject: 'verde'},
//                {start_date: "2018-05-23 16:00", end_date: "2018-05-23 17:00", text: "Rosa2", subject: 'rosa '},
//                {start_date: "2018-05-22 09:00", end_date: "2018-05-22 17:00", text: "Azul"}
//            ], "json");


            // Lista de eventos extraída de la base de datos, convirtiéndola a JSON.
            scheduler.parse(eventoGson, "json");

        }

        //Agregar evento: hacer llamado AJAX para enviar la variable "ev" al Servlet.
        scheduler.attachEvent("onEventAdded", function (id, ev) {
            console.log(ev);
            var tempAgregar = 1;

            $.ajax({
                url: 'EventoSV',
                data: {id: id, ev: ev},
                type: 'POST'
            });

        });
    </script>

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

    <style>

        .buttonVolver {
            background-color: #008CBA; /* Green */
            border: none;
            color: white;
            padding: 6px 8px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin-left: 230px;
            margin-top: 3px;
            border-radius: 5px;
        }

    </style>

</head>

<body onload="init();">
    <div id="scheduler_here" class="dhx_cal_container" style='width:100%; height:100%;'>
        <div class="dhx_cal_navline">
            <div class="dhx_cal_prev_button">&nbsp;</div>
            <div class="dhx_cal_next_button">&nbsp;</div>
            <div class="dhx_cal_today_button"></div>
            <div class="dhx_cal_date"></div>
            <div class="dhx_cal_tab" name="day_tab" style="right:204px;"></div>
            <div class="dhx_cal_tab" name="week_tab" style="right:140px;"></div>
            <div class="dhx_cal_tab" name="month_tab" style="right:76px;"></div>
            <br>
            <a href="Login.jsp"><button class="buttonVolver">Volver</button></a> 
        </div>
        <div class="dhx_cal_header">
        </div>
        <div class="dhx_cal_data">
        </div>		
    </div>
</body>
