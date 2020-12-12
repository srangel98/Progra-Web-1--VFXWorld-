<%-- 
    Document   : index.html
    Created on : 21 nov 2020, 16:26:10
    Author     : 52811
--%>

<%@page import="com.mycompany.vfxworld.models.news"%>
<%@page import="com.mycompany.vfxworld.models.category"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>




<%
    List<category> categories = (List<category>) request.getAttribute("Categories");
    List<news> approvedNews = (List<news>) request.getAttribute("allNews");
    List<news> besthree = (List<news>) request.getAttribute("topthree");
    int contador = 0;
%>
<!DOCTYPE html>

<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">

        <title>VFX World</title>
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


        <!-- Carousel -->
        <div class="container-fluid">

            <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
                    <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    
                    <%
                    for (news mejoresTres : besthree) {
                        contador++;
                        if(contador == 1){
                %>
                    
                    <div class="carousel-item active">
                        <%} else{%>
                        <div class="carousel-item">
                        <%}%>
                        <img src="<%=mejoresTres.getHeaderImage()%>" class="d-block w-100" alt="...">
                        <div class="carousel-caption d-md-block">
                            <h5><%=mejoresTres.getTitle()%></h5>
                            <p><%=mejoresTres.getDescription()%></p>
                        </div>
                    </div>
                    <%}%>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>

        <!-- Noticias recientes (banner) -->
        <div class="container">
            <div class="banner border border-dark">
                <h2 class="text-warning"> Noticias recientes </h2>
            </div>
        </div>

        <!-- Noticias recientes (cards) -->
        <div class="container-fluid">
            <div class="row">

                <%
                    for (news Noticia : approvedNews) {
                        if (Noticia.getApproved() == 1) {
                %>
                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12 pb-5">
                    <div class="card mx-auto banner text-white text-left">
                        <img class="card-img-top" src="<%=Noticia.getMiniImage()%>" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title"><%=Noticia.getTitle()%></h5>
                            <p class="card-text"><%=Noticia.getDescription()%></p>
                            <form action="ShowNewController" method="GET">
                                <button type="submit" class="btn btn-info" style="display:block">Ir a la noticia</button>
                                <input type="text" name="actualNewID" value="<%=Noticia.getId()%>" style="display:none;">
                            </form>
                        </div>
                    </div>
                </div>
                <%
                        }
                    }
                %>
            </div>

        </div>



        <div class="container">
            <div class="banner border  border-dark">
                <h2 class="text-warning"> Los expertos recomiendan </h2>
            </div>
        </div>

        <div class="container">
            <div class="row text-center">
                <div class="col-lg-4">
                    <img src="Imagenes/after-effects.png" alt="" class="bd-placeholder-img rounded-circle" width="140" height="140">
                    <h2 class="text-white">After Effects</h2>
                    <p class="lastnews-body">Adobe After Effects es una aplicación que tiene forma de estudio destinado para la creación o aplicación en una composición, así como realización de gráficos profesionales en movimiento y efectos especiales.</p>
                    <p><a class="btn btn-secondary" href="https://www.adobe.com/mx/products/aftereffects.html" target="_blank" role="button">Obtener</a></p>
                </div><!-- /.col-lg-4 -->
                <div class="col-lg-4">
                    <img src="Imagenes/da-vinci-resolve.png" alt="" class="bd-placeholder-img rounded-circle" width="140" height="140">
                    <h2 class="text-white">DaVinci Resolve</h2>
                    <p class="lastnews-body">DaVinci Resolve es un software de edición de video no lineal desarrollado por Blackmagic Design. Su versión más reciente es DaVinci Resolve 16 la cual funciona en ordenadores personales con sistema operativo Windows, Mac OS X y Linux, aunque no en Android.</p>
                    <p><a class="btn btn-secondary" href="https://www.blackmagicdesign.com/mx/products/davinciresolve/" target="_blank" role="button">Obtener</a></p>
                </div><!-- /.col-lg-4 -->
                <div class="col-lg-4">
                    <img src="Imagenes/cinema-4d-logo.png" alt="" class="bd-placeholder-img rounded-circle" width="140" height="140">
                    <h2 class="text-white">Cinema 4D</h2>
                    <p class="lastnews-body">Cinema 4D es un software de creación de gráficos y animación 3D desarrollado originariamente para Commodore Amiga por la compañía alemana Maxon, y portado posteriormente a plataformas Windows y Macintosh.</p>
                    <p><a class="btn btn-secondary" href="https://www.maxon.net/en/cinema-4d" target="_blank" role="button">Obtener</a></p>
                </div><!-- /.col-lg-4 -->
            </div>
        </div>
        <!-- Footer -->
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
