<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Career.aspx.cs" Inherits="web_app_assignment.Career" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Career</title>

    <%-- Stylesheet --%>
    <link href="style/career.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css" />
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css"/>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="background-section">
        <div class="background-banner-text">
           <h1>Career Center</h1>
        </div>
    </div>

    <div class="our-team">
        <div class="our-team-header-container">
            <h2 class="text-lightgreen text-center">Our Team</h2>

            <div class="team-slider">
                <div class="team-intro">
                    <div class="team-img">
                        <img src="images/career/images.png" />
                    </div>
                    <p class="role-desc">Lorem ipsum dolor sit amet consectetur adipisicing elit. Est quaerat tempora, voluptatum quas facere dolorum aut cumque nihil nulla harum nemo distinctio quam blanditiis dignissimos.</p>
                    <h3>John Doe</h3>
                    <p class="role">CO-Founder</p>
                </div>
                <div class="team-intro">
                    <div class="team-img">
                        <img src="images/career/images.png" />
                    </div>
                    <p class="role-desc">Lorem ipsum dolor sit amet consectetur adipisicing elit. Est quaerat tempora, voluptatum quas facere dolorum aut cumque nihil nulla harum nemo distinctio quam blanditiis dignissimos.</p>
                    <h3>John Doe</h3>
                    <p class="role">CO-Founder</p>
                </div>
                <div class="team-intro">
                    <div class="team-img">
                        <img src="images/career/images.png" />
                    </div>
                    <p class="role-desc">Lorem ipsum dolor sit amet consectetur adipisicing elit. Est quaerat tempora, voluptatum quas facere dolorum aut cumque nihil nulla harum nemo distinctio quam blanditiis dignissimos.</p>
                    <h3>John Doe</h3>
                    <p class="role">CO-Founder</p>
                </div>
                 <div class="team-intro">
                    <div class="team-img">
                        <img src="images/career/images.png" />
                    </div>
                    <p class="role-desc">Lorem ipsum dolor sit amet consectetur adipisicing elit. Est quaerat tempora, voluptatum quas facere dolorum aut cumque nihil nulla harum nemo distinctio quam blanditiis dignissimos.</p>
                    <h3>John Doe</h3>
                    <p class="role">CO-Founder</p>
                </div>
                <div class="team-intro">
                    <div class="team-img">
                        <img src="images/career/images.png" />
                    </div>
                    <p class="role-desc">Lorem ipsum dolor sit amet consectetur adipisicing elit. Est quaerat tempora, voluptatum quas facere dolorum aut cumque nihil nulla harum nemo distinctio quam blanditiis dignissimos.</p>
                    <h3>John Doe</h3>
                    <p class="role">CO-Founder</p>
                </div>
                <div class="team-intro">
                    <div class="team-img">
                        <img src="images/career/images.png" />
                    </div>
                    <p class="role-desc">Lorem ipsum dolor sit amet consectetur adipisicing elit. Est quaerat tempora, voluptatum quas facere dolorum aut cumque nihil nulla harum nemo distinctio quam blanditiis dignissimos.</p>
                    <h3>John Doe</h3>
                    <p class="role">CO-Founder</p>
                </div>
            </div>
        </div>
    </div>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
    <script>
        /*$('.team-slider').slick({
            slidesToShow: 5,
            slidesToScroll: 1,
            dots: true,
            arrows: true,
            autoplay: true,
            autoplaySpeed: 2000,
            infinite:true
        });*/
    </script>
</asp:Content>
