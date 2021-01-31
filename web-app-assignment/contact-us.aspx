<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="contact-us.aspx.cs" Inherits="web_app_assignment.contact_us" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Contact Us</title>
    
    <link href="style/contact-us.css" rel="stylesheet" />

       <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="background-section">
        <div class="background-banner-text">
            <h1>Contact Us</h1>
        </div>
    </div>

     <div class="contact-info">
        <div class="card">
            <i class="icon fas fa-envelope"></i>
            <div class="card-content">
                <h3>Email</h3>
                <span>webissue@gmail.com</span>
            </div>
        </div>

        <div class="card">
            <i class="icon fas fa-phone"></i>
            <div class="card-content">
                <h3>Phone Number</h3>
                <span>(+60) 1123457485</span>
            </div>
        </div>

        <div class="card">
            <i class="icon fas fa-map-marker-alt"></i>
            <div class="card-content">
                <h3>Location</h3>
                <span>No.23 Jalan 12, Selaynag Baru, 68100 Batu Caves, Selangor</span>
            </div>
        </div>
    </div>
    
    <div class="contact-form-container">
        <h1>Contact Us</h1>
        <h3>We'd like to hear from you.</h3>
    <div class="contact-form">
    <form class="form">
      <div class="form-row">
        <div class="form-group col-md-6">
          <input type="text" class="form-control" id="name" placeholder="Name">
        </div>
        <div class="form-group col-md-6">
          <input type="text" class="form-control" id="contact-number" placeholder="Contact Number">
        </div>
      </div>
        <div class="form-row">
        <div class="form-group col-md-6">
          <input type="text" class="form-control" id="email" placeholder="E-mail">
        </div>
        <div class="form-group col-md-6">
          <input type="text" class="form-control" id="subject" placeholder="Subject">
        </div>
      </div>
      <div class="form-group">
        <textarea class="form-control" rows="8" id="message" placeholder="Message"></textarea>
      </div>
        <div class='text-center'>
            <button class="btn btn-success">Submit</button>
        </div>
    </form>

        </div>
</div>


    <div class="map">     
        <iframe class="googlemap" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3983.423521451588!2d101.66955211460215!3d3.244386153464922!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31cc471a12f83961%3A0xab95303b22e6220b!2s23%2C%20Jalan%2012%2C%20Taman%20Selayang%2C%2068100%20Batu%20Caves%2C%20Selangor!5e0!3m2!1sen!2smy!4v1612074846297!5m2!1sen!2smy" width="1920" height="800" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
    </div>

</asp:Content>
