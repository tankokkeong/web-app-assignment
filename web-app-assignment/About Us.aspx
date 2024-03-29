﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="About Us.aspx.cs" Inherits="web_app_assignment.About_Us" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>About Us</title>
    <link href="style/about_us.css" rel="stylesheet" />

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class="background-section">
            <div class="background-banner-text">
               <h1>About Us</h1>
            </div>
        </div>

    <%-- About Us Container --%>
        <div class="about-us-container">
            <div class="about-us-title">
                <h2>Who We Are?</h2>
                <img src="images/About%20Us/business-3076392_1280.jpg" />
            </div>

            <div class="about-us-desc">
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Diam donec adipiscing tristique risus nec feugiat in fermentum posuere. In hac habitasse platea dictumst. Proin fermentum leo vel orci. Diam in arcu cursus euismod quis.
                </p>
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Diam donec adipiscing tristique risus nec feugiat in fermentum posuere. In hac habitasse platea dictumst. Proin fermentum leo vel orci. Diam in arcu cursus euismod quis.                </p>
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Diam donec adipiscing tristique risus nec feugiat in fermentum posuere. In hac habitasse platea dictumst. Proin fermentum leo vel orci. Diam in arcu cursus euismod quis.
                </p>
            </div>

            <%-- About box container --%>
            <div class="about-box-container">

                <div class="row">
                    <div class="col-sm-2 ">
                        <div class="about-us-container-image">
                            <img src="images/About%20Us/img1.jpg" id="img1"/>
                        </div>
                    </div>
                    <div class="col-sm-10">
                        <div class="about-us-container-text">
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Diam donec adipiscing tristique risus nec feugiat in fermentum posuere. In hac habitasse platea dictumst. Proin fermentum leo vel orci. Diam in arcu cursus euismod quis.</p>
                            <div class="cite">
                               <br /> - Turpis Dui
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-10">
                        <div class="about-us-container-text">
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Diam donec adipiscing tristique risus nec feugiat in fermentum posuere. In hac habitasse platea dictumst. Proin fermentum leo vel orci. Diam in arcu cursus euismod quis.</p>
                            <div class="cite">
                               <br /> - Dictum Non
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-2">
                        <div class="about-us-container-image">
                            <img src="images/About%20Us/img2.jpg" />
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-2 ">
                        <div class="about-us-container-image">
                            <img src="images/About%20Us/img3.jpg" />
                        </div>
                    </div>
                    <div class="col-sm-10">
                        <div class="about-us-container-text">
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Diam donec adipiscing tristique risus nec feugiat in fermentum posuere. In hac habitasse platea dictumst. Proin fermentum leo vel orci. Diam in arcu cursus euismod quis.</p>
                            
                            <div class="cite">
                            <br />    - Mauris Sed
                            </div>
                        </div>
                    </div>
                </div>


            </div>

            <%-- Mission Container --%>
            <div class="mission-container">
                <div class="mission-title">
                    <h1>Mission</h1>
                </div>
                <div class="mission-desc">
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Diam donec adipiscing tristique risus nec feugiat in fermentum posuere. In hac habitasse platea dictumst. Proin fermentum leo vel orci. Diam in arcu cursus euismod quis.
                    </p>
                </div>
            </div>

            <%-- Vision Container --%>
            <div class="vision-container">
                <div class="vision-title">
                    <h1>Vision</h1>
                </div>
                <div class="vision-desc">
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Diam donec adipiscing tristique risus nec feugiat in fermentum posuere. In hac habitasse platea dictumst. Proin fermentum leo vel orci. Diam in arcu cursus euismod quis.</p>
                </div>
            </div>
         </div>
    <style>

    </style>
</asp:Content>
