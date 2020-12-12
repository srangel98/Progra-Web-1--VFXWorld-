

<%@page import="com.mycompany.vfxworld.models.news"%>
<%@page import="com.mycompany.vfxworld.models.category"%>
<%@page import="java.util.List"%>
<%
    List<category> categories = (List<category>) request.getAttribute("Categories");
    List<news> foundNews = (List<news>) request.getAttribute("foundNews");
    String fragmento = (String) request.getAttribute("fragment");
%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">

        <title>Document</title>
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

        <!--Navbar-->
        <jsp:include page="navbar.jsp"></jsp:include>

            <section class="container">
                <div class="row section-lastnews">
                    <div class="col-12 text-center">
                        <h2 class="text-warning">Valor de búsqueda: "<%=fragmento%>"</h2>
                    <p class="text-muted">VFX World</p>
                </div>

                <%
                    for (news encontradas : foundNews) {
                        
                %>
                <article class="col-4 mb-5">
                    <div class="card bg-light">
                        <img src="<%=encontradas.getMiniImage()%>" alt="first" class="card-img card-img-filter" height="320">
                        <div class="card-img-overlay text-white d-flex flex-column justify-content-center">
                            <h4 class="text-center font-weight-bold"><%=encontradas.getTitle()%></h4>
                            <p class="card-title"> <%=encontradas.getDescription()%></p>
                            
                            <p class="card-text font-weight-light"><small>Autor: </small><%=encontradas.getAutor()%></p>
                            <form action="ShowNewController" method="GET">
                            <input style="display:none;" name="actualNewID" value="<%=encontradas.getId()%>" >
                            <button type="submit" class="btn btn-info mt-auto d-flex" style="display:block">Ir a la noticia</button>
                            </form>
                        </div>

                    </div>
                </article>
                <%}%>

        </section>


        <!-- Footer -->
        <!-- Footer -->
        <footer style="background-color:rgb(52, 58, 64);" class="page-footer font-small text-white pt-4 mb-auto d-flex">


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
