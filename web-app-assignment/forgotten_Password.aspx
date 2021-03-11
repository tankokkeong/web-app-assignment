﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="forgotten_Password.aspx.cs" Inherits="web_app_assignment.Forgotten_Password" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Forgotten Password</title>

    <%-- Stylesheet --%>
    <link href="style/forgottenPassword.css" rel="stylesheet" type="text/css"/>
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
                    Forgot Password?
                </h2>
                <p class="forgotPasswordBodyContentsFormPara">Enter your login email to reset your password</p>
                <form>
                   <div class="form-group">
                         <asp:DropDownList ID="Role" runat="server" CssClass="form-control bg-info text-white">
                             <asp:ListItem Selected="True" Value="0"> Select Your Role </asp:ListItem>
                             <asp:ListItem Value="job_seeker"> Job Seeker </asp:ListItem>
                             <asp:ListItem Value="recruiter"> Recruiter </asp:ListItem>
                         </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <%--<input type="email" class="form-control" id="forgotPasswordFormEmail" aria-describedby="emailHelp" placeholder="Email">--%>
                        <asp:TextBox ID="forgotPasswordFormEmail" ClientIDMode="Static" cssclass="form-control" runat="server" placeholder="Email"></asp:TextBox>
                         <asp:RequiredFieldValidator id="forgotPwReq" runat ="server" ControlToValidate="forgotPasswordFormEmail" validationgroup="reset_password" ErrorMessage="Password is required!" ForeColor="Red" SetFocusOnError="True" Display="Dynamic"/>
                    </div>
                    <div class="forgotPasswordFormEmailButton">
                        <%--<button type="submit" class="btn btn-info" id="forgotPasswordFormEmailButtonSubmit">Send Reset Password Email</button>--%>
                        <asp:Button ID="forgotPasswordFormEmailButtonSubmit" ClientIDMode="Static" cssclass="btn btn-info" runat="server" Text="Send Reset Password Email" OnClick="forgotPasswordFormEmailButtonSubmit_Click"/>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblresult" runat="server"></asp:Label>
                    </div>
                </form>
            </div>
        </div>
    </div>
</asp:Content>
