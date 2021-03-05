<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Reset_Password.aspx.cs" Inherits="web_app_assignment.Reset_Password" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Reset Password</title>
    <link href="style/Reset_Password.css" rel="stylesheet" type="text/css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="forgotPasswordBody">
        <div class="forgotPasswordBodyImage">
            <img src="images/Signup_Login/works-1.png" class="forgotPasswordBodyImagePic" alt="background"/>
        </div>
        <div class="forgotPasswordBodyContents">
            <div class="forgotPasswordBodyContentsForm">
                <div class="sign_loginLogo">
                    <img class="sign_loginLogoImage" src="images/logo/logo.png" alt="logo"/>
                </div>
                <h2 class="forgotPasswordBodyContentsFormHeader">
                    Reset password
                </h2>
                <p class="forgotPasswordBodyContentsFormPara">Please enter and confirm your new password below to access your account</p>
                <form>
                    <div class="form-group">
                         <asp:TextBox ID="new_password" ClientIDMode="Static" runat="server" CssClass="form-control" TextMode="password" Placeholder="New Password"></asp:TextBox>
                    </div>
                    <div class="form-group">
                         <asp:TextBox ID="confirm_password" ClientIDMode="Static" runat="server" CssClass="form-control" TextMode="password" Placeholder="Confirm Password"></asp:TextBox>
                    </div>
                    <div class="forgotPasswordFormEmailButton">
                        <asp:Button ID="forgotPasswordFormEmailButtonSubmit" ClientIDMode="Static" cssclass="btn btn-info" runat="server" Text="Reset Password" />
                    </div>
                </form>
            </div>
        </div>
    </div>
</asp:Content>
