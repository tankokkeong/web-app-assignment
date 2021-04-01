<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="blog.aspx.cs" Inherits="web_app_assignment.blog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Blog</title>

    <%-- CSS --%>
    <link href="style/blog.css" rel="stylesheet" />

    <%-- Swiper Slides Plugins --%>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css" />
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />

    <script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="blog-container">
         <div class="col-6">
             <a href="blog-explore.aspx?category=2" class="btn bg-lightgreen">Explore More</a>
         </div>
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

                        <a href="blog_description.aspx" class="left-latest-readmore text-lightgreen mt-3">
                            Read More >>
                        </a>

                    </div>
                    
                </div>

                <div class="col-sm-12 col-lg-6">
                    <div class="right-latest">
                        <div class="right-latest-title">
                            <h3>Latest</h3>
                        </div>
                    
                        <div class="right-latest-list">
                            <asp:Literal ID="litResultLatest" runat="server"></asp:Literal>
                           <%-- 
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
                          --%>
                        </div>
                    
                    </div>
                
                </div>

            </div>

        </div>
     </div>
        
    <div class="blog-category common-category">
            <div class="common-cat-title mb-3 row">
                <div class="col-6">
                    <h3>Additional</h3>
                </div>
                
                <div class="col-6">
                    <div class="explore-more-container text-right text-lightgreen">
                         <a href="blog-explore.aspx?additional=display">Explore More ></a>                   
                    </div>
                </div>
                
            </div>
         
            <div class="common-list-container">
                <div class="swiper-box">
                    <!-- Swiper -->
                      <div class="swiper-container sw">
                        <div class="swiper-wrapper">
                            <asp:Literal ID="litResultAdditional" runat="server"></asp:Literal>
                            <%-- 
                              <%for (int i = 0; i < 9; i++)
                                { %>
                                <div class="swiper-slide">
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
                            --%>
                        </div>                        
                      </div>
                    
                      <!-- Add Arrows -->
                       <div class="swiper-nav-container">
                           <div class="swiper-button-next swiper-nav-next text-lightgreen"></div>
                            <div class="swiper-button-prev swiper-nav-prev text-lightgreen"></div>
                       </div>
                        
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
                         <a href="blog-explore.aspx?career=display">Explore More ></a>                   
                    </div>
                </div>
                
            </div>
        
            <div class="common-list-container">
                <div class="row">
                    <asp:Literal ID="litResultCareer" runat="server"></asp:Literal>
                    <%--
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
                    --%>
                </div>
            </div>
        </div>

     <!-- Initialize Swiper -->
      <script>
          $(document).ready(function () {
              if ($(window).width() < 800) {

                  var swiper = new Swiper('.sw', {
                      autoHeight: true, //enable auto height
                      slidesPerView: 2,
                      spaceBetween: 30,
                      pagination: {
                          el: '.swiper-pagination',
                          clickable: true,
                      },
                      navigation: {
                          nextEl: '.swiper-button-next',
                          prevEl: '.swiper-button-prev',
                      },
                  });

              }
              else {
                  var swiper = new Swiper('.sw', {
                      autoHeight: true, //enable auto height
                      slidesPerView: 3,
                      spaceBetween: 30,
                      pagination: {
                          el: '.swiper-pagination',
                          clickable: true,
                      },
                      navigation: {
                          nextEl: '.swiper-button-next',
                          prevEl: '.swiper-button-prev',
                      },
                  });

              }

              $(window).resize(function () {
                  if ($(window).width() < 800) {
                      var swiper = new Swiper('.sw', {
                          autoHeight: true, //enable auto height
                          slidesPerView: 2,
                          spaceBetween: 30,
                          pagination: {
                              el: '.swiper-pagination',
                              clickable: true,
                          },
                          navigation: {
                              nextEl: '.swiper-button-next',
                              prevEl: '.swiper-button-prev',
                          },
                      });

                  }
                  else {
                      var swiper = new Swiper('.sw', {
                          autoHeight: true, //enable auto height
                          slidesPerView: 3,
                          spaceBetween: 30,
                          pagination: {
                              el: '.swiper-pagination',
                              clickable: true,
                          },
                          navigation: {
                              nextEl: '.swiper-button-next',
                              prevEl: '.swiper-button-prev',
                          },
                      });

                  }
              });

          });

          
      </script>
</asp:Content>
