<%-- 
    Document   : doublesign
    Created on : Mar 16, 2023, 11:51:43 PM
    Author     : Hades
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/doublesign.css" />
        <title>Login Page</title>
    </head>
    <body>
        <div class="container" id="container">
            <div class="form-container sign-in-container">
                <form action="login" method="post">
                    <h1>Sign in</h1>
                    <div class="alert">
                        <span>${mess}</span>
                    </div>
                    <input name="username" type="text" placeholder="Username" value="${username}" required maxlength="50" autofocus pattern="([^\s][A-z0-9]+)" title="Not include spaces"/>
                    <input name="password" type="password" placeholder="Password" value="${password}" required/>
                    <div class="form-check">
                        <input name="remember" class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                        <label class="form-check-label" for="flexCheckDefault">
                            Remember me
                        </label>
                    </div>
                    <a href="forgot.jsp" class="forgot">Forgotten password?</a>
                    <div class="border-sig"></div>
                    <button>Sign In</button>
                    <small class="or">Or</small>
                    <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid&redirect_uri=http://localhost:8080/Eplant/LoginGoogleHandler&response_type=code&client_id=661124631424-mr922jpvrfvig2k4imtgb9mlptae5ghn.apps.googleusercontent.com&approval_prompt=force"><div class="google-btn">
                            <div class="google-icon-wrapper">
                                <img class="google-icon" src="https://upload.wikimedia.org/wikipedia/commons/5/53/Google_%22G%22_Logo.svg"/>
                            </div>
                            <p class="btn-text"><b>Sign in with google</b></p>
                        </div></a>
                </form>
            </div>
            <div class="overlay-container">
                <div class="overlay">
                    <div class="overlay-panel overlay-right">
                        <h1>Hello, Friend!</h1>
                        <p>Enter your personal details and start journey with us</p>
                        <a href="register">
                            <button class="ghost" id="signUp">Sign Up</button>                            
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
