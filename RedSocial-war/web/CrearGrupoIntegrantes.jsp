<%-- 
    Document   : CrearGrupoIntegrantes
    Created on : 02-may-2015, 10:21:21
    Author     : JoséMaría
--%>

<%@page import="app.entity.Post"%>
<%@page import="java.util.List"%>
<%@page import="app.entity.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<%
    Usuario u = (Usuario) session.getAttribute("usuario");


%>

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
                        <li ><a href="Perfil.jsp">
                                <%=u.getNombre()%> 
                                <%=u.getApellidos()%>
                            </a></li>
                        <li ><a href="Muro.jsp">Muro</a></li>
                    </ul>
                    <form class="navbar-form navbar-left pull-right" role="search" >
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Buscar">
                        </div>
                        <button type="submit" class="btn btn-default pull-right">Buscar</button>
                    </form>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>

        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-3 col-md-2 sidebar">
                    <ul class='nav nav-sidebar'>
                        <li ><a href="Perfil.jsp">
                                <%=u.getNombre()%> 
                                <%=u.getApellidos()%>
                            </a></li></ul>
                    <ul class="nav nav-sidebar">
                        <li><a href="Muro.jsp">Noticias </a></li>
                        <li><a href="#">Mensajes</a></li>
                        <li class="active"><a href="CrearGrupoIntegrantes.jsp">Grupos</a></li>
                        <li><a href="agregaramigo.jsp">Agregar amigos<div class="cantidad">
                                    <%if (u.getUsuarioList2().size() != 0)%>
                                    <%=u.getUsuarioList2().size()%>
                                </div></a></li>
                                <li><a href="AgregarPost.jsp">Agregar post</a></li>
                    </ul>
                </div>

                <div class="container" role="main">
                    <section class='col-sm-10'>
                        <!--Cuerpo de la página -->
                        <h1>
                            Crear Grupo
                        </h1>
                        <form method="get" action="CrearGrupoNombre" name="crear" class="col-sm-10">
                            <div class="input-group ">
                                <span class="input-group-addon" id="basic-addon1">Nombre del Grupo:</span>
                                <input name="nombreG" type="text" class="form-control" placeholder="e.g., Illuminatis" aria-describedby="basic-addon1">

                            </div>



                            <button type="submit" value="Crear" class="btn btn-default navbar-btn">Crear</button>





                        </form>



                        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
                        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
                        <!-- Include all compiled plugins (below), or include individual files as needed -->
                        <script src="js/bootstrap.min.js"></script>
                        </body>
                        </html>