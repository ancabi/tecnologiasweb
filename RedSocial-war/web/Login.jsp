<%-- 
    Document   : Login
    Created on : 20-mar-2015, 11:26:13
    Author     : Miguel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Friendslife</title>

        <!-- Bootstrap -->
        <link href="css/bootstrap.css" rel="stylesheet">


        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <nav class="navbar navbar-default">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">
                        <img alt="Brand" src="img/fl.png">
                    </a>
                    <a class="navbar-brand" href="#">Friendslife</a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li ><a href="#">Usuario </a></li>
                        <li class="active"><a href="#">Muro</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="#">Action</a></li>
                                <li><a href="#">Another action</a></li>
                                <li><a href="#">Something else here</a></li>
                                <li class="divider"></li>
                                <li><a href="#">Separated link</a></li>
                                <li class="divider"></li>
                                <li><a href="#">One more separated link</a></li>
                            </ul>
                        </li>
                    </ul>
                    <form class="navbar-form navbar-left" role="search">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Buscar">
                        </div>
                        <button type="submit" class="btn btn-default">Buscar</button>
                    </form>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>

        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-3 col-md-2 sidebar">
                    <ul class='nav nav-sidebar'><li><a href="#">Usuario</a></li></ul>
                    <ul class="nav nav-sidebar">
                        <li class="active"><a href="#">Noticias <span class="sr-only">(current)</span></a></li>
                        <li><a href="#">Mensajes</a></li>
                        <li><a href="#">Grupos</a></li>
                        <li><a href="#">Agregar amigos<div class="cantidad">2</div></a></li>
                    </ul>
                </div>

                <div class="container" role="main">
                    <section class='col-sm-10'>
                        <h1>Friendslife</h1>
                        <form method="get" action="LoginServlet" name="datos">
                            <div class="input-group">
                                <span class="input-group-addon" id="basic-addon1">Correo electr&oacute;nico</span>
                                <input type="text" class="form-control" placeholder="Correo electr&oacute;nico" aria-describedby="basic-addon1">
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon" id="basic-addon1">Contraseña</span>
                                <input type="text" class="form-control" placeholder="Contraseña" aria-describedby="basic-addon1">
                            </div>
                            <!--<div class="btn-toolbar" role="toolbar" aria-label="...">
                                <button type="button" class="btn btn-default">¿Has olvidado tu contraseña?</button>
                                <button type="button" class="btn btn-default">Entrar</button>
                            </div>-->
                            <button type="button" class="btn btn-default navbar-btn">¿Has olvidado tu contraseña?</button>
                            <button type="button" class="btn btn-default navbar-btn">Entrar</button>
                        </form>

                        <h1>Reg&iacute;strate</h1>
                        <form method="get" action="LoginServlet" name="datos">
                            <div class="input-group">
                                <span class="input-group-addon" id="basic-addon1">Nombre</span>
                                <input type="text" class="form-control" placeholder="Nombre" aria-describedby="basic-addon1">
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon" id="basic-addon1">Apellidos</span>
                                <input type="text" class="form-control" placeholder="Apellidos" aria-describedby="basic-addon1">
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon" id="basic-addon1">Correo electr&oacute;nico</span>
                                <input type="text" class="form-control" placeholder="Correo electr&oacute;nico" aria-describedby="basic-addon1">
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon" id="basic-addon1">Contraseña</span>
                                <input type="text" class="form-control" placeholder="Contraseña" aria-describedby="basic-addon1">
                            </div>
                            
                            <!--Fecha de nacimiento: <input name="dia" maxlength="2" size="1"> <input name="mes" maxlength="2" size="1"> <input name="año" maxlength="4" size="3"><br/>-->

                            <div class="input-group">
                                <span class="input-group-addon" id="basic-addon1">Fecha de nacimiento</span>
                                <input type="text" class="form-control" placeholder="D&iacute;a" aria-describedby="basic-addon1">
                                <input type="text" class="form-control" placeholder="Mes" aria-describedby="basic-addon1">
                                <input type="text" class="form-control" placeholder="Año" aria-describedby="basic-addon1">
                            </div>

<!--                            Sexo:
                            <select name="sexo">
                                <option>Hombre</option>
                                <option>Mujer</option>
                            </select>-->
                            
                            <div class="input-group">
                                <span class="input-group-addon" id="basic-addon1">Sexo</span>
                                <input type="text" class="form-control" placeholder="Sexo" aria-describedby="basic-addon1">
                            </div>
                            <br/>
                            <button type="button" class="btn btn-default navbar-btn">Quiero registrarme</button>
                        </form>
                    </section>
                </div>
                <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
                <!-- Include all compiled plugins (below), or include individual files as needed -->
                <script src="js/bootstrap.min.js"></script>
                </body>
                </html>