<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="login_signup.aspx.cs" Inherits="web_app_assignment.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Login / Sign Up</title>

    <%-- Stylesheet --%>
    <link href="style/login_signup.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="login_signupBody">
        <ul class="nav nav-pills nav-fill" id="myTab" role="tablist">
            <li class="nav-item" role="presentation">
                <a class="nav-link badge-info active_selected active" onclick="showTabContentsLogin()" id="login-tab" data-toggle="tab" href="#login" role="tab" aria-controls="login" aria-selected="true">Login</a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link badge-info" onclick="showTabContentsSignUp()" id="signup-tab" data-toggle="tab" href="#signup" role="tab" aria-controls="signup" aria-selected="false">Sign Up</a>
            </li>
        </ul>
        <div class="tab-content" id="myTabContent">
            <div class="sign_loginLogo">
                <img class="sign_loginLogoImage" src="images/logo/logo.png" />
            </div>
            <div class="tab-pane fade show active" id="login" role="tabpanel" aria-labelledby="login-tab">
                <div class="inputsFormSign_Login" id="inputsFormSign_Logins">
                    <form>
                        <div class="form-group">
                            <input type="email" class="form-control" id="sign_login_emailUser" aria-describedby="emailHelp" placeholder="Email OR User ID">
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" id="sign_login_password" placeholder="Password">
                        </div>
                        <div class="form-group form-check" id="inputsFormSign_LoginFormCheck">
                            <div class="inputsFormSign_LoginFormCheckbox">
                                <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                <label class="form-check-label" id="inputsFormSign_LoginFormCheckboxRememberMe" for="exampleCheck1">Remember Me</label>
                            </div>
                            <a href="#" class="inputsFormSign_LoginFormCheckForgotPassword"><p>Forgot Your Password ?</p></a>
                        </div>
                        <div class="inputsFormSign_LoginFooter">
                            <button type="submit" class="btn btn-info" id="inputsFormSign_LoginButton">Log In</button>
                        </div>
                    </form>
                </div>
                <div class="dividerSignUp">
                    <div class="dividerSignUplines">
                        <p class="dividerSignUplinesContent">OR</p>
                    </div>
                </div>
                
                <div>
                    <%-- Gmail and Facebook Button Comes here --%>
                </div>

                <p class="inputsFormSign_SignUpFree">
                    New User ? 
                    <a class="SignUpFree" id="signup_tabatag" onclick="showSignUpTab()" data-toggle="tab" href="#signup" role="tab" aria-controls="signup" aria-selected="false">Sign Up FREE Now</a>
                </p>
            </div>

            <div class="tab-pane fade" id="signup" role="tabpanel" aria-labelledby="signup-tab">
                <div class="inputsFormSign_SignUp" id="inputsFormSign_SignUp">
                    <p>LAlalala</p>
                    
                </div>
                <p class="inputsFormSign_LoginFree">
                    Already a Member ? 
                    <a class="LoginFree" id="login_tabatag" onclick="showLoginTab()" data-toggle="tab" href="#login" role="tab" aria-controls="login" aria-selected="true">Log In Now</a>
                </p>
            </div>
        </div>
    </div>

    <script>
        var signUpTab = document.getElementById("signup-tab");
        var loginTab = document.getElementById("login-tab");
        var signUpatag = document.getElementById("signup_tabatag");
        var loginatag = document.getElementById("login_tabatag");

        function showSignUpTab() {
            $(signUpTab).addClass("active_selected");
            $(loginTab).removeClass("active_selected");

            $(signUpTab).addClass("active");
            $(loginTab).removeClass("active");

            $(loginatag).addClass("active");
            $(signUpatag).removeClass("active");
        };

        function showLoginTab() {
            $(signUpTab).removeClass("active_selected");
            $(loginTab).addClass("active_selected");

            $(signUpTab).removeClass("active");
            $(loginTab).addClass("active");

            $(signUpatag).addClass("active");
            $(loginatag).removeClass("active");
        };

        function showTabContentsLogin() {
            $(signUpTab).removeClass("active_selected");
            $(loginTab).addClass("active_selected");

            $(loginTab).removeClass("active");
            $(signUpTab).addClass("active");
        }

        function showTabContentsSignUp() {
            $(signUpTab).addClass("active_selected");
            $(loginTab).removeClass("active_selected");

            $(loginTab).addClass("active");
            $(signUpTab).removeClass("active");
        }
    </script>
</asp:Content>
