<%-- 
    Document   : agregaramigo
    Created on : 18-mar-2015, 0:58:32
    Author     : ancabi
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
                    <a class="navbar-brand" href="#">Friendslife</a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li><a href="#">Usuario </a></li>
                        <li><a href="#">Muro</a></li>
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
                        <li><a href="#">Noticias</a></li>
                        <li><a href="#">Mensajes</a></li>
                        <li><a href="#">Grupos</a></li>
                        <li class="active"><a href="#">Agregar amigos</a></li>
                    </ul>
                </div>

                <div class="container" role="main">
                    <section class='col-sm-8'>
                        <h2>Agregar amigo</h2>

                        <div class="row">
                            <br/>
                            <div class="col-lg-6">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Nombre/Apellidos">
                                    <span class="input-group-btn">
                                        <button class="btn btn-default" type="button">Buscar</button>
                                    </span>
                                </div><!-- /input-group -->
                            </div><!-- /.col-lg-6 -->
                        </div><!-- /.row -->
                        <br/><br/>
                        <table class="table table-hover">

                            <tr>
                                <td>Ariel</td>
                                <td>Palomino</td>
                                <td><button type="button" class="btn btn-success"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Enviar solicitud</button></td>
                            </tr>
                            <tr>
                                <td>Pedro</td>
                                <td>Antequera</td>
                                <td><button type="button" class="btn btn-success"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Enviar solicitud</button></td>
                            </tr>
                        </table>
                    </section>
                </div>
                <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
                <!-- Include all compiled plugins (below), or include individual files as needed -->
                <script src="js/bootstrap.min.js"></script>
                </body>
                </html>
