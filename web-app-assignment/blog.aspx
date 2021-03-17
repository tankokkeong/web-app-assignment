<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="blog.aspx.cs" Inherits="web_app_assignment.blog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Blog</title>

    <%-- CSS --%>
    <link href="style/blog.css" rel="stylesheet" />

    <%-- OWL Carousel Plugins --%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" integrity="sha512-tS3S5qG0BlhnQROyJXvNjeEM4UpMXHrQfTGmbQ1gKmelCxlSEBUaxhRBj/EFTzpbP4RVSrpEikbmdJobCvhE3g==" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css" integrity="sha512-sMXtMNL1zRzolHYKEujM2AqCLUR9F2C4/05cdbxjjLSRvMQIciEPCQZo++nk7go3BtSuK9kfa/s+a4f4i5pLkw==" crossorigin="anonymous" />    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.js" integrity="sha512-gY25nC63ddE0LcLPhxUJGFxa2GoIyA5FLym4UJqHDEMHjp8RET6Zn/SHo1sltt3WuVtqfyxECP38/daUc/WVEA==" crossorigin="anonymous"></script>    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js" integrity="sha512-bPs7Ae6pVvhOSiIcyUClR7/q2OAsRiovw4vAkX+zJbw3ShAeeqezq50RIIcIURq7Oa20rW2n2q+fyXBNcU9lrw==" crossorigin="anonymous"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="blog-container">
        <div class="blog-category latest-category">
            <div class="row">
                <div class="col-sm-12 col-lg-6">
                    <div class="left-latest">
                        <div class="left-thumbnail-container">
                            <img src="https://jobmajestic.com/blog/media/2021/03/Cover-Ultimate-Elevator-Pitch-CH-768x512.jpg" id="latest-thumbnail"/>
                        </div>
                        
                        <div class="left-latest-title mt-3">
                            <h2>毕业生自我推荐(Elevator Pitch)讲稿指南 (附上5个贴士)</h2>
                        </div>

                        <div class="left-latest-readmore text-lightgreen mt-3">
                            Read More >>
                        </div>

                    </div>
                    
                </div>

                <div class="col-sm-12 col-lg-6">
                    <div class="right-latest">
                        <div class="right-latest-title">
                            <h3>Latest</h3>
                        </div>

                        <div class="right-latest-list">
                            <%for (int i = 0; i < 3; i++)
                                { %>
                            <div class="latest-list-container">
                                <div class="row latest-list-row">
                                    <div class="col-5 ">
                                        <div class="list-thumbnail">
                                             <img src="https://jobmajestic.com/blog/media/2021/03/Cover-Ultimate-Elevator-Pitch-CH-768x512.jpg" class="list-thumbnail-pic"/>
                                        </div>
                                    </div>

                                    <div class="col-7 ">
                                        <div class="latest-list-title">
                                            <h5>The Ultimate Elevator Pitch for Fresh Graduates	</h5>
                                        </div>

                                        <div class="latest-list-description">
                                            <h6 class="text-secondary">What is an elevator pitch? Why is it important for</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%}; %>

                        </div>

                    </div>

                </div>

            </div>

        </div>

        <div class="blog-category common-category">
            <div class="common-cat-title mb-3 row">
                <div class="col-6">
                    <h3>Interview</h3>
                </div>
                
                <div class="col-6">
                    <div class="explore-more-container text-right text-lightgreen">
                         <span>Explore More ></span>                   
                    </div>
                </div>
                
            </div>

            <div class="common-list-container">
                <div class="row">

                    <%for (int i = 0; i < 3; i++)
                        { %>
                    <div class="col-sm-12 col-md-6 col-lg-4 mt-3">
                        <div class="card" style="width: 100%;">
                          <img src="https://jobmajestic.com/blog/media/2020/09/Malaysian-Fresh-Graduates-Guide-To-Writing-An-Effective-Cover-Letter-Templates-8-Tips-768x512.jpg" class="card-img-top" alt="...">
                          <div class="card-body text-center">
                            <p class="card-text font-weight-bold">Malaysian Fresh Graduate’s Guide to Writing An Effective Cover Letter (Templates + 8 Tips)	</p>
                         </div>

                            <div class="card-footer text-muted text-center">
                                17 March 2021
                             </div>
                        </div>
                    </div>                    
                    <%}; %>

                </div>
            </div>

        </div>

        <div class="blog-category common-category">
            <div class="common-cat-title mb-3 row">
                <div class="col-6">
                    <h3>Career</h3>
                </div>
                
                <div class="col-6">
                    <div class="explore-more-container text-right text-lightgreen">
                         <span>Explore More ></span>                   
                    </div>
                </div>
                
            </div>

            <div class="common-list-container">
                <div class="row">

                    <%for (int i = 0; i < 3; i++)
                        { %>
                    <div class="col-sm-12 col-md-6 col-lg-4 mt-3">
                        <div class="card" style="width: 100%;">
                          <img src="https://jobmajestic.com/blog/media/2021/02/3-Tips-for-Building-Employee-Engagement-Right-Now-Featured-Image-1-768x512.jpg" class="card-img-top" alt="...">
                          <div class="card-body text-center">
                            <p class="card-text font-weight-bold">3 Tips for Building Employee Engagement Right Now.</p>
                         </div>

                            <div class="card-footer text-muted text-center">
                                17 March 2021
                             </div>
                        </div>
                    </div>                    
                    <%}; %>

                </div>
            </div>

        </div>

    </div>
</asp:Content>
