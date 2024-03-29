<%-- 
    Document   : agregaramigo
    Created on : 18-mar-2015, 0:58:32
    Author     : ancabi
--%>

<%@page import="java.util.List"%>
<%@page import="app.entity.Usuario"%>
<%@page import="app.ejb.UsuarioFacade" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<%

    Usuario u = (Usuario) session.getAttribute("usuario");
    List<Usuario> resBuscar = (List<Usuario>) request.getAttribute("resBuscar");
    List<Usuario> invitaciones = u.getUsuarioList2();
    int enviado = 0;
    if (request.getAttribute("enviado") != null) {
        enviado = (Integer) request.getAttribute("enviado");
    }
%>

<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Friendslife</title>
        <link rel="icon" href="img/fl.png">
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

                    <a class="navbar-brand" href="#">
                        <img alt="Brand" src="img/fl.png">
                    </a>
                    <a class="navbar-brand" href="#">Friendslife</a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li><a href="Perfil.jsp">
                                <%= u.getNombre()%> 
                                <%= u.getApellidos()%>
                            </a></li>
                        <li><a href="Muro.jsp">Muro</a></li>
                    </ul>
                    <form class="navbar-form navbar-left pull-right" role="search">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Buscar">
                        </div>
                        <button type="submit" class="btn btn-default">Buscar</button>
                    </form>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>

        <div class="container-fluid">
            <%
                if (enviado == 0) {
            %>
            <div class="alert alert-success alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                La invitacion se ha enviado correctamente
            </div>  
            <%
                }
            %>
            <div class="row">
                <div class="col-sm-3 col-md-2 sidebar">
                    <ul class='nav nav-sidebar'><li><a href="Perfil.jsp">
                                <%= u.getNombre()%>
                                <%= u.getApellidos()%>
                            </a></li></ul>
                    <ul class="nav nav-sidebar">
                        <li><a href="Muro.jsp">Noticias</a></li>
                        <li><a href="#">Mensajes</a></li>
                        <li><a href="CrearGrupoIntegrantes.jsp">Grupos</a></li>
                        <li class="active"><a href="agregaramigo.jsp">Agregar amigos <div class="cantidad">
                                    <% if (u.getUsuarioList2().size() != 0)%>
                                    <%= u.getUsuarioList2().size()%>

                                </div></a></li>
                        <li><a href="AgregarPost.jsp">Agregar post</a></li>
                    </ul>
                </div>

                <div class="container" role="main">
                    <section class='col-sm-8'>
                        <h2>Solicitudes pendientes</h2>

                        <table class="table table-hover">
                            <%
                                if (invitaciones != null) {
                                    for(Usuario temp:invitaciones){
                            %>

                            <tr>
                                <td><%=temp.getNombre()%></td>
                                <td><%=temp.getApellidos()%></td>
                                <td style="width: 100px;"><a href="AgregarAmigo?id=<%=temp.getId()%>&ok=1"><button type="button" class="btn btn-success"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span> Aceptar</button></a></td>
                                <td><a href="AgregarAmigo?id=<%=temp.getId()%>&ok=0"><button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span> Rechazar</button></a></td>                       
                            </tr>

                            <%
                                    }
                                }
                            %>


                        </table>
                    </section>

                    <section class='col-sm-8'>
                        <h2>Buscar amigo</h2>

                        <div class="row">
                            <br/>
                            <div class="col-lg-6">
                                <form action="BuscarAmigo" method="post">
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="buscar" placeholder="Nombre/Apellido">
                                        <span class="input-group-btn">
                                            <input class="btn btn-primary" type="submit" value="Buscar">
                                        </span>
                                    </div>
                                </form>
                            </div><!-- /.col-lg-6 -->
                        </div><!-- /.row -->
                        <br/><br/>
                        <table class="table table-hover">

                            <%
                                if (resBuscar != null) {

                                    for (Usuario b : resBuscar) {
                            %>

                            <tr>
                                <td><%=b.getNombre()%></td>
                                <td><%=b.getApellidos()%></td>
                                <td><a href="AgregarSolicitud?id=<%=b.getId()%>"><button type="button" class="btn btn-success"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Enviar solicitud</button></a></td>
                            </tr>
                            <%
                                    }
                                }
                            %>

                        </table>
                    </section>
                </div>
                <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
                <!-- Include all compiled plugins (below), or include individual files as needed -->
                <script src="js/bootstrap.min.js"></script>
                </body>
                </html>
