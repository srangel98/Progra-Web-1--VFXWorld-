<%-- 
    Document   : index.html
    Created on : 21 nov 2020, 16:26:10
    Author     : 52811
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
  <!-- Navbar -->
  <div class="container-fluid ">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark georgiaNTR">
      <a class="navbar-brand" href="#">
        <img src="https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/664e6561547281.5a71f50c9077b.png"
          width="40" height="47" alt="" loading="lazy" /></a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <form class="form-inline my-2 my-lg-0">
        <input class="form-control mr-sm-2" type="search" placeholder="¿Qué estás buscando?" aria-label="Search" />
        <button type="button" class="btn btn-outline-secondary" type="submit">Buscar</button>
      </form>
      <div class="collapse navbar-collapse" style="padding-top:9px; "  id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#">Principal <span class="sr-only">(current)</span></a>
          </li>
         
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
              aria-haspopup="true" aria-expanded="false">
              Categorías
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="#">VFX Breakdown</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="#">Matte painting</a>
              <a class="dropdown-item" href="#">Rotoscope</a>
              <a class="dropdown-item" href="#">Tracking</a>
              <a class="dropdown-item" href="#">3D Integration</a>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Cuenta</a>
          </li>
          <li class="nav-item dropdown form-login" style="margin-left: 850px;">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
              aria-haspopup="true" aria-expanded="false">
              <img src="https://static.thenounproject.com/png/3095687-200.png"
                width="33" height="33" alt="33" loading="lazy" />
            </a>
            <div class="dropdown-menu border-primary rounded">
              <form class="px-4 py-3" action="IniciarSesion" method="POST">
                <div class="form-group">
                  <label for="exampleDropdownFormEmail1">Nombre de Usuario</label>
                  <input type="text" class="form-control" id="exampleDropdownFormEmail1"
                    placeholder="email@example.com" name="nombre">
                </div>
                <div class="form-group">
                  <label for="exampleDropdownFormPassword1">Contraseña</label>
                  <input type="password" class="form-control" id="exampleDropdownFormPassword1" placeholder="Password" name="contrasena">
                </div>
                <div class="form-group">
                  <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="dropdownCheck">
                    <label class="form-check-label" for="dropdownCheck">
                      Recordar
                    </label>
                  </div>
                </div>
                <button type="submit" class="btn btn-primary">Ingresar</button>
              </form>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item registration" href="#" data-toggle="modal" data-target=".registration-modal">¿No tienes cuenta? Regístrate</a>
            </div>
          </li>
        </ul>
      </div>
    </nav>
  </div>

  <div class="modal fade registration-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" >
      <form action="Registrarse" method="POST">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Registrarse</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
          
        </div>
        <div class="modal-body text-left">

          <div class="input-group mb-3">
            <div class="input-group-prepend">
              <span class="input-group-text" id="inputGroup-sizing-default">Nombre de Usuario</span>
            </div>
            <input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" name="user">
          </div>

          <div class="input-group mb-3">
            <div class="input-group-prepend">
              <span class="input-group-text" id="inputGroup-sizing-default">Correo electrónico</span>
            </div>
            <input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" name="email">
          </div>

          <div class="input-group">
            <div class="input-group-prepend">
              <span class="input-group-text" id="">Contraseña</span>
            </div>
            <input type="text" class="form-control" name="password">
          </div>

        </div>

        <div class="modal-footer">
          <button type="submit" class="btn btn-primary">Registrarse</button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        </div>

      </div>
    </div>
  </form>
  </div>
  <!-- Carousel -->
  <div class="container-fluid">

    <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
        <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img src="Imagenes/P1.jpg" class="d-block w-100" alt="...">
          <div class="carousel-caption d-none d-md-block">
            <h5>VFXShow 250:</h5>
            <p>Raised by wolves</p>
          </div>
        </div>
        <div class="carousel-item">
          <img src="Imagenes/P2.jpg" class="d-block w-100" alt="...">
          <div class="carousel-caption d-none d-md-block">
            <h5>The One and Only</h5>
            <p>Ivan at MPC</p>
          </div>
        </div>
        <div class="carousel-item">
          <img src="Imagenes/P3.jpg" class="d-block w-100" alt="...">
          <div class="carousel-caption d-none d-md-block">
            <h5>Tangent Animation Scales </h5>
            <p>with Virtual Workstations on AWS</p>
          </div>
        </div>
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
  <div class="row mb-3"  >
    <div class="col-md-4 ">
      <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative lastnews-cards" >
        <div class="col p-4 d-flex flex-column position-static">
          <h3 class="mb-0 text-white">Featured post</h3>
          <div class="mb-1 text-muted">Nov 12</div>
          <p class="card-text mb-auto lastnews-body">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Ex eveniet necessitatibus optio officiis neque aut amet enim soluta aspernatur animi!</p>
          <a href="#" class="stretched-link">Continue reading</a>
        </div>
        <div class="col-auto d-none d-lg-block">
          <img src="https://i.ytimg.com/vi/VWB6lnnYFlc/maxresdefault.jpg" alt="Stardew-Valley" width="250" height="250" srcset="">
        </div>
      </div>
    </div>
    <div class="col-md-4">
      <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative lastnews-cards">
        <div class="col p-4 d-flex flex-column position-static">
          <h3 class="mb-0 text-white">Post title</h3>
          <div class="mb-1 text-muted">Nov 11</div>
          <p class="card-text mb-auto lastnews-body">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Dicta doloribus quasi quisquam eius hic amet consectetur nobis temporibus cupiditate nemo.</p>
          <a href="#" class="stretched-link">Continue reading</a>
        </div>
        <div class="col-auto d-none d-lg-block">
          <img src="https://s3.amazonaws.com/thinkific-import/102609/PjiJnMOvTPtfFH6zh75A_Artboard%2013.png" alt="Stardew-Valley" width="250" height="250" srcset="">
        </div>
      </div>
    </div>
    <div class="col-md-4">
      <div class="row no-gutters border border-white rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative lastnews-cards">
        <div class="col p-4 d-flex flex-column position-static">
          <h3 class="mb-0 text-white">Post title</h3>
          <div class="mb-1 text-muted">Nov 11</div>
          <p class="card-text mb-auto lastnews-body">This is a wider card with supporting text below as a natural lead-in to additional content.</p>
          <a href="#" class="stretched-link">Continue reading</a>
        </div>
        <div class="col-auto d-none d-lg-block">
          <img src="https://nofilmschool.com/sites/default/files/styles/facebook/public/2-vfx-3.jpeg?itok=AqmXvOA4" alt="Stardew-Valley" width="250" height="250" srcset="">
        </div>
      </div>
    </div>
  </div>
