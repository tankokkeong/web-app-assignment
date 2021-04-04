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
                    <p class="mt-3 mb-3">Please enter full name and set password for your admin account.</p>
                </div>

                <div class="login-body">
                    <form>
                        <div class="form-group">  
                          <asp:TextBox ID="admin_Name" cssclass="form-control bg-login" ClientIDMode="Static" runat="server" Placeholder="Full Name"></asp:TextBox>
                          <asp:RequiredFieldValidator id="admin_NameReq" runat ="server" ControlToValidate="admin_Name" validationgroup="admin_signup" ErrorMessage="Full Name is required!" ForeColor="Red" SetFocusOnError="True" Display="Dynamic"/>
                          <asp:RegularExpressionValidator ID="revAdminFullName" runat="server" ValidationExpression="^[a-zA-Z ]+$" ErrorMessage="Symbol and number is not allowed" ControlToValidate="admin_Name" validationgroup="admin_signup" ForeColor="Red" SetFocusOnError="True" Display="Dynamic"></asp:RegularExpressionValidator>                                                                                                                        
         
                        </div>
                      <div class="form-group">  
                          <asp:TextBox ID="admin_newPassword" cssclass="form-control bg-login" ClientIDMode="Static" runat="server" TextMode="Password" Placeholder="Password"></asp:TextBox>
                          <asp:RequiredFieldValidator id="admin_newPasswordReq" runat ="server" ControlToValidate="admin_newPassword" validationgroup="admin_signup" ErrorMessage="Password is required!" ForeColor="Red" SetFocusOnError="True" Display="Dynamic"/>
                          <asp:RegularExpressionValidator ID="revafminPassword" runat="server" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$" ErrorMessage="Minimum eight characters, at least one uppercase letter, one lowercase letter and one number" ControlToValidate="admin_newPassword" validationgroup="admin_signup" ForeColor="Red" SetFocusOnError="True" Display="Dynamic"></asp:RegularExpressionValidator>                                                                                         
                      </div>

                      <div class="form-group">    
                          <asp:TextBox ID="admin_confirmPassword" cssclass="form-control bg-login" ClientIDMode="Static" runat="server" TextMode="Password" Placeholder=" Confirm Password"></asp:TextBox>
                          <asp:RequiredFieldValidator id="admin_confirmPasswordReq" runat ="server" ControlToValidate="admin_confirmPassword" validationgroup="admin_signup" ErrorMessage="Confrim Password is required!" ForeColor="Red" SetFocusOnError="True" Display="Dynamic"/>
                      </div>
                      <div class="form-group">
                           <asp:CompareValidator id="comparePasswords" runat="server" ControlToCompare="admin_newPassword" ControlToValidate="admin_confirmPassword" ErrorMessage="Your passwords do not match up! Please Re-enter Again." Display="Dynamic" forecolor="Red"  validationgroup="admin_signup"/>
                        </div>
                       <div class="text-center">
                           <asp:Button ID="btnSignUp" runat="server" Text="Sign Up" cssclass="btn btn-dark" OnClick="btnSignUp_Click" ValidationGroup="admin_signup"/>                          
                       </div>
                      
                    </form>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
