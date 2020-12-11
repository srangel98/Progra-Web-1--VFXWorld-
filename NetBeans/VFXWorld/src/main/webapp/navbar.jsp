<%-- 
    Document   : navbar
    Created on : 6 dic 2020, 20:47:08
    Author     : 52811
--%>

<%@page import="java.util.List"%>
<%@page import="com.mycompany.vfxworld.models.category"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<category> categories = (List<category>)request.getAttribute("Categories");
%>
   

         <!-- Navbar -->
 <nav class="navbar navbar-expand-lg navbar-dark bg-dark georgiaNTR">
  <a class="navbar-brand ml-5" href="#">
    <img src="Imagenes/VFX-World.png" class="img-fluid" width="40" height="47" alt="" loading="lazy" /></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <ul class="collapse navbar-collapse" id="navbarSupportedContent">
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
    <ul class="navbar-nav ml-auto mr-5 my-3">
        <% if(session.getAttribute("name") == null) { %>
      <li class="nav-item dropdown form-login mr-5">
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
                <button type="submit" class="btn btn-primary">Ingresar</button>
              </form>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item registration" href="#" data-toggle="modal" data-target=".registration-modal">¿No tienes cuenta? Regístrate</a>
        </div>
      </li>
      <%} else {%>
      <li class="nav-item dropdown form-login mr-5">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
          aria-haspopup="true" aria-expanded="false">
          <img src="https://static.thenounproject.com/png/3095687-200.png"
            width="33" height="33" alt="33" loading="lazy" />
        </a>
         <div class="dropdown-menu border-primary rounded">
              <form class="px-4 py-3  text-center">
                <div class="form-group">
                  <img src="<%= session.getAttribute("photo")%>" alt="" class="bd-placeholder-img rounded-circle" width="140" height="140">
                  <h2 class="text-black text-center"><%= session.getAttribute("name")%></h2>
                </div>
              </form>
              <div class="dropdown-divider"></div>
              <form action="ProfileController" method="GET">
              <input type="submit" class="dropdown-item btn btn-primary" value="Ir a tu Cuenta">
              </form>
              <div class="dropdown-divider"></div>
              <form action="CerrarSesion" method="POST">
                  <input type="submit" class="dropdown-item btn btn-primary" value="Cerrar Sesión">
              </form>
            </div>
      </li>
      <%}%>
      <li class="nav-item active mr-5">
        <a class="nav-link" href="#">Principal <span class="sr-only">(current)</span></a>
      </li>
     
      <li class="nav-item dropdown mr-5">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
          aria-haspopup="true" aria-expanded="false">
          Categorías
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <%
                for(category Category : categories){
            %>
          <a class="dropdown-item" href="#"><%= Category.getName()%></a>
          <%
              }
            %>
        </div>
      </li>
      
    </ul>
  </nav>
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

