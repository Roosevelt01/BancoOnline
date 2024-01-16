<%-- 
    Document   : index
    Created on : 07-ene-2024, 18:00:19
    Author     : Alejandro Rodriguez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <style>
            body{
               display:flex;
               flex-direction: column;
               align-items: center;               
               justify-content: center;
            }
        </style>
        
        
        <h1>Inicia Sesión</h1>
        <form name="form1" action="/BancoOnline/Login" method="post">
            Usuario<input type="text" name="usuario" required/>
            <br>
            Password<input type="password" name="password" required/>
            <br>
            <input type="submit" value="Enviar" />
        </form>

        <script>
            window.onload = function () {
                var loginAttempts = ${sessionScope.loginAttempts};
                if (loginAttempts !== null && loginAttempts !== undefined) {
                    alert("Número de intentos fallidos: " + loginAttempts);
                }
            };
        </script>
    </body>
</html>
