<%@ page import="com.example.eventmanagementapp.Domain.Event" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.eventmanagementapp.Domain.Category" %>
<%--
  Created by IntelliJ IDEA.
  User: Youcode
  Date: 22/10/2023
  Time: 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Features</title>
  <!-- App favicon -->
  <link rel="shortcut icon" href="Assets/Images/logo-f.png">
  <!-- jquery.vectormap css -->
  <link href="Assets/libs/admin-resources/jquery.vectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />

  <!-- DataTables -->
  <link href="Assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css" />

  <!-- Responsive datatable examples -->
  <link href="Assets/libs/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css" rel="stylesheet" type="text/css" />

  <!-- Bootstrap Css -->
  <link href="Assets/Css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
  <!-- Icons Css -->
  <link href="Assets/Css/icons.min.css" rel="stylesheet" type="text/css" />
  <!-- App Css-->
  <link href="Assets/Css/app.min.css" class="app-style" rel="stylesheet" type="text/css" />
  <link href="Assets/Css/custom.css" class="app-style" rel="stylesheet" type="text/css" />

</head>
<body data-topbar="light">

<div id="layout-wrapper">

  <header id="page-topbar">
    <div class="navbar-header">

      <div class="d-flex">
        <!-- LOGO -->
        <div class="navbar-brand-box">

          <a href="#" class="logo logo-dark">
                                <span class="logo-sm">
                                    <img src="Assets/Images/logo-f.png" alt="logo-sm" height="35">
                                </span>
                                <span class="logo-lg">
                                    <img src="Assets/Images/logo2-f.png" alt="logo-dark" height="40">
                                </span>
          </a>
        </div>

        <!-- App Search-->
        <form class="app-search d-none d-md-block">
          <div class="position-relative">
            <input type="text" class="form-control" placeholder="Search...">
            <span class="ri-search-line"></span>
          </div>
        </form>

        <div class="dropdown dropdown-mega d-none d-lg-block ms-2">
          <button type="button" class="btn header-item waves-effect fw-bold" data-bs-toggle="dropdown" aria-haspopup="false" aria-expanded="false">
            Choose Category
            <i class="mdi mdi-chevron-down"></i>
          </button>
          <div class="dropdown-menu dropdown-megamenu bg-light">

            <div class="row">
              <div class="col-sm">

                <div class="row">
                  <%
                    List<Category> categories = (List<Category>) request.getAttribute("categories");
                    for (Category category : categories) {
                  %>
                  <div class="col-md-2 d-flex justify-content-center">
                    <a class="fw-bold text-reset" href="#">Concerts & Festivals</a>
                  </div>
                  <%
                    }
                  %>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="d-flex align-items-center">
        <div class="dropdown d-inline-block d-md-none ms-2 me-2">
          <button type="button" class="btn header-item noti-icon waves-effect" id="page-header-search-dropdown"
                  data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="ri-search-line"></i>
          </button>
          <div class="dropdown-menu dropdown-menu-lg dropdown-menu-end p-0"
               aria-labelledby="page-header-search-dropdown">

            <form class="p-3">
              <div class="mb-3 m-0">
                <div class="input-group">
                  <input type="text" class="form-control" placeholder="Search ...">
                  <div class="input-group-append">
                    <button class="btn btn-warning text-white" type="submit"><i class="ri-search-line"></i></button>
                  </div>
                </div>
              </div>
            </form>
          </div>
        </div>

        <div class="d-none d-sm-inline-block me-5">
          <a class="fw-bold text-reset" href="#">Create Events</a>
        </div>

        <div class="d-none d-sm-inline-block me-4">
          <a class="fw-bold text-reset" href="#">Login</a>
        </div>

        <div class="d-none d-sm-inline-block me-5">
          <button type="button" class="btn btn-outline-secondary px-4 py-0 waves-effect waves-light fw-bold font-size-14">Signup</button>
        </div>

        <div class="dropdown dropdown d-inline-block d-sm-none">
          <button type="button" class="btn header-item noti-icon waves-effect"
                  data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class=" ri-settings-4-fill"></i>
          </button>
          <div class="dropdown-menu dropdown-menu-end">
            <!-- item-->
            <a class="dropdown-item fs-5 text-secondary" href="#"><i class="ri-map-pin-user-fill align-middle me-1 fs-2 text-secondary"></i> Login</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item fs-5 text-secondary" href="#"><i class="ri-account-pin-box-line align-middle me-1 fs-2 text-secondary"></i> Signup</a>
          </div>
        </div>
      </div>
    </div>
  </header>

  <div class="main">
    <div class="row m-0 p-0 pb-5">
      <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
        <ol class="carousel-indicators">
          <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"></li>
          <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"></li>
          <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"></li>
          <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3"></li>
          <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4"></li>
          <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="5"></li>
          <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="6"></li>
          <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="7"></li>
          <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="_"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
          <div class="carousel-item active">
            <img class="d-block" src="Assets/Images/affiche1.png" alt="First slide">
          </div>
          <div class="carousel-item">
            <img class="d-block" src="Assets/Images/affiche2.jpg" alt="Second slide">
          </div>
          <div class="carousel-item">
            <img class="d-block" src="Assets/Images/affiche3.jpg" alt="Third slide">
          </div>
          <div class="carousel-item">
            <img class="d-block" src="Assets/Images/affiche4.png" alt="Fourth slide">
          </div>
          <div class="carousel-item">
            <img class="d-block" src="Assets/Images/affiche5.jpg" alt="Fifth slide">
          </div>
          <div class="carousel-item">
            <img class="d-block" src="Assets/Images/affiche6.png" alt="Sixth slide">
          </div>
          <div class="carousel-item">
            <img class="d-block" src="Assets/Images/affiche7.png" alt="seventh slide">
          </div>
          <div class="carousel-item">
            <img class="d-block" src="Assets/Images/affiche8.jpg" alt="Eighth slide">
          </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
    </div>

    <div class="row m-0 p-5">
      <%
        int i=0;
        List<Event> events = (List<Event>) request.getAttribute("events");
        for (Event event : events) {
      %>
      <div class="col-md-6 col-xl-3">
        <div class="card">
          <img class="card-img-top img-fluid" src="Assets/Images/affiche<%=i%>.png" alt="Card image cap">
          <div class="card-body">
            <div class="mb-3">
              <span class="badge badge-card rounded me-2"><%=event.getCategory().getName()%></span>
              <span class="rounded bg-light fw-bold">Created By <%=event.getUser().getUsername()%></span>
            </div>
            <h4 class="card-title fs-4 fw-bold"><%=event.getName()%></h4>
            <div class="mb-1">
              <span class="text-muted localisation"><i class=" fas fa-map-marker-alt align-middle font-size-14 text-warning me-2"></i><%=event.getLieu()%></span>
            </div>
            <div class="mb-4">
                                    <span class="text-dark countdown" id="countdown"><i class="ri-time-line align-middle font-size-16 text-warning me-1"></i>
                                        <div class="time">
                                            <span id="days" class="fs-5 fw-bold">00</span>
                                            <span class="text-muted me-2">j</span>
                                        </div>
                                        <div class="time">
                                            <span id="hours" class="fs-5 fw-bold">00</span>
                                            <span class="text-muted me-2">h</span>
                                        </div>
                                        <div class="time">
                                            <span id="minutes" class="fs-5 fw-bold">00</span>
                                            <span class="text-muted me-2">m</span>
                                        </div>
                                        <div class="time">
                                            <span id="seconds" class="fs-5 fw-bold">00</span>
                                            <span class="text-muted">s</span>
                                        </div>
                                    </span>
            </div>
            <div class="d-flex justify-content-between align-items-center">
              <div class="">
                <span class="text-muted">A partir de :</span>
                <div class="d-flex">
                  <h1 class="fw-bold text-warning m-0"><%=event.getBillets().get(0).getPrix()%></h1>
                  <span class="fw-bold text-warning">MAD</span>
                </div>
              </div>
              <div class="">
                <a href="#" class="btn btn-warning text-white fw-bold waves-effect waves-light">J'achéte</a>
              </div>
            </div>
          </div>
        </div>
      </div>
      <%
        }
      %>
    </div>
  </div>
</div>




<!-- JAVASCRIPT -->
<script src="Assets/libs/jquery/jquery.min.js"></script>
<script src="Assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="Assets/libs/metismenu/metisMenu.min.js"></script>
<script src="Assets/libs/simplebar/simplebar.min.js"></script>
<script src="Assets/libs/node-waves/waves.min.js"></script>


<!-- apexcharts -->
<script src="Assets/libs/apexcharts/apexcharts.min.js"></script>

<!-- jquery.vectormap map -->
<script src="Assets/libs/admin-resources/jquery.vectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="Assets/libs/admin-resources/jquery.vectormap/maps/jquery-jvectormap-us-merc-en.js"></script>

<!-- Required datatable js -->
<script src="Assets/libs/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="Assets/libs/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>

<!-- Responsive examples -->
<script src="Assets/libs/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
<script src="Assets/libs/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js"></script>

<script src="Assets/js/pages/dashboard.init.js"></script>

<!-- App js -->
<script src="Assets/js/app.js"></script>
<script src="Assets/js/main.js"></script>

</body>
</html>