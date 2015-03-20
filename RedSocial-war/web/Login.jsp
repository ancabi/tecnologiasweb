<%-- 
    Document   : Login
    Created on : 20-mar-2015, 11:26:13
    Author     : Miguel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <h1>Red social</h1>
        <form method="get" action="LoginServlet" name="datos">
            Correo eletrónico: <input name="correoLogin"><br/>
            Contraseña: <input name="contraseñaLogin"><br/>
            <input name="sesion" value="sesion" type="checkbox"/>No cerrar sesión<br/>
            <input name="recordatorio" value="¿Has olvidado tu contraseña?" type="submit"/>
            <button>Enviar</button><br/><br/><br/><br/><br/>
        </form>

        <h1>Regístrate</h1>
        <form method="get" action="LoginServlet" name="datos">
            Nombre: <input name="nombre"><br/>
            Apellidos: <input name="apellidos"><br/>
            Correo eletrónico: <input name="correoRegistro"><br/>
            Contraseña: <input name="contraseñaRegistro"><br/>
            Fecha de nacimiento: <input name="dia" maxlength="2" size="1"> <input name="mes" maxlength="2" size="1"> <input name="año" maxlength="4" size="3"><br/>
            Sexo:
            <select name="sexo">
                <option>Hombre</option>
                <option>Mujer</option>
            </select>
            <br/>
            <button>Quiero registrarme</button>
        </form>
    </body>
</html>