<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="About_Us.aspx.cs" Inherits="web_app_assignment.About_Us" %>

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
            <h1>
                <asp:Label ID="lblAboutUs" runat="server" Text="About Us"></asp:Label></h1>
        </div>
    </div>

    <%-- About Us Container --%>
    <div class="about-us-container">
        <div class="about-us-title">
            <h2>
                <asp:Label ID="lblWhoWeAre" runat="server" Text="Who We Are?"></asp:Label></h2>
            <img src="images/About%20Us/business-3076392_1280.jpg" />
        </div>

        <div class="about-us-desc">
            <p>
                <asp:Label ID="lblDesc1" runat="server" Text="Founded in Malaysia in 2020, Jobs4U now has a team of 800 talented individuals, giving us a strong local presence in every country in which we operate."></asp:Label>
            </p>
            <p>
                <asp:Label ID="lblDesc2" runat="server" Text="With our understanding and insights on each market, as well our passion for technology, we provide jobseekers the best opportunities and deliver exceptional value to employers."></asp:Label>
            </p>
            <p>
                <asp:Label ID="lblDesc3" runat="server" Text="We are committed to continuously improving the value we provide to jobseekers and employers. To deliver on this, we continue to evolve our product and service offerings to better facilitate the matching of jobseekers to employers."></asp:Label>
            </p>
        </div>

        <%-- About box container --%>
        <div class="about-box-container">

            <div class="row">
                <div class="col-sm-2 ">
                    <div class="about-us-container-image">
                        <img src="images/About%20Us/img1.jpg" id="img1" />
                    </div>
                </div>
                <div class="col-sm-10">
                    <div class="about-us-container-text">
                        <p>
                            <asp:Label ID="lblPpl1" runat="server" Text="I build great teams and then try to point everyone in the right direction."></asp:Label>
                        </p>
                        <div class="cite">
                            <br />
                            - Turpis Dui
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-10">
                    <div class="about-us-container-text">
                        <p>
                            <asp:Label ID="lblPpl2" runat="server" Text="The fact that you’re reading this means we did something right. Awesome branding and content brought to you via social media, ads, emails and events, powered by memes and coffee."></asp:Label>
                        </p>
                        <div class="cite">
                            <br />
                            - Dictum Non
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
                        <p>
                            <asp:Label ID="lblPpl3" runat="server" Text="We are the secret sauce - a branding content studio consisting of a team of talented creative individuals. We specialize in attracting talented young jobseekers through hassle free content creation and creative solutions. To put it simply, we make things helpful & pretty!"></asp:Label>
                        </p>
                        <div class="cite">
                            <br />
                            - Mauris Sed
                        </div>
                    </div>
                </div>
            </div>


        </div>

        <%-- Mission Container --%>
        <div class="mission-container">
            <div class="mission-title">
                <h1>
                    <asp:Label ID="lblMission" runat="server" Text="Mission"></asp:Label></h1>
            </div>
            <div class="mission-desc">
                <p>
                    <asp:Label ID="lblMissionDesc" runat="server" Text="Helps people discover any job with any employer in the market."></asp:Label>
                </p>
            </div>
        </div>

        <%-- Vision Container --%>
        <div class="vision-container">
            <div class="vision-title">
                <h1>
                    <asp:Label ID="lblVision1" runat="server" Text="Vision"></asp:Label></h1>
            </div>
            <div class="vision-desc">
                <p>
                    <asp:Label ID="lblVisionDesc" runat="server" Text="To connect businesses with talent and improve lives through better careers."></asp:Label>
                </p>
            </div>
        </div>
    </div>
    <style>
    </style>
</asp:Content>
