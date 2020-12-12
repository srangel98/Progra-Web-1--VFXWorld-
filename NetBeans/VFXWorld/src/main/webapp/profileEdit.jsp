<%-- 
    Document   : profileEdit
    Created on : 7 dic 2020, 16:35:23
    Author     : 52811
--%>

<%@page import="java.util.List"%>
<%@page import="com.mycompany.vfxworld.models.category"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<category> categories = (List<category>) request.getAttribute("Categories");
%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">

        <title>Editar Cuenta</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
              integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous" />
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
                integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
                integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
                integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
        crossorigin="anonymous"></script>
        <link rel="stylesheet" href="main.css">
    </head>
    <body>

        <jsp:include page="navbar.jsp"/>

        <div class="phead">
            <div class="container text-center" style="margin-top:10px; margin-bottom:10px;">
                <a href="#">
                    <img class="media-object rounded-circle" src="<%= session.getAttribute("photo")%>" alt="profile" width="30%" height="30%">
                </a>
                <h1 style="color:lavenderblush;"><%= session.getAttribute("name")%></h1>
            </div>
        </div>

        <!-- Derecha -->
        <div class="container">
            <div class="row text-white" style="margin-top:30px; margin-bottom:30px;">
                
                <!-- Izquierda -->
                <div class="col-md-12 order-md-1">
                    <h4 class="mb-3">Información de la cuenta</h4>
                    <form class="needs-validation" novalidate="" action="ModifyRController" method="POST">

                        <div class="mb-3">
                            <label>Sobre mí</label>
                            <% if (session.getAttribute("registered_aboutMe") != null) {%>
                            <input type="text" class="form-control" name="mr_aboutMe" value="<%= session.getAttribute("registered_aboutMe")%>">
                            <%} else {%>
                            <input type="text" class="form-control" name="mr_aboutMe" value="Bienvenido a mi perfil.">
                            <%}%>
                            
                        </div>

                        <div class="mb-3" style="margin-top: 10px;">
                            <label for="username" >Nombre de Usuario</label>
                            <h6 name="mr_name"><%= session.getAttribute("name")%></h6>
                        </div>

                        <div class="mb-3">
                            <label for="email">Correo electrónico</label>
                            <input type="email" class="form-control" name="mr_email" value="<%= session.getAttribute("email")%>">
                            <div class="invalid-feedback">
                                Por favor introduzca un correo electrónico válido.
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-3 mb-3" style="margin-top: 10px;">
                                <label for="zip">ID de usuario registrado</label>
                                <h6><%= session.getAttribute("registered_id")%></h6>
                            </div>
                        </div>

                        <div class="form-group mb-3">
                            <label for="newsHeaderImage">Imagen de Perfil</label>
                            <input type="file" class="form-control-file" name="mr_photo" value="<%= session.getAttribute("photo")%>">
                        </div>

                        <hr class="mb-4">


                        <hr class="mb-4">
                        <button class="btn btn-primary btn-lg btn-block" type="submit">Modificar</button>
                    </form>
                </div>
            </div>

        </div>

    </div>
</body>
</html>
