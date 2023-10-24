<%@ page import="com.example.eventmanagementapp.Domain.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.eventmanagementapp.Domain.Event" %>
<%@ page import="com.example.eventmanagementapp.Domain.Reservation" %>
<%@ page import="com.example.eventmanagementapp.Domain.UserE" %>
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
    <link href="Assets/libs/datatables.net-buttons-bs4/css/buttons.bootstrap4.min.css" rel="stylesheet" type="text/css" />
    <link href="Assets/libs/datatables.net-select-bs4/css/select.bootstrap4.min.css" rel="stylesheet" type="text/css" />

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
                Welcome Nouhaila
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


    <%  Object  userAttribute = request.getAttribute("user");

        UserE user = (UserE) userAttribute;
    %>
    <div class="main">
        <div class="page-content">
            <div class="container-fluid">
                <div class="row px-5 pt-3">
                    <div class="col-12">
                        <div class="card">
                            <div class="affiche-profile">
                                <img src="Assets/Images/banner.jpg" class="profile-banner" alt="">
                            </div>
                            <div class="profile-infos d-flex align-items-end flex-sm-row text-sm-start text-center">
                                <div class="mt-2 mx-sm-0 mx-auto">
                                    <img
                                            src="https://bootdey.com/img/Content/user_1.jpg"
                                            alt="user image"
                                            class="d-block h-auto ms-0 ms-sm-4 profile-img"
                                    />
                                </div>
                                <div class="flex-grow-1 mt-3 mt-sm-5 me-5">
                                    <div class="d-flex align-items-md-end align-items-sm-start align-items-center justify-content-md-between justify-content-start mx-5 flex-md-row flex-column gap-4">
                                        <div class="user-profile-info">
                                            <h2><%=user.getUsername()%></h2>
                                            <ul class="list-inline mb-0 d-flex align-items-center flex-wrap justify-content-sm-start justify-content-center gap-2">
                                                <li class="list-inline-item me-5 fs-6"><i class=" ri-shield-user-line me-2"></i>Organisateur</li>
                                                <li class="list-inline-item me-5 fs-6"><i class=" ri-at-line me-2"></i><%=user.getEmail()%></li>
                                                <li class="list-inline-item me-5 fs-6"><i class=" ri-calendar-line me-2"></i> Rejoindre le 22-09-2022 </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="flex-grow-1 mt-3 mt-sm-5 ms-5">
                                    <div class="d-flex">
                                        <button data-bs-toggle="modal"
                                                data-bs-target="#passwordModal" class="btn btn-warning btn-sm fw-bold text-white fs-6 me-3 ms-5" type="submit">
                                            Changer mot de passe
                                        </button>
                                        <button data-bs-toggle="modal"
                                                data-bs-target="#profileModal" class="btn btn-warning btn-sm fw-bold text-white fs-6" type="submit">
                                            Modifier Données
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row px-5">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h1 class="card-title mb-4 fs-4">My Reservation</h1>
                                <table id="datatable-buttons" class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                    <thead>
                                    <tr>
                                        <th>Event</th>
                                        <th>Reserve Date</th>
                                        <th>Event Date</th>
                                        <th>Ticket Type</th>
                                        <th>Actions</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    <%
                                        List<Reservation> reservations=(List<Reservation>) request.getAttribute("reservations");
                                        for(Reservation reservation:reservations){
                                    %>
                                    <tr>
                                        <td><%=reservation.getBillet().getEvent().getName()%></td>
                                        <td><%=reservation.getDateReservation()%></td>
                                        <td><%=reservation.getBillet().getEvent().getDate()%></td>
                                        <td><%=reservation.getBillet().getBilletType()%></td>
                                        <td class="text-center w-25">
                                            <a  href="${pageContext.request.contextPath}/Reserve?id=<%=reservation.getId()%>"
                                                class="btn btn-outline-danger btn-sm mb-2"
                                                data-bs-toggle="tooltip"
                                                data-bs-placement="top"
                                                data-bs-title="Détails">
                                                Cancel
                                            </a>
                                        </td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                    </tbody>

                                </table>
                            </div>
                        </div>
                    </div> <!-- end col -->
                </div>

                <div class="row px-5">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h1 class="card-title mb-4 fs-4">Your Events
                                    <button type="button" onclick="createEvent1()" class="pull-right mx-5 btn btn-warning" data-bs-toggle="modal" data-bs-target="#defaultModal">
                                        <svg width="20" height="20" xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-plus" viewBox="0 0 16 16">
                                            <path d="M8 1a.5.5 0 0 1 .5.5V7h5a.5.5 0 0 1 0 1H8V14.5a.5.5 0 0 1-1 0V8H2a.5.5 0 0 1 0-1h5V1.5a.5.5 0 0 1 .5-.5z"></path>
                                        </svg>
                                        <span class="ms-2">Add</span>
                                    </button>
                                </h1>
                                <table id="datatable-buttons" class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                    <thead>
                                    <tr>
                                        <th>Evenement</th>
                                        <th>Date</th>
                                        <th>location</th>
                                        <th>Actions</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    <%
                                        List<Event> events=(List<Event>) request.getAttribute("events");
                                        for(Event event:events){
                                    %>
                                    <tr>
                                        <td><%=event.getName()%></td>
                                        <td><%=event.getDate()%></td>
                                        <td><%=event.getLieu()%></td>
                                        <td class="text-center w-25">
                                            <a  href="${pageContext.request.contextPath}/Display?id=<%=event.getId()%>"
                                                class="btn btn-outline-primary btn-sm mb-2 fw-bold"
                                                data-bs-toggle="tooltip"
                                                data-bs-placement="top"
                                                data-bs-title="Détails">
                                                <svg fill="#000000" height="20px" width="20px" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                                                     viewBox="0 0 57.945 57.945" xml:space="preserve">
                                                <g>
                                                    <path d="M57.655,27.873c-7.613-7.674-17.758-11.9-28.568-11.9c-0.026,0-0.051,0.002-0.077,0.002c-0.013,0-0.025-0.002-0.037-0.002
                                                        c-0.036,0-0.071,0.005-0.106,0.005C18.14,16.035,8.08,20.251,0.52,27.873l-0.23,0.232c-0.389,0.392-0.386,1.025,0.006,1.414
                                                        c0.195,0.193,0.45,0.29,0.704,0.29c0.257,0,0.515-0.099,0.71-0.296l0.23-0.232c5.245-5.287,11.758-8.841,18.856-10.402
                                                        c-2.939,2.385-4.823,6.022-4.823,10.094c0,7.168,5.832,13,13,13s13-5.832,13-13c0-4.116-1.928-7.784-4.922-10.167
                                                        c7.226,1.522,13.858,5.107,19.184,10.476c0.389,0.393,1.023,0.395,1.414,0.006C58.041,28.898,58.044,28.265,57.655,27.873z
                                                         M39.973,28.972c0,6.065-4.935,11-11,11s-11-4.935-11-11c0-6.029,4.878-10.937,10.893-10.995c0.048,0,0.096-0.003,0.144-0.003
                                                        C35.058,17.995,39.973,22.92,39.973,28.972z"></path>
                                                    <path d="M36,27.972c-0.552,0-1,0.448-1,1c0,3.309-2.691,6-6,6s-6-2.691-6-6s2.691-6,6-6c0.552,0,1-0.448,1-1s-0.448-1-1-1
                                                        c-4.411,0-8,3.589-8,8s3.589,8,8,8s8-3.589,8-8C37,28.42,36.552,27.972,36,27.972z"></path>
                                                </g>
                                            </svg>
                                            </a>
                                            <button onclick="editEvent(`<%=event.getId()%>`,`<%=event.getName()%>`,`<%=event.getDescription()%>`,`<%=event.getDate()%>`,`<%=event.getLieu()%>`,`<%=event.getHour()%>`,`<%=event.getCategory().getId()%>`)"
                                                    class="btn btn-outline-secondary btn-sm mb-2"
                                                    data-bs-toggle="modal"
                                                    data-bs-target="#defaultModal"
                                                    data-bs-placement="top"
                                                    data-bs-title="Détails">
                                                <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="20px" height="20px" viewBox="0,0,256,256"
                                                     style="fill:#000000;">
                                                    <defs><linearGradient x1="46.807" y1="9.849" x2="46.807" y2="24.215" gradientUnits="userSpaceOnUse" id="color-1_56304_gr1"><stop offset="0" stop-color="#a038d6"></stop><stop offset="1" stop-color="#e6abff"></stop></linearGradient><linearGradient x1="32" y1="8.084" x2="32" y2="55.83" gradientUnits="userSpaceOnUse" id="color-2_56304_gr2"><stop offset="0" stop-color="#1a6dff"></stop><stop offset="1" stop-color="#c822ff"></stop></linearGradient></defs><g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none"  font-size="none"  style="mix-blend-mode: normal"><g transform="scale(4,4)"><path d="M49.482,24.392l-9.874,-9.874l4.232,-4.232c0.39,-0.39 1.021,-0.39 1.411,0l8.464,8.464c0.39,0.39 0.39,1.021 0,1.411z" fill="url(#color-1_56304_gr1)"></path><path d="M50.697,25.999l4.428,-4.428c1.167,-1.167 1.167,-3.065 0,-4.232l-8.464,-8.464c-1.167,-1.167 -3.065,-1.167 -4.232,0l-4.428,4.428c-0.664,-0.175 -1.4,-0.011 -1.92,0.509l-1.411,1.411c-0.52,0.52 -0.684,1.256 -0.509,1.92l-22.963,22.963l-0.508,0.508l-0.2,0.2l-2.373,9.967c-0.343,1.442 0.078,2.928 1.126,3.976c1.048,1.048 2.534,1.469 3.976,1.125l9.967,-2.373l0.2,-0.2l0.508,-0.508l22.964,-22.964c0.664,0.175 1.4,0.011 1.92,-0.509l1.411,-1.411c0.519,-0.518 0.683,-1.254 0.508,-1.918zM47.367,27.92l-11.286,-11.286l1.411,-1.411l11.285,11.285zM23.46,50.414c-0.28,-1.063 -0.682,-2.077 -1.198,-3.034l20.872,-20.872l2.116,2.116zM14.916,53.428c-0.12,-1.074 -0.58,-2.115 -1.405,-2.939c-0.825,-0.825 -1.865,-1.285 -2.939,-1.405l0.698,-2.931c1.649,0.266 3.173,1.036 4.357,2.22c1.184,1.184 1.954,2.709 2.22,4.357zM17.038,46.962c-1.447,-1.447 -3.301,-2.396 -5.306,-2.75l0.463,-1.943c2.382,0.441 4.533,1.562 6.254,3.282c1.721,1.72 2.841,3.872 3.282,6.254l-1.943,0.463c-0.355,-2.005 -1.303,-3.859 -2.75,-5.306zM19.859,44.141c-0.477,-0.477 -0.987,-0.907 -1.517,-1.304l20.561,-20.561l2.821,2.821l-20.561,20.561c-0.397,-0.53 -0.827,-1.04 -1.304,-1.517zM16.62,41.738c-0.957,-0.516 -1.971,-0.918 -3.034,-1.198l21.79,-21.79l2.116,2.116zM43.84,10.286c0.389,-0.389 1.022,-0.389 1.411,0l8.464,8.464c0.389,0.389 0.389,1.022 0,1.411l-4.232,4.232l-9.874,-9.874z" fill="url(#color-2_56304_gr2)"></path></g></g>
                                                </svg>
                                            </button>
                                            <button onclick="deleteEvent(`<%=event.getId()%>`)"
                                                    class="btn btn-outline-danger btn-sm mb-2"
                                                    data-bs-toggle="tooltip"
                                                    data-bs-placement="top"
                                                    data-bs-title="Détails">
                                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0,0,256,256" width="20px" height="20px"><g fill="#fdb752" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-size="none" style="mix-blend-mode: normal"><g transform="scale(5.33333,5.33333)"><path d="M20.5,4c-0.49034,-0.00628 -0.95279,0.22749 -1.23848,0.62606c-0.28569,0.39856 -0.35854,0.9116 -0.19511,1.37394h-4.42578c-1.844,0 -3.55417,0.91622 -4.57617,2.44922l-2.36719,3.55078h-0.19727c-0.54095,-0.00765 -1.04412,0.27656 -1.31683,0.74381c-0.27271,0.46725 -0.27271,1.04514 0,1.51238c0.27271,0.46725 0.77588,0.75146 1.31683,0.74381h33c0.54095,0.00765 1.04412,-0.27656 1.31683,-0.74381c0.27271,-0.46725 0.27271,-1.04514 0,-1.51238c-0.27271,-0.46725 -0.77588,-0.75146 -1.31683,-0.74381h-0.19727l-2.36719,-3.55078c-1.022,-1.533 -2.73317,-2.44922 -4.57617,-2.44922h-4.42578c0.16343,-0.46234 0.09058,-0.97538 -0.19511,-1.37394c-0.28569,-0.39856 -0.74814,-0.63234 -1.23848,-0.62606zM8.97266,18l2.15234,20.08594c0.3,2.802 2.65075,4.91406 5.46875,4.91406h14.8125c2.817,0 5.16775,-2.11206 5.46875,-4.91406l2.15234,-20.08594z"></path></g></g>
                                                </svg>
                                            </button>
                                        </td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div> <!-- end col -->
                </div>
            </div>
        </div>
    </div>


    <%--EventModal--%>
    <div class="modal fade" id="defaultModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <!-- Modal header -->
                <div class="modal-header">
                    <h3 class="modal-title">Terms of Service</h3>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <!-- Modal body -->
                <div class="modal-body">
                    <form action="event" method="post" id="event">
                        <div class="mb-3">
                            <label for="name" class="form-label">The name of the Event</label>
                            <input type="text" id="name" name="name" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label for="category" class="form-label">Select Category</label>
                            <select id="category" name="category" class="form-select">
                                <%
                                    for (Category category : categories) {
                                %>
                                <option value="<%=category.getId()%>"> <%=category.getName()%> </option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="lieu" class="form-label">The Event location</label>
                            <input type="text" id="lieu" name="lieu" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label for="date" class="form-label">The Event date</label>
                            <input type="date" id="date" name="date" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label for="hour" class="form-label">Hour</label>
                            <input type="time" id="hour" name="hour" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label for="description" class="form-label">The Event date</label>
                            <textarea id="description" name="description" class="form-control" required></textarea>
                        </div>
                        <input type="hidden" name="email" value="<%=session.getAttribute("email")%>">
                        <div id="hidden">
                        </div>
                        <input type="hidden" name="action" id="action" value="create">
                        <div id="mini-form" class="mb-3">
                            <h3 class="font-weight-bold">Create Tickets</h3>
                            <div id="show_item" class="mini-form">
                                <div class="mb-3 border border-2 rounded p-3">
                                    <div class="mb-3">
                                        <label for="quantity" class="form-label">Number of ticket available</label>
                                        <input type="number" id="quantity" name="quantity[]" class="form-control">
                                    </div>
                                    <div class="mb-3">
                                        <label for="type" class="form-label">Ticket Type</label>
                                        <select id="type" name="type[]" class="form-select">
                                            <option value="STANDARD">Standard</option>
                                            <option value="VIP">VIP</option>
                                        </select>
                                    </div>
                                    <div class="mb-3">
                                        <label for="price" class="form-label">Price</label>
                                        <input type="number" id="price" name="price[]" class="form-control">
                                    </div>
                                    <button type="button" class="btn bg-transparent add_item_btn">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-plus" viewBox="0 0 16 16">
                                            <path d="M8 1a.5.5 0 0 1 .5.5V7h5a.5.5 0 0 1 0 1H8V14.5a.5.5 0 0 1-1 0V8H2a.5.5 0 0 1 0-1h5V1.5a.5.5 0 0 1 .5-.5z"></path>
                                        </svg>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div id="event_crud" class="flex items-center p-6 space-x-2 border-t border-gray-200 rounded-b dark:border-gray-600">
                            <button data-modal-hide="defaultModal" type="submit" class="btn btn-warning">Create</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>


    <%--profilemodal--%>
    <div class="modal fade" id="profileModal" tabindex="-1" aria-labelledby="profileModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="profileModalLabel">Update Profile</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="${pageContext.request.contextPath}/EditProfile" method="post">
                        <!-- 2 column grid layout with text inputs for the first and last names -->
                        <div class="row mb-4">
                            <div class="col">
                                <div class="form-outline">
                                    <input type="text" name="userName" id="userName" value="<%=user.getUsername()%>" class="form-control" />
                                    <label class="form-label" for="userName">First name</label>
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-outline">
                                    <input type="text" name="firstName" id="firstName" value="<%=user.getFirstName()%>" class="form-control" />
                                    <label class="form-label" for="firstName">First name</label>
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-outline">
                                    <input type="text" name="lastName" id="lastname" value="<%=user.getLastName()%>" class="form-control" />
                                    <label class="form-label" for="lastname">Last name</label>
                                </div>
                            </div>
                        </div>

                        <!-- Email input -->
                        <div class="form-outline mb-4">
                            <input type="email" name="email" id="email"  value="<%=user.getEmail()%>" class="form-control" />
                            <label class="form-label" for="email">Email address</label>
                        </div>
                        <input type="hidden" name="action" value="profile">
                        <!-- Submit button -->
                        <button type="submit" class="btn btn-warning btn-block mb-4">Edit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>



    <%--PasswordModal--%>

    <div class="modal fade" id="passwordModal" tabindex="-1" aria-labelledby="passwordModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="passwordModalLabel">Update password</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="${pageContext.request.contextPath}/EditProfile" method="post">

                        <!-- Password input -->
                        <div class="form-outline mb-4">
                            <input type="password" name="password" id="form2Example2" class="form-control" />
                            <label class="form-label" for="form2Example2">Old Password</label>
                        </div>

                        <!-- Password input -->
                        <div class="form-outline mb-4">
                            <input type="password" name="confirmPassword" id="confirm" class="form-control" />
                            <label class="form-label" for="confirm">New Password</label>
                        </div>
                        <input type="hidden" name="action" value="password">

                        <!-- Submit button -->
                        <button type="submit" class="btn btn-warning btn-block mb-4"> Save change</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- JAVASCRIPT -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="Assets/Javascript/EventScript.js"></script>
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

<!-- Required datatable js -->
<script src="Assets/libs/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="Assets/libs/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
<!-- Buttons examples -->
<script src="Assets/libs/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
<script src="Assets/libs/datatables.net-buttons-bs4/js/buttons.bootstrap4.min.js"></script>
<script src="Assets/libs/jszip/jszip.min.js"></script>
<script src="Assets/libs/pdfmake/build/pdfmake.min.js"></script>
<script src="Assets/libs/pdfmake/build/vfs_fonts.js"></script>
<script src="Assets/libs/datatables.net-buttons/js/buttons.html5.min.js"></script>
<script src="Assets/libs/datatables.net-buttons/js/buttons.print.min.js"></script>
<script src="Assets/libs/datatables.net-buttons/js/buttons.colVis.min.js"></script>

<script src="Assets/libs/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
<script src="Assets/libs/datatables.net-select/js/dataTables.select.min.js"></script>

<!-- Responsive examples -->
<script src="Assets/libs/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
<script src="Assets/libs/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js"></script>

<script src="Assets/js/pages/dashboard.init.js"></script>

<!-- App js -->
<script src="Assets/js/app.js"></script>
<script src="Assets/js/main.js"></script>

</body>
</html>