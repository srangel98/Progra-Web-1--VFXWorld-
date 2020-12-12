<%-- 
    Document   : profile
    Created on : 6 dic 2020, 20:58:27
    Author     : 52811
--%>

<%@page import="com.mycompany.vfxworld.models.news"%>
<%@page import="com.mycompany.vfxworld.models.category"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    List<category> categories = (List<category>) request.getAttribute("Categories");
    List<news> noticias = (List<news>) request.getAttribute("NoticiasAutor");
    List<news> approvedNews = (List<news>) request.getAttribute("allNews");
    List<news> favNewsID = (List<news>) request.getAttribute("idNewsFav");
    int insertCategories = 0;
%>
<!DOCTYPE html>
<html lang="en">


    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">

        <title>Perfil</title>
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
    <script>
        $(function () {
            $("#selectedCategory").change(function () {
                var displayCategory = $("#selectedCategory option:selected").text();
                $("#uploadCategory").val(displayCategory);
            })
        })
    </script>
    <body>

        <!--Navbar-->
        <jsp:include page="navbar.jsp"/>

        <!-- Foto / otros datos -->
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






                <% if (session.getAttribute("userType").equals("R")) { %>
                <div class="col-md-4 order-md-2 mb-4"> <!--ESTO ES LO DE LA DERECHA-->
                    <h4 class="d-flex justify-content-between align-items-center mb-3">
                        <span class="text-muted">Noticias Favoritas</span>

                    </h4>
                    <div style="overflow: scroll; height: 450px;">
                        <ul class="list-group mb-3">
                            <%   for (news idsNoticias : favNewsID) {
                                    for (news NoticiasFav : approvedNews) {
                                        if (idsNoticias.getId() == NoticiasFav.getId()) {


                            %>

                            <li class="list-group-item d-flex justify-content-between lh-condensed">
                                <div>
                                    <h5 style="color: black;"><%=NoticiasFav.getTitle()%></h5>
                                    <small class="text-muted"><%=NoticiasFav.getDescription()%></small>
                                </div>
                            </li>
                            <%                            }
                                    }
                                }
                            %>
                        </ul>
                    </div>
                </div>

                <% } else if (session.getAttribute("userType").equals("C")) {%>
                <div class="col-md-4 order-md-2 mb-4"> <!--ESTO ES LO DE LA DERECHA-->
                    <h4 class="d-flex justify-content-between align-items-center mb-3">
                        <span class="text-muted">Tus noticias</span>
                   
                    </h4>
                    <div style="overflow: scroll; height: 450px;">
                        <ul class="list-group mb-3">
                            <%
                                for (news Noticia : noticias) {

                            %>
                            <li class="list-group-item d-flex justify-content-between lh-condensed">
                                <div>
                                    <h5 style="color: black;"> <%= Noticia.getTitle()%> </h5>
                                    <small class="text-muted"> <%= Noticia.getDescription()%> </small>
                                    <br> </br>
                                    <% if (Noticia.getApproved() == 0 && Noticia.getFeedback() == null) { %>
                                    <small class="text-warning">Pendiente de aprobación</small>
                                    <%} else if (Noticia.getFeedback() != null) {%>
                                    <form action="PreviewNewsController" method="POST">
                                        <small class="text-danger" style="display:block;">Noticia Rechazada</small>
                                        <small class="text-warning"><%=Noticia.getFeedback()%></small>
                                        <button type="submit" class="btn btn-primary mt-1 ml-auto d-flex ">Ver Noticia</button>
                                        <input class="text-muted" style="display:none;" name="iDNewEdit" value="<%= Noticia.getId()%>">
                                    </form>
                                    <%} else if (Noticia.getApproved() == 1) {%>
                                    <small class="text-success">Noticia Aprobada</small>
                                    <%}%>
                                </div>
                            </li>
                            <%
                                }
                            %>
                        </ul>
                    </div>
                    <button class="btn btn-primary btn-lg btn-block" type="submit" data-toggle="modal"  data-target=".doNews">Crear noticia</button>
                </div>

                <form action="UploadNewsController" method="POST">
                    <div class="modal fade doNews" style="color: black;" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Noticia</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>

                                </div>
                                <div class="modal-body">


                                    <div class="form-group">
                                        <label for="newsTitle">Título de la noticia</label>
                                        <input type="text" class="form-control" name="tituloNoticia"  placeholder="Título">
                                    </div>
                                    <div class="form-group">
                                        <label for="newsDescription">Descripción de la noticia</label>
                                        <input type="text" class="form-control" name="descripcionNoticia"  placeholder="Descripción">
                                    </div>

                                    <div class="form-group">
                                        <select id="selectedCategory">
                                            <option value="" selected disabled>Selecciona una Categoría</option>
                                            <%
                                                for (category Category : categories) {
                                                    insertCategories++;
                                            %>
                                            <option value="<%=insertCategories%>"><%= Category.getName()%></option>
                                            <%
                                                }
                                            %>
                                        </select>
                                        <input type="text hidden" style="display:none" id="uploadCategory" class="text-muted" name="categoriaNoticia" readonly="readonly" >
                                    </div>

                                    <div class="form-group">
                                        <label for="newsHeaderImage">Imagen de miniatura</label>
                                        <input type="file" class="form-control-file" name="imagenMiniatura">
                                    </div>
                                    <div class="form-group">
                                        <label for="newsHeaderImage">Imagen de encabezado</label>
                                        <input type="file" class="form-control-file" name="imagenEncabezado">
                                    </div>


                                </div>

                                <div class="modal-body">


                                    <div class="form-group text-center">
                                        <label for="newsBody">Cuerpo de la noticia</label>
                                        <textarea type="text" class="form-control textarea-newsBody" name="cuerpoNoticia"  placeholder="Cuerpo"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="newsBodyImage">Imagen de cuerpo</label>
                                        <input type="file" class="form-control-file" name="imagenCuerpo">
                                    </div>

                                    <div class="form-group">
                                        <label for="newsBodyImage">Video <h6 class="text-muted" style="display:inline;">(Opcional)</h6> </label>
                                        <input type="file" class="form-control-file" name="videoNoticia">
                                    </div>



                                </div>

                                <div class="modal-footer">
                                    <input type="submit" class="btn btn-primary" value="Subir"></input>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                </div>

                            </div>
                        </div>
                    </div>
                </form>
                <% } %>
                <!-- Izquierda -->
                <div class="col-md-8 order-md-1">
                    <h4 class="mb-3">Información de la cuenta</h4>
                    <form class="needs-validation" action="ProfileEditController" method="GET">

                        <div class="mb-3" style="margin-top: 40px;">
                            <label for="username">Sobre mí:</label>
                            <% if (session.getAttribute("registered_aboutMe") != null) {%>
                            <h6><%= session.getAttribute("registered_aboutMe")%></h6>
                            <%} else {%>
                            <h6>Bienvenido a mi perfil.</h6>
                            <%}%>
                        </div>


                        <div class="mb-3" style="margin-top: 10px;">
                            <label for="username">Nombre de Usuario</label>
                            <h6><%= session.getAttribute("name")%></h6>
                        </div>

                        <div class="mb-3" style="margin-top: 10px;">
                            <label for="email">Correo electrónico</label>
                            <h6><%= session.getAttribute("email")%></h6>
                        </div>

                        <div class="row">
                            <div class="col-md-3 mb-3" style="margin-top: 10px;">
                                <% if(session.getAttribute("userType").equals("R")){ %>
                                <label for="zip">ID de usuario registrado</label>
                                <%} else{ %>
                                <label for="zip">ID de usuario creador de noticias</label>
                                <%}%>
                                <h6><%= session.getAttribute("registered_id")%></h6>
                            </div>
                        </div>


                        <hr class="mb-4">


                        <hr class="mb-4">
                        <%if (session.getAttribute("userType").equals("R")) {%>
                        <button class="btn btn-secondary btn-lg btn-block" type="submit">Editar perfil</button>
                        <%}%>
                    </form>
                </div>
            </div>

        </div>






        <!-- Footer -->
        <footer style="background-color:rgb(52, 58, 64);" class="page-footer font-small text-white pt-4">


            <div class="container-fluid text-center text-md-left">


                <div class="row">
                    <div class="col-md-1 mt-md-0 mt-3">



                    </div>

                    <div class="col-md-5 mt-md-0 mt-3">


                        <img src="https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/664e6561547281.5a71f50c9077b.png"
                             width="70" height="77" alt="" loading="lazy" /></a>
                        <h5>VFX WORLD</h5>
                    </div>


                    <hr class="clearfix w-100 d-md-none pb-3">


                    <div class="col-md-3 mb-md-0 mb-3">
                    </div>
                    <div class="col-md-3 mb-md-0 mb-3">

                        <div class="mb-3">
                            <h5 class="">Vistanos en</h5>
                            <img class="mr-3" src="Imagenes/facebook.png" width="40px" height="auto" alt="">
                            <img class="mr-3" src="Imagenes/youtube.png" width="40px" height="auto" alt="">
                            <img src="Imagenes/twitter.png" width="40px" height="auto" alt="">
                        </div>
                        <div>Icons made by
                            <a href="https://www.flaticon.com/authors/freepik" title="Freepik">Freepik
                            </a> from
                            <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com
                            </a>
                        </div>

                    </div>

                </div>
        </footer>

    </body>
</html>
