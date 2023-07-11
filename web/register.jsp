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
                    <input name="user" type="text" placeholder="User" value="${user}"  required maxlength="50" autofocus pattern="([^\s][A-z0-9]+)" title="Not include spaces"/>
                    <input name="full_name" type="text" placeholder="Your name" value="${full_name}" required maxlength="100"/>
                    <input name="phone" type="tel" placeholder="Phone Number" value="${phone}" required maxlength="10" pattern="[0-9]{10}" title="Must constrain at 10 numbers" onkeyup="this.value = this.value.replace(/[^0-9]/g, '');"/>
                    <input name="email" type="email" placeholder="Email" value="${email}" required maxlength="50" pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$"/>
                    <input name="address" type="text" placeholder="Address" value="${address}"required />
                    <input name="birthday" type="text" placeholder="BirthDay" value="${birthday}" onfocus="(this.type='date')" onblur="(this.type='text')" required />
                    <div style="width: 100%; display: flex; margin: 10px 0; align-items: center; background-color: #eee;padding: 7px 15px;border-radius: 10px;">
                        <label style="opacity: 0.85; font-size: 13px;">Gender </label>
                        <select class="form-select" name="sex" id="sex" style="width: 100%; margin-left: 10px; padding: 5px 0; border: 1px solid #dee2e6; border-radius: 3px; background-color: #eee; border: none;">
                            <option value="Others" selected>Others</option>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                        </select>
                    </div>

                    <!--                    <input list="sex" name="sex" id="sex">
                                        <datalist id="sex">
                                            <option value="Others" selected>Others</option>
                                            <option value="Male">Male</option>
                                            <option value="Female">Female</option>
                                        </datalist>-->
                                        <!--<input name="sex" type="text" placeholder="Sex" value="${sex}"required />-->
                    <input name="password" type="password" placeholder="Password" required maxlength="50" pattern="(?=.*\d)(?=.*[a-z]).{8,}" title="Must contain at least one number and at least 8 or more characters"/>
                    <input name="re-password" type="password" placeholder="Confirm Password" required maxlength="50" pattern="(?=.*\d)(?=.*[a-z]).{8,}"/>
                    <button>Sign Up</button>
                </form>
            </div>
        </div>
    </body>
</html>
