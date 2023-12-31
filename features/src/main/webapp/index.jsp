
<!DOCTYPE html>
<html lang="en">
<head>

    <!-- Meta Tags -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Title & Icon -->
    <title>CultureDev.to</title>
    <link rel="icon" href="./Assets/Images/logo.png">

    <!-- My Style -->
    <link rel="stylesheet" href="Sass/mains.css">

    <!-- Fontawesome link -->
    <script src="https://kit.fontawesome.com/f57667c685.js" crossorigin="anonymous"></script>

</head>
<body>
<main>
    <div class="box">

        <% if(session.getAttribute("message") != null) {
        Object codeAttribute= session.getAttribute("code");
        boolean isCode200 = codeAttribute != null && codeAttribute.toString().equals("200");
    %>
        <div class=<%= isCode200 ? "alert_danger" : "alert_success" %>>
            <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
            <%= session.getAttribute("message") %>
        </div>
        <% } %>
        <div class="interior-box">
            <div class="forms">
                <!-- Login Form -->
                <form action="${pageContext.request.contextPath}/logIn" class="login" method="post">
                    <!-- Logo Form-->
                    <div class="logo">
                        <img src="./Assets/Images/logo-f.png" alt="CultureDevLogo">
                    </div>
                    <!-- Head Form-->
                    <div class="head">
                        <h2>CONNECTEZ-VOUS</h2>
                        <h6>Vous n'avez pas encore de compte ?</h6>
                        <a href="#" class="toggle">Inscrivez-vous</a>
                    </div>
                    <!-- Content Form -->
                    <div class="form-content">
                        <!-- Email Input -->
                        <div class="inputs">
                            <input class="input-field" name="email" type="email">
                            <label>Email</label>
                        </div>
                        <!-- Password Input -->
                        <div class="inputs">
                            <input class="input-field" name="password" type="password">
                            <label>Mot de Passe</label>
                        </div>
                        <!-- Login Button -->
                        <input type="submit" class="login-btn" name="login" value="Connectez-vous" >
                        <!-- Forgot Password -->
                        <p class="text">
                            Vous avez oublié votre mot de passe?
                            <a href="#">Récuperez-le</a>
                        </p>
                    </div>
                </form>
                <!-- Sign-up Form -->
                <form action="${pageContext.request.contextPath}/create_Account"  method="post" class="signup">
                    <!-- Logo Form-->
                    <div class="logo">
                        <img src="./Assets/Images/logo-f.png" alt="CultureDevLogo">
                    </div>
                    <!-- Head Form-->
                    <div class="head">
                        <h2>REJOINEZ-NOUS</h2>
                        <h6>Vous avez déjà un compte ?</h6>
                        <a href="#" class="toggle">Connectez-vous</a>
                    </div>
                    <!-- Content Form -->
                    <div class="form-content">
                        <!-- Username Input -->
                        <div class="inputs">
                            <input class="input-field" name="username" type="text">
                            <label>Nom d'utilisateur</label>
                        </div>
                        <!-- Email Input -->
                        <div class="inputs">
                            <input class="input-field" name="email" type="email">
                            <label>Email</label>
                        </div>
                        <!-- Password Input -->
                        <div class="inputs">
                            <input class="input-field" name="password" type="password">
                            <label>Mot de Passe</label>
                        </div>
                        <!-- Password Confirmation Input -->
                        <div class="inputs">
                            <input class="input-field" name="cpassword" type="password">
                            <label>Confirmez votre mot de Passe</label>
                        </div>
                        <!-- Login Button -->
                        <input type="submit" class="login-btn" name="login" value="Inscrivez-vous" >
                    </div>
                </form>
            </div>
            <div class="carousel">
                <!-- Images Carousel -->
                <div class="images">
                    <img src="./Assets/Images/carousel2.png" class="imageC img-1 show" alt="">
                    <img src="./Assets/Images/carousel1.png" class="imageC img-2" alt="">
                    <img src="./Assets/Images/carousel3.png" class="imageC img-3" alt="">
                </div>
                <!-- Bottom Carousel -->
                <div class="text-slider">
                    <!-- Texte Carousel -->
                    <div class="textSl">
                        <div class="text-group">
                            <h2>Bienvenu</h2>
                            <h2>Fière de notre culture</h2>
                            <h2>Nos monuments Notre Fièrté</h2>
                        </div>
                    </div>
                    <!-- Bullets Carousel -->
                    <div class="bullets">
                        <span class="active" data-value="1"></span>
                        <span data-value="2"></span>
                        <span data-value="3"></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
</body>

<!-- JavaScript -->
<script src="Assets/Javascript/script.js"></script>

</html>
