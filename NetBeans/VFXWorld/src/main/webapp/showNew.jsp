<%-- 
    Document   : PreviewNew
    Created on : 8 dic 2020, 14:53:34
    Author     : 52811
--%>

<%@page import="com.mycompany.vfxworld.models.comment"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mycompany.vfxworld.models.news"%>
<%@page import="com.mycompany.vfxworld.models.category"%>
<%@page import="java.util.List"%>



<%
    List<category> categories = (List<category>) request.getAttribute("Categories");
    news not = (news) request.getAttribute("Noticia");
    List<comment> comentarios = (List<comment>) request.getAttribute("Comentarios");
    List<comment> todasRespuestas = (List<comment>) request.getAttribute("todasRespuestas");
    int contador = 0;
%>
<!DOCTYPE html>
<html lang="en">


    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">

        <title>Noticia</title>
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

        $(document).ready(function () {

        <% for (comment Comentario : comentarios) {
                if (Comentario.getIdNews() == not.getId()) {
                    contador++;
        %>

            $('#responder<%=contador%>').on('click', function () {
                $('#escribirRespuesta<%=contador%>').toggle();
            });
        <%}
            }
            contador = 0;%>
        });

    </script>

    <body>
        <!-- Navbar -->
        <jsp:include page="navbar.jsp"/>
        <!-- Fondo -->
        <div class="container">


            <div class="row">
                <div class="fakeimg rounded">
                    <img src="<%=not.getHeaderImage()%>" alt="" style="max-height:300px;" class="img-fluid mx-auto d-block">
                </div>

                <div class="leftcolumn">
                    <div class="card-news rounded">
                        <h1 style="margin-bottom: 10px;"><%=not.getTitle()%></h1>
                        <h5 style="margin-top: 5px; margin-bottom: 15px;"><%=not.getDescription()%></h5>
                        <div class="dropdown-divider dp_div2"></div>
                        <p class="news-body"> <%=not.getBody()%>

                            <img src="<%=not.getBodyImage()%>" alt="" style="max-height:300px;" class="img-fluid mx-auto d-block mt-5 mb-5">
                            <% if (!not.getVideos().equals("Videos/")) {%>
                            <video class="img-fluid mx-auto d-block mt-5" width="800" height="600" controls>
                                <source src="<%=not.getVideos()%>" type="video/mp4">
                            </video>
                            <%}%>
                        <div class="dropdown-divider dp_div2"></div>
                        <p>Categoría: <%=not.getCategory()%></p>
                    </div>




                    <% if (session.getAttribute("userType").equals("R") || session.getAttribute("userType").equals("A")) {%>
                    <div class="card-news rounded row">
                        <div class="col-12">
                            <form action="FavController" method="POST">
                                <input style="display:none" value="<%=not.getId()%>" name="idNew">
                                <button type="submit" class="mx-auto d-flex" style="border:none; background-color:white;">
                                    <%if (session.getAttribute("isMarked").equals("0")) {%>
                                    <img src="Imagenes/fav-neutral.png"  width="41" height="50">
                                    <%} else {%>
                                    <img src="Imagenes/fav-active.png"  width="41" height="50">
                                    <%}%>
                                </button>
                            </form>
                        </div>
                        <div class="dropdown-divider dp_div2 col-12"></div>
                        

                            <div class="col-12">
                                <h2 class="text-center mt-2"> Puntuación: <%=not.getRate()%> </h2>
                            </div>
                        
                    </div>
                    <%} else {%>
                    <div class="card-news rounded row">

                        <div class="col-12">
                            <h2 class="text-center mt-2"> Puntuación: <%=not.getRate()%> </h2>
                        </div>
                    </div>
                    <%}%>
                    <div class="card-news rounded">

                        <h5 class="text-center">Autor: <h2 class="text-center"><%=not.getAutor()%></h2></h5>

                    </div>


                </div>
                <!-- Comentarios -->
                <div class="container row mx-auto d-flex">
                    <div class="col-12 card-news rounded">
                        <% if (session.getAttribute("userType").equals("R") || session.getAttribute("userType").equals("A") || session.getAttribute("userType").equals("0")) {%>
                        <h4>¡Comentarios!</h4>
                        <div class="container pb-cmnt-container">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="panel panel-info">
                                        <div class="panel-body">
                                            <form action="CommentController" method="POST">
                                                <textarea placeholder="¡Comparte algo con los demás! :)" class="pb-cmnt-textarea" name="comentario" required></textarea>
                                                <textarea name="idNoticia" style="display:none;"><%=not.getId()%></textarea>
                                                <button class="btn btn-success pull-right" type="submit">Comentar</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%}%>
                        <!-- Comentarios individuales -->
                        <div class="ind-com row">
                            <% for (comment Comentario : comentarios) {
                                    if (Comentario.getIdNews() == not.getId()) {
                                        contador++;
                            %>
                            <li class="media col-12" >
                                <img class=" media-object rounded-circle responsiveImage" src="<%=Comentario.getPhotoUser()%>" alt="profile">
                                <div class="col-8" style="margin-left: 20px; margin-top: 0px;">
                                    <div >
                                        <h4 class="media-heading text-uppercase reviews"><%=Comentario.getNameUser()%> </h4>
                                        <p class="media-comment">
                                            <%=Comentario.getBody()%>
                                        </p>
                                        <div class="col-12 ">
                                            <button type="button" id="responder<%=contador%>" class="btn btn-info">Ver respuestas</button>
                                            <div id="escribirRespuesta<%=contador%>" class=" bg-secondary border rounded p-3 allReplies " style="display: none;">
                                                <% if (session.getAttribute("userType").equals("R") || session.getAttribute("userType").equals("A") || session.getAttribute("userType").equals("0")) {%>
                                                <form action="ReplyController" method="POST">

                                                    <textarea placeholder="¡Comparte algo con los demás! :)" class="mt-3 pb-cmnt-textarea" name="respuesta" style="height:100px;" required></textarea>
                                                    <button type="submit" class="btn btn-success ml-auto d-flex">Responder</button>
                                                    <textarea name="idCommentforReply" style="display:none;"><%=Comentario.getId()%></textarea>
                                                    <textarea name="idNoticia" style="display:none;"><%=not.getId()%></textarea>
                                                </form>
                                                <%}%>
                                                <%  for (comment replies : todasRespuestas) {
                                                        if (replies.getIdCommentToReply() == Comentario.getId()) {
                                                %>
                                                <div class="col-12 pt-2  mt-3 rounded border border-dark bg-white" style="">
                                                    <h5 class="media-heading text-uppercase reviews"><%=replies.getNameUser()%> </h5>
                                                    <p class="media-comment">
                                                        <%=replies.getBody()%>
                                                    </p>
                                                </div>
                                                <%}
                                                    }%>
                                            </div>
                                        </div>
                                    </div>              
                                </div>
                            </li>
                            <div class="dropdown-divider dp_div2 col-12"></div>
                            <%}
                                }
                                contador = 0;%>

                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>



    <!-- Footer -->
    <!-- Footer -->
    <footer style="background-color:rgb(52, 58, 64);" class="page-footer font-small text-white mt-3">


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
        </div>
    </footer>
</body>

</html>