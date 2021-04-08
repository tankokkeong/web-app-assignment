<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="web_app_assignment.admin.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login</title>
    <link href="css/login.css" rel="stylesheet" />
    <link href="css/default.css" rel="stylesheet" />
    <link href="../bootstrap-4.5.3-dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../bootstrap-4.5.3-dist/js/jquery-3.5.1.slim.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="login-background">
        </div>

        <div class="login-container">
            <div class="login-form">
                <div class="login-title text-center">
                    <img src="images/logo/logo.png" id="admin-login-logo"/>
                    <h1 class="mt-3 mb-3">Admin Login</h1>
                </div>

                <div class="login-body">
                    <form>
                      <div class="form-group">
                          <asp:TextBox ID="txtEmail" runat="server" cssclass="form-control bg-login" placeholder="Email Address"></asp:TextBox>
                           <asp:RequiredFieldValidator id="adminlogin_emailReq" runat ="server" ControlToValidate="txtEmail" validationgroup="admin_login" ErrorMessage="Email is required!" ForeColor="Red" SetFocusOnError="True" Display="Dynamic"/>
                      </div>

                      <div class="form-group">
                          <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" cssclass="form-control bg-login" placeholder="Password"></asp:TextBox>           
                           <asp:RequiredFieldValidator id="adminLogin_PasswordReq" runat ="server" ControlToValidate="txtPassword" validationgroup="admin_login" ErrorMessage="Passoword is required!" ForeColor="Red" SetFocusOnError="True" Display="Dynamic"/>                       
                      </div>

                       <div class="text-center">
                           <asp:Button ID="btnLogin" runat="server" Text="Login" cssclass="btn btn-dark" validationgroup="admin_login" OnClick="btnLogin_Click"/>
                       </div>
                       <div class="text-align">

                       </div>
                    </form>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
