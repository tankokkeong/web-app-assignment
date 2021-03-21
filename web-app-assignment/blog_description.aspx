<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="blog_description.aspx.cs" Inherits="web_app_assignment.blog_description" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Blog Description</title>
    <link href="style/blog_description.css" rel="stylesheet" type="text/css"/>

    <%-- Swiper Slides Plugins --%>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css" />
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />

    <script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="blogDescription">
         
        <div class="blogDescriptionHeader">
            <h2>The Ultimate Elevator Pitch For Fresh Graduates</h2>
        </div>
         <div class="blogDescriptionBody"> 
         
            <h3>You Might Also Like</h3>

            <div class="common-list-container">
                <div class="swiper-box">
                    <!-- Swiper -->
                      <div class="swiper-container sw">
                        <div class="swiper-wrapper">
                            <asp:Literal ID="litResultLike" runat="server"></asp:Literal>
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
