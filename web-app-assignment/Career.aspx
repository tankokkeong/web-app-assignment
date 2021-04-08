<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Career.aspx.cs" Inherits="web_app_assignment.Career" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Career</title>
    <link href="style/career.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.theme.min.css">


    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="background-section">
        <div class="background-banner-text">
            <h1>
                <asp:Label ID="lblCareerCenter" runat="server" Text="Career Center"></asp:Label>
            </h1>
        </div>
    </div>

    <div class="our-team">
        <div class="our-team-header-container text-center">
            <h2>
                <asp:Label ID="lblOurTeam" runat="server" class="text-lightgreen" Text="Our Team"></asp:Label></h2>
        </div>

        <div class="container">
            <div class="row">
                <div id="testimonial-slider" class="owl-carousel">
                    <div class="testimonial">
                        <span class="carousel-control-next-icon fa fa-quote-left"></span>
                        <p>
                            <asp:Label ID="lblDesc1" runat="server" class="description" Text="I build great teams and then try to point everyone in the right direction."></asp:Label>
                        </p>
                        <div class="testimonial-content">
                            <div class="pic">
                                <img src="images/career/bee-choo.PNG" />
                            </div>
                            <h3 class="title">Kenny Tan</h3>
                            <span class="post"><asp:Label ID="lblPpl1" runat="server" class="text-lightgreen text-center" Text="Founder"></asp:Label></span>
                        </div>
                    </div>
                    <div class="testimonial">
                        <span class="carousel-control-next-icon fa fa-quote-left"></span>
                        <p>
                            <asp:Label ID="lblDesc2" runat="server" class="description" Text="The fact that you’re reading this means we did something right. Awesome branding and content brought to you via social media, ads, emails and events, powered by memes and coffee."></asp:Label>
                        </p>
                        <div class="testimonial-content">
                            <div class="pic">
                                <img src="images/career/honsiong.jpg" />
                            </div>
                            <h3 class="title">Hon Siong</h3>
                            <span class="post"><asp:Label ID="lblPpl2" runat="server" class="text-lightgreen text-center" Text="Marketing Teams"></asp:Label></span>
                        </div>
                    </div>
                    <div class="testimonial">
                        <span class="carousel-control-next-icon fa fa-quote-left"></span>
                        <p>
                            <asp:Label ID="lblDesc3" runat="server" class="description" Text="We are the secret sauce - a branding content studio consisting of a team of talented creative individuals. We specialize in attracting talented young jobseekers through hassle free content creation and creative solutions. To put it simply, we make things helpful & pretty!"></asp:Label>
                        </p>
                        <div class="testimonial-content">
                            <div class="pic">
                                <video src="images/career/suk%20chuang.mp4" loop style="width:100%; max-height:100px; max-width:100px;" autoplay muted/>
                            </div>
                            <h3 class="title">Suk Chuang</h3>
                            <span class="post"><asp:Label ID="lblPpl3" runat="server" class="text-lightgreen text-center" Text="Creative Teams"></asp:Label></span>
                        </div>
                    </div>
                    <div class="testimonial">
                        <span class="carousel-control-next-icon fa fa-quote-left"></span>
                        <p>
                            <asp:Label ID="lblDesc4" runat="server" class="description" Text="If a picture is worth a thousand words, employer branding will leave your competitors speechless and job seekers amazed. With experienced consultants at the ready, don’t leave things to chance. Reach out to us and get started!"></asp:Label>
                        </p>
                        <div class="testimonial-content">
                            <div class="pic">
                                <img src="images/career/festus.png" style="width:100px; height:100px; max-height:100px; max-width:100px;"/>
                            </div>
                            <h3 class="title">Festus Chen</h3>
                            <span class="post"><asp:Label ID="lblPpl4" runat="server" class="text-lightgreen text-center" Text="Sales Teams"></asp:Label></span>
                        </div>
                    </div>
                    <div class="testimonial">
                        <span class="carousel-control-next-icon fa fa-quote-left"></span>
                        <p>
                            <asp:Label ID="lblDesc5" runat="server" class="description" Text="A group of passionate and people-oriented headhunters who desire to help employers find quality talents, not only based on their working experiences and education level, but also emphasize on culture and attitude."></asp:Label>
                        </p>
                        <div class="testimonial-content">
                            <div class="pic">
                                <img src="images/career/anson.jpg" style="width:100%; max-height:100px; max-width:100px;"/>
                            </div>
                            <h3 class="title">Anson Ho</h3>
                            <span class="post"><asp:Label ID="lblPpl5" runat="server" class="text-lightgreen text-center" Text="Recruitment Teams"></asp:Label></span>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <div class="application-container">

        <div class="row">

            <div class="col-lg-3"></div>

            <div class="col-lg-6">
                <div class="ui">
                    <form class="form-group">
                        <h2><asp:Label ID="lblApplication" runat="server" CssClass="text-light" Text="Application Form"></asp:Label></h2>
                        <p><asp:Label ID="lblFill" runat="server" Text="Fill out the below for job opportunies"></asp:Label></p>
                        <div class="row">
                            <div class="col-lg-6">
                                <asp:Label ID="lblFullName" runat="server" CssClass="text-light" Text="Full Name"></asp:Label>
                                <%--<input type="text" name="fullname" class="form-control" id="fullname" required />--%>
                                <asp:TextBox ID="txtFullName" ClientIDMode="Static" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Full Name is required!" ControlToValidate="txtFullName" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>

                            <div class="col-lg-6">
                                <asp:Label ID="lblEmail" runat="server" CssClass="text-light" Text="Email"></asp:Label>
                                <asp:TextBox ID="txtEmail" ClientIDMode="Static" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Emaail is required!" ControlToValidate="txtEmail" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid email format!" ControlToValidate="txtEmail" CssClass="text-danger" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
                            </div>
                        </div>

                        <div>
                            <asp:Label ID="lblWhat" runat="server" CssClass="text-light" Text="What Position are you looking for"></asp:Label>
                            <asp:TextBox ID="txtPosition" ClientIDMode="Static" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Position is required!" ControlToValidate="txtPosition" CssClass="text-danger"></asp:RequiredFieldValidator>
                        </div>


                        <div>
                            <asp:Label ID="lblSpecific" runat="server" CssClass="text-light" Text="Specific Your current employment status"></asp:Label>
                            <div class="radio-container">
                                <asp:RadioButtonList ID="employmentStatus" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                    <asp:ListItem Value="Employed">&nbsp Employed &nbsp</asp:ListItem>
                                    <asp:ListItem Value="Unemployed">&nbsp Unemployed &nbsp</asp:ListItem>
                                    <asp:ListItem Value="Self-Employment">&nbsp Self-Employment &nbsp</asp:ListItem>
                                    <asp:ListItem Value="Student">&nbsp Student &nbsp</asp:ListItem>
                                </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Status is required!" ControlToValidate="employmentStatus" CssClass="text-danger"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div>
                            <asp:Label ID="lblUpload" runat="server" CssClass="text-light" Text="Upload Your Resume"></asp:Label><br />
                            <asp:FileUpload ID="fileResume" runat="server" CssClass="bg-light mt-1 mb-2"/>
                            <asp:TextBox ID="txtResumeFile" runat="server" style="display:none;"/>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Resume is required!" ControlToValidate="fileResume" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="only .pdf are allowed!" ControlToValidate="fileResume" CssClass="text-danger" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.pdf)$" Display="Dynamic"></asp:RegularExpressionValidator>     
                        </div>

                      
                        <asp:Button ID="btnSubmit" ClientIDMode="Static" runat="server" CssClass="btn btn-success btn-block btn-lg" Text="Submit" OnClick="btnSubmit_Click"/>
                    </form>
                </div>
            </div>
            <div class="col-lg-3"></div>
        </div>
    </div>

    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.min.js"></script>

    <script>
        $(document).ready(function () {
            $("#testimonial-slider").owlCarousel({
                items: 3,
                itemsDesktop: [1000, 3],
                itemsDesktopSmall: [979, 2],
                itemsTablet: [768, 2],
                itemsMobile: [650, 1],
                pagination: true,
                autoPlay: true
            });
        });
    </script>

</asp:Content>
