<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="contact-us.aspx.cs" Inherits="web_app_assignment.contact_us" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Contact Us</title>

    <link href="style/contact-us.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="background-section">
        <%-- Contact Us banner --%>
        <div class="background-banner-text">
            <h1>
                <asp:Label ID="lblContactUs1" runat="server" Text="Contact Us"></asp:Label></h1>
        </div>
    </div>
    <%-- Contact Us banner end--%>

    <div class="contact-info-container">
        <%-- Contact info --%>
        <div class="contact-info mt-5">
            <div class="row" id="contact-row">
                <div class=" col-sm-12 col-lg-4 mt-3 mb-3">
                    <div class="box">
                        <i class="fa fa-envelope fa-5x" aria-hidden="true"></i>
                        <p class="">webissue@gmail.com</p>
                    </div>
                </div>
                <div class=" col-sm-12 col-lg-4 mt-3 mb-3">
                    <div class="box">
                        <i class="fa fa-phone fa-5x" aria-hidden="true"></i>
                        <p class="">(+60) 1112345269</p>
                    </div>
                </div>
                <div class="col-sm-12 col-lg-4 mt-3 mb-3">
                    <div class="box">
                        <i class="fa fa-map fa-5x" aria-hidden="true"></i>
                        <p class="">6, Jalan 17/27, Desa Setapak, 53300, KL</p>
                    </div>

                </div>
            </div>

        </div>
    </div>
    <%-- Contact info End--%>

    <div class="contact-form-container">
        <%-- Contact form --%>
        <h1>
            <asp:Label ID="lblContactUs2" runat="server" Text="Contact Us"></asp:Label></h1>
        <h3>
            <asp:Label ID="lblWe" runat="server" Text="We'd love to hear from you."></asp:Label></h3>

        <div class="contact-form">

            <form class="form">

                <div class="form-row">

                    <div class="form-group col-md-6">
                        <asp:Label ID="lblName" runat="server" Text="Name"></asp:Label>
                        <asp:TextBox ID="txtName" ClientIDMode="Static" CssClass="form-control" BackColor="#7CAEA7" ForeColor="White" placeholder="Name" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqValName" runat="server" ErrorMessage="Name is required to fill in!" CssClass="text-danger" ControlToValidate="txtName" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regExValName" runat="server" ErrorMessage="Only alphabets are allowed" ControlToValidate="txtName" CssClass="text-danger" ValidationExpression="^[a-zA-Z ]+$" Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>

                    <div class="form-group col-md-6">
                        <asp:Label ID="lblContactNum" runat="server" Text="Contact Number"></asp:Label>
                        <asp:TextBox ID="txtContactNum" ClientIDMode="Static" CssClass="form-control" BackColor="#7CAEA7" ForeColor="White" placeholder="Contact Number" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqValContactNum" runat="server" ErrorMessage="Contact Number is required!" ControlToValidate="txtContactNum" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegExValContactNum" runat="server" ErrorMessage="Please Enter valid mobile number" ControlToValidate="txtContactNum" CssClass="text-danger" ValidationExpression="^\d+$" Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                        <asp:TextBox ID="txtEmail" ClientIDMode="Static" CssClass="form-control" BackColor="#7CAEA7" ForeColor="White" placeholder="Email" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqValEmail" runat="server" ErrorMessage="Email is required to fill in!" ControlToValidate="txtEmail" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegExValEmail" runat="server" ErrorMessage="Invalid Email!" ControlToValidate="txtEmail" CssClass="text-danger" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>
                    <div class="form-group col-md-6">
                        <asp:Label ID="lblSubject" runat="server" Text="Subject"></asp:Label>
                        <asp:TextBox ID="txtSubject" ClientIDMode="Static" CssClass="form-control" BackColor="#7CAEA7" ForeColor="White" placeholder="Subject" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqValSubject" runat="server" ErrorMessage="Subject is required!" ControlToValidate="txtSubject" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblMessage" runat="server" Text="Message"></asp:Label>
                    <asp:TextBox ID="txtMessage" ClientIDMode="Static" CssClass="form-control" placeholder="Message" TextMode="MultiLine" BackColor="#7CAEA7" Columns="50" Rows="8" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqValMessage" runat="server" ErrorMessage="Message is empty!" ControlToValidate="txtMessage" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <div class='text-center'>
                    <%-- <button class="btn btn-success">Submit</button> --%>
                    <asp:Button ID="btnSubmit" CssClass="btn bg-lightgreen w-100 text-white" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                    <asp:Label ID="lblError" runat="server" Text="" CssClass="text-danger"></asp:Label>
                </div>
            </form>

        </div>
    </div>
    <%-- Contact form End--%>

    <%-- Map --%>
    <div class="map">
        <iframe class="googlemap" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3983.423521451588!2d101.66955211460215!3d3.244386153464922!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31cc471a12f83961%3A0xab95303b22e6220b!2s23%2C%20Jalan%2012%2C%20Taman%20Selayang%2C%2068100%20Batu%20Caves%2C%20Selangor!5e0!3m2!1sen!2smy!4v1612074846297!5m2!1sen!2smy" width="1920" height="800" frameborder="0" style="border: 0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
    </div>
    <%-- Map End--%>
</asp:Content>
