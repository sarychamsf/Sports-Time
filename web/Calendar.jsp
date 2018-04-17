<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<head>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">
    <title>Sports Time - Calendario</title>

    <link rel="stylesheet" href="./assets/css/material-kit.css?v=2.0.2">

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" crossorigin="anonymous"></script>
    <link  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" >

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

</head>

<script src="js/dhtmlxscheduler.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" href="css/dhtmlxscheduler.css" type="text/css" charset="utf-8">


<style type="text/css" >
    html, body{
        margin:0px;
        padding:0px;
        height:100%;
        overflow:hidden;
    }	
</style>

<script type="text/javascript" charset="utf-8">
    function init() {
        var dt = new Date()
        scheduler.config.xml_date = "%Y-%m-%d %H:%i";
        scheduler.init('scheduler_here', new Date(dt.getFullYear(), dt.getMonth()+1, dt.getDay()), "month");
        scheduler.load("./data/events.xml");
    }
</script>

<body onload="init();">

    <div id="scheduler_here" class="dhx_cal_container" style='width:100%; height:100%;'>
        <div>
            <div class="dhx_cal_navline">
                <div class="dhx_cal_prev_button">&nbsp;</div>
                <div class="dhx_cal_next_button">&nbsp;</div>
                <div class="dhx_cal_today_button"></div>
                <div class="dhx_cal_date"></div>
                <div class="dhx_cal_tab" name="day_tab" style="right:204px;"></div>
                <div class="dhx_cal_tab" name="week_tab" style="right:140px;"></div>
                <div class="dhx_cal_tab" name="month_tab" style="right:76px;"></div>
            </div>
        </div>
        <div class="dhx_cal_header">
        </div>
        <div class="dhx_cal_data">
        </div>
    </div>


</body>