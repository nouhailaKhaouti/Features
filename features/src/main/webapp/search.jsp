<%@ page import="com.example.eventmanagementapp.Domain.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.eventmanagementapp.Domain.Event" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<jsp:useBean id="categories" scope="request" type="java.util.List"/>
<jsp:useBean id="events" scope="request" type="java.util.List"/>--%>
<%--<jsp:include page="nav.jsp"/>--%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Features</title>
  <!-- App favicon -->
  <link rel="shortcut icon" href="Assets/Images/logo-f.png">
  <!-- jquery.vector-map css -->
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
  <style>
    .alert_danger {
      padding: 20px;
      background-color: #f44336;
      color: white;
    }

    .alert_success {
      padding: 20px;
      background-color: #a2e374;
      color: white;
    }
    .closebtn {
      margin-left: 15px;
      color: white;
      font-weight: bold;
      float: right;
      font-size: 22px;
      line-height: 20px;
      cursor: pointer;
      transition: 0.3s;
    }

    .closebtn:hover {
      color: black;
    }
  </style>
</head>
<body data-topbar="light">

<div id="layout-wrapper">
  <header id="page-topbar">
    <div class="navbar-header">

      <div class="d-flex">
        <!-- LOGO -->
        <div class="navbar-brand-box">

          <a href="${pageContext.request.contextPath}/home" class="logo logo-dark">
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

                  <% List<Category> categories=(List<Category>) request.getAttribute("categories");
                    for (Category category : categories) { %>
                  <div class="col-md-2 d-flex justify-content-center">
                    <a class="fw-bold text-reset" href="${pageContext.request.contextPath}/category?id=<%=category.getId()%>"><%= category.getName() %></a>
                  </div>
                  <% } %>
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

            <form class="p-3" action="${pageContext.request.contextPath}/search" method="post">
              <div class="mb-3 m-0">
                <div class="input-group">
                  <input type="text" name="search" class="form-control" placeholder="Search ...">
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

        <%
          if (session.getAttribute("email") == null) {
        %>
        <div class="d-none d-sm-inline-block me-4">
          <a class="fw-bold text-reset" href="<%= request.getContextPath() %>/Auth">Login</a>
        </div>
        <div class="d-none d-sm-inline-block me-5">
          <a href="<%= request.getContextPath() %>/Auth" class="btn btn-outline-secondary px-4 py-0 waves-effect waves-light fw-bold font-size-14">Signup</a>
        </div>
        <%
        } else {
        %>
        <a href="${pageContext.request.contextPath}/Profile?email=<%=session.getAttribute("email")%>" class="btn btn-outline-secondary px-4 py-0 waves-effect waves-light fw-bold font-size-14">
          Welcome Nouhaila
        </a>
        <div class="d-none d-sm-inline-block mx-3">
          <form action="<%= request.getContextPath() %>/logOut" method="post">
            <button type="submit" class="btn btn-outline-secondary px-4 py-0 waves-effect waves-light fw-bold font-size-14">LogOut</button>
          </form>
        </div>
        <%
          }
        %>
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

    <%
      if (session.getAttribute("message") != null) {
        Object codeAttribute = session.getAttribute("code");
        boolean isCode200 = codeAttribute != null && codeAttribute.toString().equals("200");
    %>
    <div class="<%= isCode200 ? "alert_success" : "alert_danger" %>">
      <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
      <%= session.getAttribute("message") %>
    </div>
    <%
      }
    %>

    <div class="row m-0 p-5">
      <%
        List<Event> events = (List<Event>) request.getAttribute("events");
        if (events != null && !events.isEmpty()) {
          int index = 1;
          for (Event event : events) {
      %>
      <div class="col-md-6 col-xl-3">
        <div class="card">
          <img class="card-img-top img-fluid" src="Assets/Images/carousel<%= index %>.png" alt="Card image cap">
          <div class="card-body">
            <div class="mb-3 d-block">
              <div class="badge badge-card rounded me-2"><%= event.getCategory().getName() %></div>
              <div class="mt-2 badge badge-card rounded bg-light fw-bold">Created By <%= event.getUser().getUsername() %></div>
            </div>
            <h4 class="card-title fs-4 fw-bold"><%= event.getName() %></h4>
            <div class="mb-1">
                            <span class="text-muted localisation">
                                <i class="fas fa-map-marker-alt align-middle font-size-14 text-warning me-2"></i><%= event.getLieu() %>
                            </span>
            </div>
            <div class="mb-4">
                            <span class="text-dark countdown" id="countdown">
                                <i class="ri-time-line align-middle font-size-16 text-warning me-1"></i>
                                <div class="time">
                                    <span id="days" class="fs-5 fw-bold">00</span>
                                    <span class="text-muted me-2">j</span>
                                </div>
                              <!-- Add more time elements here -->
                            </span>
            </div>
            <div class="d-flex justify-content-between align-items-center">
              <div class="">
                <span class="text-muted">A partir de :</span>
                <div class="d-flex">
                  <h1 class="fw-bold text-warning m-0"><%= 100 %></h1>
                  <span class="fw-bold text-warning">MAD</span>
                </div>
              </div>
              <div class="">
                <a href="<%= request.getContextPath() %>/Display?id=<%=event.getId()%>" class="btn btn-warning text-white fw-bold waves-effect waves-light">J'achéte</a>
              </div>
            </div>
          </div>
        </div>
      </div>
      <%
            index++;
          }
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