</div>
  <!-- Noticias recientes (Botón) -->
  <div class="btn-lastnews">
    <a class="btn btn-secondary" href="lista-noticias.html" role="button" target="_blank">Ver más</a>

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
    <h2 class="text-white">Heading</h2>
    <p class="lastnews-body">Donec sed odio dui. Etiam porta sem malesuada magna mollis euismod. Nullam id dolor id nibh ultricies vehicula ut id elit. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Praesent commodo cursus magna.</p>
    <p><a class="btn btn-secondary" href="#" role="button">View details »</a></p>
  </div><!-- /.col-lg-4 -->
  <div class="col-lg-4">
    <img src="Imagenes/da-vinci-resolve.png" alt="" class="bd-placeholder-img rounded-circle" width="140" height="140">
    <h2 class="text-white">Heading</h2>
    <p class="lastnews-body">Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh.</p>
    <p><a class="btn btn-secondary" href="#" role="button">View details »</a></p>
  </div><!-- /.col-lg-4 -->
  <div class="col-lg-4">
    <img src="Imagenes/cinema-4d-logo.png" alt="" class="bd-placeholder-img rounded-circle" width="140" height="140">
    <h2 class="text-white">Heading</h2>
    <p class="lastnews-body">Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
    <p><a class="btn btn-secondary" href="#" role="button">View details »</a></p>
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
