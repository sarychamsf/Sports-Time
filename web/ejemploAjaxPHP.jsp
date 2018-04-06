<%-- 
    Document   : ejemploAjaxPHP
    Created on : 31-mar-2018, 22:53:00
    Author     : JCBOT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Ejemplo</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                $.ajax({
                    url: 'http://localhost/my-app/listar.php',
                    type: "POST",
                    success: function (json) {
                        console.log(json);
                    }
                });
            });

        </script>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
