﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="login_signup.aspx.cs" Inherits="web_app_assignment.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Login / Sign Up</title>

    <%-- Stylesheet --%>
    <link href="style/login_signup.css" rel="stylesheet" type="text/css"/>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
    <div class="login_signupBody">
        <div class="login_signUpBackgroundImage">
            <img src="images/Signup_Login/works-1.png" class="login_signUpBackgroundImagePics" alt="background"/>
        </div>
        <div class="Login_signUpForms">
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
                    <img class="sign_loginLogoImage" src="images/logo/logo.png" alt="logo"/>
                </div>

                <%-- User Login Session --%>
                <div class="tab-pane fade show active" id="login" role="tabpanel" aria-labelledby="login-tab">
                    <div class="inputsFormSign_Login" id="inputsFormSign_Logins">
                        <form>
                            <div class="form-group">
                                    <asp:DropDownList ID="Role" runat="server" CssClass="form-control bg-info text-white">
                                        <asp:ListItem Selected="True" Value="0"> Select Your Role </asp:ListItem>
                                        <asp:ListItem Value="job_seeker"> Job Seeker </asp:ListItem>
                                        <asp:ListItem Value="recruiter"> Recruiter </asp:ListItem>
                                    </asp:DropDownList>
                            </div>
                            <div class="form-group">
                               <%-- <input type="email" class="form-control" id="sign_login_emailUser" aria-describedby="emailHelp" placeholder="Email OR User ID">--%>
                                <asp:TextBox ID="sign_login_emailUser" ClientIDMode="Static" runat="server" CssClass="form-control" TextMode="Email" aria-describedby="emailHelp" Placeholder="Email OR User ID"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="sign_login_password" ClientIDMode="Static" runat="server" CssClass="form-control" TextMode="password" Placeholder="Password"></asp:TextBox>
                                <%--<input type="password" class="form-control" id="sign_login_password" placeholder="Password">--%>
                                <img src="images/Signup_Login/eye.png" alt="eye" class="eyeImagePasswordLogin" onclick="showPassword()"/>
                            </div>
                            <div class="form-group form-check" id="inputsFormSign_LoginFormCheck">
                                <div class="inputsFormSign_LoginFormCheckbox">
                                    <div class="inputsFormSign_LoginFormCheckboxList">
                                        <%--<input type="checkbox" class="form-check-input" id="exampleCheck1">--%>
                                        <asp:CheckBox ID="checkRememberMe" ClientIDMode="Static" cssclass="form-check-input" runat="server" />
                                        <label class="form-check-label" id="inputsFormSign_LoginFormCheckboxRememberMe" for="checkRememberMe">Remember Me</label>
                                    </div>
                                    <div>
                                        <a href="forgotten_Password.aspx" class="inputsFormSign_LoginFormCheckForgotPassword"><p>Forgot Your Password ?</p></a>
                                    </div>
                                </div>
                            </div>
                            <div class="inputsFormSign_LoginFooter">
                                <%--<button type="submit" class="btn btn-info" id="inputsFormSign_LoginButton">Log In</button>--%>
                                <asp:Button ID="inputsFormSign_LoginButton" ClientIDMode="Static" class="btn btn-info" runat="server" Text="Log In" Onclick="inputsFormSign_LoginButton_Click"/>
                            </div>
                        </form>
                    </div>
                    <div class="dividerLogin">
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
                <%-- User Login Session End --%>






                <%-- Register Session --%>
                <div class="tab-pane fade" id="signup" role="tabpanel" aria-labelledby="signup-tab">
                    <div class="inputsFormSign_SignUp" id="inputsFormSign_SignUp">
                            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                                <div class="nav-pillsTabs">
                                    <li class="nav-item" role="presentation">
                                        <asp:HyperLink ID="recruiterTab" ClientIDMode="Static" CssClass="nav-link badge-info active_selected active" onclick="showRecruiter()" runat="server" data-toggle="pill" href="#recruiter" role="tab" aria-controls="recruiter" aria-selected="true" Text="Are You A Recruiter?"></asp:HyperLink>
