<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Career.aspx.cs" Inherits="web_app_assignment.Career" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Career</title>
    <link href="style/career.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.theme.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


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
        <div class="our-team-header-container">
            <h2>
                <asp:Label ID="lblOurTeam" runat="server" class="text-lightgreen text-center" Text="Our Team"></asp:Label></h2>
        </div>

        <div class="container">
            <div class="row">
                <div id="testimonial-slider" class="owl-carousel">
                    <div class="testimonial">
                        <span class="carousel-control-next-icon fa fa-quote-left"></span>
                        <p>
                            <asp:Label ID="lblLorem1" runat="server" class="description" Text="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam justo neque, aliquet sit amet elementum vel, vehicula eget eros. Vivamus arcu metus, mattis sed sagittis at, sagittis quis neque. Praesent.Vivamus arcu metus, mattis sed sagittis at, sagittis quis neque. Praesent."></asp:Label>
                        </p>
                        <div class="testimonial-content">
                            <div class="pic">
                                <img src="images/career/3.jpg" />
                            </div>
                            <h3 class="title">Jenny Hing</h3>
                            <span class="post">Founder</span>
                        </div>
                    </div>
                    <div class="testimonial">
                        <span class="carousel-control-next-icon fa fa-quote-left"></span>
                        <p>
                            <asp:Label ID="lblLorem2" runat="server" class="description" Text="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam justo neque, aliquet sit amet elementum vel, vehicula eget eros. Vivamus arcu metus, mattis sed sagittis at, sagittis quis neque. Praesent.Vivamus arcu metus, mattis sed sagittis at, sagittis quis neque. Praesent."></asp:Label>
                        </p>
                        <div class="testimonial-content">
                            <div class="pic">
                                <img src="images/career/3.jpg" />
                            </div>
                            <h3 class="title">Jenny Hing</h3>
                            <span class="post">Founder</span>
                        </div>
                    </div>
                    <div class="testimonial">
                        <span class="carousel-control-next-icon fa fa-quote-left"></span>
                        <p>
                            <asp:Label ID="lblLorem3" runat="server" class="description" Text="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam justo neque, aliquet sit amet elementum vel, vehicula eget eros. Vivamus arcu metus, mattis sed sagittis at, sagittis quis neque. Praesent.Vivamus arcu metus, mattis sed sagittis at, sagittis quis neque. Praesent."></asp:Label>
                        </p>
                        <div class="testimonial-content">
                            <div class="pic">
                                <img src="images/career/3.jpg" />
                            </div>
                            <h3 class="title">Jenny Hing</h3>
                            <span class="post">Founder</span>
                        </div>
                    </div>
                    <div class="testimonial">
                        <span class="carousel-control-next-icon fa fa-quote-left"></span>
                        <p>
                            <asp:Label ID="lblLorem4" runat="server" class="description" Text="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam justo neque, aliquet sit amet elementum vel, vehicula eget eros. Vivamus arcu metus, mattis sed sagittis at, sagittis quis neque. Praesent.Vivamus arcu metus, mattis sed sagittis at, sagittis quis neque. Praesent."></asp:Label>
                        </p>
                        <div class="testimonial-content">
                            <div class="pic">
                                <img src="images/career/3.jpg" />
                            </div>
                            <h3 class="title">Jenny Hing</h3>
                            <span class="post">Founder</span>
                        </div>
                    </div>
                    <div class="testimonial">
                        <span class="carousel-control-next-icon fa fa-quote-left"></span>
                        <p>
                            <asp:Label ID="lblLorem5" runat="server" class="description" Text="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam justo neque, aliquet sit amet elementum vel, vehicula eget eros. Vivamus arcu metus, mattis sed sagittis at, sagittis quis neque. Praesent.Vivamus arcu metus, mattis sed sagittis at, sagittis quis neque. Praesent."></asp:Label>
                        </p>
                        <div class="testimonial-content">
                            <div class="pic">
                                <img src="images/career/3.jpg" />
                            </div>
                            <h3 class="title">Jenny Hing</h3>
                            <span class="post">Founder</span>
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
                        <h2><asp:Label ID="lblApplication" runat="server" Text="Application Form"></asp:Label></h2>
                        <p><asp:Label ID="lblFill" runat="server" Text="Fill out the below for job opportunies"></asp:Label></p>
                        <div class="row">
                            <div class="col-lg-6">
                                <asp:Label ID="lblFullName" runat="server" Text="Full Name"></asp:Label>
                                <input type="text" name="fullname" class="form-control" id="fullname" required />
                            </div>

                            <div class="col-lg-6">
                                <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                                <input type="text" name="email" class="form-control" id="email" required />
                            </div>
                        </div>

                        <asp:Label ID="lblWhat" runat="server" Text="What Position are you looking for"></asp:Label>
                        <input type="text" name="position" class="form-control" id="position" required />

                        <asp:Label ID="lblSpecific" runat="server" Text="Specific Your current employment status"></asp:Label>
                        <div class="radio-container">
                            <input type="radio" id="employed" name="status" value="Employed" required />
                            <label for="Employed">Employed</label>
                            <input type="radio" id="unemployed" name="unemployed" value="Umemployed" required />
                            <label for="Umemployed">Umemployed</label>
                            <input type="radio" id="self" name="self" value="Self-Employmeny" required />
                            <label for="Self-Employmeny">Self-Employmeny</label>
                            <input type="radio" id="stud" name="stud" value="Student" required />
                            <label for="Student">Student</label>
                        </div>
                        <asp:Label ID="lblUpload" runat="server" Text="Upload Your Resume"></asp:Label><br />
                        <input type="file" id="file" hidden="hidden" />
                        <button type="button" id="upload">CHOOSE A FILE</button>
                        <span id="upload-text">No file chosen, yet.</span>

                        <input type="submit" name="submit" id="submit" value="Submit" class="btn btn-success btn-block btn-lg" />
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
    <script>
        const realFileBtn = document.getElementById("file");
        const customBtn = document.getElementById("upload");
        const customTxt = document.getElementById("upload-text");

        customBtn.addEventListener("click", function () {
            realFileBtn.click();
        });

        realFileBtn.addEventListener("change", function () {
            if (realFileBtn.value) {
                customTxt.innerHTML = realFileBtn.value.match(
                    /[\/\\]([\w\d\s\.\-\(\)]+)$/
                )[1];
            } else {
                customTxt.innerHTML = "No file chosen, yet.";
            }
        });

    </script>

</asp:Content>
