<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Meta Tags -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.8.1/flowbite.min.css"  rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.8.1/flowbite.min.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        lightGray: '#F6F6F6',
                        lighttext:'#9ca3af',
                        cl1:'#A038D6',
                        cl2:'#FDB752',
                        hover2:'#FFCE87',
                        hover1:'#DEA0FF'
                    }
                }
            }
        }
    </script>
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

<body>
<!-- component -->
<nav class=" bg-white w-full flex relative justify-between items-center mx-auto px-8 h-20 mb-4 p-4 bg-white shadow-md">
    <!-- logo -->
    <div class="flex items-center max-w-full">
        <!-- Logo -->
        <a class="_o6689fn" href="/">
            <div class="hidden md:block">
                <svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation"
                     focusable="false"
                     style="display: block; fill: none; height: 30px; width: 30px; stroke: currentcolor; stroke-width: 3; overflow: visible;">
                    <g fill="none" fill-rule="nonzero">
                        <path d="m2 16h28"></path>
                        <path d="m2 24h28"></path>
                        <path d="m2 8h28"></path>
                    </g>
                </svg>
                <div class="text-sm font-bold">MENU</div>
            </div>
            <div class="block md:hidden">
                <svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation"
                     focusable="false"
                     style="display: block; fill: none; height: 25px; width: 25px; stroke: currentcolor; stroke-width: 3; overflow: visible;">
                    <g fill="none" fill-rule="nonzero">
                        <path d="m2 16h28"></path>
                        <path d="m2 24h28"></path>
                        <path d="m2 8h28"></path>
                    </g>
                </svg>
            </div>
        </a>

        <!-- Search Bar -->
        <input class="border-none ms-10 bg-lightGray shadow-inner flex items-center flex-grow-0 flex-shrink pl-2 relative w-60 border rounded-full py-1 hidden sm:block "
               type="text" name="search" placeholder="Start your search">
        <div class="flex items-center justify-center relative h-8 w-8 rounded-full px-1 mx-2">
            <!-- Font Awesome Search Icon -->
            <svg width="400px" height="400px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M15.7955 15.8111L21 21M18 10.5C18 14.6421 14.6421 18 10.5 18C6.35786 18 3 14.6421 3 10.5C3 6.35786 6.35786 3 10.5 3C14.6421 3 18 6.35786 18 10.5Z"
                      stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
            </svg>
        </div>
    </div>
    <!-- end search bar -->
    <div class="me-10">
        <img src="Assets/Images/logo.png" alt="" width="120" height="80">
    </div>
    <!-- login -->
    <div class="flex-initial">
        <div class="flex justify-end items-center relative">
            <div class="block">
                <div class="inline relative text-base ">
                    <%if(session==null){%>
                    <button type="button"
                            class="w-20 h-8 mx-2 bg-cl1 text-white px-5 relative border rounded-md hover:bg-hover1 font-bold text-sm">
                        LogIn
                    </button>
                    <button type="button"
                            class="w-20 h-8 mx-2 bg-cl2 text-white px-5 relative border rounded-md hover:bg-hover2 font-bold text-sm">
                        SignIn
                    </button>
                    <%}else{%>
                    Welcome Nouhaila
                    <%}%>
                </div>
            </div>
        </div>
    </div>
    <!-- end login -->
</nav>

    <%if(session.getAttribute("message") != null) {
                Object codeAttribute= session.getAttribute("code");
                boolean isCode200 = codeAttribute != null && codeAttribute.toString().equals("200");
    %>
<div class=<%= isCode200 ? "alert_success" : "alert_danger" %>>
    <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
    <%= session.getAttribute("message") %>
</div>
<% } %>