<%--                                        <a class="nav-link badge-info active_selected active" onclick="showRecruiter()" id="recruiterTab" data-toggle="pill" href="#recruiter" role="tab" aria-controls="recruiter" aria-selected="true">Are You A Recruiter?</a>--%>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <a class="nav-link badge-info" onclick="showSeeker()" id="seekerTab" data-toggle="pill" href="#seeker" role="tab" aria-controls="seeker" aria-selected="false">Are You A Job Seeker?</a>
                                    </li>
                                </div>
                            </ul>


                        <div class="tab-content" id="pills-tabContent">

                            <%-- Recruiter Register Section Start --%>
                            <div class="tab-pane fade show active" id="recruiter" role="tabpanel" aria-labelledby="recruiterTab">
                                
                                    <div class="form-group">
                                        <asp:TextBox ID="sign_recruiter_companyName" runat="server" ClientIDMode="Static" cssclass="form-control" placeholder="Company Name" aria-describedby="recruiter_companyName"></asp:TextBox>
                                    </div>
                                    <div class=" form-group">
                                            <asp:TextBox ID="sign_recruiter_companyEmail" runat="server" ClientIDMode="Static" cssclass="form-control" placeholder="Company Email" TextMode="Email"></asp:TextBox>
                                    </div>
                                    <div class="row form-group-row">
                                        <div class="col">                                          
                                            <asp:TextBox ID="sign_recruiter_password" runat="server" ClientIDMode="Static" cssclass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                                            <img src="images/Signup_Login/eye.png" alt="eye" class="eyeImagePasswordSignUp" onclick="showPassword()"/>
                                            <asp:RequiredFieldValidator id="recruiterPasswordReq" runat ="server" ControlToValidate="sign_recruiter_password" ErrorMessage="Password is required!" SetFocusOnError="True" Display="Dynamic"/>
                                        </div>
                                        <div class="col">
                                            <asp:TextBox ID="sign_recruiter_confirmPassword" runat="server" ClientIDMode="Static" cssclass="form-control" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                                            <img src="images/Signup_Login/eye.png" alt="eye" class="eyeImagePasswordSignUp" onclick="showPassword()"/>
                                            <asp:RequiredFieldValidator id="recruiterConfirmPasswordReq" runat ="server" ControlToValidate="sign_recruiter_confirmPassword" ErrorMessage="Confirm Password is required!" SetFocusOnError="True" Display="Dynamic" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                            <asp:CompareValidator id="comparePasswords" runat="server" ControlToCompare="sign_recruiter_password" ControlToValidate="sign_recruiter_confirmPassword" ErrorMessage="Your passwords do not match up! Please Re-enter Again." Display="Dynamic" forecolor="Red"/>
                                    </div>
                                    <div class="inputsFormSign_LoginFooter">
                                         <asp:Button ID="Recruiter_SignUpButton" ClientIDMode="Static" cssclass="btn btn-info" runat="server" Text="Sign Up" OnClick="Recruiter_SignUpButton_Click"/>
                                      </div>
                               
                            </div><%-- Recruiter Register Section End --%>








                            <%-- Job Seeker Register Section Start --%>
                            <div class="tab-pane fade" id="seeker" role="tabpanel" aria-labelledby="seekerTab">
                                    <div class="row form-group-row">
                                        <div class="col">
                                            <asp:TextBox ID="sign_seeker_FullName" runat="server" ClientIDMode="Static" cssclass="form-control" placeholder="Full Name"></asp:TextBox>
                                        </div>
                                     </div>
                                    <div class="row form-group-row">
                                        <div class="col">
                                             <asp:TextBox ID="sign_seeker_username" runat="server" ClientIDMode="Static" cssclass="form-control" placeholder="Username"></asp:TextBox>                                           
                                        </div>
                                        <div class="col">
                                            <asp:TextBox ID="sign_seeker_email" runat="server" ClientIDMode="Static" cssclass="form-control" placeholder="Email" TextMode="Email"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row form-group-row">
                                        <div class="col">
                                            <asp:TextBox ID="sign_seeker_password" runat="server" ClientIDMode="Static" cssclass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator id="seekerPasswordReq" runat ="server" ControlToValidate="sign_seeker_password" ErrorMessage="Password is required!" SetFocusOnError="True" Display="Dynamic"/>
                                            <img src="images/Signup_Login/eye.png" alt="eye" class="eyeImagePasswordSignUp" onclick="showPassword()"/>
                                        </div>
                                        <div class="col">
                                            <asp:TextBox ID="sign_seeker_confirmPassword" runat="server" ClientIDMode="Static" cssclass="form-control" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator id="seekerConfirmPasswordReq" runat ="server" ControlToValidate="sign_seeker_password" ErrorMessage="Password is required!" SetFocusOnError="True" Display="Dynamic"/>
                                            <img src="images/Signup_Login/eye.png" alt="eye" class="eyeImagePasswordSignUp" onclick="showPassword()"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:CompareValidator id="compareSeekerPassword" runat="server" ControlToCompare="sign_seeker_password" ControlToValidate="sign_seeker_confirmPassword" ErrorMessage="Your passwords do not match up! Please Re-enter Again." Display="Dynamic" forecolor="Red"/>
                                    </div>
                                    <div class="inputsFormSign_LoginFooter">
                                        <asp:Button ID="JobSeeker_SignUpButton" runat="server" Text="Sign Up" ClientIDMode="Static" CssClass="btn btn-info" OnClick="JobSeeker_SignUpButton_Click"/>
                                    </div>
                            </div><%-- Job Seeker Register Section End --%>
                            
                        </div>
                    
                    </div>
                    <div class="dividerSignUp">
                        <div class="dividerSignUplines">
                            <p class="dividerSignUplinesContent">OR</p>
                        </div>
                    </div>
                
                    <div>
                        <%-- Gmail and Facebook Button Comes here --%>
                    </div>
                    <p class="inputsFormSign_LoginFree">
                        Already a Member ? 
                        <a class="LoginFree" id="login_tabatag" onclick="showLoginTab()" data-toggle="tab" href="#login" role="tab" aria-controls="login" aria-selected="true">Log In Now</a>
                    </p>
                </div>
                <%-- Register Session End --%>
            </div>
        </div>
    </div>


    <script>
        var signUpTab = document.getElementById("signup-tab");
        var loginTab = document.getElementById("login-tab");
        var recruiterTab = document.getElementById("recruiterTab");
        var seekerTab = document.getElementById("seekerTab");
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

        function showRecruiter() {

            $(recruiterTab).addClass("active_selected");
            $(seekerTab).removeClass("active_selected");

            $(recruiterTab).removeClass("active");
            $(seekerTab).removeClass("active");
        };

        function showSeeker() {

            $(seekerTab).addClass("active_selected");
            $(recruiterTab).removeClass("active_selected");

            $(seekerTab).removeClass("active");
            $(recruiterTab).removeClass("active");
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

        function showPassword() {
            var sign_seeker_password = document.getElementById("sign_seeker_password");
            var sign_seeker_confirmPassword = document.getElementById("sign_seeker_confirmPassword");
            var sign_recruiter_password = document.getElementById("sign_recruiter_password");
            var sign_recruiter_confirmPassword = document.getElementById("sign_recruiter_confirmPassword");
            var sign_login_password = document.getElementById("sign_login_password");

            if (sign_seeker_password.type === "password" || sign_seeker_confirmPassword.type === "password" ||
                sign_recruiter_password.type === "password" || sign_recruiter_confirmPassword.type === "password" || sign_login_password.type === "password" ) {
                sign_seeker_password.type = "text";
                sign_seeker_confirmPassword.type = "text";
                sign_recruiter_password.type = "text";
                sign_recruiter_confirmPassword.type = "text";
                sign_login_password.type = "text";
            } else {
                sign_seeker_password.type = "password";
                sign_seeker_confirmPassword.type = "password";
                sign_recruiter_password.type = "password";
                sign_recruiter_confirmPassword.type = "password";
                sign_login_password.type = "password";
            }
        }
    </script>
</asp:Content>
