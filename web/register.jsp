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
            <div class="laulau">
                <div>
                    <h1>Welcome Back!</h1>
                    <p>To keep connected with us please login with your personal info</p>
                    <a href="login">
                        <button class="ghost" id="signIn">Sign In</button>
                    </a>
                </div>
            </div>
            <div class="form-container sign-up-container">
                <form action="register" method="post">
                    <h1>Create Account</h1>
                    <div class="alert">
                        <span>${mess2}</span>
                    </div>

                    <input name="user" type="text" placeholder="User" value="${user}"  required />
                    <input name="full_name" type="text" placeholder="Your name" value="${full_name}"required />
                    <input name="phone" type="tel" placeholder="Phone Number" value="${phone}"required />

                    <input name="email" type="email" placeholder="Email" value="${email}"required />
                    <input name="address" type="text" placeholder="Address" value="${address}"required />
                    <input name="birthday" type="text" placeholder="BirthDay" value="${birthday}"required />
                    <input name="sex" type="text" placeholder="Sex" value="${sex}"required />

                    <input name="password" type="password" placeholder="Password" required />
                    <input name="re-password" type="password" placeholder="Confirm Password" required/>
                    <button>Sign Up</button>
                </form>
            </div>
        </div>
    </body>
</html>
