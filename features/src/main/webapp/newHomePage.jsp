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
                    <div class="navbar-brand-box">
                        <a href="newHomePage.jsp" class="logo logo-dark">
                            <span class="logo-sm">
                                <img src="./Assets/Images/logo-f.png" alt="logo-sm" height="35">
                            </span>
                            <span class="logo-lg">
                                <img src="./Assets/Images/logo2-f.png" alt="logo-dark" height="40">
                            </span>
                        </a>
                    </div>

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
                        <!-- Add other indicators here -->
                    </ol>
                    <div class="carousel-inner" role="listbox">
                        <div class="carousel-item active">
                            <img class="d-block" src="./Assets/Images/affiche1.png" alt="First slide">
                        </div>
                        <!-- Add other carousel items here -->
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-bs-slide="next">
                        <span class="carousel-control-next-icon" ariahidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>

            <c:if test="${not empty sessionScope.message}">
                <c:set var="code" value="${sessionScope.code}" />
                <c:set var="isCode200" value="${code == 200}" />
                <div class="<c:choose><c:when test='${isCode200}'>alert_success</c:when><c:otherwise>alert_danger</c:otherwise></c:choose>">
                    <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
                        ${sessionScope.message}
                </div>
            </c:if>

            <div class="row m-0 p-5">
                <c:forEach items="${events}" var="event"  varStatus="status">
                    <div class="col-md-6 col-xl-3">
                        <div class="card">
                            <img class="card-img-top img-fluid" src="Assets/Images/affiche${(status.index)+1}.png" alt="Card image cap">
                            <div class="card-body">
                                <div class="mb-3 d-block">
                                    <div class="badge badge-card rounded me-2">${event.category.name}</div>
                                    <div class="mt-2 badge badge-card rounded bg-light fw-bold">Created By ${event.user.username}</div>
                                </div>
                                <h4 class="card-title fs-4 fw-bold">${event.name}</h4>
                                <div class="mb-1">
                                    <span class="text-muted localisation">
                                        <i class="fas fa-map-marker-alt align-middle font-size-14 text-warning me-2"></i>${event.lieu}
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
                                            <h1 class="fw-bold text-warning m-0">${event.billets[0].prix}</h1>
                                            <span class="fw-bold text-warning">MAD</span>
                                        </div>
                                    </div>
                                    <div class="">
                                        <a href="${pageContext.request.contextPath}/Display?${event.id}" class="btn btn-warning text-white fw-bold waves-effect waves-light">J'achéte</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
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






