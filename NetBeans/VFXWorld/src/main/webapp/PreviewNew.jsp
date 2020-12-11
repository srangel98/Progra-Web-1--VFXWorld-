<%-- 
    Document   : PreviewNew
    Created on : 8 dic 2020, 14:53:34
    Author     : 52811
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mycompany.vfxworld.models.news"%>
<%@page import="com.mycompany.vfxworld.models.category"%>
<%@page import="java.util.List"%>



<%
    List<category> categories = (List<category>) request.getAttribute("Categories");
    news not = (news) session.getAttribute("NoticiaSinAprobar");
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

    <body>
        <!-- Navbar -->

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
                        <h6>Esta es la fecha de creación</h6>
                        <div class="dropdown-divider dp_div2"></div>
                        <p class="news-body" > <%=not.getBody()%>

                            <img src="<%=not.getBodyImage()%>" alt="" style="max-height:300px;" class="img-fluid mx-auto d-block mt-5 mb-5">
                            <video src="<%=not.getVideos()%>" class="img-fluid mx-auto d-block mt-5" width="800" height="600" controls></video>


                        <div class="dropdown-divider dp_div2"></div>
                        <p>Categoría: <%=not.getCategory()%></p>
                    </div>


                    <div class="card-news rounded">

                        <h5 class="text-center">Autor: <h2 class="text-center"><%=not.getAutor()%></h2></h5>

                    </div>
                        <div class="row">
                            <div class="col-12 mx-auto d-flex mt-3">
                                <form action="ProfileController" method="GET" class="form-inline mx-auto" style="display:inline;">
                                    <input class="btn btn-danger pull-right" type="submit" value="Regresar a mi cuenta">
                                </form>
                            </div>
                        </div>
                </div>
                    <%if(!session.getAttribute("userType").equals("C") ) {%>
                      <div class="card-news rounded col-12">
                    <h4>Menciona los cambios que se necesitan.</h4>
                    <div class="container pb-cmnt-container">
                        <div class="row">
                            <div class="col-md-12 col-md-offset-3">
                                <div class="panel panel-info">
                                    <div class="panel-body">
                                        <form action="ApprovingNewsController" method="POST" class="form-inline mx-auto" style="display:inline;">
                                        <textarea placeholder="Retroalimentación" style="width: 100%; height: 150px;" name="feedback"></textarea>
                                        
                                          <input class="btn btn-danger pull-right" style=" margin-right: 900px;" type="submit" value="Rechazar">
                                          <input name="idNew" style="display:none;"> 
                                          <input type="text"style="display:none;" name="idDeLaNoticia"  value="<%= not.getId()%>">
                                          <input type="text"style="display:none;" name="isApproved"  value="0">
                                           </form>
                                         <form action="ApprovingNewsController" method="POST" class="form-inline mx-auto" style="display:inline;">
                                          <input class="btn btn-success pull-right ml-auto" type="submit" value="Aprobar">
                                          <input type="text"style="display:none;" name="idDeLaNoticia"  value="<%= not.getId()%>">
                                          <input type="text"style="display:none;" name="isApproved"  value="1">
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                      <%}%>                    
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
