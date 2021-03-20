using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace web_app_assignment
{
    public partial class blog : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            string blogDisplayLatest = "";
            string blogDisplayAdditional = "";
            string blogDisplayCareer = "";

            SqlConnection con = new SqlConnection(strcon);

            blogDisplayLatest += string.Format("<div class='blog-container'>" +
                                                 "<div class='blog-category latest-category'>" +
                                                  "<div class='row'>" +
                                                    "<div class='col-sm-12 col-lg-6'>" +
                                                        "<div class='left-latest'>" +
                                                           "<div class='left-thumbnail-container'>" +
                                                                "<img src='https://jobmajestic.com/blog/media/2021/03/Cover-Ultimate-Elevator-Pitch-CH-768x512.jpg' id='latest-thumbnail'/>" +
                                                            "</div>" +
                                                            
                                                            "<div class='left-latest-title mt-3'>" +
                                                                "<h2>毕业生自我推荐(Elevator Pitch)讲稿指南 (附上5个贴士)</h2>" +
                                                            "</div>" +

                                                            "<div class='left-latest-readmore text-lightgreen mt-3'>" +
                                                                "Read More >>" +
                                                            "</div>" +

                                                        "</div>" +
                                                    "</div>" +

                                                    "<div class='col-sm-12 col-lg-6'>" +
                                                        "<div class='right-latest'>" +
                                                            "<div class='right-latest-title'>" +
                                                                "<h3>Latest</h3>" +
                                                            "</div>" +

                                                            "<div class='right-latest-list'>" +
                                                                "<div class='latest-list-container'>" +
                                                                    "<div class='row latest-list-row'>" +
                                                                        "<div class='col-5 '>" +
                                                                            "<div class='list-thumbnail'>" +
                                                                                "<img src='https://jobmajestic.com/blog/media/2021/03/Cover-Ultimate-Elevator-Pitch-CH-768x512.jpg' class='list-thumbnail-pic'/>" +
                                                                            "</div>" +
                                                                        "</div>" +

                                                                        "<div class='col-7 '>" +
                                                                            "<div class='latest-list-title'>" +
                                                                                "<h5>The Ultimate Elevator Pitch for Fresh Graduates</h5>" +
                                                                            "</div>" +

                                                                            "<div class='latest-list-description'>" +
                                                                                "<h6 class='text-secondary'>What is an elevator pitch? Why is it important for</h6>" +
                                                                            "</div>" +
                                                                        "</div>" +
                                                                    "</div>" +
                                                                "</div>" +
                                                            "</div>" +
                                                       "</div>" +
                                                      "</div>" +
                                                     "</div>" +
                                                    "</div>");

            blogDisplayAdditional += string.Format("<div class='blog-category common-category'>" +
                                                        "<div class='common-cat-title mb-3 row'>" +
                                                            "<div class='col-6'>" +
                                                                "<h3>Additional</h3>" +
                                                            "</div>" +
                
                                                            "<div class='col-6'>" +
                                                                "<div class='explore-more-container text-right text-lightgreen'>" +
                                                                    "<a href='blog.aspx?additional=displayadditional'>Explore More ></a>" +                  
                                                                "</div>" +
                                                            "</div>" +
                                                        "</div>" +
                
                                                 "<div class='common-list-container'>" +
                                                    "<div class='swiper-box'>" +
                                                        "<!-- Swiper -->" +
                                                            "<div class='swiper-container sw'>" +
                                                                "<div class='swiper-wrapper'>" +
                                                                        "<div class='swiper-slide'>" +
                                                                            "<div class='card' style='width: 100%;'>" +
                                                                                "<img src='https://jobmajestic.com/blog/media/2020/09/Malaysian-Fresh-Graduates-Guide-To-Writing-An-Effective-Cover-Letter-Templates-8-Tips-768x512.jpg' class='card-img-top' alt='...'>" +
                                                                                "<div class='card-body text-center'>" +
                                                                                    "<p class='card-text font-weight-bold'>Malaysian Fresh Graduate’s Guide to Writing An Effective Cover Letter (Templates + 8 Tips)	</p>" +
                                                                                "</div>" +
                                                                               
                                                                                    "<div class='card-footer text-muted text-center'>" +
                                                                                        "17 March 2021" +
                                                                                    "</div>" +
                                                                            "</div>" +
                                                                        "</div>" +
                                                                "</div>" +
                                                            "</div>" +


                                                            "<!--Add Arrows-->" +
                                                             "<div class='swiper-nav-container'>" +
                                                                "<div class='swiper-button-next swiper-nav-next text-lightgreen'></div>" +
                                                                "<div class='swiper-button-prev swiper-nav-prev text-lightgreen'></div>" +
                                                             "</div>" +
                        
                                                    "</div>" +
                                                "</div>" +
                                             "</div>");

            blogDisplayCareer += string.Format("<div class='blog-category common-category'>" +
                                                    "<div class='common-cat-title mb-3 row'>" +
                                                        "<div class='col-6'>" +
                                                            "<h3>Career</h3>" +
                                                        "</div>" +

                                                        "<div class='col-6'>" +
                                                            "<div class='explore-more-container text-right text-lightgreen'>" +
                                                                "<a href='blog.aspx?career=displaycareer'>Explore More ></a>" +
                                                            "</div>" +
                                                        "</div>" +
                                                    "</div>" +

                                                    "<div class='common-list-container'>" +
                                                        "<div class='row'>" +
                                                            "<div class='col-sm-12 col-md-6 col-lg-4 mt-3'>" +
                                                                "<div class='card' style='width: 100%;'>" +
                                                                    "<img src='https://jobmajestic.com/blog/media/2021/02/3-Tips-for-Building-Employee-Engagement-Right-Now-Featured-Image-1-768x512.jpg' class='card-img-top' alt='...'>" +
                                                                    "<div class='card-body text-center'>" +
                                                                        "<p class='card-text font-weight-bold'>3 Tips for Building Employee Engagement Right Now.</p>" +
                                                                    "</div>" +

                                                                        "<div class='card-footer text-muted text-center'>" +
                                                                            "17 March 2021" +
                                                                        "</div>" +
                                                                "</div>" +
                                                            "</div>" +
                                                        "</div>" +
                                                    "</div>" +
                                               "</div>");

            litResultLatest.Text = blogDisplayLatest;
            litResultAdditional.Text = blogDisplayAdditional;
            litResultCareer.Text = blogDisplayCareer;

            var blog_additional = Request.QueryString["additional"];
            var blog_career = Request.QueryString["career"];
            string additionalOnly = "";
            string careerOnly = "";
            if(blog_additional != null)
            {
                additionalOnly += string.Format("<div class='blog-category common-category'>" +
                                                        "<div class='col-6'>" +
                                                            "<h3>Additional</h3>" +
                                                        "</div>" +

                                                    "<div class='common-list-container'>" +
                                                        "<div class='row'>" +
                                                            "<div class='col-sm-12 col-md-6 col-lg-4 mt-3'>" +
                                                                "<div class='card' style='width: 100%;'>" +
                                                                    "<img src='https://jobmajestic.com/blog/media/2021/02/3-Tips-for-Building-Employee-Engagement-Right-Now-Featured-Image-1-768x512.jpg' class='card-img-top' alt='...'>" +
                                                                    "<div class='card-body text-center'>" +
                                                                        "<p class='card-text font-weight-bold'>3 Tips for Building Employee Engagement Right Now.</p>" +
                                                                        "<p class='text-muted text-center'>12-3-2021</p>" +
                                                                    "</div>" +

                                                                        "<div class='card-footer text-muted text-center'>" +
                                                                            "<a href='' class='btn btn-info'>Details</a>" +
                                                                        "</div>" +
                                                                "</div>" +
                                                            "</div>" +
                                                        "</div>" +
                                                    "</div>" +
                                                "</div>" 


                                                );

                litResultAdditional.Text = additionalOnly;
                litResultCareer.Text = "";
                litResultLatest.Text = "";
            }
            else if(blog_career != null)
            {
                careerOnly += string.Format("<h1>Testing 123</h1>");

                litResultCareer.Text = careerOnly;
                litResultLatest.Text = "";
                litResultAdditional.Text = "";
            }
            else 
            {
                
            }
        }
    }
}