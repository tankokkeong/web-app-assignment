<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="login_signup.aspx.cs" Inherits="web_app_assignment.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Login / Sign Up</title>

    <%-- Stylesheet --%>
    <link href="style/login_signup.css" rel="stylesheet" type="text/css"/>   
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="Login_Body">
        
    <div class="row login_signupBody">
        <div class="col-sm-6 login_signUpBackgroundImage">
            <img src="images/Signup_Login/works-1.png" class="login_signUpBackgroundImagePics" alt="background"/>
        </div>
        <div class="col-sm-6 pr-4 pl-4 Login_signUpForms">
            <ul class="nav nav-pills nav-fill" id="myTab" role="tablist">
                <li class="nav-item" role="presentation">
                    <a class="nav-link badge-info active_selected active" onclick="showTabContentsLogin('Login')" id="login-tab" data-toggle="tab" href="#login" role="tab" aria-controls="login" aria-selected="true">Login</a>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="nav-link badge-info" onclick="showTabContentsSignUp('signup')" id="signup-tab" data-toggle="tab" href="#signup" role="tab" aria-controls="signup" aria-selected="false">Sign Up</a>
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
                                    <asp:DropDownList ID="Role" ClientIDMode="Static" runat="server" CssClass="form-control bg-info text-white" onchange="ddlRoles()">
                                        <asp:ListItem Selected="True" Value="0"> Select Your Role </asp:ListItem>
                                        <asp:ListItem Value="job_seeker"> Job Seeker </asp:ListItem>
                                        <asp:ListItem Value="recruiter"> Recruiter </asp:ListItem>
                                    </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="sign_login_emailUser" ClientIDMode="Static" runat="server" CssClass="form-control" TextMode="Email" aria-describedby="emailHelp" Placeholder="Email"></asp:TextBox>
                                <asp:RequiredFieldValidator id="login_emailReq" runat ="server" ControlToValidate="sign_login_emailUser" validationgroup="login" ErrorMessage="Email is required!" CssClass="text-danger font-weight-bold" SetFocusOnError="True" Display="Dynamic"/>
                                <asp:RegularExpressionValidator ID="revLogin_email" runat="server" ValidationExpression="[a-zA-Z0-9.-_]{1,}@[a-zA-Z.-]{2,}[.]{1}[a-zA-Z]{2,}" ErrorMessage="Example : example@example.com" ControlToValidate="sign_login_emailUser" CssClass="text-danger font-weight-bold" SetFocusOnError="True" Display="Dynamic"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group">
                                <div class="see-password-container">
                                    <asp:TextBox ID="sign_login_password" ClientIDMode="Static" runat="server" CssClass="form-control" TextMode="password" Placeholder="Password"></asp:TextBox>
                                    <img src="images/Signup_Login/eye.png" alt="eye" class="LogineyeImagePasswordLogin" onclick="showPassword()"/>
                                </div>
                                
                                <asp:RequiredFieldValidator id="login_passwordReq" runat ="server" ControlToValidate="sign_login_password" validationgroup="login" ErrorMessage="Password is required!" CssClass="text-danger font-weight-bold" SetFocusOnError="True" Display="Dynamic"/>
                            </div>
                            <div class="form-group form-check" id="inputsFormSign_LoginFormCheck">
                                <div class="inputsFormSign_LoginFormCheckbox">
                                    <div class="inputsFormSign_LoginFormCheckboxList">
                                        <asp:CheckBox ID="checkRememberMe" ClientIDMode="Static" cssclass="form-check-input" runat="server" />
                                        <label class="form-check-label" id="inputsFormSign_LoginFormCheckboxRememberMe" for="checkRememberMe">Remember Me</label>
                                    </div>
                                    <div>
                                        <a href="forgotten_Password.aspx" class="inputsFormSign_LoginFormCheckForgotPassword"><p>Forgot Your Password ?</p></a>
                                    </div>
                                </div>
                            </div>
                            <div class="inputsFormSign_LoginFooter">
                                <asp:Button ID="inputsFormSign_LoginButton" ClientIDMode="Static" class="btn btn-info" runat="server" Text="Log In" validationgroup="login" Onclick="inputsFormSign_LoginButton_Click"/>
                            </div>
                        </form>
                    </div>
                    <div class="dividerLogin">
                        <div class="dividerSignUplines">
                            <p class="dividerSignUplinesContent">OR</p>
                        </div>

                        <div class="form-group dividerLoginGoogle">
                            <%-- Gmail and Facebook Button Comes here --%>
                            <button type="button" id="btnSignIn" runat="server" class="btn bg-white googleSignIn" onserverclick="btngoogleSignin_Click"><img src="images/login_signup/imageedit_1_6756801447.png" style="height:25px; width:25px;"/>&nbsp &nbsp Sign in With Google</button>                     
                            
                        </div>

                        <div class="fb-button-login mt-2">
                                <%--<div class="fb-login-button" scope="public_profile , email" onlogin="checkLoginState();" data-width="1000" data-size="large" data-button-type="login_with" data-layout="default" data-auto-logout-link="false" data-use-continue-as="false"></div>--%>
                            <button type="button" onclick="facebookLogin();" class="btn fb-login-btn text-light">Login with Facebook <i class="fab fa-facebook-square"></i></button>
                        </div>


                       
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
                                        <asp:HyperLink ID="recruiterTab" ClientIDMode="Static" CssClass="nav-link badge-info active_selected active" onclick="showRecruiter('Recruiter')" runat="server" data-toggle="pill" href="#recruiter" role="tab" aria-controls="recruiter" aria-selected="true" Text="Are You A Recruiter?"></asp:HyperLink>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <a class="nav-link badge-info" onclick="showSeeker('Seeker')" id="seekerTab" data-toggle="pill" href="#seeker" role="tab" aria-controls="seeker" aria-selected="false">Are You A Job Seeker?</a>
                                    </li>
                                </div>
                            </ul>


                        <div class="tab-content" id="pills-tabContent">

                            <%-- Recruiter Register Section Start --%>
                            <div class="tab-pane fade show active" id="recruiter" role="tabpanel" aria-labelledby="recruiterTab">
                                
                                    <div class="form-group">
                                        <asp:TextBox ID="sign_recruiter_companyName" runat="server" ClientIDMode="Static" cssclass="form-control" placeholder="Company Name"></asp:TextBox>
                                        <asp:RequiredFieldValidator id="recruiterCompanyReq" runat ="server" ControlToValidate="sign_recruiter_companyName" validationgroup="recruiter" ErrorMessage="Company Name is required!" CssClass="text-danger font-weight-bold" SetFocusOnError="True" Display="Dynamic"/>
                                        <asp:RegularExpressionValidator ID="revrecruiterCompany" runat="server" ValidationExpression="^[A-Za-z0-9 ]+$" ErrorMessage="Symbol is not allowed" ControlToValidate="sign_recruiter_companyName" ForeColor="Red" SetFocusOnError="True" Display="Dynamic"></asp:RegularExpressionValidator>                                                                                                                                                           
                                    </div>
                                    <div class=" form-group">
                                            <asp:TextBox ID="sign_recruiter_companyEmail" runat="server" ClientIDMode="Static" cssclass="form-control" placeholder="Company Email" TextMode="Email"></asp:TextBox>
                                            <asp:RequiredFieldValidator id="recruiterCompEmailReq" runat ="server" ControlToValidate="sign_recruiter_companyEmail" ErrorMessage="Company Email is required!" CssClass="text-danger font-weight-bold" validationgroup="recruiter" SetFocusOnError="True" Display="Dynamic"/>
                                            <asp:RegularExpressionValidator ID="revRecruiterCompEmail" runat="server" ValidationExpression="[a-zA-Z0-9.-_]{1,}@[a-zA-Z.-]{2,}[.]{1}[a-zA-Z]{2,}" ErrorMessage="Example : example@example.com" ControlToValidate="sign_recruiter_companyEmail" CssClass="text-danger font-weight-bold" SetFocusOnError="True" Display="Dynamic"></asp:RegularExpressionValidator>                                        
                                    </div>
                                    <div class="row form-group-row">
                                        <div class="col">       
                                            <div class="see-password-container">
                                                <asp:TextBox ID="sign_recruiter_password" runat="server" ClientIDMode="Static" cssclass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                                                <img src="images/Signup_Login/eye.png" alt="eye" class="eyeImagePasswordSignUp" onclick="showPassword()"/>
                                            </div>
                                            
                                            <asp:RequiredFieldValidator id="recruiterPasswordReq" runat ="server" ControlToValidate="sign_recruiter_password" ErrorMessage="Password is required!"  validationgroup="recruiter" SetFocusOnError="True" Display="Dynamic" CssClass="text-danger font-weight-bold"/>
                                            <asp:RegularExpressionValidator ID="revRecruiterPassword" runat="server" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&_-])[A-Za-z\d$@$!%*#?&_-]{8,}$" ErrorMessage="Minimum 8 characters at least 1 Alphabet, 1 Number and 1 Special Character" ControlToValidate="sign_recruiter_password" CssClass="text-danger font-weight-bold" SetFocusOnError="True" Display="Dynamic"></asp:RegularExpressionValidator>                                                                                    
                                        </div>
                                        <div class="col">
                                            <div class="see-password-container">
                                                <asp:TextBox ID="sign_recruiter_confirmPassword" runat="server" ClientIDMode="Static" cssclass="form-control" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                                                <img src="images/Signup_Login/eye.png" alt="eye" class="eyeImagePasswordSignUp" onclick="showPassword()"/>
                                            </div>
                                            
                                            <asp:RequiredFieldValidator id="recruiterConfirmPasswordReq" runat ="server" ControlToValidate="sign_recruiter_confirmPassword" ErrorMessage="Confirm Password is required!" CssClass="text-danger font-weight-bold" validationgroup="recruiter" SetFocusOnError="True" Display="Dynamic" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                            <asp:CompareValidator id="comparePasswords" runat="server" ControlToCompare="sign_recruiter_password" ControlToValidate="sign_recruiter_confirmPassword" ErrorMessage="Your passwords do not match up! Please Re-enter Again." Display="Dynamic" CssClass="text-danger font-weight-bold" ValidationGroup="recruiter"/>
                                    </div>
                                    <div class="inputsFormSign_LoginFooter">
                                         <asp:Button ID="Recruiter_SignUpButton" ClientIDMode="Static" cssclass="btn btn-info" runat="server" Text="Sign Up" ValidationGroup="recruiter" OnClick="Recruiter_SignUpButton_Click"/>
                                    </div>
                            
                    <div class="dividerSignUp">
                        <div class="dividerSignUplines">
                            <p class="dividerSignUplinesContent">OR</p>
                        </div>
                        <div>
                            <button type="button" id="googleRecruiter" runat="server" class="btn bg-white googleSignIn-r" onserverclick="googleRecruiter_Click"><img src="images/login_signup/imageedit_1_6756801447.png" style="height:25px; width:25px;"/></i>&nbsp &nbsp Sign in With Google</button>       
                        </div>
                        <div class="fb-button-r mt-3">
                            <%--<div class="fb-login-button" scope="public_profile , email" onlogin="checkLoginState();" data-width="1000" data-size="large" data-button-type="login_with" data-layout="default" data-auto-logout-link="false" data-use-continue-as="false"></div>--%>
                            <button type="button" onclick="facebookLogin();" class="btn fb-login-btn text-light">Sign up with Facebook <i class="fab fa-facebook-square"></i></button>
                        </div>
                    </div>  
                            </div><%-- Recruiter Register Section End --%>








                            <%-- Job Seeker Register Section Start --%>
                            <div class="tab-pane fade" id="seeker" role="tabpanel" aria-labelledby="seekerTab">
                                    <div class="row form-group-row">
                                        <div class="col">
                                            <asp:TextBox ID="sign_seeker_FullName" runat="server" ClientIDMode="Static" cssclass="form-control" placeholder="Full Name"></asp:TextBox>
                                            <asp:RequiredFieldValidator id="seekerFullNameReq" runat ="server" ControlToValidate="sign_seeker_FullName" validationgroup="seeker" ErrorMessage="Full Name is required!" CssClass="text-danger font-weight-bold" SetFocusOnError="True" Display="Dynamic"/>
                                            <asp:RegularExpressionValidator ID="revSeekerFullName" runat="server" ValidationExpression="^[a-zA-Z ]*$" ErrorMessage="Symbol and number is not allowed" ControlToValidate="sign_seeker_FullName" CssClass="text-danger font-weight-bold" SetFocusOnError="True" Display="Dynamic"></asp:RegularExpressionValidator>                                                                                                                        
                                        </div>
                                     </div>
                                    <div class="row form-group-row">
                                        <div class="col">
                                            <asp:TextBox ID="sign_seeker_email" runat="server" ClientIDMode="Static" cssclass="form-control" placeholder="Email" TextMode="Email"></asp:TextBox>
                                            <asp:RequiredFieldValidator id="seekerEmailReq" runat ="server" ControlToValidate="sign_seeker_email" validationgroup="seeker" ErrorMessage="Email is required!" CssClass="text-danger font-weight-bold" SetFocusOnError="True" Display="Dynamic" />
                                            <asp:RegularExpressionValidator ID="revSeekerEmail" runat="server" ValidationExpression="[a-zA-Z0-9.-_]{1,}@[a-zA-Z.-]{2,}[.]{1}[a-zA-Z]{2,}" ErrorMessage="Example : example@example.com" ControlToValidate="sign_seeker_email" CssClass="text-danger font-weight-bold" SetFocusOnError="True" Display="Dynamic"></asp:RegularExpressionValidator>                                                                                
                                        </div>
                                    </div>
                                    <div class="row form-group-row">
                                        <div class="col">
                                            <div class="see-password-container">
                                                 <asp:TextBox ID="sign_seeker_password" runat="server" ClientIDMode="Static" cssclass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                                                <img src="images/Signup_Login/eye.png" alt="eye" class="eyeImagePasswordSignUp" onclick="showPassword()"/>
                                            </div>
                                           
                                            <asp:RequiredFieldValidator id="seekerPasswordReq" runat ="server" ControlToValidate="sign_seeker_password" validationgroup="seeker" ErrorMessage="Password is required!" CssClass="text-danger font-weight-bold" SetFocusOnError="True" Display="Dynamic"/>
                                            <asp:RegularExpressionValidator ID="revseekerPassword" runat="server" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&_-])[A-Za-z\d$@$!%*#?&_-]{8,}$" ErrorMessage="Minimum 8 characters at least 1 Alphabet, 1 Number and 1 Special Character" ControlToValidate="sign_seeker_password" CssClass="text-danger font-weight-bold" SetFocusOnError="True" Display="Dynamic"></asp:RegularExpressionValidator>                                                                                    
                                        </div>
                                        <div class="col">
                                            <div class="see-password-container">
                                                <asp:TextBox ID="sign_seeker_confirmPassword" runat="server" ClientIDMode="Static" cssclass="form-control" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                                                <img src="images/Signup_Login/eye.png" alt="eye" class="eyeImagePasswordSignUp" onclick="showPassword()"/>
                                            </div>
                                            
                                            <asp:RequiredFieldValidator id="seekerConfirmPasswordReq" runat ="server" ControlToValidate="sign_seeker_confirmPassword" validationgroup="seeker" ErrorMessage="Password is required!" CssClass="text-danger font-weight-bold" SetFocusOnError="True" Display="Dynamic"/>
                                            
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:CompareValidator id="compareSeekerPassword" runat="server" ControlToCompare="sign_seeker_password" ControlToValidate="sign_seeker_confirmPassword" validationgroup="seeker" ErrorMessage="Your passwords do not match up! Please Re-enter Again." CssClass="text-danger font-weight-bold" Display="Dynamic"/>
                                    </div>
                                    <div class="inputsFormSign_LoginFooter">
                                        <asp:Button ID="JobSeeker_SignUpButton" runat="server" Text="Sign Up" ClientIDMode="Static" CssClass="btn btn-info" OnClick="JobSeeker_SignUpButton_Click" validationgroup="seeker"/>
                                    </div>
                            
                    <div class="dividerSignUp">
                        <div class="dividerSignUplines">
                            <p class="dividerSignUplinesContent">OR</p>
                        </div>

                        <div>
                          <button type="button" id="googleSeeker" runat="server" class="btn bg-white googleSignIn-js" onserverclick="googleSeeker_Click"><img src="images/login_signup/imageedit_1_6756801447.png" style="height:25px; width:25px;"/></i>&nbsp &nbsp Sign in With Google</button>                           
                        </div>

                        <div class="fb-button-js mt-3">
                            <%--<div class="fb-login-button" scope="public_profile , email" onlogin="checkLoginState();" data-width="1000" data-size="large" data-button-type="login_with" data-layout="default" data-auto-logout-link="false" data-use-continue-as="false"></div>--%>
                            <button type="button" onclick="facebookLogin();" class="btn fb-login-btn text-light">Sign up with Facebook <i class="fab fa-facebook-square"></i></button>                        
                        </div>                        
                    </div>  


                            </div><%-- Job Seeker Register Section End --%>
                        </div>
                    
                    </div>
                
                    
                    
                    <p class="inputsFormSign_LoginFree">
                        Already a Member ? 
                        <a class="LoginFree" id="login_tabatag" onclick="showLoginTab()" data-toggle="tab" href="#login" role="tab" aria-controls="login" aria-selected="true">Log In Now</a>
                    </p>
                </div>
                <%-- Register Session End --%>
            </div>
        </div>
        <input type="hidden" id="JobRole" value="Recruiter"/>
        <input type="hidden" id="LoginSignUp" value="Login"/>
    </div>
    </div>

<!-- Load the JS SDK asynchronously -->
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v10.0&appId=866342063923372&autoLogAppEvents=1" nonce="8b6StL5d"></script>

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

        function showRecruiter(Recruiter) {

            $(recruiterTab).addClass("active_selected");
            $(seekerTab).removeClass("active_selected");

            $(recruiterTab).removeClass("active");
            $(seekerTab).removeClass("active");

            document.getElementById("JobRole").value = Recruiter;
            console.log(document.getElementById("JobRole").value);
        };

        function showSeeker(Seeker) {

            $(seekerTab).addClass("active_selected");
            $(recruiterTab).removeClass("active_selected");

            $(seekerTab).removeClass("active");
            $(recruiterTab).removeClass("active");

            document.getElementById("JobRole").value = Seeker;
            console.log(document.getElementById("JobRole").value);
        };

        function showTabContentsLogin(Login) {
            $(signUpTab).removeClass("active_selected");
            $(loginTab).addClass("active_selected");

            $(loginTab).removeClass("active");
            $(signUpTab).addClass("active");

            document.getElementById("LoginSignUp").value = Login;
            console.log(document.getElementById("LoginSignUp").value);
        }

        function showTabContentsSignUp(signup) {
            $(signUpTab).addClass("active_selected");
            $(loginTab).removeClass("active_selected");

            $(loginTab).addClass("active");
            $(signUpTab).removeClass("active");

            document.getElementById("LoginSignUp").value = signup;
            console.log(document.getElementById("LoginSignUp").value);
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

        function ddlRoles() {
            var loginRole = document.getElementById("Role").value;
            console.log(loginRole);
        }

    </script>

    <script>
        function facebookLogin() {
            var roleLogin = document.getElementById("Role").value;
            var method = document.getElementById("LoginSignUp").value;

            if (method == "Login" && roleLogin == "0") {
                alert("Please Select your login role first!");
            }
            else {
                FB.login(function (response) {
                    //if (response.authResponse) {
                    //    console.log('Welcome!  Fetching your information.... ');
                    //    FB.api('/me', function (response) {
                    //        console.log('Successful login for: ' + response.name + ' and' + response.id + ' and ' + response.email);

                    //        var method = document.getElementById("LoginSignUp").value;

                    //        if (method == "Login") {
                    //            loginUserData(response);
                    //        } else if (method == "signup") {
                    //            saveUserData(response);
                    //        }
                    //    });
                    //} else {
                    //    console.log('User cancelled login or did not fully authorize.');
                    //}
                    testAPI();
                })
            }
            
        }
        

        function statusChangeCallback(response) {  // Called with the results from FB.getLoginStatus().
            console.log('statusChangeCallback');
            console.log(response);                   // The current login status of the person.
            if (response.status === 'connected') {   // Logged into your webpage and Facebook.
                FB.logout(function (response) {
                    console.log(response)
                });
            } else {                                 // Not logged into your webpage or we are unable to tell.
                console.log('Please log into the webpage');
            }
        }


        function checkLoginState() {               // Called when a person is finished with the Login Button.
            FB.getLoginStatus(function (response) {   // See the onlogin handler
                statusChangeCallback(response);
            });
        }


        window.fbAsyncInit = function () {
            FB.init({
                appId: '866342063923372',
                cookie: true,                     // Enable cookies to allow the server to access the session.
                xfbml: true,                     // Parse social plugins on this webpage.
                version: 'v10.0'           // Use this Graph API version for this call.
            });


            FB.getLoginStatus(function (response) {   // Called after the JS SDK has been initialized.
                statusChangeCallback(response);        // Returns the login status.
            });
        };

        function testAPI() {                      // Testing Graph API after login.  See statusChangeCallback() for when this call is made.
            console.log('Welcome!  Fetching your information.... ');
            FB.api('/me?fields=name,id,email', function (response) {
                console.log('Successful login for: ' + response.name + ' and' + response.id + ' and 123 ' + response.email);

                var method = document.getElementById("LoginSignUp").value;

                if (method == "Login") {
                    loginUserData(response);
                } else if (method == "signup") {
                    saveUserData(response);
                }
                
                
            });
        }

        //Get User Data and send to the server for data insertion
        function saveUserData(response) {

            //Declare Variable
            var role = document.getElementById("JobRole").value;

            //Post data to client-server
            if (role == "Recruiter") {
                $.post("fb-signup-post-r.aspx",
                    {
                        fb_name: response.name,
                        fb_id: response.id,
                        fb_email: response.email,
                    },
                    function () {
                        alert("Hi " + response.email);
                        window.location.href = "home.aspx";
                    });
            }
            else if (role == "Seeker") {
                $.post("fb-signup-post-js.aspx",
                    {
                        fb_name: response.name,
                        fb_id: response.id,
                        fb_email: response.email,
                    },
                    function () { 
                        alert("Hi " + response.name);
                        window.location.href = "home.aspx";
                        
                });
            }
        }

        //Post for login purpose
        function loginUserData(response) {

            var roleLogin = document.getElementById("Role").value;

            if (roleLogin == "recruiter") {
                $.post("fb-login-post.aspx",
                    {
                        fb_name: response.name,
                        fb_id: response.id,
                        fb_email: response.email,
                    },
                    function (data, status) {
                        console.log()
                        if (data.substring(0, 16) === "Login Successful") {
                            window.location.href = "home.aspx";
                        }
                        else {
                            alert("Please sign up with facebook first");
                        }
                    });
            } else if (roleLogin == "job_seeker") {
                $.post("fb-login-post-js.aspx",
                    {
                        fb_name: response.name,
                        fb_id: response.id,
                        fb_email: response.email,
                    },
                    function (data, status) {
                        console.log(data)
                        if (data.substring(0, 16) === "Login Successful") {
                            window.location.href = "home.aspx";
                        }
                        else {
                            alert("Please sign up with facebook first");
                        }
                    });
            }

        }

        
    </script>
</asp:Content>
