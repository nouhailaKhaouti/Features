<%@ page import="com.example.eventmanagementapp.Domain.Event" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
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
        <link href="Assets/Css/app.min.css"  rel="stylesheet" type="text/css" />
        <link href="Assets/Css/custom.css"  rel="stylesheet" type="text/css" />
        
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
                                            <c:forEach items="${categories}" var="category">
                                                <div class="col-md-2 d-flex justify-content-center">
                                                    <a class="fw-bold text-reset" href="#">${category.name}</a>
                                                </div>
                                            </c:forEach>
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

                        <c:choose>
                            <c:when test="${empty sessionScope.email}">
                                <div class="d-none d-sm-inline-block me-4">
                                    <a class="fw-bold text-reset" href="${pageContext.request.contextPath}/Auth">Login</a>
                                </div>
                                <div class="d-none d-sm-inline-block me-5">
                                    <a href="${pageContext.request.contextPath}/Auth" class="btn btn-outline-secondary px-4 py-0 waves-effect waves-light fw-bold font-size-14">Signup</a>
                                </div>
                            </c:when>
                            <c:otherwise>
                                Welcome Nouhaila
                                <div class="d-none d-sm-inline-block mx-3">
                                    <form action="${pageContext.request.contextPath}/logOut" method="post">
                                        <button type="submit" class="btn btn-outline-secondary px-4 py-0 waves-effect waves-light fw-bold font-size-14">LogOut</button>
                                    </form>
                                </div>
                            </c:otherwise>
                        </c:choose>

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

            <c:if test="${not empty sessionScope.message}">
                <c:set var="code" value="${sessionScope.code}" />
                <c:set var="isCode200" value="${code == 200}" />
                <div class="<c:choose><c:when test='${isCode200}'>alert_success</c:when><c:otherwise>alert_danger</c:otherwise></c:choose>">
                    <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
                        ${sessionScope.message}
                </div>
            </c:if>

            <div class="main">
                <div class="page-content">
                    <div class="container-fluid">
                        <c:set var="event" value="${event}"/>
                        <div class="d-flex justify-content-center mt-4 pt-5">
                            <h1 class="fw-bold">${event.name}</h1>
                        </div>
                        <div class="row p-5">
                            <div class="col-lg-8">
                                <div class="card">
                                    <img class="card-img img-fluid" src="Assets/Images/affiche1.png" alt="Card image">
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="card color-body text-center">
                                    <div class="card-header text-white color-title">
                                        Informations
                                    </div>
                                    <div class="card-body">
                                        <div class="mt-4">
                                            <span class="text-white fw-bold fs-4">${event.date}</span>
                                        </div>
                                        <div class="">
                                            <span class="text-white fw-bold">${event.lieu}</span>
                                        </div>
                                        <div class="mb-3">
                                            <span class="text-white fw-bold">Ouverture des porte à ${event.hour}</span>
                                        </div>
                                        <form action="/Reservation" method="post">
                                            <div class="mb-3">
                                                <div class="col-lg-12">
                                                    <select class="form-select" aria-label="Default select example">
                                                        <c:forEach items="${billets}" var="billet">
                                                            <option value="${billet.name}">${billet.name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="d-grid col-7">
                                                    <button type="submit" class="btn btn-warning fw-bold text-white">Acheter maintenant</button>
                                                </div>
                                            </div>
                                        </form>
                                        <div class="mb-3">
                                            <span class="text-white">Vite! Achetez rapidement vos tickets</span>
                                        </div>
                                        <div class="card-footer color-title text-white">
                                        Ticket Disponible : <span class="fw-bold text-dark">200 tickets</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row px-5 mb-5">
                        <div class="col-lg-8">
                            <div class="descrip">
                                <h3 class="d-flex align-items-center mb-3"><span>Description</span></h3>
                                <div>
                                    <p>${event.description}
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <header class="section-header py-4 text-center">
                        <img src="Assets/Images/logo2-f.png" alt="">
                        <h2>Les Commentaire</h2>
                    </header>

                    <div class="row mb-5 px-5">

                    </div>
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