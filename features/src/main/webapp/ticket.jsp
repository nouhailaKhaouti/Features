<%@ page import="com.example.eventmanagementapp.Domain.Event" %>
<%@ page import="com.example.eventmanagementapp.Domain.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.eventmanagementapp.Domain.Billet" %>
<%@ page import="com.example.eventmanagementapp.Domain.Commentaire" %>
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
        <style>
            @import url('https://fonts.googleapis.com/css?family=Oswald');

            * {
                margin: 0;
                padding: 0;
                border: 0;
                box-sizing: border-box
            }


            .fl-left {
                float: left
            }

            .fl-right {
                float: right
            }

            h1 {
                text-transform: uppercase;
                font-weight: 900;
                border-left: 10px solid #fec500;
                padding-left: 10px;
                margin-bottom: 30px
            }

            .row {
                overflow: hidden
            }

            .card1 {
                display: table-row;
                width: 49%;
                background-color: #fff;
                color: #989898;
                margin-bottom: 10px;
                font-family: 'Oswald', sans-serif;
                text-transform: uppercase;
                border-radius: 4px;
                position: relative
            }

            .card1+.card1 {
                margin-left: 2%
            }

            .date {
                display: table-cell;
                width: 25%;
                position: relative;
                text-align: center;
                border-right: 2px dashed #dadde6
            }

            .date:before,
            .date:after {
                content: "";
                display: block;
                width: 30px;
                height: 30px;
                background-color: #DADDE6;
                position: absolute;
                top: -15px;
                right: -15px;
                z-index: 1;
                border-radius: 50%
            }

            .date:after {
                top: auto;
                bottom: -15px
            }

            .date time {
                display: block;
                position: absolute;
                top: 50%;
                left: 50%;
                -webkit-transform: translate(-50%, -50%);
                -ms-transform: translate(-50%, -50%);
                transform: translate(-50%, -50%)
            }

            .date time span {
                display: block
            }

            .date time span:first-child {
                color: #2b2b2b;
                font-weight: 600;
                font-size: 250%
            }

            .date time span:last-child {
                text-transform: uppercase;
                font-weight: 600;
                margin-top: -10px
            }

            .card-cont {
                display: table-cell;
                width: 75%;
                font-size: 85%;
                padding: 10px 10px 30px 50px
            }

            .card-cont h3 {
                color: #3C3C3C;
                font-size: 130%
            }

            .row:last-child .card1:last-of-type .card-cont h3 {
                text-decoration: line-through
            }

            .card-cont>div {
                display: table-row
            }

            .card-cont .even-date i,
            .card-cont .even-info i,
            .card-cont .even-date time,
            .card-cont .even-info p {
                display: table-cell
            }

            .card-cont .even-date i,
            .card-cont .even-info i {
                padding: 5% 5% 0 0
            }

            .card-cont .even-info p {
                padding: 30px 50px 0 0
            }

            .card-cont .even-date time span {
                display: block
            }

            .card-cont a {
                display: block;
                text-decoration: none;
                width: 80px;
                height: 30px;
                background-color: #D8DDE0;
                color: #fff;
                text-align: center;
                line-height: 30px;
                border-radius: 2px;
                position: absolute;
                right: 10px;
                bottom: 10px
            }

            .row:last-child .card1:first-child .card-cont a {
                background-color: #037FDD
            }

            .row:last-child .card1:last-child .card-cont a {
                background-color: #F8504C
            }

            @media screen and (max-width: 860px) {
                .card1 {
                    display: block;
                    float: none;
                    width: 100%;
                    margin-bottom: 10px
                }
                .card1+.card1 {
                    margin-left: 0
                }
                .card-cont .even-date,
                .card-cont .even-info {
                    font-size: 75%
                }
            }
            hr {
                margin-top: 20px;
                margin-bottom: 20px;
                border: 0;
                border-top: 1px solid #FFFFFF;
            }
            a {
                color: #82b440;
                text-decoration: none;
            }
            .blog-comment::before,
            .blog-comment::after,
            .blog-comment-form::before,
            .blog-comment-form::after{
                content: "";
                display: table;
                clear: both;
            }

            .blog-comment{
                padding-left: 15%;
                padding-right: 15%;
            }

            .blog-comment ul{
                list-style-type: none;
                padding: 0;
            }

            .blog-comment img{
                opacity: 1;
                filter: Alpha(opacity=100);
                -webkit-border-radius: 4px;
                -moz-border-radius: 4px;
                -o-border-radius: 4px;
                border-radius: 4px;
            }

            .blog-comment img.avatar {
                position: relative;
                float: left;
                margin-left: 0;
                margin-top: 0;
                width: 65px;
                height: 65px;
            }

            .blog-comment .post-comments{
                border: 1px solid #eee;
                margin-bottom: 20px;
                margin-left: 85px;
                margin-right: 0px;
                padding: 10px 20px;
                position: relative;
                -webkit-border-radius: 4px;
                -moz-border-radius: 4px;
                -o-border-radius: 4px;
                border-radius: 4px;
                background: #fff;
                color: #6b6e80;
                position: relative;
            }

            .blog-comment .meta {
                font-size: 13px;
                color: #aaaaaa;
                padding-bottom: 8px;
                margin-bottom: 10px !important;
                border-bottom: 1px solid #eee;
            }

            .blog-comment ul.comments ul{
                list-style-type: none;
                padding: 0;
                margin-left: 85px;
            }

            .blog-comment-form{
                padding-left: 15%;
                padding-right: 15%;
                padding-top: 40px;
            }

            .blog-comment h3,
            .blog-comment-form h3{
                margin-bottom: 40px;
                font-size: 26px;
                line-height: 30px;
                font-weight: 800;
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
                                                <a class="fw-bold text-reset" href="#"><%= category.getName() %></a>
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

            <div class="main">
                <div class="page-content">
                    <section class="container-fluid">
                        <%
                            Object eventAttribute = request.getAttribute("event");
                            if (eventAttribute != null) {
                                Event event = (Event) eventAttribute;
                        %>
                        <div class="d-flex justify-content-center mt-4 pt-5">
                            <h1 class="fw-bold"><%= event.getName() %></h1>
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
                                            <span class="text-white fw-bold fs-4"><%= event.getDate()%>  </span>
                                        </div>
                                        <div class="">
                                            <span class="text-white fw-bold"><%= event.getLieu() %></span>
                                        </div>
                                        <div class="mb-3">
                                            <span class="text-white fw-bold">Ouverture des portes à <%= event.getHour() %></span>
                                        </div>
                                        <form action="${pageContext.request.contextPath}/Reserve" method="post">
                                            <div class="mb-3">
                                                <div class="col-lg-12">
                                                    <select name="billet" class="form-select" aria-label="Default select example">
                                                        <%
                                                            List<Billet> billets = (List<Billet>) request.getAttribute("billets");
                                                            if (billets != null && !billets.isEmpty()) {
                                                                for (Billet billet : billets) {
                                                                    if(billet.getQuantiteDisponible()>0){
                                                        %>
                                                        <option value="<%= billet.getId() %>"><%= billet.getBilletType() %>  <span class="fw-bold text-danger"><%=billet.getPrix()%> MAD </span></option>
                                                        <%
                                                                    }
                                                                }
                                                            }else{%>
                                                                <option disabled>No ticket found</option>
                                                                <%}
                                                        %>
                                                    </select>
                                                </div>
                                            </div>
                                            <input type="hidden" name="">
                                            <div class="row mb-3">
                                                <div class="d-grid col-7">
                                                    <button type="submit" class="btn btn-warning fw-bold text-white"  <%if(request.getSession().getAttribute("email")==null){%> disabled <%}%>>Acheter maintenant</button>
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
                        <div class="row px-5 mb-5">
                            <div class="col-lg-8">
                                <div class="descrip">
                                    <h3 class="d-flex align-items-center mb-3"><span>Description</span></h3>
                                    <div>
                                        <p><%=event.getDescription()%>.
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>

                    <div class="row mb-5 px-5">
                        <section class="container">
                            <div class="d-flex ">
                            <h1 class="mx-4">Tickets</h1>
                                <%
                                    if(event.getUser().getEmail().equals(request.getSession().getAttribute("email"))){
                                %>
                            <button data-bs-toggle="modal" data-bs-target="#exampleModal" class="btn btn-warning m-2 mb-5" type="button" onclick="createBillet1(`<%=event.getId()%>`)" >
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-plus" viewBox="0 0 16 16">
                                    <path d="M8 0a1 1 0 0 1 1 1v6h6a1 1 0 0 1 0 2H9v6a1 1 0 0 1-2 0V9H1a1 1 0 0 1 0-2h6V1a1 1 0 0 1 1-1z"></path>
                                </svg>
                                Add
                            </button>
                                <%
                                    }
                                %>
                            </div>
                            <div class="row">
                                <%
                                    List<Billet> billetList=(List<Billet>) request.getAttribute("billets");
                                    for(Billet billet:billetList){
                                %>
                                <article class="card1 fl-left">
                                    <section class="date">
                                        <time datetime="23th feb">
                                            <span>23</span><span>feb</span>
                                            <span class="mt-2 text-danger"><%=billet.getPrix()%> MAD</span>
                                        </time>
                                    </section>
                                    <section class="card-cont">
                                        <small><%=billet.getEvent().getUser().getUsername()%></small>
                                        <h3><%=billet.getBilletType()%></h3>
                                        <h4> Quantity : <%=billet.getQuantiteDisponible()%></h4>
                                        <div class="even-date">
                                            <i class="fa fa-calendar"></i>
                                            <time>
                                                <span><%=event.getDate()%></span>
                                                <span><%=event.getHour()%></span>
                                            </time>
                                        </div>
                                        <div class="even-info">
                                            <i class="fa fa-map-marker"></i>
                                            <p>
                                                <%=event.getLieu()%>
                                            </p>
                                        </div>
                                        <%
                                            if(event.getUser().getEmail().equals(request.getSession().getAttribute("email"))){
                                        %>
                                        <div class="d-flex justify-content-end">
                                        <a href="${pageContext.request.contextPath}/ticket?id=<%=billet.getId()%>">Delete</a>
                                        <button data-bs-toggle="modal" data-bs-target="#exampleModal" class="btn btn-warning mx-3 mt-3" onclick="editBillet(`<%=billet.getId()%>`,`<%=billet.getPrix()%>`,`<%=billet.getQuantiteDisponible()%>`,`<%=billet.getBilletType()%>`)" >Edit</button>
                                        </div>
                                        <%
                                            }
                                        %>
                                    </section>
                                </article>

                                <%--<div class="card">
                                    <div class="card-header ">
                                        Ticket
                                    </div>
                                    <div class="card-body">
                                        <h5 class="card-title"><%=billet.getBilletType()%></h5>
                                        <p class="card-text badge badge-card "><%=billet.getPrix()%></p>
                                        <button data-bs-toggle="modal" data-bs-target="#exampleModal" class="btn btn-warning mx-3" onclick="editBillet(`<%=billet.getId()%>`,`<%=billet.getPrix()%>`,`<%=billet.getQuantiteDisponible()%>`,`<%=billet.getBilletType()%>`)">Edit</button>
                                        <a href="${pageContext.request.contextPath}/ticket?id=<%=billet.getId()%>" class="btn btn-danger">Delete</a>
                                    </div>
                                </div>--%>
                                <%
                                    }
                                %>
                            </div>
                        </section>
                    </div>

                        <section class="container bootstrap snippets bootdey">
                            <section class="row mb-5 px-5">
                                <section class="container col-md-12">
                                    <div class="blog-comment">
                                        <h1 class="mx-4">Comments Section</h1>
                                        <hr/>
                                        <div class="row">
                                            <% if(request.getSession().getAttribute("email")!=null){%>
                                            <form method="post" action="${pageContext.request.contextPath}/Comment" class="card-footer py-3 border-0" style="background-color: #f8f9fa;">
                                                <div class="d-flex flex-start w-100">
                                                    <img class="rounded-circle shadow-1-strong me-3"
                                                         src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(19).webp" alt="avatar" width="40"
                                                         height="40" />
                                                    <div class="form-outline w-100">
                                                        <textarea name="description" class="form-control" id="textAreaExample" rows="4"
                                                                  style="background: #fff;"></textarea>
                                                        <label class="form-label" for="textAreaExample">Message</label>
                                                    </div>
                                                    <input type="hidden" name="action" value="create">
                                                    <input type="hidden" name="event" value="<%=event.getId()%>">
                                                </div>
                                                <div class="float-end mt-2 pt-1">
                                                    <button type="submit" class="btn btn-warning btn-sm">Post comment</button>
                                                </div>
                                            </form>
                                            <%
                                                }
                                                List<Commentaire> comments=(List<Commentaire>) request.getAttribute("comments");
                                                for(Commentaire comment:comments){
                                            %>
                                        <ul class="comments mt-2 ">
                                            <li class="clearfix">
                                                <img src="https://bootdey.com/img/Content/user_1.jpg" class="avatar" alt>
                                                <div class="post-comments">
                                                    <p class="meta"><%=comment.getDateDeCreation()%> <a href="#"><%=comment.getUser().getUsername()%></a> says :
                                                        <% if (comment.getUser().getEmail().equals(request.getSession().getAttribute("email"))){
                                                        %>
                                                        <i class="pull-left">
                                                            <small>
                                                                <a href="${pageContext.request.contextPath}/Comment?id=<%=comment.getId()%>">
                                                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0,0,256,256" width="20px" height="20px"><g fill="#fdb752" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-size="none" style="mix-blend-mode: normal"><g transform="scale(5.33333,5.33333)"><path d="M20.5,4c-0.49034,-0.00628 -0.95279,0.22749 -1.23848,0.62606c-0.28569,0.39856 -0.35854,0.9116 -0.19511,1.37394h-4.42578c-1.844,0 -3.55417,0.91622 -4.57617,2.44922l-2.36719,3.55078h-0.19727c-0.54095,-0.00765 -1.04412,0.27656 -1.31683,0.74381c-0.27271,0.46725 -0.27271,1.04514 0,1.51238c0.27271,0.46725 0.77588,0.75146 1.31683,0.74381h33c0.54095,0.00765 1.04412,-0.27656 1.31683,-0.74381c0.27271,-0.46725 0.27271,-1.04514 0,-1.51238c-0.27271,-0.46725 -0.77588,-0.75146 -1.31683,-0.74381h-0.19727l-2.36719,-3.55078c-1.022,-1.533 -2.73317,-2.44922 -4.57617,-2.44922h-4.42578c0.16343,-0.46234 0.09058,-0.97538 -0.19511,-1.37394c-0.28569,-0.39856 -0.74814,-0.63234 -1.23848,-0.62606zM8.97266,18l2.15234,20.08594c0.3,2.802 2.65075,4.91406 5.46875,4.91406h14.8125c2.817,0 5.16775,-2.11206 5.46875,-4.91406l2.15234,-20.08594z"></path></g></g>
                                                                </svg>
                                                                </a>
                                                                <button data-bs-toggle="modal" data-bs-target="#commentModal"  class="btn bg-transparent" onclick="editComment(`<%=comment.getId()%>`,`<%=comment.getText()%>`)">
                                                                <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="20px" height="20px" viewBox="0,0,256,256"
                                                                     style="fill:#000000;">
                                                                    <defs><linearGradient x1="46.807" y1="9.849" x2="46.807" y2="24.215" gradientUnits="userSpaceOnUse" id="color-1_56304_gr1"><stop offset="0" stop-color="#a038d6"></stop><stop offset="1" stop-color="#e6abff"></stop></linearGradient><linearGradient x1="32" y1="8.084" x2="32" y2="55.83" gradientUnits="userSpaceOnUse" id="color-2_56304_gr2"><stop offset="0" stop-color="#1a6dff"></stop><stop offset="1" stop-color="#c822ff"></stop></linearGradient></defs><g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none"  font-size="none"  style="mix-blend-mode: normal"><g transform="scale(4,4)"><path d="M49.482,24.392l-9.874,-9.874l4.232,-4.232c0.39,-0.39 1.021,-0.39 1.411,0l8.464,8.464c0.39,0.39 0.39,1.021 0,1.411z" fill="url(#color-1_56304_gr1)"></path><path d="M50.697,25.999l4.428,-4.428c1.167,-1.167 1.167,-3.065 0,-4.232l-8.464,-8.464c-1.167,-1.167 -3.065,-1.167 -4.232,0l-4.428,4.428c-0.664,-0.175 -1.4,-0.011 -1.92,0.509l-1.411,1.411c-0.52,0.52 -0.684,1.256 -0.509,1.92l-22.963,22.963l-0.508,0.508l-0.2,0.2l-2.373,9.967c-0.343,1.442 0.078,2.928 1.126,3.976c1.048,1.048 2.534,1.469 3.976,1.125l9.967,-2.373l0.2,-0.2l0.508,-0.508l22.964,-22.964c0.664,0.175 1.4,0.011 1.92,-0.509l1.411,-1.411c0.519,-0.518 0.683,-1.254 0.508,-1.918zM47.367,27.92l-11.286,-11.286l1.411,-1.411l11.285,11.285zM23.46,50.414c-0.28,-1.063 -0.682,-2.077 -1.198,-3.034l20.872,-20.872l2.116,2.116zM14.916,53.428c-0.12,-1.074 -0.58,-2.115 -1.405,-2.939c-0.825,-0.825 -1.865,-1.285 -2.939,-1.405l0.698,-2.931c1.649,0.266 3.173,1.036 4.357,2.22c1.184,1.184 1.954,2.709 2.22,4.357zM17.038,46.962c-1.447,-1.447 -3.301,-2.396 -5.306,-2.75l0.463,-1.943c2.382,0.441 4.533,1.562 6.254,3.282c1.721,1.72 2.841,3.872 3.282,6.254l-1.943,0.463c-0.355,-2.005 -1.303,-3.859 -2.75,-5.306zM19.859,44.141c-0.477,-0.477 -0.987,-0.907 -1.517,-1.304l20.561,-20.561l2.821,2.821l-20.561,20.561c-0.397,-0.53 -0.827,-1.04 -1.304,-1.517zM16.62,41.738c-0.957,-0.516 -1.971,-0.918 -3.034,-1.198l21.79,-21.79l2.116,2.116zM43.84,10.286c0.389,-0.389 1.022,-0.389 1.411,0l8.464,8.464c0.389,0.389 0.389,1.022 0,1.411l-4.232,4.232l-9.874,-9.874z" fill="url(#color-2_56304_gr2)"></path></g></g>
                                                                </svg>
                                                                </button>
                                                            </small>
                                                        </i>
                                                        <%
                                                        }%>
                                                    </p>
                                                    <p>
                                                        <%=comment.getText()%>
                                                    </p>
                                                </div>
                                            </li>
                                        </ul>
                                            <%
                                                }
                                            %>
                                        </div>
                                    </div>
                                </section>
                            </section>
                        </section>
                </div>
            </div>
        </div>

        <%
            }
        %>

            <%--Edit Billet Modal--%>
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Update ticket</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form action="${pageContext.request.contextPath}/ticket" method="post">
                                <div class="mx-1 mb-3">
                                    <label for="quantity" class="form-label">Number of ticket available</label>
                                    <input type="number" id="quantity" name="quantity" class="form-control" placeholder="Enter quantity">
                                </div>
                                <div class="mx-1 mb-3">
                                    <label for="type" class="form-label">Ticket Type</label>
                                    <select id="type" name="type" class="form-select">
                                        <option value="STANDARD">Standard</option>
                                        <option value="VIP">VIP</option>
                                    </select>
                                </div>
                                <div class="mx-1 mb-3">
                                    <label for="price" class="form-label">Price</label>
                                    <input type="number" id="price" name="price" class="form-control" placeholder="Enter price">
                                </div>
                                <div id="hidden">
                                </div>
                                <input type="hidden" id="action" name="action" value="update">
                                <input type="hidden" name="event" id="event">
                                <button id="billet-crud" class="btn btn-warning mx-3">Edit</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>


        <%--Comment Modal--%>
        <div class="modal fade" id="commentModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id=commentModalLabel">Update ticket</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="${pageContext.request.contextPath}/Comment" method="post">
                            <div class="mx-1 mb-3">
                                <label for="description" class="form-label">Number of ticket available</label>
                                <textarea id="description" name="description" class="form-control" ></textarea>
                            </div>
                            <div id="hiddenComment">
                            </div>
                            <input type="hidden" name="action" value="update">
                            <button id="comment-crud" class="btn btn-warning mx-3">Edit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>



        <!-- JAVASCRIPT -->
        <script src="Assets/Javascript/BilletScript.js"></script>
        <script src="Assets/Javascript/CommentScript.js"></script>
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