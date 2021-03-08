<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="web_app_assignment.admin.signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Sign Up</title>
    <link href="css/login.css" rel="stylesheet" />
    <link href="css/default.css" rel="stylesheet" />
    <link href="../bootstrap-4.5.3-dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../bootstrap-4.5.3-dist/js/jquery-3.5.1.slim.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div id="login-background">
        </div>

        <div class="login-container">
            <div class="login-form">
                <div class="login-title text-center">
                    <img src="images/logo/logo.png" id="admin-login-logo"/>
                    <h1 class="mt-3 mb-3">Admin Sign Up</h1>
                </div>

                <div class="login-body">
                    <form>
                      <div class="form-group">        
                        <input type="email" class="form-control bg-login" placeholder="Email Address">
                      </div>

                      <div class="form-group">        
                        <input type="text" class="form-control bg-login" placeholder="Full Name">
                      </div>

                      <div class="form-group">           
                        <input type="password" class="form-control bg-login" placeholder="Password">
                      </div>

                      <div class="form-group">           
                        <input type="password" class="form-control bg-login" placeholder="Confirm Password">
                      </div>



                       <div class="text-center">
                           <button type="submit" class="btn btn-dark">Sign Up</button>
                       </div>
                      
                    </form>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
